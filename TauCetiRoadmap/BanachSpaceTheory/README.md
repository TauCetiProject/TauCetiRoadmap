# Roadmap: Banach space theory

**Summary.** Build the geometry and duality of Banach spaces over `ℝ` and `ℂ` on top of the
large Banach-space layer the pinned Tau Ceti already carries (annihilators and adjoints,
Goldstine, Eberlein–Šmulian, Milman–Pettis, Krein–Šmulian, Bishop–Phelps, Schauder bases with
James's basis criterion, the approximation properties, the projective, injective and completed
tensor products, nuclear operators and integral bilinear forms, absolutely summing operators
with Pietsch domination and factorization, Grothendieck's matrix inequality, the Dunford–Pettis
property, the scalar-measure integration layer, Banach–Mazur distance and local reflexivity).
What is built here is the rest of the classical theory: James's norm-attainment theorem;
Grothendieck's tensor characterization of the approximation property and his theorem that a
reflexive space with the approximation property has the metric one; Enflo's separable reflexive
space without the approximation property and the Argyros–Haydon space on which every operator is
a scalar plus a compact; the real–complex comparisons; Hilbert dimension and the unitary
classification; the Riesz representation of `C(K, 𝕜)*`, the σ-finite `L¹`–`L∞` and the
`Lᵖ`–`Lᑫ` dualities, the local-null Haar endpoint, the Dunford–Pettis weak compactness
criterion and the Dunford–Pettis property of `C(K)` and `L¹(μ)`; Banach–Stone; Rademacher cotype
with Pisier's cotype-2 summing bound and Grothendieck's theorem for operators out of `L¹`; and in
finite dimension John's bound `d(E, ℓ₂ⁿ) ≤ √n`, the Kadec–Snobar and Garling–Gordon projection
theorems and Dvoretzky's theorem. The roadmap is this README; `Suggested.lean` states the
headline theorems whose carriers exist at the pins.

## Scope and ownership

This roadmap owns the targets of its seven layers. The layer ids `B1`–`B7`, and the target ids
`B4.0`, `B4.1`, `B4.C`, `B5.LocalHaarDual` and `B6.Cotype2`, are kept in the headings below,
since other roadmaps cite them. The layer anchors used by other roadmaps' links map to the layer
headings as follows:

- `#b1-duality-and-weak-topologies` → Layer 1 (B1),
  `#layer-1-duality-and-weak-topologies-b1`.
- `#b2-weak-compactness-and-reflexivity` → Layer 2 (B2),
  `#layer-2-weak-compactness-and-reflexivity-b2`.
- `#b3-schauder-bases-and-classical-spaces` → Layer 3 (B3),
  `#layer-3-schauder-bases-and-classical-spaces-b3`.
- `#b4-approximation-and-banach-tensor-products` → Layer 4 (B4),
  `#layer-4-approximation-and-banach-tensor-products-b4`.
- `#b5-function-spaces-and-weak-compactness` → Layer 5 (B5),
  `#layer-5-function-spaces-and-weak-compactness-b5`.
- `#b6-summing-operators-and-grothendiecks-inequality` → Layer 6 (B6),
  `#layer-6-cotype-and-grothendiecks-theorem-b6`.
- `#b7-local-theory-and-euclidean-sections` → Layer 7 (B7),
  `#layer-7-local-theory-and-euclidean-sections-b7`.

Already in the library at the pins, consumed and not restated (the supplier contracts give names
and files):

- From B1: the double-annihilator theorems for subspaces of `E` and of `E*`, the isometries
  `(E/F)* ≅ Fᗮ` and `F* ≅ E*/Fᗮ`, the kernel and range identities of the adjoint, the
  closed-range theorem with the `c₀₀ ⊂ ℓ²` counterexample, Goldstine's theorem, the bipolar
  theorem, Mazur's lemma and the compatible weak-star metric on a dual ball of a separable space.
- From B2: Eberlein–Šmulian (absolute and relative forms), reflexivity as weak compactness of
  the ball with its invariance and inheritance by closed subspaces, quotients and duals,
  Milman–Pettis, Clarkson's inequalities and uniform convexity of `Lᵖ`, Krein–Šmulian for convex
  sets and subspaces, Bishop–Phelps for functionals, support points and support functionals, and
  weakly compact operators with Gantmacher's theorem.
- From B3: the small perturbation theorem for bases, subsequence bases, monotone renorming,
  unconditional-basis criteria and multipliers, the dualities `c₀* = ℓ¹` and `(ℓᵖ)* = ℓᑫ`
  (including `(ℓ¹)* = ℓ∞`), Schur's theorem for `ℓ¹`, the reflexivity examples, shrinking and
  boundedly complete bases with James's basis criterion, and Burkholder's function with its
  Bellman estimates.
- From B4: the approximation, bounded and metric approximation properties with their transport
  and projection inheritance, the metric approximation property of `ℓᵖ` and `c₀`, the bounded
  approximation property of a space with a basis, Grothendieck's compact-operator
  characterization of the approximation property, the projective and injective tensor norms
  with their completions, universal property, functoriality, symmetry, unit and associativity
  isometries, the injective tensor product of isometric embeddings, the projective tensor
  product of metric quotient maps, series representations of completed projective tensors,
  `E* ⊗̂ε F` as the approximable operators, nuclear operators with the nuclear norm, and integral
  bilinear forms as the dual of the injective tensor product.
- From B5: the scalar-measure integration layer. Its five items, cited by id elsewhere, are
  Tau Ceti's at the pin, and this roadmap and SelfAdjointSpectralTheory both consume them there:
  - B5.ScalarIntegral (scalar vector-integral linearity and signed parts):
    `TauCeti/MeasureTheory/VectorMeasure/ScalarIntegral.lean`.
  - B5.ScalarDensity (integral against a scalar density):
    `TauCeti/MeasureTheory/VectorMeasure/WithDensity.lean`.
  - B5.AbsContRegular (absolute-continuity regularity):
    `TauCeti/MeasureTheory/Measure/Regular.lean` and
    `TauCeti/MeasureTheory/VectorMeasure/Variation/Regular.lean`.
  - B5.ScalarUniqueness (scalar-measure uniqueness on continuous tests):
    `TauCeti/MeasureTheory/VectorMeasure/Uniqueness.lean`.
  - B5.BoundedApprox (bounded continuous approximation in `L¹`, simultaneously for finitely many
    measures): `TauCeti/MeasureTheory/Function/ContinuousApproximation.lean`.
  Also from B5: the transport of a Hilbert basis along a unitary, the finite-measure `L¹`–`L∞`
  duality, the isometry of the integral pairing `L^q → (L^q')*` for σ-finite measures, the
  Riesz–Markov–Kakutani representation of order-bounded real functionals by differences of
  regular measures, Dunford–Pettis operators and the Dunford–Pettis property with its sequence
  criterion, its passage from the dual, and its examples `ℓ¹`, `c₀` and the infinite-dimensional
  Hilbert space.
- From B6: the weak `p`-norm, the absolutely `p`-summing gauge and the Banach ideal `Πₚ(E,F)`
  with all its laws, Pietsch domination and factorization, and Grothendieck's inequality for
  matrices and for one bounded bilinear form on `C(K, 𝕜) × C(L, 𝕜)` evaluated on finite families
  with square functions at most one, with the constants `8` over `ℝ` and `16` over `𝕜`.
- From B7: the Banach–Mazur distance with symmetry, the multiplicative triangle inequality and
  distance one exactly for isometric spaces, finite representability, local reflexivity, finite
  representability of `E**` in `E`, covering numbers of spheres, the Gaussian-maximum estimate,
  the uniform probability on the sphere with its isometry invariance and its description as the
  law of the direction of a standard Gaussian, independent of the radius, and the Rademacher
  convexity inequality.

Owned elsewhere: [Operator ideals](../OperatorTheory/OperatorIdeals/README.md) owns approximation
numbers, finite-rank approximability, Hilbert-space Schatten ideals, trace norms and singular
values (OI-A01, OI-A25–OI-A28, OI-B29–OI-B30); this roadmap owns the comparison of the Banach
nuclear norm with that trace-class gauge. [Operator theory](../OperatorTheory/README.md) owns
Hilbert-space spectral theory. C*-tensor norms are outside this Banach-space scope. The
spectral and invariant-subspace consequences of the scalar-plus-compact theorem are BanachAlgebras
A8's. The Hilbert matrix-coefficient WOT and the ultraweak and ultrastrong topologies are
VonNeumannAlgebras V1's; the generic operator topologies of Layer 1 are this roadmap's. The
absolutely continuous representative of an interval Sobolev class is PDE Layer 1 §1.1 (A1);
Layer 5 consumes it. AmenableGroups Layer 7 works on the native global `Lp ℝ ∞ μ`; the local-null
Haar carrier is this roadmap's.

## Conventions

Spaces are over `𝕜 = ℝ` or `ℂ`, expressed with `RCLike` where appropriate; completeness is a
hypothesis, not part of the meaning of normed space. Enflo's construction in §4.4, the
Argyros–Haydon construction of §4.5, the cotype-2 bound and Dvoretzky's theorem are over `ℝ`;
their complex versions are stated separately where they are claimed. All duals are continuous duals `StrongDual 𝕜 E`; reflexivity means surjectivity of
`NormedSpace.inclusionInDoubleDual`, not algebraic reflexivity. Weak and weak-star topologies are
`WeakSpace 𝕜 E` and `WeakDual 𝕜 E` with explicit transport; weak convergence in a dual differs
from weak-star convergence. Operators are `ContinuousLinearMap`; subspaces and quotients are
Mathlib's `Submodule` and normed quotients, and a Banach subspace is closed. Relative compactness
means compact closure in the stated ambient topology. A Schauder series converges along initial
segments (`SummationFilter.conditional`); an unconditional series converges along finite sets.

Scalar pairings are bilinear, without conjugation: `L^q × Lᵖ → 𝕜` is `(g, f) ↦ ∫ f g`, and the
dual of `C(K, 𝕜)` pairs through `ContinuousLinearMap.mul ℝ 𝕜`. The adjoint of `T : E → F` is
`ContinuousLinearMap.precomp 𝕜 T : F* → E*`, the Banach transpose; the Hilbert adjoint is its
conjugate-linear twist. The trace pairing of `X* ⊗ X` with `L(X)` sends `f ⊗ x` and `T` to
`f(T x)`. Rademacher averages are over the uniform sign cube `{±1}ⁿ` and Gaussians are standard
real ones.

## Exact supplier contracts

### From Mathlib

- `StrongDual`, `NormedSpace.inclusionInDoubleDual`, `toWeakSpace`, `WeakDual`, Hahn–Banach
  (`exists_extension_norm_eq`), Banach–Alaoglu (`WeakDual.isCompact_polar`), uniform boundedness,
  the open mapping theorem, `PointwiseConvergenceCLM` and `ContinuousLinearMapWOT`.
- `SchauderBasis`, `UnconditionalSchauderBasis`, `SchauderBasis.nnnormProjBound` and
  `UnconditionalSchauderBasis.nnnormProjBound` (`Mathlib/Analysis/Normed/Module/Bases.lean`),
  `SummationFilter`, `lp`, `lp.single`, `lp.hasSum_single`, `lp.completeSpace`, `lp.dualPairing`,
  `ZeroAtInftyContinuousMap`, `UniformConvexSpace`.
- `TensorProduct`, `PiTensorProduct`, `UniformSpace.Completion`, `IsCompactOperator`,
  `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot`.
- `HilbertBasis`, `HilbertBasis.repr`, `exists_hilbertBasis`, `HilbertBasis.toOrthonormalBasis`,
  `Orthonormal`, `Cardinal.lift`, `Cardinal.mk`, `fourierBasis`.
- `MeasureTheory.Lp`, `ContinuousLinearMap.lpPairing`, `ENNReal.HolderConjugate`,
  `MeasureTheory.VectorMeasure` with `VectorMeasure.variation`, `VectorMeasure.mapRangeL` and the
  vector integral `∫ᵛ x, f x ∂[B; μ]`, `Measure.variation_withDensityᵥ`,
  `SignedMeasure.totalVariation_eq_variation`, signed and complex Radon–Nikodym derivatives,
  `RealRMK.rieszMeasure`, `RealRMK.integral_rieszMeasure` and its `IsFiniteMeasure` instance on a
  compact space, `CompactlySupportedContinuousMap.continuousMapEquiv`,
  `ContinuousMap.toLp_denseRange`, `Measure.Regular`, `Measure.haar`, `OnePoint`,
  `MeasureTheory.AddContent`, `UnifIntegrable`, `UniformIntegrable`, `gelfandStarTransform`.
