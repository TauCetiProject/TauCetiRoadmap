# Roadmap: p-adic functional analysis

**Summary.** This roadmap builds the functional analysis of nonarchimedean
Banach modules and the analysis of continuous and locally analytic functions on
`ℤ_p`: Banach–Tate operator theory, orthonormalisable modules, Mahler and Amice
coordinates, quantitative distribution estimates, and continuous characters of
`ℤ_pˣ` with their specialisation maps. It starts from the pinned Tate norms,
operator norms, model spaces, analytic stages and weight space, and ends with
Amice's theorem, the Amice bijection between locally analytic distributions on
`ℤ_p` and series on the open unit disc, the adic universal character of `ℤ_pˣ`,
separation of measures by weights and the analytic levels of weights. These
interfaces serve Fredholm theory, Iwasawa theory, adic geometry and families of
automorphic forms.

The pinned Tau Ceti proves most of Layers 0–3 and large parts of Layers 4–5:
Tate norms and gauges, ring-scalar operator norms and the mapping theorems,
orthonormal bases, Serre's theorem, countable-type splitting, matrices and
triangular perturbations, Mahler and van der Put coordinates, bounded Mahler
duality, `φ` and `ψ`, analytic stages with their direct limit, the quantitative
Amice inequalities, the weight space of `ℤ_pˣ` with its normed parametrisation,
and bounded integral-measure functions. Each section below cites those results
by their pinned names and states only what remains. The central remaining
targets are Amice's theorem for analytic stages; the algebraic distributions on
`ℤ_p` and their unbounded Amice transform; the completed group algebra
`ℤ_p[[ℤ_pˣ]] ≃ ℤ_p[Δ]⟦T⟧` with `T=[exp(q)]−1`, where `q=p` for odd `p` and
`q=4` for `p=2`, and the adic universal character; analytic levels of weights;
scalar analytic factors; and an annular Banach–Tate coefficient ring. The
coefficient ring may be a Banach–Tate ring rather than a field. Field,
discrete-valuation and characteristic-zero assumptions are imposed locally.

Every milestone and check below is required. This README is definitive;
[Suggested.lean](Suggested.lean) states, on the pinned carriers, the headline
theorems of §§4.4, 4.6, 4.7, 5.3, 5.4 and 5.6 that the pinned libraries do not
prove.

## Scope and ownership

| Area | In the pinned library | Targets here | Owned elsewhere |
| --- | --- | --- | --- |
| Banach–Tate analysis | Normed Tate data, gauges, norm comparisons, ring-scalar operator norms and mapping theorems (§§0.1–1.2) | Promotion of a gauge to a normed model (§0.4), discretely valued orthogonal bases (§1.3), the finite-module norm bridge (§1.4) | Huber rings, pairs of definition and topological open mapping: [AdicSpaces](../../Completed/AdicSpaces/README.md), Layer 0 |
| Model spaces | `C₀`, bounded-family extension, bases, (Pr), Serre's theorem, splitting, duality, matrices, finite coordinates, triangular perturbations (§§2.1–2.7) | Coordinate projections of ONable modules (§2.2), the completed-extension corollary (§2.4), the input-first adapter and closed finite submodules (§2.6) | Complete continuity, Fredholm determinants, Riesz theory and spectral transforms belong to CompactOperators |
| Restricted series | — | Their use as analytic charts and coefficient spaces (Layers 4–5) | Carriers, norms, evaluation, substitution, translation, Hasse derivatives and Strassmann: [RestrictedPowerSeries](../RestrictedPowerSeries/README.md), Layers 0–2 |
| Valuations | Logarithmic gauge of a pseudo-uniformiser (§0.4) | Comparison with the field normalisation of polygons (§0.4) | Additive normalisations, `ℂ_p` value group and polygons: [NewtonPolygons](../NewtonPolygons/README.md), Layer 1; local-field arithmetic: [LocalFieldsRamification](../../Completed/LocalFieldsRamification/README.md) |
| Measures | Mahler duality, the integral dual unit ball, `φ,ψ`, coefficient extension, character integration and the measure/completed-group-algebra equivalence (§§3.1–3.4, 5.3) | The Amice-coordinate comparison on `ℤ_p` (§5.3) | General clopen calculus, measure topologies, pseudo-measures and characteristic ideals belong to PadicMeasuresIwasawaAlgebras |
| Locally analytic functions | Analytic stages, transitions, the algebraic direct limit, polynomial density, Amice polynomials and map, character coefficients and the Amice inequalities (§§4.1–4.7) | Translations (§4.2), Amice's theorem and its consequences (§4.4), exp/log on Banach algebras (§4.5), the stage criterion for characters (§4.6), distributions and the unbounded Amice transform (§4.7) | Locally convex limit topologies, strong duals, manifolds and geometric Mellin theory belong to LocallyAnalyticDistributions |
| Iwasawa algebra and weights | The decomposition of `ℤ_pˣ`, the weight space, its normed parametrisation and measure functions (§§5.1–5.3) | Algebraic weights (§5.2), `Λ≃ℤ_p[Δ]⟦T⟧` and the adic universal character (§5.3), analytic levels (§5.4) | Completed group algebra and procyclic coordinate: [ProfiniteProPGroups](../../Completed/ProfiniteProPGroups/README.md), Layer 9 prerequisites |
| Automorphic applications | — | Scalar expansions of `κ(cz+d)` (§5.5) and the annular coefficient ring (§5.6) | Matrix actions, automorphy-factor cocycles, Hecke operators and classicality belong to quaternionic modular-form theory |

Neither a second Tate algebra nor a second completed group algebra is
constructed here. Compactness, Fredholm theory and automorphic operator actions
are consumers of this library, not prerequisites for it. General Hahn–Banach
theory, reflexivity, nuclear spaces, geometric weight spaces and analytic
Laurent/Robba-ring libraries are outside the scope. The coefficient ring of
§5.6 is a Banach–Tate example motivated by the boundary-of-weight-space
calculations in [LWX].

## Conventions

1. **Native structures.** Use `IsUltrametricDist`, `Module R E`,
   `IsBoundedSMul R E` and `CompleteSpace`. Add `NormOneClass`, `NormMulClass`
   and `NormSMulClass` only where needed. Commutative rings are the default
   for scalar actions on operator spaces and matrix multiplication.
   “Banach module” means these properties on the existing normed module;
   no new `BanachModule` carrier or fundamental typeclass is introduced.
   `IsBoundedSMul` supplies the contractive inequality
   `‖a • x‖ ≤ ‖a‖ ‖x‖`. A merely bounded action with an extra constant
   is a different hypothesis and does not give the same exact norm identities.

2. **Normed and topological Tate conditions differ.**
   `TauCeti.NormedRing.IsTate R` records a unit `ϖ` with `0<‖ϖ‖<1` and
   `‖ϖx‖=‖ϖ‖‖x‖`; `TauCeti.NormedRing.PseudoUniformizer R` carries the choice
   for the given norm. `TauCeti.Huber.IsTateRing R` instead asserts the
   topological Huber property and existence of a topologically nilpotent unit,
   with no chosen norm or exact scaling law. Use the topological class for
   topological statements and the normed class or an explicit multiplicative
   unit for quantitative ones. Neither class includes completeness. The normed
   condition excludes the zero ring; the topological gauge construction also
   treats zero and non-Hausdorff rings. No reverse instance asserts that an
   arbitrary existing norm is Tate.

3. **Use `C₀(I,E)`.** The index type is arbitrary and discrete; decay is
   along the cofinite filter. No replacement coefficient carrier or
   countability assumption is introduced. Empty indices and zero modules
   have norm zero. Prove boundedness before using a real supremum.

4. **Orthonormality controls scalar coefficients.** `TauCeti.IsOrthonormalFamily`
   requires `‖Σ_{i∈S} a_i e_i‖=max_{i∈S}‖a_i‖` for finite `S`, with empty
   maximum zero. Orthogonality uses `max‖a_i e_i‖` and is weaker over rings.
   A basis additionally has dense span. `TauCeti.IsONable` means linearly
   isometric to a model space; `TauCeti.IsPotentiallyONable` means
   continuously linearly equivalent; (Pr), `TauCeti.HasPr`, means a continuous
   linear retract of such a module. A chosen basis and a chosen model isometry
   are interconvertible; neither is chosen globally by typeclass inference.

5. **One operator norm.** The ring-scalar operator norm is the infimum of
   uniform Lipschitz bounds, `ContinuousLinearMap.ringOpNorm`, with scoped
   instances in `TauCeti.RingOpNorm`; over a field it is Mathlib's
   `ContinuousLinearMap.opNorm` by `ContinuousLinearMap.ringOpNorm_eq_opNorm`.
   Continuity implies a finite bound over Tate scalars, but not over every
   normed ring. The norm of an identity or Neumann inverse is one only for a
   nonzero module.

6. **Output index first.** `ContinuousLinearMap.matrixCoeff u i j` is
   `(u(single j 1))(i)`: rows index outputs and columns index inputs, as for
   Mathlib's `LinearMap.toMatrix`. The input-first notation
   `b j i=(u(single j 1))(i)` used by consumers is the transpose adapter
   of §2.6. Null columns in the first convention are null rows in the second.
   Uniform decay over output coordinates, used in compactness criteria, is a
   different condition; compactness itself belongs to CompactOperators.

7. **Analytic stages are coefficient models.**
   `TauCeti.AnalyticStage p h E` is `C₀(ZMod(p^h)×ℕ,E)`, with natural
   representatives as centres and `w=(x−a)/p^h`. Evaluation is
   norm-decreasing; injectivity needs `p`-torsion-freeness
   (`TauCeti.AnalyticStage.eval_injective`). Re-expansion exists for all
   bounded `ℤ_p`-modules, but need not be injective for torsion coefficients.

8. **Mahler and Amice coordinates differ.** Put `m_h(n)=⌊n/p^h⌋!`.
   The Amice coordinate `c_n` gives Mahler coefficient `a_n=m_h(n)c_n`.
   A dual moment `b_n` is therefore weighted by `‖m_h(n)‖`, not its inverse.
   Module-valued coordinate equivalences are not called scalar bases of
   `C(ℤ_p,E)` unless the coefficient module warrants that assertion.

9. **Name the norm and topology.** The normalisation is `‖p‖=p⁻¹` in
   `ℚ_p`; use normed `ℚ_p` scalar actions for the analytic estimates.
   The distribution carrier of §4.7 has stage seminorms but no new global
   topology. Integral measures retain their native carrier; field dual norms
   are taken after coefficient extension. The Iwasawa topology is profinite,
   not the coefficient sup-norm topology.

10. **All primes.** Put `q=p` for odd `p`, `q=4` for `p=2`, `Δ=(ℤ/qℤ)ˣ`,
    `γ=exp(q)` and `T=[γ]−1`; in Lean `q=p^TauCeti.padicUnitsDepth p` and
    `γ=TauCeti.padicUnitsGenerator p`. At `p=2` the sign factor does not split
    the integral group ring into two rings. A normed-ring weight has a
    topologically nilpotent coordinate; only a multiplicative norm makes this
    equivalent to `‖T_κ‖<1`.

## Exact supplier contracts

### Pinned Mathlib and Tau Ceti

Mathlib supplies ultrametric summability, `C₀`, continuous linear maps and field
operator norms, normed quotients, finite-dimensional topology, the Mahler
isometry `PadicInt.mahlerEquiv`, continuous additive characters
(`PadicInt.addChar_of_value_at_one`, `PadicInt.continuousAddCharEquiv`),
`AbstractMeasure` with `AbstractMeasure.amiceTransform`,
`AbstractMeasure.coeff_amiceTransform`, `AbstractMeasure.injective_amiceTransform`,
the integral equivalence `AbstractMeasure.amiceTransformEquiv` and its
convolution forms `AbstractMeasure.amiceTransformₐ` and
`AbstractMeasure.amiceTransformEquivₐ`, power series, binomial coefficients and
`p`-adic fields. The pinned Tau Ceti files below supply the results cited in
each section; a section's remaining targets consume exactly these declarations.

| Sections | Pinned Tau Ceti declarations | Files |
| --- | --- | --- |
| §0.1 | `HasSum.norm_lt_of_forall_norm_lt`, `HasSum.norm_eq_of_forall_norm_lt`, `TauCeti.summable_bilinear_of_nonarchimedean` | `Analysis/Normed/Group/NullFamily.lean`, `Analysis/Normed/Module/InfiniteSum.lean` |
| §0.2 | `TauCeti.unitBallIdeal`, `TauCeti.norm_inverse_one_sub`, `TauCeti.unitBallIdeal_le_jacobson_bot`, `TauCeti.NormedRing.norm_units_inv_of_norm_mul` | `Analysis/Normed/Ring/UnitBall.lean`, `Analysis/Normed/Monoid/MulUnit.lean` |
| §0.3 | `TauCeti.adaptedNorm`, `RingEquiv.exists_pos_norm_le_mul_rpow`, `TauCeti.zpowCeil`, `TauCeti.ResidueModule` | `Analysis/Normed/Module/AdaptedNorm.lean`, `Analysis/Normed/Ring/PowerComparison.lean`, `Analysis/Normed/Group/Rounding.lean`, `Analysis/Normed/Module/Residue.lean` |
| §0.4 | `TauCeti.NormedRing.IsTate`, `TauCeti.NormedRing.IsTate.isTateRing`, `TauCeti.NormedRing.PseudoUniformizer.logGauge`, `TauCeti.Huber.tateGauge`, `TauCeti.Huber.exists_tateSeminorm` | `Analysis/Normed/Ring/PseudoUniformizer.lean`, `Analysis/Normed/Ring/LogGauge.lean`, `RingTheory/Huber/TateGauge/Basic.lean`, `RingTheory/Huber/TateGauge/UnitBall.lean` |
| §§1.1–1.2 | `ContinuousLinearMap.ringOpNorm`, `ContinuousLinearMap.le_ringOpNorm`, `ContinuousLinearMap.exists_preimage_norm_le_of_isTate`, `TauCeti.NormedRing.IsTate.banach_steinhaus` | `Analysis/Normed/Operator/RingOpNorm.lean`, `Analysis/Normed/Operator/RingOpNorm/{Banach,OpenMapping,UniformBoundedness}.lean` |
| §§1.3–1.4 | `TauCeti.exists_basis_isTOrthogonalFamily`, `TauCeti.Huber.IsTateRing.isModuleTopology`, `LinearEquiv.exists_norm_bounds_of_module_finite` | `Analysis/Normed/Module/Bases/CountableType.lean`, `RingTheory/Huber/OpenMapping.lean`, `Analysis/Normed/Module/Finite/Basic.lean` |
| §§2.1–2.3 | `ZeroAtInftyContinuousMap.linearCombinationEquiv`, `TauCeti.exists_isOrthonormalBasis_iff`, `TauCeti.hasPr_iff_forall_exists_comp_eq_id`, `TauCeti.isONable_iff_free_residueModule` | `Topology/ContinuousMap/ZeroAtInfty/LinearCombination.lean`, `Analysis/Normed/Module/Bases/{Orthonormal,PotentiallyONable,ResidueBasis,DiscreteNorm}.lean` |
| §2.4 | `TauCeti.exists_isTOrthogonalBasis_of_dense_span`, `TauCeti.exists_continuousLinearEquiv_prod_of_countableType`, `TauCeti.Huber.BanachModule.CompletedTensor` | `Analysis/Normed/Module/Bases/{CountableType,ModelSpace,Splitting}.lean`, `RingTheory/Huber/BanachModule/CompletedTensor.lean` |
| §§2.5–2.7 | `ZeroAtInftyContinuousMap.toLpInftyDual`, `ContinuousLinearMap.matrixCoeff`, `Submodule.exists_finset_norm_le`, `Matrix.toZeroAtInftySMulLinearIsometryEquiv` | `Topology/ContinuousMap/ZeroAtInfty/{UltrametricDual,Matrix,FiniteCoordinates,Triangular}.lean` |
| §§3.2–3.3 | `PadicInt.mahlerLinearIsometryEquiv`, `PadicInt.vanDerPutEquiv`, `PadicInt.mahlerToVanDerPut` | `NumberTheory/Padics/MahlerBasis/`, `NumberTheory/Padics/VanDerPut/` |
| §3.4 | `AbstractMeasure.mahlerMomentsEquiv`, `AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff`, `AbstractMeasure.existsUnique_integral_iff_norm_le_one`, `AbstractMeasure.existsUnique_psiMeasure` | `NumberTheory/Padics/Measure/{MahlerDuality,IntegralUnitBall,PhiPsi,Multiples,Weight}.lean` |
| §§4.1–4.7 | `TauCeti.AnalyticStage`, `TauCeti.LocallyAnalytic`, `TauCeti.AnalyticStage.amiceMap`, `TauCeti.tendsto_amiceCharCoeff_iff`, `TauCeti.amiceDualNorm` | `NumberTheory/Padics/Distribution/{AnalyticStage,LocallyAnalytic,Polynomial,Torsion}.lean`, `NumberTheory/Padics/Distribution/Amice/{Basis,Character,Norm}.lean` |
| §§5.1–5.3 | `TauCeti.padicIntUnitsEquivZModUnitsProd`, `TauCeti.WeightSpace`, `TauCeti.weightSpaceEquiv`, `AbstractMeasure.extendCoefficients`, `AbstractMeasure.completedGroupAlgebraEquiv`, `TauCeti.measureFun` | `NumberTheory/Padics/UnitsDecomposition/Logarithm.lean`, `NumberTheory/Padics/WeightSpace.lean`, `NumberTheory/Padics/Measure/{ExtendCoefficients/Basic,CompletedGroupAlgebra,CharacterIntegral,Units/WeightIntegral}.lean` |

