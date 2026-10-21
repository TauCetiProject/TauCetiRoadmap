# P-adic functional analysis

Build the functional analysis of nonarchimedean Banach modules and the analysis
of continuous and locally analytic functions on `ℤ_p`. The library supplies
Banach–Tate operator theory, orthonormalisable modules, Mahler and Amice
coordinates, quantitative distribution estimates, and continuous characters
of `ℤ_pˣ` with their specialisation maps. These interfaces serve Fredholm
theory, Iwasawa theory, adic geometry and families of automorphic forms.

The central results are Serre's orthonormalisation theorem; continuous splitting
for Banach spaces of countable type; Amice's basis theorem for analytic stages;
the bounded and unbounded Amice transforms; and the universal character with
coordinate `T=[exp(q)]−1`, where `q=p` for odd `p` and `q=4` for `p=2`.
The coefficient ring may be a Banach–Tate ring rather than a field. Field,
discrete-valuation and characteristic-zero assumptions are imposed locally.

Every milestone and check below is required. This README is definitive;
[Suggested.lean](Suggested.lean) records representative interfaces with real
definitions and admitted theorem targets; it is not an exhaustive checklist.
Suggested homes are `TauCeti/Analysis/Normed/` for the Banach-module and
operator APIs, `TauCeti/RingTheory/Huber/` for the topological comparisons,
and `TauCeti/NumberTheory/Padics/` for measures, analytic stages and characters.

## Scope and ownership

