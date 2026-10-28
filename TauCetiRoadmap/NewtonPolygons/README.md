# Newton polygons of polynomials and power series

Develop the Newton polygon of a polynomial or a one-variable power series over
a nonarchimedean field, together with its supporting-value function, slope
factorisations and root-counting theorems. The library should support local-field
arithmetic, Iwasawa theory and the slope theory of Fredholm determinants through
one valuation normalisation and a common convex-polygon API, with constructions
from coefficient valuations and from prescribed slopes.

The principal results are the identification of polynomial slopes with the
negatives of root valuations, the product formula for polynomials and entire
series, factorisation and zero counts on a closed disc, and the relation between
the asymptotic polygon and the intrinsic radius of convergence. The discrete
valuation specialisation supplies irreducibility criteria and the normalised
`π^μ · unit · distinguished polynomial` preparation used in Iwasawa theory.
The geometric interface also supplies polygon comparison and the passage from
convex coefficient lower bounds to Hodge–Newton inequalities.

[Suggested.lean](Suggested.lean) gives representative definitions and target
signatures. This README is the mathematical specification; every milestone and
check below is required. The Lean interfaces are representative, not an exhaustive
checklist. Suggested homes are `TauCeti/Analysis/Convex/` for the sequence geometry,
`TauCeti/RingTheory/Valuation/` for normalisation, and
`TauCeti/NumberTheory/NewtonPolygon/` for the arithmetic dictionary.

## Scope and suppliers

This roadmap owns discrete convex envelopes and their supporting lines;
conversion between height and slope presentations; polygon order and generic
Hodge lower bounds from ordered weights; additive
valuation normalisations needed for the coefficient dictionary; Newton polygons,
finite faces and slope multisets; slope factorisation and root counts; the Newton
interpretation of convergence and entire products; and the discrete-valuation
and formal-preparation consequences in Layer 6.

