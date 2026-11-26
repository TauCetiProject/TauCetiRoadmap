# Roadmap: almost periodicity, Bohr sets and the Bogolyubov–Ruzsa lemma

**Summary.** A function on a group is almost periodic when its translates form a precompact
family. This roadmap develops almost periodicity in two complementary forms: quantitatively, for
convolutions of sets of positive measure in a group with an invariant measure, and qualitatively,
for bounded functions on an arbitrary topological group. In both forms the outcome is the same:
sets built from a set `A` of positive density, such as `AA⁻¹AA⁻¹`, contain a *Bohr set*, the set
of `x` at which finitely many finite-dimensional unitary representations are close to the
identity.

The quantitative side works in a group carrying a measure that is invariant under left and right
translation and under inversion: the counting measure on a countable group, the Haar probability
measure on a second-countable compact group, or Haar measure on a second-countable locally compact
abelian group. Its first
headline is the Croot–Sisask lemma. If `A` and `S` have finite positive measure, `μ(SA) ≤ Kμ(A)`,
`f ∈ Lᵖ` and `0 < ε ≤ 1`, then a subset `T ⊆ S` of measure at least `μ(S)/(2K^{O(pε⁻²)})` consists
of `ε`-almost periods of the convolution `μ_A ⋆ f` in `Lᵖ`: translating by any element of `T⁻¹T`
moves it by at most `ε‖f‖ₚ`. The second is the Balog–Szemerédi–Gowers theorem: sets of large
multiplicative energy contain large subsets with small product set. On a compact group `G` with
Haar probability `μ`, Peter–Weyl Fourier analysis gives Bogolyubov's lemma without commutativity:
if `μ(A) = α > 0` then `AA⁻¹AA⁻¹` contains the Bohr set of radius `1/2` attached to the irreducible
representations at which the Fourier coefficient of `1_A` is large. These representations have
total dimension at most `4α⁻²`, and that Bohr set has measure at least `5^(−2Σ dim²)`. On a
compact abelian group, Rudin's inequality, Chang's lemma and the Croot–Sisask lemma give a form of
Sanders' quasi-polynomial Bogolyubov–Ruzsa lemma. Write `L = log(e/α)`. Then `2A − 2A` contains a Bohr set
of rank at most `C L⁴` and radius at least `e^{−CL}`, of measure at least `e^{−CL⁵}`, for an
absolute constant `C`. On a finite abelian group, Minkowski's second theorem turns Bohr sets into
proper coset progressions. Ruzsa modelling then transports the lemma to finite sets of small
doubling in torsion-free abelian groups and in vector spaces over a prime field `𝔽_p`, where a
large part of the set is Freiman isomorphic to a dense subset of a finite group. The endpoint is
the quasi-polynomial Freiman–Ruzsa theorem in those groups: if `|A + A| ≤ K|A|` then `A` is
covered by `e^{O(L⁵)}` translates of a coset progression of rank `O(L⁴)`, where `L = log 2K` for
torsion-free groups and `L = log 2pK` over `𝔽_p`.

