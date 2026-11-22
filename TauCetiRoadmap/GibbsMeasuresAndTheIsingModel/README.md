# Roadmap: Gibbs measures and the Ising model

**Summary.** This roadmap builds the theory of infinite-volume Gibbs measures of lattice spin
systems with a finite single-site space and applies it to the nearest-neighbour Ising model on
`ℤ^d`.

- Extremal Gibbs measures: an extremal Gibbs measure is the same as one that is trivial on the
  tail σ-algebra, and the same as one with short-range correlations. Distinct extremal measures
  are carried by disjoint tail events. Extremal measures are almost-sure limits of finite-volume
  conditional laws. Every Gibbs measure is a mixture of extremal ones.
- Existence of Gibbs measures for quasilocal specifications, by compactness. Uniqueness as
  insensitivity to boundary conditions. Potentials, their Hamiltonians and Boltzmann kernels,
  and the quasilocal specification of an absolutely summable potential.
- Uniqueness: Dobrushin's contraction criterion with the high-temperature bound it gives for a
  potential, and uniqueness in one dimension under a bounded boundary interaction.
- The Ising model: the FKG inequality and monotonicity in the boundary condition for the
  finite-volume kernels. The plus and minus states as limits, translation-invariant, extremal
  and ergodic, bracketing every Gibbs measure. Uniqueness exactly when the two magnetizations
  agree.
- The phase diagram at zero field: uniqueness in one dimension and at high temperature in every
  dimension, Peierls' contour estimate with spontaneous magnetization in two dimensions, and the
  bounds `0 < β_c(2) ≤ 0.88`.

The nearest roadmaps are these:

- [DimerModelsAndLozengeTilings](../DimerModelsAndLozengeTilings/README.md) supplies the
  vocabulary: Layer 4 builds specifications, Gibbs measures, the tail σ-algebra, the face property
  of invariant Gibbs measures and weak closedness, and names Ising-type models as its consumer.
- ConstructiveFieldTheoryPhi4 owns the Griffiths (GKS) inequalities, the
  Lee–Yang theorem and the free-boundary infinite-volume state of ferromagnetic pair
  interactions. This roadmap builds on none of them; the results that need them are listed under
  *Beyond this roadmap*.
- BernoulliPercolation owns the dual graph of `ℤ²`, the dual cycle that
  surrounds a finite cluster, the count of self-avoiding paths, the percolation form of Peierls'
  argument and Harris's inequality. Peierls' argument for the Ising model in 5.2 takes the
  surrounding cycle and the path count from it.
- MarkovChainMixing owns Glauber dynamics on finite graphs, which samples
  the finite-volume kernels of 4.1.

The roadmap is a synthesis of several texts. The main sources are Friedli–Velenik, *Statistical
Mechanics of Lattice Systems* (2017), Chapters 3 and 6, and Ruelle, *Thermodynamic Formalism*
(2nd ed., 2004), Chapter 1. Koralov–Sinai (Chapter 22) and Ellis (Chapter V) give second routes
to existence and to Peierls' argument, and Grimmett (2018), Chapter 4, gives the Holley
inequality. The layers follow proof dependency, not the order of any one text.

[Suggested.lean](Suggested.lean) states, against the pinned Mathlib and Tau Ceti and each with
`sorry`, the headlines below that carry a Lean name, each with every conclusion this README
attaches to it, together with the definitions their statements need. It is not an exhaustive
acceptance test: the other headlines of this README are targets of the same standing, stated in
prose with their locators or proof routes.

Suggested home: `TauCeti/Probability/Gibbs/` for Layers 1–3, next to the specifications of
DimerModelsAndLozengeTilings Layer 4, and `TauCeti/Probability/Ising/` for Layers 4–5.

## How to read the build

Layer 1 is the general theory of extremal Gibbs measures. It starts where
DimerModelsAndLozengeTilings Layer 4 stops: that roadmap proves that a tail-measurable density
preserves the Gibbs property, and 1.1 proves the converse. Layer 2 proves existence for a
quasilocal specification and builds the specification of a potential. Layer 3 proves the two
uniqueness theorems. Layer 4 specialises to the Ising model, where the FKG inequality orders
everything, and Layer 5 settles the phase diagram at zero field with the tools of Layers 3–4.
Layers 4–5 use Layer 1 only through 4.2 (extremality and ergodicity of the plus state).

Each subsection states its targets with a locator and the printed page, or a proof route for an
adaptation, and a *Needs:* line. Each layer ends with **Checks.**

## Conventions

- Sites form a countable type `I` and spins a finite type `S` with the discrete topology and the
  discrete σ-algebra. Configurations are the points of the full shift `FullShift Γ I S`, the
  subshift `Subshift.univ Γ I S` of all functions `I → S` in the sense of
  DimerModelsAndLozengeTilings 4.4, so that the specifications of that roadmap's 4.5 apply
  verbatim. The group `Γ` acting on `I` matters only for translation invariance; outside 4.2 any
  `Γ` may be used. The statements of 1.1–1.2 use the countability of `I` (through an
  exhaustion) but not the finiteness of `S`.
- A specification is DimerModelsAndLozengeTilings's `Specification`: proper Markov kernels
  `γ_Λ`, indexed by finite `Λ ⊆ I`, measurable for the σ-algebra `𝓕_{Λᶜ}` of the spins outside
  `Λ`, and consistent. A Gibbs measure is a probability measure `μ` with `μ.bind γ_Λ = μ` for
  all `Λ` (`Specification.IsGibbs`).
- Kernels written down by a formula, before their measurability is proved, are raw families
  `κ : Finset I → X → Measure X`. Their DLR condition `IsGibbsFamily κ μ` is the integrated form
  `∫⁻ ω, κ Λ ω A ∂μ = μ A` for measurable `A`. This avoids the junk value of
  `MeasureTheory.Measure.bind` along a map that is not measurable; 2.2 shows that for the
  kernels of a potential the two forms agree.
- The tail σ-algebra `tailSigma Γ I S` is the trace on the full shift of `⋂_Λ 𝓕_{Λᶜ}`, the
  σ-algebra of DimerModelsAndLozengeTilings 4.1.
- Total variation is `sup_A |p(A) − q(A)|`, half the `ℓ¹` distance. Friedli–Velenik use the
  `ℓ¹` distance (p. 287), so their Dobrushin coefficient is twice the one here.
- Ising spins are `Bool`, with `true` the spin `−1` (`spin true = −1`), the convention of the
  finite Ising energies of QuantumOptimization §1.1 and HopfieldNetworks; nothing else passes
  between those energies and the infinite-volume model here. The all-plus configuration
  `plusConfig d` is the constant `false`. In the pointwise order of `Bool` the all-minus
  configuration is on top, so "nondecreasing" below means nondecreasing in the spins, which in
  Lean is `Antitone`, and "more plus spins" is the order `≤` of `Bool`.
