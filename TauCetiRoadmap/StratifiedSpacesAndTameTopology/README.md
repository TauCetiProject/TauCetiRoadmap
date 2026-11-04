# Roadmap: stratified spaces, tubular data and tame topology

**Summary.** Build the general topology of spaces cut into strata indexed by a poset, the two
mechanisms that control how strata meet (conical charts and exit paths; the tubes, retractions and
control functions of Thom and Mather), and the tame side: o-minimal structures, their cell
decomposition, dimension and triangulation, and Whitney stratifications of definable sets. The
carriers are `Stratification X P` (a map to a partial order `P`, continuous for the upper-set
topology), the open cone `OpenCone L` with the uniform-collar topology, the exit-path category
`ExitPathCategory s` (a quotient of Mathlib's free category `CategoryTheory.Paths` on the quiver
of exit paths), `OMinimalStructure R` on a linearly ordered type `R`, Mathlib's
`Geometry.SimplicialComplex` and manifolds modelled on `modelWithCornersEuclideanQuadrant n`, and
Tau Ceti's `TauCeti.IsSemialgebraic`. The end theorems are: for a stratification over a
subsingleton poset, `ExitPathCategory s ≌ FundamentalGroupoid X`; in the exit-path category of an
open cone the apex has exactly one morphism to every object; for `S² = ℂ ∪ {∞}` stratified by
`{∞} < ℂ`, the exit-path category is equivalent to the poset `Fin 2`; the cell decomposition
theorem for an o-minimal structure on a nonempty dense linear order without endpoints; the
triangulation theorem for an o-minimal expansion of an ordered field; the o-minimality of
semialgebraic sets on `ℝ`, with the semialgebraic triangulation as a specialization; Mather's
existence of control data on a Whitney stratified closed subset of `ℝⁿ` and Thom's first isotopy
lemma for a proper controlled submersion; and, for a Thom–Mather space over a finite poset with
normalised control data, its unfolding into manifolds with embedded corners joined by fibrations,
and the reconstruction of the space from the unfolded data by gluing.

Suggested homes: `TauCeti/Topology/Stratified/` for Layers 1–3, `TauCeti/Geometry/OMinimal/` for
Layers 4 and 8, `TauCeti/Geometry/Manifold/Corners/` for Layer 6, and
`TauCeti/Geometry/Stratified/` for Layers 5 and 7.

## Scope and ownership

**Owned here.** Stratifications over posets, the frontier condition and the incidence order,
open cones, conically stratified spaces, exit paths and the exit-path category (Layers 1–3);
general o-minimal structures, monotonicity, cell decomposition, dimension, definable choice, curve
selection and triangulation, and the o-minimality of semialgebraic sets (Layer 4); smooth
stratified spaces, Thom–Mather control data and their normalisation, Whitney's condition (b),
Mather's existence theorem, controlled vector fields and Thom's first isotopy lemma (Layer 5); the
face structure of manifolds with corners built on the abstract boundary (depth, the immersion `j`,
products), embedded corners, intersections of boundary hypersurfaces and collars of boundary
hypersurfaces (Layer 6); unfolding data, gluing, the unfolding of a Thom–Mather space and
reconstruction (Layer 7); `C¹` cells and Whitney stratifications of definable sets (Layer 8). A
search of main for stratifications, exit paths, o-minimal structures, control data and faces of
manifolds with corners finds no other owner, except that DifferentialGeometry 5.5 owns the abstract
boundary `∂̃M` of a manifold with corners, which it uses for Stokes' theorem; Layer 6 consumes it
and builds the face structure on top of it, defining no second boundary carrier.

**Left to other roadmaps.** Semialgebraic sets, cylindrical algebraic decomposition,
Tarski–Seidenberg and sign determination are RealAlgebraicGeometry (completed); its exports in Tau
Ceti are consumed by 4.2 and 4.4. Semianalytic and subanalytic sets, the o-minimality of `ℝ_an`
and `ℝ_exp`, Nash and analytic regularity of simplices, semianalytic dimension (R1.1) and
Łojasiewicz's triangulation are RealAnalyticGeometry (R1, R2, R5). The CAD-based construction of
triangulations of compact semialgebraic sets with its lifting data, the definition of
semialgebraic dimension from CAD cells, and its product and fibre-dimension laws are
AffineMorseLefschetz A4.1; by 4.9 its existential triangulation theorem and its independence,
union and closure laws for dimension are specializations of 4.5 and 4.7, and its lifting
construction keeps an independent role, since RealAnalyticGeometry R2.1 consumes the lifting data
that 4.7 does not supply. Euler characteristics of every kind, including the o-minimal one, are
AlgebraicTopology. The collar theorem for manifolds with boundary and the tubular neighbourhood
theorem are GeometricTopology Layer 1.

**Out of scope.** Constructible sheaves on stratified spaces, exit-path ∞-categories and
2-categories, constructible stacks and hypercoverings; intersection homology; Whitney's condition
(a) and Verdier's condition (w) as subjects; the second isotopy lemma. No roadmap on main states
them.

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
   in Ayala–Francis–Tanaka and Nocera–Volpe. The depth of a point of a manifold with corners (6.1)
   is a different number, its number of vanishing corner coordinates; 7.6 uses that one. Witness:
   in `ℝ` stratified as in Convention 1 the point stratum has depth `1` and the open stratum depth
   `0`; in the quadrant `[0, ∞)²` stratified by its four faces the origin has depth `2`, equal to
   its corner depth.
7. **Coordinates for tame geometry.** Definable sets live in `Fin n → R`. A cylinder over
   `Fin n → R` adds coordinate `0`: the point over `x` at height `t` is `Fin.cons t x`, and the
   projection is `Fin.tail`, as in RealAlgebraicGeometry and Tau Ceti's `TauCeti.IsCAD`, so that
   cylindrical algebraic decompositions are cell decompositions without reindexing. Graphs of maps
   `(Fin m → R) → (Fin n → R)` are subsets of `Fin (m + n) → R` via `Fin.append`. Witness:
   `Fin.tail (Fin.cons t x) = x` and `Fin.cons t x 0 = t`; the graph of `x ↦ x 0 ^ 2` on
   `Fin 1 → ℝ` contains `Fin.append ![2] ![4] = ![2, 4]`.
8. **O-minimal structures carry parameters.** An `OMinimalStructure R` is a family of sets, not a
   first-order theory, and every point is definable; the bridge to Mathlib's `FirstOrder.Language`
   is a theorem (4.2), not the definition. Witness: `{x : Fin 1 → R | x 0 = a}` is definable by
   `mem_one_iff` with `F = {a}` and `J = ∅`, while `{x | x 0 ∈ ℕ}` in `Fin 1 → ℝ` is definable in
   no `OMinimalStructure ℝ` (4.1).
9. **Smoothness.** Smooth means `C^∞`. Strata of a smooth stratified space are boundaryless smooth
   manifolds modelled on `EuclideanSpace ℝ (Fin d)`, `d` depending on the stratum, in the sense of
   `IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin d)) ∞` for the subspace topology. Submersions are
   Mathlib's `Manifold.IsSubmersionAt`. Witness: the image of the injective immersion
   `t ↦ (sin 2t, sin t)` of `(−π, π)` is a figure eight, and with the subspace topology no
   neighbourhood of the origin is homeomorphic to an interval (removing the origin from a small
   connected neighbourhood leaves four components); it is not a stratum.
