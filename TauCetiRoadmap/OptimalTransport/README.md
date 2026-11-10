# Roadmap: optimal transport and Wasserstein geometry

**Summary.** Optimal transport is not one theorem.  Its reusable core is a chain of structures:
couplings and pushforwards, lower-semicontinuous minimization, Kantorovich duality,
Wasserstein geometry, transport maps, convex and Monge--Ampère theory, dynamic plans and
continuity equations, and metric gradient flows.  Entropic transport, barycenters, and
Gromov--Wasserstein then reuse that chain rather than living as isolated algorithms.

This roadmap builds that entire chain.  In particular, **Brenier's theorem,
Monge--Ampère regularity, the Benamou--Brenier formula, Wasserstein gradient flows,
Sinkhorn and entropic transport, Wasserstein barycenters, and Gromov--Wasserstein are all
required milestones**.  The bar for completion is a library in which a researcher can
state a new transport problem at its natural level of generality without rebuilding the
measure-theoretic or geometric foundations.

## Scope and ownership

Cédric Villani's [*Optimal Transport: Old and
New*](https://link.springer.com/book/10.1007/978-3-540-71050-9) is the main classical
spine.  It is substantially broader than a route based only on quadratic transport, and
it keeps general costs, Polish spaces, Wasserstein geometry, displacement convexity,
Riemannian transport, and Ricci-curvature applications in view.  Villani's
[*Topics in Optimal Transportation*](https://bookstore.ams.org/gsm-58/) and Filippo
Santambrogio's [*Optimal Transport for Applied
Mathematicians*](https://link.springer.com/book/10.1007/978-3-319-20828-2) supply shorter
proof routes and concrete checks.

The roadmap does not copy a book chapter by chapter.  Formalization order is dependency
order, and several required subjects matured after Villani's books:

* Ambrosio--Gigli--Savaré (AGS), [*Gradient Flows in Metric Spaces and in the Space of
  Probability Measures*](https://link.springer.com/book/10.1007/978-3-7643-8722-8), is
  the spine for metric gradient flows, minimizing movements, and the Wasserstein
  differential calculus;
* Figalli's [survey of Monge--Ampère and optimal
  transport](https://arxiv.org/abs/1310.6167), together with the original regularity
  sources it cites, controls the distinction between Aleksandrov, Sobolev, and classical
  regularity;
* Peyré--Cuturi, [*Computational Optimal
  Transport*](https://optimaltransport.github.io/book/), Léonard's
  [survey of the Schrödinger
  problem](https://arxiv.org/abs/1308.0215), and Cuturi's
  [Sinkhorn paper](https://papers.neurips.cc/paper_files/paper/2013/hash/af21d0c97db2e27e13572cbf59eb343d-Abstract.html)
  guide the entropic and computational layer;
* Agueh--Carlier's [Wasserstein barycenter
  paper](https://epubs.siam.org/doi/10.1137/100805741) and Mémoli's
  [Gromov--Wasserstein paper](https://doi.org/10.1007/s10208-011-9093-5) guide the two
  corresponding layers.

The roadmap owns the structural theory of the subject.  Multi-marginal transport belongs
to it because it feeds barycenters.  Mass-varying, partial, martingale, causal, and
stochastic-control variants are outside its scope: the public coupling, cost, and duality
APIs must admit them as extensions, and their specialized representation theorems are not
targets here.

Ownership against other developments is as follows.

* This roadmap owns couplings, transport costs, Kantorovich duality, Wasserstein spaces,
  transport maps, the Monge--Ampère theory of transport, dynamic plans, metric gradient
  flows, entropic transport, barycenters, synthetic curvature defined through transport, and
  Gromov--Wasserstein.  Tau Ceti's optimal-transport library (`TauCeti.IsCoupling`,
  `TauCeti.transportCost`, `TauCeti.wassersteinEDist` and the declarations built on them) is
  this roadmap's implementation; its implemented targets stay in the layers below as their
  specification.
* The [Hopf--Rinow roadmap](../../Completed/HopfRinow/README.md), Layers 1--4, owns the
  Levi-Civita connection, exponential maps, completeness, minimizing geodesics, and metric
  length and geodesic spaces.
  [RiemannianGeometry](../RiemannianGeometry/README.md), R1--R3 and R4.6, owns the curvature
  calculus over Tau Ceti's Ricci tensor `CovariantDerivative.ricciTensor`, Jacobi fields,
  conjugate points, injectivity radius, the cut locus, its measurability and volume-nullity,
  and smoothness of squared distance off the cut relation.  The
  [DifferentialGeometry roadmap](../DifferentialGeometry/README.md), Layer 12 (12.2--12.5), owns
  the Riemannian gradient, divergence, Hessian, volume density and divergence theorem over Tau Ceti's Riemannian
  volume `TauCeti.riemannianVolume`.  Layer 7 here owns squared-distance semiconcavity and the
  transport-facing measurable selections.
* [GeometricMeasureTheory](../GeometricMeasureTheory/README.md), G2, owns the weighted area
  formula for Lipschitz maps.  Layer 6 here owns only its extension to approximately
  differentiable gradients of convex functions.
* Tau Ceti implements weak derivatives and the weak Sobolev spaces (`TauCeti.HasWeakFDerivOn`,
  `TauCeti.W1p`, `TauCeti.Wkp`), which Layers 5.9 and 6 consume directly.  The
  [PDE roadmap](../PDE/README.md), Layers 1, 2 and 6, builds on them and owns
  Rellich--Kondrachov on Lipschitz domains, Hölder spaces, bounded mean oscillation, and the
  concrete heat semigroup; the
  [one-parameter-semigroups roadmap](../../Completed/OneParameterSemigroups/README.md) owns
  C₀ semigroups, generators, resolvents, and the Hille--Yosida theorem.
* Mathlib owns the Kullback--Leibler divergence `InformationTheory.klDiv`, its
  composition-product chain rule, and its data-processing inequalities, which Layer 11
  consumes.
* The following are not targets of this roadmap: a Benamou--Brenier formula on Banach spaces or
  on nonsmooth metric-measure spaces, and Schrödinger bridges over Riemannian or abstract Markov
  reference processes.  Layer 8 stops at finite-dimensional normed spaces and smooth Riemannian
  manifolds: complete ones for the velocity field of an absolutely continuous curve, compact ones
  for the converse and the Riemannian Benamou--Brenier formula (8.9).  Layer 13 stops at the
  Euclidean Brownian reference.

## Conventions

### The generality contract

"As general as possible" means **the strongest mathematically valid statement with its
real hypotheses visible**.  It does not mean putting every theorem behind the largest
typeclass context.  The development follows these rules.

1. **Definitions start at the measurable level.**  A coupling is a measure on a product
   with prescribed marginals.  Transport-map feasibility is Mathlib's
   [`ProbabilityTheory.HasLaw T ν μ`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Probability/HasLaw.html#ProbabilityTheory.HasLaw):
   `T` is `μ`-a.e.-measurable and pushes `μ` to `ν`.  Neither notion needs a topology,
   metric, density, normalization, or equal source and target type.  Results also cover
   finite measures of equal mass where normalization is irrelevant, while
   `ProbabilityMeasure` is the canonical bundled public type for probability transport.
2. **Costs are extended-valued first.**  The primary primal cost is a measurable
   `c : X × Y → ℝ≥0∞` integrated with `lintegral`.  This represents forbidden pairs,
   unbounded costs, and infinite optima without totalizing subtraction or a divergent
   Bochner integral.  A second interface treats real or extended-real costs bounded below
   by an integrable split function `a x + b y`, and proves independence of the chosen
   normalization.
3. **Topology enters theorem by theorem.**  Abstract minimization first says that a lower
   semicontinuous cost functional attains its infimum on a nonempty compact coupling set.
   Compact-metrizable and Polish existence theorems are consequences, using weak
   convergence, tightness, and Portmanteau.  A broader Radon-space specialization must
   explicitly assume the tightness/Prokhorov compactness property it uses; Radon alone is
   not enough.  Compactness is never baked into `Coupling`.
4. **Duality names its regime.**  Finite continuous costs on compact spaces, nonnegative
   lower-semicontinuous costs on Polish spaces, and broader measurable costs have
   different attainment and measurability statements.  Prove each correct theorem; do not
   advertise arbitrary Borel strong duality where a duality gap or nonmeasurable
   transform can occur.
5. **Wasserstein exponents use Mathlib's full `Lp` scale.**  Take `p : ℝ≥0∞` and define
   transport displacement through `eLpNorm`; prove metric laws under `1 ≤ p`.  For
   `p < ∞`, connect this to the familiar integral-and-`p`th-root formula and finite
   `p`-moments.  On an extended metric base use an anchored finite-distance component;
   only on an ordinary metric base with the measurable-distance/standard-Borel
   compatibility stated in Layer 3 is the usual moment subtype provably one component.
   At `p = ∞`, prove that the same definition is the essential-supremum formula for
   `W_∞` whenever the ground distance is jointly measurable; without that hypothesis
   Mathlib's `eLpNorm` is `∞` on a function that is not almost everywhere strongly
   measurable, at every exponent.  Theorems specialize to `p = 1` or `p = 2` only when their mathematics does.
6. **Metric and linear dynamics are separate.**  Dynamic plans, absolutely continuous
   curves, metric derivatives, and displacement geodesics live on complete separable
   metric or geodesic spaces.  Vector fields, divergence, the Eulerian continuity
   equation, and Benamou--Brenier require a normed vector space, a smooth Riemannian
   manifold, or an explicitly built nonsmooth differential structure.
7. **Map theorems expose the mechanism.**  The abstract theorem uses a `c`-subdifferential,
   a.e. differentiability of the potential, and a twist/injectivity hypothesis.  Euclidean
   Brenier, strictly convex displacement costs, and Riemannian McCann transport are
   corollaries with their own exact hypotheses.  There is no transport-map existence
   theorem on arbitrary metric spaces.
8. **Regularity is never inferred from existence.**  Convex Aleksandrov solutions,
   viscosity solutions, Sobolev solutions, and classical solutions are distinct notions.
   Every Monge--Ampère estimate carries its domain convexity, density bounds, boundary
   regularity, and cost-geometry assumptions explicitly.
9. **Quotients are honest.**  Gromov--Wasserstein is a pseudometric on raw presentations
   of metric-measure spaces and a metric only after quotienting by measure-preserving
   isometry of supports.  The API must not turn a zero-distance theorem into definitional
   equality.
10. **No omnibus typeclass.**  Do not create an `OptimalTransportSpace` class.  Reuse
    Mathlib's measurable, topological, metric, normed, manifold, and probability
    vocabulary and state only the assumptions used by each result.

This tiered design is more general than any one textbook while remaining reviewable: a
general abstract result is paired with the canonical Polish, Euclidean, Riemannian,
finite, and metric-measure specializations that make its hypotheses usable.

### Pinned conventions

Convention mismatches in this subject silently change formulas.  Fix these before code is
written.

* The coupling relation `TauCeti.IsCoupling π μ ν` takes the plan first and means
  Mathlib's marginal measures `π.fst = μ` and `π.snd = ν`.  This order agrees with the
  closest substantial Lean prior art and supports dot notation such as `hπ.map`.  The
  bundled probability coupling `TauCeti.Coupling μ ν` is the subtype of
  `ProbabilityMeasure (X × Y)` satisfying this relation.
  Use `ProbabilityMeasure`; do not introduce a synonym such as `ProbDist`.
* Use Mathlib's `ProbabilityTheory.HasLaw T ν μ` for transport-map feasibility; do not
  introduce an `IsTransportMap` synonym.  Its argument order is function, target law,
  source measure.  Use `MeasurePreserving T μ ν` only when genuine everywhere
  measurability is part of a theorem.  Map-induced plans are
  `Measure.map (fun x ↦ (x,T x)) μ`; equality and uniqueness of maps are always
  `μ`-a.e.
* The root `TauCeti.transportCost c μ ν` takes raw measures and is the infimum of
  `∫⁻ z, c z ∂π` over proofs that `π` couples them.  Empty feasible sets--including
  unequal-mass data--and infinite costs retain value `∞`.  Probability wrappers use the
  bundled coupling subtype; probability measures always have the product coupling, so
  that feasible set is nonempty.
* The dual constraint is `φ x + ψ y ≤ c (x, y)`.  The `c`-transform is the infimal
  transform `φᶜ(y) = inf_x (c(x,y) - φ(x))`; even the finite-real branch has an
  extended-real codomain because this infimum can be `-∞`.  Pin the argument order and
  safe extended subtraction in the name and provide the symmetric transform rather than
  relying on users to swap a product.
* For `p : ℝ≥0∞`, the foundational value is
  `inf_{π ∈ Coupling μ ν} eLpNorm (fun z ↦ edist z.1 z.2) p π`.  When
  `1 ≤ p < ∞`, prove it equals
  `(inf_π ∫ d(x,y)^p dπ)^(1/p)`; the `MemLp` finite-moment subtype gets the real-valued
  `dist`.  At `p = ∞` and for a jointly measurable ground distance, prove it equals the
  infimum of the `π`-essential supremum of `d`, not merely a limit as finite exponents grow;
  this is `TauCeti.wassersteinEDist_top`.  The measurability hypothesis is load-bearing: on
  the two-point discrete metric space with the trivial σ-algebra, the only coupling of the
  only probability law has a distance function that is not almost everywhere strongly
  measurable, so the `eLpNorm` side is `∞` while the essential supremum is `1`; with the
  full σ-algebra and marginals `δ₀`, `δ₁` both sides are `1`.
* Quadratic Wasserstein distance uses `d(x,y)^2`.  The Euclidean Brenier potential and
  Legendre formulas use `c(x,y) = ‖x-y‖² / 2`.  Every bridge theorem accounts for this
  factor.
* A displacement interpolation induced by a plan `π` is
  `Measure.map (fun z ↦ γ_z t) π`, where `γ_z` is a selected constant-speed geodesic
  from `z.1` to `z.2`.  In a vector space this is
  `Measure.map (fun z ↦ (1-t) • z.1 + t • z.2) π`.
* The continuity equation is `∂ₜ μₜ + div(vₜ μₜ) = 0` in distributional form.  Its sign
  and test-function identity are pinned together in the definition.
* Dynamic `p`-action is `A_p(γ)=∫₀¹ |γ̇_t|^p dt`, with no factor `1/p`; kinetic energy
  `A_p/p` gets a separately named definition.  Thus the displayed Benamou--Brenier value
  is `W_p^p`.  The quadratic Jordan--Kinderlehrer--Otto (JKO) penalty remains
  `W₂²/(2τ)`.
* `λ`-geodesic convexity means
  `Φ(γ_t) ≤ (1-t)Φ(γ₀)+tΦ(γ₁)-(λ/2)t(1-t)d(γ₀,γ₁)²`.  The evolution variational
  inequality `EVI_λ` means
  `(1/2) ∂ₜd(x_t,y)² + (λ/2)d(x_t,y)² ≤ Φ(y)-Φ(x_t)`.  These conventions give
  `e^{-λt}` contraction, and `ν ↦ W₂(ν,μ)²/2` is `1`-convex along generalized geodesics
  based at `μ`.
* Mathlib's nonnegative `InformationTheory.klDiv μ ν` is the finite-measure
  I-divergence and includes the correction `ν univ - μ univ`; it agrees with ordinary
  Kullback--Leibler (KL) divergence for probability measures.  Entropic OT uses this API
  and always names its reference measure or Gibbs kernel.  The AGS/Riemannian
  curvature-dimension (RCD) Boltzmann entropy
  `∫ ρ log ρ dm` against a possibly infinite reference measure is a separate signed
  extended-real functional,
  with bridge lemmas (and the additive mass constant) in the finite-reference regime.
  `KL(π | μ ⊗ ν)` and `KL(π | R)` are not silently identified.
* `GW_p` uses the full pairwise distortion integral and no hidden factor `1/2`.  State
  comparison lemmas for sources that use the half-distance convention.

## Exact supplier contracts

### From Mathlib

The pinned Mathlib revision has much of the measure-theoretic substrate, but no public
optimal-transport namespace or Wasserstein metric.  Consume the following rather than
rebuilding it.

* `Measure`, `ProbabilityMeasure`, `Measure.map`, product measures,
  `ProbabilityTheory.HasLaw`, kernels, and the standard-Borel disintegration API under
  `Mathlib/MeasureTheory`, `Mathlib/Probability/HasLaw.lean`, and
  `Mathlib/Probability/Kernel`.  In particular, `ProbabilityTheory.HasLaw.comp`,
  `ProbabilityTheory.HasLaw.congr`, `MeasureTheory.Measure.condKernel`, kernel composition,
  and disintegration are the substrate for transport maps and gluing couplings.  Consume
  `ProbabilityTheory.eq_condKernel_of_measure_eq_compProd` for conditional-kernel
  uniqueness rather than rebuilding it.
* Mathlib already contains regular conditional distributions and an Ionescu--Tulcea
  construction: `ProbabilityTheory.condDistrib`,
  `ProbabilityTheory.Kernel.partialTraj`, `ProbabilityTheory.Kernel.traj`, and
  `ProbabilityTheory.Kernel.trajMeasure`, together with
  `MeasureTheory.IsProjectiveMeasureFamily`, `MeasureTheory.IsProjectiveLimit`, and
  `MeasureTheory.IsProjectiveLimit.unique`.  Layer 0 should expose OT-specific gluing and
  projective-family corollaries over these declarations, not rebuild the trajectory
  measure.
* Weak convergence and bounded-continuous test functions for probability measures,
  Portmanteau, tight families of measures, Prokhorov compactness, and the
  Lévy--Prokhorov metric.  In particular,
  `MeasureTheory.IsTightMeasureSet.prodMk` is the product-tightness input for fixed
  marginals.  These are the substrate for existence and stability, not a reason to define
  a second weak topology.
* `lintegral`, Bochner integration, Radon--Nikodym derivatives, signed measures, `Lp`,
  `eLpNorm`, `MemLp`, Hölder, and Minkowski.  In particular, use `p : ℝ≥0∞` in the
  Wasserstein API so `p=∞` inherits Mathlib's essential-supremum convention.
* `InformationTheory.klDiv` in
  `Mathlib/InformationTheory/KullbackLeibler/Basic.lean`, including its Radon--Nikodym
  integral formula, finite-measure mass correction, and zero characterization, together
  with the composition-product chain rule already proved in
  `Mathlib/InformationTheory/KullbackLeibler/ChainRule.lean`:
  `InformationTheory.klDiv_compProd_eq_add`, which states
  `klDiv (μ ⊗ₘ κ) (ν ⊗ₘ η) = klDiv μ ν + klDiv (μ ⊗ₘ κ) (μ ⊗ₘ η)`
  for finite measures `μ`, `ν` and Markov kernels `κ`, `η` (the file's section hypotheses
  `[IsFiniteMeasure μ] [IsFiniteMeasure ν] [IsMarkovKernel κ] [IsMarkovKernel η]`), with no
  hypotheses on the measurable spaces, and `InformationTheory.klDiv_compProd_left`
  (`klDiv (μ ⊗ₘ κ) (ν ⊗ₘ κ) = klDiv μ ν`, same hypotheses); and the data-processing
  inequalities for finite measures in
  `Mathlib/InformationTheory/KullbackLeibler/DataProcessing.lean`:
  `InformationTheory.klDiv_map_le` (`klDiv (μ.map g) (ν.map g) ≤ klDiv μ ν` for measurable
  `g`), `InformationTheory.klDiv_trim_le` (restriction to a sub-σ-algebra), and
  `InformationTheory.klDiv_comp_right_le` (composition with a Markov kernel).  Consume these
  rather than restating them.  The Markov hypothesis is load-bearing: on one-point spaces with
  `μ = 2δ`, `ν = δ` and the constant non-Markov kernels `κ = 2δ`, `η = δ`, the left side of the
  conditional form below is `klDiv (4δ) δ = 8 log 2 - 3` and its right side is
  `(2 log 2 - 1) + 2 (2 log 2 - 1) = 6 log 2 - 3`.  Mathlib stops at the identity above because
  `x ↦ klDiv (κ x) (η x)` need not be measurable; the conditional form
  `klDiv (μ ⊗ₘ κ) (ν ⊗ₘ η) = klDiv μ ν + ∫⁻ x, klDiv (κ x) (η x) ∂μ`, for finite `μ`, `ν` and
  Markov `κ`, `η`, is consumed from Tau Ceti (below), and the disintegration statements this
  roadmap needs rest on it, not on the product-kernel identity.  Build a distinct signed
  extended-real Boltzmann entropy for infinite reference measures.
* Metric-space completeness/separability, compactness, continuous maps, quotient types,
  convexity on real vector spaces, separation theorems, and doubly stochastic matrices.
  The finite Sinkhorn development should reuse Mathlib's matrix and finite-sum APIs.
* Compact Gromov--Hausdorff theory: `GromovHausdorff.ghDist`,
  `GromovHausdorff.ghDist_le_hausdorffDist`,
  `GromovHausdorff.ghDist_eq_hausdorffDist`, and the realized common-ambient embeddings
  `GromovHausdorff.optimalGHInjl`/`optimalGHInjr`.  The measured and noncompact
  extensions remain to be built; the compact unmeasured construction does not.
* Euclidean spaces, finite-dimensional differentiability, convex functions, Hessians,
  determinants, change of variables, manifolds, and the beginnings of Riemannian
  geometry.  These are ingredients, not yet a Monge--Ampère or transport-map theory.
  For finite-dimensional real-valued convex functions, specifically consume
  `ConvexOn.locallyLipschitzOn_interior`,
  `LocallyLipschitzOn.exists_lipschitzOnWith_of_compact`, and
  `LipschitzOnWith.ae_differentiableWithinAt`; the missing work is the bridge from proper
  extended-valued functions, the local-to-a.e. wrapper, and any intrinsic-interior
  generalization.
  For Layer 8.9, consume the Whitney embedding `exists_embedding_euclidean_of_compact`
  (`Mathlib/Geometry/Manifold/WhitneyEmbedding.lean`): a compact Hausdorff smooth manifold modelled
  on a finite-dimensional real space has a smooth closed embedding into some
  `EuclideanSpace ℝ (Fin n)` whose differential is injective at every point.

The following prerequisites are not in Mathlib and are targets of the layers below:

* lower-semicontinuity of parameterized `lintegral` in the strength needed for transport,
  plus compactness and closedness of coupling sets;
* a coherent extended-real convex-conjugate, subgradient, Legendre-transform, and
  Aleksandrov Monge--Ampère API, together with Euclidean approximate differentiability,
  approximate Jacobians, and the extension of GeometricMeasureTheory G2's Lipschitz area
  formula to approximately differentiable gradients of convex functions;
* metric derivatives, absolutely continuous metric-valued curves on the Hopf--Rinow
  roadmap's length and geodesic spaces, probability measures on path space, and a reusable
  CAT(0)/Hadamard-
  space predicate with its CN/strong-convexity API; separately, the opposite-sign
  Alexandrov curvature-bounded-below (`CBB(κ)`) predicate and comparison API needed for
  Alexandrov transport and Sturm's moduli space;
* distributional continuity equations with measure-valued time slices and vector-valued
  fluxes;
* the advanced `InformationTheory.klDiv` API--lower semicontinuity, strict convexity, the
  conditional/disintegration chain rule absent from Mathlib's `ChainRule.lean`, tensorization,
  Pinsker, and variational formulas, implemented in Tau Ceti as listed below--plus
  signed extended Boltzmann entropy and finite-reference bridge lemmas; a continuous
  positive-definite/universal-kernel and signed-Radon-energy API for Sinkhorn divergences;
* the nonsmooth energy and weak-gradient substrate needed to state `RCD`, where that layer
  goes beyond ordinary `CD`.

Do not assume these gaps away.  Each is a named target below before anything consumes it.

### From Tau Ceti

Declaration names and paths are those of Tau Ceti at revision `2fd255d9` with Mathlib
`1b1ccf4b`, the revisions pinned by the roadmap repository's main branch.  Tau Ceti's
optimal-transport library implements this roadmap's foundational targets.  `Suggested.lean` and
the later layers consume the following declarations by name, with the meaning stated.

* `TauCeti.IsCoupling π μ ν` and the bundled `TauCeti.Coupling μ ν`
  (`TauCeti/MeasureTheory/OptimalTransport/Coupling.lean`): the two marginal equalities of
  Layer 0.1, with no topology and no normalization.
* `TauCeti.transportCost c μ ν` and `TauCeti.IsOptimalCoupling c π μ ν`
  (`TauCeti/MeasureTheory/OptimalTransport/Cost/Basic.lean`): the extended Kantorovich value
  of Layer 1.1 for `c : X × Y → ℝ≥0∞`, and a coupling attaining it.
* `TauCeti.IsKantorovichOptimalTransportMap c μ ν T`
  (`TauCeti/MeasureTheory/OptimalTransport/Monge.lean`): a map with
  `ProbabilityTheory.HasLaw T ν μ` whose cost equals `TauCeti.transportCost c μ ν`
  (Layer 4.1).
* `TauCeti.wassersteinEDist p μ ν`, `TauCeti.wassersteinEDist_top`, and
  `TauCeti.HasFiniteMoment p μ` (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`):
  the `eLpNorm` definition of `W_p` on raw measures (Layer 3.1), its essential-supremum form
  at `p = ∞` for a jointly measurable ground distance, and finite `p`-moment about some
  basepoint.
* `Matrix.exists_sinkhorn_scaling` (`TauCeti/Data/Matrix/Scaling/Basic.lean`): the
  Sinkhorn--Knopp scaling theorem for strictly positive rectangular kernels and strictly
  positive marginals of equal mass (Layer 13.8).
* `TauCeti.riemannianVolume I M`
  (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean`): the Riemannian volume
  measure of a Riemannian manifold with continuous metric, consumed by Layers 7, 8.9, 11.10
  and 14.6.
* `CovariantDerivative.ricciTensor`
  (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean`): the
  Ricci tensor `Ric(u,v) = trace (w ↦ R(w,u)v)` of a smooth connection on the tangent bundle,
  consumed with RiemannianGeometry R1 by Layer 14.6.

The following theorems of Tau Ceti prove targets of the layers below, which cite them; each is
consumed with exactly the hypotheses recorded here.

* `TauCeti.isClosed_setOfPred_isCoupling`, `TauCeti.isCompact_setOfPred_isCoupling` and
  `TauCeti.isCompact_setOfPred_isCoupling_of_polishSpace` (`…/OptimalTransport/Compactness.lean`):
  for topological factors whose opens, and those of their product, are measurable, and whose spaces
  of probability measures are `T1`, the couplings of two probability measures form a weakly closed
  set; when moreover the product is Hausdorff and Borel and both marginals are tight, a weakly
  compact set; on Polish spaces with their Borel σ-algebras, a compact set with no further
  hypothesis (Layers 1.2 and 1.3).
* `TauCeti.exists_isOptimalCoupling` (`…/OptimalTransport/Existence/Basic.lean`): an optimal
  coupling exists for a lower semicontinuous cost `c : X × Y → ℝ≥0∞` between probability measures
  on Polish spaces with their Borel σ-algebras (Layer 1.5).
* `TauCeti.MeasureTheory.AnalyticSet.nullMeasurableSet` (`…/MeasurableSpace/Analytic.lean`),
  `TauCeti.analyticSet_setOf_cTransform_lt` and `TauCeti.nullMeasurable_cTransform`
  (`…/OptimalTransport/CTransform/Analytic.lean`): an analytic subset of a metrizable space with
  measurable opens is null-measurable for every s-finite measure; for Polish `X`, `Y` with their
  Borel σ-algebras, a real cost `c` and `φ : X → [-∞,∞]`, if the strict sublevel
  `{(x,y) | c(x,y) - φ(x) < a}` is Borel then `{y | φᶜ(y) < a}` is analytic, and if the integrand
  `(x,y) ↦ c(x,y) - φ(x)` is Borel then the infimal transform `φᶜ` is null-measurable for every
  s-finite measure on `Y` (Layer 2.2).
* `TauCeti.transportCost_eq_sSup_ofReal_kantorovichDualValue_integrable_of_lowerSemicontinuous`
  (`…/OptimalTransport/Duality/LowerSemicontinuous.lean`): for a lower semicontinuous cost
  `c : X × Y → ℝ≥0∞` between probability measures on Polish spaces, the transport cost is the
  supremum of the positive parts of the values of integrable dual-feasible pairs, both sides
  possibly infinite; no dual attainment is asserted (Layer 2.4).
* `TauCeti.IsCoupling.isOptimalCoupling_iff_exists_isCyclicallyMonotone` and
  `TauCeti.IsCoupling.isOptimalCoupling_of_isCyclicallyMonotone`
  (`…/OptimalTransport/Duality/SchachermayerTeichmann.lean`): for a finite-valued lower
  semicontinuous cost on Polish spaces, a coupling of finite cost is optimal exactly when it is
  concentrated on a measurable `c`-cyclically monotone set (`TauCeti.IsCyclicallyMonotone`,
  `…/OptimalTransport/Cost/CyclicalMonotonicity.lean`); for a finite-valued measurable cost,
  concentration on any `c`-cyclically monotone set gives optimality (Layer 2.7).
* `TauCeti.WassersteinSpace.completeSpace` (`…/OptimalTransport/Wasserstein/Complete.lean`):
  `P_p(X)` is complete for `1 ≤ p < ∞` over a complete second-countable pseudometric space with
  its Borel σ-algebra, standard Borel (Layer 3.3).
* `TauCeti.wassersteinEDist_top_eq_iSup` (`…/OptimalTransport/Wasserstein/Infinity/Basic.lean`):
  `W_∞(μ,ν) = ⨆ p < ∞, W_p(μ,ν)` in `[0,∞]` for a probability measure `μ` on a complete
  second-countable metric space with its Borel σ-algebra (Layer 3.6).
* `TauCeti.wassersteinEDist_eq_eLpNorm_quantile_sub` and
  `MeasureTheory.Measure.isOptimalCoupling_quantileCoupling`
  (`…/OptimalTransport/Wasserstein/Rearrangement.lean`), with the monotone coupling
  `MeasureTheory.Measure.quantileCoupling` (`…/OptimalTransport/Wasserstein/Quantile/Basic.lean`),
  the quantile `MeasureTheory.Measure.quantile` and
  `MeasureTheory.Measure.measurePreserving_quantile` (`TauCeti/Probability/Quantile.lean`): for
  probability measures `μ`, `ν` on `ℝ` and every `1 ≤ p ≤ ∞`, `W_p(μ,ν)` is the `Lᵖ(0,1)` distance
  of the quantiles in `[0,∞]`, with no moment hypothesis, and the monotone coupling is optimal for
  `|x - y|^p` for every real `p ≥ 1` (Layer 3.7).
* `TauCeti.wassersteinEDist_one_eq_iSup`
  (`…/OptimalTransport/Wasserstein/KantorovichRubinstein.lean`): Kantorovich--Rubinstein duality
  for probability measures of finite first moment on a second-countable pseudometric space with
  standard-Borel measurable structure containing the opens (Layer 3.8).
* `TauCeti.mongeCost_eq_transportCost_of_continuous` (`…/OptimalTransport/Pratelli.lean`):
  Pratelli's theorem, the Monge and Kantorovich values agree, finite or not, for a continuous
  cost `c : X × Y → ℝ≥0∞` on second-countable standard Borel spaces, a finite source measure
  without atoms and a nonempty target (Layer 4.3).
* `TauCeti.Coupling.dense_graphPlans` (`…/OptimalTransport/GraphPlanDensity.lean`): on Polish
  metric spaces with their Borel σ-algebras, for a source probability law with null singletons
  (Mathlib's `MeasureTheory.NullSingletonClass`), the graph plans of measure-preserving maps are
  weakly dense in the bundled couplings (Layer 4.3).
* `TauCeti.tendsto_map_prodMk_self_iff_tendstoInMeasure`
  (`…/OptimalTransport/GraphPlan/Convergence.lean`): for a weakly regular probability measure `μ`
  on a space with measurable opens, a second-countable pseudo-extended-metric target with
  measurable opens, closed subsets of the product approximable from outside (Mathlib's
  `HasOuterApproxClosed`), and almost everywhere measurable maps, the graph plans of `T_n` converge
  narrowly to that of `T` exactly when `T_n → T` in `μ`-measure (Layer 4.4).
* `TauCeti.hasFDerivAt_eq_of_mem_contactSet`, `TauCeti.ae_subsingleton_setOf_mem_contactSet` and
  `TauCeti.IsDualCertificate.ae_exists_condKernel_eq_dirac` (`…/OptimalTransport/Twist/Basic.lean`),
  and `TauCeti.IsDualCertificate.exists_optimal_transportMap_unique_ae`
  (`…/OptimalTransport/Twist/Map.lean`): for a real cost on `E × Y`, `E` a real normed space, the
  first-order condition `∇φ(x) = Dₓc(x,y)` at a contact point of a dual pair; almost every contact
  fiber is a subsingleton when the first potential is finite near and differentiable at almost
  every point, the cost sections are differentiable at contact partners, and `y ↦ Dₓc(x,y)` is
  injective among differentiable sections; and, for a nonnegative cost, a nonempty standard Borel
  target and real potentials certifying a plan, Dirac conditional laws for every finite optimal
  coupling and, for a measurable cost and a finite source, a measurable Kantorovich-optimal map
  inducing the plan and unique `μ`-a.e. (Layers 4.5 and 4.6).
* `TauCeti.wassersteinEDist_two_multivariateGaussian`
  (`…/OptimalTransport/Wasserstein/Gaussian/Basic.lean`): the Bures formula for `W₂` from a
  nondegenerate Gaussian law to any Gaussian law (Layer 5.3).
* `TauCeti.exists_isKantorovichOptimalTransportMap_gradient` (`…/OptimalTransport/Brenier.lean`):
  Brenier's theorem on a finite-dimensional real inner product space for a source absolutely
  continuous with respect to an additive Haar measure, at finite cost for `‖x - y‖² / 2` (Layer
  5.5).
* `TauCeti.exists_hasLaw_and_ae_eq_gradient_comp` (`…/OptimalTransport/PolarFactorization.lean`):
  Brenier's polar factorization `U = ∇u ∘ s` of a map `U` on a probability space whose law and the
  target law `P` are absolutely continuous, at finite quadratic cost between them (Layer 5.9).
* `TauCeti.HasWeakFDerivOn μ Ω u U` (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean`) and
  `TauCeti.W1p` (`TauCeti/Analysis/Sobolev/W1p/Basic.lean`): on an open set `Ω` of a real normed
  space with a measure `μ`, `U` is a weak Fréchet derivative of `u` (for every direction `v`,
  `x ↦ U x v` is the weak derivative of `u` along `v` against every test function on `Ω`, with `u`
  and `U` locally `μ`-integrable on `Ω`); and, on a real inner product space with an additive Haar
  measure and for `1 ≤ p`, the complete first-order space `W^{1,p}(Ω)` of real functions; with
  `TauCeti.Wkp` (`TauCeti/Analysis/Sobolev/Wkp/Basic.lean`), the space `W^{k,p}(Ω)` of every order
  `k`, equal to `Lᵖ(Ω)` at `k = 0` and to `W^{1,p}(Ω)` at `k = 1` (Layers 5.9 and 6).
* `TauCeti.mongeAmpereMeasure_eq_of_hasLaw`, `TauCeti.mongeAmpereMeasure_eq_withDensity_inv_add`
  and `TauCeti.mongeAmpereMeasure_eq_withDensity_inv_of_convex`
  (`TauCeti/Analysis/Convex/MongeAmpere/Transport.lean`), and
  `TauCeti.exists_isKantorovichOptimalTransportMap_gradient_and_mongeAmpereMeasure_eq` and
  `TauCeti.exists_isKantorovichOptimalTransportMap_gradient_and_mongeAmpereMeasure_eq_withDensity`
  (`…/OptimalTransport/Brenier.lean`): on a finite-dimensional real inner product space with an
  additive Haar measure `ρ`, for a convex potential with values in `(-∞,∞]` and a map pushing `μ`
  to `ν`, carried by the interior of the domain and selecting subgradients `μ`-a.e., the weighted
  identity `MA_{u,ν} = μ` when `ν ≪ ρ`; for `ν = g ρ` with `g` finite a.e., the decomposition of
  the Aleksandrov measure as `(g ∘ T)⁻¹ μ` plus the subgradient mass in `{g = 0}`, which vanishes
  when every subgradient at an interior point of the domain lies in the closure of a convex set on
  which `g` is a.e. positive; and the Brenier corollaries, for an absolutely continuous source at
  finite quadratic cost: a weak solution for an absolutely continuous target, and, for a closed
  convex set carrying `ν = g ρ` on which `g` is a.e. positive, a Brenier potential with all
  subgradients in that set that is an Aleksandrov solution (Layers 6.5 and 6.7).
* `TauCeti.exists_map_IccExtend_eq_lintegral_curveAction_eq`
  (`…/OptimalTransport/Wasserstein/Superposition.lean`): Lisini's superposition principle on a
  complete separable metric space for `1 < p < ∞` (Layer 8.3).
* `TauCeti.isLeast_lintegral_isContinuityEquation` and
  `TauCeti.wassersteinEDist_rpow_eq_sInf_lintegral_isContinuityEquation`
  (`…/OptimalTransport/ContinuityEquation/BenamouBrenier.lean`): the Benamou--Brenier formula for
  `1 ≤ p < ∞` on a finite-dimensional real normed space, with the minimum attained when
  `W_p(μ₀,μ₁)` is finite (Layer 8.8).
* `TauCeti.IsGeneralizedGeodesicPlan`, `TauCeti.exists_isGeneralizedGeodesicPlan`,
  `TauCeti.generalizedGeodesic`, `TauCeti.IsGeneralizedGeodesicPlan.wassersteinEDist_sq_add_le` and
  `TauCeti.IsGeneralizedGeodesicPlan.wassersteinEDist_sq_add_wassersteinEDist_sq_le`
  (`…/OptimalTransport/Wasserstein/GeneralizedGeodesic/Basic.lean`): three-plans whose `(1,2)` and
  `(1,3)` marginals are `p`-optimal, their existence on a Polish metric space for a finite base
  measure coupled with both endpoints and `p ≠ 0`, the generalized geodesic in a real vector space,
  and, on a separable real inner product space and for `t ∈ [0,1]`, the convexity of `W₂(μ,·)²`
  along it with remainder `t(1-t)∫‖x₂-x₃‖² dγ ≥ t(1-t)W₂(ν₀,ν₁)²`, in `[0,∞]` (Layers 9.1 and 9.4).
* `TauCeti.WassersteinSpace.isometry_quantileLp`
  (`…/OptimalTransport/Wasserstein/Quantile/Isometry.lean`),
  `TauCeti.WassersteinSpace.isGeodesicSegment_iff_coe_eq_quantileBarycenter`
  (`…/OptimalTransport/Wasserstein/Quantile/Geodesic.lean`), and `TauCeti.quantileBarycenter`,
  `TauCeti.quantile_quantileBarycenter_ae`, `TauCeti.exists_isGeodesicSegment_quantileBarycenter`
  and `TauCeti.sum_mul_wassersteinEDist_sq_quantileBarycenter_le`
  (`…/OptimalTransport/Wasserstein/Barycenter/Basic.lean`): the quantile isometry
  `P_p(ℝ) → Lᵖ(0,1)` for `1 ≤ p ≤ ∞`; the quantile interpolation, a geodesic for `1 ≤ p ≤ ∞` and
  the only one for `1 < p < ∞`; and minimality of the law with averaged quantile for the weighted
  quadratic cost, for probability laws and weights of sum `1` (Layer 9.6).
* `TauCeti.klDiv_compProd_eq_add_lintegral`
  (`TauCeti/InformationTheory/KullbackLeibler/ChainRule.lean`): the conditional chain rule for
  finite `μ`, `ν`, Markov `κ`, `η`, and a countably generated target or countable source; with
  `TauCeti.strictConvexOn_toReal_klDiv` (`TauCeti/InformationTheory/KullbackLeibler/Convex.lean`),
  `TauCeti.klDiv_eq_klDiv_add_klDiv`
  (`TauCeti/InformationTheory/KullbackLeibler/ChangeOfReference.lean`), `TauCeti.klDiv_prod_prod`
  (tensorization, `ChainRule.lean`), `TauCeti.etvDist_sq_le_two_mul_klDiv`
  (`TauCeti/InformationTheory/KullbackLeibler/Pinsker.lean`) and
  `TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`
  (`TauCeti/InformationTheory/KullbackLeibler/Variational.lean`) (Layer 11.1).
* `TauCeti.GeneralizedGeodesicallyConvex`, `TauCeti.GeneralizedGeodesicallyConvex.add_edist_sq_div`
  and `TauCeti.GeneralizedGeodesicallyConvex.subsingleton_moreauYosidaResolvent`
  (`…/OptimalTransport/Wasserstein/GeneralizedGeodesic/Convex.lean`): on `P₂(E)` for a separable
  real Hilbert space `E`, `m`-convexity of an energy `P₂(E) → [-∞,∞]` along generalized geodesics
  based at `μ`, with the remainder `(m/2)t(1-t)∫‖x₂-x₃‖² dγ` of the plan; the JKO functional with
  step `τ > 0` is `(m + 1/τ)`-convex along the same plans, and has at most one minimizer when
  `1 + mτ > 0`, the energy never takes the value `-∞`, and it is finite somewhere (Layer 11.6).
* `TauCeti.WassersteinSpace.exists_isFrechetBarycenter`
  (`…/OptimalTransport/Wasserstein/PopulationBarycenter.lean`): a probability law of finite `p`-th
  moment on `P_p(X)`, for `1 ≤ p < ∞` and a proper metric space `X` with its Borel σ-algebra, has
  a `p`-Fréchet barycenter (Layer 12.5).
* `TauCeti.Probability.isFrechetBarycenter_sum_smul_dirac_multivariateGaussian` and
  `TauCeti.Probability.frechetBarycenters_sum_smul_dirac_multivariateGaussian`
  (`…/OptimalTransport/Wasserstein/Gaussian/FixedPoint.lean`): a positive-definite solution `S` of
  the Gaussian fixed-point equation gives a barycenter, the only one when an input of positive
  weight is nondegenerate (Layer 12.8).
* `TauCeti.isFrechetBarycenter_two_iff_quantile_ae_eq` and
  `TauCeti.existsUnique_isFrechetBarycenter_two`
  (`…/OptimalTransport/Wasserstein/Barycenter/Basic.lean`), and
  `TauCeti.IsGeodesicSegment.isFrechetBarycenter_two`,
  `TauCeti.IsGeodesicSegment.isFrechetBarycenter_twoPointBarycenterTime` and
  `TauCeti.twoPointBarycenterTime` (`…/Measure/FrechetMean/TwoPoint.lean`): for weights of sum `1`,
  the unique quadratic barycenter in `P₂(ℝ)` of finitely many laws, characterized by the averaged
  quantile a.e.; and, in a pseudometric space, the point of a geodesic segment at time `t`
  (`p = 2`), respectively at time `t^(1/(p-1)) / ((1-t)^(1/(p-1)) + t^(1/(p-1)))` for
  `1 < p < ∞`, is a barycenter of `(1-t)δ_x + tδ_y` (Layer 12.8).
* `TauCeti.existsUnique_isCoupling_klDiv_eq_schroedingerValue`
  (`…/OptimalTransport/Entropic/Basic.lean`): for a finite source `μ` and a finite reference `R`,
  a finite Schrödinger value is attained by exactly one coupling (Layer 13.2).
* `TauCeti.exists_entropicDualValue_eq_toReal_entropicTransportCost` and
  `TauCeti.exists_ae_eq_add_const_of_entropicDualValue_eq_toReal_entropicTransportCost`
  (`…/OptimalTransport/Entropic/Duality.lean`): for probability measures, a bounded measurable cost
  `c : X × Y → ℝ≥0∞` and `ε > 0`, the entropic dual problem is attained by bounded measurable
  potentials with value `OT_ε(μ,ν)`, and two integrable maximizing pairs whose Gibbs factors
  `exp((φ ⊕ ψ - c)/ε)` are `μ⊗ν`-integrable agree up to one additive constant almost everywhere
  (Layer 13.3).
* `TauCeti.sinkhornDivergence`, `TauCeti.sinkhornDivergence_nonneg` and
  `TauCeti.sinkhornDivergence_eq_zero_iff` (`…/OptimalTransport/Entropic/SinkhornDivergence.lean`):
  the debiased value `OT_ε(μ,ν) - OT_ε(μ,μ)/2 - OT_ε(ν,ν)/2`; on a compact space, for a bounded
  measurable cost whose Gibbs kernel `exp(-c/ε)` is continuous and positive semidefinite and for
  `ε > 0`, it is nonnegative on probability measures, and if moreover the space is Borel with
  `HasOuterApproxClosed` and the kernel is universal, it vanishes exactly on the diagonal (Layer
  13.4).
* `TauCeti.tendsto_entropicTransportCost_nhdsGT_zero`,
  `TauCeti.tendsto_entropicTransportCost_transportCost`,
  `TauCeti.tendsto_entropicTransportCost_transportCost_of_le_add` and
  `TauCeti.isOptimalCoupling_of_tendsto_of_entropicTransportCost`
  (`…/OptimalTransport/Entropic/ZeroTemperature.lean`), and
  `TauCeti.IsOptimalCoupling.tendsto_entropicTransportCost`,
  `TauCeti.existsUnique_isOptimalCoupling_isMinOn_klDiv` and
  `TauCeti.tendsto_of_entropicTransportCost_eq` (`…/OptimalTransport/Entropic/Selection.lean`): the
  zero-temperature limit of Layer 13.5, with the hypotheses recorded there.
* `TauCeti.entropicBarycenterCost`, `TauCeti.tendstoGamma_entropicBarycenterCost`,
  `TauCeti.exists_isMinOn_entropicBarycenterCost` and
  `TauCeti.tendsto_of_isMinOn_entropicBarycenterCost`
  (`…/OptimalTransport/Entropic/Barycenter.lean`): the objective `F_ε` of Layer 13.6 for the cost
  `d^p`; on a Polish metric space, for `0 < p < ∞` and inputs of finite `p`-moment, its
  Γ-convergence as `ε → 0⁺` to the weighted cost `∑ λ_i W_p(·,μ_i)^p` for the weak topology; on a
  nonempty compact metric space, existence of its minimizers at every `ε`, and their weak
  convergence to the unregularized barycenter when that is unique (Layer 13.6).
* `TauCeti.dynamicSchroedingerValue`, `TauCeti.dynamicSchroedingerValue_eq_schroedingerValue`,
  `TauCeti.existsUnique_isCoupling_map_klDiv_eq_dynamicSchroedingerValue` and
  `TauCeti.klDiv_eq_dynamicSchroedingerValue_iff` (`…/OptimalTransport/Entropic/Dynamic.lean`): for a
  measurable endpoint map `e : Ω → X × Y`, a finite source measure and a finite reference `R` on
  `Ω`, the dynamic value equals the static value of `e₊R`, a finite dynamic value is attained by
  exactly one measure, and a feasible measure is the minimizer exactly when its endpoint law is the
  static minimizer and its density against `R` is `d(e₊P)/d(e₊R) ∘ e` (Layer 13.11).
* `TauCeti.GromovWassersteinSpace` with `TauCeti.GromovWassersteinSpace.instMetricSpace`
  (`…/OptimalTransport/GromovWasserstein/Space.lean`): for `1 ≤ p ≤ ∞` and a metric target `Z`,
  the weak-isomorphism classes of finite-size, almost everywhere strongly measurable `Z`-valued
  kernels on standard Borel probability carriers, with the Gromov--Wasserstein distance as a
  genuine metric (Layer 15.4).
* `TauCeti.exists_isMinOn_finiteGromovWassersteinBarycenterObjective`
  (`…/OptimalTransport/GromovWasserstein/Barycenter.lean`),
  `TauCeti.exists_isMinOn_entropicGromovWassersteinObjective`,
  `TauCeti.tendsto_entropicGromovWassersteinObjective_of_isMinOn` and
  `TauCeti.isMinOn_gromovWassersteinObjective_of_mapClusterPt`
  (`…/OptimalTransport/GromovWasserstein/Entropic.lean`): existence of finite entropic GW
  minimizers, their zero-temperature limit, and existence of fixed-law finite GW barycenters for
  every `ε ≥ 0` (Layer 15.10).

The remaining implemented targets are the following, by layer; each subsection named cites
these declarations on its `*Needs:*` line (for a range of subsections, the first one does).

* Layer 0.  `TauCeti.graphPlan`, `TauCeti.isCoupling_graphPlan_iff` and `TauCeti.eq_graphPlan_iff`
  (`…/OptimalTransport/GraphPlan/Basic.lean`): the graph plan of a map, which couples `μ` and `ν`
  exactly when the almost everywhere measurable map has law `ν`, and the plans concentrated on a
  graph (Layer 0.2).  `TauCeti.IsCoupling.compProd_condKernel`, `TauCeti.isCoupling_compProd_iff`
  and `TauCeti.IsCoupling.ae_eq_condKernel_iff_compProd_eq`
  (`…/OptimalTransport/Disintegration.lean`): reconstruction of a finite coupling from its source
  marginal and conditional kernel, couplings built from a marginal and a Markov kernel, and
  almost everywhere uniqueness of the kernel (Layer 0.3).
  `TauCeti.Measure.exists_glue_of_standardBorel_right`,
  `TauCeti.Measure.exists_glue_of_standardBorel_left` and
  `TauCeti.Measure.exists_comp_of_exists_glue` (`…/OptimalTransport/Gluing.lean`), and
  `TauCeti.Measure.chainMeasure` (`…/OptimalTransport/Chain.lean`): the gluing lemma with the third,
  respectively the first, factor standard Borel, composition of plans, and the law of a countable
  chain of couplings (Layer 0.4).  `TauCeti.Measure.IsMultiCoupling` and `TauCeti.MultiCoupling`
  (`…/OptimalTransport/MultiMarginal/Basic.lean`), `TauCeti.Measure.replaceMarginal`
  (`…/OptimalTransport/MultiMarginal/Replacement.lean`) and
  `TauCeti.couplingEquivMultiCouplingFinTwo` (`…/OptimalTransport/MultiMarginal/Pair.lean`):
  multi-marginal couplings, marginal replacement, and the two-marginal reduction (Layer 0.5).
* Layer 1.  `TauCeti.transportCostBddBelow` and `TauCeti.transportCostBddBelow_coe_eq_transportCost`
  (`…/OptimalTransport/Cost/BoundedBelow.lean`): the signed value for a cost bounded below by
  integrable marginal terms, and its agreement with the nonnegative interface (Layer 1.1).
  `TauCeti.lowerSemicontinuous_lintegral_probabilityMeasure` and
  `TauCeti.le_liminf_lintegral_of_tendsto_probabilityMeasure`
  (`TauCeti/MeasureTheory/Measure/LowerSemicontinuousLintegral.lean`) and
  `TauCeti.lowerSemicontinuous_planCostBddBelow` (`…/OptimalTransport/Cost/BoundedBelow.lean`):
  weak lower semicontinuity of the integral of a nonnegative lower semicontinuous integrand on a
  pseudometric space with measurable open sets, with its `liminf` form, and of the signed cost of
  a lower semicontinuous cost whose split lower bound is upper semicontinuous (Layer 1.4).
  `TauCeti.tendsto_transportCost`, `TauCeti.exists_isOptimalCoupling_tendsto` and
  `TauCeti.lowerSemicontinuous_transportCost` (`…/OptimalTransport/Stability.lean`): convergence of
  values and subsequential convergence of optimal plans under the liminf and recovery hypotheses,
  and weak lower semicontinuity of the value of a lower semicontinuous cost in the pair of
  marginals on Polish spaces (Layer 1.6).  `TauCeti.TransportMatrix`
  (`…/OptimalTransport/Finite/TransportMatrix.lean`),
  `TauCeti.TransportMatrix.exists_uncrossSteps_isMonotone`
  (`…/OptimalTransport/Finite/Uncrossing/Termination.lean`),
  `TauCeti.TransportMatrix.IsMonotone.forall_cost_le` (`…/OptimalTransport/Finite/Monotone.lean`)
  and `TauCeti.transportConstraintCost` (`…/OptimalTransport/Cost/Constraint.lean`): finite plans
  as matrices, termination of uncrossing, optimality of the monotone plan for Monge costs, and the
  barrier cost of a constraint (the Examples of Layer 1).
* Layer 2.  `TauCeti.DualFeasible`, `TauCeti.kantorovichDualValue` and
  `TauCeti.DualFeasible.kantorovichDualValue_le_transportCost`
  (`…/OptimalTransport/Duality/Basic.lean`): the constraint `φ x + ψ y ≤ c(x,y)` for extended-real
  potentials, the dual value, and weak duality (Layer 2.1).  `TauCeti.cTransform`,
  `TauCeti.IsCConcave`, `TauCeti.contactSet`, `TauCeti.cSuperdifferential`,
  `TauCeti.cTransform_galoisConnection`, `TauCeti.isCConcave_iff` and
  `TauCeti.upperSemicontinuous_cTransform` (`…/OptimalTransport/CTransform/Basic.lean`),
  `TauCeti.exists_cTransform_eq`, `TauCeti.lowerSemicontinuous_cTransform` and
  `TauCeti.continuous_cTransform_coe` (`…/OptimalTransport/CTransform/Compact.lean`), and
  `TauCeti.cTransformExtended` (`…/OptimalTransport/CTransform/Extended.lean`): the infimal
  transform, `c`-concavity, contact sets, the Galois connection, upper semicontinuity for upper
  semicontinuous sections, and attainment, lower semicontinuity and continuity on a compact
  source (Layer 2.2).  `TauCeti.exists_cost_eq_finiteDualValue`,
  `TauCeti.TransportMatrix.cost_eq_finiteDualValue_iff` and
  `TauCeti.finiteDualValue_eq_kantorovichDualValue` (`…/OptimalTransport/Finite/Duality.lean`):
  finite strong duality with both attainments, complementary slackness, and the bridge to the
  measure-level dual value (Layer 2.3).  `TauCeti.isLUB_kantorovichDualValue_continuous`
  (`…/OptimalTransport/Duality/Compact.lean`), `TauCeti.isGreatest_kantorovichDualValue_integrable`
  (`…/OptimalTransport/Duality/Attainment.lean`),
  `TauCeti.isLUB_kantorovichDualValue_of_lowerSemicontinuous_bddBelow`
  (`…/OptimalTransport/Duality/BoundedBelow.lean`) and
  `TauCeti.exists_kantorovichDualValue_eq_of_le_add` (`…/OptimalTransport/Duality/BoundedAbove.lean`):
  strong duality over continuous pairs for a continuous nonnegative cost on compact pseudometric
  spaces; the maximum over integrable pairs for a bounded continuous nonnegative cost on Polish
  spaces; the Polish theorem for a lower semicontinuous cost bounded below by integrable upper
  semicontinuous marginal terms; and, for a lower semicontinuous cost `c ≤ c_X ⊕ c_Y` with `c_X`, `c_Y` integrable, an
  integrable pair feasible on a product of full-measure sets whose value is the transport cost
  (Layer 2.4).  `TauCeti.partialTransportCost` and `TauCeti.relaxedTransportCost`
  (`…/OptimalTransport/Cost/Partial/Basic.lean`),
  `TauCeti.DualFeasible.ofReal_kantorovichDualValue_le_relaxedTransportCost` and
  `TauCeti.relaxedTransportCost_eq_transportCost_of_lowerSemicontinuous`
  (`…/OptimalTransport/Duality/Relaxed.lean`),
  `TauCeti.relaxedTransportCost_eq_transportCost_of_bounded` and
  `TauCeti.relaxedTransportCost_eq_transportCost_of_le_split`
  (`…/OptimalTransport/Cost/Partial/Integrable.lean`) and
  `TauCeti.relaxedTransportCost_eq_iSup_transportCost_min`
  (`…/OptimalTransport/Cost/Partial/Truncation.lean`): the relaxed primal with the hypotheses
  recorded in Layer 2.5.  `TauCeti.exists_cost_eq_finiteMultiDualValue` and
  `TauCeti.FiniteMultiCoupling.cost_eq_finiteMultiDualValue_iff`
  (`…/OptimalTransport/MultiMarginal/Finite/Duality.lean`): finite multi-marginal duality and
  complementary slackness (Layer 2.6).  `TauCeti.isCyclicallyMonotone_iff_exists_isCConcave`
  (`…/OptimalTransport/CTransform/CyclicalMonotonicity.lean`) and
  `TauCeti.IsOptimalCoupling.exists_isCyclicallyMonotone_of_lowerSemicontinuous`
  (`…/OptimalTransport/Duality/CyclicalMonotonicity.lean`): a set is `c`-cyclically monotone
  exactly when it lies in the `c`-superdifferential of a `c`-concave potential, and an optimal
  plan of finite cost for a lower semicontinuous cost on Polish spaces is concentrated on a
  measurable `c`-cyclically monotone set (Layer 2.7).  `TauCeti.IsDualCertificate`,
  `TauCeti.isDualCertificate_iff`, `TauCeti.IsDualCertificate.isOptimalCoupling` and
  `TauCeti.IsDualCertificate.transportCost_eq` (`…/OptimalTransport/Duality/Certificate.lean`):
  certificates, complementary slackness, and the optimality and absence of a gap they prove
  (Layer 2.8).
* Layer 3.  `TauCeti.wassersteinEDist_eq_zero_iff_separationQuotient_eq`
  (`…/OptimalTransport/Wasserstein/Quotient.lean`): zero distance is equality after pushforward to
  the metric separation quotient, for every nonzero exponent (Layer 3.1).
  `TauCeti.WassersteinSpace`, `TauCeti.WassersteinComponent` and
  `TauCeti.WassersteinSpace.isometryEquivComponent` (`…/OptimalTransport/Wasserstein/Space.lean`)
  and `TauCeti.WassersteinSpace.borelSpace` (`…/OptimalTransport/Wasserstein/Borel.lean`): `P_p(X)`,
  the finite-distance component of an anchor, their identification at a Dirac anchor, and the
  Borel structure for `1 ≤ p < ∞`; `TauCeti.measurable_wassersteinEDist` and
  `TauCeti.WassersteinSpace.measurableSpace_le_borel`
  (`…/OptimalTransport/Wasserstein/Measurable.lean`): joint measurability of `W_p` in the two laws
  for every exponent and the inclusion of the inherited structure in the metric Borel σ-algebra
  (Layer 3.2).  `TauCeti.WassersteinSpace.separableSpace`
  (`…/OptimalTransport/Wasserstein/Separable.lean`),
  `TauCeti.WassersteinSpace.isCompact_closure_iff_isTightMeasureSet_and_exists_setLIntegral_edist_rpow_le`
  (`…/OptimalTransport/Wasserstein/Compactness.lean`),
  `TauCeti.WassersteinSpace.dense_setOfPred_ae_mem_finset` and
  `TauCeti.tendsto_wassersteinQuantizationError` (`…/OptimalTransport/Wasserstein/FiniteSupport.lean`),
  `TauCeti.exists_wassersteinEDist_eq_wassersteinQuantizationError`
  (`…/OptimalTransport/Wasserstein/Quantization.lean`) and
  `TauCeti.tendsto_wassersteinEDist_empiricalMeasure_ae`
  (`…/OptimalTransport/Wasserstein/Empirical.lean`): separability, relative compactness as
  tightness with uniformly small moment tails, density of finitely supported laws, quantization
  errors and best quantizers on proper spaces, and almost sure convergence of empirical measures
  (Layer 3.3).  `TauCeti.WassersteinSpace.tendsto_iff_tendsto_toProbabilityMeasure_and_lintegral`
  (`…/OptimalTransport/Wasserstein/Moment.lean`),
  `TauCeti.WassersteinSpace.continuous_toProbabilityMeasure`
  (`…/OptimalTransport/Wasserstein/WeakConvergence.lean`) and
  `TauCeti.lowerSemicontinuous_wassersteinEDist`
  (`…/OptimalTransport/Wasserstein/LowerSemicontinuous.lean`): convergence in `P_p(X)` as weak
  convergence with convergence of `p`-moments, and weak lower semicontinuity of `W_p` on a Polish
  metric space (Layer 3.4).  `TauCeti.wassersteinEDist_map_le_mul`,
  `TauCeti.WassersteinSpace.lipschitzWith_map` and `TauCeti.WassersteinSpace.isometry_map`
  (`…/OptimalTransport/Wasserstein/Pushforward.lean`), `TauCeti.wassersteinEDist_map_toLp_prod`
  (`…/OptimalTransport/Wasserstein/Product.lean`), `TauCeti.wassersteinEDist_conv_right_le`
  (`…/OptimalTransport/Wasserstein/Convolution.lean`),
  `TauCeti.wassersteinEDist_smul_add_smul_rpow_le` (`…/OptimalTransport/Wasserstein/Mixture/Basic.lean`)
  and `TauCeti.wassersteinEDist_comp_le_mul` (`…/OptimalTransport/Wasserstein/Kernel/Basic.lean`),
  and `TauCeti.transportCost_prod_add` and `TauCeti.IsOptimalCoupling.prod`
  (`…/OptimalTransport/Cost/Product.lean`): Lipschitz and isometric pushforward, tensorization,
  convolution, mixtures, Lipschitz kernels, and the splitting of an additively separable cost on a
  product problem (Layer 3.5).  `TauCeti.WassersteinComponent.instCompleteSpaceTop`
  (`…/OptimalTransport/Wasserstein/Infinity/Complete.lean`),
  `TauCeti.tendsto_wassersteinEDist_top_iff_exists_couplings`
  (`…/OptimalTransport/Wasserstein/Infinity/Convergence.lean`),
  `TauCeti.WassersteinSpace.not_dense_setOfPred_ae_mem_finset_top_baire`
  (`…/OptimalTransport/Wasserstein/Infinity/FiniteSupport.lean`) and
  `TauCeti.WassersteinSpace.not_separableSpace_top_nat`
  (`…/OptimalTransport/Wasserstein/Infinity/Nonseparable.lean`): completeness of the finite-`W_∞`
  components over a Polish metric space, convergence in `W_∞` through couplings, and the failure
  of density of finitely supported laws and of separability at `p = ∞`; and
  `TauCeti.wassersteinEDist_top_prod`, `TauCeti.wassersteinEDist_top_finset_sum_smul_le` and
  `TauCeti.wassersteinEDist_top_sum_smul_le`
  (`…/OptimalTransport/Wasserstein/Infinity/Operations.lean`): the maximum forms of the product and
  mixture estimates on a Polish metric space (Layer 3.6).
  `TauCeti.wassersteinEDist_one_eq_lintegral_enorm_cdf_sub`
  (`…/OptimalTransport/Wasserstein/OneDimensional.lean`): `W₁` on `ℝ` as the area between the
  distribution functions (Layer 3.7).  `TauCeti.wassersteinEDist_one_eq_iSup_of_compactSpace`,
  `TauCeti.isGreatest_ofReal_integral_sub_integral_boundedLipschitz` and
  `TauCeti.transportCost_truncated_dist_eq_iSup`
  (`…/OptimalTransport/Wasserstein/KantorovichRubinstein.lean`), and
  `TauCeti.tendsto_probabilityMeasure_iff_iSup_abs_integral_sub_integral_boundedLipschitz`
  (`…/OptimalTransport/Wasserstein/BoundedLipschitz.lean`): Kantorovich--Rubinstein duality on a
  compact space, its bounded-Lipschitz form for finite measures of equal mass on a Polish space, and
  weak convergence as uniform convergence of bounded-Lipschitz integrals (Layer 3.8).
  `TauCeti.MetricMeasureSpace`
  (`…/OptimalTransport/MetricMeasure/Basic.lean`): the measured-metric carrier (Layers 3.9 and
  14.1).
* Layers 5--6, convex analysis and the Aleksandrov theory.
  `TauCeti.fenchelConjugate_flip_fenchelConjugate_eq_iff`
  (`TauCeti/Analysis/Convex/FenchelMoreau.lean`): the Fenchel--Moreau theorem with its converse on
  a locally convex space (Layer 5.1).  `TauCeti.convexOn_toReal`
  (`TauCeti/Analysis/Convex/EffectiveDomain.lean`),
  `ConvexOn.ae_differentiableAt_of_mem_interior` (`TauCeti/Analysis/Calculus/Rademacher.lean`)
  and `ConvexOn.ae_existsUnique_isPositive_isLittleO` (`TauCeti/Analysis/Convex/Alexandrov.lean`):
  the real representative of an extended-real convex function, almost everywhere
  differentiability of a convex function in the interior of its domain, and Alexandrov's
  theorem with uniqueness of the positive second-order term (Layers 5.2 and 6.2).
  `TauCeti.isLocallyFiniteMeasure_comap_mongeAmpereMeasure` and
  `TauCeti.mongeAmpereMeasure_ite_eq_withDensity_det`
  (`TauCeti/Analysis/Convex/MongeAmpere/Basic.lean`) and `TauCeti.mongeAmpereMeasure_mul_norm_sub`
  (`TauCeti/Analysis/Convex/MongeAmpere/Cone.lean`): local finiteness, the formula
  `det(D²u) dx` for a twice differentiable convex function, and the point mass of a cone (Layer
  6.1).  `TauCeti.mongeAmpereMeasure_mul_norm_sub_ne_withDensity_det` (the same `Cone.lean`),
  `TauCeti.mongeAmpereMeasure_le_liminf`, `TauCeti.limsup_mongeAmpereMeasure_le` and
  `TauCeti.tendsto_mongeAmpereMeasure` (`TauCeti/Analysis/Convex/MongeAmpere/Convergence.lean`),
  `TauCeti.mongeAmpereMeasure_le_of_le_of_le_frontier`,
  `TauCeti.le_of_mongeAmpereMeasure_le_of_le_frontier` and
  `TauCeti.eqOn_of_mongeAmpereMeasure_eq_of_eqOn_frontier`
  (`TauCeti/Analysis/Convex/MongeAmpere/Comparison.lean`) and
  `TauCeti.ofReal_neg_pow_mul_addHaar_ball_le_mul_mongeAmpereMeasure` (the same `Basic.lean`):
  singular mass, weak convergence under locally uniform convergence, the comparison principle
  with Dirichlet uniqueness, and the Aleksandrov maximum principle (Layer 6.2).
  `TauCeti.IsMongeAmpereViscositySolution`,
  `TauCeti.isMongeAmpereViscositySolution_of_mongeAmpereMeasure_eq` and
  `TauCeti.isMongeAmpereViscositySolution_iff_forall_det_eq`
  (`TauCeti/Analysis/Convex/MongeAmpere/Viscosity.lean`), and
  `TauCeti.mongeAmpereMeasure_eq_singularPart_add_withDensity` and
  `TauCeti.ae_eq_indicator_ofReal_det_of_mongeAmpereMeasure_eq_withDensity`
  (`TauCeti/Analysis/Convex/MongeAmpere/Decomposition.lean`): viscosity solutions, the bridges
  from Aleksandrov and from classical solutions, and the Lebesgue decomposition of the
  Aleksandrov measure with its almost everywhere consequence (Layer 6.3).
  `TauCeti.convexSection` (`TauCeti/Analysis/Convex/Section/Basic.lean`),
  `TauCeti.exists_ofReal_pow_le_mul_measure_convexSection_mul_mongeAmpereMeasure` and
  `TauCeti.exists_mul_measure_convexSection_sq_le_mul_ofReal_pow`
  (`TauCeti/Analysis/Convex/MongeAmpere/Section.lean`),
  `TauCeti.exists_convexSection_subset_convexSection`
  (`TauCeti/Analysis/Convex/MongeAmpere/Engulfing.lean`) and
  `TauCeti.exists_countable_pairwiseDisjoint_convexSection_measure_le`
  (`TauCeti/Analysis/Convex/MongeAmpere/Vitali.lean`): sections, their two volume estimates,
  engulfing, and the Vitali covering lemma for sections (Layer 6.8).
* Layers 4--6.  `ProbabilityTheory.HasLaw.measure_singleton_le` and
  `ProbabilityTheory.HasLaw.exists_measure_atom_le_measure_singleton`
  (`TauCeti/Probability/HasLaw.lean`), `AEMeasurable.exists_map_restrict_eq_smul_dirac_of_atom`
  (`TauCeti/MeasureTheory/Measure/Atom.lean`),
  `MeasureTheory.Measure.exists_measurePreserving_of_nullSingleton`
  (`TauCeti/MeasureTheory/Measure/AtomlessStandardBorel/Transport.lean`) and
  `TauCeti.mongeCost_eq_top_of_measure_atom` (`…/OptimalTransport/Monge.lean`): the point-atom
  bound with no hypothesis on the target, the atom-set bound for a standard Borel target and the
  infeasibility it implies when the target law has null singletons, and the nonatomic feasibility
  theorem (Layer 4.2).  `TauCeti.wassersteinEDist_rpow_eq_mongeCost`
  (`…/OptimalTransport/Wasserstein/Monge.lean`): `W_p^p` as a Monge infimum from a nonatomic finite
  source (Layer 4.3).  `TauCeti.IsCoupling.exists_graphPlan_of_ae_exists_condKernel_eq_dirac`
  (`…/OptimalTransport/MeasurableSelection.lean`): a coupling with Dirac conditional laws is a
  graph plan of a measurable map (Layer 4.6).
  `TauCeti.IsCyclicallyMonotone.exists_fenchelConjugate_subset_subdifferential`
  (`…/OptimalTransport/CTransform/Rockafellar.lean`),
  `TauCeti.IsCyclicallyMonotone.exists_fenchelConjugate_innerₗ_subset_subdifferential` and
  `TauCeti.cSuperdifferential_norm_sub_sq_div_two` (`…/OptimalTransport/CTransform/Quadratic.lean`)
  and `TauCeti.isCyclicallyMonotone_norm_sub_sq_div_two_iff`
  (`…/OptimalTransport/Cost/Quadratic.lean`): Rockafellar's theorem for a pairing and for the
  quadratic cost, with the dictionary between `c`-superdifferentials and subdifferentials
  (Layer 5.4).  `TauCeti.subsingleton_setOf_mem_contactSet_of_strictConvexOn` and
  `TauCeti.IsDualCertificate.eq_of_isOptimalCoupling_of_strictConvexOn`
  (`…/OptimalTransport/Twist/StrictConvex.lean`): for `c(x,y) = h(x-y)` with `h` strictly convex,
  one contact partner at a point where the potential is finite nearby and differentiable, and,
  for nonnegative `h`, a finite source and a certified plan with almost everywhere differentiable
  first potential, uniqueness of the optimal coupling (Layer 5.8).
  `TauCeti.exists_isKantorovichOptimalTransportMap_gradient_and_not_continuousOn`
  (`…/OptimalTransport/DisconnectedTarget.lean`): the discontinuous Brenier map from a ball to two
  separated balls (Layer 6.11).  `TauCeti.mtwTensor`, `TauCeti.SatisfiesWeakMTW`,
  `TauCeti.SatisfiesStrongMTW`, `TauCeti.satisfiesWeakMTW_norm_sub_sq_div_two` and
  `TauCeti.satisfiesStrongMTW_norm_sub_sq_div_two_iff`
  (`…/OptimalTransport/Twist/MaTrudingerWang.lean`), and `TauCeti.cExp`, `TauCeti.IsCConvexSet` and
  `TauCeti.IsDualCertificate.ae_eq_cExp` (`…/OptimalTransport/Twist/CExponential.lean`): the
  Ma--Trudinger--Wang tensor and conditions with the quadratic regression values, the
  `c`-exponential, `c`-convex sets, and the map `x ↦ cExp(x, -Dφ(x))` of a certified plan of a
  twisted cost (Layer 6.12).
* Layers 8--9.  `TauCeti.absolutelyContinuousOnInterval_of_coe_eq_map_IccExtend` and
  `TauCeti.curveAction_le_lintegral_of_coe_eq_map_IccExtend`
  (`…/OptimalTransport/Wasserstein/AbsolutelyContinuous.lean`): the time marginals of a law on
  absolutely continuous paths of finite expected action form an absolutely continuous curve of
  `P_p(X)` of at most that action (Layer 8.1).
  `MeasureTheory.Measure.exists_measurable_ae_mem_geodesicPaths` and
  `MeasureTheory.Measure.exists_ae_mem_geodesicPaths_endpointLaw_eq`
  (`…/OptimalTransport/DynamicPlan.lean`): measurable selection of geodesics on a Polish metric
  space, and dynamic plans with a prescribed endpoint law (Layer 8.2).
  `TauCeti.WassersteinSpace.instIsGeodesicSpace`,
  `TauCeti.WassersteinSpace.isGeodesicSegment_iff_isDisplacementInterpolation`,
  `TauCeti.isLeast_wassersteinEDist_rpow_lintegral_curveAction`,
  `TauCeti.WassersteinSpace.isGeodesicSegment_iff_exists_isOptimalCoupling` and
  `TauCeti.IsDisplacementInterpolation` (`…/OptimalTransport/Wasserstein/Geodesic/Basic.lean`), and
  `TauCeti.WassersteinSpace.eqOn_of_isGeodesicSegment_of_ae_subsingleton` and
  `TauCeti.WassersteinSpace.isGeodesicSegment_iff_coe_eq_map_smul_add_smul_of_absolutelyContinuous`
  (`…/OptimalTransport/Wasserstein/Geodesic/Unique.lean`): `P_p(X)` is geodesic over a Polish
  geodesic space for `1 ≤ p ≤ ∞`; for `1 < p < ∞` its geodesics are the displacement
  interpolations of optimal dynamic plans, and on a strictly convex separable Banach space the
  linear interpolations of optimal couplings; `W_p^p` is the least expected `p`-action; and
  geodesics are unique when the optimal coupling is unique and almost surely joins points by
  unique geodesics, in particular out of an absolutely continuous law in `P₂` of a
  finite-dimensional inner product space (Layers 8.4, 9.1 and 9.2).
  `TauCeti.IsContinuityEquation` and `TauCeti.exists_isContinuityEquation_map`
  (`…/OptimalTransport/ContinuityEquation/Basic.lean`),
  `TauCeti.IsContinuityEquation.measure_univ_eq`
  (`…/OptimalTransport/ContinuityEquation/Endpoint.lean`),
  `TauCeti.exists_isContinuityEquation_map_smul_fst_add_smul_snd_of_isOptimalCoupling`
  (`…/OptimalTransport/ContinuityEquation/PlanInterpolation.lean`) and
  `TauCeti.IsContinuityEquation.ofReal_integral_sub_integral_le_lintegral_of_fderiv_le`
  (`…/OptimalTransport/ContinuityEquation/Subsolution.lean`): the distributional continuity
  equation, its solutions from laws on absolutely continuous curves, conservation of mass, the
  displacement interpolation as a solution of action `W_p^p`, and the bound of the boundary terms
  of a subsolution by the action (Layers 8.7 and 8.8).  `TauCeti.potentialEnergy`,
  `StrongConvexOn.geodesicallyConvex_potentialEnergy` and
  `StrongConvexOn.generalizedGeodesicallyConvex_potentialEnergy`
  (`…/OptimalTransport/Wasserstein/PotentialEnergy.lean`), `TauCeti.interactionEnergy`,
  `ConvexOn.geodesicallyConvex_interactionEnergy` and
  `TauCeti.not_geodesicallyConvex_interactionEnergy`
  (`…/OptimalTransport/Wasserstein/InteractionEnergy.lean`), `TauCeti.internalEnergy`
  (`…/OptimalTransport/Wasserstein/InternalEnergy/Basic.lean`),
  `TauCeti.internalEnergy_map_smul_add_smul_gradient_le` and
  `TauCeti.WassersteinSpace.exists_isGeodesicSegment_convexAlong_internalEnergy`
  (`…/OptimalTransport/Wasserstein/InternalEnergy/DisplacementConvexity.lean`) and
  `TauCeti.renyiEntropy` (`…/OptimalTransport/Wasserstein/RenyiEntropy.lean`): the three energies
  as extended reals, `m`-convexity of the potential energy of an `m`-strongly convex potential
  along geodesics and generalized geodesics, convexity and the absence of a positive modulus for
  the interaction energy of a convex difference kernel, McCann's displacement convexity of the
  internal energy along the displacement interpolation of a Brenier map, and the Rényi entropy
  (Layer 9.5).
* Layer 10.  `TauCeti.descendingSlope` (`TauCeti/Analysis/GradientFlow/Slope.lean`),
  `TauCeti.IsStrongUpperGradient` (`TauCeti/Analysis/GradientFlow/UpperGradient.lean`),
  `TauCeti.IsCurveOfMaximalSlope` and `TauCeti.IsCurveOfMaximalSlope.apply_eq_add_dissipation`
  (`TauCeti/Analysis/GradientFlow/MaximalSlope/Basic.lean`), `TauCeti.IsEVISolution`,
  `TauCeti.IsEVISolution.dist_le` and `TauCeti.IsEVISolution.eqOn`
  (`TauCeti/Analysis/GradientFlow/EVI/Basic.lean`), `TauCeti.eviSemiflow`
  (`TauCeti/Analysis/GradientFlow/EVI/Semigroup.lean`), `TauCeti.moreauYosida` and
  `TauCeti.moreauYosidaResolvent` (`TauCeti/Analysis/GradientFlow/MoreauYosida/Basic.lean`),
  `TauCeti.moreauYosidaResolvent_nonempty_of_lowerSemicontinuous`
  (`TauCeti/Analysis/GradientFlow/MoreauYosida/Existence.lean`), `TauCeti.deGiorgiInterpolant`
  (`TauCeti/Analysis/GradientFlow/DeGiorgiInterpolation.lean`),
  `TauCeti.IsGeneralizedMinimizingMovement` and `TauCeti.exists_isGeneralizedMinimizingMovement`
  (`TauCeti/Analysis/GradientFlow/MinimizingMovement.lean`),
  `TauCeti.hasDerivAt_toReal_moreauYosida`
  (`TauCeti/Analysis/GradientFlow/MoreauYosida/Derivative.lean`),
  `TauCeti.isCurveOfMaximalSlope_of_forall_mem_moreauYosidaResolvent`
  (`TauCeti/Analysis/GradientFlow/MaximalSlope/MinimizingMovement.lean`),
  `TauCeti.IsEVISolution.isCurveOfMaximalSlope`
  (`TauCeti/Analysis/GradientFlow/EVI/MaximalSlope.lean`),
  `TauCeti.isCurveOfMaximalSlope_of_tendsto`
  (`TauCeti/Analysis/GradientFlow/MaximalSlope/Convergence.lean`) and
  `TauCeti.TendstoGamma.mem_moreauYosidaResolvent_of_tendsto`
  (`TauCeti/Analysis/GradientFlow/MoreauYosida/GammaConvergence.lean`): slopes and strong upper
  gradients; curves of maximal slope with their energy identity; `EVI_λ` solutions with
  `λ`-contraction, uniqueness and the semiflow they generate; the Moreau--Yosida approximation and
  resolvent, nonempty for a lower semicontinuous coercive energy on a proper metric space; De
  Giorgi's interpolant; generalized minimizing movements and their existence; the derivative of
  the Moreau--Yosida approximation in the step; limits of minimizing movements and `EVI_λ`
  solutions as curves of maximal slope; the Sandier--Serfaty limit of curves of maximal slope on
  a fixed carrier; and stability of resolvent steps under Γ-convergence (Layers 10.1--10.6).
* Layer 11.  `TauCeti.boltzmannEntropy` and `TauCeti.klDiv_eq_boltzmannEntropy_add_sub`
  (`…/OptimalTransport/Wasserstein/InternalEnergy/Basic.lean`) and
  `TauCeti.WassersteinSpace.lowerSemicontinuous_boltzmannEntropy`
  (`…/OptimalTransport/Wasserstein/BoltzmannEntropy.lean`): the signed entropy, the identity
  `klDiv μ m = Ent_m(μ) + m(X) - μ(X)` for finite measures, and lower semicontinuity on `P_p(X)`
  (Layer 11.2).  `TauCeti.wassersteinTangentSpace`,
  `TauCeti.mem_orthogonal_wassersteinTangentSpace_iff` and `TauCeti.wassersteinTangentSpace_dirac`
  (`…/OptimalTransport/Wasserstein/TangentSpace.lean`): the tangent space as the closure of
  gradients of test functions, its orthogonal complement as the fields `w` with `div(wμ) = 0`, and
  its value at a Dirac mass (Layer 11.3).  `TauCeti.wassersteinSubdifferential`,
  `TauCeti.convex_wassersteinSubdifferential`, `TauCeti.isClosed_wassersteinSubdifferential`,
  `TauCeti.existsUnique_mem_wassersteinSubdifferential_forall_norm_le`,
  `TauCeti.descendingSlope_le_of_mem_wassersteinSubdifferential`,
  `TauCeti.ConvexAlongGeodesics.mem_wassersteinSubdifferential_iff` and
  `StrongConvexOn.mem_wassersteinSubdifferential_potentialEnergy`
  (`…/OptimalTransport/Wasserstein/Subdifferential.lean`), and
  `TauCeti.hasDerivAt_integral_comp_add_smul`
  (`…/OptimalTransport/Wasserstein/PotentialEnergy.lean`): the Fréchet subdifferential of Layer
  11.4 with the properties recorded there, the gradient of an `m`-strongly convex potential as a
  subgradient of its potential energy, and the first variation of the potential energy (Layers
  11.4 and 11.5).  `TauCeti.WassersteinSpace.moreauYosidaResolvent_nonempty`,
  `TauCeti.WassersteinSpace.moreauYosidaResolvent_nonempty_of_properSpace` and
  `TauCeti.WassersteinSpace.exists_forall_mem_moreauYosidaResolvent`
  (`…/OptimalTransport/Wasserstein/Resolvent.lean`), and
  `TauCeti.apply_le_apply_add_of_mem_moreauYosidaResolvent` and
  `TauCeti.integral_inner_eq_neg_mul_of_mem_moreauYosidaResolvent`
  (`…/OptimalTransport/Wasserstein/EulerLagrange.lean`): existence of the JKO step and of JKO
  sequences for a narrowly lower semicontinuous coercive energy whose bounded sequences of
  bounded energy are tight, in particular on a proper space, and the variational inequality and
  Euler--Lagrange equation of the step (Layer 11.6).
* Layer 12.  `TauCeti.frechetRadius`, `TauCeti.frechetPower`,
  `TauCeti.frechetRadius_rpow_eq_frechetPower`,
  `TauCeti.isFrechetBarycenter_iff_forall_frechetPower_le`, `TauCeti.chebyshevRadius` and
  `TauCeti.IsChebyshevCenter` (`TauCeti/MeasureTheory/Measure/FrechetMean/Basic.lean`) and
  `TauCeti.frechetRadius_top_eq_iSup_support`
  (`TauCeti/MeasureTheory/Measure/FrechetMean/Support.lean`): the Fréchet radius and power
  functional of a measure on a pseudo-extended-metric space, their value relation and common
  finite minimizers for `0 < p < ∞`, the Chebyshev radius and centers, and the support formula
  at `p = ∞` on a hereditarily Lindelöf space (Layer 12.1).
  `TauCeti.lipschitzWith_one_toReal_frechetRadius`, `TauCeti.isCompact_frechetRadius_sublevel`,
  `TauCeti.exists_isFrechetBarycenter` and `TauCeti.isCompact_frechetBarycenters` (the same
  `Basic.lean`), `TauCeti.IsCATZeroSpace` (`TauCeti/Topology/MetricSpace/CATZero.lean`) and
  `TauCeti.subsingleton_frechetBarycenters_two`
  (`TauCeti/MeasureTheory/Measure/FrechetMean/CATZero.lean`): for a probability law of finite
  radius somewhere, the `1`-Lipschitz radius and, on a proper space, compact sublevels, existence
  and compactness of the barycenters; CAT(0) spaces and uniqueness of their quadratic
  barycenters (Layer 12.2).  `TauCeti.exists_measurable_isFrechetBarycenter_sum_smul_dirac`
  (`TauCeti/MeasureTheory/Measure/FrechetMean/Selection.lean`): the Borel barycenter application
  on a proper metric space (Layer 12.3).
  `TauCeti.WassersteinSpace.isFrechetBarycenter_sum_smul_dirac_iff_isMinOn`
  (`…/OptimalTransport/Wasserstein/FrechetMean.lean`) and
  `TauCeti.WassersteinSpace.exists_isFrechetBarycenter_sum_smul_dirac`
  (`…/OptimalTransport/MultiMarginal/Barycenter.lean`): on a Polish space the barycenters of
  `∑ w_j δ_{μ_j}` are the minimizers of the weighted `p`-cost, and they exist on a proper space
  (Layer 12.3).  `TauCeti.exists_isMultiCoupling_isMinOn_lintegral`
  (`…/OptimalTransport/MultiMarginal/Existence.lean`), and
  `TauCeti.iInf_sum_mul_wassersteinEDist_rpow_eq`, `TauCeti.iInf_sum_mul_wassersteinEDist_sq_eq` and
  `TauCeti.isFrechetBarycenter_two_iff_exists_isMinOn_lintegral_map_eq`
  (`…/OptimalTransport/MultiMarginal/Barycenter.lean`): attainment of the multi-marginal problem
  for a lower semicontinuous cost and tight marginals on second-countable metrizable spaces, equality of the barycentric and multi-marginal values, on a
  proper space for `d^p` and on a Hilbert space for the weighted mean, and the quadratic
  barycenters as the weighted means of the optimal multi-couplings (Layer 12.6).
  `TauCeti.WassersteinSpace.subsingleton_frechetBarycenters`
  (`…/OptimalTransport/Wasserstein/Barycenter/Uniqueness/Basic.lean`),
  `TauCeti.WassersteinSpace.subsingleton_frechetBarycenters_two_sum_smul_dirac`
  (`…/OptimalTransport/Wasserstein/Barycenter/Uniqueness/Euclidean.lean`) and
  `TauCeti.wassersteinEDist_two_smul_add_smul_sq_lt`
  (`…/OptimalTransport/Wasserstein/Mixture/Euclidean.lean`): at most one barycenter when the law
  of the inputs charges laws whose optimal plans are induced by maps, in particular at most one
  quadratic barycenter of finitely many laws one of which has positive weight and is absolutely
  continuous, through strict convexity of `ν ↦ W₂(μ,ν)²` for an absolutely continuous `μ` (Layer
  12.7).  `TauCeti.WassersteinSpace.existsUnique_isFrechetBarycenter_real`
  (`…/OptimalTransport/Wasserstein/Barycenter/Uniqueness/Real.lean`),
  `TauCeti.WassersteinSpace.tendsto_of_isFrechetBarycenter_empiricalMeasure_ae`
  (`…/OptimalTransport/Wasserstein/Barycenter/Empirical.lean`) and
  `TauCeti.Probability.isFrechetBarycenter_two_multivariateGaussian`
  (`…/OptimalTransport/Wasserstein/Gaussian/Barycenter.lean`): the unique quadratic barycenter of
  a law of finite second moment on `P₂(ℝ)`, almost sure convergence of empirical barycenters to a
  unique population barycenter, and the Gaussian interpolation as a barycenter of two Gaussian
  laws (Layer 12.8).
* Layer 13.  `TauCeti.tendsto_of_klDiv_eq_schroedingerValue` and
  `TauCeti.lowerSemicontinuous_entropicTransportCost` (`…/OptimalTransport/Entropic/Stability.lean`):
  convergence of Schrödinger minimizers along weakly convergent marginals and references once
  the values satisfy the limsup bound and the limit value is finite, and lower semicontinuity of
  the entropic cost (Layer 13.2).
  `TauCeti.IsCoupling.exists_eq_withDensity_exp_add_of_klDiv_eq_schroedingerValue` and
  `TauCeti.exists_isCoupling_lintegral_add_mul_klDiv_eq_entropicTransportCost`
  (`…/OptimalTransport/Entropic/SchroedingerSystem.lean`): for a reference with bounded measurable
  log-density against `μ⊗ν`, `μ` finite, the Schrödinger minimizer has density `exp(φ ⊕ ψ)`
  against the reference with bounded measurable potentials; for a bounded cost the entropic
  optimal plan exists with a Gibbs density (Layer 13.3).
  `MeasureTheory.Measure.proportionalFitting`, `TauCeti.klDiv_eq_add_klDiv_proportionalFittingStep`,
  `TauCeti.klDiv_eq_sum_add_klDiv_proportionalFitting` and
  `TauCeti.tendsto_klDiv_fst_proportionalFitting` (`…/OptimalTransport/ProportionalFitting.lean`):
  the iteration, the Pythagorean identity of one sweep and its telescoped form for a finite
  reference and a finite coupling, and convergence of the marginal errors under finite-entropy
  feasibility (Layer 13.7).  `Matrix.exists_sinkhorn_scaling_iff`
  (`TauCeti/Data/Matrix/Scaling/Support.lean`) and
  `Matrix.hasTotalSupport_iff_exists_mem_doublyStochastic` (`TauCeti/Data/Matrix/TotalSupport.lean`):
  a nonnegative rectangular kernel has a positive diagonal scaling with marginals `a`, `b` exactly
  when some nonnegative matrix with the same zero pattern has those marginals, and a square
  matrix has total support exactly when some doubly stochastic matrix has its zero pattern
  (Layer 13.8).  `TauCeti.hilbertProjectiveDist`, `Matrix.projectiveDiameter` and
  `Matrix.hilbertProjectiveDist_mulVec_le` (`TauCeti/Data/Matrix/BirkhoffContraction.lean`),
  `Matrix.hilbertProjectiveDist_sinkhornStep_le` (`TauCeti/Data/Matrix/Sinkhorn/Basic.lean`),
  `Matrix.hilbertProjectiveDist_sinkhornStep_iterate_succ_le_mul_projectiveDiameter` and
  `Matrix.sum_abs_sum_sinkhornPlan_iterate_apply_sub_le` (`TauCeti/Data/Matrix/Sinkhorn/Rate.lean`)
  and `TauCeti.tendsto_proportionalFitting_apply`
  (`…/OptimalTransport/Finite/ProportionalFitting.lean`): Hilbert's projective metric, the
  diameter `Δ(K)`, Birkhoff's contraction with factor `tanh(Δ(K)/4)` for a strictly positive
  kernel on positive vectors, the factor `tanh(Δ(K)/4)²` for a full Sinkhorn step, explicit rates
  for the iterates and the marginal residual, and setwise convergence of proportional fitting to
  the Schrödinger minimizer for strictly positive finite masses (Layer 13.9).
  `Matrix.ofReal_entropicTransportValue_eq` and `Matrix.entropicDualValue_eq_mul_relEntropyDual`
  (`…/OptimalTransport/Finite/Entropic.lean`) and `TauCeti.proportionalFitting_real_singleton`
  (`…/OptimalTransport/Finite/ProportionalFitting.lean`): agreement of the finite primal and dual
  values and of the Sinkhorn iterates with the measure-theoretic ones for a nonnegative real cost
  (Layer 13.10).
* Layers 14--15.  `TauCeti.MetricMeasureSpace.CurvatureDimensionInfinity` and
  `TauCeti.MetricMeasureSpace.curvatureDimensionInfinity_iff_geodesicallyConvex`
  (`…/OptimalTransport/MetricMeasure/CurvatureDimension.lean`), `TauCeti.distortionSigma` and
  `TauCeti.distortionTau` (`…/OptimalTransport/MetricMeasure/DistortionCoefficient.lean`),
  `TauCeti.MetricMeasureSpace.MeasureContraction`
  (`…/OptimalTransport/MetricMeasure/MeasureContraction.lean`) and
  `TauCeti.MetricMeasureSpace.EssentiallyNonbranching`
  (`…/OptimalTransport/MetricMeasure/Nonbranching.lean`): `CD(K,∞)`, its form as `K`-geodesic
  convexity of the entropy for a reference of full support, the distortion coefficients,
  `MCP(K,N)`, and essential nonbranching (Layer 14.2).  `TauCeti.sturmEDist`
  (`…/OptimalTransport/MetricMeasure/TransportationDistance.lean`) and
  `TauCeti.gromovProkhorovEDist` (`…/OptimalTransport/MetricMeasure/GromovProkhorov.lean`):
  Sturm's transportation distance and the Gromov--Prokhorov distance (Layers 14.4 and 15.6).
  `TauCeti.AreWeaklyIsomorphicKernels` (`…/OptimalTransport/GromovWasserstein/WeakIsomorphism.lean`),
  `TauCeti.gromovWassersteinDistortion`, `TauCeti.gromovWassersteinEDist`,
  `TauCeti.gromovWassersteinEDist_comm` and `TauCeti.gromovWassersteinEDist_triangle`
  (`…/OptimalTransport/GromovWasserstein/Basic.lean`),
  `TauCeti.exists_isCoupling_gromovWassersteinDistortion_eq`
  (`…/OptimalTransport/GromovWasserstein/Attainment.lean`) and
  `TauCeti.gromovWassersteinEDist_eq_zero_iff` (`…/OptimalTransport/GromovWasserstein/Zero.lean`):
  weak isomorphism of measured kernels, the distortion and the distance, symmetry, the triangle
  inequality for a standard Borel third carrier, an optimal coupling on Polish carriers, and, for
  standard Borel probability carriers, almost everywhere strongly measurable kernels and
  `p ≠ 0`, zero distance exactly for weakly isomorphic kernels (Layers 15.1--15.4).
  `TauCeti.GromovWassersteinSpace.instIsGeodesicSpace`
  (`…/OptimalTransport/GromovWasserstein/Geodesic/Basic.lean`) and
  `TauCeti.GromovWassersteinSpace.completeSpace_of_completeSpace_gromovWassersteinSpace`
  (`…/OptimalTransport/GromovWasserstein/Point.lean`): the quotient is geodesic over a complete
  separable geodesic target, and a complete quotient forces a complete target (Layer 15.5).
  `TauCeti.kernelSectionLaw` and
  `TauCeti.iInf_eLpNorm_kernelSectionLawEDist_le_gromovWassersteinEDist`
  (`…/OptimalTransport/GromovWasserstein/SectionLaw.lean`), `TauCeti.kernelEccentricity` and
  `TauCeti.wassersteinEDist_map_kernelEccentricity_le_gromovWassersteinEDist`
  (`…/OptimalTransport/GromovWasserstein/Eccentricity.lean`) and
  `TauCeti.wassersteinEDist_kernelDistribution_le_gromovWassersteinEDist`
  (`…/OptimalTransport/GromovWasserstein/KernelDistribution.lean`): the section-law,
  eccentricity and kernel-distribution lower bounds (Layer 15.8).
  `TauCeti.gromovWassersteinEDist_eq_iInf_transportMatrix` and
  `TauCeti.exists_isMinOn_gromovWassersteinObjective`
  (`…/OptimalTransport/GromovWasserstein/Finite.lean`) and `TauCeti.gromovWassersteinEDist_twoPoint`
  (`…/OptimalTransport/GromovWasserstein/TwoPoint.lean`): the finite distance as an infimum over
  transport matrices, attainment of the finite objective, and the two-point value (Layer 15.9).

Here `…/` abbreviates `TauCeti/MeasureTheory/`.

### From other roadmaps

* [Hopf--Rinow](../../Completed/HopfRinow/README.md), Layers 1--4: the Levi-Civita
  connection, exponential maps and local logarithms, completeness, minimizing geodesics,
  and metric length and geodesic spaces (Layers 7--9).
* [RiemannianGeometry](../RiemannianGeometry/README.md), R1: the curvature calculus over Tau
  Ceti's `CovariantDerivative.ricciTensor`, including the Ricci identity and Bianchi identities
  (Layer 14.6); R2--R3 and R4.6: Jacobi fields, conjugate points, injectivity radius, the cut
  locus with its measurability and volume-nullity, and smoothness of squared distance off the
  cut relation (Layer 7).
* [DifferentialGeometry](../DifferentialGeometry/README.md), Layer 12, items 12.2--12.5: the
  Riemannian gradient `mgradient`, the divergence and Hessian, the volume form and density,
  whose measure is Tau Ceti's `TauCeti.riemannianVolume`, and the divergence theorem
  (Layers 8.9, 11.10 and 14.6).
* [GeometricMeasureTheory](../GeometricMeasureTheory/README.md), G2: the weighted area
  formula for Lipschitz maps `f : ℝᵐ → ℝⁿ`, `m ≤ n`, with extended multiplicity (Layer 6.6).
* [PDE](../PDE/README.md), §1.6 (A6), §1.7 (A7), §2.4 (B11) and §6.3 (F26):
  Rellich--Kondrachov, Hölder spaces, bounded and vanishing mean oscillation, and the concrete
  heat semigroup (Layers 5.9, 6 and 11).
* [One-parameter semigroups](../../Completed/OneParameterSemigroups/README.md), Part A:
  C₀ semigroups, generators, resolvents, and Hille--Yosida (Layer 11.9).

## Existing Lean work and coordination

The closest and broadest Lean prior art is Joseph K. Miller's
Apache-2.0
[`Vlasov/OT`](https://github.com/Hydrodynamical/Vlasov_Meanfield_Formalization/tree/31186ee11b1c478a35b1775db48384252eb06e22/Vlasov/Vlasov/OT)
development, accompanying
[arXiv:2607.08986](https://arxiv.org/abs/2607.08986).  At the linked commit it defines
a raw-measure, plan-first `Vlasov.IsCoupling π μ ν`, an honest extended `W₁` coupling
cost, real cost-generic results through `ENNReal.ofReal`, gluing, finite
linear-programming attainment and approximation, hard Kantorovich--Rubinstein duality,
map functoriality, and lower semicontinuity of `W₁`.  Its argument order is the convention
pinned above.  This work is a migration source, not permission to specialize the full roadmap
to `W₁` or to its application.

Daniel Lyng's Apache-2.0
[`Econlib/Optimization/OptimalTransport`](https://github.com/danlyng/Econlib/tree/003655ccf010cdf44c4f67d6675167b54ce0e9df/Econlib/Optimization/OptimalTransport)
development independently contains a sorry-free compact-space theory of couplings,
real-valued transport cost for bounded continuous costs, primal attainment, finite
atomization and duality, and Kantorovich--Rubinstein duality on compact pseudometric
spaces.  Its finite approximation proof is valuable migration material, but its private
`ProbDist` synonym, compactness assumptions, and totalized real integral are too
restrictive for the public foundation described above.

Quang Dao and Devon Tuma's Apache-2.0
[`Verified-zkEVM/VCVio`](https://github.com/Verified-zkEVM/VCVio/tree/a5f474fd0e9a26266cc599d100267411690dfeb7)
development contains substantial discrete coupling prior art.  At the pinned snapshot,
[`Coupling.lean`](https://github.com/Verified-zkEVM/VCVio/blob/a5f474fd0e9a26266cc599d100267411690dfeb7/ToMathlib/ProbabilityTheory/Coupling.lean)
defines PMF/SPMF couplings and proves bind, diagonal, product, Dirac, pointwise, and
expectation identities;
[`OptimalCoupling.lean`](https://github.com/Verified-zkEVM/VCVio/blob/a5f474fd0e9a26266cc599d100267411690dfeb7/ToMathlib/ProbabilityTheory/OptimalCoupling.lean)
proves compactness of the finite-carrier SPMF coupling polytope and attainment of bounded
finite-valued objectives.  This is valuable migration material for the finite acceptance
tests and coupling combinatorics, but its `SPMF`/failure-mass interface and finite-carrier
topology do not replace the raw-measure and Polish-space foundation here.

All three developments are Apache-2.0.  A port records the pinned source SHA, the licence
provenance and the attribution of the adapted material, and states how its API differs from
the raw-measure, plan-first, extended-cost conventions pinned above.

Two other public developments are prototypes, not completed dependencies:

* LeanTriathlon's
  [`SinkhornTheorem`](https://github.com/project-numina/LeanTriathlon/tree/main/LiveLeanTriathlonSorry/SinkhornTheorem)
  states a finite positive-matrix scaling result with `sorry`;
* `neural_atlas_MPMcontact` has a
  [`BrenierProposed.lean`](https://github.com/stvsun/neural_atlas_MPMcontact/blob/main/lean/OTContact/BrenierProposed.lean)
  sketch with opaque stand-ins and `sorry`, under GPL-3.0.

Neither can be cited as a proved theorem or copied into Tau Ceti.  The pinned Mathlib has no
general Wasserstein, Benamou--Brenier, or Gromov--Wasserstein API.  An archived
[ItaLean 2025 optimal-transport design
thread](https://leanprover-community.github.io/archive/stream/541885-ItaLean-2025/topic/Projects.3A.20Optimal.20Transport.html)
records work coordinated by Till Wehling and Rémy Degenne; its linked repository is not
public.

## How to read the build

The numbering is a dependency order.  A layer is complete only when its definitions have
the basic algebraic, measurable, topological, and extensionality API described here; a
single headline theorem does not discharge it.  Claims and implementation PRs should
take coherent slices inside a layer rather than claim the entire roadmap.  Layers 0--3 are
the common spine: couplings, primal attainment, duality, and Wasserstein spaces.  Layers
4--7 build transport maps: the Monge problem, Brenier's theorem, Monge--Ampère regularity,
and Riemannian transport.  Layers 8--11 build dynamics: dynamic plans and
Benamou--Brenier, displacement convexity, metric gradient flows, and the Wasserstein
gradient flows of entropy.  Layers 12--15 apply this to barycenters, entropic transport,
synthetic curvature, and Gromov--Wasserstein, and Layer 16 assembles the public API.

## Layer 0: transport plans, maps, kernels, and gluing

Build the definition-level foundation on arbitrary measurable spaces.

### 0.1 Couplings and bundled probability couplings

Define the raw coupling relation for arbitrary measures and the bundled probability
coupling space.  Prove that a coupling forces equal total mass, marginal formulas, and
extensionality, consuming Mathlib's `measurable_fst` and `measurable_snd`.  Prove
nonemptiness via product couplings for probabilities and normalized products for finite
equal-mass measures (including the zero-mass case), swap, map/pushforward in either
coordinate, and invariance under measurable equivalences.

*Needs:* Mathlib `MeasureTheory.Measure.fst`, `MeasureTheory.Measure.snd` and
`MeasureTheory.Measure.prod`; Tau Ceti `TauCeti.IsCoupling` and `TauCeti.Coupling`.

**Checks.**

* For `μ = δ₀` and `ν = 2δ₀` on a point there is no coupling: the marginals of any `π` have the
  common mass `π univ`, which would have to be both `1` and `2`; a definition that only
  constrained supports would accept `δ₀`.
* For `μ = ν = (δ₀+δ₁)/2` on `{0,1}` both the product law, mass `1/4` on each pair, and the
  diagonal law `(δ_{(0,0)}+δ_{(1,1)})/2` are couplings, so couplings are not unique.
* For the finite equal-mass pair `μ = 2δ₀`, `ν = 2δ₁` the normalized product
  `(μ⊗ν)/2 = 2δ_{(0,1)}` is a coupling, while the raw product `4δ_{(0,1)}` has marginals `4δ₀` and
  `4δ₁`; for `μ = ν = 0` the only coupling is `0`.

### 0.2 Transport maps and graph plans

Use `ProbabilityTheory.HasLaw` for transport maps and build only the OT-specific graph
coupling interface around it.  Reuse `ProbabilityTheory.HasLaw.comp`,
`ProbabilityTheory.HasLaw.congr`, and `MeasureTheory.MeasurePreserving.hasLaw`; prove
the graph plan's two marginal identities and the implication from a Monge map to a
Kantorovich plan.  Add identity and measurable-equivalence examples without
introducing a parallel transport-map predicate.

*Needs:* item 1; Mathlib `ProbabilityTheory.HasLaw`, `ProbabilityTheory.HasLaw.comp`,
`ProbabilityTheory.HasLaw.congr`, `MeasureTheory.MeasurePreserving.hasLaw` and
`MeasureTheory.Measure.map`; Tau Ceti `TauCeti.graphPlan`.
Tau Ceti declares or proves `TauCeti.isCoupling_graphPlan_iff` and `TauCeti.eq_graphPlan_iff`.

**Checks.**

* The graph plan of the identity from `μ` is the diagonal law `Measure.map (fun x ↦ (x,x)) μ`,
  with both marginals `μ`.
* No map `T` has law `(δ₀+δ₁)/2` under `δ₅`, since `T` pushes `δ₅` to `δ_{T 5}`; the only coupling
  `δ₅ ⊗ (δ₀+δ₁)/2` is therefore not a graph plan.
* For `μ` Lebesgue measure on `[0,1]`, the maps `T = 0` and `T' = 1_{{1/2}}` differ only at `1/2`
  and have the same graph plan, so the interface identifies maps `μ`-a.e.; an everywhere-equality
  definition would separate them.

### 0.3 Disintegration of couplings

Consume `ProbabilityTheory.condDistrib`,
`ProbabilityTheory.compProd_map_condDistrib`, and Mathlib's
`MeasureTheory.Measure.IsCondKernel`/`MeasureTheory.Measure.disintegrate` API to
specialize standard-Borel disintegration to couplings.  Prove only the OT-facing
marginal and reconstruction corollaries, plus reconstruction from a marginal and a
probability kernel.  Derive the coupling-facing a.e.-kernel uniqueness corollary from
`ProbabilityTheory.eq_condKernel_of_measure_eq_compProd` and its kernel analogue.

*Needs:* item 1; Mathlib `ProbabilityTheory.condDistrib`,
`ProbabilityTheory.compProd_map_condDistrib`, `MeasureTheory.Measure.IsCondKernel`,
`MeasureTheory.Measure.disintegrate` and `ProbabilityTheory.eq_condKernel_of_measure_eq_compProd`;
a standard-Borel second factor.
Tau Ceti declares or proves `TauCeti.IsCoupling.compProd_condKernel`,
`TauCeti.isCoupling_compProd_iff` and `TauCeti.IsCoupling.ae_eq_condKernel_iff_compProd_eq`.

### 0.4 Gluing and countable chains

Prove the gluing lemma: couplings of `(μ,ν)` and `(ν,σ)` admit a joint law on
`X × Y × Z` with the prescribed two-coordinate marginals (Ambrosio--Gigli, *A user's guide
to optimal transport*, Lemma 2.1, p. 25, for three Polish spaces).  The one-sided theorem
obtained by disintegrating the second coupling needs only `Z` standard Borel; give the
symmetric theorem obtained by disintegrating the first coupling under the corresponding
hypothesis on `X`.  Derive composition of couplings and finite-chain gluing.  For
countable chains, consume Mathlib's Ionescu--Tulcea API--
`ProbabilityTheory.Kernel.partialTraj`, `ProbabilityTheory.Kernel.traj`, and
`ProbabilityTheory.Kernel.trajMeasure`--after obtaining the required transition
kernels from `ProbabilityTheory.condDistrib`.  Prove that the resulting trajectory law
has the requested finite marginals using
`ProbabilityTheory.Kernel.traj_map_frestrictLe` and Mathlib's
`MeasureTheory.IsProjectiveLimit`/`MeasureTheory.isProjectiveLimit_nat_iff` API.  Then
prove the arbitrary countable standard-Borel projective-family extension theorem by
building only the missing factorization/existence bridge over this API; do not
reimplement Ionescu--Tulcea or its Carathéodory construction.

*Needs:* items 1 and 3; Mathlib `ProbabilityTheory.Kernel.partialTraj`,
`ProbabilityTheory.Kernel.traj`, `ProbabilityTheory.Kernel.trajMeasure`,
`ProbabilityTheory.Kernel.traj_map_frestrictLe`, `MeasureTheory.IsProjectiveLimit` and
`MeasureTheory.isProjectiveLimit_nat_iff`; standard-Borel factors as stated.
Tau Ceti declares or proves `TauCeti.Measure.exists_glue_of_standardBorel_right`,
`TauCeti.Measure.exists_glue_of_standardBorel_left`, `TauCeti.Measure.exists_comp_of_exists_glue`
and `TauCeti.Measure.chainMeasure`.

### 0.5 Multi-marginal couplings

Define multi-marginal couplings indexed by a finite type, their projections and
reindexing, product nonemptiness, marginal replacement, and reduction to the
two-marginal API.

*Needs:* item 1; Mathlib `MeasureTheory.Measure.map`, `MeasureTheory.Measure.pi` and finite index
types.
Tau Ceti declares or proves `TauCeti.Measure.IsMultiCoupling`, `TauCeti.MultiCoupling`,
`TauCeti.Measure.replaceMarginal` and `TauCeti.couplingEquivMultiCouplingFinTwo`.

**Checks.**

* For the index type `Fin 2`, the multi-marginal couplings of `(μ,ν)` correspond to the couplings
  of item 1 under `(Fin 2 → X) ≃ X × X`; for `μ = ν = (δ₀+δ₁)/2` the diagonal law corresponds to
  the diagonal coupling.
* For three copies of `(δ₀+δ₁)/2` the product coupling gives mass `1/8` to each of the eight
  triples.
* For the empty index type every probability measure on the one-point space of tuples is a
  multi-marginal coupling, so the probability wrapper, not the marginal constraints, fixes the
  mass `1`.

### Examples

A coupling of two Dirac measures is unique; if the first marginal is
`δ_x`, then the unique coupling with second marginal `ν` is
`Measure.map (fun y ↦ (x,y)) ν`--which is not a Monge plan from `δ_x` when `ν` is
non-Dirac.  Finite
probability vectors give exactly nonnegative matrices with the prescribed row and column
sums, and gluing those matrices agrees with the measure-theoretic construction.

### Dependencies

Mathlib measure theory, kernels, `MeasureTheory.Measure.condKernel`, `ProbabilityTheory.condDistrib`, the Ionescu--Tulcea kernels `ProbabilityTheory.Kernel.traj`, and `MeasureTheory.IsProjectiveLimit`.

## Layer 1: transport cost, compactness, existence, and stability

Build the primal problem without compactness in its definition.

### 1.1 Transport cost and the signed interface

Define the extended transport cost and the set of optimal couplings.  Prove monotonicity
in the cost; scaling by a positive constant (and the zero-scaling law under nonempty
feasibility); addition of integrable split marginal terms; invariance under `π`-a.e.
equality for a fixed plan or under equality a.e. for **every** feasible coupling;
symmetry for symmetric costs; functoriality under measurable equivalences; and exact
formulas for Dirac marginals and graph plans.  Equality merely `μ⊗ν`-a.e. does not
control singular couplings.  In parallel build the bounded-below signed interface: for
integrable real functions `a,b` and an `EReal` cost `c ≥ a ⊕ b`, integrate the
nonnegative residual and reconstruct the signed extended value from the two fixed
marginal integrals.  Prove that this value is independent of the chosen split lower
bound and agrees with the nonnegative `ℝ≥0∞` interface when both apply.

*Needs:* Layer 0.1; Mathlib `MeasureTheory.lintegral` and `EReal`; Tau Ceti
`TauCeti.transportCost`, `TauCeti.IsOptimalCoupling` and `TauCeti.transportCostBddBelow`.
Tau Ceti declares or proves `TauCeti.transportCostBddBelow_coe_eq_transportCost`.

**Checks.**

* For `δ₀`, `δ₂` on `ℝ` and `c(x,y) = (x-y)²` the only coupling is `δ_{(0,2)}`, so the transport
  cost is `4`.
* For `μ = δ₀` and `ν = 2δ₀` the feasible set is empty and the value is `∞`; then
  `transportCost (0 • c)` is `∞` while `0 * transportCost c` is `0 * ∞ = 0` in `ℝ≥0∞`, which is
  why the zero-scaling law assumes a feasible coupling.
* For the constant signed cost `c ≡ -1` with probability marginals, the split lower bounds
  `a = b = -1/2` and `a = -1`, `b = 0` both give the residual `0` and the signed value `-1`, as
  independence of the split requires.

### 1.2 The weak topology on coupling sets

When the factor/product topologies have measurable opens, build the weak topology on a
fixed-marginal coupling subtype by inheritance from `ProbabilityMeasure`.  Consume
`MeasureTheory.ProbabilityMeasure.continuous_map` for the continuous coordinate
projections.  Prove that the coupling set is closed when the marginal
probability-measure spaces are `T1`, and give the Polish/Borel theorem as the canonical
specialization.  The closedness theorem, for factors and product with measurable opens, is Tau
Ceti's `TauCeti.isClosed_setOfPred_isCoupling`.  Do not introduce another notion of weak
convergence.

*Needs:* Layer 0.1; Mathlib `MeasureTheory.ProbabilityMeasure` with its weak topology,
`MeasureTheory.ProbabilityMeasure.continuous_map` and `OpensMeasurableSpace` on the factors; Tau
Ceti `TauCeti.isClosed_setOfPred_isCoupling`.

**Checks.**

* For `μ = ν = (δ₀+δ₁)/2` the couplings are
  `π_s = s(δ_{(0,0)}+δ_{(1,1)}) + (1/2-s)(δ_{(0,1)}+δ_{(1,0)})` for `s ∈ [0,1/2]`, and
  `π_{s_n} → π_s` weakly exactly when `s_n → s`: the coupling set is a closed segment.
* For `δ₀`, `δ₀` the coupling set is the single point `δ_{(0,0)}`, and the inherited topology is
  the one-point space.
* With varying marginals, `δ_{(1/n,1/n)}` converges weakly to `δ_{(0,0)}`, whereas in total
  variation the distance stays `2`; the inherited topology is the weak one.

### 1.3 Tightness and compactness of coupling sets

Consume `MeasureTheory.IsTightMeasureSet.prodMk` to derive tightness of the coupling
family from tightness of its two fixed marginals.  Prove relative compactness by
Prokhorov and compactness of the coupling set on Polish spaces (Nutz, *Introduction to Entropic
Optimal Transport*, Lemma 5.7, p. 46, for weakly compact families of marginals on Polish spaces).
Compactness for two tight marginals on factors with measurable opens and `T1` spaces of
probability measures, with a Hausdorff Borel product, is Tau Ceti's
`TauCeti.isCompact_setOfPred_isCoupling`, and its Polish specialization is
`TauCeti.isCompact_setOfPred_isCoupling_of_polishSpace`.  Supply compact
metrizable corollaries and a separate abstract theorem for spaces satisfying the
Prokhorov compactness property; do not infer it from Radon regularity alone.

*Needs:* item 2; Mathlib `MeasureTheory.IsTightMeasureSet.prodMk` and Prokhorov's theorem; Tau
Ceti `TauCeti.isCompact_setOfPred_isCoupling` and
`TauCeti.isCompact_setOfPred_isCoupling_of_polishSpace`.

### 1.4 Lower semicontinuity of the cost functional

In the weak/Borel regime of item 2, prove lower semicontinuity of
`π ↦ ∫⁻ c dπ` for nonnegative lower-semicontinuous `c`, first for bounded truncations
and then by monotone convergence: this is the semicontinuity half of the direct method in
Ambrosio--Gigli, *A user's guide to optimal transport*, Theorem 1.5, pp. 5--6.  On a pseudometric
space `Ω` whose open sets are measurable and for lower semicontinuous `f : Ω → [0,∞]`, Tau Ceti's
`TauCeti.lowerSemicontinuous_lintegral_probabilityMeasure` is lower semicontinuity of
`μ ↦ ∫⁻ f dμ` on probability measures with the topology of weak convergence, and
`TauCeti.le_liminf_lintegral_of_tendsto_probabilityMeasure` is its `liminf` form along an
arbitrary filter; applied on `X × Y` they give the statement for plans.  Include a reusable
theorem for costs bounded below by integrable marginal terms: for pseudometric `X` and `Y` with
measurable open sets in `X × Y`, a lower semicontinuous `c : X × Y → [-∞,∞]` and a lower bound
`a(x) + b(y) ≤ c(x,y)` with `a` and `b` real-valued, integrable against the marginals and upper
semicontinuous, `TauCeti.lowerSemicontinuous_planCostBddBelow` is lower semicontinuity of the
signed cost of item 1 on the couplings of the two marginals.  Upper semicontinuity of `a` and `b`
is what makes the residual `c - a - b` lower semicontinuous.

*Needs:* item 2; Mathlib `MeasureTheory.lintegral` with monotone convergence and the Portmanteau
theorem; Tau Ceti `TauCeti.lowerSemicontinuous_lintegral_probabilityMeasure`,
`TauCeti.le_liminf_lintegral_of_tendsto_probabilityMeasure` and
`TauCeti.lowerSemicontinuous_planCostBddBelow`.

**Checks.**

* For `π_n = δ_{(1/n,1/n)} → δ_{(0,0)}` on `ℝ²` and the lower semicontinuous cost equal to `0` at
  the origin and `1` elsewhere, `∫ c dπ_n = 1` for every `n` and the limit plan has cost `0`:
  the inequality `0 ≤ liminf 1` is strict, so the functional is not continuous.
* For the cost equal to `1` at the origin and `0` elsewhere, which is upper and not lower
  semicontinuous, the same sequence has costs `0` and limit cost `1`: lower semicontinuity of
  `c` cannot be dropped.
* For `c(x,y) = -x` on `ℝ × ℝ` with the split `a(x) = -x`, `b = 0` and a first marginal of finite
  first moment, the residual is `0` and the signed cost of every coupling is `-∫ x dμ`, a
  constant.

### 1.5 Primal attainment

Prove primal attainment for lower-semicontinuous costs on Polish spaces (Tau Ceti's
`TauCeti.exists_isOptimalCoupling`; Ambrosio--Gigli, *A user's guide to optimal transport*,
Theorem 1.5, p. 5, for costs bounded below) and the direct method theorem under abstract
compactness/lower-semicontinuity hypotheses.  Separate
finite-value existence from the fact that an optimizer exists with value `∞`.

*Needs:* items 3 and 4; Tau Ceti `TauCeti.exists_isOptimalCoupling`.

### 1.6 Stability of optimal plans

Prove stability under varying marginals/costs: require explicitly that every feasible
`π_n ⇀ π` satisfies
`liminf_n ∫ c_n dπ_n ≥ ∫ c dπ`, and prove tightness/relative compactness of optimizer
subsequences.  Under an explicit recovery-coupling condition, prove convergence of
values and subsequential convergence of optimizers.  State the fixed-cost
lower-semicontinuous corollary separately.  Only Layer 10 later packages these
conditions as Γ-liminf, Γ-limsup, and equicoercivity.

*Needs:* items 3--5; Mathlib Prokhorov's theorem.
Tau Ceti declares or proves `TauCeti.tendsto_transportCost`,
`TauCeti.exists_isOptimalCoupling_tendsto` and `TauCeti.lowerSemicontinuous_transportCost`.

### Examples

Solve every `2 × 2` discrete problem by enumerating its coupling
interval.  On ordered finite supports, if
`c(x₁,y₁)+c(x₂,y₂) ≤ c(x₁,y₂)+c(x₂,y₁)` whenever `x₁≤x₂` and
`y₁≤y₂`, prove that
uncrossing terminates and the monotone coupling is optimal; specialize this to
`c(x,y)=|x-y|^p` for `p≥1`.  Show that an infinite barrier cost correctly encodes a
closed transport constraint.

### Dependencies

Layer 0; Mathlib weak convergence of probability measures, `MeasureTheory.IsTightMeasureSet.prodMk`, Prokhorov's theorem, and `MeasureTheory.ProbabilityMeasure.continuous_map`.

## Layer 2: Kantorovich duality, transforms, and optimality certificates

This layer builds the dual theory at the same level of care as the primal.

### 2.1 Dual feasibility and weak duality

Define dual-feasible potential pairs and their value, with integrability conditions
that make the two marginal integrals meaningful.  Prove weak duality once for the
general interface.

*Needs:* Layer 1.1; Mathlib `MeasureTheory.Integrable` and `MeasureTheory.integral`.
Tau Ceti declares or proves `TauCeti.DualFeasible`, `TauCeti.kantorovichDualValue` and
`TauCeti.DualFeasible.kantorovichDualValue_le_transportCost`.

**Checks.**

* For `μ = δ₀`, `ν = (δ₀+δ₁)/2` on `{0,1}` and `c = |x-y|`, the pair `φ(0) = 0`, `ψ = (0,1)` is
  feasible with value `1/2`, the cost of the only coupling.
* For `δ₀`, `δ₂` and `c = (x-y)²`, the pair `φ(0) = 0`, `ψ(2) = 4` is feasible with value `4`,
  equal to the primal value.
* With the constraint reversed, `φ ⊕ ψ ≥ c`, the pair `φ = ψ = 10` would be feasible for `δ₀`,
  `δ₂` with value `20 > 4`, contradicting weak duality; the pinned direction `φ x + ψ y ≤ c(x,y)`
  excludes it.

### 2.2 The `c`-transform

Build the finite-real and extended-cost infimal `c`-transform interfaces,
`c`-concave functions, `c`-superdifferentials, contact sets, and normalization modulo
additive constants.  Even for real `c,φ`, the infimum may be `-∞`, so the transform has
an extended-real codomain.  Pin safe subtraction/normalization rules so no theorem
hides `∞-∞`.  Prove order reversal, double-transform inequalities, feasibility, and
improvement of a feasible pair by `c`-transformation.  For Polish `X,Y`, if the safely
defined integrand `(x,y) ↦ c(x,y)-φ(x)` is Borel, prove that
`{y | φᶜ(y)<a}` is analytic for every `a`, and hence that `φᶜ` is measurable in the completion
of every s-finite Borel measure on `Y`; for a real cost these are Tau Ceti's
`TauCeti.analyticSet_setOf_cTransform_lt` and `TauCeti.nullMeasurable_cTransform`, through Tau
Ceti's `TauCeti.MeasureTheory.AnalyticSet.nullMeasurableSet` (an analytic subset of a metrizable
space with measurable opens is null-measurable for every s-finite measure).  Use that explicit
completion-level statement in downstream integration, and do not claim Borel
measurability in general.
If every section `y ↦ c(x,y)` is continuous, prove that the infimal transform is upper
semicontinuous.  Separately, if `X` is compact metrizable and the integrand is lower
semicontinuous, prove attainment of the infimum and lower semicontinuity of the
transform; with both hypotheses it is continuous.  Record Borel measurability as a
corollary in these topological regimes.

*Needs:* item 1; Mathlib `EReal` and analytic sets `MeasureTheory.AnalyticSet` with measure
completions; Tau Ceti `TauCeti.analyticSet_setOf_cTransform_lt`, `TauCeti.nullMeasurable_cTransform`
and `TauCeti.MeasureTheory.AnalyticSet.nullMeasurableSet`.
Tau Ceti declares or proves `TauCeti.cTransform`, `TauCeti.IsCConcave`, `TauCeti.contactSet`,
`TauCeti.cSuperdifferential`, `TauCeti.cTransform_galoisConnection`, `TauCeti.isCConcave_iff`,
`TauCeti.upperSemicontinuous_cTransform`, `TauCeti.exists_cTransform_eq`,
`TauCeti.lowerSemicontinuous_cTransform`, `TauCeti.continuous_cTransform_coe` and
`TauCeti.cTransformExtended`.

**Checks.**

* On `X = Y = {0,1}` with `c = |x-y|` and `φ = (0,1)`, the infimal transform is `φᶜ = (0,-1)`, and
  the supremal transform would give `φᶜ(1) = 1`, violating `φ(1) + φᶜ(1) ≤ c(1,1) = 0`.
* On `X = ℝ` with `c ≡ 0` and `φ(x) = x`, `φᶜ(y) = inf_x (0 - x) = -∞` for every `y`, so the
  transform needs the extended-real codomain.
* In the first example `φᶜᶜ(0) = min(0-0, 1+1) = 0` and `φᶜᶜ(1) = min(1-0, 0+1) = 1`, so
  `φᶜᶜ = φ`: `φ` is `c`-concave.

### 2.3 Finite linear-programming duality

Prove finite-dimensional linear-programming duality for finite spaces, including
primal and dual attainment and complementary slackness.  Connect it definitionally or
by transparent equivalences to the measure API.

*Needs:* items 1--2; Mathlib finite-dimensional linear algebra and convex-cone separation.
Tau Ceti declares or proves `TauCeti.exists_cost_eq_finiteDualValue`,
`TauCeti.TransportMatrix.cost_eq_finiteDualValue_iff` and
`TauCeti.finiteDualValue_eq_kantorovichDualValue`.

### 2.4 Strong Kantorovich duality

Prove strong Kantorovich duality for continuous finite costs on compact metrizable
spaces.  Then prove the Polish lower-semicontinuous theorem (Villani 2009, Theorem 5.10,
parts (i) and (iii)) for
`c ≥ a ⊕ b`, with `a,b` upper-semicontinuous and integrable against the marginals,
comparing bounded-continuous and integrable dual classes.  For a real-valued cost,
finite primal value, and an integrable split upper envelope `c ≤ c_X ⊕ c_Y`, prove dual
attainment; without that attainment theorem's hypotheses prove only equality of
values.  Equality of values for a lower semicontinuous cost `c : X × Y → ℝ≥0∞` on Polish
spaces, in the integrable dual class, is Tau Ceti's
`TauCeti.transportCost_eq_sSup_ofReal_kantorovichDualValue_integrable_of_lowerSemicontinuous`.

*Needs:* items 1--3; Layers 1.3--1.5; Mathlib bounded continuous functions; Tau Ceti
`TauCeti.transportCost_eq_sSup_ofReal_kantorovichDualValue_integrable_of_lowerSemicontinuous`.
Tau Ceti declares or proves `TauCeti.isLUB_kantorovichDualValue_continuous`,
`TauCeti.isGreatest_kantorovichDualValue_integrable`,
`TauCeti.isLUB_kantorovichDualValue_of_lowerSemicontinuous_bddBelow` and
`TauCeti.exists_kantorovichDualValue_eq_of_le_add`.

### 2.5 Borel-cost duality

Throughout this subsection `X` and `Y` are Polish spaces with Borel probability laws `μ` and
`ν`, the cost `c : X × Y → [0,∞]` is Borel, `P` is the primal value of Layer 1.1, and `D` is the
supremum of `∫ φ dμ + ∫ ψ dν` over the integrable pairs with `φ(x) + ψ(y) ≤ c(x,y)` everywhere.

Define the partial value `P^ε`, for `ε ≥ 0`, as the infimum of `∫ c dπ` over the nonnegative
Borel measures `π` on `X × Y` whose two marginals are at most `μ` and `ν` and whose mass is at
least `1 - ε`, and the relaxed primal value `P^rel = lim_{ε→0} P^ε = sup_{ε>0} P^ε`
(Beiglböck--Léonard--Schachermayer, *A general duality theorem for the Monge--Kantorovich
transport problem*, arXiv:0911.4347v2, (6) and (7), pp. 2--3).  These are Tau Ceti's
`TauCeti.partialTransportCost` and `TauCeti.relaxedTransportCost`, defined for arbitrary measures
on measurable spaces with the mass condition `μ univ ≤ π univ + ε`.  Prove the following.

* `P^ε` is antitone in `ε`, `P^rel ≤ P`, and `P^rel = D`, both sides possibly `∞` (their
  Theorem 1.2, p. 3).  The inequality `D ≤ P^rel`, for real integrable feasible pairs and a
  finite `μ` with `μ univ = ν univ`, is Tau Ceti's
  `TauCeti.DualFeasible.ofReal_kantorovichDualValue_le_relaxedTransportCost`.
* `P = P^rel`, and hence `P = D`, in each of three cases: `c` is lower semicontinuous (their
  Corollary 3.3, p. 7; Tau Ceti's
  `TauCeti.relaxedTransportCost_eq_transportCost_of_lowerSemicontinuous`); `c` is bounded, or
  more generally `c ≤ a ⊕ b` with `a`, `b` integrable (their Corollary 3.1, p. 7, and the footnote
  to p. 2; Tau Ceti's `TauCeti.relaxedTransportCost_eq_transportCost_of_bounded` and
  `TauCeti.relaxedTransportCost_eq_transportCost_of_le_split`, on arbitrary measurable spaces);
  `c` is finite `μ⊗ν`-almost everywhere (their Theorem 1.2 (c), through their Theorem 3.4, p. 8).
* For `c` finite `μ⊗ν`-almost everywhere and admitting a transport plan of finite cost, `P = D`
  (Beiglböck--Schachermayer, *Duality for Borel measurable cost functions*, arXiv:0807.1468v1,
  Theorem 1, p. 2), and there are Borel `φ̂ : X → [-∞,∞)`, `ψ̂ : Y → [-∞,∞)` with
  `φ̂(x) + ψ̂(y) ≤ c(x,y)` everywhere and `∫ (φ̂ ⊕ ψ̂) dπ = P` for every transport plan `π` of
  finite cost (their Theorem 2, p. 2).  These maximizers need not be integrable; they are
  the contact potentials of item 7, not integrable dual optimizers.
* If a transport plan of finite cost exists and `h_n : X × Y → [0,∞]` are measurable, finite
  `μ⊗ν`-almost everywhere and increase uniformly to `∞`, then the primal values of the truncated
  costs `min(c, h_n)` increase to `P^rel`; and `P^rel` is attained by a pair of measurable
  potentials, in the sense of the previous bullet, exactly when `P^rel` is the primal value of
  `min(c, h)` for some measurable `h` finite `μ⊗ν`-almost everywhere
  (Beiglböck--Léonard--Schachermayer, Theorem 3.5, p. 8).  For the constant truncations
  `h_n = n`, a measurable cost and marginals of equal mass, the first assertion is Tau Ceti's
  `TauCeti.relaxedTransportCost_eq_iSup_transportCost_min`.

Do not present an unrelaxed arbitrary-Borel theorem: the first Check is a duality gap.

*Needs:* items 1 and 4; Layer 1; Tau Ceti `TauCeti.partialTransportCost`,
`TauCeti.relaxedTransportCost`,
`TauCeti.DualFeasible.ofReal_kantorovichDualValue_le_relaxedTransportCost`,
`TauCeti.relaxedTransportCost_eq_transportCost_of_lowerSemicontinuous`,
`TauCeti.relaxedTransportCost_eq_transportCost_of_bounded`,
`TauCeti.relaxedTransportCost_eq_transportCost_of_le_split` and
`TauCeti.relaxedTransportCost_eq_iSup_transportCost_min`.

**Checks.**

* On `X = Y = [0,1]` with Lebesgue marginals, let `c = 0` for `y < x`, `c = 1` for `y = x` and
  `c = ∞` for `y > x` (Beiglböck--Léonard--Schachermayer, Example 1.1, p. 2).  A plan of finite
  cost is carried by `{y ≤ x}` and has `∫ (x - y) dπ = 1/2 - 1/2 = 0`, so it is the diagonal plan
  and `P = 1`.  The partial plan `x ↦ (x, x - ε)` on `[ε,1]` has mass `1 - ε` and cost `0`, so
  `P^ε = 0` for every `ε > 0` and `P^rel = 0 = D`.
* For `μ = ν = δ₀` and `c ≡ 5` the partial plans are `m δ_{(0,0)}` with `1 - ε ≤ m ≤ 1`, so
  `P^ε = 5(1 - ε)` for `ε ≤ 1` and `P^rel = 5 = P`.
* In the same example a definition with one fixed `ε > 0` instead of the limit gives
  `5(1 - ε) < 5 = D`, a spurious gap for a bounded continuous cost.

### 2.6 Finite multi-marginal duality

Prove finite multi-marginal duality with the constraint
`∑ i, φ_i(x_i) ≤ c(x)`, dual attainment in the finite case, and complementary
slackness.  Connect it to the multi-marginal coupling API from Layer 0.

*Needs:* item 3; Layer 0.5.
Tau Ceti declares or proves `TauCeti.exists_cost_eq_finiteMultiDualValue` and
`TauCeti.FiniteMultiCoupling.cost_eq_finiteMultiDualValue_iff`.

### 2.7 Cyclical monotonicity and optimality

Define finite `c`-cyclical monotonicity (Tau Ceti's `TauCeti.IsCyclicallyMonotone`).  For
finite-valued lower-semicontinuous costs on Polish spaces, prove the Schachermayer--Teichmann
equivalence between finite-cost optimality and concentration on a measurable `c`-cyclically
monotone set (Schachermayer--Teichmann, arXiv:0711.1268v1: Proposition 1, p. 3, every
`c`-monotone plan is strongly `c`-monotone; Theorem 2, p. 7, strongly `c`-monotone plans are
optimal; Corollary 1, p. 7, the combination); this is
`TauCeti.IsCoupling.isOptimalCoupling_iff_exists_isCyclicallyMonotone`.  Separately formalize
their strong-monotonicity/contact-potential representation with its exact Borel and
extended-value conventions (`TauCeti.IsCoupling.exists_ae_add_eq_of_isCyclicallyMonotone` and
`TauCeti.IsCoupling.isOptimalCoupling_of_ae_mem_dualContactSet`); do not call those potentials
integrable dual optimizers.  Finiteness of the cost is load-bearing: on the circle with
Lebesgue marginals, `c(x,x) = 1`, `c(x,x+α) = 2` for an irrational rotation `α` and `c = ∞`
elsewhere, the plan on the graph of the rotation is `c`-cyclically monotone with cost `2`, while
the diagonal plan costs `1` (their Example 1, p. 8).
Concentration on the contact set of an **integrable dual optimizer** is equivalent to
optimality only in the dual-attainment regime of item 4, including its split upper
envelope.  Give the extended-valued cost regime only with its additional
measurability/relaxation hypotheses.
Keep concentration on a measurable set distinct from containment of topological
support, which additionally needs closedness/continuity.

*Needs:* items 1, 2 and 4; Layers 0--1; Tau Ceti `TauCeti.IsCyclicallyMonotone`,
`TauCeti.IsCoupling.isOptimalCoupling_iff_exists_isCyclicallyMonotone`,
`TauCeti.IsCoupling.exists_ae_add_eq_of_isCyclicallyMonotone` and
`TauCeti.IsCoupling.isOptimalCoupling_of_ae_mem_dualContactSet`.
Tau Ceti declares or proves `TauCeti.isCyclicallyMonotone_iff_exists_isCConcave` and
`TauCeti.IsOptimalCoupling.exists_isCyclicallyMonotone_of_lowerSemicontinuous`.

**Checks.**

* For `c(x,y) = (x-y)²` on `{0,1}` the empty family (`n = 0`) gives `0 ≤ 0`.
* For `Γ = {(0,0),(1,1)}` the swap gives `0 ≤ c(0,1) + c(1,0) = 2`, so `Γ` is `c`-cyclically
  monotone.
* For the anti-diagonal `{(0,1),(1,0)}` the swap gives `2 ≤ 0`, which fails; a definition with the
  inequality reversed accepts the anti-diagonal and rejects the diagonal.

### 2.8 Optimality certificates

Package complementary slackness/contact-set concentration as an optimality
certificate usable by later map, barycenter, and entropic layers.

*Needs:* items 1--7; Tau Ceti `TauCeti.IsDualCertificate`.
Tau Ceti declares or proves `TauCeti.isDualCertificate_iff`,
`TauCeti.IsDualCertificate.isOptimalCoupling` and `TauCeti.IsDualCertificate.transportCost_eq`.

**Checks.**

* For `μ = δ₀`, `ν = (δ₀+δ₁)/2` and `c = |x-y|`, the pair of item 1 has contact set containing
  `{(0,0),(0,1)}`, which carries the coupling, so the coupling is certified optimal at value
  `1/2`.
* The feasible pair `φ = ψ = 0` has contact set the diagonal, which misses the atom `(0,1)` of
  mass `1/2`; it certifies nothing, and its value `0` is below `1/2`.
* For `δ₀`, `δ₂` and `(x-y)²`, the pair `φ(0) = 0`, `ψ(2) = 4` certifies `δ_{(0,2)}` at value `4`.

The named summit is general Kantorovich duality, not merely its finite or compact special
case.  The Vlasov and Econlib finite-approximation arguments are candidate inputs after
API coordination.

### Examples

The three cyclical-monotonicity values of item 7's Checks are the base case.  The infimal `c`-transform on `X = Y = {0,1}` with `c(x,y) = |x-y|` and
`φ = (0,1)` is `φᶜ = (0,-1)`; the pair `(φ, φᶜ)` is dual feasible with contact set
`{(0,0),(1,0),(1,1)}`, whereas the supremal transform would give `φᶜ(1) = 1` and violate
`φ(1) + φᶜ(1) ≤ c(1,1) = 0`.  For `μ = δ₀` and `ν` uniform on `{0,1}` with the same cost, the
unique coupling costs `1/2`, and the dual pair `φ(0) = 0`, `ψ = (0,1)` attains the dual value
`1/2`.

### Dependencies

Layers 0--1; Mathlib analytic sets, measure completions, and finite-dimensional linear algebra.

## Layer 3: Wasserstein distances and topology

For every `p : ℝ≥0∞` with `1 ≤ p`, build the extended distance on all probability laws
and its honest finite-distance components.  The `p=∞` endpoint uses Mathlib's `eLpNorm`
convention but has a different topology from the finite-exponent spaces.

### 3.1 The Wasserstein distance

Define `W_p` as the infimum, over couplings, of the `eLpNorm` of ground `edist`.
Define the `p`-moment condition with `MemLp` about a basepoint.  Under `μ`-a.e.
measurability of all distance sections--in particular for a Borel metric structure--
prove basepoint-independence.  In an extended metric space, make the corresponding
claim only inside a fixed finite-distance component.  Under joint measurability of the
ground `edist`, prove symmetry and monotonicity in `p`.  Under a standard-Borel
measurable structure and measurable ground `edist`, prove the triangle inequality by
gluing plus Minkowski.  Under the Polish/Borel metric hypotheses, prove
`W_p=0 ↔ μ=ν` on a genuine metric base; on a pseudometric base give the induced
measurable quotient/pushforward statement instead.  These are the metric axioms of
Peyré--Cuturi, *Computational Optimal Transport*, Proposition 2.3, p. 21, for `1 ≤ p < ∞`,
proved by gluing two optimal plans, and of Ambrosio--Gigli, *A user's guide to optimal
transport*, Lemma 2.1 and Theorem 2.2, p. 25, for `p = 2` on `P₂(X)` over a Polish space.  For `p < ∞`, prove the exact
bridge to the integral-of-`edist^p`/root formula and Layer 1's transport cost.

*Needs:* Layers 0.1, 0.4 and 1.1; Mathlib `MeasureTheory.eLpNorm`, `MeasureTheory.MemLp` and
Minkowski's inequality; Tau Ceti `TauCeti.wassersteinEDist` and `TauCeti.HasFiniteMoment`.
Tau Ceti declares or proves `TauCeti.wassersteinEDist_eq_zero_iff_separationQuotient_eq`.

**Checks.**

* `W_p(δ₀,δ₂) = 2` on `ℝ` for every `p ∈ [1,∞]`: the only coupling is `δ_{(0,2)}`.
* For `μ = (δ₀+δ₁)/2` and `ν = δ₀` on `ℝ`, `W₁ = 1/2`, `W₂ = (1/2)^(1/2)` and `W_∞ = 1`,
  increasing in `p` as monotonicity requires; dropping the root `1/p` would give `W₂ = 1/2`.
* `W_p(δ₀, 2δ₀) = ∞`: unequal masses admit no coupling.

### 3.2 Finite-distance components and `P_p(X)`

In the standard-Borel/measurable-distance regime of item 1, define a
`PseudoEMetricSpace` component anchored at a reference law `μ₀` by finite `W_p`
distance.  On an ordinary `PseudoMetricSpace` with measurable distance sections,
define `P_p(X)` by finite moment about one/every basepoint and prove that it is the
component anchored at a Dirac law `δ_{x₀}`, through the unique coupling identity
`W_p(δ_{x₀},μ)=‖d(x₀,·)‖_{Lᵖ(μ)}`.  A general anchor gives that same set exactly
when `μ₀ ∈ P_p(X)`; state that hypothesis wherever the identification is used, and
record the guardrail that without it the anchored component is a different set--a
Cauchy law lies in its own finite-`W₂` component but not in `P₂(ℝ)`.  At `p=∞` the
moment condition reads `MemLp _ ∞`, so `P_∞(X)` is the laws at essentially bounded
ground distance from a basepoint; prove the `δ_{x₀}` identification there too, and
keep the metric, topological, and density statements for that endpoint in item 6
rather than inheriting them from `1 ≤ p < ∞`.  Give it a `PseudoMetricSpace`; under
the Polish/Borel hypotheses give a genuine `MetricSpace` when the ground distance
separates points, and otherwise a quotient metric.  Consume
`Subtype.instMeasurableSpace`, which definitionally pulls back the measurable
structure from `ProbabilityMeasure`; do not add a second measurable-space instance.
For `1 ≤ p < ∞`, under the Polish/Borel
hypotheses, prove that this inherited structure is the Borel σ-algebra of the `W_p`
topology, hence that opens are measurable; do the same for anchored components.  This
compatibility is a prerequisite for population laws `P ∈ P_p(P_p(X))` in Layer 12.
For `p=∞` and genuinely extended anchored components, choose and compare measurable
structures explicitly, claim equality only under a sourced theorem, and prove the
measurability needed by later uses: on a Polish metric space, `(μ,ν) ↦ W_p(μ,ν)` is jointly
measurable on pairs of probability laws for every `p`, `∞` included
(`TauCeti.measurable_wassersteinEDist`), and the inherited structure of `P_p(X)` is contained in
the Borel σ-algebra of its metric, one inclusion only
(`TauCeti.WassersteinSpace.measurableSpace_le_borel`).  Prove compatibility among `dist`, `edist`,
`eLpNorm`, the primal cost, and optimal couplings.

*Needs:* item 1; Mathlib `Subtype.instMeasurableSpace`, `PseudoEMetricSpace` and `MetricSpace`;
Tau Ceti `TauCeti.WassersteinSpace`.
Tau Ceti declares or proves `TauCeti.WassersteinComponent`,
`TauCeti.WassersteinSpace.isometryEquivComponent`, `TauCeti.WassersteinSpace.borelSpace`,
`TauCeti.measurable_wassersteinEDist` and `TauCeti.WassersteinSpace.measurableSpace_le_borel`.

**Checks.**

* For `μ = (δ₀+δ₂)/2`, `x₀ = 0` and `p = 2`, `W₂(δ₀,μ) = ‖d(0,·)‖_{L²(μ)} = (4/2)^(1/2) = √2`.
* The Cauchy law lies in its own finite-`W₂` component but not in `P₂(ℝ)`, since its second moment
  is `∞`: the anchored component equals `P₂` only for an anchor in `P₂`.
* The uniform law on `[0,1]` lies in `P_∞(ℝ)`, while the exponential law lies in every `P_p(ℝ)`
  with `p < ∞` and not in `P_∞(ℝ)`.

### 3.3 Separability, completeness, compactness, and quantization

For `1 ≤ p < ∞`, prove separability and completeness of `P_p(X)` when `X` has those
properties (Villani 2009, Theorem 6.18); completeness is Tau Ceti's
`TauCeti.WassersteinSpace.completeSpace`.  Then prove this definite list on a Polish `X`,
rather than "compactness and approximation" generically: a family in `P_p(X)` is relatively compact exactly when it
is tight and its `p`-moment tails about one basepoint are uniformly integrable, and
compact when it is also closed (Ambrosio--Gigli--Savaré, §7.1); finitely supported probability
measures are dense in `P_p(X)` (Villani 2009, Theorem 6.18); for i.i.d. `X_i ∼ μ ∈ P_p(X)`,
`W_p(n⁻¹∑_{i=1}^n δ_{X_i}, μ) → 0` almost surely (Varadarajan's theorem combined with Villani
2009, Theorem 6.9; Tau Ceti's `TauCeti.tendsto_wassersteinEDist_empiricalMeasure_ae`); and the `N`-point quantization error
`e_{N,p}(μ) = inf {W_p(μ,ν) | card (support ν) ≤ N}` tends to `0`.  Existence of a best
`N`-point quantizer and any quantitative rate are separate targets carrying their own
properness, finite-dimensional, or regularity hypotheses.  State them as such; do not
fold them into the convergence statements above.

*Needs:* items 1--2; Layer 1.3; Mathlib Prokhorov's theorem, `MeasureTheory.UniformIntegrable` and
the strong law of large numbers; Tau Ceti `TauCeti.tendsto_wassersteinEDist_empiricalMeasure_ae`
and `TauCeti.WassersteinSpace.completeSpace`.
Tau Ceti declares or proves `TauCeti.WassersteinSpace.separableSpace`,
`TauCeti.WassersteinSpace.isCompact_closure_iff_isTightMeasureSet_and_exists_setLIntegral_edist_rpow_le`,
`TauCeti.WassersteinSpace.dense_setOfPred_ae_mem_finset`,
`TauCeti.tendsto_wassersteinQuantizationError` and
`TauCeti.exists_wassersteinEDist_eq_wassersteinQuantizationError`.

### 3.4 Wasserstein convergence

For `1 ≤ p < ∞`, characterize `W_p` convergence as weak convergence plus
convergence/uniform integrability of `p`-moments (Villani 2009, Definition 6.8 and
Theorem 6.9).  Prove lower semicontinuity under
weak convergence and continuity under the stronger topology.

*Needs:* items 1--3; Mathlib weak convergence of probability measures and
`MeasureTheory.UniformIntegrable`.
Implemented in Tau Ceti by
`TauCeti.WassersteinSpace.tendsto_iff_tendsto_toProbabilityMeasure_and_lintegral`,
`TauCeti.WassersteinSpace.continuous_toProbabilityMeasure` and
`TauCeti.lowerSemicontinuous_wassersteinEDist`.

### 3.5 Functorial estimates

Prove functorial estimates, each written out rather than called standard.  Pushforward
by an `L`-Lipschitz map is `L`-Lipschitz in `W_p`.  For products, fix the `ℓᵖ` product
metric--in Lean the metric carried by `WithLp p (X × Y)`, not Mathlib's default sup
metric on `X × Y`--and prove the equality
`W_p(μ₁⊗μ₂,ν₁⊗ν₂)^p = W_p(μ₁,ν₁)^p + W_p(μ₂,ν₂)^p`.  It is the case `cᵢ = dᵢ^p` of the
splitting of an additively separable cost: for measurable `cᵢ` with values in `[0,∞]` and
probability marginals, the cost `c₁(x₁,y₁) + c₂(x₂,y₂)` from `μ₁⊗μ₂` to `ν₁⊗ν₂` has value
`transportCost c₁ μ₁ ν₁ + transportCost c₂ μ₂ ν₂`, finite or not, and the rearranged product of two
optimal plans is optimal (`TauCeti.transportCost_prod_add`, `TauCeti.IsOptimalCoupling.prod`).
For a probability vector `(a_i)`, prove the mixture bound
`W_p(∑ a_i μ_i, ∑ a_i ν_i)^p ≤ ∑ a_i W_p(μ_i,ν_i)^p`.
On a normed additive group, prove `W_p(μ*η,ν*η) ≤ W_p(μ,ν)`, with translation as its
specialization.  For a Markov kernel `K`, take the pointwise Wasserstein-Lipschitz
hypothesis `W_p(K(x,·),K(y,·)) ≤ L d(x,y)` and deduce `W_p(μK,νK) ≤ L W_p(μ,ν)` by
gluing.  That proof consumes a measurably chosen family of optimal or near-optimal
couplings of `K(x,·)` and `K(y,·)`, so record the standard-Borel/Polish hypotheses
supporting the selection, together with the measurability and moment hypotheses that
place `μK` in the intended finite-moment space.  The maximum-form product and mixture
statements for `p=∞` belong to item 6, stated separately.

*Needs:* items 1--2; Layers 0.3--0.4; Mathlib `WithLp`, kernels and
`ProbabilityTheory.Kernel.comp`.
Tau Ceti declares or proves `TauCeti.wassersteinEDist_map_le_mul`,
`TauCeti.WassersteinSpace.lipschitzWith_map`, `TauCeti.WassersteinSpace.isometry_map`,
`TauCeti.wassersteinEDist_map_toLp_prod`, `TauCeti.wassersteinEDist_conv_right_le`,
`TauCeti.wassersteinEDist_smul_add_smul_rpow_le`, `TauCeti.wassersteinEDist_comp_le_mul`,
`TauCeti.transportCost_prod_add` and `TauCeti.IsOptimalCoupling.prod`.

### 3.6 The exponent-`∞` distance

For a jointly measurable ground distance, prove that the `p=∞` specialization is the
infimum of coupling-wise essential suprema (`TauCeti.wassersteinEDist_top`) and give it
the conventional notation `W_∞`.  Build its anchored finite-distance
components.  If `X` is a complete separable metric space with its Borel structure,
prove that every anchored finite-`W_∞` component is complete, using near-optimal
consecutive couplings and Layer 0's countable gluing; give the global theorem only
when the carrier has a single finite-`W_∞` component.  State any stronger
nonseparable/Radon version separately with its own coupling-extension hypothesis.
Characterize `W_∞` convergence by couplings whose essential-supremum displacements
tend to zero, not by weak convergence plus moments; record that finite support need not
be dense and separability can fail.  On every Polish metric space and for all
`μ,ν ∈ P(X)`, prove, as an identity in `[0,∞]`,
`W_∞(μ,ν) = sup_{1≤p<∞} W_p(μ,ν) = lim_{p→∞} W_p(μ,ν)` (the supremum form is
`TauCeti.wassersteinEDist_top_eq_iSup`), and prove attainment of the `W_∞` infimum.  Retaining infinite values removes any need for a
bounded-support or all-moments hypothesis; follow
[Givens--Shortt Proposition 1](https://doi.org/10.1307/mmj/1029003026).  Give item 5's
product and mixture estimates their maximum forms here: for the sup product metric on
`X × Y`, prove `W_∞(μ₁⊗μ₂,ν₁⊗ν₂) = max (W_∞(μ₁,ν₁)) (W_∞(μ₂,ν₂))`, and for a
probability vector `(a_i)` prove
`W_∞(∑ a_i μ_i, ∑ a_i ν_i) ≤ max_{i | a_i>0} W_∞(μ_i,ν_i)`, consuming the attainment
just proved; these are Tau Ceti's `TauCeti.wassersteinEDist_top_prod` and
`TauCeti.wassersteinEDist_top_finset_sum_smul_le`, the second for finite measures of equal mass at
each positive weight, with the countable form `TauCeti.wassersteinEDist_top_sum_smul_le`.

*Needs:* items 1--2; Layer 0.4; Tau Ceti `TauCeti.wassersteinEDist_top` and
`TauCeti.wassersteinEDist_top_eq_iSup`; Givens--Shortt Proposition 1.
Tau Ceti declares or proves `TauCeti.WassersteinComponent.instCompleteSpaceTop`,
`TauCeti.tendsto_wassersteinEDist_top_iff_exists_couplings`,
`TauCeti.WassersteinSpace.not_dense_setOfPred_ae_mem_finset_top_baire`,
`TauCeti.WassersteinSpace.not_separableSpace_top_nat`, `TauCeti.wassersteinEDist_top_prod`,
`TauCeti.wassersteinEDist_top_finset_sum_smul_le` and `TauCeti.wassersteinEDist_top_sum_smul_le`.

**Checks.**

* For `μ = (δ₀+δ₁)/2` and `ν = δ₀`, `W_∞(μ,ν) = 1` and `W_p(μ,ν) = (1/2)^(1/p)`, which increases
  to `1` as `p → ∞`, as the supremum formula requires.
* On the two-point discrete space with the trivial σ-algebra, the `eLpNorm` side is `∞` and the
  essential-supremum side is `1`; with the full σ-algebra and marginals `δ₀`, `δ₁` both are `1`.
* For `μ = ∑_{k≥1} 2^{-k} δ_k` on `ℝ`, every finitely supported `ν` has `W_∞(μ,ν) = ∞`, so
  finitely supported laws are not dense in the `W_∞` component of `μ`, although its truncations
  converge to `μ` in `W₁`.

### 3.7 The quantile coupling on the line

Consume `ProbabilityTheory.cdf` on `ℝ`; build the generalized inverse/quantile of a
Borel probability law, its measurability and pushforward of uniform measure, and the
optimal monotone quantile coupling.  For every `p ∈ [1,∞]`, prove that `W_p` is the
`Lᵖ(0,1)` distance of the two quantiles, with the integral/root and essential-supremum
formulas at the corresponding endpoints (for `p < ∞`: Peyré--Cuturi, *Computational Optimal
Transport*, Remark 2.30, (2.34)--(2.36), pp. 31--32).  This is Tau Ceti's
`TauCeti.wassersteinEDist_eq_eLpNorm_quantile_sub`, for every `1 ≤ p ≤ ∞` and with no moment
hypothesis, built on the quantile `MeasureTheory.Measure.quantile`, its pushforward property
`MeasureTheory.Measure.measurePreserving_quantile`, and the optimality of the monotone coupling
`MeasureTheory.Measure.isOptimalCoupling_quantileCoupling`.

*Needs:* item 1; Mathlib `ProbabilityTheory.cdf` and Lebesgue measure on `(0,1)`; Tau Ceti
`TauCeti.wassersteinEDist_eq_eLpNorm_quantile_sub`.
Tau Ceti declares or proves `TauCeti.wassersteinEDist_one_eq_lintegral_enorm_cdf_sub`.

**Checks.**

* The quantile of `(δ₀+δ₂)/2` is `Q(s) = 0` for `s ≤ 1/2` and `Q(s) = 2` for `s > 1/2`.
* `W₁(δ₀,(δ₀+δ₂)/2) = ∫₀¹ |0 - Q(s)| ds = 1`, the cost of the only coupling.
* For `μ = ν = (δ₀+δ₁)/2` the quantile coupling is the diagonal, of `W₁` cost `0`; the antitone
  coupling `s ↦ (Q(s), Q(1-s))` costs `1`, so the coupling must be comonotone.

### 3.8 Kantorovich--Rubinstein duality

Prove Kantorovich--Rubinstein duality for `W_1` on Polish metric spaces with finite
first moments, normalized at a basepoint (Villani 2003, Theorem 1.14; Villani 2009, Particular
Case 5.16; Tau Ceti's
`TauCeti.wassersteinEDist_one_eq_iSup`).  Derive the compact variant, with no moment
hypothesis (`TauCeti.wassersteinEDist_one_eq_iSup_of_compactSpace`), and the bounded-Lipschitz
variant: on a Polish space, for `R ≥ 0` and finite measures of equal mass, the transport cost of
`min(d(x,y), 2R)` is the largest difference of integrals of a `1`-Lipschitz function bounded by
`R`, attained (`TauCeti.isGreatest_ofReal_integral_sub_integral_boundedLipschitz`,
`TauCeti.transportCost_truncated_dist_eq_iSup`).  Compare with Mathlib's weak-convergence
metrics: for every `R > 0`, weak convergence of probability measures on a Polish space is
uniform convergence of the integrals of the `1`-Lipschitz functions bounded by `R`, with no
moment hypothesis
(`TauCeti.tendsto_probabilityMeasure_iff_iSup_abs_integral_sub_integral_boundedLipschitz`).

*Needs:* items 1--2; Layer 2.4; Tau Ceti `TauCeti.wassersteinEDist_one_eq_iSup`.
Tau Ceti declares or proves `TauCeti.wassersteinEDist_one_eq_iSup_of_compactSpace`,
`TauCeti.isGreatest_ofReal_integral_sub_integral_boundedLipschitz`,
`TauCeti.transportCost_truncated_dist_eq_iSup` and
`TauCeti.tendsto_probabilityMeasure_iff_iSup_abs_integral_sub_integral_boundedLipschitz`.

### 3.9 The measured-metric carrier

Build the shared measured-metric carrier used by Layers 14--15: a complete separable
metric carrier, a Borel reference measure finite on bounded sets, support/full-support
reduction, and measure-preserving isometries.  The transported `ProbabilityMeasure`
remains separate from this reference measure.  Do not yet impose curvature, a kernel,
or a quotient.

*Needs:* item 2; Mathlib `MetricSpace`, `CompleteSpace`, `SecondCountableTopology` and Borel
measures.
Tau Ceti declares or proves `TauCeti.MetricMeasureSpace`.

**Checks.**

* `ℝ` with Lebesgue measure is a measured-metric carrier: the measure is finite on bounded sets
  and has full support.
* `ℚ` with counting measure is not: `[0,1] ∩ ℚ` is bounded with infinite mass.
* `[0,2]` with Lebesgue measure restricted to `[0,1]` reduces by support to `[0,1]`.

### Examples

On a metric base, `W_p(δ_x,δ_y)=d(x,y)` and zero distance separates
laws; a pseudometric example exercises the quotient statement.  Translations of a fixed
law in a normed space have the expected upper bound and equality in the canonical cases;
the one-dimensional quantile formula computes `W_p`.  The exponent-`∞` identity needs a jointly measurable ground distance: on the two-point
discrete space with the trivial σ-algebra the `eLpNorm` side is `∞` and the essential-supremum
side is `1`.

### Dependencies

Layers 0--2; Mathlib `eLpNorm`, `MemLp`, Minkowski, `ProbabilityTheory.cdf`, and the Lévy--Prokhorov metric.

## Layer 4: the Monge problem and abstract transport maps

Treat deterministic transport as a problem in its own right before proving Brenier.

### 4.1 The Monge problem

Define the Monge feasible set using `ProbabilityTheory.HasLaw T ν μ`, and define its
value by integrating the cost of such a.e.-measurable maps.  Prove the relaxation
inequality from Monge to Kantorovich and characterize equality for a graph coupling.

*Needs:* Layers 0.2 and 1.1; Mathlib `ProbabilityTheory.HasLaw`; Tau Ceti
`TauCeti.transportMapCost` and `TauCeti.IsKantorovichOptimalTransportMap`.

**Checks.**

* For `μ = δ₀`, `ν = (δ₀+δ₁)/2` and `c = |x-y|` the Monge feasible set is empty, so the Monge
  value is `∞` against the Kantorovich value `1/2`: the relaxation inequality can be strict.
* For `μ` uniform on `[0,1]`, `ν` uniform on `[0,2]` and `c = (x-y)²`, the map `T(x) = 2x` costs
  `∫₀¹ x² dx = 1/3`, the Kantorovich value.
* For `μ = ν = (δ₀+δ₁)/2` and the identity map, the Monge cost is `0`, equal to the cost of its
  graph plan.

### 4.2 Feasibility of transport maps

Build the basic feasibility theory.  For a point atom `x`, every transport map satisfies
`ν({T x}) ≥ μ({x})`, with no hypothesis on `Y`: an almost everywhere measurable map gives the
image of a set at least its mass (Mathlib's `MeasureTheory.Measure.le_map_apply_image`); this is
Tau Ceti's `ProbabilityTheory.HasLaw.measure_singleton_le`.  If `A` is measurable,
`0 < μ A < ∞`, and every measurable `B ⊆ A` has `μ B = 0` or `μ B = μ A`, prove that a map into a
standard Borel space sends `μ` restricted to `A` to `μ(A) δ_y` for one point `y`, so that every
law of such a map has a singleton of mass at least `μ A`
(`AEMeasurable.exists_map_restrict_eq_smul_dirac_of_atom`,
`ProbabilityTheory.HasLaw.exists_measure_atom_le_measure_singleton`); over a target law that is
null on singletons the Monge problem from such a source is then infeasible and has value `∞` for
every cost (`TauCeti.mongeCost_eq_top_of_measure_atom`).  Use Mathlib's
`MeasureTheory.NullSingletonClass μ` (every singleton is `μ`-null; on a standard Borel space a
finite measure with this property has no atoms) for the nonatomic corollaries: a nonatomic
standard Borel probability space admits a measurable map to every standard-Borel target law
(`MeasureTheory.Measure.exists_measurePreserving_of_nullSingleton`).  Include exact
atomic/nonatomic decompositions rather than claiming every Monge problem is feasible.

*Needs:* Layer 0.2; Mathlib `MeasureTheory.NullSingletonClass`,
`MeasureTheory.Measure.le_map_apply_image` and standard-Borel spaces.
Tau Ceti declares or proves `ProbabilityTheory.HasLaw.measure_singleton_le`,
`ProbabilityTheory.HasLaw.exists_measure_atom_le_measure_singleton`,
`AEMeasurable.exists_map_restrict_eq_smul_dirac_of_atom`,
`MeasureTheory.Measure.exists_measurePreserving_of_nullSingleton` and
`TauCeti.mongeCost_eq_top_of_measure_atom`.

**Checks.**

* For `μ = δ₅` and `ν = (δ₀+δ₁)/2` on `ℝ`, a transport map would give
  `1 = μ({5}) ≤ ν({T 5}) ≤ 1/2`, which is impossible: there is no transport map, as Layer 0.2's
  second Check says.
* For `μ = (δ₀+δ₁)/2` and `ν = δ₃`, the constant map `3` is a transport map and
  `ν({3}) = 1 ≥ 1/2 = μ({0})`: the bound is an inequality, not an equality, since several atoms
  may share an image.
* For `μ` uniform on `[0,1]` and `ν = (δ₀+δ₁)/2`, the map `1_{[1/2,1]}` is a transport map: a
  nonatomic source reaches a target with atoms.

### 4.3 Density of graph couplings and Pratelli's theorem

Let `X,Y` be Polish, `μ ∈ P(X)` nonatomic, and `ν ∈ P(Y)`.  Prove that the
graph couplings `{(id,T)_{#}μ | T : X → Y Borel, T_{#}μ=ν}` are narrowly dense
in `Π(μ,ν)`; for Polish metric `X`, `Y` and a source law with null singletons this is Tau
Ceti's `TauCeti.Coupling.dense_graphPlans`.  Hence Monge and Kantorovich values agree for
bounded continuous real costs, while the Monge infimum need not be attained.  Then formalize
[Pratelli Theorem B](https://www.numdam.org/item/AIHPB_2007__43_1_1_0/): for
continuous `c : X×Y → [0,∞]`, possibly unbounded or infinite-valued,
the Monge infimum equals the Kantorovich minimum, possibly `∞`, under the same
nonatomic-source hypothesis; this is Tau Ceti's
`TauCeti.mongeCost_eq_transportCost_of_continuous`.  For finite equal-mass measures, normalize
and handle zero mass separately.  For the continuous cost `d(x,y)^p`, `0 < p < ∞`, it gives
`W_p(μ,ν)^p` as the Monge infimum from a finite source with null singletons on a second-countable
standard Borel pseudo-extended-metric space, finite or not
(`TauCeti.wassersteinEDist_rpow_eq_mongeCost`).

*Needs:* items 1--2; Layer 1.2; Pratelli Theorem B; Tau Ceti `TauCeti.Coupling.dense_graphPlans`
and `TauCeti.mongeCost_eq_transportCost_of_continuous`.
Tau Ceti declares or proves `TauCeti.wassersteinEDist_rpow_eq_mongeCost`.

### 4.4 Convergence of graph plans

For Polish `X,Y`, fixed `μ ∈ P(X)`, Borel maps `T_n,T : X → Y`, and graph plans
`(ι,T_n)_{#}μ`, prove the AGS graph-plan theorem: narrow convergence to
`(ι,T)_{#}μ` is equivalent to
`MeasureTheory.TendstoInMeasure μ atTop T_n T`.  This equivalence is Tau Ceti's
`TauCeti.tendsto_map_prodMk_self_iff_tendstoInMeasure`, for a weakly regular source law on a
space with measurable opens, a second-countable pseudo-extended-metric target with measurable
opens, a product with `HasOuterApproxClosed`, and almost everywhere measurable maps; Polish `X`,
`Y` satisfy these hypotheses.  Under this convergence, prove `Lᵖ`
convergence for `1 ≤ p < ∞` exactly when `{d_Y(T_n(·),ȳ)ᵖ}` satisfies Mathlib's
`MeasureTheory.UniformIntegrable` predicate for one (hence every) basepoint `ȳ`.
Consume the existing convergence-in-measure and uniform-integrability lemmas.
A varying-source theorem must first choose comparison couplings or identifications;
do not define convergence in a moving source measure or recover pointwise convergence
from narrow convergence alone.

*Needs:* Layer 1.2; Mathlib `MeasureTheory.TendstoInMeasure` and
`MeasureTheory.UniformIntegrable`; Tau Ceti `TauCeti.tendsto_map_prodMk_self_iff_tendstoInMeasure`.

### 4.5 The abstract twist theorem

Prove the reusable **abstract twist theorem**.  Starting from a dual contact set, a
potential differentiable `μ`-a.e., source differentiability of `c`, and injectivity of
`y ↦ Dₓc(x,y)`, show that each contact fiber is a singleton almost everywhere and that
an optimizer concentrated on contact has singleton conditional fibers there.  Formulate
local semiconcavity or superdifferentiability assumptions separately from twist.  The
mechanism is the first-order condition `∇φ(x) = Dₓc(x,y)` at a contact point `(x,y)` where the
potential `φ` of the dual constraint `φ x + ψ y ≤ c(x,y)` of Layer 2.2 is differentiable:
`x' ↦ c(x',y) - φ(x')` is minimal at `x`.  On `ℝ` with `c(x,y) = (x-y)²/2`, `φ(x) = -x` and
`ψ(y) = y - 1/2`, the slack `c - φ - ψ = (x-y+1)²/2` vanishes exactly on `y = x+1`, where
`∇φ = -1 = Dₓc(x,x+1)`.  (De Philippis--Figalli, *The Monge--Ampère equation and its link to
optimal transportation*, twist condition (C1), p. 29, and Theorem 3.6 with Step 4 of its
proof sketch, pp. 30--32, proved there for bounded `C⁴` costs on open subsets of `ℝⁿ` and an
absolutely continuous source; Step 4 writes the condition as `∇u(x) + ∇ₓc(x,y) = 0` for the
`c`-convex `u = -φ`.  Villani 2009, Chapter 10, for the general statement.)  Tau Ceti proves
the theorem in this form for a real cost on `E × Y` with `E` a real normed space:
`TauCeti.hasFDerivAt_eq_of_mem_contactSet` is the first-order condition at a contact point where
the dual constraint holds near `x`, the potential is finite near `x`, and both the potential
and the section `c(·,y)` are differentiable at `x`;
`TauCeti.ae_subsingleton_setOf_mem_contactSet` gives subsingleton contact fibers `μ`-a.e. for an
everywhere dual-feasible pair whose first potential is finite near and differentiable at
`μ`-a.e. point, with `c(·,y)` differentiable at contact partners and `y ↦ Dₓc(x,y)` injective
among differentiable sections at `μ`-a.e. `x`; and
`TauCeti.IsDualCertificate.ae_exists_condKernel_eq_dirac` gives, under the same differentiability
and twist hypotheses, Dirac conditional laws at contact partners for every finite optimal
coupling, for a nonnegative cost almost everywhere measurable along it, real potentials
certifying optimality of some plan, and a nonempty standard Borel target.

*Needs:* Layers 2.2 and 2.8; Mathlib Fréchet derivatives; Tau Ceti
`TauCeti.hasFDerivAt_eq_of_mem_contactSet`, `TauCeti.ae_subsingleton_setOf_mem_contactSet` and
`TauCeti.IsDualCertificate.ae_exists_condKernel_eq_dirac`.

### 4.6 Measurable selection of optimal maps

Build measurable-selection lemmas that turn the pointwise singleton formula into a
measurable/a.e.-measurable map.  Then prove that the optimizer is induced by that map
and that the map is unique `μ`-a.e.  The formula involving an inverse derivative is a
theorem, not a noncomputable definition with hidden existence.  For a nonnegative measurable
real cost on `E × Y`, `E` a real normed space, a finite source `μ` and a nonempty standard Borel
target, this is Tau Ceti's `TauCeti.IsDualCertificate.exists_optimal_transportMap_unique_ae`: a
plan certified by real potentials, with the first potential differentiable `μ`-a.e., the cost
sections differentiable at contact partners and the twist condition of item 5, is the graph plan
of a measurable Kantorovich-optimal map `T`, with `(x,T x)` in the contact set and
`∇φ(x) = Dₓc(x,T x)` for `μ`-a.e. `x`, and every Kantorovich-optimal map agrees with `T`
`μ`-a.e.

*Needs:* item 5; Layers 0.3 and 2.2 (the analytic-set and completion bridge); Tau Ceti
`TauCeti.IsDualCertificate.exists_optimal_transportMap_unique_ae`.
Tau Ceti declares or proves `TauCeti.IsCoupling.exists_graphPlan_of_ae_exists_condKernel_eq_dirac`.

### Examples

An atomic source/non-atomic target demonstrates infeasibility; a
nonatomic source realizes a prescribed finite law by a partition; deterministic plans
approximate a non-graph coupling; and a twist-cost finite example recovers a unique map
from complementary slackness.

### Dependencies

Layers 0--3; Mathlib `ProbabilityTheory.HasLaw`, `MeasureTheory.NullSingletonClass`, `MeasureTheory.TendstoInMeasure`, and `MeasureTheory.UniformIntegrable`.

## Layer 5: convex analysis, Brenier, and polar factorization

The Euclidean quadratic theorem rests on a reusable convex-analysis tower.  Build that
tower rather than hiding it inside the final proof.

### 5.1 Convex duality on dual pairs

On a separated real dual pair `(E,F,⟪·,·⟫)`, build proper `EReal`-valued convex
functions, Legendre--Fenchel conjugates, Fenchel--Young, subgradients,
conjugate-subgradient reciprocity, and the algebraic Rockafellar theorem for cyclically
monotone sets.  Under compatible Hausdorff locally convex topologies, prove the
lower-semicontinuous Fenchel--Moreau theorem.  Tau Ceti's
`TauCeti.fenchelConjugate_flip_fenchelConjugate_eq_iff` is that theorem with its converse: on a
locally convex real topological vector space `E` and for a pairing that represents every
continuous linear functional on `E` and is continuous in its first variable, `f : E → [-∞,∞]`
equals its biconjugate exactly when its real epigraph is convex, it is lower semicontinuous, and
it either never takes the value `-∞` or is identically `-∞`.  Consume Mathlib's `SeparatingDual` and
`LocallyConvexSpace` vocabulary where applicable, and state the general-purpose additions
at the generality that vocabulary supports.

*Needs:* Mathlib `SeparatingDual`, `LocallyConvexSpace` and `EReal`; Tau Ceti
`TauCeti.fenchelConjugate` and `TauCeti.fenchelConjugate_flip_fenchelConjugate_eq_iff`.

**Checks.**

* For `f(x) = x²/2` on `ℝ`, `f*(y) = y²/2`.
* For `f = 0` on `[-1,1]` and `+∞` elsewhere, `f*(y) = |y|`; for `f(x) = |x|`, `∂f(0) = [-1,1]`
  and Fenchel--Young holds with equality at `(0, 1/2)`: `f(0) + f*(1/2) = 0 = ⟨0, 1/2⟩`.
* The constant `+∞` is not proper and has conjugate `-∞`; properness excludes it.

### 5.2 Finite-dimensional convex analysis

Specialize the dual-pair tower to finite-dimensional real spaces: build epigraphs and
effective domains; consume Mathlib's `affineSpan` and `intrinsicInterior` API for
relative interiors, adding only the convex-analysis bridge lemmas it lacks; and prove
the finite-dimensional coercivity and attainment consequences.  Bridge the proper
extended-valued convex API
to Mathlib's real-valued API: on the interior of the effective domain, define the real
representative, prove coercion
agreement and `ConvexOn ℝ`, and handle the boundary/null-set statement needed by the
intended source measure.  Then consume `ConvexOn.locallyLipschitzOn_interior`,
`LocallyLipschitzOn.exists_lipschitzOnWith_of_compact`, and
`LipschitzOnWith.ae_differentiableWithinAt` to obtain Rademacher differentiability via
a countable compact exhaustion.  Build an intrinsic-interior variant only where
lower-dimensional domains are genuinely claimed.  Three of these steps are Tau Ceti
declarations.  `TauCeti.convexOn_toReal` is the bridge: for `f` with values in `[-∞,∞]`, convex
real epigraph and no value `-∞`, the real representative `x ↦ (f x).toReal` is `ConvexOn ℝ` on
the effective domain `{f ≠ ∞}`.  `ConvexOn.ae_differentiableAt_of_mem_interior` is the Rademacher
step: a real convex function on a set of a finite-dimensional real normed space is
differentiable at almost every interior point of the set, for every additive Haar measure.
Alexandrov's twice-differentiability theorem is `ConvexOn.ae_existsUnique_isPositive_isLittleO`:
for `u` convex on a set `Ω` of a finite-dimensional real inner product space and an additive Haar
measure, at almost every `x ∈ Ω` the function is differentiable and has the expansion
`u(x') = u(x) + ⟨∇u(x), x'-x⟩ + ⟨A(x'-x), x'-x⟩/2 + o(‖x'-x‖²)` with a positive operator `A`,
the only positive operator giving it.  Positivity of the distributional Hessian remains a target
here, for both maps and Monge--Ampère regularity.

*Needs:* item 1; Mathlib `affineSpan`, `intrinsicInterior`,
`ConvexOn.locallyLipschitzOn_interior`, `LocallyLipschitzOn.exists_lipschitzOnWith_of_compact` and
`LipschitzOnWith.ae_differentiableWithinAt`; Tau Ceti `TauCeti.convexOn_toReal`,
`ConvexOn.ae_differentiableAt_of_mem_interior` and `ConvexOn.ae_existsUnique_isPositive_isLittleO`.

**Checks.**

* For `f(x) = -log x` on `(0,∞)` and `+∞` elsewhere, the effective domain is `(0,∞)` and the real
  representative `-log x` is `ConvexOn ℝ`.
* For the indicator of `[0,1]` (`0` there, `+∞` elsewhere), the real representative on the
  interior `(0,1)` is `0`.
* The segment `{(t,0) | t ∈ [0,1]}` in `ℝ²` has empty interior and intrinsic interior the open
  segment, which is why lower-dimensional domains need the intrinsic variant.

### 5.3 Positive-definite matrices and Gaussian laws

Consume `ProbabilityTheory.multivariateGaussian`, `Matrix.PosDef`/`Matrix.PosSemidef`,
and Mathlib's continuous-functional-calculus square-root API.  Build the
positive-definite matrix square-root, inverse/geometric-mean identities, and Gaussian
covariance-pushforward lemmas used by the Brenier map, the closed `W₂` formula (the Bures
formula `TauCeti.wassersteinEDist_two_multivariateGaussian`, from a nondegenerate Gaussian law to
any Gaussian law), interpolation, and barycenters.

*Needs:* Mathlib `ProbabilityTheory.multivariateGaussian`, `Matrix.PosDef`, `Matrix.PosSemidef`
and `CFC.sqrt`; Tau Ceti `TauCeti.wassersteinEDist_two_multivariateGaussian`.

**Checks.**

* The positive square root of `diag(4,9)` is `diag(2,3)`.
* In dimension one, `W₂(N(0,1),N(0,4))² = 1 + 4 - 2·(1·4)^(1/2) = 1`, which is `(σ₁ - σ₂)²` for
  `σ₁ = 1`, `σ₂ = 2`.
* `W₂(N(m,S),N(m',S))² = ‖m - m'‖²`: equal covariances contribute nothing.

### 5.4 Rockafellar's theorem and the quadratic cost

Consume item 1's Rockafellar theorem and connect ordinary cyclic monotonicity to
`c`-cyclical monotonicity for `c(x,y)=‖x-y‖²/2`.

*Needs:* item 1; Layer 2.7.
Implemented in Tau Ceti by
`TauCeti.IsCyclicallyMonotone.exists_fenchelConjugate_subset_subdifferential`,
`TauCeti.IsCyclicallyMonotone.exists_fenchelConjugate_innerₗ_subset_subdifferential`,
`TauCeti.cSuperdifferential_norm_sub_sq_div_two` and
`TauCeti.isCyclicallyMonotone_norm_sub_sq_div_two_iff`.

### 5.5 Brenier's theorem

Prove **Brenier's theorem** in its strong standard form (Brenier 1991; Villani 2003,
Theorem 2.12): for probability laws `μ,ν` on a finite-dimensional real inner product space at
finite cost for `‖x-y‖²/2`--in particular for `μ,ν ∈ P₂(ℝⁿ)`--with `μ` absolutely continuous with
respect to Lebesgue (additive Haar) measure, the quadratic problem has a unique optimal plan,
induced by `∇u` for a proper lower-semicontinuous extended-valued convex `u`; this is Tau Ceti's
`TauCeti.exists_isKantorovichOptimalTransportMap_gradient`.  Prove that `u` is finite and
differentiable `μ`-a.e.; the total transport map is an a.e. representative selected
from its gradient/subgradient, not a globally defined gradient at every point.  The
target need not be absolutely continuous.

*Needs:* items 1--4; Layer 2.7; Tau Ceti
`TauCeti.exists_isKantorovichOptimalTransportMap_gradient`.

### 5.6 Converse optimality and uniqueness of potentials

Prove converse optimality for gradients of convex functions, a.e. uniqueness of the
map, the inverse relation through `∇u*` when the target is also absolutely continuous,
and the following potential-uniqueness tier.  If `Ω⊆ℝⁿ` is connected and open,
`μ(Ω)=1`, and `μ|_Ω` is equivalent to Lebesgue measure on `Ω`, then two convex
potentials finite on `Ω` that induce the same map `μ`-a.e. differ by one constant on
`Ω`.  Prove the relative-interior analogue in `affineSpan(Ω)` using affine Lebesgue
measure; make no global constant claim across disconnected source components.

*Needs:* items 2 and 5; Mathlib `affineSpan`.

### 5.7 Regular sources and sources null on Lipschitz hypersurfaces

Let `n ≥ 1`.  Call `E ⊆ ℝⁿ` a `c - c` hypersurface when, in some orthonormal system of
coordinates, it is the graph `{(y,t) | y ∈ ℝⁿ⁻¹, t = f(y) - g(y)}` of the difference of two real
convex functions on `ℝⁿ⁻¹` (Ambrosio--Gigli, *A user's guide to optimal transport*,
Definition 1.23, p. 15), and call a probability measure on `ℝⁿ` regular when it gives mass `0`
to every `c - c` hypersurface (their Definition 1.25, p. 16).  Prove the structure theorem for
convex functions: a set `A ⊆ ℝⁿ` lies in the set of non-differentiability points of some real
convex function on `ℝⁿ` exactly when countably many `c - c` hypersurfaces cover it (their
Theorem 1.24, p. 16, which they state without proof; it is a target of this subsection).

Prove the sharp quadratic source theorem (their Theorem 1.26, p. 16): for `μ ∈ P₂(ℝⁿ)` the
following are equivalent.

* For every `ν ∈ P₂(ℝⁿ)` the optimal plan from `μ` to `ν` for `‖x - y‖²/2` is unique and is
  induced by a map.
* `μ` is regular.

In that case the map is the gradient of a convex function, as in item 5.  Derive two
corollaries: a `μ` with `μ(E) = 0` for every Borel `E` covered by countably many
`(n-1)`-dimensional Lipschitz graphs is regular, because convex functions are locally Lipschitz;
and so is every `μ` absolutely continuous with respect to Lebesgue measure, which is the public
entry point of item 5.

*Needs:* items 2 and 5; Layer 2.7; Mathlib `ConvexOn`, Lipschitz maps and Hausdorff measure.

**Checks.**

* On `ℝ` a `c - c` hypersurface is a point, so the regular measures are the atomless ones;
  `δ₀` is not regular, and no map pushes `δ₀` to `(δ₋₁ + δ₁)/2`, as the equivalence requires.
* On `ℝ²` the uniform law `μ` on the segment `{0} × [0,1]` charges a line, the graph of
  `f - g = 0`, so it is not regular.  For `ν` the average of the uniform laws on `{-1} × [0,1]`
  and `{1} × [0,1]`, every plan costs at least `∫ (x₁ - y₁)²/2 dπ = 1/2`, with equality only when
  `y₂ = x₂` almost surely; a map with this property sends `(0,s)` to `(σ(s), s)` with
  `σ = ±1`, and then the law of `s` on `{σ = 1}` would have density `1/2`, not an indicator.  So
  no optimal plan is induced by a map.
* The uniform law on the unit disc of `ℝ²` is absolutely continuous, hence regular, and its
  optimal map to any `ν ∈ P₂(ℝ²)` is a gradient; a definition of regularity that asked for
  mass `0` on Lipschitz hypersurfaces only would be the sufficient condition of the first
  corollary, not the equivalence.

### 5.8 Strictly convex costs

Prove the Gangbo--McCann extension for `c(x,y)=h(x-y)`.  Take continuous
`h : ℝᵈ → [0,∞)` satisfying their (H1) strict convexity, (H3) superlinear growth
`h(x)/‖x‖ → ∞`, and the exact (H2) level-set condition at infinity: for every
height `r < ∞` and aperture `θ ∈ (0,π)`, every sufficiently distant vertex `p`
admits `z ≠ 0` such that `h(x) ≤ h(p)` throughout the truncated cone
`{x | ‖x-p‖·‖z‖ cos(θ/2) ≤ ⟨z,x-p⟩ ≤ r‖z‖}`.  For Borel probability laws
with `μ ≪ Leb`, construct a `c`-concave `φ`, the map
`T(x)=x-∇(h*)(∇φ(x))`, and its graph/cyclical optimality.  When the optimal
value is finite, prove a.e. uniqueness of both this map and the optimal coupling
(Gangbo--McCann, Theorem 1.2); in that finite-value case, existence of a
Kantorovich-optimal map whose graph plan is the only optimal coupling is
`exists_isKantorovichOptimalTransportMap_of_strictConvexOn`.  Make no uniqueness
assertion in the all-`∞` case.  Identify `∇(h*)`
with `(∇h)⁻¹` only under the differentiability hypotheses that make this formula
valid.  State the countably `(d-1)`-rectifiable-null source extension separately,
retaining (H1)--(H3) and requiring exactly `h ∈ C¹,¹_loc(ℝᵈ)` as in the cited
theorem.

*Needs:* items 1--2; Layers 2.8 and 4.5--4.6.
Tau Ceti declares or proves `TauCeti.subsingleton_setOf_mem_contactSet_of_strictConvexOn` and
`TauCeti.IsDualCertificate.eq_of_isOptimalCoupling_of_strictConvexOn`.

### 5.9 Polar factorization

The quadratic tier is Tau Ceti's `TauCeti.exists_hasLaw_and_ae_eq_gradient_comp`: on a
probability space `(α,m)`, a map `U` into a finite-dimensional real inner product space whose law
and a target law `P` are both absolutely continuous, at finite quadratic cost between them,
factors as `U = ∇u ∘ s` `m`-a.e. with `u` convex and `s = ∇u* ∘ U` of law `P` (Brenier 1991,
Theorem 1.2).  Formalize Brenier's original polar factorization for `1 ≤ p < ∞`.  First, for
an open `Ω ⊂ ℝᵈ` and a probability `P` on `Ω` with a density bounded away from zero on every
compact subset of `Ω` (so that every element of `Lᵖ(Ω,P)` is locally Lebesgue integrable), define
the weighted space `W¹,p(Ω,P)` of `v ∈ Lᵖ(Ω,P)` having a weak gradient `∇v ∈ Lᵖ(Ω,P;ℝᵈ)` in
the sense of Tau Ceti's `TauCeti.HasWeakFDerivOn` against Lebesgue measure on `Ω`, its norm
`(∫Ω (|v|^p+‖∇v‖^p) dP)^(1/p)`, and its completeness; for normalized Lebesgue `P` on a bounded
`Ω` it is Tau Ceti's `TauCeti.W1p` with an equivalent norm.  Express the required
compact inclusion concretely: every sequence bounded in this norm has an
`Lᵖ(Ω,P)`-convergent subsequence.  Let `(X,μ)` be a
probability space isomorphic modulo null sets to the nonatomic unit interval.  Let
`Ω ⊂ ℝᵈ` be bounded, connected, and open, and let `P` be a Borel probability on
`cl Ω`, with `P(∂Ω)=0` and density `ρ` on `Ω` that is positive and bounded away from
zero on every compact subset of `Ω`; assume that concrete weighted compactness
property.  For `U ∈ Lᵖ(X,μ;ℝᵈ)` satisfying
`μ(U⁻¹(E))=0` for every Lebesgue-null `E`, prove
`U = ∇Ψ ∘ s`, where `∇Ψ` is the unique monotone rearrangement of `U` on `(Ω,P)` and
`s : (X,μ) → (Ω,P)` is the unique measure-preserving maximizer in Brenier's theorem.
Distinguish the two uniqueness statements, and state the continuity theorem rather than
deferring to "the sourced topologies".  Under the weighted compactness assumption
already imposed here, and following Brenier's Theorem 1.2(c), prove that the
rearrangement `U ↦ ∇Ψ` is continuous from `Lᵖ(X,μ;ℝᵈ)` to `Lᵖ(Ω,P;ℝᵈ)` with no
nondegeneracy hypothesis, and that on the nondegenerate set carrying the relative `Lᵖ`
topology--where `s` is the unique factor--the pair `U ↦ (∇Ψ,s)` is continuous into
`Lᵖ(Ω,P;ℝᵈ) × L^q(X,μ;ℝᵈ)` for every finite `1 ≤ q < ∞`.  Give the smooth bounded `Ω`
with normalized Lebesgue `P`
specialization, where the compact-embedding hypothesis follows by bridging PDE §1.6
(A6)'s Rellich--Kondrachov theorem to the weighted definition.

*Needs:* item 5; PDE §1.6 (A6); Tau Ceti `TauCeti.HasWeakFDerivOn`, `TauCeti.W1p` and
`TauCeti.exists_hasLaw_and_ae_eq_gradient_comp`.

**Checks.**

* For `P` uniform on `Ω = (0,1)` and `v(x) = x`, the norm is `(1/(p+1) + 1)^(1/p)`; omitting the
  gradient term would give `(1/(p+1))^(1/p)`.
* The indicator `1_{(1/2,1)}` on `(0,1)` is not in the space: its distributional derivative is the
  point mass at `1/2`, not a function.  A definition through the almost-everywhere classical
  derivative, which is `0`, would admit it with norm `2^(-1/p)` for uniform `P`.
* For `p = 1`, `P = 2x dx` on `(0,1)` and `v(x) = x^(-1/2)`, `∫|v| dP = 4/3` and
  `∫|v'| dP = ∫₀¹ x^(-1/2) dx = 2`, so `v` lies in the weighted space with norm `10/3`, although
  `∫₀¹ |v'| dx = ∞`: the weighted space is not the Lebesgue one.
* For `P` normalized Lebesgue measure on a bounded `Ω`, the norm is `|Ω|^(-1/p)` times the
  unweighted norm `(∫Ω (|v|^p+‖∇v‖^p) dx)^(1/p)`.

The main primary source is Brenier's [polar factorization
paper](https://doi.org/10.1002/cpa.3160440402); the strictly convex difference-cost route
follows Gangbo--McCann's [geometry of optimal
transportation](https://www.math.toronto.edu/mccann/assignments/477/GangboMcCann96.pdf).

### Examples

Monotone rearrangement on `ℝ` agrees with the gradient of a convex
potential; the Brenier map between nondegenerate Gaussians has the standard positive
matrix formula; conjugate potentials give inverse maps; and the graph plan of `∇u`
saturates the quadratic dual constraint.

### Dependencies

Layers 0--4; Mathlib convexity, `SeparatingDual`, `LocallyConvexSpace`, `intrinsicInterior`, `LipschitzOnWith.ae_differentiableWithinAt`, `ProbabilityTheory.multivariateGaussian`, and the matrix continuous functional calculus; Tau Ceti's `TauCeti.HasWeakFDerivOn` and `TauCeti.W1p` and PDE §1.6 (A6) for item 9.

## Layer 6: Monge--Ampère measures, equations, and regularity

This is a full regularity layer, not a one-line determinant corollary of Brenier.

### 6A. Aleksandrov weak theory

### 6.1 The Aleksandrov Monge--Ampère measure

For an open convex `Ω ⊆ ℝⁿ` and finite convex `u : Ω → ℝ`, define the
subgradient image and Aleksandrov measure `MA_u(E)=Lebesgue(∂u(E))`.  Prove that this
is a locally finite Borel measure.  For `u ∈ C²(Ω)`, prove
`MA_u = det(D²u) dx`.  Tau Ceti's `TauCeti.mongeAmpereMeasure μ f` is this measure for a
function `f` with values in `[-∞,∞]`, convex real epigraph and no value `-∞`, weighted by a
measure `μ` absolutely continuous with respect to an additive Haar measure; a convex `u` on an
open `Ω` enters as its extension by `∞` off `Ω`.
`TauCeti.isLocallyFiniteMeasure_comap_mongeAmpereMeasure` is local finiteness on the interior of
the effective domain when `μ` is finite on compact sets,
`TauCeti.mongeAmpereMeasure_ite_eq_withDensity_det` is `MA_u = det(D²u) dx` on an open `Ω` for a
convex `u` that is differentiable with differentiable gradient on `Ω`, in particular for
`u ∈ C²(Ω)`, and `TauCeti.mongeAmpereMeasure_mul_norm_sub` is the cone: for `r ≥ 0` the measure
of `x ↦ r‖x-a‖` is `μ(B̄(0,r)) δ_a`.

*Needs:* Layer 5.2; Mathlib Lebesgue measure and Hessians; Tau Ceti `TauCeti.mongeAmpereMeasure`,
`TauCeti.isLocallyFiniteMeasure_comap_mongeAmpereMeasure`,
`TauCeti.mongeAmpereMeasure_ite_eq_withDensity_det` and `TauCeti.mongeAmpereMeasure_mul_norm_sub`.

**Checks.**

* For `u(x) = ‖x‖²/2` on `ℝⁿ`, `∂u(E) = E`, so `MA_u` is Lebesgue measure, matching `det D²u = 1`.
* For `u(x) = ‖x‖` on `ℝ²`, `∂u(0)` is the closed unit disc and `MA_u = π δ₀`, while `det D²u = 0`
  away from the origin.
* For an affine `u`, every subgradient image is a single point and `MA_u = 0`; for `u(x) = |x|` on
  `ℝ`, `MA_u = 2δ₀`.

### 6.2 Singular mass, convergence, and maximum principles

Build examples with singular Monge--Ampère mass.  Under locally uniform convergence
of convex functions on an open domain, prove convergence of the locally finite
Aleksandrov measures against compactly supported continuous tests (equivalently, on
relatively compact continuity sets); upgrade this to narrow convergence only with
finite total mass and tightness.  Prove the comparison principle, the Aleksandrov
maximum principle, and Alexandrov's twice-differentiability theorem.  Tau Ceti proves each of
these on a finite-dimensional real inner product space, for functions convex on an open `Ω` and
extended by `∞` off it.

* *Singular mass.*  `TauCeti.mongeAmpereMeasure_mul_norm_sub_ne_withDensity_det`: in positive
  dimension and for `r > 0`, the cone `x ↦ r‖x-a‖` has Hessian determinant `0` off its vertex
  and its Aleksandrov measure is not `det(D²u) dx`.
* *Convergence.*  For `F_k → u` locally uniformly on `Ω` with `F_k` eventually convex on `Ω`, and
  a weight absolutely continuous with respect to an additive Haar measure:
  `TauCeti.mongeAmpereMeasure_le_liminf` is `MA_u(U) ≤ liminf MA_{F_k}(U)` for open `U ⊆ Ω`;
  for an outer regular weight, `TauCeti.limsup_mongeAmpereMeasure_le` is
  `limsup MA_{F_k}(K) ≤ MA_u(K)` for compact `K ⊆ Ω`, and `TauCeti.tendsto_mongeAmpereMeasure`
  is `MA_{F_k}(s) → MA_u(s)` for bounded `s` with closure in `Ω` and `MA_u`-null frontier.
* *Comparison.*  For bounded open `Ω` in dimension at least one, and `u`, `v` convex on `Ω` and
  continuous on its closure: `TauCeti.le_of_mongeAmpereMeasure_le_of_le_frontier` is `v ≤ u` on
  `Ω` from `MA_u ≤ MA_v` and `v ≤ u` on `∂Ω`, and
  `TauCeti.eqOn_of_mongeAmpereMeasure_eq_of_eqOn_frontier` is the uniqueness it implies for the
  Dirichlet problem of item 4.  `TauCeti.mongeAmpereMeasure_le_of_le_of_le_frontier` is the mass
  comparison behind both: `u ≤ v` on `Ω` and `v ≤ u` on `∂Ω` give `MA_v(Ω) ≤ MA_u(Ω)`, in every
  finite dimension and for every weight absolutely continuous with respect to a Haar measure.
* *Maximum principle.*  `TauCeti.ofReal_neg_pow_mul_addHaar_ball_le_mul_mongeAmpereMeasure`: for
  bounded open `Ω` of dimension `n ≥ 1`, `u` convex on `Ω`, continuous on its closure and
  nonnegative on `∂Ω`, and every `x₀ ∈ Ω`,
  `max(-u(x₀),0)ⁿ |B₁| ≤ 2^(n+1) diam(Ω)^(n-1) dist(x₀,∂Ω) MA_u(Ω)`.
* *Twice differentiability.*  `ConvexOn.ae_existsUnique_isPositive_isLittleO` of Layer 5.2.

*Needs:* item 1; Mathlib Lebesgue measure and locally uniform convergence; Tau Ceti
`TauCeti.mongeAmpereMeasure_mul_norm_sub_ne_withDensity_det`,
`TauCeti.mongeAmpereMeasure_le_liminf`, `TauCeti.limsup_mongeAmpereMeasure_le`,
`TauCeti.tendsto_mongeAmpereMeasure`, `TauCeti.le_of_mongeAmpereMeasure_le_of_le_frontier`,
`TauCeti.eqOn_of_mongeAmpereMeasure_eq_of_eqOn_frontier`,
`TauCeti.mongeAmpereMeasure_le_of_le_of_le_frontier`,
`TauCeti.ofReal_neg_pow_mul_addHaar_ball_le_mul_mongeAmpereMeasure` and
`ConvexOn.ae_existsUnique_isPositive_isLittleO`.

**Checks.**

* For `u(x) = |x|` on `ℝ` and `F_k(x) = √(x² + 1/k)`, which converge uniformly, `MA_{F_k}` has
  density `F_k″` and `MA_{F_k}([-1,1]) = F_k′(1) - F_k′(-1) = 2/√(1+1/k) → 2 = MA_u([-1,1])`,
  while on the compact set `{0}` the values are `0` and `MA_u({0}) = 2`: the `limsup` inequality
  on compact sets is strict and convergence needs the null frontier.
* For `Ω = (-1,1)` and `u(x) = |x| - 1`, the maximum principle at `x₀ = 0` reads
  `1 · 2 ≤ 2² · 2⁰ · 1 · MA_u(Ω) = 4 · 2`, which holds.
* For `Ω = (-1,1)`, `u(x) = x² - 1` and `v(x) = |x| - 1`, both vanish on `∂Ω` and `u ≤ v` on `Ω`;
  `MA_u = 2 dx` and `MA_v = 2δ₀`, so `MA_v(Ω) = 2 ≤ 4 = MA_u(Ω)`: the lower function has the
  larger total mass.  The two measures are not ordered as measures, so the comparison principle
  draws no conclusion from them, as it must not: `v ≤ u` fails at `x = 1/2`.

### 6.3 Solution concepts and their bridges

Define Aleksandrov, viscosity, a.e./Sobolev, and classical solutions separately, and
name each bridge rather than referring to "the equivalences".  A convex `C²` solution
induces the corresponding Aleksandrov measure.  For continuous `f > 0`, a continuous
convex function is an Aleksandrov solution of `MA_u = f dx` if and only if it is a
convex viscosity solution; strict positivity is used there, so any degenerate `f ≥ 0`
viscosity result is a separate statement.  The a.e. Hessian determines only the
absolutely continuous part, so prove the decomposition
`MA_u = det(D²u) dx + (MA_u)^s` and treat `det D²u = f` a.e. as strictly weaker: it
gives the Aleksandrov identity only after a further theorem rules out `(MA_u)^s`, with
local `C^{1,1}` plus the area formula as one concrete sufficient regime.  Keep the
counterexample that forces this--a convex function satisfying `det D²u = f` almost
everywhere whose Aleksandrov measure still carries singular mass--along with the others
showing why the notions differ outside these regimes.  Tau Ceti states the following of these,
in a finite-dimensional real inner product space.  `TauCeti.IsMongeAmpereViscositySolution Ω u f`
is the viscosity notion, tested against functions that are `C²` at the contact point and convex
near it; convexity of `u` is not part of the predicate and is a hypothesis of each bridge.
`TauCeti.isMongeAmpereViscositySolution_of_mongeAmpereMeasure_eq` is the bridge from Aleksandrov
to viscosity solutions for `u` convex on an open `Ω` in dimension at least one and `f ≥ 0`
continuous on `Ω`; strict positivity of `f` enters only in the converse bridge, which remains a
target.  `TauCeti.isMongeAmpereViscositySolution_iff_forall_det_eq` says that a convex `u` of
class `C²` on an open `Ω` is a viscosity solution exactly when `det D²u = f` at every point.
`TauCeti.mongeAmpereMeasure_eq_singularPart_add_withDensity` is the decomposition
`MA_u = (MA_u)^s + det(H) dx` on the interior of the effective domain, where `H(x)` is, at almost
every `x`, a first-order expansion of the subdifferential at `x`, and
`TauCeti.ae_eq_indicator_ofReal_det_of_mongeAmpereMeasure_eq_withDensity` is its consequence
that an Aleksandrov solution of `MA_u = g dx` satisfies `det H = g` almost everywhere.

*Needs:* items 1--2; Mathlib second derivatives and Lebesgue decomposition; Tau Ceti
`TauCeti.IsMongeAmpereViscositySolution`,
`TauCeti.isMongeAmpereViscositySolution_of_mongeAmpereMeasure_eq`,
`TauCeti.isMongeAmpereViscositySolution_iff_forall_det_eq`,
`TauCeti.mongeAmpereMeasure_eq_singularPart_add_withDensity` and
`TauCeti.ae_eq_indicator_ofReal_det_of_mongeAmpereMeasure_eq_withDensity`.

**Checks.**

* `u(x) = ‖x‖²/2` is a classical, Aleksandrov and viscosity solution of `det D²u = 1`.
* `u(x) = ‖x‖` on `ℝ²` solves `det D²u = 0` almost everywhere but is not an Aleksandrov solution
  of `MA_u = 0`, since `MA_u = π δ₀`.
* `u(x) = ‖x‖²/2 + ‖x‖` on `ℝ²` has Hessian eigenvalues `1` and `1 + 1/‖x‖` away from `0`, so
  `det D²u = 1 + 1/‖x‖` almost everywhere, while `MA_u` has the singular part `π δ₀`: an a.e.
  solution whose Aleksandrov measure carries singular mass.

### 6.4 The convex Dirichlet problem

Prove the convex Dirichlet problem in its standard strictly convex form: for `Ω ⊆ ℝⁿ`
bounded and strictly convex, a finite Borel measure `μ` on `Ω`, and `g ∈ C(∂Ω)`, there
is a unique convex `u ∈ C(cl Ω)` with `MA_u = μ` and `u = g` on `∂Ω` (Hartenstine 2006,
Theorem 2.1, p. 2, quoting Gutiérrez, *The Monge--Ampère Equation*, Theorem 1.6.2).  Strict
convexity is exactly what admits arbitrary continuous boundary data; on a merely bounded convex
`Ω` the problem is solvable, and then uniquely, exactly when `g` extends to a function in
`C(cl Ω)` that is convex in `Ω` (Hartenstine 2006, Theorem 1.1, p. 1), a separate theorem with
that extension hypothesis.  The zero-boundary existence theorem on a bounded open convex domain
is De Philippis--Figalli's survey Theorem 2.9 (p. 8).  For stability prove a named theorem
rather than the word: in the zero-boundary formulation, Hausdorff convergence of bounded convex
domains together with a uniform mass bound and weak-* convergence of the right-hand sides gives
uniform convergence of the solutions (survey Theorem 2.8, p. 8).  A fixed-domain, varying-boundary-data version carries its own measure
topology and the hypotheses that preserve the boundary trace.

*Needs:* items 1--2; Hartenstine 2006 Theorems 1.1 and 2.1; De Philippis--Figalli survey Theorems
2.8--2.9.

### 6B. The transport equation

### 6.5 The weighted transport measure

For source and target densities `f` and `g`, define the weighted weak measure
`MA_{u,g}(E)=∫_{∂u(E)} g(y)dy`.  Under essential injectivity and target-coverage
hypotheses, prove `MA_{u,g}=f dx` for the Brenier potential before dividing by
`g(∇u)`.  On a finite-dimensional real inner product space this is Tau Ceti's
`TauCeti.mongeAmpereMeasure_eq_of_hasLaw`: for a convex `u` with values in `(-∞,∞]`, a target
law absolutely continuous with respect to an additive Haar measure, and a map pushing the source
to the target, carried by the interior of the domain of `u` and selecting subgradients
`μ`-a.e., the weighted measure `TauCeti.mongeAmpereMeasure ν u` is the source; absolute
continuity of the target supplies the essential injectivity.  The Brenier case, for absolutely
continuous source and target at finite quadratic cost, is
`TauCeti.exists_isKantorovichOptimalTransportMap_gradient_and_mongeAmpereMeasure_eq`, which also
gives target coverage: `ν`-a.e. point is a subgradient at an interior point of the domain.

*Needs:* item 1; Layer 5.5; Tau Ceti `TauCeti.mongeAmpereMeasure_eq_of_hasLaw` and
`TauCeti.exists_isKantorovichOptimalTransportMap_gradient_and_mongeAmpereMeasure_eq`.

**Checks.**

* With `g ≡ 1` the weighted measure `MA_{u,g}` is `MA_u`.
* For `u(x) = x²` on `[0,1]` and `g = 1/2` on `[0,2]`, `∂u(E) = 2E` and `MA_{u,g}(E) = |E|`, the
  uniform source density, consistent with the Brenier map `T(x) = 2x`.
* For `u(x) = |x|` and `g ≡ 1` on `[-1,1]`, `MA_{u,g}({0}) = 2`: a corner carries an atom that no
  absolutely continuous source has.

### 6.6 The Jacobian equation

First build the Euclidean approximate-differentiability and approximate-Jacobian API,
and extend GeometricMeasureTheory G2's area formula for Lipschitz maps to
a.e.-twice-differentiable gradients of convex functions, covering the set of
approximate differentiability, up to a null set, by countably many pieces on which the
gradient is Lipschitz.  Then derive the a.e. Jacobian equation
`f(x)=g(∇u(x)) det(D²u(x))`.  State the second boundary condition first in its honest
set-valued form, then upgrade it when regularity permits (De Philippis--Figalli, *The
Monge--Ampère equation and its link to optimal transportation*: Theorem 3.1 with the Jacobian
identity (3.3), p. 23, for compactly supported laws with absolutely continuous source;
Theorem 3.2, p. 24, for Aleksandrov's almost-everywhere second differentiability; (3.4)--(3.5),
p. 24, for the equation and the boundary condition `∇u(X) = Y`; and Step 1 of the proof of
Theorem 3.3, p. 26, for the area-formula step).

*Needs:* item 5; Layer 5.2; GeometricMeasureTheory G2.

### 6.7 Brenier and Aleksandrov solutions

Let `X, Y ⊆ ℝⁿ` be bounded open sets, let `f` and `g` be probability densities vanishing
outside `X` and `Y` with `λ ≤ f ≤ λ⁻¹` on `X` and `λ ≤ g ≤ λ⁻¹` on `Y` for some `λ > 0`, and let
`u` be the Brenier potential of Layer 5.5, so that `∇u` pushes `f dx` to `g dy`.  Prove, with no
hypothesis on `Y`, the lower bound `MA_u(A) ≥ ∫_A f/g(∇u) dx` for every Borel `A ⊆ X`.  Prove
that if `Y` is convex then `∂u(X) ⊆ closure Y`, equality holds in that bound, and therefore
`λ² Leb ≤ MA_u ≤ λ⁻² Leb` on `X`: the Brenier solution is an Aleksandrov solution of item 3 with
right side `f/g(∇u)` (De Philippis--Figalli, *The Monge--Ampère equation and its link to optimal
transportation*, §3.2, p. 25, and Steps 1--3 of the proof of Theorem 3.3, pp. 26--27).
Convexity of the target is load-bearing: singular subgradient mass not seen by `g` cannot be
discarded in general.  Tau Ceti proves the measure identities:
`TauCeti.mongeAmpereMeasure_eq_withDensity_inv_add` decomposes the Aleksandrov measure of a
convex potential transporting `μ` to `g ρ` by a subgradient selection as
`(g ∘ T)⁻¹ μ` plus the subgradient mass falling in `{g = 0}`, which gives the lower bound;
`TauCeti.mongeAmpereMeasure_eq_withDensity_inv_of_convex` removes that mass when every
subgradient at an interior point of the domain lies in the closure of a convex set on which `g`
is a.e. positive; and
`TauCeti.exists_isKantorovichOptimalTransportMap_gradient_and_mongeAmpereMeasure_eq_withDensity`
chooses, for a closed convex set carrying `ν` on which `g` is a.e. positive, a Brenier potential
all of whose subgradients lie in that set and which is an Aleksandrov solution.  This roadmap's
own clause is the inclusion `∂u(X) ⊆ closure Y` for every Brenier potential `u` when `Y` is
convex (at a differentiability point `∇u` lies in `closure Y` a.e. on `X`, and every subgradient
at a point of the open set `X` is a convex combination of limits of such gradients), and with it
equality on Borel subsets of `X`.

*Needs:* items 3, 5 and 6; Layer 5.5; Tau Ceti
`TauCeti.mongeAmpereMeasure_eq_withDensity_inv_add`,
`TauCeti.mongeAmpereMeasure_eq_withDensity_inv_of_convex` and
`TauCeti.exists_isKantorovichOptimalTransportMap_gradient_and_mongeAmpereMeasure_eq_withDensity`.

**Checks.**

* On `ℝ` with `X = Y = (0,1)` and `f = g = 1`, `u(x) = x²/2`, `∂u(E) = E` and `MA_u = Leb`:
  both bounds hold with `λ = 1`.
* For `n = 2`, `X` the unit disc `B₁` and `Y` the two half-discs translated apart by `±e₁`, with
  uniform densities, the Brenier potential is `u(x) = ‖x‖²/2 + |x₁|`.  Then `det D²u = 1` almost
  everywhere, while `∂u(0,x₂) = [-1,1] × {x₂}`, so `MA_u({x₁ = 0} ∩ B₁) = 2·2 = 4` although the
  segment is Lebesgue-null: `u` is a Brenier solution and not an Aleksandrov one, and `Y` is not
  convex (same source, pp. 24--25).
* A statement of the upper bound without convexity of `Y` is refuted by the same example, since
  `λ⁻² Leb({x₁ = 0} ∩ B₁) = 0 < 4`; the lower bound of the first assertion still holds there.

The regularity sublayers consume Tau Ceti's weak Sobolev spaces `TauCeti.Wkp` (built on
`TauCeti.HasWeakFDerivOn`) for the `W²,p` statements, the [PDE roadmap](../PDE/README.md)'s
§1.7 (A7) for Hölder spaces, and its §2.4 (B11) for
vanishing mean oscillation (VMO) on `ℝⁿ` with its modulus `η(r)`.  Build here only the
local version on a domain and the quantitative oscillation modulus used in section-local
estimates, with its bridge to §2.4.

### 6C. Quadratic Caffarelli theory

### 6.8 Caffarelli's interior regularity

Define convex sections
`S_u(x,h;p)={y | u(y)<u(x)+⟨p,y-x⟩+h}` for `p ∈ ∂u(x)`, with the gradient
specialization at differentiability points.  Build affine/John normalization,
section nesting, localization and engulfing, volume scaling, and the section-adapted
Vitali covering package before any estimate consumes normalized sections.  Tau Ceti's
`TauCeti.convexSection Ω u x ℓ h` is the section `{y ∈ Ω | u(y) < u(x) + ℓ(y-x) + h}` with slope
a linear functional `ℓ`, and three parts of the package are proved for it, each for `u` convex on
an open `Ω`, a supporting slope at the centre, bounded sections with closure in `Ω`, and constants
depending only on the space and the Haar measure.  The volume estimates are
`TauCeti.exists_ofReal_pow_le_mul_measure_convexSection_mul_mongeAmpereMeasure`,
`hⁿ ≤ C |S| MA_u(S)`, and `TauCeti.exists_mul_measure_convexSection_sq_le_mul_ofReal_pow`,
`λ|S|² ≤ C hⁿ` when `MA_u ≥ λ dx` on `Ω`.  Engulfing is
`TauCeti.exists_convexSection_subset_convexSection`: when `λ dx ≤ MA_u ≤ Λ dx` with `λ > 0` and
`S(x,2h)` is bounded with closure in `Ω`, the section `S(x,h)` lies in the section of height
`(1 + CΛ/λ)h` at each of its points, for every supporting slope there.  The covering lemma is
`TauCeti.exists_countable_pairwiseDisjoint_convexSection_measure_le`, a countable disjoint
subfamily carrying a fixed fraction of the measure of the union.  Then, for
bounded Euclidean source and convex target domains with densities bounded above and
below by positive constants, prove local strict convexity, local `C¹,α`, and local
`W²,1+ε` regularity of the Brenier potential (Caffarelli; De Philippis--Figalli survey,
Theorem 2.14, p. 15, for `C¹,α`, Theorem 2.21, p. 19, for `W²,1+ε`, and Theorem 3.3,
pp. 25--26, for the transport map).  The Hölder continuity of the optimal map on compact subsets of the
source, for bounded open `X` and bounded open convex `Y` with both densities between
`λ` and `λ⁻¹`, is
`exists_holderOnWith_of_isKantorovichOptimalTransportMap_of_convex`.  State estimates on normalized convex
sections compactly contained in the domain, carry `0 < λ ≤ f ≤ Λ`, strict convexity,
section normalization/distance, and quantitative dependence of constants visibly.

*Needs:* items 1--7; Tau Ceti `TauCeti.Wkp`, `TauCeti.convexSection`,
`TauCeti.exists_ofReal_pow_le_mul_measure_convexSection_mul_mongeAmpereMeasure`,
`TauCeti.exists_mul_measure_convexSection_sq_le_mul_ofReal_pow`,
`TauCeti.exists_convexSection_subset_convexSection` and
`TauCeti.exists_countable_pairwiseDisjoint_convexSection_measure_le`; De Philippis--Figalli survey
Theorems 2.14, 2.21 and 3.3.

**Checks.**

* For `u(x) = ‖x‖²/2` and `p = x`, `S_u(x,h;p)` is the open ball of radius `√(2h)` about `x`.
* For `u(x) = |x|` on `ℝ`, `x = 0` and `p ∈ (-1,1)`, `S_u(0,h;p) = (-h/(1+p), h/(1-p))`, which is
  not centred at `0`.
* For an affine `u` every section is the whole space, so the section estimates need strict
  convexity.

### 6.9 Higher interior regularity

Add the sharper section-local tiers for a strictly convex Aleksandrov solution with
`0 < λ ≤ f ≤ Λ`: continuity of `f` gives `W²,p_loc` for every fixed finite `p`
(Caffarelli 1990; De Philippis--Figalli survey, Theorem 2.20 on normalized sections and the
localization to small sections stated after it, p. 18); the same interior `L^p` control of the
second derivatives under a vanishing-mean-oscillation (VMO) type condition on `f`, with its
modulus, is Huang's theorem (Q. Huang, Comm. Pure Appl. Math. 62 (2009), 677--705);
`f ∈ C⁰,α` gives `C²,α` (Caffarelli 1990; De Philippis--Figalli survey, Theorem 2.19 on
normalized sections, p. 18, localized to sections compactly contained in the domain as the
survey explains on p. 19).
State the bootstrap as a theorem instead of "higher interior regularity": for every
integer `k ≥ 0` and every `0 < α < 1`, such a solution with `f ∈ C^{k,α}_loc` lies in
`C^{k+2,α}_loc`.  The `k=0` step carries the normalized-section hypotheses and
estimates; for `k ≥ 1` use the ordinary interior Schauder bootstrap on relatively
compact subdomains, available once the `C^{2,α}` conclusion has made the differentiated
Monge--Ampère equation uniformly elliptic.  Smooth `f` then gives `C^∞`.  Make the
constants depend visibly on the dimension, the quantitative section geometry or
strict-convexity input at the base step, the distance to the boundary, `λ`, `Λ`, and
the relevant `C^{k,α}` norm of `f`.  Do not state any of these from positivity without
the normalized-section and oscillation hypotheses.

*Needs:* item 8; Tau Ceti `TauCeti.Wkp`; PDE §1.7 (A7) and §2.4 (B11); De Philippis--Figalli
survey Theorems 2.19--2.21; Huang 2009 for the VMO tier.

### 6.10 Global regularity

Let `X, Y ⊂ ℝⁿ` be bounded open sets that are smooth and uniformly convex, and let `f` and `g`
be probability densities on `X` and `Y`, bounded away from zero and infinity, with
`f ∈ C^{k,β}(cl X)` and `g ∈ C^{k,β}(cl Y)` for an integer `k ≥ 0` and `0 < β < 1`.  Prove that
the Brenier map `∇u : X → Y` for the cost `‖x-y‖²/2` extends to a diffeomorphism
`cl X → cl Y` of class `C^{k+1,β}` (Caffarelli's boundary regularity; De Philippis--Figalli
survey, Theorem 3.3, third assertion, p. 26).  Build the boundary estimates this consumes
rather than importing a theorem name as an axiom.  Convexity of the target is not removable:
item 7's two-half-disc target, which is not convex, has a Brenier map that jumps across the
diameter although both densities are constant.

*Needs:* items 7--9; De Philippis--Figalli survey Theorem 3.3.

### 6.11 Regression examples

Formalize regression examples: a disconnected or nonconvex target can make a Brenier
map discontinuous despite smooth positive data; density bounds alone do not imply all
`W²,p` estimates; and strict convexity cannot be omitted in higher dimensions.

*Needs:* items 7--9.
Implemented in Tau Ceti by
`TauCeti.exists_isKantorovichOptimalTransportMap_gradient_and_not_continuousOn`.

### 6D. General costs, Ma--Trudinger--Wang (MTW), and partial regularity

### 6.12 Twist, nondegeneracy, and the MTW conditions

For costs with the regularity required by each derivative, define A1 source twist,
A1* target twist, A2 mixed-Hessian nondegeneracy, the `c`-exponential, `c`-segments,
mutual and uniform source/target `c`-convexity, and the weak A3w and strong A3s
Ma--Trudinger--Wang conditions.  Each is a separate predicate with bridge lemmas to the
abstract twist layer; MTW derivative statements carry at least the cited `C⁴` cost
regularity.  The conventions are those of the De Philippis--Figalli survey: A1, A1* and A2 are
its conditions (C1), (C2) and (C3), p. 29, under the `C⁴` bound (C0); the `c`-exponential is
`c-exp_x(p) = y ⇔ p = -Dₓc(x,y)`, (3.11), p. 30; the Ma--Trudinger--Wang tensor is (4.4),
p. 33; and A3w and A3s are `MTW(0)` and `MTW(K)` for some `K > 0` in Definition 4.1, p. 34.

*Needs:* Layers 4.5 and 5.1; Mathlib `ContDiff` and Fréchet derivatives.
Tau Ceti declares or proves `TauCeti.mtwTensor`, `TauCeti.SatisfiesWeakMTW`,
`TauCeti.SatisfiesStrongMTW`, `TauCeti.satisfiesWeakMTW_norm_sub_sq_div_two`,
`TauCeti.satisfiesStrongMTW_norm_sub_sq_div_two_iff`, `TauCeti.cExp`, `TauCeti.IsCConvexSet` and
`TauCeti.IsDualCertificate.ae_eq_cExp`.

**Checks.**

* For `c(x,y) = ‖x-y‖²/2`, `-Dₓc(x,y) = y - x` is injective in `y`, so A1 holds, and the
  `c`-exponential is `x + p`.
* For `c(x,y) = ‖x-y‖²/2` the Ma--Trudinger--Wang tensor vanishes, so A3w holds and A3s fails in
  dimension at least `2`.
* For `c(x,y) = ‖x-y‖`, `-Dₓc(x,y) = (y-x)/‖y-x‖` takes the same value at all points of a ray from
  `x`, so A1 fails.

### 6.13 The generated Jacobian equation

Derive the general generated-Jacobian/`c`-Monge--Ampère equation, including the
`det D²_xy c` factor and the sign convention pinned by the chosen `c`-exponential.
For bounded open `U,V ⊆ ℝⁿ`, a cost `c ∈ C⁴(cl U × cl V)` satisfying the
bi-twist/nondegeneracy condition (B1) of
[Figalli--Kim--McCann (FKM)](https://arxiv.org/abs/1107.1014), and a `c`-convex
potential `u = u^{c*c}`, define `|∂ᶜ u|(E)=Lebesgue(∂ᶜ u(E))`; prove FKM Lemma 3.1,
including that this is a Borel measure of mass `Lebesgue(V)` and its pushforward
representation through the a.e. inverse contact map.

*Needs:* item 12; Mathlib Lebesgue measure and `ContDiff`.

**Checks.**

* For `c(x,y) = -⟨x,y⟩`, the `c`-convex functions are the convex functions, `∂ᶜu = ∂u`, and
  `|∂ᶜu|` is the Aleksandrov measure `MA_u`.
* For `c(x,y) = -2⟨x,y⟩` and `u(x) = ‖x‖²`, `∂ᶜu(x) = {x}` and `|∂ᶜu|(E) = |E|`, while the
  Aleksandrov measure of `u` is `|2E| = 2ⁿ|E|`; the factor `|det D²_xy c| = 2ⁿ` of the generated
  Jacobian equation accounts for the difference.
* For `c(x,y) = -⟨x,y⟩`, `u(x) = ‖x‖²/2` and `U = V` the unit disc in `ℝ²`, `|∂ᶜu|(U) = |V| = π`.

### 6.14 Loeper's maximum principle and Figalli--Kim--McCann

For a cost satisfying item 12's (C0)--(C3) on open `X, Y ⊆ ℝⁿ`, prove Loeper's theorem in the
form of the De Philippis--Figalli survey, Theorem 4.6, p. 38: the following are equivalent.

* Every `c`-subdifferential `∂ᶜψ(x̄)` of a `c`-convex `ψ` is connected.
* For every `c`-convex `ψ` and `x̄ ∈ X`, `(c-exp_x̄)⁻¹(∂ᶜψ(x̄))` is convex and equals the Fréchet
  subdifferential of `ψ` at `x̄`.
* Loeper's maximum principle (4.12): for every `x̄ ∈ X` and every `c`-segment `(y_t)` with base
  `x̄` contained in `Y`, `c(x,y_t) - c(x̄,y_t) ≥ min[c(x,y₀) - c(x̄,y₀), c(x,y₁) - c(x̄,y₁)]` for
  all `x ∈ X` and `t ∈ [0,1]`.
* A3w, in the form (4.13), p. 40.

The implication from A3w to connectedness also needs `Y` to be `c`-convex with respect to `X`,
so that it contains the `c`-segments (survey, p. 40); state it with that hypothesis.  Prove that
a `c`-convex `ψ` with a disconnected `∂ᶜψ(x̄)` yields smooth positive probability densities whose
optimal map is discontinuous (survey, Theorem 4.5, p. 38).  Since connectedness of every
`∂ᶜψ(x̄)` implies A3w, failure of A3w yields such densities.

Formalize FKM Theorem 2.1 (Figalli--Kim--McCann, arXiv:1107.1014v1, p. 6).  Let `U, V ⊆ ℝⁿ` be
bounded open sets and let `c ∈ C⁴(cl(U × V))` satisfy (B0)--(B3) and (B2)s (pp. 4--5): (B1) asks
that `x ↦ -D_y c(x,ỹ)` and `y ↦ -D_x c(x̃,y)` be diffeomorphisms onto their ranges (item 12's A1,
A1* and A2), (B2) that `U_ỹ = -D_y c(U,ỹ)` and `V_x̃ = -D_x c(x̃,V)` be convex for every
`(x̃,ỹ) ∈ U × V`, (B3) is A3w, and (B2)s asks that both `U_ỹ` and `V_x̃` be strongly convex:
each boundary point is touched from outside by a sphere of one radius `R` enclosing the set.  Let
`f⁺` and `f⁻` be probability densities on `U` and `V` with `f⁺/f⁻ ∈ L∞(U × V)`, the function
`(x,y) ↦ f⁺(x)/f⁻(y)`, and `f⁻/f⁺ ∈ L∞(U' × V)` for an open `U' ⊆ U`.  Prove that the optimal
transport problem from `f⁺ dx` to `f⁻ dy` is solved by a map that is locally Hölder continuous and
one-to-one on `U'`, with Hölder exponent depending only on `n` and `‖log(f⁺/f⁻)‖_{L∞(U' × V)}`.
Keep A3s and global classical second-boundary-value regularity as separate targets requiring
uniform mutual `c`-convexity and the cited smooth boundary/cost/density hypotheses.

*Needs:* items 12--13.

**Checks.**

* For `c(x,y) = ‖x-y‖²/2`, `U_ỹ = U - ỹ` and `V_x̃ = V - x̃` are translates of `U` and `V`, so
  (B2)s holds exactly when `U` and `V` are both strongly convex.  Two discs satisfy every
  hypothesis; a square source with a disc target satisfies (B2) and fails (B2)s, because a sphere
  touching the middle of an edge from outside cannot enclose the edge's endpoints.
* For the same cost with `U = V` the unit disc and uniform densities, `‖log(f⁺/f⁻)‖_{L∞} = 0`
  and the optimal map is the identity.
* If `f⁻` vanishes on a subset of `V` of positive measure, `f⁺/f⁻` is not essentially bounded on
  `U × V` and the theorem does not apply: the effective target is then a smaller set, which need
  not satisfy (B2).
* For `c(x,y) = -⟨x,y⟩`, `c`-segments with base `x̄` are ordinary segments, `∂ᶜψ = ∂ψ` is convex,
  and (4.12) reads `⟨x - x̄, y_t⟩ ≤ max(⟨x - x̄, y₀⟩, ⟨x - x̄, y₁⟩)`, true because the left side is
  affine in `t`.

### 6.15 Partial regularity

Prove De Philippis--Figalli partial regularity (De Philippis--Figalli 2015, Theorem 1.3,
p. 82; restated in the survey as Theorem 4.11, p. 45).  Let `X, Y ⊆ ℝⁿ` be bounded open sets
and let `f` on `X` and `g` on `Y` be **continuous** probability densities bounded away from zero
and infinity on all of `X` and `Y`: `λ ≤ f, g ≤ λ⁻¹` for one `λ > 0`.  Let `c : X × Y → ℝ` be of
class `C²` with finite `C²(X × Y)` norm (their (C0)), and satisfy item 12's source twist A1
(`y ↦ -Dₓc(x,y)` injective on `Y` for every `x ∈ X`), target twist A1* (`x ↦ -D_y c(x,y)`
injective on `X` for every `y ∈ Y`) and nondegeneracy A2 (`det D_xy c ≠ 0` on `X × Y`).  No MTW
condition and no convexity of `X` or `Y` is assumed.  Produce relatively closed Lebesgue-null
sets `Σ_X ⊆ X`, `Σ_Y ⊆ Y` such that the optimal map `T` is a homeomorphism of `X ∖ Σ_X` onto
`Y ∖ Σ_Y` that is locally `C⁰,β` for every `β < 1`.  With `c` nonnegative on `X × Y` (a constant
shift, available because (C0) bounds `c`, changes no optimal map) and with every
Kantorovich-optimal map read up to `μ`-a.e. equality, this is
`exists_homeomorph_holderOnWith_of_isKantorovichOptimalTransportMap`.  If moreover
`c ∈ C^{k+2,α}_loc(X × Y)`, `f ∈ C^{k,α}_loc(X)` and `g ∈ C^{k,α}_loc(Y)` for some `k ≥ 0` and
`α ∈ (0,1)`, prove that `T` is a `C^{k+1,α}_loc` diffeomorphism of `X ∖ Σ_X` onto `Y ∖ Σ_Y`; the
local Hölder hypothesis on `c` enters only this second clause.  A version with densities only
locally bounded away from zero and infinity is the manifold Theorem 1.4 of the same paper, which
Layer 7.7 carries; it is not a hypothesis of the Euclidean theorem.

*Needs:* items 12--13; De Philippis--Figalli 2015 Theorem 1.3.

Use the De Philippis--Figalli [Monge--Ampère and optimal-transport
survey](https://www.ams.org/journals/bull/2014-51-04/S0273-0979-2014-01459-4/S0273-0979-2014-01459-4.pdf)
as the statement checklist.  The MTW branch is governed by the
[Ma--Trudinger--Wang paper](https://doi.org/10.1007/s00205-005-0362-9) and
[Loeper's necessity theorem](https://doi.org/10.1007/s11511-009-0037-8); the final target
is De Philippis--Figalli [partial
regularity](https://www.numdam.org/item/10.1007/s10240-014-0064-7.pdf).

### Examples

For `u(x) = ‖x‖²/2` on `ℝⁿ`, `∂u(E) = E`, so `MA_u` is Lebesgue measure, matching
`det D²u = 1`.  For `u(x) = ‖x‖` on `ℝ²`, `∂u(0)` is the closed unit disc and `∂u(x)` is the
single unit vector `x/‖x‖` elsewhere, so `MA_u = π δ₀` while `det D²u = 0` away from the
origin: this is the singular-mass example that item 3's decomposition must keep.  For the
uniform laws on `[0,1]` and on `[0,2]`, the Brenier potential is `u(x) = x²`, the map is
`T(x) = 2x`, and the Jacobian equation of item 6 reads `1 = (1/2)·2`.

### Dependencies

Layer 5; GeometricMeasureTheory G2 for the Lipschitz area formula; Tau Ceti's `TauCeti.Wkp`; PDE §1.7 (A7) and §2.4 (B11).

## Layer 7: Riemannian Brenier--McCann transport

The [Hopf--Rinow roadmap](../../Completed/HopfRinow/README.md), Layers 1--4, supplies the
Levi-Civita connection, interval-aware geodesics, exponential maps and their local inverse
logarithms on normal neighborhoods, Hopf--Rinow, and minimizing geodesics.  Riemannian volume is
Tau Ceti's `TauCeti.riemannianVolume`.  This layer consumes them and owns the
remaining transport-facing geometry: squared-distance semiconcavity and the
measurable/a.e. selections used below.
[RiemannianGeometry R4.6](../RiemannianGeometry/README.md#r4-comparison-complete-manifolds-and-space-forms)
owns injectivity radius, cut-locus measurability and volume-nullity. No
global single-valued logarithm is introduced across the cut locus.

### 7.1 Riemannian prerequisites

For finite-dimensional boundaryless Riemannian manifolds, consume the Hopf--Rinow roadmap's
exponential map, local logarithm, completeness, and minimizing-geodesic APIs. Consume
RiemannianGeometry R2–R3/R4.6 for Jacobi fields, conjugate points, injectivity radius
and cut-locus measurability/volume-nullity. Build squared-distance semiconcavity,
the measurable/a.e. minimizing-initial-velocity selections, and the a.e. differentiability
facts used by transport.  State connectedness, geodesic completeness, and moment hypotheses
separately from compactness.

*Needs:* Hopf--Rinow Layers 1--4; RiemannianGeometry R2--R3 and R4.6; Tau Ceti
`TauCeti.riemannianVolume`.

### 7.2 Contact points and the exponential map

Using the Hopf--Rinow roadmap's exponential and minimizing-geodesic APIs, specialize Layer 2's
`c`-concave/contact API to `c(x,y)=d(x,y)²/2`.  Prove that a Kantorovich potential `φ` for this
cost is locally semiconcave on the interior `Ω` of the set where it is finite, that every point
of `Ω` has a contact endpoint, that the contact endpoints are locally bounded on `Ω`, and that
the finiteness set minus `Ω` is `(n-1)`-rectifiable, with no compactness or curvature
hypothesis on the complete manifold (Figalli--Gigli, *Local semiconvexity of Kantorovich
potentials on non-compact manifolds*, Theorem 1, p. 2, who write the potential with the
opposite sign and state local semiconvexity); so `Ω` has full `μ`-measure when `μ` gives mass
`0` to `(n-1)`-rectifiable sets, and `φ` is differentiable volume-almost everywhere on `Ω`.  At
every differentiability point `x ∈ Ω` of `φ`, prove that each contact endpoint `y` is joined to `x` by a unique
minimizing geodesic, that its initial velocity is `-∇φ(x)`, and hence that
`y=exp_x(-∇φ(x))`.  Do not strengthen this to
`y ∉ Cut(x)`: differentiability of `d(·,y)²/2` at `x` is equivalent to uniqueness of
the minimizing geodesic, and a first conjugate point is a cut point that can still be
joined to `x` by a unique minimizing one, so cut-locus avoidance does not follow.
State every cut-locus claim separately, from item 1's measurability and volume-nullity
of the cut locus and with its own hypotheses.  Deduce the displayed pointwise
conclusion volume-a.e., and hence `μ`-a.e. only when `μ ≪ volume`; connect the sign
convention to the Riemannian exponential map.

*Needs:* item 1; Layer 2.2; Mathlib Rademacher's theorem for the almost-everywhere
differentiability of locally Lipschitz functions.

### 7.3 McCann's theorem

Using those consumed geodesic results and Tau Ceti's `TauCeti.riemannianVolume`, prove
**McCann's theorem**: for finite-second-moment laws on a finite-dimensional, connected,
boundaryless, geodesically complete smooth Riemannian manifold, with source absolutely
continuous with respect to Riemannian volume, the unique quadratic optimal plan is induced by
`T(x)=exp_x(-∇φ(x))`.  Give the compact-manifold statement, where moments are
automatic, as a corollary rather than the root theorem (McCann 2001, Theorem 9, p. 13, existence
and characterization of `T`, and Theorem 8, pp. 12--13, its uniqueness among maps, on a
connected compact `C³` boundaryless manifold; Ambrosio--Gigli, *A user's guide to optimal
transport*, Theorem 1.33, p. 19, on a smooth compact boundaryless manifold).  On a complete
connected manifold, existence of the optimal map, its uniqueness `μ`-almost everywhere and the
concentration of every optimal plan on its graph are Fathi--Figalli, *Optimal transportation on
non-compact manifolds*, arXiv:0711.4519v1, Theorem 4.2, pp. 14--15 (costs induced by a Tonelli
Lagrangian, a source null on countably `(n-1)`-Lipschitz sets, finite Kantorovich value), and
Theorem 4.3, p. 16 (the cost `d^r`, `r > 1`, with finite `r`-th moments); there the exponential
formula holds, for `μ ≪ volume`, with the approximate gradient of the potential.  Item 2's
semiconcavity (Figalli--Gigli, Theorem 1 and the display (1.2), p. 2) makes the potential
differentiable `μ`-almost everywhere, so the formula holds with the gradient.  Existence of a
Kantorovich-optimal map whose graph plan is the only optimal coupling, for the cost
`d²/2` of the Riemannian distance and without the exponential formula, is
`exists_isKantorovichOptimalTransportMap_riemannian`.

*Needs:* items 1--2; Layer 4.6; Tau Ceti `TauCeti.riemannianVolume`.

### 7.4 Inverse maps, interpolation, and Riemannian polar factorization

Prove the inverse-map result when the target is also absolutely continuous: the map
`y ↦ exp_y(-∇φᶜ(y))` inverts `T` almost everywhere on both sides (McCann 2001, Corollary 10,
pp. 14--15, on compact manifolds).  Define the
Riemannian interpolation explicitly by
`μ_t = Measure.map (fun x ↦ exp_x (-t • ∇φ x)) μ`, prove its minimizing-geodesic and
cut-locus properties, and require Layer 9 to identify it with the generic displacement
interpolation.  For Riemannian polar factorization, let `M` be a connected compact
`C³` boundaryless Riemannian manifold, let `m` be a finite Borel measure with `m ≪ volume`
(normalized volume is the case of Brenier's factorization), and let
`s : M → M` be Borel with `s_#m ≪ volume`.  Prove the `m`-a.e.-unique factorization
`s=T∘u`, where `u_#m=m` and `T(x)=exp_x(-∇ψ(x))` is the unique quadratic optimal
map from `m` to `s_#m`, with the `c`-concavity convention `ψᶜᶜ=ψ`, and `u` and `T` are Borel
(McCann 2001, Theorem 11, p. 15).  When `m` is equivalent to volume, as normalized volume is,
prove uniqueness of the potential modulo constants (the Lipschitz potentials then have equal
gradients volume-a.e. on the connected `M`), select the representative satisfying `∫ ψ dm=0`,
and distinguish uniqueness of `u`, `T`, and that representative; for an `m` vanishing on an open
set the potential is not determined there.

*Needs:* item 3; Layer 5.9; McCann 2001, Corollary 10 and Theorem 11.

**Checks.**

* On `ℝⁿ`, `exp_x(-t∇φ(x)) = x - t∇φ(x)`, so the interpolation is the Euclidean displacement
  interpolation; for `φ(x) = ‖x‖²/2 - u(x)` it is `Measure.map ((1-t)·id + t∇u) μ`.
* At `t = 0` the interpolation is `μ`, and at `t = 1` it is the target law.
* On the circle `ℝ/2πℤ`, from `δ₀` with `-∇φ(0) = π/2` the interpolation is `δ_{tπ/2}`, along the
  unique minimizing geodesic.

### 7.5 MTW conditions for Riemannian squared distance

On RiemannianGeometry R4.6's open subset of `M×M` where `d²/2` is smooth,
away from the cut-locus relation,
connect the smooth general-cost MTW predicates from Layer 6 to Riemannian squared
distance.  Every regularity theorem carries a transport-domain/cut-locus-avoidance
hypothesis strong enough for its derivatives and estimates.  Do not claim that
nonnegative sectional curvature by itself implies regularity; MTW and cut-locus
geometry are stronger requirements.

*Needs:* Layer 6.12; RiemannianGeometry R4.6.

### 7.6 The distance cost on manifolds

Develop the non-twist cost `c=d` through transport rays.  First prove the exact
Feldman--McCann theorem on a complete connected Riemannian manifold for two
compactly-supported nonnegative `L¹` volume densities of equal mass.  Then prove
Figalli's one-sided-absolute-continuity, noncompact extension (Figalli 2007, Theorem 1.1
with the Lagrangian `(1 + ‖v‖²)/2` of Remark 1.2, pp. 3--4): for probability laws `μ,ν` on a
connected smooth manifold with complete Riemannian metric, `μ ≪ volume`, and
`∫ d(x,y) dμ(x)dν(y)<∞`--equivalently, by Remark 1.2 and connectedness, both laws have finite
first moment--there is a Monge minimizer whose graph plan is Kantorovich-optimal.  With the
Riemannian distance as the extended distance of `M`, this is
`exists_isKantorovichOptimalTransportMap_edist_riemannian`.  Record that uniqueness generally
fails; the `p=1` branch is not a strict-convexity corollary.

*Needs:* item 1; Layer 4; Figalli 2007 Theorem 1.1 and Remark 1.2.

### 7.7 Riemannian partial regularity

Prove De Philippis--Figalli's Riemannian theorem (De Philippis--Figalli 2015, Theorem 1.4,
p. 82) for the cost `d²/2`.  Let `M` be a connected, complete, boundaryless smooth Riemannian
manifold and let `f`, `g` be continuous probability densities with respect to
`TauCeti.riemannianVolume`, locally bounded away from zero and infinity on `M`, whose laws have
finite second moment so that item 3's optimal map `T` exists.  Then there are closed
volume-null sets `Σ_X, Σ_Y ⊆ M` such that `T : M ∖ Σ_X → M ∖ Σ_Y` is a homeomorphism that is
locally `C⁰,β` for every `β < 1`; if moreover `f` and `g` are of class `C^{k,α}`, it is a
`C^{k+1,α}_loc` diffeomorphism.  No Ma--Trudinger--Wang condition, curvature sign, or
compactness is assumed.  The route localizes Layer 6.15 in charts away from the cut relation,
on RiemannianGeometry R4.6's open set where `d²/2` is smooth, and uses item 1's
cut-locus nullity.

*Needs:* items 1--3 and 5; Layer 6.15; RiemannianGeometry R4.6.

McCann's original [polar factorization on Riemannian
manifolds](https://doi.org/10.1007/PL00001679) is the primary source for compact manifolds;
Fathi--Figalli, [Optimal transportation on non-compact
manifolds](https://arxiv.org/abs/0711.4519), Theorems 4.2 and 4.3, with Figalli--Gigli,
[Local semiconvexity of Kantorovich potentials on non-compact
manifolds](https://doi.org/10.1051/cocv/2010011), Theorem 1, supply the complete noncompact
finite-cost form, which Villani 2009, Chapter 10, treats for general costs.  The compact-support
distance-cost milestone follows Feldman--McCann,
[Monge's mass transport problem on a Riemannian
manifold](https://www.ams.org/journals/tran/2002-354-04/S0002-9947-01-02930-0/); the
one-sided noncompact theorem follows Figalli,
[The Monge problem on non-compact manifolds](https://cvgmt.sns.it/media/doc/paper/1313/transportdist.pdf),
Theorem 1.1 and its distance-cost specialization.

### Examples

On `ℝⁿ` with the Euclidean metric, `exp_x(v) = x + v`; for the `c`-concave potential
`φ(x) = ‖x‖²/2 - u(x)` the map `exp_x(-∇φ(x))` equals `∇u(x)`, so McCann's theorem reduces to
Brenier's.  On the unit circle `ℝ/2πℤ`, `d(·,y)²/2` fails to be differentiable exactly at the
antipode `y + π`, where two minimizing geodesics start; the cut locus of `y` is that single
point, a volume-null set, as item 1 consumes from RiemannianGeometry R4.6.

### Dependencies

Layers 2, 5 and 6; Hopf--Rinow Layers 1--4; RiemannianGeometry R2--R3 and R4.6; Tau Ceti's `TauCeti.riemannianVolume`.

## Layer 8: metric curves, dynamic plans, and Benamou--Brenier

Consume metric curve length, length spaces, and constant-speed geodesic spaces from the shared API
owned by the [Hopf--Rinow roadmap](../../Completed/HopfRinow/README.md), Layer 4.  Build the remaining maximally
general path-space theory first, then the Eulerian specialization.

### 8.1 Absolutely continuous curves and compactness

Define `ACᵖ([0,T];X)`, metric derivatives, `p`-energy/action, and measurable families of
curves, reusing the consumed metric length and geodesic-space notions.  Prove the
fundamental theorem for absolutely continuous metric-valued curves, reparameterization,
and lower semicontinuity of action.  Split compactness into its two genuinely different
theorems rather than one clause.  First, the deterministic Arzelà--Ascoli theorem on
`C([0,T];X)`: a common modulus of continuity together with relative compactness of the
values at each time--equivalently at a dense set of times--or an explicit
compact-containment/coercive-function hypothesis.  Equicontinuity and a common initial
point do not suffice on a nonproper carrier, and the regression example is
`γ_n(t)=t e_n` in an infinite-dimensional Hilbert space: equi-Lipschitz, all starting at
zero, with no uniformly convergent subsequence.  Second, tightness for probability laws
on path space: tight time marginals plus a uniform probabilistic modulus-of-continuity
bound.  When an expected `p`-action bound is what supplies that modulus, state the range
`p > 1` and the Hölder/Markov estimate used, and record that the action bound supplies
only the modulus--pointwise or dense-time tightness on an arbitrary nonproper carrier
remains a separate hypothesis.  Build the reusable Alexandrov
curvature-bounded-below predicate `CBB(κ)`, its
triangle/quadruple comparison formulations, their equivalence in the applicable
geodesic category, and basic isometry/geodesic-invariance API.  Keep lower curvature
bounds distinct from CAT(0)'s upper bound.

*Needs:* Hopf--Rinow Layer 4; Mathlib `ContinuousMap` and Lebesgue integration on intervals.
Tau Ceti declares or proves `TauCeti.absolutelyContinuousOnInterval_of_coe_eq_map_IccExtend` and
`TauCeti.curveAction_le_lintegral_of_coe_eq_map_IccExtend`.

**Checks.**

* `γ(t) = 2t` in `ℝ` has metric derivative `2` and `p`-action `2^p` on `[0,1]`.
* `γ_n(t) = t e_n` in `ℓ²` is `1`-Lipschitz from `0` for every `n` and has no uniformly convergent
  subsequence.
* The Euclidean plane is `CBB(0)` and `CAT(0)`; the round sphere is `CBB(1)` and not `CAT(0)`; the
  tripod of three segments glued at a point is `CAT(0)` and `CBB(κ)` for no `κ`.

### 8.2 Path space and geodesic selection

Build continuous path space with its Borel structure, evaluation maps `e_t`, endpoint
laws, dynamic plans, and plans concentrated on base-space geodesics.  Prove
measurability of all evaluation and action functionals used later.  On a complete
separable geodesic space, prove that the endpoint/constant-speed-geodesic relation is
closed (Ambrosio--Gigli, *A user's guide to optimal transport*, Lemma 2.11, p. 34, which the
proof of their Theorem 2.10, pp. 31--32, feeds to a measurable selection theorem).  Build the
Jankov--von Neumann uniformization theorem for analytic relations
between standard-Borel/Polish spaces (Kechris, *Classical Descriptive Set Theory*,
Theorem 18.1), using Layer 2's
analytic-set/completion-measurability bridge, and apply it to this relation.  Relative
to each fixed endpoint law, pass through its
completion and choose a Borel representative equal almost everywhere.  Keep a global
Borel geodesic bicombing as stronger input data, not as an automatic consequence of
Polish geodesicity.

*Needs:* item 1; Layer 2.2 (the analytic-set and completion bridge); Mathlib `ContinuousMap` with
the compact-open topology.
Tau Ceti declares or proves `MeasureTheory.Measure.exists_measurable_ae_mem_geodesicPaths` and
`MeasureTheory.Measure.exists_ae_mem_geodesicPaths_endpointLaw_eq`.

**Checks.**

* For `γ(t) = 2t`, the dynamic plan `δ_γ` has time marginals `δ_{2t}` and endpoint coupling
  `δ_{(0,2)}`.
* On the circle `ℝ/2πℤ`, the plans `δ_{γ₊}`, `δ_{γ₋}` and `(δ_{γ₊}+δ_{γ₋})/2` on the two
  minimizing geodesics from `0` to `π` share the endpoint coupling `δ_{(0,π)}`: a dynamic plan is
  not determined by its endpoints.
* Evaluation `e_t` is continuous on `C([0,1];X)`, hence Borel, at every `t ∈ [0,1]`.

### 8.3 Lisini's superposition theorem

Prove Lisini's superposition theorem: for complete separable `X` and
`1 < p < ∞`, every
`ACᵖ` curve in `P_p(X)` is represented by a probability law on `ACᵖ` paths with the
exact averaged-speed/minimality relation (Lisini 2007, Theorem 5); this is Tau Ceti's
`TauCeti.exists_map_IccExtend_eq_lintegral_curveAction_eq`.  No geodesicity or local
compactness is assumed here.

*Needs:* items 1--2; Layer 3; Tau Ceti `TauCeti.exists_map_IccExtend_eq_lintegral_curveAction_eq`.

### 8.4 Wasserstein geodesics and optimal dynamic plans

In complete separable geodesic spaces and for `1 < p < ∞`, characterize Wasserstein
geodesics by optimal dynamic plans concentrated on constant-speed base geodesics.
Prove that every two-time projection is optimal and obtain the metric dynamic-action
formula.

*Needs:* items 1--3; Layer 3.
Tau Ceti declares or proves `TauCeti.WassersteinSpace.instIsGeodesicSpace`,
`TauCeti.WassersteinSpace.isGeodesicSegment_iff_isDisplacementInterpolation`,
`TauCeti.isLeast_wassersteinEDist_rpow_lintegral_curveAction`,
`TauCeti.WassersteinSpace.isGeodesicSegment_iff_exists_isOptimalCoupling`,
`TauCeti.IsDisplacementInterpolation`,
`TauCeti.WassersteinSpace.eqOn_of_isGeodesicSegment_of_ae_subsingleton` and
`TauCeti.WassersteinSpace.isGeodesicSegment_iff_coe_eq_map_smul_add_smul_of_absolutelyContinuous`.

### 8.5 The `p = 1` endpoint

Develop the `p=1` endpoint separately through BV path lifts and total-variation
measures.  This is not item 3 read at `p=1`: Lisini's superposition principle covers
`1 < p < ∞`, and his Wasserstein--Orlicz extension does not reach `d¹` either.  The
source is Abedi--Li--Schultz, [Absolutely continuous and BV-curves in 1-Wasserstein
spaces](https://arxiv.org/abs/2209.04268).  On a complete separable `X` and
`I=[0,1]`, build the Skorokhod space `D(I;X)` of càdlàg curves with its Polish
structure, the Borel subset `BV(I;X)`, and the total-variation measure `|Dγ| ∈ M(I)`
of such a curve.  Every BV curve, in `X` or in `P₁(X)`, is taken in its càdlàg
representative, unique up to its value at `t = 1`, so that
`d(γ_s,γ_t) ≤ |Dγ|((s,t])` holds for all `0 ≤ s ≤ t < 1` and every evaluation `e_t`
is defined at every time (their Remark 2.20).  Following their Remark 3.2, prove that `γ ↦ |Dγ|(A)` is Borel for
every Borel `A ⊆ I`--from lower semicontinuity of the variation on open sets--so that
`A ↦ ∫ |Dγ|(A) dπ(γ)` is a measure and is integrated against nonnegative Borel
`f : I → ℝ` as `∫∫ f(t) d|Dγ|(t) dπ(γ)`.  Prove their Theorem 3.1 first: if
`π ∈ P(D(I;X))` is concentrated on `BV(I;X)` with `∫ |Dγ|(I) dπ(γ) < ∞` and
`(e₀)_#π ∈ P₁(X)`, then `t ↦ μ_t=(e_t)_#π` lies in `BV(I;P₁(X))` and
`|Dμ| ≤ ∫ |Dγ| dπ(γ)` as measures, so equality is an optimality condition among lifts
exactly as at `1 < p < ∞`.  Then prove their Theorem 3.3: every
`(μ_t) ∈ BV(I;P₁(X))` admits `π̃ ∈ P(D(I;X))` concentrated on `BV(I;X)` with
`(e_t)_#π̃=μ_t` for all `t ∈ I` and the exact identity `|Dμ| = ∫ |Dγ| dπ̃(γ)`, whose
absolutely continuous part in the Lebesgue decomposition satisfies
`|μ̇_t| = lim_{h→0} ∫ d(γ_t,γ_{t+h})/|h| dπ̃(γ) = lim_{h→0} ∫ |Dγ|(J_{t,h})/|h| dπ̃(γ)`
for `L¹`-a.e. `t`, where `J_{t,h} = [min(t,t+h), max(t,t+h)]` is the closed interval
between `t` and `t+h` (their Theorem 3.3 and equation (3.6), p. 19, which write
`[t,t+h]`; read as an ordered interval that set is empty for `h < 0`: for `μ_t = δ_t`
on `ℝ` and the lift `γ(t) = t`, the speed and the distance quotient are `1`, the
ordered-interval quotient is `0` for `h < 0`, and the quotient over `J_{t,h}` is `1`); deduce that `(μ_t) ∈ AC¹(I;P₁(X))` gives `|Dμ|=|μ̇|L¹` and
characterizes the metric speed.  Include their Example 1.1, `μ_t=(1-t)δ₀+tδ₁` on `ℝ`,
as the regression test: a constant-speed `W₁` geodesic that admits no lift on
continuous curves at all, lifted instead by the uniform mixture of the jump paths
`γ^{(α)}_t=1_{[α,1]}(t)`.  It is why the `1 < p < ∞` theorem cannot simply be
generalized.

*Needs:* items 1--3; Layer 3; Mathlib `IsCadlag`; Abedi--Li--Schultz Theorems 3.1 and 3.3.

### 8.6 The `W_∞` endpoint

Let `(X,τ,d)` be an extended Polish space in Lisini's sense: `τ` is induced by a
complete separable metric, `d` is an extended complete metric, `d`-convergence implies
`τ`-convergence, and `d` is `τ×τ` lower semicontinuous.  For the Orlicz function
`ψ∞` equal to `0` on `[0,1]` and `∞` on `(1,∞)`, prove the superposition principle
for `AC^{ψ∞}` curves and
`|μ′|(t)=ess sup_η |u′_η|(t)` (Lisini 2016, Theorem 3.1, p. 677, with the admissible `ψ∞` of his
§2).  Prove that endpoint-optimal plans concentrated on constant-speed `d`-geodesics generate
`W_∞` geodesics (Proposition 4.1, p. 685), and that every representing superposition plan for a
`W_∞` geodesic that satisfies the exact Orlicz speed identity supplied by Lisini's
superposition theorem has optimal two-time marginals (Theorem 4.2, p. 686).  Do not
claim that its sample paths are geodesics: Lisini's converse uses strict convexity,
which `ψ∞` lacks.

*Needs:* items 1--3; Lisini 2016 Theorem 3.1, Proposition 4.1 and Theorem 4.2.

### 8.7 The continuity equation

On finite-dimensional normed spaces, define distributional solutions of
`∂ₜμₜ + div(vₜ μₜ)=0`, including measurable time slices, vector-valued flux measures,
test functions, and boundary-time terms (Ambrosio--Gigli--Savaré, §8.1, and Theorem 8.3.1 for
the correspondence with absolutely continuous curves).  Name the two superposition statements instead
of writing "both directions", since one builds a field by conditional expectation and
the other asserts concentration on integral curves of a given field.  Lagrangian from
Eulerian: if a narrowly continuous `μ_t` and a Borel field `v_t` solve the continuity
equation with `∫₀ᵀ∫‖v_t‖^p dμ_t dt < ∞`, construct a law `η` on `ACᵖ` paths with
`(e_t)_#η=μ_t` and `γ̇_t=v_t(γ_t)` for `dt⊗η`-almost every `(t,γ)`.  Eulerian from
Lagrangian: from a dynamic plan `η` of finite averaged action, construct its
vector-valued flux, disintegrate over `e_t` to obtain the barycentric field `v_t`, and
prove the continuity equation together with `∫∫‖v_t‖^p dμ_t dt ≤ ∫ A_p(γ) dη(γ)`.  For
`1 < p < ∞`, state the minimal-velocity conclusion as the exact relation
`‖v_t‖_{Lᵖ(μ_t)}=|μ′|(t)` for a.e. `t`, and prove uniqueness of the minimal field only
under the strict convexity that gives it; do not leave uniqueness implicit for an
arbitrary normed space.

*Needs:* items 1--2; Mathlib Fréchet derivatives and compactly supported smooth functions;
Ambrosio--Gigli--Savaré Theorem 8.3.1.
Tau Ceti declares or proves `TauCeti.IsContinuityEquation`,
`TauCeti.exists_isContinuityEquation_map`, `TauCeti.IsContinuityEquation.measure_univ_eq`,
`TauCeti.exists_isContinuityEquation_map_smul_fst_add_smul_snd_of_isOptimalCoupling` and
`TauCeti.IsContinuityEquation.ofReal_integral_sub_integral_le_lintegral_of_fderiv_le`.

**Checks.**

* `μ_t = δ_{2t}` with `v_t ≡ 2` solves the equation:
  `∫₀¹ (∂ₜφ(t,2t) + 2∂ₓφ(t,2t)) dt = φ(1,2) - φ(0,0) = 0` for `φ` compactly supported in
  `(0,1) × ℝ`.
* With the opposite sign, `∂ₜμ - div(vμ) = 0`, the same curve would need `v ≡ -2`.
* The translates `μ_t = (x ↦ x + t w)_# μ₀` of a fixed law solve the equation with the constant
  field `v_t ≡ w`.

### 8.8 The Benamou--Brenier formula

Prove the Eulerian **Benamou--Brenier formula** for `1 ≤ p < ∞` on a finite-dimensional real
normed space, with `p=2` as the named classical theorem:
`W_p(μ₀,μ₁)^p = inf ∫₀¹ ∫ ‖v_t(x)‖^p dμ_t(x)dt`
over narrowly continuous continuity-equation solutions joining `μ₀` to `μ₁`, both sides possibly
`∞`, with the minimum attained when `W_p(μ₀,μ₁)` is finite; these are Tau Ceti's
`TauCeti.wassersteinEDist_rpow_eq_sInf_lintegral_isContinuityEquation` and
`TauCeti.isLeast_lintegral_isContinuityEquation`.  For a Monge map `T` with
finite `p`-displacement, put `F_t(x)=(1-t)x+tT(x)` and
`μ_t = Measure.map F_t μ`.  Define the Lagrangian vector flux and, by disintegrating
`μ` over `F_t`, the barycentric Eulerian velocity
`v_t(y)=E_μ[T(X)-X | F_t(X)=y]`.  Prove the continuity equation and the action bound
`∫₀¹∫‖v_t‖^p dμ_t dt ≤ ∫‖T-id‖^p dμ`.  If `F_t` is a.e. injective,
prove `v_t(F_t(x))=T(x)-x` a.e.  If the graph plan of `T` is optimal, prove that
`μ_t` is the displacement geodesic and that the action bound is an equality; Layer 9
identifies precisely this optimal tier with its generic displacement-interpolation
relation.

*Needs:* items 3, 4 and 7; Layer 4; Tau Ceti `TauCeti.isLeast_lintegral_isContinuityEquation` and
`TauCeti.wassersteinEDist_rpow_eq_sInf_lintegral_isContinuityEquation`.
Tau Ceti declares or proves `TauCeti.IsContinuityEquation`,
`TauCeti.exists_isContinuityEquation_map`, `TauCeti.IsContinuityEquation.measure_univ_eq`,
`TauCeti.exists_isContinuityEquation_map_smul_fst_add_smul_snd_of_isOptimalCoupling` and
`TauCeti.IsContinuityEquation.ofReal_integral_sub_integral_le_lintegral_of_fderiv_le`.

**Checks.**

* For `T(x) = x + w`, `F_t(x) = x + tw` is injective and the barycentric velocity is `v_t ≡ w`.
* For `μ = (δ₀+δ₂)/2` and `T ≡ 1`, `F_t(0) = t` and `F_t(2) = 2 - t`, so `F_{1/2}` is injective
  with `v_{1/2}(1/2) = 1` and `v_{1/2}(3/2) = -1`; `F_1 ≡ 1` is not injective, and there the
  barycentric velocity is `v_1(1) = E_μ[1 - X] = 0` while `T(x) - x = ±1`, so the pullback formula
  needs its injectivity hypothesis.
* For the optimal map `T(x) = 2x` from the uniform law on `[0,1]` and `p = 2`,
  `v_t(y) = y/(1+t)` and `∫‖v_t‖² dμ_t = ∫₀¹ x² dx = 1/3` for every `t`, so the action equals
  `∫‖T-id‖² dμ = 1/3 = W₂(μ₀,μ₁)²`, as the equality case requires.

### 8.9 The Riemannian Benamou--Brenier formula

Let `M` be a finite-dimensional, connected, boundaryless smooth Riemannian manifold with
Riemannian distance `d`, and `1 < p < ∞`.  Define distributional solutions of
`∂ₜμₜ + div(vₜ μₜ)=0` on `M` by testing against compactly supported smooth `φ` on
`(0,1) × M`: `∫₀¹∫ (∂ₜφ + ⟨∇φ, vₜ⟩) dμₜ dt = 0`, with `∇` the Riemannian gradient `mgradient` of
DifferentialGeometry Layer 12.2 and `vₜ` a Borel time-dependent vector field.  Prove the two
halves of the correspondence between solutions and absolutely continuous curves of `P_p(M)`
(Ambrosio--Gigli, *A user's guide to optimal transport*, Theorem 2.29, p. 44, for `p = 2`).

* (A) For complete `M`, every `ACᵖ` curve `(μₜ)` of `P_p(M)` (item 1) has a Borel field `vₜ`
  solving the equation with `‖vₜ‖_{Lᵖ(μₜ)} ≤ |μ̇|(t)` for almost every `t`.  Route: item 3 on
  `(M,d)` gives a law `η` on `ACᵖ` paths with `(eₜ)_#η = μₜ` and `∫ |γ̇ₜ|^p dη = |μ̇|(t)^p` for
  almost every `t`; an absolutely continuous path of `M` is differentiable at almost every time,
  with Riemannian speed `|γ̇ₜ|` equal to its metric derivative; `vₜ(x)` is the conditional mean of
  `γ̇ₜ ∈ T_xM` given `γₜ = x`, from Layer 0.3's disintegration of `η` over `eₜ`; the equation is
  `∫∫₀¹ (d/dt) φ(t,γₜ) dt dη = 0`, and Jensen's inequality gives the bound.
* (B) For compact `M`, if a narrowly continuous `(μₜ)` and a Borel `vₜ` solve the equation with
  `∫₀¹ ‖vₜ‖_{Lᵖ(μₜ)} dt < ∞`, then `(μₜ)` is absolutely continuous in `P_p(M)` and
  `|μ̇|(t) ≤ ‖vₜ‖_{Lᵖ(μₜ)}` for almost every `t`.  Route: reparametrize time so that
  `‖vₜ‖_{Lᵖ(μₜ)}` is bounded; take a smooth closed embedding `j : M → ℝᴰ` with injective
  differential (Mathlib's `exists_embedding_euclidean_of_compact`); then `(j_#μₜ, dj(vₜ))` solves
  item 7's Euclidean equation with finite `p`-action, since `dj` is bounded on compact `M`;
  item 7's Lagrangian superposition gives a law on `ACᵖ` paths of `ℝᴰ` that lie in the closed set
  `j(M)` at every time and follow `dj(v)`; their pullbacks `σ = j⁻¹ ∘ γ` are absolutely
  continuous in `(M,d)` with `σ̇ₜ = vₜ(σₜ)` for almost every `t`, because `dj` is injective, so
  `d(σₛ,σₜ) ≤ ∫ₛᵗ |vᵣ(σᵣ)| dr`, and Minkowski's integral inequality gives
  `W_p(μₛ,μₜ) ≤ ∫ₛᵗ ‖vᵣ‖_{Lᵖ(μᵣ)} dr`.  The embedding need not be isometric; Ambrosio--Gigli
  use Nash's isometric embedding instead (pp. 46--47).

For compact `M` and `μ₀,μ₁ ∈ P(M) = P_p(M)` prove `W_p(μ₀,μ₁)^p = min ∫₀¹ ∫ |vₜ|^p dμₜ dt` over
narrowly continuous solutions joining `μ₀` to `μ₁`.  The lower bound applies (B) and
`W_p(μ₀,μ₁) ≤ ∫₀¹ |μ̇|(t) dt ≤ (∫₀¹ |μ̇|(t)^p dt)^{1/p}`; the minimizer applies (A) to a
constant-speed geodesic of item 4, along which `|μ̇| = W_p(μ₀,μ₁)`.  For `p = 2` and an absolutely
continuous `μ₀` that geodesic is Layer 7.4's Riemannian displacement interpolation, with velocity
`-∇φ` transported along the geodesics.  For `p = 2` the formula is Ambrosio--Gigli,
Proposition 2.30, p. 45, proved by the same two steps.  Ambrosio--Gigli state Theorem 2.29 for
complete manifolds and prove it, as all of their §2.3, for compact ones (p. 40); (A) holds on
complete `M` by the route above, and (B) and the formula are stated on compact `M`, where their
route is complete.  The divergence theorem of DifferentialGeometry Layer 12.5 and Tau Ceti's
`TauCeti.riemannianVolume` give the bridge to densities `∂ₜρ + div(ρ v) = 0` for `μₜ = ρₜ vol`.

*Needs:* items 1, 3, 4 and 7; Layers 0.3 and 7.4; DifferentialGeometry Layer 12 (gradient,
divergence and divergence theorem); Mathlib `exists_embedding_euclidean_of_compact`; Tau Ceti
`TauCeti.riemannianVolume`.

**Checks.**

* On flat `ℝⁿ`, `mgradient` is the Euclidean gradient and the definition is item 7's.
* On the circle `ℝ/2πℤ`, for a fixed `θ`, `μ_t = δ_{tθ}` with the constant field `v ≡ θ ∂_θ`
  solves the equation: `∫₀¹ (∂ₜφ + θ ∂_θ φ)(t, tθ) dt = φ(1,θ) - φ(0,0) = 0` for `φ` compactly
  supported in `(0,1) × M`; with the opposite sign the same curve would need `v ≡ -θ ∂_θ`.  Its
  metric speed is `|μ̇|(t) = |θ| = ‖vₜ‖_{Lᵖ(μₜ)}`, so (A) and (B) hold with equality.
* On the same circle the constant curve `μₜ = m` of the uniform law solves the equation with
  `v ≡ c ∂_θ` for every constant `c`, since `∫ ∂_θφ dm = 0`: here `‖vₜ‖_{Lᵖ(μₜ)} = |c|` while
  `|μ̇| = 0`, so (B) is only an inequality and the curve does not determine its field.
* On the same circle with `p = 2`, `μ₀ = δ₀` and `μ₁ = δ_{3π/2}`, the curve `δ_{t·3π/2}` has action
  `(3π/2)²`, while `W₂(μ₀,μ₁)² = d(0,3π/2)² = (π/2)²` is attained by `δ_{-tπ/2}` with `v ≡ -(π/2) ∂_θ`:
  the minimum runs along the minimizing geodesic.

The original Euclidean theorem is Benamou--Brenier,
[doi:10.1007/s002110050002](https://doi.org/10.1007/s002110050002).  The more general
dynamic-plan route follows Lisini's [characterization of absolutely continuous
Wasserstein curves](https://cvgmt.sns.it/paper/568/); the extended endpoint follows his
[Wasserstein--Orlicz theory](https://www.numdam.org/articles/10.1051/cocv/2015020/), which
does not cover `d¹`, and the `p=1` endpoint follows Abedi--Li--Schultz.

### Examples

Moving a Dirac mass along a base geodesic has exactly the base action;
linear interpolation of an optimal Euclidean plan gives the expected `W_p` geodesic;
the map-induced linear curve satisfies the barycentric velocity/action theorem, with the
pullback formula tested under an injectivity hypothesis; and the continuity
equation for a translating density has the expected constant velocity.

### Dependencies

Layers 0, 2, 3 and 4 (item 8's Monge maps); Hopf--Rinow Layer 4; Layer 7,
DifferentialGeometry Layer 12 (gradient, divergence and divergence theorem) and Mathlib's
Whitney embedding `exists_embedding_euclidean_of_compact` for item 9.

## Layer 9: displacement geometry and convexity

Turn `P_p(X)` from a metric space into a usable geodesic space.

### 9.1 Displacement interpolations

Define displacement interpolations from an optimal dynamic plan, consuming Layer 8's
measure-relative geodesic selector when no Borel bicombing is supplied, and prove
independence from presentation only when the relevant optimal plan/geodesic is unique.
Prove that Layers 7 and 8's explicit Riemannian and Euclidean map-induced curves agree
with this generic relation.  Define generalized geodesics based at a third measure
through a glued three-plan.  These are Tau Ceti's `TauCeti.IsGeneralizedGeodesicPlan` (a measure
on `X × X × X` whose `(1,2)` and `(1,3)` marginals are `p`-optimal couplings of the base with the
two endpoints), `TauCeti.exists_isGeneralizedGeodesicPlan` (existence on a Polish metric space,
for a finite base measure coupled with both endpoints and every exponent `p ≠ 0`), and
`TauCeti.generalizedGeodesic` (in a real vector space, the law of `(1-t)x₂ + t x₃` under the
plan).

*Needs:* Layers 7.4 and 8.2--8.4; Layer 0.4 (gluing); Tau Ceti
`TauCeti.IsGeneralizedGeodesicPlan` and `TauCeti.exists_isGeneralizedGeodesicPlan`.
Tau Ceti declares or proves `TauCeti.WassersteinSpace.instIsGeodesicSpace`,
`TauCeti.WassersteinSpace.isGeodesicSegment_iff_isDisplacementInterpolation`,
`TauCeti.isLeast_wassersteinEDist_rpow_lintegral_curveAction`,
`TauCeti.WassersteinSpace.isGeodesicSegment_iff_exists_isOptimalCoupling`,
`TauCeti.IsDisplacementInterpolation`,
`TauCeti.WassersteinSpace.eqOn_of_isGeodesicSegment_of_ae_subsingleton` and
`TauCeti.WassersteinSpace.isGeodesicSegment_iff_coe_eq_map_smul_add_smul_of_absolutelyContinuous`.

**Checks.**

* On `ℝ`, the displacement interpolation from `δ₀` to `δ₂` is `δ_{2t}`, with `W₂(δ₀,δ_{2t}) = 2t`.
* From `(δ₀+δ₁)/2` to `(δ₁+δ₂)/2` the monotone plan gives `(δ_t+δ_{1+t})/2`, at `W₂` distance `t`
  from the start; the antitone plan would give `δ₁` at `t = 1/2`, at distance `(1/2)^(1/2) ≠ 1/2`,
  so it is not a geodesic.
* The generalized geodesic based at `δ₀` between `δ_{-1}` and `δ₁`, through the three-plan
  `δ_{(0,-1,1)}`, is `δ_{2t-1}`.

### 9.2 The geodesic structure of `P_p(X)`

Prove that `P_p(X)` is geodesic when `X` is complete, separable, and geodesic, and
characterize constant-speed geodesics in the finite `1 < p < ∞` regime as the time marginals of
a law on constant-speed geodesics whose endpoint law is optimal (Ambrosio--Gigli, *A user's
guide to optimal transport*, Theorem 2.10, p. 31, for `p = 2` on Polish geodesic spaces).  Prove
uniqueness only from the
combination of almost-everywhere unique base geodesics and uniqueness of the endpoint
optimizer; nonbranching alone is not silently promoted to uniqueness.

*Needs:* items 1 and 3; Layer 8.4.
Tau Ceti declares or proves `TauCeti.WassersteinSpace.instIsGeodesicSpace`,
`TauCeti.WassersteinSpace.isGeodesicSegment_iff_isDisplacementInterpolation`,
`TauCeti.isLeast_wassersteinEDist_rpow_lintegral_curveAction`,
`TauCeti.WassersteinSpace.isGeodesicSegment_iff_exists_isOptimalCoupling`,
`TauCeti.IsDisplacementInterpolation`,
`TauCeti.WassersteinSpace.eqOn_of_isGeodesicSegment_of_ae_subsingleton` and
`TauCeti.WassersteinSpace.isGeodesicSegment_iff_coe_eq_map_smul_add_smul_of_absolutelyContinuous`.

### 9.3 Displacement convexity

Define four notions, each with a visible parameter `λ ∈ ℝ`.

* A functional `E` on a metric space is `λ`-geodesically convex when every two points `x`, `y`
  are joined by some constant-speed geodesic `γ` with
  `E(γ_t) ≤ (1-t)E(x) + tE(y) - (λ/2)t(1-t)d(x,y)²` for `t ∈ [0,1]` (Ambrosio--Gigli, *A user's
  guide to optimal transport*, Definition 3.16, p. 59).
* A functional on `P₂(X)` is `λ`-displacement convex when this inequality, with `d = W₂`, holds
  along every Wasserstein geodesic between two laws of its domain, and weakly `λ`-displacement
  convex when for every two such laws it holds along at least one Wasserstein geodesic
  (Lott--Villani, arXiv:math/0412127v4, Definition 3.15 and inequality (3.16), p. 17, for their
  functionals `U_ν` over a compact length space; the definition here is for every functional and
  every `X`).  Weak `λ`-displacement convexity is `λ`-geodesic convexity on the metric space
  `P₂(X)`.
* A functional on `P₂(ℝⁿ)` is `λ`-convex along generalized geodesics when the inequality holds
  along the interpolating curves `((1-t)T₀ + tT₁)₊μ` with base `μ`, where `T₀`, `T₁` are the
  optimal maps from a regular `μ` (Layer 5.7) to the endpoints (Ambrosio--Gigli,
  Definition 3.29, p. 70), and for an arbitrary base along the plans of item 4, with the
  remainder `(λ/2)t(1-t)∫‖x₂-x₃‖² dγ` of the plan.

Develop endpoint, restriction, lower-semicontinuity, and stability lemmas for each notion.

*Needs:* item 1.

**Checks.**

* Along `δ_{2t}` and for `V(x) = x²/2`, `∫ V dμ_t = 2t² = (1-t)·0 + t·2 - (1/2)t(1-t)·4`: the
  `1`-convexity inequality holds with equality.
* A convention without the factor `1/2` would demand `2t² ≤ 4t² - 2t`, which fails at `t = 1/2`.
* For `W(x) = x²` the interaction energy is `0` along the translation `δ_{2t}` while
  `W₂(μ₀,μ₁)² = 4`, so it is `λ`-displacement convex for no `λ > 0`.

### 9.4 Generalized geodesics and squared distance

Prove convexity of squared Wasserstein distance along generalized geodesics in the
Euclidean `W₂` setting, with its constant.  Let `μ,ν₀,ν₁ ∈ P₂(ℝⁿ)` and let `γ` be a
three-plan on `ℝⁿ × ℝⁿ × ℝⁿ` whose `(1,2)` and `(1,3)` marginals are optimal for `(μ,ν₀)` and
`(μ,ν₁)`; the generalized geodesic of item 1 is `ν_t = ((1-t)x₂ + t x₃)_# γ`.  Then

    W₂(μ,ν_t)² ≤ (1-t) W₂(μ,ν₀)² + t W₂(μ,ν₁)² - t(1-t) ∫‖x₂-x₃‖² dγ,

and `∫‖x₂-x₃‖² dγ ≥ W₂(ν₀,ν₁)²`.  In the Conventions' normalization this is `1`-convexity of
`ν ↦ W₂(μ,ν)²/2` along generalized geodesics based at `μ` (`2`-convexity of `W₂(μ,·)²` itself).
The proof couples `μ` and `ν_t` by `(x₁,(1-t)x₂+t x₃)_# γ` and expands the square.  For a
regular base `μ`, where `γ = (id,T₀,T₁)_# μ`, it is Ambrosio--Gigli, *A user's guide to optimal
transport*, Definition 3.29 and inequality (3.43), pp. 70--71; for a general base it is
Ambrosio--Gigli--Savaré, §9.2, Lemma 9.2.1.  This is the load-bearing estimate for resolvents
and minimizing movements and cannot be replaced by an incorrect assertion of convexity along
every ordinary geodesic.  Tau Ceti proves both inequalities in `[0,∞]`, with no moment
hypothesis, on a separable real inner product space:
`TauCeti.IsGeneralizedGeodesicPlan.wassersteinEDist_sq_add_le` (the remainder
`t(1-t)∫‖x₂-x₃‖² dγ`) and
`TauCeti.IsGeneralizedGeodesicPlan.wassersteinEDist_sq_add_wassersteinEDist_sq_le` (the
remainder `t(1-t)W₂(ν₀,ν₁)²`), for `t ∈ [0,1]` and a quadratic generalized-geodesic plan.

*Needs:* items 1 and 3; Layer 0.4; Tau Ceti
`TauCeti.IsGeneralizedGeodesicPlan.wassersteinEDist_sq_add_le` and
`TauCeti.IsGeneralizedGeodesicPlan.wassersteinEDist_sq_add_wassersteinEDist_sq_le`.

**Checks.**

* On `ℝ` with `μ = ν₀ = δ₀` and `ν₁ = δ₁`, `ν_t = δ_t` and `W₂(μ,ν_t)² = t² = t - t(1-t)`:
  equality with the remainder `t(1-t)W₂(ν₀,ν₁)²`.
* The same instance with the remainder halved would read `t² ≤ t - t(1-t)/2`, which is true but
  strict for `0 < t < 1`; the remainder doubled would read `t² ≤ t - 2t(1-t)`, false at
  `t = 1/2` (`1/4 ≤ 0`).  So the constant is exactly the stated one.
* Based at `μ = δ₀` between `δ_{-1}` and `δ₁`, `ν_t = δ_{2t-1}` and
  `(2t-1)² = (1-t) + t - 4t(1-t)`: equality with `∫‖x₂-x₃‖² dγ = 4`.

### 9.5 Potential, interaction, and internal energies

Define potential energy `μ ↦ ∫ V dμ`, symmetric interaction energy
`μ ↦ (1/2)∫ W d(μ⊗μ)`, and internal energy relative to `m`, with
`∫ U(ρ) dm` on the absolutely continuous part and the recession constant multiplying
singular mass.  Pin safe `EReal` and integrability conventions before algebra.  Then
state each convexity regime with its own hypotheses rather than calling any of them
standard.  For internal energy relative to Lebesgue measure on `ℝⁿ`, prove McCann's
condition: for convex lower-semicontinuous `U` with `U(0)=0`, displacement convexity
follows when `s ↦ s^n U(s^(-n))` is convex and nonincreasing on `(0,∞)`, with the
recession convention above for singular mass.  This is not by itself a theorem for
internal energy relative to a general reference `m`; that version needs Layer 14's
curvature-dimension hypotheses and belongs there.  For potential energy, prove that
`λ`-convex `V` gives `λ`-displacement-convex `μ ↦ ∫ V dμ`, with its growth and domain
assumptions visible.  For interaction energy, prove the exact statement, not a
transplanted one: `μ ↦ (1/2)∫ W d(μ⊗μ)` is invariant under translating `μ`, so it is
never globally `λ`-displacement convex on `P₂(ℝⁿ)` for any `λ>0`, however strongly
convex `W` is.  The strong-convexity remainder is proportional to
`W₂(μ₀,μ₁)² - |∫x dμ₀ - ∫x dμ₁|²`, so prove global displacement convexity for convex
symmetric `W`, and obtain a positive modulus only on a fixed-barycenter class or by
retaining that variance-type remainder.  The signed Boltzmann-entropy instance is proved
in Layer 11 after that functional exists.

*Needs:* items 1 and 3; Mathlib `EReal` and Lebesgue decomposition.
Tau Ceti declares or proves `TauCeti.potentialEnergy`,
`StrongConvexOn.geodesicallyConvex_potentialEnergy`,
`StrongConvexOn.generalizedGeodesicallyConvex_potentialEnergy`, `TauCeti.interactionEnergy`,
`ConvexOn.geodesicallyConvex_interactionEnergy`,
`TauCeti.not_geodesicallyConvex_interactionEnergy`, `TauCeti.internalEnergy`,
`TauCeti.internalEnergy_map_smul_add_smul_gradient_le`,
`TauCeti.WassersteinSpace.exists_isGeodesicSegment_convexAlong_internalEnergy` and
`TauCeti.renyiEntropy`.

**Checks.**

* The potential energy of `δ_a` is `V(a)`.
* The interaction energy of `(δ₀+δ₂)/2` for `W(x) = x²` is `(1/2)·(1/4)·(0+4+4+0) = 1`.
* For `U(r) = r²` the internal energy of the uniform law on `[0,2]` relative to Lebesgue measure
  is `∫₀² (1/2)² dx = 1/2`; for `U(r) = r log r`, `s ↦ sⁿU(s^(-n)) = -n log s` is convex and
  nonincreasing, as McCann's condition requires.

### 9.6 One-dimensional quantile geometry

Consume Layer 3's quantile-coupling theorem to develop the one-dimensional quantile
isometry, geodesics, geodesic convexity, and pointwise minimization identities without
Euclidean-density assumptions.  Layer 12 consumes those identities for barycenter
formulas.  The statements are: `μ ↦ Q_μ` is an isometry of `P_p(ℝ)` into `Lᵖ(0,1)` for
`1 ≤ p < ∞` (Peyré--Cuturi, *Computational Optimal Transport*, Remark 2.30, (2.35)--(2.36),
pp. 31--32); the displacement interpolation between `μ₀` and `μ₁` given by the quantile
coupling has quantile `(1-t)Q_{μ₀} + tQ_{μ₁}` (same source, (7.7), p. 104); and for weights
`λ_i ≥ 0` of sum `1` the law with quantile `∑ λ_i Q_{μ_i}` minimizes `ν ↦ ∑ λ_i W₂(ν,μ_i)²`
(same source, Remark 9.6, p. 143).  Tau Ceti proves the three statements:
`TauCeti.WassersteinSpace.isometry_quantileLp` is the isometry, for `1 ≤ p ≤ ∞`;
`TauCeti.quantileBarycenter w μ` is the law of `∑ i, w i Q_{μ_i}` under the uniform law on
`(0,1)`, with quantile `∑ i, w i Q_{μ_i}` a.e. (`TauCeti.quantile_quantileBarycenter_ae`);
`TauCeti.exists_isGeodesicSegment_quantileBarycenter` gives, for `1 ≤ p ≤ ∞`, a geodesic of
`P_p(ℝ)` through the quantile interpolations, and
`TauCeti.WassersteinSpace.isGeodesicSegment_iff_coe_eq_quantileBarycenter` shows that for
`1 < p < ∞` every geodesic is one; and `TauCeti.sum_mul_wassersteinEDist_sq_quantileBarycenter_le`
is the minimization, for probability laws and weights of sum `1`, in `[0,∞]`.

**Checks.**

* For `μ₀ = δ₀` and `μ₁ = (δ₀+δ₂)/2`, `Q_{μ_t} = 0` on `(0,1/2]` and `2t` on `(1/2,1)`, so
  `μ_t = (δ₀+δ_{2t})/2` and `W₂(μ₀,μ_t)² = (1/2)(2t)² = 2t² = t² W₂(μ₀,μ₁)²`.
* The `W₂` barycenter of `δ₀` and `δ₂` with weights `1/2` has quantile `(0+2)/2 = 1`, that is
  `δ₁`, with value `(1/2)·1 + (1/2)·1 = 1`; the mixture `(δ₀+δ₂)/2` has value
  `(1/2)·2 + (1/2)·2 = 2`, so the barycenter averages quantiles and not laws.
* For `μ = (δ₀+δ₂)/2` the antitone rearrangement `s ↦ Q_μ(1-s)` has law `μ` and is at `L²(0,1)`
  distance `2` from `Q_μ`, while `W₂(μ,μ) = 0`: only the nondecreasing representative enters the
  isometry.

*Needs:* Layer 3.7; items 1--3; Tau Ceti `TauCeti.WassersteinSpace.isometry_quantileLp`,
`TauCeti.WassersteinSpace.isGeodesicSegment_iff_coe_eq_quantileBarycenter` and
`TauCeti.sum_mul_wassersteinEDist_sq_quantileBarycenter_le`.

The public API must distinguish a selected interpolation from the proposition that a
curve is a displacement interpolation.  This lets later uniqueness theorems improve a
relation into a function without changing foundational definitions.

### Examples

On `ℝ`, the displacement interpolation from `δ₀` to `δ₂` is `μ_t = δ_{2t}`, and
`W₂(δ₀, δ_{2t}) = 2t = t W₂(δ₀, δ₂)`.  For `V(x) = x²/2`, `∫ V dμ_t = 2t²`, which equals
`(1-t)·0 + t·2 - (1/2)t(1-t)·4`: the pinned `1`-convexity inequality holds with equality,
while a convention without the factor `1/2` would demand `2t² ≤ 4t² - 2t`, false at
`t = 1/2`.  For `W(x) = x²`, the interaction energy `(1/2)∫ W d(μ_t ⊗ μ_t)` is `0` along this
translation while `W₂(μ₀,μ₁)² = 4` equals the squared mean displacement, so the remainder of
item 5 vanishes and no positive modulus is available.

### Dependencies

Layers 3, 7 and 8.

## Layer 10: abstract metric gradient flows

Build the Ambrosio--Gigli--Savaré theory on an anchored finite-distance component
`D(x_*)={x | edist x x_* < ∞}` of a general extended metric space before specializing it
to probability measures.  Prove that changing the anchor within the same component does
not change the resulting theory.  Every test point in a distance-dependent inequality is
in that component (and in the energy domain when the formula requires a finite energy);
ordinary metric spaces receive the global corollaries.

### 10.1 Slopes and upper gradients

On Layer 8's `p`-absolutely-continuous metric-valued curves, define proper
lower-semicontinuous extended-real energies, descending and relaxed slopes, and local
and strong upper gradients (Ambrosio--Gigli--Savaré, §1.2; Tau Ceti's `TauCeti.descendingSlope`
and `TauCeti.IsStrongUpperGradient`).  For `1 < p < ∞` and its conjugate `q`, define the
conjugate-exponent energy-dissipation inequality.  Recover the quadratic `p=q=2` API
as the standard notation and treat endpoint exponents through separately justified
statements.

*Needs:* Layer 8.1; Tau Ceti `TauCeti.descendingSlope` and `TauCeti.IsStrongUpperGradient`.

**Checks.**

* For `Φ(x) = ‖x‖²/2` on a Hilbert space, the descending slope is `‖x‖`.
* For `Φ(x) = |x|` on `ℝ` the descending slope is `0` at `0` and `1` elsewhere; for `Φ(x) = -|x|`
  it is `1` at `0`.
* `g ≡ 0` is not a strong upper gradient of `Φ(x) = x²/2` along `γ(t) = t` on `[0,1]`:
  `|Φ(1) - Φ(0)| = 1/2 > 0 = ∫ g|γ'|`.

### 10.2 Curves of maximal slope

Define curves of maximal slope and energy-dissipation equalities.  Prove the chain-rule
implications under strong-upper-gradient hypotheses and keep existence separate from
a definition that merely packages an equality.

*Needs:* item 1.
Tau Ceti declares or proves `TauCeti.IsCurveOfMaximalSlope` and
`TauCeti.IsCurveOfMaximalSlope.apply_eq_add_dissipation`.

**Checks.**

* For `Φ(x) = x²/2` on `ℝ`, `x_t = e^{-t}x₀` satisfies
  `d/dt Φ(x_t) = -x_t² = -(1/2)|x_t'|² - (1/2)|∂Φ|(x_t)²`.
* A constant curve at `x₀ ≠ 0` is not a curve of maximal slope: the energy identity would need
  `0 = -x₀²`.
* The constant curve at the minimizer `0` is a curve of maximal slope.

### 10.3 Evolution variational inequalities

Consume Layer 9's componentwise `λ`-geodesic-convexity predicates and define `EVI_λ`
solutions, quantifying its comparison point over the same finite-distance component
and the effective domain of the energy.  Prove that EVI implies the energy-dissipation
identity, contraction, and uniqueness.  Separate the pointwise regularization estimates
from the semigroup, which is not a consequence of one EVI curve existing.  With
`I_λ(t)=∫₀ᵗ exp(λs)ds`, integrating the EVI gives the concrete energy-regularization
estimate
`Φ(x_t) ≤ Φ(y) + (d(x₀,y)² - exp(λt) d(x_t,y)²)/(2 I_λ(t))`
for `t>0` and `y ∈ Dom(Φ)` in the same finite-distance component as `x₀`; enumerate the
finite-energy and positive-time slope and local-Lipschitz conclusions wanted from it,
under their usual hypotheses.  A semigroup needs three further hypotheses made visible:
existence of an EVI solution from every point of the chosen initial domain, uniqueness,
and closure under time translation.  Only then define `S_t x` and prove
`S_{t+s}=S_t ∘ S_s`.  Do not assert the converse or EVI existence on every geodesic
metric space.  The contraction, the regularization estimate and the energy identity are
Muratori--Savaré, *Gradient flows and evolution variational inequalities in metric spaces. I*,
Theorem 3.5, pp. 18--19: (3.10) is the contraction, (3.13) rearranges to the displayed
estimate with their `E_λ(t)` equal to `I_λ(t)`, and (3.17) is the energy identity.

*Needs:* items 1--2; Layer 9.3.
Tau Ceti declares or proves `TauCeti.IsEVISolution`, `TauCeti.IsEVISolution.dist_le`,
`TauCeti.IsEVISolution.eqOn` and `TauCeti.eviSemiflow`.

**Checks.**

* For `Φ(x) = λx²/2` on `ℝ`, `x_t = e^{-λt}x₀` satisfies the evolution variational inequality with
  equality: `(1/2)d/dt(x_t-y)² + (λ/2)(x_t-y)² = (λ/2)(y² - x_t²)`.
* Two such solutions satisfy `|x_t - y_t| = e^{-λt}|x₀ - y₀|`, the contraction rate of the pinned
  convention.
* `I_λ(t) = (e^{λt}-1)/λ` for `λ ≠ 0` and `I_0(t) = t`.

### 10.4 Moreau--Yosida resolvents and implicit Euler steps

Define the Moreau--Yosida functional, resolvent set/map when single-valued, implicit
Euler step, discrete variational interpolation, and De Giorgi interpolation.  Interpret
the squared-distance penalty as `∞` outside the anchor's finite-distance component,
prove that every finite-energy resolvent and minimizing-movement step remains in that
component, and prove the discrete energy and slope estimates there (Ambrosio--Gigli, *A
user's guide to optimal transport*, §3.2.2, pp. 55--57: Definition 3.7 for the discrete
solution, Theorem 3.9 for De Giorgi's derivative formula along the resolvent, Definition 3.11
for the variational interpolation, and Corollary 3.12 for the discrete energy identity with
its discrete speed and slope).

*Needs:* items 1--3.
Tau Ceti declares or proves `TauCeti.moreauYosida`, `TauCeti.moreauYosidaResolvent`,
`TauCeti.moreauYosidaResolvent_nonempty_of_lowerSemicontinuous`, `TauCeti.deGiorgiInterpolant`,
`TauCeti.TendstoGamma.mem_moreauYosidaResolvent_of_tendsto` and
`TauCeti.hasDerivAt_toReal_moreauYosida`, the derivative formula of Theorem 3.9: for resolvent
points `y_s ∈ J_s(x)` chosen for all `s` near `r > 0`, with `Φ_r(x)` finite and `s ↦ d(x,y_s)`
continuous at `r`, the function `s ↦ Φ_s(x)` has derivative `-d(x,y_r)²/(2r²)` at `r`.

**Checks.**

* For `Φ(x) = ‖x‖²/2` on a Hilbert space the resolvent is `x ↦ x/(1+τ)`.
* For the indicator of a closed convex set `K` the resolvent is the metric projection onto `K`,
  for every `τ`.
* For `Φ(x) = |x|` on `ℝ` the resolvent is soft thresholding, `x ↦ sign(x)·max(|x|-τ, 0)`.

### 10.5 Minimizing movements

Define minimizing movements and generalized minimizing movements: limits, as the step `τ ↓ 0`
(respectively along some sequence of steps), of the piecewise-constant interpolants of the
implicit Euler sequences of item 4 whose initial points converge to the starting point with
bounded energy.  Prove three theorems, with
different hypotheses and different conclusions.

1. *Existence.*  Let `X` be an extended metric space with an auxiliary sequential convergence
   `⇀` for which constant sequences converge and `d` is jointly sequentially lower
   semicontinuous: `d(y,z) ≤ liminf d(v_n,w_n)` whenever `v_n ⇀ y` and `w_n ⇀ z`.  Let `Φ` be
   sequentially `⇀`-lower semicontinuous along sequences of finite diameter, and let every
   sequence of finite diameter on which `Φ` is bounded above have a `⇀`-convergent subsequence.
   Let `Φ` be coercive: `inf_y (Φ(y) + d(y,x₁)²/(2τ₀)) > -∞` for some `τ₀ > 0` and some `x₁`.
   Then from every `x₀` with `Φ(x₀) < ∞` at finite distance from `x₁` there starts a generalized
   minimizing movement, and it is `1/2`-Hölder on every bounded time interval.  This is Tau
   Ceti's `TauCeti.exists_isGeneralizedMinimizingMovement`.  With `⇀` the metric convergence on a
   complete separable space and `Φ` lower semicontinuous and bounded below, the compactness
   hypothesis says that the sublevels are boundedly compact, and the statement is the first
   assertion of Ambrosio--Gigli, *A user's guide to optimal transport*, Theorem 3.14, pp. 57--58,
   whose hypotheses are Assumption 3.8, p. 55, and Assumption 3.13, p. 57; that compactness is
   the first clause of Assumption 3.13.
2. *Maximal slope.*  Let `X` be a metric space, `Φ` lower semicontinuous and bounded below, its
   descending slope lower semicontinuous on `{Φ < ∞}` and a strong upper gradient of `Φ`.  Let
   `τ_k ↓ 0` be positive steps and, for each `k`, an implicit Euler sequence with step `τ_k` from
   a fixed `x₀` with `Φ(x₀) < ∞`, with resolvent points chosen at the intermediate steps so that
   the slope along De Giorgi's interpolant is almost everywhere measurable.  If the interpolants
   converge pointwise on `[0,T]`, the limit is a curve of maximal slope for `Φ` with respect to
   its descending slope on `[0,T]`, with exponents `p = q = 2`
   (`TauCeti.isCurveOfMaximalSlope_of_forall_mem_moreauYosidaResolvent`).  Ambrosio--Gigli obtain
   the energy-dissipation inequality of the limit from the continuity clause of Assumption 3.13
   (Theorem 3.14, second assertion, p. 58) and the equality for a `λ`-geodesically convex energy
   with boundedly compact sublevels on a geodesic space (Assumption 3.17, p. 59, and Theorem
   3.20, p. 62).
3. *EVI.*  Let `X` be complete and separable, `Φ` lower semicontinuous, and suppose that for all
   `x₀, x₁, y` there is a curve `γ` from `x₀` to `x₁` with
   `Φ(γ_t) ≤ (1-t)Φ(x₀) + tΦ(x₁) - (λ/2)t(1-t)d(x₀,x₁)²` and
   `d(γ_t,y)² ≤ (1-t)d(x₀,y)² + t d(x₁,y)² - t(1-t)d(x₀,x₁)²` for `t ∈ [0,1]`.  Then for every
   step with `1 + λτ > 0` the discrete solution from a point of `{Φ < ∞}` exists and is unique,
   and as `τ ↓ 0` the discrete solutions converge locally uniformly to the `EVI_λ` solution of
   item 3, with no compactness hypothesis on sublevels (Ambrosio--Gigli, Assumption 3.24 and
   Theorem 3.25, p. 64).  Layer 11.7 is the Wasserstein instance.  An `EVI_λ` solution of a
   lower semicontinuous energy is a curve of maximal slope on `(0,∞)`
   (`TauCeti.IsEVISolution.isCurveOfMaximalSlope`), so the third conclusion implies the second
   where both apply.

*Needs:* items 1--4; Layer 8.1.
Tau Ceti declares or proves `TauCeti.IsGeneralizedMinimizingMovement`,
`TauCeti.exists_isGeneralizedMinimizingMovement`,
`TauCeti.isCurveOfMaximalSlope_of_forall_mem_moreauYosidaResolvent` and
`TauCeti.IsEVISolution.isCurveOfMaximalSlope`.

**Checks.**

* For `Φ(x) = x²/2` the steps are `x_k = (1+τ)^{-k}x₀`, and at `t = kτ` fixed
  `(1+t/k)^{-k} → e^{-t}`: the scheme converges to the flow.
* The energies `Φ(x_k)` are nonincreasing along every valid minimizing-movement sequence.
* For `Φ ≡ 0` the minimizing movement is constant.
* For `Φ(x) = -x⁴` on `ℝ`, `inf_y (-y⁴ + (y-x)²/(2τ)) = -∞` for every `τ > 0`, so no step
  exists and coercivity cannot be dropped from the existence theorem.
* For `Φ(x) = -x²`, which is `λ`-convex with `λ = -2`, the infimum is finite exactly when
  `1/(2τ) > 1`, that is `1 + λτ > 0`; then the step is `x ↦ x/(1-2τ)`, and
  `(1-2t/k)^{-k} → e^{2t}`, the flow of `x' = 2x`.  The step range of the third theorem is sharp.

### 10.6 Γ-convergence and stability of flows

Define sequential Γ-liminf, recovery sequences, Γ-convergence, and equicoercivity for
extended-real functionals on a topological carrier.  On metrizable carriers, prove
equivalence with the neighborhood definition and with the compact-sublevel
formulation when the common sublevel closures are compact; give a more general
first-countable theorem only with the additional hypothesis that sequentially compact
subsets are compact.  Prove the basic stability lemmas.  For varying carriers, first
give comparison maps into a named
common Hausdorff ambient space, or an equivalent explicit convergence structure; do
not use a bare `d_n` across unidentified types.  Separate static resolvent stability
from dynamic flow stability.  For resolvents, assume
Γ-convergence and equicoercivity of `Φ_n + d_n²(·,x_n)/(2τ)` in that interface and
prove convergence of minima plus subsequential convergence of minimizers.  In the same
fixed- or varying-carrier convergence interface, formalize the Sandier--Serfaty scheme
for curves of maximal slope:
well-prepared initial data, trajectory compactness, energy and metric-action liminf
inequalities, and the slope liminf
`|∂Φ|(x) ≤ liminf_n |∂Φ_n|(x_n)`; alternatively assume a common `EVI_λ`
structure.  Prove passage through the energy--dissipation inequality.  Plain
Γ-convergence and equicoercivity alone are not a dynamic-flow theorem.  Develop
product/sum rules for energies and flows separately.

*Needs:* items 2--5.
Tau Ceti declares or proves `TauCeti.TendstoGamma.mem_moreauYosidaResolvent_of_tendsto` and, for
the Sandier--Serfaty scheme on a fixed pseudometric carrier,
`TauCeti.isCurveOfMaximalSlope_of_tendsto`: for conjugate exponents `p, q`, if the curves `u_i`
are eventually curves of maximal slope on `[a,b]` for energies `Φ_i` and upper gradients `g_i`,
converge pointwise on `[a,b]` to `u`, have initial energies converging to the finite value
`Φ(u(a))`, and satisfy `Φ(u(b)) ≤ liminf Φ_i(u_i(b))` and `g(u(t)) ≤ liminf g_i(u_i(t))` for almost
every `t`, with `t ↦ g_i(u_i(t))` almost everywhere measurable, and if `g` is a strong upper
gradient of `Φ`, then `u` is a curve of maximal slope for `Φ` and `g` on `[a,b]`.

**Checks.**

* `Φ_n(x) = sin(nx)` on `ℝ` has no pointwise limit and Γ-converges to the constant `-1`.
* `Φ_n(x) = n x²` Γ-converges to the function that is `0` at `0` and `+∞` elsewhere.
* `Φ_n(x) = (x-n)²` Γ-converges to `+∞` everywhere while every `Φ_n` has minimum `0`: without
  equicoercivity, minima do not converge.

### Examples

For `Φ(x)=‖x‖²/2` on a Hilbert space, the resolvent is
`x ↦ x/(1+τ)` and the flow is `e⁻ᵗx`; EVI gives the `e^{-λt}` contraction estimate; and
the discrete energy is monotone along every valid minimizing-movement sequence.

### Dependencies

Layers 8 and 9.

## Layer 11: entropy, Wasserstein differential calculus, JKO, and PDE flows

This layer consumes Layers 8--10 and the weak PDE infrastructure in the
[PDE roadmap](../PDE/README.md).  Where the PDE roadmap does not provide a needed
continuity-equation, Sobolev, or compactness lemma, build and expose the bridge here before
using it.

### 11.1 Relative entropy

Extend Mathlib's nonnegative `InformationTheory.klDiv` for probability/finite
references.  Consume `InformationTheory.klDiv_compProd_eq_add` and
`InformationTheory.klDiv_compProd_left`, for finite `μ`, `ν` and Markov kernels `κ`, `η`, for
the composition-product chain rule.  The conditional form
`klDiv (μ ⊗ₘ κ) (ν ⊗ₘ η) = klDiv μ ν + ∫⁻ x, klDiv (κ x) (η x) ∂μ`
holds for finite `μ`, `ν` and Markov kernels `κ`, `η`, given the measurability of
`x ↦ klDiv (κ x) (η x)`, which a countably generated target or a countable source supplies;
this is Tau Ceti's `TauCeti.klDiv_compProd_eq_add_lintegral`.  Derive the disintegration
corollaries from it.  The Markov hypothesis cannot be dropped (the one-point counterexample in
the Mathlib supplier contract gives `8 log 2 - 3` against `6 log 2 - 3`); with `κ = η = δ` and
`μ = 2δ`, `ν = δ` both sides equal `2 log 2 - 1`.  Consume Mathlib's data-processing inequalities
`InformationTheory.klDiv_map_le`, `InformationTheory.klDiv_trim_le`, and
`InformationTheory.klDiv_comp_right_le`.  Prove strict convexity, lower
semicontinuity, change of reference, tensorization, Pinsker (Nutz, *Introduction to Entropic
Optimal Transport*, Lemma 1.2, p. 4), and the Donsker--Varadhan variational formula (Lemma 1.3,
p. 5), always retaining its finite-mass correction; Tau Ceti implements them as
`TauCeti.strictConvexOn_toReal_klDiv`, `TauCeti.klDiv_eq_klDiv_add_klDiv`,
`TauCeti.klDiv_prod_prod`, `TauCeti.etvDist_sq_le_two_mul_klDiv` and
`TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`.  This slice is the
entropy dependency of Layer 13.

*Needs:* Layer 0.3; Mathlib `InformationTheory.klDiv`, `InformationTheory.klDiv_compProd_eq_add`,
`InformationTheory.klDiv_compProd_left` and the data-processing inequalities; Tau Ceti
`TauCeti.klDiv_compProd_eq_add_lintegral`.

### 11.2 Boltzmann entropy

Specialize Layer 9's internal-energy functional to `U(r)=r log r`, whose recession
constant is `∞`, and expose the result as the signed extended-real Boltzmann entropy
`Ent_m(μ) : EReal` for every finite or probability measure `μ` and a σ-finite or
boundedly finite reference `m` in the regime needed by AGS/RCD.  Prove that this one
root has the following explicit formula.  When `μ ≪ m`, choose a Radon--Nikodym
density `ρ` and safely
combine the positive and negative `lintegral`s of `ρ log ρ`: if the positive-part
integral is infinite, set the value to `+∞`; otherwise subtract the negative-part
integral, allowing `-∞`.  Prove independence of the density representative.  Set the
value to `∞` when `μ ≪̸ m`.  Specify the finite, `+∞`, and `-∞` criteria, prove the
finite-reference bridge
`klDiv μ m = Ent_m(μ) + m(univ) - μ(univ)`, and build lower-semicontinuity/coercivity
statements in the following reference regime.  On a complete separable metric space,
assume the Borel reference satisfies
`0<Z_a=∫ exp(-a d(x,x₀)²)dm<∞` for some `a>0`--both bounds, since `m_a` below must be a
probability measure--and define `m_a=Z_a⁻¹ exp(-a d(x,x₀)²)m` (Ambrosio--Gigli--Savaré,
*Calculus and heat flow in metric measure spaces*, arXiv:1106.2090v4, Definition 7.1, p. 55, for
the entropy of probability measures with a moment weight `V`, here `V² = a d(·,x₀)²`, and
(7.3) and (7.5)--(7.7), pp. 55--56, for the change of reference and the lower semicontinuity
under convergence with moments and under `W₂` convergence).  Keep the mass
correction visible in the change-of-reference identity, because this item admits finite
measures and not only probability measures: with `M=μ(univ)`, Mathlib's finite-measure
convention gives
`klDiv μ m_a = Ent_m(μ) + a∫d(x,x₀)²dμ + M log Z_a + 1 - M`,
which collapses to `Ent_m(μ)+a∫d(x,x₀)²dμ+log Z_a` exactly when `M=1`.  Prove this
identity for finite measures with `∫d(x,x₀)²dμ < ∞`.  Under that moment bound the
inequality `r log r ≥ r log s + r - s`, applied with `s = Z_a⁻¹ exp(-a d(x,x₀)²)`, makes
the negative part of `ρ log ρ` integrable, so `Ent_m(μ) ∈ (-∞,∞]` and the right side is a
well-defined sum.  Without the moment bound the identity fails: on `ℝ` with Lebesgue
reference, `a = 1` and `x₀ = 0`, the probability density `1/(x (log x)²)` on `[e,∞)`
has `Ent_m(μ) = -∞`, infinite second moment, and `klDiv μ m_a = ∞`, while the right side
is the indeterminate `-∞ + ∞`, which Mathlib's `EReal` addition evaluates to `-∞`
(`EReal.bot_add`).  For `μ = 2m_a` both sides equal `2 log 2 - 1`, and for `μ = m_a`
both are `0`.  Then, on `P₂(X)`, deduce the corresponding `W₂` lower-semicontinuity and
tightness/coercivity of sublevels after adding a moment coefficient strictly larger than
`a`.  This is the entropy functional
used by gradient and heat flows; it may be negative and is not `ℝ≥0∞`.

*Needs:* Layer 9.5; item 1; Mathlib Radon--Nikodym derivatives and `EReal`.
Tau Ceti declares or proves `TauCeti.boltzmannEntropy`, `TauCeti.klDiv_eq_boltzmannEntropy_add_sub`
and `TauCeti.WassersteinSpace.lowerSemicontinuous_boltzmannEntropy`.

**Checks.**

* The Boltzmann entropy of the uniform law on `[0,2]` relative to Lebesgue measure is
  `∫₀² (1/2) log(1/2) dx = -log 2`, and that of `δ₀` is `+∞`.
* For `μ` uniform on `[0,1]` and `m` Lebesgue measure on `[0,2]`,
  `klDiv μ m = 0 + 2 - 1 = 1 = Ent_m(μ) + m(univ) - μ(univ)`.
* For `μ = 2m_a` both sides of the change-of-reference identity equal `2 log 2 - 1`; the density
  `1/(x(log x)²)` on `[e,∞)` has entropy `-∞`, which the moment hypothesis excludes.

### 11.3 Tangent velocity fields

On `P₂(ℝⁿ)`, define the tangent space at `μ` as the `L²(μ)` closure of
`{∇φ | φ ∈ C_c^∞(ℝⁿ)}`, the gradients of compactly supported smooth functions, as item 10 does
on manifolds, and prove existence/uniqueness of the minimal-norm representative of an
absolutely continuous curve (Ambrosio--Gigli--Savaré, §8.4, Definition 8.4.1 and
Lemma 8.4.2).  Relate it to Layer 8's distributional continuity equation and
metric derivative.

*Needs:* Layer 8.7; Mathlib `MeasureTheory.Lp` and compactly supported smooth functions.
Tau Ceti declares or proves `TauCeti.wassersteinTangentSpace`,
`TauCeti.mem_orthogonal_wassersteinTangentSpace_iff` and `TauCeti.wassersteinTangentSpace_dirac`.

**Checks.**

* At `μ = δ₀` on `ℝⁿ` the tangent space is all of `L²(δ₀) = ℝⁿ`.
* For `μ` uniform on the unit disc, the rotation field `v(x) = (-x₂,x₁)` is orthogonal to every
  gradient (`div v = 0`, tangent on the circle), so the rotating disc is a constant curve with
  minimal velocity `0`.
* Along `δ_{2t}` on `ℝ` the minimal velocity is the constant `2`.

### 11.4 Wasserstein subdifferentials

Let `E` be a separable real Hilbert space, `Φ : P₂(E) → [-∞,∞]` an energy and `μ ∈ P₂(E)` with
`Φ(μ)` finite.  Define three subdifferentials of `Φ` at `μ`, each a subset of `L²(μ;E)`.

* The Fréchet subdifferential: the fields `ξ` with
  `Φ(ν) ≥ Φ(μ) + ∫⟨ξ(x), y - x⟩ dγ(x,y) + o(W₂(μ,ν))` as `ν → μ`, for every quadratic optimal
  plan `γ` from `μ` to `ν` (Ambrosio--Gigli--Savaré, Definition 10.1.1, for a regular `μ`, where
  `γ` is the plan of the optimal map, and Definition 10.3.1 for plans).  It is Tau Ceti's
  `TauCeti.wassersteinSubdifferential`.  No tangency is required of `ξ`.
* The strong subdifferential: the fields `ξ` with
  `Φ(t₊μ) ≥ Φ(μ) + ∫⟨ξ, t - id⟩ dμ + o(‖t - id‖_{L²(μ)})` as `t → id` in `L²(μ;E)`, for all Borel
  maps `t`, optimal or not (Ambrosio--Gigli--Savaré, Definition 10.1.1).
* The tangent subdifferential, on `E = ℝⁿ`, for `Φ` lower semicontinuous and `λ`-geodesically
  convex and `μ` regular (Layer 5.7): the fields `ξ` in the tangent space of item 3 with
  `Φ(μ) + ∫⟨T - id, ξ⟩ dμ + (λ/2)W₂(μ,ν)² ≤ Φ(ν)` for every `ν ∈ P₂(ℝⁿ)`, where `T` is the optimal
  map from `μ` to `ν` (Ambrosio--Gigli, *A user's guide to optimal transport*, Definition 3.26,
  p. 69).

The scalar slope is the descending slope of Layer 10.1.  Prove the following.

* The Fréchet subdifferential is a closed convex subset of `L²(μ;E)`
  (`TauCeti.convex_wassersteinSubdifferential`, `TauCeti.isClosed_wassersteinSubdifferential`),
  and when it is nonempty it has exactly one element of minimal norm
  (`TauCeti.existsUnique_mem_wassersteinSubdifferential_forall_norm_le`).
* The descending slope of `Φ` at `μ` is at most the norm of every Fréchet subgradient
  (`TauCeti.descendingSlope_le_of_mem_wassersteinSubdifferential`).
* For `Φ` that is `m`-convex along geodesics, the Fréchet subgradients are exactly the fields
  satisfying the global inequality `Φ(ν) ≥ Φ(μ) + ∫⟨ξ(x), y - x⟩ dγ + (m/2)W₂(μ,ν)²` along
  optimal plans (`TauCeti.ConvexAlongGeodesics.mem_wassersteinSubdifferential_iff`); prove the
  corresponding inequality along the generalized geodesics of Layer 9.4.
* On `ℝⁿ` and at a regular `μ`, where every optimal plan is induced by a map, every strong
  subgradient is a Fréchet subgradient, and so is every tangent subgradient of a lower
  semicontinuous `λ`-geodesically convex energy, since `(λ/2)W₂(μ,ν)² = o(W₂(μ,ν))`.
* The equivalence with velocity fields: for `Φ` `λ`-geodesically convex on `P₂(ℝⁿ)` and a
  locally absolutely continuous curve `(μ_t)` of regular measures with tangent velocity `v_t`
  (item 3), `-v_t` lies in the tangent subdifferential of `Φ` at `μ_t` for almost every `t`
  exactly when `(μ_t)` satisfies the evolution variational inequality of Layer 10.3
  (Ambrosio--Gigli, Definition 3.27 and Proposition 3.28, pp. 69--70).

*Needs:* items 2--3; Layers 5.7, 9.4, 10.1 and 10.3; Tau Ceti
`TauCeti.wassersteinSubdifferential`, `TauCeti.convex_wassersteinSubdifferential`,
`TauCeti.isClosed_wassersteinSubdifferential`,
`TauCeti.existsUnique_mem_wassersteinSubdifferential_forall_norm_le`,
`TauCeti.descendingSlope_le_of_mem_wassersteinSubdifferential` and
`TauCeti.ConvexAlongGeodesics.mem_wassersteinSubdifferential_iff`.
Tau Ceti declares or proves `StrongConvexOn.mem_wassersteinSubdifferential_potentialEnergy` and
`TauCeti.hasDerivAt_integral_comp_add_smul`.

**Checks.**

* For the potential energy of `V(x) = x²/2` at `δ_a`, the Fréchet and strong subdifferentials
  contain `x ↦ x`, by `y²/2 ≥ a²/2 + a(y - a)`; its value at `a` has norm the slope `|a|`.
* For the Boltzmann entropy at the standard Gaussian law, the strong subdifferential contains
  `∇ log ρ = -x`.
* For a constant energy the strong subdifferential and, at a regular `μ`, the tangent
  subdifferential are `{0}`: testing `t = id + hξ` gives `0 ≥ h‖ξ‖² + o(h)`, and testing the
  optimal maps `id + h∇ψ`, `ψ` smooth with compact support and `|h|` small, makes a tangent
  subgradient orthogonal to the tangent space.  The Fréchet subdifferential at the uniform law
  on the unit disc of `ℝ²` also contains the rotation field `x ↦ (-x₂, x₁)`: for every convex
  `u`, `⟨ξ, ∇u - id⟩ = ∂_θ u`, which integrates to `0` on each circle.  This field is orthogonal
  to the tangent space (item 3's second Check); the element of minimal norm is `0`, equal to the
  slope.
* At `δ_a`, which is not regular, the Fréchet and strong subdifferentials of a constant energy
  are both `{0}`: testing `ν = δ_y` gives `⟨ξ(a), y - a⟩ ≤ o(|y - a|)` for all `y`, which forces
  `ξ(a) = 0`.

### 11.5 First variations of energies

Consume Layer 9's potential, symmetric-interaction, and internal-energy definitions;
compute their first variations and subdifferentials, together with those of Boltzmann
entropy.  Prove their displacement or generalized-geodesic convexity under the exact
convexity, reference, and growth assumptions.

*Needs:* items 2 and 4; Layer 9.5.
Tau Ceti declares or proves `TauCeti.wassersteinSubdifferential`,
`TauCeti.convex_wassersteinSubdifferential`, `TauCeti.isClosed_wassersteinSubdifferential`,
`TauCeti.existsUnique_mem_wassersteinSubdifferential_forall_norm_le`,
`TauCeti.descendingSlope_le_of_mem_wassersteinSubdifferential`,
`TauCeti.ConvexAlongGeodesics.mem_wassersteinSubdifferential_iff`,
`StrongConvexOn.mem_wassersteinSubdifferential_potentialEnergy` and
`TauCeti.hasDerivAt_integral_comp_add_smul`.

### 11.6 The JKO step

Define the Jordan--Kinderlehrer--Otto step
`μ ↦ argmin_ν (Φ(ν) + W₂(ν,μ)²/(2τ))`.  Consume Layer 10's direct-method
theorem with its hypotheses visible: the penalized functional is proper and narrowly
sequentially lower semicontinuous, and one finite sublevel is narrowly sequentially
compact.  Give the standard sufficient criterion through tightness plus uniform
integrability of squared distance on penalized sublevels; neither `P₂(ℝⁿ)` nor a
merely `W₂`-bounded set is proper.  If `Φ` is additionally `λ`-convex along generalized
geodesics based at the previous iterate, then the objective is `(λ+1/τ)`-convex along
those curves; prove uniqueness when `1+λτ>0`.  Do not silently replace generalized-
geodesic convexity by ordinary displacement convexity.  Prove Euler--Lagrange
conditions, discrete estimates, and compactness of interpolants.  The step is that of
Jordan--Kinderlehrer--Otto 1998; the convexity mechanism is Ambrosio--Gigli, *A user's guide
to optimal transport*: Assumption 3.24 and the first assertion of Theorem 3.25, p. 64 (a
unique discrete solution for `0 < τ < 1/λ⁻`, which is `1+λτ>0`), with Definition 3.29 and
inequality (3.43), pp. 70--71, for the `1`-convexity of `W₂(μ,·)²/2` along interpolating curves
with base `μ` (Layer 9.4; the remainder of (3.43) is `-t(1-t)W₂(ν₀,ν₁)²` for `W₂(μ,·)²`
itself, which is `λ = 2` in the Conventions), stated there for a regular base.  On `P₂(E)` for
a separable real Hilbert space `E`, Tau Ceti proves the convexity and the uniqueness:
`TauCeti.GeneralizedGeodesicallyConvex m Φ μ` is `m`-convexity along generalized geodesics based
at `μ` with the remainder `(m/2)t(1-t)∫‖x₂-x₃‖² dγ` of the plan, as in Ambrosio--Gigli--Savaré;
`TauCeti.GeneralizedGeodesicallyConvex.add_edist_sq_div` makes the penalized functional
`(m + 1/τ)`-convex along the same plans for `τ > 0`; and
`TauCeti.GeneralizedGeodesicallyConvex.subsingleton_moreauYosidaResolvent` gives at most one
minimizer when `τ > 0`, `1 + mτ > 0`, `Φ` never takes the value `-∞`, and `Φ` is finite
somewhere.

*Needs:* items 2 and 4; Layers 9.4 and 10.4; Tau Ceti
`TauCeti.GeneralizedGeodesicallyConvex.add_edist_sq_div` and
`TauCeti.GeneralizedGeodesicallyConvex.subsingleton_moreauYosidaResolvent`.
Tau Ceti declares or proves `TauCeti.WassersteinSpace.moreauYosidaResolvent_nonempty`,
`TauCeti.WassersteinSpace.moreauYosidaResolvent_nonempty_of_properSpace`,
`TauCeti.WassersteinSpace.exists_forall_mem_moreauYosidaResolvent`,
`TauCeti.apply_le_apply_add_of_mem_moreauYosidaResolvent` and
`TauCeti.integral_inner_eq_neg_mul_of_mem_moreauYosidaResolvent`.

**Checks.**

* For `Φ(ν) = ∫ x²/2 dν` on `ℝ`, the step from `δ_a` is `δ_{a/(1+τ)}`.
* For `Φ(ν) = ∫ g x dν` with a constant `g`, the step from `δ_a` is `δ_{a-τg}`.
* For `Φ ≡ 0` the step returns its input.

### 11.7 Convergence of JKO schemes

Let `Φ : P₂(ℝⁿ) → (-∞,∞]` be lower semicontinuous for `W₂`, finite somewhere, and `λ`-convex
along the generalized geodesics of Layer 9.4 for some `λ ∈ ℝ` (item 6's hypothesis), and let
`μ₀ ∈ P₂(ℝⁿ)` with `Φ(μ₀) < ∞`.  For `0 < τ < 1/λ⁻`, that is `1 + λτ > 0` (every `τ > 0` when
`λ ≥ 0`), item 6 defines the JKO steps `μ^τ_k` from `μ₀` uniquely; let `μ^τ_t = μ^τ_k` for
`t ∈ ((k-1)τ, kτ]` be Layer 10.4's discrete solution.

1. *Metric convergence.*  As `τ ↓ 0`, `μ^τ_t` converges in `W₂`, locally uniformly in
   `t ∈ [0,∞)`, to the unique `EVI_λ` solution `(μₜ)` of Layer 10.3 starting from `μ₀`.  For
   `λ ≥ 0` this is Ambrosio--Gigli, *A user's guide to optimal transport*, Theorem 3.25, p. 64,
   under their Assumption 3.24 (p. 64), and their a priori estimate (3.32) bounds `W₂(μₜ, μ^τ_t)`
   by a multiple of `√τ` depending only on the energy drop `Φ(μ₀) - Φ(μₜ)`.  Convexity along
   generalized geodesics supplies both inequalities of Assumption 3.24: the distance one by
   (3.43), p. 71, and the energy one because the remainder `(λ/2)t(1-t)∫‖x₂-x₃‖² dγ` of the plan is
   at least `(λ/2)t(1-t)W₂(ν₀,ν₁)²` when `λ ≥ 0`.  Ambrosio--Gigli build these curves from a regular
   base only (Definition 3.29, p. 70); Layer 9.4's plan-based curves have every base.  For `λ < 0`
   that comparison fails, and the theorem is Ambrosio--Gigli--Savaré, Theorem 4.0.4, under their
   Assumption 4.0.1, which item 6's `(λ + 1/τ)`-convexity of the JKO functional along the same
   plans supplies (`TauCeti.GeneralizedGeodesicallyConvex.add_edist_sq_div`).
2. *Fokker--Planck identification.*  Let `V ∈ C²(ℝⁿ)` with `∇²V ≥ λI`, and let
   `Φ(μ) = Ent(μ) + ∫ V dμ`, with item 2's Boltzmann entropy relative to Lebesgue measure; `Φ`
   satisfies the hypotheses above, by McCann's condition for `r log r` (Layer 9.5, item 5), the
   lower semicontinuity of item 2, and the `λ`-convexity of `V`.  Then `μₜ = ρₜ dx` for `t > 0`, and `ρ` solves `∂ₜρ = Δρ + div(ρ∇V)` in
   distributions: `∫₀^∞ ∫ (∂ₜζ + Δζ - ∇V·∇ζ) ρₜ dx dt = 0` for every `ζ ∈ C_c^∞((0,∞) × ℝⁿ)`.
   Route: an `EVI_λ` curve of absolutely continuous laws is a subdifferential flow, `-vₜ ∈ ∂Φ(μₜ)`
   for its tangent velocity `vₜ` of item 3 (Ambrosio--Gigli, Proposition 3.28, p. 70); item 5's
   subdifferential of `Φ` gives `-vₜ = ∇ρₜ/ρₜ + ∇V` with `ρₜ ∈ W^{1,1}_loc(ℝⁿ)` for almost
   every `t`; the continuity equation of `(μₜ, vₜ)` is then the displayed identity.  Ambrosio--Gigli
   state the identification for `λ ≥ 0` (Theorem 3.35, p. 74; Propositions 3.36 and 3.38,
   pp. 74--75, which they prove under smoothness hypotheses they call unneeded; the example on
   p. 76).  Item 8 gives the porous-medium, fast-diffusion and aggregation energies the same
   treatment.

*Needs:* items 2--6; Layers 9.4, 9.5, 10.3, 10.4 and 10.5; Tau Ceti
`TauCeti.GeneralizedGeodesicallyConvex.add_edist_sq_div`.

**Checks.**

* For `Φ(ν) = ∫ x²/2 dν` on `ℝ` (`λ = 1`) and `μ₀ = δ_a`, item 6's steps are
  `δ_{a(1+τ)^{-k}}`; at `t = kτ` fixed they converge to `δ_{ae^{-t}}`, the `EVI_1` solution of
  Layer 10.3's first Check, with `W₂` gap `|a|·|e^{-t} - (1+t/k)^{-k}| → 0`.
* For `Φ(ν) = -∫ x²/2 dν` (`λ = -1`) and `0 < τ < 1`, the step from `δ_a` minimizes
  `∫ (-x²/2 + (x-a)²/(2τ)) dν`, whose integrand is strictly convex with minimum at `a/(1-τ)`; the
  steps `δ_{a(1-τ)^{-k}}` converge to `δ_{ae^{t}}`.  At `τ = 1` and `a ≠ 0` the integrand is
  `a²/2 - ax`, unbounded below: the restriction `1 + λτ > 0` cannot be dropped.
* With `V = x²/2` on `ℝ` and `μ₀ = N(m,s²)`, the limit is the Ornstein--Uhlenbeck law
  `N(me^{-t}, 1 + (s²-1)e^{-2t})`; with `V = 0` and `μ₀ = N(0,s²)` it is the heat flow
  `N(0, s² + 2t)` of `∂ₜρ = Δρ`, where the normalisation `∂ₜρ = Δρ/2` would give variance
  `s² + t`.

### 11.8 The canonical equations

Deliver the canonical equations.  Boltzmann entropy gives heat flow, and entropy plus
a potential gives Fokker--Planck.  On `ℝⁿ`, define
`U_m(r)=r^m/(m-1)`: for `m>1` prove the porous-medium flow, and for
`max(1-1/n, n/(n+2)) < m < 1` prove fast diffusion: the range is `1/3<m<1` for `n=1`,
`1/2<m<1` for `n=2`, and `1-1/n<m<1` for `n≥3`.  The two bounds do different work.
McCann's condition `m ≥ 1-1/n` gives displacement convexity of `∫U_m(ρ)dx` (Layer 9.5) and
nothing else: it is the condition that `s ↦ sⁿU_m(s^{-n})` be convex and nonincreasing
(Ambrosio--Gigli, *A user's guide to optimal transport*, (3.45) and Proposition 3.33 (iii),
p. 72, with the power densities (3.47), p. 73, for exponents `α ≥ 1-1/n`, `α ≠ 1`; the density
there is `(z^α - z)/(α-1)`, which differs from `U_α` by `z/(α-1)`, whose integral is the same
constant on every probability density).  The lower bound of the energy on `P₂(ℝⁿ)` is the
strict inequality `m > n/(n+2)`, the growth condition (3.44) of Ambrosio--Gigli's Definition
3.32, p. 71.  For `0<m<1` prove, by Hölder's inequality with exponents `1/m` and
`1/(1-m)`,
`∫ρ^m dx ≤ (∫(1+‖x‖²)ρ dx)^m (∫(1+‖x‖²)^(-m/(1-m)) dx)^(1-m)`,
whose last integral is finite exactly when `2m/(1-m) > n`, that is `m > n/(n+2)` (the estimate
displayed after Definition 3.32, p. 72, there with the weight `(1+‖x‖)²`); since the
exponent `m` of the second moment is smaller than one, every JKO functional
`ν ↦ ∫U_m(ρ_ν)dx + W₂(ν,μ)²/(2τ)` is then bounded below and coercive.  Prove that the
threshold is sharp: for `m ≤ n/(n+2)` the energy takes the value `-∞` inside `P₂(ℝⁿ)` and
every JKO functional has infimum `-∞`, so no minimizing-movement scheme exists there.  The
sharpness is proved here, from the densities of the last two Checks below; the cited text states
only the sufficient condition.
Treat the displacement-convex endpoint `m=1-1/n` separately, and only for `n≥3`, where
`1-1/n > n/(n+2)`; for `n=2` the endpoint `m=1/2` equals `n/(n+2)` and is excluded.  Treat
`m=1` by the signed Boltzmann entropy rather than the singular formula for `U_m`.  At each
power tier take initial data `ρ₀ dx ∈ P₂(ℝⁿ)` with finite `∫ U_m(ρ₀)dx`, and obtain a
narrowly continuous `P₂` curve satisfying
the energy-dissipation inequality and the distributional identity
`∫∫ (ρ ∂_tζ+ρ^m Δζ) dxdt=0` for compactly supported smooth tests,
with `ρ,ρ^m∈L¹_loc`.  Existence and uniqueness of the flow as an `EVI_0` gradient flow, for
every internal energy satisfying (3.44) and (3.45) and from every initial law in `P₂(ℝⁿ)`, is
Ambrosio--Gigli, Theorem 3.35, p. 74; the equation is their Proposition 3.38, p. 75, which
identifies `∇(u′(ρ))` as the Wasserstein subgradient at a smooth density and reads
`∂_tρ = div(ρ∇(u′(ρ)))`, that is `∂_tρ = Δ(ρ^m)` for `u = U_m`, since
`ρ∇(U_m′(ρ)) = ∇(ρ^m)`.  That proposition assumes smooth densities; the distributional identity
for the data above is the target here, through the Euler--Lagrange equation of the JKO step
(item 6).  Interaction energy gives aggregation, and sums give the
corresponding drift-diffusion equations under the named coercivity hypotheses of
their component energies.

*Needs:* items 2 and 6--7; Layers 9.5 and 10.5.

**Checks.**

* `U_2(r) = r²`, and on `ℝ` the condition `s ↦ s U_2(1/s) = 1/s` convex and nonincreasing holds.
* For `n = 3` the fast-diffusion range is `2/3 < m < 1`, because `2/3 > 3/5 = n/(n+2)`:
  `m = 3/4` lies in it and `m = 1/2` does not.
* For `m < 1`, `U_m` is negative (`U_{1/2}(r) = -2√r`), so the energy is bounded below only
  through the moment bound.  For `n = 1` and `m = 1/2`, which the range admits,
  `∫(1+x²)^(-1) dx = π` gives `∫ρ^(1/2) dx ≤ (π(1+∫x²ρ dx))^(1/2)`.
* For `n = 1` and `m = 1/4`, which the range excludes, the probability density
  `ρ(x) = (5/4)|x|^(-7/2)` on `|x| ≥ 1` has second moment `(5/2)∫₁^∞ x^(-3/2) dx = 5` and
  `∫ρ^(1/4) dx = 2(5/4)^(1/4)∫₁^∞ x^(-7/8) dx = ∞`, so `∫U_m(ρ)dx = -∞` inside `P₂(ℝ)`.  Mixing a
  mass `ε` of its normalised truncations to `|x| ≤ k` into any `μ` keeps the second moments
  bounded and sends the energy to `-∞`; the range `0 < m < 1` for `n = 1` would admit this case.
* For `n = 2` at `m = 1/2 = 1-1/n = n/(n+2)`, the density proportional to
  `‖x‖^(-4)(log‖x‖)^(-2)` on `‖x‖ ≥ e` has second moment proportional to
  `∫_e^∞ dr/(r log² r) = 1` and `∫ρ^(1/2) dx` proportional to `∫_e^∞ dr/(r log r) = ∞`: the
  displacement-convex endpoint is not bounded below in the plane.

### 11.9 Linear flows and semigroups

Prove energy dissipation, mass preservation and positivity, and, for the `EVI_λ` flows that
item 7 constructs, contraction and uniqueness from Layer 10.3.  Express each linear flow through
the abstract C₀/contraction-semigroup API of the
[one-parameter-semigroups roadmap](../../Completed/OneParameterSemigroups/README.md), and prove
that the entropy flow agrees with the concrete heat semigroup built in the
[PDE roadmap](../PDE/README.md), §6.3 (F26).

Let `V ∈ C²(ℝⁿ)` with `∇²V ≥ λI` for some `λ ∈ ℝ`.  Item 7 makes the `W₂` gradient flow of
`Ent + ∫ V` the `EVI_λ` flow from every initial law of finite energy; its densities solve the
Fokker--Planck equation `∂ₜρ = Δρ + div(ρ∇V)` in distributions, and two of its curves satisfy
`W₂(μₜ,νₜ) ≤ e^{-λt} W₂(μ₀,ν₀)` (Layer 10.3; for `λ ≥ 0`, Ambrosio--Gigli, *A user's guide to
optimal transport*, Theorem 3.35, p. 74, and the example and contraction estimate on p. 76).
Construct here the Markov semigroup `(P_t)` on functions generated by `L = Δ - ∇V·∇`, whose dual
action on laws, `∫ f d(μP_t) = ∫ P_t f dμ`, is the density flow above, and prove its agreement
with the Wasserstein flow.  When moreover `Z = ∫ e^{-V} dx < ∞`, the law `Z⁻¹e^{-V} dx` is
invariant; for `V = ‖x‖²/2` this is the Ornstein--Uhlenbeck semigroup, with invariant law
`N(0,I)`.  For each agreement theorem, name the Banach realization--for example `L¹` densities
or signed measures--identify the probability orbit inside it, identify the closed generator with
the PDE operator, and only then invoke C₀-semigroup uniqueness; a nonlinear EVI semigroup on `P₂`
is not definitionally the same object as a linear Banach-space semigroup.

*Needs:* items 2 and 7; Layer 10.3; PDE §6.3 (F26); one-parameter semigroups Part A.

**Checks.**

* For `V = x²/2` on `ℝ` (`λ = 1`), the flows from `N(a,1)` and `N(b,1)` are `N(ae^{-t},1)` and
  `N(be^{-t},1)`, at distance `|a-b|e^{-t}`: the contraction rate is attained.
* For `V = 0` (`λ = 0`), the flows from `N(0,s²)` and `N(0,r²)` are `N(0,s²+2t)` and
  `N(0,r²+2t)`, at distance `|√(s²+2t) - √(r²+2t)| ≤ |s-r|`, strictly smaller for `t > 0` and
  `s ≠ r`.
* For `V = (x²-1)²` on `ℝ`, `V'' = 12x² - 4 ≥ -4`, so `λ = -4` and the estimate allows growth
  `e^{4t}`; `∫ e^{-V} dx < ∞`, so the invariant law `Z⁻¹e^{-V} dx` exists although `V` is not
  convex.

### 11.10 Riemannian Wasserstein calculus

On a smooth, connected, complete, finite-dimensional Riemannian manifold `M`, define the
tangent space of `P₂(M)` at `μ` as the `L²(μ)` closure of gradients of compactly
supported smooth functions, and prove items 3 and 4 there, with Tau Ceti's Riemannian volume
`TauCeti.riemannianVolume` in place of Lebesgue measure and the Riemannian gradient of
DifferentialGeometry Layer 12.2.  The identification of the
heat flow with the `W₂` gradient flow of Boltzmann entropy on such a manifold with Ricci
curvature bounded below is the smooth case of Layer 14.7, through Layer 14.6's smooth
characterization of the curvature-dimension condition; its general form is the
identification of the two gradient flows on `CD(K,∞)` spaces (Ambrosio--Gigli--Savaré,
*Calculus and heat flow in metric measure spaces*, Theorem 9.3 in arXiv v4).

*Needs:* items 3--4; Layer 7; DifferentialGeometry Layer 12.2; Tau Ceti
`TauCeti.riemannianVolume`.

**Checks.**

* On flat `ℝⁿ` the definition is item 3's.
* On the circle with its uniform law, the field `∂_θ` satisfies `∫ ⟨∇φ, ∂_θ⟩ dθ = ∫ φ' dθ = 0` for
  every smooth `φ`, so it is orthogonal to the tangent space and rotation is a constant curve.
* At `δ_x` the tangent space is the tangent space `T_xM`.

The named summit is the JKO construction of weak Fokker--Planck and porous-medium
solutions, following the original [Jordan--Kinderlehrer--Otto
paper](https://doi.org/10.1137/S0036141096303359) and AGS.

### Examples

Gaussian heat flow has the expected covariance growth; the quadratic potential
`‖x‖²/2` yields the Ornstein--Uhlenbeck/Fokker--Planck flow; the JKO step
decreases energy; and the metric and weak-distributional formulations agree for a smooth
positive solution.

### Dependencies

Layers 3 and 8--10; Mathlib `InformationTheory.klDiv` and its data-processing inequalities; PDE §6.3 (F26); one-parameter semigroups Part A.

## Layer 12: Fréchet and Wasserstein barycenters

Start with barycenters in an arbitrary measurable metric space, then specialize to the
Wasserstein space.  This prevents Euclidean `W₂` assumptions from contaminating the basic
API.

### 12.1 Fréchet radii and barycenters

For `1 ≤ p < ∞` and a probability law `P` on a measurable pseudometric space whose
distance sections are measurable--for example a Borel metric space--define both the
`Lᵖ` Fréchet radius `x ↦ ‖d(x,·)‖_{Lᵖ(P)}` and the power functional
`x ↦ ∫ d(x,y)^p dP(y)`; prove their exact value relation and equality of minimizer
sets.  Distinguish raw extended minimizers from finite Fréchet barycenters by requiring
finite radius somewhere, so an identically-`∞` functional does not make every point a
barycenter.  Include finite weighted families as a transparent specialization,
allowing zero weights but normalizing total mass.  At `p=∞`, use the essential-
supremum radius and define finite Chebyshev centers separately.  For a Polish metric
space with its Borel structure, prove that this radius equals the supremum of the
distance over the topological support.  Tau Ceti states these on a pseudo-extended-metric
measurable space and for every measure: `TauCeti.frechetRadius` and `TauCeti.frechetPower` are
the two functionals, extended-valued and defined with no moment assumption;
`TauCeti.frechetRadius_rpow_eq_frechetPower` is the value relation
`frechetRadius^p = frechetPower` for `0 < p < ∞` at a point whose distance section is almost
everywhere measurable; `TauCeti.isFrechetBarycenter_iff_forall_frechetPower_le` says that, when
every distance section is almost everywhere measurable, the barycenters are the finite-radius
minimizers of the power functional; `TauCeti.chebyshevRadius` and `TauCeti.IsChebyshevCenter`
are the essential-supremum radius and its finite minimizers; and
`TauCeti.frechetRadius_top_eq_iSup_support` is the support formula at `p = ∞`, on every
hereditarily Lindelöf space whose open sets are measurable, in particular on a Polish space
with its Borel structure.

*Needs:* Mathlib `MeasureTheory.eLpNorm` and measurable distance sections; Tau Ceti
`TauCeti.IsFrechetBarycenter`, `TauCeti.frechetRadius`, `TauCeti.frechetPower`,
`TauCeti.frechetRadius_rpow_eq_frechetPower`,
`TauCeti.isFrechetBarycenter_iff_forall_frechetPower_le`, `TauCeti.chebyshevRadius`,
`TauCeti.IsChebyshevCenter` and `TauCeti.frechetRadius_top_eq_iSup_support`.

**Checks.**

* For `P = (δ₀+δ₂)/2` on `ℝ` and `p = 2`, the barycenter is `1` with radius `1`.
* For the same `P` and `p = 1`, every point of `[0,2]` minimizes `∫ |x-y| dP`, so barycenters need
  not be unique.
* For the Cauchy law and `p = 1`, `∫ |x-y| dP = ∞` at every `x`: every point is a raw extended
  minimizer and none is a finite barycenter.

### 12.2 Existence on proper spaces and CAT(0) uniqueness

State the proper-space theorem explicitly rather than as "existence in proper settings".
Write `R_p(x)=‖d(x,·)‖_{Lᵖ(P)}` and assume it finite at one point.  Minkowski's
inequality then gives `|R_p(x)-R_p(y)| ≤ d(x,y)`, so `R_p` is `1`-Lipschitz and lower
semicontinuity is automatic; the reverse triangle inequality gives
`R_p(x) ≥ d(x,x₀)-R_p(x₀)`, so every finite-radius sublevel is bounded.  On a proper
metric space those sublevels are therefore compact, the radius attains its minimum, and
the finite minimizer set is compact--prove exactly that chain, and the analogous
essential-supremum argument at `p=∞`.  Any broader existence criterion must name the
compact-sublevel or coercive-function hypothesis that replaces properness rather than
gesturing at coercivity.  After Layer 8's geodesic infrastructure, define a reusable
CAT(0)/Hadamard-space predicate, prove the CN inequality and strong convexity of squared
distance, and derive quadratic barycenter uniqueness; state no uniqueness theorem in a
general geodesic space.  The chain is in Tau Ceti for a probability law on a pseudometric space
with measurable open sets and `1 ≤ p ≤ ∞`, the radius being finite at one point:
`TauCeti.lipschitzWith_one_toReal_frechetRadius` is the `1`-Lipschitz bound, and on a proper
space `TauCeti.isCompact_frechetRadius_sublevel`, `TauCeti.exists_isFrechetBarycenter` and
`TauCeti.isCompact_frechetBarycenters` are compactness of the sublevels, existence of a
barycenter and compactness of the set of barycenters.  The CAT(0) predicate is
`TauCeti.IsCATZeroSpace`, a geodesic space with the CN inequality at every midpoint, and
`TauCeti.subsingleton_frechetBarycenters_two` is uniqueness: on a CAT(0) metric space with
measurable open sets a nonzero measure has at most one quadratic barycenter.

*Needs:* item 1; Layer 8.1; Tau Ceti `TauCeti.lipschitzWith_one_toReal_frechetRadius`,
`TauCeti.isCompact_frechetRadius_sublevel`, `TauCeti.exists_isFrechetBarycenter`,
`TauCeti.isCompact_frechetBarycenters`, `TauCeti.IsCATZeroSpace` and
`TauCeti.subsingleton_frechetBarycenters_two`.

**Checks.**

* `ℝⁿ` is CAT(0), with equality in the CN inequality.
* The circle is not CAT(0): antipodal points have two midpoints.
* The tripod is CAT(0) and its quadratic barycenters are unique.

### 12.3 Finitely supported population laws

Fix the carrier regime used by items 4--5 and 8: `1 ≤ p < ∞` and a proper metric space `X`
with its Borel σ-algebra.  It contains Le Gouic--Loubes' separable, locally compact, complete,
geodesic spaces, which are proper by the Hopf--Rinow--Cohn-Vossen theorem, and needs no
geodesicity: the integers in `ℝ` are proper and not geodesic.  Build the base-space selection first, since the
existence theorem consumes it.  Prove Le Gouic--Loubes' Lemma 7 (arXiv:1506.04153v2, p. 11):
for finitely many positive weights summing to one there is a Borel *barycenter application*
`X^J → X` sending a `J`-tuple to a barycenter of the corresponding weighted combination of Dirac
laws; on a proper metric space with its Borel σ-algebra, for `1 ≤ p < ∞` and nonnegative weights
summing to one, this is Tau Ceti's
`TauCeti.exists_measurable_isFrechetBarycenter_sum_smul_dirac`.  Consume it for their Theorem 8
(p. 11), the finitely supported case: for
`P = ∑_j λ_j δ_{μ_j}` in `P_p(P_p(X))`, prove the multi-marginal formulation and
existence of a barycenter.  Do not assume or claim that `P_p(X)` itself is proper.

*Needs:* items 1--2; Layer 0.5; Tau Ceti `TauCeti.WassersteinSpace` and
`TauCeti.exists_measurable_isFrechetBarycenter_sum_smul_dirac`.
Implemented in Tau Ceti by
`TauCeti.WassersteinSpace.isFrechetBarycenter_sum_smul_dirac_iff_isMinOn` and
`TauCeti.WassersteinSpace.exists_isFrechetBarycenter_sum_smul_dirac`.

### 12.4 Stability of barycenters

If `P_j → P` in `W_p(P_p(X))` and `μ_j` is a barycenter of `P_j`, prove that every limit point of
`(μ_j)` is a barycenter of `P`; on every pseudo-extended-metric space with measurable opens and
for laws converging in `W_p`, this is Tau Ceti's `TauCeti.isFrechetBarycenter_of_mapClusterPt`.
Prove that `(μ_j)` is precompact in `P_p(X)` when each `P_j` is finitely supported, in item 3's
proper regime (`TauCeti.WassersteinSpace.isCompact_closure_range_of_isFrechetBarycenter`), which
is the case item 5 consumes, and for general `P_j` on a separable, locally compact geodesic space
(Le Gouic--Loubes, arXiv:1506.04153v2, Theorem 3, p. 7, whose proof uses that closed balls are
compact).  Uniqueness may upgrade this to convergence of the full sequence, but it is not part of
the compactness theorem.

*Needs:* item 3; Layer 3.3.
Tau Ceti declares or proves `TauCeti.isFrechetBarycenter_of_mapClusterPt` and
`TauCeti.WassersteinSpace.isCompact_closure_range_of_isFrechetBarycenter`.

**Checks.**

* For `P_j = δ_{δ_{1/j}}`, the barycenters `δ_{1/j}` converge to `δ₀`, the barycenter of the limit
  `δ_{δ₀}`.
* For `P_j = (δ_{δ₀} + δ_{δ₂})/2` at `p = 1`, every law on `[0,2]` is a barycenter (item 5's third
  Check), so the alternating choice `δ₀, δ₂, δ₀, …` has two limit points, both barycenters of the
  constant limit: without uniqueness the sequence need not converge.
* For `P_j = (1-1/j)δ_{δ₀} + (1/j)δ_{δ_j}` at `p = 2`, `W₂(P_j, δ_{δ₀})² = (1/j)·j² = j` does not
  tend to `0`, so the hypothesis fails, as it must: the barycenter `δ_{1}` of `P_j` does not
  approach `δ₀`.

### 12.5 Population barycenters

For general `P ∈ P_p(P_p(X))` in item 3's carrier regime, define population Wasserstein
barycenters and prove the Le Gouic--Loubes existence theorem (arXiv:1506.04153v2, Theorem 2,
p. 6, stated for separable, locally compact geodesic spaces, whose proof uses that closed balls
are compact): the Fréchet functional is measurable and attains its minimum; for a probability
law `P` of finite `p`-th moment on `P_p(X)` over a proper metric space, with no geodesicity, this
is Tau Ceti's `TauCeti.WassersteinSpace.exists_isFrechetBarycenter`.  Assemble it
in their order--item 3's finitely supported case, density of finitely supported laws in
`P_p(P_p(X))`, and item 4 applied to the approximating sequence--so that no step reaches forward
to a later item.  For the population law `P = (δ_{δ₀} + δ_{δ₂})/2` on `ℝ` at `p = 2`, the
functional is `ν ↦ (1/2)∫x² dν + (1/2)∫(x-2)² dν = ∫(x-1)² dν + 1`, so `δ₁` is the barycenter,
uniquely, with value `1`.

*Needs:* items 3--4; Layer 3.3; Tau Ceti `TauCeti.WassersteinSpace.exists_isFrechetBarycenter`.

**Checks.**

* For `P = (δ_{δ₀}+δ_{δ₂})/2` at `p = 2`, the functional is `∫(x-1)² dν + 1`, minimized exactly at
  `δ₁` with value `1`.
* For `P = δ_{μ}` the barycenter is `μ`, with value `0`.
* For `P = (δ_{δ₀}+δ_{δ₂})/2` at `p = 1`, every law concentrated on `[0,2]` is a barycenter, with
  value `1`.

### 12.6 The multi-marginal formulation

Relate finite Euclidean `W₂` barycenters to a multi-marginal transport problem through
a measurable pointwise-barycenter selector, which item 3 supplies in general and which
is the explicit weighted average on `ℝⁿ`.  Prove the multi-marginal primal and dual
formulas rather than using the selector without a measurability theorem.

*Needs:* item 3; Layers 0.5 and 2.6.
Tau Ceti declares or proves `TauCeti.exists_isMultiCoupling_isMinOn_lintegral`,
`TauCeti.iInf_sum_mul_wassersteinEDist_rpow_eq`, `TauCeti.iInf_sum_mul_wassersteinEDist_sq_eq` and
`TauCeti.isFrechetBarycenter_two_iff_exists_isMinOn_lintegral_map_eq`.

### 12.7 Agueh--Carlier existence and uniqueness

For normalized nonnegative weights `λ_i`, define Agueh--Carlier's "vanishes on small
sets" predicate exactly as in their Definition 3.2: `μ(A)=0` for every Borel `A⊆ℝⁿ`
whose Hausdorff dimension is at most `n-1`.  For inputs `μ_i ∈ P₂(ℝⁿ)` of which one
with positive weight has this property, prove that exactly one probability measure
minimizes `ν ↦ ∑ i, λ_i W₂(ν,μ_i)²` (existence: their Proposition 2.3; uniqueness: their
Proposition 3.5); this is
`existsUnique_isMinOn_sum_wassersteinEDist_sq_of_dimH_le`.  The bound "at most `n-1`" is
load-bearing: the two segment laws in the Examples below vanish on every set of
dimension less than `n-1 = 1` and have two barycenters.  Absolute continuity is a
standard sufficient corollary.  Develop the multi-map optimality conditions.  If that
input has density in `L∞`, prove the separate Agueh--Carlier estimate
`‖ρ_bar‖_∞ ≤ λ_j^(-n) ‖ρ_j‖_∞` (their Theorem 5.1 and Remark 5.2); do not infer this
density bound from the small-set predicate alone.

*Needs:* item 6; Layer 5.5; Mathlib `dimH`.
Tau Ceti declares or proves `TauCeti.WassersteinSpace.subsingleton_frechetBarycenters`,
`TauCeti.WassersteinSpace.subsingleton_frechetBarycenters_two_sum_smul_dirac` and
`TauCeti.wassersteinEDist_two_smul_add_smul_sq_lt`.

**Checks.**

* Every law absolutely continuous with respect to Lebesgue measure on `ℝⁿ` vanishes on small sets,
  and `δ₀` does not when `n ≥ 1`.
* On `ℝ` the Cantor measure vanishes on every set of Hausdorff dimension `0` and is singular: the
  predicate is weaker than absolute continuity.
* For `n = 0` no nonempty set has Hausdorff dimension at most `-1`, so every law vanishes on small
  sets, and `δ₀`, the only probability law on `ℝ⁰`, is the unique barycenter.

### 12.8 One-dimensional, Gaussian, and empirical barycenters

Prove the quadratic one-dimensional formula
`Q_bar(s)=∑ i, λ_i Q_i(s)`.  For normalized nonnegative weights and Gaussian
inputs `N(m_i,S_i)`, assume some `λ_j>0` has `S_j` positive definite.  Prove that the
unique Gaussian barycenter has mean `m̄=∑_i λ_i m_i`, positive-definite covariance
`S`, and the exact fixed-point equation
`S=∑_i λ_i (S^(1/2) S_i S^(1/2))^(1/2)` (Agueh--Carlier, Theorem 6.1, when every `S_i` is
positive definite; Álvarez-Esteban--del Barrio--Cuesta-Albertos--Matrán, Theorem 4.2 and
Corollary 4.5, when one is); in Lean, with the barycenters taken over all probability
measures, this is
`exists_posDef_forall_isMinOn_sum_wassersteinEDist_sq_multivariateGaussian_iff`.  Given a
positive-definite solution `S` of the fixed-point equation, the barycenter statement is Tau
Ceti's `TauCeti.Probability.isFrechetBarycenter_sum_smul_dirac_multivariateGaussian`, unique by
`TauCeti.Probability.frechetBarycenters_sum_smul_dirac_multivariateGaussian`; the remaining
content of the headline is existence of that solution.  Treat
the all-semidefinite tier separately without importing uniqueness or inverse-matrix
claims from the nondegenerate theorem.
For two inputs with weights `1-t,t`, prove that the `p=2` barycenter is at geodesic time
`t`; for `1<p<∞`, pin the general time
`t^(1/(p-1)) / ((1-t)^(1/(p-1)) + t^(1/(p-1)))`.  Tau Ceti proves the one-dimensional formula
and the two-input statements: `TauCeti.isFrechetBarycenter_two_iff_quantile_ae_eq` and
`TauCeti.existsUnique_isFrechetBarycenter_two` (for weights of sum `1`, the quadratic barycenter
in `P₂(ℝ)` of finitely many laws exists, is unique, and has quantile `∑ λ_i Q_i` a.e.), and, in
any pseudometric space, `TauCeti.IsGeodesicSegment.isFrechetBarycenter_two` and
`TauCeti.IsGeodesicSegment.isFrechetBarycenter_twoPointBarycenterTime` (the point of a geodesic
segment at time `t`, respectively at the time `TauCeti.twoPointBarycenterTime p t` displayed above
for `1 < p < ∞`, is a barycenter of `(1-t)δ_x + tδ_y`).  For i.i.d. random input laws with
distribution `P ∈ P_p(P_p(X))` in item 3's carrier regime, prove the empirical laws
converge almost surely to `P` in `W_p` by building the required finite-moment strong
law.  Each empirical law is finitely supported, so item 3 already gives it a barycenter;
consume item 4 on that almost-sure event.  For every choice of barycenter of each
empirical law the resulting sequence is precompact, every limit is a population
barycenter, and the full sequence converges when that barycenter is unique.  State it
in exactly that choice-free form.  Item 3's Borel barycenter application selects in the
base space `X`, and the local compactness it needs is not available for `P_p(X)`, so do
not silently treat "the" empirical barycenter as a random element; a statement about a
random element needs its own measurable-selection theorem, stated and proved here.

*Needs:* items 3--4; Layers 3.7, 5.3 and 9.6; Tau Ceti
`TauCeti.Probability.isFrechetBarycenter_sum_smul_dirac_multivariateGaussian`,
`TauCeti.isFrechetBarycenter_two_iff_quantile_ae_eq` and
`TauCeti.IsGeodesicSegment.isFrechetBarycenter_twoPointBarycenterTime`.
Tau Ceti declares or proves `TauCeti.WassersteinSpace.existsUnique_isFrechetBarycenter_real`,
`TauCeti.WassersteinSpace.tendsto_of_isFrechetBarycenter_empiricalMeasure_ae` and
`TauCeti.Probability.isFrechetBarycenter_two_multivariateGaussian`.

The population theory follows Le Gouic--Loubes,
[arXiv:1506.04153](https://arxiv.org/abs/1506.04153); the finite Euclidean theory follows
Agueh--Carlier's [barycenter paper](https://doi.org/10.1137/100805741).

### Examples

Barycenters of Dirac laws reduce to base-space Fréchet means; a
two-law quadratic barycenter lies at the weight-time of a displacement geodesic;
one-dimensional quadratic quantiles average with the input weights; and quadratic
Gaussian barycenters with a positive-weight nondegenerate input have mean `m̄` and satisfy
the exact positive-definite matrix equation above.  A nonquadratic two-law example
checks the reparameterized time above.  Two uniform laws on the segments `{(s,0) | |s| ≤ 1}` and `{(0,t) | |t| ≤ 1}` in `ℝ²`,
with weights `1/2`, both vanish on every set of Hausdorff dimension less than `1`, yet the
couplings `t = s` and `t = -s` give two different midpoint laws, each of quadratic objective
`(1/4)E(s² + t²) = 1/6`; the predicate of item 7, with dimension at most `n - 1 = 1`, excludes
both laws, since each gives mass `1` to its segment.

### Dependencies

Layers 0.5, 2.6, 3, 5, 8 and 9.

## Layer 13: entropic transport, Sinkhorn, and Schrödinger bridges

Build this from the finite/probability `InformationTheory.klDiv` slice in Layer 11.1, not
from the signed Boltzmann entropy.  Matrix scaling is a finite specialization of a
measurable entropy-projection theory, not the definition of entropic transport.

### 13A. Static entropic transport

### 13.1 The static Schrödinger problem

Define the static Schrödinger problem
`inf { klDiv π R | π ∈ Coupling μ ν }` for an explicit reference probability measure
or finite reference measure `R`.  Define cost-regularized OT separately as
`∫ c dπ + ε klDiv π (μ ⊗ ν)`.  For `ε>0` and
`Z=∫ exp(-c/ε)d(μ⊗ν)` satisfying `0<Z<∞`, define the Gibbs probability
`R=Z⁻¹ exp(-c/ε)(μ⊗ν)` and prove the exact identity
`∫ c dπ+ε klDiv π (μ⊗ν)=ε klDiv π R-ε log Z`.  Keep `Z=0` and
support-constrained infinite costs as separate degenerate statements.

*Needs:* Layers 0.1 and 11.1; Mathlib `InformationTheory.klDiv`; Tau Ceti
`TauCeti.schroedingerValue` and `TauCeti.entropicTransportCost`.

**Checks.**

* For `c ≡ 0` and reference `μ ⊗ ν` the regularized optimum is the product coupling, at value `0`.
* For a constant cost `c ≡ k`, `Z = e^{-k/ε}`, `R = μ ⊗ ν`, and both sides of the Gibbs identity
  equal `k + ε klDiv π (μ⊗ν)`.
* For `μ = ν = (δ₀+δ₁)/2`, `c = |x-y|` and `ε = 1`, the optimizer is
  `π_{00} = π_{11} = 1/(2(1+e^{-1}))`, `π_{01} = π_{10} = e^{-1}/(2(1+e^{-1}))`, whose row sums
  are `1/2`.

### 13.2 Existence, uniqueness, and stability of entropic minimizers

Let `μ` and `ν` be finite measures on arbitrary measurable spaces `X` and `Y`, and `R` a
finite measure on `X × Y`.  If `{ π ∈ Π(μ,ν) | klDiv π R < ∞ }` is nonempty, prove existence and
uniqueness of the entropy minimizer (Nutz, *Introduction to Entropic Optimal Transport*,
Theorem 2.1, p. 16, for probability measures; uniqueness is strict convexity of `klDiv · R` on
the convex set `Π(μ,ν)`, and existence is lower semicontinuity in variation).  This is Tau
Ceti's `TauCeti.existsUnique_isCoupling_klDiv_eq_schroedingerValue`, which needs no separability;
Nutz's standing separability assumption (his §2, p. 16) is used only for the potentials of
item 3.  Name
the data that varies before claiming stability, since the marginals, the reference `R`,
the cost, and `ε` give different theorems.  On fixed Polish `X` and `Y`, the intended
statement starts from joint weak lower semicontinuity--`π_n ⇒ π` and `R_n ⇒ R` imply
`klDiv π R ≤ liminf_n klDiv π_n R_n`--and adds `μ_n ⇒ μ`, `ν_n ⇒ ν` plus tightness to
get cluster points of feasible minimizers together with the liminf inequality.  Mark the
boundary explicitly: convergence of values and of minimizers needs a recovery sequence
of couplings with the exact varying marginals, so state either that construction or a
separately sourced sufficient theorem supplying it, and do not present the liminf half
as the whole result.  Keep topology out of the root definition.

*Needs:* item 1; Tau Ceti `TauCeti.existsUnique_isCoupling_klDiv_eq_schroedingerValue`.
Tau Ceti declares or proves `TauCeti.tendsto_of_klDiv_eq_schroedingerValue` and
`TauCeti.lowerSemicontinuous_entropicTransportCost`.

### 13.3 Entropic duality and Schrödinger potentials

Prove entropic duality and the Gibbs/Schrödinger density
`dπ/d(μ⊗ν)=exp((φ⊕ψ-c)/ε)`, splitting the full-support and support-constrained regimes
rather than saying "up to constants" once.  Under finite-entropy feasibility and
`R ∼ μ⊗ν`--which in the Gibbs formulation requires the cost to be finite `μ⊗ν`-almost
everywhere--and for separable probability spaces `(X,μ)`, `(Y,ν)` (Nutz's standing assumption,
§2, p. 16: a countable family of measurable sets approximates every measurable set in
measure, Mathlib's `MeasureTheory.IsSeparable`), Nutz's Theorem 2.1(a) gives real measurable
potentials, unique modulo one global additive constant
(`exists_rnDeriv_eq_exp_add_of_isCoupling_of_forall_klDiv_le`).  For probability marginals, a
bounded measurable cost and `ε > 0`, dual attainment by bounded measurable potentials with value
`OT_ε(μ,ν)`, and uniqueness up to one additive constant of integrable maximizing pairs with
integrable Gibbs factors, are Tau
Ceti's `TauCeti.exists_entropicDualValue_eq_toReal_entropicTransportCost` and
`TauCeti.exists_ae_eq_add_const_of_entropicDualValue_eq_toReal_entropicTransportCost`.  Integrability of the potentials is a further conclusion,
under `log(dR/d(μ⊗ν)) ∈ L¹(μ⊗ν)`, equivalently `c ∈ L¹(μ⊗ν)` after normalization; state
it as such.  If only `R ≪ μ⊗ν` and the reference has support zeros, uniqueness weakens
to one normalization per connected component of the bipartite support graph, not one
additive constant: the two-point diagonal reference already exhibits this, since its two
diagonal equations constrain `φ_i+ψ_i` independently and leave a constant on each
component.  Name that support-component theorem separately, and treat infinite costs
under it.

*Needs:* items 1--2; Layer 2.1; Mathlib `MeasureTheory.IsSeparable`; Tau Ceti
`TauCeti.exists_entropicDualValue_eq_toReal_entropicTransportCost` and
`TauCeti.exists_ae_eq_add_const_of_entropicDualValue_eq_toReal_entropicTransportCost`.
Implemented in Tau Ceti by
`TauCeti.IsCoupling.exists_eq_withDensity_exp_add_of_klDiv_eq_schroedingerValue` and
`TauCeti.exists_isCoupling_lintegral_add_mul_klDiv_eq_entropicTransportCost`.

### 13.4 Differentiability and Sinkhorn divergences

Say which function is being differentiated before asking for smoothness: the regularized
value may vary in the marginals, in the cost or Gibbs kernel, or in `ε`, and the
topology and the differentiability statement differ in each case.  Prove the finite
theorem explicitly.  On finite spaces, for `ε>0`, a strictly positive Gibbs kernel
`K_{ij}=exp(-C_{ij}/ε)`, and strictly positive marginals, prove smooth dependence of the
value and of the normalized dual potentials on `(a,b,C)`, together with the envelope
formula `D_C OT_ε[H]=∑_{i,j} π^*_{ij} H_{ij}`, which is a genuine derivative because the
regularized optimizer is unique.  For the marginal directions, pin the dual convention
to item 1's marginal-dependent reference `a ⊗ b`; with those potentials the intrinsic
formula on tangent perturbations `∑_i h_i = ∑_j k_j = 0` is
`D_{a,b} OT_ε[(h,k)] = ∑_i f_i h_i + ∑_j g_j k_j`.
Potentials for a fixed reference measure are shifted by marginal entropy terms and must
not be substituted into it.  Distinguish differentiation in `C` from differentiation in
`K`: under `C=-ε log K` the latter acquires the factor `-ε/K_{ij}`.  Smoothness in the
marginals needs the relative interior, so do not state it with zero coordinates allowed.
Boundary continuity is then a separate statement: in the compact continuous-kernel
setting, name the topology on measures and the intended derivative--directional,
Fréchet, or Hadamard--or restrict this item to the one continuity theorem the
Sinkhorn-divergence result below actually consumes.  Keep strict convexity of the plan
objective distinct from the generally non-strict marginal-value functional.  Define the
debiased
Sinkhorn divergence by
`S_ε(μ,ν)=OT_ε(μ,ν)-OT_ε(μ,μ)/2-OT_ε(ν,ν)/2`;
first build continuous positive-definite and universal-kernel predicates on compact
spaces, with universality expressed by density of kernel sections in `C(X)`, and the
signed-Radon-measure energy/separation lemmas used below.  Then formalize
[Feydy--Séjourné--Vialard--Amari--Trouvé--Peyré, Theorem
1](https://proceedings.mlr.press/v89/feydy19a/feydy19a.pdf): on a compact metric space,
for a symmetric Lipschitz cost `C` whose Gibbs kernel
`k_ε(x,y)=exp(-C(x,y)/ε)` is positive universal, define the Sinkhorn negentropy
`F_ε(α)=-OT_ε(α,α)/2`, prove its strict convexity, and prove `S_ε ≥ 0`, definiteness,
separate convexity/smoothness, and metrization of weak convergence.  Nonnegativity and
definiteness on a compact space, for a bounded measurable cost whose Gibbs kernel is continuous
and positive semidefinite (and universal, for definiteness, on a Borel space with
`HasOuterApproxClosed`), are Tau Ceti's `TauCeti.sinkhornDivergence_nonneg` and
`TauCeti.sinkhornDivergence_eq_zero_iff` for `TauCeti.sinkhornDivergence`.  Distinguish pointwise
positivity from positive-definiteness and universality.  Give bounded-support
Euclidean `C(x,y)=‖x-y‖` and `‖x-y‖²` specializations.  Strict convexity of the plan
objective alone does not imply these claims as functions of marginals or cost.

*Needs:* items 1--3; Layer 2.3; Tau Ceti `TauCeti.sinkhornDivergence`,
`TauCeti.sinkhornDivergence_nonneg` and `TauCeti.sinkhornDivergence_eq_zero_iff`.

**Checks.**

* `S_ε(μ,μ) = 0` for every `μ`.
* For `c ≡ 0`, `OT_ε ≡ 0` and `S_ε ≡ 0`: the divergence is not definite, as the constant Gibbs
  kernel is not universal.
* For Dirac laws the coupling is unique and has relative entropy `0`, so
  `S_ε(δ_x,δ_y) = c(x,y) - (c(x,x)+c(y,y))/2`, which is `‖x-y‖²` for `c = ‖x-y‖²`.

### 13.5 The zero-temperature limit

Write `C_ε = inf_π [∫ c dπ + ε klDiv π (μ⊗ν)]` for `ε > 0` and `C₀` for the transport cost of
`c : X × Y → [0,∞]`.  With no hypothesis on the cost or the spaces, `C_ε` decreases as `ε ↓ 0` to
the infimum of `∫ c dπ` over the couplings of finite `klDiv π (μ⊗ν)` (Tau Ceti's
`TauCeti.tendsto_entropicTransportCost_nhdsGT_zero`), and this limit can exceed `C₀`.  Prove the
following three parts, each under its own hypotheses.

1. *Convergence of values.*  `C_ε → C₀` for a finite `μ` and a cost that, for every `η > 0`,
   varies by at most `η` on the product cells of some finite measurable partitions of `X` and `Y`
   (Tau Ceti's `TauCeti.tendsto_entropicTransportCost_transportCost`; uniformly continuous costs on
   totally bounded spaces are of this kind).  `C_ε → C₀` also for a continuous cost
   `c : X × Y → [0,∞)` on pseudometric spaces with measurable opens, tight marginals with `μ`
   finite, and a split bound `c(x,y) ≤ c₁(x) + c₂(y)` with `∫ c₁ dμ < ∞` and `∫ c₂ dν < ∞` (Tau
   Ceti's `TauCeti.tendsto_entropicTransportCost_transportCost_of_le_add`; Nutz, *Introduction to
   Entropic Optimal Transport*, Theorem 5.10(a), p. 47, on Polish spaces, and Corollary 5.4,
   p. 43, for bounded continuous costs).  Lower semicontinuity and boundedness of the cost do not
   suffice (Nutz, Example 5.1, p. 41, recorded below).
2. *Optimality of cluster points.*  For probability marginals and a lower semicontinuous cost with
   `C_ε → C₀`, every weak limit of `ε`-optimizers along `ε → 0⁺` is an optimal plan (Tau Ceti's
   `TauCeti.isOptimalCoupling_of_tendsto_of_entropicTransportCost`, on factors with measurable
   opens and `T1` spaces of probability measures and a pseudometrizable product with measurable
   opens; Nutz, Proposition 5.9, p. 46).  Under part 1's hypotheses on Polish spaces the
   optimizers have weak cluster points by Layer 1.3, and all of them are optimal (Nutz,
   Theorem 5.10(b), p. 47).  Package this as Γ-convergence of the regularized functionals to the
   transport functional with equicoercivity (Layer 10.6) only under part 1's hypotheses, which
   supply the recovery sequences.
3. *Selection.*  If some optimal plan `σ` has finite `klDiv σ (μ⊗ν)`, then `C_ε → C₀` with no
   hypothesis on the cost, since `C₀ ≤ C_ε ≤ C₀ + ε klDiv σ (μ⊗ν)` (Tau Ceti's
   `TauCeti.IsOptimalCoupling.tendsto_entropicTransportCost`).  On Polish spaces, for a lower
   semicontinuous cost, the optimal face then has exactly one plan `π*` of least
   `klDiv (·) (μ⊗ν)` (`TauCeti.existsUnique_isOptimalCoupling_isMinOn_klDiv`), and when moreover
   `C₀ < ∞` the `ε`-optimizers converge weakly to `π*` as `ε → 0⁺`
   (`TauCeti.tendsto_of_entropicTransportCost_eq`).  On arbitrary measurable spaces, for a
   measurable cost with `C₀ < ∞`, prove Nutz's stronger conclusion: the `ε`-optimizers converge in
   total variation to the unique optimal plan `π*` of least `klDiv (·) (μ⊗ν)`, and
   `klDiv π_ε (μ⊗ν) → klDiv π* (μ⊗ν)` (Nutz, Theorem 5.5, p. 44).

Do not claim potential convergence from plan convergence alone.

*Needs:* items 1--2; Layers 1.3, 1.6 and 10.6; Tau Ceti
`TauCeti.tendsto_entropicTransportCost_nhdsGT_zero`,
`TauCeti.tendsto_entropicTransportCost_transportCost`,
`TauCeti.tendsto_entropicTransportCost_transportCost_of_le_add`,
`TauCeti.isOptimalCoupling_of_tendsto_of_entropicTransportCost`,
`TauCeti.IsOptimalCoupling.tendsto_entropicTransportCost`,
`TauCeti.existsUnique_isOptimalCoupling_isMinOn_klDiv` and
`TauCeti.tendsto_of_entropicTransportCost_eq`.

**Checks.**

* For `μ = ν` uniform on `[0,1]` and `c = 1` off the diagonal and `0` on it, a bounded lower
  semicontinuous cost, `C₀ = 0` through the diagonal coupling; every coupling of finite entropy is
  absolutely continuous with respect to `μ⊗ν`, which gives the diagonal measure `0`, so `C_ε = 1`
  for every `ε > 0`, attained by `μ⊗ν`, which is not optimal.  The cost is not continuous, so
  part 1 does not apply.
* For the continuous cost `c = |x-y|` on the same marginals, `c ≤ 1`, so part 1 applies and
  `C_ε → C₀ = 0`.
* For `μ = ν = (δ₀+δ₁)/2` and `c = |x-y|`, the only optimal plan is `(δ_{(0,0)}+δ_{(1,1)})/2`, of
  relative entropy `log 2`, and the Gibbs form of item 1 (13.1) gives the optimizer
  `π_{00} = π_{11} = 1/(2(1+e^{-1/ε}))`, `π_{01} = π_{10} = e^{-1/ε}/(2(1+e^{-1/ε}))`, which
  converges to it as `ε → 0⁺`, as part 3 requires.

### 13.6 Entropic barycenters

Write the entropic barycenter objective out, since several inequivalent functionals carry
that name.  Take minimizers over `ν` of
`F_ε(ν) = ∑_i λ_i inf_{π ∈ Π(ν,μ_i)} [∫ d(x,y)^p dπ + ε klDiv π (ν⊗μ_i)]`,
and record that regularizing the entropy of the barycenter itself, using a fixed ambient
reference, or replacing `OT_ε` by the debiased Sinkhorn divergence are different
functionals with different minimizers and bias (Chizat, *Doubly regularized entropic
Wasserstein barycenters*, §§1.1--1.3, pp. 2--4, on a compact convex subset of `ℝᵈ`:
Definition 1.1 and Table 1 separate the inner-regularized objective, which is `F_ε`, from the
outer-regularized, Schrödinger and Sinkhorn-divergence barycenters).  Fix the optimization
domain and every entropy reference explicitly.  Then state the convergence theorem with its topology and
its mechanism: Γ-convergence of exactly these objectives, equicoercivity giving cluster
points, and uniqueness of the unregularized barycenter giving convergence of the full
sequence.  On a Polish metric space, for `0 < p < ∞` and inputs of finite `p`-moment, the
Γ-convergence of `F_ε` to `∑ λ_i W_p(·,μ_i)^p` for the weak topology is Tau Ceti's
`TauCeti.tendstoGamma_entropicBarycenterCost` for `TauCeti.entropicBarycenterCost`; on a nonempty
compact metric space, existence of minimizers of `F_ε` and their weak convergence to the
unregularized barycenter when it is unique are `TauCeti.exists_isMinOn_entropicBarycenterCost`
and `TauCeti.tendsto_of_isMinOn_entropicBarycenterCost`.

*Needs:* items 1--2; Layers 10.6 and 12; Tau Ceti `TauCeti.entropicBarycenterCost`,
`TauCeti.tendstoGamma_entropicBarycenterCost`, `TauCeti.exists_isMinOn_entropicBarycenterCost` and
`TauCeti.tendsto_of_isMinOn_entropicBarycenterCost`.

**Checks.**

* For inputs `δ₀`, `δ₂` with weights `1/2` and `p = 2`, every coupling with a Dirac input is a
  product of relative entropy `0`, so `F_ε(ν) = ∫(x-1)² dν + 1`, minimized at `δ₁` for every `ε`.
* With entropy regularization of the barycenter itself, every Dirac candidate has infinite
  penalty, so `δ₁` is no longer a minimizer: the two functionals differ.
* At `ε = 0` the objective is the quadratic barycenter functional of Layer 12.

### 13B. Iterative proportional fitting and finite Sinkhorn

### 13.7 Iterative proportional fitting

Define alternating marginal normalization as alternating relative-entropy projections
on general measurable spaces.  Prove that each half-step enforces one marginal, the KL
Pythagorean/telescoping identities, and convergence of marginal errors under a feasible
finite-entropy hypothesis (Nutz, *Introduction to Entropic Optimal Transport*, §6, p. 51, for
probability spaces and a reference `R ≪ μ⊗ν` admitting a coupling of finite entropy; Lemma 6.4,
p. 55, for the half-step identities, Proposition 6.5, p. 56, for the Pythagorean identity
`klDiv π* πₙ = klDiv π* R - ∑_{0 ≤ t ≤ n} klDiv π_t π_{t-1}` with `π_{-1} = R`, and Corollary 6.6, p. 56, for
convergence of the marginals in relative entropy and in total variation).  Add convergence of
couplings and potentials only with the required tightness, exponential-integrability, or
bounded-kernel hypotheses: for `dR = e^{-c} d(μ⊗ν)` with `c` bounded below and
`∫ e^{rc} d(μ⊗ν) < ∞` for some `r > 1`, the potentials converge pointwise and in every `Lᵖ`,
`1 ≤ p < ∞`, and the couplings converge in relative entropy and in total variation to the
Schrödinger bridge (Nutz, Theorem 6.15, p. 62).

*Needs:* items 1--2; Layer 11.1.
Tau Ceti declares or proves `MeasureTheory.Measure.proportionalFitting`,
`TauCeti.klDiv_eq_add_klDiv_proportionalFittingStep`,
`TauCeti.klDiv_eq_sum_add_klDiv_proportionalFitting` and
`TauCeti.tendsto_klDiv_fst_proportionalFitting`.

**Checks.**

* For `K = [[2,1],[1,2]]` with uniform marginals `1/2`, one row normalization gives
  `[[1/3,1/6],[1/6,1/3]]`, whose rows and columns already sum to `1/2`.
* For `K = [[1,1],[0,1]]` with uniform marginals, the alternating normalizations converge to
  `[[1/2,0],[0,1/2]]`, which is not of the form `D₁KD₂` with positive diagonals because its
  `(0,1)` entry vanishes.
* Each half-step enforces its marginal exactly: after a row step the row sums are the prescribed
  ones whatever the input.

### 13.8 Finite matrix scaling

Specialize to finite probability vectors and a rectangular nonnegative matrix kernel.
Characterize feasibility by nonemptiness of the prescribed-marginal transport polytope
on `supp K`, and characterize a scaling using every allowed edge by the corresponding
relative-interior/full-support condition.  Scaling-vector ambiguity is one scalar per
connected component of the support bipartite graph.  State the classical total-support
criterion only for square doubly stochastic scaling (Sinkhorn--Knopp 1967, Theorem, p. 344:
a nonnegative square matrix has a doubly stochastic scaling `D₁AD₂` exactly when it has total
support, `D₁`, `D₂` being unique up to a scalar exactly when it is fully indecomposable), and
prove the rectangular scaling theorem directly for a strictly positive kernel (Tau Ceti's
`Matrix.exists_sinkhorn_scaling`).

*Needs:* item 7; Tau Ceti `Matrix.exists_sinkhorn_scaling`; Sinkhorn--Knopp 1967.
Tau Ceti declares or proves `Matrix.exists_sinkhorn_scaling_iff` and
`Matrix.hasTotalSupport_iff_exists_mem_doublyStochastic`.

### 13.9 Convergence of the Sinkhorn iteration

Prove convergence of alternating row/column scaling.  For a strictly positive finite
kernel, build Hilbert's projective metric and Birkhoff contraction, define
`Δ(K)=sup_{i,i',j,j'} log((K_ij K_i'j')/(K_ij' K_i'j))`, and prove contraction
factor `tanh(Δ(K)/4)` for each positive kernel map (hence the explicitly multiplied
factors for a full row--column iteration) (Peyré--Cuturi, *Computational Optimal Transport*,
arXiv:1803.00567v4, Theorem 4.1, p. 70, for the Birkhoff contraction and Theorem 4.2, p. 71,
for the linear convergence of the iteration; their factor `(√η - 1)/(√η + 1)` with
`η = exp(Δ(K))` equals `tanh(Δ(K)/4)`).  Derive potential-oscillation, marginal-
residual, and objective-gap rates with their dependence on `min K`, `max K`, and the
positive marginal entries visible.  Treat kernels with support zeros only under their
separately sourced support/indecomposability regime.  Exact rational instances, such as
the contraction factor `1/3` of `K = [[2,1],[1,2]]` in the Examples below, are Checks of
these theorems.

*Needs:* items 7--8.
Tau Ceti declares or proves `TauCeti.hilbertProjectiveDist`, `Matrix.projectiveDiameter`,
`Matrix.hilbertProjectiveDist_mulVec_le`, `Matrix.hilbertProjectiveDist_sinkhornStep_le`,
`Matrix.hilbertProjectiveDist_sinkhornStep_iterate_succ_le_mul_projectiveDiameter`,
`Matrix.sum_abs_sum_sinkhornPlan_iterate_apply_sub_le` and
`TauCeti.tendsto_proportionalFitting_apply`.

**Checks.**

* For `K = [[2,1],[1,2]]`, `Δ(K) = log 4` and the contraction factor is `tanh(log 4/4) = 1/3`.
* For the rank-one kernel `[[1,2],[3,6]]`, `Δ = log((1·6)/(2·3)) = 0`, so the factor is `0` and
  one full step reaches the fixed point.
* For a kernel with a zero entry `Δ = ∞` and the factor is `1`: no contraction rate, which is why
  such kernels need their separate regime.

### 13.10 Agreement of the finite and measure-theoretic theories

Prove that the finite matrix objective, dual, potentials, and iterations agree with the
generic measure-theoretic definitions on finite types.  The existing LeanTriathlon
statement is a prototype only; this equivalence is the acceptance boundary.

*Needs:* items 1--9; Layer 2.3.
Tau Ceti declares or proves `Matrix.ofReal_entropicTransportValue_eq`,
`Matrix.entropicDualValue_eq_mul_relEntropyDual` and `TauCeti.proportionalFitting_real_singleton`.

### 13C. Dynamic Schrödinger theory

### 13.11 Dynamic entropy minimization

For a reference law `R` on path space, define endpoint-constrained entropy
minimization.  Entropy disintegration first yields
`dP*/dR=(dπ*/dR₀₁)(X₀,X₁)` for the optimal endpoint coupling.  Derive the stronger
factorization `f(X₀)g(X₁)R` only under Layer 13A's static dual-potential hypotheses.  For a
measurable endpoint map, a finite source measure and a finite reference `R`, the reduction of the
dynamic value to the static value of the endpoint law, existence and uniqueness of the dynamic
minimizer at finite value, and the endpoint form of its density are Tau Ceti's
`TauCeti.dynamicSchroedingerValue_eq_schroedingerValue`,
`TauCeti.existsUnique_isCoupling_map_klDiv_eq_dynamicSchroedingerValue` and
`TauCeti.klDiv_eq_dynamicSchroedingerValue_iff` for `TauCeti.dynamicSchroedingerValue`.

*Needs:* items 1--3; Layer 11.1; Tau Ceti `TauCeti.dynamicSchroedingerValue`,
`TauCeti.dynamicSchroedingerValue_eq_schroedingerValue`,
`TauCeti.existsUnique_isCoupling_map_klDiv_eq_dynamicSchroedingerValue` and
`TauCeti.klDiv_eq_dynamicSchroedingerValue_iff`.

**Checks.**

* With path space `X × Y` and `e` the identity, the dynamic problem is item 1's static problem.
* If the reference `R` is a single path `δ_γ`, the feasible set is nonempty exactly when
  `μ = δ_{γ(0)}` and `ν = δ_{γ(1)}`.
* The dynamic minimizer has density `(dπ*/dR₀₁)(X₀,X₁)` against `R`, so its endpoint law is the
  static minimizer `π*`.

### 13.12 Brownian Schrödinger bridges

On `C([0,1];ℝⁿ)`, build the Brownian probability law `R^ε_r` with explicit
initial law `r ∈ P(ℝⁿ)`, transition density
`p^ε_t(x,y)=(2πεt)^(-n/2) exp(-‖x-y‖²/(2εt))`, and generator
`(ε/2)Δ`; prove its endpoint law, disintegration, Markov, and reciprocal-process
facts.  Separately construct the σ-finite reversible Brownian path reference with
Lebesgue initial measure and the relative-entropy extension needed to use it.  For
endpoint densities in its finite-entropy feasible regime, construct the Schrödinger
bridge `f(X₀)g(X₁)R^ε_Leb`.  With the heat semigroup `P^ε_t`, set
`f_t=P^ε_t f`, `g_t=P^ε_{1-t}g`, and `ρ_t=f_tg_t`; prove
`∂_t f_t=(ε/2)Δf_t`, `∂_t g_t=-(ε/2)Δg_t`, and the exact forward/backward
Fokker--Planck equations
`∂_tρ+div(ρ ε∇log g_t)=(ε/2)Δρ` and
`∂_tρ+div(-ρ ε∇log f_t)=-(ε/2)Δρ`, first for smooth positive
data and then in the finite-entropy weak class (Léonard, *A survey of the Schrödinger
problem*, arXiv:1308.0215v1: Theorems 3.3 and 3.4, pp. 16--17, for the bridge
`f(X₀)g(X₁)R` and its time marginals `f_t g_t`, and Proposition 4.1, p. 21, for the reversible
Brownian reference with endpoint laws in `P₂(ℝⁿ)` of finite entropy).  Bridges over Riemannian or abstract Markov
reference processes are outside this roadmap (see Scope and ownership).

*Needs:* item 11; Layer 11.2; Mathlib Gaussian measures.

**Checks.**

* For `n = 1`, `ε = 1` and `t = 1`, the transition density is the standard Gaussian density
  `(2π)^(-1/2) e^{-|x-y|²/2}`.
* The time-`t` marginal from `δ₀` has covariance `εt I`; the generator `εΔ` would give `2εt I`.
* The endpoint law of `R^ε_{δ₀}` at time `1` is `N(0, ε I)`.

### 13.13 Schilder's principle and the small-noise limit

With the same generator convention, build Schilder's path-space large-deviation
principle in Laplace-principle form for `√ε`-Brownian paths, including exponential
tightness, and derive the endpoint rate `‖x-y‖²/2`.  In Layer 10's Γ-convergence
interface, prove equicoercivity and Γ-convergence of `ε` times constrained path entropy
to kinetic action (Léonard, *From the Schrödinger problem to the Monge--Kantorovich
problem*, Proposition 3.4 and Theorems 3.6--3.7: there the reference has a fixed initial
law and the endpoint marginals converge along a recovery sequence; the survey's
Informal Statement 5.1 points to this paper and is not itself a rigorous statement).
Pin the effective domain before stating any endpoint-constrained
result.  Marginalizing `π ≪ R^ε₀₁` gives `μ ≪ (R^ε₀₁)₀` and `ν ≪ (R^ε₀₁)₁`, so exact
endpoints are unavailable for general `μ,ν ∈ P₂(ℝⁿ)`: both endpoint marginals of item
12's reversible reference are Lebesgue, and for `μ=δ_a`, `ν=δ_b` with `a≠b` the unique
coupling has finite quadratic cost `‖a-b‖²/2` while every `π ∈ Π(μ,ν)` has
`Ent_{R^ε₀₁}(π)=∞` at every `ε>0`.  Keep that pair as a guardrail counterexample.
Here and below the entropy against the reversible reference is Layer 11.2's signed
functional `Ent_{R^ε₀₁}(π) = ∫ log(dπ/dR^ε₀₁) dπ` with the σ-finite reference `R^ε₀₁`, which is
item 12's relative-entropy extension.  It is not Mathlib's `InformationTheory.klDiv`, which
is nonnegative and whose mass correction reads the total mass of an infinite reference as `0`.
Define the plan domain by finite quadratic cost together with finite Boltzmann entropy
`Ent_{vol⊗vol}(π)`.  Finite quadratic cost alone does not bound the negative part of
`∫ρ_π log ρ_π`; for `π` with both marginals in `P₂(ℝⁿ)` the second-moment bound does, by
Layer 11.2's inequality `r log r ≥ r log s + r - s` with a Gaussian `s` on `ℝ²ⁿ`.  Define
the endpoint domain by `μ,ν ∈ P₂(ℝⁿ)` with `Ent_vol(μ),Ent_vol(ν)<∞`,
so that `μ⊗ν` witnesses feasibility.  On the plan domain prove the exact identity
`ε Ent_{R^ε₀₁}(π) = (1/2)∫‖x-y‖²dπ + ε Ent_{vol⊗vol}(π) + ε(n/2)log(2πε)`,
whose error terms vanish as `ε ↓ 0`, so the constant sequence `π_ε=π` is already a
recovery sequence with exact endpoints.  For an arbitrary `π` with both marginals in
`P₂(ℝⁿ)`, whose quadratic cost is then finite, prove the relaxed recovery theorem instead: Gaussian mollification gives plans `π_ε`
in the plan domain with `π_ε → π` in `W₂`, marginals converging to `μ` and `ν`, and
`limsup ε Ent_{R^ε₀₁}(π_ε) ≤ (1/2)∫‖x-y‖²dπ`; those endpoints converge and are not
exact.  Prove the matching liminf along sequences of uniformly bounded second moment,
and bridge-law tightness for fixed endpoints in the endpoint domain.  Over that same
endpoint domain deduce convergence of values, global minimizers, and entropic
interpolations to Layer 9 displacement interpolations, giving full convergence when
the quadratic optimizer is unique and only cluster-point convergence otherwise.

*Needs:* items 11--12; Layers 9.1, 10.6 and 11.2.

**Checks.**

* For `π = N(0, I₂)` on `ℝ × ℝ` and `ε = 1`, the cost is `(1/2)E|x-y|² = 1` and
  `Ent_{vol⊗vol}(π) = -log(2πe)`, so the identity gives
  `Ent_{R¹₀₁}(π) = 1 - log(2πe) + (1/2)log(2π) = -(1/2)log(2π)`; integrating
  `log(dπ/dR¹₀₁) = -(1/2)log(2π) - (x²+y²)/2 + (x-y)²/2` against `π` gives the same value.  It is
  negative because the reference has infinite mass; Mathlib's `klDiv π R¹₀₁` would instead be
  `ofReal(-(1/2)log(2π) + 0 - 1) = 0`, which is why the signed functional is the one used.
* On `ℝ × ℝ` let `π` be the law of `(X, X+Z)`, with `X` of density `1/(x (log x)²)` on `[e,∞)`
  and `Z` an independent standard Gaussian.  Its quadratic cost is `(1/2)E Z² = 1/2`, and
  `Ent_{vol⊗vol}(π) = Ent(X) + Ent(Z) = -∞`: finite cost does not bound the negative part, the
  plan is outside the plan domain, and neither marginal has a second moment.
* For `μ = δ_a` and `ν = δ_b` with `a ≠ b`, the only coupling has cost `‖a-b‖²/2` and, not
  being absolutely continuous with respect to `R^ε₀₁`, has `Ent_{R^ε₀₁} = +∞` at every `ε > 0`,
  so the endpoint domain excludes the pair.

Use Nutz's [entropic optimal-transport
notes](https://www.math.columbia.edu/~mnutz/docs/EOT_lecture_notes.pdf) for the measurable
static theory, Léonard's [Schrödinger survey](https://arxiv.org/abs/1308.0215) and his
[Schrödinger-to-Monge--Kantorovich paper](https://arxiv.org/abs/1011.2564) for the
dynamic theory, and Sinkhorn--Knopp's [matrix-scaling
paper](https://msp.org/pjm/1967/21-2/pjm-v21-n2-p14-p.pdf) for finite support conditions.

### Examples

Zero cost in cost-regularized OT with reference `μ⊗ν` gives the product
coupling; an exact `2 × 2` scaling has the prescribed row and column sums; abstract IPFP
and matrix Sinkhorn coincide on finite types; marginal KL errors telescope; and entropic
optimizers converge to an ordinary optimal plan as `ε ↓ 0` in the stated regime.  For `K = [[2,1],[1,2]]`, the projective diameter is `Δ(K) = log 4` and the contraction
factor is `tanh(log 4 / 4) = 1/3`.  For Brownian motion with generator `(ε/2)Δ`, the path
`γ(t) = 2t` on `[0,1]` has kinetic action `(1/2)∫|γ̇|² = 2`, equal to the endpoint rate
`|2 - 0|²/2 = 2`; omitting the factor `1/2` gives `4` and breaks the match.

### Dependencies

Layers 0--2, 9, 10, 11.1--11.2 and 12 (item 6's entropic barycenters); Mathlib `InformationTheory.klDiv` and the matrix and finite-sum APIs.

## Layer 14: synthetic curvature, nonsmooth heat flow, and optimal maps

Villani's Wasserstein-geometric curvature theory is part of the roadmap, and it is also
the correct foundation for extending Brenier--McCann beyond smooth manifolds.  This layer
must build its nonsmooth analytic vocabulary rather than declare `RCD` as an opaque
predicate.

### 14.1 The reference measure

Consume Layer 3's shared measured-metric carrier and work with its full-support Borel
reference measure finite on bounded sets (or a probability reference in normalized
statements).  Local finiteness alone is not substituted on a nonproper carrier.  Keep
the reference measure separate from the transported probability law.

*Needs:* Layer 3.9.
Tau Ceti declares or proves `TauCeti.MetricMeasureSpace`.

### 14.2 Curvature-dimension conditions

Build distortion coefficients, entropy-power functionals, essential nonbranching,
measure-contraction properties, and displacement convexity along a selected optimal
dynamic plan.  Define the curvature-dimension conditions `CD(K,N)`, reduced
`CD*(K,N)`, and `MCP(K,N)` in the exact finite and infinite-dimensional regimes, with
bridge theorems among conventions rather than one overloaded predicate.

*Needs:* item 1; Layers 8.2 and 9.3; Layer 11.2.
Tau Ceti declares or proves `TauCeti.MetricMeasureSpace.CurvatureDimensionInfinity`,
`TauCeti.MetricMeasureSpace.curvatureDimensionInfinity_iff_geodesicallyConvex`,
`TauCeti.distortionSigma`, `TauCeti.distortionTau`, `TauCeti.MetricMeasureSpace.MeasureContraction`
and `TauCeti.MetricMeasureSpace.EssentiallyNonbranching`.

**Checks.**

* `(ℝⁿ, Lebesgue)` satisfies `CD(0,N)` exactly when `N ≥ n`.
* The Gaussian space `(ℝ, e^{-x²/2}dx)` satisfies `CD(1,∞)` and `CD(K,N)` for no finite `N`.
* A reference measure supported on two points satisfies `CD(K,∞)` for no `K`.

### 14.3 Cheeger energy and `RCD`

Build minimal weak upper gradients, Cheeger energy, its relaxed `W¹,²` domain,
infinitesimal Hilbertianity, and the associated `L²` heat flow/Dirichlet form.  Pin
`RCD(K,∞)` to mean infinitesimally Hilbertian `CD(K,∞)`, and define finite-dimensional
`RCD*(K,N)` analogously.  Prove the EVI characterization as a theorem rather than using
it as a second definition.

*Needs:* items 1--2; Layer 10.3.

**Checks.**

* On `(ℝⁿ, Euclidean, Lebesgue)` the Cheeger energy is `(1/2)∫|∇f|²`, a quadratic form, so the
  space is infinitesimally Hilbertian.
* On `ℝ²` with the `ℓ^∞` norm and Lebesgue measure the Cheeger energy is `(1/2)∫‖∇f‖₁²`, not
  quadratic: the space is `CD(0,∞)` and not `RCD(0,∞)`.
* For `f(x) = x` on `([0,1], Lebesgue)` the Cheeger energy is `1/2`.

### 14.4 Sturm's transportation distance

Define Sturm's `L²` transportation distance `D` on normalized finite-variance
metric-measure spaces as the infimum of `W₂` between the two reference laws over
pseudometrics on their disjoint union that restrict to the original metrics.  Prove
presentation/quotient invariance and the compactness and convergence API used below.
Make Layer 15's scalar `p=2` distortion theory prove explicit comparison/bridge lemmas
to `D` rather than duplicate this construction.

*Needs:* item 1; Layer 3.9.
Tau Ceti declares or proves `TauCeti.sturmEDist` and `TauCeti.gromovProkhorovEDist`.

**Checks.**

* Two isometric presentations of the same normalized space are at distance `0`.
* The distance from `([0,1], uniform)` to a one-point space is
  `(∫₀¹ (x-1/2)² dx)^(1/2) = (1/12)^(1/2)`.
* Two one-point spaces are at distance `0`.

### 14.5 Stability, tensorization, and globalization

For normalized finite-variance metric-measure spaces (complete separable, reference law in
`P₂(X)`), prove that a `D`-limit of `RCD(K,∞)` spaces is `RCD(K,∞)` (Ambrosio--Gigli--Savaré,
*Metric measure spaces with Riemannian Ricci curvature bounded from below*, arXiv:1109.0222v2,
Theorem 6.10, p. 50), and that the `ℓ²` product of two nonbranching `RCD(K,∞)` spaces is a
nonbranching `RCD(K,∞)` space (Theorem 6.11, p. 51).  Formalize the global-to-local theorem
(Theorem 6.18, pp. 56--57: a closed convex `Y` with `m(∂Y) = 0` and `m(Y) > 0`, with the
normalized restricted reference, is `RCD(K,∞)`) and the local-to-global theorem (Theorem 6.20,
p. 57: a nonbranching `CD(K,∞)` space covered by finitely or countably many closed sets of
positive measure, on each of which the normalized restriction has a quadratic Cheeger energy, is
`RCD(K,∞)`).  Prove convergence of the heat flows separately, under pointed measured Gromov
convergence: for `CD(K,∞)` spaces, initial data converging in `W₂` with converging entropies give
`W₂` convergence of the flows at every time, of their entropies, and of their metric speeds for
almost every time (Gigli--Mondino--Savaré, *Convergence of pointed non-compact metric measure
spaces and stability of Ricci curvature bounds and heat flows*, arXiv:1311.4907v1, Theorem 5.7,
p. 39); for `RCD(K,∞)` spaces `W₂` convergence of the initial data to a law concentrated on
the support of the limit reference suffices (Theorem 7.7, p. 57), and stability of `RCD(K,∞)` holds in that convergence (Theorem 7.2, p. 54).
Treat finite-`N` `CD*` tensorization/local-to-global separately and incorporate Sturm's
2024 corrigendum: do not state blanket tensorization from the original Bacher--Sturm
proof.  Prove the elementary implications among curvature-dimension conditions, and
do not infer nonbranching from a curvature bound unless the theorem supplies it.

*Needs:* items 2--4; Layer 10.3.

### 14.6 Smooth weighted manifolds

Write the smooth weighted comparison out, since the finite- and infinite-dimensional
conventions part company exactly here.  For a complete, connected, boundaryless
`n`-dimensional weighted manifold `(M,g,m=e^{-V} vol_g)` with `V ∈ C²(M)`, prove
`RCD(K,∞) ⇔ Ric_g + Hess V ≥ K g`
and, for `N>n`,
`RCD*(K,N) ⇔ Ric_g + Hess V - (dV⊗dV)/(N-n) ≥ K g`,
accounting for the selected `CD` versus `CD*` convention, which encodes the same tensor
inequality in the smooth setting.  Pin the sign convention `m=e^{-V} vol_g`.  Prove that
at `N=n` a finite lower bound forces `V` constant, record that an `n`-dimensional smooth
weighted manifold with `N<n` lies outside the finite-`N` theory, and treat a manifold
with boundary through a separate convex-boundary formulation.  The `N`-Ricci tensor and its
conventions at `N = n` and `N < n` are Lott--Villani, *Ricci curvature for metric-measure spaces
via optimal transport*, arXiv:math/0412127v4, Definition 0.10, p. 4, and on a smooth compact
connected manifold with a smooth weight their Theorem 0.12, p. 4 (with Theorem 7.3, p. 41),
proves that `∞`-Ricci curvature at least `K` in the transport sense is `Ric + Hess V ≥ K g`, and
that nonnegative `N`-Ricci curvature is `Ric_N ≥ 0`.  On a complete manifold with `V ∈ C²`, the
equality of the optimal entropy-convexity constant of `(M,d,e^{-V} vol_g)` with the infimum of
`Ric + Hess V` over unit vectors, which is the `N = ∞` equivalence for every `K`, is Sturm, *On the
geometry of metric measure spaces. I*, Theorem 4.9.  For the unweighted volume, every `K ∈ ℝ` and
`N ≥ 1`, the equivalence of `CD(K,N)` with `Ric ≥ K` and `dim M ≤ N` is Sturm, *On the geometry of
metric measure spaces. II*, Theorem 1.7 (i); its part (ii) gives `CD(K+K', N+N')` for the weight
`W = e^{-V}` when `Ric ≥ K` and `W^{1/N'}` satisfies the `(K',N')`-concavity inequality along
geodesics, that is `Hess V - (dV⊗dV)/N' ≥ K'`: the implication from the tensor inequality to the
curvature-dimension condition when the bound splits into these two.  The equivalence for a
weighted manifold with `K ≠ 0`, finite `N` and a bound that does not split is in neither paper;
it is proved here from the second-order expansion of the Jacobian of `exp(-t∇φ)` along
transport geodesics, the route of Lott--Villani's Theorem 7.3 for `K = 0` (Villani 2009,
Chapter 29, treats the general case).  Both Sturm papers are cited in their preprint versions,
whose theorem numbers these are.  This consumes the Ricci tensor
`CovariantDerivative.ricciTensor` of the Levi-Civita connection with RiemannianGeometry R1's
curvature calculus, the Hessian of DifferentialGeometry Layer 12.3, and Tau Ceti's
`TauCeti.riemannianVolume`.  On weighted `ℝ` with `V(x) = x²/2`, `Ric_g = 0` and `Hess V = 1`,
so the infinite-dimensional tensor is `Ric + Hess V = 1` and the space is `RCD(1,∞)`, while for
`N > 1` the finite-dimensional tensor is `1 - x²/(N-1)`, which is negative for large `|x|`, so it
is `RCD*(K,N)` for no `K`.

*Needs:* items 2--3; RiemannianGeometry R1; DifferentialGeometry Layer 12.3; Tau Ceti
`CovariantDerivative.ricciTensor` and `TauCeti.riemannianVolume`.

### 14.7 Heat flow on `RCD` spaces

Prove that on `RCD(K,∞)` spaces the `L²(m)` gradient flow of Cheeger energy on
densities/functions corresponds, through `ρ ↦ ρ m` in the unit-mass finite-entropy
regime, to the `W₂` `EVI_K` gradient flow of Boltzmann entropy on `P₂(X)` (Ambrosio--Gigli--Savaré,
*Calculus and heat flow*, Theorem 9.3, p. 68, under `CD(K,∞)`; AGS arXiv:1109.0222v2,
Theorem 5.1, p. 40, for the equivalence of `RCD(K,∞)` with the existence of `EVI_K` flows).  The
two flows do not literally have the same carrier.  Then enumerate the consequences instead of
claiming the estimates "available" from the theory.  The two intended statements are the
dual heat-flow contraction
`W_p(H_t^* μ, H_t^* ν) ≤ exp(-K t) W_p(μ,ν)`
(AGS arXiv:1109.0222v2, (6.1), p. 44, for `p = 2`; Savaré, *Self-improvement of the
Bakry--Émery condition and Wasserstein contraction of the heat flow in `RCD(K,∞)` metric measure
spaces*, arXiv:1304.0643v2, Theorem 4.4(iii), p. 20, for every `p ∈ [1,∞]`)
and the Bakry--Émery gradient estimate
`|D H_t f|² ≤ exp(-2 K t) H_t(|Df|²)`
(AGS arXiv:1109.0222v2, Theorem 6.2, p. 45, for `f` in the domain of the Cheeger energy; Savaré,
Corollary 4.3, p. 20, for the self-improved exponents `β ∈ [1,2]`),
the latter `m`-almost everywhere on its precise Sobolev domain--`W^{1,2} ∩ L∞` in
Savaré's formulation--with `|Df|` the minimal weak upper gradient of item 3.  Make the
ambient assumptions on `(X,d,m)`, `H_t`, and its dual `H_t^*` visible; Savaré's
formulation assumes a complete separable length space, full support, and a
Gaussian-type volume-growth bound on `m`.  Name the range of `p` and the proof: `p=2` on
`P₂(X)` follows directly from `EVI_K`, whereas all `p ∈ [1,∞]` uses Kuwada duality and
Savaré's self-improvement of the Bakry--Émery estimate, followed by measurable gluing of
the pointwise `W_∞` coupling.  If only the `W₂` consequence is wanted, say that and stop
there.  Any further consequence--entropy dissipation, regularization, Harnack--is named
individually or is not on the roadmap.

*Needs:* items 3 and 5; Layers 10.3 and 11.2.

### 14.8 Optimal maps on nonsmooth spaces

For `1 ≤ N < ∞`, prove the Gigli--Rajala--Sturm nonsmooth optimal-map theorem on
`RCD*(K,N)` spaces for `μ₀,μ₁ ∈ P₂(X)` with `μ₀ ≪ m`: the quadratic optimal
coupling is unique and induced by a map.  For `1 < N < ∞`, separately add the
essentially nonbranching `MCP(K,N)` version, with its boundedly-finite/full-support
reference, moment, and source-absolute-continuity hypotheses all visible.  Consume
Layer 8's `CBB(κ)` API for Bertrand's Theorem 1.1: on a finite-dimensional complete,
connected, locally compact geodesic `CBB(κ)` Alexandrov space with `n`-dimensional
Hausdorff measure `Hⁿ`, if the Borel probabilities `μ₀,μ₁` have compact support
and `μ₀ ≪ Hⁿ`, every quadratic optimal plan is the graph of a Borel map and the
Monge/Kantorovich optimizer is unique a.e.; construct it from a `d²/2`-concave
potential and the Alexandrov exponential on the regular set.  Separately prove the
noncompact-support quadratic specialization of Bertrand's Theorem 4.2 under
`∫ d(x,y)² d(μ₀⊗μ₁)(x,y) < ∞`.

*Needs:* items 2--3; Layer 8.1.

### 14.9 Smooth and nonsmooth transport

Relate smooth McCann transport from Layer 7 to the nonsmooth theorem without claiming
that the latter supplies a differentiable exponential-map formula.

*Needs:* item 8; Layer 7.3.

Primary sources are Lott--Villani,
[Ricci curvature for metric-measure spaces via optimal
transport](https://annals.math.princeton.edu/2009/169-3/p04), Sturm,
[On the geometry of metric measure
spaces](https://doi.org/10.1007/s11511-006-0002-8), and Ambrosio--Gigli--Savaré's
[RCD/heat-flow theory](https://arxiv.org/abs/1109.0222).  The map theorem follows
Gigli--Rajala--Sturm's [optimal maps in RCD
spaces](https://iris.sissa.it/bitstream/20.500.11767/15788/1/mapsRCDKN.pdf) and the
essentially nonbranching extension follows
[Cavalletti--Mondino](https://arxiv.org/abs/1609.00782).  The Alexandrov theorem and its
noncompact extension follow Bertrand's [existence and uniqueness of optimal maps on
Alexandrov spaces](https://arxiv.org/abs/0705.0437), Theorems 1.1 and 4.2.

### Examples

The Euclidean reference space satisfies the expected curvature
condition; the smooth Ricci lower-bound theorem round-trips through the synthetic
definition; entropy flow agrees with the heat semigroup; and a source density on an RCD
space has a unique map-induced quadratic optimizer without any smooth exponential map in
the statement.

### Dependencies

Layers 3.9, 8--10 and 11.2; RiemannianGeometry R1 with Tau Ceti's `CovariantDerivative.ricciTensor`; DifferentialGeometry Layer 12 (Hessian) and Tau Ceti's `TauCeti.riemannianVolume` (item 6).

## Layer 15: measured kernels and Gromov--Wasserstein

The root measured-kernel object is `(X, μ, ω)` with a measurable carrier `X`, probability
law `μ`, an arbitrary metric target `Z` equipped with its Borel measurable structure, and
an a.e. strongly measurable `ω : X × X → Z`.  No separability or completeness of `Z`
is assumed at the root.  Its finite-`p` component is expressed by
`MemLp (fun q ↦ edist (ω q) z₀) p (μ.prod μ)` about one basepoint `z₀`, with basepoint
independence proved.  The separate `AEStronglyMeasurable ω` hypothesis supplies an
essentially separable range, while radial `MemLp` supplies the integrability gate.  Thus
neither global separability of `Z` nor a topology on `X` belongs in the root; `p` is not a
field of the structure.  Ordinary metric-measure spaces are the specialization `Z=ℝ` and
`ω=d`.  Give Layer 3's Polish measured-carrier, support, and measure-preserving-isometry
records a specialization into this general kernel theory rather than making them root
assumptions or creating a second dialect.  The target-valued route follows
[Bauer--Mémoli--Needham--Nishino (BMNN)](https://www.jmlr.org/papers/volume26/24-2189/24-2189.pdf);
the theorem numbers below refer to that paper.

### 15.1 Measured kernels

At the measurable root, define measured kernels, pullback along measure-preserving
maps, weak isomorphism through a common probability parametrization, products,
restrictions, and finite weighted kernels.  Prove that all definitions are invariant
under a.e. equality of `ω`.  Define support/full-support representatives only on the
topological/Polish specialization that makes those notions available.

*Needs:* Layer 3.9; Mathlib `MeasureTheory.AEStronglyMeasurable` and `MeasureTheory.MemLp`.
Tau Ceti declares or proves `TauCeti.AreWeaklyIsomorphicKernels`,
`TauCeti.gromovWassersteinDistortion`, `TauCeti.gromovWassersteinEDist`,
`TauCeti.gromovWassersteinEDist_comm`, `TauCeti.gromovWassersteinEDist_triangle`,
`TauCeti.exists_isCoupling_gromovWassersteinDistortion_eq` and
`TauCeti.gromovWassersteinEDist_eq_zero_iff`.

**Checks.**

* Changing `ω = d` on the diagonal of `[0,1]²` with Lebesgue measure, a `μ⊗μ`-null set, gives the
  same measured kernel.
* The reflection `x ↦ 1-x` of `([0,1], Lebesgue)` is measure-preserving and pulls `d` back to `d`.
* A one-point space and `({0,1}, (δ₀+δ₁)/2)` with zero kernels are weakly isomorphic through a
  common parametrization although their carriers differ.

### 15.2 Distortion and the Gromov--Wasserstein distance

For `p : ℝ≥0∞` with `1 ≤ p`, define the raw distortion of a coupling using the
`eLpNorm` of `d_Z(ω_X(x,x'),ω_Y(y,y'))` against `π⊗π`, and define `GW_p` by taking its
infimum.  Prove the finite-`p` integral/root formula and the `p=∞` essential-supremum
formula.  Follow this roadmap's no-`1/2` convention and prove the exact conversion
`GW_roadmap = 2 · GW_BMNN` to sources using the half-distance convention.

*Needs:* item 1; Layer 0.1; Mathlib `MeasureTheory.eLpNorm`.

**Checks.**

* With this roadmap's convention, `GW_p(X,*) = ‖d_X‖_{Lᵖ(μ⊗μ)}`, which for the uniform two-point
  space with distance `a` is `(2·(1/4)·aᵖ)^(1/p) = 2^{-1/p}a`.
* Uniform two-point spaces with distances `a`, `b` are at distance `2^{-1/p}|a-b|`.
* For `a = 1`, `b = 0` and `p = 1` the distance is `1/2` here and `1/4` in the half-distance
  convention, as `GW_roadmap = 2·GW_BMNN` requires.

### 15.3 Symmetry, the triangle inequality, and attainment

Prove symmetry on the unrestricted measurable root.  Under standard-Borel carrier
hypotheses--or an abstract coupling-gluing property--prove the triangle inequality
from Layer 0 gluing and Minkowski.  For every `p ∈ [1,∞]`, generalize BMNN Theorem 26
to show that measurable `Lᵖ`
kernels on Polish carriers with Borel probability laws and an arbitrary metric target
`Z` admit an optimal GW coupling, without continuity or lower-semicontinuity
assumptions on the kernels.  Reduce each pair to the closure of the union of its two
separable essential ranges; the published global complete-separable target is not used
by the attainment proof.  At `p=∞`, make the `L∞`/essential-boundedness hypothesis
explicit.  Give the continuous metric-kernel Polish theorem as a direct specialization
rather than the foundation.

*Needs:* items 1--2; Layer 0.4; Layer 1.3.

### 15.4 Zero distance and the quotient

In the Polish-carrier category of item 3, characterize zero distance as weak
isomorphism, form the quotient, and give the quotient a genuine metric (BMNN Theorem 29, p. 26,
for a separable metric target `Z`); the quotient and its
metric are Tau Ceti's `TauCeti.GromovWassersteinSpace` and
`TauCeti.GromovWassersteinSpace.instMetricSpace`.  For
full-support metric-measure spaces, prove that weak isomorphism reduces to a
measure-preserving isometry; without full support, pass to supports.

*Needs:* item 3; Tau Ceti `TauCeti.GromovWassersteinSpace`.

### 15.5 Completeness, separability, and geodesics

For `p ∈ [1,∞]` and the Polish-carrier strongly measurable kernel category, prove
that the weak-isomorphism quotient is complete exactly when the metric target `Z` is
complete (BMNN Theorem 39), working objectwise in the countable union of separable
essential ranges.  When `Z` is separable and `1 ≤ p < ∞`, prove separability and
density of finite uniform kernels (BMNN Propositions 36 and 38), with no `p=∞`
separability claim.  Prove the common-parametrization estimate: if
`f_n : Ω → X_n` and `f : Ω → X` push one probability `λ` to the respective laws,
then `GW_p(X_n,X)` is at most the `Lᵖ(λ²)` distance between the pulled-back kernels;
deduce GW convergence when that bound tends to zero.  Given a Borel geodesic
bicombing on `Z`, construct quotient geodesics for every `p ∈ [1,∞]` by interpolation
over an optimal coupling (BMNN Theorem 45).  For a complete separable geodesic target
without such a bicombing, consume Layer 8's universally measurable selector relative
to the fixed optimal endpoint law and its Borel almost-everywhere representative.
Do not promote this measure-relative construction to a global Borel selector.

*Needs:* items 3--4; Layer 8.2.
Tau Ceti declares or proves `TauCeti.GromovWassersteinSpace.instIsGeodesicSpace` and
`TauCeti.GromovWassersteinSpace.completeSpace_of_completeSpace_gromovWassersteinSpace`.

### 15.6 Gromov--Prokhorov and measured Gromov--Hausdorff comparisons

For compact unmeasured spaces, consume Mathlib's `GromovHausdorff.ghDist`,
`ghDist_le_hausdorffDist`, `ghDist_eq_hausdorffDist`, `optimalGHInjl`, and
`optimalGHInjr` rather than rebuilding their realized common-ambient presentation.
Consume `MeasureTheory.levyProkhorovEDist`, Hausdorff-distance, and isometry APIs, and
build only the measured common-ambient extension needed below.  Define
Gromov--Prokhorov distance by infimizing
Lévy--Prokhorov distance over common isometric embeddings.  Define the chosen
measured-Gromov--Hausdorff convergence by simultaneous
Hausdorff convergence of supports and Prokhorov convergence of pushed-forward laws;
prove presentation invariance and descent to the support quotient.  Then specialize
to complete separable metric-measure spaces with `d ∈ Lᵖ(μ⊗μ)`, recover Mémoli's
compact full-support Gromov--Wasserstein theory, and prove only sourced comparison
implications with those two notions.  A Gromov--Prokhorov-to-`GW_p` implication must
carry uniform `p`-integrability of distance kernels; a measured-Gromov--Hausdorff
comparison must carry its support/noncollapse control.  Compactness alone does not
identify these topologies.

*Needs:* items 1--2; Mathlib `GromovHausdorff.ghDist`, `MeasureTheory.levyProkhorovEDist` and
Hausdorff distance.
Tau Ceti declares or proves `TauCeti.sturmEDist` and `TauCeti.gromovProkhorovEDist`.

**Checks.**

* Two spaces carrying Dirac laws are at Gromov--Prokhorov distance `0`.
* `([0,1], δ₀)` and a one-point space are at Gromov--Prokhorov distance `0`, while their carriers
  are at Gromov--Hausdorff distance `1/2`: the measured notions see only supports.
* The uniform laws on the grids `{k/n | 0 ≤ k ≤ n}` converge to `([0,1], Lebesgue)` in the
  Gromov--Prokhorov sense, in the common ambient `[0,1]`.

### 15.7 Sturm's space of spaces

Consume Layer 8's Alexandrov lower-curvature API.  For scalar `L²` distortion, build
Sturm's geodesic "space of spaces," its tangent-cone description, and its `CBB(0)`
theorem.  Keep this lower curvature bound on the moduli space distinct from CAT(0) and
from the `CD/RCD` curvature of an individual space.

*Needs:* items 2 and 5; Layer 8.1.

### 15.8 Section laws and lower bounds

First construct an a.e.-canonical outgoing section-law map
`x ↦ (ω(x,·))_#μ` and its incoming analogue.  Choose a jointly strongly measurable
representative of `ω`; use its strong measurability into the Borel measurable target
to obtain the a.e.-measurability required by `Measure.map`, form its section laws, and
use Fubini to prove that their
`p`-moments are finite almost everywhere, and default the exceptional sections to the
Dirac law at the chosen basepoint.  Prove that the resulting map into `P_p(Z)` is
measurable and is unchanged almost everywhere when the representative or exceptional
default changes.  Define outgoing and incoming `p`-eccentricity, `p`-size, and kernel
distributions from this API; make their basepoint and `p=∞` conventions explicit and
prove their measurability, integrability, and a.e.-invariance.  State separately the
measurable profile-coupling-lift property needed by the hierarchy below.  First prove
the hierarchy under that abstract gate; then establish the gate for standard-Borel
carriers with Borel kernels and complete separable target `Z`.  Following BMNN
Theorem 50, set
`C(x,y)=W_p((ω_X(x,·))_#μ_X,(ω_Y(y,·))_#μ_Y)` and prove, in this roadmap's
no-`1/2` convention, the three inequalities
`GW_p(X,Y) ≥ inf_{π∈Π(μ_X,μ_Y)} ‖C‖_{Lᵖ(π)}`,
`inf_{π∈Π(μ_X,μ_Y)} ‖C‖_{Lᵖ(π)} ≥ W_p((ecc_X)_#μ_X,(ecc_Y)_#μ_Y)`, and
`W_p((ecc_X)_#μ_X,(ecc_Y)_#μ_Y) ≥ |size_{p,z₀}(X)-size_{p,z₀}(Y)|`.
Using the a.e.-measurable `Measure.map` construction above, unconditionally form the
kernel pushforwards on this `p`-component and prove the independent kernel-distribution
bound
`GW_p(X,Y) ≥ W_p((ω_X)_#μ_X²,(ω_Y)_#μ_Y²)` and the incoming analogues.
Prove `GW_p(X,{z})=size_{p,z}(X)` and the resulting 1-Lipschitz stability of size,
eccentricity-distribution, and kernel-distribution invariants; avoid an open-ended
promise of unspecified equality characterizations.

*Needs:* items 1--2; Layer 3.
Tau Ceti declares or proves `TauCeti.kernelSectionLaw`,
`TauCeti.iInf_eLpNorm_kernelSectionLawEDist_le_gromovWassersteinEDist`,
`TauCeti.kernelEccentricity`,
`TauCeti.wassersteinEDist_map_kernelEccentricity_le_gromovWassersteinEDist` and
`TauCeti.wassersteinEDist_kernelDistribution_le_gromovWassersteinEDist`.

**Checks.**

* For the uniform two-point space with distance `a`, the section law at each point is `(δ₀+δ_a)/2`
  and the `p`-eccentricity is `2^{-1/p}a`.
* Its `p`-size about `0` is `2^{-1/p}a`, equal to `GW_p` to the one-point space with kernel value
  `0`.
* For two such spaces with distances `a`, `b` the size bound `|size(X) - size(Y)| = 2^{-1/p}|a-b|`
  equals `GW_p(X,Y)`, so the lower-bound chain is tight there.

### 15.9 Finite Gromov--Wasserstein

Show that finite weighted distance matrices give exactly the standard nonconvex
quadratic GW objective.  Give small exact examples, such as the uniform two-point spaces
of the Examples below, as Checks of that identification.

*Needs:* items 1--2.
Tau Ceti declares or proves `TauCeti.gromovWassersteinEDist_eq_iInf_transportMatrix`,
`TauCeti.exists_isMinOn_gromovWassersteinObjective` and `TauCeti.gromovWassersteinEDist_twoPoint`.

### 15.10 Entropic Gromov--Wasserstein and barycenters

Define entropically regularized finite GW by writing its objective, not by naming it.
For the quadratic problem, minimize over `π ∈ Π(μ_X,μ_Y)` the unrooted functional
`∑_{i,i',j,j'} d_Z(ω_X(i,i'),ω_Y(j,j'))² π_{ij} π_{i'j'} + ε klDiv π (μ_X⊗μ_Y)`,
which regularizes the squared distortion and not the already square-rooted `GW₂` value.
Choose the KL convention above and record the bridge to the frequently used `-ε H(π)`
convention, which differs on a fixed coupling polytope by the constant marginal term
`klDiv π (μ_X⊗μ_Y) = -H(π) + H(μ_X) + H(μ_Y)`.
For general finite `p`, say whether the `p`th distortion power is what gets
regularized; the formula does not extend to `p=∞`.  Relate this to the generic kernel
definition.  Use compactness of the finite coupling polytope and continuity of the
quadratic distortion plus entropy to prove existence of global minimizers of that exact
functional (Tau Ceti's `TauCeti.exists_isMinOn_entropicGromovWassersteinObjective`).  As
`ε↓0`, prove convergence of optimal values and that every cluster point of its global
minimizers is an unregularized global minimizer
(`TauCeti.tendsto_entropicGromovWassersteinObjective_of_isMinOn` and
`TauCeti.isMinOn_gromovWassersteinObjective_of_mapClusterPt`).  The objective remains
nonconvex: make no algorithmic global-convergence claim in this roadmap without first
naming an update and a sourced stationarity theorem.  Define GW barycenters by an
explicit objective.  Fix `1 ≤ p < ∞`, finitely many scalar measured kernels
`(Y_j, ν_j, ω_j)` on finite carriers with real values, weights `w_j ≥ 0` summing to one,
a prescribed finite barycenter carrier `ι` with probability vector `μ`, and `ε ≥ 0`.
Minimize, over real kernels `ω : ι × ι → ℝ` and couplings `π_j ∈ Π(μ,ν_j)`, the sum
`∑_j w_j (∑_{i,i',k,k'} |ω(i,i') - ω_j(k,k')|^p π_j(i,k) π_j(i',k') + ε klDiv π_j (μ⊗ν_j))`.
At `ε = 0` its value at a kernel `ω` is `∑_j w_j GW_p((ι,μ,ω), Y_j)^p`, the `p`th power
of the distance, with no factor `1/2`.  Prove that a minimizer exists for every
`ε ≥ 0`, with no symmetry, metric, or boundedness constraint on `ω` (the fixed-law
formulation of Peyré--Cuturi--Solomon), and that every coupling of positive weight in a
minimizer solves its own entropic GW problem against the minimizing kernel (Tau Ceti's
`TauCeti.exists_isMinOn_finiteGromovWassersteinBarycenterObjective` and
`TauCeti.isMinOn_entropicGromovWassersteinObjective_of_barycenter`).  Make no
uniqueness claim: for one-point kernels with values `0` and `2` and weights `1/2`, the
`p = 1` objective `(|z| + |z-2|)/2` is minimized by every `z ∈ [0,2]`.  Minimizing
`∑_j w_j GW_p` without the `p`th power is a different problem; in that example it has
the minimizers `[0,2]` even at `p = 2`.  There is no essential-supremum (`p = ∞`)
barycenter objective, and no existence theorem over the full weak-isomorphism quotient
with a free carrier is part of this roadmap.

*Needs:* items 2 and 9; Layer 13.1; Tau Ceti
`TauCeti.exists_isMinOn_entropicGromovWassersteinObjective` and
`TauCeti.exists_isMinOn_finiteGromovWassersteinBarycenterObjective`.

**Checks.**

* For one-point kernels with values `0` and `2` and weights `1/2`, the fixed-carrier objective is
  `(|z|ᵖ + |z-2|ᵖ)/2`: at `p = 1` every `z ∈ [0,2]` minimizes with value `1`.
* At `p = 2` it is `(z-1)² + 1`, with the unique minimizer `z = 1`.
* For the product coupling `μ_X ⊗ μ_Y`, `klDiv` is `0` and `-H(π) + H(μ_X) + H(μ_Y) = 0`, as the
  bridge to the `-εH` convention requires.

The general measured-kernel route follows Bauer--Mémoli--Needham--Nishino,
[*The Z-Gromov-Wasserstein
distance*](https://www.jmlr.org/papers/volume26/24-2189/24-2189.pdf).  Metric-measure
specialization follows Mémoli's [foundational
paper](https://doi.org/10.1007/s10208-011-9093-5), and the `L²` moduli-space geometry
follows Sturm's [space of spaces](https://arxiv.org/abs/1208.0434).

### Examples

A measure-preserving isometry has zero GW distance and the converse
holds after full-support reduction; with this roadmap's convention,
`GW_p(X,*)=‖d_X‖_{Lᵖ(μ⊗μ)}`; uniform two-point metric spaces with nonzero distances `a,b`
have distance `2^{-1/p}|a-b|`; the triangle coupling is constructed explicitly by gluing;
and the finite matrix objective is exactly the generic measured-kernel objective.  For the one-point kernels with values `0` and `2` and weights `1/2`, the
fixed-carrier objective of item 10 is `(|z|^p + |z-2|^p)/2`: at `p = 1` every `z ∈ [0,2]`
minimizes with value `1`, while at `p = 2` it is `(z-1)² + 1`, with unique minimizer `z = 1`.

### Dependencies

Layers 0--3, 8, 12 and 13; Mathlib `GromovHausdorff.ghDist` and `MeasureTheory.levyProkhorovEDist`.

## Layer 16: public API, extraction, and end-to-end examples

The earlier layers are not internal scaffolding to discard.  Finish them as a discoverable
library.

### 16.1 Namespaces

Organize general material under stable namespaces such as
`MeasureTheory.OptimalTransport`, `MeasureTheory.ProbabilityMeasure.Wasserstein`,
`Analysis.Convex.MongeAmpere`, `Analysis.GradientFlow`, and
`MetricGeometry.GromovWasserstein`, following upstream naming feedback.  Avoid a single
file or namespace that imports all PDE, Riemannian, computational, and metric-measure
dependencies.

*Needs:* Layers 0--15.

### 16.2 Basic API conventions

Provide extensionality/simp lemmas, coercions, continuity/measurability instances,
finite/Dirac/product specializations, and theorem aliases only where Mathlib convention
calls for them.  Definitions must not expose arbitrary basepoints, normalizations, or
representatives.

*Needs:* Layers 0--15.

### 16.3 General-purpose additions

Keep the general-purpose additions--gluing, lower-semicontinuous integral lemmas,
extended convex duality, metric curves, the advanced `klDiv` API, signed Boltzmann
entropy, and Fréchet means--separate from the transport-specific material, each stated
at its own natural generality, so nothing reusable is trapped behind a Wasserstein
hypothesis.

*Needs:* Layers 0--15.

### 16.4 Module documentation

Write module documentation that maps hypotheses to the theorem regimes in this
roadmap.  Each headline theorem should have a compact canonical corollary and a link to
the more general form, not a proliferation of unrelated re-statements.

*Needs:* Layers 0--15.

### 16.5 Finite examples

Keep the finite examples of every layer as exact theorems about the finite
specializations, stated through the same public definitions as the general theory.

*Needs:* Layers 0--15.

### Examples

The finite specialization of `TauCeti.transportCost` for `δ₀`, `δ₂` on `ℝ` with
`c(x,y) = (x-y)²` is `4`, and `TauCeti.wassersteinEDist 2` of the pair is `2`; the quadratic
Fréchet barycenter of the law giving mass `1/2` to `0` and to `2` is the point `1`, at radius
`1`.  Each value is the same through the finite matrix API and through the measure API.

### Dependencies

Layers 0--15.

## Named completion targets

The following are summits inside the full layers, not substitutes for their supporting
theory.  Completion of the roadmap requires all of them.

* existence and stability of optimal plans for lower-semicontinuous costs on Polish
  spaces;
* Kantorovich duality in the lower-semicontinuous and relaxed Borel-cost regimes;
* `c`-cyclical-monotonicity/contact-set optimality with exact hypotheses;
* the complete `P_p(X)` metric/topology package and Kantorovich--Rubinstein duality;
* the abstract twist theorem, distance-cost Monge existence, Euclidean Brenier,
  Gangbo--McCann, polar factorization, and Riemannian McCann;
* Aleksandrov Monge--Ampère theory, Caffarelli interior/global regularity, MTW regularity,
  and partial regularity off singular null sets;
* Lisini superposition, displacement geodesics, the Euclidean and Riemannian
  Benamou--Brenier formulas, and the `p=1` BV distinction;
* abstract EVI/maximal-slope/minimizing-movement theory and the Wasserstein JKO
  constructions for heat, Fokker--Planck, and nonlinear diffusion;
* finite and population Wasserstein barycenters, including multi-marginal and the
  quadratic quantile/Gaussian forms;
* finite-reference `klDiv`, signed Boltzmann entropy, static/dynamic Schrödinger problems,
  finite and measurable Sinkhorn, convergence, and the zero-temperature limit;
* `CD/RCD`, entropy-as-heat-flow, and nonsmooth map-induced optimal transport;
* measured-kernel GW, the quotient metric and topology, ordinary metric-measure
  specialization, finite GW, entropic GW, and GW barycenters.

## End-to-end examples

Develop these alongside the layers.  They detect incompatible conventions and vacuous
abstractions earlier than the summit proofs do.

* Finite probability vectors: couplings are transportation matrices; primal/dual linear
  programs agree; complementary slackness certifies an optimizer; Sinkhorn scales a
  positive Gibbs kernel; and finite GW reduces to its quadratic matrix objective.
* The real line: monotone/quantile transport solves every finite-`p` problem, gives the
  `W_p` formula, and produces displacement interpolations; quadratic barycenters average
  quantiles, while other exponents use the corresponding pointwise Fréchet minimizer.
* Dirac laws: `W_p(δ_x,δ_y)=d(x,y)`, dynamic action is base-space action, barycenters reduce
  to base Fréchet means, and GW against a point measures the `Lᵖ` size of the distance
  kernel.
* Gaussian laws: the Brenier matrix, `W₂` formula, inverse map, interpolation, heat flow,
  and quadratic barycenter covariance equation all use one positive-matrix API.
* Smooth compactly supported Euclidean densities: dual potentials, Brenier's map,
  Monge--Ampère Jacobian equation, Benamou--Brenier velocity, JKO Euler equation, and
  entropic zero-temperature convergence agree end to end.
* A translating density: its graph plan, displacement curve, constant velocity,
  continuity equation, action, and `W_p` distance have matching values.
* Counterexamples as tests: atomic Monge infeasibility, infinite barrier costs, a singular
  Aleksandrov measure, a split/nonconvex target with discontinuous Brenier map, the `p=1`
  mixed-path phenomenon, nonunique barycenters, and a GW zero-distance pair differing
  only outside measure supports.

## Statements that must not enter the library

These tempting formulations are false or materially misleading; use them as review
guardrails.

* An optimal plan always has finite cost.
* Strong duality always includes dual attainment.
* Every optimal plan is topologically supported on a closed cyclically monotone set for an
  arbitrary measurable extended cost.
* Cyclical monotonicity suffices for every extended Borel cost without relaxation.
* Every Monge problem is feasible, or every optimal plan is induced by a map.
* Brenier requires both marginals to have densities, or its convex potential is globally
  unique modulo constants without support/domain assumptions.
* A Brenier weak solution is automatically an Aleksandrov solution.
* Smooth positive densities alone make a general-cost optimal map smooth.
* Nonnegative sectional curvature alone implies MTW regularity.
* Differentiability of `d(·,y)²/2` at `x` puts `y` off `Cut(x)`; it gives only uniqueness
  of the minimizing geodesic, and a first conjugate point is a cut point reached by one.
* `W_p` is finite on all probability measures, or the same definition gives a metric for
  `p<1`.
* The finite-`W_p` component of an arbitrary anchor law is `P_p(X)`; that needs the anchor
  to lie in `P_p(X)` and fails, for instance, for a Cauchy law at `p=2`.
* Every Wasserstein geodesic is induced by a unique family of particle geodesics.
* Lisini's superposition principle covers `p=1`, or an absolutely continuous `W₁` curve
  always lifts to a measure on continuous paths.
* A vector-field continuity equation is available on an arbitrary metric space.
* Geodesic convexity automatically supplies an EVI flow.
* Completeness and geodesicity alone guarantee existence or uniqueness of a barycenter.
* Sinkhorn plan convergence automatically gives convergence of potentials when the cost
  may be infinite.
* Every finite-quadratic-cost endpoint plan admits an entropic recovery sequence with its
  own exact marginals; absolute continuity against the reference constrains the endpoints.
* Entropic regularization makes the GW objective convex or its iteration globally
  convergent.
* Raw GW is a metric on presentations rather than a pseudometric before quotienting.

## Cross-roadmap dependencies

* Tau Ceti implements weak derivatives and the weak Sobolev spaces; the
  [PDE roadmap](../PDE/README.md) builds on them the Sobolev compactness, parabolic
  solution theory, and the concrete heat semigroup consumed by Monge--Ampère estimates and
  the PDE/semigroup identification of JKO limits.  Nonlinear Monge--Ampère, continuity
  equations of measure-valued curves, Fokker--Planck semigroup construction, and OT first
  variations remain explicit work here.
* The [Hopf--Rinow roadmap](../../Completed/HopfRinow/README.md) builds the Levi-Civita
  connection, geodesic flow, exponential and local logarithm maps, completeness and minimizing-geodesic theory, and
  the shared metric length/geodesic-space API.  Layers 7--9 consume these results; Layer 7 retains
  ownership of squared-distance semiconcavity and transport-specific bridges;
  RiemannianGeometry R4.6 owns geometric injectivity-radius and cut-locus theory.
* The [DifferentialGeometry roadmap](../DifferentialGeometry/README.md), Layer 12, builds the
  Riemannian gradient, divergence, Hessian, volume density and divergence theorem over Tau
  Ceti's `TauCeti.riemannianVolume`; the
  [RiemannianGeometry roadmap](../RiemannianGeometry/README.md), R1, builds the curvature
  calculus over Tau Ceti's `CovariantDerivative.ricciTensor`.  Layers 7, 8.9, 11.10 and 14.6
  consume them; neither consumes this roadmap.
* The [one-parameter-semigroups roadmap](../../Completed/OneParameterSemigroups/README.md)
  supplies the
  abstract C₀/contraction-semigroup, generator, and resolvent API.  The PDE roadmap supplies
  the concrete heat semigroup.  Layer 11 constructs any remaining concrete linear Markov
  semigroups it names and proves that the linear Wasserstein gradient flows agree with
  those semigroups.  One-parameter semigroups also owns the abstract Hille--Yosida
  generation theorem, which PDE §6.3 (F26) consumes for its concrete heat realization.

These links are dependencies, not permissions to skip missing glue: each consumed result is
used with its owner's hypotheses, and every bridge between the owner's conventions and this
roadmap's is a target of the consuming layer here.

## Ordering and claim size

Layers 0--3 are the common spine and should land first in order.  After Layer 3, the
static-map branch (4--7) and metric-dynamic branch (8--10) can proceed in parallel.
Layer 11 follows the dynamic and abstract-gradient-flow APIs, but its finite-reference
`klDiv` slice can land independently.  Layer 12 needs Wasserstein geometry and
multi-marginal transport but can otherwise proceed independently.  Layer 13 needs the
coupling/duality spine and Layer 11.1's `klDiv` slice; its finite matrix sublayer can start
once the finite Layer 2 equivalence is stable.  Layer 14 follows displacement geometry,
signed Boltzmann entropy, and the metric-gradient-flow substrate.  Layer 15's raw
GW/attainment/quotient foundation (items 1--4) needs only Layers 0--3; its geodesic and
`CBB(0)` targets also need Layer 8's generic path/geodesic and measure-relative
selection API, and its entropic and barycenter targets need Layers 12--13.

A useful implementation claim is usually one definition family plus its complete basic
API and one or two named theorems: gluing; lsc cost and attainment; finite duality;
`W_p` triangle and moments; metric curves; either entropy API; finite Sinkhorn scaling; or
raw GW plus its triangle inequality.  Brenier, Benamou--Brenier, Caffarelli regularity,
JKO-to-PDE, RCD optimal maps, and the GW quotient metric each deserve staged claims, every
stage of which is reusable on its own.

## Downstream consumers

* [RandomMatrices](../RandomMatrices/README.md) consumes Layers 0--3 (couplings and
  Wasserstein distances) for its eigenvalue coupling and spectral `W₁` and `W₂` corollaries.
* [StandardDistributions](../StandardDistributions/README.md) leaves to this roadmap the
  Gaussian Brenier and `W₂` formulas, interpolation and barycenters, their positive-definite
  square-root and geometric-mean identities (Layers 5.3 and 12.8), and the quantile
  construction (Layer 3.7).
* [VonNeumannAlgebras](../VonNeumannAlgebras/README.md) consumes Layer 2's finite-measure
  completion theorem for analytic sets and Layer 8.2's Jankov--von Neumann uniformization.

## References

### General and static transport

* C. Villani, [*Optimal Transport: Old and
  New*](https://link.springer.com/book/10.1007/978-3-540-71050-9), Springer, 2009.
* C. Villani, [*Topics in Optimal
  Transportation*](https://bookstore.ams.org/gsm-58/), AMS, 2003.
* F. Santambrogio, [*Optimal Transport for Applied
  Mathematicians*](https://link.springer.com/book/10.1007/978-3-319-20828-2), 2015.
* L. Ambrosio and N. Gigli, [*A user's guide to optimal
  transport*](https://cvgmt.sns.it/media/doc/paper/195/users_guide-final.pdf), in *Modelling and
  Optimisation of Flows on Networks*, Lecture Notes in Mathematics 2062, Springer, 2013,
  1--155; page numbers are those of the linked authors' version.
* A. S. Kechris, [*Classical Descriptive Set
  Theory*](https://doi.org/10.1007/978-1-4612-4190-4), Graduate Texts in Mathematics 156,
  Springer, 1995.
* W. Schachermayer and J. Teichmann, [Characterization of optimal transport
  plans](https://arxiv.org/abs/0711.1268), 2009.
* V. S. Varadarajan, *On the convergence of sample probability distributions*, Sankhyā 19
  (1958), 23--26.
* C. R. Givens and R. M. Shortt, [A class of Wasserstein metrics for probability
  distributions](https://doi.org/10.1307/mmj/1029003026), 1984; A. Pratelli,
  [On the equality between Monge's infimum and Kantorovich's
  minimum](https://www.numdam.org/item/AIHPB_2007__43_1_1_0/), 2007.
* Y. Brenier, [Polar factorization and monotone
  rearrangement](https://doi.org/10.1002/cpa.3160440402), 1991; W. Gangbo and R. McCann,
  [The geometry of optimal
  transportation](https://www.math.toronto.edu/mccann/assignments/477/GangboMcCann96.pdf),
  1996; R. McCann, [Riemannian polar
  factorization](https://doi.org/10.1007/PL00001679), 2001; A. Figalli,
  [The Monge problem on non-compact
  manifolds](https://cvgmt.sns.it/media/doc/paper/1313/transportdist.pdf), 2007.
* M. Beiglböck and W. Schachermayer, [Duality for Borel measurable cost
  functions](https://arxiv.org/abs/0807.1468), Trans. Amer. Math. Soc. 363 (2011); M. Beiglböck,
  C. Léonard, and W. Schachermayer, [A general duality theorem for the Monge--Kantorovich
  transport problem](https://arxiv.org/abs/0911.4347), Studia Math. 209 (2012).
* A. Fathi and A. Figalli, [Optimal transportation on non-compact
  manifolds](https://arxiv.org/abs/0711.4519), Israel J. Math. 175 (2010); A. Figalli and
  N. Gigli, [Local semiconvexity of Kantorovich potentials on non-compact
  manifolds](https://doi.org/10.1051/cocv/2010011), ESAIM Control Optim. Calc. Var. 17 (2011).

### Monge--Ampère and regularity

* G. De Philippis and A. Figalli, [The Monge--Ampère equation and its link to optimal
  transportation](https://www.ams.org/journals/bull/2014-51-04/S0273-0979-2014-01459-4/S0273-0979-2014-01459-4.pdf),
  2014.
* C. E. Gutiérrez, *The Monge--Ampère Equation*, Progress in Nonlinear Differential Equations
  and their Applications 44, Birkhäuser, 2001; D. Hartenstine, [The Dirichlet problem for the
  Monge--Ampère equation in convex (but not strictly convex)
  domains](https://ejde.math.txstate.edu/Volumes/2006/138/hartenstine.pdf), Electron. J.
  Differential Equations 2006, No. 138.
* L. Caffarelli, [interior
  regularity](https://doi.org/10.1090/S0894-0347-1992-1124980-8) and
  [boundary regularity](https://doi.org/10.1002/cpa.3160450905) for Monge--Ampère;
  [interior `W²,p`
  estimates](https://annals.math.princeton.edu/1990/130-1/p05), 1990;
  G. De Philippis, A. Figalli, and O. Savin,
  [`W²,1+ε` regularity](https://arxiv.org/abs/1202.5566); Q. Huang, [Sharp regularity results
  on second derivatives of solutions to the Monge--Ampère equation with VMO type
  data](https://doi.org/10.1002/cpa.20272), Comm. Pure Appl. Math. 62 (2009), 677--705.
* X.-N. Ma, N. Trudinger, and X.-J. Wang,
  [MTW regularity](https://doi.org/10.1007/s00205-005-0362-9); G. Loeper,
  [MTW necessity](https://doi.org/10.1007/s11511-009-0037-8); A. Figalli, Y.-H. Kim,
  and R. J. McCann, [Hölder continuity and injectivity of optimal
  maps](https://arxiv.org/abs/1107.1014); G. De Philippis and A.
  Figalli, [partial regularity](https://www.numdam.org/item/10.1007/s10240-014-0064-7.pdf);
  N. Trudinger and X.-J. Wang, [the second boundary value
  problem](https://www.numdam.org/item/ASNSP_2009_5_8_1_143_0.pdf).

### Dynamics, gradient flows, and barycenters

* L. Ambrosio, N. Gigli, and G. Savaré, [*Gradient Flows in Metric Spaces and in the
  Space of Probability Measures*](https://link.springer.com/book/10.1007/978-3-7643-8722-8),
  2008.
* M. Muratori and G. Savaré, [Gradient flows and evolution variational inequalities in metric
  spaces. I: structural properties](https://arxiv.org/abs/1810.03939), 2018.
* E. Sandier and S. Serfaty, [Γ-convergence of gradient flows with applications to
  Ginzburg--Landau](https://doi.org/10.1002/cpa.20046), 2004; S. Serfaty,
  [the Hilbert/metric-space scheme](https://doi.org/10.3934/dcds.2011.31.1427), 2011.
* S. Lisini, [Characterization of absolutely continuous curves in Wasserstein
  spaces](https://cvgmt.sns.it/paper/568/), 2007, and [Absolutely continuous curves in extended
  Wasserstein--Orlicz spaces](https://www.numdam.org/articles/10.1051/cocv/2015020/), ESAIM
  Control Optim. Calc. Var. 22 (2016), 670--687; E. Abedi, Z. Li, and T. Schultz,
  [Absolutely continuous and BV-curves in 1-Wasserstein
  spaces](https://doi.org/10.1007/s00526-023-02616-1), 2024, for the `p=1` endpoint;
  J.-D. Benamou and Y. Brenier,
  [A computational fluid mechanics solution to the Monge--Kantorovich mass transfer
  problem](https://doi.org/10.1007/s002110050002), 2000.
* R. Jordan, D. Kinderlehrer, and F. Otto, [The variational formulation of the
  Fokker--Planck equation](https://doi.org/10.1137/S0036141096303359), 1998; R. McCann,
  [A convexity principle for interacting
  gases](https://doi.org/10.1006/aima.1997.1634), 1997.
* M. Agueh and G. Carlier, [Barycenters in the Wasserstein
  space](https://doi.org/10.1137/100805741), 2011; T. Le Gouic and J.-M. Loubes,
  [Existence and consistency of Wasserstein
  barycenters](https://arxiv.org/abs/1506.04153), 2017; P. C. Álvarez-Esteban, E. del
  Barrio, J. A. Cuesta-Albertos, and C. Matrán, [A fixed-point approach to barycenters in
  Wasserstein space](https://arxiv.org/abs/1511.05355), 2016.

### Entropy, curvature, and Gromov--Wasserstein

* M. Nutz, [Entropic optimal-transport lecture
  notes](https://www.math.columbia.edu/~mnutz/docs/EOT_lecture_notes.pdf); C. Léonard,
  [A survey of the Schrödinger
  problem](https://arxiv.org/abs/1308.0215), 2014; M. Cuturi,
  [Sinkhorn distances](https://papers.neurips.cc/paper_files/paper/2013/hash/af21d0c97db2e27e13572cbf59eb343d-Abstract.html),
  2013.
* R. Sinkhorn and P. Knopp, [Concerning nonnegative matrices and doubly stochastic
  matrices](https://msp.org/pjm/1967/21-2/pjm-v21-n2-p14-p.pdf), Pacific J. Math. 21 (1967),
  343--348.
* G. Peyré and M. Cuturi, [*Computational Optimal
  Transport*](https://optimaltransport.github.io/book/), 2019.
* L. Chizat, [Doubly regularized entropic Wasserstein
  barycenters](https://arxiv.org/abs/2303.11844), 2023.
* J. Feydy, T. Séjourné, F.-X. Vialard, S.-I. Amari, A. Trouvé, and G. Peyré,
  [Interpolating between optimal transport and MMD using Sinkhorn
  divergences](https://proceedings.mlr.press/v89/feydy19a/feydy19a.pdf), 2019.
* J. Lott and C. Villani, [Ricci curvature for metric-measure
  spaces](https://annals.math.princeton.edu/2009/169-3/p04), 2009; K.-T. Sturm,
  On the geometry of metric measure spaces, [I](https://doi.org/10.1007/s11511-006-0002-8) and
  [II](https://doi.org/10.1007/s11511-006-0003-7), Acta Math. 196 (2006), and its
  [tensorization corrigendum](https://arxiv.org/abs/2401.15094), 2024.
* F. Mémoli, [Gromov--Wasserstein distances and object
  matching](https://doi.org/10.1007/s10208-011-9093-5), 2011; M. Bauer, F. Mémoli, T.
  Needham, and M. Nishino, [The `Z`-Gromov--Wasserstein
  distance](https://www.jmlr.org/papers/volume26/24-2189/24-2189.pdf), 2025; K.-T. Sturm,
  [The space of spaces](https://arxiv.org/abs/1208.0434), 2012; G. Peyré, M. Cuturi, and
  J. Solomon, [Gromov--Wasserstein averaging of kernel and distance
  matrices](https://proceedings.mlr.press/v48/peyre16.html), 2016.
* C. Léonard, [From the Schrödinger problem to the Monge--Kantorovich
  problem](https://arxiv.org/abs/1011.2564), 2012; L. Ambrosio, N. Gigli, and G. Savaré,
  [Calculus and heat flow in metric measure spaces and applications to spaces with Ricci
  bounds from below](https://arxiv.org/abs/1106.2090), 2014, theorem numbers from arXiv v4.
* L. Ambrosio, N. Gigli, and G. Savaré, [Metric measure spaces with Riemannian Ricci curvature
  bounded from below](https://arxiv.org/abs/1109.0222), 2014, theorem numbers from arXiv v2;
  G. Savaré, [Self-improvement of the Bakry--Émery condition and Wasserstein contraction of the
  heat flow in `RCD(K,∞)` metric measure spaces](https://arxiv.org/abs/1304.0643), 2014;
  N. Gigli, A. Mondino, and G. Savaré, [Convergence of pointed non-compact metric measure spaces
  and stability of Ricci curvature bounds and heat flows](https://arxiv.org/abs/1311.4907), 2015;
  J. Lott and C. Villani, *Ricci curvature for metric-measure spaces via optimal transport*,
  [arXiv:math/0412127](https://arxiv.org/abs/math/0412127), theorem numbers from arXiv v4.

## Acknowledgements and provenance

The prior-art survey above draws on Joseph Miller's Vlasov formalization,
Daniel Lyng's Econlib development, Quang Dao and Devon Tuma's VCVio coupling library, and
the archived ItaLean project discussion.  Any ported implementation must preserve
attribution and document the generalizations made during migration.  The roadmap also
uses the theorem boundaries and counterexamples in the cited primary literature to keep
"maximal generality" mathematically honest.
