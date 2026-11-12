# Roadmap: Sobolev maps between manifolds

**Summary.** Build the first-order Sobolev theory of maps from finite-dimensional manifolds to
Banach manifolds, intrinsic weak maps into finite-dimensional targets, and finite-dimensional
Jacobian and degree theory. The
roadmap extends the local Sobolev class from planar domains to Euclidean domains of every
dimension with Banach-valued functions, chain rules and change of variables; defines null sets,
measurability and local `Lᵖ` on a manifold without a metric; and defines the class `W^{1,p}_loc(M, N)` of
continuous maps whose chart representatives are Sobolev, with its weak differential
`Df(x) : T_xM → T_{f(x)}N`. It also defines the colocal weak differential of measurable maps
into finite-dimensional targets, through compactly supported scalar probes. Compatible
continuous tangent norms on source and target and a positive continuous source density give
the derivative-energy classes; for oriented
Riemannian manifolds of the same finite dimension it adds `J_f` and Hadamard's inequality.
It pulls back forms with fixed Banach coefficients on Banach targets along Sobolev
maps and proves that pullback commutes with the weak exterior derivative. It characterizes the
class through split immersions into Banach spaces (a Nash embedding is a finite-dimensional
special case), approximates continuous Sobolev maps into arbitrary smooth Banach targets by
successive chartwise smoothing, preserving the map near closed sets where it is already smooth,
and defines extrinsic spaces of possibly discontinuous maps using a fixed closed
embedding with a controlled retraction. It proves smooth density for these spaces when
`p ≥ dim M`, recovering Schoen–Uhlenbeck for compact finite-dimensional targets. The end theorems are:

- the class `W^{1,p}_loc(M, N)` does not depend on the atlases or the metrics, is local, contains
  the `C¹` maps with `Df = mfderiv f`, and is preserved by precomposition with `C¹` submersions
  and postcomposition with `C¹` maps, with the chain rule for `Df`;
- for continuous `f` with `W^{1,1}_loc` chart representatives, `f ∈ W^{1,p}_loc(M, N)` if and
  only if `‖Df‖ ∈ L^p_loc(M)` for compatible continuous tangent norms; for oriented Riemannian
  source and target of dimension `n`, `|J_f| ≤ ‖Df‖ⁿ`, so `J_f ∈ L¹_loc` for `p ≥ n`;
- for a `C¹` form `ω` of degree `k` with values in a fixed real Banach space and `p ≥ k + 1`,
  the pullback `f^♯ω` has weak exterior
  derivative `f^♯(dω)`;
- for a `C¹` split immersion `ι : N → F` into a Banach space, a continuous `f` lies
  in `W^{1,p}_loc(M, N)` if and only if `ι ∘ f` lies in `W^{1,p}_loc(M; F)`, with
  `‖D(ι ∘ f)‖ = ‖Df‖` when `ι` is isometric;
- continuous Sobolev maps into a smooth Banach manifold are limits of smooth maps, locally
  uniformly and in `W^{1,p}_loc` in target charts, for `p < ∞`; the approximants can agree with
  the map on a neighbourhood of a closed set where it is already smooth;
- measurable colocal weakly differentiable maps into finite-dimensional targets have a unique
  measurable weak differential; its local `Lᵖ` energy defines an intrinsic homogeneous class,
  agrees with the continuous class on continuous maps, and for compact targets and sources
  agrees with the extrinsic space, with the induced target norm;
- for closed finite-dimensional `M`, a target with a controlled retractive embedding `ι` (§10.1),
  and `dim M ≤ p < ∞`, smooth maps are dense in `W^{1,p}_ι(M, N)`; compact finite-dimensional
  targets satisfy these hypotheses and the space is independent of the embedding
  (Schoen–Uhlenbeck), while for `n − 1 ≤ p < n` the map `x ↦ x/|x|` of the unit ball of `ℝⁿ`
  is not a `W^{1,p}` limit of smooth maps into `S^{n−1}`;
- for closed connected oriented finite-dimensional `M`, `N` of dimension `n`, every
  `u ∈ W^{1,n}(M, N)` has an integer
  degree `∫_M u^♯ω` (`∫_N ω = 1`), locally constant on `W^{1,n}(M, N)`, equal to the topological
  degree when `u` is continuous; in particular `∫_M J_f = deg(f) vol(N)`.

## Scope and ownership

This roadmap owns:

- the local Lebesgue class `MemLpLoc` and the first-order local Sobolev class
  `W^{1,p}_loc(Ω; F)` with Banach `F` on open subsets of every finite-dimensional real normed
  space, with their Banach-valued API (§1.1–§1.2); they extend the planar classes of orders `0`
  and `1` of PseudoholomorphicCurveAnalysis §1.1 from `ℂ` to every such source (those are the
  case `E = ℂ`);
- the Euclidean chain rule for `C¹` outer maps with bounded derivative and arbitrary Sobolev
  inner maps, the continuity of the composition operator, the change of variables of the local
  class under `C¹` local diffeomorphisms and submersions, local mollification, Banach-valued
  Poincaré and Morrey estimates (Layer 2);
- on manifolds without a metric: the almost-everywhere filter, chart measurability and local
  `Lᵖ`, null preimages under submersions, and measures defined by positive continuous densities
  (Layer 3);
- the local class `W^{1,p}_loc(M; F)` of Banach-valued functions, the
  continuous class `W^{1,p}_loc(M, N)` for Banach targets, the weak differential, `C¹` members,
  restriction, locality, metric independence and the chain rules; colocal weak differentiability
  and its differential for measurable maps into finite-dimensional targets (Layer 4);
- compatible continuous tangent norms on source and target, `‖Df‖` and its `L^p` characterization,
  and intrinsic derivative-energy classes for colocal weak maps (Layer 5);
  the oriented Jacobian of a linear map and of a Sobolev map between manifolds of the same
  finite dimension, and Hadamard's inequality (Layer 6);
- the comparison of the class with its Euclidean form, with PseudoholomorphicCurveAnalysis §4.1
  and with the Sobolev sections of a trivial bundle over a compact manifold of
  PseudodifferentialOperators §5.2, including the first-order extension of that carrier to
  Banach fibres (Layer 7);
- the pullback of forms with fixed Banach coefficients, the Bochner extension of top-form
  integration and Stokes needed for testing their weak exterior derivative, and commutation of
  pullback with that derivative (Layer 8);
- the characterization through split immersions, smooth retractive embeddings and their
  compact Euclidean and Hilbert-sphere examples, and smooth approximation of continuous Sobolev
  maps into arbitrary smooth Banach targets, including relative approximation (Layer 9);
- the extrinsic space `W^{1,p}_ι(M, N)` on compact finite-dimensional `M` for a closed embedding
  with a controlled retraction, comparison under controlled changes of embedding, Morrey's
  theorem and smooth density, including Schoen–Uhlenbeck for compact finite-dimensional targets
  and comparison with intrinsic weak maps for compact finite-dimensional targets (Layer 10);
- the integral formula for the degree of a continuous `W^{1,n}` map, the degree of a `W^{1,n}`
  map, and the failure of density for `n − 1 ≤ p < n` at `x/|x|` (Layer 11).

It leaves to named owners:

- **PDE** Layer 1 owns the Euclidean scalar spaces `W^{k,p}(Ω)`, Poincaré inequalities, Morrey's
  theorem and density; Tau Ceti implements the parts consumed here (Exact supplier contracts).
- **PseudoholomorphicCurveAnalysis** PH1 owns the planar classes on planar domains and
  half-discs and their higher-order theory (embeddings, products, composition of order `k ≥ 2`,
  reflection, local compactness), and PH4.1 owns `W^{k,p}_loc(Σ, M)` for maps from a Riemann
  surface with `kp > 2`. §1.1 defines the classes of PH1.1 of orders `0` and `1` over every
  finite-dimensional source, PH1.1's being the case `E = ℂ`, and §7.2 proves that PH4.1's class
  at `k = 1` is this roadmap's class on surfaces.
- **PseudodifferentialOperators** §5.2 owns the Banach space of `W^{k,p}` sections of a vector
  bundle over a compact base, its finite-chart norms and its smooth density.
  **Yamabe** Y1 owns the scalar closed-manifold carriers used for the Yamabe problem. This roadmap
  builds no second carrier: §7.3 extends the §5.2 carrier at first order to trivial bundles
  with Banach fibre, identifies this roadmap's class on a compact manifold with it, and Layer 10
  uses it. Higher-order and nontrivial Banach bundles are outside this roadmap.
- **RiemannianGeometry** R4.6 owns the agreement of chartwise null sets with null sets of the
  Riemannian volume of a smooth metric (§3.1 proves it for every positive continuous density,
  which covers continuous metrics), and R6 owns the nearest-point retraction onto the image of
  a closed-image `C²` embedding into a Euclidean space.
- **DifferentialGeometry** owns orientations (2.1–2.2), integration of forms and Stokes' theorem
  (Layer 5), the Riemannian volume (12.4) and the degree of smooth and continuous maps with its
  integral formula and homotopy invariance (10.3–10.5). §8.2 here extends its existing scalar
  top-form integration and boundaryless Stokes API to fixed Banach coefficients in place.
- **QuasiregularMaps** owns the membership of locally Lipschitz maps between finite-dimensional
  manifolds in the class (its §2.8), the
  classes `ACL` and `ACL^p` and the theorem that continuous `ACL^p` maps are the continuous
  `W^{1,p}_loc` maps on Euclidean domains (its §5.1–§5.2), and everything about distortion.
- **GeometricMeasureTheory** owns the area and coarea formulas for Lipschitz maps.

Outside this roadmap: Sobolev classes of order `k ≥ 2` or fractional order, of functions on
Euclidean domains and of maps between manifolds;
Sobolev maps on manifolds with boundary, traces and extension of Sobolev maps; Bethuel's density
theorem for `p < dim M` and the homotopy theory of `W^{1,p}(M, N)`; lifting; Nash's isometric
embedding theorem; harmonic maps and the calculus of variations for maps between manifolds;
Sobolev spaces of differential forms; Lusin's condition (N) and the area formula for Sobolev
maps; mappings of finite distortion; Sobolev theory on infinite-dimensional sources; weak
Riemannian metrics; general Lipschitz composition in Banach targets and its Radon–Nikodým
characterization; existence of embeddings or tubular retractions for arbitrary Banach manifolds.
The colocal theory is for finite-dimensional targets; a replacement for its compactly supported
probes on Banach targets, variable coefficient bundles with connections, and intrinsic metrics
and completeness of the full space of weak maps are outside this roadmap.

## Conventions

