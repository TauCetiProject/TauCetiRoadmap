# Roadmap: partial differential equations

**Summary.** Build the theory of second-order elliptic and parabolic partial differential
equations on top of Mathlib's analysis stack and the Sobolev, energy-form and potential-theory
material already in Tau Ceti: weak-derivative Sobolev spaces on domains with their density,
embedding, trace, extension and compactness package; the harmonic-analysis estimates
(maximal function, interpolation, Calderón–Zygmund, BMO and VMO); maximum principles, the Hopf
lemma, the Aleksandrov–Bakelman–Pucci estimate and potential theory; the energy method for the
Dirichlet problem with its Fredholm theory and spectrum; the two elliptic regularity tracks
(divergence-form weak solutions and non-divergence-form strong solutions); parabolic and
evolution equations with the classical whole-space Schauder theory; and the extension layers on
dyadic analysis, Strichartz estimates and quasilinear existence. The stochastic programme
built on these is PDE, Part II. The end
theorems for a bounded open `Ω ⊆ ℝⁿ` and a uniformly elliptic divergence-form operator
`L u = −∂ⱼ(aⁱʲ ∂ᵢ u) + bⁱ ∂ᵢ u + c u` with bounded measurable, not necessarily symmetric `a` are
the three pillars of the Dirichlet problem `L u = f` in `Ω`, `u = g` on `∂Ω`: solvability
(coercive existence, and at resonance the Fredholm compatibility condition against the weak
adjoint kernel), regularity (De Giorgi–Nash–Moser Hölder continuity for the homogeneous
equation, the `Hᵏ` bootstrap, `W^{1,p}` and `C^{1,β}` estimates in divergence form,
Krylov–Safonov, `C^{2,α}` and `W^{2,p}` estimates in non-divergence form), and the maximum,
Hopf and Harnack principles with their exact hypotheses. The roadmap is this README;
`Suggested.lean` states the headline theorems whose carriers exist at the pins.

## Scope and ownership

This roadmap owns, on Euclidean open sets: the weak-derivative Sobolev spaces `W^{k,p}(Ω)` and
`W^{k,p}_0(Ω)` beyond what the pinned Tau Ceti carries (higher-order density on arbitrary open
sets, the `p = ∞` closure and trace distinctions, the Bessel-potential agreement, the critical
and endpoint embeddings); the Lipschitz-domain predicate, the Lipschitz-graph surface measure,
the trace operator with its kernel, the extension operator and Rellich compactness on `W^{1,p}`
of bounded Lipschitz domains; Hölder and Campanato spaces of every order; the strong-type
maximal inequality, Riesz–Thorin and off-diagonal Marcinkiewicz interpolation, the
Calderón–Zygmund decomposition, Calderón–Zygmund operators, the Mihlin–Hörmander multiplier
theorem, Gehring's lemma, BMO, John–Nirenberg, the Coifman–Rochberg–Weiss commutator theorem
and Sarason's VMO; the classical and weak maximum principles for non-divergence operators, both
Hopf lemmas, the comparison principle, the Aleksandrov–Bakelman–Pucci estimate with its
convex-envelope and contact-set lemmas, the Harnack inequalities, the Green representation,
barriers and regular boundary points; the energy method with `H⁻¹` forcing, `H¹` liftings, the
Fredholm compatibility condition and the Dirichlet spectrum of `−Δ`; every elliptic regularity
theorem of Layer 5; Bochner spaces, the Gelfand triple, Galerkin existence, the heat semigroup
on `Lᵖ` and `BUC` with its generator, and the complete classical whole-space parabolic
Schauder theory; the Euclidean dyadic partition, Bernstein and Littlewood–Paley estimates,
Besov spaces and paraproducts; Strichartz estimates for the Schrödinger and wave equations;
and quasilinear existence by the Schauder and Leray–Schauder fixed-point route.

- **Tau Ceti** already carries the weak-derivative carriers `W^{k,p}(Ω)` with completeness,
  `W^{1,p}_0` and `W^{k,p}_0`, restriction and zero extension, order-one Meyers–Serrin density on
  arbitrary open sets and every-order density on `ℝⁿ`, the Gagliardo–Nirenberg–Sobolev embedding
  of `W^{1,p}_0`, Morrey's theorem on `ℝⁿ`, zero-boundary Poincaré on slabs and balls,
  Poincaré–Wirtinger on convex sets, the hyperplane trace, Rellich compactness of
  `W^{1,p}_0`, the `H^{1,2} ⊆ W^{1,2}` half of the Bessel comparison, the bounded `C^{0,α}` Banach
  space, the weak-type `(1,1)` maximal inequality, diagonal Marcinkiewicz interpolation, the
  energy form on `H¹` and `H¹₀`, the coercive Dirichlet problem with `L²` forcing, the
  mass-shift Fredholm alternative, the Dirichlet spectrum of symmetric coercive forms, the weak
  maximum principle for weak solutions, constant-coefficient interior `H²` regularity, De
  Giorgi–Nash–Moser Hölder continuity for `n ≥ 3` under the operator-bound ellipticity
  predicate, the Newtonian kernel, the Green and Poisson kernels of the ball, Perron's
  solution, Harnack's inequality and the strong maximum principle for harmonic functions, the
  classical parabolic maximum principle, the Gaussian heat kernel with its semigroup identity
  and Fourier transform, and strongly continuous semigroups with Hille–Yosida and
  Lumer–Phillips generation. Every such declaration is cited in the supplier contracts with its
  file and line, and no target restates it; the targets below are the extensions.
- **GeometricMeasureTheory**, G3–G6, extends the weak-derivative and `W^{1,1}` APIs of Layer 1
  to distributional BV, finite perimeter, scalar coarea, BV compactness and BV traces, and
  consumes Layer 1's Sobolev spaces, density, Poincaré, Lipschitz-domain predicate, trace and
  extension. It is a consumer of this roadmap, not a supplier: nothing here cites it. The
  Lipschitz-graph surface measure that both the Sobolev trace and the BV trace need is a target
  of §1.6 here, and the gradient-image measure estimate that the Aleksandrov–Bakelman–Pucci
  proof needs is taken from Mathlib's change-of-variables inequality in §3.2, so neither
  consumes the general area formula.
- **Isoperimetry**, I3 and I5, owns the sharp periodic Wirtinger inequality with its equality
  case and the sharp whole-space BV Sobolev inequality with its extremizers. The embeddings and
  Poincaré inequalities of Layer 1 are non-sharp and independent of those results.
- **OperatorTheory**, in the ownership boundaries of its family README, owns unbounded
  operators as Mathlib `LinearPMap`s with the shared `zI − A` resolvent vocabulary; the
  realizations of the interval derivative as closed operators (maximal and minimal domains,
  graph, adjoint, boundary conditions) belong to that family. Section 1.1 identifies the
  `W^{1,p}` classes on an interval with their absolutely continuous representatives and states
  no operator realization.
- **OneParameterSemigroups**, Part A, owns strongly continuous semigroups and groups, their
  generators as densely defined `LinearPMap`s, growth bounds, resolvents, Hille–Yosida and
  Lumer–Phillips; Tau Ceti implements it. Section 6.3 constructs the heat semigroup as an
  instance and identifies its generator; it builds no second generation engine.
- **VariationalMethods** owns the abstract direct method, the energy space of a coercive
  form, semibounded shifts, the ordered construction of successive minima and the represented
  operator of a compact form pair. Nothing here consumes it: the Dirichlet spectrum of §4.4 is
  built on the pinned Tau Ceti solution operator, and VariationalMethods uses that instance as
  an example.
- **BanachAlgebras**, A8, owns Schauder's compact-map fixed-point theorem on a nonempty closed
  bounded convex subset of a real Banach space, consuming the finite-dimensional Brouwer theorem
  of **AlgebraicTopology**, Stage 2, item 7. Section 9.2 applies it and derives the
  Leray–Schauder adapter it needs from it.
- **StochasticCalculus** owns finite-dimensional Brownian motion, the predictable stochastic
  integral with its isometry, versions and localization, and the Burkholder–Davis–Gundy
  inequalities, and consumes this roadmap's maximal function, harmonic-function theory,
  Dirichlet and parabolic inputs; nothing here cites it. The stochastic programme that needs
  it, namely the cylindrical stochastic integral, Krylov's analytic `Lᵖ` theory of linear
  stochastic equations, the two-dimensional stochastic quantization equation with its Wick
  renormalization and Gibbs measure, and the two-dimensional stochastic Navier–Stokes equation
  with its invariant-law global theory, is the subject of **PDE, Part II**, a later roadmap
  that consumes this roadmap's Layers 6 and 7 together with StochasticCalculus. This roadmap
  stops at the deterministic theory, the dyadic and Besov analysis, the Strichartz estimates
  and the quasilinear fixed-point existence theory.
- **PseudodifferentialOperators**, Layer 5, consumes Layer 1's Sobolev theory, Layer 2's
  maximal, interpolation and multiplier estimates and Layer 7's Euclidean dyadic partition and
  Besov spaces, and owns their transport to bundles and the real-interpolation identities. It
  is a consumer, not a supplier.
- Viscosity solutions, elliptic systems, boundary-value stochastic equations and
  three-dimensional Navier–Stokes are outside this roadmap: every statement below is scalar,
  and the non-divergence track is for strong and classical solutions.

## Conventions

Throughout, `n ≥ 1` is the dimension for the elliptic inequalities, gradient and boundary
theorems; the dimension-zero function spaces and their finite-dimensional algebraic cases are
kept, and no positive-domain Poincaré inequality is applied to zero-dimensional constants.
`Ω ⊆ ℝⁿ` is open; boundedness, connectedness and boundary regularity are named hypotheses of
each statement, never standing assumptions. Interior estimates need no boundary regularity;
global ones name theirs (Lipschitz, `C¹`, `C^{1,1}`, `C^{2,α}`). Lebesgue measure is Mathlib's
`volume` on `EuclideanSpace ℝ (Fin n)`; the Tau Ceti Sobolev carriers are stated for an
arbitrary additive Haar measure `mu` and are used with `volume`. Mathlib's uniform hypothesis
style is followed: a coefficient bound is the inline hypothesis `∀ x ∈ Ω, ‖b x‖ ≤ β`, never a
bespoke boundedness predicate.

**Solution concepts.** Every theorem names whether it is about classical solutions (`C²`, the
equation holds pointwise), strong solutions (`W^{2,p}`, almost everywhere) or weak solutions
(`H¹`, tested against `H¹₀`), and which of these it assumes and produces. The regularity layer
is the passage from weak to classical.

**Uniform ellipticity.** Two predicates are used and never identified.

- The *inverse-coercive* predicate, written `IsUniformlyEllipticAE` in `Suggested.lean`, is the
  hypothesis of the divergence-form theory: for almost every `x ∈ Ω` and every `ξ`,
  `ξ · a(x)ξ ≥ λ‖ξ‖²` and `ξ · a(x)⁻¹ξ ≥ Λ⁻¹‖ξ‖²`, with `0 < λ ≤ Λ` and no symmetry. The first
  condition makes `a(x)` invertible. Substituting `y = a(x)ξ` in the second gives
  `‖a(x)ξ‖² ≤ Λ(ξ · a(x)ξ)`, and Cauchy–Schwarz then gives the quadratic bound
  `ξ · a(x)ξ ≤ Λ‖ξ‖²`, the operator bound `‖a(x)ξ‖ ≤ Λ‖ξ‖` and the mixed bound
  `|ζ · a(x)ξ| ≤ Λ‖ζ‖‖ξ‖`, all with the same `Λ`; these are derived, never primitive. For
  symmetric `a(x)` the two conditions are the Loewner bounds `λI ≤ a(x) ≤ ΛI`.
- The pinned *operator-bound* predicate `TauCeti.PDE.UniformlyEllipticOn Ω a λ Λ` asks, at every
  point of `Ω`, for `ξ · a(x)ξ ≥ λ‖ξ‖²` and `|η · a(x)ξ| ≤ Λ‖η‖‖ξ‖`. It is the hypothesis of
  the pinned Dirichlet, regularity and Hölder theorems and of the non-divergence statements
  below, which only see the symmetric part of `a`.
- Conversions: the inverse-coercive pair `(λ, Λ)` implies the operator-bound pair `(λ, Λ)`;
  the operator-bound pair `(λ, M)` implies the inverse-coercive pair `(λ, M²/λ)`, since
  `ξ · a⁻¹ξ ≥ λ‖a⁻¹ξ‖² ≥ (λ/M²)‖ξ‖²`. The gap is real: for `a = [[1, −k], [k, 1]]` one has
  `ξ · aξ = ‖ξ‖²`, so `λ = 1`, the operator norm is `M = √(1+k²)`, and the symmetric part of
  `a⁻¹` is `I/(1+k²)`, so the inverse-coercive upper constant is `Λ = 1+k²`. At `k = 1` the
  operator bound is `√2` while inverse coercivity needs `Λ = 2`. Every estimate says which
  pair its constants are calibrated against, and the adapter between the two predicates is the
  target of §4.1.

**Estimates.** Every energy, Harnack, Hölder, Schauder and Calderón–Zygmund estimate states how
its constants and exponents depend on `λ, Λ` (after normalization, on the ratio `Λ/λ`, since
the equations are invariant under `a ↦ a/λ`), on the dimension, the exponents, the domain
geometry and the coefficient moduli that enter. An unqualified `∃ C` is not a final statement.
Local estimates are stated in rescaling-compatible form on a ball of radius `r`: the coefficient
parameters are the dimensionless `r^α [a]_{C^{0,α}}`, `r‖∇a‖_∞`, `r‖b‖_∞` and `r²‖c‖_∞`, and the
estimate is quantitative in a local norm of the solution as well as in the data. For VMO
coefficients the VMO modulus and its small radius `r₀` are carried explicitly. Constants
depending only on the structural data and not on the solution are false for homogeneous
equations: `u ↦ Mu` maps solutions to solutions and scales every seminorm.

**Operator forms.** `L_div u = −div(a∇u)` and `L_nondiv u = −aⁱʲ∂ᵢ∂ⱼu` are kept apart. A
non-constant antisymmetric part of `a` enters the weak bilinear form of `L_div` and makes the
operator non-self-adjoint although it vanishes from the diagonal energy; a constant
antisymmetric part integrates to zero against `H¹₀` and changes nothing. In non-divergence form the
Hessian is symmetric, so only `(a + aᵀ)/2` enters, and that track assumes symmetric
coefficients without changing `λ, Λ`. For `a ∈ C¹` with bounded derivatives and `u ∈ C²`,
`∂ⱼ(aⁱʲ∂ᵢu) = aⁱʲ∂ᵢ∂ⱼu + bⁱ∂ᵢu` with `bⁱ = ∂ⱼaⁱʲ` summed over `j`, so classical theorems
transfer; for merely Lipschitz `a` the identity holds only almost everywhere and the pointwise
theorems do not apply as stated. De Giorgi–Nash–Moser is divergence-form and weak;
Krylov–Safonov is its non-divergence counterpart for `W^{2,n}_loc` strong solutions. Both are
scalar theories and are never generalized to systems.

**Signs and normalizations.** `Δ` has Mathlib's sign (`InnerProductSpace/Laplacian.lean`), so
`−Δ` is nonnegative and the heat generator is `A = Δ`; the shared resolvent convention is
`(λI − A)⁻¹`. The Fourier transform is Mathlib's, with the `2π` in the exponent, so the Bessel
potential is `(1 − (2π)⁻²Δ)^{s/2}`, the Fourier multiplier of `Δ` is `−4π²|ξ|²`, and the Gaussian
heat kernel has transform `exp(−4π²t|ξ|²)`. The fundamental solution `Φ` satisfies `−ΔΦ = δ`.
Maximum principles use the roadmap's sign: `c ≥ 0`, subsolutions satisfy `Lu ≤ 0`; the classical
Hopf lemma of §3.2 is stated in Gilbarg–Trudinger's opposite convention, and negating `L`
converts one to the other. Hölder exponents are `ℝ≥0` with `0 < α ≤ 1`, and a Hölder conclusion
for an `H¹` class is always about a representative. The parabolic distance is
`d_par((x,t),(y,s)) = ‖x − y‖ + √|t − s|`.

**Labels.** The identifiers A1–A7 (Layer 1), B8–B11 (Layer 2), C12–C15 (Layer 3), D16–D19
(Layer 4), E20–E26 (Layer 5), F24–F27.6 (Layer 6) and X0–X2 (Layers 7–9) appear in the
section headings; consumers cite either form. The stochastic programme X3 is PDE, Part II.

## Exact supplier contracts

### From Mathlib

- `Distribution`, `TestFunction`, `ContDiffMapSupportedIn`, `TemperedDistribution`,
  `SchwartzMap`, `FourierSchwartz`, `FourierMultiplier` and `Function.HasTemperateGrowth` in
  `Mathlib/Analysis/Distribution/`: the test-function and distribution pairing on a
  finite-dimensional domain, and `Lp.toTemperedDistribution`
  (`Mathlib/Analysis/Distribution/TemperedDistribution.lean:160`) attaching a tempered
  distribution to an `Lᵖ` function.
- `TemperedDistribution.besselPotential` and `TemperedDistribution.MemSobolev`
  (`Mathlib/Analysis/Distribution/Sobolev.lean:73,153`), with
  `MemSobolev.lineDerivOp` and `MemSobolev.laplacian`: the Bessel-potential scale `H^{s,p}` on
  `ℝⁿ`, a whole-space notion that §1.3 compares with the domain spaces and never reuses as the
  domain theory.
- `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`
  (`Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean:601`): the
  Gagliardo–Nirenberg–Sobolev inequality for compactly supported `C¹` functions, consumed by
  §1.4 for `1 ≤ p < n`.
- `Real.fourierIntegral`, Fourier inversion, Plancherel, `Mathlib/Analysis/Fourier/*`;
  `MeasureTheory.convolution` and `ContDiffBump`: the approximate-identity machinery.
- `InnerProductSpace.laplacian`, `HarmonicAt`, `HarmonicOnNhd`, the mean-value property,
  Liouville and the Poisson kernel in `Mathlib/Analysis/InnerProductSpace/Harmonic/` and
  `Mathlib/Analysis/Complex/Harmonic/`.
- `IsCoercive` and `IsCoercive.continuousLinearEquivOfBilin`
  (`Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean:105`): Lax–Milgram for a coercive
  continuous bilinear form on a complete real Hilbert space, without symmetry;
  `InnerProductSpace.toDual` (Fréchet–Riesz); `ContinuousLinearMap.adjoint`.
- `IsCompactOperator.hasEigenvalue_or_mem_resolventSet`
  (`Mathlib/Analysis/Normed/Operator/Compact/FredholmAlternative.lean:164`) and the compact
  symmetric spectral theorem `LinearMap.IsSymmetric.orthogonalComplement_iSup_eigenspaces_eq_bot`
  (`Mathlib/Analysis/InnerProductSpace/Spectrum.lean:137`).
- Hahn–Banach, Banach–Steinhaus, the open mapping and closed graph theorems, `WeakDual`,
  Banach–Alaoglu, Arzelà–Ascoli (`Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean`),
  the Bochner integral, `Lp`, `eLpNorm`, Hölder and Minkowski, `VitaliFamily` and
  `VitaliFamily.ae_tendsto_average` (`Mathlib/MeasureTheory/Covering/Differentiation.lean:855`),
  which is the Lebesgue differentiation theorem; §2.1 does not restate it.
- `MeasureTheory.Measure.euclideanHausdorffMeasure` with notation `μHE[d]`
  (`Mathlib/Geometry/Euclidean/Volume/Measure.lean:68,72`), normalized to agree with Lebesgue
  measure on a `d`-dimensional Euclidean space, and
  `LinearMap.euclideanHausdorffMeasure_image_eq_normDet_mul_volume`
  (`Mathlib/Analysis/InnerProductSpace/NormDet.lean:433`): the boundary measure of §1.6 and
  the linear case of the graph surface measure. `LipschitzOnWith.hausdorffMeasure_image_le`
  (`Mathlib/MeasureTheory/Measure/Hausdorff.lean:733`) and Rademacher's theorem
  `LipschitzWith.ae_differentiableAt` (`Mathlib/Analysis/Calculus/Rademacher.lean:385`) are
  the Lipschitz inputs.
- `MeasureTheory.addHaar_image_le_lintegral_abs_det_fderiv`
  (`Mathlib/MeasureTheory/Function/Jacobian.lean:897`): the measure of the image of a measurable
  set under a map differentiable on it is at most the integral of the absolute Jacobian. This is
  the gradient-image estimate of the Aleksandrov–Bakelman–Pucci proof in §3.2, applied to the
  `C¹` map `∇u` of a `C²` approximant on the contact set.
- `HolderWith`, `HolderOnWith` (`Mathlib/Topology/MetricSpace/Holder.lean:51,57`), `eHolderNorm`
  and `MemHolder` (`Mathlib/Topology/MetricSpace/HolderNorm.lean`), `Metric.Snowflaking`
  (`Mathlib/Topology/MetricSpace/Snowflaking.lean`), `WithLp.prod_dist_eq_add`
  (`Mathlib/Analysis/Normed/Lp/ProdLp.lean:256`), `BoundedContinuousFunction` and
  `UniformEquicontinuous`: the Hölder and parabolic carriers of §1.7 and §6.4.
- Picard–Lindelöf and Grönwall in `Mathlib/Analysis/ODE/`: the Galerkin systems of §6.2.
- Mathlib has no Riesz–Thorin theorem, no Mihlin–Hörmander theorem, no Calderón–Zygmund
  operator theory and no maximal function.

### From Tau Ceti

All files are under `TauCeti/`; line numbers are those of the pinned revision.

- `TauCeti.HasWeakFDerivOn` and `TauCeti.HasWeakLineDerivOn`
  (`Analysis/Sobolev/WeakDeriv/Basic.lean:248,209`): weak derivatives of locally integrable
  functions on an open set, through the test-function pairing.
- `TauCeti.W1p` (`Analysis/Sobolev/W1p/Basic.lean:355`) with its completeness (`:359`),
  `W1p.value` and `W1p.gradient` (`:367,378`) and their continuous versions `W1p.valueL`,
  `W1p.gradientL` (`:363,374`); `TauCeti.Wkp` with `Wkp.instCompleteSpace`
  (`Analysis/Sobolev/Wkp/Basic.lean:145,165`), `Wkp.value`, `Wkp.lowerOrder`, `Wkp.firstOrder`
  and `Wkp.iteratedGradient` (`:236,181,195,221`): the weak Sobolev spaces of every order on an
  open set, for every `1 ≤ p ≤ ∞` and an additive Haar measure, with `k = 0` the native `Lᵖ`.
  Layer 1 builds no second carrier.
- `TauCeti.w1p0Submodule`, `TauCeti.W1p0`, `W1p0.valueL`, `W1p.ofTestFunctionₗ` and the
  completeness of `W1p0` (`Analysis/Sobolev/W1p/Zero.lean:123,147,161,87,246`);
  `TauCeti.wkp0Submodule`, `TauCeti.Wkp0` and `Wkp0.denseRange_ofTestFunctionₗ`
  (`Analysis/Sobolev/Wkp/Zero.lean:334,366,382`): the closure-defined zero-boundary spaces for
  every order and every `p`, including `p = ∞`.
- `TauCeti.W1p.restrictL`, `TauCeti.Wkp.restrictL` (`Analysis/Sobolev/W1p/Restriction.lean:155`,
  `Analysis/Sobolev/Wkp/Restriction.lean:141`); `TauCeti.W1p0.extendByZeroL` and
  `TauCeti.Wkp0.extendByZeroₗᵢ` (`Analysis/Sobolev/W1p/Extension.lean:220`,
  `Analysis/Sobolev/Wkp/Extension.lean:112`): restriction to a smaller open set and zero
  extension of zero-boundary functions, isometric in every order.
- `TauCeti.W1p.dense_contDiffOn_representatives`
  (`Analysis/Sobolev/W1p/MeyersSerrin.lean:216`, hypothesis `p ≠ ⊤`): order-one Meyers–Serrin
  on an arbitrary open set; `TauCeti.Wkp.dense_contDiff_representatives`
  (`Analysis/Sobolev/Wkp/SmoothDensity.lean:93`) and `TauCeti.wkp0Submodule_top_eq_top`
  (`Analysis/Sobolev/Wkp/Density.lean:130`), both under `p ≠ ⊤`: every-order smooth density on
  `ℝⁿ` and `W^{k,p}_0(ℝⁿ) = W^{k,p}(ℝⁿ)` for finite `p`.
- `TauCeti.W1p0.sobolevEmbeddingL` with `W1p0.norm_sobolevEmbeddingL_le`
  (`Analysis/Sobolev/Embedding.lean:385,422`): the Gagliardo–Nirenberg–Sobolev embedding
  `W^{1,p}_0(Ω) → L^{p*}(Ω)` for `1/p* = 1/p − 1/n`, `p* < ∞`.
- `TauCeti.W1p.morreyRepresentative`, `W1p.holderWith_morreyRepresentative` and
  `W1p.morreyEmbedding` (`Analysis/Sobolev/W1p/Morrey.lean:156,161`,
  `Analysis/Sobolev/W1p/HolderEmbedding.lean:157`): Morrey's theorem on `ℝⁿ` for `n < p < ∞`,
  with the `1 − n/p`-Hölder representative.
- `TauCeti.W1p.norm_value_le_mul_norm_gradient_of_subset_slab` and `…_of_subset_ball`
  (`Analysis/Sobolev/Poincare/W1p0.lean:92,112`, finite `p`): zero-boundary Poincaré with the
  enclosing width as constant. `TauCeti.W1p.eLpNorm_value_sub_setAverage_le_of_convex` and
  `…_of_eq_ball` (`Analysis/Sobolev/Poincare/Wirtinger/W1p.lean:168,303`, finite `p`):
  Poincaré–Wirtinger on bounded convex open sets, with constant `2^(n+1) R` on a ball of radius
  `R`.
- `TauCeti.W1p.hyperplaneTrace` with `W1p.hyperplaneTrace_ofTestFunction_apply_ae`,
  `W1p.norm_hyperplaneTrace_le` and `W1p.hyperplaneTrace_unique`
  (`Analysis/Sobolev/Trace/Hyperplane.lean:182,187,199,219`): the `L²` trace of a whole-space
  `H¹` function on a hyperplane, agreeing with restriction on test functions.
- `TauCeti.W1p0.isCompactOperator_valueL` (`Analysis/Sobolev/RellichKondrachov.lean:141`,
  bounded open `Ω`, `p ≠ ∞`): Rellich compactness of `W^{1,p}_0(Ω) → Lᵖ(Ω)`.
- `MeasureTheory.Lp.exists_w1p_value_eq_of_memSobolev_one` (`Analysis/Sobolev/BesselPotential.lean:132`):
  a real `L²` function in the Bessel space `H^{1,2}` is the value of a `W^{1,2}(ℝⁿ)` element.
- `TauCeti.HolderSpace` with its norm and completeness (`Analysis/Holder/Normed.lean:58,199,311`)
  and `TauCeti.holderSubmodule` (`Analysis/Holder/Basic.lean:45`): the bounded globally
  `α`-Hölder functions on a metric space as a Banach space, the `k = 0` case of §1.7.
- `TauCeti.maximalFunction`, `TauCeti.mul_measure_lt_maximalFunction_le` and
  `measure_lt_maximalFunction_le` (`MeasureTheory/Integral/MaximalFunction.lean:125,363,406`),
  with `ae_maximalFunction_lt_top` following them: the centred Hardy–Littlewood
  maximal function on a finite-dimensional space with an additive Haar measure and its
  weak-type `(1,1)` bound with constant `4ⁿ`, for every function without a measurability
  hypothesis.
