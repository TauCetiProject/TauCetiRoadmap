# Roadmap: Spatial Statistics: Finite Gibbs Point Processes

**Summary.** This roadmap builds the theory of point processes in a bounded window that are
given by a density against a Poisson process, the setting of spatial statistics for interacting
points:
- finite configurations as finite sets, their σ-algebra, which is standard Borel and makes the
  operations on configurations measurable, and the Poisson process of a window as a law on them,
  identified with the Poisson process of the general theory of point processes;
  finite point processes with a density against it, the Papangelou conditional intensity, the
  factorisation of a hereditary density by it, the Georgii–Nguyen–Zessin formula and the
  determination of the law by the conditional intensity;
- local and Ruelle stability: a density bounded by an integrable function each time a point is
  added is hereditary, dominated by a Poisson density and normalisable, with the explicit bound
  `h(∅) e^{(β − 1)μ(W)}` for a constant bound `β`;
- Markov functions for a symmetric reflexive relation and the Hammersley–Clifford–Ripley–Kelly
  theorem: a hereditary density is Markov exactly when it is a product of interactions over
  cliques, and then disjoint unrelated regions are conditionally independent given the rest;
- the Strauss, hard-core, multiscale and area-interaction models, with the exact range of
  parameters in which the Strauss density is integrable;
- finite-volume Gibbs measures `Z⁻¹ z^{n(x)} e^{−βH(x)}` for non-degenerate, hereditary, stable
  energies: finiteness of the partition function, the characterisation by the
  Georgii–Nguyen–Zessin formula, the DLR equation, the variational principle and the derivatives
  of the mean number of points and the mean energy;
- likelihood inference: the Poisson likelihood of a log-linear intensity with its concavity,
  score and Fisher information, the first-order composite score, and the pseudolikelihood as the
  limit of products of cell conditional densities, with its unbiased score and its concavity for
  exponential families;
- Markov kernels on general state spaces: Doeblin's bound for a small state space, with the floor
  `⌊m/n₀⌋` in the exponent, and `V`-uniform ergodicity under a geometric drift condition;
- the birth–death Metropolis–Hastings algorithm for a locally stable density: reversibility,
  irreducibility, small sets, `V`-uniform ergodicity for `V = β^{n(x)}` with any `β > 1`, and
  uniform ergodicity exactly when the number of points is bounded, with an explicit
  total-variation bound.

The roadmap is a multi-source synthesis of Møller and Waagepetersen's monograph and survey, van
Lieshout's two books, Dereudre's lectures on Gibbs point processes, Gaetan and Guyon, and Ripley;
it follows none of them section by section. Headlines that restate a source result cite a
theorem, definition, section or equation number with its printed page; corollaries and
adaptations carry a proof route.

It rests on the SpatialPointProcessFoundations roadmap of the spatial statistics family, which
owns point processes on locally compact Polish spaces, Janossy measures and the Poisson process
with its Mecke equation and simplicity; this roadmap identifies the Poisson process of a window
with a law on finite sets and owns the theory of densities against it, from the Papangelou
intensity and the Georgii–Nguyen–Zessin formula onwards. The birth–death kernel is a
Metropolis–Hastings kernel in the sense of
[LangevinAndHamiltonianMonteCarlo](../LangevinAndHamiltonianMonteCarlo/README.md), whose
reversibility criterion it uses. The Hammersley–Clifford theorem for finite graphs of
[GraphicalModelsAndConditionalIndependence](../GraphicalModelsAndConditionalIndependence/README.md)
is the lattice analogue of Layer 3, and the lattice Gibbs measures of
[GibbsMeasuresAndTheIsingModel](../GibbsMeasuresAndTheIsingModel/README.md) are the lattice
analogue of Layer 5; neither is consumed. Two other roadmaps of the spatial statistics family
consume this one (Downstream consumers).