The [RestrictedPowerSeries roadmap][RestrictedPowerSeries]
([PR #919](https://github.com/TauCetiProject/TauCetiRoadmap/pull/919)) supplies
the series algebra and analytic theorems. The dependency is mathematical: consume
the native library declarations already present and build the remaining supplier
targets with that roadmap. No import of another roadmap prototype is required.

| Supplier | Interface consumed here |
| --- | --- |
| RestrictedPowerSeries Layers 0–1 | Native series, coefficient maps, radius restriction, Gauss norms, multiplicativity, completeness and polynomial approximation |
| RestrictedPowerSeries §§2.1–2.3 | Evaluation in complete extensions, analytic translation and Hasse derivatives |
| RestrictedPowerSeries §3.2 and Layer 4 | The field unit criterion and arbitrary-positive-radius division/preparation, including uniqueness and coefficient-map compatibility |
| RestrictedPowerSeries §7 | Open-disc and entire-series algebras and their topology; entire division by a polynomial |
| Mathlib valuation and spectral-norm theory | Multiplicative valuations, rank-one/discrete vocabulary, additive valuations, and the norm on algebraic extensions of a complete field |
| Mathlib ideal-adic preparation | `PowerSeries.exists_isWeierstrassFactorization` and `Polynomial.IsDistinguishedAt`; Layer 6 removes the common uniformiser power and identifies the invariants |
| [LocalFieldsRamification, Layer 0](../LocalFieldsRamification/README.md) | The canonical local-field normalised valuation and ramification index, and their compatibility with the more general discrete-valued statements here |

Restricted-series carriers, Banach-ring Weierstrass proofs, general Gauss-norm
multiplicativity and Strassmann's bound remain with RestrictedPowerSeries.
Fredholm determinants, operator compactness, spectral decompositions and the
matrix-minor and row estimates used to bound Fredholm coefficients belong to
compact operator theory. Its comparison input from this roadmap is §2.5; the
geometric theorem takes the coefficient inequalities as hypotheses.
Operator/lattice Hodge data is additional input, not an invariant of an arbitrary
polynomial or power series. Measures, completed group algebras and Iwasawa
modules remain with [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md);
it consumes the formal-preparation interface in §6.3. The two preparation theories are compared in §6.4, not identified
without hypotheses.

Frobenius/Newton polygons of isocrystals, Newton polytopes, Newton–Puiseux theory,
Ore–Montes algorithms, differential-operator polygons, and analytic Laurent/Robba
rings are outside the scope. The coefficient-free two-sided convexity in §0.5
and the valuation of a formal Laurent-series field in §1.2 are included.
The slope-data interface must permit a future isocrystal construction without
depending on coefficient valuations or importing isocrystal theory.

The following boundaries specify the comparisons with related roadmaps.

| Related roadmap | Boundary and comparison target |
| --- | --- |
| [FormalLaurentPuiseux L1 and L5](../FormalLaurentPuiseux/README.md) | It supplies the Laurent-series valuation comparisons and coefficient-polygon specialisations, initial polynomials, ramified substitutions, factor Hensel lifting and Newton–Puiseux. Here §§1.2 and 2.1 compare its order valuation and polynomial polygons with the general valuation/envelope interface. The product and slope identities of §3.2 specialise to its L5 requirements. Use one shared polynomial geometry API and prove these adapters; do not build a second Laurent-specific polygon theory. The Laurent and Puiseux field constructions remain there. |
| [PadicMeasuresIwasawaAlgebras §4.3](../PadicMeasuresIwasawaAlgebras/README.md) | It consumes the complete-DVR preparation contract of §6.3. Its ring factorisation, characteristic ideals and Iwasawa-module invariants remain there; this roadmap supplies the series-content and first-minimal-index invariants and their preparation interpretation. |
| [FiniteFlatGroupsAndIntegralPadicHodgeTheory, PR #879](https://github.com/TauCetiProject/TauCetiRoadmap/pull/879), §§R07.2.16 and R07.3.2; [CrystallineCohomology, PR #857](https://github.com/TauCetiProject/TauCetiRoadmap/pull/857), §CR.4.7 | Their isocrystal slopes, Dieudonné modules, filtered-module Hodge numbers, weak admissibility and cohomological Newton polygons remain outside this roadmap. Section 0.6 supplies coefficient-free rational slope data, not those constructions or comparison theorems. |
| [LocallyAnalyticDistributions, PR #854](https://github.com/TauCetiProject/TauCetiRoadmap/pull/854), §4.13 | Its spectral transforms consume compact-operator majorants. Banach-ring majorants, including nonreduced coefficients with only a submultiplicative norm, are not field-valued Newton polygons and are outside the scope here. |

## Conventions

1. **Geometry is independent of its construction.** A polygon is a height
   function `h : ℕ → WithTop ℝ` satisfying `IsConvexSeq`; it may be bundled as
   the subtype `ConvexPolygon`. Its finite domain is an interval. The generic
   construction `lowerConvexEnvelope a` is the greatest convex minorant of a
   sequence `a`; “Newton polygon” names its application to coefficient
   valuations. Slope data gives another construction of the same geometric
   objects. Equality is equality of heights, independent of subdivisions.
   Unit slopes are used only when both adjacent heights are finite; no endpoint
   sentinel counts as a genuine slope. The empty polygon and a singleton differ.

2. **Normalisation is explicit.** The input is an additive valuation
   `v : AddValuation K (WithTop Γ)`
   ([Mathlib declaration](https://leanprover-community.github.io/mathlib4_docs/Mathlib/RingTheory/Valuation/Basic.html#AddValuation)), a strictly monotone additive embedding
   `e : Γ →+ ℝ`, and `b > 1` such that, for `x ≠ 0`,
   `‖x‖ = b^(-e(v(x)))`. Write `w(x) = e(v(x))`, with `w(0) = ∞`.
   The principal cases are `Γ = ℤ`, normalised at a uniformiser; `Γ = ℚ`,
   normalised at a specified element; and `Γ = ℝ` with `w(x) = -log ‖x‖`
   and `b = exp 1`. A rational normalisation is not hidden in a data-carrying
   global instance. On `ℚ_p` and `ℂ_p` use `v(p) = 1` and `b = p`.

3. **Orientation is fixed.** Plot `(n, w(a_n))`. Slopes increase from left to
   right. Slope `m` corresponds to a nonzero root of valuation `-m`, hence norm
   `b^m`. At radius `r = b^σ` the tilted coefficient height is `w(a_n) - σ n`.
   Sources plotting `(-n, w(a_n))` have the opposite slope convention.

4. **Zero and order are explicit.** The zero series has the all-`∞` coefficient
   sequence and polygon, and the zero polynomial has an empty slope multiset.
   Root-counting and Gauss-extremum theorems assume a nonzero input. For nonzero
   `f`, let `a = ord₀(f)`; the polygon begins at `a`. A polynomial of degree `d`
   has `d-a` finite unit slopes. The root zero has multiplicity `a` and is counted
   separately. Reducing to `f(0)=1` means first removing `X^a` and then a scalar.

5. **Geometric faces and active coefficients differ.** For nonzero `f` restricted
   at `r > 0`, the indices attaining `‖f‖_r` form a finite nonempty set. Write
   `l_r(f)` and `u_r(f)` for its least and greatest indices. They are absolute
   indices, including any initial order of vanishing. At an interior radius they
   are the endpoints of a finite polygon face. At a convergence boundary the
   polygon may have an infinite ray, while these two indices remain finite.
   Use the active indices for boundary zero counts.

6. **Radius means a coefficient invariant.** `R(f) ∈ ℝ≥0∞` is the supremum of
   nonnegative real radii at which `f` is restricted. It is independent of an
   extension field. The supremum of norms of convergence points in a specified
   field is a separate quantity; equality with `R(f)` requires sufficiently
   dense attainable positive norms. Polynomials, including zero, have `R(f)=∞`.

7. **Use the supplied analytic objects.** Use Mathlib's `PowerSeries`,
   [`PowerSeries.IsRestricted`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/RingTheory/PowerSeries/Restricted.html#PowerSeries.IsRestricted)
   and Gauss norms, with Tau Ceti's native restricted
   algebra and evaluation maps. Do not define another distinguishedness predicate
   or another disc algebra here. A real Gauss supremum is used only with a
   boundedness or restrictedness hypothesis. Supporting infima may be `±∞` and
   belong in `EReal`; this does not add a `-∞` height to a proper polygon.

8. **Root counts include multiplicities.** Polynomial roots form a `Multiset`.
   Exact analytic counts are made in a complete isometric extension where the
   preparation polynomial splits, in particular an algebraically closed one.
   Over an arbitrary complete extension only the corresponding bound and root
   identification are asserted. Analytic multiplicity is defined by translation
   and order, and proved equal to polynomial root multiplicity.

9. **Field hypotheses are local.** Coefficient, polynomial-product and algebraic
   root theorems use an ultrametric normed field with a compatible valuation;
   completeness is imposed for canonical spectral-norm extensions and analytic
   factorisation. Discrete valuation, algebraic closedness and characteristic zero
   appear only where required. No general result assumes spherical completeness
   or finite residue field.

10. **Adopt Mathlib's interfaces.** Reuse native declarations and prove the
    specified comparisons. The names in this prototype do not reserve competing
    public names: adopt Mathlib's Newton-polygon and additive-valuation API as
    it develops, replacing local declarations by imports when available.

11. **Comparison uses heights and explicit domains.** `IsBelow P Q` means the
    pointwise order `P ≤ Q`, including the values `∞` outside their finite
    domains. Equal domains and endpoints, when needed for dominance, are
    additional hypotheses. Hodge lower polygons arise from specified ordered
    weights or supplied lattice data and require coefficient bounds to compare
    with a Newton polygon. For an operator `U`, use `det(1-TU)` to obtain slopes
    equal to valuations of nonzero eigenvalues; translating characteristic-
    polynomial conventions is part of the interface in §2.5.

## Existing foundations

Mathlib provides `AddValuation`, `Valuation`, `Valuation.RankOne`,
`Valuation.IsRankOneDiscrete`, value groups, `NormedField.valuation`,
`IsDiscreteValuationRing.addVal`, `Padic.addValuation`, `PadicComplex`,
algebraic closures and spectral norms.
It also supplies polynomial roots and factorisation, orders of power series,
Eisenstein and ideal-adic preparation, real convexity, extended-real orders,
multisets, and the series APIs listed above. The reusable discrete convex hull
and its arithmetic dictionary are targets here.

Tau Ceti's `MvPowerSeries/TateAlgebra/Basic.lean` already supplies the positive-
polyradius normed construction and Gauss multiplicativity under a multiplicative
coefficient norm. `Eval.lean` supplies evaluation; `PowerSeries/Weierstrass/`
supplies arbitrary-radius division and preparation in that coefficient generality.
These are inputs through RestrictedPowerSeries, not missing Newton-polygon results.

The [Mathlib Newton-polygon proposal #38050](https://github.com/leanprover-community/mathlib4/pull/38050)
uses `NewtonPolygon`, `NewtonPolygon₀`, segment slopes and lengths, a height
map and `IsBelow`. Follow its construction-independent interface: §0.6 provides
height/slope conversions, while §0.1 characterises coefficient constructions by
greatestness. The height subtype in `Suggested.lean` is a prototype for this
interface, not a competing demand on Mathlib's public carrier. Compare the
proper one-sided cases and the two-sided height maps, translating support and
sentinel conventions explicitly. Adopt the accepted Mathlib carrier and names;
implement the missing targets in Tau Ceti without waiting for that proposal.
The [Zulip design discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Newton.20polygons/with/585502459)
motivates this separation of a polygon from the source of its slopes.

For additive valuations, follow
[Mathlib #43578](https://github.com/leanprover-community/mathlib4/pull/43578)
and [#43580](https://github.com/leanprover-community/mathlib4/pull/43580):
`WithZero.negLog`, `WithZero.orderAddIsoWithTop`, `Valuation.addVal` and
`Valuation.addValValueGroup`. Their source/target conventions and naturality
form the contract for §1.1; supply the missing declarations in Tau Ceti in that
shape and replace them by imports when Mathlib provides them.

The analytic bridge uses the native
[`TauCeti.PowerSeries.IsDistinguished`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/PowerSeries/GaussNorm.lean)
and
[`IsDistinguished.existsUnique_isUnit_isMonicOfDegree_mul_eq`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/PowerSeries/Weierstrass/Preparation.lean).
Section 2.3 identifies the greatest active coefficient with that distinguished
degree; §4.1 then reads the existing preparation theorem at this degree. Only
the Newton interpretation and constant-one normalisation are additional targets.

## Layer 0: Discrete convexity and supporting geometry

### 0.1 Convex height functions and existence

For `h : ℕ → WithTop ℝ`, define the predicate `IsConvexSeq h` by an
order-connected finite domain and monotone real increments on its finite edges.
This is a proposition on a function, not a second type of sequences. A bundled
`ConvexPolygon` contains just a height function and this proof; it does not
require provenance from coefficients or a vertex-walk algorithm. Prove the
discrete chord inequality, supporting-line inequalities and reconstruction from
an anchor and increments.

Define canonical piecewise-affine interpolation on the real interval spanned
by the finite domain. Prove that `IsConvexSeq h` is equivalent to `ConvexOn ℝ`
for this interpolation, for both finite intervals and half-lines; handle empty
and singleton domains explicitly. Integer restriction and interpolation recover
the original heights, and interpolation identifies height equality and order.
The domain for `ConvexOn` is the real interval, not the nonconvex set of integer
points. Existence of an arbitrary convex extension is a useful corollary, but
does not identify a unique interpolation. Keep the discrete predicate available
for coefficient proofs, and use the equivalence to import real convexity results.

Pointwise maxima and nonempty pointwise suprema of convex height functions are
convex, using the conditional-supremum hypotheses explicitly. Pointwise minima
need not be convex.

For an arbitrary height sequence `a`, define `IsLowerConvexEnvelope a h` by
convexity, `h ≤ a`, and greatestness among convex minorants. Prove literal uniqueness.
On `ℕ`, admissibility is the existence of a real affine lower bound:
`∃ c m, ∀ n, c + mn ≤ a(n)`. Prove its equivalence with existence of a convex
minorant and of the greatest one. The empty point set is admissible and has
polygon `∞`. Define a total `lowerConvexEnvelope`, taking the all-`∞` fallback when no
minorant exists; all geometric conclusions require admissibility. The fallback
is not an envelope of the inadmissible input.

For a nonempty admissible sequence the finite domain is the integer convex hull
of its finite indices. The polygon passes through the first finite point and,
when present, the last. Adding a constant translates the height by that constant;
adding `mn` shears it; the construction is monotone in the input. A sequence with
a point and no affine lower bound is called vertical. It has no proper polygon.

### 0.2 Construction, vertices and rationality

Construct the one-sided polygon by minimal slopes from successive contact points.
If the minimal slope is attained at a nonempty finite set of later indices,
move to the largest such index. If the infimum is not attained, or the minimising
indices are unbounded, the remaining polygon is a ray. If no later finite index
exists, it stops. Prove the lower-bound and maximality arguments separately,
including the approximation argument for a nonattained infimum.

Merge collinear pieces when extracting geometric vertices. A last coefficient
lying on a terminal ray need not be a vertex: the slope may not change there.
Interior vertices are genuine strict changes of finite slopes, and occur at
coefficient points. Define maximal finite segments and terminal rays separately.
Truncating the point set preserves the hull up to any retained geometric vertex.

For a finite polygon define its slope multiset from exactly its finite edges.
Its cardinality is the horizontal length and its sum is the endpoint height
difference. A bounded segment with integral endpoint heights has rational slope
whose reduced denominator divides its length. A terminal ray need not have
rational slope, even if all coefficient heights are integers and there is only
one geometric piece.

### 0.3 Supporting values and finite faces

Define `S_a(σ) = inf_n (a(n) - σn)` in `EReal`, with a missing coefficient
contributing `∞`. Prove `S_a = S_h` for an admissible sequence and its polygon,
and recover `h` as the supremum of its affine supporting lines. Where supporting
values are finite, prove concavity. State local piecewise affinity on intervals
where the relevant supporting faces are finite; accumulation can occur at an
endpoint of the domain.

Define a face by contact with a specified supporting line. A finite face has
absolute endpoints `l ≤ u`; its contact indices are exactly `[l,u]`. For a
polygon anchored at `a`, prove
`l = a + #{finite unit slopes < σ}` and
`u = a + #{finite unit slopes ≤ σ}` under the finiteness hypotheses.
A singleton face contributes zero multiplicity. Do not define an infinite face
endpoint by an unguarded natural-number infimum or cardinality.

A nonempty finite polygon has finite faces at every real slope. An infinite polygon whose
finite slopes tend to `∞` does too. More locally, if some later finite slope is
strictly greater than `σ`, the face of slope `σ` is finite and nonempty.
For infinite support, distinguish unbounded slopes, a terminal ray and slopes
strictly increasing towards a finite supremum.

### 0.4 Minkowski sums and common lower bounds

For one-sided polygons use the finite min-convolution
`(h₁ ⊞ h₂)(n) = min_{i+j=n}(h₁(i)+h₂(j))`.
Prove convexity, symmetry and associativity. The singleton at `(0,0)` is the
identity and the empty polygon is absorbing. For nonempty polygons the anchors
add, and their supporting values add in `EReal`. Prove the
common-supporting-slope description of a minimising split. When the relevant
faces are finite, their endpoints add; the splits at the two endpoints are
unique. For finite polygons, slope multisets add.

For later addition estimates, construct the greatest convex minorant of
`min(h₁,h₂)` when admissible. A common convex lower bound of `h₁` and `h₂`
is a lower bound for that envelope, by greatestness in §0.1. The generally
nonconvex pointwise minimum itself is not a lower bound for the polygon of a sum.

### 0.5 Integer-indexed sequences

Give the height-function specification and supporting-value theory on `ℤ` as
well. Existence is equivalent to an affine lower bound on the entire point set.
Prove compatibility with extension by `∞` on negative indices and with integer
translation. A sequence bounded below in its support reduces to the one-sided
construction. No vertex walk starting at a nonexistent first point is asserted
for a genuinely two-sided sequence.

### 0.6 Slope presentations and reconstruction

Provide `ConvexPolygon.FiniteSlopeData` for a nonempty finite polygon: an
initial abscissa in `ℕ`, an initial height, a horizontal length `d`, and
nondecreasing unit slopes indexed by `Fin d`. Length zero represents a singleton;
the empty polygon is separate. Reconstruct heights by cumulative sums on the
specified interval and put `∞` outside it. Conversely, recover the starting
point, length and slopes from a nonempty finite convex height function. Prove
both round trips, including equality of the slope data when heights agree.
Transport this presentation to an integer anchor for the bounded-below domains
of §0.5.

The unit-edge representation enforces the structural edge conditions directly.
Slopes and the initial height belong to an ordered additive group such as `ℚ`
or `ℝ`, not an extended-value type containing slope sentinels. Every actual edge
has horizontal length one. If `d=0`, `Fin d` is empty: the singleton has no
zero-width segment and no dummy slope. Finite slope entries exist only on
`Fin d`, so there are no out-of-support entries to fix. The value `∞` occurs
only in the represented heights outside the domain. For an infinite sequence,
unit widths ensure that the cumulative horizontal length tends to infinity.

A finite compressed presentation consists of strictly increasing slopes with positive
integer lengths and an anchor. Store each finite length in `ℕ+`, or require an
explicit positivity proof for that length; positivity of the total length does
not suffice. Prove equivalence with unit slopes repeated by
their lengths. Raw nondecreasing segment lists are normalised by merging equal
adjacent slopes before asserting a round trip. Neither subdivision nor redundant
vertices change the represented polygon. Translating the anchor changes the
polygon but preserves the relative slope data.
An empty segment list with an anchor represents a singleton, not the empty polygon.

For unbounded one-sided domains use an anchor and a nondecreasing sequence of
unit slopes. Prove the corresponding reconstruction and extraction results.
An eventually constant slope sequence represents a terminal ray; an infinite
sequence of strict breaks need not have a finite compressed presentation.
Distinguish these geometric descriptions from whether the original coefficients
contact a ray finitely or infinitely often. Contact data is not a field of the
polygon or its slope presentation.
To compress a finite prefix followed by a ray, store the ray's finite slope
separately from the positive finite lengths. The finite prefix may be empty.
Require nondecreasing slopes across the join; normalisation absorbs a final
prefix segment of equal slope into the ray. No ray uses an infinite slope.

State the envelope conversions explicitly. For an admissible sequence `a` with
at least one finite value, put `h=lowerConvexEnvelope a`. Extract finite slope
data when its domain of finite heights is bounded, and infinite slope data
when that domain is unbounded. These are all the nonempty one-sided cases,
since the domain of finite heights is an interval in `ℕ`. Require

```text
heights (extract h) = h = lowerConvexEnvelope a
extract (heights s) = s
lowerConvexEnvelope (heights s) = heights s.
```

Here `extract` uses the appropriate finite or infinite domain, and compressed
data is normalised before a literal round trip. These conversions recover the
envelope, not the original sequence `a`, whose points may lie strictly above it.
The all-`∞` envelope is the separate empty case, with no anchor. A nonadmissible
vertical input has no proper envelope; the total function's fallback does not
give it valid slope data. Genuinely two-sided domains without a first point use
§0.5's height geometry and are not encoded by these one-sided data structures.

Keep the cumulative-sum presentation available over ordered additive groups,
in particular `ℚ` and `ℝ`, and prove compatibility with order-preserving additive
embeddings. Computing slopes from endpoint differences additionally requires
division by positive integers. The real envelope construction need not be
generalised to every value group. Rational finite slope data embeds into the
real geometry, while an irrational terminal ray remains permitted by §0.2.

Compare with the segment presentation of Mathlib #38050 on its proper
finite-edge cases. Transport equality and order through the represented heights;
do not assert equality of raw segment records with different subdivisions or
sentinel conventions. This interface lets a future isocrystal theory supply
rational slopes and multiplicities directly.

### 0.7 Polygon order and convex lower bounds

Use pointwise order on heights and its readable alias `IsBelow P Q`. Prove
reflexivity, transitivity, antisymmetry and compatibility with canonical
interpolation. The subtype of convex heights inherits this partial order.
With `∞` outside finite domains, `P ≤ Q` implies
`finiteDomain Q ⊆ finiteDomain P`. State equal-domain and equal-endpoint
conditions separately for dominance comparisons; they are not part of
`IsBelow`. For two slope presentations with the same anchor and domain, prove
that comparison is equivalent to comparison of every partial sum of unit
slopes. It is not equivalent to termwise slope comparison.

For admissible sequences prove monotonicity and idempotence of
`lowerConvexEnvelope`, and the comparison theorem

```text
IsConvexSeq H  and  H ≤ a  imply  H ≤ lowerConvexEnvelope a.
```

For an admissible, possibly nonconvex bound `b ≤ a`, deduce
`lowerConvexEnvelope b ≤ lowerConvexEnvelope a`. Prove preservation of order by
common height translations, common affine shears and the Minkowski operation.

Given nondecreasing weights `λ_i`, construct the convex lower polygon
`H(n)=y₀+Σ_{i<n}λ_i`, on a specified finite interval or half-line. This is the
slope-data constructor of §0.6. Supply the convexity and comparison interface
used for Hodge bounds, without attaching a canonical Hodge polygon to an
arbitrary coefficient sequence. The arithmetic coefficient hypothesis belongs
to §2.5; estimates deriving it from operators remain in compact operator theory.

**Checks.** Compute a singleton, a collinear finite polygon, `a(n)=n²`, an
alternating `0,1,0,1,…` sequence, and `a(n)=⌈n√2⌉` with its irrational terminal
ray. Show `a(n)=-n²` is vertical. On `ℤ`, compare `|n|` with `-|n|`.
Check that shifting the anchor by two changes absolute face endpoints by two
but not finite slope multiplicities.
Check the finite and infinite slope-data round trips, a singleton versus the
empty polygon, and invariance under splitting a straight segment. Interpolate
`n²`: its piecewise-affine interpolation and `x²` are distinct convex extensions
of the same integer heights. On `[0,2]`, slopes `(0,2)` lie below `(1,1)` with
equal endpoints, although the second slope is larger. Check the reversal of
finite-domain containment forced by the outside-`∞` convention.

**Dependencies.** Mathlib order, convexity, conditional suprema, `EReal` and
finite antidiagonals. Sources: [Koblitz] IV §§3–4; [Lazard] §1. The affine-hull
specification and degenerate cases above are part of the required API.

## Layer 1: Additive valuations and normalisation

### 1.1 From multiplicative to additive values

Develop the `WithZero (Multiplicative Γ)` to `WithTop Γ` dictionary, including
zero-to-infinity, order reversal and multiplication-to-addition. Use the
`WithZero.negLog`, `WithZero.orderAddIsoWithTop` and `Valuation.addVal` interfaces
when available; otherwise supply compatible declarations once. Prove naturality
under order-preserving maps of value groups and compatibility with the existing
`Valuation.toAddValuation` API.

For rank-one valuations, use their chosen real embedding to obtain a real
additive valuation. For an ultrametric normed field it is `-log ‖x‖` away from
zero. Prove norm recovery and uniqueness for the fixed normalisation.
Distinguish an abstract valuation class from the additional scale of its norm.

### 1.2 Integer and rational values

For a discrete valuation construct the integer-valued additive valuation taking
every uniformiser to one. Characterise it by powers of the value-group generator.
For a specified `π` with `0 < |π| < 1`, define commensurability by
`|x|^n = |π|^m` for some integers `m` and `n > 0`, for every nonzero value.
Construct the uniquely normalised rational-valued additive valuation and prove
that such a witness gives `v_π(x)=m/n`.

Prove compatibility of integer, rational and real values, including
`‖x‖ = ‖π‖^(v_π(x))` and
`-log ‖x‖ = (-log ‖π‖) v_π(x)`.
On a discrete field use a uniformiser for the integer-to-rational comparison;
for another normalising element state the corresponding scalar explicitly.
Prove agreement with `Padic.addValuation` on `ℚ_p`, and identify the order-of-vanishing
valuation on the native `LaurentSeries` carrier supplied by FormalLaurentPuiseux
L1. Reuse that valuation and prove the normalisation comparison.
On a valuation ring that is a DVR, compare the restriction of the field's
integer valuation with Mathlib's `IsDiscreteValuationRing.addVal` after the
natural inclusion of nonnegative integer values.

When two compatible real height normalisations have bases `b` and `b'`, prove
`w' = (log b / log b') w`, and transport every polygon and slope accordingly.

### 1.3 Algebraic extensions and completion

For complete `K`, use Mathlib's spectral norm on an algebraic extension and
prove the additive-normalisation comparisons. The canonical real valuation on
the algebraic closure at base `b` is `-log ‖x‖ / log b` away from zero.
Commensurability at `π` passes to algebraic extensions. Completion preserves
the nonzero value group: a sufficiently close approximation to a nonzero
element has exactly the same norm. Deduce the rational-valued valuation on
`ℂ_p`, its compatibility with `ℚ_p`, and its range `ℚ`.

For finite extensions of a complete discretely valued field, supply the
generality needed for §6.2 without a finite-residue-field assumption. The
value-group index is finite and at most the extension degree: representatives
of different value-group cosets are linearly independent over the base.
Deduce discreteness and an integer `e > 0` with `v_L|K = e v_K`, where both
integer valuations are normalised at their own uniformisers. Prove agreement
with LocalFieldsRamification's `ramificationIndex` whenever its local-field
hypotheses apply; do not create a parallel local-field arithmetic API.

**Checks.** `v_p(p)=1`, `v_p(p⁻²)=-2`; a square root of `p` has rational
valuation `1/2` in the base normalisation, but integer valuation one in
`ℚ_p(√p)`. Prove the analogous cubic-root value in `ℂ_p` and the full rational
range there. Changing from base `p` to `exp 1` multiplies heights by `log p`.

**Dependencies.** Mathlib valuation, value-group, algebraic-extension, spectral-
norm and completion theory; the named local-field comparison above. This layer
has no dependency on Newton polygons. Sources: [Neukirch] II §§3–4, 6, 8.

## Layer 2: Coefficients, Gauss values and active indices

### 2.1 Coefficient polygons and elementary operations

Define `a_f(n)=w(coeff n f)` and use `lowerConvexEnvelope a_f` to define
`Polynomial.newtonPolygon` and `PowerSeries.newtonPolygon`, with their explicit
valuation data. For polynomials over the Laurent-series field, prove equality
of heights and finite slopes with the coefficient polygon of FormalLaurentPuiseux
L5 using §1.2's order-valuation comparison; initial forms and ramified substitutions
remain with that roadmap. Any `IsNewtonPolygonOf` predicate is the arithmetic
specialisation of `IsLowerConvexEnvelope`, not the name of the generic geometry.
Polynomial sequences are admissible. A power-series
sequence is admissible exactly when it is restricted at some positive radius;
prove this by passing between an affine lower bound and geometric decay at a
strictly smaller radius. This includes the zero sequence.

For nonzero polynomials prove the anchor, endpoint and slope-cardinality
statements of Convention 4. Compare polynomial and power-series coercions.
Prove scalar multiplication, `X^a` shifts, substitution `X ↦ cX` for `c ≠ 0`,
and isometric scalar extension with compatible valuations. For a polynomial of
degree `d`, reversal reflects the finite graph by `n ↦ d-n`; its slopes are
negated. Multiplication by a nonzero scalar translates heights and preserves
slopes. A nonzero constant or monomial has no finite slopes.

### 2.2 Gauss norms as supporting values

For `r=b^σ`, establish the term dictionary
`‖a_n‖ r^n = b^(-(w(a_n)-σn))` for nonzero coefficients, with the correct
inequality reversals and explicit zero cases. For nonzero `f` with bounded
radius-`r` coefficient terms,
`S_f(σ) = -log_b(gaussNorm norm r f)` is real and equals the supporting value
of its polygon. Boundedness is equivalent to `S_f(σ)>-∞`; nonzeroness excludes
`S_f(σ)=∞`. Restrictedness is stronger than boundedness.

For polynomial inputs the supporting function is concave and piecewise affine
on all of `ℝ`. For a series the same local statement holds in the interior of
its convergence range, with breakpoints at the finite slopes. Prove the
Legendre reconstruction with the extended-valued supporting function, including
its domain; do not apply a real logarithm to a junk or zero Gauss value.

### 2.3 First and last active coefficient

For `r>0`, `f≠0` and `f` restricted at `r`, define `l_r(f)` and `u_r(f)`
from the finite nonempty set of norm-attaining coefficient indices. Prove
their extremal characterisation, strict bounds outside their interval,
monotonicity as the radius increases through restricted radii, and compatibility
with coefficient isometries and order shifts.

If `f` is restricted at some `s>r`, show that the supporting face at
`σ=log_b r` is finite with endpoints `l_r(f),u_r(f)`. Include the polynomial
case at every radius. On compact slope intervals lying strictly inside the
convergence range only finitely many coefficients can be active. The one-sided
derivatives of `S_f` there are `-l_r(f)` on the left and `-u_r(f)` on the right.

The greatest active index makes `f` distinguished of that degree over the
field, using the predicate supplied by RestrictedPowerSeries. The unit
criterion is `u_r(f)=0`, equivalently unique attainment at index zero.
It must not be replaced by a claim about the absence of a terminal polygon ray.

### 2.4 Purity and first breaks

For a polynomial of positive degree and nonzero constant coefficient, purity
of slope `m` means that all finite slopes equal `m`. It is equivalent to the
coefficients lying on or above the line joining the first and last points.
Interior points may lie on that line. In Gauss form all terms at `b^m` are
bounded by the equal constant and leading terms.

Define a first break at `j` by the first segment ending there and a genuine
increase of the slope afterwards, allowing the polynomial endpoint as a
terminal finite segment. Give its coefficient-line criterion: equality at
the endpoint and a supporting line of strictly larger slope after it.
Pointwise strict inequalities beyond `j` alone do not imply a break for an
infinite sequence. At a finite face's right endpoint, translate the resulting
conditions into distinguishedness and then use Layer 4.

### 2.5 Hodge lower bounds and coefficient comparisons

For an admissible coefficient sequence and a convex height function `H`, prove
that coefficient bounds `H(n) ≤ w(coeff n f)` imply `IsBelow H (newtonPolygon f)`.
Specialise to finite and infinite nondecreasing weight sequences from §0.7,
with a chosen starting point and explicit domain. A general admissible bound
`b` gives `lowerConvexEnvelope b ≤ newtonPolygon f`; the raw interpolation of
nonconvex coefficient heights is not a Hodge lower polygon. These statements
apply to polynomials and to power series with a positive restricted radius.

For the operator application, take coefficient estimates for
`F_U(T)=det(1-TU)` as explicit input from compact operator theory.
Row bounds or weights give a Hodge lower polygon once those estimates are
proved. The sequence-level construction and the implication from coefficient
bounds are owned here; determinant expansions, minor bounds and compactness
remain in compact operator theory. No additional operator or lattice theory is
a prerequisite for this layer.

The finite-dimensional interpretation fixes the convention. For a full-rank
endomorphism of a finite free DVR lattice, the Hodge slopes are the valuations
of its invariant factors. The minimum valuation of an `n × n` minor is the
sum of its first `n` Hodge slopes. Coefficients of `F_U` are sums of principal
minors, so these supplied estimates imply `H ≤ NP(F_U)`, with equal endpoints.
This is the comparison contract with the operator theory, not a second
implementation of invariant factors or minor estimates. Arbitrary lower weight
bounds need not give equality of the right endpoints. See [KedlayaNumerical] §3.

For an operator on a `d`-dimensional space, `F_U(T)=T^d χ_U(1/T)` where
`χ_U(T)=det(TI-U)`.
Our coefficient polygon of `χ_U` has slopes equal to negatives of root
valuations; reversal gives the eigenvalue-valuation slopes of `F_U` and places
its initial point at `(0,0)`. The plotted graph of `χ_U` need not start at
height zero. A singular operator can have `deg F_U<d`; its zero eigenvalues
do not become finite Fredholm slopes. Do not assert a common full-rank finite
domain in that case.

**Checks.** At `r=p²`, `1-pX` has Gauss norm `p` and supporting value `-1`.
`1+pX+p²X²` is pure despite its collinear middle coefficient. The series
`Σ X^n` has bounded unit-radius terms but is not restricted. The unit-radius
restricted series `1+Σ_{n≥1} p^⌈√n⌉ X^n` has `l=u=0`, whereas its polygon
is an infinite horizontal ray. This last example must pass through the API
without assigning an infinite zero count.

Use supplied slopes `(0,2)` to bound the polygon of `(1-pT)^2`, whose slopes
are `(1,1)`. The matrices `diag(p,p)` and `[[p,1],[0,p]]` have that same
Fredholm polynomial but Hodge slopes `(1,1)` and `(0,2)` respectively; this
checks why a lattice Hodge polygon is not recovered from the polynomial alone.

**Dependencies.** Layers 0–1 and RestrictedPowerSeries Layers 0–1 and §3.2.
Sources: [Koblitz] IV §§3–4; [Lazard] §1, especially (1.7)–(1.11);
[KedlayaNumerical] §3 for the operator comparison contract.

## Layer 3: Products, polynomial roots and stability

### 3.1 Products at a fixed radius

For nonzero `f,g` restricted at `r>0`, consume Gauss multiplicativity and prove
`l_r(fg)=l_r(f)+l_r(g)` and `u_r(fg)=u_r(f)+u_r(g)`.
At these two extreme indices the convolution has a unique dominant term.
Include the coefficient-level proof and its agreement with the norm theorem.
Thus supporting values and local root-counting data add at every common
restricted radius, including a convergence boundary.

### 3.2 Global and local polygon products

For polynomials prove `NP(fg)=NP(f) ⊞ NP(g)` and addition of finite slope
multisets, with zero factors treated separately. For entire series prove the
same global polygon identity using the fixed-radius results at every positive
radius and supporting-line reconstruction. No completeness is needed for the
coefficient argument itself.

For series known only on a common disc, state the local conclusion: finite
faces and slope multiplicities agree with the Minkowski description at slopes
strictly inside that common convergence range. The fixed-radius active-index
identities of §3.1 are stronger at the boundary than a geometric face statement.
Do not infer a global polygon identity outside the common analytic domain.

Prove the initial-segment corollary used in Fredholm theory: for entire factors
with nonzero constants, if the first `n` finite slopes of one factor are no
larger than every finite slope of the other, those first `n` slopes occur
unchanged in the product. State the order shifts and constant-height translation.

### 3.3 Polynomial root multisets

In a normed extension where a nonzero polynomial splits and the valuation
extends the given one, prove that its finite slope multiset is the image of
its **nonzero** root multiset under `x ↦ -w(x)`. The proof uses products of
linear factors and §3.2. It does not need Weierstrass preparation or completeness
of the extension. Supply the canonical spectral-norm algebraic-closure version
when the base field is complete, and the `ℂ_p` specialisation.

For a finite face at slope `σ`, prove that its absolute left and right
endpoints count roots in the open and closed balls of radius `b^σ`, including
the root zero. Their difference counts roots on the sphere. Deduce purity
from equal nonzero root valuations, and realisability of a finite slope multiset
whose values occur in an algebraically closed coefficient field.

### 3.4 Addition and perturbations

Prove the coefficientwise ultrametric inequality. It implies that any common
convex lower bound of `NP(f)` and `NP(g)` is below `NP(f+g)` whenever that
polygon is admissible. Equivalently use the convex minorant of their pointwise
minimum. Equality of individual coefficient valuations under unequal valuations
is a separate statement, not equality of polygon heights.

For restricted `f,g` at `r`, if `‖f-g‖_r<‖f‖_r`, prove equality of their
Gauss norms and active-index sets. Give finite coefficient-and-tail bounds
that imply this perturbation condition on a specified compact radius interval.

**Checks.** `(1-X)(1-pX)` has slopes `0,1`. The formal identity
`(1-X)Σ X^n=1` satisfies the local product law for `r<1` but violates a global
polygon product claim. For addition, `1+X²` has a finite height at index one,
where the pointwise minimum of the polygons of `1` and `X²` is infinite.
For `X²(1-pX)`, count the two zero roots separately from the single finite slope.

**Dependencies.** Layers 0–2 and the supplied Gauss multiplicativity theorem;
polynomial splitting and roots.
Source: [Kedlaya] §§1–3 with the orientation translated; [Lazard] Proposition 1.

## Layer 4: Disc factors, slope factors and analytic zeros

Here the coefficient field is complete. Every analytic statement carries a
positive radius and restrictedness at that radius.

### 4.1 The canonical disc factor

For nonzero `f` restricted at `r`, put `d=u_r(f)`. Apply the supplied
Weierstrass preparation theorem at distinguished degree `d` to obtain
`f=eP`, where `P` is monic of degree `d`, `‖P‖_r=r^d`, and `e` is a unit
of the radius-`r` restricted algebra. Prove that this polynomial carries all
zeros in that disc, including the order of vanishing at zero.

When `f(0)=1`, give the equivalent normalisation `f=P_r U_r` with
`P_r(0)=U_r(0)=1`, `deg P_r=d`, and `‖U_r-1‖_r<1`.
Prove uniqueness with the full disc-factor conditions, including a restricted
unit cofactor. Degree and constant coefficient alone are insufficient.
Also prove the scale-correct estimate
`‖f-P_r‖_r < ‖f‖_r`.

Construct quotient and factor maps with their coefficient-extension comparisons.
For two restricted radii `r≤s`, prove `P_r` divides `P_s` in `K[X]` under
the constant-one normalisation, and identify the quotient's roots as those with
norm in `(r,s]`. The monic normalisation has the corresponding monic divisibility
statement. This is a consequence of the shared preparation theorem, not a new
proof of Banach-ring division.

### 4.2 Factorisation at vertices and by slopes

At an interior finite face ending at `j`, identify `P_r` with the polynomial
carrying the polygon through that endpoint. Equality of finite slopes is stated
for indices strictly below `j`; the polynomial has no finite outgoing edge
at `j`. Include first-segment factorisation as the pure-polynomial case.

A polynomial with nonzero constant coefficient factors, after constant
normalisation, into unique constant-one pure factors indexed by its distinct
finite slopes. Their degrees are the slope multiplicities and factors of
different slopes are coprime. Existence and uniqueness hold over the complete
base field, without assuming the polynomial splits there. The same finite
factorisation applies to the zeros of a series on any specified closed disc.

Deduce that an irreducible polynomial with nonzero constant coefficient is
pure. Apply this to the minimal polynomial of a nonzero algebraic element and
compare with the root-valuation theorem of §3.3. Neither purity nor a one-segment
polygon alone implies irreducibility.

### 4.3 Analytic multiplicity and exact counts

Evaluate in a complete isometric extension `L/K`. Define the multiplicity of
a zero `x` by the order at zero of the translated series `f(x+T)`, equivalently
the first nonzero evaluated Hasse derivative. Prove independence from the
chosen restricted radius containing `x`, and agreement with root multiplicity
of the disc polynomial. This handles inseparable polynomials in positive
characteristic without dividing by factorials.

If the disc polynomial splits over `L`, the zero multiset of `f` in the closed
disc is its root multiset and has exactly `u_r(f)` elements. Its open-disc
submultiset has `l_r(f)` elements, and the boundary sphere has
`u_r(f)-l_r(f)` elements. Prove all three formulas with multiplicities.
They include the zero root. They hold in particular over a complete
algebraically closed extension, with `ℂ_p` as the required `p`-adic instance.
Combine these formulas with §3.4 to prove that `‖f-g‖_r<‖f‖_r` preserves all
three multiplicity counts, in a complete extension where both disc polynomials
split.

Without splitting, identify the zeros that lie in `L` with the `L`-roots of
the disc polynomial and obtain the corresponding upper bounds. A complete
extension alone does not contain all the roots. Strassmann's distinct-zero
bound is consumed from RestrictedPowerSeries §2.4 and compared with this
stronger multiplicity count.

At radii strictly inside the convergence radius, translate these counts into
finite-face endpoints and slope multiplicities. At a convergence boundary use
the active indices directly, even when the hull has a terminal ray. The hull
alone does not determine the number of boundary zeros.

**Checks.** `1+pX+p³X²` has slopes `1,2` and splits into two linear factors
over `ℚ_p`. `1-X²/p` is pure and irreducible over `ℚ_p`, while it splits in
an extension containing `√p`. Over `ℂ_p`, compare the two unit-radius
restricted series
`1+Σ_{n≥1}p^⌈√n⌉X^n` and
`1+X+Σ_{n≥2}p^⌈√n⌉X^n`: both have the same horizontal-ray polygon, but
they have respectively zero and one boundary zero, counted with multiplicity.

**Dependencies.** Layers 1–3; RestrictedPowerSeries §2 for evaluation and
translation, §3.2 for units and Layer 4 for preparation. Sources: [BGR] §5.2;
[Koblitz] IV; [Lazard] §3. The distinction between active indices and geometric
vertices is essential at the endpoint.

## Layer 5: Convergence and entire products

### 5.1 The intrinsic radius

Define `R(f)` as in Convention 6. Prove that `0<r<R(f)` implies restrictedness
at `r`, and that `r>R(f)` excludes it. Prove the Cauchy–Hadamard formula in
extended nonnegative reals,
`R(f)⁻¹ = limsup_{n→∞} ‖a_n‖^(1/n)`.
Treat the initial index separately from the limiting statement. Entire means
`R(f)=∞`, using the definition supplied by RestrictedPowerSeries §7.2.

For infinitely supported `f`, let
`λ = liminf_{n→∞} w(a_n)/n` in `EReal`, assigning `∞` to zero coefficients.
If the coefficient sequence is admissible, identify `λ` with the supremum of
its finite unit slopes. Then `R(f)=b^λ`, with `b^(+∞)=∞` and `b^(-∞)=0`
in `ℝ≥0∞`. If it is vertical, `λ=-∞` and `R(f)=0`.
For finite support, including zero, the radius is `∞` regardless of the finite
slope multiset. Do not take a finite polynomial's largest slope as its radius.

At a finite positive boundary radius no conclusion about restrictedness follows
from the limiting slope alone. Restrictedness at one positive radius does not
bound all slopes: an entire nonpolynomial provides a counterexample.

### 5.2 Convergence in extensions

For a complete isometric extension `L/K`, prove that convergence at a point
of positive norm `r` is equivalent to restrictedness at `r`; use ultrametric
summability and the norm of the individual terms. Deduce convergence throughout
every closed disc at a restricted radius, with the supplied evaluation bound.
Convergence on all points of a closed ball implies restrictedness at its
numerical radius when that radius is attained by the norm of a point.

Define the separate supremum `R_L^{points}(f)` of norms of convergence points.
It is at most `R(f)` and equals it when the positive norms of `L` are dense in
`ℝ_{>0}`. Prove this density for `ℂ_p` using §1.3. Include a discrete-value-group
example where the inequality is strict. These comparisons do not change the
definition of `R(f)`.

### 5.3 Entire factorisation

For an entire nonzero series, the slopes are either a finite polynomial
multiset or tend to `∞` along the finite edges. Its zeros in an algebraically
closed complete extension are finite in every bounded disc, with multiplicity.
Their total support is countable. When infinitely many are listed with
multiplicity, their norms tend to `∞`.

For `f(0)=1`, the canonical polynomials `P_r` tend to `f` in every fixed Gauss
norm as `r→∞`. Prove this using entire polynomial division and the normalised
cofactors; on a smaller radius `s<r`, establish a bound tending to zero, such
as `‖U_r-1‖_s ≤ s/r`. Over a complete algebraically closed field deduce
`f = ∏ (1-X/α)` over its nonzero zeros with multiplicity, with convergence in
every Gauss norm. Define the product by finite subproducts, or prove independence
from an enumeration of its countable multiset.

Conversely, a family of nonzero elements with only finitely many members in
each bounded ball, counted with multiplicity, defines an entire product with
exactly that zero divisor. Normalised entire functions with the same zero
divisor are equal. Entire units are nonzero constants; over an algebraically
closed field an entire function with finitely many zeros is a polynomial.
Do not extend these global product claims to a finite open disc without new
hypotheses: accumulation towards a finite boundary is a different problem.

**Checks.** `Σp^(n²)X^n` is entire with slopes `1,3,5,…` and one zero of
each corresponding negative valuation in `ℂ_p`. `Σp^⌈n/2⌉X^n` has intrinsic
radius `√p`, while its convergence-point supremum in `ℚ_p` is one. The
`p`-adic exponential has radius `p^(-1/(p-1))` and has no zeros within it;
its radius follows from the valuation of `n!`, and its nonvanishing from the
convergent exponential identity. It is not an entire example. A polynomial's
radius is infinite even if its largest root norm is finite.

**Dependencies.** Layers 0–4; RestrictedPowerSeries §7, ultrametric summability,
extended-real limits, and Mathlib's factorial valuations/exponential for the
last check. Sources: [Koblitz] IV; [Lazard] §1 and (4.13). The entire product
is asserted on the whole affine line, not on an arbitrary open disc.

## Layer 6: Discrete valuations and formal preparation

### 6.1 Denominators and irreducibility

For an integer-valued additive valuation normalised at a uniformiser, record
the exact slope `(y₁-y₀)/(i₁-i₀)` of a bounded segment. Its reduced denominator
divides the segment length. If a nonconstant polynomial with nonzero constant
coefficient is pure of slope `a/d`, has degree `d`, and `gcd(a,d)=1`, prove
irreducibility over the field. The proof uses the polynomial product theorem
and integrality of the endpoint heights of any factor.

Recover the Eisenstein criterion and compare with Mathlib's
`Polynomial.IsEisensteinAt`. A monic Eisenstein polynomial of degree `d`
has endpoints `(0,1),(d,0)` and slope `-1/d`. Dividing by its constant
coefficient gives constant term one and keeps that slope. Reversal instead
negates it, giving `+1/d`. State both transformations explicitly.

Over a complete coefficient field, use §4.2's pure slope factors. For each
factor of degree `d_m` and slope denominator `q_m`, every
irreducible factor degree is a positive multiple of `q_m`. Consequently there
is at least one factor for each distinct slope and at most `d_m/q_m` factors
within that slope, counted with multiplicity. The case `d_m=q_m` forces
irreducibility of that pure factor; otherwise the polygon alone need not decide.

### 6.2 Ramification consequences

If a nonzero root has base-normalised valuation `a/q` in lowest terms and lies
in a finite extension `L`, prove `q` divides `e(L/K)` using the integral
normalisation on `L`. Combine this with `e≤[L:K]` from §1.3. For local fields
state the conclusion on LocalFieldsRamification's canonical ramification index.
The minimal-polynomial and pure-factor versions are corollaries. Do not require
a finite residue field for the valuation-theoretic divisibility statement.

### 6.3 The preparation contract for Iwasawa theory

Let `O` be a complete discrete valuation ring, `π` a uniformiser, and `f∈O⟦X⟧`
nonzero. Completeness is for the maximal-ideal adic topology. Define
`μ(f)=min_n v_π(a_n)` and
`λ(f)=min{n | v_π(a_n)=μ(f)}`.
Prove the minima exist, using the nonnegative integer values and nonzeroness.
No finite-residue-field hypothesis is imposed.

Supply the public target `exists_pow_mul_distinguished_mul_unit` in the
valuation-ring form consumed by PadicMeasuresIwasawaAlgebras §4.3: for
`O = Valuation.integer (NormedField.valuation (K := K))`, with `K` complete
and ultrametric, `[IsDiscreteValuationRing O]`, and
`[IsAdicComplete (IsLocalRing.maximalIdeal O) O]`, an irreducible `π : O`
and nonzero `f : PowerSeries O` admit

```text
f = PowerSeries.C (π ^ μ) * (u : PowerSeries O) * (P : PowerSeries O),
P.IsDistinguishedAt (IsLocalRing.maximalIdeal O),
u : (PowerSeries O)ˣ.
```

Prove the stronger specification that the exponent is `μ(f)` and
`P.natDegree=λ(f)`, and uniqueness for the fixed uniformiser and monic
distinguished polynomial. The proof removes the common uniformiser power
coefficientwise, then applies Mathlib's ideal-adic preparation theorem.
Give the abstract complete-DVR theorem as well, with the valuation-ring form
as its specialisation, so consumers need not introduce a fraction-field norm
merely to apply preparation.

Prove `μ(fg)=μ(f)+μ(g)` and `λ(fg)=λ(f)+λ(g)` for nonzero formal series.
Use reduction of the normalised series modulo the maximal ideal and addition
of orders in the residue-field power-series domain. This does not require
restrictedness at radius one or a global analytic polygon product theorem.

On embedding `O` in its complete discretely valued fraction field, identify
`μ` with the minimum polygon height and `λ` with the first absolute index
where that minimum is attained. The minimum face may be an infinite ray;
its right endpoint is not used. Its left endpoint includes any order of
vanishing at zero. These are the interfaces consumed by
[PadicMeasuresIwasawaAlgebras §4.3](../PadicMeasuresIwasawaAlgebras/README.md).

### 6.4 Comparing formal and normed preparation

Every `O`-coefficient formal series is restricted at `0<r<1`; it need not be
restricted at `r=1`. After removing `π^μ`, the least unit coefficient occurs
at `λ`. For all `r<1` sufficiently close to one, it is the unique dominant
weighted coefficient: the finitely many earlier coefficients have norm less
than one, and later terms acquire the strictly smaller powers of `r`.

Prove that the formal distinguished polynomial is exactly the monic normed
preparation polynomial at those radii, and that the formal unit is a unit of
each such restricted algebra. At radius one, when the series is restricted,
the normed degree is the **greatest** index attaining the minimum coefficient
valuation. It agrees with the formal degree when that index is unique; no
unqualified equivalence of the two notions of distinguishedness is asserted.

The formal polynomial counts the zeros in the open unit disc, with
multiplicity, after passage to a splitting complete extension. The normed
unit-disc polynomial may include additional boundary roots.

### 6.5 A ramified quadratic base-extension check

Over `ℚ₂`, `ξ₂=X²+2X+2` is Eisenstein and irreducible. Over `ℚ₂(i)`, with
`i²=-1`, it factors in the valuation ring `ℤ₂[i]` as

```text
ξ₂ = (X-(i-1)) (X-(-i-1)).
```

Prove the identity, monicity and degree one of both factors, and reducibility.
Give the Lean example in the valuation ring of any complete ultrametric
`ℚ₂`-extension containing such an integral `i`.
For `ℚ₂(i)` identify `i-1` as a uniformiser. In its integer normalisation
`v(2)=2` and the polygon slope is `-1`; in the base `2` normalisation the
slope is `-1/2`. This explains why the base-field irreducibility criterion
cannot be reapplied using the wrong value group after extension.

**Checks.** `X^p-p` has slope `-1/p` and forces ramification index `p` in
the degree-`p` root extension. `Φ_p(X+1)/p` has slope `-1/(p-1)`;
`Φ_p(X)` is flat. For `p+X+X²`, `μ=0` and `λ=1`, whereas the unit-disc
Weierstrass degree is two. For `ΣX^n∈O⟦X⟧`, `μ=λ=0` and the series is
a formal unit, although it is not restricted at radius one. Include the
two linear factors of `ξ₂` above.

**Dependencies.** Layers 1–4 for the polygon, root and ramification statements;
Mathlib DVR and ideal-adic preparation for §6.3; RestrictedPowerSeries for
§6.4. Formal preparation and the algebraic additivity of `μ,λ` are independent
of the entire-series theory. Sources: [Neukirch], [Washington] §7.1, [NSW]
(5.3.1)–(5.3.4).

## Dependency order and completion criteria

```text
Mathlib convexity → Layer 0 ─┐
Mathlib valuations → Layer 1 ├→ Layer 2 → Layer 3
RestrictedPowerSeries ───────┘               │
                                            ↓
shared preparation and evaluation ───────→ Layer 4 → Layer 5
Layers 1–4 ─────────────────────────────→ Layer 6 polygon consequences
Mathlib DVR/adic preparation ───────────→ §6.3 formal preparation
shared restricted-series theory ────────→ §6.4 comparison
```

The polynomial product and root theorems precede slope factorisation. General
Gauss multiplicativity is an input, so there is no cycle through an entire-series
polygon theorem. The finite-extension valuation arguments do not use the
Newton irreducibility criterion they later support.

Completion requires the following interfaces and their checks.

1. A unique generic convex envelope with honest finite-edge slopes, finite
   faces, terminal rays, affine covariance and supporting-value reconstruction;
   canonical `ConvexOn` interpolation; and finite/infinite slope-data conversions
   with normalised round trips, including rational finite presentations.
2. Compatible integer, rational and real valuation normalisations, including
   `ℚ_p`, `ℂ_p`, algebraic extensions and local-field comparisons.
3. Polynomial slope/root multisets and product identities, and the fixed-radius
   first/last-active-index product and perturbation theorems.
4. Canonical disc polynomials, compatible slope factors, analytic multiplicities
   and exact open/closed/sphere counts with their splitting hypotheses.
5. The intrinsic radius theorem with polynomial, vertical and boundary cases,
   and convergence of the entire Weierstrass product in every Gauss norm.
6. Discrete irreducibility and ramification consequences, the complete-DVR
   preparation contract and quadratic check, and the precise formal/normed comparison.
7. Pointwise polygon order, its partial-sum characterisation, and Hodge lower
   bounds from explicit coefficient inequalities, with the Fredholm determinant
   convention and operator-theory ownership boundary preserved.

Consumers should be able to cite these interfaces without reconstructing a
valuation normalisation or restricted-series algebra. In particular, the
Iwasawa preparation target is usable independently of the analytic layers.

## References

- **[Koblitz]** N. Koblitz, *p-adic Numbers, p-adic Analysis, and Zeta-Functions*,
  second edition, GTM 58, 1984, Chapter IV §§3–4: coefficient polygons,
  convergence and roots. Translate each slope convention explicitly.
- **[Kedlaya]** K. S. Kedlaya, [*Newton polygons*, MIT 18.787 notes](https://kskedlaya.org/18.787/newton-poly.pdf),
  2007, §§1–3, specialised to the untwisted case. The notes plot `(-i,v(a_i))`;
  their slopes and supporting parameter have the opposite sign to ours.
- **[KedlayaNumerical]** K. S. Kedlaya, [*A little p-adic numerical analysis*,
  MIT 18.787 notes](https://kskedlaya.org/18.787/numerical.pdf), 2007, §3,
  especially the minor description of Hodge heights and Theorem 16. We use
  `det(1-TU)` and anchor the finite full-rank comparison at `(0,0)`.
- **[Lazard]** M. Lazard, [*Les zéros d'une fonction analytique d'une variable
  sur un corps valué complet*](https://www.numdam.org/item/PMIHES_1962__14__47_0/),
  Publications Mathématiques de l'IHÉS 14 (1962), 47–75. §1 distinguishes
  extremal coefficient indices from geometric vertices at convergence endpoints;
  Proposition 1 gives the product interface; §3 gives disc factors; (4.13)
  is the whole-line product. The paper's variable is a valuation threshold,
  corresponding here to `-σ`, not the logarithm of the radius.
- **[BGR]** S. Bosch, U. Güntzer and R. Remmert, *Non-Archimedean Analysis*,
  Grundlehren 261, 1984, §§3.2 and 5.2. The analytic library is supplied by
  RestrictedPowerSeries; the Newton interpretation is developed here.
- **[Neukirch]** J. Neukirch, *Algebraic Number Theory*, Grundlehren 322, 1999,
  Chapter II §§3–4, 6, 8: valuations, completion and extensions.
- **[Washington]** L. Washington, *Introduction to Cyclotomic Fields*, second
  edition, GTM 83, §7.1: formal `p`-adic preparation and its invariants.
- **[NSW]** J. Neukirch, A. Schmidt and K. Wingberg, *Cohomology of Number
  Fields*, second edition, (5.3.1)–(5.3.4), pp. 289–290: formal preparation over a
  complete discrete valuation ring.
  The Lean supplier is Mathlib's ideal-adic preparation theorem.

## Existing Lean work

William Coram's [PhD repository](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884)
contains candidate implementations at revision
`eefb3d91f34b27d0bc7822140fa85fecae029884`. They are secondary sources, not the
specification or build dependencies. The author has requested this roadmap's
preparation for Tau Ceti; each implementation reused must still be checked
against the targets here and retain its attribution.

| Candidate source at that revision | Mathematical content to compare |
| --- | --- |
| [`PhD/TauCeti/Code/NewtonPolygons/`](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/TauCeti/Code/NewtonPolygons) | Valuation normalisation, convex sequences, supporting values, faces and products; `ConvexSeq.lean` includes convex extension and restriction for everywhere-finite heights. Some coefficient-interface proofs are admitted. |
| [`PhD/Main/NewtonPolygons/`](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/Main/NewtonPolygons) | `OfSlopes.lean` constructs cumulative-sum heights from monotone slopes. Compare finite/infinite domains and the reverse conversions required by §0.6. |
| [`PhD/Main/ForMathlib/NumberTheory/NewtonPolygon/`](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/Main/ForMathlib/NumberTheory/NewtonPolygon) | Segment records and `IsBelow`; compare represented heights, subdivisions and endpoint sentinels, not raw records. This is also represented by Mathlib #38050. |

The complete-DVR preparation interface and ramified quadratic check of §6.3 and
§6.5 incorporate the requested mathematical contracts of
[PhD PR #22](https://github.com/WilliamCoram/PhD/pull/22), inspected at
`7830230e834b85a75f763077e856864bde211112`. Their statements are given here in
full and need no access to that repository.

The Mathlib design references were inspected at `f4871d51724c51679899f8ca34bddde1f7006183`
(#38050), `c2a17f4dd6efb2b77123c31434e9589e91daafdc` (#43578), and
`d87db7956b7510870d514f10da52a0f22a5e54a6` (#43580). These pins identify the
compared interfaces, not prerequisites for starting their Tau Ceti implementation.

[RestrictedPowerSeries]: https://github.com/WilliamCoram/TauCetiRoadmap/blob/fae4b92f3233ec656fb01ae590c2bac0abd5eb42/TauCetiRoadmap/RestrictedPowerSeries/README.md
