# Roadmap: stratified spaces, tubular data and tame topology

**Summary.** Build the general topology of spaces cut into strata indexed by a poset, with conical
charts and exit paths; the face structure of manifolds with corners; the unfolding of a Thom–Mather
space into manifolds with corners joined by fibrations, through its tubes, retractions and control
functions; and, on the tame side, the triangulation and conical structure of definable sets, their
`C^p` cells and their Whitney stratifications. The carriers are `Stratification X P` (a map to a
partial order `P`, continuous for the upper-set topology), the open cone `OpenCone L` with the
uniform-collar topology, the exit-path category `ExitPathCategory s` (a quotient of Mathlib's free
category `CategoryTheory.Paths` on the quiver of exit paths), Mathlib's
`Geometry.SimplicialComplex` and manifolds modelled on `modelWithCornersEuclideanQuadrant n`, Tau
Ceti's `TauCeti.IsSemialgebraic`, the o-minimal structures of ShimuraVarieties §3.4b, and the
smooth stratified spaces and Thom–Mather control data of AlgebraicTopologyPartII §§16.1a–16.1b.
The end theorems are: for a stratification over a subsingleton poset,
`ExitPathCategory s ≌ FundamentalGroupoid X`; in the exit-path category of an open cone the apex
has exactly one morphism to every object; for `S² = ℂ ∪ {∞}` stratified by `{∞} < ℂ`, the
exit-path category is equivalent to the poset `Fin 2`; the triangulation theorem for an o-minimal
expansion of an ordered field, with the semialgebraic triangulation on `ℝ` as a specialization;
and, for a Thom–Mather space over a finite poset with normalised control data, its unfolding into
manifolds with embedded corners joined by fibrations, and the reconstruction of the space from the
unfolded data by gluing. Grothendieck's *Esquisse d'un programme*, §5, proposes a "tame topology"
suited to stratified structures; o-minimal structures are a framework for it.

Suggested homes: `TauCeti/Topology/Stratified/` for Layers 1–3, `TauCeti/Geometry/OMinimal/` for
Layers 4 and 7, `TauCeti/Geometry/Manifold/Corners/` for Layer 5, and
`TauCeti/Geometry/Stratified/` for Layer 6.

## Scope and ownership

**Owned here.** Stratifications over posets, the frontier condition and the incidence order,
open cones, conically stratified spaces, exit paths and the exit-path category (Layers 1–3); the
triangulation theorem for o-minimal expansions of ordered fields, the conical stratification of
definable sets and the semialgebraic triangulation (Layer 4); the face structure of manifolds with
corners built on the abstract boundary (depth, the immersion `j`, products), embedded corners,
intersections of boundary hypersurfaces and collars of boundary hypersurfaces (Layer 5); unfolding
data, gluing, the unfolding of a Thom–Mather space and reconstruction (Layer 6); `C^p` cells and
Whitney stratifications of definable sets (Layer 7). DifferentialGeometry 5.5 owns the abstract
boundary `∂̃M` of a manifold with corners, which it uses for Stokes' theorem; Layer 5 consumes it
and builds the face structure on top of it, defining no second boundary carrier.

**Left to other roadmaps.** General o-minimal structures and definable maps, monotonicity, cell
decomposition, uniform finiteness, dimension, definable choice, curve selection and the o-minimality
of semialgebraic sets on `ℝ` are ShimuraVarieties §§3.4b–3.4e, consumed in Layers 4 and 7 with its
coordinates (Convention 7). Smooth stratified spaces, Whitney's condition (b), Thom–Mather control
data and their normalisation, Mather's existence theorem, controlled vector fields and Thom's first
isotopy lemma, with the local conical structure, are AlgebraicTopologyPartII §§16.1a–16.1e, consumed
in Layers 6 and 7; its §16.2 is the equivariant form for an involution. The incidence order of a
smooth stratification in §16.1a, with its restriction and product rules, is the specialization of
1.3 to smooth strata; Layers 1–3 work over any poset, with no smoothness. Semialgebraic sets,
cylindrical algebraic decomposition, Tarski–Seidenberg and sign determination are
RealAlgebraicGeometry (completed); its exports in Tau Ceti are consumed by 4.3. Semianalytic sets,
Nash and analytic regularity of simplices, semianalytic dimension (R1.1) and Łojasiewicz's
triangulation are RealAnalyticGeometry (R1, R2, R5). The o-minimality of `ℝ_an,exp`, and hence of
its reducts `ℝ_an` and `ℝ_exp`, is ShimuraVarieties §3.5a. The CAD-based construction of
triangulations of compact semialgebraic sets with its lifting data, the definition of semialgebraic
dimension from CAD cells, and its product and fibre-dimension laws are AffineMorseLefschetz A4.1;
compact 4.3 implies its existential triangulation theorem, while its lifting data, which
RealAnalyticGeometry R2.1 consumes, are not supplied by 4.1. The Euler characteristic of spaces of
finite CW type is AlgebraicTopology Stage 7. The collar theorem for manifolds with boundary and the
tubular neighbourhood theorem are GeometricTopology Layer 1.

**Out of scope.** Subanalytic sets; constructible sheaves on stratified spaces, exit-path
∞-categories and 2-categories, constructible stacks and hypercoverings; intersection homology;
Whitney's condition (a) and Verdier's condition (w) as subjects; the second isotopy lemma; the
o-minimal Euler characteristic of definable sets (van den Dries, Chapter 4, §2). Not targets either:
in an o-minimal structure, a definable subset `X ⊆ Rⁿ` is definably compact (every definable curve
`(a, b) → X` has limits in `X` at both ends) iff it is closed and bounded (Peterzil–Steinhorn 1999,
Theorem 2.1, as recalled in Andújar Guerrero 2025, Remark 5.9, whose Theorem A compares the notions
of definable compactness); smooth `Cᵏ` manifolds with corners have `Cᵏ` triangulations (the
Cairns–Whitehead theorem, stated with corners in Murayama–Shiota 2013, p. 160); for finite `p` and
an o-minimal expansion of the real field, compact definable `Cᵖ` manifolds with corners have
definable triangulations, `Cᵖ` on open faces (Commelin–Huber, appendix to Huber 2022,
Proposition A.1).

## Conventions

1. **Stratifications are maps to posets.** A stratification of a space `X` by a partial order `P`
   is `s : X → P` with `s⁻¹(U)` open for every upper set `U`: continuity for Mathlib's upper-set
   topology `Topology.WithUpperSet P`, the Alexandrov topology of Lurie, *Higher Algebra*,
   Definition A.5.1. The stratum of `p` is `X_p = s⁻¹{p}`, and `closure X_p ⊆ s⁻¹(Iic p)`, since
   `{q | ¬ q ≤ p}` is an upper set: closures go **down** the poset. Sources that index strata by
   dimension or codimension are translated to this convention. Witness: on `ℝ` over `{0 < 1}`,
   `s(0) = 0` and `s(x) = 1` for `x ≠ 0` is a stratification (`s⁻¹{1} = ℝ ∖ {0}` is open); the
   reversed assignment is not (`{1}` is an upper set and its preimage `{0}` is not open).
2. **Strata need not be nonempty or connected**, and `s` need not be surjective; statements that
   need nonempty or connected strata carry the hypothesis. Witness: the constant map `ℝ → {0 < 1}`
   with value `1` is a stratification whose stratum `0` is empty; `ℝ` over `{0 < 1}` with `s = 0`
   exactly on `{−1, 1}` is a stratification whose stratum `0` is disconnected.
3. **The frontier condition** (if `X_p ∩ closure X_q ≠ ∅` then `X_p ⊆ closure X_q`) is a
   hypothesis, never part of the definition. Witness: `X = [0, 1) ∪ {2}` with stratum `0` the set
   `{0, 2}` and stratum `1` the interval `(0, 1)` is a stratification; `closure X_1 = [0, 1)` meets
   `X_0` in `0` but does not contain `2`.
4. **The open cone** `C(L) = {apex} ⊔ L × (0, ∞)` (`OpenCone L`) carries the uniform-collar
   topology: `U` is open when `U ∩ L × (0, ∞)` is open and, if `apex ∈ U`, `U ⊇ L × (0, ε)` for
   some `ε > 0` (Lurie, *Higher Algebra*, Definition A.5.3). For compact `L` it is the quotient
   topology of `L × [0, ∞)` with `L × {0}` collapsed, by the tube lemma; in general it is coarser.
   If `L` is stratified over `P` with every index `> p`, `C(L)` is stratified over `P` with the
   apex sent to `p`. Witness: for `L = ℕ` discrete, `{apex} ∪ ⋃ₙ {n} × (0, 1/(n+1))` is open in
   the quotient topology (its preimage in `ℕ × [0, ∞)` is a union of open slices) but not in
   `C(ℕ)`, since it contains no `ℕ × (0, ε)`.
5. **Exit paths** are paths `γ : [0, 1] → X` with `t ↦ s(γ t)` monotone; two exit paths with the
   same endpoints are *exit-homotopic* when they are homotopic rel endpoints through exit paths.
   Composition is Mathlib's `Path.trans`, first `γ` then `δ`. Witness: in `ℝ` stratified as in
   Convention 1, `t ↦ t` from `0` to `1` is an exit path and `t ↦ 1 − t` from `1` to `0` is not
   (the index goes from `1` to `0`).
6. **Depth.** For a stratification over a finite `P` satisfying the frontier condition, the depth
   of a nonempty stratum `p` is the largest `k` with a chain `p = p₀ < p₁ < ⋯ < p_k` in the
   incidence order (1.3); maximal strata, among them the nonempty open strata, have depth `0`, as
   in Albin, Leichtnam, Mazzeo and Piazza, §2.1. Ayala–Francis–Tanaka, Definition 2.4.4, use the
   codimension `dim_x X − dim_x X_{s(x)}` instead, which is at least the chain depth (Nocera–Volpe,
   Remark 2.21). The depth of a point of a manifold with corners (5.1) is a different number, its
   number of vanishing corner coordinates; 6.6 uses that one. Witness: in `ℝ` stratified as in
   Convention 1 the point stratum has depth `1` and the open stratum depth `0`; in the quadrant
   `[0, ∞)²` stratified by its four faces the origin has depth `2`, equal to its corner depth;
   `ℝ²` stratified by `{0} < ℝ² ∖ {0}` separates the two notions, with chain depth `1` at the
   origin against codimension `2`.