- **Exponents.** `p : ℝ≥0∞` with `1 ≤ p ≤ ∞`. A statement that needs `p < ∞` says so.
- **Euclidean domains.** `E` is a finite-dimensional real normed space of dimension `n` with its
  Borel σ-algebra and an additive Haar measure `volume` (`[MeasureSpace E] [BorelSpace E]
  [volume.IsAddHaarMeasure]`). The standard instance is an inner product space with Lebesgue
  measure (Mathlib's `measureSpaceOfInnerProductSpace`), for instance `EuclideanSpace ℝ (Fin n)`
  for `ℝⁿ`; no inner product on `E` is used, since tangent norms are separate data (Layer 5).
  Tau Ceti suppliers stated on inner product spaces apply through a continuous linear
  equivalence `E ≃L[ℝ] EuclideanSpace ℝ (Fin n)`, which carries `volume` to a positive multiple
  of Lebesgue measure. `F`, `G` are
  real Banach spaces (`NormedSpace ℝ` and `CompleteSpace`). No separability assumption on the
  target space is needed: integrability and weak derivatives use Bochner integrals and
  `AEStronglyMeasurable`, including its essentially separably valued condition. An open set is a
  `TopologicalSpace.Opens E`. A function on
  `Ω` is a function `E → F` whose values off `Ω` play no role, as in `TauCeti.HasWeakFDerivOn`.
  Every class below is independent of the Haar measure used (Check in §1.1).
- **Manifolds.** Source manifolds `M`, `M'` are Hausdorff, second countable and boundaryless,
  modelled on finite-dimensional real normed spaces `E` as above, with `IsManifold 𝓘(ℝ, E) 1 M`.
  Targets `N`, `P` are Hausdorff boundaryless manifolds modelled on real Banach spaces `E'`, `E''`,
  with `IsManifold 𝓘(ℝ, E') 1 N`; second countability of targets is not required. Layers 8–11
  use smooth manifolds. Whenever a target is used as a source, it must meet the source
  assumptions for that statement; smooth postcomposition and forms on `N` require no source
  measure on `N`. Layer 6 and Layer 11 explicitly require finite-dimensional targets.
  Sections 4.7–4.8, 5.4 and 10.4 additionally require finite-dimensional second-countable
  targets for their countable families of compactly supported probes.
  Charts are the preferred extended charts
  `extChartAt`; the *chart representative* of `f : M → N` at `x` is Mathlib's
  `writtenInExtChartAt 𝓘(ℝ, E) 𝓘(ℝ, E') x f`, on the open set
  `Ω_x(f) = (extChartAt x).target ∩ (extChartAt x).symm ⁻¹' (f ⁻¹' (extChartAt (f x)).source)`.
  A statement for every chart of the maximal atlas is equivalent (§4.2).
- **Almost everywhere.** A set `s ⊆ M` is null when it is `TauCeti.IsNullSet 𝓘(ℝ, E) s`. This
  needs no metric and no measurable structure on `M`; "almost everywhere" on `M` refers to these
  null sets (§3.1), and agrees with every positive continuous density measure (§3.1), including
  `TauCeti.riemannianVolume` for every continuous metric.
- **Metrics, norms and densities.** Source and target carry compatible continuous tangent
  norms as specified in §5.1; continuous Finsler norms and strong continuous Hilbert metrics
  are examples. Source integration uses a positive continuous density measure `μ` (§3.1),
  chosen independently of the tangent norm. A continuous Riemannian metric, Mathlib's
  `Bundle.RiemannianBundle` with `IsContinuousRiemannianBundle`, supplies the norm and
  `TauCeti.riemannianVolume` as a specialization. Norms of differentials are operator norms for
  the two tangent norms. No volume on
  `N` is used outside the finite-dimensional Jacobian and degree theory. A second Riemannian
  metric on a finite-dimensional manifold is carried by `TauCeti.WithMetric`.
  `L^p` norms on `M` are for `μ`, with Riemannian volume used when explicitly stated.
- **Continuity.** `W^{1,p}_loc(M, N)` consists of continuous maps, as in Rickman (Ch. I),
  Hajłasz–Iwaniec–Malý–Onninen and Heikkilä–Pankka in finite dimensions. The colocal predicates
  of §4.7–§4.8 apply to measurable maps into finite-dimensional targets. Their norm-dependent
  local homogeneous class is written `Ẇ^{1,p}_loc(M, N)` (§5.4); it is distinct from the
  continuous class. Layer 10 also treats possibly discontinuous maps through a specified
  embedding of `N`; those have continuous
  representatives for `p > dim M` (§10.2), while for `p ≤ dim M` continuity is a restriction.
- **Orientations and Jacobians.** An orientation of `M` is `TauCeti.Manifold.Orientation 𝓘(ℝ, E)
  M (Fin n)`, with tangent orientation `o.orientationAt x`. For a linear map `A : V → W` between
  oriented inner product spaces of one dimension `n`, `J(A)` is determined by
  `o_W.volumeForm (A v₁, …, A vₙ) = J(A) · o_V.volumeForm (v₁, …, vₙ)` (§6.1). Reversing exactly one
  orientation negates `J`; witness: the identity `(ℝ², std) → (ℝ², −std)` has `J = −1`.
- **Forms.** A form has values in a fixed real Banach space `V` and uses
  `TauCeti.RoughForm 𝓘(ℝ, E) M V k`, a continuous alternating multilinear map on each tangent
  space; its coefficients vary continuously when the form is
  called continuous. This definition also applies to Banach targets. The pointwise norm of a
  `k`-form at `y` is its operator norm for the chosen tangent norm (the comass), so
  `|A^*α| ≤ ‖A‖^k |α|` for every linear `A`.
  Wedges use a specified bounded bilinear coefficient pairing; weak testing wedges a
  `V`-valued form with a scalar test form. Oriented top-form integration uses the form itself
  and does not depend on the auxiliary positive density `μ`.
- **Source dimension.** Finite-dimensional sources supply Haar measures, chart-invariant
  null sets and compactly supported test functions. Infinite-dimensional Banach spaces have no
  nonzero continuous compactly supported test functions and no nonzero locally finite
  translation-invariant Borel measure in the separable case. Gaussian Sobolev theories require
  different measure and derivative data and are outside the scope here.
- **Lean names.** The names below are suggestions; `Suggested.lean` states the signatures in the
  namespace `TauCetiRoadmap.SobolevMapsBetweenManifolds`.

## Exact supplier contracts

The [Mathlib discussion of Sobolev interfaces](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/near/625821807)
distinguishes the Euclidean and manifold interfaces. This roadmap keeps Euclidean weak
derivatives directly usable and compares them with its manifold predicates in Layer 7.

### From Mathlib

- `MeasureTheory.MemLp`, `MeasureTheory.LocallyIntegrableOn`, `MeasureTheory.AEStronglyMeasurable`
  `measureSpaceOfInnerProductSpace` and `MeasureTheory.Measure.IsAddHaarMeasure`.
- `MeasureTheory.addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero` and
  `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`
  (`Mathlib/MeasureTheory/Function/Jacobian.lean`): differentiable images of null sets are null,
  and the change of variables formula.
- `extChartAt`, `writtenInExtChartAt`, `mfderiv`, `ContMDiff`, `IsManifold`, and
  `TopologicalSpace.Opens` as a charted space.
- `Manifold.IsSubmersionAt` (`Mathlib/Geometry/Manifold/Submersion.lean`), the local chart
  normal form of a projection with a continuous linear complement. §2.5 and §4.6 use this
  predicate. Mathlib has no conversion from a surjective differential to
  `Manifold.IsSubmersionAt`; §2.5 proves the finite-dimensional one from the inverse function
  theorem.
- `Manifold.IsImmersionAt` (`Mathlib/Geometry/Manifold/Immersion.lean`), with
  `ContMDiffAt.iff_comp_isImmersionAtOfComplement` as the smooth pattern of §9.1. This is the
  chart-normal-form notion of a split immersion, not just injectivity of the differential.
  `Manifold.IsDiffImmersionAt` says that the differential has a continuous linear left inverse;
  `IsDiffImmersionAt.of_injective_of_finiteDimensional` (`Mathlib/Geometry/Manifold/ImmersionDiff.lean`):
  an injective differential with finite-dimensional ambient model has such a left inverse.
  §9.1 uses `IsImmersionAt` directly and derives the finite-dimensional injective-differential
  corollary using the inverse function theorem and a complement.
- `exists_embedding_euclidean_of_compact` (`Mathlib/Geometry/Manifold/WhitneyEmbedding.lean`):
  a compact smooth manifold embeds in a Euclidean space.
- `SmoothPartitionOfUnity` and `Continuous.exists_contMDiff_approx`
  (`Mathlib/Geometry/Manifold/SmoothApprox.lean`). Only source cutoffs and Banach-valued
  local smoothing are consumed here; intrinsic relative Sobolev approximation into an arbitrary
  Banach manifold is a target of §9.3, not a consequence supplied by these declarations alone.
- `Orientation.volumeForm`, `Orientation.volumeForm_robust`, `Orientation.volumeForm_neg_orientation`,
  `Orientation.abs_volumeForm_apply_le` (`Mathlib/Analysis/InnerProductSpace/Orientation.lean`);
  `LinearMap.det`; `LinearMap.normDet` and `LinearMap.normDet_eq_abs_det`
  (`Mathlib/Analysis/InnerProductSpace/NormDet.lean`).
- `Bundle.RiemannianBundle`, `IsContinuousRiemannianBundle`.
  These supply the Riemannian source specialization and the strong Hilbert special case of
  §5.1; the compatible continuous tangent-norm API is built in §5.1 for both source and target.

### From Tau Ceti

- `TauCeti.HasWeakFDerivOn` and, in `TauCeti/Analysis/Sobolev/WeakDeriv/`:
  `TauCeti.HasWeakFDerivOn.ae_eq`, `.mono`, `.congr_ae_deriv`,
  `TauCeti.hasWeakFDerivOn_of_differentiableOn` (`Basic.lean`); detection on relatively compact
  subdomains `TauCeti.hasWeakFDerivOn_iff_forall_isCompact_closure` (`Local.lean`); the
  classical derivative of a continuous function with a continuous weak derivative,
  `TauCeti.HasWeakFDerivOn.fderiv_eq_of_continuousOn` and
  `TauCeti.HasWeakFDerivOn.contDiffOn_succ` (`Classical.lean`); closedness under
  `L¹_loc` limits `TauCeti.hasWeakFDerivOn_of_tendsto_lintegral_enorm_sub` (`Limit.lean`).
  In `TauCeti/Analysis/Sobolev/Mollification/`: mollification
  `TauCeti.HasWeakFDerivOn.fderiv_convolution_right` (`Basic.lean`)
  and `TauCeti.HasWeakFDerivOn.fderiv_indicator_convolution_normed` (`Interior.lean`).
- `TauCeti.W1p`, `TauCeti.W1p.hasWeakFDerivOn_comp` (`W1p/ChainRule.lean`, scalar outer maps),
  `TauCeti.W1p.continuousOn_preciseRepresentative` (`W1p/InteriorMorrey.lean`, Morrey for
  `p > n`), `TauCeti.Wkp.dense_contDiffOn_representatives` (`Wkp/MeyersSerrin.lean`), and the
  Poincaré inequalities on balls under `TauCeti/Analysis/Sobolev/Poincare/`. The scalar estimates
  are suppliers; §2.3–§2.4 build their Banach-valued local versions, and §7.3 supplies the
  Banach-valued first-order carrier comparison. No finite-coordinate argument is a supplier for
  an infinite-dimensional target.
- `TauCeti.IsNullSet`, `TauCeti.IsNullSet.chartwise`, `TauCeti.IsNullSet.iUnion`,
  `TauCeti.IsNullSet.interior_eq_empty` (`TauCeti/Geometry/Manifold/Measure.lean`).
- `TauCeti.riemannianVolume`, `TauCeti.isLocallyFiniteMeasure_riemannianVolume`
  (`…/Riemannian/VolumeDensity/Volume.lean`), `TauCeti.isOpenPosMeasure_riemannianVolume`
  (`…/VolumeDensity/Support.lean`), `TauCeti.riemannianVolumeForm` (`…/Riemannian/VolumeForm.lean`),
  `TauCeti.WithMetric` (`…/Riemannian/WithMetric.lean`).
- `TauCeti.Manifold.Orientation`, `.orientationAt`, `.model`
  (`TauCeti/Geometry/Manifold/Orientation/Basic.lean`).
- `TauCeti.RoughForm`, `TauCeti.mpullback` (`…/DifferentialForm/Pullback/Basic.lean`),
  `TauCeti.mextDeriv` (`…/DifferentialForm/ExtDeriv.lean`), `TauCeti.bundleWedgeWith`
  (`…/DifferentialForm/Wedge/Basic.lean`), `TauCeti.IntegrableTopForm`, `TauCeti.integralTopForm`
  (`…/DifferentialForm/Integration/TopForm.lean`), `TauCeti.integralTopForm_mextDeriv_eq_zero`
  (`…/Integration/BoundarylessStokes.lean`). `RoughForm`, `mpullback` and `mextDeriv` already
  allow fixed general coefficients. The listed top-form integral and Stokes API is scalar;
  §8.2 supplies its Bochner-valued extension, compact-support integrability API and
  compatibility with continuous linear coefficient maps.
- `TauCeti.degreeAtRegularValue` (`TauCeti/Geometry/Manifold/Degree/Basic.lean`), the signed
  count over a regular value of a `C¹` map, from which DifferentialGeometry 10.3–10.5 builds
  the degree.
- `TauCeti.exists_isTubularNeighborhood_normalBundle`
  (`TauCeti/Geometry/Manifold/TubularNeighborhood/Euclidean.lean`).

### From other roadmaps

- **PDE** Layer 1: §1.2 (density), §1.4 (Morrey), §1.5 (Poincaré on balls), through the Tau
  Ceti declarations above.
- **PseudoholomorphicCurveAnalysis** PH1.1 (the planar classes, generalized in §1.1) and PH4.1
  (the surface class, compared in §7.2).
- **PseudodifferentialOperators** §5.2: the `W^{k,p}` section carrier of a vector bundle over a
  compact base, its finite-chart norms, completeness and smooth density for `p < ∞`.
- **RiemannianGeometry** R4.6 (chartwise and Riemannian null sets, for smooth metrics) and R6
  (the nearest-point retraction `π` onto a closed-image `C²` embedded submanifold of a Euclidean
  space, defined on an open tube, `C¹` for `C²` embeddings and smooth for smooth ones).
- **DifferentialGeometry** 2.1–2.2 (orientations), Layer 5 (integration of top forms and the
  boundaryless Stokes theorem), 12.4 (Riemannian volume), 10.4 (the integral formula
  `∫_M f^*ω = deg f · ∫_N ω` for smooth maps of closed oriented manifolds and smooth `ω`) and
  10.5 (the degree of continuous maps and its homotopy invariance).

## How to read the build

Layers 1–2 are Euclidean. Layer 3 sets up measure theory on a manifold without a metric. Layer 4
defines the classes and the weak differential and proves the chain rules; it needs only Layers
1–3. Layer 5 adds compatible tangent norms; Layer 6 specializes to equal finite dimensions
and adds orientations. Layer 7 compares the class with the other
Sobolev classes in the library. Sections 4.7–4.8 add colocal weak differentiation, and §5.4
adds its norm-dependent intrinsic energy classes. Layer 8 pulls back Banach-valued forms.
Layer 9 characterizes maps through immersions, supplies retraction examples, and proves
intrinsic relative smooth approximation. Layer 10 defines extrinsic spaces of
possibly discontinuous maps under quantitative retraction hypotheses. Layer 11 is the
finite-dimensional degree theory.

Layer 2 needs Layer 1; Layer 3 uses §2.2 and §2.5. Layer 4 needs Layers 2 and 3,
including §2.6's locality on measurable equality sets for the colocal construction;
Layer 5 needs Layer 4; Layer 6 needs Layer 5. Layer 7 needs Layers 4–5, with §6.2 used only for
the Jacobian comparison. Layer 8 needs Layers 4–5 and §2.3, with §6.2 used only for its volume-form
specialization. Layer 9 needs Layers 4–5 and §2.3; §9.3 does not depend on §9.1–§9.2.
Layer 10 needs Layers 7 and 9 and §2.4, with §5.4 used in §10.4. Layer 11
needs §6.3 and Layers 8–10.

## Layer 1: local classes on Euclidean domains

### 1.1 Local Lebesgue and Sobolev classes

Define for `E` the classes of orders `0` and `1` that PseudoholomorphicCurveAnalysis §1.1 plans
for `ℂ`, with Banach-valued codomain: `MemLpLoc p U u` (for `u : E → F`, `u ∈ Lᵖ(K)` for every
compact `K ⊆ U`) and the first-order class `W^{1,p}_loc(Ω; F)` of §1.2 (Arendt–Kreuter, §2,
pp. 2–3, for the global first-order Bochner space on an open subset of `ℝᵈ`). The planar
classes of orders `0` and `1` are the case `E = ℂ`. Prove for `E` the API that
PseudoholomorphicCurveAnalysis §1.1 lists for `ℂ`, at these two orders: closure under addition,
scalar multiplication, continuous linear maps `F →L[ℝ] G` and restriction to smaller opens;
the sheaf property for open covers; coordinates in a finite basis when `F` is finite-dimensional;
for `F = ℝ` and `E` an inner product space with Lebesgue measure, agreement of the first-order
class with `TauCeti.W1p volume W p` on every relatively compact open `W` with closure in `Ω`.
Prove in addition:

- `MemLpLoc p Ω u` implies `MemLpLoc q Ω u` for `q ≤ p`, and implies local integrability for
  `p ≥ 1`;
- strong measurability and the required norm integrability are part of membership; testing
  scalar compositions alone does not define Banach-valued membership;
- continuous functions on `Ω` are `MemLpLoc p Ω` for every `p`;
- the classes are unchanged if `volume` is replaced by any additive Haar measure on `E`, and
  are carried to the classes of `E₁` by every continuous linear equivalence `E ≃L[ℝ] E₁`.

**Checks.**

- At `E = ℂ` the classes are the planar ones of PseudoholomorphicCurveAnalysis §1.1 of orders
  `0` and `1`: `z ↦ |z|` lies in `W^{1,p}_loc(ℂ; ℝ)` for every `p`, while `z ↦ z/|z|` lies in
  `W^{1,p}_loc(ℂ; ℂ)` exactly for `p < 2`, since its derivative has norm `1/|z|` and
  `∫_{|z|<1} |z|^{−p}` is finite exactly for `p < 2`.
- The identity of `E` lies in `W^{1,p}_loc(E; E)` for all `p`, and not in `Lᵖ(E)` for any
  `p < ∞` when `n ≥ 1`: the class is local.
- For `n = 3`, `u(x) = |x|^{−1}` lies in `MemLpLoc p ℝ³` exactly for `p < 3`.
- Haar independence: `2 · volume` has the same null sets and the same `Lᵖ(K)` functions.
- A model norm that is not an inner product norm: `ℝ²` with the norm `max(|y₁|, |y₂|)` and
  its product Lebesgue measure has the classes of `EuclideanSpace ℝ (Fin 2)`, through the
  identity linear equivalence.
- `F = ℓ²`: `u(x) = a(x) v` for a scalar Sobolev `a` and fixed `v ∈ ℓ²` is a member with
  derivative `h ↦ Da(x)(h) v`; no basis of the target is used.

*Needs:* Tau Ceti `TauCeti.HasWeakFDerivOn`,
`TauCeti.hasWeakFDerivOn_iff_forall_isCompact_closure`, `TauCeti.W1p`; Mathlib
`MeasureTheory.MemLp`.

### 1.2 The first-order class `W^{1,p}_loc(Ω; F)`

Write `W^{1,p}_loc(Ω; F)` (`MemW1pLoc p Ω u`) for the first-order class of §1.1: `u ∈ MemLpLoc p Ω`
and some `Du : E → E →L[ℝ] F` with `TauCeti.HasWeakFDerivOn volume Ω u Du` lies in
`MemLpLoc p Ω`. Prove:

- the weak derivative of a member is unique almost everywhere on `Ω` (`TauCeti.HasWeakFDerivOn.ae_eq`),
  and the `MemLpLoc` condition on it does not depend on the choice;
- `W^{1,p}_loc(Ω; F) ⊆ W^{1,q}_loc(Ω; F)` for `q ≤ p`;
- a function differentiable on `Ω` with continuous derivative lies in the class for every `p`,
  with `Du = fderiv ℝ u` (`TauCeti.hasWeakFDerivOn_of_differentiableOn`);
- for continuous `u`, the condition `u ∈ MemLpLoc p Ω` is automatic, so `u` is in the class iff it
  has a weak derivative in `MemLpLoc p Ω`;
- the class is a sheaf: membership on every set of an open cover of `Ω` gives membership on `Ω`
  (`memW1pLoc_iSup_iff`). Route: weak derivatives on two sets of the cover agree almost
  everywhere on their overlap (`TauCeti.HasWeakFDerivOn.ae_eq`), so those of a countable
  subcover glue to one field; the compact support of a test function meets finitely many sets
  of the subcover, and a smooth partition of unity subordinate to them splits its test identity
  (with `TauCeti.hasWeakFDerivOn_iff_forall_isCompact_closure` for the reduction to relatively
  compact subdomains).

On an open `U` with compact closure in `Ω`, write convergence in `W^{1,p}(U; F)` for
convergence of the functions and weak derivatives in their Bochner `Lᵖ` norms. This is a
condition on representatives, independent of almost-everywhere choices. The complete quotient
carrier and its identification with the bundle carrier are built in §7.3.

**Checks.**

- `u(x) = ‖x‖` on `E` lies in the class for every `p`, with `‖Du‖ ≤ 1` almost everywhere. For
  an inner product norm `Du(x) = ⟨x/‖x‖, ·⟩` off `0`; for the norm `max(|x₁|, |x₂|)` on `ℝ²`,
  `Du(x) = sign(x₁) dx₁` where `|x₁| > |x₂|` and `sign(x₂) dx₂` where `|x₂| > |x₁|`. The inner
  product formula is wrong for that model: at `x = (1, 1/2)`, `Du(x)(0, 1) = 0`, while
  `⟨x/|x|, (0, 1)⟩ ≠ 0`.
- `u(x) = log |x|` on `ℝ²` lies in `W^{1,p}_loc` exactly for `p < 2` (`|Du| = 1/|x|`) and is not
  continuous at `0`: the Euclidean class does not require continuity.
- The indicator of a half-space lies in `MemLpLoc p` for every `p` and in no `W^{1,p}_loc`.

*Needs:* §1.1; Tau Ceti `TauCeti.HasWeakFDerivOn.ae_eq`, `TauCeti.hasWeakFDerivOn_of_differentiableOn`,
`TauCeti.hasWeakFDerivOn_iff_forall_isCompact_closure`; Mathlib smooth partitions of unity.

### Examples

Linear and affine maps; `|x|^α x` for `α > −1` at the exponents where `|x|^α ∈ Lᵖ_loc`;
`x ↦ x/|x|` on `ℝⁿ`, `n ≥ 2`, in `W^{1,p}_loc` exactly for `p < n`.

### Dependencies

Tau Ceti Sobolev files listed under Exact supplier contracts. No other layer.

## Layer 2: Euclidean calculus of the local class

### 2.1 Chain rules and the composition operator

Prove, for `Ω ⊆ E` open and `u ∈ W^{1,p}_loc(Ω; F)`:

- (a) *Continuous inner maps.* If `u` is continuous on `Ω`, `W ⊆ F` is open, `u(Ω) ⊆ W` and
  `g : F → G` is `C¹` on `W`, then `g ∘ u ∈ W^{1,p}_loc(Ω; G)` with `D(g ∘ u) = dg(u) ∘ Du`
  almost everywhere (`MemW1pLoc.comp_contDiffOn`). No bound on `dg` is assumed: `dg ∘ u` is
  bounded on compact subsets of `Ω` because `u` is continuous. Route: on an open `U` with
  compact closure in `Ω`, the mollifications `u * ρ_ε` of §2.3 converge to `u` uniformly on `U`
  and in `W^{1,1}(U)`; for small `ε` they stay within a fixed distance of the compact set
  `u(closure U)`, where `dg` is bounded, and `dg ∘ (u * ρ_ε) → dg ∘ u` uniformly on `U` by
  continuity of `dg` along that compact set. The classical chain rule for `g ∘ (u * ρ_ε)` and
  `TauCeti.hasWeakFDerivOn_of_tendsto_lintegral_enorm_sub` pass to the limit.
- (b) *Bounded derivative.* If `g : F → G` is `C¹` with `sup ‖dg‖ < ∞`, then
  `g ∘ u ∈ W^{1,p}_loc(Ω; G)` with the same formula, for every `u` in the class
  (Arendt–Kreuter, Thm 4.2, p. 9, for Lipschitz outer maps on bounded domains). Route:
  mollify (§2.3), apply (a) to the mollifications, and pass to the limit with
  `TauCeti.hasWeakFDerivOn_of_tendsto_lintegral_enorm_sub`, using dominated convergence along an
  almost everywhere convergent subsequence.
- (c) *Continuity.* Under (b), if `u_j → u` in `W^{1,p}(U)` for an open `U` with compact closure
  in `Ω` and `p < ∞`, then `g ∘ u_j → g ∘ u` in `W^{1,p}(U)` (dominated convergence along almost
  everywhere convergent subsequences). For `p = ∞`, prove this when `dg` is uniformly continuous
  on bounded subsets of `F`, and also when `u` has essentially relatively compact range. In the
  latter case continuity of `dg` near that compact set and `L^∞` convergence suffice. A bounded
  subset of an infinite-dimensional Banach space need not be relatively compact.
- (d) *Local composition convergence.* If `u_j`, `u` are continuous Sobolev maps, converge
  locally uniformly and in `W^{1,p}_loc` with `p < ∞`, and take values in an open `W ⊆ F`,
  then for any `C¹` map `g : W → G` the compositions converge locally uniformly and in
  `W^{1,p}_loc`. On each compact source set, continuity of `dg` gives boundedness and uniform
  control near the compact image of `u`; local uniform convergence places all sufficiently
  late `u_j` in that neighbourhood. This conclusion requires no uniform continuity of `dg`
  on arbitrary bounded subsets of `F`.

The chain rules are for `C¹` outer maps. They require no Radon–Nikodým property. General
Lipschitz outer maps are not covered by replacing `C¹` with `Lipschitz` in these statements.

**Checks.**

- (a) without continuity fails: `g(y) = y²` and `u(x) = |x|^{−1/4}` on `ℝ²`: `u ∈ W^{1,p}_loc`
  for `p < 8/5`, while `D(u²) ≈ |x|^{−3/2}` lies in `L^p_loc` only for `p < 4/3`.
- (b) at `g = id` is the identity; at `F = G = ℝ` it is Tau Ceti's scalar
  `TauCeti.W1p.hasWeakFDerivOn_comp` on relatively compact subsets.
- (c) for `g = sin`, `F = G = ℝ` and `u_j = u + 1/j`: `sin(u_j) − sin(u)` and
  `cos(u_j) Du − cos(u) Du` tend to `0` in `Lᵖ(U)`.
- For a bounded linear map `g : F →L[ℝ] G`, composition is continuous for every `p`, including
  `∞`, on arbitrary Banach targets.

*Needs:* §1.2, §2.3; Tau Ceti `TauCeti.hasWeakFDerivOn_of_tendsto_lintegral_enorm_sub`; Mathlib's
chain rule for Fréchet derivatives.

### 2.2 Change of variables

For open `Ω, Ω' ⊆ E` and `Φ : E → E` that is `C¹` on `Ω'` with invertible derivative at every
point and `Φ(Ω') ⊆ Ω`, prove that `u ∈ MemLpLoc p Ω` gives `u ∘ Φ ∈ MemLpLoc p Ω'` and
`u ∈ W^{1,p}_loc(Ω; F)` gives `u ∘ Φ ∈ W^{1,p}_loc(Ω'; F)` with `D(u ∘ Φ) = Du(Φ) ∘ dΦ` almost
everywhere (`MemW1pLoc.comp_contDiffOn_diffeo`; Ziemer, Thm 2.2.2, for bi-Lipschitz maps).
Prove that `Φ` and its local inverses carry null sets to null sets and
`AEStronglyMeasurable` functions to `AEStronglyMeasurable` functions. No global bound on `dΦ` or
`dΦ⁻¹` is assumed: on a compact `K ⊆ Ω'` both are bounded. `Φ` need not be injective, since
the statements are local. Route: by the inverse function theorem `Φ` restricts to a `C¹`
diffeomorphism on a ball around each point of `Ω'`, and the class is a sheaf (§1.2); on such a
ball, compose the mollifications of §2.3 with `Φ`, use the classical chain rule and the change
of variables formula with `|det dΦ|` bounded above and below, and pass to the limit with
`TauCeti.hasWeakFDerivOn_of_tendsto_lintegral_enorm_sub`.

**Checks.**

- `Φ(x) = 2x`: `‖u ∘ Φ‖_{Lᵖ(K)} = 2^{−n/p} ‖u‖_{Lᵖ(2K)}` and `D(u ∘ Φ)(x) = 2 Du(2x)`.
- `Φ(x) = eˣ` from `Ω' = ℝ` to `Ω = (0, ∞)`: `dΦ` is unbounded on `Ω'` and the statement still
  holds, because it is local.
- `Φ(z) = z²` on `Ω' = Ω = ℂ ∖ {0}` is not injective (`Φ(1) = Φ(−1)`), its derivative
  `h ↦ 2zh` has determinant `4|z|² ≠ 0`, and `D(u ∘ Φ)(z) = Du(z²) ∘ (h ↦ 2zh)`: an injectivity
  hypothesis would exclude this covering map.

*Needs:* §1.2, §2.3; Tau Ceti `TauCeti.hasWeakFDerivOn_of_tendsto_lintegral_enorm_sub`; Mathlib
the inverse function theorem,
`MeasureTheory.addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero`,
`MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`.

### 2.3 Local mollification

For `u ∈ W^{1,p}_loc(Ω; F)`, a standard mollifier `ρ_ε` and an open `U` with compact closure in
`Ω`, prove that `u * ρ_ε` is smooth on `U` for small `ε`, that `D(u * ρ_ε) = Du * ρ_ε` there, and
for `p < ∞` that `u * ρ_ε → u` in `W^{1,p}(U)`. If `u` is continuous on `Ω` then
`u * ρ_ε → u` uniformly on `U`. These are Bochner convolutions in `F` and `E →L[ℝ] F`.
Build the Banach-valued Poincaré inequality on balls by the segment-integral proof and Minkowski's
inequality, with constants depending on the source dimension, not the target dimension; use
mollification to pass from smooth functions to the weak class. Prove the oscillation bound:
for `x ∈ U` and small `ε`,
`⨍_{B_ε(x)} |u(z) − (u * ρ_ε)(x)| dz ≤ C(n, ρ) ε^{1 − n/p} ‖Du‖_{Lᵖ(B_ε(x))}` (Poincaré on balls),
which at `p = n` is `C ‖Du‖_{Lⁿ(B_ε(x))}` (Hajłasz 2009, (2.1), p. 188).

**Checks.**

- `u(x) = |x|` on `ℝ`: `u * ρ_ε` is smooth, equal to `|x|` for `|x| ≥ ε`, and its derivative
  converges to `sign x` in `L^p_loc` for `p < ∞` but not in `L^∞`.
- At `p = n` the right side of the oscillation bound does not depend on `ε` explicitly and tends
  to `0` with `ε` by absolute continuity of the integral: this is the VMO estimate used in §10.3.

*Needs:* §1.2; Tau Ceti `TauCeti.HasWeakFDerivOn.fderiv_convolution_right`,
`TauCeti.HasWeakFDerivOn.fderiv_indicator_convolution_normed`, the Poincaré inequalities on
balls (PDE §1.5).

### 2.4 Banach-valued Morrey estimates

For `p > n` and `u ∈ W^{1,p}_loc(Ω; F)`, prove the interior Morrey estimate on balls and the
existence of a locally Hölder continuous representative (locally Lipschitz when `p = ∞`;
`MemW1pLoc.exists_continuousOn_ae_eq` for the continuous representative). For
finite `p`, the exponent is `1 − n/p`. Use the scalar Morrey estimate through a countable
norming family of functionals on the separable closed subspace containing the essential ranges
of `u` and its finitely many partial derivatives (Arendt–Kreuter, Thm 6.2, p. 17, transfers a
scalar Hölder estimate of this form to `F`-valued functions). Equivalently, give the Banach-valued
segment-integral proof. Prove the local estimate controlling the uniform norm by the
`W^{1,p}` norm, so convergence in `W^{1,p}` implies locally uniform convergence for these
representatives. The exponent depends only on the source dimension; compactness of bounded
sets in `F` is not asserted.

**Checks.**

- For `F = ℓ²`, the constant functions `u_j(x) = e_j` have bounded Sobolev norms on a ball but
  no subsequence converges in `Lᵖ`, or uniformly. Morrey continuity does not imply a Rellich
  compactness theorem for arbitrary Banach targets.
- At `F = ℝ` this is the scalar interior Morrey theorem consumed from PDE.

*Needs:* §1.2, §2.3; PDE §1.4; Tau Ceti `TauCeti.W1p.continuousOn_preciseRepresentative`;
Arendt–Kreuter §6.

### 2.5 Pullback by submersions

Let `E₀` be another finite-dimensional real normed space with an additive Haar measure, `Ω₀ ⊆ E₀`
open, and
`θ : Ω₀ → Ω` a `C¹` submersion, expressed by the local projection normal form. Prove that
`u ∈ L^p_loc(Ω; F)` implies `u ∘ θ ∈ L^p_loc(Ω₀; F)` and that
`u ∈ W^{1,p}_loc(Ω; F)` implies `u ∘ θ ∈ W^{1,p}_loc(Ω₀; F)`, with
`D(u ∘ θ) = Du(θ) ∘ dθ` almost everywhere. Prove pullback of strong measurability and
that the preimage of a null set is null. First prove these statements for the projection
of a product of finite-dimensional spaces, using product Haar measure, Fubini and the weak
test-function identity, then use the `C¹` coordinate changes of §2.2. A compact source set is
covered by finitely many relatively compact product boxes, so no bound on whole fibres is
required. Derive the same statements from surjectivity of `dθ` at every point, obtaining the
normal form from the finite-dimensional inverse function theorem. A submersion need not be
injective, proper or of the same source and target dimensions.

**Checks.**

- For `θ(x,t) = x`, `D(u ∘ θ)(x,t)(h,s) = Du(x)h`, and the derivative in the added variable is
  zero. The local `Lᵖ` estimate contains the finite volume of the compact fibre box.
- A constant map to a positive-dimensional space is not a submersion and does not preserve
  null preimages. Projection onto a zero-dimensional space is included.

*Needs:* §1.2, §2.2; Mathlib Fubini, product Haar measures, the inverse function theorem and
`Manifold.IsSubmersionAt`.

### 2.6 Locality on measurable equality sets

For `u, v ∈ W^{1,1}_loc(Ω; F)`, prove `Du = Dv` almost everywhere on the measurable equality
set `{x ∈ Ω : u(x) = v(x)}` (for finite-dimensional `F`, a case of Convent–Van Schaftingen,
Prop. 1.8, p. 7, since weakly differentiable maps are colocal, p. 4). In particular, the weak
derivative of a function is zero almost everywhere on each of its level sets. This is equality
on a measurable set, not a claim that arbitrary restrictions to such sets have an open-domain
Sobolev structure. Prove the scalar
statement by the one-dimensional absolutely continuous representatives and Fubini, then the
Banach-valued statement by a countable norming family on the essential separable ranges of
the functions and partial derivatives. Supply the corresponding scalar truncation facts:
for smooth truncations `T_R : ℝ → ℝ` equal to the identity on `[-R,R]`, the derivatives of
`T_R ∘ u` identify a single derivative field on the increasing truncation regions. If that
field and `u` are locally integrable, reconstruct the ordinary weak derivative by cutoffs and
passage to the limit. These facts support the measurable patching in §4.8.

**Checks.**

- For `u(x) = max(x,0)` on `ℝ`, its derivative is zero almost everywhere on `{u = 0}`.
- Changing a function on a null set does not change any of these derivative statements.

*Needs:* §1.2, §2.1; Tau Ceti
`TauCeti.HasWeakLineDerivOn.exists_ae_eq_add_intervalIntegral`
(`Analysis/Sobolev/WeakDeriv/Interval.lean`), Fubini and scalar absolute continuity.

### Examples

`g ∘ u` for `g(y) = |y|` (Lipschitz, through (b) after smoothing at `0` and passing to the limit,
with `D|u| = sign(u) Du` for scalar `u`); polar coordinates `(r, θ) ↦ (r cos θ, r sin θ)` on
`(0, ∞) × (0, 2π)` as a change of variables with unbounded inverse derivative near `r = 0`.

### Dependencies

Layer 1.

## Layer 3: measure theory on a manifold without a metric

### 3.1 Null sets, positive densities and the almost-everywhere filter

Consume Tau Ceti's `TauCeti.IsNullSet` (chartwise null sets, closed under countable unions, with
empty interior) and RiemannianGeometry R4.6: for a smooth Riemannian metric, the null sets of
`TauCeti.riemannianVolume` are the chartwise null sets. For a continuous metric this is the
case of the positive continuous density measures below. Define the filter
`ae 𝓘(ℝ, E) M` of sets with null complement, and prove
`∀ᵐ x ∂riemannianVolume, P x ↔ ∀ᶠ x in ae, P x` for every continuous metric, so "almost
everywhere" on `M` depends on neither the metric nor the orientation. Prove that a null set
read in any chart of the maximal atlas is null, and that a set is null iff its intersection with
the source of each chart of a countable atlas is.