`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the
README attaches to it; it is not an exhaustive acceptance test, and the other headlines are
targets of the same standing, stated in prose.

Suggested home: `TauCeti/Probability/PointProcess/Finite/` for Layers 1–6 and 8, and
`TauCeti/Probability/Kernel/Ergodicity/` for Layer 7.

## How to read the build

Each layer has numbered subsections; each subsection lists its targets as bold headlines with
their Lean names, a locator or a proof route, and Checks, which are sanity checks of the key
definitions and theorems.

Layer 1 fixes the carrier. A finite configuration is a `Finset S`, and every law in the roadmap is a
law on `Finset S` with a density against the Poisson law of a window. The Poisson law is defined
directly by its Poisson sum over tuples, and the bridge of 1.2 identifies it with the image of the
Poisson process of SpatialPointProcessFoundations. Section 1.3 builds densities, the Papangelou
intensity and the Georgii–Nguyen–Zessin formula on the Poisson sums. Layer 2 needs only Layer 1.
Layer 3 is pure algebra of functions on finite sets, except for the conditional independence of 3.2,
which uses 1.3. Layer 4 instantiates Layers 2 and 3. Layer 5 uses Layers 1 and 2: the Gibbs weight
is locally stable or Ruelle stable, and the Georgii–Nguyen–Zessin formula of 1.3 drives 5.2 and 5.3.
Layer 6 uses 1.2–1.3 (Poisson densities, Campbell and Georgii–Nguyen–Zessin) and 2.1 (Ruelle
stability in the limit of 6.3). Layer 7 is independent of everything else: it is the ergodic theory
of a Markov kernel on a measurable space. Layer 8 applies Layer 7 to the birth–death kernel built
from Layers 1 and 2.

The layers are in build order: each needs only earlier layers and the suppliers.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace TauCeti; `Suggested.lean` states the
  prototypes in `TauCetiRoadmap.FiniteGibbsPointProcesses`.
- **State space.** `S` is a locally compact Polish metric space with its Borel σ-algebra, the
  standing assumption of SpatialPointProcessFoundations:
  `[MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S] [BorelSpace S]`. The
  reference measure `μ` is σ-finite. Where a statement calls `μ` atomless it means atomless on the
  window, `NullSingletonClass (μ.restrict W)`: atoms outside the window are harmless. A window `W`
  is a measurable set with `μ W ≠ ∞`; the bridge of 1.2 uses a bounded window, measurable with
  compact closure, and `IsFiniteMeasureOnCompacts μ`. Area interaction (4.3) assumes
  `ProperSpace S`, so that closed balls have finite measure. Layer 3 works over an arbitrary type
  `α`, and Layer 7 over an arbitrary measurable space.
- **Configurations.** A finite configuration is a `Finset S`. The configuration of a tuple
  `x : Fin n → S` is `toConfig x`, its image. The σ-algebra `configMeasurableSpace` on
  `Finset S` is the largest one making every `toConfig` measurable. Since the Poisson process of
  an atomless intensity has no multiple points, nothing is lost against the multiplicity-carrying
  `PointMeasure` of SpatialPointProcessFoundations §1.1: `PointMeasure.ofFinset` and
  `PointMeasure.toFinset` (1.1) convert between the two, and the bridge of 1.2 maps one Poisson
  law to the other.
- **Reference law.** `poissonConfigLaw μ W` is the law of the Poisson process with intensity
  `μ|W`, the sum over `n` of `e^{−μ(W)}/n!` times the image of `(μ|W)^n` under `toConfig`, where
  `e^{−t}` is `expNeg t`, Tau Ceti's `(EReal.exp (-t.toEReal)).toNNReal` as copied in
  SpatialPointProcessFoundations §5.2, which is `0` at `t = ∞`. For `μ` Lebesgue measure
  on a window of `ℝ^d` it is Møller and Waagepetersen's `Poisson(W, 1)` and van Lieshout's unit
  rate Poisson process.
- **Densities.** Unnormalised densities `h : Finset S → ℝ≥0` are finite-valued, as in the
  sources. Laws, integrals and partition functions are in `ℝ≥0∞`, so an unnormalisable `h` has
  integral `∞` and never a junk value. `configLaw μ W h` is the law with density proportional to
  `h`: it is `(poissonConfigLaw μ W).withDensity (h / ∫ h)`, and it is the zero measure if the
  integral is `0` or `∞`; every theorem about it has hypotheses giving `0 < ∫ h < ∞`.
  `HasConfigDensity P X μ W f` says that `X` is measurable with law `f · poissonConfigLaw μ W`.
- **Papangelou intensity.** `papangelou f x ξ = f (x ∪ {ξ}) / f x`, read as `0` where `f x = 0`
  (Møller and Waagepetersen's convention `a/0 = 0` in Definition 6.1). The configuration comes
  first and the point second, as in Møller and Waagepetersen and van Lieshout.
- **Poisson processes.** `IsPoissonRandomMeasure P N Λ` and
  `IsPoissonPointProcess P N Λ` are the definitions of SpatialPointProcessFoundations §5.1, with
  the probability measure explicit and almost surely infinite counts on sets of infinite
  intensity; for the finite intensity `μ|W` of a bounded window that clause is vacuous.
- **Gibbs weight.** For an energy `H : Finset S → WithTop ℝ` and `β ≥ 0`, the weight
  `gibbsWeight β H x` is `e^{−β H(x)}` where `H x` is finite, `0` where `H x = ⊤` and `β > 0`,
  and `1` where `H x = ⊤` and `β = 0`. So `e^{−0·H} = 1` and the Gibbs measure at `β = 0` is the
  Poisson law of intensity `z` (5.1), as Dereudre remarks after Definition 5.2. The local energy
  `H(x ∪ {ξ}) − H(x)` uses `∞ − ∞ = 0` (Dereudre, Definitions 5.3–5.4).
- **Total variation.** Distances between laws are Mathlib's `tvDist`, which takes values in
  `[0, 2]` for probability measures: it is twice the supremum over events used by Møller and
  Waagepetersen. Every total-variation bound of the sources therefore carries a factor `2` here.
- **Kernels.** Kernels are Mathlib's `ProbabilityTheory.Kernel`, with powers `κ ^ m`,
  reversibility `Kernel.IsReversible`, invariance `Kernel.Invariant` and irreducibility
  `Kernel.IsIrreducible` (every start reaches every set of positive reference measure). The
  Metropolis–Hastings kernel `mhKernel Q a` of a proposal `Q` and an acceptance function `a` is
  that of LangevinAndHamiltonianMonteCarlo §1.1.
- **Locators** are to the editions in [References](#references), with printed page numbers.
  Møller and Waagepetersen's monograph is cited by number only.

## Layer 1: configurations and the Poisson reference law

### 1.1 Configurations

- `toConfig x`, the image of a tuple, and `configMeasurableSpace`, the final σ-algebra of all
  `toConfig`. Supporting step: `measurable_toConfig`.
- **The universal property** (`measurable_iff_measurable_comp_toConfig`): `f : Finset S → β` is
  measurable iff `fun x => f (toConfig x)` is measurable on `Fin n → S` for every `n`. It is the
  universal property of a final σ-algebra.
- **Standard Borel** (`standardBorelSpace_finset`): `Finset S` is a standard Borel space. Proof
  route: the configurations with `n` points are the image of the injective tuples, a Borel subset
  of `Sⁿ`, and the tuple whose entries are increasing for a Borel linear order of `S` (from a
  Borel isomorphism of `S` with a Borel subset of `ℝ`) is a Borel transversal; it identifies
  `Finset S` with a Borel subset of the disjoint union of the `Sⁿ`, and its inverse is
  `toConfig`.
- **Measurable operations** (`measurable_configOps`): `(ξ, x) ↦ x ∪ {ξ}` and `(ξ, x) ↦ x ∖ {ξ}`
  on `S × Finset S`, restriction `x ↦ x ∩ A` to a measurable `A`, union on
  `Finset S × Finset S` and the number of points `n(x)` are measurable. Proof route: by the
  Borel transversal above each map lifts to a measurable map of tuples (`Fin.cons`, deleting the
  entries equal to `ξ`, keeping the entries in `A`, concatenation), and on tuples the number of
  distinct entries is measurable since `S` has measurable diagonal.
- **Sums over the points** (`measurable_sum_erase`): for jointly measurable
  `g : S → Finset S → ℝ≥0∞`, `x ↦ ∑_{ξ ∈ x} g(ξ, x ∖ {ξ})` is measurable. Proof route: on an
  injective tuple `x : Fin (n + 1) → S` it is `∑ᵢ g(xᵢ, toConfig (x ∘ i.succAbove))`, and a
  tuple with repeated entries reduces to fewer entries; this is the measurability that the
  Georgii–Nguyen–Zessin formula of 1.3 needs.
- **Point measures** (`PointMeasure.ofFinset`, `PointMeasure.toFinset`,
  `PointMeasure.toFinset_ofFinset`): `ofFinset x` is the point measure `∑_{ξ ∈ x} δ_ξ`, and
  `toFinset ξ` is the finite set of atoms of a point measure (`∅` when there are infinitely
  many). The atoms of `ofFinset x` are `x`; `ofFinset` is measurable for the Borel σ-algebra of
  the vague topology; and a simple point measure of finite total mass is `ofFinset` of its atoms.
  Proof route: the count of `ofFinset x` on `A` is `n(x ∩ A)`, measurable by the previous
  bullet, and the counts generate the σ-algebra of point measures (SpatialPointProcessFoundations
  §1.2); the last part is the atomic decomposition of §1.1 there.

**Checks.**

- `toConfig ![a, a] = {a}`: the configuration forgets multiplicities, which the bridge of 1.2
  makes harmless for an atomless intensity.
- The set `{x | x.card = n}` is measurable, since its preimage under `toConfig` on `Fin m → S` is
  the set of tuples with exactly `n` distinct values.
- `PointMeasure.toFinset_ofFinset` (negative control): `δ_a + δ_a` has total mass `2` and the
  single atom `a`, and `ofFinset {a} = δ_a`; the simplicity hypothesis cannot be dropped.
- `PointMeasure.toFinset_ofFinset` (negative control): `∑_{k ∈ ℤ} δ_k` on `ℝ` is simple with
  infinitely many atoms, so `toFinset` gives `∅` and `ofFinset ∅ = 0`; the finiteness hypothesis
  cannot be dropped.

### 1.2 The Poisson reference law

- `poissonConfigLaw μ W` (Conventions). Møller and Waagepetersen (6.1) is its integral formula
  for Lebesgue measure; their Remark 6.1 extends it to a finite intensity measure on a general
  space; van Lieshout (2019), (4.7), p. 104.
- **Normalisation** (`isProbabilityMeasure_poissonConfigLaw`): for `μ W ≠ ∞` the law is a
  probability measure, from `∑ e^{−a} aⁿ/n! = 1`.
- **Poisson sums** (`lintegral_poissonConfigLaw`): for measurable `f ≥ 0`,
  `∫⁻ f d(poissonConfigLaw μ W) = ∑ₙ e^{−μ(W)}/n! ∫⁻ f(toConfig x) d(μ|W)^n(x)`. Møller and
  Waagepetersen (6.1).
- **Generating function of the count** (`lintegral_pow_card_poissonConfigLaw`): for an atomless
  `μ` and `β ≥ 0`, `∫ β^{n(x)} = e^{(β − 1)μ(W)}`. Under an atomless `μ`, a tuple has distinct
  entries almost surely, so `n(toConfig x) = n` on `(μ|W)^n`-almost every tuple.
- **The bridge to the general Poisson process** (`map_toFinset_of_isPoissonPointProcess`): for a
  locally finite `μ` atomless on a bounded window `W` and a Poisson process `N` with intensity
  `μ|W` in the sense of SpatialPointProcessFoundations §5.1, the finite set
  `PointMeasure.toFinset (N ω)` of atoms of `N ω` is measurable in `ω` and has law
  `poissonConfigLaw μ W`. Proof route: the Janossy measures of `N` on `W` are
  `e^{−μ(W)}/n! (μ|W)^n` (SpatialPointProcessFoundations §5.3), and they reconstruct the law of
  the restriction (§4.3 there); equivalently, given `N(W) = n` the restriction is the point
  measure of `n` independent points with law `μ|W/μ(W)` (binomial form, §5.4 there). The
  process is simple almost surely (§5.4 there), so its atoms are the points of `toConfig` of the
  tuple.

**Checks.**

- `∫ β^{n(x)} = e^{(β − 1)μ(W)}` with `β = 2.5`, `μ(W) = 1.7`: both sides are `12.8071`.
- `lintegral_pow_card_poissonConfigLaw` (negative control): for `μ = δ_a` with `a ∈ W` the law
  puts mass `e^{−1}` on `∅` and `1 − e^{−1}` on `{a}`, so `∫ β^{n(x)} = e^{−1}(1 + (e − 1)β)`,
  which is `0.4311` at `β = 0.1` against `e^{β − 1} = 0.4066`. The atomless hypothesis cannot be
  dropped.
- `poissonConfigLaw (0 : Measure S) W = δ_∅`, the Poisson process with no points.

### 1.3 Densities and the Papangelou intensity

Finite point processes given by a density against the Poisson reference law are owned here, on
the carrier `Finset S`; SpatialPointProcessFoundations treats Janossy measures in general and
leaves densities, the Papangelou intensity and the finite-volume Georgii–Nguyen–Zessin formula to
this roadmap.

- `HasConfigDensity P X μ W f`, `IsHereditary f` (`f x ≠ 0` and `y ⊆ x` give `f y ≠ 0`; Møller
  and Waagepetersen (6.9)) and `papangelou f x ξ` (Conventions; Møller and Waagepetersen,
  Definition 6.1 and (6.6)). `HasIntensity P X μ W ρ` is Campbell's formula
  `E ∑_{u ∈ X} g(u) = ∫_W g ρ dμ` for measurable `g ≥ 0`, the configuration form of the
  intensity measure of SpatialPointProcessFoundations §2.1.
- `poissonConfigDensity μ W ρ x = e^{μ(W) − ∫_W ρ dμ} ∏_{u ∈ x} ρ(u)`.
- **Poisson densities** (`poissonConfigLaw_withDensity_eq`): for an atomless `μ`, a window `W`
  and measurable `ρ : S → ℝ≥0` with `∫_W ρ dμ < ∞`, the Poisson law with intensity `ρ · μ` is
  `poissonConfigDensity μ W ρ · poissonConfigLaw μ W`. Møller and Waagepetersen, Proposition
  3.8(ii) and (3.11), and (6.2); van Lieshout (2019), Example 4.9 and (4.8), p. 105; its
  conditional intensity is `ρ` (van Lieshout (2019), Example 4.13, p. 108). Proof route:
  compare the two Poisson sums of 1.2 term by term.
- **Factorisation by the conditional intensity** (`eq_mul_prod_papangelou`): for hereditary `f`
  and every enumeration `x₁, …, xₙ` of a configuration without repetition,
  `f({x₁, …, xₙ}) = f(∅) ∏ᵢ papangelou f {x₁, …, x_{i−1}} xᵢ`. Van Lieshout (2019), Theorem 4.3,
  p. 109; Møller and Waagepetersen, remark after (6.9). Pure algebra, by induction on `n`.
- **Georgii–Nguyen–Zessin formula** (`gnz_of_hasConfigDensity`): for an atomless `μ`, a window
  `W`, a measurable hereditary density `f` of `X` and every measurable
  `g : S → Finset S → ℝ≥0∞`,
  `E ∑_{ξ ∈ X} g(ξ, X ∖ {ξ}) = ∫_W E[g(ξ, X) λ*(X, ξ)] dμ(ξ)` with `λ* = papangelou f`.
  Møller and Waagepetersen (2007), (31), p. 657; Dereudre, Proposition 5.4, p. 192. Proof route:
  from the Poisson sums of 1.2, splitting off one coordinate of a tuple
  (`measurePreserving_piFinSuccAbove`) and using heredity to write
  `g(ξ, x) f(x ∪ {ξ}) = g(ξ, x) λ*(x, ξ) f(x)`. For `f = 1` it is the Mecke equation of
  SpatialPointProcessFoundations §5.3, read through the bridge of 1.2.
- **The Papangelou intensity determines the law** (`map_eq_of_papangelou_ae_eq`): if `X` and `X'`
  have hereditary densities `f` and `f'` against `poissonConfigLaw μ W` whose Papangelou
  intensities agree, `papangelou f x ξ = papangelou f' x ξ` for all `x` with `ξ ∉ x`, at
  `μ|W`-almost every `ξ`, then `X` and `X'` have the same law. Van Lieshout (2019), the
  corollary stated before Theorem 4.3, p. 109; Møller and Waagepetersen, remark after (6.9).
  Proof route: both densities have total mass `1`, so heredity gives `f(∅) ≠ 0 ≠ f'(∅)`;
  almost every configuration has its points in the set where the intensities agree, so
  `eq_mul_prod_papangelou` gives `f = (f(∅)/f'(∅)) f'` almost everywhere, and the masses force
  `f(∅) = f'(∅)`.