### Roadmaps

- [AdicSpaces](../../Completed/AdicSpaces/README.md), Layer 0: Huber and Tate
  rings and pairs of definition, as `TauCeti.Huber.IsHuberRing`,
  `TauCeti.Huber.IsTateRing` and `TauCeti.Huber.IsPseudoUniformizer`
  (`RingTheory/Huber/Basic.lean`), and the topological open mapping theorems
  of `RingTheory/Huber/OpenMapping.lean`.
- [RestrictedPowerSeries](../RestrictedPowerSeries/README.md), Layers 0–2 and
  §7.1 (series on an open disc): restricted carriers, Gauss norms, evaluation,
  substitution, translation, Hasse derivatives, the field-separation hypothesis
  and coefficient estimates, for Layers 4–5.
- [NewtonPolygons](../NewtonPolygons/README.md), Layer 1: the additive
  normalisation compared with the logarithmic gauge in §0.4.
- [ProfiniteProPGroups](../../Completed/ProfiniteProPGroups/README.md), Layer 9
  prerequisites: the completed group algebra and the procyclic coordinate
  `TauCeti.completedGroupAlgebra.powerSeriesCoordinate`, with the finite-factor
  coordinate `TauCeti.completedGroupAlgebra.prodPowerSeriesCoordinate`.
- [LocalFieldsRamification](../../Completed/LocalFieldsRamification/README.md):
  the local-field exponential and logarithm used in §§4.5 and 5.1.

## How to read the build

Layers 0–2 (ultrametric Banach modules, Tate gauges, operators, model spaces
and bases) precede the bounded duality of Layer 3 (continuous functions, Mahler
coordinates and bounded measures); Layer 4 (analytic stages, Amice's theorem
and locally analytic distributions) consumes RestrictedPowerSeries and Layer 3;
Layer 5 (weights, universal characters, analytic levels and the annular
coefficient ring) consumes both. Within the remaining targets, Amice's theorem
(§4.4) precedes the Mahler criterion, §4.6, §4.7 and §5.4; the completed group
algebra of `ℤ_pˣ` precedes the adic universal character and the
Amice-coordinate comparison of §5.3; §5.4 precedes §5.5. Only the last
corollary of §2.4 uses completed tensors, and it takes them from the pinned
`TauCeti.Huber.BanachModule.CompletedTensor`. The Amice-coordinate comparison
of §5.3 uses §3.4, the pinned completed-group-algebra equivalence and
ProfiniteProPGroups alone.

Each section first lists, under "In the pinned library", the pinned
declarations that already prove its statements; these are inputs, not targets.
What follows under "Target" or "Targets" is the remaining work, with `*Needs:*`
naming the pinned declarations or earlier targets it rests on. Each layer ends
with its Examples, the Checks of the layer, and its Dependencies. Names
without a namespace in the target lists (`amiceMap_bijective_and_norm_eq`,
`isOrthonormalBasis_amiceTerm`, `exists_eval_eq_addChar_iff`, `distributions`,
`binomialLA`, `amiceTransform_distribution_bijective`,
`exists_character_of_hasEval`, `eq_aeval_binomialSeries`,
`amiceTransform_completedGroupAlgebra_compat`, `measurePairing_injective`,
`exists_eval_eq_weight_iff`, `mem_span_iff_forall_eval_annulus`) are the
declarations of
[Suggested.lean](Suggested.lean), stated against the pinned carriers. A Check
marked as an example in a pinned file is already formalised; the others are
required.

A target is complete when its definitions use native structures, its
statements and comparison maps are proved, its stated checks are formalised,
and its supplier and consumer hypotheses agree. Test zero objects and empty
indices, non-Noetherian versus Noetherian coefficients, all primes, and the
strict radius boundaries. Admitted signatures are not completed results.
Integration must not introduce `sorry`-based instances or silently change the
topology of an imported object.

## Layer 0: Ultrametric Banach modules and Tate gauges

### 0.1 Sums and estimates

In the pinned library: summability is cofinite decay in a complete ultrametric
group (Mathlib `NonarchimedeanAddGroup.summable_iff_tendsto_cofinite_zero`);
null families are bounded and attain their supremum
(`Filter.Tendsto.exists_forall_norm_le`, `Filter.Tendsto.exists_norm_eq_ciSup`);
the strict bound and the dominant-term equality, including the empty family,
are `HasSum.norm_lt_of_forall_norm_lt` and `HasSum.norm_eq_of_forall_norm_lt`;
bilinear and module Cauchy products and double sums with joint decay are in
`Analysis/Normed/Module/InfiniteSum.lean`
(`TauCeti.summable_bilinear_of_nonarchimedean`,
`TauCeti.tendsto_bilinear_cofinite_nhds_zero`); summation is norm-decreasing in
the sup norm (`ZeroAtInftyContinuousMap.norm_tsum_smul_le`). A family of null
families `f : I → C₀(J,E)` whose sup norms tend to zero along the cofinite
filter is summable in `C₀(J,E)`: this is
`NonarchimedeanAddGroup.summable_of_tendsto_cofinite_zero` for the ultrametric
sup norm `ZeroAtInftyContinuousMap.instIsUltrametricDist`
(`Topology/MetricSpace/Ultra/ContinuousMaps.lean`). Nothing remains beyond the
checks.

### 0.2 Normed rings and multiplicative units

In the pinned library, with nothing remaining: the unit-ball subring
`Subring.unitClosedBall` and its open-ball ideal `TauCeti.unitBallIdeal`;
power-boundedness and topological nilpotence
(`TauCeti.Huber.IsPowerBounded.of_norm_le_one`,
`TauCeti.Huber.IsPseudoUniformizer.of_norm_lt_one`,
`TauCeti.isTopologicallyNilpotent_iff_norm_lt_one_of_isPowMul`), with the
boundedness comparison through a pseudo-uniformiser
(`TauCeti.Huber.IsPseudoUniformizer.isBounded_iff_forall_norm_le`); the Neumann
estimates `TauCeti.norm_inverse_one_sub` and
`TauCeti.norm_inverse_one_sub_sub_one`; unit lifting and the Jacobson radical
(`TauCeti.isUnit_unitClosedBall_of_norm_sub_one_lt`,
`TauCeti.unitBallIdeal_le_jacobson_bot`); the residue field over a field
(`TauCeti.isMaximal_unitBallIdeal`) and the reduction of `ℚ_p⟨X⟩`
(`TauCeti.MvPowerSeries.restrictedReductionQuotientEquiv`); the inverse norm
and exact scaling of multiplicative units
(`TauCeti.NormedRing.norm_units_inv_of_norm_mul`,
`TauCeti.NormedRing.norm_units_zpow_smul_of_norm_mul`).

### 0.3 Modules and norm comparisons

Use `[NormedAddCommGroup E] [Module R E] [IsBoundedSMul R E]
[IsUltrametricDist E] [CompleteSpace E]` for a Banach module with contractive
action, and state results with only the components they use. A new bundled
category of Banach modules is outside this roadmap.

In the pinned library: the adapted norm `‖x‖'=sup_{a≠0}‖a • x‖/‖a‖` with
`‖x‖≤‖x‖'≤C‖x‖` and contractive action (`TauCeti.adaptedNorm`,
`TauCeti.adaptedNorm_le`, `TauCeti.norm_le_adaptedNorm`,
`TauCeti.isBoundedSMul_adaptedNormedAddCommGroup`); quotients by closed
submodules with approximating lifts (`Submodule.Quotient.isBoundedSMul`,
`Submodule.ball_subset_image_mkQL_ball`); bounded-equivalent norms
(`AddGroupNorm.uniformity_eq_of_le`); the corrected power comparisons of [JN]
Lemmas 2.1.6–2.1.7 (`RingHom.norm_le_mul_rpow_of_forall_norm_lt`,
`RingHom.exists_pos_norm_le_mul_rpow_of_continuous`,
`RingEquiv.exists_pos_norm_le_mul_rpow`) and the linear comparison for a common
multiplicative unit (`RingEquiv.exists_pos_norm_le_mul_of_norm_pseudoUniformizer_eq`);
upward rounding to `c^ℤ∪{0}` with `‖m‖≤‖m‖'` and `c‖m‖'<‖m‖`
(`TauCeti.zpowCeil`, `TauCeti.le_zpowCeil`, `TauCeti.mul_zpowCeil_lt`,
`TauCeti.zpowCeilAddGroupSeminorm`) and exact `π`-scaling
(`TauCeti.NormedRing.PseudoUniformizer.zpowCeil_norm_zpow_smul`); the residue
module `M̃=M⁰/πM⁰` (`TauCeti.ResidueModule`), whose denominator is the open unit
ball for the discrete module norm (`TauCeti.mem_unitBallIdeal_smul_top_iff`).
Completeness of closed submodules is Mathlib's.

**Checks.**

- `|·|` and `|·|²` on `ℚ_p` define the same topology, but no `C` gives
  `|a|²≤C|a|` for all `a`: at `a=p^(−n)` this reads `p^(2n)≤Cp^n`. Equal
  topology gives the power comparison, here with exponent `2` and constant
  `1`, not a linear one.
- Over `ℂ_p`, rounding norms up to `p^ℤ` loses the scalar inequality: for
  `|a|=p^(−1/2)` and `x=1`, the rounded norm of `ax` is `1`, while `|a|` times
  the rounded norm of `x` is `p^(−1/2)`.

### 0.4 Tate norms and topological gauges

In the pinned library: the normed Tate data
`TauCeti.NormedRing.PseudoUniformizer` and class `TauCeti.NormedRing.IsTate`;
the bridge to the native predicates
`TauCeti.NormedRing.PseudoUniformizer.isPseudoUniformizer` and
`TauCeti.NormedRing.IsTate.isTateRing`, built from
`TauCeti.Huber.IsTateRing.of_isUnit_norm_lt_one`, needing neither completeness
nor multiplicativity of every scalar; Tate examples from normed algebras
(`TauCeti.NormedRing.IsTate.of_normedAlgebra`); the shell
(`TauCeti.NormedRing.PseudoUniformizer.existsUnique_norm_zpow_smul_mem_Ioc`);
the logarithmic gauge `v_ϖ(x)=log‖x‖/log‖ϖ‖`
(`TauCeti.NormedRing.PseudoUniformizer.logGauge`), superadditive on products
(`TauCeti.NormedRing.PseudoUniformizer.le_logGauge_mul`) and additive for a
multiplicative norm (`TauCeti.NormedRing.PseudoUniformizer.logGauge_mul`).

For a topological commutative ring `A` with a subring `A₀`, a topologically
nilpotent unit `ϖ∈A₀` with neighbourhood basis `ϖ^n A₀`, and `a>1`, the gauge
`tateGauge A₀ ϖ a x = inf { a^(−n) | n∈ℤ, ϖ^(−n)x∈A₀ }` is
`TauCeti.Huber.tateGauge`. Its seminorm, ultrametric inequality and recovery
of the topology are `TauCeti.Huber.exists_tateSeminorm`; its kernel is the
closure of zero (`TauCeti.Huber.tateGauge_eq_zero_iff`) and it separates points
exactly when `A` is Hausdorff
(`TauCeti.Huber.t2Space_iff_forall_tateGauge_eq_zero_iff`), with value one at
one in the nonzero Hausdorff case (`TauCeti.Huber.tateGauge_one`); changing
`A₀` gives bounded-equivalent gauges (`TauCeti.Huber.tateGauge_equiv`);
replacing `a` by `b>1` raises the gauge to `log b/log a`
(`TauCeti.Huber.tateGauge_rpow`). The unit-ball gauge of a Tate norm is the
upward rounding (`TauCeti.Huber.tateGauge_unitClosedBall_eq_zpowCeil`,
`TauCeti.Huber.tateGauge_unitClosedBall_eq_rpow`), and the gauge data of a Tate
ring are `TauCeti.Huber.TateNormDatum` with seminorm `TauCeti.Huber.tateNorm`.
The input comes from `TauCeti.Huber.IsTateRing.exists_hasBasis_nhds_zero`,
replacing the pseudo-uniformiser by a positive power to put it in `A₀`.

Targets:

- In the nonzero Hausdorff case promote the gauge to a normed Tate structure
  on a compatible model of `A`, transferring completeness exactly when the
  original topological ring is complete ([JN] Remark 2.1.3(1), p. 8, with `ϖ`
  in the ring of definition; [KL] Remark 2.4.4, p. 39, omits that membership,
  which the Check on `ϖ∈A₀` below shows is needed). Keep the
  normed-to-topological implication and the topological-to-chosen-gauge
  construction separate; do not install them as mutually inverse global
  instances. *Needs:*
  `TauCeti.Huber.exists_tateSeminorm`,
  `TauCeti.Huber.t2Space_iff_forall_tateGauge_eq_zero_iff`,
  `TauCeti.Huber.tateGauge_one`, `TauCeti.NormedRing.IsTate` and
  `TauCeti.NormedRing.IsTate.isTateRing`.
- Compare the field specialisation of the logarithmic gauge with the additive
  normalisation of NewtonPolygons Layer 1. *Needs:*
  `TauCeti.NormedRing.PseudoUniformizer.logGauge`,
  `TauCeti.NormedRing.PseudoUniformizer.logGauge_mul`, NewtonPolygons §1.1.

### Examples

**Checks.**

- `(ℤ_p,p,p)` gives the norm on `ℚ_p` (`Padic.tateGauge_subring_eq_norm`);
  `(ℤ_p,p²,p)` gives values `1,p⁻¹` at `p,p²` and is not multiplicative
  (`Padic.tateGauge_subring_sq_values_and_not_mul`).
- The zero ring has zero gauge: every `a^(−n)` qualifies, so the infimum is
  `0`, and the normalisation `g(1)=1` of the nonzero Hausdorff case fails.
- Pointwise decay does not give summability in `C₀(J,E)`: for infinite `I` the
  family `i ↦ single i b` with `b≠0` tends to zero at each coordinate, but its
  norms are all `‖b‖` (`ZeroAtInftyContinuousMap.not_tendsto_single_cofinite`),
  so it is not summable; the sup-norm hypothesis of §0.1 cannot be weakened to
  coordinatewise decay.
- Membership `ϖ∈A₀` is essential: in `ℚ_p²`, take
  `A₀={(x,y)∈ℤ_p² : x−y∈p²ℤ_p}` and `ϖ=(p,p²)`; the formula gives `g(1)=1`,
  `g(ϖ)=a⁻¹`, `g(1+ϖ)=a²`, violating ultrametricity.
- On `ℚ_p`, the norm `N(x)=max(|x|_p,|x|_p²)` is ultrametric, submultiplicative
  and norm-one, and induces the usual Tate topology; for every `0<|ϖ|_p=r<1`,
  however, `N(ϖ)N(ϖ⁻¹)=r⁻¹>1=N(1)`, so this norm has no multiplicative
  pseudo-uniformiser.

### Dependencies

Mathlib sums, quotients and topological groups; AdicSpaces Layer 0 for the
Huber comparison; NewtonPolygons §1.1 for the additive normalisation. Sources:
[JN] §2.1, [Sch] §§3–4, [KL] §2.4.

## Layer 1: Bounded operators and finite modules

