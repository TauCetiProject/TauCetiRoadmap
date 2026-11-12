# Roadmap: classical ergodic theory, entropy, the variational principle and flows

**Summary.** This roadmap builds classical ergodic theory for measure-preserving monoid actions,
group actions and real flows, on Mathlib's measure-preserving maps, ergodicity and topological
entropy, Tau Ceti's mean ergodic, Herglotz, Bochner and amenability theorems, and the pointwise
Birkhoff theorem, measure entropy, Shannon–McMillan–Breiman theorem, ergodic decomposition,
real-flow weak mixing and Birkhoff's cone contraction of earlier roadmaps. It develops factors,
natural extensions, joinings and relative weak mixing; the mixing hierarchy and its spectral
characterizations; measurable and continuous flows, suspension flows, flows defined off a null set
and rates of mixing; Kolmogorov–Sinai entropy theory on GeometryOfNumbersAndQuadraticArithmetic's
measure entropy, relative entropy and the entropy of countable amenable actions; topological entropy
and pressure for maps, amenable actions and flows; and equilibrium states and measures of maximal
entropy. The end theorems are: the equivalent forms of weak mixing for maps and for real flows
(ergodicity of the product, absence of eigenfunctions, continuity of spectral measures, Cesàro decay
of correlations); Wiener's lemma and the spectral characterization of mixing; the Kolmogorov–Sinai
generator theorem, entropy preservation by natural extensions, the Abramov–Rokhlin addition formula
and the entropies of Bernoulli, Markov and toral systems; the Brin–Katok local entropy formula and
Abramov's formula for measurable flows; the Følner mean ergodic theorem and the Følner limit of the
entropy of countable amenable actions; the variational principle for pressure for maps, countably
infinite discrete amenable actions and real flows; existence of equilibrium states when the entropy
map is upper semicontinuous; Bowen's uniqueness theorem for expansive maps and flows with
specification, with its consequences for Hölder potentials on subshifts of finite type and their
suspension flows; and the Ruelle–Perron–Frobenius theorem.

[`Suggested.lean`](Suggested.lean) states the headline theorems. Suggested homes:
`TauCeti/Dynamics/Ergodic/` (maps and actions), `TauCeti/Dynamics/Ergodic/Flow/` (measurable flows)
and `TauCeti/Dynamics/Entropy/` (measure entropy, topological entropy and pressure). Extend the
existing modules `TauCeti/Dynamics/Ergodic/MeasurePreserving.lean`, `TauCeti/Probability/Ergodic/`
and `TauCeti/Dynamics/Flow/` rather than restating their content.

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
| Uniqueness of equilibrium states | Expansive homeomorphisms and continuous flows with specification on compact metric spaces, potentials with the Bowen property; subshifts of finite type, Hölder potentials, the Ruelle transfer operator and suspension flows over them; §§8.4–8.6. |
| Almost-everywhere flows | Measure-preserving real flows defined on a conull invariant subset of a standard Borel space, with disjoint unions and transport of densities; §3.5. |

| Material | Owner |
| --- | --- |
| Measure-preserving maps, ergodicity, recurrence, ergodic actions, ergodic measures as extreme points, Birkhoff sums, empirical measures and Krylov–Bogolyubov, topological entropy by covers and nets, topological flows, subshifts, Følner filters | Mathlib |
| Mean ergodic theorem in `L²`, fixed spaces, invariant σ-algebra, Koopman operator on `L⁰`, ergodicity of Bernoulli shifts, Herglotz and Bochner theorems, the cyclic spectral theorem for strongly continuous unitary representations, compact self-adjoint operators, Kullback–Leibler divergence, continuous flows, Markov chain laws, amenability and Følner sets, the cat map | Tau Ceti |
| Pointwise Birkhoff theorem with invariant conditional-expectation limit; strong mixing of a map; finite-label Shannon entropy | ProbabilisticAndMetricNumberTheory §§4.1–4.3, 4.6, 5.1a |
| Birkhoff's contraction theorem for linear maps between convex cones in real vector spaces | ProbabilisticAndMetricNumberTheoryPartII §3.3 |
| Koopman representation of a measure-preserving group action on `Lᵖ`; return times and Kac's lemma for ergodic measurable equivalences; ergodic decomposition of group actions; countable-label and conditional label entropy, itineraries, entropy rates and measure entropy; tempered Følner sequences, the tempered maximal inequality and the tempered pointwise ergodic theorem | GeometryOfNumbersAndQuadraticArithmetic §4.2 |
| Invariance of entropy under almost-everywhere equality of labels and the finite-partition supremum formula; conditional entropy of a finite partition given a σ-algebra and the future formula for the entropy rate; the map Shannon–McMillan–Breiman theorem for finite partitions; the ergodic decomposition of an endomorphism with entropy integration; small-diameter partitions with null boundaries and `h_μ(T) ≤ h_top(T)` with its localized form | ArithmeticDynamics §§2.6–2.7 |
| Weak mixing of measure-preserving `ℝ`-actions as Cesàro decay, strong continuity of their Koopman groups, Wiener's lemma for finite measures on `ℝ`, the continuous-time mean ergodic projection and the eigenfunction criterion; polygonal billiard tables with holes, their phase space, singular set, billiard flow and Liouville measure | MathematicalBilliards §§12.1–12.5, Layers 7–8 |
| Markov kernels, stationarity, path laws and convergence to equilibrium for countable-state chains | MarkovChainsAndRenewal Layers 0–3 |
| Amenability, invariant means and the discrete Følner criterion | AmenableGroups Layer 5 |