**Checks.**

- `eq_mul_prod_papangelou` for the Strauss function of 4.1 with `β = 2`, `γ = 1/2`, `R = 1` and
  `x = (0, 0.5, 2)` on `ℝ`: the intensities along the enumeration are `2`, `1` and `2`, and
  `f(∅) · 2 · 1 · 2 = 4 = β³γ`.
- `eq_mul_prod_papangelou` (negative control): the indicator of one-point configurations, the
  density of a single uniform point (van Lieshout (2019), Example 4.14, p. 109), has `f({a}) = 1`
  but `f(∅) = 0`; it is not hereditary, and the factorisation fails.
- `papangelou f x ξ = 0` whenever `f x = 0`, whatever `f (insert ξ x)` is.
- `map_eq_of_papangelou_ae_eq` on a two-atom space, `μ = 0.7 δ_a + 1.3 δ_b`: a hereditary
  density with values `1, 2, 0.5, 3` on `∅, {a}, {b}, {a, b}`, normalised, is recovered exactly
  from its Papangelou intensities and its total mass `1`.
- `map_eq_of_papangelou_ae_eq` (negative control): the normalised indicators of one-point and of
  two-point configurations have the same Papangelou intensity, `0` at every `x` and `ξ ∉ x`, and
  different laws; neither is hereditary, and the hypothesis cannot be dropped.

## Layer 2: stability and normalisability

### 2.1 Local and Ruelle stability

- `IsLocallyStable W φ h`: `h (x ∪ {ξ}) ≤ φ(ξ) h(x)` for `x ⊆ W` and `ξ ∈ W ∖ x`;
  `IsRuelleStable W φ h`: `h(x) ≤ a ∏_{ξ ∈ x} φ(ξ)` for some `a ≥ 0` and all `x ⊆ W`. Here
  `φ : S → ℝ≥0`. Møller and Waagepetersen, Definition 6.2 and (6.10); van Lieshout (2019),
  Proposition 4.2, p. 106.
- **Consequences of local stability** (`isLocallyStable_consequences`): a locally stable `h` is
  Ruelle stable with `a = h(∅)`, hereditary on `W`, and its Papangelou intensity is at most `φ`
  on `W`. Møller and Waagepetersen, text after Definition 6.2; van Lieshout (2019),
  Proposition 4.2, p. 106. Proof: induction on the number of points added to a subset.

**Checks.**

- The Strauss function with `γ = 1/2` is locally stable with `φ ≡ β`; with `γ = 2` it is not,
  since adding a point next to `k` points multiplies `h` by `β 2^k`.
- A Lennard-Jones pair potential is Ruelle stable but not locally stable (Møller and
  Waagepetersen, Example 6.4), so the converse of `isLocallyStable_consequences` fails.

### 2.2 Normalisability

- **Ruelle stability gives integrability** (`lintegral_lt_top_of_isRuelleStable`): if `W` is a
  window, `φ` is measurable with `∫_W φ dμ < ∞` and `h` is Ruelle stable, then
  `∫ h d(poissonConfigLaw μ W) < ∞`. Møller and Waagepetersen, text after Definition 6.2. Proof:
  bound `∏_{ξ ∈ toConfig x} φ(ξ)` by `∏ᵢ max(1, φ(xᵢ))` and sum the Poisson series.
- **The constant bound** (`lintegral_le_of_isLocallyStable_const`): for an atomless `μ`, a window
  `W` and `h` locally stable with `φ ≡ β`, `∫ h ≤ h(∅) e^{(β − 1)μ(W)}`. Van Lieshout (2019),
  proof of Proposition 4.2, p. 107: `h(x) ≤ h(∅) β^{n(x)}` and 1.2.
- **Normalisability** (`normalisable_of_isLocallyStable`): a measurable locally stable `h` with
  `h(∅) ≠ 0` and `∫_W φ dμ < ∞` has `0 < ∫ h < ∞`, so `configLaw μ W h` is a probability
  measure. Van Lieshout (2019), Proposition 4.2, p. 106; Møller and Waagepetersen, text after
  Definition 6.2. The lower bound is the mass `e^{−μ(W)} h(∅)` of `∅`.

**Checks.**

- `lintegral_le_of_isLocallyStable_const` is an equality for `h(x) = β^{n(x)}`, by 1.2.
- `lintegral_le_of_isLocallyStable_const` (negative control): for `μ = δ_a` and `h = β^{n(x)}`
  with `β = 0.1`, `∫ h = 0.4311 > 0.4066 = h(∅) e^{β − 1}`; the atomless hypothesis cannot be
  dropped.
- `normalisable_of_isLocallyStable` (negative control): `h ≡ 0` is locally stable for every `φ`
  and has `∫ h = 0`; the hypothesis `h(∅) ≠ 0` cannot be dropped.

## Layer 3: Markov functions

### 3.1 The Hammersley–Clifford–Ripley–Kelly theorem

Throughout, `r` is a relation on a type `α`; it is reflexive and symmetric where stated.

- `IsClique r y` (the points of `y` are pairwise related; `∅` and singletons are cliques for a
  reflexive `r`) and `IsMarkovFunction r h`: `h` is hereditary, and for `h(x) ≠ 0` and `ξ ∉ x`
  the ratio `h(x ∪ {ξ})/h(x)` equals the same ratio with `x` replaced by its points related to
  `ξ`. Møller and Waagepetersen, Definition 6.3 and (6.21); van Lieshout (2000), Definition 2.2,
  p. 46; Gaetan and Guyon, Definition 3.4, p. 102.
- **Hammersley–Clifford–Ripley–Kelly** (`isMarkovFunction_iff`): for reflexive symmetric `r` and
  hereditary `h : Finset α → ℝ≥0`, `h` is a Markov function iff `h(x) = ∏_{y ⊆ x} φ(y)` for some
  `φ : Finset α → ℝ≥0` with `φ(y) = 1` whenever `y` is not a clique. Møller and Waagepetersen,
  Theorem 6.1 and (6.22)–(6.24); van Lieshout (2000), Theorem 2.2, p. 49, proof pp. 49–50; van
  Lieshout (2019), Theorem 4.4, p. 110; Ripley (1977), §3.3, p. 176. Proof: define `φ` on
  `{h > 0}` by Möbius inversion, `φ(y) = ∏_{z ⊆ y} h(z)^{(−1)^{|y∖z|}}`, and `φ(y) = 0` on the
  other sets whose proper subsets all have `h > 0`. Møller and Waagepetersen read the inductive
  definition with `0/0 = 1`, van Lieshout with `0/0 = 0`; the product is the same. Gaetan and
  Guyon, Proposition 3.1, p. 103, assume `h > 0`. No structure of `α` beyond `r` is used
  (Møller and Waagepetersen, Remark 6.3).
- **The conditional intensity of a product** (`papangelou_eq_prod`): if
  `h(x) = ∏_{y ⊆ x} φ(y)`, `h(x) ≠ 0` and `ξ ∉ x`, then
  `papangelou h x ξ = ∏_{y ⊆ x} φ(y ∪ {ξ})`. Møller and Waagepetersen (6.24); Gaetan and Guyon
  (3.15), p. 103.
- **Uniqueness of the interaction** (`eq_of_prod_powerset_eq`): two factorisations of `h` agree on
  every `y` with `h(y) ≠ 0`. Møller and Waagepetersen, Remark 6.3. Proof: induction on `|y|`.

**Checks.**

- The Strauss function is the product with `φ(∅) = 1`, `φ({ξ}) = β`,
  `φ({ξ, η}) = γ^{1[d(ξ, η) ≤ R]}` and `φ = 1` on larger sets: at `β = 2`, `γ = 1/2`, `R = 1`,
  `x = {0, 0.5, 2}` both sides are `4`.
- `isMarkovFunction_iff` (negative control): `h(x) = 1` if `x = ∅` or `x = {a, b}` and `0`
  otherwise is not hereditary, and no product of interactions gives it, since `h({a}) = 0` forces
  a zero factor in `h({a, b})`.
- `isMarkovFunction_iff` (negative control for reflexivity): for the empty relation `⊥` only `∅`
  is a clique, so every product of interactions is the constant `φ(∅)`; but `h(x) = 2^{n(x)}` is
  hereditary and Markov for `⊥` (every ratio is `2`). The reflexivity hypothesis cannot be
  dropped.

### 3.2 The global Markov property

- **Factorisation across unrelated sets** (`markov_density_factorization`): if `h` is Markov for
  a reflexive symmetric `r`, and `A`, `B` are disjoint with no point of `A` related to a point of
  `B`, then `h(x) = g(x ∖ B) k(x ∖ A)` for some `g`, `k`. Proof: by
  `isMarkovFunction_iff`, no clique meets both `A` and `B`; split the product.
- **Conditional independence** (`condIndepFun_of_isMarkovFunction`): if `X` has a measurable Markov
  density on a window `W` (atomless `μ`, standard Borel `Ω`) and `A`, `B` are disjoint measurable
  sets with no point of `A` related to a point of `B`, then `X ∩ A` and `X ∩ B` are conditionally
  independent (`CondIndepFun`) given `X ∩ (W ∖ (A ∪ B))`. Møller and Waagepetersen, Proposition 6.1;
  van Lieshout (2000), Theorem 2.1, p. 47. Proof: the restrictions are measurable by
  `measurable_configOps`, so the σ-algebra of the outside configuration lies in that of `Ω`; the
  density of the restrictions to `A`, `B` and `C = W ∖ (A ∪ B)` is the density of `X` (the Poisson
  law of a disjoint union is the product of the Poisson laws), and it factorises as
  `g(x_A ∪ x_C) k(x_B ∪ x_C)`.

**Checks.**

- For the Strauss process on `[0, 10]` with `R = 1`, `A = [0, 2]` and `B = [3.5, 10]` are
  separated by more than `R`, so `X ∩ A` and `X ∩ B` are conditionally independent given
  `X ∩ (2, 3.5)`.

## Layer 4: models

### 4.1 The Strauss and hard-core processes

- `closePairs R x`, the number of pairs of points of `x` at distance at most `R`, and
  `straussDensity β γ R x = β^{n(x)} γ^{s_R(x)}` with `β, γ ≥ 0` and `0⁰ = 1`. Møller and
  Waagepetersen, Example 6.1 and (6.13)–(6.14); van Lieshout (2019), Example 4.10,
  pp. 105–106; Ripley (1977), §3.3, p. 176.
