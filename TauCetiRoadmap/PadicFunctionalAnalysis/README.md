# P-adic functional analysis

Build the functional analysis of nonarchimedean Banach modules and the analysis
of continuous and locally analytic functions on `ℤ_p`: Banach–Tate operator
theory, orthonormalisable modules, Mahler and Amice coordinates, quantitative
distribution estimates, and continuous characters of `ℤ_pˣ` with their
specialisation maps. These interfaces serve Fredholm theory, Iwasawa theory,
adic geometry and families of automorphic forms.

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
theorems of §§4.4, 4.6, 5.3 and 5.4 that the pinned libraries do not prove.

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
the sup norm (`ZeroAtInftyContinuousMap.norm_tsum_smul_le`).

Target: a family of null families is summable in the sup-norm space when its
sup norms tend to zero; pointwise decay alone is insufficient
(`ZeroAtInftyContinuousMap.not_tendsto_single_cofinite` is the obstruction).

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

**Checks.** Equal topology alone does not give a linear comparison of ring
norms: compare `|·|` and `|·|²` on `ℚ_p`. Over `ℂ_p`, rounding the norm to
`p^ℤ` does not preserve the original scalar inequality.

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
  original topological ring is complete. Keep the normed-to-topological
  implication and the topological-to-chosen-gauge construction separate; do
  not install them as mutually inverse global instances. *Needs:*
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
- Still to formalise: the zero ring has zero gauge.
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
generally the supremum of values on the unit ball.

Target: the zero-module case of Neumann inversion, where the inverse has norm
zero. *Needs:* `ContinuousLinearMap.oneSub`,
`ContinuousLinearMap.ringOpNorm_oneSub_symm` (stated for a nontrivial module)
and `ContinuousLinearMap.ringOpNorm` on the zero module.

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

Target: under discrete valuation prove the orthogonal version (`t=1`, compare
`TauCeti.isTOrthogonalFamily_one_iff`) using finite-dimensional distance
attainment: the distances from a vector to a closed subspace lie in the
discrete set `r^ℤ∪{0}`, so their infimum is attained. No spherical
completeness is assumed for the general field case. *Needs:*
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
the topological results above apply to it. Do not require a Noetherian ring of
definition when only the Tate ring is Noetherian. General Banach modules are
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
(`TauCeti.isONable_iff_free_residueModule`); over a residue field every module
is potentially orthonormalisable, isometrically exactly when its nonzero norms
lie in the value group (`TauCeti.isPotentiallyONable_of_discrete_norm`,
`TauCeti.isONable_iff_discrete_norm`); cardinality invariance
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

Target: for a complete isometric extension `K'/K`, extend this splitting and
its inverse to show that `K'⊗̂_K(−)` preserves strict exactness, on the pinned
completed tensor `TauCeti.Huber.BanachModule.CompletedTensor K K' V`, with
`TauCeti.Huber.BanachModule.CompletedTensor.map` for the induced maps and
`TauCeti.Huber.BanachModule.CompletedTensor.lift` for its universal property.
The corollary describes exactness for those native maps.
*Needs:* `TauCeti.exists_continuousLinearEquiv_prod_of_countableType`,
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
- Permutation operators; over a field, a diagonal with nonzero entries is
  injective with dense range, and invertible exactly when its inverse is
  bounded. *Needs:* `ZeroAtInftyContinuousMap.congrLeft` for the permutation
  of the index, `ZeroAtInftyContinuousMap.diagonalCLM` with
  `ZeroAtInftyContinuousMap.ringOpNorm_diagonalCLM`,
  `ZeroAtInftyContinuousMap.dense_setOf_finite_support`.
- Over a Noetherian Banach–Tate ring, every finite submodule of `C₀(I,R)` is
  closed, so `Submodule.exists_finset_norm_le` applies to it. No freeness of
  `P` is assumed. Follow [Buz] Lemma 2.3(b): a finite coordinate set `S` on
  which the projection is injective on `P` exists because the ring is
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

- A rescaled one-dimensional `ℚ_p`-space can be potentially but not
  isometrically orthonormalisable.