10. **Manifolds with corners** are Hausdorff, second-countable smooth manifolds modelled on
    `EuclideanQuadrant n` through `modelWithCornersEuclideanQuadrant n`, with the face structure
    of 6.1; in Layers 6.2–7 they have embedded corners (6.2). Witness: the four corners of
    `[0, 1]²` have depth `2` and each lies on two boundary hypersurfaces; the corner of the
    teardrop of 6.2 has depth `2` and lies on one.
11. **Fibrations** are locally trivial fibre bundles given by Mathlib's `Bundle.Trivialization`:
    `p : E → B` with fibre `F` is locally trivial when every `b` lies in the base set of some
    `Bundle.Trivialization F p`. Hurewicz and Serre fibrations are not used. Witness:
    `x ↦ x / |x|` from `ℝ² ∖ {0}` to the circle is trivial with fibre `(0, ∞)`; the first
    projection from `[0, 1] × ℝ ∖ {(1/2, 0)}` to `[0, 1]` is not locally trivial at `1/2`, whose
    fibre `ℝ ∖ {0}` is disconnected while the nearby fibres are `ℝ`.
12. **Finite posets.** Strata are indexed by a finite poset in Layers 5–7; Layers 1–3 allow any
    partial order. Witness: `ℝ` over `ℤ` with `s(x) = ⌈x⌉` is a stratification (the nonempty
    proper upper sets of `ℤ` are the `Ici n`, with preimages `(n − 1, ∞)`) with infinitely many
    strata; Layers 5–7 exclude it.

## Exact supplier contracts

**From Mathlib** (at the pins).

- Topology: `Topology.WithUpperSet`, `Topology.IsUpperSet`,
  `Topology.IsUpperSet.closure_eq_lowerClosure`, `Topology.IsUpperSet.specializes_iff_le`,
  `IsUpperSet`, `IsLocallyClosed`, `closure`, `frontier`, `IsProperMap`,
  `Topology.IsOpenEmbedding`, `Homeomorph`, `OnePoint`, `OnePoint.isOpen_range_coe`.
- Paths and categories: `Path`, `Path.trans`, `Path.refl`, `Path.Homotopy`,
  `Path.Homotopy.eval`, `Path.Homotopic`, `FundamentalGroupoid`, `CategoryTheory.Paths`,
  `CategoryTheory.Paths.of`, `CategoryTheory.Quotient`, `HomRel`, `Preorder.smallCategory`,
  `CategoryTheory.Equivalence`.
- Bundles and manifolds: `Bundle.Trivialization`, `IsManifold`, `ContMDiff`,
  `Manifold.IsSubmersionAt`, `Manifold.IsImmersionAt`, `IsMIntegralCurve`, `EuclideanQuadrant`,
  `modelWithCornersEuclideanQuadrant`, `ModelWithCorners.boundary`, `ModelWithCorners.interior`,
  `tangentConeAt`, `fderiv`.
- Combinatorics and logic: `Geometry.SimplicialComplex`, `Setoid.IsPartition`, `Fin.cons`,
  `Fin.tail`, `Fin.init`, `Fin.append`, `FirstOrder.Language`, `Set.Definable`.

**From Tau Ceti** (at the pin).

- `TauCeti.IsSemialgebraic` and `TauCeti.IsSemialgebraic.exists_eq_setOf_sign_eval`
  (`TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean`); `TauCeti.IsSemialgebraicOn`
  (`TauCeti/Geometry/RealAlgebraic/Semialgebraic/Function.lean`);
  `TauCeti.IsSemialgebraic.image_tail` (`TauCeti/Geometry/RealAlgebraic/CAD/Existence.lean`,
  Tarski–Seidenberg); `TauCeti.IsCAD` and `TauCeti.IsCAD.finite`
  (`TauCeti/Geometry/RealAlgebraic/CAD/Basic.lean`).
- `TauCeti.AbstractSimplicialComplex.orderComplex`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean`), whose faces are the nonempty
  finite chains of a poset; `AbstractSimplicialComplex.Realization`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean`);
  `TauCeti.IsTriangulable` (`TauCeti/Topology/Triangulable.lean`).
- `TauCeti.IsCollar` and `TauCeti.IsLocallyCollared`
  (`TauCeti/Geometry/Manifold/Boundary/Collar/Global.lean`), and Brown's collaring theorem
  `TauCeti.IsLocallyCollared.isCollared` (`TauCeti/Geometry/Manifold/Boundary/Collar/Brown.lean`).

**From RealAlgebraicGeometry** (completed). Layer 3 (sign determination) and Layer 6 (CAD and
quantifier elimination), through the Tau Ceti declarations above (4.2, 4.4).

**From AffineMorseLefschetz.** A4.1's semialgebraic dimension defined from CAD cells (4.9(a)).

**From RealAnalyticGeometry.** R2.1's comparison of a finite `Geometry.SimplicialComplex ℝ E` with
the realization carrier (4.7, the `TauCeti.IsTriangulable` corollary).

**From GeometricTopology.** Layer 1: the collar theorem for manifolds with boundary (2.3(a)) and
the tubular neighbourhood theorem for closed submanifolds (2.3(d), 5.3).

**From DifferentialGeometry.** 5.5: the abstract boundary `∂̃M` of a manifold with corners, the
pairs of a point and a local face through it, a manifold with corners one dimension down, with its
map to `M` whose fibre over `x` has as many points as `x` has local faces (6.1).

Neither pin has stratifications, open cones, exit paths, o-minimal structures, cells, control
data, or the abstract boundary of a manifold with corners.

## How to read the build

Layers 1–3 are topological and rest on Mathlib, with GeometricTopology Layer 1 for two examples of
2.3: stratifications and the incidence order, then open cones and conical charts, then exit paths
and the exit-path category with its structure theorems. Layer 4 is independent of them except
4.8: o-minimal structures over a linearly ordered type, cells, dimension and triangulation, with
the semialgebraic structure built on Tau Ceti's exports of RealAlgebraicGeometry and the
comparisons of 4.7 and 4.9 with RealAnalyticGeometry R2.1 and AffineMorseLefschetz A4.1. Layer 5
builds smooth stratified spaces and Thom–Mather control data on Layers 1–2 and GeometricTopology's
tubular neighbourhoods, and ends with Thom's first isotopy lemma. Layer 6 builds the face
structure of manifolds with corners on DifferentialGeometry 5.5's abstract boundary, Mathlib's
quadrant model and Tau Ceti's collars. Layer 7
unfolds a Thom–Mather space into the manifolds with corners of Layer 6 and reconstructs it. Layer
8 combines Layers 4 and 5 for definable sets over `ℝ`.

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
by products and by restriction to open subsets, and holds for the realization of an abstract
simplicial complex stratified by its open simplices over the face poset.
*Needs:* 1.1, 1.2; Tau Ceti `AbstractSimplicialComplex.Realization`.

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

Mathlib, and Tau Ceti's simplicial complexes for 1.3–1.4. Within the layer, 1.2 uses 1.1, 1.3
uses 1.1–1.2, and 1.4 uses 1.3.

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
  not in `C(ℕ)`, so a definition by the quotient topology differs for noncompact `L`.
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
open for it but is not a neighbourhood of the origin. This is why Layer 7 glues along all pairs
`i < k`, not only covering pairs.
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
`s x ≤ s y`.
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
category; Lurie, *Higher Algebra*, §A.6). Prove: exit homotopy is an
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
the exit-path category is the product of `FundamentalGroupoid Z` with that of `C(L)`.
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

## Layer 4: o-minimal structures, cells, dimension, triangulation

Work over a linearly ordered type `R` with the order topology and the product topology on
`Fin n → R`. From 4.3 on, `R` is a nonempty dense linear order without endpoints.

