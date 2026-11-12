# Roadmap: classical ergodic theory, entropy, the variational principle and flows

Develop classical ergodic theory for measure-preserving monoid actions, group actions and real
flows, starting from the single-transformation theory in Walters, *An Introduction to Ergodic
Theory*, and Cornfeld–Fomin–Sinai, *Ergodic Theory*. Develop the mixing hierarchy and its spectral
characterizations,
natural extensions, joinings and relative weak mixing, measurable and continuous flows with their
time-`t` maps and suspension flows, Kolmogorov–Sinai entropy, relative entropy and their computation,
topological entropy and pressure, the variational principle, measures
of maximal entropy and equilibrium states for maps, amenable actions and flows, and polygonal billiard
flows as examples of measure-preserving flows defined off a null set.

The headline results are: the equivalent forms of weak mixing for maps and for real flows
(ergodicity of the product, absence of eigenfunctions, continuity of spectral measures, Cesàro
decay of correlations); Wiener's lemma and the spectral characterization of mixing; the
Kolmogorov–Sinai generator and approximation theorems, entropy preservation by natural extensions,
the Abramov–Rokhlin addition formula and the entropies of Bernoulli, Markov and toral systems;
the Brin–Katok local entropy formula and Abramov's formula for measurable flows; Følner mean and
pointwise ergodic theorems and amenable entropy; the variational principle for pressure, for maps,
countably infinite discrete amenable actions and real flows; existence of equilibrium states and
measures of maximal entropy when the entropy map is upper semicontinuous; Bowen's uniqueness theorem
for expansive maps and flows with specification, with its consequences for Hölder potentials on
subshifts of finite type and their suspension flows, and the Ruelle–Perron–Frobenius theorem; and the construction
of the billiard flow of a bounded polygonal domain, including domains with holes, with its invariant Liouville measure.

`README.md` is the definitive specification. [`Suggested.lean`](Suggested.lean) records suggested
signatures for selected targets and is not an exhaustive checklist. Suggested homes:
`TauCeti/Dynamics/Ergodic/` (maps and actions), `TauCeti/Dynamics/Ergodic/Flow/` (measurable flows),
`TauCeti/Dynamics/Entropy/` (measure entropy, topological entropy and pressure) and
`TauCeti/Dynamics/Billiard/Polygon/`. Extend the existing modules
`TauCeti/Dynamics/Ergodic/MeasurePreserving.lean`, `TauCeti/Probability/Ergodic/` and
`TauCeti/Dynamics/Flow/` rather than restating their content.

## Scope and ownership

The ambient objects of each part are specified below. Each general construction includes its
specialization and compatibility lemmas for maps, invertible maps and real flows.

| Material | Generality and location |
| --- | --- |
| Factors, products, invariant σ-algebras, finite orbit observations, Koopman pullback | Measure-preserving actions of arbitrary monoids; §§0.1–0.2, 0.5. Elementary transport lemmas use arbitrary measures. |
| Natural extensions | Probability-preserving endomorphisms of standard Borel spaces, with an honest measurable inverse on the history subtype; §0.7, §1.5, §4.2. |
| Joinings and relative theory | Joinings for monoid actions; relatively independent products and relative weak mixing for countable group actions on standard Borel probability spaces, §§0.8, 1.5; relative entropy for endomorphisms, §4.8, and countably infinite amenable actions, §4.9. |
| Mixing and its permanence properties | Monoid actions along a specified filter; diagonal weak mixing for monoid actions; §§1.0–1.3. |
| Representation criteria for mixing and weak mixing | Unitary representations of groups, with strong continuity for topological groups; §2.4. |
| Spectral measures and characters | Strongly continuous unitary representations of locally compact Hausdorff abelian groups; §§2.1–2.4. Noninvertible maps retain their isometric Koopman theory. |
| Averaging and entropy | Countably infinite discrete amenable groups for entropy; countable discrete amenable groups for averaging; §§2.5, 4.6–4.7, 5.6, 7.4 and 8.3. |
| Structural flow API | `Flow τ X` for additive topological monoids, with real-time integration and time-map theorems for `τ = ℝ`; Layer 3. |
| Invariant Radon probabilities and open-cover entropy | Nonempty compact Hausdorff spaces; §§3.4, 5.1–5.2. Metric partitions, local entropy and the pressure variational principles use compact metrizable spaces. |
| Suspension and entropy scaling | Measurable real flows on standard Borel probability spaces; §§3.3, 6.4. |
| Billiards | Bounded connected polygonal domains in the plane with finitely many disjoint polygonal boundary components; Layer 9. |
| Uniqueness of equilibrium states | Expansive homeomorphisms and continuous flows with specification on compact metric spaces, potentials with the Bowen property; subshifts of finite type, Hölder potentials, the Ruelle transfer operator and suspension flows over them; §§8.4–8.6. |
| Almost-everywhere flows | Measure-preserving real flows defined on a conull invariant subset of a standard Borel space, with disjoint unions and transport of densities; §3.5. |