- **The repulsive Strauss process** (`strauss_properties`): for `γ ≤ 1` the Strauss function is
  locally stable with `φ ≡ β`, has finite integral on every window, is a Markov function for
  `d(ξ, η) ≤ R`, and for `h(x) ≠ 0` and `ξ ∉ x` its Papangelou intensity is
  `β γ^{#{η ∈ x | d(ξ, η) ≤ R}}`. Møller and Waagepetersen, Example 6.1; van Lieshout (2019),
  Example 4.12, p. 107; van Lieshout (2000), Theorem 4.1, p. 117. The intensity formula and the
  Markov property hold for every `γ ≥ 0`, by the same computation.
- **The hard-core process** (`straussDensity_zero_eq`): for `γ = 0`, the Strauss function is
  `β^{n(x)}` on configurations whose distinct points are more than `R` apart and `0` elsewhere;
  it is hereditary; and where it is nonzero, its Papangelou intensity at `ξ ∉ x` is `β` if `ξ`
  is more than `R` from every point of `x` and `0` otherwise. Møller and Waagepetersen,
  Example 6.1 (the case `γ = 0`); van Lieshout (2019), Example 4.10, pp. 105–106; van Lieshout
  (2000), (2.1), p. 43, and Example 2.3, p. 47, with hard-core distance `2R` in place of `R`.
  Proof: `closePairs R x = 0` exactly when no two distinct points are within `R`, and the
  property passes to subsets.
- **Non-integrability for `γ > 1`** (`strauss_lintegral_eq_top`): for an atomless `μ`, a window
  with `μ(W) > 0`, `β > 0`, `R > 0` and `γ > 1`, `∫ h d(poissonConfigLaw μ W) = ∞`. Møller and
  Waagepetersen, Example 6.1 (Kelly and Ripley); van Lieshout (2000), Theorem 4.1 and its proof,
  pp. 117–118. Proof: `S` is separable, so some ball `B` of radius `R/2` has `μ(W ∩ B) > 0`, and
  configurations in `W ∩ B` with `n` points have `n(n − 1)/2` close pairs, so the Poisson series
  dominates `∑ (β μ(W ∩ B))ⁿ γ^{n(n−1)/2}/n! = ∞`.
- **A fixed number of points** (`strauss_fixed_number`): for an atomless `μ`, a window and
  `β > 0`, the integral of `straussDensity β γ R ∘ toConfig` against `(μ|W)^n` is finite for
  every `γ ≥ 0`; it is positive for `γ > 0` when `μ(W) > 0`; and for `γ = 0` it is positive iff
  the set of tuples with all pairwise distances greater than `R` has positive `(μ|W)^n`-measure.
  Møller and Waagepetersen (6.15); van Lieshout (2000), p. 118. Proof: the integrand is at most
  `max(1, β)ⁿ max(1, γ)^{n²}`, it is positive everywhere for `γ > 0`, and for `γ = 0` it is
  `βⁿ` times the indicator of the separated tuples.

**Checks.**

- Papangelou intensity at `β = 2`, `γ = 1/2`, `R = 1`, `x = {0, 0.5, 2}`, `ξ = 0.8`: two points
  of `x` lie within `R` of `ξ`, and `h(x ∪ {ξ})/h(x) = 2⁴γ³/(2³γ) = 0.5 = βγ²`.
- `γ = 1`: `straussDensity β 1 R = β^{n(x)}`, so `configLaw μ W` of it is the Poisson law of
  intensity `β` (1.2, 1.3).
- `straussDensity_zero_eq` at `β = 2`, `R = 1`, `x = {0, 1.5}` on `ℝ`: the density is `4`; the
  Papangelou intensity is `0` at `ξ = 0.8`, within `R` of `0`, and `2` at `ξ = 3`.
- `straussDensity_zero_eq` (negative control on the convention): at `x = {0, 1}` with `R = 1`
  the density is `0`, since the pair at distance exactly `R` is a close pair; the convention
  "distance at least `R`" would give `β²`. The two conventions differ only on a null set when
  distances have atomless laws.
- `strauss_lintegral_eq_top` at `β μ(W ∩ B) = 0.3`, `γ = 1.5`: the partial sums of the
  dominating series are `1.388` at `n ≤ 10`, `4.24 · 10⁴` at `n ≤ 20` and `3.3 · 10⁶⁸` at
  `n ≤ 40`.
- `strauss_lintegral_eq_top` (negative control): for `μ = δ_a` the configurations are `∅` and
  `{a}`, and `∫ h = e^{−1}(1 + (e − 1)β)` is finite for every `γ`; the atomless hypothesis cannot
  be dropped.

### 4.2 Multiscale processes

- `pairsIn a b x`, the number of pairs at a distance in `(a, b]`, and
  `multiscaleDensity β γ R x = β^{n(x)} ∏ᵢ γᵢ^{sᵢ(x)}` with `γ : Fin (k + 1) → ℝ≥0` and change
  points `R : Fin (k + 2) → ℝ`, `0 = R₀ < R₁ < … < R_{k+1}`, `sᵢ` counting pairs at a distance in
  `(Rᵢ, Rᵢ₊₁]`. Møller and Waagepetersen, Example 6.2 and (6.16)–(6.17); van Lieshout (2000),
  Example 4.6, p. 124.
- **Local stability** (`multiscale_isLocallyStable`): if every `γᵢ ≤ 1`, the multiscale function
  is locally stable with `φ ≡ β`; if `γ₀ = 0` and `W` has compact closure, there is `n₀` bounding
  the number of points of every configuration in `W` with `h ≠ 0`, and the function is locally
  stable with `φ ≡ β ∏_{i ≠ 0} max(1, γᵢ)^{n₀ − 1}`. Møller and Waagepetersen, Example 6.2, cases
  (i) and (ii), where case (i) also asks `γ₀ > 0` to separate the two cases. Proof of (ii): the
  points of such a configuration are pairwise more than `R₁` apart, and a compact set contains at
  most finitely many such points; each count in `λ*(x, ξ)` is at most `n(x) ≤ n₀ − 1`.

**Checks.**

- With `k = 0` the multiscale function is the Strauss function with `R = R₁`.
- In `W = [0, 1]` with `R₁ = 0.3`, at most `n₀ = 4` points are pairwise more than `0.3` apart.

### 4.3 Area-interaction processes

- `areaInteractionDensity μ β γ R x = β^{n(x)} γ^{−μ(Uₓ)}` with `Uₓ = ⋃_{ξ ∈ x} B(ξ, R)` the
  union of closed balls, for `β ≥ 0`, `γ > 0`. Møller and Waagepetersen, Example 6.5 and (6.27);
  van Lieshout (2000), Theorem 4.3, pp. 124–125.
- **Conditional intensity and range** (`areaInteraction_papangelou`): for `β, γ > 0` and `ξ ∉ x`,
  `λ*(x, ξ) = β γ^{−μ(B(ξ, R) ∖ Uₓ)}`, and the function is Markov for `d(ξ, η) ≤ 2R`. Møller and
  Waagepetersen, Example 6.5; van Lieshout (2000), p. 128. Proof:
  `μ(Uₓ ∪ B(ξ, R)) − μ(Uₓ) = μ(B(ξ, R) ∖ Uₓ)`, and `B(ξ, R) ∖ Uₓ` depends only on the points
  of `x` within `2R` of `ξ`.
- **Local stability** (`areaInteraction_isLocallyStable`): for `γ ≥ 1` the function is locally
  stable with `φ ≡ β` (attractive), and for `γ ≤ 1` with `φ ≡ β γ^{−b}` when every closed ball of
  radius `R` has measure at most `b` (repulsive). Møller and Waagepetersen, Example 6.5, with
  `b = ω_d R^d` for Lebesgue measure on `ℝ^d`.

**Checks.**

- On `ℝ` with `R = 1`, `x = {0, 1.5}` and `ξ = 3`: `Uₓ = [−1, 2.5]` and `B(3, 1) ∖ Uₓ = (2.5, 4]`
  has length `1.5`, so `λ* = βγ^{−1.5}`; removing the point `0`, at distance `3 > 2R`, leaves it
  unchanged.
- `γ = 1` gives the Poisson function `β^{n(x)}`.

## Layer 5: finite-volume Gibbs measures

### 5.1 Energies and the partition function

- An energy `H : Finset S → WithTop ℝ` is non-degenerate (`IsNonDegenerate`, `H(∅) < ∞`),
  hereditary (`IsHereditaryEnergy`, `H(x) < ∞` gives `H(x ∖ {ξ}) < ∞`), stable
  (`IsStableEnergy`, `H(x) ≥ A n(x)` for a constant `A`) and measurable (`IsEnergyMeasurable`,
  its finite part and `{H = ⊤}`). Dereudre, Definition 5.1, p. 185, with the examples of pp.
  186–187 (pairwise interactions such as Strauss and Lennard-Jones, and Widom–Rowlinson).
- `gibbsWeight β H x` (Conventions), `partitionFunction μ Λ z β H = ∫ z^{n(x)} e^{−βH(x)}` and
  `gibbsLaw μ Λ z β H`, the law `Z⁻¹ z^{n(x)} e^{−βH(x)} · poissonConfigLaw μ Λ`. Dereudre,
  Definition 5.2 and (5.6), p. 188.
- **Finiteness and bounds** (`partitionFunction_pos_lt_top`): for an atomless `μ`, a window `Λ`, a
  non-degenerate measurable energy with `H(x) ≥ A n(x)`, any `z ≥ 0` and `β ≥ 0`,
  `e^{−μ(Λ)} e^{−βH(∅)} ≤ Z ≤ e^{μ(Λ)(z e^{−βA} − 1)}`, so `0 < Z < ∞`. Dereudre, p. 188. The
  upper bound is the Poisson series of `(z e^{−βA})^{n(x)}`.
- **The Poisson case** (`gibbsLaw_zero`): at `β = 0` the Gibbs measure is
  `poissonConfigLaw (z • μ) Λ`, for every energy. Dereudre, p. 188. Proof: the weight is `1`, and
  1.2–1.3 identify `z^{n(x)} e^{(1 − z)μ(Λ)}` as the Poisson density of intensity `z`.

**Checks.**

- `H(x) = A n(x)` with `A = 0.4`, `z = 3`, `β = 1/2`, `μ(Λ) = 2`: `Z = 18.4006`, equal to the
  upper bound, and the lower bound is `e^{−2} = 0.1353`.
