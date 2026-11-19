# Roadmap: compact operators and nonarchimedean Fredholm theory

**Summary.** Serre proved that a completely continuous operator `u` on a `p`-adic Banach space
has an entire Fredholm determinant `det(1 − Tu)` whose zeros govern the spectrum of `u` as in the
classical Riesz theory, and Coleman extended the theory to Banach algebras of coefficients, the
form in which eigenvarieties use it. This roadmap builds it over a *Banach–Tate ring* `R`: a
complete ultrametric normed commutative ring with `‖1‖ = 1` and a unit `ϖ`, `0 < ‖ϖ‖ < 1`, by
which multiplication scales every norm exactly. `R` may have nilpotents and its norm need not be
multiplicative; field statements are over a complete nontrivially normed ultrametric field `K`,
with no discreteness, spherical completeness or characteristic assumption.

The model space is `c₀(I, R)`, the null families on a set `I`. An operator `u` on it has a matrix
`(aᵢⱼ)` whose rows are indexed by output coordinates; `u` is *row compact* when the row suprema
`rᵢ(u) = supⱼ ‖aᵢⱼ‖` tend to zero, and *completely continuous* when it is a limit in operator
norm of maps whose image lies in a finitely generated submodule. Its Fredholm determinant
`H_u(T) = det(1 − Tu)` has `n`-th coefficient `(−1)ⁿ` times the sum of the principal `n × n`
minors. Everything is transported to (Pr) modules, the direct summands of model spaces.

The headline theorems are these.

- *Serre's criterion.* Over `K`, an operator between model spaces is row compact if and only if it
  is completely continuous, if and only if it maps the unit ball to a compactoid set. On any
  ultrametric Banach space over `K` compactoid image is complete continuity, and over a locally
  compact `K` both are compactness in the usual topological sense.
- *Determinant and spectrum.* For row-compact `u` on `c₀(I, R)`, `H_u` is entire, and for every
  `a ∈ R` the operator `1 − au` is invertible if and only if `H_u(a)` is a unit of `R`. Over `K`,
  the nonzero spectrum of `u` is the set of inverses of the zeros of `H_u`, and every `1 − au` is
  Fredholm of index zero.
- *Riesz decomposition.* Let `u` be compact on a (Pr) module `M`, and `H_u = QS` with `Q` a
  polynomial, `Q(0) = S(0) = 1`, the leading coefficient of `Q` a unit, `S` entire, and `Q`, `S`
  coprime among entire series. Then `M` is the direct sum of `ker Q*(u)`, with `Q*` the reversed
  polynomial, and a closed `u`-stable complement; the first summand is finite projective of
  constant rank `deg Q`, and the determinants of `u` on the two summands are `Q` and `S`. The case
  `Q = (1 − a⁻¹T)ʰ` is the Riesz projector at a zero of order `h`.
- *Coleman's spectral mapping theorem.* For row-compact `u` and an entire series `B` with
  `B(0) = 0`, the operator `B(u)` is row compact, and `H_{B(u)}` is obtained from `H_u` by
  Coleman's resultant transform, which replaces each inverse root `α` by `B(α)`.

[PadicFunctionalAnalysis](../PadicFunctionalAnalysis/README.md) supplies Banach–Tate rings, the
ring-scalar operator norm, `c₀(I, R)` with its matrices, and (Pr) modules;
[RestrictedPowerSeries](../RestrictedPowerSeries/README.md) supplies entire series with their
evaluation, Hasse derivatives, division, monic resultants and preparation;
[NewtonPolygons](../NewtonPolygons/README.md) supplies the polygons read off `H_u`, and
[AdicSpacesPartII](../AdicSpacesPartII/README.md) the completed tensor product used for base
change. [LocallyAnalyticDistributions](../LocallyAnalyticDistributions/README.md) uses the
determinants, resolvents and projectors for its finite-slope decompositions. Layer 0 compares the
notions of compactness, Layer 1 builds the determinant, Layer 2 the resolvent and invertibility,
Layer 3 the spectral projectors and Coleman's transform, and Layer 4 the slopes.

## How to read the build

Layer 0 compares finite-image approximation, row compactness, compactoid image and topological
compactness. Layer 1 constructs the Fredholm determinant and proves its estimates, invariance and
base change. Layer 2 imports the entire-series algebra and builds the resolvent and the
invertibility criterion. Layer 3 constructs the Riesz projectors, Coleman's transform and the
spectral decompositions. Layer 4 reads slopes from the Newton polygon of `H_u`, splits off
finite-slope summands and bounds the polygon from the matrix.

The layers are in build order. Finite matrix algebra (§1.1) depends on nothing in Layer 0 and can
be built first. Layer 0 rests on PadicFunctionalAnalysis; Layer 1 on Layer 0; the infinite sums of
§§1.2–1.3 and all of Layer 2 also use the entire-series interface of RestrictedPowerSeries. Within
§1.7, coefficientwise base change and the pure `c₀` comparison are independent of each other, and
the abstract transport uses both. In Layer 3, the good-zero projector (§3.1) needs the resolvent of
§2.4, while the prescribed-rank transform and its estimates (§3.3) need only §1.1 and the series
interface; §3.4 combines the two. Layer 4 applies the scalar polygon results of NewtonPolygons to
`H_u`; it imports them only at this point, so that no dependency runs back from NewtonPolygons to
the earlier layers. Each subsection's *Needs:* line lists the inputs of its statement and of the
route described, so a target proved by another route is not held behind an unrelated section.

## Conventions

1. **Coefficients.** A coefficient ring `R` is a complete ultrametric normed commutative ring with
   `‖1‖ = 1`. Operator-norm arguments over ring scalars additionally use Banach–Tate data: a unit
   `ϖ` with `0 < ‖ϖ‖ < 1` and `‖ϖx‖ = ‖ϖ‖‖x‖` for all `x`. Banach modules have compatible
   ultrametric norms and contractive scalar multiplication, as in PadicFunctionalAnalysis.
   Closedness, lifting and Noetherian hypotheses are stated where they are used. Multiplicativity
   of the norm of every element is not a standing assumption.
2. **Fields.** Field results use a complete nontrivially normed ultrametric field `K`. Discrete
   valuation, spherical completeness and characteristic zero are not assumed. Local compactness is
   imposed only for the converse comparison with topological compact operators (§0.5). Statements
   about roots use a complete extension in which the relevant polynomial splits.