On `M` with its Borel measurable structure, define a *positive continuous density measure*
`μ` by requiring that in every source chart `φ`,
the pushforward of `μ` restricted to `φ.source` is `w_φ(y) dy` on `φ.target`, for a strictly
positive continuous real function `w_φ`. Prove that one atlas suffices, with the Jacobian
change-of-variables rule for these weights; construct such measures by gluing local chart
densities with a source partition of unity. Prove local finiteness, the Radon property, full
support, and agreement of `μ`-null sets with chartwise null sets. Identify Riemannian volume
as the density whose coordinate weight is `√det (g_ij)` times the density of `b.addHaar` with
respect to `volume`, for the basis `b` of `E` in which the coefficients `g_ij` are computed;
for Lebesgue measure on `ℝⁿ` and its standard basis the weight is `√det (g_ij)`.

For any two such measures `μ`, `μ'`, prove `μ' = ρ μ` for a strictly positive continuous
`ρ : M → ℝ`; conversely every such weight defines another density measure. Bounds
`0 < c ≤ ρ ≤ C < ∞` on a measurable set compare its `Lᵖ` norms by `c^{1/p}` and `C^{1/p}` (with the
usual `p = ∞` convention); these bounds hold on compact sets. Thus the null-set filter and
local Bochner `Lᵖ` spaces are independent of the chosen density, even when the two global
`Lᵖ` spaces differ. All Euclidean weak derivatives still use the Haar measure `volume` in
charts; no weighted integration-by-parts definition replaces them.

**Checks.**

- A point of a manifold of positive dimension is null; a non-empty open set is not
  (`TauCeti.IsNullSet.interior_eq_empty`).
- On `ℝ` with the metrics `dx²` and `e^{2x} dx²` the volumes differ by an unbounded density and
  have the same null sets.