### 1.1 Operator norms over rings

In the pinned library: `ContinuousLinearMap.ringOpNorm`, the bound at the
infimum (`ContinuousLinearMap.isLeast_ringOpNorm`), the bound from continuity
over Tate scalars (`TauCeti.NormedRing.IsTate.bound_of_continuous`,
`ContinuousLinearMap.le_ringOpNorm`), the norm and composition laws
(`ContinuousLinearMap.ringOpNorm_add_le_max`,
`ContinuousLinearMap.ringOpNorm_comp_le`), agreement with the field norm
(`ContinuousLinearMap.ringOpNorm_eq_opNorm`), completeness and ultrametricity of
the operator space (`TauCeti.RingOpNorm.completeSpace`,
`TauCeti.RingOpNorm.isUltrametricDist`), and Neumann inversion
(`ContinuousLinearMap.oneSub`, `ContinuousLinearMap.ringOpNorm_oneSub_symm`,
for a nonzero module). The operator norm is a supremum of ratios, not
generally the supremum of values on the unit ball. On the zero module every
operator is zero, so the Neumann inverse has norm zero; this degenerate case is
a Check below. Nothing remains.

### 1.2 Mapping theorems

In the pinned library, with nothing remaining: preimages with `‖m‖≤C‖n‖` for a
continuous surjection of Banach modules over a Tate ring
(`ContinuousLinearMap.exists_preimage_norm_le_of_isTate`,
`ContinuousLinearMap.isOpenMap_of_isTate`); bounded inverse
(`ContinuousLinearEquiv.ofBijectiveOfIsTate`); closed graph
(`LinearMap.continuous_of_isClosed_graph_of_isTate`); strictness of
closed-range maps (`ContinuousLinearMap.isStrictMap_of_isClosed_range_of_isTate`);
Banach–Steinhaus (`TauCeti.NormedRing.IsTate.banach_steinhaus`); limits of
sequences and of pointwise-bounded nets
(`ContinuousLinearMap.ofTendstoOfIsCountablyGenerated`,
`ContinuousLinearMap.ofTendstoOfPointwiseBounded`); finite-free operator bounds
(`ContinuousLinearMap.ringOpNorm_pi_eq_sup`).

### 1.3 Finite-dimensional spaces

Reuse Mathlib's continuity, completeness, equivalent-norm and closed-subspace
theorems over complete nontrivially normed fields. In the pinned library:
`t`-orthogonal bases for `0<t<1` (`TauCeti.exists_basis_isTOrthogonalFamily`).

Target: over a complete discretely valued field `K` with value group `r^ℤ`,
prove the orthogonal version (`t=1`, compare
`TauCeti.isTOrthogonalFamily_one_iff`) for a finite-dimensional normed space
`V`, using finite-dimensional distance attainment. The nonzero norms of `V` need
not lie in `r^ℤ`, but they lie in at most `dim V` cosets `c_i r^ℤ`: vectors
whose norms lie in distinct cosets have `‖Σ a_i v_i‖=max‖a_i v_i‖`, since the
nonzero terms have distinct norms, so they are linearly independent. A finite
union of such cosets, with `0`, meets every interval `[s,2s]`, `s>0`, in
finitely many points, so a positive distance from a vector to a closed subspace
is attained, and a zero distance is attained because the subspace is closed.
No spherical completeness is assumed for the general field case. *Needs:*
`TauCeti.exists_basis_isTOrthogonalFamily`,
`TauCeti.isTOrthogonalFamily_one_iff`, Mathlib
`Submodule.closed_of_finiteDimensional`.

### 1.4 Finite Banach modules

In the pinned library: the canonical module topology on finite modules over a
Tate ring (`TauCeti.Huber.IsTateRing.isModuleTopology`), Hausdorff for a
complete Hausdorff Noetherian Tate ring
(`TauCeti.Huber.IsTateRing.t2Space_moduleTopology`); strictness of maps
(`LinearMap.isStrictMap_of_module_finite`); closedness of submodules
(`TauCeti.Huber.isClosed_of_isNoetherian`); bounded equivalence of compatible
complete norms (`LinearMap.exists_bound_of_module_finite`,
`LinearEquiv.exists_norm_bounds_of_module_finite`).

Target: for a commutative Noetherian Banach–Tate ring, state the normed bridge:
a finite module with any Banach module norm carries the canonical topology, so
the topological results above apply to it ([JN] §2.1, p. 8, which carries
[BGR] §3.7.3 over to Noetherian Banach–Tate rings by the open mapping
theorem). Do not require a Noetherian ring of definition when only the Tate
ring is Noetherian. General Banach modules are
not assumed finite. *Needs:* `ContinuousLinearMap.isOpenMap_of_isTate` (§1.2)
for a presentation `R^n→M`, `TauCeti.Huber.IsTateRing.isModuleTopology`,
`LinearEquiv.exists_norm_bounds_of_module_finite`, Mathlib `IsModuleTopology`.

### Examples

**Checks.**

- `(x,y)↦x+py` on `ℚ_p²` has lifting constant one.
- Multiplication by `a` on a norm-one ring has norm `‖a‖`
  (`ContinuousLinearMap.ringOpNorm_toSpanSingleton`).
- The identity from `ℤ_p` with norm `|x|²` to its usual norm is continuous but
  unbounded as a `ℤ_p`-linear map.
- Include the zero-module Neumann case: the inverse of `1−t` on the zero
  module has norm zero, not one.

### Dependencies

Layer 0, topological open mapping and finite-dimensional topology. Sources:
[JN] §2.1, [Buz] §2 and [BGR] §3.7.

## Layer 2: Model spaces and bases

### 2.1 The native model space

In the pinned library, with nothing remaining: the bounded scalar instance
`ZeroAtInftyContinuousMap.instIsBoundedSMul`; finite-support density
(`ZeroAtInftyContinuousMap.dense_setOf_finite_support`); coordinate vectors
`ZeroAtInftyContinuousMap.single` and expansion
(`ZeroAtInftyContinuousMap.hasSum_smul_single_one`); the attained sup norm
(`ZeroAtInftyContinuousMap.exists_norm_coe_eq_norm`); bounded families as
operators, `ZeroAtInftyContinuousMap.linearCombination` and the isometry
`ZeroAtInftyContinuousMap.linearCombinationEquiv` over Tate scalars;
reindexing, disjoint sums and the isometry `C₀(I×J,E)≃C₀(I,C₀(J,E))`
(`ZeroAtInftyContinuousMap.congrLeft`, `ZeroAtInftyContinuousMap.sumEquiv`,
`ZeroAtInftyContinuousMap.curryEquiv`).

### 2.2 Bases and property (Pr)

In the pinned library: `t`-orthogonal families and bases
(`TauCeti.IsTOrthogonalFamily`, `TauCeti.IsTOrthogonalBasis`) with unique
unconditional expansion (`TauCeti.IsTOrthogonalBasis.existsUnique_hasSum`) and
their comparison with Mathlib's unconditional Schauder bases
(`TauCeti.IsTOrthogonalBasis.toUnconditionalSchauderBasis`); orthonormal
families and bases (`TauCeti.IsOrthonormalFamily`, `TauCeti.IsOrthonormalBasis`)
with independence (`TauCeti.IsOrthonormalFamily.linearIndependent`) and
coordinates (`TauCeti.IsOrthonormalBasis.repr`); the equivalence

```text
(∃ e : I → M, IsOrthonormalBasis R e) ↔ Nonempty (M ≃ₗᵢ[R] C₀(I,R))
```

as `TauCeti.exists_isOrthonormalBasis_iff`, with
`TauCeti.isONable_iff_exists_isOrthonormalBasis`; `TauCeti.IsPotentiallyONable`
and `TauCeti.HasPr` with their implications
(`TauCeti.IsONable.isPotentiallyONable`, `TauCeti.IsPotentiallyONable.hasPr`),
product and retract stability (`TauCeti.HasPr.prod`, `TauCeti.HasPr.of_retract`),
the lifting characterisation (`TauCeti.hasPr_iff_forall_exists_comp_eq_id`) and
projectivity (`TauCeti.HasPr.projective`); orthogonal independence with nonzero
vectors (`TauCeti.IsTOrthogonalFamily.linearIndependent`).

Target: for an orthonormal basis of a module `M`, every subfamily of
coordinates gives a continuous projection and a decomposition of `M`; the
pinned `ZeroAtInftyContinuousMap.indicatorCLM` is the model-space case.
*Needs:* `TauCeti.exists_isOrthonormalBasis_iff`,
`TauCeti.IsOrthonormalBasis.repr`, `ZeroAtInftyContinuousMap.indicatorCLM`.

### 2.3 Serre's theorem

In the pinned library, with nothing remaining: lifts of a residue basis are an
orthonormal basis and conversely (`TauCeti.ResidueModule.isOrthonormalBasis_iff`);
`TauCeti.IsONable` is equivalent to freeness of the residue module
(`TauCeti.isONable_iff_free_residueModule`); over a complete discretely normed
ultrametric norm-one commutative ring whose residue ring is a field, that is,
one with a multiplicative pseudo-uniformiser `ϖ` whose norms `‖ϖ‖^ℤ` contain
every nonzero scalar norm (for example a complete discretely valued field),
every Banach module is potentially orthonormalisable, and isometrically so
exactly when its nonzero norms lie in `‖ϖ‖^ℤ`
(`TauCeti.isPotentiallyONable_of_discrete_norm`,
`TauCeti.isONable_iff_discrete_norm`, [Serre] Proposition 1, p. 70);
cardinality invariance
(`TauCeti.IsOrthonormalBasis.lift_mk_eq_of_continuousLinearEquiv`).

### 2.4 Countable type and strict splitting

In the pinned library: `t`-orthogonal bases of countable-type spaces over an
arbitrary complete nontrivially normed ultrametric field
(`TauCeti.exists_isTOrthogonalBasis_of_dense_span`,
`TauCeti.exists_isTOrthogonalBasis_nat_of_dense_span`), the equivalence with
`C₀(ℕ,K)`
(`TauCeti.nonempty_continuousLinearEquiv_zeroAtInfty_nat_of_dense_span`),
countable type of closed subspaces (`Submodule.exists_dense_span_of_dense_span`)
and their complements (`Submodule.closedComplemented_of_isClosed_of_dense_span`),
and the splitting `TauCeti.exists_continuousLinearEquiv_prod_of_countableType`:
for an embedding `i:M→E`, a continuous surjection `q:E→N` with
`range i=ker q`, and countable-type Banach `E`, an isomorphism `d:E≃L[K]M×N`
with `d(i m)=(m,0)` and `(d x).2=q x`. No discrete valuation is required.

Target: for a complete isometric extension `K'/K` and a strict short exact
sequence `0→M→E→N→0` of Banach `K`-spaces whose middle term `E` has countable
type, extend the splitting above and its inverse along `K'⊗̂_K(−)` to show that
`0→K'⊗̂_K M→K'⊗̂_K E→K'⊗̂_K N→0` is strict exact, on the pinned completed
tensor `TauCeti.Huber.BanachModule.CompletedTensor K K' V`, with
`TauCeti.Huber.BanachModule.CompletedTensor.map` for the induced maps and
`TauCeti.Huber.BanachModule.CompletedTensor.lift` for its universal property.
Countable type of `E` is the hypothesis of the splitting; `M` and `N` inherit
it. The route is the proof of [Conrad] Lemma 1.1.5, p. 7, where countable type
supplies the continuous section ([BGR] 2.7.1/4). *Needs:*
`TauCeti.exists_continuousLinearEquiv_prod_of_countableType`,
`TauCeti.Huber.BanachModule.CompletedTensor`. The splitting theorem itself is
independent of tensors.

### 2.5 Duality

In the pinned library, with nothing remaining: the continuous dual of
`C₀(I,R)` over a commutative Banach–Tate ring is `lp … ∞`, isometrically
(`ZeroAtInftyContinuousMap.linearCombinationEquiv` at `M=R`), with pairing
`Σ_i b_i a_i` (`ZeroAtInftyContinuousMap.linearCombination_eq_tsum_mul`), the
isometric bidual embedding (`ZeroAtInftyContinuousMap.toLpInftyDual`) and
transposed operators on `ℓ∞` (`ContinuousLinearMap.transposeLpInfty`,
`ContinuousLinearMap.transposeLpInfty_comp`).

### 2.6 Matrices and finite coordinates

In the pinned library: the output-first matrix
`ContinuousLinearMap.matrixCoeff` with null columns
(`ContinuousLinearMap.tendsto_matrixCoeff_cofinite`) and bounded entries
(`ContinuousLinearMap.norm_matrixCoeff_le`), the action and product formulas
(`ContinuousLinearMap.hasSum_matrixCoeff_mul`,
`ContinuousLinearMap.matrixCoeff_comp`), the operator of a matrix
(`Matrix.toZeroAtInftyCLM`), the sup-entry norm
(`ContinuousLinearMap.ringOpNorm_eq_iSup_norm_matrixCoeff`), agreement with the
finite convention (`ContinuousLinearMap.matrixCoeff_eq_toMatrix'`), the row
bound of CompactOperators (`ContinuousLinearMap.rowNorm`), diagonal operators
(`ZeroAtInftyContinuousMap.diagonalCLM`), coefficient base change
(`ContinuousLinearMap.mapCoeffs`), truncations
(`ZeroAtInftyContinuousMap.indicatorCLM`,
`ZeroAtInftyContinuousMap.tendsto_indicatorCLM`), and finite-coordinate
detection for a complete finite submodule `P⊂C₀(I,R)`
(`Submodule.exists_finset_norm_indicatorCLM_sub_le`,
`Submodule.exists_finset_norm_eq`) with the contract
`Submodule.exists_finset_norm_le`:

```text
∃ finite S, ∃ C>0, ∀ f∈P, ‖f‖ ≤ C max_{i∈S} ‖f(i)‖.
```

Targets:

- The input-first adapter: the array `B(u)` with
  `B(u) j i = ContinuousLinearMap.matrixCoeff u i j`, the transpose of the
  pinned matrix. Prove `(u x)_i=Σ_j x_j*B(u) j i` and `B(u∘v)=B(v)B(u)` over
  the commutative coefficient rings used here, from
  `ContinuousLinearMap.hasSum_matrixCoeff_mul` and
  `ContinuousLinearMap.hasSum_matrixCoeff_comp`. Reindexing the coefficients is
  not a claim that the transposed array defines another operator on `c₀`. Test
  it on a rectangular matrix and a non-diagonal composition, so that reversal
  of the product order is visible. *Needs:* `ContinuousLinearMap.matrixCoeff`,
  `ContinuousLinearMap.hasSum_matrixCoeff_mul`,
  `ContinuousLinearMap.hasSum_matrixCoeff_comp`.
- For a bijection `σ:J≃I` of discrete index types, the pinned reindexing
  isometry `ZeroAtInftyContinuousMap.congrLeft` along `σ`, `f↦f∘σ⁻¹`, has
  output-first matrix `matrixCoeff i j = 1` if `i=σ j` and `0` otherwise, and
  its inverse has the transposed matrix; conversely an operator whose matrix
  has exactly one entry `1` in each row and column and zeros elsewhere is
  such a reindexing. *Needs:* `ZeroAtInftyContinuousMap.congrLeft`,
  `ContinuousLinearMap.matrixCoeff`,
  `ContinuousLinearMap.hasSum_matrixCoeff_mul`,
  `ZeroAtInftyContinuousMap.dense_setOf_finite_support`.
- Over a field, a diagonal operator with nonzero entries is injective with
  dense range, and invertible exactly when the entries are bounded away from
  zero, that is, when the diagonal of inverses is bounded. *Needs:*
  `ZeroAtInftyContinuousMap.diagonalCLM` with
  `ZeroAtInftyContinuousMap.ringOpNorm_diagonalCLM`,
  `ZeroAtInftyContinuousMap.dense_setOf_finite_support`.
- Over a Noetherian Banach–Tate ring, every finite submodule of `C₀(I,R)` is
  closed, so `Submodule.exists_finset_norm_le` applies to it. No freeness of
  `P` is assumed. Follow [Buz] Lemma 2.3(a)–(b), p. 10: a finite coordinate
  set `S` on which the projection is injective on `P` exists because the ring is
  Noetherian; the image of `P` in `C₀(S,R)=R^S` is closed; the inverse is
  continuous because `P` is finite; so `P` is complete, hence closed.
  *Needs:* `TauCeti.Huber.isClosed_of_isNoetherian` for the image in `R^S`,
  `TauCeti.Huber.IsTateRing.isModuleTopology` with Mathlib
  `IsModuleTopology.continuous_of_linearMap` for the inverse,
  `ZeroAtInftyContinuousMap.indicatorCLM` for the projection, and then
  `Submodule.exists_finset_norm_le`.