- `TauCeti.lintegral_rpow_le_of_meas_ofReal_lt_le`
  (`MeasureTheory/Integral/Marcinkiewicz/General.lean:416`) and
  `TauCeti.lintegral_rpow_le_of_mul_meas_lt_le_of_le_eLpNormEssSup`
  (`MeasureTheory/Integral/Marcinkiewicz/Basic.lean:369`): the diagonal Marcinkiewicz
  interpolation engines, stated on distribution functions, between two finite exponents and
  between a weak-type `(p₀,p₀)` bound and an `L^∞` bound.
- `TauCeti.PDE.UniformlyEllipticOn` (`Analysis/PDE/Ellipticity/Basic.lean:474`): the pointwise
  operator-bound ellipticity predicate of the Conventions.
- `TauCeti.PDE.energyIntegrand` (`Analysis/PDE/EnergyForm/Basic.lean:86`),
  `TauCeti.PDE.energyFormH1`, `energyFormH1L` and `energyFormH1L0`
  (`Analysis/PDE/EnergyForm/Sobolev.lean:372,524,600`) with `energyFormH1_comm_of_isSymm_ae`
  (`:449`) and `energyFormH1_poincare_constant_pos` (`:459`): the energy bilinear form
  `∫ (∇v · a∇u + (b · ∇u) v + c u v)` on `H¹(Ω)` and `H¹₀(Ω)`, bounded whenever the energy
  density is essentially bounded.
- `IsCoercive.solutionOfFunctional` with `apply_solutionOfFunctional_eq` and
  `eq_solutionOfFunctional` (`Analysis/InnerProductSpace/LaxMilgram.lean:119`): the Lax–Milgram
  solution of `B(u, ·) = ℓ` for a coercive form and a continuous functional `ℓ`.
- `TauCeti.PDE.dirichletForcing`, `IsWeakSolutionDirichlet`,
  `isWeakSolutionDirichlet_iff_forall_testFunction`, `norm_le_of_isWeakSolutionDirichlet`,
  `isCoercive_energyFormH1L0`, `weakSolutionDirichlet`, `existsUnique_isWeakSolutionDirichlet`
  and `existsUnique_isWeakSolutionDirichlet_laplacian_of_subset_ball`
  (`Analysis/PDE/DirichletProblem.lean:135,175,194,227,245,260,292,444`): the weak Dirichlet
  problem with `L²` forcing, its a priori bound, and existence and uniqueness by Lax–Milgram,
  including the Poisson problem on every open set inside a ball.
- `TauCeti.PDE.dirichletMassOperator`, `IsWeakSolutionDirichletMassShift`,
  `finiteDimensional_ker_one_sub_smul_dirichletMassOperator` and
  `fredholmAlternative_isWeakSolutionDirichlet_sub_const`
  (`Analysis/PDE/FredholmAlternative.lean:75,105,177,193`), on top of
  `IsCoercive.formPerturbationOperator` and `IsCoercive.fredholmAlternative_formPerturbation`
  (`Analysis/InnerProductSpace/Variational/Fredholm.lean:65,132`): for a coercive bounded form on
  a bounded open set, the mass shift `c − κ` has either a nonzero homogeneous weak solution or a
  unique weak solution for every `L²` forcing, with finite-dimensional homogeneous space.
- `TauCeti.PDE.dirichletSolutionOperator`, `IsDirichletEigenvalue`,
  `firstDirichletEigenvalue`, `isDirichletEigenvalue_first`, `firstDirichletEigenvalue_pos`,
  `isLeast_rayleighQuotient_firstDirichletEigenvalue`,
  `exists_hilbertBasis_forall_isDirichletEigenvalue` and
  `existsUnique_isWeakSolutionDirichlet_sub_const_of_not_isDirichletEigenvalue`
  (`Analysis/PDE/Spectrum.lean:146,218,296,343,362,447,544,581`): for a symmetric coercive
  bounded form on a bounded open set, the compact self-adjoint solution operator, the Dirichlet
  eigenvalues as its reciprocal eigenvalues, the first eigenvalue as the least Rayleigh quotient
  on a **nonempty** domain, an orthonormal eigenbasis of `L²(Ω)` with positive eigenvalues and
  the eigenfunction expansion of the solution. The first-eigenvalue theorems carry the
  nonemptiness hypothesis `hOmega_nonempty` explicitly.
- `TauCeti.PDE.value_nonpos_of_energyFormH1_nonpos`, `value_le_of_energyFormH1_le` and
  `UniformlyEllipticOn.value_le_of_small_drift_of_subset_ball`
  (`Analysis/PDE/MaximumPrinciple/Weak.lean:141,196,420`): the weak maximum principle for weak
  sub- and supersolutions, with the small-drift and Poincaré hypotheses it needs.
- `TauCeti.PDE.UniformlyEllipticOn.exists_lowerOrder_eq_restrictL`
  (`Analysis/PDE/Regularity/Interior.lean:585`): interior `H²` regularity for a constant
  principal coefficient matrix, bounded `b, c` and `L²` forcing, with no boundary condition.
- `TauCeti.PDE.exists_holderOnWith_preciseRepresentative` and
  `exists_holderOnWith_preciseRepresentative_of_isCompact`
  (`Analysis/PDE/Regularity/HolderContinuity.lean:76,162`): De Giorgi's Hölder continuity of
  weak solutions of `−∂ⱼ(aⁱʲ∂ᵢu) = 0` under `UniformlyEllipticOn`, for a finite Sobolev
  exponent with `1/2* + 1/n = 1/2` (hence `n ≥ 3`), with exponent and constant depending only on
  `λ, Λ, n` and the constant `C R^(−α) R^(−n/2) ‖u‖_{L²(Ω)}` on a set whose closed
  `R`-thickening lies in `Ω`; the representative is the precise representative.
- `TauCeti.PDE.W1p.setIntegral_sq_mul_norm_gradient_sq_le_of_pointwise` and
  `TauCeti.PDE.UniformlyEllipticOn.setIntegral_sq_mul_norm_gradient_sq_le`
  (`Analysis/PDE/Caccioppoli/Basic.lean:75,176`): the Caccioppoli inequality.
- `TauCeti.newtonianKernel` with `laplacian_newtonianKernel`, `harmonicOnNhd_newtonianKernel`
  and `newtonianKernel_three` (`Analysis/PDE/FundamentalSolution/Euclidean/Basic.lean:56,246,272,343`);
  `TauCeti.ballGreenKernel`, `ballGreenKernel_eq_zero_of_norm_eq_one_right`,
  `harmonicOnNhd_ballGreenKernel`, `ballPoissonKernel` and `ballPoissonKernel_pos`
  (`Analysis/PDE/GreenFunction/Ball.lean:273,295,317,365,378`): the fundamental solution in every
  dimension and the Green and Poisson kernels of the unit ball.
- `TauCeti.perronFamily`, `TauCeti.perronSolution` and `harmonicOnNhd_perronSolution`
  (`Analysis/PDE/Perron/Basic.lean:133,157,348`): Perron's upper solution on a bounded open set
  is harmonic.
- `InnerProductSpace.HarmonicOnNhd.le_three_pow_mul_of_nonneg` and
  `IsCompact.harnack_inequality` (`Analysis/PDE/Harnack/Basic.lean:92,178`);
  `TauCeti.eqOn_const_of_harmonicOnNhd_of_isLocalMax` and `…_of_isMaxOn`
  (`Analysis/PDE/Harnack/StrongPrinciple.lean:104,181`): Harnack's inequality and the strong
  maximum principle for harmonic functions.
- `TauCeti.le_of_deriv_sub_laplacian_le_of_le_parabolicBoundary` and
  `eqOn_of_deriv_sub_laplacian_eq_of_eqOn_parabolicBoundary`
  (`Analysis/PDE/MaximumPrinciple/Parabolic.lean:252,301`): the classical parabolic maximum
  principle on a compact cylinder.
- `TauCeti.heatKernel` with `heatKernel_pos`, `integral_heatKernel`,
  `heatKernel_convolution_heatKernel`, `laplacian_heatKernel`, `hasDerivAt_heatKernel` and
  `fourier_heatKernel` (`Analysis/PDE/HeatKernel/Basic.lean:68,77,163,177,109,131,213`): the
  Gaussian kernel, its mass, semigroup identity, heat equation and Fourier transform
  `exp(−4π²t|ξ|²)`.
- `TauCeti.Semigroups.StronglyContinuousSemigroup` and `TauCeti.Semigroups.ContractionSemigroup`
  (`Analysis/Semigroups/Basic.lean:43,211`), the generator files under
  `Analysis/Semigroups/Generator/`, `TauCeti.Semigroups.hilleYosida_generation`
  (`Analysis/Semigroups/Generation/HilleYosida/Generation.lean:205`) and
  `Analysis/Semigroups/Generation/LumerPhillips.lean`: the implementation of
  OneParameterSemigroups Part A that §6.3 instantiates.
- Tau Ceti has no Riesz–Thorin theorem, no strong-type maximal inequality, no
  Calderón–Zygmund operator, no Lipschitz-domain predicate, no domain trace and no Hölder space
  of positive order.

### From TauCetiRoadmap.OneParameterSemigroups

Part A: strongly continuous semigroups on real Banach spaces, their generators as densely
defined `LinearPMap`s, the growth bound, the resolvent `R(λ, A)`, Hille–Yosida and
Lumer–Phillips, and the uniqueness of the semigroup generated by a given generator. Section 6.3
consumes the generation and uniqueness theorems through the Tau Ceti declarations above and
proves the heat semigroup's domain equalities as an instance.

### From TauCetiRoadmap.OperatorTheory

The ownership boundaries of its family README: unbounded operators are Mathlib `LinearPMap`s,
the resolvent vocabulary is `TauCeti.LinearPMap` with the `zI − A` convention, and the
partial-operator spectrum lives in that namespace. Sections 4.4 and 6.3 use this vocabulary for
the Dirichlet realization of `−Δ` and the heat generator and define no second one.

### From TauCetiRoadmap.BanachAlgebras and TauCetiRoadmap.AlgebraicTopology

BanachAlgebras A8: Schauder's fixed-point theorem for a continuous self-map with relatively
compact range of a nonempty closed bounded convex subset of a real Banach space, built on
AlgebraicTopology Stage 2, item 7, the finite-dimensional Brouwer theorem for nonempty compact
convex subsets. Section 9.2 consumes the real Schauder theorem; no fixed-point engine is built
here.

## How to read the build

Layer 1 builds the function spaces on a domain that everything else uses, from the pinned
carriers upward: interval classes, higher-order density, the Bessel comparison, embeddings,
Poincaré, the Lipschitz-domain predicate with its graph measure, trace, extension and Rellich
compactness, and Hölder spaces. Layer 2 is the harmonic-analysis engine: the strong-type
maximal theorem, interpolation, Calderón–Zygmund operators and multipliers, Gehring, BMO and
VMO. Layer 3 is the classical constant-coefficient theory plus the Aleksandrov–Bakelman–Pucci
estimate: mean values, maximum principles and both Hopf lemmas, Harnack, fundamental solution,
Green functions and Perron. Layer 4 is the energy method: the weak form and Gårding, coercive
existence with liftings and `H⁻¹` data, the Fredholm compatibility condition, and the
spectrum. Layer 5 is elliptic regularity in its two tracks. Layer 6 is parabolic and evolution
theory, ending with the complete classical whole-space Schauder programme F27. Layers 7–9 are
the extension programmes: dyadic and Besov analysis, Strichartz estimates and quasilinear
existence. Layers 2, 3 and 4 depend only on Layer 1 and can be built in
parallel; Layer 5 needs Layers 2–4; Layer 6 needs Layers 1 and 4; Layer 7 needs Layer 2;
Layer 8 needs Layer 7; Layer 9 needs Layers 4 and 5.

## Layer 1: function spaces on a domain

### 1.1 Weak derivatives and Sobolev classes on intervals (A1)

The carriers are the pinned `TauCeti.HasWeakFDerivOn`, `TauCeti.W1p` and `TauCeti.Wkp`, built on
Mathlib's test-function pairing, with the honest definition
`∫ u ∂^α φ = (−1)^{|α|} ∫ (D^α u) φ` for every test function `φ` and completeness in every order.
Define, for a bounded interval `(a, b)` and `1 ≤ p ≤ ∞`, the absolutely continuous
representative of a `W^{1,p}(a,b)` class and prove the identification: every class has exactly
one representative that is absolutely continuous on `[a, b]` with classical derivative in
`Lᵖ(a,b)` equal to the weak derivative, and every absolutely continuous function with derivative
in `Lᵖ` is such a representative (Leoni, *A First Course in Sobolev Spaces*, Theorem 7.13).
Prove the endpoint
fundamental theorem of calculus `u(y) − u(x) = ∫_x^y u'` for the representative and the
integration-by-parts identity `∫_a^b u'v = u(b)v(b) − u(a)v(a) − ∫_a^b uv'` for two such
representatives. At `p = 2` the class is `H¹(a,b)`, not the class of all absolutely continuous
functions. The two endpoint values of the representative are the one-dimensional traces of
§1.6, and the finite-`p` kernel statement of §1.6 specializes to the absolutely continuous
functions vanishing at both endpoints.

- The representative is unique: two continuous functions equal almost everywhere on `(a, b)`
  are equal everywhere.
- The identification is linear and the representative of a constant class is the constant.
- The map from the class to the pair of endpoint values is bounded `W^{1,p}(a,b) → ℝ²`, with a
  constant depending on `b − a` and `p`.

**Checks.**

- `u(x) = x` on `(0, 1)`: the weak derivative is the constant `1` (testing `∫ x φ' = −∫ φ`),
  the representative is `x` itself, the endpoint values are `0` and `1`, and `u` is not in the
  kernel of the endpoint map.
- `u(x) = |x|` on `(−1, 1)`: the weak derivative is `sign x`, in `L^∞`; the representative is
  absolutely continuous but not `C¹`, so the identification does not produce classical
  differentiability.
- The Cantor function on `(0, 1)` is continuous with zero classical derivative almost
  everywhere but is not absolutely continuous and has no weak derivative in `L¹`: the candidate
  derivative `0` fails `∫ u φ' = −∫ 0 · φ` for `φ` with `∫ u φ' ≠ 0`. A plausible wrong
  definition that identifies `W^{1,1}` with functions differentiable almost everywhere admits it.
- `u(x) = x²` on `(0, 1)` against `φ` supported in `(0, 1)`: `∫ x² φ' = −∫ 2x φ`, so the weak
  derivative is `2x`, and the candidate `0` leaves a nonzero right-hand side for `φ ≥ 0`
  supported in `(1/2, 1)`.

*Needs:* Tau Ceti `TauCeti.W1p`, `TauCeti.HasWeakFDerivOn`; Mathlib's absolutely continuous
functions and the fundamental theorem of calculus for the Lebesgue integral.

### 1.2 Density and zero-boundary spaces (A2)

For every open `Ω` and every order `k ≥ 0` the zero-boundary space `W^{k,p}_0(Ω)` is the pinned
`TauCeti.Wkp0`, the closure of `C_c^∞(Ω)` in the full `W^{k,p}` norm, for all `1 ≤ p ≤ ∞`. For
`1 ≤ p < ∞` and `k = 1`, arbitrary-open-set Meyers–Serrin density of `C^∞(Ω) ∩ W^{1,p}(Ω)` is the
pinned `TauCeti.W1p.dense_contDiffOn_representatives`, and on `ℝⁿ` smooth density in every
order and `W^{k,p}_0(ℝⁿ) = W^{k,p}(ℝⁿ)` are the pinned
`TauCeti.Wkp.dense_contDiff_representatives` and `TauCeti.wkp0Submodule_top_eq_top`; consume
them. Prove Meyers–Serrin in every order `k ≥ 2` on an arbitrary open `Ω` for finite `p`
(`dense_contDiffOn_representatives_wkp` in `Suggested.lean`; Evans, §5.3.2, Theorem 2) by the
same construction: an interior exhaustion and a locally finite partition of unity,
mollification of each localized term at a support-preserving radius with summable Sobolev
errors, and summation using local finiteness and the derivative/convolution identities. On a
general domain `W^{k,p}_0 = W^{k,p}` is not inferred from smooth-interior density. Keep
`W^{k,∞}` for coefficient and solution hypotheses and prove local mollifier approximation in
lower norms and in the weak-star derivative topology under the appropriate boundedness
hypotheses; full `W^{k,∞}`-norm smooth density is false and is not asserted.

- `W^{k,p}_0(Ω)` is closed, and restriction to a smaller open set maps `W^{k,p}_0(Ω)` into
  `W^{k,p}(Ω')` (pinned `Wkp.restrictL`); zero extension maps `W^{k,p}_0(Ω)` isometrically into
  `W^{k,p}_0(Ω')` for `Ω ⊆ Ω'` (pinned `Wkp0.extendByZeroₗᵢ`).
- Mollification at radius `ε` of a compactly supported `W^{k,p}` function converges in
  `W^{k,p}` as `ε → 0` for finite `p`, and the weak derivatives of the mollification are the
  mollifications of the weak derivatives inside the support-preserving region.
- For finite `p`, `W^{k,p}(Ω)` is separable and `C^∞(Ω) ∩ W^{k,p}(Ω)` is dense; for `p = ∞`
  neither holds.

**Checks.**

- The constant `1` on `ℝⁿ` lies in `W^{k,∞}(ℝⁿ)` for every `k` and is at sup-distance `1`
  from every compactly supported function: `W^{k,∞}_0(ℝⁿ) ≠ W^{k,∞}(ℝⁿ)`, while for finite `p`
  the constant is not even in `Lᵖ`.
- `|x|` on `(−1, 1)` is in `W^{1,∞}` but at `W^{1,∞}`-distance at least `1` from every `C¹`
  function, since a continuous derivative cannot be uniformly close to `sign x`.
- `x(1 − x)` on `(0, 1)` has zero endpoint values and lies in `W^{1,p}_0` for finite `p`, but
  its derivative `1 − 2x` takes the values `±1` at the endpoints while every `C_c^∞(0,1)`
  function has derivative vanishing near them, so it is not in the `W^{1,∞}`-norm closure.
- On `Ω = (0, 1)` with `k = 2`, `p = 2`, the function `x^{3/2}` has second derivative
  `(3/4) x^{−1/2}`, whose square `(9/16) x^{−1}` is not integrable at `0`; so
  `x^{3/2} ∈ W^{1,2}(0,1)` but `x^{3/2} ∉ W^{2,2}(0,1)`, and the order-two density statement is
  about a strictly smaller space than the order-one one.

*Needs:* Tau Ceti `TauCeti.Wkp`, `TauCeti.Wkp0`, `TauCeti.W1p.dense_contDiffOn_representatives`,
`TauCeti.Wkp.dense_contDiff_representatives`; Mathlib `ContDiffBump` and convolution.

### 1.3 Agreement with the Bessel-potential scale (A3)

Prove `W^{k,2}(ℝⁿ) = H^{k,2}(ℝⁿ)` with equivalent norms for every `k`: a real `L²` function lies
in Mathlib's `TemperedDistribution.MemSobolev k 2` exactly when it is the value of an element of
`W^{k,2}(ℝⁿ)`, with the pinned `MeasureTheory.Lp.exists_w1p_value_eq_of_memSobolev_one` as the order-one
inclusion `H^{1,2} ⊆ W^{1,2}`. Prove Calderón's agreement `W^{k,p}(ℝⁿ) = H^{k,p}(ℝⁿ)` for
`1 < p < ∞` and integer `k` (Stein, *Singular Integrals*, Chapter V, §3, Theorem 3), consuming
§2.3's Mihlin–Hörmander theorem for the multipliers `ξ^α (1 + 4π²|ξ|²)^{−k/2}`. The two scales
genuinely differ at `p = 1` and `p = ∞`, so the Bessel definition is never reused as the domain
theory.

- The identification commutes with weak derivatives and with Fourier multipliers of
  polynomial symbols.
- The norms are equivalent with constants depending on `n, k, p`; at `p = 2` the Plancherel
  identity gives explicit constants.

**Checks.**

- At `k = 0` both sides are `L²(ℝⁿ)` and the identification is the identity.
- For `u = 1_{[0,1]}` on `ℝ`, the Fourier transform decays like `1/|ξ|`, so
  `∫ (1 + 4π²ξ²)^{1/2} |û|²` diverges: `u ∉ H^{1,2}`, matching the absence of a weak derivative
  in `L²` (the distributional derivative is `δ₀ − δ₁`).
- The Gaussian `exp(−π|x|²)` is in both scales for every `k`, with `H^{k,2}` norm
  `(∫ (1 + 4π²|ξ|²)^k exp(−2π|ξ|²) dξ)^{1/2}`, finite for every `k`.
- The `2π` witness at `k = 1`, `p = 2` on `ℝ`: Mathlib's Bessel multiplier is `(1 + ξ²)^{1/2}`,
  so for `u = exp(−πx²)`, with `û = exp(−πξ²)`, the `H^{1,2}` norm squared is
  `∫ (1 + ξ²) exp(−2πξ²) dξ = (1/√2)(1 + 1/(4π))`, while the `W^{1,2}` norm squared
  `‖u‖₂² + ‖u'‖₂² = ∫ (1 + 4π²ξ²) exp(−2πξ²) dξ = (1/√2)(1 + π)`. The norms are equivalent with
  constants `1` and `4π²` on the derivative term, not equal; a model that drops the `2π`
  equates them.

*Needs:* Mathlib `TemperedDistribution.MemSobolev`, `Lp.toTemperedDistribution`; Tau Ceti
`MeasureTheory.Lp.exists_w1p_value_eq_of_memSobolev_one`; §2.3 Mihlin–Hörmander.

### 1.4 Embeddings (A4)

Consume Mathlib's Gagliardo–Nirenberg–Sobolev inequality and the pinned
`TauCeti.W1p0.sobolevEmbeddingL` for `1 ≤ p < n` on `W^{1,p}_0(Ω)`, and the pinned
`TauCeti.W1p.morreyRepresentative` for `n < p < ∞` on `ℝⁿ` with a Hölder representative of
exponent `1 − n/p`. Prove the `p = ∞` local and global Lipschitz representative theorem on its
stated domains: on `ℝⁿ` and on convex open sets a `W^{1,∞}` class has a representative that is
Lipschitz with constant `‖∇u‖_∞`; on a general open set only locally. Obtain domain-global
estimates `W^{1,p}(Ω) → L^{p*}(Ω)` and `W^{1,p}(Ω) → C^{0,1−n/p}(Ω̄)` through §1.6's extension
operator on bounded Lipschitz domains; on arbitrary open sets state interior estimates or use
the zero-extension class. For `n ≥ 2` build the critical `p = n` statements: `W^{1,n}_0(Ω)`
embeds into every `L^q(Ω)`, `q < ∞`, on bounded `Ω`, and into BMO on `ℝⁿ`, with the Trudinger
exponential integrability `∫_Ω exp((|u|/(C‖∇u‖_n))^{n/(n−1)}) ≤ C'|Ω|` (Gilbarg–Trudinger,
Theorem 7.15); not an `L^∞` embedding. Treat `n = 1`, `p = 1` by the absolutely continuous
representative of §1.1, which gives `‖u‖_∞ ≤ ‖u'‖_1` for `u ∈ W^{1,1}_0(a,b)`.

- The embedding constants depend only on `n, p` on `ℝⁿ` and on `W^{1,p}_0`, and additionally on
  the extension constant of `Ω` for `W^{1,p}(Ω)`.
- Higher-order embeddings `W^{k,p} → W^{k−1,p*}` follow by iteration and are stated with
  their exponent bookkeeping.

**Checks.**

- `u(x) = |x|^{−a}` near `0` in `ℝⁿ`: `u ∈ W^{1,p}` on the unit ball exactly when
  `(a + 1)p < n`, and `u ∈ L^{p*}` exactly when `a p* < n`; with `p* = np/(n − p)` the two
  conditions agree, so the Sobolev exponent is sharp.
- For `n = 2`, `p = 2`: `u(x) = log log(1 + 1/|x|)` is in `W^{1,2}` of the unit disk and
  unbounded, so the critical case has no `L^∞` embedding; it is in every `L^q`.
- For `n = 1`, `p = 1`: `u ∈ W^{1,1}_0(0,1)`, `u(x) = x(1 − x)`: `‖u‖_∞ = 1/4 ≤ ‖u'‖_1 = 1/2`.
- Morrey on `ℝ` with `p = 2`, exponent `1 − 1/2 = 1/2`: `u(x) = |x|^{3/4}` on `(−1, 1)` has
  derivative `(3/4)|x|^{−1/4}`, whose square `(9/16)|x|^{−1/2}` is integrable, so `u ∈ W^{1,2}`,
  and `u` is `3/4`-Hölder, hence `1/2`-Hölder as predicted. `v(x) = |x|^{1/4}` is `1/4`-Hölder
  and not `1/2`-Hölder; consistently, its derivative squared `(1/16)|x|^{−3/2}` is not
  integrable, so `v ∉ W^{1,2}` and Morrey makes no claim about it.

*Needs:* Mathlib `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`; Tau Ceti
`TauCeti.W1p0.sobolevEmbeddingL`, `TauCeti.W1p.morreyRepresentative`; §1.6 extension.

### 1.5 Poincaré and Sobolev–Poincaré (A5)

Zero-boundary Poincaré `‖u‖_p ≤ C‖∇u‖_p` on `W^{1,p}_0(Ω)` for bounded open `Ω` and finite `p`,
with the enclosing width as constant and no connectedness, is the pinned
`TauCeti.W1p.norm_value_le_mul_norm_gradient_of_subset_slab`. Prove it at `p = ∞` on the
closure-defined `W^{1,∞}_0(Ω)` from the Lipschitz representative. On a nonempty connected
bounded Lipschitz domain prove Poincaré–Wirtinger `‖u − u_Ω‖_p ≤ C(Ω, p)‖∇u‖_p` for finite `p`
(`exists_poincare_wirtinger` in `Suggested.lean`; Evans, §5.8.1, Theorem 1): use §1.6's
extension and Rellich compactness, a normalized contradiction sequence, and the fact that a
distributional zero gradient on a connected open set is constant. At `p = ∞` use the extension
and local Lipschitz representative and a finite connected chart-chain bound with its dependence
on the charts, not finite-`p` density. Boundedness or finite measure alone does not give the
mean-zero inequality. On finitely many components normalize each component separately and take
the maximum constant; for infinitely many components require a uniform component constant.
The convex and ball cases are the pinned `TauCeti.W1p.eLpNorm_value_sub_setAverage_le_of_convex`
and `…_of_eq_ball`. On balls prove the scale-compatible Sobolev–Poincaré inequality
`‖u − u_B‖_{L^{p*}(B)} ≤ C(n,p)‖∇u‖_{L^p(B)}` for `1 ≤ p < n`, which converts Caccioppoli into
§5.2's reverse-Hölder estimate.

- The Poincaré–Wirtinger constant scales linearly under dilation and is invariant under rigid
  motions.
- The componentwise theorem with uniform constants, and the failure of a single global mean
  on two disjoint balls.

**Checks.**

- `u(x) = x(1 − x)` on `(0, 1)`: `‖u‖₂² = 1/30`, `‖u'‖₂² = 1/3`, so `‖u‖₂/‖u'‖₂ = 1/√10`,
  below the sharp constant `1/π` of the interval; the enclosing-width constant `1` is not
  sharp but finite.
- On `ℝⁿ` the zero-boundary inequality fails: dilating a bump `u` to `u(x/R)` multiplies
  `‖u‖_p` by `R^{n/p}` and `‖∇u‖_p` by `R^{n/p − 1}`, so the ratio grows like `R`.