- `dx` and `(2 + sin x) dx` give equivalent global `Lᵖ` norms, while `dx` and `e^x dx`
  have only the asserted local equivalence. No tangent norm is needed to define these measures.

*Needs:* §2.2; Tau Ceti `TauCeti.IsNullSet`, the Riemannian volume-density construction;
Mathlib `Measure.withDensity`, change of variables and partitions of unity;
RiemannianGeometry R4.6.

### 3.2 Measurability and local `Lᵖ`

Call `u : M → F` chart-measurable when every chart representative `u ∘ (extChartAt x).symm` is
`AEStronglyMeasurable` on `(extChartAt x).target` for `volume`. Call it `L^p_loc(M; F)` when
every chart representative lies in `MemLpLoc p (extChartAt x).target`. For a family
`s : (x : M) → V x` with values in fibres of a Banach vector bundle (for
instance `x ↦ Hom(T_xM, T_{f(x)}N)` along a continuous `f`), define the same notions through the
coordinate expressions in charts and bundle trivializations. Transition maps are continuous
families of bounded linear equivalences, so their operator norms and inverse norms are locally
bounded. For the displayed Hom bundle the source tangent space is finite-dimensional and the
target tangent space can be Banach. Prove:

- the notions do not depend on the charts (§2.2) and are local;
- for every positive continuous density measure `μ`, chart-measurable means
  `AEStronglyMeasurable` for `μ`, and `L^p_loc(M; F)` means `MemLp u p (μ.restrict K)`
  for every compact `K ⊆ M`;
- `L^p_loc ⊆ L^q_loc` for `q ≤ p`; continuous functions are in `L^p_loc` for every `p`; on a
  compact `M`, `L^p_loc(M; F) = Lᵖ(M; F)` for every such `μ`.

For a measurable map `u : M → N` into a finite-dimensional second-countable target, define
measurability of a family `Du(x) : T_xM →L[ℝ] T_{u(x)}N` on the measurable intersections of a
source chart with `u⁻¹` of a target chart. Require strong measurability of its trivialized
coefficients there; these intersections need not be open. Prove independence of charts by
countable patching and measurable transition functions (`IsChartMeasurableMFDeriv E E' u Du`).
This supplies the derivative measurability used in §4.8 without pretending that `u*TN` is a
continuous bundle over `M`. For `N` with a measurable structure, call `u : M → N` chart
almost-everywhere measurable when every `u ∘ (extChartAt x).symm` is almost everywhere
measurable on `(extChartAt x).target` for `volume` (`IsChartAEMeasurableMap E u`).

**Checks.**

- On `ℝ` with the metric `e^{2x} dx²` and `p < ∞`, the function `1` is in `L^p_loc` but not in
  `Lᵖ` of the volume `eˣ dx` (`∫ eˣ dx = ∞`): local `Lᵖ` is metric free, global `Lᵖ` is not. At
  `p = ∞` both hold, `‖1‖_{L^∞} = 1`.
- `x ↦ |x|^{−1/2}` on `ℝ` is in `L^p_loc` exactly for `p < 2`, in every chart.
- Charts must be related by `C¹` diffeomorphisms: `u(x) = |x|^{−1/3}` on `ℝ` is in `L²_loc`
  (`∫_{−1}^{1} |x|^{−2/3} dx = 6`), while for the homeomorphism `h(y) = y³`, which is not a
  `C¹` diffeomorphism at `0`, `u ∘ h(y) = |y|^{−1}` is not in `L¹_loc`; admitting `h` as a
  chart would make the class depend on the atlas.

*Needs:* §1.1, §2.2, §3.1; Mathlib strong measurability and measurable maps into Borel spaces.

### 3.3 Null sets under `C¹` maps

Here both manifolds are finite-dimensional. Prove: a `C¹` map between manifolds of the same
dimension carries null sets to null sets (Lee 2012, Ch. 6). Route: read the map in countably
many pairs of charts, identify the two models by a linear equivalence, and apply
`TauCeti.IsNullSet.chartwise` and Mathlib's
`MeasureTheory.addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero` to each piece;
a `C¹` submersion `θ : M' → M`, with possibly different finite dimensions, has null preimages
of null sets; chart-measurable and
`L^p_loc` functions pull back along `θ` to chart-measurable and `L^p_loc` functions. The last
uses the submersion normal form and §2.5. Local diffeomorphisms are a special case; a constant
map into a positive-dimensional space has a non-null preimage of a null singleton.

**Checks.**

- The covering `t ↦ e^{2πit}` of `S¹` by `ℝ` is a local diffeomorphism; the preimage of a point
  is `ℤ`, which is null.
- A constant map `ℝ → ℝ` has the non-null preimage `ℝ` of the null set `{c}`.

*Needs:* §2.5, §3.1, §3.2; Tau Ceti `TauCeti.IsNullSet.chartwise`, `TauCeti.IsNullSet.iUnion`;
Mathlib `MeasureTheory.addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero`.

### Examples

The circle and the torus with their flat and round metrics; open subsets of `ℝⁿ` with metrics of
unbounded density.

### Dependencies

§1.1, §2.2 and §2.5. Tau Ceti's null sets and Riemannian volume-density construction.

## Layer 4: Sobolev functions and Sobolev maps

### 4.1 Sobolev functions on a manifold

For `u : M → F`, define `u ∈ W^{1,p}_loc(M; F)` (`MemW1pLocM E p u` in `Suggested.lean`) when
every chart representative `u ∘ (extChartAt x).symm` lies in `W^{1,p}_loc` of the open set
`(extChartAt x).target`. Define the weak differential `du(x) : T_xM →L[ℝ] F` of a member as a
family whose chart expression `du(φ⁻¹ y) ∘ dφ⁻¹_y` is a weak derivative of the representative on
every chart target (`HasWeakMFDerivFun E u du`; Convent–Van Schaftingen, §1.1, pp. 3–4, for
real-valued `u`). Prove that it exists, is unique almost
everywhere, is chart-measurable with `L^p_loc` chart expressions, and that membership does not
depend on the atlas (§2.2), is local and is preserved by continuous linear maps `F → G` and by
restriction to open subsets. A `C¹`
function is a member with `du = mfderiv u`. Members need not be continuous.

**Checks.**

- On `M = E` with the identity chart, the class is §1.2's `W^{1,p}_loc(E; F)`.
- On `S²` with stereographic charts, `u(x) = log |x − x₀|` is in `W^{1,p}_loc(S²; ℝ)` exactly for
  `p < 2`: it is computed in a chart centred at `x₀` and is smooth elsewhere.
- The chart expression carries `dφ⁻¹`: on `M = ℝ`, `u(x) = x` read in the chart `φ(x) = 2x` is
  `y ↦ y/2`, with weak derivative `1/2 = du ∘ dφ⁻¹_y` for `du = id`. A definition without the
  factor `dφ⁻¹_y` would give `du = 1/2` in this chart and `du = 1` in the identity chart.

*Needs:* §1.2, §2.2, §3.1, §3.2.

### 4.2 The class `W^{1,p}_loc(M, N)`

Define `f ∈ W^{1,p}_loc(M, N)` (`IsSobolevMap E E' p f`) when `f`
is continuous and, for every `x`, the chart representative `writtenInExtChartAt x f` lies in
`W^{1,p}_loc(Ω_x(f); E')`. The set `Ω_x(f)` is open because `f` is continuous
(`chartDomain E E' f x` is its interior, which is the set itself for continuous `f`). Prove:

- *Chart independence.* The condition holds for the preferred charts iff it holds for every
  pair of charts of the maximal atlases of `M` and `N`, on the open part of the source chart's
  target where `f` maps into the target chart's source, iff it holds for every pair of charts
  from some atlas of `M` and some atlas of `N` (families of charts of the maximal atlases
  whose sources cover `M` and `N`); the first equivalence is
  `isSobolevMap_iff_forall_maximalAtlas`. Route: §2.1(a) for the transition of `N`, §2.2 for
  the transition of `M`, and §1.2's sheaf property.
- *Normed targets.* For `N = F` with its identity chart, a continuous `f` lies in
  `W^{1,p}_loc(M, F)` iff it lies in §4.1's `W^{1,p}_loc(M; F)`.
- *Constant and `C¹` maps* are members (§4.4).

**Checks.**

- The identity of `M` is in the class for every `p`, its representative at `x` being the
  identity of `Ω_x`.
- If `N = ℓ²` or its unit sphere, this is the Banach-valued chart condition on the
  finite-dimensional source; there is no null-set or volume construction on `N`.
- `f(x) = x/|x|` from `ℝⁿ ∖ {0}` to `S^{n−1}` is smooth, hence in the class; it has no
  continuous extension to `ℝⁿ`, so it is not in `W^{1,p}_loc(ℝⁿ, S^{n−1})` for any `p`, although
  for `p < n` its extension by any value at `0` is in §4.1's `W^{1,p}_loc(ℝⁿ; ℝⁿ)`.
- A definition that tested only the charts of one atlas would still give the same class
  (chart independence); a definition that dropped continuity would make `Ω_x(f)` non-open.

*Needs:* §1.2, §2.1, §2.2, §3.2, §4.1.

### 4.3 The weak differential

For `f ∈ W^{1,p}_loc(M, N)`, define *`Df` is a weak differential of `f`*
(`HasWeakMFDeriv E E' f Df`) for a family `Df(x) : T_xM →L[ℝ] T_{f(x)}N` when, for
every `x₀`, the chart expression `y ↦ dψ_{f(φ⁻¹y)} ∘ Df(φ⁻¹y) ∘ dφ⁻¹_y`, with `φ`, `ψ` the
preferred charts at `x₀` and `f(x₀)` and the derivatives `mfderiv`, is a weak derivative of the
chart representative on `Ω_{x₀}(f)`. Prove:

- a weak differential exists for every member (`IsSobolevMap.exists_hasWeakMFDeriv`), and two
  weak differentials of a continuous map differ only on a null set (`HasWeakMFDeriv.ae_eq`);
  `Df` denotes a chosen one;
- its chart expression in every pair of charts of the maximal atlases is a weak derivative of
  the corresponding representative;
- it is chart-measurable, as a section of `Hom(TM, f^*TN)` (§3.2), and its chart expressions are
  `L^p_loc`;
- if `Df` and `Df'` agree almost everywhere and `Df` is a weak differential, so is `Df'`.

**Checks.**

- For `f = id_M`, `Df(x) = id` is a weak differential.
- For `M = N = ℝ` and `f(t) = |t|`, `Df(t) = sign t` almost everywhere; any value at `t = 0` is
  allowed.
- The zero family is not a weak differential of `f(t) = t` on `ℝ`: the weak derivative of the
  representative is `1`, and `0 ≠ 1` on a set of positive measure. A definition that did not
  tie `Df` to the weak derivative would accept it.

*Needs:* §3.1, §3.2, §4.2; Tau Ceti `TauCeti.HasWeakFDerivOn.ae_eq`,
`TauCeti.HasWeakFDerivOn.congr_ae_deriv`.

### 4.4 `C¹` members

Prove that a `C¹` map `f : M → N` lies in `W^{1,p}_loc(M, N)` for every `p` and that
`x ↦ mfderiv f x` is a weak differential of it (`isSobolevMap_of_contMDiff`). Prove conversely
that a member whose weak differential agrees almost everywhere with a family `Φ`,
`Φ(x) : T_xM →L[ℝ] T_{f(x)}N`, whose chart expressions are continuous is `C¹`, with
`mfderiv f x = Φ x` at every `x`
(Convent–Van Schaftingen, Prop. 1.1, p. 4, for finite-dimensional targets); in charts,
`TauCeti.HasWeakFDerivOn.contDiffOn_succ` and `TauCeti.HasWeakFDerivOn.fderiv_eq_of_continuousOn`.

**Checks.**

- `z ↦ z²` on `ℂ` and `x ↦ −x` on `ℝⁿ` are members with `Df = mfderiv f` everywhere.
- On `ℝ`, `t ↦ t|t|` is `C¹` with derivative `2|t|`, and it is the weak differential.

*Needs:* §4.2, §4.3; Tau Ceti `TauCeti.hasWeakFDerivOn_of_differentiableOn`,
`TauCeti.HasWeakFDerivOn.contDiffOn_succ`, `TauCeti.HasWeakFDerivOn.fderiv_eq_of_continuousOn`;
Mathlib `mfderiv` in charts.

### 4.5 Restriction, locality and metric copies

Prove:

- for an open `U ⊆ M`, `f ∈ W^{1,p}_loc(M, N)` restricts to `f|_U ∈ W^{1,p}_loc(U, N)`, with
  weak differential the restriction of `Df`; and for an open `V ⊆ N` with `f(M) ⊆ V`, `f` is in
  the class into `N` iff it is in the class into `V`;
- *locality*: if `M = ⋃ U_i` is an open cover and every `f|_{U_i}` is in the class, then `f` is
  (`IsSobolevMap.of_locally`; continuity of `f` follows from the cover), and weak differentials
  of the restrictions glue to one of `f`;
- *metric independence*: replacing compatible target tangent norms changes no membership or
  weak-differential predicate, since these definitions involve only charts. For finite-dimensional
  `N` with continuous Riemannian metrics `g` on `M` and `h` on `N`, `f` is in the class iff
  `ofWithMetric⁻¹ ∘ f ∘ ofWithMetric : WithMetric g → WithMetric h` is, with the same weak
  differential. The class involves no metric.

**Checks.**

- Open targets: `t ↦ (cos t, sin t)` lies in the class into `ℝ²` and into `ℝ² ∖ {0}`.
- Locality with a countable cover: `M = ℝ`, `U_k = (k − 1, k + 1)`.

*Needs:* §4.2, §4.3; Tau Ceti `TauCeti.WithMetric`; Mathlib `TopologicalSpace.Opens` charted
spaces.

### 4.6 Chain rules

Prove, for `f ∈ W^{1,p}_loc(M, N)` with weak differential `Df`:

- (a) *Precomposition.* For a `C¹` submersion `θ : M' → M`,
  `f ∘ θ ∈ W^{1,p}_loc(M', N)` (`IsSobolevMap.comp_submersion`) and `y ↦ Df(θ y) ∘ dθ_y` is a
  weak differential of it; the preimage under `θ` of a null set is null (§3.3).
- (b) *Postcomposition.* For a `C¹` map `g : N → P`, `g ∘ f ∈ W^{1,p}_loc(M, P)`
  (`IsSobolevMap.comp_contMDiff`) and `x ↦ dg_{f(x)} ∘ Df(x)` is a weak differential of it
  (`HasWeakMFDeriv.comp_contMDiff`; for finite-dimensional targets the identity is
  Convent–Van Schaftingen, Prop. 1.5, p. 6).
- (c) *Products.* `x ↦ (f₁(x), f₂(x))` lies in `W^{1,p}_loc(M, N₁ × N₂)` iff `f₁` and `f₂` lie in
  their classes, with weak differential `(Df₁, Df₂)`.

The targets `N`, `P`, `N₁`, `N₂` are Banach manifolds; only `M`, `M'` in (a) are required to be
finite-dimensional, with no equal-dimension requirement. No Sobolev class with `N` as source
is used in (b). Derive the local-diffeomorphism statement as a specialization.

No bound on `dθ` or `dg` is assumed. Route: (a) is §2.5 in charts, (b) is §2.1(a) in charts,
since `f` is continuous.

**Checks.**

- (b) with `g` a chart of `N` recovers the chart condition of §4.2.
- (b) with `g(y) = y²` on `N = P = ℝ` and `f(t) = |t|^{1/2}`: `g ∘ f = |t|`, with weak
  differential `2|t|^{1/2} · sign(t)/(2|t|^{1/2}) = sign t`.
- For `θ : M × ℝ → M` the projection, `f ∘ θ` is constant in the extra variable and its weak
  differential vanishes on that variable. The null-preimage argument applies to submersions;
  it gives no general smooth-precomposition theorem for maps of deficient rank.

*Needs:* §2.1, §2.5, §3.3, §4.2–§4.3; Mathlib `Manifold.IsSubmersionAt`.

### 4.7 Colocal weak differentiability for finite-dimensional targets

Here `N` is finite-dimensional, Hausdorff, second countable and `C¹`. Define
`IsColocallyWeaklyDifferentiable E E' u` for an almost-everywhere measurable `u : M → N`
by requiring `φ ∘ u ∈ W^{1,1}_loc(M; ℝ)` for every compactly supported `C¹` function
`φ : N → ℝ` (Convent–Van Schaftingen, Def. 1.1, p. 3). Use the chartwise measurable-map
predicate of §3.2; it agrees with `AEMeasurable u μ` for every density measure of §3.1. Prove
invariance under almost-everywhere equality, restriction to source opens, locality for
countable open source covers, and invariance under changes of atlases and target `C¹`
diffeomorphisms. Prove that every member of §4.2 with `p ≥ 1` is colocal
(`IsSobolevMap.isColocallyWeaklyDifferentiable`).