### 2.7 Triangular perturbations

In the pinned library: a matrix on a linearly ordered discrete index with
entries of norm at most one, diagonal acting isometrically and entries below
the diagonal of norm less than one defines an isometry
(`Matrix.isometry_toZeroAtInftySMulCLM`); on `ℕ`, with unit diagonal, entries
below it bounded by `c<1` and null columns, it is surjective
(`Matrix.surjective_toZeroAtInftySMulCLM`) and an isometric automorphism
(`Matrix.toZeroAtInftySMulLinearIsometryEquiv`,
`Matrix.toZeroAtInftyLinearIsometryEquiv`). The finite-column case for Amice
is a special case. Nothing remains beyond the checks.

### Examples

**Checks.**

- `ℚ_p` with the norm `‖x‖=p^(1/2)|x|_p` is potentially orthonormalisable,
  the identity to `ℚ_p` being a continuous linear equivalence, but not
  orthonormalisable: its nonzero norms lie in `p^(1/2)p^ℤ`, which misses
  `‖p‖^ℤ=p^ℤ` (`TauCeti.isONable_iff_discrete_norm`); in particular no vector
  has the norm `1` of a basis vector.
- Over `R=ℚ_p⟨X⟩`, take `M=R/(X)≅ℚ_p` with the quotient norm
  `‖f mod X‖=|f(0)|`. The singleton `{1}` is orthogonal, as every singleton
  is, but `X·1=0` while `‖X‖‖1‖=1`: it is neither orthonormal nor linearly
  independent, and `M` is torsion, not free.
- The backward shift `(c_n)↦(c_(n+1))` on `C₀(ℕ,ℚ_p)` has output-first matrix
  with entries `1` at `(i,i+1)` and `0` elsewhere, null columns, and norm `1`,
  the supremum of its entries
  (`ContinuousLinearMap.ringOpNorm_eq_iSup_norm_matrixCoeff`); the forward
  shift has its entries at `(i+1,i)` and is an isometry.
- A matrix with entry `p` everywhere below the diagonal has non-null columns
  and is excluded, and a bidiagonal `1+pS` is an isometric automorphism (both
  are examples in `Topology/ContinuousMap/ZeroAtInfty/Triangular.lean`).
- The constant-term sequence `0→T·K⟨T⟩→K⟨T⟩→K→0` splits by
  `f↦(f−f(0),f(0))`, an isometry for the max norm on the product, since the
  Gauss norm of `f` is `max(‖f−f(0)‖,|f(0)|)`. The degenerate sequences
  `0→0→E→E→0` and `0→E→E→0→0` split by `E≃0×E` and `E≃E×0`, and stay split
  after `K'⊗̂_K(−)`.
- For the transpose adapter, take `v:ℚ_p²→ℚ_p³`, `v(a,b)=(b,a,0)`, and
  `u:ℚ_p³→ℚ_p²`, `u(x,y,z)=(x,y)`, so that `u∘v` swaps the two coordinates.
  Then `B(u∘v)=B(v)B(u)` is the `2×2` swap matrix, while `B(u)B(v)` is `3×3`,
  with entries `1` at `(0,1)` and `(1,0)` only: the order is the reverse of
  that in `ContinuousLinearMap.matrixCoeff_comp`.
- For `P=0`, use `S=∅, C=1`; for a coordinate line or a module supported on a
  fixed finite set, take that coordinate set and `C=1`.
- For the cyclic permutation `σ(0)=1, σ(1)=2, σ(2)=0` of `{0,1,2}`, the
  reindexing `f↦f∘σ⁻¹` sends `single 0 1` to `single 1 1`, so its matrix has
  entries `1` at `(1,0),(2,1),(0,2)`; the convention `f↦f∘σ` would give the
  transposed matrix, with entries at `(0,1),(1,2),(2,0)`.
- The diagonal `diag(p^n)` on `C₀(ℕ,ℚ_p)` is injective with dense range but
  not surjective: `(p^n)_n` is not in its range, since the preimage would be
  the constant sequence `1`, which is not null.

### Dependencies

Layers 0–1, `C₀` and `lp`; the pinned completed tensor only for the corollary
of §2.4. Sources: [Serre], [Sch] §10, [Bel] §II.1, [Buz] Lemmas 2.2–2.3 with
the Banach–Tate extension in [JN] §2.1, and the proof of [Conrad] Lemma 1.1.5
(citing [BGR] 2.7.1/4).

## Layer 3: Continuous functions, Mahler coordinates and bounded measures

### 3.1 Profinite functions

In the pinned library, with nothing remaining: the sup-norm module `C(X,E)`
(Mathlib), density of locally constant functions
(`LocallyConstant.denseRange_toContinuousMap`) and compatibility with clopen
partitions (`ContinuousMap.zeroExtendClopen`). General integration and measure
topologies belong to PadicMeasuresIwasawaAlgebras and are not targets here.

### 3.2 Mahler's theorem

In the pinned library: Mathlib's `PadicInt.mahlerEquiv`, with its scalar-linear
refinement (`PadicInt.mahlerEquiv_smul`, `PadicInt.mahlerLinearIsometryEquiv`),
translation (`PadicInt.mahlerTranslate`), products
(`ContinuousMap.mahlerEquiv_mul_apply`, `ZeroAtInftyContinuousMap.mahlerProduct`,
`ZeroAtInftyContinuousMap.norm_mahlerProduct_le`) and Stirling formulas for
monomials (`TauCeti.id_pow_eq_sum_stirlingSecond_smul_mahler`). The characters
`x↦(1+t)^x` and their Mahler coefficients `(χ(1)−1)^n` are Mathlib's
`PadicInt.addChar_of_value_at_one` and `PadicInt.continuousAddCharEquiv`, with
`PadicInt.continuousAddCharEquiv_of_norm_mul` for multiplicative norms.

Target: for a continuous scalar function `g∈C(ℤ_p,R)` and a Banach module `E`
with contractive `R`-action, multiplication by `g` on `C(ℤ_p,E)` is bounded by
`‖g‖`. Its operator norm is `‖g‖`, so that it is contractive exactly when
`‖g‖≤1`, in two cases: when `E≠0` and `NormSMulClass R E` holds, the ratio
`‖g‖` is attained on every nonzero constant function; when `E=R` and
`NormOneClass R` holds, it is attained on the constant `1`. Neither case
implies the other: `NormOneClass R` does not give `NormSMulClass R R`.
*Needs:* Mathlib `ContinuousMap.norm_le` and `ContinuousMap.norm_coe_le_norm`
for the sup norm, `IsBoundedSMul R E` for the bound, `NormSMulClass R E` for
the first case and `NormOneClass R` for the second.

### 3.3 Van der Put coordinates

In the pinned library, with nothing remaining: the clopen-ball basis
`PadicInt.vanDerPutTerm`, coefficients `PadicInt.vanDerPutCoeff` with
`PadicInt.vanDerPutCoeff_zero` and `PadicInt.vanDerPutCoeff_of_ne_zero`, the
coefficient isometry `PadicInt.vanDerPutEquiv`, the coefficients of `f(x)=x`
(`PadicInt.vanDerPutCoeff_id`), finite expansions of locally constant functions
(`PadicInt.isLocallyConstant_iff_finite_support_vanDerPutCoeff`), and the change
from Mahler coordinates (`PadicInt.mahlerToVanDerPut`,
`PadicInt.matrixCoeff_mahlerToVanDerPut`).

### 3.4 Bounded Amice transform, integral unit ball and `φ,ψ`

In the pinned library: Mahler duality for a Tate `ℤ_p`-algebra `R`
(`AbstractMeasure.mahlerMomentsEquiv`,
`AbstractMeasure.ringOpNorm_toCLMEquiv_eq_iSup_coeff`) and the range of the
Amice transform (`AbstractMeasure.mem_range_amiceTransform_iff`); over a
complete normed `ℚ_p`-field

```text
‖μ‖ = sup_n ‖b_n‖,    F is in the range ⇔ {‖coeff_n F‖ : n∈ℕ} is bounded,
```

as `AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff`; the integral equivalence
`AbstractMeasure.amiceTransformEquiv`, compatible with convolution through
Mathlib's `AbstractMeasure.amiceTransformEquivₐ` on `Multiplicative ℤ_p` and
with extension to `ℚ_p` (`AbstractMeasure.amiceTransform_extendCoefficients`); the
rational dual unit ball as the extensions of integral measures
(`AbstractMeasure.existsUnique_integral_iff_norm_le_one`); the integral scalar
action on `ℚ_p` (`TauCeti.normSMulClass_padicInt_padic`); Frobenius
`AbstractMeasure.phiMeasure`, the indicator `AbstractMeasure.pMultiplesIndicator`,
weighting `AbstractMeasure.weight`, `ψ` as `AbstractMeasure.psiMeasure` with
`AbstractMeasure.psiMeasure_comp_phiMeasure`,
`AbstractMeasure.unitRestriction_eq_id_sub_phiMeasure_comp_psiMeasure` and the
uniqueness `AbstractMeasure.existsUnique_psiMeasure`; the transform
`A_(φμ)(T)=A_μ((1+T)^p−1)` (`AbstractMeasure.amiceTransform_phiMeasure`) and the
moment identities for `ψ` (`TauCeti.psiSeries_amiceTransform`). There is no
averaging factor `p⁻¹`. Evaluation on the open disc uses RestrictedPowerSeries
§7.1; bounded coefficients give convergence on every radius `<1`,
not necessarily the closed unit disc. The general Cartier decomposition and
Iwasawa applications belong to PadicMeasuresIwasawaAlgebras. Nothing remains
beyond the checks.

### Examples

**Checks.**

- The Mahler expansion of `x²` is `binom(x,1)+2binom(x,2)` (an example in
  `NumberTheory/Padics/MahlerBasis/Polynomial.lean`).
- For `x^p−x`, the monomial Gauss norm is `1`, while the continuous sup norm
  and the Mahler coefficient norm are `p⁻¹`.
- Multiplication by `g` on `C(ℤ_p,E)`: for `E=R=ℚ_p` and the constant
  `g=p⁻¹`, the image of the constant `1` has norm `p>1`, so the map is not
  contractive; for `g=p` it is, with norm `p⁻¹`. The negative control is
  `E=0` with the same `g=p⁻¹`: `C(ℤ_p,0)=0`, multiplication is the zero map
  and contractive, while `‖g‖=p`; a definition claiming "contractive exactly
  when `‖g‖≤1`" without `E≠0` is refuted by it.
- `NormOneClass` is not `NormSMulClass`: on `R=E=ℚ_p×ℚ_p` with the sup norm,
  `‖1‖=1` but `‖(1,0)(0,1)‖=0`. For `g` the constant `(p⁻¹,1)`, `‖g‖=p`; the
  nonzero constant `(0,1)` has ratio `1`, while the constant `1` attains `p`,
  so the operator norm is `p` through the second case only.
- The Amice transforms of `φδ₀`, `φδ₁` and `φ0` are `1`, `(1+T)^p` and `0`
  (`AbstractMeasure.amiceTransform_dirac`, `AbstractMeasure.phiMeasure_dirac`):
  `φδ₁=δ_p`. A `φ` with an averaging factor `p⁻¹` would send `δ₁` to
  `p⁻¹(1+T)^p`.
- A van der Put coefficient with leading digit greater than one, Dirac measures
  of norm one (`TauCeti.AbstractMeasure.norm_dirac`), `p⁻¹δ₀` outside and `0`
  inside the rational dual unit ball, the sequence `p^(−n)` not being a moment
  sequence, and at `p=3` the identities `φδ₂=δ₆`, `ψδ₆=δ₂`, `ψδ₁=0`, `ψδ₀=δ₀`
  are examples in the pinned files of §§3.3–3.4; `(φμ)(1)=μ(1)` is
  `AbstractMeasure.phiMeasure_apply_one`.

### Dependencies

Layers 0–2, Mathlib's Mahler and measure APIs, and RestrictedPowerSeries §7.1.
Sources: [Mah], [Am] Théorème 1, p. 143 (the Mahler basis is the case
`uₙ=n`), [Col] I.3 and [RJW] §3.

## Layer 4: Analytic stages and distributions on `ℤ_p`

### 4.1 Analytic coefficient models

In the pinned library: the stage carrier `TauCeti.AnalyticStage p h E`, kept
distinct from its evaluated functions, and evaluation
`TauCeti.AnalyticStage.eval` into continuous functions.

Target: consume the restricted-series carrier, unit-radius `C₀` comparison,
evaluation, translation and differentiation from RestrictedPowerSeries, using
its module-valued coefficient model, and compare it with
`TauCeti.AnalyticStage`: the curried coordinates
`ZeroAtInftyContinuousMap.curryEquiv`, followed on each factor by the
unit-radius coefficient isometry of RestrictedPowerSeries §1.3, give an
`ℤ_p`-linear isometry from `TauCeti.AnalyticStage p h E` onto the product, over
`a∈ZMod(p^h)` with the maximum norm, of the `E`-valued restricted series in one
variable `w` at radius one, sending `c` to `(Σ_k c(a,k) w^k)_a`. Under it the
value of `TauCeti.AnalyticStage.eval c` at `x=a+p^h w`, with `a` the natural
representative and `w∈ℤ_p`, is the value `Σ_k w^k • c(a,k)` of the `a`-th
series at `w` (`TauCeti.AnalyticStage.eval_natCast_val_add_mul`). Evaluation
on a bounded set lands in bounded continuous functions; do not assume that the
unit ball of a general coefficient ring is compact. For algebra coefficients one injectivity
hypothesis is a separating family of bounded maps to complete nonarchimedean
fields, as in RestrictedPowerSeries; a Banach `ℚ_p`-module instead has the
injectivity of §4.4; a general bounded `ℤ_p`-module has neither. *Needs:*
RestrictedPowerSeries §§0.3, 1.1, 1.3 and 2.1–2.3 (module-valued
coefficients, Gauss norms, the unit-radius coefficient isometry, evaluation,
translation and Hasse derivatives), `ZeroAtInftyContinuousMap.curryEquiv`,
`TauCeti.AnalyticStage`, `TauCeti.AnalyticStage.eval`,
`TauCeti.AnalyticStage.eval_natCast_val_add_mul`,
`TauCeti.AnalyticStage.eval_injective`.

### 4.2 Discs and changes of centre

In the pinned library: the disc coordinate `PadicInt.discHomeomorph` and the
on-disc formula `TauCeti.AnalyticStage.eval_natCast_val_add_mul`.

Targets: translation by an integral coordinate is an isometry on restricted
coefficient sequences, with inverse translation by its negative; the expansion
is independent of the chosen representative of the residue class, using
RestrictedPowerSeries' translation theorem. Uniqueness of an expansion is
stated only with the injectivity hypotheses of §4.1. *Needs:*
RestrictedPowerSeries §2.2 (analytic substitution and translation),
`PadicInt.discHomeomorph`, `TauCeti.AnalyticStage.eval_natCast_val_add_mul`,
`TauCeti.AnalyticStage.eval_injective`.

### 4.3 Stages, restriction and the algebraic union

In the pinned library, with nothing remaining: evaluation is continuous and
norm-decreasing (`TauCeti.AnalyticStage.norm_eval_le`); the transition
`TauCeti.AnalyticStage.transition`, re-expanding `w=b+pv` by

```text
d_(a+p^h b,j) = Σ_{k≥j} binom(k,j) b^(k−j) p^j • c_(a,k),
```

is contractive (`TauCeti.AnalyticStage.norm_transition_le`), compatible with
evaluation (`TauCeti.AnalyticStage.eval_transition`) and composes
(`TauCeti.AnalyticStage.transitionLE_comp`); injectivity for `p`-torsion-free
`E` (`TauCeti.AnalyticStage.eval_injective`,
`TauCeti.AnalyticStage.transition_injective`); the algebraic direct limit
`TauCeti.LocallyAnalytic p S E` with `TauCeti.LocallyAnalytic.ofStage_injective`,
`TauCeti.LocallyAnalytic.eval_injective` and its identification with the union
of the stage images (`TauCeti.LocallyAnalytic.range_eval_eq_iSup`); locally
polynomial functions (`TauCeti.AnalyticStage.polynomialSubmodule`), their
coefficient model `E^(p^h(k+1))` (`TauCeti.AnalyticStage.polynomialEquiv`) and
polynomial density (`TauCeti.AnalyticStage.dense_iUnion_polynomialSubmodule`).
The locally convex topology on `LA(ℤ_p,E)` is not constructed here.