The qualitative side works on an arbitrary topological group `G` and its bounded continuous
functions. Almost periodic functions are exactly the functions that factor through the Bohr
compactification `bG`. Weakly almost periodic functions are those whose translates are relatively
compact in the weak topology. Grothendieck's criterion identifies them as the functions for which
the iterated limits of `f(xₘyₙ)` agree. They form a C*-algebra that contains every coefficient of a
continuous unitary representation (Eberlein). They carry a unique invariant mean, and they split
as almost periodic plus a part of zero mean absolute value (de Leeuw–Glicksberg). The mean comes
from the Ryll-Nardzewski fixed-point theorem, and the decomposition from the compactification `wG`
and Ellis's theorem that compact semitopological groups are topological.
The resulting Bogolyubov phenomenon holds in every group. If `f ≥ 0` is weakly almost periodic
with positive mean, then `SS⁻¹` contains a Bohr neighbourhood of the identity, where
`S = {f > 0}`. In particular, in a discrete group, `AA⁻¹AA⁻¹` contains a Bohr neighbourhood
whenever some left-invariant mean gives `A` positive mass (Følner's theorem). On a compact
group the two sides meet: almost periodic, weakly almost periodic and continuous functions
coincide, and the invariant mean is the Haar integral.

The roadmap builds on several neighbours:

- **RepresentationTheory/CompactGroups** supplies the Haar probability measure, irreducible
  unitary models and the Peter–Weyl theorem. Every Fourier statement here, abelian or not, rests
  on them. Its continuation **CompactGroupsPartII** supplies the character theory of compact
  abelian groups: continuous characters as the unitary dual, Fourier coefficients against
  characters, and Parseval.
- **AmenableGroups** supplies means and amenability. The qualitative Følner–Bogolyubov theorem
  consumes them.
- **BanachSpaceTheory** supplies the Eberlein–Šmulian theorem, reflexivity and the duality between
  `C(K)` and measures. Grothendieck's criterion is built on them.
- **SuccessiveMinima** supplies Minkowski's second theorem, which places coset progressions inside
  Bohr sets.
- Mathlib supplies Haar measure, the additive-combinatorics toolkit (Plünnecke–Ruzsa, Ruzsa
  covering, dissociation, Freiman homomorphisms), Gelfand duality and Stone–Čech
  compactification.

**How to read the build.**

| Layer | Content |
|---|---|
| 0 | Convolution and energy in groups with a bi-invariant measure |
| 1 | Moment inequalities for sums of independent random variables |
| 2 | The Croot–Sisask lemma |
| 3 | Ruzsa's triangle inequality and the Balog–Szemerédi–Gowers theorem for measures |
| 4 | Peter–Weyl Fourier analysis, Bohr sets of unitary representations, their measure, and the non-abelian Bogolyubov lemma on compact groups |
| 5 | Compact abelian groups: characters, Rudin's inequality, Chang's lemma and the quasi-polynomial Bogolyubov–Ruzsa lemma |
| 6 | Regular Bohr sets, local Chang and Bohr-local almost periodicity |
| 7 | Coset progressions in Bohr sets of finite abelian groups; Ruzsa modelling, the Bogolyubov–Ruzsa lemma for small doubling and the Freiman–Ruzsa theorem in torsion-free groups and vector spaces over `𝔽_p` |
| 8 | Almost periodic functions and the Bohr compactification of a topological group |
| 9 | Weakly almost periodic functions and Grothendieck's double-limit criterion |
| 10 | Krein's and Ryll-Nardzewski's theorems, the invariant mean, the weakly almost periodic compactification, Ellis's theorem and the de Leeuw–Glicksberg decomposition |
| 11 | Bogolyubov phenomena in arbitrary groups |

Layers 0–7 are the quantitative side and Layers 8–11 the qualitative side. Layer 8 uses Layer 4's
Bohr sets, and Layer 11 uses Layer 0's convolution to compare with the compact case.

## Conventions

- **Notation for groups.** General groups are multiplicative and every statement that has an
  additive reading carries `@[to_additive]`. Layers 5–7 are about abelian groups and are written
  additively (`[AddCommGroup G]`), with sumsets `2 • A - 2 • A` under `open Pointwise`. Iterated
  product sets are `A ^ n` and `A * B`; `A⁻¹` is pointwise inversion.
- **Measured groups.** Layers 0–3 fix
  `[Group G] [MeasurableSpace G] [MeasurableMul₂ G] [MeasurableInv G]` and a measure `μ` with
  `[SigmaFinite μ] [μ.IsMulLeftInvariant] [μ.IsMulRightInvariant] [μ.IsInvInvariant]`. The
  examples to keep in mind are:
  - `Measure.count` on a countable group;
  - `TauCeti.haarProb G` on a second-countable compact group. It carries all three invariance
    instances (`TauCeti.isMulLeftInvariant_haarProb`, `TauCeti.isMulRightInvariant_haarProb`,
    `TauCeti.isInvInvariant_haarProb`), and `[MeasurableMul₂ G]` holds by Mathlib's
    `ContinuousMul.measurableMul₂`, which needs second countability;
  - an additive Haar measure on a second-countable locally compact abelian group.

  Statements about finite subsets of an *arbitrary* group are obtained by restricting to the
  countable subgroup they generate. Layer 0 provides that transfer once, and each headline of
  Layers 2–3 has a `Finset` corollary stated with `#`.
- **Measures of product sets.** For arbitrary sets `X, Y ⊆ G`, `μ (X * Y)` is Mathlib's outer
  measure of the product set; no measurability of `X * Y` is assumed. Proofs pass to measurable
  hulls (`toMeasurable`).
- **Convolution.** For `f g : G → ℂ`,
  `mconvolution f g μ x = ∫ y, f y * g (y⁻¹ * x) ∂μ`, written `f ⋆ₘ[μ] g`. This is the Bochner
  counterpart of Mathlib's `MeasureTheory.mlconvolution` and is the first target of Layer 0. On an
  additive commutative group the same object is Mathlib's
  `MeasureTheory.convolution f g (ContinuousLinearMap.mul ℂ ℂ) μ`. No second additive definition
  is introduced: Layer 0 proves the agreement on `Multiplicative G`.
- **Normalised indicators and translates.** The normalised indicator of `A` with `0 < μ A < ∞` is
  written `μ_A := (μ.real A)⁻¹ • A.indicator 1`. No new definition is introduced: statements spell
  out this expression. The left translate of `f` by `x` is `fun y ↦ f (x⁻¹ * y)`, matching
  AmenableGroups' `L_g`, and the right translate is `fun y ↦ f (y * x)`.
- **Norms.** `Lᵖ` norms are `MeasureTheory.eLpNorm f p μ`, with `MeasureTheory.lpNorm` for their
  real values. Exponents in the Croot–Sisask lemma are even, `p = 2m` with `1 ≤ m`, because the
  moment inequalities of Layer 1 are proved for even moments.
- **Energy.** `μ.mulEnergy A B := ∫ x, ‖(A.indicator 1 ⋆ₘ[μ] B.indicator 1) x‖ ^ 2 ∂μ`, with
  additive form `μ.addEnergy`. For the counting measure on a countable group it equals Mathlib's
  `Finset.mulEnergy`.
- **Unitary representations.** Finite-dimensional representations are Tau Ceti's irreducible
  models `TauCeti.IrrepModel ℂ G`: a dimension `m.dim`, a continuous unitary representation
  `m.rep : ContRepresentation ℂ G (EuclideanSpace ℂ (Fin m.dim))`, and irreducibility. Norms of
  operators are operator norms on `EuclideanSpace ℂ (Fin n) →L[ℂ] EuclideanSpace ℂ (Fin n)`.
  Restricting to irreducible models loses nothing: the Bohr set of a direct sum is the
  intersection of the Bohr sets of its summands (Layer 4). Infinite-dimensional unitary
  representations appear only in Layers 9–11. There they are
  `π : G →* (H →L[ℂ] H)` with `∀ g, π g ∈ unitary (H →L[ℂ] H)` and strong continuity
  `∀ ξ, Continuous fun g ↦ π g ξ`, on a complex Hilbert space `H`.
- **Bohr sets.** For a finite family of models `π : ι → TauCeti.IrrepModel ℂ G` and widths
  `ρ : ι → ℝ`,
  `unitaryBohrSet π ρ = {x | ∀ i, ‖(π i).rep x - 1‖ ≤ ρ i}`.
  This is the operator-norm (chord) convention: for a character it reads `|ψ x − 1| ≤ ρ`, not
  `‖arg ψ x‖ ≤ ρ`. On abelian groups (Layers 5–7) a Bohr set is the structure `BohrSet G` of
  Layer 5, whose frequencies are continuous additive characters `ψ : AddChar G Circle`, each with
  its own width. Its shape follows LeanAPAP's `BohrSet` (see References). The *rank* of an abelian
  Bohr set is the number of its frequencies, and the *dimension* of a family of models is
  `Σ i, (π i).dim`.
- **Fourier coefficients.**
  - On a compact group, the Fourier coefficient of `f ∈ L¹(G)` at a model `m` is the operator
    `m.fourierCoeff f = ∫ y, f y • m.rep y⁻¹ ∂ haarProb G`. Inversion reads
    `f = Σ_m m.dim • tr (m.fourierCoeff f ∘L m.rep ·)` over an irreducible skeleton.
  - On a compact abelian group, the Fourier coefficient of `f` at a continuous character `ψ` is
    `cft f ψ = ∫ x, f x * conj (ψ x) ∂μ` for the Haar probability measure `μ` of Layer 5
    ("compact Fourier transform", following LeanAPAP). It is CompactGroupsPartII §5.1's
    coefficient `f̂(χ)`, read on `Multiplicative G` through the additive form of the character.
  - The large spectrum is `largeSpec f η = {ψ | η * ‖f‖₁ ≤ ‖cft f ψ‖}`.
  - Dissociation is Mathlib's `MulDissociated` in the group `AddChar G Circle` under pointwise
    multiplication, and spans are `Finset.mulSpan`: products of the elements raised to exponents
    in `{-1, 0, 1}`.
- **Constants.** "An absolute constant `C`" means one real number, independent of the group, the
  sets and every other parameter. Theorems with absolute constants are stated as
  `∃ C > 0, ∀ G …`, quantifying over groups in a fixed universe. Logarithmic densities are written
  `L = log(e/α)` for a density `α ∈ (0, 1]`, so that `L ≥ 1`.
- **Bounded continuous functions.** On a topological group `G`, the functions of Layers 8–11 are
  elements of `G →ᵇ ℂ` (Mathlib's `BoundedContinuousFunction`), a commutative unital C*-algebra.
  "Arbitrary group" in the Summary means `G` with the discrete topology, where `G →ᵇ ℂ` is `ℓ^∞(G)`.
- **Namespaces.** New declarations use Mathlib-style names:
  - the measure theory of Layers 0–3 lives in `MeasureTheory`;
  - Bohr sets live in `BohrSet` and `unitaryBohrSet`;
  - almost periodicity lives in `BoundedContinuousFunction`, with the compactifications
    `BohrCompactification` and `WAPCompactification`.

  `TauCeti.*` names are existing Tau Ceti declarations, except dot-notation extensions of Tau Ceti
  structures such as `TauCeti.IrrepModel.fourierCoeff`, which are targets here. The prototype
  `Suggested.lean` declares everything in its own namespace.

## Layer 0: convolution and energy in groups with a bi-invariant measure

Fix a measured group `(G, μ)` as in Conventions.

### 0.1 Convolution

Define `MeasureTheory.mconvolution` and the notation `f ⋆ₘ[μ] g`. Prove:

- associativity `(f ⋆ₘ[μ] g) ⋆ₘ[μ] h = f ⋆ₘ[μ] (g ⋆ₘ[μ] h)` almost everywhere for integrable `f, g, h`,
  and at every point when `∫∫ |f y| |g z| |h (z⁻¹ y⁻¹ x)| < ∞` for all `x`;
- the identities `L_x (f ⋆ₘ[μ] g) = (L_x f) ⋆ₘ[μ] g` and `R_x (f ⋆ₘ[μ] g) = f ⋆ₘ[μ] (R_x g)`, for
  the left and right translates of Conventions;
- the transfer identity `∫ (f ⋆ₘ[μ] g) * h = ∫ f * (h ⋆ₘ[μ] ǧ)` with `ǧ y = g y⁻¹`;
- `∫ f ⋆ₘ[μ] g = (∫ f) * (∫ g)` for integrable `f, g`;
- Young's inequality in two forms:
  - `‖f ⋆ₘ[μ] g‖ₚ ≤ ‖f‖₁ ‖g‖ₚ` for `1 ≤ p ≤ ∞`;
  - the pointwise form `‖(f ⋆ₘ[μ] g) x‖ ≤ ‖f‖ₚ ‖g‖_q` for conjugate exponents and every `x`. This
    is Hölder after the substitution `y ↦ y⁻¹ x`, which preserves `μ` by inversion and right
    invariance.

Prove agreement with:

- Mathlib's `mlconvolution` on nonnegative real functions;
- `MeasureTheory.convolution f g (ContinuousLinearMap.mul ℂ ℂ) μ` on `Multiplicative G` of an
  additive commutative group. Mathlib integrates `f t * g (x - t)`; commutativity identifies
  `x - t` with `-t + x`, and without it the two orders of the factors are exchanged;
- on a compact second-countable group, Tau Ceti's `TauCeti.convolutionOperator` on continuous
  kernels.

*Needs:* Mathlib `MeasureTheory.integral_prod`, `MeasureTheory.mlconvolution`,
`MeasureTheory.convolution`, `MeasureTheory.eLpNorm`.

**Checks.**

- Counting measure on a countable group, finite `A, B`:
  `(A.indicator 1 ⋆ₘ[count] B.indicator 1) x = Finset.convolution A B x`.
- For a compact second-countable group and `f = g = 1`: `1 ⋆ₘ[haarProb G] 1 = 1`.

### 0.2 Convolutions of indicators

For measurable `A, B` of finite measure:
- `(A.indicator 1 ⋆ₘ[μ] B.indicator 1) x = μ.real (A ∩ x • B⁻¹)`;
- its support lies in `A * B`;
- `∫ (A.indicator 1 ⋆ₘ[μ] B.indicator 1) = μ.real A * μ.real B`.

Prove the Cauchy–Schwarz energy bound `μ.real A ^ 2 * μ.real B ^ 2 ≤ μ.mulEnergy A B * μ (A * B)`,
the identity `μ.mulEnergy A B = μ.mulEnergy B⁻¹ A⁻¹`, and the trivial bound
`μ.mulEnergy A B ≤ μ.real A ^ 2 * μ.real B`. For the counting measure on a countable group,
`μ.mulEnergy A B = Finset.mulEnergy A B`. *Needs:* 0.1.

**Checks.**

- `A = B = H` a subgroup of a finite group with the counting measure:
  `mulEnergy H H = #H ^ 3` and `H * H = H`.
- `G` compact, `A = G`: the convolution of indicators is the constant `μ.real B`.

### 0.3 Finite subsets of arbitrary groups

For an arbitrary group `G` and finitely many finite sets `Aᵢ ⊆ G`, the subgroup they generate is
countable. Prove that cardinalities of products and inversions of the `Aᵢ`, and their
convolutions and energies, are the same computed in that subgroup with `Measure.count` as in `G`
with `Finset` operations. Each `Finset` corollary of Layers 2–3 is obtained through this lemma.
*Needs:* Mathlib `Subgroup.closure`, `Measure.count`.

## Layer 1: moment inequalities for sums of independent random variables

### 1.1 Khintchine and Marcinkiewicz–Zygmund

On a probability space, prove the following.

- **Khintchine.** For independent Rademacher signs `εᵢ`, complex scalars `zᵢ` and `m ≥ 1`:
  `𝔼 |Σ εᵢ zᵢ|^{2m} ≤ m^m (Σ |zᵢ|²)^m`.
- **Marcinkiewicz–Zygmund.** For independent complex `X₁, …, Xₖ` with `𝔼 Xᵢ = 0` and
  `𝔼 |Xᵢ|^{2m} < ∞`: `𝔼 |Σ Xᵢ|^{2m} ≤ (4m)^m 𝔼 (Σ |Xᵢ|²)^m`.

State independence with Mathlib's `ProbabilityTheory.iIndepFun`. Derive Marcinkiewicz–Zygmund from
Khintchine by symmetrisation with an independent copy; the complex case of Khintchine follows from
the real one by Minkowski's inequality in `L^m` applied to the real and imaginary parts.
(Sanders 2013, Theorems 7.2 and 7.3, state both with constant `O(√p)` in `Lᵖ`; the constants here
are the even-moment forms.) *Needs:* Mathlib `ProbabilityTheory.iIndepFun`, `ProbabilityTheory.IndepFun.integral_mul_eq_mul_integral`.

**Checks.**

- At `m = 1`, Khintchine is an equality, since `𝔼|Σ εᵢ zᵢ|² = Σ |zᵢ|²`. Marcinkiewicz–Zygmund
  reads `Σ 𝔼|Xᵢ|² ≤ 4 Σ 𝔼|Xᵢ|²`, because independent mean-zero variables are orthogonal.
- With one summand (`k = 1`), Marcinkiewicz–Zygmund reads `𝔼|X|^{2m} ≤ (4m)^m 𝔼|X|^{2m}`.

### 1.2 Sampling from a set

For a measured group, a measurable `A` with `0 < μ A < ∞`, `f ∈ L^{2m}(μ)` and `k ≥ 1`, let
`a = (a₁, …, aₖ)` be drawn from the product of `k` copies of the normalised restriction of `μ` to
`A`. Prove
`𝔼_a ‖(1/k) Σᵢ L_{aᵢ} f − μ_A ⋆ₘ[μ] f‖_{2m}^{2m} ≤ (16m/k)^m ‖f‖_{2m}^{2m}`.

The proof applies 1.1 pointwise and integrates over `G` (Fubini, with `μ` σ-finite).
*Needs:* 1.1, Layer 0.

## Layer 2: the Croot–Sisask lemma

Fix a measured group `(G, μ)`.

### 2.1 Lᵖ almost periodicity

**Theorem (Croot–Sisask).** Let:

- `A, S` be measurable with finite positive measure, and `K ≥ 1` with `μ (S * A) ≤ K μ A`;
- `m ≥ 1`, `f ∈ L^{2m}(μ)` and `0 < ε ≤ 1`;
- `k = ⌈256 m / ε²⌉`.

Then there is a measurable `T ⊆ S` with `μ.real S / (2 K^k) ≤ μ.real T` such that, for every
`x ∈ T⁻¹ * T`,

`‖L_x (μ_A ⋆ₘ[μ] f) − μ_A ⋆ₘ[μ] f‖_{2m} ≤ ε ‖f‖_{2m}`.

**Right-handed variant.** Under `μ (A * S) ≤ K μ A`, with the same `m`, `f`, `ε` and `k`, there is a
measurable `T ⊆ S` with `μ.real S / (2 K^k) ≤ μ.real T` such that
`‖R_x (f ⋆ₘ[μ] μ_A) − f ⋆ₘ[μ] μ_A‖_{2m} ≤ ε ‖f‖_{2m}` for every `x ∈ T * T⁻¹`. It is the theorem for
`(Gᵐᵒᵖ, μ)` transported back to `G`.

Proof:

1. By 1.2 and Markov's inequality, for each `s ∈ S` at least half of the `k`-tuples `a ∈ A^k`
   approximate `L_s (μ_A ⋆ₘ[μ] f)` by `(1/k) Σ L_{s aᵢ} f` to within `ε/2`.
2. The map `(s, a) ↦ (s a₁, …, s aₖ)` lands in `(S A)^k`.
3. Pigeonholing in measure finds a fibre `T` of the required size.

This is Croot–Sisask (2010), Proposition 3.3, and Sanders (2012), Lemma 4.3, there for discrete
groups and with unspecified constants. *Needs:* 1.2, Layer 0.

**Checks.**

- If `f` is constant on a compact group, then `μ_A ⋆ₘ[μ] f` is constant and every `x` is an almost
  period.
- On a finite group with counting measure, take `A = S = H` a subgroup, `K = 1` and `f = 1_H`. Every
  almost period with `ε < 1` lies in `H`, which matches `T⁻¹ * T ⊆ H`.

### 2.2 L^∞ almost periodicity of triple convolutions

**Theorem.** Let `A, S, K` be as in 2.1, `B, W` measurable with `μ B < ∞` and `0 < μ W < ∞`, and
`0 < ε ≤ 1`. Put:

- `m = ⌈max 1 (log (μ.real B / μ.real W))⌉₊`;
- `k = ⌈256 e² m / ε²⌉`;
- `g = μ_A ⋆ₘ[μ] B.indicator 1 ⋆ₘ[μ] μ_W`.

Then there is a measurable `T ⊆ S` with `μ.real S / (2 K^k) ≤ μ.real T` such that
`|g (x⁻¹ * y) − g y| ≤ ε` for every `x ∈ T⁻¹ * T` and every `y ∈ G`.

Proof: apply 2.1 to `f = B.indicator 1` with `ε/e`, then the pointwise Young inequality of 0.1
against `μ_W`, using `‖μ_W‖_{(2m)'} = μ(W)^{-1/(2m)}`. *Needs:* 2.1, 0.1.

### 2.3 Iterated almost periods

If `‖L_x h − h‖ ≤ δ` for all `x ∈ T⁻¹ * T`, in any norm invariant under left translation, then
`‖L_x h − h‖ ≤ jδ` for all `x ∈ (T⁻¹ * T) ^ j`. Record this together with the convolution
identity `μ_X ⋆ₘ[μ] h − h = ∫ (L_x h − h) dμ_X(x)` used to average over almost periods.
*Needs:* Layer 0.

### 2.4 Finite sets

Give the `Finset` corollaries of 2.1 and 2.2 for finite subsets of an arbitrary group with
`#(S * A) ≤ K * #A`, through 0.3. In an abelian group they are the forms used in ℤ/N.

## Layer 3: Ruzsa's triangle inequality and Balog–Szemerédi–Gowers for measures

Fix a measured group `(G, μ)`.

### 3.1 Ruzsa calculus for measures

**Ruzsa triangle inequality.** For measurable `X, Y, Z`, in `ℝ≥0∞`:

`μ (X * Z⁻¹) * μ Y ≤ μ (X * Y⁻¹) * μ (Y * Z⁻¹)`.

Proof: integrate over `w` the pointwise bound `μ Y ≤ (1_{X Y⁻¹} ⋆ₘ[μ] 1_{Y Z⁻¹}) w` for
`w ∈ X * Z⁻¹`. No measurable selection is needed; replace the product sets by measurable hulls.

**Ruzsa covering lemma for measures.** If `B` is measurable with `0 < μ B < ∞` and
`μ (A * B) ≤ K μ B`, then `A ⊆ F * (B * B⁻¹)` for a finite `F ⊆ A` with `#F ≤ K`.

Both are Tao (2008), Lemmas 3.2 and 3.6, stated there for open precompact sets of a unimodular
locally compact group. *Needs:* Layer 0; Mathlib `Finset.ruzsa_covering_mul` for the shape of the
statement.

**Checks.**

- Counting measure on a finite group, finite sets. The covering lemma is
  `Finset.ruzsa_covering_mul`, with `B / B` for `B * B⁻¹`. The triangle inequality is
  `Finset.ruzsa_triangle_inequality_mulInv_mulInv_mulInv` after `#(Y * Z⁻¹) = #(Z * Y⁻¹)`, which
  holds because inversion is a bijection.

### 3.2 Paths of length three

**Lemma (Gowers).** Let `X, Y` be probability spaces and `E ⊆ X × Y` measurable with
`(μ_X ⊗ μ_Y)(E) ≥ δ`. Then there are measurable `X' ⊆ X`, `Y' ⊆ Y` with
`μ_X(X'), μ_Y(Y') ≥ c δ^C` such that every `(x, y) ∈ X' × Y'` is joined by at least `c δ^C`
mass of paths `x — y₁ — x₁ — y` in `E`.

Here `c, C > 0` are absolute constants, and the mass of paths is the
`μ_Y ⊗ μ_X`-measure of `(y₁, x₁)`. *Needs:* Mathlib product measures.

### 3.3 Balog–Szemerédi–Gowers

**Theorem.** There is an absolute constant `C` with the following property. Let `A, B` be measurable
with finite positive measure and `K ≥ 1`, and suppose
`μ.real A ^ (3/2) * μ.real B ^ (3/2) ≤ K * μ.mulEnergy A B`. Then there are measurable `A' ⊆ A` and
`B' ⊆ B` with

- `μ.real A ≤ C K^C μ.real A'`,
- `μ.real B ≤ C K^C μ.real B'`, and
- `μ (A' * B') ≤ C K^C μ.real A ^ (1/2) μ.real B ^ (1/2)`.

Proof:

1. Let `P = {x | (1_A ⋆ₘ[μ] 1_B) x ≥ (μ.real A μ.real B)^{1/2} / (2K)}` be the popular products. The
   non-popular products carry at most half of the energy.
2. Apply 3.2 to `{(a, b) ∈ A × B | a b ∈ P}`, with the measures normalised on `A` and `B`.
3. A path of length three represents `a b'` in many ways as `x y⁻¹ z` with `x, y, z ∈ P`.

This is Tao (2008), Theorem 5.2, there for open precompact sets of a unimodular group, with
`A'`, `B'` of measure `≳ μ(A)/K`, `μ(B)/K` and product set `≲ K⁸ μ(A)^{1/2} μ(B)^{1/2}`; the
measurable-set generality is this roadmap's.

Also state the symmetric corollary, obtained from 3.1. If `μ.real A ^ 3 ≤ K * μ.mulEnergy A A`, then
there is a measurable `A' ⊆ A` with `μ.real A ≤ C K^C μ.real A'` and
`μ (A' * A'⁻¹) ≤ C K^C μ.real A`.

*Needs:* 3.1, 3.2, 0.2.

**Checks.**

- If `A = B = H` is a finite subgroup with counting measure, then `K = 1` and `A' = B' = H` is
  admissible.
- Replacing `μ` by `t • μ` multiplies both sides of the hypothesis by `t³`, and both sides of the
  product-set bound by `t`.

### 3.4 Finite sets

`Finset` corollaries of 3.1 and 3.3 for finite subsets of an arbitrary group, through 0.3,
stated with `Finset.mulEnergy`.

## Layer 4: Peter–Weyl Fourier analysis and Bohr sets on compact groups

From here on in the quantitative layers, `G` is a compact Hausdorff topological group with its
Borel σ-algebra and `μ = TauCeti.haarProb G`. Write `𝓘` for `TauCeti.IrrepClass ℂ G`, and fix the
skeleton `TauCeti.IrrepClass.model` (an `IsIrrepSkeleton`, by `TauCeti.isIrrepSkeleton_model`).

### 4.1 Operator-valued Fourier coefficients

Define `TauCeti.IrrepModel.fourierCoeff m f := ∫ y, f y • m.rep y⁻¹ ∂μ` for `f ∈ L¹(G)`. It is an
operator on `EuclideanSpace ℂ (Fin m.dim)`; the prototype calls it `fourierCoeff`, in the roadmap
namespace. Prove:

- **Linearity and the bound** `‖m.fourierCoeff f‖ ≤ ‖f‖₁`.
- **Convolution:** `m.fourierCoeff (f ⋆ₘ[μ] g) = m.fourierCoeff g ∘L m.fourierCoeff f`. The order is
  forced by the convention `y⁻¹`.
- **Reflection:** for `f̃ y = conj (f y⁻¹)`, the coefficient is the adjoint of `m.fourierCoeff f`.
- **Parseval:** `‖f‖₂² = Σ_{i : 𝓘} (i.model.dim) ‖i.model.fourierCoeff f‖_HS²`. This reformulates Tau
  Ceti's `tsum_norm_sq_peterWeylCoeff`.
- **Inversion for coefficients of the regular representation:** for `u, v ∈ L²(G)`, the function
  `c x = ⟪u, L_x v⟫` is continuous. It is the absolutely and uniformly convergent sum of
  `i.model.dim * tr (…)` over `i : 𝓘`, with the operator in the trace being the product of the two
  coefficients and `i.model.rep x`, in the order fixed by the convolution identity.
- **Independence of the chosen model:** equivalent models give unitarily conjugate coefficients.

Every identity is first proved for continuous functions and then extended to `L²` by density, so
the layer needs no measurability of multiplication `G × G → G` and holds for every compact
Hausdorff group. Continuous functions on `G × G` are uniform limits of sums of products, and are
therefore measurable for the product σ-algebra.

*Needs:* Tau Ceti `TauCeti.IrrepModel`, `TauCeti.IrrepClass`, `TauCeti.stdPeterWeylBasis`,
`TauCeti.peterWeylCoeff_eq_inner`, `TauCeti.tsum_norm_sq_peterWeylCoeff`, Schur orthogonality
(CompactGroups Layer 4); Mathlib `ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints`,
the continuity of translation in `L²` (`Lp.instContinuousSMulDomMulAct`).

**Checks.**

- For `f = 1`, the coefficient is `1` at the trivial model and `0` at every other model, by Schur
  orthogonality.
- For `G = ℤ/2` and `f = 1_{0}`, the coefficients are `1/2` at both characters, and Parseval reads
  `1/2 = 1/4 + 1/4`.

### 4.2 Bohr sets of unitary representations

Define `unitaryBohrSet π ρ` (Conventions) for an arbitrary topological group, not only compact
ones, together with:
- monotonicity in `ρ`;
- `unitaryBohrSet π 0 = ⋂ i, ker (π i).rep`;
- symmetry `x ∈ B ↔ x⁻¹ ∈ B`;
- `1 ∈ B` for `ρ ≥ 0`;
- the sum rule `unitaryBohrSet π ρ * unitaryBohrSet π ρ' ⊆ unitaryBohrSet π (ρ + ρ')`, from
  `‖U V − 1‖ ≤ ‖U − 1‖ + ‖V − 1‖` for unitaries;
- invariance under conjugation (`‖π(gxg⁻¹) − 1‖ = ‖π x − 1‖`);
- closedness (each `(π i).rep` is continuous);
- the fact that for finite `ι` and `ρ i > 0` the set is a neighbourhood of `1`.

Prove that Bohr sets of arbitrary finite-dimensional continuous unitary representations reduce to
irreducible models. The Bohr set of a direct sum is the intersection of the Bohr sets of the
summands, and every finite-dimensional continuous unitary representation is a direct sum of
irreducible models up to unitary equivalence (Tau Ceti's complete reducibility). *Needs:*
Tau Ceti `TauCeti.IrrepModel`, CompactGroups' unitarizability and complete reducibility (only for
the reduction statement, which assumes `G` compact).

**Checks.**

- A one-dimensional model `m` with character `ψ = m.rep · 1`: `‖m.rep x − 1‖ = |ψ x − 1|`.
- `G = ℤ/2`, sign character, `ρ < 2`: the Bohr set is `{0}`; for `ρ ≥ 2` it is `G`.

### 4.3 Measure and covering of Bohr sets

Prove, for finite `ι` and `ρ i > 0`:

- **Lower bound:** `(∏ i, (1 + 2 / ρ i) ^ (2 * (π i).dim ^ 2))⁻¹ ≤ μ.real (unitaryBohrSet π ρ)`.
- **Doubling:**
  `μ.real (unitaryBohrSet π (2 • ρ)) ≤ 25 ^ (Σ i, (π i).dim ^ 2) * μ.real (unitaryBohrSet π ρ)`.
  More precisely, `unitaryBohrSet π (2 • ρ)` is covered by at most `25 ^ (Σ i, (π i).dim ^ 2)`
  left translates of `unitaryBohrSet π ρ`.

The proof:
1. `Φ = (π i).rep` jointly maps `G` onto the compact subgroup `Φ(G)` of a product of unitary
   groups.
2. A maximal subset of `Φ(G)` that is `1`-separated for the block norm `max_i ‖Xᵢ‖/ρᵢ` has at
   most `∏ (1 + 2/ρᵢ)^{2 dᵢ²}` points, by comparing Lebesgue volumes of balls in
   `∏ Matrix (Fin dᵢ) (Fin dᵢ) ℂ`.
3. Its preimages give a covering of `G` by left translates of the Bohr set, because
   `‖π(a⁻¹b) − 1‖ = ‖π b − π a‖`.

*Needs:* 4.2; Mathlib `MeasureTheory.Measure.addHaar_ball`, `Matrix.unitaryGroup`; Tau Ceti
`Topology/Algebra/UnitaryGroup.lean`.

**Checks.**

- `ι` empty: the Bohr set is `G` and the bound reads `1 ≤ 1`.
- `G = ℤ/N`, one character `x ↦ e(x/N)`, `ρ ≥ 2`: the Bohr set is `G`, and the lower bound
  `(1 + 2/ρ)^{-2} ≤ 1` is consistent.

### 4.4 Bogolyubov's lemma on compact groups

**Theorem.** Let `A ⊆ G` be measurable with `μ.real A = α > 0`. Let `Spec` be the set of `i : 𝓘`
with `α ^ (3/2) / 2 ≤ ‖i.model.fourierCoeff (A.indicator 1)‖`. Then:

- `Spec` is finite;
- `Σ_{i ∈ Spec} i.model.dim ≤ 4 / α²`;
- `unitaryBohrSet (fun i : Spec ↦ i.1.model) (fun _ ↦ 1/2) ⊆ A * A⁻¹ * A * A⁻¹`;
- this Bohr set has measure at least `5 ^ (-2 Σ_{i ∈ Spec} (i.model.dim)²)`.

Proof:

1. Let `g z = ⟪1_A, L_z 1_A⟫ = μ (A ∩ z A)`. It is continuous (4.1), and `g z > 0` forces
   `z ∈ A A⁻¹`.
2. Let `h x = ∫ g y * g (y⁻¹ x) dμ y`, which is a single integral of a continuous function. Then
   `h x > 0` forces `x ∈ A A⁻¹ A A⁻¹`, and `h 1 = ‖g‖₂² ≥ (∫ g)² = α⁴`.
3. By 4.1, the coefficients of `h` are `(M* M)²`, with `M` the coefficient of `1_A`. These are
   positive semidefinite.
4. The classes outside `Spec` contribute at most `α⁴/4` to `h 1`. This uses
   `tr ((M* M)²) ≤ ‖M‖² tr (M* M)` and Parseval.
5. On the Bohr set, `Re h x ≥ (1 − 1/2)(3α⁴/4) − α⁴/4 = α⁴/8 > 0`. This uses
   `|tr (P (1 − U))| ≤ ‖1 − U‖ tr P` for `P ≥ 0` and unitary `U`.
6. The measure bound is 4.3.

For finite abelian `G`, the classical form with the condition `Re ψ x ≥ 0` is
FourierAnalyticAdditiveCombinatorics' Layer 4 and is not restated here.

*Needs:* 4.1, 4.3.

**Checks.**

- For `A = G`, `Spec` is the trivial class alone, of dimension `1 ≤ 4`, and the Bohr set is `G`.
- For `G = S₃`, `A = A₃` and `α = 1/2`:
  - The trivial class has coefficient `1/2`, and so does the sign character. Both are at least
    `(1/2)^{3/2}/2`, so both lie in `Spec`.
  - The two-dimensional model has coefficient `(1/6)(1 + R + R²) = 0`, where `R` is the rotation of
    order 3, so it is not in `Spec`.
  - `Spec` has total dimension `2 ≤ 16`.
  - The Bohr set is `{x : |sign x − 1| ≤ 1/2} = A₃`, which equals `A₃A₃⁻¹A₃A₃⁻¹`.

## Layer 5: compact abelian groups, Chang's lemma and the quasi-polynomial Bogolyubov–Ruzsa lemma

`G` is a compact Hausdorff abelian group, written additively. `μ` is its Haar probability
measure: in Lean, any measure with `[μ.IsAddHaarMeasure] [IsProbabilityMeasure μ]`, unique by
the additive form of `MeasureTheory.Measure.isHaarMeasure_eq_of_isProbabilityMeasure`. Tau
Ceti's `haarProb` is multiplicative and is reached through `Multiplicative G`, where it is such a
measure; Layer 4 applies to `Multiplicative G`.

### 5.1 Characters and the compact Fourier transform

CompactGroupsPartII §5.1 supplies, for every compact Hausdorff abelian group, the bijection between
`TauCeti.IrrepClass ℂ` and `PontryaginDual` (irreducible continuous unitary representations are
one-dimensional), the Hilbert basis of characters of Haar `L²`, the coefficient
`f̂(χ) = ∫ conj (χ g) f g ∂(haarProb)` and Parseval. It is stated multiplicatively and is applied
here to `Multiplicative G`. This section adds the additive reading and the identities used below.

- The continuous additive characters `ψ : AddChar G Circle` form a subgroup of the group
  `AddChar G Circle`. Prove that it is identified with `PontryaginDual (Multiplicative G)`, and that
  under this identification `cft f ψ` is CompactGroupsPartII's `f̂` and Parseval reads
  `‖f‖₂² = Σ_ψ |cft f ψ|²`.
- Prove:
  - orthogonality `∫ ψ dμ = 0` for `ψ ≠ 1`;
  - the convolution identity `cft (f ⋆ g) = cft f * cft g`;
  - reflection `cft f̃ = conj (cft f)`, with `f̃ x = conj (f (-x))`;
  - pointwise absolutely convergent inversion for `u ⋆ v` with `u, v ∈ L²`.
- Define `largeSpec f η` and prove `#(largeSpec (A.indicator 1) η) ≤ 1/(η² α)` for
  `α = μ.real A > 0`.
- For finite `G` with the uniform measure, prove `cft f ψ = 𝔼 x, f x * conj (ψ x)`, which matches
  LeanAPAP's `cft` under `AddChar.circleEquivComplex`. On `ZMod N` this is `N⁻¹ • ZMod.dft f`,
  evaluated at the frequency corresponding to `ψ`.

*Needs:* CompactGroupsPartII §5.1 (`exists_irrepClass_characterEquiv`, `exists_characterBasis`);
Layer 4; Mathlib `AddChar`, `Circle`, `AddChar.circleEquivComplex`.

**Checks.**

- `G = ℤ/N`: `cft (1_{0}) ψ = 1/N` for every `ψ`.
- `G = AddCircle 1` with `μ = AddCircle.haarAddCircle`: `cft f ψₙ = fourierCoeff f n` for the
  character `ψₙ` with `(ψₙ x : ℂ) = fourier n x`.

### 5.2 Dissociated sets and Rudin's inequality

For a finite `MulDissociated` set `Δ` of continuous characters and complex coefficients `c`, let
`f = Σ_{ψ ∈ Δ} c ψ • ψ`. Prove:

- **Randomisation:** the compact-group form of Mathlib's `AddDissociated.randomisation`,
  `∫ Π_{ψ ∈ Δ} (1 + Re (d_ψ ψ)) dμ = 1` for `|d_ψ| ≤ 1`.
- **Subgaussian bound:** `∫ exp (Re (λ f)) dμ ≤ exp (|λ|² ‖f‖₂² / 2)` for every `λ : ℂ`. Bound
  `e^{a t} ≤ cosh a + t sinh a` for `t ∈ [−1, 1]`, apply it to each factor with `a = |λ c_ψ|`, and
  apply randomisation with the coefficients `(tanh a / a) · λ c_ψ`. This gives
  `Π cosh |λ c_ψ| ≤ exp (|λ|² Σ |c_ψ|² / 2)`.
- **Rudin's inequality:** there is an absolute constant `C` such that `‖f‖_{2m} ≤ C √m ‖f‖₂` for
  every `m ≥ 1`. Integrate the subgaussian bound against the moment generating function of the
  real and imaginary parts.

*Needs:* 5.1; Mathlib `MulDissociated`, and `AddDissociated.randomisation` as the pattern for the
finite case.

### 5.3 Chang's lemma

**Theorem.** There is an absolute constant `C` such that the following holds. For measurable `A`
with `μ.real A = α > 0` and `0 < η ≤ 1`, there is `Δ ⊆ largeSpec (A.indicator 1) η` with
`#Δ ≤ C η⁻² log (e/α)` and `largeSpec (A.indicator 1) η ⊆ Δ.mulSpan`. Prove the general
statement for `f ∈ L²` with `log (e ‖f‖₂²/‖f‖₁²)` in place of `log (e/α)`.

The proof:
1. Every dissociated subset of the large spectrum has the stated size, by Rudin's inequality (5.2)
   with `m ≈ log(e/α)` and Hölder.
2. A maximal dissociated subset spans the large spectrum (Mathlib's
   `exists_subset_mulSpan_card_le_of_forall_mulDissociated`).

*Needs:* 5.2; Mathlib `Finset.mulSpan`,
`Finset.exists_subset_mulSpan_card_le_of_forall_mulDissociated`.

### 5.4 Abelian Bohr sets

Define `structure BohrSet (G)`. It assigns a width `ewidth : AddChar G Circle → ℝ≥0∞` to each
character. The width is finite at only finitely many characters, the *frequencies*, and every
frequency is continuous. Define:

- `B.chordSet = {x | ∀ ψ, ‖(ψ x : ℂ) - 1‖₊ ≤ B.ewidth ψ}`;
- `B.rank = #frequencies`;
- the dilation `ρ • B`, which scales every width by `ρ`;
- the order `B ≤ B'`, meaning that every width of `B` is at most the corresponding width of `B'`;
- `BohrSet.ofFinset Γ ρ`, with frequencies `Γ` and uniform width `ρ`.

Prove `(ρ • B).chordSet + (ρ' • B).chordSet ⊆ ((ρ + ρ') • B).chordSet`. Prove the bridge
`B.chordSet = unitaryBohrSet (one-dimensional models of the frequencies) (widths)`. Then 4.3 gives,
when every frequency width `w_ψ` is positive:

- the lower bound `∏_ψ (1 + 2/w_ψ)⁻² ≤ μ.real B.chordSet`, with the product over the frequencies;
- the doubling bound `μ.real (2 • B).chordSet ≤ 25 ^ B.rank * μ.real B.chordSet`.

*Needs:* 5.1, 4.2, 4.3. The shape of the structure follows LeanAPAP's `BohrSet` (References).

**Checks.**

- For `G = ℤ/2`, with the sign character as frequency and width `w < 2`, the chord set is `{0}`.
- `rank (ofFinset ∅ ρ) = 0`, and its chord set is `G`.

### 5.5 The quasi-polynomial Bogolyubov–Ruzsa lemma

**Theorem (a weak form of Sanders' lemma).** There is an absolute constant `C ≥ 1` with the
following property. Let `G` be a second-countable compact abelian group and `A ⊆ G` measurable with
`μ.real A ≥ α > 0`, and put `L = log (e/α)`. Then there is a Bohr set `B` such that:

- `B.rank ≤ C L⁴`;
- every frequency width of `B` is at least `e^{−C L}`;
- `B.chordSet ⊆ 2 • A - 2 • A`;
- `e^{−C L⁵} ≤ μ.real B.chordSet`.

The measure bound follows from the rank and width bounds by 5.4. Sanders proves the corresponding
statements with coset progressions in place of Bohr sets (Sanders 2012, Theorems 10.1 and 11.3);
the Bohr-set form with these bounds is the one stated here.

The proof is the argument for densely modelled sets sketched in Sanders (2012), §3 ("the case of
good modelling"), with the Croot–Sisask lemma in the form of Sanders (2013), §§7–8:

1. Apply Croot–Sisask (2.2) with `S = A`, so that `K ≤ 1/α`, to a triple convolution of normalised
   indicators of `A` and `−A`. This gives a set `T` of measure `e^{−O(L⁴)}`. Its iterated differences
   (2.3, about `L` iterations) are `L^∞`-almost periods, with error a small multiple of `α²`.
2. Chang's lemma (5.3) with `η = 1/2`, applied to `T`, gives a spanning set `Δ` with `#Δ = O(L⁴)`.
3. Fourier inversion (5.1) shows that the averaged convolution is nearly invariant on the Bohr set
   of `Δ` with radius of order `α/#Δ`, so that Bohr set lies in `2A − 2A`.

Second countability is needed for Layer 2's product-measure arguments; see Scope.

*Needs:* 2.2, 2.3, 5.1, 5.3, 5.4.

**Checks.**

- For `A = G`, the Bohr set with no frequencies is admissible, since `2A − 2A = G`.
- Let `A` be an open subgroup with `G/A` cyclic of order `n`. Then `2A − 2A = A`. A character
  generating the annihilator of `A`, with any width `< |e(1/n) − 1|`, has chord set exactly `A`, so
  the conclusion can hold with equality.

## Layer 6: regular Bohr sets and local Fourier analysis

`G` and `μ` are as in Layer 5, with `G` second countable (Scope). Write `r(B) = max 1 B.rank`.

### 6.1 Regularity

Call `B` *regular* if, for all `0 ≤ κ ≤ 1/(200 r(B))`:
- `(1 − 200 r(B) κ) μ.real B.chordSet ≤ μ.real ((1 − κ) • B).chordSet`;
- `μ.real ((1 + κ) • B).chordSet ≤ (1 + 200 r(B) κ) μ.real B.chordSet`.

**Theorem (Bourgain).** For every `B` with positive widths there is `ρ ∈ [1/2, 1]` with `ρ • B`
regular. The proof is the Vitali-covering argument on `t ↦ log μ (t • B)`, using the doubling
bound of 5.4. (Bourgain 1999; Sanders 2012, Lemma 5.2, with dilates in `[1, 2]` and an
unspecified constant. The constant `200` is the one of the `ℤ/N` formalization under
Provenance.)

Prove the standard consequences:
- for `B` regular, `y ∈ (κ • B).chordSet` and `κ ≤ 1/(200 r(B))`,
  `μ (B.chordSet ∆ (y + B.chordSet)) ≤ 400 r(B) κ μ B.chordSet`;
- the same bound for every `y ∈ B'.chordSet`, for every Bohr set `B' ≤ κ • B`.

*Needs:* 5.4.

### 6.2 Local Chang

**Theorem.** There is an absolute constant `C ≥ 1` with the following property. Let:

- `B` be regular;
- `X ⊆ B.chordSet` be measurable with `μ X ≥ τ μ B.chordSet` for some `τ ∈ (0, 1]`;
- `0 < η ≤ 1`, and `D = C (1 + log (2/τ)) / η²`.

Then there are `Δ ⊆ largeSpec (X.indicator 1) η` and `ν ∈ [1/2, 1]` such that:

- `#Δ ≤ D`;
- `B' = (ν / (C r(B) D)) • B` is regular;
- every `ψ ∈ largeSpec (X.indicator 1) η` has the form `δ * φ` with `δ ∈ Δ.mulSpan` and
  `φ ∈ largeSpec (B'.chordSet.indicator 1) (1/2)`.

Proof:

1. Choose `ν` by 6.1 so that `B'` is regular. Put `S = largeSpec (B'.chordSet.indicator 1) (1/2)`,
   which contains `1` and is closed under inversion.
2. Call `Δ ⊆ largeSpec (X.indicator 1) η` *dissociated modulo `S`* if no nontrivial product
   `Π_{δ ∈ Δ} δ^{σ_δ}`, `σ ∈ {−1, 0, 1}^Δ`, lies in `S`. A maximal such `Δ` gives the
   decomposition `ψ = δ φ`, by maximality applied to `Δ ∪ {ψ}`.
3. Let `k = ⌈D⌉ + 1` and let `w` be the probability density
   `μ_{B⁺} ⋆ μ_{B'} ⋆ ⋯ ⋆ μ_{B'}`, with `2k` factors `μ_{B'}`, where `B⁺` is the dilate of `B`
   by `1 + 2k ν/(C r(B) D)`. By regularity (6.1), `w` is constant on `B.chordSet`, equal to
   `1/μ(B⁺) ≥ 1/(2 μ B.chordSet)`. Every character outside `S` has Fourier coefficient at most
   `1/2` against `μ_{B'}`, hence at most `4^{−k}` against `w`. So every `Δ` dissociated modulo
   `S` with `#Δ ≤ k` has Riesz products `Π (1 + Re (d_δ δ))`, `|d_δ| ≤ 1`, of `w`-mass at most
   `1 + 4^{−k} 2^k ≤ 2` (weighted randomisation, as in 5.2).
4. Chang's argument (5.3), with the moments taken against `w`, then bounds `#Δ` by `D`, because
   `X ⊆ B.chordSet` has `w`-mass at least `τ/2`.

This is a variant of Sanders' local Chang lemma (Sanders 2012, Lemmas 6.2 and 6.3, phrased there
with relative entropy and an annihilation bound); the form here, with its constants, is the one
formalized over `ℤ/N` under Provenance. *Needs:* 6.1, 5.2, 5.3.

### 6.3 Bohr-local almost periodicity

**Theorem.** Let `B` be regular, `B' ≤ κ • B` with `κ ≤ 1/(200 r(B))`, and `X ⊆ B.chordSet`
measurable with `μ X ≥ τ μ B.chordSet > 0`. Then `μ (X + B'.chordSet) ≤ (2/τ) μ X`. Consequently
2.1 and 2.2 apply with `A = X`, `S = B'.chordSet` and `K = 2/τ`, producing almost periods in
`B'.chordSet − B'.chordSet`. The doubling constant is the relative density of `X` in `B`, not its
density in `G`.

The proof: `X + B'.chordSet ⊆ ((1 + κ) • B).chordSet`, whose measure is at most `2 μ B.chordSet`
by regularity. This is the form in which Croot–Sisask is iterated inside Bohr sets. *Needs:* 2.1,
2.2, 6.1.

## Layer 7: coset progressions, Ruzsa modelling and the Freiman–Ruzsa theorem

`G` is an abelian group, written additively. It is arbitrary in 7.1. It is finite, with the
discrete topology, in 7.2 and in the dense theorem of 7.4. In 7.3, in the small-doubling theorem
of 7.4 and in 7.5 it is either torsion-free (`IsAddTorsionFree G`) or a vector space over `𝔽_p`
for a prime `p` (`Module (ZMod p) G`): the two classes in which a large part of a set of small
doubling has a dense Freiman model.

### 7.1 Coset progressions

Define `structure CosetProgression (G)`. Its fields are:

- a finite subgroup `H : AddSubgroup G`;
- a rank `rank : ℕ`;
- generators `gen : Fin rank → G`;
- lengths `len : Fin rank → ℕ`.

Its carrier is `H + {Σ i, n i • gen i | ∀ i, |n i| ≤ len i}`, with `n : Fin rank → ℤ`. It is
*proper* when the map `n ↦ (Σ i, n i • gen i : G ⧸ H)` is injective on the box
`∀ i, |n i| ≤ len i`. Prove:

- `#carrier = #H * ∏ i, (2 * len i + 1)` when the progression is proper;
- symmetry;
- `P.carrier + P.carrier ⊆ (2 • P).carrier`, where `2 • P` has the lengths doubled;
- the image under an injective additive map is a proper coset progression of the same rank;
- the image of a proper coset progression under a Freiman 2-isomorphism defined on its carrier is
  a translate of the carrier of a proper coset progression of the same rank, the subgroup going to
  a coset of a subgroup. A Freiman 2-isomorphism is affine on the carrier, so the image is the
  carrier itself when `0 ↦ 0`.

*Needs:* Mathlib `AddSubgroup`, `IsAddFreimanIso`.

### 7.2 Bohr sets contain coset progressions

**Theorem.** Let `G` be finite and `B` an abelian Bohr set of rank `d ≥ 1` with all widths
`w_ψ ∈ (0, 2]`. Then `B.chordSet` contains the carrier of a proper coset progression `P` with
`P.rank ≤ d` and `(∏_ψ w_ψ / (2π d)) * #G ≤ #P.carrier`.

The proof:
1. Let `Λ ⊆ ℝ^d` be the preimage of the image of `G` under the phases of the frequencies. It is a
   lattice of covolume `1/#(image)`.
2. The box `∏ [−w_ψ/(2π), w_ψ/(2π)]` lies in the chord set, since `|e(θ) − 1| ≤ 2π‖θ‖`.
3. Take successive minima `λᵢ` and independent lattice vectors `vᵢ ∈ λᵢ K`. The upper half of
   Minkowski's second theorem gives `∏ λᵢ · vol K ≤ 2^d covol Λ`.
4. The progression `{Σ nᵢ vᵢ : |nᵢ| ≤ ⌊1/(d λᵢ)⌋}` lies in the box. It injects into the torus
   because the box has side `< 1`. Lifting it to `G` with `H = ker` gives the coset progression.

*Needs:* 7.1, 5.4; Tau Ceti `ZLattice.successiveMin`,
`ZLattice.exists_linearIndependent_gauge_eq_successiveMin`,
`ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`.

**Checks.**

- `G = ℤ/N`, one frequency `x ↦ e(x/N)`, width `w ≤ 2`: the bound is `w N/(2π)`. It is attained
  up to a factor `2` by the progression `{n : |n| ≤ wN/(2π)}`, which lies in the chord set because
  `|e(n/N) − 1| ≤ 2π|n|/N`.
- `B` with all widths `2`: the chord set is `G`, and the bound `(1/(π d))^d #G` is consistent.

### 7.3 Ruzsa modelling

**Theorem (torsion-free groups; Ruzsa).** Let `G` be torsion-free, `A ⊆ G` finite and nonempty,
`k ≥ 2`, and `q ≥ #(k • A − k • A)`. Then there are `A' ⊆ A` with `#A ≤ k * #A'` and a map
`φ : G → ZMod q` that is a Freiman `k`-isomorphism from `A'` onto its image.

Proof:

1. Reduce to `G` finitely generated, hence `G ≅ ℤʳ`. A homomorphism `ℤʳ → ℤ` that is injective on
   the finite set `k • A − k • A` is a Freiman `k`-isomorphism on `A`; so reduce to `G = ℤ`.
2. For `A ⊆ ℤ`, take a prime `P > 2k max |a|`, so that reduction mod `P` is a Freiman
   `k`-isomorphism on `A`, and compose a dilation `a ↦ λa` of `ℤ/P` with a rescaling of `[0, P)`
   onto `ZMod q`. Split `[0, P)` into `k` arcs of equal length. On the part of `A` mapped into one
   arc, the composite is a Freiman `k`-homomorphism; pigeonholing gives an arc holding at least
   `#A/k` points, and averaging over `λ` gives one for which the composite is also injective on
   `k • A' − k • A'`.

This is Ruzsa (2009), Theorem 3.5, as quoted in Sanders (2012), Lemma 11.2.

**Theorem (vector spaces over `𝔽_p`).** Let `p` be prime, `G` a `ZMod p`-module, `A ⊆ G` finite
and nonempty, and `s ≥ 1`. Then there are a finite `ZMod p`-module `G'` with
`#G' ≤ p * #(s • A − s • A)` and a `ZMod p`-linear map `φ : G →ₗ[ZMod p] G'` that is a Freiman
`s`-isomorphism from `A` onto its image.

Proof: project onto the span of `A`, then quotient by lines. A line `ℓ` with
`ℓ ∩ (s • A − s • A) = {0}` exists while the number `(pᵐ − 1)/(p − 1)` of lines exceeds
`#(s • A − s • A) − 1`, and the quotient map by such a line is a Freiman `s`-isomorphism on `A`.
At the end `pᵐ ≤ (p − 1) #(s • A − s • A) + 1`. This is the argument of Green–Ruzsa (2007),
Proposition 6.1, there for `p = 2` and `s = 2`.

*Needs:* Mathlib `IsAddFreimanIso`, `IsAddFreimanHom`, `IsAddTorsionFree`.

**Checks.**

- `G = 𝔽_p^n` and `A` a subspace: `s • A − s • A = A`, and the projection onto `A` is admissible
  with `#G' = #A ≤ p #A`.
- `G = ℤ`, `A = {0, 1, …, n − 1}`, `k = 2`: `#(2 • A − 2 • A) = 4n − 3`, and reduction mod `q`
  is a Freiman 2-isomorphism on all of `A` for every `q ≥ 4n − 3`.

### 7.4 Bogolyubov–Ruzsa for dense sets and for sets of small doubling

**Theorem (dense).** There is an absolute constant `C` with the following property. Let `G` be
finite, with the discrete topology, and `A ⊆ G` with `#A = α #G > 0`, and put `L = log (e/α)`. Then
`2 • A − 2 • A` contains a proper coset progression of rank `≤ C L⁴` and size `≥ e^{−C L⁵} #G`.

This is 5.5 followed by 7.2, with the widths capped at `2`.

**Theorem (small doubling).** There is an absolute constant `C` with the following property. Let
`A ⊆ G` be finite and nonempty, and `K ≥ 1` with `#(A + A) ≤ K #A`. Put `L = log (2K)` if `G` is
torsion-free and `L = log (2pK)` if `G` is a vector space over `𝔽_p`. Then `2 • A − 2 • A`
contains a proper coset progression `P` of rank `≤ C L⁴` with `e^{−C L⁵} #A ≤ #P.carrier`.

Proof:

1. By Plünnecke–Ruzsa, `#(8 • A − 8 • A) ≤ K^{16} #A`. Apply 7.3 with `k = s = 8`: in the
   torsion-free case with `q = #(8 • A − 8 • A)`, to get `A' ⊆ A` with `8 #A' ≥ #A`; over `𝔽_p`
   with `A' = A`. The model `A'' = φ(A')` has density at least `1/(8 K^{16})`, respectively
   `1/(p K^{16})`, in its group `G'`, so `log (e/α) ≤ 16 L`.
2. Apply the dense theorem to `A''`.
3. `φ` is an 8-isomorphism on `A'`, so its inverse induces a Freiman 2-isomorphism from
   `2 • A'' − 2 • A''` to `2 • A' − 2 • A'`.
4. This 2-isomorphism sends `0 = a'' + a'' − a'' − a''` to `0`, so by 7.1 it maps the progression
   onto the carrier of a proper coset progression of the same rank inside `2 • A − 2 • A`.

Sanders (2012) proves the torsion-free case with the sharper size `e^{−O(L⁴ log L)}` (Theorem 11.3)
and the bounded-exponent case with a subgroup in place of `P` (Theorem 11.1).

*Needs:* 5.5, 7.1–7.3, and the additive form of Mathlib's
`Finset.pluennecke_ruzsa_inequality_pow_div_pow_mul`.

### 7.5 The Freiman–Ruzsa theorem

**Theorem.** There is an absolute constant `C` such that the following holds. Under the hypotheses
of 7.4 (small doubling), there are a coset progression `Q` and `X ⊆ A` with:
- `Q.rank ≤ C L⁴`;
- `#Q.carrier ≤ e^{C L⁵} #A`;
- `#X ≤ e^{C L⁵}`;
- `A ⊆ X + Q.carrier`.

Take `Q = P − P` for the `P` of 7.4. Mathlib's Ruzsa covering lemma applies since
`#(A + P.carrier) ≤ #(3 • A − 2 • A) ≤ K⁵ #A`. *Needs:* 7.4; Mathlib
`Finset.ruzsa_covering_add`.

**Checks.**

- `A` a finite subgroup of an `𝔽_p`-vector space: `K = 1`, and `Q` the progression of rank `0` on
  `H = A` with `X = {0}` is admissible.
- `A = {0, …, n − 1} ⊆ ℤ`: `K < 2`, and an arithmetic progression of rank 1 is admissible.

## Layer 8: almost periodic functions and the Bohr compactification

`G` is a topological group, `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]`, with no
separation or compactness hypothesis.

### 8.1 Almost periodic functions

For `f : G →ᵇ ℂ`, define its left and right translates as bounded continuous functions with
`BoundedContinuousFunction.compContinuous`. Define `BoundedContinuousFunction.IsAlmostPeriodic f`:
the left translates of `f` form a totally bounded set for the sup norm. Define
`almostPeriodicFunctions G : StarSubalgebra ℂ (G →ᵇ ℂ)`. Prove:

- it is a closed star subalgebra containing the constants;
- it is invariant under left and right translations;
- it is stable under composition with continuous homomorphisms `H →* G`.

Invariance under `f ↦ f ∘ (·)⁻¹` is the equivalence of left and right almost periodicity, proved
in 8.3.

*Needs:* Mathlib `BoundedContinuousFunction`, `TotallyBounded`.

**Checks.**

- On `G = ℤ` (discrete), let `f n = e(nθ)`. Every translate of `f` is `f` times a unimodular
  constant, so the orbit is totally bounded.
- On `G = ℤ`, let `f = 1_{0}`. The translates are the indicators `1_{n}`, at pairwise distance
  `1`, so `f` is not almost periodic.

### 8.2 The Bohr compactification

Define `BohrCompactification G := WeakDual.characterSpace ℂ (almostPeriodicFunctions G)`. Construct:

- the group structure, with `(χ ψ) f = χ (x ↦ ψ (y ↦ f (x * y)))`, that is
  `χ (x ↦ ψ (L_{x⁻¹} f))`. The inner function is almost periodic by 8.1, and
  `(ι g * ι h) f = f (g * h)`;
- a compact Hausdorff topological group structure;
- the continuous homomorphism `BohrCompactification.ι : G →* BohrCompactification G`, with dense
  range.

Joint continuity of multiplication and continuity of inversion come from the norm compactness of
the closure of each left orbit, which makes `{L_x f}` uniformly equicontinuous as functions of the
character. Prove the universal property: for every compact Hausdorff topological group `K` and
continuous homomorphism `φ : G →* K`, there is a unique continuous homomorphism `φ̄` with
`φ̄ ∘ ι = φ`. Prove `almostPeriodicFunctions G ≃⋆ₐ[ℂ] C(BohrCompactification G, ℂ)` by `F ↦ F ∘ ι`,
through Mathlib's `gelfandStarTransform`.

*Needs:*

- 8.1;
- Mathlib `WeakDual.characterSpace`, `gelfandStarTransform`, `ArzelaAscoli.isCompact_of_equicontinuous`;
- Tau Ceti CompactGroups: finite-dimensional unitary representations of a compact Hausdorff group
  separate points, by `TauCeti.representativeStarSubalgebra_dense`. This embeds `K` in a product of
  unitary groups.

**Checks.**

- On `G = ℤ`, written additively, with `f n = e(nθ)`: `(ι 1 · ι 1) f = f (1 + 1) = e(2θ) = (ι 2) f`.
  The variant `χ (x ↦ ψ (L_x f))` would give `f (−1 + 1) = 1` instead.
- If `G` is compact Hausdorff, `ι` is an isomorphism of topological groups and
  `almostPeriodicFunctions G` is all of `G →ᵇ ℂ`.
- For `G = ℤ`, `ι n = ι 0` only for `n = 0`, since characters separate points of `ℤ`.

### 8.3 Characterisation through representations

Prove:

- `f` is almost periodic iff it factors as `F ∘ ι` with `F` continuous on the Bohr
  compactification;
- `f` is almost periodic iff it is a uniform limit of finite linear combinations of matrix
  coefficients `ContRepresentation.matrixCoeff` of irreducible models `TauCeti.IrrepModel ℂ G`;
- left and right almost periodicity coincide, so `almostPeriodicFunctions G` is invariant under
  `f ↦ f ∘ (·)⁻¹`.

**Bohr sets are Bohr neighbourhoods.** The *Bohr topology* on `G` is the topology induced by `ι`.
Every Bohr-open neighbourhood of `1` contains `unitaryBohrSet π ρ` for some finite `ι` and some
`ρ > 0`. Conversely, every such Bohr set is a Bohr neighbourhood of `1`.

*Needs:* 8.2, 4.2; Tau Ceti `TauCeti.representativeStarSubalgebra_dense`, applied on the Bohr
compactification.

### 8.4 The mean on almost periodic functions

Define `m_ap f := ∫ F d(haarProb (BohrCompactification G))` for `f = F ∘ ι`. Prove:
- it is positive and unital;
- it is invariant under left and right translations and inversion;
- it is the unique left-invariant mean on `almostPeriodicFunctions G`: Riesz–Markov–Kakutani on
  the compact group, then uniqueness of Haar probability measure.

*Needs:* 8.2; Mathlib `RealRMK.rieszMeasure`,
`MeasureTheory.Measure.isHaarMeasure_eq_of_isProbabilityMeasure`.

## Layer 9: weakly almost periodic functions and Grothendieck's criterion

`G` is as in Layer 8.

### 9.1 Definition

Define `BoundedContinuousFunction.IsWeaklyAlmostPeriodic f` to mean that the set of left translates
of `f` has compact closure in `WeakSpace ℂ (G →ᵇ ℂ)`. That is,
`IsCompact (closure (toWeakSpace ℂ _ '' range (left translates of f)))`. Prove that almost
periodic implies weakly almost periodic. *Needs:* 8.1; Mathlib `toWeakSpace`.

### 9.2 Grothendieck's criterion in C(K)

**Theorem (Grothendieck).** Let `K` be compact Hausdorff, `D ⊆ K` dense, and `S ⊆ C(K, ℂ)` bounded.
Then `S` has compact closure in `WeakSpace ℂ C(K, ℂ)` if and only if the following double-limit
condition holds. For all sequences `fₙ ∈ S` and `xₘ ∈ D` such that the iterated limits
`limₙ limₘ fₙ(xₘ)` and `limₘ limₙ fₙ(xₘ)` both exist, they are equal. In Lean, the existence of each
iterated limit is spelled out with `Tendsto`: once for the inner limit at every index, and once for
the outer sequence of inner limits.

Proof (Grothendieck 1952, Théorème 6; Berglund–Junghenn–Milnes, Appendix A):

1. **Grothendieck's lemma.** The double-limit condition on `S × D` implies that every cluster point
   of `S` in `ℂ^K`, for the product topology, is continuous on `K`. The argument is a diagonal
   extraction along sequences in `D`, which is possible because `D` is dense.
2. So `S` is relatively compact in the topology of pointwise convergence on `K`, with its closure
   inside `C(K)`.
3. By Eberlein–Šmulian, relative weak compactness reduces to sequences.
4. A pointwise convergent bounded sequence in `C(K)` with continuous limit converges weakly. This
   uses the duality of `C(K)` with finite regular measures, and dominated convergence.

The converse direction is the evaluation of weak limits at points of `D`.

*Needs:* BanachSpaceTheory B2 (`TauCeti.isCompact_closure_toWeakSpace_iff`, the Eberlein–Šmulian
theorem) and B5 (the duality between `C(K, 𝕜)` and finite regular measures).

**Checks.**

- Let `K = {0} ∪ {1/n | n ≥ 1}` and `D = {1/n | n ≥ 1}`, which is dense in `K`. Let
  `S = {fₙ}` with `fₙ = 1_{[0, 1/n]}`, each continuous on `K`. Along `xₘ = 1/m`,
  `limₙ limₘ fₙ(xₘ) = 1` and `limₘ limₙ fₙ(xₘ) = 0`. So `S` is not weakly relatively compact,
  matching the discontinuity of its pointwise limit `1_{0}`.

### 9.3 The double-limit criterion for groups

Prove the isometric star-isomorphism `(X →ᵇ ℂ) ≃⋆ₐ[ℂ] C(StoneCech X, ℂ)` for an arbitrary
topological space `X`, through `stoneCechExtend`, with the image of `X` dense.

Then prove that `f : G →ᵇ ℂ` is weakly almost periodic iff, for all sequences `xₘ, yₙ` in `G` such
that both iterated limits of `f (xₘ * yₙ)` exist, they agree. Consequences:
- left and right weak almost periodicity coincide;
- `weaklyAlmostPeriodicFunctions G : StarSubalgebra ℂ (G →ᵇ ℂ)` is a closed star subalgebra
  containing `almostPeriodicFunctions G`;
- it is invariant under translations, inversion and composition with continuous homomorphisms.

*Needs:* 9.1, 9.2; Mathlib `StoneCech`, `stoneCechExtend`.

**Checks.**

- `G = ℤ`, `f = 1_{n ≥ 0}`, `xₘ = m`, `yₙ = −n`: `limₘ limₙ f(m − n) = 0` and
  `limₙ limₘ f(m − n) = 1`, so `f` is not weakly almost periodic. This is the group form of
  BanachAlgebras §4.4's `ℓ¹(ℤ)` Check.
- `G = ℤ`, `f = 1_{0}`: weakly almost periodic, and not almost periodic (8.1).

### 9.4 Eberlein's theorem and C₀

**Theorem (Eberlein).** Let `π` be a strongly continuous unitary representation of `G` on a complex
Hilbert space `H`, and let `ξ, η ∈ H`. Then the coefficient `F x = ⟪π x ξ, η⟫` is weakly almost
periodic.

Proof:

1. The map `T_ξ : η' ↦ (x ↦ ⟪π x ξ, η'⟫)` is bounded and `ℂ`-linear from `H` to `G →ᵇ ℂ`, since
   Mathlib's inner product is linear in its second argument.
2. The left translate `x ↦ F (a⁻¹ x)` equals `T_ξ (π a η)`, so the left orbit of `F` lies in
   `T_ξ (closedBall 0 ‖η‖)`.
3. That set is weakly compact, as the image of a weakly compact set under a bounded linear map.

Also prove `C₀(G) ⊆ weaklyAlmostPeriodicFunctions G` for locally compact Hausdorff `G`. Use 9.3,
passing to subsequences and distinguishing whether each sequence has a convergent subsequence or
leaves every compact set.

*Needs:* 9.3; BanachSpaceTheory B2 (reflexivity of Hilbert spaces, and the weak compactness of
their closed balls).

**Checks.**

- For the trivial representation, the coefficient is the constant `⟪ξ, η⟫`.
- For the left-regular representation of `ℤ` on `ℓ²(ℤ)` with `ξ = η = δ₀`, the coefficient is
  `1_{0}` (9.3, second Check).

## Layer 10: the invariant mean, the weakly almost periodic compactification and the decomposition

`G` is as in Layer 8. A *mean* on `weaklyAlmostPeriodicFunctions G` is a `ℂ`-linear functional
`m` with `m 1 = 1` that is positive for `ℂ`'s order: `0 ≤ m f` whenever `0 ≤ f x` for all `x`.
Positivity forces `m` to be real on real functions, and `|m f| ≤ ‖f‖`. This is the complex
counterpart, on weakly almost periodic functions, of AmenableGroups' `TauCeti.ComplexMean` on
`UCB`.

### 10.1 Krein's theorem and the Ryll-Nardzewski fixed-point theorem

**Theorem (Krein).** In a Banach space, the closed convex hull of a weakly compact set is weakly
compact. *Needs:* BanachSpaceTheory B2 (the Krein–Šmulian weak-star closedness criterion for
convex sets, `Convex.isClosed_iff_forall_isClosed_inter_closedBall`, applied in the bidual) and
Mathlib `NormedSpace.inclusionInDoubleDualWeak`.

**Theorem (Ryll-Nardzewski).** Let `Q` be a nonempty weakly compact convex subset of a Banach space,
and `𝒮` a semigroup of affine maps `Q → Q` that are weakly continuous. Suppose `𝒮` is
norm-distal: for `x ≠ y` in `Q`, `0` is not in the norm closure of `{s x − s y | s ∈ 𝒮}`. Then the
maps of `𝒮` have a common fixed point in `Q`. *Needs:* Mathlib Krein–Milman
(`IsCompact.extremePoints_nonempty`), the weak topology `WeakSpace`. The standard proof is
Namioka–Asplund's (Namioka–Asplund 1967).

**Check.** `𝒮` is the group generated by a single isometry of `ℂ²` swapping the coordinates,
acting on the segment from `(1, 0)` to `(0, 1)`. The fixed point is `(1/2, 1/2)`.

### 10.2 The invariant mean

For weakly almost periodic `f`, the weakly closed convex hull `Q_f` of its left translates is
weakly compact (10.1, Krein). Left translations act on `Q_f` by affine, weakly continuous
isometries, so they have a common fixed point (Ryll-Nardzewski). A left-invariant bounded
continuous function is constant. Prove:

- `Q_f` contains exactly one constant function. That constant is also the unique constant in the
  weakly closed convex hull of the right translates of `f`, by the double-limit criterion 9.3.
- `wapMean G f`, defined as this constant, is a mean;
- it is invariant under left and right translations and under `f ↦ f ∘ (·)⁻¹`;
- it is the unique left-invariant mean, and also the unique right-invariant one.
- For a strongly continuous unitary representation, `wapMean G (x ↦ ⟪π x ξ, η⟫) = ⟪P ξ, η⟫`, where
  `P` is the orthogonal projection onto the `π`-invariant vectors. `P ξ` is the element of least
  norm in the closed convex hull of the orbit of `ξ` (the mean ergodic theorem for groups).
- For compact Hausdorff `G`, `wapMean G f = ∫ f ∂ haarProb G`. On almost periodic functions,
  `wapMean` is `m_ap` (8.4).

*Needs:* 10.1, 9.3, 9.4, 8.4; Mathlib `exists_norm_eq_iInf_of_complete_convex`; Tau Ceti
`TauCeti.haarProb`.

**Checks.**

- On `G = ℤ`, `wapMean (1_{0}) = 0`: `0` is the limit of the averages `(1/n) Σ_{k<n} 1_{k}`.
- For the trivial representation, `P = id`, and the mean of the constant `⟪ξ, η⟫` is itself.

### 10.3 The compactification

Define `WAPCompactification G := WeakDual.characterSpace ℂ (weaklyAlmostPeriodicFunctions G)`,
with the continuous map `WAPCompactification.ι` of dense range. Construct a monoid structure on it
extending `G`, with `SeparatelyContinuousMul` (Mathlib), by the formula of 8.2:
`(χ ψ) f = χ (x ↦ ψ (y ↦ f (x * y)))`. The inner function is weakly almost periodic, and the
product is separately continuous, by 9.3; `(ι g * ι h) f = f (g * h)`. Prove:

- the universal property for continuous homomorphisms into compact Hausdorff monoids with
  separately continuous multiplication;
- `weaklyAlmostPeriodicFunctions G ≃⋆ₐ[ℂ] C(WAPCompactification G, ℂ)` (Gelfand).

Let `ν` be the Borel probability measure on `WAPCompactification G` representing `wapMean G`
(Riesz–Markov–Kakutani on the compact space).

*Needs:* 9.3, 10.2; Mathlib `SeparatelyContinuousMul`, `WeakDual.characterSpace`,
`gelfandStarTransform`, `RealRMK.rieszMeasure`.

### 10.4 Namioka's and Ellis's theorems

**Theorem (Namioka).** Let `X, Y` be compact Hausdorff spaces and `f : X × Y → ℝ` separately
continuous. Then there is a dense `Gδ` set `A ⊆ X` such that `f` is continuous at every point of
`A × Y`.

**Theorem (Ellis).** A group with a compact Hausdorff topology in which multiplication is
separately continuous is a topological group: `ContinuousMul` and `ContinuousInv` hold. Deduce it
from Namioka's theorem applied to `(x, y) ↦ φ (x y)` for `φ ∈ C(G, ℝ)`, together with translation.

*Needs:* Mathlib `BaireSpace`, `IsGδ`, `SeparatelyContinuousMul`.

**Checks.**

- `(x, y) ↦ 2xy/(x² + y²)` on `[−1, 1]²`, set to `0` at the origin, is separately continuous and
  not jointly continuous at `(0, 0)`. Namioka's set may be taken to be `[−1, 1] \ {0}`.

### 10.5 The kernel and the de Leeuw–Glicksberg decomposition

Prove that:

- the support of `ν` is the smallest two-sided ideal `𝒦` of `WAPCompactification G`, which is the
  intersection of all two-sided ideals and is nonempty;
- `𝒦` is a group, with an idempotent `e` as identity, and is closed;
- with the subspace topology, `𝒦` is a compact Hausdorff topological group (Ellis, 10.4);
- `x ↦ ι x * e` is a continuous homomorphism `G →* 𝒦` with dense range, and `𝒦` is isomorphic as
  a topological group to `BohrCompactification G`;
- `ν` restricted to `𝒦` is its Haar probability measure.

References: Berglund–Junghenn–Milnes, Ch. 4; Ruppert, Ch. III; both use the invariant mean as
above.

Define `wap₀ G := {f ∈ weaklyAlmostPeriodicFunctions G | wapMean G (fun x ↦ ‖f x‖) = 0}`. Prove:

- `wap₀ G` is a closed, translation-invariant star ideal of `weaklyAlmostPeriodicFunctions G`;
- `weaklyAlmostPeriodicFunctions G` is the direct sum of `almostPeriodicFunctions G` and `wap₀ G`;
- the projection `f ↦ f_ap`, `f_ap x = F (ι x * e)`, is a translation-equivariant star
  homomorphism of norm 1;
- for weakly almost periodic `f`, the following are equivalent:
  - `f ∈ wap₀ G`;
  - `wapMean G (‖f‖²) = 0`;
  - `0` lies in the weak closure of the left translates of `f`.

*Needs:* 10.2–10.4, 8.2; Mathlib `exists_idempotent_in_compact_subsemigroup`.

**Checks.**

- If `G` is compact, then `wap₀ G = 0` and `f_ap = f`.
- On `G = ℤ`, take `f = c + 1_{0}`. Then `f_ap = c` and `f − f_ap = 1_{0} ∈ wap₀`.

## Layer 11: Bogolyubov phenomena in arbitrary groups

`G` is as in Layer 8.

### 11.1 Convolution through the mean

For weakly almost periodic `f, g`, define `(f ⋆ g) x := wapMean G (y ↦ f y * g (y⁻¹ * x))`. The
integrand is weakly almost periodic by 9.3. Prove:
- `f ⋆ g ∈ almostPeriodicFunctions G`;
- `f ⋆ g = f_ap ⋆ g_ap`, because the flight parts contribute zero: `|wapMean (u v)| ≤ ‖v‖ wapMean |u|`;
- on the Bohr compactification, `f ⋆ g` is the Haar convolution of the extensions;
- for compact `G`, `f ⋆ g = f ⋆ₘ[haarProb G] g` (Layer 0).

*Needs:* 10.2, 10.5, Layer 0.

### 11.2 The qualitative Bogolyubov theorem

**Theorem.** Let `f ∈ weaklyAlmostPeriodicFunctions G` be real-valued and nonnegative with
`wapMean G f > 0`, and put `S = {x | 0 < f x}`. Then there are a finite family of irreducible
models `π` and widths `ρ > 0` with `unitaryBohrSet π ρ ⊆ S * S⁻¹`.

The proof:
1. `h = f ⋆ f̌` with `f̌ y = f y⁻¹` is almost periodic (11.1).
2. `h 1 = wapMean (f²) ≥ (wapMean f)² > 0`.
3. `{h > h 1 / 2}` is a Bohr neighbourhood of `1` (8.3), on which `h > 0` forces `x ∈ S S⁻¹`.

*Needs:* 11.1, 8.3.

### 11.3 Følner's theorem in discrete amenable groups

Let `G` carry the discrete topology and let `M` be a left-invariant mean
(`TauCeti.Mean.IsLeftInvariant`), with its complex extension `TauCeti.ComplexMean`.

- **The GNS space of a mean.** Construct the Hilbert space completion of `G →ᵇ ℂ` modulo the null
  space of `(u, v) ↦ M(conj u * v)`, with the unitary left-regular representation, unitary by the
  left invariance of `M`.
- **Positive-definite density.** For `A ⊆ G`, `φ_A x := M (1_A · 1_{x A})` is the coefficient
  `⟪π x [1_A], [1_A]⟫`. So it is positive definite and weakly almost periodic (9.4), and
  `wapMean G φ_A ≥ M(1_A)²` (10.2, projecting onto the constants).

**Theorem (Følner–Bogolyubov).** If `M (1_A) > 0` for some left-invariant mean `M`, then
`A * A⁻¹ * A * A⁻¹` contains `unitaryBohrSet π ρ` for some finite family `π` and `ρ > 0`. Apply
11.2 to `φ_A`, whose positivity set lies in `A * A⁻¹`. For abelian groups, written additively:
`A − A + A − A` contains a Bohr neighbourhood of `0`.

*Needs:* 11.2, 9.4, 10.2; AmenableGroups (`TauCeti.Mean`, `TauCeti.Mean.IsLeftInvariant`,
`TauCeti.ComplexMean`, and the discrete identification of `UCB` with all bounded functions).

**Checks.**

- `G = ℤ`, `A = 2ℤ`, and `M` any invariant mean (so `M(1_A) = 1/2`):
  `A − A + A − A = 2ℤ`, which is exactly the Bohr set of the character `n ↦ (−1)ⁿ` with any width
  `< 2`.
- `G` finite, `M` the uniform average: the theorem is implied by Layer 4.4, with an explicit Bohr
  set.

## Worked examples

- On `ℤ/N`, Layers 2, 5 and 7 give the dense Bogolyubov–Ruzsa lemma with a generalised arithmetic
  progression. That is the form consumed by Fourier-analytic proofs of inverse theorems for the
  Gowers `U³` norm.
- On `ℤ`, Layer 11 gives Følner's 1954 theorem, and Layer 9 gives the classical examples
  separating `AP ⊊ WAP ⊊ C_b`.

## Downstream consumers

The inverse theorem for the Gowers norms on `ℤ/N` consumes the dense Bogolyubov–Ruzsa lemma with
progressions (7.4), Bohr-set doubling (5.4), and the Croot–Sisask lemma (2.2). Ergodic Ramsey
theory on arbitrary groups consumes Layers 9–11: weakly almost periodic functions, the
de Leeuw–Glicksberg decomposition, and Bohr neighbourhoods in difference sets.

## Scope and ownership

This roadmap owns the following:
- convolution of complex functions on groups with a bi-invariant measure, and its Young
  inequalities;
- multiplicative energy for measures;
- the scalar Khintchine and Marcinkiewicz–Zygmund inequalities for even moments, with the explicit
  constants `m^m` and `(4m)^m`;
- the Croot–Sisask lemma in all its forms;
- Ruzsa's triangle and covering lemmas for measures;
- Gowers' path lemma and the Balog–Szemerédi–Gowers theorem for measures and for finite sets in
  arbitrary groups;
- operator-valued Fourier coefficients on compact groups, with the convolution, Parseval and
  inversion identities in that language;
- Bohr sets of finite-dimensional unitary representations of topological groups, their measure
  and doubling on compact groups;
- Bogolyubov's lemma on compact groups;
- on compact abelian groups:
  - the additive reading of characters and Fourier coefficients, the convolution, reflection and
    inversion identities, and large spectra;
  - dissociated characters and Rudin's inequality;
  - Chang's lemma;
  - abelian Bohr sets and regular Bohr sets;
  - local Chang and Bohr-local almost periodicity;
  - the quasi-polynomial Bogolyubov–Ruzsa lemma;
- coset progressions in abelian groups and Bohr sets containing them;
- Ruzsa modelling in torsion-free abelian groups and in vector spaces over `𝔽_p`;
- the Bogolyubov–Ruzsa lemma for small doubling and the quasi-polynomial Freiman–Ruzsa theorem in
  those two classes of groups;
- almost periodic and weakly almost periodic functions on topological groups;
- the Bohr and weakly almost periodic compactifications;
- Grothendieck's weak compactness criterion in `C(K)` and its group form;
- Eberlein's theorem on coefficients of unitary representations;
- Krein's theorem on closed convex hulls of weakly compact sets;
- the Ryll-Nardzewski fixed-point theorem;
- Namioka's joint continuity theorem and Ellis's theorem;
- the kernel of the weakly almost periodic compactification;
- the invariant mean on weakly almost periodic functions;
- the de Leeuw–Glicksberg decomposition;
- convolution through the mean;
- the qualitative Bogolyubov and Følner–Bogolyubov theorems.

It does not own the following.
- **RepresentationTheory/CompactGroups:** Haar probability measures on compact groups,
  unitarizability, complete reducibility, Schur orthogonality, matrix coefficients and the
  Peter–Weyl theorem.
- **RepresentationTheory/CompactGroupsPartII §5.1:** for compact Hausdorff abelian groups, the
  bijection between irreducible classes and continuous characters, the Hilbert basis of
  characters, the Fourier coefficient against a character, Parseval and the `L²` expansion.
  Layer 5.1 consumes these and adds only the additive reading and the identities listed there.
- **AmenableGroups:** means, amenability, Følner sets and Reiter's condition.
- **BanachSpaceTheory:**
  - Eberlein–Šmulian, Krein–Šmulian and reflexivity (B2);
  - the duality between `C(K)` and measures (B5).
- **BanachAlgebras §4.4:** weakly almost periodic *functionals* on Banach algebras, Arens
  regularity and the bilinear double-limit criterion. The group-level Grothendieck criterion here
  is stated for `C(K)` with point evaluations on a dense set and does not restate theirs.
- **ArithmeticDynamics §2.9:** the Jacobs–de Leeuw–Glicksberg splitting for a single contraction
  of a Banach space. Layer 10 treats translation on weakly almost periodic functions of a group and
  does not restate theirs.
- **SieveMethodsAndPrimePatterns §5.4:** the finite-group flattening form of
  Balog–Szemerédi–Gowers for probability masses with an approximate-subgroup conclusion. Layer 3
  owns the energy form for sets; §5.4 may consume Gowers' path lemma 3.2.
- **VonNeumannAlgebras V11:** Pontryagin duality for locally compact abelian groups. Layer 5 uses
  continuous characters of compact abelian groups only through Peter–Weyl and CompactGroupsPartII
  §5.1, and needs no duality theorem.
- **FourierAnalyticAdditiveCombinatorics:** character sums of sets in finite abelian groups with
  their Parseval identity (its 1.1), and Bogolyubov's lemma in finite abelian groups and in
  `𝔽_pⁿ` (its Layer 4): `A + A − A − A` contains the set where fewer than `|G|²/|A|²` characters
  have nonnegative real part. That roadmap leaves Bohr sets as objects, their size, the
  progressions they contain and Chang's lemma to others; this roadmap owns them. Layer 4.4 here is
  a different statement: operator-norm Bohr sets of irreducible representations on an arbitrary
  compact group, with radius `1/2` and a dimension bound. Layer 5.1's Parseval identity is for
  functions on compact abelian groups. Neither restates that roadmap, and neither depends on it.
- **SuccessiveMinima and Tau Ceti:** Minkowski's second theorem.
- **NoncommutativeIntegration:** the noncommutative Khintchine inequalities and their `Lᵖ`
  constants. Layer 1 owns only the scalar inequalities for even moments with the constants above.
- **Mathlib:**
  - Haar measure;
  - Plünnecke–Ruzsa, Ruzsa covering for finite sets, dissociation, Freiman homomorphisms and
    approximate subgroups;
  - Gelfand duality, Stone–Čech compactification and the Ellis–Numakura lemma.

The following are outside this roadmap:
- quasi-polynomial Bogolyubov–Ruzsa for non-abelian groups;
- the Bogolyubov–Ruzsa lemma for small doubling and the Freiman–Ruzsa theorem in abelian groups
  that are neither torsion-free nor vector spaces over a prime field. There a set of small
  doubling need not have a Freiman model of density `K^{−O(1)}` (Green–Ruzsa 2007,
  Proposition 6.4), and the proof (Sanders 2012, Theorem 1.1; Sanders 2013, Theorem 1.4) passes
  through relative polynomial growth and convex coset progressions instead;
- polynomial Freiman–Ruzsa;
- arithmetic regularity lemmas;
- Markov–Kakutani;
- non-metrizable compact groups in 5.5 and Layer 6. Croot–Sisask needs the measurability of
  multiplication `G × G → G` for the product σ-algebra, which Mathlib provides under second
  countability. Layers 4, 5.1–5.4 and 8–11 hold for all compact Hausdorff groups.

## Exact supplier contracts

### From Mathlib

At Mathlib `1b1ccf4b`:

- **Haar measure.**
  - `MeasureTheory.Measure.haar`, `IsHaarMeasure`, `IsMulLeftInvariant`, `IsMulRightInvariant`,
    `IsInvInvariant` (MeasureTheory/Group/Defs.lean, MeasureTheory/Group/Measure.lean,
    MeasureTheory/Measure/Haar/Basic.lean); `ContinuousMul.measurableMul₂`;
  - `MeasureTheory.Measure.isHaarMeasure_eq_of_isProbabilityMeasure`
    (MeasureTheory/Measure/Haar/Unique.lean);
  - `MeasureTheory.Measure.count` and its invariance instances (MeasureTheory/Group/Measure.lean).
- **Convolution and norms.**
  - `MeasureTheory.mlconvolution` (Analysis/LConvolution.lean);
  - `MeasureTheory.convolution` (Analysis/Convolution.lean);
  - `Finset.convolution` (Combinatorics/Additive/Convolution.lean);
  - `MeasureTheory.eLpNorm`, `MeasureTheory.lpNorm` (MeasureTheory/Function/LpSeminorm/Defs.lean);
  - `MeasureTheory.integral_prod`.
- **Probability.** `ProbabilityTheory.iIndepFun` and the integral of a product of independent
  functions.
- **Additive combinatorics.**
  - `Finset.mulEnergy` (Combinatorics/Additive/Energy.lean);
  - `MulDissociated`, `Finset.mulSpan`,
    `Finset.exists_subset_mulSpan_card_le_of_forall_mulDissociated`
    (Combinatorics/Additive/Dissociation.lean);
  - `AddDissociated.randomisation` (Combinatorics/Additive/Randomisation.lean);
  - `Finset.ruzsa_covering_mul` (Combinatorics/Additive/RuzsaCovering.lean);
  - `Finset.ruzsa_triangle_inequality_div_div_div`,
    `Finset.pluennecke_ruzsa_inequality_pow_div_pow_mul` and their additive forms
    (Combinatorics/Additive/PluenneckeRuzsa.lean);
  - `IsAddFreimanHom`, `IsAddFreimanIso` (Combinatorics/Additive/FreimanHom.lean);
  - `IsAddTorsionFree` (Algebra/Group/Monoid.lean).
- **Characters.** `AddChar`, `AddChar.instCommGroup` (Algebra/Group/AddChar.lean); `Circle`;
  `AddChar.circleEquivComplex` (Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean);
  `AddCircle.haarAddCircle`, `fourierCoeff` (Analysis/Fourier/AddCircle.lean).
- **Functional analysis and topology.**
  - `BoundedContinuousFunction` and its C*-algebra instance;
  - `WeakSpace`, `toWeakSpace` (Topology/Algebra/Module/Spaces/WeakDual.lean);
  - `WeakDual.characterSpace` (Topology/Algebra/Module/Spaces/CharacterSpace.lean) and
    `gelfandStarTransform` (Analysis/CStarAlgebra/GelfandDuality.lean);
  - `IsCompact.extremePoints_nonempty` (Analysis/Convex/KreinMilman.lean),
    `NormedSpace.inclusionInDoubleDualWeak` (Analysis/Normed/Module/DoubleDual.lean);
  - `Lp.instContinuousSMulDomMulAct` (MeasureTheory/Function/LpSpace/DomAct/Continuous.lean),
    `ArzelaAscoli.isCompact_of_equicontinuous`;
  - `StoneCech`, `stoneCechExtend` (Topology/Compactification/StoneCech.lean);
  - `RealRMK.rieszMeasure`;
  - `exists_norm_eq_iInf_of_complete_convex`;
  - `SeparatelyContinuousMul` (Topology/Algebra/Monoid/Defs.lean);
  - `exists_idempotent_in_compact_subsemigroup` (Topology/Algebra/Semigroup.lean);
  - `BaireSpace`;
  - `Matrix.unitaryGroup`.

### From Tau Ceti

At Tau Ceti `2fd255d`:

- `TauCeti.haarProb`, with the instances `isProbabilityMeasure_haarProb`,
  `isMulRightInvariant_haarProb`, `isInvInvariant_haarProb` and
  `TauCeti.eq_haarProb_of_isHaarMeasure_of_isProbabilityMeasure`
  (RepresentationTheory/Compact/Haar.lean).
- `ContRepresentation.IsUnitary` (RepresentationTheory/Continuous/Unitary/Basic.lean) and
  `ContRepresentation.matrixCoeff` (RepresentationTheory/Continuous/MatrixCoefficient.lean).
- `TauCeti.IrrepModel`, `TauCeti.IsIrrepSkeleton`, `TauCeti.IrrepClass`,
  `TauCeti.IrrepClass.model`, `TauCeti.isIrrepSkeleton_model`, `TauCeti.stdPeterWeylBasis`,
  `TauCeti.peterWeylCoeff_eq_inner`, `TauCeti.tsum_norm_sq_peterWeylCoeff`
  (RepresentationTheory/Compact/PeterWeyl.lean).
- `TauCeti.representativeStarSubalgebra`, `TauCeti.representativeStarSubalgebra_dense`
  (RepresentationTheory/Continuous/Representative.lean,
  RepresentationTheory/Compact/RepresentativeDensity.lean).
- `TauCeti.convolutionOperator` (RepresentationTheory/Compact/Convolution.lean), compared with
  `mconvolution` in 0.1.
- `TauCeti.Mean`, `TauCeti.Mean.IsLeftInvariant`, `TauCeti.ComplexMean`, `TauCeti.UCB`
  (GroupTheory/Amenable/{Mean,Basic,Complex}.lean, Topology/Algebra/Group/UCB/Basic.lean).
- `TauCeti.isCompact_closure_toWeakSpace_iff`, `TauCeti.isCompact_toWeakSpace_iff_isSeqCompact`
  (Analysis/Normed/Module/WeakSpace/EberleinSmulian.lean).
- `ZLattice.successiveMin`, `ZLattice.exists_linearIndependent_gauge_eq_successiveMin`
  (Algebra/Module/ZLattice/SuccessiveMinima.lean) and
  `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`
  (NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean).

### From TauCetiRoadmap.RepresentationTheory/CompactGroups

- Layer 0: the Haar probability measure.
- Layers 3, 4 and 5: matrix coefficients, Schur orthogonality, the representative algebra and its
  density, and the Peter–Weyl Hilbert basis with its coefficient formula and Parseval identity.
- Complete reducibility and unitarizability of finite-dimensional continuous representations.

All of these are implemented at the pin, under the names above.

### From TauCetiRoadmap.RepresentationTheory/CompactGroupsPartII

- §5.1: for a compact Hausdorff abelian group, the identification of `TauCeti.IrrepClass ℂ G` with
  `PontryaginDual G` (`exists_irrepClass_characterEquiv`), the Hilbert basis of characters of Haar
  `L²` (`exists_characterBasis`), the coefficient `f̂(χ) = ∫ conj (χ g) f g ∂(haarProb G)` and
  Parseval.

### From TauCetiRoadmap.AmenableGroups

- Layer 1: means on `UCB G` and left invariance.
- Layer 2: for discrete `G`, `UCB G` is all bounded functions.
- The complex extension `TauCeti.ComplexMean`.

### From TauCetiRoadmap.BanachSpaceTheory

- B2: the Eberlein–Šmulian theorem in its relative form (implemented as
  `TauCeti.isCompact_closure_toWeakSpace_iff`), the Krein–Šmulian weak-star closedness criterion
  (implemented as `Convex.isClosed_iff_forall_isClosed_inter_closedBall`, in
  Analysis/Normed/Module/Dual/KreinSmulian.lean at the Tau Ceti pin), reflexivity of Hilbert
  spaces and weak compactness of their closed balls.
- B5: the isometric duality between `C(K, 𝕜)` and finite regular `𝕜`-valued Borel measures on a
  compact Hausdorff `K`, with the integration pairing.

### From TauCetiRoadmap.SuccessiveMinima

The upper half of Minkowski's second theorem, implemented in Tau Ceti as above. No other item.

## Provenance

Quantitative versions over `ℤ/N` of the following were formalized in openai/math (Apache-2.0,
commit `adc7f124`):
- the Croot–Sisask lemma, local and global;
- relative Chang, in the form of 6.2;
- regular Bohr sets in the chord metric with constant `200 · max 1 rank`;
- the Bogolyubov lemma with rank `1 + C(p+1)⁴` and radius `e^{−C(p+1)}` for density `e^{−p}`;
- Bohr sets containing proper GAPs;
- Balog–Szemerédi–Gowers in the energy form;
- Ruzsa modelling of subsets of `ℤ` in `ℤ/(2 #(sA − sA))`;
- the Marcinkiewicz–Zygmund inequality.

Finite-abelian versions of the Croot–Sisask lemma, Chang's lemma, Rudin's inequality, Bohr sets
and regular Bohr sets are in LeanAPAP. The roadmap generalises both: measured groups in Layers 0–3,
compact and compact abelian groups in Layers 4–6, torsion-free groups and vector spaces over `𝔽_p`
in Layer 7. Neither source is prescriptive; Layers 4 and 8–11 have no formal precursor.

## References

- N. N. Bogolyubov, *Sur quelques propriétés arithmétiques des presque-périodes*, Ann. Chaire
  Phys. Math. Kiev 4 (1939) 185–205.
- E. Følner, *Generalization of a theorem of Bogoliouboff to topological abelian groups*,
  Math. Scand. 2 (1954) 5–18.
- E. Croot and O. Sisask, *A probabilistic technique for finding almost-periods of convolutions*,
  Geom. Funct. Anal. 20 (2010) 1367–1396 (Layer 2; Propositions 1.3 and 3.3).
- T. Sanders, *On the Bogolyubov–Ruzsa lemma*, Anal. PDE 5 (2012) 627–655 (Layers 2, 5–7;
  Lemma 4.3, Lemma 5.2, Lemmas 6.2–6.3, §3, Lemma 11.2, Theorems 1.1, 10.1 and 11.3).
- T. Sanders, *The structure theory of set addition revisited*, Bull. Amer. Math. Soc. 50 (2013)
  93–127 (Theorems 7.2–7.3 for Layer 1, §§7–8 for Layers 2 and 5, Theorem 1.4).
- M.-C. Chang, *A polynomial bound in Freiman's theorem*, Duke Math. J. 113 (2002) 399–419
  (Chang's lemma).
- W. Rudin, *Fourier Analysis on Groups*, Interscience 1962, Ch. 5 (dissociated sets and
  Rudin's inequality).
- J. Bourgain, *On triples in arithmetic progression*, Geom. Funct. Anal. 9 (1999) 968–984
  (regular Bohr sets).
- B. Green and I. Z. Ruzsa, *Freiman's theorem in an arbitrary abelian group*, J. London Math.
  Soc. 75 (2007) 163–175 (coset progressions; models in `𝔽₂ⁿ`, Proposition 6.1; the absence of
  dense models in general, Proposition 6.4).
- I. Z. Ruzsa, *Sumsets and structure*, in *Combinatorial Number Theory and Additive Group
  Theory*, Adv. Courses Math. CRM Barcelona, Birkhäuser 2009, 87–210 (Theorem 3.5: modelling in
  torsion-free groups).
- T. Tao and V. Vu, *Additive Combinatorics*, Cambridge University Press 2006, Ch. 2 (Ruzsa
  calculus, Balog–Szemerédi–Gowers), Ch. 3 (geometry of numbers), Ch. 4 (Bohr sets and
  progressions).
- T. Tao, *Product set estimates for non-commutative groups*, Combinatorica 28 (2008) 547–594
  (Lemmas 3.2 and 3.6, Theorem 5.2: non-abelian Ruzsa calculus and Balog–Szemerédi–Gowers).
- W. F. Eberlein, *Abstract ergodic theorems and weak almost periodic functions*, Trans. Amer.
  Math. Soc. 67 (1949) 217–240 (Layer 9).
- A. Grothendieck, *Critères de compacité dans les espaces fonctionnels généraux*, Amer. J. Math.
  74 (1952) 168–186 (Layer 9.2).
- K. de Leeuw and I. Glicksberg, *Applications of almost periodic compactifications*, Acta Math.
  105 (1961) 63–97 (Layer 10).
- R. Ellis, *Locally compact transformation groups*, Duke Math. J. 24 (1957) 119–125; I. Namioka,
  *Separate continuity and joint continuity*, Pacific J. Math. 51 (1974) 515–531 (Layer 10.4).
- I. Namioka and E. Asplund, *A geometric proof of Ryll-Nardzewski's fixed point theorem*,
  Bull. Amer. Math. Soc. 73 (1967) 443–445 (Layer 10.1).
- R. B. Burckel, *Weakly Almost Periodic Functions on Semigroups*, Gordon and Breach 1970;
  J. F. Berglund, H. D. Junghenn and P. Milnes, *Analysis on Semigroups*, Wiley 1989;
  W. Ruppert, *Compact Semitopological Semigroups: An Intrinsic Theory*, Lecture Notes in Math.
  1079, Springer 1984 (Layers 8–10).
- M. Beiglböck, V. Bergelson and A. Fish, *Sumset phenomenon in countable amenable groups*,
  Adv. Math. 223 (2010) 416–432 (Layer 11.3 in amenable groups).
- Y. Dillies and B. Bloom, LeanAPAP, `github.com/YaelDillies/LeanAPAP` (Apache-2.0): the
  `BohrSet` structure, Croot–Sisask, Chang and Rudin over finite abelian groups.
- OpenAI, openai/math at commit `adc7f124` (Apache-2.0): the `ℤ/N` formalization summarised under
  Provenance.