- `Site d = Fin d → ℤ`. Translation is `translate a ω = (i ↦ ω(i + a))`. In
  DimerModelsAndLozengeTilings's action of `Multiplicative (Site d)`, `(g • ω)(i) = ω(g⁻¹ • i)`,
  this is the action of `Multiplicative.ofAdd (−a)`.
- The Ising potential at inverse temperature `β` and field `h` is `−β σ_i σ_j` on
  nearest-neighbour pairs and `−h σ_i` on singletons (Friedli–Velenik (6.26), p. 277). The
  Hamiltonian in `Λ` sums the energies of all finite sets meeting `Λ`.
- Quantities that can be infinite are in `ℝ≥0∞`: Dobrushin's coefficient and the critical
  inverse temperature `isingCriticalBeta d`, which is `⊤` in one dimension.

## Layer 1: tail triviality and the extremal Gibbs measures

Throughout, `γ` is a specification on the full shift.

### 1.1 Densities and the tail

- **Gibbs densities are tail-measurable** (`exists_tail_ae_eq_of_isGibbs_withDensity`): if `μ` is
  a Gibbs probability measure, `f ≥ 0` is measurable with `∫ f dμ = 1`, and `f·μ` is Gibbs, then
  `f` agrees `μ`-almost everywhere with a tail-measurable function (Friedli–Velenik, Proposition
  6.61, item 1, p. 305, the direction not owned by DimerModelsAndLozengeTilings 4.6(a)).
- **The tail determines a Gibbs measure** (`eq_of_forall_tail_eq`): two Gibbs probability
  measures that agree on the tail σ-algebra are equal (Friedli–Velenik, Proposition 6.61,
  item 2, p. 305).

*Proof route.* For the first item, `f` is a version of `d(fμ)/dμ`. Gibbsianity of both measures
and properness give `μ[f | 𝓕_{Λᶜ}] = f` almost surely for every `Λ`, so `f` has an
`𝓕_{Λᶜ}`-measurable version for every finite `Λ`. Along an exhaustion, the backward martingale
convergence theorem gives a tail-measurable version. For the second item, compare both measures
with `(μ + ν)/2`: the densities are tail-measurable by the first item, hence determined by the
tail values.

*Needs:* DimerModelsAndLozengeTilings 4.1, 4.5 (the conditional-expectation form of
`Specification.IsGibbs`) and 4.6(a); Mathlib `MeasureTheory.condExp`,
`MeasureTheory.Measure.withDensity`, `MeasureTheory.Measure.rnDeriv`; Tau Ceti's backward
martingale convergence theorem (*Exact supplier contracts*).

### 1.2 Extremal Gibbs measures

- **Extremal Gibbs measure** (`IsExtremalGibbs`): a Gibbs probability measure that is not
  `t ν₁ + (1 − t) ν₂` with `0 < t < 1` and Gibbs probability measures `ν₁, ν₂` other than itself
  (Friedli–Velenik, Definition 6.57, p. 302).
- **Extremal is tail-trivial** (`isExtremalGibbs_iff_tail_trivial`): a Gibbs probability
  measure is extremal if and only if every tail event has measure `0` or `1` (Friedli–Velenik,
  Theorem 6.58, items 1–2, p. 303; Ruelle, Theorem 1.11, (A)⇔(B), p. 20).
- **Short-range correlations** (`IsExtremalGibbs.decorrelation`): for an extremal `μ`, a
  measurable `A` and `ε > 0`, there is a finite `Λ` with `|μ(A ∩ B) − μ(A)μ(B)| ≤ ε` for every
  `B ∈ 𝓕_{Λᶜ}` (Friedli–Velenik, Theorem 6.58, item 4, (6.62), p. 303; Ruelle, Theorem 1.11,
  (C), p. 20).
- **Distinct extremal measures are singular** (`IsExtremalGibbs.exists_tail_separating`): two
  distinct extremal Gibbs measures `μ ≠ ν` admit a tail event `A` with `μ(A) = 0` and
  `ν(A) = 1` (Friedli–Velenik, Lemma 6.62, p. 307; Ruelle, Exercise 3 of Chapter 1, p. 23).
- **Short-range correlations imply extremality** (`isExtremalGibbs_of_decorrelation`): a Gibbs
  probability measure with the property of the third item is extremal (Friedli–Velenik,
  Theorem 6.58, item 4, p. 303).
- Target in prose: extremality is equivalent to every tail-measurable function being almost
  surely constant (Friedli–Velenik, Theorem 6.58, item 3, p. 303).

*Proof route.* Non-extremality of `μ = t ν₁ + (1 − t) ν₂` gives the density `dν₁/dμ ≤ 1/t`,
tail-measurable by 1.1 and not constant, so a level set is a nontrivial tail event. Conversely,
a tail event `T` with `0 < μ(T) < 1` gives `μ = μ(T) μ(·|T) + μ(Tᶜ) μ(·|Tᶜ)`, and both
conditionals are Gibbs by DimerModelsAndLozengeTilings 4.6(a). Decorrelation follows from tail
triviality and backward martingale convergence of `μ[1_A | 𝓕_{Λᶜ}]` to `μ(A)`. For singularity,
1.1 gives a tail event on which the measures differ, and tail triviality makes its masses `0`
and `1`. For the converse of decorrelation, a tail event `T` lies in every `𝓕_{Λᶜ}`, so taking
`A = B = T` gives `|μ(T) − μ(T)²| ≤ ε` for every `ε > 0`, and 1.2 applies.

*Needs:* 1.1; DimerModelsAndLozengeTilings 4.5 (convexity of the Gibbs measures) and 4.6(a).

### 1.3 Limits and the extremal decomposition

- **Extremal measures are limits** (`IsExtremalGibbs.ae_tendsto`): for an extremal `μ` and an
  exhaustion `Λ_n ↑ I`, for `μ`-almost every `ω`, `γ_{Λ_n}(C | ω) → μ(C)` for every cylinder
  event `C` (Friedli–Velenik, Theorem 6.63, p. 307).
- **Extremal decomposition** (`exists_extremalDecomposition`): there is one tail-measurable
  kernel `Q` such that for every Gibbs probability measure `μ`, `Q ω` is extremal for `μ`-almost
  every `ω` and `μ(B) = ∫ Q ω (B) dμ(ω)` for all measurable `B` (Friedli–Velenik, Theorem 6.72,
  p. 318, which states the decomposition as a measure on the extremal set; the kernel form is
  its construction, Proposition 6.69, p. 315, and Corollary 6.71, p. 317).
- Target in prose: uniqueness of the decomposing measure on the extremal Gibbs measures
  (Friedli–Velenik, Theorem 6.72, p. 318), and the Choquet-simplex statement of Ruelle,
  Theorem 1.9(d), p. 18.