### 4.4 Amice's analytic basis

Put `m_h(n)=⌊n/p^h⌋!` and `e_(h,n)(x)=m_h(n)binom(x,n)`. In the pinned library:
integral disc coefficients of `e_(h,n)`
(`TauCeti.exists_natDegree_le_and_eval_eq_factorial_mul_choose`,
`TauCeti.amicePolynomial`), their reduction modulo `p`
(`TauCeti.norm_coeff_amicePolynomial_lt_one_of_div_lt`,
`TauCeti.norm_coeff_amicePolynomial_lt_one_of_mod_lt`,
`TauCeti.norm_coeff_amicePolynomial_mod_div`), the vectors
`TauCeti.AnalyticStage.amiceTerm` and the norm-nonincreasing map
`TauCeti.AnalyticStage.amiceMap : C₀(ℕ,E) →L LA_h(E)`,
`(c_n) ↦ Σ_n e_(h,n) • c_n` (`TauCeti.AnalyticStage.norm_amiceMap_le`), whose
evaluation is the Mahler series with coefficients `m_h(n)c_n`
(`TauCeti.AnalyticStage.eval_amiceMap`).

Targets:

- **Amice's theorem** ([Am] Théorème 2, p. 150, for `uₙ=n`; [Col] Théorème
  I.4.7, p. 15). For complete ultrametric
  `E` with contractive `ℤ_p` action, `TauCeti.AnalyticStage.amiceMap` is
  bijective and isometric: `amiceMap_bijective_and_norm_eq`. In the integral
  case its basis vectors form an orthonormal basis of `LA_h(ℤ_p)`:
  `isOrthonormalBasis_amiceTerm`.
  Make explicit the reindexing from Colmez's centres `−j`, `1≤j≤p^h`, to the
  natural representatives, order the coordinates `(a,j)` by `j` and then by
  decreasing `a`, and apply §2.7 with the actual null-column condition; the
  finite block reduction uses degrees **at most** the block degree on earlier
  discs, not a strict inequality. *Needs:* `TauCeti.norm_coeff_amicePolynomial_mod_div`,
  `TauCeti.norm_coeff_amicePolynomial_lt_one_of_mod_lt`,
  `Matrix.toZeroAtInftySMulLinearIsometryEquiv`.
- For a Banach `ℚ_p`-space and continuous `f` with Mahler coefficients `a_n`,

  ```text
  f∈LA_h ⇔ ‖a_n‖/‖m_h(n)‖ → 0,
  ‖f‖_h = sup_n ‖a_n‖/‖m_h(n)‖.
  ```

  This is the level-`h` form of [Col] Théorème I.4.7 read through the Mahler
  coefficients; for scalar coefficients it is [Am] Théorème 3 with Corollaire
  1(c), pp. 159–161, applied to `uₙ=n`. *Needs:*
  `amiceMap_bijective_and_norm_eq`, `TauCeti.AnalyticStage.eval_amiceMap`,
  `TauCeti.AnalyticStage.eval_injective`.
- Local analyticity is equivalent to positive lower exponential decay of
  `‖a_n‖`: `liminf_n (−log_p‖a_n‖)/n>0`, allowing `+∞` for zero coefficients
  and ignoring `n=0` ([Col] Corollaire I.4.8, p. 15; [Am] Corollaire 1(b),
  p. 161). *Needs:* the level-`h`
  criterion above and `TauCeti.LocallyAnalytic.range_eval_eq_iSup`.
- For complete ultrametric `E` with contractive `ℤ_p` action, the transition
  is diagonal in Amice coordinates:
  `TauCeti.AnalyticStage.transition` of `amiceMap_h(c)` is
  `amiceMap_(h+1)(n↦(m_h(n)/m_(h+1)(n))•c_n)`. The multiplier is the integer
  `⌊n/p^h⌋!/⌊n/p^(h+1)⌋!`, of valuation `⌊n/p^(h+1)⌋` by Legendre's formula,
  so its norm tends to zero. The identity holds on each Amice vector over
  `ℤ_p`, where evaluation is injective; it passes to `E` because the
  transition formula of §4.3 and the coefficients of Amice's vectors
  (`TauCeti.AnalyticStage.amiceTerm_apply`) are integral multiples of `e`, and
  then to all of `C₀(ℕ,E)` by continuity. *Needs:*
  `TauCeti.AnalyticStage.amiceTerm`, `TauCeti.AnalyticStage.amiceTerm_apply`,
  `TauCeti.AnalyticStage.eval_amiceTerm`, `TauCeti.AnalyticStage.eval_transition`,
  `TauCeti.AnalyticStage.eval_injective` (for `E=ℤ_p`), and
  `TauCeti.norm_factorial_le_mul_amiceRadius_succ_pow` for the decay.

### 4.5 Exponential, logarithm and binomial evaluation

In the pinned library: the exponential and logarithm on `ℚ_p`
(`Padic.norm_exp_sub_one`, `Padic.log_exp`, `Padic.exp_log`, `Padic.log_mul`)
and on finite extensions (`TauCeti.hasSum_exp_of_mem_maximalIdeal_pow`,
`TauCeti.exp_add_of_mem_maximalIdeal_pow`,
`TauCeti.hasSum_log_of_mem_unitFiltration_one`); the character `(1+t)^x` for
topologically nilpotent `t` (`PadicInt.addChar_of_value_at_one`) and continuity
of the binomial series in the exponent (`PadicInt.continuous_binomialSeries`).

Targets:

- For a complete ultrametric commutative normed `ℚ_p`-algebra `A` with
  `‖c•a‖≤‖c‖‖a‖`, Mathlib's `NormedSpace.log` converges at `1+u` for `‖u‖<1`
  and `NormedSpace.exp` converges at `z` for `‖z‖<r_p=p^(−1/(p−1))`, with
  `log(exp z)=z`, `exp(log(1+u))=1+u` for `‖u‖<r_p`, `exp(z+z')=exp z·exp z'`
  and `log((1+u)(1+u'))=log(1+u)+log(1+u')` on these domains, and the bounds
  `‖exp z−1‖≤‖z‖`, `‖log(1+u)‖≤‖u‖` for `‖z‖,‖u‖<r_p`. Exact norm identities
  use a normed-field or isometric-scalar hypothesis; do not infer a
  Banach-algebra identity from field-valued evaluations alone. For elements of
  an affinoid algebra, [Buz] §8, p. 62, recalls that `log(1+t)` converges for
  `|t|<1` and `exp(t)` for `|t|<r_p`, and that the two series are inverse
  isomorphisms between the open discs of radius `r_p` about `1` and about `0`;
  over `ℂ_p` the logarithm series and its functional equation are [Col] §I.6,
  p. 27. The coefficient bound `v_p(n)≤v_p(n!)≤(n−1)/(p−1)` gives
  `‖z^n/n!‖≤‖z‖(‖z‖/r_p)^(n−1)` and `‖u^n/n‖≤‖u‖(‖u‖/r_p)^(n−1)`, using
  `‖c•a‖≤‖c‖‖a‖` and submultiplicativity in place of multiplicativity; hence
  the radius of `expSeries ℚ_p A` is at least `r_p`, and the two norm bounds
  hold. On that radius `exp(z+z')=exp z·exp z'` is Mathlib's
  `NormedSpace.exp_add_of_mem_ball`. *Needs:*
  Mathlib `NormedSpace.exp`, `NormedSpace.log`, `NormedSpace.exp_add_of_mem_ball`
  and `NonarchimedeanAddGroup.summable_of_tendsto_cofinite_zero`, with the scalar
  case `Padic.log_exp`, `Padic.exp_log`, `Padic.norm_exp_sub_one` as the model.
- For `t∈A` with `‖t‖<r_p` and `x∈ℤ_p`, `(1+t)^x=exp(x log(1+t))`, where the
  left side is `PadicInt.addChar_of_value_at_one`, and
  `‖(1+t)^x−1‖≤‖x‖‖t‖`, with equality over a normed field. Over `ℚ_p`, where
  `‖t‖<r_p` means `t∈2pℤ_p`, the identity is a case of [Col] §I.6, p. 27,
  which expands a continuous character `δ` of `ℚ_pˣ` as
  `δ(y)=exp(w(δ) log y)=Σ_n binom(w(δ),n)(y−1)^n` for `y∈1+p^(n(δ))ℤ_p`, with
  the base in `ℚ_p` and the exponent `w(δ)∈ℂ_p`: take for `δ` the character
  equal to `y↦y^x` on `1+2pℤ_p` and trivial on `p` and on the roots of unity of
  `ℚ_p`, for which `w(δ)=x` and `n(δ)=v_p(2p)`. For a base `a=1+t` with `t∈ℂ_p`,
  [Am] Proposition 15, p. 177, gives the continuous extension
  `a^x=Σ_n binom(x,n)(a−1)^n` of `n↦a^n` for `v_p(a−1)>0`, equal to `exp(px)`
  at `a=exp(p)` ([Am] §16.2, p. 177). In general both sides equal `(1+t)^n` at
  `x=n∈ℕ`, by `exp(z+z')=exp z·exp z'` and `exp(log(1+t))=1+t`, and both are
  continuous in `x`, so they agree on `ℤ_p`. Integral exponents are not arbitrary
  elements of the unit ball of a coefficient algebra. *Needs:* the previous
  target, `PadicInt.addChar_of_value_at_one`,
  `PadicInt.continuous_binomialSeries` for continuity in `x`, and density of
  `ℕ` in `ℤ_p`.
- Over a finite extension of `ℚ_p`, the exponential and logarithm above agree
  with the local-field ones of LocalFieldsRamification on their common
  domains. *Needs:* `TauCeti.hasSum_exp_of_mem_maximalIdeal_pow`,
  `TauCeti.hasSum_log_of_mem_unitFiltration_one`, and LocalFieldsRamification
  Layer 1, deep units in mixed characteristic (`TauCeti.deepUnitExpLogEquiv`).

### 4.6 Analyticity of additive characters

In the pinned library: the Amice coordinates of `χ_t(x)=(1+t)^x`
(`TauCeti.amiceCharCoeff`) tend to zero exactly when
`‖t‖ < p^(−1/((p−1)p^h))` (`TauCeti.tendsto_amiceCharCoeff_iff`), with the
boundary subsequence (`TauCeti.le_norm_amiceCharCoeff_pow`); the disc expansion
`TauCeti.AnalyticStage.addCharExpansion` of norm one
(`TauCeti.AnalyticStage.norm_addCharExpansion`) evaluating to `χ_t`
(`TauCeti.AnalyticStage.eval_addCharExpansion`); every continuous field-valued
character is analytic at some level
(`TauCeti.AnalyticStage.exists_eval_eq_addChar`).

Target: for a complete ultrametric normed `ℚ_p`-algebra `K` with
multiplicative norm, in particular a complete normed extension `K/ℚ_p`, and
topologically nilpotent `t`, `χ_t` lies in the image of `LA_h(K)` exactly when
`‖t‖ < p^(−1/((p−1)p^h))`, equivalently `‖(1+t)^(p^h)−1‖<r_p`:
`exists_eval_eq_addChar_iff`, stated with the radius `TauCeti.amiceRadius p h`
([Col] Théorème I.4.7, p. 15, with the argument of Lemme II.2.1, p. 30; [Am]
Corollaire 1(c), p. 161, for `K=ℚ_p`).
The "if" direction is the pinned `TauCeti.AnalyticStage.eval_addCharExpansion`;
for "only if", Amice's theorem writes the preimage as `amiceMap c` with
`c∈C₀(ℕ,K)`, uniqueness of Mahler coefficients gives `m_h(n)c_n=t^n`, so `c`
is the pinned coordinate vector `TauCeti.amiceCharCoeff`, and
`TauCeti.tendsto_amiceCharCoeff_iff` concludes. *Needs:* the Mahler criterion
of §4.4, `TauCeti.AnalyticStage.eval_addCharExpansion`,
`TauCeti.tendsto_amiceCharCoeff_iff`, `TauCeti.AnalyticStage.eval_injective`.
For Banach-algebra coefficients retain sufficient power/convergence conditions
and the actual coefficient bound, without asserting the field-valued necessary
condition.

### 4.7 Algebraic distributions and quantitative Amice transform

In the pinned library: `TauCeti.amiceDualNorm p h F = sup_n ‖coeff_n F‖ ‖⌊n/p^h⌋!‖`,
the radius `TauCeti.amiceRadius`, and for a series `F` with `S_h` the Gauss norm
`PowerSeries.gaussNorm` at radius `TauCeti.amiceRadius p h`

```text
S_h(F) ≤ D_h(F) ≤ p S_(h+1)(F),
```

as `TauCeti.gaussNorm_amiceRadius_le_amiceDualNorm` and
`TauCeti.amiceDualNorm_le_mul_gaussNorm_amiceRadius_succ`, under boundedness of
the families involved; the equivalence of finiteness at every level with
convergence on the open disc
(`TauCeti.onOpenDisc_iff_forall_hasGaussNorm_amiceRadius`,
`TauCeti.onOpenDisc_iff_forall_bddAbove_norm_coeff_mul_norm_factorial`).

Throughout, `K` is a complete normed extension of `ℚ_p`, `D(ℤ_p,K)` is the
carrier `distributions K` below and `m_h(n)=⌊n/p^h⌋!`. No general manifold or
tensor-distribution construction is required for this one-variable interface.

Targets:

- **Distributions.** Define `distributions K` as the `K`-submodule of
  `K`-linear forms `μ` on `TauCeti.LocallyAnalytic p K K` whose composite with
  every stage map `TauCeti.LocallyAnalytic.ofStage K h` is continuous on the
  Banach stage `LA_h(K)` ([Col] §II.2, p. 29). Its stage seminorms are the
  operator norms `‖μ‖_h` of these composites; no global topology is put on it.
  *Needs:* `TauCeti.LocallyAnalytic`, `TauCeti.LocallyAnalytic.ofStage`.
  - A family of continuous `K`-linear forms `μ_h` on the stages with
    `μ_(h+1)∘transition=μ_h` is the family of composites of exactly one
    distribution (`Module.DirectLimit.lift`, `Module.DirectLimit.hom_ext`,
    `TauCeti.LocallyAnalytic.ofStage_transition`).
  - The stage seminorms increase with the level, `‖μ‖_h≤‖μ‖_(h+1)`, because
    the transition is contractive (`TauCeti.AnalyticStage.norm_transition_le`).
  - For `x∈ℤ_p`, the evaluation `δ_x(f)=(TauCeti.LocallyAnalytic.eval K f)(x)`
    is a distribution with `‖δ_x‖_h=1` at every level, attained at the
    constant `1` (`TauCeti.AnalyticStage.norm_eval_le`).
  - A bounded measure `μ` in `AbstractMeasure ℤ_[p] K K` restricts to the
    distribution `f↦μ(TauCeti.LocallyAnalytic.eval K f)` with `‖μ‖_h≤‖μ‖`.
    Restriction is injective: the binomial functions `x↦binom(x,n)` are
    evaluations of level-zero vectors, so the restriction determines the
    moments of `μ`, and these determine `μ`. Its image is a target after the
    Amice bijection below. *Needs:* `TauCeti.LocallyAnalytic.eval_ofStage`,
    `TauCeti.AnalyticStage.norm_eval_le`, `TauCeti.AnalyticStage.eval_amiceTerm`,
    `AbstractMeasure.coeff_amiceTransform`,
    `AbstractMeasure.injective_amiceTransform`.

  **Checks.**
  - The derivative at zero is a distribution with `‖μ‖_h=p^h`: on the disc of
    `0` at level `h`, the coordinate `w=x/p^h`, extended by zero to the other
    discs, has stage norm one and derivative `p^(−h)` at `0`. Its stage norms
    are unbounded, so it is not the restriction of a bounded measure; a carrier
    with one bound for all stages would exclude it.
  - No distribution has the moments `b_n=1/n!`: the form they define on
    polynomials is bounded on `LA_0` but not on `LA_1`
    (`TauCeti.bddAbove_norm_coeff_mul_norm_factorial_zero_exp`,
    `TauCeti.not_bddAbove_norm_coeff_mul_norm_factorial_one_exp`); a carrier
    asking continuity on `LA_0` alone would contain it.
  - `δ_(−1)` has moments `(−1)^n` and `D_h=sup_n ‖m_h(n)‖=1` at every level, in
    agreement with `‖δ_x‖_h=1` and with the stage-norm identity below.
