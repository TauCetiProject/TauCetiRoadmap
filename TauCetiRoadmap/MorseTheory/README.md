# Roadmap: Morse functions, sublevel topology and Morse–Bott attachments

**Summary.** Develop the finite-dimensional topology of Morse and Morse–Bott functions:
intrinsic Hessians and indices, normal forms, genericity, deformation of
sublevels, handles and cells, proper exhaustions, strong inequalities, the
recognition of the sphere from a smooth function with two critical points of
arbitrary degeneracy, critical-submanifold attachments and compact-trapped
gradient convergence.
The resulting library supplies geodesic Morse theory,
[AffineMorseLefschetz](../AffineMorseLefschetz/README.md) and Hamiltonian moment-map topology.

## Scope and ownership

This roadmap owns ordinary finite Morse deformation/attachment and their
abstract Morse–Bott extension. RiemannianGeometry R3 owns the broken-geodesic
vertex carrier, Jacobi/index comparison and path-space limit, consuming this
core. The symmetric-space and Bott-periodicity applications use the same
broken-path carrier and the attachments here.
[HeegaardFloer Lane M](../HeegaardFloer/README.md) owns stable/unstable
manifolds, Morse–Smale trajectory spaces, compactification/gluing, Morse
homology and its singular comparison. It consumes the finite Morse core here;
this roadmap does not construct a second trajectory complex.

The native Morse predicates and index laws are inputs. General atlas
transport is owned by ComplexManifolds Milestone 1; the transport of a
boundaryless model to its vector space, with its scalar-level, immersion,
critical-point and index comparisons, is pinned in Tau Ceti (§1.1).

This roadmap owns the recognition of the sphere from a smooth function with
exactly two critical points of arbitrary degeneracy (§4.4) and, as its
topological input, Brown's bicollared generalized Schoenflies theorem. The
pinned Tau Ceti already proves Reeb's theorem for Morse functions with two
critical points, the Jordan–Brouwer separation theorem, Brouwer's invariance
of domain and the recognition of a space glued from two closed discs along
their boundary spheres as a sphere; §4.3 and §4.4 consume them, as the
supplier contracts below state.

The pinned Tau Ceti Morse library already proves a large part of Layers 1–4
and 6, and the targets it proves are consumed by the names that the Tau Ceti
contract lists, not restated: the boundaryless-model transport with its
immersion, critical-point and index comparisons, the critical set with its
extended counts, compact finiteness and the duality `c_j(−f)=c_(m−j)(f)`, the
critical Hessian with its chart, matrix and metric comparisons, the compact
chart C^k seminorms, the normalized Morse chart and the persistence and
continuation of nondegenerate critical points (Layer 1); the regular-level
atlas and embedding, the sublevel and band atlases with boundary, the
deformation across a compact critical-free band with its homeomorphism and
product forms, the disc sublevels at nondegenerate extrema, adapted
pseudo-gradients near compact sets with their flows, Milnor's cell attachment
across one critical level in homotopy and relative CW form, and the regular
sublevel exhaustion (Layer 2); the strong Whitney topology, Morse density in
it and proper Morse functions bounded below (Layer 3); the weak and strong
Morse inequalities with Euler's equality, the polynomial identity for CW
complexes with the ranks of the cellular differentials as correction
coefficients, freeness of submodules of free modules over a principal ideal
domain in every rank, the ambient deformations across critical-free bands and
degenerate critical levels, the Lusternik–Schnirelmann bound for an arbitrary
smooth function and the minimal critical count (Layer 4); and the
convergence, energy identity, Łojasiewicz estimate and exponential decay of
maximal negative-gradient trajectories (Layer 6). The targets outside the
pinned library are the comparison of compact chart seminorms under a fixed
chart change (§1.3); the typed boundary/level diffeomorphisms and the
co-orientation of regular boundary faces (§2.1); the handle form of the
attachment, the restriction of band deformations to smaller bands and the
comparison of the pseudo-gradient and normalized-gradient deformations (§2.2);
the change-of-chart and parameter comparisons (§2.3); the global CW model
(§2.4); the restriction and refinement laws of the strong topology (§3.1);
the Morse-function polynomial identity and the integral consequences of the
CW model (§4.1); the cup-length and component corollaries (§4.2); the
applications of §4.3; the degenerate two-critical-point sphere theorem with
Brown's theorem (§4.4); Layer 5; and the passage from maximal trajectories to
arbitrary forward integral curves (§6.1).

Morse theory under the Palais–Smale condition in place of properness
(sequential compactness of almost-critical sequences, deformation of
noncompact critical-free bands on complete Riemannian manifolds, and
gradient convergence without compact trapping) is outside this roadmap: it
extends §2.2 and §6.1 and belongs to a Part II roadmap built on them;
nothing here depends on it.

## Conventions

Types are universe-polymorphic; for singular homology put the coefficient field
and space in a common universe (using universe lifts when needed). The
critical set is Tau Ceti's `TauCeti.criticalPoints I f`, the zero set
`{x | mvfderiv I f x = 0}` of the manifold derivative, and the counts are
`TauCeti.criticalCount I f j` (critical points of Morse index j) and
`TauCeti.totalCriticalCount I f`, both in ℕ∞; these definitions need only
charted calculus, and smoothness and the standing geometric hypotheses
accompany their theorems. The sublevel inclusion is
`TauCeti.sublevelInclusion f a b hab`, which needs only a topological space,
a function into a preorder and a≤b.

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
For §4.4 use `Topology.IsEmbedding`, `TopologicalSpace.Opens`, the one-point
compactification `OnePoint` with `Homeomorph.onePointCongr`, and
`onePointEquivSphereOfFinrankEq`, which identifies the one-point
compactification of an m-dimensional real topological vector space with the
unit sphere of `EuclideanSpace ℝ ι` for an index type ι with m+1 elements; the
unit sphere of
`EuclideanSpace ℝ (Fin (m+1))` is charted on `EuclideanSpace ℝ (Fin m)` by
`EuclideanSpace.instChartedSpaceSphere`.

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

The pinned Morse library proves the following targets of Layers 1–4 and 6,
consumed with the hypotheses stated; paths are under `TauCeti/`, and the
manifold has a boundaryless model on a finite-dimensional real space unless a
weaker setting is said.

- Model transport (`Geometry/Manifold/ModelTransport/{Boundaryless,Immersion}`,
  `Geometry/Manifold/Morse/ModelTransport`): for a boundaryless model I with
  model space E, the `def` copy `TauCeti.BoundarylessModel I M` of M with M's
  topology and the E-valued charts I∘c, its `IsManifold 𝓘(ℝ,E) n` structure
  when M is a C^n manifold, the identity diffeomorphism
  `TauCeti.BoundarylessModel.diffeomorph`, the maximal-atlas correspondences
  and the source- and target-side `mfderiv` comparisons; the transport of
  immersions with a given complement and of smooth embeddings across the
  model change; and the equality of critical sets, nondegeneracy, Morse
  indices and the predicates `IsMorseOn` and `IsMorse` under the identity map.
- Critical set and counts (`Geometry/Manifold/Morse/CriticalPoints`):
  `TauCeti.criticalPoints`, `TauCeti.criticalCount` and
  `TauCeti.totalCriticalCount`, defined for any model and any function, with
  `TauCeti.mem_criticalPoints_iff_mfderiv_eq_zero`; the critical set of a C¹
  function is closed (`TauCeti.isClosed_criticalPoints`), and a Morse function
  has finitely many critical points in each compact set
  (`TauCeti.IsMorse.finite_criticalPoints_inter`, for a C¹ manifold structure,
  with no Hausdorff or dimension hypothesis); for a Morse function on a C¹
  manifold with a boundaryless model on a finite-dimensional space E and
  j≤dim E, `TauCeti.IsMorse.criticalCount_neg` gives
  `criticalCount I (−f) j = criticalCount I f (dim E − j)`.
- Hessian, normal form and persistence
  (`Geometry/Manifold/Morse/{Hessian,NormalizedChart,Persistence,CriticalPointContinuation}`,
  `Geometry/Manifold/Riemannian/CriticalHessian`,
  `Geometry/Manifold/ContMDiffMap/Chart/Seminorm`): `TauCeti.criticalHessian`,
  symmetric, with its matrix in a basis, change of basis by congruence and
  inertia (the Morse index is its negative inertia index), equal at a critical
  point of a C² function to the Hessian in any chart of the
  maximal atlas (`TauCeti.criticalHessian_apply_eq_of_mem_maximalAtlas`) and to
  the Hessian of any C¹ metric (`TauCeti.Manifold.hessian_eq_criticalHessian`);
  the compact chart C^k seminorm `ContMDiffMap.chartCkSeminorm`, the maximum
  through order k of the supremum norms of coordinate derivatives on a compact
  coordinate set, monotone in the set and in k; the normalized Morse chart
  `TauCeti.IsManifoldNondegenerateCriticalPoint.exists_normalized_morseChart`,
  for f smooth near a nondegenerate critical point x: a partial diffeomorphism
  ψ onto an open subset of `EuclideanSpace ℝ (Fin (dim E))` with ψ x=0 and
  `f y=f x−Σ_(i<λ)(ψ y)_i²+Σ_(i≥λ)(ψ y)_i²` on its whole source, λ the Morse
  index; C² persistence with the Morse index
  (`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_criticalPoint_perturbation_manifoldMorseIndex_eq`)
  and the C² continuation branch of a C³ family
  (`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_contMDiffAt_criticalPoint_continuation`).