7. **Coordinates for tame geometry.** Definable sets live in `Fin n → R`, as in ShimuraVarieties
   §3.4b. A cylinder over `Fin n → R` adds coordinate `0`: the point over `x` at height `t` is
   `Fin.cons t x`, and the projection is `Fin.tail`, as in RealAlgebraicGeometry and Tau Ceti's
   `TauCeti.IsCAD`, so that cylindrical algebraic decompositions are cell decompositions without
   reindexing. Graphs of maps
   `(Fin m → R) → (Fin n → R)` are subsets of `Fin (m + n) → R` via `Fin.append`. Witness:
   `Fin.tail (Fin.cons t x) = x` and `Fin.cons t x 0 = t`; the graph of `x ↦ x 0 ^ 2` on
   `Fin 1 → ℝ` contains `Fin.append ![2] ![4] = ![2, 4]`.
8. **Smoothness.** Smooth means `C^∞`. As in AlgebraicTopologyPartII §16.1a, a stratum of a
   smooth stratified space is the image of a topological embedding of a nonempty boundaryless
   smooth manifold modelled on `EuclideanSpace ℝ (Fin d)`, `d` depending on the stratum.
   Submersions are Mathlib's `Manifold.IsSubmersionAt`. Witness: the image of the injective
   immersion `t ↦ (sin 2t, sin t)` of `(−π, π)` is a figure eight, and with the subspace topology
   no neighbourhood of the origin is homeomorphic to an interval (removing the origin from a small
   connected neighbourhood leaves four components); it is not a stratum.
9. **Manifolds with corners** are Hausdorff, second-countable smooth manifolds modelled on
   `EuclideanQuadrant n` through `modelWithCornersEuclideanQuadrant n`, with the face structure
   of 5.1; from 5.2 on they have embedded corners (5.2). Witness: the four corners of `[0, 1]²`
   have depth `2` and each lies on two boundary hypersurfaces; the corner of the teardrop of 5.2
   has depth `2` and lies on one.
10. **Fibrations** are locally trivial fibre bundles given by Mathlib's `Bundle.Trivialization`:
    `p : E → B` with fibre `F` is locally trivial when every `b` lies in the base set of some
    `Bundle.Trivialization F p`. Hurewicz and Serre fibrations are not used. Witness:
    `x ↦ x / |x|` from `ℝ² ∖ {0}` to the circle is trivial with fibre `(0, ∞)`; the first
    projection from `[0, 1] × ℝ ∖ {(1/2, 0)}` to `[0, 1]` is not locally trivial at `1/2`, whose
    fibre `ℝ ∖ {0}` is disconnected while the nearby fibres are `ℝ`.
11. **Finite posets.** Strata are indexed by a finite poset in Layer 6 and in 7.3; Layers 1–3
    allow any partial order, and AlgebraicTopologyPartII §16.1a allows a locally finite family of
    strata over any index type. Witness: `ℝ` over `ℤ` with `s(x) = ⌈x⌉` is a stratification (the
    nonempty proper upper sets of `ℤ` are the `Ici n`, with preimages `(n − 1, ∞)`) with infinitely
    many strata; Layer 6 excludes it.

## Exact supplier contracts

**From Mathlib** (at the pins).

- Topology: `Topology.WithUpperSet`, `Topology.IsUpperSet`,
  `Topology.IsUpperSet.closure_eq_lowerClosure`, `Topology.IsUpperSet.specializes_iff_le`,
  `IsUpperSet`, `IsLocallyClosed`, `closure`, `frontier`, `Topology.IsOpenEmbedding`,
  `Homeomorph`, `OnePoint`, `OnePoint.isOpen_range_coe`.
- Paths and categories: `Path`, `Path.trans`, `Path.refl`, `Path.Homotopy`,
  `Path.Homotopy.eval`, `Path.Homotopic`, `FundamentalGroupoid`, `CategoryTheory.Paths`,
  `CategoryTheory.Paths.of`, `CategoryTheory.Quotient`, `HomRel`, `Preorder.smallCategory`,
  `CategoryTheory.Equivalence`.
- Bundles and manifolds: `Bundle.Trivialization`, `IsManifold`, `Manifold.IsSubmersionAt`,
  `Manifold.IsImmersionAt`, `EuclideanQuadrant`, `modelWithCornersEuclideanQuadrant`,
  `ModelWithCorners.boundary`, `ModelWithCorners.interior`, `tangentConeAt`.
- Combinatorics: `Geometry.SimplicialComplex`, `Fin.cons`, `Fin.tail`, `Fin.append`.

**From Tau Ceti** (at the pin).

- `TauCeti.IsSemialgebraic` (`TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean`) and
  `TauCeti.IsSemialgebraicOn` (`TauCeti/Geometry/RealAlgebraic/Semialgebraic/Function.lean`).
- `TauCeti.AbstractSimplicialComplex.orderComplex`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean`), whose faces are the nonempty
  finite chains of a poset; `AbstractSimplicialComplex.Realization`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean`);
  `TauCeti.IsTriangulable` (`TauCeti/Topology/Triangulable/Basic.lean`).
- `TauCeti.IsCollar` and `TauCeti.IsLocallyCollared`
  (`TauCeti/Geometry/Manifold/Boundary/Collar/Global.lean`), and Brown's collaring theorem
  `TauCeti.IsLocallyCollared.isCollared` (`TauCeti/Geometry/Manifold/Boundary/Collar/Brown.lean`).

**From ShimuraVarieties.** With the hypotheses as stated there:

- §3.4b: o-minimal structures `TauCetiRoadmap.ShimuraVarieties.OMinimalStructure` on a linearly
  ordered type, in the coordinates of Convention 7; maps definable on a set by their graphs
  (`TauCetiRoadmap.ShimuraVarieties.OMinimalStructure.DefinableMapOn`); o-minimal expansions of
  the real field; and the semialgebraic structure on `ℝ`,
  `TauCetiRoadmap.ShimuraVarieties.exists_oMinimalStructure_isSemialgebraic` (4.1, 4.3, Layer 7).
- §3.4c: monotonicity, cells, both parts of the cell decomposition theorem and uniform finiteness,
  over a nonempty dense linear order without endpoints with its order topology (4.1, 7.1).
- §3.4d: dimension in `WithBot ℕ∞`, with its independence of the decomposition and its union,
  image, frontier and fibre laws (4.1, 7.1).
- §3.4e: definable choice and curve selection for an o-minimal structure on an ordered abelian
  group with definable addition (4.1).

**From AlgebraicTopologyPartII.** With the hypotheses as stated there (Hausdorff, locally compact,
second-countable spaces with a locally finite family of strata; closed subsets of Hausdorff,
second-countable, boundaryless manifolds):

- §16.1a: smooth stratifications
  (`TauCetiRoadmap.AlgebraicTopologyPartII.IsSmoothStratification`) and their incidence order;
  Whitney's condition (b) and Whitney stratifications
  (`TauCetiRoadmap.AlgebraicTopologyPartII.IsWhitneyStratification`); the frontier condition for
  the open simplices of a realization (1.3, Layer 6, 7.2).
- §16.1b: control data (`TauCetiRoadmap.AlgebraicTopologyPartII.ControlData`), their shrinking
  and restriction, and their normalisation, including its properness clause (Layer 6).
- §16.1c: existence of normalised control data on a Whitney stratified closed subset, compatible
  with a stratumwise submersion (7.3).
- §16.1d: controlled vector fields, their flows and lifts (6.3).
- §16.1e: Thom's first isotopy lemma in controlled and embedded forms, the local triviality of
  tubes and the local conical structure (6.3, 6.7).

**From RealAlgebraicGeometry** (completed). Semialgebraic sets and maps, through the Tau Ceti
declarations above (4.3).

**From RealAnalyticGeometry.** R2.1's comparison of a finite `Geometry.SimplicialComplex ℝ E` with
the realization carrier (4.1, the `TauCeti.IsTriangulable` corollary).

**From GeometricTopology.** Layer 1: the collar theorem for manifolds with boundary (2.3(a)) and
the tubular neighbourhood theorem for closed submanifolds (2.3(d)).

**From DifferentialGeometry.** 5.5: the abstract boundary `∂̃M` of a manifold with corners, the
pairs of a point and a local face through it, a manifold with corners one dimension down, with its
map to `M` whose fibre over `x` has as many points as `x` has local faces (5.1).

Neither pin has stratifications, open cones, exit paths, o-minimal structures, control data, or the
abstract boundary of a manifold with corners.

## How to read the build

Layers 1–3 are topological and rest on Mathlib, with GeometricTopology Layer 1 for two examples of
2.3 and AlgebraicTopologyPartII §16.1a for the open simplices of 1.3: stratifications and the
incidence order, then open cones and conical charts, then exit paths and the exit-path category
with its structure theorems. Layer 4 applies the o-minimal theory of ShimuraVarieties
§§3.4b–3.4e: the triangulation theorem, the conical stratification of definable sets through 2.3,
and the semialgebraic specialization, with the comparisons of 4.1 and 4.3 with RealAnalyticGeometry
R2.1 and AffineMorseLefschetz A4.1. Layer 5 builds the face structure of manifolds with corners on
DifferentialGeometry 5.5's abstract boundary, Mathlib's quadrant model and Tau Ceti's collars.
Layer 6 unfolds a Thom–Mather space of AlgebraicTopologyPartII §§16.1a–16.1e into the manifolds
with corners of Layer 5 and reconstructs it. Layer 7 combines ShimuraVarieties' o-minimal theory
with AlgebraicTopologyPartII's Whitney stratifications and control data for definable sets over
`ℝ`, and applies Layer 6 to closed semialgebraic sets.