- **Binomial functions.** Define `binomialLA K n` as the class in
  `TauCeti.LocallyAnalytic p K K` of the level-zero vector
  `TauCeti.AnalyticStage.amiceTerm p 0 n ((n!)⁻¹ • 1)`. *Needs:*
  `TauCeti.AnalyticStage.amiceTerm`, `TauCeti.LocallyAnalytic.ofStage`.
  - It evaluates to `x↦binom(x,n)` (`TauCeti.LocallyAnalytic.eval_ofStage`,
    `TauCeti.AnalyticStage.eval_amiceTerm`); an example in
    [Suggested.lean](Suggested.lean) proves this.
  - At level `h` it is the class of `amiceTerm p h n (m_h(n)⁻¹ • 1)`, of stage
    norm `‖m_h(n)‖⁻¹`, by `TauCeti.LocallyAnalytic.eval_injective` and
    `amiceMap_bijective_and_norm_eq`.
  - The binomial functions span a dense subspace of every stage, by
    `amiceMap_bijective_and_norm_eq`, so a distribution is determined by its
    moments `b_n=μ(binomialLA K n)`.

  **Checks.**
  - `binomialLA K 0` is the constant `1`, `binomialLA K 1` is `x`, and
    `binomialLA K 2` takes the value `1` at `x=−1`.
  - At `p=2`, `binomialLA K 2` has stage norm `2` at level `0`, from the
    expansion `(x²−x)/2`, and stage norm `1` at level `1`, from the expansions
    `2w²−w` and `2w²+w` on the discs of `0` and `1`; these are `‖m_h(2)‖⁻¹`.
  - The unnormalised vector `amiceTerm p 0 n 1` evaluates to `n!binom(x,n)`;
    with it `δ_2` would have second moment `2` instead of `binom(2,2)=1`, and
    transform `1+2T+2T²` instead of `(1+T)²`.
- **Stage norms.** For a distribution `μ` with moments `b_n`, the stage norm
  `‖μ‖_h` is `D_h(b)=sup_n ‖b_n‖ ‖m_h(n)‖`, the pinned `TauCeti.amiceDualNorm`
  of `A_μ=Σ_n b_n T^n`, so the two inequalities above become
  `S_h(A_μ)≤‖μ‖_h≤p S_(h+1)(A_μ)` ([Col] Théorème II.2.2, p. 30, in
  valuations). *Needs:* `amiceMap_bijective_and_norm_eq`,
  `TauCeti.amiceDualNorm`, and `ZeroAtInftyContinuousMap.linearCombinationEquiv`
  for the dual of `C₀(ℕ,K)`.
- **The Amice bijection.** For every distribution `μ`, `A_μ` lies on the open
  unit disc (`PowerSeries.OnOpenDisc 1`), and every series on the open unit
  disc is `A_μ` for exactly one distribution:
  `amiceTransform_distribution_bijective` ([Col] Théorème II.2.2, p. 30; [ST]
  Theorem 2.2, p. 9, in one variable). The inverse sends `F` to the
  distribution acting on `LA_h` in Amice coordinates by
  `c↦Σ_n c_n m_h(n) coeff_n F`. A bound at one level is insufficient: `exp(T)`
  has `D_0` finite and is not on the open disc. *Needs:* `distributions`,
  `binomialLA`, `amiceMap_bijective_and_norm_eq`,
  `TauCeti.AnalyticStage.norm_amiceTerm_le`,
  `TauCeti.onOpenDisc_iff_forall_bddAbove_norm_coeff_mul_norm_factorial`,
  `ZeroAtInftyContinuousMap.linearCombinationEquiv`, `Module.DirectLimit.lift`.
- **Bounded measures.** A distribution is the restriction of a bounded measure
  exactly when its moments `b_n` are bounded ([Col] §II.3, no. 2, p. 31).
  Restrictions have `‖b_n‖≤‖μ‖`, since `‖binom(·,n)‖_sup≤1`. Conversely,
  bounded moments make `Σ_n b_n T^n` the transform of a bounded measure
  (`AbstractMeasure.mem_range_amiceTransform_iff`), whose restriction has the
  same moments and so equals the given distribution by the uniqueness in the
  Amice bijection. *Needs:* the restriction map of `distributions` above,
  `AbstractMeasure.mem_range_amiceTransform_iff`,
  `AbstractMeasure.coeff_amiceTransform`, `amiceTransform_distribution_bijective`.
- **Integration of characters.** For a distribution `μ` and `z∈K` with
  `‖z‖<1`, the character `x↦(1+z)^x` is the evaluation of a vector of `LA_h(K)`
  for every `h` with `‖z‖<r_h`, and `μ` takes on it the value `A_μ(z)` of the
  open-disc series at `z` ([Col] Lemme II.2.1, p. 30). *Needs:*
  `TauCeti.AnalyticStage.addCharExpansion`,
  `TauCeti.AnalyticStage.eval_addCharExpansion`,
  `TauCeti.tendsto_amiceCharCoeff_iff`, the Amice bijection, and
  RestrictedPowerSeries §7.1 for the value of `A_μ` at `z`.
- **Point masses.** For `x∈ℤ_p`, `A_(δ_x)=Σ_n binom(x,n)T^n=(1+T)^x`, and
  `δ_x` is the restriction of the bounded measure `AbstractMeasure.dirac x`,
  whose transform is the same series (`AbstractMeasure.amiceTransform_dirac`).
  *Needs:* `binomialLA`, `TauCeti.LocallyAnalytic.eval_ofStage`,
  `TauCeti.AnalyticStage.eval_amiceTerm`, `AbstractMeasure.amiceTransform_dirac`.
- **Convolution.** For distributions `λ,μ`, put
  `(λ∗μ)(f)=μ(y↦λ(x↦f(x+y)))`. For `f∈LA_h(K)`, the function
  `y↦λ(x↦f(x+y))` lies in `LA_h(K)` with stage norm at most `‖λ‖_h‖f‖_h`:
  re-expanding `f(x+y)` on the discs of `x` and of `y` gives a two-variable
  restricted series whose `y`-coefficients are vectors of `LA_h(K)` tending to
  zero. Hence `λ∗μ` is a distribution with `‖λ∗μ‖_h≤‖λ‖_h‖μ‖_h`, and
  `A_(λ∗μ)=A_λ·A_μ`, by Vandermonde's identity on the moments ([Col] §II.4,
  no. 6, p. 36, with Lemme II.4.2). On restrictions of bounded measures it is
  the restriction of the measure convolution on `Multiplicative ℤ_p`, whose
  transform is the product by Mathlib's `AbstractMeasure.amiceTransformₐ`.
  *Needs:* `distributions`, `binomialLA`, `TauCeti.AnalyticStage.transition`
  for the re-expansion, RestrictedPowerSeries §§1.3 and 2.2 for the
  two-variable coefficient model and translation, `AbstractMeasure.amiceTransformₐ`
  for the comparison.

  **Checks.**
  - `δ_a∗δ_b=δ_(a+b)`: `(δ_a∗δ_b)(f)=δ_b(y↦f(a+y))=f(a+b)`, with transform
    `(1+T)^a(1+T)^b=(1+T)^(a+b)`. The convention
    `(λ∗μ)(f)=μ(y↦λ(x↦f(x−y)))` would give `δ_1∗δ_1=δ_0`, with transform `1`
    instead of `(1+T)²`.
  - `δ_0` is the unit, `δ_0∗μ=μ∗δ_0=μ`, with transform `1`. A convolution built
    from the multiplication of `ℤ_p`, `(λ∗μ)(f)=μ(y↦λ(x↦f(xy)))`, would make
    `δ_0` absorbing instead: `(δ_0∗μ)(f)=f(0)μ(1)`.
  - For the derivative at zero, `μ'(f)=f'(0)` with transform `log(1+T)`,
    `μ'∗μ'` is `f↦f''(0)`: its moments are `b_2=1` and `b_3=−1`, the second
    derivatives at `0` of `binom(x,2)` and `binom(x,3)`, and its transform is
    `log(1+T)²=Σ_(n≥2) 2(−1)^n H_(n−1)T^n/n`, with `H_k` the harmonic numbers.
    Its level-zero norm is `D_0=sup_n‖2(n−1)!H_(n−1)‖=‖2‖`, as the integers
    `(n−1)!H_(n−1)` equal `1` at `n=2`; at `p=2` this is `2⁻¹<‖μ'‖_0²=1`, so
    the bound `‖λ∗μ‖_h≤‖λ‖_h‖μ‖_h` is not an equality.

### Examples

**Checks.**

- At level zero `x^p−x` has Gauss norm `1`; for `E=𝔽_p` its nonzero
  coefficient vector re-expands to zero on all level-one discs
  (`TauCeti.AnalyticStage.norm_frobeniusSubIdCoeffs`,
  `TauCeti.AnalyticStage.transition_frobeniusSubIdCoeffs`,
  `TauCeti.AnalyticStage.not_injective_transition_residueField`).
- A parameter of norm `2^(−1/2)` fails the level-one criterion and satisfies
  the level-two criterion
  (`TauCeti.not_tendsto_amiceCharCoeff_one_and_tendsto_amiceCharCoeff_two`);
  in the function form of §4.6, `χ_t` with `‖t‖=2^(−1/2)` is in the image of
  `LA_2(K)` and not of `LA_1(K)`, since `r_1=2^(−1/2)` and `r_2=2^(−1/4)`.
- `χ_p` over `ℚ_p`: `‖p‖=p⁻¹<r_0=p^(−1/(p−1))` exactly when `p>2`, so
  `(1+p)^x` is analytic on `ℤ_p` at level zero for odd `p`, while at `p=2` the
  character `3^x` needs level one (`r_1=2^(−1/2)>2⁻¹`). The constant character
  `t=0` is at every level.
- `log(1+T)` is not a measure's transform
  (`TauCeti.not_bddAbove_norm_coeff_log`,
  `TauCeti.log_notMem_range_amiceTransform`).
- At `h=0`, `m_0(n)=n!`, so `x²=binom(x,1)+2binom(x,2)` has Amice
  coordinates `c_1=1`, `c_2=1` and `c_n=0` for `n≥3`: a polynomial of degree `d`
  has no Amice coordinates beyond `d`. On the first block `n<p` the transition
  multiplier `m_0(n)/m_1(n)=n!` is a unit, and at `n=p` it is `p!`, of norm
  `p⁻¹=p^(−⌊p/p⌋)`.
- The derivative at zero has moments `b_n=(−1)^(n−1)/n` for `n≥1`, `b_0=0`, and
  transform `log(1+T)`, which lies on the open unit disc
  (`PowerSeries.onOpenDisc_log`) with unbounded coefficients: a distribution but
  not a bounded measure.
- `exp(p)` for odd `p` and `exp(4)` at `p=2` converge, since `‖p‖=p⁻¹<r_p` for
  odd `p` and `‖4‖=4⁻¹<r_2=2⁻¹`; `exp(2)` diverges in `ℚ_2`, since
  `‖2‖=2⁻¹=r_2`.

### Dependencies

Layers 0–3, RestrictedPowerSeries Layers 0–2 with §7.1, and
LocalFieldsRamification Layer 1 for §4.5. Sources: [Am] Théorème 2, p. 150,
Théorème 3 and Corollaire 1, pp. 159–161, Proposition 15 and §16.2, p. 177;
[Col] Théorème I.4.7 and Corollaire I.4.8, p. 15, §I.6, p. 27, §§II.2–II.4,
pp. 29–37; [ST] Theorem 2.2, p. 9; [RJW] Theorem 3.43; [Buz] §8, p. 62.

## Layer 5: Characters, specialisation and coefficient rings

### 5.1 Units and the chosen generator

In the pinned library, with nothing remaining: `q=p^TauCeti.padicUnitsDepth p`,
the multiplicative section `TauCeti.padicUnitsSection` (the Teichmüller section
for odd `p`, the sign section modulo four at `p=2`), the generator
`TauCeti.padicUnitsGenerator`, and the continuous decomposition

```text
ℤ_pˣ ≃ Δ × ℤ_p,   x ↦ (x̄, log(x/ω(x̄))/q),   γ=exp(q) ↦ (1,1),
```

as `TauCeti.padicIntUnitsEquivZModUnitsProd`, with
`TauCeti.padicIntUnitsEquivZModUnitsProd_padicUnitsGenerator` and uniqueness
`TauCeti.eq_padicIntUnitsEquivZModUnitsProd`.

### 5.2 Continuous weights and their parameters

In the pinned library: `TauCeti.WeightSpace p R`, the continuous homomorphisms
`ℤ_pˣ→Rˣ`, with no norm at the definition; its scalar character
`TauCeti.WeightSpace.weightTest`, finite part `TauCeti.WeightSpace.finiteChar`,
principal part `TauCeti.WeightSpace.principalChar` and coordinate
`T_κ=κ(γ)−1` (`TauCeti.WeightSpace.coord`); topological nilpotence of the
coordinate (`TauCeti.WeightSpace.tendsto_coord_pow`), `‖T_κ‖<1` for a
multiplicative norm and over normed `ℚ_p`-division algebras
(`TauCeti.WeightSpace.norm_coord_lt_one`,
`TauCeti.WeightSpace.norm_coord_lt_one_of_normedAlgebra`); and for a complete
ultrametric normed commutative `ℤ_p`-algebra the parametrisation of weights by
a finite character and a topologically nilpotent coordinate, in both
directions (`TauCeti.WeightSpace.ofCoord`, `TauCeti.weightSpaceEquiv`).

Targets:

- Through `TauCeti.weightSpaceEquiv`, identify the weights with values in
  `ℂ_p` with `|Δ|` copies of the open unit disc ([LWX] Notation 2.1, p. 8;
  [RJW] Remark 3.47, pp. 25–26, for odd `p`). Their analytic-space structure
  and universal analytic family are not constructed here. Field-valued weights
  take values of norm one (`ContinuousMonoidHom.norm_apply_eq_one_of_compactSpace`);
  in a general Banach algebra prove that the values of a weight form a bounded
  set, which need not have bound one. *Needs:* `TauCeti.weightSpaceEquiv`,
  `TauCeti.WeightSpace.norm_coord_lt_one_of_normedAlgebra`,
  `ContinuousMonoidHom.norm_apply_eq_one_of_compactSpace`, and compactness of
  `ℤ_pˣ` with continuity of the weight for the bounded set.
- Algebraic and locally algebraic weights: `κ(x)=x^kψ(x)` has
  `T_κ=exp(kq)ψ(γ)−1` for `k∈ℤ` and finite-order `ψ`. Separate cancellation
  and zero parameters from the valuation formula for roots of unity. For exact
  conductor `p^m`, the principal part of `ψ` has order `p^(m−1)` at odd `p`,
  `m≥2`, and order `2^(m−2)` at `p=2`, `m≥3`; consequently `v_p(ψ(γ)−1)` is
  `1/(p^(m−2)(p−1))` and `1/2^(m−3)`, respectively. Treat the smaller
  conductors separately. *Needs:* `TauCeti.WeightSpace.coord`,
  `TauCeti.padicIntUnitsEquivZModUnitsProd_padicUnitsGenerator`, and Mathlib's
  norms of `ζ−1` for prime-power roots of unity
  (`IsPrimitiveRoot.norm_sub_one_of_prime_ne_two`,
  `IsPrimitiveRoot.norm_sub_one_two`) for the valuation formula.
- For another generator `γ'=γ^u`, `u∈ℤ_pˣ`, prove `T'=(1+T)^u−1` and its
  inverse. *Needs:* `TauCeti.WeightSpace.coord`,
  `TauCeti.WeightSpace.principalChar_eq_addChar_of_value_at_one`,
  `PadicInt.addChar_of_value_at_one` for the power `(1+T)^u`.

### 5.3 Universal characters and bounded integral-measure functions