*Proof route.* For the first item, backward martingale convergence gives
`γ_{Λ_n}(C|·) = μ[1_C | 𝓕_{Λ_nᶜ}] → μ[1_C | 𝓣] = μ(C)` almost surely, by tail triviality;
countably many cylinder events suffice because `I` is countable and `S` finite. For the
decomposition, take `Q ω` to be the limit along an exhaustion of `γ_{Λ_n}(·|ω)` where it exists
on all cylinders and is extremal, and a fixed extremal measure elsewhere. The limit is a regular
version of `μ[· | 𝓣]` for every Gibbs `μ`, and its values are tail-trivial, hence extremal by 1.2.

*Needs:* 1.1, 1.2; Mathlib's regular conditional probabilities on standard Borel spaces
(`ProbabilityTheory.condDistrib`); Tau Ceti's backward martingale convergence theorem.

**Checks.**

- The independent specification of a law `ν` on `S` (DimerModelsAndLozengeTilings 4.5, Checks)
  has the product `ν^{⊗I}` as its only Gibbs measure. It is extremal and tail-trivial by
  Kolmogorov's zero-one law (DimerModelsAndLozengeTilings 4.3).
- Negative control for the tail hypothesis in 1.1: for the same specification with
  `ν = Bern(1/2)` on `I = ℤ`, the density `2·1_{ω(0)=1}` is not tail-measurable, and its measure
  is not Gibbs.
- Negative control for extremality in the decorrelation statement: for the two-dimensional
  Ising model at `h = 0` and `δ(β) < 1/2` (5.2), `μ = (μ⁺ + μ⁻)/2` is Gibbs and not extremal,
  and with `A = {σ_0 = +1}`, `B_i = {σ_i = +1}` the covariance `μ(A ∩ B_i) − μ(A)μ(B_i)` stays
  bounded away from `0` as `i → ∞` (Friedli–Velenik, Exercise 6.25, pp. 306–307). With
  `m = μ⁺(σ_0) ≥ 1 − 2δ(β)` it tends to `m²/4 > 0`.
- Extremality is relative to the specification: `ν^{⊗I}` and `ν'^{⊗I}` with `ν ≠ ν'` are both
  tail-trivial, but they are Gibbs for different specifications. Their midpoint is Gibbs for
  neither specification and is not tail-trivial: the tail event that the empirical frequencies of
  the spins converge to those of `ν` has measure `1/2`.

## Layer 2: existence and Gibbsian specifications

### 2.1 Existence and uniqueness by compactness

- **Existence** (`exists_isGibbs_of_isQuasilocal`): a quasilocal specification on a finite spin
  space has a Gibbs probability measure (Friedli–Velenik, Theorem 6.26, p. 284; Ruelle,
  Theorem 1.9(a)–(b), p. 18; Koralov–Sinai, Theorem 22.3, p. 344, for finite-range potentials).
- **Uniqueness as boundary insensitivity** (`isGibbs_unique_iff_tendsto`): for a quasilocal
  specification and a Gibbs probability measure `μ`, `μ` is the only Gibbs probability measure
  if and only if, for every boundary condition `ω` and every exhaustion `Λ_n ↑ I`,
  `γ_{Λ_n}(C | ω) → μ(C)` for every cylinder event `C` (Friedli–Velenik, Lemma 6.30, p. 287).
- Target in prose: every weak limit point of `γ_{Λ_n}(·|ω)` is Gibbs, and the closed convex hull
  of these limits is the set of all Gibbs measures (Ruelle, Theorem 1.9(b)–(c), p. 18).

*Proof route.* The probability measures on the compact full shift form a compact set
(DimerModelsAndLozengeTilings 4.4). A limit point `μ` of `γ_{Λ_n}(·|ω)` satisfies
`μ γ_Λ = μ` for every fixed `Λ`, because `γ_{Λ_n} γ_Λ = γ_{Λ_n}` for `Λ ⊆ Λ_n` and
`ω ↦ γ_Λ(C|ω)` is continuous (quasilocality). For uniqueness, any Gibbs `ν` has
`ν(C) = ∫ γ_{Λ_n}(C|ω) dν(ω)`, which tends to `μ(C)` by dominated convergence; the converse uses
the existence argument along subsequences.

*Needs:* DimerModelsAndLozengeTilings 4.4 and 4.6(c); Mathlib
`MeasureTheory.ProbabilityMeasure` with its weak topology and compactness on a compact space.

### 2.2 Potentials and their specifications

- **Potential** (`Potential`): for each finite `B ⊆ I` a real function `Φ_B` of the
  configuration that depends only on the spins in `B` (Friedli–Velenik, Definition 6.14, p. 277).
- **Absolute summability** (`Potential.IsAbsSummable`): for each site `i`,
  `∑_{B ∋ i} ‖Φ_B‖∞ < ∞` (Friedli–Velenik, (6.25), p. 277), with `‖Φ_B‖∞` given by
  `Potential.supNorm`.
- **Hamiltonian and Gibbs kernel** (`Potential.hamiltonian`, `gibbsKernel`): `H_Λ = ∑_{B ∩ Λ ≠ ∅}
  Φ_B` and the Boltzmann weights `exp(−H_Λ(τ ω_{Λᶜ})) / Z_Λ(ω)` on the configurations `τ ω_{Λᶜ}`
  equal to `ω` off `Λ` (Friedli–Velenik, (6.24), p. 277, and (6.30)–(6.31), p. 278). The
  partition function is `partitionFunction` and the juxtaposition `τ ω_{Λᶜ}` is `juxt`.
- **The Gibbsian specification** (`exists_specification_gibbsKernel`): for an absolutely
  summable potential there is a specification whose kernels are the Gibbs kernels. It is
  quasilocal, and its Gibbs measures are the measures that satisfy `IsGibbsFamily` for the
  Gibbs kernels (Friedli–Velenik, Lemma 6.15, p. 278, for the specification, and Lemma 6.28,
  p. 285, for quasilocality).

*Proof route.* The Gibbs kernel at `ω` depends only on `ω_{Λᶜ}` and is carried by the
configurations equal to `ω` off `Λ`, which gives measurability for `𝓕_{Λᶜ}` and properness.
Consistency is the identity `H_Δ = H_Λ + (terms not involving the spins in Λ)` for `Λ ⊆ Δ`.
Quasilocality is uniform convergence of the truncated Hamiltonians under absolute summability.
The equivalence of the two DLR forms is `MeasureTheory.Measure.bind_apply` for a measurable
kernel.

*Needs:* DimerModelsAndLozengeTilings 4.5; Mathlib `ProbabilityTheory.Kernel.IsProper`,
`MeasureTheory.Measure.bind_apply`, `tsum`.

**Checks.**