Build a countable cover of `N` by relatively compact chart neighbourhoods and compactly
supported `C¹` scalar probes whose finite tuples agree there with the coordinates of a chart.
Construct the probes with finite-dimensional target bump functions. Prove the scalar weak
chain and measurable-equality locality results needed to reconstruct derivatives from them;
do not apply the continuous-map chart definition to the non-open sets `u⁻¹(V)`.
The construction is for finite-dimensional targets: compactly supported continuous functions
on an infinite-dimensional Banach manifold vanish, so this probe family would detect nothing.

**Checks.**

- Every continuous member of §4.2 is colocally weakly differentiable, using target probes
  and the continuous chain rule.
- Set `u(x) = 1/x` for `x ≠ 0` and `u(0) = 0` on `ℝ`. Every compactly supported smooth
  probe of `u` is smooth near `0` up to a change at that point; `u` is colocal, but neither
  `u` nor its derivative is locally integrable near `0`. Colocal differentiability alone is
  weaker than ordinary vector-valued `W^{1,1}_loc`.
- `u(x) = sign x` on `ℝ` is not colocal into `ℝ`: for a probe with `φ(1) ≠ φ(−1)`, `φ ∘ u`
  jumps at `0` and is not in `W^{1,1}_loc`. A definition that asked only for `L¹_loc` probes
  would accept it.

*Needs:* §2.1, §2.6, §3.1–§3.2, §4.1; Mathlib finite-dimensional manifold bump functions;
Convent–Van Schaftingen §1.

### 4.8 The colocal weak differential

For a colocal map `u : M → N` as in §4.7, define `HasColocalWeakMFDeriv E E' u Du` to mean that
`Du(x) : T_xM →L[ℝ] T_{u(x)}N` is chart-measurable in the sense of §3.2 and, for every probe
`φ` of §4.7, the ordinary weak differential of `φ ∘ u` is
`x ↦ dφ_{u(x)} ∘ Du(x)` (Convent–Van Schaftingen, Def. 1.2, p. 4). Use a predicate for weak
differentials of Banach-valued functions on the source as in §4.1; no continuity of `φ ∘ u` is
required. Prove:

- existence (`IsColocallyWeaklyDifferentiable.exists_hasColocalWeakMFDeriv`) and uniqueness
  almost everywhere (`HasColocalWeakMFDeriv.ae_eq`), constructing `Du` from the countable
  extended chart probes and using §2.6 on their measurable overlap sets (Convent–Van
  Schaftingen, Prop. 1.2, p. 5);
- invariance under null changes of `u` (transporting the target tangent space on the equality
  set), and under null changes of `Du`; restriction and locality on source opens;
- equality of the derivatives almost everywhere on any measurable set on which two colocal
  maps agree, with the same tangent-space transport (Convent–Van Schaftingen, Prop. 1.8, p. 7);
- constants, `C¹` maps and products, with their expected differentials (products:
  Convent–Van Schaftingen, Prop. 1.7, p. 7);
- the chain identity `D(g ∘ u) = dg_u ∘ Du` for `C¹` maps between finite-dimensional targets
  whenever both `u` and `g ∘ u` are colocal (Convent–Van Schaftingen, Prop. 1.5, p. 6). The
  hypothesis that the composition is colocal
  is part of this statement. Prove it automatically when `g` is proper, by pulling back
  compactly supported probes, or when `u` has locally essentially compact target range, by
  inserting a target cutoff equal to one on that range;
- pullback by `C¹` source submersions and its chain identity, using §2.5 and §3.3.

Prove local integrability of the chart coefficients on compact source and target chart
regions together: restrict to `K ∩ u⁻¹(L)` with `K` compact in a source chart and `L` compact
in a target chart. There is no assertion that the whole norm `‖Du‖` is locally integrable
until §5.4 supplies an energy hypothesis. For continuous maps, prove that the colocal
differential and the weak differential of §4.3 agree whenever the latter exists.

**Checks.**

- The example `1/x` of §4.7 has `Du = −1/x²` almost everywhere; its local integrability is
  recovered only after a compact target truncation.
- For `n ≥ 2`, the radial map `x ↦ x/|x|` into `S^{n−1}`, with an arbitrary value at the
  origin, has its usual tangential derivative almost everywhere and is colocal even without
  continuity. At `n = 1` it is `sign x` into `S⁰ = {±1}`, which is not colocal (§4.7).
- For `M = N = ℝ` and `u(t) = |t|`, `Du(t) = sign t` almost everywhere, and the zero field is
  not a colocal differential: for a probe equal to `y` on `[−1, 1]`, `φ ∘ u = |t|` near `0`,
  whose weak derivative is `sign t ≠ 0`.

*Needs:* §2.6, §3.2–§3.3, §4.1, §4.3, §4.7; Convent–Van Schaftingen §1.

### Examples

Holomorphic maps between Riemann surfaces; covering maps; the radial map
`x ↦ |x|^{a−1} x` of `ℝⁿ`, in `W^{1,p}_loc(ℝⁿ, ℝⁿ)` for `a > 0` exactly when
`p(a − 1) > −n`; the stereographic projection and its inverse.

### Dependencies

Layers 1–3.

## Layer 5: the norm of the weak differential

### 5.1 The norm `‖Df‖`

Define compatible continuous tangent norms on a manifold, applying the same definition to
the finite-dimensional source `M` and the Banach target `N`: a norm `ν_y` on each
`T_yN` inducing its existing topology, whose expression in any tangent trivialization varies
continuously, uniformly on the model unit ball. More explicitly, at each `y₀` and for every
`ε > 0`, on a neighbourhood of `y₀` the trivialized norms satisfy
`|ν_y(v) − ν_{y₀}(v)| ≤ ε ‖v‖` for all model vectors `v`. Prove independence of the
trivialization, continuity of norm evaluation, and local two-sided comparison with the model
norm; on compact subsets these comparisons are uniform in finitely many trivializations.
Continuous strong Hilbert metrics, expressed by continuous positive invertible Riesz operators
in charts, supply such norms; prove this compatibility with Mathlib's Riemannian-bundle API.
For a Banach space as target the fixed norm is an example. No norm construction for a weak
Riemannian metric is requested.

These are the continuous Finsler norm data used here; no smoothness of the norm at the zero
section, geodesic construction or canonical Finsler volume is required. Choose a positive
continuous source density `μ` independently, as in §3.1. Riemannian source metrics and their
volumes are a specialization, not part of the definition of these norm data.

For compatible continuous tangent norms on `M`, `N`, and `f ∈ W^{1,p}_loc(M, N)`, define
`‖Df‖(x)` as the operator norm of `Df(x)` for the norms at
`x` and `f(x)` (for oriented Riemannian `n`-manifolds: Heikkilä–Pankka, arXiv 2302.11440v2,
p. 1). Prove that it
is chart-measurable, hence `AEStronglyMeasurable` for `μ`, and that its
almost-everywhere class does not depend on the choice of weak differential. For `C¹` `f` it is
the continuous function `x ↦ ‖mfderiv f x‖`.

**Checks.**

- For a local Riemannian isometry `f`, `‖Df‖ = 1`.
- For `f(x) = 2x` on `ℝⁿ` with the flat metric, `‖Df‖ = 2`; with the metric `4|dx|²` on the
  source only, `‖Df‖ = 1`.
- The inclusion `t ↦ t e₁` into `ℓ²` has `‖Df‖ = 1`. The weak inner product
  `h(v,v) = ∑_j j⁻² |v_j|²` on `ℓ²` (indices `j ≥ 1`) does not induce the model topology and
  does not meet the tangent-norm hypotheses.
- Give `ℝ²` the source norm `max(|v₁|,|v₂|)` and the independent density `e^{x₁} dx`.
  The first-coordinate projection has differential norm `1`; no inner product is involved.

*Needs:* §3.2, §4.3; Mathlib `Bundle.RiemannianBundle`.

### 5.2 The `L^p` characterization

Prove that for continuous `f : M → N` whose chart representatives lie in `W^{1,1}_loc`, so
`f ∈ W^{1,1}_loc(M, N)`, the following are equivalent: `f ∈ W^{1,p}_loc(M, N)`;
`‖Df‖ ∈ L^p_loc(M)` (§3.2). Route: in a chart, the chart expression of `Df` and `Df` differ by
`dψ` and `dφ⁻¹`, which with their inverses are bounded on compact sets for the compatible norms,
and `f` maps compact sets to compact sets. Deduce that `W^{1,p}_loc(M, N) ⊆ W^{1,q}_loc(M, N)`
for `q ≤ p`.

**Checks.**

- `f(t) = (cos t, sin t)` from `ℝ` to `S¹ ⊆ ℝ²` with the round metric has `‖Df‖ = 1`, in every
  `L^p_loc`.
- `f(t) = |t|^{1/2}` from `ℝ` to `ℝ` lies in `W^{1,1}_loc` and has `‖Df‖ = 1/(2|t|^{1/2})`, in
  `L^p_loc` exactly for `p < 2`.

*Needs:* §3.2, §4.2, §5.1.

### 5.3 Comparable tangent norms and density measures

Let `ν_M, ν'_M` and `ν_N, ν'_N` be compatible continuous tangent norms, with each pair
mutually comparable by factors `a, b ≥ 1`, respectively. Prove
`‖Df‖' ≤ a b ‖Df‖` and the reverse bound. Independently let `μ' = ρ μ` be positive continuous
density measures and assume `c ≤ ρ ≤ C` on the set being integrated. Compare the `Lᵖ`
differential norms with upper factor `C^{1/p} a b` and lower factor `c^{1/p}/(a b)`;
for `p = ∞` the density factor is `1`. Prove that any two compatible source norms and
densities are uniformly comparable on compact source sets (for Riemannian metrics on a compact
manifold, Hajłasz 2009, §1, p. 187). Any two compatible target norms
are comparable on compact target sets; for continuous `f`, use the compactness of `f(K)`.
This proves the local characterization is independent of all these choices for continuous
maps. For discontinuous maps, target norm comparisons require uniform bounds along their
essential images, as specified in §5.4.

Recover the Riemannian comparison: if `g' ≤ a² g` and `g ≤ a² g'`, the induced norms compare
by `a` and the volumes compare by `aⁿ`, giving the factor `a^{n/p} a b`. The independent
density has no relation to the Finsler norm unless one is explicitly supplied.

**Checks.**

- On `ℝ`, `g = dx²` and `g' = 4dx²` give `a = 2`; for `f = id` into `(ℝ, dx²)`,
  `‖Df‖ = 1` and `‖Df‖' = 1/2`.

*Needs:* §3.1, §5.1–§5.2; Tau Ceti `TauCeti.WithMetric`, `TauCeti.riemannianVolume` for the
Riemannian specialization.

### 5.4 Intrinsic energy classes of measurable maps

Here `N` is finite-dimensional and second countable, with specified compatible continuous
tangent norms on `M`, `N`, and a positive continuous source density `μ`. Define
`Ẇ^{1,p}_loc(M, N)` as the colocal maps of §4.7 with `‖Du‖ ∈ L^p_loc(M, μ)`; define the
global homogeneous class `Ẇ^{1,p}(M, N)` by `‖Du‖ ∈ Lᵖ(M, μ)` (Convent–Van Schaftingen,
Def. 2.1, p. 8, for Riemannian metrics with the Hilbert–Schmidt norm and `p < ∞`). Prove
measurability of this norm using §3.2's measurable chart coefficients and the compatible norm
data. These are
classes modulo almost-everywhere equality, with the differential of §4.8. If a compatible target distance
`d_N` and basepoint `y₀` are specified, define the inhomogeneous local and global classes by
also requiring `d_N(u(·),y₀)` in the corresponding `Lᵖ` space. Prove independence of the
basepoint locally, and globally when `μ(M) < ∞` or `p = ∞`; for finite `p` on an infinite
source measure the basepoint can affect the value condition. For connected Riemannian targets the geodesic distance is a supplied
choice; the roadmap does not build a general Finsler distance theory.

Prove locality, monotonicity in `p` for the local classes, source-density independence locally,
and comparison under the two-sided norm and density bounds of §5.3. The colocal predicate
itself is independent of norms. The energy classes retain the target norm: a discontinuous
map can send compact source sets to noncompact target regions, where two continuous target
norms need not have uniform comparison constants. Prove:

- for continuous `u`, membership of the local homogeneous class is equivalent to
  `IsSobolevMap E E' p u`, and the differentials agree. Reconstruct ordinary chart derivatives
  from compact target probes on neighbourhoods with compact image;
- for `N = F` finite-dimensional with its fixed norm and usual distance, the inhomogeneous
  local class is exactly the ordinary vector-valued `W^{1,p}_loc(M; F)` of §4.1, without a
  continuity assumption. Supply the truncation-to-weak-derivative reconstruction using §2.6;
- pullback of the local homogeneous and inhomogeneous classes by `C¹` source submersions;
- the chain identity of §4.8 for compositions that are colocal. If `g : N → P` is `C¹`
  between finite-dimensional normed targets, `g ∘ u` is colocal and `‖dg‖` is uniformly
  bounded, prove the local and global homogeneous derivative-energy bounds. In particular,
  proper `C¹` maps with bounded differential preserve those classes; compact `N` gives
  properness automatically. Bounded differential alone does not assert colocal membership
  for maps escaping to missing target boundary points.
  For the inhomogeneous class also assume a distance-growth bound
  `d_P(g(y),z₀) ≤ A + B d_N(y,y₀)`; on a compact source it gives the global value estimate.

The intrinsic classes use no embedding, compact target, tube or global retraction. No
continuity theorem for noncompact targets at `p > dim M` is asserted without the completeness
or closure conditions needed to keep the continuous representative in the target. The
comparison with the extrinsic space on compact source and target is §10.4.

**Checks.**

- For `n ≥ 2` and `p < n`, the radial map from `ℝⁿ` into `S^{n−1}` with an arbitrary value
  at `0` belongs locally to the intrinsic class but has no continuous representative.
- On `ℝⁿ`, a nonzero constant map into `ℝ` has zero homogeneous energy but is not in the
  global inhomogeneous `W^{1,p}` class for finite `p` with basepoint `0`.
- The example `1/x` of §4.7 is excluded by local derivative integrability.
- On `(-1,1)` set `u(x) = x` for `x ≠ 0` and `u(0) = 1`, with target `ℝ ∖ {0}`.
  This is colocal with locally bounded differential. The smooth target function
  `g(y) = sign y` has zero differential, but `g ∘ u` has a jump and is not colocal. This
  checks the properness or composition-membership hypothesis in the chain rule.

*Needs:* §2.6, §3.1–§3.3, §4.7–§4.8, §5.1–§5.3; Convent–Van Schaftingen §§1–2.

### Examples

Conformal maps, with `‖Df‖` the conformal factor; projections `ℝⁿ → ℝᵐ`; the radial map of
Layer 4 with `‖Df‖ = max(a, 1) |x|^{a−1}`.

### Dependencies

Layer 4.

## Layer 6: the Jacobian

Throughout this layer both source and target are finite-dimensional, of the same dimension
`n`, with continuous Riemannian metrics. No determinant or target volume is defined for a
general Banach target.

### 6.1 The oriented Jacobian of a linear map

For finite-dimensional real inner product spaces `V`, `W` of one dimension `n` with orientations
`o_V`, `o_W` and a linear `A : V → W`, define `J(A) = J_{o_V, o_W}(A)` (`orientedJacobian o_V o_W A`) by
`o_W.volumeForm (A v₁, …, A vₙ) = J(A) · o_V.volumeForm (v₁, …, vₙ)` for every family (equivalently,
`J(A) = o_W.volumeForm (A ∘ b)` for a positive orthonormal basis `b` of `V`). Prove:

- `J(B ∘ A) = J(B) J(A)` for three oriented spaces (`orientedJacobian_comp`), and `J(id) = 1`
  for one orientation;
- reversing exactly one of `o_V`, `o_W` negates `J(A)`;
- `|J(A)| = LinearMap.normDet A ≤ ‖A‖ⁿ` (`abs_orientedJacobian`, `abs_orientedJacobian_le`;
  Hadamard, `Orientation.abs_volumeForm_apply_le`);
- `J(A) = LinearMap.det A` when `V = W` with one orientation (`orientedJacobian_self`);
- `J(A) ≠ 0` iff `A` is invertible, and `J(A) > 0` iff `A` is invertible and carries `o_V` to
  `o_W` (`Orientation.map`);
- in dimension `0`, `J(A) = 1` if the two orientations agree and `−1` otherwise.

**Checks.**

- `A = diag(2, 1)` on `ℝ²`: `J = 2`, `‖A‖² = 4`, so `|J| ≤ ‖A‖²` is strict.
- The reflection `diag(−1, 1)` has `J = −1` for one orientation on both sides and `J = 1` from
  `(ℝ², std)` to `(ℝ², −std)`.