3. **Carriers.** Use Mathlib's `ContinuousLinearMap`, `ZeroAtInftyContinuousMap` on a discrete
   index type (written `c₀(I, R)` or `C₀(I, R)`), `PowerSeries`, `Polynomial`, `Matrix`,
   `Module.Finite` and `Module.Projective`, and Mathlib's `PowerSeries.IsRestricted` and
   `PowerSeries.gaussNorm`. The ring-scalar operator norm is Tau Ceti's
   `ContinuousLinearMap.ringOpNorm`, which agrees with Mathlib's operator norm over a field
   (`ContinuousLinearMap.ringOpNorm_eq_opNorm`); it has the shape of
   [Mathlib's proposed generalisation of the infimum formula to modules over semirings](https://github.com/leanprover-community/mathlib4/pull/42865),
   and the [Zulip discussion of compact operators and Fredholm determinants](https://leanprover.zulipchat.com/#narrow/channel/217875-Is-there-code-for-X.3F/topic/compact.20operators.20and.20Fredholm.20determinant/with/572850121)
   explains its use over Banach–Tate rings. Operator limits are taken in this norm topology; the
   topology on entire series is convergence in every positive-radius Gauss norm. Generic finite
   matrix, polynomial and operator results needed here are built in Tau Ceti in the shape of the
   native API. The suggested library home is `TauCeti/Analysis/Normed/Operator/Nonarchimedean/`.
4. **Matrices and row compactness.** Write `aᵢⱼ = (u(eⱼ))ᵢ`: rows are output coordinates, the
   convention of `ContinuousLinearMap.matrixCoeff`. The matrix of a bounded operator has bounded
   entries and null columns; an arbitrary bounded operator need not have null row norms.
   **Row compactness** means `rᵢ(u) = supⱼ ‖aᵢⱼ‖ → 0` along the cofinite filter, together with a
   global bound on the entries (automatic over Banach–Tate scalars), so that a real supremum of an
   unbounded row cannot give a false compactness statement. Over fields it agrees with compactoid
   image of the unit ball (§0.5). Over coefficient rings the scalar ring stays explicit: forgetting
   to an underlying valued field need not preserve the property (§0.5).
5. **Finite image and complete continuity.** A map *has finite image* when its range is contained
   in a finitely generated submodule of the target; it is *completely continuous* when it is a
   limit in operator norm of maps with finite image. Row compactness implies complete continuity;
   the converse uses the finite lifting hypothesis of §0.2. Mathlib's `IsCompactOperator` is a
   separate topological predicate, compared in §0.5.
6. **Determinants and reversal.** `H_u = Σ cₙTⁿ` has `c₀ = 1` and `cₙ = (−1)ⁿ` times the sum of
   the principal minors of size `n`. A real supremum, `tsum` or `limUnder` used in a raw definition
   carries no boundedness or convergence theorem: these are proved before its value is used.
   Reversal in dimension `n` is `Polynomial.reflect n`, also when a characteristic determinant has
   degree less than `n`. Write `Q* = Q.reverse` only at the specified degree of a nonzero
   polynomial `Q`.
7. **Projectors.** Riesz projectors use `p` for the complementary projector and `E = 1 − p` for the
   finite spectral projector. Over rings a finite projective module need not be free, and its rank
   may vary between connected components of the spectrum. Constant rank is asserted only when a
   specified factor with unit leading coefficient forces it.
8. **Valuations and slopes.** Layer 4 uses the normalisation `‖x‖ = b^(−e(v(x)))`, `b > 1`, of
   NewtonPolygons (its Convention 2), where `e` is a strictly monotone additive embedding of the
   value group of `v` into `ℝ`. Layer 4 takes the value group inside `ℝ`, which loses nothing for a
   normed field; `e` is then multiplication by a real number `e > 0`, and slopes are measured in
   `v`. A cutoff `h` corresponds to the radius
   `b^(e h)`. Slopes count nonzero eigenvalues with algebraic multiplicity. Their total collection
   can be infinite, so the multiplicities are locally finite and are recorded by finite cutoff
   lists, not by a Lean `Multiset` of all slopes. Slopes lie in the divisible hull of the value
   group, not necessarily in the value group itself.
9. **Completeness of each construction.** Each construction comes with its defining equations,
   uniqueness or independence of choices, functoriality, degenerate cases (empty index sets, zero
   modules, order zero) and the negative examples recorded in its Checks. Every target and Check
   below is part of the roadmap.
10. **Names.** Names in code font that are not Mathlib's or Tau Ceti's are declared in
    `Suggested.lean`, in the namespace `TauCetiRoadmap.CompactOperators`. Its statements use the
    supplier declarations at the pins: `TauCeti.NormedRing.IsTate`,
    `ContinuousLinearMap.ringOpNorm` and `ContinuousLinearMap.matrixCoeff` of
    PadicFunctionalAnalysis, `PowerSeries.IsEntire`, `PowerSeries.evalAt` and
    `PowerSeries.hasseDeriv` of RestrictedPowerSeries, and the contractive pointwise action of `R`
    on `C₀(I, R)` (`ZeroAtInftyContinuousMap.instIsBoundedSMul`). Targets without a declaration
    there are described in words.

## Layer 0: approximation and compactness

### 0.1 Finite image and complete continuity

**Finite image and approximation.** Define `IsFiniteRank u` (finite image) and
`IsCompletelyContinuous u` as in Convention 5, for continuous linear maps between normed modules
over a normed commutative ring. Prove that both are closed under addition, scalar multiplication
and composition on either side with bounded maps, and that complete continuity is closed in
operator norm. Prove `IsFiniteRank.isCompletelyContinuous`. Over a Noetherian ring prove
`isFiniteRank_iff_range_fg`; without the Noetherian hypothesis keep only the implication from
finitely generated range to finite image, and do not identify the two definitions.
*Needs:* Tau Ceti `ContinuousLinearMap.ringOpNorm`; Mathlib `Submodule.FG`, `IsNoetherianRing`.

**The identity criterion.** On a Banach module, the identity is completely continuous if and only
if the module is finitely generated. For the forward direction choose a map
with finite image within operator norm `< 1` of the identity and invert it by the Neumann series;
its range is then the whole module. No Noetherian hypothesis is needed. Hence the identity of
`c₀(ℕ, R)` is not completely continuous. If `u` is completely continuous and `(1 − u)ⁿ = 0`, the
module is finitely generated, because `1 = u Σ_{k<n} (1 − u)^k` exhibits the identity as a
composite with a completely continuous map. The zero module and the exponent `n = 0` are included.
*Needs:* the ideal properties above; Tau Ceti `ContinuousLinearMap.oneSub` (Neumann inversion).

**Banach modules normed by a lattice.** Let `K` be complete and nontrivially valued, `A` a nonzero
Hausdorff complete normable topological `K`-algebra with a bounded open `K°`-subalgebra `A₀`, and
`M` a Hausdorff complete topological `A`-module with a bounded open `A₀`-lattice `M₀`. Define the
scalar lattice norms

```text
α_A(a) = inf { |c| : c ∈ K×, a ∈ c A₀ },     α_M(m) = inf { |c| : c ∈ K×, m ∈ c M₀ }.
```

Prove that they are compatible complete ultrametric norms inducing the given topologies, with
`α(cx) = |c| α(x)` for `c ∈ K×`. Hausdorffness is needed for definiteness; discreteness of the
value group is not.

**Normalised discrete comparison.** Choose `π ∈ K×` with `q = |π| < 1`, use its image as the
pseudo-uniformiser, and take PadicFunctionalAnalysis's gauge parameter `a = q⁻¹` for the algebra
and every module, so that `g_M(x) = inf { qⁿ : n ∈ ℤ, π^(−n) x ∈ M₀ }`, and likewise `g_A` for
`A₀`. Prove the discrete-rounding bounds

```text
α_M(x) ≤ g_M(x) ≤ q⁻¹ α_M(x),     α_A(x) ≤ g_A(x) ≤ q⁻¹ α_A(x).
```

For a scalar witness `x ∈ cM₀`, choose `n` with `|c| ≤ qⁿ < q⁻¹|c|`; then `cπ^(−n) ∈ K°`, so
`x ∈ πⁿM₀`. The reverse bound holds because powers of `π` are scalar witnesses. Pass to infima,
including `x = 0`, after proving that the defining sets are nonempty and bounded below. This gives
uniform multiplicative constants for source, target and induced operator norms. The rounded gauge
need not scale exactly by every element of `K`; the scalar lattice norm does. For the same `π` and
an arbitrary parameter `b > 1`, use PadicFunctionalAnalysis's separate power comparison
`g_b = g_(q⁻¹)^θ`, `θ = log b / log(q⁻¹) > 0`, and its consequence for the topology. An arbitrary
algebra-valued pseudo-uniformiser gives the compatible topology under PadicFunctionalAnalysis's
hypotheses, not these scalar bounds. Equality of topologies alone is never a multiplicative-constant
comparison. The norm and affinoid comparisons below use the normalised choice.

Identify complete continuity with the following lattice condition: for every open lattice `V` of
the target there are a continuous map `g` with finite image and a finitely generated
`A₀`-submodule `L` of the target with `g(M) ⊆ A·L` and `(u − g)(M₀) ⊆ V`. Changing to equivalent
gauges and to other bounded open lattices preserves the condition. Over a Noetherian `A`, prove
that it agrees with AdicSpacesPartIII's `Huber.IsCompletelyContinuous` (§R3.6, target
*completely-continuous-map*), using finitely generated range. The comparison here always uses an
actual continuous approximating map. *Needs:* Tau Ceti `TauCeti.Huber.tateGauge`,
`TauCeti.Huber.tateGauge_rpow`, `TauCeti.Huber.tateGauge_equiv`; AdicSpacesPartIII §R3.6 for the
affinoid predicate; `isFiniteRank_iff_range_fg`.

**Checks.**
- The zero map, and every map into a finitely generated module, has finite image and so is
  completely continuous.
- On `c₀(ℕ, R)` the diagonal operator `diag(ϖⁱ)` is completely continuous (its row norms `‖ϖ‖ⁱ`
  tend to zero) but does not have finite image: its range contains every `eᵢ` up to the unit
  `ϖⁱ`, and a submodule generated by `m` elements cannot contain `e₀, …, e_m`, by the rank condition for nonzero commutative rings. A definition of complete
  continuity as finite image would identify the two notions.
- On the scalar line `M = K`, `M₀ = K°`, the lattice norm is `α(x) = |x|`, including `α(0) = 0`;
  replacing `M₀` by `cM₀` divides `α` by `|c|`, a bounded-equivalent norm, and leaves complete
  continuity unchanged.
- For `K = ℚ_p` and `M₀ = ℤ_p`, the unnormalised choice `(π, a) = (p², p)` gives
  `α(p^(2m)) = p^(−2m)` but `g(p^(2m)) = p^(−m)`, a ratio `p^m` that is unbounded as `m` grows:
  a gauge parameter not matched to `π` gives no uniform constant. With the normalised choice
  `(π, a) = (p², p²)`, `g(p^k) = p^(−2⌊k/2⌋)` for every integer `k`, hence `α ≤ g ≤ p² α` and
  `g(p^(2m)) = α(p^(2m))`; at `p`, however, `g(p) = 1` while `α(p) = p⁻¹`, so bounded equivalence
  is not equality.

### 0.2 Row compactness on model spaces

**Truncations.** Use the matrix `ContinuousLinearMap.matrixCoeff` and the coordinate projections
`π_S = ZeroAtInftyContinuousMap.indicatorCLM` on finite sets `S`. Define the row norm `rowNorm`
and `IsRowCompact` (Convention 4). Prove that `rᵢ(u)` is bounded and that
`‖u‖ = supᵢ rᵢ(u)`. Prove that row compactness is equivalent to `‖u − π_S u‖ → 0` as the finite
set `S` increases. The truncations have finite image, so `IsRowCompact.isCompletelyContinuous`
follows, without a Noetherian hypothesis. The input-side truncations `uπ_S` need not converge: an
operator of rank one can have a row of matrix entries that is not null. *Needs:* Tau Ceti
`ContinuousLinearMap.matrixCoeff`, `ContinuousLinearMap.ringOpNorm_eq_iSup_norm_matrixCoeff`,
`ZeroAtInftyContinuousMap.indicatorCLM`, `ZeroAtInftyContinuousMap.tendsto_indicatorCLM`; §0.1.

**Ideal and transport properties.** Row-compact maps between two model spaces form a closed
operator ideal. Prove stability under finite sums, composition with bounded maps, reindexing,
bounded changes of basis, finite blocks, and restriction by bounded split inclusions and
projections. A diagonal operator is row compact exactly when its entries tend to zero cofinitely.
A bound `‖aᵢⱼ‖ ≤ rᵢ` with `rᵢ → 0` suffices for row compactness; include geometric bounds and
weighted coefficient models. *Needs:* Tau Ceti `ZeroAtInftyContinuousMap.diagonalCLM`,
`ZeroAtInftyContinuousMap.congrLeft`, `ContinuousLinearMap.hasSum_matrixCoeff_mul`.

**Comparison with complete continuity.** If every finitely generated submodule of the target is
closed and its chosen finite generators admit bounded lifts of bounded vectors, operators with
finite image have row decay; deduce that row compactness and complete continuity are then
equivalent. Over a Noetherian Banach–Tate ring these hypotheses hold, by the finite-module and
open mapping theorems of PadicFunctionalAnalysis. The row-decay theory is kept available without
that hypothesis; no Noetherian-free equivalence is asserted. *Needs:* Tau Ceti
`Submodule.exists_finset_norm_le`, `TauCeti.Huber.isClosed_of_isNoetherian`,
`ContinuousLinearMap.isOpenMap_of_isTate`; PadicFunctionalAnalysis §§1.4 and 2.6 (closed finite
submodules over a Noetherian Banach–Tate ring).

**Checks.**
- The identity of `c₀(I, R)` for infinite `I` has every row norm equal to one and is not row
  compact; the zero operator, and every operator on a finite index set, is row compact.
- The map `x ↦ (Σⱼ xⱼ) e₀` has a single nonzero row and is row compact, but for infinite `I` and
  every finite `S` the operator `u − uπ_S` sends `e_k`, `k ∉ S`, to `e₀`, so `uπ_S` stays at
  distance one from `u`. A definition of compactness by input-side truncation would exclude this
  operator.

### 0.3 Kernels and improvement of radius

Use the comparisons of restricted series with `c₀` and the analytic substitutions of
RestrictedPowerSeries. A bounded two-variable coefficient array with null columns presents the
operator with kernel `Σ aᵢⱼ xⁱ yʲ`; prove compatibility with composition, by summation over the
middle index, and with diagonal rescaling. For bounded `g` and `h` with `‖h‖ ≤ 1`, the operator
`f ↦ g · f(h)` has matrix entries `coeff i (g hʲ)` and kernel `g(x) / (1 − h(x) y)`, read as a
series in `y`.

If a bounded map factors through the series restricted at a radius `c > 1` before the inclusion
into the unit-radius space, prove the row bound `C c^(−i)` and hence row compactness. Give the
version in finitely many variables with total degree, and the version for finitely many charts.
The radius inclusions themselves are completely continuous, by polynomial truncation; when the
radius lies outside the value group, use the weighted coefficient models, without assuming a
scalar of that norm.

For the scalar locally analytic stages, apply this criterion to the transition and evaluation maps
of PadicFunctionalAnalysis. In its normalised (Amice) bases these maps are diagonal with entries
`⌊n/pʰ⌋! / ⌊n/p^(h+1)⌋!` and `⌊n/pʰ⌋!` respectively, and both tend to zero. Extend to finite
projective coefficient modules by retracts. Arbitrary infinite-dimensional Banach coefficient
modules are excluded: the summand of constant functions would carry their identity operator.
*Needs:* RestrictedPowerSeries §§1.2, 1.3 and 2.2 (radius restriction, the coefficient model,
analytic substitution); Tau Ceti `TauCeti.AnalyticStage`, `TauCeti.AnalyticStage.transition`,
`TauCeti.AnalyticStage.amiceMap` and PadicFunctionalAnalysis §4.4 (the transition in Amice
coordinates); §0.2.

**Checks.**
- Strict improvement of radius is row compact, while the identity at equal radius, on infinitely
  many monomials, is not completely continuous (§0.1).
- The substitution with `h = 0` has finite image (its range is `R·g`), while `g = 1`, `h = x` is
  the identity.
- Finitely many charts in zero variables give a finitely generated module, on which every operator
  is completely continuous.

### 0.4 Potentially orthonormalisable and (Pr) modules

Transport row compactness along continuous linear equivalences with `c₀`, and prove independence
of the presentation. For a retract `M →ⁱ c₀(I, R) →ʳ M` with `ri = 1`, call `u` compact when `iur`
is row compact. For a second retract, write the two extensions as bounded composites of one another
on the left and right to prove independence. No finite-dimensional complement is presumed.

Transport the ideal, closedness and approximation results. Every operator on a finite projective
Banach module is compact in its finite free retract model. A (Pr) module on which the identity, or
an operator `u` with `(1 − u)ⁿ = 0`, is compact is finitely generated by §0.1, and hence finite
projective, since a finitely generated (Pr) module is projective (`TauCeti.HasPr.projective`).
Prove directly that a row-compact idempotent on `c₀` has finite
projective range, by comparison with a sufficiently large finite coordinate projection; this is the
finiteness argument behind the Riesz projectors over rings (§3.1). *Needs:* Tau Ceti
`TauCeti.IsPotentiallyONable`, `TauCeti.HasPr`, `TauCeti.HasPr.of_retract`,
`TauCeti.hasPr_iff_forall_exists_comp_eq_id`, `TauCeti.HasPr.projective`; §§0.1–0.2.

### 0.5 Compactoid images and topological compact operators

Over `K`, a subset `S` of a Banach space is compactoid if for every neighbourhood `U` of zero there
is a finite set `F` with `S ⊆ U + span_{K°}(F)`; boundedness follows. Equivalently, for every
`ε > 0` there are finitely many vectors `vᵢ` such that each `x ∈ S` lies within `ε` of a sum
`Σ aᵢvᵢ` with all `‖aᵢ‖ ≤ 1`; this is `IsCompactoidSet K S` (De Grande–De Kimpe §§1.1, 2.1). Its
API covers the empty set, subsets, closure, finite sums, scalar multiples and bounded linear
images. For a continuous `K`-linear map, `HasCompactoidImage u` means that `u` maps the closed unit
ball to a compactoid set; Schikhof (§2.15) calls such a map compact. It is distinct from Mathlib's
topological `IsCompactOperator`.

**Model-space comparison.** For `S ⊆ c₀(I, K)`, prove that `S` is compactoid if and only if it is
bounded and has uniformly decaying coordinates:
`∀ ε > 0, ∃ T finite, ∀ x ∈ S, ∀ i ∉ T, ‖xᵢ‖ < ε`. For one direction truncate, and put the bounded
finite coordinates in a finite `K°`-span after rescaling by a scalar; for the other, use the small
tails of the finitely many approximating vectors. Applied to the image of the unit ball this gives,
for maps between model spaces,

```text
IsRowCompact u ↔ HasCompactoidImage u ↔ IsCompletelyContinuous u,
```

with neither discreteness nor spherical completeness; the row criterion for complete continuity is
Serre §3, Proposition 4 and its corollary. This is `isRowCompact_iff_isCompletelyContinuous`.
Transport it to potentially orthonormalisable spaces and (Pr) presentations. For arbitrary
ultrametric Banach spaces over `K`, prove `hasCompactoidImage_iff_isCompletelyContinuous`
independently of a chosen model. For the approximation direction, first factor the image through
the closed subspace of countable type generated by countably many finite approximating sets, then
use almost orthogonal coordinates in that subspace. Projections of arbitrary finite-dimensional
subspaces of the ambient space are not used: over a field that is not spherically complete they
would need Hahn–Banach hypotheses that fail (Schikhof §2.7), whereas Serre §1, Remark 2 gives the
finite-dimensional splitting inside `c₀` without that obstruction.

Deduce `isCompletelyContinuous_of_isCompactOperator`: a compact operator in Mathlib's sense is
completely continuous, for every such `K`. Over a locally compact `K` the converse holds (Serre §3,
Proposition 5, p. 73), which is `isCompletelyContinuous_iff_isCompactOperator`. The set API here is
the Banach-space theory needed for this comparison; the locally convex theory of compactoid sets is
outside the scope.
*Needs:* Tau Ceti `TauCeti.exists_isTOrthogonalBasis_of_dense_span` and PadicFunctionalAnalysis
§2.4 (countable type); Mathlib `IsCompactOperator`; §§0.1–0.2 and §0.4.

**Checks.**
- Over `ℂ_p`, the identity of a scalar line has finite image and is completely continuous, but it
  is not a compact operator, since the unit ball of `ℂ_p` is not compact; local compactness is
  needed for the converse.
- **Scalar-ring check.** The identity of `A = K⟨T⟩`, viewed as the free Banach `A`-module of rank
  one, is row compact and completely continuous over `A`. As a `K`-linear map it is neither: the
  unit ball contains every monomial `Tⁿ`, and these have no uniform coefficient tail. So finite
  image or row compactness over `A` must not be read as compactoidness over `K`; a relative
  definition with `A°`-spans is another scalar-dependent notion and does not remove the
  distinction.

### Examples

- On `c₀(ℕ, K)`, a diagonal operator `diag(dᵢ)` is row compact, completely continuous and has
  compactoid image exactly when `dᵢ → 0`; it has finite image exactly when only finitely many `dᵢ`
  are nonzero.
- Over `K = ℚ_p`, the inclusion of the series restricted at radius `p` into those restricted at
  radius one is `diag(pⁱ)` in the orthonormal bases `(pⁱXⁱ)` and `(Xⁱ)`, and is row compact, as
  §0.3 asserts.

### Dependencies

PadicFunctionalAnalysis Layers 0–2 and §§4.3–4.4 (Tate norms and gauges, ring-scalar operator
norms, open mapping, `c₀` and its matrices, (Pr) modules, analytic stages and their Amice
coordinates); RestrictedPowerSeries §§1.2, 1.3 and 2.2 for §0.3; AdicSpacesPartIII §R3.6 for the
affinoid comparison in §0.1. Mathlib: continuous linear maps, `IsCompactOperator`, finitely
generated submodules, `ZeroAtInftyContinuousMap`. Sources: Serre §§1–3; Johansson–Newton §2.1 for
the Noetherian Banach–Tate comparison; De Grande–De Kimpe §§1–2 and Schikhof §§2.7, 2.13, 2.15 for
compactoid sets. The general row-decay and retract statements are proved here, not taken from
those sources.

## Layer 1: Fredholm determinants

### 1.1 Finite matrices

For `A : Matrix (Fin n) (Fin n) R`, the determinant `det(1 − TA)` is Mathlib's
`Matrix.charpolyRev A`, and `Matrix.reverse_charpoly` identifies it with the reverse of the
characteristic polynomial. Prove that it equals `Polynomial.reflect n A.charpoly`, the reversal in
dimension `n`. Expose its principal-minor expansion, its constant coefficient, functoriality in the
coefficient ring, the product formula for block-triangular matrices, invariance under
transposition, and the identities `det(1 − TAB) = det(1 − TBA)`, including for rectangular `A`
and `B`. Prove that over an ultrametric normed commutative ring with `‖1‖ = 1`, `‖det D‖` is at
most the product of bounds for the rows of `D`, and for the columns of `D` (for a nonempty matrix
the hypothesis `‖1‖ = 1` is not used); give the two-sided bound used in §4.4. Use Mathlib's
polynomial resultants, with all degree bounds explicit, for finite-dimensional spectral mapping.
*Needs:* Mathlib `Matrix.charpolyRev`, `Matrix.reverse_charpoly`, `Polynomial.reflect`,
`Matrix.det`, `Polynomial.resultant`.

**Checks.**
- The empty matrix has determinant one, and so does a nonzero nilpotent Jordan block
  `[[0, 1], [0, 0]]`, since `det [[1, −T], [0, 1]] = 1`.
- For `diag(a, 0)` the determinant is `1 − aT`, of degree one in dimension two. Reflecting in
  dimension two gives `T² − aT = T(T − a)`, while reversing at the actual degree gives `T − a`,
  which loses the zero eigenvalue that the transform of §3.3 needs.

### 1.2 Principal minors and coefficients

Define `minor u S`, the determinant of `(aᵢⱼ)_{i,j ∈ S}` for a finite set `S`, and
`charCoeff u n = (−1)ⁿ Σ'_{|S| = n} minor u S`. For row-compact `u`, prove summability, the
empty-minor formula and agreement with §1.1 for an operator that vanishes outside a finite block
of coordinates. The coefficients do not
depend on an enumeration of `I`.

Bound each minor by `∏_{i∈S} rᵢ(u)`, and each coefficient by the supremum of these products (over a
field, Serre §5, Proposition 7(a) and the proof of 7(b), pp. 75–76). Provide a decreasing
rearrangement of the nonzero null row bounds, padded by zeros when there are only finitely many;
empty and finite index sets are handled without assuming an infinite list of positive row norms.

**Uniform tails under a common majorant.** If every member of a family satisfies
`rᵢ(u_α) ≤ rᵢ`, with `rᵢ ≥ 0` and `rᵢ → 0`, fix `ρ > 0`, `0 ≤ q < 1`, `B ≥ 1` and a finite `T`
with `ρrᵢ ≤ q` off `T` and `ρrᵢ ≤ B` everywhere. Prove

```text
‖charCoeff u_α n‖ ρⁿ ≤ B^|T| q^(n − |T|),
```

with natural truncated subtraction in the exponent, including `q = 0` and `n = 0`. This is
`norm_charCoeff_mul_pow_le_of_rowNorm_le`, used for families of distributions. *Needs:* §0.2,
§1.1; ultrametric summability (PadicFunctionalAnalysis §0.1).

**Checks.**
- For `u = diag(pⁱ)` on `c₀(ℕ, ℚ_p)` the coefficients are
  `cₙ = (−1)ⁿ p^(n(n−1)/2) / ∏_{j=1}^n (1 − pʲ)`, by the `q`-binomial identity for
  `Σ_{i₁<…<iₙ} p^(i₁+…+iₙ)`. Thus `v_p(cₙ) = n(n−1)/2`, but `cₙ` is not just its numerator
  `(−1)ⁿ p^(n(n−1)/2)`, which would be the value of a definition keeping only the dominant minor.
- A definition summing all `n × n` minors, not only the principal ones, would give the nilpotent
  `[[0, 1], [0, 0]]` the coefficient `c₁ = −1` instead of `0`, contradicting §1.1.

### 1.3 Entirety and continuity

Define `charPowerSeries u` from these coefficients. Prove `charPowerSeries_isEntire` (over a field,
Serre §5, Proposition 7(b), pp. 75–76), using §1.2 at every positive radius, and that the
determinants of the finite output compressions of `u` converge to it in every Gauss norm. Prove
that each coefficient is continuous in the operator norm, with explicit bounds on bounded sets, for
instance `‖cₙ(u) − cₙ(v)‖ ≤ ‖u − v‖ max(‖u‖, ‖v‖)^(n−1)` for `n ≥ 1`, by changing one row at a
time. Upgrade coefficientwise convergence of a family to Gauss convergence when a common null row
majorant is supplied. For a sequence of row-compact operators converging in operator norm, prove
convergence of the determinants in every Gauss norm by controlling the row tails (over a field,
Serre §5, Proposition 8, p. 77); coefficientwise convergence of unrelated entire series does not
suffice. *Needs:* §1.2; Tau Ceti
`PowerSeries.IsEntire` and RestrictedPowerSeries §§1.1 and 7.2 (Gauss norms and completeness for
all of them); Mathlib `PowerSeries.gaussNorm`.

**Checks.**
- `Tᴺ → 0` coefficientwise but has Gauss norm one at radius one for every `N`, so coefficientwise
  convergence alone does not give Gauss convergence.

### 1.4 Cyclicity and invariance

Prove `H_{AB} = H_{BA}` for composable bounded maps between model spaces when one factor is row
compact (over a field, Serre §5, Proposition 7, Corollary 2, p. 76), then invariance under bounded
conjugation, reindexing and extension by zero. Scalar multiplication gives `H_{au}(T) = H_u(aT)`.

Principal minors are unchanged by transposition of the matrix. If the matrix of a row-compact `u`
and its transpose both define operators on the stated `c₀` spaces, the transposed operator is row
compact (`IsRowCompact.transpose`), and when the index sets agree the two determinants are equal.
Separately, state equality of the minor series of a matrix and its transpose whenever those sums
converge, without asserting that either matrix is an operator.

For a diagonal intertwining `AD = DB` whose diagonal entries are nonzero and are not zero
divisors, prove equality of corresponding finite principal minors by cancelling `det D_S`, and
deduce equality of determinant series when both are defined. The diagonal map need not have a
bounded inverse: this theorem asserts neither an isomorphism of Banach spaces nor equality of
spectra. *Needs:* §§1.1–1.3; §0.2; Tau Ceti `ContinuousLinearMap.hasSum_matrixCoeff_mul`.

### 1.5 Determinants on (Pr) modules

Define `H_u` for a compact `u` on a (Pr) module through a retract extension `iur` (§0.4). Prove
independence of the retract using the cyclic identity of §1.4 with the transition maps between two
retracts. Recover the determinant of an operator on a finite projective module, compatibly with
localisation and bounded coefficient maps. It is a polynomial, but its degree need not equal the
rank. A global matrix formula requires a free module or a specified free retract; local matrices
suffice for a projective module. *Needs:* §0.4, §1.4.

**Checks.**
- For `R = K × K` and `e = (1, 0)`, the identity of `eR` has determinant `1 − eT`, that is
  `(1 − T, 1)`. Its leading coefficient `−e` is not a unit and the rank of `eR` is one at one
  prime and zero at the other. A definition assuming free modules of constant rank, or a
  determinant of degree equal to the rank, would exclude this example.

### 1.6 Partitions, blocks and finite factors

Prove the formula for a finite partition of the index set and multiplicativity for block-diagonal
and block-triangular operators, first on model spaces and then on split Banach modules. If `u`
commutes with a bounded idempotent `e`, show `H_u = H_{ue} H_{u(1−e)}`, with the factors read on
their summands or, equivalently, as operators on the whole space
(`charPowerSeries_eq_mul_of_comm`). For a finite projective invariant summand with an invariant
complement, obtain its polynomial determinant factor and the complementary Fredholm series. This
is a statement about a specified decomposition: it asserts neither `H_u = H_u²` nor
multiplicativity of `H` for arbitrary products of operators. *Needs:* §§1.4–1.5.

### 1.7 Coefficients and base change

Let `φ : R → S` be a bounded unital homomorphism of rings as in Convention 1, preserving the
Banach–Tate data used for module bounds, and fix `L ≥ 1` with `‖φ(r)‖ ≤ L‖r‖`. No Noetherian or
common ground field hypothesis is imposed.

**Coefficientwise Fredholm base change.** Extend a bounded matrix on `c₀(I, R)` coefficientwise to
`c₀(I, S)`. Prove `rᵢ(u_S) ≤ L rᵢ(u)`, row compactness of `u_S`, and
`H_{u_S} = PowerSeries.map φ H_u`, by the principal-minor sums. This statement precedes, and does
not use, determinants on abstract tensor products. *Needs:* Tau Ceti
`ContinuousLinearMap.mapCoeffs`; §§1.2–1.3.

**Pure tensor comparison.** On the completed tensor product of Banach modules of AdicSpacesPartII
§R0.5 (target *completed-tensor-banach-module*), construct

```text
Θ_φ : c₀(I, R) ⊗̂_R S ≃ c₀(I, S),     Θ_φ(x ⊗ s)ᵢ = φ(xᵢ) s,
```

`S`-linear and continuous with continuous inverse. This general ring-scalar statement is a target
here; LocallyAnalyticDistributions §4.2's comparison for Noetherian `K`-Banach algebras is a
special case of it. When `R` is a field and `φ` is contractive, `Θ_φ` is AdicSpacesPartII §R0.5(f)
for `V = c₀(I, R)` and `E = S`, in the orientation `S ⊗̂_R c₀(I, R)`; the statement here is its
ring-scalar variant. Reuse the tensor topology, product seminorm, Hausdorff completion and scalar
action of AdicSpacesPartII; no second completed tensor product is constructed. For the product
seminorm `‖z‖_π = inf { max_j ‖x_j‖ ‖s_j‖ : z = Σ_j x_j ⊗ s_j }` (an empty maximum is zero), prove

```text
‖Θ_φ(z)‖ ≤ L ‖z‖_π,     ‖Θ_φ⁻¹(y)‖_π ≤ ‖y‖.
```

The balanced coefficient map gives the first estimate on every finite presentation. On families of
finite support define the inverse by `y ↦ Σᵢ eᵢ ⊗ yᵢ`; its bound is one because `‖eᵢ‖ = 1`. Extend
by density and completeness, and check the two composites on families of finite support and on
pure tensors, approximating `x ∈ c₀` by its finite truncations. This proves the equivalence and the
estimates, also after passing to the separated quotient. If `φ` is contractive the two bounds give
an isometry; a merely bounded `φ` gives a bounded equivalence. The commutativity isomorphism
identifies the opposite orientation `S ⊗̂_R c₀(I, R)` with this one. The comparison uses neither
determinants nor compactness. In `Suggested.lean`, `c0_completedBaseChange` states it in the
orientation `S ⊗[R] C₀(I, R)`, on the completion of a seminormed `S`-module identified with the
algebraic tensor product so that its norm is the product seminorm. *Needs:* AdicSpacesPartII §R0.5;
Tau Ceti `TauCeti.Huber.BanachModule.CompletedTensor`,
`TauCeti.Huber.BanachModule.CompletedTensor.tmul`,
`TauCeti.Huber.BanachModule.CompletedTensor.lift`; Tau Ceti `ZeroAtInftyContinuousMap.single`.

**Abstract module transport.** For a bounded operator, identify its extension to the completed
tensor product, under `Θ_φ`, with its coefficientwise extension. For a specified (Pr) retract,
extend its inclusion and retraction using the functoriality and split exactness of AdicSpacesPartII
§R0.5, transport the determinant identity just proved, and prove independence of the chosen retract
by §1.5. Flatness is not assumed, and arbitrary exact sequences are not claimed to be preserved.
Prove identity and composition laws, and compatibility with equivalent coefficient and module
norms, with polynomial factors and with spectral projectors. When changing gauge parameters use
PadicFunctionalAnalysis's explicit topology and power comparisons; multiplicative-constant norm
bounds require bounded-equivalent normalisations as in §0.1. *Needs:* the two comparisons above;
AdicSpacesPartII §R0.5 (functoriality `TauCeti.Huber.BanachModule.CompletedTensor.map` and split
exactness; finite projective modules `TauCeti.Huber.BanachModule.CompletedTensor.finiteProjectiveEquiv`);
§1.5; §0.1.

**Checks.**
- For `I` empty both sides are zero, and for `φ` the identity of `R`, `Θ_φ` is the unit
  isomorphism `c₀(I, R) ⊗̂_R R ≃ c₀(I, R)`, for finite and infinite `I` alike.
- For a prime `p`, take `R = ℚ_p × 𝔽_p((t))` with the maximum norm, `S = 𝔽_p((t))` with
  `‖t‖ = p⁻¹`, `φ` the second projection, `ϖ_R = (p, t)` and `ϖ_S = t`. These rings have no
  common ground field through unital maps: one would have characteristic zero and characteristic
  `p` at once. For `I = ℕ`, `Θ_φ((xᵢ, yᵢ)ᵢ ⊗ s) = (yᵢ s)ᵢ`, with inverse the limit of
  `Σ_{i∈F} eᵢ ⊗ sᵢ`. For the finite projective retract `eRⁿ`, `e = (0, 1)`, the tensor extension
  is `Sⁿ`, and the complementary retract `(1 − e)Rⁿ` extends to zero; include `n = 0`, the
  identity base change and the diagrams of commuting idempotents, not only a mapped finite matrix.
  A construction through a common ground field would not apply here.
- Over `ℚ_p⟨X⟩`, `diag(pⁱXⁱ)` has determinant `∏_{i≥0} (1 − pⁱXⁱT)`, and specialising at `X = 0`
  gives `diag(1, 0, 0, …)` with determinant `1 − T`, as coefficientwise base change requires.

### Examples

- For `u = diag(pⁱ)` on `c₀(ℕ, ℚ_p)`, `H_u = ∏_{i≥0} (1 − pⁱT)`, an entire series with zeros at
  `p^(−i)`; its coefficients are computed in the Checks of §1.2.
- For the rank-one operator `x ↦ (Σⱼ xⱼ) e₀`, every row but the first is zero, so the only
  nonzero principal minors are the empty one and the entry `a₀₀ = 1`, and `H_u = 1 − T`.

### Dependencies

Layer 0; RestrictedPowerSeries §§1.1 and 7.2 for entire series; AdicSpacesPartII §R0.5 for §1.7.
Mathlib: matrices, determinants, `Matrix.charpolyRev`, polynomials, power series and Gauss norms.
Finite matrix algebra (§1.1) does not use Layer 0. Sources: Serre §§3–5 for the determinant
estimates and cyclicity; Johansson–Newton §2.1 for the Noetherian (Pr) comparison. The broader
row-decay version is proved here directly, not attributed to that statement.

## Layer 2: series interfaces and the resolvent

### 2.1 Imported entire algebra and Hasse calculus

Use RestrictedPowerSeries §§2.1, 2.3 and 7.2: entire series (`PowerSeries.IsEntire`), evaluation
`PowerSeries.evalAt F a = Σ aₙaⁿ`, completeness for all Gauss norms, and evaluation in the complete,
generally noncommutative algebra of bounded endomorphisms. The Hasse derivative is
`PowerSeries.hasseDeriv`, over any semiring, with
`coeff n (hasseDeriv k F) = (n+k choose k) • coeff (n+k) F`; it has the identity, additivity, left
scalar compatibility and ordered Leibniz laws, and agrees with Mathlib's `Polynomial.hasseDeriv` on
polynomials. No factorial is inverted. Translation `PowerSeries.taylor` and the Taylor identity are
imported. The value at `a` of the `h`-th Hasse derivative is
`(PowerSeries.hasseDeriv h F).evalAt a`. *Needs:* Tau Ceti `PowerSeries.IsEntire`,
`PowerSeries.evalAt` and its convergence for entire series in complete normed algebras,
`PowerSeries.hasseDeriv`, `PowerSeries.taylor`; RestrictedPowerSeries §§2.1, 2.3 and 7.2.

**Checks.**
- In characteristic two, the second Hasse derivative of `T²` is `1`, while the second ordinary
  derivative is `2 = 0`; a Hasse derivative defined as an ordinary derivative divided by a
  factorial is not available there.
- `Σ p^(n²) Tⁿ` is entire over `ℚ_p`, while the `p`-adic exponential, of radius `p^(−1/(p−1))`, is
  not.

### 2.2 Imported division and monic entire resultants

Use the unique division of an entire series by a polynomial with unit leading coefficient, with
entire quotient and polynomial remainder. For monic `Q` of degree `d`, the quotient
`PowerSeries.divByMonic F Q` has `coeff n = Σ_k a_(n+d+k) b_k`, where `Σ b_k T^k = (Q.reverse)⁻¹`;
it converges and is the unique quotient. This uses no multiplicativity of the norms of arbitrary
units.

The monic entire resultant `Polynomial.entireResultant Q F` is the determinant of multiplication by
the remainder of `F` on the finite free algebra `R[T]/(Q)`. Its polynomial comparison, invariance
modulo `Q`, multiplicativity in `F`, bounded base change, `Res(T − a, F) = F(a)` and a Bézout
identity `C(Res(Q, F)) = QG + HF` with `G` entire and `deg H < deg Q` are supplied; it is a unit if
and only if `Q` and `F` are coprime among entire series. The degree-zero case is kept:
`Res(1, F) = 1`, even for `F = 0`. These are prerequisites here for spectral transforms and
projectors. Their Checks are those of RestrictedPowerSeries §7.2. *Needs:* RestrictedPowerSeries
§7.2; Tau Ceti `PowerSeries.divByMonic`, `PowerSeries.modByMonic` with the division identity for
entire series, `Polynomial.entireResultant`.

### 2.3 Good zeros

For an entire `F`, `F` has a good zero of order `h` at `a` (`IsGoodZero F a h`) when the Hasse
derivatives of order `j < h` vanish at `a` and the one of order `h` is a unit there; `h = 0` means
that `F(a)` is a unit. Prove the product rule for orders and the factorisation `F = (T − a)ʰ G` with
`G(a)` a unit, from the division and Taylor identities. If `F(0) = 1` and `F(a) = 0`, then `a` is a
unit, with inverse `−Σₙ a_(n+1) aⁿ`; this needs the hypothesis on the constant coefficient, since
`T` has the root zero, which is not a unit.

For `h > 0` rewrite the factor as `(1 − a⁻¹T)ʰ`, absorbing the unit into the other normalised entire
factor. Over a field every zero of a nonzero entire series has finite order; prove this from
injectivity of Taylor translation, not from a Weierstrass product theorem. Products, bounded
coefficient maps that keep the order-`h` Hasse value a unit, and finite polynomial specialisations
are compatible with orders. *Needs:* §§2.1–2.2; RestrictedPowerSeries §7.2 (the inverse of a
root of a normalised entire series, at the pins for `PowerSeries.IsEntire` and
`PowerSeries.evalAt`).

**Checks.**
- Over a ring of characteristic two, `(1 − T)² = 1 + T²` has a good zero of order two at `1`: its
  value and first Hasse derivative vanish there and its second Hasse derivative is the constant
  `1`. Every ordinary derivative of `1 + T²` vanishes identically, so an order defined by ordinary
  derivatives would be infinite.
- Every `F` with `F(0) = 1` has a good zero of order zero at `0`, and the projector of §3.1 there
  is zero.

### 2.4 Resolvent and determinant at one

For row-compact `u`, put `V_m = Σ_{k≤m} c_k u^(m−k)` (`resolventCoeff u m`) and
`V(T) = Σ V_m T^m`. Prove that `V` is entire in operator norm and that

```text
(1 − Tu) V(T) = V(T) (1 − Tu) = H_u(T) · 1.
```

Over a field, entirety of `V` is Serre §6, Proposition 10, p. 78. Derive operator-norm bounds
sufficient for evaluation and Hasse differentiation at any scalar, and show that the resulting
operators lie in the operator-norm closure of `R[u]` (`IsOpLimitAeval`).

The Fredholm determinant at one is `H_u(1)`. For row-compact `u` and `v`, prove that the
determinant at one of `u + v − uv` is the product of those of `u` and `v`, corresponding to
`(1 − u)(1 − v)`; no commutativity of `u` and `v` is needed (over a field, Serre §5, Proposition 7,
Corollary 1, p. 76). Include the comparison with finite matrices and bounded base change.
*Needs:* §§1.2–1.4, §1.7; §2.1; Tau Ceti `ContinuousLinearMap.ringOpNorm` (complete operator
algebra, PadicFunctionalAnalysis §1.1).

**Checks.**
- For the identity of a line, `H = 1 − T` and `V = 1`, since `V₁ = u − 1 = 0`. The resolvent is
  not the formal Neumann series `Σ Tᵐuᵐ = (1 − T)⁻¹`, which diverges at `T = 1`.

### 2.5 Invertibility and nonzero spectrum

Prove `isUnit_one_sub_smul_iff`: for row-compact `u` and `a ∈ R`, `1 − au` is invertible among
bounded operators if and only if `H_u(a)` is a unit (over a field, where the units are the nonzero
values, Serre §7, Proposition 11, p. 80). For the forward direction use the multiplicativity of
§2.4 and the fact that the inverse differs from the identity by a row-compact operator; for the
reverse direction the evaluated resolvent supplies the inverse.

Over `K`, for `λ ≠ 0`, `λ` lies in Mathlib's `spectrum` of `u` if and only if `H_u(λ⁻¹) = 0`. A good
zero supplies a nonzero eigenvector and, in Layer 3, the whole generalised eigenspace. No claim
about the spectral value zero is made from the Fredholm determinant. *Needs:* §2.4; Mathlib
`spectrum`.

**Checks.**
- For `u = diag(pⁱ)` over `ℚ_p`, `1 − au` is invertible exactly when `a ∉ {p^(−i)}`, matching the
  zeros of `∏ (1 − pⁱT)`; `0` lies in the spectrum of this injective, non-surjective operator,
  although `H_u(0) = 1`, so the criterion says nothing at `λ = 0`.

### Examples

- For `u = [[1, ε], [0, 1]]` over `K[ε]/(ε²)`, `H_u = (1 − T)²`, `1 − au` is invertible exactly when
  `1 − a` is a unit, and `V(T) = (1 − T) + T(u − 1)`.

### Dependencies

Layer 1; RestrictedPowerSeries §§2.1, 2.3 and 7.2 for the series interface, imported rather than
reimplemented; PadicFunctionalAnalysis §1.1 for the complete algebra of bounded operators. Mathlib:
`spectrum`, `Polynomial.hasseDeriv`. Sources: Serre §§4–7 and Coleman, Appendix A3–A4; ring
statements keep every displayed unit hypothesis.

## Layer 3: projectors and spectral transforms

### 3.1 The Riesz projector at a good zero

Let `H_u` have a good zero `a` of order `h`. For `h > 0` put `c = Δʰ H_u(a)`, `C = 1 − au`,
`b = c⁻¹ ΔʰV(a)`, and construct `p = (Cb)ʰ`, `E = 1 − p`, `w = bp`, where `Δʰ` is the `h`-th Hasse
derivative and `V` the resolvent; over a field `p` is the projector `eʰ` of the proof of Serre §7,
Proposition 12, pp. 80–81. Prove `p² = p`, `Cw = wC = p`, `pw = wp = w` and `CʰE = 0`; all these
operators commute with `u`. The identity `Cʰ(Cb − 1) = 0`, from the differentiated resolvent,
explains the formula and is part of the target. For `h = 0` put `p = 1`, `E = 0` and use the
inverse of §2.5.

Prove that `range E = ker Cʰ`, that `range p` is a closed `u`-stable complement, and that `C` is
invertible on it. Both projectors and the inverse on the complement lie in the operator-norm closure
of `R[u]`; this is `IsRieszProjection`, and `exists_rieszProjection` asserts existence, with `E`
row compact and its range finite projective. Prove uniqueness of the splitting with these nilpotence
and invertibility properties.

Show that `E` is compact and its range finite projective of constant rank `h`, the rank at every
prime of `R` (Mathlib `Module.rankAtStalk`), proved algebraically: checking only field-valued points
would lose nilpotent information. The determinant of `u` on the range of `E` is `(1 − a⁻¹T)ʰ` when
`h > 0`, and the complementary factor is obtained by division. At order zero the projector is zero,
directly from the definition of `IsRieszProjection`. *Needs:* §§2.3–2.5; §0.4 (row-compact
idempotents have finite projective range); §1.6; Mathlib `Module.rankAtStalk`.

**Checks.**
- For `u = 1 + N` on a two-dimensional space with `N² = 0 ≠ N`, `H_u = (1 − T)²`; the root `a = 1`
  has order two with `c = 1`, the resolvent is `V = (1 − T) + TN` so `Δ²V = 0` and `b = 0`, hence
  `p = 0` and `E = 1`: the whole space is the generalised eigenspace, though the eigenspace
  `ker N` is a line. A projector onto the eigenspace would have rank one, not two.
- For `diag(λ, μ)` with `λ` and `λ − μ` units and `a = λ⁻¹`, the formula gives `c = μ − λ`,
  `b = diag(μ, λ)/(λ − μ)`, `p = diag(0, 1)` and `E = diag(1, 0)`.
- The matrix `[[1, ε], [0, 1]]` over `K[ε]/(ε²)` gives `E = 1` of rank two, with its coefficients
  kept rather than passed to field-valued points.
- At order zero, in particular at `a = 0` since `H_u(0) = 1`, the spectral projector is zero and its
  range has rank zero; the signature of `exists_rieszProjection` includes this case.

### 3.2 Field eigenspaces

Let `u` be row compact on `c₀(I, K)`, or transported to a potentially orthonormalisable space. If
`a` is a zero of `H_u` of order `h > 0`, then `a ≠ 0`, and with `C = 1 − au` prove the topological
decomposition

```text
M = N ⊕ F,     N = ker Cʰ,     F = range Cʰ,     dim_K N = h.
```

Both summands are closed and `u`-stable; `C` is nilpotent on `N` and invertible on `F`. The finite
factor is `(1 − a⁻¹T)ʰ` and the complementary factor does not vanish at `a`. So `a⁻¹` is an
eigenvalue, its generalised eigenspace stabilises at exponent `h`, and its algebraic multiplicity
is `h`. This is [Serre, §7, Proposition 12, pp. 80–81](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf#page=13),
which already allows a nondiscrete valuation for `E = c(I)`: its finite-dimensional splitting input
is §1, Remark 2, p. 71, which allows nondiscrete valuations, and the discreteness assumption of §1,
Proposition 1, which makes every Banach space potentially orthonormalisable, is not a hypothesis of
Proposition 12. Johansson–Newton, Theorem 2.2.2, with `R = K` and `Q = (1 − a⁻¹T)ʰ`, is an
alternative reference: a field is Noetherian, and `Q* = (T − a⁻¹)ʰ`, with no discrete valuation
needed.

Recover uniqueness, functoriality and bounded extension of scalars. Use this splitting and §2.5 to
prove `isFredholm_one_sub_smul`: every `1 − au` is Fredholm in Mathlib's
`ContinuousLinearMap.IsFredholm` sense, of index zero in the sense of Mathlib's `LinearMap.index`
(the Fredholm alternative, Serre §7, corollary to Proposition 12, p. 82). Prove each of its
conditions: strictness (the quotient by the kernel is homeomorphic to the image), closed range,
finite-dimensional kernel and cokernel, and a topologically complemented kernel. Split the kernel
inside the finite block and combine that finite-dimensional complement with the bounded Riesz
complement; no projection of an arbitrary finite-dimensional subspace of the ambient space is used.
The finite block has equal kernel and cokernel dimensions and the complement is invertible, so the
index is zero. Each nonzero eigenvalue is isolated, and only finitely many, counted with
multiplicity, have norm bounded below by a fixed positive number in a complete splitting field;
zero may be an accumulation point. *Needs:* §3.1, §2.5, §0.4; Mathlib
`ContinuousLinearMap.IsFredholm`, `LinearMap.index`, `spectrum`.

**Checks.**
- For nilpotent `u` in finite dimension, `H_u = 1` has no zeros, so there is no finite summand,
  and `1 − au` is invertible for every `a`, while `0` is an eigenvalue: the decomposition sees only
  nonzero eigenvalues.
- A Jordan block `[[λ, 1], [0, λ]]` over `ℂ_p` with `|λ|` outside `p^ℤ`, a check with a value group
  that is not discrete: `H_u = (1 − λT)²`, `h = 2` at `a = λ⁻¹`, and `N` is the whole plane.

### 3.3 Coleman's transform, including entire functional input

**Prescribed finite rank.** For polynomials `P` with `P(0) = 1`, `deg P ≤ n`, and `B` with
`deg B ≤ m`, define

```text
D_(n,m)(B, P)(T) = Res_X( reflect n P (X), 1 − T B(X) )
```

with Mathlib's resultant at the degree bounds `n` and `m`; this is `colemanDBounded n m B P`. Prove
independence of `m` once it bounds `deg B`, and the padding identity
`D_(n+1,m) = (1 − B(0)T) D_(n,m)` when `deg P ≤ n` (`colemanDBounded_succ`), hence
`D_(n+k,m) = (1 − B(0)T)^k D_(n,m)`. When `B(0) = 0` the transform therefore does not depend on the
rank `n ≥ deg P`, and agrees with the transform at the minimal rank `n = deg P`; in general it does
depend on the rank, and finite matrices use their dimension, so that zero eigenvalues are counted.
Prove multiplicativity in `P` (with additivity of the ranks), bounded coefficient-map
compatibility, and spectral mapping for finite matrices,
`det(1 − T B(A)) = D_(n,m)(B, det(1 − TA))` in dimension `n`, by universal polynomial identities. *Needs:* Mathlib `Polynomial.resultant`,
`Polynomial.reflect`; §1.1.

**Majorants.** For an entire `F = Σ aⱼTʲ` with `F(0) = 1`, construct a positive antitone null
sequence `ρ` with `‖aⱼ‖ ≤ ∏_{i<j} ρᵢ` (`exists_newtonMajorant`). For an entire `B = Σ b_m T^m` put
`β_B(r) = sup_{m≥1} ‖b_m‖ r^m` (`colemanMajorant B r`). Show that it is finite for `r > 0`,
monotone in `r`, and tends to zero as `r → 0`; in particular `β_B(ρᵢ) → 0`. Prove the uniform
bound

```text
‖coeff k D_(N,M)(trunc_(M+1) B, trunc_(N+1) F)‖ ≤ ∏_{i<k} β_B(ρᵢ)     when B(0) = 0,
```

for all `N` and `M`. The proof uses universal estimates for symmetric polynomials over the
coefficient ring, not evaluation at its field-valued points alone. *Needs:* Tau Ceti
`PowerSeries.IsEntire`; Mathlib `PowerSeries.trunc`; the prescribed-rank transform.

**Convergence and topology.** First prove that the coefficients of these finite transforms are
Cauchy as `(N, M) → ∞` independently, with an explicit continuity estimate in terms of the
coefficient tails of `F` and `B`; the common majorant alone is not a Cauchy argument. Then, for
entire `B` with `B(0) = 0` and entire `F` with `F(0) = 1`, use the majorant to prove convergence
in every Gauss norm. Define `colemanDEntire B F` as this limit, and
prove `tendsto_gaussNorm_colemanDBounded` and `colemanDEntire_isEntire` (entire, with constant
coefficient one), independence of the choice of truncations, multiplicativity in `F`, bounded base
change, and agreement with the transform of a polynomial `F` (the finite transform at its degree)
when `B(0) = 0`. *Needs:* the majorants; Mathlib `PowerSeries.gaussNorm`; RestrictedPowerSeries
§§1.1 and 7.2 (completeness for the Gauss norms).

**Operator evaluation and spectral mapping.** Import the convergence of `Σ b_m u^m` in operator norm
from RestrictedPowerSeries's evaluation in noncommutative Banach algebras; on model spaces this is
`exists_tendsto_opNorm_sum_pow`. If `u` is row compact and `B(0) = 0`, the value `B(u)` is row
compact by the closed ideal property. Prove `charPowerSeries_eq_colemanDEntire`:
`H_{B(u)} = colemanDEntire B H_u`, first for finite matrices and then by the norm and Gauss limits
proved above. *Needs:* RestrictedPowerSeries §2.1; §0.2 (closed ideal), §1.3 (continuity of the
determinant), the finite matrix case above.

**Checks.**
- `β_T(r) = r`, `β_0(r) = 0` and `β_(T²)(r) = r²`.
- `D(T, F) = F`, and `D(0, F) = D(B, 1) = 1` for `B` with zero constant term; the identity case
  includes `F = 1 − εT²` with `ε² = 0`, which has no roots to transform, so a proof by roots in a
  field does not cover it.
- `D_(1,0)(1, 1) = 1 − T` while `D_(0,0)(1, 1) = 1`: the prescribed rank changes the transform of
  the same polynomial, as for the zero eigenvalue of `diag(a, 0)` in §1.1.
- For `u² = 0`, `B(u) = b₀ + b₁u`; operator evaluation sends `0` to zero and `T` to `u`. On infinite
  `c₀`, `B = 1` evaluates to the identity, which is not row compact.
- With `P = 1` and `B = c ≠ 0`, rank padding gives `D_(N,m)(c, 1) = (1 − cT)ᴺ`, whose linear
  coefficients `−Nc` are not Cauchy over `ℚ_p`: the zero constant term of `B` is essential for the
  infinite transform.

### 3.4 Coprime polynomial factors and Riesz–Coleman decomposition

Let `H_u = QS` for a compact `u` on a (Pr) module `M`, where `Q(0) = S(0) = 1`, `Q` is a polynomial
with unit leading coefficient, `S` is entire, and `Q` and `S` are coprime in the ring of entire
series. Construct the unique closed `u`-stable splitting

```text
M = ker Q*(u) ⊕ M_S.
```

The first summand is finite projective of constant rank `deg Q`, `u` is invertible on it, and its
determinant is `Q`; the determinant on the complement is `S`. The operator `Q*(u)` is zero on the
first summand and invertible on the second. The projectors and the inverse on the complement lie in
the operator-norm closure of `R[u]`. State the corresponding projector predicate, the Riesz–Coleman
projection, and its existence, including transport along retracts and bounded base change. For
`Q = 1` the finite summand is zero. For Noetherian `R` this is Johansson–Newton, Theorem 2.2.2,
p. 10.

`exists_rieszColemanProjection` states the existence, with a (Pr) module given by a retract
`r ∘ i = 1` of `c₀(I, R)`, `u` compact when `iur` is row compact (§0.4) and `H_u` the determinant of
`iur` (§1.5). The determinants of `u` on the two summands are read on `M`, as those of `uE` and
`u(1 − E)` for the projector `E` onto the first summand, which §1.6 identifies with the
determinants on the summands.

Use §3.3 with `B(X) = 1 − lc(Q)⁻¹ Q*(X)`, whose constant coefficient is zero because `Q*(0)` is the
leading coefficient of `Q`, together with the projector of §3.1 at the root one; then prove the
refinements from nilpotence to `Q*(u) = 0`, the equality of determinants and the rank. No scalar
division by a nonunit and no global basis of a projective summand is used.

Also prove the distinct invertibility criterion: for `Q(0) = 1` with unit leading coefficient, `Q`
and `H_u` are coprime among entire series if and only if `Q*(u)` is invertible. For the formulation
with a monic polynomial in LocallyAnalyticDistributions §4.14, require the constant coefficient of
the polynomial to be a unit and rescale by it. Coprimality of the two factors `Q` and `S` instead
gives invertibility only on the complementary summand, not on all of `M`. *Needs:* §§3.1 and 3.3,
§§1.5–1.6, §0.4; RestrictedPowerSeries §7.2 (entire coprimality and the resultant criterion);
Mathlib `Polynomial.reverse`, `Module.rankAtStalk`.

**Checks.**
- For `u = diag(λ, μ)` with `λ − μ` and `λ` units and `Q = 1 − λT`, `S = 1 − μT`: `Q* = T − λ`,
  `ker Q*(u)` is the first coordinate line, of rank one with determinant `Q`, and `Q*(u)` is
  invertible on the second line; `Q` and `H_u` are not coprime and `Q*(u)` is not invertible on the
  whole space, while `Q` and `S` are coprime.

### 3.5 Commuting operators

Every bounded operator commuting with `u` preserves all the preceding summands, since it commutes
with the projectors, which lie in the closure of `R[u]`. Over a complete splitting field, a nonzero
finite spectral summand carries a common eigenvector for a commuting family whose generated algebra
splits there. Give the resulting systems of eigenvalues and their compatibility with extension of
scalars. The actual Hecke algebras and their geometric parameters belong to the downstream
applications. *Needs:* §§3.1–3.4.

### Examples

- For `u = diag(pⁱ)` over `ℚ_p` and `a = p^(−k)`, the Riesz projector of order one is the coordinate
  projection onto `e_k`.

### Dependencies

Layer 2 for the resolvent and good zeros, giving the projector at a good zero; §§1.1 and 1.3 and the
series interface for the finite transform and its analytic extension, giving the polynomial-factor
projector. Sources: Coleman, Appendix A3–A4; Johansson–Newton, Theorem 2.2.2, which is stated for
Noetherian (Pr) modules. The row-compact proof on model spaces over general Banach–Tate rings,
followed by transport along retracts, is a target here, not an import obtained by dropping a
hypothesis of that source.

## Layer 4: slopes and matrix estimates

### 4.1 Reading the Fredholm polygon

Apply the Newton polygon of NewtonPolygons to `H_u`. Its finite slopes are locally finite and
bounded below, and tend to `+∞` if there are infinitely many. Define the multiplicity at a slope
and the finite lists of slopes below any real cutoff. Multiplying `u` by a nonzero scalar shifts
the slopes by its valuation, and block sums add multiplicities. Nilpotent parts and zero
eigenvalues contribute no finite slopes. Polygon products and supporting-line geometry are not
rebuilt here. *Needs:* NewtonPolygons §§0.6, 5.3; Tau Ceti `PowerSeries.newtonPolygon`, with the
local finiteness of the slopes of an entire series; §1.3, §1.6.

**Checks.**
- The zero operator has determinant one and no finite slopes.

### 4.2 Slopes and eigenvalues

In a complete algebraically closed extension, the multiplicity of a slope `s` equals the sum of
the algebraic multiplicities of the nonzero eigenvalues of valuation `s`; a zero `a` of `H_u` gives
the eigenvalue `λ = a⁻¹`. State this through finite cutoff counts as well as through individual
multiplicities. Include the existence of an eigenvector at every finite slope and independence of
the complete splitting extension. *Needs:* §3.2, §4.1, §1.7; NewtonPolygons §§3.3 and 4.3 (roots,
analytic multiplicity and exact counts).

**Checks.**
- Over `ℚ_p`, slopes can be rational and nonintegral: `1 − pT²` has the slope `1/2` twice, and its
  eigenvalues `±√p` need a quadratic extension in general.

### 4.3 Finite-slope projectors

Over `K`, take the scalar factorisation `H_u = Q_(≤h) S_(>h)` at the radius `b^(e h)` from
NewtonPolygons: `Q_(≤h)` is the canonical disc factor, carrying the zeros of norm at most `b^(e h)`,
that is the slopes at most `h`, and its cofactor is entire and coprime to it among entire series,
by the normalised entire preparation of RestrictedPowerSeries §7.2. Apply §3.4 to obtain
the finite-dimensional `M_(≤h) = ker Q_(≤h)*(u)` and its stable complement. Prove that its dimension
is `deg Q_(≤h)`, that the spaces are nested as `h` increases, that they split into pieces of pure
slope, and that they are compatible with commuting operators and with complete field extensions.
These are operator consequences of the imported factorisation.

Over `R`, use the normalised entire preparation of RestrictedPowerSeries: if the greatest
Gauss-dominant coefficient at radius `ρ` is a multiplicative unit and `H_u(0) = 1`, obtain
`H_u = QG` with `Q(0) = G(0) = 1`, `deg Q = N`, unit leading coefficient, and `Q`, `G` coprime among
entire series, with the supplier's distinguished normalisation and `G` a unit at radius `ρ`. Apply
§3.4 to obtain a finite projective piece of rank `N`. Numerical slopes of a specialised fibre are
asserted only when the coefficient map preserves the dominance and radius conditions. Pointwise
factorisations over spectral spaces and their gluing belong to the geometric roadmaps. *Needs:*
§3.4; NewtonPolygons §4.1 (the canonical disc factor); RestrictedPowerSeries §7.2 and Tau Ceti
`TauCeti.PowerSeries.IsEntirePreparation`, `TauCeti.PowerSeries.IsEntirePreparation.isCoprime`.

**Checks.**
- For `diag(pⁱ)` over `ℚ_p`, the slopes are `0, 1, 2, …`, and `M_(≤h)` is spanned by the `eᵢ` with
  `i ≤ h`; it is the zero subspace for `h < 0`.

### 4.4 Bounds and exact polygons from a matrix

**Row bounds.** From §1.2 obtain the Hodge lower polygon with heights `Σ_{i<n} (−log_b rᵢ*)/e`,
where `r*` is the decreasing rearrangement of the positive terms of a specified nonnegative null row
majorant; its slopes are nondecreasing. If only `m` bounds are positive, the height is finite on
`[0, m]` and the subsequent integer heights are infinite; the Fredholm polynomial may have degree less
than `m`. Use the extended-height order of NewtonPolygons: the finite domain of the Newton polygon is
contained in that of the lower bound, and equality of domains is not presumed. In particular every
finite slope is at least `−log_b(‖u‖)/e` for nonzero `u`.

NewtonPolygons §§0.6–0.7 and §2.5 supply the ordered-weight polygon, `IsBelow`, and the implication
from coefficient bounds to `H ≤ NP(det(1 − Tu))`. The estimate supplied here is
`‖cₙ‖ ≤ ∏_{i<n} rᵢ*`, converted with the fixed normalisation of norm and valuation, including
`v(0) = ∞`. Convexity, the construction of polygons and their order are not rebuilt here. Call this
a **row Hodge lower polygon**, relative to the specified coordinates and majorant; it need not have
the same right endpoint as the Newton polygon, and it is not the intrinsic Hodge polygon of a finite
lattice. *Needs:* §1.2; NewtonPolygons §§0.6–0.7, 2.5 and Tau Ceti
`PowerSeries.heights_le_newtonPolygon_iff`.

**Finite lattice comparison.** For a full-rank endomorphism of a finite free lattice over a discrete
valuation ring, prove that the minimum valuation of all `n × n` minors is the sum of the first `n`
valuations of the invariant factors; this uses all choices of rows and columns, not only principal
minors. Bound each principal minor's valuation below by that minimum, apply the ultrametric
inequality to the coefficient sum, and conclude with the comparison of NewtonPolygons: the
Hodge–Newton inequality, with equality at the full-rank endpoint. Use Mathlib's
`Submodule.smithNormalForm` and its invariant factors, and prove the needed lemmas on determinantal
ideals and valuations of minors in the linear-algebra library. The lattice and the minor
calculation belong here; the ordered-weight polygon and the coefficient comparison belong to
NewtonPolygons. See [Kedlaya, §3, Theorem 16](https://kskedlaya.org/18.787/numerical.pdf#page=5),
with its origin translated to `(0, 0)` for the convention `det(1 − Tu)`. *Needs:* Mathlib
`Submodule.smithNormalForm`; §1.1; NewtonPolygons §2.5.

**Checks.**
- With `v(p) = 1`, `A = [[p, 1], [0, p]]` has row lower slopes `(0, 1)`, lattice Hodge slopes
  `(0, 2)` (invariant factors `1` and `p²`) and Fredholm Newton slopes `(1, 1)`, from
  `det(1 − TA) = (1 − pT)²`. The matrix `diag(p, p)` has the same Fredholm polynomial and lattice
  Hodge slopes `(1, 1)`. So the matrix and lattice data cannot be recovered from the polynomial, and
  the row bound need not be sharp.

**Weights.** For `0 < σ < 1` and `‖aᵢⱼ‖ ≤ σ^(wᵢ)`, bound each coefficient by
`σ^(min_{|S|=n} Σ_{i∈S} wᵢ)` whenever the stated lower bound for the minimum is available. Growth of
`w` along the cofinite filter gives row compactness. On `ℕ`, `wᵢ = i` gives the exponent
`n(n−1)/2`; on `J × ℕ` with `J` finite and nonempty, `w_(j,k) = k` gives `Σ_{i<n} ⌊i/|J|⌋`. The
empty `J` is treated separately.

**Two-sided matrix estimates.** For a matrix with `‖aᵢⱼ‖ ≤ σ^max(wᵢ − w'ⱼ, 0)` and integer
differences `δᵢ = wᵢ − w'ᵢ → +∞` cofinitely, prove summability of the principal minors and the
bound from `Σ_{i∈S} δᵢ`. The differences are bounded below; account for their finitely many
negative values. When `δ` is nonnegative and increasing in an enumeration by blocks, its first `n`
terms give the required lower sum. This defines an entire minor series without asserting row
compactness. To apply operator spectral theory, separately supply a bounded compact realisation and
prove equality of its determinant, for example by diagonal intertwining (§1.4); transposing a matrix
alone does not supply such a realisation. These estimates are motivated by slope calculations at
the boundary of weight space. *Needs:* §§1.2 and 1.4.

**Checks.**
- The matrix `aᵢⱼ = p^max(2i − j, 0)` defines a bounded operator on unweighted `c₀(ℕ, ℚ_p)` (its
  columns are null and its entries bounded) and has convergent minor series by the two-sided
  estimate with `wᵢ = 2i`, `w'ⱼ = j`, but it is not row compact, every row containing entries of
  norm one; its transpose has columns that are not null and does not define a bounded map on that
  `c₀`.

**Exact case.** Suppose `u` is row compact on `c₀(ℕ, K)`, `dᵢ ≠ 0`, `‖dᵢ‖` is strictly
decreasing, `‖aᵢⱼ‖ ≤ ‖dᵢ‖`, and every leading principal minor of `(dᵢ⁻¹aᵢⱼ)` has norm one. Prove
`‖cₙ‖ = ∏_{i<n} ‖dᵢ‖` and `v(cₙ) = Σ_{i<n} v(dᵢ)`, the leading principal minor being the unique
dominant one (`norm_charCoeff_of_unit_minors`). Row compactness, or an explicit hypothesis
`‖dᵢ‖ → 0`, is essential: over a dense value group strict decrease alone does not give convergence
of the minor sums. *Needs:* §1.2.

**Checks.**
- With `v(ϖ) = 1`, `dᵢ = ϖⁱ` and `dᵢ = ϖ^(2i+1)` give the slopes `i` and `2i + 1`; to obtain
  `i + 1/2`, use `dᵢ = π^(2i+1)` in a complete extension with `v(π) = 1/2`.
- Over a field whose value group is dense, `‖dᵢ‖` can decrease strictly to a positive limit; then
  `diag(dᵢ)` satisfies every other hypothesis of the exact case but is not row compact, and
  `c₁ = −Σ dᵢ` diverges, so strict decrease cannot replace row compactness.

### 4.5 Finite factors and initial segments

For a finite free invariant summand `F` of rank `r` with an invariant complement, use §1.6 and the
polygon product theorem of NewtonPolygons. The determinant on `F` has degree `d ≤ r`, with equality
when `u` is invertible on `F`. If all its finite slopes precede those of the complement, its polygon
is the initial segment of length `d`. To identify the whole of `F` with `M_(≤h)`, also require `u`
invertible on `F`: a summand of zero eigenvalues is invisible to the Fredholm series.

The unit-root part is `M_(=0)`. If `‖u‖ ≤ 1` there are no negative slopes and it equals `M_(≤0)`;
this is the ordinary part in that situation. Without the norm bound `M_(≤0)` may also contain
negative slopes. *Needs:* §1.6, §4.3; NewtonPolygons §3.2 (the product theorem for entire
series, at the pins for `PowerSeries.newtonPolygon`).

**Checks.**
- A finite nilpotent summand adds no finite slopes.
- `diag(p^(−1), 1, p, p², …)` has a negative slope `−1`, and `M_(≤0)` is spanned by `e₀` and `e₁`
  while `M_(=0)` is spanned by `e₁`, so the two differ without the bound `‖u‖ ≤ 1`.

### Examples

- For `u = diag(p^(2i+1))` over `ℚ_p`, the slopes are the odd integers, `M_(≤h)` is spanned by the
  `eᵢ` with `2i + 1 ≤ h`, and the row Hodge polygon equals the Newton polygon.

### Dependencies

Layers 1 and 3; NewtonPolygons Layers 0, 2, 3, 4 and 5 for all scalar polygon and root results;
RestrictedPowerSeries §7.2 for preparation over Banach rings. This layer adds their operator
interpretation. Sources: Serre §§5–7, Coleman, Appendix A, and Johansson–Newton §2.2 for the
applications; Kedlaya §3 for the lattice comparison.

## Downstream consumers

The library supports analytic distributions, overconvergent cohomology and quaternionic modular
forms through the same operator and determinant interfaces.

- [LocallyAnalyticDistributions](../LocallyAnalyticDistributions/README.md) uses these
  interfaces under its own notation, matched as follows.

  | Notation there | Interface here |
  | --- | --- |
  | `operatorEntry u i j`, output-column norms | `ContinuousLinearMap.matrixCoeff u j i`, output-row norms; this is PadicFunctionalAnalysis's transpose adapter (§2.6) |
  | `IsCompactoid` for row decay over a coefficient algebra | `IsRowCompact` (§0.2), distinct from the field-facing `HasCompactoidImage` (§0.5) |
  | Finite rank, meaning finitely generated range | `IsFiniteRank`, by `isFiniteRank_iff_range_fg` under Noetherianity (§0.1) |
  | `fredholmSeries`, `entireEval f a`, `hasseSeries` | `charPowerSeries`, the supplier's `PowerSeries.evalAt f a`, the supplier's Hasse derivative (§§1.2, 2.1) |
  | `polynomialSpectralResultant` | `colemanDBounded` with the prescribed matrix dimension (§3.3) |

  Its supplier contracts are owned as follows.

  | Its contract | Owner and target |
  | --- | --- |
  | §4.2 entire algebra and `entireEval f a` | RestrictedPowerSeries §§7.2 and 2.1: `PowerSeries.IsEntire` and `PowerSeries.evalAt`, with the argument order adapted |
  | §4.3 division by linear and monic polynomials, reciprocal-tail quotient, uniqueness and roots | RestrictedPowerSeries §7.2: `PowerSeries.divByMonic`, its coefficient formula, entire quotient and remainder, uniqueness |
  | §4.4 monic entire resultant, Bézout identity and analytic coprimality | RestrictedPowerSeries §7.2: `Polynomial.entireResultant` and the unit criterion; the operator-specific Coleman transform is §3.3 here |
  | §4.5 formal Hasse derivatives | RestrictedPowerSeries §2.3: `PowerSeries.hasseDeriv`, over any semiring |
  | §4.12 generic entire Gauss completeness, coefficient extraction and continuity of evaluation | RestrictedPowerSeries §§1.1, 2.1 and 7.2; determinant convergence and operator majorants are §§1.2–1.3 and §3.3 here |
  | §4.2 completed scalar extension of orthonormalisable modules and determinants | §1.7 here, **Pure tensor comparison**, followed by **Coefficientwise Fredholm base change** and transport to retracts |

  Its forwarding names, such as `entireEval` and the entire quotient, refer to the restricted-series
  constructions; they are notation adapters, not separate definitions or new proofs of generic
  series algebra.
- [AdicSpacesPartIII](../AdicSpacesPartIII/README.md) §R3.6 compares its affinoid complete
  continuity with §0.1 through the normalised gauge norms of §0.1 and the Noetherian finite-rank
  equivalence, and uses the approximation and ideal laws of §0.1 rather than a second proof of
  them. Its single-scalar strict approximation condition and the affinoid and cohomological
  applications are its own. Compatibility aliases state their scalar ring and keep these meanings.
- [PadicDifferentialEquationsAndRigidCohomology](../PadicDifferentialEquationsAndRigidCohomology/README.md)
  uses §§1.2–1.5 and §3.2, and [ModularSymbolsPadicLFunctions](../ModularSymbolsPadicLFunctions/README.md)
  uses §0.3.
- Quaternionic modular-form theory and the geometric roadmaps use the operator, determinant and
  spectral interfaces; Hecke actions, their matrix estimates, classicality, weight and spectral
  spaces and the gluing of eigenvarieties are theirs.

## Provenance

The `TateFredholm` sources of [W. Coram's PhD repository][PhDSources], at commit
`eefb3d91f34b27d0bc7822140fa85fecae029884`, are secondary implementation references, neither the
specification nor a build dependency. The table claims no proofs, and the import chains stay
independent.

| Source files in `PhD/Main/TateFredholm/` | Comparison with this roadmap |
| --- | --- |
| `02_Compact`, `04_Matrix`, `05_Noetherian`, `06_Pr` | Approximation, model-space criteria and retracts (Layer 0); the underlying norm and module theory belongs to PadicFunctionalAnalysis. |
| `05_Fredholm`, `06_BlockOp`, `06_TwoSidedBound`, `07_Conjugation`, `08_BaseChange` | Determinants, estimates, invariance and base change (Layers 1 and 4). |
| `09_Riesz`, `11_Coleman`, `11_SlopeFactor`, `12_RieszColeman`, `13_FiniteFactor` | Projectors, spectral transforms and operator slope pieces (Layers 2–4). |
| `10_Entire` | Generic series material belongs to RestrictedPowerSeries; the operator consequences use that interface here. |

[PhDSources]: https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/Main/TateFredholm

## Scope and ownership

This roadmap owns operator approximation and row compactness (Layer 0), principal-minor Fredholm
determinants with their estimates, invariance and base change, including the ring-scalar comparison
`Θ_φ` on the completed tensor product (Layer 1), the operator resolvent and invertibility (Layer 2),
Coleman's spectral transform, Riesz theory and the Riesz–Coleman decomposition (Layer 3), and the
application of scalar slope factorisation to operators, with the matrix and lattice estimates that
feed the Newton polygon (Layer 4). The resultant defining Coleman's transform belongs here; the
generic monic entire resultant belongs to RestrictedPowerSeries.

The following are left to named roadmaps.

- [PadicFunctionalAnalysis](../PadicFunctionalAnalysis/README.md) owns the general
  functional-analysis library: Banach–Tate rings and gauges (§0.4), ring-scalar operator norms and
  mapping theorems (§§1.1–1.2), finite Banach modules (§1.4), `c₀`, bases, (Pr) modules, countable
  type and matrices (§§2.1–2.6), and the analytic function spaces (Layer 4).
- [RestrictedPowerSeries](../RestrictedPowerSeries/README.md) owns all generic series algebra used
  above: Gauss norms (§1.1), radius changes and coefficient models (§§1.2–1.3), evaluation,
  substitution and Hasse derivatives (§§2.1–2.3), and entire series, division, monic entire
  resultants and normalised entire preparation (§7.2). No second Tate algebra or entire-series
  carrier is introduced here; §§2.1–2.2 above state the operator-facing contract of that supplier.
- [NewtonPolygons](../NewtonPolygons/README.md) owns convex geometry, valuation conventions, the
  polygon of a series, ordered-weight lower polygons and `IsBelow` (§§0.6–0.7), coefficient-to-polygon
  comparisons (§2.5), products and root dictionaries (Layer 3), disc factors and slope
  factorisation (Layer 4) and entire products (Layer 5).
- [AdicSpacesPartII](../AdicSpacesPartII/README.md) §R0.5 owns completed tensor products of Banach
  modules, their product seminorm, functoriality and split exactness, and in (f) the comparison
  with `c₀(I, E)` over a field; the general ring-scalar `c₀` comparison on that carrier is §1.7
  here.
- [AdicSpacesPartIII](../AdicSpacesPartIII/README.md) §R3.6 owns affinoid rings of definition, the
  affinoid predicate `Huber.IsCompletelyContinuous`, strictly completely continuous maps,
  restriction to submodules and the cohomological applications; the comparison of §0.1 applies to
  its affinoid lattice models.
- [LocallyAnalyticDistributions](../LocallyAnalyticDistributions/README.md) owns locally convex
  categories, distribution spaces and finite-slope complexes; its combined tensor and determinant
  statement in §4.2 specialises the two separate targets of §1.7.
- [OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md), Part A, owns the
  calculus of approximation numbers over fields. Its finite-rank approximability is compared with
  §0.1 over fields; the ring-relative predicate, the nonarchimedean matrix criteria and Fredholm
  determinant theory are this roadmap's. No singular-value or Schatten theory on Hilbert spaces is
  constructed here.

At the pins, Tau Ceti already has PadicFunctionalAnalysis's Banach–Tate data, ring-scalar operator
norm, `c₀` matrices and (Pr) modules, RestrictedPowerSeries's entire series, evaluation, Hasse
derivatives, division, entire resultant and normalised preparation, NewtonPolygons's polygon of a
series with its Hodge comparison and product theorem, and AdicSpacesPartII's completed tensor
product with its universal property and functoriality; these are listed by name below. The split
exactness of AdicSpacesPartII §R0.5 and the affinoid predicate of AdicSpacesPartIII §R3.6 are not at
the pins and remain those roadmaps' targets.

## Exact supplier contracts

### From Mathlib

- Operators and spectra: `ContinuousLinearMap`, `ZeroAtInftyContinuousMap`, `IsCompactOperator`
  (`Analysis/Normed/Operator/Compact/Basic`), `ContinuousLinearMap.IsFredholm`
  (`Analysis/Normed/Operator/Fredholm/Basic`; strict, closed range, finite-dimensional kernel and
  cokernel, topologically complemented kernel; distinct from the Fredholm determinant),
  `LinearMap.index` (`Algebra/Module/LinearMap/Index`; kernel dimension minus cokernel dimension),
  `spectrum`.
- Linear algebra: `Matrix.det`, `Matrix.charpoly`, `Matrix.charpolyRev` (`det(1 − X • M)`) and
  `Matrix.reverse_charpoly` (it is the reverse of the characteristic polynomial),
  `Submodule.smithNormalForm` (`LinearAlgebra/FreeModule/PID`), `Module.Finite`,
  `Module.Projective`, `Module.rankAtStalk`, `Submodule.FG`, `IsNoetherianRing`.
- Polynomials and series: `Polynomial.reflect`, `Polynomial.reverse`, `Polynomial.resultant` (the
  determinant of the Sylvester matrix at given degree bounds), `Polynomial.hasseDeriv`,
  `PowerSeries.IsRestricted`, `PowerSeries.gaussNorm`, `PowerSeries.trunc`, `PowerSeries.map`.
- Topology: `UniformSpace.Completion`, `TensorProduct`, `IsUltrametricDist`, `NormOneClass`,
  `IsBoundedSMul`, `LocallyCompactSpace`.

### From Tau Ceti

- PadicFunctionalAnalysis Layers 0–2 and 4, at the pins: `TauCeti.NormedRing.IsTate` and
  `TauCeti.NormedRing.PseudoUniformizer` (a unit `ϖ`, `0 < ‖ϖ‖ < 1`, scaling norms exactly);
  `ContinuousLinearMap.ringOpNorm` (the infimum of uniform bounds) with
  `ContinuousLinearMap.ringOpNorm_eq_opNorm` and Neumann inversion `ContinuousLinearMap.oneSub`;
  `ContinuousLinearMap.isOpenMap_of_isTate` (open mapping over Tate rings);
  `ZeroAtInftyContinuousMap.instIsBoundedSMul` (the pointwise action of `R` on `C₀(I, R)` is
  contractive), `ZeroAtInftyContinuousMap.single`, `ZeroAtInftyContinuousMap.indicatorCLM` and
  `ZeroAtInftyContinuousMap.tendsto_indicatorCLM` (coordinate vectors and truncations),
  `ZeroAtInftyContinuousMap.diagonalCLM`, `ZeroAtInftyContinuousMap.congrLeft`;
  `ContinuousLinearMap.matrixCoeff` (output-first matrix), `ContinuousLinearMap.hasSum_matrixCoeff_mul`,
  `ContinuousLinearMap.ringOpNorm_eq_iSup_norm_matrixCoeff` (operator norm is the supremum of the
  entries), `Matrix.toZeroAtInftyCLM`, `ContinuousLinearMap.mapCoeffs` (coefficientwise base
  change); `Submodule.exists_finset_norm_le` (finite-coordinate detection for complete finite
  submodules) and `TauCeti.Huber.isClosed_of_isNoetherian`; `TauCeti.IsPotentiallyONable`,
  `TauCeti.HasPr`, `TauCeti.HasPr.of_retract`, `TauCeti.hasPr_iff_forall_exists_comp_eq_id`,
  `TauCeti.HasPr.projective`; `TauCeti.exists_isTOrthogonalBasis_of_dense_span` (countable type
  over an arbitrary complete field); `TauCeti.Huber.tateGauge`, `TauCeti.Huber.tateGauge_equiv`
  (changing the subring gives bounded-equivalent gauges) and `TauCeti.Huber.tateGauge_rpow`
  (changing the parameter raises the gauge to a power); `TauCeti.AnalyticStage`,
  `TauCeti.AnalyticStage.transition` and `TauCeti.AnalyticStage.amiceMap`.
- RestrictedPowerSeries §§2.1, 2.3 and 7.2, at the pins: `PowerSeries.IsEntire` (restricted at
  every real radius), `PowerSeries.evalAt` (convergent for entire
  series in every complete normed algebra), `PowerSeries.hasseDeriv` (over any semiring),
  `PowerSeries.taylor`, `PowerSeries.divByMonic` and `PowerSeries.modByMonic` (with the division
  identity for entire series and monic divisors), `Polynomial.entireResultant`, the inverse of a
  root of an entire series with constant coefficient one, `TauCeti.PowerSeries.IsEntirePreparation` and
  `TauCeti.PowerSeries.IsEntirePreparation.isCoprime` (normalised entire preparation and the
  coprimality of its factors).
- NewtonPolygons §§2.5, 3.2 and 5.3, at the pins: `PowerSeries.newtonPolygon`,
  `PowerSeries.heights_le_newtonPolygon_iff` (a slope-data polygon lies below the Newton polygon
  exactly when its partial sums bound the coefficient heights), the product theorem (the polygon of
  a product of entire series is the Minkowski sum of the polygons) and the local finiteness of the
  slopes of an entire series.
- AdicSpacesPartII §R0.5, at the pins: `TauCeti.Huber.BanachModule.CompletedTensor`, the Hausdorff
  completion of the tensor topology, with `TauCeti.Huber.BanachModule.CompletedTensor.tmul`,
  `TauCeti.Huber.BanachModule.CompletedTensor.lift`, `TauCeti.Huber.BanachModule.CompletedTensor.map`
  and `TauCeti.Huber.BanachModule.CompletedTensor.finiteProjectiveEquiv`.

### From TauCetiRoadmap.PadicFunctionalAnalysis

§0.4 (the gauge `g_b = g_(q⁻¹)^θ` and the topology it induces), §1.4 (the normed bridge for finite
modules over a Noetherian Banach–Tate ring), §2.6 (closedness of finite submodules of `C₀(I, R)` over
a Noetherian Banach–Tate ring, and the input-first transpose adapter used in the notation table
above) and §4.4 (the transition between analytic stages is diagonal in Amice coordinates, with
multipliers `⌊n/pʰ⌋!/⌊n/p^(h+1)⌋!`), as stated there.

### From TauCetiRoadmap.RestrictedPowerSeries

§§1.1–1.3 (Gauss completeness, radius restriction and the coefficient model), §2.1 (evaluation in
complete, possibly noncommutative, normed algebras), §2.2 (analytic substitution), §2.3 (the Hasse
derivative over any semiring and the Taylor identity) and §7.2 (completeness for all Gauss norms,
division with its explicit monic formula, the monic entire resultant with its Bézout identity and
unit criterion, normalised entire preparation with the distinguished normalisation and coprimality),
as stated there.

### From TauCetiRoadmap.NewtonPolygons

Convention 2 (`‖x‖ = b^(−e(v(x)))`), §§0.6–0.7 (slope data, `IsBelow`, ordered-weight lower
polygons), §2.5 (coefficient bounds imply `H ≤ NP(det(1 − Tu))`), §3.2 (products and the
initial-segment corollary), §3.3 (polynomial roots), §4.1 (the canonical disc factor at a radius),
§4.3 (analytic multiplicity and exact counts) and §5.3 (slopes of entire series), as stated there.

### From TauCetiRoadmap.AdicSpacesPartII

§R0.5, target *completed-tensor-banach-module*: the completed tensor product of Banach modules
over a complete Tate ring, its product seminorm, universal property, functoriality and split
exactness, as stated there.

### From TauCetiRoadmap.AdicSpacesPartIII

§R3.6, target *completely-continuous-map*: the predicate `Huber.IsCompletelyContinuous` for
Banach modules over an affinoid algebra, used only in the comparison of §0.1.

## References

- J.-P. Serre, *Endomorphismes complètement continus des espaces de Banach p-adiques*, Publ. Math.
  IHÉS **12** (1962), 69–85, [full text](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf),
  §§1–7; §1, Remark 2, p. 71; §3, Proposition 4 and corollary, pp. 72–73; §7, Proposition 12,
  pp. 80–81.
- N. De Grande–De Kimpe, *Non-archimedean nuclearity*, Groupe de travail d'analyse ultramétrique
  **9**, no. 3 (1981–1982), exp. J4,
  [full text](https://www.numdam.org/item/GAU_1981-1982__9_3_A5_0.pdf), §§1.1, 2.1–2.3: compactoid
  subsets and compactoid maps over a complete nontrivially valued field.
- R. Coleman, *p-adic Banach spaces and families of modular forms*, Invent. Math. **127** (1997),
  417–479, [doi:10.1007/s002220050127](https://doi.org/10.1007/s002220050127), Appendix A,
  especially A3
  (entire series and spectral transforms) and A4 (spectral theory).
- C. Johansson and J. Newton, *Extended eigenvarieties for overconvergent cohomology*,
  [corrected arXiv v4](https://arxiv.org/pdf/1604.07739v4), §§2.1–2.2. Their Noetherian hypotheses
  are retained when their results are cited.
- W. H. Schikhof, *Banach spaces over nonarchimedean valued fields*,
  [survey](https://topology.nipissingu.ca/tp/reprints/v24/tp24224.pdf), §§2.4, 2.7, 2.13 and
  2.15. The compactoid definition is on p. 564; the comparison of compactoid image with finite-rank
  approximation is on p. 566. The limitations of Hahn–Banach prevent the unrestricted ambient
  projection argument.
- K. S. Kedlaya, *A little p-adic numerical analysis*, MIT 18.787 notes (2007),
  [full text](https://kskedlaya.org/18.787/numerical.pdf), §3, pp. 5–6: valuations of minors,
  invariant factors and Theorem 16 (Newton above Hodge).
