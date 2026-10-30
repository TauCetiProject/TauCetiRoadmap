# Roadmap: stochastic calculus, Brownian motion and diffusions

**Summary.** Build a usable theory of stochastic processes, continuous-time martingales, stochastic
integration and finite-dimensional diffusions. The principal outputs are constructed Wiener
laws and integrals, Itô and Stratonovich calculus, Brownian path and potential theory,
Cameron–Martin and Girsanov changes of measure, martingale representation and time change,
strong and weak SDEs, and probabilistic representations of deterministic PDEs. These outputs
must have restriction, stopping, localization, congruence, naturality and integrability APIs;
a predicate listing the desired properties is not a construction of the object.

[Suggested.lean](Suggested.lean) states headline acceptance signatures against the pinned
APIs. The general vector, semimartingale, flow and diffusion targets have their mathematical
specifications below, including constructions whose carriers are absent at the pins.

## Scope and ownership

This roadmap owns continuous-time stochastic calculus and its finite-dimensional diffusion
applications, from regularization and Wiener construction to stochastic integration, Brownian
path theory, changes of measure and SDEs. It imports the generic point-measure, Poisson-law and
compensator theory from PointProcesses Layers 0, 4, 10 and 11; Layer 0.6 here owns the
process-specific Unit-mark and indexing adapters. OrthogonalL2Bases Part D supplies Gaussian
tensor bases. StandardDistributions §§8.1, 12.1–12.2 supplies the Bessel/sphere distribution
identities. PDE Lanes C12 and C15 supply deterministic mean-value and subharmonic theory,
OneParameterSemigroups Part A supplies C₀ generators and resolvents, and
DifferentialGeometry §0.3 supplies differentials and pullbacks. The precise declarations
consumed at the pins are recorded in Exact supplier contracts.

Mathlib owns the vocabulary of measures, filtrations, native locality and Brownian laws;
Tau Ceti's implemented submean inequality is used without a second construction. Stochastic
chain rules, finite-measure harmonic boundary adapters and stochastic generator identification
remain here. FinancialMathematics M0.1–M0.4 owns trading, assets and pricing; MarketImpact owns
feedback market models. OptimalTransport §13C consumes Wiener laws and heat-generator
identification and owns its scaled reference and reciprocal-process/entropy theory.
General SPDEs and infinite-dimensional noise are outside this finite-dimensional roadmap.

## Conventions

- Define the progressive σ-algebra on `[0,T]×Ω` as the restriction of the σ-algebra of sets `A` such that for every `t≤T`, `A∩([0,t]×Ω)` belongs to `B([0,t])⊗F_t`; use the analogous half-line definition. Prove the equivalence between measurability of the evaluation map for this σ-algebra and native `IsProgressive`, whose definition tests every `Set.Iic t × Ω` with the product sigma algebra. S0.2 owns this conversion for `ℝ≥0` time.
- Time is `ℝ≥0`, with PointProcesses' shared convention `nnvolume = Measure.comap ((↑) : ℝ≥0 → ℝ) volume`. The prototype uses that same concrete formula; the implementation provenance below distinguishes it from native declarations. Define `timeMeasure T := nnvolume.restrict (Set.Ioc 0 T)` locally; SC owns its finite-horizon restriction and trim lemmas, and claims no provider restriction API. Stopping times take values in `WithTop ℝ≥0`. Finite horizons are closed intervals and infinite time is a distinct value. Every stopped-value theorem at infinity either restricts to `{τ<∞}`, supplies a terminal limit, or uses an explicitly declared cemetery state. Mathlib's `stoppedValue` uses `untopA`, whose fallback is not a terminal martingale limit.
- In S9.1, `IsStrongSolution` means a strongly adapted continuous real process with the initial condition, pathwise time-integrability of the drift, square-integrability of the diffusion on each finite horizon, and the stated integral equation outside one null set simultaneously for all times. The representative and indistinguishability conventions below apply.
- A stochastic basis uses a measure `P` with `[IsProbabilityMeasure P]` and a Mathlib
  `Filtration ℝ≥0 mΩ`. Adaptation, strong progressive measurability and predictability are
  `StronglyAdapted`, `IsStronglyProgressive` and `IsStronglyPredictable`. Usual conditions
  mean right continuity and inclusion at time 0 of every ambient P-null set, after completing
  the ambient probability space where necessary. State the measure and augmentation explicitly.
  A raw natural filtration is not complete merely because the process has continuous paths.
  The native measurable predicates `MeasureTheory.Adapted` and `IsProgressive` are also
  used for Polish-valued modification statements. Consume `stronglyAdapted_iff_adapted`,
  `IsProgressive.isStronglyProgressive` and `IsStronglyProgressive.isProgressive` under their
  Borel, metrizability and countability hypotheses; these are vocabulary adapters, not new notions.
- Scalar martingale integration is developed for real càdlàg locally square-integrable
  martingales. Its continuous subclass supplies the principal Itô/SDE theory. Finite-dimensional
  real inner-product spaces are the generality of vector martingales, Brownian noise and SDE
  state spaces; transport coordinate formulas along linear isometries. Do not silently
  substitute operator norm for Hilbert–Schmidt norm in the diffusion isometry.
- Use Mathlib's `ProbabilityTheory.IsLocalizingSequence`, `Locally` and `IsStable`.
  `Locally p ℱ X P` stops `1_{0<τ_n}X`; expose this convention and its equivalence with
  the centered convention for `X−X₀`. Initial F₀-measurable values need not be integrable
  for the centered/local theory. Actual martingale conclusions carry the needed initial
  integrability. Do not replace the existing localization framework with a private sequence.
- Versions agree a.s. at each fixed time; indistinguishable processes agree at every time
  outside one null set. Integrals, maximal solutions and stochastic identities are unique up
  to indistinguishability. Quotients and representative selection must preserve this distinction.
- A Brownian motion relative to ℱ has a.s.-continuous paths, is adapted, starts at 0 a.s., and has
  centered Gaussian increments of covariance `(t−s)id`, independent of ℱ_s. Pinned
  `IsBrownianReal` states laws and a.e. continuity but not this filtration relation. Define
  the relative predicate as a strengthening and prove the dictionary; do not infer Brownian
  independence in an arbitrary larger filtration from its marginal laws. Use S0.2's selected
  predictable indistinguishable version for stopped evaluations and other literal progressive
  measurability assertions. Transfer identities to the original version a.s.; do not infer
  literal raw-filtration measurability of its stopped values from a.s. path continuity.
- Quadratic variation `[M]` is optional pathwise variation; predictable bracket `⟨M⟩`
  is the compensator of the square. They agree for continuous local martingales, and differ
  for jump martingales. Brownian `[B]_t=t`; independent vector components have
  `[Bᵢ,Bⱼ]_t=δᵢⱼt`. Stochastic exponentials start at 1 and use centered integrators.
- Deterministic and finite-variation integrals use ordinary measure/Bochner/Stieltjes APIs.
  Brownian/Itô integrals are constructed separately and then identified with valid pathwise
  integrals when the hypotheses allow it. C² noise regularity and C¹ finite-variation/time
  regularity are the final Itô target; a C³ bounded-derivative proof is a lemma on its route.

## Exact supplier contracts

Consume the following native APIs and supplier construction targets. A roadmap contract specifies
work to build; only the entries explicitly identified as native assert an implemented declaration.

- Measure theory already supplies `Measure`, `Measure.map`, `withDensity`, RN and Lebesgue
  decomposition, product measures, kernels/disintegration, completion, Bochner integration,
  Fubini/Tonelli and convergence theorems. `MemLp`, `Lp`, `UniformIntegrable`,
  `TendstoInMeasure`, conditional expectation including `condExpL2`, orthogonal projection,
  tower/order/contraction and independence/tail zero–one are existing foundations.
  `MeasureTheory.tendsto_ae_condExp_iInf` in
  `TauCeti/Probability/Martingale/Convergence.lean` supplies reverse-martingale convergence.
  `TauCeti.Probability.centralMoment_id_two_mul_gaussianReal` in
  `TauCeti/Probability/Distributions/Gaussian/Moments.lean` supplies even Gaussian moments,
  including the sixth moment. Completed/OrthogonalL2Bases Part D already supplies
  `TauCeti.gaussianHermitePiBasis` from
  `TauCeti/Probability/Distributions/Gaussian/Hermite/Pi/Basis.lean`, the generic
  `TauCeti.piHilbertBasis` from `TauCeti/Analysis/InnerProductSpace/L2/Pi.lean`, and the finite-product
  Hilbert-basis construction; consume those APIs rather than rebuilding a Gaussian product
  basis. S6.1 owns only the normalized Brownian-increment-law pullback, finite-grid
  sigma-field L² isometry, and dyadic density adapters.
- Native [`BoundedVariationOn.vectorMeasure`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/MeasureTheory/VectorMeasure/BoundedVariation.lean)
  supplies a finite-variation vector measure from a globally BV function, with interval,
  singleton and variation formulas. Native [`VectorMeasure.integral`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/MeasureTheory/VectorMeasure/Integral.lean)
  integrates against vector measures through a continuous bilinear pairing; its domain is L¹
  of the variation measure. The native [BV integration-by-parts API](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/MeasureTheory/VectorMeasure/IntegrationByParts.lean)
  supplies the left-/right-limit formulas. S0.0 builds the finite-horizon and endpoint adapters;
  S3.5 proves random-measure measurability and agreement with stochastic integration.
- `Probability/BrownianMotion/{GaussianProjectiveFamily,Basic}.lean` supplies
  `BrownianReal.projectiveFamily`, its projectivity, `IsPreBrownianReal`, `IsBrownianReal`,
  Gaussian laws/covariances, independent increments, signs/scaling/shifts and deterministic
  past–future independence. The inverse-process law theorem is pre-Brownian; S1.4
  constructs its continuous inversion dictionary and infinity limit.
- Countable projective existence is already
  `TauCeti.Measure.exists_isProjectiveLimit_nat` and `exists_isProjectiveLimit_of_countable`.
  Mathlib's `Kernel.trajMeasure` and `TauCeti.Probability.markovChainLaw` give
  Ionescu–Tulcea/Markov-chain construction. Use them. General arbitrary-index extension is
  built only as its own named theorem in S1; it is not required to delay the countable-rational
  Brownian construction.
- Filtration/right-continuous hull, adapted/progressive/predictable definitions, stopping sigma
  algebra, `stoppedProcess`, `stoppedValue`, `hittingAfter`/`hittingBtwn` and localization
  framework already exist. Native `IsStronglyProgressive.stoppedProcess` assumes a strongly
  progressive input and a stopping time, with a pseudometrizable time index and the ambient
  order/topology hypotheses. The native hitting-time stopping theorems assume a countable,
  conditionally complete linearly ordered, well-founded time index, an adapted process and
  a measurable target. Real-time hitting/debut is the additional theory in S0. Native
  predictable-to-strongly-progressive conversion uses its linear-order, bottom, measurable
  open-set and order-closed-topology hypotheses.
- General-index martingale definitions and discrete upcrossings, convergence, maximal
  inequalities and optional sampling exist. Countable-range optional sampling is useful for
  dyadic approximation. Versions requiring countable index or locally finite order do not
  already prove arbitrary real-time sampling. `Integrable.tendsto_ae_condExp` requires
  measurability in the supremum sigma algebra; the unrestricted limit is conditional
  expectation onto that sigma algebra.
- [StandardDistributions](../StandardDistributions/README.md) owns scalar Gaussian/Poisson/
  exponential/CDF and distribution families, the modified Bessel function `Real.besselI`
  with its series, recurrence and positivity API (§8.1), the sphere surface mass (§12.1)
  and the spherical exponential integral as the von Mises–Fisher normalizer (§12.2). Add connecting Gaussian moment/path-integral
  lemmas here, not duplicate law definitions.
- [PointProcesses](../PointProcesses/README.md)
  owns the shared `nnvolume` convention and unmarked Poisson point-measure construction targets,
  `TemporalPointMeasure E`, `eventTime`, `IsCompensator`, internal history, and generic
  predictable-integral/compensator interfaces. This roadmap owns the homogeneous
  half-line conversion to a `Unit` mark and the filtration-specific adapter; these are
  law-specific adapters, not replacements for the generic marked-process theory. The
  exact adapter contract is S0.6 below. It yields a measurable
  `N : Ω → TemporalPointMeasure Unit`, almost surely the pushforward under `t ↦ (t,())`,
  with the zero-time repair, count identity, and filtration hypotheses; consume the supplier's
  `eventTime` enumeration through the ground-measure dictionary. Layer 4 owns `nthPoint`,
  finite-arrival and interarrival-law targets; Layer 10 owns `eventTime`. S0.6 owns the
  mark-erasure and count-level indexing adapters, including the initial waiting time. S0.6 owns the process-specific path regularization and Unit-mark transfer, and consumes the
  provider's point-law, simplicity, and interarrival results. A
  Poisson marginal law alone does not imply external-filtration adaptation or independent future
  increments.
  Consume the provider's generic compensated-integral martingale theorem with `H≡1`
  to obtain `N_t−αt` in S2.1; its finite-horizon first-moment condition is `αT<∞`.
  Apply the separate L² isometry with a.e. time simplicity of `N`, no time atoms in `A`,
  and `E∫_(0,T] H² dA<∞`. Consume PointProcesses Layer 4's simplicity result for diffuse
  homogeneous intensity; S0.6 separately regularizes its process-origin construction.
  For `H≡1`, prove the special variance identity `E[(N_T−αT)²]=αT` directly from the
  Poisson marginal law; the generic L² isometry remains PointProcesses-owned Build scope. Prove the process martingale
  `(N_t−αt)²−αt` separately from independent Poisson increments and their variance,
  testing conditional identities at `s<t`. S4.4 then proves its optional/predictable
  bracket formulas; the supplier does not define them. Identify S3.1's measure on each
  finite horizon as `α` times the trim of `(timeMeasure T).prod P` to `F.predictable`.
  Keep the provider's arbitrary-basis compensator scope separate from S2.5's
  usual-basis Doob–Meyer existence/dictionary.
- [PDE](../PDE/README.md) owns deterministic elliptic/parabolic regularity, Dirichlet,
  maximum principles and heat kernels. [OneParameterSemigroups](../OneParameterSemigroups/README.md)
  owns generic C₀ generators/Hille–Yosida/resolvents; S10 supplies stochastic Markov/Feller
  and generator-identification theorems. [DifferentialGeometry](../DifferentialGeometry/README.md)
  supplies the smooth-map differential and coordinate-change interfaces consumed by S5.1 and
  the geometric S10 applications; SC owns the stochastic chain-rule and localization adapters.
  [OptimalTransport §13C](../OptimalTransport/README.md) consumes S1.2's constructed
  Wiener laws and scaling and S10's Markov/heat-generator interfaces. OT owns its
  finite-path-space `R^ε_r` reference, the comparison with this Brownian convention,
  disintegration, reciprocal-process and entropy/Schrödinger-bridge targets.
  General SPDEs and infinite-dimensional noise are outside this finite-dimensional
  roadmap.

### From Tau Ceti: submean inequality

`TauCeti.le_setAverage_ball_of_laplacian_nonneg` in
`TauCeti/Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean` takes C² regularity
on a ball, continuity on its closed ball, a nonnegative Laplacian on the ball and a
strictly positive radius. It gives the center-to-ball-average inequality. The real
finite-dimensional inner-product, Borel and Haar-measure hypotheses are retained.
`TauCeti.SubharmonicOn` in `TauCeti/Analysis/InnerProductSpace/Harmonic/Subharmonic.lean`
means continuity and frequent positive small-radius submean inequalities; it does not
mean an extended-real upper-semicontinuous subharmonic function.

### From TauCetiRoadmap.PointProcesses

Layer 0's count-evaluation measurable structure is used to build the random temporal
measure. Layer 4's Build equivalence applies to a simple nonexplosive positive-rate
count process; S0.6 supplies those hypotheses, and handles zero rate separately.
Layers 4 and 10 supply occurrence enumeration and event times, compared through
count thresholds in S0.6.1 without assuming an origin sentinel. Layers 10 and 11
supply `TemporalPointMeasure`, `IsCompensator`, the predictable-integral identity,
its finite-horizon-integrable compensated martingale consequence, and
`IsAdaptedPoisson.isCompensator`. The latter consumes a measurable map into
`TemporalPointMeasure E`, its underlying measure-valued `IsAdaptedPoisson` law,
a sigma-finite intensity μ, and `μ(K × E)<∞` for every compact time set K; it
returns the constant compensator with that locally finite intensity.
The ground-measure and ground temporal adapters are Layer 0.6.1 targets here.
The forward Poisson theorem is independent of the usual-basis Doob–Meyer dictionary
in Layer 2.5; no later marked-batch existence theorem supplies that dictionary.

### External implementation designs

Shape ports to their source APIs and Mathlib's designs, preserve licenses/authors and record
immutable provenance. Inspect theorem hypotheses and axiom dependency closures before treating
an implementation as a supplier. Read the authors' public coordination threads; record the
port/adaptation boundaries in implementation documentation. Obtain the authors’ agreement
before integrating their code. If coordination is impossible, verify the copying/adaptation
license and discuss the plan on Lean Zulip before integration, as required by the repository
policy. These sources determine shape,
not timing: build the required proofs here and replace compatible portions with imports when
Mathlib supplies them.