- A singleton satisfying orthogonality does not make a torsion
  `ℚ_p⟨X⟩`-module free.
- The shift is bounded.
- A matrix with entry `p` everywhere below the diagonal has non-null columns
  and is excluded, and a bidiagonal `1+pS` is an isometric automorphism (both
  are examples in `Topology/ContinuousMap/ZeroAtInfty/Triangular.lean`).
- Split the constant-term sequence of `K⟨T⟩` and the two degenerate exact
  sequences, also after completed extension.
- For the transpose adapter, a `2×3` and a `3×2` matrix over `ℚ_p` composed in
  both orders show `B(u∘v)=B(v)B(u)`, the reverse of the order for
  `ContinuousLinearMap.matrixCoeff_comp`.
- For `P=0`, use `S=∅, C=1`; for a coordinate line or a module supported on a
  fixed finite set, take that coordinate set and `C=1`.

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
`‖g‖`; when `E≠0` and the action satisfies `NormSMulClass R E` (in particular
for `E=R` with `NormOneClass R`), its operator norm is `‖g‖`, attained on a
nonzero constant function, so it is contractive exactly when `‖g‖≤1`.
*Needs:* Mathlib `ContinuousMap.norm_le` and `ContinuousMap.norm_coe_le_norm`
for the sup norm, `IsBoundedSMul R E` for the bound and `NormSMulClass R E`
for the converse.

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
- A van der Put coefficient with leading digit greater than one, Dirac measures
  of norm one (`TauCeti.AbstractMeasure.norm_dirac`), `p⁻¹δ₀` outside and `0`
  inside the rational dual unit ball, the sequence `p^(−n)` not being a moment
  sequence, and at `p=3` the identities `φδ₂=δ₆`, `ψδ₆=δ₂`, `ψδ₁=0`, `ψδ₀=δ₀`
  are examples in the pinned files of §§3.3–3.4; `(φμ)(1)=μ(1)` is
  `AbstractMeasure.phiMeasure_apply_one`.
- Still to formalise: the Amice identity sends `δ₀,δ₁,0` to `1,(1+T)^p,0`,
  from `AbstractMeasure.amiceTransform_dirac` and
  `AbstractMeasure.phiMeasure_dirac`.

### Dependencies

Layers 0–2, Mathlib's Mahler and measure APIs, and RestrictedPowerSeries §7.1.
Sources: [Mah], [Am], [Col] I.3 and [RJW] §3.

## Layer 4: Analytic stages and distributions on `ℤ_p`

### 4.1 Analytic coefficient models

In the pinned library: the stage carrier `TauCeti.AnalyticStage p h E`, kept
distinct from its evaluated functions, and evaluation
`TauCeti.AnalyticStage.eval` into continuous functions.

Target: consume the restricted-series carrier, unit-radius `C₀` comparison,
evaluation, translation and differentiation from RestrictedPowerSeries, using
its module-valued coefficient model, and compare it with
`TauCeti.AnalyticStage`. Evaluation on a bounded set lands in bounded
continuous functions; do not assume that the unit ball of a general
coefficient ring is compact. For algebra coefficients one injectivity
hypothesis is a separating family of bounded maps to complete nonarchimedean
fields, as in RestrictedPowerSeries; a Banach `ℚ_p`-module instead has the
injectivity of §4.4; a general bounded `ℤ_p`-module has neither. *Needs:*
RestrictedPowerSeries §§0.3, 1.1 and 2.1–2.3 (module-valued coefficients,
Gauss norms, evaluation, translation and Hasse derivatives),
`TauCeti.AnalyticStage`, `TauCeti.AnalyticStage.eval`,
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

- **Amice's theorem** ([Am]; [Col] Théorème I.4.7). For complete ultrametric
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
  coefficients. *Needs:* `amiceMap_bijective_and_norm_eq`,
  `TauCeti.AnalyticStage.eval_amiceMap`, `TauCeti.AnalyticStage.eval_injective`.