- Regular levels, sublevels and bands
  (`Geometry/Manifold/RegularValue/{Level,ManifoldLevel}`,
  `Geometry/Manifold/RegularValue/Scalar/{Submersion,Sublevel}`): the
  section-zero level atlas `TauCeti.regularLevelChartedSpace`; the regular-fibre
  theorem `TauCeti.exists_regularFiber_smoothEmbedding` (Lee, *Introduction to
  Smooth Manifolds*, 2nd ed., Corollary 5.14 and Proposition 5.38), which for a
  C^m map, m≥1, into a finite-dimensional manifold and a regular interior value
  c gives an atlas on `{x // f x = c}` modelled on `Fin (dim E − dim F) → ℝ`
  for which the inclusion is a smooth embedding with tangent image `ker df`,
  with no separation or countability hypothesis; for F=ℝ with model `𝓘(ℝ)`
  every value is interior, regularity is surjectivity of `mfderiv I 𝓘(ℝ) f x`
  on the level, and the model is `Fin (dim E − 1) → ℝ`. The scalar submersion
  chart is `TauCeti.scalarSubmersionChartAt`, with
  `TauCeti.IsRegularPoint.isSubmersionAtOfComplement`; the half-space atlases of
  a regular sublevel and band are `TauCeti.scalarRegularSublevelChartedSpace`
  and `TauCeti.scalarRegularBandChartedSpace`, with
  `TauCeti.isManifold_scalarRegularSublevel`,
  `TauCeti.isManifold_scalarRegularBand` and
  `TauCeti.boundary_scalarRegularSublevel` (the manifold boundary is the level).
- Band deformation (`Topology/Order/Sublevel`,
  `Geometry/Manifold/Morse/{Deformation,Sublevel}`): the inclusion
  `TauCeti.sublevelInclusion` of sublevels of any function into a preorder;
  `TauCeti.exists_sublevelDeformation` and
  `TauCeti.exists_sublevelHomotopyEquiv` (Milnor, *Morse Theory*, Theorem 3.1):
  on a Hausdorff manifold, for smooth f, a≤b and a compact band f⁻¹[a,b]
  containing no critical point, a retraction of {f≤b} onto {f≤a} and a homotopy
  from its composite with the inclusion to the identity rel {f≤a}, with no
  compactness of M; `TauCeti.exists_sublevelHomeomorph`,
  `TauCeti.exists_diffeomorph_sublevel` and `TauCeti.exists_bandHomeomorph`, the
  homeomorphism, ambient diffeomorphism and product forms; and
  `TauCeti.IsManifoldNondegenerateCriticalPoint.exists_sublevel_homeomorph_closedBall`:
  at a unique global minimum that is a nondegenerate critical point, with one
  compact sublevel strictly above it, all small sublevels are closed discs,
  the radius squared recording the value; its local forms
  `TauCeti.IsManifoldNondegenerateCriticalPoint.exists_sublevel_component_homeomorph_closedBall`
  (on a Hausdorff manifold, the component through a nondegenerate local
  minimum of a small sublevel is a closed disc) and
  `TauCeti.IsManifoldNondegenerateCriticalPoint.exists_local_superlevel_homeomorph_closedBall`
  (the same for small superlevels at an index-dim E point, inside a
  neighbourhood).
- Ambient deformations (`Geometry/Manifold/Morse/Deformation`), on a Hausdorff
  manifold, for smooth f: `TauCeti.exists_ambientSublevelDeformation`, for a
  compact critical-free band f⁻¹[a,b], a deformation Φ of M from the identity,
  never increasing f, with f(Φ(1,x))<a whenever f x≤b; and
  `TauCeti.exists_criticalLevelDeformation`, for δ>0, a compact band
  f⁻¹[c−δ,c+δ] and an open U containing its critical points, some 0<ε<δ and such
  a Φ carrying {f≤c+ε} into {f<c−ε}∪U, with no nondegeneracy, finiteness or
  isolation hypothesis.
- Cell attachment and exhaustion
  (`Geometry/Manifold/Morse/{AdmissibleCharts,HandleRetraction,Cell/Comparison,RelCWComplex,Exhaustion,PseudoGradient/Existence,PseudoGradient/ModelTransport}`):
  `TauCeti.IsMorse.exists_admissible_morseCharts`;
  `TauCeti.IsMorse.exists_morseCellAttachment_deformation`, the comparison map
  from the TopCat pushout of the lower sublevel and the cells to {f≤c+ε} as the
  inclusion of a strong deformation retract; Milnor's cell attachment in
  relative CW form `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation`:
  for a Morse function on a Hausdorff manifold and a compact band
  f⁻¹[c−δ,c+δ], some 0<ε≤δ and a finite relative CW complex over {f≤c−ε},
  inside {f≤c+ε} and a strong deformation retract of it, whose m-cells
  correspond to the critical points of index m on the level c; the regular
  sublevel exhaustion `TauCeti.IsMorse.exists_regular_sublevel_exhaustion` of a
  proper Morse function bounded below; and adapted pseudo-gradients on compact
  manifolds (`TauCeti.BoundarylessModel.IsMorse.exists_isAdaptedPseudoGradient`),
  with the near-compact form `TauCeti.IsMorse.exists_contMDiff_pseudoGradientOn_nhds`
  (on a Hausdorff σ-compact self-modelled manifold, a smooth field near any
  compact K, strictly decreasing f off the critical set and equal to the
  linear Morse-chart field near the critical points of K), their complete
  flows on compact manifolds, the local chart flow, the energy integral
  identity and the comparison with −grad f for metrics Euclidean in the chart
  coordinates
  (`Geometry/Manifold/Morse/PseudoGradient/{Basic,Existence,Flow,Local,Energy,Gradient}`).
  The normalization is that of `TauCeti.IsAdaptedPseudoGradient`: in a Morse
  chart `TauCeti.MorseChart` with coordinates z, weights w_i=±1 and
  `f=f(x)+(1/2)Σ_i w_i z_i²`, the field reads `z↦(−w_i z_i)_i` and its flow
  is `z_i↦e^(−w_i t)z_i`; in the normalized coordinates y=z/√2 of the
  Conventions the field reads (u,−v), not (2u,−2v).
- Strong topology and approximation
  (`Geometry/Manifold/ContMDiffMap/Chart/Strong`,
  `Geometry/Manifold/Morse/Generic/Strong`): the strong Whitney topology
  `ContMDiffMap.manifoldStrongWhitneyTopology`, generated by the strong C^k
  neighbourhoods of all finite orders; on a Hausdorff σ-compact manifold, Morse
  density `TauCeti.dense_setOf_isMorse_manifoldStrongWhitney` (Hirsch,
  Chapter 6, Theorem 1.2), relative approximation
  `ContMDiffMap.exists_isMorse_mem_ball_sub_compl`, and a proper Morse function
  bounded below `TauCeti.exists_isMorse_isProperMap_bddBelow` (Milnor,
  Corollary 6.7). A second-countable manifold with a finite-dimensional model
  is locally compact, hence σ-compact.
- Inequalities and critical-point bounds
  (`Geometry/Manifold/Morse/{Inequalities,LusternikSchnirelmann,MinCriticalCount,Deformation/Homology}`,
  `Topology/Homotopy/LusternikSchnirelmann`): for a Morse function on a compact
  Hausdorff manifold M, a division ring k and a finite k-module V,
  finite-dimensionality of `H_n(M;V)` in every degree
  (`TauCeti.IsMorse.finite_singularHomology`), the weak
  inequalities `TauCeti.IsMorse.finrank_singularHomology_le`, the strong
  alternating inequalities
  `TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_le` and
  Euler's equality
  `TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_eq` for
  n≥dim M, with counts `(TauCeti.criticalCount I f i).toNat`; the categorical
  covers `TauCeti.LSCategoricalCover` and the unnormalized count
  `TauCeti.lsCategoryCount`; the Lusternik–Schnirelmann bound
  `TauCeti.lsCategoryCount_univ_le_totalCriticalCount` for every smooth f on a
  compact Hausdorff manifold, with no nondegeneracy; and the minimal critical
  count `TauCeti.minCriticalCount` in ℕ∞, attained
  (`TauCeti.exists_totalCriticalCount_eq_minCriticalCount`) and finite on
  compact M (`TauCeti.minCriticalCount_ne_top`).
- Cellular inequalities and free modules
  (`AlgebraicTopology/Cellular/EulerCharacteristic/MorseInequalities`,
  `LinearAlgebra/FreeModule/PID`): for a CW complex C in a Hausdorff space
  with finitely many cells through degree n and none in degree n+1, and a
  finite module V over a division ring k in the universe of the space,
  `TauCeti.sum_range_monomial_natCard_cell_mul_finrank_eq_of_cwComplex`
  states in ℕ[t] that `Σ_(i≤n) c_i·dim V·t^i = Σ_(i≤n) b_i t^i + (1+t)Q`,
  with c_i the number of i-cells, b_i the dimension of `H_i(C;V)` and the
  coefficient of t^i in Q the rank of the cellular differential from degree
  i+1 to degree i for i<n, and 0 otherwise; the relative form for a CW pair
  is `TauCeti.sum_range_monomial_natCard_cell_mul_finrank_eq`. Every
  submodule of a free module over a principal ideal ring without zero
  divisors is free, in every rank (`Submodule.free_of_isPrincipalIdealRing`).
- Gradient flow (`Geometry/Manifold/Riemannian/Gradient/{Basic,NormedSpace}`,
  `Geometry/Manifold/Morse/{GradientFlow,ExponentialConvergence}`): the gradient
  `TauCeti.Manifold.mgradient`, the Riesz dual of `mvfderiv I f x`, with
  `TauCeti.Manifold.inner_mgradient`, `TauCeti.Manifold.contMDiff_mgradient`
  and `TauCeti.Manifold.mgradient_eq_gradient`; for a C² function and a C¹
  metric, `TauCeti.exists_tendsto_maximalIntegralCurve_neg_mgradient`, the
  convergence of a maximal negative-gradient trajectory whose forward part
  stays in a compact set with finitely many critical points, and
  `TauCeti.exists_riemannianEDist_le_mul_exp_maximalIntegralCurve_neg_mgradient`,
  exponential decay of the Riemannian distance to a nondegenerate limit.

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

Sections 4.3 and 4.4 consume the following pinned theorems, with the
hypotheses stated here.