- [BrownianMotion](https://github.com/RemyDegenne/brownian-motion), commit
  `a7ad7af662044313bc80a7c0756360fb3745f931`, supplies Kolmogorov–Chentsov, continuous
  modifications, Brownian/Wiener construction, filtered Brownian adapters and useful
  martingale infrastructure. Its LIL reflection/tail lemmas and some Doob–Meyer/local
  branches contain holes; discharge those dependencies. Its `IsStochasticIntegral`
  characterization is not a constructed integral. Adopt its genuine constructions and
  localization vocabulary, not a blanket completion claim. Source headers credit
  Rémy Degenne/Joris van Winden and specify Apache 2.0; retain file-level credits.
- [MathFin](https://github.com/formal-applied-math/formal-mathfin), commit
  `c0180c8d354e479fd9b59c5eb0126c95c2750b42`, has Brownian predictable L² completion,
  genuine Itô CLMs/process constructors, finite-horizon bounded predictable Girsanov and a scalar
  short-time L² Picard fixed point. Port those proofs with exact filtration/representative
  adapters. Its C³ bounded-derivative limit theorem is not the final C²/local/vector formula,
  and its fixed point is not by itself a global pathwise SDE theorem. Source headers
  credit Raphael Coelho and specify Apache 2.0; verify the exact copied-file license.
- [MarkovProcess](https://github.com/scottnarmstrong/MarkovProcess), commit
  `666cda029098a1106914fc9fa7abd1727573284a`, has kernel/trajectory/Feller/restart/Dynkin
  constructions. Its strong Markov theorem uses the raw canonical filtration, and its
  `IsBrownianReal` is a project-specific predicate. Prove adapters to Mathlib's predicate and
  the required filtration, and verify the relevant dependency closure. Do not import challenge placeholders as proof. Headers credit Scott Armstrong
  and specify Apache 2.0; verify the copied-file license and preserve credits.
- The Mathlib Gaussian Cameron–Martin proposal, reviewed at mathlib4 commit
  `7282fd08af0c282368db7e08cd7635f3be769e85`, defines `cameronMartin`, `cmCoe`,
  `cmOfDual`, `cmOfBounded` and `map_add_cameronMartin_eq_withDensity`. Follow its Gaussian
  RKHS/translation shape. Its temporary total-variation lemmas in the singularity branch
  require real proofs or existing replacements. S8 owns the Wiener AC–L² identification and
  deterministic stochastic-integral coordinate, not a competing Gaussian RKHS convention.
- The Mathlib Brownian germ proposal, reviewed at mathlib4 commit
  `be99340ad561c51c674d8705ff559696736e057b`, informs the Brownian germ zero–one design.
  These proposal branches are design references; implement the missing germ and Gaussian
  translation APIs in Tau Ceti using their conventions. For collaboration and design
  discussion, consult the [Brownian project channel](https://leanprover.zulipchat.com/#narrow/channel/509433-Brownian-motion).

## How to read the build

Layer 0 builds measurable process, stopping and augmentation adapters; Layer 1 constructs
Wiener laws; Layer 2 regularizes and localizes martingales. Layer 3 constructs the integral,
Layer 4 its brackets and maximal estimates, and Layer 5 the change-of-variables formulas.
Layer 6 develops Brownian path and potential theory; Layers 7 and 8 develop clocks and
changes of law. Layers 9 and 10 build SDEs and identify their diffusion generators and
PDE representations. The direct Brownian integral uses Layers 0–1 and elementary conditional
orthogonality, independently of Layer 2.5's Doob–Meyer theorem. Labels S0–S10 in internal
references denote these same layers.

## Layer 0: Process spaces, usual filtrations and stopping

### 0.0 deterministic measure and variation adapters

Use native set algebras,
`MeasurableSpace.generateFrom`, Borel spaces, `Measure`, `SimpleFunc`, `lintegral`,
Bochner integration and `Lp`. Prove the interval-algebra/Borel-generation and relative
Borel adapters used on real compact intervals, including unbounded intervals and all
endpoint types when forming an algebra on ℝ. Verify the Lebesgue and Dirac examples
and the probability normalization on [0,1]. Translate the set and function monotone-class
statements into native Dynkin/π-system hypotheses, and the algebra premeasure extension
into `AddContent`/Carathéodory. Keep extension existence distinct from uniqueness;
finite or sigma-finite exhaustion supplies uniqueness where used. For finite measures µ₁,µ₂
and a generating field A₀, let f≥0 be measurable and µ₁-integrable. From
`µ₂(E)=∫_E f dµ₁` on every E∈A₀, prove
`µ₂=µ₁.withDensity (ENNReal.ofReal ∘ f)`, hence µ₂≪µ₁ and equality of the
Radon–Nikodym density with f almost everywhere (using `toReal` for the real-valued
form). Apply native `MeasureTheory.ext_of_generate_finite`: the field supplies both
the π-system and the total-mass test at Ω. Retain the source's symmetric-difference
approximation route through native `exists_measure_symmDiff_lt_of_generateFrom_isSetRing`
in `MeasureTheory/Measure/MeasuredSets`: apply it to the finite measure µ₁+µ₂ and the
generating field A₀, with {Ω} as its countable covering family. Export simultaneous
µ₁/µ₂ approximation, the small-set bound for an integrable density, and the η-level-set
argument for density uniqueness as adapters of those native statements. Export these
finite-field interfaces for S8.3.

Consume native `indepFun_iff_map_prod_eq_prod_map_map` and
`IndepFun.map_add_eq_map_conv_map₀` from `Mathlib.Probability.Independence.Basic`.
For independent measurable real random variables f,g with laws μ,ν, prove the joint
sum-and-second-coordinate event formula for Borel A,B:
`P(f+g∈A, g∈B)=∫_B μ({x:x+y∈A})dν(y)`, and recover the convolution law.
Use the actual product-law identity and nonnegative Fubini, retaining measurability
of the section y↦μ({x:x+y∈A}). For any finite independent family of real increments
with measurable nonnegative Lebesgue densities, construct its product-density law
from `iIndepFun` and native `Measure.withDensity`. Transport it by cumulative sums
and prove the finite-dimensional transition-density formula: for
`0<t₁<⋯<t_k`, the value-vector density is
`Φ_(0,t₁)(x₁) ∏_(j=2)^k Φ_(t_(j−1),t_j)(x_j−x_(j−1))`.
Export the iterated-integral formula on Borel rectangles and the empty-tuple case.
When the first time is zero and X₀=0, integrate that first coordinate against δ₀
and apply the positive-time formula to the remaining increments; do not introduce
an undefined Φ_(0,0). Consume native density-product and convolution APIs from
`Mathlib.Probability.Density`, constructing their joint-density hypotheses from
independence and the marginal densities. S1.3 specializes these general law adapters
to Brownian increments. [IndependentLaws.lean](IndependentLaws.lean) suggests the native
law adapters; the cumulative-sum density formula remains the explicit target above.

For scalar real simple approximations, prove the expanding dyadic rounding formula's
pointwise convergence and monotonicity of absolute values at every finite input. Give a
separate valid nonnegative extended-real approximation, including the value +∞, and
prove independence of the approximation and agreement with `lintegral`. Establish the
positive/negative-part and real/imaginary-part adapters. Finite indicator-sum integration
is linear even for overlapping measurable sets when its terms are integrable; disjoint
fibers give the canonical presentation. Consume MCT, Fatou, DCT, Hölder and Lp
completeness with their actual hypotheses. For finite p≥1, fill in the summable-subsequence
proof using the Lp bounds on sums of absolute increments and monotone convergence;
for p=∞ use summable essential-sup bounds off one null set. AE limits and changes on null
sets use `AEStronglyMeasurable` representatives; literal measurability of arbitrary null-set
modifications is a separate assertion requiring completion. For integrable complex X,
use native `Measure.withDensityᵥ` and `withDensityᵥ_apply` for the countably additive
complex measure E↦∫_E X dµ, with its integrability and measurable-set hypotheses.
Consume native `Measure.variation_withDensityᵥ` from
`Mathlib.MeasureTheory.VectorMeasure.WithDensityVec` for the exact identity
`(µ.withDensityᵥ X).variation=µ.withDensity (fun x↦‖X x‖ₑ)`.

Prove the following exact indicator-series integral dictionary. On a measure space whose
sigma-algebra is generated by a ring R of finite-measure sets with a countable cover of Ω,
every complex L¹ class has a representation Σ_j c_j1_(E_j), E_j∈R, with
Σ_j |c_j|µ(E_j)<∞. Construct disjoint ring-simple approximants with summable L¹ errors,
then telescope; each difference has a disjoint presentation whose weighted coefficient
cost equals its L¹ norm. Tonelli gives absolute convergence a.e., the sum represents the
original class, and its integral is Σ_j c_jµ(E_j), independently of the representation.
Also recover the pointwise version: for measurable integrable f, require equality at every point
where the absolute indicator series converges. For every integer k≥1 cover the measurable
exceptional null set N by countably many ring sets with total measure at most 2^(−k),
using the sigma-finite premeasure extension. Insert a +1 and −1 indicator pair for every
set in every cover. Each point of N occurs in infinitely many pairs, forcing absolute
series divergence there, while the added weighted cost is at most 2Σ_k2^(−k)<∞.
Additional divergence outside N is harmless: equality is required wherever the absolute
series converges. Prove both forms and their equivalence on L¹
classes. Arbitrary sigma-generating families do not suffice: on {0,1} with counting
measure, {{0}} generates all subsets but its indicator series cannot represent 1.

For a finite nonnegative finitely additive content on a set algebra, construct the integral
of algebra-simple functions by disjointization, prove positivity, linearity and
|I(f)|≤µ(Ω)‖f‖∞, and extend it uniquely to their uniform closure. Compare with Bochner
integration when the content extends to a countably additive measure. Prove that an
unrestricted absolutely weighted-summable indicator-series extension is not
representation independent: on the finite/cofinite algebra of ℕ, assign mass 0 to finite
sets and mass 1 to cofinite sets. The constant 1 has representations `1_Ω` and `Σ_n 1_{n}`,
whose coefficient-mass sums are 1 and 0. This pins the limit of the source's extension claim.

For each T≥0 and right-continuous real BV g on [0,T], extend g constantly outside
that interval and use native `BoundedVariationOn.vectorMeasure` from
`Mathlib.MeasureTheory.VectorMeasure.BoundedVariation`. Prove the extension has globally
bounded variation and give the finite-horizon restriction/subtype transport, independently of
extension choices. This supplies the finite signed Stieltjes measure ν_g with
ν_g((a,b])=g(b)−g(a) and ν_g({0})=0. Consume native `vectorMeasure_Ioc`,
`vectorMeasure_singleton` and `variation_vectorMeasure_Ioc` with their right-/left-limit
formulas, proving the right-continuity and endpoint dictionary. Prove uniqueness,
restriction compatibility and |ν_g|((a,b])=V_g(b)−V_g(a), where V_g(t)=`Var_[0,t](g)`.
For every real f on a compact interval, construct nested finite partitions π_n
with mesh at most 1/n whose variation sums tend to the full extended variation.
If the variation V is finite, choose a partition with sum at least V−1/n;
if V=∞ choose sum at least n. Refine it together with π_(n−1) and a uniform
fine grid. Triangle inequality proves refinement never decreases variation,
giving both nestedness and the required limit. This is a construction of a
chosen sequence, not convergence along every arbitrary partition sequence.
Keep function variation distinct from signed-measure variation. Consume native
`SignedMeasure.totalVariation_eq_variation`, `MeasureTheory.preVariationFun` and
`VectorMeasure.variation_le_of_forall_enorm_le` to give the finite measurable partition
formula and least positive measure dominating |ν(E)| on every measurable E. Translate
µ±=(|µ|±µ)/2 into native Jordan parts. On ℝ, local BV means BV on every compact
interval; prove the continuous local-BV iff difference-of-two-continuous-increasing-functions
theorem with this two-sided convention. A measurable atom has positive measure and every
measurable subset has zero or full measure; set-theoretic properness alone does not define an atom.

Use native `VectorMeasure.integral` and its set-integral API with scalar multiplication
to interpret ∫_(0,t] f dg for f∈L¹(|ν_g|); identify it with the difference of the two
Jordan-part Bochner integrals. Consume native linearity, restriction, AE congruence and
norm bounds, specializing to |∫f dg|≤∫|f|d|ν_g|. For continuous g prove
atomlessness of |ν_g| and continuity of t↦∫_(0,t] f dg for f∈L¹(|ν_g|) on the full
horizon. For continuous f, prove convergence for every sequence of tagged finite partitions
of [0,t] with mesh→0, using the modulus of continuity times `Var_[0,t](g)`. Obtain the
continuous-BV integration-by-parts identity with both endpoint terms from native
`BoundedVariationOn.setIntegral_Ioc_leftLim_vectorMeasure_eq_sub` in
`Mathlib.MeasureTheory.VectorMeasure.IntegrationByParts`, after the constant-extension
and continuous-limit identifications. Give a valid
expanding-value truncation approximation for all L¹ integrands; fixed value windows
[−R,R] do not suffice; on the horizon [0,1], the window R=1 misses g(s)=s, f≡2. S3 consumes these deterministic
constructions pathwise.

### 0.1 path laws and random-variable spaces

Continuous paths on finite horizons use `ContinuousMap` and the uniform
   topology; infinite horizons use compact-open topology. Construct based paths, Borel evaluation,
   restriction, time/spatial shift, concatenation and stopped paths. For a real random variable ξ
   and a countable Borel set S with P(ξ∈S)=1, prove its native pushforward law equals
   `Σ_(x∈S) P(ξ=x) δ_x` and `P(ξ∈B)=Σ_(x∈S∩B)P(ξ=x)` for Borel B, with total mass 1.
   In an indexed representation `Σ_j c_j δ_(x_j)`, c_j≥0 and Σ_j c_j=1, allow repeated
   labels but aggregate their weights: `P(ξ=x)=Σ_(j:x_j=x)c_j`. Summing the full atom
   probability once per index is valid only for distinct labels. Prove both event formulas
   through native measure sums and `Measure.map`. Prove Borel generation by
   rational/dense evaluations and probability-law uniqueness from finite-dimensional laws.
   Consume native `IsCadlag`, `IsRightContinuous`, `Continuous.isCadlag` and compact
   path boundedness; give measurable evaluation/left-limit APIs needed by S2–S4; do not assume
   pointwise function-space measurable equivalence with a path space without proving it.
   Use native `MeasureTheory.AEEqFun Ω ℝ P` for scalar random variables modulo a.e.
   equality. On finite measure spaces give convergence in measure its bounded metric
   presentation `d(f,g)=∫|f−g|/(1+|f−g|)dP`. Prove representative independence, the
   metric axioms, completeness and equivalence with native `MeasureTheory.TendstoInMeasure P`.
   Use a distinct wrapper for real L⁰ and an equivalence with `AEEqFun Ω ℝ P`;
   no second a.e. quotient is constructed.
   Give the wrapper its metric instance. Keep `AEEqFun` free of this metric instance,
   preserving the native Lp norm topology. For 1≤p prove continuity of
   the map from `Lp ℝ p P` to this L⁰ wrapper using native
   `tendstoInMeasure_of_tendsto_Lp`. That native convergence theorem needs no finite-measure
   hypothesis; finiteness is needed both for the bounded-integral metric axioms and for its
   equivalence with convergence in measure. On infinite measure spaces the metric formula
   is not asserted: a nonintegrable real Bochner integrand has integral zero by convention.
   Prove continuity of real addition, multiplication and scalar multiplication;
   consume native Lp/a.e.-to-in-measure and subsequence a.e.-convergence results
   through their actual hypotheses. This random-variable metric does not give
   a pathwise or uniform-in-time convergence conclusion.

### 0.2 regularity and measurability

Construct the progressive sigma algebra and its
   evaluation-map equivalence with native `IsProgressive` under the conventions above.
   Define `Indistinguishable P X Y` by equality for every time on one common P-full
   event. Prove its equivalence-relation and process-map laws.
   `exists_stronglyPredictable_ae_of_progressive` is the predictable-representative
   theorem below for real progressive inputs. Versions/indistinguishability, equivalence relations,
   representative replacement and maps of processes; continuous/right-continuous versions
   agreeing at a countable dense set are indistinguishable. Everywhere-continuous adapted and
   adapted left-continuous processes are predictable. Give a corrected explicit approximation for the source's measurability argument:
   for integer n≥1 use grid endpoints `j/n²`, `0≤j≤n³`, on [0,n], set
   `Y_n(0)=X_0`, and for `0≤j<n³` use coefficient `X_(j/n²)` on `(j/n²,(j+1)/n²]`,
   with zero after n. Prove each random coefficient gives a predictable
   measurable function by its Borel preimages, using that same half-open
   interval and its exact zero-value complement. The lag is at most 1/n²,
   so continuity gives pointwise convergence at every finite time, including 0.
   A grid ending at j=n² only reaches time 1 and does not justify the [0,n]
   claim. Keep the source's closed-interval inverse-image display separate. For a.s.-continuous adapted processes
   construct an indistinguishable predictable version by lagged dyadic approximations; a.s.
   continuity of a raw version does not itself assert literal predictability. Separately, for
   an arbitrary filtration with no completeness or right-continuity assumption, every ambient-
   product-measurable adapted process into a Polish space has a progressive modification, meaning
   equality almost surely at each fixed time. This is not indistinguishability and requires no
   path regularity or usual conditions. Use Ondreját–Seidler, *On existence of
   progressively measurable modifications*, ECP 18 (2013), no. 20,
   [Theorem 0.1](https://doi.org/10.1214/ECP.v18-2548), for this exact distinction between
   fixed-time modification and indistinguishability. Prove it acyclically: scalar conditional-expectation
   paths are regulated in L¹ for arbitrary filtrations; dyadic representatives and the countable
   set of one-sided discontinuities give progressive scalar versions; indicators extend by a
   π/λ or monotone-class argument; countable-range processes and uniformly accurate
   countable-range Polish approximations complete the construction. Build the real-time
   regulated/L¹ and representative arguments here from native increasing/decreasing sequence
   conditional-expectation limits; do not call S2/S3 regularization. On each finite horizon,
   prove separately by Fubini that this fixed-time modification gives equality a.e. for
   Lebesgue-time × P, assuming ambient product measurability of the original process. Adapted
   right-continuous/càdlàg processes are progressive; retain this path-regularity adapter as a
   separate result. For its direct proof, fix a finite horizon T, approximate on [0,T] by
   right-endpoint samples on successively finer partitions capped at T, and set the value at
   0 separately. Each coefficient is F_T-measurable, which suffices for B([0,T])⊗F_T
   measurability; the approximants need not be adapted at earlier times. Right continuity
   gives pointwise convergence. The lagged left-endpoint predictable approximation above
   uses continuity or left continuity and does not establish this right-continuous result.
   For real or finite-dimensional progressively measurable Brownian integrands, construct
   a predictable representative equal a.e. for Lebesgue-time × P on every finite horizon.
   Use bounded truncations and backward time averages: each average has continuous adapted
   paths, and translation continuity gives product-L² convergence at each fixed truncation
   and finite horizon. Choose a diagonal
   a.e.-convergent subsequence over integer horizons and take its measurable limit, with
   zero where it fails. Prove representative independence and consistency of the resulting
   product-a.e. class. Preserve the distinction from fixed-time modifications and
   indistinguishability; this is the Brownian dt×P adapter, not a claim for arbitrary µ_M.
   Prove joint and stopped measurability using existing predicates. Define the
   optional sigma algebra from adapted càdlàg processes. On arbitrary filtrations prove
   predictable ⊆ optional ⊆ progressive. Before any section argument, define an optional
   stopping time by its sublevel events and define a pointwise predictable/announceable time
   to be an F-stopping time τ with everywhere-finite F-stopping times τ_n increasing
   pointwise to τ and τ_n<τ on {τ>0}; the sequence also tends to ∞ on {τ=∞}.
   Handle τ=0 by its F₀ event. Prove elementary announceability operations directly from
   this definition: positive deterministic delays; restriction of a pointwise predictable time
   to an F₀ event; finite minima and maxima, including minima with deterministic times,
   with strict announcing approximants; and countable suprema. For the latter take the
   maximum of the first n times’ nth finite announcing approximants and prove that this
   diagonal sequence announces their supremum, including zero and infinity. Also prove
   restriction of predictable σ to `{σ≤τ}` for optional τ (the restricted time equals σ on
   that event and ∞ otherwise). Show from the announcing sequence that [τ,∞) is predictable.
   Prove the predictable sigma algebra is generated by rays of these pointwise announceable times,
   using the elementary predictable-rectangle generators. On an arbitrary basis, prove directly
   that the optional sigma algebra generated by adapted càdlàg processes equals the sigma algebra
   generated by stopping-time rays `[τ,∞)`. One inclusion is immediate because each ray
   indicator is adapted and càdlàg. For the reverse inclusion, first prove the stopped-evaluation
   lemma that `X_τ` restricted to `{τ<∞}` is `F_τ`-measurable for adapted càdlàg real `X`;
   define any totalized value at infinity using the convention above. For each deterministic t,
   approximate `τ∧t` from above by finite-valued stopping times bounded by t, use adaptedness
   to show each sampled value is `F_t`-measurable, and pass to the limit by right continuity;
   then apply the defining criterion for `F_τ`. Given ε>0, let τ₀=0 and recursively define τₙ₊₁ as the first time t>τₙ at
   which `|X_t−X_{τₙ}|≥ε` or `|X_{t−}−X_{τₙ}|≥ε`, with infimum ∞ if there is no such time.
   This is equivalently the first time the adapted càdlàg process `Dⁿ_t=X_t−X_{t∧τₙ}`
   reaches ε in value or left limit; both Dⁿ_(τₙ) and Dⁿ_(τₙ−) are zero. Right continuity
   at τₙ gives τₙ₊₁>τₙ on `{τₙ<∞}`. To prove this is a stopping time without a debut
   theorem, apply the countable-dense test to Dⁿ: its first time with `|Dⁿ_t|≥ε` or
   `|Dⁿ_{t−}|≥ε` is the infimum of a pathwise set with an attained infimum. For a càdlàg
   path, as r↓s the values and left limits at r tend to the value at s, so threshold attainment
   follows at the infimum. Its sublevel event is the threshold condition for the supremum of
   the values and left limits on a fixed countable dense subset of `[0,t]` together with
   endpoint t; right continuity and existence of left limits identify this countable supremum
   with the full path supremum. These evaluations are `F_t`-measurable. Càdlàg paths have only finitely many ε-exits on compact intervals: otherwise strict increase gives
   τₙ↑s<∞, and both the exit values and their left limits converge to X_(s−), as do the
   preceding sampled values. The threshold difference then tends to zero, contradicting ε>0.
   Hence τₙ→∞. If τₙ≤τₙ₊₁, then `F_{τₙ}⊆F_{τₙ₊₁}`: for A∈F_(τₙ),
   `A∩{τₙ₊₁≤t}=(A∩{τₙ≤t})∩{τₙ₊₁≤t}` belongs to F_t. Thus the step process `Y^ε=Σₙ X_{τₙ}1_{[τₙ,τₙ₊₁)}` is measurable for the ray sigma
   algebra: for `A∈F_τ`, the time equal to τ on A and ∞ off A is a stopping time, so
   `1_A1_{[τ,∞)}` is ray-measurable; use this for Borel level sets of `X_τ`. The exit definition
   gives `|X_t−Y^ε_t|<ε` on every half-open interval, including the right-hand value at each
   exit by starting the next interval there. Taking ε↓0 proves X is ray-measurable. Apply this
   to real coordinates for finite-dimensional processes. This equivalence is proved before any
   capacity, section or debut argument and assumes neither completeness nor right-continuity;
   it does not import a theorem whose statement assumes the usual conditions. On any filtered probability space,
   construct the section engine used by S0.5 and the later optional-section
   result; these are actual
   constructions, not a citation to S0.4's debut result. These two section results need no
   completeness or right-continuity assumption; reserve those conditions for the a.s.-announcing
   converse and the completed-space projection debut. First define the Souslin operation on schemes with values
   in a class E of subsets of an arbitrary carrier. Prove closure of S(E) under countable
   unions and intersections, flattening S(S(E))=S(E), and σ(E)⊆S(E) when E-complements and
   the empty/full sets lie in S(E). For the product measurable space `[0,∞)×Ω`, take E₀ to be
   finite unions of measurable rectangles `[a,b]×C` with bounded closed time intervals. Prove
   E₀ is closed under finite unions/intersections and its complements lie in S(E₀), so every
   product-measurable set is Souslin over E₀. For a filtration, separately take E* on the same time-first carrier to be finite
   unions of stochastic intervals `[[σ,τ]]={(t,ω):σ(ω)≤t≤τ(ω)}` with pointwise
   announceable σ and finite optional τ.
   Prove the same finite-lattice and complement properties, compactness of every time fiber,
   and σ(E*) equal to the predictable sigma algebra generated by the rays established above.
   In particular, prove restriction/debut operations for these intervals from the basic
   announcer sequence, before applying the capacity argument. Do not identify E₀ with E*:
   the first produces measurable, not adapted, selections; the second is the
   filtration-aware paving needed for predictable sections.

   Prove the capacity approximation used by both pavings rather than relying on a private
   native lemma. For a probability P on Ω, define its outer extension
   P*(A)=inf{P(E): A⊆E, E measurable}; prove monotonicity and countable subadditivity.
   For A_n↑, choose measurable envelopes H_n⊇A_n with P(H_n)=P*(A_n) and set
   B_n=⋂_(m≥n)H_m. Prove B_n↑, A_n⊆B_n and P(B_n)=P*(A_n); continuity of P on
   B_n then proves P*(⋃A_n)=lim P*(A_n). For A⊆[0,∞)×Ω, let `πΩ=Prod.snd` and put I(A)=P*(πΩ A); projection
   commutes with increasing unions, so I has the continuity required by the Souslin
   approximation theorem. Also prove the measurable-envelope subtraction lemma: for measurable
   A⊆E, `P*(E\A)≤P*(E)−P(A)`. Choose a measurable envelope H⊇E with
   P(H)=P*(E); then `P*(E\A)≤P(H\A)=P*(E)−P(A)`. Prove that for a finite-union/intersection paving E and any
   monotone increasing-continuous I, I(A)>λ for A∈S(E) yields decreasing E_k∈E with
   I(E_k)>λ and ⋂E_k⊆A. The proof prunes a Souslin scheme by finite initial-segment bounds;
   retain the strict >λ bound at every stage, and do not infer I(⋂E_k)≥λ from this abstract
   theorem alone. For E₀ and E*, prove each paving member has measurable projection.
   Compact time fibers give the additional identity πΩ(⋂E_k)=⋂πΩ(E_k). This makes the
   projected intersection measurable and gives its P-mass
   as the decreasing limit, which is the extra step needed to extract a section with probability
   arbitrarily close to P*(πΩ A).

   For E₀, prove the measurable-section theorem directly from that capacity result: each
   intersection of the finite rectangle approximants has compact fibers, so its debut is
   measurable, its finite graph lies in the intersection, and its finite-domain probability
   approaches the outer measure of the projection. This selection is only F-measurable and
   is not used as an adapted stopping time. For E*, first give the predictable debut explicitly. For a finite union of intervals
   `[[σᵢ,τᵢ]]`, its debut is the minimum of the σᵢ over indices with `σᵢ≤τᵢ`, and is ∞
   if there is no such index; prove the restricted times and finite minimum are announceable.
   If E_k is a decreasing sequence of E*-sets with compact time fibers, their debuts increase
   and `D_{⋂ₖEₖ}=supₖD_{Eₖ}`, including empty fibers and ∞, by compactness of nested closed
   fibers. The already-proved countable-supremum operation makes this a predictable debut; prove
   `{D_{⋂Eₖ}≤t}=⋂ₖπΩ(E_k∩([0,t]×Ω))∈F_t`. Then prove the analogous predictable-section
   theorem with this debut and the same outer-projection estimate. Prove the optional
   section theorem in a separate step. First prove progressive evaluation and thin-set
   downward closure. For a stopping-time graph [[T]] and progressive set A, put
   `A_T={ω:(T(ω),ω)∈A, T(ω)<∞}`. Its intersection with `{T≤t}` is F_t-measurable:
   restrict A to `[0,t]×Ω`, compose with `ω↦(T(ω)∧t,ω)`, and use the defining criterion
   for F_T. Therefore A_T∈F_T and `[[T]]∩A=[[T_{A_T}]]`, where T_(A_T)=T on A_T and
   ∞ otherwise. Optional sets are progressive; extend the restriction to thin sets by
   countable unions. A thin set is a countable union of optional stopping-time graphs.
   For any stopping time T, `(T,∞)` is predictable by its left-continuous adapted
   indicator, while the optional ray `[T,∞)` differs from it by [[T]]. Using the
   downward-closure lemma, prove that the class of optional sets differing from some
   predictable set by a thin set is a sigma algebra. The optional-ray generation above
   then puts every optional set in that class.

   Supply the optional-time accessible/totally-inaccessible decomposition without
   Doob–Meyer. For a given optional time T, maximize over countable families of
   predictable times agreeing with T the probability of the union of their finite
   agreement events. Take a countable union of maximizing families to attain the
   supremum. Maximality forces every further predictable-time agreement outside this
   union to be null. Prove `{T=S≤t}∈F_t`; restricting T to the union and its complement
   therefore gives stopping times. The first restricted graph is covered by the chosen
   predictable graphs; the second has zero finite-time agreement with every predictable
   time. These are the accessible and totally inaccessible parts.

   Let P denote the probability measure. For optional O choose a predictable approximation
   Q₀ with thin symmetric difference. Decompose the graphs in that difference into their
   accessible and totally inaccessible parts. Cover all accessible parts by a countable union
   G of predictable graphs, and put Q=Q₀\G. This Q is predictable. Its excess Q\O is
   contained in the totally inaccessible thin remainder, and is itself thin by the optional
   downward-closure lemma. Also `O\Q⊆(O\Q₀)∪G`, so O\Q remains thin. Remove the whole
   predictable cover G: an arbitrary optional subset of a predictable graph need not itself
   be predictable.
   Choose an announceable section R of Q with error ε/2. Restrict R to membership in O
   and call the resulting stopping time σ. Its finite graph lies in O∩Q. Since every
   predictable graph meets Q\O on a null finite-time event, clipping loses no mass;
   hence `P(σ<∞)≥P*(πΩ Q)−ε/2`.

   Cover O\Q by optional graphs [[T_j]] and restrict each time using progressive
   evaluation: set T'_j=T_j on
   `A_j={ω:T_j(ω)<∞,(T_j(ω),ω)∈O\Q}` and ∞ otherwise. The restricted graphs still
   cover O\Q and are contained in it. Thus `C=πΩ(O\Q)=⋃_j{T'_j<∞}` is measurable.
   Choose a finite initial union whose probability misses C by at most ε/2, and let τ
   be the minimum of those finitely many T'_j (∞ for an empty union). Write
   `A={σ<∞}`, `B={τ<∞}` and `E=πΩ Q`. Then A⊆E and both A,B are measurable.
   The envelope subtraction lemma gives `P*(E\A)≤P*(E)−P(A)≤ε/2`, while
   `P(C\B)≤ε/2`. Since `πΩ O=πΩ(O∩Q)∪πΩ(O\Q)`, its part outside A∪B is contained
   in `(E\A)∪(C\B)`. Outer subadditivity gives
   `P*(πΩ O)≤P(A∪B)+ε`. The minimum of σ and τ has finite graph in O and domain A∪B,
   so this is the required optional-section estimate. Prove all restriction, graph,
   predictable-cover, projection and countable-union steps; neither an optional section
   theorem nor Doob–Meyer is a premise of this engine.

### 0.3 augmentation

Complete a probability space and transport laws and processes.
   In `RawLocalization.lean`, define `ambientNullAugmentation F P`
   on the original measurable space by adjoining every *ambient-measurable* P-null set to
   each `F_t`; prove `measurableSet_null_ambientNullAugmentation` at time zero and its
   filtration, leastness, transport and process-agreement laws. Then form the right-continuous
   hull. This is null augmentation of a filtration, not completion of the ambient probability
   space; keep the two constructions and their transport maps distinct. Natural Brownian
   usual-filtration right continuity is proved in S1/S6, not assumed here.

### 0.4 stopping

Extend native hitting times to continuous-time entry/exit from open,
   closed and Gδ sets under their actual path/filtration conditions. For everywhere-continuous
   adapted paths, closed-set hitting is a stopping time without assuming right continuity of the
   filtration: on [0,t], compactness and distance to the closed set give an event measurable
   from countably many samples, with time 0 handled separately. If G=⋂U_n is Gδ,
   its exit time is inf_n τ_(U_n); prove {τ_G<t}=⋃_n{τ_(U_n)<t}. To obtain the native
   stopping-time condition {τ_G≤t}∈F_t, assume a right-continuous filtration and pass through
   t+1/k. Keep the strict-time event criterion distinct on arbitrary filtrations. As a
   sharpness example, take a nontrivial event A revealed only at times t>1, the continuous
   adapted process X_t=(t−1)⁺1_A, and G={0}. Its first exit has value 1 on A and ∞
   outside A, so {τ_G≤1}=A need not belong to F_1. First exit from an open domain is
   closed-complement hitting and needs no right continuity when all paths are continuous.
   With only almost-sure path continuity, use a complete usual basis and a continuous
   indistinguishable representative for these literal stopping and evaluation statements.
   Prove boundary hitting on finite exits, monotonicity,
   stopping sigma-algebra ordering, stochastic intervals `(σ,τ]` and `[0,τ]` predictable,
   optional graphs, and evaluation measurability on `{τ<∞}`. Consume native
   `stronglyMeasurable_stoppedValue_of_le`,
   `measurableSet_preimage_stoppedValue_inter` and `measurable_stoppedValue`
   through their progressive/path, Borel-space and stopping-time hypotheses.
   Consume S0.2's progressive-evaluation/stopping-sigma-field lemma for this dictionary:
   on `{τ≤s}`, use the jointly measurable restriction
   to `[0,s]×Ω` and `ω↦(τ(ω),ω)`, then the stopping-σ-field criterion.
   Decomposition over countably many values proves only the countably-valued case;
   retain the native totalization at infinity separately from finite-time evaluation.
   For a general progressive set, prove debut measurability using measurable projection only; this selects no graph point and does not depend on the S0.2 section/capacity engine.
   Reuse Mathlib's descriptive-set API in
   `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean`: `MeasureTheory.AnalyticSet`,
   `MeasurableSet.analyticSet_image`, `AnalyticSet.image_of_continuous`,
   `AnalyticSet.measurablySeparable`, and `AnalyticSet.measurableSet_of_compl`. In particular,
   the image of a Borel subset of a Polish product under its continuous coordinate projection is
   analytic. These declarations do not by themselves make every analytic projection measurable
   in a completed probability space: `measurableSet_of_compl` assumes the complement is analytic.
   Consume `TauCeti.MeasureTheory.AnalyticSet.nullMeasurableSet` from
   `TauCeti/MeasureTheory/MeasurableSpace/Analytic.lean`: on a metrizable space with
   `OpensMeasurableSpace`, every analytic set is null-measurable for every s-finite measure.
   Use it directly on Polish coding spaces. For a general complete usual probability basis,
   construct the fixed-horizon countable-coordinate coding of a product-measurable progressive
   set, identify its projection as the pullback of an analytic projection in that coding space,
   and transport the null-measurable representative through the pushforward probability and
   the original filtration's completeness. Preserve the distinction between an arbitrary
   sample space and its metrizable code. Prove this debut by measurable projection alone; it
   selects no graph point and does not depend on the section/capacity engine in S0.2. Then apply
   it to every progressive set on that basis.
   For right-continuous adapted paths route open-domain exit through
   progressive measurability and this debut theorem on a complete usual
   basis. Preserve the source pp186–187 proof correction: separate hits of
   every shrinking neighborhood need not give one common hit. The path
   X_t=t for t<1 and X_t=0 for t≥1 stays in (−1,1), while its near-complement
   hitting infima approach1. It refutes the quantifier swap, not the stopping
   property of that path's infinite exit time. The continuous-path direct
   theorem above remains valid on arbitrary filtrations.

### 0.5 predictable times

Use S0.2's pointwise announceable-time definition,
   elementary operations and predictable-ray generation. First prove the predictable section
   theorem from S0.2's filtration-aware E* paving, outer-projection capacity and compact-fiber
   section construction: for a predictable set E and ε>0,
   find a predictable time T whose finite graph lies in E and whose finite
   probability is at least P*(projection E)−ε. Prove that the section's projected
   intersection is F-measurable by compact time fibers, without completing the probability
   space. Then prove on a complete
   right-continuous probability basis that a stopping time with predictable graph (equivalently
   its predictable ray [τ,∞)) admits an a.s. announcing sequence, including zero and infinity.
   Apply the predictable-section theorem to its graph [[τ]] with errors 2⁻ᵏ, obtaining
   announceable D_k whose finite graphs lie in [[τ]] and
   `P(τ<∞,D_k=∞)≤2⁻ᵏ`; thus D_k=τ whenever D_k<∞. Put ρ_k=min_(j≤k)D_j.
   Then ρ_k is announceable, ρ_k≥τ, and ρ_k=τ eventually a.s. For each k choose an
   announcing sequence ρ_(k,m) and an index m_k such that
   `P(ρ_k<∞,ρ_{k,m_k}<ρ_k−2⁻ᵏ)≤2⁻ᵏ` and
   `P(ρ_k=∞,ρ_{k,m_k}<k)≤2⁻ᵏ`; these choices follow by pointwise convergence of each
   announcing sequence and continuity of probability. Define `S_n=inf_{k≥n}ρ_{k,m_k}`.
   Right-continuity makes this countable infimum a stopping time. The S_n increase.
   On one measurable probability-one event where ρ_k=τ eventually and the two
   Borel–Cantelli conclusions hold, S_n<τ on `{τ>0}` and S_n↑τ,
   including τ=0 and τ=∞. Keep the a.s. qualification before the pointwise upgrade. On the
   complete basis, modify on the single exceptional null set by
   `τ_n=(τ−1/n)^+∧n` to obtain everywhere stopping times with τ_n↑τ and τ_n<τ on
   `{τ>0}`; because the exceptional set N lies in F₀, every subset of N is in F₀, so the
   event `{τ_n≤t}` for the modified time is a union of an F₀ subset of N and an F_t subset
   of Nᶜ. This graph-to-announcement direction follows the section theorem and is not used by
   the S0.2 paving.
   An announcing sequence consists of F-stopping times τ_n,
   pointwise nondecreasing with `τ_n↑τ` and `τ_n<τ` on `{τ>0}`. These are pointwise
   requirements; an a.s. announcing sequence is named separately, with conversion to
   a pointwise version only after proving the needed completeness/null-set modification.
   Prove the remaining ray/graph criteria and closure consequences using the base sequence
   operations already constructed in S0.2. For a
   predictable real process H and predictable T, prove H_T is F_(T−)-measurable
   on {T<∞}, using the predictable-rectangle generators and monotone-class
   closure, with F_(T−) generated by F_0 and A∩{t<T}, A∈F_t. S0.2's section engine
   already consumes its earlier ray-generation and positive-delay operations. The present
   predictable-rectangle and F_(T−) consequences consume those same earlier operations
   after the section theorem; these F_(T−) consequences are not premises of the engine.
   Formalize the two-outcome
   stopping time τ=1 on A and τ=2 on Aᶜ on a probability space with 0<P(A)<1,
   F_t trivial completed by null sets for t<1 and F_t the completed σ(A) for t≥1.
   Prove its nonpredictability from the F_(1−)-measurability of the time-1 section of
   every predictable set and A∉F_(1−) modulo null sets. For `A∈F₀`, include the event-valued time which is
   0 on A and ∞ off A, announced by its minimum with n. Prove the precise
   predictable intervals: `(η,τ]` for stopping η,τ; `[η,τ]` for predictable η
   and stopping τ; `(η,τ)` for stopping η and predictable τ; and `[η,τ)`
   for predictable η,τ. For an announcing sequence, use the intersection
   `⋂_n(τ_n,∞)` together with `{0}×{τ=0}` to obtain `[τ,∞)`.

### 0.6 homogeneous Poisson Unit-mark adapter

Fix `α>0` for the arrival/gap conclusions. Include the rate-zero boundary case as the deterministic zero counting measure, with no finite arrivals.

### 0.6.0 process-to-point-measure construction

Start from a real-valued counting process `N_t` with
`N_0=0`, independent stationary increments, and `N_t−N_s ∼ Poisson(α(t−s))` for `0≤s<t`.
Construct a càdlàg integer-valued version on rational times, extend it to all times, and prove
that on every bounded interval it has a càdlàg counting-measure realization, all jumps have
size one, and there is no atom at time zero. For disjoint half-open intervals, identify the
associated point-measure counts with the corresponding process increments and check the
interval-count hypotheses of PointProcesses Layer 4's homogeneous Poisson characterization.
Consume that characterization for the Poisson point-measure law of intensity
`μ=ENNReal.ofReal α • nnvolume`; the π–λ extension and equivalence with stationary independent
increments are supplier-owned. The process-specific path-regularity/simple-jump argument uses
stochastic continuity and the bound
`m P(Poisson(αT/m)≥2)→0` for a mesh of size `T/m`; no path regularity or simple jumps are
assumed from the finite-dimensional increment law alone. Export the count process obtained
from the point measure with `N_0=0` and the same independent stationary Poisson increments.
The output is a measurable, everywhere-defined `ξ_src : Ω → PointMeasure ℝ≥0`:
on one common measurable null exceptional set replace the constructed path measure by zero,
so `ξ_src({0})=0` for every ω. Prove a.s. simplicity and
`IsPoissonPointProcess P ξ_src (ENNReal.ofReal α • nnvolume)`; for each fixed t the count
`ξ_src((0,t])` equals the original `N_t` almost surely. The common path identity is with
the chosen càdlàg version; do not assert indistinguishability of arbitrary raw finite-dimensional
versions. Consume Layer 0's evaluation-sigma-field measurability and Layer 4's
homogeneous count-process equivalence (the Build item immediately preceding Key declarations).
Its inputs are a simple nonexplosive process and a positive rate. Supply simplicity and
nonexplosion from the preceding regularization, and stationary independent increments
from the original law. The interval-to-count-process specialization is owned here:
finite families of disjoint bounded intervals give the finite increment vectors, while
cumulative counts recover those increments by subtraction. The zero-rate case is proved
separately: all rational-horizon counts vanish almost surely, hence the chosen point measure
is zero. No positive-rate equivalence is applied at rate zero.

### 0.6.1 marked carrier and event-time dictionary

Consume PointProcesses' generic unmarked
Poisson point-measure law, `TemporalPointMeasure E`, `IsAdaptedPoisson`, `IsCompensator`, and
predictable-integral identities. For `α>0`, start with a measurable
`ξ_src : Ω → PointMeasure ℝ≥0` satisfying `IsPoissonPointProcess P ξ_src μ`.
This can be S0.6.0's chosen realization, whose origin mass is already zero everywhere,
or any supplied realization of that law. For the chosen realization the zero-origin repair
event is all of Ω; a supplied realization can have exceptional nonzero atoms at zero.
Consume PointProcesses Layer 4's zero-atom result for this diffuse homogeneous
Poisson measure, and use that full-measure event to define a measurable map
`N : Ω → TemporalPointMeasure Unit` by pushing `ξ_src` through `t ↦ (t,())` on that event and
using the zero measure on its null complement. Show the exceptional event is measurable from
the restriction to `{0}` and, for an external filtration, assume that restriction is
`F₀`-measurable. Independence survives replacing the pushforward by zero because the repair event has
probability one: for every future restriction event, its intersection with the repair event
agrees with the original event up to a null set. Its `F₀`-measurability is used separately to
prove adaptation of the repaired map. The repaired map is pointwise in the provider carrier and
a.s. equal to the unrepaired pushforward. On that equality event prove equality of counts on
`(0,t]` for all t; consume Layer 4's a.s. time-simplicity result for the diffuse intensity.

Define the ground-measure adapter from a temporal marked measure to an unmarked
point measure by first-coordinate pushforward, and the ground temporal adapter to
`TemporalPointMeasure Unit` by pushforward under `(t,e) ↦ (t,())`. These adapters
are owned here. Local finiteness on compact time sets, integer-valuedness and zero mass
at the origin follow from the input temporal carrier. Prove their measurability using
count evaluations, their restriction identities, and preservation of adaptedness.

Fix zero-based positive-occurrence indexing by the count-level formula
`τ_k = inf {t : N((0,t] × E) ≥ k+1}`, with infimum ∞ for an empty set.
Prove the adapter identities `eventTime N k = τ_k` and `nthPoint ξ_ground k = τ_k`
for its ground measure ξ_ground, using zero-based occurrence indexing. These count-level
comparison identities are targets here; the supplier's kth-occurrence descriptions do
not assert an origin sentinel or justify shifting the index by one. Define the waiting times as `T_0=τ_0` and
`T_(k+1)=τ_(k+1)−τ_k` on the common finite-arrival event. For positive homogeneous
rate, consume Layer 4's equivalence with i.i.d. interarrival times, explicitly including
the first wait; its displayed theorem about differences of successive occurrences alone
does not assert independence of the first wait from the remaining gaps.
The process-specific adapter identifies these waits by the count-level formula and
transfers their laws through the almost-sure pushforward equality. For supplied realizations,
the ground measure equals the original unmarked measure only on the repair event.
Prove that the completed count history agrees with the completed restriction history by
interval-count generation. The sum through T_k has Erlang shape k+1.

**API.**

- Mark erasure preserves every count on a bounded time interval and commutes with restriction.
- The repaired Unit-mark map is measurable, is temporal everywhere, and agrees almost surely
  with the original pushforward; the equality holds simultaneously for all interval counts.
- Count-level event times are nondecreasing; the kth count threshold is k+1, and the initial
  wait is the first positive event time. Positive rate gives almost-sure finiteness.

**Checks.**

- The measure δ₁+δ₃ has event times 1,3 and waits 1,2; no event occurs at 0.
- At rate zero the measure is zero, every event time is ∞ and no real exponential-gap
  claim is made; applying `toReal` to ∞ would incorrectly produce a zero waiting time.
- If F₀ reveals whether the first wait exceeds 1 at rate 1, the future event has probability
  e⁻¹ and its intersection with itself has probability e⁻¹, not e⁻²; the external-independence
  hypothesis fails even though the marginal point-process law is Poisson.

### 0.6.2 external filtration and usual augmentation

For the natural source history use
`F_t^src=σ(ξ_src|_[0,s] : s≤t)`, including the restriction to `{0}` at time zero.
Thus the zero-atom repair event is `F_0^src`-measurable also for a supplied realization
whose zero-origin property holds only almost surely. Distinguish this history from the raw positive-time
count history generated by `(0,s]`, whose time-zero sigma-field can be trivial.
For an external filtration `F`, assume
that source restrictions to `(0,t]` are `F_t`-measurable and restrictions to `(t,∞)` are
independent of `F_t` for each t. Also require the zero-time restriction to be `F₀`-measurable.
Under these hypotheses prove the marked process satisfies PointProcesses `IsAdaptedPoisson`
with intensity `μ.prod (Measure.dirac ())`, where `μ=ENNReal.ofReal α • nnvolume`. Define the right-continuous hull `F_{t+}=⋂_{u>t}F_u`. For future-source independence
from `F_{t+}`, first use a finite-window cylinder whose earliest time is `a>t`, choose
`t<u<a`, and apply independence from `F_u`; extend from these cylinders by π–λ. Then prove
null augmentation and right-continuous augmentation preserve adaptation and independent future
increments. When transporting to `P.completion`, state the same-space/raw-filtration map and
prove the conditional-expectation and a.e. identities; do not identify completion of the measure
with augmentation of the filtration on the original space. For the
natural source history `F^src`, prove its ambient-null-augmented version is right-continuous using the same future
independence and the identity `F_∞=F_t∨G_t`, where `G_t=σ(ξ_src|_(t,∞))`; the raw filtration
need not be complete. Include the conditional-expectation factorization argument: for
`A∈F_{t+}`, `H∈F_t`, and `G∈G_t`, the event `A∩H` is in `F_{t+}` and is independent of
G. Since `F_∞=F_t∨G_t` and `F_t` is independent of `G_t`, testing on generating rectangles
shows `E[1_A|F_∞]=E[1_A|F_t]`. As `A∈F_∞`, the left side is `1_A`, so A agrees modulo null
sets with an `F_t` event. This proves the ambient-null-augmented hull identity. On an incomplete ambient space, transport to `P.completion` separately before calling it the completed filtration.

### 0.6.3 compensator specialization

Consume PointProcesses Layer 10's
`MarkedLocallyFiniteMeasure ℝ≥0 Unit` carrier and `IsCompensator` definition, and Layer 11's
`IsAdaptedPoisson.isCompensator`. Its input is a measurable temporal-point-measure-valued
process whose underlying measure is `IsAdaptedPoisson`, together with intensity finiteness on
`K × Unit` for every compact time set `K`. Its output uses the constant subtype-valued
marked measure `Aω=⟨μ.prod (Measure.dirac ()), h_local⟩`. Supply precisely these typed inputs
from S0.6.1–2; the raw measure-valued Poisson law alone is insufficient. Prove exactly the
supplier theorem's two inputs: measurability of the temporal-point-measure-valued map with its
underlying measure `IsAdaptedPoisson`, and
`h_local : ∀ K, IsCompact K → (μ.prod (Measure.dirac ())) (K ×ˢ (Set.univ : Set Unit)) < ∞`.
For `μ=ENNReal.ofReal α • nnvolume`, establish `h_local` by the finite-horizon measure
calculation. Apply Layer 11's `IsAdaptedPoisson.isCompensator`; its conclusion supplies the
constant subtype-valued compensator, its measurability and predictability, and the expectation
identity for every nonnegative predictable integrand. As a consumer corollary calculate
`Aω((0,t]×B)=αt·1_B(())` for S2.1. Use `NullSingletonClass μ` only in the supplier-owned diffuse-time simplicity result and where
the S3.1 isometry actually requires it. SC owns only the homogeneous
Unit-mark adapter and proofs of the stated typed inputs.
PointProcesses owns the `IsCompensator` predicate, almost-sure uniqueness and pathwise
predictable integration. Its separate hazard and sigma-finite band contracts are supplier-owned
context: the hazard conclusion uses an ambient-null-augmented internal history, and sigma-finite
master measures use the measure-valued predictable-Poisson identity before finite-ground carrier
lifting. These are not additional hypotheses of this homogeneous Unit-mark specialization.
It does not claim general-filtration compensator existence, and no compensator existence
theorem for general marks, Doob–Meyer based or finite-horizon-integrable, is consumed from
PointProcesses: its consumed contracts are the carriers, `IsCompensator`, uniqueness, the
finite-horizon-integrable compensated-integral martingale theorem and the forward
adapted-Poisson compensator. S2.5 owns usual-basis Doob–Meyer existence and the
cumulative-process/random-measure dictionary for Unit marks. The forward adapted-Poisson
result is owned by PointProcesses Layer 11 and consumed above. Its reverse Watanabe characterization has `IsCompensator` as
a premise and is a separate converse. Use this specialization in the first-jump
example and S3.5 through the common a.s. pushforward-equality event.

S0.6 application (after the adapter above): prove nonpredictability of
the first jump of a rate-α Poisson process, α>0, in every filtration F for which
   its Unit-mark temporal point measure has compensator
   `(ENNReal.ofReal α • nnvolume).prod (dirac ())`, using PointProcesses'
   predictable-integral identity. For the constructed homogeneous example first
   apply S0.6's Unit-mark adapter and PointProcesses Layer 11's `IsAdaptedPoisson.isCompensator` in the ambient-null-augmented natural source history `F^src` just defined,
or in an external filtration satisfying S0.6.2's stated restrictions. A waiting-time law alone does not give this
   arbitrary-filtration compensator hypothesis.

### Examples

The temporal measure δ₁+δ₃ has counts 0,1,2 at times 0,1,3, event times 1,3 and waits 1,2. For g(t)=t on [0,2], its Stieltjes mass is 2 and its atom at 0 is 0.

### Dependencies

*Needs:* Native measure, process, stopping and predictable APIs; Tau Ceti analytic-set null measurability; PointProcesses Layers 0, 4, 10 and 11 for the precise contracts above. The section engine precedes debut and uses its own compact-fiber capacity construction, not Doob–Meyer.

## Layer 1: Gaussian processes and constructed Brownian motion

### 1.1 construction

Extend the projective Gaussian family on nonnegative rational times
   with the existing countable theorem, prove moment bounds, and extend it by Kolmogorov–Chentsov
   to real time. Build the metric-parameter, complete-metric-value version of Chentsov, assuming the pair map `ω↦(X_sω,X_tω)` is Borel measurable for each s,t, with bounded
   covering-number hypotheses: on each bounded parameter region `N(ε)≤Cε^(−d)`
   and increment p-moment `E dist(X_s,X_t)^p≤C dist(s,t)^q`, with `p>0` and `q>d≥0`,
   obtain every Hölder exponent γ<(q−d)/p. For noncompact parameters use an increasing open exhaustion by totally bounded regions with the stated local bounds; expose the one-dimensional local corollary. Consume the [Krätschmer–Urusov, arXiv:2107.13837v2, Theorem 1.1](https://arxiv.org/abs/2107.13837v2) argument, with the native `IsKolmogorovProcess` edistance/lintegral-to-moment adapter owned here. Prove uniqueness
   of continuous modification, Hölder exponents `<1/2` on compact horizons and an all-paths
   continuous measurable representative. For any indexed family of standard-Borel state spaces and consistent probability
   laws on its finite products, construct the unique law on the product sigma algebra;
   prove this arbitrary-index extension using Polish realizations and compact-system
   tightness, with countable specialization and law uniqueness.

### 1.2 Wiener space

Prove `exists_wienerMeasure`: a probability measure on
   `C(ℝ≥0, ℝ)` whose coordinate process satisfies `IsBrownianReal` (Lalley, Theorem 1).
   The full uncountable function space with its product sigma algebra is not a substitute
   for this continuous-path carrier: every product-measurable set depends on countably many
   coordinates, so no nonempty such set can consist entirely of continuous paths.

   **Checks.**

   - The zero-path Dirac law has variance 0 at time 1, whereas Wiener variance is 1.
   - Under Wiener law, the coordinate at time 0 is zero a.s. and the covariance at times
     1 and 3 is min(1,3)=1; a family of independent marginal Gaussians would give 0.
   - The difference between times 1 and 3 has variance 2; multiplying paths by 2 gives
     variance 8 and fails the standard Brownian normalization.

    For a process with a continuous modification and start zero almost
   surely, construct the measurable map into based continuous path space and define its path
   law by pushforward; this law is not necessarily Wiener measure. Call it Wiener measure only
   after proving the Brownian finite-dimensional laws (equivalently, the required centered
   Gaussian increments and independence); for a Brownian motion relative to a filtration this
   follows from its defining increment conditions. Do not require the path map to embed or
   identify the original sample space. Define probability laws on
   `C₀([0,T],V)` and `C₀([0,∞),V)` with compact-open topology; prove Borel generation by
   evaluations and, on based paths, by increments. On full `C([0,∞),V)`, increments alone
   omit the initial evaluation, so adjoin `ev₀` if that carrier is used. Prove restriction
   consistency and law uniqueness. Construct centered vector Brownian motion for every
   finite-dimensional real inner-product space V; prove independent orthonormal components,
   linear-isometry transport, covariance and noncentered/random initial variants when the initial
   variable is independent of future increments. On the unbased path spaces prove the
   measurable probability kernel x↦W_x obtained by translating the centered law, adjoin
   ev₀ to the increment generators, and for every Borel probability initial law r construct
   `W_r=∫W_x r(dx)`. Prove its initial law r and independence of initial position from
   centered future increments, on finite horizons and the full half-line with restriction
   consistency. For ε≥0 prove measurability and continuity of the path map
   `D_ε(ω)(t)=ω(0)+√ε(ω(t)−ω(0))` and identify `(D_ε)_*W_r` by its
   initial law r and independent centered Gaussian increments of covariance
   `ε(t−s)Id`. For ε=0 this pushforward is the law of constant paths with
   initial law r. Prove restriction compatibility and, for c>0, invariance of
   centered Wiener law under `ω(t)↦c^(−1/2)ω(ct)`, using its finite-dimensional
   laws and evaluation-generated Borel sigma algebra. These are the path-law
   scaling interfaces consumed by OT. OptimalTransport §13C owns the named
   scaled reference `R_r^ε`,
   that path law, its transition density, Markov and reciprocal-process properties, and heat
   generator. This roadmap supplies the centered and initial-law Wiener laws and the Brownian
   generator interface consumed by §13C; the dependency points from OT to S1/S10 only. At
   ε=0 OT owns the constant-path reference separately.
   In the inverse-Gaussian sequence construction,
   define the inverse CDF on its open image only and choose arbitrary values at its null
   endpoints. Handle L² random variables through measurable representatives or completed
   sigma-algebras: on the full-measure coordinate set the inverse maps recover each coordinate,
   which yields product-sigma equality modulo null sets, not pointwise equality for arbitrary
   L² equivalence classes. Prove the Gaussian linear span is closed under its L² limits using
   characteristic functions; establish the separable-Hilbert isometry from a countable dense
   span/orthonormal basis, and derive independence of disjoint increments from joint Gaussianity
   and orthogonality.

### 1.3 filtered laws

Define `IsFilteredBrownian F P B` as the conjunction of `IsBrownianReal B P`,
strong adaptation to F, and independence of every future increment from the earlier
sigma algebra. No usual conditions are part of this definition.

**API.**

- Deterministic restriction and shifted increments preserve the Brownian covariance rule.
- Enlargement by initial information independent of the whole path preserves the predicate.
- An indistinguishable replacement preserves the predicate if it remains strongly adapted.

**Checks.**

- For B standard and s=1,t=3, the increment variance is 2 and the covariance with B₁ is 0.
- For 2B the same variance is 8, so standard Brownian normalization fails.
- If F₀ reveals the sign of B₁, the event B₁>0 has probability 1/2 and intersects itself
  with probability 1/2 rather than 1/4; the required independence fails.

Define filtration-relative Brownian predicates strengthening
   `IsBrownianReal`, prove natural-filtration and usual-augmentation adapters, independence
   from the entire past sigma algebra/process, finite increment joint densities and
   Gaussian covariance characterizations. Build Gaussian moment polynomial identities,
   MGF/characteristic-function conditional independence and a Hilbert isonormal Gaussian
   map from deterministic L² integrands. S3.3 proves its identification with the constructed
   stochastic integral after the predictable completion is available.

### 1.4 transformations

Spatial translation, orthogonal invariance, sign, deterministic
   time shift/scaling, independent products and Brownian bridges. Prove continuous time
   inversion `tB_{1/t}` at 0 by applying S1.1 Chentsov to its pre-Brownian law,
   comparing its continuous modification with the original inverse at rational positive
   times and then all positive times. Consume Mathlib’s finite-law inversion proof.
   This gives `B_t/t→0` at infinity without later maximal or reflection theory. Specify the bridge law/covariance and conditional endpoint kernel, including
   degenerate horizons and endpoint events interpreted through disintegration rather than
   conditioning on a zero-probability event by a ratio.
   For every finite `T≥0` and continuous real K on `[0,T]`, develop the Volterra
   transformation on continuous real paths based at zero,
   `T_K x(t)=x(t)+∫₀ᵗK(s)x(s)ds`. Prove it is a continuous linear map for the
   uniform norm, with operator norm at most `1+T‖K‖∞`, is causal, and commutes
   with restriction to shorter horizons. Construct its continuous linear inverse
   `T_K⁻¹ y(t)=y(t)−∫₀ᵗK(s)exp(−∫_s^tK(u)du)y(s)ds`, prove both inverse identities
   and the bound `‖T_K⁻¹‖≤1+T‖K‖∞exp(T‖K‖∞)`, including the zero horizon.
   For standard Brownian B, prove `Y=T_K B` has centered Gaussian finite-dimensional
   laws by joint Riemann-sum/L² limits of Gaussian linear combinations. Compute
   its covariance, for t,s in the horizon, as
   `min(t,s)+∫₀ᵗK(u)min(u,s)du+∫₀ˢK(v)min(t,v)dv
   +∫₀ᵗ∫₀ˢK(u)K(v)min(u,v)dvdu`.
   Prove the required measurability and exchange of expectation and deterministic
   integration from the bounded horizon and Gaussian second moments. This uses
   S1.2–S1.3 Gaussian/path APIs; stochastic integration is not a prerequisite.

### 1.5 random-walk approximation

Make precise the source's assertion that Wiener measure is
   a limit of random-walk laws. For i.i.d. real increments Y_k with E[Y₁]=0 and
   E[Y₁²]=σ²<∞ with σ≥0, define the polygonal partial-sum path on [0,1] by linear interpolation of
   `n⁻¹/² Σ_{k≤⌊nt⌋}Y_k`, including the fractional last increment. Prove weak convergence of its
   law on `C([0,1])` with the uniform topology to that of σB (including the degenerate σ=0 case).
   Use the native scalar finite-variance CLT
   `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub` from
   `Mathlib/Probability/CentralLimitTheorem.lean` for finite-dimensional convergence, plus
   `ProbabilityTheory.tendstoInDistribution_iff_tendstoInDistribution_inner` for the
   finite-dimensional real inner-product-valued Cramér–Wold step (with its Borel and
   a.e.-measurability hypotheses), instantiated in `EuclideanSpace ℝ ι` rather than the raw
   function space `ι→ℝ` when the latter lacks a finite-dimensional instance. For selected
   times, split the increments into disjoint blocks.
   A block of length m_n has the law of the first m_n terms of the same i.i.d. sequence; apply
   the scalar CLT along m_n→∞, multiply by √(m_n/n)→√(t−s), and combine independent blocks:
   independent block vectors whose marginals converge in law converge jointly to the product law,
   by characteristic-function factorization (or Cramér–Wold together with independence).
   The fractional endpoint term Y_(⌊nt⌋+1)/√n tends to zero in probability by finite second
   moment. State the finite-dimensional Slutsky/continuous-mapping steps; the zero-variance case
   is deterministic.

   Prove tightness first for bounded centered increments by the uniform fourth-moment increment
   bound E|Xⁿ_t−Xⁿ_s|⁴≤C|t−s|², including intervals shorter than 1/n. Apply the
   quantitative Kolmogorov–Chentsov chaining estimate: this gives uniform probability control
   of a Hölder modulus for every exponent below 1/4, hence tightness by Arzelà–Ascoli. For general finite-variance increments, truncate at level R and
   recenter. Prove the independent-centered-partial-sum maximal inequality
   `P(max_(k≤n)|Σ_(j<k)Z_j|≥λ)≤Σ_(j<n)E[Z_j²]/λ²` for λ>0 by the first discrete
   crossing and independence of its later increments. This bounds the discarded centered
   polygonal path in sup norm in probability uniformly in n by its discarded variance; hence for
   every δ>0, `sup_n P(‖Xⁿ−Xⁿ,R‖∞>δ)→0` as R→∞. The truncated variance tends to σ².
   For the modulus of continuity use
   `ω(Xⁿ,η)≤ω(Xⁿ,R,η)+2‖Xⁿ−Xⁿ,R‖∞`; state the two-limit quantifiers to transfer tightness
   from the fixed-R sequences to the full sequence. This discrete argument uses no
   continuous-time optional sampling or maximal theorem from S2. Combine full-sequence
   finite-dimensional convergence with tightness and uniqueness of the continuous Gaussian law
   by Prokhorov. Consume Mathlib's existing Lévy–Prokhorov metric and tightness/Prokhorov APIs;
   path-space tightness and interpolation are the missing connecting results, not a new CLT,
   Prokhorov metric or double-limit approximation theorem.

### Examples

Brownian covariance at times 1 and 3 is 1; the increment variance is 2. At scale ε=0, every increment is 0 while the initial law is retained.

### Dependencies

*Needs:* Layer 0 process/path adapters; Mathlib Gaussian projective families and scalar CLT; Tau Ceti countable projective existence. Chentsov and interpolation supply the path regularity, independently of Layers 2–5.

## Layer 2: Continuous-time martingales and localization

### 2.1 process operations

Consume native martingale definitions and conditional expectation.
   Use `MeasureTheory.condLExp` from
   `Mathlib.MeasureTheory.Function.ConditionalLExpectation` for nonnegative
   `ℝ≥0∞`-valued conditional expectation. State `G≤mΩ` and the sigma-finiteness of
   `P.trim` (automatic on this probability basis); the definition's fallback value
   outside those hypotheses is not a conditional-expectation theorem. Consume
   `measurable_condLExp`, `setLIntegral_condLExp` and `ae_eq_condLExp`; derive the
   nonnegative tower law directly from the integral characterization on every
   measurable test set. Prove G-measurable pull-out first for indicators and
   simple functions, then extend it by monotone approximation. Prove agreement with
   native real L¹ conditional expectation where both apply. Do not introduce a
   competing nonnegative construction. For real X and convex φ, prove conditional Jensen when
   `X∈L¹` and `φ(X)∈L¹`; state the nonnegative extended-integral variant separately with
   measurability and integrability hypotheses. For an independent sequence of integrable real variables `(Y_k)`, set
   `F_n=σ(Y_k:k<n)` and `S_n=Σ_(k<n)(Y_k−E[Y_k])`. Prove integrability and the
   martingale identity `E[S_(n+1)|F_n]=S_n`; when the Y_k have mean zero the same conclusion
   holds for the uncentered partial sums. Use independence from the full past sigma-algebra
   and the conditional expectation/tower API. These are source examples, not
   separate conditional-expectation suppliers.

   Construct the signed sigma-integrable extension needed by S6.1. For an ambient
   measurable real X, a sub-sigma-algebra G and increasing G-measurable sets A_n
   covering Ω up to a null set with `1_{A_n}X∈L¹(P)`, construct a G-measurable
   finite real Y satisfying
   `1_{A_n}Y = E[1_{A_n}X|G]` a.s. for every n. Prove compatibility on overlaps
   by ordinary L¹ indicator pull-out, select representatives outside the countable
   union of exceptional sets, and glue on the disjoint differences of A_n. Prove
   uniqueness up to a.e. equality, independence of the cover, localization to
   G-events and agreement with ordinary conditional expectation for X∈L¹. Supply
   linearity on common exhausting covers, the tower law when X is sigma-integrable
   relative to the smaller sigma-algebra, and G-measurable multiplication on the
   domain where the products are sigma-integrable (use common localizing sets
   controlling both the original cover and the multiplier). This is a signed
   extension on its explicit domain, not an ordinary Bochner integral of a
   nonintegrable X. Also export the equivalent integral identity on every
   G-measurable subset of each A_n.
   Prove limits under L¹/Lp convergence, martingale transforms for bounded predictable step
   processes, convex/Jensen submartingales, Brownian `B`, `B²−t`, exponential martingales
   and the compensated Poisson square examples. State explicitly that for a rate-α Poisson
   process, both `N_t−αt` and `(N_t−αt)²−αt` are right-continuous Lᵖ martingales for every
   finite p≥1 on finite horizons, in each external or augmented filtration satisfying S0.6.2. The point-measure count paths are càdlàg for every ω; the martingale identities are a.s. statements. For standard Brownian motion with `B₀∈Lᵖ`, `B` is a
   continuous Lᵖ martingale, and `B²−t` is continuous L^(p/2) when p≥2. An arbitrary
   finite-moment Brownian initial value is treated separately from its centered increments. For a process with its natural
   filtration, also prove the source's finite-history martingale criterion: the martingale
   conditional-expectation identity is equivalent to
   `E[X_{t_{n+1}} | σ(X_{t₁},…,X_{t_n})]=X_{t_n}` for every finite strictly increasing history
   `t₁<⋯<t_n<t_{n+1}`. Prove the extension from finite-coordinate events to the generated natural
   σ-algebra by a monotone-class argument; retain integrability and the all-times quantifiers.

### 2.2 Doob theory

For an integrable nonnegative discrete submartingale X and λ>0,
   prove the source p.218 event refinement
   `λP(max_(k≤n)X_k≥λ)≤E[X_n 1_{ {max_(k≤n)X_k≥λ} }]`.
   Use bounded first-crossing sampling on the finite grid, then prove its real-time
   càdlàg version by dense-grid and level approximation. The terminal event indicator
   remains in this nonnegative-submartingale theorem, not only in the martingale case.
   For a real càdlàg submartingale X prove
   `λP(sup_(s≤t)X_s≥λ)≤E[X_t⁺]` for λ>0. For every right-continuous Lᵖ martingale M,
   1≤p<∞, also prove the event form on each finite horizon:
   `λ^p P(sup_(0≤s≤t)|M_s|≥λ) ≤ E[|M_t|^p 1_{ {sup_(0≤s≤t)|M_s|≥λ} }]` for λ≥0.
   This is stronger than dropping the indicator to obtain the weak bound; prove it by first-threshold
   discrete-grid optional sampling from the native discrete martingale theory, followed by a dense-time/level approximation under the stated right-continuity
   hypotheses. For nonnegative càdlàg
   submartingales and p>1 prove `‖sup_(s≤t)X_s‖_p≤p/(p−1)‖X_t‖_p`.
   Apply this to |M| for martingales and X⁺ for general submartingales;
   it is not an absolute-value maximal bound for arbitrary signed submartingales.
   Use dense-time reduction and approximation and build measurable running suprema. Upcrossings, a.s. convergence with uniform L¹ bounds,
   UI⇔terminal conditional representation for martingales, Lp convergence p>1 and regularization
   on usual bases. Prove the Scheffé converse for real variables: if every ξ_n and ξ is integrable, `ξ_n→ξ` almost surely and `E|ξ_n|→E|ξ|`, then `ξ_n→ξ` in L¹ and the family is uniformly integrable. The integrability of every term includes the finitely many initial terms, not only the eventual tail. For submartingale càdlàg regularization require a usual basis and
   right continuity of t↦E[X_t]; state the corresponding integrability conditions
   on each finite horizon and the UI conditions used for terminal-limit assertions.
   Define class D (UI of values at all bounded stopping times in the declared time domain)
   and class DL (UI for times bounded by each fixed finite horizon), and prove the
   corresponding stopped-family uniform-integrability statements. A submartingale is not generally
   a terminal conditional martingale; use its proper inequality/decomposition statement.
   On `[0,1]` with completed Lebesgue measure, let F_n be generated by the dyadic partition into
   intervals of length `2⁻ⁿ`. Prove `σ(⋃ₙF_n)` is the Borel σ-algebra modulo null sets and, for
   every ξ∈L¹, `E[ξ|F_n]→ξ` almost surely and in L¹. Also prove the source's non-UI example
   `ξ_n=2ⁿ1_[0,2⁻ⁿ)`: it is an (F_n)-martingale, converges to zero almost surely, has expectation
   one for every n, is not uniformly integrable, and cannot be `E[ξ|F_n]` for one terminal
   ξ∈L¹. The last conclusion follows from L¹ convergence of conditional expectations once the
   generating-field statement is established.
   Include a concrete complete dyadic filtration which is not right-continuous. On completed
   Lebesgue `[0,1]`, let D_n be generated by the dyadic intervals of level n together with
   every ambient probability-null set, and set `F_t=D_{⌈t⌉}` for t≥0, with D_0 trivial modulo
   null sets. Then F is increasing and complete,
   but `F_0` is strictly smaller than `F_{0+}=⋂_{s>0}F_s=D_1`: the first-half interval
   `[0,1/2)` lies in D_1 and not in the completed trivial D_0. This is an explicit witness to
   failure of right continuity, not merely a label on the discrete dyadic filtration. If a
   source display instead uses closed adjacent cells, record that literal convention separately:
   endpoint overlaps prevent a literal partition, and the equivalence to half-open cells is only
   modulo the finite-grid null set under completed Lebesgue measure.
   Recover Kolmogorov's tail zero–one law using native
   `ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop`,
   identifying its lattice limsup of the coordinate σ-fields with the tail σ-field.
   Also give the source's conditional-expectation proof: a tail event A is independent
   of each finite-prefix field F_n, so `E[1_A|F_n]=P(A)` a.s.; uniform integrability
   and the generated-field limit identify this constant with `1_A`, yielding
   `P(A)∈{0,1}`. This is an adapter and proof dictionary, not another zero–one API.

### 2.3 optional sampling

Dyadic ceiling of real stopping times, convergence of stopped
   values, bounded-time sampling, UI terminal sampling including infinity with explicit limit,
   stopped martingales in original/time-changed stopping filtrations, and Lp estimates.
   Formalize the doubling strategy counterexample and this discrete alternative to UI:
   for a martingale ξ_n indexed from 1 and a stopping index τ, assume τ<∞ a.s.,
   ξ_τ∈L¹ and `E[ξ_n1_{τ>n}]→0`. Prove `E[ξ_τ]=E[ξ_1]` from bounded stopping
   and `ξ_τ=ξ_(τ∧n)+(ξ_τ−ξ_n)1_{τ>n}`. The tail hypothesis is a signed expectation
   limit; a stronger absolute-tail limit is sufficient but is not the literal hypothesis.
   For independent fair signs η_k, k≥1, set τ=inf{k≥1:η_k=1} and
   `W_n=Σ_(1≤k≤n)2^(k−1)1_{τ≥k}η_k`, W₀=0. Prove predictability of the
   stakes, τ<∞ a.s., `W_n=1−2^n1_{τ>n}`, `E W_n=0`, and W_τ=1 a.s.
   Compute `E[W_n1_{τ>n}]=−1+2^(−n)→−1`, so the signed tail condition fails.
   The ungated martingale `X_n=Σ_(1≤k≤n)2^(k−1)η_k` agrees with W_n on
   {τ>n} and at τ, and has the same tail failure, but differs after the first win.
   Give no unbounded sampling conclusion without integrability/UI or a verified alternative.
   As the bounded gambler’s-ruin application, for a nearest-neighbor walk whose +1 and −1 step probabilities are p and q, with 0<p,q<1,
   p+q=1, p≠q, and exit barriers −s and r for positive integers r,s, prove the upper-exit
   probability `P(ξ_τ=r)=((q/p)^s−1)/((q/p)^(r+s)−1)`; for p=q=1/2
   prove `s/(r+s)` directly by sampling the bounded position martingale. The p=1,q=0
   endpoint is recorded separately as the p.1 source exception.

### 2.4 local theory

Use `IsLocalMartingale F P M` as the scalar specialization of native
`Locally (fun Y => Martingale Y F P) F M P`, including its initial-time indicator.

Define local/local-L² martingales through native `Locally`.
   Prove adaptation after usual completion and the centered initial-value dictionaries.
   Native `Locally` alone does not assert literal adaptation of the original process:
   its indicator can hide arbitrary values on null sets. On usual bases prove
   minima/diagonal/flattening and stopping stability for the property combining the
   martingale identities with continuous or càdlàg path regularity. Apply native `IsStable`
   to that regular property; bare `Martingale` is not stable under arbitrary stopping.
   For example, if U is uniform on [0,1] and F_t=σ(U), then X_t=1_(t=U) is a martingale,
   while stopping at U gives 1_(U≤t), which is not a martingale.

   Own the following raw-filtration bounded-localization and descent targets separately;
   [RawLocalization.lean](RawLocalization.lean) suggests their native Lean interfaces.
   Throughout, path continuity means continuity outside one common null set, and not
   existence of a continuous modification at each fixed time.

   - **Countable-range optional sampling.** For a raw filtration and a real martingale Y,
     every countable-range stopping time ρ gives a literally adapted martingale
     `1_{0<ρ}Y^ρ`. Consume native `Martingale.stoppedValue_ae_eq_condExp_of_le_const_of_countable_range`
     and `Martingale.stoppedValue_ae_eq_condExp_of_le_of_countable_range`
     from `Probability/Martingale/OptionalSampling`. At a deterministic horizon t,
     apply them to ρ∧t; the countable partition also gives literal adaptation.
     For s≤t split into {ρ≤s} and {ρ>s}
     to obtain its martingale identity, then multiply by the F₀-measurable indicator
     1_(0<ρ). No right continuity or path
     regularity is required for this countable-range theorem.
   - **Countable-range level localizers.** For every raw-F strongly adapted real X
     with common-null-set continuous paths, construct pointwise monotone countable-range
     F-stopping times η_n tending to ∞ a.s. Define S_C as the first hit of
     `|X_t−X₀|≥C`; this pathwise comparison time need not itself be an F-stopping
     time. Require `S_((n+1)/2)≤η_n≤S_(n+1)` a.s. and
     `∀ᵐω, ∀n t, |X_(t∧η_n)(ω)−X₀(ω)|≤n+1`.
     This construction uses adaptation and continuity, independently of any local-martingale
     hypothesis. Build the dyadic hits and attained minimum described below, and use finite
     maxima to make the sequence monotone. Export it for all three following adapters.
   - **Progressive stopped-stage descent.** For strongly progressive X, a native localizing
     sequence τ, martingales Y_n, and simultaneous-time a.e. equality of Y_n with the native
     stopped stages `1_{0<τ_n}X`, prove `Locally (fun Z => Martingale Z F P) F X P`.
     This is the exact target `locally_martingale_of_ae_stopped_eq_of_progressive` in
     `RawLocalization.lean`; retain its probability, filtration, localizing-sequence, and
     strong-progressive hypotheses. It is separate from the weaker continuous-surrogate lemma.
   - **Raw bounded localizers.** If M is already a native raw-F local martingale with
     almost-sure continuous paths, construct raw-F localizers ρ_n for which
     `∀ᵐω, ∀t, |Zⁿ_t(ω)−Zⁿ_0(ω)|≤n+1`, where
     `Zⁿ=stoppedProcess (1_{0<ρ_n}M) ρ_n`. Add F₀ cutoffs to obtain bounded full
     stopped processes, hence every finite Lp moment, without assuming integrability
     of M₀. To handle literal adaptation, first form an adapted surrogate as the
     pointwise limit, or zero when the limit fails to exist, of the original native
     stopped martingales. It agrees with M at all times outside one common null set.
     For each C>0 choose thresholds θ_j=C(1−2^(−j−1)) and first hits on dyadic grids.
     Fix a measurable full-measure set G₀ contained in the common continuity event.
     On G₀ identify S_C with the supremum, over lower levels θ↑C, of the
     infima of rational q with |X_q−X₀|>θ. This gives an ambient-measurable
     representative of S_C, without claiming it is a raw stopping time. Extend
     it measurably off G₀. Form the grid-miss events on G₀ with this representative,
     and prove the rational characterization and measurability before using their probabilities.
     Choose each grid fine enough that the chance of missing the lower threshold
     before the continuous-path C-level hit is summable in j. Use Borel–Cantelli.
     Define the new time as the infimum of these grid hits when that infimum is
     attained, and ∞ otherwise. Prove it is a stopping time by the countable union
     over a candidate attaining index and the countable comparisons with all other
     grid hits. Its range is countable. Prove a.s. attainment: each grid hit h_j
     is at least S_(θ_j), these lower bounds increase to S_C, and Borel–Cantelli
     makes h_j≤S_C eventually. If some h_j<S_C, only finitely many other h_j can
     lie below an intermediate value, so a minimum is attained; otherwise eventually
     h_j=S_C. Treat S_C=∞ separately. Thus the fallback ∞ does not spoil the
     a.s. bound. Almost surely the attained minimum lies before the C-level
     hit and after the C/2-level hit. Finite maxima over levels C=k+1, k≤n, make these
     times monotone, keep the bound n+1, and tend to ∞. Take their minima with the
     original localizers and apply countable-range optional sampling to the original
     stopped martingales. The final minima need not have countable range; the
     auxiliary stopping applied to each already-stopped martingale does. The F₀ cutoff
     uses the surrogate's value `M̃₀=lim_k 1_{σ_k>0}M₀` (zero if the limit fails),
     rather than assuming the literal M₀ is F₀-measurable.
   - **Stopped-version adapter.** If X is F-strongly-adapted and a.s. continuous,
     τ_n is an actual native F-localizing sequence, Yⁿ are F-martingales, and
     `∀n, ∀ᵐω, ∀t, stoppedProcess (1_{0<τ_n}X) (τ_n) t ω=Yⁿ_t ω`,
     prove native `Locally (Martingale · F P) F X P`. Use the independent
     countable-range level localizers, F₀ cutoffs and bounded conditional convergence.
     An equality at each fixed time alone does not provide the common path event.
   - **Raw descent.** If M is raw-F strongly adapted, has almost-sure continuous
     paths, and is a local martingale for a larger filtration G, use the same
     countable-range bounded localizers constructed directly from M. Stop the
     G-localized martingales at these times, pass by bounded conditional convergence,
     and use the tower property to recover the F-martingale identities. If G uses
     the completed ambient measure, first regard F as a filtration on the completed
     measurable space, apply same-space descent under the completed measure, and then
     transport the resulting native `Locally` statement back. Prove that the raw stopping
     predicates are unchanged, a.e. statements and integrals transfer, and conditional
     expectations onto each raw F_t agree a.e. across completion for integrable variables.
     Export actual native F-localizing sequences, not merely equivalent stopped versions.
   - **Usual-augmentation lift.** An a.s.-continuous raw-F native local martingale is
     local for the completed right-continuous augmentation under the completed measure.
     Prove the stopped martingale lift using path right continuity and reverse conditional
     expectation limits, then transport the raw localizers; add the càdlàg version.
     This precedes use of S2.5 and S3–S4 usual-basis constructions on raw inputs.



   A strongly adapted bounded local martingale is a martingale; a strongly adapted
   nonnegative local martingale is a supermartingale when its initial value is integrable.
   For 1≤p<∞ and every fixed finite t, uniform integrability of the family
   {|M_(t∧σ_n)|^p:n∈ℕ} upgrades a strongly adapted local martingale to an Lp
   martingale. Conversely, on a usual basis a right-continuous Lp martingale has
   this UI property for every stopping localizer sequence: use optional sampling
   and conditional Jensen against |M_t|^p at σ_n∧t. This is a fixed-horizon claim.
   On a usual basis also prove that the strict-level times
   τ_k=inf{t>0:|M_t−M₀|>k}, k≥1, are stopping and increase to infinity for
   continuous adapted M. When M is also a local martingale, their centered
   stopped increments are bounded by k
   and are martingales, hence have every finite Lp moment. Add F₀ cutoffs for
   full native stopped-process bounds when M₀ is not integrable. On a usual basis use the adaptation result above; on a
   raw basis retain adaptation as a hypothesis rather than inferring it from `Locally`.

### 2.5 Doob–Meyer

On a usual basis, stated in the native typeclass form
   `[P.IsComplete] [Filtration.IsRightContinuous 𝓕]` together with
   `hcomplete : ∀ A, MeasurableSet A → P A = 0 → MeasurableSet[𝓕 0] A`, construct the
   unique predictable càdlàg integrable increasing compensator starting at 0 for a càdlàg
   class-D submartingale. Build discrete compensators,
   approximation/compactness/uniform-integrability and predictable-limit machinery; localization
   gives the class-DL form. A statement carrying the compensator as a hypothesis does not
   construct it. Expose predictable brackets for locally square-integrable martingales and
   the continuous square decomposition used by S4.

   The exact usual-basis interface for this dictionary is `[P.IsComplete]`
   `[Filtration.IsRightContinuous 𝓕]` and
   `hcomplete : ∀ A : Set Ω, MeasurableSet A → P A = 0 → MeasurableSet[𝓕 0] A`.
   This last premise says ambient-measurable null sets are already visible at time zero; it is
   not inferred merely from right continuity or from completion of a different measure space.
   In particular, if a proof uses `IsUsualAugmentation` on
   `NullMeasurableSpace Ω P` with `P.completion`, it must separately construct the same-space
   transfer to these typeclasses and this `hcomplete` premise; S2.5's statement uses the
   displayed interface directly.
   For the counting-process/Stieltjes dictionary, consume S0.6.1's ground temporal
   adapter from `TemporalPointMeasure E` to `TemporalPointMeasure Unit`, its
   measurability, adapted-restriction and count identities. S2.5 owns the
   counting-process/Stieltjes dictionary. On the same usual basis assumptions above, if
   `N:Ω→TemporalPointMeasure Unit` is measurable and adapted and `E[N_t]<∞` on every finite
   horizon, construct its predictable increasing càdlàg Doob–Meyer process `A`, `A₀=0`.
   Turn each path into its locally finite Stieltjes measure `ν_A(ω)`, with
   `ν_A((s,t])=A_t−A_s` and zero mass at 0, using S0.0's restriction/endpoint API.
   Construct the measurable map `ω↦ν_A(ω).prod (Measure.dirac ())` into
   `MarkedLocallyFiniteMeasure ℝ≥0 Unit` and prove `IsCompensator P 𝓕 N` for it.
   Conversely, under the same finite-horizon integrability hypotheses, a supplier
   compensator's cumulative process is the Doob–Meyer compensator, up to
   indistinguishability. Prove the dictionary via predictable-rectangle identities and
   uniqueness, including random-measure measurability. This adapter uses the complete,
   right-continuous basis with all ambient-measurable P-null sets in `𝓕₀`; the supplier's
   `IsCompensator` predicate itself retains arbitrary-basis scope, and its explicit
   constructions and compensator-as-hypothesis results do not wait on S2.5.
   On a usual basis prove the continuous-filtration characterization: every stopping
   time is predictable up to the stated a.s. qualification iff every real càdlàg
   local martingale has a continuous indistinguishable version. Build the needed
   jump API here: enumerate the jumps of a càdlàg adapted process by stopping times,
   construct the accessible/totally-inaccessible splitting and their predictable
   compensators after bounded localization, and relate predictable jumps to the
   conditional jump mean at F_(τ−). Prove the two implications with these interfaces;
   S0.5 supplies the predictable section/announcement theorem, predictable-time
   evaluation at F_(τ−), and the basic predictable-ray generation. In the
   all-stopping-times-predictable direction use optional-ray generation to
   get optional⊆predictable, then evaluate martingale jumps at predictable
   times. In the converse use the predictable compensator of the stopped
   counting process of a single jump and the predictable graph criterion,
   then apply S0.5's proved graph-to-announcement result.

### Examples

For B, the martingale B²−t starts at 0 and has expectation 0; B² alone has expectation t. For a rate-2 Poisson count, N₃−6 has expectation 0 and variance 6.

### Dependencies

*Needs:* Layer 0 augmentation and stopping; Mathlib discrete martingales and sampling; Layer 1 Brownian laws for Brownian examples. Poisson examples use Layer 0.6 and PointProcesses Layer 10 compensated-integral identities. Doob–Meyer uses the complete right-continuous basis specified in §2.5.

## Layer 3: Stochastic integration and finite variation

### 3.1 predictable measures

For the Brownian time measure, `predictable_le_prod` expresses that the predictable
sigma algebra is contained in the ambient product sigma algebra. Define
`predictableMeasure F P T` by trimming `(timeMeasure T).prod P` along that inclusion;
Its predictable L² space is the native real `Lp` space with exponent 2.

**API.**

- Predictable rectangle mass is `(t−s)P(A)` for 0≤s≤t≤T and A∈F_s.
- The time-zero slice has mass zero; restricting to a smaller horizon agrees with its trim.
- Predictable L² classes are unchanged by equality almost everywhere for this measure.

**Checks.**

- At T=0 the measure is zero and every L² class is the zero class.
- For P(Ω)=1 and T=2, the constant-one squared norm is 2, not 1.
- For A∈F₁ of probability 1/2, the rectangle (1,3]×A has mass 1 at horizon 3;
  using its right endpoint in place of its length would give 3/2.

On a usual basis construct the nonnegative
   predictable measure of a càdlàg class-DL submartingale Z, with rectangle
   value `λ_Z((s,t]×A)=E[1_A(Z_t−Z_s)]` for A∈F_s and zero mass at time 0. Consume
   S2.5's compensator on each finite horizon, identify the measure with
   `E∫1_A dA_Z`, and prove consistency, local finiteness and uniqueness by
   rectangles. For a right-continuous nonnegative submartingale, prove the
   finite-horizon class-D bound by domination by conditional expectations of
   its terminal value; apply S2.2's càdlàg regularization and identify the
   right-continuous version. This supplies the source's positive-submartingale
   construction with its filtration and version hypotheses explicit.
   For a càdlàg L² martingale M specialize the same construction to Z=M² on
   predictable sets, zero mass at time 0 and rectangle value
   `μ_M((s,t]×A)=E[1_A(M_t−M_s)²]`, A∈ℱ_s. Prove countable additivity, finiteness on
   finite horizons for L² martingales, uniqueness and the predictable-bracket representation; its Brownian
   specialization on [0,T] is the trim of `(timeMeasure T).prod P` to
   `F.predictable`; the compensated rate-α Poisson specialization is α times that trim.

### 3.2 simple-process completion

Construct the Brownian integral directly on an arbitrary
   filtration relative to which B is Brownian, independently of S2.5. Use finite-horizon
   dt×P restricted to the predictable sigma algebra, elementary predictable integrands and
   `E[(ξ(B_t−B_s))²]=E[ξ²](t−s)` for ξ∈L²(F_s) to prove orthogonality and the isometry.
   Complete and localize this construction with the stated representative and measurability
   adapters. Define `ElementaryIntegrand F` as a finite grid `s₀≤s₁≤…≤sₙ` with bounded
   `F_(sᵢ)`-measurable heights `ξᵢ`, its process `Σᵢ ξᵢ1_(sᵢ,sᵢ₊₁]` and its elementary
   integral `Σᵢ ξᵢ(B_(t∧sᵢ₊₁)−B_(t∧sᵢ))`, named `ElementaryIntegrand.toProcess`
   and `ElementaryIntegrand.integral`. Empty grids give zero; repeated grid times
   contribute zero; the one-step grid 1,3 with height 2 gives process 2 on (1,3]
   and integral `2(B_(t∧3)−B_(t∧1))`. These distinguish left predictability from a
   right-endpoint or closed-interval convention. Define `IsItoIntegral F P B H I` to require `IsStronglyPredictable F H`, that I has
   almost surely continuous paths and that for every t some elementary integrands Kₙ satisfy
   `∫_(0,t] |Kₙ−H|² ds → 0` in probability, the energy being a lower Lebesgue integral, while
   their elementary integrals at t converge in probability to `I_t`.
   - For a filtered Brownian B and H locally Brownian-integrable, prove
     `exists_isItoIntegral`: some strongly progressive I with `IsItoIntegral F P B H I` is a
     local martingale (Karatzas–Shreve, Brownian Motion and Stochastic Calculus, §3.2.D).
   - For a filtered Brownian B, prove `isItoIntegral_unique`: two Itô integrals of the same H
     are indistinguishable. Route: for elementary L, `P(|∫L dB|_t ≥ ε) ≤ δ/ε² + P(∫₀ᵗL² ≥ δ)`,
     applied to the difference of two approximating sequences, then a.s. continuity on a
     countable dense set of times.
   - For H Brownian-integrable (predictable and L² on every finite horizon), prove
     `itoIntegral_isometry`: a strongly progressive Itô integral I of H is a martingale and
     `E[I_t²]=E∫_(0,t] H² ds` for every t. For H only locally Brownian-integrable, prove
     `itoIntegral_localMartingale`: a strongly progressive Itô integral is a local martingale.
     Strong progressivity is a hypothesis because the predicate fixes I only up to
     indistinguishability, and an arbitrary version need not be adapted to a raw filtration.

   **Checks.**

   - A deterministic nonmeasurable indicator H=1_A, where A and its complement have
     inner measure zero in every bounded positive-time interval, is excluded by
     predictability. Without that requirement the lower square errors for both K=0
     and K=1 would be zero, admitting the incompatible integrals 0 and B.
   - For measurable H=0 the unit approximant has square error t; for H=1 the zero
     approximant has square error t. At t=1 both errors equal 1, so neither wrong
     constant sequence converges in energy to its proposed integrand.
   - At t=0 the horizon measure `timeMeasure 0` is zero and every elementary integral
     vanishes, so `IsItoIntegral` forces `I₀=0` a.s.
   - For H=1 the one-step integrand with grid `0≤t` and height 1 has zero energy and
     elementary integral `B_t−B_0=B_t`; with uniqueness this forces `I_t=B_t` a.s., which
     excludes the zero process and every rescaling `cI`, c≠1.
   - Isometry at H=1: `E[B_t²]=t` and `((timeMeasure t).prod P)`-integral of 1 is t.
   - Non-example: if `∫₀ᵗH²ds=∞` on an event of positive probability, every bounded
     elementary K has infinite energy `∫|K−H|²` there, so no Itô integral exists; a Bochner
     energy would return the junk value 0 and accept K=0.

   On a usual basis, after S3.1 is available, prove its Doléans measure for B equals
   the trim of `(timeMeasure T).prod P` to `F.predictable` on every finite horizon,
   and identify the two integral constructions by their elementary values and completion.
   For the general S3.1 measure, predictable rectangles generate dense simple/step
   processes in L²(μ_M). Construct representation-independent elementary integrals,
   increment orthogonality and the isometry; extend to a genuine real linear isometry
   `L²(μ_M|[0,T])→L²(P)` and CLM. For vector integrands/noise build the Hilbert–Schmidt
   isometry/cross-isometry and coordinate/isometry transport. State the trimmed predictable
   measure and ambient product-measure dictionary; measurability is not an informal extra
   assumption on an L² representative.
   For Brownian integration, S0.2's predictable-representative adapter extends the integral
   to progressively measurable inputs through their dt×P-a.e. classes; prove all finite-
   horizon and local integral identities independent of that choice. In
   particular prove [`itoIntegral_local_congr`](Suggested.lean): for locally Brownian-integrable
   predictable H,K equal dt×P-a.e. on every finite horizon, their integral
   processes are indistinguishable. Use the minima of common finite-horizon
   energy localizers for H,K, apply the L² congruence on each stopped stage,
   and exhaust integer horizons. This pins the representative independence
   required by IsStrongSolution. Apply Brownian Itô
   formulas to the selected predictable Brownian version and transfer to any
   indistinguishable raw version. For S9 equations, use the predictable representative of
   σ(t,X_t), retaining the declared Borel coefficient hypotheses and original initial data.

### 3.3 integral process

Truncation at t, mean-zero martingale, strongly progressive
   selected continuous/càdlàg process,
   L² continuity in the continuous case, Doob uniform approximation, linearity, AE integrand
   congruence, indistinguishability, multiplier rule for bounded ℱ_s-measurable variables,
   deterministic/optional stopping and restriction/concatenation. Prove continuity of the
   integrator implies continuity of the integral, not merely separate-time L² limits.
   Identify the deterministic-integrand Gaussian map of S1.3 with this integral by the
   common elementary-integrand formula and L² continuity.
   For `Y=∫X dM` prove the measure identity `μ_Y(A)=∫_A X²dμ_M` on every
   predictable set, first on rectangles by conditional isometry, then by
   measure uniqueness. State the finite-horizon L² hypotheses and identify
   the actual with-density measure. This proof precedes S4's bracket formula.

### 3.4 localization

Define `BrownianIntegrable F P H` to require strong predictability and membership of
`Function.uncurry H` in L² of each finite-horizon time-product measure.
Define `LocallyBrownianIntegrable F P H` to require strong predictability and finite
pathwise square energy on every finite horizon outside one common null set.

**API.**

- The expected-energy domain maps into the pathwise-energy domain by Tonelli and integer horizons.
- Both domains are stable under addition, scalar multiplication and predictable stopping.
- Product-a.e. equal predictable representatives yield the same integral up to indistinguishability.

**Checks.**

- H=2 has expected and pathwise energy 4T, hence belongs to both domains.
- H(t)=1/sqrt(t) for t>0 has infinite energy on (0,1]; it belongs to neither domain.
- For an independent F₀ Cauchy variable Z, H(t)=Z has finite pathwise energy TZ²,
  but infinite expected energy at T=1; locality does not mean global L².

First work on a usual basis. Predictable integrands locally square integrable against the bracket;
   construct integrals by compatible stopped integrals and prove independence of localizers,
   locality on stochastic intervals and substitution `∫Z d(∫X dM)=∫ZX dM` with its domain
   equivalence. Continuous adapted integrands are locally integrable against continuous local
   martingales. Finite-horizon Brownian progressive integrands with ∫‖H‖²dt<∞ a.s. receive a
   predictable equivalence class; state rather than erase that projection step.
   Make the continuous-integrand localizer explicit. Work with the centered
   integrator `M−M₀`, whose integral equals that against M, and stop at n
   and at the first time `|M−M₀|∨|X|≥n`, using everywhere-continuous adapted versions.
   This closed-level hitting time is distinct from the source's strict-level infimum.
   Prove these times increase
   to infinity, the stopped centered martingales are L², and their total
   Doléans mass is at most n². Use native `1_{0<τ_n}` localization and the
   zero mass at time 0 for paths with τ_n=0; do not claim a pointwise bound
   on X₀ when |X₀|>n. Separately prove the source p.101 strict-level construction: for continuous `Y_t=|M_t−M₀|∨|X_t|`, `τ_k=inf{t:Y_t>k}` increases to infinity; after localization, the centered stopped M is L² and `1_[0,τ_k]X` is predictable and bounded by k outside the zero-time section, which has zero Doléans mass for a continuous martingale; hence its `Λ²` class has a bounded representative. Keep this strict-level source construction distinct from the closed-level hitting time above, including the zero-time convention. Prove stopped-integral consistency outside a common
   null set, using continuous versions and rational times, then patch to a
   simultaneous-time process and prove independence of the localizer. No
   L² assumption on an arbitrary initial M₀ is inferred from stopping it.
   Also build the raw-filtration adapters required by the Brownian integral, quadratic
   variation, Itô and strong-solution statements: construct F_t-measurable representatives
   from the adapted L²/Picard approximants, select strongly progressive a.s.-continuous
   versions using S0.2's lagged predictable replacement, without asserting everywhere
   continuity on an incomplete basis, and prove their identities up to
   indistinguishability. Construct actual raw-F stopping localizers, rather than silently
   reuse augmented stopping times. For a predictable Brownian integrand H, put
   `A_t=∫₀ᵗ‖H_s‖²ds` in [0,∞] and `H*_t=H_t1_{A_t<∞}`. Prove A is
   left-continuous and adapted as an extended-valued process, hence {A<∞} is predictable.
   Prove `A*_t=∫₀ᵗ‖H*_s‖²ds` is nondecreasing and continuous in [0,∞], including
   paths where the original energy becomes infinite immediately to the right of a time.
   For n≥1 set `τ_n=inf{t:A*_t≥n}`; prove `{τ_n≤t}={A*_t≥n}∈F_t`,
   τ_n>0 and `A*_(t∧τ_n)≤n`, yielding stopped L² bounds. On a fixed finite
   horizon with A_T<∞ a.s., H*=H there outside a single null set and τ_n∧T→T a.s.
   If A_T<∞ a.s. for every finite T, prove τ_n→∞ a.s. Export compatibility
   with the usual augmentation. The continuous-local-martingale and strong-solution adapters
   must likewise export raw adaptation and native localizing sequences; a construction on
   the completed space alone is insufficient.

### 3.5 finite variation and Fubini

Apply S0.0's native BV measure/integral adapters to
   adapted càdlàg finite-variation paths; prove the resulting random-measure and integral
   measurability. Include the source's explicit Poisson finite-variation calculation: for a
   rate-α Poisson counting process N with locally finite jump times τ_k, M_t=N_t−αt and
   continuous adapted X, prove pathwise on every finite horizon that
   `∫_(0,t]X_s dM_s = Σ_{k≥0: 0<τ_k≤t}X_{τ_k} − α∫₀ᵗX_sds`,
   where `τ_k` is the S0.6 roadmap jump-time enumeration; equivalently index positive jump times by j=k+1
   and sum over j≥1. This restricted sum is finite; it never evaluates X at `τ_k=∞`.
   The open left endpoint matches S0.0's convention ν_g({0})=0; the constructed source process
   has no time-zero atom a.s. Under PointProcesses Layer 10's `TemporalPointMeasure` carrier, values
   are point measures locally finite on compact time intervals, so for a process valued
   in that carrier the sum has finitely many terms on each bounded horizon for every ω. When
   transferring the identity to the unmarked source process via the adapter's almost-sure
   pushforward equality, state it on that probability-one equality event; do not promote that
   adapter equality to an everywhere pathwise claim. Derive it from the Stieltjes
   integral against the counting measure and
   the compensator's Lebesgue integral. First analyze truncated dyadic left-point sums:
   on each finite horizon T, let π_n be the dyadic mesh with T adjoined and
   include the terminal partial interval for each t≤T. For a continuous path X and BV
   path M, bound the error between `Σ_i X_(t_i)(M_(t_(i+1)∧t)−M_(t_i∧t))` (using only
   indices with t_i<t) and `∫_(0,t]X_s dM_s` by
   `Var_[0,T](M)·ω_X(mesh π_n)`. Uniform continuity makes this tend to zero uniformly
   for t≤T. Include jump endpoints and the no-zero-atom convention; continuity of X
   identifies the limiting jump contribution with `X_(τ_k)`.
   Separately retain the literal physical-p178 sum
   `S_n(t)=Σ_{k=0}^{⌊2ⁿt⌋}X_(k/2ⁿ)(M_((k+1)/2ⁿ)−M_(k/2ⁿ))`,
   whose final interval overshoots t even when t is a mesh point. For each
   fixed t≤T put `k_n=⌊2ⁿt⌋`; its difference from the sum truncated at t is
   `X_(k_n/2ⁿ)(M_((k_n+1)/2ⁿ)−M_t)`. For continuous X and right-continuous
   M of bounded variation on `[0,T+1]`, prove this remainder tends to zero
   at each fixed t by right continuity, giving the source's pointwise limit.
   Uniform convergence for t≤T is asserted for the truncated sums only;
   give a one-jump M and X≡1 counterexample to uniform convergence of the
   overshooting sums. Keep construction and filtration-relative Poisson
   hypotheses with the Poisson-process supplier rather than treating this identity as a consequence
   of the generic stochastic-integral API alone. For càdlàg BV paths F,G, specialize the native
   left-/right-limit product rule
   and obtain `F_tG_t−F₀G₀=∫F₋dG+∫G₋dF+Σ_(0<s≤t)ΔF_sΔG_s` when using
   left-limit integrands in both integrals. Prove equality with stochastic integrals when both
   are defined. Continuous finite-variation
   local martingales are constant. Prove stochastic Fubini on finite parameter/time spaces
   under explicit square-integrability (and its localized form), including matrix deterministic
   kernels used by linear SDEs. This is a connecting theorem beyond ordinary Bochner Fubini.

### Examples

H=2 gives integral 2B and energy 4T. For T=3 the isometry gives 12 on both sides. The empty elementary grid and a repeated grid point both contribute 0.

### Dependencies

*Needs:* Layers 0–1, elementary conditional orthogonality and native Lp completion for the direct Brownian integral. The general predictable measure uses Layer 2.5; localization uses Layer 2.4. The deterministic finite-variation part uses Layer 0.0.

## Layer 4: Quadratic variation, covariation and semimartingales

### 4.1 continuous brackets

Define `IsQuadraticVariation F P M A` to mean that A is
   strongly progressive, almost surely continuous, nondecreasing and zero at time 0, and that
   `M²−M₀²−A` is a native local martingale.
   - For an almost surely continuous native local martingale M on a raw filtration, prove
     `exists_isQuadraticVariation` (some A satisfies the predicate) and
     `isQuadraticVariation_unique` (two such A are indistinguishable: their difference is a
     continuous local martingale of finite variation starting at 0) (Revuz–Yor, Continuous
     Martingales and Brownian Motion, Ch. IV, Thm 1.8).
   - For a filtered Brownian B, prove `brownian_quadraticVariation`:
     `IsQuadraticVariation F P B (fun t _ => t)`, since `B_t²−t` is a martingale.

   **Checks.**

   - For M=B the choice `A_t=2t` fails: `B_t²−2t` has drift −t, so it is a strict
     supermartingale and not a local martingale; `A=0` fails because `E[B_t²]=t≠0`.
   - For a process constant in time, `M_t=M₀`, the predicate holds with A=0.
   - Scope: for the compensated Poisson process `N_t−t` the choice `A_t=t` satisfies the
     predicate (`(N_t−t)²−t` is a martingale since `Var N_t=t`), yet the optional bracket is
     `[N−t]=N`; the predicate identifies `[M]` only for continuous M, and S4.4 keeps the
     jump brackets separate.

   Begin with bounded continuous adapted martingales.
   On the usual augmentation use S3's integral process to form
   A=M²−M₀²−2∫M dM. Prove the bounded-martingale partition precursor here:
   S3's isometry and Doob inequality give uniform-in-probability convergence of
   the left-step stochastic integrals; the telescoping square identity then gives
   squared-increment sums converging uniformly in probability to A. Use positivity
   of sums on subintervals and continuous paths to prove A increasing and A₀=0.
   Prove finite-horizon integrability and the actual square-martingale identity.
   Select the strongly progressive raw representative from the raw adapted partition
   approximants and transport conditional identities back across completion.
   This bounded precursor precedes the general-local partition theorem of S4.2.
   Then patch S2.4's native bounded stages using QV stopping/uniqueness compatibility.
   Construct `[M]`, prove continuity/increase/initial0, finite
   stopped expectation `E[M]_t=E[(M_t−M₀)²]` when applicable, stopping and version invariance,
   `M²−M₀²−[M]` local martingale and uniqueness. A continuous L² martingale's square
   decomposition has an integrable increasing term and a genuine martingale term.

   For QV and integrals choose F-strongly-progressive, a.s.-continuous representatives,
   using S0.2's lagged predictable version after the adapted representative is constructed.
   Progressive measurability ensures literal adaptation even when stopping at a raw
   continuous-range time. For a native local M that is not literally adapted, retain its
   original localizers σ_n: `1_{σ_n>0}(M²−M₀²−[M])^σ_n` is adapted from the native
   stopped M and the progressive QV. Apply descent or the stopped-version adapter to these
   adapted stages through a direct bounded-localizer route. Apply the raw bounded-localizer
   theorem to M first, producing actual raw stops ρ_n whose native stages Zⁿ are
   bounded martingales. Construct their square identities using the bounded-martingale
   QV theorem, and prove the localization identity [Zⁿ]=1_(ρ_n>0)[M]^(ρ_n).
   Thus the native ρ_n-stage of M²−M₀²−[M] is literally
   (Zⁿ)²−(Zⁿ₀)²−[Zⁿ], an actual martingale. This one sequence proves the raw
   native Locally conclusion directly. The QV localization and restriction identities
   must be established before this use. No right-continuous-filtration Locally-of-Locally
   theorem or stability of bare raw martingales is used. Do not apply raw descent to
   the unlocalized M² process. For a strongly progressive Brownian integral apply the
   stopped-version adapter to its energy-stopped martingale versions. These steps supply
   the raw-F conclusions in S3–S4 without changing the ambient raw sigma-algebra.

### 4.2 partition limits

Deterministic vanishing-mesh sums of squared increments converge
   in probability to `[M]`; bounded continuous M gives L², L² martingales L¹. Prove uniform
   on compact time convergence in probability and weighted sums for bounded continuous adapted
   integrands, with localized extension. For standard Brownian motion on [0,T],
   prove `E[(Q_π−T)²]=2Σ_i(Δt_i)²≤2T·mesh(π)` for every deterministic
   finite partition π, specializing to `2T²/n` for n equal intervals. Prove
   dyadic almost-sure convergence and the source's nested finite-partition almost-sure
   theorem by a proved reverse-martingale/conditional Gaussian argument. Do not infer that
   stronger assertion solely from an L² estimate without its extra argument.
   For the source p.235 right-endpoint weighted sums, keep the anticipative endpoint distinct from the adapted left endpoint. For a deterministic partition and continuous B, prove
   `|Σ_j B_(t_(j+1))(ΔB_j)^2−Σ_j B_(t_j)(ΔB_j)^2| ≤ max_j|ΔB_j| Σ_j(ΔB_j)^2`; continuity makes the maximum tend to zero and quadratic-variation convergence makes the second factor tight. Apply the left-endpoint quadratic-variation theorem only after this estimate; consume the result in S3.5.
   Each sequence consists of finite partitions spanning [0,T], including endpoints 0,T,
   with mesh tending to zero. For each fixed deterministic nested sequence, insert one point per step
   and write its quadratic sums as Q_n. On the canonical Brownian path law,
   use reflection after the inserted deterministic time to prove
   `E[Q_n|G_{n+1}]=Q_{n+1}`, where `G_n=σ(Q_n,Q_{n+1},…)`. Future sums
   are reflection invariant and the cross term changes sign. Tower then
   gives `Q_n=E[Q₀|G_n]`; consume Tau Ceti's decreasing-field conditional
   convergence theorem and identify its a.s. limit using the L² variance
   estimate. Transfer by the Brownian path law and recover the original
   sequence as a subsequence. No summability of the original meshes is
   required. The exceptional null set may depend on the sequence; there is
   no simultaneous assertion over all partition sequences. See
   [Lalley, Theorem 7](https://galton.uchicago.edu/~lalley/Courses/383/BrownianMotion.pdf).
   Also prove the following polynomial partition estimates for standard real
   Brownian B with B₀=0. For 0≤s≤t,
   `E[(B_t²−B_s²)²]=4s(t−s)+3(t−s)²`. For a deterministic finite partition
   0=t₀<⋯<t_n=T, write d_i=t_(i+1)−t_i, Δ_i=B_(t_(i+1))−B_(t_i),
   δ=mesh(π), `C_π=Σ_iΔ_i³` and `R_π=Σ_iB_(t_i)Δ_i²`. Establish
   `E C_π²=15Σ_i d_i³≤15Tδ²` and
   `E[(R_π−∫₀ᵀB_s ds)²]≤5T²δ`. Prove these directly from independent
   Gaussian moments: the centered square error has second moment
   `2Σ_i t_i d_i²`, and the ordinary Riemann error
   `Σ_iB_(t_i)d_i−∫₀ᵀB_s ds` has second moment `(1/3)Σ_i d_i³`.
   Keep the off-diagonal terms in R_π: for i<j their expectation is
   `E[B_(t_i)B_(t_j)Δ_i²Δ_j²]=t_i d_i d_j`; the partition 0,1,2,3 gives
   E R_π²=11, whereas the diagonal contribution alone is 9.
   Use `B_T³/3=Σ_iB_(t_i)²Δ_i+R_π+C_π/3` and S3's isometry to obtain
   `B_T³=3∫₀ᵀB_s²dB_s+3∫₀ᵀB_s ds`. The step-integrand squared L² error is
   `Σ_i(2t_i d_i²+d_i³)≤3T²δ`. This gives L² convergence along every
   deterministic vanishing-mesh sequence and a.s. convergence along the dyadic
   sequence by summable second-moment errors. This polynomial example precedes
   and does not use S5's general Itô theorem. Treat T=0 by empty sums and zero
   integrals; strict finite partitions above are used for T>0.

### 4.3 mutual variation

Polarization, symmetry/bilinearity, partitions, Stieltjes finite
   variation, Kunita–Watanabe variation bound, stochastic product decomposition,
   `[∫H dM,∫K dN]=∫HK d[M,N]` and vector/matrix versions. Adding continuous finite variation
   preserves QV; build semimartingale decomposition/congruence/localization rather than
   use local-martingale QV notation on an undefined larger class.
   Prove `continuous_bdg`, the Burkholder–Davis–Gundy inequalities stated below
   (Baudoin, Lecture 24, Theorem 1). For each p>0 choose constants
   0<c_p≤C_p<∞, depending only on p, such that every continuous real local
   martingale M with M₀=0 a.s. and stopping time τ satisfy, in extended nonnegative expectations,
   the following bounds. On a raw basis choose the progressive a.s.-continuous
   representative M̃ from S2.4/S0.2 and the progressive QV representative.
   Define U_T as the supremum of |M̃_(q∧τ)| over nonnegative rational q≤T,
   adjoining T itself, and V_T=√([M]_(T∧τ)). Prove these are measurable and
   agree a.s. with the full stopped-path suprema/brackets. Set U=sup_n U_n
   and V=sup_n V_n for the infinite horizon; all BDG, good-λ and layer-cake
   expressions below use these measurable representatives:
   `c_p E([M]_τ^(p/2)) ≤ E(sup_(s≤τ)|M_s|^p) ≤ C_p E([M]_τ^(p/2))`.
   For τ=∞ define both quantities by increasing finite-horizon suprema. Prove stopping,
   localization and vector versions; for finite-dimensional Hilbert-space integrals
   `M=∫σ dW`, replace [M] by `∫‖σ‖_HS²dt`. Include both good-λ estimates for
   `U=sup_(s≤τ)|M_s|` and `V=√([M]_τ)`: for each β>1 there are finite K_β and δ_β>0 such that
   `P(U>βλ,V≤δλ)≤K_βδ²P(U>λ)` and
   `P(V>βλ,U≤δλ)≤K_βδ²P(V>λ)` for λ>0 and 0<δ<δ_β.
   Prove the stopping construction first on a usual basis, after S2.4's upward
   adapter for raw inputs; choose progressive representatives of QV and integrals.
   Transport the final moment inequalities back to the raw measure by the common a.e.
   path identities. Construct the good-λ estimates using stopped L² estimates and the square/bracket decomposition,
   then integrate tails and absorb the small coefficient. First stop so that U is bounded
   for the upper estimate and V is bounded for the reverse estimate, making the absorbed
   p-moment finite; remove the stops and finite horizons by monotone convergence.
   This route uses S2/S3 and
   S4's square decomposition, so S5's general Itô theorem is not a prerequisite.
   Export the conjugate-martingale and stochastic-integral maximal bounds used by
   S6 local time/Hardy theory and S9–S10 moment, flow and generator estimates.

### 4.4 jump compatibility

For càdlàg locally L² martingales construct optional QV with
   `Δ[M]=(ΔM)²`, predictable compensator ⟨M⟩ and mutual brackets; integral isometry uses
   the predictable bracket, while semimartingale product/jump Itô uses optional QV. Give
   `[N−αt]=N` and `⟨N−αt⟩=αt` for the homogeneous rate-α process constructed in S0.6,
   on its time-simplicity event and up to indistinguishability. Scalar
   semimartingale integration and jump correction are explicit targets, not an assumption
   that continuous formulas transfer unchanged.

### Examples

For M=2B, the bracket at t=3 is 12. For compensated rate-2 Poisson counts at t=3, optional bracket is N₃ while predictable bracket is 6; the path with one jump distinguishes 1 from 6.

### Dependencies

*Needs:* Layer 3 integration and Layer 2 stopping/localization. The BDG route uses stopped L² estimates and the square decomposition; the general Itô formula in Layer 5 is not an input.

## Layer 5: Itô, Stratonovich and exponential calculus

### 5.1 Itô formula

Prove `brownian_ito_C2` for scalar Brownian B and C² f, with a predictable
representative of f′(B) as in Layer 3: `f(B_t)=f(0)+∫f′(B)dB+½∫f″(B)dt`
(Karatzas–Shreve, §3.3). Its representative-level Lean statement assumes f′(B)
is predictable; the general statement uses the adapter and indistinguishable transfer.

For continuous local martingales `M¹,…,Mᵐ` and continuous adapted
   finite-variation processes `A¹,…,Aⁿ`, prove the C²/C¹ change-of-variables formula on an open
   domain, stopped before its boundary. Mixed second derivatives use mutual brackets; include
   time as a finite-variation coordinate. Prove Taylor remainder estimates first for bounded
   C³ derivatives, then localize and approximate C² functions with a controlled mollifier.
   Pass to simultaneous-time equality using continuous versions. Give Fréchet-derivative,
   coordinate and complex real/imaginary formulations and smooth-map naturality.

### 5.2 semimartingale rules

Product, chain and integration-by-parts identities;
   vector stochastic integrals and transformed SDEs; càdlàg scalar jump Itô formula includes
   `Σ_{s≤t}(f(X_s)−f(X_{s−})−f'(X_{s−})ΔX_s)` with the correct continuous bracket term.
   Prove convergence of this sum under localization, not assume it is finite for infinitely
   many small jumps.

### 5.3 Stratonovich

For continuous semimartingales define
   `∫H∘dX=∫H dX+½[H,X]`, with H itself a continuous semimartingale. Prove chain/product
   rules, covariance under smooth changes of state and the coefficient drift correction.
   For all continuous semimartingales H,X, prove symmetric-endpoint sums converge in
   probability along deterministic vanishing-mesh partitions to this integral. Prove the
   temporal-midpoint limit separately for X=B and H_t=f(t,B_t), with f∈C^(1,2) locally
   on finite time/state regions, using localization. State these hypotheses on the
   midpoint theorem; arbitrary bounded adapted H alone supplies no such limit. Verify `∫B dB=(B²−t)/2` and
   `∫B∘dB=B²/2` for a centered start.
   Verify the source's Brownian example `∫₀ᵗ e^{B_s}∘dB_s=e^{B_t}−1` for `B₀=0`; in Itô form its drift correction is `½e^{B_s}ds`. Also construct the C¹ state-function extension: for every continuous semimartingale
   X and h:ℝ→ℝ of class C¹, define [h(X),X] as the UCP limit of
   partition cross-increment sums, and prove [h(X),X]=∫h′(X)d[X] from weighted-QV convergence and uniform continuity
   of h′ on localized compact ranges. Define its symmetric integral by
   ∫h(X)∘dX=∫h(X)dX+(1/2)∫h′(X)d[X], without requiring h(X) itself to be
   a semimartingale. Prove convergence of symmetric-endpoint sums and the chain
   rule ∫h(X)∘dX=H(X_t)−H(X₀) for H′=h, using the C² Itô formula for H.
   For Brownian X=B also prove temporal-midpoint convergence for every C¹ h
   by localization, Brownian half-increment estimates and smooth approximation.
   Include the deterministic-clock test: for 0<p<1, p≠1/2, construct the
   atomless biased-binary law μ_p on [0,1] with zero-digit probability p,
   its continuous distribution function A, and M_t=W_(A(t)). On dyadic grids
   show Σ_j(M_(mid_j)−M_(left_j))ΔM_j→p A(1) in L²: its expectation
   is p A(1) and its variance is at most 2 max_j ΔA_j A(1)→0.
   Hence temporal-midpoint sums for h(x)=x differ from the symmetric integral
   by (p−1/2)A(1). This example pins the Brownian hypotheses on temporal midpoints.

### 5.4 stochastic exponentials

Construct the continuous Doléans exponential
   `exp(M−M₀−½[M])`, its integral equation, positivity, inverse/product identities and stopped
   consistency. It is a local martingale; give true-martingale/L² criteria and the nonnegative
   supermartingale expectation bound. For jump extensions state the product correction and
   positivity condition `ΔM>−1`. Prove Novikov's finite-horizon criterion
   `E exp(½[M]_T)<∞` and Kazamaki at a finite horizon: the exponential submartingale
   `exp((M−M₀)/2)` is of class D on that horizon, then the bounded Brownian-integrand
   corollary. For continuous adapted M and continuous adapted increasing A starting
   at 0, prove both equivalences: M is local with `[M]=A` iff
   `exp(α(M−M₀)−α²A/2)` is local for every real α, and iff the literal source p173
   process `exp(αM−α²A/2)` is local for every real α. Also prove the source p.173 L² implication: when `A=[M]`, if M is an L² martingale, `Z₀^α∈L²`, and `E∫₀ᵗ(Z_s^α)²dA_s<∞` for every finite t, then `Z^α` is an L² martingale, by its stochastic-integral representation and Itô isometry. For the uncentered form,
   localize the F₀-measurable finite exponential initial value; no global integrability
   of that initial value is assumed. No measure change from a local density of expectation less than 1.

### 5.5 Lévy characterization and Brownian versions

The original-process conclusion is `levy_characterization_adapted`;
`exists_predictable_brownian_of_localMartingale` is its selected-version counterpart.
`filteredBrownian_of_brownianLaw_localMartingale` uses the native Brownian law,
literal strong adaptation and locality to deduce future independence.
`exists_predictable_brownian_version` selects a predictable indistinguishable version
of a filtration-relative Brownian motion. These are the four interfaces detailed below.

For the original real process M,
   assume literal `StronglyAdapted F M`, native
   `Locally (fun Y => Martingale Y F P) F M P`, continuity outside one common null set,
   `M₀=0` a.s., and `IsQuadraticVariation F P M (fun t _ => t)`.
   Prove `levy_characterization_adapted`, concluding `IsFilteredBrownian F P M`: conditional characteristic functions give
   `E(exp(iα(M_t−M_s))|F_s)=exp(−α²(t−s)/2)` for every s≤t and real α,
   hence centered Gaussian increments independent of F_s. Independence is a conclusion,
   not an additional premise. Use S2.4's actual raw bounded localizers, the stopped
   exponential identities and bounded conditional convergence. No completeness or right
   continuity of F is imposed. Literal adaptation is separate from native locality.

   For a finite-dimensional vector M, retain strong adaptation and common-null path
   continuity, centered start, coordinate native locality and the full cross-bracket
   identities `[Mⁱ,Mʲ]_t=δ_ij t`. Apply the scalar conditional characteristic-function
   argument to every linear projection to prove the joint conditional Gaussian law,
   independent vector increments and the filtered vector Brownian conclusion.
   Separate scalar Brownian coordinate conclusions do not establish that joint law.

   Prove the filtered Wiener-law corollary for an original **strongly adapted** M:
   if its continuous-path law is Wiener and it is a native local martingale for F,
   transport deterministic-partition QV convergence through the path law and use S4's
   uniqueness to obtain the simultaneous bracket identity, then apply this characterization.
   Do not assume future-increment independence from F. For finite F₀-measurable M₀,
   apply the centered theorem to M−M₀; the conclusion is `M=M₀+B` with B standard
   F-Brownian, and M itself is standard only when M₀=0 a.s.

   Separately, for **bare native locality**, common-null continuous paths, centered start
   and the same bracket (or Wiener-path-law hypotheses), construct a predictable
   F-Brownian version B with `∀ᵐω, ∀t, B_t(ω)=M_t(ω)`. First use S2.4's pointwise
   limit of the native stopped martingales (zero on limit failure) to obtain a literally
   strongly adapted surrogate, then S0.2's lagged predictable version. Prove that it
   retains native locality through the actual stopped-stage/descent adapter and that
   S4's indistinguishability/uniqueness comparison transports QV. Apply the original-
   process theorem to this selected version. The uncentered branch centers at its
   selected finite F₀-measurable initial value, equal to M₀ a.s. This proves the original
   process's Brownian path law without claiming its literal raw adaptation. Preserve
   both interfaces under indistinguishable replacement at exactly these stated scopes.

### Examples

For f(x)=x², Itô gives B_t²=2∫₀ᵗB_s dB_s+t. At T=1, ∫₀¹B_s dB_s has mean 0, whereas ∫₀¹B_s ∘dB_s=B₁²/2 has mean 1/2. For f=3 both derivative terms are 0.

### Dependencies

*Needs:* Layer 4 brackets, Layer 3 integration and Layer 0.0 finite-variation integration; DifferentialGeometry §0.3 for differential/pullback notation in coordinate changes. Taylor localization and C² approximation are supplied in §5.1.

## Layer 6: Brownian paths, Markov and potential theory

Before the strong-Markov kernel argument, prove the source p.19 Lemma 3.5.2 adapter. For measurable real random variables X₁,X₂ and a measurable event A, assume X₂ is
independent of `σ(A,X₁)`. Define the finite restricted image measure
`ν_A(B)=P(A∩{X₁∈B})` and the law `ν₂=P.map X₂`. For nonnegative measurable f prove
`∫_A f(X₁(ω),X₂(ω))dP(ω)=∫y ∫x f(x,y)dν_A(x)dν₂(y)` by measurable sections and Tonelli.
State the signed version under `∫_A |f(X₁,X₂)|dP<∞`, proving the corresponding product
integrability. The source notation `P_{X₁|A}` denotes this unnormalized restricted measure,
not division by P(A); the formula includes P(A)=0. Preserve the actual joint independence
premise rather than replacing it by pairwise independence. Consume this adapter in the restart/kernel proof below.

### 6.1 restart

The headline `brownian_strongMarkov` gives the restarted
   Brownian law and independence of the full future path from the stopped sigma algebra
   at an almost-surely finite stopping time; Lalley, Theorem 5, p.13 states the natural-filtration case, and the deterministic-increment and decreasing-grid argument below supplies the extension to the declared filtration.
   `brownian_martingaleRepresentation` states the terminal L² form: for T≥0 and an L²
   variable ξ measurable in the natural Brownian filtration at T, find a predictable
   finite-horizon L² integrand H with `ξ=Eξ+∫₀ᵀH dB` almost surely; set H to zero after T.
   The completed-filtration form uses the same a.e. classes (Karatzas–Shreve, §3.4).
    Let B be Brownian relative to the chosen arbitrary filtration,
   with a.s.-continuous adapted paths, B₀=0 a.s., and each increment B_t−B_s
   independent of F_s with centered Gaussian covariance (t−s)id. Select the
   predictable indistinguishable version supplied by S0.2 and use that version,
   denoted B here, in every stopped evaluation, kernel and localizing event below.
   Its progressive measurability gives literal stopped-value measurability. Transfer
   the resulting identities to the original version a.s. by indistinguishability;
   no everywhere-continuous adapted modification on the raw basis is presumed.
   Prove the right-continuous-hull adapter needed by the source's strict optional-time
   convention. For `F⁺_s=⋂_{u>s}F_u`, show that Brownian increments after s are independent of
   F⁺_s and retain their centered Gaussian laws: test against A∈F⁺_s, first use independence of
   `B_t−B_u` from F_u for u↓s, then pass to the limit using path continuity. A time τ satisfying
   `{τ<s}∈F_s` for every s is an F⁺-stopping time; identify its usual F⁺ stopping σ-algebra with
   the source's strict `F_{τ+}` by the two definitions and countable rational approximation.
   Prove restart first for countably-valued stopping times by deterministic-time independent
   increments. Approximate a bounded F⁺-stopping time τ from above by forward dyadic grid times
   `τ_n=2^(−n)(⌊2^nτ⌋+1)` (and τ_n=∞ when τ=∞). Verify directly from `{τ<s}∈F_s` that
   each τ_n is an F-stopping time; the nested dyadic grids make τ_n pointwise
   nonincreasing (not necessarily strictly), while τ_n>τ and τ_n→τ. For bounded
   continuous cylinder functions pass to the limit by path continuity and dominated convergence,
   then extend to bounded Borel future functionals by a monotone class, retaining localization and
   `{τ<∞}` for general times. Since each forward-grid time τ_n satisfies τ_n>τ, also prove
   `F_{τ+}⊆F_{τ_n}`: for A∈F_(τ+),
   `A∩{τ_n≤t}=(A∩{τ<t})∩{τ_n≤t}∈F_t`. The source's claim that the first hit of an arbitrary Borel
   set is a stopping time is not a raw-filtration theorem: prove it through the completed-usual
   debut theorem of S0.4, while retaining the direct arbitrary-filtration result already stated
   for continuous paths and open-domain exit.
   Prove strong Markov for the
   whole shifted Brownian future at stopping times in that filtration, with strict stopping sigma-algebra
   `F_{τ+}` and event `{τ<∞}`. Give the a.s.-finite unconditional restart; for general τ give
   the restricted identity and normalize only on positive-probability events. Establish the
   kernel identity first for nonnegative measurable functions using native `condLExp`
   and the S2.1 tower/pull-out API, and for signed functions using S2.1’s
   sigma-integrable extension. For measurable `g` with
   `E|g(x+B_t)|<∞` at every deterministic start x and time t, construct the measurable
   transition kernels `q(z)=E|g(z+B_t)|` and `h(z)=E[g(z+B_t)]`, and prove `q(B_τ)<∞`
   on `{τ<∞}`. Extend the stopped expression by zero on `{τ=∞}`. Localize
   on `A_n={τ=∞}∪({τ<∞}∩{q(B_τ)≤n})`, which are increasing
   `F_{τ+}`-measurable events exhausting Ω up to a null set. The nonnegative
   kernel identity gives `E[1_{A_n}|g(B_{τ+t})|]≤n` for the zero extension.
   Apply ordinary L¹ conditional expectation there and S2.1’s gluing theorem
   to identify its generalized conditional expectation with
   `1_{τ<∞}h(B_τ)`. Ordinary L¹ conditional expectation of `g(B_{τ+t})` is a separate specialization requiring `E|g(B_{τ+t})|<∞`; fixed-start
   integrability alone does not imply this. Prove the filtration/augmentation adapter to the
   usual natural Brownian basis without replacing the arbitrary-filtration theorem's
   hypotheses. Prove right continuity of the completed natural Brownian filtration and
   Blumenthal germ zero–one using the independent-increment/germ argument; no circular use of
   strong Markov or usual augmentation.
   After this natural-filtration construction, prove the L² martingale representation
   theorem in that usual natural Brownian filtration, integrand uniqueness in predictable
   time×P L², finite/infinite horizons and the local-martingale version by localization.
   Build density of exponential/cylinder Gaussian functionals as the proof engine. For Brownian
   motion started at zero and a strictly increasing finite grid 0=t₀<t₁<⋯<t_k=T, prove that
   `∏ᵢ H_(nᵢ)(ΔBᵢ/√Δtᵢ)/√(nᵢ!)`, indexed by tuples of nonnegative integers, is an
   orthonormal basis of the grid-generated Gaussian L² space; H_n are the probabilists'
   Hermite polynomials. Consume Completed/OrthogonalL2Bases Part D's built
   `gaussianHermitePiBasis` and generic `piHilbertBasis`/finite product-basis API for the
   tensor-product basis and its orthonormality/completeness. This roadmap owns only the normalized
   Brownian-increment law pullback, the finite-grid sigma-field L² isometry, and dyadic-grid
   density in the completed natural Wiener sigma-algebra; do not rebuild the multidimensional
   Gaussian basis. For each T>0, prove that the
   union of these subspaces over the nested grids tᵢ=iT/2ⁿ is dense in L² of the completed
   natural Wiener σ-algebra at T: continuous-path dyadic evaluations generate the finite-horizon
   Borel σ-algebra, and increasing conditional expectations converge in L². Use the natural
   filtration augmentation comparison already constructed here to identify this completion
   with the usual natural filtration at T. Increasing integer horizons give the whole-path
   density statement for the infinite-horizon representation theorem. For the
   source's finite-history Markov property, define a real-valued process X to be Markov by
   `P(X_{t_{n+1}}∈U | X_{t₁},…,X_{t_n})=P(X_{t_{n+1}}∈U | X_{t_n})` for every finite
   ordered history and Borel U. Prove its equivalent conditional-expectation forms: the same
   identity for every integrable measurable `f(X_{t_{n+1}})`, and, for every integrable variable
   measurable with respect to the future process σ-algebra, conditioning on the full natural past
   equals conditioning on `X_t`. Specify the integrability and natural-filtration hypotheses and
   prove the extensions by indicator/simple-function and monotone-class arguments. To pass from
   the one-step finite-history identity to a variable measurable with respect to several future
   coordinates, induct on the number of future times, applying the tower property at each step;
   only after the finite-cylinder identity is established extend to the full future process
   sigma-algebra by a π/λ or monotone-class argument. This generic Markov-process result is
   distinct from the Brownian strong-Markov theorem.
   For the source's independent-initial-information example, prove explicitly that if A is
   independent of the whole Brownian path σ-algebra, then B is Brownian relative to
   `A∨F^B_t` for every t, by checking each future increment against finite intersections from A
   and the Brownian past and extending by a monotone class. Extra independent initial sigma
   algebras receive the full product/disintegration adapter; representation is not asserted for
   arbitrary filtration enlargements.

### 6.2 reflection and one-dimensional exits

The exit headlines `brownian_hitting_laplace` and `brownian_interval_exit` below
state almost-sure finiteness together with the level Laplace transform and integrable
interval-exit mean, respectively (Karatzas–Shreve, §2.8).

Prove `brownian_reflection`:
   for standard real Brownian B, a>0 and t≥0,
   `P(∃s≤t, B_s≥a)=2P(B_t≥a)` (Lalley, equation (32), p.16).
   At t=0 both probabilities are 0; allowing a=0 at t=0 would instead give 1=2.
    Reflection at a level, maximum law,
   hitting/exit probabilities, `brownian_interval_exit` with interval exit mean `K²−x²` inside and0 outside, and hitting
   `brownian_hitting_laplace` with level Laplace transform `exp(−√(2θ)|a−x|)`. The hitting density is
   `|a−x| exp(−(a−x)²/(2t))/√(2πt³)` for x≠a; x=a gives Dirac0. Prove its transform and
   probability normalization analytically. Identify the law directly from the reflection
   CDF `P_x(τ_a≤t)=2P(B_t≥|a−x|)` for t>0 and x≠a, where B is centered Brownian;
   differentiating that CDF gives the displayed density. This identification does not
   require an additional Laplace-transform uniqueness supplier.
   For K>0 and |x|≤K, first sample `B²−t` at `t∧τ`, where τ exits (−K,K).
   Derive `E[t∧τ]=E[B_(t∧τ)²]−x²≤K²−x²`; monotone convergence gives
   integrability of τ, and bounded convergence of the stopped square gives the exact mean.
   At or outside the interval the exit time is zero. Relate open- and closed-interval
   exit times using Brownian immediate boundary crossing, rather than continuity alone.
   For every proper open `A⊊ℝ` and start x, prove the source p.247 finiteness assertion. If x∉A, the exit time is zero; otherwise choose y∉A and use the a.s.-finite one-dimensional level-hitting time of y to bound the first exit from A. Retain the source’s separate compressed two-dimensional recurrence argument as a source proof route, not as a premise of this proof.
   For θ>0, x<a and `α=√(2θ)`, the exponential residual on
   `{τ_a>t}` is bounded by `exp(αa−θt)`, which tends to zero. This supplies the
   limit needed for bounded-time optional sampling. At θ=0 use the previously proved
   a.s.-finite hitting time/probability normalization, or the θ↓0 limit of the positive-
   parameter transform by bounded convergence; the displayed residual bound alone is 1.
   Reflection sends both x and a
   to −x and −a for x>a. The x=a case has τ_a=0. Preserve these starting-point
   conventions when deriving the density and its analytic Laplace transform.
   Also derive the exact truncated Gaussian exponential identity, for t>0 and α∈ℝ,
   `E_x[exp(αB_t−α²t/2)1_(B_t<a)]
     =exp(αx)Φ((a−x−αt)/√t)`, using `Φ(x)=cdf (gaussianReal 0 1) x` from StandardDistributions, with the conventions consumed in S6.2.
   Complete the square with center x+αt and prove the Gaussian-tail limit used in
   the level-hit calculation; this gives the direct Gaussian-integral proof as well.

### 6.3 path growth

Prove `brownian_lil`: outside one null set the
   limsup and liminf of `B_t/sqrt(2t log log t)` at infinity are 1 and −1
   (Karatzas–Shreve, §2.9). The normalization is used only for sufficiently large t;
   the totalized logarithms and division at t=0 or t=1 do not affect these limits.
    Gaussian tail/reflection estimates; consume S1.4’s infinity limit
   `B_t/t→0`. Prove the local law of iterated logarithm with exact two-sided constants and
   normalization: for each fixed deterministic `t`, almost surely the limsup and liminf of
   `(B_{t+h}−B_t)/sqrt(2h log log(1/h))` as `h↓0` are `+1` and `−1`. The exceptional null
   set may depend on `t`; this assertion does not give a simultaneous local LIL at every time,
   and rational-time local LILs cannot be extended to all times by countability. Separately prove
   the global-at-infinity LIL: almost surely the limsup and liminf of
   `B_t/sqrt(2t log log t)` are `+1` and `−1`. For every T>0 prove Lévy's exact
   scalar uniform modulus: a.s., as h↓0,
   `sup_{s,t∈[0,T], |s−t|≤h}|B_t−B_s| / sqrt(2h log(1/h)) → 1`.
   The exceptional event may depend on T. Separately prove simultaneous nowhere-differentiability
   by the three-consecutive-dyadic-increments lower-bound argument of
   Paley–Wiener–Zygmund / Dvoretzky–Erdős–Kakutani. For a dyadic mesh h=2^(−n)
   on a finite horizon, independence and the Gaussian small-ball estimate bound
   the probability that three consecutive increments all have absolute value
   at most M h by `C M³ h^{3/2}`. A union bound over O(h^(−1)) positions is
   summable in n. Borel–Cantelli, then countably many integer M and horizons,
   excludes every time admitting a finite derivative: such a derivative would
   force all three increments in an adjacent mesh window to be O(h) at every
   sufficiently fine scale. Handle endpoints with one-sided windows. Uniform
   modulus upper bounds alone do not supply this argument. Also prove fixed-time
   nondifferentiability.
   Quadratic variation yields infinite total variation on every nontrivial interval using
   countable rational intervals. Formalize finite Gaussian moments
   and corrected square-increment estimates used by the course's stochastic-integral
   approximations.

### 6.4 spatial behavior

Harmonic radial annulus exit probabilities (logarithmic in
   dimension 2, powers in higher dimensions), neighborhood recurrence in dimensions 1 and 2 and transience in
   dimensions≥3, and point polarity in dimensions≥2: for every deterministic start x and fixed target a,
   prove `P_x(∃t>0:B_t=a)=0`, including a=x; an initial hit at t=0 is kept separate.
   For x≠a first fix R>‖x−a‖ and send the inner annulus radius ε↓0: the
   planar hit-before-outer-exit bound is `log(R/‖x−a‖)/log(R/ε)→0`,
   and the higher-dimensional power-ratio bound also tends to zero. A point
   hit implies every inner-sphere hit, so it has probability zero before that
   outer exit. Exhaust integer outer radii. For x=a use each deterministic
   time s=1/n: its Gaussian transition law gives B_s≠a almost surely; Markov
   restart and the off-target result exclude hits at or after s. The union
   over n excludes every positive-time hit. Prove bounded-domain exit finiteness
   and spherical harmonic measure. For planar Brownian motion, prove the range is dense almost
   surely by showing every rational disk is hit a.s. (use the annulus hitting probability with
   arbitrary center and send the outer radius to infinity), then intersect over a countable
   basis; do not take an uncountable intersection of probability-one events. For the three-dimensional inverse-radius example at deterministic x≠0, prove
   finiteness for t>0 and `E_x[1/‖B_t‖]→0` as t→∞ directly from its Gaussian
   density. Split at radius R: the near contribution is at most
   `(2πt)^(−3/2)∫_(‖y‖≤R)‖y‖⁻¹dy=O(R²t^(−3/2))`; the far contribution
   is at most 1/R because the Gaussian density has total mass one. First
   let t→∞ for fixed R, then R→∞. This does not depend on the later Bessel
   kernel theorem; S9.4a gives the exact expectation and strict-local-martingale comparison.
   Double points
   occur a.s. in dimensions≤3 and are absent a.s. in dimensions≥4; build the required Gaussian
   two-path intersection bounds and potential/capacity estimates, their independent-block
   amplification and zero–one step. This dimension threshold does not follow just from
   recurrence.

### 6.5 harmonic measure


   **S6.5.0 exit kernels, ball exit law and Dirichlet comparison.** Construct exit kernels for domains, measurability in the start,
   stopped Markov/disintegration laws, Brownian occupation kernels and spatial null-set zero
   occupation time. For each bounded ball, prove finite exit almost surely and uniqueness of the rotation-invariant probability on its sphere by orthogonal-group averaging. For continuous boundary data, identify the Brownian exit expectation with the ball Dirichlet solution using stopped Itô/Kakutani under explicit regularity and integrability hypotheses. Dirichlet uniqueness identifies the exit law against every continuous test function; Riesz uniqueness gives equality of finite Borel measures. This establishes the center-start uniform exit law and the ball exit representation consumed below.

   For bounded Borel boundary f on a bounded domain D,
   set `u(x)=E_x[f(B_τ_D)]`; prove it measurable and bounded. For each closed ball contained
   in D, strong Markov at its exit gives the sphere mean-value identity for u. Own the
   deterministic implication from a measurable locally bounded all-ball mean-value function
   to a smooth harmonic function, by convolution with radial mollifiers and differentiation.
   This proves harmonicity of u without assuming a general-domain Dirichlet solution. For
   continuous boundary data on bounded regular domains, prove boundary attainment from exit-law
   concentration and uniform continuity, and uniqueness via PDE's maximum principle. Establish
   regularity criteria sufficient for the examples. For bounded domains in ℝⁿ with C² boundary, prove every
   boundary point regular by two distinct arguments. Pin both formulations:
   immediate exit means `P_{x₀}(τ_D^+=0)=1`, with
   `τ_D^+=inf{t>0:B_t∉D}` for a boundary start, while interior exit-law
   concentration means `P_y(‖B_{τ_D}−x₀‖≥δ)→0` as y∈D tends to x₀ for
   every δ>0. For these C² domains prove that both arguments establish both
   formulations and hence the same regularity conclusion. The cylinder estimates
   also apply at y=x₀ and at arbitrarily small horizons, giving immediate exit.
   Conversely, the pathwise proof gives arbitrarily early points strictly outside
   the closed domain; continuity and coupling `B^y=y+B` transfer those excursions
   to all sufficiently nearby starts, while the small-time path supremum keeps
   the exits within δ. Dominated convergence gives interior concentration.
   Use only translations and orthogonal
   rotations to present the local graph, preserving the standard Brownian law. For a quantitative Gaussian/reflection
   cylinder proof, in a boundary chart write the boundary as a tangent graph
   `x_n=φ(x')`, `φ(0)=0`, `Dφ(0)=0`, and `|φ(v)|≤M|v|²`; choose the normal coordinate so
   its positive side is exterior. Given a target neighborhood radius `δ>0` and error `0<ε<1`, choose
   `κ>0` with `P(sup_{0≤u≤1}B^n_u≥κ)>1−ε/2`, and choose `K` large enough that
   `P(max_i sup_{0≤u≤1}|B^i_u|≤K)>1−ε/2` for all n coordinates. Put
   `ℓ=κ√t` and `R=K√t`. Choose `t>0` sufficiently small and then `0<η<ℓ/4` so
   `√n R+η<min(δ, chart radius)` and
   `M(√(n−1)R+η)²<ℓ/2`; when n=1 the tangent term is omitted. For every interior starting
   point y with `‖y−x₀‖<η` of the fixed boundary point x₀ at the chart origin, Brownian scaling gives the two cylinder
   events with joint probability greater than `1−ε`. Before the positive normal coordinate
   reaches `ℓ`, all coordinates remain in the chart; at its hitting time the outward normal
   coordinate exceeds the graph by at least `ℓ−η−ℓ/2>0`. Thus the path exits the domain
   within the target neighborhood with probability at least `1−ε`. On compact C² boundary
   pieces, make the estimates uniform over a finite atlas.

   Separately give the pathwise local-LIL boundary proof: at a fixed boundary point, tangent
   coordinates are `O(√(h log log(1/h)))` in absolute value, while the outward normal has
   positive excursions of that order along arbitrarily small times. The quadratic graph error
   is `O(h log log(1/h))`, so those normal excursions dominate it and force immediate exit.
   This pathwise LIL argument is distinct from, and does not supply, the quantitative
   reflection-probability bounds above.
   Consume the native ball-Poisson API in
   TauCeti.Analysis.PDE.GreenFunction.Ball and PoissonIntegral.Ball:
   ballPoissonKernel_pos_on_sphere, integral_ballPoissonKernel with n≠0,
   harmonicOnNhd_ballPoissonIntegral for integrable surface data,
   tendsto_ballPoissonIntegral for continuous data, and
   exists_harmonicOnNhd_ball_continuousOn_closedBall_eqOn_sphere.
   Consume the native ball continuous-data Dirichlet theorem in the PDE Poisson/Perron
   program, together with the native ball-Poisson kernel/API. This roadmap owns the
   finite-boundary-measure extension and weak-* recovery
   adapter specified in S6.5.1; neither the continuous-data theorem nor the native integrable-data
   harmonicity theorem asserts that stronger result. Keep the native kernel's `volume.toSphere`
   convention explicit: its mass-one theorem is the area normalization converted in S6.5.1.


   **S6.5.1 finite-boundary-measure extension and weak-* radial recovery.** Work on the unit
   ball in `EuclideanSpace ℝ (Fin d)`, `d≥2`. Distinguish native area measure
   `σ_area=volume.toSphere` from the normalized probability measure used in the following
   Hardy and Brownian-exit formulas. Set
   `c_d=d * volume.real (ball (0 : EuclideanSpace ℝ (Fin d)) 1)`;
   `Measure.toSphere_real_apply_univ` identifies `σ_area(S^(d−1))=c_d>0`. Define
   `σ_prob=ENNReal.ofReal(c_d⁻¹) • σ_area` and the normalized-kernel convention
   `K_prob(x,ζ)=c_d * ballPoissonKernel d x ζ=(1−‖x‖²)/‖x−ζ‖^d`. The native theorem
   `TauCeti.integral_ballPoissonKernel` states `∫ K_area(x,ζ) dσ_area(ζ)=1`, where
   `K_area=ballPoissonKernel`; therefore `∫ K_prob(x,ζ) dσ_prob(ζ)=1` for `‖x‖<1`.
   Export and use the symmetry `K_prob(rζ,η)=K_prob(rη,ζ)` on the unit sphere in both the
   total-variation and Fubini arguments. This is the normalization used by the subsequent
   normalized-sphere Hardy norms and by
   Brownian exit probabilities. For density data `g`, native `ballPoissonIntegral g` agrees
   with `∫ K_area(x,ζ)g(ζ)dσ_area(ζ)` by `ballPoissonIntegral_def`; converting to `σ_prob`
   and `K_prob` gives `∫ K_prob(x,ζ)g(ζ)dσ_prob(ζ)`, with no hidden area factor. Consume
   `harmonicOnNhd_integral_smul_of_contDiffOn` through the existing proof of
   `harmonicOnNhd_ballPoissonIntegral` in `PoissonIntegral/Ball.lean`; its density hypothesis
   is integrability against `volume.toSphere`, with joint `ContDiffOn ℝ 2` kernel regularity off the boundary diagonal, which includes each fixed-boundary interior-variable slice. The generic theorem is in
   `InnerProductSpace/Laplacian/ParametricIntegral.lean`; it requires an integrable weight,
   continuous parameter map, an open off-diagonal domain, `ContDiffOn ℝ 2` for the kernel there,
   and harmonicity of each fixed-boundary-point slice.

   For every finite signed Borel boundary measure `μ_prob` under the normalized convention
   define `P_prob[μ_prob](x)=∫ K_prob(x,ζ)dμ_prob(ζ)` as a finite signed-measure integral,
   defined by the two Jordan-part integrals `∫K_prob dμ⁺−∫K_prob dμ⁻`; positivity and
   boundedness of the kernel on each fixed interior sphere make both terms finite. When an
   integrable density `g` is used, bind the signed vector measure precisely as
   `σ_prob.withDensityᵥ g`; its set integral is `∫_A g dσ_prob` by Mathlib's
   `Measure.withDensityᵥ_apply`, and its variation is the density `‖g‖ₑ` by
   `Measure.variation_withDensityᵥ`. Set `‖μ‖TV=(μ.totalVariation univ).toReal`.
   Prove harmonicity on the open ball, mass preservation for positive measures, and both
   conversions `μ_area=c_d • μ_prob` and `μ_prob=c_d⁻¹ • μ_area` in the real signed-measure carrier. Define
   `P_area[μ_area](x)=∫ K_area(x,ζ)dμ_area(ζ)` and prove the paired function identity.
   Prove the total-variation bounds
   `∫ |P_prob[μ_prob](rζ)|dσ_prob(ζ)≤‖μ_prob‖TV` and
   `∫ |P_area[μ_area](rζ)|dσ_area(ζ)≤‖μ_area‖TV`, and
   `‖μ_area‖TV=c_d‖μ_prob‖TV`. Prove weak-* radial recovery in both normalizations,
   meaning convergence against every continuous boundary test function. For a continuous test
   `φ`, use Fubini and symmetry to rewrite the pairing as the integral against `μ` of
   `P[φ](rη)`. Apply native `tendsto_ballPoissonIntegral` to get pointwise convergence to
   `φ(η)`; positivity and mass one bound the integrand by `‖φ‖∞`. Dominated convergence
   against each finite Jordan part gives the required limit. Establish uniqueness of the finite signed
   boundary measure from its Poisson integral by testing radial recovery against continuous
   functions. For positive `μ`, also retain positivity and preservation of total mass.
   State the conversion whenever translating a p=1 boundary representation. Thus the p=1 measure representation and L¹ density norm use
   `σ_prob`, consistently with the normalized-sphere convention defined above.

   For arbitrary finite signed `μ`, write `μ=μ⁺−μ⁻` and apply native
   `harmonicOnNhd_integral_smul_of_contDiffOn` separately to its finite positive Jordan parts,
   with weight `g≡1`. Its inputs are a compact second-countable parameter space, integrable
   weight, continuous parameter map, open `W⊆E×P`, open `U` with `U×ι(α)⊆W`, joint
   `ContDiffOn ℝ 2` of the kernel on `W`, and harmonicity of each fixed-boundary slice on `U`.
   Pin this declaration in `Analysis/InnerProductSpace/Laplacian/ParametricIntegral.lean`; do
   not add a separate differentiation-under-the-integral proof. The native
   `harmonicOnNhd_ballPoissonIntegral` consumes the density specialization and
   `tendsto_ballPoissonIntegral` the continuous-data boundary target. The finite-measure
   adapter remains SC-owned, not PDE C15.
   For every `‖x‖<1`, prove Brownian exit from start `x` has distribution
   `K_prob(x,·) • σ_prob` (equivalently `K_area(x,·) • σ_area`). Derive this for continuous
   data from the ball Dirichlet/Kakutani formula, then use uniqueness of finite Borel measures
   on the sphere. Deduce for every Borel A the identity
   `P_x(B_τ∈A)=∫_A K_prob(x,ζ)dσ_prob(ζ)`. Define `v_A` on the closed ball by this Poisson integral in the interior and `v_A(ζ)=1_A(ζ)` on the sphere. Prove by strong Markov that `v_A(B_(t∧τ))=E[1_A(B_τ)|F_(t∧τ)]`; it is the bounded stopped martingale used in S6.5.3's noncentral-start and indicator arguments. No continuous boundary extension of the indicator Poisson integral is assumed.

   In the disk case define `m` as the pushforward of `dt/(2π)` on `[0,2π)` under `t↦e^{it}`;
   prove it is normalized `σ_prob` under `ℂ ≃ EuclideanSpace ℝ (Fin 2)` and state the
   corresponding kernel identity explicitly: for `z=re^{iθ}`, `ζ=e^{it}`,
   `K_disk(z,ζ)=(1−r²)/(1−2r cos(θ−t)+r²)` and
   `P[f](re^{iθ})=∫₀^(2π)K_disk(re^{iθ},e^{it})f(e^{it})dt/(2π)`;
   prove `∫K_disk dm=1`. For signed measures, state the exact dual formula
   `‖μ‖TV=sup{|∫f dμ| : f continuous, ‖f‖∞≤1}` on the compact boundary and use it
   for weak-* lower semicontinuity. Own the finite-positive-Borel-measure maximal function on
   `S¹` and its weak `(1,1)` bound; PDE Lane B8 provides a function maximal function only.
   For an open U and a C² real function with nonnegative Laplacian on U, apply
   `TauCeti.le_setAverage_ball_of_laplacian_nonneg` to each positive-radius ball whose
   closed ball lies in U. Restrict C² regularity to the open ball and continuity to its
   closure; these are the theorem's separate hypotheses. Openness supplies arbitrarily
   small such radii, giving the frequent inequalities in `TauCeti.SubharmonicOn`.
   The additional targets here are extension from frequent small-radius inequalities
   to every contained ball, preservation under locally uniform limits, and the measurable-to-
   continuous and finite-boundary-measure bridges used above.

   **Checks.**

   - On the unit disk, u(x)=‖x‖² has Δu=4 and center submean inequality 0≤1/2.
   - The negative quadratic has Δu=−4 and center value 0 greater than its ball average −1/2;
     it fails the nonnegative-Laplacian hypothesis.
   - A constant u=3 has Δu=0 and both center and ball average 3 for every positive radius;
     radius zero is excluded because the totalized empty-ball average is 0.

   **S6.5.2 harmonic Hardy boundary representation.** For p>1 prove radial Lp convergence, Poisson representation by the Lp boundary
   function, equality of its Lp norm with the supremum of radial Lp norms, and the
   converse trace theorem for every Lp boundary datum. These boundary targets include
   higher-dimensional balls; the distribution comparison in S6.5.3 is the disk
   theorem. At p=1 give the finite signed boundary-measure representation and recover an
   L¹ boundary-function representation when that measure has an L¹ density. Prove the
   existence direction by uniform radial L¹ bounds as follows. For `r<1`, put
   `dμ_r(ζ)=u(rζ)dσ_prob(ζ)`; its positive and negative parts are uniformly bounded by the
   H¹ norm. On the compact sphere extract a common weak-* convergent subnet of the two positive
   parts, producing a finite signed boundary measure μ. For any fixed interior x and r>‖x‖,
   apply the Dirichlet formula to the radius-r ball:
   `u(x)=∫K_prob(x/r,ζ)u(rζ)dσ_prob(ζ)`. As r↑1, these kernels converge uniformly in ζ
   to `K_prob(x,ζ)`; weak-* convergence therefore yields `u=P_prob[μ]`. For the converse
   construction from μ, harmonic dilation `u_r(ζ)=u(rζ)` is continuous boundary data on the
   unit sphere and the Dirichlet formula on the ball of radius r gives
   `u(r x)=∫K_prob(x,ζ)u_r(ζ)dσ_prob(ζ)` for ‖x‖<1. Existence and uniqueness of this
   continuous-data solution use PDE's Dirichlet/Poisson formula and maximum principle. The
   approximate-identity upper bound already proved gives
   `sup_(r<1)∫|P_prob[μ](rζ)|dσ_prob≤‖μ‖TV`; weak-* lower semicontinuity of total variation
   applied to the radial measures `P_prob[μ](r·)σ_prob`, together with radial recovery,
   gives `‖μ‖TV≤liminf_(r↑1)∫|P_prob[μ](rζ)|dσ_prob`. Hence equality. The compactness
   argument yields a finite signed measure, not necessarily an L¹ density; a singular boundary
   measure shows why a radial H¹ bound alone does not imply an L¹ density.
   Consume PDE's deterministic kernel/continuous-data Dirichlet APIs; this roadmap owns the
   finite-measure circle maximal theorem, the additional subharmonic bridges, Brownian comparison, and harmonic
   Hardy boundary representations. ConformalMapping supplies conformal
   maps where used and has no duplicate Hardy boundary target.

   **S6.5.3 Hardy spaces and Brownian maximal comparison.** In the unit disk,
   for 0<σ<1 let Ω_σ(θ) be the interior of the convex hull of the σ-disk and e^(iθ); define
   `N_σu = sup_{Ω_σ(θ)}|u|` and `u* = sup_{t<τ}|u(B_t)|` with Brownian start 0. For real
   harmonic u prove constants 0<c_σ≤C_σ with
   `c_σ m{N_σu>λ}≤P{u*>λ}≤C_σ m{N_σu>λ}` for every λ>0, where m is normalized circle
   measure. Own the finite-positive-Borel-measure circle maximal
   function Mμ and prove m{Mμ>λ}≤C μ(S¹)/λ, including singular measures,
   with centered arcs and normalized arclength. Use the S6.5.1 finite-measure Poisson adapter and disk kernel bounds to prove the nontangential estimate
   N_σP[μ]≤C_σMμ by dyadic arc decomposition. This Hardy specialization and
   the following Brownian distribution comparison are owned here.
   Own the planar geometric estimates for the distribution comparison. For the upper
   bound put A={N_σu>λ}. For proper open A⊂S¹ define
   `Ω_A=⋃_(θ∉A) Ω_σ(θ)` and prove the shadow estimate
   `P[1_A](z)≥c_σ>0` on the part of ∂Ω_A inside the disk. Optional sampling
   of this bounded harmonic function gives
   `P₀(B leaves Ω_A before τ)≤m(A)/c_σ`; |u|≤λ on Ω_A yields the upper bound.
   Handle A=S¹ directly and prove the required measurability and exhaustion limits.
   For the lower bound prove that every component K of {|u|>λ} has closure meeting
   S¹, by the maximum principle. Fix a sufficiently large finite aperture a_σ,
   with a_σ≥π/(1−σ), and put δ=1−|z|. For z≠0 take the shadow I_z centered
   at z/|z| with angular half-width min(π,a_σδ), taking the whole circle when
   a_σδ≥π and also at z=0. Prove the cone-shadow inclusion and
   `m(I_z)=min(1,a_σδ/π)`, so `m(I_z)≍_σ δ`, including the central disk.
   Prove the planar connected-set hitting estimate
   `P₀(T_K<τ, B_τ∈I_z)≥c_σ m(I_z)` for every open connected K⊆D containing
   z and meeting S¹ in its closure. Own its quantitative intermediate lemmas:
   select a compact continuum C⊂K∩closedBall(z,δ/2) containing z with
   diameter at least δ/2; prove `P₀(T_C<τ)≥cδ` uniformly in z and C by
   planar Beurling/capacity estimates, including annular crossing and normalization.
   Prove `inf_(w∈C) P_w(B_τ∈I_z)≥c_σ` directly from the disk Poisson kernel;
   strong Markov at T_C gives the joint bound. All constants are independent of K
   and z. These geometric and potential-theoretic lemmas are targets here. Use a Vitali-disjoint family
   of these shadow arcs covering {N_σu>λ} up to bounded dilates; the corresponding
   exit-arc events are disjoint and contained in {u*>λ}. Assign arc endpoints
   disjointly or discard them using the atomless uniform exit law. This gives the lower bound.
   The comparison uses harmonic level-set geometry: a general positive superharmonic
   hitting potential has no such nontangential weak-(1,1) bound. Prove localization
   and disk exhaustion. Deduce both
   Lp maximal comparisons explicitly: for every p>0,
   `c_(p,σ)∫|N_σu|^p dm ≤ E[(u*)^p] ≤ C_(p,σ)∫|N_σu|^p dm`.
   For u(0)=0, its harmonic conjugate v with v(0)=0 satisfies
   `E[(u*)^p] ≍_p E[(v*)^p]`, by the equal brackets of u(B),v(B) and S4.3's
   BDG/good-λ bounds, first stopped at the exit τ_r from the radius-r disk, r<1,
   then by monotone convergence as r↑1. Prove the Burkholder–Gundy–Silverstein theorem on the disk:
   for real harmonic u and conjugate v normalized by v(0)=0, for every p>0,
   `u+iv∈H^p ⇔ N_σu∈L^p(m) ⇔ u*∈L^p(P_0)` (Burkholder–Gundy–Silverstein,
   §5, Theorems 1′ and 3′, pp.150–151).
   For holomorphic F on open U⊆ℂ and q:ℝ with q>0 prove
   `TauCeti.SubharmonicOn (fun z => ‖F z‖ ^ q) U`, with Real.rpow and the native continuous sub-mean-value predicate. Consume the predicate and comparison theorem `TauCeti.SubharmonicOn.le_of_le_sphere` from the native `TauCeti/Analysis/InnerProductSpace/Harmonic/Subharmonic.lean`.
   Apply `TauCeti.le_setAverage_ball_of_laplacian_nonneg` with the contained closed-ball,
   positive-radius and C² hypotheses of S6.5.1. Use the additional implications from
   frequent small radii to all contained balls and closure under locally uniform limits. The all-radius implication uses the
   existing continuous-data Dirichlet theorem and SubharmonicOn.le_of_le_sphere
   before passing limits of normalized ball integrals; function-dependent
   good-radius witnesses are not intersected. Apply these implications to
   (ε+|F|²)^(q/2) and the identity
   Δ(ε+|F|²)^(q/2)=2q|F′|²(ε+|F|²)^(q/2−2)(ε+(q/2)|F|²)≥0
   and its locally uniform limit to handle zeros. Independently obtain the stopped
   Brownian submartingale on each smaller disk by Itô for these C² regularizations
   and conditional dominated convergence; prove the required boundedness on each
   compact smaller disk. This submartingale construction is owned here. Apply this with q=p/2 and Doob's L² inequality, then pass r↑1, to prove
   the H^p-to-Brownian-maximal implication.
   Define analytic H^p by the supremum of the radial circle integrals of |u+iv|^p;
   its pth-root quantity, `‖N_σu‖_p` and `(E[(u*)^p])^(1/p)` are comparable.
   Restore u(0) by subtracting/adding that constant and the corresponding constant terms
   in norm estimates. The harmonic boundary-Lp representation/norm theorem is at p>1. Do not infer this distribution equivalence for arbitrary nonharmonic
   functions. For each unit ball in ℝ^d, d≥2, define real harmonic H^p, p>0,
   by finiteness of `sup_(0<r<1)∫_(S^(d−1))|u(rζ)|^p dσ(ζ)`, with normalized
   rotation-invariant surface measure `σ=σ_prob` defined above, and prove similarity transport to other balls.

### 6.6 local time and reflected motion

Prove `exists_brownian_localTime`,
   simultaneously constructing the occupation density and the Tanaka formula below
   (Revuz–Yor, Chapter VI, §1).  Construct jointly continuous real Brownian local time L_t^a with occupation
   normalization `∫₀ᵗF(B_s)ds=∫ℝ F(a)L_t^a da` for nonnegative Borel F.
   Set sgn(0)=0 and prove
   `|B_t−a|=|B₀−a|+∫₀ᵗsgn(B_s−a)dB_s+L_t^a`, and the positive-part
   formula with correction (1/2)L_t^a. Prove the one-sided and two-sided Skorokhod reflection maps and the
   reflected Brownian barrier/rectangle models.
   The radial Brownian Bessel process is identified in S9. Do not treat mere absolute value
   as Brownian motion without its local-time correction.

### 6.7 Brownian dynamical models

Construct two-sided Wiener noise and measure-preserving
   increments shift `θ_sω(t)=ω(t+s)−ω(s)`, its cocycle, ergodicity/mixing through cylinder
   approximation and independent separated increments. Overlapping interval increments use
   their induced joint law, not the product of all interval marginal laws. Brownian translation
   flow gives the basic measurable skew-product example and cocycle law; state
   the shift of noise when composing times.

### Examples

At T=1, E[L₁⁰]=E|B₁|=sqrt(2/π); half that local time would fail Tanaka. For the constant harmonic function u=3, the Poisson integral, radial norm and Brownian exit value are all 3.

### Dependencies

*Needs:* Layers 0–2 for strong Markov and natural-filtration comparison; Gaussian tensor bases from OrthogonalL2Bases Part D and Layer 3 for representation. Layers 4–5 for local time and potential theory; PDE Lanes C12/C15 and the pinned Poisson/parametric integral APIs for deterministic harmonic inputs. The finite-measure and Hardy bridges are §6.5 targets here.

## Layer 7: Clocks and changes of measure

### 7.1 deterministic clock tools

On a usual basis, for continuous adapted nondecreasing A with A₀=0 prove the
   strict inverse `T(s)=inf{t:A_t>s}` with values in `[0,∞]`, right continuity
   where finite, continuity when A is strictly increasing, and plateau identities,
   substitution between Lebesgue and Stieltjes measures, stopping-time and stopping-filtration
   constructions. A continuous local martingale is constant on its QV plateaus; prove this
   before asserting continuity of the time-changed process.

### 7.2 Dambis–Dubins–Schwarz

Prove `dambisDubinsSchwarz`: for a centered
   continuous local martingale M with bracket A tending to infinity a.s., there is
   a standard real Brownian B with `M_t=B_(A_t)` simultaneously for all t a.s.
   (Karatzas–Shreve, §3.4). The nonnegative clock uses `Real.toNNReal`; its
   nonnegativity follows from monotonicity and A₀=0.  For centered continuous local M with `[M]_∞=∞` a.s.,
   first use S2.4/S0.2's selected predictable indistinguishable version M̃. Construct
   `B_s=M̃_{T(s)}` in ℱ_(T(s)) and prove its literal strong adaptation there, common-null
   continuity and bracket s before applying S5.5's original-process characterization.
   Show Brownian and `M_t=B_[M]_t` simultaneously a.s. Preserve the selected adapted
   versions through the inverse clock, stopping filtration and independent-noise product
   extension; do not infer literal adaptation of an arbitrary raw original from pathwise
   a.s. equality. Prove integral
   substitution and localized clock compatibility. If the terminal bracket is finite, first
   identify a stopped Brownian motion, then extend with independent Brownian noise on a
   product probability space; do not claim a full BM on the original space without that
   extension. Own the vector conformal-clock theorem as follows. For centered
   continuous local martingales `Z=(Z¹,…,Zᵈ)` with
   `[Zⁱ,Zʲ]_t=δ_ij A_t`, where A is continuous increasing and A₀=0, select the joint
   predictable adapted version and retain its cross brackets through the common clock.
   Prove literal strong adaptation of that vector in the stopping filtration, then prove
   that the common inverse-clock process is d-dimensional Brownian motion up
   to the terminal clock `A_∞`. Use the vector Lévy characterization to prove
   independent components; separate scalar DDS applications do not imply this.
   Include constancy on clock plateaus and independent-noise extension when
   the terminal clock is finite. For a connected plane domain D, z∈D, planar
   Brownian motion B started at z and `τ_D` its first exit, let F be nonconstant
   holomorphic on D. Itô and the Cauchy–Riemann equations give the common
   clock `A_t=∫₀^(t∧τ_D)|F′(B_s)|²ds` and zero cross bracket for
   `F(B)−F(z)`, interpreted before the lifetime when boundary values do not
   exist. Prove strict increase before exit from discreteness of the critical
   set and Brownian zero occupation time at points. The inverse-clock image
   is planar Brownian motion started at F(z), up to lifetime
   `A_(τ_D−)=∫₀^τ_D|F′(B_s)|²ds`; state the terminal limit or independent
   extension separately. Prove the required geometric and
   radial interfaces here; S9's Bessel application consumes the clock/substitution API.

### 7.3 density martingales

Define `stochasticExponential I θ t ω = exp(I_t(ω)−½∫₀ᵗθ_s(ω)²ds)` when I
is the integral of a locally Brownian-integrable θ. Prove `novikov_expectation`:
finite expectation of `exp(½∫₀ᵀθ²)` implies the terminal density has expectation 1
(Karatzas–Shreve, §3.5).

**API.**

- The exponential starts at 1, is positive and is a local martingale for the stated integral.
- Stopping preserves the exponential identity and the same quadratic-energy normalization.
- Under the expectation-one criterion the terminal density defines a probability measure.

**Checks.**

- θ=0 and I=0 give density 1 and expectation 1 on every horizon.
- θ=2 at T=3 gives `exp(2B₃−6)`; its expectation is `exp(6−6)=1`.
- Reversing the sign of the cross term changes the tilted mean from 6 to −6 at T=3;
  omitting the half-energy term gives expectation e⁶ instead of 1.

Bayes conditional-expectation formula, restriction to
   deterministic/stopping sigma algebras, density process `ρ_t=E[ρ|ℱ_t]`, UI/càdlàg version,
   equivalent-measure/localization and integrability transport. Prove M local under Q iff
   ρM local under P with the actual positive density/version/local conditions. A finite-horizon
   terminal density gives a measure on that horizon; consistency of horizon measures and an
   infinite-horizon extension/equivalence are separate assertions.

### 7.4 Girsanov

Define `IsBrownianOn F Q T X` by a zero start Q-a.s., Q-a.s. continuous paths on
[0,T], strong adaptation, and Gaussian increment laws with independence from F_s
for s≤t≤T. Prove `girsanov_on_horizon`: under the expectation-one density above,
`B_t−∫₀ᵗθ_s ds` satisfies this predicate under Q (Karatzas–Shreve, §3.5).

**API.**

- Restriction from T to S≤T preserves the horizon predicate and its increment laws.
- The tilted terminal density is strictly positive, so P and Q have the same null events.
- The drift correction has a minus sign for the positive-cross-term exponential.

**Checks.**

- θ=0 leaves both the measure and Brownian process unchanged.
- θ=2, T=3 gives Q-mean B₃=6 and corrected mean 0, with variance 3.
- Tilting only at T=1 by θ=1 gives Q-mean B₂=1; subtracting 2 yields −1,
  so the Brownian conclusion cannot be extended past the declared horizon.

For continuous positive density martingale ρ and continuous local M,
   define finite-variation correction `∫ρ⁻¹ d[ρ,M]`; prove existence by localization and
   `M−correction` Q-local with unchanged QV. For a predictable Brownian drift θ that is locally square-integrable in time, prove the change-of-measure conclusion. If θ is initially supplied only as adapted/progressive, consume S3.4's predictable-equivalence adapter before defining the stochastic exponential. Under a true density
   `Z_T=exp(∫θ·dB−½∫‖θ‖²dt)`, `B−∫θdt` is Brownian on[0,T]. Derive probability,
   positivity/equivalence and independence laws; use S5 Novikov/bounded criteria rather than
   assume the conclusion in a “Girsanov data” structure.
   Apply this theorem to S1.4's Volterra transform: for finite T≥0 and continuous K on [0,T],
   prove equivalence of its Gaussian image law with Wiener measure. On
   canonical Wiener space set `θ_s=−K(s)B_s` and
   `Z_T=exp(∫₀ᵀθ_s dB_s−½∫₀ᵀθ_s²ds)`. Prove `Z_T` has expectation one without assuming
   Novikov's condition: stop when `|B|` reaches n, apply bounded-integrand Girsanov, and under
   the stopped tilted laws use the Girsanov convention `W_t=B_t−∫₀ᵗθ_sds`, so before the
   stop `B_t=W_t+∫₀ᵗθ_sds=W_t−∫₀ᵗK(s)B_sds`. Gronwall/Doob show the tilted probability
   of stopping before T tends to zero. By locality of the stochastic integral,
   `Z_T=Z^n_T` on `{τ_n>T}`. Monotone convergence on these increasing events and
   `Q^n(τ_n≤T)→0` give `E_P[Z_T]=1`. The nonnegative local martingale Z is a
   supermartingale; its constant expectation on [0,T] then makes it a true martingale,
   which is the density hypothesis required by Girsanov. Under the equivalent tilted law,
   `T_KB=B+∫₀^.K(s)B_sds=W` is Brownian; hence its law under
   Wiener measure is equivalent to Wiener measure on `C₀([0,T])`. State T<∞ and K continuous
   (thus bounded) on [0,T]; this conclusion uses the linear-growth stopped argument, not a
   blanket Novikov assertion for arbitrary adapted drifts.

### 7.5 finite versus infinite horizon

Bounded drift gives each finite-horizon L² density.
   For bounded Borel nonanticipative drift functionals on canonical Wiener paths,
   construct the infinite-path law by finite-time consistency and countable-projective
   restriction/continuity; this does not assert extension on an arbitrary original Ω. Infinite
   equivalence requires a UI density martingale with terminal density positive P-a.s.; nonzero constant
   drift laws are singular at infinity by `B_t/t` limits. For bounded Borel drift b and f∈C¹ with f′ locally absolutely continuous and
   `½f″+bf′=0` Lebesgue-a.e., prove and apply the generalized Itô formula for an absolutely
   continuous derivative; this keeps Borel b in scope, unlike C² hypotheses that force b
   continuous wherever f′ is nonzero. With f bounded or f′ bounded and verified moment bounds,
   prove the drifted harmonic ODE
   representation for every t≥0: with P^x the Brownian law started at x,
   `f(x)=E_{P^x}[f(B_t) exp(∫₀ᵗb(B_s)dB_s−(1/2)∫₀ᵗb(B_s)²ds)]`.
   This equals E_(Q^x)f(B_t) under the drifted law; prove the needed moment/UI
   bounds for the bounded-f or bounded-f′ alternatives.

### Examples

For M_t=2B_t and A_t=4t, the DDS process W_s=2B_(s/4) has variance s and W_(A_t)=2B_t. With θ=2,T=3, the positive density tilts the Brownian mean to 6 and subtracting 6 restores zero.

### Dependencies

*Needs:* Layers 3–5 for integrals, brackets, Lévy and stochastic exponentials; Layer 1 for independent Brownian extensions when the clock stops. Deterministic inverse-clock and stopping-filtration constructions are §7.1 inputs to DDS.

## Layer 8: Cameron–Martin and Wiener translations

Prove `cameronMartin_equivalence` and `cameronMartin_singularity` for every finite
horizon T≥0 and every continuous deterministic shift h on [0,T]. Mutual absolute
continuity holds exactly when there exists a strongly measurable L² velocity u with
`h(t)=∫₀ᵗu(s)ds` for all t≤T, expressed by `IsCameronMartinShift`; otherwise the
translated and original laws are mutually singular (Revuz–Yor, Chapter VIII, §1).
The density statement is `cameronMartin_pushforward`. At T=0 equivalence means
h(0)=0; a nonzero h(0) gives two disjoint Dirac laws.


### 8.1 Gaussian supplier

Construct the Gaussian Banach-space Cameron–Martin RKHS,
   continuous injection and isonormal coordinates here, following the Mathlib Cameron–Martin proposal's design and
   names, including `cameronMartin` and `cmCoe`; adopt native declarations with this interface. Build the finite-moment dual
   closure, inner-product/completion/evaluation range identities, Gaussian coordinate laws,
   positive translation density and inverse/equivalence. Discharge missing total-variation
   distance bounds needed by non-RKHS translation singularity; there is no placeholder TV
   axiom in the completed theorem. Do not duplicate Mathlib's finite-dimensional Gaussian
   transforms or the external design's norms on a conflicting type.

### 8.2 Wiener identification

Prove that the Wiener RKHS consists exactly of
   `h(0)=0`, h absolutely continuous and h′∈L²(0,T), isometrically with norm²=∫‖h′‖².
   Its isonormal coordinate equals the deterministic S3 integral ∫h′·dB. Construct translation
   on based continuous paths and its cylinder/Borel measurability for every continuous based
   shift.
   For every continuous based deterministic shift h and every finite grid
   0≤t₁<⋯<t_k≤T, compute the translated coordinate-vector law of B+h: it is
   Gaussian with mean (h(t_i))_i and covariance (min(t_i,t_j))_(i,j) for standard
   centered real Brownian B. Prove independence of disjoint increments and their
   normal laws with mean h(t)−h(s) and variance t−s. Prove these finite-dimensional
   law statements for every such h, independently of the Cameron–Martin density
   criterion.
   For Cameron–Martin shifts prove preservation of the completed Wiener sigma-algebra
   in both directions, using the positive density identity to transport null sets. Prove density
   `exp(∫h′·dB−½∫‖h′‖²)` for the **pushforward** under ω↦ω+h, and singularity for a
   continuous shift outside this space. Prove translation composition/density cocycle,
   restriction and vector/isometry transport. An equivalent finite-horizon shift law is not
   a pathwise derivative of Brownian motion.
   For an arbitrary continuous shift, transport completions with respect to its pushforward
   law; Borel measurability alone does not assert preservation of the original Wiener completion.

### 8.3 constructive proof dictionary

Polygonal interpolation through finite grids,
   uniform approximation, Gaussian finite-grid translation and energy convergence. Make the
   finite-grid-to-Wiener-density construction explicit for every Cameron–Martin h, with only
   h absolutely continuous and u=h′∈L²(0,T), T>0. On the dyadic grid
   `t_i=iT/2^n`, put `Δ_i=t_i−t_(i−1)`, `a_i=h(t_i)−h(t_(i−1))`, and
   let u_n equal `a_i/Δ_i` on `(t_(i−1),t_i]`. Prove u_n is the orthogonal
   L² projection of u onto the grid-step functions, `‖u_n‖₂²=Σ_i a_i²/Δ_i`,
   `‖u_n‖₂²↑‖u‖₂²` and u_n→u in L². This uses interval averages of u;
   no pointwise derivative tags or mean-value theorem for an a.e. derivative are needed.

   On based Wiener space define `G_n=σ(B(t_i):0≤i≤2^n)` and
   `I_n=Σ_i(a_i/Δ_i)(B(t_i)−B(t_(i−1)))`,
   `D_n=exp(I_n−½‖u_n‖₂²)`. From the independent Gaussian increment law prove
   the exact translated finite-grid density D_n for the map B↦B+h. In particular,
   for bounded Borel F depending only on this grid,
   `E[F(B+h)]=E[F(B)D_n]`. Prove the analogous product-Gaussian formula for
   arbitrary finite grids with positive interval lengths. The small-cylinder ratios
   of the handwritten solution are a finite-dimensional calculation, not a theorem
   identifying the density by shrinking events to individual Wiener paths.

   Construct the jointly Gaussian deterministic Wiener-integral adapter from S3's
   isometry and finite step approximations. For `I=∫u dB`, prove I−I_n is independent
   of G_n, centered Gaussian with variance `‖u‖₂²−‖u_n‖₂²`: its covariance with
   each grid coordinate vanishes by the projection property. For
   `D=exp(I−½‖u‖₂²)` deduce `E[D|G_n]=D_n`, hence the nonnegative
   likelihood martingale and its mean1 normalization. Prove, for every real p,
   `E[D_n^p]=exp(p(p−1)‖u_n‖₂²/2)` and
   `E[D^p]=exp(p(p−1)‖u‖₂²/2)`, with integrability of these positive real powers.
   For p>1 this gives uniform Lᵖ bounds. Establish the exact error
   `E[(D−D_n)²]=exp(‖u‖₂²)−exp(‖u_n‖₂²)`, and convergence almost surely and
   in every Lᵖ, 1≤p<∞, using conditional-expectation convergence and the higher
   moment bounds. All projections and conditional expectations retain their actual
   L² or L¹ carriers; finite-grid likelihoods are not pathwise Brownian derivatives.

   Since the nested grids generate the based path-space Borel σ-algebra, extend
   the finite-grid identity to bounded Borel functionals and then nonnegative
   measurable ones by a monotone-class argument. Obtain the positive-sign pushforward
   density D and the inverse-shift density with u replaced by −u, proving equivalence
   from strict positivity. This constructs S8.2's Wiener density without assuming it
   in the conditional-expectation step. At T=0 both laws are the point mass at the
   zero path and the density is1. [CameronMartinGridTargets.lean](CameronMartinGridTargets.lean)
   records the finite independent-Gaussian density and moment signatures.

   The source's stronger
   derivative-BV case gets a pathwise Stieltjes integral, Abel-sum uniform bounds on bounded
   path sets, continuous-functional translation, generating-cylinder/null-set extension and
   RN uniqueness. Connect this proof to S8.2, including Gaussian linear-functional MGF/entire
   extension. For the source BV linear functional I and complex z, prove integrability
   and local parameter continuity of exp(zI) using the bound `|exp(zI)|≤exp(MI)+exp(−MI)`
   on |z|≤M. Use the finite real exponential moments, Fubini for finite smooth contours,
   Cauchy's theorem for exp(zI), Morera and the identity theorem to obtain the entire
   extension from the real MGF identity. Consume
   `Complex.isConservativeOn_and_continuousOn_iff_isDifferentiableOn` in
   `Mathlib/Analysis/Complex/HasPrimitives`, matching its rectangle-integral formulation. Mean-value Riemann sums alone are not justified for arbitrary a.e. derivatives.
   Check h(t)=t²: energy½∫₀ᵀ4t²dt=2T³/3 and the positive-coordinate pushforward sign.

   For the derivative-BV case on [0,1], let h(0)=0, h′ exist everywhere and
   have bounded variation. Define the pathwise cross term by integration by
   parts `I(h,x)=h′(1)x(1)−h′(0)x(0)−∫x dh′`, and identify it with the S3
   deterministic Wiener integral almost surely. With
   `J(h,x)=exp(−½∫|h′|²−I(h,x))`, prove the source change-of-variables identity
   `∫F(y)dW(y)=∫F(x+h)J(h,x)dW(x)` for continuous F bounded on bounded
   uniform-norm sets and integrable under W. The pushforward density for x↦x+h
   is instead `J(−h,x)`. Establish both signs from the finite Gaussian density;
   a page ending halfway through the exponent does not give a second identity
   omitting the cross term. Prove I(h,·) is a continuous linear functional on
   the based uniform-norm path space, hence J(h,·) is measurable and strictly
   positive. Apply the continuous-functional identity to F=1 to prove
   `J(h,·)∈L¹(W)` and `∫J(h,x)dW(x)=1`; use this integrable density for the
   weighted dominated-convergence steps below.

   Own the following explicit approximation API. Polygonal interpolation L_n
   is linear, sup-norm nonexpanding and determined continuously by its grid
   coordinates.
   For every integer n≥1 on [0,1], let P_n be the subspace of based continuous
   paths affine on each interval of the equal n-grid, with its inherited uniform
   topology. Define q_n(x)=(x(1/n),…,x(1)) and construct the continuous linear
   interpolation map i_n:ℝⁿ→P_n, taking the initial value to be zero. Prove
   q_n∘i_n=id and i_n∘q_n=L_n, where the latter equation uses the inclusion
   P_n→C₀([0,1],ℝ). Prove that q_n restricted to P_n is a homeomorphism with
   inverse i_n; the grid sup norm equals the interpolated path sup norm. For
   every real-valued functional F on the based continuous-path space, set
   H=F∘i_n (with that same inclusion) and prove F∘L_n=H∘q_n. If F is continuous
   for the uniform topology, prove H is continuous on ℝⁿ.
   Set `C_M={‖x‖∞≤M}` and `C_M^n={‖L_n x‖∞≤M}`; prove dyadic
   nesting/intersection and exhaustion by C_M. For a grid with N intervals and
   tags ξ_i in interval i, prove the correctly indexed Abel identity
   `Σ_(i=1)^N h′(ξ_i)(z_i−z_(i−1))
   =h′(ξ_N)z_N−h′(ξ_1)z_0−Σ_(i=1)^(N−1)(h′(ξ_(i+1))−h′(ξ_i))z_i`.
   With z=h/2+x, derive the uniform energy-plus-cross-sum bound from the
   variation and sup norm of h′. For the translated truncated sets
   `{x:x+h∈C_M^n}`, apply this bound to the grid values
   `z_i=(x+h)_i−h_i/2`, whose norms are at most `M+‖h‖∞/2`;
   do not assume these x lie in C_M. Prove weighted dominated convergence on
   these sets and then exhaustion, applying the nonnegative argument to |F|
   before deducing absolute integrability and the signed formula.

   For semi-open cylinder rectangles `(α_i,β_i]`, construct continuous ramps
   with exactly that pointwise endpoint limit; include infinite rays and the
   whole line using one-sided ramps and the constant 1. Prove finite-coordinate
   refinement/disjoint-union and countable-union/decreasing-intersection APIs,
   Gaussian inner/outer approximation of arbitrary cylinder bases, and the
   completed-set representation `Γ=G\N` with G a decreasing intersection of
   countable cylinder unions and N null. For outer approximation adjoin ∅ and the whole
   space to the cylinder algebra, restrict Wiener measure to an `AddContent`, and use native
   `AddContent.measure`, `OuterMeasure.ofFunction_eq_iInf_mem` and
   `MeasureTheory.ext_of_generate_finite` to obtain countable algebra covers with arbitrarily small
   excess. Cover the Borel null envelope as well for completed sets. Refine each algebra
   set into finitely many cylinders. Use S1.2 to identify the generated sigma-algebra
   with path-space Borel sets. Use the positive density identity to
   transport null sets and prove that both translation and inverse translation
   preserve the completed Wiener sigma-algebra. Export the weighted integral
   identity on every such Γ for nonnegative extended-valued F, then for signed
   extended F whenever its positive and negative integrals are not both infinite;
   for real Bochner integrals prove equivalence of absolute integrability.

### Examples

For h(t)=2t on [0,3], the velocity is 2, energy is 12 and density is exp(2B₃−6). For h(t)=sqrt(t) on [0,1], the derivative-square integral is infinite; the translated law is singular. For h(0)=1, the initial evaluations already separate the two laws.

### Dependencies

*Needs:* Layers 1 and 3 for Wiener laws and deterministic Brownian integrals; §8.1 constructs the missing Gaussian RKHS translation interface in the stated external design. Layer 0.0 finite-measure uniqueness supplies the finite-grid extension route.

## Layer 9: Strong and weak SDEs, flows and approximation

### 9.1 solution theory

Prove `exists_strongSolution` and
   `strongSolution_pathwise_unique` for scalar Borel coefficients with spatial Lipschitz
   and growth constants bounded on each finite time horizon, Brownian noise relative to F,
   and arbitrary finite F₀-measurable initial data (Karatzas–Shreve, §5.2).
   The uniqueness statement needs the Lipschitz hypothesis and two existing solutions;
   it needs neither a separate growth premise nor a moment premise on their common initial data.
   For b(t,x)=tx and σ=0, L_T=T is valid although there is no global time-uniform constant.
    Coefficients `b(t,x):V`, `σ(t,x):H→L[ℝ]V`, adapted initial
   ξ and Brownian noise relative to the chosen basis; define the stochastic integral equation,
   solution law, stopping/restart and indistinguishability. Global spatial Lipschitz and linear
   growth, measurability in t and finite-horizon uniform constants give strong existence,
   pathwise uniqueness, moment estimates and stability. In the full finite-dimensional
   bounded globally Lipschitz case of textbook Theorem 6.2.3, let the two solutions use the
   same Brownian noise and F₀-measurable initial states with `X₀−Y₀∈L²`; neither individual
   initial state need be L² for this difference estimate. If the drift Lipschitz constant is
   K_b and the diffusion Lipschitz constant in Hilbert–Schmidt norm is K_σ, prove
   `E sup_(u≤T)‖X_u−Y_u‖² ≤ 3 E‖X₀−Y₀‖² exp(c_T T)` with the explicit valid choice
   `c_T=3T K_b²+12K_σ²`. Derive the three-term bound by Cauchy–Schwarz, the Hilbert-valued
   Doob L² inequality and Itô isometry, then apply Gronwall. This realizes the source's
   `c_T T` convention without assigning an unprinted value to its constant. Prove
   indistinguishability for the same initial state on a common basis and law uniqueness
   separately. Construct Picard iterates, the finite
   L² contraction or factorial estimate, continuous versions, horizon stitching and adaptedness.
   For the linear-growth construction take jointly measurable adapted inputs Y with
   `∫₀ᵀ‖Y_s‖²ds<∞` a.s. for every finite T; the L² Picard iteration starts in
   `E∫₀ᵀ‖Y_s‖²ds<∞` with an L² initial value. Define the Picard map on this domain by
   `Φ(Y)_t=Y₀+∫₀ᵗb(s,Ỹ_s)ds+∫₀ᵗσ(s,Ỹ_s)dW_s` using one common Brownian motion,
   where Ỹ is the S0.2 progressive modification of a jointly measurable adapted
   input Y. Both the drift integral and the stochastic integral use this same
   progressive representative, preserving their adaptedness on arbitrary
   filtrations. S0.2's finite-horizon modification-to-product-a.e. Fubini theorem proves independence of the
   chosen representative, and continuous output versions make Φ(Y) unique up to
   indistinguishability. Include the
   bounded, globally spatially Lipschitz coefficient/common-noise Picard difference estimate
   for all adapted jointly measurable inputs Y,Z with only `Y₀−Z₀∈L²`: on each finite horizon state the estimate
   `E sup_(u≤t)‖Φ(Y)_u−Φ(Z)_u‖² ≤ 3 E‖Y₀−Z₀‖²
   + C_T E∫₀ᵗ‖Y_s−Z_s‖² ds`,
   with constants from the coefficient bounds/Lipschitz constants and horizon. Interpret the
   right side as an extended nonnegative expectation, so an infinite value gives a vacuous
   bound. Define the left side with the supremum over rational u∈[0,t], adjoining t,
   and prove agreement a.s. with the continuous-version supremum. Thus the raw supremum
   is AEMeasurable; no everywhere-continuous raw version is assumed.
   Obtain progressive modifications from S0.2 and use its finite-horizon
   modification-to-product-a.e. Fubini theorem
   for integral inputs, without separate L² assumptions on Y or Z or an assumption that their
   pathwise suprema are measurable. State inherited bounded coefficient/common noise hypotheses. Prove
   the signed integral Gronwall inequality on each finite horizon: for integrable signed f,g,
   if `f(t)≤g(t)+c∫₀ᵗf(s)ds` a.e. and `c≥0`, then
   `f(t)≤g(t)+c∫₀ᵗexp(c(t−s))g(s)ds` a.e. Nonnegativity of f,g is not required; the inequality requires c≥0. Start with ξ∈L² for
   the estimate, then truncate ξ to obtain mere F₀-measurable initial data under the same
   global Lipschitz/linear-growth hypotheses, using F₀ truncation and locality of the solution
   map. Do not impose an unnecessary L² initial condition on every existence theorem. For
   pathwise uniqueness with only a finite a.s. F₀-measurable common initial value, localize before
   the expectation/Gronwall step: on `{‖ξ‖≤m}`, stop both solutions at their first exit from a
   ball of radius R>m. The stopped coefficients and initial values are bounded, so the usual
   BDG/Itô estimate for the stopped difference is finite; Gronwall with zero initial difference
   gives equality up to that stop. Let R→∞ on each finite horizon, then m→∞. Record that the
   unlocalized estimate needs these localization and limit steps; do not assume the original
   random initial value is L² merely to make the proof estimate finite.

### 9.2 local and maximal solutions

Local spatial Lipschitz uniformly on compact
   time/state regions, locally bounded coefficients, exit-ball localization, compatible
   truncated solutions and explosion time. Prove maximality/uniqueness and no finite explosion
   under a coercive C² Lyapunov function with finite-horizon generator bound `L_tV≤C_T(1+V)` for t∈[0,T]; the source's
   `‖σ(x)‖_HS²≤C(1+‖x‖²)` and `⟨x,b(x)⟩≤C(1+‖x‖²)` is a corollary via1+‖x‖².
   This is weaker than imposing linear growth of the full drift. Initial moment estimates
   require corresponding moments; nonexplosion itself is localized in the initial state.

### 9.3 weak theory

Weak solutions as actual probability spaces/laws satisfying the
   integral identity. For finite-dimensional V construct weak solutions to
   `dX_t=b(t,X_t)dt+dW_t`, with standard V-valued Brownian W and diffusion id,
   by canonical Girsanov for bounded Borel b. Extend to locally bounded Borel b
   under `⟨x,b(t,x)⟩≤C_T(1+‖x‖²)` for every t∈[0,T], x∈V, each finite T,
   with C_T≥0. This is S9.2's quadratic Lyapunov bound for the additive-noise equation.
   Start at a deterministic `x∈V`; then cover every probability initial law ν by the
   independent product of `ξ∼ν` and centered Brownian motion. The exit estimate for
   `1+‖X‖²` uses a finite initial second moment. For arbitrary finite-a.s. ξ, prove
   it on the `F₀` events `{‖ξ‖≤m}`; let the exit radius tend to infinity for fixed m,
   then m tend to infinity. Establish `E[Z_T|F₀]=1` for the constructed density, so
   the initial law is preserved without imposing an unnecessary global moment.
   For locally bounded Borel b with `⟨x,b(t,x)⟩≤C_T(1+‖x‖²)`, prove the true-martingale
   Girsanov extension without Novikov: stop at exit balls; on each stopped interval bounded
   drift gives a martingale density. Under the stopped tilted laws, bound exit probabilities
   uniformly by Itô applied to `1+‖X‖²` and Gronwall. Let the radius increase to prove
   expectation one for the finite-horizon density. Prove finite-horizon consistency, preservation
   of the initial law and the canonical infinite-path law by restriction to all finite horizons;
   claim equivalence only on each finite horizon. Prove uniqueness in law for the additive-noise
   locally bounded Borel drift/Lyapunov regime, including the OU weak-law construction. Prove
   both Yamada–Watanabe conclusions: pathwise uniqueness plus weak existence gives a measurable
   strong solution and uniqueness in law. On Polish path spaces disintegrate
   over `(ξ,W)`, with ξ the initial value. Own the nonanticipation compatibility
   lemma: the conditional law of `X|_[0,t]` given `(ξ,W)` has a version
   measurable in `σ(ξ,W|_[0,t])`. Prove it by independence of future Brownian
   increments from F_t and a cylinder π–λ argument. For two possibly distinct
   weak solutions with the same initial law, `(ξ,W)` has the same product law;
   couple their conditional solution kernels independently over this common
   pair. Use compatibility to prove W remains Brownian in the joint filtration
   generated by ξ,W and both solution pasts, and that both equations still hold
   there. Pathwise uniqueness then makes the coupled solutions equal. Applying
   this first to two copies of one kernel proves it is Dirac almost surely;
   applying it to the two different kernels proves the Dirac values agree.
   Extract a measurable solution map and prove its nonanticipating versions
   from the same compatibility lemma, giving a strong solution on any basis
   carrying the prescribed initial variable and Brownian noise, and uniqueness
   of the solution law for every prescribed initial law.

### 9.4 named examples

For the scalar OU equation `dX_t=−λX_tdt+σdB_t`, state and prove
   `X_t=e^(−λt)X₀+σ∫₀ᵗe^(−λ(t−s))dB_s` for finite F₀-measurable X₀. For integrable X₀ prove `E[X_t|F₀]=e^(−λt)X₀`; no ordinary L¹ conditional expectation is asserted for an arbitrary finite nonintegrable initial value. With `Z_t=σ∫₀ᵗe^(−λ(t−s))dB_s`, for λ≠0 and s≤t its noise covariance `Cov(Z_s,Z_t)` is `σ²e^(−λ(t−s))(1−e^(−2λs))/(2λ)` (for λ=0 it is `σ²s`). When λ>0 and X₀ is independent centered Gaussian with variance `σ²/(2λ)`, prove the stationary covariance `Cov(X_s,X_t)=σ²e^(−λ|t−s|)/(2λ)`. Retain the general locally bounded drift/Lyapunov theorem as a separate result. Include deterministic
   matrix linear equations/variation of constants, and constant-coefficient GBM
   `dS_t=μS_tdt+σS_tdW_t` for μ,σ∈ℝ, including σ=0. For finite F₀-measurable
   S₀ prove the unique solution `S_t=S₀ exp((μ−σ²/2)t+σW_t)` and positivity
   when S₀>0. For p>0 and E|S₀|^p<∞ prove
   `E|S_t|^p=E|S₀|^p exp((pμ+p(p−1)σ²/2)t)` using independence of Brownian
   increments from F₀. More generally, for progressive real coefficients μ,σ with
   `∫₀ᵀ(|μ_s|+σ_s²)ds<∞` a.s. on every finite horizon, and finite F₀-measurable S₀,
   construct the unique continuous adapted solution up to indistinguishability
   `S_t=S₀ exp(∫₀ᵗσ_s dW_s+∫₀ᵗ(μ_s−σ_s²/2)ds)`.
   Build the progressive stochastic-integrand version and localization adapter using S3.4;
   prove existence by Itô and uniqueness by the stopped inverse integrating factor from
   S5.1/S5.4. Include S₀=0 and σ=0; positivity is asserted when S₀>0. No initial moment
   assumption is imposed for existence or uniqueness. For deterministic μ,σ and deterministic
   S₀>0, identify the Gaussian law of log S_t. For p>0 and E|S₀|^p<∞, with deterministic
   μ,σ and F₀-measurable S₀, prove
   `E|S_t|^p=E|S₀|^p exp(p∫₀ᵗμ_s ds+(p(p−1)/2)∫₀ᵗσ_s² ds)`.
   For progressive random μ,σ bounded on [0,T] by deterministic K_μ,K_σ≥0 and the
   same initial p-moment, prove for t≤T
   `E|S_t|^p≤E|S₀|^p exp((pK_μ+max(p(p−1),0)K_σ²/2)t)`
   using the true stochastic exponential of pσ and its conditional expectation at F₀.
   An adapted random σ does not by itself make its stochastic integral Gaussian. FinancialMathematics M0.1 and
   MarketImpact consume this generic theorem for their asset models; M0.4 owns pricing.
   Also construct Brownian bridges up to terminal time, radial Bessel for integer dimension≥2/positive start,
   inverse three-dimensional Bessel as a positive strict local martingale, hyperbolic solution
   `X_t=sinh(C+t+B_t)` solving
   `dX=(√(1+X²)+X/2)dt+√(1+X²)dB`, and Lamperti/Stratonovich transforms on intervals where inverse derivatives
   and initial values are valid. For the source equation
   `dY=f(Y)dX+f(Y)d[X]`, let X be a continuous local martingale, f∈C¹(ℝ),
   and first work on a usual basis; also export the raw-filtration adapter of S3.4.
   For every finite F₀-measurable initial Y₀, construct the unique maximal solution
   on the original probability space, up to explosion. Build the continuous-driver
   version of S9.2's Picard argument here using the S3 isometry/Doob bounds on small
   bracket-clock slices and localization of f and the initial state. Its drift clock
   is [X], not Lebesgue time. Prove compatibility under stopping and extension of the
   driver. For this particular scalar equation also prove nonexplosion for every
   f∈C¹(ℝ), without imposing linear growth: use the coercive C² function
   `V(y)=log(1+y²)`. Its bracket-clock drift is
   `LV=2y f(y)/(1+y²)+(1−y²)f(y)²/(1+y²)²`.
   For y²≥2, put u=f(y)/(1+y²) and prove `2yu+(1−y²)u²≤2`
   by completing the square. On a compact interval continuity of f bounds LV above,
   hence LV≤C globally. Stop additionally at [X]=n and |Y|=R; Itô and the
   martingale expectation give the exit-probability bound with denominator log(1+R²).
   First restrict to each F₀-event {|Y₀|≤m}, so no initial moment is assumed.
   Let R→∞, then m,n→∞, using [X]_T<∞ a.s. for every finite T. Conclude the
   maximal solution is global on the driver's time domain. Inverse-chart exit remains
   a separate restriction on the g-representation, not explosion of Y.
   For the representation, take g∈C²(I) on an open interval I with `g′=f∘g`,
   F₀-measurable z₀∈I and `Y₀=g(z₀)`, and center X at X₀.
   Preserve this C¹ generality: it does not imply local Lipschitz continuity of `f′∘g`.
   On a branch with g′≠0, define Z=g⁻¹(Y) on the original space and apply Itô to get
   `Z_t=z₀+X_t−X₀+[X]_t−½∫₀ᵗf′(g(Z_s))d[X]_s` and Y=g(Z), until inverse-chart exit.
   Prove local pathwise uniqueness by transferring to Y, rather than assuming the
   transformed drift is locally Lipschitz. If g′ vanishes at the starting point,
   use uniqueness for `g′=f∘g` to identify its connected constant branch;
   the matching root `f(Y₀)=0` gives the constant Y solution. Treat this case separately.
   Use S7.2 DDS on X−X₀ only for the Brownian-clock representation. The original Y and Z
   have already been constructed; on a finite-clock product extension use their pullbacks,
   so no new solution is silently descended from the enlarged space. Prove the inverse-clock
   identities up to the available bracket horizon and constancy on flat clock intervals.
   In Brownian clock U=g⁻¹(V) satisfies `dU=dW+[1−½f′(g(U))]du`, where
   `dV=f(V)dW+f(V)du`. Then `K_u=U_u−W_u` satisfies the random ODE
   `K′_u=1−½f′(g(W_u+K_u))`, K₀=z₀. State its adaptedness and branch interval;
   the uniqueness obtained above is for the adapted stochastic solutions, not for every
   continuous driving path. Global existence requires nonexplosion, and the local
   formula is restricted to the common maximal interval and inverse-chart exits.
   For the arcsin–sech example, retain the source branch z<C and prove the global
   extension `g(z)=2 arctan(exp(z−C))`, agreeing with that branch and satisfying g′=sin g.
   Give both the stopped branch formula and the global-extension model with their initial ranges.
   For the scalar autonomous ODE `z′(t)=1−½tanh(C−z(t))`, define
   `F_C(z)=−(4/3)(C−z)−(2/3)log(2cosh(C−z)−sinh(C−z))`.
   Prove positivity of the logarithm's argument and
   `F_C′(z)=1/(1−½tanh(C−z))`, with `2/3<F_C′(z)<2`.
   Deduce that F_C is a strictly increasing smooth bijection of ℝ and that the unique global
   solution starting at z₀ is `z(t)=F_C⁻¹(t+F_C(z₀))`.
   For z₀<C its first hit of C is `F_C(C)−F_C(z₀)`, a finite positive time;
   the arcsin–sech branch representation therefore still has its stated interval.
   The Brownian-clock representation above uses the random ODE for K with W_u in
   its coefficient; the autonomous formula supplies the separate deterministic ODE target.
   [AutonomousODE.lean](AutonomousODE.lean) suggests its scalar derivative and solution interfaces.
   In the arcsin–sech case, f′∘g is nonconstant on every open branch interval, so the
   failed `h(X,[X])` calculation rules out a C² function satisfying the displayed
   coefficient equations on an open state region. This obstruction is not asserted for
   arbitrary f: for f(y)=y in the exponential chart g=exp, the explicit
   `h(x,a)=z₀+x+a/2`, x=X−X₀, retains the initial chart value z₀. It does not prove impossibility
   of every representation for a particular driver or initial state.
   Include this explicit linear system for independent standard Brownian coordinates A,B:
   `dX=(X+Y)dt+t dA+dB`, `dY=Ydt−t dB`, `(X₀,Y₀)=(C₁,C₂)∈ℝ²`.
   Prove on every finite horizon
   `Y_t=eᵗ(C₂−∫₀ᵗs e⁻ˢdB_s)` and
   `X_t=eᵗ(C₁+tC₂+∫₀ᵗs e⁻ˢdA_s+∫₀ᵗ[1−s(t−s)]e⁻ˢdB_s)`.
   Use the integrating-factor identity `∫₀ᵗs e⁻ˢdB_s=C₂−e⁻ᵗY_t` and
   prove the deterministic-kernel stochastic-Fubini step on finite horizons.
   Derive `E[Y_t]=C₂eᵗ` and `E[X_t]=(C₁+tC₂)eᵗ`, with actual finite second
   moments of the deterministic-kernel integrals. For the hyperbolic example,
   require centered B₀=0 and C=arsinh(X₀); state F₀-measurability and the
   corresponding moment conditions separately from pathwise existence.
   For inverse three-dimensional Bessel started at a fixed deterministic x≠0, prove finite
   second moments and a uniform-in-time L² bound depending on x, and prove that no deterministic
   pathwise bound holds. Distinguish L²-boundedness from a bounded local martingale;
   the latter is a true martingale under S2.4's adaptation hypotheses.

   **S9.4a radial Bessel processes and their kernels.** For every integer d≥2 and
   deterministic r>0, construct the unique global positive strong solution of
   `dR_t=((d−1)/(2R_t))dt+dW_t`, `R_0=r`. Work first on annuli `(ε,A)` with
   S9.2's local Lipschitz construction. Prove nonattainment of 0 using the stopped
   harmonic scale functions log r for d=2 and r^(2−d) for d>2; use the R²
   Lyapunov estimate to exclude finite explosion. Local pathwise uniqueness and
   these exit estimates give global uniqueness. For d-dimensional standard Brownian motion B started at zero and deterministic x≠0,
   prove the radial identification `R_t=‖x+B_t‖` and the stochastic-integral identity
   `W_t=Σ_i∫_0^t ((x+B_s)^i/‖x+B_s‖)dB_s^i`.
   Use S3's selected strongly progressive stochastic integral for W, retaining its literal
   strong adaptation and common-null continuity. Compute all cross brackets, prove
   `[W]_t=t` and W₀=0, and apply S5.5's adapted original-process Lévy characterization
   on the same filtration; adaptation comes from this construction. The nonhitting proof precedes use of
   the singular coefficients. Prove strong Markov, Brownian scaling and generator
   `Lf(r)=f''(r)/2+(d−1)f'(r)/(2r)` on smooth compactly supported functions in
   `(0,∞)`, with the stopped Itô/martingale identity. Derive the radial strong Markov property by applying
   S6.1 to vector Brownian motion and the norm map; use orthogonal invariance of standard vector
   Brownian motion to show the conditional radial future law depends on the present vector only
   through its norm. Then identify the radial transition law with
   the S9.2 radial SDE using annular pathwise uniqueness, S9.3's Yamada–Watanabe
   implication from strong existence and pathwise uniqueness to uniqueness in law, and
   nonattainment/nonexplosion to pass from annuli to the global process. Do not defer this
   identification to S9.5 or S10.1.

   The modified Bessel function is StandardDistributions' `Real.besselI` (§8.1), consumed
   on orders ν>−1 and positive arguments: its positive series
   `I_ν(z)=(z/2)^ν Σ_(k≥0) (z²/4)^k/(k! Γ(k+ν+1))`, convergence, positivity, joint
   continuity and measurability, the derivative identity `I_ν'=I_(ν+1)+(ν/z)I_ν`, and the
   adjacent-order recurrence, used here at order ν+1 in the form
   `I_ν−I_(ν+2)=2(ν+1)I_(ν+1)/z`. The sphere measure is the unnormalized
   `volume.toSphere` with total mass `2π^(d/2)/Γ(d/2)` (StandardDistributions §12.1), and
   the spherical integral identity
   `∫_(S^(d−1)) exp(z θ₁)dS=(2π)^(d/2) z^(1−d/2) I_(d/2−1)(z)` for d≥2 and z>0 is the
   von Mises–Fisher normalizer identity of StandardDistributions §12.2 at the unit
   direction θ₁. This milestone uses only these positive-argument facts; it needs no
   complex-order or complex-argument Bessel theory. On top of them prove, for ν≥0 and
   z>0, that `z ↦ I_ν(z)` is smooth and satisfies the modified Bessel equation
   `z²I_ν''+zI_ν'−(z²+ν²)I_ν=0`: differentiate the derivative identity, rewrite
   `I_(ν+1)'` by the derivative identity at order ν+1, and eliminate `I_(ν+2)` and
   `I_(ν+1)` with the recurrence and the derivative identity; only orders ν, ν+1, ν+2,
   all in the supplier's range ν>−1, occur (DLMF 10.25.1, 10.29.1, 10.29.2).
   *Needs:* StandardDistributions §8.1, §12.1, §12.2.

   Put ν=d/2−1. For t,r,y>0 define the Lebesgue transition density
   `p_t(r,y)=(y/t)(y/r)^ν exp(−(r²+y²)/(2t)) I_ν(ry/t)`.
   Derive it by pushing the d-dimensional Gaussian law through the norm and
   integrating the angular variable using the spherical identity. Construct the
   probability kernels on `(0,∞)`, prove measurability, nonnegativity, total mass
   1, and Chapman–Kolmogorov, and identify them with the preceding strong
   solution's transition laws. At t=0 the kernel is δ_r. Prove scaling and
   weak convergence to δ_r as t↓0. Check the d=2 formula with I₀ and the d=3
   formula using `I_(1/2)(z)=sqrt(2/(πz)) sinh z`. In d=3 also evaluate
   `E_r[1/R_t]=(2Φ(r/√t)−1)/r<1/r` for t>0, where Φ is the standard normal
   CDF from S6.2; together with Itô this identifies 1/R as a positive strict
   local martingale. The kernels, their Chapman–Kolmogorov law, the half-integer
   closed form and the inverse-radius expectation are owned here; the function
   `Real.besselI` and its series, recurrence and sphere-integral API are owned by
   StandardDistributions.

### 9.5 solution maps and flows

Under S9.1's global Lipschitz/linear-growth hypotheses,
   construct jointly measurable nonanticipating dependence on time/start/noise, Lp stability
   under its stated moment hypotheses, and the restart identity by pathwise uniqueness and
   the post-stopping Brownian increments from S6.1. Localize this construction in S9.2's
   nonexplosive locally Lipschitz regimes. These measurable maps and restart identities do
   not require spatial differentiability. For each k≥1, spatial `C_b^(k+1)` coefficients, continuous in time with
   uniform bounds on finite time intervals, construct C^k solution flows and their variational SDEs,
   invertibility under explicit global completeness/nonexplosion conditions, and smooth-map
   coordinate compatibility through S5. Translation flow is the basic acceptance case.
   Combine these flows with S6.7's two-sided Wiener shift to construct measurable
   skew-product examples, proving the cocycle law with the shifted noise.

### 9.6 numerical supplier

Euler–Maruyama recurrences and continuous interpolants on
   declared deterministic meshes, Gaussian increment independence and measurability. Under
   global Lipschitz/linear growth, time bound
   `‖b(t,x)−b(s,x)‖+‖σ(t,x)−σ(s,x)‖_HS≤C(1+‖x‖)|t−s|^(1/2)`
   and ξ∈L² prove strong mean-square order ½
   uniformly over finite horizons; give localized consistency/convergence under local hypotheses
   without asserting a global rate. For spatial C_b^7 drift/diffusion and C_b^6 test functions, with time C¹ coefficients
   and uniformly bounded mixed derivatives through those orders on finite horizons,
   prove weak order 1 by the generator expansion; expose the error constants
   and finite-horizon regime. Multiplicative Euler need not preserve positivity, so logarithmic
   finance consumers use a positivity-preserving scheme or proved truncation/good-event control.
   Model-specific nonlinear PDE schemes and statistical market calibration remain the consumer's
   work, not unexplained consequences of generic Euler convergence.

### Examples

For b=σ=0, the solution is X_t=ξ without any moment bound on ξ. For b(t,x)=tx and σ=0, X_t=ξ exp(t²/2), with Lipschitz constant T on [0,T]. Without spatial Lipschitzness, b(x)=2sqrt(|x|),σ=0,ξ=0 admits both X=0 and X_t=t².

### Dependencies

*Needs:* Layers 3–5 and 7 for integral estimates, Itô and changes of measure; Layer 6.1 for strong Markov in the Bessel examples; StandardDistributions §§8.1 and 12.1–12.2 for Bessel/sphere normalizers. Maximal solutions and measurable solution maps are constructed in §§9.2–9.5.

## Layer 10: Diffusions, generators and probabilistic PDEs

### 10.1 kernels and Markov theory

Construct SDE solution-law kernels measurable in
   initial state, transition/Chapman–Kolmogorov identities, independent initial mixtures,
   autonomous Markov semigroups and time-inhomogeneous two-parameter evolution kernels,
   strong Markov in the well-posed nonexplosive S9 regimes. For strong solutions use S9.5's
   measurable nonanticipating solution/restart map, S9.1–S9.2 uniqueness and S6.1's post-stopping
   Brownian increments. For S9.3's weak-law regimes, prove that the conditional restarted
   process is a weak solution with the stopped initial state, then identify its law by S9.3's
   uniqueness in law and conditional compatibility. Supply stopping-time approximation with
   the applicable stability and measurability hypotheses. The martingale-problem formulation is constructed
   separately in S10.2.
   Use native ProbabilityTheory.Kernel and IsMarkovKernel for transition laws.
   Use ZeroAtInftyContinuousMap V ℝ for the C₀ Banach space and the
   OneParameterSemigroups Part A StronglyContinuousSemigroup, with its LinearPMap
   generator and shared resolvent R(λ,A), for the autonomous Feller action.
   Feller continuity under global Lipschitz coefficients using S9 stability. For C₀
   preservation prove the compact-escape condition `P_x(X_t∈K)→0` as x leaves every compact
   set, for each compact K; bounded drift/diffusion is a sufficient target regime. Prove strong
   continuity in the C₀ sup norm under those bounds, and construct killed/stopped kernels on
   domains with their Feller conditions. Consume generic kernel and semigroup structures; do not call every diffusion
   semigroup C₀ without verifying its function space and norm continuity.

### 10.2 generators and martingale problems

Define
   `Lf=⟨b,Df⟩+½trace(σσ*D²f)` on its declared smooth test domain and prove
   `f(X_t)−f(X₀)−∫Lf(X_s)ds` local martingale, integrable Dynkin identities and stopped
   occupation formulas. Equivalence of weak SDE laws with the specified martingale problem. For the reverse
   direction construct the measurable finite-dimensional Moore–Penrose inverse of σ by
   regularized inverses and spectral calculus, prove the range/projection identities, and
   construct the driving Brownian motion from the coordinate local martingale plus independent
   noise on an extension. Retain the coordinate martingale's literal strong adaptation,
   use S3's selected progressive integrals against it, and prove that these remain strongly
   adapted in the extended filtration. Prove common-null continuity, the zero start and
   all matrix brackets of the reconstructed noise before using S5.5's vector Lévy
   characterization. A bare-locality input first uses S5.5's predictable-version interface;
   do not claim the arbitrary raw representative is adapted. Rank-changing/degenerate σ must
   not be treated as invertible. Prove conditional-law measurability and strong-Markov
   well-posedness. For autonomous bounded spatial C_b^4 coefficients prove that C_c^∞ is a
   core for the C₀ Feller generator. Use OneParameterSemigroups Part A's single
   StronglyContinuousSemigroup/LinearPMap generator and resolvent API, including
   the native resolvent API. State and prove here the exact equivalence for this generator: for λ in the resolvent set and linear D≤A.domain, density of (λI−A)(D) is equivalent to graph-norm density of D, expressed by density inside native A.graph.
   The shared bounded resolvent is continuous into that graph via
   A(Ry)=λRy−y. This roadmap proves the diffusion-specific dense-range premise.
   Construct smooth-data resolvents using flow
   derivative bounds, approximate with cutoffs/mollifiers in graph norm, and prove
   dense resolvent range. Identify the generator with the closure of L in this regime;
   no such identification is inferred for other coefficients without their own core proof.
   For the SC Brownian reference process `W_r`, identify the C₀ Feller generator as the closure of
   `(1/2)Δ` on `C_c^∞`, using the heat-semigroup law and this core theorem.
   Time-inhomogeneous coefficients use the two-parameter evolution family, not an autonomous
   C₀ semigroup. The forward equation for solution-law measures is proved in weak/distribution form by
   Itô plus Fubini and compactly supported smooth tests. For bounded spatial C_b^4
   coefficients continuous in time, S9.5 flow derivatives and dominated differentiation
   construct the backward C^(1,2) solution for C_b^4 terminal data; prove the time
   derivative using the Markov/difference-quotient argument, not a missing PDE theorem.

### 10.3 Feynman–Kac

Write
   `L_tu=⟨b(t,x),∇u⟩+(1/2)tr(σ(t,x)σ(t,x)*D²u)` and fix the backward
   terminal-value convention `∂_t u+L_tu+q(t,x)u+f(t,x)=0`, `u(T,x)=φ(x)`.
   Prove, for the solution X started from x at time t,
   `u(t,x)=E_(t,x)[exp(∫_t^T q(r,X_r)dr)φ(X_T)
     +∫_t^T exp(∫_t^s q(r,X_r)dr)f(s,X_s)ds]`.
   Killing by V≥0 means q=−V. Use the stochastic product rule for representation
   and uniqueness for
   `u∈C^{1,2}([0,T)×ℝ^d)∩C([0,T]×ℝ^d)` with its prescribed terminal data,
   bounded or uniformly polynomial growth and the corresponding S9 moments. Bounded signed potential
   is allowed on finite horizons by exponential bounds; unbounded/sign-indefinite potentials
   require named exponential-integrability/UI hypotheses. Prove the converse regularity/existence
   statement here for spatial C_b^4 drift/diffusion/potential/source and terminal data,
   with uniform finite-horizon bounds and continuous time dependence, using S9.5 flow
   derivatives and the S10.2 Markov time-derivative argument. This constructs C^(1,2)
   regularity without requiring ellipticity. For the polynomial-growth representation
   theorem, a supplied C^(1,2) solution and the proved moment/UI bounds remain hypotheses;
   smoothness of an arbitrary expectation is not inferred. Deterministic PDE supplies
   only its explicitly specified harmonic/elliptic/weak-parabolic tools.

### 10.4 stopped Schrödinger/Dirichlet

For relatively compact open E with closure inside D,
   bounded Borel q and ψ∈C²(D), derive the stopped identity for `½Δψ+qψ=0` a.e., using the
   zero-occupation spatial-null-set theorem. Stopped Brownian coordinates are local martingales,
   not finite variation. For the representation on D assume separately
   `ψ∈C²(D)∩C(D̄)` bounded and the stated terminal-weight integrability/UI.
   Prove exhaustion exit times increase to τ_D by path continuity and compact containment;
   no Dirichlet regularity is needed for this representation of the supplied ψ.
   Retain the bounded-potential gauge criterion. For bounded connected open D⊂ℝ^d,
   d≥1, and bounded Borel q, define on D̄
   `g(x)=E^x exp(∫₀^(τ_D^+)q(B_s)ds)`, with `τ_D^+=inf{t>0:B_t∉D}`.
   On interior starts this equals the ordinary exit-time gauge. Prove finiteness at one
   interior point implies `sup_(x∈D̄)g(x)<∞`. Construct the strong-Markov decomposition,
   small-domain exponential estimates and Harnack chaining, then prove the bound on the
   entire closure, including irregular boundary points. Prove the d=1 bounded-interval
   case separately with its strong-Markov/Dirichlet interval estimates.
   Use Chung–Rao, [*Feynman–Kac Functional and the Schrödinger Equation*](https://link.springer.com/chapter/10.1007/978-1-4612-3938-3_1),
   Seminar on Stochastic Processes 1981, pp.1–29, as the ordinary-gauge proof reference.
   Chung's [1985 article](https://www.numdam.org/item/SPS_1985__19__496_0/)
   gives the ordinary statement and a conditional-gauge development; its conditional
   proof is not the proof of the ordinary theorem. For disconnected open sets apply
   the criterion component by component. Boundary continuity is a separate conclusion
   under Dirichlet regularity; no boundary regularity is assumed for the bound.
   State the target precisely: for fixed `x∈D`, bounded Borel `q`, bounded Borel `ψ`, and every family of stopping times `σ_i≤τ_D` (including compact-exhaustion exits), prove the random variables `exp(∫₀^{σ_i}q(B_s)ds)ψ(B_{σ_i})` are uniformly integrable whenever the exit-weight `exp(∫₀^{τ_D}q(B_s)ds)` is integrable under `P^x`; the proof below gives the domination.
   Prove `gauge_weighted_stopped_family_uniformIntegrable` by the following conditional-expectation domination.
   An enclosing ball gives `sup_x E^xτ_D≤C_D`; Jensen gives
   `g≥c=exp(−‖q‖∞C_D)>0` on D. For the UI argument define the separate
   auxiliary function ĝ=g on D and ĝ=1 on ∂D; the same c satisfies c≤1.
   This does not identify the genuine boundary gauge at an irregular boundary point with 1.
   Strong Markov identifies `e(t∧τ_D)ĝ(B_(t∧τ_D))` with `E^x[e(τ_D)|F_t]`,
   `e(t)=exp(∫₀^t q(B_s)ds)`. Thus for bounded ψ,
   `|e(t∧τ_D)ψ(B_(t∧τ_D))|≤‖ψ‖∞ c⁻¹ E^x[e(τ_D)|F_t]`.
   Use native uniform integrability of the conditional expectations of one integrable
   variable and norm domination. The same argument applies to stopped times and compact
   exhaustions, using conditional expectation at their stopping σ-fields and actual
   exit-time convergence; continuity of ψ on the exit closure identifies the boundary value.
   Terminal integrability at a fixed starting point suffices for this domination there;
   the gauge theorem transfers finiteness between starting points. Also retain the direct
   sufficient bound `E exp(‖q⁺‖∞τ_D)<∞`. Connect to harmonic Kakutani and PDE’s
   deterministic elliptic uniqueness and heat equations. This roadmap's
   Feynman–Kac target owns the bounded-potential stochastic representation;
   PDE's dispersive Schrödinger estimates are a separate interface.

### Examples

For standard Brownian motion, the generator sends x² to 1 because half its second derivative is 1. For a constant potential q=2 and payoff 1 at time T, the Feynman–Kac value is exp(2(T−t)); killing at rate 2 instead gives exp(−2(T−t)).

### Dependencies

*Needs:* Layers 4.3, 6 and 9 for moment bounds, restart and SDE laws; OneParameterSemigroups Part A for closed generator/resolvent theory and PDE Lanes C/F for deterministic Dirichlet/parabolic inputs. The stochastic generator and martingale-problem identification is built in §10.2.

## Worked examples: mathematical corrections

The page labels below refer to MATH5695 in References. These are mathematical targets
and counterexamples, stated independently of any transcription.

| Page locator | Mathematical target or counterexample |
|---|---|
| 1, 185 | For a walk with p=1,q=0 and time index starting at 1, (q/p)^ξₙ is constantly 0; its stopped expectation is 0. Gambler's-ruin sampling with expectation 1 requires 0<p<1. The fair exit probability is s/(r+s). |
| 17 | The ordinary submartingale assertion for ‖X_t‖ᵖ requires finite pth moments for p≥1; a nonnegative extended conditional inequality is a different assertion. |
| 98 | Under a density change Q with terminal density ρ, E^Q f equals E^P[ρf] under the stated integrability hypotheses. |
| 100 | For drift b(x)=αx, c=max(α,0) gives αx²≤c(1+x²); α=3,x=1 refutes c=1. |
| 102 | A centered Gaussian increment of variance Δt has sixth moment 15(Δt)³. The Brownian left-rectangle integral error on an equal mesh has variance T³/(3n²). |
| 111 | For finite measures and C⊆D, μ(C)≤μ(D), with strictness exactly when μ(D∖C)>0. |
| 112 | On a one-atom probability space, f_n=n satisfies uniform small-set absolute continuity but has L¹ norm n; a uniform L¹ bound is needed for the UI converse. |
| 117, 119–123 | Derive dyadic conditional approximation from generating sigma algebras, retain the Doob L² inequality, use the buy-low/hold upcrossing strategy, and include both integrability assumptions in conditional Jensen. |
| 130 | Strong Markov conditions on the stopped sigma algebra with the event {τ<∞} where needed; no standalone stopping-time factor multiplies the event indicator. |
| 148, 178, 235 | Distinguish truncated endpoint sums from sums containing an overshooting increment. Prove the left/right-endpoint difference estimate in §4.2 before using its convergence. |
| 151–153 | Absolute continuity supports FTC; continuous a.e. differentiability with integrable derivative alone does not. The Cantor function has derivative 0 a.e. and endpoint increment 1. |
| 157 | At fixed n the ±1 walk has finite range; a value k requires (n+k)/2 positive steps. For n=3,k=1 this count is 2. |
| 161–163 | Usual conditions include completed ambient measure, null sets at time zero and right continuity; natural-filtration right continuity requires proof. |
| 165 | For three-dimensional Brownian start x≠0, split E[1/‖x+B_t‖] at radius R: the bounds are O(R²t^(−3/2)) and 1/R, giving limit 0 as t→∞ then R→∞. |
| 168, 173 | Local martingales need not be L². For the exponential L² claim in §5.4 require its L² initial value and finite E∫Z²d[M] on each finite horizon. |
| 175 | The original-process Lévy conclusion retains literal strong adaptation; bare locality yields a selected predictable indistinguishable version. |
| 176 | In dimension d, Lebesgue-null spatial sets have zero Brownian occupation by d-dimensional transition densities. Stopped Brownian coordinates are local martingales. |
| 184 | The finite-lot conditional-mean example below has error at most 5/N, with the stated dollar scaling. |
| 186 | Real-time stopping requires the hitting/debut arguments in §0.4; a general stopping time can have uncountable range. |
| 204, 229 | {α∧β≤t} is a union. Stopped L² bounds include the initial value or apply to centered increments. |
| 210, 231, 233, 242 | E[(B_t²−B_s²)²]=4s(t−s)+3(t−s)². At s=1,t=2 this is 7, while E[(B₂−B₁)⁴]=3. Conditional moment estimates use a specified process and filtration. |
| 224 | Predictable step heights measured at t_j occupy (t_j,t_(j+1)], with the F₀ value specified at zero. |
| 246, 268–269 | FinancialMathematics M0.4 owns pricing; §§6.2 and 9.4 supply Gaussian payoff and GBM identities with their stated drifts and densities. |
| 247 | Exit from a proper open subset of ℝ is finite a.s.: a missing point bounds the exit time by a one-dimensional level-hitting time. |
| 252 | Reflection changes both the start x and target a to −x and −a; level-hitting laws depend on |a−x|. |
| 262–263 | For T_h(ω)=ω+h, its pushforward has the positive Gaussian cross term; inverse translation has the negative cross term. |
| 264–265 | If g′=f∘g, the transformed drift is f(Y), not Y in general. A BV-driven term is absolutely continuous only with the additional AC hypothesis on its driver. |

## Worked examples

The formalized examples are part of the scope, not substitutes for the preceding APIs.
Each example below is an explicit target with the stated hypotheses, proved through the
corresponding API.

- For independent integrable real X,Y, prove integrability of XY and
  `E[XY]=E[X]E[Y]`. Under L² hypotheses this gives zero covariance. Prove the
  nonconverse using X uniform on {-1,0,1} and Y=X²: covariance is zero, whereas
  `P(X=0,Y=0)=1/3≠P(X=0)P(Y=0)=1/9`.

- Prove the remaining measure/integration acceptance examples of physical
  pp194–195. For bounded half-open intervals [a,b), a≤b, show length b−a
  is a well-defined finitely additive content on their finite-union ring,
  then prove countable additivity via compact inner approximations and
  finite subcovers. Identify its extension with native Lebesgue measure.
  For finite-valued nondecreasing F:ℝ→ℝ, define the interval content
  ν_F([a,b))=F(b)−F(a), prove its finite-union representation independence,
  and prove it is a premeasure iff F is left-continuous. Obtain the locally
  finite Borel measure by extension and prove the disjoint-interval sum
  identity whenever their union is [a,b). Pin this half-open convention;
  the source does not supply signed/general-variation hypotheses.
  For the point mass δ₀, consume countable additivity and prove the integral
  evaluation at zero. For extended-real f, under absolute-integrability and
  finite-a.e. conventions, integrability is equivalent to finiteness of f(0);
  all other values lie in a δ₀-null set. Give the real-valued native integral
  specialization with its actual measurability/integrability hypotheses.

  For α>0 and x>0 set
  f_k(x)=Σ_(n=1)^k e^(−nx)cos(nx²)/n^α. Use the extended nonnegative sum
  g(x)=Σ_(n≥1)e^(−nx)/n^α and MCT to prove
  ∫_0^∞g=Σ_(n≥1)n^(−1−α)<∞. Prove absolute series convergence for x>0
  by exponential decay, then apply |f_k|≤g and DCT to its limit. Work with
  a finite-a.e. real representative of g; the value at the null singleton
  x=0 need not be finite or the series limit there. For the following
  source DCT exercise, prove that any measurable sequence with
  |f_n(x)|≤e^(−x²) and f_n(x)→0 off {x:cos x=0} has integrals tending
  to zero. Prove countability/nullity of that exceptional set. The solutions
  supply these hypotheses but no formula for f_n; the question sheet jumps
  from printed p1 to p3, so no guessed sequence is part of this target.

  Define f(x)=sin x/x for x≠0 and f(0)=1. Prove
  ∫_(kπ)^((k+1)π)|f|≥2/((k+1)π), k∈ℕ, and use MCT for the cutoffs
  |f|1_[0,(k+1)π) to get ∫_0^∞|f|=∞. Separately prove its improper
  symmetric integral converges, using the near-zero mean-value bound and
  integration by parts with the integrable tail bound 1/x². Prove continuous
  functions on compact intervals integrable by uniform-continuity step
  approximations, and for nonnegative continuous functions on (a,b) prove
  integrability iff the two one-sided improper integrals at a,b are finite.
  Classify 1/x on (0,1] as nonintegrable, x^(−1/2) there with integral2,
  and the function equal to 1 for |x|≤1 and 1/|x| outside as nonintegrable
  on ℝ. Identify 1/[x(ln x−1)²] on (0,1] with the logarithmic example below,
  with integral1 and no Lp membership for p>1. For any measure space, an
  integrable dominator for a family implies the source's UI tail condition;
  on finite-measure spaces a uniformly bounded measurable family satisfies
  it. Retain the separate uniform-L¹ hypothesis in the finite-measure
  small-set converse below.

- Measure/probability exercises consume existing foundations. For probability
  measures μ,ν and positive integers m, Sellke’s RN variational proof
  pp108–110 gets the maximizer of `V(f)=2∫f dν−∫f²dμ` on `0≤f≤m`, identified with the truncated RN density (value m on the singular set)
  and essentially unique for μ+ν, consuming existing RN. Also formalize the
  inserted proof's connecting lemmas: the midpoint identity gives an L²-Cauchy
  maximizing sequence; summable Chebyshev bounds and Borel–Cantelli give its
  μ-a.e. limit. Define the candidate by the pointwise limsup, bounded by m,
  so bounded convergence applies to its μ-square integral and reverse Fatou
  to its ν-linear integral without assuming ν≪μ. Prove attainment. For
  `C_m={f_m<m}`, use two-sided indicator variations on sets bounded away
  from both endpoints and exhaust the interior. At the lower facet `{f_m=0}`,
  positive one-sided variations force ν to vanish; include this step to cover
  all of C_m. On `D_m={f_m=m}`, negative one-sided variations give
  `ν(E)≥mμ(E)`. For `A_m=C_m\⋃_{i<m}C_i` and `D=⋂_mD_m`, prove
  the disjoint partition, `μ(D)=0` from `μ(D_m)≤1/m`, and the
  countable-sum decomposition for every measurable E. These reproduce the
  variational proof using existing measure theory, without a second RN API.
  Prove the variation/Stieltjes and elementary conditional-model adapters, finite
  counting-ring extension and regular-content σ-additivity specified here. On (0,1]
  with Lebesgue measure, prove `f(x)=1/(x log(e/x)²)` is integrable with integral 1,
  while f∉Lp for every real p>1. For any measure space, prove that the uniform
  tail-integral UI condition implies `sup_f ∫_(B_n)|f| dµ→0` whenever B_n decreases
  to ∅ and µ(B₁)<∞: split at a fixed level c and use
  `∫_(B_n)|f|≤cµ(B_n)+∫_{|f|>c}|f|`. On finite measure spaces, prove the converse
  after adjoining uniform L¹ boundedness. A one-atom family f_n=n refutes the bare
  converse; do not impose that extra bound on the general-measure forward implication.
  The regular-content target is precise: for a metric space X, a ring R of subsets and
  a finitely additive µ:R→[0,∞), assume that for every A∈R and ε>0 there are compact
  K and B∈R with B⊆K⊆A and µ(A\B)<ε. Prove continuity from above at the empty set
  for decreasing sequences in R, hence countable additivity whenever their union lies
  in R. Use summably small approximation errors and the finite-intersection property
  of compact sets. K need not belong to R; retain the separate inner set B.
  For finite-subset counting-ring data `μ(A)=Σ_(n∈A)a_n`, `a_n≥0`,
  construct the native atomic measure `Σ_n a_n δ_n` on all subsets of ℕ.
  Its extension is finite, equivalently real-valued on every subset, exactly
  when `Σ_n a_n<∞`; the extended-nonnegative-valued measure exists also
  for divergent sums. Retain the real-valued-extension condition from the exercise.
  For the elementary independence/uncorrelated distinction, consume native
  `IndepFun.integrable_mul` and `IndepFun.integral_mul_eq_mul_integral` from
  `Mathlib.Probability.Independence.Integration`: independent integrable real X,Y
  have integrable product and `E[XY]=E[X]E[Y]`. For the L² formulation use the
  native covariance/variance vocabulary and its actual moment hypotheses.
  Prove the converse fails on the uniform probability on `Fin 3`: take X with
  successive values −1,0,1 and Y=X². Prove their finite second moments,
  `E[X]=0`, `E[Y]=2/3` and `E[XY]=0`, hence zero covariance. The events
  `{X=0}` and `{Y=0}` coincide and have probability 1/3, whereas the product
  of their probabilities is 1/9, so X,Y are dependent. This is an explicit
  finite-law example using the existing independence API, not a new predicate.
  For the infinite fair-coin example use `Ω=ℕ→Fin 2` with the native
  `Measure.infinitePi` of the uniform two-point laws. For every finite set I of
  distinct coordinates and assignment e:I→Fin 2, prove the cylinder probability
  `P{ω:∀i∈I,ω(i)=e(i)}=2^(−|I|)`, including I empty. Use native
  `Measure.infinitePi_pi`, `Measure.infinitePi_cylinder` and
  `iIndepFun_infinitePi` with their probability/measurability hypotheses.
  Distinguish elementary fixed-outcome cylinders, which are not an algebra,
  from arbitrary finite-coordinate inverse images, which form the cylinder algebra.
  Derive the finite-union formula by disjoint refinement to a common coordinate set,
  prove it independent of the presentation, and identify its countably additive
  content with the restriction of the native product probability. Prove uniqueness
  of its extension to the product sigma algebra using its generating cylinders.
  Consume the native product-measure construction rather than reimplement it;
  independent products and arbitrary consistent finite-dimensional laws are
  distinct constructions, the latter having the stated S1.1 hypotheses.
  Cantor-staircase composition
  with `√u sin(1/u)` disproves the source's continuous+a.e.derivative⇒BV claim; AC implies BV.
  Preserve the countable-exception alternative: for continuous real f on [a,b], a≤b,
  a countable S and an interval-integrable derivative g satisfying
  `HasDerivAt f (g x) x` for every `x∈(a,b)\S`, use native
  `MeasureTheory.integral_eq_of_hasDerivAt_off_countable_of_le` from
  `Mathlib.MeasureTheory.Integral.DivergenceTheorem` on every subinterval.
  Thus `f(x)−f(a)=∫ₐˣg`; absolute continuity follows from native
  `IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral`,
  and `AbsolutelyContinuousOnInterval.boundedVariationOn` gives BV.
  Obtain `Var_[a,b](f)≤∫ₐᵇ|g|` by summing this identity over each partition.
  Countability concerns the set of points where differentiation may fail;
  replacing it by an arbitrary null set does not justify the conclusion.
  Prove ordinary oscillatory infinite variation; conditional share mean
  `1/(2 log2)−1/4` in the following model: x is uniform on [0,1], conditionally on x,
  y is uniform on [0,1−x], s=1−x−y and B={x≤1/2,y≤1/2}; prove
  `P(B)=(log2)/2`, `E[s1_B]=1/4−(log2)/8`, and the displayed `E[s|B]`.
  Quantify the source p.184 small-share approximation in a declared sequential finite-lot
  model. Let D>0 be the dollar scale and N≥2 an even integer. Choose I uniformly from
  {0,…,N}; conditionally on I=i choose J uniformly from {0,…,N−i}. Put x=I/N,
  y=J/N and condition on A_N={I≤N/2,J≤N/2}. With
  `H_N=Σ_(k=N/2+1)^(N+1) 1/k`, prove
  `E[1−x−y | A_N]=(1/2+1/N)/H_N−1/4−1/N` and
  `|E[1−x−y | A_N]−(1/(2 log2)−1/4)|≤5/N`.
  Derive these by finite conditional sums and `log2≤H_N≤log2+1/N`, retaining the
  nonuniform joint weights `1/((N+1)(N−i+1))`. Multiplication by D gives an absolute
  dollar error at most 5D/N, five share lots. The grid rule specifies the sampling law
  for this finite-lot model; changing that law changes the conditional expectation.
  As a separate model let x,y be independent uniform variables on [0,1/2], set
  s=1−x−y and prove E[s]=1/2. For independent ±1 increments with probabilities
  p,q>0, p+q=1, prove `(q/p)^(ξ_n)` is a martingale for the walk ξ starting at 0,
  including the constant case p=q; identify its actual natural filtration and integrability.
  Also prove conditional expectations on finite
  atoms, the unit square densities, uniform disk and reflection-symmetric maps.
  For Assignment1 Problem3 (source physical pages1 and11, with solutions on155
  and184), use its stated Lebesgue probability on [0,1], `ξ(x)=2x²` and `η(x)=(x−1/2)²`. Prove
  `E[ξ|σ(η)](x)=x²+(1−x)²=2η(x)+1/2` a.s., using reflection
  invariance of the measure and testing on σ(η). Establish measurability
  by the displayed factor through η; extend the integral identity from
  a generating π-system by measure uniqueness. These are the source's own model
  choices, including its stated law of ξ.
  Give the following conditional-model acceptance formulas. All [0,1] examples use
  Lebesgue probability; values on null boundary fibers are chosen measurably and are
  asserted only a.e. Each answer must be measurable for σ(η) and satisfy the
  defining integral identity on that σ-field, using native conditional expectation.

  | Model | Required conditional mean |
  | --- | --- |
  | `ξ(x)=2x²`, η=1,2,0 respectively on the three successive intervals of length 1/3 | `2/27`, `14/27`, `38/27` on those three atoms |
  | Integrable ξ, constant η | `E[ξ]` |
  | `ξ=1_A`, `η=1_B`, `0<P(B)<1` | `P(A∩B)/P(B)` on B and `P(A∩Bᶜ)/P(Bᶜ)` off B |
  | `ξ(x)=2x²`, η=2 on [0,1/2], η=x above 1/2 | `1/6` on the first atom, `2x²` on the identity part |
  | Joint density `x+y` on the unit square | `(2+3η)/(3+6η)` |
  | Joint density `(3/2)(x²+y²)` on the unit square | `(3+6η²)/(4+12η²)` |
  | Normalized uniform area on the unit disk, ξ=x, η=y | `E[ξ²|η]=(1−η²)/3` |
  | Integrable ξ on [0,1], `η(x)=x(1−x)` | `(ξ(x)+ξ(1−x))/2` |

  Give a separate tent-map example on Borel ℝ: set η(x)=min(x,1−x) on
  [0,1] and zero outside, let P be any Borel probability and ξ any P-integrable
  real function. Use native `stronglyMeasurable_condExp` and
  `StronglyMeasurable.exists_eq_measurable_comp` in
  `Mathlib.MeasureTheory.Function.FactorsThrough` to construct a Borel g with
  the chosen version `E[ξ|σ(η)]=g∘η`. Prove that this representative is symmetric
  under x↦1−x on [0,1] and constant on ℝ∖[0,1]; other versions agree P-a.e.
  No reflection invariance of P is required. These declared data specify the
  structural example without assigning a value to the source's unspecified ξ.

  For the discrete-η tower exercise, sum the conditional integral identities over
  its countable fibers and recover `E[E[ξ|η]]=E[ξ]`. For a joint density f and
  integrable first coordinate, prove the general quotient
  `E[ξ|η]=∫x f(x,η)dx / ∫f(x,η)dx` wherever the marginal is finite and positive;
  set a measurable value on the exceptional marginal-zero or infinite set and prove that it is η-law null.
  Prove numerator integrability by signed Fubini. In the disk calculation use its
  vertical slices and marginal `2√(1−y²)/π`. For the reflection formula prove the
  invariant average factors measurably through η, rather than infer σ(η)-measurability
  from symmetry without that argument. For ξ∈L², consume native conditional-L²
  projection onto the closed subspace of G-measurable classes; prove its conditional
  integral characterization by testing orthogonality against `1_A`, A∈G.
  For the coin example, declare independent Bernoulli indicators H₁₀,H₂₀,H₅₀
  with parameters p₁₀,p₂₀,p₅₀, set `ξ=10H₁₀+20H₂₀+50H₅₀` and
  `η=10H₁₀+20H₂₀`, and prove `E[ξ|σ(η)]=η+50p₅₀` a.s. With
  p₅₀=1/2 recover 25,35,45,55 on positive-probability fibers; conditional
  values on null fibers are not uniquely prescribed. This is a declared
  reconstruction of the example's inherited setup. Prove bounded
  gambler's ruin probabilities with 0<p<1. For the fair walk, compute
  the hitting probability directly by stopping its bounded position
  martingale, then compare with the algebraic limit of the biased formula;
  taking that formula's parameter limit alone does not prove continuity
  of event probabilities between different walk laws. Prove the
  infinite-product setwise-limit counterexample: on {−1,1}^ℕ let P_p be the independent
  product law with P_p(ω_i=1)=p, and set `A={lim_n n⁻¹Σ_(i<n)ω_i=0}`.
  Prove `P_(1/2)(A)=1` and `P_p(A)=0` for p≠1/2 by the strong law; finite-cylinder
  probabilities converge as p→1/2 but the laws do not converge setwise on this A.
  These are connecting lemmas/examples, not new RN/Lp/conditional-expectation
  foundations. For the source p153 rule assigning each removed Cantor interval its
  right endpoint, prove that no continuous extension exists. At points inside
  `(1/3−2·3^{−n},1/3−3^{−n})`, n≥2, the assigned values tend to 1/3,
  whereas the value on the first gap `(1/3,2/3)` is 2/3. These two limits at
  1/3 contradict continuity, regardless of whether gap endpoints are included.
  Construct the continuous nondecreasing Cantor staircase c as the uniform
  limit of its piecewise-linear middle-third approximants, with uniform
  Cauchy bound O(2^(−n)), c(0)=0 and c(1)=1. Prove it is onto and constant
  on each removed interval. Use Mathlib's `cantorSet` and `preCantorSet n` carriers
  in `Mathlib/Topology/Instances/CantorSet`. Prove the nullity of `cantorSet`
  from the nth surviving cover of total length (2/3)^n.
  Use this c for the valid
  counterexample `h=f∘c`, `f(u)=√u sin(1/u)` for u>0 and f(0)=0. The function
  h is continuous and locally constant on every removed interval, so h′=0
  almost everywhere without an unjustified chain rule. Since c is onto and
  nondecreasing, pull back finite partitions to prove `Var(h)≥Var(f)=∞`;
  the alternating extrema `u_n=(π/2+nπ)^{−1}` prove the last divergence.

- Discrete maximal and upcrossing proof adapters consume native martingale
  definitions and crossing strategies. For a finite L² martingale and
  `M_n=max_{k≤n}|ξ_k|`, prove the first-crossing estimate
  `λP(M_n≥λ)≤E[|ξ_n|1_{M_n≥λ}]` for λ>0. Tonelli's layer-cake identity
  and Cauchy–Schwarz give `E M_n²≤2E(|ξ_n|M_n)≤2‖ξ_n‖₂‖M_n‖₂`,
  hence `E M_n²≤4E|ξ_n|²`; justify finite second moments before dividing,
  including the zero-norm case. The middle comparison is an inequality:
  the constant martingale 1 gives layer-cake value 1 and comparison value 2.
  For an integrable supermartingale and a<b, use the predictable strategy
  `α_k∈{0,1}` that buys below a and sells above b. Its gain
  `S_n=Σ_{k<n}α_k(ξ_{k+1}−ξ_k)` has expectation at most zero and satisfies
  `S_n≥(b−a)U_n[a,b]−(ξ_n−a)^−` pathwise. Prove the terminal-index bound
  `(b−a)E U_n[a,b]≤E((ξ_n−a)^−)` and its uniform consequence
  `≤sup_k E|ξ_k|+|a|`; no normalization of Eξ₀ is required.
  Use Mathlib's `upcrossingStrat` and `upcrossingsBefore`, proving the finite
  endpoint-counting comparison and the gain inequality. The native
  `Submartingale.mul_integral_upcrossingsBefore_le_integral_pos_part` has
  a submartingale/positive-part statement; it is not this supermartingale
  negative-part theorem without the stated adapter. Obtain the supermartingale
  gain expectation from the bounded predictable transform of −ξ. For the
  convergence theorem, combine finite rational upcrossings with Fatou's
  bound on `liminf |ξ_n|` to exclude infinite limits and obtain an integrable
  a.s. limit. Uniform L¹ boundedness alone does not give L¹ convergence.
  For `f_n→f` in L¹, choose a subsequence with errors at most `2^{−k}`;
  the triangle inequality bounds the sum of consecutive L¹ differences by
  `Σ_k(2^{−k}+2^{−(k+1)})<∞`. Tonelli gives a.e. absolute summability,
  and convergence in probability identifies its pointwise limit with f.
  For integrable ξ and increasing F_n, prove the conditional family
  `E[ξ|F_n]` uniformly integrable and its a.e./L¹ limit equal to
  `E[ξ|F_∞]`, where `F_∞=σ(⋃_nF_n)`. Equality of this limit to ξ requires
  F_∞-measurability up to null sets. Do not impose UI as an extra hypothesis
  on an already specified integrable conditional family.
- For a fixed deterministic vanishing-mesh partition sequence on [0,T], T>0,
  let D be the union of its left endpoints and `H_t=1_D(t)`. Prove H is
  bounded and predictable, `∫H dB=0` by the isometry, while every left-point
  sum equals `B_T−B₀`. The corresponding H-weighted quadratic sum equals
  the unweighted Brownian quadratic sum and converges in probability to T,
  while `∫H d[B]=0`. Thus bounded predictable integrands alone do not
  justify either displayed left-sum limit. Keep the continuous-integrand
  partition theorem of S4.2 and the regularity hypotheses of S5.3 explicit.
- Prove the S2.3 doubling strategy's signed-tail failure, S0.5's nonpredictable two-outcome
  time, S0.2's lagged-step predictability, S3.2's accumulated-energy localizer and S3.1's
  predictable-rectangle mass identities. For terminal conditional convergence prove the
  supremum-field measurable terminal-value identity of S2.2. For arbitrary initial value
  prove the centered stopped-increment martingale identities of S2.4.
- For the explicit simple-value approximation in the B² integrand example, define
  `φ_k(x)=Σ_(j=0)^(2^(2k)−1)(j/2^k)²1_[j/2^k,(j+1)/2^k)(|x|)`.
  Prove these are finite Borel simple functions with `0≤φ_k(x)↑x²`. For each fixed
  time partition, use `φ_k(B_(t_j))` on `(t_j,t_(j+1)]` to construct predictable
  simple integrands and prove their L²(dt×P) convergence to the B² left-step
  integrand using the fourth Gaussian moment. Then pass the time mesh to zero.
- Prove the cubic integral `∫₀ᵀB_s²dB_s=B_T³/3−∫₀ᵀB_sds` from its elementary
  four-term step expansion: the telescoping cubic term, the negative left Riemann
  sum, the negative centered weighted quadratic-increment sum, and the negative
  one-third cubic-increment sum. Prove each L² limit. For equal mesh Δ=T/n,
  `E|Σ_i∫_{t_i}^{t_{i+1}}(B_{t_i}−B_t)dt|²=T³/(3n²)` and
  `E|Σ_i(ΔB_i)³|²=15T³/n²`; the latter contributes `5T³/(3n²)` after its
  one-third prefactor is squared. Prove the weighted quadratic-increment second
  moment `2Σ_i t_iΔ²`. Also prove `E((B_t²−B_s²)²)=4s(t−s)+3(t−s)²`, so the
  integrated L² error of the step approximation to B² on the same uniform grid
  is T³/n. These are distinct error quantities; for a centered Gaussian of variance v
  the sixth moment is `15v³`. Prove the exact identities
  as well as convergence.
- Level exits/hitting transforms, stationary OU, the supplied 2×2 matrix SDE and its expectations,
  the hyperbolic transform, h(t)=t² translation and the restricted nonlinear Lamperti example
  test S5–S10. GBM drift changes are exported. The precise Gaussian payoff interface is S6.2's
  truncated-exponential identity
  `E_x[exp(αB_t−α²t/2)1_{B_t<a}]=exp(αx)Φ((a−x−αt)/√t)` for t>0 and α∈ℝ;
  identify it by that formula and the CDF `cdf (gaussianReal 0 1)`. FinancialMathematics M0.4
  and MarketImpact consume the shared payoff interface in Exact supplier contracts, including this truncated-exponential identity (using reflection/complements for the upper-tail call event)
  in addition to the full Gaussian expectation, so the discounted call/put derivation has an
  explicit stochastic-calculus interface.
  The source's Black–Scholes and feedback-model application belongs to FinancialMathematics;
   the course's μ=r=0 calculation is not a correction to the source theorem.
- Prove S6.4's harmonic/exit identities, S6.5's Hardy/Brownian maximal comparisons,
  S6.6's reflected-motion/occupation identities and S6.7's Wiener-shift cocycle/mixing laws.
  Diagrams, CAS output,
  historical program-trading claims and simulated volatility percentages are not universal
  theorem statements. The financial consumer records its experiment/data assumptions and
  uses the numerical and probabilistic contracts proved here.

## Downstream consumers

FinancialMathematics M0.1 uses the progressive-coefficient linear SDE in §9.4;
M0.4 uses §6.2's full and truncated Gaussian exponential expectations. Its call/put
results retain positive volatility, spot, strike and remaining maturity, while the
zero-volatility asset remains an instance of the generic linear SDE. MarketImpact
uses these financial contracts. OptimalTransport §13C uses §1.2's Wiener initial-law
and scaling interfaces and Layer 10's heat-generator identification.

## References

- Steven P. Lalley, [*Introduction to Brownian Motion*](https://galton.uchicago.edu/~lalley/Courses/383/BrownianMotion.pdf),
  Theorem 1 (existence), Theorem 5, p.13 (strong Markov), equation (32), p.16
  (reflection), and Theorem 7 (quadratic variation along nested partitions).
- Volker Krätschmer and Mikhail Urusov, [*A general Kolmogorov–Chentsov type theorem on general metric spaces with applications to limit theorems for Banach-valued processes*](https://arxiv.org/abs/2107.13837v2),
  arXiv:2107.13837v2, Theorem 1.1 (metric-index continuity under covering and moment bounds).

- Fabrice Baudoin, [*Lecture 24: Burkholder–Davis–Gundy inequalities*](https://fabricebaudoin.blog/2012/09/28/lecture-24-burkholder-davis-gundy-inequalities/),
  for the continuous-martingale p>0 theorem and its stochastic-calculus proof.
  S4.3 owns the stopped-L²/good-λ construction and the required maximal estimates.
- D. L. Burkholder, [*Distribution Function Inequalities for Martingales*](https://doi.org/10.1214/aop/1176997023),
  Annals of Probability 1 (1973), 19–42, for distribution-function methods in martingale
  inequalities. The stopped L²/good-λ proof obligations are specified in S4.3.
- Ioannis Karatzas and Steven E. Shreve, *Brownian Motion and Stochastic Calculus*, second
  edition, Springer GTM 113 (1991): Chapters 1–3 process/martingale/Brownian/integration,
  §3.4 martingale representation and DDS, §3.5 Girsanov/Novikov, Chapter 5 SDEs/flows and
  §5.7 PDE representation, Chapter 6 local time. The theorem hypotheses govern the targets.
- MATH5695, *Outline notes on Stochastic Differential Equations*: elementary probability,
  Brownian motion, stochastic integration and differential equations.
- Rémy Degenne, David Ledvinka, Étienne Marion and Peter Pfaffelhuber,
  [*Formalization of Brownian motion in Lean*](https://arxiv.org/html/2511.20118v2): constructive
  Gaussian/projective and covering-number Chentsov architecture and immutable code references.
- D. L. Burkholder, R. F. Gundy and M. L. Silverstein,
  [*A maximal function characterization of the class H^p*](https://doi.org/10.1090/S0002-9947-1971-0274767-6),
  Transactions AMS 157 (1971), §5, Theorems 1′ and 3′, pp.150–151: §6.5’s disk
  Hardy norm equivalence and Brownian/nontangential maximal distribution comparison.
- Daniel Revuz and Marc Yor, *Continuous Martingales and Brownian Motion*, third edition:
  continuous/local martingale calculus, stochastic exponentials, local time and Bessel examples.
- Stefanos Theodorakopoulos, [*New proofs to measurable, predictable and optional section theorems*](https://arxiv.org/html/2310.13086v2), arXiv:2310.13086v2 (2024), §§2–4: Souslin closure/strict-capacity approximation (Theorems 2.3–2.5), compact-fiber measurable sections (Lemma 3.5/Theorem 3.7), predictable paving and sections (Lemma 4.2/Theorem 4.4), and optional approximation/sections (Lemma 4.8/Theorem 4.9). Use this as a proof-route reference, not as a substitute for the explicitly stated Lean obligations; in particular prove the stopping-time decomposition and omitted closure steps rather than importing unstated claims.
- Philip Protter, *Stochastic Integration and Differential Equations*, second edition:
  càdlàg integration, Doob–Meyer and semimartingale/jump compatibility.
- Hiroshi Kunita, *Stochastic Flows and Stochastic Differential Equations*: finite-dimensional
  differentiable solution flows and their exact smoothness/nonexplosion hypotheses.
- Denis Talay and Luciano Tubaro,
  [*Expansion of the global error for numerical schemes solving stochastic differential equations*](https://www-sop.inria.fr/members/Denis.Talay/fichiers-pdf/version-publiee-talay-tubaro-90.pdf):
  weak Euler expansion and derivative/moment proof architecture for S9.6. Its smooth
  coefficient hypothesis is not a claim that arbitrary measurable payoff has weak order 1.
- Source authors' immutable external code and public design discussions listed above are
  implementation references; their undeveloped predicates/holes are not mathematical axioms.

## Implementation provenance

The native PDE interfaces are pinned to Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:

- `TauCeti/Analysis/PDE/GreenFunction/Ball.lean` supplies the area-normalized ball kernel.
- `TauCeti/Analysis/PDE/PoissonIntegral/Ball.lean` supplies the density integral and its harmonicity.
- `TauCeti/Analysis/InnerProductSpace/Laplacian/ParametricIntegral.lean` supplies differentiation
  and harmonicity under an integral with its weight, topology and differentiability hypotheses.
- `TauCeti/Analysis/InnerProductSpace/Harmonic/Subharmonic.lean` supplies continuous
  sub-mean-value functions, finite maxima and comparison; it is not an upper-semicontinuous
  extended-valued subharmonic theory.

The half-line time normalization is the explicit comap formula in Conventions.
The equality of two expansions of that formula is definitional; it does not establish
any comparison with a PointProcesses declaration. The cross-roadmap adapters are the
mathematical contracts in S0.6, including the finite-horizon and predictable-trim
comparison required by S3.1.