- Negative control for quasilocality (Friedli–Velenik, Exercise 6.15, p. 286): the
  specification describing a single `+` spin in a sea of `−` spins is consistent and proper, is
  not quasilocal, and has no Gibbs measure. So the hypothesis of 2.1 cannot be dropped.
- For the zero potential, the Gibbs kernel at `Λ` is uniform on the `|S|^{|Λ|}` completions, the
  specification is the independent one of the uniform law, and its only Gibbs measure is the
  uniform product measure.
- For the one-site potential `Φ_{{i}}(ω) = −h σ_i` on `Bool`, the kernel at `{i}` gives `+1`
  probability `e^h / (e^h + e^{−h})`, which is `0.8808` at `h = 1`. A sign error in the
  Boltzmann weight would give `0.1192`.
- The Hamiltonian counts every set meeting `Λ`, the boundary interaction included: for the Ising
  potential at `h = 0` on `Λ = {0}` in `d = 1` with plus boundary condition, `H_Λ(+) = −2β` and
  `H_Λ(−) = 2β`. Dropping the boundary would make both zero.

## Layer 3: uniqueness

### 3.1 Dobrushin's criterion

- **Dobrushin's coefficient** (`dobrushinCoeff`): `c_{ij} = sup` over pairs `ω, ω'` that agree
  off `j` of the total variation distance of the laws of the spin at `i`,
  `sup_{A ⊆ S} |γ_{{i}}(σ_i ∈ A|ω) − γ_{{i}}(σ_i ∈ A|ω')|`, in `ℝ≥0∞` (Friedli–Velenik, p. 288,
  with half their `ℓ¹` distance).
- **Dobrushin's uniqueness theorem** (`existsUnique_isGibbs_of_dobrushin`): a quasilocal
  specification with `sup_i ∑_j c_{ij} < 1` has exactly one Gibbs probability measure. This
  adapts Friedli–Velenik, Theorem 6.31, p. 288, whose `ℓ¹` coefficient makes their hypothesis
  twice as strong.
- **Oscillation bound** (`dobrushinCoeff_gibbsKernel_le`): for an absolutely summable potential
  and `i ≠ j`, `c_{ij} ≤ ½ ∑_{B ∋ i, j} δ(Φ_B)`, with `δ` the oscillation `Potential.osc`. This
  adapts Friedli–Velenik, Theorem 6.35, p. 292, which proves the `ℓ¹` form `∑_{B ∋ i,j} δ(Φ_B)`.
- **High temperature** (`existsUnique_isGibbsFamily_of_highTemperature`): if
  `∑_{B ∋ i} (|B| − 1) ‖Φ_B‖∞ ≤ b` for every `i`, `β ≥ 0` and `2βb < 1`, the potential `βΦ` has
  exactly one Gibbs measure (Friedli–Velenik, Corollary 6.37, p. 293, as stated there).

*Proof route.* Friedli–Velenik's proof of Theorem 6.31 (pp. 288–290) goes through with the
total variation of the Conventions. In Lemma 6.34 they replace a function `f` of the spin at `j`
by `f − m` with `m` the value at `+`; taking `m` as the midpoint of the range halves the bound
and gives the coefficient here. For the oscillation bound, the single-site kernels at `ω` and
`ω'` differ by the tilt `e^{−D}` with `D` the change of energy, whose oscillation is at most
`2 ∑_{B ∋ i,j} δ(Φ_B)`. A tilt of oscillation `r` moves total variation by at most
`tanh(r/4) ≤ r/4`. The high-temperature corollary follows from `δ(βΦ_B) ≤ 2β‖Φ_B‖∞` and from
counting, for each `B ∋ i`, the `|B| − 1` sites `j ≠ i` in `B`.

*Needs:* 2.1, 2.2.

### 3.2 One dimension

- **Bounded boundary interaction** (`existsUnique_isGibbsFamily_of_boundary_bounded`): for an
  absolutely summable potential on `ℤ` with
  `|H_{[−n,n]}(ω) − H_{[−n,n]}(ω')| ≤ D` whenever `ω, ω'` agree on `[−n, n]`, uniformly in `n`,
  there is exactly one Gibbs measure (Friedli–Velenik, Theorem 6.40, (6.54), p. 295; proof
  p. 319).
- **Finite range** (`existsUnique_isGibbsFamily_of_finiteRange_int`): a potential on `ℤ` of
  finite range `R` with `|Φ_B| ≤ M` for all `B` has exactly one Gibbs measure. This adapts
  Friedli–Velenik, Corollary 6.41, p. 295, which omits the uniform bound `M`; the bound and the
  range make the right side of (6.55) at most `2M` times the number of sets of diameter at most
  `R` that cross a given boundary point.

*Proof route.* The bound `D` makes `γ_{[−n,n]}(·|ω)` and `γ_{[−n,n]}(·|ω')` mutually absolutely
continuous with densities in `[e^{−2D}, e^{2D}]` (Friedli–Velenik, Lemma 6.43, p. 296). Two
distinct extremal Gibbs measures are then not singular, which contradicts 1.2. So there is one
extremal Gibbs measure, and by 1.3 one Gibbs measure.

*Needs:* 1.2, 1.3, 2.1, 2.2.

**Checks.**

- Ising at `h = 0`: the coefficient is `c_{ij} = tanh(2β)/2` for nearest neighbours, attained
  where the other `2d − 1` neighbours of `i` sum to `±1` (their sum is odd). At `d = 2`,
  `β = 0.2` this is `0.18997`, below the oscillation bound `½ · 2β = 0.2`.
- Negative control for the laws of the spin at `i`: for the zero potential, `c_{ij} = 0` for all
  `i, j`. A coefficient taken over events of the whole configuration would be `1` for every
  `i ≠ j` (the event `σ_j = ω(j)` has kernel probability `1` at `ω` and `0` at `ω'`), and
  Dobrushin's hypothesis would fail on every lattice with two sites.
- Ising at any field: `c_{ij} ≤ tanh|β|`, the largest increment of `x ↦ tanh(x)/2` over an
  interval of length `2|β|`. At `d = 2`, `β = 0.2`, `h = 0.3` the exact value is `0.19549`, and
  `tanh 0.2 = 0.19738`.
- Thresholds in `d = 2`: Friedli–Velenik's Example 6.36 (`4dβ < 1`) gives `β < 0.125`, the bound
  `2d tanh β < 1` of 5.1 gives `β < 0.2554`, and `d tanh 2β < 1` at `h = 0` gives `β < 0.2747`.
- Negative control for the uniform bound of 3.2: the inhomogeneous nearest-neighbour potential
  `−J_i σ_i σ_{i+1}` on `ℤ`, with `J_i` growing fast enough that `∑ e^{−2J_i} < ∞`, has range `1`
  and more than one Gibbs measure: the spins flip across bond `i` with probability of order
  `e^{−2J_i}`, so by Borel–Cantelli they are eventually constant, and the eventual sign is a
  nontrivial tail variable. Friedli–Velenik's Corollary 6.41 without `M` would claim uniqueness.