### 4.1 Structures

Define `OMinimalStructure R` (van den Dries, *Tame Topology and o-minimal Structures*, Chapter 1,
§§2–3): Boolean algebras of subsets of `Fin n → R`, closed under `Fin.tail`- and
`Fin.init`-cylinders, containing the diagonals and `{x 0 < x 1}`, closed under the projection
`Fin.tail`, with the definable subsets of `Fin 1 → R` exactly the finite unions of points and open
intervals with endpoints in `WithBot R` and `WithTop R`; define
`OMinimalStructure.DefinableFunOn` and `OMinimalStructure.DefinableMapOn` by graphs. Derive:
closure under coordinate permutations, products via `Fin.append`, all coordinate projections,
fibres and finite intersections; composition, images and preimages of definable maps; closure,
interior and frontier of a definable set are definable.
*Needs:* Mathlib `Fin.cons`, `Fin.tail`, `Fin.init`, `Fin.append`.

**Checks.**

- `{x | x 0 ∈ ℕ}` in `Fin 1 → ℝ` is definable in no `OMinimalStructure ℝ`: an open interval around
  `1` contains non-integers, so `1, 2, …` would all be points of the finite `F`.
- The definable subsets of `Fin 0 → R` are `∅` and `univ`, the only two subsets of a point.
- `DefinableFunOn univ (fun x => x 0)` holds: its graph is `{y : Fin 2 → R | y 0 = y 1}`, a
  diagonal.

### 4.2 Semialgebraic sets are o-minimal

Prove `exists_oMinimalStructure_eq_isSemialgebraic`: some `OMinimalStructure ℝ` has as definable
sets exactly the `TauCeti.IsSemialgebraic` sets. Projection is `TauCeti.IsSemialgebraic.image_tail`
(RealAlgebraicGeometry Layer 6); the one-variable axiom comes from
`TauCeti.IsSemialgebraic.exists_eq_setOf_sign_eval` and the finiteness of real roots
(RealAlgebraicGeometry Layer 3). Prove that it is the smallest structure on `ℝ` containing the
graphs of addition and multiplication. The identification of semialgebraic sets with sets
definable with parameters in Mathlib's `FirstOrder.Language` sense is RealAlgebraicGeometry Layer
6 material and is consumed.
*Needs:* 4.1; Tau Ceti `TauCeti.IsSemialgebraic`, `TauCeti.IsSemialgebraic.image_tail`,
`TauCeti.IsSemialgebraic.exists_eq_setOf_sign_eval`.

**Checks.**

- `{x : Fin 1 → ℝ | x 0 ^ 2 < 2}` is semialgebraic and equals the interval `(−√2, √2)`, with
  irrational endpoints: interval endpoints range over `R`, not over the coefficients.
- `{x : Fin 1 → ℝ | Real.sin (x 0) = 0}` is not semialgebraic: it is infinite and discrete.
- The projection by `Fin.tail` of `{y : Fin 2 → ℝ | y 0 ^ 2 = y 1}` is `{x | 0 ≤ x 0}`, which is
  `F = {0}` with `J = {(0, ⊤)}`.

### 4.3 Monotonicity

For `R` as in the layer's standing hypothesis, a definable `f : R → R` is, off finitely many
points, continuous and either constant or strictly monotone on each of finitely many open
intervals (van den Dries, Chapter 3, (1.2)).
*Needs:* 4.1.

**Checks.**

- `x ↦ 1/x` extended by `0` at `0`: one exceptional point, strictly decreasing on `(−∞, 0)` and
  `(0, ∞)`.
- The sign function: constant on two intervals, one exceptional point.
- `x ↦ ⌊x⌋` on `ℝ` has infinitely many discontinuities, so it is definable in no o-minimal
  structure on `ℝ`.

### 4.4 Cells and cell decomposition

For `R` a nonempty dense linear order without endpoints, define `OMinimalStructure.IsCell` and
`OMinimalStructure.IsCellDecomposition` with the `Fin.cons`/`Fin.tail` convention. Prove: cells
are definable, nonempty, definably connected and locally closed; each cell is definably
homeomorphic to an open cell of its dimension by a coordinate projection; the cell decomposition
theorem `OMinimalStructure.exists_isCellDecomposition`, part (I), decompositions partitioning
finitely many definable sets, and part (II), a definable function is continuous on each cell of
some decomposition (van den Dries, Chapter 3, (2.3)–(2.11)); uniform finiteness: a definable
family of finite subsets of `R` has a uniform bound on cardinality (Chapter 3, §2). Every
`TauCeti.IsCAD n 𝒞`, finite by `TauCeti.IsCAD.finite`, is through `Set.Finite.toFinset` a cell
decomposition for the structure of 4.2.
*Needs:* 4.1, 4.3; Tau Ceti `TauCeti.IsCAD`, `TauCeti.IsCAD.finite`; Mathlib
`Setoid.IsPartition`.

**Checks.**

- `R = Empty` is dense without endpoints but `Fin 1 → R` is empty: its only partition is `∅`,
  whose projection is `∅ ≠ {univ}`, so no cell decomposition of `Fin 1 → R` exists. The theorem
  needs `[Nonempty R]`.
- In `Fin 1 → ℝ` the decomposition partitioning `{x | x 0 = 0}` is the three cells `x 0 < 0`,
  `x 0 = 0` (a graph over the point) and `x 0 > 0` (bands).
- The decomposition of `Fin 2 → ℝ` partitioning the unit circle over the base cells
  `(−∞, −1)`, `{−1}`, `(−1, 1)`, `{1}`, `(1, ∞)` has `13` cells: `5` over `(−1, 1)`, `3` over
  each of `{−1}` and `{1}`, and `1` over each of the two half-lines.

### 4.5 Dimension

For `R` as in 4.4, define `dim A` as the largest dimension of a cell in a decomposition
partitioning `A`, with `dim ∅ = ⊥` in `WithBot ℕ`. Prove independence of the decomposition,
invariance under definable bijections, `dim (A ∪ B) = max (dim A) (dim B)`, and the frontier
inequality `dim (closure A ∖ A) < dim A` for nonempty `A` (van den Dries, Chapter 4, §1).
*Needs:* 4.4.

**Checks.**

- `dim ∅ = ⊥`, a finite nonempty set has dimension `0`, the unit circle has dimension `1`.
- For `A = (0, 1)` in `ℝ`, `closure A ∖ A = {0, 1}` has dimension `0 < 1`; for the closed
  `A = [0, 1]` the frontier is empty, of dimension `⊥`.
- The union of the unit circle and the origin has dimension `max 1 0 = 1`; a definition by the
  dimension of the ambient space would give `2`.

### 4.6 Definable choice and curve selection

For an o-minimal expansion of an ordered abelian group, definable families have definable
sections; for an expansion of an ordered field, a point in the closure of a definable `A` is the
limit at `0⁺` of a continuous definable curve `(0, ε) → A` (van den Dries, Chapter 6, §1).
*Needs:* 4.4, 4.5.

**Checks.**

- For `A = {(x, y) : y > 0}` and the origin, `t ↦ (0, t)` is a selected curve.
- For the family `{t : t² = x}` over `x ≥ 0`, `x ↦ √x` is a definable section.
- Definability is needed: `A = {(1/n, 0) : n ≥ 1}` has the origin in its closure, but a
  continuous curve into the discrete `A` is constant and does not tend to the origin.

### 4.7 Triangulation