## Layer 1: stratified spaces over a poset

### 1.1 Stratifications

Define `Stratification X P` (Convention 1), with the strata `X_p`. Prove: a map is a
stratification exactly when it is continuous into `Topology.WithUpperSet P`; `s⁻¹(Ici p)` is open
and `s⁻¹(Iic p)` is closed; `closure X_p ⊆ s⁻¹(Iic p)`; each `X_p = s⁻¹(Ici p) ∩ s⁻¹(Iic p)` is
locally closed; the strata partition `X` (Lurie, *Higher Algebra*, Definition A.5.1).
*Needs:* Mathlib `Topology.WithUpperSet`, `IsUpperSet`, `IsLocallyClosed`.

**Checks.**

- On the Sierpiński space `{o, c}` with `{o}` open over `{0 < 1}`, `s(c) = 0, s(o) = 1` is a
  stratification and `s(c) = 1, s(o) = 0` is not (`s⁻¹{1} = {c}` is not open); a definition by
  preimages of lower sets would accept the second and reject the first.
- On the discrete space `{a, b}` every map is a stratification, including `s(a) = 0 < 1 = s(b)`;
  then `closure X_1 = {b}`, so the order of `P` need not be realised by closures (1.3).
- On `ℝ` over `{0 < 1 < 2}`, `s = 0` on `(−∞, 0]`, `1` on `(0, 1]`, `2` on `(1, ∞)` is a
  stratification (the upper sets `{2}`, `{1, 2}` have open preimages `(1, ∞)`, `(0, ∞)`), and its
  stratum `(0, 1]` is locally closed but neither open nor closed: local closedness cannot be
  strengthened.

### 1.2 Operations

Construct the restriction of a stratification to a subspace, the pullback along a continuous map,
the pushforward along a monotone map `P → Q`, products over `P × Q` with the product order, the
trivial stratification over `Unit`, and disjoint unions over `P`. Define stratified maps (a
continuous `f : X → Y` with a monotone `φ : P → Q` and `s_Y ∘ f = φ ∘ s_X`) and their category.
(Own; for smooth strata, restriction to open subsets and products are AlgebraicTopologyPartII
§16.1a.)
*Needs:* 1.1.

**Checks.**

- Pushing the stratification of Convention 1 forward along the order-reversing swap of `{0, 1}`
  gives the reversed assignment, which is not a stratification: monotonicity is needed.
- The product of two copies of Convention 1's `ℝ` over `{0 < 1}²` has four strata: the origin, the
  two punctured axes (indices `(0, 1)` and `(1, 0)`), and the complement of the axes; the preimage
  of the upper set `{(1, 1)}` is `(ℝ ∖ {0})²`, open.
- The restriction of Convention 1's `ℝ` to `[0, ∞)` has strata `{0}` and `(0, ∞)`; its pullback
  along a constant map to `0` is the constant stratification at `0`.

### 1.3 The frontier condition and the incidence order

Define the frontier condition (Convention 3). Prove: the relation `X_p ⊆ closure X_q` is a partial
order on the indices of nonempty strata, contained in the order of `P` (antisymmetry because
closures go down); a nonempty open stratum is maximal for it (an open set contained in `closure X_r`
meets `X_r`, and distinct strata are disjoint); for finite `P` with the frontier condition,
`closure X_q` is the union of the `X_p` with `X_p ⊆ closure X_q`, and `s` is a stratification over
the indices of its nonempty strata with this *incidence order*. The frontier condition is preserved
by products and by restriction to open subsets. For the realization of an abstract simplicial
complex stratified by its open simplices over the face poset, the frontier condition, with the
strict face order as incidence order, is AlgebraicTopologyPartII §16.1a. (Own; for smooth strata,
the incidence order with its restriction and product rules is AlgebraicTopologyPartII §16.1a.)
*Needs:* 1.1, 1.2; AlgebraicTopologyPartII §16.1a (open simplices of a realization).

**Checks.**

- Convention 3's `[0, 1) ∪ {2}` fails the frontier condition, while `[0, 1)` alone, with strata
  `{0}` and `(0, 1)`, satisfies it.
- On the discrete `{a, b}` with `s(a) = 0 < 1 = s(b)` the frontier condition holds and the
  incidence order is discrete: the open stratum `{a}` is maximal for it although `0` is not
  maximal in `P`, so maximality of open strata is a statement about the incidence order only.
- For `[0, 1]` stratified by `{0}`, `{1}` and `(0, 1)`, the incidence order is `{0} < (0, 1)` and
  `{1} < (0, 1)`, with `{0}` and `{1}` incomparable, as for the face poset of a `1`-simplex.

### 1.4 Chains of strata

For finite `P` with the frontier condition, the nonempty chains `p₀ < ⋯ < p_k` of the incidence
order are the faces of `TauCeti.AbstractSimplicialComplex.orderComplex` of that order; define the
depth of a stratum (Convention 6).
*Needs:* 1.3; Tau Ceti `TauCeti.AbstractSimplicialComplex.orderComplex`.

**Checks.**

- For `[0, 1]` with three strata, the order complex has three vertices and two edges, and its
  realization is an interval.
- For `[0, ∞)²` with four faces, the order complex has `4` vertices, `5` edges and `2` triangles
  (the chains origin `<` half-axis `<` open quadrant), Euler characteristic `4 − 5 + 2 = 1`.
- Depths: in `[0, ∞)²` the origin, the half-axes and the open quadrant have depths `2`, `1`, `0`;
  a definition by longest chains *ending* at the stratum would give `0`, `1`, `2`.

### Examples

`ℝ` with `{0} < ℝ ∖ {0}`; the faces of `[0, ∞)ⁿ` over the subsets of `Fin n` ordered by reverse
inclusion of the vanishing coordinates; realizations of simplicial complexes by open simplices.

### Dependencies

Mathlib, AlgebraicTopologyPartII §16.1a for the open simplices of 1.3, and Tau Ceti's simplicial
complexes for 1.4. Within the layer, 1.2 uses 1.1, 1.3 uses 1.1–1.2, and 1.4 uses 1.3.

## Layer 2: open cones and conically stratified spaces

### 2.1 Open cones

Define `OpenCone L` with `OpenCone.apex`, `OpenCone.mk`, the topology of Convention 4 and the cone
stratification `OpenCone.stratification p sL hp`. Prove: `OpenCone.mk` is an open embedding of
`L × (0, ∞)`; the sets `{apex} ∪ L × (0, ε)` form a neighbourhood basis of the apex; for compact
`L` the topology is the quotient topology (tube lemma); `C(L)` is contractible; `C(∅)` is a point;
`C(L)` is Hausdorff exactly when `L` is; a homeomorphism `L ≃ₜ L'` induces `C(L) ≃ₜ C(L')`;
`C(S^{n−1}) ≃ₜ ℝⁿ` with the apex at `0` (radial coordinates).
*Needs:* 1.1; Mathlib `Homeomorph`, `Topology.IsOpenEmbedding`.

**Checks.**

- `C(∅)` is one point, and `C(Fin 2)` is homeomorphic to `ℝ` with the apex at `0`, the two rays
  being the two points of `L`.
- Convention 4's `L = ℕ`: `{apex} ∪ ⋃ₙ {n} × (0, 1/(n+1))` is open in the quotient topology and
  not in `C(ℕ)`, so a definition by the quotient topology differs for `L = ℕ`; for countably
  compact `L`, such as `ω₁`, the two topologies agree.
- The hypothesis of the cone stratification is needed: for `L` a point of index `0` and the apex of
  index `1` over `{0 < 1}`, the preimage of the upper set `{1}` is `{apex}`, which is not open.

### 2.2 Conically stratified spaces

Define conically stratified spaces (Lurie, *Higher Algebra*, Definition A.5.5): every `x ∈ X_p` has
a stratum-preserving open embedding `Z × C(L) → X` onto a neighbourhood of `x` sending
`(z, apex)` to `x`, with `L` stratified by indices `> p`. Prove: open subsets, disjoint unions and
products of conically stratified spaces are conically stratified, the last through
`C(L) × C(L') ≃ₜ C(L'')` with `L''` the subspace `{max(t, t') = 1}` of `C(L) × C(L')` (heights
`t`, `t'`, the apex at height `0`), stratified over `P × P'` by indices `> (p, p')`; the property
is invariant under stratum-preserving homeomorphisms, and the link of a chart may be replaced by
any stratum-preservingly homeomorphic space. Conical stratification does not imply the frontier
condition: prove it for Convention 3's `[0, 1) ∪ {2}`.
*Needs:* 2.1.

**Checks.**

- Every space with the trivial stratification over `Unit` is conically stratified (`Z = X`,
  `L = ∅`): the definition constrains only how strata meet.
- `ℝ` over `{0 < 1}` with stratum `0` the set `{0} ∪ {1/n : n ≥ 1}` satisfies the frontier
  condition but is not conically stratified at `0`: a chart `Z × C(L)` would have `Z` totally
  disconnected with more than one point near `0`, while an interval around `0` is connected and
  meets two of the components `{z} × C(L)`.
- For `L = L' = Fin 2`, `L''` is the boundary of a square, a circle with four points of indices
  `(1, 0)` or `(0, 1)` and four open arcs of index `(1, 1)`: the link of the origin in the product
  stratification of `ℝ²`.

### 2.3 Examples, each a target