- `ConvexBody`, `EuclideanSpace`, `Measure.toSphere`, `gaussianReal`, `ProbabilityTheory.stdGaussian`
  (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`), `ZMod`, `Nat.choose`,
  Bochner integration.

### From Tau Ceti

Layer 1:
- `Submodule.orthogonalBilin_orthogonalBilin_topDualPairing_eq_topologicalClosure`
  (`Analysis/Normed/Module/Annihilator.lean:128`) and
  `Submodule.map_orthogonalBilin_flip_orthogonalBilin_eq_topologicalClosure`
  (`Analysis/LocallyConvex/WeakDual/Annihilator.lean:63`): the norm and weak-star double
  annihilators.
- `Submodule.quotientDualEquivAnnihilator` (`Analysis/Normed/Module/Dual/Quotient.lean:38`) and
  `Submodule.quotientAnnihilatorEquivDual` (`Analysis/Normed/Module/Dual/Submodule.lean:78`).
- `ContinuousLinearMap.ker_precomp_eq_orthogonalBilin_range`,
  `ContinuousLinearMap.range_precomp_eq_orthogonalBilin_ker` and the closed-range theorem
  `ContinuousLinearMap.isClosed_range_precomp_iff` (`Analysis/Normed/Module/Dual/Adjoint.lean:68,
  106,234`; both spaces complete for the last); `TauCeti.finiteSupportL2` and
  `TauCeti.not_isClosed_finiteSupportL2`
  (`Analysis/Normed/Module/Dual/ClosedRangeCounterexample.lean:40,78`).
- `NormedSpace.closure_image_inclusionInDoubleDualWeak_closedBall`
  (`Analysis/Normed/Module/Dual/Goldstine.lean:50`), `AbsConvex.bipolar_eq_closure` and
  `StrongDual.bipolar_eq_closedAbsConvexHull` (`Analysis/LocallyConvex/Bipolar.lean:71,87`),
  `TauCeti.exists_sum_smul_norm_sub_lt_of_tendsto_weak` (`Analysis/Normed/Module/Mazur.lean:82`).
- `WeakDual.metricSpaceOfDenseSeq` and `StrongDual.weakStarClosedBallMetricSpace`
  (`Analysis/Normed/Module/WeakDual/Metric.lean:73,115`; separable predual for the second).

Layer 2:
- `TauCeti.isCompact_toWeakSpace_iff_isSeqCompact` and `TauCeti.isCompact_closure_toWeakSpace_iff`
  (`Analysis/Normed/Module/WeakSpace/EberleinSmulian.lean:153,137`).
- `TauCeti.surjective_inclusionInDoubleDual_iff_isCompact_toWeakSpace_closedBall`
  (`Analysis/Normed/Module/Dual/Reflexive/WeakCompact.lean:99`),
  `ContinuousLinearEquiv.surjective_inclusionInDoubleDual_iff` and
  `TauCeti.surjective_inclusionInDoubleDual_strongDual_iff`
  (`Analysis/Normed/Module/Dual/Reflexive/Basic.lean:112,94`),
  `Submodule.surjective_inclusionInDoubleDual` and
  `Submodule.surjective_inclusionInDoubleDual_quotient`
  (`Analysis/Normed/Module/Dual/Reflexive/Submodule.lean:41,67`).
- `TauCeti.surjective_inclusionInDoubleDual_of_uniformConvexSpace`
  (`Analysis/Convex/Uniform/Basic.lean:147`, Milman–Pettis); `TauCeti.norm_add_rpow_add_norm_sub_rpow_le`
  (`Analysis/InnerProductSpace/Clarkson.lean:45`); `MeasureTheory.Lp.norm_add_rpow_add_norm_sub_rpow_le`,
  `MeasureTheory.Lp.uniformConvexSpace` and `MeasureTheory.Lp.surjective_inclusionInDoubleDual`
  (`MeasureTheory/Function/Lp/UniformConvex.lean:75,123,157`, for `1 < p < ∞`).
- `Convex.isClosed_iff_forall_isClosed_inter_closedBall` and
  `Submodule.isClosed_iff_isClosed_inter_closedBall_zero_one`
  (`Analysis/Normed/Module/Dual/KreinSmulian.lean:272,305`).
- `TauCeti.dense_setOf_exists_norm_apply_eq_norm`, `Convex.dense_setOf_ne_zero_isMaxOn_re` and
  `Convex.frontier_subset_closure_setOf_isMaxOn_re`
  (`Analysis/Normed/Module/Dual/BishopPhelps.lean:319,243,282`).
- `ContinuousLinearMap.IsWeaklyCompact`, `ContinuousLinearMap.isWeaklyCompact_iff_range_subset`,
  `ContinuousLinearMap.isWeaklyCompact_precomp_iff`, `IsCompactOperator.isWeaklyCompact` and
  `ContinuousLinearMap.isWeaklyCompact_id_and_not_isCompactOperator_id`
  (`Analysis/Normed/Operator/WeaklyCompact.lean:60,190,304,154,179`).

Layer 3:
- `SchauderBasis.IsShrinking`, `SchauderBasis.IsBoundedlyComplete` and
  `SchauderBasis.surjective_inclusionInDoubleDual_iff`
  (`Analysis/Normed/Module/Bases/Reflexive.lean:49,60,199`).
- `GeneralSchauderBasis.smallPerturbationEquiv` and `GeneralSchauderBasis.perturb`
  (`Analysis/Normed/Module/Bases/Perturbation.lean:60,133`), `SchauderBasis.subsequence`
  (`Analysis/Normed/Module/Bases/Subsequence.lean:55`), `SchauderBasis.monotoneBasis`
  (`Analysis/Normed/Module/Bases/Monotone.lean:159`),
  `GeneralSchauderBasis.exists_forall_norm_proj_le_iff` and `UnconditionalSchauderBasis.multiplier`
  (`Analysis/Normed/Module/Bases/Unconditional.lean:120,178`).
- `ZeroAtInftyContinuousMap.dualEquiv` (`Topology/ContinuousMap/ZeroAtInfty/Dual.lean:129`),
  `lp.dualEquiv` (`Analysis/Normed/Lp/Dual.lean:175`, `q ≠ ∞`), `lp.tendsto_of_tendsto_toWeakSpace_one`
  (`Analysis/Normed/Lp/Schur.lean:155`), `lp.surjective_inclusionInDoubleDual` and
  `lp.not_surjective_inclusionInDoubleDual_one` (`Analysis/Normed/Lp/Reflexive.lean:66,44`),
  `ZeroAtInftyContinuousMap.not_surjective_inclusionInDoubleDual`
  (`Topology/ContinuousMap/ZeroAtInfty/Reflexive.lean:68`).
- `TauCeti.burkholderPhi`, `TauCeti.mul_burkholderPhi_le` and `TauCeti.convexOn_burkholderPhi_abs_add`
  (`Analysis/SpecialFunctions/Pow/Burkholder.lean:59,204,357`, for `p ≥ 2`);
  `TauCeti.unitInterval.tendsto_eLpNorm_condExp_dyadicFiltration`
  (`MeasureTheory/Constructions/UnitInterval/Dyadic.lean:141`).

Layer 4:
- `TauCeti.HasApproximationProperty`, `TauCeti.HasBoundedApproximationPropertyWith`,
  `TauCeti.HasBoundedApproximationProperty` and `TauCeti.HasMetricApproximationProperty`
  (`Analysis/Normed/Module/ApproximationProperty/Basic.lean:47,52,58,62`); their transport
  `ContinuousLinearEquiv.hasApproximationProperty_iff`,
  `ContinuousLinearEquiv.hasBoundedApproximationPropertyWith`,
  `TauCeti.HasApproximationProperty.of_projection` and
  `TauCeti.HasBoundedApproximationPropertyWith.of_projection`
  (`Analysis/Normed/Module/ApproximationProperty/Transport.lean:129,136,92,99`);
  `TauCeti.hasMetricApproximationProperty_lp` and `TauCeti.hasMetricApproximationProperty_zeroAtInfty`
  (`Analysis/Normed/Module/ApproximationProperty/SequenceSpace.lean:35,43`);
  `SchauderBasis.hasBoundedApproximationPropertyWith` and `SchauderBasis.hasBoundedApproximationProperty`
  (`Analysis/Normed/Module/Bases/Approximation.lean:59,64`);
  `TauCeti.hasApproximationProperty_iff_forall_isCompactOperator`
  (`Analysis/Normed/Module/ApproximationProperty/CompactOperator.lean:178`).
- `TensorProduct.projectiveSeminorm`, `TauCeti.ProjectiveTensor`
  (`Analysis/Normed/Module/TensorProduct/ProjectiveSeminorm.lean:123,236`);
  `TensorProduct.injectiveSeminorm`, `TauCeti.InjectiveTensor`,
  `TensorProduct.injectiveSeminorm_le_projectiveSeminorm` and
  `TensorProduct.injectiveSeminorm_le_iff_forall_norm_le_one`
  (`Analysis/Normed/Module/TensorProduct/InjectiveSeminorm.lean:109,330,151,203`; the classical
  injective norm over `ℝ` and `ℂ`); `TauCeti.CompletedProjectiveTensor`,
  `TauCeti.CompletedInjectiveTensor`, `TauCeti.CompletedProjectiveTensor.toCompletedInjectiveTensor`
  and `TauCeti.CompletedProjectiveTensor.liftIsometry`
  (`Analysis/Normed/Module/TensorProduct/Completion.lean:76,81,170,196`); the symmetry, unit and
  associativity isometries (`Analysis/Normed/Module/TensorProduct/Associator.lean`);
  `TauCeti.CompletedInjectiveTensor.mapIsometry` (`Analysis/Normed/Module/TensorProduct/Isometry.lean:125`);
  `TauCeti.CompletedProjectiveTensor.image_mapL_ball`
  (`Analysis/Normed/Module/TensorProduct/Quotient.lean:132`);
  `TauCeti.CompletedProjectiveTensor.norm_lt_iff_exists_hasSum_tmul`
  (`Analysis/Normed/Module/TensorProduct/Series.lean:148`);
  `TauCeti.CompletedInjectiveTensor.toOperator` with its range
  (`Analysis/Normed/Module/TensorProduct/Approximable.lean:172,188`).
- `TauCeti.CompletedProjectiveTensor.toContinuousLinearMap`, `TauCeti.nuclearOperators`,
  `TauCeti.nuclearGauge` and `TauCeti.NuclearOperator` (`Analysis/Normed/Operator/Nuclear.lean:84,
  129,173,304`; complete target).
- `ContinuousLinearMap.integralENorm`, `TauCeti.IntegralBilinearForm` and
  `TauCeti.IntegralBilinearForm.liftIsometry`
  (`Analysis/Normed/Module/TensorProduct/IntegralBilinearForm.lean:76,239,296`).
- `TauCeti.Complexification` with `ofRealLI`, `reCLM`, `imCLM`, `equivProd` and
  `ContinuousLinearMap.complexify` (`Analysis/Normed/Module/Complexification.lean`).
- `exists_hilbertBasis_forall_hasEigenvector` (`Analysis/InnerProductSpace/Spectrum.lean:152`),
  `IsCompactOperator.finiteDimensional_eigenspace`
  (`Analysis/Normed/Operator/Compact/Eigenspace.lean:56`).

Layer 5:
- The scalar-measure layer listed under Scope and ownership, in particular
  `MeasureTheory.VectorMeasure.scalarMeasureRealPart`, `scalarMeasureImagPart`,
  `scalarMeasureOfReal`, `scalarMeasureOfReal_realPart_add_I_smul_imagPart`,
  `variation_scalarMeasureRealPart_le`, `integral_const_mul`, `re_integral_ofReal`,
  `integral_mul_eq_integral_posPart_sub_integral_negPart`
  (`MeasureTheory/VectorMeasure/ScalarIntegral.lean`);
  `MeasureTheory.VectorMeasure.integral_mul_withDensityᵥ` and `integral_withDensityᵥ_congr_ae`
  (`MeasureTheory/VectorMeasure/WithDensity.lean:155,83`);
  `MeasureTheory.Measure.AbsolutelyContinuous.regular` (`MeasureTheory/Measure/Regular.lean:234`);
  `MeasureTheory.VectorMeasure.ext_of_integral_eq_on_continuousMap`
  (`MeasureTheory/VectorMeasure/Uniqueness.lean:122`);
  `MeasureTheory.exists_continuous_norm_le_forall_integral_norm_sub_le` and
  `MeasureTheory.exists_seq_continuous_norm_le_tendsto_integral_norm_sub`
  (`MeasureTheory/Function/ContinuousApproximation.lean`, finitely many finite weakly regular
  measures on a normal Borel space).
- `TauCeti.RealRMK.posPart`, `TauCeti.RealRMK.posPart_apply_of_nonneg`,
  `TauCeti.RealRMK.negPart`, `TauCeti.RealRMK.negPart_apply` and
  `TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart`
  (`MeasureTheory/Integral/RieszMarkovKakutani/Signed.lean:160,188,205,211,262`; the last states
  only the integral identity, on `C_c(X, ℝ)`, with measures that need not be finite), used also by
  §4.4.
- `MeasureTheory.Lp.dualOneEquiv` (`MeasureTheory/Function/L1Space/Dual.lean:102`, finite
  measure) and `MeasureTheory.Lp.toDual` (`MeasureTheory/Function/Lp/Duality.lean:431`, an
  isometry for σ-finite measures; surjectivity is not asserted there).
- `ContinuousLinearMap.IsDunfordPettis`, `ContinuousLinearMap.isDunfordPettis_iff_forall_isCompact_image`,
  `TauCeti.HasDunfordPettisProperty` and `TauCeti.hasDunfordPettisProperty_iff`
  (`Analysis/Normed/Operator/DunfordPettis/Basic.lean:86,172,247,296`);
  `TauCeti.HasDunfordPettisProperty.of_dual`, `ZeroAtInftyContinuousMap.hasDunfordPettisProperty`
  and `ZeroAtInftyContinuousMap.not_forall_tendsto_apply_of_tendsto_toWeakDual`
  (`Analysis/Normed/Operator/DunfordPettis/Dual.lean:75,97,115`);
  `TauCeti.hasDunfordPettisProperty_iff_finiteDimensional_of_innerProductSpace`
  (`Analysis/Normed/Operator/DunfordPettis/Reflexive.lean:63`).
- `PositiveLinearMap.addContentLpTopEquiv` (`MeasureTheory/Function/Lp/AddContent.lean:254`,
  positive functionals on `L∞` as finitely additive contents).
- `TauCeti.radialRetraction` (`Analysis/Normed/Module/Ball/Retraction.lean:85`).
- `TauCeti.W1p` with its completeness (`Analysis/Sobolev/W1p/Basic.lean:372,376`).
- `HilbertBasis.mapₗᵢ` (`Analysis/InnerProductSpace/HilbertBasis/Map.lean:32`), the transport of a
  Hilbert basis along a linear isometric equivalence, with `HilbertBasis.mapₗᵢ_apply`.

Layer 6:
- `TauCeti.weakLpNorm` (`Analysis/Normed/Lp/Weak.lean:78`), `ContinuousLinearMap.summingENorm`
  and `TauCeti.AbsolutelySumming` (`Analysis/Normed/Operator/AbsolutelySumming/Basic.lean:99,591`).
- `ContinuousLinearMap.summingENorm_le_ofReal_iff_exists_isProbabilityMeasure`
  (`Analysis/Normed/Operator/AbsolutelySumming/Pietsch.lean:329`, Pietsch domination) and
  `ContinuousLinearMap.summingENorm_le_ofReal_iff_exists_eq_comp_rangeRestrict` and
  `ContinuousLinearMap.summingENorm_le_ofReal_iff_exists_eq_comp_codRestrict_topologicalClosure`
  (`Analysis/Normed/Operator/AbsolutelySumming/Factorization.lean:129,143`, Pietsch factorization
  through the canonical image, and through its closure for a complete target).
- `Matrix.abs_sum_sum_mul_inner_le_eight_mul` and `Matrix.norm_sum_sum_mul_inner_le_sixteen_mul`
  (`Analysis/Matrix/Grothendieck.lean:169,207`).
- `LinearMap.norm_sum_apply_apply_le_sixteen_mul` and `LinearMap.abs_sum_apply_apply_le_eight_mul`
  (`Topology/ContinuousMap/Grothendieck.lean:157,169`; compact normal `K, L`): Grothendieck's
  inequality for a bounded bilinear form on `C(K, 𝕜) × C(L, 𝕜)` and finite families with square
  functions at most one.

Layer 7:
- `TauCeti.banachMazurDist`, `TauCeti.banachMazurDist_comm`, `TauCeti.banachMazurDist_triangle`,
  `TauCeti.banachMazurDist_eq_one_iff` (`Analysis/Normed/Module/BanachMazur.lean:69,119,126,268`).
- `TauCeti.FinitelyRepresentable` and `TauCeti.finitelyRepresentable_iff_banachMazurDist_lt`
  (`Analysis/Normed/Module/FinitelyRepresentable.lean:67,221`).
- `LinearIsometry.exists_continuousLinearMap_of_doubleDual` and
  `TauCeti.finitelyRepresentable_doubleDual` (`Analysis/Normed/Module/Dual/LocalReflexivity.lean:228,320`).
- `TauCeti.exists_finset_isCover_sphere` (`Analysis/Normed/Module/CoveringNumber.lean:168`) and
  `TauCeti.Probability.sqrt_log_card_div_le_integral_sup'_abs`
  (`Probability/Distributions/Gaussian/Maximum.lean:83`).
- `TauCeti.Probability.uniformSphereMeasure`, the normalized surface measure `volume.toSphere` on
  the unit sphere of a finite-dimensional real inner product space, a probability measure in
  positive dimension, with its isometry invariance `LinearIsometryEquiv.map_uniformSphereMeasure`,
  the law of direction and radius of a standard Gaussian
  `TauCeti.Probability.stdGaussian_map_sphereDirection_prod_norm`, the spherical law of the
  direction `TauCeti.Probability.stdGaussian_map_sphereDirection` and the independence of
  direction and radius `ProbabilityTheory.HasLaw.indepFun_sphereDirection_norm_stdGaussian`
  (`Probability/Distributions/Uniform/Sphere/Basic.lean:77,138,237,251,277`).
- `Finset.sup'_norm_le_integral_norm_sum_smul_rademacher`
  (`Probability/Distributions/Rademacher/Norm.lean:98`), the Rademacher convexity inequality
  `max_j ‖v_j‖ ≤ 𝔼 ‖Σ ε_j v_j‖` for pairwise independent Rademacher signs, with no completeness or
  dimension hypothesis.

### From TauCetiRoadmap.OperatorTheory/OperatorIdeals

OI-A01 (approximation numbers), OI-A25–OI-A28 (finite-rank approximability) and OI-B29–OI-B30
(the Hilbert trace-class gauge), consumed by §4.2 for the nuclear/trace-class comparison.

### From TauCetiRoadmap.AmenableGroups

Layer 7, item 1: the raw Haar support/localization and Baire/null-envelope contract, with its
locally finite and finite-set compact-inner-regular hypotheses, consumed by §5.8. Its later
global-`L∞` means, smoothing conclusion and amenability theorem are not consumed.

### From TauCetiRoadmap.PDE

Layer 1 §1.1 (A1): the absolutely continuous representative of a `W^{1,p}(a,b)` class, consumed
by §5.3 at `p = 1`.

### From TauCetiRoadmap.PseudodifferentialOperators

Layer 5 (P5): the boundaryless Hölder carriers, compared with the interval little Hölder space of
§5.3 only where their hypotheses apply.

## How to read the build

Layer 1 completes the duality theory of normed spaces around the pinned annihilator, adjoint,
Goldstine and bipolar results. Layer 2 proves James's theorem. Layer 3 adds block bases, the
ambient perturbation of basic sequences and the Haar basis of `Lᵖ[0,1]`. Layer 4 is the
approximation and tensor layer: Grothendieck's tensor characterization, the Hilbert comparisons,
the real–complex comparisons, Grothendieck's reflexive theorem with Enflo's counterexample, and
the Argyros–Haydon construction. Layer 5 is function spaces and measure duality, from `ℓ²(S)`
and Hilbert dimension through `C(K)*`, the `Lᵖ` dualities, the Dunford–Pettis theory and the
local-null Haar endpoint. Layer 6 is cotype and Grothendieck's theorem, and Layer 7 the local
theory. Layers 1–3 depend only on the suppliers; Layer 4 needs Layers 1–3; Layer 5 needs
Layers 1–3, and inside it §5.4's density construction comes first and §5.7's property of
`L¹(μ)` last, after §5.9; Layer 6 needs Layer 5; Layer 7 needs Layers 1, 4 and 6.

## Layer 1: duality and weak topologies (B1)

### 1.1 Annihilators, restriction and quotient duals, and the Banach transpose

On top of the pinned double-annihilator theorems and the isometries `(E/F)* ≅ Fᗮ` and
`F* ≅ E*/Fᗮ`, prove order reversal and the annihilators of sums and intersections, and the
naturality of the restriction, quotient and inclusion maps under bounded maps. For the
adjoint `T* = ContinuousLinearMap.precomp 𝕜 T` prove `‖T*‖ = ‖T‖` (by Hahn–Banach; van Neerven,
*Functional Analysis*, Proposition 4.24, p. 146) and `(S ∘ T)* = T* ∘ S*`. For a bounded endomorphism of a complex Banach space prove that the
spectrum of the Banach transpose equals the spectrum of the operator, using Hahn–Banach and the
pinned closed-range theorem to transfer invertibility both ways. The Hilbert adjoint instead
conjugates the complex spectrum; compare it with the transpose through the Riesz
conjugate-linear map.

For `1 ≤ p < ∞` and conjugate `q`, including `p = 1, q = ∞`, define the right and left shifts
`R_p`, `L_p` on `ℓᵖ(ℕ)` by `(R_p x)₀ = 0`, `(R_p x)ₙ₊₁ = xₙ` and `(L_p x)ₙ = xₙ₊₁`, and prove
`(R_p)* = L_q` and `(L_p)* = R_q` under the pinned identification `(ℓᵖ)* ≅ ℓᑫ` (`lp.dualEquiv`)
and its bilinear series pairing.

- `R_p` is a linear isometry and `L_p` a contraction of norm one, with `L_p ∘ R_p = id`.
- `R_p ∘ L_p` is the projection onto the vectors with vanishing zeroth coordinate.
- The transpose identities hold for every `1 ≤ p < ∞` under the bilinear pairing.

**Checks.**
- `R_p e₀ = e₁`, `L_p e₁ = e₀` and `L_p e₀ = 0`, so `L_p R_p = I` while `R_p L_p e₀ = 0`; a
  definition making the two shifts mutually inverse would make `R_p` surjective.
- Under the bilinear pairing `⟨R_p e₀, e₁⟩ = 1 = ⟨e₀, L_q e₁⟩`, while `⟨e₀, R_q e₁⟩ = ⟨e₀, e₂⟩ = 0`:
  the identification `(R_p)* = R_q` is refuted.
- `‖R_p‖ = ‖L_p‖ = 1` for every `p`, with `‖L_p e₁‖ = ‖e₁‖` attaining the norm; a convention
  scaling the shifted coordinates by `1/2` would give norm `1/2`.

*Needs:* Tau Ceti Layer 1 contract (annihilators, quotient duals, adjoint identities, closed
range); `lp.dualEquiv`; Mathlib `spectrum`, `exists_extension_norm_eq`.

### 1.2 The bidual, its naturality and norming

Extend the canonical bidual embedding by its naturality under bounded maps,
`T** ∘ J_E = J_F ∘ T`, and norming by the dual unit ball, `‖x‖ = sup_{‖f‖≤1} |f(x)|` (van Neerven,
*Functional Analysis*, Corollary 4.13, p. 139, for the norming formula and Proposition 4.23,
p. 145, for the isometry `J_E`). Over
complex scalars convexity in the pinned bipolar and Mazur theorems is real convexity. Do not
impose separability on Banach–Alaoglu or Goldstine.

- `J_E` is a linear isometry, natural in `E`, and `J` of the zero space is zero.
- `T**` restricts to `T` along `J`.

**Checks.**
- On `c₀`, `J` is not surjective: the constant sequence `1 ∈ ℓ∞ = c₀**` is not in its range,
  and for the multiplication operator `T x = (x_n/2^n)_n` on `c₀` the bidual `T**` sends `1` to
  `(2^(−n))_n`, which lies in `J(c₀)`, as naturality and compactness of `T` predict.
- For `E = 𝕜`, `J` is the identity of `𝕜 ≅ 𝕜**`, and naturality is the identity of scalars.
- Norming needs the whole dual ball: on `ℓ²` the single functional `e₁*` gives `|x₁|`, which is
  `0` at `e₂`, while the supremum over the dual unit ball is `‖e₂‖ = 1`.

*Needs:* Mathlib `NormedSpace.inclusionInDoubleDual`, `exists_extension_norm_eq`.

### 1.3 Weak, weak-star and operator topologies

Give weak and weak-star continuity criteria by evaluation and boundedness consequences of weak
boundedness, reusing `WeakDual.metrizable_of_isCompact`, `WeakDual.isSeqCompact_closedBall` and
the pinned compatible metric `StrongDual.weakStarClosedBallMetricSpace` of a dual ball over a
separable space.

On bounded maps between normed spaces, consume native `PointwiseConvergenceCLM` for SOT and
`ContinuousLinearMapWOT` for pointwise weak convergence. Prove their evaluation/dual-pairing
criteria, norm ⇒ SOT ⇒ WOT and compatibility with the Hilbert matrix-coefficient WOT. On Banach
domains, convergent SOT or WOT sequences are norm bounded by uniform boundedness; prove the SOT
sequential product consequence and joint SOT continuity on norm-bounded sets. A convergent net
need not be norm bounded: on an infinite-dimensional Banach space construct rank-one maps
annihilating each prescribed finite-dimensional subspace and with arbitrarily large norm, using
Hahn–Banach, with an actual directed index and SOT limit. Also construct SOT-null nets
`S_i, T_i` with `S_i T_i` a fixed nonzero rank-one operator: choose `S_i` annihilating the
prescribed finite subspace, `T_i` with shrinking norm and range in a separated complementary
direction, and reciprocal scaling. On `c₀` construct forward and backward shift powers
`T_n, S_n` and prove both WOT-null, `S_n` SOT-null, `S_n T_n = I` and `T_n S_n` the SOT-null tail
projection, every estimate through the pinned `c₀* = ℓ¹`.

Construct a norm-one functional `φ` on `ℓ∞` with `φ(c₀) = 0` and `φ(1) = 1` by Hahn–Banach on
`ℓ∞/c₀`, proving the quotient norm of `1` is `1`; BanachAlgebras A3 consumes this single
functional. On `ℓ²` with standard `e_i`, prove `0` lies in the weak closure of
`{e_m + m e_n : 1 ≤ m < n}` but is no weak sequential limit from that set: for a finite
collection of functionals choose `m` with small coordinates and then `n` with `m` times their
coordinates small; a weakly convergent sequence is norm bounded, bounded `m` leaves finitely
many first-coordinate positions, and one survives on a subsequence, contradicting convergence to
`0`. Construct its explicit weak-null net: index by finite sets `F` of continuous linear
functionals and integers `k ≥ 0`, ordered by inclusion of `F` and increase of `k`, choose `m < n`
with `|f(e_m + m e_n)| < 1/(k+1)` for every `f ∈ F`, and prove the chosen vectors tend to zero in
the native weak topology along this directed order.

**Checks.**
- The rank-one net of norm `→ ∞` converges SOT to `0`, so SOT convergence of nets does not
  bound norms, while for sequences on a Banach space it does; a definition of SOT through norm
  convergence would exclude the net.
- On `c₀`, `S_n T_n = I` for every `n` while `S_n → 0` SOT and `T_n → 0` WOT: products of
  WOT-null sequences need not be WOT-null.
- `‖e_m + m e_n‖ = √(1 + m²) ≥ m`, so every weakly convergent sequence from the set has bounded
  `m`; the net reaches `0` only by letting `m` grow along the finite-set index.

*Needs:* Mathlib `PointwiseConvergenceCLM`, `ContinuousLinearMapWOT`, uniform boundedness,
`exists_extension_norm_eq`, `lp`; Tau Ceti `ZeroAtInftyContinuousMap.dualEquiv`,
`StrongDual.weakStarClosedBallMetricSpace`.

### 1.4 A metric that agrees with the usual one on lines

Finite-dimensional norm equivalence (van Neerven, *Functional Analysis*, Theorem 1.34, p. 18) does
not extend to every metric agreeing with usual convergence on affine lines; the counterexample
below is an elementary computation, recorded in the Checks. On `ℝ²` set `f(0,0) = 0` and
`f(x,y) = x²y/(x⁴ + y²)` elsewhere. Prove `f` is continuous on every affine line but
`f(t, t²) = 1/2` for `t ≠ 0`. The metric
`d(p,q) = ‖p − q‖₂ + |f(p) − f(q)|` has the usual topology on every line and a different
ambient topology.

**Checks.**
- `d((t,t²),(0,0)) ≥ 1/2` for `t ≠ 0` while `‖(t,t²)‖₂ → 0`: the ambient `d`-topology is
  strictly finer than the Euclidean one.
- On the line `y = mx` with `m ≠ 0`, `f(x, mx) = mx/(x² + m²) → 0` as `x → 0`, and `f` vanishes on
  both axes, so `f` is continuous on every line through `0`.
- `d` is a metric: `d(p,q) = 0` forces `‖p − q‖₂ = 0`, and the triangle inequality holds termwise.

*Needs:* Mathlib `EuclideanSpace`, metric-space constructors.

### Examples

The shifts on `ℓ²(ℕ)` with `(R₂)* = L₂`; the closed-range counterexample `c₀₀ ⊂ ℓ²` (pinned);
the vectors `e_m + m e_n` in `ℓ²`; the shift powers on `c₀`; the metric `d` on `ℝ²`.

### Dependencies

Mathlib: Hahn–Banach, Banach–Alaoglu, uniform boundedness, `lp`, the operator topologies.
Tau Ceti: the Layer 1 contract above. No other roadmap.

## Layer 2: weak compactness and reflexivity (B2)

### 2.1 James's theorem

Prove James's theorem (`james`): for a nonempty norm-closed bounded convex subset `A` of a
Banach space over `ℝ` or `ℂ`, weak compactness of `A` is equivalent to attainment on `A` of the
supremum of `Re f` for every continuous linear functional `f`, that is, to the existence of
`a ∈ A` with `Re f(b) ≤ Re f(a)` for every `b ∈ A`. Convexity is real convexity, so a complex
space carries its real scalar action compatibly (`IsScalarTower ℝ 𝕜 E`). Over `ℝ` this is James,
*Weakly compact sets*, Theorems 4–5 (pp. 138–139); over `ℂ` apply it to the underlying real Banach
space, whose continuous real functionals are exactly the real parts `Re f`. Deduce that a Banach
space is reflexive iff every functional attains its norm on the closed unit ball
(`surjective_inclusionInDoubleDual_iff_forall_exists_norm_apply_eq`): by the pinned
`TauCeti.surjective_inclusionInDoubleDual_iff_isCompact_toWeakSpace_closedBall` reflexivity is weak
compactness of the ball, and on the ball the supremum of `Re f` is `‖f‖`, attained exactly where
`|f|` attains `‖f‖` after a unimodular rotation. Develop the separable reduction and the finite
norming sets needed in the proof; keep completeness as an explicit hypothesis (Megginson,
Theorems 2.9.3–2.9.4).

**Checks.**
- On `ℓ¹`, `f = Σ (1 − 1/n) xₙ` has `‖f‖ = 1` and `|f(x)| < 1` on the closed unit ball, so `f`
  does not attain its norm and `ℓ¹` is not reflexive, in agreement with the pinned
  `lp.not_surjective_inclusionInDoubleDual_one`; on that ball both sides of the convex-set
  equivalence are false.
- Nonemptiness is needed: for `A = ∅` the set is weakly compact while no functional attains a
  maximum on it, so the equivalence would fail without it.
- Off the unit ball: in `c₀` the closed bounded convex set `A = {x : 0 ≤ xₙ ≤ 1 for all n}` meets
  the functional `(2^(−n))_{n≥1} ∈ ℓ¹` with supremum `1`, attained only at the constant sequence
  `1 ∉ c₀`, and the partial sums `e₁ + ⋯ + eₙ ∈ A` have no weakly convergent subsequence (a weak
  limit would have every coordinate `1`); both sides fail together.
- On a Hilbert space every `f = ⟪y, ·⟫` attains `‖f‖` at `y/‖y‖`, consistent with reflexivity.
- On `c₀` the functional given by `(2^(−n))_{n≥1} ∈ ℓ¹` has norm `1`, and `Σ 2^(−n) xₙ = 1` with
  `‖x‖∞ ≤ 1` forces `xₙ = 1` for every `n`, which is not in `c₀`; so `c₀` is not reflexive, in
  agreement with the pinned `ZeroAtInftyContinuousMap.not_surjective_inclusionInDoubleDual`.

*Needs:* Tau Ceti Layer 2 contract (Eberlein–Šmulian,
`TauCeti.surjective_inclusionInDoubleDual_iff_isCompact_toWeakSpace_closedBall`); Mathlib Hahn–Banach
separation, `Convex`; James 1964, Theorems 4–5.

### Examples

`ℓ¹` with the functional `Σ (1 − 1/n) xₙ`; Hilbert spaces; `Lᵖ`, `1 < p < ∞`, reflexive by the
pinned Milman–Pettis theorem.

### Dependencies

Mathlib: Hahn–Banach separation, Banach–Alaoglu. Tau Ceti: the Layer 2 contract. Within the
roadmap: Layer 1.

## Layer 3: Schauder bases and classical spaces (B3)

### 3.1 Block bases, equivalence of bases and ambient perturbation

The basis-constant, perturbation, duality and convergence results here concern Banach spaces;
coordinate and finite-projection identities retain the weaker hypotheses of Mathlib's basis API.
Prove that block bases of a basis are bases of their closed spans with basis constant at most
the original one, and that two bases are equivalent iff two-sided inequalities hold on finite
linear combinations, with the induced continuous linear equivalence of closed spans. Prove the
ambient basic-sequence form of the small perturbation theorem: if `xₙ` is basic in a Banach space
`X`, `yₙ ∈ X` need not lie in its closed span, and `θ = Σ ‖xₙ*‖ ‖xₙ − yₙ‖ < 1`, then `xₙ ↦ yₙ`
extends to an isomorphism `[xₙ] → [yₙ]` with norm at most `1 + θ` and inverse norm at most
`(1 − θ)⁻¹` (Heil, *A Basis Theory Primer*, Theorem 7.6, p. 54, proves the case `yₙ ∈ [xₙ]`; the
ambient case extends each coordinate functional `xₙ*` from `[xₙ]` to `X` by Hahn–Banach with the
same norm and runs the same estimate). Construct it as the isometric inclusion plus `Σ xₙ*(·)(yₙ − xₙ)`, prove
convergence, the lower bound and closed range, and identify that range with `[yₙ]`. Develop the
dual basic sequence on the closed span of a basis and the duality between shrinking and
boundedly complete bases. Construct the conversions between `UnconditionalSchauderBasis ℕ 𝕜 E`
and a `SchauderBasis` whose expansion also converges along `SummationFilter.unconditional ℕ`;
do not equate an ordinary Schauder expansion with an unconditional `tsum`.

**Checks.**
- In `ℓᵖ`, `u_k = 2^(−1/p)(e_{2k} + e_{2k+1})` has `‖Σ a_k u_k‖_p = (Σ |a_k|ᵖ)^(1/p)`: the
  normalized block basis is isometrically equivalent to the unit-vector basis, while in `c₀` the
  unnormalized blocks `e_{2k} + e_{2k+1}` already have norm `1`.
- In `ℓ²`, `xₙ = e_{2n}` and `yₙ = e_{2n} + 2^(−n−2) e_{2n+1}` give `θ = 1/2` with `yₙ` outside
  `[xₙ]`; the isomorphism has norm `√(1 + 1/16) ≤ 3/2`, within the bound `1 + θ`.
- The summing basis `sₙ = e₀ + ⋯ + eₙ` of `c₀` is conditional: `x = ((−1)^k/(k+1))_k ∈ c₀` has
  coefficients `aₙ = xₙ − xₙ₊₁ = (−1)ⁿ(1/(n+1) + 1/(n+2))`, and replacing them by `|aₙ|` makes
  the zeroth coordinate of the partial sums the divergent `Σ (1/(n+1) + 1/(n+2))`; a conversion
  that ignored the summation filter would make this basis unconditional.

*Needs:* Mathlib `SchauderBasis`, `UnconditionalSchauderBasis`, `SummationFilter`; Tau Ceti
`GeneralSchauderBasis.smallPerturbationEquiv`, `SchauderBasis.subsequence`,
`SchauderBasis.IsShrinking`, `SchauderBasis.IsBoundedlyComplete`.

### 3.2 The Haar basis of `Lᵖ[0,1]`

Construct the Haar basis of `Lᵖ([0,1])`, `1 ≤ p < ∞`, with the constant first vector,
unnormalized `±1` functions on successive dyadic intervals, and increasing dyadic levels. Its
initial projections are averages on the successively refined dyadic atom partitions; construct
these contractions, their composition law and convergence on `Lᵖ`, first on dense step
functions, consuming the pinned dyadic conditional-expectation convergence. For
unconditionality, consume the pinned Burkholder function `Φ_p(x,y) = (x+y)^(p−1)((p−1)x − y)`
and its estimates for `p > 2`, and integrate the midpoint inequality inductively over each split
dyadic atom to obtain the signed-transform bound `p − 1`. Use orthogonality at `p = 2` and
finite-atom Hölder duality at conjugate `q > 2` for `1 < p < 2`. Thus the real Haar sign-transform
bound is `max(p, p/(p−1)) − 1`. Deduce the complex bound twice that value by real and imaginary
parts, and hence unconditionality over both fields for `1 < p < ∞` (Albiac–Kalton, 6.1.3–6.1.7).

- The Haar functions form a Schauder basis of `Lᵖ[0,1]` for `1 ≤ p < ∞`, monotone in the
  dyadic order.
- For `1 < p < ∞` the basis is unconditional with sign-transform constant `max(p, p/(p−1)) − 1`
  over `ℝ` and twice that over `ℂ`.

**Checks.**
- `h₀ = 1`, `h₁ = 1 on [0,1/2)` and `−1` on `[1/2,1)`, and a level-`j` function has
  `‖h‖_p = 2^(−j/p)`; the `L²`-normalized system has `Lᵖ` norm `2^(j(1/2 − 1/p))`, which is not
  `1` for `p ≠ 2`.
- The second initial projection sends `f(t) = t` to its averages `1/4` on `[0,1/2)` and `3/4` on
  `[1/2,1)`.
- The constant `max(p, p/(p−1)) − 1` is `1` at `p = 2` and `2` at both `p = 3` and `p = 3/2`, and
  it tends to `∞` as `p → 1`, consistent with the Haar basis not being unconditional in `L¹`.

*Needs:* Mathlib `MeasureTheory.Lp`, `SchauderBasis`; Tau Ceti `TauCeti.burkholderPhi` and its
estimates, `TauCeti.unitInterval.tendsto_eLpNorm_condExp_dyadicFiltration`.

### Examples

The unit-vector bases of `c₀` and `ℓᵖ` with their pinned dualities; the summing basis of `c₀`;
the Haar basis at `p = 2` and `p = 3`.

### Dependencies

Mathlib: the basis API, `lp`, `Lp`. Tau Ceti: the Layer 3 contract. Within the roadmap: Layer 1.

## Layer 4: approximation and Banach tensor products (B4)

The approximation-property equivalences below concern Banach spaces; the target `F` is complete
in the operator identifications involving `E* ⊗̂ε F` and `E* ⊗̂π F`. The approximation
properties, the tensor norms and their completions, the approximable-operator identification,
nuclear operators and integral bilinear forms are the pinned Tau Ceti carriers of the supplier
contract; consumers of B4's tensor products cite those carriers.

### 4.1 Approximation properties of the classical function spaces

Prove the metric approximation property of `Lᵖ([0,1])`, `1 ≤ p < ∞`, from the dyadic averaging
contractions of §3.2 (Daws, remark after Proposition 2.3.4, p. 40). The pinned results cover
`ℓᵖ`, `c₀`, spaces with a basis, and transport
along equivalences and projections.

**Checks.**
- The dyadic averages `P_n` on `Lᵖ[0,1]` have norm `1` (`P_n 1 = 1`) and `P_n f → f`, so the
  approximating operators of the metric approximation property can be taken to be the `P_n`.
- For `f = 1_[0,1/3)` in `L¹[0,1]`, `P_n f` differs from `f` only on the dyadic interval of length
  `2^(−n)` containing `1/3`, so `‖P_n f − f‖₁ ≤ 2^(−n)`.
- On the zero space the zero operator witnesses all three properties with norm `0 ≤ 1`.

*Needs:* Tau Ceti `TauCeti.HasMetricApproximationProperty`; §3.2's dyadic projections.

### 4.2 Grothendieck's tensor characterization and the Hilbert comparisons

Prove Grothendieck's tensor characterization
(`hasApproximationProperty_iff_injective_toCompletedInjectiveTensor`): a Banach space `E` has the
approximation property iff for every Banach space `F` the pinned contraction
`F ⊗̂π E → F ⊗̂ε E` is injective (Daws, Proposition 2.3.4(3), pp. 39–40; Ryan, Proposition 4.6).
Prove that the pinned canonical map `E* ⊗̂π F → (E →L[𝕜] F)` is injective if `E*` or `F` has the
approximation property (Daws, Proposition 2.3.4, pp. 39–40), and keep
this hypothesis-dependent identification distinct from the always-defined quotient-norm nuclear
carrier `TauCeti.NuclearOperator`. Build the finite-rank tensor approximation and the
separation/compact-set arguments for these comparisons.

On Hilbert pairs, construct the isometric identification of the nuclear norm with OperatorIdeals
OI-B29–OI-B30's trace-class gauge. Construct the compact Schmidt series from the pinned spectral
theorem for compact self-adjoint operators (`exists_hilbertBasis_forall_hasEigenvector`) and
Mathlib's `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot`: for compact
`T : H → K` on complete real or complex Hilbert spaces, apply these to `T†T`, order the positive
eigenvalues `λ_j` with multiplicity and put `s_j = √λ_j`. Prove that a compact self-adjoint
operator has only finitely many eigenvalues of modulus at least `ε` for each `ε > 0`:
eigenvectors for distinct eigenvalues are orthogonal, each nonzero eigenspace is
finite-dimensional (`IsCompactOperator.finiteDimensional_eigenspace`), and the images of an
infinite orthonormal family of eigenvectors with eigenvalues of modulus at least `ε` are at
mutual distance at least `ε√2`. Choose the orthonormal families `(e_j), (f_j)` with
`f_j = s_j⁻¹ T e_j` and `s_j > 0` nonincreasing, tending to zero in the infinite-rank case;
prove `T x = Σ s_j ⟪e_j, x⟫ f_j`, vanishing on `ker T`, with operator-norm convergence of the
truncations (van Neerven, *Functional Analysis*, Theorem 9.2, pp. 305–306). Zero-pad the
singular values in the finite-rank case and prove `s_n = a_n(T)` with
the zero-based OI convention (OI-A01): the rank-`n` truncation gives the upper bound and, below
the rank, a kernel vector on an `(n+1)`-dimensional singular span gives the lower bound. A finite
trace-class gauge implies compactness by OI-A25–OI-A28. The summable Schmidt series gives the
nuclear-norm upper bound; for the reverse inequality use OI's gauge subadditivity and rank-one
norm on partial nuclear sums, operator-norm continuity of each `a_n`, and Fatou for the series of
approximation numbers.

**Checks.**
- `E = 𝕜`: `F ⊗̂π 𝕜 ≅ F ≅ F ⊗̂ε 𝕜` and the contraction is the identity, so it is injective,
  as the approximation property of `𝕜` requires.
- On `ℓ²ₙ` the identity has Schmidt values `s_1 = ⋯ = s_n = 1`, nuclear norm `n` and operator
  norm `1`; a nuclear norm equal to the operator norm would give `1`.
- The diagonal operator `diag(1, 1/2, 1/3, …)` on `ℓ²` is compact with `s_j = 1/j`, not nuclear
  since `Σ 1/j = ∞`, while `diag(1/j²)` is nuclear with nuclear norm `π²/6`.

*Needs:* Tau Ceti `TauCeti.HasApproximationProperty`,
`TauCeti.CompletedProjectiveTensor.toCompletedInjectiveTensor`,
`TauCeti.CompletedProjectiveTensor.toContinuousLinearMap`, `TauCeti.NuclearOperator`,
`exists_hilbertBasis_forall_hasEigenvector`, `IsCompactOperator.finiteDimensional_eigenspace`;
OperatorIdeals OI-A01, OI-A25–OI-A28, OI-B29–OI-B30.

### 4.3 Real and complex approximation comparisons (B4.C)

For any real Banach space `X`, consume `TauCeti.Complexification X` with its Taylor norm
`‖x + iy‖ = sup_θ ‖cos(θ)x − sin(θ)y‖` (Muñoz–Sarantopoulos–Tonge, Proposition 3, p. 5), native
scalar action, complete-space instances, `ofRealLI`, `reCLM`, `imCLM`, `equivProd`, and
`ContinuousLinearMap.complexify` with its exact operator norm (ibid., Proposition 4, pp. 6–7).
Prove compactness under complexification, and equivalence of the approximation
property, `λ`-bounded approximation for `λ ≥ 1`, and the metric approximation property for `X`
and its complexification, using real inclusion/projection and `complexify`. Build the
real/complex strong-dual comparison and prove preservation and reflection of reflexivity. In
particular construct the bounded complex-linear equivalence between
`StrongDual ℂ (TauCeti.Complexification X)` and `TauCeti.Complexification (StrongDual ℝ X)` by
real and imaginary parts and `φ(x+iy) = g(x) − h(y) + i(h(x) + g(y))`
(`exists_complexificationStrongDualEquiv`, an equivalence whose value on `g + ih` is this `φ`);
pin the norm bounds rather than asserting an isometry of their different dual norms (the pairing
and Proposition 7 of Muñoz–Sarantopoulos–Tonge, p. 9, with the norm comparison of their
Proposition 3, p. 5).

**Checks.**
- `X = ℝ`, `g = id`, `h = 0`: `φ(x + iy) = x + iy`, the identity of `ℂ`, as the formula
  requires.
- Complex linearity: for `φ` built from `(g, h)`, `φ(i(x + iy)) = φ(−y + ix) = −g(y) − h(x) +
  i(h(−y) + g(x))`, which equals `i φ(x + iy)`; a formula with `+ h(y)` in the real part fails this.
- The inverse reads `(g, h)` off `φ`: `φ(x + i0) = g(x) + i h(x)`, so `g = Re ∘ φ ∘ ofReal` and
  `h = Im ∘ φ ∘ ofReal`, and `φ(0 + iy) = −h(y) + i g(y)`; a convention placing `g` in the
  imaginary part would not be inverse to the stated formula.

*Needs:* Tau Ceti `TauCeti.Complexification`, `ContinuousLinearMap.complexify`, `ofRealLI`,
`reCLM`, `imCLM`, the approximation-property definitions; Mathlib `StrongDual`.

### 4.4 Grothendieck's reflexive theorem and Enflo's counterexample (B4.0)

Prove Grothendieck's reflexive theorem
(`hasMetricApproximationProperty_of_surjective_inclusionInDoubleDual`): a reflexive real or
complex Banach space `X` with the approximation property has the metric one. Pin the norm
comparison as follows. Write `A(X)` for the operator-norm closure of finite-rank endomorphisms,
identified isometrically with `X ⊗̂ε X*` by the pinned approximable-operator map. Define the
contractive trace-pairing map `Θ_X : X* ⊗̂π X → (X ⊗̂ε X*)*` by `Θ_X(f ⊗ x)(y ⊗ g) = f(y)g(x)`,
extending through the pinned completions. Prove the metric criterion
`MAP(X) ↔ ∀ u, ‖Θ_X u‖ = ‖u‖π` (Daws, Theorem 2.3.14, pp. 43–44, at bound `M = 1`). The
direction from isometry to MAP is compact-open separation: on bounded sets the compact-open dual
of `L(X)` is given by trace pairing with `X* ⊗̂π X`, and `|⟨u, id⟩| ≤ ‖u‖π`. The direction from
MAP to isometry uses the MAP and the pinned local reflexivity
`LinearIsometry.exists_continuousLinearMap_of_doubleDual` together. The dual of `X* ⊗̂π X` is
`L(X, X**)`. Take a finite tensor `u = Σ_(i≤m) f_i ⊗ x_i`, `δ > 0`, `ε > 0` and `T` in the unit
ball of `L(X, X**)` with `|⟨u, T⟩| > ‖u‖π − δ`. By the MAP choose a finite-rank `F` with `‖F‖ ≤ 1`
and `‖F x_i − x_i‖ < δ` for every `i`. Apply local reflexivity to the finite-dimensional range
`V = T(F(X)) ⊆ X**` (with its inclusion as the isometry) and `G = span{f_i}`: it gives
`R : V → X` with `‖R‖ ≤ 1 + ε` and `g(R v) = v(g)` for `g ∈ G`. Then `S = R ∘ T ∘ F` is a
finite-rank endomorphism of `X` with `‖S‖ ≤ 1 + ε`, and
`|⟨u, S⟩ − ⟨u, T⟩| = |Σ_i (T(F x_i − x_i))(f_i)| ≤ δ Σ_i ‖f_i‖`. A finite-rank `S` lies in
`A(X) ≅ X ⊗̂ε X*` with injective norm `‖S‖`, so `‖Θ_X u‖ ≥ (‖u‖π − δ − δ Σ_i ‖f_i‖)/(1 + ε)`;
letting `δ, ε → 0` gives `‖Θ_X u‖ = ‖u‖π` on finite tensors, and the equality passes to the
completion because `Θ_X` is a contraction and both sides are continuous. The reflexive theorem
uses only the direction from isometry to MAP. The codomain carries the dual of the injective
norm; injectivity alone is the approximation-property comparison of §4.2 and does not yield the
norm-one bound.

- `Θ_X` is a contraction, natural in isometries of `X`, and `Θ_X(f ⊗ x)` evaluated at `y ⊗ g` is
  `f(y)g(x)`.
- `MAP(X)` holds iff `Θ_X` is an isometry.

**Checks.**
- The MAP-to-isometry route at `X = 𝕜`: `u = a (1 ⊗ 1)` has `‖u‖π = |a|`, the norming `T` is
  `J ∘ (c ·)` with `|c| = 1`, `F = id`, `R = J⁻¹` and `S = c ·` reproduce `|⟨u, S⟩| = |a|` exactly,
  with no `δ` or `ε` loss.
- `X = 𝕜`: both completed tensor products are `𝕜`, `Θ_𝕜(f ⊗ x)(y ⊗ g) = f y g x` is the
  identity, and `𝕜` has the metric approximation property.
- For `X = 𝕜²`, `f = e₁*`, `x = e₂`, `y = e₁`, `g = e₂*`: `Θ_X(f ⊗ x)(y ⊗ g) = f(y)g(x) = 1`,
  while the transposed convention `f(x)g(y)` gives `0`; the trace pairing fixes the first.
- On `X = ℓ²ₙ`, `u = Σ e_i* ⊗ e_i` has `‖u‖π = n` (the trace-class norm of the identity), and
  `Θ_X(u)` at `v = Σ e_j ⊗ e_j*`, whose injective norm is `‖I‖ = 1`, is `Σ_{i,j} δ_{ij} = n`, so
  `‖Θ_X u‖ = n = ‖u‖π`, as the criterion requires.

Use the integral/nuclear route to the reflexive-case isometry. Construct its finite-measure
density prerequisite here: for a reflexive real Banach space `Y`, a finite positive measure `μ`,
and a native `VectorMeasure α Y` `m` with `m.variation univ < ∞` and `m.variation ≪ μ`, construct
an integrable Bochner density `h` with `m = μ.withDensityᵥ h`. Prove a.e. uniqueness and
`m.variation s = ∫⁻ a in s, ‖h a‖ₑ ∂μ` for every measurable `s`. Use finite-partition averages of
`m`, scalar Radon–Nikodym domination of their norms, uniform integrability and the
weak-compactness criterion in Bochner `L¹(Y)`; construct that criterion from reflexivity and
weak compactness of all set-integral ranges before extracting a weak cluster point. Recover `m`
on every measurable set by partitions containing that set. Treat zero-measure atoms by zero and
use the separable essential range of Bochner functions for a.e. uniqueness; do not assume `Y`
separable. For complex targets use the underlying real Banach space and prove compatibility
with complex scalar multiplication.

Run this route for real `X`. Using the pinned integral bilinear forms, define the integral
endomorphism ideal on `X*` and its norm by currying the trace-pairing dual. Construct the isometric
comparison `A(X)* ≃ I(X*)`. For reflexive `X`, use scalar weak-star-dual-ball factorization, the
Riesz–Markov–Kakutani representation below and the reflexive-target density theorem just assigned to
obtain `I(X*) ≃ N(X*)` with equality of integral and nuclear ideal norms, with the actual
finite-rank/simple-density approximations and their norm bounds. The representation is that of a
bounded functional `Λ` on `C(K, ℝ)`, `K` compact Hausdorff, identified with `C_c(K, ℝ)` by
`CompactlySupportedContinuousMap.continuousMapEquiv`. Such a `Λ` is order bounded, since
`Λ g ≤ ‖Λ‖ ‖f‖` whenever `0 ≤ g ≤ f`, so the pinned
`TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart` writes it as the
difference of the integrals against the Riesz measures of `TauCeti.RealRMK.posPart` and
`TauCeti.RealRMK.negPart`. The two measures are finite because `K` is compact (Mathlib's
`IsFiniteMeasure` instance for `RealRMK.rieszMeasure` on a compact space). Their total masses add up
to `‖Λ‖`: by `RealRMK.integral_rieszMeasure` at `1`, `TauCeti.RealRMK.posPart_apply_of_nonneg` and
`TauCeti.RealRMK.negPart_apply`, the sum is
`posPart 1 + negPart 1 = 2 posPart 1 − Λ 1 = sup_{0 ≤ g ≤ 1} Λ(2g − 1)`, and the functions `2g − 1`
with `0 ≤ g ≤ 1` are exactly the unit ball of `C(K, ℝ)`. Under the approximation property identify
`X* ⊗̂π X` isometrically with `N(X)` through its quotient-norm nuclear map. If `u` represents `T`,
prove that `Θ_X(u)` corresponds to the transpose `T′`. The reflexive isometry `J_X : X ≃ₗᵢ X**`
gives `T = J_X⁻¹ ∘ T′′ ∘ J_X`; the nuclear ideal inequalities and the two contractive canonical maps
yield `ν(T) ≤ ν(T′′) ≤ ν(T′) ≤ ν(T)`. Consequently `‖Θ_X u‖ = ν(T′) = ν(T) = ‖u‖π`, first on the
defining comparisons and then on the completions, and the metric criterion supplies MAP. For complex
`X`, the underlying real space is reflexive and has the approximation property, since a complex
finite-rank operator is a real one. Given a compact `C ⊆ X`, a real-linear finite-rank `T` with
`‖T‖ ≤ 1` within `ε` of the identity on `C ∪ iC` gives the complex-linear finite-rank `(T − iTi)/2`,
of norm at most `‖T‖` and within `ε` of the identity on `C`. Keep zero spaces in scope by using
contractive maps rather than requiring a map's norm to equal one. Without reflexivity the
approximation property gives no uniform bound on the approximating finite-rank operators. This fixes
the trace-pairing convention of the integral/nuclear comparison of Daws, §2.3, Theorems 2.3.14 and
2.3.23 (printed pp. 43–47).

Construct Enflo's separable reflexive real counterexample
(`exists_reflexive_not_hasApproximationProperty`) as a closed subspace of the native
`lp (fun m => C(K_m, ℝ)) 2`, with finite discrete `K_m`. Prove reflexivity of this countable `ℓ²`
sum through its dual `ℓ²` identification; the finite fibres have supremum norms and the sum need
not be a Hilbert space. Set `K_(m,i) = (ZMod 2)^(Fin (2n_m))` and
`K_m = ⨿_(i=1)^(k_m) K_(m,i)`, with each copy finite and discrete. Build Walsh functions on
`(ZMod 2)^(Fin (2n))`, the degree-`(n−1)`/`(n+1)` layers, their equal binomial dimensions,
permutation and translation isometries, and the averaged diagonal/normalized-trace comparison.
Construct the incident block families `M_m` of Enflo's 1973 paper, satisfying all six of its
finite-support, multiplicity, overlap and equidistribution conditions. Pin
`t_m = binomial(2n_m, n_m − 1) = binomial(2n_m, n_m + 1)`, and distinguish the independent
generating set `M_m` from its closed span. `M_(m,i)` is its `t_m`-element subset supported in
the `i`th current block; `N_(m,j)` is its `t_(m+1)`-element subset with nonzero component in the
`j`th next block. Set `σ(e) = #{j : e ∈ N_(m,j)}`, the next-block multiplicity. Use parameters
`a, γ` with `1 < a < γ` and `a < (γ+2)/(γ+1)`, `n_m = ⌊a^m⌋`, `k_m = ⌊4^(γ a^m)⌋` beyond a
sufficiently large initial cutoff. Build the cyclic incidence enumeration and prove simultaneous
satisfaction of these conditions from explicit binomial exponential bounds and floor/error
estimates. Pin the quantitative overlap conditions as
`|N_(m,i) ∩ N_(m,j)| ≤ 2t_(m+1)/n_(m+1)` for `i ≠ j` and
`|N_(m,j) ∩ M_(m,i)| ≤ min(t_(m+1)/n_(m+1), t_m/n_m)`, and
`Σ_e |1/(k_m t_m) − σ(e)/(k_(m+1) t_(m+1))| ≤ 1/n_(m+1)`. The pairwise spacing bound
`μ > n_(m+1)` in the cyclic construction gives at most `1 + 2⌊(t_(m+1) − 1)/(n_(m+1) + 1)⌋`
intersection points; prove this is at most `2t_(m+1)/n_(m+1)` beyond the specified cutoff using
the binomial growth bound. This stronger condition is the input to the trace comparison; it
also implies the bound `t_(m+1)²/n_(m+1)` once `t_(m+1) ≥ 2`. For the averaging vector `x`
corresponding to `Uf` in `span(N_(m,j) ∪ M_(m+1,j))`, set `|||x||| = ‖x|_(K_(m+1,j))‖∞` and
prove its local-to-ambient estimate `‖x‖ ≤ 2|||x|||`.

Write `K_k(j) = Σ_i (−1)^i binomial(j,i) binomial(2n−j, k−i)`, the coefficient of `z^k` in
`(1−z)^j (1+z)^(2n−j)`, for the Krawtchouk value, so that the Walsh layer sums satisfy
`F_k(a) = K_k(|a|)`. Prove `|K_(n+1)(j)| = |K_(n−1)(j)|` from the reversal
`z^(2n)(1−1/z)^j(1+1/z)^(2n−j) = (−1)^j (1−z)^j (1+z)^(2n−j)`, and prove the Krawtchouk bound
`|K_(n−1)(j)| ≤ binomial(2n, n−1)/n` for `0 < j < 2n` as follows. The symmetry
`binomial(2n, j) K_(n−1)(j) = binomial(2n, n−1) K_j(n−1)` reduces it to
`n |K_j(n−1)| ≤ binomial(2n, j)`, and `K_j(n−1)` is the coefficient of `z^j` in
`(1−z²)^(n−1)(1+z)²`: it equals `2(−1)^m binomial(n−1, m)` for `j = 2m+1` and
`(−1)^m (binomial(n−1, m) − binomial(n−1, m−1))` for `j = 2m`. By the symmetry `j ↔ 2n − j` it
suffices to take `1 ≤ j ≤ n`. In the odd case Vandermonde gives
`binomial(n−1, m) binomial(n, m) ≤ binomial(2n−1, 2m)` with `binomial(n, m) ≥ n ≥ 2m+1` for
`m ≥ 1`, and the case `m = 0` is an equality; in the even case `1 ≤ m ≤ n/2` gives
`0 ≤ binomial(n−1, m) − binomial(n−1, m−1) ≤ binomial(n−1, m)` and
`n · binomial(n−1, m) ≤ binomial(n, m)² ≤ binomial(2n, 2m)`. The bound is attained exactly at
`j = 1` and `j = 2n − 1`, where `K_(n−1)(1) = binomial(2n, n−1)/n`. Neither of two shorter routes
gives it: the values are not monotone in `j` on `1 ≤ j ≤ n`, and bounding the coefficient
integral by the integral of the absolute value gives `4ⁿ/(πn)` at `j = 1`, larger than the bound
for every `n ≥ 4`.

Prove the coordinate property `‖Σ_j c_j e_j‖ ≥ ‖c_k e_k‖` on the generating independent family;
finite-rank operators can be approximated by finite-expansion finite-rank operators on that
family. For `T e_i = Σ_j a_ji e_j` define `Tr̃(M, T) = |M|⁻¹ Σ_(e_i ∈ M) a_ii` on a nonempty finite
generating subset, and its unnormalized trace as the same sum without the factor `|M|⁻¹`. Prove
`|Tr̃(M, T)| ≤ ‖T|_(span M)‖` and the corresponding unnormalized bound with factor `|M|`, the
telescoping trace estimate and trace decay for finite-rank maps. Write the triangle split with
first term `|k_(m+1) Tr̃(M_m, T) − Σ_j Tr̃(N_(m,j), T)|` and second term
`|Σ_j Tr̃(N_(m,j), T) − Σ_j Tr̃(M_(m+1,j), T)|`. Prove its two bounds `‖T‖/n_(m+1)` and
`4‖T‖/n_(m+1)` after dividing by `k_(m+1)`, using the local-to-ambient norm comparison. The
resulting adjacent trace bound is `5‖T‖/n_(m+1)`. Derive Enflo's quantitative theorem: there are
finite-dimensional subspaces `E_m` with `dim E_m ≥ 2` and `dim E_m → ∞`, and a finite `C` such
that `‖(I − T)|_(E_m)‖ ≥ 1 − C‖T‖/log(dim E_m)` for every bounded finite-rank `T`. This excludes
the bounded approximation property; reflexivity and Grothendieck's reflexive theorem exclude the
approximation property. Derive failure of a Schauder basis from the pinned basis ⇒ bounded
approximation implication, rather than using lack of a basis to infer failure of the
approximation property.

Transport the example to a complex Banach space by the complexification of §4.3; prove
reflexivity is preserved and that the complex approximation property would imply the real one by
real inclusion/projection. By the pinned compact-operator characterization, construct a compact
`S : F → E` not approximable by finite-rank maps. On `F ⊕ E` construct the compact endomorphism
`(x, y) ↦ (0, Sx)` and prove it also cannot be approximated by finite-rank endomorphisms, using
its coordinate inclusions and projections (Enflo, §§1–4).

**Checks.**
- For `n = 3` the values `|K_2(j)|`, `j = 1, 2, 3`, are `5, 1, 3`, with bound
  `binomial(6,2)/3 = 5` attained at `j = 1`; for `n = 4` the values `|K_3(j)|`, `j = 1, …, 4`, are
  `14, 4, 6, 0`, with bound `binomial(8,3)/4 = 14`. The values are not monotone in `j`.
- The reversal at `n = 3`, `j = 1`: `K_4(1) = binomial(5,4) − binomial(5,3) = −5`, of the same
  modulus as `K_2(1) = 5`; and `t = binomial(6,2) = binomial(6,4) = 15`.
- The coefficient-integral route at `n = 4`, `j = 1` gives `4⁴/(4π) ≈ 20.4 > 14`, so it does not
  prove the bound.
- Normalized trace of the identity: `a_ii = 1` for every `e_i`, so `Tr̃(M, I) = |M|⁻¹ · |M| = 1` for
  every nonempty finite `M`, while the unnormalized trace is `|M|`.
- For `M = {e₁, …, e_t}` and the coordinate projection `T` onto `e₁` (`T e₁ = e₁`, `T e_i = 0` for
  `i ≠ 1`), `Tr̃(M, T) = 1/t` and the unnormalized trace is `1`; the bound
  `|Tr̃(M, T)| ≤ ‖T|_(span M)‖` holds since a nonzero projection has norm at least `1`, and a
  definition omitting `|M|⁻¹` would give `1` here and break the adjacent-trace comparison, which
  divides by the block sizes `t_m`.
- Scaling: `Tr̃(M, cI) = c` for every scalar `c`, and `Tr̃({e_i}, T) = a_ii` on a singleton, so the
  normalized trace on singletons reads off the diagonal coefficient.

*Needs:* Mathlib `lp` over a dependent family, `ZMod 2`, `Nat.choose` identities and bounds;
Tau Ceti `TauCeti.HasApproximationProperty`, `TauCeti.HasMetricApproximationProperty`,
`TauCeti.CompletedProjectiveTensor`, `TauCeti.CompletedInjectiveTensor`,
`TauCeti.CompletedInjectiveTensor.toOperator`, `TauCeti.IntegralBilinearForm`,
`TauCeti.NuclearOperator`, `SchauderBasis.hasBoundedApproximationProperty`,
`TauCeti.hasApproximationProperty_iff_forall_isCompactOperator`,
`LinearIsometry.exists_continuousLinearMap_of_doubleDual` (the direction from MAP to isometry of
the metric criterion only),
`TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart`,
`TauCeti.RealRMK.posPart`, `TauCeti.RealRMK.negPart`, `TauCeti.RealRMK.posPart_apply_of_nonneg`,
`TauCeti.RealRMK.negPart_apply`, Mathlib `RealRMK.rieszMeasure`, `RealRMK.integral_rieszMeasure`,
`CompactlySupportedContinuousMap.continuousMapEquiv` (the integral/nuclear route); §§4.2–4.3;
Daws §2.3; Enflo §§1–4.

### 4.5 Bourgain–Delbaen spaces and the scalar-plus-compact example (B4.1)

Construct the Argyros–Haydon real Banach space `X_K` (`exists_scalarPlusCompact` records its
scalar-plus-compact conclusion) as the closed span of its biorthogonal vectors in native bounded
functions `lp (fun _ : Γ => ℝ) ∞`. Build the generic Bourgain–Delbaen construction first:
countably many finite rank layers `Γ_q`, triangular `d_γ* = e_γ* − c_γ*` in native `ℓ¹(Γ)`, its
basis projections and biorthogonal vectors, compatible finite-coordinate extension maps `i_q`,
their norm bound `(1 − 2θ)⁻¹` for `θ < 1/2`, and the finite-dimensional decomposition. Prove
finite-coordinate recovery, the closed-span description, projection identities and `ℒ∞`
finite-dimensional models. Identify the dual with `ℓ¹` when the decomposition is shrinking; a
triangular `ℓ¹` basis alone does not give this identification.

Prove the finite blocking lemma of Maurey (part i) and James (part ii) in Argyros–Haydon
Lemma 2.2: for `N = n^k` unit vectors, the uniform signed-sum lower bound `(n − ε)^k` yields
successive combinations equivalent to the `ℓ¹_n` basis with constant `(1 − ε)⁻¹`; the uniform
signed-sum upper bound `(1 + ε)^k` yields `ℓ∞_n` combinations with constant `1 + ε`. Prove the
successive-support constructions and constants, then use these in the primal and dual
finite-average arguments. Establish the rational-coordinate reduction of Lemmas 7.1–7.2 with its
perturbation/error bounds before applying the operator-distance construction.

Construct the mixed-Tsirelson norming sets on finite-support functions, their completion and
implicit-norm comparison, successive-block and finite-average estimates. For `X_K` use the
finite rational nets, weight, rank, age and injective odd-weight coding of Argyros–Haydon
Definition 4.4; use the positively indexed base sequences `M_j = 2^(2^j)` and
`N_j = 2^(2^(j²+1))`, `j ≥ 1`, or an increasing subsequence `m_j = M_(s(j))`, `n_j = N_(s(j))`
with strictly increasing `s : ℕ+ → ℕ+`. Thus the first base pair is `(4, 16)`; no index-zero
weight is used. Prove `m₁ ≥ 4`, `n₁ ≥ 16`, `m_(j+1) ≥ m_j²` and
`n_(j+1) ≥ m_(j+1)² (4n_j)^(2^(j+1))` for every `j ≥ 1`, including their inheritance by every
such subsequence. These are the parameters used in Assumption 2.3 and the Lemma 2.4 average
estimates. Prove recursive finiteness, the evaluation-analysis formula, all even-weight
extensions and the odd-weight tree comparison. Develop rapidly increasing sequences (RIS), local
support, bounded and increasing local-weight splittings, the basic inequality and finite-average
upper/lower estimates. Prove that annihilation on all bounded RIS implies annihilation on every
bounded block sequence. Here finite block support and range refer to the BD basis/FDD; an
ambient bounded function on `Γ` can have infinite pointwise support. Define local support only
after restriction to a finite `Γ_q`, and prove its relation with FDD projections. Use this to
prove shrinking, the `ℓ¹` dual identification and the block compactness criterion.

Build `ℓ¹` averages, exact pairs and dependent sequences; prove the near-pair criterion for
hereditary indecomposability, with HI quantifying over infinite-dimensional subspaces
(finite-dimensional spaces satisfy it vacuously). Prove every infinite-dimensional closed
subspace `Y` contains seminormalized vectors `y_k ∈ Y` with `Σ_k ‖y_k − x_k‖` arbitrarily small,
where `(x_k)` is a seminormalized `C`-RIS of finitely supported rational-coordinate blocks. First
use the gliding hump to approximate a basic sequence in `Y` by blocks `u_j` with summable errors
to the vectors `v_j ∈ Y`. In `[u_j]` construct the `ℓ¹` averages of Lemma 6.2, then obtain an RIS
through Lemma 6.4/Corollary 6.5; rational approximation must preserve their bounds with the
chosen slack. Transfer each finite average `x_k = Σ c_j u_j` to `Σ c_j v_j ∈ Y` using the
coefficient bound `Σ |c_j| ‖u_j − v_j‖ ≤ (2K/inf ‖u_j‖) ‖x_k‖ Σ_(j in its block) ‖u_j − v_j‖`.
Here set `y_k = Σ c_j v_j`; these are the RIS approximants in `Y`, distinct from the original
gliding-hump vectors `v_j`. Prescribe the start of each RIS support arbitrarily far out; allow
every `C > 2` and rational approximants with the same range and explicit slack. Local-weight
splitting does not preserve proximity to `Y` and is not this construction. The blocks themselves
need not lie in `Y`. Apply §3.1's ambient small-perturbation theorem to obtain
`U : closure(span x_k) ≃ closure(span y_k)` with `U x_k = y_k`. For bounded real `T : Y → X_K`
apply the rational-block estimates to `T ∘ U`. Prove `dist(T y_k, ℝ y_k) → 0`, transferring the
estimates through `U` and its summable errors. Extend the exact-pair/dependent-sequence estimates
to operators with this domain, and interleave RIS in `Y` to prove one common real `λ`. Prove
`T − λ inclusion : Y → X_K` is strictly singular: a subspace on which it is bounded below would
contain such a perturbed seminormalized RIS, contradicting the estimate. Prove uniqueness of `λ`.
This real subspace theorem is a property of this construction, not a consequence of real HI
alone. For operators on all of `X_K` prove the quantitative contradiction using
`‖z‖ ≤ 48C/m²`, `‖Tz‖ ≥ δ/(4m)` and `m > 256C‖T‖/δ`: these imply
`‖Tz‖ ≥ δm‖z‖/(192C) > ‖T‖‖z‖`. Prove the associated scalars converge to one common `λ` by
pairing and interleaving RIS; the block compactness criterion then gives `T = λI + K`, `K`
compact. Supply uniqueness, linearity, multiplicativity and the norm bound of `T ↦ λ`. This is a
theorem about operators on all of `X_K`, not an assertion that strictly singular operators on
arbitrary subspaces are compact.

Apply §4.3 to `X_K` to obtain a complexification with dual isomorphic to `ℓ¹(Γ, ℂ)`. Decompose
the real and imaginary parts of every complex-linear operator on this space into their real
scalar-plus-compact forms to prove its complex scalar-plus-compact theorem. Retain hereditary
indecomposability as a proved property of the real construction; it is not inferred for an
arbitrary complexification.

Identify the real and complex quotients `L(X_K)/K(X_K)` by compact operators with the
corresponding scalar field, with quotient-norm equality and a bounded scalar projection, on
Mathlib's normed quotient of `X_K →L[𝕜] X_K` by the closed ideal of compact operators. For a
blocking `l_(n−1) + 1 < l_n` and finite-dimensional `F_n ⊆ ⊕_(l_(n−1) < k < l_n) M_k`, prove the
closed sum `W` is reflexive and `W*` is hereditarily indecomposable. Build its dual FDD, the
quotient `X_K* → W*`, block-supported Hahn–Banach lifts, dual exact pairs and dependent
sequences, and their quantitative HI estimates. Derive a conditional basis `(d_n*)` of `ℓ¹` and
`k₁ < k₂ < ⋯` such that `ℓ¹/closure(span{d_n* : n ∈ M})` is HI whenever `M ⊆ ℕ` contains
infinitely many intervals `(k_p, k_(p+1)]`. Pin the dual-lifting lemma with coefficient
`4m_(2j)` and its norm/error bound, deriving it from the coordinate net rather than the
inconsistent coefficient in its proof. State its low-coordinate annihilation after the
restriction/quotient `R : X_K* → W*`, with the supplied `ℓ¹` dual comparison; it is not a claim
that the corresponding raw `ℓ¹` functional has zero low-coordinate projection.

Construct infinite Ramsey for finite colourings of `[ℕ]^k`, its nested subsequence
diagonalization and rational coefficient nets. Use these to prove the Brunel–Sucheston
spreading-model existence theorem with uniform finite-pattern limits. Build spreading models of
normalized weakly null basic sequences, their domination relations and Krivine sets: for a
subsymmetric spreading basis and every `n, ε`, the `ℓᵖ_n` comparison must use successive blocks
with one common finite coefficient pattern, with two-sided bounds `(1+ε)⁻¹` and `1+ε`.
Unrestricted block finite representability does not replace this identically distributed
condition. Prove James's `ℓ¹` blocking lemma for a subsymmetric basis equivalent to `ℓ¹`: for
every `n ≥ 1` and `ε > 0` there exist normalized successive blocks with one common finite
coefficient pattern whose first `n` terms are `(1+ε)`-equivalent to the `ℓ¹_n` basis. Thus `1`
belongs to its Krivine set. Prove Elton near-unconditionality and the bounded-oscillation
subsequence theorem over real scalars: for a normalized weakly null sequence and fixed
`d, D ≥ 1`, obtain a basic subsequence and `C ≤ 8d + ε` such that
`‖Σ_(i∈F) a_i x_i‖ ≤ C ‖Σ_i a_i x_i‖` whenever the finite set `F` has coefficient oscillation at
most `D` and a successive Schreier decomposition into blocks of oscillation at most `d`.
Construct the finite-colouring/open-Ramsey selection and Matching Lemma used in
Dilworth–Odell–Schlumprecht–Zsák, *Partial Unconditionality* (arXiv math/0510609v1), Theorem 6
and Theorem 7 (Matching Lemma), p. 7, Corollary 9, p. 10, and Lemmas 10–11, pp. 11–12. Index these
sequences by positive integers, identifying them with native `ℕ` by `n ↦ n + 1`, so a single
nonempty Schreier block always satisfies `1 ≤ min F`. Prove open/closed Ramsey for the product
topology on infinite subsets: every infinite `L` has infinite `M ⊆ L` with `[M]^ω` contained in
a given open or closed set or its complement. Own these auxiliary results: a thin family means no
pair is related by proper initial segment. Prove the support-specialized witness selection below
makes its family `{A_M}` thin; for a thin family `A` and finite colour set `S_k` at each minimum
`k`, stabilize a colouring on each equal-minimum fibre after an infinite restriction. For
continuous assignments of `n` successive nonempty finite blocks `F_j^M ⊆ M`, construct `L, M`
with corresponding blocks comparable by initial-segment order `≺` and
`L ∩ M = ⋃_j (F_j^L ∩ F_j^M)`. The variable-block Schreier version assumes a continuous finite
thin witness `A_M`, block count `n_M ≤ min A_M = min F_1^M`, and `⋃_j F_j^M ⊆ A_M`, with
identical decompositions when `A_M` agrees; prove equal block counts and the same matching
conclusion. Here `≺` is not numerical successive-set `<`. For a witness relation with nonempty
values in a disjoint union of sets `Ω_r`, whose level-`r` choices depend only on the first `r`
membership coordinates, construct a continuous selection into the discrete witness set by the
first nonempty level and a fixed well-order there. For the thin-family application require each
witness `a ∈ Ω_r` to have nonempty finite support `A(a)` with `max A(a) = r`, and require
eligibility for `M` to mean exactly `A(a) ⊆ M` together with a fixed witness condition
independent of `M`. Set `A_M = A(φ(M))` for the least-level selected witness. If `A_L` is an
initial segment of `A_M`, then `φ(L)` is eligible for `M`, so least-level selection gives
`r(M) ≤ r(L)`. Inclusion gives `r(L) ≤ r(M)`; equal maxima and the initial-segment relation force
`A_L = A_M`. Thus `{A_M}` is thin under these extra support hypotheses. If `A_L = A_M = A`, each
selected witness is eligible for the other infinite set at the same level `max A`; the fixed
well-order forces `φ(L) = φ(M)`. Hence their decompositions `F_j^M`, read off the selected
witness `φ(M)`, are identical, as required by the variable-block Schreier lemma. General
continuous selection alone is not claimed to imply thinness. Finally, for continuous
`f : [ℕ]^ω → c₀` in the pointwise topology such that every sequence in its image has a cluster
point in `c₀`, prove every `ε > 0` and infinite `M` admit infinite `N ⊆ M` with
`Σ_(i∈N\P) |f(P)(i)| ≤ ε` for every infinite `P ⊆ N`, by Ramsey thinning and the `c₀`
cluster-point contradiction. These are the thin-family stabilization, Schreier Matching,
continuous-selection and `c₀`-tail inputs to the bounded-oscillation proof. At `d = D = 2` a
single block gives AOST's uniform dyadic-band estimate (36) with `C = 16 + ε` independent of the
band index. Prove the `(D, d)` property passes to subsequences, using preservation of Schreier
admissibility under `k_i ≥ i`; ordinary near-unconditional constants depending on the threshold
alone do not establish that uniform bound.

Prove Androulakis–Odell–Schlumprecht–Tomczak-Jaegermann Theorem 5.4 over real scalars: if `X`
contains two normalized weakly null basic sequences, the first with spreading model not
equivalent to `ℓ¹` and the second with `1` in its spreading model's Krivine set, then there are a
closed subspace `Y ⊆ X` and bounded `T : Y → X` such that `T − λ inclusion` is noncompact for
every scalar `λ`. Build the successive-block domination, Schreier unconditionality and bounded
sequence-map extension used in that proof. Pin its cardinality families `G_n = {F : #F ≤ M_n}`,
the small coefficient supremum norm `sup_n δ_n Σ_(i∈F) |a_i|` and the two Lemmas 5.2/5.3
upper/lower domination constructions. Keep the lower estimate's `1/9` constant, rescaling the
resulting `y_i` by `9` to obtain the normalized domination before defining `T(y_i) = x_(m_i)`.
State the quantitative inputs before the sequence-map extension: the Brunel–Sucheston thinning
compares a sequence with its spreading model within factor `2` on every finite pattern supported
on `F ⊆ [n, ∞)` with `|F| ≤ n2ⁿ`. Prove Odell's 3-Schreier suppression bound for a weakly null
basic subsequence on `S₁ = {F : |F| ≤ min F}`, using the finite-pattern functional-witness Ramsey
thinning and weak-null tail estimates. For the integers `K_n` first replace them by
`max_(m≤n) K_m`, then reindex by `k_i ≥ i K_i`; derive the bound `3` for families
`|F| ≤ n K_n` with `n < min F`. This is the stronger Schreier input, distinct from
fixed-cardinality `N^(≤n)` unconditionality. In Lemma 5.3 construct `y_j = Σ_n δ_n w_j^(M_n)`
with norm-convergent series. For `|G| ≤ M_n` use only its level-`M_n` family, whose finite groups
are 3-equivalent to `ℓ¹`; the second suppression factor `3` gives
`‖y + Σ a_j y_j‖ ≥ (δ_n/9) Σ_(j∈G) |a_j|`. Require the supporting family `F` to satisfy
`|F| ≤ M_n K_(M_n)` and `M_n < min F`. Keep `M_n` in both the construction and the lower
estimate; the source's lower display `w_j^n` does not provide this `M_n`-wise bound. Prove the
basic interleaving selection under these construction hypotheses, so `x_(m_i) − λ y_i` is
seminormalized and weakly null for every scalar `λ`.

Apply the RIS and rank-layer sum sequences in `X_K`: the rank-layer sums are uniformly bounded by
the extension-map norm and weakly null as bounded blocks of the shrinking FDD. Prove their `ℓ¹`
spreading-model lower bound and normalized upper bound before applying Theorem 5.4, and combine
with the HI scalar-plus-strictly-singular theorem for maps `Y → X_K` to obtain a strictly
singular noncompact map. For the stronger endomorphism instance, first construct the universal
mixed-Tsirelson basis `e_i` for Assumption 2.3, its 1-subsymmetry and weak nullity, using
norming-tree bounds and the shrinking/averaging estimates. Prove the RIS upper estimate
`‖Σ a_i x_i‖ ≤ 10C ‖Σ a_i e_i‖_T` and, from Lemma 2.4, the `n_j`-average bound `≤ 10C/m_j`;
this shows the RIS spreading model is not `ℓ¹`-equivalent. Apply Lemma 5.2 to `e_i` before
choosing the AH domain, then Lemma 5.3 to the rank-layer sequence. It produces vectors `z_i`
such that `‖Σ a_i e_i‖_T ≤ C₀ ‖Σ a_i z_i‖`; 1-subsymmetry removes the subsequence indices on
`e_i`. Set `Y = closure(span z_i)`. Choose cutoffs `r_i` with
`‖P_(≤r_i) z_i‖ ≥ (1/2) inf_j ‖z_j‖`, then normalized `y_i ∈ Y` approximating a `C`-RIS `x_i`
with summable errors, each `x_i` supported beyond `r_i`. The `z_i` supplied by Lemma 5.3 may be
infinite sums, so no finite-support hypothesis is imposed on them. The estimate
`‖Σ a_i y_i‖ ≤ 10CC₀ ‖Σ a_i z_i‖ + (Σ ‖y_i − x_i‖) sup |a_i|`, together with bounded coefficient
functionals for `z_i`, proves the map `z_i ↦ y_i` extends to a bounded endomorphism of `Y`. The
uniformly bounded FDD projections `P_(≤r_i)` show `y_i − λ z_i` is eventually seminormalized for
every `λ ≠ 0`, since `P_(≤r_i) x_i = 0` and the approximation errors tend to `0`; for `λ = 0` use
normalization. Prove `z_i` is weakly null: each fixed-level `(w_j^(M_n))_j` is a bounded block
sequence of the shrinking FDD, the levels have one uniform norm bound, and `Σ δ_n < ∞` controls
the infinite series tails uniformly. Thus every scalar perturbation is noncompact. Subtract the
scalar supplied by the real subspace theorem to obtain a strictly singular noncompact
endomorphism. This argument constructs the domain after universal domination; it does not
assume the original rank-layer sums dominate every RIS. For the finite rank-layer lower bound
use `min F ≥ 2j`, `#F < 2n_(2j)`, and choose a separated subset of at most `n_(2j)` coordinates
carrying at least one quarter of the absolute coefficient sum; prove the sign selection and
evaluation-analysis estimate. Construct a continuum almost-disjoint family of parameter
subsequences, all satisfying Assumption 2.3, with the inherited initial-index and growth
estimates; construct their Bourgain–Delbaen spaces and prove every operator between distinct
members is compact, with their incomparable `ℓ¹`-predual weak-star topologies.

Prove the weakly-unconditionally-Cauchy criterion: a Banach space contains no copy of `c₀` iff
every series with uniformly bounded signed finite partial sums converges unconditionally. Prove
Rosenthal's `ℓ∞` operator lemma: if `S : ℓ∞ → Z` is bounded and `inf_n ‖S e_n‖ > 0`, some
infinite-coordinate restriction is bounded below and embeds `ℓ∞`. Use these in the operator-space
lemma: if `X*`, `Y` contain no `c₀`, `W(X,Y) = K(X,Y)`, and `K(X,Y)` is separable, then `K(X,Y)`
contains no `c₀`. An assumed `c₀` operator sequence extends by its unconditional sums on `X**` to
`ℓ∞ → W(X,Y)`; adjoint sums in `X*` prove weak*-to-weak continuity, and Rosenthal's lemma
contradicts separability. Instantiate for `X = Y = X_K`: weakly compact operators are compact by
scalar-plus-compact and nonreflexivity; the shrinking basis and separable dual imply `K(X_K)` is
separable by finite-rank density. The HI property excludes `c₀` in `X_K`, and the Schur property
excludes `c₀` in `X_K* ≅ ℓ¹`. This route is adapted from Emmanuele's operator-space argument. In
bounded and compact operator spaces construct complemented rank-one copies of `X_K` and `X_K*`.
The preceding lemma and `L(X_K) = K(X_K) ⊕ ℝI` prove neither operator space contains a copy of
`c₀`. Prove the compact-operator/injective-tensor identification and unconditionalization of a
basic sequence. Show `(e_γ* ⊗ d_γ)` spans a reflexive space with an unconditional basis:
establish the two-sided operator/unconditionalized norm bounds and first prove James's
unconditional-basis dichotomy: a nonreflexive Banach space with an unconditional basis contains
`c₀` or `ℓ¹`, with a block-subsequence realization. Exclude both `ℓ¹` and `c₀` skipped-block
sequences using the RIS estimates, supplying the `c₀` case as well as the `ℓ¹` proof.

**Checks.**
- The first base pair is `(M₁, N₁) = (2^2, 2^(2^2)) = (4, 16)`; then `m₂ = 16 = m₁²` and
  `n₂ = 2^32 = m₂² (4n₁)⁴ = 2^8 · 2^24`, so the growth inequality holds with equality at `j = 1`.
- At `j = 2`: `n₃ = 2^1024` against `m₃² (4n₂)^8 = 2^16 · 2^272 = 2^288`.
- The quantitative contradiction: from `‖z‖ ≤ 48C/m²`, `‖Tz‖ ≥ δ/(4m) ≥ δ m ‖z‖/(192C)`, and
  `m > 256C‖T‖/δ` gives `δm/(192C) > (256/192)‖T‖ ≥ ‖T‖`, so `‖Tz‖ > ‖T‖ ‖z‖` for `z ≠ 0`, which
  is impossible.
- Degenerate Bourgain–Delbaen data: with every `c_γ* = 0`, `d_γ* = e_γ*`, each extension map `i_q`
  extends by zero, `d_γ = e_γ`, and the closed span of the `d_γ` in `ℓ∞(Γ)` is `c₀(Γ)`; the
  extension-norm bound `(1 − 2θ)⁻¹` is `1` at `θ = 0`, as it must be for extension by zero.
- Thin families: `{{1}, {1, 2}}` is not thin, since `{1}` is a proper initial segment of `{1, 2}`,
  while `{{1, 3}, {1, 2, 3}}` is thin although `{1, 3} ⊂ {1, 2, 3}`, since the initial segments of
  `{1, 2, 3}` are `{1}`, `{1, 2}` and itself; a definition through inclusion would reject it.
- The Schreier family `S₁ = {F : |F| ≤ min F}` on positive integers: `{2, 3} ∈ S₁` and
  `{1, 2} ∉ S₁`; on native `ℕ` without the shift `n ↦ n + 1` even `{0} ∉ S₁`, so single blocks
  would fail to be admissible, which is why the positive-integer indexing is fixed.
- Spreading models and Krivine sets: the unit-vector basis of `ℓᵖ`, `1 ≤ p < ∞`, is its own
  spreading model, and successive blocks with a common coefficient pattern span `ℓᵖ_n`
  isometrically, so its Krivine set is `{p}`; for `c₀` the blocks span `ℓ∞_n` isometrically and
  the Krivine set is `{∞}`; a definition admitting every `p` with `ℓᵖ_n` merely isomorphic to a
  block span, with constants growing in `n`, would put every `p` in both sets.
- The `(D, d)` property for an unconditional basic sequence with suppression constant `K`: every
  finite `F` gives `‖Σ_(i∈F) a_i x_i‖ ≤ K ‖Σ_i a_i x_i‖`, so the inequality holds with `C = K`
  for every `D, d`; the content of the theorem is the bound `8d + ε` for conditional weakly null
  sequences.

*Needs:* Mathlib `lp (fun _ : Γ => ℝ) ∞`, `IsCompactOperator`, normed quotients; §3.1's ambient
small-perturbation theorem and basic sequences; §4.3; Argyros–Haydon §§2–9; AOST Theorem 5.4;
DOSZ Theorems 6–7, Corollary 9 and Lemmas 10–11; Emmanuele.

### Examples

`𝕜`, `ℓ²ₙ` and the diagonal operators `diag(1/j)`, `diag(1/j²)` on `ℓ²`; the Krawtchouk tables
at `n = 3, 4`; the Argyros–Haydon parameters `(4,16)`, `(16, 2^32)`.

### Dependencies

Mathlib: `lp`, `ZMod`, `Nat.choose`, normed quotients, `IsCompactOperator`. Tau Ceti: the Layer 4
contract, the pinned local reflexivity of the Layer 7 contract for §4.4's metric criterion, and
the pinned Riesz–Markov–Kakutani theorem of the Layer 5 contract for §4.4's integral/nuclear
route. Within the roadmap: Layer 1 (bidual), Layer 2 (reflexivity) and Layer 3 (bases and
perturbation). OperatorIdeals for §4.2.

## Layer 5: function spaces and weak compactness (B5)

### 5.1 Finitely supported vectors and separability of `ℓ²(S)`

For `𝕜 = ℝ` or `ℂ` and any index type `S`, use the native Hilbert space
`lp (fun _ : S => 𝕜) 2`, with `lp.completeSpace` and its existing inner product. The
first-linear pairing `Σ x_s conj(y_s)` is native `⟪y, x⟫`; use the native convention in the
coefficient maps below. Inside it construct the submodule `D_S` of finitely supported vectors,
and the linear identification with `S →₀ 𝕜` given by finite sums of `lp.single 2 s a`. `D_S`
carries the inherited `ℓ²` norm. Consume `lp.hasSum_single` to prove `D_S` dense, and identify
its normed completion isometrically with the same native `lp` space, including the extension and
uniqueness maps. Prove every `lp` vector has countable support by the finite level sets
`{s : ‖x_s‖ ≥ 1/n}`, `n ≥ 1`; countable support alone is not square summability.

For infinite `S` choose distinct `s_n` and use the partial sums of
`Σ_n 2^(−(n+1)) • lp.single 2 s_n 1` to show `D_S` is not complete: the ambient limit has
infinite support. For finite `S` prove `D_S` is the whole space. For distinct `s, t` the
coordinate unit vectors have distance `√2`; prove this makes `lp(S, 𝕜, 2)` nonseparable when
`S` is uncountable. In the countable case use finite supports with rational coefficients
(Gaussian rational coefficients over `ℂ`) to construct a countable dense set (van Neerven,
*Functional Analysis*, Theorem 3.22, p. 107). Thus
`lp(S, 𝕜, 2)` is separable exactly when `S` is countable. It is distinct from the Lebesgue
carrier `L²([0,1], 𝕜)`; no point evaluation on that `L²` is inferred.

**Checks.**
- For finite `S`, `D_S` is the whole space `lp(S, 𝕜, 2)`: a definition of `D_S` through a
  proper dense subspace would make the finite case incomplete.
- For `S = ℕ` the vector `(2^(−(n+1)))_n` lies in `lp`, has infinite support and is the limit of
  its partial sums in `D_S`, so `D_S` is dense and not closed; a definition identifying `D_S`
  with its completion gets this wrong.
- For uncountable `S` the unit vectors are at mutual distance `√2`, so `lp(S, 𝕜, 2)` is not
  separable, while for `S = ℕ` the finite rational (Gaussian rational) combinations are a
  countable dense set.

*Needs:* Mathlib `lp`, `lp.single`, `lp.hasSum_single`, `lp.completeSpace`,
`UniformSpace.Completion`.

### 5.2 Hilbert dimension and the unitary classification

For a complete inner-product space consume native `exists_hilbertBasis` and `HilbertBasis.repr`.
Prove it is separable iff the index type of a Hilbert basis is countable, using the separated
unit-vector and finite-sum arguments of §5.1. For a separable infinite-dimensional space prove
that index type countably infinite, choose an equivalence with `ℕ` and reindex the basis.
Construct the resulting linear isometric equivalence with `lp(ℕ, 𝕜, 2)`, with coefficient map
`x ↦ (⟪b_n, x⟫)_n` and inverse `c ↦ Σ_n c_n • b_n`, including convergence and both inverse
identities. For two such spaces compose their coefficient maps; state the dependence on the
chosen bases and preserve the scalar field. Finite-dimensional and zero spaces use their finite
or empty bases.

For Hilbert bases `b : HilbertBasis ι 𝕜 H` and `c : HilbertBasis κ 𝕜 H`, prove
`Cardinal.lift (#ι) = Cardinal.lift (#κ)` in a common universe (`hilbertBasis_lift_mk_eq`; Conway,
*A Course in Functional Analysis*, Chapter I, Proposition 4.14). For
each `j`, the coefficients of `c_j` in `b` have countable support; their union over `j` covers
`ι`, since an omitted `b_i` would be orthogonal to every `c_j` and hence zero. If `κ` is infinite
this gives `#ι ≤ #κ · ℵ₀ = #κ`; reverse the argument when both are infinite and use cardinal
antisymmetry. If either index is finite, use `HilbertBasis.toOrthonormalBasis` and
finite-dimensional orthonormal-family bounds. Include empty indices and the zero space. Define the
resulting basis-independent cardinal as the Hilbert dimension; it agrees with `finrank` in finite
dimension and is not the algebraic rank `Module.rank` in infinite dimension.

For complete `H` and `K` over the same field with Hilbert bases indexed by `ι` and `κ`, prove
`Nonempty (H ≃ₗᵢ[𝕜] K)` iff their index cardinals agree, with universe lifts
(`nonempty_linearIsometryEquiv_iff_lift_mk_eq`). Given an index equivalence `e`, construct the
coordinate-reindexing isometry of the native `lp` spaces and compose it with the two
`HilbertBasis.repr` maps; prove the resulting unitary sends `b_i` to `c_(e i)`
(`exists_linearIsometryEquiv_hilbertBasis`). Conversely the pinned `HilbertBasis.mapₗᵢ` transports a
Hilbert basis along a unitary, with `HilbertBasis.mapₗᵢ_apply` giving its vectors. Deduce that the Hilbert dimension of `lp(S, 𝕜, 2)` is `#S`, and that separable spaces
are classified by dimension `0`, a positive finite integer, or `ℵ₀` (van Neerven, *Functional
Analysis*, Theorem 3.25 and Corollary 3.23, pp. 107–108, for maximal orthonormal systems and the
separable case).

- The Hilbert dimension is invariant under linear isometric equivalence and additive on
  orthogonal direct sums.
- It equals `finrank` for finite-dimensional spaces and `#S` for `lp(S, 𝕜, 2)`.

**Checks.**
- `ℝ` and `ℝ²` over `ℝ` (and `ℂ` and `ℂ²` over `ℂ`) have Hilbert dimensions `1` and `2` and
  admit no linear isometric equivalence; a classification of separable spaces by separability
  alone would identify them.
- `lp(S, 𝕜, 2)` has Hilbert dimension `#S`, witnessed by the unit vectors; for `S = ℕ` this is
  `ℵ₀` while the Hamel rank `Module.rank` of `ℓ²` is the continuum, so the algebraic rank is the
  wrong invariant.
- The zero space has the empty Hilbert basis and dimension `0`; `lp(ℕ, 𝕜, 2)` and
  `lp(ℤ, 𝕜, 2)` both have dimension `ℵ₀` and are unitarily equivalent through any bijection
  `ℕ ≃ ℤ`, so the dimension does not depend on the chosen basis.

*Needs:* Mathlib `HilbertBasis`, `HilbertBasis.repr`, `exists_hilbertBasis`,
`HilbertBasis.toOrthonormalBasis`, `Orthonormal`, `Cardinal.lift`, `Cardinal.mk`; Tau Ceti
`HilbertBasis.mapₗᵢ`; §5.1.

### 5.3 Fourier unitaries, classical Banach spaces and their operator norms

Construct the explicit complex unitary `ℓ²(ℕ, ℂ) ≃ L²([0,1], ℂ)` using native `fourierBasis` on
the unit additive circle, its a.e. unit-interval/Haar comparison, `HilbertBasis.repr` and a fixed
enumeration `ℕ ≃ ℤ`. For the real unitary `ℓ²(ℕ, ℝ) ≃ L²([0,1], ℝ)` construct the orthonormal
trigonometric basis indexed by `ℕ`: index `0` is the constant `1`, index `2n − 1` is
`√2 cos(2πnt)` and index `2n` is `√2 sin(2πnt)` for `n ≥ 1`; prove orthonormality and completeness
by comparison with the complex Fourier basis. Values at interval endpoints are not invariants of
`L²` classes (van Neerven, *Functional Analysis*, Theorem 3.28, p. 110, for the trigonometric
basis of `L²` of the circle).

**Checks.**
- `‖√2 cos(2πt)‖₂² = ∫₀¹ 2 cos²(2πt) dt = 1` and `⟨√2 cos(2πt), √2 sin(2πt)⟩ = ∫₀¹ sin(4πt) dt = 0`;
  without the factor `√2` the norm would be `1/√2`.
- With `e_n(t) = e^(2πint)`, `√2 cos(2πnt) = (e_n + e_(−n))/√2` and
  `√2 sin(2πnt) = (e_n − e_(−n))/(√2 i)`, so the real basis is the image of a unitary change of
  basis on each pair `{e_n, e_(−n)}`, which proves completeness from that of the complex basis.
- The constant `1` has index `0` and norm `1`, and `⟨1, √2 cos(2πnt)⟩ = 0` for `n ≥ 1`; an indexing
  that started the cosines at `n = 0` would repeat the constant function with norm `√2`.

Prove completeness with the specified norms for the ten examples `c₀`, `C₀(ℝ)`, `C¹[0,1]`,
`C²[0,1]`, `Lip[0,1]`, `C^(0,α)[0,1]` (`0 < α < 1`), `W^(1,1)(0,1)`, weighted `ℓ¹`, `B(ℓ²)` and
`L¹[0,1] ⊕₁ L²[0,1]`. Use sup/derivative-sup sums for `C^k`, sup plus Lipschitz/Hölder seminorm
for `Lip`/`C^(0,α)`, and `‖u‖₁ + ‖u′‖₁` on the pinned `TauCeti.W1p` carrier of `W^(1,1)(0,1)`,
whose completeness is pinned and whose absolutely continuous representative is PDE Layer 1 §1.1
(A1)'s identification at `p = 1`. Distinguish the smooth `C¹` carrier with its `L¹` graph norm
from this complete weak `W^(1,1)` carrier. On smooth `C¹[0,1]` prove differentiation to `L¹` is
unbounded for the `L¹` domain norm, using `tⁿ` with norms `1/(n+1)` and `1`. Differentiation to
the sup-norm range is also unbounded for the `L¹` graph domain norm, by continuous triangular
derivative bumps and their primitives. Prove the fundamental-theorem bound
`‖f‖∞ ≤ ‖f‖₁ + ‖f′‖₁`, which controls `f`, not `f′`. Smooth approximations to `|t − 1/2|` prove
`C¹` is incomplete with its sup norm and its `L¹` norm; prove the completion of the graph-`L¹`
norm is the weak `W^(1,1)` space, while the sup/derivative-sup `C¹` norm is complete. Use
positive weights for weighted `ℓ¹` and the sum norm for the product.

Define the interval little Hölder space `h^(0,α)[0,1]` as the `C^(0,α)`-norm closure of `C¹[0,1]`
and prove it consists exactly of the functions whose Hölder quotient
`|f(x) − f(y)|/|x − y|^α` tends to `0` uniformly as `|x − y| → 0`. Construct its closed-subspace
Banach structure and compare with the boundaryless P5 carriers only where their hypotheses
apply.

- `h^(0,α)[0,1]` is a closed subspace of `C^(0,α)[0,1]`, hence a Banach space.
- It contains `C¹[0,1]` and every `C^(0,β)` function with `β > α`.

**Checks.**
- `t^α` lies in `C^(0,α)` with seminorm `1`, but `|x^α − 0^α|/x^α = 1` for every `x > 0`, so its
  small-scale quotient does not vanish and `t^α ∉ h^(0,α)`: the closure is a proper subspace.
- `t^β` with `α < β ≤ 1` lies in `h^(0,α)`: `|x^β − y^β| ≤ |x − y|^β`, so the quotient is at most
  `|x − y|^(β−α) → 0`.
- A `C¹` function has quotient at most `‖f′‖∞ |x − y|^(1−α) → 0`, so `C¹ ⊆ h^(0,α)`, consistent
  with the closure definition.

On these carriers compute the operator norms: the derivative `C¹[0,1] → C[0,1]` has norm `1`
(upper bound and oscillatory witnesses), Volterra on `C[0,1]` has norm `1`, for `φ ∈ L∞[0,1]` the
multiplication operator on `Lᵖ[0,1]` has norm the essential supremum `‖φ‖∞` for every
`1 ≤ p ≤ ∞`, and the bilateral shift on `ℓᵖ(ℤ)` and the half-period composition on `Lᵖ[0,1]`, for
every `1 ≤ p ≤ ∞`, have norm `1`. Prove the half-period map is measure preserving and its induced
operator is an isometric involution on a.e. classes.

*Needs:* Mathlib `fourierBasis`, `HilbertBasis.repr`, `MeasureTheory.Lp`, `lp`; Tau Ceti
`TauCeti.W1p` with its completeness; PDE Layer 1 §1.1 (A1); PseudodifferentialOperators Layer 5
(P5) for the comparison only.

### 5.4 Finite regular measures and the dual of `C(K)`

For compact Hausdorff `K` with its Borel σ-algebra, use the submodule of
`MeasureTheory.VectorMeasure K 𝕜` of measures with regular variation, normed by
`(ν.variation Set.univ).toReal`; every scalar vector measure has finite variation
(`MeasureTheory.VectorMeasure.isFiniteMeasure_variation`). Write `M(K)` for this normed
submodule, closed under addition, scalar multiples and differences by the pinned regularity
instances `regular_variation_add`, `regular_variation_smul` and `regular_variation_sub`. Compare
with native `SignedMeasure` and `ComplexMeasure`. Regularity of a signed or complex measure is
regularity of its variation: for the signed measure `δ₀ − δ₁` on `[0,1]` and `A = {0,1}`,
`μ(A) = 0` but the supremum of `|μ(K')|` over compact `K' ⊆ A` is `1`, so unsigned inner
regularity cannot be applied to signed or complex values.

Construct the scalar density of a scalar measure first; it serves the norm equality below and
§§5.7 and 5.9. For a measurable space, a σ-finite positive measure `ν` (`[SigmaFinite ν]`) and a
scalar vector measure `μ` with `|μ| ≪ ν`, construct the integrable density
`h = rnDeriv(re μ, ν) + I · rnDeriv(im μ, ν)` from the pinned signed parts `scalarMeasureRealPart`
and `scalarMeasureImagPart`, prove `μ = ν.withDensityᵥ h` by the pinned reconstruction
`scalarMeasureOfReal_realPart_add_I_smul_imagPart`, and specialize to the native `ℝ` and `ℂ`
derivatives: for `ℂ`, identify the density with native `ComplexMeasure.rnDeriv` using the pinned
real/imaginary compatibility `re_integral_ofReal` and consume native `integrable_rnDeriv`; for
`ℝ` consume `SignedMeasure.absolutelyContinuous_iff_withDensityᵥ_rnDeriv_eq` and
`SignedMeasure.totalVariation_eq_variation`. Consume `Integrable.withDensityᵥ_eq_iff` for a.e.
uniqueness and `Measure.variation_withDensityᵥ` for `|μ| = ν.withDensity (fun x => ‖h x‖ₑ)`. For
`μ` of finite variation, `ν = |μ|` is finite, hence σ-finite, and `|h| = 1` ν-a.e. (van Neerven,
*Functional Analysis*, Theorem 2.48 and Examples 2.49–2.50, pp. 73–76).

Prove the Riesz representation of `C(K, 𝕜)*` (`exists_unique_vectorMeasure_regular`): every
`φ ∈ StrongDual 𝕜 C(K, 𝕜)` is `f ↦ ∫ᵛ x, f x ∂[mul ℝ 𝕜; μ]` for a unique `μ` with regular
variation, and `‖φ‖ = |μ|(K)` (van Neerven, Theorem 4.2, p. 127, for `𝕜`-valued Radon measures on
a locally compact Hausdorff space). Restrict to real-valued functions and represent the real and
imaginary parts of `φ`: a bounded real functional on `C(K, ℝ)` is order bounded, so the pinned
`TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart` writes it as a
difference of integrals against the Riesz measures of its positive and negative parts, regular
measures that are finite because `K` is compact (§4.4). Reconstruct the scalar measure by
`scalarMeasureOfReal` and the pinned reconstruction
`scalarMeasureOfReal_realPart_add_I_smul_imagPart`, and extend from real tests by the pinned
`𝕜`-homogeneity `integral_const_mul`. Uniqueness is the pinned
`MeasureTheory.VectorMeasure.ext_of_integral_eq_on_continuousMap`. For the norm, the integral
bound gives `‖φ‖ ≤ |μ|(K)`. For the reverse inequality, use the density construction above at
`ν = |μ|`: `μ = ν.withDensityᵥ h` with `‖h‖ = 1` ν-a.e.; choose a measurable representative of
`conj h` bounded by one, approximate it in `L¹(ν)` by continuous functions with the same bound
(`MeasureTheory.exists_seq_continuous_norm_le_tendsto_integral_norm_sub`), and use the pinned
pairing identity `MeasureTheory.VectorMeasure.integral_mul_withDensityᵥ`; their integrals against
`μ` tend to `ν(K)`. Transport completeness of `M(K)` from the strong dual through the resulting
onto linear isometry, and export the isometric dual equivalence `StrongDual 𝕜 C(K, 𝕜) ≃ₗᵢ M(K)`
and its weak-star evaluation laws.

Extend this finite-regular-variation measure space to every locally compact Hausdorff Borel
space `X`, with the same carrier and norm, and prove completeness without assuming `X` compact
or σ-compact. Let `X⁺ = OnePoint X`. Extend measures by zero at infinity along the canonical open
embedding `X → X⁺` and prove this is a linear isometry from `M(X)` onto `{ν ∈ M(X⁺) : ν({∞}) = 0}`;
construct its inverse by restriction to `X`, and prove both maps preserve regular total
variation, the total-variation norm and the integration pairing for compactly supported
continuous functions. Use compact approximation for the zero extension's regularity and the
singleton variation identity for the restriction: `ν({∞}) = 0` implies `|ν|({∞}) = 0`. The
singleton evaluation `ν ↦ ν({∞})` is bounded by `‖ν‖`, so its kernel is closed in the complete
`M(X⁺)`; transport completeness through this isometry. Include empty and already compact `X`.

For nonempty `K`, prove that the extreme points of the dual unit ball of `C(K, 𝕜)` are exactly
`λδ_x`, `|λ| = 1`, by splitting variation on measurable sets and using regularity; handle empty
spaces separately.

- `M(K)` is a Banach space; `δ_x` has norm `1` and pairs with `f` as `f(x)`.
- The Riesz map `StrongDual 𝕜 C(K, 𝕜) → M(K)` is a linear isometric equivalence, and the dual
  unit ball is weak-star compact with extreme points `λδ_x`, `|λ| = 1`.

**Checks.**
- For `K` a point, `M(K) = 𝕜 · δ` with `‖cδ‖ = |c|`, and `C(K, 𝕜)* = 𝕜`.
- `φ(f) = f(0) − f(1)` on `C([0,1], 𝕜)` has `‖φ‖ = 2` (attained at `f(t) = 1 − 2t`), represented by
  `μ = δ₀ − δ₁` with `|μ|([0,1]) = 2`; a norm `|μ(K)|` would give `0`.
- On `[0,1]`, `μ = λ − δ_{1/2}` (Lebesgue minus a point mass) has `μ([0,1]) = 0` and
  `‖μ‖ = 2` by mutual singularity; the Jordan parts are `λ` and `δ_{1/2}`.

*Needs:* Mathlib `MeasureTheory.VectorMeasure`, `VectorMeasure.variation`, `RealRMK.rieszMeasure`,
`OnePoint`; Tau Ceti the scalar-measure layer (B5.ScalarIntegral, B5.ScalarDensity,
B5.AbsContRegular, B5.ScalarUniqueness, B5.BoundedApprox), `TauCeti.RealRMK.posPart`,
`TauCeti.RealRMK.negPart`; Mathlib signed and complex Radon–Nikodym derivatives,
`Integrable.withDensityᵥ_eq_iff`, `Measure.variation_withDensityᵥ` (density construction only).

### 5.5 Banach–Stone

Prove the Banach–Stone theorem (`banach_stone`) in its operator form: a surjective linear isometry
`C(K, 𝕜) → C(L, 𝕜)` is `f ↦ h · (f ∘ φ)`, where `φ : L ≃ₜ K` and `h : C(L, 𝕜)` has pointwise
modulus one; include uniqueness and the converse. Construct `φ` and `h` from the adjoint action
on the extreme Dirac functionals of §5.4, with `h = T1`, and prove continuity of `φ` via
evaluation of continuous functions (Garrido–Jaramillo, §2, Theorems 2 and 4, for the real
weighted-composition theorem and the Arens–Kelley extreme points; the complex version uses the
variation splitting and phase arguments of §5.4).

**Checks.**
- `K = L` a point and `T = λ ·` with `|λ| = 1`: `h = λ`, `φ = id`.
- `K = ∅` and `L ≠ ∅`: `C(∅, 𝕜) = 0` and no surjective isometry onto `C(L, 𝕜) ≠ 0` exists.
- On `C({1,2}, 𝕜) = 𝕜²` with the sup norm, `(a, b) ↦ (b, −a)` is an isometry with `φ` the
  transposition and `h = (1, −1)`; the bijection `(a, b) ↦ ((a+b)/2, (a−b)/2)` is no weighted
  composition, and it is not an isometry, since it sends `(1, 0)` of norm `1` to `(1/2, 1/2)` of
  norm `1/2`.

*Needs:* §5.4; Mathlib `ContinuousMap`, `Homeomorph`.

### 5.6 The `Lᵖ` dualities

Construct the isometric duality `(L¹(μ))* ≅ L∞(μ)` for σ-finite `μ` by the bilinear integral
pairing (`exists_lpInftyDualEquiv`): the pinned `MeasureTheory.Lp.toDual` is an isometry for
σ-finite `μ`, and the pinned `MeasureTheory.Lp.dualOneEquiv` is the finite-measure case; prove
surjectivity by a countable finite-measure exhaustion, gluing the finite-measure densities. For
`1 < p < ∞` and `q = p/(p − 1)`, on native scalar `Lp` spaces over an arbitrary measure `μ` prove
the isometric duality `(Lᵖ(μ))* ≅ L^q(μ)` by `φ_g(f) = ∫ f g`, bilinear without conjugation
(`exists_lpDualEquiv`). Consume the pinned uniform convexity and reflexivity of `Lᵖ` and the
norm attainment of functionals on reflexive spaces (Layer 2): the derivative of the `p`-norm identifies
every functional with `g = ‖φ‖ |f|^(p−2) conj(f)` at a normalized maximizing `f`, and at `f = 0`
the pointwise expression is zero. Prove the differentiation/domination, Hölder and exact-norm
statements on actual a.e. classes; this proof needs no σ-finiteness. Include zero measure and
zero functional and uniqueness almost everywhere (van Neerven, *Functional Analysis*, Theorem 4.4,
pp. 131–132, for σ-finite `μ` and `1 ≤ p < ∞` with the same bilinear pairing, and Remark 4.5,
p. 133, which removes σ-finiteness for `1 < p < ∞`).

**Checks.**
- `μ = ∞ · δ_a` (not σ-finite): `L¹ = 0` but `L∞ = 𝕜`, so no equivalence exists; σ-finiteness is
  needed in the `L¹` case and present.
- `μ = 0`: both sides are zero.
- Over `ℂ` at `p = q = 2` the pairing `∫ f g` is `ℂ`-linear in `g`, while `∫ f conj(g)` would be
  conjugate-linear and not a linear isometric equivalence onto the dual.

*Needs:* Mathlib `MeasureTheory.Lp`, `ContinuousLinearMap.lpPairing`, `ENNReal.HolderConjugate`;
Tau Ceti `MeasureTheory.Lp.toDual`, `MeasureTheory.Lp.dualOneEquiv`,
`MeasureTheory.Lp.uniformConvexSpace`, `MeasureTheory.Lp.surjective_inclusionInDoubleDual`;
Layer 2 (James) for norm attainment.

### 5.7 The Dunford–Pettis criterion and the Dunford–Pettis property

For a finite measure `μ`, prove the Dunford–Pettis weak compactness criterion
(`isCompact_closure_toWeakSpace_lp_one_iff`): a subset `S` of `L¹(μ)` is relatively weakly
compact iff it is norm bounded and for every `ε > 0` there is `δ > 0` such that `μ(A) ≤ δ`
implies `∫_A ‖f‖ dμ ≤ ε` for all `f ∈ S` (Albiac–Kalton, §5.2). Relate this to native
`UnifIntegrable` at exponent `1`, the bounded version to `UniformIntegrable`, and the uniform
tail-integral criterion, transporting representatives of `Lp` classes explicitly. Build the
truncation, Radon–Nikodym and weak-closure arguments, and prove weak sequential completeness of
`L¹(μ)`.

Prove the Dunford–Pettis property of `C(K, 𝕜)` for compact Hausdorff `K`
(`hasDunfordPettisProperty_continuousMap`) and of `L¹(μ)` for every measure
(`hasDunfordPettisProperty_lp_one`), through the pinned sequence criterion
`TauCeti.hasDunfordPettisProperty_iff` (Albiac–Kalton, §5.4). For `C(K)`: for a weakly null,
hence bounded, sequence of regular scalar measures `(νₙ)` form the finite regular measure
`ν = Σ 2^(−n−1) |νₙ|`; prove that for every finite regular positive `ν` the map
`g ↦ ν.withDensityᵥ g` is an isometric embedding `L¹(ν) → M(K)` with closed range, consuming
`Measure.variation_withDensityᵥ` and the pinned pairing identity `⟨f, ν.withDensityᵥ g⟩ = ∫ f g dν`.
Each `νₙ` satisfies `|νₙ| ≪ ν`, so §5.4's density construction writes `νₙ = ν.withDensityᵥ hₙ`; use
these densities to transfer weak nullity; uniform integrability of those densities (the criterion above) and
bounded convergence of the weakly null continuous functions then prove the `C(K)` sequence
criterion. For `L¹(μ)`: a sequence in `L¹(μ)` lives on a σ-finite set `S`, and restriction to
`L¹(μ|S)` preserves weak nullity of functionals, so it suffices to treat σ-finite `μ`; there
`L¹(μ)* ≅ L∞(μ) ≅ C(K_μ)` by §5.6 and §5.9, `C(K_μ)` has the property, and the pinned
`TauCeti.HasDunfordPettisProperty.of_dual` transfers it to `L¹(μ)`.

**Checks.**
- In `L¹[0,1]`, `fₙ = n 1_[0,1/n]` has norm `1` and `∫_[0,1/n] fₙ = 1` on a set of measure `1/n`:
  bounded, not uniformly integrable, and with no weakly convergent subsequence (a weak limit
  would integrate to `0` over every `[a,1]`, `a > 0`, and to `1` over `[0,1]`).
- On a one-point space with `μ = δ_a` every set of measure at most `1/2` is null, so the
  integral condition holds for every `S`, while `S = {n · 1} ⊆ L¹ = 𝕜` is unbounded and not
  relatively weakly compact: boundedness is a separate hypothesis when `μ` has atoms.
- A dominated family `{g : |g| ≤ h}` with `h ∈ L¹(μ)` satisfies the integral condition uniformly
  by absolute continuity of `∫ h`, and is relatively weakly compact.

*Needs:* for the criterion, Mathlib `MeasureTheory.Lp`, `UnifIntegrable`, `UniformIntegrable`;
for the property of `C(K)`, Tau Ceti `TauCeti.HasDunfordPettisProperty`,
`TauCeti.hasDunfordPettisProperty_iff`, the scalar-measure layer, Mathlib
`Measure.variation_withDensityᵥ`, §5.4 (`M(K)` and the density construction) and the criterion
above; for the property of `L¹(μ)`, additionally `TauCeti.HasDunfordPettisProperty.of_dual`,
§5.6 (`L¹(μ)* ≅ L∞(μ)`) and §5.9 (`L∞(μ) ≅ C(K_μ)`).

### 5.8 The local-null Haar endpoint (B5.LocalHaarDual)

For a locally compact Hausdorff topological group `G` with its Borel measurable space and a
nonzero regular left Haar measure `μ`, and scalars `𝕜 = ℝ` or `ℂ`, construct the following
separate Banach space. A Borel function is locally essentially bounded if one finite bound works
almost everywhere on every finite-`μ`-measure Borel set. Identify two such functions when they
agree almost everywhere on every such set. Define the norm as the infimum of the common bounds,
and prove that the bound at this infimum holds locally, using the countable bounds `M + 1/n` on
each test set. Call the resulting normed quotient `LocalHaarLInfinity 𝕜 μ`. Its integral pairing
is bilinear, without conjugation, `⟨[g], f⟩ = ∫ f g dμ` for native `MeasureTheory.Lp 𝕜 1 μ`.
Construct the linear isometric equivalence
`LocalHaarLInfinity 𝕜 μ ≃ₗᵢ[𝕜] StrongDual 𝕜 (MeasureTheory.Lp 𝕜 1 μ)`
(Hewitt–Ross, *Abstract Harmonic Analysis I*, Theorem 12.18, which identifies `L¹(G)*` with
`L∞(G)` in the locally null convention; the locally Borel and locally null vocabulary is that of
Bekka–de la Harpe–Valette, *Kazhdan's Property (T)*, Appendix C.5).

Define addition, scalar multiplication, conjugation, pointwise multiplication and constants on the
quotient and prove their representative independence. Supply the norm bounds, unit norm `1`,
complex C*-identity and the real lattice/absolute-value comparisons by finite-test restrictions or
the component model below. The zero class is exactly local nullity. Give bounded restriction maps,
the bilinear pairing and evaluation equations, and its order/positivity compatibility for real
scalars. Prove compatibility with positive Haar rescaling and group/coset transport, keeping the
rescaled `L¹` norm and integral pairing factors explicit.

No σ-compactness, σ-finiteness, countability of the dual or second countability of `G` is a
standing hypothesis. This extends the σ-finite endpoint of §5.6 with a different carrier; it does
not identify arbitrary native global `Lp 𝕜 ∞ μ` with this dual.

Use the following explicit decomposition and gluing proof. Choose a symmetric compact identity
neighbourhood and let `H` be the union of its finite powers, an open σ-compact subgroup; `H` is
also closed. Index the disjoint open left cosets by a set `J`; no quotient-group structure or
normality is assumed. Choose representatives and transport the restricted measure on each coset
to `H` by left translation. Each restricted measure `μ_j` is σ-finite. Consume only the raw Haar
support/localization and Baire/null-envelope contract of AmenableGroups Layer 7, item 1. Its
finite-level-set compact approximation puts each integrable function, modulo a global null set,
on a countable union of compacts; each compact meets finitely many open cosets. Apply the same
argument to a finite-measure Borel test set. This gives the countable-coset concentration needed
below without declaring `G` σ-compact or taking an arbitrary uncountable union of null sets.

Construct restriction as a linear isometric equivalence from `Lp 𝕜 1 μ` to the native dependent
`lp (fun j ↦ Lp 𝕜 1 μ_j) 1`, with norm the sum of the component norms. In the inverse direction
the summable norm family has countable nonzero support; choose Borel representatives only for
those components, glue on their countable union of clopen cosets and put zero elsewhere. Prove
integrability, both inverse laws and the sum-of-norms formula; native `lp.hasSum_single` supplies
convergence of finite-coordinate sums.

Restriction on the local quotient gives an isometry to the native bounded family
`lp (fun j ↦ Lp 𝕜 ∞ μ_j) ∞`. Prove the local norm is the supremum of the component norms. For the
reverse inequality, first concentrate each finite-measure test set on countably many cosets modulo
a null set, then use only the countable union of its component exceptions. For surjectivity the
bounded component family requires a genuine globally Borel representative; an arbitrary
uncountable pasting of Borel functions is not that proof. On each coset choose a compact
exhaustion and form the finite regular measure
`ν_j = Σ_n 2^(−n−1)/(1 + μ_j(K_n)) · (μ_j.restrict K_n)`. Show it is equivalent to `μ_j`; prove its
finite regularity by finite-prefix compact approximation and a summable tail bound. For a common
bound `M`, approximate a representative of the component in `L¹(ν_j)` by continuous functions
bounded by `M` with summable errors (`MeasureTheory.exists_continuous_norm_le_forall_integral_norm_sub_le`,
whose radial retraction `TauCeti.radialRetraction` at most doubles each error). Tonelli for the
nonnegative error series on this finite measure proves convergence to the representative
`ν_j`-a.e., hence `μ_j`-a.e. Treat `M = 0` separately.

For each natural `n`, paste the `n`-th continuous approximants over all clopen cosets. The result
is a globally continuous function bounded by `M`: continuity is local on the disjoint open cover.
Form the global pointwise real limsup, and in the complex case the real and imaginary limsups,
then apply the radial clipping map, `z ↦ z` when `‖z‖ ≤ M` and `z ↦ (M/‖z‖) • z` otherwise. The
real and imaginary limsups are each bounded by `M`; radial clipping, rather than separately
clipping coordinates, restores the complex norm bound `M`. These are Borel functions because
limsup uses only countably many operations. On each coset the result agrees `μ_j`-a.e. with that
component; the countable-coset concentration on each finite-measure test set proves the required
local-a.e. comparison. No assertion that the union of all component null sets is globally null is
made. This proves surjectivity of the quotient-to-family map and completeness of the local
quotient. It also proves that the version defined using locally Borel functions gives the same
local quotient: on each σ-finite coset a locally Borel function is Borel.

Apply the σ-finite `L¹` duality of §5.6 separately on each coset. Reuse the native
`ContinuousLinearMap.lpPairing` for the scalar integral maps and `lp.dualPairing` for the
uniformly bounded dependent-family pairing, with exponents `∞` and `1`; their bounded-map
constructors alone do not assert endpoint surjectivity. Identify the dual of the dependent `ℓ¹`
sum with the uniformly bounded family of component duals: restriction to the component inclusions
has norm bounded by the original functional, and summing the component pairings gives the inverse
with bound `M` times the sum of norms. The finite-coordinate sums are dense, so these maps are
inverse; single-coordinate tests give the exact norm. Composing these explicit isometries proves
the displayed local-Haar dual theorem. Recover its inverse by the integral pairing, not merely by
an abstract isomorphism. Prove independence of representatives, the chosen open subgroup and its
coset representatives by equality of this pairing with every `L¹` test.

Construct the natural contractive surjection `Lp 𝕜 ∞ μ →L[𝕜] LocalHaarLInfinity 𝕜 μ`, with kernel
exactly the globally represented classes that vanish locally. Under the additional hypothesis
`SigmaFinite μ`, use a countable finite-measure exhaustion to prove local nullity equals global
nullity and upgrade this map to the isometric equivalence with native global `Lp 𝕜 ∞ μ`. Do not
assert injectivity or norm equality for the global-to-local map at arbitrary Haar generality.
State the same comparison for completed Haar conventions via Borel a.e. representatives, with its
null ideals explicit. Prove that left translations descend to linear isometries of the local
quotient and satisfy `⟨L_x g, f⟩ = ⟨g, L_(x⁻¹) f⟩`, where `L_x f(y) = f(x⁻¹ y)`. For bounded
continuous functions the supremum norm equals the local essential norm, since any strict
pointwise lower bound persists on an open set containing a compact subset of positive finite
Haar mass.

**Checks.**
- On an uncountable discrete group with counting measure the finite-measure sets are the finite
  sets, so a local bound is one uniform bound and the local quotient is `ℓ∞(G) = (ℓ¹(G))*`, with
  the global-to-local map an isometric equivalence; a definition that imposed σ-finiteness would
  exclude this group.
- On `ℝ_d × ℝ` (the discrete reals times the line, counting measure times Lebesgue measure) the
  indicator of `ℝ_d × {0}` has global essential norm `1`, is locally null (it meets every
  finite-measure set in a null set), and its support has infinite Haar measure since every open
  superset has measure `Σ_x 2ε_x = ∞`; so the global-to-local map is not injective and the local
  quotient is not the global `Lp 𝕜 ∞ μ`.
- For σ-finite `μ`, in particular for every σ-compact `G`, local nullity equals global nullity
  through a countable finite-measure exhaustion, and the global-to-local map is an isometric
  equivalence; a definition whose zero class were smaller than local nullity would not recover
  the σ-finite endpoint.

*Needs:* Mathlib `Measure.haar`, `Measure.Regular`, `lp` over a dependent family,
`lp.dualPairing`, `ContinuousLinearMap.lpPairing`, `lp.hasSum_single`; Tau Ceti
`MeasureTheory.exists_continuous_norm_le_forall_integral_norm_sub_le`, `TauCeti.radialRetraction`;
AmenableGroups Layer 7, item 1; §5.6.

### 5.9 Finitely additive charges and `L∞` as a space of continuous functions

Construct `(L∞(μ))*` as bounded-variation finitely additive charges on the measurable sets,
vanishing on μ-null sets. Use native `MeasureTheory.AddContent 𝕜 {s | MeasurableSet s}` for
finite additivity, with the subtype normalization `ν s = 0` for every nonmeasurable `s`, bounded
variation and annihilation of measurable μ-null sets; the pinned
`PositiveLinearMap.addContentLpTopEquiv` is the positive case. Prove extensionality on measurable
sets for this normalized subtype. Define total variation by suprema over finite measurable
partitions. Give its normed linear space, completeness, positivity, Jordan real and imaginary
parts, uniform simple-function integration and the isometric dual correspondence `ν(E) = φ(1_E)`
(Yosida–Hewitt, *Finitely additive measures*, Theorem 2.3, p. 53, over `ℝ`, with norm the total
variation; the complex case follows by real and imaginary parts).
Prove representative independence by null-set annihilation and bounded simple-function
approximation. Develop the Yosida–Hewitt decomposition into countably additive and purely
finitely additive parts and its band projection (Yosida–Hewitt, Theorems 1.23–1.24, pp. 52–53); for σ-finite `μ` identify the countably additive
part with `L¹(μ)` through the density construction of §5.4. Exhibit a purely finitely additive
component on counting measure using §1.3's functional on `ℓ∞/c₀`.

Reuse native scalar `Lp 𝕜 ∞ μ` star and the Hölder `HSMul` product at exponents `∞, ∞, ∞` for
pointwise multiplication, construct its unit, and prove its commutative C*-algebra laws over `ℂ`.
Reuse Mathlib's `gelfandStarTransform` to identify it with `C(K_μ, ℂ)`; construct the real-linear
isometries `selfAdjoint (Lp ℂ ∞ μ) ≃ Lp ℝ ∞ μ` and `selfAdjoint C(K_μ, ℂ) ≃ C(K_μ, ℝ)` for the real
version. Prove the function-space comparison preserves absolute values and finite square
functions. Treat the zero measure separately.

- Charges form a Banach space under the variation norm, isometric to `(L∞(μ))*`.
- The countably additive charges form a band, identified with `L¹(μ)` for σ-finite `μ`.

**Checks.**
- On a one-point space with `μ = δ_a`, `L∞ = 𝕜` and the charges are `c δ_a` with variation `|c|`,
  matching `𝕜* = 𝕜`.
- On `ℕ` with counting measure, §1.3's functional gives a charge with `ν(F) = 0` for every
  finite `F` and `ν(ℕ) = 1`; it is purely finitely additive, since a countably additive charge
  would give `ν(ℕ) = Σ ν({n}) = 0`.
- For σ-finite `μ` and `g ∈ L¹(μ)`, `ν(E) = ∫_E g dμ` is countably additive with variation
  `∫ |g| dμ`: for `g = 1_A − 1_B` with disjoint `A, B` of measure `1` the variation is `2`, while
  `sup_E |ν(E)|` is `1`, so the norm must be taken over partitions.

*Needs:* Mathlib `MeasureTheory.AddContent`, `MeasureTheory.Lp`, `gelfandStarTransform`; Tau Ceti
`PositiveLinearMap.addContentLpTopEquiv`; §§1.3, 5.4, 5.6.

### Examples

`ℓ²(ℕ)` and `ℓ²(ℝ)`; the Fourier unitaries; `t^α` and `t^β` in the little Hölder space; `δ₀ − δ₁`
and `λ − δ_{1/2}` in `M([0,1])`; `n 1_[0,1/n]` in `L¹[0,1]`; the group `ℝ_d × ℝ`; the
purely finitely additive charge on `ℕ`.

### Dependencies

Mathlib: `lp`, `HilbertBasis`, `fourierBasis`, `Lp`, vector measures, Riesz–Markov–Kakutani,
Radon–Nikodym, `OnePoint`, Haar measure, `AddContent`, Gelfand duality. Tau Ceti: the Layer 5
contract, in particular the scalar-measure layer. Within the roadmap: Layers 1–3. Other roadmaps:
AmenableGroups Layer 7, item 1 (§5.8); PDE Layer 1 §1.1 (§5.3); PseudodifferentialOperators Layer 5
(§5.3, comparison only).

## Layer 6: cotype and Grothendieck's theorem (B6)

The operator-ideal laws below use Banach source and target spaces; finite-family inequalities
retain normed-space scope. The summing-operator ideal, Pietsch domination and factorization and
Grothendieck's matrix inequality are the pinned carriers of the supplier contract.

### 6.1 Rademacher type and cotype and the cotype-2 summing bound (B6.Cotype2)

For a finite family `y` in a real Banach space `Y`, put `R₂(y) = (E_ε ‖Σ ε_i y_i‖²)^(1/2)` on the
uniform finite sign cube (`rademacherSecondMoment` is `R₂(y)²`) and
`G₂(y) = (E_g ‖Σ g_i y_i‖²)^(1/2)` for independent real standard Gaussians. Define Rademacher type
`p`, for `1 ≤ p ≤ 2`, with constant `C` by `R₂(y) ≤ C (Σ ‖y_i‖^p)^(1/p)` and Rademacher cotype `q`,
for `2 ≤ q < ∞`, with constant `C` by `(Σ ‖y_i‖^q)^(1/q) ≤ C R₂(y)` (`HasCotype`), both for every
finite family; a cotype-2 bound is cotype 2 with constant `C ≥ 1` (Pisier, *Grothendieck's
theorem, past and present*, Definition 9.6, for cotype 2, type 2 and the cotype-`q` variant).
The finite Gaussian model shared with Layer 7 is Mathlib's standard Gaussian
`ProbabilityTheory.stdGaussian` on `EuclideanSpace ℝ (Fin n)`, whose coordinates in an orthonormal
basis are independent standard real Gaussians; construct the Banach-valued integrability and the
sign/Gaussian law comparisons it needs.

- Reindexing, zero-padding and homogeneity of `R₂` and `G₂`.
- Closed-subspace transport of type and cotype with the same constant, and bounded-isomorphism
  transport with the constant multiplied by `‖U‖ ‖U⁻¹‖`; finite direct sums.
- Monotonicity: type `p` implies type `p′` for `p′ ≤ p`, cotype `q` implies cotype `q′` for
  `q′ ≥ q`; every space has type `1` with constant `1`.
- No nonzero space has cotype `q < 2` or type `p > 2` with any constant, by the `n`-fold family
  `(y, …, y)`, for which `R₂ = √n ‖y‖`: `n^(1/q) ≤ C √n` fails for `q < 2` and `√n ≤ C n^(1/p)`
  fails for `p > 2` as `n → ∞`.
- Hilbert spaces have type 2 and cotype 2 with constant `1` by the parallelogram law.
- Kahane's inequality: the first-moment and second-moment definitions agree up to a universal
  constant. The same definitions apply to the underlying real space of a complex Banach space.

**Checks.**
- In `c₀` the unit vectors `e₁, …, e_n` have `Σ ‖e_i‖^q = n` while every signed sum has supremum
  norm `1`, so `n^(1/q) ≤ C` fails for large `n` and `c₀` has no finite cotype; a definition with
  the two sides exchanged would give `c₀` cotype 2.
- In `ℓ¹` the unit vectors have `(Σ ‖e_i‖²)^(1/2) = √n` and every signed sum has norm `n`, so
  `ℓ¹` has cotype 2 with constant `1` on this family, while type `p > 1` fails since
  `n ≤ C n^(1/p)` fails for large `n`.
- In a Hilbert space `E_ε ‖Σ ε_i y_i‖² = Σ ‖y_i‖²` exactly, so type 2 and cotype 2 hold with
  constant `1` and `G₂ = R₂`.
- The two-point family `(y, y)` gives `R₂ = √2 ‖y‖` against `2^(1/q) ‖y‖`: it excludes cotype
  `q < 2` and type `p > 2` only with constant `1` (at `p = 4`, `C = 2^(1/4)` the type inequality
  for `(y, y)` holds with equality `√2 ‖y‖ = √2 ‖y‖`). The `n`-fold family excludes every
  constant: at `p = 4`, `C = 2^(1/4)` and `n = 16` it needs `4 ‖y‖ ≤ 2^(1/4) · 2 ‖y‖ ≈ 2.38 ‖y‖`.

Prove Gaussian weak-2 domination: if `Σ |f(x_i)|² ≤ Σ |f(y_j)|²` for every real continuous
functional `f`, then `G₂(x) ≤ G₂(y)`, through the finite Euclidean contraction relating the
coefficient maps, its orthogonal dilation and the rotational-invariance/Jensen argument. A
Rademacher cotype bound `C` gives the Gaussian cotype bound with the same `C` by applying it to
Gaussian-weighted families and integrating. Deduce for `U : ℓ₂ⁿ(ℝ) → Y` that
`π₂(U) ≤ C G₂(U e_i)`: every weak-2-unit family in `ℓ₂ⁿ` is dominated by its orthonormal basis.
Choose `t = t(C) > 0` with `C (E[g² 1_{|g|>t}])^(1/2) ≤ 1/2`. Split each Gaussian into its bounded
and tail parts. Sign contraction bounds the bounded sum by `t R₂(y)`; the 2-summing/Pietsch bound
and the tail covariance bound its `L²` norm by `C (E[g² 1_{|g|>t}])^(1/2) G₂(y)`. Absorption
proves `G₂(y) ≤ 2t(C) R₂(y)` and hence `π₂(U) ≤ 2C t(C) R₂(U e_i)` (`cotype2_summing_bound`, stated
with the pinned gauge `ContinuousLinearMap.summingENorm` at `p = 2` and a constant depending only
on `C`). For complex-linear `U`, pass to its realification and the real orthonormal basis
`(e_i, i e_i)`: compare the real and complex weak-2 norms and use the Gaussian triangle inequality
to obtain `π₂(U) ≤ 4C t(C) R₂(U e_i)`. All constants are independent of `n` and `Y` apart from
its declared `C`. Treat empty families and the zero space, and keep the separate Gaussian-cotype
hypothesis version of the first bound (Pisier, *Factorization of Linear Operators and Geometry of
Banach Spaces*, §3, Lemma 3.5, Proposition 3.7, Lemma 3.8 and Theorem 3.9, pp. 33–37). The route
uses neither a noncommutative Khintchine theorem nor a predual cotype assertion.

*Needs:* Mathlib Bochner integration, finite sign averages, `gaussianReal`,
`ProbabilityTheory.stdGaussian`, `EuclideanSpace`; Tau Ceti `ContinuousLinearMap.summingENorm`,
`TauCeti.weakLpNorm`, Pietsch domination.

### 6.2 Grothendieck's inequality on compact spaces and Grothendieck's theorem

The real and complex matrix inequalities with constants `κ_ℝ = 8` and `κ_ℂ = 16` are the pinned
`Matrix.abs_sum_sum_mul_inner_le_eight_mul` and `Matrix.norm_sum_sum_mul_inner_le_sixteen_mul`.
The compact-space form for finite families is pinned as well: for compact normal `K, L`, a
bilinear `B` on `C(K, 𝕜) × C(L, 𝕜)` with `0 ≤ C` and `‖B(f, g)‖ ≤ C ‖f‖ ‖g‖`, and finite
families with `Σ_i |f_i|² ≤ 1` on `K` and `Σ_i |g_i|² ≤ 1` on `L`, `‖Σ_i B(f_i, g_i)‖ ≤ 16 C`
(`LinearMap.norm_sum_apply_apply_le_sixteen_mul`; over `ℝ` the bound `8 C` is
`LinearMap.abs_sum_apply_apply_le_eight_mul`). From it derive the measure form by the
Hahn–Banach separation argument: for compact Hausdorff `K, L` and a bounded bilinear
`B : C(K) × C(L) → 𝕜`, there are probability measures `μ, ν` with
`|B(f, g)| ≤ κ_𝕜 ‖B‖ ‖f‖_{L²(μ)} ‖g‖_{L²(ν)}` (Albiac–Kalton, 8.1.3); the constants carry no
optimality claim. Derive `π₂(T) ≤ κ_𝕜 ‖T‖` for `T : C(K) → L¹(μ)` with finite
`μ`, using §5.9's `L∞ ≅ C(K_μ)` and its square-function comparison in the integral bilinear form
`(f, g) ↦ ∫ Tf · g`. Prove Grothendieck's theorem (`summingENorm_one_le_of_lp_one`): for every
measure `μ`, every bounded operator `T : L¹(μ) → H` into an inner product space over `𝕜` has
`π₁(T) ≤ 16 ‖T‖`, the complex constant serving both fields (Albiac–Kalton, Chapter 8); over `ℝ`
the same argument with the real matrix constant gives `8`. First prove the weighted finite-atom case
by applying the matrix inequality to normalized columns of `T` and vectors norming its images;
extend from simple functions by density, reusing §5.6's pairing.

**Checks.**
- `a = [1]` (a `1 × 1` matrix): the scalar bound is `1` and `|⟪u, v⟫| ≤ 1 ≤ 8`.
- `T : L¹[0,1] → ℝ`, `T f = ∫ f`, has `‖T‖ = π₁(T) = 1`, within `8 ‖T‖`. For the unit vectors
  `e₁, …, e_n` of `ℓ²` the weak `ℓ¹` norm is `√n` while `Σ ‖e_i‖ = n`, so the identity of `ℓ²` is
  not 1-summing: the hypothesis that the domain is an `L¹` space cannot be dropped.
- The inclusion `ι : C([0,1]) → L¹[0,1]` has `‖ι‖ = 1` and `π₂(ι) ≤ π₁(ι) ≤ 1`, by Pietsch
  domination with the image of Lebesgue measure among the Dirac functionals, within
  `κ_𝕜 ‖ι‖`.

*Needs:* Tau Ceti `Matrix.abs_sum_sum_mul_inner_le_eight_mul`,
`Matrix.norm_sum_sum_mul_inner_le_sixteen_mul`, `LinearMap.norm_sum_apply_apply_le_sixteen_mul`,
`LinearMap.abs_sum_apply_apply_le_eight_mul`, `ContinuousLinearMap.summingENorm`; §§5.6, 5.9.

### Examples

`c₀`, `ℓ¹` and Hilbert spaces for type and cotype; the family `(y, …, y)`; the integration
functional on `L¹[0,1]`; the inclusion `C([0,1]) → L¹[0,1]`.

### Dependencies

Mathlib: Bochner integration, `gaussianReal`. Tau Ceti: the Layer 6 contract. Within the roadmap:
Layer 5 (§§5.6, 5.9).

## Layer 7: local theory and Euclidean sections (B7)

The Banach–Mazur distance, finite representability, local reflexivity and finite
representability of `E**` in `E` are the pinned carriers of the supplier contract.

### 7.1 Local reflexivity and trace duality

Prove trace duality for every real or complex Banach space `E` that is reflexive or has the
metric approximation property: for every `u` in the completed `E* ⊗̂π E`, `‖u‖π` equals the
supremum of `|⟨u, S⟩|` over `S` in the unit ball of `L(E)`. The supremum never exceeds `‖u‖π`;
since the dual of `E* ⊗̂π E` is `L(E, E**)`, the reverse inequality is the statement that
`J_E ∘ S`, `S` in the unit ball of `L(E)`, norms `E* ⊗̂π E`. For reflexive `E` every
`T ∈ L(E, E**)` is `J_E ∘ (J_E⁻¹ ∘ T)`, so the supremum is attained in `L(E)`. For `E` with the
metric approximation property, §4.4's metric criterion, proved there from the pinned local
reflexivity `LinearIsometry.exists_continuousLinearMap_of_doubleDual`, gives the stronger equality with the supremum over finite-rank `S` of norm at most `1`, that is
`‖Θ_E u‖ = ‖u‖π` (Daws, Theorem 2.3.14, pp. 43–44). No form without these hypotheses is claimed:
the route applies local reflexivity to the finite-dimensional range of `T ∘ F` and so needs the
finite-rank contractions `F` of the metric approximation property, which reflexivity makes
unnecessary.

**Checks.**
- For reflexive `E` the density is equality, since `J_E` is onto.
- For `E = 𝕜`, `‖u‖π = |u|` and the supremum over `|S| ≤ 1` of `|u S|` is `|u|`.
- For a rank-one `u = f ⊗ x` both sides are `‖f‖ ‖x‖`: take `S = φ(·) z` with `φ(x) = ‖x‖`,
  `‖φ‖ = 1`, `‖z‖ ≤ 1` and `|f(z)| > ‖f‖ − ε`, in every Banach space.
- The supremum over all of the unit ball of `L(E)` and the supremum over its finite-rank part
  differ in general: Enflo's reflexive space of §4.4 fails the metric approximation property, so
  §4.4's criterion gives some `u` with `‖Θ_E u‖ < ‖u‖π`, while reflexivity gives the full
  supremum `‖u‖π`.

*Needs:* Tau Ceti `TauCeti.CompletedProjectiveTensor`,
`TauCeti.CompletedProjectiveTensor.norm_lt_iff_exists_hasSum_tmul`; §4.4 (`Θ_E` and the metric
criterion, which consumes `LinearIsometry.exists_continuousLinearMap_of_doubleDual`); Daws §2.3.

### 7.2 John's theorem and projection constants

Use native `ConvexBody` with explicit symmetry and nonempty-interior conditions. Develop symmetric
convex bodies in finite-dimensional Euclidean spaces, polar bodies, ellipsoids, volume and change
of variables. Prove John's theorem and its contact-point decomposition for symmetric bodies with
nonempty interior: in the position where the maximal-volume inscribed ellipsoid is the Euclidean
unit ball, construct contact points `u_i ∈ ∂K ∩ S^(n−1)` and positive weights `c_i` with
`Σ c_i (u_i ⊗ u_i) = I` and `Σ c_i = n`, for `n ≥ 1`, where `u_i ⊗ u_i` is the rank-one map
`x ↦ ⟨u_i, x⟩ u_i` (Ball, Lecture 3, Theorem 3.1). State and prove the same for the closed unit
ball `K` of a norm on a finite-dimensional inner product space `E` over `𝕜` of dimension `n ≥ 1`:
among the `𝕜`-ellipsoids `T(B)`, the images of the Euclidean unit ball `B` under `𝕜`-linear
automorphisms `T` with `T(B) ⊆ K`, one has maximal `|det T|`; in the position where `B` itself is
that ellipsoid, construct contact points `u_i`, unit vectors with `Re ⟨x, u_i⟩ ≤ ‖x‖_K` for all
`x`, and positive weights with `Σ c_i (u_i ⊗ u_i) = I` and `Σ c_i = n`. For `𝕜 = ℝ` this is the
symmetric-body statement (Ball, Lecture 3, Theorem 3.1); for `𝕜 = ℂ` the decomposition and the
distance bound below are stated for `ℂⁿ` with a norm in Arias–Figiel–Johnson–Schechtman, §1, p. 3,
where the ellipsoid of minimal volume containing the ball and the dual ellipsoid of maximal
volume are compared. Derive John's bound (`banachMazurDist_euclideanSpace_le_sqrt`): an
`n`-dimensional normed space over `𝕜` is at pinned Banach–Mazur distance at most `√n` from
`ℓ₂ⁿ` (Ball, Lecture 3, p. 13: `B ⊆ K ⊆ √n B` in John's position; Arias–Figiel–Johnson–Schechtman,
§1, p. 3, over `ℝ` and `ℂ`). Derive the Kadec–Snobar projection theorem (`kadec_snobar`): every
subspace `F` of dimension `n` of a normed `𝕜`-space is the range of a projection of norm at most
`√n` (Albiac–Kalton, 13.1.7). In John's position of `F` extend the contact functionals
`⟨u_i, ·⟩`, which are `𝕜`-linear, from `F` by Hahn–Banach to `φ̃_i` with the same norm `1` and put
`P x = Σ c_i φ̃_i(x) u_i`;
Cauchy–Schwarz with `Σ c_i = n` and `‖·‖_F ≤ |·|₂` gives `‖P‖ ≤ √n`, over either field. Prove the
Garling–Gordon projection theorem (`garling_gordon`), its dual: for every `ε > 0`, every closed
subspace `M` of a normed `𝕜`-space `X` whose quotient `X/M` has finite dimension `n` is the
kernel of a projection of norm at most `√n + ε` (Garling–Gordon 1971; Pietsch, *Eigenvalues and
s-Numbers*, 1987, 1.7.17); by monotonicity of `√n` the same holds for codimension at most `n`.
Run John's decomposition on the finite-dimensional dual `(X/M)*`, with contact points
`φ_i ∈ (X/M)*`; represent the contact functionals `⟨φ_i, ·⟩` on `(X/M)*` by vectors
`w_i ∈ X/M` of norm at most `1`, so that `f(w_i) = ⟨φ_i, f⟩` for every `f`, lift them to
`x_i ∈ X` of norm less than `1 + ε′`, and set `P y = Σ c_i φ_i(π y) x_i`. Then `π ∘ P = π`, so
`P² = P` and `ker P = ker π = M`; closedness of `M` makes `X/M` a normed space and `π`
continuous. The lift of the quotient norm is the sole source of `ε`.

- In John's position `B ⊆ K ⊆ √n B` for symmetric `K`.
- The contact-point decomposition is a resolution of the identity: `Σ c_i |⟨u_i, x⟩|² = ‖x‖²`.

**Checks.**
- `K = [−1,1]ⁿ`: the unit ball is its maximal-volume ellipsoid, the contact points are `±e_i`
  with `c = 1/2` each, `Σ c_i e_i ⊗ e_i = I` and `Σ c_i = n`; and `K ⊆ √n B`, the corners having
  norm `√n`.
- `n = 1`: `K = [−1,1]` is the only symmetric body with `B` maximal, with contact points `±1` and
  weights `1/2`, and the distance bound is `1 ≤ 1`.
- The cross-polytope (the `ℓ₁ⁿ` ball) has maximal ellipsoid the ball of radius `1/√n` and
  `d(ℓ₁ⁿ, ℓ₂ⁿ) = √n`, so John's bound is attained; a bound of order `n^(1/4)` is refuted there.
- Garling–Gordon at `M = X`: the quotient is zero, `n = 0`, and `P = 0` has `‖P‖ = 0 ≤ ε`; at
  `M = ker f` with `‖f‖ = 1`, choose `x₀` with `f(x₀) = 1` and `‖x₀‖ < 1 + ε`, then
  `P x = f(x) x₀` is a projection with kernel `M` and `‖P‖ = ‖x₀‖ < √1 + ε`.
- Closedness of `M` is needed: the kernel of a discontinuous linear functional has codimension
  `1` and is dense, so it is the kernel of no continuous projection; a statement without the
  closedness hypothesis would be false.
- Kadec–Snobar over `ℂ` at `n = 1`: for `F = ℂ x₀` with `‖x₀‖ = 1`, a Hahn–Banach functional `φ`
  with `φ(x₀) = 1` and `‖φ‖ = 1` gives `P x = φ(x) x₀` of norm `1 = √1`.
- The complex convention at `n = 1`, `K` the unit disc of `ℂ`, `u₁ = i`, `c₁ = 1`:
  `⟨i, x⟩ i = (−i x) i = x`, so `c₁ (u₁ ⊗ u₁) = I`, and `|⟨i, 1⟩|² = 1 = ‖1‖²`; the unconjugated
  square `⟨1, i⟩² = i² = −1` refutes `Σ c_i ⟨x, u_i⟩² = ‖x‖²` over `ℂ`, and the functional
  `⟨·, i⟩` is conjugate-linear, so it cannot serve as the contact functional.

*Needs:* Mathlib `ConvexBody`, `EuclideanSpace`, `LinearMap.det`, Lebesgue measure, Hahn–Banach
(`exists_extension_norm_eq`), normed quotients; Tau Ceti `TauCeti.banachMazurDist`; Ball
Lecture 3; Arias–Figiel–Johnson–Schechtman §1; Albiac–Kalton 13.1.5, 13.1.7; Garling–Gordon;
Pietsch, *Eigenvalues and s-Numbers*, 1.7.17.

### 7.3 Dvoretzky's theorem

Prove Dvoretzky's theorem (`dvoretzky_finite`): for every `k` and `ε > 0` there is `N` such that
every real normed space of dimension at least `N` admits an embedding `T : ℓ²_k → E` with
`(1 − ε)‖x‖ ≤ ‖Tx‖ ≤ (1 + ε)‖x‖`, so a `k`-dimensional subspace at Banach–Mazur distance at most
`(1 + ε)/(1 − ε)` from `ℓ²_k`; `k = 0` is trivial. Deduce that `ℓ²` is finitely representable in
every infinite-dimensional real Banach space (`dvoretzky`) (Albiac–Kalton, 12.3.13 and
13.3.2–13.3.7). Build the sphere concentration and net estimates on the pinned normalized
spherical measure `TauCeti.Probability.uniformSphereMeasure`, whose rotation invariance is the
pinned `LinearIsometryEquiv.map_uniformSphereMeasure`: a bound `2 exp(−c n t²/L²)` about a median for real `L`-Lipschitz functions on
`Sⁿ⁻¹` with its Euclidean distance, for `n ≥ 2`, `L > 0` and `t > 0`, with `c = 1/(1024π²)`.
Prove the mean-centred estimate `σ{|f − ∫ f dσ| > t} ≤ 4 exp(−n t²/(32π² L²))` and the bound
`|median(f) − ∫ f dσ| ≤ √(32π² log 8) L/√n`. Reuse §6.1's finite Gaussian model; its
radial/directional independence and the spherical law of its normalized direction are the pinned
`ProbabilityTheory.HasLaw.indepFun_sphereDirection_norm_stdGaussian`,
`TauCeti.Probability.stdGaussian_map_sphereDirection` and
`TauCeti.Probability.stdGaussian_map_sphereDirection_prod_norm`. Construct normalized Haar
rotations on the orthogonal group and prove that `U ↦ Ux` pushes Haar probability to the pinned
`uniformSphereMeasure` for every unit vector `x`.
Supply the Gaussian exponential-moment and interpolation estimates and the smooth approximation
of Lipschitz functions used in concentration. For a centred Lipschitz spherical function, use the
bound `|f| ≤ 2L` in the radial-extension argument and propagate the resulting constants. The
finite `η`-nets of `Sᵏ⁻¹` of size at most `(1 + 2/η)^k` are the pinned
`TauCeti.exists_finset_isCover_sphere`.

Make the dimension-growth step explicit. In John's position for an `n`-dimensional space,
`n ≥ 4`, construct a Dvoretzky–Rogers orthonormal basis with `‖e_j‖ ≥ 2^(−n/(n−j+1))`. Pass to the
span `Y` of the first `m = ⌊n/2⌋` vectors, whose norms are at least `1/4`. The Gaussian maximum
estimate `𝔼 max_{j≤m} |g_j| ≥ √(log m)/32` for independent standard Gaussians is the pinned
`TauCeti.Probability.sqrt_log_card_div_le_integral_sup'_abs`; it implies the weaker
`(1/100) √(log m)` used below.
Use the pinned Rademacher convexity inequality `max_j ‖v_j‖ ≤ 𝔼_ε ‖Σ ε_j v_j‖`
(`Finset.sup'_norm_le_integral_norm_sum_smul_rademacher`) to deduce
`θ_Y = ∫_{S^(m−1)} ‖x‖ dσ ≥ (1/400) √(log m/m)`. Prove the random-rotation/net lemma: for
`0 < η < 1/3` and `k ≤ 10⁻⁶ m θ_Y² η²/log(3/η)`, a `k`-dimensional subspace has norm between
`(1 − η) θ_Y ‖x‖₂` and `(1 + η) θ_Y ‖x‖₂`. This yields the logarithmic dimension bound and the
qualitative theorem. For a requested `ε > 0`, use `η = min(ε/4, 1/4)` and the threshold
`N = max(4, ⌈exp(10¹² k η⁻² log(3/η))⌉)`. Verify this constant from the preceding estimates and
`log ⌊n/2⌋ ≥ (log n)/3` for `n ≥ 4`, without an optimality claim.

**Checks.**
- `k = 1`: any unit vector `e` gives the exact isometric embedding `t ↦ t e`, so `N = 1` works.
- The Dvoretzky–Rogers bound at `j = 1` is `‖e₁‖ ≥ 2^(−n/n) = 1/2`, and at `j = m = ⌊n/2⌋` the
  exponent `n/(n − m + 1)` is less than `2`, so `‖e_j‖ ≥ 1/4` on `Y`.
- `log ⌊n/2⌋ ≥ (log n)/3` at `n = 4`: `log 2 ≈ 0.693 ≥ 0.462`; at `n = 3` it would fail
  (`log 1 = 0`), which is why `n ≥ 4` is imposed.

*Needs:* Mathlib `Measure.toSphere`, `gaussianReal`, `ProbabilityTheory.stdGaussian`, Haar measure
on the orthogonal group, `EuclideanSpace`; Tau Ceti `TauCeti.exists_finset_isCover_sphere`,
`TauCeti.Probability.sqrt_log_card_div_le_integral_sup'_abs`, `TauCeti.FinitelyRepresentable`,
`TauCeti.Probability.uniformSphereMeasure`, `LinearIsometryEquiv.map_uniformSphereMeasure`,
`TauCeti.Probability.stdGaussian_map_sphereDirection_prod_norm`,
`TauCeti.Probability.stdGaussian_map_sphereDirection`,
`ProbabilityTheory.HasLaw.indepFun_sphereDirection_norm_stdGaussian`,
`Finset.sup'_norm_le_integral_norm_sum_smul_rademacher`; §§6.1, 7.2.

### Examples

The cube, the cross-polytope and the interval for John's theorem; `c₀` for trace duality;
`k = 1` for Dvoretzky.

### Dependencies

Mathlib: convex bodies, Lebesgue and spherical measure, Gaussian measures. Tau Ceti: the Layer 7
contract. Within the roadmap: Layer 1, §4.4 (for §7.1), §6.1 (Gaussian model).

## Downstream consumers

- BanachAlgebras consumes Layers 1–2 and 4–5 (dual quotients, weak compactness, completed
  projective tensors and the scalar measure representation), §1.3's functional on `ℓ∞/c₀` for
  A3, and §4.5's scalar-plus-compact theorem for A8. The tensor carriers it uses are Tau Ceti's.
- VonNeumannAlgebras consumes Layers 1, 2 and 4.
- OperatorTheory/UnboundedOperators §4.1 and IndexTheory Layer 1 consume §5.2's Hilbert dimension
  and unitary classification.
- NoncommutativeIntegration §7.5 consumes §6.1's Rademacher type and cotype, and Layers 1–2's
  duality and Milman–Pettis, which are Tau Ceti's at the pin.
- SNumbers consumes §4.2's Schmidt series, §6.2's Grothendieck theorem, and §7.2's John theorem
  over `𝕜` with the Kadec–Snobar and Garling–Gordon projection theorems; the local reflexivity it
  also names is Tau Ceti's at the pin.
- CStarAlgebras and HilbertModules consume Layers 1–2.
- SelfAdjointSpectralTheory consumes §5.4's `M(K)` and its Riesz isometry with `C(K)*`; the
  Goldstine theorem and the scalar-measure layer it also uses are Tau Ceti's.
- CompactQuantumMetricSpaces consumes Layers 1 and 5; ToeplitzOperators consumes §5.9's scalar
  `L∞` algebra laws; Hyperfunctions consumes Layers 1 and 2.
- LocallyConvexDuality, NoncommutativeGeometry N1, SmoothBanachRepresentations and
  AutomorphicSpectralTheoryPartII consume Layer 4's Banach tensor products and nuclear operators,
  which are the pinned Tau Ceti carriers named in the supplier contract.

## References

- Megginson, *An Introduction to Banach Space Theory*: Theorems 2.6.26 (Goldstine), 2.7.11
  (Krein–Šmulian), 2.8.6 (Eberlein–Šmulian), 2.9.3–2.9.4 (James), 2.11.14 (Bishop–Phelps), 3.4.32
  (approximation property), 4.4.15 (basis criterion), 5.2.15 (Milman–Pettis).
- Albiac–Kalton, *Topics in Banach Space Theory*: 6.1.3–6.1.7 (Haar basis and its
  unconditionality), §5.2 (Dunford–Pettis criterion), §5.4 (Dunford–Pettis property), Chapter 8
  (Grothendieck 8.1.1, compact-space form 8.1.3, Pietsch 8.2.8, Grothendieck's theorem), 12.2.4
  (local reflexivity), 12.3.13 (Dvoretzky), 13.1.5 (John), 13.1.7 (Kadec–Snobar), 13.3.2–13.3.7
  (mean-norm estimate, Dvoretzky–Rogers, Gaussian maximum and logarithmic Dvoretzky bound).
- Runde, *Lectures on Amenability*, Appendix B.2: injective and projective tensor norms.
- Ryan, *Introduction to Tensor Products of Banach Spaces*, Chapters 2–4 and Proposition 4.6
  (<https://doi.org/10.1007/978-1-4471-3903-4>): nuclear operators, injective duality and the
  approximation/tensor comparisons.
- Ball, *An Elementary Introduction to Modern Convex Geometry*, Lecture 3, Theorem 3.1 and p. 13
  (<https://math.uchicago.edu/~shmuel/AAT-readings/Combinatorial%20Geometry%2C%20Concentration%2C%20Real%20Algebraic%20Geometry/ball.pdf>).
- D. J. H. Garling and Y. Gordon, *Relations between some constants associated with finite
  dimensional Banach spaces*, Israel J. Math. **9** (1971), 346–361.
- A. Pietsch, *Eigenvalues and s-Numbers*, Cambridge Studies in Advanced Mathematics 13, 1987,
  1.7.17 (the Garling–Gordon projection theorem).
- G. A. Muñoz, Y. Sarantopoulos and A. Tonge, *Complexifications of real Banach spaces,
  polynomials and multilinear maps*, Studia Math. **134** (1999), 1–33
  (<https://doi.org/10.4064/sm-134-1-1-33>), Propositions 3, 4 and 7, pp. 5–9.
- Garrido–Jaramillo, *Variations on the Banach–Stone theorem*, §2, Theorems 2 and 4
  (<https://matematicas.unex.es/~extracta/Vol-17-3/17J3Mari.pdf>).
- Daws, thesis, §2.3, Proposition 2.3.4 and the remark after it, Theorems 2.3.14 and 2.3.23
  (<https://matthewdaws.github.io/files/thesis.pdf>).
- Enflo, *A counterexample to the approximation problem in Banach spaces*, Acta Math. 130 (1973),
  309–317 (<https://doi.org/10.1007/BF02392270>), §§1–4.
- Argyros–Haydon, *A hereditarily indecomposable ℒ∞-space that solves the scalar-plus-compact
  problem* (<https://arxiv.org/abs/0903.3921>), §§2–9.
- Androulakis–Odell–Schlumprecht–Tomczak-Jaegermann, *On the structure of the spreading models of
  a Banach space* (<https://arxiv.org/abs/math/0305082>), Theorem 5.4.
- Dilworth–Odell–Schlumprecht–Zsák, *Partial unconditionality*
  (<https://arxiv.org/abs/math/0510609v1>; numbering of that version), Theorem 6 and Theorem 7
  (Matching Lemma), p. 7, Corollary 9, p. 10, and Lemmas 10–11, pp. 11–12.
- Emmanuele, *Answer to a question by M. Feder about K(X,Y)*, Rev. Mat. Univ. Complut. Madrid 6
  (1993), 263–266.
- Hewitt–Ross, *Abstract Harmonic Analysis I*, Theorem 12.18.
- Bekka–de la Harpe–Valette, *Kazhdan's Property (T)*, Appendix C.5.
- Pisier, *Grothendieck's Theorem, past and present*, Definition 9.6.
- R. C. James, *Weakly compact sets*, Trans. Amer. Math. Soc. **113** (1964), 129–140,
  Theorems 4–5 (<https://doi.org/10.1090/S0002-9947-1964-0165344-2>).
- K. Yosida and E. Hewitt, *Finitely additive measures*, Trans. Amer. Math. Soc. **72** (1952),
  46–66, Theorems 1.23, 1.24 and 2.3 (<https://doi.org/10.1090/S0002-9947-1952-0045194-X>).
- J. van Neerven, *Functional Analysis*, second edition, Cambridge Studies in Advanced
  Mathematics (<https://arxiv.org/abs/2112.11166v8>; numbering of that version): Theorems 1.34,
  2.48, 3.22, 3.25, 3.28, 4.2, 4.4, 9.2, Examples 2.49–2.50, Corollaries 3.23 and 4.13,
  Propositions 4.23 and 4.24, Remark 4.5.
- C. Heil, *A Basis Theory Primer*, original edition, 1997, Theorem 7.6
  (<https://heil.math.gatech.edu/papers/bases.pdf>).
- J. B. Conway, *A Course in Functional Analysis*, second edition, Chapter I, Proposition 4.14.
- A. Arias, T. Figiel, W. B. Johnson and G. Schechtman, *Banach spaces with the 2-summing
  property* (<https://arxiv.org/abs/math/9403206>), §1, p. 3: John's theorem and the `√n`
  distance bound over `ℝ` and `ℂ`.
- Pisier, *Factorization of Linear Operators and Geometry of Banach Spaces*, CBMS 60, §3,
  Lemma 3.5, Proposition 3.7, Lemma 3.8, Theorem 3.9.