- Reeb's theorem for Morse functions,
  `TauCeti.IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two`
  (`Geometry/Manifold/Morse/Reeb`): a compact Hausdorff manifold with a
  boundaryless model on a finite-dimensional space E, carrying a Morse
  function with exactly two critical points, is homeomorphic to the unit
  sphere of `EuclideanSpace ℝ (Fin (dim E+1))`, with no connectedness or
  dimension hypothesis. Its proof identifies small sublevels at the two
  nondegenerate extrema with discs by the Morse lemma.
- The Jordan–Brouwer separation theorem,
  `TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two`
  (`AlgebraicTopology/Singular/JordanBrouwer`): for a continuous injection of
  the unit sphere of a finite-dimensional real normed space E into the unit
  sphere of a real normed space of dimension dim E+1, the complement of the
  image has exactly two path components.
- Invariance of domain, `IsOpen.image_of_continuousOn_of_injOn` and
  `Continuous.isOpenEmbedding_of_injective`, with
  `Homeomorph.coe_apply_mem_frontier_iff`
  (`AlgebraicTopology/Singular/InvarianceOfDomain`): for manifolds without
  boundary charted on finite-dimensional real normed spaces of equal
  dimension, a map continuous and injective on an open set has open image, a
  continuous injection is an open embedding, and a homeomorphism between
  subsets matches their frontiers.
- The two-disc gluing theorem,
  `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall`
  (`Analysis/InnerProductSpace/Hemisphere`): a space covered by two closed
  sets, each homeomorphic to the closed unit ball of an m-dimensional real
  inner product space by a homeomorphism under which the intersection of the
  two sets corresponds to the unit sphere, is homeomorphic to the unit sphere
  of every (m+1)-dimensional real inner product space; the boundary gluing is
  arbitrary and is extended radially (`Homeomorph.radialExtension`).

The pinned local-flatness files (`TauCeti.IsLocallyFlat` and
`TauCeti.brownBicollaring`, Brown's later theorem that a locally flat
embedding of S^n in S^(n+1) is bicollared, not his generalized Schoenflies
theorem) are not inputs of §4.4, whose bicollar is radial in a chart.

### From TauCetiRoadmap.DifferentialGeometry

[DG Layers 3,5,10,12](../DifferentialGeometry/README.md) supply flows, boundary-orientation interfaces,
partitions of unity, sharp finite-dimensional Sard, metrics and Hessians.

In particular Layer 3 supplies maximal flows and smooth dependence. The §12.2
gradient, the §12.3 Hessian and the §5.1 boundary orientation are pinned in
Tau Ceti and consumed there: `TauCeti.Manifold.mgradient`,
`TauCeti.Manifold.inner_mgradient`, `TauCeti.Manifold.contMDiff_mgradient`
and `TauCeti.Manifold.mgradient_eq_gradient`
(`Geometry/Manifold/Riemannian/Gradient/{Basic,NormedSpace}`),
`TauCeti.Manifold.hessian` (`Geometry/Manifold/Riemannian/Laplacian`) and
`TauCeti.boundaryOrientation_spec`
(`Geometry/Manifold/Boundary/InducedOrientation`).

### From TauCetiRoadmap.AlgebraicTopology

[AlgebraicTopology Stages 2–8](../AlgebraicTopology/README.md) supply relative
chains, cofibrations, cellular/singular comparison, products, integral duality
and relative homotopy. Of the categorical-cover/cup-length supplement after
AT6.2, the covers `LSCategoricalCover` and the count `lsCategoryCount` are
pinned in Tau Ceti and consumed there (see the Tau Ceti contract); §4.2's
corollaries consume the supplement's cup length `lsCupLength` and its lower
bound, cup length plus one at most the unnormalized category count on a
nonempty space, over every commutative coefficient ring. That supplement uses
only foundational products and native homotopies, not Morse theory or
manifold duality. §2.4 consumes AlgebraicTopology §4.4–§4.5 (Stage 4,
items 4 and 5): the relative CW structure of a disc over its boundary sphere
and coproducts of such pairs (§4.4); and the relative CW pushout, its CW
model, the homotopy-pushout gluing comparison, the homotopy equivalence of
towers of closed cofibrations and the CW structure on the union of a tower of
CW subcomplexes (§4.5).

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

Layers 1–6 carry the labels M1–M6 by which consumers cite them, and §4.4 is
the target M4.1. The section ids of these labels map to the headings as
follows:

- `#m1-critical-hessians-indices-and-usable-normal-forms` → `#layer-1-critical-hessians-indices-and-usable-normal-forms-m1`;
- `#m2-compact-band-deformation-handles-and-cells` → `#layer-2-compact-band-deformation-handles-and-cells-m2`;
- `#m3-approximation-and-proper-morse-exhaustions` → `#layer-3-approximation-and-proper-morse-exhaustions-m3`;
- `#m4-strong-inequalities-and-topology-tests` → `#layer-4-strong-inequalities-and-topology-tests-m4`;
- `#m41-two-critical-points-with-arbitrary-degeneracy` → `#44-two-critical-points-with-arbitrary-degeneracy`;
- `#m5-morsebott-normal-bundles-and-attachments` → `#layer-5-morsebott-normal-bundles-and-attachments-m5`;
- `#m6-gradient-convergence-and-exponential-decay` → `#layer-6-gradient-convergence-and-exponential-decay-m6`.

Layer 1 fixes the critical set, Hessians, indices and normal forms, almost all
of them pinned; Layer 2 turns compact bands into handle attachments and CW
models. Layer 3 gives approximation and exhaustions. Layer 4 extracts
homology and category bounds and recognizes the sphere from two critical
points, Layer 5 treats critical submanifolds, and Layer 6
proves convergence. Each *Needs:* line separates statement carriers from a
possible proof route. [Suggested.lean](Suggested.lean) states the headline
theorems that the pinned Tau Ceti does not already prove; the others are named
in the Tau Ceti contract.

## Layer 1: critical Hessians, indices and usable normal forms (M1)

### 1.1 Model transport

The transport of a boundaryless model to its vector space is pinned and
consumed, with the hypotheses of the Tau Ceti contract: the `def` copy
`TauCeti.BoundarylessModel I M` of M, carrying M's topology and the E-valued
charts I∘c, with its `IsManifold 𝓘(ℝ,E) n` structure, the identity
diffeomorphism `TauCeti.BoundarylessModel.diffeomorph`, the preferred-chart,
extended-chart and maximal-atlas correspondences and the source- and
target-side `mfderiv` comparisons; the transport of immersions with a given
complement and of smooth embeddings; and the equality of critical sets,
nondegeneracy, Morse indices, `IsMorseOn`, `IsMorse` and adapted
pseudo-gradients under the identity map. Every arbitrary-model statement of
this roadmap reaches its vector-space input through this one transport, and
no second global atlas is installed on M. Mathlib's `[I.Boundaryless]` gives
`range I=univ` and the model homeomorphism `I.toHomeomorph:H≃ₜE`.
*Needs:* the pinned model-transport files of the Tau Ceti contract.

**Checks.**
- For the self-model ℝ², both transports are the identity and df=(1,0) stays (1,0).
- The half-line model has range [0,∞), not ℝ; the boundaryless hypothesis excludes this transport.

### 1.2 Critical Hessians and counts

The critical set is `TauCeti.criticalPoints I f`, the set
`{x | mvfderiv I f x = 0}`, and the counts are `TauCeti.criticalCount I f j`
and `TauCeti.totalCriticalCount I f` in ℕ∞, all pinned. The critical Hessian
is the pinned `TauCeti.criticalHessian`, a symmetric continuous bilinear form
on `TangentSpace I x` read from d²f in the preferred extended chart, with its
matrix in a basis, change of basis by congruence, negative inertia index equal
to the Morse index, restrictions to subspaces and definiteness tests, its
independence of the chart in the maximal atlas and its identification with the
Hessian of every C¹ metric at a critical point (DifferentialGeometry §12.3).
The native index bound λ≤dim M, direct-sum and product additivity, and at a
nondegenerate critical point the complementary-index identity
λ(f)+λ(−f)=dim M, are consumed; smoothness and criticality without
nondegeneracy do not imply that identity. Away from critical points the
Hessian of a metric depends on its connection, and no statement here uses it
there. *Needs:* Tau Ceti Morse Basic/Index/Hessian/CriticalPoints;
DifferentialGeometry §12.3 Hessian; §1.1.

**Checks.**
- On ℝ², f=−x²+y² has Hessian diag(−2,2), index 1 and one critical point.
- A constant on S¹ has infinitely many critical points: its extended total is ∞, not 0.
- On a point the empty Hessian is nondegenerate, index 0 and critical count 1; on the empty manifold it is 0.
- For f=0 on ℝ both indices are 0 and their sum is 0≠1; for f=x² they are 0 and 1, with sum 1.

### 1.3 Normal forms and persistence

The normal forms are pinned: the normalized Morse chart
`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_normalized_morseChart`
(Cohen–Iga–Norbury, Theorem 5.3, pp. 36–37), for every boundaryless model a
partial diffeomorphism onto an open subset of
`EuclideanSpace ℝ (Fin (dim E))`, centred at 0, with
`f=f(x)−Σ_(i<λ)y_i²+Σ_(i≥λ)y_i²` on its whole source; isolation of
nondegenerate critical points, strict local extrema at index 0 and at index
dim E, the two-dimensional saddle chart and
`TauCeti.IsMorse.finite_criticalPoints_inter` (Cohen–Iga–Norbury,
Corollary 5.4, p. 38); C² persistence of a nondegenerate critical point with
its Morse index and openness of the Morse locus, and the C² continuation
branch of a C³ family, obtained from the implicit-function theorem applied to
the coordinate differential, whose derivative in the point variable is the
invertible Hessian (`Geometry/Manifold/Morse/{NormalizedChart,CriticalPoints,Persistence,CriticalPointContinuation}`);
and the compact chart C^k seminorm `ContMDiffMap.chartCkSeminorm`, monotone in
the compact coordinate set and in k. Critical counts take values in ℕ∞ and
become natural numbers only after a finiteness proof, so infinite critical
sets receive no junk value. These parameter statements are local: a generic
family passes through birth–death points, where no branch continues.