- `gibbsWeight` at `β = 0` on a hard-core energy is `1` everywhere, so `gibbsLaw μ Λ z 0 H` is the
  Poisson law and puts positive mass on configurations violating the hard core. The convention
  that gives weight `0` to `{H = ⊤}` also at `β = 0` would give the conditioned Poisson law
  instead, and would break `gibbsLaw_zero`.
- `partitionFunction_pos_lt_top` (negative control): the Strauss energy `−log γ · s_R` with
  `γ > 1` is not stable, and `Z = ∞` by 4.1.

### 5.2 The Georgii–Nguyen–Zessin characterisation

- `gibbsIntensity z β H x ξ`, equal to `z` where `H x = ⊤` and to
  `z e^{−β(H(x ∪ {ξ}) − H(x))}` otherwise, the Papangelou intensity `z e^{−β h(ξ, x)}` with the
  local energy of Dereudre, Definition 5.4, p. 192.
- **Its Papangelou intensity** (`papangelou_gibbsWeight`): where `z^{n(x)} gibbsWeight β H x ≠ 0`
  and `ξ ∉ x`, `papangelou` of the unnormalised Gibbs density is `gibbsIntensity z β H x ξ`.
- **Characterisation** (`map_eq_gibbsLaw_iff_gnz`): let `μ` be atomless, `Λ` a window, `H` a
  non-degenerate, hereditary, stable, measurable energy, `z > 0` and `β ≥ 0`.
  A measurable random configuration `X` has law `gibbsLaw μ Λ z β H` iff
  `E ∑_{ξ ∈ X} g(ξ, X ∖ {ξ}) = ∫_Λ E[g(ξ, X) gibbsIntensity z β H X ξ] dμ(ξ)` for every
  measurable `g ≥ 0`. Dereudre, Propositions 5.4 and 5.5, pp. 192–193. The forward direction is
  `gnz_of_hasConfigDensity` with `papangelou_gibbsWeight`; the converse takes `g` an indicator
  times `1_{ξ ∉ Λ}` to put `X` in `Λ`, and then `eq_mul_prod_papangelou` determines the
  Janossy densities from the intensity.

**Checks.**

- For `H = 0` the intensity is `z`, and the characterisation is the Mecke formula of the Poisson
  process of intensity `z` (SpatialPointProcessFoundations §5.3, through the bridge of 1.2).
- `gibbsIntensity` at `H x = ⊤` is `z`, not `0`: with `∞ − ∞ = 0`. The value matters only on a
  null set, since `H(X) < ∞` almost surely under the Gibbs measure.

### 5.3 The DLR equation

- `dlrWeight z β H Δ y x = z^{n(y)} e^{−β(H(y ∪ x_{Δᶜ}) − H(x_{Δᶜ}))}`, written with the ratio
  of Gibbs weights, which is the weight `z^{n(y)} e^{−βH_Δ(y ∪ x_{Δᶜ})}` of Dereudre,
  Definition 5.3, p. 190, wherever `H(x_{Δᶜ}) < ∞`.
- **DLR equation** (`gibbs_dlr`): under the hypotheses of 5.2 and for measurable `Δ ⊆ Λ`, for
  every measurable `f ≥ 0`, `∫ f dP^{z,β}_Λ` equals the integral against
  `P^{z,β}_Λ(dx)` of `∫ f(y ∪ x_{Δᶜ}) dlrWeight(y, x) dΠ_Δ(y) / ∫ dlrWeight(y, x) dΠ_Δ(y)`:
  the conditional law of the configuration in `Δ` given the configuration outside `Δ` has
  density `Z_Δ(x_{Δᶜ})⁻¹ z^{n(y)} e^{−βH_Δ}` against `poissonConfigLaw μ Δ`. Dereudre,
  Proposition 5.3 and (5.9), p. 191. Proof: `poissonConfigLaw μ Λ` is the image of the product
  of the Poisson laws of `Δ` and `Λ ∖ Δ` under union, and the Gibbs density factorises through
  the ratio of weights; heredity makes the denominator positive almost surely.

**Checks.**

- For `H = 0` the DLR weight is `z^{n(y)}`, and the conditional law in `Δ` is the Poisson law
  of intensity `z` on `Δ`, independent of the outside.

### 5.4 The variational principle

- **Variational principle** (`gibbs_variational`): under the hypotheses of 5.2, for every
  probability measure `Q` on configurations with `Q(H = ⊤) = 0`, `H` integrable and `n` integrable,
  `−log Z ≤ β E_Q H − log z E_Q n + klDiv Q (poissonConfigLaw μ Λ)` in `EReal`, with equality iff
  `Q = gibbsLaw μ Λ z β H`. Dereudre, Proposition 5.1, (5.7)–(5.8), p. 189. Proof: Jensen's
  inequality for `log` applied to `z^{n} e^{−βH} / f` under `Q`, where `f` is the density of `Q`;
  the relative entropy is Mathlib's `klDiv`.

**Checks.**

- `H = 0`, `z = 3`, `μ(Λ) = 2`: `−log Z = −(z − 1)μ(Λ) = −4`; at the Poisson law of intensity
  `3` the functional is `−6.5917 + 2.5917 = −4`, and at the Poisson law of intensity `1` it is
  `−2 log 3 = −2.197 > −4`.
- At `β = 0` with a hard-core energy the Gibbs measure charges `{H = ⊤}`, so it is not among the
  admissible `Q`; the inequality still holds, and equality is attained by no admissible `Q`.

### 5.5 Derivatives in the activity and the inverse temperature

- **Activity** (`hasDerivAt_gibbs_meanCount`): for a finite-valued measurable energy with
  `H(x) ≥ A n(x)`, `β ≥ 0` and `z > 0`, `d/dz E n = Var(n)/z` under the Gibbs measure.
  Dereudre, Proposition 5.2, p. 190.
- **Inverse temperature** (`hasDerivAt_gibbs_meanEnergy`): under the same hypotheses with
  `β > 0`, `d/dβ E H = −Var(H)`. Dereudre, Proposition 5.2, p. 190. Proof of both:
  differentiate the tilted family `z^{n} e^{−βH}` under the integral, with the moment bounds that
  stability gives.

**Checks.**

- `H(x) = 0.4 n(x)`, `z = 3`, `β = 1/2`, Lebesgue measure on a window of area `2`: `n` is
  Poisson with mean
  `z e^{−βA} μ(Λ) = 4.9124`; finite differences give `d/dz E n = 1.63746 = Var(n)/z` and
  `d/dβ E H = −0.78598 = −Var(H)`.

## Layer 6: likelihood and pseudolikelihood

### 6.1 Poisson likelihood

Let `C : S → ℝ^p` (in `EuclideanSpace ℝ (Fin p)`) be measurable and bounded on the window `W`.

- `logLinearLogLik μ W C x θ = ∑_{u ∈ x} ⟪θ, C u⟫ − ∫_W e^{⟪θ, C u⟫} dμ + μ(W)`, the
  log-likelihood of the intensity `λ_θ(u) = e^{⟪θ, C u⟫}` against `poissonConfigLaw μ W`;
  `logLinearScore` and `logLinearFisher`, the score `∑_{u ∈ x} C u − ∫_W C λ_θ dμ` and the
  Fisher information `∫_W C Cᵀ λ_θ dμ`. Van Lieshout (2019), §4.8, (4.10), p. 113; Møller and
  Waagepetersen (2007), (42), p. 664.
- **Log-likelihood** (`poissonConfigDensity_logLinear`): `poissonConfigDensity μ W λ_θ x` is
  `exp (logLinearLogLik μ W C x θ)`, so with `poissonConfigLaw_withDensity_eq` the Poisson law of
  intensity `λ_θ · μ` has log-density `logLinearLogLik` against `poissonConfigLaw μ W`.
- **Concavity** (`concaveOn_logLinearLogLik`): `θ ↦ logLinearLogLik μ W C x θ` is concave.
- **Score and information** (`hasGradientAt_logLinearLogLik`): the gradient of the
  log-likelihood is the score, and the derivative of the score is minus the Fisher information.
  Van Lieshout (2019), (4.10), p. 113. Proof: differentiate under the integral, dominated by
  `K e^{|θ| K}` on `W`.

**Checks.**

- `W = [0, 1]`, `C(u) = u`, `x = {0.2, 0.9}`, `θ = 0.7`: the derivative of the log-likelihood and
  the score are both `0.29209`; the derivative of the score and minus the Fisher information are
  both `−0.56849`; `poissonConfigDensity` and `exp` of the log-likelihood are both `1.37958`.

### 6.2 The composite score

- **Composite score** (`integral_compositeScore`): if `X` has intensity `ρ · μ` on `W`
  (`HasIntensity`) and `ψ : S → ℝ^p` is measurable with `∫_W ‖ψ‖ ρ dμ < ∞`, then
  `∑_{u ∈ X} ψ(u)` is integrable and `E[∑_{u ∈ X} ψ(u) − ∫_W ψ ρ dμ] = 0`. With
  `ψ = ∇_θ log ρ_θ` at the true parameter this is the mean-zero property of the first-order
  composite score `∑_{u ∈ X} ∇ log ρ_θ(u) − ∫_W ∇ρ_θ`. Møller and Waagepetersen (2007), (47),
  p. 672, by Campbell's formula (4), p. 648.

**Checks.**

- Poisson process of intensity `2` on `[0, 1]` with `ψ(u) = u`: `E ∑ ψ = ∫ 2u du = 1`, and a
  Monte Carlo mean of the score over `2 · 10⁵` samples is `−0.001`.

### 6.3 Pseudolikelihood

- `pseudolikelihood lam μ A x = exp(−∫_A λ(x, ξ) dμ) ∏_{ξ ∈ x ∩ A} λ(x ∖ {ξ}, ξ)` in `ℝ≥0∞`, for
  `lam : Finset S → S → ℝ≥0`; `cellConditionalDensity μ f B x`, the density of the
  configuration in `B` given the configuration outside `B`, which is `f(x)` divided by
  `∫ f(y ∪ x_{Bᶜ}) dΠ_B(y)`; `expFamilyIntensity b t θ`, the conditional intensity
  `b e^{⟪θ, t⟫}`. Møller and Waagepetersen, §9.2.1 and (9.13); Gaetan and Guyon (5.40), p. 220.
