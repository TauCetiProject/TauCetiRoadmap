# Morse functions, sublevel topology and Morse–Bott attachments

Develop the finite-dimensional topology of Morse and Morse–Bott functions:
intrinsic Hessians and indices, normal forms, genericity, deformation of
sublevels, handles and cells, proper exhaustions, strong inequalities and
critical-submanifold attachments and compact-trapped gradient convergence.
The resulting library supplies geodesic Morse theory,
[AffineMorseLefschetz](../AffineMorseLefschetz/README.md) and Hamiltonian moment-map topology.

## Scope, conventions and dependencies

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

Use actual Tau Ceti `IsManifoldNondegenerateCriticalPoint`, `IsMorse`,
`IsMorseOn` and `manifoldMorseIndex`, from
`Geometry/Manifold/Morse/{Basic,Index}`. The vector-space suppliers are
`Analysis/Calculus/Morse/{Basic,NormalForm,Generic}`, including
`IsNondegenerateCriticalPoint.exists_morse_chart` and the small linear-
perturbation theorem. Consume `MDifferentiableAt.mvfderiv_eq_fderiv_comp_extChartAt_symm`,
`manifoldMorseIndex_le_finrank`, the complementary-index theorem,
`manifoldMorseIndex_comp_fst_add_comp_snd`, and `Morse/Sphere/{Basic,Prod}`.
Consume the manifold `TauCeti.MorseChart` and
`IsManifoldNondegenerateCriticalPoint.nonempty_morseChart` from
[Geometry/Manifold/Morse/Lemma](https://github.com/TauCetiProject/TauCeti/blob/e8375e4fdc90df4033f28291a72d5f64234a301a/TauCeti/Geometry/Manifold/Morse/Lemma.lean);
its quadratic equation carries a factor 1/2
and an unordered list of ±1 weights. M1 supplies arbitrary-model transport,
ordering/scaling and intrinsic-Hessian comparisons. The linked upstream
manifold-chart and compact-finiteness APIs supply those construction targets;
Suggested.lean uses the pinned Morse Basic/Index and vector-space NormalForm
interfaces for its signatures.
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
as an input. Include critical/index and `IsAdaptedPseudoGradient` comparisons.
All arbitrary-model consumers use this transport. Use Mathlib `PartialDiffeomorph`, `IsProperMap`, `CWComplex`, `RelCWComplex`,
`ContinuousMap.HomotopyEquiv` and native singular (co)homology.

[DG Layers 3,5,10,12](../DifferentialGeometry/README.md) supply flows, boundary-orientation interfaces,
partitions of unity, sharp finite-dimensional Sard, metrics and Hessians.
[AlgebraicTopology Stages 2–8](../AlgebraicTopology/README.md) supply relative
chains, cofibrations, cellular/singular comparison, products, integral duality
and relative homotopy. M4’s arbitrary-function LS bound consumes the
[categorical-cover/cup-length supplement in AT Stage 6](../AlgebraicTopology/README.md#stage-6-cohomology-products-and-manifold-duality); that supplement uses
only foundational products and native homotopies, not Morse theory or
manifold duality. [GT Layer 1](../GeometricTopology/README.md) supplies
normal/tubular geometry, collars, handle gluing and disc bundles; this
roadmap owns Brown's bicollared generalized Schoenflies theorem as the input
of M4.1, while GT Layer 2 keeps local flatness, codimension-one collaring and
the annulus theorem. [CharacteristicClasses C2](../CharacteristicClasses/README.md)
supplies ordinary Thom classes and their local orientation coefficients.

This roadmap owns ordinary finite Morse deformation/attachment and their
abstract Morse–Bott extension. RiemannianGeometry R3 owns the broken-geodesic
vertex carrier, Jacobi/index comparison and path-space limit, consuming this
core. The symmetric-space and Bott applications use the same broken-path
carrier and the attachments here, following
HomotopySpheres §4B.
[HeegaardFloer Lane M](../HeegaardFloer/README.md) owns stable/unstable
manifolds, Morse–Smale trajectory spaces, compactification/gluing, Morse
homology and its singular comparison. It consumes the finite Morse core here;
this roadmap does not construct a second trajectory complex.

At a critical point the Hessian is d²f, with no factor 1/2. A normalized Morse
chart has `f=f(p)−Σ_(i<λ)y_i²+Σ_(i≥λ)y_i²`, hence Hessian diagonal ±2.
λ is the negative inertia index. Gradient descent uses −grad f. Set
`M_a={x | f(x)≤a}`; regular-level deformation fixes M_a pointwise. Different
metrics change gradients and flow parametrizations but not the Hessian/index
at a critical point or the sublevel homotopy conclusions.

## M1. Critical Hessians, indices and usable normal forms

Define the critical set as `{x | mvfderiv I f x = 0}` and consume its native
preferred-chart comparison. Define the critical Hessian as a symmetric
continuous bilinear form on `TangentSpace I x`, transported from d²f in the
preferred extended chart under the hypothesis df_x=0. Prove it is independent
of coordinates and connection, and identify
it with DG's Hessian for every chosen smooth metric. Prove symmetry, change of
coordinates by congruence, inertia invariance, λ≤dim M, complementary index
under f↦−f, and direct-sum/product additivity. Keep the noncritical Hessian's
connection dependence explicit. Give the tangent-quadratic-form and matrix
comparisons, restrictions to subspaces and positivity/negativity tests.

Extend the native manifold Morse chart to an actual partial diffeomorphism
for every boundaryless model, with a Euclidean target and center 0. Compose its
linear coordinate map with an index-ordering permutation and division by √2,
using `exists_hessianQuadraticForm_equivalent_weightedSumSquares`; prove both smooth maps and the
normalized sum-of-squares equation on the whole source. Derive isolation,
strict local minima/maxima, the two-dimensional saddle model and finite critical
sets on compact subsets for a global Morse function. Consume native
`IsMorse.finite_setOf_mfderiv_eq_zero` and `MorseChart.mfderiv_eq_zero_iff`
from [PseudoGradient/Existence](https://github.com/TauCetiProject/TauCeti/blob/e8375e4fdc90df4033f28291a72d5f64234a301a/TauCeti/Geometry/Manifold/Morse/PseudoGradient/Existence.lean).
The compact finiteness theorem uses the standard model `𝓘(ℝ,E)`; consume
it directly. Extend the local chart argument to compact subsets and apply
the shared arbitrary-model transport, retaining the native `mfderiv` zero
locus and its comparison with the critical set’s vector-valued `mvfderiv`. Define chartwise C^k
seminorm neighborhoods on fixed compact coordinate sets before using them.
Prove persistence of
nondegenerate critical points under small C² perturbations on fixed compact
neighborhoods, with the implicit-function critical-point continuation, index
and value dependence. Construct critical counts with extended natural/cardinal
values first; use finite natural counts only after the relevant compactness
proof, avoiding junk values on infinite critical sets.

## M2. Compact-band deformation, handles and cells

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
along it as the named scalar-level atlas, whose
existence, smooth-embedding and tangent-range laws are packaged as
`exists_scalarRegularLevelData`. The native existential
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
Consume native `IsAdaptedPseudoGradient` from
`Geometry/Manifold/Morse/PseudoGradient/Basic`,
`IsMorse.exists_isAdaptedPseudoGradient` from `PseudoGradient/Existence`,
`PseudoGradient/Local`'s `MorseChart.linearFlow` and coordinate-flow laws,
`PseudoGradient/Flow`'s smooth flow/diffeomorphism/energy and convergence
statements, and `PseudoGradient/Energy`'s trajectory energy identity.
`PseudoGradient/Gradient` compares metric gradients when the chosen metric is
Euclidean in its Morse charts; it does not cover every smooth metric.
Native `Analysis/Calculus/Morse/CompactSublevel` gives vector-space orbit/
trajectory compactness, not a cell-attachment or band deformation. Extend
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

Own the change-of-chart comparison at fixed c and a common admissible ε,
before compactification gluing, with the regular lower sublevel identified
explicitly. An admissible ε has compact band f⁻¹[c−ε,c+ε], no critical
points there except the specified points at c, and every chosen chart image
contains its closed negative-coordinate disk of radius √ε. These conditions
are retained on decreasing ε. For a chart φ use χ_φ(w)=φ⁻¹(√ε·w,0)
and α_φ=χ_φ|∂D. For two choices construct
h∈O(λ), its boundary restriction h_∂ and a homotopy of characteristic maps
of pairs K:χ₁≃χ₀∘h. Write H=K|∂D with H(·,0)=α₁ and
H(·,1)=α₀∘h_∂. Construct the particular Milnor comparison (Lemma 3.6)
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

## M3. Approximation and proper Morse exhaustions

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

For a proper bounded-below input preserve those properties by a global C⁰
error less than 1. Prove existence of a smooth proper bounded-below exhaustion
on every manifold here using a compact exhaustion and a locally finite smooth
partition of unity, then its Morse approximation. Give relative approximation
which fixes a neighborhood of a prescribed closed set where the function is
already Morse, with compact-support control for local perturbations. Include
M1's continuous/smooth finite parameter dependence of nondegenerate critical
branches; do not claim every parameter value of a generic family is Morse
through birth-death events. General exhaustion existence here is separate
from GeometricTopology Layer1's squared-distance exhaustion for a given closed embedding.

## M4. Strong inequalities and topology tests

For compact M and a field k let c_j be the finite count of index-j critical
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

**Arbitrary-function Lusternik–Schnirelmann inequality.** Consume
[AlgebraicTopology Stage 6’s categorical covers and Lusternik–Schnirelmann bounds](../AlgebraicTopology/README.md#stage-6-cohomology-products-and-manifold-duality), with its
same `LSCategoricalCover`, `lsCategoryCount`, `normalizedLSCategory` and
`lsCupLength` carriers. Here construct `lsCriticalPointBound` for **every
smooth real-valued f on a compact boundaryless finite-dimensional smooth
Hausdorff second-countable manifold M**, allowing arbitrary critical
point degeneracy. Use the native manifold derivative zero locus; compare
`mfderiv I 𝓘(ℝ) f` with the vector-valued `mvfderiv I f` used by
`criticalPoints`. Both give the same critical set for these smooth data.
Set `totalCriticalCount f=(criticalPoints f).encard : ℕ∞`. Prove

`lsCategoryCount M M≤totalCriticalCount f`.

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

Construct `nonempty_morseFiniteWitness` on every compact second-countable
manifold here: apply M3's Morse approximation to the smooth zero function
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

### M4.1. Two critical points with arbitrary degeneracy

Prove `nonempty_homeomorph_sphere_of_two_criticalPoints`: if M is compact,
connected, boundaryless and smooth of real dimension m>0, and a smooth
f:M→ℝ has exactly two distinct critical points, construct an actual
homeomorphism M≃ₜS^m. Both critical points may be degenerate, including
vanishing Hessians. The count is the same derivative-zero point count used
above, not a count of critical values. Compact extrema and the boundaryless
Fermat theorem identify the two points as the unique minimum p and maximum q,
with a=f(p)<f(q)=b; every value in (a,b) is regular. This theorem is separate
from the LS inequality: a categorical contraction or category bound does not
recognize a disc or sphere. Do not perturb f to Morse while assuming its
critical count stays two.

First construct `exists_twoEuclideanOpenCover_of_two_criticalPoints`, with
actual open subsets U,V covering M and homeomorphisms U≃ₜℝ^m and V≃ₜℝ^m.
Choose a coordinate ball B at p with compact closure avoiding q and a coordinate
ball V at q avoiding p. Consume the smooth metric and complete compact-manifold
flow suppliers from DG3/DG12 already used in M2, using X=−grad f itself, not
an adapted Morse pseudo-gradient. Its global flow Φ_t is a diffeomorphism
with inverse Φ_−t and d(f∘Φ_t)/dt=−‖grad f‖². Since p is the unique minimum,
choose ε>0 with {f≤a+ε}⊂B. This sublevel is invariant under the descending
flow; no assertion that it is a disc is needed. K=M\V is compact and excludes
the unique maximum, so choose δ>0 with f(K)≤b−δ. If K already lies below
a+ε, use time0; otherwise on the compact critical-free band
f⁻¹[a+ε,b−δ] the gradient norm has a strictly positive lower bound η.
The energy identity gives a single T>0 sending every point of K into
{f<a+ε}⊂B, by choosing T larger than the band width divided by η².
Prove this uniform estimate, including trajectories which enter the invariant
lower sublevel earlier. Then U=Φ_−T(B) covers K, and U∪V=M. The chart-ball
homeomorphisms and Φ_T give the required Euclidean maps. This uses compact
flow and elementary value estimates, not continuity of pointwise hitting times
or the nondegenerate local normal form. Negating f gives the symmetric cover.

Next prove **Brown's generalized Schoenflies theorem**, owned here as the
topological input of M4.1: for m≥1 and a topological embedding
β:S^(m−1)×[−1,1]→S^m, the complement of Σ=β(S^(m−1)×{0}) has exactly two
components, each containing one open collar side, and the closure of each is
homeomorphic to the closed ball D^m by a homeomorphism carrying its frontier
Σ onto ∂D^m (Brown 1960, Theorem 5, p. 76). The separation statement is
Jordan–Brouwer for a bicollared sphere, from the reduced singular homology of
S^m∖Σ by Mayer–Vietoris on the collar
([AlgebraicTopology Stage 3](../AlgebraicTopology/README.md#stage-3-subdivision-excision-and-mayer--vietoris)). Follow Brown's route: a cellular subset of an m-cell has an m-cell
quotient (Theorems 0–2), a map of S^m onto itself whose only point preimages
with more than one point are two sets A,B has A and B cellular (Theorems 3–4), and the map collapsing
the two outer collar pieces to the poles has exactly those two inverse sets.
The hypothesis is the explicit bicollar β; no local-flatness theorem,
annulus theorem or Alexander-horned-sphere analysis is an input, and the
statement is false for the horned sphere, which has no bicollar.
GeometricTopology Layer 2 owns locally flat embeddings, Brown's 1962
codimension-one collaring theorem and the annulus theorem; none of those is
used here, because the bicollar below is written down in coordinates.

Then prove the **two-open-cell lemma**
`nonempty_homeomorph_sphere_of_two_euclidean_opens`. For any compact Hausdorff
space X covered by two open subsets U,V each homeomorphic to ℝ^m, m>0,
construct X≃ₜS^m. In U coordinates choose a closed round m-ball D of radius r
whose interior contains the compact set X\V. Thus Σ=∂D lies in the open set
U∩V, and by compactness so does a thin coordinate annulus
{r−η≤|u|≤r+η}; radial coordinates on it give an explicit bicollar
β:S^(m−1)×[−1,1]→V of Σ. The complement C=X\int D is compact and lies
inside V. Identify the one-point compactification of V≃ₜℝ^m with S^m using
native `Homeomorph.onePointCongr` and `onePointEquivSphereOfFinrankEq`, and
apply Brown's theorem to β there. The two open sets X\D and
(int D∩V)∪{∞} partition S^m\Σ (the second is open because its complement
C is compact in V), and β places one collar side in each. Hence C is the
closure of the complementary component not containing ∞, and Brown gives
C≃ₜD^m with its actual boundary map. D is the other closed cell. Compare
their union with the boundary pushout, and extend the boundary gluing
homeomorphism radially by the Alexander map to obtain X≃ₜS^m. Include m=1
(two arcs and their two endpoints) explicitly; no high-dimensional surgery,
Poincaré conjecture or differentiable Schoenflies statement is an input.
For smooth M the cover of the previous paragraph consists of open sets
diffeomorphic to ℝ^m, the hypothesis of Milnor 1959, Theorem 1(3), whose
Corollary 1 (p. 442) is this topological conclusion; the lemma here needs
only homeomorphisms.

Compose the two constructions for the degenerate Reeb–Milnor/Rosen theorem.
Its output is topological only; exotic smooth spheres are not identified
diffeomorphically with the standard sphere. In the nondegenerate case compare
this result with M1/M2's two-disc-handle route at the level of existence of a
homeomorphism, without asserting that two arbitrary choices of homeomorphism
are isotopic. The all-smooth theorem does not assert that every small regular
sublevel at a degenerate extremum is a disc or that its regular level is a
standard sphere.

As a degenerate regression take standard height h:S^m→[−1,1] and
f=h−h³/3, m>0. Compute df=(1−h²)dh: its critical set is exactly the two poles,
and both intrinsic Hessians vanish. Apply the all-smooth theorem directly;
M1's nondegenerate chart theorem is inapplicable to this f. Retain all empty,
dimension0, boundary, infinite-critical-count and arbitrary-function LS cases
above unchanged; they are not extra hypotheses on this positive-dimensional
sphere theorem.

Acceptance: standard height on S^m; cosine functions on T^m with binomial
critical counts; the two-dimensional torus's minimum/saddles/maximum; explicit
integer counts satisfying weak inequalities/Euler but violating a strong
inequality; and closed connected positive-dimensional M with exactly two
critical points is homeomorphic to a sphere. For a Morse function the last conclusion follows from M1/M2's two disc
handles and radial boundary extension. For an arbitrary smooth function,
including degenerate extrema, use M4.1's Euclidean-open-cover and two-open-cell
construction. Neither route asserts a diffeomorphism to the standard sphere. Complex projective
moment functions use [ComplexKahlerGeometry K7.1 and K7.2](../ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples):
K7.1 supplies the actual `Projectivization ℂ (Fin (n+1)→ℂ)` carrier and,
through K1's real restriction of the complex affine charts, the concrete
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
Also prove critical-count parity equals Euler-characteristic parity, sphere
critical counts are even, and closed odd-dimensional manifolds have Euler
characteristic 0 by comparing f and −f. The equality is
`c_j(−f)=c_(m−j)(f)` for 0≤j≤m, not symmetry of the counts of an arbitrary single f.
For RP² consume AlgebraicTopology AT4.6's single projectivization/manifold/CW
carrier and use the quadratic coordinate function with three distinct weights:
three critical points and no perfect Morse function over ℚ, contrasted with
its perfect F₂ count. More generally π₁(M)≠0 and b₁(M;ℚ)=0 obstruct
perfection over ℚ by the necessary 1-cells in a connected CW model.

<a id="m42-isolating-gradient-cup-bound"></a>
### M4.2. Isolating gradient pairs, degenerate critical counts and cup injection

Develop the compact-isolating-pair form of the critical-point bound used in
Golé, Appendix 2, §§62–63. Here the ambient manifold need not be compact and
critical points need not be nondegenerate. Consume [AT6's compact-metric
Čech closed-pair supplement](../AlgebraicTopology/README.md#compact-metric-cech-closed-pairs)
for Čech cohomology of compact metric spaces and closed pairs, its continuity,
closed excision, exact sequences, relative cups and cube-product theorem.
Write `Ȟ` for that theory, with coefficients in a commutative ring R;
require `Nontrivial R` for the nonvanishing and counting statements. Use its
comparison with singular cohomology only on the compact manifold/CW carriers
where that comparison is proved. The maximal invariant set can be a wild
compactum and is not assumed to have such a comparison.

**Regular pair and complete flow.** Let W be smooth on a neighborhood of a
compact subset P of a boundaryless manifold, with a smooth Riemannian metric
there. Construct a compactly supported smooth cutoff χ, equal to 1 on a
neighborhood of P, and extend `X=−χ grad W` by zero. Using DG3/DG12's compact
support and flow suppliers, prove this field has a complete flow φ and agrees
with the original negative gradient near P. Prove the flow/group/inverse laws
and `d(W(φ_t x))/dt=−‖grad W(φ_t x)‖²` for orbit segments in P. No global
extension of W beyond the cutoff neighborhood is needed. Prove compactness
and metrizability of P and all the closed subsets below from the ambient
Hausdorff second-countable manifold hypotheses.

A regular pair here consists of compact P and closed L⊂P such that L is
positively invariant relative to P, every orbit leaving P first meets L,
and `I=Inv(P)={x∈P | ∀t∈ℝ, φ_t x∈P}` lies in `int(P\L)`. Include the
regularity hypothesis that the first-hitting time
`τ(x)=inf{t≥0 | φ_t x∈L}`, with value ∞ when the set is empty, is continuous
`P→[0,∞]`, is zero on L, and every segment through time τ remains in P
up to its endpoint. For τ=∞ this means every finite forward segment remains
in P. Prove attainment when τ is finite and continuity of the stopped maps
`F_s(x)=φ_(min(s,τ(x))) x` for finite s≥0, jointly in s and x. In a true
regular isolating block, whose exit points leave P immediately, identify τ
with the regular first-exit time from P. For a collar index pair, use the
first hit of L with the stated relative invariance and exit hypotheses;
it need not be the first exit from P. These hypotheses, including regularity,
are data to check for an application, not consequences of compactness alone.

**Survivors and their maps.** For t≥0 define

`S_t={x∈P | φ_[0,t](x)⊂P}` and
`T_t=φ_t(S_t)={x∈P | φ_[−t,0](x)⊂P}`.

Prove this equality using the inverse flow law, compactness of S_t and T_t,
`T_(t+s)⊂T_t⊂P`, and compactness of
`T_∞=⋂_(n:ℕ) T_n={x∈P | φ_(−s)x∈P for every s≥0}`.
Use these contained survivor sets throughout. A full flow image φ_t(P)
need not lie in P and does not define a relative triple inside P.

Set `K_t=T_t∪L`. The stopped map F_t has image in K_t: either it first hits
L, or its entire t-segment survives and its endpoint is in T_t. Thus it
factors as `r_t:P→K_t`. Construct the homotopy `H(a,x)=F_(a*t)(x)` from
`id_P` to the inclusion composed with r_t. It fixes L pointwise. For
x∈T_t, adjoining the original length-t backward segment to each forward
segment before stopping proves `H(a,x)∈T_t` until it hits L; after that it
is fixed in L. Hence H preserves K_t throughout. Restricting H to K_t gives
the other inverse homotopy, so inclusion induces the relative homotopy
equivalence `(K_t,L)→(P,L)`. This is a homotopy equivalence of pairs;
H need not fix every point of K_t.

Prove these equivalences commute with inclusions for increasing integer t.
Continuity for the decreasing compact closed pairs `(K_n,L)`, followed by
closed excision for `K_∞=T_∞∪L`, gives the actual restriction isomorphism

`Ȟ^q(P,L;R) → Ȟ^q(T_∞,T_∞∩L;R)`.

Next put `B_t=φ_(−t)(T_∞)`. Prove these are nested compact subsets of T_∞
with intersection I. The maps `x↦φ_(−a*t)x`, a∈[0,1], stay in T_∞ and
preserve B_t, giving homotopy inverse data for the inclusion `B_t→T_∞`.
Continuity for B_n therefore identifies restriction along `I→T_∞` as an
isomorphism `Ȟ^*(T_∞;R)→Ȟ^*(I;R)`, including ring compatibility.
These constructions own the flow-to-Čech bridge; neither singular continuity
on arbitrary compacta nor an unspecified Conley-index theorem is an input.

**Shifted relative cup-module injection.** Let P₀⊂P be compact, let
`α:P→P₀` be a retraction, let K≥0, and let `u∈Ȟ^K(P,L;R)` satisfy, for
every j≥0, the degreewise isomorphism

`v↦u∪α^*v : Ȟ^j(P₀;R) ≃ Ȟ^(j+K)(P,L;R)`.

Prove that `(α|I)^*:Ȟ^*(P₀;R)→Ȟ^*(I;R)` is injective and preserves cups
and units. Indeed, if `(α|I)^*v=0`, the preceding absolute restriction
isomorphism implies `(α|T_∞)^*v=0`. Relative-cup naturality then sends
`u∪α^*v` to zero in `Ȟ^*(T_∞,T_∞∩L;R)`. The relative restriction
isomorphism forces `u∪α^*v=0`, and the assumed shifted isomorphism forces
v=0. State this degreewise, without identifying the degree-K class u with
a degree-zero class or assuming a ring isomorphism across the shift.

For the product-pair specialization, supply a pair homeomorphism
`(P,L)≃(P₀×Q^p×Q^K, P₀×Q^p×∂Q^K)`, where `Q^d=[0,1]^d`, with α the
projection after identifying P₀ with fixed interior cube coordinates. Use
AT6's cube relative generator and its cup/cross compatibility to construct
u and prove the displayed shifted module isomorphism over R. Contract the
Q^p factor as a pair; retain the degree K and the cup-order sign. Include
K=0 with `∂Q^0=∅`. The product-pair theorem constructs this hypothesis; an
arbitrary pair is not assumed to have product topology.

**Arbitrary-degenerate count on the invariant compactum.** For every
nonzero product `a₁∪⋯∪a_r` in `Ȟ^*(I;R)` with each factor of strictly
positive degree, prove

`(r+1 : ℕ∞) ≤ ({x∈I | dW_x=0}).encard`.

Include r=0 when the empty product/unit is nonzero, equivalently I is
nonempty. Infinite critical sets have encard ∞, so satisfy every such finite
bound. For a finite critical set, use the gradient Lyapunov identity on I:
forward and backward limit sets are nonempty compact connected invariant
sets; W is constant on each, and the identity forces them into the critical
locus. Finiteness makes each limit set a singleton. Prove these facts here
for compact invariant trajectories, without a Morse Hessian, linearization
or a dependency on M6's exponential-convergence theory. A nonconstant
connecting orbit strictly decreases W, so two critical points at the same
value cannot be connected. Construct the singleton Morse decomposition,
ordered by critical value and with any order among tied values, including
isolation of each singleton using its small compact neighborhood and the
same forward/backward limit argument.

Own the finite gradient Morse-decomposition cup estimate, with a concrete
critical-value induction. Between successive distinct critical values choose
`a<b` in their critical-free gap, and set `A=I∩{W≤b}` and
`B=I∩{W≥a}`. These compact sets cover I; A is forward invariant and B
backward invariant. Prove that the decreasing compact images `φ_n(A)`
and `φ_(−n)(B)` have intersections `I_A=Inv(A)` and `I_B=Inv(B)`,
respectively. Their flow homotopies preserve A and B and their nested
images. Continuity therefore makes restriction `Ȟ^*(A)→Ȟ^*(I_A)` and
`Ȟ^*(B)→Ȟ^*(I_B)` ring isomorphisms. The two grouped invariant sets
partition the critical points into the lower and upper value groups.
For classes restricting to zero on A and B respectively, exactness lifts
them to `Ȟ^*(I,A)` and `Ȟ^*(I,B)`; their relative cup lies in
`Ȟ^*(I,A∪B)=Ȟ^*(I,I)=0`. If the two groups have n_A and n_B critical
points, induction makes every n_A-fold positive-degree product vanish on
A and every n_B-fold such product vanish on B. Split an (n_A+n_B)-fold
product into those consecutive groups and apply the relative-cup vanishing.
This proves the required subadditivity and the point count. At a single
critical value the forward and backward limits have the same W-value, so
the energy identity makes every orbit constant: that invariant set is a
finite discrete set of critical points. Its positive-degree groups vanish,
giving cup bound one, at most its number of points; a singleton has bound
one. Thus tied critical values need no artificial regular separator. Handle
the empty invariant set separately. The induction proves the count for
compact invariant gradient sets, so applies also to I_A and I_B without
requiring new isolating-pair data. This counts distinct critical points,
including arbitrarily degenerate ones; no perturbation is assumed to
preserve their number.

Combine this count with the injection to obtain the same r+1 lower bound
from every nonzero r-fold positive-degree product on P₀. Acceptance includes
`P₀=S¹`, its nonzero degree-one class and the resulting two-point bound for
any such regular product pair; arbitrary exit dimension K, including zero;
degenerate equilibria and tied critical values; and an infinite critical
set. This is the reusable finite-dimensional supplier for annulus-action
applications. Those applications must construct their actual pair, its
regular exit data and the product identification, and identify its critical
points with the fixed points being counted.

## M5. Morse–Bott normal bundles and attachments

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
patch the changes to a neighborhood of the zero section.
For a compact critical component and a compact isolated critical band, attach
the negative disc bundle, give the relative homotopy equivalence and identify
the resulting relative homology with H_(j−λ)(C;orientation(ν⁻)). Use Thom
local coefficients, or F₂; untwisted integral/rational coefficients require the
negative-bundle orientation. Include multiple critical components and prove
compatibility with regular-band deformation.

Consume [DGFloer Layer 1 item 3](../DGFloer/README.md)'s generic filtered-complex
`SpectralObject`, independently of its trajectory layers. Construct the
critical-band filtration and identify its spectral sequence, naturality
and finite convergence on compact M. Deduce Morse–Bott strong inequalities
with the shifted critical-component Betti polynomials and the correct negative-
orientation coefficients. Prove the ordinary Morse specialization is M2/M4.
Hamiltonian [ConvexityToric T2](../SymplecticGeometry/ConvexityToric/README.md) consumes this attachment theorem and supplies
complex negative bundles/equivariant perfection; RiemannianGeometry and HomotopySpheres path
applications supply their own critical components and Jacobi negative bundles.

## M6. Gradient convergence and exponential decay

Consume `TauCeti.Manifold.riemannianGradient`, DG's maximal smooth gradient
flow and native vector-space
`Morse/{GradientFlow,Convergence,Linearization,ExponentialConvergence}` estimates,
including `IsIntegralCurveOn.exists_tendsto_atTop`,
`exists_sub_le_mul_exp_atTop` and `exists_norm_sub_le_mul_exp_atTop` and their
atBot versions. Consume `Geometry/Manifold/IntegralCurve/GlobalFlow` and
`PseudoGradient/Flow`'s compact-manifold convergence. Extend the fixed-inner-
product estimates to variable Riemannian metric gradients, which need not
be adapted pseudo-gradients, and compact trapping inside noncompact manifolds.
For a forward
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

## References and course targets

- Milnor, *Morse Theory*, §§2–6 for local/deformation/CW/inequality proofs.
  Theorem4.1 and Remark1 distinguish the nondegenerate two-disc proof from
  the general degenerate statement. For M4.1's additional topological bridge,
  see Milnor, [*Sommes de variétés différentiables et structures différentiables
  des sphères*](https://numdam.org/articles/10.24033/bsmf.1538/), Bull. Soc.
  Math. France87 (1959), Theorem1(3) and Corollary1 (p. 442), and R. H. Rosen,
  *A weak form of the star conjecture for manifolds*, Notices Amer. Math.
  Soc.7 (1960), abstract570-28, p.380, Lemma1. The required construction is
  specified in M4.1 above.
- M. Brown, [*A proof of the generalized Schoenflies theorem*](https://www.ams.org/journals/bull/1960-66-02/S0002-9904-1960-10400-4/S0002-9904-1960-10400-4.pdf),
  Bull. Amer. Math. Soc.66 (1960) 74–76, Theorems 0–5; Theorem 5 (p. 76) is
  the bicollared Schoenflies theorem owned in M4.1.
- Cohen, Iga and Norbury, [Topics in Morse Theory](https://math.stanford.edu/~ralph/morsecourse/biglectures.pdf),
  classical part, for manifold normal forms, sublevels and cellular comparison.
- Thomas Mark's *Math240 Riemannian Geometry* lecture/homework notes,
  2001 lectures and Homework 11, catalogued separately in the course-source
  audit, supply the
  local/handle/CW/strong-inequality and Morse–Bott acceptance targets above.
  Their global “Morse” convention is handled by separate properness/compact-band
  hypotheses, matching native Tau Ceti's predicate.
