# Geometric measure theory: rectifiability, BV, and finite perimeter

Build a reusable Euclidean geometric measure theory library through the structure theorem for
sets of finite perimeter, area and coarea, approximation, compactness, traces, and Gauss–Green.
These results supply the measure-theoretic foundation for
[Euclidean isoperimetry](../Isoperimetry/README.md), including its sharp inequality and ball rigidity.
The objects must support further analysis independently of that application: restriction,
localization, a.e. equivalence, change of variables, and comparisons with classical calculus are
part of their basic theory.

The scope is finite-dimensional real Euclidean spaces, with metric curve results in the greater
generality their statements permit. Currents, varifolds, and regularity theory for minimizing
hypersurfaces are outside this roadmap. All the milestones below are required.
[Suggested.lean](Suggested.lean) illustrates some interfaces; this README is definitive.

## Conventions and ownership

- Use `EuclideanSpace ℝ (Fin n)` and intrinsic finite-dimensional real inner-product spaces,
  with `volume` for Lebesgue measure. Transfer results by linear isometry equivalences rather
  than developing coordinate-specific theories. In dimension two include the existing real
  inner-product space `ℂ`.
- For set theorems, Lebesgue measurability means `NullMeasurableSet E volume`; use
  `MeasurableSet` for a Borel representative and transfer by equality a.e. The full perimeter
  theory must accommodate all Lebesgue measurable representatives, including null
  modifications of Borel sets.