- **The limit of cell products** (`tendsto_prod_cellConditionalDensity`): let `μ` be atomless,
  `f` measurable, hereditary and Ruelle stable on a window `W` with integrable bound, `A ⊆ W`,
  `x ⊆ W` with `f(x) ≠ 0`, and let the cells `A_{n,1}, …, A_{n,mₙ}` be measurable, disjoint,
  cover `A`, refine as `n` grows, eventually contain at most one point of `x` each, and satisfy
  `mₙ (maxⱼ μ(A_{n,j}))² → 0`. Then `e^{−μ(A)} ∏ⱼ cellConditionalDensity μ f A_{n,j} x` tends to
  `pseudolikelihood (papangelou f) μ A x`. Møller and Waagepetersen, (9.12)–(9.13), citing
  Jensen and Møller (1991), Theorem 2.2; Gaetan and Guyon, Theorem 5.8 and (5.39), p. 220.
  Proof: for a cell with no point of `x`, the conditional density is
  `e^{μ(B)}/(1 + ∫_B λ*(x, ξ) dμ + O((∫_B φ)²))`, and for a cell with one point `ξ₀` it is
  `e^{μ(B)} λ*(x ∖ {ξ₀}, ξ₀)` over the same denominator; the product of the denominators tends to
  `exp ∫_A λ*(x, ξ) dμ` since `∑ⱼ (∫_{A_{n,j}} φ)² → 0`.
- **Unbiased score** (`pseudolikelihood_score_mean_zero`): if `X` has a measurable hereditary
  density `f` on `W` (atomless `μ`), `A ⊆ W` is measurable and `ψ : Finset S → S → ℝ` is
  measurable with `E ∑_{ξ ∈ X ∩ A} |ψ(X ∖ {ξ}, ξ)| < ∞`, then
  `E[∑_{ξ ∈ X ∩ A} ψ(X ∖ {ξ}, ξ) − ∫_A ψ(X, ξ) λ*(X, ξ) dμ] = 0`. By `gnz_of_hasConfigDensity`
  the integrability of the sum is that of the integral. With `ψ = ∇_θ log λ*_θ` this is the
  mean-zero property of the pseudo-score. Møller and Waagepetersen (2007), p. 672, by the
  formula (31), p. 657.
- **Concavity for exponential families** (`concaveOn_log_pseudolikelihood`): for
  `λ_θ(x, ξ) = b(x, ξ) e^{⟪θ, t(x, ξ)⟫}` with `b > 0` and `∫_A λ_θ(x, ·) dμ < ∞` for every `θ`,
  `θ ↦ log pseudolikelihood λ_θ μ A x` is concave. Møller and Waagepetersen (9.15)–(9.16),
  citing Jensen and Møller (1991), Proposition 2.3; Gaetan and Guyon, p. 220.
- **The Poisson case** (`pseudolikelihood_poisson`): for `λ(x, ξ) = ρ(ξ)` and `x ⊆ W`,
  `pseudolikelihood λ μ W x = e^{−μ(W)} poissonConfigDensity μ W ρ x`, the likelihood of 6.1
  times `e^{−μ(W)}`. Møller and Waagepetersen, text after Remark 9.2.

**Checks.**

- Strauss with `β = 2`, `γ = 1/2`, `R = 0.1` on `A = W = [0, 1]` and `x = {0.3, 0.35, 0.7}`, cells
  of length `1/m`: `e^{−1}` times the product of the cell conditional densities is `0.42801`,
  `0.45138`, `0.45631`, `0.45725` at `m = 20, 100, 500, 2000`, against the pseudolikelihood
  `0.45756`. Without the factor `e^{−μ(A)}` the product tends to `e · 0.45756`.
- `pseudolikelihood_poisson` with `ρ ≡ 2` on `[0, 1]` and two points: both sides are
  `4 e^{−2} = 0.54134`.
- `pseudolikelihood` (negative control): Gaetan and Guyon print the limit of Theorem 5.8 with the
  factor `exp{λ ν(S) − Λ_θ(S, x)}`; the factor `λ` is a misprint, since for the Poisson process of
  intensity `1` the cell product is `1` and the limit is `exp{ν(S) − ν(S)}`.

## Layer 7: ergodicity of Markov kernels on general state spaces

### 7.1 Small sets and ergodicity

For a kernel `κ` on a measurable space, an invariant probability `π` and a set `E` of starting
points:

- `IsSmallSet κ n M C`: `M ≤ (κ ^ n) x` for every `x ∈ C`. Møller and Waagepetersen (7.16).
- `IsUniformlyErgodicOn κ π E`: `tvDist ((κ ^ m) x) π ≤ C r^m` for some `C` and `0 ≤ r < 1`,
  uniformly in `x ∈ E`; `IsVUniformlyErgodicOn κ π E V`: for every measurable `g` with
  `|g| ≤ V`, `g` is integrable for `(κ ^ m) x` and `π` and
  `|∫ g d(κ ^ m) x − ∫ g dπ| ≤ C V(x) r^m`. Møller and Waagepetersen, §7.2, (7.18)–(7.19).

### 7.2 Doeblin's bound

- **Doeblin** (`tvDist_pow_le_of_isSmallSet`): let `κ` be Markov with invariant probability `π`,
  `E` measurable, absorbing (`κ x Eᶜ = 0` for `x ∈ E`) and of full `π`-measure, and `E`
  `(n₀, M)`-small. Then `tvDist ((κ ^ m) x) π ≤ 2 (1 − M(α))^{⌊m/n₀⌋}` for `x ∈ E` and every
  `m`, and for `n₀ ≥ 1` and `M ≠ 0` the chain is uniformly ergodic on `E`. Møller and
  Waagepetersen, Proposition 7.8 and (7.20), with the exponent corrected from `m/n₀` to
  `⌊m/n₀⌋`. Proof: `κ^{n₀}(x, ·) = M + (1 − M(α)) R(x, ·)` with `R` a Markov kernel on `E`
  gives the contraction `tvDist (ν κ^{n₀}) (ν' κ^{n₀}) ≤ (1 − M(α)) tvDist ν ν'` for
  probabilities on `E`; apply it `⌊m/n₀⌋` times to `δₓ κ^{m mod n₀}` and `π`.

**Checks.**

- `tvDist_pow_le_of_isSmallSet` (negative control for the exponent): on `{0, 1, 2, 3}` with
  `x ↦ x − 1` and `0 ↦ 0`, `κ³(x, ·) = δ₀` for every `x`, so the state space is `(3, δ₀)`-small and
  `π = δ₀`. From `x = 3`, `tvDist (κ^m(3, ·)) π = 2` for `m = 1, 2`, while the bound with
  exponent `m/n₀` is `2 · 0^{m/3} = 0`; the floor gives `2 · 0⁰ = 2`.
- With `n₀ = 0` the bound is the trivial `tvDist ≤ 2`.

### 7.3 Geometric drift

- **Drift and small level sets** (`isVUniformlyErgodicOn_of_drift`): let `κ`, `π`, `E` be as in
  7.2, `V ≥ 1` measurable and finite on `E`, and suppose `∫ V dκ(x, ·) ≤ a V(x) + b` on `E` with
  `a < 1`, and that every level set `{x ∈ E | V(x) ≤ R}` is `(n, M)`-small for some `n ≥ 1` and
  `M ≠ 0`. Then the chain is `V`-uniformly ergodic on `E`. Adaptation of Møller and
  Waagepetersen, Proposition 7.9 and (7.21), where aperiodicity and irreducibility are assumed
  and only one small set is used: here the smallness of every level set replaces both. Proof:
  iterating the drift gives `κ^n V ≤ aⁿ V + b/(1 − a)`; take `R > 2b/(1 − a)²` and its `n`,
  and show that `κ^n` contracts the weighted norm `‖ν‖ = ∫ (1 + δ V) d|ν|` for a small `δ > 0`
  (on `{V ≤ R}` by the minorisation, off it by the drift); intermediate times use
  `κ^r V ≤ V + b/(1 − a)`.

**Checks.**

- A deterministic two-cycle has a small level set `{0}` but the level set `{0, 1}` is not small
  (`κ^n(0, ·)` and `κ^n(1, ·)` are disjoint Dirac measures); it is not uniformly ergodic, so the
  smallness of every level set cannot be weakened to that of one set without an aperiodicity
  hypothesis.

## Layer 8: the birth–death Metropolis–Hastings algorithm

### 8.1 The kernel

Let `W` be a window, `φ : S → ℝ≥0` measurable with `0 < c = ∫_W φ dμ < ∞`, `h` measurable and
locally stable on `W` with bound `φ`, `h(∅) ≠ 0`, `h = 0` off the configurations in `W`, and
`0 < p < 1`; `IsBirthDeathSetting μ W φ p h` collects these hypotheses, and `μ` is atomless.

- `birthDeathProposal μ W φ p x`: with probability `p` propose the birth of a point of density
  `φ/c` on `W`; otherwise propose the death of a uniformly chosen point of `x`, or stay at `∅`.
- `birthDeathAcceptance μ W φ p h x y`: the birth `x → x ∪ {ξ}` is accepted with probability
  `min{1, h(x ∪ {ξ})(1 − p)c / (h(x)φ(ξ)p(n(x) + 1))}` and the death `x → x ∖ {η}` with
  probability `min{1, h(x ∖ {η})φ(η)p n(x) / (h(x)(1 − p)c)}`; from `h(x) = 0` every move is
  accepted (the convention `a/0 = 1` of Møller and Waagepetersen (7.6)–(7.7)).
- `birthDeathKernel μ W φ p h Q` is `mhKernel Q (birthDeathAcceptance μ W φ p h)`, the
  Metropolis–Hastings kernel of LangevinAndHamiltonianMonteCarlo §1.1, for a proposal kernel `Q`
  with `Q x = birthDeathProposal μ W φ p x` for every `x`; the theorems of 8.2–8.4 hold for every
  such `Q`, and `birthDeathConst μ W φ p = min{1 − p, p/c}`. Møller and Waagepetersen,
  Algorithm 7.4 and Remark 7.6, (7.9); van Lieshout (2019), Theorem 4.5, p. 116; Gaetan and
  Guyon, §4.4 and Proposition 4.2, p. 131.
- **Measurability** (`birthDeath_measurable`): the proposal is a measurable family of probability
  measures, so a proposal kernel `Q` exists and is Markov, and the acceptance function is jointly
  measurable on `Finset S × Finset S`, so that the acceptance part of `mhKernel` is not the junk
  value `0`. Proof route: the maps of 1.1 (insertion, removal of a point, the number of points)
  and the measurability of `{(x, y) | x ⊆ y, n(y ∖ x) = 1}`; the total mass is
  `p c⁻¹ c + (1 − p) = 1`.

**Checks.**