- Two disjoint balls `B₁ ∪ B₂` with `u = 1` on `B₁` and `u = −1` on `B₂`: `∇u = 0` while
  `u − u_Ω ≠ 0` for equal volumes, so connectedness is needed for the global mean-zero
  inequality; the componentwise version holds with constant `0` on each ball.
- Sobolev–Poincaré is dilation-invariant exactly at the exponent `p*`: replacing `u` by
  `u(x/R)` on `B(0,R)` multiplies `‖u − u_B‖_{L^{p*}(B)}` by `R^{n/p*}` and `‖∇u‖_{L^p(B)}` by
  `R^{n/p − 1} = R^{n/p*}`; any other target exponent `q` makes the ratio of the two sides a
  nonconstant power of `R`, so the inequality can hold for all balls only at `q = p*`.

*Needs:* Tau Ceti `TauCeti.W1p.norm_value_le_mul_norm_gradient_of_subset_slab`,
`TauCeti.W1p.eLpNorm_value_sub_setAverage_le_of_convex`; §1.4 Lipschitz representatives;
§1.6 extension and Rellich compactness.

### 1.6 Lipschitz domains, graph measure, trace, extension and Rellich (A6)

Define the Lipschitz-domain predicate for open subsets of `ℝ^{n+1}`: at each frontier point,
after a translation and a linear isometry, the domain inside an open cylinder of horizontal
radius `r` and vertical half-height `h` is exactly the region strictly above the graph of a
Lipschitz function of the first `n` coordinates (`IsLipschitzDomain` in `Suggested.lean`;
Grisvard, *Elliptic Problems in Nonsmooth Domains*, Definition 1.2.1.1). Supply restriction to
smaller charts, rigid-coordinate transport and positive dilation, and for bounded domains a
finite chart cover with explicit Lipschitz constants. Prove that `C¹` domains satisfy it by the
local-graph comparison; cone conditions are separate hypotheses and do not redefine the
predicate. The boundary measure is Mathlib's normalized Euclidean Hausdorff measure `μHE[n]`
restricted to the frontier.

Prove the **Lipschitz-graph surface measure**: for a Lipschitz `γ : U → ℝ` on an open
`U ⊆ ℝⁿ`, the restriction of `μHE[n]` to the graph of `γ` is the pushforward of the measure
`√(1 + ‖∇γ(x)‖²) dx` on `U` under `x ↦ (x, γ(x))`. Route: the graph map is injective and
Lipschitz with Lipschitz inverse (the projection), so the two measures are mutually absolutely
continuous with a density; identify the density at points of differentiability of `γ`
(Rademacher) by comparison with the tangent plane, where Mathlib's
`LinearMap.euclideanHausdorffMeasure_image_eq_normDet_mul_volume` gives the factor
`√(1 + ‖∇γ‖²)` for the linear graph map; the Lipschitz image bound
`LipschitzOnWith.hausdorffMeasure_image_le` controls the exceptional set. This is the
chart-integration formula that the trace below and GeometricMeasureTheory's BV trace both use;
it is owned here and is not the general area formula.

For `1 ≤ p < ∞` on a bounded Lipschitz domain construct the bounded trace
`T : W^{1,p}(Ω) → Lᵖ(∂Ω, μHE[n])` agreeing with restriction on functions continuous up to the
boundary, and prove `ker T = W^{1,p}_0(Ω)` in both directions by boundary charts, zero
extension and inward cutoff and mollification (`exists_trace` in `Suggested.lean`; Evans, §5.5,
Theorems 1 and 2). Construct the bounded extension operator `W^{1,p}(Ω) → W^{1,p}(ℝ^{n+1})`,
a right inverse of restriction, for every `1 ≤ p ≤ ∞` (`exists_extension`; Evans, §5.4,
Theorem 1 for `C¹` boundaries by reflection; Stein, *Singular Integrals*, Chapter VI, §3,
Theorem 5 for Lipschitz boundaries). At `p = ∞` retain the bounded trace from the Lipschitz
representative and its agreement with the finite-`p` traces, but not the kernel equality with
the full-norm closure `W^{1,∞}_0`, which is false. Keep zero extension and its precise trace
hypotheses separate from compact-support density. Prove Rellich compactness
`W^{1,p}(Ω) → Lᵖ(Ω)` on bounded Lipschitz domains for every `1 ≤ p ≤ ∞`
(`isCompactOperator_valueL_of_isLipschitzDomain`; Evans, §5.7, Theorem 1): for finite `p` by
extension and translation estimates, and at `p = ∞` through uniformly bounded equi-Lipschitz
extensions and Arzelà–Ascoli on the compact closure. The zero-boundary case on an arbitrary
bounded open set is the pinned `TauCeti.W1p0.isCompactOperator_valueL`; give its target ranges
`1 ≤ q < p*` if `p < n`, every finite `q` if `p = n`, and Hölder compactness below the Morrey
exponent if `p > n`. These constructions use no mean-zero Poincaré theorem; §1.5 consumes them.

- `IsLipschitzDomain` is invariant under rigid motions and dilations, and stable under
  shrinking the chart radius and height.
- The trace is linear, bounded with a constant depending on the chart data and `p`, local
  (it depends only on the function near the boundary), and equal to the endpoint map of §1.1
  on intervals.
- The extension operator has norm depending on the chart data and `p`, and preserves
  nonnegativity when built by reflection.

**Checks.**

- The open square `(0,1)²` is a Lipschitz domain: at a corner the graph function is
  `γ(s) = |s|` after a rotation by `π/4`, with constant `1`. The slit disk `B(0,1) ∖ [0,1) × {0}`
  is not: no cylinder about a slit point meets the domain in an epigraph. The cusp
  `{(s, t) : t > √|s|}` is not Lipschitz at the origin, since `√|s|` has no finite Lipschitz
  constant there. A plausible wrong definition through cone conditions alone accepts the cusp's
  complement.
- Graph measure for a linear `γ(x) = m · x` on `U`: the formula gives `√(1 + ‖m‖²) · |U|`; for
  `n = 1`, `γ(s) = s` on `(0, 1)` the graph has length `√2`, and `γ = 0` recovers Lebesgue measure
  of `U`, as the normalization `μHE[n] = volume` on a hyperplane requires. Mathlib's unnormalized
  `μH[n]` would give a different constant on the Euclidean norm, which is why the normalized
  measure is used.
- `u(x) = x` on `(0, 1)`: the trace is the pair `(0, 1)`, nonzero, and `u ∉ W^{1,p}_0`; `x(1 − x)`
  has trace `(0, 0)` and is in `W^{1,p}_0` for finite `p`. At `p = ∞`, `x(1 − x)` has zero
  trace but is not in the full-norm closure (§1.2), so the kernel equality fails at `p = ∞`.
- Rellich: `u_j(x) = sin(jx)/j` on `(0, π)` has `‖u_j‖₂² = π/(2j²) → 0` and `‖u_j'‖₂² = π/2`:
  the sequence is bounded in `H¹` and converges in `L²`, while `v_j = sin(jx)` is bounded in
  `L²` with no convergent subsequence, so compactness genuinely uses the gradient bound.
- The half-space `{x_{n+1} > 0}` satisfies the local predicate at every frontier point with
  `γ = 0` but is unbounded, so the bounded-domain theorems do not apply to it; the hyperplane
  trace of the pinned `TauCeti.W1p.hyperplaneTrace` is the whole-space `H¹` case.

*Needs:* Mathlib `MeasureTheory.Measure.euclideanHausdorffMeasure`,
`LinearMap.euclideanHausdorffMeasure_image_eq_normDet_mul_volume`,
`LipschitzOnWith.hausdorffMeasure_image_le`, `LipschitzWith.ae_differentiableAt`, Arzelà–Ascoli;
Tau Ceti `TauCeti.W1p0.extendByZeroL`, `TauCeti.W1p.hyperplaneTrace`,
`TauCeti.W1p0.isCompactOperator_valueL`; §1.2 density; §1.4 Lipschitz representatives.

### 1.7 Hölder and Campanato spaces (A7)

For `k = 0` the bounded globally `α`-Hölder functions on a metric space with the norm
`‖f‖_∞ + [f]_α` form the pinned Banach space `TauCeti.HolderSpace`. Define, for an open
`Ω ⊆ ℝⁿ`, integer `k ≥ 0` and `0 < α ≤ 1`, the globally finite-norm Banach space `C^{k,α}(Ω)`
of `Cᵏ` functions with bounded derivatives through order `k` and finite `α`-Hölder seminorm of
the `k`-th derivative, with norm the sum of the supremum norms of the iterated Fréchet
derivatives (in the continuous multilinear operator norm) through `k` and that seminorm;
prove completeness, the continuous inclusions between consecutive orders, restriction to
smaller open sets and the product and bounded-multiplication estimates. Define `C^{k,α}_loc(Ω)`
with its compact-exhaustion topology, and distinguish it from a Banach claim about all locally
Hölder functions. Include the bounded global variant `C_b^{k,α}(ℝⁿ)`, which Layer 6 consumes as
its spatial trace space. Define the Campanato spaces `𝓛^{p,λ}(Ω)` by the mean-oscillation
condition `sup_{x,r} r^{−λ} ∫_{B(x,r) ∩ Ω} |u − u_{x,r}|^p < ∞` and prove the Campanato
characterization: on a bounded Lipschitz domain and for `n < λ ≤ n + p`, `𝓛^{p,λ}(Ω) = C^{0,α}(Ω̄)`
with `α = (λ − n)/p` and equivalent norms (Giaquinta–Martinazzi, *An Introduction to the
Regularity Theory for Elliptic Systems*, Theorem 5.5); this is the excess-decay input of §5.3.

- `C^{k,α}(Ω) ⊆ C^{k,β}(Ω)` continuously for `β ≤ α` on bounded `Ω`, and the inclusion fails on
  `ℝⁿ` without the global bound.
- The Hölder seminorm of a product satisfies `[fg]_α ≤ ‖f‖_∞[g]_α + [f]_α‖g‖_∞`.
- The spatial trace of a `C_b^{k,α}` function of space-time at a fixed time lies in
  `C_b^{k,α}(ℝⁿ)` with the obvious norm bound.

**Checks.**

- `|x|^α` on `(−1, 1)` has `α`-Hölder seminorm exactly `1` and is in no `C^{0,β}` with `β > α`;
  `|x|` is `1`-Hölder (Lipschitz) with seminorm `1`.
- An exponent `α > 1` on a connected open set forces constancy: the difference quotient bound
  `|f(x) − f(y)| ≤ C|x − y|^α` gives derivative zero, so `C^{0,α}` with `α > 1` is the constants;
  a definition allowing `α > 1` is not wrong but empty, which is why `0 < α ≤ 1`.
- `sin(x)` on `ℝ` is in `C_b^{k,α}(ℝ)` for every `k, α` with norm bounded by `k + 2`; `x²` is in
  `C^{2,α}_loc(ℝ)` but in no `C_b^{k,α}(ℝ)`, since it is unbounded.
- Campanato on `(−1, 1)`, so `n = 1`, with `p = 2` and `u = |x|^α`: on `(−r, r)` the integral
  `∫ |u − u_r|²` scales like `r^{2α} · r`, so with `λ = 1 + 2α` the quotient `r^{−λ} · r^{1+2α}` is
  bounded and `u ∈ 𝓛^{2,1+2α}`, matching `α = (λ − n)/p`; the two-dimensional value
  `λ = 2 + 2α` would give the unbounded quotient `r^{−1}`, so the dimension in the exponent
  bookkeeping is load-bearing.

*Needs:* Mathlib `HolderOnWith`, `eHolderNorm`, `iteratedFDeriv`; Tau Ceti `TauCeti.HolderSpace`;
§1.6 Lipschitz domains for the Campanato characterization.

### Examples

The acceptance examples of this layer are the absolutely continuous identification on `(0,1)`
with the functions `x`, `|x|` and the Cantor function; the three endpoint counterexamples to
`W^{k,∞}` density (the constant `1` on `ℝⁿ`, `|x|` on `(−1,1)`, `x(1 − x)` on `(0,1)`); the
Poincaré constants on `(0,1)` and the dilation failure on `ℝⁿ`; the square, slit disk and cusp
for the Lipschitz predicate; the graph length `√2`; and `sin(jx)/j` for Rellich.

### Dependencies

Mathlib: distributions and test functions, the Lebesgue and Bochner integrals, convolution and
bump functions, the Gagliardo–Nirenberg–Sobolev inequality, Hausdorff measure, Rademacher,
Arzelà–Ascoli, Hölder seminorms. Tau Ceti: the Sobolev carriers, density theorems, embeddings,
Poincaré inequalities, hyperplane trace, zero extension, Rellich for `W^{1,p}_0`, Bessel
comparison and the bounded Hölder space, as listed in the supplier contracts. Within the
roadmap: §2.3 (Mihlin–Hörmander) for the `1 < p < ∞` Bessel comparison of §1.3 only.

## Layer 2: harmonic-analysis estimates

The estimate engine for Calderón–Zygmund regularity and Schauder theory. The Carleson project
(van Doorn–Thiele) carries the maximal function and covering machinery in Lean and is the
reference formalization to follow where Tau Ceti lacks a statement.

### 2.1 The Hardy–Littlewood maximal function (B8)

The centred maximal function `Mf(x) = sup_{r>0} ⨍_{B(x,r)} |f|` and its weak-type `(1,1)` bound
with constant `4ⁿ` are the pinned `TauCeti.maximalFunction` and
`TauCeti.mul_measure_lt_maximalFunction_le`; the Lebesgue differentiation theorem is Mathlib's
`VitaliFamily.ae_tendsto_average`. Prove the strong-type `(p,p)` bound for `1 < p < ∞`:
`‖Mf‖_p ≤ C(n,p)‖f‖_p` (`lintegral_maximalFunction_rpow_le` in `Suggested.lean`; the `p = ∞`
bound with constant `1` is the pinned `TauCeti.maximalFunction_le_eLpNormEssSup`; Stein,
*Singular Integrals*, Chapter I, §1, Theorem 1; Grafakos, *Classical Fourier Analysis*,
Theorem 2.1.6), by the pinned Marcinkiewicz engine
`TauCeti.lintegral_rpow_le_of_mul_meas_lt_le_of_le_eLpNormEssSup` between the weak `(1,1)` bound
and the trivial `L^∞` bound, with the constant blowing up like `(p − 1)^{−1}` as `p → 1`. Prove
the uncentred and the dyadic maximal functions comparable to `Mf` with dimensional constants,
and the vector-valued Fefferman–Stein inequality in the form Layer 7's square functions need:
`‖(Σ_j (M f_j)^2)^{1/2}‖_p ≤ C(n,p)‖(Σ_j |f_j|^2)^{1/2}‖_p` for `1 < p < ∞` (Grafakos, Theorem
5.6.6).

- `M` is sublinear, positively homogeneous and monotone, and `|f| ≤ Mf` almost everywhere.
- `Mf` is lower semicontinuous (pinned `TauCeti.lowerSemicontinuous_maximalFunction`).
- `M` commutes with translations and dilations, which fixes the constants' independence of
  scale.

**Checks.**

- `f = 1_{[0,1]}` on `ℝ`: `Mf(x) = 1` on `[0,1]` and `Mf(x) = 1/(2x)` for `x > 1`, attained at
  `r = x`; so `Mf ∉ L¹` while `t · |{Mf > t}| ≤ 1` for `t ≤ 1/2`, and `Mf ∈ Lᵖ` for every `p > 1`.
  A definition bounded on `L¹` is refuted.
- The constant `1` on `ℝⁿ` has `M1 = 1` (pinned `TauCeti.maximalFunction_const`), so the
  `L^∞` bound has constant `1`.
- `f = 0`: `Mf = 0` (pinned `TauCeti.maximalFunction_zero`), so no additive constant hides in
  the strong-type bound.
- On the zero-dimensional space every ball is the whole space and `Mf = |f|`, so the strong
  bound holds with constant `1`.

*Needs:* Tau Ceti `TauCeti.maximalFunction`, `TauCeti.mul_measure_lt_maximalFunction_le`,
`TauCeti.lintegral_rpow_le_of_mul_meas_lt_le_of_le_eLpNormEssSup`; Mathlib
`VitaliFamily.ae_tendsto_average`.

### 2.2 Interpolation (B9)

The diagonal Marcinkiewicz theorem, in distribution-function form between two finite exponents
and between a weak-type bound and an `L^∞` bound, is the pinned
`TauCeti.lintegral_rpow_le_of_meas_ofReal_lt_le` and `…_of_le_eLpNormEssSup`. Prove the
off-diagonal Marcinkiewicz theorem: a sublinear operator of weak types `(p₀, q₀)` and
`(p₁, q₁)` with `p_i ≤ q_i` is of strong type `(p, q)` along `1/p = (1−θ)/p₀ + θ/p₁`,
`1/q = (1−θ)/q₀ + θ/q₁` (Grafakos, Theorem 1.3.2). Prove the Riesz–Thorin theorem: a linear
operator defined on simple functions with `‖Tf‖_{q₀} ≤ M₀‖f‖_{p₀}` and `‖Tf‖_{q₁} ≤ M₁‖f‖_{p₁}`
satisfies `‖Tf‖_q ≤ M₀^{1−θ}M₁^θ‖f‖_p` on the interpolated exponents, with complex scalars and
Mathlib's three-lines theorem, including the endpoints `p_i, q_i = ∞` (Grafakos, Theorem 1.3.4).
Both carriers are maps defined on `L^{p₀} ∩ L^{p₁}` (equivalently on simple functions) with
values in `L^{q₀} + L^{q₁}`; define that sum space with its norm and prove that the two
extensions agree on the intersection. NoncommutativeIntegration consumes the scalar
Riesz–Thorin theorem from here.

- Riesz–Thorin's constant `M₀^{1−θ}M₁^θ` is exact, while Marcinkiewicz's degenerates at the
  endpoints.
- Both theorems hold for `σ`-finite measure spaces and for the counting measure, which gives
  Hausdorff–Young from the trivial `L¹ → L^∞` and Plancherel bounds.

**Checks.**

- The identity operator on `ℝ`: weak types `(1,1)` and `(∞,∞)` give strong type `(p,p)` with
  the engine's constant, which exceeds `1` and blows up as `p → 1`, although the true constant
  is `1`; a non-sharp constant is not a defect of the theorem.
- Hausdorff–Young from Riesz–Thorin: `‖f̂‖_∞ ≤ ‖f‖₁` and `‖f̂‖₂ = ‖f‖₂` interpolate to
  `‖f̂‖_{p'} ≤ ‖f‖_p` for `1 ≤ p ≤ 2`; for `p > 2` the inequality fails (a Gaussian with complex
  variance), so the hypothesis `p ≤ 2` is load-bearing.
- A sublinear operator that is of weak type `(1,1)` and *not* of strong type `(1,1)` is the
  maximal function of §2.1; Marcinkiewicz recovers its strong `(p,p)` bounds for `p > 1` and
  nothing at `p = 1`.

*Needs:* Mathlib's Hadamard three-lines theorem
(`Complex.HadamardThreeLines.norm_le_interpStrip_of_mem_verticalClosedStrip`,
`Mathlib/Analysis/Complex/Hadamard.lean:593`) and simple functions; Tau Ceti's Marcinkiewicz
engines.

### 2.3 Calderón–Zygmund theory (B10)

Prove the Calderón–Zygmund decomposition of an `L¹` function at height `t`: `f = g + Σ_k b_k`
with `‖g‖_∞ ≤ 2ⁿ t`, each `b_k` supported in a dyadic cube `Q_k` with `∫ b_k = 0` and
`Σ_k |Q_k| ≤ ‖f‖₁/t` (Grafakos, Theorem 5.3.1). Define a Calderón–Zygmund operator as a
**bounded linear operator on `L²(ℝⁿ)`** which, off the diagonal, is given by integration against
a standard kernel `K`: `|K(x,y)| ≤ A/|x−y|ⁿ`, and
`|K(x,y) − K(x,y')| + |K(y,x) − K(y',x)| ≤ A|y−y'|^δ/|x−y|^{n+δ}` for `|y−y'| ≤ |x−y|/2`, with
`Tf(x) = ∫ K(x,y) f(y) dy` for almost every `x` outside a compact set carrying `f`
(`CalderonZygmundOperator` in `Suggested.lean`; Stein, *Harmonic Analysis*, Chapter VII, §3;
Grafakos, §5.3). The `L²` bound is part of the hypothesis: kernel size and smoothness alone do
not give it. Prove that a Calderón–Zygmund operator is of weak type `(1,1)` and bounded on `Lᵖ`
for `1 < p < ∞`, with constants depending only on `n, p, A, δ` and `‖T‖_{L²→L²}`
(`CalderonZygmundOperator.eLpNorm_le`, `CalderonZygmundOperator.weakType_one`; Grafakos,
Theorem 5.3.3; Stein, *Harmonic Analysis*, Chapter VII, §3, Theorem 3), by the decomposition
for the weak endpoint, §2.2's Marcinkiewicz theorem for `1 < p < 2` and duality for `p > 2`.
Prove the Mihlin–Hörmander multiplier theorem: a symbol `m` on `ℝⁿ ∖ {0}` with
`|∂^α m(ξ)| ≤ C_α |ξ|^{−|α|}` for `|α| ≤ ⌊n/2⌋ + 1` defines, through Mathlib's
`FourierMultiplier` on tempered distributions, an operator bounded on `Lᵖ` for `1 < p < ∞`
(Grafakos, Theorem 6.2.7; Stein, *Singular Integrals*, Chapter IV, §3, Theorem 3), by showing
its kernel is a standard kernel and its `L²` norm is `‖m‖_∞`. A Calderón–Zygmund operator is
not bounded on `L¹` or on `L^∞`; the endpoints are weak `(1,1)` and `L^∞ → BMO` (§2.4), and an
`L¹` or `L^∞` bound is never stated.

- The kernel is determined by `T` off the diagonal, and two Calderón–Zygmund operators with
  the same kernel differ by a bounded multiplication operator; the operator, not the kernel, is
  the primitive datum.
- The class is closed under adjoints (with the transposed kernel) and under composition with
  bounded multiplications on the `L²` side.
- The Riesz transforms `R_j` with multiplier `−iξ_j/|ξ|` are Calderón–Zygmund operators with
  `‖R_j‖_{L²→L²} = 1` and kernel `c_n (x_j − y_j)/|x−y|^{n+1}`.

**Checks.**

- Multiplication by `x` on `ℝ`, `Tf(x) = x f(x)`: its off-diagonal kernel is `0`, which satisfies
  every size and smoothness estimate, yet for `f = 1_{[R,R+1]}`, `‖f‖₂² = 1` while
  `‖Tf‖₂² = ∫_R^{R+1} x² dx = R² + R + 1/3 → ∞`. It is not `L²`-bounded, hence not a
  Calderón–Zygmund operator; a definition by kernel bounds alone admits it and would claim a
  false `Lᵖ` bound.
- The Hilbert transform `H` on `ℝ`, multiplier `−i sign ξ`, kernel `1/(π(x−y))`: `‖H‖_{L²→L²} = 1`,
  `A = 1/π`, `δ = 1`; it is an instance. `H 1_{[0,1]}(x) = (1/π) log|x/(x−1)|` decays like
  `1/(π|x|)` at infinity, so `H 1_{[0,1]} ∉ L¹`: the weak `(1,1)` endpoint is sharp.
- The identity is a Calderón–Zygmund operator with kernel `0` (bounded on `L²`), so the class
  contains the trivial case and the theorem's constants are at least `1`.
- For the multiplier theorem, `m(ξ) = sign ξ` on `ℝ` satisfies the derivative bounds with
  `⌊1/2⌋ + 1 = 1` derivative away from `0` and gives `H`; the symbol `m(ξ) = 1_{ξ > 0}` of the
  Riesz projection satisfies them too; `m(ξ) = ξ` does not (unbounded), matching that `d/dx` is
  unbounded on every `Lᵖ`.

*Needs:* §2.1 maximal function and dyadic cubes; §2.2 Marcinkiewicz; Mathlib
`FourierMultiplier`, Plancherel.

### 2.4 Gehring, BMO and VMO (B11)

Prove Gehring's lemma: a nonnegative `g ∈ L^q_loc` satisfying the reverse Hölder inequality
`(⨍_B g^q)^{1/q} ≤ C ⨍_{2B} g + (⨍_{2B} h^q)^{1/q}` on all balls lies in `L^{q+ε}_loc` with an
explicit estimate, `ε = ε(n, q, C) > 0` (Gehring, *Acta Math.* 130 (1973), Lemma 3;
Giaquinta–Martinazzi, Theorem 6.38). Define `BMO(ℝⁿ)` with the seminorm
`sup_B ⨍_B |f − f_B|`, prove the John–Nirenberg inequality
`|{x ∈ B : |f − f_B| > t}| ≤ C₁|B| exp(−C₂ t/‖f‖_{BMO})` (Grafakos, *Modern Fourier Analysis*,
Theorem 3.1.6) and the `L^∞ → BMO` bound for Calderón–Zygmund operators. Prove the
Coifman–Rochberg–Weiss commutator theorem: for a Calderón–Zygmund operator `T` and
`b ∈ BMO`, `‖[b, T]‖_{Lᵖ→Lᵖ} ≤ C(n,p,T)‖b‖_{BMO}` for `1 < p < ∞` (Coifman–Rochberg–Weiss,
*Ann. of Math.* 103 (1976), Theorem I). Define `VMO(ℝⁿ)` as the functions of vanishing mean
oscillation with the modulus `η(r) = sup_{|B| ≤ r} ⨍_B |f − f_B|`, prove Sarason's
characterization as the BMO-closure of the uniformly continuous functions (Sarason, *Trans.
Amer. Math. Soc.* 207 (1975), Theorem 1), and the small-radius commutator estimate
`‖[b, T]‖_{Lᵖ(B_r)→Lᵖ(B_r)} ≤ C η_b(r)` which is the perturbative engine of §5.2 and §5.7.

- `L^∞ ⊆ BMO` with `‖f‖_{BMO} ≤ 2‖f‖_∞`, and `log|x| ∈ BMO(ℝⁿ) ∖ L^∞`.
- The BMO seminorm is invariant under translations and dilations and vanishes exactly on the
  constants.
- `VMO` is a closed subspace of `BMO` containing `C_c^∞`, and `η_b(r) → 0` is equivalent to
  membership.

**Checks.**

- `f = log|x|` on `ℝ`: for `B = (−r, r)`, `⨍_B |f − f_B|` is independent of `r` (dilation
  invariance), so `f ∈ BMO`; `f` is unbounded; and `η_f(r)` does not tend to `0`, so
  `f ∉ VMO`, while `log log(1/|x|)` near `0` smoothed at infinity is in `VMO`.
- John–Nirenberg forces exponential integrability of `|f − f_B|` at every rate below
  `C₂/‖f‖_{BMO}`: for `f = log|x|` on `(−1,1)`, `f_B = −1` and `∫ exp(c|f + 1|) ≈ ∫ |x|^{−c}`
  is finite exactly for `c < 1`, so `C₂ ≤ ‖log|x|‖_{BMO}`, a non-vacuous bound on the constant.
- Gehring with `q = 2` and `g = |x|^{−a}` on the unit ball of `ℝⁿ`: the reverse Hölder
  inequality holds for `a < n/2` with a constant depending on `a`, and the conclusion
  `g ∈ L^{2+ε}` holds exactly for `(2+ε)a < n`; so `ε(n, 2, C) → 0` as `a ↑ n/2`, and no
  universal `ε` exists, which a plausible wrong statement with `ε` independent of `C` claims.