- A rank-one `A` has `J(A) = 0` and `‖A‖ > 0`.

*Needs:* Mathlib `Orientation.volumeForm`, `Orientation.volumeForm_robust`,
`Orientation.volumeForm_neg_orientation`, `Orientation.abs_volumeForm_apply_le`,
`LinearMap.normDet`, `LinearMap.normDet_eq_abs_det`, `LinearMap.det`.

### 6.2 The Jacobian of a Sobolev map

For oriented Riemannian manifolds `M`, `N` of one dimension `n` and `f ∈ W^{1,p}_loc(M, N)`,
define `J_f(x) = J(Df(x))` for the tangent orientations at `x` and `f(x)` and the metrics there.
Prove that it is chart-measurable and independent of the weak differential almost everywhere;
that reversing exactly one orientation negates it; that `J_f = J(mfderiv f)` for `C¹` `f`;
that `J_{g ∘ f} = J_g(f) J_f` for `C¹` `g` and `J_{f ∘ θ} = J_f(θ) J_θ` for `C¹` local
diffeomorphisms `θ` (§4.6); and that under a change of metrics, with
`riemannianVolumeForm' = ρ_M · riemannianVolumeForm` on `M` and `ρ_N` likewise on `N`,
`J'_f(x) = (ρ_N(f(x)) / ρ_M(x)) · J_f(x)` almost everywhere. Prove the chart formula: when `M`
and `N` are modelled on one space `E` with an orientation `o_E`, and the charts `φ` of `M` and
`ψ` of `N` are positively oriented (their differentials carry the tangent orientations to
`o_E`), then for almost every `x` in the chart domain
`J_f(x) = LinearMap.det (dψ ∘ Df(x) ∘ dφ⁻¹) · w_N(ψ(f(x))) / w_M(φ(x))`, where `w_M`, `w_N` are
the coordinate weights of the Riemannian volumes in `φ`, `ψ` (§3.1), equal to
`√det (g_{ij})` for Lebesgue measure on `ℝⁿ` (Lee 2012, Ch. 15, for the volume form in oriented
charts).

**Checks.**

- The identity `(M, o) → (M, −o)` has `J = −1`.
- `z ↦ z²` on `ℂ` with the flat metric has `J_f(z) = 4|z|²`.
- For `f = id : (ℝ, dx²) → (ℝ, 4dx²)`, `ρ_N = 2`, `ρ_M = 1`, so `J' = 2`.
- Chart formula: on `ℝ` with the metric `e^{2t} dt²` on the target, the identity has
  `det = 1`, `w_N(t) = eᵗ`, `w_M = 1`, so `J_f(t) = eᵗ`, the length stretch.

*Needs:* §3.1, §5.1, §6.1; Tau Ceti `TauCeti.riemannianVolumeForm`, `TauCeti.Manifold.Orientation`.

### 6.3 Hadamard's inequality and integrability

Prove `|J_f| ≤ ‖Df‖ⁿ` almost everywhere, hence `J_f ∈ L^{p/n}_loc(M)` for `p ≥ n`, in particular
`J_f ∈ L¹_loc(M)` for `f ∈ W^{1,n}_loc(M, N)`; local integrability for `p ≥ n`, on compact
sets for the Riemannian volume, is `IsSobolevMap.integrableOn_orientedJacobian`.

**Checks.**

- On `ℝ²` with the flat metric, `f(x) = |x|^{−1/2} x` is continuous, with singular values
  `|x|^{−1/2}` (tangential) and `|x|^{−1/2}/2` (radial). So `‖Df‖ = |x|^{−1/2}`, in `L^p_loc`
  exactly for `p < 4`, and `J_f = |x|^{−1}/2`, in `L^q_loc` exactly for `q < 2`: the integrability
  `J_f ∈ L^{p/2}_loc` for `2 ≤ p < 4` is sharp.
- Hadamard is strict for `diag(2, 1)` (`J = 2 < 4`) and an equality for conformal linear maps.

*Needs:* §5.2, §6.1, §6.2.

### Examples

Holomorphic maps (`J_f = |f'|²`); orientation-reversing isometries (`J = −1`); the fold
`(x₁, …, xₙ) ↦ (|x₁|, x₂, …, xₙ)`, with `‖Df‖ = 1` and `J_f = sign x₁` almost everywhere.

### Dependencies

Layer 5.

## Layer 7: comparison with the other Sobolev classes

### 7.1 Euclidean domains

Let `Ω ⊆ E` be open, carrying the identity chart and the norm of `E` as its tangent norm
(§5.1), and let `F` be a real Banach space with its identity chart and fixed norm. Prove that
for `f : E → F`, the restriction of `f` to the open submanifold `Ω` lies in `W^{1,p}_loc(Ω, F)` iff
`f` is continuous on `Ω` and has a weak derivative `Du` on `Ω`
(`TauCeti.HasWeakFDerivOn volume Ω f Du`) with `‖Du‖ ∈ MemLpLoc p Ω`; that then `Df = Du` and
`‖Df‖ = ‖Du‖` almost everywhere. When `E` is an inner product space with its flat metric,
`F = E` and one orientation is used on both sides, prove that `J_f = LinearMap.det Du`
almost everywhere (Martio–Rickman–Väisälä, p. 6, for the Jacobian `J(x, f)` of a map of
`ℝⁿ`).

**Checks.**

- The fold of §6's Examples: `Du = diag(sign x₁, 1, …, 1)`, `‖Du‖ = 1`, `det Du = sign x₁`.
- With `o` on `Ω` and `−o` on `E`, `J_f = −det Du`; the identity then has `J = −1`.
- The tangent norm is the norm of `E`: on `ℝ²` with the norm `max(|y₁|, |y₂|)`, `f(x) = x₁ + x₂`
  into `F = ℝ` has `‖Df‖ = 2`, the dual norm of `(1, 1)`; the Euclidean metric would give
  `√2`.

*Needs:* §4.2–§4.3, §5.1; §6.2 for the determinant specialization.

### 7.2 Maps from surfaces

For a Riemann surface `(Σ, j)` without boundary, a finite-dimensional manifold `M` and `p > 2`,
prove that the class
`W^{1,p}_loc(Σ, M)` of PseudoholomorphicCurveAnalysis §4.1 (isothermal charts, `k = 1`) is this
roadmap's class for the underlying smooth surface, and that the weak differential `du` of PH4.1
is a weak differential in the sense of §4.3.

**Checks.**

- At `p ≤ 2` the two definitions are not compared: PH4.1 requires `kp > 2`.
- The holomorphic map `z ↦ z²` of `ℂ` lies in both classes with `du = 2z dz`.

*Needs:* §4.2–§4.3; PseudoholomorphicCurveAnalysis PH4.1.

### 7.3 Compact manifolds and the bundle carrier

Let `M` be compact and `F` Banach. Prove that every `u ∈ W^{1,p}_loc(M; F)` has `u ∈ Lᵖ(M; F)`
and `|du| ∈ Lᵖ(M)` for every positive continuous source density and compatible continuous
source tangent norm. Extend the first-order case of the `W^{k,p}` section carrier of
PseudodifferentialOperators §5.2 and its chart-component construction to the trivial bundle
`M × F` with Banach fibre `F`, supplying its normed-space and completeness API and its smooth
density for `p < ∞`. Build the first-order Banach-valued Euclidean component space from the
closed graph `u ↦ (u, ∂₁u, …, ∂ₙu)` in a finite product of Bochner `Lᵖ` spaces; the §5.2
carrier of a trivial bundle with finite-dimensional fibre is its specialization. Weak-derivative
closedness supplies completeness, and §2.3 plus a source partition of unity supplies density.
No reflexivity or Radon–Nikodým property of `F` is needed. General higher-order or nontrivial
Banach-bundle carriers remain with their named owners and are not asserted here.

For any finite source atlas with the standard trivial fibre coordinates, identify this carrier
with classes modulo almost-everywhere equality of members of `W^{1,p}_loc(M; F)`, with norm
equivalent to `‖u‖_{Lᵖ} + ‖ |du| ‖_{Lᵖ}`. More general fibre trivializations are allowed when
their transition maps and first derivatives have uniform bounds on the compact chart sets.
These norms are equivalent for all the specified densities and source tangent norms by
§3.1 and §5.3; the chart integrals use the Haar measure `volume` of the model, not a
Riemannian global measure.

**Checks.**

- On `M = S¹` with `F = ℝ`, `u(θ) = |sin θ|^{1/2}` lies in `W^{1,p}_loc(S¹; ℝ)` exactly for
  `p < 2`, and so in the carrier for those `p`.
- The constant function `1` has norm `vol(M)^{1/p}` up to the equivalence constants.
- For `F = ℓ²`, constant sections have the expected `Lᵖ` norm and zero weak differential;
  completeness applies even though bounded families of such sections need not be precompact.

*Needs:* §2.3, §3.2, §4.1, §5.3; Tau Ceti weak-derivative closedness,
`TauCeti.hasWeakFDerivOn_of_tendsto_lintegral_enorm_sub`; PseudodifferentialOperators §5.2.

### Examples

Smooth functions on closed manifolds as elements of the carrier of §7.3; Floer strips as
members of `W^{1,p}_loc` for `p > 2`.

### Dependencies

Layers 4–5, §2.3; Layer 6 for the determinant specialization;
PseudoholomorphicCurveAnalysis PH4.1; PseudodifferentialOperators §5.2.

## Layer 8: pullback of differential forms

### 8.1 Pullback along a Sobolev map

Fix a real Banach coefficient space `V`. For `f ∈ W^{1,p}_loc(M, N)` with weak differential
`Df` and a continuous `V`-valued `k`-form `ω` on `N`,
define the rough form `f^♯ω` on `M` by `(f^♯ω)(x)(v₁, …, v_k) = ω(f(x))(Df(x)v₁, …, Df(x)v_k)`.
The source `M` is finite-dimensional; `N` is a Banach manifold and
`ω(y)` is a bounded alternating multilinear map from `T_yN` to `V`. Prove:

- it is chart-measurable and its almost-everywhere class does not depend on the choice of `Df`;
- `|f^♯ω| ≤ |ω ∘ f| ‖Df‖^k` for compatible continuous source and target tangent norms,
  so `f^♯ω ∈ L^{p/k}_loc` for `1 ≤ k ≤ p`, and
  `f^♯ω` is continuous for `k = 0`;
- `f^♯ω = TauCeti.mpullback f ω` almost everywhere for `C¹` `f`;
- `f^♯(ω ∧_B η) = f^♯ω ∧_B f^♯η` for a bounded bilinear coefficient pairing
  `B : V × W → Z` between Banach spaces; this includes multiplication for scalar forms;
  `(g ∘ f)^♯ω = f^♯(g^*ω)` for `C¹` `g` and `(f ∘ θ)^♯ω = θ^*(f^♯ω)` for `C¹` source
  submersions `θ` (§4.6), almost everywhere;
- pullback commutes with each continuous linear coefficient map `L : V →L[ℝ] W`, and the
  wedge norm estimate includes the operator norm of `B`;
- for the finite-dimensional specialization of oriented Riemannian `M`, `N` of dimension `n`,
  `f^♯(riemannianVolumeForm o_N) = J_f · riemannianVolumeForm o_M` almost everywhere (§6.2).

**Checks.**

- `k = 0`: `f^♯ω = ω ∘ f`.
- For `V = ℂ`, viewed as a real Banach space, real and imaginary parts of the pullback are
  the pullbacks of the two scalar coefficient forms.
- `f(x) = |x|^{−1/2} x` on `ℝ²`, `ω = dy₁ ∧ dy₂`: `f^♯ω = J_f dx₁ ∧ dx₂` with `J_f = |x|^{−1}/2`.

*Needs:* §4.3, §4.6, §5.1; Tau Ceti `TauCeti.RoughForm`, `TauCeti.mpullback`,
`TauCeti.bundleWedgeWith`; §6.2 and `TauCeti.riemannianVolumeForm` for the volume-form identity.

### 8.2 The weak exterior derivative on a manifold

Extend the existing `TauCeti.IntegrableTopForm` and `TauCeti.integralTopForm` API in place to
top forms with fixed Banach coefficients `V`: integrate chart coefficients by the Bochner
integral on the finite-dimensional source, with the orientation signs and Jacobian factors.
For compactly supported integrable forms prove atlas independence, linearity, restriction and
partition-of-unity formulas, agreement with the scalar integral at `V = ℝ`, and
`L(∫ α) = ∫ L(α)` for every continuous linear coefficient map. Extend compactly supported
boundaryless Stokes to `V`-valued `C¹` `(n−1)`-forms by this identity and separation by the
continuous dual. Its value is in `V`; no inner product or multiplication on `V` is needed.
This is integration of oriented top forms, independent of the auxiliary density `μ`.

On the finite-dimensional source `M`, for `0 ≤ k < n` and locally integrable `V`-valued rough forms `α`
of degree `k` and `β` of degree `k + 1`
(chart-measurable with `L¹_loc` chart coefficients), say that `β` is a weak exterior derivative
of `α` when for every open `U ⊆ M`, every orientation `o` of
`U` and every smooth compactly supported scalar `(n − k − 1)`-form `φ` on `U`,
`integralTopForm o (β ∧ φ) = (−1)^{k+1} integralTopForm o (α ∧ dφ)` (for scalar forms on a
Euclidean ball: Heikkilä–Pankka, arXiv 2302.11440v2, §3, p. 7). Prove:

- uniqueness almost everywhere;
- it suffices to test on the sources of the charts of one atlas, with their model orientation,
  and on an oriented `M` it suffices to test with `U = M`;
- for a `C¹` form `α`, `TauCeti.mextDeriv α` is a weak exterior derivative, by the Leibniz rule
  and `TauCeti.integralTopForm_mextDeriv_eq_zero`;
- locality for open covers, linearity and compatibility with continuous linear coefficient
  maps; scalarization tests determine the same `V`-valued weak identity when the forms are
  already strongly measurable and locally Bochner integrable;
- for `k = 0` and `V`-valued `α`, `β` is a weak exterior derivative iff `α ∈ W^{1,1}_loc(M; V)`
  (in the sense that its representatives have `L¹_loc` weak derivatives) with `dα = β`.

For `k ≥ n`, define the weak exterior derivative to be the zero `(k + 1)`-form and prove the
corresponding locality and classical-agreement statements by vanishing of forms above the
source dimension; no truncated negative test-form degree is used.

**Checks.**

- The sign: for `k = 0`, `n = 1`, `M = ℝ`, the identity reads `∫ β φ = −∫ α φ'`, the weak
  derivative.
- On `ℝ²`, `α = sign(x₁) dx₁` has weak exterior derivative `0` and its coefficient has no weak
  derivative.
- For `v ∈ V` fixed, the identity for `α = a v` is the scalar weak identity for `a` multiplied
  by `v`; testing against scalar forms is sufficient without choosing a basis of `V`.

*Needs:* §3.2, §4.1; Tau Ceti `TauCeti.IntegrableTopForm`, `TauCeti.integralTopForm`,
`TauCeti.mextDeriv`, `TauCeti.integralTopForm_mextDeriv_eq_zero`, `TauCeti.bundleWedgeWith`;
DifferentialGeometry Layer 5.

### 8.3 Pullback commutes with `d`

Prove that for `f ∈ W^{1,p}_loc(M, N)`, a `C¹` `V`-valued `k`-form `ω` on the Banach target `N` and
`p ≥ k + 1`,
`f^♯(dω)` is a weak exterior derivative of `f^♯ω` (for scalar forms, quasiregular maps from a
Euclidean ball and `p = n`: Heikkilä–Pankka, arXiv 2302.11440v2, §3, p. 7). Route: locally, in
charts, the mollifications of §2.3 converge to the chart representative locally uniformly and
in `W^{1,p}_loc`, so the smooth pullbacks converge to `f^♯ω` in `L^{p/k}_loc` and to `f^♯(dω)`
in `L^{p/(k+1)}_loc`, both contained in `L¹_loc` because `p ≥ k + 1`; the identity of §8.2
holds for the smooth pullbacks. All test-form integration is on `M`; smooth pullback and the
exterior derivative on `N` use bounded alternating maps and Fréchet derivatives, with no target
volume or top-degree form. Prove the classical identity for smooth maps from a
finite-dimensional domain into a Banach chart using the Fréchet chain rule and symmetry of
second derivatives. For `p = ∞`, use convergence in every finite local Sobolev exponent
`q ≥ k + 1`, rather than claiming convergence of derivatives in `L^∞`.
Deduce: the pullback of a closed form is weakly closed; for closed oriented `M`,
`f ∈ W^{1,n}_loc(M, N)` and a `C¹` `V`-valued `(n−1)`-form `η` on `N`,
`∫_M f^♯(dη) = 0` in `V`.

