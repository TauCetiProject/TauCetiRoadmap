# Roadmap: Morse functions, sublevel topology and Morse–Bott attachments

**Summary.** Develop the finite-dimensional topology of Morse and Morse–Bott functions:
intrinsic Hessians and indices, normal forms, genericity, deformation of
sublevels, handles and cells, proper exhaustions, strong inequalities and
critical-submanifold attachments and compact-trapped gradient convergence.
The resulting library supplies geodesic Morse theory,
[AffineMorseLefschetz](../AffineMorseLefschetz/README.md) and Hamiltonian moment-map topology.

## Scope and ownership

This roadmap owns ordinary finite Morse deformation/attachment and their
abstract Morse–Bott extension. RiemannianGeometry R3 owns the broken-geodesic
vertex carrier, Jacobi/index comparison and path-space limit, consuming this
core. The symmetric-space and Bott applications use the same broken-path
carrier and the attachments here, following
[HomotopySpheres §4B](../HomotopySpheres/README.md).
[HeegaardFloer Lane M](../HeegaardFloer/README.md) owns stable/unstable
manifolds, Morse–Smale trajectory spaces, compactification/gluing, Morse
homology and its singular comparison. It consumes the finite Morse core here;
this roadmap does not construct a second trajectory complex.

The native Morse predicates and index laws are inputs; this roadmap builds
the manifold normal-form comparison, finite-band topology and arbitrary-function
critical-point bounds. General atlas transport is owned by ComplexManifolds
Milestone 1; Layer 1 here specifies the preferred-chart formulas needed for
real boundaryless models, scalar levels and immersion comparisons.
Morse theory under the Palais–Smale condition in place of properness
(sequential compactness of almost-critical sequences, deformation of
noncompact critical-free bands on complete Riemannian manifolds, and
gradient convergence without compact trapping) is outside this roadmap: it
extends §2.2 and §6.1 and belongs to a Part II roadmap built on them;
nothing here depends on it.

## Conventions

Types are universe-polymorphic; for singular homology put the coefficient field
and space in a common universe (using universe lifts when needed). The raw
critical-set/count definitions need only charted calculus; smoothness and the
standing geometric hypotheses accompany their theorems. `sublevelInclusion`
needs only a topological space, a real-valued function and a≤b.

Use finite-dimensional real smooth Hausdorff second-countable manifolds with
boundaryless models. Compactness, properness, a lower bound, and compactness of
a particular level band are separate hypotheses. A Morse function means smooth
with nondegenerate critical points; do not incorporate properness or
Palais–Smale into that predicate. Cobordisms here are the compact bands
f⁻¹([a,b]) inside a boundaryless manifold, with regular boundary levels;
they use native Tau Ceti `Geometry/Manifold/Boundary/{Model,Charts}` for
the boundary manifold, DifferentialGeometry 5.1 for its orientation
interface, and GeometricTopology Layer 1 for collars. The general
boundary-critical-point and infinite-dimensional theories are separate from
these regular-level cobordisms.

At a critical point the Hessian is d²f, with no factor 1/2. A normalized Morse
chart has `f=f(p)−Σ_(i<λ)y_i²+Σ_(i≥λ)y_i²`, hence Hessian diagonal ±2.
λ is the negative inertia index. Gradient descent uses −grad f. Set
`M_a={x | f(x)≤a}`; regular-level deformation fixes M_a pointwise. Distances for gradient convergence use the induced Riemannian distance of the
chosen smooth positive-definite metric, componentwise. Different
metrics change gradients and flow parametrizations but not the Hessian/index
at a critical point or the sublevel homotopy conclusions.

## Exact supplier contracts

### From Mathlib

Use `ModelWithCorners.Boundaryless`, `PartialDiffeomorph`, `IsProperMap`,
`CWComplex`, `RelCWComplex`, `ContinuousMap.HomotopyRel`,
`ContinuousMap.Nullhomotopic`, `AlgebraicTopology.singularHomologyFunctor`,
`Module.finrank`, `Polynomial` and `Metric.sphere`. The homology functor in
`Mathlib/AlgebraicTopology/SingularHomology/Basic.lean` is used with
`ModuleCat k` and coefficient module k; its output is actual singular homology.
An extended cardinal is converted to a natural number only after proving
finiteness. Boundarylessness gives `range I=univ` and the native model
homeomorphism; it does not supply Hausdorffness or second countability of M.

### From Tau Ceti

Use actual Tau Ceti `IsManifoldNondegenerateCriticalPoint`, `IsMorse`,
`IsMorseOn` and `manifoldMorseIndex`, from
`Geometry/Manifold/Morse/{Basic,Index}`. The vector-space suppliers are
`Analysis/Calculus/Morse/{Basic,NormalForm,Generic}`, including
`IsNondegenerateCriticalPoint.exists_morse_chart` and the small linear-
perturbation theorem. Consume `MDifferentiableAt.mvfderiv_eq_fderiv_comp_extChartAt_symm`,
`manifoldMorseIndex_le_finrank`,
`TauCeti.manifoldMorseIndex_neg_add_manifoldMorseIndex_eq_finrank`
(in `Geometry/Manifold/Morse/Index.lean`, requiring a nondegenerate Hessian),
`manifoldMorseIndex_comp_fst_add_comp_snd`, and `Morse/Sphere/{Basic,Prod}`.
The manifold chart, compact critical-set and adapted pseudo-gradient constructions
belong to Layers 1–2, starting from the vector-space Morse lemma.

The native section-zero and boundary declarations used by Layer 2 are from
`TauCeti/Geometry/Manifold/VectorBundle/Section/{Chart,Manifold,SmoothZero,Linearization}.lean`
and `TauCeti/Geometry/Manifold/Boundary/{Model,Charts}.lean`; their exact
constructor inputs and chart laws are specified in §2.1 below. The vector-space
Morse estimates used by Layer 6 are from
`TauCeti/Analysis/Calculus/Morse/{GradientFlow,Convergence,Linearization,ExponentialConvergence}.lean`.

For finite CW complexes, use `TauCeti.finite_singularHomology_of_cwComplex`
and `TauCeti.finsum_finrank_singularHomology_of_finite_cwComplex`
from `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean`.
Layer 4 applies these to the Morse CW model and proves the stronger polynomial identity.

For the intrinsic gradient statement use `Riemannian.Tensor.rieszDual` and
`Riemannian.Tensor.inner_rieszDual` from
`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean`, with the
smooth metric expressed by `IsContMDiffRiemannianBundle`. Mathlib
`IsMIntegralCurveOn` specifies the curve equation and `Manifold.riemannianEDist`
is the infimum of smooth path lengths for the same tangent-fiber norms;
it may be infinite between components and does not require a global metric instance.

### From TauCetiRoadmap.DifferentialGeometry

[DG Layers 3,5,10,12](../DifferentialGeometry/README.md) supply flows, boundary-orientation interfaces,
partitions of unity, sharp finite-dimensional Sard, metrics and Hessians.

In particular DifferentialGeometry §12.2 supplies `mgradient`,
`inner_mgradient`, smoothness and `mgradient_eq_gradient`; Layer 3 supplies
maximal flows and smooth dependence, and §5.1 supplies `boundaryOrientation_spec`.

### From TauCetiRoadmap.AlgebraicTopology

[AlgebraicTopology Stages 2–8](../AlgebraicTopology/README.md) supply relative
chains, cofibrations, cellular/singular comparison, products, integral duality
and relative homotopy. M4’s arbitrary-function LS bound consumes the
categorical-cover/cup-length supplement after AT6.2; that supplement uses
only foundational products and native homotopies, not Morse theory or
manifold duality.

### From TauCetiRoadmap.GeometricTopology

[GT Layer 1](../GeometricTopology/README.md) supplies
normal/tubular geometry, collars, handle gluing and disc bundles.

### From TauCetiRoadmap.CharacteristicClasses

[CharacteristicClasses C2](../CharacteristicClasses/README.md)
supplies ordinary Thom classes and their local orientation coefficients.

### From TauCetiRoadmap.ComplexKahlerGeometry and TauCetiRoadmap.ComplexManifolds

ComplexManifolds Milestone 1 supplies generic scalar restriction and atlas transport.
ComplexKahlerGeometry K7.1–K7.2 supplies the projective carrier, real atlas and
independent cellular calculation used in §4.3.

### From TauCetiRoadmap.DGFloer

DGFloer Layer 1 item 3 supplies
`SpectralObject` and its filtered-complex convergence, independent of trajectories.

## How to read the build

Layers 1–6 retain the labels M1–M6 used by consumers. Layer 1 constructs
normal forms and their comparisons; Layer 2 turns compact bands into attachments
and CW models. Layer 3 gives approximation and exhaustions. Layer 4 extracts
homology and category bounds, Layer 5 treats critical submanifolds, and Layer 6
proves convergence. Each *Needs:* line separates statement carriers from a
possible proof route. [Suggested.lean](Suggested.lean) states the headline
acceptance theorems supported by the pinned carriers.

## Layer 1: critical Hessians, indices and usable normal forms (M1)

### 1.1 Model transport