For an o-minimal expansion of an ordered field (the graphs of `+` and `·` definable), prove
`OMinimalStructure.exists_triangulation`: every definable `A ⊆ Fin n → R` and finitely many
definable `B_i ⊆ A` admit a finite `Geometry.SimplicialComplex R (Fin n → R)`, a set `T` of its
faces and a definable homeomorphism of `A` onto the union of the `openSimplex τ`, `τ ∈ T`, mapping
each `B_i` onto a union of open simplices (van den Dries, Chapter 8, (2.9)). For `R = ℝ` and
closed bounded `A`, deduce `TauCeti.IsTriangulable A` through RealAnalyticGeometry R2.1's
comparison of a finite `Geometry.SimplicialComplex ℝ E` with the realization carrier.
*Needs:* 4.1–4.6; Mathlib `Geometry.SimplicialComplex`; RealAnalyticGeometry R2.1; Tau Ceti
`TauCeti.IsTriangulable`.

**Checks.**

- `openSimplex {v} = {v}`, `openSimplex {v, w}` is the open segment, and `openSimplex ∅ = ∅`
  (the weights would sum to `0`).
- `A = (0, 1]` in `ℝ` is triangulated by the complex with vertices `0`, `1`, `T = {{1}, {0, 1}}`
  and `Φ = id`: `T` need not be a subcomplex, which is why non-closed sets are allowed.
- The closed unit disc with its boundary circle as `B` is triangulated through the semialgebraic
  map `x ↦ (|x| / ‖x‖_∞) x` onto the square `[−1, 1]²`, triangulated with the boundary as a
  subcomplex.

### 4.8 Definable sets are conically stratified

For `R = ℝ`, a definable set stratified by the images of the open simplices of a triangulation is
conically stratified over the face poset (2.3(b)) and satisfies the frontier condition (1.3).
*Needs:* 2.3, 4.7.

**Checks.**

- `(0, 1]` stratified by `{1} < (0, 1)` is conically stratified with link a point at `1`.
- The cone `{x² + y² = z²}` has link two circles at the origin.
- The cusp `{y² = x³}` triangulated with a vertex at the origin has link two points there.

### 4.9 The semialgebraic specialization

For the structure of 4.2: (a) the dimension of 4.5 equals AffineMorseLefschetz A4.1's
semialgebraic dimension defined from CAD cells, so A4.1's independence, finite-union and closure
laws for that dimension are specializations of 4.5; A4.1's product and fibre-dimension laws and
its comparison with smooth and complex-analytic dimension remain A4.1 targets. (b)
`exists_triangulation_semialgebraic`: 4.7 for semialgebraic `A` and `B_i`, with `Φ`
semialgebraic on `A` (`TauCeti.IsSemialgebraicOn`). For compact `A` it is the finite compatible
triangulation of a compact semialgebraic set, and A4.1's existential triangulation theorem is this
statement transported along R2.1's carrier comparison.
*Needs:* 4.2, 4.5, 4.7; AffineMorseLefschetz A4.1 (semialgebraic dimension); Tau Ceti
`TauCeti.IsSemialgebraicOn`.

**Checks.**

- `{xy = 0}` in `ℝ²` has dimension `1` in both senses; the origin has dimension `0`.
- For the identity of a semialgebraic `A`, the graph `{(x, x) : x ∈ A}` is semialgebraic, so
  `TauCeti.IsSemialgebraicOn id A` holds, as `Φ = id` in the second check of 4.7 requires.
- The closed unit disc of 4.7 is compact semialgebraic, and its triangulation is the compatible
  triangulation of A4.1 with the circle as a subcomplex.

### Examples

The semialgebraic structure on `ℝ`; the cell decompositions of `ℝ` and of the circle above; the
triangulated disc.

### Dependencies

Mathlib, Tau Ceti's semialgebraic and CAD exports (RealAlgebraicGeometry Layers 3 and 6),
RealAnalyticGeometry R2.1 for the corollary of 4.7, AffineMorseLefschetz A4.1 for 4.9(a), and
2.3 for 4.8. No item of 4.1–4.8 uses A4.1's or R2.1's dimension or triangulation theorems, so A4.1
and R2.1 can state theirs as specializations of 4.5, 4.7 and 4.9 without a cycle.

## Layer 5: smooth stratified spaces, control data and the first isotopy lemma

A **smooth stratified space** is a Hausdorff, locally compact, second-countable `X` with a
stratification over a finite `P` satisfying the frontier condition, each stratum a smooth manifold
as in Convention 9.

### 5.1 Tubes and control data

Define a tube around `X_p` (Mather, *Notes on topological stability*, §7) as `(T_p, π_p, ρ_p)`: an
open `T_p ⊇ X_p`, a continuous retraction `π_p : T_p → X_p` and a continuous `ρ_p : T_p → [0, ∞)`
with `ρ_p⁻¹(0) = X_p`. Control data are tubes for all `p` such that, for `p < q` and
`x ∈ T_p ∩ T_q` with `π_q x ∈ T_p`, `π_p(π_q x) = π_p x` and `ρ_p(π_q x) = ρ_p x`, and
`(π_p, ρ_p)` restricted to `T_p ∩ X_q` is a smooth submersion to `X_p × (0, ∞)`. They are
*normalised* when `T_p ∩ X_q ≠ ∅` implies `p ≤ q`. A **Thom–Mather space** is a smooth stratified
space with control data. Prove: control data restrict to smaller tubes, in particular to
`T_p(ε) = {ρ_p < ε ∘ π_p}` for continuous `ε : X_p → (0, ∞)`; every control data can be shrunk to
normalised control data, by replacing `T_p` with `T_p ∖ ⋃_{q ≱ p} closure X_q`, which is open (a
finite union of closed sets is removed) and contains `X_p` (a point of `X_p ∩ closure X_q` has
`p ≤ q` by Convention 1), the control conditions holding on the smaller tubes; open subsets of
Thom–Mather spaces are Thom–Mather spaces; the explicit normalised control data on 2.3(c) with
`T₀ = ℝ²`, `π₀ = 0`, `ρ₀ = x² + y²`, `T₁ = {|y| < |x|}`, `π₁(x, y) = (sign x · √(x² + y²), 0)`,
`ρ₁ = arctan(y/x)²`, `T₂ = X₂`, `π₂ = id`, `ρ₂ = 0`.
*Needs:* 1.3; Mathlib `IsManifold`, `ContMDiff`, `Manifold.IsSubmersionAt`.

**Checks.**

- The data on `ℝ²` satisfy the control conditions: `ρ₀(π₁(x, y)) = x² + y² = ρ₀(x, y)` and
  `π₀ ∘ π₁ = 0 = π₀`; in polar coordinates on `T₁ ∩ X₂`, `(π₁, ρ₁) = ((±r, 0), θ²)` with `θ ≠ 0`,
  a submersion. Replacing `π₁` by `(x, y) ↦ (x, 0)` breaks `ρ₀ ∘ π₁ = ρ₀`, since `x² ≠ x² + y²`.
- Negative control for the normalisation: on `ℝ²` with strata `a = {0}`, `b = {x₁ = 1}` and `c`
  the rest, `a < c`, `b < c`, `a`, `b` incomparable, let `T_a = B(0, 1/8) ∪ S` with
  `S = {|x₁ − 1| < 1/2, |x₂| < 1}`, `π_a = 0`, `ρ_a = |x|²` on the ball and `e^{x₂} + 1` on `S`;
  `T_b = S`, `π_b(x) = (1, x₂)`, `ρ_b = (x₁ − 1)²`; `T_c = X_c`, `π_c = id`, `ρ_c = 0`. These are
  control data, not normalised: `T_a ∩ X_b ≠ ∅` with `a ≰ b`. Shrinking gives the
  normalised tube `T_a ∖ closure X_b` around `a`.