- Local analyticity is equivalent to positive lower exponential decay of
  `‖a_n‖`: `liminf_n (−log_p‖a_n‖)/n>0`, allowing `+∞` for zero coefficients
  and ignoring `n=0` ([Col] Corollaire I.4.8). *Needs:* the level-`h`
  criterion above and `TauCeti.LocallyAnalytic.range_eval_eq_iSup`.
- The transition in Amice coordinates is diagonal with multiplier
  `m_h(n)/m_(h+1)(n)`, whose norm tends to zero
  (compare `TauCeti.norm_factorial_le_mul_amiceRadius_succ_pow`).

### 4.5 Exponential, logarithm and binomial evaluation

In the pinned library: the exponential and logarithm on `ℚ_p`
(`Padic.norm_exp_sub_one`, `Padic.log_exp`, `Padic.exp_log`, `Padic.log_mul`)
and on finite extensions (`TauCeti.hasSum_exp_of_mem_maximalIdeal_pow`,
`TauCeti.exp_add_of_mem_maximalIdeal_pow`,
`TauCeti.hasSum_log_of_mem_unitFiltration_one`); the character `(1+t)^x` for
topologically nilpotent `t` (`PadicInt.addChar_of_value_at_one`) and continuity
of the binomial series in the exponent (`PadicInt.continuous_binomialSeries`).

Targets: for a commutative Banach `ℚ_p`-algebra with bounded scalar action,
the logarithm on `‖u‖<1` and the exponential on `‖z‖<r_p=p^(−1/(p−1))`, with
inverse and addition formulas on the stated domains. Exact norm identities use
a normed-field or isometric-scalar hypothesis; do not infer a Banach-algebra
identity from field-valued evaluations alone. Prove `(1+t)^x=exp(x log(1+t))`
on the common convergence domain, power-contraction estimates, and
compatibility with the local-field exponential and logarithm of
LocalFieldsRamification. Integral exponents are not arbitrary elements of the
unit ball of a coefficient algebra. *Needs:* `Padic.log_exp`, `Padic.exp_log`,
`Padic.norm_exp_sub_one`, `TauCeti.hasSum_exp_of_mem_maximalIdeal_pow`,
`TauCeti.hasSum_log_of_mem_unitFiltration_one`,
`PadicInt.addChar_of_value_at_one`, `PadicInt.continuous_binomialSeries`, and
LocalFieldsRamification Layer 1, deep units in mixed characteristic
(`TauCeti.deepUnitExpLogEquiv`), for the compatibility.

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
`exists_eval_eq_addChar_iff`, stated with the radius `TauCeti.amiceRadius p h`.
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

Targets:

- For a complete normed extension `K/ℚ_p`, the carrier `D(ℤ_p,K)` of
  `K`-linear functionals on `TauCeti.LocallyAnalytic p K K` whose restrictions
  to every stage are bounded, equivalently compatible stage functionals, with
  the stage operator seminorms and no global topology.
- For `b_n=μ(binom(−,n))`, the stage norm of `μ` is `D_h(b)` with
  `D_h(b) = sup_n ‖b_n‖ ‖⌊n/p^h⌋!‖`, so the two inequalities above become
  inequalities of distribution norms. *Needs:* `amiceMap_bijective_and_norm_eq`
  and `TauCeti.amiceDualNorm`.
- The Amice bijection between `D(ℤ_p,K)` and the open-unit-disc series algebra
  of RestrictedPowerSeries, with its inverse and uniqueness. A bound at one
  level is insufficient.
- Continuous measures as distributions, Dirac transforms `(1+T)^x`
  (`AbstractMeasure.amiceTransform_dirac` for measures), additive convolution by
  the bounded two-variable test-function pairing with its stage estimates,
  Amice taking it to multiplication, and comparison with native measure
  convolution. No general manifold or tensor-distribution construction is
  required for this one-variable interface.

### Examples

**Checks.**

- At level zero `x^p−x` has Gauss norm `1`; for `E=𝔽_p` its nonzero
  coefficient vector re-expands to zero on all level-one discs
  (`TauCeti.AnalyticStage.norm_frobeniusSubIdCoeffs`,
  `TauCeti.AnalyticStage.transition_frobeniusSubIdCoeffs`,
  `TauCeti.AnalyticStage.not_injective_transition_residueField`).