Owned here is the comparison of compact chart seminorms under a fixed smooth
chart change. For a smooth transition map τ between two extended charts, a
compact coordinate set K in the source of τ and k∈ℕ, there is a constant C,
depending only on τ, K and k, such that the C^k seminorm on K of g∘τ is at
most C times the C^k seminorm on τ(K) of g, for every C^k function g; hence
finite intersections of compact chart C^k balls on different charts are
neighbourhoods of the same kind. *Needs:* the pinned declarations above;
Mathlib's bound `norm_iteratedFDerivWithin_comp_le` for iterated derivatives
of a composition.

**Checks.**
- f=x² has Hessian 2; a normalized chart has f=y², rather than y²/2.
- f_t=x³−t x has no critical points for t<0 and two for t>0; nondegenerate branch continuation does not cross t=0.
- For h(x)=δx², δ>0, on [−1,1], the order-0, order-1 and order-2 suprema are δ, 2δ and 2δ; value control alone misses derivative bounds.
- Under the chart change x=τ(y)=y/2 with K=[−2,2] and τ(K)=[−1,1], g(x)=x² becomes y²/4, with order-0, order-1 and order-2 suprema 1, 1 and 1/2 on K, against 1, 2 and 2 for g on τ(K): the m-th derivative scales by (1/2)^m, so C=1 suffices for every k here, while the reverse change y=2x needs C=2^k, which depends on k.

### Examples

For −x²+y² the indices of f and −f are both 1 and add to dimension 2.
For x²+y² the indices are 0 and 2. On f=x there are no critical points,
so the Morse condition does not imply properness or a lower bound.

### Dependencies

Mathlib manifold calculus; Tau Ceti Morse Basic/Index/NormalForm/Generic;
DifferentialGeometry §12.3; ComplexManifolds Milestone 1.

## Layer 2: compact-band deformation, handles and cells (M2)

### 2.1 Scalar levels and regular boundary faces

The regular levels of real-valued functions, on the actual subtype
`Level(f,c):={x:M // f x=c}` with its subspace topology, and their sublevel
and band faces are pinned, with no compactness hypothesis and no condition on
critical points away from the level: the level atlas
`TauCeti.regularLevelChartedSpace`, the section-zero atlas
`TauCeti.sectionZeroChartedSpace` of the section f−c of the trivial line
bundle over the copy `TauCeti.BoundarylessModel I M` of §1.1, transported to
the level along the identity of points, whose preferred chart at x is
`w ↦ K_x(π_x(c′_x w−c′_x x))` for the chosen projection π_x onto the kernel
of the preferred-chart derivative D_x and the kernel identification K_x, with
its smooth-embedding and tangent-kernel laws
(`Geometry/Manifold/RegularValue/Level`); the regular-fibre theorem
`TauCeti.exists_regularFiber_smoothEmbedding` (Lee, *Introduction to Smooth
Manifolds*, 2nd ed., Corollary 5.14 and Proposition 5.38), which with target
ℝ gives an atlas on Level(f,c) modelled on `Fin (dim E − 1) → ℝ` for which
the inclusion is a smooth embedding with tangent image
`ker (mfderiv I 𝓘(ℝ) f x)`; the scalar submersion chart
`TauCeti.scalarSubmersionChartAt` with
`TauCeti.IsRegularPoint.isSubmersionAtOfComplement`; and, for dim E=n+1, the
half-space atlases `TauCeti.scalarRegularSublevelChartedSpace` and
`TauCeti.scalarRegularBandChartedSpace`, with inward coordinate a−f in slot 0
on the sublevel, f−a and b−f on the lower and upper band faces, tangential
coordinates those of the level chart reindexed by `Fin.cast`
(`TauCeti.scalarRegularSublevelChartAt_apply_succ_eq_regularLevelChartAt`),
interior charts translated into the open half-space, and
`TauCeti.boundary_scalarRegularSublevel` and
`TauCeti.boundary_scalarRegularBand` identifying the manifold boundary with
the level, or the two levels, as subsets
(`Geometry/Manifold/RegularValue/Scalar/{Submersion,Sublevel}`). Scalar levels
are the scope here; regular fibres of maps into other manifolds and fibre
products are separate constructions.

Owned here are the typed boundary/level diffeomorphisms. Fix n with
dim E=n+1, reindex the level atlas along dim E−1=n by `Fin.cast`, and write
`β_n:=EuclideanSpace.equiv (Fin n) ℝ` from `EuclideanSpace ℝ (Fin n)` to
`Fin n→ℝ`. Give the boundary of the sublevel M_a the native boundary atlas
`TauCeti.boundaryChartedSpace` with `TauCeti.isManifold_boundary`
(`Geometry/Manifold/Boundary/{Model,Charts}`, at differentiability order ∞),
let h be the boundary/level homeomorphism given by the pinned set equality,
and prove on the actual common chart source
`β_n (chartAt (EuclideanSpace ℝ (Fin n)) p q)=χ_(h p)^n(h q)`, χ^n being the
reindexed level chart; this equality is taken after β_n and the reindexing,
not as an identification of differently typed atlases. Promote h to
`Diffeomorph 𝓘(ℝ,EuclideanSpace ℝ (Fin n)) 𝓘(ℝ,Fin n→ℝ) ↥((𝓡∂ (n+1)).boundary M_a) Level(f,a) ∞`,
proving both smooth directions from the public source, target, apply and
inverse laws of the two atlases, with no private chart lemma and no equality
of differently typed `IsManifold` statements as an input. For a band give the
typed diffeomorphism to the disjoint union of its two reindexed levels. Prove
that changing the chosen complements and charts gives the identity
diffeomorphism between the resulting atlases on a level.

Owned here as well is the metric-free outward co-orientation of the regular
faces: df(v)>0 for outward v on ∂M_a and on the upper band face, and df(v)<0
on the lower band face. Mathlib's inward slot 0 has outward vector −∂₀;
compute the outward-first orientation with that sign when M is oriented,
consuming DifferentialGeometry §5.1's `TauCeti.boundaryOrientation_spec` on
this boundary manifold. After a metric is chosen, ±grad f represent the
co-orientations; no orientation is needed for the atlases. The level model is
uniformly `Fin (dim E−1)→ℝ` before the reindexing, also for empty levels. In
dimension 0 regular levels are empty and sublevels are clopen boundaryless
0-manifolds with no half-space model; in dimension 1 levels use `Fin 0`. In
dimension 0 regular-endpoint bands are clopen, and a critical-free such band
is empty.

The level and face API consists of the pinned atlas laws and regular-level
theorem above and, owned here, the independence of complements, the typed
boundary/level diffeomorphisms and the co-orientation signs.
*Needs:* the pinned level, sublevel, band and boundary atlases above; §1.1;
DifferentialGeometry §5.1 only for orientation, GeometricTopology Layer 1 only
for collars.

**Checks.**
- For f(x,y)=x at level 0 the level is ℝ, the inclusion derivative is v↦(0,v), and its range is ker(df)=span(e₂).
- For f=x² at level 0, df=0; the singleton level cannot satisfy the regular-level embedding conclusion in dimension 1 with the required derivative-kernel equality.
- In dimension 0 every attained value is critical; a regular level is empty and the natural dimension subtraction yields 0.
- On [a,b]⊂ℝ with f=x, the outgoing endpoint has sign + and the incoming endpoint sign −, agreeing with outward-first orientation.
- For f=x²+y² on ℝ² and a=1, n=1: the boundary of M_1 is the unit circle, modelled on `EuclideanSpace ℝ (Fin 1)`, and the level on `Fin 1→ℝ`; at (1,0) the face chart has inward coordinate 1−f=0 and the typed diffeomorphism is the identity of points, whereas a model `EuclideanSpace ℝ (Fin 2)` would have the dimension of M_1 itself.

### 2.2 Deformation and adapted fields

The deformation across a compact critical-free band is pinned with its
forms: `TauCeti.exists_sublevelDeformation`,
`TauCeti.exists_sublevelHomotopyEquiv`, `TauCeti.exists_sublevelHomeomorph`,
`TauCeti.exists_diffeomorph_sublevel` and `TauCeti.exists_bandHomeomorph`
(Milnor, Theorem 3.1, p. 12, which assumes compactness of the band rather
than of the ambient manifold; the pinned hypotheses ask for a≤b rather than
a<b), with the inclusion `TauCeti.sublevelInclusion`, whose identity at a=b
and composition through an intermediate level are its pointwise formula. So
are the disc sublevels at nondegenerate extrema, the adapted pseudo-gradients
near compact sets with their flows, local chart flows and energy identity, in
the normalization the Tau Ceti contract records, and the homotopy cell
attachment across one critical level,
`TauCeti.IsMorse.exists_morseCellAttachment_deformation`, with its attaching
maps ∂D^λ→M_(c−ε), characteristic maps (D^λ,∂D^λ)→(M_(c+ε),M_(c−ε))
(`Geometry/Manifold/Morse/Cell/Map`) and the comparison from the TopCat
pushout to M_(c+ε) as the inclusion of a strong deformation retract.

Owned here are three statements on top of them.

**Restriction to smaller bands.** For a≤a′≤b′≤b with f⁻¹[a,b] compact and
free of critical points, the restriction to M_(b′) of the retraction of M_b
onto M_a and the composite of the retractions of M_(b′) onto M_(a′) and of
M_(a′) onto M_a are homotopic rel M_a. Both are retractions r and r′ onto M_a, and
the second composed with the inclusion i of M_a is homotopic to the identity
of M_(b′) rel M_a; hence r=r∘id≃r∘(i∘r′)=r′ rel M_a.