## Layer 4: the Ising model

Throughout, `β ≥ 0` unless stated otherwise and `h ∈ ℝ`.

### 4.1 Monotonicity in finite volume

- **Ising potential and kernels** (`isingPotential`, `isingKernel`, `IsIsingGibbs`): the
  nearest-neighbour potential of the Conventions on `Site d`, its Gibbs kernels, and the
  probability measures satisfying the integrated DLR condition for them (Friedli–Velenik,
  (6.26), p. 277, and Definitions 3.1 and 3.3, pp. 83 and 85).
- **FKG inequality** (`isingKernel_fkg`): for nondecreasing `f, g` and any boundary condition
  `ω`, `E[f] E[g] ≤ E[fg]` under `isingKernel d β h Λ ω` (Friedli–Velenik, Theorem 3.21,
  p. 104).
- **Monotone in the boundary condition** (`isingKernel_mono_boundary`): if `η` has more plus
  spins than `ω` (`η ≤ ω`) and `f` is nondecreasing, the expectation of `f` under the kernel with
  boundary condition `ω` is at most that under `η` (Friedli–Velenik, Exercise 3.13, p. 107).
- **Plus boundary is antitone in the volume** (`isingKernel_plus_antitone`): for `Λ₁ ⊆ Λ₂` and
  nondecreasing `f`, the expectation under the plus kernel of `Λ₂` is at most that of `Λ₁`
  (Friedli–Velenik, Lemma 3.22, p. 105).

*Proof route.* The kernel of `Λ` is a product of the Boltzmann weight on `Bool^Λ` and the point
mass off `Λ`. The weight is log-supermodular when `β ≥ 0`, since `σ_iσ_j` is supermodular in the
pair. FKG is Mathlib's `fkg`; monotonicity in the boundary condition is Mathlib's `holley`, the
weight for the larger boundary condition dominating in the four-functions sense (Grimmett 2018,
Theorem 4.4, p. 60). Antitonicity in the volume is the spatial Markov property (Friedli–Velenik,
Exercise 3.11, p. 105) followed by monotonicity in the boundary condition.

*Needs:* 2.2; Mathlib `fkg`, `holley`, `four_functions_theorem`
(`Mathlib/Combinatorics/SetFamily/FourFunctions.lean`).

### 4.2 The plus and minus states

- **Plus and minus states** (`IsPlusState`, `IsMinusState`): a probability measure that is the
  limit on cylinder events of the kernels with the plus (resp. minus) boundary condition along
  every exhaustion.
- **Existence and invariance** (`exists_isPlusState`): for `β ≥ 0` the plus state exists, is
  Gibbs, and is invariant under every translation (Friedli–Velenik, Theorem 3.17, p. 100, for the
  limit and invariance; the proof of Theorem 6.26, p. 284, for the Gibbs property).
- **Spin flip** (`IsPlusState.isMinusState_map_flip`): the global spin flip maps the plus state at
  field `h` to the minus state at field `−h`.
- **Bracketing** (`IsIsingGibbs.integral_between`): every Ising Gibbs measure `ν` satisfies
  `μ⁻(f) ≤ ν(f) ≤ μ⁺(f)` for nondecreasing local `f` (Friedli–Velenik, (6.70), p. 308, and
  Lemma 3.23, p. 106).
- **Extremality** (`IsPlusState.isExtremalGibbs`): the plus state is extremal for the Ising
  specification of 2.2 (Friedli–Velenik, Lemma 6.65, p. 308).
- **Ergodicity** (`IsPlusState.measure_eq_zero_or_one`): for `d ≥ 1`, every
  translation-invariant measurable event has plus-state measure `0` or `1` (Friedli–Velenik,
  Lemma 6.66, p. 310).

*Proof route.* Existence: by 4.1 the plus expectations of nondecreasing local functions decrease
along any exhaustion, and these functions span the local functions (Friedli–Velenik, Lemma 3.19,
p. 101), so the limit exists and does not depend on the exhaustion. Comparing two exhaustions
gives translation invariance. The limit is Gibbs because the kernels at a fixed `Λ` are
continuous (2.2) and consistent. Bracketing integrates 4.1 against `ν` through the DLR
equation. Extremality follows from bracketing: if `μ⁺ = tν₁ + (1−t)ν₂`, both `ν_k ≤ μ⁺` on
nondecreasing local functions forces equality. Ergodicity: for `d ≥ 1` the translations form an
infinite group acting properly, so an invariant event is almost surely a tail event
(DimerModelsAndLozengeTilings 4.2), and the plus state is tail-trivial by 1.2. Equivalently, it
is an extreme invariant Gibbs measure, hence ergodic by DimerModelsAndLozengeTilings 4.6(b).

*Needs:* 1.2, 2.2, 4.1; DimerModelsAndLozengeTilings 4.2 and 4.6(b).

### 4.3 Uniqueness and the magnetization

- **Uniqueness criterion** (`existsUnique_isIsingGibbs_iff`): given the plus and minus states,
  there is exactly one Ising Gibbs measure if and only if `μ⁺ = μ⁻`, and `μ⁺ = μ⁻` if and only
  if `μ⁺(σ_0 = +1) = μ⁻(σ_0 = +1)` (Friedli–Velenik, Theorem 3.28, p. 111, for the limiting
  states, and (6.70), p. 308, for all Gibbs measures).
- **Monotone in the field** (`plusState_magnetization_mono_continuousWithinAt`): `h ↦ μ⁺_h(σ_0 =
  +1)` is nondecreasing and right-continuous (Friedli–Velenik, Lemma 3.31, item 1, p. 113).

*Proof route.* By bracketing, `μ⁺ = μ⁻` pins every Gibbs measure on nondecreasing local
functions, which determine the measure. For the magnetization, `μ⁺(σ_A) ≥ μ⁻(σ_A)` for every
nondecreasing `n_A = ∏_{i∈A} 1_{σ_i=+1}`, and `∑_{i∈A} n_i − n_A` is nondecreasing
(Friedli–Velenik, Exercise 3.10, p. 104). Equal one-point functions with translation invariance
therefore force equal `n_A` for all `A` (Friedli–Velenik, proof of Theorem 3.28, p. 111).
Monotonicity in `h` is FKG applied to the derivative in `h` in finite volume. Right-continuity
is the infimum of the continuous nondecreasing finite-volume functions.

*Needs:* 4.1, 4.2.

**Checks.**

