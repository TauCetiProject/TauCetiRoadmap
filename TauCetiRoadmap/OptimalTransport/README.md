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

* Ambrosio--Gigli--Savaré, [*Gradient Flows in Metric Spaces and in the Space of
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
   with prescribed marginals; a transport map is an a.e.-measurable map with prescribed
   pushforward.  Neither definition needs a topology, metric, density, or equal source and
   target type.  Results also cover finite measures of equal mass where normalization is
   irrelevant, while `ProbabilityMeasure` is the canonical bundled public type for
   probability transport.
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
   only on an ordinary metric base is the usual moment subtype automatically one
   component.  At `p = ∞`, prove that the same definition is the essential-supremum
   formula for `W_∞`.  Theorems specialize to `p = 1` or `p = 2` only when their
   mathematics does.
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
* `Measure.IsTransportMap T μ ν` means `T` is a.e.-measurable with respect to `μ` and
  `Measure.map T μ = ν`.  Map-induced plans are `(id, T)ₐ μ`; equality and uniqueness of
  maps are always `μ`-a.e.
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
  `(z ↦ γ_z(t))ₐ π`, where `γ_z` is a selected constant-speed geodesic from `z.1` to
  `z.2`.  In a vector space this is `((1-t) • x + t • y)ₐ π`.
* The continuity equation is `∂ₜ μₜ + div(vₜ μₜ) = 0` in distributional form.  Its sign
  and test-function identity are pinned together in the definition.
* Dynamic `p`-action is `A_p(γ)=∫₀¹ |γ̇_t|^p dt`, with no factor `1/p`; kinetic energy
  `A_p/p` gets a separately named definition.  Thus the displayed Benamou--Brenier value
  is `W_p^p`.  The quadratic JKO penalty remains `W₂²/(2τ)`.
* `λ`-geodesic convexity means
  `Φ(γ_t) ≤ (1-t)Φ(γ₀)+tΦ(γ₁)-(λ/2)t(1-t)d(γ₀,γ₁)²`.  `EVI_λ` means
  `(1/2) ∂ₜd(x_t,y)² + (λ/2)d(x_t,y)² ≤ Φ(y)-Φ(x_t)`.  These conventions give
  `e^{-λt}` contraction, and `ν ↦ W₂(ν,μ)²/2` is `1`-convex along generalized geodesics
  based at `μ`.
* Mathlib's nonnegative `InformationTheory.klDiv μ ν` is the finite-measure
  I-divergence and includes the correction `ν univ - μ univ`; it agrees with ordinary KL
  for probability measures.  Entropic OT uses this API and always names its reference
  measure or Gibbs kernel.  The AGS/RCD Boltzmann entropy `∫ ρ log ρ dm` against a
  possibly infinite reference measure is a separate signed extended-real functional,
  with bridge lemmas (and the additive mass constant) in the finite-reference regime.
  `KL(π | μ ⊗ ν)` and `KL(π | R)` are not silently identified.
* `GW_p` uses the full pairwise distortion integral and no hidden factor `1/2`.  State
  comparison lemmas for sources that use the half-distance convention.

## Inventory: what current Mathlib gives us (consume)

The pinned Mathlib revision has much of the measure-theoretic substrate, but no public
optimal-transport namespace or Wasserstein metric.  Consume the following rather than
rebuilding it.

* `Measure`, `ProbabilityMeasure`, `Measure.map`, product measures, kernels, and the
  standard-Borel disintegration API under `Mathlib/MeasureTheory` and
  `Mathlib/Probability/Kernel`.  In particular, kernel composition and disintegration are
  the substrate for gluing couplings.
* Weak convergence and bounded-continuous test functions for probability measures,
  Portmanteau, tight families of measures, Prokhorov compactness, and the
  Lévy--Prokhorov metric.  These are the substrate for existence and stability, not a
  reason to define a second weak topology.
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
* Euclidean spaces, finite-dimensional differentiability, convex functions, Hessians,
  determinants, change of variables, manifolds, and the beginnings of Riemannian
  geometry.  These are ingredients, not yet a Monge--Ampère or transport-map theory.

The audit also found genuine prerequisites that must be built in the layers below:

* lower-semicontinuity of parameterized `lintegral` in the strength needed for transport,
  plus compactness and closedness of coupling sets;
* a coherent extended-real convex-conjugate, subgradient, Legendre-transform, and
  Aleksandrov Monge--Ampère API;
* metric derivatives, absolutely continuous metric-valued curves, length/geodesic-space
  infrastructure, and probability measures on path space;
* distributional continuity equations with measure-valued time slices and vector-valued
  fluxes;
* the advanced `InformationTheory.klDiv` API--lower semicontinuity, strict convexity,
  chain rules, data processing, tensorization, Pinsker, and variational formulas--plus
  signed extended Boltzmann entropy and finite-reference bridge lemmas;
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

Before porting or adapting either development, coordinate with Joseph Miller and Daniel
Lyng, agree on attribution and API direction, and record the result in the implementation
PR.  Even an independent implementation should coordinate to avoid incompatible coupling
and cost APIs.  Their licenses permit adaptation, but permission to integrate and
community alignment are separate questions.

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
   coupling space.  Prove that a coupling forces equal total mass, marginal formulas,
   extensionality, measurability of projections, nonemptiness via product couplings for
   probabilities and normalized products for finite equal-mass measures (including the
   zero-mass case), swap, map/pushforward in either coordinate, and invariance under
   measurable equivalences.
2. Define transport maps and their graph couplings.  Prove the two marginal identities,
   composition, a.e.-congruence, identity and equivalence examples, and the implication
   from a Monge map to a Kantorovich plan.
3. Prove disintegration of a coupling into a Markov kernel on standard Borel spaces and
   reconstruction from a marginal plus a probability kernel.  State all equalities at the
   measure or a.e.-kernel level appropriate to Mathlib.
4. Prove the gluing lemma: couplings of `(μ,ν)` and `(ν,σ)` admit a joint law on
   `X × Y × Z` with the prescribed two-coordinate marginals.  Derive composition of
   couplings and finite-chain gluing.  Separately build the Ionescu--Tulcea or
   Kolmogorov-extension step that turns a projectively consistent countable standard-Borel
   family into a countable joint law; finite iteration alone is not countable gluing.
5. Define multi-marginal couplings indexed by a finite type, their projections and
   reindexing, product nonemptiness, marginal replacement, and reduction to the
   two-marginal API.

Acceptance checks: a coupling of two Dirac measures is unique; if the first marginal is
`δ_x`, then the unique coupling with second marginal `ν` is
`(y ↦ (x,y))ₐ ν`--which is not a Monge plan from `δ_x` when `ν` is non-Dirac.  Finite
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
   control singular couplings.
2. Build the weak topology on a fixed-marginal coupling subtype by inheritance from
   `ProbabilityMeasure`; prove that each marginal map is continuous and the coupling set
   is closed.  Do not introduce another notion of weak convergence.
3. Prove tightness of all couplings of two tight marginals, relative compactness by
   Prokhorov, and compactness of the coupling set on Polish spaces.  Supply compact
   metrizable corollaries and a separate abstract theorem for spaces satisfying the
   Prokhorov compactness property; do not infer it from Radon regularity alone.
4. Prove lower semicontinuity of `π ↦ ∫⁻ c dπ` for nonnegative lower-semicontinuous `c`,
   first for bounded truncations and then by monotone convergence.  Include a reusable
   theorem for costs bounded below by integrable marginal terms.
5. Prove primal attainment for lower-semicontinuous costs on Polish spaces and the direct
   method theorem under abstract compactness/lower-semicontinuity hypotheses.  Separate
   finite-value existence from the fact that an optimizer exists with value `∞`.
6. Prove stability under varying marginals/costs using a Γ-liminf condition along every
   `π_n ⇀ π`, plus tightness/equicoercivity for optimizer subsequences.  Add recovery
   couplings for the Γ-limsup and hence value/optimizer convergence.  State the fixed-cost
   lower-semicontinuous corollary separately.

Acceptance checks: solve every `2 × 2` discrete problem by enumerating its coupling
interval; recover the monotone coupling for finitely supported measures on `ℝ` for
`c(x,y)=|x-y|^p` (and the stated Monge-cost class); and show that an infinite barrier cost
correctly encodes a closed transport constraint.

### Layer 2: Kantorovich duality, transforms, and optimality certificates

This layer builds the dual theory at the same level of care as the primal.

1. Define dual-feasible potential pairs and their value, with integrability conditions
   that make the two marginal integrals meaningful.  Prove weak duality once for the
   general interface.
2. Build the finite-real and extended-cost infimal `c`-transform interfaces,
   `c`-concave functions, `c`-superdifferentials, contact sets, and normalization modulo
   additive constants.  Even for real `c,φ`, the infimum may be `-∞`, so the transform has
   an extended-real codomain.  Pin safe subtraction/normalization rules so no theorem
   hides `∞-∞`.  Prove order reversal, double-transform inequalities, feasibility,
   measurability/lower-semicontinuity under named hypotheses, and improvement of a
   feasible pair by `c`-transformation.
3. Prove finite-dimensional linear-programming duality for finite spaces, including
   primal and dual attainment and complementary slackness.  Connect it definitionally or
   by transparent equivalences to the measure API.
4. Prove strong Kantorovich duality for continuous finite costs on compact metrizable
   metrizable spaces.  Then prove the Polish lower-semicontinuous theorem for
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
   on Polish spaces with finite optimal value, prove the equivalence among optimality,
   concentration on a `c`-cyclically monotone set, and concentration on an integrable
   dual contact set, following Schachermayer--Teichmann.  Give the extended-valued regime
   only with its additional measurability/relaxation hypotheses.
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
   Define the `p`-moment condition with `MemLp` about a basepoint.  In an extended metric
   space, prove basepoint-independence only inside a fixed finite-distance component.
   Prove symmetry, monotonicity in `p`, and the triangle inequality from standard-Borel
   gluing plus Minkowski.  On a genuine metric base prove `W_p=0 ↔ μ=ν`; on a
   pseudometric base give the induced quotient/pushforward statement instead.  For
   `p < ∞`, prove the exact bridge to the integral-of-`edist^p`/root formula and Layer 1's
   transport cost.
2. On a `PseudoEMetricSpace`, define the component anchored at a reference law `μ₀` by
   finite `W_p` distance.  On an ordinary `PseudoMetricSpace`, define `P_p(X)` by finite
   moment about one/every basepoint and prove that it is the corresponding component.
   Give it a `PseudoMetricSpace`, a genuine `MetricSpace` when the ground distance
   separates points, and a quotient metric otherwise.  Prove compatibility among `dist`,
   `edist`, `eLpNorm`, the primal cost, and optimal couplings.
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
   components and completeness theorem under the exact ground-space assumptions.
   Characterize `W_∞` convergence by couplings whose essential-supremum displacements
   tend to zero, not by weak convergence plus moments; record that finite support need not
   be dense and separability can fail.  Compare it with finite `p` and prove the
   appropriate `p → ∞` limit on compact/bounded spaces.
7. Prove Kantorovich--Rubinstein duality for `W_1` on Polish metric spaces with finite
   first moments, normalized at a basepoint.  Derive the bounded-Lipschitz and compact
   variants and compare with Mathlib's weak-convergence metrics.
8. Build the shared measured-metric carrier used by Layers 14--15: a complete separable
   metric carrier, a Borel reference measure finite on bounded sets, support/full-support
   reduction, and measure-preserving isometries.  The transported `ProbabilityMeasure`
   remains separate from this reference measure.  Do not yet impose curvature, a kernel,
   or a quotient.

Acceptance checks: on a metric base, `W_p(δ_x,δ_y)=d(x,y)` and zero distance separates
laws; a pseudometric example exercises the quotient statement.  Translations of a fixed law in a normed space
have the expected upper bound and equality in the canonical cases; the one-dimensional
quantile formula computes `W_p`; Gaussian `W_2` agrees with the closed formula once the
matrix prerequisites land.

### Layer 4: the Monge problem and abstract transport maps

Treat deterministic transport as a problem in its own right before proving Brenier.

1. Define the Monge feasible set and value for a measurable map pushing `μ` to `ν`.
   Prove the relaxation inequality from Monge to Kantorovich and characterize equality
   for a graph coupling.
2. Build the basic feasibility theory.  For a point atom `x`, every transport map satisfies
   `ν({T x}) ≥ μ({x})`; prove the corresponding general-atom theorem under a standard-Borel
   target hypothesis.  A nonatomic standard probability space admits a measurable map to
   every standard Borel target law.  Include exact atomic/nonatomic decompositions rather
   than claiming every Monge problem is feasible.
3. Prove density of deterministic plans in the coupling set when the source is nonatomic,
   in the topology and ambient hypotheses under which it is true.  Deduce equality of
   Monge and Kantorovich infima for bounded continuous costs while retaining the fact that
   the Monge infimum need not be attained.
4. For a fixed source law on a common domain, prove stability of uniquely induced optimal
   plans: convergence of graph plans plus suitable tightness/uniform-integrability
   hypotheses gives convergence in source measure of the maps.  A varying-source theorem
   must carry explicit identifications or comparison couplings.  Do not recover pointwise
   convergence from weak convergence alone.
5. Prove the reusable **abstract twist theorem**.  Starting from a dual contact set, a
   potential differentiable `μ`-a.e., source differentiability of `c`, and injectivity of
   `y ↦ Dₓc(x,y)`, show that each contact fiber is a singleton almost everywhere.  Conclude
   that the optimizer is induced by a unique map.  Formulate local semiconcavity or
   superdifferentiability assumptions separately from twist.
6. Build measurable-selection lemmas that turn the pointwise singleton formula into a
   measurable/a.e.-measurable map.  The formula involving an inverse derivative is a
   theorem, not a noncomputable definition with hidden existence.

Acceptance checks: an atomic source/non-atomic target demonstrates infeasibility; a
nonatomic source realizes a prescribed finite law by a partition; deterministic plans
approximate a non-graph coupling; and a twist-cost finite example recovers a unique map
from complementary slackness.

### Layer 5: convex analysis, Brenier, and polar factorization

The Euclidean quadratic theorem rests on a reusable convex-analysis tower.  Build that
tower rather than hiding it inside the final proof.

1. Complete the theory of proper lower-semicontinuous **extended-valued** convex functions on
   finite-dimensional real spaces: epigraphs, Legendre--Fenchel conjugates,
   Fenchel--Moreau biconjugation, subgradients, conjugate-subgradient reciprocity, and
   essential-domain lemmas.  Reuse Mathlib declarations where they exist and upstream
   general-purpose additions where feasible.
2. Prove local Lipschitzness on the interior of the effective domain, Rademacher
   differentiability, Alexandrov twice differentiability, and the positivity of the
   distributional Hessian.  These analytic results are dependencies for both maps and
   Monge--Ampère regularity.
3. Prove Rockafellar's theorem identifying cyclically monotone subsets of a dual pairing
   with subsets of convex subdifferentials.  Connect ordinary cyclic monotonicity to
   `c`-cyclical monotonicity for `c(x,y)=‖x-y‖²/2`.
4. Prove **Brenier's theorem** in its strong standard form: for
   `μ,ν ∈ P₂(ℝⁿ)` with `μ` absolutely continuous with respect to Lebesgue measure, the
   quadratic problem has a unique optimal plan, induced by `∇u` for a proper
   lower-semicontinuous extended-valued convex `u`.  Prove that `u` is finite and
   differentiable `μ`-a.e.; the total transport map is an a.e. representative selected
   from its gradient/subgradient, not a globally defined gradient at every point.  The
   target need not be absolutely continuous.
5. Prove converse optimality for gradients of convex functions, a.e. uniqueness of the
   map, the inverse relation through `∇u*` when the target is also absolutely continuous,
   and the precise domain/support hypotheses under which the potential is unique modulo
   a constant.
6. State and prove the stronger source-measure variants, such as vanishing on countably
   `(n-1)`-rectifiable sets, only where the cited proof supports them.  Keep the familiar
   absolutely-continuous corollary as the public entry point.
7. Prove the Gangbo--McCann extension for `c(x,y)=h(x-y)`, with the exact strict
   convexity, differentiability, growth, and source hypotheses, and derive the formula
   `T(x)=x-(∇h)⁻¹(∇φ(x))`.
8. Prove Brenier polar factorization for measurable vector fields under the original
   nondegeneracy hypotheses.  Separate existence, a.e. uniqueness of the monotone factor,
   and uniqueness of the measure-preserving factor; do not state an unconditional
   factorization for every vector field.

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

1. For convex `u : Ω → ℝ`, define the subgradient image and Aleksandrov measure
   `MA_u(E)=Lebesgue(∂u(E))`.  Prove that this is a Borel measure, local finiteness under
   the standard hypotheses, and agreement with `det(D²u) dx` for `C²` convex functions.
2. Build examples with singular Monge--Ampère mass, weak convergence under locally
   uniform convergence of convex functions, the comparison principle, the Aleksandrov
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
6. Use approximate differentiability and the area/change-of-variables formula to derive
   the a.e. Jacobian equation
   `f(x)=g(∇u(x)) det(D²u(x))`.  State the second boundary condition first in its honest
   set-valued form, then upgrade it when regularity permits.
7. Prove exactly when a Brenier solution is an Aleksandrov solution.  Convexity of the
   target support is load-bearing: singular subgradient mass not seen by `g` cannot be
   discarded in general.

#### 6C. Quadratic Caffarelli theory

8. For bounded Euclidean source and convex target domains with densities bounded above
   and below by positive constants, prove local strict convexity, local `C¹,α`, and local
   `W²,1+ε` regularity of the Brenier potential.  State estimates on normalized convex
   sections compactly contained in the domain, carry `0 < λ ≤ f ≤ Λ`, strict convexity,
   section normalization/distance, and quantitative dependence of constants visibly.
9. Add the sharper section-local tiers for a strictly convex Aleksandrov solution with
   `0 < λ ≤ f ≤ Λ`: continuity/VMO control of `f` with its modulus gives `W²,p` for every
   fixed finite `p`; `f ∈ C⁰,α` gives `C²,α`; smoother right-hand side gives higher
   interior regularity.  Do not state these from positivity without the normalized-section
   and oscillation hypotheses.
10. Prove global boundary regularity and smooth-diffeomorphism results for smooth uniformly
    convex source and target domains with smooth densities bounded away from zero and
    infinity.  Build the boundary estimates they consume rather than importing a theorem
    name as an axiom.
11. Formalize regression examples: a disconnected or nonconvex target can make a Brenier
    map discontinuous despite smooth positive data; density bounds alone do not imply all
    `W²,p` estimates; and strict convexity cannot be omitted in higher dimensions.

#### 6D. General costs, MTW, and partial regularity

12. For costs with the regularity required by each derivative, define A1 source twist,
    A1* target twist, A2 mixed-Hessian nondegeneracy, the `c`-exponential, `c`-segments,
    mutual and uniform source/target `c`-convexity, and the weak A3w and strong A3s
    Ma--Trudinger--Wang conditions.  Each is a separate predicate with bridge lemmas to the
    abstract twist layer; MTW derivative statements carry at least the cited `C⁴` cost
    regularity.
13. Derive the general generated-Jacobian/`c`-Monge--Ampère equation, including the
    `det D²_xy c` factor and the sign convention pinned by the chosen `c`-exponential.
    Construct the weak `c`-Monge--Ampère measure from the `c`-subdifferential and prove
    that it is a measure under the hypotheses used.
14. Under the cited `C⁴`, A1/A1*, A2, A3w, and mutual `c`-convexity hypotheses, prove
    Loeper's maximum principle/contact-set connectedness.  Prove that failure of A3w can
    yield discontinuous maps for smooth positive data.  State local Hölder/strict
    regularity with A3s (or the cited strengthened A3w regime), densities bounded above
    and below, and the required domain `c`-convexity.  State global second-boundary-value
    regularity only with uniform mutual `c`-convexity, smooth boundaries/cost/densities,
    A1/A1*, A2, and the cited MTW condition.
15. Prove De Philippis--Figalli partial regularity without MTW for
    `c ∈ C²,α` with controlled norm, A1/A1*, A2, bounded Euclidean domains, and source and
    target densities bounded away from zero and infinity.  Produce relatively closed null
    sets `Σ_X,Σ_Y` such that the optimal map is a `C⁰,β` homeomorphism between their
    complements for every `β < 1`.  With `c ∈ Cᵏ⁺²,α` and `Cᵏ,α` densities, prove the
    corresponding `Cᵏ⁺¹,α` diffeomorphism off those two singular sets.

Use the De Philippis--Figalli [Monge--Ampère and optimal-transport
survey](https://www.ams.org/journals/bull/2014-51-04/S0273-0979-2014-01459-4/S0273-0979-2014-01459-4.pdf)
as the statement checklist.  The MTW branch is governed by the
[Ma--Trudinger--Wang paper](https://doi.org/10.1007/s00205-005-0362-9) and
[Loeper's necessity theorem](https://doi.org/10.1007/s11511-009-0037-8); the final target
is De Philippis--Figalli [partial
regularity](https://www.numdam.org/item/10.1007/s10240-014-0064-7.pdf).

### Layer 7: Riemannian Brenier--McCann transport

The [geometric-topology roadmap](../GeometricTopology/README.md), Layer 7, supplies
Riemannian volume, connection, and curvature.  It does **not** currently supply the
exponential/log maps, Hopf--Rinow, minimizing geodesics, injectivity radius, or cut-locus
measurability/nullity needed here; those are owned by this layer before any transport
theorem consumes them.

1. For finite-dimensional boundaryless Riemannian manifolds, build exponential/log maps,
   geodesic completeness and Hopf--Rinow, existence of minimizing geodesics, injectivity
   radius, squared-distance semiconcavity, cut-locus measurability and volume-nullity, and
   the a.e. differentiability facts used by transport.  State connectedness, geodesic
   completeness, and moment hypotheses separately from compactness.
2. Define Riemannian `c`-concave potentials with the dual convention
   `φ(x)+ψ(y)≤d(x,y)²/2`, prove almost-everywhere avoidance of the cut locus by the contact
   relation, and connect the resulting sign convention to the Riemannian exponential map.
3. Prove **McCann's theorem**: for finite-second-moment laws on a finite-dimensional,
   connected, boundaryless, geodesically complete smooth Riemannian manifold, with source
   absolutely continuous with respect to Riemannian volume, the unique quadratic optimal
   plan is induced by
   `T(x)=exp_x(-∇φ(x))`.  Give the compact-manifold statement, where moments are
   automatic, as a corollary rather than the root theorem.
4. Prove the inverse-map result when the target is also absolutely continuous, displacement
   interpolation away from the cut locus, and Riemannian polar factorization under the
   cited nondegeneracy hypotheses.
5. Connect the smooth general-cost MTW predicates from Layer 6 to Riemannian squared
   distance.  Do not claim that nonnegative sectional curvature by itself implies
   regularity; MTW and cut-locus geometry are stronger requirements.
6. Develop the non-twist cost `c=d` through transport rays and prove the
   Feldman--McCann Monge-map existence theorem for an absolutely continuous source under
   its complete connected Riemannian and finite-first-cost hypotheses.  Record that
   uniqueness generally fails; the `p=1` branch is not a strict-convexity corollary.
7. Prove the Riemannian squared-distance specialization of Layer 6's partial-regularity
   theorem after all cut-locus and coordinate prerequisites above have landed.

McCann's original [polar factorization on Riemannian
manifolds](https://doi.org/10.1007/PL00001679) is the primary source; Villani, Chapter 10,
Theorem 10.35, supplies the complete noncompact finite-cost form.  The distance-cost
branch follows Feldman--McCann,
[Monge's mass transport problem on a Riemannian
manifold](https://www.ams.org/journals/tran/2002-354-04/S0002-9947-01-02930-0/).

### Layer 8: metric curves, dynamic plans, and Benamou--Brenier

Build the maximally general path-space theory first, then the Eulerian specialization.

1. Define `ACᵖ([0,T];X)`, metric derivatives, length, `p`-energy/action, constant-speed
   curves, geodesics, length spaces, and measurable families of curves.  Prove the
   fundamental theorem for absolutely continuous metric-valued curves, reparameterization,
   lower semicontinuity of action, and compactness under equicontinuity/tightness.
2. Build continuous path space with its Borel structure, evaluation maps `e_t`, endpoint
   laws, dynamic plans, and plans concentrated on base-space geodesics.  Prove
   measurability of all evaluation and action functionals used later.
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
6. Develop the `p=∞` dynamic endpoint through `L∞`/Wasserstein--Orlicz action and dynamic
   plans under the exact extended-Polish hypotheses of Lisini's theory.  Prove its
   geodesic characterization where valid; do not obtain it by taking a formal limit of
   the finite-exponent superposition theorem.
7. On finite-dimensional normed spaces, define distributional solutions of
   `∂ₜμₜ + div(vₜ μₜ)=0`, including measurable time slices, vector-valued flux measures,
   test functions, and boundary-time terms.  Prove superposition in both directions and
   identify minimal `Lᵖ(μₜ)` velocity fields for `1 < p < ∞`.
8. Prove the Eulerian **Benamou--Brenier formula** for `1 < p < ∞`, with `p=2` as the
   named classical theorem:
   `W_p(μ₀,μ₁)^p = inf ∫₀¹ ∫ ‖v_t(x)‖^p dμ_t(x)dt`
   over continuity-equation solutions.  Prove attainment and the velocity formula along
   map-induced displacement interpolations.
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
map-induced paths recover the usual displacement interpolation; and the continuity
equation for a translating density has the expected constant velocity.

### Layer 9: displacement geometry and convexity

Turn `P_p(X)` from a metric space into a usable geodesic space.

1. Define displacement interpolations from an optimal dynamic plan and prove independence
   from presentation only when the relevant optimal plan/geodesic is unique.  Define
   generalized geodesics based at a third measure through a glued three-plan.
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
5. Prove McCann's displacement-convexity conditions for internal energies
   `∫ U(ρ) dx`, and the standard convexity results for potential and interaction energies
   under explicit Hessian/convexity hypotheses.  The signed Boltzmann-entropy instance is
   proved in Layer 11 after that functional exists.
6. Develop the one-dimensional quantile isometry and use it to prove geodesic,
   convexity, and barycenter formulas without Euclidean-density assumptions.

The public API must distinguish a selected interpolation from the proposition that a
curve is a displacement interpolation.  This lets later uniqueness theorems improve a
relation into a function without changing foundational definitions.

### Layer 10: abstract metric gradient flows

Build the Ambrosio--Gigli--Savaré theory on a general extended metric space before
specializing it to probability measures.

1. Define proper lower-semicontinuous extended-real energies, descending and relaxed
   slopes, local and strong upper gradients, and `p`-absolutely-continuous curves.  For
   `1 < p < ∞` and its conjugate `q`, define the conjugate-exponent energy-dissipation
   inequality.  Recover the quadratic `p=q=2` API as the standard notation and treat
   endpoint exponents through separately justified statements.
2. Define curves of maximal slope and energy-dissipation equalities.  Prove the chain-rule
   implications under strong-upper-gradient hypotheses and keep existence separate from
   a definition that merely packages an equality.
3. Define `λ`-geodesic convexity and `EVI_λ` solutions.  Prove that EVI implies the
   energy-dissipation identity, contraction, uniqueness, regularization, and semigroup
   laws.  Do not assert the converse or EVI existence on every geodesic metric space.
4. Define the Moreau--Yosida functional, resolvent set/map when single-valued, implicit
   Euler step, discrete variational interpolation, and De Giorgi interpolation.  Prove
   discrete energy and slope estimates.
5. Define minimizing movements and generalized minimizing movements.  Prove compactness
   and convergence from coercivity, lower semicontinuity, and the exact compactness
   hypothesis on sublevels; prove convergence to a maximal-slope or EVI flow when the
   corresponding assumptions hold.
6. Prove stability under Γ-convergence/equicoercivity in the regimes supported by the
   source theorems, and product/sum rules for energies and flows.

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
2. Define the signed extended-real Boltzmann entropy
   `Ent_m(ρ m)=∫ ρ log ρ dm` for σ-finite or boundedly finite references in the regime
   needed by AGS/RCD.  Specify when the positive/negative parts make it finite, prove the
   finite-reference bridge
   `klDiv μ m = Ent_m(μ) + m(univ) - μ(univ)`, and build lower-semicontinuity/coercivity
   statements under the exact moment/reference assumptions.  This is the entropy
   functional used by gradient and heat flows; it may be negative and is not `ℝ≥0∞`.
3. On `P₂(ℝⁿ)`, define tangent velocity fields as the `L²(μ)` closure of gradients and
   prove existence/uniqueness of the minimal-norm representative of an absolutely
   continuous curve.  Relate it to Layer 8's distributional continuity equation and
   metric derivative.
4. Define strong, extended, and limiting Wasserstein subdifferentials and their scalar
   slope.  Prove the subdifferential inequality along optimal plans/generalized geodesics,
   closedness, minimal selection, and the equivalence with velocity fields under the AGS
   hypotheses.
5. Compute first variations and subdifferentials of potential energies, symmetric
   interaction energies, internal energies, and Boltzmann entropy.  Prove their
   displacement or generalized-geodesic convexity under the exact convexity, reference,
   and growth assumptions.
6. Define the Jordan--Kinderlehrer--Otto step
   `μ ↦ argmin_ν (Φ(ν) + W₂(ν,μ)²/(2τ))`.  Prove existence by the direct method, uniqueness
   under the appropriate convexity, Euler--Lagrange conditions, discrete estimates, and
   compactness of interpolants.
7. Prove convergence of JKO schemes to Wasserstein gradient flows and then to weak PDE
   solutions for the named energies.  The theorem must identify both the metric flow and
   the PDE solution concept rather than ending at an unspecified limit curve.
8. Deliver the canonical equations: Boltzmann entropy gives heat flow; entropy plus a potential
   gives Fokker--Planck; power internal energy gives porous-medium/fast-diffusion in its
   valid exponent range; interaction energy gives aggregation; sums give the corresponding
   drift-diffusion equations.
9. Prove energy dissipation, mass preservation, positivity, contraction/uniqueness where
   EVI applies, and agreement with the semigroups built by the
   [one-parameter-semigroups roadmap](../OneParameterSemigroups/README.md) for linear heat
   and Fokker--Planck examples.
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

Start with barycenters in an arbitrary metric space, then specialize to the Wasserstein
space.  This prevents Euclidean `W₂` assumptions from contaminating the basic API.

1. For `1 ≤ p < ∞` and a probability law `P` on a metric space, define the `p`-Fréchet functional
   `x ↦ ∫ d(x,y)^p dP(y)` and its minimizer set.  Include finite weighted families as a
   transparent specialization, allowing zero weights but normalizing total mass.  Define
   the `p=∞` Chebyshev-center functional and minimizers separately.
2. Prove lower semicontinuity, coercivity criteria, existence in proper settings, and
   compactness of the minimizer set.  Prove quadratic uniqueness in CAT(0) spaces and
   state no uniqueness theorem in a general geodesic space.
3. For `1 ≤ p < ∞`, define population Wasserstein barycenters for
   `P ∈ P_p(P_p(X))`.  Prove measurability of the Fréchet functional and existence under
   the precise local-compactness/properness and moment hypotheses of the chosen theorem;
   do not assume that `P_p(X)` is proper merely because `X` is.
4. Prove stability and consistency under convergence of the input law.  Uniqueness may
   upgrade subsequential convergence to convergence of the full sequence, but it is not
   part of the compactness theorem.
5. Relate finite Euclidean `W₂` barycenters to a multi-marginal transport problem through
   a measurable pointwise-barycenter selector.  Prove the multi-marginal primal and dual
   formulas rather than using the selector without a measurability theorem.
6. Prove existence and uniqueness in `P₂(ℝⁿ)` when an input with **positive weight**
   satisfies the precise Agueh--Carlier regularity condition; absolute continuity is a
   standard sufficient corollary.  Develop optimality conditions and regularity of the
   barycenter density.
7. Prove the quadratic one-dimensional formula
   `Q_bar(s)=∑ i, λ_i Q_i(s)` and the quadratic Gaussian covariance fixed-point equation.
   For two inputs with weights `1-t,t`, prove that the `p=2` barycenter is at geodesic time
   `t`; for `1<p<∞`, pin the general time
   `t^(1/(p-1)) / ((1-t)^(1/(p-1)) + t^(1/(p-1)))`.  Add
   empirical-to-population consistency.

The population theory follows Le Gouic--Loubes,
[arXiv:1506.04153](https://arxiv.org/abs/1506.04153); the finite Euclidean theory follows
Agueh--Carlier's [barycenter paper](https://doi.org/10.1137/100805741).

Acceptance checks: barycenters of Dirac laws reduce to base-space Fréchet means; a
two-law quadratic barycenter lies at the weight-time of a displacement geodesic;
one-dimensional quadratic quantiles average with the input weights; and quadratic
Gaussian barycenters satisfy the exact matrix equation.  A nonquadratic two-law example
checks the reparameterized time above.

### Layer 13: entropic transport, Sinkhorn, and Schrödinger bridges

Build this from the finite/probability `InformationTheory.klDiv` slice in Layer 11.1, not
from the signed Boltzmann entropy.  Matrix scaling is a finite specialization of a
measurable entropy-projection theory, not the definition of entropic transport.

#### 13A. Static entropic transport

1. Define the static Schrödinger problem
   `inf { klDiv π R | π ∈ Coupling μ ν }` for an explicit reference probability measure
   or finite reference measure `R`.  Define cost-regularized OT separately as
   `∫ c dπ + ε klDiv π (μ ⊗ ν)` and prove its equivalence to a Gibbs reference when the
   normalizing constant is finite.
2. On arbitrary probability spaces, prove existence and strict-convexity uniqueness from
   finite feasibility in the measurable regimes of the cited theorem.  Add Polish
   lower-semicontinuous stability/compactness results without making topology part of the
   root definition.
3. Prove entropic duality and the Gibbs/Schrödinger density
   `dπ/d(μ⊗ν)=exp((φ⊕ψ-c)/ε)`, with existence and uniqueness-up-to-constants of potentials
   under their real finiteness and integrability hypotheses.  Infinite costs get a
   separate support-constrained statement.
4. In named finite-positive-kernel and bounded-positive continuous-kernel regimes, prove
   the corresponding continuity, smoothness, strict-convexity, and differentiation
   theorems for the regularized value in their stated topologies.  Define the debiased
   Sinkhorn divergence by
   `S_ε(μ,ν)=OT_ε(μ,ν)-OT_ε(μ,μ)/2-OT_ε(ν,ν)/2`; prove positivity and metrization only for
   the cited kernel classes.  Strict convexity of the plan objective alone does not imply
   these claims as functions of marginals or cost.
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
9. Prove convergence of alternating row/column scaling, including quantitative geometric
   rates under positivity/bounded-cost assumptions.  Provide exact rational/algebraic
   examples and a real-arithmetic iteration with certified residual and objective-gap
   bounds; log-domain stabilization must refine the same mathematical algorithm.
10. Prove that the finite matrix objective, dual, potentials, and iterations agree with the
   generic measure-theoretic definitions on finite types.  The existing LeanTriathlon
   statement is a prototype only; this equivalence is the acceptance boundary.

#### 13C. Dynamic Schrödinger theory

11. For a reference law `R` on path space, define endpoint-constrained entropy
    minimization.  Entropy disintegration first yields
    `dP*/dR=(dπ*/dR₀₁)(X₀,X₁)` for the optimal endpoint coupling.  Derive the stronger
    factorization `f(X₀)g(X₁)R` only under Layer 13A's static dual-potential hypotheses.
12. Build or consume through an explicit landed dependency the Brownian path law, heat
    kernel, endpoint disintegration, and Markov/reciprocal-process facts needed for a
    Brownian reference; these are targets here if no upstream API exists.  Construct the
    Brownian Schrödinger bridge, define entropic interpolations, and prove their forward
    and backward equations.
13. Prove the small-noise/zero-temperature connection to displacement interpolation under
    the precise large-deviation and tightness hypotheses built in the proof.

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
   dynamic plan.  Define `CD(K,N)`, reduced `CD*(K,N)`, and `MCP(K,N)` in the exact finite
   and infinite-dimensional regimes, with bridge theorems among conventions rather than
   one overloaded predicate.
3. Prove stability under measured convergence in the regime of the Lott--Sturm--Villani
   theorems, tensorization/localization results selected by their actual prerequisites,
   and the elementary implications among curvature-dimension conditions.  Do not infer
   nonbranching from a curvature bound unless the theorem supplies it.
4. In the smooth weighted Riemannian setting, prove equivalence between the synthetic
   condition and the corresponding Ricci/Bakry--Émery lower bound, including the
   dimension and weighting conventions.  This consumes curvature and volume from the
   geometric-topology roadmap.
5. Build minimal weak upper gradients, Cheeger energy, its relaxed `W¹,²` domain,
   infinitesimal Hilbertianity, and the associated `L²` heat flow/Dirichlet form.  Pin
   `RCD(K,∞)` to mean infinitesimally Hilbertian `CD(K,∞)`, and define finite-dimensional
   `RCD*(K,N)` analogously.  Prove the EVI characterization as a theorem rather than using
   it as a second definition.
6. Prove that on `RCD(K,∞)` spaces the `L²(m)` gradient flow of Cheeger energy on
   densities/functions corresponds, through `ρ ↦ ρ m` in the unit-mass finite-entropy
   regime, to the `W₂` `EVI_K` gradient flow of Boltzmann entropy on `P₂(X)`.  The two flows
   do not literally have the same carrier.  Derive heat-flow contraction and the
   curvature-sensitive estimates available from the cited theory.
7. For `1 < N < ∞`, prove the nonsmooth optimal-map theorem on `RCD*(K,N)` spaces for
   `μ₀,μ₁ ∈ P₂(X)` with `μ₀ ≪ m`: the quadratic optimal coupling is unique and induced by
   a map.  Add the essentially nonbranching `MCP(K,N)` version with its dimension,
   boundedly-finite/full-support reference, moment, and source-absolute-continuity
   hypotheses all visible, and the Alexandrov-space theorem with its precise source
   regularity.
8. Relate smooth McCann transport from Layer 7 to the nonsmooth theorem without claiming
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
[Cavalletti--Mondino](https://arxiv.org/abs/1609.00782).

Acceptance checks: the Euclidean reference space satisfies the expected curvature
condition; the smooth Ricci lower-bound theorem round-trips through the synthetic
definition; entropy flow agrees with the heat semigroup; and a source density on an RCD
space has a unique map-induced quadratic optimizer without any smooth exponential map in
the statement.

### Layer 15: measured kernels and Gromov--Wasserstein

The most general kernel object is `(X, μ, ω)` with Polish carrier `X`, probability law
`μ`, a complete separable metric target `Z`, and an a.e./strongly measurable
`ω : X × X → Z`.  Its finite-`p` component is expressed by
`MemLp (fun q ↦ edist (ω q) z₀) p (μ.prod μ)` about one basepoint `z₀`, with basepoint
independence proved; `p` is not a field of the root structure.  Ordinary metric-measure
spaces are the specialization `Z=ℝ` and `ω=d`.  Reuse Layer 3's measured-carrier,
support, and measure-preserving-isometry records here, embedding them into the kernel
theory rather than creating a second dialect.

1. Define measured kernels, pullback along measure-preserving maps, weak isomorphism
   through a common probability parametrization, support/full-support representatives,
   products, restrictions, and finite weighted kernels.  Prove that all definitions are
   invariant under a.e. equality of `ω`.
2. For `p : ℝ≥0∞` with `1 ≤ p`, define the raw distortion of a coupling using the
   `eLpNorm` of `d_Z(ω_X(x,x'),ω_Y(y,y'))` against `π⊗π`, and define `GW_p` by taking its
   infimum.  Prove the finite-`p` integral/root formula and the `p=∞` essential-supremum
   formula.  Follow this roadmap's no-`1/2` convention and prove the exact conversion
   `GW_roadmap = 2 · GW_BMNN` to sources using the half-distance convention.
3. Prove symmetry and the triangle inequality from the Layer 0 gluing lemma and Minkowski.
   For `1 ≤ p < ∞`, prove BMNN's strongest attainment theorem: a.e./strongly measurable
   finite-`p`-moment kernels on Polish carriers admit an optimal GW coupling, without a
   continuity/lower-semicontinuity assumption on `ω`.  State the `p=∞` attainment regime
   separately, and give the continuous metric-kernel Polish theorem as a direct
   specialization rather than the foundation.
4. Characterize zero distance as weak isomorphism, form the quotient, and give the quotient
   a genuine metric.  For full-support metric-measure spaces, prove that weak isomorphism
   reduces to a measure-preserving isometry; without full support, pass to supports.
5. Prove completeness when the target/kernel category has the needed completeness and,
   for `p < ∞`, separability and density of finite uniform kernels under the exact BMNN
   hypotheses.  State the `GW_∞` topology separately; it need not inherit finite-`p`
   separability.  Prove stability under convergence.  When `Z` is geodesic, construct
   `GW_p` geodesics by interpolating kernels over an optimal coupling in the theorem's
   valid exponent regime.
6. Specialize to complete separable metric-measure spaces with
   `d ∈ Lᵖ(μ⊗μ)`.  Recover Mémoli's compact full-support Gromov--Wasserstein theory and
   prove only sourced comparison implications with Gromov--Prokhorov and measured
   Gromov--Hausdorff convergence.  A Gromov--Prokhorov-to-`GW_p` implication must carry
   uniform `p`-integrability of distance kernels; a measured-Gromov--Hausdorff comparison
   must carry its support/noncollapse control.  Compactness alone does not identify these
   topologies.
7. For scalar `L²` distortion, build Sturm's geodesic "space of spaces," its tangent-cone
   description, and its Alexandrov nonnegative-curvature theorem.  Keep this curvature of
   the moduli space distinct from the `CD/RCD` curvature of an individual space.
8. Prove computable lower bounds from distance/kernel distributions, eccentricity, and
   finite invariants, with equality and stability statements where known.
9. Show that finite weighted distance matrices give exactly the standard nonconvex
   quadratic GW objective.  Build exact small examples and certified objective/lower-bound
   calculations.
10. Define entropically regularized finite GW on top of Layer 13 and relate it to the
    generic kernel definition.  Since the distortion objective remains nonconvex, prove
    only the global or stationary-point guarantees supplied by the analyzed algorithm;
    entropy does not justify a false convexity or global-convergence theorem.  Treat GW
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

* The [PDE roadmap](../PDE/README.md) builds weak Sobolev spaces, compactness, and parabolic
  solution theory consumed by Monge--Ampère estimates and the PDE identification of JKO
  limits.  Nonlinear Monge--Ampère, continuity equations of measure-valued curves, and OT
  first variations remain explicit work here.
* The [geometric-topology roadmap](../GeometricTopology/README.md), Layer 7, builds
  Riemannian volume, connection, curvature, and related manifold geometry.  Layers 7 and
  14 consume it and supply transport/synthetic-curvature bridges in return.
* The [one-parameter-semigroups roadmap](../OneParameterSemigroups/README.md) supplies
  abstract and concrete semigroups.  Layer 11 proves that the linear Wasserstein gradient
  flows agree with the corresponding heat/Markov semigroups.

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
signed Boltzmann entropy, and the metric-gradient-flow substrate.  Layer 15 needs only
Layers 0--3 for its foundation, while its entropic and barycenter targets wait for Layers
12--13.

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
* Y. Brenier, [Polar factorization and monotone
  rearrangement](https://doi.org/10.1002/cpa.3160440402), 1991; W. Gangbo and R. McCann,
  [The geometry of optimal
  transportation](https://www.math.toronto.edu/mccann/assignments/477/GangboMcCann96.pdf),
  1996; R. McCann, [Riemannian polar
  factorization](https://doi.org/10.1007/PL00001679), 2001.

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
  [MTW necessity](https://doi.org/10.1007/s11511-009-0037-8); G. De Philippis and A.
  Figalli, [partial regularity](https://www.numdam.org/item/10.1007/s10240-014-0064-7.pdf);
  N. Trudinger and X.-J. Wang, [the second boundary value
  problem](https://www.numdam.org/item/ASNSP_2009_5_8_1_143_0.pdf).

### Dynamics, gradient flows, and barycenters

* L. Ambrosio, N. Gigli, and G. Savaré, [*Gradient Flows in Metric Spaces and in the
  Space of Probability Measures*](https://link.springer.com/book/10.1007/978-3-7643-8722-8),
  2008.
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
* J. Lott and C. Villani, [Ricci curvature for metric-measure
  spaces](https://annals.math.princeton.edu/2009/169-3/p04), 2009; K.-T. Sturm,
  [On the geometry of metric measure
  spaces](https://doi.org/10.1007/s11511-006-0002-8), 2006.
* F. Mémoli, [Gromov--Wasserstein distances and object
  matching](https://doi.org/10.1007/s10208-011-9093-5), 2011; H. Bauer, F. Mémoli, T.
  Needham, and M. Nishino, [The `Z`-Gromov--Wasserstein
  distance](https://www.jmlr.org/papers/volume26/24-2189/24-2189.pdf), 2025; K.-T. Sturm,
  [The space of spaces](https://arxiv.org/abs/1208.0434), 2012.

## Acknowledgements and provenance

This roadmap's prior-art audit was informed by Joseph Miller's Vlasov formalization,
Daniel Lyng's Econlib development, and the archived ItaLean project discussion.  Any
ported implementation must preserve attribution and document the generalizations made
during migration.  The roadmap also uses the theorem boundaries and counterexamples in
the cited primary literature to keep "maximal generality" mathematically honest.