**Pseudo-gradient and normalized-gradient deformations.** On a compact
critical-free band rescale an adapted pseudo-gradient X by a positive smooth
function so that df(X)=−1 there, and compare its descending deformation with
the pinned normalized-gradient deformation: both reach M_a from a point x of
the band at time f(x)−a, both fix M_a, and they are homotopic rel M_a by the
restriction statement.

**Handles.** Across one critical value with finitely many nondegenerate
critical points and compact band, attach one index-λ handle D^λ×D^(m−λ) at
each point using disjoint normalized Morse charts. The conclusion is a
homeomorphism of M_(c+ε) with the topological handle adjunction along
∂D^λ×D^(m−λ), respecting the regular boundary away from the attachment; no
diffeomorphism of a cornered handle space is asserted. Build the
modified-function cutoff deformation, control all chart boundaries and prove
continuity of the local modified-function deformation. Consume GT's collars
for the attaching-face boundary identifications and native TopCat pushouts for
the handle adjunction; the handle-to-cell comparison is the pinned cell
attachment. Include simultaneous critical points, index 0 and the
whole-dimension case.

*Needs:* the pinned deformation, pseudo-gradient and cell-attachment
declarations above; §1.3; GeometricTopology Layer 1 collars and Mathlib TopCat
pushouts for the handles.

**Checks.**
- The point x=1 belongs to the closed sublevel at level 1 and stays present at level 4; an open-sublevel convention would exclude it.
- For f=x² on ℝ and 0<a<b, the retraction sends x outside [−√a,√a] to sign(x)√a and fixes that interval; for a<a′<b′<b a point x∈[√a′,√b′] goes to √a′ and then to √a, which is where the retraction for [a,b] sends it.
- For f=x², a Morse chart at 0 in the Tau Ceti normalization is z=√2x, with f=z²/2 and weight 1; an adapted pseudo-gradient reads z′=−z there, so x′=−x, with flow x₀e^(−t) and df(X)=−2x². The Euclidean −grad f=−2x reads z′=−2z and is not adapted in that chart, while for the metric 2dx², Euclidean in z, −grad f=−x is.
- For f=−u²+v² the Morse chart z=√2(u,v) has weights (−1,1) and the adapted field reads (z₁,−z₂), with flow (e^t z₁,e^(−t) z₂); the field (−z₁,−z₂) has df=z₁²−z₂², which increases f on the u-axis.
- For f=x² on the band [1,4], the field with df(X)=−1 is X=−1/(2x) for x>0, and from x=2 it reaches x=1 at time 3=f(2)−1; here it equals the normalized gradient −grad f/|grad f|².
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

The pinned `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation` gives
each critical-level stage as a finite relative CW complex over the lower
sublevel, with one m-cell per critical point of index m on the level, and
`TauCeti.IsMorse.exists_regular_sublevel_exhaustion` gives the regular-level
sequence of a proper Morse function bounded below; this subsection owns their
iteration to the global model.

Iterate finite critical levels to construct compatible relative CW models for
sublevel pairs. For a proper bounded-below Morse function, choose an exhausting
sequence of regular levels with finite critical sets at each stage, prove the
cofibration/compatibility statements and pass to a genuine CW complex homotopy
equivalent to M with one λ-cell per critical point. Consume Mathlib TopCat
pushouts and AlgebraicTopology §4.5's relative CW pushout, its CW model, the
homotopy-pushout gluing comparison, the homotopy equivalence of towers of
closed cofibrations and the CW structure on the union of a tower of CW
subcomplexes.
These supply finite cell/weak-topology induction, cellular approximation,
dimension reindexing and the categorical/classical CW comparison. Own the
Morse-specific negative-handle attaching maps and their relative comparison
to those adjunctions, the regular-level sequence and the resulting cell
index labeling. At stage k+1 use the CW model of the relative CW pushout
with Z=M_(a_k), Z_c=W_k and h=φ_k, followed by the negative-handle/cell
comparison that is identity on M_(a_k). The resulting φ_(k+1) restricts
exactly to φ_k; this constructs strict comparison-map compatibility. Use AT's telescope/colimit comparison for strictly commuting
levelwise equivalences and prove its comparison with the exhausted manifold,
retaining the proper-function control and actual level inclusions. Regular-level
collars make those inclusions closed cofibrations. Start at a regular a₀ below
a global lower bound for f, where the sublevel is empty; use
AlgebraicTopology §4.4's relative CW structure of a disc over its boundary
sphere and its coproducts at each handle stage. Specialize
AT4.5's compact-subset finite-stage factorization to this sublevel tower.
The W_k inclusions retain compatible cell labels and characteristic maps;
§4.5's union of a tower of CW subcomplexes builds the CW structure on their
critical-level union even when later stages add cells of lower dimension. Compact M gives a finite CW model. For regular-level compact
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

The strong topology is pinned as
`ContMDiffMap.manifoldStrongWhitneyTopology`, generated by the strong C^k
neighbourhoods `ContMDiffMap.StrongCkControl.ball` of all finite orders, each
given by a locally finite family of compact chart sets with a positive
tolerance on each; Morse density in it is
`TauCeti.dense_setOf_isMorse_manifoldStrongWhitney`, for a Hausdorff
σ-compact manifold (a second-countable one here), proved by cutoff local
linear perturbations over a compact exhaustion; and its agreement with the
compact chart C^k seminorm topology on a compact manifold is
`ContMDiffMap.manifoldStrongWhitneyTopology_eq_manifoldWeakWhitneyTopology`.
Strong Morse density is Hirsch, Chapter 6, Theorem 1.2; the topology is that
of Chapter 2, §1. The relative approximation and the persistence of
nondegeneracy are pinned as well (§1.3 and §3.2).

Owned here are the restriction and refinement laws of the topology:

- Restriction to any open submanifold is continuous into its compact-core C^k seminorm topology, for each finite k.
- Restriction is continuous for the strong topologies when the open inclusion is proper, equivalently clopen here: a locally finite compact family in the submanifold is then locally finite in M.
- Positive tolerance refinement and finite intersections give neighbourhoods of the same kind, independently of the compact chart cover.

*Needs:* the pinned strong topology above; §1.3 compact seminorms and their
chart-change comparison.

**Checks.**
- On a point all positive-order derivatives are 0, so the topology is the ordinary topology on its value ℝ.
- On compact S¹ a finite chart family suffices; a tolerance ε bounds the zeroth derivative by ε as well as derivatives through k.
- On ℝ a neighborhood with tolerance e^(−x²) excludes every nonzero constant perturbation, unlike a compact-open neighborhood controlling only [−1,1].
- Let ψ be compactly supported on ℝ, with 0≤ψ≤1 and ψ=1 near 0. Then δψ tends strongly to 0 on ℝ as δ→0, but its restriction to (0,1) fails the neighborhood |g(x)|<x for every δ>0: choose 0<x<δ where ψ=1. On [a,b]⊂(0,1), δ<a passes that value bound.
- For the clopen summand ℝ in ℝ⊔ℝ, any locally finite compact chart family remains locally finite in the ambient disjoint union; its tolerances extend by arbitrary positive tolerances on the other summand.

### 3.2 Exhaustions and relative approximation

The headline, a proper Morse function bounded below on every manifold here
(Milnor, Corollary 6.7, p. 36), is the pinned
`TauCeti.exists_isMorse_isProperMap_bddBelow`, for a Hausdorff σ-compact
manifold with a boundaryless finite-dimensional model. Its inputs are pinned
as well (`Geometry/Manifold/Morse/Generic/Strong`): the relative approximation
`ContMDiffMap.exists_isMorse_mem_ball_sub_compl`, which for a smooth f, a
strong C^k neighbourhood of f, a continuous positive tolerance ε, and a closed
set C inside an open set V on which f is Morse, gives a Morse g in that
neighbourhood with |g−f|<ε everywhere and g−f supported off C; and the proper
approximation `ContMDiffMap.exists_isMorse_isProperMap_mem_ball`, a proper
Morse g within distance 1 of a proper f in every strong neighbourhood, so that
a lower bound of f gives one of g. Compact-support control concerns each local
perturbation, not the global difference g−f on a noncompact manifold, and the
parameter statements of §1.3 do not make every member of a generic family
Morse through birth–death points. General exhaustion existence here is
separate from GeometricTopology Layer 1's squared-distance exhaustion for a
given closed embedding. *Needs:* the pinned approximation theorems above.

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
points and b_j=dim_k H_j(M;k), using actual singular homology. Prove

`Σ c_j t^j = Σ b_j t^j + (1+t)Q(t)`, with Q∈ℕ[t].

The weak and strong alternating inequalities, Euler's equality and the
finite-dimensionality of homology are pinned, with coefficients in a finite
module over a division ring, for compact M and for the sublevel pair of a
compact band between regular values
(`TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_le`,
`TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_eq`,
`TauCeti.IsMorse.finite_singularHomology` and their `sublevelPair` forms).
From them the polynomial identity follows by partial sums: with
`S_n(x)=Σ_(i≤n)(−1)^(n−i)x_i` put `q_n=S_n(c)−S_n(b)`, which is ≥0 by the
strong inequality and 0 for n≥dim M by Euler's equality; since
`S_n(x)+S_(n−1)(x)=x_n`, `c_j−b_j=q_j+q_(j−1)`, so `Q=Σ_j q_j t^j`. Weak
inequalities plus Euler equality alone do not prove nonnegative coefficients
of Q. The description of the coefficients of Q as ranks is the pinned CW
identity `TauCeti.sum_range_monomial_natCard_cell_mul_finrank_eq_of_cwComplex`
with V=k, applied to the finite CW model of §2.4, which has one j-cell per
critical point of index j and no cells above dim M, and to the homotopy
invariance of singular homology: the coefficient of t^j in Q is the rank of
the cellular differential from degree j+1 to degree j. Its relative form
`TauCeti.sum_range_monomial_natCard_cell_mul_finrank_eq`, applied to the
relative models of §2.4, gives the identity for regular sublevel and cobordism
pairs and finite critical-band intervals, with the relative homology visible.
The headline `strong_morse_inequalities` uses polynomials through degree
dim M and Q∈ℕ[t] (Cohen–Iga–Norbury, Corollary 5.11 and its proof, p. 42).

