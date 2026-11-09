# Compact operators and nonarchimedean Fredholm theory

Develop Fredholm determinants, resolvents, Riesz projectors and finite-slope
decompositions for nonarchimedean Banach modules. The central construction is the
entire series `H_u(T) = det(1 − Tu)` of an operator whose matrix has uniformly
vanishing output rows. Its zeros and coprime polynomial factors cut out finite
projective spectral summands, including over coefficient rings with nilpotents.
The library should support analytic distributions, overconvergent cohomology and
quaternionic modular forms through the same operator and determinant interfaces. Boundary-of-weight-space slope
calculations motivate the two-sided matrix estimates in §4.4.

The mathematical specification is this README. All targets and checks below are
required. [Suggested.lean](Suggested.lean) fixes representative definitions and
signatures; it is not an exhaustive checklist. Admitted theorem proofs there are
targets, not completed mathematics. Suggested library homes are
`TauCeti/Analysis/Normed/Operator/Nonarchimedean/` for approximation, determinants
and spectral theory, with general matrix and polynomial lemmas extending the
corresponding native APIs.

## Scope and dependencies

| Area | Interface consumed here | Mathematics owned there |
| --- | --- | --- |
| [P-adic functional analysis][PadicFunctionalAnalysis] ([PR #930](https://github.com/TauCetiProject/TauCetiRoadmap/pull/930)) | Banach–Tate rings, scalar gauges, operator norms, `C₀`, matrix representation, potentially orthonormalisable modules, property (Pr), countable-type bases and bounded finite-module lifting | The general functional-analysis library and the constructions of analytic function spaces |
| [Restricted power series][RestrictedPowerSeries] ([PR #919](https://github.com/TauCetiProject/TauCetiRoadmap/pull/919)) | Native restricted/entire series, Gauss norms, substitution, evaluation in operator algebras, Hasse derivatives, entire polynomial division, monic entire resultants and distinguished preparation | All of this generic series algebra; no second Tate algebra or entire-series carrier is introduced here |
| [Newton polygons][NewtonPolygons] ([PR #926](https://github.com/TauCetiProject/TauCetiRoadmap/pull/926)) | Valuation conventions, locally finite slopes, ordered-weight lower polygons, `IsBelow`, coefficient-to-polygon comparisons, product/root dictionaries and polynomial slope factors | Convex geometry, the polygon interpretation of scalar preparation/factorisation, and root counting |
| [AdicSpacesPartII, PR #817](https://github.com/TauCetiProject/TauCetiRoadmap/pull/817), R0.5, *completed-tensor-banach-module* | The completed scalar-extension carrier, its product seminorm, functoriality and split exactness | General completed Banach-module tensor products; the general ring-scalar `c₀` comparison on that carrier is proved in [§1.7](#c0-completed-base-change) here |
| [Locally analytic distributions, PR #854](https://github.com/TauCetiProject/TauCetiRoadmap/pull/854), §4.2 | Consumer comparison with its Noetherian `K`-Banach-algebra scalar extension | Locally convex categories, distribution spaces and finite-slope complexes; its combined tensor/determinant statement specialises the two separate targets of §1.7 |
| [Adic spaces III, Tau Ceti PR #813](https://github.com/TauCetiProject/TauCetiRoadmap/pull/813) | Affinoid lattice models to which the comparison in §0.1 applies | Affinoid rings of definition, the `Huber` comparison wrapper, strictly completely continuous maps, restriction to submodules and cohomological applications |
| Quaternionic modular-form theory and geometric roadmaps | These operator, determinant and spectral interfaces | Hecke actions, their matrix estimates, classicality, weight/spectral spaces and eigenvariety gluing |

This roadmap owns operator approximation and row compactness, principal-minor
Fredholm determinants, operator resolvents, Coleman's spectral transform, Riesz
theory, and the application of scalar slope factorisation to operators. The generic
monic entire resultant belongs to restricted power series; the resultant defining
Coleman's spectral transform belongs here. Sections 2.1–2.2 give the
operator-facing contract of that series supplier.
Production imports use library modules, not another roadmap's `Suggested.lean`.
The shared interfaces with LocallyAnalyticDistributions are:

| Consumer notation | Interface here |
| --- | --- |
| `operatorEntry u i j`, output-column norms | `matrixCoeff u j i`, output-row norms; this is PFA's transpose adapter |
| `IsCompactoid` for row decay over a coefficient algebra | `IsRowCompact` (§0.2); this is distinct from the field-facing `HasCompactoidImage` (§0.5) |
| Finite rank meaning finitely generated range | `IsFiniteRank`, via `isFiniteRank_iff_range_fg` under Noetherianity (§0.1) |
| `fredholmSeries`, `entireEval f a`, `hasseSeries` | `charPowerSeries`, supplier `evalAt a f`, supplier Hasse derivative (§§1.2, 2.1) |
| `polynomialSpectralResultant` | `colemanDBounded` with the prescribed matrix dimension (§3.3) |

AdicSpacesPartIII's `Huber.IsCompletelyContinuous` is compared with §0.1
through the compatibly normalised gauge norms of §0.1 and the Noetherian
finite-rank equivalence. Use the shared
approximation and ideal laws rather than a second proof of them. Its single-scalar
strict approximation condition and affinoid/cohomological applications stay there.
Compatibility aliases must state their scalar ring and preserve these meanings.

<a id="lad-supplier-crosswalk"></a>

**LocallyAnalyticDistributions supplier crosswalk.** The following links identify
production owners independently of historical section numbering. Use these targets
in LAD's supplier-table rows and *Needs* clauses.

| LAD contract | Production owner and target |
| --- | --- |
| §4.2 entire algebra and `entireEval f a` | [RestrictedPowerSeries §7.2][EntireDivision] and [§2.1][SeriesEvaluation]: `IsEntire`, `evalAt a f`, with the stated argument-order adapter |
| §4.3 linear and monic division, reciprocal-tail quotient, uniqueness and roots | [RestrictedPowerSeries §7.2][EntireDivision]: `divByMonic`, its coefficient formula, entire quotient/remainder and uniqueness |
| §4.4 monic entire resultant, Bézout and analytic coprimality | [RestrictedPowerSeries §7.2][EntireDivision]: `entireResultant` and the unit-ideal criterion; the operator-specific Coleman transform stays in [§3.3](#33-colemans-transform-including-entire-functional-input) |
| §4.5 formal Hasse derivatives | [RestrictedPowerSeries §2.3][SeriesHasse]: `semiringHasseDeriv` and its commutative comparison |
| §4.12 generic entire Gauss completeness, coefficient extraction and evaluation continuity | [RestrictedPowerSeries §§1.1][SeriesGauss], [2.1][SeriesEvaluation] and [7.2][EntireDivision]; determinant convergence and operator majorants stay in [§§1.2–1.3](#12-principal-minors-and-coefficients) and [§3.3](#33-colemans-transform-including-entire-functional-input) here |
| §4.2 completed scalar extension of ON modules and determinants | [Pure tensor comparison](#c0-completed-base-change), followed by [coefficientwise determinant base change](#coefficientwise-fredholm-base-change) and transport to retracts |

Forwarding names such as `entireEval` and the entire quotient refer to the
restricted-series construction. They are notation/compatibility adapters,
not independent production definitions or new proofs of generic series algebra.

[OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md), Part A,
owns the generic field approximation-number calculus. Compare its finite-rank
approximability with §0.1 over fields; the ring-relative predicate, nonarchimedean
matrix criteria and Fredholm determinant theory are supplied here. No Hilbert-space
singular-value or Schatten theory is constructed here.

## Conventions and library floor

1. A coefficient ring `R` is a complete ultrametric normed commutative ring with
   `‖1‖ = 1`. Operator-norm arguments over ring scalars additionally use Banach–Tate
   data: a unit `ϖ` with `0 < ‖ϖ‖ < 1` and `‖ϖx‖ = ‖ϖ‖‖x‖`. Banach modules have
   compatible ultrametric norms and contractive scalar multiplication, as in PFA.
   State any closedness, lifting or Noetherian hypothesis locally.
   Multiplicativity of every element's norm is not a standing assumption.
2. Field results use a complete nontrivially normed ultrametric field `K`. Discrete
   valuation, spherical completeness and characteristic zero are not assumed.
   Impose local compactness only for the converse comparison with topological
   compact operators. Use a complete splitting extension when discussing roots.
3. Use native `ContinuousLinearMap`, `C₀(I,R)` with discrete `I`, `PowerSeries`,
   `Polynomial`, `Matrix`, `Module.Finite` and `Module.Projective`. Use Mathlib's
   restricted-series predicates and Gauss norm. Ring-scalar operator norms come
   from PFA, with the comparison to Mathlib's field norm. The topology of operator
   limits is this norm topology; the topology of entire series is convergence in
   every positive-radius Gauss norm.
4. Write `aᵢⱼ = (u(eⱼ))ᵢ`: rows are output coordinates. The matrix of a bounded
   operator has bounded coefficients and null columns. **Row compactness** means
   `rᵢ(u) = supⱼ ‖aᵢⱼ‖ → 0` along the cofinite filter; name this predicate
   `IsRowCompact`. Over fields it agrees with compactoid image of the unit
   ball (§0.5). Over coefficient rings keep the scalar ring explicit; forgetting
   to the underlying valued field need not preserve the property. Arbitrary
   bounded operators do not have null row norms.
   The raw predicate includes a global bound on entries, automatic over Tate
   scalars, so that a real supremum of an unbounded row cannot give a false
   compactness statement.
5. `IsFiniteRank u` means its range is contained in a finitely generated submodule.
   `IsCompletelyContinuous u` means approximation in operator norm by such maps.
   Row compactness implies complete continuity; the converse uses §0.2's finite
   lifting hypothesis. Mathlib's `IsCompactOperator` is a separate topological
   predicate, compared in §0.5.
6. `H_u = Σ cₙTⁿ` has `c₀=1` and `cₙ=(-1)ⁿ` times the sum of the size-`n` principal
   minors. A real supremum, `tsum` or `limUnder` used in a raw definition supplies
   no boundedness or convergence theorem: prove these before using its value.
   Reversal in dimension `n` is `reflect n`, even when a characteristic determinant
   has degree less than `n`. Write `Q* = Q.reverse` only at the specified degree of
   a nonzero polynomial `Q`.
7. Riesz projectors use `p` for the complementary projector and `E=1−p` for the
   finite spectral projector. Over rings, finite projective need not mean free,
   and its rank may vary by connected component. Constant rank is asserted only
   when a specified factor with unit leading coefficient forces it.
8. Layer 4 imports `‖x‖=b^(−e v(x))`, `b>1`, `e>0`, from NewtonPolygons. A cutoff
   `h` corresponds to radius `b^(e h)`. Slopes count nonzero eigenvalues with
   algebraic multiplicity. Their total collection can be infinite, so use locally
   finite multiplicities and finite cutoff lists, not a Lean `Multiset` of all
   slopes. Slopes lie in the divisible hull of the value group, not necessarily
   in the value group itself.

Mathlib supplies `IsCompactOperator` in `Analysis/Normed/Operator/Compact/Basic`,
continuous linear maps, matrix determinants and characteristic polynomials,
degree-bounded polynomial resultants, restricted series, Gauss norms and `C₀`.
Its `ContinuousLinearMap.IsFredholm` in `Analysis/Normed/Operator/Fredholm/Basic`
requires strictness, closed range, finite-dimensional kernel and cokernel,
and a topologically complemented kernel. It is distinct from the Fredholm
determinant; §3.2 supplies all these conditions for `1−au`.

For the ring-scalar operator norm, follow PFA and
[Mathlib PR #42865](https://github.com/leanprover-community/mathlib4/pull/42865),
which generalises the native infimum formula to semiring modules. The associated
[Zulip discussion](https://leanprover.zulipchat.com/#narrow/channel/217875-Is-there-code-for-X.3F/topic/compact.20operators.20and.20Fredholm.20determinant/with/572850121)
explains the Banach–Tate use. The prototype's local formula is definitionally equal
to Mathlib's field norm; production uses the shared `ContinuousLinearMap.opNorm`.
Build missing results in Tau Ceti in the native API shape, adopting Mathlib's
versions when available without waiting for an open proposal. Generic finite
matrix, polynomial and operator results are part of that same library work.

## Layer 0: approximation and compactness

### 0.1 Finite image and complete continuity

**Finite image and approximation.** Define the predicates in Convention 5 and
prove closure under addition, scalar multiplication and composition on either
side by bounded maps; complete continuity is closed in operator norm. Prove
`IsFiniteRank.isCompletelyContinuous`. Over a Noetherian ring prove
`isFiniteRank_iff_range_fg`; without it retain the direction from finitely
generated range to finite image, rather than identifying the two definitions.

**The identity criterion.** On a Banach module, the identity is completely
continuous exactly when the module is finitely generated. For the forward
direction choose a finite-image approximant within norm `<1` and invert it by
the Neumann series. No Noetherian hypothesis is needed. Hence the identity on
`c₀(ℕ,R)` is not completely continuous. A completely continuous `u` with
`(1−u)^n=0` makes the module finite, using
`1=u Σ_{k<n}(1−u)^k`. Include the zero module and exponent-zero cases.

**Banach modules normed by a lattice.** For a complete nontrivially valued `K`,
let `A` be a nonzero Hausdorff complete normable topological `K`-algebra with
bounded open `K°`-subalgebra `A₀`, and `M` a Hausdorff complete topological module with bounded
open `A₀`-lattice `M₀`. Use the gauges
`‖a‖=inf{|c| : c∈K×, a∈cA₀}` and
`‖m‖=inf{|c| : c∈K×, m∈cM₀}`. Prove they are compatible complete ultrametric
norms inducing the given topologies, with exact scaling by `K×`. Hausdorffness
is needed for definiteness; discreteness of the value group is not required.

**Normalised discrete comparison.** Write `α_A`, `α_M` for these scalar
lattice norms. Choose a scalar `π∈K×` with `q=|π|<1`, use its image as the
pseudouniformiser, and take PFA's parameter `a=q⁻¹` for the algebra and every
module. Thus `g_M(x)=inf{q^n : n∈ℤ, π^(−n)x∈M₀}`, and likewise for `A₀`.
Prove the discrete-rounding bounds

`α_M(x) ≤ g_M(x) ≤ q⁻¹ α_M(x)` and `α_A(x) ≤ g_A(x) ≤ q⁻¹ α_A(x)`.

For each scalar witness `x∈cM₀`, choose `n` with
`|c|≤q^n<q⁻¹|c|`; then `cπ^(−n)∈K°` gives `x∈π^nM₀`.
The reverse bound uses that powers of `π` are scalar witnesses. Pass to
infima, including `x=0`, after proving the defining sets are nonempty and
bounded below. This gives uniform multiplicative constants for the source,
target and induced operator norms. Even this rounded gauge need not scale
exactly by every element of `K`; the scalar lattice norm does.

For the same scalar `π` and an arbitrary parameter `b>1`, use PFA's separate
power comparison `g_b=g_(q⁻¹)^θ`, where `θ=log b/log(q⁻¹)>0`, and its
consequence for the topology. An arbitrary algebra-valued pseudouniformiser
supplies the compatible topology under PFA's hypotheses, not these scalar
bounds. Equality of topologies alone is never a multiplicative-constant
comparison. Use the normalised choice above in the following norm and
affinoid complete-continuity comparisons.

Identify complete continuity with the following lattice condition: for every
open target lattice `V`, there are a continuous finite-image `g` and a finitely
generated `A₀`-submodule `L` of the target such that
`g(M) ⊆ A·L` and `(u−g)(M₀) ⊆ V`. Changes of equivalent gauges and bounded open
lattices preserve it. Over a Noetherian `A`, compare this with the
`Huber.IsCompletelyContinuous` predicate using finitely generated range.
The affinoid carrier and the stronger uniform-scalar requirement of strict
complete continuity remain in AdicSpacesPartIII. The comparison here always
uses an actual continuous approximating map.

**Checks.** Zero maps and maps into finite modules are completely continuous.
`diag(ϖ^i)` on `c₀(ℕ,R)` is completely continuous but not finite image. Test the
lattice comparison on a scalar line, on zero, and after replacing `M₀` by `cM₀`.
For `K=ℚ_p`, `M₀=ℤ_p`, the unnormalised choice `(π,a)=(p²,p)` gives
`α(p^(2m))=p^(−2m)` but `g(p^(2m))=p^(−m)` for `m≥0`; the ratio `p^m`
is unbounded. With the normalised choice `(π,a)=(p²,p²)`,
`g(p^k)=p^(−2⌊k/2⌋)` for every integer `k`, hence
`α≤g≤p²α` and `g(p^(2m))=α(p^(2m))`. At `p`, however, `g(p)=1`
while `α(p)=p⁻¹`: bounded equivalence does not assert equality.

### 0.2 Row compactness on model spaces

**Truncations.** Import the bounded-matrix representation and coordinate
projections `π_S` from PFA. Establish boundedness of `rᵢ(u)` and
`‖u‖=supᵢ rᵢ(u)`. Prove row compactness equivalent to
`‖u−π_S u‖→0` as finite sets `S` increase. The truncations have finite image,
so `IsRowCompact.isCompletelyContinuous` follows without Noetherianity.
The input-side truncations `uπ_S` need not converge: a rank-one operator can
have a non-null row of matrix coefficients.

**Ideal and transport properties.** Row-compact maps between two model spaces
form a closed operator ideal. Prove stability under finite sums, bounded
composition, reindexing, bounded changes of basis, finite blocks and restriction
by bounded split inclusions/projections. A diagonal is row compact exactly when
its entries tend to zero cofinitely. A bound `‖aᵢⱼ‖≤rᵢ` with `rᵢ→0` is sufficient;
include geometric bounds and weighted coefficient models.

**Comparison with complete continuity.** If every finite submodule of the target
is closed and its chosen finite generators admit bounded lifts of bounded
vectors, finite-image operators have row decay. Deduce the equivalence with
complete continuity. Use PFA's finite-module/open-mapping theorem to discharge
these hypotheses for the intended Noetherian Banach–Tate setting. Keep the
row-decay theory available without that hypothesis; do not insert an unproved
Noetherian-free equivalence.

**Checks.** Infinite identity has all row norms one; the zero and finite-index
cases work. The map `x↦(Σ_j x_j)e₀` is row compact but `uπ_S` does not approach
`u` in norm on an infinite index set. This distinguishes input and output tails.

### 0.3 Kernels and improvement of radius

Import the series-to-`c₀` comparisons and analytic substitution. A bounded
two-variable coefficient matrix with null columns presents the operator with
kernel `Σ aᵢⱼx^iy^j`; establish compatibility with composition by middle-index
summation and with diagonal rescaling. For bounded `g,h` with `‖h‖≤1`, the
operator `f↦g·f(h)` has entries `coeff i (g h^j)` and kernel
`g(x)/(1−h(x)y)` as a series in `y`.

If a bounded map factors through series restricted at radius `c>1` before
inclusion into the unit-radius space, prove the row bound `C c^(−i)` and hence
compactness. Give the finite-variable total-degree version and the finite-chart
version. The radius inclusions themselves are completely continuous by finite
polynomial truncation; use weighted models when the radius is outside the value
group, without inventing a scalar of that norm.

For scalar locally analytic stages, apply this criterion to the PFA transition
and evaluation maps. In its normalised bases the relevant diagonal entries are
`⌊n/p^h⌋! / ⌊n/p^(h+1)⌋!` and `⌊n/p^h⌋!`, respectively. They tend to zero.
Extend to finite projective coefficient modules by retracts. Arbitrary
infinite-dimensional Banach coefficient modules are excluded: the constant
function summand would retain their identity operator.

**Checks.** Strict radius improvement is compact; equal-radius identity is not
on infinitely many monomials. Substitution `h=0` is finite image, while `g=1,
h=x` is identity. A finite set of zero-dimensional charts gives a finite module.

### 0.4 Potentially orthonormalisable and (Pr) modules

Transport row compactness along continuous linear equivalences to `c₀`, and
prove independence of the presentation. For a retract `M →ⁱ c₀(I,R) →ʳ M`
with `ri=1`, define compactness of `u` through `iur`. For another retract, write
the extensions as bounded left and right composites through one another to
prove independence. No finite-dimensional complement is presumed.

Transport the ideal, closedness and approximation results. Every operator on a
finite projective Banach module is compact in its finite-free retract model.
The finiteness germ of §0.1, together with PFA's finite-(Pr) criterion, yields a
finite projective module. Also prove directly that a row-compact idempotent on
`c₀` has finite projective range by comparison with a sufficiently large finite
coordinate projection. This supplies the ring-level Riesz finiteness argument.

### 0.5 Compactoid images and topological compact operators

Over `K`, use the following Banach-space set predicate for the literature
comparison: `S` is compactoid if for every zero neighbourhood `U` there is a
finite set `F` with `S ⊆ U + span_{K°}(F)`; boundedness follows. Name this
`IsCompactoidSet K S`. Equivalently, for every `ε>0` there are finitely many
vectors `v_i` such that each `x∈S` lies within `ε` of a sum `Σ a_i v_i` with
all `‖a_i‖≤1`. Include the empty set, subsets, closure, finite sums, scalar
multiples and bounded linear images in its basic API. This is the
literature definition of De Grande–De Kimpe §§1.1, 2.1. For a continuous
`K`-linear map, let `HasCompactoidImage u` mean that `u` maps the closed unit
ball to a compactoid set. This is also called a compact operator by Schikhof
§2.15; it is distinct from Mathlib's topological compactness predicate.

**Model-space comparison.** For `S⊆c₀(I,K)`, prove compactoidness equivalent
to boundedness together with uniform coordinate decay:
`∀ ε>0, ∃ finite T, ∀ x∈S, ∀ i∉T, ‖x_i‖<ε`.
For one direction truncate and contain the bounded finite coordinates in a
finite `K°`-span after scalar rescaling. For the other use the small tails of
the finitely many approximating vectors. Applying this to the image of the
unit ball gives, for maps between model spaces,

`IsRowCompact u ↔ HasCompactoidImage u ↔ IsCompletelyContinuous u`.

Neither discreteness nor spherical completeness is needed. Serre §3,
Proposition 4 and its corollary give the row criterion for complete continuity.
Transport it to potentially orthonormalisable spaces and (Pr) presentations.
For arbitrary Banach `K`-spaces, prove the second equivalence independently
of a chosen model.

For the approximation direction first factor the image through the closed
countable-type subspace generated by countably many finite approximation sets;
then use almost orthogonal coordinates in that subspace. Do not project arbitrary
finite-dimensional subspaces of the ambient Banach space: that would require
extra Hahn–Banach hypotheses over nonspherically complete fields.

Deduce `IsCompactOperator u → IsCompletelyContinuous u` for every such `K`.
Over locally compact `K` the converse holds. Over `ℂ_p`, identity on a scalar
line is finite rank and completely continuous but not topologically compact.
The set API here is the Banach-space theory required for this comparison.
The locally convex extension is outside scope. The `IsCompactoid` spelling in
LocallyAnalyticDistributions refers to the ring-relative row-decay interface
in the comparison table; it does not supply this compactoid-set predicate.

**Scalar-ring check.** Identity on `A=K⟨T⟩`, viewed as the rank-one Banach
`A`-module, is row compact and completely continuous over `A`. As a `K`-linear
map it is neither: its unit ball contains all monomials `T^n`, which have no
uniform coefficient tail. Thus relative finite rank or row compactness over
`A` must not be labelled compactoidness over `K`. A relative definition using
`A°`-spans is another scalar-dependent notion and does not remove this distinction.

**Dependencies and sources.** Layer 0 uses PFA's norm and module theory; §0.3
also uses restricted series. Serre §§1–2 motivates the field construction;
Johansson–Newton §2.1 supplies the Noetherian Banach–Tate comparison. The general
row-decay and retract statements are separate proof obligations. De Grande–De
Kimpe §§1–2 and Schikhof §§2.13, 2.15 provide the compactoid terminology and
field comparison. Schikhof §2.7 explains the limitation on ambient projections
used in §0.5; Serre §1, Remark 2 gives the finite-dimensional splitting inside
`c₀` without that obstruction.

## Layer 1: Fredholm determinants

### 1.1 Finite matrices

For `A : Matrix (Fin n) (Fin n) R`, use `det(1−TA)` and prove it equals
`reflect n A.charpoly`. Expose its principal-minor expansion, constant
coefficient, functoriality, block-triangular product formula, transpose and
`AB/BA` identities, including rectangular matrices. Prove the determinant bound
by products of row bounds over any ultrametric normed ring. Give the two-sided
bound used in §4.4. Use native polynomial resultants for finite-dimensional
spectral mapping and keep all degree bounds explicit.

**Checks.** Empty matrices give one. A nonzero nilpotent Jordan block gives one.
For `diag(a,0)`, the determinant is `1−aT` in dimension two; reversing at its
actual degree would lose the zero eigenvalue needed by a later transform.

### 1.2 Principal minors and coefficients

Define `minor u S = det(aᵢⱼ)_{i,j∈S}` and
`charCoeff u n = (−1)^n Σ'_{S : Finset I, |S|=n} minor u S`.
For row-compact `u`, prove summability, the empty-minor formula and the finite
matrix comparison. The coefficients are independent of any enumeration of `I`.

Bound each minor by `∏_{i∈S}rᵢ(u)`, and the coefficient by the supremum of such
products. Provide a decreasing rearrangement of the nonzero null row bounds,
padding by zeros when there are finitely many. Handle empty/finite index sets
without assuming an infinite list of positive row norms.

**Uniform tails under a common majorant.** If every member of a family has
`rᵢ(u_α)≤rᵢ`, where `rᵢ≥0` and `rᵢ→0`, fix `ρ>0`, `0≤q<1`, `B≥1` and finite
`T` with `ρrᵢ≤q` off `T` and `ρrᵢ≤B` everywhere. Prove

`‖charCoeff u_α n‖ ρ^n ≤ B^|T| q^(n−|T|)`.

Here the exponent is natural truncated subtraction, including `q=0` and `n=0`.
Expose `norm_charCoeff_mul_pow_le_of_rowNorm_le` for distribution families.

### 1.3 Entirety and continuity

Define `charPowerSeries u` by these coefficients. Prove it is entire, using
§1.2 at every positive radius, and that finite output compressions converge to
it in every Gauss norm. Prove continuity of each coefficient in the operator
norm, with explicit bounds on bounded sets. Upgrade coefficient convergence of
a family to Gauss convergence when a common null row majorant is supplied.
State and prove the stronger continuity needed for a norm-convergent sequence
of row-compact operators, by controlling its row tails; mere coefficient
convergence of unrelated entire series is insufficient.

### 1.4 Cyclicity and invariance

Prove `H_AB=H_BA` for composable bounded maps when one factor is row compact,
then invariance under bounded conjugation, reindexing and extension by zero.
Scalar multiplication gives `H_(a u)(T)=H_u(aT)`.

Principal minors are unchanged by matrix transposition. If the original and
transposed matrices both define bounded operators on the stated `c₀` spaces
and one has row decay, prove that the other also has row decay and that their
determinants agree. Separately state equality of matrix minor series whenever
those sums converge, without asserting either matrix is an operator.

For diagonal intertwining `A D = D B` with regular nonzero diagonal entries,
prove equality of corresponding finite principal minors by determinant
cancellation. Deduce equality of determinant series when both are defined.
The diagonal map need not have bounded inverse; this theorem does not claim
an isomorphism of Banach spaces or equality of their full spectra.

### 1.5 Determinants on (Pr) modules

Define `H_u` by a retract extension `iur`. Prove independence using §1.4's
cyclic determinant identity with the transition maps between two retracts.
Recover the finite projective determinant and its compatibility with
localisation and bounded coefficient maps. It is a polynomial for a finite
projective module, but its degree need not equal its rank. A global matrix
formula requires a free module or a specified free retract; local matrices
suffice for a projective module.

**Check.** For `R=K×K`, `e=(1,0)`, identity on `eR` has determinant `1−eT`.
Its leading coefficient is not a unit and its rank is not globally constant.
The API must retain this example.

### 1.6 Partitions, blocks and finite factors

Prove the finite partition formula, block-diagonal and block-triangular
multiplicativity, first on model spaces and then on split Banach modules.
If `u` commutes with a bounded idempotent `e`, show
`H_u=H_(ue) H_(u(1−e))`, with the factors interpreted on their summands.
For a finite projective invariant summand with invariant complement, obtain
its polynomial determinant factor and the complementary Fredholm series.

This is a statement about a specified decomposition. It does not assert
`H_u=H_u^2`, nor multiplicativity of `H` on arbitrary products of operators.

### 1.7 Coefficients and base change

Let `φ:R→S` be a bounded unital homomorphism of the complete ultrametric
norm-one Banach–Tate rings of Convention 1, preserving the Banach–Tate data
used for module bounds. Fix `L≥1` with `‖φ(r)‖≤L‖r‖`.
No Noetherian or common-ground-field hypothesis is imposed.

<a id="coefficientwise-fredholm-base-change"></a>

**Coefficientwise Fredholm base change (`charPowerSeries_map`).** First extend
a bounded matrix on `c₀(I,R)` coefficientwise to `c₀(I,S)`, using PFA's
matrix representation. Prove `r_i(u_S)≤L r_i(u)`, row compactness and
`H_(u_S)=PowerSeries.map φ H_u` by the principal-minor coefficient sums.
This statement precedes, and does not use, abstract tensor determinants.

<a id="c0-completed-base-change"></a>

**Pure tensor comparison (`c0_completedBaseChange`).** On AdicSpacesPartII
R0.5's *completed-tensor-banach-module* carrier, construct

`Θ_φ : c₀(I,R) ⊗̂_R S ≃L[S] c₀(I,S)`.

Its defining equation is `Θ_φ(x⊗s)_i=φ(x_i)s`. This is a required general
ring-scalar target here; LAD §4.2's current Noetherian `K`-Banach-algebra
comparison is its specialisation, not a prerequisite with broader scope.
Reuse Part II's tensor topology, product seminorm, Hausdorff completion and
scalar-extension action; construct no second completed tensor product.
For the product seminorm
`‖z‖_π=inf{max_j ‖x_j‖‖s_j‖ : z=Σ_j x_j⊗s_j}` (empty maximum zero), prove

`‖Θ_φ(z)‖≤L‖z‖_π`, and `‖Θ_φ⁻¹(y)‖_π≤‖y‖`.

The balanced coefficient map gives the first estimate on every finite tensor
presentation. On finite-support families define the inverse by
`y↦Σ_i e_i⊗y_i`; its bound is one since `‖e_i‖=1`.
Extend by density and completeness. Check the composites on finite-support
families and on pure tensors, approximating `x∈c₀` by its finite-coordinate
truncations. This proves the equivalence and the estimates, including after
the separated quotient. If `φ` is contractive, the two bounds give an
isometry; a merely bounded map gives a bounded equivalence. The commutor
identifies the opposite tensor orientation `S⊗̂_R c₀(I,R)` with this one.
This pure comparison uses neither determinants nor compactness.

**Abstract module transport.** For a bounded operator, identify its tensor
extension under `Θ_φ` with its coefficientwise extension. For a specified
(Pr) retract, extend its inclusion and retraction using Part II's functoriality
and split exactness. Transport the determinant identity just proved, and
prove independence of the chosen retract by §1.5. Do not assume flatness to
preserve arbitrary exact sequences. Prove identity and composition laws,
compatibility with equivalent coefficient/module norms and with polynomial
factors and spectral projectors. When changing gauge parameters, use PFA's
explicit topology/power comparisons; multiplicative-constant norm bounds
require bounded-equivalent normalisations as in §0.1.

**Tensor checks.** Include empty and infinite index sets and identity base
change. For a prime `p`, take `R=ℚ_p×𝔽_p((t))`,
`S=𝔽_p((t))`, `φ` the second projection, `‖t‖=p⁻¹`, the maximum norm on
`R`, and `ϖ_R=(p,t)`, `ϖ_S=t`. These rings have no common ground field
through unital maps. Test the actual completed tensor for `I=ℕ`, with
`Θ_φ((x_i,y_i)_i⊗s)=(y_i s)_i` and inverse given by the limit of
`Σ_{i∈F}e_i⊗s_i`. For the finite projective retract `eRⁿ`, `e=(0,1)`,
identify its tensor extension with `Sⁿ`; the complementary retract
`(1−e)Rⁿ` extends to zero. Include `n=0`, identity base change and the
commuting idempotent diagrams, not just a mapped finite matrix.

**Checks.** For `u=diag(p^i)` over `ℚ_p`,

`H_u=∏_{i≥0}(1−p^iT)`,
`c_n=(-1)^n p^(n(n−1)/2) / ∏_{j=1}^n(1−p^j)`.

Thus `v_p(c_n)=n(n−1)/2`, but the coefficient is not just its numerator.
Specialising `diag(p^i X^i)` at `X=0` gives determinant `1−T`.

**Dependencies and sources.** Finite matrix algebra precedes Layer 0; the
infinite sums use row decay and the restricted-series entire interface.
Serre §§3–5 motivates the determinant estimates and cyclicity.
Johansson–Newton §2.1 provides the Noetherian (Pr) comparison. Prove the
broader row-decay version directly instead of attributing it to that statement.

## Layer 2: series interfaces and the resolvent

### 2.1 Imported entire algebra and Hasse calculus

Use RestrictedPowerSeries §§2.1, 2.3 and 7.2 for `IsEntire`, evaluation
`evalAt a F=Σ a_n a^n`, completeness for all Gauss norms, and evaluation in
the complete, generally noncommutative algebra of bounded endomorphisms.
For any semiring, require
`coeff n (semiringHasseDeriv k F)=(n+k choose k) • coeff (n+k) F`,
with identity, addition, left scalar action, ordered Leibniz rule and polynomial
comparison. Over commutative coefficients this agrees with `hasseDeriv`.
No factorial is inverted. Translation and the Taylor identity are imported.

**Checks.** In characteristic two, `Δ²(T²)=1` while the second ordinary
derivative is zero. `Σ p^(n²)T^n` is entire over `ℚ_p`; the usual p-adic
exponential is not entire.

### 2.2 Imported division and monic entire resultants

Use the unique entire quotient and polynomial remainder for a divisor with
unit leading coefficient. For monic `Q` of degree `d`, require the explicit
formula `coeff n (divByMonic Q F)=Σ_k a_(n+d+k)b_k`, where
`Σ b_k T^k=(Q.reverse)⁻¹`. Prove its convergence and identification with the
unique quotient. This requires no norm-multiplicativity of arbitrary units.

The generic `entireResultant Q F` is the determinant of multiplication by the
remainder of `F` on the finite free algebra `R[T]/(Q)`. Require its polynomial
comparison, invariance modulo `Q`, multiplicativity in `F`, bounded base change,
`Res(T−a,F)=F(a)` and a Bézout identity
`C(Res(Q,F))=QG+HF`, with `G` entire and `deg H<deg Q`.
Its being a unit is equivalent to coprimality of `Q,F` in the entire ring.
Keep the degree-zero case: `Res(1,F)=1`, even for `F=0`.

These generic targets and their public interfaces are supplied by
[RestrictedPowerSeries §7.2][EntireDivision].
Here they are prerequisites for spectral transforms and projectors.

**Checks.** Division of `T³` by `T²+aT+b` has quotient `T−a` and remainder
`(a²−b)T+ab`. For positive-degree monic `Q`, `Res(Q,0)=Res(Q,Q)=0`.
`Res(T²,a+bT)=a²`, including over nonreduced rings.

### 2.3 Good zeros

For an entire `F`, define a good zero of order `h` at `a` by
`Δ^jF(a)=0` for `j<h` and `Δ^hF(a)` a unit. Allow `h=0`, meaning `F(a)`
is a unit. Prove the product rule for orders and the factorisation
`F=(T−a)^h G` with `G(a)` a unit, using the supplier division and Taylor
identities. For normalised `F(0)=1`, a root `a` is a unit, with inverse
`−Σ_n a_(n+1)a^n`. This conclusion needs the constant-coefficient hypothesis:
`T` has the nonunit root zero.

For positive `h` rewrite the factor as `(1−a⁻¹T)^h`, absorbing the unit
into the other normalised entire factor. Over a field every zero of a nonzero
entire series has finite order; use injective Taylor translation, not a
Weierstrass product theorem. Products, bounded coefficient maps preserving the
unit derivative, and finite polynomial specialisations must agree.

### 2.4 Resolvent and determinant at one

For row-compact `u`, put `V_m=Σ_{k≤m} c_k u^(m−k)` and `V(T)=Σ V_m T^m`.
Prove `V` is entire in operator norm and
`(1−Tu)V(T)=V(T)(1−Tu)=H_u(T)·1`. Derive operator-norm bounds sufficient
for evaluation and Hasse differentiation at any scalar, and show the resulting
operators lie in the operator-norm closure of `R[u]`.

Define `fredholmDet u=H_u(1)`. For compact `u,v`, prove
`fredholmDet(u+v−uv)=fredholmDet(u) fredholmDet(v)`, corresponding to
`(1−u)(1−v)`; no commutativity between `u,v` is needed. Include finite matrix
comparison and bounded base change.

**Check.** For identity on a line, `H=1−T` and `V=1`. The resolvent is not
the formal Neumann series, which need not converge at the scalar in question.

### 2.5 Invertibility and nonzero spectrum

Prove `1−au` invertible in the bounded endomorphism algebra if and only if
`H_u(a)` is a unit. In the forward direction use determinant multiplicativity
and the fact that its inverse differs from identity by a compact operator;
in the reverse direction the evaluated resolvent supplies the inverse.

Over `K`, for `λ≠0`, identify `λ` in Mathlib's operator spectrum with
`H_u(λ⁻¹)=0`. A good zero supplies a nonzero eigenvector and the full
generalised eigenspace in Layer 3. Do not impose a claim about zero spectrum
from the Fredholm determinant alone.

**Dependencies and sources.** Generic series constructions are imports, not
additional implementations. The operator arguments use Layer 1 and PFA's
complete endomorphism algebra. Serre §§4–7 and Coleman Appendix A3–A4 are the
classical references; ring statements retain all displayed unit hypotheses.

## Layer 3: projectors and spectral transforms

### 3.1 The Riesz projector at a good zero

Let `H_u` have good zero `a` of order `h`. For `h>0`, write
`c=Δ^hH_u(a)`, `C=1−au`, `b=c⁻¹Δ^hV(a)`, and construct
`p=(Cb)^h`, `E=1−p`, `w=bp`. Prove
`p²=p`, `Cw=wC=p`, `pw=wp=w`, and `C^hE=0`; all these operators commute
with `u`. The identity `C^h(Cb−1)=0` from the differentiated resolvent
explains the formula and must be established. For `h=0` set `p=1`, `E=0`
and use the inverse from §2.5.

Prove that `range E=ker C^h`, that `range p` is its closed stable complement,
and that `C` is invertible there. Both projectors and the complementary inverse
lie in the operator-norm closure of `R[u]`; expose `IsRieszProjection` and
`exists_rieszProjection`. Prove uniqueness of the splitting with these
nilpotence and invertibility properties.

Show `E` is compact and its range finite projective, of constant rank `h`.
Its determinant is `(1−a⁻¹T)^h` when `h>0`, with the complementary factor
obtained by division. Prove rank at every prime algebraically; checking only
field-valued points must not erase nilpotent coefficient information.

**Checks.** For `u=1+N` on a two-dimensional space, `N²=0`, `N≠0`, the root
`a=1` has order two, `c=1`, `p=0` and `E=1`. Include the matrix
`[[1,ε],[0,1]]` over `K[ε]/(ε²)`, retaining its coefficients rather than
passing to field-valued points. At order zero (in particular `a=0` since
`H_u(0)=1`), the spectral projector is zero and its range has rank zero.
The representative good-zero/projector signature includes this case.

### 3.2 Field eigenspaces

Let `K` be complete, nontrivially normed and ultrametric, and let `u` be row
compact on `c₀(I,K)` or transported to a potentially orthonormalisable space.
If `a` is a zero of `H_u` of order `h>0`, then `a≠0` and, with `C=1−au`,
prove the topological decomposition

`M = N ⊕ F`, `N=ker C^h`, `F=range C^h`, `dim_K N=h`.

Both summands are closed and `u`-stable; `C` is nilpotent on `N` and
invertible on `F`. The finite factor is `(1−a⁻¹T)^h`, and the complementary
factor does not vanish at `a`. Thus `a⁻¹` is an eigenvalue, its generalised
eigenspace stabilises at exponent `h`, and its algebraic multiplicity is `h`.

This is [Serre, §7, Proposition 12, pp. 80–81](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf#page=13),
already without discrete valuation for `E=c(I)`. Its finite-dimensional
splitting input is §1, Remark 2, p. 71, which explicitly allows nondiscrete
valuations. The discreteness assumption in §1, Proposition 1 instead makes
every Banach space potentially orthonormalisable; it is not a hypothesis of
Proposition 12. An alternative reference is Johansson–Newton Theorem 2.2.2
with `R=K` and `Q=(1−a⁻¹T)^h`: a field is Noetherian, and
`Q*=(T−a⁻¹)^h`, with no discrete-valuation requirement.

Recover uniqueness, functoriality and bounded extension of scalars.
Use this splitting and §2.5 to prove that every `1−au` is Fredholm in the
native `ContinuousLinearMap.IsFredholm` sense. Prove each native condition:
strictness (the quotient by the kernel is homeomorphic to the image), closed
range, finite-dimensional kernel and cokernel, and a topologically complemented
kernel. Split the kernel inside the finite block and combine that finite-dimensional
complement with the already bounded Riesz complement; no projection of an
arbitrary finite-dimensional subspace of the ambient Banach space is needed.
The finite block has equal kernel and cokernel dimensions and the complement
is invertible, so the index is zero. Use the native Fredholm and index API. Each
nonzero eigenvalue is isolated and only finitely many, with multiplicities,
have norm bounded below by a fixed positive number in a complete splitting
field. Zero may accumulate. Include finite dimension and nilpotent cases,
and a Jordan block over `ℂ_p` as a nondiscrete-value-group check.

### 3.3 Coleman's transform, including entire functional input

**Prescribed finite rank.** For `P(0)=1`, `deg P≤n`, `deg B≤m`, define

`D_(n,m)(B,P)(T)=Res_X(reflect n P(X), 1−T B(X))`

using Mathlib's resultant with degree bounds `n,m`. Expose
`colemanDBounded`. Prove independence of `m` once it bounds `deg B`, and the
padding identity `D_(n+1,m)=(1−B(0)T) D_(n,m)` when `deg P≤n`.
The minimal-rank `colemanD` agrees with this construction, but finite matrices
must use their dimension, including zero eigenvalues. Prove addition of ranks
and multiplication in `P`, bounded coefficient-map compatibility, and finite
matrix spectral mapping by universal polynomial identities.
The comparison API includes `colemanDBounded_of_natDegree_le`,
`colemanDBounded_succ`, `colemanDBounded_add_of_coeff_zero` and
`colemanD_eq_colemanDBounded`.

**Majorants.** For an entire normalised `F=Σ a_jT^j`, construct positive
antitone `ρ_i→0` with `‖a_j‖≤∏_{i<j}ρ_i` (`exists_newtonMajorant`). For
entire `B=Σ b_mT^m` put
`β_B(r)=sup_{m≥1} ‖b_m‖ r^m` (`colemanMajorant`). Show it is finite for
`r>0`, monotone in `r`, and tends to zero as `r→0`. Prove the uniform bound

`‖coeff k D_(N,M)(trunc_(M+1) B, trunc_(N+1) F)‖ ≤ ∏_{i<k} β_B(ρ_i)`

when `B(0)=0`. The proof uses universal symmetric-polynomial estimates over
the coefficient ring, not evaluation only at its field-valued points.
Expose the sequential decay as `tendsto_colemanMajorant`.

**Convergence and topology.** First prove the coefficients of those finite
transforms are Cauchy as `(N,M)→∞` independently. Supply an explicit continuity
estimate using coefficient tails of `F` and `B`; the common majorant alone is
not a Cauchy argument. Then use that majorant to prove convergence in every
Gauss norm. Define `colemanDEntire B F` by this limit and prove entirety,
constant coefficient one, independence of truncation choices, multiplicativity
in `F`, bounded base change, and agreement with the polynomial-input
`colemanDSeries` when `B(0)=0`. Expose
`norm_coeff_colemanDBounded_le`, `tendsto_gaussNorm_colemanDBounded`,
`colemanDEntire_isEntire`, `colemanDEntire_coe` and `colemanDEntire_mul`.

**Operator evaluation and spectral mapping.** Import convergence of
`Σ b_m u^m` in operator norm from the supplier's noncommutative evaluation
theory, with the operator specialisation
`exists_tendsto_opNorm_sum_pow`. If `u` is compact and `B(0)=0`, its value
`B(u)` is compact by the closed ideal property. Prove
`H_(B(u))=colemanDEntire B H_u`, first for finite matrices and then by the
proved norm/Gauss limits (`charPowerSeries_eq_colemanDEntire`).
The compactness interface is `IsRowCompact.of_tendsto_opNorm_sum_pow`.

**Checks.** `β_T(r)=r`, `β_0(r)=0`, `β_(T²)(r)=r²`.
`D(T,F)=F`, `D(0,F)=D(B,1)=1` for zero-constant `B`, and the identity case
retains `F=1−εT²` with `ε²=0`. For `u²=0`, `B(u)=b₀+b₁u`.
Operator evaluation sends `0` to zero and `T` to `u`.
On infinite `c₀`, `B=1` evaluates to noncompact identity. With `P=1` and
`B=c≠0`, rank padding gives `(1−cT)^N`, whose linear coefficients are not
Cauchy over `ℚ_p`. Thus zero constant term is essential in the infinite
transform. Finally, `T^N→0` coefficientwise but has unit Gauss norm one.

### 3.4 Coprime polynomial factors and Riesz–Coleman decomposition

Let `H_u=QS`, where `Q(0)=S(0)=1`, `Q` is a polynomial with unit leading
coefficient, `S` is entire, and `Q,S` are coprime in the entire-series ring.
Construct the unique closed stable splitting

`M = ker Q*(u) ⊕ M_S`.

The first summand is finite projective of constant rank `deg Q`, `u` is
invertible on it, its determinant is `Q`, and the complementary determinant
is `S`. The operator `Q*(u)` is zero on the first summand and invertible on
the second. Projectors and complementary inverse lie in the operator-norm
closure of `R[u]`. Expose `IsRieszColemanProjection` and
`exists_rieszColemanProjection`, including retract transport and bounded base
change. For `Q=1`, the finite summand is zero.

Use §3.3 with `B(X)=1−lc(Q)⁻¹Q*(X)`, whose constant coefficient is zero,
and the root projector at one; prove the refinements from nilpotence to
`Q*(u)=0`, determinant equality and rank. No scalar division by a nonunit or
global basis of a projective summand is permitted.

Also prove the distinct invertibility criterion
`IsCoprime(Q,H_u) ↔ IsUnit(Q*(u))` for `Q(0)=1` and unit leading coefficient.
For the monic-polynomial formulation in LocallyAnalyticDistributions §4.14,
require the polynomial's constant coefficient to be a unit and rescale by it.
Coprimality of the two factors `Q,S` instead gives invertibility only on the
complementary summand, not on all of `M`.

### 3.5 Commuting operators

Every bounded operator commuting with `u` preserves all the preceding
summands, since it commutes with the projectors in the closure of `R[u]`.
Over a complete splitting field, a nonzero finite spectral summand carries
a common eigenvector for a commuting family whose generated algebra splits
there. Give the resulting eigensystem and scalar-extension compatibility.
The actual Hecke algebra and its geometric parameters remain downstream.

**Dependencies and sources.** The resolvent gives the good-zero projector;
the finite transform and its analytic extension give the polynomial-factor
projector. Coleman Appendix A3–A4 and Johansson–Newton Theorem 2.2.2 motivate
these interfaces. The latter is stated for Noetherian (Pr) modules. This
roadmap also requires the row-compact model-space proof over general
Banach–Tate rings, followed by retract transport: that extension must be
proved, not imported by dropping a source hypothesis.

## Layer 4: slopes and matrix estimates

### 4.1 Reading the Fredholm polygon

Apply the imported Newton polygon to `H_u`. Its finite slopes are locally
finite, bounded below, and tend to positive infinity if there are infinitely
many. Define the multiplicity at a slope and finite lists below any real
cutoff. Scaling by a nonzero scalar shifts them by its valuation; block sums
add multiplicities. Nilpotent parts and zero eigenvalues contribute no finite
slopes. Do not rebuild polygon products or supporting-line geometry here.

### 4.2 Slopes and eigenvalues

In a complete algebraically closed extension, the multiplicity of slope `s`
equals the sum of algebraic multiplicities of nonzero eigenvalues with
valuation `s`: a zero `a` gives `λ=a⁻¹`. State this through finite cutoff
counts as well as individual multiplicities. Include eigenvector existence
at every finite slope and independence of the complete splitting extension.
Over `ℚ_p` slopes can be rational and nonintegral; `1−pT²` has two slopes
`1/2`, with eigenvalues requiring a quadratic extension in general.

### 4.3 Finite-slope projectors

Over `K`, consume the unique scalar factorisation
`H_u=Q_(≤h) S_(>h)` from NewtonPolygons at radius `b^(e h)`. Apply §3.4 to
obtain the finite-dimensional `M_(≤h)=ker Q_(≤h)*(u)` and stable complement.
Prove dimension equals `deg Q_(≤h)`, nesting as `h` increases, splitting into
pure-slope pieces, compatibility with commuting operators and complete field
extension. These are operator consequences of the imported factorisation.

Over `R`, consume the normalised entire preparation corollary of restricted
series: if the greatest Gauss-dominant coefficient at radius `ρ` is a
multiplicative unit and `H_u(0)=1`, obtain `H_u=QG`, `Q(0)=G(0)=1`,
`deg Q=N`, unit leading coefficient and `Q,G` entire-coprime. Require the
supplier's distinguished normalisation and radius-unit condition on `G`.
Apply §3.4 to obtain a rank-`N` finite projective piece. Numerical slopes of
a specialised fibre are asserted only when that coefficient map preserves
the appropriate dominance and radius condition. Pointwise spectral-space
factorisations and their gluing belong to the geometric roadmaps.

### 4.4 Bounds and exact polygons from a matrix

**Row bounds.** From §1.2 obtain the Hodge lower polygon with heights
`Σ_{i<n}(−log_b r_i*)/e`, where `r*` is the decreasing rearrangement of the
positive terms of a specified nonnegative null row majorant. Its weight
sequence is nondecreasing. If only `m` bounds are positive, keep the height
finite on `[0,m]` and interpret subsequent integer heights as infinity; the
Fredholm polynomial may have degree smaller than `m`. Use the extended-height
order from NewtonPolygons: the finite domain of Newton is contained in that
of the lower bound, with no equality of domains presumed. In particular every
finite slope is at least `−log_b(‖u‖)/e` for nonzero `u`.

Use [NewtonPolygons §§0.6–0.7 and §2.5][HodgeComparison]
for the ordered-weight polygon, `IsBelow`, and the implication from coefficient
bounds to `H ≤ NP(det(1-Tu))`. The estimate supplied here is
`‖c_n‖≤∏_{i<n} r_i*`; convert it using the fixed norm/valuation normalisation,
including `v(0)=∞`. Convexity, polygon construction and order are not rebuilt
here. Call this a **row Hodge lower polygon**, relative to the specified
coordinates and majorant. It need not have the same right endpoint as Newton,
and is not the intrinsic Hodge polygon of a specified finite lattice.

**Finite lattice comparison.** For a full-rank endomorphism of a finite free
DVR lattice, supply the minimum valuation of all `n × n` minors as the sum of
the first `n` invariant-factor valuations. This uses all row/column choices,
not just principal minors. Bound each principal minor's valuation below by
that minimum, then apply the ultrametric inequality to its coefficient sum;
the generic NewtonPolygons comparison yields the
Hodge–Newton inequality, with equality of the full-rank endpoints. Use `Submodule.smithNormalForm` from Mathlib's `LinearAlgebra/FreeModule/PID`
and its invariant-factor API; prove the needed determinantal-ideal/minor
valuation lemmas in the linear-algebra library.
The lattice and minor calculation stay here; the ordered-weight polygon and
coefficient comparison stay in NewtonPolygons. See
[Kedlaya, §3, Theorem 16](https://kskedlaya.org/18.787/numerical.pdf#page=5),
translating its origin to `(0,0)` for our Fredholm determinant convention.

**Distinguishing checks.** With `v(p)=1`, `A=[[p,1],[0,p]]` has row lower
slopes `(0,1)`, lattice Hodge slopes `(0,2)`, and Fredholm Newton slopes
`(1,1)`. The diagonal matrix `diag(p,p)` has the same Fredholm polynomial but
lattice Hodge slopes `(1,1)`. Thus the matrix/lattice inputs cannot be recovered
from the polynomial alone, and the row bound need not be sharp. The zero
operator has determinant one and no finite Newton slopes.

**Weights.** For `0<σ<1` and `‖aᵢⱼ‖≤σ^(w_i)`, bound each coefficient by
`σ^(min_{|S|=n} Σ_{i∈S} w_i)` whenever the stated lower bound for the minimum
is available. Cofinite growth of `w` supplies row compactness. On `ℕ`,
`w_i=i` gives exponent `n(n−1)/2`; on `J×ℕ`, with finite nonempty `J`,
`w_(j,k)=k` gives `Σ_{i<n}⌊i/|J|⌋`. Treat empty `J` separately.

**Two-sided matrix estimates.** For a matrix with
`‖aᵢⱼ‖≤σ^max(w_i−w'_j,0)` and integer difference
`δ_i=w_i−w'_i→+∞` cofinitely, prove summability of principal minors and
the bound from `Σ_{i∈S}δ_i`. The difference has a finite lower bound; account
for its finitely many negative values. When `δ` is nonnegative and increasing
in a block enumeration, its first `n` terms give the required lower sum.
This defines an entire matrix minor series without asserting row compactness.
To apply operator spectral theory, separately supply a bounded compact
realisation and prove equality of its determinant, for example by diagonal
intertwining. Transposing a matrix alone does not supply that realisation.

**Exact case.** Suppose `u` is row compact on `c₀(ℕ,K)`, `d_i≠0`,
`‖d_i‖` strictly decreases, `‖aᵢⱼ‖≤‖d_i‖`, and each leading principal
minor of `(d_i⁻¹aᵢⱼ)` has norm one. Prove
`‖c_n‖=∏_{i<n}‖d_i‖` and `v(c_n)=Σ_{i<n}v(d_i)` by a unique dominant
principal minor. Row compactness, or an explicit `‖d_i‖→0` hypothesis,
is essential; strict decrease alone is insufficient over a dense value group.
With `v(ϖ)=1`, the examples `d_i=ϖ^i` and `d_i=ϖ^(2i+1)` give slopes `i`
and `2i+1`. To obtain `i+1/2`, use `d_i=π^(2i+1)` in a complete extension
with `v(π)=1/2`.

### 4.5 Finite factors and initial segments

For a finite free invariant summand `F` of rank `r` with invariant complement,
use §1.6 and the imported polygon product theorem. Its determinant has degree
`d≤r`, with equality when `u|F` is invertible. If all its finite slopes precede
those of the complement, its polygon supplies the initial segment of length
`d`. To identify the whole `F` with `M_(≤h)`, also require `u|F` invertible;
a zero-eigenvalue summand is invisible to the Fredholm series.

The unit-slope part is `M_(=0)`. If `‖u‖≤1`, there are no negative slopes
and it equals `M_(≤0)`; this is the ordinary part in that situation.
Without the norm bound, `M_(≤0)` may also contain negative slopes.

**Checks.** For `diag(p^i)`, the slopes are `0,1,2,…` and the cutoff space
is spanned by `e_i` with `i≤h`, empty for `h<0`. A finite nilpotent summand
adds no finite slopes. Test a fractional slope and a diagonal with negative
slope. The matrix `aᵢⱼ=p^max(2i−j,0)` is bounded on unweighted `c₀` and
has convergent minor series by the two-sided estimate, but is not row compact;
its transpose does not define a bounded map on that `c₀`.

**Dependencies and sources.** NewtonPolygons supplies all scalar polygon and
root results; restricted series supplies Banach-ring preparation. This layer
adds their operator interpretation using Layers 1 and 3. Serre §§5–7,
Coleman Appendix A and Johansson–Newton §2.2 motivate the applications.

## Order of implementation and acceptance

1. Import the PFA and series interfaces; expose finite matrix/resultant lemmas.
2. Prove finite-image approximation, row truncation, the ideal properties and
   the comparisons in Layer 0.
3. Construct principal-minor determinants, their estimates, cyclicity and
   presentation independence. Prove coefficientwise base change and the pure
   `c₀` comparison on Part II's tensor carrier separately, then transport the
   determinant to abstract (Pr) scalar extensions.
4. Build the resolvent and good-zero projectors. In parallel mathematical order,
   prove the prescribed-rank transform, coefficient convergence and Gauss bounds.
5. Derive Riesz–Coleman projectors and the finite-slope applications. Import the
   scalar polygon results at this step, avoiding a dependency cycle.

Each construction needs its defining equations, uniqueness or independence,
functoriality, degenerate cases and the stated negative controls. Production
implementations must prove the targets and check the axioms of the determinant,
invertibility, projector and spectral-mapping capstones. A compiling
`Suggested.lean` validates signatures only. Extend native general-purpose APIs
in Tau Ceti, and keep production code independent of roadmap prototypes.

## References

- J.-P. Serre, *Endomorphismes complètement continus des espaces de Banach
  p-adiques*, Publ. Math. IHÉS **12** (1962), 69–85,
  [full text](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), §§1–7;
  §1, Remark 2, p. 71; §3, Proposition 4 and corollary, pp. 72–73;
  §7, Proposition 12, pp. 80–81.
- N. De Grande–De Kimpe, *Non-archimedean nuclearity*, Groupe de travail
  d'analyse ultramétrique **9**, no. 3 (1981–1982), exp. J4,
  [full text](https://www.numdam.org/item/GAU_1981-1982__9_3_A5_0.pdf),
  §§1.1, 2.1–2.3: compactoid subsets and compactoid maps over a complete
  nontrivially valued field.
- R. Coleman, *p-adic Banach spaces and families of modular forms*, Invent.
  Math. **127** (1997), 417–479,
  [full text](https://kundudeb.github.io/1997_Coleman.pdf), Appendix A,
  especially A3 (entire series and spectral transforms) and A4 (spectral theory).
- C. Johansson and J. Newton, *Extended eigenvarieties for overconvergent
  cohomology*, [corrected arXiv v4](https://arxiv.org/pdf/1604.07739v4),
  §§2.1–2.2. Their Noetherian hypotheses are retained when citing their results.
- W. H. Schikhof, *Banach spaces over nonarchimedean valued fields*,
  [survey](https://topology.nipissingu.ca/tp/reprints/v24/tp24224.pdf),
  §§2.4, 2.7, 2.13 and 2.15. The compactoid definition is on p. 564;
  the compactoid-image/finite-rank approximation comparison is on p. 566.
  The limitations of Hahn–Banach prevent the unrestricted ambient projection argument.
- K. S. Kedlaya, *A little p-adic numerical analysis*, MIT 18.787 notes (2007),
  [full text](https://kskedlaya.org/18.787/numerical.pdf), §3, pp. 5–6;
  minor valuations, invariant factors and Theorem 16 (Newton above Hodge).

## Existing Lean work

The [WilliamCoram/PhD `TateFredholm` sources][PhDSources], pinned to
`eefb3d91f34b27d0bc7822140fa85fecae029884`, are secondary implementation
references, not the specification or a build dependency. Coordinate integration
with the author and audit individual declarations and their proof dependencies;
the table is not a claim of completed proofs. Keep the independent import chains.

| Source files in `PhD/Main/TateFredholm/` | Comparison with this roadmap |
| --- | --- |
| `02_Compact`, `04_Matrix`, `05_Noetherian`, `06_Pr` | Approximation, model-space criteria and retracts (Layer 0); underlying norm and module theory belongs to PFA. |
| `05_Fredholm`, `06_BlockOp`, `06_TwoSidedBound`, `07_Conjugation`, `08_BaseChange` | Determinants, estimates, invariance and base change (Layers 1 and 4). |
| `09_Riesz`, `11_Coleman`, `11_SlopeFactor`, `12_RieszColeman`, `13_FiniteFactor` | Projectors, spectral transforms and operator slope pieces (Layers 2–4). |
| `10_Entire` | Generic series material belongs to RestrictedPowerSeries; operator consequences consume that interface here. |

[PadicFunctionalAnalysis]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/f255de3d9ad6c27bc603f65e604108ee024c4400/TauCetiRoadmap/PadicFunctionalAnalysis/README.md
[RestrictedPowerSeries]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/fae4b92f3233ec656fb01ae590c2bac0abd5eb42/TauCetiRoadmap/RestrictedPowerSeries/README.md
[NewtonPolygons]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/5164eb00764fb2ead6baadcc5cb69ff73507c8b5/TauCetiRoadmap/NewtonPolygons/README.md
[EntireDivision]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/fae4b92f3233ec656fb01ae590c2bac0abd5eb42/TauCetiRoadmap/RestrictedPowerSeries/README.md#72-entire-series-and-polynomial-division
[HodgeComparison]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/5164eb00764fb2ead6baadcc5cb69ff73507c8b5/TauCetiRoadmap/NewtonPolygons/README.md#25-hodge-lower-bounds-and-coefficient-comparisons
[PhDSources]: https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/Main/TateFredholm

[SeriesEvaluation]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/fae4b92f3233ec656fb01ae590c2bac0abd5eb42/TauCetiRoadmap/RestrictedPowerSeries/README.md#21-evaluation-and-its-universal-property
[SeriesHasse]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/fae4b92f3233ec656fb01ae590c2bac0abd5eb42/TauCetiRoadmap/RestrictedPowerSeries/README.md#23-derivatives-and-hasse-derivatives
[SeriesGauss]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/fae4b92f3233ec656fb01ae590c2bac0abd5eb42/TauCetiRoadmap/RestrictedPowerSeries/README.md#11-norms-completeness-and-approximation
