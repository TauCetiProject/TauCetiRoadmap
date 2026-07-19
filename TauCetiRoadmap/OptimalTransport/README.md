# Roadmap: optimal transport and Wasserstein geometry

Optimal transport is not one theorem.  Its reusable core is a chain of structures:
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

## Reference spine and scope

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

This is a foundation for the subject, not a catalogue of every constraint used in an
application.  Multi-marginal transport belongs here because it is structural and feeds
barycenters.  Mass-varying, partial, martingale, causal, and stochastic-control variants
must be able to extend the public coupling/cost/duality APIs, but their specialized
representation theorems are not prerequisites for completion of this roadmap.

## The generality contract

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
   `W_∞`.  Theorems specialize to `p = 1` or `p = 2` only when their mathematics does.
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

## Pinned conventions

Convention mismatches in this subject silently change formulas.  Fix these before code is
written.

* `Measure.IsCoupling π μ ν` takes the plan first and means Mathlib's marginal measures
  `π.fst = μ` and `π.snd = ν`.  This order agrees with the closest substantial Lean prior
  art and supports dot notation such as `hπ.map`.  A bundled probability
  coupling is a subtype/set of `ProbabilityMeasure (X × Y)` satisfying this relation.
  Use `ProbabilityMeasure`; do not introduce a synonym such as `ProbDist`.
* Use Mathlib's `ProbabilityTheory.HasLaw T ν μ` for transport-map feasibility; do not
  introduce an `IsTransportMap` synonym.  Its argument order is function, target law,
  source measure.  Use `MeasurePreserving T μ ν` only when genuine everywhere
  measurability is part of a theorem.  Map-induced plans are
  `Measure.map (fun x ↦ (x,T x)) μ`; equality and uniqueness of maps are always
  `μ`-a.e.
* The root `transportCost c μ ν` takes raw measures and is the infimum of
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
  `dist`.  At `p = ∞`, prove it equals the infimum of the `π`-essential supremum of `d`,
  not merely a limit as finite exponents grow.
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

## Inventory: what current Mathlib gives us (consume)

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
  integral formula, finite-measure mass correction, and zero characterization.  Extend
  this definition with the
  lower-semicontinuity, strict-convexity, data-processing, tensorization, disintegration,
  and variational theory needed by entropic OT.  Build a distinct signed extended-real
  Boltzmann entropy for infinite reference measures.
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

The audit also found genuine prerequisites that must be built in the layers below:

* lower-semicontinuity of parameterized `lintegral` in the strength needed for transport,
  plus compactness and closedness of coupling sets;
* a coherent extended-real convex-conjugate, subgradient, Legendre-transform, and
  Aleksandrov Monge--Ampère API, together with Euclidean approximate differentiability,
  approximate Jacobians, and the area formula in the strength needed for gradients of
  convex functions;
* metric derivatives, absolutely continuous metric-valued curves, length/geodesic-space
  infrastructure, probability measures on path space, and a reusable CAT(0)/Hadamard-
  space predicate with its CN/strong-convexity API; separately, the opposite-sign
  Alexandrov curvature-bounded-below (`CBB(κ)`) predicate and comparison API needed for
  Alexandrov transport and Sturm's moduli space;
* distributional continuity equations with measure-valued time slices and vector-valued
  fluxes;
* the advanced `InformationTheory.klDiv` API--lower semicontinuity, strict convexity,
  chain rules, data processing, tensorization, Pinsker, and variational formulas--plus
  signed extended Boltzmann entropy and finite-reference bridge lemmas; a continuous
  positive-definite/universal-kernel and signed-Radon-energy API for Sinkhorn divergences;
* the nonsmooth energy and weak-gradient substrate needed to state `RCD`, where that layer
  goes beyond ordinary `CD`.

Do not assume these gaps away.  Each is a named target below before anything consumes it.

## Existing Lean work and coordination