- The commutator `[b, H]` with `b(x) = x` on `ℝ`: `[b,H]f(x) = (1/π)∫ f(y) dy`, since the
  kernel `(x − y)/(x − y)` is `1`; this rank-one operator is unbounded on `Lᵖ` for `p > 1`, and
  consistently `b = x ∉ BMO`.

*Needs:* §2.1 maximal function; §2.3 Calderón–Zygmund operators; Mathlib `eLpNorm`,
dyadic cubes from §2.3.

### Examples

The acceptance examples of this layer are `M 1_{[0,1]}` with its `1/(2x)` tail; Hausdorff–Young
from Riesz–Thorin; the multiplication operator `x f(x)` as a non-instance and the Hilbert
transform as an instance of the Calderón–Zygmund class, with `H 1_{[0,1]} ∉ L¹`; and
`log|x| ∈ BMO ∖ (L^∞ ∪ VMO)`.

### Dependencies

Layer 1 for `Lᵖ` spaces and Sobolev classes only through Mathlib; Tau Ceti's maximal function
and Marcinkiewicz engines; Mathlib's Fourier multipliers, Plancherel and the three-lines
theorem. No later layer is used.

## Layer 3: maximum principles and potential theory

Except for the Aleksandrov–Bakelman–Pucci estimate this is the classical constant-coefficient
theory, much of whose `n = 2` case and harmonic-function theory is in Mathlib and Tau Ceti.
The estimate is a variable-coefficient extension with its own convex-geometric lemmas, built
inside §3.2.

### 3.1 Mean values and harmonic functions (C12)

Consume Mathlib's `HarmonicOnNhd` and its mean-value characterization on inner-product spaces,
and the pinned Harnack inequality and strong maximum principle for harmonic functions
(`IsCompact.harnack_inequality`, `TauCeti.eqOn_const_of_harmonicOnNhd_of_isMaxOn`). Prove the
converse: a continuous function on an open `Ω ⊆ ℝⁿ` with the mean-value property on every ball
in `Ω` is smooth and harmonic (Evans, §2.2.3, Theorem 3), by mollification with a radial kernel,
which fixes the function; derive interior derivative estimates
`|D^α u(x₀)| ≤ C(n,k) r^{−n−k}‖u‖_{L¹(B(x₀,r))}` for `|α| = k` (Evans, §2.2.3, Theorem 7) and
Liouville's theorem in every dimension.

- Harmonic functions are real analytic (Evans, §2.2.3, Theorem 10).
- Weyl's lemma: a locally integrable function that is weakly harmonic is almost everywhere
  equal to a harmonic function.

**Checks.**

- `u(x,y) = x² − y²` on `ℝ²`: the average over the circle of radius `r` about `(a,b)` is
  `a² − b²`, confirming the mean-value property; `v(x,y) = x²` averages to `a² + r²/2 ≠ a²`, so
  it is not harmonic, matching `Δv = 2`.
- `u = |x|^{2−n}` on `ℝⁿ ∖ {0}`, `n ≥ 3`, is harmonic there (pinned
  `TauCeti.PDE.harmonicOnNhd_newtonianKernel`) but has no harmonic extension across `0`: the
  mean-value property fails on balls containing `0`.
- Liouville: `u = x₁` is harmonic and unbounded; a bounded harmonic function on `ℝⁿ` is
  constant, and the derivative estimate at radius `r → ∞` gives `|∇u| ≤ C r^{−1}‖u‖_∞ → 0`.
- Weyl's lemma non-example: `u = 1_{x₁ > 0}` on `ℝⁿ` is locally integrable and not weakly
  harmonic, since `∫ u Δφ = −∫_{x₁=0} ∂₁φ ≠ 0` for suitable `φ`.

*Needs:* Mathlib `HarmonicOnNhd`, `ContDiffBump`; Tau Ceti `IsCompact.harnack_inequality`,
`TauCeti.eqOn_const_of_harmonicOnNhd_of_isMaxOn`.

### 3.2 Maximum principles, the Hopf lemmas and the Aleksandrov–Bakelman–Pucci estimate (C13)

The weak maximum principle for weak solutions of divergence-form equations with `c ≥ 0` is the
pinned `TauCeti.PDE.value_le_of_energyFormH1_le` and
`UniformlyEllipticOn.value_le_of_small_drift_of_subset_ball`. Prove the classical weak maximum
principle for non-divergence `L u = aⁱʲ∂ᵢⱼu + bⁱ∂ᵢu + cu` on a bounded open `Ω` for
`u ∈ C²(Ω) ∩ C(Ω̄)` with `Lu ≥ 0`, `|b|/λ` bounded, in the two forms `c = 0` and `c ≤ 0`
(Gilbarg–Trudinger, Theorem 3.1 and Corollary 3.2), the comparison principle for `Lu ≥ Lv` with
`u ≤ v` on the boundary, and the strong maximum principle for connected `Ω`
(Gilbarg–Trudinger, Theorem 3.5). The strong maximum principle for divergence-form weak
solutions does not go through the Hopf lemma; it follows from the weak Harnack inequality of
§5.4 (Gilbarg–Trudinger, Theorem 8.19).

**The classical Hopf boundary-point lemma** (`hopf_boundary_point` in `Suggested.lean`;
Gilbarg–Trudinger, Lemma 3.4), in Gilbarg–Trudinger's sign convention: `a` symmetric with
`λ‖ξ‖² ≤ ξ · a(x)ξ ≤ Λ‖ξ‖²` (the barrier needs the upper bound as well), `b` and `c` bounded on
`Ω`, no continuity of the coefficients; `u ∈ C²(Ω)` with `Lu ≥ 0` pointwise; `x₀ ∈ ∂Ω` with an
interior ball `B ⊆ Ω`, `x₀ ∈ ∂B`; `u` continuous at `x₀` relative to `Ω` and `u(x₀) > u(x)` for
every `x ∈ Ω`; and `c = 0`, or `c ≤ 0` with `u(x₀) ≥ 0`, or `u(x₀) = 0` with no sign on `c`.
Conclusion: with `ν` the outer normal of `B` at `x₀`, the inward difference quotients
`(u(x₀) − u(x₀ − tν))/t` are bounded below by a positive constant for all small `t > 0`, so
the outer normal derivative, if it exists, is positive. State this form as the theorem and the
derivative form as a corollary carrying the existence hypothesis; minimum versions follow by
`u ↦ −u` and are not separate targets. The proof is the exponential barrier
`exp(−κ|x − y|²) − exp(−κR²)` on an annulus of `B` together with the classical weak maximum
principle above. The Hopf lemma does not inherit the standing bounded-measurable hypotheses:
in the half disk take `a = e_r ⊗ e_r + s² e_θ ⊗ e_θ` with `s > 1` and `u = r^s sin θ`; then `a`
is uniformly elliptic and bounded measurable, `div(a∇u) = 0`, `u > 0` inside, `u(0) = 0`, and
the inward normal derivative at the origin vanishes since `u` vanishes to order `s > 1`.

**The divergence-form Hopf lemma for weak solutions** is a separate target in dimension
`n ≥ 2`, carrying the contract of its source (Rosales, *Generalizing Hopf's boundary point
lemma*, arXiv:1806.07003, Theorem 4.1 with Remark 4.2, which assumes `n ≥ 2` throughout):
operator `Dᵢ(aⁱʲDⱼu + bⁱu) + cⁱDᵢu + du` on the unit ball with `aⁱʲ` and `bⁱ` in `C^{0,α}` on the
closed ball, `cⁱ ∈ L^q`, `d ∈ L^{q/2} ∩ L^{1,α}` (the Morrey space of exponent `α`) with `q > n`
and `0 < α < 1`; `b, d` weakly non-positive; `aⁱʲ` symmetric at the boundary point `−eₙ`;
`u ∈ C ∩ W^{1,2}` a weak supersolution with `u(x) > u(−eₙ)` on the ball and `u(−eₙ) ≤ 0`.
Conclusion: `liminf_{h↓0} u((h − 1)eₙ)/h > 0`. The restriction to an interior ball and the
affine rescaling to that normal form are part of the target; the proof consumes Morrey's
`C^{1,α}` estimate (§5.3), the weak-solution existence theorem Gilbarg–Trudinger 8.34 and a weak
maximum principle for weak solutions, all named inputs; a normal-derivative conclusion needs a
boundary `C^{1,α}` regularity theorem as a further input. The source's `n ≥ 2` is not dropped:
at `n = 1` its hypothesis `q > n` admits `q = 3/2`, hence `d ∈ L^{3/4}`, which is not a normed
space, so the theorem is not stated there. The one-dimensional statement is a separate target
by the flux argument of §1.1: for `−(au' + bu)' + cu' + du ≤ 0` on `(−1, 1)` with
`a ∈ C^{0,α}`, `a ≥ λ > 0`, `b ∈ C^{0,α}`, `c, d ∈ L^q` for some `q > 1`, `b, d` weakly
non-positive, and `u ∈ W^{1,2}` continuous with `u > u(−1) = 0` on `(−1, 1)`, the flux
`a u' + b u` is absolutely continuous and `liminf_{h↓0} u(−1 + h)/h > 0`.

**The Aleksandrov–Bakelman–Pucci estimate** for scalar non-divergence-form strong solutions,
the maximum-principle input of §5.5: for `u ∈ W^{2,n}_loc(Ω) ∩ C(Ω̄)` on a bounded open `Ω` with
`aⁱʲ∂ᵢⱼu ≥ f` almost everywhere, `a` measurable and symmetric positive definite with
`D* = (det a)^{1/n} > 0` and `f/D* ∈ Lⁿ(Ω)`, the bound
`sup_Ω u ≤ sup_{∂Ω} u⁺ + C(n) diam(Ω) ‖f⁻/D*‖_{Lⁿ(Γ⁺)}` holds, where `Γ⁺` is the upper contact
set of `u` (Gilbarg–Trudinger, Theorem 9.1; Lemmas 9.2 and 9.3 for the inputs). Own the
convex-envelope and contact-set construction: for smooth approximants with nonnegative boundary
values extend `min(u, 0)` by `0` to a larger enclosing ball and construct its lower convex
envelope; identify the interior negative contact set; prove the inclusion of the ball of radius
`sup|u|/diam` in the gradient image of the contact set; and bound that image measure by
`∫_Γ |det D²u|` using Mathlib's `MeasureTheory.addHaar_image_le_lintegral_abs_det_fderiv` for the
`C¹` map `∇u` on the closed contact set of a `C²` approximant, with the determinant-to-trace
inequality `det D²u ≤ (aⁱʲ∂ᵢⱼu / (n D*))ⁿ` on the contact set, where `D²u ≥ 0`. Exhaust and
approximate to the `W^{2,n}` statement with `Lⁿ` right-hand side; the right-hand side is
continuous in `W^{2,n}`. Neither the general area formula nor Alexandrov's twice
differentiability is used.

- Weak and strong maximum principles are stated with the sign condition as a named
  hypothesis; a Check records that it is necessary.
- The comparison principle gives uniqueness for the classical Dirichlet problem under `c ≤ 0`.
- The Hopf lemma's constants depend on `n, λ, Λ, R` and the bounds on `b, c`.

**Checks.**

- Sign condition: `u = sin x` on `(0, π)` satisfies `u'' + u = 0`, so `Lu = 0` for `c = 1 > 0`,
  with interior maximum `1` and boundary values `0`: the weak maximum principle fails without
  `c ≤ 0` (in the roadmap's sign, without `c ≥ 0`); `u = x(1−x)` with `u'' = −2 ≤ 0` attains
  its maximum `1/4` inside and is a supersolution, consistent with the principle for
  subsolutions only.
- Classical Hopf on `(−1, 1)` with `a = 1`, `b = c = 0`, `v = −(x + 1)`: `v'' = 0 ≥ 0`, strict
  maximum `0` at `x₀ = −1` with outer normal `ν = −1`, and `(v(−1) − v(−1 + t))/t = 1 > 0`.
  The same function with the roles reversed, `u = x + 1`, is the instance the one-dimensional
  weak version must produce: `u` vanishes at `−1` with inward quotient `1`; the `n ≥ 2` theorem
  does not claim it.
- The half-disk example `u = r^s sin θ`, `s > 1`: in polar coordinates
  `∇u = s r^{s−1} sin θ e_r + r^{s−1} cos θ e_θ` and `a∇u = s r^{s−1} sin θ e_r + s² r^{s−1} cos θ e_θ`, and
  `div(a∇u) = r^{−1}∂_r(s r^s sin θ) + r^{−1}∂_θ(s² r^{s−1} cos θ) = s² r^{s−1} sin θ − s² r^{s−1} sin θ = 0`;
  `a` has eigenvalues `1` and `s²`; `u(0,y) = y r^{s−1} → 0` faster than `y`, so the inward
  derivative at `0` is `0`. A statement of Hopf for bounded measurable divergence-form
  coefficients is refuted.
- Aleksandrov–Bakelman–Pucci for `u = (|x|² − 1)/(2n)` on the unit ball: `Δu = 1`, `u = 0` on the
  boundary, `inf u = −1/(2n)`; the estimate with `a = I`, `D* = 1`, `f = 1` on the lower contact
  set, which is the whole ball, gives `−inf u ≤ C(n) · 2 · |B|^{1/n}`, consistent, and the
  gradient image of the contact set is the ball of radius `1/n`, with
  `|∇u(B)| = ∫_B det D²u = |B| n^{−n}` exactly, which is the equality case of the Jacobian
  inequality.

*Needs:* Mathlib `MeasureTheory.addHaar_image_le_lintegral_abs_det_fderiv`, convex hulls,
`ContDiffOn`; Tau Ceti `TauCeti.PDE.value_le_of_energyFormH1_le`; §1.1 absolutely continuous
representatives for the one-dimensional weak Hopf lemma; §5.3 and §5.4 are named inputs of the
divergence-form Hopf lemma only.

### 3.3 Harnack inequalities (C14)

Harnack's inequality for nonnegative harmonic functions is pinned
(`IsCompact.harnack_inequality`). Prove it in scale-invariant form on balls,
`sup_{B(x,r)} u ≤ 3ⁿ inf_{B(x,r)} u` for nonnegative harmonic `u` on `B(x,3r)`, derive the
Harnack convergence theorems (monotone limits of harmonic functions are harmonic or
identically infinite), and state the Harnack inequality for nonnegative weak solutions of
divergence-form equations with bounded measurable coefficients as the target of §5.4, and for
nonnegative strong solutions of non-divergence equations as the target of §5.5: this section
owns only the harmonic case and the interface.

- On concentric balls `B(x,r) ⊂ B(x,R)` the Poisson-kernel bounds give the Harnack ratio
  `((R + r)/(R − r))ⁿ`, equal to `2ⁿ` at `r = R/3` and below the pinned constant `3ⁿ` of
  `InnerProductSpace.HarmonicOnNhd.le_three_pow_mul_of_nonneg`.
- Harnack's inequality for nonnegative solutions is false for sign-changing solutions, so the
  nonnegativity hypothesis is named.

**Checks.**

- `u = 1 + x₁` on `B(0,1)`: nonnegative harmonic with `sup = 2`, `inf = 0` on the closed ball,
  so no Harnack inequality holds up to the boundary, while on `B(0,1/3)` the ratio is `2`,
  below `3ⁿ`.
- Sign-changing `u = x₁` on `B(0,1)`: `inf = −1`, so the inequality `sup ≤ C inf` is false,
  which the nonnegativity hypothesis excludes.
- The Poisson kernel `P(x, ξ) = (1 − |x|²)/|x − ξ|ⁿ` on the unit ball, `|ξ| = 1`, is a nonnegative
  harmonic function of `x` whose ratio on `B(0,r)` is at most `((1+r)/(1−r))ⁿ`, the sharp
  Harnack constant, and a plausible wrong constant below it is refuted at `r → 1`.

*Needs:* Tau Ceti `IsCompact.harnack_inequality`,
`InnerProductSpace.HarmonicOnNhd.le_three_pow_mul_of_nonneg`; §3.4 Poisson kernel.

### 3.4 Fundamental solution, Green functions and Perron's method (C15)

The fundamental solution `Φ` of `−Δ` in every dimension, the Green and Poisson kernels of the
unit ball and Perron's harmonic upper solution are pinned (`TauCeti.newtonianKernel`,
`ballGreenKernel`, `ballPoissonKernel`, `harmonicOnNhd_perronSolution`). Prove the Newtonian
potential theorem: for `f ∈ C_c^∞(ℝⁿ)`, `Φ * f` is smooth and `−Δ(Φ * f) = f` (Evans, §2.2.1,
Theorem 1), with the convolution sign and normalization in each dimension including `n = 1, 2`;
for a ball, construct the harmonic correction `H_B` from the trace of `Φ * f` on the sphere
by the Poisson integral and prove the Green representation `G_B f = Φ * f − H_B(trace(Φ * f))`
with actual trace and weak equality and uniqueness, first for smooth compactly supported data
and then for `L²` data through the weak solution map of §4.2. Construct the half-space Green
function and Poisson kernel by reflection. Prove that Perron's solution attains continuous
boundary data at every regular boundary point, with the barrier characterization of regular
points and the exterior-sphere and exterior-cone conditions as sufficient conditions
(Gilbarg–Trudinger, Theorems 2.12 and 2.14); boundary attainment is a separate statement from
harmonicity, which holds on any bounded open set.

- `Φ * f` for `f ∈ Lᵖ` with compact support lies in `W^{2,p}_loc` for `1 < p < ∞` (this is the
  constant-coefficient Calderón–Zygmund estimate of §5.7, recorded here as an interface).
- The Green function of the ball is symmetric, positive inside, zero on the sphere and
  dominated by `Φ`.
- Perron's solution is monotone in the data and unique among bounded harmonic functions
  attaining the data at regular points when all points are regular.

**Checks.**

- Unit ball in `ℝ³`, `f = 1`: the Newtonian potential of the ball is `(3 − |x|²)/6` inside,
  with `−Δ((3 − |x|²)/6) = 1`; its trace on the sphere is `1/3`, the harmonic correction is the
  constant `1/3`, and the Dirichlet Green potential is `u = (1 − |x|²)/6`, which vanishes on the
  sphere and solves `−Δu = 1`. Assigning zero boundary values to the uncorrected potential is
  the plausible wrong model.
- `n = 2`: `Φ(x) = −(1/2π) log|x|` satisfies `−ΔΦ = δ₀` in the sense that
  `∫ Φ Δφ = −φ(0)`; a sign error gives `+φ(0)`, detected by `φ` radial with `φ(0) = 1`.
- Lebesgue's spine: the complement of a sufficiently thin cusp in `ℝ³` has an irregular boundary
  point, so Perron's solution for continuous data need not attain the data there, while every
  boundary point of a domain with the exterior-cone condition is regular. In `ℝ²` an isolated
  boundary point is irregular (the singularity is removable), and a boundary point that is the
  endpoint of a nondegenerate continuum in the complement is regular.
- For the half-space `ℝⁿ × (0, ∞)` with boundary `ℝⁿ`, the Poisson kernel
  `c_n t/(|x − y|² + t²)^{(n+1)/2}` integrates to `1` over the boundary for every `t > 0`, which
  fixes `c_n = Γ((n+1)/2)/π^{(n+1)/2}`.

*Needs:* Tau Ceti `TauCeti.newtonianKernel`, `ballGreenKernel`, `ballPoissonKernel`,
`TauCeti.perronSolution`; Mathlib convolution; §1.6 trace; §4.2 weak solution map for the `L²`
representation only.

### Examples

The acceptance examples of this layer are the mean-value computation for `x² − y²`; the
sign-condition counterexample `sin x`; the one-dimensional Hopf instance `x + 1`; the half-disk
counterexample `r^s sin θ`; the Aleksandrov–Bakelman–Pucci equality case `(|x|² − 1)/(2n)`; and
the ball example `u = (1 − |x|²)/6` joining the Newtonian potential, the harmonic correction and
the Dirichlet problem.

### Dependencies

Layer 1 (§1.1 for the one-dimensional weak Hopf lemma, §1.6 for traces); Mathlib's harmonic
functions, convolution and the Jacobian inequality; Tau Ceti's potential theory and maximum
principles. The divergence-form Hopf lemma names §5.3 and §5.4 as inputs; nothing else in this
layer depends on Layers 4–5.

## Layer 4: linear elliptic existence by the energy method

The shortest path to a genuine existence theorem, since Lax–Milgram is in Mathlib and the
energy form, the coercive Dirichlet problem with `L²` forcing, the mass-shift Fredholm
alternative and the symmetric spectrum are in Tau Ceti. This layer assembles Layer 1 with those
and adds `H⁻¹` forcing, liftings, the full compatibility condition and the `−Δ` instance.

### 4.1 Weak formulation and Gårding's inequality (D16)

The energy bilinear form `B(u, v) = ∫_Ω (∇v · a∇u + (b · ∇u) v + c u v)` on `H¹(Ω)` and `H¹₀(Ω)`,
bounded when the energy density is essentially bounded, is the pinned
`TauCeti.PDE.energyFormH1` and `energyFormH1L0`. Prove Gårding's inequality
`B(u, u) ≥ C₀‖u‖²_{H¹} − β‖u‖²_{L²}` on `H¹₀(Ω)` for every inverse-coercive `a` with constants
`λ, Λ` and bounded `b, c`, with `C₀ = λ/2` and `β = ‖b‖²_∞/(2λ) + ‖c‖_∞ + λ/2` (Evans, §6.2.2,
Theorem 2), using coercivity of `a` for the lower bound and no symmetry. Prove the adapter
between the two ellipticity predicates: an inverse-coercive pair `(λ, Λ)` almost everywhere
gives essentially bounded energy density with the mixed bound `|ζ · a(x)ξ| ≤ Λ‖ζ‖‖ξ‖` and hence
boundedness of `B` with the same `Λ`, and conversely the pinned pointwise predicate with
constants `(λ, M)` gives the inverse-coercive pair `(λ, M²/λ)`; the constants are never
identified. With homogeneous boundary data `u = g̃ + w`, `w ∈ H¹₀`, the weak problem for `u` is
the homogeneous problem for `w` with forcing `ℓ − B(g̃, ·)`.

- `B` is continuous on `H¹(Ω) × H¹(Ω)` with norm at most `Λ + ‖b‖_∞ + ‖c‖_∞`.
- `B` is symmetric exactly when `b = 0` and `a` is almost everywhere symmetric (pinned
  `energyFormH1_comm_of_isSymm_ae` for the forward direction).
- For `c ≥ 0` and `b = 0`, `B` is coercive on `H¹₀(Ω)` of a bounded `Ω` with constant
  `λ/(1 + C_P²)`, `C_P` the Poincaré constant (pinned `energyFormH1_poincare_constant_pos`).

**Checks.**

- `a = I`, `b = 0`, `c = −2` on `(0, π)`, `u = sin x`: `B(u, u) = ∫ cos² − 2∫ sin² = π/2 − π = −π/2`,
  `‖u‖²_{H¹} = π`, `‖u‖²_{L²} = π/2`; Gårding with `C₀ = 1/2`, `β = 2` reads `π/2 ≤ −π/2 + π`,
  an equality: the shift is needed and this is its size.
- `a = [[1, −1], [1, 1]]` on `ℝ²`: `ξ · aξ = ‖ξ‖²`, and the constant antisymmetric part
  contributes `∫ (∂₁u ∂₂v − ∂₂u ∂₁v) = ∫ ∇u · J∇v = −∫ u div(J∇v) = 0` for `u, v ∈ H¹₀`, so `B` is
  the Dirichlet form; the mixed bound holds with `Λ = 2` (inverse-coercive) and the operator
  bound with `M = √2`. With the variable field `a(x) = I + x₁J`, `J = [[0, −1], [1, 0]]`, on the
  unit disk, `B(u, v) − B(v, u) = 2∫ x₁ ∇u · J∇v = −2∫ u ∂₂v`, which for `u = ψ`, `v = x₂ψ` and a
  bump `ψ` equals `−∫ ψ² ≠ 0`: `B` is not symmetric, although `ξ · a(x)ξ = ‖ξ‖²` still.
- `c = 0`, `b = 0`, `Ω = ℝⁿ`: `B(u, u) = ∫ ∇u · a∇u ≥ λ‖∇u‖²` but no Poincaré inequality, so
  `B` is not coercive on `H¹(ℝⁿ)`; the dilation family of §1.5 is the witness.
- The adapter at `a = [[1, −k], [k, 1]]`: inverse-coercive constants `(1, 1 + k²)`, operator
  constants `(1, √(1 + k²))`, and the conversion operator-to-inverse gives `(1, 1 + k²)`,
  which is exact here, while inverse-to-operator gives `(1, 1 + k²) ≥ (1, √(1 + k²))`, which is
  not; so neither conversion is an identity of constants.

*Needs:* Tau Ceti `TauCeti.PDE.energyFormH1`, `energyFormH1L0`; §1.5 Poincaré; the
Conventions' ellipticity predicates.

### 4.2 Existence and uniqueness in the coercive case (D17)

Existence and uniqueness of the weak solution `u ∈ H¹₀(Ω)` of `B(u, ·) = ∫ f ·` for `f ∈ L²(Ω)`
and a bounded coercive form, through Lax–Milgram, is the pinned
`TauCeti.PDE.existsUnique_isWeakSolutionDirichlet`, with the Poisson instance
`existsUnique_isWeakSolutionDirichlet_laplacian_of_subset_ball` on every open set inside a
ball and the a priori bound `norm_le_of_isWeakSolutionDirichlet`. For `ℓ ∈ H⁻¹(Ω) = (H¹₀(Ω))*`
the same conclusion is Lax–Milgram applied directly, the pinned
`IsCoercive.solutionOfFunctional`. Prove the Dirichlet problem with boundary data
(`existsUnique_weakSolution_lifting` in `Suggested.lean`; Evans, §6.2.2, Theorem 3 with the
lifting of §6.2.1): for a bounded coercive form, every `g ∈ H¹(Ω)` and every `ℓ ∈ H⁻¹(Ω)` there
is exactly one `u ∈ H¹(Ω)` with `u − g ∈ H¹₀(Ω)` and `B(u, v) = ℓ(v)` for all `v ∈ H¹₀(Ω)`. On
rough open sets this quotient condition defines the Dirichlet data; on bounded Lipschitz
domains prove that `u − g ∈ H¹₀(Ω)` is equivalent to `T u = T g` by §1.6's kernel theorem, so
the boundary condition is the trace condition `u|_{∂Ω} = g|_{∂Ω}`.

- The solution map `(g, ℓ) ↦ u` is linear and bounded with constant depending on the
  coercivity constant and `‖B‖`.
- The solution depends continuously on `a, b, c` in `L^∞` for fixed coercivity constants.
- For symmetric `B` the solution minimizes `½B(u,u) − ℓ(u)` over the affine space `g + H¹₀`.

**Checks.**

- `−u'' = 1` on `(0, 1)` with `u(0) = u(1) = 0`: `u = x(1 − x)/2`; with the lifting `g = x`
  the solution of the same equation with boundary values `0, 1` is `u + x`, and
  `(u + x) − x ∈ H¹₀`.
- With `g = 1` on a bounded `Ω` and `ℓ = 0`, `b = c = 0`: the solution is the constant `1`,
  whose difference from `g` is `0 ∈ H¹₀`; a plausible wrong formulation solving for `u ∈ H¹₀`
  with the forcing `−B(g, ·) = 0` returns `0`, which has the wrong boundary values.
- On `Ω = (0,1) ∪ (2,3)` with `g` equal to `0` on the first and `1` on the second component:
  the solution is `g` itself, componentwise, and no connectedness is needed.