- The moments `b_n=1/n!` give a bounded functional on level zero but not on
  level one (`TauCeti.bddAbove_norm_coeff_mul_norm_factorial_zero_exp`,
  `TauCeti.not_bddAbove_norm_coeff_mul_norm_factorial_one_exp`).
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
- Still to formalise: `h=0`, polynomial tails and the diagonal transition on
  the first block; the derivative functional at zero has moments
  `b_n=(−1)^(n−1)/n` for `n≥1` and transform `log(1+T)`, a distribution but not
  a bounded measure; `exp(p)` for odd primes and `exp(4)` at `p=2` are valid
  generators, while the exponential of `2` is outside the convergence disc.

### Dependencies

Layers 0–3 and RestrictedPowerSeries Layers 0–2 with §7.1. Sources: [Am],
[Col] Théorème I.4.7, Corollaire I.4.8 and II.2, [ST] and [RJW] Theorem 3.43.

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
  `ℂ_p` with `|Δ|` copies of the open unit disc. Their analytic-space structure
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
  to obtain

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
  source topology.
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
  Sources: [RJW] Proposition 3.16 and Theorem 3.25.
- **Separation by weights.** Weights separate bounded `ℂ_p`-valued measures on
  `ℤ_pˣ`: `measurePairing_injective`, through
  `ContinuousMonoidHom.characterIntegralAlgHom`; the integral case is the
  pinned `TauCeti.measureFun_injective`. Prove compatibility of `TauCeti.measureFun` with
  specialisation of `Λ`. This is a bounded function on a set of weights; a
  geometric weight-space sheaf or a topology on the space of measures is not
  constructed.

### 5.4 Analytic levels of weights

Target: for a weight `κ` with values in a complete ultrametric normed
`ℚ_p`-algebra `K` with multiplicative norm, in particular a complete normed
field over `ℚ_p`, the principal part `s↦κ(γ^s)=(1+T_κ)^s`
(`TauCeti.WeightSpace.principalChar`) lies in the image of `LA_h(K)` exactly
when `‖T_κ‖ < p^(−1/((p−1)p^h))`: `exists_eval_eq_principalChar_iff`. This is
the case `t=T_κ` of §4.6 through
`TauCeti.WeightSpace.principalChar_eq_addChar_of_value_at_one`. Read on
`ℤ_pˣ` through `x↦log(x/ω(x̄))/q` (`TauCeti.padicIntUnitsEquivZModUnitsProd`),
which carries the cosets of `1+p^(h')ℤ_p`, `h'≥v_p(q)`, onto the discs of
`ℤ_p` modulo `p^(h'−v_p(q))`, it says that `κ` is analytic on unit discs
modulo `p^(h')` exactly when

```text
‖κ(exp(p^(h')))−1‖ < r_p,
equivalently ‖T_κ‖ < p^(−q/(p^(h')(p−1))),
```

the level `h=h'−v_p(q)` of the principal part, since `q=p^(v_p(q))`. Every
continuous field-valued weight satisfies it for some `h'`
(`TauCeti.AnalyticStage.exists_eval_eq_addChar`). Give the locally algebraic
conductor bound, handling the minimum allowed level and the trivial
finite-order character separately: for `κ(x)=x^kψ(x)` with conductor dividing
`p^m`, every `h'≥max(m,v_p(q))` suffices. For Banach-algebra coefficients use
sufficient convergence conditions and an explicit bound on the resulting
expansion; compactness alone does not give norm one. *Needs:*
`exists_eval_eq_addChar_iff` (§4.6),
`TauCeti.WeightSpace.principalChar_eq_addChar_of_value_at_one`,
`TauCeti.padicIntUnitsEquivZModUnitsProd`, `TauCeti.amiceRadius`, and the
valuation formula of §5.2 for the conductor bound.

### 5.5 Scalar analytic factors for automorphic applications

Target: for a field-valued weight satisfying §5.4 at level `h`, extend its
principal-unit part analytically to `1+p^h𝒪_K`. For `d∈ℤ_pˣ(1+p^h𝒪_K)` and
`‖c‖≤‖p^h‖`, expand `κ(cz+d)` on the closed unit disc and prove its Gauss norm
is one. Put `t_h=κ(exp(p^h))−1`. A radius `r>0` satisfying