(a) A manifold with boundary, stratified by boundary `<` interior, is conically stratified with
links points, by the collar theorem. (b) The realization of a locally finite abstract simplicial
complex, stratified by its open simplices over the face poset (`σ ≤ τ` iff `σ ⊆ τ`), is
conically stratified: the link of a point of the open simplex `σ` is the realization of the link
of `σ`, and the chart is `int σ × C(|lk σ|)` onto the open star (Lurie, *Higher Algebra*,
Proposition A.6.8). (c) `ℝ²` stratified by `{0} < (ℝ × {0}) ∖ {0} < ℝ² ∖ (ℝ × {0})` over
`{0 < 1 < 2}` is conically stratified, with the link of the origin the circle stratified by two
points below two open arcs. (d) A smooth manifold with a closed submanifold, by the tubular
neighbourhood theorem.
*Needs:* 2.2; GeometricTopology Layer 1 (collar theorem, tubular neighbourhood theorem); Tau
Ceti `AbstractSimplicialComplex.Realization`.

**Checks.**

- (a) for `[0, 1)`: the chart at `0` is `C(point) = [0, ε)`.
- (b) for the boundary of a triangle: the link of a vertex is two points and the chart is an
  interval; for a closed triangle the link of a vertex is a closed interval stratified by its two
  endpoints below its interior.
- (d) for `{0} ⊆ ℝ`: the link of `0` is two points; for the circle in `ℝ²`, every point of the
  circle has link two points and `Z` an interval.

### 2.4 Covering pairs do not suffice

For the stratification (c), let `V₀₁ = (−1, 1) × {0}`, `V₁₂ = {(x, y) : x ≠ 0, |y| < |x|}`, and let
`V*₀₁`, `V*₁₂` be their intersections with the strata `1` and `2`. Prove that the final topology on
`ℝ²` for the inclusions of the seven sets `X₀, X₁, X₂, V₀₁, V*₀₁, V₁₂, V*₁₂` is strictly finer than
the Euclidean topology: for `0 < ε ≤ 1` the set `W = (−ε, ε) × {0} ∪ {0 < |x| < ε, |y| < |x|}` is
open for it but is not a neighbourhood of the origin. This is why Layer 6 glues along all pairs
`i < k`, not only covering pairs. (Own example.)
*Needs:* 2.3.

**Checks.**

- `W` meets the seven sets in `{0}`, `((−ε, ε) ∖ {0}) × {0}`, `{0 < |x| < ε, 0 < |y| < |x|}`,
  `(−ε, ε) × {0}`, `((−ε, ε) ∖ {0}) × {0}`, `{0 < |x| < ε, |y| < |x|}` and again
  `{0 < |x| < ε, 0 < |y| < |x|}`, each open in its set.
- For `0 < δ < ε` the point `(0, δ)` is not in `W`, so `W` contains no Euclidean ball around the
  origin.
- Adding the pair `(0, 2)` with `V₀₂` the open unit disc kills the example: `W ∩ V₀₂` contains
  the origin but no point `(0, δ)`, so it is not open in the disc.

### Examples

`C(S¹) ≃ₜ ℝ²`; the closed cone `{x² + y² = z²}` in `ℝ³` with strata `{0}` and the rest, conically
stratified with link two circles; the realization of a simplicial complex by open simplices.

### Dependencies

Layer 1 and GeometricTopology Layer 1. Within the layer, 2.2 uses 2.1, 2.3 uses 2.2 and 2.4 uses
2.3.

## Layer 3: exit paths and the exit-path category

### 3.1 Exit paths

Define `IsExitPath` (Convention 5). Prove: exit paths are closed under `Path.trans`, monotone
reparametrization and stratified maps; constant paths are exit paths; an exit path between two
points of the same index stays in that stratum; there is an exit path from `x` to `y` only if
`s x ≤ s y`. (Exit paths are the po-paths of Woolf 2009, §2, defined before Definition 2.1; the
1-simplices of Lurie, *Higher Algebra*, Definition A.6.2, are the exit paths whose index is
constant on `(0, 1]`.)
*Needs:* 1.2; Mathlib `Path`, `Path.trans`.

**Checks.**

- In `ℝ` stratified as in Convention 1, `t ↦ 2t − 1` from `−1` to `1` passes through `0` and is
  not an exit path (indices `1, 0, 1`), while `t ↦ t` and `t ↦ −t` from `0` are; there is no exit
  path from `−1` to `1`.
- On the discrete `{a, b}` with `s(a) = 0 < 1 = s(b)` there is no path from `a` to `b`: the
  converse of the last statement fails.
- Reparametrization must be monotone: `t ↦ 1 − t` composed with an exit path from `0` to `1`
  reverses it and is not an exit path.

### 3.2 Exit homotopy and the exit-path category

Define `ExitHomotopic`, the quiver `ExitPathQuiver s` whose arrows from `a` to `b` are the exit
paths from `a.pt` to `b.pt`, the relation `ExitPathCategory.Rel s` on its free category
`CategoryTheory.Paths` (exit-homotopic paths are equal, `γ.trans δ` is the composite of `γ` and
`δ`, the constant path is the identity), and `ExitPathCategory s` as the
`CategoryTheory.Quotient` by it, with objects `ExitPathCategory.mk s x` (Woolf's fundamental
category, Woolf 2009, Definition 2.1; Lurie, *Higher Algebra*, §A.6). Prove: exit homotopy is an
equivalence relation compatible with `Path.trans`, and reparametrization homotopies are through
exit paths; every morphism from `mk x` to `mk y` is the class of one exit path, two exit paths
having the same class exactly when they are exit-homotopic; functoriality along stratified maps;
stratum-preserving homotopic stratified maps induce naturally isomorphic functors.
*Needs:* 3.1; Mathlib `Path.Homotopy`, `Path.Homotopy.eval`, `CategoryTheory.Paths`,
`CategoryTheory.Paths.of`, `CategoryTheory.Quotient`, `HomRel`.

**Checks.**

- For the trivial stratification of the circle, `End(mk x)` is the fundamental group `ℤ`.
- For Convention 1's `ℝ`, `Hom(mk 0, mk 1)` has one element and `Hom(mk 1, mk 0)` and
  `Hom(mk (−1), mk 1)` are empty: a definition by all paths modulo homotopy would make all three
  singletons.
- Without the third relation the constant path is only idempotent: sending every exit path to `e`
  in the monoid `{1, e}` with `e² = e` respects the first two relations and sends the constant
  path to `e ≠ 1`.

### 3.3 Structure theorems

(a) `ExitPathCategory.nonempty_equivalence_fundamentalGroupoid`: for a stratification over a
subsingleton poset, `ExitPathCategory s ≌ FundamentalGroupoid X`. (b) The full subcategory on the
points of `X_p` is equivalent to `FundamentalGroupoid X_p`. (c) Every endomorphism is an
isomorphism, and `Hom(mk x, mk y)` is empty unless `s x ≤ s y`. (d) The forgetful functor to
`FundamentalGroupoid X`. (e) `OpenCone.nonempty_unique_hom_apex`: in the exit-path category of an
open cone with its cone stratification there is exactly one morphism from the apex to every
object (an exit path from the apex is exit-homotopic to the radial path, by first straightening
its height to `t ↦ t · t₁` and then sliding its `L`-coordinate to the endpoint), and the full
subcategory on `L × (0, ∞)` is equivalent to the exit-path category of `L`. (f) For `Z × C(L)`,
the exit-path category is the product of `FundamentalGroupoid Z` with that of `C(L)`. (Own; (c)
is the 1-categorical form of Lurie, *Higher Algebra*, Theorem A.6.4(3), p. 1428, and Treumann's
Example 1.3 is (e) for `L = S¹`.)
*Needs:* 2.1, 3.2; Mathlib `FundamentalGroupoid`.

**Checks.**

- (a) with `P` empty: `X` is empty and both categories are empty.
- (e) for `L = ∅`: the cone is a point and `Hom(apex, apex)` is the identity alone; for
  `L = Fin 2`, `C(L) ≃ₜ ℝ`, `Hom(apex, ±1)` are singletons and `Hom(1, −1)` is empty.
- (e) is not symmetric: `Hom(y, apex)` is empty for `y ≠ apex`, since the index would decrease.

### 3.4 The sphere

Define `sphereStratification` on `S² = OnePoint ℂ` over `Fin 2`, with `∞ ↦ 0` and `ℂ ↦ 1`. Prove
`nonempty_equivalence_sphere`: the exit-path category is equivalent to the poset `Fin 2` regarded
as a category (`Preorder.smallCategory`), using 3.3(e) on a cone chart at `∞` and the simple
connectivity of `ℂ`. The nerve of `Fin 2` is contractible, so the exit-path category does not
determine the homotopy type of `S²`. The same category, two objects and one non-identity arrow,
is Treumann's Example 1.4, where it classifies the constructible sheaves on `S²`.
*Needs:* 3.3; Mathlib `OnePoint`, `OnePoint.isOpen_range_coe`, `Preorder.smallCategory`.

**Checks.**

- `Hom(mk ∞, mk z)` is a singleton for `z ∈ ℂ` (a neighbourhood of `∞` is `C(S¹)`),
  `Hom(mk z, mk w)` is a singleton because `ℂ` is simply connected, and `Hom(mk z, mk ∞)` is
  empty.
- With the trivial stratification, `S²` has exit-path category `FundamentalGroupoid S²`, connected
  with trivial groups and equivalent to a point, not to `Fin 2`.
- `sphereStratification` is a stratification: the upper sets of `Fin 2` are `∅`, `{1}` and
  `univ`, with preimages `∅`, `ℂ` and `S²`; sending `∞ ↦ 1` and `ℂ ↦ 0` would make the preimage
  of `{1}` the closed point `{∞}`.

### Examples

Convention 1's `ℝ`: its exit-path category has skeleton three objects `0, −1, 1` with one arrow
`0 → 1` and one arrow `0 → −1`. The ℝ² of 2.3(c): `Hom(mk 0, mk y)` is a singleton for every `y`.

### Dependencies

Layers 1–2. Within the layer, 3.2 uses 3.1, 3.3 uses 3.2 and 2.1, and 3.4 uses 3.3.

## Layer 4: triangulation and conical structure of definable sets

Work with an o-minimal structure in the sense of ShimuraVarieties §3.4b on a linearly ordered type
`R`, with the order topology and the product topology on `Fin n → R`.