- The Poisson instance on the unit ball of `ℝ³` with `f = 1` is `u = (1 − |x|²)/6` (§3.4), and
  the a priori bound `‖u‖_{H¹} ≤ ‖f‖_{L²}/C` holds with the coercivity constant `C` of the ball.

*Needs:* Mathlib `IsCoercive.continuousLinearEquivOfBilin`; Tau Ceti
`TauCeti.PDE.existsUnique_isWeakSolutionDirichlet`, `IsCoercive.solutionOfFunctional`; §1.6
trace kernel.

### 4.3 The Fredholm alternative and the compatibility condition (D18)

The mass-shift dichotomy on a bounded open set, with finite-dimensional homogeneous space, is the
pinned `TauCeti.PDE.fredholmAlternative_isWeakSolutionDirichlet_sub_const` and
`finiteDimensional_ker_one_sub_smul_dirichletMassOperator`. Prove the full compatibility
condition (`fredholm_compatibility` in `Suggested.lean`; Evans, §6.2.3, Theorem 4;
Gilbarg–Trudinger, Theorem 8.6): for a bounded form satisfying Gårding's inequality on `H¹₀(Ω)`
of a bounded open `Ω`, and every `ℓ ∈ H⁻¹(Ω)`, the problem `B(u, ·) = ℓ` is solvable in `H¹₀(Ω)`
exactly when `ℓ(w) = 0` for every `w` in the weak adjoint kernel `{w ∈ H¹₀ : ∀ v, B(v, w) = 0}`.
Route: shift by the Gårding constant to the coercive form `B_β = B + β⟨·,·⟩_{L²}`, invert it by
Lax–Milgram to `H¹₀ → H⁻¹`, use §1.6's compact inclusion `H¹₀ → L²` to write `B(u,·) = ℓ` as
`(I − βK)u = B_β⁻¹ℓ` with `K` compact, and consume the Riesz theory of compact perturbations of
the identity (closed range, finite-dimensional kernel and cokernel, index zero) together with
the identification of the annihilator of the range with the kernel of the adjoint. Prove that
the solution set is an affine translate of the finite-dimensional kernel `{u : B(u, ·) = 0}`,
uniqueness modulo that kernel and uniqueness when it is zero. For non-symmetric `a` the adjoint
kernel is not the kernel, and the condition is against the adjoint kernel. For nonzero boundary
data first choose an `H¹` lifting `g̃` and apply the condition to `ℓ − B(g̃, ·)`. No unconditional
existence or uniqueness is asserted at resonance.

- The kernel and the adjoint kernel have the same finite dimension.
- The condition is necessary for every bounded form and sufficient under Gårding and
  compactness; on an unbounded domain it can fail to be sufficient.
- For `ℓ` given by `f ∈ L²` the condition reads `∫ f w = 0` for every adjoint-kernel element.

**Checks.**

- The finite-dimensional witness `L = [[1, 1], [0, 0]]` on `ℝ²`: `ker L = span(−1, 1)`,
  `ker Lᵀ = span(0, 1)`, range `L = span(1, 0) = (ker Lᵀ)^⊥`; `f = (1, 0)` annihilates the adjoint
  kernel and `Lu = f` is solvable, `f = (0, 1)` does not and is not solvable, while `f = (0,1)`
  does annihilate `ker L`. A condition against the kernel instead of the adjoint kernel is
  refuted.
- Resonance on `(0, π)`: `−u'' − u = f` with zero boundary values has adjoint kernel
  `span(sin x)` (the form is symmetric); `f = 1` has `∫_0^π sin x = 2 ≠ 0`, so it is not
  solvable, and `f = sin 2x` is, with solution `−sin(2x)/3` plus any multiple of `sin x`.
- Gårding with `a = I`, `c = −2` on `(0, π)` (§4.1): the form is not coercive and the
  compatibility theorem, not Lax–Milgram, applies; its kernel consists of the solutions of
  `−u'' − 2u = 0` vanishing at `0` and `π`, the multiples of `sin(√2 x)`, which vanish at `π`
  only if `√2` is an integer. So the kernel is zero and the problem is uniquely solvable for
  every `ℓ` although the form is not coercive.
- A coercive form has zero adjoint kernel, and the condition is vacuous: §4.2 is the special
  case.

*Needs:* §4.1 Gårding; §4.2 Lax–Milgram; §1.6 Rellich on `H¹₀` (pinned
`TauCeti.W1p0.isCompactOperator_valueL`); Tau Ceti `IsCoercive.formPerturbationOperator` and the
Riesz theory of `Analysis/Normed/Operator/Compact`; Mathlib
`IsCompactOperator.hasEigenvalue_or_mem_resolventSet`.

### 4.4 The Dirichlet spectrum (D19)

For a symmetric coercive bounded form on a bounded open set the compact self-adjoint solution
operator, the Dirichlet eigenvalues, the first eigenvalue as the least Rayleigh quotient on a
nonempty domain and an orthonormal eigenbasis of `L²(Ω)` with positive eigenvalues are pinned
(`TauCeti.PDE.dirichletSolutionOperator`, `isDirichletEigenvalue_first`,
`firstDirichletEigenvalue_pos`, `exists_hilbertBasis_forall_isDirichletEigenvalue`). The
abstract direct method, shifted forms, successive minima and the represented operator of a
compact form pair are VariationalMethods' and are neither consumed nor rebuilt here. Prove the
`−Δ` instance: on a **nonempty** bounded open `Ω` the Dirichlet eigenvalues of `−Δ` form a
nondecreasing sequence `0 < λ₁ ≤ λ₂ ≤ … → ∞` with eigenfunctions forming an orthonormal basis
of `L²(Ω)`, and `λ₁` equals the reciprocal of the squared optimal Poincaré constant of
`H¹₀(Ω)` (Evans, §6.5.1, Theorem 1). On the empty set `L²(∅) = H¹₀(∅) = {0}`, the eigenbasis
is empty and no first eigenvalue exists; the first-eigenvalue statements carry nonemptiness,
and the eigenbasis statement holds with the empty basis. Prove the separation-of-variables
instances: on `(0, π)` the eigenpairs are `(k², sin kx)`, and on a product of intervals the
eigenfunctions are products of sines. Realize `−Δ` with Dirichlet condition as a self-adjoint
`LinearPMap` on `L²(Ω)` with domain `{u ∈ H¹₀ : Δu ∈ L²}` in OperatorTheory's vocabulary, with
resolvent `(λI − A)⁻¹` for `λ ∉ {−λ_k}`, and identify its spectrum with `{λ_k}`. Eigenfunctions
are smooth inside `Ω` by §5.1's bootstrap; this is a corollary, not a target of this section.

- The eigenvalues are monotone in the domain: `Ω ⊆ Ω'` gives `λ_k(Ω) ≥ λ_k(Ω')`.
- Weyl's law is not a target; only the divergence `λ_k → ∞` from compactness is.
- Every eigenvalue has finite multiplicity (pinned
  `finiteDimensional_eigenspace_dirichletSolutionOperator`).

**Checks.**

- `(0, π)`: `−u'' = λu`, `u(0) = u(π) = 0` has solutions `sin kx` with `λ = k²`; the sharp
  Poincaré constant of an interval of length `L` is `L/π`, equal to `1` here, and the first
  eigenvalue is its reciprocal square, `1`.
- `Ω = ∅`: every candidate eigenvector is `0`, the point spectrum is empty, the Hilbert basis is
  the empty family and `dirichletSolutionOperator = 0`; the first-eigenvalue conclusion is not
  asserted, and a statement asserting a positive first eigenvalue on every bounded open set is
  refuted.
- Domain monotonicity: `(0, π/2) ⊆ (0, π)` has first eigenvalue `4 ≥ 1`.
- The square `(0,π)²`: eigenvalues `k² + l²`, the value `5 = 1 + 4 = 4 + 1` has multiplicity `2`,
  so multiplicity one is not a theorem.

*Needs:* Tau Ceti `TauCeti.PDE.exists_hilbertBasis_forall_isDirichletEigenvalue`,
`firstDirichletEigenvalue_pos`; OperatorTheory's `LinearPMap` vocabulary; §1.5 Poincaré;
§1.6 Rellich.

### Examples

The acceptance examples of this layer are the Gårding equality for `sin x` with `c = −2`; the
lifting example `x(1 − x)/2 + x`; the matrix witness `[[1,1],[0,0]]` for the adjoint kernel; the
resonant problem `−u'' − u = f` on `(0, π)`; and the spectra of `(0, π)`, `∅` and the square.

### Dependencies

Layer 1 (§1.5, §1.6); Mathlib's Lax–Milgram, Fredholm alternative and spectral theorem; Tau
Ceti's energy form, Dirichlet problem, Fredholm alternative and spectrum; OperatorTheory as
cited. Layer 5 is used only for the corollary on eigenfunction
smoothness.

## Layer 5: elliptic regularity

Two tracks whose hypotheses and outputs stay visible: divergence-form weak solutions
(§5.1–§5.4) and non-divergence-form strong and classical solutions (§5.5–§5.7). Every
estimate is interior, for a solution assumed to exist, quantitative in a local norm of the
solution, and stated in rescaling-compatible form. §5.4 and §5.5 are scalar by necessity:
De Giorgi–Nash–Moser fails for general systems with bounded measurable coefficients and
Krylov–Safonov uses the maximum principle. The other sections have systems analogues under
systems ellipticity, and their APIs do not preclude them.

### 5.1 Interior `H²` and `Hᵏ` estimates (E20)

Interior `H²` regularity for a constant principal matrix, bounded `b, c` and `L²` forcing is
the pinned `TauCeti.PDE.UniformlyEllipticOn.exists_lowerOrder_eq_restrictL`. Prove it for
variable `a` with entries Lipschitz on `Ω`, hence in `W^{1,∞}(Ω)`
(`exists_wkp_two_of_lipschitz_coefficients` in `Suggested.lean`;
Evans, §6.3.1, Theorem 1; Gilbarg–Trudinger, Theorem 8.8) by difference quotients, with the
estimate `‖u‖_{H²(V)} ≤ C(‖f‖_{L²(Ω)} + ‖u‖_{L²(Ω)})`, `C` depending on `n, λ, Λ`, `‖∇a‖_∞`,
`‖b‖_∞`, `‖c‖_∞` and `dist(V, ∂Ω)` in the dimensionless combinations of the Conventions. More
generally `a ∈ W^{k,∞}`, `b, c ∈ W^{k−1,∞}` and `f ∈ H^{k−1}` give `u ∈ H^{k+1}_loc` with the
corresponding estimate (Evans, §6.3.1, Theorem 2), and smooth coefficients and data give
`u ∈ C^∞(Ω)` (Theorem 3). State the global versions separately: for `Ω` of class `C^{k+2}` and
`u ∈ H¹₀`, `u ∈ H^{k+2}(Ω)` with the global estimate (Evans, §6.3.2, Theorems 4 and 5). A
divergence datum `F ∈ L²` only puts the right-hand side in `H⁻¹` and gives no `H²`.

- The `H²_loc` conclusion is independent of the sign of `c` and of any smallness of `b`.
- The estimate scales: on `B(x₀,r)` the constant carries `r‖∇a‖_∞`, `r‖b‖_∞`, `r²‖c‖_∞` and
  the norms `r^{−2}‖u‖_{L²}`, `‖f‖_{L²}` appropriately.

**Checks.**

- `−u'' = f` on `(0,1)` with `f = 1_{(0,1/2)}`: `u'' ∈ L²` so `u ∈ H²`, and `u''` jumps, so
  `u ∉ H³`; the `Hᵏ` bootstrap needs `f ∈ H^{k−1}` and stops exactly at `k = 2` here.
- `−(a u')' = 0` on `(−1, 1)` with `a = 1 + 1_{x>0}`: `u' = C/a` jumps at `0`, so `u ∈ H¹ ∖ H²`:
  Lipschitz coefficients are needed, and bounded measurable ones give only §5.4's Hölder
  conclusion.
- `F = 1_{(0,1/2)}` as divergence datum, `−u'' = F'`: `u' = −F + const`, so `u ∈ H¹ ∖ H²`,
  as the remark on divergence data predicts.
- Constant coefficients on a ball with `f ∈ C_c^∞`: the pinned theorem and the variable one
  agree, and `u` is smooth inside by the bootstrap.

*Needs:* Tau Ceti `TauCeti.PDE.UniformlyEllipticOn.exists_lowerOrder_eq_restrictL`,
`TauCeti.Wkp`; §1.2 difference-quotient characterization of `W^{1,2}`; §1.6 global versions
only.

### 5.2 Gradient `W^{1,p}` estimates (E21)

For `−div(a∇u) = div F` with inverse-coercive bounded measurable coefficients prove Meyers'
higher integrability: an `H¹_loc` weak solution with `F ∈ L^p_loc` lies in `W^{1,p}_loc` for
`2 < p < 2 + ε(n, Λ/λ)`, with the estimate on balls
`(⨍_{B_r} |∇u|^p)^{1/p} ≤ C((⨍_{B_{2r}} |∇u|²)^{1/2} + (⨍_{B_{2r}} |F|^p)^{1/p})`, by
Caccioppoli (pinned `TauCeti.PDE.UniformlyEllipticOn.setIntegral_sq_mul_norm_gradient_sq_le`), the
Sobolev–Poincaré inequality of §1.5 and Gehring's lemma of §2.4 (Meyers, *Ann. Scuola Norm.
Sup. Pisa* 17 (1963), Theorem 2, p. 200; Giaquinta–Martinazzi, Theorem 6.38 route). State the
lower range `2 − ε < p < 2` separately as `W^{1,p}` well-posedness of the Dirichlet problem with
`‖∇u‖_p ≤ C‖F‖_p` on a bounded `C¹` domain (Meyers, Theorem 1, p. 198), not as self-improvement
of an `H¹` solution. Expose how both ranges degenerate with the ellipticity ratio and include
Meyers' planar example (Meyers, §5, p. 204) showing that for bounded measurable coefficients no
estimate holds for all `p`. For `a ∈ VMO` and `F ∈ Lᵖ` obtain the full interior range
`1 < p < ∞` by §2.4's commutator theorem (Di Fazio, *Boll. Un. Mat. Ital.* 10-A (1996),
Theorem 2.1; Auscher–Qafsaoui, *Boll. Un. Mat. Ital.* 5-B (2002), Theorem 1.1), carrying the VMO
modulus and the small radius `r₀` explicitly. State the global Dirichlet estimate separately:
the full range needs a `C¹` boundary, or a small-BMO coefficient field on a Reifenberg-flat
domain.

- The Meyers exponent `ε(n, Λ/λ)` tends to `0` as `Λ/λ → ∞` and is explicit through Gehring's
  constant.
- The VMO estimate's constant depends on `n, p, λ, Λ`, the VMO modulus of `a` and `r₀`, and
  on nothing else.

**Checks.**

- Meyers' planar example (Meyers, §5, p. 204): a coefficient field on `ℝ²` with ellipticity
  ratio `1/μ²`, `0 < μ < 1`, for which `u = |x|^{μ−1}x₁` solves `div(a∇u) = 0`; `|∇u| ≈ |x|^{μ−1}`
  lies in `Lᵖ` near `0` exactly for `p(1 − μ) < 2`, so the admissible range `p < 2/(1 − μ)`
  shrinks to `p = 2` as `μ → 0`, that is as the ratio tends to infinity.
- `a = I`: the solution operator `F ↦ ∇u` of `−Δu = div F` on `ℝⁿ` is the matrix of Riesz
  transforms `(R_iR_j)`, bounded on every `Lᵖ`, `1 < p < ∞`, by §2.3; the full range at the
  identity coefficient is the Calderón–Zygmund theorem, consistent with `I ∈ VMO`.
- `F = 0`: Meyers gives `∇u ∈ L^{2+ε}_loc` for every weak solution of the homogeneous
  equation with bounded measurable coefficients, and the example above shows `ε` cannot be
  uniform in the ratio.
- A global claim on a domain with a reentrant corner: `u = r^{1/2} sin(θ/2)` on the slit disk is
  harmonic with `∇u ∉ Lᵖ` for `p ≥ 4`, so the global full-range estimate needs the boundary
  hypothesis.

*Needs:* Tau Ceti `TauCeti.PDE.UniformlyEllipticOn.setIntegral_sq_mul_norm_gradient_sq_le`; §1.5
Sobolev–Poincaré; §2.3 Calderón–Zygmund; §2.4 Gehring and the commutator theorem.

### 5.3 Divergence-form Schauder estimates (E22)

For `−div(a∇u) = f + div F` with `a, F ∈ C^{0,α}` and `f ∈ L^q`, `q > n`, prove the interior
`C^{1,β}` estimate with `β = min(α, 1 − n/q)` (Gilbarg–Trudinger, Theorem 8.32 for the
estimate, Theorem 8.34 for solvability): on `B(x₀, r)` with `B(x₀, 2r) ⊆ Ω`,

    r^{1+β}[∇u]_{β; B_r} + r‖∇u‖_{∞; B_r} ≤ C(‖u‖_{∞; B_{2r}} + r^{2−n/q}‖f‖_{L^q(B_{2r})} + r^{1+α}[F]_{α; B_{2r}} + r‖F‖_{∞; B_{2r}})

with `C` depending on `n, α, q, λ, Λ` and `r^α[a]_α`, by
Campanato's excess-decay method with §1.7's characterization. Insufficient integrability of
`f` removes the conclusion rather than lowering the exponent; Morrey-space data give the
alternative formulation. State the precise local estimate before global solvability, whose
boundary version needs `C^{1,α}` boundary and boundary data. A `C^{2,α}` conclusion needs one
more derivative of the coefficients or belongs to the non-divergence track.

- The estimate is invariant under `a ↦ a/λ` and scales correctly under dilation.
- The `C^{1,β}` solution of the Dirichlet problem on a `C^{1,α}` domain with `C^{1,α}` boundary
  data exists and is unique for `c ≥ 0`.

**Checks.**

- `−(a u')' = 0` on `(−1,1)` with `a = 1 + |x|^α`: `u' = C/a` is `C^{0,α}` and not `C^{0,β}` for
  `β > α`, so `u ∈ C^{1,α}` exactly, matching `β = min(α, ·)`.
- `f = |x|^{−γ}` on the unit ball of `ℝⁿ` with `0 < γ < n/q < 1`: `f ∈ L^q`, and the radial
  solution `u = −|x|^{2−γ}/((2 − γ)(n − γ))` of `−Δu = f` has `|∇u| ≈ |x|^{1−γ}`, Hölder of
  exponent exactly `1 − γ`; as `γ ↑ n/q` this exponent decreases to `1 − n/q`, so the second
  term of the minimum is sharp.
- `q = n` is excluded: `f = |x|^{−1}` on the unit ball of `ℝⁿ`, `n ≥ 2`, lies in `L^{n−δ}` for
  every `δ > 0` and not in `Lⁿ`, and the radial solution `u = −|x|/(n − 1)` has the
  discontinuous gradient `−x/((n − 1)|x|)`, so `u ∉ C¹`: the conclusion is lost, not weakened.
- `F = x₁ e₁` on the unit ball: `div F = 1`, so the datum can be placed in either slot, and
  the estimate's two terms are consistent on the solution `u = (1 − |x|²)/(2n)` of `−Δu = 1`.

*Needs:* §1.7 Campanato; §5.1 for the constant-coefficient comparison; §3.4 potentials.

### 5.4 De Giorgi–Nash–Moser (E23)

Local boundedness, Hölder continuity and the Harnack inequality for weak solutions of
`−div(a∇u) = 0` with inverse-coercive, bounded measurable, not necessarily symmetric
coefficients, in every dimension `n ≥ 1`. The `n ≥ 3` Hölder theorem under the pinned
operator-bound predicate, with `L²` norm and thickening radius, is the pinned
`TauCeti.PDE.exists_holderOnWith_preciseRepresentative`. Prove the ball statement
(`exists_holderOnWith_of_isWeakSolution_ball` in `Suggested.lean`; Gilbarg–Trudinger, Theorem 8.22;
De Giorgi, Nash, Moser): there are `α ∈ (0, 1]` and `C > 0` depending only on `n` and the ratio
`Λ/λ` such that every weak solution `u ∈ H¹(B(x₀, 2r))` has a representative that is
`α`-Hölder on `B(x₀, r)` with constant `C r^{−α} · r^{−n/2}‖u‖_{L²(B(x₀,2r))}`. The four
features are all required: the estimate is quantitative in `u` (`u ↦ Mu` scales it), the
exponent is a `ℝ≥0` in `(0, 1]`, the conclusion is about a representative, and the estimate is
on a ball with its scaling factor. A version on a compact `K ⊆ Ω` with a constant depending
only on `n, Λ/λ` and not on `dist(K, ∂Ω)` is false: for the Laplacian on `B_r` with
`K = B̄_{r/2}` and `u = x₁`, the Hölder seminorm is of order `r^{1−α}` while `‖u‖_{L²(B_r)}` is of
order `r^{1+n/2}`, so no `r`-free constant survives as `r → 0`; derive the compact-subset
corollary from the ball estimate with its explicit distance dependence. Then prove the
inhomogeneous estimate for `−div(a∇u) = f + div F` with scalar `f ∈ L^q`, `q > n/2`, and
`F ∈ L^s`, `s > n`, with the Hölder exponent restricted by the Morrey gains `2 − n/q` and
`1 − n/s`; no arbitrary `L²` forcing is substituted for these. Then treat `b` and `c`, entering
through `r‖b‖_∞` and `r²‖c‖_∞`, with the sign hypothesis for Harnack (Gilbarg–Trudinger,
Theorem 8.24). Prove the weak Harnack inequality and the Harnack inequality for nonnegative
weak solutions (Gilbarg–Trudinger, Theorems 8.18 and 8.20), which give the strong maximum
principle of §3.2 for weak solutions (Theorem 8.19). The route is Caccioppoli (pinned), the
level-set truncation of De Giorgi, the Sobolev–Poincaré inequality of §1.5 and Moser's
iteration; the Armstrong–Kempe formalization (arXiv:2604.05984, `holder_Moser` in
`DeGiorgi/Holder/PublicEstimate.lean`) is ported and reconciled for `n ≥ 3`: its unit-ball,
`λ = 1`, `p₀ > 1` and representative conventions transfer to the statement above by scaling,
and the dimensions `n = 1, 2` are supplied by the one-dimensional absolutely continuous flux
argument of §1.1 and the two-dimensional iteration with the finite-`q` critical
Sobolev–Poincaré inequality of §1.4–§1.5, with their own constants.

- The exponent `α` depends only on `n` and `Λ/λ` and tends to `0` as `Λ/λ → ∞`.
- The Harnack constant depends only on `n` and `Λ/λ` on balls of fixed ratio.
- Weak solutions of the homogeneous equation are locally bounded with
  `sup_{B_r} |u| ≤ C r^{−n/2}‖u‖_{L²(B_{2r})}`.

**Checks.**

- `u = x₁` on `B_r`, Laplacian: `[u]_{α; B_{r/2}} = (r)^{1−α}` up to a dimensional constant and
  `r^{−α} r^{−n/2}‖u‖_{L²(B_r)} = r^{−α} r^{−n/2} c r^{1+n/2} = c r^{1−α}`, so the ball estimate is
  scale-consistent, and a constant without the `r^{−α−n/2}` factor fails as `r → 0` or `r → ∞`.
- `n = 1`: every weak solution of `−(au')' = 0` with `a ∈ L^∞`, `a ≥ λ` has `u' = C/a` and is
  Lipschitz, so `α = 1`; the general theorem's `α < 1` is not sharp there, and the
  one-dimensional producer gives the better exponent.
- The half-disk field `a = e_r ⊗ e_r + s² e_θ ⊗ e_θ` of §3.2 with `0 < s < 1`: the same
  computation gives `div(a∇u) = 0` for `u = r^s sin θ`, which lies in `H¹` of the disk since
  `∫ r^{2(s−1)} r dr < ∞`, is `s`-Hölder at the origin and no better; the constants are
  `λ = s²`, `Λ = 1`, so `α(2, Λ/λ) ≤ (λ/Λ)^{1/2}`: the exponent genuinely degenerates with the
  ratio.
- Non-symmetric witnesses on the unit disk: for the constant field `a = [[1, −k],[k, 1]]` the
  equation `div(a∇u) = 0` is `Δu = 0`, since a constant antisymmetric part is divergence-free,
  and the theorem's conclusion with ratio `1 + k²` is weaker than the truth; for the variable
  field `a = I + x₁J` of §4.1 the equation is `Δu − ∂₂u = 0` (for example `u = exp(x₂)`), a
  drifted equation with a different solution set. In both cases the constants are calibrated
  against the inverse-coercive pair `(1, 1 + k²)` or `(1, 2)`, not the operator bound.

*Needs:* Tau Ceti `TauCeti.PDE.exists_holderOnWith_preciseRepresentative`,
`TauCeti.PDE.UniformlyEllipticOn.setIntegral_sq_mul_norm_gradient_sq_le`; §1.1, §1.4, §1.5; §4.1 adapter
between the ellipticity predicates.

### 5.5 Aleksandrov–Bakelman–Pucci and Krylov–Safonov (E24)

Combine §3.2's Aleksandrov–Bakelman–Pucci estimate with the barrier and measure estimate and
the Krylov–Safonov covering lemma to prove the weak Harnack inequality, the Harnack inequality
and the interior Hölder estimate for scalar `W^{2,n}_loc` strong solutions of `−aⁱʲ∂ᵢⱼu = f`
with bounded measurable uniformly elliptic coefficients and `f ∈ Lⁿ_loc`
(`exists_holderOnWith_of_isStrongSolution_ball` in `Suggested.lean`; Gilbarg–Trudinger,
Theorems 9.20 and 9.22, Corollary 9.24): with `α, C` depending only on `n` and `Λ/λ`, on
`B(x₀, r)` the solution has a representative `α`-Hölder with constant
`C r^{−α}(sup_{B_{2r}} |u| + r‖f‖_{Lⁿ(B_{2r})}/λ)`. This regularity does not by itself produce
`W^{2,p}` or `C^{1,α}` estimates. Viscosity solutions are outside the roadmap.

- The constants depend on `n, Λ/λ` only; no continuity of `a` enters.
- Strong solutions in `W^{2,n}` are continuous (§1.4 embeddings after one Sobolev step), so the
  supremum in the estimate is finite.

**Checks.**

- `n = 1`: a `W^{2,1}` strong solution of `−a u'' = f` with `a ≥ λ` has `u'' = −f/a ∈ L¹`, so
  `|u'(x) − u'(y)| ≤ ‖f‖_{L¹}/λ` and `u` is Lipschitz: `α = 1`, and the oscillation of `u'` is
  controlled by the estimate's term `r‖f‖_{L¹}/λ` at `n = 1`.
- `a = I`, `f = 0`: harmonic functions, where the estimate reproduces the interior derivative
  bound of §3.1 with `α = 1`; the theorem's `α < 1` is weaker, as it must be for measurable
  coefficients.
- With `a = 1 + 1_{x > 0}` and `f = 1` on `(−1, 1)`, the strong solution has `u'' = −1/a`, which
  jumps at `0`, so `u ∈ C^{1,1} ∖ C²`: no `C²` or higher `W^{2,p}` conclusion follows from
  measurable coefficients, and the Hölder conclusion is the right strength.
- The estimate is quantitative in `sup|u|`: `u ↦ Mu` scales both sides.

*Needs:* §3.2 Aleksandrov–Bakelman–Pucci; §1.4 embeddings; Tau Ceti `TauCeti.Wkp`.

### 5.6 Non-divergence Schauder estimates (E25)