Integral consequences of the CW model are owned here: apply the pinned
`Submodule.free_of_isPrincipalIdealRing` over ℤ to the top cellular kernel of
a d-dimensional CW model, which may have countably many cells. Thus top
cellular homology of a d-dimensional CW model is free abelian and cohomology
above d vanishes by AT Stage 6.1's integral UCT. Do not infer that degree-d
integral cohomology is torsion-free. Apply the proper-index≤d version of M2 to
obtain those conclusions for noncompact M.

Define `bettiNumber`: for a field k and a topological space X in the universe
of k, `bettiNumber k X j` is the dimension over k of the j-th singular homology
of X with coefficients in k. Its API:

- For a homotopy equivalence X≃Y between spaces in the universe of k, `bettiNumber k X j = bettiNumber k Y j` for every j, by homotopy invariance of singular homology.
- For a compact boundaryless manifold M carrying a Morse function, `H_j(M;k)` is finite-dimensional in every degree (`TauCeti.IsMorse.finite_singularHomology`), so `bettiNumber k M j` is its dimension, and it is 0 for j>dim M by the weak inequality, since there are no critical points of index above dim M; for a finite CW complex the finiteness is `TauCeti.finite_singularHomology_of_cwComplex`.
- When `H_j(X;k)` is infinite-dimensional, `bettiNumber k X j = 0`, Mathlib's convention for `Module.finrank`; every statement here that reads b_j as a dimension carries compactness or finiteness of the CW model.
- The value depends on k: for RP² and j=1 it is 0 over ℚ and 1 over 𝔽₂.

*Needs:* §2.4; the pinned inequalities and CW identity above;
AlgebraicTopology Stage 6 cellular/singular comparison and UCT; Mathlib
singular homology and finite-dimensional linear algebra.

**Checks.**
- On S², C=B=1+t² and Q=0 over every field.
- On RP² over ℚ, C=1+t+t², B=1, Q=t; over 𝔽₂, B=C and Q=0. With cells (1,1,1) the cellular differentials over ℚ are d₁=0 and d₂=2, of ranks 0 and 1, so the rank description gives Q=0+1·t=t.
- For the empty manifold C=B=Q=0; for r isolated points C=B=r and Q=0.
- The candidate counts c=(2,0,0,2) and b=(1,0,0,1) satisfy weak inequalities and equal alternating sums 0, but the degree-1 strong inequality is −2≥−1, which fails.
- On a point the Betti number is 1 in degree 0 and 0 in every positive degree, over every field.
- For ℕ with the discrete topology, H₀ is a direct sum of countably many copies of k, which is infinite-dimensional, so the dimension-valued Betti number in degree 0 is the junk value 0 although there are infinitely many path components; a cardinal-valued count would give ℵ₀.
- S¹ and ℝ²∖{0} are homotopy equivalent and both have Betti number 1 in degree 1; the closed disc, homotopy equivalent to a point, has 0 there.

### 4.2 Arbitrary-function Lusternik–Schnirelmann inequality

The critical-point bound for **every smooth real-valued f on a compact
boundaryless finite-dimensional smooth Hausdorff manifold M**, allowing
arbitrary critical point degeneracy, is the pinned
`TauCeti.lsCategoryCount_univ_le_totalCriticalCount`, over Tau Ceti's
categorical covers `TauCeti.LSCategoricalCover` and unnormalized count
`TauCeti.lsCategoryCount`. Its critical set is `TauCeti.criticalPoints I f`,
the zero locus of the vector-valued `mvfderiv I f`, equivalently of
`mfderiv I 𝓘(ℝ) f` (`TauCeti.mem_criticalPoints_iff_mfderiv_eq_zero`), and
its total count is `TauCeti.totalCriticalCount I f`, the `ℕ∞`-valued `encard`
of that set; it states

`TauCeti.lsCategoryCount M univ ≤ TauCeti.totalCriticalCount I f`.

This is Weber, *Conley pairs in geometry*, author version, Theorem 1.1,
p. 2: his category is the number of categorical open sets, hence equals
`lsCategoryCount M univ` for nonempty M. The empty case is the separate
calculation 0≤0. When f has finitely many critical points, a categorical
cover of M by exactly that many open sets follows from the pinned bound with
`TauCeti.lsCategoryCount_le_iff` and padding a smaller cover
(`TauCeti.LSCategoricalCover.pad`, which needs M nonempty; for empty M the
empty cover serves). The inputs of its proof are pinned as well: the
boundaryless Fermat theorem `IsLocalExtr.mem_criticalPoints` and
`TauCeti.criticalPoints_nonempty`; the ambient deformation across a compact
critical-free band `TauCeti.exists_ambientSublevelDeformation`, which needs no
buffer and no compactness of M; and the degenerate critical-level deformation
`TauCeti.exists_criticalLevelDeformation`, which needs neither finiteness nor
isolation of the critical points of the band and invokes no Morse chart. The
minimal critical count is the pinned `TauCeti.minCriticalCount I M`, the
infimum in ℕ∞ of `TauCeti.totalCriticalCount` over all smooth functions,
attained by a smooth function
(`TauCeti.exists_totalCriticalCount_eq_minCriticalCount`), finite on compact
M (`TauCeti.minCriticalCount_ne_top`) and bounded below by the category
(`TauCeti.lsCategoryCount_univ_le_minCriticalCount`); on compact M its natural
value is the minimal number c(M) of critical points of a smooth function.

Owned here are two corollaries.

**Cup length.** For nonempty M and every commutative coefficient ring R,

`lsCupLength M R + 1 ≤ TauCeti.lsCategoryCount M univ ≤ TauCeti.totalCriticalCount I f`,

the first inequality being AlgebraicTopology's cup-length bound from its
categorical-cover supplement after Stage 6.2 and the second the pinned bound;
the same lower bound then holds for `TauCeti.minCriticalCount I M`. Counts are
distinct points, not critical values. Infinite critical sets have count ∞ and
satisfy every finite lower bound; do not use `Nat.card`, whose infinite-set
value is 0. Empty M has category count and critical count 0, and the
cup-length bound is not applied to it.

**Components.** Prove the component sum formula for the category count and
the critical count. For an arbitrary boundaryless model, first transport its
local open comparison with the finite-dimensional vector space to prove
`LocallyConnectedSpace H`; then apply native
`ChartedSpace.locallyConnectedSpace` and compact locally connected
`ConnectedComponents` finiteness. The components are finitely many pairwise
disjoint clopen sets, each carrying the restricted smooth structure; the
category count is the sum over them by the pinned
`TauCeti.lsCategoryCount_eq_sum_inter`, and the critical set is the disjoint
union of the critical sets of the restrictions, by the restriction and
derivative comparison on open subsets. This corollary is not a prerequisite
for the main inequality. Dimension 0 is a finite discrete calculation.
Manifolds with boundary are excluded: f(t)=t on [0,1] has no interior critical
points, and boundary Morse conditions require their own hypotheses.

*Needs:* the pinned bound, deformations and minimal count above;
AlgebraicTopology's categorical-cover/cup-length supplement after Stage 6.2;
Weber, Theorem 1.1, p. 2, with its finite-cover proof on pp. 2–3.

**Checks.**
- On S¹ with R=ℤ: the cup length is 1, the category count 2 and a height has 2 critical points, so 2≥2≥1+1.
- On the torus T² with R=ℤ: the cup length is 2 (the product of the two degree-1 generators is nonzero), the category count 3 and a height has 4 critical points, so 4≥3≥3.
- On RP²: over 𝔽₂ the cup length is 2, giving 3≥3, which the three-critical-point quadratic function attains; over ℚ the cup length is 0 and gives only 3≥1, so the coefficient ring matters.
- A constant on S¹ has count ∞ and category 2; it satisfies the inequality with no finite count assigned, whereas a natural-number cardinality with value 0 on infinite sets would break it.
- For M=S¹⊔S¹: the category count is 2+2=4 and a height on each circle gives 2+2=4 critical points; a normalized category cat−1 is not additive here, since 1+1≠3.
- On the empty manifold the cup length is 0 (the supremum of the empty collection) and the category count 0, so 0+1≤0 fails: the nonemptiness hypothesis of the cup-length bound is needed.
- On a point every function has exactly one critical point, the category count is 1 and the cup length 0: 1≥1≥0+1.

### 4.3 Sphere and projective applications

Acceptance: standard height on S^m; cosine functions on T^m with binomial
critical counts; the two-dimensional torus's minimum/saddles/maximum; explicit
integer counts satisfying weak inequalities/Euler but violating a strong
inequality; and a closed M admitting a Morse function with exactly two
critical points is homeomorphic to a sphere. The last item is the pinned Reeb
theorem `TauCeti.IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two`
(Cohen–Iga–Norbury, Application 5.13, p. 43), proved from two disc handles at
the nondegenerate extrema and the radial extension of the boundary gluing; no
diffeomorphism to the standard sphere is asserted. Section 4.4 proves the
same conclusion for every smooth function with exactly two critical points,
with no nondegeneracy hypothesis, and that theorem contains the Morse case.
Complex projective
moment functions use [ComplexKahlerGeometry K7.1 and K7.2](../ComplexKahlerGeometry/README.md):
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
equals Euler-characteristic parity and sphere critical counts are even, and
closed odd-dimensional manifolds have Euler characteristic 0 by comparing f
and −f through the pinned `TauCeti.IsMorse.criticalCount_neg`,
`c_j(−f)=c_(m−j)(f)` for 0≤j≤m; this relates two functions and is not a
symmetry of the counts of a single f.
For RP² consume AlgebraicTopology AT4.6's single projectivization/manifold/CW
carrier and use the quadratic coordinate function with three distinct weights:
three critical points and no perfect Morse function over ℚ, contrasted with
its perfect F₂ count. More generally π₁(M)≠0 and b₁(M;ℚ)=0 obstruct
perfection over ℚ by the necessary 1-cells in a connected CW model.