- **Hausdorff measure is the normalized Euclidean measure**
  [`MeasureTheory.Measure.euclideanHausdorffMeasure`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Geometry/Euclidean/Volume/Measure.html#MeasureTheory.Measure.euclideanHausdorffMeasure),
  written `μHE[k]`. It agrees with `volume` on a `k`-dimensional Euclidean space. Write
  `Hᵏ` for this measure below. Retain explicit comparison lemmas with Mathlib's raw Hausdorff
  measure. Do not silently exchange the two normalizations.
- A rectifiable parameterized curve is a continuous map on a compact real interval with
  `BoundedVariationOn`; its length is the existing `eVariationOn`. No new path or length
  carrier replaces Mathlib's maps, `Path`, or total variation. Use extended nonnegative
  quantities first; conversion to real length requires a finiteness theorem.
- A countably `k`-rectifiable set is covered, up to an `Hᵏ`-null set, by countably many
  Lipschitz images of subsets of `ℝᵏ`. Distinguish this from finite `Hᵏ` measure and from
  parameterized rectifiability. State measurability separately where it is needed.
- For real-valued functions on Euclidean open sets, `BV_loc(Ω)` means a locally integrable
  function whose distributional
  derivative is a locally finite vector-valued Radon measure. `BV(Ω)` additionally requires
  integrability and finite total variation. Use the distributional identity
  `∫ u div φ = −∫ φ · dDu` for smooth compactly supported vector fields in `Ω`.
  Derivatives and variation are invariant under equality a.e. on `Ω`.
- Define extended perimeter for every measurable set by the supremum of
  `∫_E div φ` over smooth vector fields compactly supported in the open set `Ω`, with
  pointwise norm at most one. A set has locally finite perimeter when its indicator
  belongs to `BV_loc`. Its perimeter measure is `|Dχ_E|`, and the supremum agrees with
  `P(E; Ω) = |Dχ_E|(Ω)` whenever that measure exists. Finite perimeter on the
  whole space means `P(E; univ) < ∞`; it does **not** require finite volume. Global `BV`
  membership of the indicator additionally requires finite volume. Complements must have
  the same perimeter.
- The outward measure-theoretic unit normal has sign
  `Dχ_E = −ν_E Hⁿ⁻¹|∂*E`. Distinguish topological frontier, essential boundary, and reduced
  boundary. The last two are measure-theoretic notions, with statements independent of
  the chosen a.e. representative.

[PDE](../PDE/README.md), Lane A.1–A.3, owns weak-derivative Sobolev spaces and their smooth
density and Fourier comparisons. Extend the actual `TauCeti.HasWeakFDerivOn` and `W1p`
APIs to measure-valued derivatives; prove the comparison rather than inventing another weak
derivative. Its Lane A.5–A.6 owns Sobolev Poincaré, domain traces, extensions, and Rellich.
This roadmap owns BV versions and their agreement with those Sobolev results.

[ConformalMapping](../../Completed/ConformalMapping/README.md), L5, owns Jordan separation and the
filled-hull topology. [DifferentialGeometry](../DifferentialGeometry/README.md), whose
[Green layer 5.6 targets](https://github.com/TauCetiProject/TauCetiRoadmap/pull/826) specify
the flat planar extension, owns
winding numbers, planar curve integrals, and Green's area identity. This roadmap owns metric
length, arclength, rectifiability, and Hausdorff measure comparisons. The sharp Euclidean
isoperimetric constants, Brunn–Minkowski, rearrangements, and ball rigidity belong to
[Isoperimetry](../Isoperimetry/README.md). The nonsharp local estimate in G4 below is a
foundation for perimeter structure, not a dependency on that sharp theorem.

## Existing floor and API design

Consume Mathlib's Hausdorff measures, Radon measures, signed and vector measures, total
variation, Radon–Nikodym and Lebesgue decomposition, Bochner integration, Rademacher and
change of variables, and the calculus of test functions. Tau Ceti supplies
`TauCeti.metricDerivative`, its a.e. existence and integrable distance bound for
absolutely continuous curves, the `C¹` variation–speed identity in
`TauCeti.Analysis.Calculus.MetricVariation`, weak derivatives, and `W1p`. G1 extends these
curve results; G2–G3 build the remaining measure and derivative bridges.

Use [`LinearMap.normDet`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/NormDet.html#LinearMap.normDet)
and its continuous-linear-map version for geometric Jacobians. Mathlib already relates it
to Gram determinants and the volume of linear images; do not introduce another Jacobian
for rectangular linear maps. In particular, consume
`LinearMap.euclideanHausdorffMeasure_image_eq_normDet_mul_volume` for linear images.
For the coarea Jacobian of a map from dimension `n` to `m ≤ n`,
use the norm determinant of its adjoint. Prove the chart and tangent-space comparison lemmas
needed for the nonlinear formulas.

Follow the API direction of these Mathlib proposals and discussions, implementing missing
results in Tau Ceti without waiting for them:

- [Arclength continuity, mathlib4#31766](https://github.com/leanprover-community/mathlib4/pull/31766):
  cumulative variation and continuity for continuous rectifiable curves.
- [Finite variation of finite-dimensional vector measures, #42103](https://github.com/leanprover-community/mathlib4/pull/42103):
  vector-measure variation, used by G2–G3.
- [Connected sets of finite Hausdorff length, #41839](https://github.com/leanprover-community/mathlib4/pull/41839):
  diameter and length comparisons, used by G1.
- [Uniformly distributed measures, #37310](https://github.com/leanprover-community/mathlib4/pull/37310)
  and the [Hausdorff/coarea discussion](https://leanprover.zulipchat.com/#narrow/stream/217875-Is%20there%20code%20for%20X%3F/topic/Finding%20n-dimensional%20polar%20coordinate%20formula%20for%20sobolev.):
  normalized Hausdorff measure, sphere measures, and polar integration. G2 requires the
  actual sphere-measure comparison, not merely a uniqueness theorem that could prove it.

## G1 — Rectifiable curves and arclength

Consume the existing variation API: `eVariationOn.mono`, `Icc_add_Icc`,
`comp_eq_of_antitoneOn`, `comp_eq_of_monotoneOn`, `lowerSemicontinuous_uniformOn`, and
`edist_le`, together with Tau Ceti's `eVariationOn_le_liminf_of_eventually_le`. Use the
`TauCeti.IsCurveJoining`/`Path` comparison in `Topology/MetricSpace/Length.lean` where a
joining curve is required. Build the curve-specific concatenation and restriction
comparisons not already expressed by those APIs. Build cumulative arclength,
prove its continuity and endpoint values, and factor a rectifiable curve through a
unit-speed Lipschitz curve on its length interval. Handle constant pieces by factorization;
an inverse of the cumulative arclength function is not available for a general curve.
For injective arcs, give the strictly increasing reparametrization and its homeomorphism.
For closed curves injective except at the endpoints, give an arclength parametrization
with that same simplicity property. Include zero-length cases explicitly.

For absolutely continuous curves prove length equals the integral of the metric derivative.
In finite-dimensional real normed spaces identify it a.e. with the norm of the vector derivative and
deduce `eVariationOn γ = ∫⁻ ‖γ'‖`. Supply the interval-integral real-valued form with its
integrability and finite-length hypotheses. Relate the factorization to the FTC and prove
that a nonconstant arclength parametrization has speed one a.e. Reconcile these statements
with existing `C¹` and `Path` APIs.

Prove `H¹(trace γ) ≤ length γ`, with equality for injective arcs and simple closed curves
(endpoints identified). Conversely, a continuous injective arc or simple closed curve
with finite `H¹` trace has finite variation. Prove this using partitions, the connected-set
diameter bound, and additivity of trace measure; it must not assume a Lipschitz input
parameter. Thus finite geometric length and parameterized rectifiability agree for these
curves. Include the multiplicity formula supplied by G2 for nonsimple
curves, so a twice-traversed circle has twice the variation length and the same trace
measure. Deduce that rectifiable planar traces have zero two-dimensional volume.
Make all length identities invariant under increasing continuous onto reparametrizations.
DifferentialGeometry's [rectifiable-curve interface](../DifferentialGeometry/README.md#rectifiable-curves-and-geometric-measure-theory)
consumes this arclength factorization to construct geometric
line integrals and their orientation/parametrization comparisons. G1 does not use those
integral comparisons as an input to the metric theory.

The variation, factorization, upper length bound, and exact comparisons for injective arcs
and simple closed curves are G1 targets independent of G2, using partitions and the
connected-set diameter bound for the lower comparison. The multiplicity formula for
nonsimple curves follows G2's one-dimensional area formula. G2 does not assume that
multiplicity formula in its proof.

## G2 — Rectifiability, area, and coarea

Build the closure and transport API for countably rectifiable sets: measurable restrictions,
countable unions, null modifications, Lipschitz images, and isometries. For countably
`k`-rectifiable sets with locally finite `Hᵏ` measure prove existence and a.e. uniqueness
of approximate tangent `k`-planes,
measurability of the tangent-plane field, and the density theorem. Build tangential
differentiation for Lipschitz maps on these sets and show independence of charts and null
modifications. Prove agreement with tangent spaces and surface Jacobians on `C¹` graphs.

Prove the **area formula** for Lipschitz maps `f : ℝᵐ → ℝⁿ`, `m ≤ n`, on measurable sets,
with nonnegative measurable weights:

```
∫_A g(x) J_m f(x) dx = ∫_{ℝⁿ} Σ_{x ∈ A ∩ f⁻¹{y}} g(x) dHᵐ(y).
```

Multiplicity is an extended nonnegative count, with measurable weighted fiber sums; do
not use a finite-cardinality convention that returns zero for infinite fibers. Supply the
injective specialization and finite-dimensional isometric transport. Derive the tangential
area formula for maps on countably rectifiable sets.

Prove the **coarea formula** for Lipschitz `f : ℝⁿ → ℝᵐ`, `m ≤ n`, with the same weighted
generality, integrating `Hⁿ⁻ᵐ` over fibers and Lebesgue measure in the target. Include the
fiber measurability, a.e. rectifiability, and exceptional-set statements the formula needs.
Give real integrable versions after proving finiteness. The differentiability, covering,
measurability, and approximation lemmas needed for these formulas are themselves targets
of G2, using Mathlib's Rademacher theorem rather than presuming nonlinear area or coarea.

Derive graph surface measure, spherical surface measure, polar integration, and slicing by
linear projections. Prove `Hⁿ⁻¹(sphere c r) = n ω_n r^(n−1)` for `n ≥ 1`, `r > 0`, where
`ω_n = volume(ball 0 1)`, and the unit-sphere comparison with angular measure. Normalize
`H⁰` as counting measure. These identities must agree with existing ball volume and
linear-image formulas; they provide the actual constants used by isoperimetry.

## G3 — Distributional BV and variation measures

Construct the measure-valued derivative, its uniqueness, and its total variation from the
test-function identity. Prove equivalence with the local variational characterization
using compactly supported smooth vector fields with pointwise norm at most one. Establish
the Radon representation and its localization on arbitrary open subsets, using Mathlib's
Riesz representation and vector-measure infrastructure and building every missing bridge.
Handle locally finite derivatives on unbounded domains by compatible restrictions; do not
assume a globally finite vector measure at the definition of `BV_loc`.

Give the unbundled a.e.-invariant predicate and the normed a.e.-quotient `BV(Ω)` with norm
`‖u‖₁ + |Du|(Ω)`. Prove completeness, restriction, scalar multiplication, addition, lattice
operations, multiplication by smooth cutoffs, Lipschitz scalar composition and its variation
bound, affine isometric transport, and scaling by positive dilations. For global BV
composition require integrability of the composite, obtained for example from `φ(0)=0`;
local BV has no such whole-space integrability requirement. Supply the polar decomposition
`Du = σ_u |Du|`, with `‖σ_u‖ = 1` a.e., and the absolutely continuous/singular decomposition.
Do not apply the classical chain rule across jumps: composition results must give the
correct BV identity or a variation inequality.

Compare with `TauCeti.HasWeakFDerivOn` and `W1p`: a `W¹,¹` function is BV, its derivative
measure has weak gradient as density, and its variation is the integral of the gradient
norm. Conversely an integrable BV function with an absolutely continuous derivative is
`W¹,¹`. Include the local versions and the one-dimensional comparison with classical
variation and the derivative measure of a BV function. Prove measure-valued integration
by parts and agreement with smooth calculus.

## G4 — Approximation, compactness, and scalar coarea

Prove lower semicontinuity of variation under local `L¹` convergence, weak convergence of
the derivative measures under locally bounded variation, and compactness in `L¹_loc` for
families locally bounded in `L¹` and variation. For bounded Lipschitz domains derive global
`L¹` compactness under a global BV bound. Establish convolution estimates, local smooth
approximation on arbitrary open sets by a partition of unity, and **strict approximation**:
`u_j → u` in `L¹` and `|Du_j|(Ω) → |Du|(Ω)`.

Prove scalar BV coarea on open sets:

```
|Du|(Ω) = ∫_{ℝ} P({x | u(x) > t}; Ω) dt.
```

The superlevel sets have locally finite perimeter for a.e. `t`; provide their measurable
dependence on `t`, the local measure identity, layer-cake formulas, truncation formulas,
and the converse characterization. Derive approximation of finite-volume finite-perimeter
sets by bounded smooth sets with volume convergence and perimeter convergence on the whole
space. Build cutoff/truncation and regular-level arguments. Consume
`TauCeti.addHaar_image_criticalPoints_eq_zero` from
`TauCeti.Analysis.Calculus.Sard.OutermostStratum` in the smooth scalar regime: its finite
regularity threshold is automatically met by `C∞` functions. Build the regular-level and
level-set boundary comparisons needed for the approximation from that theorem. Do not strengthen
this to preservation of equality cases under approximation.

Supply BV Poincaré on balls and the nonsharp relative perimeter estimate

```
min(|E ∩ B_r|, |B_r \ E|)^((n−1)/n) ≤ C_n P(E; B_r),    n ≥ 2,
```

for locally finite-perimeter sets and `r > 0`, with a positive constant depending only on
`n`, plus scaling and localization. Consume Mathlib's compactly supported `C¹` estimate
`MeasureTheory.eLpNorm_le_eLpNorm_fderiv_one`; build its BV and local-domain extensions,
and the covering estimates needed for this result here, without using the
sharp theorem in Isoperimetry. This is the analytic input for G5's boundary structure.

## G5 — Finite perimeter and boundary structure

Build the usable perimeter API: a.e. invariance, complements, locality, relative perimeter,
unions/intersections with the submodularity inequality, truncation by balls, scaling,
isometries, smooth approximation, compactness, and lower semicontinuity. Distinguish finite
perimeter from finite volume in every theorem.

Define measure-theoretic density, essential interior/exterior, essential boundary, reduced
boundary, and outward normal. Prove the Lebesgue density facts and **De Giorgi's structure
theorem**: the reduced boundary is countably `(n−1)`-rectifiable, its blow-up is an oriented
half-space at `Hⁿ⁻¹`-a.e. point, and

```
|Dχ_E| = Hⁿ⁻¹|∂*E,       Dχ_E = −ν_E Hⁿ⁻¹|∂*E.
```

Prove that the essential boundary differs from the reduced boundary by an `Hⁿ⁻¹`-null set
for locally finite-perimeter sets. Supply the converse finite-perimeter criterion for a
measurable set whose essential boundary has locally finite `Hⁿ⁻¹` measure. In particular,
establish `P(E) ≤ Hⁿ⁻¹(frontier E)` for measurable sets, as an extended-measure statement
with the appropriate local version. Its proof must include the boundary criterion; a
finite topological boundary measure is not an assumed smoothness hypothesis.

The proofs of blow-up, density estimates, covering, and rectifiability are G5 targets,
resting on G2–G4. Specifying a reduced-boundary predicate without proving the representation
theorem does not discharge this milestone.

## G6 — Traces, Gauss–Green, and classical domains

Construct the BV trace on bounded Lipschitz domains with the `Hⁿ⁻¹` boundary measure,
its boundedness estimate, interior approximate-limit characterization a.e., uniqueness,
locality, and agreement with PDE Lane A.6's Sobolev trace. Establish the extension operator,
zero-extension derivative formula including the boundary trace term, and gluing across
a Lipschitz interface. Use the boundary regularity and chart conventions of PDE A.6;
build missing surface-measure/chart comparisons using G2, rather than a second domain type.

Prove Gauss–Green for locally finite-perimeter sets and compactly supported `C¹` vector
fields, including localized forms and integrable noncompact-support extensions under
explicit hypotheses. For BV functions on Lipschitz domains give integration by parts
with the trace term. Compare outward normals and surface area for Lipschitz and `C¹`
domains with the classical graph formulas and DifferentialGeometry's Euclidean divergence
theorem. This comparison does not require manifold Stokes to construct the flat theory.

For the bounded region `Ω = TauCeti.filledHull C \ C` of a rectifiable Jordan curve,
prove finite perimeter and `P(Ω) = H¹(C)`. Explicitly prove the Jordan index theorem for
its closed simple AC arclength parametrization: for one sign `σ ∈ {−1,1}`, the existing
winding number equals `σ` on `Ω` and zero on the unbounded complementary component.
Identify that sign with orientation and prove its reversal and parametrization laws;
it is a conclusion, not a supplied hypothesis of Green's theorem.
The proof must establish the boundary normal and
measure comparison, using Jordan separation, G1–G5 and the AC boundary-integral identity
of DifferentialGeometry 5.6, with parametrization transport from G1. With `Jv = I*v`
and arclength unit tangent `τ`, identify the outward normal as `−σ Jτ` a.e. and the
corresponding signed boundary measure, so clockwise and counterclockwise curves both
give the same perimeter. This supplies
the genuine bridge from the measure-theoretic inequality to arbitrary rectifiable Jordan
curves; `frontier Ω = C` alone gives no equality of perimeter and curve length.

## Acceptance examples and completion

Compute derivative measures and perimeter for intervals, balls, boxes, and annuli; include
the endpoint atoms for a one-dimensional step function. Construct the Cantor–Lebesgue
function `C` on `[0,1]`, extended constantly outside that interval, from the ternary
Cantor-set/dyadic-value construction, using
Mathlib's Cantor set. Prove continuity, monotonicity, `C(0)=0`, `C(1)=1`, variation one,
and `C'=0` a.e.; its derivative measure is a singular continuous probability measure
supported on the Cantor set. This is the named singular BV example and the input to
Isoperimetry's non-AC homeomorphism example. Check complement invariance on the exterior of a ball, an infinite-volume
finite-perimeter set. Check null modification invariance on a punctured ball and on a
ball with a null dense subset added outside it; topological frontier and perimeter differ.
Compute the area formula for a graph and the multiplicity of a twice-traversed circle.
Give a rectifiable Jordan curve with a continuous non-AC parametrization and recover its
length, perimeter, and area through arclength. These exercise the APIs rather than replacing
the general theorems.

Completion requires all comparisons as well as all named theorems. Real-valued formulas
must establish integrability and finite measures before using `toReal` or a Bochner
integral. Null-set choices, chart choices, and parametrizations must disappear from the
final measures and geometric invariants.

## References and prior formalizations

- Francesco Maggi, [*Sets of Finite Perimeter and Geometric Variational Problems*](https://cvgmt.sns.it/paper/1880/):
  the perimeter, approximation, structure, and boundary framework.
- Leon Simon, [*Lectures on Geometric Measure Theory*](https://web.stanford.edu/class/math285/ts-gmt.pdf):
  rectifiability, tangential differentiation, and area/coarea.
- [MovingSofa](https://github.com/deancureton/MovingSofa) contains formalized Jordan-curve
  area and Hausdorff-length developments relevant to G1 and G6.
- The [Humanfia public source archive](https://huggingface.co/datasets/humanfia-lab/lean-eval-source/tree/main/problems/isoperimetric_inequality),
  [Jonathan Ho's isoperimetric development](https://github.com/hojonathanho/isoperimetric)
  (also [in LeanPool](https://github.com/LeanPool/lean-pool/tree/main/LeanPool/Isoperimetric)),
  and [kim-em/isoperimetric](https://github.com/kim-em/isoperimetric) are related formalizations;
  Isoperimetry describes their mathematical relation to the target.

These are sources of mathematical and API evidence, not required dependencies or prescribed
proofs. The targets are independently specified on top of Mathlib and Tau Ceti. Any use of
existing code follows the repository's coordination and attribution rules; completion is
judged against the intrinsic statements and reusable APIs above.