These roadmaps' sections are consumed with the names and signatures given there and are not
restated here; [Exact supplier contracts](#exact-supplier-contracts) lists what is used. The
Følner mean ergodic theorem, the amenable Shannon–McMillan–Breiman theorem and the entropy limit
lemmas for actions are targets here.

**Outside this roadmap.** Uniformly hyperbolic smooth dynamics (Anosov and Axiom A
diffeomorphisms and flows, stable manifolds, Markov partitions and their symbolic codings, SRB
measures), smooth ergodic theory (Pesin theory, Ruelle's inequality, Yomdin and Newhouse upper
semicontinuity, Misiurewicz's smooth examples without measures of maximal entropy), and billiards
with curved or spherical scatterers and the `N`-particle hard-sphere flow are not part of this
roadmap; [Downstream consumers](#downstream-consumers) says what they use from it.

## Conventions

**Measures and systems.** Elementary factors, products and invariant-set lemmas use arbitrary
`μ : Measure X`. Probability statements carry `[IsProbabilityMeasure μ]`; state transport under
normalization of finite nonzero measures once, including normalization of correlations and
mean-zero subspaces. A *system* is `T : X → X` with
`MeasurePreserving T μ μ`; iteration is `T^[n]`, `n : ℕ`; `T` need not be invertible. An invertible
system is `T : X ≃ᵐ X` with `MeasurePreserving T μ μ`. Where a consumed interface is stated for
`μ : ProbabilityMeasure X` (ProbabilisticAndMetricNumberTheory's `IsStrongMixing` and Birkhoff
theorems), give the `Measure`-level restatement for `[IsProbabilityMeasure μ]` once, in Layer 1.1,
and use it. Every definition comes with measurability, evaluation and extensionality lemmas and its
compatibility with the Mathlib, Tau Ceti or supplier object it extends.

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
`t`); these are the eigenfunctions of MathematicalBilliards §12.1, with eigenvalue `α`. A
function is *constant* when it is almost everywhere equal to a constant.

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

**Entropy.** Logarithms are natural. Measure entropy is GeometryOfNumbersAndQuadraticArithmetic
§4.2's `measureEntropy μ T : ℝ≥0∞`, so infinite entropy is retained. Definitions in the literature that assume finite topological
entropy and take real values (pressure as a real supremum, equilibrium states and measures of
maximal entropy as real equalities) are recovered by the agreement theorems of §8.1. Topological entropy is Mathlib's
`Dynamics.coverEntropy T Set.univ : EReal`. Topological pressure is `EReal`-valued. Where measure
and topological quantities are compared, the measure entropy is coerced to `EReal` through
`ℝ≥0∞ → EReal`. The action quantities `actionMeasureEntropy`, `actionTopologicalEntropy` and
`actionTopologicalPressure` use the same codomains, with finite-window normalization by `#F`.

**Information and extended limits.** For `p : ℝ≥0∞` with `p ≤ 1`, the information of `p` is
`I(p) = (-ENNReal.log p).toENNReal : ℝ≥0∞`. Thus `I(0) = ⊤` and `I(1) = 0`. In local entropy and
SMB, normalize in `ℝ≥0∞` by positive window cardinalities and take liminf, limsup and scale limits
in `ℝ≥0∞`. Compare their `EReal` coercions with `-ENNReal.log`; do not use a real-valued liminf for
an unbounded information sequence. Conditional information uses conditional probabilities, with
nonnegativity and the almost-everywhere bound by one proved before this conversion. §4.10 proves
the agreement of this convention with the real-valued form `-log μ(ξⁿ(x)) / n` of
ArithmeticDynamics §2.7's Shannon–McMillan–Breiman theorem.

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
orbit). An `(n,ε)`-separated set is Mathlib's `Dynamics.IsDynNetIn T Set.univ U n s`. For a flow
and `t ≥ 0`, `B_t(x,ε) = {y | ∀ s ∈ Set.Icc 0 t, dist (ϕ s x) (ϕ s y) < ε}`.

**Potentials.** A potential is a continuous `φ : X → ℝ` on a compact space (Mathlib's `C(X, ℝ)`).
Hölder hypotheses are written with Mathlib's `HolderWith C r φ`, not a new predicate. A subshift
carries the product uniformity and no metric instance, so there a `d_θ`-Lipschitz potential is
written as the cylinder bound `|φ x - φ y| ≤ C θ ^ n` whenever `x` and `y` agree on the coordinates
`|k| < n` (`k < n` one-sided); an `r`-Hölder potential for `d_θ` is `d_(θ ^ r)`-Lipschitz.

## Exact supplier contracts

Consume these declarations and extend their API rather than restating them.

### From Mathlib

| Foundation | Declarations |
| --- | --- |
| Measure-preserving maps, products and conjugation | `MeasureTheory.MeasurePreserving` (`Mathlib/Dynamics/Ergodic/MeasurePreserving.lean`), `MeasurePreserving.prodMap`, `MeasurePreserving.symm`; `MeasureTheory.map_trim_comap` (the pushforward of a trimmed measure along a measurable map, `Mathlib/MeasureTheory/Measure/Trim.lean`) |
| Ergodicity and recurrence | `PreErgodic`, `Ergodic`, `QuasiErgodic`, `Ergodic.ae_eq_const_of_ae_eq_comp₀`, `ergodic_conjugate_iff` (`Mathlib/Dynamics/Ergodic/Ergodic.lean`, `Function.lean`); `Conservative`, `MeasurePreserving.conservative`, `Conservative.ae_frequently_mem_of_mem_nhds` (Poincaré recurrence, `Conservative.lean`) |
| Ergodic actions | `ErgodicSMul`, `ErgodicVAdd`, `ergodicSMul_iterateMulAct` (`Mathlib/Dynamics/Ergodic/Action/Basic.lean`), `ergodic_mul_left_iff_denseRange_zpow` (`Action/OfMinimal.lean`) |
| Ergodic measures as extreme points | `Ergodic.iff_mem_extremePoints`, `Ergodic.eq_of_absolutelyContinuous` (`Mathlib/Dynamics/Ergodic/Extreme.lean`) |
| Examples on the circle | `ergodic_add_left`, `ergodic_nsmul`, `ergodic_zsmul_add` (`Mathlib/Dynamics/Ergodic/AddCircle.lean`, `AddCircleAdd.lean`) |
| Birkhoff sums and averages | `birkhoffSum`, `birkhoffAverage` (`Mathlib/Dynamics/BirkhoffSum/`) |
| Mean ergodic theorem and Koopman operators | `ContinuousLinearMap.tendsto_birkhoffAverage_orthogonalProjection` (`Mathlib/Analysis/InnerProductSpace/MeanErgodic.lean`), `Lp.compMeasurePreservingₗᵢ`, `Lp.compMeasurePreserving_continuous` |
| Invariant measures of continuous maps | `empiricalMeasure`, `exists_measurePreserving_probabilityMeasure_of_compact_forwardInvariant` (`Mathlib/Dynamics/Ergodic/EmpiricalMeasure.lean`); compactness of `ProbabilityMeasure E` for compact `E` (`Mathlib/MeasureTheory/Measure/Prokhorov.lean`) |
| Topological entropy | `Dynamics.dynEntourage`, `IsDynCoverOf`, `IsDynNetIn`, `coverMincard`, `netMaxcard`, `coverEntropy`, `coverEntropyInf`, `coverEntropy_eq_iSup_netEntropyEntourage`, `coverEntropy_image_of_comap` (`Mathlib/Dynamics/TopologicalEntropy/`) |
| Radon probabilities | Riesz–Markov–Kakutani (`Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/`), weak-* compactness and `ProbabilityMeasure`; §0.6 supplies the compact Hausdorff comparisons |
| Følner families | `IsFoelner`, `IsAddFoelner`, `maxFoelner` (`Mathlib/MeasureTheory/Group/FoelnerFilter.lean`): windows that are eventually measurable of finite nonzero measure, whose left translates `g • F i` differ from `F i` by a proportion tending to zero |
| Topological dynamics | `Flow`, `Flow.fromIter`, `Homeomorph.flow` (`Mathlib/Dynamics/Flow.lean`), `MulAction.IsMinimal`, `MulAction.IsTopologicallyTransitive` |
| Shifts and product measures | `mulShift`, `Subshift`, `cylinder` (`Mathlib/Dynamics/SymbolicDynamics/Basic.lean`), `Measure.infinitePi` |
| Projective limits and disintegration | `IsProjectiveLimit.unique`, `Measure.condKernel`, `Measure.disintegrate`, `eq_condKernel_of_measure_eq_compProd`, `ProbabilityTheory.condExpKernel`; these supply the conditional kernels of §§0.7–0.8 |
| Operators and Fourier analysis | `IsCompactOperator`, `spectrum.gelfand_formula`, `fourier`, `span_fourier_closure_eq_top` (`Mathlib/Analysis/Fourier/AddCircle.lean`), `UnitAddTorus`, `mFourier` (`AddCircleMulti.lean`) |
| Entropy inequalities | `Real.negMulLog`, `Real.concaveOn_negMulLog`, `Subadditive.tendsto_lim` |
| Hölder functions and matrices | `HolderWith`, `MemHolder`, `nnHolderNorm`, `spectralRadius` |

### From Tau Ceti

| Foundation | Declarations |
| --- | --- |
| Measure-preserving maps | `MeasurePreserving.isFiniteMeasure` (`TauCeti/Dynamics/Ergodic/MeasurePreserving.lean`) |
| Ergodic actions | `ErgodicSMul.map`, `ergodicSMul_map_iff` (`TauCeti/Dynamics/Ergodic/Action/Map.lean`) |
| Birkhoff sums | `Function.IsPeriodicPt.birkhoffSum_apply_eq` (`TauCeti/Dynamics/BirkhoffSum/Cyclic.lean`) |
| Mean ergodic theorem and Koopman operators | `fixedSpace`, `metProjection`, `birkhoffAverage_tendsto_metProjection`, `metProjection_eq_condExpL2`, `fixedSpace_eq_lpMeas_invariants`, `koopmanMarkov` (`TauCeti/Probability/Ergodic/`) |
| Amenability | `Amenable`, `HasFoelnerSets`, `Amenable.hasFoelnerSets`, `amenable_iff_hasFoelnerSets`, `hasFoelnerSets_iff_exists_seq`, `IsFoelner.tendsto_card_smul_symmDiff_div_card` and `Mean.tendsto_average_ofIsFoelner` (`TauCeti/GroupTheory/Amenable/`); the last concerns scalar means, not the Hilbert or pointwise ergodic theorems |
| Flows | `Flow` API (`TauCeti/Dynamics/Flow/`) |
| Shifts and Markov chains | `shift` (`TauCeti/Probability/Process/PathLaw/Basic.lean`), `ergodic_shift_infinitePi_const`, `ergodic_shift_of_iIndepFun` (`TauCeti/Probability/Ergodic/BernoulliShift.lean`), `markovChainLaw` (`TauCeti/Probability/Process/MarkovChain.lean`) |
| Projective limits | `TauCeti.Measure.exists_isProjectiveLimit_of_countable` (`TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean`), for the probability laws of §0.7 |
| Positive-definite functions and spectral theorems | `exists_isFiniteMeasure_integral_zpow_eq` and `isPositiveDefiniteSub_iff_exists_isFiniteMeasure_integral_zpow_eq` (Herglotz, `TauCeti/Analysis/Bochner/Herglotz.lean`), `bochner` (`TauCeti/Analysis/Bochner/BochnerTheorem.lean`), `IsPositiveDefiniteSub.existsUnique_innerRegular_pontryaginMeasureTransform_eq_of_continuousAt` (`TauCeti/Analysis/Bochner/LocallyCompactGroup.lean`), `FiniteMeasure.pontryaginMeasureTransform_injOn_innerRegular` (`TauCeti/Analysis/Fourier/Pontryagin/Uniqueness.lean`), `ContRepresentation.exists_pontryaginMeasureTransform_eq_inner` (the cyclic spectral theorem, `TauCeti/Analysis/Fourier/Pontryagin/StronglyContinuous.lean`) |
| Compact self-adjoint operators | `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector` (a Hilbert basis of eigenvectors, `TauCeti/Analysis/InnerProductSpace/Spectrum.lean`), applied in §2.4 |
| Kullback–Leibler divergence | `TauCeti/InformationTheory/KullbackLeibler/` |
| Toral automorphism example | `catMap` (`TauCeti/Dynamics/CatMap.lean`) |
| Positive matrices | `TauCeti.Matrix.hilbertProjectiveDist_mulVec_le` (Birkhoff's contraction for Hilbert's projective metric, `TauCeti/Data/Matrix/BirkhoffContraction.lean`) |

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory — §§4.1–4.3, 4.6, 5.1a

Consume §4.1's `birkhoff_pointwise` and `birkhoff_pointwise_ergodic`, constructed in §§4.2–4.3:
for a measure-preserving `T` of a probability space and an integrable real `f`, the time averages
converge almost everywhere to the conditional expectation of `f` on the invariant σ-algebra, and to
`∫ f dμ` when `T` is ergodic. Consume §4.6's `IsStrongMixing T μ` for `μ : ProbabilityMeasure X`:
`MeasurePreserving T μ μ` and `μ.real (A ∩ T^[n] ⁻¹' B) → μ.real A * μ.real B` for all measurable
`A`, `B`. Consume §5.1a's `labelEntropy` and `condLabelEntropy` of finite labels, with their chain
rule, alphabet bound and additivity for independent labels.

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheoryPartII — §3.3

Consume §3.3's `birkhoff_contraction`: let `C₁ ⊆ V` and `C₂ ⊆ W` be convex cones in real vector
spaces with `Cᵢ ∩ -Cᵢ = {0}`, ordered by `f ≤ g` iff `g - f ∈ Cᵢ`, and `T : V → W` linear with
`T(C₁) ⊆ C₂` and `Δ ≥ 0` such that any two images `T f`, `T g` of nonzero elements of `C₁` satisfy
`a T f ≤ T g ≤ b T f` for some `a > 0` with `log (b / a) ≤ Δ`. If `f ∈ C₁` is nonzero and
`a f ≤ g ≤ b f` with `a > 0`, then `a' T f ≤ T g ≤ b' T f` for some `a' > 0` with
`log (b' / a') ≤ tanh (Δ / 4) * log (b / a)`. §8.6 applies it to the Ruelle operator on a cone of
log-Lipschitz positive functions.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic — §4.2

Consume:

- `scalarLpKoopman p μ hμ : ContRepresentation ℂ G (Lp ℂ p μ)` for a measure-preserving group
  action and `1 ≤ p`, with `(π(g) f)(x) = f(g⁻¹ • x)` almost everywhere, and `scalarLpKoopman_strong`
  (strong continuity for continuous actions on R₁ spaces with locally finite measures that are
  inner regular on finite-measure sets, and finite `p`);
- `positiveReturnTime T A x : ℕ∞` with `measurable_positiveReturnTime`, and
  `kac_return_time_integral` (`∫ x in A, (positiveReturnTime T A x).toNat dμ = 1` for an ergodic
  measurable equivalence and `0 < μ A`);
- `ActionErgodicKernel μ U` with `exists_actionErgodicKernel`, for countable groups acting
  measurably on nonempty standard Borel probability spaces with invariant measure;
- the entropy paragraph's `countablePartitionEntropy`, `conditionalPartitionEntropy`,
  `iteratedPartitionLabel`, `partitionEntropyRate` and `measureEntropy`, with their chain rule,
  relabeling invariance, additivity for independent labels and the subadditive limit: for
  measure-preserving `T` and a label `a` of finite entropy, `partitionEntropyRate μ T a`, defined
  as `inf_(n ≥ 1) H(aⁿ)/n`, is the limit of `H(aⁿ)/n`; `measureEntropy μ T : ℝ≥0∞` is the supremum
  of the rates of measurable `ℕ`-valued labels of finite entropy;
- `TemperedFolnerSequence` (compact windows `A_j` of positive finite Haar measure `η` with
  `η(⋃_(k<j) A_k⁻¹ A_j) ≤ C η(A_j)` and `η((K A_j) ∆ A_j)/η(A_j) → 0` for compact `K ∋ 1`),
  `tempered_action_maximal_inequality` and `tempered_action_pointwise` (almost-everywhere
  convergence of the window averages of an integrable function to its conditional expectation on
  the invariant σ-algebra). For a countable discrete group, Haar measure is counting measure and
  compact windows are finite sets.

### From TauCetiRoadmap.ArithmeticDynamics — §§2.6–2.7

For a measure-preserving endomorphism `T` of a probability space with arbitrary measurable
structure, consume: §2.6's invariance of entropy under almost-everywhere equality of labels and the
formula `h_μ(T) = sup_P h_μ(T, P)` over finite partitions, retaining `⊤`; §2.7's conditional entropy
`H_μ(P | ℰ)` of a finite partition given a sub-σ-algebra, with independence of representatives,
`0 ≤ H_μ(P | ℰ) ≤ H_μ(P)`, antitonicity in `ℰ`, the conditional chain rule and the future formula
`h_μ(T, P) = H_μ(P | ⋁_(j ≥ 1) T⁻ʲ σ(P))`; §2.7's Shannon–McMillan–Breiman theorem for finite
partitions (`-log μ(Pⁿ(x))/n` converges almost everywhere to an invariant integrable `g_P` with
`∫ g_P dμ = h_μ(T, P)`, constant for ergodic `μ`); §2.7's finite Borel partitions of a compact
metric space with small atom diameters and `μ`-null boundaries, the inequality
`(h_μ(T) : EReal) ≤ coverEntropy T univ` for continuous `T` on a nonempty compact metric space, and
for ergodic `μ` the bound by `coverEntropyInf T Y` for every Borel `Y` with `μ Y > 0`; and §2.7's
ergodic decomposition `x ↦ μ_x` of an endomorphism of a nonempty standard Borel space, with
almost-everywhere uniqueness, `g_P(x) = h_(μ_x)(T, P)` and `h_μ(T) = ∫⁻ h_(μ_x)(T) dμ(x)`.

### From TauCetiRoadmap.MathematicalBilliards — §§12.1–12.5, Layers 7–8

For a jointly measurable measure-preserving action of `ℝ` on a probability space, consume §12.1's
weak mixing (`(1/T) ∫_0^T |μ((t +ᵥ ·) ⁻¹' A ∩ B) - μ A μ B| dt → 0` for all measurable `A`, `B`)
and eigenfunctions (`f ∘ (t +ᵥ ·) = exp(2π i a t) f` almost everywhere for every `t`, the frequency
convention of this roadmap), with ergodicity of the product of a weakly mixing action and an
ergodic one; §12.2's ergodicity of weakly mixing actions; §12.3's strong continuity of the Koopman
group; §12.4's Wiener lemma for finite measures on `ℝ`; §12.4.1's continuous-time mean ergodic
projection; and §12.5's eigenfunction criterion: weak mixing holds iff every eigenfunction is
almost everywhere constant. Layers 7–8's polygonal billiard flow is cited in §3.5 as a conull
flow.

### From TauCetiRoadmap.MarkovChainsAndRenewal — Layers 0–3

Countable-state Markov kernels, stationarity and path laws (Layer 0) and convergence to
equilibrium (Layer 3), for the Markov shifts of §§0.3 and 1.4.

### From TauCetiRoadmap.AmenableGroups — Layer 5

The Følner criterion for arbitrary discrete groups (Layer 5), whose Tau Ceti forms are listed
above; §§2.5, 4.6 and 5.6 use it.

## How to read the build

| Layer | Content | Prerequisites |
| --- | --- | --- |
| 0 | Monoid factors, finite observations, Radon probabilities, Koopman, natural extensions, joinings, induced maps and towers | Mathlib; Tau Ceti; GeometryOfNumbersAndQuadraticArithmetic §4.2 (Koopman, return times); MarkovChainsAndRenewal Layer 0 |
| 1 | Mixing for filtered monoid actions; natural extensions and relative weak mixing for groups | Layer 0; ProbabilisticAndMetricNumberTheory §4.6; MarkovChainsAndRenewal Layer 3 |
| 2 | Group representations, abelian spectral measures and Følner mean ergodic theorem | Layers 0–1; Herglotz, Bochner; AmenableGroups; MathematicalBilliards §§12.4–12.5 |
| 3 | Measurable and continuous flows: time-`t` maps, weak mixing, suspension flows, invariant measures, almost-everywhere flows, rates of mixing | Layers 0–2; MathematicalBilliards §§8.2–8.3, 12.1–12.5 |
| 4 | Kolmogorov–Sinai entropy theory, amenable entropy, relative entropy and addition, generators and natural extensions; amenable Shannon–McMillan–Breiman theorem, ergodic decomposition of action entropy | Layers 0–1; §2.5 for §4.7; ProbabilisticAndMetricNumberTheory §§4.1–4.3, 5.1a; GeometryOfNumbersAndQuadraticArithmetic §4.2; ArithmeticDynamics §§2.6–2.7; AmenableGroups |
| 5 | Topological entropy and pressure for maps, amenable actions and flows | Layer 0; §4.6 limit lemma for §5.6; Mathlib topological entropy |
| 6 | Measure entropy of continuous maps: small partitions, expansiveness, upper semicontinuity, Brin–Katok, Abramov's formula for flows | Layers 3–5; GeometryOfNumbersAndQuadraticArithmetic §4.2; ArithmeticDynamics §2.7 |
| 7 | Variational principles for maps, amenable actions and flows | Layers 3–6; GeometryOfNumbersAndQuadraticArithmetic §4.2; ArithmeticDynamics §2.7 |
| 8 | Equilibrium states and measures of maximal entropy; agreement with finite-entropy formulations; uniqueness under specification, subshifts of finite type, suspension flows and the Ruelle–Perron–Frobenius theorem | Layers 0, 3–7; ArithmeticDynamics §2.7; ProbabilisticAndMetricNumberTheoryPartII §3.3 |

Layer 0 builds the systems and their examples, Layer 1 the mixing hierarchy and Layer 2 its
spectral form; Layer 3 transfers these to measurable and continuous flows. Layer 4 develops
measure entropy on the suppliers' entropy, Layer 5 topological entropy and pressure, Layer 6
compares the two for continuous maps, Layer 7 proves the variational principles and Layer 8
studies the measures attaining them. The map-entropy sections §§4.0–4.5 and map-pressure sections
§§5.1–5.5 are independent; the amenable branches use the dependencies shown in the table.

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
action, consume GeometryOfNumbersAndQuadraticArithmetic §4.2's
`scalarLpKoopman p μ hμ : ContRepresentation ℂ G (Lp ℂ p μ)`.

Prove that if `G` is a second-countable locally compact group with a Haar measure, the action is
jointly measurable (`MeasurableVAdd₂ G X`), `μ` is a finite invariant measure and `1 ≤ p < ∞`,
then `g ↦ scalarLpKoopman p μ hμ g f` is continuous for every `f` (Creutz, Theorem 11.22, p. 107,
for `p = 2` on a standard Borel probability space, where the measure need only be quasi-invariant).
GeometryOfNumbersAndQuadraticArithmetic §4.2's `scalarLpKoopman_strong` covers continuous actions
on R₁ spaces, and MathematicalBilliards §12.3 covers `G = ℝ` with `p = 2` and a probability
measure; this target needs no topology on `X` and allows every such `G` and `p`. Route: for `f` bounded measurable, Fubini makes
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
- For the transpositions `σ = (0 1)` and `τ = (1 2)` of `Fin 3` with uniform measure and
  `f = 1_{0}`, `C_(στ) f = 1_{2} = C_τ (C_σ f)`, while `C_σ (C_τ f) = 1_{1}`: the pullbacks compose
  in the reverse order, as `C_(mn) = C_n ∘ C_m` states.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §4.2 (`scalarLpKoopman`); Mathlib Haar measure,
`Lp`, Fubini.

### 0.3 Standard examples

Build each example with its measure-preservation proof and the ergodic and mixing statements listed
in Layer 1.4.

1. **Rotations.** Translations on `AddCircle T`, on `UnitAddTorus (Fin d)` and on a compact
   abelian group with Haar probability (Mathlib's rotations, `ergodic_add_left`,
   `ergodic_mul_left_iff_denseRange_zpow`).
2. **Bernoulli shifts.** One-sided: Tau Ceti `shift α` on `ℕ → α` with `Measure.infinitePi
   (fun _ => p)`. Two-sided: the left shift on `ℤ → α` with the same product, as an invertible
   system. Define `bernoulliShift p` and `bernoulliShiftTwoSided p` for `p : Measure α` with
   `[IsProbabilityMeasure p]` and any measurable `α` (the one-sided Bernoulli measure of a finite
   alphabet: Sarig2023, Definition 1.6, p. 10). For every countable discrete group `G`,
   construct the Bernoulli action on `G → α` with product probability and
   `(g • x) h = x (g⁻¹ * h)`. Prove preservation by permutation of coordinates, identify its
   finite-coordinate cylinders, and give the ℤ and ℤᵈ specializations. Use Mathlib's shift
   vocabulary, with an explicit inverse/opposite-action conversion when its convention differs.
3. **Markov shifts.** For a Markov kernel `κ` on a countable `S` with an invariant probability
   `π` (`ProbabilityTheory.Kernel.Invariant κ π`), the stationary chain law
   `markovChainLaw π κ` on `ℕ → S` is shift invariant (Sarig2023, Proposition 1.8, p. 12, for
   finite `S`). Define `markovShift κ π` and its two-sided extension on `ℤ → S` by Tau Ceti's
   countable projective-limit theorem applied to the stationary finite-dimensional laws. Identify
   these concrete examples with natural extensions in §0.7.
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

Consume GeometryOfNumbersAndQuadraticArithmetic §4.2's `positiveReturnTime T A x : ℕ∞` and
`kac_return_time_integral`. Define the
first-return (induced) map `inducedMap T A` on `A`, equal to `T^[positiveReturnTime T A x] x` where
the return time is finite and to `x` elsewhere. For a system `T` and measurable `A` with
`μ A > 0`, prove that `inducedMap T A` preserves the normalized restriction
`(μ A)⁻¹ • μ.restrict A` (`measurePreserving_inducedMap`; no invertibility is needed: use
Mathlib's recurrence `Conservative.ae_mem_imp_frequently_image_mem` for finiteness of returns), and that it is ergodic
when `T` is ergodic (Sarig2023, Theorem 1.7, p. 28). Prove Kac's formula in the noninvertible form:
for ergodic `T`, `∫⁻ x in A, (positiveReturnTime T A x : ℝ≥0∞) ∂μ = 1`
(`kac_return_time_integral` is the case of a measurable equivalence).

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
the invariant null set of periodic points to obtain a complete section `A` with `μ A < ε/n`
(`exists_small_completeSection`).
Recurrence for `T` and `T⁻¹` gives finite hitting times on a conull saturation; cut its Kakutani
tower into blocks of height `n`. Prove that the uncovered levels have total measure at most
`n * μ A < ε`, including columns shorter than `n`. This proof uses no ergodicity assumption.

**Checks.**

- For the identity map, every point returns at time 1 and the induced map is the identity on `A`.
- For the rotation by `1/3` on `UnitAddCircle` and `A = [0, 1/3)`, the return time is 3 on `A` and
  the induced map is the identity. The rotation is periodic, so the aperiodicity hypothesis of the
  Rokhlin lemma fails: in a tower of height 4, `B` and `T^3 B = B` are disjoint, so `B` is empty.
- Over the swap `S` of two equiprobable points with height `h ≡ 2`, the Kakutani tower is a cyclic
  permutation of its four points with uniform measure, and its induced map on the base is `S`; a
  tower whose top level returned to the same base point would give two 2-cycles and the identity
  on the base.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §4.2 (return times, Kac); Mathlib `Conservative`,
`StandardBorelSpace`.

### 0.5 Finite orbit observations

For a monoid action, `F : Finset M` and a label `ξ : X → A`, define the orbit label
`orbitLabel F ξ`, `x ↦ (fun g : F => ξ (g • x))`, indexed by the subtype `F`, and its generated
σ-algebra. Define finite-window sums `∑ g ∈ F, f (g • x)` and dynamical entourages
`orbitEntourage F U = {(x, y) | ∀ g ∈ F, (g • x, g • y) ∈ U}` using Mathlib's relation vocabulary.
Prove measurability, reindexing, finite-union and restriction laws, and compatibility with
factors and products. For group actions prove the right-translation laws and the corresponding
entropy invariance for invariant probabilities. For `IterateMulAct T` and `F = range n`, identify
them with `iteratedPartitionLabel`, `birkhoffSum` and `Dynamics.dynEntourage`.

For continuous actions on a uniform space define finite-window separated and spanning sets by
these entourages, with monotonicity and factor transport; identify the map versions with
`IsDynNetIn` and `IsDynCoverOf`. These finite-window constructions require no amenability.

**Checks.**

- The empty window gives the label into a one-point type, of entropy 0, and the universal
  entourage; a window that always contained the identity would give `ξ` itself instead.
- A singleton window `{g}` gives the label `ξ ∘ (g • ·)` and the entourage
  `{(x, y) | (g • x, g • y) ∈ U}`.
- For `IterateMulAct T` and `F = range 2`, the orbit label of the fair coordinate label of the
  one-sided fair shift has four equiprobable values and entropy `2 log 2`; rectangles in ℤ² give
  the rectangular orbit labels.

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

**Checks.**

- The Radon probabilities of a two-point discrete space are the segment `t δ₀ + (1 - t) δ₁`,
  `t ∈ [0, 1]`.
- The Dirac embedding `x ↦ δ_x` is continuous, and `f_* δ_x = δ_(f x)` for continuous `f`.
- For the identity map of two points every probability is invariant, while for the swap only
  `(δ₀ + δ₁)/2` is; in both cases the invariant probabilities form a closed convex subset of the
  segment.

*Needs:* Mathlib Riesz–Markov–Kakutani, weak-* compactness, `ProbabilityMeasure`.

### 0.7 Natural extensions of endomorphisms

For a probability-preserving measurable `T : X → X` on a standard Borel space define
`NaturalExtensionSpace T := {x : ℕ → X | ∀ k, T (x (k+1)) = x k}` with its subtype σ-algebra.
Prove this compatible-history set is measurable and standard Borel. Define the forward map
`naturalExtensionForward`, `(x₀, x₁, ...) ↦ (T x₀, x₀, x₁, ...)`, and its inverse
`naturalExtensionBackward`, which drops the first coordinate, as an honest `MeasurableEquiv`
`naturalExtensionEquiv` of the subtype. Define the projection `naturalExtensionProjection`,
`p₀ x = x₀`.

Construct the history law from finite-dimensional laws
`μ.map (fun y => (fun k : Fin (n+1) => T^[n-k] y))`, using
`TauCeti.Measure.exists_isProjectiveLimit_of_countable` and `IsProjectiveLimit.unique`
(Sarig2023, Definition 1.17 and Lemma 1.2, p. 24, for surjective `T` on a Lebesgue space).
Prove consistency, concentration on compatible histories, invariance of the subtype law and
`MeasurePreserving p₀ μ̃ μ`, and that the history law is the only invariant probability projecting
to `μ` (`existsUnique_naturalExtensionMeasure`). Thus `p₀` is an exact factor map and every
coordinate has law `μ`.

Prove the universal property modulo null sets: for any invertible probability system `(Z,R,ρ)`
and factor `π : Z → X`, the map with coordinates `π (R^(-k) z)` defines a factor to the history
system after redefining it on an invariant null set; it is unique almost everywhere among
intertwiners projecting to `π` (Sarig2023, Theorem 1.6, p. 26). Prove minimality: the σ-algebras of `p₀ ∘ T̃^(-k)` generate the
history σ-algebra. Prove uniqueness of the natural extension up to isomorphism mod null sets,
and compatibility with products, giving `(T × S)̃ ≅ T̃ × S̃`.

**Checks.**

- If `T` is invertible, `x ↦ (T^(-k) x)_k` is a measurable conjugacy with its history system,
  preserving the law.
- For standard Borel alphabets, give explicit everywhere-defined measurable equivalences between
  the histories of the concrete one-sided Bernoulli and stationary Markov shifts of §0.3 and their
  concrete two-sided shifts. The equivalences preserve their laws.
- For the doubling map on `UnitAddCircle`, the histories `(0, 0, 0, …)` and `(0, 1/2, 1/4, …)` are
  distinct and both project to `0`, so `naturalExtensionProjection` is not injective while
  `naturalExtensionEquiv` is invertible. On all sequences `ℕ → X`, without the condition
  `T (x (k+1)) = x k`, the forward map would be injective but not surjective.

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
`μ = ∫ μ_z dρ` and `ν = ∫ ν_z dρ` using `Measure.condKernel` of the graph laws
(`factorDisintegration`). Prove that the
kernels are concentrated on their fibres almost everywhere, are unique up to `ρ`-null sets,
and satisfy `∀ g, ∀ᵐ z, (g • ·)_* μ_z = μ_(g • z)` and the corresponding identity for `ν_z`.
The group inverse and uniqueness of disintegration supply this equivariance.

Define the relatively independent product as `∫ (μ_z.prod ν_z) dρ`
(`relativeIndependentJoining`), initially a measure on `X × Y`. Prove its marginals, concentration
on `π x = q y`, invariance (`relativeSelfJoining_measurePreserving` for the self-product),
independence of kernel
versions and the conditional-integral identity for bounded product observables. Transport it to
the measurable fibre-product subtype. Prove functoriality under isomorphisms over the base and
associativity of relative products. The relative self-product `relativeSelfJoining π μ` uses
`π = q`.

**Checks.**

- Over a one-point factor the relative product is the ordinary product.
- Over an identity factor the relative product is the diagonal measure.
- For the endomorphism factor `π = σ` of a one-sided fair-coin shift, the fibrewise product is
  carried by `(σ × σ)` to the diagonal measure and is not invariant; prove this check to
  distinguish ordinary monoid joinings from the group-relative construction.

*Needs:* §§0.1, 0.6; Mathlib conditional kernels and their uniqueness, kernel products, measurable
diagonals and integration; Tau Ceti disintegration API where it extends Mathlib.

### Examples

Rotations of compact abelian groups, one- and two-sided Bernoulli shifts and Bernoulli actions of
countable groups, stationary Markov shifts, toral endomorphisms and the cat map, linear flows on
tori, induced maps and Kakutani towers over these, and the natural extensions of the one-sided
shifts.

### Dependencies

Mathlib measure-preserving maps, conditional kernels and Riesz–Markov–Kakutani; Tau Ceti countable
projective limits, shifts and Markov chain laws; GeometryOfNumbersAndQuadraticArithmetic §4.2
(Koopman representation, return times); MarkovChainsAndRenewal Layer 0.

## Layer 1: The mixing hierarchy

### 1.0 Filtered mixing foundations

Define `MixingAlong M X μ l` for a measure-preserving monoid action and `l : Filter M` by
`∀ A B` measurable, `Tendsto (fun m => μ.real (A ∩ (m • ·) ⁻¹' B)) l
(𝓝 (μ.real A * μ.real B))`. Keep measure preservation as an explicit ambient hypothesis.
The definition accepts any filter; theorems deducing ergodicity assume `l.NeBot`.
Define `WeakMixingSMul M X μ` by ergodicity of the diagonal action on `X × X`, with additive
version `WeakMixingVAdd`. Prove factor inheritance, conjugacy invariance, the rectangle-to-product
mixing theorem, and the tests on generating π-systems and `L²` correlations. For a nontrivial
filter, filtered mixing implies diagonal weak mixing (`MixingAlong.weakMixingSMul`); weak mixing
implies ergodicity.
Prove reparameterization along `a : N → M` using `Filter.map a l`, and monotonicity under
refinement of the filter. Specialize to `IterateMulAct T` along `atTop` to recover §1.1.

**Checks.**

- The filter for a discrete infinite group is `cofinite`; the map case uses `atTop`.
- Mixing along `⊥` is vacuous, so the ergodicity implication carries `NeBot`.
- Along `pure m₀`, mixing with `A = (m₀ • ·) ⁻¹' B` gives
  `μ ((m₀ • ·) ⁻¹' B) = μ ((m₀ • ·) ⁻¹' B) * μ B`, and invariance turns this into `μ B = μ B ^ 2`,
  so `μ B ∈ {0, 1}` for every measurable `B`: such a measure is weakly mixing, as the implication
  from mixing along a nontrivial filter requires.

*Needs:* §§0.1–0.2; Mathlib measure-preserving products, π-systems and `Lp`.

### 1.1 Mixing and weak mixing of a map

Consume ProbabilisticAndMetricNumberTheory §4.6's `IsStrongMixing T μ` (for
`μ : ProbabilityMeasure X`, as specified there) and prove its restatement for `μ : Measure X` with
`[IsProbabilityMeasure μ]`: `MeasurePreserving T μ μ` and, for all measurable `A`, `B`,
`Tendsto (fun n => μ.real (A ∩ T^[n] ⁻¹' B)) atTop (𝓝 (μ.real A * μ.real B))`. Prove that it
suffices to check `A`, `B` in a π-system generating the σ-algebra, and that it is equivalent to
`∫ f * (g ∘ T^[n]) dμ → ∫ f dμ * ∫ g dμ` for all `f, g ∈ L²`.

Define `WeakMixing T μ`, a structure extending `MeasurePreserving T μ μ` with
`ergodic_prodMap : Ergodic (Prod.map T T) (μ.prod μ)`. Prove the equivalences (Sarig2023,
Theorem 3.2, p. 91, proves 1 ⇔ 2 ⇔ 4 on a Lebesgue space, with weak mixing defined by the absence
of nonconstant eigenfunctions):

1. `WeakMixing T μ`;
2. for all measurable `A`, `B`, the Cesàro means
   `(1/N) ∑_{n<N} |μ.real (A ∩ T^[n] ⁻¹' B) - μ.real A * μ.real B|` tend to `0`
   (`weakMixing_iff_tendsto_cesaro`);
3. the same with `|…|²`;
4. for all measurable `A`, `B` there is a set `J ⊆ ℕ` of natural density one with
   `μ.real (A ∩ T^[n] ⁻¹' B) → μ.real A * μ.real B` as `n → ∞` along `J` (density defined by
   `#(J ∩ range N)/N → 1`);
5. `Ergodic (Prod.map T S) (μ.prod ν)` for every ergodic system `S` on every probability space
   `(Y, ν)` (`WeakMixing.ergodic_prodMap_of_ergodic` for 1 ⇒ 5).

Prove that weak mixing implies ergodicity, that strong mixing implies weak mixing, and that `T^[k]`
is weakly mixing for every `k ≥ 1` when `T` is. Route for 1 ⇒ 2: for `f ∈ L²` with mean zero,
`|⟪U^n f, g⟫|² = ⟪U_{T×T}^n (f ⊗ f̄), g ⊗ ḡ⟫`, and the mean ergodic theorem for `T × T` (Tau Ceti
`birkhoffAverage_tendsto_metProjection`) gives Cesàro convergence to `|∫f|²|∫g|² = 0`; then
Cauchy–Schwarz. Route for 2 ⇒ 5: test on rectangles `A × C`, `B × D`. The equivalence with
spectral conditions is Layer 2.3.

**Checks.**

- The swap on two equiprobable points is ergodic but not weakly mixing (take `A = B = {0}`).
- The identity on two equiprobable points has correlation `1/2` for `A = B = {0}` at every `n`,
  which converges along every `J` but to `1/2 ≠ 1/4 = μ A * μ B`, so it fails item 4, as it fails
  item 1; convergence along `J` without the limit `μ A * μ B` would not exclude it.
- An irrational rotation of `UnitAddCircle` is ergodic and not weakly mixing: the product system
  preserves `{(x, y) | x - y ∈ [0, 1/2)}`, of measure `1/2`.
- Identity on a one-point space is strongly mixing.

*Needs:* ProbabilisticAndMetricNumberTheory §4.6 (`IsStrongMixing`); Mathlib `Ergodic`,
`MeasurePreserving.prodMap`; Tau Ceti mean ergodic theorem.

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

**Checks.**

- For the one-sided `(1/2,1/2)` shift and `A_i = {x | x 0 = 0}`, the correlation equals
  `2^(-(k+1))` as soon as all gaps are positive.
- The identity on two equiprobable points is not mixing of order 1 (`μ (A ∩ A) = 1/2 ≠ 1/4` for a
  point `A`), hence of no order, since order `k + 1` implies order `k`.
- Ledrappier's `ℤ²`-action, the shift on `{x : ℤ² → ZMod 2 | x (a, b) + x (a + 1, b) + x (a, b + 1) = 0}`
  with Haar measure, satisfies `x (0, 0) + x (2ⁿ, 0) + x (0, 2ⁿ) = 0`, so the sets where these three
  coordinates vanish meet in measure `1/4`, not `1/8`, for displacements escaping every compact
  set: the action is not mixing for three sets, so the orders are distinct conditions for group
  actions.

*Needs:* §§0.3, 0.5, 1.0–1.1.

### 1.3 Mixing for group actions

For an action of a topological group `G` as in the conventions, define the classes
`MixingVAdd G X μ`: for measurable `A`, `B`,
`Tendsto (fun g => μ.real (A ∩ (g +ᵥ ·) ⁻¹' B)) (cocompact G) (𝓝 (μ.real A * μ.real B))`
(Creutz, Definition 13.9 and the remark after it, p. 118, for locally compact second countable
`G`); and the already defined `WeakMixingVAdd G X μ`. Identify `MixingVAdd` with `MixingAlong`
along `cocompact G`; give multiplicative versions by `to_additive`. Prove: mixing implies weak mixing for
noncompact `G`; weak mixing implies ergodicity; for compact `G` (where `cocompact G = ⊥`) every
action is mixing, so statements needing a genuine limit assume `G` noncompact. For `G = ℤ` or
`G = ℝ`, `cocompact` is the union of the two ends and, by invariance of the measure, `MixingVAdd`
is equivalent to the same limit along `atTop`.

For `T : X ≃ᵐ X` define the action `MeasurableEquiv.zAddAction T` of `ℤ` by `n +ᵥ x = (T^n) x`
(powers in `Equiv.Perm X`), with `MeasurableVAdd₂`. Prove that `T` is strongly mixing iff this
action is `MixingVAdd`, and weakly mixing iff it is `WeakMixingVAdd`; for noninvertible `T` relate
`WeakMixing` to Mathlib's `IterateMulAct` formulation as `ergodicSMul_iterateMulAct` does for
ergodicity.

**Checks.**

- The trivial action of `ℤ` on a two-point space is ergodic only if the measure is a Dirac mass.
- An action of a finite group is mixing by the definition (the limit is along `⊥`); the regular
  action of `ZMod 2` on itself is ergodic but not weakly mixing.
- For the swap `T` of two equiprobable points, `MeasurableEquiv.zAddAction T` has
  `μ.real ({0} ∩ (n +ᵥ ·) ⁻¹' {0})` equal to `1/2` for even `n` and `0` for odd `n`, with no limit
  along `cocompact ℤ`, so the action is ergodic and not `MixingVAdd`, as the swap is not strongly
  mixing.

*Needs:* §1.1; Mathlib `ErgodicVAdd`, `Filter.cocompact`.

### 1.4 The examples

Prove:

1. a rotation of a compact abelian group with Haar probability is never weakly mixing unless the
   group is trivial (a nontrivial character is an eigenfunction), and is ergodic iff the powers of
   the rotation are dense (Mathlib);
2. Bernoulli shifts are strongly mixing, hence weakly mixing and ergodic (extending Tau Ceti's
   `ergodic_shift_infinitePi_const`; Sarig2023, Proposition 1.7, p. 11); Bernoulli actions of
   every infinite countable discrete group are mixing along `cofinite` and mixing of every order;
3. a stationary Markov shift on a finite `S` with invariant `π` of full support is ergodic iff
   `κ` is irreducible, and strongly mixing iff `κ` is irreducible and aperiodic (Sarig2023,
   Corollary 1.1, p. 14; consume MarkovChainsAndRenewal Layer 3 convergence to equilibrium for the
   mixing direction);
4. `toralEndomorphism A` is ergodic iff no eigenvalue of `A` is a root of unity, and is then
   strongly mixing (Fourier series on `UnitAddTorus`, Mathlib `mFourier`: ergodicity iff no
   nonzero integer vector has a finite orbit under the transpose, and mixing because a
   nonzero vector has infinite orbit, so the Fourier coefficients eventually separate);
5. the cat map is strongly mixing.

**Checks.**

- `toralEndomorphism !![0,1;1,0]` (the swap of coordinates) has eigenvalues `±1` and is not
  ergodic: `exp(2πi(x₁ + x₂))` is a nonconstant invariant function.

*Needs:* §§0.3, 1.1–1.3; MarkovChainsAndRenewal Layer 3; Mathlib Fourier analysis on tori.

### 1.5 Natural extensions and relative weak mixing

For §0.7's natural extension, prove that ergodicity, strong mixing, weak mixing and mixing of
each finite order hold exactly when they hold for the original endomorphism (Sarig2023,
Theorem 1.6, p. 26, for ergodicity and mixing). Use cylinder
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

**Checks.**

- The identity extension is relatively weakly mixing over every base, including a nonergodic one.
- A product over an identity two-point base with a nontrivial Bernoulli ℤ-action in the fibre is
  relatively weakly mixing, but its relative self-product is not absolutely ergodic.
- The `ℤ`-action of the swap of two equiprobable points over a one-point base is relatively
  ergodic, being ergodic, and not relatively weakly mixing: over a one-point base relative weak
  mixing is weak mixing, and the diagonal `{(0, 0), (1, 1)}` is invariant of measure `1/2`.

*Needs:* §§0.7–0.8, 1.0–1.4. Prove the conditional integral and invariant-function tests used above
from §0.8's disintegration identity.

### Examples

The swap and the identity on two points, irrational rotations, Bernoulli and Markov shifts, toral
endomorphisms, Ledrappier's `ℤ²`-action, natural extensions of one-sided shifts and product
extensions over nonergodic bases.

### Dependencies

Layer 0; ProbabilisticAndMetricNumberTheory §4.6; Tau Ceti mean ergodic theorem;
MarkovChainsAndRenewal Layer 3.

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
lemmas. Prove uniqueness, total mass, polarization, covariance and compatibility with intertwining
isometries. Specialize to `G = ℤ`, identifying its dual with `Circle`, and to `G = ℝ`, identifying
its dual with `ℝ` by `ξ ↦ (t ↦ exp(2π i t ξ))`; the latter is `spectralMeasureReal U f`.
For a measurable flow with Koopman representation `U_t f = f ∘ ((-t) +ᵥ ·)`, MathematicalBilliards
§§12.4.1 and 12.5 characterize the spectral measure of `f` by
`⟪f, f ∘ (t +ᵥ ·)⟫ = ∫ exp (i t ξ) dσ(ξ)`; prove that it is the image of `spectralMeasureReal U f`
under `ξ ↦ -2π ξ`, so that an atom at `ξ` here is an atom of the same mass at `-2π ξ` there.
Prove that the ℤ specialization agrees with the isometry construction when `U` is unitary,
and prove the inverse-character conversion to the Koopman eigenfunction convention.

For a system `T`, write `σ_f` for the spectral measure of the Koopman isometry on `Lp ℂ 2 μ`.

**Checks.**

- For a constant function `c`, `σ_c = |c|² δ_1`.
- For the rotation `x ↦ x + a` on `UnitAddCircle` and `f = fourier n`, `σ_f = δ_{exp(2π i n a)}`.
- For the one-sided Bernoulli shift and `f(x) = (-1)^{x 0}` with fair coin, `σ_f` is normalized
  Haar measure on the circle (the correlations vanish for `n ≠ 0`).
- For the unit-speed flow `t +ᵥ x = x + t` on `UnitAddCircle` and `e₁ = fourier 1`,
  `U_t e₁ = exp (-2π i t) e₁`, so `spectralMeasureReal U e₁ = δ_(-1)`; its image under
  `ξ ↦ -2π ξ` is `δ_(2π)`, the spectral measure MathematicalBilliards §12.5 gives `e₁`.

*Needs:* Tau Ceti Herglotz, cyclic strongly continuous spectral theorem and uniqueness of
inner regular Pontryagin transforms; Mathlib inner product spaces; MathematicalBilliards §§12.4.1
and 12.5 (the spectral measure of the comparison on `ℝ`).

### 2.2 Wiener's lemma and atoms

Prove **Wiener's lemma** (`tendsto_cesaro_norm_moment_sq`): for a finite measure `σ` on `Circle`,
`(1/N) ∑_{n<N} |σ̂(n)|² → ∑_{z} σ({z})²`, where `σ̂(n) = ∫ z^n dσ` and the sum is over the
(countably many) atoms; and for a finite complex measure the same with `|σ({z})|²`. Also
`(1/N) ∑_{n<N} conj λ^n σ̂(n) → σ({λ})`.

Prove that for an isometry `U`, `σ_f({λ}) = ‖P_λ f‖²` where `P_λ` is the orthogonal projection onto
the eigenspace `ker (U - λ)`, using the mean ergodic theorem for the contraction `λ⁻¹ U`
(Mathlib `ContinuousLinearMap.tendsto_birkhoffAverage_orthogonalProjection`). Hence `σ_f` has no
atoms iff `f` is orthogonal to every eigenvector.

**Checks.**

- For `σ = δ_1 + δ_{-1}`, `σ̂(n) = 1 + (-1)^n` and the Cesàro mean of `|σ̂|²` is `2`, matching
  `1² + 1²`.

*Needs:* §2.1; Mathlib Fourier analysis on the circle.

### 2.3 Weak mixing, mixing and the spectrum

For a system `T`, let `L²₀` be the closed subspace of mean-zero functions. Prove:

1. `WeakMixing T μ` iff the Koopman operator has no eigenfunction other than constants (with
   eigenvalue 1) (`weakMixing_iff_hasEigenvector_ae_const`) iff `σ_f` is atomless for every
   `f ∈ L²₀` (`weakMixing_iff_exists_atomless_spectralMeasure`; Sarig2023, Theorem 3.2, p. 91, on a
   Lebesgue space; Proposition 3.3, p. 93, for the atomless spectral measures of an invertible
   system);
2. `IsStrongMixing T μ` iff `σ̂_f(n) → 0` for every `f ∈ L²₀` (the spectral measures of mean-zero
   functions are Rajchman measures; `mixing_iff_exists_rajchman_spectralMeasure`);
3. for ergodic `T`, every eigenvalue is simple, every eigenfunction has constant modulus, and the
   eigenvalues form a subgroup of `Circle`;
4. the decomposition `L² = H_pp ⊕ H_c` into the closed span of eigenfunctions and its orthogonal
   complement, both Koopman-invariant, with `f ∈ H_c` iff `σ_f` is atomless.

Define `HasDiscreteSpectrum T μ`: the eigenfunctions span a dense subspace of `Lp ℂ 2 μ`. Prove that
ergodic rotations of compact abelian groups have discrete spectrum with eigenvalues the values of
the characters at the rotation, and the spectral form of the Halmos–von Neumann theorem: two
ergodic invertible systems with discrete spectrum have unitarily equivalent Koopman operators iff
their eigenvalue groups are equal (`koopman_linearIsometryEquiv_iff_eigenvalues_eq`); by ergodicity
every such equivalence carries the constants to the constants.

The real-flow analogues are in Layer 3.2.

**Checks.**

- The swap on two equiprobable points has eigenvalues `1, -1`, simple, and discrete spectrum.
- The identity on two equiprobable points has the eigenvalue `1` with multiplicity two; ergodicity
  fails, so item 3 does not apply.
- The one-sided fair shift is weakly mixing (§1.4), so its eigenfunctions are the constants, whose
  span is not dense in its infinite-dimensional `L²`: it does not have discrete spectrum, although
  it has the eigenvalue `1`.

*Needs:* §§1.1, 2.1–2.2.

### 2.4 Group representation criteria

For a unitary group representation `U` on a complex Hilbert space define weak mixing by the
absence of nonzero finite-dimensional invariant subspaces. Prove its equivalence with absence
of invariant vectors in `U ⊗ conjugate U`, its tensor-product permanence with arbitrary unitary
representations, and the orthogonal decomposition into the closed span of finite-dimensional
invariant subspaces and its weakly mixing complement (Creutz, Theorem 13.8, p. 118, for the
Koopman representation of a locally compact second countable group). Construct the Hilbert
tensor-product intertwiner identifying the Koopman representation of a product probability system with the
tensor product of the Koopman representations. Deduce that a probability-preserving group
action is diagonally weakly mixing iff its representation on `L²₀` is weakly mixing (Creutz,
Proposition 13.2.1, p. 117, where weak mixing of the action means that the only precompact
functions are the constants), and iff its product with every ergodic probability action is
ergodic.

For a topological group define mixing of a strongly continuous representation by decay of all
matrix coefficients along `cocompact`. Prove equivalence with set mixing for Koopman on `L²₀`,
and mixing implies weak mixing when `cocompact.NeBot`. For abelian groups, finite-dimensional
unitary representations split into characters; deduce the eigenfunction and atomless spectral
measure criteria, and the pure-point/continuous decomposition. The nonabelian criterion uses
finite-dimensional subspaces, with no reduction to characters.

**Checks.**

- A nontrivial finite-dimensional irreducible representation of a finite nonabelian group need
  have no invariant line and is nevertheless not weakly mixing.
- An abelian character is a one-dimensional obstruction, recovering §§2.3 and 3.2.
- The left regular representation of `ℤ` on `ℓ²(ℤ)` is mixing, since its matrix coefficients
  `⟪f, U_n g⟫` tend to `0` (they vanish for large `|n|` when `f` and `g` are finitely supported),
  hence weakly mixing; the trivial representation on `ℂ` has an invariant line and is neither.

*Needs:* §§0.2, 1.3, 2.1; Mathlib Hilbert-space completions and tensor products. Build the
completion and tensor intertwiners above as part of this section.

### 2.5 Følner mean ergodic theorem and averaged weak mixing

For a countable discrete amenable group, a unitary representation `U` on a Hilbert space,
and a left Følner family `F : ι → Finset G` along `l`, prove
`#(F i)⁻¹ ∑ g ∈ F i, U_(g⁻¹) v → P_fix v` in norm (`exists_tendsto_foelner_average`; Creutz,
Theorem 12.2, p. 110, for the Koopman representation of an ergodic action and a Følner
sequence). Use the orthogonal decomposition into
fixed vectors and the closure of the span of `U_g v - v`, and the Følner boundary estimate.
For Koopman on `L²` identify the limit with conditional expectation onto the invariant
σ-algebra, using §0.2. Give the additive and map-iterate specializations, including positive ℤ intervals.

Prove the equivalences between diagonal weak mixing and vanishing Følner averages of absolute and
squared centered correlations (Creutz, Theorem 13.7, p. 117, for the squared correlations of
mean-zero functions along a Følner sequence). Prove convergence along a set of density one relative
to the specified Følner sequence for each pair of observables. For abelian groups, apply this to
spectral measures to prove Wiener's atom formula and the character-weighted atom-extraction formula
on the dual; recover §2.2 for ℤ, and MathematicalBilliards §12.4's real-interval version for ℝ,
whose transform `∫ exp (i t ξ) dσ(ξ)` is the transform here of the image of `σ` under
`ξ ↦ ξ / (2π)`, with the same atom masses.

**Checks.**

- For ℤᵈ, rectangular windows with all side lengths tending to infinity recover rectangular
  Cesàro averages.
- The trivial representation has every average equal to its input.

*Needs:* §§0.2, 2.4; AmenableGroups' Følner criterion; Mathlib `IsFoelner`, Hilbert projections;
MathematicalBilliards §12.4 for the comparison on ℝ.

### Examples

Rotations of compact abelian groups and their characters, Bernoulli shifts with Haar spectral
measures, the swap and the identity on two points, finite nonabelian groups, and `ℤᵈ` rectangular
averages.

### Dependencies

Layers 0–1; Tau Ceti Herglotz and Bochner theorems, the cyclic spectral theorem and compact
self-adjoint operators; Mathlib mean ergodic theorem, Fourier analysis and `IsFoelner`;
AmenableGroups Layer 5; MathematicalBilliards §§12.4–12.5 (the comparisons on `ℝ` in §§2.1 and
2.5).

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

**Checks.**

- The linear flow on `UnitAddCircle` with speed 1 is ergodic, and its time-1 map is the identity,
  which is not ergodic; every time-`t` map with `t` irrational is ergodic.
- The trivial flow on a nontrivial probability space is not ergodic.

*Needs:* §0.2; Mathlib `ErgodicVAdd`, Fourier series on `AddCircle`.

### 3.2 Weak mixing and mixing of real flows

Prove the equivalences for a measurable flow on a probability space:

1. `WeakMixingVAdd ℝ X μ`;
2. for all measurable `A`, `B`,
   `(1/T) ∫_0^T |μ.real (A ∩ (t +ᵥ ·) ⁻¹' B) - μ.real A * μ.real B| dt → 0` as `T → ∞`, the weak
   mixing of MathematicalBilliards §12.1 (`weakMixingVAdd_real_iff_tendsto_cesaro` for 1 ⇔ 2);
3. `spectralMeasureReal` of every `f ∈ L²₀` is atomless
   (`weakMixingVAdd_real_iff_exists_atomless_spectralMeasure` for 1 ⇔ 3; Hochman2012,
   Corollary 6.6.4, p. 70, for an ergodic transformation, with weak mixing defined as ergodicity
   of `T × T` in Definition 6.1.1, p. 56);
4. some time-`t` map with `t ≠ 0` is weakly mixing;
5. every time-`t` map with `t ≠ 0` is weakly mixing (`weakMixingVAdd_real_iff_weakMixing` for
   1 ⇔ 4 ⇔ 5; Auer2024, Theorem 3, p. 5 of arXiv version 3, for a continuous action of `ℝ^d` on a
   metric space and its restriction to `ℤ^d`, the time-1 map when `d = 1`, with weak mixing defined
   as Cesàro decay of `L²₀` correlations, the function form of item 2; rescaling time gives every
   `t ≠ 0`).

With MathematicalBilliards §12.5, 1 ⇔ 2 gives the eigenfunction criterion: `WeakMixingVAdd ℝ X μ`
holds iff every eigenfunction is almost everywhere constant, and then its frequency is 0. Route
for 1 ⇒ 2: for mean-zero `f`, `g ∈ L²`, `|⟪U_t f, g⟫|²` is a correlation of `f ⊗ f̄` and
`g ⊗ ḡ` for the diagonal flow on `X × X`, whose ergodicity and MathematicalBilliards §12.4.1's
continuous-time mean ergodic theorem give Cesàro convergence to `|∫ f|² |∫ g|² = 0`; then
Cauchy–Schwarz. Route for 2 ⇒ 1: MathematicalBilliards §§12.1–12.2 make the product of a weakly
mixing flow with any ergodic flow, in particular with itself, ergodic. Route for 1 ⇒ 5: if the
time-`t` map has an eigenfunction with eigenvalue `exp(2π i β t)`, its eigenspace is invariant
under the whole flow, on which `s ↦ exp(-2π i β s) U_s` factors through `ℝ / tℤ`; its Fourier
components are flow eigenfunctions with frequencies `β + k/t`, which are constant by the
eigenfunction criterion, so the eigenfunction is constant.

Prove that the flow is mixing iff its time-1 map is strongly mixing (for the converse, use
uniformity of the map's mixing limit over the norm-compact family `{U_s 1_B | s ∈ [0,1]}` given by
strong continuity).

**Checks.**

- The linear flow on `UnitAddCircle` is not weakly mixing: `x ↦ exp(2π i x)` is an eigenfunction
  with frequency 1.
- The linear flow on `UnitAddTorus (Fin 2)` with direction `(1, √2)` is ergodic and not weakly
  mixing.
- The trivial flow on two equiprobable points has integrand `1/4` in item 2 for `A = B` a point,
  so item 2 fails, and every time-`t` map is the identity, which is not weakly mixing.

*Needs:* §§0.2, 1.3, 2.1–2.3, 3.1; MathematicalBilliards §§12.1–12.5.

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
`S_n r` is the cocycle of Birkhoff sums extended to negative `n` (Sarig2023, Definition 1.20,
p. 30, gives the semiflow over a base that need not be invertible, for roofs with `inf r > 0`).
Prove that this is a measurable flow preserving the probability, and:

1. the flow is ergodic iff `T` is ergodic (ParryPollicott1990, p. 90, over a subshift of finite
   type with a Hölder roof);
2. `α` is a frequency of an eigenfunction iff there is a measurable `g : X → ℂ`, not almost
   everywhere zero, with `g (T x) = exp (2π i α r x) * g x` almost everywhere (ParryPollicott1990,
   Proposition 6.2, pp. 93–94, over a subshift of finite type with a Hölder roof and a Gibbs
   measure, where the frequency is `2π α`);
3. hence the flow is weakly mixing iff `T` is ergodic and the equation in 2 has no solution for
   `α ≠ 0`;
4. the base `X₀ × {0}` is a cross-section: the first return of the flow to it is `T`, with return
   time `r`.

**Checks.**

- A constant roof `r ≡ c` gives a flow with eigenfunction `(x, s) ↦ exp(2π i s / c)`, frequency
  `1/c`; it is never weakly mixing.
- Over the identity on a one-point space with roof `c`, the suspension flow is the rotation flow on
  `AddCircle c`.
- Over the swap of two equiprobable points with roof `r ≡ 1`, the suspension flow is a single
  closed orbit of length 2 with uniform measure; it is ergodic, as the swap is, and `g = (1, -1)`
  solves item 2's equation with `α = 1/2`, giving the eigenfunction `(x, s) ↦ g x * exp (π i s)`.

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
extreme points are exactly the `ν` with `ErgodicVAdd ℝ X ν` (Hochman2012, Proposition 3.4.2,
p. 22, for a single map), and that the
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
   MathematicalBilliards §8.2's billiard flow, with §8.3's invariant Liouville measure, and §3.3's
   suspension flow are conull flows.
2. **Point realization.** For a jointly measurable family `T : ℝ → X → X` of measure-preserving
   maps with `T 0 = id` almost everywhere and, for each `s` and `t`,
   `T (s + t) = T s ∘ T t` almost everywhere (the exceptional set may depend on `s, t`), prove that
   there is a conull flow `Φ` with `Φ t = T t` almost everywhere for every `t`
   (`exists_conullFlow_realization`; Mackey's point realization theorem for `ℝ`). Route: by Fubini, the set of `x` for which
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
- Translation on `ℝ` is a single orbit, so `ℝ` is its only nonempty invariant set: the irrationals
  form a conull set that translation does not preserve (`√2 + (-√2) = 0`), so a conull set need not
  carry a given flow.

*Needs:* §§0.1, 3.1, 3.3; MathematicalBilliards §§8.2–8.3 (the billiard flow of item 1); Mathlib
`Measure.withDensity`, `Measure.sum`, Fubini for σ-finite measures, `StandardBorelSpace`.

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
- For the same flow and `e₁ = fourier 1`, `flowCorrelation volume e₁ e₁ t = exp (2π i t)`, so its
  value at `t = 1/4` is `i`; putting the conjugate on `f (t +ᵥ x)` instead of on `g x` would give
  `-i`.
- For `f = g = 1` on any probability space, `flowCorrelation μ 1 1 t = 1 - 1 = 0` for every `t`;
  without the subtracted product of means it would be `1` for every `t`, so the characterization
  of mixing would fail at the constants and no flow would satisfy `HasCorrelationBound`.
- For the two-sided Bernoulli shift with the metric `d(x, y) = 2^(-min{|k| : x k ≠ y k})`,
  functions depending on coordinates in `[-k, k]` are Lipschitz, and their correlations vanish for
  `n > 2k`; §8.6 proves exponential mixing for all Hölder functions.
- A suspension flow with constant roof (§3.3) has an eigenfunction, so it is not mixing.

*Needs:* §§1.1, 1.3, 3.2; Mathlib `MemHolder`, `nnHolderNorm`, Lipschitz approximation on metric
spaces.

### Examples

Linear flows on tori, the trivial flow, suspension flows with constant and nonconstant roofs, the
rotation flow on `AddCircle c`, translation on `ℝ` modified on a null set, and the two-sided
Bernoulli shift with its Hölder observables.

### Dependencies

Layers 0–2; MathematicalBilliards §§8.2–8.3, 12.1–12.5; Mathlib `Flow`, Fourier series on `AddCircle`,
`Measure.withDensity`, `MemHolder` and `nnHolderNorm`.

## Layer 4: Kolmogorov–Sinai entropy

The single-map absolute entropy is GeometryOfNumbersAndQuadraticArithmetic §4.2's
`measureEntropy μ T : ℝ≥0∞`. Write `h_μ(T)`, `h_μ(T, ξ)` and `H_μ(ξ)` for `measureEntropy μ T`,
`partitionEntropyRate μ T ξ` and `countablePartitionEntropy μ ξ`.

### 4.0 Partition entropy and the Kolmogorov–Sinai definition

Work on a probability space with arbitrary measurable structure; a partition is a measurable label
`ξ : X → ι` into a countable discrete type, its atoms are the fibres (empty atoms allowed), and the
join of `ξ` and `η` is the label `x ↦ (ξ x, η x)`. The label entropy `countablePartitionEntropy`,
the conditional entropy `conditionalPartitionEntropy` of one label given another, the itineraries
`iteratedPartitionLabel`, the rates `partitionEntropyRate` and the entropy `measureEntropy` are
GeometryOfNumbersAndQuadraticArithmetic §4.2's, with their chain rule, relabeling invariance,
additivity for independent labels and subadditive limit; on finite labels they agree with
ProbabilisticAndMetricNumberTheory §5.1a's `labelEntropy`. ArithmeticDynamics §2.6 supplies
invariance under almost-everywhere equality of labels and the finite-partition formula
`h_μ(T) = sup_ξ h_μ(T, ξ)` over finite labels, and §2.7 the conditional entropy of a finite
partition given a sub-σ-algebra, its chain rule and the future formula for the rate. Prove, for
countable labels:

1. **Refinement and joins.** Monotonicity of `H_μ` under refinement, subadditivity
   `H(ξ ∨ η) ≤ H(ξ) + H(η)`, `H(ξ | η) ≤ H(ξ)` with equality for independent labels, and
   monotonicity of `H(ξ | η)` in both arguments, from the supplied chain rule (Sarig2023,
   Propositions 4.2–4.3, p. 106, for countable partitions of finite entropy).
2. **Conditional entropy given a σ-algebra.** For a sub-σ-algebra `𝒜`, extend ArithmeticDynamics
   §2.7's conditional entropy from finite partitions to countable labels: `H(ξ | 𝒜)` is
   `∫⁻ x, -∑ i, p_i(x) log p_i(x) dμ` with `p_i = μ[1_{ξ = i} | 𝒜]`, and on a standard Borel space
   it is `condPartitionEntropy μ ξ 𝒜 = ∫⁻ x, H_(κ x)(ξ) dμ(x)` for `κ = condExpKernel μ 𝒜`; prove
   the two formulas agree there. Prove independence of conditional-expectation representatives,
   agreement with ArithmeticDynamics §2.7 on finite labels and with `conditionalPartitionEntropy` when `𝒜` is
   generated by a countable label, `0 ≤ H(ξ | 𝒜) ≤ H(ξ)`, antitonicity in `𝒜`, `H(ξ | ⊥) = H(ξ)`,
   `H(ξ | 𝓑_X) = 0`, the chain rule `H(ξ ∨ η | 𝒜) = H(ξ | 𝒜) + H(η | 𝒜 ⊔ σ(ξ))`, and continuity
   along increasing and decreasing sequences of σ-algebras for finite-entropy `ξ` (martingale
   convergence); the continuity along monotone sequences is not part of ArithmeticDynamics §2.7.
3. **Rates.** For measure-preserving `T` and `H(ξ) < ∞`, prove
   `h_μ(T, ξ) = H(ξ | ⨆_{j ≥ 1} σ(ξ ∘ T^[j]))`, extending ArithmeticDynamics §2.7's future formula
   from finite partitions to countable labels of finite entropy (Sarig2023, Theorem 4.2, p. 108).

**Checks.**

- A one-atom label has entropy 0, including with added empty atoms.
- A fair bit has entropy `log 2`, and a fair bit joined with itself also has `log 2`, not
  `2 log 2`.
- Conditioning a fair bit on itself gives 0.
- For the fair Bernoulli shift the coordinate label has `H(ξⁿ) = n log 2` and rate `log 2`; for the
  identity on two equiprobable points the rate is 0.
- On `[0, 1]` with Lebesgue measure the label `x ↦ x` (uncountably many values) is not admissible,
  while its dyadic truncations have entropies `k log 2` tending to `⊤`.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §4.2; ArithmeticDynamics §§2.6–2.7;
ProbabilisticAndMetricNumberTheory §5.1a; Mathlib `Real.negMulLog`, conditional expectation,
martingale convergence, `condExpKernel`.

### 4.1 Basic properties

Prove:

1. invariance under isomorphism mod 0 (Sarig2023, Problem 4.3, p. 130), and `h_ν(S) ≤ h_μ(T)`
   for a factor;
2. `h_μ(T^[k]) = k * h_μ(T)` for `k ≥ 1`, and `h_μ(T.symm) = h_μ(T)` for invertible `T`
   (Sarig2023, Problems 4.4–4.5, p. 130);
3. `h_{μ.prod ν}(Prod.map T S) = h_μ(T) + h_ν(S)` (Sarig2023, Problem 4.12, p. 131);
4. finite affinity: `h_{a μ + (1 - a) ν}(T) = a h_μ(T) + (1 - a) h_ν(T)` for invariant
   probabilities `μ`, `ν` and `a ∈ [0, 1]` (`ℝ≥0∞` arithmetic; Sarig2023, Problem 4.6, p. 130);
5. `h_μ(T, ξ) ≤ H_μ(ξ)`, with equality for finite `ξ` iff the labels `ξ ∘ T^[k]` are independent
   (from `H(ξ ∨ η) ≤ H(ξ) + H(η)` with equality iff `ξ`, `η` are independent: Sarig2023,
   Proposition 4.3, p. 106);
6. continuity of `h_μ(T, ·)` in the Rokhlin distance `H(ξ | η) + H(η | ξ)` on finite partitions
   (Sarig2023, Problem 4.8, p. 130).

**Checks.**

- For the identity map every partition has rate 0.
- For the swap on two points with the partition into points, `H = log 2`, the rate is 0, and
  equality in 5 fails because `ξ ∘ T = 1 - ξ` generates the same partition as `ξ`, so the two
  labels are not independent.

*Needs:* §§0.1, 4.0; GeometryOfNumbersAndQuadraticArithmetic §4.2.

### 4.2 Generators

A finite or countable label `ξ` with `H_μ(ξ) < ∞` is a one-sided generator if the σ-algebras of the
iterated labels `iteratedPartitionLabel T ξ n` generate the σ-algebra of `X` modulo μ-null sets,
and, for invertible `T`, a two-sided generator if those of the labels over `n ∈ ℤ` do. Prove the
**Kolmogorov–Sinai theorem**: for a one-sided generator `h_μ(T) = h_μ(T, ξ)`, and for a two-sided
generator of an invertible system the same (Sarig2023, Definition 4.4 and Theorem 4.4, p. 111,
where a one-sided generator is a strong generator;
`measureEntropy_eq_partitionEntropyRate_of_generator` and
`measureEntropy_eq_partitionEntropyRate_of_twoSidedGenerator`). Prove that an invertible system with a
one-sided generator has `h_μ(T) = 0` (Sarig2023, proof of Proposition 4.7, p. 114).

Prove the increasing-σ-algebra approximation theorem: if sub-σ-algebras `𝒜_k` increase and
generate the ambient σ-algebra modulo null sets, then
`h_μ(T) = sup_k sup_{ξ finite, ξ measurable for 𝒜_k} h_μ(T, ξ)`. No single `𝒜_k` need be
invariant. Prove it using conditional-entropy approximation of every finite label and the
Rokhlin-distance bound of §4.1. Deduce the corresponding increasing-partition form when finite
labels `ξ_k` refine and generate, and the approximation needed for natural extensions and
small-diameter partitions.

Prove `h_μ̃(T̃) = h_μ(T)` for the natural extension (`measureEntropy_naturalExtension`): apply the
increasing-σ-algebra approximation above to finite-history σ-algebras, identify their entropy with
that of the base by invariance, and pass to the supremum. Prove this directly from partition
approximation and do not use entropy addition.

**Checks.**

- For the one-sided Bernoulli shift on a finite alphabet the first-coordinate label is a one-sided
  generator.
- For the two-sided shift with `p` not a Dirac mass it is a two-sided but not a one-sided
  generator: an invertible system with a one-sided generator has entropy 0, while the entropy is
  `H(p) > 0`.
- For `p = δ_a` the two-sided shift is a point modulo null sets and the label is a one-sided
  generator.

*Needs:* §§4.0 (conditional entropy, increasing σ-algebras), 4.1; GeometryOfNumbersAndQuadraticArithmetic
§4.2; ArithmeticDynamics §2.6 (finite-partition formula).

### 4.3 Computations

Prove:

1. Bernoulli shifts, one- and two-sided, with a countable alphabet (`measureEntropy_bernoulliShift`):
   `h = -∑ p_i log p_i`, an
   element of `ℝ≥0∞` that is `∞` when the series diverges (for infinite entropy, use the finite
   coarsenings; Sarig2023, Proposition 4.6, p. 113, for finite alphabets);
2. Markov shifts on a finite `S` with invariant `π` (`measureEntropy_markovShift`):
   `h = -∑ π_i κ_ij log κ_ij` (Sarig2023,
   Proposition 4.8, p. 114).

**Checks.**

- The `(1/2,1/2)` shift has entropy `log 2`; the `(1/3,1/3,1/3)` shift has `log 3`; the shift
  with `p = δ_a` has entropy 0.
- The two-state Markov chain with `κ = !![1-p, p; p, 1-p]` and uniform `π` has entropy
  `-(p log p + (1-p) log (1-p))`.

*Needs:* §§0.3, 4.1–4.2; Tau Ceti `shift`, `markovChainLaw`.

### 4.4 Induced maps

Prove **Abramov's formula for induced maps** (Sarig2023, Theorem 4.6, p. 116): for a
probability-preserving `T` on a standard Borel space and measurable `A` with `μ A > 0` and
`μ (⋃ n, T^[n] ⁻¹' A) = 1`, the entropy of `inducedMap T A` for the normalized restriction is
`h_μ(T) / μ A`. Every set of positive measure satisfies the covering hypothesis when `T` is ergodic.

**Checks.**

- For `T` periodic on three equiprobable points and `A` one point, both sides are 0.
- For the one-sided fair shift and `A = {x | x 0 = 0}`, the return times are independent with
  `P(r = k) = 2^(-k)`, so the induced map is a Bernoulli shift of entropy
  `∑ k 2^(-k) log 2 = 2 log 2 = (log 2) / (1/2)`; the map is not invertible.
- On the disjoint union of a fixed point of mass `1/2` and the one-sided fair shift with mass
  `1/2`, take `A` the fixed point: `μ (⋃ n, T^[n] ⁻¹' A) = 1/2`, the induced map is the identity,
  of entropy 0, while `h_μ(T) / μ A = ((log 2)/2) / (1/2) = log 2`; the formula needs the covering
  hypothesis.

*Needs:* §§0.4, 4.1–4.2; GeometryOfNumbersAndQuadraticArithmetic §4.2.

### 4.5 Pinsker σ-algebra and K-systems

Define the Pinsker σ-algebra `pinsker T μ` as the σ-algebra generated by finite labels `ξ` with
`h_μ(T, ξ) = 0`, and prove it is `T`-invariant, that the corresponding factor has entropy 0, and
that it contains every zero-entropy factor (as the pullback σ-algebra).

For invertible `T`, define `IsKSystem T μ` (Sarig2023, Definition 3.8, p. 96): there is a
sub-σ-algebra `𝒦` with
`𝒦.comap T ≤ 𝒦`, the σ-algebras `𝒦.comap (T.symm^[n])` generate the σ-algebra of `X` modulo null
sets, and `⨅ n, 𝒦.comap (T^[n])` is trivial modulo null sets. Prove: two-sided Bernoulli shifts
are K-systems (Sarig2023, Proposition 3.5, p. 96); K-systems are mixing of all orders; for a K-system, `pinsker T μ` is trivial modulo
null sets, so every nontrivial factor has positive entropy.

**Checks.**

- The identity on a nontrivial space has `pinsker = ⊤` and is not a K-system.
- For the two-sided fair shift `(T x) n = x (n + 1)`, `𝒦 = σ(x n : n ≥ 0)` satisfies the three
  conditions (its tail is trivial by Kolmogorov's zero–one law), while the past
  `σ(x n : n ≤ 0)` violates `𝒦.comap T ≤ 𝒦`.
- An irrational rotation is ergodic and has entropy 0, so its Pinsker σ-algebra is the whole
  σ-algebra and it is not a K-system; a definition of K-systems by ergodicity alone would admit it.

*Needs:* §§1.2, 4.1–4.2; GeometryOfNumbersAndQuadraticArithmetic §4.2; Mathlib conditional
expectation and martingale convergence.

### 4.6 Entropy of amenable actions and the finite-set limit lemma

For a countably infinite discrete amenable group acting by probability-preserving maps, let
`H_μ(ξ^F)` be the entropy of §0.5's finite-window label. Prove its monotonicity, subadditivity,
right-translation invariance and strong subadditivity for finite-entropy labels.
Prove the finite-set Shearer inequality and the infimum rule
`lim_i H_μ(ξ^(F i)) / #(F i) = inf_{F nonempty finite} H_μ(ξ^F) / #F`
for every left Følner family along a nontrivial filter (`actionPartitionEntropyRate_tendsto`).
Define `actionPartitionEntropyRate` by
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

**Checks.**

- For ℤᵈ Bernoulli actions, box-normalized entropy equals the base entropy, rather than entropy
  per boundary site.
- For a finite group, the Følner limit is the whole-group quantity divided by `#G`; entropy-zero
  claims for trivial actions assume `G` infinite.
- For the trivial action of an infinite `G` and a fair-bit label `ξ`, the window label `ξ^F` takes
  two equiprobable values, so `H_μ(ξ^F) = log 2` for every nonempty `F` and
  `actionPartitionEntropyRate` is `inf_F log 2 / #F = 0`; every finite label gives 0, so the action
  has entropy 0, while the unnormalized window entropies stay at `log 2`.

*Needs:* §§0.5, 4.1–4.2; AmenableGroups' discrete Følner criterion; finite entropy inequalities
from ProbabilisticAndMetricNumberTheory §5.1a, GeometryOfNumbersAndQuadraticArithmetic §4.2 and
§4.0. Prove Shearer and quasi-tiling as targets of this section.

### 4.7 Pointwise averaging, Shannon–McMillan–Breiman and decomposition

For a countable discrete amenable group acting on a standard Borel probability space, the
pointwise ergodic theorem along a tempered left Følner sequence `F_n`,
`#F_n⁻¹ ∑ g ∈ F_n, f(g • x) → E[f | invariants](x)` almost everywhere for `f ∈ L¹`, is
GeometryOfNumbersAndQuadraticArithmetic §4.2's `tempered_action_pointwise` with counting measure as
Haar measure; its `TemperedFolnerSequence` bound is `#(⋃ k < n, F_k⁻¹ * F_n) ≤ C * #F_n`
(Lindenstrauss1999, Definition 1.2, p. 83). Prove that every Følner sequence has a tempered
subsequence (Lindenstrauss1999, Proposition 1.5, p. 84), and identify the ℤ-interval case with
ProbabilisticAndMetricNumberTheory §4.1's `birkhoff_pointwise`, proving the reindexing lemmas
this identification needs.

For an infinite `G`, a tempered Følner sequence with `#F_n / log(n + 2) → ∞`, and a finite
measurable label `ξ`, prove the amenable **Shannon–McMillan–Breiman theorem**: normalized
information `I(μ {y | ξ^(F_n)(y) = ξ^(F_n)(x)}) / #F_n : ℝ≥0∞` converges almost
everywhere to an invariant function whose integral is `actionPartitionEntropyRate` (Lindenstrauss1999,
Theorem 1.4, p. 83, for ergodic actions). State its ergodic constant form and extend to
countable finite-entropy labels by truncation with an information-tail estimate. Supply the
information estimates and covering argument of Lindenstrauss's theorem as explicit intermediate
targets. These sequence hypotheses belong to pointwise conclusions, not to §4.6's entropy definition.

Consume GeometryOfNumbersAndQuadraticArithmetic §4.2's group-action ergodic decomposition
(`ActionErgodicKernel`), prove entropy integration for these actions
using finite partitions and the generator/approximation arguments above, and deduce Jacobs'
mixture formula and measurability of the action entropy on invariant probabilities of a compact
metrizable action. Construct compatible Polish topological models of standard Borel countable
actions where needed for the decomposition interface.

**Checks.**

- For an ergodic Bernoulli ℤᵈ-action and a finite-alphabet coordinate label, normalized
  information along tempered boxes converges to the base Shannon entropy.

*Needs:* §§0.1–0.2, 2.5, 4.0, 4.6; GeometryOfNumbersAndQuadraticArithmetic §4.2
(`tempered_action_pointwise`, ergodic decomposition); ProbabilisticAndMetricNumberTheory §4.1;
Lindenstrauss's information theorem, with its covering estimates built here.

### 4.8 Relative entropy and the Abramov–Rokhlin addition formula

Use sub-σ-algebras as the primary interface. For an endomorphism and `𝒜 ≤ 𝓑_X` with
`𝒜.comap T ≤ 𝒜` modulo null sets, define the relative partition entropy rate
`relativePartitionEntropyRate μ T ξ 𝒜` by
`inf_{n ≥ 1} H_μ(ξ^n | 𝒜)/n`, and `relativeMeasureEntropy μ T 𝒜 : ℝ≥0∞` as the supremum over
finite measurable labels, with §4.0's `condPartitionEntropy`; its conditional-kernel
formula is a compatibility theorem, not an additional authoritative definition.
Prove subadditivity, existence of the normalized limit, invariance under changes modulo null
sets, monotonicity as conditioning increases, the finite/countable finite-entropy comparison,
and relative generator and increasing-σ-algebra approximation theorems.

For a standard Borel factor `π : (X,T,μ) → (Y,S,ν)`, specialize to
`𝒜 = MeasurableSpace.comap π 𝓑_Y` and prove the **Abramov–Rokhlin addition formula**
`h_μ(T) = h_ν(S) + relativeMeasureEntropy μ T 𝒜` in `ℝ≥0∞`, including infinite values
(`measureEntropy_factor_add_relative`).
Prove the finite-partition conditional chain comparisons, the limit passage, and the required
countable approximation to the factor σ-algebra; this proof requires no invariant relative
product of endomorphisms. Prove the entropy chain formula for a composition of factors, written
as addition. Retain the direct factor-monotonicity proof of §4.1 and identify it with this corollary.

For every countably generated sub-σ-algebra preserved by the endomorphism modulo null sets,
construct a standard Borel factor realizing it modulo null sets: use a countable binary coding,
construct the induced measurable transformation on the coded space modulo its pushforward law,
and prove compatibility of relative entropy with the resulting factor map.

**Checks.**

- Conditioning on the trivial σ-algebra gives ordinary entropy.
- Conditioning on the whole σ-algebra gives zero.
- For product systems, `h(X × Y | X) = h(Y)`, and addition recovers product additivity.
- For an isomorphism the relative entropy is zero.

*Needs:* §§0.1, 4.0 (conditional entropy and martingale approximation), 4.1–4.2;
GeometryOfNumbersAndQuadraticArithmetic §4.2; ArithmeticDynamics §2.7; standard Borel countable
coding. Prove the chain comparisons here; natural-extension entropy
preservation is already proved directly in §4.2.

### 4.9 Relative entropy of amenable actions

For a countably infinite discrete amenable group and an invariant sub-σ-algebra, define the
relative finite-window rate by `H_μ(ξ^F | 𝒜)/#F`. Prove the conditional Shearer inequality,
the infimum rule and convergence along every filtered Følner family, and define
`relativeActionMeasureEntropy G μ 𝒜` by the supremum over finite measurable labels. Prove
conditioning monotonicity, conjugacy invariance and the relative generator/approximation theorems.
For a standard Borel group-action factor prove the action version of Abramov–Rokhlin addition
(WardZhang1992, Monatsh. Math. 114, 317–329) and the addition formula for a composition of
factors, with `ℝ≥0∞` values. Prove compatibility
with §4.8 for ℤ-actions. Use finite conditional chain estimates and the Følner boundary estimates,
with all partition approximation steps explicit.

**Checks.**

- Over a one-point factor this is §4.6's entropy.
- A product Bernoulli extension has relative entropy equal to the base-alphabet Shannon entropy,
  independently of the factor action.
- Over the identity factor the relative entropy is 0, since `H_μ(ξ^F | 𝓑_X) = 0` for every finite
  measurable label, and the addition formula reads `h = h + 0`; for the Bernoulli action with fair
  coin this is `log 2 = log 2 + 0`.

*Needs:* §§0.5, 4.0, 4.6, 4.8. Conditional finite-window estimates
are targets here and do not use the pressure variational principle.

### 4.10 Shannon–McMillan–Breiman and the ergodic decomposition of entropy

ArithmeticDynamics §2.7 proves the Shannon–McMillan–Breiman theorem for finite partitions of a
measure-preserving endomorphism of a probability space with arbitrary measurable structure, and
constructs the ergodic decomposition `x ↦ μ_x` of an endomorphism of a nonempty standard Borel
space, with `g_ξ(x) = h_(μ_x)(T, ξ)` and entropy integration `h_μ(T) = ∫⁻ h_(μ_x)(T) dμ(x)` in
`ℝ≥0∞`. Extend the **Shannon–McMillan–Breiman theorem** to countable labels `ξ` of finite entropy:
`I(μ {y | ξⁿ(y) = ξⁿ(x)}) / n` converges almost everywhere and in `L¹` to a nonnegative, integrable,
almost-everywhere `T`-invariant function `g_ξ` with `∫ g_ξ dμ = h_μ(T, ξ)`, the constant
`h_μ(T, ξ)` for ergodic `μ`. Route: the martingale information argument through §4.0 item 3,
Chung's maximal inequality for the information functions, and ProbabilisticAndMetricNumberTheory
§4.1's Birkhoff theorem with invariant conditional-expectation limit. Prove the agreement of this
`ℝ≥0∞` form with ArithmeticDynamics §2.7's real form `-log μ(ξⁿ(x)) / n`, and the convergence in
`L¹`, which ArithmeticDynamics §2.7 does not state, also for finite labels. For an invertible map, prove that the ergodic decomposition
agrees with GeometryOfNumbersAndQuadraticArithmetic §4.2's `ActionErgodicKernel` for the ℤ-action,
and deduce finite affinity (§4.1 item 4) from entropy integration as a check.

**Checks.**

- On a singleton the information quotient is 0 and the component is the Dirac mass.
- On the fair binary shift cylinder masses `2⁻ⁿ` give `log 2`.
- On the identity of two equiprobable points, `μ_x = δ_x` and the entropy integral is 0; the
  constant kernel `μ` fails the conditional-expectation identity.
- On the disjoint union of a fixed point and a fair binary shift with weights `1/2`, the entropy
  is `(log 2)/2`.

*Needs:* §§4.0–4.2; ArithmeticDynamics §2.7; ProbabilisticAndMetricNumberTheory §§4.1–4.3
(pointwise Birkhoff); GeometryOfNumbersAndQuadraticArithmetic §4.2 (`ActionErgodicKernel`);
Mathlib conditional expectation, martingale convergence.

### Examples

Bernoulli shifts on finite and countable alphabets, two-state Markov chains, induced maps of the
fair shift, irrational rotations, Bernoulli actions of `ℤᵈ` and of countably infinite amenable
groups, product extensions, and mixtures of a fixed point with a Bernoulli shift.

### Dependencies

Layers 0–2; GeometryOfNumbersAndQuadraticArithmetic §4.2; ArithmeticDynamics §§2.6–2.7;
ProbabilisticAndMetricNumberTheory §§4.1–4.3, 5.1a; AmenableGroups Layer 5; Mathlib conditional
expectation and martingale convergence.

## Layer 5: Topological entropy and pressure

### 5.1 Invariant probabilities and unique ergodicity

For a continuous `T` on a nonempty compact Hausdorff `X`, work with Radon probabilities and
prove that `invariantProbabilities T` is nonempty
(Mathlib's Krylov–Bogolyubov), closed in `ProbabilityMeasure X` hence compact, and convex as a
subset of `Measure X`; prove the extreme-point characterization by ergodicity in this Radon
setting, agreeing with Mathlib's theorem wherever its hypotheses apply. Define
`UniquelyErgodic T` as `invariantProbabilities T` being a singleton, and prove its equivalence with
uniform convergence of `birkhoffAverage ℝ T f n` to a constant for every `f : C(X, ℝ)`
(Hochman2012, Proposition 4.5.2, p. 41, on compact metric spaces). Prove that
a rotation of a compact metrizable abelian group with dense powers is uniquely ergodic.

**Checks.**

- The identity on a two-point space has two ergodic measures and is not uniquely ergodic.
- An irrational rotation of `UnitAddCircle` is uniquely ergodic, with `volume` its only invariant
  probability, while the rotation by `1/3` is not: the uniform probability on each orbit
  `{x, x + 1/3, x + 2/3}` is invariant.
- For the doubling map on `UnitAddCircle`, `δ_0` and `volume` are invariant and ergodic, so the
  invariant probabilities have at least two extreme points.

*Needs:* §0.6; Mathlib Krylov–Bogolyubov and `Ergodic.iff_mem_extremePoints`. Supply the
weak-* empirical-measure proof for compact Hausdorff spaces, and the extreme-point comparison.

### 5.2 Topological entropy

Mathlib's `coverEntropy T univ` is the topological entropy. Add, for a compact metric space:

1. the metric (Bowen–Dinaburg) forms by `(n, ε)`-separated and spanning sets, with `ε → 0`, equal
   to `coverEntropy` (from `coverEntropy_eq_iSup_netEntropyEntourage` and the metric basis of the
   uniformity);
2. the open-cover (Adler–Konheim–McAndrew) definition `openCoverEntropy T` on nonempty compact
   Hausdorff spaces, and its equality with `coverEntropy T univ` for the compatible compact
   uniformity; specialize to the metric formulas in item 1 (on a compact metric space the
   open-cover and separated-set forms agree: Sarig2023, Definitions 4.5–4.7 and Theorem 4.8,
   pp. 119–121);
3. `coverEntropy (T^[k]) univ = k * coverEntropy T univ` for `k ≥ 1` (Sarig2023, Problem 4.13,
   p. 131); `coverEntropy T.symm univ = coverEntropy T univ` for a homeomorphism; additivity on
   products; monotonicity under topological factors (Mathlib's `Semiconj` results);
4. isometries have entropy 0 (Sarig2023, proof of Corollary 4.1, p. 122); the full shift on
   `ℕ → α` or `ℤ → α`, `α` finite, has entropy `log (card α)`; a one-step subshift of finite type
   whose `0`-`1` transition matrix `M` has no zero row has entropy `log (spectralRadius ℝ M)` (count
   admissible words by entries of `M^n` and apply `spectrum.gelfand_formula`);
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
- The swap of two points is topologically transitive but not topologically mixing:
  `T^[n] '' {0} ∩ {0} = ∅` for every odd `n`.

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
expansive homeomorphism, that `toralEndomorphism A` is positively expansive for every `A` with
`A.det ≠ 0` all of whose eigenvalues have modulus `> 1` (for example `!![2,0;0,2]`), and that an
expansive homeomorphism has finite topological entropy computed at any scale `< δ` (Bowen1972,
Theorem 2.4 with Corollary 2.3, p. 327: an expansive constant is an entropy-expansive constant).

**Checks.**

- An irrational rotation is not expansive: it preserves distances.
- The one-sided full shift on two symbols with `d(x, y) = 2^(-min {k | x k ≠ y k})` is positively
  expansive with constant `3/4`: distinct sequences first differ at some `k`, and
  `d(σ^k x, σ^k y) = 1`.
- The cat map `!![2,1;1,1]` has eigenvalues `(3 ± √5)/2`, none of modulus 1, and is an expansive
  homeomorphism; it is not positively expansive, since points of its contracting eigenline near `0`
  stay near `0` under all forward iterates. The map `toralEndomorphism !![2,0;0,2]` has both
  eigenvalues `2` and is positively expansive but not injective.

*Needs:* §5.2.

### 5.4 Topological pressure of maps

For a continuous `T` on a compact metric space and `φ : C(X, ℝ)`, define
`topologicalPressure T φ : EReal` by

```text
P(T, φ) = ⨆ U ∈ 𝓤 X, limsup_{n → ∞} (1/n) log sup { ∑_{x ∈ s} exp (birkhoffSum T φ n x) |
                                                      s finite, IsDynNetIn T univ U n s }
```

where the inner supremum is `pressureNetSum T φ U n`, and the spanning version with `inf` over
`IsDynCoverOf`; prove they agree, that the metric
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
- For the doubling map on `UnitAddCircle` and a constant potential `c`, `P = log 2 + c` (items 1
  and 2); weighting each separated point by `exp (φ x)` instead of `exp (birkhoffSum T φ n x)`
  would give `log 2`.

*Needs:* §5.2; Mathlib `birkhoffSum`.

### 5.5 Topological entropy and pressure of continuous flows

For `ϕ : Flow ℝ X` on a compact metric space and `F : C(X, ℝ)`, define `flowTopologicalPressure ϕ F`
as `topologicalPressure (ϕ 1) F₁` with `F₁ x = ∫_0^1 F (ϕ s x) ds`. Prove:

1. it is the limit as `ε → 0` of the exponential growth rate in real `t` of the sums of
   `exp (∫_0^t F (ϕ s x) ds)` over `(t, ε)`-separated sets for the flow Bowen balls of the
   conventions (Bowen–Ruelle, *The ergodic theory of Axiom A flows*, 1975);
2. `coverEntropy (ϕ t) univ = |t| * coverEntropy (ϕ 1) univ`;
3. `flowTopologicalPressure ϕ 0 = coverEntropy (ϕ 1) univ`;
4. the growth rate in item 1 may be taken with `limsup` or with `liminf` over real `t → ∞`
   (equivalently over `t ∈ ℕ`) after `ε → 0`, and with either separation convention of §5.2.

A flow is *topologically transitive* when its `ℝ`-action is, in Mathlib's
`AddAction.IsTopologicallyTransitive ℝ X`; prove that on a compact metric space without isolated
points this is equivalent to the existence of a dense forward orbit, and that transitivity of a
time-`t` map implies transitivity of the flow, but not conversely.

Route: uniform continuity of `(s, x) ↦ ϕ s x` on `[0, 1] × X` compares flow Bowen balls at time `n`
with those of the time-1 map at step `n`.

**Checks.**

- For the unit-speed flow on `UnitAddCircle`, `(t, ε)`-separated sets have at most `⌈1/ε⌉` points
  for every `t`, and `∫_0^t F (x + s) ds = t ∫ F d volume + O(1)` uniformly in `x`, so
  `flowTopologicalPressure ϕ F = ∫ F d volume`; in particular the entropy is 0.
- For the trivial flow, `F₁ = F` and the flow pressure is the pressure `max F` of the identity map.
- For the time change `ψ t = ϕ (c t)` with `c > 0`, item 2 gives `coverEntropy (ψ 1) univ =
  c * coverEntropy (ϕ 1) univ`: flow entropy depends on the time scale.

*Needs:* §5.4; Mathlib `Flow`.

### 5.6 Topological entropy and pressure of amenable actions

For continuous actions of countably infinite discrete amenable groups on a nonempty compact Hausdorff
space, define open-cover entropy by the normalized logarithm of the minimum subcover cardinality
of the finite-window joins. Prove Følner independence using §4.6's Ornstein–Weiss lemma and
define `actionTopologicalEntropy G X : EReal`. On compact metrizable spaces prove its agreement
with §0.5's separated/spanning formulations, independently of the compatible metric.

For `φ : C(X, ℝ)` on a compact metrizable `X`, use weights `exp(∑ g ∈ F, φ(g • x))` and define
`actionTopologicalPressure G φ : EReal` by normalized separated-set sums (`actionPressureNetSum`,
along a family of windows `actionPressureAlong`), with the scale tending to zero (Chung2013, §3,
pp. 8–9, gives the cover and separated-set forms along a left Følner sequence). Construct the
weighted open-cover version, prove the finite-window comparison estimates, and apply the limit lemma to
weighted covers after adding a constant to make the potential nonnegative. Prove equality of the
cover, separated and spanning definitions and independence of Følner family. In particular the scale
limit of limsup agrees with that of liminf; a fixed separation scale is not asserted to have a limit
without further hypotheses.

Prove pressure at zero equals entropy, potential monotonicity, addition of constants, the
finite-valued Lipschitz bound and convexity, and conjugacy invariance. Prove invariance under adding
`ψ ∘ (g • ·) - ψ` for a fixed `g`, using the Følner boundary estimate; include finite sums of such
coboundaries. (Chung2013, Proposition 6.1, pp. 23–24, proves all of these but conjugacy invariance
for sofic pressure, which is this pressure for amenable `G` by Chung2013, Theorem 1.1, p. 2; for
amenable `G` it cites MoulinOllagnier1985, Corollary 5.2.6.) Prove entropy factor monotonicity and
product additivity. The ℤ-action of a homeomorphism agrees with the map definitions in §§5.2 and
5.4. For infinite `G`, the finite-alphabet full shift has entropy `log #α` and a coordinate
potential has pressure `log ∑ a, exp(φ a)` (Chung2013, Theorem 5.3, p. 21, with Theorem 1.1, p. 2).

**Checks.**

- A trivial action of an infinite amenable group has entropy zero and pressure `max φ`.
- ℤᵈ full shifts have the same entropy per site for boxes of different aspect ratios when all
  side lengths tend to infinity.
- For the shift action of `ℤ` on `ℤ → Fin 2`, `actionTopologicalEntropy` is `log 2`, the
  `coverEntropy` of §5.2 item 4, and the potential `φ x = a` if `x 0 = 0`, `b` otherwise, has
  `actionTopologicalPressure` equal to `log (exp a + exp b)`, the value of §5.4's Check.

*Needs:* §§0.5, 4.6, 5.2–5.4; Mathlib finite covers and compact uniformity.

### Examples

The identity, isometries and rotations, the doubling map, full shifts and the golden-mean shift,
toral endomorphisms, linear flows on tori, trivial actions and full shifts of countably infinite
amenable groups.

### Dependencies

Layer 0; §4.6's limit lemma for §5.6; Mathlib topological entropy, `spectralRadius` and `Flow`.

## Layer 6: Measure entropy of continuous maps

### 6.1 Small partitions and expansive maps

For a Borel probability `μ` on a compact metric space, ArithmeticDynamics §2.7 supplies, for every
`ε > 0`, finite Borel partitions with atom diameters `< ε` and `μ`-null boundaries. Prove: for a
Borel measurable `T` on a compact metric space and every `T`-invariant Borel probability `ν`,
`h_ν(T) = lim_{k} h_ν(T, ξ_k)` for any sequence of finite Borel partitions with diameters tending
to 0 (Sarig2023, Proposition 4.5, p. 112); for an expansive homeomorphism with constant `δ`, every
finite partition with diameters `< δ` is a two-sided generator for every invariant measure, and for
a positively expansive map a one-sided generator.

**Goodwyn's inequality** `(h_ν(T) : EReal) ≤ coverEntropy T univ` for continuous `T` and every
`ν ∈ invariantProbabilities T` (Sarig2023, Theorem 4.7, p. 119), and for ergodic `ν` and every
Borel `Y` with `ν Y > 0` the bound by `Dynamics.coverEntropyInf T Y`, are ArithmeticDynamics §2.7's
and are used here as stated there.

**Checks.**

- The one-sided full shift on two symbols with `d(x, y) = 2^(-min {k | x k ≠ y k})` is positively
  expansive with constant `3/4`; the partition by `x 0` has atom diameter `1/2 < 3/4` and is a
  one-sided generator for every invariant measure.
- For the doubling map on `UnitAddCircle` with `volume`, the partitions into `2^k` dyadic arcs have
  diameters `2^(-k) → 0` and every rate is `log 2 = h`; for the identity map the same partitions
  have rate 0, so the limit sees the dynamics and not the partition entropies `k log 2`.
- For the full shift on two symbols, Goodwyn's inequality is an equality `log 2 = log 2` for the
  uniform Bernoulli measure and strict, `0 < log 2`, for the Dirac mass at the fixed point `000…`.

*Needs:* §§4.2, 5.2–5.3; ArithmeticDynamics §2.7 (small partitions, Goodwyn's inequality);
GeometryOfNumbersAndQuadraticArithmetic §4.2.

### 6.2 Upper semicontinuity of the entropy map

Prove that `ν ↦ h_ν(T)` is upper semicontinuous on `invariantProbabilities T` for expansive
homeomorphisms (Walters1982, Theorem 8.2) and positively expansive maps. Route: given `ν`, take a
generator `ξ` with `ν`-null boundaries; then `ν' ↦ H_ν'(ξ^n)` is continuous at `ν`, and
`h_ν'(T) = inf_n H_ν'(ξ^n)/n` is an infimum of functions continuous at `ν`.

Prove **Jacobs' theorem** for mixtures: on a compact metric space, for a measurable family `s ↦ ν_s`
of invariant probabilities indexed by a probability space `(S, ρ)`,
`h_{∫ ν_s dρ}(T) = ∫⁻ h_{ν_s}(T) dρ` (Walters1982, Theorem 8.4, for the ergodic decomposition).
Route: ArithmeticDynamics §2.7's ergodic decomposition with entropy integration applied to the
mixture and to each `ν_s`, and uniqueness of the ergodic decomposition.

**Checks.**

- For the identity on `[0, 1]` the map is identically 0 and upper semicontinuous.
- For the full shift, the Dirac mass at the fixed point `000…` is a limit of Bernoulli measures
  `(1-1/k, 1/k)` whose entropies tend to 0, consistent with upper semicontinuity.

*Needs:* §6.1; ArithmeticDynamics §2.7 (ergodic decomposition).

### 6.3 Brin–Katok

For a Borel probability `ν` on a compact metric space and `T : X → X`, define the lower local
entropy `lowerLocalEntropy ν T x = sup_{ε > 0} liminf_{n → ∞} I(ν(B_n(x, ε))) / n : ℝ≥0∞`, with
the Bowen balls and the information `I` of the conventions, and the upper local entropy
`upperLocalEntropy ν T x` with `limsup` in place of `liminf`. Prove the **Brin–Katok local entropy
formula** (`brinKatok`): for continuous `T` and `ν ∈ invariantProbabilities T`, the two functions agree
`ν`-almost everywhere, are `T`-invariant, and `∫⁻ x, lowerLocalEntropy ν T x ∂ν = h_ν(T)`; for
ergodic `ν` they equal `h_ν(T)` almost everywhere.

Route: the upper bound from the Shannon–McMillan–Breiman theorem (ArithmeticDynamics §2.7, §4.10)
for a partition with small diameter and null boundary, comparing Bowen balls with partition atoms
off a set of small measure; the lower bound by a covering argument (BrinKatok1983, *On local
entropy*, Lecture Notes in Math. 1007, pp. 30–38).

**Checks.**

- For an isometry `B_n(x, ε) = B(x, ε)`, so both local entropies are 0, as is the entropy.
- For the one-sided full shift on two symbols with `d(x, y) = 2^(-min {k | x k ≠ y k})` and the
  uniform Bernoulli measure, `B_n(x, 2^(-m))` is the cylinder of the first `n + m` coordinates of
  `x`, of measure `2^(-(n+m))`, so both local entropies are `log 2 = h`.
- With the ball `B(x, ε)` in place of the Bowen ball the quotients tend to 0 for every system, so
  the full shift would wrongly get local entropy 0.

*Needs:* §6.1; ArithmeticDynamics §2.7 and §4.10 (Shannon–McMillan–Breiman);
GeometryOfNumbersAndQuadraticArithmetic §4.2.

### 6.4 Abramov's formula for measurable flows and toral entropy

For a jointly measurable probability-preserving real flow on a standard Borel space, prove
`h_μ(ϕ t) = |t| * h_μ(ϕ 1)` (`measureEntropy_flow`) for every real `t`, with `ℝ≥0∞` arithmetic
including `t = 0` and
infinite entropy. Establish a measurable-flow proof by comparing finite-partition information
at different time meshes and approximating measurable observables using strong continuity
of Koopman. Supply these partition approximation and mesh comparison lemmas (Abramov's
entropy-of-a-flow theorem: Abramov, *On the entropy of a flow*, Dokl. Akad. Nauk SSSR 128
(1959), 873–875). The compact continuous result is a specialization; its local-entropy
proof via §6.3 and the Bowen-ball comparison of §5.5 gives the compatibility check.

For §3.3's suspension over an invertible base with positive integrable roof, ergodic or not, prove
`h_susp(ϕ 1) = h_μ(T) / ∫ r dμ`. Supply the return-section information comparison, using §4.4
for discrete induced maps and finite-step approximations to the roof; prove stability under
these approximations and changes on null sets. Thus the time-`t` entropy is
`|t| * h_μ(T) / ∫ r dμ`.

Prove that `volume` has entropy `∑_{|λ|>1} log |λ|` for `toralEndomorphism A` (`A.det ≠ 0`;
`measureEntropy_toralEndomorphism`), the sum over the complex eigenvalues with multiplicity:
Bowen balls are translates of the Bowen ball at `0`, whose volume is computed from the Jordan form
of `A` up to factors subexponential in `n`; combine with Brin–Katok and Layer 5.2's upper bound to
get `h_volume = coverEntropy (toralEndomorphism A) univ`.

Prove that every invariant probability of an isometry of a compact metric space, in particular of
a rotation of a compact metrizable abelian group, has entropy 0, from Layer 5.2's `h_top = 0` and
ArithmeticDynamics §2.7's inequality `h_μ ≤ h_top`.

**Checks.**

- The cat map has entropy `log ((3 + √5)/2)` for `volume`, equal to its topological entropy.
- For a linear flow on a torus, every `h_ν(ϕ t)` is 0.

*Needs:* §§0.2, 3.3–3.4, 4.1–4.4, 5.2, 5.5, 6.3; GeometryOfNumbersAndQuadraticArithmetic §4.2;
ArithmeticDynamics §2.7; the Abramov partition and suspension comparisons above.

### Examples

Full shifts with Bernoulli measures, the doubling map with dyadic partitions, isometries and
rotations, the cat map and toral endomorphisms, linear flows on tori and suspension flows.

### Dependencies

Layers 3–5; GeometryOfNumbersAndQuadraticArithmetic §4.2; ArithmeticDynamics §2.7.

## Layer 7: Variational principles

### 7.1 The variational principle for pressure

For continuous `T` on a compact metric space and `φ : C(X, ℝ)`, prove
(`topologicalPressure_eq_iSup` for the first equality; Walters1982, Theorem 9.10, as cited in
Chung2013, p. 2)

```text
topologicalPressure T φ = ⨆ ν ∈ invariantProbabilities T, (h_ν(T) : EReal) + ∫ φ dν
                        = ⨆ ν ∈ invariantProbabilities T, Ergodic T ν → (h_ν(T) : EReal) + ∫ φ dν
```

The inequality `≥` is the partition argument of ArithmeticDynamics §2.7's `h_ν(T) ≤ h_top(T)` with
weights (Misiurewicz1976, §3, Part I, p. 150). The inequality `≤` is Misiurewicz's construction:
weak limits of the weighted empirical measures on maximal separated sets, with a partition whose
boundary is null for the limit (Misiurewicz1976, §3, Part II, p. 152). The ergodic form follows
from ArithmeticDynamics §2.7's ergodic decomposition with entropy integration.

**Checks.**

- For the identity on a nonempty finite set `F`, every invariant measure has entropy zero; the
  supremum is `max φ` and is attained precisely by probabilities supported on its maximizers.
- For a full shift with a coordinate potential, Gibbs' inequality gives the Bernoulli weights
  proportional to `exp (φ a)`.

*Needs:* §§5.4, 6.1; ArithmeticDynamics §2.7; GeometryOfNumbersAndQuadraticArithmetic §4.2.

### 7.2 The variational principle for entropy

Prove `coverEntropy T univ = ⨆ ν ∈ invariantProbabilities T, (h_ν(T) : EReal)`
(`coverEntropy_eq_iSup`), and the same over
ergodic `ν`, as the case `φ = 0` of 7.1.

**Checks.**

- For the full shift on `k` symbols, the uniform Bernoulli measure attains `log k`.

*Needs:* §7.1.

### 7.3 The variational principle for flows

For `ϕ : Flow ℝ X` on a nonempty compact metric space and `F : C(X, ℝ)`,
prove (`flowTopologicalPressure_eq_iSup`)

```text
flowTopologicalPressure ϕ F = ⨆ ν ∈ flowInvariantProbabilities ϕ, (h_ν(ϕ 1) : EReal) + ∫ F dν.
```

Route: 7.1 for the time-1 map with `F₁` (Layer 5.5). For its invariant probability `ν`,
let `ν̄ = ∫_0^1 (ϕ s)_*ν ds` (Layer 3.4) and prove
`∫ F dν̄ = ∫ F₁ dν`. Every translated measure is conjugate to `ν` for the time-1 map, so
Jacobs' formula of §6.2 gives `h_ν̄(ϕ 1) = ∫⁻_0^1 h_((ϕ s)_*ν)(ϕ 1) ds = h_ν(ϕ 1)` even
when this value is infinite. The potential integral is finite, so the `EReal` comparison uses
`⊤ + finite = ⊤` and no subtraction of infinite quantities. There is no finite-entropy hypothesis.

**Checks.**

- For the linear flow on `UnitAddCircle`, the only flow-invariant probability is `volume`, so the
  right side is `∫ F d volume`; compare with Layer 5.5.

*Needs:* §§3.4, 5.5, 6.2, 7.1.

### 7.4 Amenable variational principles

For a continuous action of a countably infinite discrete amenable group `G` on a nonempty
compact metrizable space and `φ : C(X, ℝ)`, prove (`actionTopologicalPressure_eq_iSup`;
MoulinOllagnier1985, Theorem 5.2.7, as cited in Chung2013, p. 2)

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

**Checks.**

- For the finite-alphabet ℤᵈ full shift, uniform Bernoulli measure attains `log #α`.
- For a coordinate potential the Bernoulli measure with Gibbs weights attains `log ∑ exp φ`.

*Needs:* §§0.6, 4.6–4.7, 5.6; ArithmeticDynamics §2.7 (null-boundary partitions); the weighted
boundary comparison above.

### Examples

The identity on a finite set, full shifts with coordinate potentials, the linear flow on
`UnitAddCircle`, and full shifts of `ℤᵈ`.

### Dependencies

Layers 3–6; GeometryOfNumbersAndQuadraticArithmetic §4.2; ArithmeticDynamics §2.7.

## Layer 8: Equilibrium states and measures of maximal entropy

### 8.1 Definitions

For `T : X → X` on a space with a uniform structure and a σ-algebra, and `φ : C(X, ℝ)` (the
theorems of this layer take `T` continuous and `X` a nonempty compact metric space with its Borel
σ-algebra, or a subshift of finite type with its product uniformity and product σ-algebra):

- `IsEquilibriumState T φ ν`: `ν ∈ invariantProbabilities T` and
  `(h_ν(T) : EReal) + ∫ φ dν = topologicalPressure T φ`;
- `IsMeasureOfMaximalEntropy T ν`: `ν ∈ invariantProbabilities T` and
  `(h_ν(T) : EReal) = coverEntropy T univ`.

For `ϕ : Flow ℝ X` on a metric space `X` with a σ-algebra and `F : C(X, ℝ)`:

- `IsFlowEquilibriumState ϕ F ν`: `ν ∈ flowInvariantProbabilities ϕ` and
  `(h_ν(ϕ 1) : EReal) + ∫ F dν = flowTopologicalPressure ϕ F`.

These definitions use extended-valued equalities and impose no finite-entropy hypothesis.
By Layer 7 these are the measures attaining the suprema; prove that equilibrium states are exactly
the invariant probabilities attaining the supremum of §7.1, and the flow analogue for §7.3. Prove `IsMeasureOfMaximalEntropy T ν ↔
IsEquilibriumState T 0 ν`, and that `IsFlowEquilibriumState ϕ F ν` iff `ν` is flow invariant and
`IsEquilibriumState (ϕ 1) F₁ ν`.

**Agreement with finite-entropy formulations.** Textbooks often assume `h_top(T) < ∞` (respectively
`h_top(ϕ 1) < ∞`) and define pressure as the real number
`sup_ν (h_ν(T) + ∫ φ dν)`, equilibrium states and measures of maximal entropy by real equalities.
Assuming `coverEntropy T univ < ⊤`, prove:

1. `h_ν(T) < ⊤` for every `ν ∈ invariantProbabilities T` (Goodwyn's inequality, ArithmeticDynamics
   §2.7), so `(h_ν(T)).toReal` is the entropy;
2. `topologicalPressure T φ` is a real number, and its real value is
   `⨆ ν ∈ invariantProbabilities T, (h_ν(T)).toReal + ∫ φ dν` (a real supremum of a bounded set);
3. `IsEquilibriumState T φ ν` iff `ν` is invariant and
   `(h_ν(T)).toReal + ∫ φ dν = (topologicalPressure T φ).toReal`; `IsMeasureOfMaximalEntropy T ν`
   iff `ν` is invariant and `(h_ν(T)).toReal = (coverEntropy T univ).toReal`
   (`isEquilibriumState_iff_toReal`, `isMeasureOfMaximalEntropy_iff_toReal`);
4. the flow analogues, with `flowInvariantProbabilities ϕ`, `h_ν(ϕ 1)` and
   `flowTopologicalPressure ϕ F`, under `coverEntropy (ϕ 1) univ < ⊤`.

Without the finiteness hypothesis the extended definitions remain meaningful: if
`coverEntropy T univ = ⊤`, every invariant probability of infinite entropy is an equilibrium state
of every potential, and these are the only equilibrium states. Prove this as the statement that
complements items 1–4.

**Checks.**

- For the identity on a nonempty finite set, equilibrium states of `φ` are exactly the
  probabilities supported on the maximizers of `φ`.
- For the same identity map, uniqueness of the equilibrium state holds exactly when the maximizer
  of `φ` is unique.
- Every invariant probability of the identity on a compact space is a measure of maximal entropy
  (`h_top = 0`).

*Needs:* Layer 7; ArithmeticDynamics §2.7 (Goodwyn's inequality, item 1).

### 8.2 Structure of the set of equilibrium states

Prove for continuous `T` on a nonempty compact metric space, with finiteness imposed per item:

1. if topological entropy is finite, the set of equilibrium states of `φ` is convex, and its
   extreme points are exactly its ergodic members; almost every ergodic component of an
   equilibrium state is an equilibrium state (ArithmeticDynamics §2.7's ergodic decomposition); in
   particular `T` has a unique measure of maximal entropy
   iff it has at least one and exactly one ergodic one;
2. if `ν ↦ h_ν(T)` is upper semicontinuous on `invariantProbabilities T` (for instance `T` expansive,
   Layer 6.2), every `φ` has an equilibrium state (`exists_isEquilibriumState`), and the set of
   equilibrium states is compact;
3. potentials differing by a coboundary `ψ ∘ T - ψ` (`ψ : C(X, ℝ)`) plus a constant have the same
   equilibrium states;
4. for a homeomorphism, measures of maximal entropy of `T` and `T.symm` coincide;
5. if topological entropy is finite, `ν` is an equilibrium state of `φ` iff `ν` is a tangent
   functional to `P(T, ·)` at `φ`
   (`∫ ψ dν ≤ P(T, φ + ψ) - P(T, φ)` for all `ψ`), the converse direction assuming upper
   semicontinuity (Walters1982, Theorems 9.14 and 9.15);
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
  Walters1982, Theorem 9.16, for the two-sided shift, as cited in Chung2013, pp. 21 and 23).
- For every `toralEndomorphism A` with `A.det ≠ 0`, `volume` is a measure of maximal entropy
  (Layer 6.4).
- A rotation of a compact metrizable abelian group: every invariant probability is a measure of
  maximal entropy.
- **Nonexistence (Misiurewicz type).** Construct a homeomorphism of a compact metric space with
  finite topological entropy and no measure of maximal entropy, and prove both properties. Take
  for `X_k` the two-sided subshift of finite type in `ℤ → Fin 2` forbidding `k` consecutive `1`s,
  with entropy `log λ_k` increasing strictly to `log 2` (for `k ≥ 2` its recoding by words of
  length `k - 1` is a conjugate one-step subshift of finite type, to which §5.2 item 4 applies;
  `X_1` is a fixed point and `λ_1 = 1`), rescale its metric by
  `2⁻ᵏ`, and let `X` be the one-point compactification of the disjoint union of the `X_k`, the
  added point fixed. Then `coverEntropy T univ = log 2` (every ergodic measure lives on one `X_k`
  or is the Dirac mass at the added point; §7.2's ergodic form), and no invariant probability has
  entropy `log 2` (§4.1 item 4 and Jacobs' formula for the decomposition along the pieces). The
  entropy map is not upper semicontinuous at the Dirac mass, consistent with item 2.
  Misiurewicz's `C^r` diffeomorphisms without measures of maximal entropy belong to smooth
  dynamics and are outside this roadmap.

*Needs:* §§6.2, 6.4, 7.1–7.3, 8.1; ArithmeticDynamics §2.7.

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

**Checks.**

- The finite-alphabet full shift of every countably infinite amenable group has uniform Bernoulli
  measure as its unique measure of maximal entropy.
- A coordinate potential has the unique Bernoulli equilibrium state with Gibbs weights (Chung2013,
  Theorem 5.3, p. 21, with Theorem 1.1, p. 2, for the pressure and the equilibrium state;
  uniqueness as remarked there on p. 23); prove uniqueness from entropy equality and independence
  of finite coordinate labels.
- For the trivial action of a countably infinite amenable group on a nonempty finite set, every
  probability is invariant of entropy 0 (§4.6) and the pressure is `max φ` (§5.6), so the
  equilibrium states of `φ` are the probabilities supported on its maximizers, as for the identity
  map in §8.1.

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
then `φ` has exactly one equilibrium state `μ_φ` (`existsUnique_isEquilibriumState`); it is
ergodic, gives positive mass to every
nonempty open set, is a Gibbs measure, and is the weak limit of the periodic-orbit measures
`(∑_{T^p x = x} exp (S_p φ x))⁻¹ ∑_{T^p x = x} exp (S_p φ x) δ_x`; moreover
`topologicalPressure T φ = lim (1/p) log ∑_{T^p x = x} exp (S_p φ x)`. Route (Bowen, *Some
systems with unique equilibrium states*, 1974): the specification counting estimates for
separated sets, the Gibbs property of any weak limit of the periodic-orbit measures, ergodicity
from the Gibbs property and specification, and uniqueness because an equilibrium state singular
to `μ_φ` would violate the Gibbs upper bound on a set separating them. Finite topological entropy
holds by expansiveness (§5.3), so §8.1's real formulation applies.

**Subshifts of finite type.** For a finite nonempty alphabet `ι` and `A : ι → ι → Bool`, define the
two-sided SFT `sftTwoSided A ⊆ ℤ → ι` of sequences with `A (x n) (x (n + 1))` for all `n`, with its
shift `sftShiftTwoSided A`, and the one-sided `sftOneSided A ⊆ ℕ → ι` with its shift `sftShift A`,
both `(σ x) n = x (n + 1)`; prove that `sftTwoSided A` is the carrier of a Mathlib `Subshift`, and
give them the metrics `d_θ x y = θ ^ (min {|n| : x n ≠ y n})` for `θ ∈ (0, 1)`, compatible with the
product topology. Call `A` *irreducible* if for all `i, j` some power of the `0`-`1` matrix of `A`
has positive `(i, j)` entry, and *aperiodic* (primitive) if one power is entrywise positive. Prove:

1. the shift on `sftTwoSided A` is expansive. After deleting the symbols that occur in no
   bi-infinite sequence, it is topologically transitive iff `A` is irreducible, and topologically
   mixing iff `A` is aperiodic;
2. for aperiodic `A`, the shift has specification;
3. for irreducible `A` of period `d`, the space splits into `d` clopen sets cyclically permuted by
   the shift, on each of which the `d`-th iterate is conjugate to an aperiodic SFT (spectral
   decomposition);
4. every `θ'`-Hölder function for `d_θ` has the Bowen property.

Hence, **for irreducible `A`, every Hölder potential on `sftTwoSided A` has a unique equilibrium
state** (`existsUnique_isEquilibriumState_sftTwoSided`), ergodic, Gibbs and fully supported: for
aperiodic `A` by Bowen's theorem, and for irreducible `A` by applying it to the `d`-th iterate on
one piece with potential `S_d φ`, and spreading the equilibrium state over the `d` pieces (§4.1 item
2 and §5.4 item 4). The same holds on `sftOneSided A`
(`existsUnique_isEquilibriumState_sftOneSided`): the natural extension of `sftShift A` (§0.7) is the
shift on `sftTwoSided A`, once a history is identified with the bi-infinite sequence it determines,
and it matches the invariant probabilities, entropies (§4.2) and integrals of `φ` and of its lift on
the two sides, so by §7.1 the pressures and the equilibrium states correspond.

**Checks.**

- The full shift on `Fin k` and a potential depending on `x 0`: `μ_φ` is the Bernoulli measure
  with weights proportional to `exp (φ i)`, as in §8.2.
- For the golden-mean shift and `φ = 0`, `μ_0` is the Parry measure (§8.6) and its entropy is
  `log ((1 + √5)/2)`.
- The identity on a two-point space is expansive but has no specification and two measures of
  maximal entropy. The disjoint union of two full shifts on `Fin 2` is expansive, has no
  specification, and has two ergodic measures of maximal entropy.
- The two-sided full shift on `Fin 2` with `d x y = 2^(-min {|k| : x k ≠ y k})` has specification:
  for `m ≥ 1` and `2^(-m) ≤ ε`, `M = 2m - 1` works, since it suffices that `y` copy `x_i` on the
  windows `[a_i - m + 1, b_i + m - 1]`, which are disjoint and fit into one period `p`, and any
  word of length `p` extends to a `p`-periodic point.
- On the same shift, a potential depending only on `x 0` has the Bowen property with `ε = 1/2` and
  `K = 0`, since `dist (T^k x) (T^k y) ≤ 1/2` for `k < n` forces `x k = y k` for `k < n`. The
  continuous potential `φ x = 1 / (1 + min {k ≥ 0 | x k = 1})`, with `φ x = 0` when `x k = 0` for
  all `k ≥ 0`, lacks it: for `ε > 0` take `m` with `2^(-m) ≤ ε`; the point `x = 000…` and the point
  `y` with a single `1`, at coordinate `n + m - 1`, satisfy `dist (T^k x) (T^k y) ≤ ε` for `k < n`,
  while `S_n φ y - S_n φ x = ∑_{j=m+1}^{n+m} 1/j → ∞`.
- The identity of `[0, 1]` with `φ x = x` lacks the Bowen property: points at distance `η ≤ ε` stay
  `ε`-close, while `|S_n φ x - S_n φ y| = n η`.
- On the same shift with `2^(-m-1) < ε ≤ 2^(-m)`, `B_n(x, ε)` is the cylinder fixing the
  coordinates `-m, …, n - 1 + m`. For `φ = 0` the uniform Bernoulli measure gives it mass
  `2^(-(n + 2m))` against `exp (-n log 2) = 2^(-n)`, so it is a Gibbs measure with `K = 4^m`. For
  `φ` depending on `x 0`, the Bernoulli measure with `p_i ∝ exp (φ i)` has ratio the product of
  `p_(x k)` over the `2m` coordinates outside `[0, n)`, in `[(min p)^(2m), 1]`. The Dirac mass at
  `000…` is not a Gibbs measure for `φ = 0`: it gives `B_n(111…, ε)` mass `0`.
- For `ι = Fin 2` with `A 0 0 = A 0 1 = true` and `A 1 j = false`, `sftTwoSided A` is the single
  fixed point `000…`, which is topologically mixing, while every power of the `0`-`1` matrix of `A`
  has zero second row, so `A` is not aperiodic; deleting the symbol `1`, which occurs in no
  bi-infinite sequence, leaves the aperiodic matrix `(1)`.

*Needs:* §§0.3, 0.7, 4.2, 5.2–5.4, 7.1, 8.1–8.2; Mathlib `Subshift`, `HolderWith`.

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
  `|∫_0^t F (ϕ s x) ds - ∫_0^t F (ϕ s y) ds| ≤ K` whenever `t ≥ 0` and `dist (ϕ s x) (ϕ s y) ≤ ε`
  for `s ∈ [0, t]`.

Prove the flow version of Bowen's theorem (Franco, *Flows with unique equilibrium states*, 1977):
an expansive flow with specification and a potential with the flow Bowen property has exactly one
flow equilibrium state (`existsUnique_isFlowEquilibriumState`); it is ergodic and gives positive
mass to every nonempty open set.
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
- The linear flow on `UnitAddTorus (Fin 2)` with direction `(1, √2)` is not expansive: for
  `ε = 1/2` and any `δ > 0`, take `y = x + (η, 0)` with `0 < |η| < min δ (1/2)` and `s t = t`; then
  `dist (ϕ t x) (ϕ t y) = |η| < δ` for every `t`, while `y = ϕ u x` would need `u √2 ∈ ℤ` and
  `u ≡ η` mod 1, impossible for `|u| < 1/2`.
- The unit-speed flow on `UnitAddCircle`, a single closed orbit, is expansive: with
  `δ = min ε (1/2)`, the hypothesis at `t = 0` gives `dist x y < δ`, so `y = ϕ u x` with
  `|u| = dist x y < ε`.
- The trivial flow `ϕ t x = x` on two points `a`, `b` is expansive: with `δ ≤ dist a b`, the
  hypothesis at `t = 0` gives `dist x y < δ`, so `y = x = ϕ 0 x`.
- The unit-speed flow on `UnitAddCircle` has no flow specification: every point returns exactly at
  integer times, and for `ε < 1/2` and `p = n + 1/2` no `|τ| ≤ ε` puts `p + τ` in `ℤ`. The trivial
  flow on one point has flow specification; the trivial flow on two points at distance `> 2ε` does
  not, since `y` would have to be `ε`-close to both.
- For the unit-speed flow on `UnitAddCircle`, every continuous `F` has the flow Bowen property for
  every `ε`, with `K = 2 ‖F‖_∞`: for `t ≥ 0`,
  `∫_0^t F (x + s) ds = ⌊t⌋ ∫ F + ∫_0^(t - ⌊t⌋) F (x + s) ds`. The trivial flow on `[0, 1]` with
  `F x = x` lacks it: points at distance `η ≤ ε` give integrals differing by `t η`.
- For the trivial flow on two points `a`, `b` and `F` the indicator of `{a}`, every `ε < dist a b`
  works with `K = 0`, since closeness at `s = 0` forces `x = y`. The condition constrains only
  `t ≥ 0`: at `t = -n` the integrals along `a` and `b` differ by `n`, so no `K` would bound them.

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
2. **The transfer operator.** For `φ ∈ F_θ` define
   `ruelleOperator A φ f x = ∑_{σ y = x} exp (φ y) f y` on `C(Σ⁺, ℝ)`, the preimages being the
   sequences `consSeq i x = (i, x 0, x 1, …)` with `A i (x 0)`; prove it is a positive bounded operator preserving `F_θ`, with
   `(L^n f) x = ∑_{σ^n y = x} exp (S_n φ y) f y` and the Lasota–Yorke inequality
   `Lip (L^n f) ≤ C ‖L^n 1‖_∞ (θ^n Lip f + ‖f‖_∞)` (ParryPollicott1990, Proposition 2.1, p. 19, in
   the normalised case `L 1 = 1`).
3. **RPF theorem** (`exists_ruelleOperator_eigen` states the eigendata, the pressure identity and
   the uniform convergence). For `φ ∈ F_θ` there are `λ > 0`, a strictly positive `h ∈ F_θ` and a
   Borel probability `ν` with `L h = λ h`, `L* ν = λ ν`, `∫ h dν = 1`, `λ^(-n) L^n f → h ∫ f dν`
   uniformly for every `f ∈ C(Σ⁺, ℝ)`, and exponentially fast in `F_θ` for `f ∈ F_θ`; moreover
   `topologicalPressure (sftShift A) φ = log λ`, a finite value. Route: for locally constant `φ`
   depending on `m` coordinates, `L` acts on functions of `m` coordinates as a primitive matrix and
   item 1 applies; for general `φ`, contract the cone `{f > 0 | f x ≤ exp (K d_θ x y) f y}` in
   Hilbert's projective metric by ProbabilisticAndMetricNumberTheoryPartII §3.3's
   `birkhoff_contraction`, using item 2 and the cylinder structure. (ParryPollicott1990,
   Theorem 2.2, p. 21, for real `φ ∈ F_θ`; Theorem 3.5 and the paragraph after it, pp. 42–43, for
   `log λ` as the variational pressure, which §7.1 identifies with `topologicalPressure`; Bowen,
   *Equilibrium States and the Ergodic Theory of Anosov Diffeomorphisms*, Chapter 1.)
4. **Gibbs measures.** `μ_φ = h ν` is `σ`-invariant, satisfies
   `C⁻¹ ≤ μ_φ [x 0 … x (n-1)] / exp (-n P + S_n φ x) ≤ C`, is the unique equilibrium state of `φ`
   and coincides with §8.4's `μ_φ` (ParryPollicott1990, Proposition 3.2 and Corollary 3.2.1,
   p. 37, for a normalised potential, and Theorem 3.5, pp. 42–43, for uniqueness). It is mixing,
   and exponentially mixing for `F_θ` observables in the sense of §3.6.
5. **Two-sided SFTs.** Prove Sinai's lemma: every `φ ∈ F_θ` on `sftTwoSided A` is
   `ψ + u ∘ σ - u` with `ψ ∈ F_(√θ)` depending only on nonnegative coordinates and `u` continuous
   (ParryPollicott1990, Proposition 1.2, p. 14). The equilibrium state of `φ` is the natural
   extension (§0.7) of the one-sided Gibbs measure of `ψ`, and is exponentially mixing for Hölder
   observables.
6. **Derivative of pressure.** For `φ, ψ ∈ F_θ`, `t ↦ topologicalPressure σ (φ + t ψ)` is real
   differentiable with derivative `∫ ψ dμ_(φ + t ψ)` (ParryPollicott1990, Proposition 4.10, p. 60);
   hence `μ_φ` is the unique tangent functional of §8.2 item 5.

**Checks.**

- Full shift, `φ` depending on `x 0`: `λ = ∑ i, exp (φ i)`, `h = 1`, and `ν = μ_φ` is Bernoulli.
- Golden-mean shift, `φ = 0`: `λ = (1 + √5)/2`, and `μ_0` is the Parry measure
  `μ [i_0 … i_n] = u_(i_0) v_(i_n) / (λ^n (u ⬝ᵥ v))` for the Perron eigenvectors of `!![1,1;1,0]`.
- For `φ = 0`, `log λ = log (spectralRadius ℝ M)` recovers §5.2 item 4.

*Needs:* §§0.7, 3.6, 4.1–4.3, 5.2, 5.4, 7.1, 8.1–8.4; Tau Ceti Birkhoff contraction for positive
matrices (item 1); ProbabilisticAndMetricNumberTheoryPartII §3.3 (`birkhoff_contraction`, item 3);
Mathlib `spectralRadius`, `Subshift`, Arzelà–Ascoli.

### Examples

The identity on finite sets, full shifts and the golden-mean shift with the Parry measure, the
disjoint union of two full shifts, the Misiurewicz-type homeomorphism without a measure of maximal
entropy, suspensions of full shifts with constant and two-valued roofs, and rotations.

### Dependencies

Layers 0, 3–7; ArithmeticDynamics §2.7; Tau Ceti Birkhoff contraction for positive matrices;
ProbabilisticAndMetricNumberTheoryPartII §3.3; Mathlib `Subshift`, `HolderWith`, `spectralRadius`,
`Flow`.

## Downstream consumers

A roadmap on uniformly hyperbolic dynamics consumes §§8.4–8.6: the Bowen–Ruelle theorem for
transitive Anosov flows and diffeomorphisms follows from §8.4's theorem and §8.5's flow version
once expansiveness, specification on the mixing pieces (or a symbolic coding by a suspension of a
subshift of finite type with Hölder roof) and the Bowen property of Hölder potentials are proved.
Billiards with curved or spherical scatterers and the hard-sphere flow consume §3.5's
almost-everywhere flows.

## References

- O. Sarig, [*Lecture Notes on Ergodic Theory*](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf)
  (2023): natural extensions, induced maps, weak mixing, K-systems and entropy, cited by theorem
  number; E. Glasner, *Ergodic Theory via Joinings*, AMS (2003), factors, relative products and
  relative weak mixing.
- M. Hochman, [*Notes on ergodic theory*](https://math.huji.ac.il/~mhochman/courses/ergodic-theory-2012/notes.final.pdf)
  (2012), Proposition 3.4.2 (ergodic measures as extreme points, §3.4), Proposition 4.5.2
  (unique ergodicity, §5.1) and Corollary 6.6.4 (weak mixing and atomless spectral measures,
  §3.2).
- M. Auer, [*Weak mixing and sparse equidistribution*](https://arxiv.org/abs/2408.15238v3),
  arXiv:2408.15238v3 (2024, revised 2025), Theorem 3, p. 5 (weak mixing of the time-1 map of a
  flow, §3.2).
- A. S. Kechris and B. D. Miller, *Topics in Orbit Equivalence*, LNM 1852 (2004),
  Lemma 6.7 (Borel marker sequences).
- T. Ward and Q. Zhang, *The Abramov–Rokhlin entropy addition formula for amenable group
  actions*, [Monatsh. Math. 114 (1992), 317–329](https://doi.org/10.1007/BF01299386)
  (relative entropy and addition).
- D. Creutz, [*Ergodic Theory of Group Actions*](https://www.dcreutz.com/publications/Ergodic_Theory_of_Group_Actions.pdf),
  Chapters 10–13 (amenable averaging, the Koopman representation, representations and mixing).
- D. Ornstein and B. Weiss, *Entropy and isomorphism theorems for actions of amenable groups*,
  J. Analyse Math. 48 (1987), 1–141 (finite quasi-tiling and entropy limit arguments).
- E. Lindenstrauss, [*Pointwise theorems for amenable groups*](https://doi.org/10.1007/s002220100162),
  Invent. Math. 146 (2001), 259–295 (tempered pointwise and Shannon–McMillan–Breiman theorems);
  [research announcement](https://www.ams.org/journals/era/1999-05-12/S1079-6762-99-00065-7/S1079-6762-99-00065-7.pdf),
  Electron. Res. Announc. Amer. Math. Soc. 5 (1999), 82–90, cited by theorem number.
- N.-P. Chung, [*Topological pressure and the variational principle for actions of sofic groups*](https://doi.org/10.1017/S0143385712000429),
  Ergodic Theory Dynam. Systems 33 (2013), 1363–1390, §3 (amenable pressure definitions and comparisons),
  cited by the theorem and page numbers of [arXiv:1110.0699v3](https://arxiv.org/abs/1110.0699v3) (2012);
  J. Moulin Ollagnier, *Ergodic Theory and Statistical Mechanics*, LNM 1115 (1985), Chapter 5
  (amenable variational principle).
- L. M. Abramov, *On the entropy of a flow*, Dokl. Akad. Nauk SSSR 128 (1959), 873–875
  (measurable flow scaling and suspension entropy).
- P. Walters, *An Introduction to Ergodic Theory*, Graduate Texts in Mathematics 79, Springer
  (1982): Chapters 8 (entropy of continuous maps) and 9 (pressure, the variational principle and
  equilibrium states).
- I. P. Cornfeld, S. V. Fomin, Ya. G. Sinai, *Ergodic Theory*, Grundlehren 245, Springer (1982):
  Chapters 1 and 11 (special flows).
- T. Downarowicz, *Entropy in Dynamical Systems*, Cambridge University Press (2011): Chapters 1–4,
  6 (variational principle) and 8 (Brin–Katok).
- M. Einsiedler and T. Ward, *Ergodic Theory with a view towards Number Theory*, GTM 259, Springer
  (2011): Chapters 2 (mixing, weak mixing, Wiener's lemma) and 4.
- R. Bowen and D. Ruelle, *The ergodic theory of Axiom A flows*, Invent. Math. 29 (1975): pressure
  of flows and `P_g(F) = P_{g¹}(F₁)`.
- M. Brin and A. Katok, *On local entropy*, Lecture Notes in Math. 1007 (1983).
- R. Bowen, [*Entropy-expansive maps*](https://doi.org/10.1090/S0002-9947-1972-0285689-X),
  Trans. Amer. Math. Soc. 164 (1972), 323–331, Theorem 2.4 and Corollary 2.3 (§5.3).
- R. Bowen, *Some systems with unique equilibrium states*, Math. Systems Theory 8 (1974), 193–202;
  *Equilibrium States and the Ergodic Theory of Anosov Diffeomorphisms*, Lecture Notes in Math. 470,
  Springer (1975), Chapter 1 (§§8.4, 8.6); R. Bowen and P. Walters, *Expansive one-parameter flows*,
  J. Differential Equations 12 (1972), 180–193.
- E. Franco, *Flows with unique equilibrium states*, Amer. J. Math. 99 (1977), 486–514 (§8.5).
- W. Parry and M. Pollicott, [*Zeta Functions and the Periodic Orbit Structure of Hyperbolic
  Dynamics*](http://www.numdam.org/item?id=AST_1990__187-188__1_0), Astérisque 187–188 (1990),
  Chapters 1–4 and 6 (transfer operators, Gibbs measures, the derivative of pressure and suspension
  flows, §§3.3 and 8.6).
- M. Misiurewicz, *Diffeomorphism without any measure with maximal entropy*, Bull. Acad. Polon. Sci.
  21 (1973), 903–910 (context for the check in §8.2).
- M. Misiurewicz, [*A short proof of the variational principle for a `ℤ₊ᴺ` action on a compact
  space*](http://www.numdam.org/item?id=AST_1976__40__147_0), Astérisque 40 (1976), 147–157, §3
  (§7.1).
- G. W. Mackey, *Point realizations of transformation groups*, Illinois J. Math. 6 (1962), 327–335
  (§3.5).