- With `h(x) = β^{n(x)}` and `φ ≡ β` on a window with `μ(W) = 1`, births are accepted with
  probability `min{1, (1 − p)β/(p(n + 1))}` and deaths with `min{1, p n/((1 − p)β)}`, the
  birth–death chain of the count of a Poisson law.
- `mhKernel` (negative control): if the acceptance function were not jointly measurable, the
  acceptance part of `mhKernel` would be `0` and the kernel would be the identity, which is
  reversible for every measure and not irreducible; the measurability of `birthDeath_measurable`
  is what makes 8.2 meaningful.

### 8.2 Reversibility and irreducibility

- **Reversibility** (`birthDeathKernel_isReversible`): the kernel is a Markov kernel, reversible
  with respect to `h · poissonConfigLaw μ W` and invariant for `configLaw μ W h`. Møller and
  Waagepetersen, Proposition 7.12 and (7.27); van Lieshout (2019), Theorem 4.5, p. 116. Proof:
  `birthDeath_measurable` and the Markov property of `mhKernel` for acceptance at most `1`
  (LangevinAndHamiltonianMonteCarlo §1.1); by the reversibility criterion there it suffices that
  the accepted part `Q.withDensity (birthDeathAcceptance μ W φ p h)` is reversible; the birth flow
  from `x` to `x ∪ {ξ}` and the death flow back are both
  `min{p h(x) φ(ξ)/c, (1 − p) h(x ∪ {ξ})/(n(x) + 1)}` against `μ(dξ)` and the Poisson weights;
  invariance follows by `Kernel.IsReversible.invariant` after normalising.