Own the single boundaryless-model transport on a named `def` type synonym
M′ carrying M's topology, with an explicitly supplied E-charted structure
and a constructed `IsManifold 𝓘(ℝ,E) ∞ M′` instance; do not install a second
global atlas on M. Mathlib's `[I.Boundaryless]`
gives `range I=univ` and `I.toHomeomorph:H≃ₜE`. For an H-valued chart c use
`c′=c.trans I.toHomeomorph.toOpenPartialHomeomorph`; its extended coordinates
are exactly I∘c. Construct the identity `Diffeomorph I 𝓘(ℝ,E) M M′ ∞`,
the preferred-chart/extend/source/target and maximal-atlas correspondences,
and source- and target-side `ContMDiff`/`mfderiv` comparisons. If φ is an
E-valued maximal chart on M′, its corresponding H-valued chart on M is
`φ.trans I.toHomeomorph.symm.toOpenPartialHomeomorph`, with the same extended
chart and target. Transfer `IsImmersionOfComplement` across this model
change by equality of these normal-form charts, with the same complement
and linear normal-form map. Also construct the charted-source transport
along the scalar zero-subtype/level homeomorphism used in M2. These are
narrow chart-form comparisons, with no general immersion-composition theorem
as an input. Include critical/index and adapted pseudo-gradient comparisons.
All arbitrary-model consumers use this transport. Use Mathlib `PartialDiffeomorph`, `IsProperMap`, `CWComplex`, `RelCWComplex`,
`ContinuousMap.HomotopyEquiv` and native singular (co)homology.


The model transport API identifies extended preferred coordinates, derivatives,
critical sets, indices and immersion normal forms under the identity map.
*Needs:* Mathlib model homeomorphism and maximal atlas; ComplexManifolds Milestone 1.

**Checks.**
- For the self-model ℝ², both transports are identity and df=(1,0) stays (1,0).
- Rechart ℝ by y=2x: the derivative of f(x)=x becomes 1/2; coordinate derivatives need not be equal before transport.
- The half-line model has range [0,∞), not ℝ; the boundaryless hypothesis excludes this transport.

### 1.2 Critical Hessians and counts

Define `criticalPoints` as `{x | mvfderiv I f x = 0}` and consume its native
preferred-chart comparison. Define the critical Hessian as a symmetric
continuous bilinear form on `TangentSpace I x`, transported from d²f in the
preferred extended chart under the hypothesis df_x=0. Prove it is independent
of coordinates and connection, and identify
it with DG's Hessian for every chosen smooth metric. Prove symmetry, change of
coordinates by congruence and inertia invariance. Consume the native index bound
λ≤dim M and direct-sum/product additivity; at a nondegenerate critical point,
consume the complementary-index identity λ(f)+λ(−f)=dim M. Smoothness and
criticality without nondegeneracy do not imply that identity. Keep the noncritical Hessian's
connection dependence explicit. Give the tangent-quadratic-form and matrix
comparisons, restrictions to subspaces and positivity/negativity tests.

The critical-set/count API is:

- The critical locus is closed for smooth f and agrees with the scalar derivative zero locus.
- `criticalCount` counts index-j points in ℕ∞; for Morse f on compact M it is finite, and for Morse f it vanishes for j>dim M.
- At a critical point Hessians in two charts are congruent, giving coordinate-independent inertia.

*Needs:* Tau Ceti Morse Basic/Index; DifferentialGeometry §12.3 Hessian; §1.1.

**Checks.**
- On ℝ², f=−x²+y² has Hessian diag(−2,2), index 1 and one critical point.
- A constant on S¹ has infinitely many critical points: its extended total is ∞, not 0.
- On a point the empty Hessian is nondegenerate, index 0 and critical count 1; on the empty manifold it is 0.
- For f=0 on ℝ both indices are 0 and their sum is 0≠1; for f=x² they are 0 and 1, with sum 1.

### 1.3 Normal forms and persistence

Construct a manifold Morse chart from the preferred-coordinate vector-space
Morse lemma, as an actual partial diffeomorphism
for every boundaryless model, with a Euclidean target and center 0. Compose its
linear coordinate map with an index-ordering permutation and division by √2,
using `exists_hessianQuadraticForm_equivalent_weightedSumSquares`; prove both smooth maps and the
normalized sum-of-squares equation on the whole source. Derive isolation,
strict local minima/maxima, the two-dimensional saddle model and finite critical
sets on compact subsets for a global Morse function. Prove the derivative vanishes exactly at the center within each Morse chart.
Cover the critical set in a compact subset by finitely many isolating chart
neighborhoods, using closedness of the critical locus. This gives
`finite_criticalPoints_inter` for arbitrary boundaryless models, with the
native scalar/vector derivative comparison. Define chartwise C^k
seminorm neighborhoods on fixed compact coordinate sets before using them.
Prove persistence of
nondegenerate critical points under small C² perturbations on fixed compact
neighborhoods, with the implicit-function critical-point continuation, index
and value dependence. Construct critical counts with extended natural/cardinal
values first; use finite natural counts only after the relevant compactness
proof, avoiding junk values on infinite critical sets.

The normal-form API includes `exists_normalized_morseChart`, its smooth inverse,
isolation and `finite_criticalPoints_inter` (Cohen–Iga–Norbury, Theorem 5.3,
pp. 36–37, and Corollary 5.4, p. 38). Critical-branch persistence is the
implicit-function theorem applied to the coordinate differential: its derivative
in the point variable is the invertible Hessian. For a smooth finite-dimensional
parameter family the branch and its critical value are smooth, and its index
is locally constant; for C² perturbations the branch is continuous in the
compact C² topology (`ContDiffAt.contDiffAt_implicitFunction` in
`Mathlib/Analysis/Calculus/ImplicitContDiff.lean` supplies the smooth
finite-dimensional implicit-function step). These parameter assertions are consequences to prove here,
not assertions of the ordinary Morse lemma.

Compact C^k neighborhoods bound coordinate derivatives of orders 0,…,k
on fixed compact chart cores. Their API is:

- Restricting to a smaller compact core decreases each derivative supremum.
- Intersecting two bounds on the same core permits the smaller positive tolerance.
- Fixed smooth chart changes compare these neighborhoods by finite constants on compact cores.
*Needs:* §1.1–§1.2; Tau Ceti vector-space NormalForm and Index; the implicit function theorem.

**Checks.**
- f=x² has Hessian 2; a normalized chart has f=y², rather than y²/2.
- f_t=x²+t x has critical point −t/2, value −t²/4 and constant index 0.
- f_t=x³−t x has no critical points for t<0 and two for t>0; nondegenerate branch continuation does not cross t=0.
- For h(x)=δx², δ>0, on [−1,1], the order-0, order-1 and order-2 suprema are δ, 2δ and 2δ; value control alone misses derivative bounds.
- Restricting that h to [−1/2,1/2] changes those suprema to δ/4, δ and 2δ; restriction need not strictly decrease every order.
- Bounds with tolerances 1 and 1/2 on the same core intersect in the bound 1/2, not their sum; under x=y/2 the function x² becomes y²/4 and its second derivative changes from 2 to 1/2.

### Examples

For −x²+y² the indices of f and −f are both 1 and add to dimension 2.
For x²+y² the indices are 0 and 2. On f=x there are no critical points,
so the Morse condition does not imply properness or a lower bound.

### Dependencies

Mathlib manifold calculus; Tau Ceti Morse Basic/Index/NormalForm/Generic;
DifferentialGeometry §12.3; ComplexManifolds Milestone 1.

## Layer 2: compact-band deformation, handles and cells (M2)

### 2.1 Scalar levels and regular boundary faces

Construct the regular levels of real-valued functions on the actual subtype
`Level(f,c):={x:M // f x=c}` with its subspace topology. The scope here is
scalar levels and their sublevel/band faces; regular fibers of maps into
other manifolds and fiber products are separate constructions.
Consume the following declarations in namespace `TauCeti` from
[Section/Chart and Manifold](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Manifold/VectorBundle/Section/Manifold.lean)
and [SmoothZero/Linearization](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Manifold/VectorBundle/Section/SmoothZero.lean):
`sectionZeroChartedSpace`, `isManifold_sectionZero`,
`hasMFDerivAt_coe_sectionZero`, `isImmersionOfComplement_coe_sectionZero`,
`sectionZeroChartedSpace_chartAt`, `sectionZeroChartedSpace_atlas`,
`sectionZeroChartAt_apply`, `sectionZeroChartAt_source`,
`mem_sectionZeroChartAt_target_iff`, `coe_sectionZeroChartAt_symm_apply`
and `sectionLinearization_trivial`.