```text
r‖c‖ < r_p,       r‖c‖‖t_h‖ < ‖p^h‖ r_p
```

gives convergence on that radius, Gauss norm at most one, and coefficient
bounds `‖a_n‖≤r^(−n)`. State the corresponding Banach-algebra version with the
actual bound on the constant factor and on the analytic character. Use
RestrictedPowerSeries for composition and coefficient estimates. For
nonnegative algebraic weight the expansion agrees with `(cz+d)^k`. Matrix
actions and the ordering convention in their cocycle identity belong to
quaternionic modular-form theory; this section gives only scalar expansions.
*Needs:* `exists_eval_eq_principalChar_iff` (§5.4) for the level, the
exponential and logarithm of §4.5 for the extension to `1+p^h𝒪_K`,
RestrictedPowerSeries §§1.1 and 2.2 (Gauss norms, substitution) for the
composition and the coefficient bounds, `TauCeti.WeightSpace.principalChar`.

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
gauge used below.

On `H[1/T]`, establish the coefficient criterion `v_p(d_m)≥max(0,−m−k)` for
some `k≥0`, allowing `d_m∈ℤ_p`. For a fixed `α∈(0,1)`, construct the complete
multiplicative-`T` gauge whose unit ball is `H` and `‖T‖=α`, and prove that it
is a nonarchimedean Banach–Tate ring (`TauCeti.NormedRing.IsTate`). State
completeness for this gauge topology. In particular `‖U‖=1`; the partial sums
of `Σ_(j≥0) U^j` do not converge in this topology even though the formal sum
is an element of `H`.

At every `t∈ℂ_p` with `p⁻¹<|t|<1`, construct the evaluation `T↦t, U↦p/t` and
prove continuity using divisibility bounds. The evaluations over this annulus
in `ℂ_p` are jointly injective. There may be no such points over `ℚ_p`; that
field alone cannot test injectivity. A general gauge-continuous specialisation
need not be Lipschitz for arbitrary choices of `α`.

Adjoin the finite factor by `H[Δ]`, compare it with the halo coefficient ring
`ℤ_p⟦T,pT⁻¹⟧⊗ℤ_p[Δ]` of [LWX] Lemma 3.15, and track the ideal `(p,T)=(T)` of
the principal coefficient ring. At `p=2`, the full finite-factor maximal ideal
also contains `δ−1`; retain the integral group ring. Annular geometry,
Fredholm series and slope bounds are outside this roadmap. *Needs:* Mathlib
`MvPowerSeries` and `Ideal.Quotient` for `ℤ_p[[T,U]]/(TU−p)`,
`TauCeti.NormedRing.IsTate` and `TauCeti.NormedRing.PseudoUniformizer` for
the gauge, `TauCeti.NormedRing.IsTate.isTateRing` for the topological
property, `ℂ_p` with Mathlib's `PadicComplex` norm for the annulus, and
`TauCeti.padicIntUnitsEquivZModUnitsProd` for the finite factor.

### Examples

**Checks.**

- At `p=2`, test both sign characters and `γ=exp(4)`.
- Specialise the universal character at the trivial weight and at an
  algebraic weight. Verify `T↦0`, the finite-character components, and the
  generator-change formula.
- The trivial weight has `T_κ=0` and is analytic at every level; the weight
  `κ(x)=x` over `ℚ_p` has `‖T_κ‖=‖exp(q)−1‖=‖q‖`, below `r_0=p^(−1/(p−1))`
  for every `p` (`p⁻¹<p^(−1/(p−1))` for odd `p`, `4⁻¹<2⁻¹` at `p=2`), so its
  principal part is analytic on all of `ℤ_p`: `x↦x` is analytic on the cosets
  of `1+qℤ_p`.
- Test the halo normal forms `T`, `U`, `p=TU` and `(1−U)⁻¹=Σ U^j`; distinguish
  formal equality from convergence in the gauge norm. Do not identify `H[Δ]`
  with an integral product at `p=2`.