### 4.1 Triangulation

Over an ordered field `R`, the open simplex of an affinely independent finite `τ ⊆ Fin n → R` is the
intrinsic interior of its convex hull, `intrinsicInterior R (convexHull R τ)`, that is, the strictly
positive barycentric combinations of the points of `τ`. For an o-minimal expansion of an ordered
field (the graphs of `+` and `·` definable), prove the triangulation theorem: every definable
`A ⊆ Fin n → R` and finitely many definable `B_i ⊆ A` admit a finite
`Geometry.SimplicialComplex R (Fin n → R)`, a set `T` of its faces and a definable homeomorphism of
`A` onto the union of the open simplices of the `τ ∈ T`, mapping each `B_i` onto a union of open
simplices (van den Dries, Chapter 8, (2.9)). The proof runs on the cell decomposition, dimension,
definable choice and curve selection of ShimuraVarieties §§3.4c–3.4e, whose hypotheses an ordered
field satisfies. For `R = ℝ` and closed bounded `A`, deduce `TauCeti.IsTriangulable A` through
RealAnalyticGeometry R2.1's comparison of a finite `Geometry.SimplicialComplex ℝ E` with the
realization carrier.
*Needs:* ShimuraVarieties §§3.4b–3.4e; Mathlib `Geometry.SimplicialComplex`, `intrinsicInterior`,
`convexHull`; RealAnalyticGeometry R2.1; Tau Ceti `TauCeti.IsTriangulable`.

**Checks.**

- The open simplex of `{v}` is `{v}`, that of `{v, w}` is the open segment, and that of `∅` is
  empty (the weights would sum to `0`).
- `A = (0, 1]` in `ℝ` is triangulated by the complex with vertices `0`, `1`, `T = {{1}, {0, 1}}`
  and `Φ = id`: `T` need not be a subcomplex, which is why non-closed sets are allowed.
- The closed unit disc with its boundary circle as `B` is triangulated through the semialgebraic
  map `x ↦ (|x| / ‖x‖_∞) x` onto the square `[−1, 1]²`, triangulated with the boundary as a
  subcomplex.

### 4.2 Definable sets are conically stratified

For `R = ℝ`, a definable set stratified by the images of the open simplices of a triangulation is
conically stratified over the face poset (2.3(b)) and satisfies the frontier condition (1.3).
*Needs:* 2.3, 4.1.

**Checks.**

- `(0, 1]` stratified by `{1} < (0, 1)` is conically stratified with link a point at `1`.
- The cone `{x² + y² = z²}` has link two circles at the origin.
- The cusp `{y² = x³}` triangulated with a vertex at the origin has link two points there.

### 4.3 The semialgebraic specialization

For the semialgebraic structure on `ℝ` of ShimuraVarieties §3.4b, prove
`exists_triangulation_semialgebraic`: 4.1 for semialgebraic `A` and `B_i`, with `Φ` semialgebraic
on `A` (`TauCeti.IsSemialgebraicOn`). For compact `A`, the union of the open simplices of `T` is
closed, so `T` is a subcomplex, and 4.3 implies AffineMorseLefschetz A4.1's compatible
triangulation with the complex in the same ambient space. For bounded `A`, 4.3 follows from
RealAnalyticGeometry R2.1's bounded affine theorem applied to `A` and the `B_i`, by inverting its
homeomorphism on `A`. R2.1 proves more: a triangulation of the closure with Nash maps on the open
simplices. 4.3 adds the unbounded case.
*Needs:* 4.1; ShimuraVarieties §3.4b (the semialgebraic structure); Tau Ceti
`TauCeti.IsSemialgebraic`, `TauCeti.IsSemialgebraicOn`.

**Checks.**

- For the identity of a semialgebraic `A`, the graph `{(x, x) : x ∈ A}` is semialgebraic, so
  `TauCeti.IsSemialgebraicOn id A` holds, as `Φ = id` in the second check of 4.1 requires.
- The closed unit disc of 4.1 is compact semialgebraic, and its triangulation is the compatible
  triangulation of A4.1 with the circle as a subcomplex.
- The unbounded `A = [0, ∞)` in `ℝ` is carried by the semialgebraic `Φ(x) = x / (1 + x)`, with graph
  `{(x, y) : x ≥ 0, y (1 + x) = x}`, onto `[0, 1)`, the union of the open simplices of `{0}` and
  `{0, 1}`, so `T = {{0}, {0, 1}}`. The union over a subcomplex is compact, so for unbounded `A` the
  set `T` is never a subcomplex.

### Examples

The semialgebraic structure on `ℝ`; the triangulated disc; `[0, ∞)` carried onto `[0, 1)`; the
cone `{x² + y² = z²}` with link two circles.

### Dependencies

ShimuraVarieties §§3.4b–3.4e, Tau Ceti's semialgebraic exports (RealAlgebraicGeometry),
RealAnalyticGeometry R2.1 for the corollary of 4.1, and 2.3 for 4.2. Within the layer, 4.2 and
4.3 use 4.1. No item of the layer uses A4.1's or R2.1's triangulation theorems.

## Layer 5: manifolds with corners, faces and embedded corners

### 5.1 The face structure

For a Hausdorff, second-countable smooth manifold `M` modelled on
`modelWithCornersEuclideanQuadrant n`, take DifferentialGeometry 5.5's abstract boundary `∂̃M`, a
manifold with corners of dimension `n − 1` whose points are the pairs of a point `x` and a local
face (local boundary germ) through it, with its map `j : ∂̃M → M`. Define the depth of `x` as the
number of points of `j⁻¹(x)`. Prove: the depth equals the number of vanishing coordinates in any
chart (a smooth transition map between relatively open subsets of `EuclideanQuadrant n` preserves
that number and induces a bijection of local faces, through its derivative and the tangent cone);
depth `0` is the set `ModelWithCorners.interior` and depth `≥ 1` the set
`ModelWithCorners.boundary`; `j` is a smooth proper immersion onto `ModelWithCorners.boundary`;
open restrictions, disjoint unions and products behave as expected, with
`∂̃(M × N) = (∂̃M × N) ⊔ (M × ∂̃N)` and depths adding; in dimension `0`, `∂̃M` is empty (Joyce,
Definition 2.3 for depth, Definitions 2.5–2.6 for local boundary components and the boundary).
*Needs:* DifferentialGeometry 5.5 (the abstract boundary); Mathlib `EuclideanQuadrant`,
`modelWithCornersEuclideanQuadrant`, `ModelWithCorners.boundary`, `ModelWithCorners.interior`,
`tangentConeAt`, `Manifold.IsImmersionAt`.

**Checks.**

- `[0, 1]²`: depth `2` at the corners, `1` on the open edges, `0` inside; `∂̃M` is the disjoint
  union of the four closed edges and `j` is two-to-one exactly over the corners.
- The teardrop `{(x, y) : x ≥ 0, y² ≤ x² − x⁴}`: `∂̃M` is a closed interval, the boundary curve cut
  open at the corner, and `j` sends both endpoints to the corner.
- `[0, 1] × [0, 1]` as a product: `∂̃ = ({0, 1} × [0, 1]) ⊔ ([0, 1] × {0, 1})`, and the depth of
  `(0, 0)` is `1 + 1 = 2`.

### 5.2 Boundary hypersurfaces and embedded corners

A *boundary hypersurface* of `M` is `j(C)` for a connected component `C` of `∂̃M`. `M` has
*embedded corners* when `j` is injective on every connected component of `∂̃M`. This is Jänich's
"manifold with faces" (Joyce, Remark 2.11(b)); for compact `M` it is equivalent to Joyce's
"embedded corners" (Remark 2.11(c)). Prove: the boundary hypersurfaces are the closures of the
connected components of the depth-`1` locus; `M` has embedded corners exactly when every point of
depth `d` lies in exactly `d` boundary hypersurfaces; each boundary hypersurface of a manifold with
embedded corners is a closed embedded submanifold with corners of codimension one (`j` restricted
to a component is an injective proper immersion); open subsets, finite disjoint unions and products
of manifolds with embedded corners have embedded corners; `EuclideanQuadrant n` and `[0, 1]ⁿ` have
embedded corners.
*Needs:* 5.1.

**Checks.**

- `[0, 1]²` has embedded corners and four boundary hypersurfaces, the edges.
- The teardrop does not: its corner has depth `2` and lies in its only boundary hypersurface.
- `EuclideanQuadrant 2` has two boundary hypersurfaces, the half-axes, and the origin, of depth
  `2`, lies in both.

### 5.3 Intersections of boundary hypersurfaces

Let `M` have embedded corners and dimension `n`, and let `H_1, …, H_k` be distinct boundary
hypersurfaces with intersection `F = H_1 ∩ ⋯ ∩ H_k`. Prove: every `x ∈ F` has a chart of `M`
centred at `x`, with coordinates `u`, and distinct corner indices `i_1, …, i_k` such that near `x`
`H_l = {u_{i_l} = 0}` for `l = 1, …, k`. Hence `F` is empty or a closed embedded
submanifold with corners of dimension `n − k`; each point of `F` has depth at least `k` in `M`, and
its depth in `F` is its depth in `M` minus `k`; `F` has embedded corners, and its boundary
hypersurfaces are the connected components of the sets `F ∩ H` for the boundary hypersurfaces `H`
of `M` other than `H_1, …, H_k`. The proof uses embeddedness twice: `H_1, …, H_k` come from `k`
distinct local boundary germs at `x`, and, `j` being proper and injective on each component, near
`x` each of `H_1, …, H_k` is the image of one sheet only. (Own; compare Joyce, Proposition 2.9.)
*Needs:* 5.2.

**Checks.**

- In `[0, 1]²` an edge is a boundary hypersurface and a closed interval, although the depth-`≥ 1`
  locus is the whole, connected, boundary circle: hypersurfaces are not components of that locus.
