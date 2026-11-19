# Roadmap: Newton polygons of polynomials and power series

**Summary.** This roadmap develops the Newton polygon of a polynomial or a one-variable power
series over a nonarchimedean field, as one application of a theory of discrete convex polygons that
does not depend on where the polygon comes from. A polygon is a height function
`h : ℕ → WithTop ℝ` that is convex on its finite domain. The Newton polygon of `f = Σ aₙ Xⁿ` is the
greatest convex minorant of the points `(n, w(aₙ))`, where `w` is a real additive valuation of the
coefficient field `K` with `‖x‖ = b^(−w(x))` for a fixed base `b > 1`. Slopes increase from left to
right, and a slope `m` belongs to a root of valuation `−m`, that is of norm `bᵐ`. Polygons are also
presented by their slopes, so that other theories (Hodge data, isocrystals) can feed rational slopes
into the same geometry. The standing hypotheses are an ultrametric normed field `K` with such a
valuation; completeness, discreteness and algebraic closedness are imposed theorem by theorem.

The headline theorems made below are these.

- **Slope factorisation.** If `K` is complete, a polynomial over `K` with nonzero constant term is
  its constant term times a product of polynomials with constant term one, one for each distinct
  slope of its Newton polygon, each having that slope only and degree its multiplicity; the
  factors are unique and pairwise coprime.
- **Zeros in a disc.** Let `f` be restricted at a radius `r > 0` (its weighted coefficients
  `‖aₙ‖ rⁿ` tend to zero) and let `l ≤ u` be the first and the last index at which `‖aₙ‖ rⁿ` is
  largest. In a complete extension in which the disc polynomial of `f` splits, `f` has exactly `u`
  zeros of norm at most `r` and `l` zeros of norm less than `r`, counted with multiplicity.
- **Entire products.** Over a complete algebraically closed field, an entire series with constant
  term one is the limit, in every Gauss norm, of the products of `1 − X/α` over its zeros `α` of
  norm at most `ρ`, as `ρ → ∞`.

These rest on the basic dictionary of the subject: the slopes of a polynomial are the negatives of
the valuations of its nonzero roots, the polygon of a product is the Minkowski sum of the polygons
of the factors, the radius of convergence is `b` to the power of the supremum of the slopes, and
over a complete discrete valuation ring a nonzero series is `π^μ` times a unit times a distinguished
polynomial of degree `λ`.

The roadmap sits between RestrictedPowerSeries, which supplies the restricted and entire series,
their Gauss norms, evaluation and Weierstrass preparation that the analytic layers read through the
polygon, and three consumers: FormalLaurentPuiseux, whose Newton–Puiseux theory uses the
coefficient polygons over Laurent-series fields; PadicMeasuresIwasawaAlgebras, which uses the
`π^μ` preparation and the ramified quadratic check; and CompactOperators, which supplies coefficient
estimates for Fredholm determinants and uses the comparison of polygons with Hodge polygons. The
seven layers are guided below.

## How to read the build

Layer 0 is pure convex geometry on height functions; Layer 1 is valuation theory with no polygons.
Layer 2 joins them: the Newton polygon of a series is the envelope of its coefficient heights, its
supporting values are the logarithms of Gauss norms, and the first and last coefficient attaining a
Gauss norm are the endpoints of a face. Layer 3 multiplies polygons and reads roots off them.
Layer 4 brings in Weierstrass preparation over a complete field and turns face endpoints into zero
counts and polynomial factors. Layer 5 lets the radius go to infinity. Layer 6 specialises to
discrete valuations: irreducibility, ramification and the formal preparation of Iwasawa theory.

Section numbers are stable: other roadmaps cite this one by them. The sections 0.4, 0.7, 2.1, 2.5,
3.1, 3.4, 5.1 and 6.3 have no targets left, because the pinned Tau Ceti states all of their content;
they keep their numbers, and `## Scope and ownership` below says which declarations they resolve
to. Each *Needs:* line lists what a statement and its suggested route use, item by item, so that a
target proved by another route is not held behind an unrelated one.

## Conventions

1. **Geometry is independent of its construction.** A polygon is a height function
   `h : ℕ → WithTop ℝ` satisfying `TauCeti.IsConvexSeq`: its finite domain `{n | h n ≠ ⊤}` is an
   interval and its unit slopes are nondecreasing along its finite edges. The generic construction
   `TauCeti.lowerConvexEnvelope a` is the greatest convex minorant of a sequence `a`; "Newton
   polygon" names its application to coefficient heights. Slope data are a second construction of
   the same objects. Equality of polygons is equality of heights, whatever the subdivision. A unit
   slope `TauCeti.unitSlope h n` is used only on a finite edge (`n ∈ TauCeti.finiteEdges h`: both
   `h n` and `h (n + 1)` are finite); no endpoint sentinel counts as a slope. The empty polygon `⊤`
   and a singleton differ. A sequence with at least one finite value and no affine lower bound is
   called *vertical*; it has no polygon, and the total function `TauCeti.lowerConvexEnvelope`
   returns `⊤` on it, which is not an envelope of it.

2. **Normalisation is explicit.** The input is an additive valuation `v : AddValuation K (WithTop Γ)`,
   a strictly monotone additive embedding `e : Γ →+ ℝ` and a base `b > 1` with
   `‖x‖ = b ^ (-e (v x))` for `x ≠ 0`. Write `w(x) = e(v(x))`, with `w(0) = ∞`; this is the real
   additive valuation `AddValuation.map` of `v` along `WithTop.map e`. Every polygon is formed with
   `w`, and the compatibility with the norm is the hypothesis
   `∀ x ≠ 0, ‖x‖ = b ^ (-(w x).untop₀)`. The principal cases are `Γ = ℤ`, normalised at a
   uniformiser; `Γ = ℚ`, normalised at a specified element; and `Γ = ℝ` with `w(x) = -log ‖x‖` and
   `b = exp 1`. A rational normalisation is never hidden in a data-carrying global instance. On
   `ℚ_p` and `ℂ_p` use `v(p) = 1` and `b = p`.

3. **Orientation is fixed.** Plot `(n, w(aₙ))`. Slopes increase from left to right. A slope `m`
   corresponds to a nonzero root of valuation `-m`, hence of norm `b ^ m`. At the radius
   `r = b ^ σ` the tilted coefficient height is `w(aₙ) - σ n`. Sources plotting `(-n, w(aₙ))` have
   the opposite slope convention.

4. **Zero and order are explicit.** The zero series has the all-`∞` coefficient sequence and
   polygon, and the zero polynomial has an empty slope multiset. Root-counting and Gauss-extremum
   theorems assume a nonzero input. For nonzero `f` let `a = ord₀(f)`; the polygon begins at `a`. A
   polynomial of degree `d` has `d - a` finite unit slopes. The root zero has multiplicity `a` and
   is counted separately. Reducing to `f(0) = 1` means first removing `X ^ a` and then a scalar.

5. **Geometric faces and active coefficients differ.** For nonzero `f` restricted at `r > 0`, the
   indices `n` attaining the Gauss norm, `‖aₙ‖ rⁿ = ‖f‖_r`, form a finite nonempty set. Its least
   and greatest elements are written `l_r(f)` and `u_r(f)`; they are the unique `l` with
   `TauCeti.PowerSeries.IsLowestDominant r l f` and the unique `u` with
   `TauCeti.PowerSeries.IsDistinguished r u f`. They are absolute indices, including any initial
   order of vanishing. At a radius inside the convergence range they are the endpoints of a finite
   face of the polygon. At a convergence boundary the polygon may have an infinite ray while these
   two indices stay finite; boundary zero counts use the active indices.

6. **Radius means a coefficient invariant.** The radius `R(f) ∈ ℝ≥0∞` is Tau Ceti's
   `PowerSeries.radius f`, the supremum of the nonnegative real radii at which `f` is restricted. It
   does not depend on an extension field. The supremum of the norms of the points of a given field
   at which the series converges is a separate quantity (§5.2); it equals `R(f)` when the positive
   norms of that field are dense. Polynomials, including zero, have `R(f) = ∞`.

7. **Use the supplied analytic objects.** Series are Mathlib's `PowerSeries`, with
   `PowerSeries.IsRestricted`, `PowerSeries.gaussNorm` and the subring
   `PowerSeries.IsRestricted.subring` of series restricted at a radius; evaluation is Tau Ceti's
   `PowerSeries.evalAt`, entire series are Tau Ceti's `PowerSeries.IsEntire`, and the
   distinguished degree is Tau Ceti's `TauCeti.PowerSeries.IsDistinguished`. No other
   distinguishedness predicate or disc algebra is defined here. A real Gauss supremum is used only
   under a boundedness (`PowerSeries.HasGaussNorm`) or restrictedness hypothesis. Supporting infima
   may be `±∞` and live in `EReal`; this adds no `-∞` height to a polygon.

8. **Root counts include multiplicities.** Polynomial roots form a `Multiset`. The multiplicity of
   a zero `x` of a series `f` is the order at zero of the translated series `f(x + T)`, equivalently
   the index of the first nonzero evaluated Hasse derivative: it is `h` when Tau Ceti's
   `PowerSeries.IsGoodZero f x h` holds. This needs no division by factorials. Exact analytic
   counts are made in a complete extension, with norm extending that of `K`, in which the
   preparation polynomial splits, in particular an algebraically closed one; over an arbitrary
   complete extension only the corresponding bounds and the identification of the roots there are
   asserted.

9. **Field hypotheses are local.** Coefficient, polynomial-product and algebraic root theorems use
   an ultrametric normed field with a compatible valuation; completeness is imposed for canonical
   spectral-norm extensions and analytic factorisation. Discrete valuations, algebraic closedness
   and characteristic zero appear only where a statement needs them. No general result assumes
   spherical completeness or a finite residue field.