Use M1's self-modelled synonym M′ with preferred E-chart c′_z, the base
B:=ℝ, constant b:=0 and the trivial line bundle `Bundle.Trivial ℝ ℝ`.
For f′ on M′ and s:=f′−c choose
`e_z=trivializationAt ℝ (Bundle.Trivial ℝ ℝ) (b z)` and set
`g_z(y)=f′((c′_z).symm y)−c`, `D_z=fderiv ℝ g_z (c′_z z)`.
Derive every input of `sectionZeroChartedSpace`: the strict derivative `hf`
of g_z from smoothness and nonzero order; `hFred` from
`TauCeti.isFredholm_of_finiteDimensional`; `hsurj` from regularity using the
preferred-source derivative comparison; and `hindex` from
`ContinuousLinearMap.index_eq_of_finiteDimensional`, with natural index
n=dim(E)−1. Surjectivity at a zero gives dim(E)≥1, so the integer and natural
index expressions agree there. Supply `hb` by continuity of the constant
base, `he` by `mem_baseSet_trivializationAt`, and the two-zero-point smoothness
input `hs` by smooth preferred source expressions on their implicit-chart
domains, following SmoothZero's construction. The trivialization coordinate
is literally s. Directly identify D_z with the preferred-source derivative
of f by constant subtraction, `range I=univ` and M1's `mfderiv` comparison;
this supplies `hsurj`. `sectionLinearization_trivial` is a cross-check of
that identification, not an input to the explicit constructor. Construct the actual zero-subtype/level
homeomorphism induced by s(x)=0 iff f(x)=c and transfer these specific charts
along it as the scalar regular-level atlas. The existential
`exists_isManifold_sectionZero_of_contMDiff` is a cross-check of the result.

Export the chartAt/atlas, source/target, extend and inverse formulas for this
named structure. In particular use the SAME native projection
`π_z=Classical.choose (hFred z).closedComplemented_ker` and kernel equivalence
K_z supplied by `D_z.kerModelEquiv`: the preferred level chart is
`w ↦ K_z(π_z(c′_z w−c′_z z))` on the native section-zero chart source.
Consume `sectionZeroChartAt_apply` for this equation and transfer its
actual source and target through the subtype homeomorphism. Prove changed
complements/charts give the identity diffeomorphism between the named atlases,
including their derivative comparison laws.
Use the native inclusion derivative and M1's target-model chart comparison
to construct the native `Manifold.IsSmoothEmbedding` of Level(f,c) into M,
with tangent range `ker (mfderiv I 𝓘(ℝ) f x)`. Its topological embedding is
`Topology.IsEmbedding.subtypeVal`; transport the immersion by its actual normal-form
chart equation, preserving the complement ℝ, and not by a model-changing
use of `IsImmersionOfComplement.comp_diffeomorph`.

For the scalar normal form at x use the SAME `π_x` and
`hker=(hFred x).closedComplemented_ker`. Let `hD:D_x.range=⊤` be the actual
surjectivity proof above and fix
`L:=D_x.implicitCoordEquiv hD hker : E≃L[ℝ](ℝ×ker D_x)` from
[TauCeti Analysis/Calculus/ImplicitFunctionTheorem](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Analysis/Calculus/ImplicitFunctionTheorem.lean).
Its public `coe_implicitCoordEquiv` law gives `L(v)=(D_x v,π_x v)`, hence
`L.symm(0,k)=k` for k in the kernel. Construct
`Φ(y)=(g_x(y),π_x(y−c′_x x))` using the public
`HasStrictFDerivAt.implicitToOpenPartialHomeomorphOfComplemented`. Restrict
its source to the intersection of its own source, the preferred chart target
and the native `hf.implicitCoordSource hD hker`; use the public openness,
base-point membership and inverse-smoothness laws there. This is an actual
open neighborhood with the prescribed smooth inverse, not an unrestricted
implicit-coordinate formula. The H-valued domain chart for
`Manifold.IsSubmersionAtOfComplement.mk_of_charts` is c′ composed with this
restricted Φ, L.symm and I.toHomeomorph.symm. Its target chart is t↦t−c,
so the extended map is exactly `Prod.fst ∘ L`. Construct
`Manifold.IsSubmersionAtOfComplement (ker D_x) I 𝓘(ℝ) ∞ f x` and prove the
zero-slice agrees with the SAME `π_x`, `K_x` and scalar-level chart above.

For every regular endpoint a construct the sublevel M_a={f≤a} as a manifold
with boundary, and for regular a<b construct the band f⁻¹([a,b]); these atlas
constructions require neither compactness nor absence of interior critical
points. State the positive-dimensional construction with explicit `n:ℕ` and
`hn:Module.finrank ℝ E=n+1`, using model `𝓡∂ (n+1)` and its `NeZero (n+1)`
instance. Derive `hdim:Module.finrank ℝ E−1=n`. Reindex the existing scalar
atlas by the continuous linear equivalence ρ_hdim whose value on v at i:Fin n
is `v (Fin.cast hdim.symm i)`, and use the resulting named local/type-synonym
`Fin n→ℝ` atlas on the level; this is model transport of the one level
carrier. Set `K_x^n=ρ_hdim ∘ K_x` and `χ_x^n=ρ_hdim ∘ χ_x`.
Use inward coordinate a−f for the sublevel, f−a at the lower band face and
b−f at the upper face, with these SAME tangential coordinates in slots
1,…,n and scalar coordinate in slot0. The native comparison is
`β_n:=EuclideanSpace.equiv (Fin n) ℝ`, from
`EuclideanSpace ℝ (Fin n)` to `Fin n→ℝ`; the ambient face chart's tail is
`β_n.symm (χ_x^n)`. A fixed E≃L[ℝ]EuclideanSpace ℝ(Fin(n+1)) is used only
for interior charts. First apply that equivalence and recenter, then take
a Euclidean ball of radius r in the transformed strict interior chart target
and translate coordinate0 by b>r. Its whole image has coordinate0>0,
also at interior critical points, with no df≠0 assumption there.

Consume the actual `TauCeti.boundaryChartedSpace` and
`TauCeti.isManifold_boundary` from
[native Boundary/Model and Charts](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Manifold/Boundary/Charts.lean),
supplying the nonzero differentiability order ∞. Use its public
`boundaryChartedSpace_atlas`, `boundaryChartedSpace_chartAt_source`,
`boundaryChartedSpace_chartAt_target`, `boundaryChartedSpace_chartAt_apply`
and `boundaryChartedSpace_chartAt_symm_apply` laws. The preferred face chart
has coordinate0=0 exactly on the level; interior preferred charts have it
positive. Construct the boundary/level homeomorphism h and prove on the
actual common chart source
`β_n (chartAt (EuclideanSpace ℝ (Fin n)) p q)=χ_(h p)^n(h q)`.
This equality is AFTER β_n and the explicit Fin.cast reindexing, not an
identification of differently typed atlases. Equip the level with that
reindexed named atlas and promote h to the typed
`Diffeomorph 𝓘(ℝ,EuclideanSpace ℝ (Fin n)) 𝓘(ℝ,Fin n→ℝ)
  ↥((𝓡∂ (n+1)).boundary M_a) Level(f,a) ∞`.
For a band, give the corresponding typed diffeomorphism to the disjoint
union of its reindexed lower/upper levels. Prove both smooth directions
from these public source/target/apply/inverse laws; no private chartAt
lemma or equality of differently typed `IsManifold` statements is an input.