- Two adjacent edges of `[0, 1]²` meet in one corner point (`k = 2`, dimension `0`); two opposite
  edges do not meet.
- In the teardrop the only boundary hypersurface passes twice through the corner and is a
  coordinate face in no chart there.

### 5.4 Collars of boundary hypersurfaces

A *face collar* of a boundary hypersurface `H` is a `TauCeti.IsCollar` of the inclusion `H → M`:
an open embedding `c : H × [0, 1) → M` restricting to the inclusion at `0`; it is *smooth* when
`c` is a diffeomorphism onto its image for the product structure of `H × [0, 1)`. Prove: for
compact `M` with embedded corners, every boundary hypersurface has a face collar, since by 5.3 it
is locally collared (in a chart, `(y, t) ↦ y + δ t e_{i_l}`), so Brown's theorem
`TauCeti.IsLocallyCollared.isCollared` applies; and it has a smooth face collar, from the flow of
an inward-pointing vector field tangent to the other boundary hypersurfaces, glued from the
coordinate fields of 5.3 by a partition of unity, as in the proof of the collar theorem (Lee,
*Introduction to Smooth Manifolds*, Theorem 9.25). A finite family of face collars is
*compatible* when the collars commute where defined; compatible collars enter Layer 6 as data of a
smooth unfolding datum, and no existence theorem for compatible families is stated here.
*Needs:* 5.3; Tau Ceti `TauCeti.IsCollar`, `TauCeti.IsLocallyCollared`,
`TauCeti.IsLocallyCollared.isCollared`.

**Checks.**

- For the edge `{0} × [0, 1]` of `[0, 1]²`, `((0, y), t) ↦ (t/2, y)` is a smooth face collar, and
  `((x, 0), t) ↦ (x, t/2)` is one for `[0, 1] × {0}`; they are restrictions of the commuting
  translations `(x, y) ↦ (x + t/2, y)` and `(x, y) ↦ (x, y + t/2)`, so the pair is compatible.
- The teardrop, without embedded corners, is a closed disc and its boundary hypersurface has a
  topological collar; it has no smooth one, since that hypersurface is not a submanifold with
  corners at the corner point, where it has two branches: the smooth statement needs 5.2.
- Both fields of `TauCeti.IsCollar` bind: for the edge `H = {0} × [0, 1]`, the embedding
  `((0, y), t) ↦ (t/2, y/2)` has zero slice `y ↦ (0, y/2)`, not the inclusion, and its image
  `[0, 1/2) × [0, 1/2]` is not open in `[0, 1]²`.

### Examples

`[0, 1]ⁿ`, `EuclideanQuadrant n`, products of manifolds with boundary; the teardrop as the
standard manifold with corners without embedded corners.

### Dependencies

DifferentialGeometry 5.5, Mathlib's quadrant model and Tau Ceti's collars. Within the layer, 5.2
uses 5.1, 5.3 uses 5.2, and 5.4 uses 5.3.

## Layer 6: unfolding, gluing and reconstruction

Fix a finite poset `I`.

### 6.1 Unfolding data

An unfolding datum over `I` consists of Hausdorff spaces `Σ_j`; for each `i < j` a closed subset
`∂_iΣ_j ⊆ Σ_j` with a collar `c_ij : ∂_iΣ_j × [0, 1) → Σ_j` (a `TauCeti.IsCollar` of the inclusion),
and a proper continuous map `s_ij : ∂_iΣ_j → Σ_i`; such that: for `i, j` incomparable,
`∂_iΣ_k ∩ ∂_jΣ_k = ∅`; for `i < j < k`, `∂_iΣ_k ∩ ∂_jΣ_k = s_jk⁻¹(∂_iΣ_j)` and `s_ik = s_ij ∘ s_jk`
there; the collars commute where defined and satisfy `s_jk ∘ c_ik(y, t) = c_ij(s_jk y, t)`; and the
datum is **locally trivial**: every `b ∈ Σ_i` has a neighbourhood `U` over which all the maps
`s_ij : ∂_iΣ_j → Σ_i`, `j > i`, are trivialized simultaneously, compatibly with the faces and
collars above them. A **smooth** unfolding datum has each `Σ_j` a manifold with embedded corners
(Convention 9, 5.2) of a dimension depending on `j`; each `∂_iΣ_j` is a union of boundary
hypersurfaces of `Σ_j`, every boundary hypersurface lies in exactly one `∂_iΣ_j`, and two distinct
boundary hypersurfaces in the same `∂_iΣ_j` are disjoint; the collar of each hypersurface in
`∂_iΣ_j` is a smooth face collar (5.4); and all maps are smooth. By 5.3 the sets `∂_iΣ_k ∩ ∂_jΣ_k`
are then closed embedded submanifolds with corners of codimension two. (Own definition, after the
iterated fibration structures of Albin, Leichtnam, Mazzeo and Piazza, §2.2.)
*Needs:* 5.2–5.4; Tau Ceti `TauCeti.IsCollar`.

**Checks.**

- The datum of the `ℝ²` example (6.3): `Σ₀` a point, `Σ₁` two closed half-lines, `Σ₂` the
  complement in `ℝ²` of an open elliptic disc and of an open band around the `x`-axis, two
  components with four corner points in all, each in `∂₀Σ₂ ∩ ∂₁Σ₂`.
- `[0, 1]` over `I = {a, b, c}` with `a, b < c` incomparable: `Σ_a`, `Σ_b` points,
  `Σ_c = [ε, 1 − ε]`, `∂_aΣ_c = {ε}` and `∂_bΣ_c = {1 − ε}`, disjoint as required.
- In the `ℝ²` datum, `s₀₂ = s₀₁ ∘ s₁₂` on the corners: a corner goes to an endpoint of a half-line
  and then to the point `Σ₀`, as it goes directly.

### 6.2 Gluing

Define `glue(Σ) = (⊔_j Σ_j)/∼` with `∼` generated by `y ∼ s_ij(y)` for `y ∈ ∂_iΣ_j`, stratified over
`I` by sending the image of `Σ_j ∖ ⋃_i ∂_iΣ_j` to `j`. Prove: `glue(Σ)` is Hausdorff, compact when
every `Σ_j` is; its stratum `j` is homeomorphic to `Σ_j ∖ ⋃_i ∂_iΣ_j`; it is conically stratified,
the link of a point of stratum `i` over `b ∈ Σ_i` being `glue` of the fibre datum
`(s_ij⁻¹(b))_{j > i}` over `I_{>i}`. Own construction; the gluing is the blowdown of Albin,
Leichtnam, Mazzeo and Piazza, Proposition 2.3 (§2.2). Route: the relation is closed, since the
`∂_iΣ_j` are closed and the `s_ij` continuous, and two points are separated by the images of collar
neighbourhoods `c_ij(∂_iΣ_j × [0, δ))`; near a point of stratum `i` over `b`, local triviality of
`s_ij` and the collars give a neighbourhood `U × C(glue(s_ij⁻¹(b))_{j>i})`.
*Needs:* 2.2, 6.1.

**Checks.**

- `glue` of the `[0, 1]` datum is `[ε, 1 − ε] ≃ₜ [0, 1]` with its three strata.
- `glue` of the `ℝ²` datum is homeomorphic to `ℝ²`, and the link of the stratum `0` is the glued
  fibre datum: a circle made of the two arcs of `∂₀Σ₂` and the two endpoints of `Σ₁`.
- The relation is the generated equivalence: in the `ℝ²` datum a corner `y` of `Σ₂` is related to
  `s₁₂ y ∈ Σ₁` and to `s₀₂ y ∈ Σ₀`, and `s₁₂ y` to `s₀₁ (s₁₂ y)`, which is `s₀₂ y`; the corner,
  the endpoint and the point `Σ₀` become one point.

### 6.3 Unfolding a Thom–Mather space

Let `X` be a Thom–Mather space (AlgebraicTopologyPartII §16.1b) whose strata are indexed by `I`,
the order of `I` containing the incidence order, so that by §16.1a the index map is a
stratification over `I` in the sense of 1.1. Let its control data be normalised; they then satisfy
the control conditions for every pair `i < j` of `I` (§16.1b), and `ε⁰_i : X_i → (0, ∞)` denotes
the bound of their properness clause. There are smooth `ε_i : X_i → (0, ∞)`, below `ε⁰_i`, with
`T_i(ε_i) ∩ π_i⁻¹(T_h(ε_h)) ⊆ T_h(ε_h)` for `h < i` (so that `s_ij = π_i` lands in `Σ_i`), such
that `Σ_j = closure X_j ∖ ⋃_{i<j} T_i(ε_i)`, `∂_iΣ_j = Σ_j ∩ {ρ_i = ε_i ∘ π_i}`, `s_ij = π_i`,
and collars from the flow of a controlled vector field transverse to the level sets of `ρ_i`
(§16.1d) form a smooth unfolding datum (the resolution of Albin, Leichtnam, Mazzeo and Piazza,
Proposition 2.5 (§2.3)). The control
conditions give `s_ik = s_ij ∘ s_jk`; the local triviality of tubes, a case of the first isotopy
lemma (§16.1e), gives local triviality.
*Needs:* 1.1, 6.1; AlgebraicTopologyPartII §§16.1a, 16.1b, 16.1d, 16.1e.

**Checks.**

- For the control data of AlgebraicTopologyPartII §16.1b's first Check on the `ℝ²` of 2.3(c)
  (`T₀ = ℝ²`, `π₀ = 0`, `ρ₀ = x² + 2y²`; `T₁ = {|y| < |x|}`,
  `π₁(x, y) = (sign(x)·√(x² + 2y²), 0)`, `ρ₁ = y²`; `T₂ = X₂`), with constants `ε₁ < ε₀/3`:
  `Σ₁ = ℝ × {0} ∖ (−√ε₀, √ε₀) × {0}`, and `Σ₂ = {(x, y) : |y| ≥ √ε₁, x² + 2y² ≥ ε₀}`, two
  components, each bounded by an arc of the ellipse `x² + 2y² = ε₀` (in `∂₀Σ₂`) and two
  half-lines of `|y| = √ε₁` (in `∂₁Σ₂`), meeting at the four corners
  `(±√(ε₀ − 2ε₁), ±√ε₁)`; `ε₁ < ε₀/3` puts the corners inside `T₁`.