- Shrinking the `ℝ²` data by `ε = 1` gives `T₀(1)` the open unit disc.

### 5.2 Whitney's condition (b)

A smooth submanifold of `E = EuclideanSpace ℝ (Fin n)` is a set that is locally the zero set of a
smooth map to `ℝ^{n−d}` with surjective derivative; its tangent space at `x` is the kernel of that
derivative. Prove it is independent of the defining map and equals `tangentConeAt ℝ S x`.
Subspaces of fixed dimension converge when their orthogonal projections converge in operator
norm. For submanifolds `Y ⊆ closure X ∖ X`, the pair `(X, Y)` satisfies (b) at `y ∈ Y` when for
all sequences `x_k ∈ X`, `y_k ∈ Y` converging to `y` with `x_k ≠ y_k`, if the lines
`ℝ(x_k − y_k)` converge to `ℓ` and `T_{x_k}X` converge to `τ`, then `ℓ ⊆ τ`. A Whitney stratified
set is a closed `A ⊆ E` with a finite stratification into submanifolds satisfying the frontier
condition and (b) for every incident pair (Mather, §§6–7).
*Needs:* 1.3; Mathlib `tangentConeAt`, `fderiv`.

**Checks.**

- The unit circle defined by `x² + y² − 1` or by `(x² + y² − 1) eˣ` has the same tangent lines:
  on the circle the second derivative is `eˣ` times the first.
- The cone `{x² + y² = z²}` minus the origin over `Y = {0}` satisfies (b): it is ruled by lines
  through `0`, which lie in its tangent planes.
- The logarithmic spiral `r = e^{−θ}` over `Y = {0}` fails (b): its tangent makes a constant angle
  of `π/4` with the radius, so along `θ = 2πk` the secants tend to the `x`-axis and the tangents to
  a line at angle `π/4`.

### 5.3 Existence of control data

Every Whitney stratified closed subset of `E` is a Thom–Mather space with normalised control data
(Mather, §7, followed by the normalisation of 5.1). The proof builds tubes from tubular
neighbourhoods by downward induction on the strata, using (b) to make `(π_p, ρ_p)` a submersion
near `X_p`.
*Needs:* 5.1, 5.2; GeometricTopology Layer 1 (tubular neighbourhood theorem).

**Checks.**

- For a closed submanifold `X₀ ⊆ E` with `X₁ = E ∖ X₀`, the data are a tubular neighbourhood with
  `π₀` its projection and `ρ₀` the squared distance, a submersion off `X₀`.
- For the cone `{x² + y² = z²}`, `T₀ = ℝ³`, `π₀ = 0`, `ρ₀ = |x|²` restrict to a submersion on the
  cone minus `0`, which is radial.
- 2.3(c) is Whitney stratified (for the line over the origin the secants lie in the line, and
  the open stratum has tangent planes `ℝ²`), and 5.1 gives control data for it explicitly.

### 5.4 Controlled vector fields