In the pinned library: the measure/completed-group-algebra equivalence
`AbstractMeasure.completedGroupAlgebraEquiv` with
`AbstractMeasure.toCompletedGroupAlgebra_dirac`; the procyclic and finite-factor
coordinates of ProfiniteProPGroups
(`TauCeti.completedGroupAlgebra.powerSeriesCoordinate`,
`TauCeti.completedGroupAlgebra.prodPowerSeriesCoordinate`); the normed universal
character, including the small-norm Banach `ℚ_p`-algebra case, as
`TauCeti.WeightSpace.ofCoord` and `TauCeti.weightSpaceEquiv`; the linear
topology of `ℤ_p` (`TauCeti.Huber.PadicInt.instIsLinearTopology`); coefficient
extension `AbstractMeasure.extendCoefficients` with
`AbstractMeasure.norm_toCLMEquiv_extendCoefficients_le`; character integration
`ContinuousMonoidHom.characterIntegralAlgHom`; and the bounded functions
`TauCeti.measureFun ν κ = ∫ κ(x) dν(x)` on weights with values in a complete
normed `ℚ_p`-field, with `|measureFun ν κ|≤‖ν_K‖≤1`
(`TauCeti.norm_measureFun_le`, `TauCeti.norm_measureFun_le_one`), separation of
integral measures (`TauCeti.measureFun_injective`) and Dirac values
(`TauCeti.measureFun_dirac`, `TauCeti.norm_measureFun_dirac`).

Targets:

- **The completed group algebra of `ℤ_pˣ`.** Extend the procyclic coordinate
  across the finite factor through `TauCeti.padicIntUnitsEquivZModUnitsProd`
  to obtain ([LWX] Notation 2.1, p. 8, for every `p`, with `q=4` at `p=2` as
  in its §1.14)

  ```text
  Λ=ℤ_p[[ℤ_pˣ]] ≃ ℤ_p[Δ]⟦T⟧,      T=[γ]−1,
  [x]=[x̄](1+T)^(log(x/ω(x̄))/q).
  ```

  The finite-factor comparison and agreement with this chosen generator are the
  targets; the inverse-limit algebra is not rebuilt. At odd `p` the integral
  finite character decomposition splits the coefficient ring. At `p=2`,
  `ℤ₂[Δ]` is local with maximal ideal `(2,δ−1)` and its series ring has maximal
  ideal `(2,T,δ−1)`; the two characteristic-zero characters do not give an
  integral product decomposition. *Needs:*
  `TauCeti.completedGroupAlgebra.prodPowerSeriesCoordinate`,
  `TauCeti.padicIntUnitsEquivZModUnitsProd`.
- **Adic target.** For a complete separated linearly topologised
  `ℤ_p`-algebra `S`, a finite-factor character and a coordinate satisfying
  `PowerSeries.HasEval` give a unique weight, `exists_character_of_hasEval`,
  and the unique continuous algebra map from `Λ`; an existing weight with
  topologically nilpotent coordinate has the binomial formula
  `eq_aeval_binomialSeries`. Use the adic convergence and continuity
  hypotheses; no normed-field instance on `S` is assumed. Both the adic and the
  normed specialisation send `T` to the coordinate and the universal character
  to the supplied weight, and agree when both sets of hypotheses hold. A
  coefficient sup-norm on integral series does not replace the profinite
  source topology. For `S=𝒪_(ℂ_p)`, which is linearly topologised and holds
  the values of every `ℂ_p`-valued weight, and odd `p`, this is [RJW] Remark
  3.47, p. 25, which uses `ℤ_pˣ=μ_(p−1)×(1+pℤ_p)`; at `p=2` the same argument
  runs with
  `q=4`, `Δ=(ℤ/4ℤ)ˣ` and the principal units `1+4ℤ_2`. *Needs:* Mathlib
  `PowerSeries.HasEval`, `PowerSeries.aeval` and `PowerSeries.binomialSeries`,
  `TauCeti.padicIntUnitsEquivZModUnitsProd`, `TauCeti.WeightSpace.finiteChar`,
  `TauCeti.WeightSpace.coord`, the completed group algebra of `ℤ_pˣ` above for
  the algebra map from `Λ`, and `TauCeti.WeightSpace.ofCoord` for the
  comparison with the normed case.
- **The Amice-coordinate comparison.** Compose §3.4's integral Amice
  equivalence with the procyclic coordinate of `Multiplicative ℤ_p` at the
  generator `ofAdd 1`, so that `δ_a` goes to `[γ^a]` and `T=[γ]−1`:
  `amiceTransform_completedGroupAlgebra_compat`. Transport it to the principal
  units of `ℤ_pˣ` along `a↦γ^a` with `γ=exp(q)`. This is not a second
  construction of the general comparison. *Needs:* §3.4's
  `AbstractMeasure.amiceTransformEquiv`, the pinned
  `AbstractMeasure.completedGroupAlgebraEquiv`
  (`NumberTheory/Padics/Measure/CompletedGroupAlgebra.lean`) and
  ProfiniteProPGroups' `TauCeti.completedGroupAlgebra.powerSeriesCoordinate`.
  Sources: [RJW] diagram (3.4), p. 18, with Proposition 3.16 and Theorem 3.25.
- **Separation by weights.** Weights separate bounded `ℂ_p`-valued measures on
  `ℤ_pˣ`, for every prime `p`: `measurePairing_injective`, through
  `ContinuousMonoidHom.characterIntegralAlgHom`; the integral case is the
  pinned `TauCeti.measureFun_injective`. The finite-order weights span the
  locally constant functions on `ℤ_pˣ`, which are dense in `C(ℤ_pˣ,ℂ_p)`.
  [RJW] Remark 3.47, p. 25, states the correspondence for odd `p`. *Needs:*
  `ContinuousMonoidHom.characterIntegralAlgHom`,
  `LocallyConstant.denseRange_toContinuousMap`, and the roots of unity of
  `ℂ_p` for the finite-order weights.
- **Specialisation of measure functions.** Prove compatibility of
  `TauCeti.measureFun` with specialisation of `Λ`: for an integral measure `ν`
  and a `ℂ_p`-valued weight `κ`, `TauCeti.measureFun ν κ` is the image of the
  completed-group-algebra element of `ν` under the unique continuous
  `ℤ_p`-algebra map `Λ→𝒪_(ℂ_p)` extending `κ`; both sides send `δ_x` to `κ(x)`
  (`TauCeti.measureFun_dirac`). This is a bounded function on a set of weights;
  a geometric weight-space sheaf or a topology on the space of measures is not
  constructed. *Needs:* `TauCeti.measureFun`,
  `AbstractMeasure.completedGroupAlgebraEquiv`, the adic target above for the
  algebra map, `AbstractMeasure.extendCoefficients`.

### 5.4 Analytic levels of weights

Target: let `K` be a complete ultrametric normed `ℚ_p`-algebra with
multiplicative norm, in particular a complete normed field over `ℚ_p`, and `κ`
a `K`-valued weight. The principal part `s↦κ(γ^s)=(1+T_κ)^s`
(`TauCeti.WeightSpace.principalChar`) lies in the image of `LA_h(K)` exactly
when `‖T_κ‖ < p^(−1/((p−1)p^h))`. This is §4.6's `exists_eval_eq_addChar_iff`
at `t=T_κ`, because the pinned
`TauCeti.WeightSpace.principalChar_eq_addChar_of_value_at_one` identifies the
principal part with `χ_(T_κ)`. What this section adds is the reading on
`ℤ_pˣ`. Through `x↦log(x/ω(x̄))/q` (`TauCeti.padicIntUnitsEquivZModUnitsProd`),
the cosets of `1+p^(h')ℤ_p` in `ℤ_pˣ`, for a unit level `h'=h+v_p(q)`, go to
the discs of `ℤ_p` modulo `p^h`. For such `h'`, `κ` is analytic on the unit
discs modulo `p^(h')`, that is, it agrees on `ℤ_pˣ` with the evaluation of a
vector of `LA_(h')(K)`, exactly when

```text
‖κ(exp(p^(h')))−1‖ < r_p,
equivalently ‖T_κ‖ < p^(−q/(p^(h')(p−1))) = p^(−1/((p−1)p^h)),
```

the level `h=h'−v_p(q)` of the principal part, since `q=p^(v_p(q))`:
`exists_eval_eq_weight_iff`, stated with the stage `LA_(h+v_p(q))(K)` and the
radius `TauCeti.amiceRadius p h`. The unit level is needed: at `p=2` the sign
weight has `T_κ=0` but is not analytic on `1+2ℤ_2` (see the Checks).

Route: take for `a` the natural representative of a unit residue class modulo
`p^(h')` and write `x=a(1+p^(h')w)`, `w∈ℤ_p`. Then
`κ(x)=κ(a)·(1+T')^(σ(w))`, with `1+T'=(1+T_κ)^(p^h)=κ(exp(p^(h')))` and
`σ(w)=log(1+p^(h')w)/p^(h')`. The series `σ` and
`τ(y)=(exp(p^(h')y)−1)/p^(h')` have the coefficients `±p^(h'(n−1))/n` and
`p^(h'(n−1))/n!`, of valuation at least `(n−1)(h'−1/(p−1))`, so for
`h'≥v_p(q)` they are integral and tend to zero; they are inverse to each other
on `ℤ_p` by the pinned `Padic.log_exp` and `Padic.exp_log` at depth `h'`. For
"if", `‖T'‖<r_p` and the level-zero expansion of `χ_(T')`
(`TauCeti.AnalyticStage.eval_addCharExpansion`), composed with `σ` and with the
integral linear change `w'=aw` to the stage coordinate `x=a+p^(h')w'`, expands
`κ` on each unit disc. For "only if", the expansion on the disc of `1`
composed with `τ` is a level-zero expansion of `χ_(T')`, and
`exists_eval_eq_addChar_iff` at level zero gives `‖T'‖<r_p`. Both directions
end with the equivalence `‖(1+t)^(p^h)−1‖<r_p ⇔ ‖t‖<r_h` of §4.6.

Every continuous field-valued weight satisfies the criterion for some `h'`
(`TauCeti.AnalyticStage.exists_eval_eq_addChar`; [Col] §I.6, p. 27: a
continuous `ℂ_p`-valued character of `ℚ_pˣ`, such as a weight extended by
`δ(p)=1`, is `x↦exp(w log x)` on some `1+p^nℤ_p`, hence analytic on the cosets
of that subgroup). Give the locally algebraic
conductor bound, handling the minimum allowed level and the trivial
finite-order character separately: for `κ(x)=x^kψ(x)` with conductor dividing
`p^m`, every `h'≥max(m,v_p(q))` suffices. For Banach-algebra coefficients use
sufficient convergence conditions and an explicit bound on the resulting
expansion; compactness alone does not give norm one. *Needs:*
`exists_eval_eq_addChar_iff` (§4.6) with its equivalence
`‖(1+t)^(p^h)−1‖<r_p ⇔ ‖t‖<r_h`,
`TauCeti.WeightSpace.principalChar_eq_addChar_of_value_at_one`,
`TauCeti.WeightSpace.coord`, `TauCeti.padicIntUnitsEquivZModUnitsProd`,
`TauCeti.amiceRadius`, `TauCeti.AnalyticStage.eval_addCharExpansion`, the
pinned `Padic.log_exp` and `Padic.exp_log` for `σ` and `τ`, RestrictedPowerSeries
§2.2 (substitution) for composing an expansion with `σ`, `τ` and `w'=aw`, and
the valuation formula of §5.2 for the conductor bound.

### 5.5 Scalar analytic factors for automorphic applications

Target: let `K` be a complete normed extension of `ℚ_p` and `κ` a `K`-valued
weight that is analytic on unit discs modulo `p^(h')` for a unit level
`h'≥v_p(q)`, that is (§5.4), `‖t_(h')‖<r_p` for `t_(h')=κ(exp(p^(h')))−1`; this
is the principal-part level `h'−v_p(q)` of the §5.4 criterion.
The bound `h'≥v_p(q)` gives `‖p^(h')‖<r_p`, so `exp(p^(h'))` converges. Extend
`κ` analytically from `1+p^(h')ℤ_p` to `1+p^(h')𝒪_K` by
`κ(1+u)=exp((log(1+u)/p^(h'))·log(1+t_(h')))`, which agrees with `κ` on
`1+p^(h')ℤ_p`, and to `ℤ_pˣ(1+p^(h')𝒪_K)` multiplicatively. For
`d∈ℤ_pˣ(1+p^(h')𝒪_K)` and `‖c‖≤‖p^(h')‖`, expand `κ(cz+d)` on the closed unit
disc and prove its Gauss norm is one. A radius `r>0` satisfying

```text
r‖c‖ < r_p,       r‖c‖‖t_(h')‖ < ‖p^(h')‖ r_p
```

gives convergence on that radius, Gauss norm at most one, and coefficient
bounds `‖a_n‖≤r^(−n)`. The universal form of this expansion,
`[cz+d]=[d₀](1+T)^(log((cz+d)/d₀)/q)` with `d₀` the finite part of `d`, is in
the proof of [LWX] Proposition 3.14, p. 21, at `h'=v_p(q)`; the scalar
expansion is its specialisation at `κ`. State the corresponding Banach-algebra
version with the actual bound on the constant factor and on the analytic
character. Use
RestrictedPowerSeries for composition and coefficient estimates. For
nonnegative algebraic weight the expansion agrees with `(cz+d)^k`. Matrix
actions and the ordering convention in their cocycle identity belong to
quaternionic modular-form theory; this section gives only scalar expansions.
*Needs:* the §5.4 criterion at the principal-part level `h'−v_p(q)`, the
first two targets of §4.5 for the extension to `1+p^(h')𝒪_K`,
RestrictedPowerSeries §§1.1 and 2.2 (Gauss norms, substitution) for the
composition and the coefficient bounds,
`TauCeti.WeightSpace.principalChar` and
`TauCeti.padicIntUnitsEquivZModUnitsProd`.

### 5.6 An annular coefficient ring

Target: construct the integral coefficient ring with normal forms

```text
H = {Σ_(m∈ℤ) d_m T^m : d_m∈ℤ_p, v_p(d_m)≥max(0,−m)}.
```

Prove convergence of each convolution coefficient, the algebra operations, and
the algebraic identification `H≃ℤ_p[[T,U]]/(TU−p)` with `U=p/T`. This includes
arbitrary formal tails in `U`. It is not the `p`-adic completion of the
polynomial algebra `ℤ_p[[T]][p/T]`: that completion requires additional decay
of the `U`-coefficients. Do not conflate the formal `(T,U)` topology with the
gauge used below. *Needs:* Mathlib `MvPowerSeries`, `Ideal.Quotient.mk` and
`Ideal.span` for `ℤ_p[[T,U]]/(TU−p)`, and the `p`-adic valuation on `ℤ_p` for
the normal forms.

On `H[1/T]`, establish the coefficient criterion `v_p(d_m)≥max(0,−m−k)` for
some `k≥0`, allowing `d_m∈ℤ_p`. For a fixed `α∈(0,1)`, construct the complete
multiplicative-`T` gauge whose unit ball is `H` and `‖T‖=α`, and prove that it
is a nonarchimedean Banach–Tate ring (`TauCeti.NormedRing.IsTate`). State
completeness for this gauge topology. In particular `‖U‖=1`; the partial sums
of `Σ_(j≥0) U^j` do not converge in this topology even though the formal sum
is an element of `H`. *Needs:* the ring `H` above, `TauCeti.NormedRing.IsTate`
and `TauCeti.NormedRing.PseudoUniformizer` (with `ϖ=T`) for the gauge,
`TauCeti.NormedRing.IsTate.isTateRing` for the topological property.

At every `t∈ℂ_p` with `p⁻¹<|t|<1`, construct the evaluation `T↦t, U↦p/t` of
`H[1/T]` and prove its continuity for the gauge using divisibility bounds. A
general gauge-continuous specialisation need not be Lipschitz for arbitrary
choices of `α`. *Needs:* the gauge above and Mathlib's `PadicComplex`.