- For universal specialisation also check `(1+T)^n` and the infinite series
  `(1+T)⁻¹=Σ(−T)^j`, which is not `1−T`.
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

## How to read the build

Each section first lists, under "In the pinned library", the pinned
declarations that already prove its statements; these are inputs, not targets.
What follows under "Target" or "Targets" is the remaining work, with `*Needs:*`
naming the pinned declarations or earlier targets it rests on. Each layer ends
with its Examples, the Checks of the layer, and its Dependencies. Names
without a namespace in the target lists (`amiceMap_bijective_and_norm_eq`,
`isOrthonormalBasis_amiceTerm`, `exists_eval_eq_addChar_iff`,
`exists_character_of_hasEval`, `eq_aeval_binomialSeries`,
`amiceTransform_completedGroupAlgebra_compat`, `measurePairing_injective`,
`exists_eval_eq_principalChar_iff`) are the declarations of
[Suggested.lean](Suggested.lean), stated against the pinned carriers. A Check
marked as an example in a pinned file is already formalised; the others are
required.

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
  (including the input-first adapter) and §§4.3–4.7; the topology on
  `LA(ℤ_p,E)`, the strong dual and the general distribution product are its own. Its names
  `amiceDiscNorm_le_amiceDualNorm` and `amiceDualNorm_le_amiceDiscNorm` refer to
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
  and `TauCeti.measureFun_injective`. `exists_character_of_hasEval` and
  `eq_aeval_binomialSeries` are targets of §5.3.

## Dependency order and completion

Layers 0–2 precede the bounded duality in Layer 3; Layer 4 consumes
RestrictedPowerSeries and Layer 3; Layer 5 consumes both. Within the remaining
targets, Amice's theorem (§4.4) precedes the Mahler criterion, §4.6, §4.7 and
§5.4; the completed group algebra of `ℤ_pˣ` precedes the adic universal
character and the Amice-coordinate comparison of §5.3; §5.4 precedes §5.5.
Only the last corollary of §2.4 uses completed tensors, and it takes them from
the pinned `TauCeti.Huber.BanachModule.CompletedTensor`. The Amice-coordinate
comparison of §5.3 uses §3.4, the pinned completed-group-algebra equivalence
and ProfiniteProPGroups alone.

A target is complete when its definitions use native structures, its
statements and comparison maps are proved, its stated checks are formalised,
and its supplier and consumer hypotheses agree. Test zero objects and empty
indices, non-Noetherian versus Noetherian coefficients, all primes, and the
strict radius boundaries. Admitted signatures are not completed results.
Integration must not introduce `sorry`-based instances or silently change the
topology of an imported object.

## References

* **[Serre]** J.-P. Serre, *Endomorphismes complètement continus des espaces
  de Banach p-adiques*, Publ. Math. IHÉS **12** (1962), 69–85.
* **[Sch]** P. Schneider, *Nonarchimedean Functional Analysis*, Springer,
  2002, especially §§8–10.
* **[Bel]** J. Bellaïche, *The Eigenbook*, Birkhäuser, 2021, Chapter II.
* **[Buz]** K. Buzzard, [*Eigenvarieties*](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf),
  in *L-functions and Galois Representations*, LMS Lecture Note Series **320**
  (2007), especially Lemmas 2.2–2.3 for finite-coordinate detection and
  closedness. The Banach–Tate extension uses [JN] §2.1's shell scaling.
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
  especially I.3–I.4 and II.2.
* **[ST]** P. Schneider and J. Teitelbaum, *p-adic Fourier theory*,
  Documenta Math. **6** (2001), 447–481.
* **[RJW]** J. Rodrigues Jacinto and C. Williams,
  [*An Introduction to p-adic L-functions*](https://arxiv.org/abs/2309.15692),
  especially §§3–4, Proposition 3.16, Theorem 3.25, Theorem 3.43 and
  Remark 3.47.
* **[LWX]** R. Liu, D. Wan and L. Xiao,
  [*The eigencurve over the boundary of weight space*](https://arxiv.org/abs/1412.2584),
  especially §§2–3.