The closest and broadest Lean prior art located by the audit is Joseph K. Miller's
Apache-2.0
[`Vlasov/OT`](https://github.com/Hydrodynamical/Vlasov_Meanfield_Formalization/tree/31186ee11b1c478a35b1775db48384252eb06e22/Vlasov/Vlasov/OT)
development, accompanying
[arXiv:2607.08986](https://arxiv.org/abs/2607.08986).  At the audited commit it defines
a raw-measure, plan-first `Vlasov.IsCoupling π μ ν`, an honest extended `W₁` coupling
cost, real cost-generic results through `ENNReal.ofReal`, gluing, finite
linear-programming attainment and approximation, hard Kantorovich--Rubinstein duality,
map functoriality, and lower semicontinuity of `W₁`.  Its argument order is the convention
pinned above, while the eventual namespace remains a coordination decision.  This work is
a migration and upstream-coordination source, not permission to specialize the full
roadmap to `W₁` or to its application.

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

Before porting or adapting these developments, coordinate with Joseph Miller, Daniel
Lyng, and the VCVio maintainers
[@quangvdao](https://github.com/quangvdao) and [@dtumad](https://github.com/dtumad).  Decide
whether reusable PMF/SPMF results should be upstreamed, adapted through bridge lemmas, or
kept as application-specific prior art; agree on attribution and API direction, and
record the pinned source SHA, license provenance, and chosen boundary in the
implementation PR.  Even an independent implementation should coordinate to avoid
incompatible coupling and cost APIs.  Their licenses permit adaptation, but permission
to integrate and community alignment are separate questions.

Two other search hits are prototypes, not completed dependencies:

* LeanTriathlon's
  [`SinkhornTheorem`](https://github.com/project-numina/LeanTriathlon/tree/main/LiveLeanTriathlonSorry/SinkhornTheorem)
  states a finite positive-matrix scaling result with `sorry`;
* `neural_atlas_MPMcontact` has a
  [`BrenierProposed.lean`](https://github.com/stvsun/neural_atlas_MPMcontact/blob/main/lean/OTContact/BrenierProposed.lean)
  sketch with opaque stand-ins and `sorry`, under GPL-3.0.

Neither can be cited as a proved theorem or copied into Tau Ceti.  Searches of the pinned
Mathlib tree and open Mathlib pull requests found no competing in-flight general
Wasserstein, Benamou--Brenier, or Gromov--Wasserstein API.  An archived
[ItaLean 2025 optimal-transport design
thread](https://leanprover-community.github.io/archive/stream/541885-ItaLean-2025/topic/Projects.3A.20Optimal.20Transport.html)
records work coordinated by Till Wehling and Rémy Degenne; its linked repository is no
longer publicly accessible.  Contact them as well, re-run all searches, and open a Lean
Zulip design thread before beginning Layer 0.  This subject needs agreement on integrating
the Vlasov/Econlib work, `ProbabilityMeasure`, `klDiv`, extended costs, and eventual
Mathlib extraction.

## The build, in dependency layers

The numbering is a dependency order.  A layer is complete only when its definitions have
the basic algebraic, measurable, topological, and extensionality API described here; a
single headline theorem does not discharge it.  Claims and implementation PRs should
take coherent slices inside a layer rather than claim the entire roadmap.

### Layer 0: transport plans, maps, kernels, and gluing

Build the definition-level foundation on arbitrary measurable spaces.

1. Define the raw coupling relation for arbitrary measures and the bundled probability
   coupling space.  Prove that a coupling forces equal total mass, marginal formulas, and
   extensionality, consuming Mathlib's `measurable_fst` and `measurable_snd`.  Prove
   nonemptiness via product couplings for probabilities and normalized products for finite
   equal-mass measures (including the zero-mass case), swap, map/pushforward in either
   coordinate, and invariance under measurable equivalences.
2. Use `ProbabilityTheory.HasLaw` for transport maps and build only the OT-specific graph
   coupling interface around it.  Reuse `ProbabilityTheory.HasLaw.comp`,
   `ProbabilityTheory.HasLaw.congr`, and `MeasureTheory.MeasurePreserving.hasLaw`; prove
   the graph plan's two marginal identities and the implication from a Monge map to a
   Kantorovich plan.  Add identity and measurable-equivalence examples without
   introducing a parallel transport-map predicate.
3. Consume `ProbabilityTheory.condDistrib`,
   `ProbabilityTheory.compProd_map_condDistrib`, and Mathlib's
   `MeasureTheory.Measure.IsCondKernel`/`MeasureTheory.Measure.disintegrate` API to
   specialize standard-Borel disintegration to couplings.  Prove only the OT-facing
   marginal and reconstruction corollaries, plus reconstruction from a marginal and a
   probability kernel.  Derive the coupling-facing a.e.-kernel uniqueness corollary from
   `ProbabilityTheory.eq_condKernel_of_measure_eq_compProd` and its kernel analogue.
4. Prove the gluing lemma: couplings of `(μ,ν)` and `(ν,σ)` admit a joint law on
   `X × Y × Z` with the prescribed two-coordinate marginals.  The one-sided theorem
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
5. Define multi-marginal couplings indexed by a finite type, their projections and
   reindexing, product nonemptiness, marginal replacement, and reduction to the
   two-marginal API.

Acceptance checks: a coupling of two Dirac measures is unique; if the first marginal is
`δ_x`, then the unique coupling with second marginal `ν` is
`Measure.map (fun y ↦ (x,y)) ν`--which is not a Monge plan from `δ_x` when `ν` is
non-Dirac.  Finite
probability vectors give exactly nonnegative matrices with the prescribed row and column
sums, and gluing those matrices agrees with the measure-theoretic construction.

### Layer 1: transport cost, compactness, existence, and stability

Build the primal problem without compactness in its definition.

1. Define the extended transport cost and the set of optimal couplings.  Prove monotonicity
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
2. When the factor/product topologies have measurable opens, build the weak topology on a
   fixed-marginal coupling subtype by inheritance from `ProbabilityMeasure`.  Consume
   `MeasureTheory.ProbabilityMeasure.continuous_map` for the continuous coordinate
   projections.  Prove that the coupling set is closed when the marginal
   probability-measure spaces are `T1`, and give the Polish/Borel theorem as the canonical
   specialization.  Do not introduce another notion of weak convergence.
3. Consume `MeasureTheory.IsTightMeasureSet.prodMk` to derive tightness of the coupling
   family from tightness of its two fixed marginals.  Prove relative compactness by
   Prokhorov and compactness of the coupling set on Polish spaces.  Supply compact
   metrizable corollaries and a separate abstract theorem for spaces satisfying the
   Prokhorov compactness property; do not infer it from Radon regularity alone.
4. In the weak/Borel regime of item 2, prove lower semicontinuity of
   `π ↦ ∫⁻ c dπ` for nonnegative lower-semicontinuous `c`, first for bounded truncations
   and then by monotone convergence.  Include a reusable theorem for costs bounded below
   by integrable marginal terms.
5. Prove primal attainment for lower-semicontinuous costs on Polish spaces and the direct
   method theorem under abstract compactness/lower-semicontinuity hypotheses.  Separate
   finite-value existence from the fact that an optimizer exists with value `∞`.
6. Prove stability under varying marginals/costs: require explicitly that every feasible
   `π_n ⇀ π` satisfies
   `liminf_n ∫ c_n dπ_n ≥ ∫ c dπ`, and prove tightness/relative compactness of optimizer
   subsequences.  Under an explicit recovery-coupling condition, prove convergence of
   values and subsequential convergence of optimizers.  State the fixed-cost
   lower-semicontinuous corollary separately.  Only Layer 10 later packages these
   conditions as Γ-liminf, Γ-limsup, and equicoercivity.

Acceptance checks: solve every `2 × 2` discrete problem by enumerating its coupling
interval.  On ordered finite supports, if
`c(x₁,y₁)+c(x₂,y₂) ≤ c(x₁,y₂)+c(x₂,y₁)` whenever `x₁≤x₂` and
`y₁≤y₂`, prove that
uncrossing terminates and the monotone coupling is optimal; specialize this to
`c(x,y)=|x-y|^p` for `p≥1`.  Show that an infinite barrier cost correctly encodes a
closed transport constraint.

### Layer 2: Kantorovich duality, transforms, and optimality certificates

This layer builds the dual theory at the same level of care as the primal.

1. Define dual-feasible potential pairs and their value, with integrability conditions
   that make the two marginal integrals meaningful.  Prove weak duality once for the
   general interface.
2. Build the finite-real and extended-cost infimal `c`-transform interfaces,
   `c`-concave functions, `c`-superdifferentials, contact sets, and normalization modulo
   additive constants.  Even for real `c,φ`, the infimum may be `-∞`, so the transform has
   an extended-real codomain.  Pin safe subtraction/normalization rules so no theorem
   hides `∞-∞`.  Prove order reversal, double-transform inequalities, feasibility, and
   improvement of a feasible pair by `c`-transformation.  For Polish `X,Y`, if the safely
   defined integrand `(x,y) ↦ c(x,y)-φ(x)` is Borel, prove that
   `{y | φᶜ(y)<a}` is analytic for every `a`.  Build the missing reusable theorem that
   every analytic subset of a Polish space is measurable in `η.completion` for every
   finite Borel measure `η`; apply it to each such sublevel, use that explicit
   completion-level statement in downstream integration, and do not claim Borel
   measurability in general.
   If every section `y ↦ c(x,y)` is continuous, prove that the infimal transform is upper
   semicontinuous.  Separately, if `X` is compact metrizable and the integrand is lower
   semicontinuous, prove attainment of the infimum and lower semicontinuity of the
   transform; with both hypotheses it is continuous.  Record Borel measurability as a
   corollary in these topological regimes.
3. Prove finite-dimensional linear-programming duality for finite spaces, including
   primal and dual attainment and complementary slackness.  Connect it definitionally or
   by transparent equivalences to the measure API.
4. Prove strong Kantorovich duality for continuous finite costs on compact metrizable
   spaces.  Then prove the Polish lower-semicontinuous theorem for
   `c ≥ a ⊕ b`, with `a,b` upper-semicontinuous and integrable against the marginals,
   comparing bounded-continuous and integrable dual classes.  For a real-valued cost,
   finite primal value, and an integrable split upper envelope `c ≤ c_X ⊕ c_Y`, prove dual
   attainment; without that attainment theorem's hypotheses prove only equality of
   values.
5. Add the post-Villani Borel-cost regimes explicitly: finite-valued nonnegative Borel
   costs on Polish spaces following Beiglböck--Schachermayer, and extended-valued Borel
   costs through the relaxed partial-transport primal of
   Beiglböck--Léonard--Schachermayer.  Prove when the relaxed and ordinary primals agree.
   Do not present an unrelaxed arbitrary-Borel theorem where a duality gap can occur.
6. Prove finite multi-marginal duality with the constraint
   `∑ i, φ_i(x_i) ≤ c(x)`, dual attainment in the finite case, and complementary
   slackness.  Connect it to the multi-marginal coupling API from Layer 0.
7. Define finite `c`-cyclical monotonicity.  For finite-valued lower-semicontinuous costs
   on Polish spaces, prove the Schachermayer--Teichmann equivalence between finite-cost
   optimality and concentration on a `c`-cyclically monotone set.  Separately formalize
   their strong-monotonicity/contact-potential representation with its exact Borel and
   extended-value conventions; do not call those potentials integrable dual optimizers.
   Concentration on the contact set of an **integrable dual optimizer** is equivalent to
   optimality only in the dual-attainment regime of item 4, including its split upper
   envelope.  Give the extended-valued cost regime only with its additional
   measurability/relaxation hypotheses.
   Keep concentration on a measurable set distinct from containment of topological
   support, which additionally needs closedness/continuity.
8. Package complementary slackness/contact-set concentration as an optimality
   certificate usable by later map, barycenter, and entropic layers.

The named summit is general Kantorovich duality, not merely its finite or compact special
case.  The Vlasov and Econlib finite-approximation arguments are candidate inputs after
API coordination.

### Layer 3: Wasserstein distances and topology

For every `p : ℝ≥0∞` with `1 ≤ p`, build the extended distance on all probability laws
and its honest finite-distance components.  The `p=∞` endpoint uses Mathlib's `eLpNorm`
convention but has a different topology from the finite-exponent spaces.

1. Define `W_p` as the infimum, over couplings, of the `eLpNorm` of ground `edist`.
   Define the `p`-moment condition with `MemLp` about a basepoint.  Under `μ`-a.e.
   measurability of all distance sections--in particular for a Borel metric structure--
   prove basepoint-independence.  In an extended metric space, make the corresponding
   claim only inside a fixed finite-distance component.  Under joint measurability of the
   ground `edist`, prove symmetry and monotonicity in `p`.  Under a standard-Borel
   measurable structure and measurable ground `edist`, prove the triangle inequality by
   gluing plus Minkowski.  Under the Polish/Borel metric hypotheses, prove
   `W_p=0 ↔ μ=ν` on a genuine metric base; on a pseudometric base give the induced
   measurable quotient/pushforward statement instead.  For `p < ∞`, prove the exact
   bridge to the integral-of-`edist^p`/root formula and Layer 1's transport cost.
2. In the standard-Borel/measurable-distance regime of item 1, define a
   `PseudoEMetricSpace` component anchored at a reference law `μ₀` by finite `W_p`
   distance.  On an ordinary `PseudoMetricSpace` with measurable distance sections,
   define `P_p(X)` by finite moment about one/every basepoint and prove that it is the
   corresponding component.  Give it a `PseudoMetricSpace`; under the Polish/Borel
   hypotheses give a genuine `MetricSpace` when the ground distance separates points,
   and otherwise a quotient metric.  Consume `Subtype.instMeasurableSpace`, which
   definitionally pulls back the measurable structure from `ProbabilityMeasure`; do not
   add a second measurable-space instance.  For `1 ≤ p < ∞`, under the Polish/Borel
   hypotheses, prove that this inherited structure is the Borel σ-algebra of the `W_p`
   topology, hence that opens are measurable; do the same for anchored components.  This
   compatibility is a prerequisite for population laws `P ∈ P_p(P_p(X))` in Layer 12.
   For `p=∞` and genuinely extended anchored components, choose and compare measurable
   structures explicitly, claim equality only under a sourced theorem, and prove the
   measurability needed by later uses.  Prove compatibility among `dist`, `edist`,
   `eLpNorm`, the primal cost, and optimal couplings.
3. For `1 ≤ p < ∞`, prove separability and completeness of `P_p(X)` when `X` has those
   properties; prove compactness/tightness criteria, density of finitely supported
   measures, and approximation by empirical or quantized measures.
4. For `1 ≤ p < ∞`, characterize `W_p` convergence as weak convergence plus
   convergence/uniform integrability of `p`-moments.  Prove lower semicontinuity under
   weak convergence and continuity under the stronger topology.
5. Prove functorial estimates: pushforward by an `L`-Lipschitz map is `L`-Lipschitz in
   `W_p`; products, mixtures, convolution/translation on normed groups, and Markov-kernel
   contractions have their standard bounds under explicit assumptions.
6. Prove that the `p=∞` specialization is the infimum of coupling-wise essential suprema
   and give it the conventional notation `W_∞`.  Build its anchored finite-distance
   components.  If `X` is a complete separable metric space with its Borel structure,
   prove that every anchored finite-`W_∞` component is complete, using near-optimal
   consecutive couplings and Layer 0's countable gluing; give the global theorem only
   when the carrier has a single finite-`W_∞` component.  State any stronger
   nonseparable/Radon version separately with its own coupling-extension hypothesis.
   Characterize `W_∞` convergence by couplings whose essential-supremum displacements
   tend to zero, not by weak convergence plus moments; record that finite support need not
   be dense and separability can fail.  On every Polish metric space and for all
   `μ,ν ∈ P(X)`, prove, as an identity in `[0,∞]`,
   `W_∞(μ,ν) = sup_{1≤p<∞} W_p(μ,ν) = lim_{p→∞} W_p(μ,ν)`, and prove
   attainment of the `W_∞` infimum.  Retaining infinite values removes any need for a
   bounded-support or all-moments hypothesis; follow
   [Givens--Shortt Proposition 1](https://doi.org/10.1307/mmj/1029003026).
7. Consume `ProbabilityTheory.cdf` on `ℝ`; build the generalized inverse/quantile of a
   Borel probability law, its measurability and pushforward of uniform measure, and the
   optimal monotone quantile coupling.  For every `p ∈ [1,∞]`, prove that `W_p` is the
   `Lᵖ(0,1)` distance of the two quantiles, with the integral/root and essential-supremum
   formulas at the corresponding endpoints.
8. Prove Kantorovich--Rubinstein duality for `W_1` on Polish metric spaces with finite
   first moments, normalized at a basepoint.  Derive the bounded-Lipschitz and compact
   variants and compare with Mathlib's weak-convergence metrics.
9. Build the shared measured-metric carrier used by Layers 14--15: a complete separable
   metric carrier, a Borel reference measure finite on bounded sets, support/full-support
   reduction, and measure-preserving isometries.  The transported `ProbabilityMeasure`
   remains separate from this reference measure.  Do not yet impose curvature, a kernel,
   or a quotient.

Acceptance checks: on a metric base, `W_p(δ_x,δ_y)=d(x,y)` and zero distance separates
laws; a pseudometric example exercises the quotient statement.  Translations of a fixed
law in a normed space have the expected upper bound and equality in the canonical cases;
the one-dimensional quantile formula computes `W_p`.

### Layer 4: the Monge problem and abstract transport maps

Treat deterministic transport as a problem in its own right before proving Brenier.

1. Define the Monge feasible set using `ProbabilityTheory.HasLaw T ν μ`, and define its
   value by integrating the cost of such a.e.-measurable maps.  Prove the relaxation
   inequality from Monge to Kantorovich and characterize equality for a graph coupling.
2. Build the basic feasibility theory.  Under `MeasurableSingletonClass Y`, for a point
   atom `x`, every transport map satisfies `ν({T x}) ≥ μ({x})`; a standard-Borel target
   is a sufficient corollary.  If `A` is measurable, `0 < μ A`, and every measurable
   `B ⊆ A` has `μ B = 0` or `μ B = μ A`, prove the corresponding atom-set theorem under
   its standard-Borel target hypothesis.  Use Mathlib's `MeasureTheory.NoAtoms μ` for the
   nonatomic corollaries: a nonatomic standard probability space admits a measurable map
   to every standard-Borel target law.  Include exact atomic/nonatomic decompositions
   rather than claiming every Monge problem is feasible.
3. Let `X,Y` be Polish, `μ ∈ P(X)` nonatomic, and `ν ∈ P(Y)`.  Prove that the
   graph couplings `{(id,T)_{#}μ | T : X → Y Borel, T_{#}μ=ν}` are narrowly dense
   in `Π(μ,ν)`.  Hence Monge and Kantorovich values agree for bounded continuous real
   costs, while the Monge infimum need not be attained.  Then formalize
   [Pratelli Theorem B](https://www.numdam.org/item/AIHPB_2007__43_1_1_0/): for
   continuous `c : X×Y → [0,∞]`, possibly unbounded or infinite-valued,
   the Monge infimum equals the Kantorovich minimum, possibly `∞`, under the same
   nonatomic-source hypothesis.  For finite equal-mass measures, normalize and handle
   zero mass separately.
4. For Polish `X,Y`, fixed `μ ∈ P(X)`, Borel maps `T_n,T : X → Y`, and graph plans
   `(ι,T_n)_{#}μ`, prove the AGS graph-plan theorem: narrow convergence to
   `(ι,T)_{#}μ` is equivalent to
   `MeasureTheory.TendstoInMeasure μ atTop T_n T`.  Under this convergence, prove `Lᵖ`
   convergence for `1 ≤ p < ∞` exactly when `{d_Y(T_n(·),ȳ)ᵖ}` satisfies Mathlib's
   `MeasureTheory.UniformIntegrable` predicate for one (hence every) basepoint `ȳ`.
   Consume the existing convergence-in-measure and uniform-integrability lemmas.
   A varying-source theorem must first choose comparison couplings or identifications;
   do not define convergence in a moving source measure or recover pointwise convergence
   from narrow convergence alone.
5. Prove the reusable **abstract twist theorem**.  Starting from a dual contact set, a
   potential differentiable `μ`-a.e., source differentiability of `c`, and injectivity of
   `y ↦ Dₓc(x,y)`, show that each contact fiber is a singleton almost everywhere and that
   an optimizer concentrated on contact has singleton conditional fibers there.  Formulate
   local semiconcavity or superdifferentiability assumptions separately from twist.
6. Build measurable-selection lemmas that turn the pointwise singleton formula into a
   measurable/a.e.-measurable map.  Then prove that the optimizer is induced by that map
   and that the map is unique `μ`-a.e.  The formula involving an inverse derivative is a
   theorem, not a noncomputable definition with hidden existence.

Acceptance checks: an atomic source/non-atomic target demonstrates infeasibility; a
nonatomic source realizes a prescribed finite law by a partition; deterministic plans
approximate a non-graph coupling; and a twist-cost finite example recovers a unique map
from complementary slackness.

### Layer 5: convex analysis, Brenier, and polar factorization

The Euclidean quadratic theorem rests on a reusable convex-analysis tower.  Build that
tower rather than hiding it inside the final proof.

1. On a separated real dual pair `(E,F,⟪·,·⟫)`, build proper `EReal`-valued convex
   functions, Legendre--Fenchel conjugates, Fenchel--Young, subgradients,
   conjugate-subgradient reciprocity, and the algebraic Rockafellar theorem for cyclically
   monotone sets.  Under compatible Hausdorff locally convex topologies, prove the
   lower-semicontinuous Fenchel--Moreau theorem.  Consume Mathlib's `SeparatingDual` and
   `LocallyConvexSpace` vocabulary where applicable and upstream general-purpose additions.
2. Specialize the dual-pair tower to finite-dimensional real spaces: build epigraphs and
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
   lower-dimensional domains are genuinely claimed.  Alexandrov twice differentiability
   and positivity of the distributional Hessian remain new prerequisites for both maps
   and Monge--Ampère regularity.
3. Consume `ProbabilityTheory.multivariateGaussian`, `Matrix.PosDef`/`Matrix.PosSemidef`,
   and Mathlib's continuous-functional-calculus square-root API.  Build the
   positive-definite matrix square-root, inverse/geometric-mean identities, and Gaussian
   covariance-pushforward lemmas used by the Brenier map, the closed `W₂` formula,
   interpolation, and barycenters.
4. Consume item 1's Rockafellar theorem and connect ordinary cyclic monotonicity to
   `c`-cyclical monotonicity for `c(x,y)=‖x-y‖²/2`.
5. Prove **Brenier's theorem** in its strong standard form: for
   `μ,ν ∈ P₂(ℝⁿ)` with `μ` absolutely continuous with respect to Lebesgue measure, the
   quadratic problem has a unique optimal plan, induced by `∇u` for a proper
   lower-semicontinuous extended-valued convex `u`.  Prove that `u` is finite and
   differentiable `μ`-a.e.; the total transport map is an a.e. representative selected
   from its gradient/subgradient, not a globally defined gradient at every point.  The
   target need not be absolutely continuous.
6. Prove converse optimality for gradients of convex functions, a.e. uniqueness of the
   map, the inverse relation through `∇u*` when the target is also absolutely continuous,
   and the following potential-uniqueness tier.  If `Ω⊆ℝⁿ` is connected and open,
   `μ(Ω)=1`, and `μ|_Ω` is equivalent to Lebesgue measure on `Ω`, then two convex
   potentials finite on `Ω` that induce the same map `μ`-a.e. differ by one constant on
   `Ω`.  Prove the relative-interior analogue in `affineSpan(Ω)` using affine Lebesgue
   measure; make no global constant claim across disconnected source components.
7. Prove the exact stronger quadratic source theorem: for `μ,ν ∈ P₂(ℝⁿ)`, assume
   `μ(E)=0` for every Borel `E` covered by countably many `(n-1)`-dimensional Lipschitz
   submanifolds.  Prove the same existence and, at finite optimal value, a.e.-uniqueness
   of the optimal graph map and coupling as in item 5.  Keep the familiar
   absolutely-continuous corollary as the public entry point.
8. Prove the Gangbo--McCann extension for `c(x,y)=h(x-y)`.  Take continuous
   `h : ℝᵈ → [0,∞)` satisfying their (H1) strict convexity, (H3) superlinear growth
   `h(x)/‖x‖ → ∞`, and the exact (H2) level-set condition at infinity: for every
   height `r < ∞` and aperture `θ ∈ (0,π)`, every sufficiently distant vertex `p`
   admits `z ≠ 0` such that `h(x) ≤ h(p)` throughout the truncated cone
   `{x | ‖x-p‖·‖z‖ cos(θ/2) ≤ ⟨z,x-p⟩ ≤ r‖z‖}`.  For Borel probability laws
   with `μ ≪ Leb`, construct a `c`-concave `φ`, the map
   `T(x)=x-∇(h*)(∇φ(x))`, and its graph/cyclical optimality.  When the optimal
   value is finite, prove a.e. uniqueness of both this map and the optimal coupling;
   make no uniqueness assertion in the all-`∞` case.  Identify `∇(h*)`
   with `(∇h)⁻¹` only under the differentiability hypotheses that make this formula
   valid.  State the countably `(d-1)`-rectifiable-null source extension separately,
   retaining (H1)--(H3) and requiring exactly `h ∈ C¹,¹_loc(ℝᵈ)` as in the cited
   theorem.
9. Formalize Brenier's original polar factorization for `1 ≤ p < ∞`.  First consume
   PDE Lane A.1's weak derivatives to define the weighted space `W¹,p(Ω,P)`, its norm
   `(∫Ω (|v|^p+‖∇v‖^p) dP)^(1/p)`, and its completeness.  Express the required
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
   Distinguish the two uniqueness statements and prove continuity of the factors in the
   sourced topologies.  Give the smooth bounded `Ω` with normalized Lebesgue `P`
   specialization, where the compact-embedding hypothesis follows by bridging PDE Lane
   A.6's Rellich--Kondrachov theorem to the weighted definition.

The main primary source is Brenier's [polar factorization
paper](https://doi.org/10.1002/cpa.3160440402); the strictly convex difference-cost route
follows Gangbo--McCann's [geometry of optimal
transportation](https://www.math.toronto.edu/mccann/assignments/477/GangboMcCann96.pdf).

Acceptance checks: monotone rearrangement on `ℝ` agrees with the gradient of a convex
potential; the Brenier map between nondegenerate Gaussians has the standard positive
matrix formula; conjugate potentials give inverse maps; and the graph plan of `∇u`
saturates the quadratic dual constraint.

### Layer 6: Monge--Ampère measures, equations, and regularity

This is a full regularity layer, not a one-line determinant corollary of Brenier.

#### 6A. Aleksandrov weak theory

1. For an open convex `Ω ⊆ ℝⁿ` and finite convex `u : Ω → ℝ`, define the
   subgradient image and Aleksandrov measure `MA_u(E)=Lebesgue(∂u(E))`.  Prove that this
   is a locally finite Borel measure.  For `u ∈ C²(Ω)`, prove
   `MA_u = det(D²u) dx`.
2. Build examples with singular Monge--Ampère mass.  Under locally uniform convergence
   of convex functions on an open domain, prove convergence of the locally finite
   Aleksandrov measures against compactly supported continuous tests (equivalently, on
   relatively compact continuity sets); upgrade this to narrow convergence only with
   finite total mass and tightness.  Prove the comparison principle, the Aleksandrov
   maximum principle, and Alexandrov's twice-differentiability theorem.
3. Define Aleksandrov, viscosity, a.e./Sobolev, and classical solutions separately.  Prove
   the equivalences that hold under continuity, strict positivity, and convexity
   assumptions; keep counterexamples showing why the notions differ outside those
   regimes.
4. Prove existence, uniqueness, and stability for the convex Dirichlet problem on bounded
   convex domains with finite Borel right-hand side, including the boundary-value
   hypotheses needed by the comparison argument.

#### 6B. The transport equation

5. For source and target densities `f` and `g`, define the weighted weak measure
   `MA_{u,g}(E)=∫_{∂u(E)} g(y)dy`.  Under essential injectivity and target-coverage
   hypotheses, prove `MA_{u,g}=f dx` for the Brenier potential before dividing by
   `g(∇u)`.
6. First build the Euclidean approximate-differentiability and approximate-Jacobian API,
   including the area formula in the strength needed for a.e.-twice-differentiable
   gradients of convex functions.  Then derive the a.e. Jacobian equation
   `f(x)=g(∇u(x)) det(D²u(x))`.  State the second boundary condition first in its honest
   set-valued form, then upgrade it when regularity permits.
7. Prove exactly when a Brenier solution is an Aleksandrov solution.  Convexity of the
   target support is load-bearing: singular subgradient mass not seen by `g` cannot be
   discarded in general.

The regularity sublayers consume the [PDE roadmap](../PDE/README.md), Lane A.1, for the
weak-derivative Sobolev API and Lane A.7 for Hölder spaces.  Build the missing local
vanishing-mean-oscillation (VMO) and quantitative oscillation-modulus API here, with a
bridge to PDE's bounded-mean-oscillation API, before using those notions in section-local
estimates.

#### 6C. Quadratic Caffarelli theory

8. Define convex sections
   `S_u(x,h;p)={y | u(y)<u(x)+⟨p,y-x⟩+h}` for `p ∈ ∂u(x)`, with the gradient
   specialization at differentiability points.  Build affine/John normalization,
   section nesting, localization and engulfing, volume scaling, and the section-adapted
   Vitali covering package before any estimate consumes normalized sections.  Then, for
   bounded Euclidean source and convex target domains with densities bounded above and
   below by positive constants, prove local strict convexity, local `C¹,α`, and local
   `W²,1+ε` regularity of the Brenier potential.  State estimates on normalized convex
   sections compactly contained in the domain, carry `0 < λ ≤ f ≤ Λ`, strict convexity,
   section normalization/distance, and quantitative dependence of constants visibly.
9. Add the sharper section-local tiers for a strictly convex Aleksandrov solution with
   `0 < λ ≤ f ≤ Λ`: continuity or vanishing-mean-oscillation (VMO) control of `f`
   with its modulus gives `W²,p` for every fixed finite `p`; `f ∈ C⁰,α` gives `C²,α`;
   smoother right-hand side gives higher interior regularity.  Do not state these from
   positivity without the normalized-section and oscillation hypotheses.
10. Prove global boundary regularity and smooth-diffeomorphism results for smooth uniformly
    convex source and target domains with smooth densities bounded away from zero and
    infinity.  Build the boundary estimates they consume rather than importing a theorem
    name as an axiom.
11. Formalize regression examples: a disconnected or nonconvex target can make a Brenier
    map discontinuous despite smooth positive data; density bounds alone do not imply all
    `W²,p` estimates; and strict convexity cannot be omitted in higher dimensions.

#### 6D. General costs, Ma--Trudinger--Wang (MTW), and partial regularity

12. For costs with the regularity required by each derivative, define A1 source twist,
    A1* target twist, A2 mixed-Hessian nondegeneracy, the `c`-exponential, `c`-segments,
    mutual and uniform source/target `c`-convexity, and the weak A3w and strong A3s
    Ma--Trudinger--Wang conditions.  Each is a separate predicate with bridge lemmas to the
    abstract twist layer; MTW derivative statements carry at least the cited `C⁴` cost
    regularity.
13. Derive the general generated-Jacobian/`c`-Monge--Ampère equation, including the
    `det D²_xy c` factor and the sign convention pinned by the chosen `c`-exponential.
    For bounded open `U,V ⊆ ℝⁿ`, a cost `c ∈ C⁴(cl U × cl V)` satisfying the
    bi-twist/nondegeneracy condition (B1) of
    [Figalli--Kim--McCann (FKM)](https://arxiv.org/abs/1107.1014), and a `c`-convex
    potential `u = u^{c*c}`, define `|∂ᶜ u|(E)=Lebesgue(∂ᶜ u(E))`; prove FKM Lemma 3.1,
    including that this is a Borel measure of mass `Lebesgue(V)` and its pushforward
    representation through the a.e. inverse contact map.
14. Under the cited `C⁴`, A1/A1*, A2, A3w, and mutual `c`-convexity hypotheses, prove
    Loeper's maximum principle/contact-set connectedness.  Prove that failure of A3w can
    yield discontinuous maps for smooth positive data.  Formalize FKM Theorem 2.1 on
    bounded open `U,V`: `c ∈ C⁴(cl U × cl V)` satisfies their bi-twist,
    nondegeneracy, mutual `c`/`c*`-convexity, A3w, and strong target `c*`-convexity
    conditions (B0--B3 and B2s); on open `U' ⊆ U`, both density ratios are essentially
    bounded in the theorem's stated domains.  Prove that the optimal map is locally
    Hölder and one-to-one on `U'`, with the exponent's dependence recorded.  Keep A3s and
    global classical second-boundary-value regularity as separate targets requiring
    uniform mutual `c`-convexity and the cited smooth boundary/cost/density hypotheses.
15. Prove De Philippis--Figalli partial regularity without MTW for
    `c ∈ C²,α_loc` satisfying A1/A1* and A2, bounded Euclidean domains, and **continuous**
    source and target probability densities locally bounded away from zero and infinity.
    Produce relatively closed null sets `Σ_X,Σ_Y` such that the optimal map is a
    `C⁰,β_loc` homeomorphism between their complements for every `β < 1`.  With
    `c ∈ Cᵏ⁺²,α_loc` and `Cᵏ,α_loc` densities, prove the corresponding
    `Cᵏ⁺¹,α_loc` diffeomorphism off those two singular sets.

Use the De Philippis--Figalli [Monge--Ampère and optimal-transport
survey](https://www.ams.org/journals/bull/2014-51-04/S0273-0979-2014-01459-4/S0273-0979-2014-01459-4.pdf)
as the statement checklist.  The MTW branch is governed by the
[Ma--Trudinger--Wang paper](https://doi.org/10.1007/s00205-005-0362-9) and
[Loeper's necessity theorem](https://doi.org/10.1007/s11511-009-0037-8); the final target
is De Philippis--Figalli [partial
regularity](https://www.numdam.org/item/10.1007/s10240-014-0064-7.pdf).

### Layer 7: Riemannian Brenier--McCann transport

The [geometric-topology roadmap](../GeometricTopology/README.md), Layer 7, supplies
Riemannian volume, connection, and curvature.  It does **not** currently supply
exponential maps, their local inverse logarithms on normal neighborhoods, Hopf--Rinow,
minimizing geodesics, injectivity radius, or cut-locus measurability/nullity needed here;
those are owned by this layer before any transport theorem consumes them.  No global
single-valued logarithm is introduced across the cut locus.

1. For finite-dimensional boundaryless Riemannian manifolds, build exponential maps,
   their local inverse logarithms on normal neighborhoods, and the measurable/a.e.
   minimizing-initial-velocity selections used by transport.  Build geodesic completeness
   and Hopf--Rinow, existence of minimizing geodesics, injectivity radius,
   squared-distance semiconcavity, cut-locus measurability and volume-nullity, and the a.e.
   differentiability facts used by transport.  State connectedness, geodesic completeness,
   and moment hypotheses separately from compactness.
2. Specialize Layer 2's `c`-concave/contact API to `c(x,y)=d(x,y)²/2`.  At every
   differentiability point of the semiconcave potential, prove that contact endpoints
   avoid the relevant cut locus and equal `exp_x(-∇φ(x))`.  Deduce this volume-a.e., and
   hence `μ`-a.e. only when `μ ≪ volume`; connect the sign convention to the Riemannian
   exponential map.
3. Prove **McCann's theorem**: for finite-second-moment laws on a finite-dimensional,
   connected, boundaryless, geodesically complete smooth Riemannian manifold, with source
   absolutely continuous with respect to Riemannian volume, the unique quadratic optimal
   plan is induced by
   `T(x)=exp_x(-∇φ(x))`.  Give the compact-manifold statement, where moments are
   automatic, as a corollary rather than the root theorem.
4. Prove the inverse-map result when the target is also absolutely continuous.  Define the
   Riemannian interpolation explicitly by
   `μ_t = Measure.map (fun x ↦ exp_x (-t • ∇φ x)) μ`, prove its minimizing-geodesic and
   cut-locus properties, and require Layer 9 to identify it with the generic displacement
   interpolation.  For Riemannian polar factorization, let `M` be a connected compact
   `C³` boundaryless Riemannian manifold with normalized volume `m`, and let
   `s : M → M` be Borel with `s_#m ≪ m`.  Prove the a.e.-unique factorization
   `s=T∘u`, where `u_#m=m` and `T(x)=exp_x(-∇ψ(x))` is the unique quadratic optimal
   map from `m` to `s_#m`, with the `c`-concavity convention `ψᶜᶜ=ψ`.  Prove
   uniqueness of the potential modulo constants, select the representative satisfying
   `∫ ψ dm=0`, and distinguish uniqueness of `u`, `T`, and that representative.
5. On the open subset of `M×M` where `d²/2` is smooth, away from the cut-locus relation,
   connect the smooth general-cost MTW predicates from Layer 6 to Riemannian squared
   distance.  Every regularity theorem carries a transport-domain/cut-locus-avoidance
   hypothesis strong enough for its derivatives and estimates.  Do not claim that
   nonnegative sectional curvature by itself implies regularity; MTW and cut-locus
   geometry are stronger requirements.
6. Develop the non-twist cost `c=d` through transport rays.  First prove the exact
   Feldman--McCann theorem on a complete connected Riemannian manifold for two
   compactly-supported nonnegative `L¹` volume densities of equal mass.  Then prove
   Figalli's one-sided-absolute-continuity, noncompact extension: for probability laws
   `μ,ν` on a smooth manifold with complete Riemannian metric,
   `μ ≪ volume`, and `∫ d(x,y) dμ(x)dν(y)<∞`--equivalently, both laws have finite first
   moment--there is a Monge minimizer whose graph plan is Kantorovich-optimal.  Record that
   uniqueness generally fails; the `p=1` branch is not a strict-convexity corollary.
7. Prove the Riemannian squared-distance specialization of Layer 6's partial-regularity
   theorem after all cut-locus and coordinate prerequisites above have landed.

McCann's original [polar factorization on Riemannian
manifolds](https://doi.org/10.1007/PL00001679) is the primary source; Villani, Chapter 10,
Theorem 10.35, supplies the complete noncompact finite-cost form.  The compact-support
distance-cost milestone follows Feldman--McCann,
[Monge's mass transport problem on a Riemannian
manifold](https://www.ams.org/journals/tran/2002-354-04/S0002-9947-01-02930-0/); the
one-sided noncompact theorem follows Figalli,
[The Monge problem on non-compact manifolds](https://cvgmt.sns.it/media/doc/paper/1313/transportdist.pdf),
Theorem 1.1 and its distance-cost specialization.

### Layer 8: metric curves, dynamic plans, and Benamou--Brenier

Build the maximally general path-space theory first, then the Eulerian specialization.

1. Define `ACᵖ([0,T];X)`, metric derivatives, length, `p`-energy/action, constant-speed
   curves, geodesics, length spaces, and measurable families of curves.  Prove the
   fundamental theorem for absolutely continuous metric-valued curves, reparameterization,
   lower semicontinuity of action, and compactness under equicontinuity/tightness.  Build
   the reusable Alexandrov curvature-bounded-below predicate `CBB(κ)`, its
   triangle/quadruple comparison formulations, their equivalence in the applicable
   geodesic category, and basic isometry/geodesic-invariance API.  Keep lower curvature
   bounds distinct from CAT(0)'s upper bound.
2. Build continuous path space with its Borel structure, evaluation maps `e_t`, endpoint
   laws, dynamic plans, and plans concentrated on base-space geodesics.  Prove
   measurability of all evaluation and action functionals used later.  On a complete
   separable geodesic space, prove that the endpoint/constant-speed-geodesic relation is
   closed.  Build the Jankov--von Neumann uniformization theorem for analytic relations
   between standard-Borel/Polish spaces, using Layer 2's
   analytic-set/completion-measurability bridge, and apply it to this relation.  Relative
   to each fixed endpoint law, pass through its
   completion and choose a Borel representative equal almost everywhere.  Keep a global
   Borel geodesic bicombing as stronger input data, not as an automatic consequence of
   Polish geodesicity.
3. Prove Lisini's superposition theorem: for complete separable `X` and
   `1 < p < ∞`, every
   `ACᵖ` curve in `P_p(X)` is represented by a probability law on `ACᵖ` paths with the
   exact averaged-speed/minimality relation.  No geodesicity or local compactness is
   assumed here.
4. In complete separable geodesic spaces and for `1 < p < ∞`, characterize Wasserstein
   geodesics by optimal dynamic plans concentrated on constant-speed base geodesics.
   Prove that every two-time projection is optimal and obtain the metric dynamic-action
   formula.
5. Develop the `p=1` endpoint separately through BV path lifts and total-variation
   measures.  Include a regression example where an absolutely continuous `W₁` curve is
   produced by mixing discontinuous particle paths, showing why the `1 < p < ∞` theorem
   cannot simply be generalized.
6. Let `(X,τ,d)` be an extended Polish space in Lisini's sense: `τ` is induced by a
   complete separable metric, `d` is an extended complete metric, `d`-convergence implies
   `τ`-convergence, and `d` is `τ×τ` lower semicontinuous.  For the Orlicz function
   `ψ∞` equal to `0` on `[0,1]` and `∞` on `(1,∞)`, prove the superposition principle
   for `AC^{ψ∞}` curves and
   `|μ′|(t)=ess sup_η |u′_η|(t)`.  Prove that endpoint-optimal plans concentrated
   on constant-speed `d`-geodesics generate `W_∞` geodesics, and that every representing
   superposition plan for a `W_∞` geodesic that satisfies the exact Orlicz speed identity
   supplied by Lisini's superposition theorem has optimal two-time marginals.  Do not
   claim that its sample paths are geodesics: Lisini's converse uses strict convexity,
   which `ψ∞` lacks.
7. On finite-dimensional normed spaces, define distributional solutions of
   `∂ₜμₜ + div(vₜ μₜ)=0`, including measurable time slices, vector-valued flux measures,
   test functions, and boundary-time terms.  Prove superposition in both directions and
   identify minimal `Lᵖ(μₜ)` velocity fields for `1 < p < ∞`.
8. Prove the Eulerian **Benamou--Brenier formula** for `1 < p < ∞`, with `p=2` as the
   named classical theorem:
   `W_p(μ₀,μ₁)^p = inf ∫₀¹ ∫ ‖v_t(x)‖^p dμ_t(x)dt`
   over continuity-equation solutions.  Prove attainment.  For a Monge map `T` with
   finite `p`-displacement, put `F_t(x)=(1-t)x+tT(x)` and
   `μ_t = Measure.map F_t μ`.  Define the Lagrangian vector flux and, by disintegrating
   `μ` over `F_t`, the barycentric Eulerian velocity
   `v_t(y)=E_μ[T(X)-X | F_t(X)=y]`.  Prove the continuity equation and the action bound
   `∫₀¹∫‖v_t‖^p dμ_t dt ≤ ∫‖T-id‖^p dμ`.  If `F_t` is a.e. injective,
   prove `v_t(F_t(x))=T(x)-x` a.e.  If the graph plan of `T` is optimal, prove that
   `μ_t` is the displacement geodesic and that the action bound is an equality; Layer 9
   identifies precisely this optimal tier with its generic displacement-interpolation
   relation.
9. Extend the Eulerian formula to smooth complete Riemannian manifolds once divergence,
   Riemannian volume, and time-dependent vector fields exist.  State a structured Banach
   or nonsmooth metric-measure version only after its differential/divergence API is
   actually built.

The original Euclidean theorem is Benamou--Brenier,
[doi:10.1007/s002110050002](https://doi.org/10.1007/s002110050002).  The more general
dynamic-plan route follows Lisini's [characterization of absolutely continuous
Wasserstein curves](https://cvgmt.sns.it/paper/568/); the extended endpoint follows his
[Wasserstein--Orlicz theory](https://www.numdam.org/articles/10.1051/cocv/2015020/).

Acceptance checks: moving a Dirac mass along a base geodesic has exactly the base action;
linear interpolation of an optimal Euclidean plan gives the expected `W_p` geodesic;
the map-induced linear curve satisfies the barycentric velocity/action theorem, with the
pullback formula tested under an injectivity hypothesis; and the continuity
equation for a translating density has the expected constant velocity.

### Layer 9: displacement geometry and convexity

Turn `P_p(X)` from a metric space into a usable geodesic space.

1. Define displacement interpolations from an optimal dynamic plan, consuming Layer 8's
   measure-relative geodesic selector when no Borel bicombing is supplied, and prove
   independence from presentation only when the relevant optimal plan/geodesic is unique.
   Prove that Layers 7 and 8's explicit Riemannian and Euclidean map-induced curves agree
   with this generic relation.  Define generalized geodesics based at a third measure
   through a glued three-plan.
2. Prove that `P_p(X)` is geodesic when `X` is complete, separable, and geodesic, and
   characterize constant-speed geodesics in the finite `1 < p < ∞` regime.  Prove
   uniqueness only from the
   combination of almost-everywhere unique base geodesics and uniqueness of the endpoint
   optimizer; nonbranching alone is not silently promoted to uniqueness.
3. Define ordinary geodesic convexity, strong/weak displacement convexity, and convexity
   along generalized geodesics, all with a visible parameter `λ`.  Develop endpoint,
   restriction, lower-semicontinuity, and stability lemmas for each notion.
4. Prove convexity of squared Wasserstein distance along generalized geodesics in the
   Euclidean `W₂` setting.  This is the load-bearing estimate for resolvents and minimizing
   movements and cannot be replaced by an incorrect assertion of convexity along every
   ordinary geodesic.
5. Define potential energy `μ ↦ ∫ V dμ`, symmetric interaction energy
   `μ ↦ (1/2)∫ W d(μ⊗μ)`, and internal energy relative to `m`, with
   `∫ U(ρ) dm` on the absolutely continuous part and the recession constant multiplying
   singular mass.  Pin safe `EReal` and integrability conventions before algebra.  Prove
   McCann's displacement-convexity conditions for internal energies and the standard
   convexity results for potential and interaction energies under explicit
   Hessian/convexity hypotheses.  The signed Boltzmann-entropy instance is proved in
   Layer 11 after that functional exists.
6. Consume Layer 3's quantile-coupling theorem to develop the one-dimensional quantile
   isometry, geodesics, geodesic convexity, and pointwise minimization identities without
   Euclidean-density assumptions.  Layer 12 consumes those identities for barycenter
   formulas.

The public API must distinguish a selected interpolation from the proposition that a
curve is a displacement interpolation.  This lets later uniqueness theorems improve a
relation into a function without changing foundational definitions.

### Layer 10: abstract metric gradient flows

Build the Ambrosio--Gigli--Savaré theory on an anchored finite-distance component
`D(x_*)={x | edist x x_* < ∞}` of a general extended metric space before specializing it
to probability measures.  Prove that changing the anchor within the same component does
not change the resulting theory.  Every test point in a distance-dependent inequality is
in that component (and in the energy domain when the formula requires a finite energy);
ordinary metric spaces receive the global corollaries.

1. On Layer 8's `p`-absolutely-continuous metric-valued curves, define proper
   lower-semicontinuous extended-real energies, descending and relaxed slopes, and local
   and strong upper gradients.  For `1 < p < ∞` and its conjugate `q`, define the
   conjugate-exponent energy-dissipation inequality.  Recover the quadratic `p=q=2` API
   as the standard notation and treat endpoint exponents through separately justified
   statements.
2. Define curves of maximal slope and energy-dissipation equalities.  Prove the chain-rule
   implications under strong-upper-gradient hypotheses and keep existence separate from
   a definition that merely packages an equality.
3. Consume Layer 9's componentwise `λ`-geodesic-convexity predicates and define `EVI_λ`
   solutions, quantifying its comparison point over the same finite-distance component
   and the effective domain of the energy.  Prove that EVI implies the
   energy-dissipation identity, contraction, uniqueness, regularization, and semigroup
   laws.  Do not assert the converse or EVI existence on every geodesic metric space.
4. Define the Moreau--Yosida functional, resolvent set/map when single-valued, implicit
   Euler step, discrete variational interpolation, and De Giorgi interpolation.  Interpret
   the squared-distance penalty as `∞` outside the anchor's finite-distance component,
   prove that every finite-energy resolvent and minimizing-movement step remains in that
   component, and prove the discrete energy and slope estimates there.
5. Define minimizing movements and generalized minimizing movements.  Prove compactness
   and convergence from coercivity, lower semicontinuity, and the exact compactness
   hypothesis on sublevels; prove convergence to a maximal-slope or EVI flow when the
   corresponding assumptions hold.
6. Define sequential Γ-liminf, recovery sequences, Γ-convergence, and equicoercivity for
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

Acceptance checks: for `Φ(x)=‖x‖²/2` on a Hilbert space, the resolvent is
`x ↦ x/(1+τ)` and the flow is `e⁻ᵗx`; EVI gives the `e^{-λt}` contraction estimate; and
the discrete energy is monotone along every valid minimizing-movement sequence.

### Layer 11: entropy, Wasserstein differential calculus, JKO, and PDE flows

This layer consumes Layers 8--10 and the weak PDE infrastructure in the
[PDE roadmap](../PDE/README.md).  Where the PDE roadmap does not provide a needed
continuity-equation, Sobolev, or compactness lemma, build and expose the bridge here before
using it.

1. Extend Mathlib's nonnegative `InformationTheory.klDiv` for probability/finite
   references.  Prove strict convexity, lower semicontinuity, change of reference, data
   processing, tensorization, the disintegration chain rule, Pinsker, and the
   Donsker--Varadhan variational formula, always retaining its finite-mass correction.
   This slice is the entropy dependency of Layer 13.
2. Specialize Layer 9's internal-energy functional to `U(r)=r log r`, whose recession
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
   `Z_a=∫ exp(-a d(x,x₀)²)dm<∞` for some `a>0`; define the probability
   `m_a=Z_a⁻¹ exp(-a d(x,x₀)²)m` and prove the change-of-reference identity
   `Ent_m(μ)+a∫d(x,x₀)²dμ+log Z_a=klDiv μ m_a`.  Deduce the corresponding
   `W₂` lower-semicontinuity and tightness/coercivity of sublevels after adding a moment
   coefficient strictly larger than `a`.  This is the entropy functional used by
   gradient and heat flows; it may be negative and is not `ℝ≥0∞`.
3. On `P₂(ℝⁿ)`, define tangent velocity fields as the `L²(μ)` closure of gradients and
   prove existence/uniqueness of the minimal-norm representative of an absolutely
   continuous curve.  Relate it to Layer 8's distributional continuity equation and
   metric derivative.
4. Define strong, extended, and limiting Wasserstein subdifferentials and their scalar
   slope.  Prove the subdifferential inequality along optimal plans/generalized geodesics,
   closedness, minimal selection, and the equivalence with velocity fields under the AGS
   hypotheses.
5. Consume Layer 9's potential, symmetric-interaction, and internal-energy definitions;
   compute their first variations and subdifferentials, together with those of Boltzmann
   entropy.  Prove their displacement or generalized-geodesic convexity under the exact
   convexity, reference, and growth assumptions.
6. Define the Jordan--Kinderlehrer--Otto step
   `μ ↦ argmin_ν (Φ(ν) + W₂(ν,μ)²/(2τ))`.  Consume Layer 10's direct-method
   theorem with its hypotheses visible: the penalized functional is proper and narrowly
   sequentially lower semicontinuous, and one finite sublevel is narrowly sequentially
   compact.  Give the standard sufficient criterion through tightness plus uniform
   integrability of squared distance on penalized sublevels; neither `P₂(ℝⁿ)` nor a
   merely `W₂`-bounded set is proper.  If `Φ` is additionally `λ`-convex along generalized
   geodesics based at the previous iterate, then the objective is `(λ+1/τ)`-convex along
   those curves; prove uniqueness when `1+λτ>0`.  Do not silently replace generalized-
   geodesic convexity by ordinary displacement convexity.  Prove Euler--Lagrange
   conditions, discrete estimates, and compactness of interpolants.
7. Prove convergence of JKO schemes to Wasserstein gradient flows and then to weak PDE
   solutions for the named energies.  The theorem must identify both the metric flow and
   the PDE solution concept rather than ending at an unspecified limit curve.
8. Deliver the canonical equations.  Boltzmann entropy gives heat flow, and entropy plus
   a potential gives Fokker--Planck.  On `ℝⁿ`, define
   `U_m(r)=r^m/(m-1)`: for `m>1` prove the porous-medium flow, and for
   `1-1/n<m<1` (read `0<m<1` when `n=1`) prove fast diffusion.  Treat the
   displacement-convex endpoint `m=1-1/n` separately for `n≥2`, and treat `m=1` by the
   signed Boltzmann entropy rather than the singular formula for `U_m`.  At each power
   tier take initial data `ρ₀ dx ∈ P₂(ℝⁿ)` with finite `∫ U_m(ρ₀)dx`; prove
   the moment/energy bound that makes every JKO functional bounded below and coercive,
   including the endpoint bound, and obtain a narrowly continuous `P₂` curve satisfying
   the energy-dissipation inequality and the distributional identity
   `∫∫ (ρ ∂_tζ+ρ^m Δζ) dxdt=0` for compactly supported smooth tests,
   with `ρ,ρ^m∈L¹_loc`.  Interaction energy gives aggregation, and sums give the
   corresponding drift-diffusion equations under the named coercivity hypotheses of
   their component energies.
9. Prove energy dissipation, mass preservation, positivity, and contraction/uniqueness
   where EVI applies.  Express each linear flow through the abstract C₀/contraction-
   semigroup API of the
   [one-parameter-semigroups roadmap](../OneParameterSemigroups/README.md), and prove that
   the entropy flow agrees with the concrete heat semigroup built in the
   [PDE roadmap](../PDE/README.md), Lane F.  Construct the Ornstein--Uhlenbeck/
   Fokker--Planck semigroup and its generator here unless an explicit upstream dependency
   has landed, then prove its agreement with the Wasserstein flow.  For each agreement
   theorem, name the Banach realization--for example `L¹` densities or signed measures--
   identify the probability orbit inside it, identify the closed generator with the PDE
   operator, and only then invoke C₀-semigroup uniqueness; a nonlinear EVI semigroup on
   `P₂` is not definitionally the same object as a linear Banach-space semigroup.
10. Extend the tangent/subdifferential/flow theory to smooth complete Riemannian manifolds
   once the differential and volume infrastructure exists.  The nonsmooth metric-measure
   entropy/heat identification belongs to Layer 14 after Cheeger energy is built.

The named summit is the JKO construction of weak Fokker--Planck and porous-medium
solutions, following the original [Jordan--Kinderlehrer--Otto
paper](https://doi.org/10.1137/S0036141096303359) and AGS.

Acceptance checks: Gaussian heat flow has the expected covariance growth; a confining
quadratic potential yields the Ornstein--Uhlenbeck/Fokker--Planck flow; the JKO step
decreases energy; and the metric and weak-distributional formulations agree for a smooth
positive solution.

### Layer 12: Fréchet and Wasserstein barycenters

Start with barycenters in an arbitrary measurable metric space, then specialize to the
Wasserstein space.  This prevents Euclidean `W₂` assumptions from contaminating the basic
API.

1. For `1 ≤ p < ∞` and a probability law `P` on a measurable pseudometric space whose
   distance sections are measurable--for example a Borel metric space--define both the
   `Lᵖ` Fréchet radius `x ↦ ‖d(x,·)‖_{Lᵖ(P)}` and the power functional
   `x ↦ ∫ d(x,y)^p dP(y)`; prove their exact value relation and equality of minimizer
   sets.  Distinguish raw extended minimizers from finite Fréchet barycenters by requiring
   finite radius somewhere, so an identically-`∞` functional does not make every point a
   barycenter.  Include finite weighted families as a transparent specialization,
   allowing zero weights but normalizing total mass.  At `p=∞`, use the essential-
   supremum radius and define finite Chebyshev centers separately.  For a Polish metric
   space with its Borel structure, prove that this radius equals the supremum of the
   distance over the topological support.
2. Prove lower semicontinuity, coercivity criteria, existence in proper settings, and
   compactness of the minimizer set.  After Layer 8's geodesic infrastructure, define a
   reusable CAT(0)/Hadamard-space predicate, prove the CN inequality and strong convexity
   of squared distance, and derive quadratic barycenter uniqueness; state no uniqueness
   theorem in a general geodesic space.
3. For `1 ≤ p < ∞`, a separable, locally compact, complete, geodesic space `X`, and
   `P ∈ P_p(P_p(X))`, define population Wasserstein barycenters and prove the
   Le Gouic--Loubes existence theorem: the Fréchet functional is measurable and attains
   its minimum.  Do not assume or claim that `P_p(X)` itself is proper.
4. If `P_j → P` in `W_p(P_p(X))`, prove that every sequence of barycenters is precompact
   and that every limit point is a barycenter of `P`.  Uniqueness may upgrade this to
   convergence of the full sequence, but it is not part of the compactness theorem.
5. Relate finite Euclidean `W₂` barycenters to a multi-marginal transport problem through
   a measurable pointwise-barycenter selector.  Prove the multi-marginal primal and dual
   formulas rather than using the selector without a measurability theorem.
6. For normalized positive weights, define Agueh--Carlier's "vanishes on small sets"
   predicate exactly as in their Definition 3.2: `μ(A)=0` for every Borel `A⊆ℝⁿ`
   whose Hausdorff dimension is less than `n-1`.  Prove existence and uniqueness in
   `P₂(ℝⁿ)` when one positive-weight input has this property; absolute continuity is
   a standard sufficient corollary.  Develop the multi-map optimality conditions.  If
   that input has density in `L∞`, prove the separate Agueh--Carlier estimate
   `‖ρ_bar‖_∞ ≤ λ_j^(-n) ‖ρ_j‖_∞`; do not infer this density bound from the
   small-set predicate alone.
7. Prove the quadratic one-dimensional formula
   `Q_bar(s)=∑ i, λ_i Q_i(s)`.  For normalized nonnegative weights and Gaussian
   inputs `N(m_i,S_i)`, assume some `λ_j>0` has `S_j` positive definite.  Prove that the
   unique Gaussian barycenter has mean `m̄=∑_i λ_i m_i`, positive-definite covariance
   `S`, and the exact fixed-point equation
   `S=∑_i λ_i (S^(1/2) S_i S^(1/2))^(1/2)`.  Treat the all-semidefinite tier
   separately without importing uniqueness or inverse-matrix claims from the
   nondegenerate theorem.
   For two inputs with weights `1-t,t`, prove that the `p=2` barycenter is at geodesic time
   `t`; for `1<p<∞`, pin the general time
   `t^(1/(p-1)) / ((1-t)^(1/(p-1)) + t^(1/(p-1)))`.  For i.i.d. random input laws with
   distribution `P ∈ P_p(P_p(X))` in item 3's carrier regime, prove the empirical laws
   converge almost surely to `P` in `W_p` by building the required finite-moment strong
   law.  Then consume item 4: empirical barycenters are almost surely precompact, every
   limit is a population barycenter, and the full sequence converges when that barycenter
   is unique.

The population theory follows Le Gouic--Loubes,
[arXiv:1506.04153](https://arxiv.org/abs/1506.04153); the finite Euclidean theory follows
Agueh--Carlier's [barycenter paper](https://doi.org/10.1137/100805741).

Acceptance checks: barycenters of Dirac laws reduce to base-space Fréchet means; a
two-law quadratic barycenter lies at the weight-time of a displacement geodesic;
one-dimensional quadratic quantiles average with the input weights; and quadratic
Gaussian barycenters with a positive-weight nondegenerate input have mean `m̄` and satisfy
the exact positive-definite matrix equation above.  A nonquadratic two-law example
checks the reparameterized time above.

### Layer 13: entropic transport, Sinkhorn, and Schrödinger bridges

Build this from the finite/probability `InformationTheory.klDiv` slice in Layer 11.1, not
from the signed Boltzmann entropy.  Matrix scaling is a finite specialization of a
measurable entropy-projection theory, not the definition of entropic transport.

#### 13A. Static entropic transport

1. Define the static Schrödinger problem
   `inf { klDiv π R | π ∈ Coupling μ ν }` for an explicit reference probability measure
   or finite reference measure `R`.  Define cost-regularized OT separately as
   `∫ c dπ + ε klDiv π (μ ⊗ ν)`.  For `ε>0` and
   `Z=∫ exp(-c/ε)d(μ⊗ν)` satisfying `0<Z<∞`, define the Gibbs probability
   `R=Z⁻¹ exp(-c/ε)(μ⊗ν)` and prove the exact identity
   `∫ c dπ+ε klDiv π (μ⊗ν)=ε klDiv π R-ε log Z`.  Keep `Z=0` and
   support-constrained infinite costs as separate degenerate statements.
2. Let `(X,ℱ_X,μ)` and `(Y,ℱ_Y,ν)` be separable probability spaces--equivalently,
   `L¹(μ)` and `L¹(ν)` are separable--and let `R ∈ P(X×Y)`.  Following Nutz Theorem 2.1,
   if `{ π ∈ Π(μ,ν) | klDiv π R < ∞ }` is nonempty, prove existence and uniqueness
   of the entropy minimizer.  Extend this to finite nonzero `R` by normalization.  Add
   Polish lower-semicontinuous stability/compactness results without making topology part
   of the root definition; do not advertise arbitrary measurable spaces without a
   separate proof.
3. Prove entropic duality and the Gibbs/Schrödinger density
   `dπ/d(μ⊗ν)=exp((φ⊕ψ-c)/ε)`, with existence and uniqueness-up-to-constants of potentials
   under their real finiteness and integrability hypotheses.  Infinite costs get a
   separate support-constrained statement.
4. In named finite-positive-kernel and bounded-positive continuous-kernel regimes, prove
   continuity, smoothness, and differentiation theorems for the regularized value under
   their separate explicit hypotheses.  Keep strict convexity of the plan objective
   distinct from the generally non-strict marginal-value functional.  Define the debiased
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
   separate convexity/smoothness, and metrization of weak convergence.  Distinguish pointwise
   positivity from positive-definiteness and universality.  Give bounded-support
   Euclidean `C(x,y)=‖x-y‖` and `‖x-y‖²` specializations.  Strict convexity of the plan
   objective alone does not imply these claims as functions of marginals or cost.
5. Prove the zero-temperature limit: Γ-convergence/equicoercivity of regularized problems,
   convergence of values, and optimality of weak cluster points under continuous or
   integrably dominated costs.  If the optimal face contains a plan with finite
   `klDiv (·) (μ⊗ν)`, prove selection of the optimal plan minimizing that exact KL
   functional.  Do not claim potential convergence from plan convergence alone.
6. Build entropically regularized Wasserstein barycenters and prove convergence to an
   unregularized barycenter under equicoercivity and uniqueness/cluster-point hypotheses.

#### 13B. Iterative proportional fitting and finite Sinkhorn

7. Define alternating marginal normalization as alternating relative-entropy projections
   on general measurable spaces.  Prove that each half-step enforces one marginal, the KL
   Pythagorean/telescoping identities, and convergence of marginal errors under a feasible
   finite-entropy hypothesis.  Add convergence of couplings and potentials only with the
   required tightness, exponential-integrability, or bounded-kernel hypotheses.
8. Specialize to finite probability vectors and a rectangular nonnegative matrix kernel.
   Characterize feasibility by nonemptiness of the prescribed-marginal transport polytope
   on `supp K`, and characterize a scaling using every allowed edge by the corresponding
   relative-interior/full-support condition.  Scaling-vector ambiguity is one scalar per
   connected component of the support bipartite graph.  State the classical total-support
   criterion only for square doubly stochastic scaling, and prove Sinkhorn--Knopp directly
   for a strictly positive kernel.
9. Prove convergence of alternating row/column scaling.  For a strictly positive finite
   kernel, build Hilbert's projective metric and Birkhoff contraction, define
   `Δ(K)=sup_{i,i',j,j'} log((K_ij K_i'j')/(K_ij' K_i'j))`, and prove contraction
   factor `tanh(Δ(K)/4)` for each positive kernel map (hence the explicitly multiplied
   factors for a full row--column iteration).  Derive potential-oscillation, marginal-
   residual, and objective-gap rates with their dependence on `min K`, `max K`, and the
   positive marginal entries visible.  Treat kernels with support zeros only under their
   separately sourced support/indecomposability regime.  Provide exact
   rational/algebraic examples and a real-arithmetic iteration with certified residual
   and objective-gap bounds; log-domain stabilization must refine the same mathematical
   algorithm.
10. Prove that the finite matrix objective, dual, potentials, and iterations agree with the
   generic measure-theoretic definitions on finite types.  The existing LeanTriathlon
   statement is a prototype only; this equivalence is the acceptance boundary.

#### 13C. Dynamic Schrödinger theory

11. For a reference law `R` on path space, define endpoint-constrained entropy
    minimization.  Entropy disintegration first yields
    `dP*/dR=(dπ*/dR₀₁)(X₀,X₁)` for the optimal endpoint coupling.  Derive the stronger
    factorization `f(X₀)g(X₁)R` only under Layer 13A's static dual-potential hypotheses.
12. On `C([0,1];ℝⁿ)`, build the Brownian probability law `R^ε_r` with explicit
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
    data and then in the finite-entropy weak class.  Generalize to manifolds or abstract
    Markov references only after their path-law and heat-kernel APIs have landed.
13. With the same generator convention, build Schilder's path-space large-deviation
    principle in Laplace-principle form for `√ε`-Brownian paths, including exponential
    tightness, and derive the endpoint rate `‖x-y‖²/2`.  In Layer 10's Γ-convergence
    interface, prove equicoercivity and Γ-convergence of `ε` times constrained path entropy
    to kinetic action.  The recovery theorem must explicitly construct, for every
    finite-quadratic-cost endpoint plan `π`, plans `π_ε≪R^ε₀₁` with the same
    endpoints and
    `limsup ε klDiv(π_ε,R^ε₀₁) ≤ (1/2)∫‖x-y‖²dπ`; prove the matching
    liminf and bridge-law tightness for fixed endpoints in `P₂(ℝⁿ)`.  Deduce
    convergence of values, global minimizers, and entropic interpolations to Layer 9
    displacement interpolations, giving full convergence when the quadratic optimizer is
    unique and only cluster-point convergence otherwise.

Use Nutz's [entropic optimal-transport
notes](https://www.math.columbia.edu/~mnutz/docs/EOT_lecture_notes.pdf) for the measurable
static theory, Léonard's [Schrödinger survey](https://arxiv.org/abs/1308.0215) for the
dynamic theory, and Sinkhorn--Knopp's [matrix-scaling
paper](https://msp.org/pjm/1967/21-2/pjm-v21-n2-p14-p.pdf) for finite support conditions.

Acceptance checks: zero cost in cost-regularized OT with reference `μ⊗ν` gives the product
coupling; an exact `2 × 2` scaling has the prescribed row and column sums; abstract IPFP
and matrix Sinkhorn coincide on finite types; marginal KL errors telescope; and entropic
optimizers converge to an ordinary optimal plan as `ε ↓ 0` in the stated regime.

### Layer 14: synthetic curvature, nonsmooth heat flow, and optimal maps

Villani's Wasserstein-geometric curvature theory is part of the roadmap, and it is also
the correct foundation for extending Brenier--McCann beyond smooth manifolds.  This layer
must build its nonsmooth analytic vocabulary rather than declare `RCD` as an opaque
predicate.

1. Consume Layer 3's shared measured-metric carrier and work with its full-support Borel
   reference measure finite on bounded sets (or a probability reference in normalized
   statements).  Local finiteness alone is not substituted on a nonproper carrier.  Keep
   the reference measure separate from the transported probability law.
2. Build distortion coefficients, entropy-power functionals, essential nonbranching,
   measure-contraction properties, and displacement convexity along a selected optimal
   dynamic plan.  Define the curvature-dimension conditions `CD(K,N)`, reduced
   `CD*(K,N)`, and `MCP(K,N)` in the exact finite and infinite-dimensional regimes, with
   bridge theorems among conventions rather than one overloaded predicate.
3. Build minimal weak upper gradients, Cheeger energy, its relaxed `W¹,²` domain,
   infinitesimal Hilbertianity, and the associated `L²` heat flow/Dirichlet form.  Pin
   `RCD(K,∞)` to mean infinitesimally Hilbertian `CD(K,∞)`, and define finite-dimensional
   `RCD*(K,N)` analogously.  Prove the EVI characterization as a theorem rather than using
   it as a second definition.
4. Define Sturm's `L²` transportation distance `D` on normalized finite-variance
   metric-measure spaces as the infimum of `W₂` between the two reference laws over
   pseudometrics on their disjoint union that restrict to the original metrics.  Prove
   presentation/quotient invariance and the compactness and convergence API used below.
   Make Layer 15's scalar `p=2` distortion theory prove explicit comparison/bridge lemmas
   to `D` rather than duplicate this construction.
5. For normalized finite-variance `RCD(K,∞)` spaces, prove stability under Sturm
   `D`-convergence and convergence of heat flows (AGS Theorem 6.11), and prove
   nonbranching `ℓ²`-product tensorization (Theorem 6.13).  Formalize the precise global-
   to-local and local-to-global statements of AGS Theorems 6.20 and 6.22, including their
   geodesicity, null-boundary, quadratic-Cheeger-energy, and nonbranching assumptions.
   Treat finite-`N` `CD*` tensorization/local-to-global separately and incorporate Sturm's
   2024 corrigendum: do not state blanket tensorization from the original Bacher--Sturm
   proof.  Prove the elementary implications among curvature-dimension conditions, and
   do not infer nonbranching from a curvature bound unless the theorem supplies it.
6. In the smooth weighted Riemannian setting, prove equivalence between the synthetic
   condition and the corresponding Ricci/Bakry--Émery lower bound, including the
   dimension and weighting conventions.  This consumes curvature and volume from the
   geometric-topology roadmap.
7. Prove that on `RCD(K,∞)` spaces the `L²(m)` gradient flow of Cheeger energy on
   densities/functions corresponds, through `ρ ↦ ρ m` in the unit-mass finite-entropy
   regime, to the `W₂` `EVI_K` gradient flow of Boltzmann entropy on `P₂(X)`.  The two flows
   do not literally have the same carrier.  Derive heat-flow contraction and the
   curvature-sensitive estimates available from the cited theory.
8. For `1 ≤ N < ∞`, prove the Gigli--Rajala--Sturm nonsmooth optimal-map theorem on
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
9. Relate smooth McCann transport from Layer 7 to the nonsmooth theorem without claiming
   that the latter supplies a differentiable exponential-map formula.

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

Acceptance checks: the Euclidean reference space satisfies the expected curvature
condition; the smooth Ricci lower-bound theorem round-trips through the synthetic
definition; entropy flow agrees with the heat semigroup; and a source density on an RCD
space has a unique map-induced quadratic optimizer without any smooth exponential map in
the statement.

### Layer 15: measured kernels and Gromov--Wasserstein

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

1. At the measurable root, define measured kernels, pullback along measure-preserving
   maps, weak isomorphism through a common probability parametrization, products,
   restrictions, and finite weighted kernels.  Prove that all definitions are invariant
   under a.e. equality of `ω`.  Define support/full-support representatives only on the
   topological/Polish specialization that makes those notions available.
2. For `p : ℝ≥0∞` with `1 ≤ p`, define the raw distortion of a coupling using the
   `eLpNorm` of `d_Z(ω_X(x,x'),ω_Y(y,y'))` against `π⊗π`, and define `GW_p` by taking its
   infimum.  Prove the finite-`p` integral/root formula and the `p=∞` essential-supremum
   formula.  Follow this roadmap's no-`1/2` convention and prove the exact conversion
   `GW_roadmap = 2 · GW_BMNN` to sources using the half-distance convention.
3. Prove symmetry on the unrestricted measurable root.  Under standard-Borel carrier
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
4. In the Polish-carrier category of item 3, characterize zero distance as weak
   isomorphism, form the quotient, and give the quotient a genuine metric.  For
   full-support metric-measure spaces, prove that weak isomorphism reduces to a
   measure-preserving isometry; without full support, pass to supports.
5. For `p ∈ [1,∞]` and the Polish-carrier strongly measurable kernel category, prove
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
6. For compact unmeasured spaces, consume Mathlib's `GromovHausdorff.ghDist`,
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
7. Consume Layer 8's Alexandrov lower-curvature API.  For scalar `L²` distortion, build
   Sturm's geodesic "space of spaces," its tangent-cone description, and its `CBB(0)`
   theorem.  Keep this lower curvature bound on the moduli space distinct from CAT(0) and
   from the `CD/RCD` curvature of an individual space.
8. First construct an a.e.-canonical outgoing section-law map
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
   no-`1/2` convention,
   `GW_p(X,Y) ≥ inf_{π∈Π(μ_X,μ_Y)} ‖C‖_{Lᵖ(π)} ≥
   W_p((ecc_X)_#μ_X,(ecc_Y)_#μ_Y) ≥ |size_{p,z₀}(X)-size_{p,z₀}(Y)|`.
   Using the a.e.-measurable `Measure.map` construction above, unconditionally form the
   kernel pushforwards on this `p`-component and prove the independent kernel-distribution
   bound
   `GW_p(X,Y) ≥ W_p((ω_X)_#μ_X²,(ω_Y)_#μ_Y²)` and the incoming analogues.
   Prove `GW_p(X,{z})=size_{p,z}(X)` and the resulting 1-Lipschitz stability of size,
   eccentricity-distribution, and kernel-distribution invariants; avoid an open-ended
   promise of unspecified equality characterizations.
9. Show that finite weighted distance matrices give exactly the standard nonconvex
   quadratic GW objective.  Build exact small examples and certified objective/lower-bound
   calculations.
10. Define entropically regularized finite GW on top of Layer 13 and relate it to the
    generic kernel definition.  Use compactness of the finite coupling polytope and
    continuity of the quadratic distortion plus entropy to prove existence of global
    minimizers.  As `ε↓0`, prove convergence of optimal values and that every cluster
    point of global minimizers is an unregularized global minimizer.  The objective
    remains nonconvex: make no algorithmic global-convergence claim in this roadmap
    without first naming an update and a sourced stationarity theorem.  Treat GW
    barycenters through the same measured-kernel API.

The general measured-kernel route follows Bauer--Mémoli--Needham--Nishino,
[*The Z-Gromov-Wasserstein
distance*](https://www.jmlr.org/papers/volume26/24-2189/24-2189.pdf).  Metric-measure
specialization follows Mémoli's [foundational
paper](https://doi.org/10.1007/s10208-011-9093-5), and the `L²` moduli-space geometry
follows Sturm's [space of spaces](https://arxiv.org/abs/1208.0434).

Acceptance checks: a measure-preserving isometry has zero GW distance and the converse
holds after full-support reduction; with this roadmap's convention,
`GW_p(X,*)=‖d_X‖_{Lᵖ(μ⊗μ)}`; uniform two-point metric spaces with nonzero distances `a,b`
have distance `2^{-1/p}|a-b|`; the triangle coupling is constructed explicitly by gluing;
and the finite matrix objective is exactly the generic measured-kernel objective.

### Layer 16: public API, extraction, and end-to-end examples

The earlier layers are not internal scaffolding to discard.  Finish them as a discoverable
library.

1. Organize general material under stable namespaces such as
   `MeasureTheory.OptimalTransport`, `MeasureTheory.ProbabilityMeasure.Wasserstein`,
   `Analysis.Convex.MongeAmpere`, `Analysis.GradientFlow`, and
   `MetricGeometry.GromovWasserstein`, following upstream naming feedback.  Avoid a single
   file or namespace that imports all PDE, Riemannian, computational, and metric-measure
   dependencies.
2. Provide extensionality/simp lemmas, coercions, continuity/measurability instances,
   finite/Dirac/product specializations, and theorem aliases only where Mathlib convention
   calls for them.  Definitions must not expose arbitrary basepoints, normalizations, or
   representatives.
3. Extract general-purpose additions--gluing, lower-semicontinuous integral lemmas,
   extended convex duality, metric curves, the advanced `klDiv` API, signed Boltzmann
   entropy, and Fréchet means--to Mathlib in coordinated PRs when maintainers agree.  Tau
   Ceti consumes the upstream form after merge rather than preserving parallel APIs.
4. Write module documentation that maps hypotheses to the theorem regimes in this
   roadmap.  Each headline theorem should have a compact canonical corollary and a link to
   the more general form, not a proliferation of unrelated re-statements.
5. Maintain executable finite examples and mathematically exact regression tests.  A
   floating-point wrapper reports certified residuals/error bounds and never replaces the
   exact theorem it approximates.

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
* `W_p` is finite on all probability measures, or the same definition gives a metric for
  `p<1`.
* Every Wasserstein geodesic is induced by a unique family of particle geodesics.
* A vector-field continuity equation is available on an arbitrary metric space.
* Geodesic convexity automatically supplies an EVI flow.
* Completeness and geodesicity alone guarantee existence or uniqueness of a barycenter.
* Sinkhorn plan convergence automatically gives convergence of potentials when the cost
  may be infinite.
* Entropic regularization makes the GW objective convex or its iteration globally
  convergent.
* Raw GW is a metric on presentations rather than a pseudometric before quotienting.

## Cross-roadmap dependencies

* The [PDE roadmap](../PDE/README.md) builds weak Sobolev spaces, compactness, parabolic
  solution theory, and the concrete heat semigroup consumed by Monge--Ampère estimates and
  the PDE/semigroup identification of JKO limits.  Nonlinear Monge--Ampère, continuity
  equations of measure-valued curves, Fokker--Planck semigroup construction, and OT first
  variations remain explicit work here.
* The [geometric-topology roadmap](../GeometricTopology/README.md), Layer 7, builds
  Riemannian volume, connection, curvature, and related manifold geometry.  Layers 7 and
  14 consume it and supply transport/synthetic-curvature bridges in return.
* The [one-parameter-semigroups roadmap](../OneParameterSemigroups/README.md) supplies the
  abstract C₀/contraction-semigroup, generator, and resolvent API.  The PDE roadmap supplies
  the concrete heat semigroup.  Layer 11 constructs any remaining concrete linear Markov
  semigroups it names and proves that the linear Wasserstein gradient flows agree with
  those semigroups.  One-parameter semigroups also owns the abstract Hille--Yosida
  generation theorem; PDE Lane F.26 should consume that theorem for its concrete heat
  realization rather than build a competing abstract API, so coordinate that sibling
  overlap before either bridge lands.

These links are dependencies, not permissions to skip missing glue.  If a sibling target
has not landed, the consuming OT claim waits or explicitly takes the bridge as part of its
scope.

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
`CBB(0)` targets also wait for Layer 8's generic path/geodesic and measure-relative
selection API, while its entropic and barycenter targets wait for Layers 12--13.

A useful implementation claim is usually one definition family plus its complete basic
API and one or two named theorems: gluing; lsc cost and attainment; finite duality;
`W_p` triangle and moments; metric curves; either entropy API; finite Sinkhorn scaling; or
raw GW plus its triangle inequality.  Brenier, Benamou--Brenier, Caffarelli regularity,
JKO-to-PDE, RCD optimal maps, and the GW quotient metric each deserve staged claims whose
PRs leave every landed intermediate reusable.

## References

### General and static transport

* C. Villani, [*Optimal Transport: Old and
  New*](https://link.springer.com/book/10.1007/978-3-540-71050-9), Springer, 2009.
* C. Villani, [*Topics in Optimal
  Transportation*](https://bookstore.ams.org/gsm-58/), AMS, 2003.
* F. Santambrogio, [*Optimal Transport for Applied
  Mathematicians*](https://link.springer.com/book/10.1007/978-3-319-20828-2), 2015.
* M. Beiglböck and W. Schachermayer, [Duality for Borel measurable
  cost](https://arxiv.org/abs/0807.1468); M. Beiglböck, C. Léonard, and W.
  Schachermayer, [the extended-cost relaxed
  theorem](https://eudml.org/doc/285844).
* W. Schachermayer and J. Teichmann, [Characterization of optimal transport
  plans](https://arxiv.org/abs/0711.1268), 2009.
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

### Monge--Ampère and regularity

* G. De Philippis and A. Figalli, [The Monge--Ampère equation and its link to optimal
  transportation](https://www.ams.org/journals/bull/2014-51-04/S0273-0979-2014-01459-4/S0273-0979-2014-01459-4.pdf),
  2014.
* L. Caffarelli, [interior
  regularity](https://doi.org/10.1090/S0894-0347-1992-1124980-8) and
  [boundary regularity](https://doi.org/10.1002/cpa.3160450905) for Monge--Ampère;
  [interior `W²,p`
  estimates](https://annals.math.princeton.edu/1990/130-1/p05), 1990;
  G. De Philippis, A. Figalli, and O. Savin,
  [`W²,1+ε` regularity](https://arxiv.org/abs/1202.5566).
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
* E. Sandier and S. Serfaty, [Γ-convergence of gradient flows with applications to
  Ginzburg--Landau](https://doi.org/10.1002/cpa.20046), 2004; S. Serfaty,
  [the Hilbert/metric-space scheme](https://doi.org/10.3934/dcds.2011.31.1427), 2011.
* S. Lisini, [Characterization of absolutely continuous curves in Wasserstein
  spaces](https://cvgmt.sns.it/paper/568/), 2007; J.-D. Benamou and Y. Brenier,
  [A computational fluid mechanics solution to the Monge--Kantorovich mass transfer
  problem](https://doi.org/10.1007/s002110050002), 2000.
* R. Jordan, D. Kinderlehrer, and F. Otto, [The variational formulation of the
  Fokker--Planck equation](https://doi.org/10.1137/S0036141096303359), 1998; R. McCann,
  [A convexity principle for interacting
  gases](https://doi.org/10.1006/aima.1997.1634), 1997.
* M. Agueh and G. Carlier, [Barycenters in the Wasserstein
  space](https://doi.org/10.1137/100805741), 2011; T. Le Gouic and J.-M. Loubes,
  [Existence and consistency of Wasserstein
  barycenters](https://arxiv.org/abs/1506.04153), 2017.

### Entropy, curvature, and Gromov--Wasserstein

* M. Nutz, [Entropic optimal-transport lecture
  notes](https://www.math.columbia.edu/~mnutz/docs/EOT_lecture_notes.pdf); C. Léonard,
  [A survey of the Schrödinger
  problem](https://arxiv.org/abs/1308.0215), 2014; M. Cuturi,
  [Sinkhorn distances](https://papers.neurips.cc/paper_files/paper/2013/hash/af21d0c97db2e27e13572cbf59eb343d-Abstract.html),
  2013.
* G. Peyré and M. Cuturi, [*Computational Optimal
  Transport*](https://optimaltransport.github.io/book/), 2019.
* J. Feydy, T. Séjourné, F.-X. Vialard, S.-I. Amari, A. Trouvé, and G. Peyré,
  [Interpolating between optimal transport and MMD using Sinkhorn
  divergences](https://proceedings.mlr.press/v89/feydy19a/feydy19a.pdf), 2019.
* J. Lott and C. Villani, [Ricci curvature for metric-measure
  spaces](https://annals.math.princeton.edu/2009/169-3/p04), 2009; K.-T. Sturm,
  [On the geometry of metric measure
  spaces](https://doi.org/10.1007/s11511-006-0002-8), 2006, and its
  [tensorization corrigendum](https://arxiv.org/abs/2401.15094), 2024.
* F. Mémoli, [Gromov--Wasserstein distances and object
  matching](https://doi.org/10.1007/s10208-011-9093-5), 2011; H. Bauer, F. Mémoli, T.
  Needham, and M. Nishino, [The `Z`-Gromov--Wasserstein
  distance](https://www.jmlr.org/papers/volume26/24-2189/24-2189.pdf), 2025; K.-T. Sturm,
  [The space of spaces](https://arxiv.org/abs/1208.0434), 2012.

## Acknowledgements and provenance

This roadmap's prior-art audit was informed by Joseph Miller's Vlasov formalization,
Daniel Lyng's Econlib development, Quang Dao and Devon Tuma's VCVio coupling library, and
the archived ItaLean project discussion.  Any ported implementation must preserve
attribution and document the generalizations made during migration.  The roadmap also
uses the theorem boundaries and counterexamples in the cited primary literature to keep
"maximal generality" mathematically honest.