The hypothesis `p ≥ k + 1` is needed for the statement to make sense, and it cannot be lowered
to the integrability of both sides: Hencl's Sobolev homeomorphism of the cube with zero
Jacobian almost everywhere (`p < n`) has `f^♯(dy₁ ∧ ⋯ ∧ dyₙ) = 0` while `f^♯(y₁ dy₂ ∧ ⋯ ∧ dyₙ)`
is not weakly closed. This example is cited for the hypothesis and is not a target.

**Checks.**

- `k = 0`: the statement is §4.6(b) for `ω : N → ℝ` with `p ≥ 1`.
- `M = N = ℝ²`, `ω = y₁ dy₂`, `f ∈ W^{1,2}_loc`: it says that `J_f = d(f₁ df₂)` weakly, the
  divergence form of the Jacobian.

*Needs:* §2.3, §8.1, §8.2.

### Examples

Pullback of the angular form `dθ` along maps into `S¹`; the Jacobian as a weak divergence in
every dimension, `J_f dx = d(f₁ df₂ ∧ ⋯ ∧ dfₙ)` for `f ∈ W^{1,n}_loc(ℝⁿ, ℝⁿ)`.

### Dependencies

Layers 4–5, §2.3; §6.2 for the volume-form identity; DifferentialGeometry Layer 5.

## Layer 9: immersions and smooth approximation

### 9.1 The extrinsic characterization

Let `ι : N → F` be a `C¹` split immersion of a Banach manifold into a real Banach space:
`Manifold.IsImmersionAt 𝓘(ℝ, E') 𝓘(ℝ, F) 1 ι y` at every `y`, with its chart normal form
`v ↦ (v, 0)` for a topological direct-sum complement. Extract from this normal form, near each
`y`, an open neighbourhood of `ι(y)` and a `C¹` local left inverse `r` into `N` which satisfies
`r ∘ ι = id` near `y`. Prove that a continuous `f : M → N` lies
in `W^{1,p}_loc(M, N)` iff `ι ∘ f ∈ W^{1,p}_loc(M; F)`
(`isSobolevMap_iff_memW1pLocM_comp_immersion`), and that then `D(ι ∘ f) = dι_f ∘ Df`
almost everywhere. If `dι` preserves the chosen tangent norms,
then `‖D(ι ∘ f)‖ = ‖Df‖` almost everywhere. Route: one direction is §4.6(b); for the other, near
`f(x₀)` the immersion has a `C¹` left inverse `r` defined on a neighbourhood of `ι(f(x₀))` in `F`,
and `f = r ∘ ι ∘ f` near `x₀` because `f` is continuous, so §2.1(a) applies; this is the Sobolev
form of `ContMDiffAt.iff_comp_isImmersionAtOfComplement`. In particular, on continuous maps,
the definition of `W^{1,p}_loc(M, N)` through an isometric (Nash) embedding of a
finite-dimensional `N` into a Euclidean space (Hajłasz 2009, §1, p. 185; Heikkilä–Pankka,
arXiv 2302.11440v2, proof of Prop. B.1, p. 24) gives this roadmap's class with the same
`‖Df‖`.
Derive the injective-differential version when both `N` and the ambient space are
finite-dimensional: combine the continuous linear left inverse supplied by
`IsDiffImmersionAt.of_injective_of_finiteDimensional` with the inverse function theorem to
obtain the split normal form or local left inverse. Injectivity alone is not a hypothesis
for the general Banach statement.

**Checks.**

- `ι : S¹ → ℝ²` the inclusion and `f(t) = (cos φ(t), sin φ(t))`: `f` is in the class iff
  `cos φ`, `sin φ` are, and for continuous `φ ∈ W^{1,p}_loc` both hold, with `‖Df‖ = |φ'|`.
- For Banach spaces `B`, `C`, the inclusion `B → B × C`, `v ↦ (v, 0)`, has the continuous
  linear left inverse `Prod.fst`, and gives the same Sobolev class. The injective map
  `ℓ² → ℓ²`, `(x_j) ↦ (x_j/j)` for `j ≥ 1`, has no bounded linear left inverse and is not a
  split immersion.
- Continuity of `f` is used. Let `ι : (0, 2π) → ℝ²` be an injective immersion onto a figure
  eight with `ι(t) → ι(π)` as `t → 0⁺`. On `M = (−1, 1)` let `f(t) = π` for `t ≤ 0` and
  `f(t) = t` for `t > 0`. Then `ι ∘ f` is continuous and piecewise `C¹`, hence in every
  `W^{1,p}_loc(M; ℝ²)`, while `f` is not continuous.

*Needs:* §2.1, §4.1–§4.3, §4.6, §5.1; Mathlib `Manifold.IsImmersionAt`,
`IsDiffImmersionAt.of_injective_of_finiteDimensional`.

### 9.2 Smooth retractive embeddings

Call a smooth embedding `ι : N → F` into a Banach space *retractive* when an open `U ⊆ F`
containing `ι(N)` and a smooth `r : U → N` satisfy `r(ι(y)) = y`. All smoothness assertions for
`r` are on the open submanifold `U`. Prove that this supplies the local-left-inverse argument
of §9.1 and the identity `d(ι ∘ r)_{ι(y)} ∘ dι_y = dι_y`. Such an embedding is explicit data;
no embedding or retraction theorem for arbitrary Banach manifolds is assumed.

Build these instances:

- A complemented closed linear subspace of a Banach space, with its bounded linear projection.
- The unit sphere `S(H)` of a real Hilbert space of dimension at least `2`, with its standard
  split smooth submanifold structure and `r(z) = z/‖z‖` on `H ∖ {0}`. Supply the sphere charts
  and smoothness facts consumed here from the Hilbert-space inverse function theorem and the
  orthogonal splitting `H = ℝ y ⊕ y^⊥`; finite-dimensional sphere lemmas alone do not supply
  the infinite-dimensional instance. At a unit `y`, the differential of the ambient retraction
  is `v ↦ v − ⟪y,v⟫ y`.
- A compact finite-dimensional smooth manifold embedded into a Euclidean space by
  `exists_embedding_euclidean_of_compact`. From RiemannianGeometry R6's nearest-point retraction
  `π`, defined and smooth on the tube `T_δ = {z : dist(z, ι(N)) < δ}` for some `δ > 0`,
  construct a smooth `Π : F → F` with `Π = π` on `T_{δ/2}`, with all derivatives bounded and
  `Π(z) ∈ ι(N)` for `z ∈ T_{δ/2}`. Prove that `dπ_z` at a point of `ι(N)` is the orthogonal
  projection onto the tangent space, and the Lipschitz bound
  `dist(π(z), π(z')) ≤ C |z − z'|` on `T_{δ/2}`.

For the Hilbert sphere, also construct a global smooth `Π : H → H` with bounded derivative,
equal to `z/‖z‖` when `dist(z, S(H)) < 1/4`: use a scalar smooth cutoff in `‖z‖²`, vanishing
near `0` and outside a bounded annulus. This is a bounded-support cutoff, not a compact-support
cutoff on `H`. The complemented linear subspace has `Π` equal to its projection.

**Checks.**

- `N = S^{m−1} ⊆ ℝ^m`: `π(z) = z/|z|` on `T_1`, and `dπ_z = (I − z zᵀ)` at `|z| = 1`.
- The unit sphere of `ℓ²` satisfies the retraction hypotheses but is not compact. No
  nonempty infinite-dimensional Banach manifold is compact, since it is not locally compact.
- `ι(t) = (t, t²)` from `ℝ` into `ℝ²`, with `U = ℝ²` and `r(z) = z₁`, is retractive although
  `r` is not the nearest-point retraction: `dι_t(1) = (1, 2t)`, `d(ι ∘ r)_{ι(t)}` sends `v` to
  `v₁ (1, 2t)`, so the identity `d(ι ∘ r)_{ι(t)} ∘ dι_t = dι_t` holds, while `dr` is not the
  orthogonal projection onto the tangent line for `t ≠ 0`.

*Needs:* §9.1; Mathlib Banach inverse function theorem and Hilbert orthogonal projections;
RiemannianGeometry R6 and Tau Ceti `TauCeti.exists_isTubularNeighborhood_normalBundle` for the
compact Euclidean case; Mathlib `exists_embedding_euclidean_of_compact`.

### 9.3 Intrinsic and relative smooth approximation

Prove:

- (a) for continuous `u ∈ W^{1,p}_loc(M; F)` and `p < ∞`, there are smooth `u_j : M → F` with
  `u_j → u` locally uniformly and `du_j → du` in `L^p_loc` (chartwise mollification glued with a
  smooth partition of unity on the finite-dimensional source, §2.3). Prove a version with
  pointwise error `‖u_j(x) − u(x)‖ < ε_j(x)` for prescribed positive continuous error functions
  `ε_j`, tending to `0` locally uniformly, while retaining derivative convergence;
- (b) for every smooth Banach manifold `N`, continuous `f ∈ W^{1,p}_loc(M, N)` and `p < ∞`,
  there are smooth `f_j : M → N` converging locally uniformly and in `W^{1,p}_loc` in target
  charts. Precisely, on every relatively compact source open `W` whose closure maps into one
  target chart `ψ`, the `f_j` eventually map `closure W` into `ψ.source`, the representatives
  converge uniformly there, and the functions and weak derivatives converge in `Lᵖ(W)` in
  source and target coordinates. Prove independence of these convergence conditions from the
  chosen charts using §2.1(d) and §2.2. No global target metric, embedding, retraction, smooth
  target partition of unity, or second countability of `N` is assumed;
- (c) the relative and fine-control version: if `A ⊆ M` is closed and `f` is smooth on an
  open neighbourhood `V` of `A`, choose a neighbourhood `V'` with
  `A ⊆ V' ⊆ closure V' ⊆ V` and construct all `f_j` equal to `f` on `V'`. For any prescribed
  open neighbourhoods `O_j ⊆ M × N` of the graph of `f`, require
  `(x, f_j(x)) ∈ O_j` as well as the convergence of (b). Supply homotopies from `f` to `f_j`
  fixed on `V'` whose graphs also remain in `O_j`. With `A = ∅` this includes unrestricted
  approximation. The approximants, their graph control and agreement near `A` are
  `IsSobolevMap.exists_smooth_approx_rel`, with the convergence of (b) in fixed charts written
  `TendstoSobolevLoc`;
- (d) for every smooth map `ι : N → F` into a Banach space, deduce convergence of
  `ι ∘ f_j` locally uniformly and in `W^{1,p}_loc(M; F)`, including convergence of its weak
  differentials. This applies to any smooth embedding and does not require a globally bounded
  derivative of `ι`. For targets with the retractive data of §9.2 also prove the direct
  construction `f_j = r ∘ u_j`, using (a) with error smaller than
  `dist(ι(f(x)), F ∖ U)` everywhere (any positive bound when `U = F`), as an extrinsic
  realization of the same convergence.

For (b)–(c), build the source cover from relatively compact coordinate neighbourhoods whose
images lie in convex target charts. In one such chart, smooth the representative as in (a)
and interpolate with it using a source cutoff, leaving the map unchanged outside that
neighbourhood. Keep the interpolation inside the target chart by fine pointwise error
bounds. Iterate over a countable locally finite refinement, with summable bounds on the
uniform and `Lᵖ` derivative errors on a source exhaustion; keep every support outside
`closure V'`. Prove that local finite stabilization gives global smooth maps, that the error
bounds survive target chart transitions, and that chartwise straight-line interpolations give
the controlled relative homotopies. This supplies the Sobolev estimates in addition to the
continuous-map smoothing framework of Wockel's theorem (Wockel, Thm 0.11, p. 4). Wockel alone
is not a supplier of `W^{1,p}` convergence. Every local change and every gluing estimate is
part of this target.

**Checks.**

- `p = ∞` is excluded: `f(t) = |t|` on `ℝ` is not a `W^{1,∞}` limit of `C¹` functions.
- For `N = S¹`, `M = ℝ` and `f(t) = e^{iφ(t)}` with `φ` continuous in `W^{1,p}_loc`, the maps
  `e^{iφ_j}` with `φ_j` the mollifications of `φ` are such approximations.
- Continuous Sobolev maps into `S(ℓ²)` admit the same approximation using normalization of
  sufficiently close ambient approximants.
- If `f` is already smooth near a closed set `A`, all approximants agree with it on one fixed
  neighbourhood of `A`; in particular no prescribed smooth data there are changed.

*Needs:* §2.1(d), §2.2–§2.3, §4.5–§4.6; Mathlib source `SmoothPartitionOfUnity`, source
exhaustions and locally finite refinements; Wockel, Thm 0.11, p. 4.
Part (d)'s direct retraction construction additionally uses §9.2.

### Examples

Maps into finite-dimensional spheres and tori and into the Hilbert sphere; the identification of
`W^{1,p}_loc(M, S^{m−1})` with continuous `u ∈ W^{1,p}_loc(M; ℝ^m)` with `|u| = 1`.

### Dependencies

Layers 4–5, §2.3; RiemannianGeometry R6.

## Layer 10: extrinsic spaces on a compact source

Throughout this layer `M` is compact and boundaryless of finite dimension `n` with a smooth
structure, a positive continuous density `μ`, and compatible continuous source tangent norms.
The target `N` is a smooth Banach manifold with a specified smooth retractive embedding
`ι : N → F` into a Banach space whose image is closed. The retraction data are *controlled*:
there is `δ > 0` for which `T_δ = {z : dist(z, ι(N)) < δ} ⊆ U`, and a globally defined `C¹`
map `Π : F → F` with bounded derivative and `Π = ι ∘ r` on `T_{δ/2}`. The local retraction
`r` is smooth; `Π` need only be `C¹`. §9.2 proves these hypotheses for compact
finite-dimensional targets in Euclidean space, complemented closed subspaces, and the Hilbert
sphere. Compactness of a Banach target is not an assumption.

### 10.1 The space `W^{1,p}_ι(M, N)`

Define `W^{1,p}_ι(M, N)` as the set of `u ∈ W^{1,p}_loc(M; F)` with `u(x) ∈ ι(N)` for almost every
`x`, with the metric of the carrier of §7.3. Prove:

- *tangency*: `du(x)` takes values in `dι(T_y N)`, `ι(y) = u(x)`, for almost every `x`; route:
  `Π ∘ u = u` almost everywhere and §2.1(b) give `du = dΠ_u ∘ du`;
- *comparison of embeddings*: if `ι' : N → F'` also has the stated data and
  there are globally `C¹` maps `Φ : F → F'`, `Ψ : F' → F` with bounded derivatives satisfying
  `Φ ∘ ι = ι'`, `Ψ ∘ ι' = ι`, then for `p < ∞`, `u ↦ Φ ∘ u` is a homeomorphism
  `W^{1,p}_ι(M, N) → W^{1,p}_{ι'}(M, N)` with inverse induced by `Ψ` (§2.1(b)–(c)).
  Prove the required extensions exist for any two Euclidean embeddings of a compact
  finite-dimensional `N`, using §9.2 and smooth cutoffs; in that case write `W^{1,p}(M, N)`.
  For general targets the embedding remains part of the notation unless such comparison data
  have been supplied;
- *continuous members*: for continuous `u : M → F` with values in `ι(N)`,
  `u ∈ W^{1,p}_ι(M, N)` iff `ι⁻¹ ∘ u ∈ W^{1,p}_loc(M, N)` (§9.1);
- `W^{1,p}_ι(M, N)` is closed in the carrier of §7.3 for `p < ∞`.

This is a subset of the Banach-valued carrier extended in §7.3. Prove that the definition,
with its fixed embedding, is independent of the finite source atlas, positive continuous
source density and compatible source tangent norms up to
equivalent norms. No embedding-independent global space for arbitrary Banach targets is claimed.

**Checks.**

- `N = S^{m−1}`: `W^{1,p}(M, S^{m−1})` is the set of `u ∈ W^{1,p}(M; ℝ^m)` with `|u| = 1` almost
  everywhere, and tangency is `⟨u, du⟩ = 0`, obtained by differentiating `|u|² = 1`.
- For `N` a finite set of points, `W^{1,p}_ι(M, N)` consists of the maps almost everywhere
  constant on each component of `M`.
- For `N = S(H)`, the standard embedding gives `u ∈ W^{1,p}(M; H)` with `‖u‖ = 1` almost
  everywhere and `⟪u, du(v)⟫ = 0` for every tangent vector `v`, almost everywhere in `x`.
- Embedding comparison needs its bounds even for a noncompact finite-dimensional target.
  On a closed surface, a cutoff of `u(x) = log(1/|x|)` in a chart belongs to `W^{1,1}(M; ℝ)`,
  while `sinh ∘ u` does not, since its derivative has size comparable to `|x|⁻²` near the
  chart centre. Both `id : ℝ → ℝ` and `sinh : ℝ → ℝ` are smooth retractive embeddings with
  the global ambient retraction `Π = id`; their changes of embedding do not satisfy the
  two bounded-derivative extension hypotheses.