For `a, f ∈ C^{0,α}` prove the interior `C^{2,α}` estimate in scaled form
(`holderOnWith_iteratedFDeriv_two_of_schauder` in `Suggested.lean`; Gilbarg–Trudinger,
Theorem 6.2): with `C` depending only on `n, α, λ, Λ` and a bound `M ≥ r^α[a]_{α; B_{2r}}`, every
`C²` solution of `−aⁱʲ∂ᵢⱼu = f` on `B(x₀, 2r)` with `|u| ≤ M_u`, `|f| ≤ M_f` and `[f]_α ≤ K_f`
there has `[D²u]_{α; B_r} ≤ C(r^{−2−α}M_u + r^{−α}M_f + K_f)`, by freezing the coefficients and
the constant-coefficient estimate from §3.4's Newtonian potential (Gilbarg–Trudinger,
Theorem 4.6). Then prove global classical solvability of the Dirichlet problem on `C^{2,α}`
domains with `C^{2,α}` boundary data and `c ≤ 0` (Gilbarg–Trudinger, Theorem 6.14) by the
method of continuity from the Laplacian, with the global estimate (Theorem 6.6). Expose the
dependence on `λ, Λ, α`, the dimension, the geometry and the rescaled coefficient seminorm.

- The interior estimate scales: `u ↦ u(x₀ + r·)` multiplies `[D²u]_α` by `r^{2+α}`, `M_f` by
  `r²` and `K_f` by `r^{2+α}`, leaving the inequality invariant.
- Lower-order terms `b ∈ C^{0,α}`, `c ∈ C^{0,α}` enter through `r‖b‖`, `r²‖c‖` and the
  corresponding seminorms.

**Checks.**

- `−u'' = f` on `(−2, 2)` with `f = |x|^α`: `u'' = −|x|^α` is exactly `C^{0,α}` and not better,
  so the `C^{2,α}` conclusion is sharp in `α`.
- `α > 0` is load-bearing: on `ℝ²` the function `u = (x₁² − x₂²)(−log|x|)^{1/2}` near `0` has
  `Δu = −2(x₁² − x₂²)(−log|x|)^{−1/2}/|x|² − (x₁² − x₂²)(−log|x|)^{−3/2}/(4|x|²)`, which is
  continuous and tends to `0`, while `∂₁₁u = 2(−log|x|)^{1/2} + …` is unbounded; so continuous
  data do not give `C²` solutions (Gilbarg–Trudinger, Problem 4.9).
- The frozen-coefficient step: for constant `a₀` the linear change of variables
  `x ↦ a₀^{−1/2}x` reduces `aⁱʲ₀∂ᵢⱼ` to `Δ` with `[D²u]_α` changing by a factor depending only on
  `λ, Λ`, consistent with the constant's dependence.
- `u = x₁²` with `a = I`: `f = −2`, `M_u = 4r²` on `B_{2r}`, `M_f = 2`, `K_f = 0`, and
  `[D²u]_α = 0 ≤ C(r^{−2−α} · 4r² + 2 r^{−α})`, consistent and non-vacuous.

*Needs:* §1.7 Hölder spaces; §3.4 Newtonian potential; §3.2 maximum principle for
uniqueness; §1.6 for `C^{2,α}` domains.

### 5.7 Non-divergence Calderón–Zygmund estimates (E26)

First prove the constant-coefficient interior `W^{2,p}` estimate for `Δu = f`, `1 < p < ∞`:
second derivatives are Riesz-transform compositions `R_iR_j f` of the datum through §3.4's
Newtonian potential, bounded by §2.3 (Gilbarg–Trudinger, Theorem 9.9). Then use §2.4's
commutator theorem for `−aⁱʲ∂ᵢⱼu = f` with `a ∈ VMO`, obtaining the interior `W^{2,p}` estimate
`‖D²u‖_{L^p(B_r)} ≤ C(‖f‖_{L^p(B_{2r})} + r^{−2}‖u‖_{L^p(B_{2r})})` for `1 < p < ∞`
(Chiarenza–Frasca–Longo, *Ricerche Mat.* 40 (1991), Theorem 4.2), carrying the VMO modulus and
the small radius `r₀`, and the global Dirichlet estimate on `C^{1,1}` domains separately
(Chiarenza–Frasca–Longo, *Trans. Amer. Math. Soc.* 336 (1993), Theorem 4.4). For `p = 2` and
Lipschitz coefficients the estimate is §5.1's; for continuous coefficients the VMO modulus is
the modulus of continuity.

- The `L^p` estimate for `Δ` fails at `p = 1` and `p = ∞`, matching §2.3's endpoints.
- `W^{2,p}` solutions for `p > n/2` are continuous and for `p > n` are `C^{1,1−n/p}`, by §1.4.

**Checks.**

- `Δu = f` on `ℝ²` with `f = 1_{B}`: `u ∈ W^{2,p}_loc` for every `p < ∞` but `D²u ∉ L^∞` near the
  circle (a logarithmic singularity), so the `p = ∞` endpoint fails.
- `a = I`: the commutator term vanishes and the VMO estimate reduces to the
  constant-coefficient one with `r₀` arbitrary.
- The Riesz transform identity `∂ᵢ∂ⱼ(Φ * f) = R_iR_j f` for `f ∈ C_c^∞`: the multiplier of the
  left side is `(2πiξ_i)(2πiξ_j)/(4π²|ξ|²) = −ξ_iξ_j/|ξ|²`, that of `R_iR_j` is
  `(−iξ_i/|ξ|)(−iξ_j/|ξ|) = −ξ_iξ_j/|ξ|²`. On `ℝ`, `R₁ = H` and `H² = −I`, so `∂²(Φ * f) = −f`,
  matching `Φ = −|x|/2` with `−Φ'' = δ`; a sign error in either convention breaks this.
- `a` with a jump along a hyperplane (`a = 1 + 1_{x₁>0}` on the diagonal) is in `L^∞ ∖ VMO`,
  and the `W^{2,p}` estimate fails for `p` large, as the one-dimensional example `u' = C/a` of
  §5.1 already shows; so the VMO hypothesis is load-bearing.

*Needs:* §2.3 Calderón–Zygmund; §2.4 commutators; §3.4 Newtonian potential; §5.1.

### Examples

The acceptance examples of this layer are the one-dimensional jump examples for `H²`, `W^{1,p}`
and `W^{2,p}`; Meyers' planar example; the scaling witness `u = x₁` for De Giorgi–Nash–Moser;
the half-disk example's exponent dependence; and the `|x|^α` data for the Schauder exponent.
The two tracks meet at the Laplacian: for smooth `f` the weak solution of §4.2 is smooth by
§5.1, its second derivatives are Riesz transforms by §5.7 and its `C^{2,α}` norm is controlled
by §5.6, each with its own solution concept.

### Dependencies

Layers 1–4 in full; Mathlib's Riesz transforms through §2.3 only. No later layer is used.

## Layer 6: parabolic and evolution equations

The identifiers F24 (Bochner spaces and the Gelfand triple), F25 (Galerkin existence), F26
(heat realization) and F27.1–F27.6 (the classical whole-space Schauder programme) label the
sections below; E24–E26 are the non-divergence elliptic sections of Layer 5.

### 6.1 Bochner spaces and the Gelfand triple (F24)

Define `L²(0,T;V)` and `H¹(0,T;V*)` for a Gelfand triple `V ↪ H ↪ V*` of separable Hilbert
spaces with dense continuous inclusion, as Mathlib `Lp` spaces of Bochner-measurable functions
on `(0,T)` with the weak time derivative of §1.1 taken in `V*`. Prove the embedding
`L²(0,T;V) ∩ H¹(0,T;V*) ↪ C([0,T];H)` with the integration-by-parts identity
`‖u(t)‖²_H − ‖u(s)‖²_H = 2∫_s^t ⟨u'(τ), u(τ)⟩` (Evans, §5.9.2, Theorem 3), the Lions–Magenes
lemma, so that initial traces `u(0) ∈ H` make sense.

- The embedding is continuous with norm depending on `T` and the triple's constants.
- `H¹(0,T;V*)` elements have absolutely continuous representatives into `V*` with the
  fundamental theorem of calculus of §1.1 in Bochner form.
- The triple `H¹₀(Ω) ↪ L²(Ω) ↪ H⁻¹(Ω)` is an instance, with `⟨f, v⟩ = ∫ f v` for `f ∈ L²`.

**Checks.**

- `V = H = V* = ℝ`: the embedding is the absolutely continuous identification of §1.1 and the
  identity reads `u(t)² − u(s)² = 2∫_s^t u'u`; a wrong pairing convention gives a factor other
  than `2`.
- `u(t) = sin(kx)` constant in time on `(0,π)`: `u ∈ L²(0,T;H¹₀)` with `u' = 0`, and the identity
  is `0 = 0`.
- `u(t) = t v` for fixed `v ∈ H¹₀`: `u' = v` as a `V*`-valued function, and the identity gives
  `t²‖v‖²_H = 2∫_0^t τ‖v‖²_H`, correct.
- The target `H` is sharp: `u(t) = Σ_k e^{−k²t} sin(kx)/k` on `(0, π)` lies in `L²(0,T;H¹₀)`
  (since `∫_0^T e^{−2k²t} dt ≤ 1/(2k²)` and `Σ 1/k² · k² · 1/(2k²) < ∞`), its derivative
  `u' = Δu` lies in `L²(0,T;H⁻¹)`, and `u` is continuous into `L²`, but `‖u(t)‖²_{H¹} = (π/2)Σ e^{−2k²t}`
  tends to infinity as `t ↓ 0`, so `u` is not continuous into `V = H¹₀`.

*Needs:* Mathlib's Bochner integral and `Lp` of Banach-valued functions; §1.1 weak derivatives
on an interval in Bochner form; Tau Ceti `TauCeti.HasWeakFDerivOn` for `F`-valued functions.

### 6.2 Galerkin existence for linear parabolic equations (F25)

Prove existence and uniqueness of the weak solution `u ∈ L²(0,T;H¹₀(Ω)) ∩ H¹(0,T;H⁻¹(Ω))` of
`∂ₜu + L(t)u = f`, `u(0) = u₀`, for a bounded open `Ω`, time-dependent bounded measurable
coefficients with a uniform Gårding inequality, `f ∈ L²(0,T;L²(Ω))` and `u₀ ∈ L²(Ω)`, by the
Galerkin method with the eigenbasis of §4.4: finite-dimensional approximation (Mathlib's
Picard–Lindelöf for the linear systems), the energy estimate
`sup_t ‖u_m(t)‖²_{L²} + ∫_0^T ‖u_m‖²_{H¹} ≤ C(‖u₀‖²_{L²} + ‖f‖²_{L²(L²)})` by Grönwall, weak
compactness of the approximants and passage to the limit, and uniqueness by the energy identity
of §6.1 (Evans, §7.1.2, Theorems 3 and 4). Prove the weak parabolic maximum principle for
weak sub- and supersolutions with `c ≥ 0` and the classical parabolic maximum principle on a
bounded cylinder (the latter pinned, `TauCeti.le_of_deriv_sub_laplacian_le_of_le_parabolicBoundary`,
for the heat operator; extend it to variable coefficients). The equation is nonautonomous in
general and is not a one-parameter semigroup without time independence.

- The solution map `(u₀, f) ↦ u` is linear and bounded into the solution space.
- Improved regularity: `u₀ ∈ H¹₀` and `f ∈ L²(L²)` give `u ∈ L²(0,T;H²_loc) ∩ H¹(0,T;L²)`
  (Evans, §7.1.3, Theorem 5), consuming §5.1.
- For time-independent coefficients the solution is `u(t) = S(t)u₀ + ∫_0^t S(t−s)f(s) ds`
  with the semigroup of §6.3's Dirichlet realization.

**Checks.**

- Heat equation on `(0,π)` with `u₀ = sin x`, `f = 0`: the Galerkin approximants are exact for
  `m ≥ 1`, `u = e^{−t} sin x`, and the energy identity reads
  `‖u(t)‖² + 2∫_0^t ‖u_x‖² = ‖u₀‖²`, both sides `π/2`.
- `u₀ = Σ sin(kx)/k`, `f = 0`: `u(t) = Σ e^{−k²t} sin(kx)/k` is in `L²(0,T;H¹₀)` since
  `Σ ∫_0^T e^{−2k²t} dt < ∞`, although `u₀ ∉ H¹₀`; the gain of one derivative in the energy space
  is real.
- Backward heat equation `∂ₜu − Δu = 0` with terminal data is ill-posed: `u = e^{k²t} sin(kx)`
  grows without bound in `k`, so the uniform Gårding inequality's sign is load-bearing (the
  operator `−L` with the wrong sign has no Galerkin energy estimate).
- Parabolic maximum principle: `u = e^{−t} sin x` has its maximum on the parabolic boundary
  (at `t = 0`); `u = t` satisfies `∂ₜu − Δu = 1 ≥ 0`, a supersolution of the homogeneous
  equation, whose minimum `0` lies on the parabolic boundary as the principle requires, while
  its maximum `T` on the top slice is not forbidden, since `u` is not a subsolution.

*Needs:* §6.1; §4.1 Gårding; §4.4 eigenbasis; Mathlib's Picard–Lindelöf and Grönwall; Tau Ceti
`TauCeti.le_of_deriv_sub_laplacian_le_of_le_parabolicBoundary`; §5.1 for improved regularity.

### 6.3 The heat semigroup and its generator (F26)

General `C₀`-semigroups, generators, growth bounds, resolvents, Hille–Yosida and Lumer–Phillips
are OneParameterSemigroups Part A, implemented in Tau Ceti (`TauCeti.Semigroups.StronglyContinuousSemigroup`,
`TauCeti.Semigroups.hilleYosida_generation`), with the shared `LinearPMap` vocabulary and the resolvent
convention `(λI − A)⁻¹` of OperatorTheory; this section constructs an instance. From the
pinned Gaussian kernel (`TauCeti.heatKernel`, with mass one, the semigroup identity
`Γ(t) * Γ(s) = Γ(t+s)` and Fourier transform `exp(−4π²t|ξ|²)`) construct the convolution
operators `S(t)f = Γ(t) * f` as bounded operators on `Lᵖ(ℝⁿ)`, `1 ≤ p < ∞`, and on `BUC(ℝⁿ)`,
the uniformly continuous bounded functions, with `‖S(t)‖ ≤ 1`, and prove strong continuity and
the semigroup law, so that `S` is a contraction `C₀`-semigroup on each of these spaces. Identify
the generator: on `Lᵖ` its domain is `{u ∈ Lᵖ : Δu ∈ Lᵖ}` with `Δ` the distributional Laplacian,
with `C_c^∞` as a core, and the action is `Δ`; on `BUC` the domain is the set of `u` whose
distributional Laplacian has a `BUC` representative, with the core of smooth functions all of
whose derivatives are bounded, constructed by heat smoothing and graph convergence (`C_c^∞` is
not uniformly dense in `BUC` and is not its core). Prove both domain equalities through the
distributional identities and integration of the convolution derivative before applying the
uniqueness of generators; at `p = 1` the domain is not asserted to be `W^{2,1}`. Strong
continuity on all of `L^∞` is false and is not asserted; the positive-time action on bounded
data is proved separately. Prove the Fourier representation on `L²`, Duhamel's formula for
`∂ₜu − Δu = f`, the smoothing estimates `‖D^α S(t)f‖_p ≤ C t^{−|α|/2}‖f‖_p`, and the comparison
with the variational Dirichlet realization of §6.2 on bounded domains for data supported inside
the domain as the domain exhausts `ℝⁿ`. The heat generator is `A = Δ`; the nonnegative elliptic
operator of Layer 4 is `−Δ`.

- `S(t)` is positivity preserving and mass preserving on `L¹`.
- The resolvent `(λI − Δ)⁻¹` for `λ > 0` is convolution with the Bessel-type kernel
  `∫_0^∞ e^{−λt}Γ(t) dt`, bounded on `Lᵖ` with norm `1/λ`.
- The generator is dissipative on every `Lᵖ`, which is the Lumer–Phillips route to the same
  semigroup.

**Checks.**

- `f = Γ(s)`: `S(t)Γ(s) = Γ(t+s)` by the pinned semigroup identity, and `∂ₜΓ = ΔΓ` by the
  pinned heat equation, so the generator acts as `Δ` on the kernel itself.
- Fourier side: `S(t)` has multiplier `exp(−4π²t|ξ|²)`, whose derivative at `t = 0` is
  `−4π²|ξ|²`, the multiplier of `Δ`; a model with `exp(−t|ξ|²)` has generator `(2π)^{−2}Δ`, which
  is the `2π` error the Conventions warn about.
- `f = 1` on `ℝⁿ`: `S(t)1 = 1` (mass one), and `1 ∈ BUC`, so the `BUC` realization is
  non-trivial on constants, while `1 ∉ Lᵖ` for finite `p`; `f = sign x₁ ∈ L^∞ ∖ BUC` has
  `‖S(t)f − f‖_∞ = 1` for every `t > 0`, so strong continuity fails on `L^∞`.
- The domain at `p = 2` is `H²(ℝⁿ)` by §1.3; in `ℝ³`, `u = |x|^{−1}χ` with a cutoff `χ` equal to
  `1` near `0` lies in `L²` (`∫ |x|^{−2} dx < ∞` near `0`) while `Δu = −4πδ₀` plus a smooth function
  is not in `L²`, so `u` is outside the domain: the domain is a proper subspace.

*Needs:* Tau Ceti `TauCeti.heatKernel` and its API, `TauCeti.Semigroups.StronglyContinuousSemigroup`,
`TauCeti.Semigroups.hilleYosida_generation`; OneParameterSemigroups Part A; OperatorTheory's `LinearPMap`
vocabulary; §1.3; §6.2 for the Dirichlet comparison.

### 6.4 Parabolic Hölder spaces, calculus and traces (F27.1)

Work with scalar real functions on `Q = ℝⁿ × [0,T]`, `T > 0`, and fix `0 < α < 1`. Use the
parabolic distance `d_par((x,t),(y,s)) = ‖x − y‖ + √|t − s|`, realized by Mathlib's
`Metric.Snowflaking` of `ℝ` with exponent `1/2` for time and the `WithLp 1` product metric with
Euclidean space; transport a function through the coordinate homeomorphism to ordinary
space-time before differentiating. Spatial derivatives are `iteratedFDeriv ℝ` with their
continuous multilinear operator norms. On every nondegenerate closed slab `[a,b]`, time
derivatives are `derivWithin` on `Icc a b`, agreeing with interior derivatives and their
continuous one-sided endpoint extensions; prove this agreement and uniqueness. Supply
restriction to slabs and time reversal on the same carriers. Use `BoundedContinuousFunction`
for bounded continuous derivative maps and, for a map `v` on the slab subtype, Mathlib's
`eHolderNorm α v`, requiring finiteness (`MemHolder α v`) before taking its real value
`[v]_{α,par}`. Prove `[v]_{α,par} = sup_{z ≠ z'} ‖v(z) − v(z')‖/d_par(z,z')^α` and the
equivalence with the sum of the separate spatial `α` and temporal `α/2` seminorms. For time
slices define `[v]_{t,γ}` as the real value of `⨆_x eHolderNorm γ (t ↦ v(x,t))` on `Icc a b`,
again after finiteness, used with `γ = (1+α)/2`. For every integer `k ≥ 0` define
`C_{par,b}^{k+α}(Q)` by continuous mixed derivatives `D_t^r D_x^β u` for `2r + |β| ≤ k`, proving
by Schwarz–Peano induction that every ordering of the factors exists, is continuous on the
closed slab and agrees, including the one-sided endpoint derivatives. Its norm is the sum of
their supremum norms, the parabolic `α` seminorms for `2r + |β| = k`, and the separate temporal
`(1+α)/2` seminorms for `2r + |β| = k − 1` (an empty sum for `k = 0`), the latter required also
for odd `k`; prove equivalence with iterated-Fréchet-derivative operator norms, completeness,
the continuous inclusions between consecutive orders, restriction, product and bounded
multiplication estimates. The `k = 0` and `k = 2` spaces are also written `C_b^{α,α/2}` and
`C_b^{2+α,1+α/2}`. In the order-two norm the temporal `(1+α)/2` seminorm of `D_x u` is
controlled by `C(n,α)([D_x²u]_{α,par} + [u_t]_{α,par})`, proved with spatial centred differences
at scale `√|t − s|`, so the norm omitting that term is equivalent. For any slab `[a,b]`, `a < b`,
and `0 < ε ≤ min(1, √((b−a)/2))` prove the interpolation bounds
`‖D_x u‖_∞ ≤ C(n)(ε‖D_x²u‖_∞ + ε⁻¹‖u‖_∞)`,
`‖D_x²u‖_∞ ≤ C(n,α)(ε^α[D_x²u]_{α,par} + ε⁻²‖u‖_∞)` and
`‖u_t‖_∞ ≤ C(α)(ε^α[u_t]_{α,par} + ε⁻²‖u‖_∞)`, and derive the absorption
`‖u‖_{α,par} + ‖D_x u‖_{α,par} ≤ η‖u‖_{2+α,par} + C(n,α,T,η)‖u‖_∞` for every `η > 0`, with `T`
replaced by `b − a` on `[a,b]` and constants independent of `a`. Prove the bounded initial and
terminal trace maps into §1.7's `C_b^{k,α}(ℝⁿ)`.

- The parabolic metric induces the product topology and the parabolic balls are the
  cylinders `B(x,r) × (t − r², t + r²)`.
- Time reversal `(x,s) ↦ (x,T − s)` is a parabolic isometry preserving `Q` and sending the slab
  `[a,b]` to `[T − b, T − a]`.
- Restriction to a slab is norm-nonincreasing and the norms are monotone in the slab.

**Checks.**

- `d_par((x,t),(y,s)) = ‖x−y‖ + √|t−s|` on ordinary coordinates: for `(0,0)` and `(0,1)` the
  distance is `1`, for `(0,0)` and `(0,4)` it is `2`, not `4`, which distinguishes the parabolic
  metric from the Euclidean one.
- `u(x,t) = t`: `[u]_{α,par}` over `|t − s| ≤ 1` is `sup |t−s|^{1−α/2}`, finite on every slab,
  with temporal `α/2` seminorm `sup |t−s|^{1−α/2}` and spatial seminorm `0`; the equivalence
  constant between the two seminorm conventions is at most `2`, since
  `a^α + b^α ≤ 2(a+b)^α` for `0 < α ≤ 1`.
- `u(x,t) = √t`: `u_t` is unbounded near `t = 0`, so `u ∉ C_b^{2+α,1+α/2}(Q)` although
  `u ∈ C_b^{α,α/2}(Q)` for `α ≤ 1`; the one-sided endpoint derivative requirement is
  load-bearing.
- Interpolation at `ε`: for `u = cos(ωx)` on `ℝ`, `‖D_x u‖_∞ = ω`, `‖D_x²u‖_∞ = ω²`, `‖u‖_∞ = 1`,
  and `ω ≤ C(εω² + ε⁻¹)` holds for every `ε` with `C = 1/2` at `ε = 1/ω`; the bound is sharp up
  to `C`.

*Needs:* Mathlib `Metric.Snowflaking`, `WithLp.prod_dist_eq_add`, `HolderOnWith`, `eHolderNorm`,
`BoundedContinuousFunction`, `iteratedFDeriv`, `derivWithin`; §1.7 Hölder spaces.

### 6.5 Classical comparison and heat potentials (F27.2)

Let `Pu = u_t − aⁱʲu_ij − bⁱu_i − cu` with symmetric `a` and `aⁱʲ, bⁱ, c ∈ C_b^{α,α/2}(Q)`, with
explicit `0 < λ ≤ Λ` and `λI ≤ a ≤ ΛI`. Prove comparison for bounded functions continuous on
`Q` and classical `C^{2,1}` for `t > 0`, by a barrier at spatial infinity and a finite-horizon
exponential change for `c` (Lieberman, *Second Order Parabolic Differential Equations*,
Chapter 2, gives the bounded-domain maximum principles; the whole-space form is proved here). For
bounded `f` with `Pu ≤ f` prove `‖u⁺‖_∞ ≤ exp(C₊T)(‖u(·,0)⁺‖_∞ + T‖f⁺‖_∞)` with
`C₊ = max(0, sup_Q c)`, and uniqueness by comparison of differences. This is the classical
whole-space theorem with its own proof, not an inference from §6.2. Construct the Cauchy
potential `Γ(t) * u₀` and the Duhamel potential `∫_0^t Γ(t−s) * f(s) ds` from §6.3's kernel and
prove the pointwise kernel estimates
`‖∂_t^j D_x^m Γ(x,t)‖ ≤ C(n,m,j) t^{−(n+m+2j)/2} exp(−‖x‖²/(8t))` for `t > 0`, positivity,
`∫Γ(t) = 1` and `∫ D_x^m Γ(t) = 0` for `m ≥ 1`, with integrability and differentiation under
the integral. Prove the potentials' full order-two Hölder estimates and trace attainment, using
`∫ D²Γ = 0` for the differentiated Duhamel term and estimates of both spatial and temporal
differences (Lunardi, *Linear and nonlinear diffusion problems*, Cortona lecture notes 2004,
Corollary 4.2.10; Lieberman, Chapter 4, for the constant-coefficient Hölder estimates). Reduce each constant symmetric elliptic
matrix `a₀` to the Laplacian by a linear coordinate change and prove that
`u ↦ (u_t − a₀ⁱʲu_ij, u(·,0))` is a bounded linear isomorphism
`C_b^{2+α,1+α/2}(Q) → C_b^{α,α/2}(Q) × C_b^{2,α}(ℝⁿ)`.

- The comparison constant `exp(C₊T)` is `1` when `c ≤ 0`.
- The kernel estimates are invariant under the parabolic scaling `(x,t) ↦ (rx, r²t)` with the
  factor `r^{−n−m−2j}`.
- The potentials depend continuously on the data in the stated norms.

**Checks.**

- `u = e^{t} cos x` with `a = 1`, `b = c = 0`: `Pu = e^t cos x + e^t cos x = 2e^t cos x`, so
  `f = 2e^t cos x` is bounded by `2e^T`, and the comparison bound `‖u⁺‖_∞ ≤ 1 + T · 2e^T` is
  consistent with `‖u⁺‖_∞ = e^T`.
- `c = 1`, `u = e^t`: `Pu = e^t − e^t = 0 = f`, and the bound `‖u⁺‖_∞ = e^T ≤ exp(T)(1 + 0)`
  is an equality, so `C₊ = sup c` is sharp.
- The kernel estimate at `m = j = 0` is `Γ(x,t) ≤ C t^{−n/2}`, attained at `x = 0` with
  `C = (4π)^{−n/2}`; at `m = 1`, `|∇Γ| = (‖x‖/2t)Γ ≤ C t^{−(n+1)/2} exp(−‖x‖²/(8t))`, using
  `(‖x‖/√t) exp(−‖x‖²/(8t)) ≤ C`.
- `∫ D_x²Γ(t) = 0`: the integral of a derivative of a Schwartz function vanishes, and a
  plausible wrong model that keeps a nonzero mean would break the Duhamel Hölder estimate at
  `t ↓ 0`.

*Needs:* §6.3 kernel; §6.4 spaces; §3.2 maximum principles for the barrier.

### 6.6 Variable coefficients and backward problems (F27.3)