*Needs:* §4.1–§4.2; Layer 2 disc handles; ComplexKahlerGeometry K7.1–K7.2;
AlgebraicTopology §4.6; for the Morse sphere case, the pinned Reeb theorem,
whose two-disc proof uses the Morse lemma at both extrema.

**Checks.**
- On S², ordinary height has indices 0 and 2 and two nondegenerate critical points, so the pinned Reeb theorem applies.
- For f=h−h³/3 on S², the only critical points are still the poles but both Hessians are 0: the two-disc route and the pinned Morse theorem do not apply, while §4.4's theorem gives S².
- On S² a height with two minima, one saddle and one maximum has c=(2,1,1), and −f has c=(1,1,2)=(c₂,c₁,c₀); the counts of a single f need not be symmetric, and c₀−c₁+c₂=2=χ(S²).
- On CP¹, f([z₀:z₁])=|z₁|²/(|z₀|²+|z₁|²) has critical values 0,1 and indices 0,2; the denominator is positive because z≠0.

### 4.4 Two critical points with arbitrary degeneracy

Prove `nonempty_homeomorph_sphere_of_two_criticalPoints`: if M is compact,
with the standing smooth, boundaryless, Hausdorff and second-countable
hypotheses, has dimension m=dim E, and a smooth f:M→ℝ has exactly two
critical points, then M is homeomorphic to S^m, the unit sphere of
`EuclideanSpace ℝ (Fin (m+1))`. Both critical points may be degenerate, with
vanishing Hessians; the count is the derivative-zero point count
`TauCeti.totalCriticalCount I f`, the `encard` of `{x | mvfderiv I f x = 0}`,
not a count of critical values. Neither
connectedness nor positive dimension is a hypothesis. For m=0 every point is
critical, so M has exactly two points and is S⁰. For m>0, M has finitely many
components, each clopen, compact and of dimension m; on each, f attains a
minimum and a maximum, which are critical by the pinned boundaryless Fermat
theorem `IsLocalExtr.mem_criticalPoints`, and they are distinct, since otherwise f is constant on an open set
of positive dimension, all of whose infinitely many points are critical. So
k components carry at least 2k critical points and the count forces k=1. The
two critical points are then the unique minimum p and the unique maximum q,
with a=f(p)<f(q)=b, and every value in (a,b) is regular. For a Morse function
this is the pinned Reeb theorem of §4.3, whose proof needs the Morse lemma at
both extrema; the degenerate statement rests on the recognition of a compact
manifold covered by two open sets diffeomorphic to ℝ^m as a topological
sphere (Milnor 1959, Theorem 1(3), p. 440, and Corollary 1, p. 442). The
output is topological: an exotic smooth sphere is not identified
diffeomorphically with the standard one. Do not perturb f to a Morse function
while assuming that its critical count stays two, and do not route through
§4.2: a category bound does not recognize a sphere.

The proof composes the three targets below for m>0. In the nondegenerate case
its conclusion agrees with the pinned Reeb theorem at the level of existence
of a homeomorphism; no isotopy between the two homeomorphisms is asserted,
and nothing is claimed about whether a small regular sublevel at a degenerate
extremum is a disc. *Needs:* the Euclidean open cover and the two-open-cell
lemma below; the pinned boundaryless Fermat theorem `IsLocalExtr.mem_criticalPoints`.

**Checks.**
- f=h−h³/3 on S^m, m>0, with h the standard height: df=(1−h²)dh vanishes exactly at the poles, and near the north pole, in the radial chart coordinate r, f=2/3−r⁴/4+O(r⁶), so both Hessians are 0; the pinned Morse theorem does not apply and this theorem gives S^m.
- On two disjoint copies of S², every smooth function has a minimum and a maximum on each copy, hence at least four critical points; the two-point count already excludes a disconnected M, so a separate connectedness hypothesis would make the statement weaker, not different.
- m=0: on a two-point M every function has both points critical, count 2, and M is S⁰; on a one-point M the count is 1 and the hypothesis fails.
- Negative control: f=h² on S^m has critical set the two poles together with the equator {h=0}, of count ⊤ for m≥2 and 4 for m=1, where the equator is two points; the hypothesis fails in every dimension, whereas a count of critical values, which is 2 here (the values 0 and 1), would wrongly admit it.
- A constant on a compact manifold of positive dimension has count ⊤, so the hypothesis excludes it.

**The Euclidean open cover.** Prove
`exists_twoEuclideanOpenCover_of_two_criticalPoints`: under the same
hypotheses M is the union of two open sets U and V with homeomorphisms
U≃ₜℝ^m and V≃ₜℝ^m. For m=0 take U and V the two points. For m>0 choose a
chart ball B at p not containing q and a chart ball V at q not containing p,
and a smooth metric. Use the negative gradient field −`mgradient` f itself,
not an adapted Morse pseudo-gradient: on the compact M its flow Φ_t is
global, Φ_t is a diffeomorphism with inverse Φ_−t, and
`d/dt f(Φ_t x)=−‖grad f(Φ_t x)‖²`. The compact sublevels {f≤a+1/n} decrease
to {f=a}={p}, so some ε>0 has {f≤a+ε}⊂B; this sublevel is invariant under
the descending flow, and no assertion that it is a disc is needed. The set
K=M∖V is compact and omits the unique maximum, so some δ>0 has f≤b−δ on K.
If a+ε>b−δ, take T=0. Otherwise the compact band f⁻¹[a+ε,b−δ] contains no
critical point, so ‖grad f‖≥η>0 on it; for T>(b−a)/η² every x∈K has
f(Φ_T x)<a+ε, since a trajectory staying in the band up to time T would
lose more than b−a in value, and a trajectory that has entered {f<a+ε}
stays there. Hence U=Φ_−T(B) contains K, and U∪V=M. The chart-ball
homeomorphisms composed with Φ_T give the Euclidean maps. The proof uses the
compact flow and value estimates only, not continuity of hitting times or a
nondegenerate local normal form. *Needs:* the pinned boundaryless Fermat
theorem `IsLocalExtr.mem_criticalPoints` and the compact extreme-value theorem; DifferentialGeometry Layer 3's
complete flow of a smooth vector field on a compact manifold and Layer 12's
smooth metric and `mgradient` with the energy identity; §1.1's chart
transport for the chart balls at p and q.

**Checks.**
- Standard height h on S^m, m>0: p and q are the poles, B and V polar caps, K=S^m∖V a closed cap, and Φ_−T(B) a cap containing K; using Φ_T(B) instead shrinks B into itself and covers no point of K outside B.
- f=h−h³/3 on S^m, m>0: the estimate uses only η=min ‖grad f‖>0 on the compact band f⁻¹[a+ε,b−δ], which contains no critical point; no normal form is needed, and none is available at the degenerate poles.
- m=0 with M={x,y}: U={x} and V={y} are each homeomorphic to ℝ⁰, a point.
- With f=h on S¹ and the round metric, a=−1 and b=1: ‖grad h‖=√(1−h²), so on the band [a+ε,b−δ] with ε=δ=1/2 the bound is η=√3/2, η²=3/4, and any T>8/3 works.

**Brown's generalized Schoenflies theorem**, owned here as the topological
input of the two-open-cell lemma. Prove
`exists_closedBall_homeomorph_closure_of_bicollar`: for every m and every
topological embedding β:S^(m−1)×[−1,1]→S^m, with S^(m−1) the unit sphere of
`EuclideanSpace ℝ (Fin m)`, the complement of Σ=β(S^(m−1)×{0}) is the union
of two disjoint connected open sets A and B, and the closure of each is
homeomorphic to the closed unit ball D^m by a homeomorphism carrying Σ
exactly onto the unit sphere ∂D^m (Brown 1960, Theorem 5, p. 76, where the
collar parameter runs over [0,1] with the middle sphere at 1/2). Theorem 5
asserts that each closure is an m-cell; the boundary clause follows, since
the closure of A is A∪Σ with A open and every point of Σ a limit of points of
B, so its frontier in S^m is Σ, and the pinned
`Homeomorph.coe_apply_mem_frontier_iff`, for S^m charted on
`EuclideanSpace ℝ (Fin m)` and D^m inside that space, carries this frontier
onto the frontier ∂D^m of the ball. For m≥2 the two open collar sides
β(S^(m−1)×(0,1]) and β(S^(m−1)×[−1,0)) are connected and lie one in each of
A and B; for m=1 each point of Σ has one of its two collar arcs in each; for
m=0, S^(−1) is empty, Σ is empty and A and B are the two points of S⁰.

The separation statement is the pinned Jordan–Brouwer theorem
`TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two` applied to
β(·,0): S^m∖Σ has exactly two path components, which are its components
because S^m∖Σ is an open subset of a manifold. Follow Brown's route (Brown
1960, Theorems 0–4, pp. 74–76): a cellular subset of an m-cell is the only
inverse set of a self-map of the cell fixing its boundary (Theorem 1); a
complementary domain of a topological (m−1)-sphere mapped onto an m-cell with
a single cellular inverse set has closure an m-cell (Theorem 2); a map of an
m-cell into S^m with a single inverse set in its interior has that set
cellular (Theorem 3, through Theorem 0); a map of S^m onto itself with exactly
two inverse sets has both cellular (Theorem 4); and the map collapsing the
two outer collar pieces to the poles and carrying Σ onto the equator has
exactly those two inverse sets (proof of Theorem 5). Brown's Theorem 0 uses
invariance of domain, consumed from the pin as
`IsOpen.image_of_continuousOn_of_injOn` on the interior of the cell minus its
finitely many inverse sets. The hypothesis is the explicit bicollar β; no
local-flatness theorem, annulus theorem or analysis of wild spheres is an
input, and the statement fails for the Alexander horned sphere, which has no
bicollar. *Needs:* the pinned
`TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two`,
`IsOpen.image_of_continuousOn_of_injOn` and
`Homeomorph.coe_apply_mem_frontier_iff`; Brown's Theorems 0–4, owned in this
target; Mathlib's `EuclideanSpace.instChartedSpaceSphere`.