- **Irreducibility and the atom** (`birthDeathKernel_isIrreducible`): the kernel is irreducible
  with respect to `δ_∅` (Mathlib's `Kernel.IsIrreducible`), and for `h(x) ≠ 0` and `m ≥ n(x)`,
  `κ^m(x, {∅}) ≥ birthDeathConst^m`. Møller and Waagepetersen, Proposition 7.13, (7.10)–(7.11),
  and the proof of Proposition 7.14(i), (7.28); van Lieshout (2019), proof of Theorem 4.5, p. 117;
  Gaetan and Guyon, proof of Proposition 4.2, p. 131. Proof: by local stability each death
  ratio is at least `p n(x)/((1 − p)c)`, so the probability of some death is at least
  `min{1 − p, p/c}`, and `κ(∅, {∅}) ≥ 1 − p`; from `h(x) = 0` every proposed death is accepted.
  Since `κ^m(x, {∅}) > 0` for all `m ≥ n(x)`, the chain is aperiodic.

**Checks.**

- The count chain of the Check of 8.1 with `β = 2`, `p = 1/2`, `c = 2` and the bound `n ≤ n₀`
  (`h = 2^{n} 1_{n ≤ n₀}`) satisfies detailed balance with `π(n) ∝ 2ⁿ/n!` to `10⁻¹⁶` for
  `n₀ = 1, …, 4`, and `κ^m(n, {0}) ≥ (1/4)^m` for all `m ≥ n`.
- Start outside the support: from `x = {u}` with `u ∉ W`, so `h(x) = 0`, the proposed death to
  `∅` is accepted with probability `1`, and `κ(x, {∅}) = 1 − p`. So `δ_∅`-irreducibility holds
  from every start, while the ergodicity statements of 8.3–8.4 are on `{h ≠ 0}`, where the
  chain stays once it is there (a move into `{h = 0}` has acceptance `0`).

### 8.3 Small sets and V-uniform ergodicity

- **Small sets** (`birthDeath_isSmallSet`): every set `{x | h(x) ≠ 0, n(x) ≤ k}` is
  `(k, birthDeathConst^k δ_∅)`-small. Møller and Waagepetersen, Proposition 7.14(i) and (7.28).
- **V-uniform ergodicity** (`birthDeath_isVUniformlyErgodicOn`): for every `β > 1` the chain is
  `V`-uniformly ergodic on `{h ≠ 0}` with `V(x) = β^{n(x)}`, towards `configLaw μ W h`. Møller and
  Waagepetersen, Proposition 7.14(ii). Proof: 7.3 with the small sets above and the drift
  `∫ V dκ(x, ·) ≤ a V(x)` for `n(x) > α`, where
  `a = p[1 + (β − 1)(1 − p)c/(p(α + 1))] + (1 − p)/β < 1` for large `α`, and
  `∫ V dκ(x, ·) ≤ β^{α + 1}` for `n(x) ≤ α`.

**Checks.**

- `p = 1/2`, `c = 2`, `β = 2`: `a = 1/2 (1 + 2/(α + 1)) + 1/4`, which is below `1` exactly for
  `α > 3`.

### 8.4 Uniform ergodicity

- **Characterisation** (`birthDeath_isUniformlyErgodicOn_iff`): the chain is uniformly ergodic
  on `{h ≠ 0}` iff there is `n₀ ≥ 1` with `n(x) ≤ n₀` whenever `h(x) ≠ 0`. Møller and
  Waagepetersen, Proposition 7.14(iii). Proof: if the counts are bounded, `{h ≠ 0}` is
  `(n₀, birthDeathConst^{n₀} δ_∅)`-small by 8.3 and 7.2 applies; if not, at most one point is
  deleted per step, so `κ^m(x, {y | n(y) < n(x) − m}) = 0` and
  `tvDist (κ^m(x, ·)) π ≥ 2 π{n < n(x) − m}`, which tends to `2` as `n(x) → ∞`.
- **The bound** (`birthDeath_tvDist_le`): if `n(x) ≤ n₀` on `{h ≠ 0}` with `n₀ ≥ 1`, then
  `tvDist (κ^m(x, ·)) (configLaw μ W h) ≤ 2 (1 − birthDeathConst^{n₀})^{⌊m/n₀⌋}` for every `x`
  with `h(x) ≠ 0`. Møller and Waagepetersen, Proposition 7.14(iii), with the exponent corrected
  to `⌊m/n₀⌋` as in 7.2 and the factor `2` of Mathlib's `tvDist`.

**Checks.**

- The count chain of 8.2 with `n₀ = 3` started at `∅`, where the total variation distance of the
  configurations equals that of the counts: `tvDist = 1.0526, 0.5526, 0.4276` at `m = 1, 2, 3`,
  below the bound `2 (1 − 4⁻³)^{⌊m/3⌋} = 2, 2, 1.9688`; the bound holds for `m ≤ 12` and
  `n₀ = 1, …, 4`.

## Downstream consumers

- InfiniteVolumeGibbsPointProcesses (spatial statistics family) consumes the configuration
  carrier and the reference law with its Poisson sums (1.1–1.2), the area-interaction density
  (4.3), the energies, the Gibbs weight with its `β = 0` convention, the finiteness of the
  partition function, the Georgii–Nguyen–Zessin characterisation and the DLR equation
  (5.1–5.3), and the pseudolikelihood (6.3) for its pseudolikelihood consistency theorem.
- PointProcessLikelihood (spatial statistics family) consumes the configuration carrier, the
  reference law with its Poisson sums, `poissonConfigDensity`, the Poisson density theorem and
  Campbell's formula (1.1–1.3); its log-likelihood of a parametric intensity generalizes the
  log-linear case of 6.1.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Configurations.** The final σ-algebra on finite sets, its standard Borel structure, the
   measurability of the operations on configurations and of sums over their points, the
   conversions to and from point measures, the Poisson reference law with its Poisson sums and
   generating function, and the bridge to the Poisson process of
   SpatialPointProcessFoundations; finite point processes with a density, Poisson densities,
   the Papangelou intensity, the factorisation by it, the Georgii–Nguyen–Zessin formula and the
   determination of the law by the Papangelou intensity.
2. **Stability.** Local and Ruelle stability, their consequences and the normalisability
   bounds.
3. **Markov functions.** The Hammersley–Clifford–Ripley–Kelly theorem with the conditional
   intensity of a product and the uniqueness of the interaction; the factorisation across
   unrelated sets and the conditional independence of separated regions.
4. **Models.** The Strauss process with its integrability for `γ ≤ 1`, non-integrability for
   `γ > 1` and the fixed-number case; the hard-core process; multiscale and area-interaction
   processes with their local stability and range.
5. **Finite-volume Gibbs measures.** Finiteness and bounds of the partition function, the
   Poisson case `β = 0`, the Georgii–Nguyen–Zessin characterisation, the DLR equation, the
   variational principle and the derivatives in `z` and `β`.
6. **Likelihood.** The Poisson likelihood of a log-linear intensity with its concavity, score
   and information; the first-order composite score; the pseudolikelihood as a limit of cell
   conditional densities, its unbiased score, its concavity for exponential families and the
   Poisson case.
7. **Ergodicity of kernels.** Small sets, uniform and `V`-uniform ergodicity, Doeblin's bound and
   the geometric-drift theorem on general state spaces.
8. **Birth–death Metropolis–Hastings.** The kernel and the measurability of its proposal and
   acceptance, its reversibility and irreducibility, small sets, `V`-uniform ergodicity, and the
   characterisation and bound of uniform ergodicity.

**Not owned here.** The following are used, not built:
- point measures with their atomic decomposition and the σ-algebra generated by counts, Janossy
  measures, Poisson processes on general spaces, their Janossy measures, binomial form,
  simplicity and the Mecke equation: SpatialPointProcessFoundations (spatial statistics family),
  §§1.1–1.2, 4.3 and 5.1–5.4;
- the Metropolis–Hastings kernel `mhKernel`, its Markov property and its reversibility criterion:
  [LangevinAndHamiltonianMonteCarlo](../LangevinAndHamiltonianMonteCarlo/README.md) §1.1;
- kernels, their powers, reversibility, invariance and irreducibility, total variation,
  relative entropy and conditional independence: Mathlib.

Boundaries with neighbouring roadmaps:
- the Hammersley–Clifford theorem for positive laws on finite graphs is Layer 3 of
[GraphicalModelsAndConditionalIndependence](../GraphicalModelsAndConditionalIndependence/README.md)
  and a different theorem (positive densities on product spaces, not hereditary functions on
  finite sets);
- lattice Gibbs measures and the Ising model are
  [GibbsMeasuresAndTheIsingModel](../GibbsMeasuresAndTheIsingModel/README.md);
- infinite-volume Gibbs point processes, their existence and uniqueness, and Takacs–Fiksel
  estimation are InfiniteVolumeGibbsPointProcesses; summary statistics of point patterns are
  SpatialPointPatternStatistics; asymptotic theory of Poisson likelihood (Kutoyants) is
  PointProcessLikelihood (all in the spatial statistics family);
- ergodicity of finite-state chains and mixing times are
  [MarkovChainMixing](../MarkovChainMixing/README.md), which excludes general state spaces; the
  minorisation contraction of transition laws on countable types is
  [HiddenMarkovModels](../HiddenMarkovModels/README.md) §6.1.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Exact supplier contracts

### From Mathlib

- **Measures and kernels:** `Measure.pi`, `Measure.sum`, `Measure.map`, `Measure.withDensity`,
  `NullSingletonClass`, `IsFiniteMeasureOnCompacts`, `ProbabilityTheory.Kernel` with its monoid
  structure (`κ ^ m`), `Kernel.IsReversible`, `Kernel.Invariant`, `Kernel.IsIrreducible`,
  `Kernel.IsReversible.invariant`; `measurePreserving_piFinSuccAbove` for splitting a tuple.
- **Probability:** `tvDist`, `klDiv`, `CondIndepFun` (on a `StandardBorelSpace`), `variance`,
  `iIndepFun`, `HasLaw`, `poissonMeasure`.
- **Analysis:** `HasGradientAt`, `HasFDerivAt`, `ConcaveOn`, `innerSL`,
  `ContinuousLinearMap.smulRight`, `NNReal.rpow`.
- **Measurable structure:** `StandardBorelSpace`, `Fin.cons`, `Kernel.withDensity`.

### From SpatialPointProcessFoundations (spatial statistics family)

SpatialPointProcessFoundations owns random measures and point processes on a locally compact
Polish space. This roadmap consumes, by section of that roadmap:
- §1.1: the carriers `LocallyFiniteMeasure S` and `PointMeasure S` and `IsIntegerValued`
  (local copies), for `PointMeasure.ofFinset` in 1.1 and the statement of the bridge in 1.2, and
  the atomic decomposition of a point measure, for `PointMeasure.toFinset_ofFinset`;
- §1.2: the vague topology and its Borel σ-algebra on the carriers (local copies), and the
  generation of the σ-algebra of point measures by counts, for the measurability of
  `PointMeasure.ofFinset`;
- §4.3: the reconstruction of the law of the restriction to a relatively compact window from its
  Janossy measures;
- §5.1: `IsPoissonRandomMeasure` and `IsPoissonPointProcess` (local copies);
- §5.2: `expNeg` (local copy);
- §5.3: the Janossy measures of a Poisson random measure in a window of finite intensity, and the
  Mecke equation;
- §5.4: the almost sure simplicity of a Poisson process with atomless locally finite intensity,
  and the binomial form of its restriction given the count in a window.

The local copies sit in this roadmap's namespace under their short names, as the foundations
roadmap places its copies of Tau Ceti's definitions. The Poisson property and §§4.3, 5.3–5.4
serve the bridge of 1.2; the Mecke
equation is the case `f = 1` of the Georgii–Nguyen–Zessin formula of 1.3 and the case `H = 0` of
the characterisation of 5.2.

### From LangevinAndHamiltonianMonteCarlo

[LangevinAndHamiltonianMonteCarlo](../LangevinAndHamiltonianMonteCarlo/README.md) §1.1 supplies the
Metropolis–Hastings kernel `mhKernel Q a` of an s-finite proposal kernel and an acceptance
function (local copy, verbatim), its Markov property for a Markov proposal and acceptance at most
`1`, and the criterion that it is reversible with respect to a σ-finite measure iff its accepted
part `Q.withDensity a` is. Layer 8 uses them for the birth–death proposal, whose measurability
(8.1) makes it a kernel.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Continuous-time dynamics:** spatial birth–death processes with detailed balance, their
  existence and convergence to the equilibrium law (Ripley (1977), §4.1, pp. 177–178;
  Møller and Waagepetersen, Chapter 11), and the birth–death–move variant (Proposition 7.15).
- **Perfect simulation:** dominated coupling from the past and the clan-of-ancestors
  construction for locally stable densities.
- **Further models and characterisations:** the Kelly–Ripley characterisation of the Strauss
  family by the form of the conditional intensity (van Lieshout (2000), Theorem 4.2), the
  characterisation of area interaction (Theorem 4.3 there, beyond its density), triplet,
  saturation and connected-component interactions, and marked and multitype Gibbs processes.
- **Moment densities from the conditional intensity**, the second-order identity
  `ρ⁽²⁾(ξ, η) = E[λ*(X, ξ) λ*(X ∪ {ξ}, η)]`, a consequence of the Georgii–Nguyen–Zessin formula
  applied twice.
- **Asymptotics of estimators:** consistency and asymptotic normality of the maximum
  pseudolikelihood estimator (Jensen and Møller; Jensen and Künsch), Monte Carlo maximum
  likelihood and path sampling for Gibbs point processes.

## Prior formalization

Parts of Layers 1–6 and 8 are in `MSSS/GibbsPointProcesses/` of
[lean-MSSS](https://github.com/bjbraams/lean-MSSS), the lean-MSSS spatial statistics project, at
commit 6826ba2, on the carrier `Finset E` of a measure space `E` (its `volume`) with real-valued
densities. Proved there without `sorry` (by inspection of the sources at that commit; a
declaration counts when neither it nor a lemma it uses contains `sorry`), as counterparts of the
sections named, under the lean-MSSS names in the namespace MSSS:
- 1.1, 1.3, 2: in `MSSS/GibbsPointProcesses/Finite/Reference.lean`, isConfigMeasurable_sum_erase
  (measurability of sums over the points, on tuples), poissonIntegral_sum_erase (the Poisson-sum
  identity behind the Georgii–Nguyen–Zessin formula), georgii_nguyen_zessin (the formula of 1.3
  for a reference measure whose restriction to the window is atomless, with tuple-measurable
  `g`), isLocallyStable_consequences, poissonIntegral_lt_top_of_ruelle,
  poissonIntegral_le_of_locallyStable_const and normalisable_of_locallyStable;
- 3, 4.1, 5.1, 5.5, 6.3: in `MSSS/GibbsPointProcesses/Finite.lean`, isMarkovFunction_iff,
  papangelou_markov (the conditional intensity of a product), markov_density_factorization,
  strauss_properties (for `0 ≤ γ ≤ 1`, `β > 0`, `R > 0`, on a normed group),
  strauss_not_normalisable, strauss_fixed_number_integrable (the integrability part of 4.1's
  fixed-number headline), partitionFunction_pos_lt_top (positivity and finiteness, without the
  explicit bounds), hasDerivAt_gibbs_meanCount, hasDerivAt_gibbs_meanEnergy (there for `H ≥ 0`;
  a signed stable energy is dominated through `|H| e^{−bH} ≤ |A| n e^{−bAn} + 1/(e b)` for
  `b > 0`, and similarly for `H²`), concaveOn_log_pseudolikelihood and pseudolikelihood_poisson;
- 6.1–6.2: in `MSSS/GibbsPointProcesses/PoissonLikelihood.lean`, log_poissonDensity,
  concaveOn_logLinearLogLik, hasDerivAt_logLinearLogLik and hasDerivAt_deriv_logLinearLogLik
  (the score and the information as directional derivatives), and integral_compositeScore (for
  a scalar score of a random measure on `ℝ^d`);
- 8: in `MSSS/GibbsPointProcesses/BirthDeath.lean`, birthDeath_irreducible and
  birthDeath_aperiodic, for a real-valued transition operator.

Stated there with `sorry`: hasConfigDensity_gibbs_iff_gnz (5.2), gibbs_dlr (5.3),
gibbs_variational (5.4), tendsto_prod_conditionalDensity_pseudolikelihood and
pseudolikelihood_score_mean_zero (6.3), hasConfigDensity_poisson (1.3), and in Layer 8
birthDeath_reversible, birthDeath_vUniformlyErgodic, birthDeath_uniformlyErgodic_iff and
birthDeath_tv_bound. Not there: the σ-algebra on configurations with its standard Borel
structure, the measurable operations and the conversions to point measures, the bridge to the
general Poisson process, the determination of the law by the Papangelou intensity, the
hard-core process, the Strauss positivity for a fixed number of points, multiscale and area
interaction, the conditional independence of 3.2, the β = 0 identification of 5.1, and Layer 7.

The design differs in three places. lean-MSSS measures configurations through their tuple maps
without a σ-algebra on `Finset E`, and uses real-valued densities; 1.1 defines the final σ-algebra
so that laws of random configurations are measures, and densities here are `ℝ≥0`-valued with
`ℝ≥0∞` integrals. Its birth–death chain is an operator on real functions; Layer 8 defines a Markov
kernel and states ergodicity in Mathlib's `tvDist`.

The map, which is not prescriptive:

| Layer | lean-MSSS files |
|---|---|
| 1–2 | `MSSS/GibbsPointProcesses/Finite/Reference.lean` |
| 3–5, 6.3 | `MSSS/GibbsPointProcesses/Finite.lean` |
| 6.1–6.2 | `MSSS/GibbsPointProcesses/PoissonLikelihood.lean` |
| 8 | `MSSS/GibbsPointProcesses/BirthDeath.lean` |

Related libraries: the open Mathlib pull requests on Markov chains (#34713 on stationary
distributions, #45387 on contraction of row-stochastic matrices) concern finite stochastic
matrices; none concerns Gibbs point processes, Papangelou intensities or general-state
ergodicity.

## References

The locators refer to these editions; page numbers are printed page numbers.

- D. Dereudre, Introduction to the theory of Gibbs point processes, in D. Coupier (ed.),
  *Stochastic Geometry*, Lecture Notes in Mathematics 2237, Springer, 2019, pp. 181–229.
- C. Gaetan and X. Guyon, *Spatial Statistics and Modeling*, Springer, 2010.
- J. Møller and R. P. Waagepetersen, *Statistical Inference and Simulation for Spatial Point
  Processes*, Chapman and Hall/CRC, 2004 (cited by number only).
- J. Møller and R. P. Waagepetersen, Modern statistics for spatial point processes, *Scandinavian
  Journal of Statistics* 34 (2007), 643–684.
- B. D. Ripley, Modelling spatial patterns, *Journal of the Royal Statistical Society, Series B*
  39 (1977), 172–212.
- M. N. M. van Lieshout, *Markov Point Processes and Their Applications*, Imperial College Press,
  2000.
- M. N. M. van Lieshout, *Theory of Spatial Statistics: A Concise Introduction*, Chapman and
  Hall/CRC, 2019.