| Area | Supplied here | Supplied elsewhere |
| --- | --- | --- |
| Banach–Tate analysis | Multiplicative pseudo-uniformisers, seminorm gauges, norm comparisons, ring-scalar operator norms and quantitative mapping theorems | Huber rings, pairs of definition and topological open mapping: [AdicSpaces](../AdicSpaces/README.md), Layer 0 |
| Model spaces | Native `C₀`, bounded-family extension, bases, (Pr), matrices, finite coordinates and countable-type splitting | Complete continuity, Fredholm determinants, Riesz theory and spectral transforms: compact operator theory; geometric uses in [LocallyAnalyticDistributions, PR #854](https://github.com/TauCetiProject/TauCetiRoadmap/pull/854), Layer 4 |
| Restricted series | Their use as analytic charts and coefficient spaces | Carriers, norms, coefficient-model comparisons, evaluation, substitution, translation, Hasse derivatives and Strassmann: [RestrictedPowerSeries][RestrictedPowerSeries] ([PR #919](https://github.com/TauCetiProject/TauCetiRoadmap/pull/919)), Layers 0–2 and §7 |
| Valuations | Logarithmic gauges on Banach rings and comparison with field valuations | Additive normalisations, `ℂ_p` value group and polygons: [NewtonPolygons][NewtonPolygons] ([PR #926](https://github.com/TauCetiProject/TauCetiRoadmap/pull/926)), Layer 1; local-field arithmetic: LocalFieldsRamification |
| Measures | Bounded Mahler duality, the integral dual unit ball, `φ,ψ`, character integration and the Amice-coordinate comparison | General clopen measure calculus, weak/strong topologies, finite coordinates, coefficient extension and the measure/completed-group-algebra comparison: [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md), Layers 0–1 |
| Locally analytic distributions | One-variable stages, algebraic union, stage-bounded dual, Amice bijection, norm estimates, point masses and additive convolution | Locally convex limits, strong dual topology, completed tensors, manifolds, `C^r` growth, general distribution operations and geometric Mellin theory: [LocallyAnalyticDistributions](https://github.com/TauCetiProject/TauCetiRoadmap/pull/854), Layers 0–3 |
| Iwasawa algebra and weights | Character coordinates, adic and normed specialisation, bounded integral-measure functions | Completed group algebra and procyclic coordinate: [ProfiniteProPGroups](../ProfiniteProPGroups/README.md), Layer 9; pseudo-measures, module structure and characteristic ideals: PadicMeasuresIwasawaAlgebras |
| Automorphic applications | Character analyticity, scalar expansions of `κ(cz+d)` and the annular coefficient example | Matrix actions, automorphy-factor cocycles, Hecke operators and classicality: quaternionic modular-form theory |

The gauge contract is consumed by [AdicSpacesPartII §R0.4](https://github.com/TauCetiProject/TauCetiRoadmap/pull/817);
countable-type splitting and its completed-extension consequence give the
`countable-type-closed-subspace-section` interface in
[AdicSpacesPartIII §R3.6](https://github.com/TauCetiProject/TauCetiRoadmap/pull/813).
Use §2.4 as the shared Banach-space theorem behind that interface. Part III
retains the geometric application; no second splitting theory is required.
[AdicSpacesPartII §R0.3](https://github.com/TauCetiProject/TauCetiRoadmap/pull/817)
and LocallyAnalyticDistributions §0.0 supply the completed-tensor carriers and
functoriality; compare their field specialisations before transporting the
split-exactness corollary.
An imported theorem is a dependency and comparison target, not another proof
project. The open-roadmap links below identify the mathematical contracts;
the prototype imports library modules, not another roadmap's `Suggested.lean`.
In particular, neither a second Tate algebra nor a second completed group
algebra is constructed here. Compactness, Fredholm theory and automorphic
operator actions are consumers of this library, not prerequisites for it.

General Hahn–Banach theory, reflexivity, nuclear spaces, geometric weight
spaces and analytic Laurent/Robba-ring libraries are outside the scope.
The particular coefficient ring in §5.6 is a Banach–Tate example motivated by
the boundary-of-weight-space calculations in [LWX].

## Conventions

1. **Native structures.** Use `IsUltrametricDist`, `Module R E`,
   `IsBoundedSMul R E` and `CompleteSpace`. Add `NormOneClass`, `NormMulClass`
   and `NormSMulClass` only where needed. Commutative rings are the default
   for scalar actions on operator spaces and matrix multiplication.
   “Banach module” means these properties on the existing normed module;
   no new `BanachModule` carrier or fundamental typeclass is required.
   `IsBoundedSMul` supplies the contractive inequality
   `‖a • x‖ ≤ ‖a‖ ‖x‖`. A merely bounded action with an extra constant
   is a different hypothesis and does not give the same exact norm identities.

2. **Normed and topological Tate conditions differ.** `NormedRing.IsTate R`
   records a unit `ϖ` with `0<‖ϖ‖<1` and `‖ϖx‖=‖ϖ‖‖x‖`.
   `NormedRing.PseudoUniformizer R` carries the choice for the given norm.
   `TauCeti.Huber.IsTateRing R` instead asserts the topological Huber property
   and existence of a topologically nilpotent unit, with no chosen norm or
   exact scaling law. Use the topological class for topological statements
   and the normed class or explicit multiplicative unit for quantitative ones.
   Neither class includes completeness. The normed condition here excludes
   the zero ring; the topological gauge construction also treats zero and
   non-Hausdorff rings. Section 0.4 supplies the comparison, without a reverse
   instance asserting that an arbitrary existing norm is Tate.

3. **Use `C₀(I,E)`.** The index type is arbitrary and discrete; decay is
   along the cofinite filter. No replacement coefficient carrier or
   countability assumption is introduced. Empty indices and zero modules
   have norm zero. Prove boundedness before using a real supremum.

4. **Orthonormality controls scalar coefficients.** Require
   `‖Σ_{i∈S} a_i e_i‖=max_{i∈S}‖a_i‖` for finite `S`, with empty maximum
   zero. Orthogonality uses `max‖a_i e_i‖` and is weaker over rings.
   A basis additionally has dense span. `IsONable` means linearly isometric
   to a model space; `IsPotentiallyONable` means continuously linearly
   equivalent; (Pr) means a continuous linear retract of such a module.
   Under the complete coefficient-ring and module hypotheses of §2.2,
   `IsONable` is equivalent to existence of an orthonormal basis. A chosen
   basis and a chosen model isometry must be interconvertible; neither is
   chosen globally by typeclass inference.

5. **One operator norm.** Extend Mathlib's infimum of uniform Lipschitz
   bounds with scoped ring-scalar instances and agreement with the field
   API. Continuity implies a finite bound over Tate scalars, but not over
   every normed ring. The norm of an identity or Neumann inverse is one
   only for a nonzero module.

6. **Output index first.** `matrixCoeff u i j=(u(single j 1))(i)`.
   Rows index outputs and columns index inputs; columns are images of
   coordinate vectors. This agrees with Mathlib's `LinearMap.toMatrix`.
   For the input-first notation `b j i=(u(single j 1))(i)` used by
   LocallyAnalyticDistributions, supply a named transpose adapter. Null
   columns in the first convention are null rows in the second. Uniform
   decay over output coordinates, used in compactness criteria, is a
   different condition. The convention and its action/composition formulas
   are fixed in §2.6; compactness itself belongs to CompactOperators.

7. **Analytic stages are coefficient models.**
   `LA_h(E)=C₀(ZMod(p^h)×ℕ,E)` uses natural representatives as centres
   and `w=(x−a)/p^h`. Evaluation is norm-decreasing; injectivity needs a
   theorem. Use RestrictedPowerSeries' field-separation hypothesis, or the
   Amice diagonal for Banach `ℚ_p`-spaces. Re-expansion exists for all
   bounded `ℤ_p`-modules, but need not be injective for torsion coefficients.

8. **Mahler and Amice coordinates differ.** Put `m_h(n)=⌊n/p^h⌋!`.
   The Amice coordinate `c_n` gives Mahler coefficient `a_n=m_h(n)c_n`.
   A dual moment `b_n` is therefore weighted by `‖m_h(n)‖`, not its inverse.
   Module-valued coordinate equivalences are not called scalar bases of
   `C(ℤ_p,E)` unless the coefficient module warrants that assertion.

9. **Name the norm and topology.** The normalisation is `‖p‖=p⁻¹` in
   `ℚ_p`; use normed `ℚ_p` scalar actions for the analytic estimates.
   The distribution carrier here has stage seminorms but no new global
   topology. Integral measures retain their native carrier; field dual norms
   are taken after coefficient extension. The Iwasawa topology is profinite,
   not the coefficient sup-norm topology.

10. **All primes.** Put `q=p` for odd `p`, `q=4` for `p=2`,
    `Δ=(ℤ/qℤ)ˣ`, `γ=exp(q)` and `T=[γ]−1`. At `p=2` the sign factor
    does not split the integral group ring into two rings. A normed-ring
    weight has a topologically nilpotent coordinate; only a multiplicative
    norm makes this equivalent to `‖T_κ‖<1`.

## Existing foundations

Mathlib supplies ultrametric summability, `C₀`, continuous linear maps and
field operator norms, normed quotients, finite-dimensional topology, Mahler's
isometry, continuous additive characters, `AbstractMeasure`, power series,
binomial coefficients and `p`-adic fields. Its current measure API includes
`AbstractMeasure.amiceTransform`, coefficient extensionality, the integral
Amice equivalence and convolution in `Measure/Monoid`. Extend these native
declarations rather than creating parallel transforms or products.

Use `PadicInt.mahlerEquiv` in its existing generality of complete ultrametric
modules with contractive `ℤ_p` action. Use `AbstractMeasure.amiceTransform`,
`coeff_amiceTransform`, `injective_amiceTransform` and `amiceTransformEquiv`
directly; the prototype proves the comparison with `PadicInt.mahlerTerm`.
The scalar-linear refinements, bounded dual norm, range and integral-lattice
comparisons are additional targets.

Follow [Mathlib PR #42865](https://github.com/leanprover-community/mathlib4/pull/42865),
which makes `ContinuousLinearMap.opNorm` depend only on semiring modules,
and the accompanying [Zulip discussion](https://leanprover.zulipchat.com/#narrow/channel/217875-Is-there-code-for-X.3F/topic/compact.20operators.20and.20Fredholm.20determinant/with/572850121).
Keep that definition and its names; Tate scalars supply the boundedness and
normed-space laws that do not hold for arbitrary continuous ring-linear maps.
The local prototype formula is definitionally equal to Mathlib's field norm,
not a competing production norm.

For convolution compatibility follow [Mathlib PR #42836](https://github.com/leanprover-community/mathlib4/pull/42836)'s
`AbstractMeasure.amiceTransformₐ` and `amiceTransformEquivₐ`, using
`Multiplicative ℤ_p` to express additive convolution through the native
monoid-measure API. The earlier Amice proposals
[#23772](https://github.com/leanprover-community/mathlib4/pull/23772) and
[#23791](https://github.com/leanprover-community/mathlib4/pull/23791) are related
existing work; use the native `AbstractMeasure` interfaces as the common carrier.
Build required missing results in Tau Ceti in these API shapes and adopt
Mathlib's declarations when available, without waiting for those proposals.

Tau Ceti's `RingTheory/Huber/Basic.lean` supplies `IsTateRing`,
`IsPseudoUniformizer` and `IsTateRing.exists_hasBasis_nhds_zero`.
Its `RingTheory/Huber/Normed.lean` supplies norm-boundedness and
power-boundedness comparisons, and `RingTheory/Huber/OpenMapping.lean`
supplies the topological mapping theorems. Section 0.4 constructs the
unit-ball pair of definition and proves the normed-to-topological Tate
bridge, importing native versions of those comparisons when available.
The topological open-mapping and finite-module APIs supply the topological
facts; the statements below supply their quantitative form. RestrictedPowerSeries
supplies the analytic algebra used in Layers 4–5.
Tau Ceti's `NumberTheory/Padics/PadicIntegers.lean` already supplies
`PadicInt.compactSpace_units` and `totallyDisconnectedSpace_units`; reuse
these instances for the weight-pairing norms.

## Layer 0 Ultrametric Banach modules and Tate gauges

### 0.1 Sums and estimates

Use the native equivalence between summability and cofinite decay in a
complete ultrametric group. Prove boundedness and norm-supremum attainment
for a nonzero null family. Supply the strict bound for a summable family
whose terms have norm `<B`, `B>0`, and equality with a unique dominant
term. Handle the empty family explicitly.

Give bounded bilinear and module versions of Cauchy products and double
sums, assuming summability of the input families. Prove joint decay before
exchanging sums. Summation is norm-decreasing in the coefficient sup norm.
A family of null families is summable in the sup-norm space if its sup
norms tend to zero; pointwise decay alone is insufficient.

### 0.2 Normed rings and multiplicative units

Construct the closed unit-ball subring and its open-ball ideal. Elements
of the former are power-bounded and of the latter topologically nilpotent.
For multiplicative norms, topological nilpotence is equivalent to norm `<1`;
comparison of topological ring-boundedness with norm-boundedness uses
the multiplicative-unit scaling supplied by a Tate norm. Do not infer this
comparison from a merely non-discrete ring topology. General submultiplicative
norms do not give the converses.

Prove the ultrametric Neumann estimates for `‖x‖<1`, including
`‖(1−x)⁻¹‖=1` and `‖(1−x)⁻¹−1‖=‖x‖` in a complete norm-one ring.
Deduce unit lifting and the inclusion of the open-ball ideal in the
Jacobson radical of the unit ball. Over a field the reduction is a field;
over `ℚ_p⟨X⟩` it is `𝔽_p[X]`.

For multiplicative units prove the inverse norm formula and exact scaling
on every module with bounded action. These supply all shell arguments.

### 0.3 Modules and norm comparisons

Use `[NormedAddCommGroup E] [Module R E] [IsBoundedSMul R E]
[IsUltrametricDist E] [CompleteSpace E]` for a Banach module with contractive
action. Over a field retain `NormedSpace K E` and its existing consequences.
State results with only the components they use: completeness belongs to
convergence and extension results, not finite-sum norm estimates. A convenience
abbreviation may shorten local hypotheses, but must not introduce another norm,
module action, completeness API or cycle of instances reconstructing the same
properties. A new bundled category of Banach modules is outside this roadmap.

For consumers allowing `‖a • x‖≤C‖a‖‖x‖` with `C≥1`, retain the explicit action bound.
Over a norm-one coefficient ring the adapted norm
`‖x‖'=sup_{a≠0} ‖a • x‖/‖a‖` satisfies `‖x‖≤‖x‖'≤C‖x‖` and makes the
action contractive. Supply this comparison where used, including the
zero-module case. Transport completeness, continuity and potential ONability;
exact isometries and norm-one bounds must refer to the selected norm.

Develop closed submodules, quotients by closed submodules, finite max-norm
products and completeness. Quotient norms are infima; approximating lifts
suffice without a norm-minimising representative.

Bounded-equivalent norms give the same bounded maps and completeness.
For ring norms inducing the same topology retain the corrected power
comparisons of [JN] Lemmas 2.1.6–2.1.7. With a common multiplicative unit,
the exponent is determined by its two norms. Equal topology alone does
not imply a linear comparison of ring norms.

For `c=‖π‖∈(0,1)`, round a module norm upwards to `c^ℤ∪{0}`. Prove
`‖m‖≤‖m‖'` and `c‖m‖'<‖m‖` for `m≠0`, with both zero at zero.
This is a module norm for the original scalar norm when that scalar norm
takes values in `c^ℤ∪{0}`. Otherwise retain the additive norm and exact
`π`-scaling. Construct `M̃=M⁰/πM⁰` over `R̃=R⁰/πR⁰`; for the discrete
module norm the denominator is precisely the open unit ball.

### 0.4 Tate norms and topological gauges

Distinguish the three interfaces: existence of a topological Tate structure,
the Tate property of a specified norm, and a chosen multiplicative
pseudo-uniformiser. For an ultrametric norm-one commutative ring, map the
normed pseudo-uniformiser to the native `TauCeti.Huber.IsPseudoUniformizer`.
Construct the unit-ball pair of definition described below, and use its
`IsHuberRing` instance and the chosen unit to obtain `TauCeti.Huber.IsTateRing`.
This bridge needs neither completeness nor multiplicativity of every scalar.
Reuse `IsTateRing.of_isUnit_norm_lt_one` when that native comparison is
available; exact multiplication by the chosen unit remains the additional
input for the quantitative results below.

Prove the shell `‖ϖ‖<‖ϖ^n m‖≤1` with unique integer `n` for `m≠0`.
Norm-one algebras over nontrivially normed fields give Tate examples by a
small nonzero scalar. The logarithmic gauge
`v_ϖ(x)=log‖x‖/log‖ϖ‖`, with infinity at zero, is superadditive on
products; it is an additive valuation only for a multiplicative norm.
Compare its field specialisation with NewtonPolygons' normalisation.

The unit ball and `(ϖ)` give a Huber pair of definition. Conversely suppose
a topological commutative ring `A` has a subring `A₀`, a topologically
nilpotent unit `ϖ∈A₀`, and neighbourhood basis `ϖ^n A₀`, `n≥0`. For `a>1` set

```text
tateGauge A₀ ϖ a x = inf { a^(−n) | n∈ℤ, ϖ^(−n)x∈A₀ }.
```

Obtain this input from `Huber.IsTateRing.exists_hasBasis_nhds_zero`, replacing
the pseudo-uniformiser by a positive power if needed to put it in the ring of
definition. This is an explicit choice of gauge data. A topologically
nilpotent unit need not satisfy the multiplicative scaling identity for an
arbitrarily given compatible norm.

Prove the seminorm, ultrametric inequality, exact `ϖ`-scaling and recovery
of the topology. Its kernel is the closure of zero. It separates points
exactly when `A` is Hausdorff, and takes value one at one in the nonzero
Hausdorff case. Changing `A₀` with fixed `ϖ,a` gives bounded-equivalent
gauges. Replacing `a` by `b>1` raises the gauge to `log b/log a`.
Retain the consumer names `tateGauge`, `exists_tateSeminorm`,
`tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow`.
In the nonzero Hausdorff case promote the gauge to a normed Tate structure
on a compatible model of `A`; completeness is transferred only when the
original topological ring is complete. Going from a Tate norm to its unit-ball
gauge with `a=‖ϖ‖⁻¹` generally returns a bounded-equivalent discrete rounding,
not literal equality of norms. Other choices of `a` involve the power comparison
above. Keep the normed-to-topological implication and the
topological-to-chosen-gauge construction separate; do not install them as
mutually inverse global instances.

**Checks.** `(ℤ_p,p,p)` gives the norm on `ℚ_p`; `(ℤ_p,p²,p)` gives
values `1,p⁻¹` at `p,p²` and is not multiplicative. The zero ring has zero
gauge. Membership `ϖ∈A₀` is essential: in `ℚ_p²`, take
`A₀={(x,y)∈ℤ_p² : x−y∈p²ℤ_p}` and `ϖ=(p,p²)`; the formula gives
`g(1)=1`, `g(ϖ)=a⁻¹`, `g(1+ϖ)=a²`, violating ultrametricity.
Rounding `ℂ_p` to `p^ℤ` does not preserve its original scalar inequality.
On `ℚ_p`, the norm `N(x)=max(|x|_p,|x|_p²)` is ultrametric,
submultiplicative and norm-one, and induces the usual Tate topology. For
every `0<|ϖ|_p=r<1`, however, `N(ϖ)N(ϖ⁻¹)=r⁻¹>1=N(1)`.
Thus this specified norm has no multiplicative pseudo-uniformiser: the
topological Tate condition does not imply the normed one for an arbitrary
compatible norm.

**Dependencies.** Mathlib sums, quotients and topological groups; AdicSpaces
for the Huber comparison. Sources: [JN] §2.1, [Sch] §§3–4, [KL] §2.4.

## Layer 1 Bounded operators and finite modules

### 1.1 Operator norms over rings

For a linear map with a uniform bound, use
`inf{C≥0 : ∀x, ‖u x‖≤C‖x‖}`. Prove the bound at the infimum, the norm
and composition laws. Over Tate scalars prove continuity implies a bound,
then extend the normed-space API on `ContinuousLinearMap` in the shape of
Mathlib #42865. Use its general `Norm` instance when available and scoped
instances for additional ring-scalar structures, agreeing with the field API.
The operator norm is a supremum of ratios, not generally the supremum of values on the unit ball.

The operator space is complete and ultrametric when the target is. Supply
evaluation, operator-norm sums and the endomorphism Banach ring. Neumann
inversion for `‖1−u‖<1` agrees with `ContinuousLinearEquiv`; the inverse
norm is one for a nonzero module and zero for the zero module.

### 1.2 Mapping theorems

For Banach modules over a Banach–Tate ring, a continuous surjection has
preimages with `‖m‖≤C‖n‖` for some `C>0`. Derive this from topological
open mapping and shell scaling. Prove bounded inverse, closed graph,
strictness of closed-range maps and Banach–Steinhaus. A pointwise convergent sequence of
continuous linear maps on a Banach source has a continuous limit. For a
general net, retain the pointwise-bounded-family hypothesis; convergence
of a net alone does not bound its whole range. Give finite-free
operator bounds from the coordinate vectors.

### 1.3 Finite-dimensional spaces

Reuse Mathlib's continuity, completeness, equivalent-norm and closed-subspace
theorems over complete nontrivially normed fields. Supply ultrametric
max-norm coordinates and `t`-orthogonal bases for `0<t<1`. Under discrete
valuation prove the orthogonal version using finite-dimensional distance
attainment. No spherical completeness is assumed for the general field case.

### 1.4 Finite Banach modules

For a commutative Noetherian Banach–Tate ring, prove the canonical complete
Hausdorff quotient topology on finite modules, independent of presentation.
Maps between them are continuous and strict; submodules are closed. Any
compatible Banach module norms are bounded-equivalent. Consume existing
topological finite-module results and supply their normed comparison.
Do not require a Noetherian ring of definition when the theorem only
requires the Tate ring itself Noetherian.

General Banach modules are not assumed finite. Closedness of their finite
submodules is asserted only for the model spaces in §2.6 or under an
explicit hypothesis.

**Checks.** `(x,y)↦x+py` on `ℚ_p²` has lifting constant one.
Multiplication by `a` on a norm-one ring has norm `‖a‖`. The identity
from `ℤ_p` with norm `|x|²` to its usual norm is continuous but unbounded
as a `ℤ_p`-linear map. Include the zero-module Neumann case.

**Dependencies.** Layer 0, topological open mapping and finite-dimensional
topology. Sources: [JN] §2.1, [Buz] §2 and [BGR] §3.7.

## Layer 2 Model spaces and bases

### 2.1 The native model space

Extend `C₀(I,E)` with bounded scalar and ultrametric instances missing at
the destination pin. Prove finite-support density, coordinate vectors,
evaluation, the attained sup norm for nonzero vectors and coefficient
expansion. For Banach–Tate `R` and a Banach module `M`, bounded families
`I→M` correspond to continuous linear maps `C₀(I,R)→M`, with norm the
family supremum. Construction from a bounded family needs only a complete
ultrametric normed ring; the converse uses Tate.

Supply reindexing, disjoint sums, finite blocks and the isometry
`C₀(I×J,E)≃C₀(I,C₀(J,E))`. Bounded coefficient maps act coordinatewise
and commute with these comparisons.

### 2.2 Bases and property (Pr)

For `0<t≤1`, define a `t`-orthogonal family by
`t max_{i∈S} ‖a_i • e_i‖ ≤ ‖Σ_{i∈S} a_i • e_i‖` for every finite
`S` and scalar family, with the empty maximum zero. Ultrametricity supplies
the upper bound `‖Σ_{i∈S} a_i • e_i‖ ≤ max_{i∈S} ‖a_i • e_i‖`. Orthogonality is equality with that maximum;
orthonormality is Convention 4's stronger equality with the scalar norms.
A `t`-orthogonal basis has nonzero vectors and dense span. Over fields,
put `w_i=‖e_i‖>0`: coefficients satisfy `‖a_i‖w_i→0` along the cofinite
filter, and the norm of their sum lies between `t sup_i ‖a_i‖w_i` and
`sup_i ‖a_i‖w_i`. Prove unique unconditional expansion for every vector.
For orthonormal families prove independence and isometric coefficient
expansion. For a complete ultrametric norm-one ring `R` and a complete
ultrametric normed module `M` with contractive action, prove for each discrete
index type `I` the equivalence

```text
(∃ e : I → M, IsOrthonormalBasis R e) ↔ Nonempty (M ≃ₗᵢ[R] C₀(I,R)).
```

Construct the isometry from the specified basis, with inverse
`a ↦ Σ_i a_i • e_i`. In the other direction pull back the canonical coordinate
vectors. Prove that both constructions recover the chosen basis/isometry,
with unique unconditional coefficient expansion. Existentially quantify `I`
to obtain the basis characterisation of `IsONable`. Keep its model-isometry
definition for transport, operator coordinates and (Pr); the basis theorem is
an equally usable entry point. Completeness matters: the finite-support space
inside `c₀(ℕ,ℚ_p)` has an orthonormal family with dense span but is incomplete.
Do not call this a Hamel basis or an inner-product orthonormal basis. In the
field specialisation compare the coefficient functionals and unconditional
expansion with Mathlib's `UnconditionalSchauderBasis` rather than duplicating
its general projection theory.

Orthogonal independence over rings requires nonzero vectors and a suitable
norm-multiplicative scalar action; orthonormality needs no such repair.

Give `IsPotentiallyONable`, `HasPr`, their implications and finite-product,
reindexing and retract stability. Over Banach–Tate scalars, (Pr) is
equivalent to lifting continuous linear maps through continuous surjections
of Banach modules. Use bounded lifts of coordinate vectors and a surjection
from a sufficiently large model space. A finite (Pr) module is algebraically
projective. Coordinate subfamilies give continuous projections and decompositions.

### 2.3 Serre's theorem

Suppose the ring norm takes values in `c^ℤ∪{0}` with a multiplicative
pseudo-uniformiser of norm `c`. For a module with the same condition, lifts
of a residue-module basis form an orthonormal basis, and conversely.
Prove successive approximation and coefficient convergence. Thus `IsONable`
is equivalent to freeness of the residue module. If the residue ring is a
field, rounding gives potential orthonormalisability of every Banach module.

Over a complete discretely valued field, every Banach space is potentially
orthonormalisable; it is isometrically so iff its nonzero norms belong to
the field value group. Prove cardinality invariance of model-space bases
under continuous linear equivalence.

### 2.4 Countable type and strict splitting

Countable type means a countable subset with dense span. For every
`0<t<1`, construct a `t`-orthogonal basis over an arbitrary complete
nontrivially normed ultrametric field. Separate finite dimension from the
infinite-dimensional case, which is continuously equivalent to `C₀(ℕ,K)`.
Closed subspaces and quotients retain countable type; closed subspaces
are continuously complemented.

Supply `exists_continuousLinearEquiv_prod_of_countableType`: for a closed
embedding `i:M→E`, continuous surjection `q:E→N`, `range i=ker q`, and
countable-type Banach `E`, construct `d:E≃L[K]M×N` with
`d(i m)=(m,0)` and `(d x).2=q x`. No discrete valuation is required.

For a complete isometric extension `K'/K`, extend this splitting and inverse
to show preservation of strict exactness by `K'⊗̂_K(−)`. Use the separated
completed projective tensor and functoriality of LocallyAnalyticDistributions
§0.0, and compare it by the universal property with the Banach-module
completed tensor of AdicSpacesPartII §R0.3. The corollary must describe
exactness for those native maps and chosen tensor carriers. Only these
constructions are needed, not later analytic, Fredholm or geometric theory.
The splitting theorem itself is independent of tensors; it supplies
AdicSpacesPartIII's `countable-type-closed-subspace-section` interface.

### 2.5 Duality

Identify the continuous dual of `C₀(I,R)` over a commutative Banach–Tate
ring with native bounded families `lp … ∞`, isometrically. Prove the
pairing `Σ_i b_i a_i`, its bound and the isometric bidual embedding.
Transposed operators act on `ℓ∞`; their dual coefficient spaces are not
another copy of `c₀` in general.

### 2.6 Matrices and finite coordinates

Bounded operators have null columns and globally bounded entries;
conversely these conditions construct an operator. Prove the sup-entry
norm, action formula and convergent matrix product, output index first.
For `u:C₀(J,R)→C₀(I,R)`, write `A(u) i j=(u(e_j))_i`. Require
`(u x)_i=Σ_j A(u) i j*x_j` and `A(u∘v)=A(u)A(v)`, with summability
proved for each entry. For the adapter `B(u) j i=A(u) i j`, the input-first
formula is `(u x)_i=Σ_j x_j*B(u) j i` and composition becomes
`B(u∘v)=B(v)B(u)` over the commutative coefficient rings used here.
Prove agreement with the native finite-dimensional matrix convention.

Null columns mean decay in `i` for each fixed `j`. CompactOperators' row
bound is `r_i(u)=sup_j ‖A(u) i j‖`; decay of `r_i(u)` is uniform in the
input index and corresponds to output truncations `π_S u`. In input-first
notation it is decay of column suprema. Supply these translations explicitly;
reindexing the coefficients is not a claim that the transposed array defines
another operator on `c₀`. The dual operator acts on the bounded coefficient
space of §2.5. Test the adapter on a rectangular matrix and a non-diagonal
composition so that reversal of the product order is visible.

Supply diagonal/permutation operators and bounded coefficient base change.
Over a field a diagonal with nonzero entries is injective with dense range;
invertibility additionally requires bounded inverses.

Finite coordinate truncations have norm at most one and converge pointwise.
For a closed finite submodule `P⊂C₀(I,R)`, prove relative approximation
`‖π_S f−f‖≤ε‖f‖` uniformly on `P`, using bounded lifts of generators.
Over a Noetherian Banach–Tate ring prove finite-coordinate detection and
closedness of every finite submodule, then the contract `exists_finset_norm_le`:

```text
∃ finite S, ∃ C>0, ∀ f∈P, ‖f‖ ≤ C max_{i∈S} ‖f(i)‖.
```

No freeness of `P` is assumed. Relative approximation with `ε<1` actually
gives equality with the finite maximum; retain the weaker public bound.

### 2.7 Triangular perturbations

An output-first matrix on `ℕ` with entries of norm at most one, norm-one
multiplicative units on the diagonal, entries below it of norm at most
`0≤c<1`, and null columns defines an isometric automorphism of `C₀`.
Use its upper-triangular part, whose columns are finite and inverse bounded,
and a Neumann perturbation. Include the finite-column special case for Amice.

**Checks.** A rescaled one-dimensional `ℚ_p`-space can be potentially but
not isometrically orthonormalisable. A singleton satisfying orthogonality
does not make a torsion `ℚ_p⟨X⟩`-module free. The shift is bounded. A
matrix with entry `p` everywhere below the diagonal has non-null columns
and is excluded; a bidiagonal `1+pS` is an isometric automorphism.
Split the constant-term sequence of `K⟨T⟩` and the two degenerate exact
sequences, also after completed extension. For `P=0`, use `S=∅, C=1`.
For a coordinate line or a module supported on a fixed finite set, take
that coordinate set and `C=1`.

**Dependencies.** Layers 0–1, `C₀` and `lp`; completed tensors only for
the final corollary of §2.4. Sources: [Serre], [Sch] §10, [Bel] §II.1,
[Buz] Lemmas 2.2–2.3 with the Banach–Tate extension in [JN] §2.1,
and the proof of [Conrad] Lemma 1.1.5 (citing [BGR] 2.7.1/4).

## Layer 3 Continuous functions, Mahler coordinates and bounded measures

### 3.1 Profinite functions

For a profinite space `X` and a complete ultrametric module `E`, use the
sup norm on `C(X,E)`. Locally constant functions are dense: compactness
gives a finite clopen partition on which the oscillation is small. Continuous
functions need not themselves be locally constant. Establish the module,
completeness and evaluation bounds, and compatibility with finite clopen
partitions. General integration and measure topologies come from
PadicMeasuresIwasawaAlgebras Layers 0–1.

### 3.2 Mahler's theorem

Use the inverse of Mathlib's `PadicInt.mahlerEquiv` for complete ultrametric
modules with contractive `ℤ_p` action:

```text
C₀(ℕ,E) ≃ₗᵢ C(ℤ_p,E),   (a_n) ↦ (x ↦ Σ_n binom(x,n) • a_n).
```

Consume its finite-difference coefficient formula, uniqueness, uniform
convergence and norm identity, including the zero function. For an additional
commuting scalar action prove the corresponding scalar-linear refinement.
Derive translation, products in algebra-valued functions, and Stirling-number
formulas for monomials from existing binomial identities. Multiplication
by `g` is bounded by `‖g‖`, and is contractive only if `‖g‖≤1`.

For a continuous additive character `χ:ℤ_p→Rˣ`, identify its Mahler
coefficients as `(χ(1)−1)^n`. Conversely a topologically nilpotent `t`
gives the character `x↦(1+t)^x`. Require a complete normed `ℤ_p`-algebra
with bounded structural map. In a multiplicatively normed field the
parameter condition is exactly `‖t‖<1`; keep topological nilpotence over
general Banach algebras.

### 3.3 Van der Put coordinates

Use the clopen-ball basis with `e₀=1` and, for `n>0` of base-`p` length
`ℓ`, `e_n` the indicator of `n+p^ℓℤ_p`. Prove its coefficient isometry.
The zeroth coefficient is `f(0)`; for `n>0`, delete its leading digit
to obtain `n⁻`, and use coefficient `f(n)−f(n⁻)`. Thus for `f(x)=x` it is
the leading digit times `p^(ℓ−1)`. Identify the finite expansions for locally
constant functions, and give the bounded changes between these coordinates
and Mahler coordinates. Their columns are null; they need not be finite.

### 3.4 Bounded Amice transform, integral unit ball and `φ,ψ`

Use the native `AbstractMeasure ℤ_p R R`, namely bounded `R`-linear
functionals on `C(ℤ_p,R)`. For a Banach–Tate `ℤ_p`-algebra `R`, Mahler
duality gives a bijection with bounded moment sequences
`b_n=μ(binom(−,n))`. The Amice transform is the native formal series
`A_μ(T)=Σ_n b_n T^n`. Prove the ring-scalar boundedness assertion first.
For a complete normed `ℚ_p`-field `K`, supply
`norm_toCLMEquiv_eq_iSup_coeff` and
`mem_range_amiceTransform_iff`, with

```text
‖μ‖ = sup_n ‖b_n‖,    F is in the range ⇔ {‖coeff_n F‖ : n∈ℕ} is bounded.
```

The supremum is taken only on a bounded family. Import RestrictedPowerSeries'
open-disc algebra for evaluation; bounded coefficients give convergence
on every radius `<1`, not necessarily the closed unit disc.

Over `ℤ_p`, reuse the native integral Amice equivalence with `ℤ_p⟦T⟧`.
Give its compatibility with convolution and with extension to `ℚ_p`.
Prove `existsUnique_integral_iff_norm_le_one`: a rational-valued measure lies
in the dual unit ball exactly when it is the unique extension of an
integral-valued measure. The restriction tests every integral-valued
continuous function; its Mahler moments then lie in `ℤ_p`. Integral
measures need no artificial field operator-norm instance.
Prove the supporting integral scalar bound `isBoundedSMul_padicInt_padic`.

Define `φμ` by pushforward along `x↦px`. Define `ψμ` by restricting to
`pℤ_p` and transporting along `px↦x`:

```text
(φμ)(f)=μ(x↦f(px)),
(ψμ)(f)=μ(x↦ if x∈pℤ_p then f(x/p) else 0).
```

The second test function is continuous because `pℤ_p` is clopen. There
is no averaging factor `p⁻¹`. Prove boundedness, `ψφ=1`, and that
`1−φψ` restricts a measure to `ℤ_pˣ`. Prove
`A_(φμ)(T)=A_μ((1+T)^p−1)` using the convergent or augmentation-adic
substitution, with its hypotheses. Supply the moment identities for `ψ`;
the general Cartier decomposition and Iwasawa applications remain in
PadicMeasuresIwasawaAlgebras §§2.2, 2.11.
Retain the interfaces `phiMeasure`, `pMultiplesIndicator`, `weightMeasure`,
`existsUnique_psiMeasure` and `amiceTransform_phiMeasure`; the two projector
identities determine the `R`-linear map `ψ` uniquely.

**Checks.** The Mahler expansion of `x²` is `binom(x,1)+2binom(x,2)`.
For `x^p−x`, the monomial Gauss norm is `1`, while the continuous sup
norm and the Mahler coefficient norm are `p⁻¹`. Check a van der Put
coefficient whose leading digit is greater than one. Dirac measures have
norm one; `p⁻¹δ₀` is outside the rational dual unit ball. The sequence
`p^(−n)` is not a bounded measure's moment sequence. At `p=3`,
`φδ₂=δ₆` and `ψδ₆=δ₂`, while `ψδ₁=0`.
Also check `φ0=0`, `ψδ₀=δ₀` and `(φμ)(1)=μ(1)`. The Amice
identity sends `δ₀,δ₁,0` to `1,(1+T)^p,0`, respectively. The zero
measure belongs to the integral dual unit ball.

**Dependencies.** Layers 0–2, Mathlib's Mahler and measure APIs, and
RestrictedPowerSeries §7.1. Sources: [Mah], [Am], [Col] I.3 and [RJW] §3.

## Layer 4 Analytic stages and distributions on `ℤ_p`

### 4.1 Analytic coefficient models

Consume the restricted-series carrier, unit-radius `C₀` comparison,
evaluation, translation and differentiation from RestrictedPowerSeries.
Use its module-valued coefficient model where appropriate. Evaluation on
a bounded set lands in bounded continuous functions; do not assume the
unit ball of a general coefficient ring is compact.

Keep coefficient vectors distinct from their evaluated functions until
injectivity is proved. For algebra coefficients, one available hypothesis
is a separating family of bounded maps to complete nonarchimedean fields,
as specified in RestrictedPowerSeries §2. A Banach `ℚ_p`-module instead
has the injectivity proof from §4.4. A general bounded `ℤ_p`-module does
not have either conclusion automatically.

### 4.2 Discs and changes of centre

For `a∈ℤ_p` and `h∈ℕ`, use the disc `a+p^hℤ_p` and coordinate
`w=(x−a)/p^h`. Translation by an integral coordinate is an isometry on
restricted coefficient sequences, with inverse translation by its negative.
Prove independence of the chosen representative of the residue class,
using the supplier's translation theorem. State uniqueness of an expansion
only with the injectivity hypotheses of §4.1.

### 4.3 Stages, restriction and the algebraic union

Define `LA_h(E)=C₀(ZMod(p^h)×ℕ,E)` with the max Gauss norm. Its
evaluation is continuous and norm-decreasing. The transition to level
`h+1` re-expands `w=b+pv`, `0≤b<p`, by

```text
d_(a+p^h b,j) = Σ_{k≥j} binom(k,j) b^(k−j) p^j • c_(a,k).
```

Prove convergence, contraction, compatibility with evaluation, and the
composition law for transitions. Injectivity needs an additional
hypothesis, such as `p`-torsion-freeness of `E`; Banach `ℚ_p`-modules
satisfy it. For such coefficients form the algebraic direct limit
`LA(ℤ_p,E)` and identify it with the union of the stage images in
continuous functions when evaluation is injective. Its locally convex
topology is supplied by LocallyAnalyticDistributions §0.1, not here.

Define locally polynomial functions of degree at most `k` at level `h`
using the monomials `w^j`. Their coefficient model is
`E^(p^h(k+1))`. It is free of this rank over `R` when `E=R`, not for
arbitrary `E`. The unnormalised monomials `(x−a)^j` do not give an
integral basis. Prove polynomial density in each analytic stage.

### 4.4 Amice's analytic basis

Put `m_h(n)=⌊n/p^h⌋!` and `e_(h,n)(x)=m_h(n)binom(x,n)`.
Prove that these polynomials have integral disc coefficients, then that
their disc expansions induce an isometry

```text
C₀(ℕ,E) ≃ₗᵢ LA_h(E),      (c_n) ↦ Σ_n e_(h,n) • c_n.
```

This coefficient statement applies to complete ultrametric modules with
bounded `ℤ_p` action. The finite block reduction underlying the proof
uses degrees **at most** the block degree on earlier discs; do not replace
this by a strict inequality.
Make explicit the reindexing from Colmez's centres `−j`, `1≤j≤p^h`,
to the natural residue representatives used here before applying that lemma.
Apply §2.7 with the actual null-column condition.

Evaluation followed by Mahler coefficients is the diagonal map
`c_n↦m_h(n)c_n`. This proves evaluation injective for `p`-torsion-free
coefficients. For a Banach `ℚ_p`-space and continuous `f` with Mahler
coefficients `a_n`, deduce

```text
f∈LA_h ⇔ ‖a_n‖/‖m_h(n)‖ → 0,
‖f‖_h = sup_n ‖a_n‖/‖m_h(n)‖.
```

Local analyticity is equivalent to positive lower exponential decay of
`‖a_n‖`: `liminf_n (−log_p‖a_n‖)/n>0`, allowing `+∞` for zero
coefficients and ignoring `n=0`. The transition in Amice coordinates is
diagonal with multiplier `m_h(n)/m_(h+1)(n)`, whose norm tends to zero.
Export that estimate to CompactOperators and LocallyAnalyticDistributions;
their compactness and limit-topology theorems are downstream.

### 4.5 Exponential, logarithm and binomial evaluation

For a commutative Banach `ℚ_p`-algebra with bounded scalar action, develop
the usual logarithm on `‖u‖<1` and exponential on
`‖z‖<r_p=p^(−1/(p−1))`, reusing existing series identities. Prove
the inverse and addition formulas on the stated domains. Exact norm
identities use a normed-field or isometric-scalar hypothesis where required;
do not infer a Banach-algebra identity from field-valued evaluations alone.

For `x∈ℤ_p`, the binomial series defines `(1+t)^x` whenever `t` is
topologically nilpotent. Prove its continuous character law and compatibility
with `exp(x log(1+t))` on their common convergence domain. General
analytic exponents need their own convergence estimate; integral exponents
must not be confused with arbitrary elements of the unit ball of a
coefficient algebra. Use formal identities and bounded Cauchy products.
Supply power-contraction estimates and compatibility with the local-field
exponential and logarithm imported from LocalFieldsRamification.

### 4.6 Analyticity of additive characters

For a complete normed extension `K/ℚ_p` and `‖t‖<1`, the character
`χ_t(x)=(1+t)^x` lies in `LA_h(K)` exactly when

```text
‖t‖ < p^(−1/((p−1)p^h)).
```

Equivalently `‖(1+t)^(p^h)−1‖<r_p`. Derive the criterion from the
Amice coefficients and prove the boundary is excluded, including the
subsequence that detects failure of convergence there. On each disc the
analytic expansion has norm one. Every continuous field-valued character
is analytic at some level. For Banach-algebra coefficients retain sufficient
power/convergence conditions and the actual coefficient bound, without
asserting the field-valued necessary condition or a norm-one bound.

### 4.7 Algebraic distributions and quantitative Amice transform

For a complete normed extension `K/ℚ_p`, let `D(ℤ_p,K)` be the
`K`-linear functionals on the algebraic union `LA(ℤ_p,K)` whose
restrictions to every `LA_h` are bounded. Equivalently use compatible
stage functionals. Supply the comparison between these descriptions and
the stage operator seminorms, but put no global topology on this carrier.

If `b_n=μ(binom(−,n))`, prove that the stage norm is

```text
D_h(b) = sup_n ‖b_n‖ ‖⌊n/p^h⌋!‖.
```

For sequences defining such a distribution, put
`S_h(b)=sup_n ‖b_n‖ p^(−n/((p−1)p^h))` and prove

```text
S_h(b) ≤ D_h(b) ≤ p S_(h+1)(b).
```

Prove all relevant sets bounded before using these real suprema. Supply
`amiceDiscNorm_le_amiceDualNorm` and
`amiceDualNorm_le_amiceDiscNorm`, using `amiceDualNorm=D_h` and
`amiceDiscNorm=S_h` with this normalisation.
For an arbitrary moment sequence, the following are equivalent: every
`D_h` is finite; every `S_h` is finite; and `Σ b_n T^n` converges on
every closed radius `0<ρ<1`. Boundedness at a larger radius gives decay
at a smaller one. A bound at just one level is insufficient.

Construct the Amice bijection with the open-unit-disc series algebra
supplied by RestrictedPowerSeries §7.1, including its inverse and uniqueness.
The topological isomorphism for the strong dual is a theorem of
LocallyAnalyticDistributions §1.1, consuming these inequalities.

Include continuous measures as distributions, identify Dirac transforms
as `(1+T)^x`, and define additive convolution by the bounded two-variable
test-function pairing. Prove its stage estimates and that Amice takes it
to multiplication. Compare it with native measure convolution and the
general distribution product supplied later by LocallyAnalyticDistributions
§1.4. No general manifold or tensor-distribution construction is required
for this one-variable interface.

**Checks.** At level zero the function `x^p−x` has Gauss norm `1`.
For `E=𝔽_p`, its nonzero coefficient vector re-expands to zero on all
level-one discs, exhibiting the missing injectivity hypothesis. Check
`h=0`, polynomial tails and the diagonal transition on the first block.
The derivative functional at zero has moments `b_n=(−1)^(n−1)/n`
for `n≥1`, so its transform is `log(1+T)`: it is a distribution but
not a bounded measure. The moments `b_n=1/n!` instead give a bounded
functional on level zero but not on level one; they do not define a
distribution on the full union. Use `exp(p)` for odd primes and `exp(4)` at
`p=2`; the exponential of `2` is outside the convergence disc. A
parameter of norm `2^(−1/2)` fails the level-one criterion and satisfies
the level-two criterion.

**Dependencies.** Layers 0–3 and RestrictedPowerSeries Layers 0–2, §7.1.
Sources: [Am], [Col] I.4 and II.2, [ST] and [RJW] Theorem 3.43.

## Layer 5 Characters, specialisation and coefficient rings

### 5.1 Units and the chosen generator

Let `q=p` for odd `p` and `q=4` for `p=2`, and
`Δ=(ℤ/qℤ)ˣ`. Construct the continuous product decomposition

```text
ℤ_pˣ ≃ Δ × ℤ_p,   x ↦ (x̄, log(x/ω(x̄))/q),
γ=exp(q) ↦ (1,1).
```

Here the second factor is written additively and `ω` is a multiplicative
section `Δ→ℤ_pˣ`; the inverse sends `(δ,s)` to `ω(δ)exp(qs)`.
Import the odd-prime Teichmüller section and local-field
logarithm/exponential. At `p=2`, use the sign section modulo four;
successive `2`-powering does not recover that sign. Prove uniqueness,
continuity and compatibility of the decomposition and its inverse.

### 5.2 Continuous weights and their parameters

Define `WeightSpace(G,R)` as continuous monoid homomorphisms `G→Rˣ`
using topological structures, without imposing a norm at the definition.
For `G=ℤ_pˣ` and a complete normed `ℤ_p`-algebra `R`, parametrise
weights by a character `η:Δ→Rˣ` and a topologically nilpotent
`T_κ=κ(γ)−1`. Establish the parameterisation in both directions.

Retain `nonempty_weightSpace_equiv` for this parameterisation.
For complete normed fields over `ℚ_p`, `‖T_κ‖<1`. Over `ℂ_p`
the resulting set has `|Δ|` open-disc components. Its analytic-space
structure, universal analytic family and geometric Mellin transform belong
to PadicMeasuresIwasawaAlgebras and LocallyAnalyticDistributions.
Field-valued weights take values of norm one by compactness. In a general
Banach algebra their values form a bounded set, which need not have bound one.

Compute algebraic and locally algebraic weights:
`κ(x)=x^kψ(x)` has `T_κ=exp(kq)ψ(γ)−1` for `k∈ℤ` and finite-order
`ψ`. Separate cancellation and zero parameters from the valuation formula
for roots of unity. For exact conductor `p^m`, the principal part of `ψ`
has order `p^(m−1)` at odd `p`, `m≥2`, and order `2^(m−2)` at `p=2`,
`m≥3`. Consequently `v_p(ψ(γ)−1)` is
`1/(p^(m−2)(p−1))` and `1/2^(m−3)`, respectively. Treat the smaller
conductors separately. For another generator `γ'=γ^u`, `u∈ℤ_pˣ`,
prove `T'=(1+T)^u−1` and its inverse.

### 5.3 Universal characters and bounded integral-measure functions

Import the completed group algebra `Λ=ℤ_p[[ℤ_pˣ]]` and its topology
from ProfiniteProPGroups Layer 9. Extend its procyclic coordinate comparison
across the finite factor to obtain

```text
Λ ≃ ℤ_p[Δ]⟦T⟧,      T=[γ]−1,
[x]=[x̄](1+T)^(log(x/ω(x̄))/q).
```

The finite-factor comparison and agreement with this chosen generator
are the new targets; do not rebuild the inverse-limit algebra. At odd `p`
the integral finite character decomposition splits the coefficient ring.
At `p=2`, `ℤ₂[Δ]` is local with maximal ideal `(2,δ−1)` and its
series ring has maximal ideal `(2,T,δ−1)`; the two characteristic-zero
characters do not give an integral product decomposition.

Give two distinct universal-property contracts:

* **Adic target:** a complete separated linearly topologised `ℤ_p`-algebra
  `S`, a finite-factor character and a coordinate satisfying the native
  `PowerSeries.HasEval` hypotheses give `exists_character_of_hasEval`
  and the unique continuous algebra map. Include `eq_aeval_binomialSeries`
  for the converse formula of an existing weight. Use the adic convergence and
  continuity hypotheses; no normed-field instance on `S` is assumed.
* **Normed target:** a complete normed `ℤ_p`-algebra with bounded
  structural map and a topologically nilpotent `t` gives the corresponding
  character and continuous specialisation homomorphism. The small-norm
  Banach `ℚ_p`-algebra case is
  `existsUnique_character_of_norm_lt_one`. Prove the binomial
  evaluation formula and uniqueness from the dense group algebra.

Both send `T` to `t` and the universal character to the supplied weight;
they agree when both sets of hypotheses hold. A coefficient sup-norm on
integral series must not replace the profinite source topology.
Prove the supporting fact `isLinearTopology_padicInt` for integral examples.

Import the general measure/completed-group-algebra comparison from
PadicMeasuresIwasawaAlgebras §1.7, whose construction is independent of
Amice. Prove that it agrees with §3.4's Amice coordinate after the
principal-unit identification. This is the requested specialised
`amiceTransform_completedGroupAlgebra_compat` comparison, not a second
construction of the general comparison.

Finally use the general coefficient-extension interface to view an integral
measure `ν` on `ℤ_pˣ` as a `ℂ_p`-valued measure, and set

```text
measureFun ν κ = ∫ κ(x) dν(x),    κ∈WeightSpace(ℤ_pˣ,ℂ_p).
```

Use the supplier's coefficient extension for `extendIntegralMeasure` and
the underlying continuous function `weightTest`. The field-valued pairing
with an already extended measure is the prototype's `measurePairing`;
`measureFun` is its composite with `extendIntegralMeasure`. Supply `measureFun_norm_le`
and `measureFun_injective`: `|measureFun ν κ|≤‖ν_(ℂ_p)‖≤1`, and weights separate integral
measures. For injectivity, polynomial characters and density of polynomials
on the clopen unit locus suffice. Compatibility with specialisation of `Λ`
is required. This is a bounded function on a set of weights; a geometric
weight-space sheaf or a topology on the space of measures is not constructed.

### 5.4 Analytic levels of weights

For `h≥v_p(q)`, a field-valued weight is analytic on unit discs modulo
`p^h` exactly when

```text
‖κ(exp(p^h))−1‖ < r_p,
equivalently ‖T_κ‖ < p^(−q/(p^h(p−1))).
```

Prove this by reducing to §4.6 through `log(x/ω(x))/q`.
Every continuous field-valued weight satisfies it for some `h`.
Give the locally algebraic conductor bound, handling the minimum allowed
level and trivial finite-order character separately: for `κ(x)=x^kψ(x)`
with conductor dividing `p^m`, every `h≥max(m,v_p(q))` suffices.
For Banach-algebra
coefficients use sufficient convergence conditions and an explicit bound
on the resulting expansion; compactness alone does not give norm one.

### 5.5 Scalar analytic factors for automorphic applications

For a field-valued weight satisfying §5.4 at level `h`, extend its
principal-unit part analytically to `1+p^h𝒪_K`. For
`d∈ℤ_pˣ(1+p^h𝒪_K)` and `‖c‖≤‖p^h‖`, expand `κ(cz+d)`
on the closed unit disc and prove its Gauss norm is one. Put
`t_h=κ(exp(p^h))−1`. A radius `r>0` satisfying

```text
r‖c‖ < r_p,       r‖c‖‖t_h‖ < ‖p^h‖ r_p
```

gives convergence on that radius, Gauss norm at most one, and coefficient
bounds `‖a_n‖≤r^(−n)`. State the corresponding Banach-algebra version
with the actual bound on the constant factor and on the analytic character.
Use RestrictedPowerSeries for composition and coefficient estimates.
For nonnegative algebraic weight the expansion agrees with `(cz+d)^k`.
Matrix actions and the ordering convention in their cocycle identity are
owned by quaternionic modular-form theory;
this section supplies only scalar expansions.

### 5.6 An annular coefficient ring

Construct the specific integral coefficient ring with normal forms

```text
H = {Σ_(m∈ℤ) d_m T^m : d_m∈ℤ_p, v_p(d_m)≥max(0,−m)}.
```

Prove convergence of each convolution coefficient, the algebra operations,
and the algebraic identification `H≃ℤ_p[[T,U]]/(TU−p)` with `U=p/T`.
This includes arbitrary formal tails in `U`. It is not the `p`-adic
completion of the polynomial algebra `ℤ_p[[T]][p/T]`: that completion
requires additional decay of the `U`-coefficients. Do not conflate the
formal `(T,U)` topology with the gauge used below.

On `H[1/T]`, establish the coefficient criterion
`v_p(d_m)≥max(0,−m−k)` for some `k≥0`, allowing `d_m∈ℤ_p`.
For a fixed `α∈(0,1)`, construct the complete multiplicative-`T` gauge
whose unit ball is `H` and `‖T‖=α`, and prove that it is a
nonarchimedean Banach–Tate ring. State completeness for this gauge topology.
In particular `‖U‖=1`; the partial sums of `Σ_(j≥0) U^j` do not
converge in this topology even though the formal sum is an element of `H`.

At every `t∈ℂ_p` with `p⁻¹<|t|<1`, construct the evaluation
`T↦t, U↦p/t` and prove continuity using divisibility bounds. The
evaluations over this annulus in `ℂ_p` are jointly injective. There may
be no such points over the ground field `ℚ_p`; that field alone cannot
test injectivity. A general gauge-continuous specialisation need not be
Lipschitz for arbitrary choices of `α`.

Adjoin the finite factor by `H[Δ]`, compare it with the halo coefficient
construction in [LWX] §3.15, and track the ideal `(p,T)=(T)` of the
principal coefficient ring. At `p=2`, the full finite-factor maximal ideal
also contains `δ−1`; retain the integral group ring. Annular geometry,
Fredholm series and slope bounds remain downstream.

**Checks.** At `p=2`, test both sign characters and `γ=exp(4)`.
Specialise the universal character at the trivial weight and at an
algebraic weight. Verify `T↦0`, the finite-character components, and
the generator-change formula. Dirac integration gives `measureFun
δ_x κ=κ(x)`. Test the halo normal forms `T`, `U`, `p=TU` and
`(1−U)⁻¹=Σ U^j`; distinguish formal equality from convergence in the
gauge norm. Do not identify `H[Δ]` with an integral product at `p=2`.

For universal specialisation also check `(1+T)^n` and the infinite series
`(1+T)⁻¹=Σ(−T)^j`, which is not `1−T`. In the maximum-norm
dual-number algebra, `s↦1+sε` has `‖T_κ‖=1` and evaluation
`F↦coeff₀(F)+coeff₁(F)ε`; it lies outside the small-norm subfamily.
The coordinate `p` gives evaluation into both `ℤ_p` and `ℚ_p`, although
`ℚ_p` is not linearly topologised over itself. The coordinate `p−1`
does not give continuous evaluation into `ℚ_p`.

For measure functions check multiplicativity on convolution of Dirac
measures and additivity on their sum. If `a≠b`, the measure `δ_a−δ_b`
vanishes at the trivial weight but has value `a−b≠0` at `κ(x)=x`.
Every Dirac measure attains the bound: its extended norm and every
`|κ(a)|` are one.

**Dependencies.** Layers 0–4, RestrictedPowerSeries, LocalFieldsRamification,
ProfiniteProPGroups Layer 9 and the independent general comparison in
PadicMeasuresIwasawaAlgebras Layer 1. Sources: [Col], [RJW] §§3–4,
[JN] and [LWX] §§2–3.

## Dependency order and completion

Layers 0–2 precede the bounded duality in Layer 3; Layer 4 consumes the
restricted-series supplier and Layer 3; Layer 5 consumes both. Two apparent
cycles must be resolved at the stated interfaces:

* LocallyAnalyticDistributions §0.0 supplies the general completed tensor
  construction and its functoriality. Only the last corollary of §2.4
  consumes it. Countable-type splitting itself is independent of tensors
  and of the later distribution layers.
* PadicMeasuresIwasawaAlgebras §1.7 supplies the general measure/group-algebra
  comparison without Amice. Section 5.3 then proves coordinate compatibility.
  The consumer's later Amice and weight-space layers may use that result.

A layer is complete when its definitions use native structures, its targets
and comparison maps are proved, its stated checks are formalised, and its
supplier/consumer hypotheses agree. Test zero objects and empty indices,
non-Noetherian versus Noetherian coefficients, all primes, and the strict
radius boundaries. Admitted roadmap signatures are not completed results.
Integration must not introduce `sorry`-based instances or silently change
the topology of an imported object.

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
  especially §§3–4 and Theorem 3.43.
* **[LWX]** R. Liu, D. Wan and L. Xiao,
  [*The eigencurve over the boundary of weight space*](https://arxiv.org/abs/1412.2584),
  especially §§2–3.

## Existing Lean work

The following are secondary implementation sources, not the specification or
build dependencies. The PhD references are pinned to
`eefb3d91f34b27d0bc7822140fa85fecae029884`. Assess candidate declarations and
their proof dependencies individually; a source file's existence is not a
claim that its targets are proved. Coordinate integration with the author and
retain the independent import chains.

| Source | Comparison with this roadmap |
| --- | --- |
| [`PhD/TauCeti/Code/PadicFunctionalAnalysis/`](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/TauCeti/Code/PadicFunctionalAnalysis) | Banach–Tate norms, model spaces and countable-type arguments. Reuse native Mathlib/Tau Ceti carriers and audit admitted targets, including instance dependencies. |
| [`PhD/Main/`](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/Main) | Independent functional-analysis and character developments; compare their conventions and hypotheses rather than making their import chain a prerequisite. |

[RestrictedPowerSeries]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/fae4b92f3233ec656fb01ae590c2bac0abd5eb42/TauCetiRoadmap/RestrictedPowerSeries/README.md
[NewtonPolygons]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/5164eb00764fb2ead6baadcc5cb69ff73507c8b5/TauCetiRoadmap/NewtonPolygons/README.md