- Brute force on a `2 × 2` box in `ℤ²` with random boundary conditions, `β ∈ [0, 1.5]`,
  `h ∈ [−1, 1]` and random nondecreasing `f, g`: the FKG slack `E[fg] − E[f]E[g]` and the Holley
  slack against the plus boundary condition are nonnegative in 300 trials.
- Negative control for `β ≥ 0`: at `β = −1`, `h = 0` and plus boundary condition on the same box,
  the indicators of `σ = +1` at two neighbouring sites have covariance `−0.0803`, so FKG fails.
- `d = 1`, plus boundary condition outside `[−n, n]`, `h = 0`:
  `μ⁺_{[−n,n]}(σ_0) = 2t^{n+1}/(1 + t^{2(n+1)})` with `t = tanh β` (Friedli–Velenik, p. 125).
  Brute force gives `0.644531` at `n = 1`, `β = 0.7`, and `0.195469` at `n = 2`, `β = 0.5`,
  matching the formula. It tends to `0` as `n → ∞`, consistent with 5.1.
- The spin flip exchanges the plus and minus states only together with `h ↦ −h`: at `d = 1`,
  `n = 0`, `β = 0`, `h = 1`, the plus and minus kernels both give `σ_0 = +1` probability `0.8808`,
  and its flip at `h = 1` would give `0.1192`.
- Negative control for `d ≥ 1` in the ergodicity of 4.2: at `d = 0` the lattice is one point,
  every translation is the identity, and the plus state is the law with `σ_0 = +1` with
  probability `e^h / (e^h + e^{−h})`. The invariant event `σ_0 = +1` has measure `0.8808` at
  `h = 1`, neither `0` nor `1`.

## Layer 5: the phase diagram

### 5.1 Uniqueness in one dimension and at high temperature

- **One dimension** (`existsUnique_isIsingGibbs_one`): for all real `β` and `h`, the
  one-dimensional Ising model has exactly one Gibbs measure (Friedli–Velenik, Theorem 3.25,
  item 2, p. 110, for `β ≥ 0`, and Corollary 6.41, p. 295, which covers every real `β`).
- **High temperature** (`existsUnique_isIsingGibbs_of_tanh`): if `2d tanh|β| < 1`, then for every
  `h` there is exactly one Ising Gibbs measure. This adapts Friedli–Velenik, Example 6.36, p. 293
  (`4dβ < 1`).

*Proof route.* One dimension is 3.2 with range `1` and `M = |β| + |h|`. High temperature is 3.1:
the single-site kernel gives `σ_i = +1` probability `(1 + tanh(β s + h))/2`, with `s` the sum
of the neighbouring spins. Changing one neighbour moves `s` by `2`, so `c_{ij} ≤ tanh|β|` for
nearest neighbours, `c_{ij} = 0` otherwise, and `∑_j c_{ij} ≤ 2d tanh|β|`.

*Needs:* 3.1, 3.2.

### 5.2 Peierls' argument in two dimensions

- **Peierls' bound** (`peierlsBound`): `δ(β) = (2/3) ∑_{k ≥ 4} k 3^k e^{−2βk}`, finite when
  `3e^{−2β} < 1` (Friedli–Velenik, (3.40), p. 120).
- **Peierls' estimate** (`isingKernel_box_minusAtOrigin_le`): in `d = 2`, at `h = 0`, for `β > 0`
  with `3e^{−2β} < 1` and every `n`, the plus kernel of the box `box 2 n = {−n, …, n}²` gives
  `σ_0 = −1` probability at most `δ(β)` (Friedli–Velenik, (3.37)–(3.40), p. 120; Koralov–Sinai,
  Lemma 22.5, p. 345; Ellis, Lemma V.5.2, p. 155).
- **Spontaneous magnetization** (`IsPlusState.magnetization_ge_and_not_unique`): under the same
  hypotheses and `δ(β) < 1/2`, the plus state has `μ⁺(σ_0 = +1) ≥ 1 − δ(β)` and the Gibbs
  measure is not unique (Friedli–Velenik, (3.29), p. 115, proved on p. 120; Koralov–Sinai,
  Theorem 22.4, p. 345).
- Target in prose: the contour estimate, that the plus kernel gives probability at most
  `e^{−2β|γ|}` to the event that every primal edge crossed by a given dual cycle `γ` joins
  unequal spins (the cycle form of Friedli–Velenik, Lemma 3.37, p. 119, which is stated for
  contours), and the count of at most `(k/2)·4·3^{k−1}` dual cycles of length `k` surrounding the
  origin (Friedli–Velenik, (3.39), p. 120).

*Proof route.* The surrounding cycle comes from BernoulliPercolation. Let `G` be the graph on
`ℤ²` whose edges join nearest neighbours with equal spins. Under the plus kernel of the box with
`σ_0 = −1`, the component of the origin in `G` is finite, so BernoulliPercolation 6.2 gives a
cycle `γ` of the closed dual graph of `G` (its 6.1) that surrounds the origin: every primal edge
crossed by `γ` joins unequal spins. What is specific to the Ising model is built here. The
interior of `γ` is the set of sites that `γ` surrounds, in the ray-parity sense of
BernoulliPercolation 6.1 with the ray moved to start at the site. The parities at the two
endpoints of a primal edge differ by the number of times `γ` crosses that edge, since a closed
walk crosses the boundary of a half-strip an even number of times, and a cycle crosses each edge
at most once. So the primal edges with exactly one endpoint in the interior are the `|γ|` edges
crossed by `γ`. The interior lies in the box, because the spins off the box are plus. Flipping
the spins in the interior is an involution; it maps the configurations in which every edge
crossed by `γ` joins unequal spins to configurations in which these `|γ|` edges join equal spins,
changes no other edge, and gains `e^{−2β|γ|}` in the Boltzmann weight (Friedli–Velenik, Lemma
3.37, p. 119). A cycle of length `k` surrounding the origin uses an edge of the ray at one of at
most `k/2` dual vertices, and from there BernoulliPercolation 5.1 at `d = 2` bounds the paths of
length `k` in the lattice, which contains the closed dual graph, by `4·3^{k−1}`. Summing over
`k ≥ 4` gives `δ(β)`. Since the estimate is uniform in `n`, it passes to the plus state on the
cylinder event `{σ_0 = −1}`. By symmetry `μ⁻(σ_0 = +1) = 1 − μ⁺(σ_0 = +1) ≤ δ(β) < 1/2`, and 4.3
gives non-uniqueness. The parity argument replaces the Jordan curve theorem used in Ellis's proof
of Lemma V.5.2(b), p. 156.

*Needs:* 4.2, 4.3; BernoulliPercolation 5.1, 6.1 and 6.2; Mathlib
`Real.exp`, `tsum`.

### 5.3 The critical inverse temperature

- **Critical inverse temperature** (`isingCriticalBeta`): the supremum in `[0, ∞]` of the
  `β ≥ 0` at which the zero-field Ising model has exactly one Gibbs measure (Friedli–Velenik,
  Definition 3.32, p. 113).