A controlled vector field is a family of smooth vector fields `ξ_q` on the strata with
`dπ_p(ξ_q) = ξ_p ∘ π_p` and `dρ_p(ξ_q) = 0` on `T_p ∩ X_q` near `X_p` (Mather, §§9–10). Prove that
its stratumwise integral curves (Mathlib's `IsMIntegralCurve`) assemble into a continuous local
flow on `X`, and lifting: given a controlled submersion `f : X → ℝ^m` (a smooth submersion on each
stratum, with `f ∘ π_p = f` near `X_p`), every smooth vector field on `ℝ^m` lifts to a controlled
vector field.
*Needs:* 5.1; Mathlib `IsMIntegralCurve`.

**Checks.**

- On the `ℝ²` data the radial field is not controlled: `dρ₀(x ∂_x + y ∂_y) = 2(x² + y²) ≠ 0`.
- The zero field is controlled and its flow is the identity.
- The `ℝ²` example has no controlled submersion to `ℝ`: its stratum `X₀` is a point, on which no
  map to `ℝ` is a submersion.

### 5.5 Thom's first isotopy lemma

A proper controlled submersion `f : X → ℝ^m` from a Thom–Mather space is a locally trivial fibre
bundle by stratum-preserving homeomorphisms `f⁻¹(U) ≃ₜ U × F` (Mather, Corollary 10.2). The
embedded form: for a Whitney stratified closed `A ⊆ E` and a smooth `f : E → ℝ^m`, proper on `A`
and a submersion on each stratum, `f|_A` is stratum-preservingly locally trivial (Mather,
Proposition 11.1). Corollaries, for normalised control data: (a) **local conical structure**: each
`x ∈ X_p` has a neighbourhood stratum-preservingly homeomorphic to `ℝ^{dim X_p} × C(L_p)` with
`L_p = ρ_p⁻¹(ε) ∩ π_p⁻¹(x)`, so every Thom–Mather space is conically stratified (2.2; Nocera and
Volpe, Theorem 1.1, show more: a finite-dimensional abstract stratified set in Mather's sense has a
conically smooth atlas); (b) the link `L_p` is a compact Thom–Mather space with control data
induced from `X`, and its homeomorphism type is locally constant along `X_p`; (c)
`π_p : T_p(ε) ∩ π_p⁻¹(U) → U` is stratum-preservingly trivial over small `U`.
*Needs:* 2.2, 5.3, 5.4; Mathlib `Bundle.Trivialization`, `IsProperMap`.

**Checks.**

- Properness is needed: `(x, y) ↦ x` on `ℝ² ∖ {0}` is a submersion whose fibre over `0` is two
  half-lines and elsewhere a line.
- The stratumwise submersion is needed: `z` on the cone `{x² + y² = z²}` is proper with fibres
  circles for `z ≠ 0` and a point at `0`, and fails to submerse on the stratum `{0}`.
- (a) for the `ℝ²` data: `L₀ = ρ₀⁻¹(ε)` is a circle meeting `X₁` in two points and `X₂` in two
  arcs, the link of 2.3(c).

### Examples

2.3(c) with the data of 5.1; the cone `{x² + y² = z²}`; a closed submanifold of `E` with its
complement.

### Dependencies

Layers 1–2 and GeometricTopology Layer 1. Within the layer, 5.3 uses 5.1–5.2, 5.4 uses 5.1, and
5.5 uses 5.3–5.4 and 2.2.

## Layer 6: manifolds with corners, faces and embedded corners

### 6.1 The face structure

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

### 6.2 Boundary hypersurfaces and embedded corners

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
*Needs:* 6.1.

**Checks.**

- `[0, 1]²` has embedded corners and four boundary hypersurfaces, the edges.
- The teardrop does not: its corner has depth `2` and lies in its only boundary hypersurface.
- `EuclideanQuadrant 2` has two boundary hypersurfaces, the half-axes, and the origin, of depth
  `2`, lies in both.

### 6.3 Intersections of boundary hypersurfaces

Let `M` have embedded corners and dimension `n`, and let `H_1, …, H_k` be distinct boundary
hypersurfaces with intersection `F = H_1 ∩ ⋯ ∩ H_k`. Prove: every `x ∈ F` has a chart of `M`
centred at `x`, with coordinates `u`, and distinct corner indices `i_1, …, i_k` such that near `x`
`H_l = {u_{i_l} = 0}` for `l = 1, …, k`. Hence `F` is empty or a closed embedded
submanifold with corners of dimension `n − k`; each point of `F` has depth at least `k` in `M`, and
its depth in `F` is its depth in `M` minus `k`; `F` has embedded corners, and its boundary
hypersurfaces are the connected components of the sets `F ∩ H` for the boundary hypersurfaces `H`
of `M` other than `H_1, …, H_k`. The proof uses embeddedness twice: `H_1, …, H_k` come from `k`
distinct local boundary germs at `x`, and, `j` being proper and injective on each component, near
`x` each of `H_1, …, H_k` is the image of one sheet only.
*Needs:* 6.2.

**Checks.**

- In `[0, 1]²` an edge is a boundary hypersurface and a closed interval, although the depth-`≥ 1`
  locus is the whole, connected, boundary circle: hypersurfaces are not components of that locus.
- Two adjacent edges of `[0, 1]²` meet in one corner point (`k = 2`, dimension `0`); two opposite
  edges do not meet.
- In the teardrop the only boundary hypersurface passes twice through the corner and is a
  coordinate face in no chart there.

### 6.4 Collars of boundary hypersurfaces

A *face collar* of a boundary hypersurface `H` is a `TauCeti.IsCollar` of the inclusion `H → M`:
an open embedding `c : H × [0, 1) → M` restricting to the inclusion at `0`; it is *smooth* when
`c` is a diffeomorphism onto its image for the product structure of `H × [0, 1)`. Prove: for
compact `M` with embedded corners, every boundary hypersurface has a face collar, since by 6.3 it
is locally collared (in a chart, `(y, t) ↦ y + δ t e_{i_l}`), so Brown's theorem
`TauCeti.IsLocallyCollared.isCollared` applies; and it has a smooth face collar, from the flow of
an inward-pointing vector field tangent to the other boundary hypersurfaces, glued from the
coordinate fields of 6.3 by a partition of unity, as in the proof of the collar theorem (Lee,
*Introduction to Smooth Manifolds*, Theorem 9.25). A finite family of face collars is
*compatible* when the collars commute where defined; compatible collars enter Layer 7 as data of a
smooth unfolding datum, and no existence theorem for compatible families is stated here.
*Needs:* 6.3; Tau Ceti `TauCeti.IsCollar`, `TauCeti.IsLocallyCollared`,
`TauCeti.IsLocallyCollared.isCollared`.

**Checks.**

- For the edge `{0} × [0, 1]` of `[0, 1]²`, `((0, y), t) ↦ (t/2, y)` is a smooth face collar, and
  `((x, 0), t) ↦ (x, t/2)` is one for `[0, 1] × {0}`; they are restrictions of the commuting
  translations `(x, y) ↦ (x + t/2, y)` and `(x, y) ↦ (x, y + t/2)`, so the pair is compatible.
- The teardrop, without embedded corners, is a closed disc and its boundary hypersurface has a
  topological collar; it has no smooth one, since that hypersurface is not a submanifold with
  corners at the corner point, where it has two branches: the smooth statement needs 6.2.
- Both fields of `TauCeti.IsCollar` bind: for the edge `H = {0} × [0, 1]`, the embedding
  `((0, y), t) ↦ (t/2, y/2)` has zero slice `y ↦ (0, y/2)`, not the inclusion, and its image
  `[0, 1/2) × [0, 1/2]` is not open in `[0, 1]²`.

### Examples

`[0, 1]ⁿ`, `EuclideanQuadrant n`, products of manifolds with boundary; the teardrop as the
standard manifold with corners without embedded corners.

### Dependencies

DifferentialGeometry 5.5, Mathlib's quadrant model and Tau Ceti's collars. Within the layer, 6.2
uses 6.1, 6.3 uses 6.2, and 6.4 uses 6.3.

## Layer 7: unfolding, gluing and reconstruction

Fix a finite poset `I`.

### 7.1 Unfolding data

An unfolding datum over `I` consists of Hausdorff spaces `Σ_j`; for each `i < j` a closed subset
`∂_iΣ_j ⊆ Σ_j` with a collar `c_ij : ∂_iΣ_j × [0, 1) → Σ_j` (a `TauCeti.IsCollar` of the inclusion),
and a proper continuous map `s_ij : ∂_iΣ_j → Σ_i`; such that: for `i, j` incomparable,
`∂_iΣ_k ∩ ∂_jΣ_k = ∅`; for `i < j < k`, `∂_iΣ_k ∩ ∂_jΣ_k = s_jk⁻¹(∂_iΣ_j)` and `s_ik = s_ij ∘ s_jk`
there; the collars commute where defined and satisfy `s_jk ∘ c_ik(y, t) = c_ij(s_jk y, t)`; and the
datum is **locally trivial**: every `b ∈ Σ_i` has a neighbourhood `U` over which all the maps
`s_ij : ∂_iΣ_j → Σ_i`, `j > i`, are trivialized simultaneously, compatibly with the faces and
collars above them. A **smooth** unfolding datum has each `Σ_j` a manifold with embedded corners
(Convention 10, 6.2) of a dimension depending on `j`; each `∂_iΣ_j` is a union of boundary
hypersurfaces of `Σ_j`, every boundary hypersurface lies in exactly one `∂_iΣ_j`, and two distinct
boundary hypersurfaces in the same `∂_iΣ_j` are disjoint; the collar of each hypersurface in
`∂_iΣ_j` is a smooth face collar (6.4); and all maps are smooth. By 6.3 the sets `∂_iΣ_k ∩ ∂_jΣ_k`
are then closed embedded submanifolds with corners of codimension two.
*Needs:* 6.2–6.4; Tau Ceti `TauCeti.IsCollar`.

**Checks.**

- The datum of the `ℝ²` example (7.3): `Σ₀` a point, `Σ₁` two closed half-lines, `Σ₂` the
  complement in `ℝ²` of an open disc and of two open wedges around the `x`-axis, two components
  with four corner points in all, each in `∂₀Σ₂ ∩ ∂₁Σ₂`.
- `[0, 1]` over `I = {a, b, c}` with `a, b < c` incomparable: `Σ_a`, `Σ_b` points,
  `Σ_c = [ε, 1 − ε]`, `∂_aΣ_c = {ε}` and `∂_bΣ_c = {1 − ε}`, disjoint as required.
- In the `ℝ²` datum, `s₀₂ = s₀₁ ∘ s₁₂` on the corners: a corner goes to an endpoint of a half-line
  and then to the point `Σ₀`, as it goes directly.

### 7.2 Gluing

Define `glue(Σ) = (⊔_j Σ_j)/∼` with `∼` generated by `y ∼ s_ij(y)` for `y ∈ ∂_iΣ_j`, stratified
over `I` by sending the image of `Σ_j ∖ ⋃_i ∂_iΣ_j` to `j`. Prove: `glue(Σ)` is Hausdorff, compact
when every `Σ_j` is; its stratum `j` is homeomorphic to `Σ_j ∖ ⋃_i ∂_iΣ_j`; it is conically
stratified, the link of a point of stratum `i` over `b ∈ Σ_i` being `glue` of the fibre datum
`(s_ij⁻¹(b))_{j > i}` over `I_{>i}`.
*Needs:* 2.2, 7.1.

**Checks.**

- `glue` of the `[0, 1]` datum is `[ε, 1 − ε] ≃ₜ [0, 1]` with its three strata.
- `glue` of the `ℝ²` datum is homeomorphic to `ℝ²`, and the link of the stratum `0` is the glued
  fibre datum: a circle made of the two arcs of `∂₀Σ₂` and the two endpoints of `Σ₁`.
- The relation is the generated equivalence: in the `ℝ²` datum a corner `y` of `Σ₂` is related to
  `s₁₂ y ∈ Σ₁` and to `s₀₂ y ∈ Σ₀`, and `s₁₂ y` to `s₀₁ (s₁₂ y)`, which is `s₀₂ y`; the corner,
  the endpoint and the point `Σ₀` become one point.

### 7.3 Unfolding a Thom–Mather space

Given a Thom–Mather space `X` over `I` with normalised control data, there are continuous
`ε_i : X_i → (0, ∞)` such that `Σ_j = closure X_j ∖ ⋃_{i<j} T_i(ε_i)`,
`∂_iΣ_j = Σ_j ∩ {ρ_i = ε_i ∘ π_i}`, `s_ij = π_i`, and collars from the flow of a controlled vector
field transverse to the level sets of `ρ_i` form a smooth unfolding datum (Albin, Leichtnam,
Mazzeo and Piazza, §2). The control conditions give `s_ik = s_ij ∘ s_jk`; the first isotopy lemma
gives local triviality.
*Needs:* 5.1, 5.4, 5.5, 7.1.

**Checks.**

- For the `ℝ²` data with constants `ε₀`, `ε₁`: `Σ₁ = ℝ × {0} ∖ (−√ε₀, √ε₀) × {0}`, and `Σ₂` the
  complement of the disc of radius `√ε₀` and of the wedges `θ² < ε₁` around the `x`-axis.
- For the cone `{x² + y² = z²}`: `Σ₀ = {0}`, and `Σ₁` the cone minus an open ball around `0`, two
  copies of `S¹ × [√ε, ∞)` with `∂₀Σ₁` the two boundary circles.
- For `[0, 1]` with `T_a = [0, 1/2)`, `ρ_a = x²`, and symmetrically at `1`: `Σ_c = [√ε, 1 − √ε]`.

### 7.4 Reconstruction

For `X` and `Σ` as in 7.3, `glue(Σ)` is homeomorphic to `X` by a stratum-preserving homeomorphism
that is the identity on the complement in each `Σ_j` of the images of the collars `c_ij`. For
conically smooth spaces the analogous resolution is the unzipping of Ayala, Francis and Tanaka,
Theorem 7.3.8.
*Needs:* 7.2, 7.3.

**Checks.**

- The `ℝ²` example: gluing recovers `ℝ²`.
- The cone: gluing the two circles of `∂₀Σ₁` to the point `Σ₀` recovers the cone.
- `[0, 1]`: gluing `√ε` to `Σ_a` and `1 − √ε` to `Σ_b` recovers `[0, 1]`, by a homeomorphism
  that is the identity outside the images of the two collars.

### 7.5 Faces indexed by flags

For a chain `d = (i_1 < ⋯ < i_n)` let `Σ_d = ∂_{i_1}Σ_{i_n} ∩ ⋯ ∩ ∂_{i_{n−1}}Σ_{i_n}` (and
`Σ_d = Σ_{i_1}` when `n = 1`); for `d` the initial segment `(i_1 < ⋯ < i_p)` of `d'`, the
compatibilities make `s_{i_p i_n}` a map `Σ_{d'} → Σ_d`. In a smooth unfolding datum: (a) the set
indexed by a subset `{k_1, …, k_m}` of `]i, j[` in the fibre `F = s_ij⁻¹(b)`, namely
`F ∩ ∂_{k_1}Σ_j ∩ ⋯ ∩ ∂_{k_m}Σ_j`, is empty unless the subset is a chain; (b) the boundary of each
fibre of `Σ_{d'} → Σ_d` is the union of the sets indexed by the nonempty chains of the ordinal sum
`]i_p, i_{p+1}[ ⊔ ⋯ ⊔ ]i_{n−1}, i_n[`, so the fibres are boundaryless when every step
`i_l < i_{l+1}` with `l ≥ p` is a covering; (c) for a datum from 7.3, with nonempty strata and `I`
the incidence order, every one of these sets is nonempty, so the fibres are boundaryless exactly
when every step `i_l < i_{l+1}` with `l ≥ p` is a covering. The condition involves `i_p, …, i_n`
and not `i_1, …, i_{p−1}`.
*Needs:* 6.3, 7.1, 7.3.

**Checks.**

- `ℝ²`, `d = (0 < 1 < 2)`: `Σ_d` is the four corners, mapping two-to-one onto the two endpoints
  `Σ_{(0<1)} = ∂₀Σ₁`; the fibres are two points, boundaryless, and `2` covers `1`.
- `ℝ²`, `d' = (0 < 2)` over `d = (0)`: the fibre `∂₀Σ₂` is two arcs, whose boundary is the four
  corners, indexed by the chain `{1}` of `]0, 2[`, and `2` does not cover `0`.
- `[0, 1]`: `a` and `b` are incomparable, and `∂_aΣ_c ∩ ∂_bΣ_c = ∅`, as (a) requires.

### 7.6 The ordered-space form

On `Σ = ⊔_j Σ_j` let `x < y` iff `y ∈ ∂_iΣ_j` and `x = s_ij y` for some `i < j`. Prove: `<` is a
strict partial order; the index map `Σ → I` is locally constant and strictly monotone; for each
`y ∈ Σ_j`, `{x | x < y}` is a finite chain whose cardinality, in a smooth datum, is the corner
depth of `y` in the manifold with corners `Σ_j` (6.1), not the depth of a stratum (Convention 6);
`∂_iΣ_j` is the set of `y ∈ Σ_j` with some `x < y` in `Σ_i`, and `s_ij y` is the unique such `x`.
Hence the datum without collars is determined by `(Σ, <, Σ → I)`.
*Needs:* 6.1, 7.1.

**Checks.**

- `ℝ²`: a corner of `Σ₂` has two predecessors (an endpoint of `Σ₁` and the point `Σ₀`), corner
  depth `2`.
- `ℝ²`: a point on an open arc of `∂₀Σ₂` has one predecessor, depth `1`; an interior point of `Σ₂`
  has none.
- `[0, 1]`: the endpoint `√ε` of `Σ_c` has the single predecessor `Σ_a`, depth `1`.

### 7.7 Mixed tubes

For `i ≤ j ≤ k` in a Thom–Mather space with normalised control data, let
`M^j_{ik} = (T_i ∩ closure X_k) ∖ ⋃_{j ≤ l < k} X_l`. Prove: `M^i_{ik} = T_i ∩ X_k` (a point of
`T_i ∩ closure X_k` lies in a stratum `l` with `i ≤ l` by normalisation and `l ≤ k` by Convention
1), `M^k_{ik} = T_i ∩ closure X_k`, `j ↦ M^j_{ik}` is monotone, and over a small open `U ⊆ X_i`,
`π_i : M^j_{ik} ∩ π_i⁻¹(U) → U` is trivial with fibre the subset of `C(L_i) ∩ closure X_k`
obtained by deleting the strata indexed in `[j, k[`.
*Needs:* 5.1, 5.5.

**Checks.**

- Negative control: for the non-normalised data of 5.1 (strata `a`, `b`, `c`),
  `M^a_{ac} = T_a ∖ {0}` contains `X_b ∩ S`, so it strictly contains
  `T_a ∩ X_c`: without normalisation the first identity fails.
- `ℝ²`, `i = 0`, `k = 2`: `M^0_{02} = X₂`, `M^1_{02} = ℝ² ∖ X₁`, `M^2_{02} = ℝ²`, increasing.
- `j = k` deletes nothing: `M^k_{ik} = T_i ∩ closure X_k`, whose fibre over `U` is the whole
  `C(L_i) ∩ closure X_k`.

### Examples

The `ℝ²` example of 2.3(c) and 5.1; the cone `{x² + y² = z²}`; `[0, 1]` with its two endpoints.

### Dependencies

Layers 5 and 6. Within the layer, 7.2 uses 7.1, 7.3 uses 7.1 and Layer 5, 7.4 uses 7.2–7.3, 7.5
uses 7.1 and 7.3, 7.6 uses 7.1, and 7.7 uses Layer 5.

## Layer 8: definable stratifications over `ℝ`

Work with an o-minimal expansion of the real field (graphs of `+` and `·` on `ℝ` definable).

### 8.1 `C¹` cells

Definable functions are `C¹` off a definable set of lower dimension; every finite family of
definable sets is partitioned by a decomposition into `C¹` cells, each a `C¹` submanifold of
`Fin n → ℝ` (van den Dries, Chapter 7).
*Needs:* 4.4, 4.5.

**Checks.**

- `x ↦ |x|` is `C¹` off `{0}`, a set of dimension `0 < 1`.
- `x ↦ x^{1/3}` (semialgebraic) is `C¹` off `{0}`, where its derivative is unbounded.
- The cusp `{y² = x³}` is partitioned into three `C¹` cells: the origin and the two open branches.

### 8.2 Whitney stratification

For every finite `k ≥ 1`, every closed definable set admits a finite stratification into definable
connected `C^k` submanifolds satisfying the frontier condition and Whitney's condition (b) (5.2
with `C^k` in place of smooth), compatible with finitely many definable subsets (van den Dries and
Miller, *Geometric categories and o-minimal structures*, 4.8(1)).
*Needs:* 5.2, 8.1.