- For the cone `{x² + y² = z²}` with `T₀` the cone, `π₀ = 0` and `ρ₀ = |x|²`: `Σ₀ = {0}`, and
  `Σ₁` the cone minus an open ball around `0`, two copies of `S¹ × [√ε, ∞)` with `∂₀Σ₁` the two
  boundary circles.
- For `[0, 1]` with `T_a = [0, 1/2)`, `ρ_a = x²`, and symmetrically at `1`: `Σ_c = [√ε, 1 − √ε]`.
- Normalisation is needed: take the non-proper tube of AlgebraicTopologyPartII §16.1b's last Check
  (on `ℝ`, the stratum `{0}` below `ℝ ∖ {0}`, `T = (−1, 1) ∪ (1, 2)`, `π = 0`, `ρ = x²` on
  `(−1, 1)` and `ρ = x − 1` on `(1, 2)`) and a constant `ε < 1`. Then
  `Σ_j = (−∞, −√ε] ∪ [√ε, 1] ∪ [1 + ε, ∞)` has the boundary point `1` in no
  `∂_iΣ_j = {−√ε, √ε, 1 + ε}`, and the stratum `j` of `glue(Σ)` has three components against two
  for `X_j`.

### 6.4 Reconstruction

For `X` and `Σ` as in 6.3, `glue(Σ)` is homeomorphic to `X` by a stratum-preserving homeomorphism
that is the identity on the complement in each `Σ_j` of the images of the collars `c_ij`. For
conically smooth spaces the analogous resolution is the unzipping of Ayala, Francis and Tanaka,
Theorem 7.3.8.
*Needs:* 6.2, 6.3.

**Checks.**

- The `ℝ²` example: gluing recovers `ℝ²`.
- The cone: gluing the two circles of `∂₀Σ₁` to the point `Σ₀` recovers the cone.
- `[0, 1]`: gluing `√ε` to `Σ_a` and `1 − √ε` to `Σ_b` recovers `[0, 1]`, by a homeomorphism
  that is the identity outside the images of the two collars.

### 6.5 Faces indexed by flags

For a chain `d = (i_1 < ⋯ < i_n)` let `Σ_d = ∂_{i_1}Σ_{i_n} ∩ ⋯ ∩ ∂_{i_{n−1}}Σ_{i_n}` (and
`Σ_d = Σ_{i_1}` when `n = 1`); for `d` the initial segment `(i_1 < ⋯ < i_p)` of `d'`, the
compatibilities make `s_{i_p i_n}` a map `Σ_{d'} → Σ_d`. In a smooth unfolding datum: (a) the set
indexed by a subset `{k_1, …, k_m}` of `]i, j[` in the fibre `F = s_ij⁻¹(b)`, namely
`F ∩ ∂_{k_1}Σ_j ∩ ⋯ ∩ ∂_{k_m}Σ_j`, is empty unless the subset is a chain; (b) the boundary of each
fibre of `Σ_{d'} → Σ_d` is the union of the sets indexed by the nonempty chains of the ordinal sum
`]i_p, i_{p+1}[ ⊔ ⋯ ⊔ ]i_{n−1}, i_n[`, so the fibres are boundaryless when every step
`i_l < i_{l+1}` with `l ≥ p` is a covering; (c) for a datum from 6.3, with nonempty strata and `I`
the incidence order, every one of these sets is nonempty, so the fibres are boundaryless exactly
when every step `i_l < i_{l+1}` with `l ≥ p` is a covering. The condition involves `i_p, …, i_n`
and not `i_1, …, i_{p−1}`. Own statement; the fibrations between faces are those of Albin,
Leichtnam, Mazzeo and Piazza, §2.
*Needs:* 5.3, 6.1, 6.3.

**Checks.**

- `ℝ²`, `d = (0 < 1 < 2)`: `Σ_d` is the four corners, mapping two-to-one onto the two endpoints
  `Σ_{(0<1)} = ∂₀Σ₁`; the fibres are two points, boundaryless, and `2` covers `1`.
- `ℝ²`, `d' = (0 < 2)` over `d = (0)`: the fibre `∂₀Σ₂` is two arcs, whose boundary is the four
  corners, indexed by the chain `{1}` of `]0, 2[`, and `2` does not cover `0`.
- `[0, 1]`: `a` and `b` are incomparable, and `∂_aΣ_c ∩ ∂_bΣ_c = ∅`, as (a) requires.

### 6.6 The ordered-space form

On `Σ = ⊔_j Σ_j` let `x < y` iff `y ∈ ∂_iΣ_j` and `x = s_ij y` for some `i < j`. Prove: `<` is a
strict partial order; the index map `Σ → I` is locally constant and strictly monotone; for each
`y ∈ Σ_j`, `{x | x < y}` is a finite chain whose cardinality, in a smooth datum, is the corner
depth of `y` in the manifold with corners `Σ_j` (5.1), not the depth of a stratum (Convention 6);
`∂_iΣ_j` is the set of `y ∈ Σ_j` with some `x < y` in `Σ_i`, and `s_ij y` is the unique such `x`.
Hence the datum without collars is determined by `(Σ, <, Σ → I)`. Own reformulation of 6.1.
*Needs:* 5.1, 6.1.

**Checks.**

- `ℝ²`: a corner of `Σ₂` has two predecessors (an endpoint of `Σ₁` and the point `Σ₀`), corner
  depth `2`.
- `ℝ²`: a point on an open arc of `∂₀Σ₂` has one predecessor, depth `1`; an interior point of `Σ₂`
  has none.
- `[0, 1]`: the endpoint `√ε` of `Σ_c` has the single predecessor `Σ_a`, depth `1`.

### 6.7 Mixed tubes

For `i ≤ j ≤ k` in a Thom–Mather space over `I` with normalised control data, as in 6.3, let
`M^j_{ik} = (T_i ∩ closure X_k) ∖ ⋃_{j ≤ l < k} X_l`. Prove: `M^i_{ik} = T_i ∩ X_k` (a point of
`T_i ∩ closure X_k` lies in a stratum `l` with `i ≤ l` by (A10), the first condition of the
normalisation, and `l ≤ k` by Convention 1; only (A10) is used here),
`M^k_{ik} = T_i ∩ closure X_k`, `j ↦ M^j_{ik}` is monotone, and, for a small open ball
`U ⊆ X_i` and `ε > 0` small as in the local conical structure of AlgebraicTopologyPartII §16.1e,
`π_i : M^j_{ik} ∩ π_i⁻¹(U) ∩ {ρ_i < ε} → U` is trivial with fibre the subset of
`C(L_i) ∩ closure X_k` obtained by deleting the strata indexed in `[j, k[`, where `C(L_i)` is the
cone on the link of that local conical structure. Own construction, after Mather's
tubes `T_{X,Y}` (Mather, §8).
*Needs:* 6.3; AlgebraicTopologyPartII §§16.1b, 16.1e.

**Checks.**

- Negative control: take the control data of AlgebraicTopologyPartII §16.1b's fourth Check (on
  `ℝ`, strata `a = {0}`, `b = {5}` and `c = ℝ ∖ {0, 5}`, with `a`, `b` incomparable below `c`,
  and `T_a = (−1, 1) ∪ (4, 6)`), which are not normalised. Then `M^a_{ac} = T_a ∖ {0}` contains
  the point `5` of `X_b`, so it strictly contains `T_a ∩ X_c = T_a ∖ {0, 5}`: without
  normalisation the first identity fails.
- The `ℝ²` data of 6.3, `i = 0`, `k = 2`: `M^0_{02} = X₂`, `M^1_{02} = ℝ² ∖ X₁`,
  `M^2_{02} = ℝ²`, increasing.
- `j = k` deletes nothing: `M^k_{ik} ∩ {ρ_i < ε}`, whose fibre over `U` is the whole
  `C(L_i) ∩ closure X_k`.
- The cut `ρ_i < ε` cannot be dropped: on `ℝ` with `X₀ = {0} < X₁ = ℝ ∖ {0}`, take
  `T₀ = (−1, 1) ∪ (2, 3)`, `π₀ = 0`, `ρ₀ = x²` on `(−1, 1)` and `ρ₀ = x` on `(2, 3)`, and
  `T₁ = X₁`, normalised with `ε₀ = 1/8` (`{ρ₀ ≤ 1/8} = [−1/√8, 1/√8]` is compact). The link `L₀`
  is two points. The whole `M^0_{01} = (−1, 0) ∪ (0, 1) ∪ (2, 3)` has three components, against two
  for `C(L₀)` minus its apex, and `M^1_{01} = T₀` has two against one for `C(L₀)`. With
  `ε = 1/8`, `M^0_{01} ∩ {ρ₀ < ε} = (−1/√8, 0) ∪ (0, 1/√8)` is `C(L₀)` minus its apex and
  `M^1_{01} ∩ {ρ₀ < ε} = (−1/√8, 1/√8)` is `C(L₀)`.

### Examples

The `ℝ²` example of 2.3(c) with the control data of 6.3; the cone `{x² + y² = z²}`; `[0, 1]` with
its two endpoints.

### Dependencies

Layer 5, 1.1, 2.2 and AlgebraicTopologyPartII §§16.1a–16.1e. Within the layer, 6.2 uses 6.1,
6.3 uses 6.1 and §§16.1a–16.1e, 6.4 uses 6.2–6.3, 6.5 uses 5.3, 6.1 and 6.3, 6.6 uses 5.1 and
6.1, and 6.7 uses 6.3 and §§16.1b, 16.1e.

## Layer 7: definable stratifications over `ℝ`

Work with an o-minimal expansion of the real field (graphs of `+` and `·` on `ℝ` definable), in
the sense of ShimuraVarieties §3.4b.