Consume [DifferentialGeometry 5.1's orientation interface](../DifferentialGeometry/README.md#layer-5-integration-and-stokes-theorem)
for `boundaryOrientation_spec`, on this native boundary manifold. Pin the
metric-free outward co-orientation: df(v)>0 on ∂M_a and the upper band face,
df(v)<0 on the lower band face. Mathlib's inward slot0 has outward vector
−∂₀; compute the outward-first orientation using that sign, when M is
oriented. Gradients ±grad f represent the co-orientations after choosing a
metric; no orientation is needed for the carriers or atlas construction.
The scalar-level model remains uniformly `Fin (dim(E)−1)→ℝ` before the
explicit reindexing, also for empty levels. Dimension0 regular levels are
empty and sublevels clopen boundaryless0-manifolds, with no half-space model;
dimension1 levels use Fin0. Dimension0 regular-endpoint bands are clopen;
a critical-free such band is empty.

The level and face API consists of the explicit atlas laws above,
`exists_scalarRegularLevelData`, the inclusion embedding, tangent-kernel equality,
independence of complements, and the typed boundary/level diffeomorphisms.
*Needs:* §1.1; the section-zero and implicit-coordinate declarations above;
DifferentialGeometry §5.1 only for orientation, GeometricTopology Layer 1 only for collars.

**Checks.**
- For f(x,y)=x at level 0 the level is ℝ, the inclusion derivative is v↦(0,v), and its range is ker(df)=span(e₂).
- For f=x² at level 0, df=0; the singleton level cannot satisfy the regular-level embedding conclusion in dimension 1 with the required derivative-kernel equality.
- In dimension 0 every attained value is critical; a regular level is empty and the natural dimension subtraction yields 0.
- On [a,b]⊂ℝ with f=x, the outgoing endpoint has sign + and the incoming endpoint sign −, agreeing with outward-first orientation.

### 2.2 Deformation and adapted fields

For a<b with compact f⁻¹([a,b]) and no critical points on that band,
construct the normalized-gradient deformation retract M_b→M_a directly in
the boundaryless ambient manifold using M1 and DG's flow/metric suppliers.
This homotopy theorem does not require the scalar-level or boundary atlases,
SectionZero or DG5.1. The field
is −grad f/|grad f|² on that band; build a smooth cutoff extension, prove flow
existence up to the prescribed hitting time and continuity at the fixed
sublevel. Separately, consume that compact-flow construction, the scalar
level atlas and the boundary-atlas comparison to construct the regular-band
product homeomorphism `f⁻¹[a,b]≃f⁻¹(a)×[a,b]`, preserving the value coordinate,
with a smooth interior diffeomorphism and smooth maps between the
corresponding boundary pieces. Use their own product/interior models; do not identify the cornered
product model with the half-space model. Construct a
homeomorphism of M_b with M_a carrying f⁻¹(b) onto f⁻¹(a). Identify a sufficiently
small local minimum sublevel component inside its Morse neighborhood with a
closed disc, and the opposite local maximum statement. For a unique global
minimum with compact sublevels prove the sufficiently small whole sublevel
has this disc description.
Prove restriction to smaller regular bands commutes up to relative homotopy
and the retraction homotopy fixes M_a throughout.
Completeness of an arbitrary metric alone is not a compactness argument for
this flow.
For a Morse function f, define an adapted descending pseudo-gradient to be a smooth vector field X
with df(X)<0 off the critical set and, in chosen normalized Morse charts,
X(u,v)=(2u,−2v). Prove existence by patching these local fields with a
descending field away from the critical points. Construct the local flow
(u,v)↦(exp(2t)u,exp(−2t)v) while it stays in the chart, and use
DifferentialGeometry Layer 3 for maximal flows, uniqueness and smooth dependence.
Prove the flow composition and inverse laws, energy monotonicity and the
energy integral identity. On compact manifolds prove completeness and convergence
for Morse functions using isolated critical points. Compare this field with
−grad f when the metric is Euclidean in the chosen charts; a general smooth
metric needs Layer 6's separate argument.
The native vector-space `IsIntegralCurveOn.exists_tendsto_atTop` in
`Analysis/Calculus/Morse/Convergence` gives convergence of a negative-gradient
trajectory trapped in a compact set containing finitely many critical points,
not a cell attachment or band deformation. Extend
compact-manifold pseudo-gradient existence to a neighborhood of a specified
compact level band by a finite cover, with the field unchanged on chosen
smaller critical charts. For each compact critical-free band use a positive
smooth rescaling giving df(X)=−1; compare the resulting descending
deformation with the normalized-gradient construction, including hitting
times and the fixed lower sublevel.

Across one critical value with finitely many nondegenerate points and compact
band, attach one index-λ handle D^λ×D^(m−λ) at each point using disjoint M1
charts. The handle conclusion is a homeomorphism with the topological handle
adjunction along ∂D^λ×D^(m−λ), respecting the regular boundary away from
the attachment; no diffeomorphism of a cornered handle space is asserted.
Build the modified-function/cutoff deformation, control all chart
boundaries and prove continuity of the local modified-function deformation.
Consume GT's collars for the attaching-face boundary identifications and
native TopCat pushouts for the topological handle adjunction. Give the homotopy
cell attachment directly, and specify attaching maps ∂D^λ→M_(c−ε) and
characteristic maps χ:(D^λ,∂D^λ)→(M_(c+ε),M_(c−ε)). The handle-to-cell
comparison Φ_α:M_(c−ε)∪_αD^λ→M_(c+ε) is the pushout map induced by the
inclusion on the lower sublevel and χ on the disk. Prove it is a homotopy
equivalence whose inverse homotopies fix the entire lower sublevel. Include
simultaneous critical points, index 0 and
whole-dimension cases.

For `sublevelInclusion`, prove identity at a=b, composition through an
intermediate level, and compatibility with restriction of f. The strong
retraction is `exists_sublevelDeformation` (Milnor, Theorem 3.1, p. 12,
which assumes compactness of the band rather than of the ambient manifold).
The adapted-field API includes strict decrease, the critical zero set, chart
flow formulas, completeness on compact M, and comparison with Euclidean-chart
metrics. *Needs:* §1.3; DifferentialGeometry Layers 3,12; §2.1 only for smooth boundary products.

**Checks.**
- For f=x², the inclusions at levels 1→4→9 and 1→9 both send x=1 to x=1; an inclusion does not rescale its point.
- At equal levels a=b=1 the inclusion fixes every x∈[−1,1], including −1; it is the identity.
- The point x=1 belongs to the closed sublevel at level 1 and stays present at level 4; an open-sublevel definition would exclude it.
- For f=x² on ℝ and 0<a<b, the retraction sends x outside [−√a,√a] to sign(x)√a and fixes that interval.
- For f=x², the adapted negative gradient is −2x and its flow is x₀ exp(−2t); energy derivative is −4x².
- For f=−u²+v² the local flow is (e^(2t)u,e^(−2t)v); choosing both signs negative would increase f on the u-axis.
- In dimension 0 a critical-free band is empty; both sublevels and the inclusion are identical.

### 2.3 Handles and change of chart

Own the change-of-chart comparison at fixed c and a common admissible ε,
before compactification gluing, with the regular lower sublevel identified
explicitly. An admissible ε has compact band f⁻¹[c−ε,c+ε], no critical
points there except the specified points at c, and every chosen chart image
contains its closed negative-coordinate disk of radius √ε. These conditions
are retained on decreasing ε. For a chart φ use χ_φ(w)=φ⁻¹(√ε·w,0)
and α_φ=χ_φ|∂D. For two choices construct
h∈O(λ), its boundary restriction h_∂ and a homotopy of characteristic maps
of pairs K:χ₁≃χ₀∘h. Write H=K|∂D with H(·,0)=α₁ and
H(·,1)=α₀∘h_∂. Construct the particular Milnor comparison (Lemma 3.6, pp. 20–21)
E_H:M_(c−ε)∪_(α₁)D^λ→M_(c−ε)∪_(α₀)D^λ: it is identity on the lower
sublevel, sends x to the target disk point h(2x) for |x|≤1/2, and sends x
to H(x/|x|,2−2|x|) for 1/2≤|x|≤1. Prove agreement at the seam and on
the attaching boundary. For λ=0 use the identity on the isolated point.
Prove this map is a homotopy equivalence with inverse and homotopies rel the
lower sublevel. First prove Φ₀∘E_H≃Φ₁ rel the lower sublevel from that
same pair homotopy K by its disk-cylinder comparison.
If Ψ₀ is the relative inverse of Φ₀, this gives E_H≃Ψ₀∘Φ₁ rel the lower
sublevel and hence the required equivalence, independently of any unspecified
AT gluing equivalence. The relative class of E_H is independent of the chosen
pair homotopy K with these endpoints; an arbitrary boundary homotopy does
not have that property. For a strict α₁=α₀∘h_∂, id⊔h itself is the adjunction homeomorphism
rel the lower sublevel. Write E_ij for the map from chart j's adjunction
to chart i's. For three choices prove E₀₂≃E₀₁∘E₁₂ rel that
sublevel and supply a path from h₀₁h₁₂ to h₀₂ in O(λ); do not assert strict
multiplicativity of polar parts. For compact finite-CW parameter spaces P,
fixed f,c and labelled critical points, require jointly continuous charts,
inverses and coordinate derivatives through order 2 on specified common
neighborhoods, and continuous C¹ metric coefficients/inverses on the compact
band. Families are maps over P between the fiberwise adjunction spaces
(P×M_(c−ε))∪_(α_•)(P×D^λ), with homotopies over P×I. Choose ε, δ, L,
β and the critical-free flow uniformly over P, and construct the comparison,
inverse and homotopies continuously over P. On a subcomplex P′⊆P these
families restrict to this same construction applied to the restricted data;
there is no assertion of extending arbitrary prescribed homotopies on P′.

Set A=D(φ₀∘φ₁⁻¹)(0), and h=A_uu(A_uuᵀA_uu)⁻¹ᐟ², the polar part of its
negative-coordinate block. Choose 0<δ<√ε and L with ‖A‖≤L,
|T(y)|≤L|y| for |y|≤δ, and the closed ball of radius Lδ in φ₀'s image,
where T=φ₀∘φ₁⁻¹. These conditions include the limit A(x,0), the linear
positive-coordinate contraction and the polar path, since all their points
have norm at most Lδ. Deform the small disk by
s↦φ₀⁻¹(T(sx,0)/s), extending at s=0 by φ₀⁻¹(A(x,0)). Since Q∘T=Q
for Q(u,v)=−|u|²+|v|², each inner boundary circle remains exactly at
level c−δ². Next decrease the linear positive-coordinate component A_vu x
to zero; the level only decreases. Write A_uu=hP with P≥I, and use
hP^(1−t)x to reach h(x), again keeping the boundary at or below c−δ².
Use the critical-free-band deformation R from M_(c−δ²) to M_(c−ε) to
extend these moving small disks: replace each outer annulus by the
retraction track R_(β(r))(circle_t(θ)), with β continuous increasing from
0 at the inner seam to1 at the outer seam. For each chart annulus
γ_θ(r), δ≤r≤√ε, first use R_(tβ(r))(γ_θ(r)), then
R_(β(r))(γ_θ(δ+(1−t)(r−δ))), 0≤t≤1, to deform it to the track of its
inner circle. Both stages fix the inner seam; at the outer seam the first
stage fixes the point already in M_(c−ε), and the second uses R₁.
After moving the inner circle and its entire track together through the
small-disk comparison, reverse these two stages for chart0's annulus
γ_θ(r)=φ₀⁻¹(hrθ,0). Admissibility puts that entire annulus in φ₀'s image.
Thus the final map is χ₀∘h, including its outer annulus. Prove continuity
at both seams and that the attaching boundary stays in the lower sublevel
throughout. No original whole-disk graph or overlap assertion is used.
Prove contractibility of the space of maximal negative-definite
subspaces of the Hessian in graph coordinates, and compare the chart-induced
orientations through that space. Then det h=+1 exactly when those orientations
agree. For λ≥1, SO(λ)'s planar-rotation paths give h_∂≃id in that case and
hence α₁≃α₀; det h=+1 forces h=id when λ=1. For det h=−1 the boundary
map has degree −1 when λ≥2 and swaps the two points when λ=1. For λ=0 use
h=id and the empty boundary. With the chart and ε fixed, metric changes
retain the literal characteristic/attaching maps and h=id; only auxiliary
flow comparisons change. For levels ε_i admissible for chart i, if ε₀≤ε₁ use
M2's actual band retraction b:M_(c−ε₀)→M_(c−ε₁) and prove
α₁≃b∘α₀∘h_∂, comparing the charts first at ε₀ and flowing chart1
from that smaller disk; chart0 need not fit the larger ε₁ disk. If ε₀>ε₁
use b:M_(c−ε₁)→M_(c−ε₀) and prove b∘α₁≃α₀∘h_∂, using the symmetric
smaller-level construction. Simultaneous critical points use ⊔_p h_p on
⊔_p D^(λ_p),
with labels fixed by the actual critical points.

As acceptance tests, for f(x)=(x²−1)² on ℝ use c=1, ε=1/2 and the charts
±x√(2−x²) on (−1,1). For s∈S⁰={−1,1}, the attaching maps are
α_±(s)=±s√(1−1/√2)∈{f≤1/2}. The two values at s=1 lie in different
components, so α_+ and α_- are not homotopic with their labelled source fixed;
α_-=α_+∘r is strict for r=−id on D¹, giving the adjunction homeomorphism
rel {f≤1/2}. For RP² use
f[x:y:z]=(y²+2z²)/(x²+y²+z²), top point [0:0:1] and 0<ε<1. The lower
sublevel {f≤2−ε} is a Möbius band. Fix its H₁ (equivalently π₁) core generator by
θ↦[cosθ:sinθ:0], 0≤θ≤π, and orient ∂D² counterclockwise in the normalized
negative coordinates (√2x/z,y/z)/√(1+(x/z)²+(y/z)²). This chart's α_+
has degree +2; reflecting the first negative coordinate gives the strict
α_-=α_+∘r of degree −2. Prove those maps are not homotopic with the source
fixed and the attachment pairs are homeomorphic rel the lower sublevel.

The handle API includes simultaneous attachments, the relative homology of
each disc pair, chart comparisons and their coherent parameter restrictions.
*Needs:* §1.3, §2.2; GeometricTopology Layer 1; AlgebraicTopology Stage 4;
Milnor, Lemma 3.6, pp. 20–21, for the homotopic-attaching-map comparison.

**Checks.**
- At index 0 the attaching sphere is empty and the handle adds one component.
- For the double well above, α₊(1)=√(1−1/√2) and α₋(1)=−√(1−1/√2); reflection is necessary to compare the labelled attaching maps.
- In the RP² example the top attaching degrees are +2 and −2; the two reflected attachments have the same relative topology but the labelled maps are not homotopic.

### 2.4 CW exhaustion

Iterate finite critical levels to construct compatible relative CW models for
sublevel pairs. For a proper bounded-below Morse function, choose an exhausting
sequence of regular levels with finite critical sets at each stage, prove the
cofibration/compatibility statements and pass to a genuine CW complex homotopy
equivalent to M with one λ-cell per critical point. Consume Mathlib TopCat
pushouts and AT4.5's `relativeCWPushout`, `relativeCWPushoutCWModel`,
`homotopyPushoutGluingComparison`, `cofibrationTowerHomotopyEquivalence`
and `cwSubcomplexTowerUnion`.
These supply finite cell/weak-topology induction, cellular approximation,
dimension reindexing and the categorical/classical CW comparison. Own the
Morse-specific negative-handle attaching maps and their relative comparison
to those adjunctions, the regular-level sequence and the resulting cell
index labeling. At stage k+1 use `relativeCWPushoutCWModel` with
Z=M_(a_k), Z_c=W_k and h=φ_k, followed by the negative-handle/cell
comparison that is identity on M_(a_k). The resulting φ_(k+1) restricts
exactly to φ_k; this constructs strict comparison-map compatibility. Use AT's telescope/colimit comparison for strictly commuting
levelwise equivalences and prove its comparison with the exhausted manifold,
retaining the proper-function control and actual level inclusions. Regular-level
collars make those inclusions closed cofibrations. Start at a regular a₀ below
a global lower bound for f, where the sublevel is empty; use AT4.4's
`diskBoundaryRelCW` and coproduct cells at each handle stage. Specialize
AT4.5's compact-subset finite-stage factorization to this sublevel tower.
The W_k inclusions retain compatible cell labels and characteristic maps;
`cwSubcomplexTowerUnion` builds the CW structure on their critical-level
union even when later stages add cells of lower dimension. Compact M gives a finite CW model. For regular-level compact
cobordisms build the relative version from the incoming boundary, with outgoing
boundary identified by the opposite function and complementary indices.

The headline `exists_morseCWModel` gives a Hausdorff native CW complex X,
a homotopy equivalence M≃X, and, for every j, an equivalence between its
j-cell type and the index-j critical-point subtype, assuming f is Morse,
proper and bounded below (Milnor, Theorem 3.5, p. 20). The CW-model API
identifies one cell per critical point, gives the specified
strict sublevel comparison maps, and recovers relative models for regular bands
(Cohen–Iga–Norbury, Theorem 5.7, pp. 40–41, for compact M); the proper case uses the
specified compatible tower and exhaustion comparison.
*Needs:* §2.1–§2.3; AlgebraicTopology §4.4–§4.5.

**Checks.**
- Height on S² gives one 0-cell and one 2-cell.
- f=x² on ℝ gives one 0-cell and a contractible CW model.
- The empty manifold gives an empty CW complex and empty cell types in every degree, not a distinguished 0-cell.
- A countable discrete manifold with proper values 0,1,2,… gives countably many 0-cells; a finite CW model is not asserted.

### Examples

The circle height has two descending arcs at its maximum; both attach to the
same minimum component and give H₁(S¹;ℤ)=ℤ. The double-well example records
why orientation of the attaching disk must remain visible.

### Dependencies

Layer 1; DifferentialGeometry Layers 3,5,12; GeometricTopology Layer 1;
AlgebraicTopology Stages 2–4 and §4.5 tower comparison.

## Layer 3: approximation and proper Morse exhaustions (M3)

### 3.1 Strong smooth approximation

On native smooth maps `C^∞⟮I,M;ℝ⟯`, define strong C^k neighborhoods by a
locally finite compact chart family and a positive tolerance on each member,
bounding every coordinate derivative of order≤k. Define the strong smooth
topology as generated by these neighborhoods for all finite k, without
unbounded derivative orders varying per chart. Prove chart-family independence
and agreement with compact C^k seminorm neighborhoods when M is compact.
Prove every smooth function can be approximated by Morse functions in this
topology. Use native local
linear perturbations and DG Sard, multiply them by cutoffs, and run a compact
exhaustion construction. Choose perturbations with summable C^k bounds on each
fixed compact set and with tails preserving earlier C² nondegeneracy. Prove
smooth convergence, persistence on every exhaustion interior, and the prescribed
fine error bounds for every prescribed finite-order neighborhood. This gives the global theorem without an unstated Baire
space or transversality theorem on a function space.

The topology API is:

- Restriction to any open submanifold is continuous into its compact-core C^k seminorm topology, for each finite k.
- Restriction is continuous for the strong topologies when the open inclusion is proper, equivalently clopen here: a locally finite compact family in the submanifold is then locally finite in M.
- Positive tolerance refinement and finite intersections give neighborhoods of the same kind, independently of the compact chart cover.

The approximation API includes relative fixing and persistence of nondegeneracy.
Strong Morse density is Hirsch, Chapter 6, Theorem 1.2; the topology
is that of Chapter 2, §1. The relative version in §3.2 is a
cutoff extension of the local perturbation argument, with its fixing neighborhood
and convergence estimates constructed explicitly.
*Needs:* §1.3 compact seminorms; DifferentialGeometry partitions of unity and §10.2 Sard;
Tau Ceti `Analysis/Calculus/Morse/Generic.lean`.

**Checks.**
- On a point all positive-order derivatives are 0, so the topology is the ordinary topology on its value ℝ.
- On compact S¹ a finite chart family suffices; a tolerance ε bounds the zeroth derivative by ε as well as derivatives through k.
- On ℝ a neighborhood with tolerance e^(−x²) excludes every nonzero constant perturbation, unlike a compact-open neighborhood controlling only [−1,1].
- Let ψ be compactly supported on ℝ, with 0≤ψ≤1 and ψ=1 near 0. Then δψ tends strongly to 0 on ℝ as δ→0, but its restriction to (0,1) fails the neighborhood |g(x)|<x for every δ>0: choose 0<x<δ where ψ=1. On [a,b]⊂(0,1), δ<a passes that value bound.
- For the clopen summand ℝ in ℝ⊔ℝ, any locally finite compact chart family remains locally finite in the ambient disjoint union; its tolerances extend by arbitrary positive tolerances on the other summand.

### 3.2 Exhaustions and relative approximation

For a proper bounded-below input preserve those properties by a global C⁰
error less than 1. Prove existence of a smooth proper bounded-below exhaustion
on every manifold here using a compact exhaustion and a locally finite smooth
partition of unity, then its Morse approximation. Give relative approximation
which fixes a neighborhood of a prescribed closed set where the function is
already Morse: for closed A contained in an open Morse locus V, and every
strong smooth neighborhood of f, construct a Morse g in that neighborhood
and an open W with A⊆W⊆V such that g=f on W. Choose W with closure in V,
and use perturbations supported off W; maintain nondegeneracy on V by
locally chosen C² bounds. Compact-support control concerns each local
perturbation, not the global difference g−f on a noncompact manifold. Include
M1's continuous/smooth finite parameter dependence of nondegenerate critical
branches; do not claim every parameter value of a generic family is Morse
through birth-death events. General exhaustion existence here is separate
from GeometricTopology Layer1's squared-distance exhaustion for a given closed embedding.

The headline is `exists_proper_boundedBelow_morse` (Milnor, Corollary 6.7,
p. 36). Its API preserves properness
and lower bounds under uniformly bounded perturbations; relative approximation
fixes a neighborhood of the stated closed set and agrees with compactly supported
perturbations on compact chart cores. *Needs:* §3.1; a countable compact exhaustion;
DifferentialGeometry smooth partitions of unity.

**Checks.**
- On ℝ, x² is Morse, proper and bounded below by 0; a C⁰ perturbation of size <1 is bounded below by −1 and remains proper.
- On the empty manifold the unique function is proper and bounded below, and is Morse vacuously.
- On a countable discrete manifold, f(n)=n is proper with index-0 critical points; the constant function is not proper there.

### Examples

The birth-death family x³−t x tests local parameter scope; x² tests exhaustion
scope. An error bound <1 preserves exhaustion while an unbounded perturbation
−x² destroys it.

### Dependencies

Layer 1; DifferentialGeometry partitions of unity and §10.2 Sard; native local Morse perturbations.

## Layer 4: strong inequalities and topology tests (M4)

### 4.1 Strong inequalities

For compact M, a Morse function f and a field k let c_j be the finite count of index-j critical
points and b_j=dim_k H_j(M;k), using actual singular homology. From the cellular
complex of M2 prove

`Σ c_j t^j = Σ b_j t^j + (1+t)Q(t)`, with Q∈ℕ[t].

Identify Q's coefficients with the ranks of adjacent boundary maps; derive
all strong alternating inequalities, the weak inequalities, Euler equality
and total-critical-point lower bounds. Weak inequalities plus Euler equality
alone do not prove nonnegative coefficients of Q. Extend the statements to
regular sublevel/cobordism pairs and finite critical-band intervals, with the
relative homology maps visible.

Prove subgroups of free abelian groups of arbitrary rank are free, using a
well-order filtration and compatible basis extension over successive rank-one
quotients; apply it to the top cellular kernel, including countably many cells.
Thus top cellular homology of a d-dimensional CW model is free abelian and
cohomology above d vanishes by AT Stage 6.1's integral UCT. Do not infer that degree-d integral
cohomology is torsion-free. Apply the proper-index≤d version of M2 to obtain
those conclusions for noncompact M.

Define `bettiNumber` as the dimension over k of native singular homology.
Its API includes homotopy invariance, coefficient-sensitive calculations and
finite dimensionality on compact manifolds, derived from Layer 2's finite CW model.
The headline `strong_morse_inequalities` uses polynomials through degree dim M
and Q∈ℕ[t] (Cohen–Iga–Norbury, Corollary 5.11 and its proof, p. 42).
The proof's splitting of a finite-dimensional chain complex works over any field,
with coefficient of t^j in Q equal to rank(∂_(j+1)).
*Needs:* Layer 2; AlgebraicTopology Stage 6 cellular/singular comparison and UCT;
Mathlib singular homology and finite-dimensional linear algebra.

**Checks.**
- On S², C=B=1+t² and Q=0 over every field.
- On RP² over ℚ, C=1+t+t², B=1, Q=t; over 𝔽₂, B=C and Q=0.
- For the empty manifold C=B=Q=0; for r isolated points C=B=r and Q=0.
- The candidate counts c=(2,0,0,2) and b=(1,0,0,1) satisfy weak inequalities and equal alternating sums 0, but the degree-1 strong inequality is −2≥−1, which fails.

### 4.2 Arbitrary-function Lusternik–Schnirelmann inequality

Consume
AlgebraicTopology's categorical-cover supplement after Stage 6.2, with its
same `LSCategoricalCover`, `lsCategoryCount`, `normalizedLSCategory` and
`lsCupLength` carriers. Here prove the critical-point bound for **every
smooth real-valued f on a compact boundaryless finite-dimensional smooth
Hausdorff second-countable manifold M**, allowing arbitrary critical
point degeneracy. Use the native manifold derivative zero locus; compare
`mfderiv I 𝓘(ℝ) f` with the vector-valued `mvfderiv I f` used by
`criticalPoints`. Both give the same critical set for these smooth data.
Set the total critical count to `(criticalPoints f).encard : ℕ∞`. Prove

`lsCategoryCount M M ≤ (criticalPoints f).encard`.

This is Weber, *Conley pairs in geometry*, author version, Theorem 1.1,
p. 2: his category is the number of categorical open sets, hence equals
`lsCategoryCount M M` for nonempty M. The empty case is the separate
calculation 0≤0. The finite-cover output is `exists_criticalCategoricalCover`.

For nonempty connected M this gives
`#Crit(f)≥cat(M)+1≥cupLength(M;R)+1`, with cat(point)=0 and R any
commutative coefficient ring. Counts are distinct points, not critical
values. Infinite critical sets have count ∞ and satisfy every finite lower
bound; do not use `Nat.card`, whose infinite-set value is 0. Empty M has
both unnormalized counts 0. Prove the main inequality directly on M,
connected or disconnected, by the critical-level induction below.

As a **separate corollary and consistency check**, prove the component
sum formula. For an arbitrary boundaryless model, first transport its
local open comparison with the finite-dimensional vector space to prove
`LocallyConnectedSpace H`; then apply native
`ChartedSpace.locallyConnectedSpace` and compact locally connected
`ConnectedComponents` finiteness. Its components are clopen and carry the
restricted smooth structures. Prove the restriction/derivative comparison
and actual finite-component Sigma homeomorphism, then use AT's
finite-coproduct formula and the disjoint critical-set count. This
corollary is not a prerequisite for the main inequality. Dimension 0 is a
finite discrete calculation.

For the main bound, transport the native normed-space Fermat theorem through
boundaryless charts to `mfderiv=0` and combine it with the compact extreme-value
theorem. This proves the critical locus nonempty when M is nonempty and does
not assume a nondegenerate Hessian.

The finite-critical-set proof owns a **degenerate critical-level
neighborhood deformation**, independently of the nondegenerate Morse
normal form. Given one critical value c isolated from the other critical
values and an open neighborhood U of its finitely many critical points,
construct ε>0 and an ambient continuous deformation from the identity,
nonincreasing f, sending {f≤c+ε} into {f<c−ε}∪U. Choose nested categorical
coordinate balls around those points. On their compact transition annuli
and on the compact band outside the inner balls, bound |grad f| away from 0
for any chosen smooth auxiliary metric. Prove the positive f-drop required
to cross each annulus using `−df/ds=|grad f|` in arclength along the negative
gradient. Obtain a positive crossing-length bound from the coordinate
radius gap and uniform equivalence of metric/coordinate norms on the compact
chart core; no geodesic-distance or Hopf–Rinow theorem is needed. Choose the band width below that cost; once an orbit enters an
inner ball it cannot escape its outer ball while staying in the band.
The uniform gradient bound outside the inner balls gives a common finite
flow time. Construct the cutoff field/global compact-manifold flow and
its actual homotopy, and pull categorical covers back along its endpoint.
For Φ:C(unitInterval×M,M), explicitly bundle g(x)=Φ(1,x) and the native
`ContinuousMap.Homotopy (ContinuousMap.id M) g` using Φ(0,x)=x; reverse
that homotopy where the categorical endpoint-pullback API expects g≃id.
The target uses open lower sublevels and open neighborhoods, so the pullback
sets are open. Do not assume individual hitting-time choices are continuous.

Order the finitely many critical values. Construct the ambient-cutoff,
open-sublevel version of M2's compact critical-free-band deformation used
by the categorical-cover pullback: use regular value buffers and a common
finite flow time so the endpoint is in a strict lower sublevel. M2's
homotopy on a closed sublevel alone is not an ambient self-map. Apply these
bridges between the critical levels and prove category grows by
at most the number of critical **points** at each level. Start below the
minimum and end above the maximum. Obtain an explicit categorical cover
with exactly the finite critical count (pad a smaller cover only after
handling empty/nonempty cases), and derive the extended-count inequality.
Neither Morse–Smale genericity nor a Morse approximation of f is needed.

Construct a smooth Morse function with finite critical set on every compact
second-countable manifold here: apply M3's Morse approximation to the smooth zero function
and M1's finite-chart theorem to the resulting Morse function. This also
handles empty M. Native `IsMorse.contMDiff` supplies smoothness. Only after
obtaining an actual function with its Morse property and finite critical
set define the finite minimum `c(M)`.
Minimize over counts of **all smooth finite-critical functions**, not only
Morse functions; prove nonemptiness, attainment, independence of the supplied
witness and the universal lower bounds. The resulting natural minimum is
also the extended-cardinal minimum over **all** smooth functions: infinite
critical sets contribute∞ and cannot lower an existing finite minimum.
This is the source's c(M), not a new restriction to Morse functions. Without
the witness retain the extended counting statement, with no default finite
minimum. This bound is not an Arnold fixed-point theorem.

Checks include the empty/finite 0-dimensional cases, an infinite critical
set (a constant function on a nonempty positive-dimensional compact manifold),
several critical points at the same value, and degenerate isolated extrema
in the neighborhood-deformation theorem. A height function supplies a
finite witness on a sphere; the lower bound applies also to arbitrary
smooth degenerate functions there. Manifolds with boundary are excluded:
f(t)=t on [0,1] has no ordinary interior critical points. Relative/boundary
Morse conditions require their own hypotheses and are not added here.

The two deformation targets are `exists_degenerateCriticalLevelDeformation`
and `exists_noCriticalOpenSublevelDeformation`. Their API is ambient continuity,
identity at time 0, nonincreasing function value, and the strict endpoint
inclusion specified above. The finite minimum over all smooth finite-critical
functions has the following API, using §3.2 for nonemptiness:

- A smooth function attains the minimum, and its critical set is finite.
- The minimum is independent of the finite-critical function used to witness nonemptiness.
- Every smooth function has extended critical count at least that minimum; category and cup-length give the stated universal lower bounds.

*Needs:* Layer 2 compact-band flows; Layer 3 only for the finite witness;
AlgebraicTopology's categorical-cover supplement after §6.2; Weber, Theorem 1.1,
p. 2, with its finite-cover proof on pp. 2–3.

**Checks.**
- On the empty manifold the unique function has count 0, so the minimum c(∅)=0.
- On a point every function has zero derivative and exactly one critical point, so c(point)=1; more generally c(M)=r for r discrete points.
- On S¹, a height gives count 2 and every smooth function has a minimum and maximum (a constant has infinite count), so c(S¹)=2; starting from a four-critical-point witness still gives 2, not 4.
- Empty M has critical count and category both 0; a finite set of r points has both r.
- Height on S¹ gives category 2 and critical count 2; a torus height has category 3 and critical count 4.
- A constant on S¹ has count ∞ and category 2; it satisfies the inequality without any finite minimum being assigned to its critical set.
- At a degenerate minimum f=x⁴ the critical Hessian is 0, so the degenerate deformation cannot invoke a Morse chart.
- The minimum over finite smooth critical counts on S¹ is 2 for every chosen Morse witness: 2=2, including a witness with four critical points.

### 4.3 Sphere and projective applications

Acceptance: standard height on S^m; cosine functions on T^m with binomial
critical counts; the two-dimensional torus's minimum/saddles/maximum; explicit
integer counts satisfying weak inequalities/Euler but violating a strong
inequality; and a closed positive-dimensional M admitting a Morse function
with exactly two critical points is homeomorphic to a sphere
(`nonempty_homeomorph_sphere_of_two_criticalPoints`; Cohen–Iga–Norbury,
Application 5.13, p. 43). The last conclusion follows from
two disc handles and the topological radial extension of the boundary gluing;
no diffeomorphism-to-standard-sphere assertion is made. Connectedness is
not a separate hypothesis: every component of a closed positive-dimensional
manifold carries a minimum and a maximum of f, which are distinct critical
points because a Morse function is not constant on an open set of positive
dimension, so the two-point count forces a single component. Complex projective
moment functions use [ComplexKahlerGeometry K7.1 and K7.2](../ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples):
K7.1 supplies the actual `Projectivization ℂ (Fin (n+1)→ℂ)` carrier and,
through K1 and [ComplexManifolds Milestone 1](../ComplexManifolds/README.md#milestone-1-restriction-of-scalars-and-atlas-transport)'s real restriction of the complex affine charts, the concrete
real self-model `Ireal_n:=𝓘(ℝ,Fin n→ℂ)`, its `Ireal_n.Boundaryless` and
`IsManifold Ireal_n ∞` structures, and complex orientation. Use the actual
root theorem `finrank_real_of_complex` and `Module.finrank_pi` to identify
`Module.finrank ℝ (Fin n→ℂ)=2*n`. Use only K7.2's CW-structure and cellular/cup
subitems, constructed from K7.1 and AT4/AT6 independently of M4. On nonzero
homogeneous z pin the function
`f([z])=(Σ_(j:Fin(n+1)) (j.val:ℝ)·|z_j|²)/(Σ_j |z_j|²)`.
Prove representative independence, smoothness, critical points [e_j] and
Morse index 2j using M1's model/Hessian/index comparisons. Consume the
M2 handle/cell construction and M4's application of AT6's cellular/singular
comparison to that CW chain model, to compare with those supplied cellular
calculations; the earlier CKG CW and
cup constructions do not depend on this Morse application.
For Morse functions on compact manifolds, also prove critical-count parity
equals Euler-characteristic parity and sphere critical counts are even, and closed odd-dimensional manifolds have Euler
characteristic 0 by comparing f and −f. The equality is
`c_j(−f)=c_(m−j)(f)` for 0≤j≤m, not symmetry of the counts of an arbitrary single f.
For RP² consume AlgebraicTopology AT4.6's single projectivization/manifold/CW
carrier and use the quadratic coordinate function with three distinct weights:
three critical points and no perfect Morse function over ℚ, contrasted with
its perfect F₂ count. More generally π₁(M)≠0 and b₁(M;ℚ)=0 obstruct
perfection over ℚ by the necessary 1-cells in a connected CW model.

*Needs:* §4.1–§4.2; Layer 2 disc handles; ComplexKahlerGeometry K7.1–K7.2;
AlgebraicTopology §4.6. The sphere proof uses Morse nondegeneracy at both extrema.

**Checks.**
- On S², ordinary height has indices 0 and 2 and two nondegenerate critical points.
- For f=h−h³/3 on S², the only critical points are still the poles but both Hessians are 0: the two-handle hypothesis fails.
- On two disjoint copies of S² the height has four critical points, so the two-point count already excludes a disconnected M; a statement with a separate connectedness hypothesis is weaker, not different.
- On CP¹, f([z₀:z₁])=|z₁|²/(|z₀|²+|z₁|²) has critical values 0,1 and indices 0,2; the denominator is positive because z≠0.

### Examples

On T² the polynomial is 1+2t+t²; on RP² the same geometric count has different
Betti polynomials over ℚ and 𝔽₂. On a point the sphere conclusion is excluded
by positive dimension, while all counting formulas remain valid.

### Dependencies

Layers 1–3; AlgebraicTopology Stages 4,6 and its categorical-cover supplement;
ComplexKahlerGeometry K7 and ComplexManifolds Milestone 1 for projective examples.

## Layer 5: Morse–Bott normal bundles and attachments (M5)

### 5.1 Critical normal bundles and attachments

Define Morse–Bott intrinsically: the critical locus near each critical point
is a smooth submanifold and ker Hess=T C. Use a locally finite family of
embeddings i_a:S_a→M, each with its own model/dimension, whose images are the
critical components; pin the normal Hessian on GT Layer 1's general normal
bundle. Build positive/negative normal subbundles and smooth spectral
projections by extending native `Morse/SpectralSplitting` to these families.
Prove rank local constancy and independence of their isomorphism class from
the metric; the actual subspaces can depend on that metric. Build smooth
square-root/inverse-square-root operations on positive matrices from native
`sqrtNearOne`, with local conjugation and uniqueness/naturality to glue;
prove chart/frame compatibility without assuming smooth eigenbases.

Prove the parametric Morse lemma on GT's actual normal bundle, fixing the zero
section and carrying f to its positive-minus-negative fiber quadratic form.
Own the base-dependent parametric congruence lemma extending native
`exists_congruence_of_symmetric_family`: both reference B₀(b) and perturbed
form vary smoothly with b. Give the integral-Hessian formula, compact-base
bounds, local fiber inversion and compatibility with bundle transitions;
patch the changes to a neighborhood of the zero section. The local normal
form is Cohen–Iga–Norbury, Theorem 15.1, p. 143, with the quadratic identity
on a neighborhood of the zero section; a bounded function cannot have that
identity on an entire nonzero normal fiber. The global bundle-compatible
patching is the extension constructed here.
For a compact critical component and a compact isolated critical band, attach
the negative disc bundle, give the relative homotopy equivalence and identify
the resulting relative homology with H_(j−λ)(C;orientation(ν⁻)). Use Thom
local coefficients, or F₂; untwisted integral/rational coefficients require the
negative-bundle orientation. Include multiple critical components and prove
compatibility with regular-band deformation (Cohen–Iga–Norbury,
Theorem 15.4, p. 146, for compact M; localizing its deformation to a
compact isolated band gives the stated band version). The twisted Thom
identification uses CharacteristicClasses C2, including its orientation system.

Consume [DGFloer Layer 1 item 3](../DGFloer/README.md)'s generic filtered-complex
`SpectralObject`, independently of its trajectory layers. Construct the
critical-band filtration and identify its spectral sequence, naturality
and finite convergence on compact M (Cohen–Iga–Norbury, Theorems 15.6–15.7,
pp. 147–148). Use the homological filtration convention in which relative
attachment homology is E¹; its differential can be nonzero. For the filtration
by ordered critical values, its filtration index is the critical-band position,
not the Morse index. Deduce Morse–Bott strong inequalities
with the shifted critical-component Betti polynomials and the correct negative-
orientation coefficients. Prove the ordinary Morse specialization is M2/M4.
Hamiltonian [ConvexityToric T2](../SymplecticGeometry/ConvexityToric/README.md) consumes this attachment theorem and supplies
complex negative bundles/equivariant perfection; RiemannianGeometry R3 and HomotopySpheres §4B path
applications supply their own critical components and Jacobi negative bundles.

The Morse–Bott API includes the normal Hessian, its smooth negative/positive
subbundles, rank local constancy, fiberwise coordinate naturality, the relative
Thom comparison and the filtered attachment spectral sequence.
*Needs:* Layers 1–2,4; GeometricTopology Layer 1; CharacteristicClasses C2;
DGFloer Layer 1 item 3; Cohen–Iga–Norbury, Theorems 15.1, 15.4, 15.6–15.7,
pp. 143, 146–148.

**Checks.**
- For f(x,y)=y², the critical line has Hessian kernel span(e₁), negative rank 0 and positive rank 1.
- For f(x,y)=y⁴, the Hessian kernel is the whole plane at the critical line; this is not Morse–Bott.
- On a point critical component the negative bundle has rank λ and contributes t^λ, recovering the ordinary Morse formula.
- For a negative Möbius line over S¹, the integral Thom comparison uses its nontrivial orientation system; replacing it by constant ℤ coefficients gives the wrong H₀ coefficient group (ℤ instead of ℤ/2).
- The ordinary RP² cell filtration has E¹ groups ℤ in cell dimensions 0,1,2 and differential 2 from dimension 2 to 1; on E² these become ℤ, ℤ/2, 0. The relative groups are not already E².

### Examples

A constant on a compact manifold is Morse–Bott with zero normal bundle and
one critical component per connected component; its contribution is the original
Betti polynomial. No nondegenerate isolated-critical-point hypothesis is inferred.

### Dependencies

Layers 1–2,4; GeometricTopology Layer 1; CharacteristicClasses C2; DGFloer Layer 1 item 3.

## Layer 6: gradient convergence and exponential decay (M6)

### 6.1 Compact trapping

Use DifferentialGeometry §12.2's `mgradient`, its flat-model comparison
`mgradient_eq_gradient`, and Layer 3's maximal smooth flows. Use the native
vector-space `Analysis/Calculus/Morse/{GradientFlow,Convergence,Linearization,ExponentialConvergence}`
estimates, including `IsIntegralCurveOn.exists_tendsto_atTop`,
`exists_sub_le_mul_exp_atTop`, `exists_norm_sub_le_mul_exp_atTop` and their
atBot versions. Layer 2 constructs the adapted pseudo-gradient specialization.
Extend the fixed-inner-
product estimates to variable Riemannian metric gradients, which need not
be adapted pseudo-gradients, and compact trapping inside noncompact manifolds.
For a smooth Morse function f and a maximal forward
negative-gradient trajectory trapped in a compact set, prove global forward
existence, energy monotonicity and dissipation. Construct its nonempty
connected omega-limit set, show it consists of critical points using flow
invariance and dissipation, and use finiteness of the critical set to identify
a single limit p. A proper bounded-below Morse function traps every forward
trajectory in its initial compact sublevel, giving that corollary.

Transport native `exists_mul_abs_sub_le_norm_gradient_sq` to manifold charts
with equivalent metric norms. Prove locally `|f−f(p)|≤C‖grad f‖²` and
two-sided gradient/distance estimates. On a convergent descending trajectory
E(t)=f(γ(t))−f(p)≥0; derive exponential decay of E and bound tail length by
a constant times √E using its derivative and dissipation. Deduce
`dist(γ(t),p)≤C' exp(−ct)` after a finite entry time. Treat an equilibrium
separately; a saddle limit does not require local positivity of f−f(p).

Use normalized-gradient reparametrization only on compact critical-free
bands in M2; it need not be complete near a critical point. Closedness and
isolation of the critical set supply finiteness on compact sets. Prove the
proper/bounded-below and compact-trapped corollaries with these explicit
hypotheses.

The headline `exists_compactTrapped_gradient_limit` takes a smooth metric,
a Morse function f, a curve γ satisfying the native negative Riesz-gradient
equation on [0,∞), and a compact K containing that forward image. It gives
p∈K with df_p=0, convergence γ(t)→p, and constants C,c>0 and T≥0 such that
for t≥T the intrinsic extended distance is at most C exp(−ct). This uses
`Manifold.riemannianEDist` directly, so no choice of an unrelated compatible metric
or conversion of infinite distance to a real number occurs. The compact-M
convergence case is Cohen–Iga–Norbury, Theorem 4.6, pp. 27–29; compact
trapping and variable-metric exponential estimates are the extensions above.

The convergence API includes global forward lifetime under compact trapping,
a unique critical limit for Morse f, exponential distance decay, and finite tail
length. *Needs:* §1.3; §2.2; DifferentialGeometry Layers 3,12; native Morse gradient estimates.

**Checks.**
- For f=x², γ(t)=x₀e^(−2t), E(t)=x₀²e^(−4t) and tail length |x₀|e^(−2t).
- With metric 4dx² and f=x², the negative gradient is −x/2, γ(t)=x₀e^(−t/2), and intrinsic distance to 0 is 2|x₀|e^(−t/2); the Euclidean rate 2 is not preserved under metric rescaling.
- For f=−u²+v² on the stable axis u=0, E=v²≥0 and v(t)=v₀e^(−2t); f need not have a local minimum.
- At an equilibrium, E and tail length are both 0; no division by E is allowed.

### Examples

For f=x² on ℝ every forward trajectory x₀e^(−2t) stays in [−|x₀|,|x₀|] and
converges to 0 at rate 2. For f=x on ℝ the trajectory x₀−t leaves every
compact set and f has no critical point, so the trapping hypothesis fails
rather than the conclusion; properness with a lower bound is what supplies
trapping, and a merely bounded-below function such as e^(−x) supplies none.

### Dependencies

Layers 1–2; DifferentialGeometry Layers 3,12; native vector-space gradient estimates.

## Downstream consumers

RiemannianGeometry R3 and HomotopySpheres §4B use the finite Morse/Bott
attachments for broken-geodesic and path-space applications. AffineMorseLefschetz
uses Layers 1–4 for index-controlled exhaustions. HeegaardFloer Lane M uses the
finite core for trajectory homology. SymplecticGeometry/ConvexityToric T2 uses
Layer 5 for Hamiltonian critical submanifolds and equivariant perfection.

## References

- Milnor, *Morse Theory* (1963), §§2–6 for the classical development and
  Lemma 3.6, pp. 20–21, for homotopic attaching maps; Theorem 3.1, p. 12,
  Theorem 3.5, p. 20, and Corollary 6.7, p. 36.
- Cohen, Iga and Norbury, [*Topics in Morse Theory*](https://math.stanford.edu/~ralph/morsecourse/biglectures.pdf),
  author course notes (2006): Theorem 5.1, pp. 33–35; Theorem 5.3,
  pp. 36–37; Theorems 5.6–5.7, pp. 38–41;
  Corollaries 5.8–5.11, pp. 41–42; Application 5.13, p. 43;
  Theorems 15.1, 15.4, 15.6–15.7, pp. 143, 146–148, for Morse–Bott theory.
- Hirsch, *Differential Topology* (1976), Chapter 2, §1
  (strong topologies), and Chapter 6, Theorem 1.2 (strong Morse density),
  DOI 10.1007/978-1-4684-9449-5.
- Weber, [*Conley pairs in geometry – Lusternik–Schnirelmann theory and more*](https://www.math.stonybrook.edu/~joa/PUBLICATIONS/conblock.pdf),
  author version of arXiv:1709.05010: Theorem 1.1, p. 2, and its finite-cover
  proof, pp. 2–3. Numbering here refers to this author version.
- Thomas Mark, *Math240 Riemannian Geometry* (2001), Homework 11 (Morse–Bott examples).
  Bibliographic attribution only; the mathematical targets use the references above.