- **Lower bound** (`le_isingCriticalBeta`): if `β ≥ 0` and `2d tanh β < 1`, then
  `β ≤ β_c(d)`, and `β_c(d) > 0` (from 5.1).
- **Two dimensions** (`isingCriticalBeta_two_mem`): `0 < β_c(2) ≤ 0.88` (Friedli–Velenik,
  Exercise 3.21, item 1, p. 122, with the strict upper bound).
- **One dimension** (`isingCriticalBeta_one`): `β_c(1) = ∞`.

*Proof route.* The lower bound is 5.1. For the upper bound in `d = 2`, `δ` is decreasing in `β`
and `δ(0.88) = 0.4954 < 1/2`, so 5.2 gives non-uniqueness at every `β ≥ 0.88`; no monotonicity of
the phase in `β` is needed. One dimension is 5.1.

*Needs:* 5.1, 5.2.

**Checks.**

- `δ(β)` (python with mpmath): `δ(0.80) = 1.2597`, `δ(0.85) = 0.6937`, `δ(0.88) = 0.4954`,
  `δ(1.0) = 0.1428`. The equation `δ(β) = 1/2` holds at `β = 0.87916`, so the constant `0.88` of
  5.3 has a margin of `0.0008`. At `β = 0.5`, `3e^{−2β} = 1.104 > 1` and the series diverges,
  which is why 5.2 carries that hypothesis.
- Smallest case of 5.2: `n = 0`, the box `{0}` with four plus neighbours, gives `σ_0 = −1`
  probability `e^{−4β}/(e^{4β} + e^{−4β})`, which is `0.000746` at `β = 0.9`, below
  `δ(0.9) = 0.3986`.
- The exact two-dimensional value is Onsager's `β_c(2) = ½ log(1 + √2) = 0.4407`, inside the
  interval of 5.3 and above the high-temperature bound `artanh(1/4) = 0.2554`.
- Negative control for the dimension: in `d = 1` the plus magnetization in finite volume is
  `2t^{n+1}/(1 + t^{2(n+1)}) → 0`, so no Peierls bound uniform in `n` holds there, consistent
  with `β_c(1) = ∞`.

## Downstream consumers

- No roadmap on main consumes this one. The targets listed under *Beyond this roadmap* (Ising in
  `d ≥ 3`, Lee–Yang uniqueness for `h ≠ 0`, the pressure, the variational principle) are its
  intended consumers. Glauber dynamics (MarkovChainMixing) has the Ising
  kernels of 4.1 as stationary laws of its finite-volume chains.

## Scope and ownership

Completion means:

1. Gibbs densities are tail-measurable, extremal Gibbs measures are the tail-trivial ones and
   decorrelate, distinct extremal measures are singular, extremal measures are almost-sure
   limits, and the extremal decomposition (Layer 1).
2. Existence for quasilocal specifications, uniqueness as boundary insensitivity, potentials and
   their quasilocal specifications (Layer 2).
3. Dobrushin's theorem with the oscillation bound and the high-temperature corollary, and
   uniqueness in one dimension (Layer 3).
4. For the Ising model: FKG, monotonicity, the plus and minus states with invariance,
   extremality, ergodicity and bracketing, the uniqueness criterion and the field dependence of
   the magnetization (Layer 4).
5. The zero-field phase diagram: uniqueness in `d = 1` and at high temperature, Peierls' estimate
   and spontaneous magnetization in `d = 2`, and the bounds on `β_c` (Layer 5).

**Not owned here.**

- Specifications, `Specification.IsGibbs`, the tail σ-algebra, its almost-sure equality with
  translation-invariant events, Bernoulli tail triviality, the weak topology on configuration
  space, convexity of the Gibbs measures, the preservation of the Gibbs property by
  tail-measurable densities, the face property of invariant Gibbs measures and weak closedness
  are owned by [DimerModelsAndLozengeTilings](../DimerModelsAndLozengeTilings/README.md), Layer 4
  (§§4.1–4.6). This roadmap consumes them (*Exact supplier contracts*). Its 1.1 is the converse
  of their 4.6(a), and its full shift `Subshift.univ` is the trivial instance of their subshifts.
- The Griffiths inequalities (GKS), the Lee–Yang theorem, the FKG inequality for real-valued
  spins with a single-site measure, the free-boundary infinite-volume state, reflection
  positivity and the infrared bound are owned by ConstructiveFieldTheoryPhi4 (an open pull
  request, §§2.1, 3.1, 3.3, Layers 4–5). That roadmap leaves Peierls' argument, the DLR formalism
  and uniqueness of Gibbs measures to others, and this roadmap owns them. No result of it is
  used here.
- The dual graph of `ℤ²` and surrounding cycles, the enclosure of a finite cluster by a dual
  cycle, the count of self-avoiding paths, Peierls' argument for Bernoulli percolation on `ℤ²`
  and Harris's inequality are owned by BernoulliPercolation (5.1 and
  Layer 6). This roadmap imports its 5.1, 6.1 and 6.2 into 5.2 and owns only what is specific to
  the Ising model: the interior of a dual cycle and its boundary edges, the spin flip and its
  energy gain `e^{−2β|γ|}`, and the resulting bound under the plus kernel.
- Glauber dynamics on finite graphs (MarkovChainMixing, §6.1), the
  ergodicity coefficient of a Markov kernel and Gibbs laws `∝ e^{−βU}` on finite sets
  (SimulatedAnnealing, §§1.2, 3.1), and the finite Ising and spin energies
  of QuantumOptimization (§1.1) are different objects. Dobrushin's
  interdependence coefficient here compares conditional laws under a change of boundary
  condition, not the rows of one transition matrix.
- Gibbs measures and equilibrium states of a single map in Bowen's sense (ClassicalErgodicTheory
  and HyperbolicDynamicsAndThermodynamicFormalism; the second takes its Gibbs measures from the
  first), hard-core Gibbs point processes (PointProcesses) and log-concave Gibbs laws on `ℝⁿ` are
  different notions and are not used.