**Checks.**

- The cone `{x² + y² = z²}` with strata `{0}` and its complement, which has two connected
  components, refined to three connected strata.
- `{xy = 0}` with the origin below the four open half-axes.
- `|x|^{k + 1/2}` (semialgebraic) is `C^k` and not `C^{k+1}` at `0`: strata of class `C^k` for
  each finite `k` is the general statement, and `C^∞` needs 8.3.

### 8.3 The semialgebraic case with smooth strata

For the semialgebraic structure the strata can be taken to be Nash, hence smooth, submanifolds
(Bochnak, Coste and Roy, *Real Algebraic Geometry*, Theorem 9.7.11). Consequently every compact
semialgebraic set carries normalised Thom–Mather control data (5.3), a smooth unfolding datum
(7.3) and the reconstruction of 7.4.
*Needs:* 4.2, 5.3, 7.3, 7.4, 8.2.

**Checks.**

- The closed unit disc: the circle below the open disc, both Nash.
- The cone `{x² + y² = z²}` intersected with the closed unit ball: its unfolding is that of 7.3,
  truncated.
- `{xy = 0} ∩ [−1, 1]²`: the origin, the four end points and the four open half-segments.

### Examples

Compact semialgebraic sets; the cone; the cusp.

### Dependencies

Layers 4 and 5, and 7.3–7.4 for 8.3. Within the layer, 8.2 uses 8.1 and 8.3 uses 8.2.