For the coefficients of §6.5 and data `f ∈ C_b^{α,α/2}(Q)`, `u₀ ∈ C_b^{2,α}(ℝⁿ)`, prove existence
and uniqueness in `C_b^{2+α,1+α/2}(Q)` of `Pu = f`, `u(·,0) = u₀`, with
`‖u‖_{2+α,par} ≤ K(‖u₀‖_{2,α} + ‖f‖_{α,par})`, `K` depending only on `n, α, T, λ, Λ` and the
coefficient norms (Lunardi, Corollary 4.2.10 for the Laplacian; Lieberman, Chapter 5, for
the bounded-domain Schauder theory). Prove freezing, interpolation, absorption
and localization with space-time cutoffs and constants independent of the spatial centre, and
obtain the global a priori estimate; cutoffs near the initial slice equal one at `t = 0` on the
smaller patch, so the localized estimate retains the initial trace. Apply the method of
continuity from §6.5's heat operator along a uniformly elliptic coefficient path: the estimate
is uniform on the path, invertibility is open by a Neumann series and closed by the estimate
applied to differences. Export the bounded linear initial-data isomorphism `u ↦ (Pu, u(·,0))`.
With `R(x,s) = (x, T − s)` prove that `R` is a parabolic isometry preserving `Q` and sending
slabs to reversed slabs; for `v = u ∘ R`, `ã = a ∘ R`, `b̃ = b ∘ R`, `c̃ = c ∘ R` and
`P_back u = u_t + aⁱʲu_ij + bⁱu_i + cu`, prove `P_back u = g` exactly when `P̃v = −g ∘ R`, with
`v(·,0) = u(·,T)` and `P̃` the forward operator with reversed coefficients; export the
terminal-data isomorphism for `P_back` including inhomogeneous traces, and continuity of the
forward and backward inverses in operator norm as `a, b, c` vary in `C_b^{α,α/2}`, locally on
sets with fixed ellipticity and coefficient-norm bounds.

- `K` is nondecreasing in `T` and in the coefficient norms.
- The solution operator commutes with spatial translations when the coefficients do.

**Checks.**

- Time reversal: for `u(x,s) = s`, `v = u ∘ R = T − s`, `v_t = −1 = −u_t ∘ R`, and with
  `a = 1`, `b = c = 0`: `P_back u = u_t + u_xx = 1 = g` while `P̃v = v_t − v_xx = −1 = −g ∘ R`.
- Constant coefficients `a = 2`, `u₀ = cos x`, `f = 0`: `u = e^{−2t} cos x`, and the method of
  continuity's path from `a = 1` passes through the exact solutions `e^{−θ t}cos x`,
  `1 ≤ θ ≤ 2`, each with norm bounded uniformly in `θ`.
- The backward problem with forward data is ill-posed, as §6.2's Check shows; the backward
  isomorphism is for terminal data only, and a plausible wrong statement with initial data for
  `P_back` is refuted by `e^{k²t} sin(kx)`.
- `K` cannot be independent of `T`: `u = t` solves `u_t = 1` with `u₀ = 0`, `f = 1`, and
  `‖u‖_{2+α,par} ≥ T`, so `K ≥ T`.

*Needs:* §6.4; §6.5; Mathlib's Neumann series for bounded operators.

### 6.7 Uniformly continuous initial traces (F27.4)

Here `BUC(ℝⁿ)` is the closed subspace of `ℝⁿ →ᵇ ℝ` of uniformly continuous functions. For
`u₀ ∈ BUC` and the coefficients and forcing of §6.6, construct a bounded continuous solution
on `Q`, classical for `t > 0`, with `‖u(·,t) − u₀‖_∞ → 0` as `t ↓ 0` and bounded
`C_b^{2+α,1+α/2}` norm on every `[δ,T]`, `0 < δ < T`. Prove the quantitative interior estimate
`sup_{0<δ<T} δ^{1+α/2}‖u‖_{2+α,par;[δ,T]} ≤ C(‖u(·,0)‖_∞ + ‖f‖_{α,par})` first for solutions in
the closed-slab space, with `C` depending only on `n, α, T`, ellipticity and coefficient
norms, using time cutoffs on `[δ/2,T]`, interpolation at scale `√δ` and absorption of the
weighted supremum; the cutoff forcing `χ'u` needs the interpolation step, since its Hölder norm
is not bounded by `‖u‖_∞` alone, and the weighted supremum is finite for each smooth-data
approximant before absorption, which makes the bound uniform. Then use uniform smooth
approximation, comparison to make solutions uniformly Cauchy, the weighted estimate and
compact-exhaustion derivative convergence; prove uniqueness among bounded functions
continuous on `Q`, classical for `t > 0`, with the given trace. For a uniformly bounded family
`g_i ∈ BUC` that is `UniformEquicontinuous` with modulus `ω`, prove the common-modulus estimate
`‖u_i(·,t) − g_i‖_∞ ≤ C(ω(√t) + t(‖g_i‖_∞ + ‖f‖_∞))` by compactly supported unit-mass
mollification at scale `√t` and comparison, including the derivative bounds of the
mollifications from `ω`; thus `sup_i ‖u_i(·,t) − g_i‖_∞ → 0`. Transport by time reversal.

- The solution map `u₀ ↦ u(·,t)` for fixed `t > 0` is bounded `BUC → C_b^{2,α}`.
- The estimate's exponent `1 + α/2` is the parabolic order of `C^{2+α,1+α/2}`.

**Checks.**

- Heat equation with `u₀ = |x| ∧ 1` (Lipschitz, in `BUC`): `u(·,t)` is smooth for `t > 0` with
  `‖u(·,t) − u₀‖_∞ ≤ C√t`, matching `ω(√t)` for `ω(r) = r`.
- `u₀ = sign x₁` is bounded but not in `BUC`: `‖S(t)u₀ − u₀‖_∞ = 1`, so the trace statement
  fails outside `BUC`, as in §6.3.
- The weighted norm `δ^{1+α/2}‖u‖_{2+α;[δ,T]}` for `u = S(t)u₀`, `u₀ = |x| ∧ 1`: `‖D_x²u(·,t)‖_∞`
  is of order `t^{−1/2}` and `[D_x²u]_{α,par}` of order `t^{−(1+α)/2}` on `[δ,T]`, so the product
  with `δ^{1+α/2}` is bounded: the weight is the right one.
- Equicontinuity: `g_i(x) = sin(x/i)`, `i ≥ 1`, with `ω(r) = r`, and `g_i(x) = sin(ix)` is
  uniformly bounded but not uniformly equicontinuous, and `sup_i ‖S(t)g_i − g_i‖_∞ = 1` for
  every `t > 0`.

*Needs:* §6.6; §6.3 `BUC` realization; Mathlib `UniformEquicontinuous`, `ContDiffBump`.

### 6.8 Every derivative order (F27.5)

For every integer `k ≥ 0`, take `a, b, c, f ∈ C_{par,b}^{k+α}(Q)` in the full norm of §6.4, the
same ellipticity, and `u₀ ∈ C_b^{k+2,α}(ℝⁿ)`. Prove that the initial and terminal operators are
isomorphisms between `C_{par,b}^{k+2+α}(Q)` and `C_{par,b}^{k+α}(Q) × C_b^{k+2,α}(ℝⁿ)`, with
estimates and coefficient dependence in these norms. Start the higher-space method of
continuity from the heat potentials with the corresponding higher estimates; prove the
inductive a priori estimate for functions already in the higher space, absorbing lower terms
by §6.4; spatial differentiation reduces the order by one, and the equation recovers time
derivatives and their temporal Hölder seminorms. Combine with higher-space continuity and
base-space uniqueness, and give the separate regularity proof by spatial difference quotients
with passage to the limit and continuous one-sided endpoint traces. No boundary compatibility
is needed on the whole space. Smooth data and coefficients with bounded Hölder derivatives of
every order give solutions in every finite-order space. Export the positive-time estimates for
§6.7.

- The order-`k` isomorphism restricts to the order-`k+1` one on the smaller spaces.
- Differentiating the equation in `x` gives the equation for `D_x u` with the differentiated
  coefficients as lower-order terms.

**Checks.**

- `k = 0` recovers §6.6 exactly.
- `u₀ = cos x`, `a = 1`: `u = e^{−t} cos x` is in every `C_{par,b}^{k+2+α}(Q)`, since every mixed
  derivative is bounded by `1` and every Hölder seminorm is finite, consistent with smooth
  data giving every order.
- `u₀ = |x|^{3+β}` smoothed at infinity with `0 < β < α`: `u₀ ∈ C_b^{3,β} ∖ C_b^{3,α}`, so the
  order-`1` isomorphism (`k = 1`) does not apply and `u` is not in `C_{par,b}^{3+α}`; the data
  space is sharp.
- Differentiating `u_t − u_xx = f` once gives `(u_x)_t − (u_x)_xx = f_x`, so for `f ∈ C^{1+α}`
  the derivative solves the base problem with datum `f_x ∈ C^{α}`, which is the induction
  step at `k = 1`.

*Needs:* §6.4–§6.7.

### 6.9 Spatial weights (F27.6)

Let `w(x) > 0` be smooth and time-independent with bounded `α`-Hölder derivatives of `log w` of
positive orders `1` through `k + 2`, with no boundedness of `log w` itself. Define the weighted
class by `v = u/w ∈ C_{par,b}^{k+2+α}(Q)`. Prove `(Pu)/w = P_w v` with unchanged `a`,
`b_wⁱ = bⁱ + 2aⁱʲ∂_j log w` and
`c_w = c + aⁱʲ(∂_{ij} log w + ∂_i log w ∂_j log w) + bⁱ∂_i log w`; the forcing and trace become
`f/w` and `u₀/w`. Prove that the transformed coefficients lie in the required Hölder spaces,
then transport the estimates, inverses, the `BUC` trace theorem in the weighted uniform norm
`‖u/w‖_∞` and time reversal.

- The transformation is an isomorphism of the weighted classes with the unweighted ones.
- Ellipticity is unchanged, since `a` is.

**Checks.**

- `w = e^{φ}` with `φ = log w`: `∂_i u = w(∂_i v + v∂_iφ)`,
  `∂_{ij}u = w(∂_{ij}v + ∂_iv ∂_jφ + ∂_jv ∂_iφ + v(∂_{ij}φ + ∂_iφ ∂_jφ))`, and with symmetric `a`
  the drift collects `2aⁱʲ∂_jφ` and the zero-order term `aⁱʲ(∂_{ij}φ + ∂_iφ∂_jφ) + bⁱ∂_iφ`,
  as displayed; a non-symmetric `a` would give `aⁱʲ + aʲⁱ` in place of `2aⁱʲ`.
- `w(x) = 1 + e^{x}` in dimension one: `log w` has derivatives `e^x/(1 + e^x)` and
  `e^x/(1 + e^x)²`, bounded with all higher derivatives bounded, while `log w` itself is
  unbounded; the class is nonempty in every order and contains `u = w`, since `v = 1`.
- `w = e^{x}`: `b_w = b + 2a`, `c_w = c + a + b`, constants, so the weighted heat equation is a
  heat equation with constant drift and potential, solvable by the unweighted theory.
- A weight with unbounded `∂ log w`, such as `w = e^{x²}`, is excluded: `c_w` would contain
  `4ax²`, unbounded, and the transported estimate's constants would be infinite.

*Needs:* §6.6–§6.8.

### Examples

The acceptance examples of this layer are the energy identity for `e^{−t} sin x`; the ill-posed
backward problem `e^{k²t} sin kx`; the heat kernel's generator `Δ` and the `2π` witness
`exp(−4π²t|ξ|²)`; the parabolic distances of `(0,1)` and `(0,4)` from the origin; the time
reversal of `u = s`; the `BUC` trace for `|x| ∧ 1` and its failure for `sign x₁`; and the
weight `1 + e^{x}`.

### Dependencies

Layers 1 (§1.1, §1.3, §1.7), 3 (§3.2) and 4 (§4.1, §4.4), §5.1 for improved regularity;
Mathlib's Bochner integral, ODE theory, snowflaked and `WithLp` metrics, Hölder norms and
Neumann series; Tau Ceti's heat kernel, parabolic maximum principle and semigroup library;
OneParameterSemigroups Part A and OperatorTheory as cited.

## Layer 7: dyadic analysis, Besov spaces and paraproducts (X0)

This layer owns the Euclidean dyadic partition, the Bernstein and Littlewood–Paley estimates,
the Besov spaces and Bony's paraproducts; PseudodifferentialOperators consumes them and owns
their transport to bundles and the real-interpolation identities. Layer 8 consumes them here,
and PDE, Part II consumes them for its stochastic models.

### 7.1 Dyadic partition, Bernstein and Littlewood–Paley (X0.1)

Fix a smooth radial `χ` on `ℝ^d` with `χ = 1` on the ball of radius `1` and `χ = 0` outside the
ball of radius `2`, nonincreasing in `|ξ|`, and put `ψ(ξ) = χ(ξ/2) − χ(ξ)`, supported in the
annulus `1 ≤ |ξ| ≤ 4`. Define the inhomogeneous blocks `P_0 f = 𝓕⁻¹(χ 𝓕f)`,
`P_j f = 𝓕⁻¹(ψ(2^{−j}·) 𝓕f)` for `j ≥ 1`, and the homogeneous blocks `Ṗ_j f = 𝓕⁻¹(ψ(2^{−j}·)𝓕f)`
for `j ∈ ℤ`, as Fourier multipliers on tempered distributions (Mathlib's `FourierMultiplier`
with the `2π` convention of the Conventions), so that `Σ_{j≥0} P_j = I` on `𝓢'` and
`Σ_{j∈ℤ} Ṗ_j = I` on `𝓢'` modulo polynomials. Prove the Bernstein inequalities: for `𝓕f`
supported in the ball of radius `2^j`, `‖D^α f‖_q ≤ C 2^{j|α| + jd(1/p − 1/q)}‖f‖_p` for
`1 ≤ p ≤ q ≤ ∞`, and for `𝓕f` supported in the annulus, the reverse bound
`‖f‖_p ≤ C 2^{−j|α|}‖D^αf‖_p` (Bahouri–Chemin–Danchin, *Fourier Analysis and Nonlinear Partial
Differential Equations*, Lemma 2.1), with `C` depending on `d, α, p, q` and `χ` only. Prove the
Littlewood–Paley square-function theorem: for `1 < p < ∞`,
`‖f‖_p ≈ ‖(Σ_{j≥0} |P_j f|²)^{1/2}‖_p` with constants depending on `d, p, χ` (Grafakos,
*Classical Fourier Analysis*, Theorem 6.1.2), through §2.3's vector-valued Calderón–Zygmund
theory and §2.1's Fefferman–Stein inequality, as an extension of §2.3. Prove the almost
orthogonality `P_j P_k = 0` for `|j − k| ≥ 2` and the finite-overlap identities, and the
periodic versions on `𝕋^d = ℝ^d/ℤ^d` by Fourier series.

- The blocks are bounded on every `Lᵖ`, `1 ≤ p ≤ ∞`, uniformly in `j`, since their kernels
  are `L¹`-dilates of one Schwartz function.
- `P_j` commutes with translations, derivatives and the heat semigroup of §6.3, with
  `‖e^{tΔ}P_j f‖_p ≤ C exp(−c 4^j t)‖P_j f‖_p` for `j ≥ 1`.
- Two admissible cutoffs give blocks that agree up to finitely many neighbouring blocks, which
  is the cutoff independence of §7.2.

**Checks.**

- `f = exp(2πi ξ₀·x)` with `|ξ₀| = 2^j`, as a tempered distribution: `P_j f = ψ(2^{−j}ξ₀) f`
  and `Ṗ_k f = 0` for `|k − j| ≥ 2`; `|∇f| = 2π 2^j |f|`, so Bernstein's constant for `|α| = 1`,
  `p = q = ∞` is at least `2π`, and the reverse inequality is an equality up to `2π`.
- The constant `1`: `𝓕1 = δ₀`, `P_0 1 = 1` and `P_j 1 = 0` for `j ≥ 1`; in the homogeneous
  decomposition `Ṗ_j 1 = 0` for every `j`, which is why homogeneous spaces are taken modulo
  polynomials.
- Square function on `L²`: `‖(Σ_j |P_j f|²)^{1/2}‖₂² = ∫ (Σ_j ψ_j(ξ)²)|𝓕f(ξ)|² dξ`; at each `ξ`
  at most two consecutive `ψ_j` are nonzero and they sum to `1`, so `1/2 ≤ Σ_j ψ_j(ξ)² ≤ 1` and
  the `L²` constants are `1/√2` and `1`. Equality `‖f‖₂² = Σ_j ‖P_j f‖₂²` would need
  `Σ_j ψ_j² = 1`, which a partition of unity does not satisfy.
- `p = 1` and `p = ∞` are excluded from the square-function theorem: the Hilbert transform is a
  bounded combination of block operators on `L²`, and its unboundedness on `L¹` (§2.3) shows the
  equivalence fails there.

*Needs:* Mathlib `FourierMultiplier`, Schwartz space, Plancherel; §2.1 Fefferman–Stein; §2.3
vector-valued Calderón–Zygmund theory; §6.3 heat semigroup for the heat-block estimate.

### 7.2 Besov spaces (X0.2)

Define, for `s ∈ ℝ` and `1 ≤ p, q ≤ ∞`, the inhomogeneous Besov space `B^s_{p,q}(ℝ^d)` as the
tempered distributions with finite norm `‖(2^{js}‖P_j f‖_p)_{j≥0}‖_{ℓ^q}`, and the homogeneous
`Ḃ^s_{p,q}` as distributions modulo polynomials with the norm over `j ∈ ℤ` and the convergent
reconstruction `f = Σ_j Ṗ_j f` in `𝓢'` modulo polynomials when `s < d/p` or `s = d/p`, `q = 1`
(Bahouri–Chemin–Danchin, Definitions 2.15 and 2.68, Proposition 2.71). Prove independence of
the cutoff with equivalent norms, completeness, the embeddings `B^s_{p,1} ⊆ H^{s,p} ⊆ B^s_{p,∞}`
for `1 ≤ p ≤ ∞` (with `H^{s,p}` Mathlib's Bessel scale) and `B^s_{p,q} = H^{s,2}` at `p = q = 2`,
the Bernstein embeddings `B^{s}_{p,q} ⊆ B^{s − d(1/p − 1/r)}_{r,q}` for `p ≤ r`, and the periodic
versions on `𝕋^d`. For noninteger `s > 0` write `𝒞^s = B^s_{∞,∞}` and prove `𝒞^s = C^{⌊s⌋, s − ⌊s⌋}_b`
with equivalent norms (Bahouri–Chemin–Danchin, Proposition 2.76 and the remark after it); the
little space `c^s` is the closure of the Schwartz functions in `𝒞^s`, used wherever strong
continuity at `t = 0` or a separable carrier is needed, since smooth functions are not dense in
`𝒞^s`. PseudodifferentialOperators Layer 5 consumes this carrier and the single-block norm
below for its bundle transport and real interpolation; the interpolation identities are its
targets, not this section's.

- `B^s_{p,q}` is a Banach space, decreasing in `s`, increasing in `q`, with
  `B^{s}_{p,q} ⊆ B^{s'}_{p,q'}` for `s' < s` and every `q, q'`.
- Multiplication by a smooth bounded function with bounded derivatives is bounded on every
  `B^s_{p,q}`, and the heat semigroup satisfies `‖e^{tΔ}f‖_{𝒞^{s+2σ}} ≤ C t^{−σ}‖f‖_{𝒞^s}` for
  `σ ≥ 0`, with the periodic version on `𝕋^d`.
- Duality: for `1 ≤ p, q < ∞`, `(B^s_{p,q})^* = B^{−s}_{p',q'}` through the `L²` pairing.

**Checks.**

- One annular block: if `𝓕f` is supported in `{2^j ≤ |ξ| ≤ 2^{j+1}}`, then `P_k f = 0` for
  `|k − j| ≥ 2`, and the norm is `(2^{(j−1)s}‖P_{j−1}f‖_p^q + 2^{js}‖P_jf‖_p^q + 2^{(j+1)s}‖P_{j+1}f‖_p^q)^{1/q}`;
  when `𝓕f` is supported where only `ψ_j = 1`, this is exactly `2^{js}‖P_j f‖_p = 2^{js}‖f‖_p`.
  Changing `s` from `0` to `1` at `j = 2` multiplies the value by `4`. This single-block value is
  the contribution PseudodifferentialOperators' interface must reproduce.
- `s = 0`, `p = q = 2`: `‖f‖_{B^0_{2,2}} ≈ ‖f‖_{L²}` by §7.1's square function, with the
  constants `1/√2` and `1` of the cutoff.
- `𝒞^{1/2}` on `ℝ` contains `|x|^{1/2}` cut off at infinity, whose block norms
  `2^{j/2}‖P_j f‖_∞` are bounded and do not tend to `0`, so `f ∉ c^{1/2}`; the smooth functions
  are not dense in `𝒞^{1/2}`, and `c^{1/2}` is a proper closed subspace.
- The Dirac mass `δ₀` on `ℝ^d` lies in `B^{−d/p'}_{p,∞}` for every `p` and in `𝒞^{−d}`: its blocks
  are `𝓕⁻¹ψ_j`, with `‖𝓕⁻¹ψ_j‖_p = 2^{jd/p'}‖𝓕⁻¹ψ‖_p`; so negative regularity is exactly
  `−d/p'`, and a candidate definition giving `δ₀` regularity `0` is refuted.

*Needs:* §7.1; Mathlib `TemperedDistribution`, `TemperedDistribution.MemSobolev`; §1.7 Hölder
spaces; §6.3 heat semigroup.

### 7.3 Paraproducts (X0.3)

Construct Bony's decomposition `fg = T_f g + T_g f + R(f, g)` from the dyadic blocks:
`T_f g = Σ_j S_{j−1}f · P_j g` with `S_j = Σ_{k≤j} P_k`, the symmetric term, and the resonant
term `R(f,g) = Σ_{|j−k|≤1} P_j f · P_k g`. Prove the paraproduct estimates
`‖T_f g‖_{𝒞^{β}} ≤ C‖f‖_∞‖g‖_{𝒞^β}` for every `β ∈ ℝ`,
`‖T_f g‖_{𝒞^{α+β}} ≤ C‖f‖_{𝒞^α}‖g‖_{𝒞^β}` for `α < 0`, and the resonant estimate
`‖R(f,g)‖_{𝒞^{α+β}} ≤ C‖f‖_{𝒞^α}‖g‖_{𝒞^β}` for `α + β > 0` (Bahouri–Chemin–Danchin, Theorems 2.82
and 2.85), hence the product map `𝒞^α × 𝒞^β → 𝒞^α` for `α < 0 < β` with `α + β > 0`, including
the local-in-time weighted versions that PDE, Part II uses. Products of two negative-regularity
fields are not supplied by this theorem; the enhanced Gaussian products of the singular
stochastic models are constructed in PDE, Part II.

- The decomposition is bilinear and the three terms are bounded as stated with constants
  depending on `d, α, β` and the cutoff.
- The commutator `[P_j, f]g` gains one derivative for Lipschitz `f`.

**Checks.**

- `f = g = exp(2πi ξ₀·x)`, `|ξ₀| = 2^j`: `fg = exp(4πi ξ₀·x)` has frequency `2^{j+1}`; the
  paraproducts `T_f g` and `T_g f` vanish, since `S_{j−1}f = 0`, and the resonant term carries the
  product, as it must for two fields at the same frequency.
- `f = 1`: `S_k 1 = P_0 1 = 1` for `k ≥ 0` and `P_j 1 = 0` for `j ≥ 1`, so
  `T_1 g = Σ_{j≥2} P_j g`, `T_g 1 = 0` (its only candidate term has `S_{−1}g = 0`) and
  `R(1, g) = P_0 g + P_1 g`; the three sum to `g`, as the decomposition requires.
- `α + β ≤ 0` is excluded: on `ℝ`, `f = g = |x|^{−1/2}` cut off at infinity lie in `𝒞^{−1/2}`, and
  their product `|x|^{−1}` is not locally integrable, so it is no distribution and the resonant
  series diverges; the theorem makes no claim at `α + β = −1`.
- The product `𝒞^{−1/4} × 𝒞^{1/2} → 𝒞^{−1/4}` on `ℝ`: for `f = |x|^{−1/4}` (cut off) and
  `g = |x|^{1/2}` (cut off), `fg = |x|^{1/4} ∈ 𝒞^{1/4} ⊆ 𝒞^{−1/4}`, consistent.

*Needs:* §7.1; §7.2.

### Examples

The acceptance examples of this layer are the single-frequency exponential for Bernstein and the
blocks; the constant `1` in both decompositions; the single-block Besov value `2^{js}‖P_j f‖_p`;
`δ₀ ∈ 𝒞^{−d}`; and the same-frequency product carried by the resonant term.

### Dependencies

Layer 2 (§2.1, §2.3) and §6.3; §1.7 for the Hölder identification; Mathlib's Fourier
multipliers and tempered distributions. Layer 8 and PDE, Part II consume this layer.

## Layer 8: Strichartz estimates (X1)

### 8.1 Dispersive kernels and the time-pairing engine (X1.1)

On `ℝ^d` with Lebesgue measure construct the unitary Schrödinger propagator `S(t) = exp(itΔ)`
on `L²` through its Fourier multiplier `exp(−4π²it|ξ|²)`, prove its group and strong-continuity
laws and the dispersive estimate `‖S(t)f‖_∞ ≤ (4π|t|)^{−d/2}‖f‖₁` for `t ≠ 0`, first for
Schwartz `f` and then by the bounded-operator extension (Tao, *Nonlinear Dispersive Equations*,
§2.2, the kernel `(4πit)^{−d/2}exp(i|x|²/(4t))`). Set `D = √(−Δ)` with multiplier `2π|ξ|` and
construct `W±(t) = exp(±itD)`; for each annular block `P_j` prove
`‖W±(t)P_j f‖_∞ ≤ C 2^{jd}(1 + 2^j|t|)^{−(d−1)/2}‖f‖₁` for `d ≥ 2`, a stationary-phase estimate
owned here (Tao, §2.5); no unlocalized wave `L¹ → L^∞` bound is inferred. Construct the
reusable `TT*` time-pairing argument for an `L²`-energy family with decay `|t − s|^{−σ}`: for
`q, r ≥ 2`, `σ`-admissibility is `1/q + σ/r = σ/2`, excluding `(q, r, σ) = (2, ∞, 1)` and
including the energy pair `(∞, 2)`; dual exponents use `1/∞ = 0`. Prove the non-endpoint bounds
by interpolation and fractional time integration (Hardy–Littlewood–Sobolev), and own the
endpoint proof: decompose the retarded bilinear pairing into Whitney rectangles with
`|t − s| ≈ 2^k`, prove the localized bilinear bounds at nearby exponents, and use bilinear real
interpolation and dyadic summation for the endpoint when `σ > 1` (Keel–Tao, *Amer. J. Math.*
120 (1998), Theorem 1.2, p. 956); Christ–Kiselev is not applied at equality of the time
exponents, and the retarded truncation lemma for strict inequalities is proved separately.

- `S(t)` commutes with Fourier multipliers, derivatives and the blocks of §7.1.
- The decay exponent `σ = d/2` for Schrödinger and `σ = (d−1)/2` for the frequency-localized
  wave propagator.

**Checks.**

- The multiplier `exp(−4π²it|ξ|²)`: with `Δ ↔ −4π²|ξ|²`, `exp(itΔ) ↔ exp(−4π²it|ξ|²)`, and
  the kernel `(4πit)^{−d/2}exp(i|x|²/(4t))` has modulus `(4π|t|)^{−d/2}`, which is the
  dispersive constant; a model without the `4π²` gives `(4π t)^{−d/2}` with the wrong kernel.
- Gaussian datum `f = exp(−π|x|²)` in `d = 1`: `S(t)f` is a complex Gaussian with
  `‖S(t)f‖_∞ = (1 + 16π²t²)^{−1/4}`, and `‖f‖₁ = 1`, so the bound `(4π|t|)^{−1/2}` holds with room
  for all `t ≠ 0` and is attained in rate as `t → ∞`.
- The excluded triple `(2, ∞, 1)`: in `d = 2`, Schrödinger has `σ = 1`, and the pair `(2, ∞)`
  is admissible in exponent but the estimate is false; the admissibility predicate excludes it
  and a predicate that admits it is refuted (Tao, §2.3, the remark after Theorem 2.3).
- `TT*` with the trivial family `U(t) = I` (`σ = 0`): the only admissible pair is `(∞, 2)`, and
  the engine returns the energy identity `‖f‖_{L^∞L²} = ‖f‖₂`.

*Needs:* Mathlib Fourier transform on `L²` (Plancherel), `FourierMultiplier`; §7.1 blocks;
§2.2 interpolation; Hardy–Littlewood–Sobolev from §2.1 and §2.2.

### 8.2 Schrödinger Strichartz estimates (X1.2)

For every integer `d ≥ 1` call `(q, r)` admissible when `2 ≤ q, r ≤ ∞`, `2/q + d/r = d/2` and
`(q, r, d) ≠ (2, ∞, 2)`. For any two admissible pairs `(q, r)`, `(q̃, r̃)` and every interval
`I = [0, T]`, `0 < T ≤ ∞`, construct the mild solution of `i∂_t u + Δu = F`, `u(0) = f`, with the
Duhamel convention `u = S(t)f − i∫_0^t S(t − s)F(s) ds`, and prove
`‖u‖_{L^q(I;L^r)} ≤ C(‖f‖₂ + ‖F‖_{L^{q̃'}(I;L^{r̃'})})` with `C` independent of `T` (Tao,
Theorem 2.3, printed pp. 74–75; Keel–Tao, Theorem 1.2). Construct by completion of smooth data
and forcing, prove the distributional equation, `C(I; L²)` when the forcing is in the stated
dual Strichartz space, and uniqueness in the energy and Strichartz class through the Duhamel
identity. Include the `d ≥ 3` endpoint `(2, 2d/(d−2))`, the `d = 1` pair `(4, ∞)` and the energy
pair, and the full-line homogeneous estimate. Commutation with Bessel and Fourier derivatives
gives the regularity-shifted estimates on their exact domains.

- The admissible pairs form the segment of the line `2/q + d/r = d/2` between `(∞, 2)` and the
  endpoint, closed except at `(2, ∞)` in `d = 2`.
- Tao's text uses `Δ/2`; the time rescaling `t ↦ t/2` converts his constants to the convention
  here.

**Checks.**

- `d = 1`, `(q, r) = (4, ∞)`: `2/4 + 1/∞ = 1/2 = d/2`, admissible; `d = 3`, `(2, 6)`:
  `1 + 3/6 = 3/2`, the endpoint; `d = 2`, `(2, ∞)`: `1 + 0 = 1 = d/2` in exponent but excluded.
- The energy pair `(∞, 2)` gives `‖u‖_{L^∞L²} ≤ ‖f‖₂ + ‖F‖_{L¹L²}`, the unitary energy identity
  plus Minkowski, with `C = 1`; a constant below `1` is refuted by `F = 0`.
- Scaling: `u_λ(x,t) = u(λx, λ²t)` solves the same equation; `‖u_λ‖_{L^qL^r} = λ^{−d/r − 2/q}‖u‖`
  and `‖f_λ‖₂ = λ^{−d/2}‖f‖₂`, equal exactly on the admissible line, so no other line of
  exponents admits a `T`-independent estimate.
- `F = 0`, `f` the Gaussian of §8.1 in `d = 1`: `‖S(t)f‖_∞ ≈ (16π²t²)^{−1/4}` is in `L⁴_t`
  exactly, since `∫ (1 + 16π²t²)^{−1} dt < ∞`, matching `(4, ∞)`.

*Needs:* §8.1; §7.2 for the regularity-shifted statements; Mathlib Bochner `Lp` of
Banach-valued functions.

### 8.3 Wave Strichartz estimates (X1.3)

For `d ≥ 2` let `q, r ≥ 2` satisfy `1/q + (d−1)/(2r) ≤ (d−1)/4`, excluding `(q, r, d) = (2, ∞, 3)`,
and put `s(q, r) = d/2 − d/r − 1/q`. For `r < ∞` prove the full-line homogeneous bound
`‖W±(t)f‖_{L^q_t L^r_x} ≤ C‖f‖_{Ḣ^s}` (Tao, Theorem 2.6, printed pp. 77–79; the energy pair has
`s = 0`), constructing the Littlewood–Paley summation with `q, r ≥ 2` rather than interchanging
an `L^∞` norm with a square sum. At `r = ∞` retain the endpoint-space bound with `Ḃ^s_{2,1}` on
the right, including `(∞, ∞)` with `s = d/2`; the false embedding `Ḣ^{d/2} → L^∞` is not
asserted. The endpoint means `q = 2` for `d ≥ 4` and finite `r = 2(d−1)/(d−3)`, handled by §8.1,
not the excluded `d = 3` pair. For `∂_t²u − Δu = F` with data `(f, g)`, use
`u = cos(tD)f + D^{−1}sin(tD)g + ∫_0^t D^{−1}sin((t−s)D)F(s) ds`, and prove, for all admissible
pairs including the spatial-infinity pairs with their Besov summation, the retarded bound

    ‖u‖_{L^q([0,T];L^r)} ≤ C[‖f‖_{Ḃ^s_{2,1}} + ‖g‖_{Ḃ^{s−1}_{2,1}} + Σ_j 2^{j(s+s̃−1)}‖P_j F‖_{L^{q̃'}([0,T];L^{r̃'})}]