The evaluations over this annulus are jointly injective on `H`. Through
`H≃ℤ_p[[T,U]]/(TU−p)`, a series `f=Σ a_(ij)T^iU^j` with `a_(ij)∈ℤ_p` has value
`Σ a_(ij)t^i(p/t)^j=0` at every such `t` exactly when `f` is a multiple of
`TU−p`: `mem_span_iff_forall_eval_annulus`. The values converge, since
`|t^i(p/t)^j|=|t|^i(p⁻¹/|t|)^j` tends to zero, and evaluation is
multiplicative, so the multiples of `TU−p` vanish. Conversely, the value is
`Σ_(m∈ℤ) d_m t^m` with the normal-form coefficients `d_m=Σ_(i−j=m) a_(ij)p^j`
of `f`, and the normal form is zero exactly when `f` is a multiple of `TU−p`.
For a nonzero normal form take a radius `ρ∈p^ℚ∩(p⁻¹,1)` at which one term
`‖d_m‖ρ^m` strictly dominates the others (all but finitely many radii of each
closed sub-interval); every `t` with `|t|=ρ` then gives a nonzero value. No
`t∈ℚ_p` has `p⁻¹<|t|<1`, because `|ℚ_pˣ|=p^ℤ`, so `ℚ_p` alone cannot test
injectivity. This statement does not involve the gauge. *Needs:* the ring `H`
and its identification with `ℤ_p[[T,U]]/(TU−p)` above, Mathlib's
`PadicComplex` with its dense algebraically closed subfield `PadicAlgCl` for
points of every norm in `p^ℚ`, and `HasSum.norm_eq_of_forall_norm_lt` (§0.1)
for the dominant term.

Adjoin the finite factor by `H[Δ]`, compare it with the halo coefficient ring
`ℤ_p⟦T,pT⁻¹⟧⊗ℤ_p[Δ]` of [LWX] Lemma 3.15, p. 21, and track the ideal `(p,T)=(T)` of
the principal coefficient ring. At `p=2`, the full finite-factor maximal ideal
also contains `δ−1`; retain the integral group ring. Annular geometry,
Fredholm series and slope bounds are outside this roadmap. *Needs:* the ring
`H` above, Mathlib `MonoidAlgebra` for `H[Δ]` and
`TauCeti.padicIntUnitsEquivZModUnitsProd` for the finite factor.

### Examples

**Checks.**

- At `p=2`, `Δ=(ℤ/4ℤ)ˣ={±1}` has the trivial and the sign character `ε`. The
  weight `x↦ε(x mod 4)` has finite part `ε` and coordinate
  `T=ε(exp(4))−1=0`, since `exp(4)≡1 mod 4`, so it shares its coordinate with
  the trivial weight and is told apart only by its finite part. The weight
  `κ(x)=x` also has finite part `ε`, through the sign section `ω(±1)=±1`, and
  `‖T_κ‖=‖exp(4)−1‖=4⁻¹`. The choice `q=4` is forced: `exp(2)` diverges in
  `ℚ_2`, since `‖2‖=2⁻¹=r_2`.
- Specialisation at the trivial weight sends `T↦0` and every `[x]↦1`, the
  binomial formula giving `1·(1+0)^(s(x))=1`. At `κ(x)=x^k`, `k∈ℤ`, the finite
  part is `x̄↦ω(x̄)^k` and `T_κ=exp(kq)−1`, and the formula returns
  `ω(x̄)^k exp(kq·s(x))=ω(x̄)^k(x/ω(x̄))^k=x^k`, with `s(x)=log(x/ω(x̄))/q`.
  Dropping the finite part would give `(x/ω(x̄))^k`, which is `1` instead of
  `−1` at `x=−1` for odd `k`.
- Generator change at `γ'=γ^(−1)` for `κ(x)=x`: the formula `T'=(1+T)^u−1`
  at `u=−1` gives `T'=exp(−q)−1=−T_κ/(1+T_κ)`, of norm `‖q‖`. The linearised
  `T'=−T_κ` differs from it by `T_κ²/(1+T_κ)`, of norm `‖q‖²`.
- The trivial weight has `T_κ=0` and is analytic at every level; the weight
  `κ(x)=x` over `ℚ_p` has `‖T_κ‖=‖exp(q)−1‖=‖q‖`, below `r_0=p^(−1/(p−1))`
  for every `p` (`p⁻¹<p^(−1/(p−1))` for odd `p`, `4⁻¹<2⁻¹` at `p=2`), so its
  principal part is analytic on all of `ℤ_p`: `x↦x` is analytic on the cosets
  of `1+qℤ_p`.
- The unit level in §5.4 cannot drop below `v_p(q)`. At `p=2` the sign weight
  `x↦ε(x mod 4)` has `T_κ=0<r_h` for every `h`, and it is constant on the
  cosets of `1+4ℤ_2`, as `exists_eval_eq_weight_iff` at `h=0` requires. On
  `1+2ℤ_2`, the single unit disc modulo `2`, it is not analytic over `ℚ_2`: an
  expansion
  `G` in `x=1+2w` would have `G(w)=1` for every even `w` and `G(w)=−1` for every
  odd `w`, while a restricted series equal to `1` at infinitely many points of
  `ℤ_2` is constant (Strassmann). The level `h'=1` would thus pair a true
  radius condition with a false analyticity statement.
- Conductors at odd `p`: for `ψ` of exact conductor `p^m`, `m≥2`, `ψ(γ)` is a
  primitive `p^(m−1)`-th root of unity and `‖T_ψ‖=p^(−1/(p^(m−2)(p−1)))=r_(m−2)`
  (§5.2), so the criterion holds at the unit level `h'=h+1` exactly when
  `h≥m−1`, that is `h'≥m`. This matches the weight itself: it is constant on
  the cosets of `1+p^mℤ_p`, while on a coset of `1+p^(m−1)ℤ_p` it is locally
  constant with `p` values and so not analytic. At `p=3`, `m=2`:
  `‖ζ_3−1‖=3^(−1/2)=r_0` is not below `r_0`, so `h'=1` fails and `h'=2` holds.
- §5.5 for `κ(x)=x` at the unit level `h'=v_p(q)` and `r=1`:
  `t_(h')=exp(q)−1` has norm `‖q‖`, the radius conditions read
  `‖c‖≤‖q‖<r_p` and `‖c‖‖q‖≤‖q‖²<‖q‖r_p`, and `κ(cz+d)=cz+d` has Gauss norm
  `max(‖c‖,1)=1`. Reading the principal-part level `h=0` of §5.4 as a unit
  level instead would ask for `exp(p⁰)=exp(1)`, which diverges since
  `‖1‖=1≥r_p`.
- In `H`, `TU=p`, the normal form with `d_0=p` and all other `d_m=0`, while
  neither factor is a unit: an inverse of `T` would have `d_(−1)=1`, against
  `v_p(d_(−1))≥1`, and an inverse of `U` would be `T/p`, with `d_1=p⁻¹∉ℤ_p`.
- `Σ_(j≥0)U^j`, the element with `d_(−j)=p^j` for `j≥0`, satisfies
  `(1−U)Σ_jU^j=1`, so it is `(1−U)⁻¹` in `H`. In the gauge `‖U^j‖=1` for every
  `j`, because `U^j=p^jT^(−j)` lies in `H` and `U^j/T` does not
  (`v_p(p^j)=j<j+1`); consecutive partial sums differ by norm one, so the
  series does not converge although its formal sum is an element of `H`.
- `Σ_jU^j` is not in the `p`-adic completion of `ℤ_p[[T]][p/T]`: there
  `v_p(d_(−j))−j→∞`, since an element is a polynomial in `U` plus `p^N` times
  an element whose coefficients satisfy `v_p(d_(−j))≥j`, whereas here
  `v_p(p^j)−j=0` for every `j`.
- At `p=2`, `H[Δ]=H[δ]/(δ²−1)` has only the idempotents `0` and `1`: an
  idempotent `a+bδ` needs `a²+b²=a` and `b(2a−1)=0`; as `2a−1` is a unit of the
  local ring `H`, `b=0` and `a∈{0,1}`. The splitting idempotents `(1±δ)/2` need
  `2` inverted, so `H[Δ]` is not `H×H`. At odd `p` the idempotents
  `(p−1)⁻¹Σ_δ χ(δ)⁻¹δ` of the characters `χ` of `Δ` are integral and
  `H[Δ]≅H^(p−1)`.
- Under specialisation at a weight `κ`, `(1+T)^n↦κ(γ^n)` for `n∈ℕ` and
  `(1+T)⁻¹=Σ_j(−T)^j↦κ(γ)⁻¹`; the truncation `1−T` would give `2−κ(γ)`, which
  differs from `κ(γ)⁻¹` by `T_κ²/(1+T_κ)`.
- In the maximum-norm dual-number algebra, `s↦1+sε` has `‖T_κ‖=1` and
  evaluation `F↦coeff₀(F)+coeff₁(F)ε`; it lies outside the small-norm
  subfamily.
- The coordinate `p` gives evaluation into both `ℤ_p` and `ℚ_p`, although
  `ℚ_p` is not linearly topologised over itself. The coordinate `p−1` does not
  give continuous evaluation into `ℚ_p`.
- Dirac integration gives `measureFun δ_x κ=κ(x)` (`TauCeti.measureFun_dirac`).
  Multiplicativity on convolution of Dirac measures, additivity on their sum,
  and the measure `δ_a−δ_b`, `a≠b`, vanishing at the trivial weight but taking
  the value `a−b≠0` at `κ(x)=x`, are examples in
  `NumberTheory/Padics/Measure/Units/WeightIntegral.lean`; every Dirac measure
  attains the bound (`TauCeti.norm_measureFun_dirac`).

### Dependencies

Layers 0–4, RestrictedPowerSeries, LocalFieldsRamification and
ProfiniteProPGroups' Layer 9 prerequisites. Sources: [Col], [RJW] §§3–4, [JN]
and [LWX] §§2–3, Lemma 3.15.

## Downstream consumers

- AdicSpacesPartII §R0.4 consumes the gauge contract of §0.4, under the names
  `tateGauge`, `exists_tateSeminorm`, `tateGauge_eq_zero_iff`,
  `tateGauge_equiv` and `tateGauge_rpow`, which are the pinned
  `TauCeti.Huber.*` declarations of §0.4.
- AdicSpacesPartIII §R3.6 consumes the splitting of §2.4
  (`TauCeti.exists_continuousLinearEquiv_prod_of_countableType`) and its
  completed-extension corollary for its `countable-type-closed-subspace-section`
  interface; Part III keeps the geometric application.
- CompactOperators consumes the matrix convention of §2.6
  (`ContinuousLinearMap.matrixCoeff`) and the Amice transition estimate of
  §4.4.
- LocallyAnalyticDistributions consumes §0.4, §§1.2, 1.4, 2.1–2.2, 2.4, 2.6
  (including the input-first adapter) and §§4.3–4.7, in particular the carrier
  `distributions`, the bijection `amiceTransform_distribution_bijective`, the
  integration of characters, the point masses and the convolution identity of
  §4.7; the topology on `LA(ℤ_p,E)`, the strong dual and the general
  distribution product are its own. Its names `amiceDualNorm` and
  `amiceDiscNorm` refer to `TauCeti.amiceDualNorm` and to
  `PowerSeries.gaussNorm` at the radius `TauCeti.amiceRadius p h`, and
  `amiceDiscNorm_le_amiceDualNorm` and `amiceDualNorm_le_amiceDiscNorm` to
  `TauCeti.gaussNorm_amiceRadius_le_amiceDualNorm` and
  `TauCeti.amiceDualNorm_le_mul_gaussNorm_amiceRadius_succ`.
- PadicMeasuresIwasawaAlgebras consumes §3.4, §§5.1–5.3 and the comparison
  `amiceTransform_completedGroupAlgebra_compat` of §5.3. The names it cites refer
  to pinned declarations: `phiMeasure`, `pMultiplesIndicator`,
  `existsUnique_psiMeasure`, `amiceTransform_phiMeasure`,
  `mem_range_amiceTransform_iff`, `norm_toCLMEquiv_eq_iSup_coeff` and
  `existsUnique_integral_iff_norm_le_one` are the `AbstractMeasure.*`
  declarations of §3.4, and `weightMeasure` is `AbstractMeasure.weight`;
  `WeightSpace` and `weightTest` are `TauCeti.WeightSpace` and
  `TauCeti.WeightSpace.weightTest`; `nonempty_weightSpace_equiv` and
  `existsUnique_character_of_norm_lt_one` are `TauCeti.weightSpaceEquiv` and
  `TauCeti.WeightSpace.ofCoord`; `extendIntegralMeasure` is
  `AbstractMeasure.extendCoefficients`; `measureFun`, `measureFun_norm_le` and
  `measureFun_injective` are `TauCeti.measureFun`, `TauCeti.norm_measureFun_le`
  and `TauCeti.measureFun_injective`; `amiceTransform` is Mathlib's
  `AbstractMeasure.amiceTransform`; `TCoord γ κ=κ(γ)−1` at the generator
  `γ=TauCeti.padicUnitsGenerator p` is `TauCeti.WeightSpace.coord κ`.
  `exists_character_of_hasEval` and `eq_aeval_binomialSeries` are targets of
  §5.3. The clause numbers it cites map to the sections here as follows.

  | Former clause | Now |
  | --- | --- |
  | §3.4, clauses 1, 4 and 5 | §3.4, "In the pinned library": Mahler duality, the bounded Amice transform and its range, the integral equivalence and the rational dual unit ball, `φ` and `ψ` |
  | §5.1, clause 1 | §5.1 |
  | §5.2, clauses 1 and 2 | §5.2, "In the pinned library" (`TauCeti.WeightSpace`, `TauCeti.weightSpaceEquiv`, `TauCeti.WeightSpace.coord`) and its first target, the `ℂ_p`-valued weights as open discs |
  | §5.3, clauses 1 and 3 | §5.3, the completed group algebra of `ℤ_pˣ` and the adic target, with the normed case `TauCeti.WeightSpace.ofCoord` in the pinned library |
  | §5.3, clause 4 | §5.3, the Amice-coordinate comparison |
  | §5.3, clause 5 | §5.3, `TauCeti.measureFun` in the pinned library, with the targets separation by weights and specialisation of measure functions |

## References

* **[Serre]** J.-P. Serre, *Endomorphismes complètement continus des espaces
  de Banach p-adiques*, Publ. Math. IHÉS **12** (1962), 69–85.
* **[Sch]** P. Schneider, *Nonarchimedean Functional Analysis*, Springer,
  2002, especially §§8–10.
* **[Bel]** J. Bellaïche, *The Eigenbook*, Birkhäuser, 2021, Chapter II.
* **[Buz]** K. Buzzard, [*Eigenvarieties*](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf),
  in *L-functions and Galois Representations*, LMS Lecture Note Series **320**
  (2007), especially Lemmas 2.2–2.3 for finite-coordinate detection and
  closedness, and §8, p. 62, for the exponential and logarithm on affinoid
  algebras. The Banach–Tate extension uses [JN] §2.1's shell scaling.
* **[BGR]** S. Bosch, U. Güntzer and R. Remmert, *Non-Archimedean
  Analysis*, Springer, 1984, especially §§2.7 and 3.7.
* **[Conrad]** B. Conrad, [*Irreducible components of rigid spaces*](https://math.stanford.edu/~conrad/papers/irredpaper.pdf),
  Ann. Inst. Fourier **49** (1999), especially Lemma 1.1.5.
* **[JN]** C. Johansson and J. Newton,
  [*Extended eigenvarieties for overconvergent cohomology*](https://arxiv.org/abs/1604.07739),
  corrected version 4, §2.1.
* **[KL]** K. S. Kedlaya and R. Liu,
  [*Relative p-adic Hodge theory: Foundations*](https://arxiv.org/abs/1301.0792),
  §2.4, Remark 2.4.4; retain the gauge hypotheses made explicit in §0.4.
* **[Mah]** K. Mahler, *An interpolation series for continuous functions of
  a p-adic variable*, J. reine angew. Math. **199** (1958), 23–34.
* **[Am]** Y. Amice, *Interpolation p-adique*, Bull. Soc. Math. France
  **92** (1964), 117–180.
* **[Col]** P. Colmez,
  [*Fonctions d'une variable p-adique*](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf),
  especially I.3–I.4 and II.2–II.4.
* **[ST]** P. Schneider and J. Teitelbaum, [*p-adic Fourier theory*](https://arxiv.org/abs/math/0102012),
  Documenta Math. **6** (2001), 447–481; page numbers refer to the arXiv
  version math/0102012v1.
* **[RJW]** J. Rodrigues Jacinto and C. Williams,
  [*An Introduction to p-adic L-functions*](https://arxiv.org/abs/2309.15692),
  especially §§3–4, Proposition 3.16, Theorem 3.25, Theorem 3.43 and
  Remark 3.47.
* **[LWX]** R. Liu, D. Wan and L. Xiao,
  [*The eigencurve over the boundary of weight space*](https://arxiv.org/abs/1412.2584),
  especially §§2–3.