- The four-functions theorem with its corollaries `fkg` and `holley` is in Mathlib.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.Kernel`, `ProbabilityTheory.IsMarkovKernel`,
  `ProbabilityTheory.Kernel.IsProper` (`Mathlib/Probability/Kernel/Proper.lean`) and
  `ProbabilityTheory.Kernel.comp`; `MeasureTheory.Measure.bind` and
  `MeasureTheory.Measure.bind_apply`.
- `MeasureTheory.cylinderEvents`, `MeasureTheory.cylinderEvents_le_pi` and
  `MeasureTheory.measurableCylinders` (`Mathlib/MeasureTheory/Constructions/Cylinders.lean`);
  `MeasureTheory.Filtration.cylinderEventsCompl` (`Mathlib/Probability/Process/Filtration.lean`).
- `MeasureTheory.condExp`, `MeasureTheory.Measure.withDensity`, `MeasureTheory.Measure.rnDeriv`
  and `ProbabilityTheory.condDistrib`. Mathlib has the upward martingale convergence theorem
  only; the backward one comes from Tau Ceti.
- `MeasureTheory.ProbabilityMeasure` with its weak topology.
- `fkg`, `holley` and `four_functions_theorem`
  (`Mathlib/Combinatorics/SetFamily/FourFunctions.lean`), for finite distributive lattices.
- `Real.tanh`, `Real.exp`, `tsum`, `Fintype.piFinset`, `Multiplicative`.
- Mathlib has no specification, Gibbs measure, potential or Ising model.

### From Tau Ceti

- Lévy's downward theorem, the theorem tendsto_ae_condExp_iInf of the namespace MeasureTheory in
  `TauCeti/Probability/Martingale/Convergence.lean`: `μ[f | 𝔽 n] → μ[f | ⨅ n, 𝔽 n]` almost
  surely for a decreasing sequence of σ-algebras. It is applied in 1.1–1.3 along
  `𝔽 n = 𝓕_{Λ_nᶜ}` for an exhaustion `Λ_n`, whose infimum is the tail σ-algebra.
- Tau Ceti has no specification, Gibbs measure or Ising model.

### From other roadmaps

- [DimerModelsAndLozengeTilings](../DimerModelsAndLozengeTilings/README.md) (on main), Layer 4:
  - §4.1: the tail σ-algebra `𝓣 = ⋂_Λ 𝓕_{Λᶜ}`; `tailSigma` is its trace on the full shift.
  - §4.2: translation-invariant events are almost surely tail events, used in 4.2.
  - §4.3: tail triviality of product measures, used in the Checks of Layer 1.
  - §4.4: `Subshift`, and the compactness of the probability measures on a finite-alphabet
    subshift, used in 2.1.
  - §4.5: `Subshift.exterior`, `Specification`, `Specification.IsGibbs`, quasilocality, the
    conditional-expectation form of the Gibbs property, and convexity of the Gibbs measures. The
    declarations `Subshift`, `Subshift.exterior`, `Specification`, `Specification.IsGibbs` and
    `Specification.IsQuasilocal` in [Suggested.lean](Suggested.lean) are local copies.
  - §4.6: (a) tail-measurable densities preserve the Gibbs property, used in 1.1–1.2; (b) the
    face property and the extreme-iff-ergodic statement, used in 4.2; (c) weak closedness of the
    Gibbs measures of a quasilocal specification, used in 2.1.
  - No other layer of DimerModelsAndLozengeTilings is consumed.
- BernoulliPercolation, used in the route of 5.2 only, with no Lean
  declaration copied:
  - §5.1: at most `2d (2d − 1)^{n−1}` self-avoiding paths of length `n ≥ 1` from a vertex of the
    lattice, which is `4·3^{n−1}` at `d = 2`.
  - §6.1: the closed dual graph of a graph `G` on `ℤ²`, the ray edges, and a closed walk
    surrounding the origin when it uses an odd number of ray edges.
  - §6.2: for every graph `G` on `ℤ²` whose component of the origin is finite, a cycle of the
    closed dual graph of `G` that surrounds the origin.

## Beyond this roadmap

This section sketches a roadmap that would follow this one; contributors to this one should not
follow it.

- **Ising in `d ≥ 3`**: `0 < β_c(d) < ∞`. All sources reduce to `d = 2` through monotonicity of
  the magnetization in the dimension, a consequence of GKS (Friedli–Velenik, pp. 121–122; Ellis,
  Theorem V.5.1, pp. 153–154). That needs GKS with a field, ConstructiveFieldTheoryPhi4 §3.1 with
  the ghost-spin device. The direct alternative, Peierls with plaquette contours
  (Friedli–Velenik, §5.7.4, pp. 254–256), needs the connectedness of the boundary of a connected
  set of cubes.
- **Sharp threshold**: `μ⁺ ≠ μ⁻` for every `β > β_c` needs `β ↦ μ⁺_β(σ_0)` nondecreasing, which
  is GKS (Friedli–Velenik, Lemma 3.31, item 2, p. 113).
- **Uniqueness for `h ≠ 0`** via Lee–Yang and the differentiability of the pressure
  (Friedli–Velenik, Theorems 3.34, 3.40 and 3.43, pp. 114–130), with ConstructiveFieldTheoryPhi4
  §2.1.
- **Onsager's value** `β_c(2) = ½ log(1 + √2)` and the exact spontaneous magnetization.
- **The variational principle** and translation-invariant Gibbs measures as equilibrium states
  (Friedli–Velenik, §6.9; Ruelle, Chapter 4).
- **Specifications on subshifts**: Layers 1–2 on a general finite-alphabet subshift of
  DimerModelsAndLozengeTilings 4.4, for hard-core and dimer constraints.

## Prior formalization

- The GibbsMeasure project (Y. Dillies, M. Cipollina and contributors,
  `github.com/YaelDillies/gibbs-measure`, Apache 2.0) formalizes, following Georgii's book,
  consistent families, specifications on `S → E` with kernels `Kernel[cylinderEvents Λᶜ]`, the
  independent specification, modifiers, and the Gibbs predicate through conditional expectations.
  It has no existence theorem, extremal theory, Dobrushin criterion or Ising model.
  DimerModelsAndLozengeTilings 4.5 records the correspondence of its shapes with the
  `Specification` used here.

## References

- S. Friedli and Y. Velenik, *Statistical Mechanics of Lattice Systems: A Concrete Mathematical
  Introduction*, Cambridge University Press, 2017. Chapter 3 (pp. 83–130), Chapter 5 (§5.7.4) and
  Chapter 6 (pp. 266–320).
- D. Ruelle, *Thermodynamic Formalism*, 2nd ed., Cambridge Mathematical Library, Cambridge
  University Press, 2004. Chapter 1 (pp. 11–23).
- L. Koralov and Ya. G. Sinai, *Theory of Probability and Random Processes*, 2nd ed.,
  Universitext, Springer, 2007. Chapter 22 (pp. 341–346).
- R. S. Ellis, *Entropy, Large Deviations, and Statistical Mechanics*, Classics in Mathematics,
  Springer, 2006 (reprint of the 1985 edition). Chapter V, §V.5 (pp. 153–156).
- G. Grimmett, *Probability on Graphs*, 2nd ed., Cambridge University Press, 2018. Chapter 4,
  §4.1 (pp. 59–60).
- H.-O. Georgii, *Gibbs Measures and Phase Transitions*, 2nd ed., de Gruyter, 2011: the reference
  of the GibbsMeasure project; not cited for locators here.