**Checks.**
- m=1: a bicollar S⁰×[−1,1]→S¹ has image two disjoint closed arcs, Σ is two points, and S¹∖Σ is two open arcs whose closures are closed arcs ≃D¹ with endpoint set Σ.
- The equator of S^m with its latitude bicollar: the closures are the closed hemispheres, each ≃D^m with frontier the equator.
- Negative control: the Alexander horned sphere in S³ has a complementary domain that is not simply connected, so its closure is not D³; it admits no bicollar and does not satisfy the hypothesis.
- Separation: the pinned theorem gives exactly two components; "at least two components" would not determine A and B.
- Collar sides at m=1: with Σ at the angles 0 and π of S¹, β(+1,t) at the angle εt and β(−1,t) at the angle π+εt, the side β(S⁰×(0,1]) has its arc at 0 in the upper open arc and its arc at π in the lower one; so at m=1 the components are not labelled by the sides, while for m≥2 each side is connected and lies in one component.
- m=0: S^(−1) is empty, so β is the empty map, Σ is empty, A and B are the two points of S⁰, their closures are points ≃D⁰={0}, and the boundary clause holds because ‖0‖=0≠1.

**The two-open-cell lemma.** Prove
`nonempty_homeomorph_sphere_of_two_euclidean_opens`: a compact Hausdorff
space X covered by two open sets U and V, each homeomorphic to ℝ^m with m>0,
is homeomorphic to S^m. In U-coordinates choose a closed round ball D of
radius r whose interior contains the compact set X∖V, which lies in U. Then
Σ=∂D lies in U∩V, and by compactness so does a coordinate annulus
{r−η≤|u|≤r+η}; radial coordinates on it give an explicit bicollar
β:S^(m−1)×[−1,1]→V of Σ. The set C=X∖int D is compact and lies in V.
Identify the one-point compactification of V≃ₜℝ^m with S^m by
`Homeomorph.onePointCongr` and `onePointEquivSphereOfFinrankEq`, and apply
Brown's theorem to β there. The open sets X∖D and (int D∩V)∪{∞} are disjoint
and partition S^m∖Σ; the second is open because its complement C is compact
in V, and both are nonempty, since X∖D=∅ would make the open set U≃ₜℝ^m
equal to the compact X. As S^m∖Σ has exactly two components, each set is one
of them, so C, the closure of the first, is homeomorphic to D^m with Σ
carried onto ∂D^m. The closed sets D and C cover X and meet exactly in Σ,
which corresponds to the unit sphere under both identifications, so the
pinned `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall` gives X≃ₜS^m.
The case m=1, two arcs glued at two endpoints, is included; no surgery,
Poincaré conjecture or smooth Schoenflies theorem is an input. For smooth M
the cover of the previous target consists of open sets diffeomorphic to ℝ^m,
the hypothesis of Milnor 1959, Theorem 1(3), whose Corollary 1 (p. 442) is
the topological conclusion; the lemma here needs only homeomorphisms.
*Needs:* Brown's theorem above; Mathlib's `Homeomorph.onePointCongr` and
`onePointEquivSphereOfFinrankEq`; the pinned
`TauCeti.nonempty_homeomorph_sphere_of_union_closedBall`.

**Checks.**
- X=S¹ as the union of two open arcs U and V: D is a closed subarc of U containing S¹∖V, C=S¹∖int D is the complementary closed arc, and gluing the two arcs along their two endpoints gives S¹.
- X=S^m with U and V the complements of the two poles: D is a closed polar cap and C the opposite closed cap.
- Negative control: m=0 and X a point: U=V=X≃ₜℝ⁰ cover X, but X has one point and S⁰ two; excluded by m>0.
- Negative control: X=ℝ^m with U=V=X satisfies the cover hypotheses and is not a sphere; excluded by compactness.
- Negative control: the closed ball D^m, m>0, and the wedge S^m∨S^m have points with no neighbourhood homeomorphic to ℝ^m, so no such cover exists.

### Examples

On T² the polynomial is 1+2t+t²; on RP² the same geometric count has different
Betti polynomials over ℚ and 𝔽₂. On a point every function has one critical
point, so the two-point hypothesis of §4.3–§4.4 fails while all counting
formulas remain valid; on two points every function has two critical points
and §4.4 gives S⁰. On S^m the function h−h³/3 has two degenerate critical
points, and §4.4 applies where the Morse theorem does not.

### Dependencies

Layers 1–3; AlgebraicTopology Stages 4,6 and its categorical-cover supplement;
ComplexKahlerGeometry K7 and ComplexManifolds Milestone 1 for projective examples;
for §4.4, DifferentialGeometry Layers 3 and 12 and the pinned Tau Ceti Reeb,
Jordan–Brouwer, invariance-of-domain and two-disc gluing theorems.

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
complex negative bundles/equivariant perfection; RiemannianGeometry R3 and the
Bott-periodicity path-space applications supply their own critical components
and Jacobi negative bundles.

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

The gradient is the pinned `TauCeti.Manifold.mgradient` (DifferentialGeometry
§12.2), with its flat-model comparison `TauCeti.Manifold.mgradient_eq_gradient`.
For a maximal negative-gradient trajectory of a C² function for a C¹ metric
the following are pinned (`Geometry/Manifold/Morse/{GradientFlow,ExponentialConvergence}`),
on top of the vector-space estimates of
`Analysis/Calculus/Morse/{GradientFlow,Convergence,Linearization,ExponentialConvergence}`:
smoothness and the energy identity along the trajectory; forward existence
when its forward part stays in a compact set
(`TauCeti.Ici_subset_maximalIntegralCurveInterval_neg_mgradient`);
criticality of its cluster points; convergence when that compact set holds
finitely many critical points
(`TauCeti.exists_tendsto_maximalIntegralCurve_neg_mgradient`) and the
corollary for proper Morse functions bounded below
(`TauCeti.IsMorse.exists_tendsto_maximalIntegralCurve_neg_mgradient`); the
manifold Łojasiewicz inequality `|f−f(p)|≤C‖grad f‖²` near a nondegenerate
critical point
(`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_mul_abs_sub_le_norm_mgradient_sq`);
exponential decay of the energy f(γ(t))−f(p), the tail-length bound by a
constant times its square root, and exponential decay of the Riemannian
distance to a nondegenerate limit
(`TauCeti.exists_riemannianEDist_le_mul_exp_maximalIntegralCurve_neg_mgradient`).
These estimates are for variable Riemannian metrics, do not assume the field
is an adapted pseudo-gradient, and allow the compact set to lie in a
noncompact manifold. A saddle limit does not require local positivity of
f−f(p), and an equilibrium is a trajectory with zero energy and tail length.

The headline `exists_compactTrapped_gradient_limit` takes a smooth metric,
a Morse function f, a curve γ satisfying the native negative Riesz-gradient
equation on [0,∞), and a compact K containing that forward image. It gives
p∈K with df_p=0, convergence γ(t)→p, and constants C,c>0 and T≥0 such that
for t≥T the intrinsic extended distance is at most C exp(−ct). This uses
`Manifold.riemannianEDist` directly, so no choice of an unrelated compatible metric
or conversion of infinite distance to a real number occurs. Its gradient
`rieszDual x (mvfderiv I f x)` is the body of `TauCeti.Manifold.mgradient I f x`.
The compact-M convergence case is Cohen–Iga–Norbury, Theorem 4.6, pp. 27–29;
compact trapping and the variable-metric exponential estimates are the pinned
extensions above. Beyond the pinned maximal-trajectory theorems, the headline's content is
that γ is an arbitrary curve on [0,∞): by uniqueness of integral curves of the
C¹ field −grad f it agrees on [0,∞) with the maximal integral curve through
γ(0), whose forward part is then trapped in K, and the Morse hypothesis
supplies finitely many critical points in K and a nondegenerate limit.

The owned API is the headline and its two consequences for an arbitrary
forward curve trapped in a compact set: a unique critical limit in K for Morse
f, and exponential decay of the extended distance to it after a finite entry
time. *Needs:* the pinned trajectory theorems above; the pinned
`TauCeti.IsMorse.finite_criticalPoints_inter`; Mathlib's uniqueness of
integral curves, `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff_boundaryless`.

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

RiemannianGeometry R3 uses the finite Morse/Bott attachments for
broken-geodesic and path-space applications. AffineMorseLefschetz
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
- J. Milnor, [*Sommes de variétés différentiables et structures différentiables
  des sphères*](https://numdam.org/articles/10.24033/bsmf.1538/), Bull. Soc. Math.
  France 87 (1959) 439–444: Theorem 1(3), p. 440, and Corollary 1, p. 442, for
  §4.4.
- M. Brown, [*A proof of the generalized Schoenflies theorem*](https://www.ams.org/journals/bull/1960-66-02/S0002-9904-1960-10400-4/S0002-9904-1960-10400-4.pdf),
  Bull. Amer. Math. Soc. 66 (1960) 74–76: Theorems 0–4, pp. 74–76, and
  Theorem 5, p. 76, the bicollared Schoenflies theorem owned in §4.4.
- Hirsch, *Differential Topology* (1976), Chapter 2, §1
  (strong topologies), and Chapter 6, Theorem 1.2 (strong Morse density),
  DOI 10.1007/978-1-4684-9449-5.
- Weber, [*Conley pairs in geometry – Lusternik–Schnirelmann theory and more*](https://www.math.stonybrook.edu/~joa/PUBLICATIONS/conblock.pdf),
  author version of arXiv:1709.05010: Theorem 1.1, p. 2, and its finite-cover
  proof, pp. 2–3. Numbering here refers to this author version.
- Thomas Mark, *Math240 Riemannian Geometry* (2001), Homework 11 (Morse–Bott examples).
  Bibliographic attribution only; the mathematical targets use the references above.