10. **Mathlib's interfaces are the model.** Mathlib's Newton-polygon proposal
    ([#38050](https://github.com/leanprover-community/mathlib4/pull/38050)) uses `NewtonPolygon`,
    `NewtonPolygon₀`, segment slopes and lengths, a height map and `IsBelow`. Its
    construction-independent interface is the one followed here: polygons are height functions,
    slope data are a second presentation, and coefficient constructions are characterised by
    greatestness. The [Zulip design discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Newton.20polygons/with/585502459)
    motivates this separation of a polygon from the source of its slopes. Additive valuations follow
    Mathlib's proposals [#43578](https://github.com/leanprover-community/mathlib4/pull/43578) and
    [#43580](https://github.com/leanprover-community/mathlib4/pull/43580): `WithZero.negLog`,
    `WithZero.orderAddIsoWithTop`, `Valuation.addVal` and `Valuation.addValValueGroup`, with their
    source and target conventions and naturality. Names used here reserve nothing: where Mathlib
    adopts a carrier or a name for any of these objects, that carrier and that name are used.

11. **Comparison uses heights and explicit domains.** The order of polygons is the pointwise order
    `P ≤ Q` of height functions, including the values `∞` outside the finite domains (the relation
    Mathlib's proposal calls `IsBelow`); in particular `P ≤ Q` forces the finite domain of `Q` into
    that of `P`. Equal domains and equal endpoints, when a dominance statement needs them, are
    separate hypotheses. Hodge lower polygons come from specified ordered weights or from supplied
    lattice data, and are compared with a Newton polygon only through coefficient bounds; they are
    not invariants of an arbitrary polynomial or series. For an operator `U`, the Fredholm
    determinant `det(1 - TU)` (Mathlib's `Matrix.charpolyRev` for a matrix) has slopes equal to the
    valuations of the nonzero eigenvalues.

## Layer 0: Discrete convexity and supporting geometry

The objects of this layer are Tau Ceti's convex height functions (`TauCeti.IsConvexSeq`),
admissible sequences (`TauCeti.IsAdmissible`: those with an affine lower bound
`∃ c m, ∀ n, c + m n ≤ a n`), envelopes (`TauCeti.IsLowerConvexEnvelope` and the total
`TauCeti.lowerConvexEnvelope`), supporting values (`TauCeti.supportingValue`), finite faces
(`TauCeti.IsFiniteFace`), integer-indexed sequences and slope data; the supplier contracts list
their theory. The targets below complete it.

### 0.1 Convex height functions and existence

The predicate `TauCeti.IsConvexSeq`, its chord and supporting-line inequalities, reconstruction from
an anchor and its increments, the canonical piecewise-affine interpolation `TauCeti.linearInterpolate`
with its equivalence with `ConvexOn` on the real interval spanned by the finite domain (finite
intervals and half-lines, empty and singleton domains included), admissibility and the envelope with
its uniqueness and its `⊤` fallback are inputs (supplier contracts).

Define the type of convex polygons as the subtype of height functions `h : ℕ → WithTop ℝ`
satisfying `TauCeti.IsConvexSeq h`. An element is just a height function and this proof: it
carries no coefficient sequence and no vertex walk (Koblitz IV §§3–4; Lazard §1).

- Its order is the pointwise order of heights, and the coercion to height functions is injective
  and reflects the order; equality of polygons is equality of heights.
- The pointwise maximum of two polygons is a polygon and is their supremum, and the pointwise
  supremum of a nonempty family of polygons is a polygon and is its supremum.
- The infimum of two polygons is the envelope `TauCeti.lowerConvexEnvelope (P ⊓ Q)` of their
  pointwise minimum, which is admissible; it is in general not the pointwise minimum.
- For an admissible sequence `a`, `TauCeti.lowerConvexEnvelope a` is the greatest polygon below
  `a`, and `a ↦ TauCeti.lowerConvexEnvelope a` is monotone on admissible sequences.

**Checks.**
- The polygons `n ↦ n` and `n ↦ 2 - n` have pointwise minimum `0, 1, 0, -1, -2, …`, which is not
  convex (`2 · 1 > 0 + 0`); their infimum among polygons is `n ↦ -n`, the ray of slope `-1` from
  the origin, because the secant slopes `(2 - n)/n` from `(0, 0)` decrease to `-1` without
  reaching it. Taking the pointwise minimum as the infimum fails here.

*Needs:* Tau Ceti `TauCeti.IsConvexSeq`, `TauCeti.IsConvexSeq.sup`, `TauCeti.IsConvexSeq.iSup`,
`TauCeti.isAdmissible_inf_iff`, `TauCeti.IsConvexSeq.isAdmissible`,
`TauCeti.isLowerConvexEnvelope_lowerConvexEnvelope`, `TauCeti.lowerConvexEnvelope_mono`.

### 0.2 Construction, vertices and rationality

The polygon of an admissible sequence is built by minimal slopes from successive contact points
(Koblitz IV §§3–4; Lazard §1). Prove that the walk may move to the *largest* index attaining the
minimal slope: let `a` be admissible, `p` an index with `a p` finite and `a n = ⊤` for `n < p`, `σ`
the infimum of the secant slopes `(a n - a p)/(n - p)` over the `n > p` with `a n` finite, and
suppose that the indices attaining `σ` form a nonempty bounded set, with largest element `q`. Then
`TauCeti.lowerConvexEnvelope a` equals `a p + σ (n - p)` on `[p, q]` and touches `a` at `q`. If
`a n = ⊤` for all `n > q`, the polygon ends at `q`. Otherwise the walk restarts at `q` (through
`TauCeti.IsLowerConvexEnvelope.comp_add_right`), and if the minimal secant slope from `q` is
attained it is strictly greater than `σ`, so that `q` is a vertex (defined below). If it is not
attained it may equal `σ`: a last contact point lying on a terminal ray need not be a vertex.

Define the *vertices* of a polygon `h`: the endpoints of its finite domain, and the indices `n` with
`n - 1` and `n` finite edges and `unitSlope h (n - 1) < unitSlope h n`. Collinear pieces are merged:
an index inside a segment is not a vertex. Define the *maximal finite segments* of `h` as its finite
faces of positive width, and say that `h` *ends in a terminal ray* of slope `σ` from `q` when the
domain of `h` is unbounded, `h n = h q + σ (n - q)` for all `n ≥ q`, and `q` is the least index
with this property.

- The vertices are exactly the endpoints of the maximal finite segments, the endpoints of the
  domain and the start of a terminal ray; for an envelope of `a`, every vertex `n` has `h n = a n`.
- A polygon with finite domain has finitely many vertices and is the affine interpolation of its
  values at consecutive vertices.
- A polygon ends in a terminal ray exactly when its domain is unbounded and its unit slopes are
  eventually constant; the slope of the ray is that constant.

Truncating the points beyond a vertex preserves the polygon up to that vertex
(`TauCeti.IsLowerConvexEnvelope.eqOn_lowerConvexEnvelope_truncate_of_unitSlope_lt`).

For a polygon `h` with finite nonempty domain `[l, u]`, define its *slope multiset* as the multiset
of `unitSlope h n` over its finite edges `n`.

- It has `u - l` elements and sum `h u - h l`; the multiplicity of `σ` in it is the width of the
  face of `h` at slope `σ`.
- It is the slope multiset (`TauCeti.FiniteSlopeData.slopeMultiset`) of the finite slope data
  extracted from `h`, and for the Newton polygon of a polynomial it is `Polynomial.newtonSlopes`.

**Checks.**
- For `a n = n` every index is a contact point of the polygon, the ray of slope `1` from the
  origin, and only `0` is a vertex: calling every contact point a vertex would make every index
  one.
- For `a 0 = a 1 = 0` and `a n = 1/n` for `n ≥ 2`, the minimal slope `0` from the origin is attained
  only at `q = 1`, and from `1` the secant slopes `(1/n)/(n - 1)` decrease to `0` without reaching
  it: the polygon is the horizontal ray from the origin, and `1` is a contact point but not a
  vertex. Asserting a slope increase at the largest attaining index fails here.
- The points `(0, 0), (1, 1), (2, 2)` give one segment of slope `1`, vertices `0` and `2` only, and
  slope multiset `{1, 1}`.
- For `a n = ⌈n √2⌉` the heights are integers, the infimum `√2` of the secant slopes `⌈n √2⌉ / n`
  is not attained, and the polygon is the single ray `n ↦ n √2` of irrational slope: a terminal ray
  need not have rational slope, although every bounded segment with integer endpoint heights does.

*Needs:* Tau Ceti `TauCeti.secantSlopes`, `TauCeti.lowerConvexEnvelope_eq_of_secantSlope_eq_sInf`,
`TauCeti.unitSlope_lowerConvexEnvelope_eq_sInf_secantSlopes`,
`TauCeti.IsLowerConvexEnvelope.comp_add_right`, `TauCeti.IsLowerConvexEnvelope.eq_of_unitSlope_lt`,
`TauCeti.IsLowerConvexEnvelope.eq_left_of_isFiniteFace`,
`TauCeti.IsLowerConvexEnvelope.eq_right_of_isFiniteFace`, `TauCeti.IsFiniteFace`,
`TauCeti.FiniteSlopeData.ofIsConvexSeq`, `TauCeti.FiniteSlopeData.count_slopeMultiset_of_isFiniteFace`,
`Polynomial.newtonSlopes`.

### 0.3 Supporting values and finite faces

The supporting value `S_h(σ) = inf_n (h n - σ n)` is `TauCeti.supportingValue h σ`; its theory
(agreement with the envelope, Legendre reconstruction, concavity, finite faces and their endpoint
counts) is in the supplier contracts. Prove the trichotomy for an infinite domain (Koblitz IV §§3–4;
Lazard §1): let `h` be a polygon whose finite domain is infinite and let `S ∈ EReal` be the supremum
of its unit slopes. Exactly one of the following holds:

1. `S = ⊤`, and `h` has a finite face at every real slope;
2. `S` is finite and the unit slopes are eventually equal to `S`: `h` ends in a terminal ray of
   slope `S` (§0.2), the face at slope `S` is infinite, and `h` has a finite face at slope `σ` if
   and only if `σ < S`;
3. `S` is finite and every unit slope is less than `S`, so that the slopes increase strictly
   infinitely often; then no supporting line of slope `S` meets `h`, and `h` has a finite face at
   slope `σ` if and only if `σ < S`.

An infinite face has no right endpoint: no endpoint is assigned to it by an unguarded natural-number
infimum or cardinality.

**Checks.**
- The polygon with unit slopes `1 - 1/(n + 1)` from `(0, 0)` is in case 3: its faces at slopes
  `σ < 1` are finite, there is none at slope `1`, and the breakpoints of `S_h` accumulate at the
  end `σ = 1` of its finite domain.

*Needs:* Tau Ceti `TauCeti.supportingValue`, `TauCeti.IsFiniteFace`,
`TauCeti.IsConvexSeq.exists_isFiniteFace_of_unbounded_unitSlope`,
`TauCeti.IsConvexSeq.exists_isFiniteFace_of_lt_unitSlope`, `TauCeti.IsFiniteFace.lt_unitSlope`,
`TauCeti.IsConvexSeq.tendsto_div_iSup_unitSlope`, §0.2 (terminal rays).

### 0.5 Integer-indexed sequences

The height-function theory on `ℤ` consists of `TauCeti.IsIntConvexSeq`, `TauCeti.IsIntAdmissible`,
`TauCeti.intLowerConvexEnvelope` and `TauCeti.intSupportingValue`, with existence, extension by `⊤`
from `ℕ`, integer translation and Legendre reconstruction (supplier contracts). Complete its
supporting-value theory (Koblitz IV §§3–4; Lazard §1):

- For every `a : ℤ → WithTop ℝ`, the set of `σ` with `intSupportingValue a σ ≠ ⊥` is convex, and
  the real part of `σ ↦ intSupportingValue a σ` is concave on it (`ConcaveOn`), as
  `TauCeti.concaveOn_supportingValue_toReal` states on `ℕ`.
- Define supporting lines and supporting faces of `h : ℤ → WithTop ℝ` and finite faces with
  integer endpoints `l ≤ u`, as on `ℕ`. For a convex `h` every contact set is order-connected, a
  finite nonempty contact set is a finite face, its endpoints are unique, and for an envelope of
  `a` its endpoints are contact points of `a`.
- If `a n = ⊤` for `n < k`, the faces of `intLowerConvexEnvelope a` are those of the one-sided
  envelope of `n ↦ a (k + n)`, translated by `k`.

No vertex walk from a first point is asserted for a sequence whose finite domain is unbounded below.

**Checks.**
- `n ↦ |n|` is convex on `ℤ`, with supporting value `0` for `|σ| ≤ 1` and `⊥` otherwise; its face at
  slope `0` is `{0}` and its contact set at slope `1` is all of `ℕ`, which is not a finite face.
  `n ↦ -|n|` has no affine lower bound on `ℤ` (the two tails force slopes `≤ -1` and `≥ 1`),
  although its restriction to `ℕ` is the affine `n ↦ -n`.

*Needs:* Tau Ceti `TauCeti.IsIntConvexSeq`, `TauCeti.intSupportingValue`,
`TauCeti.intLowerConvexEnvelope_eq_of_forall_lt`, `TauCeti.isIntConvexSeq_iff_forall_isConvexSeq`;
Mathlib `ConcaveOn`.

### 0.6 Slope presentations and reconstruction

The unit-slope presentations `TauCeti.FiniteSlopeData` and `TauCeti.InfiniteSlopeData`, the
compressed presentation `TauCeti.FiniteCompressedSlopeData` (strictly increasing slopes with
positive lengths) and the terminal-ray presentation `TauCeti.TerminalRaySlopeData`, with heights,
convexity, extraction from a convex height function, both round trips, injectivity and the maps of
unit data along order-preserving additive maps, are in the supplier contracts. Slopes and the
initial height lie in an ordered additive group such as `ℚ` or `ℝ`; `∞` occurs only in the heights
outside the domain; length zero is a singleton, never the empty polygon. Complete the presentations
(Koblitz IV §§3–4; Lazard §1):

- **Integer anchors.** Define finite and infinite slope data whose start is an integer, with heights
  `ℤ → WithTop Γ`; for `Γ = ℝ` these heights are convex in the sense of `TauCeti.IsIntConvexSeq`,
  every convex integer height function with finite nonempty domain, or with domain bounded below and
  unbounded above, is the heights of unique such data, and the data of `ℕ`-anchored heights extended
  by `⊤` are the `ℕ`-anchored data with the start cast to `ℤ`.
- **Translation.** Moving the start of finite, infinite, compressed or terminal-ray data by `k`
  translates the heights by `k` and leaves the slopes, the slope multiset and the ray slope
  unchanged.
- **Raw segment lists.** Define a raw presentation by an anchor and a finite list of segments, each a
  slope with a positive length, with nondecreasing slopes; this is the record shape of Mathlib's
  proposal. Its heights are cumulative sums. Normalisation merges adjacent segments of equal slope
  and yields compressed data with the same heights; two raw lists have equal heights if and only if
  they have equal normalisations, and a round trip is asserted only after normalisation. An empty
  list with an anchor is a singleton.
- **Maps.** Compressed and terminal-ray data map along an order-preserving additive map, compatibly
  with their heights and with expansion to unit data; the embedding `ℚ → ℝ` carries rational
  presentations into the real geometry.
- **Envelopes.** For an admissible `a` with a finite value, put `h = TauCeti.lowerConvexEnvelope a`.
  Extract finite slope data from `h` when its finite domain is bounded and infinite slope data when
  it is unbounded (these are all the nonempty cases, the domain being an interval of `ℕ`), and prove
  `heights (extract h) = h`, `extract (heights s) = s` and
  `TauCeti.lowerConvexEnvelope (heights s) = heights s`. These recover the envelope, not `a`. The
  all-`∞` envelope is the empty case, with no anchor; a vertical `a` has no slope data.

**Checks.**
- Finite data with start `3`, initial height `5` and length `0` has heights `5` at `3` and `⊤`
  elsewhere: a singleton, not the empty polygon `⊤`.
- The raw lists `[(1, 2)]` and `[(1, 1), (1, 1)]` with the same anchor have equal heights and equal
  normalisations; comparing raw records would separate them.
- For `a = (0, 3, 1)` on `[0, 2]` the extracted data have slopes `(1/2, 1/2)` and heights
  `(0, 1/2, 1)`, which lie strictly below `a 1 = 3`: extraction recovers the envelope, not `a`.
- Moving the start of the data with slopes `(0, 1)` from `0` to `2` moves the face at slope `0`
  from `[0, 1]` to `[2, 3]`, while the multiplicity of each slope stays one.

*Needs:* Tau Ceti `TauCeti.FiniteSlopeData`, `TauCeti.InfiniteSlopeData`,
`TauCeti.FiniteCompressedSlopeData`, `TauCeti.TerminalRaySlopeData`,
`TauCeti.FiniteSlopeData.ofIsConvexSeq`, `TauCeti.InfiniteSlopeData.ofIsConvexSeq`,
`TauCeti.FiniteSlopeData.compress`, `TauCeti.IsConvexSeq.lowerConvexEnvelope_eq`,
`TauCeti.lowerConvexEnvelope_ne_top_iff`, `TauCeti.IsIntConvexSeq`, §0.5.

### Examples

- `a n = n²` is convex and is its own polygon, with unit slopes `2n + 1`, every index a vertex and
  unbounded slopes (case 1 of §0.3). Its piecewise-affine interpolation and `x ↦ x²` are two
  different convex extensions of the same integer heights: at `x = 1/2` they take `1/2` and `1/4`.
- The alternating sequence `0, 1, 0, 1, …` has the horizontal ray from the origin as polygon, with
  contact at the even indices only and the single vertex `0` (case 2 of §0.3).
- `a n = -n²` is vertical: no line lies below it, and `TauCeti.lowerConvexEnvelope` returns `⊤`.
- On `[0, 2]` the slopes `(0, 2)` give heights `(0, 0, 2)`, below the heights `(0, 1, 2)` of the
  slopes `(1, 1)` with equal endpoints, although the second slope `2` exceeds `1`: comparison is by
  partial sums of slopes, not slope by slope.
- The polygon `0` on `[0, 2]` lies below the polygon `0` on `[0, 1]`, and the finite domain of the
  larger one is the smaller interval: the order reverses the containment of finite domains.

### Dependencies

Mathlib order theory, convexity, conditional suprema, `EReal`, finite antidiagonals and multisets;
the Tau Ceti convex-sequence library named in the supplier contracts. Sources: Koblitz IV §§3–4;
Lazard §1.

## Layer 1: Additive valuations and normalisation

### 1.1 From multiplicative to additive values

The dictionary from `WithZero (Multiplicative Γ)` to `WithTop Γ` (zero to `∞`, order reversal,
products to sums), its naturality under maps of value groups and its compatibility with Mathlib's
`Valuation.toAddValuation` are given by `WithZero.negLog`, `WithZero.orderAddIsoWithTop` and
`Valuation.addVal` (supplier contracts). Prove (Neukirch II §§3–4, 6, 8):

- **Rank-one valuations.** For a valuation `v` on `K` with `[v.RankOne]`, the map
  `x ↦ -log (Valuation.RankOne.hom v (v x))`, with `0 ↦ ∞`, is a real additive valuation; it is
  `-log ‖x‖` for the norm that the rank-one structure defines.
- **Ultrametric normed fields.** On a normed field with `IsUltrametricDist`, `x ↦ -log ‖x‖` and,
  for a base `b > 1`, `x ↦ -log_b ‖x‖` (with `0 ↦ ∞`) are real additive valuations, and the norm is
  recovered as `‖x‖ = b ^ (-w x)` for `x ≠ 0`; for a fixed base the valuation is unique
  (`AddValuation.eq_of_norm_eq_rpow`).
- **Class and scale.** A valuation class determines a real additive valuation only up to a
  positive factor: two nontrivial real additive valuations on `K` that induce the same order on
  values (`Valuation.IsEquiv` of their multiplicative forms) differ by a positive factor. The scale
  is the extra datum of the norm, or of the rank-one structure; two normalisations at bases `b, b'`
  differ by the factor `log b / log b'` (`AddValuation.eq_map_of_norm_eq_rpow`).

*Needs:* Mathlib `Valuation.RankOne`, `AddValuation`, `IsUltrametricDist`, `Real.logb`; Tau Ceti
`Valuation.addVal`, `AddValuation.eq_of_norm_eq_rpow`, `AddValuation.eq_map_of_norm_eq_rpow`.

### 1.2 Integer and rational values

Prove (Neukirch II §§3–4, 6, 8):

- **Integer valuations.** For a discrete valuation `v` (Mathlib's `Valuation.IsRankOneDiscrete`),
  construct the additive valuation `K → WithTop ℤ` that takes every uniformiser to `1`, and
  characterise it by powers of the generator of the value group: it takes the value `n` exactly at
  the elements whose valuation is `γ ^ n`, where `γ < 1` generates the value group.
- **Commensurability.** Let `K` be an ultrametric normed field. For `π ∈ K` with `0 < ‖π‖ < 1`,
  say that `K` is *commensurable at `π`* when every `x ≠ 0` has integers `m` and `n > 0` with
  `‖x‖ ^ n = ‖π‖ ^ m`. Then there is a unique additive valuation `v_π : K → WithTop ℚ` with
  `‖x‖ = ‖π‖ ^ (v_π x)` for `x ≠ 0`; it takes `π` to `1`, and a witness `(m, n)` gives
  `v_π x = m / n`.
- **Comparisons.** `-log ‖x‖ = (-log ‖π‖) v_π x`. On a discretely valued field, `v_π` at a
  uniformiser is the integer valuation cast to `ℚ`, and at another normalising element `ϖ` it is the
  integer valuation divided by the integer valuation of `ϖ`. On `ℚ_p`, `v_p` is Mathlib's
  `Padic.addValuation` cast to `ℚ`. If `O` is a discrete valuation ring with fraction field `K`
  and the valuation of `K` is that of `O`, the integer valuation restricted to `O` is Mathlib's
  `IsDiscreteValuationRing.addVal O`, through the inclusion `ℕ∞ → WithTop ℤ`.
- **Laurent series.** On the Laurent-series field `K⸨X⸩` of FormalLaurentPuiseux L1, the order
  valuation `LaurentSeries.realAddVal` is the additive form of Mathlib's valuation `Valued.v`
  (whose value at `f ≠ 0` is `exp (-order f)`), cast from `ℤ` to `ℝ`.

The change of base, `w' = (log b / log b') w`, and its transport to every polygon and slope are
`AddValuation.eq_map_of_norm_eq_rpow`, `PowerSeries.newtonPolygon_eq_map_of_norm_eq_rpow` and
`Polynomial.newtonSlopes_eq_map_of_norm_eq_rpow`.

*Needs:* §1.1; Mathlib `Valuation.IsRankOneDiscrete`, `Padic.addValuation`,
`IsDiscreteValuationRing.addVal`, `LaurentSeries`, `Valued.v`; Tau Ceti
`LaurentSeries.realAddVal`, `TauCeti.LaurentSeries.valuation_eq_exp_neg_order`,
`TauCeti.NormedRing.PseudoUniformizer.logGauge_eq_map_padicAddValuation`; FormalLaurentPuiseux L1.

### 1.3 Algebraic extensions and completion

Prove (Neukirch II §§3–4, 6, 8):

- **Spectral norms.** For complete `K` and an algebraic extension `L` with Mathlib's spectral norm,
  `x ↦ -log_b (spectralNorm K L x)` is a real additive valuation on `L` extending that of `K`, and
  it is the additive form of Tau Ceti's `TauCeti.spectralValuation`. On an algebraic closure this is
  the canonical real valuation at base `b`.
- **Commensurability passes up.** If `K` is commensurable at `π`, so is every algebraic extension
  with its spectral norm, and `v_π` extends to it.
- **Completion.** A sufficiently close approximation of a nonzero element has exactly the same norm,
  so a normed field and its completion have the same set of nonzero norms.
- **`ℂ_p`.** The valuation `v_p` on `ℂ_p` (Mathlib's `PadicComplex`), normalised by `v_p(p) = 1`,
  exists, restricts to `v_p` on `ℚ_p`, and takes every rational value and only rational values.
- **Finite extensions of a complete discretely valued field**, with no hypothesis on the residue
  field: representatives of distinct cosets of the value group are linearly independent over the
  base (`Valuation.linearIndependent_of_map_smul_ne`), so the index of the value group is finite and
  at most `[L : K]`. Deduce that `L` is discretely valued and that there is an integer `e > 0` with
  `v_L|K = e v_K` for the integer valuations normalised at their own uniformisers, `e ≤ [L : K]`.
  When `K` and `L` are nonarchimedean local fields, `e` is Tau Ceti's `TauCeti.ramificationIndex K L`;
  no second local-field ramification theory is built.

*Needs:* §§1.1–1.2; Mathlib `spectralNorm`, `PadicComplex`, `UniformSpace.Completion`,
`IsAlgClosed`; Tau Ceti `TauCeti.spectralValuation`, `Valuation.linearIndependent_of_map_smul_ne`,
`IsUltrametricDist.norm_eq_of_norm_sub_lt_left`, `TauCeti.ramificationIndex`,
`TauCeti.ramificationIndex_eq_iff`.

### Examples

- `v_p(p) = 1` and `v_p(p⁻²) = -2` on `ℚ_p`.
- A square root of `p` has `v_p = 1/2` in the base normalisation, and integer valuation `1` in
  `ℚ_p(√p)`, where it is a uniformiser and `e = 2`.
- A cube root of `p` in `ℂ_p` has `v_p = 1/3`, and for `a/q ∈ ℚ` any `q`-th root of `p ^ a` has
  `v_p = a/q`, so every rational value occurs.
- Changing the base from `p` to `exp 1` multiplies every height and every slope by `log p`.

### Dependencies

Mathlib valuation, value-group, algebraic-extension, spectral-norm and completion theory; Tau Ceti's
additive-valuation dictionary and local-field ramification index; FormalLaurentPuiseux L1 for the
Laurent-series carrier. This layer uses no Newton polygons. Sources: Neukirch II §§3–4, 6, 8.

## Layer 2: Coefficients, Gauss values and active indices

Here `K` is a normed field and `w` a real additive valuation with `‖x‖ = b ^ (-(w x).untop₀)` for
`x ≠ 0` (Convention 2), hence ultrametric. The coefficient polygon of `f` is Tau Ceti's
`PowerSeries.newtonPolygon f w`, the envelope of `n ↦ w (coeff n f)`, with the polynomial version
`Polynomial.newtonPolygon` and slope multiset `Polynomial.newtonSlopes`; their elementary theory
(admissibility exactly for series restricted at some positive radius, endpoints, scalars, shifts,
substitution `X ↦ cX`, isometric scalar extension, reversal) is in the supplier contracts.

### 2.2 Gauss norms as supporting values

The term dictionary `‖aₙ‖ rⁿ = b ^ (-(w(aₙ) - σ n))` at `r = b ^ σ`, the identity
`S_f(σ) = -log_b ‖f‖_{b^σ}` for nonzero `f` with bounded weighted terms, the equivalence of
boundedness with `S_f(σ) > -∞`, and the Legendre reconstruction of the polygon from its supporting
values are inputs (supplier contracts). Prove the local form inside the convergence range
(Lazard §1, (1.7)–(1.11)): let `f ≠ 0` have radius `R(f) > 0`, and let `σ₁ < σ₂` with
`b ^ σ₂ < R(f)`. Then on `[σ₁, σ₂]` the supporting value `S_f` is the minimum of finitely many affine
functions `σ ↦ w(aₙ) - σ n`, and at every `σ` with `b ^ σ < R(f)` it is differentiable exactly when
`σ` is not a finite slope of the Newton polygon of `f`. For a polynomial the same holds on all of
`ℝ`. No real logarithm is applied to a zero Gauss norm or to the value of `PowerSeries.gaussNorm`
at an unbounded series.

*Needs:* Tau Ceti `PowerSeries.supportingValue_newtonPolygon_eq_neg_logb_gaussNorm`,
`PowerSeries.IsRestricted.exists_nat_gaussNorm_eq_sup'`,
`TauCeti.IsFiniteFace.differentiableAt_supportingValue_toReal_iff`,
`TauCeti.supportingValue_eq_coe_inf'`, `PowerSeries.radius`, `PowerSeries.isRestricted_of_lt_radius`;
§2.3.

### 2.3 First and last active coefficient

For `f ≠ 0` restricted at `r > 0`, the first and last active indices `l_r(f)` and `u_r(f)` exist and
are unique (`TauCeti.PowerSeries.exists_isLowestDominant`,
`TauCeti.PowerSeries.exists_isDistinguished`); their extremal characterisation, strict bounds
outside `[l_r(f), u_r(f)]`, monotonicity in the radius, products, and the finiteness of the set of
indices active at some radius of a compact interval inside the convergence range are in the supplier
contracts.
Prove (Lazard §1):

- **Faces.** Let `0 < r < s` and `f` restricted at `s`, with first and last active indices `l` and
  `u` at `r`. Then the Newton polygon of `f` has a finite face of slope `log_b r` with endpoints `l`
  and `u`: this is `finiteFace_of_gaussExtrema`. The polynomial case holds at every radius.
- **Derivatives.** Under the same hypotheses, `σ ↦ S_f(σ)` has left derivative `-l` and right
  derivative `-u` at `σ = log_b r`.
- **Isometries and shifts.** `TauCeti.PowerSeries.IsLowestDominant` is preserved by a coefficient
  map that preserves norms, as `TauCeti.PowerSeries.IsDistinguished` is; and for `k : ℕ` and
  `r > 0`, `f` is distinguished, respectively lowest dominant, of degree `s` at `r` if and only if
  `X ^ k * f` is of degree `s + k`.
- **Unit criterion.** For an ultrametric normed field `K`, not assumed complete, and `r > 0`, a
  series restricted at `r` is a unit of `PowerSeries.IsRestricted.subring r` if and only if it is
  distinguished of degree `0` at `r`, that is, its constant term is the unique coefficient attaining
  the Gauss norm. The criterion is about active indices: it is not replaced by a statement about the
  absence of a terminal ray of the polygon.

**Checks.**
- Over `ℚ_p`, the series `1 + Σ_{n≥1} p^⌈√n⌉ Xⁿ` is restricted at radius `1` with `l = u = 0`, so it
  is a unit there, while its polygon is the horizontal ray from the origin (the secant slopes
  `⌈√n⌉ / n` decrease to `0` without reaching it); its zero count at the boundary is `u - l = 0`,
  not infinite.

*Needs:* Tau Ceti `TauCeti.PowerSeries.IsDistinguished`, `TauCeti.PowerSeries.IsLowestDominant`,
`PowerSeries.isDistinguished_iff_isGreatest_supportingFace`,
`PowerSeries.isLowestDominant_iff_isLeast_supportingFace`,
`TauCeti.IsConvexSeq.exists_isFiniteFace_of_lt_unitSlope`,
`TauCeti.IsFiniteFace.hasDerivWithinAt_supportingValue_toReal_left`,
`TauCeti.IsFiniteFace.hasDerivWithinAt_supportingValue_toReal_right`,
`TauCeti.PowerSeries.IsDistinguished.map`, `TauCeti.PowerSeries.gaussNorm_mul_of_isRestricted`,
`TauCeti.PowerSeries.IsDistinguished.mul`; Mathlib `PowerSeries.IsRestricted.subring`.

### 2.4 Purity and first breaks

Purity, its chord criterion and its Gauss form are `Polynomial.forall_mem_newtonSlopes_eq_iff` and
`Polynomial.forall_mem_newtonSlopes_eq_iff_norm_coeff_mul_rpow_pow_le`: for a polynomial of
positive degree with nonzero constant coefficient, all finite slopes equal `m` exactly when the
coefficient points lie on or above the line through the first and last points (interior points may
lie on it). Define first breaks (Koblitz IV §§3–4): a polygon `h` with first finite index `a` has its
*first break* at `j > a` when `h` is affine on `[a, j]` and either `j` is the right end of its finite
domain or `j` is a finite edge whose unit slope exceeds that on `[a, j]`.

- **Coefficient criterion.** For an admissible coefficient sequence `c` with polygon `h` and first
  finite index `a`, `h` has its first break at `j` if and only if `c j` is finite, the line through
  `(a, c a)` and `(j, c j)` lies on or below every `c n`, and either `c n = ⊤` for all `n > j` or
  some line of strictly larger slope through `(j, c j)` lies on or below every `c n` with `n > j`.
- **Distinguishedness.** If the Newton polygon of `f` has its first break at `j` with first slope
  `σ₀`, then `f` is distinguished of degree `j` and lowest dominant of degree `a` at the radius
  `b ^ σ₀`; Layer 4 then factors off the corresponding polynomial (§4.2).

**Checks.**
- `1 + pX + p²X²` over `ℚ_p` has heights `0, 1, 2` and is pure of slope `1` although its middle
  point lies on the chord: purity allows interior points on the line.
- For `c = (0, 0, 1/2, 1/3, 1/4, …)` (that is `c 0 = c 1 = 0` and `c n = 1/n` for `n ≥ 2`) every
  point after `1` lies strictly above the horizontal line, yet the polygon is the horizontal ray and
  has no break at `1`: the secant slopes `(1/n)/(n - 1)` from `(1, 0)` tend to `0`. Pointwise strict
  inequalities do not give a break.

*Needs:* Tau Ceti `Polynomial.forall_mem_newtonSlopes_eq_iff`, `TauCeti.secantSlopes`,
`TauCeti.lowerConvexEnvelope_eq_of_secantSlope_eq_sInf`,
`PowerSeries.isDistinguished_iff_isGreatest_supportingFace`,
`PowerSeries.isLowestDominant_iff_isLeast_supportingFace`; §0.2.

### Examples

- At `r = p²`, `1 - pX` has Gauss norm `max(1, p⁻¹ · p²) = p` and supporting value `-1` at
  `σ = 2`, the minimum of the tilted heights `0` and `1 - 2`.
- `Σ Xⁿ` has bounded weighted terms at radius `1` (all equal to `1`) but is not restricted there.
- The ordered weights `(0, 2)` give the Hodge heights `(0, 0, 2)`, which bound the Newton polygon
  `(0, 1, 2)` of `(1 - pT)²` with slopes `(1, 1)`. The matrices `diag(p, p)` and `[[p, 1], [0, p]]`
  have the same Fredholm determinant `(1 - pT)²` but Hodge slopes `(1, 1)` and `(0, 2)` (invariant
  factors `(p, p)` and `(1, p²)`): a lattice Hodge polygon is not determined by the polynomial.

### Dependencies

Layers 0–1; RestrictedPowerSeries Layers 0–1 and §3.2 through the Tau Ceti declarations named in
the supplier contracts. Sources: Koblitz IV §§3–4; Lazard §1, in particular (1.7)–(1.11);
KedlayaNumerical §3 for the operator comparison.

## Layer 3: Products, polynomial roots and stability

### 3.2 Global and local polygon products

The product formulas for polynomials and for entire series (the polygon of a product is the
Minkowski sum `TauCeti.minkowskiSum` of the polygons; slope multisets and slope multiplicities add)
and the initial-segment corollary for entire factors are inputs (supplier contracts). Prove the
local law on a common disc (Lazard Proposition 1): let `f, g ≠ 0` be restricted at `s > 0`. For every
`σ` with `b ^ σ < s`, the faces of the polygons of `f` and `g` at slope `σ` are finite, with
endpoints `(l, u)` and `(l', u')` say; the face of the polygon of `f g` at slope `σ` is then finite
with endpoints `(l + l', u + u')`, and the multiplicity of `σ` as a slope of `f g`
(`PowerSeries.newtonSlopeMultiplicity`) is the sum of its multiplicities for `f` and `g`. The
fixed-radius active-index identities are stronger at the boundary `b ^ σ = s` than any face
statement, and no global polygon identity is inferred outside the common disc.

*Needs:* §2.3 (faces); Tau Ceti `TauCeti.PowerSeries.IsDistinguished.mul`,
`TauCeti.PowerSeries.IsLowestDominant.mul`, `PowerSeries.newtonSlopeMultiplicity_eq_of_isFiniteFace`,
`TauCeti.IsFiniteFace.minkowskiSum`.

### 3.3 Polynomial root multisets

The root theorem is `Polynomial.newtonSlopes_eq_map_roots_map`: in an extension with a
valuation extending `w` in which a polynomial splits, its finite slope multiset is the image of its
nonzero roots under `x ↦ -w(x)`; no completeness or preparation is needed. Prove (Kedlaya §§1–3,
with the orientation translated):

- **Algebraic closure.** For complete `K`, the root theorem holds in the algebraic closure of `K`
  with the spectral-norm valuation of §1.3, for every nonzero polynomial over `K`; and over `ℚ_p`
  with the roots in `ℂ_p` and the valuation `v_p` of §1.3.
- **Ball counts.** In an ultrametric normed extension `L` whose norm extends that of `K` and in
  which a nonzero polynomial `f` splits, if the polygon of `f` has a finite face of slope `σ` with
  endpoints `l ≤ u`, then `l` roots of `f` in `L` (counted with multiplicity, the root zero
  included) have norm less than `b ^ σ`, `u` have norm at most `b ^ σ`, and `u - l` have norm
  `b ^ σ`.
- **Realisability.** Every finite multiset of real numbers each of the form `-w(x)` with `x ≠ 0`
  in `K` is the slope multiset of a polynomial over `K` with constant term one; over an
  algebraically closed `K` these are the multisets with values in the value group.

The purity of a split polynomial whose nonzero roots share one valuation is
`Polynomial.newtonSlopes_eq_replicate`.

*Needs:* §1.3; Tau Ceti `Polynomial.newtonSlopes_eq_map_roots_map`,
`Polynomial.card_filter_roots_lt_addValuation`, `Polynomial.card_filter_roots_le_addValuation`,
`Polynomial.card_filter_roots_addValuation_eq`, `Polynomial.newtonPolygon_map`,
`Polynomial.newtonSlopes_multiset_prod_X_sub_C`; Mathlib `Polynomial.Splits`, `AlgebraicClosure`,
`PadicComplex`.

### Examples

- `(1 - X)(1 - pX) = 1 - (1 + p)X + pX²` has heights `0, 0, 1` and slopes `0, 1`.
- `(1 - X) Σ Xⁿ = 1` satisfies the local law at every slope `σ < 0` (radius below `1`), but the
  global identity fails: the Minkowski sum of the polygons of the factors is the horizontal ray
  from the origin, while the polygon of `1` is a single point.
- `1 + X²` has height `0` at index `1` on its polygon, where the pointwise minimum of the polygons of
  `1` and `X²` is `∞`: the polygon of a sum is bounded below by convex lower bounds of the summands'
  polygons, not by their pointwise minimum.
- `X²(1 - pX)` has one finite slope `1`, from the root `1/p` of valuation `-1`; the two zero roots
  are counted by the order of vanishing `2`.

### Dependencies

Layers 0–2 and Gauss multiplicativity (Tau Ceti `TauCeti.PowerSeries.gaussNorm_mul_of_isRestricted`);
polynomial splitting and roots. Sources: Kedlaya §§1–3 with the orientation translated; Lazard
Proposition 1.

## Layer 4: Disc factors, slope factors and analytic zeros

Here the coefficient field `K` is complete. Every analytic statement carries a positive radius `r`
and restrictedness at `r`.

### 4.1 The canonical disc factor

For nonzero `f` restricted at `r` with `d = u_r(f)`, Weierstrass preparation gives `f = e P` with
`P` monic of degree `d`, `‖P‖_r = r ^ d` and `e` a unit of `PowerSeries.IsRestricted.subring r`,
uniquely (`TauCeti.PowerSeries.IsDistinguished.existsUnique_isUnit_isMonicOfDegree_mul_eq`); the
preparation commutes with isometric coefficient maps, and for `r ≤ s` the monic disc polynomial at
`r` divides the one at `s`. Prove (BGR §5.2):

- **Zeros.** For a complete ultrametric extension `L` whose norm extends that of `K` and `x ∈ L`
  with `‖x‖ ≤ r`, `f` has a zero of multiplicity `h` at `x` (Convention 8) if and only if `x` is a
  root of `P` of multiplicity `h`; in particular the order of vanishing of `f` at `0` is the
  multiplicity of `0` as a root of `P`.
- **Constant-one form.** When `f(0) = 1`, `f = P_r U_r` for exactly one pair of a polynomial `P_r`
  of degree `d` with `P_r(0) = 1` and a series `U_r` restricted at `r` with `U_r(0) = 1` and
  `‖U_r - 1‖_r < 1`: this is `discFactor_unique`. Uniqueness needs all these conditions: degree and
  constant term alone do not determine the factor.
- **Estimate.** `‖f - P_r‖_r < ‖f‖_r`.
- **Maps and nesting.** The constant-one factor commutes with isometric coefficient maps. For
  restricted radii `r ≤ s`, `P_r` divides `P_s` in `K[X]`, and in a splitting field the roots of the
  quotient are exactly the roots of `P_s` of norm in `(r, s]`; the monic disc polynomials satisfy the
  same divisibility with the same quotient roots.

*Needs:* Tau Ceti `TauCeti.PowerSeries.IsDistinguished.existsUnique_isUnit_isMonicOfDegree_mul_eq`,
`TauCeti.PowerSeries.isMulDistinguished_iff_gaussNorm_eq`,
`TauCeti.PowerSeries.IsDistinguished.exists_isMonicOfDegree_mul_eq_of_preparations`,
`TauCeti.PowerSeries.IsDistinguished.norm_mem_Ioc_of_aeval_eq_zero`,
`TauCeti.PowerSeries.IsMulDistinguished.map_weierstrassDiv`, `PowerSeries.IsGoodZero`,
`PowerSeries.evalAt`, `PowerSeries.IsRestricted.evalAtHom`; §2.3 (unit criterion).

### 4.2 Factorisation at vertices and by slopes

Prove (Koblitz IV; Lazard §3):

- **Vertices.** Let `f(0) = 1`, `r = b ^ σ` with `f` restricted at some `s > r`, and let the face of
  the polygon of `f` at slope `σ` end at `j`. Then `u_r(f) = j`, and the polygon of `P_r` agrees with
  that of `f` on `[0, j]`: every `n < j` is a finite edge of one exactly when it is of the other,
  with equal unit slopes, and `P_r` has no finite edge at `j`. At the first break (§2.4) `P_r` is
  pure of the first slope: this is the first-segment factorisation.
- **Slope factorisation.** A polynomial `f` over `K` with nonzero constant coefficient is `f(0)`
  times a product of polynomials `P_m` with constant coefficient one, one for each distinct finite
  slope `m` of its polygon, `P_m` pure of slope `m` and of degree the multiplicity of `m`; the family
  is unique (`existsUnique_slopeFactors`), and factors of different slopes are coprime. The polynomial
  need not split over `K`. Applied to `P_r`, the same factorisation sorts the zeros of a series in
  the closed disc of radius `r` by norm.
- **Irreducible polynomials are pure.** An irreducible polynomial over `K` with nonzero constant
  coefficient has a single finite slope; so does the minimal polynomial of a nonzero algebraic
  element, all of whose conjugates therefore have one valuation (compare §3.3). Neither purity nor a
  polygon with one segment implies irreducibility.

**Checks.**
- `X² - p²` over `ℚ_p` has the single segment from `(0, 2)` to `(2, 0)` of slope `-1` and is
  reducible, `(X - p)(X + p)`.

*Needs:* §§2.3–2.4, §3.2 (products), §3.3, §4.1; Tau Ceti `Polynomial.newtonSlopes`,
`Polynomial.newtonSlopes_mul`, `Polynomial.forall_mem_newtonSlopes_eq_iff`; Mathlib `IsCoprime`,
`minpoly`, `Irreducible`.

### 4.3 Analytic multiplicity and exact counts

Evaluate in a complete ultrametric extension `L` whose norm extends that of `K`; the multiplicity of
a zero is that of Convention 8 (Lazard §3; BGR §5.2).

- **Independence.** For `x ∈ L` with `‖x‖ ≤ r ≤ s` and `f` restricted at `s`, the multiplicity of `x`
  as a root of the disc polynomial at `r` equals that at `s`: the analytic multiplicity does not
  depend on the radius. Inseparable polynomials in positive characteristic are covered.
- **Disc polynomials.** For a monic `P` over `K` whose degree and `l` are its last and first active
  indices at `r`, splitting over an ultrametric normed extension `L` whose norm extends that of `K`
  (neither `K` nor `L` need be complete here), `l` roots have norm less than `r`, all have norm at
  most `r`, and `deg P - l` have norm `r`, counted with multiplicity (`discPolynomial_root_counts`).
- **Exact counts.** If `f = e P` as in §4.1 and `P` splits over `L`, the zeros of `f` in the closed
  disc of radius `r`, with multiplicity, form a multiset with `u_r(f)` elements, of which `l_r(f)`
  have norm less than `r` and `u_r(f) - l_r(f)` have norm `r`; the root zero is included
  (`exists_zeros_card_eq`; given the factorisation, `K` need not be complete). This holds in
  particular over every complete algebraically closed extension, with `ℂ_p` as the `p`-adic
  instance.
- **Perturbation.** If `‖f - g‖_r < ‖f‖_r`, the three counts agree for `f` and `g` in a complete
  extension where both disc polynomials split.
- **Without splitting.** The zeros of `f` that lie in `L` are the roots of `P` in `L`, with the same
  multiplicities, so there are at most `u_r(f)` of norm at most `r` and at most `l_r(f)` of norm less
  than `r`, counted with multiplicity; a complete extension need not contain all the roots. This
  bound with multiplicity implies Strassmann's bound on distinct zeros
  (`TauCeti.PowerSeries.IsDistinguished.encard_setOf_evalAt_eq_zero_le`).
- **Faces.** For `r` strictly inside the convergence range, `l_r(f)` and `u_r(f)` are the endpoints of
  the face at slope `log_b r` (§2.3), so the counts become face endpoints and slope multiplicities. At
  a convergence boundary the counts use the active indices: the polygon alone does not determine the
  number of zeros on the boundary.

*Needs:* §§2.3, 3.3, 4.1; Tau Ceti `PowerSeries.IsGoodZero`, `PowerSeries.isGoodZero_coe_iff_of_field`,
`TauCeti.PowerSeries.isDistinguished_iff_of_gaussNorm_sub_lt`,
`TauCeti.PowerSeries.isLowestDominant_iff_of_gaussNorm_sub_lt`,
`TauCeti.PowerSeries.IsDistinguished.encard_setOf_evalAt_eq_zero_le`; Mathlib
`Polynomial.rootMultiplicity`, `Polynomial.Splits`.

### Examples

- `1 + pX + p³X²` over `ℚ_p` has heights `0, 1, 3`, slopes `1, 2`, and splits over `ℚ_p` into two
  linear factors, with roots of valuations `-1` and `-2`.
- `1 - X²/p` over `ℚ_p` has heights `0, ∞, -1`, the single slope `-1/2` with multiplicity `2`; it is
  pure and irreducible over `ℚ_p` (§6.1) and splits over `ℚ_p(√p)`.
- Over `ℂ_p` the series `1 + Σ_{n≥1} p^⌈√n⌉ Xⁿ` and `1 + X + Σ_{n≥2} p^⌈√n⌉ Xⁿ` are restricted at
  radius `1` and have the same polygon, the horizontal ray from the origin. At radius `1` the first
  has `l = u = 0` and the second `l = 0`, `u = 1`: they have no zero and exactly one zero on the unit
  sphere respectively, counted with multiplicity.

### Dependencies

Layers 1–3; RestrictedPowerSeries §2 (evaluation, translation and Hasse derivatives), §2.4
(Strassmann's bound), §3.2 (units) and Layer 4 (preparation), through the Tau Ceti declarations named
in the supplier contracts. Sources: BGR §5.2; Koblitz IV; Lazard §3. The distinction between active
indices and geometric vertices is essential at the boundary.

## Layer 5: Convergence and entire products

The radius `R(f)` of Convention 6, its restrictedness properties, the Cauchy–Hadamard formula, the
formula `R(f) = b ^ λ` with `λ = liminf w(aₙ)/n`, equal to the supremum of the finite slopes for
admissible coefficients, and `R(f) = 0` for vertical coefficients are inputs (supplier
contracts).

### 5.2 Convergence in extensions

Let `L` be a complete ultrametric extension whose norm extends that of `K`. A series restricted at
`r` converges at every point of `L` of norm at most `r` (`PowerSeries.IsRestricted.hasSum_evalAt`).
Prove (Koblitz IV):

- **Converse.** If `Σ aₙ xⁿ` converges at some `x ∈ L` of norm `r > 0`, then `f` is restricted at
  `r`; so convergence at a point of norm `r` is equivalent to restrictedness at `r`. Convergence at
  all points of a closed ball of radius `r` gives restrictedness at `r` when `r` is the norm of a
  point of `L`.
- **Point radius.** Define `R_L^pts(f)` as the supremum of the norms of the points of `L` at which
  the series converges. Then `R_L^pts(f) ≤ R(f)`, with equality when the positive norms of `L` are
  dense in `(0, ∞)`; they are dense for `ℂ_p` (§1.3), and the inequality is strict for a suitable
  series over a discretely valued `L`. The definition of `R(f)` does not change.

*Needs:* §1.3 (`ℂ_p`); Tau Ceti `PowerSeries.radius`, `PowerSeries.IsRestricted.hasSum_evalAt`;
Mathlib `Summable`, `IsUltrametricDist`.

### 5.3 Entire factorisation

The slopes of a nonzero entire series are finitely many below every bound, and tend to `∞` when
there are infinitely many (`PowerSeries.IsEntire.finite_setOf_unitSlope_newtonPolygon_le`,
`PowerSeries.IsEntire.tendsto_unitSlope_newtonPolygon`). Prove (Lazard (4.13)):

- **Zeros.** In a complete algebraically closed extension, the zeros of a nonzero entire series are
  finitely many, with multiplicity, in every bounded disc; their set is countable, and when there are
  infinitely many, listed with multiplicity, their norms tend to `∞`.
- **Convergence of disc factors.** For `f(0) = 1`, the constant-one disc polynomials `P_r` of §4.1
  tend to `f` in every Gauss norm as `r → ∞`; on a radius `s < r`, `‖U_r - 1‖_s ≤ s / r`.
- **Product.** Over a complete algebraically closed field, an entire `f` with `f(0) = 1` is the
  product of `1 - X/α` over its zeros with multiplicity: for every `s > 0`, the Gauss norm at `s` of
  `f` minus the product over the zeros of norm at most `ρ` tends to `0` as `ρ → ∞`
  (`exists_zeros_tendsto_gaussNorm_sub_prod`). The product is defined by these finite subproducts.
- **Converse and uniqueness.** A family of nonzero elements with finitely many members, counted with
  multiplicity, in each bounded ball defines an entire product with exactly that zero divisor; two
  entire series with constant term one and the same zero divisor are equal; the units of the ring of
  entire series are the nonzero constants; over an algebraically closed field an entire series with
  finitely many zeros is a polynomial.

These statements concern the whole affine line; no product statement is made on a finite open disc,
where zeros may accumulate at the boundary.

*Needs:* §§4.1, 4.3; Tau Ceti `PowerSeries.IsEntire`, `PowerSeries.IsGoodZero`,
`TauCeti.PowerSeries.IsEntirePreparation`, `TauCeti.PowerSeries.existsUnique_entire_mul_add_eq`,
`PowerSeries.IsGoodZero.exists_eq_one_sub_C_mul_X_pow_mul`; Mathlib `IsAlgClosed`.

### Examples

- `Σ p^(n²) Xⁿ` is entire, with heights `n²`, slopes `1, 3, 5, …`, and one zero in `ℂ_p` of each
  valuation `-(2n + 1)`, that is of norm `p^(2n+1)`.
- `Σ p^⌈n/2⌉ Xⁿ` has `liminf ⌈n/2⌉ / n = 1/2`, so its radius is `√p`; its weighted terms at a radius
  `p ^ k` tend to zero only for `k ≤ 0`, so the supremum of the norms of its convergence points in
  `ℚ_p` is `1`.
- The `p`-adic exponential has radius `p^(-1/(p-1))`, read off the valuation of `n!`, and no zeros in
  that disc, by the exponential identity; it is not entire.
- A polynomial has infinite radius, although the norms of its roots are bounded.
- `Σ p^(n²) Xⁿ` is restricted at radius `1` and its slopes are unbounded: restrictedness at one
  radius bounds no slopes. At a finite positive boundary radius the limiting slope alone decides no
  restrictedness: `Σ Xⁿ` and `Σ p^⌈√n⌉ Xⁿ` both have slope supremum `0`, and only the second is
  restricted at radius `1`.

### Dependencies

Layers 0–4; RestrictedPowerSeries §7 (open-disc and entire series and entire division) through the
Tau Ceti declarations named in the supplier contracts; ultrametric summability and extended-real
limits; Mathlib's factorial valuations and exponential for the exponential example. Sources:
Koblitz IV; Lazard §1 and (4.13).

## Layer 6: Discrete valuations and formal preparation

Here `w` takes integer values on `K×` (an integer valuation normalised at a uniformiser, §1.2). The
exact slope of a bounded segment, the divisibility of its length by the reduced denominator, the
irreducibility of a pure polynomial of slope `a/d` with `gcd(a, d) = 1` and degree `d`, the
Eisenstein criterion in valuation form, the divisibility of factor degrees by the slope denominator
for a pure polynomial, the ramification divisibility for an abstract integer normalisation, the
formal preparation `π^μ · unit · distinguished polynomial` with its invariants, and the comparison of
formal and normed preparation at radii below one are inputs (supplier contracts).

### 6.1 Denominators and irreducibility

Prove (Neukirch):

- **Mathlib's Eisenstein.** For a discrete valuation ring `O` with fraction field `K` and integer
  valuation `w`, a monic `f ∈ O[X]` of degree `d` satisfying Mathlib's `Polynomial.IsEisensteinAt` at
  the maximal ideal has, over `K`, the single slope `-1/d` with multiplicity `d`, and is irreducible
  over `K`; this recovers Mathlib's `Polynomial.IsEisensteinAt.irreducible` for `O`.
- **Slope by slope.** Over a complete `K`, let `f` have nonzero constant coefficient and slope
  factors `P_m` (§4.2) of degrees `d_m`, and let `q_m` be the reduced denominator of `m`. Every
  irreducible factor of `f` divides exactly one `P_m` and has degree a positive multiple of `q_m`.
  Hence `f` has at least one irreducible factor for each distinct slope and at most `d_m / q_m`
  irreducible factors of slope `m`, counted with multiplicity; `d_m = q_m` makes `P_m` irreducible,
  and otherwise the polygon alone need not decide.

**Checks.**
- A monic Eisenstein polynomial of degree `d` has endpoints `(0, 1)` and `(d, 0)` and slope `-1/d`;
  dividing by its constant coefficient gives constant term one and keeps the slope `-1/d`, while
  reversal negates it to `+1/d`.
- Over `ℚ_3`, `X² - 9` and `X² - 18` have the same polygon, the segment of slope `-1` from `(0, 2)` to
  `(2, 0)`, with `d_m = 2` and `q_m = 1`; the first is reducible and the second irreducible, `2`
  being a non-square modulo `3`.

*Needs:* §§1.2, 4.2; Tau Ceti `Polynomial.irreducible_of_eisenstein`,
`Polynomial.newtonSlopes_eq_replicate_of_eisenstein`, `Polynomial.den_dvd_natDegree_of_dvd`,
`Polynomial.card_normalizedFactors_mul_den_le_natDegree`,
`Polynomial.irreducible_of_forall_mem_newtonSlopes_eq`, `Polynomial.newtonSlopes_C_mul`,
`Polynomial.newtonSlopes_reverse`; Mathlib `Polynomial.IsEisensteinAt`.

### 6.2 Ramification consequences

Prove (Neukirch):

- **Finite extensions.** If a nonzero root of a pure polynomial of slope `a/q` (in lowest terms) over
  a complete discretely valued `K` lies in a finite extension `L`, then `q` divides the integer `e`
  of §1.3, and `e ≤ [L : K]`; no finite residue field is assumed. The minimal-polynomial version and
  the version for a root of a slope factor `P_m` (§4.2) follow.
- **Local fields.** When `K` and `L` are nonarchimedean local fields, the same divisibility holds for
  Tau Ceti's `TauCeti.ramificationIndex K L`, for pure polynomials and for minimal polynomials.

*Needs:* §§1.3, 4.2; Tau Ceti `Polynomial.den_dvd_of_forall_mem_newtonSlopes_eq`,
`minpoly.den_dvd_of_forall_mem_newtonSlopes_eq`, `AddValuation.den_dvd_of_map_eq_ratCast`,
`TauCeti.dvd_ramificationIndex_of_normalizedValuation_pow_eq`, `TauCeti.ramificationIndex`.

### 6.4 Comparing formal and normed preparation

Let `O` be a complete discrete valuation ring, embedded in a complete discretely valued field with
`‖π‖ < 1`, and `f ∈ O⟦X⟧` nonzero with `μ = μ(f)` and `λ = λ(f)` (Tau Ceti's
`PowerSeries.muInvariant` and `PowerSeries.lambdaInvariant`). The formal distinguished polynomial of
`f` is the monic normed preparation polynomial at every radius `r < 1` close enough to `1`, its unit
is a unit of each such restricted algebra, and at radius `1`, when `f` is restricted there, the
normed degree is the greatest index attaining the minimum coefficient valuation (supplier contracts).
Prove (Washington §7.1; NSW (5.3.1)–(5.3.4)): after passage to a complete extension in which the
formal distinguished polynomial `P` splits, the zeros of `f` in the open unit disc, with
multiplicity, are the roots of `P`, `λ` in number; the normed unit-disc polynomial may have further
roots on the unit sphere. No unqualified equivalence of the two notions of distinguishedness is
asserted.

**Checks.**
- For `p + X + X²` over `ℤ_p`, the coefficient valuations are `1, 0, 0`, so `μ = 0` and `λ = 1`, while
  the unit-disc normed degree is `2`; the formal polynomial has one zero in the open unit disc and the
  normed one a further zero on the unit sphere.

*Needs:* §4.3; Tau Ceti `PowerSeries.exists_pow_mul_distinguished_mul_unit`,
`PowerSeries.IsWeierstrassFactorization.eventually_eq_map_of_mul_eq`,
`TauCeti.PowerSeries.isDistinguished_one_map_iff`, `TauCeti.PowerSeries.isLowestDominant_one_map_iff`.

### 6.5 A ramified quadratic base-extension check

Over `ℚ₂`, `ξ₂ = X² + 2X + 2` is Eisenstein and irreducible. Prove (Neukirch): in the valuation
ring of any complete ultrametric normed field that is a `ℚ₂`-algebra and contains an integral `i` with
`i² = -1`,

```text
ξ₂ = (X - (i - 1)) (X - (-i - 1)),
```

both factors are monic of degree one, and `ξ₂` is reducible over that valuation ring. For `ℚ₂(i)`,
`i - 1` is a uniformiser; in its integer normalisation `v(2) = 2` and the polygon of `ξ₂` has slope
`-1`, while in the normalisation of `ℚ₂` the slope is `-1/2`. The irreducibility criterion over the
base therefore cannot be reapplied after extension with the value group of the base.

*Needs:* §§1.2–1.3, §6.1; Mathlib `Polynomial.IsEisensteinAt`, `Valuation.integer`,
`NormedField.valuation`.

### Examples

- `X^p - p` over `ℚ_p` has the single slope `-1/p` and forces ramification index `p` in the degree-`p`
  extension generated by a root.
- `Φ_p(X + 1)/p` has constant term one and slope `-1/(p - 1)` (for `p = 3`: `1 + X + X²/3`, slopes
  `-1/2, -1/2`), while `Φ_p(X) = 1 + X + ⋯ + X^(p-1)` has the single slope `0`.
- `Σ Xⁿ ∈ O⟦X⟧` has `μ = λ = 0` and is a formal unit, although it is not restricted at radius `1`.
- The roots `i - 1` and `-i - 1` of `ξ₂` have sum `-2` and product `-(i² - 1) = 2`.

### Dependencies

Layers 1–4 for the polygon, root and ramification statements; Mathlib discrete valuation rings and
ideal-adic preparation, through the Tau Ceti preparation theorem, for §6.4. Formal preparation and
the additivity of `μ` and `λ` do not use the entire-series theory. Sources: Neukirch; Washington
§7.1; NSW (5.3.1)–(5.3.4).

## Downstream consumers

- FormalLaurentPuiseux L5 uses the coefficient polygons over Laurent-series fields, at the
  valuation `LaurentSeries.realAddVal`, with their products and slope identities, for initial
  polynomials and Newton–Puiseux.
- PadicMeasuresIwasawaAlgebras §4.3 uses the `π^μ` preparation (formerly §6.3; see Scope and
  ownership) and the ramified quadratic check of §6.5.
- CompactOperators Layer 4 uses the slope data of §0.6, and the ordered-weight polygons and the
  comparison of coefficient bounds with Newton polygons of the former §§0.7 and 2.5, for Fredholm
  determinants.
- ClassicalArithmeticCompletion uses §§0.3, 2.2–2.3, 3.1–3.3 and 6.1 in reflected coordinates.
- ColemanIntegration uses §§0.3 and 0.5 for supporting values on annuli.
- HypergeometricMotives uses §§0.6 and 2.1 for Hodge and Frobenius polygons.
- PadicDifferentialEquationsAndRigidCohomology uses §§0.6–0.7, 2.1 and 3.2–3.3.
- DeligneWeightsAndPurity uses §§0.6–0.7 for rational slope data.
- PadicFunctionalAnalysis uses Layer 1 for the additive normalisation and the value group of `ℂ_p`.
- PadicExtensionFamilies uses the slope factorisation of Layer 4.

## Provenance

This section is secondary; it maps targets to existing formalizations and prescribes nothing.
William Coram's [PhD repository](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884)
contains candidate implementations at revision `eefb3d91f34b27d0bc7822140fa85fecae029884`. They are
secondary sources, not the specification or build dependencies. The author asked for this roadmap's
preparation for Tau Ceti; each implementation reused is checked against the targets here and keeps
its attribution.

| Candidate source at that revision | Mathematical content to compare |
| --- | --- |
| [`PhD/TauCeti/Code/NewtonPolygons/`](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/TauCeti/Code/NewtonPolygons) | Valuation normalisation, convex sequences, supporting values, faces and products; `ConvexSeq.lean` includes convex extension and restriction for everywhere-finite heights. Some coefficient-interface proofs are admitted. |
| [`PhD/Main/NewtonPolygons/`](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/Main/NewtonPolygons) | `OfSlopes.lean` constructs cumulative-sum heights from monotone slopes. Compare finite and infinite domains and the reverse conversions of §0.6. |
| [`PhD/Main/ForMathlib/NumberTheory/NewtonPolygon/`](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/Main/ForMathlib/NumberTheory/NewtonPolygon) | Segment records and `IsBelow`; compare represented heights, subdivisions and endpoint sentinels, not raw records. Mathlib's proposal #38050 represents the same material. |

The complete-DVR preparation interface (formerly §6.3) and the ramified quadratic check of §6.5
incorporate mathematical contracts requested in that repository, inspected at revision
`7830230e834b85a75f763077e856864bde211112`; their statements are given here in full and need no
access to it. Mathlib's design proposals were inspected at these revisions: the Newton-polygon
proposal [#38050](https://github.com/leanprover-community/mathlib4/pull/38050) at
`f4871d51724c51679899f8ca34bddde1f7006183`, and the additive-valuation proposals
[#43578](https://github.com/leanprover-community/mathlib4/pull/43578) at
`c2a17f4dd6efb2b77123c31434e9589e91daafdc` and
[#43580](https://github.com/leanprover-community/mathlib4/pull/43580) at
`d87db7956b7510870d514f10da52a0f22a5e54a6`. These revisions identify the compared interfaces; none
of them is a prerequisite.

## Scope and ownership

**This roadmap owns** discrete convex envelopes and their supporting lines; the conversion between
height and slope presentations; polygon order and Hodge lower bounds from ordered weights; the
additive valuation normalisations that the coefficient dictionary needs; Newton polygons, finite
faces and slope multisets; slope factorisation and root and zero counts; the Newton reading of
convergence and of entire products; and the discrete-valuation and formal-preparation consequences of
Layer 6. The coefficient-free two-sided convexity of §0.5 and the order valuation of a formal
Laurent-series field in §1.2 are included.

**Already in the pinned Tau Ceti.** The following sections have no remaining target, and others cite
them by these numbers; they resolve to Tau Ceti declarations (paths under `TauCeti/`), whose exact
names and hypotheses are in the supplier contracts below.

| Former section | Content | Tau Ceti at the pin |
| --- | --- | --- |
| §0.4 | Minkowski sums: min-convolution, convexity, symmetry, associativity, unit and absorbing element, anchors, supporting values, minimising splits, face endpoints and slope multisets add; the envelope of a pointwise minimum | `TauCeti.minkowskiSum` and its API (`Analysis/Convex/Sequence/Minkowski/`), `TauCeti.lowerConvexEnvelope_inf_lowerConvexEnvelope` |
| §0.7 | Pointwise polygon order, reversal of finite domains, the partial-sum criterion, monotonicity and idempotence of the envelope, comparison of a convex minorant with the envelope, translation, shear and Minkowski monotonicity, ordered-weight lower polygons | `TauCeti.setOf_ne_top_subset_of_le`, `TauCeti.le_iff_forall_sum_unitSlope_le`, `TauCeti.FiniteSlopeData.heights_le_heights_iff`, `TauCeti.InfiniteSlopeData.heights_le_heights_iff`, `TauCeti.FiniteSlopeData.heights_le_iff`, `TauCeti.InfiniteSlopeData.heights_le_iff`, `TauCeti.le_lowerConvexEnvelope`, `TauCeti.lowerConvexEnvelope_mono`, `TauCeti.lowerConvexEnvelope_idem`, `TauCeti.add_affine_le_add_affine_iff`, `TauCeti.minkowskiSum_mono` (`Analysis/Convex/Sequence/Order.lean`, `Envelope.lean`, `Minkowski/Basic.lean`); the order on the subtype of polygons is §0.1 |
| §2.1 | Coefficient polygons of series and polynomials, admissibility exactly at a positive restricted radius, anchors, endpoints and slope counts, coercion from polynomials, scalars, `X ^ a` shifts, `X ↦ cX`, isometric scalar extension, reversal, constants and monomials; the Laurent-series polygon of FormalLaurentPuiseux L5 is the polygon at `LaurentSeries.realAddVal` | `PowerSeries.newtonPolygon`, `Polynomial.newtonPolygon`, `Polynomial.newtonSlopes` and their API (`NumberTheory/NewtonPolygon/Basic.lean`, `Slopes.lean`, `GaussNorm.lean`, `LaurentSeries.lean`) |
| §2.5 | Hodge lower bounds from coefficient bounds, finite and infinite ordered weights, the Fredholm determinant `det(1 - TU)` as the reversed characteristic polynomial, principal minors, invariant-factor Hodge polygons with equal endpoints | `PowerSeries.le_newtonPolygon`, `Polynomial.heights_le_newtonPolygon_iff`, `PowerSeries.heights_le_newtonPolygon_iff`, `Matrix.heights_le_newtonPolygon_charpolyRev_of_principalMinor`, `Matrix.prefixSum_le_newtonPolygon_charpolyRev_of_mul_mul_eq_diagonal`, `Matrix.newtonPolygon_charpolyRev_apply_card_of_mul_mul_eq_diagonal`, `Matrix.newtonSlopes_charpolyRev_eq_map_roots_map` (`NumberTheory/NewtonPolygon/Hodge.lean`, `Lattice.lean`) |
| §3.1 | Active indices of a product at a fixed radius, the unique dominant term, supporting values add at every common restricted radius | `TauCeti.PowerSeries.IsLowestDominant.mul`, `TauCeti.PowerSeries.IsDistinguished.mul`, `PowerSeries.addValuation_coeff_mul_eq_add_of_isLeast`, `PowerSeries.addValuation_coeff_mul_eq_add_of_isGreatest`, `PowerSeries.supportingValue_newtonPolygon_mul_of_isRestricted` |
| §3.4 | The ultrametric inequality for sums, convex lower bounds below the polygon of a sum, Gauss norms and active indices under small perturbation, uniform coefficient-and-tail bounds | `PowerSeries.le_newtonPolygon_add`, `PowerSeries.lowerConvexEnvelope_inf_le_newtonPolygon_add`, `TauCeti.PowerSeries.gaussNorm_eq_of_gaussNorm_sub_lt`, `TauCeti.PowerSeries.isDistinguished_iff_of_gaussNorm_sub_lt`, `TauCeti.PowerSeries.isLowestDominant_iff_of_gaussNorm_sub_lt`, `TauCeti.PowerSeries.gaussNorm_sub_lt_of_coeff_le_of_tail_le` |
| §5.1 | The intrinsic radius, restrictedness below and not above it, Cauchy–Hadamard, the radius from the limiting slope, the vertical case | `PowerSeries.radius`, `PowerSeries.isRestricted_of_lt_radius`, `PowerSeries.not_isRestricted_of_radius_lt`, `PowerSeries.radius_inv_eq_limsup`, `PowerSeries.radius_eq_top_iff`, `PowerSeries.radius_coe`, `PowerSeries.radius_eq_exp_linearGrowthInf`, `PowerSeries.radius_eq_exp_iSup_unitSlope_newtonPolygon`, `PowerSeries.radius_eq_zero_iff_not_isAdmissible` |
| §6.3 | `μ(f)` and `λ(f)` over a complete discrete valuation ring and the existence of their minima; the factorisation `f = C(π^μ) · u · P` with `P` distinguished at the maximal ideal (`Polynomial.IsDistinguishedAt`), exponent `μ(f)` and degree `λ(f)`, and its uniqueness for fixed `π`; additivity of `μ` and `λ`; `μ` and `λ` as the minimum height and its first index on the polygon | `PowerSeries.muInvariant`, `PowerSeries.lambdaInvariant`, `PowerSeries.exists_pow_mul_distinguished_mul_unit`, `PowerSeries.C_pow_mul_unit_mul_inj`, `PowerSeries.muInvariant_mul`, `PowerSeries.lambdaInvariant_mul`, `PowerSeries.isLeast_range_newtonPolygon_map`, `PowerSeries.isLeast_setOf_newtonPolygon_map_eq` (`RingTheory/PowerSeries/Weierstrass/DiscreteValuationRing.lean`, `NumberTheory/NewtonPolygon/IwasawaInvariants.lean`) |

The valuation-ring form of the §6.3 preparation, which PadicMeasuresIwasawaAlgebras §4.3 cites under
the name of this roadmap's former target, is the Tau Ceti theorem
`PowerSeries.exists_pow_mul_distinguished_mul_unit` at
`O = Valuation.integer (NormedField.valuation (K := K))` for a complete ultrametric `K` with
`[IsDiscreteValuationRing O]` and `[IsAdicComplete (IsLocalRing.maximalIdeal O) O]`; no finite
residue field and no restrictedness at radius one is assumed. The sections that keep targets also
use Tau Ceti for part of their content, named at each section.

**Owned elsewhere and consumed here.**

- *Restricted series*: the restricted-series carriers, Banach-ring Weierstrass division and
  preparation, general Gauss multiplicativity, evaluation, translation, Hasse derivatives,
  Strassmann's bound, units of restricted algebras, and open-disc and entire series belong to
  [RestrictedPowerSeries](../RestrictedPowerSeries/README.md) (Layers 0–1, §§2.1–2.4, §3.2,
  Layer 4, §7), and are consumed through their Tau Ceti implementations.
- *Laurent and Puiseux fields*: the Laurent and Puiseux field constructions, initial forms, ramified
  substitutions, factor Hensel lifting and Newton–Puiseux belong to
  [FormalLaurentPuiseux](../FormalLaurentPuiseux/README.md); one polynomial geometry serves both
  roadmaps, and no second Laurent-specific polygon theory is built.
- *Compact operators*: Fredholm determinants, compactness, spectral decompositions and the
  matrix-minor and row estimates that bound Fredholm coefficients belong to
  [CompactOperators](../CompactOperators/README.md) (§1.2 and Layer 4). The comparison theorem
  here takes the coefficient inequalities as hypotheses.
- *Iwasawa theory*: measures, completed group algebras and Iwasawa modules belong to
  [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md). The formal and normed
  preparation theories are compared in §6.4, not identified without hypotheses.
- *Local fields*: the canonical normalised valuation and ramification index of a nonarchimedean
  local field are Tau Ceti's (`TauCeti.normalizedValuation`, `TauCeti.ramificationIndex`), the
  vocabulary of [LocalFieldsRamification](../../Completed/LocalFieldsRamification/README.md); §§1.3
  and 6.2 compare the discretely valued statements here with them.
- *Isocrystals and filtered modules*: isocrystal slopes, Dieudonné modules, filtered-module Hodge
  numbers, weak admissibility and cohomological Newton polygons belong to
  [FiniteFlatGroupsAndIntegralPadicHodgeTheory](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md)
  (§§R07.2.16 and R07.3.2) and [CrystallineCohomology](../CrystallineCohomology/README.md) (§CR.4.7).
  The slope data of §0.6 are coefficient-free rational slope data and do not depend on coefficient
  valuations or isocrystal theory, so that an isocrystal construction can supply rational slopes and
  multiplicities to them directly.
- *Banach-ring majorants*: the spectral transforms of
  [LocallyAnalyticDistributions](../LocallyAnalyticDistributions/README.md) §4.13 use compact-operator
  majorants; Banach-ring majorants, including nonreduced coefficients with only a submultiplicative
  norm, are not field-valued Newton polygons and are not treated here.

Frobenius and Newton polygons of isocrystals, Newton polytopes, Newton–Puiseux theory, Ore–Montes
algorithms, polygons of differential operators, and analytic Laurent and Robba rings are not part of
this roadmap.

## Exact supplier contracts

### From Mathlib

- Valuations: `AddValuation`, `AddValuation.map`, `Valuation`, `Valuation.toAddValuation`,
  `Valuation.RankOne` (with `Valuation.RankOne.hom`), `Valuation.IsRankOneDiscrete`,
  `Valuation.IsEquiv`, `Valuation.integer`, `NormedField.valuation`, `Valued.v`,
  `Valued.exists_coe_eq_v` (every value of the extended valuation on the completion is a value on
  `K`), `IsDiscreteValuationRing.addVal`, `Padic.addValuation`, `PadicComplex`, `spectralNorm`,
  `AlgebraicClosure`, `UniformSpace.Completion`, `IsUltrametricDist`.
- Series and polynomials: `PowerSeries`, `PowerSeries.IsRestricted`,
  `PowerSeries.IsRestricted.subring`, `PowerSeries.gaussNorm`, `PowerSeries.HasGaussNorm`,
  `PowerSeries.IsWeierstrassFactorization` and `PowerSeries.exists_isWeierstrassFactorization` (the
  ideal-adic preparation theorem), `Polynomial.IsDistinguishedAt`, `Polynomial.IsEisensteinAt` and
  `Polynomial.IsEisensteinAt.irreducible`, `Polynomial.roots`, `Polynomial.Splits`,
  `Polynomial.rootMultiplicity`, `Polynomial.IsMonicOfDegree`, `minpoly`, `LaurentSeries`,
  `HahnSeries.addVal`.
- Linear algebra: `Matrix.charpolyRev` and `Matrix.reverse_charpoly` (the reversed characteristic
  polynomial `det(1 - X A)` is the reverse of `det(X - A)`).
- Analysis and order: `ConvexOn`, `ConcaveOn`, `EReal`, `LinearGrowth.linearGrowthInf`, `Summable`,
  `Real.logb`, `Multiset`.

### From Tau Ceti

Paths are under `TauCeti/`; every declaration below is proved at the pin with the hypotheses stated
there.

- *Convex sequences* (`Analysis/Convex/Sequence/`): `TauCeti.finiteEdges`, `TauCeti.unitSlope`,
  `TauCeti.IsConvexSeq` (order-connected finite domain, monotone unit slopes on finite edges) with
  `TauCeti.IsConvexSeq.chord_inequality`, `TauCeti.IsConvexSeq.supportingLine_le`,
  `TauCeti.eq_coe_add_sum_unitSlope`, `TauCeti.IsConvexSeq.sup`, `TauCeti.IsConvexSeq.iSup`;
  `TauCeti.linearInterpolate`, `TauCeti.interpolationDomain`,
  `TauCeti.isConvexSeq_iff_convexOn_linearInterpolate`, `TauCeti.isConvexSeq_iff_convexOn_Icc`,
  `TauCeti.isConvexSeq_iff_convexOn_Ici`, `TauCeti.isConvexSeq_iff_exists_convexOn`,
  `TauCeti.le_iff_linearInterpolate_le`, `TauCeti.eq_iff_linearInterpolate_eq` (interpolation on the
  real interval spanned by the finite domain); `TauCeti.IsAdmissible`,
  `TauCeti.exists_convexSeq_le_iff`, `TauCeti.isAdmissible_inf_iff`,
  `TauCeti.isAdmissible_iff_bot_lt_linearGrowthInf`; `TauCeti.IsLowerConvexEnvelope` with
  `TauCeti.IsLowerConvexEnvelope.unique`, `TauCeti.lowerConvexEnvelope` (the `⊤` fallback on
  inadmissible input) with `TauCeti.isLowerConvexEnvelope_lowerConvexEnvelope`,
  `TauCeti.exists_isLowerConvexEnvelope_iff`, `TauCeti.lowerConvexEnvelope_of_not_isAdmissible`,
  `TauCeti.lowerConvexEnvelope_ne_top_iff` (the finite domain is the integer hull of the finite
  indices), `TauCeti.lowerConvexEnvelope_eq_of_forall_lt`, `TauCeti.lowerConvexEnvelope_eq_of_forall_gt`
  (first and last points), `TauCeti.lowerConvexEnvelope_add_affine` (translation and shear),
  `TauCeti.lowerConvexEnvelope_mono`, `TauCeti.lowerConvexEnvelope_idem`,
  `TauCeti.le_lowerConvexEnvelope`, `TauCeti.IsConvexSeq.lowerConvexEnvelope_eq`; the minimal-slope
  construction `TauCeti.secantSlopes`, `TauCeti.isSupportingLine_sInf_secantSlopes`,
  `TauCeti.lowerConvexEnvelope_eq_of_secantSlope_eq_sInf`,
  `TauCeti.lowerConvexEnvelope_eq_of_sInf_secantSlopes_notMem`,
  `TauCeti.lowerConvexEnvelope_eq_of_unbounded_minimal_secant_indices`,
  `TauCeti.unitSlope_lowerConvexEnvelope_eq_sInf_secantSlopes`,
  `TauCeti.IsLowerConvexEnvelope.comp_add_right`; vertices and truncation
  `TauCeti.IsLowerConvexEnvelope.eq_of_unitSlope_lt`,
  `TauCeti.IsLowerConvexEnvelope.eq_left_of_isFiniteFace`,
  `TauCeti.IsLowerConvexEnvelope.eq_right_of_isFiniteFace`,
  `TauCeti.IsLowerConvexEnvelope.eqOn_lowerConvexEnvelope_truncate_of_unitSlope_lt`; rationality
  `TauCeti.IsFiniteFace.exists_rat_eq_and_den_dvd`,
  `TauCeti.IsLowerConvexEnvelope.exists_rat_eq_and_den_dvd_of_isFiniteFace`,
  `TauCeti.IsFiniteFace.slope_eq_div`.
- *Supporting values and faces*: `TauCeti.supportingValue` (in `EReal`),
  `TauCeti.IsLowerConvexEnvelope.supportingValue_eq`, `TauCeti.IsConvexSeq.iSup_supportingValue_add`
  (Legendre reconstruction), `TauCeti.concaveOn_supportingValue_toReal`,
  `TauCeti.supportingValue_eq_coe_inf'`, `TauCeti.IsConvexSeq.exists_finset_supportingValue_eq_inf'`;
  `TauCeti.IsSupportingLine`, `TauCeti.supportingFace`, `TauCeti.IsFiniteFace` (absolute endpoints
  `l ≤ u` and contact set exactly `[l, u]`), `TauCeti.IsFiniteFace.unique`,
  `TauCeti.IsFiniteFace.lt_unitSlope`, `TauCeti.IsFiniteFace.left_eq_start_add_ncard_unitSlope_lt`,
  `TauCeti.IsFiniteFace.right_eq_start_add_ncard_unitSlope_le`,
  `TauCeti.IsFiniteFace.ncard_setOf_unitSlope_eq`, `TauCeti.IsConvexSeq.exists_isFiniteFace_of_finiteDomain`,
  `TauCeti.IsConvexSeq.exists_isFiniteFace_of_unbounded_unitSlope`,
  `TauCeti.IsConvexSeq.exists_isFiniteFace_of_lt_unitSlope`,
  `TauCeti.IsFiniteFace.exists_pos_supportingValue_eq_left`,
  `TauCeti.IsFiniteFace.exists_pos_supportingValue_eq_right`,
  `TauCeti.IsFiniteFace.hasDerivWithinAt_supportingValue_toReal_left`,
  `TauCeti.IsFiniteFace.hasDerivWithinAt_supportingValue_toReal_right`,
  `TauCeti.IsFiniteFace.differentiableAt_supportingValue_toReal_iff`,
  `TauCeti.IsConvexSeq.tendsto_div_iSup_unitSlope`,
  `TauCeti.linearGrowthInf_eq_iSup_unitSlope_lowerConvexEnvelope`.
- *Minkowski sums and order* (§§0.4, 0.7): `TauCeti.minkowskiSum`, `TauCeti.minkowskiSum_comm`,
  `TauCeti.minkowskiSum_assoc`, `TauCeti.minkowskiSum_ite_eq_zero`, `TauCeti.minkowskiSum_top`,
  `TauCeti.IsConvexSeq.minkowskiSum`, `TauCeti.minkowskiSum_add_eq_of_forall_lt`,
  `TauCeti.supportingValue_minkowskiSum`, `TauCeti.minkowskiSum_add_eq_add_iff`,
  `TauCeti.IsFiniteFace.minkowskiSum`, `TauCeti.IsFiniteFace.minkowskiSum_left_eq_iff`,
  `TauCeti.IsFiniteFace.minkowskiSum_right_eq_iff`, `TauCeti.FiniteSlopeData.slopeMultiset_minkowskiSum`,
  `TauCeti.lowerConvexEnvelope_inf_lowerConvexEnvelope`, `TauCeti.minkowskiSum_mono`;
  `TauCeti.setOf_ne_top_subset_of_le`, `TauCeti.le_iff_forall_sum_unitSlope_le`,
  `TauCeti.add_affine_le_add_affine_iff`.
- *Integer-indexed sequences* (§0.5): `TauCeti.IsIntConvexSeq`, `TauCeti.IsIntAdmissible`,
  `TauCeti.IsIntLowerConvexEnvelope`, `TauCeti.intLowerConvexEnvelope`,
  `TauCeti.exists_isIntLowerConvexEnvelope_iff`, `TauCeti.intLowerConvexEnvelope_extend`,
  `TauCeti.intLowerConvexEnvelope_comp_add_right`, `TauCeti.intLowerConvexEnvelope_eq_of_forall_lt`,
  `TauCeti.isIntConvexSeq_iff_forall_isConvexSeq`, `TauCeti.intSupportingValue`,
  `TauCeti.intSupportingValue_extend`, `TauCeti.IsIntConvexSeq.iSup_intSupportingValue_add`.
- *Slope data* (§0.6): `TauCeti.FiniteSlopeData` (start in `ℕ`, initial height, length, monotone
  slopes on `Fin length`) with `TauCeti.FiniteSlopeData.heights`,
  `TauCeti.FiniteSlopeData.isConvexSeq_heights`, `TauCeti.FiniteSlopeData.ofIsConvexSeq`,
  `TauCeti.FiniteSlopeData.heights_ofIsConvexSeq`, `TauCeti.FiniteSlopeData.ofIsConvexSeq_heights`,
  `TauCeti.FiniteSlopeData.heights_injective`, `TauCeti.FiniteSlopeData.map`,
  `TauCeti.FiniteSlopeData.slopeMultiset`, `TauCeti.FiniteSlopeData.count_slopeMultiset_of_isFiniteFace`;
  `TauCeti.InfiniteSlopeData` with the same API; `TauCeti.FiniteCompressedSlopeData` with
  `TauCeti.FiniteCompressedSlopeData.equivUnitSlopes` and `TauCeti.FiniteSlopeData.compress`;
  `TauCeti.TerminalRaySlopeData` with `TauCeti.InfiniteSlopeData.exists_terminalRay_expand_eq_iff`;
  `TauCeti.prefixSum` (`Algebra/BigOperators/Finset/PartialSum.lean`).
- *Additive valuations* (Layer 1): `WithZero.negLog`, `WithZero.orderAddIsoWithTop`
  (`Algebra/Order/GroupWithZero/NegLog.lean`); `Valuation.addVal`, `Valuation.addVal_map`,
  `Valuation.addValValueGroup` (`RingTheory/Valuation/ToAdditive.lean`);
  `AddValuation.eq_of_norm_eq_rpow`, `AddValuation.eq_map_of_norm_eq_rpow`
  (`RingTheory/Valuation/NormNormalization.lean`, for a normed division ring and bases `b, b' > 1`);
  `TauCeti.spectralValuation` (`RingTheory/Valuation/Spectral.lean`);
  `Valuation.linearIndependent_of_map_smul_ne`; `AddValuation.den_dvd_of_map_eq_ratCast`,
  `AddValuation.le_finrank_of_map_eq_inv_natCast` (`RingTheory/Valuation/Denominator.lean`);
  `LaurentSeries.realAddVal`, `TauCeti.LaurentSeries.valuation_eq_exp_neg_order`;
  `TauCeti.NormedRing.PseudoUniformizer.logGauge_eq_map_padicAddValuation`;
  `IsUltrametricDist.norm_eq_of_norm_sub_lt_left`; `TauCeti.normalizedValuation`,
  `TauCeti.ramificationIndex`, `TauCeti.ramificationIndex_eq_iff`,
  `TauCeti.ramificationIndex_mul_inertiaDegree`,
  `TauCeti.dvd_ramificationIndex_of_normalizedValuation_pow_eq` (`NumberTheory/LocalField/`, for
  nonarchimedean local fields).
- *Coefficient polygons* (`NumberTheory/NewtonPolygon/`; the norm-compatible results assume
  `1 < b` and `∀ x ≠ 0, ‖x‖ = b ^ (-(v x).untop₀)` for `v : AddValuation K (WithTop ℝ)` on a normed
  division ring): `PowerSeries.newtonPolygon`, `Polynomial.newtonPolygon`, `Polynomial.newtonSlopes`,
  `PowerSeries.newtonSlopeMultiplicity` with `PowerSeries.newtonSlopeMultiplicity_eq_of_isFiniteFace`;
  `PowerSeries.isAdmissible_addValuation_coeff_iff_exists_isRestricted`,
  `PowerSeries.newtonPolygon_smul`, `PowerSeries.newtonPolygon_X_pow_mul`,
  `PowerSeries.newtonPolygon_rescale`, `PowerSeries.newtonPolygon_map`,
  `Polynomial.newtonPolygon_reverse`, `Polynomial.newtonPolygon_map`, `Polynomial.newtonSlopes_C_mul`,
  `Polynomial.newtonSlopes_reverse`, `Polynomial.card_newtonSlopes`, `Polynomial.sum_newtonSlopes`;
  `PowerSeries.norm_coeff_mul_rpow_pow_eq`, `PowerSeries.hasGaussNorm_iff_supportingValue_ne_bot`,
  `PowerSeries.supportingValue_newtonPolygon_eq_neg_logb_gaussNorm`,
  `PowerSeries.isDistinguished_iff_isGreatest_supportingFace`,
  `PowerSeries.isLowestDominant_iff_isLeast_supportingFace`;
  `Polynomial.forall_mem_newtonSlopes_eq_iff`,
  `Polynomial.forall_mem_newtonSlopes_eq_iff_norm_coeff_mul_rpow_pow_le`;
  `PowerSeries.le_newtonPolygon`, `Polynomial.heights_le_newtonPolygon_iff`,
  `PowerSeries.heights_le_newtonPolygon_iff`, `Matrix.heights_le_newtonPolygon_charpolyRev_of_principalMinor`,
  `Matrix.prefixSum_le_newtonPolygon_charpolyRev_of_mul_mul_eq_diagonal`,
  `Matrix.newtonPolygon_charpolyRev_apply_card_of_mul_mul_eq_diagonal`,
  `Matrix.newtonSlopes_charpolyRev_eq_map_roots_map`;
  `Polynomial.newtonPolygon_mul`, `Polynomial.newtonSlopes_mul`, `PowerSeries.IsEntire.newtonPolygon_mul`,
  `PowerSeries.IsEntire.newtonSlopeMultiplicity_mul`, `PowerSeries.IsEntire.newtonPolygon_mul_eqOn_initialSegment`,
  `PowerSeries.addValuation_coeff_mul_eq_add_of_isLeast`,
  `PowerSeries.addValuation_coeff_mul_eq_add_of_isGreatest`,
  `PowerSeries.supportingValue_newtonPolygon_mul_of_isRestricted`;
  `Polynomial.newtonSlopes_eq_map_roots_map` (for a valuation on a domain extending `v` and a split
  image), `Polynomial.newtonSlopes_eq_replicate`, `Polynomial.newtonSlopes_multiset_prod_X_sub_C`,
  `Polynomial.card_filter_roots_lt_addValuation`, `Polynomial.card_filter_roots_le_addValuation`,
  `Polynomial.card_filter_roots_addValuation_eq`; `PowerSeries.le_newtonPolygon_add`,
  `PowerSeries.lowerConvexEnvelope_inf_le_newtonPolygon_add`;
  `PowerSeries.newtonPolygon_eq_map_of_norm_eq_rpow`, `Polynomial.newtonSlopes_eq_map_of_norm_eq_rpow`;
  `PowerSeries.radius_eq_exp_linearGrowthInf`, `PowerSeries.radius_eq_exp_iSup_unitSlope_newtonPolygon`,
  `PowerSeries.radius_eq_zero_iff_not_isAdmissible`,
  `PowerSeries.IsEntire.finite_setOf_unitSlope_newtonPolygon_le`,
  `PowerSeries.IsEntire.tendsto_unitSlope_newtonPolygon`; `Polynomial.irreducible_of_forall_mem_newtonSlopes_eq_div`,
  `Polynomial.irreducible_of_forall_mem_newtonSlopes_eq`, `Polynomial.irreducible_of_eisenstein`,
  `Polynomial.newtonSlopes_eq_replicate_of_eisenstein`, `Polynomial.den_dvd_natDegree_of_dvd`,
  `Polynomial.card_normalizedFactors_mul_den_le_natDegree` (for `v` integer-valued on nonzero
  elements); `Polynomial.den_dvd_of_forall_mem_newtonSlopes_eq`,
  `minpoly.den_dvd_of_forall_mem_newtonSlopes_eq` (for an integer normalisation of `L` with
  denominator `e`); `PowerSeries.isLeast_range_newtonPolygon_map`,
  `PowerSeries.isLeast_setOf_newtonPolygon_map_eq`.
- *Restricted, entire and preparation* (`RingTheory/PowerSeries/`): `TauCeti.PowerSeries.IsDistinguished`
  (the Gauss norm at `c` is attained in degree `s` and strictly exceeds every later weighted
  coefficient) and `TauCeti.PowerSeries.IsLowestDominant` (positive Gauss norm attained in degree
  `s`, strictly exceeding every earlier one), with `TauCeti.PowerSeries.exists_isDistinguished`,
  `TauCeti.PowerSeries.exists_isLowestDominant`, `TauCeti.PowerSeries.IsDistinguished.unique`,
  `TauCeti.PowerSeries.IsDistinguished.le_of_le`, `TauCeti.PowerSeries.IsLowestDominant.le_of_le`,
  `TauCeti.PowerSeries.IsDistinguished.mul`, `TauCeti.PowerSeries.IsLowestDominant.mul` (ultrametric
  coefficients), `TauCeti.PowerSeries.IsDistinguished.map`,
  `TauCeti.PowerSeries.gaussNorm_mul_of_isRestricted`, `TauCeti.PowerSeries.hasGaussNorm_of_isRestricted`,
  `PowerSeries.IsRestricted.finite_setOf_exists_norm_coeff_mul_pow_eq_gaussNorm`,
  `PowerSeries.IsRestricted.exists_nat_gaussNorm_eq_sup'`, `TauCeti.PowerSeries.not_isRestricted_mk_pow`;
  perturbation `TauCeti.PowerSeries.gaussNorm_eq_of_gaussNorm_sub_lt`,
  `TauCeti.PowerSeries.isDistinguished_iff_of_gaussNorm_sub_lt`,
  `TauCeti.PowerSeries.isLowestDominant_iff_of_gaussNorm_sub_lt`,
  `TauCeti.PowerSeries.gaussNorm_sub_lt_of_coeff_le_of_tail_le`;
  preparation over a complete ultrametric field `TauCeti.PowerSeries.IsDistinguished.existsUnique_isUnit_isMonicOfDegree_mul_eq`,
  `TauCeti.PowerSeries.isMulDistinguished_iff_gaussNorm_eq`,
  `TauCeti.PowerSeries.isUnit_iff_isDistinguished_zero` (complete coefficients),
  `TauCeti.PowerSeries.IsDistinguished.exists_isMonicOfDegree_mul_eq_of_preparations`,
  `TauCeti.PowerSeries.IsDistinguished.norm_mem_Ioc_of_aeval_eq_zero`,
  `TauCeti.PowerSeries.IsMulDistinguished.map_weierstrassDiv`,
  `TauCeti.PowerSeries.IsDistinguished.encard_setOf_evalAt_eq_zero_le` (Strassmann);
  `PowerSeries.evalAt`, `PowerSeries.IsRestricted.hasSum_evalAt`, `PowerSeries.IsRestricted.evalAtHom`
  (complete ultrametric targets); `PowerSeries.radius`, `PowerSeries.isRestricted_of_lt_radius`,
  `PowerSeries.not_isRestricted_of_radius_lt`, `PowerSeries.radius_inv_eq_limsup`,
  `PowerSeries.radius_eq_top_iff`, `PowerSeries.radius_coe`; `PowerSeries.IsEntire`,
  `TauCeti.PowerSeries.IsEntirePreparation`, `TauCeti.PowerSeries.existsUnique_entire_mul_add_eq`;
  `PowerSeries.IsGoodZero` (multiplicity by Hasse derivatives), `PowerSeries.isGoodZero_coe_iff_of_field`,
  `PowerSeries.isGoodZero_iff_order_taylor_eq`, `PowerSeries.IsGoodZero.exists_eq_one_sub_C_mul_X_pow_mul`;
  the formal preparation `PowerSeries.muInvariant`, `PowerSeries.lambdaInvariant`,
  `PowerSeries.exists_pow_mul_distinguished_mul_unit` (complete discrete valuation ring, any residue
  field), `PowerSeries.C_pow_mul_unit_mul_inj`, `PowerSeries.muInvariant_mul`,
  `PowerSeries.lambdaInvariant_mul`; its normed comparison
  `TauCeti.PowerSeries.eventually_isDistinguished_and_isLowestDominant_map_lambdaInvariant`,
  `PowerSeries.IsWeierstrassFactorization.eventually_eq_map_of_mul_eq`,
  `TauCeti.PowerSeries.isDistinguished_one_map_iff`, `TauCeti.PowerSeries.isLowestDominant_one_map_iff`,
  `PowerSeries.isRestricted_map_of_abs_lt_one`.
- *Linear algebra*: `Matrix.coeff_charpolyRev` (coefficients of `det(1 - X A)` as signed sums of
  principal minors) and `Matrix.exists_valuation_det_submatrix_eq_prefixSum_of_mul_mul_eq_diagonal`
  (minimal minor valuations from a Smith form) (`LinearAlgebra/Matrix/`).

### From TauCetiRoadmap.RestrictedPowerSeries

The restricted-series theory of its Layers 0–1 (carriers, coefficient maps, Gauss norms and
multiplicativity), §§2.1–2.4 (evaluation, translation, Hasse derivatives, Strassmann's bound), §3.2
(units of restricted algebras), Layer 4 (Weierstrass division and preparation, with uniqueness and
compatibility with coefficient maps) and §7 (open-disc and entire series, entire division). This
roadmap uses them through the Tau Ceti declarations listed above, with the hypotheses stated there:
complete ultrametric coefficients for preparation and for the complete form of the unit criterion.

### From TauCetiRoadmap.FormalLaurentPuiseux

L1: the Laurent-series field on Mathlib's native `LaurentSeries` carrier with its order of vanishing
(`HahnSeries.orderTop`), whose real form is Tau Ceti's `LaurentSeries.realAddVal`; §1.2 compares it
with the valuation normalisations here.

## References

- **[Koblitz]** N. Koblitz, *p-adic Numbers, p-adic Analysis, and Zeta-Functions*, second edition,
  GTM 58, 1984, Chapter IV §§3–4: coefficient polygons, convergence and roots. Translate each slope
  convention explicitly.
- **[Kedlaya]** K. S. Kedlaya, [*Newton polygons*, MIT 18.787 notes](https://kskedlaya.org/18.787/newton-poly.pdf),
  2007, §§1–3, specialised to the untwisted case. The notes plot `(-i, v(a_i))`; their slopes and
  supporting parameter have the opposite sign to ours.
- **[KedlayaNumerical]** K. S. Kedlaya, [*A little p-adic numerical analysis*, MIT 18.787 notes](https://kskedlaya.org/18.787/numerical.pdf),
  2007, §3, especially the minor description of Hodge heights and Theorem 16. We use `det(1 - TU)`
  and anchor the finite full-rank comparison at `(0, 0)`.
- **[Lazard]** M. Lazard, [*Les zéros d'une fonction analytique d'une variable sur un corps valué
  complet*](https://www.numdam.org/item/PMIHES_1962__14__47_0/), Publications Mathématiques de
  l'IHÉS 14 (1962), 47–75. §1 distinguishes extremal coefficient indices from geometric vertices at
  convergence endpoints; Proposition 1 gives the product interface; §3 gives disc factors; (4.13) is
  the whole-line product. The paper's variable is a valuation threshold, corresponding here to `-σ`,
  not the logarithm of the radius.
- **[BGR]** S. Bosch, U. Güntzer and R. Remmert, *Non-Archimedean Analysis*, Grundlehren 261, 1984,
  §§3.2 and 5.2. The analytic library is supplied by RestrictedPowerSeries; the Newton reading is
  developed here.
- **[Neukirch]** J. Neukirch, *Algebraic Number Theory*, Grundlehren 322, 1999, Chapter II §§3–4, 6,
  8: valuations, completion and extensions.
- **[Washington]** L. Washington, *Introduction to Cyclotomic Fields*, second edition, GTM 83, §7.1:
  formal `p`-adic preparation and its invariants.
- **[NSW]** J. Neukirch, A. Schmidt and K. Wingberg, *Cohomology of Number Fields*, second edition,
  (5.3.1)–(5.3.4), pp. 289–290: formal preparation over a complete discrete valuation ring. The Lean
  supplier is Mathlib's ideal-adic preparation theorem.