### 7.1 `C^p` cells

Every definable `f : U → ℝ` on a definable open `U ⊆ Fin n → ℝ` is `C¹` outside a definable
subset, closed in `U`, of dimension `< n`. Finitely many definable subsets of `Fin n → ℝ` are
partitioned by one decomposition into `C¹` cells, each a connected `C¹` submanifold (van den
Dries and Miller, 4.2(1)–(2) with `p = 1`). Both statements hold with `C^p` in place of `C¹` for
every finite `p ≥ 1` (van den Dries and Miller, 4.2(1)–(2)); 7.2 uses them with `p = k`.
*Needs:* ShimuraVarieties §§3.4c, 3.4d.

**Checks.**

- `x ↦ |x|` is `C¹` off `{0}`, a set of dimension `0 < 1`.
- `x ↦ x^{1/3}` (semialgebraic) is `C¹` off `{0}`, where its derivative is unbounded.
- The cusp `{y² = x³}` is partitioned into three `C¹` cells: the origin and the two open branches.
- The graph of `x ↦ |x|^{3/2}` is one `C¹` cell over `ℝ`; a `C²` decomposition compatible with it
  cuts the base at `0`, leaving the origin and two branches.

### 7.2 Whitney stratification

For every finite `k ≥ 1`, every closed definable set admits a finite stratification into definable
connected `C^k` submanifolds satisfying the frontier condition and Whitney's condition (b)
(AlgebraicTopologyPartII §16.1a, read with `C^k` embeddings in place of smooth ones), compatible
with finitely many definable subsets (van den Dries and Miller, *Geometric categories and
o-minimal structures*, 4.8(1)). When the structure has `C^∞` cell decomposition (their 4.2 with
`p = ∞`), the strata can be taken `C^∞` (van den Dries and Miller, 4.8, Remark (1)).
*Needs:* 7.1 (with `p = k`); AlgebraicTopologyPartII §16.1a.

**Checks.**

- The cone `{x² + y² = z²}` with strata `{0}` and its complement, which has two connected
  components, refined to three connected strata.
- `{xy = 0}` with the origin below the four open half-axes.
- The graph of `x ↦ |x|^{k + 1/2}` (semialgebraic) is a `C^k` submanifold of `ℝ²` but not a
  `C^{k+1}` one at the origin, where its tangent is horizontal. A `C^k` stratification may keep
  the graph as one stratum; a `C^{k+1}` stratification must split off the origin as a point below
  the two open branches. At `k = 1`: the derivative `(3/2)|x|^{1/2}·sign x` of `|x|^{3/2}` is
  continuous, and its second derivative `(3/4)|x|^{−1/2}` is unbounded at `0`.

### 7.3 The semialgebraic case with smooth strata

For the semialgebraic structure the strata can be taken to be Nash, hence smooth, submanifolds
(Bochnak, Coste and Roy, *Real Algebraic Geometry*, Theorem 9.7.11). Consequently every closed
semialgebraic subset of `Fin n → ℝ` carries normalised Thom–Mather control data
(AlgebraicTopologyPartII §16.1c), a smooth unfolding datum (6.3) and the reconstruction of 6.4.
*Needs:* 6.3, 6.4, 7.2; ShimuraVarieties §3.4b (the semialgebraic structure);
AlgebraicTopologyPartII §16.1c.

**Checks.**

- The closed unit disc: the circle below the open disc, both Nash.
- The cone `{x² + y² = z²}` intersected with the closed unit ball: its unfolding is that of 6.3,
  truncated.
- `{xy = 0} ∩ [−1, 1]²`: the origin, the four end points and the four open half-segments.
- Compactness is not needed: `{xy = 0} ⊆ ℝ²` is closed and not compact. With the control data of
  AlgebraicTopologyPartII §16.1c's fourth Check (`T₀ = ℝ²`, `π₀ = 0`, `ρ₀ = x² + y²`), `Σ₀ = {0}`,
  `Σ₁` is the four closed rays `|t| ≥ √ε` on the axes, `∂₀Σ₁` is their four end points, and
  `glue(Σ) = {xy = 0}`.

### Examples

Compact semialgebraic sets; the cone; the cusp.

### Dependencies

ShimuraVarieties §§3.4b–3.4d, AlgebraicTopologyPartII §§16.1a and 16.1c, and 6.3–6.4 for 7.3.
Within the layer, 7.2 uses 7.1 with `p = k` and 7.3 uses 7.2.

## Downstream consumers

ImplicitAtlases Layer 6.1 stratifies each thickening over a finite poset with the sets `X^{≥s}`
open, which is a stratification in the sense of 1.1.

ComplexComparisonPartII C6.0 applies 4.3 `exists_triangulation_semialgebraic` on each affine
algebraic chart in `ℂⁿ = ℝ²ⁿ`, with the strata as the marked subsets, and glues the resulting
triangulations along the algebraic coordinate changes. It consumes 4.3 only.

## References

- J. Lurie, *Higher Algebra*, Appendix A: Definitions A.5.1 (Alexandrov topology and
  stratifications), A.5.3 (open cone), A.5.5 (conically stratified spaces), §A.6 (exit paths),
  Definition A.6.2 and Theorem A.6.4(3) (p. 1428), and Proposition A.6.8 (the stratification of the
  realization of a locally finite simplicial complex by open simplices is conical).
- J. Woolf, "The fundamental category of a stratified space", *Journal of Homotopy and Related
  Structures* 4 (2009), 359–387; numbering of arXiv:0811.2580v3: §2 (po-paths) and Definition 2.1
  (the fundamental category, the 1-categorical exit-path category).
- D. Treumann, "Exit paths and constructible stacks", *Compositio Mathematica* 145 (2009),
  1504–1532, doi:10.1112/S0010437X09004229; numbering of arXiv:0708.0659: Examples 1.3 (the
  open disc stratified by its centre) and 1.4 (`S²` stratified by a point).
- L. van den Dries, *Tame Topology and o-minimal Structures*, LMS Lecture Note Series 248,
  Cambridge University Press (1998): Chapter 4, §2 (Euler characteristic); Chapter 8, (2.9)
  (triangulation).
- L. van den Dries and C. Miller, "Geometric categories and o-minimal structures", *Duke
  Mathematical Journal* 84 (1996), 497–540: 4.2 (`C^p` cell decomposition), 4.8(1) and
  Remark (1) after 4.8 (Whitney stratifications with `C^p` and `C^∞` strata).
- J. Bochnak, M. Coste and M.-F. Roy, *Real Algebraic Geometry*, Ergebnisse der Mathematik 36,
  Springer (1998), Theorem 9.7.11 (Whitney stratification of semialgebraic sets with Nash
  strata).
- J. Mather, "Notes on topological stability", *Bulletin of the AMS* 49 (2012), 475–506 (Harvard
  notes, 1970): §8 (the tubes `T_{X,Y}`).
- P. Albin, É. Leichtnam, R. Mazzeo and P. Piazza, "The signature package on Witt spaces", *Annales
  scientifiques de l'École normale supérieure* 45 (2012), 241–310, doi:10.24033/asens.2165;
  numbering of the published text and of arXiv:1112.0989: §2.1 (depth of a stratum), §2.2 (iterated
  fibration structures), Proposition 2.3 (blowdown of a manifold with corners with iterated
  fibration structure) and Proposition 2.5 (resolution of a smoothly stratified space).
- D. Joyce, "On manifolds with corners", in *Advances in Geometric Analysis*, Advanced Lectures in
  Mathematics 21 (2012), 225–258, §2; numbering of arXiv:0910.3518v2: Definition 2.3 (depth),
  Definitions 2.5–2.6 (local boundary components and the boundary `∂X`), Proposition 2.9 (`∂ᵏX` by
  distinct local boundary components), Remark 2.11 (manifolds with faces, embedded corners, the
  teardrop).
- J. M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Graduate Texts in Mathematics 218,
  Springer (2013), Theorem 9.25 (the collar theorem).
- D. Ayala, J. Francis and H. L. Tanaka, "Local structures on stratified spaces", *Advances in
  Mathematics* 307 (2017), 903–1028, doi:10.1016/j.aim.2016.11.032; numbering of
  arXiv:1409.0501: Definition 2.4.4 (depth) and Theorem 7.3.8 (unzipping).
- G. Nocera and M. Volpe, "Whitney stratifications are conically smooth", *Selecta Mathematica
  (N.S.)* 29 (2023), Paper No. 68, doi:10.1007/s00029-023-00877-4; numbering of arXiv:2105.09243:
  Remark 2.21 (two notions of depth), Theorem 1.1 (abstract stratified sets) and Theorem 2.25
  (Whitney stratified spaces).
- A. Grothendieck, *Esquisse d'un programme* (1984), §5 ("tame topology"), in *Geometric Galois
  Actions 1*, LMS Lecture Note Series 242 (1997). His notes on stratified spaces are in the
  Montpellier fonds, folder 150, p. 11, https://grothendieck.umontpellier.fr/150.pdf.
- Y. Peterzil and C. Steinhorn, "Definable compactness and definable subgroups of o-minimal
  groups", *J. London Math. Soc.* (2) 59 (1999), 769–786: Theorem 2.1.
- P. Andújar Guerrero, "Definable compactness in o-minimal structures", *Model Theory* 4 (2025),
  101–130, arXiv:2405.07112: Theorem A, Remark 5.9.
- M. Murayama and M. Shiota, "Triangulation of the map of a G-manifold to its orbit space",
  *Nagoya Mathematical Journal* 212 (2013), 159–195, doi:10.1215/00277630-2366201: p. 160,
  triangulations of `Cᵏ` manifolds with corners (the locator is to the published version; the
  arXiv version, arXiv:1004.4094, lacks this result).
- A. Huber, "The period isomorphism in tame geometry", arXiv:2204.01402, with an appendix by
  J. Commelin and A. Huber: Proposition A.1.