| Material | Owner and interface consumed here |
| --- | --- |
| Measure-preserving maps, ergodicity, recurrence, ergodic actions, ergodic measures as extreme points, Birkhoff sums, empirical measures and Krylov–Bogolyubov, topological entropy by covers and nets, topological flows, subshifts | Mathlib (see [Existing library](#existing-library)) |
| Mean ergodic theorem in `L²`, fixed spaces, invariant σ-algebra, Koopman operator on `L⁰`, ergodicity of Bernoulli shifts, Herglotz and Bochner theorems, compact normal operators, Kullback–Leibler divergence, continuous flows, Jordan curve theorem in `ℂ`, the cat map | Tau Ceti code (see [Existing library](#existing-library)) |
| Pointwise Birkhoff theorem with invariant conditional-expectation limit (`birkhoff_pointwise`, `birkhoff_pointwise_ergodic`); strong mixing of a map (`IsStrongMixing`); finite-label Shannon entropy (`labelEntropy`, `condLabelEntropy`) | ProbabilisticAndMetricNumberTheory, roadmap PR [#1421](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1421), §§4.1–4.3, §4.6, §5.1a |
| Koopman representation of a measure-preserving group action on `Lᵖ` (`scalarLpKoopman`), return times and Kac's lemma (`positiveReturnTime`, `kac_return_time_integral`), ergodic decomposition of group actions (`ActionErgodicKernel`) | GeometryOfNumbersAndQuadraticArithmetic, roadmap PR [#851](https://github.com/TauCetiProject/TauCetiRoadmap/pull/851), §4.2 |
| Markov kernels, stationarity, path laws and convergence to equilibrium for countable-state chains | [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md), Layers 0–3 |
| Amenability, invariant means and the discrete Følner criterion | [AmenableGroups](../AmenableGroups/README.md); Tau Ceti `Amenable`, `HasFoelnerSets`, `Amenable.hasFoelnerSets`, `amenable_iff_hasFoelnerSets`, `hasFoelnerSets_iff_exists_seq`, `IsFoelner.tendsto_card_smul_symmDiff_div_card` and `Mean.tendsto_average_ofIsFoelner` (`TauCeti/GroupTheory/Amenable/`). Ergodic theorems and entropy limit lemmas for actions are targets here. |

The open roadmap PRs in the table are cited by section. Their generic ergodic-theory sections are
consumed here with the names and signatures given there; this roadmap does not restate them.

**Kolmogorov–Sinai entropy is owned here.** Partition entropy, conditional entropy given a label
or a σ-algebra, entropy rates, the measure entropy `measureEntropy μ T`, its finite-partition form,
the map Shannon–McMillan–Breiman theorem, entropy integration over the ergodic decomposition of an
endomorphism, small-diameter partitions with null boundaries and the inequality
`h_μ(T) ≤ h_top(T)` are specified in §§4.0, 4.10, 6.1 and 7.1. GeometryOfNumbersAndQuadraticArithmetic
(PR #851, §4.2, "Entropy and Haar measure on leaves") and ArithmeticDynamics (PR #1335, §§2.6–2.7)
state the same objects for their arithmetic arguments. The declarations below carry PR #851's names
and signatures (`countablePartitionEntropy`, `conditionalPartitionEntropy`, `iteratedPartitionLabel`,
`partitionEntropyRate`, `measureEntropy`), so the three specifications describe a single Tau Ceti
implementation. Material particular to those roadmaps stays with them: subordinate partitions,
standard-Borel atom information (`atomInformation`, `conditionalLabelEntropy`), leaf entropy and
Lyubich's fibre-entropy bound.

**Outside this roadmap.** Uniformly hyperbolic smooth dynamics (Anosov and Axiom A
diffeomorphisms and flows, stable manifolds, Markov partitions and their symbolic codings, SRB
measures) and smooth ergodic theory (Pesin theory, Ruelle's inequality, Yomdin and Newhouse
upper semicontinuity, Misiurewicz's smooth examples without measures of maximal entropy) are not
covered by any roadmap. A roadmap for them consumes §§8.4–8.6: the Bowen–Ruelle theorem for
transitive Anosov flows and diffeomorphisms follows from §8.4's specification theorem and §8.5's
flow version once that roadmap proves that such systems are expansive, have specification on
their mixing pieces (or are suspensions of SFTs with Hölder roof via Markov sections), and that
Hölder potentials have the Bowen property. Billiards with curved or spherical scatterers and the
`N`-particle hard-sphere flow are likewise outside; they consume §3.5's almost-everywhere flows.

## Conventions

**Measures and systems.** Elementary factors, products and invariant-set lemmas use arbitrary
`μ : Measure X`. Probability statements carry `[IsProbabilityMeasure μ]`; state transport under
normalization of finite nonzero measures once, including normalization of correlations and
mean-zero subspaces. A *system* is `T : X → X` with
`MeasurePreserving T μ μ`; iteration is `T^[n]`, `n : ℕ`; `T` need not be invertible. An invertible
system is `T : X ≃ᵐ X` with `MeasurePreserving T μ μ`. Where a consumed interface is stated for
`μ : ProbabilityMeasure X` (PR #1421's `IsStrongMixing` and Birkhoff theorems), give the
`Measure`-level restatement for `[IsProbabilityMeasure μ]` once, in Layer 1.1, and use it.

Mixing, Koopman probability-system criteria and entropy statements carry invariant probability
measures unless a different measure hypothesis is explicit. Compact topological systems in
Layers 5–8 are nonempty; finite alphabets in full-shift entropy and equilibrium examples are
nonempty. State these as Lean hypotheses. General definitions may also accept empty carriers.

**Actions and flows.** Use `[Monoid M] [MulAction M X]`, measurability of each `(m • ·)`,
and `SMulInvariantMeasure M X μ`; additive versions use `AddMonoid`, `AddAction` and
`VAddInvariantMeasure`. Use Mathlib's `ErgodicSMul` and `ErgodicVAdd`. No commutativity or
invertibility is assumed in the monoid layers. For an action of a bare semigroup, extend it to
`WithOne` and prove that the invariant objects and factor predicates agree with those of the
original action. Joint measurability is required for parameter integration and the automatic
continuity theorem, with the parameter Borel σ-algebra on topological groups. A *measurable flow*
is a jointly measurable `AddAction ℝ X`; its time-`t` map is `(t +ᵥ ·)`. A continuous flow is
Mathlib's [`Flow τ X`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Dynamics/Flow.html#Flow)
for an additive topological monoid `τ`. Reuse `Flow.toAddAction` and its existing API.

**Null sets.** Equivariance almost everywhere means `∀ m, ∀ᵐ x, ...`; the exceptional set can
depend on `m`. A common invariant conull realization is a separate statement, proved for
countable actions where needed. Never interchange these quantifiers for an uncountable group.

**Følner conventions.** For a discrete group `G`, a left Følner family is
`F : ι → Finset G` along a nontrivial filter `l`, eventually nonempty, with
`#(g * F i ∆ F i) / #(F i) → 0` for each `g`. Finite-window quantities observe
`x ↦ g • x`, `g ∈ F i`, and are invariant under right translation of the window.
For `U_g f = f ∘ (g⁻¹ • ·)`, the corresponding averages are `#F⁻¹ ∑ g ∈ F, U_(g⁻¹) f`.
Prove the left/right conversion by inversion and keep the orientation explicit in every comparison
with `IsFoelner`. Pointwise statements use sequences indexed by `ℕ` with the temperedness and
growth hypotheses stated in §4.7; limits of finite-window quantities allow arbitrary `ι, l`.

**Correlations and limits.** Set correlations are taken in `ℝ` through `Measure.real`. The mixing
limit of a map uses `T^[n] ⁻¹' B`; that of an action uses `(m • ·) ⁻¹' B` along an explicit
filter. Group specializations use `cocompact`, and discrete groups use `cofinite`. Cesàro means of length
zero are zero; limits are over positive lengths.

**Eigenfunctions.** For a map, an eigenfunction with eigenvalue `λ : ℂ` is `f : Lp ℂ 2 μ`, `f ≠ 0`,
with `f ∘ T = λ f` almost everywhere (an eigenvector of `Lp.compMeasurePreservingₗᵢ`, Mathlib's
`Module.End.HasEigenvector`). For a real flow, `f : X → ℂ` is an eigenfunction with frequency
`α : ℝ` when it is measurable, not almost everywhere zero, and for every `t : ℝ`,
`f (t +ᵥ x) = exp (2π i α t) * f x` for μ-almost every `x` (the exceptional null set may depend on
`t`). A function is *constant* when it is almost everywhere equal to a constant.

**Spectral measures.** For an isometry `U` of a complex Hilbert space and a vector `f`, the
correlation sequence `n ↦ ⟪f, U^n f⟫` for `n ≥ 0`, extended by conjugation to `n < 0`, is positive
definite on `ℤ`; its *spectral measure* `σ_f` is the finite measure on Mathlib's `Circle` with
`⟪f, U^n f⟫ = ∫ z^n dσ_f(z)`. Inner products are conjugate-linear in the first argument (Mathlib's
convention). For a strongly continuous unitary representation of `ℝ`, `σ_f` is the finite measure on
`ℝ` with `⟪f, U_t f⟫ = ∫ exp(2π i t ξ) dσ_f(ξ)`. In general `σ_f` is the finite inner regular
measure on `PontryaginDual (Multiplicative G)` for additive `G`, with
`⟪f, U_g f⟫ = ∫ χ(g) dσ_f(χ)`; here `χ(g)` abbreviates `χ (.ofAdd g)`. The group Koopman
representation uses inverse action, so the spectral character of a pointwise eigenfunction
`f(g • x) = χ(g) f(x)` is `χ⁻¹`. Prove this sign conversion explicitly, including real frequencies.

**Entropy.** Logarithms are natural. Measure entropy is `measureEntropy μ T : ℝ≥0∞` (§4.0), so
infinite entropy is retained. Definitions in the literature that assume finite topological
entropy and take real values (pressure as a real supremum, equilibrium states and measures of
maximal entropy as real equalities) are recovered by the agreement theorems of §8.1. Topological entropy is Mathlib's
`Dynamics.coverEntropy T Set.univ : EReal`. Topological pressure is `EReal`-valued. Where measure
and topological quantities are compared, the measure entropy is coerced to `EReal` through
`ℝ≥0∞ → EReal`. The action quantities `actionMeasureEntropy`, `actionTopologicalEntropy` and
`actionTopologicalPressure` use the same codomains, with finite-window normalization by `#F`.

**Information and extended limits.** For `p : ℝ≥0∞` with `p ≤ 1`, use
`information p := (-ENNReal.log p).toENNReal : ℝ≥0∞`. Thus `information 0 = ⊤` and
`information 1 = 0`. In local entropy and SMB, normalize in `ℝ≥0∞` by positive window
cardinalities and take liminf, limsup and scale limits in `ℝ≥0∞`. Compare their `EReal`
coercions with `-ENNReal.log`; do not use a real-valued liminf for an unbounded information
sequence. Conditional information uses conditional probabilities, with nonnegativity and the
almost-everywhere bound by one proved before this conversion. State the map SMB theorem of §4.10
in this convention and prove its agreement with the real-valued form `-log μ(ξⁿ(x)) / n`.

**Invariant probabilities.** For a measurable `T : X → X`,
`invariantProbabilities T : Set (ProbabilityMeasure X)` is the set of `ν` with
`MeasurePreserving T ν ν`, carrying the weak topology of `ProbabilityMeasure`. Convexity and extreme
points are stated, as in Mathlib's `Ergodic.iff_mem_extremePoints`, for the corresponding subset
`{ν : Measure X | MeasurePreserving T ν ν ∧ IsProbabilityMeasure ν}` of `Measure X` over `ℝ≥0∞`. For
a continuous flow `ϕ : Flow ℝ X`, `flowInvariantProbabilities ϕ` is the intersection over `t` of
`invariantProbabilities (ϕ t)`. Define `actionInvariantProbabilities M` by intersection over all
parameters. On compact Hausdorff spaces use the subset of Radon probabilities, with the weak
topology defined by integration of continuous real functions. Build the compactness and
representation comparisons in §0.6; on compact metrizable spaces every Borel probability is Radon.

**Separated sets and Bowen balls.** On a compact metric space the dynamical entourages are
Mathlib's `Dynamics.dynEntourage T U n`; for metric statements use `U = {p | dist p.1 p.2 < ε}`,
so `B_n(x,ε) = {y | ∀ k < n, dist (T^[k] x) (T^[k] y) < ε}` (strict inequality, `n` points of the
orbit). An `(n,ε)`-separated set is Mathlib's `Dynamics.IsDynNetIn T Set.univ U n s`. For a flow,
`B_t(x,ε) = {y | ∀ s ∈ Set.Icc 0 t, dist (ϕ s x) (ϕ s y) < ε}`.

**Potentials.** A potential is a continuous `φ : X → ℝ` on a compact space (Mathlib's `C(X, ℝ)`).
Hölder hypotheses are written with Mathlib's `HolderWith C r φ`, not a new predicate.

## Existing library

Consume these declarations and extend their API rather than restating them.

| Foundation | Existing source |
| --- | --- |
| Measure-preserving maps, products and conjugation | Mathlib `MeasureTheory.MeasurePreserving` (`Mathlib/Dynamics/Ergodic/MeasurePreserving.lean`), `MeasurePreserving.prodMap`, `MeasurePreserving.symm`; Tau Ceti `MeasurePreserving.trim_comap`, `MeasurePreserving.isFiniteMeasure` (`TauCeti/Dynamics/Ergodic/MeasurePreserving.lean`) |
| Ergodicity and recurrence | Mathlib `PreErgodic`, `Ergodic`, `QuasiErgodic`, `Ergodic.ae_eq_const_of_ae_eq_comp₀`, `ergodic_conjugate_iff` (`Mathlib/Dynamics/Ergodic/Ergodic.lean`, `Function.lean`); `Conservative`, `MeasurePreserving.conservative`, `Conservative.ae_frequently_mem_of_mem_nhds` (Poincaré recurrence, `Conservative.lean`) |
| Ergodic actions | Mathlib `ErgodicSMul`, `ErgodicVAdd`, `ergodicSMul_iterateMulAct` (`Mathlib/Dynamics/Ergodic/Action/Basic.lean`), `ergodic_mul_left_iff_denseRange_zpow` (`Action/OfMinimal.lean`); Tau Ceti `ErgodicSMul.map`, `ergodicSMul_map_iff` (`TauCeti/Dynamics/Ergodic/Action/Map.lean`) |
| Ergodic measures as extreme points | Mathlib `Ergodic.iff_mem_extremePoints`, `Ergodic.eq_of_absolutelyContinuous` (`Mathlib/Dynamics/Ergodic/Extreme.lean`) |
| Examples on the circle | Mathlib `ergodic_add_left`, `ergodic_nsmul`, `ergodic_zsmul_add` (`Mathlib/Dynamics/Ergodic/AddCircle.lean`, `AddCircleAdd.lean`) |
| Birkhoff sums and averages | Mathlib `birkhoffSum`, `birkhoffAverage` (`Mathlib/Dynamics/BirkhoffSum/`); Tau Ceti `Function.IsPeriodicPt.birkhoffSum_apply_eq` (`TauCeti/Dynamics/BirkhoffSum/Cyclic.lean`) |
| Mean ergodic theorem and Koopman operators | Mathlib `ContinuousLinearMap.tendsto_birkhoffAverage_orthogonalProjection` (`Mathlib/Analysis/InnerProductSpace/MeanErgodic.lean`), `Lp.compMeasurePreservingₗᵢ`, `Lp.compMeasurePreserving_continuous`; Tau Ceti `fixedSpace`, `metProjection`, `birkhoffAverage_tendsto_metProjection`, `metProjection_eq_condExpL2`, `fixedSpace_eq_lpMeas_invariants`, `koopmanMarkov` (`TauCeti/Probability/Ergodic/`) |
| Invariant measures of continuous maps | Mathlib `empiricalMeasure`, `exists_measurePreserving_probabilityMeasure_of_compact_forwardInvariant` (`Mathlib/Dynamics/Ergodic/EmpiricalMeasure.lean`); compactness of `ProbabilityMeasure E` for compact `E` (`Mathlib/MeasureTheory/Measure/Prokhorov.lean`) |
| Topological entropy | Mathlib `Dynamics.dynEntourage`, `IsDynCoverOf`, `IsDynNetIn`, `coverMincard`, `netMaxcard`, `coverEntropy`, `coverEntropyInf`, `coverEntropy_eq_iSup_netEntropyEntourage`, `coverEntropy_image_of_comap` (`Mathlib/Dynamics/TopologicalEntropy/`) |
| Radon probability foundation | Mathlib Riesz–Markov–Kakutani (`Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/`), weak-* compactness and `ProbabilityMeasure`; §0.6 supplies the compact Hausdorff comparisons. |
| Følner families | Mathlib `IsFoelner`, `IsAddFoelner`, `maxFoelner` (`Mathlib/MeasureTheory/Group/FoelnerFilter.lean`); Tau Ceti `HasFoelnerSets`, `IsFoelner.tendsto_card_smul_symmDiff_div_card`, `Amenable.hasFoelnerSets`, `hasFoelnerSets_iff_exists_seq` and `Mean.tendsto_average_ofIsFoelner` (`TauCeti/GroupTheory/Amenable/`). The last theorem concerns scalar means, not the Hilbert or pointwise ergodic theorems. |
| Topological dynamics | Mathlib `Flow`, `Flow.fromIter`, `Homeomorph.flow` (`Mathlib/Dynamics/Flow.lean`), `MulAction.IsMinimal`, `MulAction.IsTopologicallyTransitive`; Tau Ceti `Flow` API (`TauCeti/Dynamics/Flow/`) |
| Shifts and product measures | Mathlib `mulShift`, `Subshift`, `cylinder` (`Mathlib/Dynamics/SymbolicDynamics/Basic.lean`), `Measure.infinitePi`; Tau Ceti `shift` (`TauCeti/Probability/Process/PathLaw/Basic.lean`), `ergodic_shift_infinitePi_const`, `ergodic_shift_of_iIndepFun` (`TauCeti/Probability/Ergodic/BernoulliShift.lean`), `markovChainLaw` (`TauCeti/Probability/Process/MarkovChain.lean`) |
| Projective limits and disintegration | Tau Ceti `TauCeti.Measure.exists_isProjectiveLimit_of_countable` (`TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean`), Mathlib `IsProjectiveLimit.unique`, `Measure.condKernel`, `Measure.disintegrate`, `eq_condKernel_of_measure_eq_compProd` and `ProbabilityTheory.condExpKernel`; these supply the probability laws and conditional kernels in §§0.7–0.8. |
| Positive-definite functions | Tau Ceti `exists_isFiniteMeasure_integral_zpow_eq` (Herglotz, `TauCeti/Analysis/Bochner/Herglotz.lean`), `bochner` (`TauCeti/Analysis/Bochner/BochnerTheorem.lean`), `IsPositiveDefiniteSub.existsUnique_innerRegular_pontryaginMeasureTransform_eq_of_continuousAt` (`LocallyCompactGroup.lean`) |
| Operators and Fourier analysis | Mathlib `IsCompactOperator`, `spectrum.gelfand_formula`, `fourier`, `span_fourier_closure_eq_top` (`Mathlib/Analysis/Fourier/AddCircle.lean`), `UnitAddTorus`, `mFourier` (`AddCircleMulti.lean`); Tau Ceti `IsStarNormal` compact spectral theorem (`TauCeti/Analysis/InnerProductSpace/Spectral/CompactNormal.lean`) |
| Entropy inequalities | Mathlib `Real.negMulLog`, `Real.concaveOn_negMulLog`, `Subadditive.tendsto_lim`; Tau Ceti Kullback–Leibler divergence (`TauCeti/InformationTheory/KullbackLeibler/`) |
| Plane topology | Mathlib `Polygon`, `Polygon.boundary`, `Polygon.HasNondegenerateEdges` (`Mathlib/Geometry/Polygon/Basic.lean`); Tau Ceti `IsJordanCurve`, `filledHull`, `IsJordanCurve.frontier_filledHull`, `IsJordanCurve.interior_filledHull` (`TauCeti/Topology/`, `TauCeti/Analysis/Complex/PlaneSeparation/Inside.lean`) |
| Toral automorphism example | Tau Ceti `catMap` (`TauCeti/Dynamics/CatMap.lean`) |
| Positive matrices | Tau Ceti `TauCeti.Matrix.hilbertProjectiveDist_mulVec_le` (Birkhoff's contraction for Hilbert's projective metric, `TauCeti/Data/Matrix/BirkhoffContraction.lean`); Mathlib `HolderWith`, `spectralRadius` |

## Layers and dependencies

| Layer | Content | Prerequisites |
| --- | --- | --- |
| 0 | Monoid factors, finite observations, Radon probabilities, Koopman, natural extensions, joinings, induced maps and towers | Mathlib; Tau Ceti; PR #851 §4.2 (Koopman, return times) |
| 1 | Mixing for filtered monoid actions; natural extensions and relative weak mixing for groups | Layer 0; PR #1421 §4.6 |
| 2 | Group representations, abelian spectral measures and Følner mean ergodic theorem | Layers 0–1; Herglotz, Bochner; AmenableGroups |
| 3 | Measurable and continuous flows: time-`t` maps, weak mixing, suspension flows, invariant measures, almost-everywhere flows, rates of mixing | Layers 0–2 |
| 4 | Partition entropy and Kolmogorov–Sinai entropy, amenable entropy, relative entropy and addition, generators and natural extensions; pointwise ergodic and SMB theorems, ergodic decomposition of entropy | Layers 0–1; §2.5 for §4.7; PR #1421 §§4.1–4.3, §5.1a; PR #851 §4.2 (group-action ergodic decomposition) for §4.7; AmenableGroups |
| 5 | Topological entropy and pressure for maps, amenable actions and flows | Layer 0; §4.6 limit lemma for §5.6; Mathlib topological entropy |
| 6 | Measure entropy of continuous maps: small partitions, expansiveness, upper semicontinuity, Brin–Katok, Abramov's formula for flows | Layers 3–5 |
| 7 | Variational principles for maps, amenable actions and flows | Layers 3–6 |
| 8 | Equilibrium states and measures of maximal entropy; agreement with finite-entropy formulations; uniqueness under specification, subshifts of finite type, suspension flows and the Ruelle–Perron–Frobenius theorem | Layers 0, 3–7 |
| 9 | Billiard flows of polygonal domains, including holes | Layers 0, 3 |

The map-entropy sections §§4.0–4.5 and map-pressure sections §§5.1–5.5 are independent.
The amenable branches use the dependencies shown in the table. Layer 9 needs only the flow
vocabulary of Layers 0 and 3; the description of its weak mixing also uses Layer 2.

## Layer 0: Systems, factors and examples

### 0.1 Factors and isomorphism mod 0

Define `IsFactorMap π T S μ ν` for `π : X → Y`, systems `T` on `(X, μ)` and `S` on `(Y, ν)`:
`MeasurePreserving π μ ν` and `π ∘ T =ᵐ[μ] S ∘ π`. Define `IsIsomorphicModNull T μ S ν`: there are
measurable sets `X₀ ⊆ X`, `Y₀ ⊆ Y` of full measure with `MapsTo T X₀ X₀`, `MapsTo S Y₀ Y₀`, and a
measurable equivalence `X₀ ≃ᵐ Y₀` that preserves the restricted measures and conjugates the
restrictions of `T` and `S`. For invertible systems require invariance in both time directions.
Prove that isomorphism mod 0 is an equivalence relation, that it is
implied by a measure-preserving conjugacy `X ≃ᵐ Y`, that factor maps compose, and that ergodicity,
the properties of Layer 1 and entropy (Layer 4) pass to factors (ergodicity and mixing) and are
invariant under isomorphism mod 0. Products: `Prod.map T S` on `μ.prod ν` is a system, and both
projections are factor maps.

Develop the action interface for arbitrary monoids: `IsFactorMapSMul M π μ ν` means
`MeasurePreserving π μ ν` and `∀ m, π ∘ (m • ·) =ᵐ[μ] (m • ·) ∘ π`; supply the additive
`IsFactorMapVAdd` version. Prove identity, composition, products, coordinate projections,
restriction of parameters along monoid homomorphisms, and descent of ergodicity and weak mixing.
Define the invariant σ-algebra using measurable sets satisfying
`∀ m, (m • ·) ⁻¹' A =ᵐ[μ] A`, with its pullback and factor compatibility. These constructions
use arbitrary measures; conditional-expectation results carry the necessary finiteness hypotheses.
For countable monoids give the common invariant conull realization of almost-everywhere
intertwiners; for arbitrary monoids formulate isomorphism through mutually inverse measurable
maps almost everywhere, intertwining each parameter almost everywhere. Prove the equivalence
with the conull-set definition for a single map and for countable actions. Identify the map
interfaces through `IterateMulAct`, and invertible maps through their ℤ-actions.

**Checks.**

- The identity is a factor map from any system to itself, and the constant map to a point is a
  factor map onto the trivial system.
- On two equiprobable points, the identity and the swap are not isomorphic mod 0 (one is ergodic,
  the other not), although both preserve the measure.
- The doubling map on `UnitAddCircle` is a factor of the one-sided Bernoulli `(1/2,1/2)` shift via
  binary expansion, an isomorphism mod 0 (the dyadic rationals form a null set).

*Needs:* Mathlib `MeasurePreserving`, `MeasurableEquiv`, `Measure.prod`.

### 0.2 Koopman representations and strong continuity

For a monoid action, use Mathlib's `Lp.compMeasurePreservingₗᵢ` for each parameter and prove
`C_(mn) = C_n ∘ C_m` for `C_m f = f ∘ (m • ·)`. Package the isometric representation of the
opposite monoid using the existing representation API. Prove compatibility with adjoining an
identity to a semigroup action, including its factor predicates and invariant σ-algebra. Identify invariant vectors with functions
measurable for the invariant σ-algebra (for probability measures), and prove compatibility with
factor pullback, products and normalization. For groups, `U_g = C_(g⁻¹)` is the usual unitary
representation on `L²`. For a map the operator is Mathlib's `Lp.compMeasurePreservingₗᵢ`; Tau Ceti's
`fixedSpace` and `metProjection` give its fixed space and the mean ergodic projection. For a group
action, consume PR #851's `scalarLpKoopman p μ hμ : ContRepresentation ℂ G (Lp ℂ p μ)`.

Prove `scalarLpKoopman_continuous_of_measurable`: if `G` is a second-countable locally compact
group with a Haar measure, the action is jointly measurable (`MeasurableVAdd₂ G X`), `μ` is a
finite invariant measure and `1 ≤ p < ∞`, then `g ↦ scalarLpKoopman p μ hμ g f` is continuous for
every `f`. PR #851's strong-continuity target covers continuous actions on R₁ spaces; this target
needs no topology on `X`. Route: for `f` bounded measurable, Fubini makes
`(g, x) ↦ f (g⁻¹ • x)` measurable on `G × X`, and the map `g ↦ π(g) f` is almost everywhere equal
to local `L²`-limits of simple tensors on finite-Haar-measure parameter sets, hence strongly
measurable and separably valued; a
strongly measurable homomorphism into the unitary group of a Hilbert space is continuous (the
convolution argument against an approximate identity in `L¹(G)`). Deduce `Lᵖ` from `L²` by
density of bounded functions.

**Checks.**

- For `ℝ` acting on `UnitAddCircle` by `t +ᵥ x = x + t`, `‖π(t) f - f‖₂ → 0` as `t → 0` for
  `f = 1_[0,1/2)`, although `‖π(t) f - f‖_∞ = 1` for small `t ≠ 0`.
- The trivial action has `π(g) = 1` for every `g`.

*Needs:* PR #851 §4.2 (`scalarLpKoopman`); Mathlib Haar measure, `Lp`, Fubini.

### 0.3 Standard examples

Build each example with its measure-preservation proof and the ergodic and mixing statements listed
in Layer 1.4.

1. **Rotations.** Translations on `AddCircle T`, on `UnitAddTorus (Fin d)` and on a compact
   abelian group with Haar probability (Mathlib's rotations, `ergodic_add_left`,
   `ergodic_mul_left_iff_denseRange_zpow`).
2. **Bernoulli shifts.** One-sided: Tau Ceti `shift α` on `ℕ → α` with `Measure.infinitePi
   (fun _ => p)`. Two-sided: the left shift on `ℤ → α` with the same product, as an invertible
   system. Define `bernoulliShift p` and `bernoulliShiftTwoSided p` for `p : Measure α` with
   `[IsProbabilityMeasure p]` and any measurable `α`. For every countable discrete group `G`,
   construct the Bernoulli action on `G → α` with product probability and
   `(g • x) h = x (g⁻¹ * h)`. Prove preservation by permutation of coordinates, identify its
   finite-coordinate cylinders, and give the ℤ and ℤᵈ specializations. Use Mathlib's shift
   vocabulary, with an explicit inverse/opposite-action conversion when its convention differs.
3. **Markov shifts.** For a Markov kernel `κ` on a countable `S` with an invariant probability
   `π` (`ProbabilityTheory.Kernel.Invariant κ π`), the stationary chain law
   `markovChainLaw π κ` on `ℕ → S` is shift invariant. Define `markovShift κ π` and its two-sided
   extension on `ℤ → S` by Tau Ceti's countable projective-limit theorem applied to the stationary
   finite-dimensional laws. Identify these concrete examples with natural extensions in §0.7.
4. **Toral endomorphisms.** For `A : Matrix (Fin d) (Fin d) ℤ` with `A.det ≠ 0`, define
   `toralEndomorphism A : UnitAddTorus (Fin d) → UnitAddTorus (Fin d)` by the induced action on
   `ℝ^d / ℤ^d`. It preserves the Haar probability `volume`. For `A.det = ±1` it is a measurable
   automorphism. The cat map is `toralEndomorphism catMap`.
5. **Linear flows on tori.** For `v : Fin d → ℝ`, the flow `t +ᵥ x = x + t • v` on
   `UnitAddTorus (Fin d)`, with `MeasurableVAdd₂` and invariance of `volume`.

**Checks.**

- `toralEndomorphism !![2,0;0,1]` preserves `volume` but is not injective.
- The two-sided shift is invertible and its inverse is the right shift.
- A Markov kernel on two states that always switches state, with `π` uniform, gives the
  two-point periodic chain; the shift on its law is ergodic but not mixing.

*Needs:* Mathlib `AddCircle`, `UnitAddTorus`, `Measure.infinitePi`, `Kernel.Invariant`; Tau Ceti
`shift`, `markovChainLaw`, `catMap`; MarkovChainsAndRenewal Layer 0 for countable kernels.

### 0.4 Induced maps, towers and the Rokhlin lemma

Consume PR #851's `positiveReturnTime T A x : ℕ∞` and `kac_return_time_integral`. Define the
first-return (induced) map `inducedMap T A` on `A`, equal to `T^[positiveReturnTime T A x] x` where
the return time is finite and to `x` elsewhere. For a system `T` and measurable `A` with
`μ A > 0`, prove that `inducedMap T A` preserves the normalized restriction
`(μ A)⁻¹ • μ.restrict A` (no invertibility is needed: use Mathlib's recurrence
`Conservative.ae_mem_imp_frequently_image_mem` for finiteness of returns), and that it is ergodic
when `T` is ergodic. Prove Kac's formula in the noninvertible form: for ergodic `T`,
`∫⁻ x in A, (positiveReturnTime T A x : ℝ≥0∞) ∂μ = 1` (PR #851 proves it for measurable
equivalences).

Define the Kakutani tower (skyscraper) over a system `(Y, S, ν)` with height function
`h : Y → ℕ+` of finite integral, as a system on `{(y, k) | k < h y}` with the normalized measure;
prove that the induced map of the tower on its base is `S`. For an invertible probability system
and a measurable complete section `A` (`⋃ k : ℤ, T^k A` is conull), prove the converse tower
representation using recurrence in both time directions. The ergodic case for any set of positive
measure follows because that set is a complete section.

Prove the **Rokhlin lemma**: for an invertible probability system (`[IsProbabilityMeasure μ]`)
on a standard Borel space
(`[StandardBorelSpace X]`) that is aperiodic (`μ {x | T^[n] x = x} = 0` for every `n ≥ 1`), every
`n ≥ 1` and `ε > 0`, there is a measurable `B` with `B, T B, …, T^(n-1) B` pairwise disjoint and
`μ (⋃ k < n, T^k B) > 1 - ε`. Prove the **Borel marker lemma** for an aperiodic Borel
automorphism of a standard Borel space: there are decreasing Borel complete sections with empty
intersection (Kechris–Miller, *Topics in Orbit Equivalence*, Lemma 6.7). Apply it after removing
the invariant null set of periodic points to obtain a complete section `A` with `μ A < ε/n`.
Recurrence for `T` and `T⁻¹` gives finite hitting times on a conull saturation; cut its Kakutani
tower into blocks of height `n`. Prove that the uncovered levels have total measure at most
`n * μ A < ε`, including columns shorter than `n`. This proof uses no ergodicity assumption.

**Checks.**

- For the identity map, every point returns at time 1 and the induced map is the identity on `A`.
- For the rotation by `1/3` on `UnitAddCircle` and `A = [0, 1/3)`, the return time is 3 on `A` and
  the induced map is the identity. The rotation is periodic, so the aperiodicity hypothesis of the
  Rokhlin lemma fails: in a tower of height 4, `B` and `T^3 B = B` are disjoint, so `B` is empty.

*Needs:* PR #851 §4.2 (return times, Kac); Mathlib `Conservative`, `StandardBorelSpace`.

### 0.5 Finite orbit observations

For a monoid action, `F : Finset M` and a label `ξ : X → A`, define the orbit label
`x ↦ (fun g : F => ξ (g • x))`, indexed by the subtype `F`, and its generated σ-algebra.
Define finite-window sums `∑ g ∈ F, f (g • x)` and dynamical entourages
`{(x, y) | ∀ g ∈ F, (g • x, g • y) ∈ U}` using Mathlib's relation vocabulary.
Prove measurability, reindexing, finite-union and restriction laws, and compatibility with
factors and products. For group actions prove the right-translation laws and the corresponding
entropy invariance for invariant probabilities. For `IterateMulAct T` and `F = range n`, identify
them with `iteratedPartitionLabel`, `birkhoffSum` and `Dynamics.dynEntourage`.

For continuous actions on a uniform space define finite-window separated and spanning sets by
these entourages, with monotonicity and factor transport; identify the map versions with
`IsDynNetIn` and `IsDynCoverOf`. These finite-window constructions require no amenability.

**Checks.** The empty window gives the trivial label and the universal entourage; singleton
windows recover the corresponding translate. Rectangles in ℤ² give the rectangular orbit labels.

*Needs:* §§0.1–0.2; Mathlib finite sums, uniformity and dynamical entourages.

### 0.6 Radon probabilities on compact Hausdorff spaces

For a nonempty compact Hausdorff space, identify Radon Borel probabilities with positive normalized
continuous linear functionals on `C(X, ℝ)` by Mathlib's Riesz–Markov–Kakutani theorem. Use this
identification and weak-* compactness to prove compactness, continuity of pushforward under
continuous maps, and existence of barycenters of probability families. Give evaluation and
uniqueness lemmas by integration against continuous functions. Relate this topology to Mathlib's
`ProbabilityMeasure` weak topology; on compact metrizable spaces identify all Borel probabilities
with these Radon probabilities. Prove that invariance under each continuous map is a closed
linear condition, so invariant probabilities of any continuous monoid action form a compact
convex set. Existence is specified for maps, real flows and amenable actions in their sections.

**Checks.** Probabilities of a finite discrete space form its usual simplex; the Dirac embedding
is continuous and its pushforward is the Dirac embedding after composition.

*Needs:* Mathlib Riesz–Markov–Kakutani, weak-* compactness, `ProbabilityMeasure`.

### 0.7 Natural extensions of endomorphisms

For a probability-preserving measurable `T : X → X` on a standard Borel space define
`NaturalExtensionSpace T := {x : ℕ → X | ∀ k, T (x (k+1)) = x k}` with its subtype σ-algebra.
Prove this compatible-history set is measurable and standard Borel. Define the forward map
`(x₀, x₁, ...) ↦ (T x₀, x₀, x₁, ...)` and its inverse, which drops the first coordinate, as
an honest `MeasurableEquiv` of the subtype. Define the projection `p₀ x = x₀`.

Construct the history law from finite-dimensional laws
`μ.map (fun y => (fun k : Fin (n+1) => T^[n-k] y))`, using
`TauCeti.Measure.exists_isProjectiveLimit_of_countable` and `IsProjectiveLimit.unique`.
Prove consistency, concentration on compatible histories, invariance of the subtype law and
`MeasurePreserving p₀ μ̃ μ`. Thus `p₀` is an exact factor map and every coordinate has law `μ`.

Prove the universal property modulo null sets: for any invertible probability system `(Z,R,ρ)`
and factor `π : Z → X`, the map with coordinates `π (R^(-k) z)` defines a factor to the history
system after redefining it on an invariant null set; it is unique almost everywhere among
intertwiners projecting to `π`. Prove minimality: the σ-algebras of `p₀ ∘ T̃^(-k)` generate the
history σ-algebra. Prove uniqueness of the natural extension up to isomorphism mod null sets,
and compatibility with products, giving `(T × S)̃ ≅ T̃ × S̃`.

**Checks.** If `T` is invertible, `x ↦ (T^(-k) x)_k` is a measurable conjugacy with its history
system, preserving the law. For standard Borel alphabets, give explicit everywhere-defined
measurable equivalences between the histories of the concrete one-sided Bernoulli and stationary
Markov shifts of §0.3 and their concrete two-sided shifts. The equivalences preserve their laws.

*Needs:* §0.1; Tau Ceti countable projective limits; Mathlib measurable diagonals, countable
products, subtypes and `MeasurableEquiv`. Mixing and entropy compatibility are in §§1.5 and 4.2.

### 0.8 Joinings and relatively independent products

For probability-preserving monoid actions on `X` and `Y`, define a joining as an invariant
probability on `X × Y` with marginals `μ` and `ν`. Prove that the product measure is a joining,
factors push joinings forward, coordinate interchange swaps their marginals, and graph measures
of factor maps are joinings. For continuous actions on compact metrizable spaces, prove the set
of joinings with fixed invariant marginals is nonempty, convex and compact in the weak topology.

For measure-preserving actions of a countable discrete group on standard Borel probability
spaces, and factors `π : X → Z`, `q : Y → Z` with common law `ρ`, disintegrate
`μ = ∫ μ_z dρ` and `ν = ∫ ν_z dρ` using `Measure.condKernel` of the graph laws. Prove that the
kernels are concentrated on their fibres almost everywhere, are unique up to `ρ`-null sets,
and satisfy `∀ g, ∀ᵐ z, (g • ·)_* μ_z = μ_(g • z)` and the corresponding identity for `ν_z`.
The group inverse and uniqueness of disintegration supply this equivariance.

Define the relatively independent product as `∫ (μ_z.prod ν_z) dρ`, initially a measure on
`X × Y`. Prove its marginals, concentration on `π x = q y`, invariance, independence of kernel
versions and the conditional-integral identity for bounded product observables. Transport it to
the measurable fibre-product subtype. Prove functoriality under isomorphisms over the base and
associativity of relative products. The relative self-product uses `π = q`.

**Checks.** Over a one-point factor the relative product is the ordinary product; over an
identity factor it is the diagonal measure. For the endomorphism factor `π = σ` of a one-sided
fair-coin shift, the fibrewise product is carried by `(σ × σ)` to the diagonal measure and is
not invariant; prove this check to distinguish ordinary monoid joinings from the group-relative
construction.

*Needs:* §§0.1, 0.6; Mathlib conditional kernels and their uniqueness, kernel products, measurable
diagonals and integration; Tau Ceti disintegration API where it extends Mathlib.

## Layer 1: The mixing hierarchy

### 1.0 Filtered mixing foundations

Define `MixingAlong M X μ l` for a measure-preserving monoid action and `l : Filter M` by
`∀ A B` measurable, `Tendsto (fun m => μ.real (A ∩ (m • ·) ⁻¹' B)) l
(𝓝 (μ.real A * μ.real B))`. Keep measure preservation as an explicit ambient hypothesis.
The definition accepts any filter; theorems deducing ergodicity assume `l.NeBot`.
Define `WeakMixingSMul M X μ` by ergodicity of the diagonal action on `X × X`, with additive
version `WeakMixingVAdd`. Prove factor inheritance, conjugacy invariance, the rectangle-to-product
mixing theorem, and the tests on generating π-systems and `L²` correlations. For a nontrivial
filter, filtered mixing implies diagonal weak mixing; weak mixing implies ergodicity.
Prove reparameterization along `a : N → M` using `Filter.map a l`, and monotonicity under
refinement of the filter. Specialize to `IterateMulAct T` along `atTop` to recover §1.1.

**Checks.** The filter for a discrete infinite group is `cofinite`; the map case uses `atTop`.
Mixing along `⊥` is vacuous, so the ergodicity implication carries `NeBot`.

*Needs:* §§0.1–0.2; Mathlib measure-preserving products, π-systems and `Lp`.

### 1.1 Mixing and weak mixing of a map

Consume PR #1421's `IsStrongMixing T μ` (for `μ : ProbabilityMeasure X`, as specified there) and
prove `isStrongMixing_iff` restating it for `μ : Measure X` with `[IsProbabilityMeasure μ]`:
`MeasurePreserving T μ μ` and, for all measurable `A`, `B`,
`Tendsto (fun n => μ.real (A ∩ T^[n] ⁻¹' B)) atTop (𝓝 (μ.real A * μ.real B))`. Prove that it
suffices to check `A`, `B` in a π-system generating the σ-algebra, and that it is equivalent to
`∫ f * (g ∘ T^[n]) dμ → ∫ f dμ * ∫ g dμ` for all `f, g ∈ L²`.

Define `WeakMixing T μ`, a structure extending `MeasurePreserving T μ μ` with
`ergodic_prodMap : Ergodic (Prod.map T T) (μ.prod μ)`. Prove the equivalences:

1. `WeakMixing T μ`;
2. for all measurable `A`, `B`, the Cesàro means
   `(1/N) ∑_{n<N} |μ.real (A ∩ T^[n] ⁻¹' B) - μ.real A * μ.real B|` tend to `0`;
3. the same with `|…|²`;
4. for all measurable `A`, `B` there is a set `J ⊆ ℕ` of natural density one along which the
   correlations converge (density defined by `#(J ∩ range N)/N → 1`);
5. `Ergodic (Prod.map T S) (μ.prod ν)` for every ergodic system `S` on every probability space
   `(Y, ν)`.

Prove `WeakMixing.ergodic`, `IsStrongMixing.weakMixing`, and that `T^[k]` is weakly mixing for
every `k ≥ 1` when `T` is. Route for 1 ⇒ 2: for `f ∈ L²` with mean zero,
`|⟪U^n f, g⟫|² = ⟪U_{T×T}^n (f ⊗ f̄), g ⊗ ḡ⟫`, and the mean ergodic theorem for `T × T` (Tau Ceti
`birkhoffAverage_tendsto_metProjection`) gives Cesàro convergence to `|∫f|²|∫g|² = 0`; then
Cauchy–Schwarz. Route for 2 ⇒ 5: test on rectangles `A × C`, `B × D`. The equivalence with
spectral conditions is Layer 2.3.

**Checks.**

- The swap on two equiprobable points is ergodic but not weakly mixing (take `A = B = {0}`).
- An irrational rotation of `UnitAddCircle` is ergodic and not weakly mixing: the product system
  preserves `{(x, y) | x - y ∈ [0, 1/2)}`, of measure `1/2`.
- Identity on a one-point space is strongly mixing.

*Needs:* PR #1421 §4.6 (`IsStrongMixing`); Mathlib `Ergodic`, `MeasurePreserving.prodMap`; Tau Ceti
mean ergodic theorem.

### 1.2 Mixing of all orders

For an action of a locally compact Hausdorff group `G`, define mixing of order `k ≥ 1` by
`μ.real (⋂ i, g_i • A_i) → ∏ i, μ.real A_i` as all pairwise relative displacements
`g_i⁻¹ * g_j`, `i ≠ j`, escape compact sets. Define the configuration filter as the infimum of
the comaps of `cocompact G` under these displacement maps. Use measurable images for group
actions and prove the equivalent preimage formulation, with its reversed displacement order.
Prove factor inheritance, conjugacy invariance and the implication from order `k + 1` to order
`k` when `G` is noncompact. Infinite discrete Bernoulli group actions are mixing of every order
by independence of separated finite coordinate supports.

For a map define `IsMixingOfOrder T μ k` for `k ≥ 1`: for measurable `A₀, …, A_k`,
`μ.real (⋂ i, T^[n_i] ⁻¹' A_i) → ∏ i, μ.real A_i` as `n_0 = 0` and the gaps `n_{i+1} - n_i` tend
to infinity (along the product of `atTop` filters on the gaps). Order 1 is `IsStrongMixing`.
Prove that order `k + 1` implies order `k`, and that Bernoulli shifts (one- and two-sided) are
mixing of every order (cylinder sets with separated supports are independent; approximate
measurable sets by cylinders).

**Checks.** For the one-sided `(1/2,1/2)` shift and `A_i = {x | x 0 = 0}`, the correlation equals
`2^(-(k+1))` as soon as all gaps are positive.

*Needs:* §§0.3, 0.5, 1.0–1.1.

### 1.3 Mixing for group actions

For an action of a topological group `G` as in the conventions, define the classes
`MixingVAdd G X μ`: for measurable `A`, `B`,
`Tendsto (fun g => μ.real (A ∩ (g +ᵥ ·) ⁻¹' B)) (cocompact G) (𝓝 (μ.real A * μ.real B))`; and
the already defined `WeakMixingVAdd G X μ`. Identify `MixingVAdd` with `MixingAlong` along
`cocompact G`; give multiplicative versions by `to_additive`. Prove: mixing implies weak mixing for
noncompact `G`; weak mixing implies ergodicity; for compact `G` (where `cocompact G = ⊥`) every
action is mixing, so statements needing a genuine limit assume `G` noncompact. For `G = ℤ` or
`G = ℝ`, `cocompact` is the union of the two ends and, by invariance of the measure, `MixingVAdd`
is equivalent to the same limit along `atTop`.

For `T : X ≃ᵐ X` define the action `MeasurableEquiv.zAddAction T` of `ℤ` by `n +ᵥ x = (T^n) x`
(powers in `Equiv.Perm X`), with `MeasurableVAdd₂`. Prove `isStrongMixing_iff_mixingVAdd` and
`weakMixing_iff_weakMixingVAdd` for it, and for noninvertible `T` relate `WeakMixing` to Mathlib's
`IterateMulAct` formulation as `ergodicSMul_iterateMulAct` does for ergodicity.

**Checks.**

- The trivial action of `ℤ` on a two-point space is ergodic only if the measure is a Dirac mass.
- An action of a finite group is mixing by the definition (the limit is along `⊥`); the regular
  action of `ZMod 2` on itself is ergodic but not weakly mixing.

*Needs:* §1.1; Mathlib `ErgodicVAdd`, `Filter.cocompact`.

### 1.4 The examples

Prove:

1. a rotation of a compact abelian group with Haar probability is never weakly mixing unless the
   group is trivial (a nontrivial character is an eigenfunction), and is ergodic iff the powers of
   the rotation are dense (Mathlib);
2. Bernoulli shifts are strongly mixing, hence weakly mixing and ergodic (extending Tau Ceti's
   `ergodic_shift_infinitePi_const`); Bernoulli actions of every infinite countable discrete
   group are mixing along `cofinite` and mixing of every order;
3. a stationary Markov shift on a finite `S` with invariant `π` of full support is ergodic iff
   `κ` is irreducible, and strongly mixing iff `κ` is irreducible and aperiodic (consume
   MarkovChainsAndRenewal Layer 3 convergence to equilibrium for the mixing direction);
4. `toralEndomorphism A` is ergodic iff no eigenvalue of `A` is a root of unity, and is then
   strongly mixing (Fourier series on `UnitAddTorus`, Mathlib `mFourier`: ergodicity iff no
   nonzero integer vector has a finite orbit under the transpose, and mixing because a
   nonzero vector has infinite orbit, so the Fourier coefficients eventually separate);
5. the cat map is strongly mixing.

**Checks.** `toralEndomorphism !![0,1;1,0]` (the swap of coordinates) has eigenvalues `±1` and is not
ergodic: `exp(2πi(x₁ + x₂))` is a nonconstant invariant function.

*Needs:* §§0.3, 1.1–1.3; MarkovChainsAndRenewal Layer 3; Mathlib Fourier analysis on tori.

### 1.5 Natural extensions and relative weak mixing

For §0.7's natural extension, prove that ergodicity, strong mixing, weak mixing and mixing of
each finite order hold exactly when they hold for the original endomorphism. Use cylinder
approximation for ergodicity and mixing; for weak mixing use the product compatibility of natural
extensions and ergodicity of their squares. The concrete one-sided/two-sided shift examples
therefore have the same mixing properties.

For a factor of countable group actions on standard Borel probability spaces, define a
relatively ergodic extension by the condition that every invariant measurable set upstairs is
almost everywhere the pullback of an invariant measurable set of the base. Define relative
weak mixing by relative ergodicity of the relative self-product over the base. Prove the
invariant-function restatement using bounded measurable functions and disintegration. These
definitions permit nonergodic bases.

Prove that relative weak mixing implies relative ergodicity, is invariant under isomorphisms
over the base, and passes to intermediate factors over the same base. Over a one-point base it
is ordinary weak mixing. For an ergodic base it is equivalent to ergodicity of the relative
self-product. Prove that a product extension `Z × W → Z` is relatively weakly mixing when the
`W`-action is weakly mixing, without assuming the base ergodic.

**Checks.** The identity extension is relatively weakly mixing over every base, including a
nonergodic one. A product over an identity two-point base with a nontrivial Bernoulli ℤ-action in
the fibre is relatively weakly mixing, but its relative self-product is not absolutely ergodic.

*Needs:* §§0.7–0.8, 1.0–1.4. Prove the conditional integral and invariant-function tests used above
from §0.8's disintegration identity.

## Layer 2: Spectral theory

### 2.1 Spectral measures

For an isometry `U` of a complex Hilbert space `H` and `f : H`, define `spectralMeasure U f :
Measure Circle` from the positive-definite function `n ↦ ⟪f, U^n f⟫` (extended to `ℤ` by
conjugation) by Tau Ceti's Herglotz theorem `exists_isFiniteMeasure_integral_zpow_eq`, with
uniqueness from `isPositiveDefiniteSub_iff_exists_isFiniteMeasure_integral_zpow_eq` and the density
of trigonometric polynomials. Prove positive definiteness from `U` being an isometry, total mass
`‖f‖²`, and the cyclic identity `⟪U^m f, U^n f⟫ = ∫ z^(n-m) dσ_f` for `m, n ≥ 0`. Define the
cross-spectral complex measure `σ_{f,g}` by polarization.

For a strongly continuous unitary representation `U` of a locally compact Hausdorff abelian
group `G`, define `spectralMeasureAction U f` as the finite inner regular measure on
`PontryaginDual G` representing `g ↦ ⟪f, U_g f⟫`, using Tau Ceti's cyclic spectral theorem
`ContRepresentation.exists_pontryaginMeasureTransform_eq_inner` and
`FiniteMeasure.pontryaginMeasureTransform_injOn_innerRegular` for uniqueness. Use the existing
additive formulation: `U : ContRepresentation ℂ (Multiplicative G) H` for an additive locally
compact abelian `G`, and its dual `PontryaginDual (Multiplicative G)`. Prove the additive/
multiplicative repackaging of the Koopman interface once. This construction consumes the cyclic
spectral theorem directly; positive definiteness and the Bochner representation are compatibility
lemmas
Prove uniqueness, total mass, polarization, covariance and compatibility with intertwining
isometries. Specialize to `G = ℤ`, identifying its dual with `Circle`, and to `G = ℝ`, identifying
its dual with `ℝ` by `ξ ↦ (t ↦ exp(2π i t ξ))`; the latter is `spectralMeasureReal U f`.
Prove that the ℤ specialization agrees with the isometry construction when `U` is unitary,
and prove the inverse-character conversion to the Koopman eigenfunction convention.

For a system `T`, write `σ_f` for the spectral measure of the Koopman isometry on `Lp ℂ 2 μ`.

**Checks.**

- For a constant function `c`, `σ_c = |c|² δ_1`.
- For the rotation `x ↦ x + a` on `UnitAddCircle` and `f = fourier n`, `σ_f = δ_{exp(2π i n a)}`.
- For the one-sided Bernoulli shift and `f(x) = (-1)^{x 0}` with fair coin, `σ_f` is normalized
  Haar measure on the circle (the correlations vanish for `n ≠ 0`).

*Needs:* Tau Ceti Herglotz, cyclic strongly continuous spectral theorem and uniqueness of
inner regular Pontryagin transforms; Mathlib inner product spaces.

### 2.2 Wiener's lemma and atoms

Prove **Wiener's lemma**: for a finite measure `σ` on `Circle`,
`(1/N) ∑_{n<N} |σ̂(n)|² → ∑_{z} σ({z})²`, where `σ̂(n) = ∫ z^n dσ` and the sum is over the
(countably many) atoms; and for a finite complex measure the same with `|σ({z})|²`. Also
`(1/N) ∑_{n<N} conj λ^n σ̂(n) → σ({λ})`. Give the analogue for finite measures on `ℝ` with Cesàro
integrals `(1/T) ∫_0^T`.

Prove that for an isometry `U`, `σ_f({λ}) = ‖P_λ f‖²` where `P_λ` is the orthogonal projection onto
the eigenspace `ker (U - λ)`, using the mean ergodic theorem for the contraction `λ⁻¹ U`
(Mathlib `ContinuousLinearMap.tendsto_birkhoffAverage_orthogonalProjection`). Hence `σ_f` has no
atoms iff `f` is orthogonal to every eigenvector.

**Checks.** For `σ = δ_1 + δ_{-1}`, `σ̂(n) = 1 + (-1)^n` and the Cesàro mean of `|σ̂|²` is `2`,
matching `1² + 1²`.

*Needs:* §2.1; Mathlib Fourier analysis on the circle.

### 2.3 Weak mixing, mixing and the spectrum

For a system `T`, let `L²₀` be the closed subspace of mean-zero functions. Prove:

1. `WeakMixing T μ` iff the Koopman operator has no eigenfunction other than constants (with
   eigenvalue 1) iff `σ_f` is atomless for every `f ∈ L²₀`;
2. `IsStrongMixing T μ` iff `σ̂_f(n) → 0` for every `f ∈ L²₀` (the spectral measures of mean-zero
   functions are Rajchman measures);
3. for ergodic `T`, every eigenvalue is simple, every eigenfunction has constant modulus, and the
   eigenvalues form a subgroup of `Circle`;
4. the decomposition `L² = H_pp ⊕ H_c` into the closed span of eigenfunctions and its orthogonal
   complement, both Koopman-invariant, with `f ∈ H_c` iff `σ_f` is atomless.

Define `HasDiscreteSpectrum T μ`: the eigenfunctions span a dense subspace of `Lp ℂ 2 μ`. Prove that
ergodic rotations of compact abelian groups have discrete spectrum with eigenvalues the values of
the characters at the rotation, and the spectral form of the Halmos–von Neumann theorem: two
ergodic invertible systems with discrete spectrum have unitarily equivalent Koopman operators,
by an equivalence carrying constants to constants, iff their eigenvalue groups are equal.

The real-flow analogues are in Layer 3.2.

**Checks.**

- The swap on two equiprobable points has eigenvalues `1, -1`, simple, and discrete spectrum.
- The identity on two equiprobable points has the eigenvalue `1` with multiplicity two; ergodicity
  fails, so item 3 does not apply.

*Needs:* §§1.1, 2.1–2.2.

### 2.4 Group representation criteria

For a unitary group representation `U` on a complex Hilbert space define weak mixing by the
absence of nonzero finite-dimensional invariant subspaces. Prove its equivalence with absence
of invariant vectors in `U ⊗ conjugate U`, its tensor-product permanence with arbitrary unitary
representations, and the orthogonal decomposition into the closed span of finite-dimensional
invariant subspaces and its weakly mixing complement. Construct the Hilbert tensor-product
intertwiner identifying the Koopman representation of a product probability system with the
tensor product of the Koopman representations. Deduce that a probability-preserving group
action is diagonally weakly mixing iff its representation on `L²₀` is weakly mixing, and iff its
product with every ergodic probability action is ergodic.

For a topological group define mixing of a strongly continuous representation by decay of all
matrix coefficients along `cocompact`. Prove equivalence with set mixing for Koopman on `L²₀`,
and mixing implies weak mixing when `cocompact.NeBot`. For abelian groups, finite-dimensional
unitary representations split into characters; deduce the eigenfunction and atomless spectral
measure criteria, and the pure-point/continuous decomposition. The nonabelian criterion uses
finite-dimensional subspaces, with no reduction to characters.

**Checks.** A nontrivial finite-dimensional irreducible representation of a finite nonabelian
group need have no invariant line and is nevertheless not weakly mixing. An abelian character
is a one-dimensional obstruction, recovering §§2.3 and 3.2.

*Needs:* §§0.2, 1.3, 2.1; Mathlib Hilbert-space completions and tensor products. Build the
completion and tensor intertwiners above as part of this section.

### 2.5 Følner mean ergodic theorem and averaged weak mixing

For a countable discrete amenable group, a unitary representation `U` on a Hilbert space,
and a left Følner family `F : ι → Finset G` along `l`, prove
`#(F i)⁻¹ ∑ g ∈ F i, U_(g⁻¹) v → P_fix v` in norm. Use the orthogonal decomposition into
fixed vectors and the closure of the span of `U_g v - v`, and the Følner boundary estimate.
For Koopman on `L²` identify the limit with conditional expectation onto the invariant
σ-algebra, using §0.2. Give the additive and map-iterate specializations, including positive ℤ intervals.

Prove the equivalences between diagonal weak mixing and vanishing Følner averages of absolute
and squared centered correlations. Prove convergence along a set of density one relative to
the specified Følner sequence for each pair of observables. For abelian groups, apply this to
spectral measures to prove Wiener's atom formula and the character-weighted atom-extraction
formula on the dual; recover §2.2 for ℤ and retain its real-interval version for ℝ.

**Checks.** For ℤᵈ, rectangular windows with all side lengths tending to infinity recover
rectangular Cesàro averages. The trivial representation has every average equal to its input.

*Needs:* §§0.2, 2.4; AmenableGroups' Følner criterion; Mathlib `IsFoelner`, Hilbert projections.

## Layer 3: Flows

Develop parameter restriction along continuous additive monoid homomorphisms, invariant sets,
factors, products and invariant probabilities for `Flow τ X`. Reuse Mathlib's flow/action and
semiconjugacy API and prove agreement with the measurable-action interfaces of Layer 0 when the
Borel hypotheses make the action measurable. Include `τ = ℕ`, `ℤ`, `ℝ≥0`, `ℝ`, the flow of a
continuous map, that of a homeomorphism, and restriction of a real flow to a semiflow.
The time-map and integration statements below specify `τ = ℝ`.

### 3.1 Measurable flows and their time-`t` maps

For a measurable flow (conventions), prove that each time-`t` map is an invertible system with
inverse the time-`(-t)` map, that `ErgodicVAdd ℝ X μ` implies ergodicity of the time-`t` map for all
but countably many `t` when `L²(μ)` is separable (`[MeasurableSpace.CountablyGenerated X]`, with
Mathlib's `Lp.SecondCountableTopology`), and that ergodicity of one time-`t` map implies
`ErgodicVAdd ℝ X μ`. Route for the first: if the time-`t` map has a nonconstant invariant function
`g`, Fourier expansion of `s ↦ U_s g` on `ℝ / tℤ` (Layer 0.2's strong continuity and Mathlib's
`span_fourier_closure_eq_top`) produces a flow eigenfunction with frequency `k/t`, `k ≠ 0`; an
ergodic flow on a separable `L²` has countably many frequencies.

Define `IsVAddEigenfunction μ α f` with the frequency convention of the conventions section.

**Checks.**

- The linear flow on `UnitAddCircle` with speed 1 is ergodic, and its time-1 map is the identity,
  which is not ergodic; every time-`t` map with `t` irrational is ergodic.
- The trivial flow on a nontrivial probability space is not ergodic.

*Needs:* §0.2; Mathlib `ErgodicVAdd`, Fourier series on `AddCircle`.

### 3.2 Weak mixing and mixing of real flows

Prove the equivalences for a measurable flow on a probability space:

1. `WeakMixingVAdd ℝ X μ`;
2. no eigenfunction other than constants: every `f` with `IsVAddEigenfunction μ α f` is constant
   (and then `α = 0`);
3. for all measurable `A`, `B`,
   `(1/T) ∫_0^T |μ.real (A ∩ (t +ᵥ ·) ⁻¹' B) - μ.real A * μ.real B| dt → 0` as `T → ∞`;
4. `spectralMeasureReal` of every `f ∈ L²₀` is atomless;
5. some time-`t` map with `t ≠ 0` is weakly mixing;
6. every time-`t` map with `t ≠ 0` is weakly mixing.

Route for 2 ⇒ 6: if the time-`t` map has an eigenfunction with eigenvalue `exp(2π i β t)`, its
eigenspace is invariant under the whole flow, on which `s ↦ exp(-2π i β s) U_s` factors through
`ℝ / tℤ`; its Fourier components are flow eigenfunctions with frequencies `β + k/t`, which are
constants by 2, so the eigenfunction is constant.

Prove `mixingVAdd_real_iff`: the flow is mixing iff the time-1 map is strongly mixing (for the
converse, use uniformity of the map's mixing limit over the norm-compact family
`{U_s 1_B | s ∈ [0,1]}` given by strong continuity).

**Checks.**

- The linear flow on `UnitAddCircle` is not weakly mixing: `x ↦ exp(2π i x)` is an eigenfunction
  with frequency 1.
- The linear flow on `UnitAddTorus (Fin 2)` with direction `(1, √2)` is ergodic and not weakly
  mixing.

*Needs:* §§0.2, 1.3, 2.1–2.3, 3.1.

### 3.3 Suspension flows

For an invertible probability system `T : X ≃ᵐ X` on a standard Borel space and a measurable
roof `r : X → ℝ` with `0 < r` almost everywhere and `Integrable r μ`, construct a measurable
`T`-invariant conull set `X₀` on which the roof is positive and its sums diverge in both time
directions. Prove divergence using recurrence (or the conditional-expectation form of Birkhoff)
applied to `{r ≥ 1/n}`. On `X₀` define the suspension space
`suspensionSpace T r := {p : X₀ × ℝ | 0 ≤ p.2 ∧ p.2 < r p.1}` with the measure
`(∫ r dμ)⁻¹ • (μ₀.prod volume).restrict _`, transported to the subtype, where `μ₀` is the
restriction of `μ` to `X₀`, and the suspension flow: `t +ᵥ (x, s) = (T^n x,
s + t - S_n r x)` for the unique `n : ℤ` putting the second coordinate in `[0, r (T^n x))`, where
`S_n r` is the cocycle of Birkhoff sums extended to negative `n`. Prove that this is a measurable
flow preserving the probability, and:

1. the flow is ergodic iff `T` is ergodic;
2. `α` is a frequency of an eigenfunction iff there is a measurable `g : X → ℂ`, not almost
   everywhere zero, with `g (T x) = exp (2π i α r x) * g x` almost everywhere;
3. hence the flow is weakly mixing iff `T` is ergodic and the equation in 2 has no solution for
   `α ≠ 0`;
4. the base `X₀ × {0}` is a cross-section: the first return of the flow to it is `T`, with return
   time `r`.

**Checks.**

- A constant roof `r ≡ c` gives a flow with eigenfunction `(x, s) ↦ exp(2π i s / c)`, frequency
  `1/c`; it is never weakly mixing.
- Over the identity on a one-point space with roof `c`, the suspension flow is the rotation flow on
  `AddCircle c`.

Prove independence up to isomorphism mod null sets of the chosen conull realization and of
almost-everywhere changes to the roof. When `r ≥ c > 0` everywhere, give the construction on the
whole base and identify it with the conull version. Include roofs without a uniform lower bound.

*Needs:* §§0.1, 0.4, 3.1–3.2; Mathlib recurrence, `Measure.prod`, `birkhoffSum`.

### 3.4 Invariant measures of continuous flows

For continuous actions of additive topological monoids on a nonempty compact Hausdorff space,
prove that the invariant Radon probabilities form a closed convex set, hence a compact set,
using §0.6's weak-topology foundation. For a real flow prove nonemptiness by time averages,
interpreting them as Radon probabilities through integration of continuous functions. On compact
metrizable spaces, prove `MeasurableVAdd₂ ℝ X` for the Borel σ-algebra (second countability makes
the Borel σ-algebra of `ℝ × X` the product). For `flowInvariantProbabilities ϕ` prove that its
extreme points are exactly the `ν` with `ErgodicVAdd ℝ X ν`, and that the
averaging map `ν ↦ ∫_0^1 (ϕ s)_* ν ds` sends `invariantProbabilities (ϕ 1)` onto
`flowInvariantProbabilities ϕ`, fixing the latter pointwise.

**Checks.**

- For the linear flow on `UnitAddCircle`, `flowInvariantProbabilities` is `{volume}`, while
  `invariantProbabilities (ϕ 1)` (the identity map) is every probability.
- For the trivial flow, both sets are all of `ProbabilityMeasure X`.

*Needs:* §§0.6, 3.1; Mathlib `Flow`, Krylov–Bogolyubov, ergodic-action extreme-point API.

### 3.5 Flows defined almost everywhere

Many measure-preserving flows (billiards, hard-sphere systems, flows with singularities) are
defined only off a null set. Work with a standard Borel space `X` and a σ-finite measure `μ`
(Lebesgue measure on a phase space is infinite when velocities are unbounded).

1. **Conull flows.** A *conull flow* on `(X, μ)` is a measurable set `X₀` with `μ X₀ᶜ = 0`
   carrying a measurable flow (conventions) whose time-`t` maps preserve `μ` restricted to
   `X₀`. Extend each time-`t` map to `X` by the identity off `X₀`; prove that the extension is
   a jointly measurable family of measure-preserving maps of `(X, μ)` satisfying the group law
   everywhere, and that ergodicity, mixing, eigenfunctions, spectral measures and entropy of the
   time-`t` maps do not depend on the chosen conull carrier or on modifications on null sets.
   Layer 9's billiard flow and §3.3's suspension flow are conull flows.
2. **Point realization.** For a jointly measurable family `T : ℝ → X → X` of measure-preserving
   maps with `T 0 = id` almost everywhere and, for each `s` and `t`,
   `T (s + t) = T s ∘ T t` almost everywhere (the exceptional set may depend on `s, t`), prove that
   there is a conull flow `Φ` with `Φ t = T t` almost everywhere for every `t` (Mackey's point
   realization theorem for `ℝ`). Route: by Fubini, the set of `x` for which
   `T (s + t) x = T s (T t x)` holds for almost every `(s, t)` is conull; on it define `Φ t x` by
   the almost-everywhere constant value of `T (t - u) (T u x)` in `u`, and take for `X₀` the
   points where this value is defined for every `t` and invariant. Prove uniqueness of `Φ` up to
   null sets.
3. **Disjoint unions.** For countably many conull flows on `(X_N, μ_N)`, the sigma-type
   `Σ N, X_N` with the sum measure carries the componentwise conull flow; prove measurability,
   invariance, and that a measure on the union is invariant iff each component restriction is.
4. **Transport of densities.** For a conull flow on `(X, μ)` and `ν = μ.withDensity W`, prove
   `(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`. In particular a random initial point whose law is
   absolutely continuous with respect to `μ` lies in `X₀` almost surely, so its trajectory
   `t ↦ Φ t x` is defined for all `t` with probability one, and its law at time `t` has density
   `W ∘ Φ (-t)`.

**Checks.**

- On `ℝ` with Lebesgue measure, the family `T t x = x + t` for `x ≠ 0`, `T t 0 = 0`, satisfies the
  hypotheses of item 2, and its realization is translation on all of `ℝ`, differing from `T` on a
  null set.
- For translation on `ℝ` and `W` the indicator of `[0, 1]`, item 4 gives density the indicator of
  `[t, t + 1]` at time `t`.

*Needs:* §§0.1, 3.1; Mathlib `Measure.withDensity`, `Measure.sum`, Fubini for σ-finite measures,
`StandardBorelSpace`.

### 3.6 Correlations and rates of mixing

For a measurable flow on a probability space and `f, g ∈ L²(μ)`, define the correlation
`flowCorrelation μ f g t = ∫ f (t +ᵥ x) * conj (g x) dμ - (∫ f dμ) * conj (∫ g dμ)`, and for a
system `T` the correlation `mapCorrelation μ T f g n` with `f ∘ T^[n]`. Prove that mixing is
equivalent to convergence of these correlations to 0 for all `f, g ∈ L²`, and that it suffices to
check `f, g` in a set whose span is dense in `L²`.

On a compact metric space with a Borel probability `μ`, for `θ ∈ (0, 1]` use Mathlib's
`MemHolder θ` and `nnHolderNorm θ`, with `‖f‖_θ = ‖f‖_∞ + nnHolderNorm θ f`. Define:

- `IsExponentiallyMixing μ θ` for a flow: there are `C`, `κ > 0` with
  `‖flowCorrelation μ f g t‖ ≤ C * ‖f‖_θ * ‖g‖_θ * exp (-κ t)` for all `θ`-Hölder `f`, `g` and
  `t ≥ 0`; and the analogue for a map with `n : ℕ`;
- `HasCorrelationBound μ θ ρ` for a function `ρ : ℝ → ℝ` tending to 0, with `ρ t` in place of
  `C exp (-κ t)`.

Prove that Hölder functions with exponent `θ` are dense in `L²(μ)` on a compact metric space,
hence a correlation bound for one `θ` implies mixing; that exponential mixing for exponent `θ`
implies it for every larger exponent `θ' ≤ 1` with the same rate, and for smaller exponents with a
smaller rate (interpolation through Lipschitz approximation); and invariance under bi-Lipschitz
conjugacy, with the same exponent and rate.

**Checks.**

- The linear flow on `UnitAddCircle` is not mixing, so it has no correlation bound: the
  correlation of `exp(2π i x)` with itself has modulus 1 for every `t`.
- For the two-sided Bernoulli shift with the metric `d(x, y) = 2^(-min{|k| : x k ≠ y k})`,
  functions depending on coordinates in `[-k, k]` are Lipschitz, and their correlations vanish for
  `n > 2k`; §8.6 proves exponential mixing for all Hölder functions.
- A suspension flow with constant roof (§3.3) has an eigenfunction, so it is not mixing.

*Needs:* §§1.1, 1.3, 3.2; Mathlib `MemHolder`, `nnHolderNorm`, Lipschitz approximation on metric
spaces.

## Layer 4: Kolmogorov–Sinai entropy

The single-map absolute entropy is `measureEntropy μ T : ℝ≥0∞`, specified in §4.0 with the names
and signatures of PR #851 §4.2 (see [Scope and ownership](#scope-and-ownership)). Write `h_μ(T)` and
`h_μ(T, ξ)` for `measureEntropy μ T` and `partitionEntropyRate μ T ξ`.

### 4.0 Partition entropy and the Kolmogorov–Sinai definition

Work on a probability space with arbitrary measurable structure; a partition is a measurable label
`ξ : X → ι` into a countable discrete type, its atoms are the fibres (empty atoms allowed), and the
join of `ξ` and `η` is the label `x ↦ (ξ x, η x)`.

1. **Entropy of a label.** `countablePartitionEntropy μ ξ : ℝ≥0∞` is `∑' i, -p_i log p_i` with
   `p_i = μ.real (ξ ⁻¹' {i})` and `0 log 0 = 0`. On finite labels it agrees with PR #1421
   §5.1a's `labelEntropy`, whose chain rule, alphabet bound `H ≤ log #ι` and independence additivity
   are consumed. Prove invariance under relabeling by injections and under almost-everywhere equality
   of labels, monotonicity under refinement, and subadditivity of joins.
2. **Conditional entropy given a label.** `conditionalPartitionEntropy μ ξ η : ℝ≥0∞` is
   `∑ (i, j), p_ij log (p_j / p_ij)`, zero-mass cells contributing zero. Prove the chain rule
   `H(ξ ∨ η) = H(η) + H(ξ | η)`, `H(ξ | η) ≤ H(ξ)` with equality for independent labels, and
   monotonicity in both arguments.
3. **Conditional entropy given a σ-algebra.** For a sub-σ-algebra `𝒜`, `condPartitionEntropy μ ξ 𝒜`
   is `∫⁻ x, -∑ i, p_i(x) log p_i(x) dμ` with `p_i = μ[1_{ξ = i} | 𝒜]`. Prove independence of
   conditional-expectation representatives, `0 ≤ H(ξ | 𝒜) ≤ H(ξ)`, agreement with item 2 when `𝒜`
   is generated by a countable label, the formula through Mathlib's `ProbabilityTheory.condExpKernel`
   on standard Borel spaces, antitonicity in `𝒜`, `H(ξ | ⊥) = H(ξ)`, `H(ξ | 𝓑_X) = 0`, the
   chain rule `H(ξ ∨ η | 𝒜) = H(ξ | 𝒜) + H(η | 𝒜 ⊔ σ(ξ))`, and continuity along increasing and
   decreasing sequences of σ-algebras for finite-entropy `ξ` (martingale convergence).
4. **Rates and the definition.** `iteratedPartitionLabel T ξ n` is
   `x ↦ (ξ x, ξ (T x), …, ξ (T^[n-1] x))`. `partitionEntropyRate μ T ξ` is
   `inf_{n ≥ 1} H(ξⁿ) / n`; for measure-preserving `T` and `H(ξ) < ∞` prove that it is the limit
   (Fekete, Mathlib's `Subadditive.tendsto_lim`) and equals
   `H(ξ | ⨆_{j ≥ 1} σ(ξ ∘ T^[j]))`. `measureEntropy μ T` is the supremum of the rates over
   measurable `ℕ`-valued labels of finite entropy.
5. **Finite partitions.** Prove `measureEntropy μ T = ⨆ ξ finite, partitionEntropyRate μ T ξ`,
   retaining `⊤` (truncate a countable finite-entropy label `ξ` to finite `ξ_k` and use
   `h(T, ξ) ≤ h(T, ξ_k) + H(ξ | ξ_k)`, with `H(ξ | ξ_k) → 0`). This is the textbook definition by
   finite measurable partitions; state it as `measureEntropy_eq_iSup_finite`.

**Checks.** A one-atom label has entropy 0, including with added empty atoms; a fair bit has
entropy `log 2`, and a fair bit joined with itself also has `log 2`, not `2 log 2`. Conditioning a
fair bit on itself gives 0. For the fair Bernoulli shift the coordinate label has `H(ξⁿ) = n log 2`
and rate `log 2`; for the identity on two equiprobable points the rate is 0. On `[0, 1]` with
Lebesgue measure the label `x ↦ x` (uncountably many values) is not admissible, while its dyadic
truncations have entropies `k log 2` tending to `⊤`.

*Needs:* PR #1421 §5.1a; Mathlib `Real.negMulLog`, conditional expectation, martingale convergence,
`Subadditive.tendsto_lim`, `condExpKernel`.

### 4.1 Basic properties

Prove:

1. invariance under isomorphism mod 0, and `h_ν(S) ≤ h_μ(T)` for a factor;
2. `h_μ(T^[k]) = k * h_μ(T)` for `k ≥ 1`, and `h_μ(T.symm) = h_μ(T)` for invertible `T`;
3. `h_{μ.prod ν}(Prod.map T S) = h_μ(T) + h_ν(S)`;
4. finite affinity: `h_{a μ + (1 - a) ν}(T) = a h_μ(T) + (1 - a) h_ν(T)` for invariant
   probabilities `μ`, `ν` and `a ∈ [0, 1]` (`ℝ≥0∞` arithmetic);
5. `h_μ(T, ξ) ≤ H_μ(ξ)`, with equality for finite `ξ` iff the labels `ξ ∘ T^[k]` are independent;
6. continuity of `h_μ(T, ·)` in the Rokhlin distance `H(ξ | η) + H(η | ξ)` on finite partitions.

**Checks.** For the identity map every partition has rate 0; for the swap on two points with the
partition into points, `H = log 2`, the rate is 0, and equality in 5 fails because the label and its
iterate are equal, not independent.

*Needs:* §§0.1, 4.0.

### 4.2 Generators

A finite or countable label `ξ` with `H_μ(ξ) < ∞` is a one-sided generator if the σ-algebras of the
iterated labels `iteratedPartitionLabel T ξ n` generate the σ-algebra of `X` modulo μ-null sets,
and, for invertible `T`, a two-sided generator if those of the labels over `n ∈ ℤ` do. Prove the
**Kolmogorov–Sinai theorem**: for a one-sided generator `h_μ(T) = h_μ(T, ξ)`, and for a two-sided
generator of an invertible system the same. Prove that an invertible system with a one-sided
generator has `h_μ(T) = 0`.

Prove the increasing-σ-algebra approximation theorem: if sub-σ-algebras `𝒜_k` increase and
generate the ambient σ-algebra modulo null sets, then
`h_μ(T) = sup_k sup_{ξ finite, ξ measurable for 𝒜_k} h_μ(T, ξ)`. No single `𝒜_k` need be
invariant. Prove it using conditional-entropy approximation of every finite label and the
Rokhlin-distance bound of §4.1. Deduce the corresponding increasing-partition form when finite
labels `ξ_k` refine and generate, and the approximation needed for natural extensions and
small-diameter partitions.

Prove `h_μ̃(T̃) = h_μ(T)` for the natural extension: apply the increasing-σ-algebra approximation above
   to finite-history σ-algebras, identify their entropy with that of the base by invariance,
   and pass to the supremum. Prove this directly from partition approximation and do not use
   entropy addition.

**Checks.** For the one-sided Bernoulli shift the first-coordinate label is a one-sided generator;
for the two-sided shift it is a two-sided but not a one-sided generator.

*Needs:* §§4.0 (conditional entropy, increasing σ-algebras), 4.1.

### 4.3 Computations

Prove:

1. Bernoulli shifts, one- and two-sided, with a countable alphabet: `h = -∑ p_i log p_i`, an
   element of `ℝ≥0∞` that is `∞` when the series diverges (for infinite entropy, use the finite
   coarsenings);
2. Markov shifts on a finite `S` with invariant `π`: `h = -∑ π_i κ_ij log κ_ij`.

**Checks.**

- The `(1/2,1/2)` shift has entropy `log 2`; the `(1/3,1/3,1/3)` shift has `log 3`; the shift
  with `p = δ_a` has entropy 0.
- The two-state Markov chain with `κ = !![1-p, p; p, 1-p]` and uniform `π` has entropy
  `-(p log p + (1-p) log (1-p))`.

*Needs:* §§0.3, 4.1–4.2.

### 4.4 Induced maps

Prove **Abramov's formula for induced maps**: for an ergodic invertible system and measurable `A`
with `μ A > 0`, the entropy of `inducedMap T A` for the normalized restriction is
`h_μ(T) / μ A`.

**Checks.** For `T` periodic on three equiprobable points and `A` one point, both sides are 0.

*Needs:* §§0.4, 4.1–4.2.

### 4.5 Pinsker σ-algebra and K-systems

Define the Pinsker σ-algebra `pinsker T μ` as the σ-algebra generated by finite labels `ξ` with
`h_μ(T, ξ) = 0`, and prove it is `T`-invariant, that the corresponding factor has entropy 0, and
that it contains every zero-entropy factor (as the pullback σ-algebra).

For invertible `T`, define `IsKSystem T μ`: there is a sub-σ-algebra `𝒦` with
`𝒦.comap T ≤ 𝒦`, the σ-algebras `𝒦.comap (T.symm^[n])` generate the σ-algebra of `X` modulo null
sets, and `⨅ n, 𝒦.comap (T^[n])` is trivial modulo null sets. Prove: two-sided Bernoulli shifts
are K-systems; K-systems are mixing of all orders; for a K-system, `pinsker T μ` is trivial modulo
null sets, so every nontrivial factor has positive entropy.

**Checks.** The identity on a nontrivial space has `pinsker = ⊤` and is not a K-system.

*Needs:* §§1.2, 4.1–4.2; Mathlib conditional expectation and martingale convergence.

### 4.6 Entropy of amenable actions and the finite-set limit lemma

For a countably infinite discrete amenable group acting by probability-preserving maps, let
`H_μ(ξ^F)` be the entropy of §0.5's finite-window label. Prove its monotonicity, subadditivity,
right-translation invariance and strong subadditivity for finite-entropy labels.
Prove the finite-set Shearer inequality and the infimum rule
`lim_i H_μ(ξ^(F i)) / #(F i) = inf_{F nonempty finite} H_μ(ξ^F) / #F`
for every left Følner family along a nontrivial filter. Define `actionPartitionEntropyRate` by
this infimum and `actionMeasureEntropy G μ : ℝ≥0∞` as the supremum over finite measurable labels;
prove equality with the supremum over countable finite-entropy labels, Følner independence,
factor monotonicity, conjugacy invariance, products and affinity.

Prove the amenable generator theorem for a countable finite-entropy label whose `G`-translates
generate modulo null sets. Compute Bernoulli action entropy as the Shannon entropy of the base,
including infinite entropy by finite coarsenings. For the ℤ-action of an invertible map prove
agreement with §4.0's `measureEntropy`; the ℕ single-map theory remains §§4.1–4.5.

Also prove the **Ornstein–Weiss limit lemma**: for a nonnegative, monotone, subadditive,
right-translation-invariant real function on finite subsets with value zero on the empty set,
its normalized values along any left Følner family converge to a common finite limit. Supply
the combinatorial input: for `ε > 0` and finite invariance constraints, finitely many sufficiently
invariant finite shapes admit translates inside every sufficiently invariant finite window,
covering at least `1 - ε` of the window and becoming disjoint after deleting at most an `ε`
fraction of each shape (finite quasi-tiling). Prove the resulting upper/lower bounds and the
extension from sequences to arbitrary filtered families. This limit lemma is shared with §5.6;
finite-partition entropy has the stronger infimum rule above.

**Checks.** For ℤᵈ Bernoulli actions, box-normalized entropy equals the base entropy, rather than
entropy per boundary site. For a finite group, the Følner limit is the whole-group quantity
divided by `#G`; entropy-zero claims for trivial actions assume `G` infinite.

*Needs:* §§0.5, 4.1–4.2; AmenableGroups' discrete Følner criterion; finite entropy inequalities
from PR #1421 §5.1a and §4.0. Prove Shearer and quasi-tiling as targets of this section.

### 4.7 Pointwise averaging, Shannon–McMillan–Breiman and decomposition

For a countable discrete amenable group acting on a standard Borel probability space, prove the
pointwise ergodic theorem along a tempered left Følner sequence `F_n`:
`#F_n⁻¹ ∑ g ∈ F_n, f(g • x) → E[f | invariants](x)` almost everywhere for `f ∈ L¹`.
Temperedness means `#(⋃ k < n, F_k⁻¹ * F_n) ≤ C * #F_n` for a fixed finite `C`.
Build the tempered covering estimate and weak `(1,1)` maximal inequality, then pass from a dense
class and the mean theorem to `L¹`. Prove that every Følner sequence has a tempered subsequence.
Identify the ℤ interval case with PR #1421's Birkhoff theorem and prove the reindexing lemmas.

For an infinite `G`, a tempered Følner sequence with `#F_n / log(n + 2) → ∞`, and a finite
measurable label `ξ`, prove the amenable **Shannon–McMillan–Breiman theorem**: normalized
information `information (μ {y | ξ^(F_n)(y) = ξ^(F_n)(x)}) / #F_n : ℝ≥0∞` converges almost
everywhere to an invariant function whose integral is `actionPartitionEntropyRate`. State its ergodic constant form and extend to
countable finite-entropy labels by truncation with an information-tail estimate. Supply the
information estimates and covering argument of Lindenstrauss's theorem as explicit intermediate
targets. These sequence hypotheses belong to pointwise conclusions, not to §4.6's entropy definition.

Consume PR #851's group-action ergodic decomposition, prove entropy integration for these actions
using finite partitions and the generator/approximation arguments above, and deduce Jacobs'
mixture formula and measurability of the action entropy on invariant probabilities of a compact
metrizable action. Construct compatible Polish topological models of standard Borel countable
actions where needed for the decomposition interface.

**Checks.** For an ergodic Bernoulli ℤᵈ-action and a finite-alphabet coordinate label, normalized
information along tempered boxes converges to the base Shannon entropy.

*Needs:* §§0.1–0.2, 2.5, 4.0, 4.6; PR #851 §4.2 (ergodic decomposition); Lindenstrauss's pointwise
and information theorems, with the covering and maximal estimates built here.

### 4.8 Relative entropy and the Abramov–Rokhlin addition formula

Use sub-σ-algebras as the primary interface. For an endomorphism and `𝒜 ≤ 𝓑_X` with
`𝒜.comap T ≤ 𝒜` modulo null sets, define the relative partition entropy rate by
`inf_{n ≥ 1} H_μ(ξ^n | 𝒜)/n`, and `relativeMeasureEntropy μ T 𝒜 : ℝ≥0∞` as the supremum over
finite measurable labels, with §4.0's `condPartitionEntropy`; its conditional-kernel
formula is a compatibility theorem, not an additional authoritative definition.
Prove subadditivity, existence of the normalized limit, invariance under changes modulo null
sets, monotonicity as conditioning increases, the finite/countable finite-entropy comparison,
and relative generator and increasing-σ-algebra approximation theorems.

For a standard Borel factor `π : (X,T,μ) → (Y,S,ν)`, specialize to
`𝒜 = MeasurableSpace.comap π 𝓑_Y` and prove the **Abramov–Rokhlin addition formula**
`h_μ(T) = h_ν(S) + relativeMeasureEntropy μ T 𝒜` in `ℝ≥0∞`, including infinite values.
Prove the finite-partition conditional chain comparisons, the limit passage, and the required
countable approximation to the factor σ-algebra; this proof requires no invariant relative
product of endomorphisms. Prove the entropy chain formula for a composition of factors, written
as addition. Retain the direct factor-monotonicity proof of §4.1 and identify it with this corollary.

For every countably generated sub-σ-algebra preserved by the endomorphism modulo null sets,
construct a standard Borel factor realizing it modulo null sets: use a countable binary coding,
construct the induced measurable transformation on the coded space modulo its pushforward law,
and prove compatibility of relative entropy with the resulting factor map.

**Checks.** Conditioning on the trivial σ-algebra gives ordinary entropy; conditioning on the
whole σ-algebra gives zero. For product systems, `h(X × Y | X) = h(Y)`, and addition recovers
product additivity. For an isomorphism the relative entropy is zero.

*Needs:* §§0.1, 4.0 (conditional entropy and martingale approximation), 4.1–4.2;
standard Borel countable coding. Prove the chain comparisons here; natural-extension entropy
preservation is already proved directly in §4.2.

### 4.9 Relative entropy of amenable actions

For a countably infinite discrete amenable group and an invariant sub-σ-algebra, define the
relative finite-window rate by `H_μ(ξ^F | 𝒜)/#F`. Prove the conditional Shearer inequality,
the infimum rule and convergence along every filtered Følner family, and define
`relativeActionMeasureEntropy G μ 𝒜` by the supremum over finite measurable labels. Prove
conditioning monotonicity, conjugacy invariance and the relative generator/approximation theorems.
For a standard Borel group-action factor prove the action version of Abramov–Rokhlin addition
and the addition formula for a composition of factors, with `ℝ≥0∞` values. Prove compatibility
with §4.8 for ℤ-actions. Use finite conditional chain estimates and the Følner boundary estimates,
with all partition approximation steps explicit.

**Checks.** Over a one-point factor this is §4.6's entropy. A product Bernoulli extension has
relative entropy equal to the base-alphabet Shannon entropy, independently of the factor action.

*Needs:* §§0.5, 4.0, 4.6, 4.8. Conditional finite-window estimates
are targets here and do not use the pressure variational principle.

### 4.10 Shannon–McMillan–Breiman and the ergodic decomposition of entropy

For a measure-preserving endomorphism of a probability space with arbitrary measurable structure
and a finite label `ξ`, prove the **Shannon–McMillan–Breiman theorem**:
`information (μ {y | ξⁿ(y) = ξⁿ(x)}) / n` converges almost everywhere and in `L¹` to a
nonnegative, integrable, almost-everywhere `T`-invariant function `g_ξ` with
`∫ g_ξ dμ = h_μ(T, ξ)`; for ergodic `μ` the limit is the constant `h_μ(T, ξ)`. Route: the
martingale information argument through §4.0 item 4, Chung's maximal inequality for the
information functions, and PR #1421's Birkhoff theorem with invariant conditional-expectation
limit. Extend to countable labels of finite entropy.

On a nonempty standard Borel space, construct the **ergodic decomposition** of a
measure-preserving endomorphism: a probability kernel `x ↦ μ_x` whose values are `T`-invariant and
ergodic for μ-almost every `x`, with `∫ u dμ_x = μ[u | invariants T](x)` almost everywhere for every
bounded measurable `u`, almost-everywhere unique, constant equal to `μ` when `μ` is ergodic.
For an invertible map, agree with PR #851's `ActionErgodicKernel` for the ℤ-action. Prove
`g_ξ(x) = h_{μ_x}(T, ξ)` almost everywhere, measurability of `x ↦ h_{μ_x}(T)`, and
**entropy integration** `h_μ(T) = ∫⁻ h_{μ_x}(T) dμ(x)` in `ℝ≥0∞`, using a countable generating
algebra and increasing finite partitions (§4.2). Deduce finite affinity (§4.1 item 4) as a check.

**Checks.** On a singleton the information quotient is 0 and the component is the Dirac mass. On
the fair binary shift cylinder masses `2⁻ⁿ` give `log 2`. On the identity of two equiprobable
points, `μ_x = δ_x` and the entropy integral is 0; the constant kernel `μ` fails the
conditional-expectation identity. On the disjoint union of a fixed point and a fair binary shift
with weights `1/2`, the entropy is `(log 2)/2`.

*Needs:* §§4.0–4.2; PR #1421 §§4.1–4.3 (pointwise Birkhoff); Mathlib conditional expectation,
martingale convergence, standard Borel conditional kernels.

## Layer 5: Topological entropy and pressure

### 5.1 Invariant probabilities and unique ergodicity

For a continuous `T` on a nonempty compact Hausdorff `X`, work with Radon probabilities and
prove that `invariantProbabilities T` is nonempty
(Mathlib's Krylov–Bogolyubov), closed in `ProbabilityMeasure X` hence compact, and convex as a
subset of `Measure X`; prove the extreme-point characterization by ergodicity in this Radon
setting, agreeing with Mathlib's theorem wherever its hypotheses apply. Define
`UniquelyErgodic T` as `invariantProbabilities T` being a singleton, and prove its equivalence with
uniform convergence of `birkhoffAverage ℝ T f n` to a constant for every `f : C(X, ℝ)`. Prove that
a rotation of a compact metrizable abelian group with dense powers is uniquely ergodic.

**Checks.** The identity on a two-point space has two ergodic measures and is not uniquely ergodic.

*Needs:* §0.6; Mathlib Krylov–Bogolyubov and `Ergodic.iff_mem_extremePoints`. Supply the
weak-* empirical-measure proof for compact Hausdorff spaces, and the extreme-point comparison.

### 5.2 Topological entropy

Mathlib's `coverEntropy T univ` is the topological entropy. Add, for a compact metric space:

1. the metric (Bowen–Dinaburg) forms by `(n, ε)`-separated and spanning sets, with `ε → 0`, equal
   to `coverEntropy` (from `coverEntropy_eq_iSup_netEntropyEntourage` and the metric basis of the
   uniformity);
2. the open-cover (Adler–Konheim–McAndrew) definition `openCoverEntropy T` on nonempty compact
   Hausdorff spaces, and its equality with `coverEntropy T univ` for the compatible compact
   uniformity; specialize to the metric formulas in item 1;
3. `coverEntropy (T^[k]) univ = k * coverEntropy T univ` for `k ≥ 1`;
   `coverEntropy T.symm univ = coverEntropy T univ` for a homeomorphism; additivity on products;
   monotonicity under topological factors (Mathlib's `Semiconj` results);
4. isometries have entropy 0; the full shift on `ℕ → α` or `ℤ → α`, `α` finite, has entropy
   `log (card α)`; a one-step subshift of finite type whose `0`-`1` transition matrix `M` has no
   zero row has entropy `log (spectralRadius ℝ M)` (count admissible words by entries of `M^n` and apply
   `spectrum.gelfand_formula`);
5. `coverEntropy (toralEndomorphism A) univ ≤ ∑_{|λ|>1} log |λ|` by counting spanning sets in a
   fundamental domain.

Define topological transitivity through Mathlib's `IsTopologicallyTransitive` for the `ℕ`-action of
`IterateMulAct T` and `ℤ`-action of a homeomorphism, and topological mixing `IsTopologicallyMixing
T`: for nonempty open `U`, `V`, `T^[n] '' U ∩ V` is nonempty for all large `n`. For a homeomorphism
of a nonempty compact metric space without isolated points, prove that transitivity of the
`ℤ`-action is equivalent to the existence of a point whose forward and backward orbits are both
dense, and that such points form a dense `G_δ` (Baire category).

Prove the **Lipschitz bound**: if `T` is `L`-Lipschitz on a compact metric space whose minimal
`ε`-cover cardinalities satisfy `N(ε) ≤ C ε^(-D)` for `ε ∈ (0, 1]`, then
`coverEntropy T univ ≤ D * max 0 (log L)`; in particular it is finite. Specialize to compact subsets
of `ℝⁿ` (`D = n`) and to `UnitAddTorus (Fin d)`. (Applying it to `C¹` maps of compact manifolds needs
the covering bound for a Riemannian distance, which is outside this roadmap.)

Prove that in the metric formulas of item 1 and of §5.4 it does not matter whether separation is
`dist ≥ ε` or `dist > ε`, nor whether Bowen balls are open or closed: each convention at scale `ε`
lies between the other at scales `ε/2` and `ε`, so the limits as `ε → 0` agree.

**Checks.**

- The identity has entropy 0; the doubling map on `UnitAddCircle` has entropy `log 2`.
- The golden-mean shift (matrix `!![1,1;1,0]`) has entropy `log ((1 + √5)/2)`.

*Needs:* Mathlib `Dynamics.TopologicalEntropy`, `spectralRadius`; §0.3.

### 5.3 Expansive maps

Define expansiveness of a monoid action on a separated uniform space by existence of an
entourage `U` for which `∀ m, (m • x, m • y) ∈ U` implies `x = y`. Prove invariance under
uniform conjugacy, restriction to invariant subsets, and the finite-window forms. On compact
Hausdorff spaces use their compatible uniformity. For a metric space give the equivalent
constant formulation: `IsExpansive T δ` for a homeomorphism (for distinct `x`, `y` some `n : ℤ` has
`δ < dist (T^n x) (T^n y)`) and `IsPositivelyExpansive T δ` for a continuous map (with `n : ℕ`).
Prove that two-sided full shifts and subshifts are expansive and one-sided ones positively
expansive, that `toralEndomorphism A` with `A.det = ±1` and no eigenvalue of modulus 1 is an
expansive homeomorphism, that it is positively expansive when every eigenvalue has modulus `> 1`,
and
that an expansive homeomorphism has finite topological entropy computed at any scale `< δ`.

**Checks.** An irrational rotation is not expansive.

*Needs:* §5.2.

### 5.4 Topological pressure of maps

For a continuous `T` on a compact metric space and `φ : C(X, ℝ)`, define
`topologicalPressure T φ : EReal` by

```text
P(T, φ) = ⨆ U ∈ 𝓤 X, limsup_{n → ∞} (1/n) log sup { ∑_{x ∈ s} exp (birkhoffSum T φ n x) |
                                                      s finite, IsDynNetIn T univ U n s }
```

and the spanning version with `inf` over `IsDynCoverOf`; prove they agree, that the metric
`ε → 0` forms agree, and:

1. `topologicalPressure T 0 = coverEntropy T univ`;
2. `P(T, φ) ≤ P(T, ψ)` if `φ ≤ ψ`; `P(T, φ + c) = P(T, φ) + c`; `|P(T, φ) - P(T, ψ)| ≤ ‖φ - ψ‖`
   when finite; `P(T, φ) = ⊤` for every `φ` iff `coverEntropy T univ = ⊤`;
3. `P(T, φ + ψ ∘ T - ψ) = P(T, φ)`;
4. `P(T^[k], birkhoffSum T φ k) = k * P(T, φ)`;
5. convexity of `φ ↦ P(T, φ)` where finite;
6. invariance under topological conjugacy.

**Checks.**

- For the identity on a nonempty finite set `F`, `P(id, φ) = max_{x ∈ F} φ x`.
- For the full shift on two symbols and `φ x = a` if `x 0 = 0`, `b` otherwise,
  `P = log (exp a + exp b)`.

*Needs:* §5.2; Mathlib `birkhoffSum`.

### 5.5 Topological entropy and pressure of continuous flows

For `ϕ : Flow ℝ X` on a compact metric space and `F : C(X, ℝ)`, define `flowTopologicalPressure ϕ F`
as in 5.4 with `(t, ε)`-separated sets for the flow Bowen balls of the conventions, weights
`exp (∫_0^t F (ϕ s x) ds)` and `t → ∞` through reals. Prove:

1. `flowTopologicalPressure ϕ F = topologicalPressure (ϕ 1) F₁` with
   `F₁ x = ∫_0^1 F (ϕ s x) ds`;
2. `coverEntropy (ϕ t) univ = |t| * coverEntropy (ϕ 1) univ`;
3. `flowTopologicalPressure ϕ 0 = coverEntropy (ϕ 1) univ`;
4. the limit defining the pressure may be taken with `limsup` or with `liminf` over real `t → ∞`
   (equivalently over `t ∈ ℕ`) after `ε → 0`, and with either separation convention of §5.2.

A flow is *topologically transitive* when its `ℝ`-action is, in Mathlib's
`AddAction.IsTopologicallyTransitive ℝ X`; prove that on a compact metric space without isolated
points this is equivalent to the existence of a dense forward orbit, and that transitivity of a
time-`t` map implies transitivity of the flow, but not conversely.

Route: uniform continuity of `(s, x) ↦ ϕ s x` on `[0, 1] × X` compares flow Bowen balls at time `n`
with those of the time-1 map at step `n`.

**Checks.** For the unit-speed flow on `UnitAddCircle`, `(t, ε)`-separated sets have at most
`⌈1/ε⌉` points for every `t`, and `∫_0^t F (x + s) ds = t ∫ F d volume + O(1)` uniformly in `x`, so
`flowTopologicalPressure ϕ F = ∫ F d volume`; in particular the entropy is 0.

*Needs:* §5.4; Mathlib `Flow`.

### 5.6 Topological entropy and pressure of amenable actions

For continuous actions of countably infinite discrete amenable groups on a nonempty compact Hausdorff
space, define open-cover entropy by the normalized logarithm of the minimum subcover cardinality
of the finite-window joins. Prove Følner independence using §4.6's Ornstein–Weiss lemma and
define `actionTopologicalEntropy G X : EReal`. On compact metrizable spaces prove its agreement
with §0.5's separated/spanning formulations, independently of the compatible metric.

For `φ : C(X, ℝ)` on a compact metrizable `X`, use weights `exp(∑ g ∈ F, φ(g • x))` and define
`actionTopologicalPressure G φ : EReal` by normalized separated-set sums, with the scale tending
to zero. Construct the weighted open-cover version, prove the finite-window comparison estimates,
and apply the limit lemma to weighted covers after adding a constant to make the potential
nonnegative. Prove equality of the cover, separated and spanning definitions and independence
of Følner family. In particular the scale limit of limsup agrees with that of liminf; a fixed
separation scale is not asserted to have a limit without further hypotheses.

Prove pressure at zero equals entropy, potential monotonicity, addition of constants, the
finite-valued Lipschitz bound and convexity, and conjugacy invariance. Prove invariance under
adding `ψ ∘ (g • ·) - ψ` for a fixed `g`, using the Følner boundary estimate; include finite sums
of such coboundaries. Prove entropy factor monotonicity and product additivity. The ℤ-action of a
homeomorphism agrees with the map definitions in §§5.2 and 5.4. For infinite `G`, the finite-alphabet
full shift has entropy `log #α` and a coordinate potential has pressure `log ∑ a, exp(φ a)`.

**Checks.** A trivial action of an infinite amenable group has entropy zero and pressure
`max φ`; ℤᵈ full shifts have the same entropy per site for boxes of different aspect ratios
when all side lengths tend to infinity.

*Needs:* §§0.5, 4.6, 5.2–5.4; Mathlib finite covers and compact uniformity.

## Layer 6: Measure entropy of continuous maps

### 6.1 Small partitions and expansive maps

For a Borel probability `μ` on a compact metric space and `ε > 0`, construct a finite Borel
partition with atom diameters `< ε` and `μ`-null boundaries (cover by finitely many balls of radius
`< ε/2` whose spheres are `μ`-null, which holds for all but countably many radii, and take the
generated partition). Prove: for continuous `T` on a compact metric space and `ν ∈ invariantProbabilities T`,
`h_ν(T) = lim_{k} h_ν(T, ξ_k)` for any sequence of finite partitions with diameters tending to 0;
for an expansive homeomorphism with constant `δ`, every finite partition with diameters `< δ` is a
two-sided generator for every invariant measure, and for a positively expansive map a one-sided
generator.

Prove **Goodwyn's inequality** `(h_ν(T) : EReal) ≤ coverEntropy T univ` for every
`ν ∈ invariantProbabilities T`, and for ergodic `ν` and every Borel `Y` with `ν Y > 0` the bound by
`Dynamics.coverEntropyInf T Y`. Route: approximate a finite partition from inside by compact
sets and compare `ξⁿ` with the `n`-fold join of an open cover each of whose members meets at most
two atoms (Walters, Chapter 8); the localized bound uses SMB (§4.10) and the Birkhoff theorem for
visits near partition boundaries.

*Needs:* §§4.2, 4.10, 5.2–5.3.

### 6.2 Upper semicontinuity of the entropy map

Prove that `ν ↦ h_ν(T)` is upper semicontinuous on `invariantProbabilities T` for expansive
homeomorphisms and positively expansive maps. Route: given `ν`, take a generator `ξ` with
`ν`-null boundaries; then `ν' ↦ H_{ν'}(ξ^n)` is continuous at `ν`, and `h_{ν'}(T) = inf_n
H_{ν'}(ξ^n)/n` is an infimum of functions continuous at `ν`.

Prove **Jacobs' theorem** for mixtures: on a compact metric space, for a measurable family
`s ↦ ν_s` of invariant probabilities indexed by a probability space `(S, ρ)`,
`h_{∫ ν_s dρ}(T) = ∫⁻ h_{ν_s}(T) dρ`. Route: §4.10's ergodic decomposition with entropy
integration applied to the mixture and to each `ν_s`, and uniqueness of the ergodic decomposition.

**Checks.** For the identity on `[0, 1]` the map is identically 0 and upper semicontinuous; for the
full shift, the Dirac mass at the fixed point `000…` is a limit of Bernoulli measures `(1-1/k, 1/k)`
whose entropies tend to 0, consistent with upper semicontinuity.

*Needs:* §§4.10 (ergodic decomposition), 6.1.

### 6.3 Brin–Katok

Prove the **Brin–Katok local entropy formula**: for continuous `T` on a compact metric space and
`ν ∈ invariantProbabilities T`, the functions
`h̲(x) = sup_{ε > 0} liminf_{n → ∞} information (ν(B_n(x, ε))) / n : ℝ≥0∞` and the
corresponding `limsup` agree
`ν`-almost everywhere, are `T`-invariant, and `∫⁻ h̲ dν = h_ν(T)`; for ergodic `ν` they equal
`h_ν(T)` almost everywhere.

Route: the upper bound from Shannon–McMillan–Breiman (§4.10) for a partition with small
diameter and null boundary, comparing Bowen balls with partition atoms off a set of small measure;
the lower bound by a covering argument. (Brin and Katok, *On local entropy*, 1983.)

**Checks.** For an isometry `B_n(x, ε) = B(x, ε)`, so both sides are 0.

*Needs:* §§4.10 (Shannon–McMillan–Breiman), 6.1.

### 6.4 Abramov's formula for measurable flows and toral entropy

For a jointly measurable probability-preserving real flow on a standard Borel space, prove
`h_μ(ϕ t) = |t| * h_μ(ϕ 1)` for every real `t`, with `ℝ≥0∞` arithmetic including `t = 0` and
infinite entropy. Establish a measurable-flow proof by comparing finite-partition information
at different time meshes and approximating measurable observables using strong continuity
of Koopman. Supply these partition approximation and mesh comparison lemmas (Abramov's
entropy-of-a-flow theorem). The compact continuous result is a specialization; its local-entropy
proof via §6.3 and the Bowen-ball comparison of §5.5 gives the compatibility check.

For §3.3's suspension over an ergodic invertible base with positive integrable roof, prove
`h_susp(ϕ 1) = h_μ(T) / ∫ r dμ`. Supply the return-section information comparison, using §4.4
for discrete induced maps and finite-step approximations to the roof; prove stability under
these approximations and changes on null sets. Thus the time-`t` entropy is
`|t| * h_μ(T) / ∫ r dμ`.

Prove that `volume` has entropy `∑_{|λ|>1} log |λ|` for `toralEndomorphism A` (`A.det ≠ 0`):
Bowen balls are translates of the Bowen ball at `0`, whose volume is computed from the Jordan form
of `A` up to factors subexponential in `n`; combine with Brin–Katok and Layer 5.2's upper bound to
get `h_volume = coverEntropy (toralEndomorphism A) univ`.

Prove that every invariant probability of an isometry of a compact metric space, in particular of
a rotation of a compact metrizable abelian group, has entropy 0, from Layer 5.2's `h_top = 0` and
the inequality `h_μ ≤ h_top` of §6.1.

**Checks.**

- The cat map has entropy `log ((3 + √5)/2)` for `volume`, equal to its topological entropy.
- For a linear flow on a torus, every `h_ν(ϕ t)` is 0.

*Needs:* §§0.2, 3.3–3.4, 4.1–4.4, 5.2, 5.5, 6.3; Abramov partition and suspension comparisons above.

## Layer 7: Variational principles

### 7.1 The variational principle for pressure

For continuous `T` on a compact metric space and `φ : C(X, ℝ)`, prove

```text
topologicalPressure T φ = ⨆ ν ∈ invariantProbabilities T, (h_ν(T) : EReal) + ∫ φ dν
                        = ⨆ ν ∈ invariantProbabilities T, Ergodic T ν → (h_ν(T) : EReal) + ∫ φ dν
```

The inequality `≥` is the partition argument of §6.1's `h_ν(T) ≤ h_top(T)` with weights
(Walters, Chapter 9). The inequality `≤` is Misiurewicz's construction: weak limits of the weighted empirical
measures on maximal separated sets, with a partition whose boundary is null for the limit (Walters,
Chapter 9). The ergodic form follows from §4.10's ergodic
decomposition.

**Checks.** For the identity on a nonempty finite set `F`, every invariant measure has entropy
zero; the supremum is `max φ` and is attained precisely by probabilities supported on its
maximizers. For a full shift with a coordinate potential, Gibbs' inequality gives the Bernoulli
weights proportional to `exp (φ a)`.

*Needs:* §§4.10, 5.4, 6.1.

### 7.2 The variational principle for entropy

Prove `coverEntropy T univ = ⨆ ν ∈ invariantProbabilities T, (h_ν(T) : EReal)`, and the same over
ergodic `ν`, as the case `φ = 0` of 7.1.

**Checks.** For the full shift on `k` symbols, the uniform Bernoulli measure attains `log k`.

*Needs:* §7.1.

### 7.3 The variational principle for flows

For `ϕ : Flow ℝ X` on a nonempty compact metric space and `F : C(X, ℝ)`,
prove

```text
flowTopologicalPressure ϕ F = ⨆ ν ∈ flowInvariantProbabilities ϕ, (h_ν(ϕ 1) : EReal) + ∫ F dν.
```

Route: 7.1 for the time-1 map with `F₁` (Layer 5.5). For its invariant probability `ν`,
let `ν̄ = ∫_0^1 (ϕ s)_*ν ds` (Layer 3.4) and prove
`∫ F dν̄ = ∫ F₁ dν`. Every translated measure is conjugate to `ν` for the time-1 map, so
Jacobs' formula of §6.2 gives `h_ν̄(ϕ 1) = ∫⁻_0^1 h_((ϕ s)_*ν)(ϕ 1) ds = h_ν(ϕ 1)` even
when this value is infinite. The potential integral is finite, so the `EReal` comparison uses
`⊤ + finite = ⊤` and no subtraction of infinite quantities. There is no finite-entropy hypothesis.

**Checks.** For the linear flow on `UnitAddCircle`, the only flow-invariant probability is
`volume`, so the right side is `∫ F d volume`; compare with Layer 5.5.

*Needs:* §§3.4, 5.5, 6.2, 7.1.

### 7.4 Amenable variational principles

For a continuous action of a countably infinite discrete amenable group `G` on a nonempty
compact metrizable space and `φ : C(X, ℝ)`, prove

```text
actionTopologicalPressure G φ =
  ⨆ ν ∈ actionInvariantProbabilities G, (actionMeasureEntropy G ν : EReal) + ∫ φ dν.
```

Construct invariant probabilities as weak limits of orbit averages along Følner windows, using
§0.6 and the boundary estimates. Prove the pressure lower bound by the weighted finite-partition
inequality. For the upper bound construct weighted separated-set measures, average their
translates, and prove the finite-window entropy comparison using Shearer's inequality and
null-boundary partitions. This comparison replaces the single-map blocking argument; prove it
with its explicit Følner boundary error. Retain `EReal` values, including infinite entropy.
Deduce the entropy principle at `φ = 0`, and the supremum over ergodic invariant probabilities
using §4.7's entropy integration. Prove agreement with §7.1 for the ℤ-action of a homeomorphism.

**Checks.** For the finite-alphabet ℤᵈ full shift, uniform Bernoulli measure attains `log #α`.
For a coordinate potential the Bernoulli measure with Gibbs weights attains `log ∑ exp φ`.

*Needs:* §§0.6, 4.6–4.7, 5.6, 6.1 (null-boundary partitions); the weighted boundary comparison above.

## Layer 8: Equilibrium states and measures of maximal entropy

### 8.1 Definitions

For continuous `T` on a nonempty compact metric space and `φ : C(X, ℝ)`:

- `IsEquilibriumState T φ ν`: `ν ∈ invariantProbabilities T` and
  `(h_ν(T) : EReal) + ∫ φ dν = topologicalPressure T φ`;
- `IsMeasureOfMaximalEntropy T ν`: `ν ∈ invariantProbabilities T` and
  `(h_ν(T) : EReal) = coverEntropy T univ`.

For `ϕ : Flow ℝ X` and `F : C(X, ℝ)`:

- `IsFlowEquilibriumState ϕ F ν`: `ν ∈ flowInvariantProbabilities ϕ` and
  `(h_ν(ϕ 1) : EReal) + ∫ F dν = flowTopologicalPressure ϕ F`.

These definitions use extended-valued equalities and impose no finite-entropy hypothesis.
By Layer 7 these are the measures attaining the suprema; prove the restatements
`isEquilibriumState_iff_isMaxOn` and its flow analogue. Prove `IsMeasureOfMaximalEntropy T ν ↔
IsEquilibriumState T 0 ν`, and that `IsFlowEquilibriumState ϕ F ν` iff `ν` is flow invariant and
`IsEquilibriumState (ϕ 1) F₁ ν`.

**Agreement with finite-entropy formulations.** Textbooks often assume `h_top(T) < ∞` (respectively
`h_top(ϕ 1) < ∞`) and define pressure as the real number
`sup_ν (h_ν(T) + ∫ φ dν)`, equilibrium states and measures of maximal entropy by real equalities.
Assuming `coverEntropy T univ < ⊤`, prove:

1. `h_ν(T) < ⊤` for every `ν ∈ invariantProbabilities T` (Goodwyn, §6.1), so `(h_ν(T)).toReal` is
   the entropy;
2. `topologicalPressure T φ` is a real number, and its real value is
   `⨆ ν ∈ invariantProbabilities T, (h_ν(T)).toReal + ∫ φ dν` (a real supremum of a bounded set);
3. `IsEquilibriumState T φ ν` iff `ν` is invariant and
   `(h_ν(T)).toReal + ∫ φ dν = (topologicalPressure T φ).toReal`; `IsMeasureOfMaximalEntropy T ν`
   iff `ν` is invariant and `(h_ν(T)).toReal = (coverEntropy T univ).toReal`;
4. the flow analogues, with `flowInvariantProbabilities ϕ`, `h_ν(ϕ 1)` and
   `flowTopologicalPressure ϕ F`, under `coverEntropy (ϕ 1) univ < ⊤`.

Without the finiteness hypothesis the extended definitions remain meaningful: if
`coverEntropy T univ = ⊤`, every invariant probability of infinite entropy is an equilibrium state
of every potential, and these are the only equilibrium states. Prove this as the statement that
complements items 1–4.

**Checks.** For the identity on a nonempty finite set, equilibrium states of `φ` are exactly
the probabilities supported on the maximizers of `φ`; uniqueness holds exactly when the maximizer
is unique. Every invariant probability of the identity on a compact space is a measure of
maximal entropy (`h_top = 0`).

*Needs:* Layer 7.

### 8.2 Structure of the set of equilibrium states

Prove for continuous `T` on a nonempty compact metric space, with finiteness imposed per item:

1. if topological entropy is finite, the set of equilibrium states of `φ` is convex, and its
   extreme points are exactly its ergodic members; almost every ergodic component of an equilibrium state is an equilibrium state
   (§4.10's ergodic decomposition); in particular `T` has a unique measure of maximal entropy
   iff it has at least one and exactly one ergodic one;
2. if `ν ↦ h_ν(T)` is upper semicontinuous on `invariantProbabilities T` (for instance `T` expansive,
   Layer 6.2), every `φ` has an equilibrium state, and the set of equilibrium states is compact;
3. potentials differing by a coboundary `ψ ∘ T - ψ` (`ψ : C(X, ℝ)`) plus a constant have the same
   equilibrium states;
4. for a homeomorphism, measures of maximal entropy of `T` and `T.symm` coincide;
5. if topological entropy is finite, `ν` is an equilibrium state of `φ` iff `ν` is a tangent
   functional to `P(T, ·)` at `φ`
   (`∫ ψ dν ≤ P(T, φ + ψ) - P(T, φ)` for all `ψ`), the converse direction assuming upper
   semicontinuity (Walters, Chapter 9);
6. the flow analogues of 1–3 for `IsFlowEquilibriumState`, with the finiteness hypothesis only
   on the analogue of item 1, with coboundaries replaced by
   `u (ϕ t x) - u x = ∫_0^t G (ϕ s x) ds` for continuous `u`, `G`.

For item 2 prove the infinite-entropy case explicitly: upper semicontinuity on the compact
invariant-probability set yields a measure of infinite entropy when the entropy supremum is
infinite; it is an equilibrium state for every continuous potential. The equilibrium set is then
the closed set of infinite-entropy measures. Items 3 and 4 require no entropy bound. In item 5
the finiteness hypothesis makes the pressure difference meaningful.

**Checks.**

- The full shift on `ℕ → Fin k` has the uniform Bernoulli measure as its unique measure of maximal
  entropy; for `φ` depending only on `x 0`, the unique equilibrium state is the Bernoulli measure
  with `p_i ∝ exp (φ i)` and `P(φ) = log ∑ exp (φ i)` (Layer 4.1 item 5 and Gibbs' inequality;
  Walters, Chapter 9).
- For every `toralEndomorphism A` with `A.det ≠ 0`, `volume` is a measure of maximal entropy
  (Layer 6.4).
- A rotation of a compact metrizable abelian group: every invariant probability is a measure of
  maximal entropy.
- **Nonexistence (Misiurewicz type).** Construct a homeomorphism of a compact metric space with
  finite topological entropy and no measure of maximal entropy, and prove both properties. Take
  for `X_k` the two-sided subshift of finite type in `ℤ → Fin 2` forbidding `k` consecutive `1`s,
  with entropy `log λ_k` increasing strictly to `log 2` (§5.2 item 4), rescale its metric by
  `2⁻ᵏ`, and let `X` be the one-point compactification of the disjoint union of the `X_k`, the
  added point fixed. Then `coverEntropy T univ = log 2` (every ergodic measure lives on one `X_k`
  or is the Dirac mass at the added point; §7.2's ergodic form), and no invariant probability has
  entropy `log 2` (§4.1 item 4 and Jacobs' formula for the decomposition along the pieces). The
  entropy map is not upper semicontinuous at the Dirac mass, consistent with item 2.
  Misiurewicz's `C^r` diffeomorphisms without measures of maximal entropy belong to smooth
  dynamics and are outside this roadmap.

*Needs:* §§4.10, 6.2, 6.4, 7.1–7.3, 8.1.

### 8.3 Equilibrium states of amenable actions

For §7.4's actions define `IsActionEquilibriumState G φ ν` and
`IsActionMeasureOfMaximalEntropy G ν` by invariant-probability membership and equality with the
extended-valued variational supremum. Prove the zero-potential equivalence and the ℤ-action
compatibility with §8.1. Under finite topological entropy, prove convexity, the ergodic extreme-point
characterization and the statement about almost every ergodic component. Separately, under upper
semicontinuity of the entropy map, prove existence and compactness of the equilibrium-state set.
The existence, compactness and coboundary claims carry no finiteness hypothesis; handle infinite
entropy as in §8.2. Prove invariance under finite sums of group coboundaries and addition of
constants. For expansive actions on compact metrizable spaces, prove that sufficiently small finite partitions are
generators and deduce upper semicontinuity by the infimum rule in §4.6. Supply the finite-window
null-boundary continuity proof, obtaining equilibrium states for every continuous potential.

**Checks.** The finite-alphabet full shift of every countably infinite amenable group has uniform
Bernoulli measure as its unique measure of maximal entropy. A coordinate potential has the unique
Bernoulli equilibrium state with Gibbs weights; prove uniqueness from entropy equality and
independence of finite coordinate labels.

*Needs:* §§4.6–4.7, 5.3, 5.6, 7.4, 8.1–8.2.

### 8.4 Specification and uniqueness of equilibrium states

Let `T` be a homeomorphism of a nonempty compact metric space.

- `HasSpecification T`: for every `ε > 0` there is `M : ℕ` such that for all finitely many points
  `x_1, …, x_k`, integer intervals `[a_1, b_1], …, [a_k, b_k]` with `a_(i+1) - b_i ≥ M`, and every
  `p ≥ M + b_k - a_1`, there is `y` with `T^p y = y` and `dist (T^n y) (T^n x_i) ≤ ε` for
  `n ∈ [a_i, b_i]` (Bowen's specification with periodic shadowing). State a one-sided variant for
  continuous maps with `n : ℕ`.
- `HasBowenProperty T φ`: there are `ε > 0` and `K` such that `|S_n φ x - S_n φ y| ≤ K` whenever
  `dist (T^k x) (T^k y) ≤ ε` for all `k < n`. Prove that every `HolderWith C r φ` has the Bowen
  property when there are `C'` and `λ < 1` such that `dist (T^k x) (T^k y) ≤ ε` for all `k < n`
  implies `dist (T^k x) (T^k y) ≤ C' λ ^ min k (n - 1 - k)` for all `k < n` (true for the shifts
  below), and that the property is invariant under adding `ψ ∘ T - ψ + c` for continuous `ψ`.
- `IsGibbsMeasure T φ μ`: for every sufficiently small `ε > 0` there is `K ≥ 1` with
  `K⁻¹ ≤ μ (B_n(x, ε)) / exp (-n P + S_n φ x) ≤ K` for all `x` and `n ≥ 1`, where
  `P = (topologicalPressure T φ).toReal`.

Prove **Bowen's theorem**: if `T` is expansive with specification and `φ` has the Bowen property,
then `φ` has exactly one equilibrium state `μ_φ`; it is ergodic, gives positive mass to every
nonempty open set, is a Gibbs measure, and is the weak limit of the periodic-orbit measures
`(∑_{T^p x = x} exp (S_p φ x))⁻¹ ∑_{T^p x = x} exp (S_p φ x) δ_x`; moreover
`topologicalPressure T φ = lim (1/p) log ∑_{T^p x = x} exp (S_p φ x)`. Route (Bowen, *Some
systems with unique equilibrium states*, 1974): the specification counting estimates for
separated sets, the Gibbs property of any weak limit of the periodic-orbit measures, ergodicity
from the Gibbs property and specification, and uniqueness because an equilibrium state singular
to `μ_φ` would violate the Gibbs upper bound on a set separating them. Finite topological entropy
holds by expansiveness (§5.3), so §8.1's real formulation applies.

**Subshifts of finite type.** For a finite nonempty alphabet `ι` and `A : ι → ι → Bool`, define the
two-sided SFT `sftTwoSided A ⊆ ℤ → ι` of sequences with `A (x n) (x (n + 1))` for all `n`, as a
Mathlib `Subshift`, and the one-sided `sftOneSided A ⊆ ℕ → ι`; give them the metrics
`d_θ x y = θ ^ (min {|n| : x n ≠ y n})` for `θ ∈ (0, 1)`, compatible with the product topology. Call
`A` *irreducible* if for all `i, j` some power of the `0`-`1` matrix of `A` has positive `(i, j)` entry,
and *aperiodic* (primitive) if one power is entrywise positive. Prove:

1. the shift on `sftTwoSided A` is expansive; it is topologically transitive iff `A` is
   irreducible (after deleting symbols that occur in no bi-infinite sequence), and topologically
   mixing iff `A` is aperiodic;
2. for aperiodic `A`, the shift has specification;
3. for irreducible `A` of period `d`, the space splits into `d` clopen sets cyclically permuted by
   the shift, on each of which the `d`-th iterate is conjugate to an aperiodic SFT (spectral
   decomposition);
4. every `θ'`-Hölder function for `d_θ` has the Bowen property.

Hence **every Hölder potential on a transitive two-sided SFT has a unique equilibrium state**,
ergodic, Gibbs and fully supported: for aperiodic `A` by Bowen's theorem, and for irreducible `A`
by applying it to the `d`-th iterate on one piece with potential `S_d φ`, and spreading the
equilibrium state over the `d` pieces (§4.1 item 2 and §5.4 item 4). The same holds for one-sided
SFTs.

**Checks.**

- The full shift on `Fin k` and a potential depending on `x 0`: `μ_φ` is the Bernoulli measure
  with weights proportional to `exp (φ i)`, as in §8.2.
- For the golden-mean shift and `φ = 0`, `μ_0` is the Parry measure (§8.6) and its entropy is
  `log ((1 + √5)/2)`.
- The identity on a two-point space is expansive but has no specification and two measures of
  maximal entropy. The disjoint union of two full shifts on `Fin 2` is expansive, has no
  specification, and has two ergodic measures of maximal entropy.

*Needs:* §§0.3, 5.2–5.4, 7.1, 8.1–8.2; Mathlib `Subshift`, `HolderWith`.

### 8.5 Uniqueness for flows

Let `ϕ : Flow ℝ X` be a continuous flow on a nonempty compact metric space.

- `IsExpansiveFlow ϕ` (Bowen–Walters): for every `ε > 0` there is `δ > 0` such that if
  `dist (ϕ t x) (ϕ (s t) y) < δ` for all `t` and some continuous `s : ℝ → ℝ` with `s 0 = 0`,
  then `y = ϕ u x` for some `|u| < ε`.
- `HasFlowSpecification ϕ`: for every `ε > 0` there is `M > 0` such that for finitely many points
  and real intervals `[a_i, b_i]` with gaps at least `M` and every
  `p ≥ b_k - a_1 + M` there is `y` with `dist (ϕ t y) (ϕ t x_i) ≤ ε` on `[a_i, b_i]` and
  `ϕ (p + τ) y = y` for some `|τ| ≤ ε` (Bowen's specification for flows).
- `HasFlowBowenProperty ϕ F`: there are `ε > 0` and `K` with
  `|∫_0^t F (ϕ s x) ds - ∫_0^t F (ϕ s y) ds| ≤ K` whenever `dist (ϕ s x) (ϕ s y) ≤ ε` on `[0, t]`.

Prove the flow version of Bowen's theorem (Franco, *Flows with unique equilibrium states*, 1977):
an expansive flow with specification and a potential with the flow Bowen property has exactly one
flow equilibrium state; it is ergodic and gives positive mass to every nonempty open set.
Expansive flows have finite topological entropy, so §8.1's real formulation applies.

**Suspension flows over SFTs.** For a two-sided SFT `(Σ, σ)` and a continuous roof `r > 0`, define
the topological suspension `Σ^r = {(x, s) | 0 ≤ s ≤ r x} / ((x, r x) ∼ (σ x, 0))` with the
Bowen–Walters metric, a compact metric space, and its suspension flow, the continuous analogue of
§3.3 identified with it on invariant probabilities. Prove:

1. `ν ↦ ν^r = (∫ r dν)⁻¹ (ν ⊗ Leb)` restricted to `{0 ≤ s < r x}` is a bijection from
   `invariantProbabilities σ` onto `flowInvariantProbabilities`, carrying ergodic measures to
   ergodic measures, with `h_{ν^r}(ϕ 1) = h_ν(σ) / ∫ r dν` (§6.4);
2. for `F : C(Σ^r, ℝ)` with `Δ_F x = ∫_0^(r x) F (x, s) ds`, the flow pressure is the unique real
   `c` with `topologicalPressure σ (Δ_F - c r) = 0`, and `ν^r` is a flow equilibrium state of `F`
   iff `ν` is an equilibrium state of `Δ_F - c r` (Bowen–Ruelle, *The ergodic theory of Axiom A
   flows*, 1975, §3);
3. hence, for irreducible `A`, Hölder `r` and `F` with `Δ_F` Hölder, `F` has exactly one flow
   equilibrium state; it is ergodic and fully
   supported (§8.4). This includes constant roofs, whose flows are transitive but not mixing.

**Flow coboundaries.** Let `u : X → ℝ` be continuous and differentiable along flow lines, with
`Xu x = d/dt|_(t=0) u (ϕ t x)` continuous. Prove `u (ϕ t x) - u x = ∫_0^t Xu (ϕ s x) ds`, so
by §8.2 item 6, `F` and `F + c + Xu` have the same flow equilibrium states and pressures differing
by `c`.

**Checks.**

- The suspension of the full shift on `Fin 2` with roof `1` and `F = 0`: the unique measure of
  maximal entropy is the suspension of the uniform Bernoulli measure, and the flow entropy is
  `log 2`.
- With roof `r` depending on `x 0` only, taking values `r_0`, `r_1`, the topological entropy of
  the flow is the unique `c` with `exp (-c r_0) + exp (-c r_1) = 1`.
- The linear flow on `UnitAddCircle` is not expansive.

*Needs:* §§3.3–3.4, 5.5, 6.4, 7.3, 8.1–8.2, 8.4; Mathlib `Flow`, interval integrals.

### 8.6 The Ruelle–Perron–Frobenius theorem and Gibbs measures

Let `A` be aperiodic and `Σ⁺ = sftOneSided A` with `d_θ`, and let `F_θ` be the Banach space of
`d_θ`-Lipschitz real functions with norm `‖f‖_∞ + Lip f`. Every Hölder function for `d_θ` lies
in `F_(θ')` for some `θ' ∈ (θ, 1)`.

1. **Finite Perron–Frobenius.** For a primitive nonnegative real square matrix `B`, prove that
   `spectralRadius ℝ B` is a simple eigenvalue with entrywise positive left and right
   eigenvectors `u`, `v`, every other eigenvalue has smaller modulus, and
   `B^n / ρ^n → v uᵀ / (u ⬝ᵥ v)`. Route: Tau Ceti's Birkhoff contraction
   `TauCeti.Matrix.hilbertProjectiveDist_mulVec_le` applied to a positive power of `B`.
2. **The transfer operator.** For `φ ∈ F_θ` define `ruelleOperator φ f x = ∑_{σ y = x} exp (φ y) f y`
   on `C(Σ⁺, ℝ)`; prove it is a positive bounded operator preserving `F_θ`, with
   `(L^n f) x = ∑_{σ^n y = x} exp (S_n φ y) f y` and the Lasota–Yorke inequality
   `Lip (L^n f) ≤ C ‖L^n 1‖_∞ (θ^n Lip f + ‖f‖_∞)`.
3. **RPF theorem.** For `φ ∈ F_θ` there are `λ > 0`, a strictly positive `h ∈ F_θ` and a Borel
   probability `ν` with `L h = λ h`, `L* ν = λ ν`, `∫ h dν = 1`, `λ^(-n) L^n f → h ∫ f dν`
   uniformly for every `f ∈ C(Σ⁺, ℝ)`, and exponentially fast in `F_θ` for `f ∈ F_θ`; moreover
   `log λ = (topologicalPressure σ φ).toReal`. Route: for locally constant `φ` depending on `m`
   coordinates, `L` acts on functions of `m` coordinates as a primitive matrix and item 1 applies;
   for general `φ`, contract the cone `{f > 0 | f x ≤ exp (K d_θ x y) f y}` in Hilbert's projective
   metric (Birkhoff), using item 2 and the cylinder structure. (Bowen, *Equilibrium States and the
   Ergodic Theory of Anosov Diffeomorphisms*, Chapter 1; Parry–Pollicott, Chapter 2.)
4. **Gibbs measures.** `μ_φ = h ν` is `σ`-invariant, satisfies
   `C⁻¹ ≤ μ_φ [x 0 … x (n-1)] / exp (-n P + S_n φ x) ≤ C`, is the unique equilibrium state of `φ`
   and coincides with §8.4's `μ_φ`. It is mixing, and exponentially mixing for `F_θ` observables in
   the sense of §3.6.
5. **Two-sided SFTs.** Prove Sinai's lemma: every `φ ∈ F_θ` on `sftTwoSided A` is
   `ψ + u ∘ σ - u` with `ψ ∈ F_(√θ)` depending only on nonnegative coordinates and `u` continuous.
   The equilibrium state of `φ` is the natural extension (§0.7) of the one-sided Gibbs measure of
   `ψ`, and is exponentially mixing for Hölder observables.
6. **Derivative of pressure.** For `φ, ψ ∈ F_θ`, `t ↦ topologicalPressure σ (φ + t ψ)` is real
   differentiable with derivative `∫ ψ dμ_(φ + t ψ)`; hence `μ_φ` is the unique tangent functional
   of §8.2 item 5.

**Checks.**

- Full shift, `φ` depending on `x 0`: `λ = ∑ i, exp (φ i)`, `h = 1`, and `ν = μ_φ` is Bernoulli.
- Golden-mean shift, `φ = 0`: `λ = (1 + √5)/2`, and `μ_0` is the Parry measure
  `μ [i_0 … i_n] = u_(i_0) v_(i_n) / (λ^n (u ⬝ᵥ v))` for the Perron eigenvectors of `!![1,1;1,0]`.
- For `φ = 0`, `log λ = log (spectralRadius ℝ M)` recovers §5.2 item 4.

*Needs:* §§0.7, 3.6, 4.1–4.3, 5.2, 5.4, 7.1, 8.1–8.4; Tau Ceti Birkhoff contraction; Mathlib
`spectralRadius`, `Subshift`, Arzelà–Ascoli.

## Layer 9: Billiard flows of polygonal domains

The plane is `ℂ`; directions are Mathlib's `Circle`, with arclength measure `dθ`, the pushforward of
Lebesgue measure on `[0, 2π)` under `Circle.exp`, of total mass `2π`.

### 9.1 Polygonal tables

A *simple polygon* is `poly : Polygon ℂ n` with `3 ≤ n`, `poly.HasNondegenerateEdges`,
injective vertices, and distinct closed sides meeting only at common endpoints; require
`IsJordanCurve (poly.boundary ℝ)` and prove compatibility with the polygon parametrization.
The endpoint-intersection hypothesis excludes multiple traversals of the same Jordan boundary.
Its filled hull is compact, with boundary and interior given
by Tau Ceti's `IsJordanCurve.frontier_filledHull` and `IsJordanCurve.interior_filledHull`.
A *polygonal domain* has one outer simple polygon and a finite family of inner simple polygons,
with their filled hulls pairwise disjoint and contained in the interior of the outer hull.
Its closed table `P` is the outer hull with the interiors of the inner hulls removed. Require
`interior P` to be nonempty and connected. Define `PolygonalDomain` with these data and proofs;
a simple polygon gives the case of an empty family of holes.

Prove `P` is compact, `P = closure (interior P)`, its area is finite and positive, its frontier
is exactly the union of the boundary components and has area zero. Use the finite disjoint-union
index type of all component sides and vertices. Every boundary point outside the vertices lies
in the relative interior of exactly one side and has a unique unit normal `n_S` pointing into
`P`; at an inner boundary it points away from the hole. Prove the local half-plane and vertex-wedge
descriptions of the table, including reflex angles. Reflection is `σ_S v = e_S ^ 2 * conj v`
for a unit side direction, with `⟪σ_S v, n_S⟫ = -⟪v, n_S⟫`. State constructions intrinsically
under Euclidean isometries and prove transport to `EuclideanSpace ℝ (Fin 2)` through the standard
real linear isometry with `ℂ`.

**Checks.**

- For the triangle with vertices `0, 1, I`, the inward normal of the side `[0, 1]` is `I`, and
  `σ_S I = -I`.
- A square with a repeated vertex fails `HasNondegenerateEdges`; a bow-tie quadrilateral fails
  `IsJordanCurve`.
- For a square with a smaller concentric square hole, the inward table normal on the hole's
  right edge points right. A hole touching the outer boundary fails the domain hypotheses.

*Needs:* Mathlib `Polygon`; Tau Ceti `IsJordanCurve`, `filledHull`.

### 9.2 Phase space and trajectories

For a polygonal domain `D` with table `P`, define the setoid on `P × Circle` generated by
`(p, v) ∼ (p, σ_{S(p)} v)` for `p ∈ ∂P \ V`, the
phase space `billiardPhaseSpace D` as its quotient with Mathlib's quotient σ-algebra, and the
inward representative of every nonvertex, nontangent boundary class; interior classes have their
original representatives. Give a measurable selector for the finite reflection equivalence
classes (including deterministic representatives on the singular classes) and prove the quotient
is standard Borel. Define, for an interior or strictly inward boundary state, the collision times
`t_k`, collision points and reflected directions recursively as in the definition: the free flight
`τ_k = sup {t > 0 | ∀ s ∈ (0, t), p_k + s v_k ∈ interior P}`, stopping at a vertex. Prove that
`τ_k ∈ (0, ∞)` and that the reflected direction points strictly inward.

Prove **finiteness of collisions**: if the forward trajectory never hits a vertex, `t_k → ∞`. Route:
otherwise the positions converge to a point of `∂P` (unit speed), which must be a vertex since
collisions with one side are separated; near a vertex of interior angle `β` the reflections in the
two incident sides allow a wedge unfolding: successive reflections give consecutive developed
sectors of angle `β`, and the developed straight trajectory sweeps an angle at most `π`.
Prove the resulting finite crossing bound without assuming the generated reflection group is
finite or that `β/π` is rational. Treat reflex wedges using their local geometry; finite disjoint
boundary components make the argument local to a single vertex.

Define the **singular set** `billiardSingularSet D = Σ` as vertex classes, boundary-tangent
classes and classes whose forward or time-reversed stopped trajectory hits a vertex. A boundary
tangency means `p` lies in the relative interior of side `S` and `v = ±e_S`; interior velocities
parallel to a side are regular unless their trajectories hit a vertex. Define time reversal
`J [(p,v)] = [(p,-v)]` and prove it is well-defined on the quotient.

Prove measurability and nullity by the countable union of finite-side-word hitting events.
For each word unfold its endpoint condition to a reflected vertex image `w'`; away from the
vertices this event lies in the graphs `v = ±(w' - p)/|w' - p|`, of product measure zero by
Fubini. Boundary tangencies are supported on the area-null table boundary. Prove the collision
word regions and stopping times are measurable before using this countable union.

Prove regular trajectories never arrive tangentially at a side from the interior, have no finite
collision accumulation, and remain regular at every positive and negative time, including
collision times. Prove `J '' Σ = Σ` and that shifting a regular trajectory just reindexes its
two-sided collision itinerary. This establishes one common invariant regular carrier for all
real times; it does not intersect an uncountable collection of parameter-dependent conull sets.

**Checks.**

- In the unit square, the state at `1/2 + I/4` with direction `1` hits the right side at time `1/2`
  and returns to the left side at time `3/2`.
- In the unit square, the state at `1/2 + I/2` with direction `exp(i π/4)` hits the vertex `1 + I`
  and lies in `Σ`.
- In the unit square, an interior horizontal trajectory at height `1/4` is regular, while a
  state based in the relative interior of a horizontal side with horizontal velocity is singular.

*Needs:* §9.1; Mathlib quotient σ-algebra, `volume` on `ℂ`.

### 9.3 The billiard flow and Liouville measure

Let `billiardRegularSet D = billiardPhaseSpace D \ Σ`. Define the billiard flow
`billiardFlow D` as an `AddAction ℝ (billiardRegularSet D)`: for `t ≥ 0`, the state at time
`t` on the trajectory; for `t < 0`, `J ∘ (−t +ᵥ ·) ∘ J`. Prove the group law, `MeasurableVAdd₂`, and
that `J` reverses the flow. Define the Liouville probability
`liouvilleMeasure D = (2π · area P)⁻¹ • π_*(volume.restrict P ⊗ dθ)`, prove `Σ` is null for it,
and `VAddInvariantMeasure ℝ (billiardRegularSet D) liouvilleMeasure` by the following itinerary
argument. For each fixed real `t`, partition the conull interior representative set by its finite
collision word between times `0` and `t`. Prove these regions measurable. On a region with word
`w`, unfolding gives
`(p,v) ↦ (A_w p + t A_w v + b_w, A_w v)`, with `A_w` orthogonal and `b_w` fixed by the word.
For each fixed direction the position map is an affine isometry; the direction map preserves
arclength. Use Fubini to prove this map preserves area × arclength on measurable subsets.
Prove separately, from the endpoint line equations and Fubini, that initial states whose time-`t`
position is on the boundary have measure zero. The region images are disjoint by invertibility,
so countable additivity proves measure preservation on interior representatives and then on the
quotient, including all measurable sets.
Give the measurable equivalence with a conull subset of the inward representative space,
carrying the flow measure to normalized area × arclength on the interior states and zero measure
on the boundary states. Restricting both sides to interior states gives the corresponding
measure-space isomorphism modulo null sets with normalized `volume.restrict (interior P) ⊗ dθ`. The honest flow
carrier retains regular boundary states so it is invariant at collision times. Prove the
collision law explicitly: a first hit at `q` in the relative interior of `S` has the boundary
class `[(q,v)] = [(q,σ_S v)]`, and the next segment has position `q + s σ_S v` and direction
`σ_S v` until the next collision. Prove that free flight and this reflection law determine the
regular trajectory uniquely. Extend the regular flow to the whole phase space by fixing `Σ`;
prove the total extension is jointly measurable, satisfies the group law and has
`ϕ t '' Σ = Σ`, with restriction equal to `billiardFlow D`.
Prove time reversal, the regular-set construction and Liouville measure commute with Euclidean
isometries, and that the empty-hole specialization agrees with the simple-polygon construction.

With Layers 1.3 and 3.2, weak mixing of the billiard flow is `WeakMixingVAdd ℝ
(billiardRegularSet D) (liouvilleMeasure D)`, equivalently the absence of nonconstant
eigenfunctions.

**Checks.**

- For the unit square, reflections in the sides change the signs of `Re v` and `Im v`, so
  `[(p, v)] ↦ |Re v|` is a nonconstant invariant function and the flow is not ergodic.
- For the triangle `0, 1, I`, the reflections generate the dihedral group of order 8, which
  permutes `±Re v, ±Im v`, so `[(p, v)] ↦ |Re v| * |Im v|` is a nonconstant invariant function.

*Needs:* §§3.1–3.2, 9.2; Mathlib `MeasurableVAdd₂`, `VAddInvariantMeasure`.

## Completion checks

Every definition comes with measurability, evaluation and extensionality lemmas and its
compatibility with the Mathlib, Tau Ceti or supplier object it extends. In particular:

- Natural extensions are honest invertible systems on measurable history subtypes, with the
  universal property modulo null sets and mixing/entropy compatibility. Joinings, group-relative
  products and relative entropy have their separate hypotheses, and entropy addition retains
  infinite values.
- Monoid factors and filtered mixing specialize to maps, ℤ-actions and real flows, with strict
  examples (the swap, irrational rotations, linear flows). Nonabelian weak mixing uses
  finite-dimensional invariant subspaces; abelian character and spectral-measure criteria agree.
- Følner averages, action entropy, pressure and the variational principles are independent of
  averaging windows under the stated hypotheses, with ℤ and ℤᵈ compatibility checks. Pointwise
  theorems retain their temperedness and information-growth hypotheses.
- Structural flow lemmas cover arbitrary parameter monoids; measurable suspension roofs need
  only positivity almost everywhere and integrability; entropy scaling holds for measurable flows.
- Entropy is computed for Bernoulli, Markov, toral and rotation examples, measure-theoretically and
  topologically, with the cat map giving `log ((3 + √5)/2)` both ways.
- The variational principles hold with `EReal` values, including `⊤` for infinite entropy, and
  agree with the real-valued textbook formulations under finite topological entropy.
- Hölder potentials on transitive subshifts of finite type and their suspension flows have unique
  equilibrium states, with the full-shift, golden-mean and constant-roof examples computed; a
  homeomorphism with finite entropy and no measure of maximal entropy is constructed.
- Flows defined off a null set are realized as conull flows, and correlations and rates of mixing
  are defined for maps and flows.
- The billiard flow of every polygonal domain, including holes, is an honest flow on
  `billiardRegularSet D`, with the group law also at collision times.

Compilation of the suggested signatures checks their types, not the truth of their admitted
theorems or completion of these milestones.

## References

- O. Sarig, [*Lecture Notes on Ergodic Theory*](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf),
  §1.6 (natural extensions), Chapter 4 (entropy, §§4.0, 4.10); E. Glasner, *Ergodic Theory via Joinings*, AMS (2003),
  factors, relative products and relative weak mixing.
- A. S. Kechris and B. D. Miller, *Topics in Orbit Equivalence*, LNM 1852 (2004),
  Lemma 6.7 (Borel marker sequences).
- T. Ward and Q. Zhang, *The Abramov–Rokhlin entropy addition formula for amenable group
  actions*, [Monatsh. Math. 114 (1992), 317–329](https://doi.org/10.1007/BF01299386)
  (relative entropy and addition).
- D. Creutz, [*Ergodic Theory of Group Actions*](https://www.dcreutz.com/publications/Ergodic_Theory_of_Group_Actions.pdf),
  Chapters 10 and 13 (amenable averaging, representations and mixing).
- D. Ornstein and B. Weiss, *Entropy and isomorphism theorems for actions of amenable groups*,
  J. Analyse Math. 48 (1987), 1–141 (finite quasi-tiling and entropy limit arguments).
- E. Lindenstrauss, [*Pointwise theorems for amenable groups*](https://doi.org/10.1007/s002220100162),
  Invent. Math. 146 (2001), 259–295 (tempered pointwise and Shannon–McMillan–Breiman theorems).
- N.-P. Chung, [*Topological pressure and the variational principle for actions of sofic groups*](https://doi.org/10.1017/S0143385712000429),
  Ergodic Theory Dynam. Systems 33 (2013), 1363–1390, §3 (amenable pressure definitions and comparisons);
  J. Moulin Ollagnier, *Ergodic Theory and Statistical Mechanics*, LNM 1115 (1985), Chapter 5
  (amenable variational principle).
- L. M. Abramov, *On the entropy of a flow*, Dokl. Akad. Nauk SSSR 128 (1959), 873–875
  (measurable flow scaling and suspension entropy).
- P. Walters, *An Introduction to Ergodic Theory*, Graduate Texts in Mathematics 79, Springer
  (1982). Chapters 1–2 (Layers 0–1), 3 (Layer 2), 4 (Layer 4), 5–6 (Layer 5.1), 7 (Layers
  5.2–5.3), 8 (Layers 6–8 for entropy), 9 (pressure and equilibrium states).
- I. P. Cornfeld, S. V. Fomin, Ya. G. Sinai, *Ergodic Theory*, Grundlehren 245, Springer (1982):
  Chapters 1, 6 (billiards in polygons) and 11 (special flows).
- T. Downarowicz, *Entropy in Dynamical Systems*, Cambridge University Press (2011): Chapters 1–4,
  6 (variational principle) and 8 (Brin–Katok).
- M. Einsiedler and T. Ward, *Ergodic Theory with a view towards Number Theory*, GTM 259, Springer
  (2011): Chapters 2 (mixing, weak mixing, Wiener's lemma) and 4.
- R. Bowen and D. Ruelle, *The ergodic theory of Axiom A flows*, Invent. Math. 29 (1975): pressure
  of flows and `P_g(F) = P_{g¹}(F₁)`.
- M. Brin and A. Katok, *On local entropy*, Lecture Notes in Math. 1007 (1983).
- R. Bowen, *Some systems with unique equilibrium states*, Math. Systems Theory 8 (1974), 193–202;
  *Equilibrium States and the Ergodic Theory of Anosov Diffeomorphisms*, Lecture Notes in Math. 470,
  Springer (1975), Chapter 1 (§§8.4, 8.6); R. Bowen and P. Walters, *Expansive one-parameter flows*,
  J. Differential Equations 12 (1972), 180–193.
- E. Franco, *Flows with unique equilibrium states*, Amer. J. Math. 99 (1977), 486–514 (§8.5).
- W. Parry and M. Pollicott, *Zeta Functions and the Periodic Orbit Structure of Hyperbolic
  Dynamics*, Astérisque 187–188 (1990), Chapters 1–2 and 6 (transfer operators, suspension flows).
- M. Misiurewicz, *Diffeomorphism without any measure with maximal entropy*, Bull. Acad. Polon. Sci.
  21 (1973), 903–910 (context for the check in §8.2).
- G. W. Mackey, *Point realizations of transformation groups*, Illinois J. Math. 6 (1962), 327–335
  (§3.5).
- S. Tabachnikov, *Geometry and Billiards*, AMS (2005), Chapters 1 and 7; H. Masur and S.
  Tabachnikov, *Rational billiards and flat structures*, Handbook of Dynamical Systems 1A (2002),
  §1.