## Downstream consumers

No roadmap on main cites this one. Among roadmaps under review: ShimuraVarieties §3.5a imports
Layer 4 (o-minimal structures, both parts of the cell decomposition theorem, piecewise continuity
and dimension with its independence, bijection-invariance, union and frontier laws) for the
structure `ℝ_an,exp`, and proves the product, projection and fibre-dimension laws there;
ImplicitAtlases Layer 6.1 stratifies each thickening over a finite poset with the sets `X^{≥s}`
open, which is a stratification in the sense of 1.1.

## Research context

Grothendieck's *Esquisse d'un programme*, §5, proposes a "tame topology" suited to stratified
structures; o-minimal structures are a framework for it. His notes on stratified spaces are in the
University of Montpellier's collection (Montpellier fonds, folder 150, p. 11,
https://grothendieck.umontpellier.fr/150.pdf).

## References

- J. Lurie, *Higher Algebra*, Appendix A: Definitions A.5.1 (Alexandrov topology and
  stratifications), A.5.3 (open cone), A.5.5 (conically stratified spaces), §A.6 (exit paths),
  and Proposition A.6.8 (the stratification of the realization of a locally finite simplicial
  complex by open simplices is conical).
- J. Woolf, "The fundamental category of a stratified space", *Journal of Homotopy and Related
  Structures* 4 (2009), 359–387: the 1-categorical exit-path category.
- D. Treumann, "Exit paths and constructible stacks", *Compositio Mathematica* 145 (2009),
  1504–1532, doi:10.1112/S0010437X09004229; numbering of arXiv:0708.0659: Example 1.4 (the
  exit-path category of `S²` stratified by a point).
- L. van den Dries, *Tame Topology and o-minimal Structures*, LMS Lecture Note Series 248,
  Cambridge University Press (1998): Chapter 1, §§2–3 (structures, o-minimality); Chapter 3,
  (1.2) (monotonicity) and §2, (2.3)–(2.11) (cells, cell decomposition, uniform finiteness);
  Chapter 4, §1 (dimension, dimension of the frontier); Chapter 6, §1 (definable choice, curve
  selection); Chapter 7 (`C¹` cell decomposition); Chapter 8, (2.9) (triangulation).
- L. van den Dries and C. Miller, "Geometric categories and o-minimal structures", *Duke
  Mathematical Journal* 84 (1996), 497–540, 4.8(1) (Whitney stratifications with `C^k` strata).
- J. Bochnak, M. Coste and M.-F. Roy, *Real Algebraic Geometry*, Ergebnisse der Mathematik 36,
  Springer (1998), Theorem 9.7.11 (Whitney stratification of semialgebraic sets with Nash
  strata).
- J. Mather, "Notes on topological stability", *Bulletin of the AMS* 49 (2012), 475–506 (Harvard
  notes, 1970): §§6–7 (Whitney's condition (b), tubes, control data and their existence), §§9–10
  (controlled vector fields), Corollary 10.2 (Thom's first isotopy lemma), Proposition 11.1 (its
  form for Whitney stratified subsets).
- P. Albin, É. Leichtnam, R. Mazzeo and P. Piazza, "The signature package on Witt spaces",
  *Annales scientifiques de l'École normale supérieure* 45 (2012), 241–310, §2 (resolution of a
  Thom–Mather space to a manifold with corners and iterated fibration structure, and its
  blow-down).
- D. Joyce, "On manifolds with corners", in *Advances in Geometric Analysis*, Advanced Lectures in
  Mathematics 21 (2012), 225–258, §2; numbering of arXiv:0910.3518v2: Definition 2.3 (depth),
  Definitions 2.5–2.6 (local boundary components and the boundary `∂X`), Remark 2.11 (manifolds
  with faces, embedded corners, the teardrop).
- J. M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Graduate Texts in Mathematics 218,
  Springer (2013), Theorem 9.25 (the collar theorem).
- D. Ayala, J. Francis and H. L. Tanaka, "Local structures on stratified spaces", *Advances in
  Mathematics* 307 (2017), 903–1028, doi:10.1016/j.aim.2016.11.032; numbering of
  arXiv:1409.0501: Theorem 7.3.8 (unzipping).
- G. Nocera and M. Volpe, "Whitney stratifications are conically smooth", *Selecta Mathematica
  (N.S.)* 29 (2023), Paper No. 68, doi:10.1007/s00029-023-00877-4; numbering of arXiv:2105.09243:
  Theorem 1.1 (abstract stratified sets) and Theorem 2.25 (Whitney stratified spaces).
- A. Grothendieck, *Esquisse d'un programme* (1984), §5 ("tame topology"), in *Geometric Galois
  Actions 1*, LMS Lecture Note Series 242 (1997).