*Needs:* §2.1, §7.3, §9.1, §9.2.

### 10.2 Morrey's theorem

Prove that for `p > n` every element of `W^{1,p}_ι(M, N)` has a continuous representative, which
lies in `W^{1,p}_loc(M, N)` after composing with `ι⁻¹`, so `W^{1,p}_ι(M, N)` is the set of
continuous members of the class with `‖Df‖ ∈ Lᵖ(M)` (for compact targets embedded in a
Euclidean space, the Sobolev embedding step of Hajłasz 2009, proof of Thm 2.1, p. 188).

**Checks.**

- At `p = n = 2` the statement fails: with `θ = χ log log(1/|x|)` in a chart of a closed surface
  `M`, `χ` a cutoff, `x ↦ (cos θ, sin θ)` lies in `W^{1,2}(M, S¹)`
  (`|Dθ| ≈ 1/(|x| log(1/|x|))` and `∫₀ dr/(r log²(1/r)) < ∞`) and has no continuous
  representative.

*Needs:* §2.4, §10.1. Closedness of `ι(N)` and full support of the source density measure ensure that
the continuous representative takes values in `ι(N)` everywhere.

### 10.3 Density of smooth maps for `p ≥ n`

Prove that for `n ≤ p < ∞` the maps `ι ∘ g`, `g : M → N` smooth, are dense in `W^{1,p}_ι(M, N)`
(`exists_smooth_approx_of_controlledRetraction`, with convergence in `Lᵖ` on every compact
subset of every chart). For a compact finite-dimensional target and a smooth embedding
`ι : N → ℝᵐ` this is Schoen–Uhlenbeck's theorem (Hajłasz 2009, Thm 2.1, p. 188, and its proof
for `p = n`): every `u ∈ W^{1,p}(M; ℝᵐ)` with `u(x) ∈ ι(N)` for almost every `x` is the
limit of `ι ∘ g_j` for smooth `g_j : M → N`, with `ι ∘ g_j → u` and `D(ι ∘ g_j) → Du` in `Lᵖ`
on every compact subset of every chart (`exists_smooth_approx_of_ae_mem_range`). Route: for `p > n`,
§10.2 and §9.3. For `p = n ≥ 1`, mollify `u` with a partition
of unity subordinate to finitely many charts; by the oscillation bound of §2.3,
`dist(u_ε(x), ι(N)) ≤ ⨍ |u_ε(x) − u(z)| dz ≤ C sup_x ‖Du‖_{Lⁿ(B_{Cε}(x))} → 0` uniformly in `x`,
so `r ∘ u_ε` is defined for small `ε` and smooth. Its ambient representative is `Π ∘ u_ε`;
§2.1(b)–(c) give convergence to `Π ∘ u = u` in `W^{1,n}`. Banach-valued Poincaré and
absolute continuity of the integral supply the same uniform estimate without compactness of
`ι(N)`. Account for the source partition of unity in the oscillation estimate. The
zero-dimensional compact source is finite and requires no approximation argument.

**Checks.**

- The map of §10.2's Check is in `W^{1,2}(M, S¹)`, discontinuous, and a `W^{1,2}` limit of smooth
  maps: discontinuous maps occur in the closure at `p = n`.
- The same density conclusion holds for `S(ℓ²)` under its standard controlled retractive
  embedding; its noncompactness does not enter the uniform tube estimate.

*Needs:* §2.3, §9.2, §9.3, §10.1, §10.2.

### 10.4 Comparison with intrinsic weak maps

For a compact finite-dimensional second-countable `N` and any smooth Euclidean embedding
`ι : N → F`, prove that the intrinsic local homogeneous class of §5.4, the intrinsic global
homogeneous class on compact `M`, and the maps represented in `W^{1,p}_ι(M, N)` agree modulo
almost-everywhere equality (Convent–Van Schaftingen, Prop. 1.6, p. 6, and Prop. 2.6, p. 11, for
closed and isometric embeddings). The distance-value term is automatic for a compact target.
For the tangent norm induced by `ι`, prove
`D(ι ∘ u) = dι_u ∘ Du` and `‖D(ι ∘ u)‖ = ‖Du‖` almost everywhere. Other compatible target
norms on compact `N` give equivalent energy norms and the same membership.

Route: the coordinate functions of `ι` restricted to compact `N` are admissible colocal
probes, and their weak derivatives assemble into the Euclidean derivative; boundedness of
the image gives the value `Lᵖ` condition. Conversely, extend each compactly supported target
probe to a smooth ambient function with bounded derivative using §9.2, and apply §2.1(b).
Identify the colocal and extrinsic derivatives by §4.8's uniqueness and tangency. This uses
only fixed compact-target comparison data, not an assumed intrinsic metric on the space of
all weak maps. Transport the extrinsic topology and the density and degree statements along
this identification; its independence from the Euclidean embedding follows from §10.1.

For a noncompact finite-dimensional target the intrinsic classes of §5.4 are still defined.
No equivalence with an arbitrary extrinsic global space is asserted without the value-growth
and derivative bounds needed for that embedding, as the `sinh` example of §10.1 shows.

**Checks.**

- A sphere-valued intrinsic map corresponds exactly to an ordinary vector-valued Sobolev map
  with unit norm almost everywhere; no continuity is assumed at `p ≤ dim M`.
- At `p > dim M`, §10.2 gives a continuous representative and §5.4 identifies it with the
  continuous class of §4.2.

*Needs:* §2.1, §4.7–§4.8, §5.4, §9.2, §10.1–§10.3; Convent–Van Schaftingen, Prop. 1.6, p. 6,
and Prop. 2.6, p. 11.

### Examples

`W^{1,p}(S², S²)` for `p ≥ 2` and its smooth dense subset; `W^{1,p}(T², S¹)` and the integer
periods `∫_γ u^♯dθ / 2π` of continuous members.

### Dependencies

§2.3–§2.4, §5.4, §7.3, Layer 9.

## Layer 11: degree

Throughout this layer `M` and `N` are finite-dimensional, closed, connected and oriented, of
the same dimension `n ≥ 1`, with smooth metrics. The target `N` is embedded into a Euclidean
space as in §9.2. The degree `deg` is that of DifferentialGeometry 10.4–10.5 for continuous
maps.
The intrinsic weak maps of §5.4 are identified with the extrinsic carrier by §10.4, so the
degree below also defines their degree, with the same integral formula and continuity.

### 11.1 Continuous `W^{1,n}` maps

Prove that for `f ∈ W^{1,n}_loc(M, N)` and every continuous `n`-form `ω` on `N`,
`∫_M f^♯ω = deg(f) ∫_N ω`. In particular `∫_M J_f d vol_M = deg(f) vol(N)` and
`|deg f| vol(N) ≤ ∫_M ‖Df‖ⁿ`. Route: the approximations `f_j` of §9.3 converge uniformly, so
for large `j` they are homotopic to `f` through `t ↦ ι⁻¹ π((1 − t) ι f_j + t ι f)` and
`deg f_j = deg f`; DifferentialGeometry 10.4 gives the formula for `f_j` and smooth `ω`; the
integrals converge by §8.1, since `f_j^♯ω → f^♯ω` in `L¹`.

**Checks.**

- `z ↦ zᵏ` on `S¹`: `∫ f^♯dθ = 2πk`.
- On `M = N = Sⁿ`, let `f` be the identity outside the unit ball `B` of a chart and the radial
  map `x ↦ |x|^{a−1} x` on `B`, with `0 < a < 1`. It is a homeomorphism of degree `1` in
  `W^{1,n}` (`‖Df‖ⁿ ≈ |x|^{n(a−1)}` is integrable), `J_f` is unbounded near the centre, and
  `∫ J_f = vol(Sⁿ)`.

*Needs:* §6.3, §8.1, §9.3; DifferentialGeometry 10.4–10.5.

### 11.2 The degree of a `W^{1,n}` map

For `u ∈ W^{1,n}_ι(M, N)`, with the pullback `u^♯ω = u^*(π^*ω)` of §8.1 taken extrinsically
(well defined by tangency, §10.1), define `deg u = ∫_M u^♯ω` for an `n`-form `ω` on `N` with
`∫_N ω = 1`. Prove that it does not depend on `ω` or `ι`,
that it is an integer, that it is locally constant on `W^{1,n}_ι(M, N)` (the integral degree
and its continuity in `W^{1,n}`: Hajłasz 2009, proof of Thm 2.3, p. 190), that it equals the
degree of every smooth map close enough to `u` in `W^{1,n}` (which exist by §10.3), and that it
equals `deg u` of §11.1 for continuous `u`.

**Checks.**

- Let `γ : ℝ → S²` trace a great circle with unit speed and `θ = χ log log(1/|x|)` in a chart
  centred at `p ∈ S²`, with `χ` a cutoff. Then `u = γ ∘ θ : S² → S²` is in `W^{1,2}`, is
  discontinuous at `p`, and has degree `0`, since `Du` has rank at most `1` and `J_u = 0`.
- For continuous `u` the definition returns the degree of §11.1; for `u` the identity of `S²`,
  `deg u = 1`.
- The antipodal map `a` of `S²` reverses the orientation, so `J_a = −1` for the round metric and
  `∫ a^♯ω = −∫ ω`: `deg a = −1`. A definition integrating `|J_u|` would give `1`.

*Needs:* §8.1, §8.3, §10.1, §10.3, §11.1.

### 11.3 Failure of density below `n`

Prove that for `n ≥ 2` and `n − 1 ≤ p < n`, the map `u(x) = x/|x|` of the open unit ball
`B ⊆ ℝⁿ` lies in `W^{1,p}(B; ℝⁿ)` with values in `S^{n−1}`, and that for a weak derivative
`Du` of `u` on `B` there is no sequence of maps `v_j : B → S^{n−1}`, smooth on `B`, with
`v_j → u` and `Dv_j → Du` in `Lᵖ(B)` (`not_exists_smooth_sphere_approx_radial`; Hajłasz 2009,
Thm 2.3, p. 189). Route: by Fubini in polar coordinates, for almost every `r ∈ (0, 1)` a
subsequence of `v_j|_{∂B_r}` converges to `u|_{∂B_r}` in `W^{1,n−1}(∂B_r)`; the degree of
§11.2 (with `M = ∂B_r ≅ S^{n−1}`, `N = S^{n−1}`, dimension `n − 1`) is continuous there, `0` for
`v_j|_{∂B_r}`, which extends over `B_r`, and `1` for `u|_{∂B_r}`.

**Checks.**

- `n = 2`, `p = 1`: `x/|x|` is in `W^{1,1}(B; ℝ²)` (`|Du| = 1/|x|`) and is not a `W^{1,1}` limit
  of smooth maps into `S¹`.
- `p ≥ n` does not apply: `x/|x| ∉ W^{1,n}(B)`.

*Needs:* §11.2; Mathlib polar coordinates (`MeasureTheory.Measure.toSphere`,
`homeomorphUnitSphereProd`).

### Examples

Degrees of `z ↦ zᵏ` and of the antipodal map of `Sⁿ` computed as `∫ J`; the Jacobian of a
`W^{1,n}` map of closed manifolds of nonzero degree is not almost everywhere zero.

### Dependencies

§6.3, Layers 8–10; DifferentialGeometry 10.4–10.5.

## Downstream consumers

- **QuasiregularMaps** builds quasiregular maps between oriented Riemannian manifolds on
  `W^{1,n}_loc(M, N)`, `Df`, `‖Df‖` and `J_f`, citing §1.2, §3.1, §3.3, §4.2–§4.6, §5.1–§5.3,
  §6.1–§6.3 and §7.1. Its Parts II and III (Reshetnyak's theory; the cohomological bounds of
  Bonk–Heinonen, Prywes and Heikkilä–Pankka) consume Layers 8 and 11.
- A roadmap on harmonic maps between Riemannian manifolds would start from Layers 5, 9 and 10.

## References

- W. P. Ziemer, *Weakly Differentiable Functions*, GTM 120, Springer, 1989: Ch. 2 (weak
  derivatives, chain rule, change of variables, Lebesgue points).
- T. Iwaniec, G. Martin, *Geometric Function Theory and Non-linear Analysis*, Oxford, 2001:
  Ch. 4–6 (Sobolev mappings, pullback of forms, the Jacobian as a weak divergence).
- S. Rickman, *Quasiregular Mappings*, Springer, 1993: Ch. I (the class `W^{1,n}_loc ∩ C`).
- J. M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., GTM 218, Springer, 2012: Ch. 6 (sets
  of measure zero and their images under `C¹` maps), Ch. 15 (orientations and the Riemannian
  volume form in oriented charts).
- O. Martio, S. Rickman, J. Väisälä, *Definitions for quasiregular mappings*, Ann. Acad. Sci.
  Fenn. Ser. A I 448 (1969), p. 6 (the Jacobian `J(x, f)`).
- P. Hajłasz, *Sobolev mappings between manifolds and metric spaces*, in *Sobolev Spaces in
  Mathematics I*, Int. Math. Ser. 8, Springer, 2009, 185–222: §1, p. 185 (the class
  `W^{1,p}(M, N)` through an isometric embedding) and p. 187 (Riemannian metrics on a compact
  manifold are equivalent), Thm 2.1 and (2.1), p. 188 (density for
  `p > dim M` and the oscillation estimate behind `p = dim M`), Thm 2.3, p. 189 (`x/|x|`).
- P. Hajłasz, T. Iwaniec, J. Malý, J. Onninen, *Weakly differentiable mappings between
  manifolds*, Mem. Amer. Math. Soc. 192 (2008), no. 899 (intrinsic and extrinsic definitions,
  chain rules).
- F. Hélein, J. C. Wood, *Harmonic maps*, in *Handbook of Global Analysis*, Elsevier, 2008, §2
  (Sobolev maps between manifolds, density).
- R. Schoen, K. Uhlenbeck, *Boundary regularity and the Dirichlet problem for harmonic maps*,
  J. Differential Geom. 18 (1983), 253–268, §4 (density for `p ≥ n`; `x/|x|`).
- F. Bethuel, X. Zheng, *Density of smooth functions between two manifolds in Sobolev spaces*,
  J. Funct. Anal. 80 (1988), 60–75.
- H. Brezis, L. Nirenberg, *Degree theory and BMO; Part I*, Selecta Math. 1 (1995), 197–263.
- M. Marcus, V. J. Mizel, *Every superposition operator mapping one Sobolev space into another is
  continuous*, J. Funct. Anal. 33 (1979), 217–229.
- W. Arendt, M. Kreuter, [*Mapping theorems for Sobolev-spaces of vector-valued
  functions*](https://arxiv.org/abs/1611.06161), Studia Math. 240 (2018), 275–299:
  Bochner weak derivatives, smooth and Lipschitz composition, the Radon–Nikodým distinction,
  and Banach-valued Morrey estimates (§§2–6; Thm 4.2, p. 9 and Thm 6.2, p. 17 in the numbering
  of arXiv 1611.06161v1). The local smooth chain rule, mollification and
  segment-integral estimates here use these Banach-valued arguments; the retraction results
  state the geometric data needed to apply them.
- A. Convent, J. Van Schaftingen, [*Intrinsic colocal weak derivatives and Sobolev spaces
  between manifolds*](https://arxiv.org/abs/1312.5858), Ann. Sc. Norm. Super. Pisa Cl. Sci.
  (5) 16 (2016), 97–128: compact target probes, measurable patching of the weak differential,
  intrinsic homogeneous energy classes and comparison with embedded definitions. Sections
  4.7–4.8 and 5.4 specify the basic intrinsic calculus; the roadmap does not adopt the paper's
  Hilbert–Schmidt norm as its operator norm, or assert its full metric and completeness theory.
  Definitions and propositions are cited in the numbering of arXiv 1312.5858v1.
- C. Wockel, [*A generalisation of Steenrod's approximation
  theorem*](https://arxiv.org/abs/math/0610252), 2006, Thm 0.11, p. 4 of arXiv
  math/0610252v1: relative smoothing through locally convex
  target charts, graph control and relative homotopies. Section 9.3 adds the first-order
  Sobolev error estimates needed for its Banach-target statement.
- S. Hencl, *Sobolev homeomorphism with zero Jacobian almost everywhere*, J. Math. Pures Appl. 95
  (2011), 444–458.
- S. Heikkilä, P. Pankka, *De Rham algebras of closed quasiregularly elliptic manifolds are
  Euclidean*, Ann. of Math. 201 (2025), no. 2, 3, cited in the numbering of arXiv
  2302.11440v2: p. 1 (quasiregular maps in `W^{1,n}_loc(M, N)`, with `‖Df‖` and `J_f`) and the
  proof of Prop. B.1, p. 24 (membership in `W^{1,∞}(M, N)` through a Nash embedding).