with data and forcing in the completed homogeneous classes, convergence of the dyadic series
defining the solution, and `C` independent of `T`: first the frequency-localized estimates,
then the retarded time bounds and reconstruction. Export the finite-`r` square-function
improvements where the mixed norms justify them, without replacing the displayed `ℓ¹` bound by
an endpoint Sobolev assertion. Prove energy uniqueness and agreement with classical solutions
for smooth data. Treat the one-dimensional wave equation separately by d'Alembert's formula
with its energy and finite-time bounds; it has no positive dispersive decay exponent.

- The wave-admissible region is the closed triangle in the `(1/q, 1/r)` plane cut by the
  stated line, minus the one excluded vertex.
- `s(q, r)` is the scaling-critical regularity: `u_λ = u(λx, λt)` fixes the estimate exactly
  when the Sobolev index is `s(q, r)`.

**Checks.**

- The energy pair `(∞, 2)`: `s = d/2 − d/2 − 0 = 0` and the estimate is the energy identity
  `‖W±(t)f‖₂ = ‖f‖₂` with `C = 1`.
- `d = 3`, `(q, r) = (2, ∞)`: `1/2 + 1/∞ = 1/2 = (d−1)/4` lies on the boundary line but is the
  excluded Knapp-type pair; `d = 4`, `(2, 6)`: `1/2 + 3/12 = 3/4 = (d−1)/4`, the admissible
  endpoint with `r = 2(d−1)/(d−3) = 6` and `s = 2 − 4/6 − 1/2 = 5/6`.
- `d = 1`: the dispersive exponent `(d−1)/2` is `0`, `W±(t)f(x) = f(x ∓ t)` has
  `‖W±(t)f‖_∞ = ‖f‖_∞` with no decay, so no Strichartz gain exists and d'Alembert's formula is
  the right statement.
- `Ḣ^{d/2} ⊄ L^∞`: `f = log log(1/|x|)` cut off in `d = 2` lies in `Ḣ^1` and is unbounded, so the
  `(∞, ∞)` bound must use `Ḃ^{d/2}_{2,1}`, which `f` is not in, since its block norms `2^j‖Ṗ_j f‖₂`
  are not summable.

*Needs:* §8.1; §7.2 homogeneous Besov spaces; §7.1 blocks.

### Examples

The acceptance examples of this layer are the Gaussian under the Schrödinger flow, the
admissibility computations in `d = 1, 2, 3, 4`, the scaling check on the admissible line, and
the one-dimensional wave equation without dispersion.

### Dependencies

Layer 7 and §2.1–§2.3; Mathlib's `L²` Fourier theory and Bochner spaces. Layer 9 does not
depend on this layer.

## Layer 9: quasilinear elliptic existence by a compact map (X2)

### 9.1 Global linear input (X2.1)

Let `Ω ⊂ ℝ^d` be a nonempty bounded `C^{1,1}` domain, `d ≥ 1`, defined by the Lipschitz predicate
of §1.6 with `C^{1,1}` graph functions; fix `q > max(1, d/2)`, `s > max(2, d)` and
`0 < β < min(α_DG, 2 − d/q, 1 − d/s, 1)`, where `α_DG` is a boundary De Giorgi exponent proved
uniform over the class. For measurable real matrices `a` with `ξ·a(x)ξ ≥ λ|ξ|²` and `‖a(x)‖ ≤ M`
construct the weak Dirichlet solution of `−div(a∇u) = f + div F` with trace `g`, for
`f ∈ L² ∩ L^q`, `F ∈ L^s` and `g` admitting a `C¹` bounded extension to `Ω̄`, by §4.2's lifting
(Lax–Milgram on `u − g ∈ H¹₀`), and prove the global estimate
`‖u‖_{C^β(Ω̄)} ≤ C(‖g‖_{C¹} + ‖f‖₂ + ‖f‖_q + ‖F‖_s)` with `C` depending on `d, Ω, λ, M, q, s, β`
(Gilbarg–Trudinger, Theorem 8.29): flatten finitely many boundary charts, subtract `g`, prove
the boundary Caccioppoli and level-set decay (or the reflected zero-trace divergence
equation), and combine the forced interior oscillation estimate of §5.4 with a finite covering.
Include the `d = 1` direct energy and interval-embedding argument. Prove continuous dependence
in `H¹` on uniform coefficient changes and data, and identify the continuous representative and
its boundary trace.

- The estimate is uniform over the coefficient class with fixed `λ, M`.
- The solution map is affine in `(f, F, g)` for fixed `a`.

**Checks.**

- `d = 1`, `Ω = (0,1)`, `a = 1`, `f = 1`, `F = 0`, `g = 0`: `u = x(1−x)/2`, `‖u‖_{C^β} ≤ 1`, and
  the `C¹` norm of `g` is `0`.
- The exponent's dependence on `q` in `d = 3`: `f = |x|^{−γ}` on the unit ball lies in `L^q`
  exactly for `γq < 3`, and the radial solution of `−Δu = f` has `|∇u| ≈ |x|^{1−γ}`, so `u` is
  `(2 − γ)`-Hölder at best; as `γ ↑ 3/q` this exponent decreases to `2 − 3/q`, which tends to
  `0` as `q ↓ 3/2`, matching the bound `β < 2 − d/q` and excluding `q ≤ d/2`.
- The boundary estimate needs the boundary: on the slit disk the harmonic function
  `r^{1/2}sin(θ/2)` with boundary values of class `C¹` away from the tip is only `1/2`-Hölder,
  and the `C^{1,1}` hypothesis excludes the slit.
- Continuous dependence: perturbing `a = 1` to `a = 1 + ε` on `(0,1)` changes `u = x(1−x)/2` to
  `u/(1 + ε)`, an `H¹` change of order `ε`.

*Needs:* §1.6 Lipschitz domains and traces; §4.2; §5.4; §1.4 embeddings.

### 9.2 The nonlinear map and the homotopy (X2.2)

Let `A : Ω̄ × ℝ → Mat(d, ℝ)` be continuous, uniformly bounded and coercive with the same `λ, M`,
and uniformly Lipschitz in the second variable. For `v ∈ C(Ω̄)` define `T(v)` as §9.1's solution
with `a(x) = A(x, v(x))` and fixed `f, F, g`; construct `T` as an actual map `C(Ω̄) → C(Ω̄)`.
Uniform convergence of `v` gives uniform convergence of `a`; subtracting the two weak equations
and using coercivity gives `H¹` convergence, and the uniform `C^β` estimate with Arzelà–Ascoli
upgrades it to `C(Ω̄)` convergence, so `T` is continuous and maps every set into one fixed
bounded `C^β` ball, hence a sufficiently large closed convex sup-norm ball into itself.
Consume BanachAlgebras A8 (the real compact-map Schauder theorem, which consumes the
finite-dimensional Brouwer theorem of AlgebraicTopology Stage 2, item 7) to obtain `u ∈ H¹`
with `u − g ∈ H¹₀` and `∫ A(x,u)∇u·∇φ = ∫ fφ − ∫ F·∇φ` for every `φ ∈ H¹₀`, with continuous
representative in `C^β(Ω̄)` and the same bound. Export the Leray–Schauder realization: solutions
of `u = θT(u)`, `θ ∈ [0,1]`, solve the linear equation with right side `θ(f + div F)` and boundary
`θg`, so the estimate is uniform in `θ`; derive the Leray–Schauder adapter from the same
compact-map theorem by choosing `R` larger than every homotopy solution norm and applying
Schauder to the radial truncation `v ↦ min(1, R/‖T(v)‖)T(v)` on the `R`-ball, excluding a
boundary fixed point with truncation factor below `1` by the homotopy bound. No degree theory
is a premise. Compactness is not inferred from an unspecified quasilinear operator and
uniqueness is not claimed for arbitrary `A(x, u)`.

- `T` maps bounded sets to relatively compact sets of `C(Ω̄)`.
- The fixed-point set is closed and nonempty.

**Checks.**

- `A(x, u) = 1 + u²/(1 + u²)` on `(0,1)`, `f = 1`, `F = 0`, `g = 0`: `A` is bounded between `1`
  and `2` and Lipschitz in `u`; for every `v`, the solution of `−(a u')' = 1`, `u(0) = u(1) = 0`,
  with `a = A(·, v) ≥ 1` is `u(x) = ∫_0^x (c − s)/a(s) ds` with `c = ∫_0^1 (s/a) ds / ∫_0^1 (1/a) ds ∈ [0,1]`,
  so `|u| ≤ ∫_0^1 |c − s| ds ≤ 1/2`; hence `T` maps the ball of radius `1/2` of `C[0,1]` into
  itself and Schauder applies.
- In `d = 1` with `A = A(u)` depending on `u` alone, the substitution `w = Φ(u)`, `Φ' = A > 0`,
  turns the problem into the linear `−w'' = f`, so the solution is unique there; the theorem
  claims no uniqueness in general because no such substitution exists for `A(x, u)` in
  `d ≥ 2`.
- The radial truncation at `R`: for `‖T(v)‖ ≤ R` the truncated map equals `T`, and a fixed
  point `v` with `‖v‖ = R` and factor `θ = R/‖T(v)‖ < 1` would solve `v = θT(v)`, which the
  homotopy bound `‖v‖ < R` excludes.
- `θ = 0`: the homotopy equation `u = 0` has the solution `0`, which is the start of the
  Leray–Schauder path.

*Needs:* §9.1; BanachAlgebras A8; AlgebraicTopology Stage 2, item 7; Mathlib Arzelà–Ascoli.

### 9.3 Higher regularity and parameter families (X2.3)

Prove continuity and compactness uniformly for parameter families `A_η, f_η, F_η, g_η` with
the common bounds and uniform data convergence, producing a compact solution set and the
upper-semicontinuity conclusion, not a continuous single-valued solution map absent
uniqueness. For a `C^{2,α}` domain, `A` of class `C^{1,α}` jointly on each bounded `u`-range,
`f ∈ C^α`, `F ∈ C^{1,α}` and `g ∈ C^{2,α}`, bootstrap the constructed weak solutions to `C^{2,α}`:
first `C^β` gives Hölder coefficients, §5.3's divergence-form Schauder theory gives `C^{1,β'}`
for a positive `β'`, the non-divergence rewriting and §5.6 give `C^{2,β'}`, and composition with
further Schauder steps yields the stated `α`; own the global boundary adapters of §5.3 and §5.6,
keeping constants on the bounded `u`-range and proving the composition and chain rules.
Uniqueness is a separate conclusion only in the linear case or under an explicitly proved
strong-monotonicity estimate for the nonlinear weak operator on `H¹₀`; it is not a consequence
of Schauder or Leray–Schauder existence.

- The solution set depends upper-semicontinuously on the parameters.
- Under strong monotonicity the solution is unique and depends Lipschitz-continuously on the
  data in `H¹`.

**Checks.**

- `A` constant in `u`: the family is linear, the solution set is a point and the bootstrap
  recovers the linear `C^{2,α}` theory of §5.6.
- `A(x,u) = 1 + u²` on `(0,1)`, `g = 0`, `f = 1`: the flux `(1 + u²)u'` is monotone in `u'` for
  fixed `u` but the operator is not strongly monotone in `u`; the Check records that the
  uniqueness clause does not apply without the estimate.
- Bootstrap exponent bookkeeping with `A ∈ C^{1,α}`: `u ∈ C^β` gives `a = A(·, u) ∈ C^{β}` (a
  Lipschitz function of a `C^β` function); §5.3 gives `u ∈ C^{1,β}`; then
  `∂a = A_x + A_u u' ∈ C^{min(α,β)}`, so `a ∈ C^{1,min(α,β)}` and §5.6 gives `u ∈ C^{2,min(α,β)}`;
  finally `u' ∈ C^{1,·}` makes `∂a ∈ C^{α}`, so `a ∈ C^{1,α}` and `u ∈ C^{2,α}`.
- A family `A_η → A` uniformly with solutions `u_η`: every limit point of `u_η` is a solution for
  `A`, and the set of such limit points is compact in `C(Ω̄)` by the uniform `C^β` bound.

*Needs:* §9.2; §5.3; §5.6; §1.6 `C^{2,α}` domains.

### Examples

The acceptance examples of this layer are the interval problem with `A = 1 + u²/(1+u²)`, the
radial truncation argument, and the exponent bookkeeping of the bootstrap in `d = 1`.

### Dependencies

Layers 1, 4 and 5 (§5.3, §5.4, §5.6); BanachAlgebras A8 and AlgebraicTopology Stage 2, item 7;
Mathlib Arzelà–Ascoli. Layer 8 is not used.

## Downstream consumers

- **GeometricMeasureTheory** G3–G6 consumes §1.1–§1.3 (weak derivatives, Sobolev spaces, density,
  Fourier comparison), §1.5–§1.6 (Poincaré, the Lipschitz-domain predicate, the graph surface
  measure, trace and extension).
- **PseudodifferentialOperators** Layer 5 consumes §1.3–§1.7 (weak derivatives, trace,
  extension, embeddings, Hölder spaces), §2.1–§2.3 (maximal function, Riesz–Thorin, multiplier
  estimates) and §7.1–§7.2 (the Euclidean dyadic partition and Besov carrier, whose
  single-block value `2^{js}‖P_j f‖_p` its interface reproduces).
- **StochasticCalculus** consumes §2.1 (the maximal function), §3.1 and §3.4 (mean values,
  Dirichlet and Poisson theory), and Layers 3 and 6 for deterministic Dirichlet and parabolic
  inputs.
- **NoncommutativeIntegration** consumes the scalar Riesz–Thorin theorem of §2.2.
- **VariationalMethods** uses Tau Ceti's Dirichlet spectrum as an example and consumes nothing
  stated here.
- **PDE, Part II** consumes Layer 6 (the heat semigroup and the parabolic estimates) and
  Layer 7 (Besov spaces and paraproducts) for the cylindrical stochastic integral, Krylov's
  `Lᵖ` theory and the two-dimensional singular stochastic models.

## References

- L. C. Evans, *Partial Differential Equations*, 2nd ed., Graduate Studies in Mathematics 19,
  AMS, 2010: Sobolev spaces (Chapter 5), second-order elliptic equations (Chapter 6), parabolic
  equations and Galerkin (Chapter 7), harmonic functions (Chapter 2).
- D. Gilbarg, N. S. Trudinger, *Elliptic Partial Differential Equations of Second Order*,
  2nd ed., Springer, 1983: maximum principles (Chapter 3), Poisson's equation and Schauder theory
  (Chapters 4 and 6), Sobolev spaces (Chapter 7), De Giorgi–Nash–Moser (Chapter 8), `Lᵖ` theory,
  Aleksandrov–Bakelman–Pucci and Krylov–Safonov (Chapter 9).
- G. Leoni, *A First Course in Sobolev Spaces*, Graduate Studies in Mathematics 105, AMS,
  2009: Sobolev functions of one variable (Chapter 7).
- P. Grisvard, *Elliptic Problems in Nonsmooth Domains*, Pitman, 1985: Lipschitz domains
  (Definition 1.2.1.1).
- M. Giaquinta, L. Martinazzi, *An Introduction to the Regularity Theory for Elliptic Systems,
  Harmonic Maps and Minimal Graphs*, 2nd ed., Edizioni della Normale, 2012: Campanato spaces
  (Chapter 5), Gehring's lemma (Chapter 6).
- E. M. Stein, *Singular Integrals and Differentiability Properties of Functions*, Princeton,
  1970: the maximal function (Chapter I), singular integrals (Chapter II), multipliers
  (Chapter IV), Bessel potentials and Sobolev spaces (Chapter V), extension (Chapter VI).
- E. M. Stein, *Harmonic Analysis: Real-Variable Methods, Orthogonality, and Oscillatory
  Integrals*, Princeton, 1993: Calderón–Zygmund operators (Chapter VII).
- L. Grafakos, *Classical Fourier Analysis*, 3rd ed., Graduate Texts in Mathematics 249,
  Springer, 2014: interpolation (§1.3), the maximal function (§2.1), the Calderón–Zygmund
  decomposition and singular integrals (§5.3), vector-valued inequalities (§5.6), multipliers
  and Littlewood–Paley theory (§6.1–§6.2); *Modern Fourier Analysis*, 3rd ed., Graduate Texts in
  Mathematics 250, Springer, 2014: BMO and John–Nirenberg (§3.1).
- F. W. Gehring, *The `Lᵖ`-integrability of the partial derivatives of a quasiconformal
  mapping*, Acta Math. 130 (1973), 265–277, Lemma 3 (the reverse-Hölder lemma).
- R. R. Coifman, R. Rochberg, G. Weiss, *Factorization theorems for Hardy spaces in several
  variables*, Ann. of Math. 103 (1976), 611–635, Theorem I (the commutator theorem).
- D. Sarason, *Functions of vanishing mean oscillation*, Trans. Amer. Math. Soc. 207 (1975),
  391–405, Theorem 1.
- C. Rosales, [*Generalizing Hopf's boundary point lemma*](https://arxiv.org/abs/1806.07003),
  arXiv:1806.07003, Theorem 4.1 (preprint p. 9) and Remark 4.2 (p. 13), with the standing
  `n ≥ 2` of its Section 2 (p. 2).
- S. Armstrong, J. Kempe, [*Formalization of De Giorgi–Nash–Moser theory in
  Lean*](https://arxiv.org/abs/2604.05984), arXiv:2604.05984, with the accompanying
  [`scottnarmstrong/DeGiorgi`](https://github.com/scottnarmstrong/DeGiorgi) repository
  (Apache-2.0): the inverse-coercivity definition `EllipticCoeff`, its derived upper bounds
  `quadratic_upper` and `mixed_bound` with the same `Λ`, and `holder_Moser` in
  `DeGiorgi/Holder/PublicEstimate.lean`, the unit-ball, `λ = 1`, `n ≥ 3` statement that §5.4
  reconciles.
- N. G. Meyers, [*An `Lᵖ`-estimate for the gradient of solutions of second order elliptic
  divergence equations*](https://www.numdam.org/item/ASNSP_1963_3_17_3_189_0/), Ann. Scuola
  Norm. Sup. Pisa (3) 17 (1963), 189–206: Theorem 1 (p. 198), Theorem 2 (p. 200), the planar
  example (§5, p. 204).
- F. Chiarenza, M. Frasca, P. Longo, [*Interior `W^{2,p}` estimates for nondivergence elliptic
  equations with discontinuous coefficients*](https://hdl.handle.net/11568/17627), Ricerche
  Mat. 40 (1991), 149–168, and [*`W^{2,p}`-solvability of the Dirichlet problem for nondivergence
  elliptic equations with VMO coefficients*](https://doi.org/10.2307/2154379), Trans. Amer. Math.
  Soc. 336 (1993), 841–853: the interior estimate and the global `C^{1,1}`-boundary theory of
  §5.7.
- G. Di Fazio, [*`Lᵖ` estimates for divergence form elliptic equations with discontinuous
  coefficients*](https://www.iris.unict.it/handle/20.500.11769/2040), Boll. Un. Mat. Ital. (7)
  10-A (1996), 409–420, and P. Auscher, M. Qafsaoui, [*Observations on `W^{1,p}` estimates for
  divergence elliptic equations with VMO coefficients*](https://www.bdim.eu/item?id=BUMI_2002_8_5B_2_487_0),
  Boll. Un. Mat. Ital. (8) 5-B (2002), 487–509: the commutator method and its non-symmetric,
  `C¹`-boundary refinement in §5.2.
- G. M. Lieberman, *Second Order Parabolic Differential Equations*, World Scientific, 1996:
  maximum principles (Chapter 2), constant-coefficient Hölder estimates (Chapter 4), Schauder
  theory (Chapter 5).
- A. Lunardi, [*Linear and nonlinear diffusion problems*](https://people.dmi.unipr.it/alessandra.lunardi/LectureNotes/Cortona2004.pdf),
  Cortona lecture notes (2004), Corollary 4.2.10: the whole-space heat Cauchy problem in
  parabolic Hölder spaces; Chapter 3 supplies the interpolation framework.
- H. Bahouri, J.-Y. Chemin, R. Danchin, *Fourier Analysis and Nonlinear Partial Differential
  Equations*, Grundlehren 343, Springer, 2011: Bernstein's lemma (Lemma 2.1), Besov spaces
  (Definitions 2.15 and 2.68, Propositions 2.71 and 2.76), paraproducts (Theorems 2.82 and
  2.85).
- T. Tao, [*Nonlinear Dispersive Equations: Local and Global Analysis*](https://www.math.ucla.edu/~tao/preprints/chapter.pdf),
  CBMS Regional Conference Series 106, AMS, 2006: the Schrödinger dispersive estimate (§2.2),
  Strichartz estimates for Schrödinger (Theorem 2.3, printed pp. 74–75) and wave (Theorem 2.6,
  printed pp. 77–79).
- M. Keel, T. Tao, *Endpoint Strichartz estimates*, Amer. J. Math. 120 (1998), 955–980,
  Theorem 1.2 (p. 956): the abstract endpoint Strichartz theorem.
- The [Carleson project](https://github.com/fpvandoorn/carleson) (van Doorn–Thiele): the Lean
  formalization of the maximal function, Vitali covering and Calderón–Zygmund machinery to
  follow in Layer 2.

## Acknowledgements

This roadmap builds on discussions on the [Lean Zulip](https://leanprover.zulipchat.com/):

- [#AI authored projects > De Giorgi–Nash–Moser](https://leanprover.zulipchat.com/#narrow/channel/583339-AI%20authored%20projects/topic/De%20Giorgi%E2%80%93Nash%E2%80%93Moser),
  the De Giorgi–Nash–Moser formalization experiment that informed the regularity target, with
  Filippo A. E. Nuccio, Przemek Chojecki, and others.
- [#mathlib4 > PDE Theory](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/PDE%20Theory)
  (Anatole Dedecker, Michael Rothgang, Filippo A. E. Nuccio, Aditya Ramabadran), scoping the
  PDE theory to build on top of Mathlib's analysis stack.
- [#new members > elliptic PDEs](https://leanprover.zulipchat.com/#narrow/channel/113489-new%20members/topic/elliptic%20PDEs),
  discussing prerequisites for formalizing elliptic PDEs.
