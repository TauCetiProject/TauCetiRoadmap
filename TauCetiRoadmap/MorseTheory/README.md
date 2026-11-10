# Morse functions, sublevel topology and Morse–Bott attachments

Develop the finite-dimensional topology of Morse and Morse–Bott functions:
intrinsic Hessians and indices, normal forms, genericity, deformation of
sublevels, handles and cells, proper exhaustions, strong inequalities, the
recognition of the sphere from a smooth function with two critical points of
arbitrary degeneracy, critical-submanifold attachments and compact-trapped
gradient convergence.
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
these regular-level cobordisms. Morse theory under the Palais–Smale condition
in place of properness (sequential compactness of almost-critical sequences,
deformation of noncompact critical-free bands on complete Riemannian
manifolds, and gradient convergence without compact trapping) is outside this
roadmap, and nothing here depends on it. Types are universe-polymorphic; for
singular homology put the coefficient field and the space in a common
universe, using universe lifts when needed.

Use actual Tau Ceti `IsManifoldNondegenerateCriticalPoint`, `IsMorse`,
`IsMorseOn` and `manifoldMorseIndex`, from
`Geometry/Manifold/Morse/{Basic,Index}`. The vector-space suppliers are
`Analysis/Calculus/Morse/{Basic,NormalForm,Generic}`, including
`IsNondegenerateCriticalPoint.exists_morse_chart` and the small linear-
perturbation theorem. Consume `MDifferentiableAt.mvfderiv_eq_fderiv_comp_extChartAt_symm`,
`manifoldMorseIndex_le_finrank`, the complementary-index theorem
`TauCeti.manifoldMorseIndex_neg_add_manifoldMorseIndex_eq_finrank` (in
`Geometry/Manifold/Morse/Index.lean`, for a nondegenerate Hessian),
`manifoldMorseIndex_comp_fst_add_comp_snd`, and `Morse/Sphere/{Basic,Prod}`.
Consume the manifold `TauCeti.MorseChart` and
`IsManifoldNondegenerateCriticalPoint.nonempty_morseChart` from
[Geometry/Manifold/Morse/Lemma](https://github.com/TauCetiProject/TauCeti/blob/e8375e4fdc90df4033f28291a72d5f64234a301a/TauCeti/Geometry/Manifold/Morse/Lemma.lean);
its quadratic equation carries a factor 1/2
and an unordered list of ±1 weights. M1 supplies arbitrary-model transport,
ordering/scaling and intrinsic-Hessian comparisons. The Morse-lemma,
pseudo-gradient, compact-sublevel, global-flow and Riemannian-gradient files
linked in this README are in the pinned Tau Ceti; the links cite them at
commit e8375e4f, and their declarations are consumed as stated there.
Suggested.lean uses only the pinned Morse Basic/Index, vector-space
NormalForm and Riesz-dual interfaces for its signatures.

The pinned Tau Ceti Morse library proves a large part of M1–M4 and M6. Each
section below names the pinned declarations that discharge its targets, with
their hypotheses; they are consumed by those names and not restated, and the
owned work of a section is what they leave. Where Suggested.lean restates
one of them, the pinned declaration is the one consumers use.

Own the single boundaryless-model transport on a named `def` type synonym
M′ carrying M's topology, with an explicitly supplied E-charted structure
and a constructed `IsManifold 𝓘(ℝ,E) ∞ M′` instance; do not install a second
global atlas on M. Mathlib's `[I.Boundaryless]`
gives `range I=univ` and `I.toHomeomorph:H≃ₜE`; it supplies neither
Hausdorffness nor second countability of M. For an H-valued chart c use
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
All arbitrary-model consumers use this transport. It is pinned
(`Geometry/Manifold/ModelTransport/{Boundaryless,Immersion}`,
`Geometry/Manifold/Morse/ModelTransport`): the `def` copy
`TauCeti.BoundarylessModel I M` of M with M's topology and the E-valued charts
I∘c, its `IsManifold 𝓘(ℝ,E) n` structure when M is a C^n manifold, the identity
diffeomorphism `TauCeti.BoundarylessModel.diffeomorph`, the preferred-chart,
extended-chart and maximal-atlas correspondences, the source- and target-side
`mfderiv` comparisons, the transport of immersions with a given complement and
of smooth embeddings, and the equality of critical sets, nondegeneracy, Morse
indices, `IsMorseOn`, `IsMorse` and adapted pseudo-gradients under the identity
map. General atlas transport is owned by
[ComplexManifolds Milestone 1](../ComplexManifolds/README.md#milestone-1-restriction-of-scalars-and-atlas-transport).
Use Mathlib `PartialDiffeomorph`, `IsProperMap`, `CWComplex`, `RelCWComplex`,
`ContinuousMap.HomotopyEquiv`, `ContinuousMap.HomotopyRel`,
`ContinuousMap.Nullhomotopic`, `Polynomial`, `Metric.sphere` and native singular
homology, `AlgebraicTopology.singularHomologyFunctor` with `ModuleCat k` and
coefficient module k; cohomology comes from AlgebraicTopology Stage 6. Smooth
partitions of unity are Mathlib's `SmoothPartitionOfUnity`, with
`SmoothPartitionOfUnity.exists_isSubordinate`: on a Hausdorff σ-compact smooth
manifold with a finite-dimensional model, a smooth partition of unity on a
closed set subordinate to any open cover of it. M4.1 uses
`Topology.IsEmbedding`, `TopologicalSpace.Opens`, the one-point
compactification `OnePoint` with `Homeomorph.onePointCongr`, and
`onePointEquivSphereOfFinrankEq`, which identifies the one-point
compactification of an m-dimensional real topological vector space with the
unit sphere of `EuclideanSpace ℝ ι` for an index type ι with m+1 elements; the
unit sphere of `EuclideanSpace ℝ (Fin (m+1))` is charted on
`EuclideanSpace ℝ (Fin m)` by `EuclideanSpace.instChartedSpaceSphere`.

[DG Layers 3,5,10,12](../DifferentialGeometry/README.md) supply flows, boundary-orientation interfaces,
partitions of unity, sharp finite-dimensional Sard, metrics and Hessians.
DG Layer 3 supplies maximal flows and smooth dependence. The DG §12.2
gradient, §12.3 Hessian and §5.1 boundary orientation are pinned:
`TauCeti.Manifold.mgradient`, `TauCeti.Manifold.inner_mgradient`,
`TauCeti.Manifold.contMDiff_mgradient` and
`TauCeti.Manifold.mgradient_eq_gradient`
(`Geometry/Manifold/Riemannian/Gradient/{Basic,NormedSpace}`),
`TauCeti.Manifold.hessian` (`Geometry/Manifold/Riemannian/Laplacian`) and
`TauCeti.boundaryOrientation_spec`
(`Geometry/Manifold/Boundary/InducedOrientation`).
[AlgebraicTopology Stages 2–8](../AlgebraicTopology/README.md) supply relative
chains, cofibrations, cellular/singular comparison, products, integral duality
and relative homotopy. M4’s arbitrary-function LS bound consumes the
[categorical-cover/cup-length supplement in AT Stage 6](../AlgebraicTopology/README.md#stage-6-cohomology-products-and-manifold-duality); that supplement uses
only foundational products and native homotopies, not Morse theory or
manifold duality. Its covers and unnormalized count are pinned as
`TauCeti.LSCategoricalCover` and `TauCeti.lsCategoryCount`
(`Topology/Homotopy/LusternikSchnirelmann`); M4's corollaries consume its cup
length `lsCupLength` and its bound: cup length plus one is at most the
unnormalized category count of a nonempty space, over every commutative
coefficient ring. [GT Layer 1](../GeometricTopology/README.md) supplies
normal/tubular geometry, collars, handle gluing and disc bundles.
[GeometricTopology §2.2](../GeometricTopology/README.md#22-the-generalized-schoenflies-theorem)
supplies Brown's generalized Schoenflies theorem (Brown 1960, Theorem 5,
p. 76): for n≥1 and an embedding of S^(n−1) in S^n bicollared in the sense of
the pinned `TauCeti.IsBicollar`, each of the two complementary domains has
closure homeomorphic to D^n, by a homeomorphism restricting to the given
parametrization on the boundary sphere. M4.1's two-open-cell lemma consumes it
with n=m>0 and uses only that the embedded sphere is carried onto ∂D^n. The
bicollar predicate is pinned (`Geometry/Manifold/LocallyFlat/Bicollar`): for
topological spaces N and M and a map f:N→M, `TauCeti.IsBicollar f b` says that
b:N×ℝ→M is an open embedding with b(x,0)=f(x) for every x, and
`TauCeti.IsBicollared f` that some such b exists; a bicollared map is an
embedding. The pinned Tau Ceti supplies local flatness (`IsLocallyFlat`, in
`Geometry/Manifold/LocallyFlat/Basic`) and Brown's codimension-one
bicollaring theorem (`brownBicollaring` in `LocallyFlat/Brown` and
`IsLocallyBicollaredWithSides.exists_isBicollar` in `LocallyFlat/TwoSided`),
and states the annulus conjecture (`AnnulusConjecture` in
`LocallyFlat/Annulus`) without proving it; GT Layer 2 keeps the annulus
theorem. [CharacteristicClasses C2](../CharacteristicClasses/README.md)
supplies ordinary Thom classes and their local orientation coefficients.

M4 and M4.1 consume three further pinned theorems. Reeb's theorem for Morse
functions, `TauCeti.IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two`
(`Geometry/Manifold/Morse/Reeb`): a compact Hausdorff manifold with a
boundaryless model on a finite-dimensional space E, carrying a Morse function
with exactly two critical points, is homeomorphic to the unit sphere of
`EuclideanSpace ℝ (Fin (dim E+1))`, with no connectedness or dimension
hypothesis; its proof identifies small sublevels at the two nondegenerate
extrema with discs by the Morse lemma. The Jordan–Brouwer separation theorem
`natCard_zerothHomotopy_sphere_compl_range_eq_two`
(`AlgebraicTopology/Singular/JordanBrouwer`), stated in M4.1. The two-disc
gluing theorem `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall`
(`Analysis/InnerProductSpace/Hemisphere`): a space covered by two closed sets,
each homeomorphic to the closed unit ball of an m-dimensional real inner
product space by a homeomorphism under which the intersection of the two sets
corresponds to the unit sphere, is homeomorphic to the unit sphere of every
(m+1)-dimensional real inner product space; the boundary gluing is arbitrary
and is extended radially (`Homeomorph.radialExtension`).

This roadmap owns ordinary finite Morse deformation/attachment and their
abstract Morse–Bott extension. RiemannianGeometry R3 owns the broken-geodesic
vertex carrier, Jacobi/index comparison and path-space limit, consuming this
core. The symmetric-space and Bott applications use the same broken-path
carrier and the attachments here.
[HeegaardFloer Lane M](../HeegaardFloer/README.md) owns stable/unstable
manifolds, Morse–Smale trajectory spaces, compactification/gluing, Morse
homology and its singular comparison. It consumes the finite Morse core here;
this roadmap does not construct a second trajectory complex.

At a critical point the Hessian is d²f, with no factor 1/2. A normalized Morse
chart has `f=f(p)−Σ_(i<λ)y_i²+Σ_(i≥λ)y_i²`, hence Hessian diagonal ±2.
λ is the negative inertia index. Gradient descent uses −grad f. Set
`M_a={x | f(x)≤a}`; regular-level deformation fixes M_a pointwise. Distances
for gradient convergence are the induced Riemannian distance
`Manifold.riemannianEDist` of the chosen smooth positive-definite metric, the
infimum of the lengths of C¹ paths for the same tangent-fibre norms, taken
componentwise: it is infinite between components and needs no global metric
instance. Different
metrics change gradients and flow parametrizations but not the Hessian/index
at a critical point or the sublevel homotopy conclusions.

## M1. Critical Hessians, indices and usable normal forms

Define the critical set as `{x | mvfderiv I f x = 0}` and consume its native
preferred-chart comparison. The critical set and its counts are pinned
(`Geometry/Manifold/Morse/CriticalPoints`), defined for any model and any
function: `TauCeti.criticalPoints I f`, with this body,
`TauCeti.criticalCount I f j` (critical points of Morse index j) and
`TauCeti.totalCriticalCount I f`, both in ℕ∞, with
`TauCeti.mem_criticalPoints_iff_mfderiv_eq_zero`; the critical set of a C¹
function is closed (`TauCeti.isClosed_criticalPoints`). These definitions need
only charted calculus, and smoothness and the standing hypotheses accompany
their theorems; Suggested.lean's `criticalPoints`, `criticalCount` and
`totalCriticalCount` have the same bodies. Define the critical Hessian as a symmetric
continuous bilinear form on `TangentSpace I x`, transported from d²f in the
preferred extended chart under the hypothesis df_x=0. Prove it is independent
of coordinates and connection, and identify
it with DG's Hessian for every C¹ metric. Prove symmetry, change of
coordinates by congruence, inertia invariance, λ≤dim M, the complementary
index λ(f)+λ(−f)=dim M at a nondegenerate critical point (smoothness and
criticality without nondegeneracy do not imply it), and direct-sum/product
additivity. Keep the noncritical Hessian's
connection dependence explicit; no statement here uses the Hessian of a metric
away from critical points. Give the tangent-quadratic-form and matrix
comparisons, restrictions to subspaces and positivity/negativity tests. The
Hessian is pinned as `TauCeti.criticalHessian`
(`Geometry/Manifold/Morse/Hessian`, `Geometry/Manifold/Riemannian/CriticalHessian`):
symmetric, with its matrix in a basis, change of basis by congruence and
inertia (the Morse index is its negative inertia index), equal at a critical
point of a C² function to the Hessian in any chart of the maximal atlas
(`TauCeti.criticalHessian_apply_eq_of_mem_maximalAtlas`) and to the Hessian of
any C¹ metric (`TauCeti.Manifold.hessian_eq_criticalHessian`).

Extend the native manifold Morse chart to an actual partial diffeomorphism
for every boundaryless model, with a Euclidean target and center 0. Compose its
linear coordinate map with an index-ordering permutation and division by √2,
using `exists_hessianQuadraticForm_equivalent_weightedSumSquares`; prove both smooth maps and the
normalized sum-of-squares equation on the whole source. This chart is pinned as
`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_normalized_morseChart`
(`Geometry/Manifold/Morse/NormalizedChart`; Cohen–Iga–Norbury, Theorem 5.3,
pp. 36–37): for f smooth near a nondegenerate critical point x, a partial
diffeomorphism ψ onto an open subset of `EuclideanSpace ℝ (Fin (dim E))` with
ψ x=0 and `f y=f x−Σ_(i<λ)(ψ y)_i²+Σ_(i≥λ)(ψ y)_i²` on its whole source, λ the
Morse index. Derive isolation,
strict local minima/maxima, the two-dimensional saddle model and finite critical
sets on compact subsets for a global Morse function. Consume native
`IsMorse.finite_setOf_mfderiv_eq_zero` and `MorseChart.mfderiv_eq_zero_iff`
from [PseudoGradient/Existence](https://github.com/TauCetiProject/TauCeti/blob/e8375e4fdc90df4033f28291a72d5f64234a301a/TauCeti/Geometry/Manifold/Morse/PseudoGradient/Existence.lean).
The compact finiteness theorem uses the standard model `𝓘(ℝ,E)`; consume
it directly. Extend the local chart argument to compact subsets and apply
the shared arbitrary-model transport, retaining the native `mfderiv` zero
locus and its comparison with the critical set’s vector-valued `mvfderiv`.
The result is pinned as `TauCeti.IsMorse.finite_criticalPoints_inter`
(Cohen–Iga–Norbury, Corollary 5.4, p. 38), for a C¹ manifold structure with
no Hausdorff or dimension hypothesis. Define chartwise C^k
seminorm neighborhoods on fixed compact coordinate sets before using them.
The compact chart C^k seminorm is pinned as `ContMDiffMap.chartCkSeminorm`
(`Geometry/Manifold/ContMDiffMap/Chart/Seminorm`): the maximum through order k
of the supremum norms of coordinate derivatives on a compact coordinate set,
monotone in the set and in k. Owned here is its comparison under a fixed
smooth chart change: for a smooth transition map τ between two extended
charts, a compact coordinate set K in the source of τ and k∈ℕ, there is a
constant C, depending only on τ, K and k, such that the C^k seminorm on K of
g∘τ is at most C times the C^k seminorm on τ(K) of g, for every C^k function
g; hence finite intersections of compact chart C^k balls on different charts
are neighbourhoods of the same kind. It follows from Mathlib's bound
`norm_iteratedFDerivWithin_comp_le` for iterated derivatives of a composition.
Prove persistence of
nondegenerate critical points under small C² perturbations on fixed compact
neighborhoods, with the implicit-function critical-point continuation, index
and value dependence. These are pinned (`Geometry/Manifold/Morse/{Persistence,CriticalPointContinuation}`):
C² persistence with the Morse index
(`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_criticalPoint_perturbation_manifoldMorseIndex_eq`)
and the C² continuation branch of a C³ family
(`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_contMDiffAt_criticalPoint_continuation`),
from the implicit-function theorem applied to the coordinate differential,
whose derivative in the point variable is the invertible Hessian. Construct critical counts with extended natural/cardinal
values first; use finite natural counts only after the relevant compactness
proof, avoiding junk values on infinite critical sets.

**Checks.**
- For the self-model ℝ², both model transports are the identity and df=(1,0)
  stays (1,0); the half-line model has range [0,∞), not ℝ, and the
  boundaryless hypothesis excludes this transport.
- On ℝ², f=−x²+y² has Hessian diag(−2,2), index 1 and one critical point; the
  indices of f and −f are both 1 and add to the dimension 2. For x²+y² the
  indices are 0 and 2.
- A constant on S¹ has infinitely many critical points: its extended total is
  ∞, not 0.
- On a point the empty Hessian is nondegenerate, of index 0 and critical count
  1; on the empty manifold the count is 0.
- For f=0 on ℝ both indices are 0 and their sum is 0≠1; for f=x² they are 0
  and 1, with sum 1, so the complementary-index identity needs nondegeneracy.
- f=x on ℝ has no critical points, so the Morse condition implies neither
  properness nor a lower bound.
- f=x² has Hessian 2; a normalized chart has f=y², rather than y²/2.
- f_t=x³−tx has no critical points for t<0 and two for t>0; nondegenerate
  branch continuation does not cross t=0.
- For h(x)=δx², δ>0, on [−1,1], the order-0, order-1 and order-2 suprema are
  δ, 2δ and 2δ; value control alone misses derivative bounds.
- Under the chart change x=τ(y)=y/2 with K=[−2,2] and τ(K)=[−1,1], g(x)=x²
  becomes y²/4, with order-0, order-1 and order-2 suprema 1, 1 and 1/2 on K,
  against 1, 2 and 2 for g on τ(K): the m-th derivative scales by (1/2)^m, so
  C=1 suffices for every k here, while the reverse change y=2x needs C=2^k,
  which depends on k.

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

The level atlas and its faces are pinned, with no compactness hypothesis and
no condition on critical points away from the level
(`Geometry/Manifold/RegularValue/{Level,ManifoldLevel}`,
`Geometry/Manifold/RegularValue/Scalar/{Submersion,Sublevel}`): the
section-zero level atlas `TauCeti.regularLevelChartedSpace` with its
smooth-embedding and tangent-kernel laws; the regular-fibre theorem
`TauCeti.exists_regularFiber_smoothEmbedding` (Lee, *Introduction to Smooth
Manifolds*, 2nd ed., Corollary 5.14 and Proposition 5.38), which for a C^m map,
m≥1, into a finite-dimensional manifold and a regular interior value c gives
an atlas on `{x // f x = c}` modelled on `Fin (dim E − dim F) → ℝ` for which
the inclusion is a smooth embedding with tangent image ker df, with no
separation or countability hypothesis, and for F=ℝ with model `𝓘(ℝ)` (every
value interior, regularity being surjectivity of `mfderiv I 𝓘(ℝ) f x` on the
level) has model `Fin (dim E − 1) → ℝ`; the scalar submersion chart
`TauCeti.scalarSubmersionChartAt` with
`TauCeti.IsRegularPoint.isSubmersionAtOfComplement`; and, for dim E=n+1, the
half-space atlases `TauCeti.scalarRegularSublevelChartedSpace` and
`TauCeti.scalarRegularBandChartedSpace`, with
`TauCeti.isManifold_scalarRegularSublevel`,
`TauCeti.isManifold_scalarRegularBand`, the tangential slots of the level chart
reindexed by `Fin.cast`
(`TauCeti.scalarRegularSublevelChartAt_apply_succ_eq_regularLevelChartAt`), and
`TauCeti.boundary_scalarRegularSublevel` and
`TauCeti.boundary_scalarRegularBand` identifying the manifold boundary with the
level, or the two levels, as subsets. The owned work of the next paragraphs
beyond these is the typed boundary/level diffeomorphisms and the
co-orientation signs.

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
including their derivative comparison laws. These comparisons are pinned
(`Geometry/Manifold/Immersion/Diffeomorph`, `Geometry/Manifold/RegularValue/Atlas`):
`ChartedSpace.exists_diffeomorph_apply_eq_self`, two atlases on one space for
which the same map into a common manifold is an immersion are diffeomorphic by
the identity, with no dimension or separation hypothesis;
`TauCeti.RegularFiber.exists_diffeomorph_apply_eq_self`, the regular-fibre
atlases built from two target charts at the value agree by the identity; and
`TauCeti.exists_diffeomorph_regularFiber_regularLevel_apply_eq_self`, for a
vector-space target the regular-fibre atlas and the level atlas agree by the
identity.
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

**Checks.**
- For f(x,y)=x at level 0 the level is ℝ, the inclusion derivative is
  v↦(0,v), and its range is ker(df)=span(e₂).
- For f=x² at level 0, df=0; the singleton level cannot satisfy the
  regular-level embedding conclusion in dimension 1 with the required
  derivative-kernel equality.
- In dimension 0 every attained value is critical; a regular level is empty
  and the natural dimension subtraction yields 0.
- On [a,b]⊂ℝ with f=x, the outgoing endpoint has sign + and the incoming
  endpoint sign −, agreeing with the outward-first orientation.
- For f=x²+y² on ℝ² and a=1, n=1: the boundary of M_1 is the unit circle,
  modelled on `EuclideanSpace ℝ (Fin 1)`, and the level on `Fin 1→ℝ`; at (1,0)
  the face chart has inward coordinate 1−f=0 and the typed diffeomorphism is
  the identity of points, whereas a model `EuclideanSpace ℝ (Fin 2)` would have
  the dimension of M_1 itself.

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
These are pinned (`Topology/Order/Sublevel`,
`Geometry/Manifold/Morse/{Deformation,Sublevel}`):
`TauCeti.exists_sublevelDeformation` and `TauCeti.exists_sublevelHomotopyEquiv`
(Milnor, *Morse Theory*, Theorem 3.1, p. 12, which assumes compactness of the
band rather than of M): on a Hausdorff manifold, for smooth f, a≤b and a
compact band f⁻¹[a,b] containing no critical point, a retraction of {f≤b} onto
{f≤a} and a homotopy from its composite with the inclusion to the identity rel
{f≤a}, with no compactness of M and with a≤b in place of a<b;
`TauCeti.exists_sublevelHomeomorph`, `TauCeti.exists_diffeomorph_sublevel` and
`TauCeti.exists_bandHomeomorph`, the homeomorphism, ambient diffeomorphism and
product forms; the inclusion `TauCeti.sublevelInclusion` of sublevels of any
function into a preorder, whose identity at a=b and composition through an
intermediate level are its pointwise formula; and the disc sublevels
`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_sublevel_homeomorph_closedBall`
(at a unique global minimum that is a nondegenerate critical point, with one
compact sublevel strictly above it, all small sublevels are closed discs, the
radius squared recording the value),
`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_sublevel_component_homeomorph_closedBall`
(on a Hausdorff manifold, the component through a nondegenerate local minimum
of a small sublevel is a closed disc) and
`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_local_superlevel_homeomorph_closedBall`
(the same for small superlevels at an index-dim E point, inside a
neighbourhood).
Prove restriction to smaller regular bands commutes up to relative homotopy
and the retraction homotopy fixes M_a throughout: for a≤a′≤b′≤b with
f⁻¹[a,b] compact and free of critical points, the restriction r to M_(b′) of
the retraction of M_b onto M_a and the composite r′ of the retractions of
M_(b′) onto M_(a′) and of M_(a′) onto M_a are homotopic rel M_a. Both are
retractions onto M_a, and i∘r′ is homotopic to the identity of M_(b′) rel M_a
for the inclusion i of M_a; hence r=r∘id≃r∘i∘r′=r′ rel M_a.
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
The normalization is that of `TauCeti.IsAdaptedPseudoGradient`: in a Morse
chart `TauCeti.MorseChart` with coordinates z, weights w_i=±1 and
`f=f(x)+(1/2)Σ_i w_i z_i²`, the field reads `z↦(−w_i z_i)_i` and its flow is
`z_i↦e^(−w_i t)z_i`; in the normalized coordinates y=z/√2 of the conventions
above the field reads (u,−v), not (2u,−2v).
Native `Analysis/Calculus/Morse/CompactSublevel` gives vector-space orbit/
trajectory compactness, not a cell-attachment or band deformation. Extend
compact-manifold pseudo-gradient existence to a neighborhood of a specified
compact level band by a finite cover, with the field unchanged on chosen
smaller critical charts. This is pinned as the compact-manifold existence
`TauCeti.BoundarylessModel.IsMorse.exists_isAdaptedPseudoGradient` and the
near-compact form `TauCeti.IsMorse.exists_contMDiff_pseudoGradientOn_nhds`: on
a Hausdorff σ-compact self-modelled manifold, a smooth field near any compact
K, strictly decreasing f off the critical set and equal to the linear
Morse-chart field near the critical points of K. For each compact critical-free band use a positive
smooth rescaling giving df(X)=−1; compare the resulting descending
deformation with the normalized-gradient construction, including hitting
times and the fixed lower sublevel: both reach M_a from a point x of the band
at time f(x)−a, both fix M_a, and they are homotopic rel M_a by the
restriction statement above.

Across one critical value with finitely many nondegenerate points and compact
band, attach one index-λ handle D^λ×D^(m−λ) at each point using disjoint M1
charts. The handle conclusion is a homeomorphism with the topological handle
adjunction along ∂D^λ×D^(m−λ), respecting the regular boundary away from
the attachment; no diffeomorphism of a cornered handle space is asserted
(Nicolaescu, *An Invitation to Morse Theory*, Theorem 2.2.3, pp. 38–42, for
one critical point, and Remark 2.2.5, p. 42, for several on one level; there f
is exhaustive, and the proof, after Milnor §3, uses only a compact band
f⁻¹[c−ε,c+ε] with no other critical point and the deformation across a
compact critical-free band for the modified function).
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
whole-dimension cases. The homotopy cell attachment is pinned as
`TauCeti.IsMorse.exists_morseCellAttachment_deformation`, with its attaching
and characteristic maps (`Geometry/Manifold/Morse/Cell/Map`) and the comparison
from the TopCat pushout of the lower sublevel and the cells to M_(c+ε) as the
inclusion of a strong deformation retract; its charts come from
`TauCeti.IsMorse.exists_admissible_morseCharts`. The handle form and the
comparisons below are owned here.

**Checks.**
- The point x=1 belongs to the closed sublevel at level 1 and stays present at
  level 4; an open-sublevel convention would exclude it.
- For f=x² on ℝ and 0<a<b, the retraction sends x outside [−√a,√a] to
  sign(x)√a and fixes that interval; for a<a′<b′<b a point x∈[√a′,√b′] goes to
  √a′ and then to √a, which is where the retraction for [a,b] sends it.
- For f=x², a Morse chart at 0 in the Tau Ceti normalization is z=√2x, with
  f=z²/2 and weight 1; an adapted pseudo-gradient reads z′=−z there, so x′=−x,
  with flow x₀e^(−t) and df(X)=−2x². The Euclidean −grad f=−2x reads z′=−2z
  and is not adapted in that chart, while for the metric 2dx², Euclidean in z,
  −grad f=−x is.
- For f=−u²+v² the Morse chart z=√2(u,v) has weights (−1,1) and the adapted
  field reads (z₁,−z₂), with flow (e^t z₁,e^(−t) z₂); the field (−z₁,−z₂) has
  df=z₁²−z₂², which increases f on the u-axis.
- For f=x² on the band [1,4], the field with df(X)=−1 is X=−1/(2x) for x>0,
  and from x=2 it reaches x=1 at time 3=f(2)−1; here it equals the normalized
  gradient −grad f/|grad f|².
- In dimension 0 a critical-free band is empty; both sublevels and the
  inclusion are identical.
- At index 0 the attaching sphere is empty and the handle adds one component.

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
negative-coordinate block; A preserves Q(u,v)=−|u|²+|v|² and A_uu is
invertible, by the pinned `PartialDiffeomorph.norm_sq_sub_fderiv_transition`
and `PartialDiffeomorph.isInvertible_fst_fderiv_transition_inl`
(`Geometry/Manifold/Morse/ChartTransition`: for two C¹ split Morse charts
centred at one critical point, with values in a product E_u×E_s of inner
product spaces and f=f(x)−‖u‖²+‖v‖² on each source, the derivative at 0 of
their transition preserves ‖u‖²−‖v‖², and for E_u finite-dimensional its
negative-to-negative block is invertible), after splitting the coordinates by
`EuclideanSpace.sumComplEquivProd`. Choose 0<δ<√ε and L with ‖A‖≤L,
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

Each critical-level stage is the pinned
`TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation`: for a Morse
function on a Hausdorff manifold and a compact band f⁻¹[c−δ,c+δ], some
0<ε≤δ and a finite relative CW complex over {f≤c−ε}, inside {f≤c+ε} and a
strong deformation retract of it, whose m-cells correspond to the critical
points of index m on the level c. The regular-level sequence of a proper Morse
function bounded below is the pinned
`TauCeti.IsMorse.exists_regular_sublevel_exhaustion`. This roadmap owns their
iteration to the global model.
Iterate finite critical levels to construct compatible relative CW models for
sublevel pairs. For a proper bounded-below Morse function, choose an exhausting
sequence of regular levels with finite critical sets at each stage, prove the
cofibration/compatibility statements and pass to a genuine CW complex homotopy
equivalent to M with one λ-cell per critical point: a Hausdorff native CW
complex X, a homotopy equivalence M≃X and, for every j, an equivalence between
the j-cell type of X and the subtype of critical points of index j, so that
the cell counts agree in ℕ∞ (`exists_cwComplex_homotopyEquiv`; Milnor,
*Morse Theory*, Theorem 3.5, p. 20). Consume Mathlib TopCat
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
boundary identified by the opposite function and complementary indices
(Cohen–Iga–Norbury, Theorem 5.7, pp. 40–41, for compact M).

**Checks.**
- Height on S² gives one 0-cell and one 2-cell.
- The circle height has two descending arcs at its maximum; both attach to the
  same minimum component and give H₁(S¹;ℤ)=ℤ.
- f=x² on ℝ gives one 0-cell and a contractible CW model.
- The empty manifold gives an empty CW complex and empty cell types in every
  degree, not a distinguished 0-cell.
- A countable discrete manifold with proper values 0,1,2,… gives countably many
  0-cells; a finite CW model is not asserted.

## M3. Approximation and proper Morse exhaustions

On native smooth maps `C^∞⟮I,M;ℝ⟯`, define strong C^k neighborhoods by a
locally finite compact chart family and a positive tolerance on each member,
bounding every coordinate derivative of order≤k. Define the strong smooth
topology as generated by these neighborhoods for all finite k, without
unbounded derivative orders varying per chart. Prove chart-family independence
and agreement with compact C^k seminorm neighborhoods when M is compact.
This topology is pinned as `ContMDiffMap.manifoldStrongWhitneyTopology`
(`Geometry/Manifold/ContMDiffMap/Chart/Strong`), generated by the strong C^k
neighbourhoods `ContMDiffMap.StrongCkControl.ball` of all finite orders
(Hirsch, *Differential Topology*, Chapter 2, §1). The weak topology
`ContMDiffMap.manifoldWeakWhitneyTopology` is generated by conditions on the
coordinate derivatives of each finite order over compact chart sets; the
strong topology is finer
(`ContMDiffMap.manifoldStrongWhitneyTopology_le_manifoldWeakWhitneyTopology`)
and agrees with it on a compact manifold
(`ContMDiffMap.manifoldStrongWhitneyTopology_eq_manifoldWeakWhitneyTopology`).
Owned here are the restriction and refinement laws of the topology.
Restriction from the strong topology of M to any open submanifold U is
continuous into the weak topology of U (Hirsch, Chapter 2, §1, the weak C^k
topology for every finite k): each compact chart set of U is one of M, on which
the coordinate derivatives of a function and of its restriction agree.
Restriction is continuous for the strong topologies when the open inclusion is
proper, equivalently clopen here: a locally finite compact family in the
submanifold is then locally finite in M. Positive tolerance refinement and
finite intersections give neighbourhoods of the same kind, independently of
the compact chart cover, using M1's chart-change comparison of compact
seminorms.
Prove every smooth function can be approximated by Morse functions in this
topology; this is pinned as `TauCeti.dense_setOf_isMorse_manifoldStrongWhitney`
(`Geometry/Manifold/Morse/Generic/Strong`), for a Hausdorff σ-compact manifold
(Hirsch, Chapter 6, Theorem 1.2). A second-countable manifold with a
finite-dimensional model is locally compact, hence σ-compact. Use native local
linear perturbations and DG Sard, multiply them by cutoffs, and run a compact
exhaustion construction. Choose perturbations with summable C^k bounds on each
fixed compact set and with tails preserving earlier C² nondegeneracy. Prove
smooth convergence, persistence on every exhaustion interior, and the prescribed
fine error bounds for every prescribed finite-order neighborhood. This gives the global theorem without an unstated Baire
space or transversality theorem on a function space.

For a proper bounded-below input preserve those properties by a global C⁰
error less than 1; this is the pinned
`ContMDiffMap.exists_isMorse_isProperMap_mem_ball`, a proper Morse g within
distance 1 of a proper f in every strong neighbourhood, so that a lower bound
of f gives one of g. Prove existence of a smooth proper bounded-below exhaustion
on every manifold here using a compact exhaustion and a locally finite smooth
partition of unity, then its Morse approximation; the resulting proper Morse
function bounded below is the pinned
`TauCeti.exists_isMorse_isProperMap_bddBelow`, for a Hausdorff σ-compact
manifold with a boundaryless finite-dimensional model (Milnor, *Morse Theory*,
Corollary 6.7, p. 36). Give relative approximation
which fixes a neighborhood of a prescribed closed set where the function is
already Morse, with compact-support control for local perturbations. It is the
pinned `ContMDiffMap.exists_isMorse_mem_ball_sub_compl`: for a smooth f, a
strong C^k neighbourhood of f, a continuous positive tolerance ε, and a closed
set C inside an open set V on which f is Morse, a Morse g in that
neighbourhood with |g−f|<ε everywhere and g−f supported off C.
Compact-support control concerns each local perturbation, not the global
difference g−f on a noncompact manifold. Include
M1's continuous/smooth finite parameter dependence of nondegenerate critical
branches; do not claim every parameter value of a generic family is Morse
through birth-death events. General exhaustion existence here is separate
from GeometricTopology Layer1's squared-distance exhaustion for a given closed embedding.

**Checks.**
- On a point all positive-order derivatives are 0, so the topology is the
  ordinary topology on its value ℝ.
- On compact S¹ a finite chart family suffices; a tolerance ε bounds the
  zeroth derivative by ε as well as derivatives through k.
- On ℝ a neighbourhood with tolerance e^(−x²) excludes every nonzero constant
  perturbation, unlike a compact-open neighbourhood controlling only [−1,1].
- Let ψ be compactly supported on ℝ, with 0≤ψ≤1 and ψ=1 near 0. Then δψ tends
  strongly to 0 on ℝ as δ→0, but its restriction to (0,1) fails the
  neighbourhood |g(x)|<x for every δ>0: choose 0<x<δ where ψ=1. On
  [a,b]⊂(0,1), δ<a passes that value bound.
- For the clopen summand ℝ in ℝ⊔ℝ, any locally finite compact chart family
  remains locally finite in the ambient disjoint union; its tolerances extend
  by arbitrary positive tolerances on the other summand.
- On ℝ, x² is Morse, proper and bounded below by 0; a C⁰ perturbation of size
  <1 is bounded below by −1 and remains proper, while the unbounded
  perturbation −x² destroys the exhaustion.
- On the empty manifold the unique function is proper and bounded below, and
  is Morse vacuously.
- On a countable discrete manifold, f(n)=n is proper with index-0 critical
  points; the constant function is not proper there.

## M4. Strong inequalities and topology tests

For compact M, a Morse function f and a field k let c_j be the finite count of index-j critical
points and b_j=dim_k H_j(M;k), using actual singular homology. From the cellular
complex of M2 prove

`Σ c_j t^j = Σ b_j t^j + (1+t)Q(t)`, with Q∈ℕ[t].

This is `morse_inequalities`, stated coefficientwise in ℕ∞ with `bettiNumber`
the dimension of the singular homology of M with coefficients in k, a field
in M's universe; its finite left side is part of the claim. The polynomial
runs through degree dim M (Cohen–Iga–Norbury, Corollary 5.11 and its proof,
p. 42).

The weak and strong alternating inequalities, Euler's equality and the
finite-dimensionality of homology are pinned
(`Geometry/Manifold/Morse/Inequalities`): for a Morse function on a compact
Hausdorff manifold M, a division ring k and a finite k-module V,
finite-dimensionality of `H_n(M;V)` in every degree
(`TauCeti.IsMorse.finite_singularHomology`), the weak inequalities
`TauCeti.IsMorse.finrank_singularHomology_le`, the strong alternating
inequalities
`TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_le` and
Euler's equality
`TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_eq` for
n≥dim M, with counts `(TauCeti.criticalCount I f i).toNat`, together with
their forms for the sublevel pair of a compact band between regular values
(`TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_sublevelPair_le`
and its companions). From them the polynomial identity follows by partial
sums: with S_n(x)=Σ_(i≤n)(−1)^(n−i)x_i put q_n=S_n(c)−S_n(b), which is ≥0 by the
strong inequality and 0 for n≥dim M by Euler's equality; since
S_n(x)+S_(n−1)(x)=x_n, c_j−b_j=q_j+q_(j−1), so Q=Σ_j q_j t^j.

Identify Q's coefficients with the ranks of adjacent boundary maps; derive
all strong alternating inequalities, the weak inequalities, Euler equality
and total-critical-point lower bounds. Weak inequalities plus Euler equality
alone do not prove nonnegative coefficients of Q. Extend the statements to
regular sublevel/cobordism pairs and finite critical-band intervals, with the
relative homology maps visible. The rank description is the pinned CW identity
`TauCeti.sum_range_monomial_natCard_cell_mul_finrank_eq_of_cwComplex`
(`AlgebraicTopology/Cellular/EulerCharacteristic/MorseInequalities`): for a CW
complex C in a Hausdorff space with finitely many cells through degree n and
none in degree n+1, and a finite module V over a division ring k in the
universe of the space, `Σ_(i≤n) c_i·dim V·t^i = Σ_(i≤n) b_i t^i + (1+t)Q` in
ℕ[t], with c_i the number of i-cells, b_i the dimension of `H_i(C;V)` and the
coefficient of t^i in Q the rank of the cellular differential from degree i+1
to degree i for i<n, and 0 otherwise. Apply it with V=k to the finite CW model
of M2, which has one j-cell per critical point of index j and no cells above
dim M, and use homotopy invariance of singular homology. Its relative form
`TauCeti.sum_range_monomial_natCard_cell_mul_finrank_eq`, applied to the
relative models of M2, gives the identity for regular sublevel and cobordism
pairs and finite critical-band intervals. For finite CW complexes use
`TauCeti.finite_singularHomology_of_cwComplex` and
`TauCeti.finsum_finrank_singularHomology_of_finite_cwComplex`
(`AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean`).

Prove subgroups of free abelian groups of arbitrary rank are free, using a
well-order filtration and compatible basis extension over successive rank-one
quotients; apply it to the top cellular kernel, including countably many cells.
This is pinned as `Submodule.free_of_isPrincipalIdealRing`
(`LinearAlgebra/FreeModule/PID`): every submodule of a free module over a
principal ideal ring without zero divisors is free, in every rank.
Thus top cellular homology of a d-dimensional CW model is free abelian and
cohomology above d vanishes by AT Stage 6.1's integral UCT. Do not infer that degree-d integral
cohomology is torsion-free. Apply the proper-index≤d version of M2 to obtain
those conclusions for noncompact M.

`bettiNumber k X j` is defined, for a field k and a topological space X in the
universe of k, as the dimension over k of the j-th singular homology of X with
coefficients in k. Its API:
- For a homotopy equivalence X≃Y between spaces in the universe of k,
  `bettiNumber k X j = bettiNumber k Y j` for every j, by homotopy invariance
  of singular homology.
- For a compact boundaryless manifold M carrying a Morse function, `H_j(M;k)`
  is finite-dimensional in every degree
  (`TauCeti.IsMorse.finite_singularHomology`), so `bettiNumber k M j` is its
  dimension, and it is 0 for j>dim M by the weak inequality, since there are no
  critical points of index above dim M; for a finite CW complex the finiteness
  is `TauCeti.finite_singularHomology_of_cwComplex`.
- When `H_j(X;k)` is infinite-dimensional, `bettiNumber k X j = 0`, Mathlib's
  convention for `Module.finrank`; every statement here that reads b_j as a
  dimension carries compactness or finiteness of the CW model.
- The value depends on k: for RP² and j=1 it is 0 over ℚ and 1 over 𝔽₂.

**Checks.**
- On S², C=B=1+t² and Q=0 over every field.
- On RP² over ℚ, C=1+t+t², B=1, Q=t; over 𝔽₂, B=C and Q=0. With cells
  (1,1,1) the cellular differentials over ℚ are d₁=0 and d₂=2, of ranks 0 and
  1, so the rank description gives Q=0+1·t=t.
- For the empty manifold C=B=Q=0; for r isolated points C=B=r and Q=0.
- The candidate counts c=(2,0,0,2) and b=(1,0,0,1) satisfy the weak
  inequalities and have equal alternating sums 0, but the degree-1 strong
  inequality reads −2≥−1, which fails.
- On a point the Betti number is 1 in degree 0 and 0 in every positive degree,
  over every field.
- For ℕ with the discrete topology, H₀ is a direct sum of countably many copies
  of k, which is infinite-dimensional, so the dimension-valued Betti number in
  degree 0 is the junk value 0 although there are infinitely many path
  components; a cardinal-valued count would give ℵ₀.
- S¹ and ℝ²∖{0} are homotopy equivalent and both have Betti number 1 in degree
  1; the closed disc, homotopy equivalent to a point, has 0 there.

**Arbitrary-function Lusternik–Schnirelmann inequality.** Consume
[AlgebraicTopology Stage 6’s categorical covers and Lusternik–Schnirelmann bounds](../AlgebraicTopology/README.md#stage-6-cohomology-products-and-manifold-duality), with its
same `LSCategoricalCover`, `lsCategoryCount`, `normalizedLSCategory` and
`lsCupLength` carriers. Here prove the critical-point bound for **every
smooth real-valued f on a compact boundaryless finite-dimensional smooth
Hausdorff second-countable manifold M**, allowing arbitrary critical
point degeneracy. Use the native manifold derivative zero locus; compare
`mfderiv I 𝓘(ℝ) f` with the vector-valued `mvfderiv I f` used by
`criticalPoints`. Both give the same critical set for these smooth data.
Set `totalCriticalCount f=(criticalPoints f).encard : ℕ∞`. Prove

`lsCategoryCount M M≤totalCriticalCount f`

(Takens, *The minimal number of critical points of a function on a compact
manifold and the Lusternik-Schnirelman category*, Invent. Math. 6 (1968),
Introduction, p. 198, where the inequality for closed manifolds is attributed
to Lusternik and Schnirelmann and the unnormalized category L.S.(X) is
defined by open covers by sets contractible in X; Weber, *Conley pairs in
geometry – Lusternik–Schnirelmann theory and more*, author version,
Theorem 1.1, p. 2, with its finite-cover proof on pp. 2–3, where the category
is the number of categorical open sets, hence equals the unnormalized count
of M for nonempty M; the empty case is 0≤0).

This bound is pinned as `TauCeti.lsCategoryCount_univ_le_totalCriticalCount`
(`Geometry/Manifold/Morse/LusternikSchnirelmann`), stating
`TauCeti.lsCategoryCount M univ ≤ TauCeti.totalCriticalCount I f` for every
smooth f on a compact Hausdorff manifold, with no nondegeneracy. When f has
finitely many critical points, a categorical cover of M by exactly that many
open sets follows from it with `TauCeti.lsCategoryCount_le_iff` and padding a
smaller cover (`TauCeti.LSCategoricalCover.pad`, which needs M nonempty; for
empty M the empty cover serves).

For nonempty connected M this gives
`#Crit(f)≥cat(M)+1≥cupLength(M;R)+1`, with cat(point)=0 and R any
commutative coefficient ring. For every nonempty M, connected or not, and
every commutative coefficient ring R,
`lsCupLength M R + 1 ≤ TauCeti.lsCategoryCount M univ ≤ TauCeti.totalCriticalCount I f`,
the first inequality being AlgebraicTopology's cup-length bound and the second
the pinned bound; the same lower bound then holds for
`TauCeti.minCriticalCount I M`. The cup-length bound is not applied to empty
M. Counts are distinct points, not critical
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
finite-coproduct formula and the disjoint critical-set count. The category
count is the sum over finitely many pairwise disjoint clopen sets by the
pinned `TauCeti.lsCategoryCount_eq_sum_inter`. This
corollary is not a prerequisite for the main inequality. Dimension 0 is a
finite discrete calculation.

For the main bound, transport the native normed-space Fermat theorem through
boundaryless charts to `mfderiv=0` and combine it with the compact extreme-value
theorem. This proves the critical locus nonempty when M is nonempty and does
not assume a nondegenerate Hessian. Both are pinned: the boundaryless Fermat
theorem `IsLocalExtr.mem_criticalPoints` and
`TauCeti.criticalPoints_nonempty`.

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
The pinned `TauCeti.exists_criticalLevelDeformation`
(`Geometry/Manifold/Morse/Deformation`, on a Hausdorff manifold, for smooth f)
gives this deformation more generally: for δ>0, a compact band f⁻¹[c−δ,c+δ]
and an open U containing its critical points, some 0<ε<δ and a deformation Φ
of M from the identity, never increasing f, carrying {f≤c+ε} into
{f<c−ε}∪U, with no nondegeneracy, finiteness or isolation hypothesis and no
Morse chart.

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
Neither Morse–Smale genericity nor a Morse approximation of f is needed. The
ambient deformation is pinned as `TauCeti.exists_ambientSublevelDeformation`:
on a Hausdorff manifold, for smooth f and a compact critical-free band
f⁻¹[a,b], a deformation Φ of M from the identity, never increasing f, with
f(Φ(1,x))<a whenever f x≤b; it needs no buffer and no compactness of M.

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
This is Takens' F.(M), the minimum over all smooth functions of the number
of critical points (Takens 1968, Introduction, p. 198), not a new restriction
to Morse functions. Without
the witness retain the extended counting statement, with no default finite
minimum. This bound is not an Arnold fixed-point theorem. The minimum is
pinned as `TauCeti.minCriticalCount I M`
(`Geometry/Manifold/Morse/MinCriticalCount`), the infimum in ℕ∞ of
`TauCeti.totalCriticalCount` over all smooth functions, attained by a smooth
function (`TauCeti.exists_totalCriticalCount_eq_minCriticalCount`), finite on
compact M (`TauCeti.minCriticalCount_ne_top`) and bounded below by the category
(`TauCeti.lsCategoryCount_univ_le_minCriticalCount`); on compact M its natural
value is c(M).

Checks include the empty/finite 0-dimensional cases, an infinite critical
set (a constant function on a nonempty positive-dimensional compact manifold),
several critical points at the same value, and degenerate isolated extrema
in the neighborhood-deformation theorem. A height function supplies a
finite witness on a sphere; the lower bound applies also to arbitrary
smooth degenerate functions there. Manifolds with boundary are excluded:
f(t)=t on [0,1] has no ordinary interior critical points. Relative/boundary
Morse conditions require their own hypotheses and are not added here.

**Checks.**
- On S¹ with R=ℤ: the cup length is 1, the category count 2 and a height has 2
  critical points, so 2≥2≥1+1.
- On the torus T² with R=ℤ: the cup length is 2 (the product of the two
  degree-1 generators is nonzero), the category count 3 and a height has 4
  critical points, so 4≥3≥3.
- On RP²: over 𝔽₂ the cup length is 2, giving 3≥3, which the
  three-critical-point quadratic function attains; over ℚ the cup length is 0
  and gives only 3≥1, so the coefficient ring matters.
- A constant on S¹ has count ∞ and category 2; it satisfies the inequality with
  no finite count assigned, whereas a natural-number cardinality with value 0
  on infinite sets would break it.
- For M=S¹⊔S¹: the category count is 2+2=4 and a height on each circle gives
  2+2=4 critical points; a normalized category cat−1 is not additive here,
  since 1+1≠3.
- On the empty manifold the cup length is 0 (the supremum of the empty
  collection) and the category count 0, so 0+1≤0 fails: the nonemptiness
  hypothesis of the cup-length bound is needed.
- On a point every function has exactly one critical point, the category count
  is 1 and the cup length 0: 1≥1≥0+1.

### M4.1. Two critical points with arbitrary degeneracy

Prove `nonempty_homeomorph_sphere_of_two_criticalPoints`: if M is compact,
with the standing smooth, boundaryless, Hausdorff and second-countable
hypotheses, has dimension m=dim E, and a smooth f:M→ℝ has exactly two distinct
critical points, construct an actual homeomorphism M≃ₜS^m, the unit sphere of
`EuclideanSpace ℝ (Fin (m+1))`. Neither connectedness nor positive dimension is
a hypothesis. For m=0 every point is critical, so M has exactly two points and
is S⁰. For m>0, M has finitely many components, each clopen, compact and of
dimension m; on each, f attains a minimum and a maximum, which are critical by
the boundaryless Fermat theorem, and they are distinct, since otherwise f is
constant on an open set of positive dimension, all of whose infinitely many
points are critical. So k components carry at least 2k critical points and the
count forces k=1. Both critical points may be degenerate, including
vanishing Hessians. The count is the same derivative-zero point count used
above, not a count of critical values. Compact extrema and the boundaryless
Fermat theorem identify the two points as the unique minimum p and maximum q,
with a=f(p)<f(q)=b; every value in (a,b) is regular. For a Morse function this
is the pinned Reeb theorem, whose proof needs the Morse lemma at both extrema;
the degenerate statement rests on the recognition of a compact manifold
covered by two open sets diffeomorphic to ℝ^m as a topological sphere
(Milnor 1959, Theorem 1(3), p. 440, and Corollary 1, p. 442). This theorem is separate
from the LS inequality: a categorical contraction or category bound does not
recognize a disc or sphere. Do not perturb f to Morse while assuming its
critical count stays two.

First construct `exists_twoEuclideanOpenCover_of_two_criticalPoints`, with
actual open subsets U,V covering M and homeomorphisms U≃ₜℝ^m and V≃ₜℝ^m,
under the same hypotheses. For m=0 take U and V the two points. For m>0
choose a coordinate ball B at p with compact closure avoiding q and a coordinate
ball V at q avoiding p. Consume the smooth metric and complete compact-manifold
flow suppliers from DG3/DG12 already used in M2, using X=−grad f itself, not
an adapted Morse pseudo-gradient. Its global flow Φ_t is a diffeomorphism
with inverse Φ_−t and d(f∘Φ_t)/dt=−‖grad f‖². Since p is the unique minimum,
the compact sublevels {f≤a+1/n} decrease to {f=a}={p}, so choose ε>0 with
{f≤a+ε}⊂B. This sublevel is invariant under the descending
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

*Needs:* M4's boundaryless Fermat theorem and the compact extreme-value
theorem; DG3/DG12's smooth metric, the complete flow of a smooth vector field
on a compact manifold and its energy identity; M1's coordinate balls at p
and q.

**Checks.**
- Standard height h on S^m, m>0: p and q are the poles, B and V polar caps,
  K=S^m∖V a closed cap, and Φ_(−T)(B) is a cap containing K; a construction
  using Φ_T(B) in place of Φ_(−T)(B) shrinks B into itself and covers no
  point of K outside B.
- f=h−h³/3 on S^m: the same two critical points, both with vanishing Hessian;
  the estimate uses only η=min‖grad f‖>0 on the compact band f⁻¹[a+ε,b−δ],
  which contains no critical point, so no normal form is needed and none is
  available.
- Negative control: f=h² on S^m, m>0, has critical set {poles}∪{h=0}, with
  count ⊤ for m≥2 and 4 for m=1, where the equator is two points; so
  `totalCriticalCount f=2` fails in every dimension, while a count of critical
  values, which is two here, would wrongly admit it.
- m=0: on a two-point M={x,y} every function has both points critical, count
  2, and U={x}, V={y} are each homeomorphic to ℝ⁰, a point, with M≃ₜS⁰; on a
  one-point M the count is 1 and the hypothesis fails.
- On two disjoint copies of S², every smooth function has a minimum and a
  maximum on each copy, hence at least four critical points; the two-point
  count already excludes a disconnected M, so a separate connectedness
  hypothesis would make the statement weaker, not different.
- A constant on a compact manifold of positive dimension has count ⊤, so the
  hypothesis excludes it.
- With f=h on S¹ and the round metric, a=−1 and b=1: ‖grad h‖=√(1−h²), so on
  the band [a+ε,b−δ] with ε=δ=1/2 the bound is η=√3/2, η²=3/4, and any
  T>(b−a)/η²=8/3 works.

Next consume **Brown's generalized Schoenflies theorem** from
[GeometricTopology §2.2](../GeometricTopology/README.md#22-the-generalized-schoenflies-theorem)
as the topological input of M4.1, in this form: for m≥1, an embedding
g:S^(m−1)→S^m and a bicollar b:S^(m−1)×ℝ→S^m of g in the sense of the pinned
`TauCeti.IsBicollar g b`, the complement of Σ=g(S^(m−1)) has exactly two
components, and the closure of each is homeomorphic to the closed ball D^m by
a homeomorphism carrying its frontier Σ onto ∂D^m (Brown 1960, Theorem 5,
p. 76; Theorem 5 states only that each closure is an m-cell, and the frontier
clause holds for the homeomorphism of Brown's proof of Theorem 2, which
agrees near the frontier with the collapsing map of the proof of Theorem 5,
and that map carries Σ onto the equator). For m≥2 the two open collar sides
b(S^(m−1)×(0,∞)) and b(S^(m−1)×(−∞,0)) are connected and lie one in each
component; for m=1 each of the two points of Σ has one of its two collar
arcs in each component. The separation statement is the pinned Tau Ceti's
Jordan–Brouwer theorem `natCard_zerothHomotopy_sphere_compl_range_eq_two`
(`AlgebraicTopology/Singular/JordanBrouwer`): the complement of the image of
a continuous injection of the unit sphere of a finite-dimensional real
normed space E into the unit sphere of a space of dimension dim E+1 has
exactly two path components. It applies to g on the unit sphere of
`EuclideanSpace ℝ (Fin m)`, and S^m∖Σ is open in S^m, so its components are
its path components. The hypothesis is the explicit bicollar b; no
local-flatness theorem, annulus theorem or Alexander-horned-sphere analysis
is an input, and the statement is false for the horned sphere, which has no
bicollar.
The pinned Tau Ceti's local-flatness theory (`IsLocallyFlat`,
`brownBicollaring`, `IsLocallyBicollaredWithSides.exists_isBicollar`) and
GeometricTopology Layer 2's annulus theorem are not inputs here, because the
bicollar below is written down in coordinates.

*Needs:* GeometricTopology §2.2, with the pinned `TauCeti.IsBicollar`; the
pinned Tau Ceti's `natCard_zerothHomotopy_sphere_compl_range_eq_two` for the
separation statement; Mathlib's `OnePoint` compactification.

**Checks.**
- m=1: a bicollar S⁰×ℝ→S¹ has image two disjoint open arcs; Σ is two
  points; S¹∖Σ has two components, open arcs, whose closures are closed arcs
  ≃D¹ with endpoints Σ.
- The equator of S^m with its latitude bicollar: the two closures are the
  closed hemispheres, each ≃D^m with frontier the equator.
- Negative control: the Alexander horned sphere in S³ has a complementary
  domain that is not simply connected, so its closure is not D³; it admits
  no bicollar and does not satisfy the hypothesis.
- Separation: the pinned Jordan–Brouwer theorem gives exactly two path
  components of S^m∖Σ, which are its components because S^m∖Σ is open in
  S^m; "at least two components" would not determine which closure is which
  cell.
- Collar sides at m=1: with Σ={p,q} at the angles 0 and π on S¹ and the
  bicollar b(+1,t) at the angle εt/(1+|t|), b(−1,t) at the angle
  π−εt/(1+|t|), both halves of the side b(S⁰×(0,∞)) lie in the upper arc; so
  at m=1 the two components are not labelled by the two sides, while for m≥2
  each side is connected and lies in one component.

Then prove the **two-open-cell lemma**
`nonempty_homeomorph_sphere_of_two_euclidean_opens`. For any compact Hausdorff
space X covered by two open subsets U,V each homeomorphic to ℝ^m, m>0,
construct X≃ₜS^m. In U coordinates choose a closed round m-ball D of radius r
whose interior contains the compact set X\V, which lies in U. Thus Σ=∂D lies
in the open set U∩V, and by compactness so does the open coordinate annulus
{r−η<|u|<r+η} for some 0<η<r. The radial map b(θ,s)=(r+η·s/(1+|s|))θ, in
U-coordinates, is a homeomorphism of S^(m−1)×ℝ onto that annulus, an open
subset of V, so b is a bicollar of g=b(·,0), which parametrizes Σ. The
complement C=X\int D is compact and lies inside V. Identify the one-point
compactification of V≃ₜℝ^m with S^m using native `Homeomorph.onePointCongr`
and `onePointEquivSphereOfFinrankEq`; V is open in it, so b stays an open
embedding into S^m, a bicollar `TauCeti.IsBicollar g b` there, and Brown's
theorem applies. The two open sets X\D and (int D∩V)∪{∞} are disjoint and
partition S^m\Σ (the second is open because its complement C is compact in
V), and both are nonempty, since X\D=∅ would make the open set U≃ₜℝ^m equal to
the compact X; since S^m\Σ has exactly two
components, each of the two sets is one of them, the outer collar side
{r<|u|<r+η} lying in the first and the inner side in the second. Hence C is
the closure of the complementary component not containing ∞, and Brown gives
C≃ₜD^m with Σ carried onto ∂D^m. D is the other closed cell. The closed sets D
and C cover X and meet exactly in Σ, which corresponds to the unit sphere
under both identifications, so the pinned
`TauCeti.nonempty_homeomorph_sphere_of_union_closedBall`, which extends the
boundary gluing homeomorphism radially by the Alexander map
(`Homeomorph.radialExtension`), gives X≃ₜS^m. Include m=1
(two arcs and their two endpoints) explicitly; no high-dimensional surgery,
Poincaré conjecture or differentiable Schoenflies statement is an input.
For smooth M the cover of the previous paragraph consists of open sets
diffeomorphic to ℝ^m, the hypothesis of Milnor 1959, Theorem 1(3), p. 440,
whose Corollary 1 (p. 442) is this topological conclusion; the lemma here
needs only homeomorphisms.

*Needs:* Brown's theorem above, from GeometricTopology §2.2 with the pinned
`TauCeti.IsBicollar`; the pinned
`natCard_zerothHomotopy_sphere_compl_range_eq_two`; Mathlib's
`Homeomorph.onePointCongr` and `onePointEquivSphereOfFinrankEq`; the pinned
two-disc gluing `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall`.

**Checks.**
- X=S¹ as the union of two open arcs U,V: D is a closed subarc of U containing
  S¹∖V, C=S¹∖int D is the complementary closed arc, and gluing the two arcs
  along their two endpoints gives S¹, using the m=1 case of Brown's theorem.
- X=S^m with U,V the complements of the two poles: D is a closed polar cap
  and C the opposite closed cap; Brown identifies C with D^m and the radial
  extension gives S^m.
- Negative control: m=0 and X a point: U=V=X≃ℝ⁰ cover X, but X is not S⁰;
  excluded by m>0.
- Negative control: X=ℝ^m with U=V=X satisfies the cover hypotheses and is
  not a sphere; excluded by compactness.
- Negative control: a closed ball D^m, m>0, and the wedge S^m∨S^m have points
  with no neighborhood homeomorphic to ℝ^m, so no such cover exists.

Compose the two constructions for the degenerate Reeb–Milnor/Rosen theorem
when m>0; for m=0, M is two points and is S⁰.
Its output is topological only; exotic smooth spheres are not identified
diffeomorphically with the standard sphere. In the nondegenerate case compare
this result with M1/M2's two-disc-handle route at the level of existence of a
homeomorphism, without asserting that two arbitrary choices of homeomorphism
are isotopic. The all-smooth theorem does not assert that every small regular
sublevel at a degenerate extremum is a disc or that its regular level is a
standard sphere.

*Needs:* the two preceding targets of M4.1 only.

As a degenerate regression take standard height h:S^m→[−1,1] and
f=h−h³/3, m>0. Compute df=(1−h²)dh: its critical set is exactly the two poles,
and both intrinsic Hessians vanish: in the radial chart coordinate r at the
north pole, f=2/3−r⁴/4+O(r⁶). Apply the all-smooth theorem directly;
M1's nondegenerate chart theorem is inapplicable to this f. Retain all empty,
dimension0, boundary, infinite-critical-count and arbitrary-function LS cases
above unchanged; they are not extra hypotheses on this sphere theorem.

Acceptance: standard height on S^m; cosine functions on T^m with binomial
critical counts; the two-dimensional torus's minimum/saddles/maximum; explicit
integer counts satisfying weak inequalities/Euler but violating a strong
inequality; and closed connected positive-dimensional M with exactly two
critical points is homeomorphic to a sphere. For a Morse function the last conclusion follows from M1/M2's two disc
handles and radial boundary extension; this is the pinned Reeb theorem
`TauCeti.IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two`
(Cohen–Iga–Norbury, Application 5.13, p. 43), and M4.1's theorem contains it. For an arbitrary smooth function,
including degenerate extrema, use M4.1's Euclidean-open-cover and two-open-cell
construction. Neither route asserts a diffeomorphism to the standard sphere. Complex projective
moment functions use [ComplexKahlerGeometry K7.1 and K7.2](../ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples):
K7.1 supplies the actual `Projectivization ℂ (Fin (n+1)→ℂ)` carrier and,
through K1 and [ComplexManifolds Milestone 1](../ComplexManifolds/README.md#milestone-1-restriction-of-scalars-and-atlas-transport)'s
real restriction of the complex affine charts, the concrete
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
equals Euler-characteristic parity, sphere
critical counts are even, and closed odd-dimensional manifolds have Euler
characteristic 0 by comparing f and −f through the pinned
`TauCeti.IsMorse.criticalCount_neg` (for a Morse function on a C¹ manifold
with a boundaryless model on a finite-dimensional space E and j≤dim E,
`criticalCount I (−f) j = criticalCount I f (dim E − j)`). The equality is
`c_j(−f)=c_(m−j)(f)` for 0≤j≤m, not symmetry of the counts of an arbitrary single f.
For RP² consume AlgebraicTopology AT4.6's single projectivization/manifold/CW
carrier and use the quadratic coordinate function with three distinct weights:
three critical points and no perfect Morse function over ℚ, contrasted with
its perfect F₂ count. More generally π₁(M)≠0 and b₁(M;ℚ)=0 obstruct
perfection over ℚ by the necessary 1-cells in a connected CW model.

**Checks.**
- On S², ordinary height has indices 0 and 2 and two nondegenerate critical
  points, so the pinned Reeb theorem applies.
- For f=h−h³/3 on S², the only critical points are still the poles but both
  Hessians are 0: the two-disc route and the pinned Morse theorem do not
  apply, while M4.1's theorem gives S².
- On S² a height with two minima, one saddle and one maximum has c=(2,1,1),
  and −f has c=(1,1,2)=(c₂,c₁,c₀); the counts of a single f need not be
  symmetric, and c₀−c₁+c₂=2=χ(S²).
- On CP¹, f([z₀:z₁])=|z₁|²/(|z₀|²+|z₁|²) has critical values 0,1 and indices
  0,2; the denominator is positive because z≠0.
- On a point every function has one critical point, so the two-point
  hypothesis fails while all counting formulas remain valid; on two points
  every function has two critical points and M4.1 gives S⁰.

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
patch the changes to a neighborhood of the zero section. The local normal
form is Cohen–Iga–Norbury, Theorem 15.1, p. 143, with the quadratic identity
on a neighbourhood of the zero section; a bounded function cannot have that
identity on an entire nonzero normal fibre. The global bundle-compatible
patching is the extension constructed here.
For a compact critical component and a compact isolated critical band, attach
the negative disc bundle, give the relative homotopy equivalence and identify
the resulting relative homology with H_(j−λ)(C;orientation(ν⁻)). Use Thom
local coefficients, or F₂; untwisted integral/rational coefficients require the
negative-bundle orientation. Include multiple critical components and prove
compatibility with regular-band deformation (Cohen–Iga–Norbury,
Theorem 15.4, p. 146, for compact M; localizing its deformation to a compact
isolated band gives the band version). The twisted Thom identification uses
CharacteristicClasses C2, including its orientation system.

Consume [DGFloer Layer 1 item 3](../DGFloer/README.md)'s generic filtered-complex
`SpectralObject`, independently of its trajectory layers. Construct the
critical-band filtration and identify its spectral sequence, naturality
and finite convergence on compact M (Cohen–Iga–Norbury, Theorems 15.6–15.7,
pp. 147–148). Use the homological filtration convention in which relative
attachment homology is E¹; its differential can be nonzero. For the
filtration by ordered critical values, the filtration index is the
critical-band position, not the Morse index. Deduce Morse–Bott strong inequalities
with the shifted critical-component Betti polynomials and the correct negative-
orientation coefficients. Prove the ordinary Morse specialization is M2/M4.
Hamiltonian [ConvexityToric T2](../SymplecticGeometry/ConvexityToric/README.md) consumes this attachment theorem and supplies
complex negative bundles/equivariant perfection; RiemannianGeometry's path-space
applications supply their own critical components and Jacobi negative bundles.

**Checks.**
- For f(x,y)=y², the critical line has Hessian kernel span(e₁), negative rank
  0 and positive rank 1.
- For f(x,y)=y⁴, the Hessian kernel is the whole plane at the critical line;
  this is not Morse–Bott.
- On a point critical component the negative bundle has rank λ and contributes
  t^λ, recovering the ordinary Morse formula.
- For a negative Möbius line over S¹, the integral Thom comparison uses its
  nontrivial orientation system; replacing it by constant ℤ coefficients gives
  the wrong H₀ coefficient group (ℤ instead of ℤ/2).
- The ordinary RP² cell filtration has E¹ groups ℤ in cell dimensions 0,1,2 and
  differential 2 from dimension 2 to 1; on E² these become ℤ, ℤ/2, 0. The
  relative groups are not already E².
- A constant on a compact manifold is Morse–Bott with zero normal bundle and
  one critical component per connected component; its contribution is the
  original Betti polynomial.

## M6. Gradient convergence and exponential decay

The gradient is [DifferentialGeometry 12.2](../DifferentialGeometry/README.md)'s
`mgradient`: the pinned `Riemannian.Tensor.rieszDual`
(`Geometry/Manifold/VectorBundle/Riemannian/Riesz`, the inverse of
`InnerProductSpace.toDual` on the fibre) applied to `mfderiv I 𝓘(ℝ) f x`, for
the inner product that Mathlib's `RiemannianBundle` puts on `TangentSpace I x`.
The `mgradient` of `Suggested.lean` is that definition with the same body,
restated so that the M6 headlines are statable; the smoothness of the metric
is the hypothesis `IsContMDiffRiemannianBundle I ∞ E` on the tangent bundle.
The gradient is pinned as `TauCeti.Manifold.mgradient`, the Riesz dual of
`mvfderiv I f x`, with `TauCeti.Manifold.inner_mgradient` and the flat-model
comparison `TauCeti.Manifold.mgradient_eq_gradient`.
Consume DG's maximal smooth gradient
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
a single limit p. This is `tendsto_of_isMIntegralCurveOn_neg_mgradient`: for a
Morse f, a smooth metric and a curve γ that is an integral curve of −`mgradient`
on [0,∞) in the sense of Mathlib's `IsMIntegralCurveOn` with γ([0,∞)) inside a
compact set K, there is a critical point p in K with γ(t)→p. A proper
bounded-below Morse function traps every forward trajectory in its initial
compact sublevel, giving that corollary; a merely bounded-below function
supplies no trapping.

For a maximal negative-gradient trajectory of a C² function for a C¹ metric
the following are pinned (`Geometry/Manifold/Morse/{GradientFlow,ExponentialConvergence}`),
on top of the vector-space estimates above: smoothness and the energy
identity along the trajectory; forward existence when its forward part stays
in a compact set (`TauCeti.Ici_subset_maximalIntegralCurveInterval_neg_mgradient`);
criticality of its cluster points; convergence when that compact set holds
finitely many critical points
(`TauCeti.exists_tendsto_maximalIntegralCurve_neg_mgradient`) and the
corollary for proper Morse functions bounded below
(`TauCeti.IsMorse.exists_tendsto_maximalIntegralCurve_neg_mgradient`); the
manifold Łojasiewicz inequality |f−f(p)|≤C‖grad f‖² near a nondegenerate
critical point
(`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_mul_abs_sub_le_norm_mgradient_sq`);
and exponential decay of the energy f(γ(t))−f(p), the tail-length bound by a
constant times its square root, and exponential decay of the Riemannian
distance to a nondegenerate limit
(`TauCeti.exists_riemannianEDist_le_mul_exp_maximalIntegralCurve_neg_mgradient`).
These hold for variable Riemannian metrics, do not assume the field is an
adapted pseudo-gradient, and allow the compact set to lie in a noncompact
manifold. The maximal interval `maximalIntegralCurveInterval` and the maximal
integral curve `maximalIntegralCurve` (`Geometry/Manifold/IntegralCurve/Maximal`)
come with `IsMIntegralCurveOn.subset_maximalIntegralCurveInterval`: an
integral curve through x on an open interval around 0 is defined on a subset
of the maximal interval of x; and `IsMIntegralCurveOn.eqOn_maximalIntegralCurve`:
on a Hausdorff boundaryless C¹ manifold and for a C¹ field, such a curve
agrees on that interval with the maximal integral curve through x, by
Mathlib's uniqueness of integral curves on an open interval through an
interior agreement time, `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff_boundaryless`.

Beyond the pinned maximal-trajectory theorems, the owned content of the two
M6 headlines is that γ is an arbitrary curve on [0,∞). Its curve equation at
the endpoint 0 is one-sided, since `IsMIntegralCurveOn` on `Set.Ici 0` takes
derivatives within that set, while uniqueness of integral curves is for curves
on an open interval agreeing at an interior time; so compare γ with a maximal
trajectory at a positive time. Fix t₁>0, let x=γ(t₁) and let Γ be the maximal
integral curve of the C¹ field −grad f through x. On (0,∞) the set `Set.Ici 0`
is a neighbourhood of each time, so for every b>0 the shifted curve
s↦γ(t₁+s) is an integral curve through x on the open interval (−t₁,b) around
0; hence (−t₁,b) lies in the maximal interval and Γ(s)=γ(t₁+s) there, by the
two maximal-curve lemmas above. So Γ(s)=γ(t₁+s) for all s>−t₁, the forward
part of Γ is trapped in K, and the Morse hypothesis supplies finitely many
critical points in K (`TauCeti.IsMorse.finite_criticalPoints_inter`) and a
nondegenerate limit. The pinned theorems give a critical p∈K with Γ(s)→p and
constants μ,C>0 with riemannianEDist(Γ(s),p)≤C·e^(−μs) for s≥T₀; so
γ(t)=Γ(t−t₁)→p, and for t≥t₁+T₀ the distance from γ(t) to p is at most
C·e^(μt₁)·e^(−μt). The compact-M convergence case is Cohen–Iga–Norbury,
Theorem 4.6, pp. 27–29; compact trapping and the variable-metric exponential
estimates are the pinned extensions above.

**Checks.**
- Standard height h on S^m: a trajectory of −grad h starting off the poles
  stays in S^m and converges to the south pole, the unique critical point in
  its ω-limit set; the north pole, a critical point, is never the limit of a
  trajectory starting elsewhere.
- Negative control: f(x)=x on ℝ has trajectories x(t)=x₀−t, trapped in no
  compact set and convergent to no point; the compact-trapping hypothesis is
  not removable.
- Negative control: on ℝ with f(x)=x and the pointwise metric g=λg₀, where
  λ(x)=x⁻² for x≠0 and λ(0)=1, an inner product at every point but
  discontinuous at the regular point q=0, the field −grad_g f=−λ⁻¹ is −x² off
  0 and −1 at 0; the trajectory from x₀>0 is x(t)=x₀/(1+x₀t), which converges
  to the regular point 0 without reaching it, so the conclusion fails; the
  theorem needs the smooth-metric hypothesis `IsContMDiffRiemannianBundle`.
- A trajectory trapped in a compact K of a noncompact manifold has its limit
  in K, since K is closed; the theorem needs no compactness of the manifold.

Transport native `exists_mul_abs_sub_le_norm_gradient_sq` to manifold charts
with equivalent metric norms. Prove locally `|f−f(p)|≤C‖grad f‖²` and
two-sided gradient/distance estimates. On a convergent descending trajectory
E(t)=f(γ(t))−f(p)≥0; derive exponential decay of E and bound tail length by
a constant times √E using its derivative and dissipation. Deduce
`dist(γ(t),p)≤C' exp(−ct)` after a finite entry time. Treat an equilibrium
separately; a saddle limit does not require local positivity of f−f(p). This
is `exists_edist_le_exp_of_tendsto_neg_mgradient`, stated for the intrinsic
Riemannian extended distance `Manifold.riemannianEDist` of the metric on M
itself (the infimum of lengths of C¹ paths), so that no auxiliary metric-space
structure on M and no conversion of an infinite distance to a real number
occurs, and for every t≥0, the finite entry time absorbed into the constant:
for a Morse f, a smooth metric and a forward trajectory γ→p, there are C and
c>0 with `riemannianEDist(γ(t),p)≤C exp(−ct)` for all t≥0.

**Checks.**
- Standard height on S^m: along a meridian with angle u from the south pole
  the trajectory satisfies u′=−sin u, so u(t)≍e^(−t) and c=1 is the Hessian
  eigenvalue at the minimum; no larger c works.
- Negative control: f(x)=x⁴ on ℝ has the trajectory x(t)=(x₀⁻²+8t)^(−1/2),
  which converges to the degenerate critical point 0 at a polynomial rate and
  satisfies no exponential bound; excluded by the Morse hypothesis.
- A constant trajectory at a critical point satisfies the bound with C=0.
- A saddle on ℝ², f=x²−y²: the trajectory (x₀e^(−2t),0) converges to the
  saddle with c=2 although f−f(p) changes sign near p.
- For f=x², γ(t)=x₀e^(−2t), E(t)=x₀²e^(−4t) and the tail length is
  |x₀|e^(−2t); at an equilibrium E and the tail length are both 0, and no
  division by E is allowed.
- With metric 4dx² and f=x², the negative gradient is −x/2, γ(t)=x₀e^(−t/2),
  and the intrinsic distance to 0 is 2|x₀|e^(−t/2); the Euclidean rate 2 is not
  preserved under metric rescaling.
- Endpoint: for f=x², x₀≠0 and γ(t)=x₀e^(−2t) for t≥0, γ(t)=x₀ for t<0, γ
  satisfies the curve equation on [0,∞) (its right derivative at 0 is
  −2x₀=−grad f(x₀)), but its left derivative at 0 is 0, so it is an integral
  curve on no open interval containing 0 and uniqueness at the time 0 does not
  apply. At t₁=1 the maximal curve through γ(1) is Γ(s)=x₀e^(−2)e^(−2s),
  defined for all s, equal to γ(1+s) for s≥−1 and different for s<−1, where
  γ(1+s)=x₀ and Γ(s)=x₀e^(−2−2s); the limit is 0, and the decay bound
  |γ(t)|≤|x₀|e^(−2t) holds for all t≥0.
- Negative control: f(x)=e^(−x) on ℝ is bounded below by 0 and has no critical
  point; its trajectories x(t)=log(e^(x₀)+t) leave every compact set, so a
  lower bound without properness supplies no trapping.

Use normalized-gradient reparametrization only on compact critical-free
bands in M2; it need not be complete near a critical point. Closedness and
isolation of the critical set supply finiteness on compact sets. Prove the
proper/bounded-below and compact-trapped corollaries with these explicit
hypotheses.

## References and course targets

- Milnor, *Morse Theory* (1963), §§2–6 for local/deformation/CW/inequality proofs;
  Theorem 3.1, p. 12, Lemma 3.6, pp. 20–21, Theorem 3.5, p. 20, and
  Corollary 6.7, p. 36.
  Theorem4.1 and Remark1 distinguish the nondegenerate two-disc proof from
  the general degenerate statement. For M4.1's additional topological bridge,
  see Milnor, [*Sommes de variétés différentiables et structures différentiables
  des sphères*](https://numdam.org/articles/10.24033/bsmf.1538/), Bull. Soc.
  Math. France87 (1959) 439–444, Theorem1(3) (p. 440) and Corollary1 (p. 442), and R. H. Rosen,
  *A weak form of the star conjecture for manifolds*, Notices Amer. Math.
  Soc.7 (1960), abstract570-28, p.380, Lemma1. The required construction is
  specified in M4.1 above.
- M. Brown, [*A proof of the generalized Schoenflies theorem*](https://www.ams.org/journals/bull/1960-66-02/S0002-9904-1960-10400-4/S0002-9904-1960-10400-4.pdf),
  Bull. Amer. Math. Soc.66 (1960) 74–76, Theorems 0–5; Theorem 5 (p. 76) is
  the bicollared Schoenflies theorem that M4.1 consumes from GeometricTopology
  §2.2.
- F. Takens, [*The minimal number of critical points of a function on a
  compact manifold and the Lusternik-Schnirelman category*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0006/LOG_0025.pdf),
  Invent. Math. 6 (1968) 197–244, Introduction (p. 198), for the
  arbitrary-function Lusternik–Schnirelmann inequality and the minimum F.(M)
  of M4.
- Cohen, Iga and Norbury, [Topics in Morse Theory](https://math.stanford.edu/~ralph/morsecourse/biglectures.pdf),
  classical part, for manifold normal forms, sublevels and cellular comparison;
  author course notes (2006): Theorem 4.6, pp. 27–29; Theorem 5.3, pp. 36–37;
  Corollary 5.4, p. 38; Theorem 5.7, pp. 40–41; Corollary 5.11, p. 42;
  Application 5.13, p. 43; Theorems 15.1, 15.4, 15.6–15.7, pp. 143, 146–148,
  for Morse–Bott theory.
- L. I. Nicolaescu, [*An Invitation to Morse Theory*](https://academicweb.nd.edu/~lnicolae/Morse2nd.pdf),
  author version of the second edition: Theorem 2.2.3, pp. 38–42, and
  Remark 2.2.5, p. 42, for the handle attachment of M2. Numbering here refers
  to this author version.
- Hirsch, *Differential Topology* (1976), Chapter 2, §1 (strong topologies),
  and Chapter 6, Theorem 1.2 (strong Morse density), DOI
  10.1007/978-1-4684-9449-5.
- Lee, *Introduction to Smooth Manifolds*, 2nd ed. (2012), Corollary 5.14 and
  Proposition 5.38, for the regular-fibre atlas consumed in M2, DOI
  10.1007/978-1-4419-9982-5.
- Weber, [*Conley pairs in geometry – Lusternik–Schnirelmann theory and more*](https://www.math.stonybrook.edu/~joa/PUBLICATIONS/conblock.pdf),
  author version of arXiv:1709.05010: Theorem 1.1, p. 2, and its finite-cover
  proof, pp. 2–3, for the Lusternik–Schnirelmann bound of M4. Numbering here
  refers to this author version.
