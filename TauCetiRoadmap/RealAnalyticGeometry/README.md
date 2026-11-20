# Roadmap: real-analytic geometry and semianalytic triangulation

**Summary.** This roadmap develops the local and global geometry of real-analytic manifolds and of
their semianalytic subsets: the sets that, near every point, are finite unions of finite
intersections of loci `f = 0` and `f > 0` of real-analytic functions. Manifolds are Hausdorff,
second countable, finite-dimensional and without boundary, and analytic means given by convergent
power series. A theorem about polynomial semialgebraic sets does not discharge a semianalytic
statement, and subanalytic sets are not part of the roadmap.

Its headline theorems are four.

- *Łojasiewicz's triangulation theorem.* If `M` is a real-analytic manifold and `(B_ν)` is a
  locally finite family of semianalytic subsets of `M`, there are a locally finite simplicial
  complex `K` and a homeomorphism `τ : |K| → M` that maps every open simplex analytically
  isomorphically onto an analytic submanifold of `M` lying either inside or outside each `B_ν`.
  Moreover `τ` has Łojasiewicz's property (A): locally over each point of `M`, its graph is cut
  out by sign conditions on functions that are polynomial in the coordinates of `|K|` with
  analytic coefficients.
- *The semialgebraic triangulation theorems.* If `B_1, …, B_k` are bounded semialgebraic subsets
  of `ℝⁿ`, the union of their closures is the image of a finite simplicial complex in `ℝⁿ` under a
  homeomorphism with semialgebraic graph that is an analytic isomorphism on each open simplex and
  is compatible with every `B_i`. Every finite product of real projective spaces has a finite
  triangulation of the same kind compatible with finitely many semialgebraic subsets.
- *Grauert's embedding theorem.* Every real-analytic manifold of dimension `n` has a proper
  real-analytic embedding with injective differential into `ℝ^(4n+2)`; its image is closed.
- *The Stein theory behind it.* A complex manifold with a smooth strictly plurisubharmonic
  exhaustion is Stein (holomorphically convex, with holomorphic functions separating points and
  giving local coordinates); a complexification of `M` carries such an exhaustion on a tube around
  `M`, so the tube is Stein. On a complete Kähler manifold with a Hermitian holomorphic bundle and
  a weight whose curvature operator is positive semi-definite, Hörmander's weighted `L²` estimate solves
  `∂̄u = f` for every `∂̄`-closed bundle-valued `(n, k)`-form `f` that is square-integrable for the
  weight and of finite weighted inverse-curvature norm, with `u` bounded by that norm. On a Stein manifold, Cartan's theorems hold for coherent analytic
  sheaves: global sections generate every stalk, and `Hᵏ(X, F) = 0` for `k > 0`.

The roadmap sits between real algebraic and complex geometry. The completed
RealAlgebraicGeometry roadmap supplies the Thom encodings, subresultants and root continuity from
which the local decomposition of semianalytic sets is built. AffineMorseLefschetz supplies the
finite semialgebraic lifting construction whose analytic refinement gives the bounded theorem.
ComplexKahlerGeometry supplies the local algebra of holomorphic germs, the holomorphic structure
sheaf and the local Kähler identities, and uses Layers 1 and 5 in return. ComplexComparisonPartII
and SchubertGeometry build on the Stein and coherent theory of Layer 3.

Layer 0 fixes analytic germs and analytic submanifolds on a manifold. Layer 1 proves the local
normal decomposition of semianalytic sets, their dimension theory and the Nash refinement.
Layer 2 proves Łojasiewicz's theorem in affine space and the semialgebraic theorems. Layer 3
builds the complexification, the weighted `∂̄` theory, the Stein criteria and Cartan's theorems.
Layer 4 proves Grauert's embedding theorem, and Layer 5 transports the affine triangulation to
manifolds.

## How to read the build

The labels R0–R5, R1.1, R2.1 and R3.0–R3.2, by which other roadmaps cite this one, appear in the
headings: Rk is Layer k and Rk.n is §k.n. In Layers 1 and 2 the sections numbered `k.0` and
`k.0a`, `k.0b`, … come before §k.1, which uses them; §§2.1a–2.1b continue §2.1.

Layers 0–2 form the real part. §§0.1–0.2 are used by the complexification of §3.0 and by
Layer 5. §1.0 proves the local normal decomposition by induction on the dimension and §1.0a draws
its dimension and frontier consequences; §1.1 refines both to the Nash category for the semialgebraic theorems. Layer 2 is
one induction on the dimension of the affine space, in the order its *Needs:* lines force: normal
boxes (§2.0), nonsingular directions (§2.0a), partially semialgebraic sets (§2.0b), adapted
decompositions (§2.0c), the straightening of graph families (§2.0d), and the three steps of the
construction (§§2.0e–2.0g), ending with Theorem 1 in §2.0h. §2.1 proves the bounded semialgebraic
theorem on the semialgebraic lift of AffineMorseLefschetz, and §§2.1a–2.1b the multiprojective
theorem.

Layers 3–5 form the global part. §3.0 builds the complexification and its strictly
plurisubharmonic tube; §3.1 proves the weighted `∂̄` theorem and, from it, the Stein criterion,
interpolation and approximation; §3.2 proves Cartan's theorems. Layer 4 uses only §3.1's
consequences for the tube, and Layer 5 combines Layers 1, 2 and 4. Each subsection's *Needs:*
line lists what its statement and its route use, so that a target proved another way is not
blocked behind an unrelated section.

## Conventions

1. **Manifolds.** A manifold is Hausdorff, second countable, finite-dimensional and without
   boundary. A real-analytic manifold is a charted space `M` over a boundaryless model
   `I : ModelWithCorners ℝ E H`, `E` a finite-dimensional real normed space, with
   `IsManifold I ω M`; its analytic charts are those of the maximal `ω` atlas. A complex manifold
   is `IsManifold 𝓘(ℂ, E) ∞ X`, and holomorphic maps are `MDifferentiable` for the complex
   models. A complex manifold of complex dimension `n` is a real-analytic manifold of real
   dimension `2n` with the same charts (`IsManifold.restrictScalars_of_ne_zero`, the realified
   atlas of ComplexKahlerGeometry K3.0).
2. **Analytic.** Analytic means Mathlib's `AnalyticAt` (a convergent power series); formal Taylor
   data without a convergence statement is not an analytic map. A function on a real-analytic
   manifold is analytic at a point exactly when its expression in one, equivalently every, chart
   of the maximal atlas is (`TauCeti.contMDiffAt_omega_iff_analyticAt`).
3. **Semianalytic.** A subset `s` of a real normed space is semianalytic at `x`
   (`TauCeti.SemianalyticAt s x`) when, on a neighbourhood `U` of `x`, it agrees with a finite
   Boolean combination of the sets `{f = 0}` and `{f > 0}` for functions `f` analytic on `U`;
   the functions, the neighbourhood and the formula may depend on `x`. It is semianalytic
   (`TauCeti.IsSemianalytic s`) when it is semianalytic at every point of the ambient space,
   including points outside `s`. On a real-analytic manifold the notion is read in charts
   (`TauCeti.IsMSemianalytic I s`). Images of semianalytic sets under proper analytic maps are not
   asserted to be semianalytic.
4. **Semialgebraic and Nash.** Semialgebraic subsets of `σ → ℝ`, `σ` finite, are
   `TauCeti.IsSemialgebraic`; a function is semialgebraic on `s` (`TauCeti.IsSemialgebraicOn f s`)
   when `s` and its graph, a subset of the coordinate space indexed by `σ ⊕ τ`, are semialgebraic.
   Tarski–Seidenberg is the instance `TauCeti.HasSemialgebraicProjections ℝ`. A real function is a
   Nash germ at `x` (`TauCeti.IsNashAt f x`) when it is analytic at `x` and some nonzero polynomial
   `P(y, t)` satisfies `P(y, f(y)) = 0` near `x`; a map is Nash when its coordinates are, and a
   Nash function on an open set is one that is a Nash germ at each of its points. A set is
   locally semialgebraic (`TauCeti.IsLocallySemialgebraic`) when every ambient point has an open
   semialgebraic neighbourhood meeting it in a semialgebraic set.
5. **Analytic submanifolds of `ℝⁿ`.** `TauCeti.IsAnalyticSubmanifold d S` says that `S ⊆ ℝⁿ` is a
   nonempty `d`-dimensional analytic submanifold, straightened near each point by an analytic
   chart of `ℝⁿ`; `TauCeti.AnalyticOnSubmanifold d f S` says that `f` is analytic on it, in those
   charts. An analytic isomorphism `S → T` of `d`-dimensional analytic submanifolds is a bijection
   that is analytic on `S` with inverse analytic on `T`. On a manifold, analytic submanifolds and
   maps are read in charts as in §0.2.
6. **Property (A).** Write `ℝⁿ = ℝ^(n−1) × ℝ` with base `u` and vertical coordinate `t` where a
   vertical direction is singled out. A set `s ⊆ E × ℝ^ι` is partially semialgebraic
   (`TauCeti.IsPartiallySemialgebraic s`) when, over a neighbourhood `U` of every base point, it
   is a finite Boolean combination of sign conditions on functions polynomial in the fibre
   coordinates with coefficients analytic on `U`. A map `f` from a subset of `ℝᵐ` to `ℝⁿ` has
   *property (A)* when its graph `{(y, x) : y = f(x)} ⊆ ℝⁿ × ℝᵐ`, base the target and fibre the
   source, is partially semialgebraic, and *property (A⁻¹)* when the same holds with base the
   source and fibre the target. Neither says that the graph is semialgebraic. Property (A) for maps
   into a manifold is defined in §5.2.
7. **Simplicial complexes.** A simplicial complex is Mathlib's `Geometry.SimplicialComplex ℝ V` in
   a finite-dimensional real vector space `V`, with faces `K.faces` and support `|K| = K.space`.
   The open simplex of a face `s` is the intrinsic interior of its convex hull,
   `intrinsicInterior ℝ (convexHull ℝ s)`, of dimension `card s − 1`; it is not the interior in
   `V`. `K` is finite when `K.faces` is finite and locally finite when the convex hulls of its
   faces form a locally finite family. A homeomorphism `τ : |K| → X` is compatible with a family
   `(B_ν)` of subsets of `X` when every open simplex has its image inside `B_ν` or inside its
   complement, for every `ν`. Statements on a finite-dimensional real affine space are made in
   affine coordinates `ℝⁿ = Fin n → ℝ`, written `RealCoordinates n` in `Suggested.lean` (§2.0
   proves that nothing depends on the choice).
8. **Stein manifolds and plurisubharmonicity.** A complex manifold `X` is Stein when it is
   holomorphically convex (the holomorphic hull of every compact set is compact), holomorphically
   separable (global holomorphic functions separate points) and has holomorphic local coordinates
   (at each point some global holomorphic functions have differentials spanning the cotangent
   space). A `C²` real function is strictly plurisubharmonic at `x` when its Levi form at `x` is
   positive definite (`TauCeti.IsManifoldStrictlyPlurisubharmonicAt`, through
   `TauCeti.manifoldLeviForm`). An exhaustion is a proper function bounded below.
9. **Weighted forms.** On a Kähler manifold `X` of complex dimension `n` with a Hermitian
   holomorphic bundle `E`, `Θ(E)` is the Chern curvature, `Λ` the adjoint of the Lefschetz
   operator, `dV` the Kähler volume, and the weight `e^(−φ)` multiplies the pointwise norm; on
   `E`-valued `(n, k)`-forms, `B = [iΘ(E) + i∂∂̄φ, Λ]`. Coherent analytic sheaves are the module
   sheaves of §3.2, item 0.

## Layer 0: real-analytic germs and chartwise submanifolds (R0)

This layer puts the coordinate theory of analytic germs and analytic submanifolds on a
real-analytic manifold. Convergent local complexification, its uniqueness, its compatibility
with pullback and the complexification of analytic charts are taken in coordinates from the
supplier contracts; this layer reads them on `M` and checks that nothing depends on the chart.

### 0.1 Analytic germs on a manifold and their complexification

Let `M` be a real-analytic manifold of dimension `n`. Define the ring of analytic germs of `M` at
`x`: germs at `x` of real functions on `M` that are analytic near `x` (Convention 2). Prove that the
chart representative identifies it, for every chart `φ` of the maximal atlas at `x`, with the ring
`TauCeti.analyticGerms ℝ (φ x)` of germs at `φ(x)` in the model, compatibly with the canonical
isomorphisms `ModelWithCorners.analyticGermsEquiv` between the germ rings of two charts; and that
an analytic map of manifolds `g : M → M′` induces a ring homomorphism from the germs of `M′` at
`g(x)` to the germs of `M` at `x`, which in charts is `TauCeti.analyticGerms.pullback` along the
chart expression of `g`, is functorial in `g`, and is an isomorphism when `g` is an analytic
isomorphism near `x`. For a model `ℝⁿ`, define the complexification of a germ at `x` through a
chart by `TauCeti.analyticGerms.complexify`, and prove that the complexifications through two
charts correspond under the holomorphic germ of the complexified transition map
(`OpenPartialHomeomorph.exists_complexification`, `TauCeti.analyticGerms.complexify_pullback`).
This is the local input to the gluing of §3.0 (Whitney–Bruhat, §1).
*Needs:* Tau Ceti `TauCeti.contMDiffAt_omega_iff_analyticAt`, `TauCeti.analyticGerms`,
`ModelWithCorners.analyticGermsEquiv`, `TauCeti.analyticGerms.pullback`,
`TauCeti.analyticGerms.complexify`, `TauCeti.analyticGerms.complexify_pullback`,
`OpenPartialHomeomorph.exists_complexification`.

- Two functions analytic near `x` have the same germ exactly when their representatives in one,
  equivalently every, chart at `x` agree near the image of `x`
  (`ModelWithCorners.analyticGermsEquiv_ofAnalyticAt_comp_extend_symm_of_contMDiffAt`); on a
  connected open set, two analytic functions agreeing near one point agree everywhere
  (`ContMDiff.eq_of_eventuallyEq`).
- The complexification of a germ is a holomorphic germ commuting with complex conjugation, and
  every holomorphic germ at a real point commuting with conjugation is a complexification
  (`TauCeti.analyticGerms.exists_complexify_eq_iff_eventually_apply_star`), through any chart.

**Checks.**
- The homeomorphism `x ↦ x³` of `ℝ` is not a chart of the maximal analytic atlas of `ℝ`: the
  coordinate function `x`, read in it, is `y ↦ y^(1/3)`, which is not analytic at `0`. A ring of
  germs defined through arbitrary topological charts would depend on the chart.

### 0.2 Chartwise analytic submanifolds

Fix a continuous real-linear equivalence `e : E ≃L[ℝ] ℝⁿ`. Define a nonempty subset `S ⊆ M` to be
a `d`-dimensional analytic submanifold of `M` (`ChartwiseRealAnalyticSubmanifold`) when, for each
`x ∈ S`, the image of `S` near `x` under the extended chart at `x` followed by `e` is, on some open
set `U ⊆ ℝⁿ` containing the image of `x` and contained in the chart's target, a `d`-dimensional
analytic submanifold in the sense of `TauCeti.IsAnalyticSubmanifold`. Define a map from a
`d`-dimensional analytic submanifold of `ℝᴺ` into `M` to be analytic (`AnalyticOnSubmanifoldInto`)
when near each point it maps the submanifold into the source of the chart at the image point and its
expression in that chart, followed by `e`, is analytic on the submanifold
(`TauCeti.AnalyticOnSubmanifold`), and a map from an analytic submanifold of `M` to `ℝᴺ` to be
analytic (`ChartwiseAnalyticOn`) when its expression through the inverse of those charts is. Prove that both notions are independent of the chart of the maximal atlas and of
`e`, that they are transported by analytic isomorphisms of manifolds, that for `M = ℝⁿ` with its
identity chart they are `TauCeti.IsAnalyticSubmanifold` and `TauCeti.AnalyticOnSubmanifold`, and
that a relatively open nonempty subset of an analytic submanifold is one. On a complex manifold of
complex dimension `n` the notions are read in the realified atlas, of real dimension `2n`.
*Needs:* §0.1; Tau Ceti `TauCeti.IsAnalyticSubmanifold`, `TauCeti.AnalyticOnSubmanifold`,
`TauCeti.IsAnalyticSubmanifold.image_of_leftInvOn`, `TauCeti.analyticOnNhd_ext_coord_change`,
`IsManifold.restrictScalars_of_ne_zero`; ComplexKahlerGeometry K3.0 (§3.1) for the realified
atlas.

**Checks.**
- In `ℝ²`, the cross `{xy = 0}` is not a `1`-dimensional analytic submanifold, although it is the
  union of two analytic submanifolds (the axes) and each axis minus the origin is one. A
  definition asking only for a local finite union of analytic submanifolds would accept it.

### Examples

- On the circle `S¹` with its two stereographic charts, the germ at a point of the restriction of
  the coordinate function `x₁` of `ℝ²` is the same element of the ring of §0.1 through either
  chart, and its complexifications through the two charts agree under the complexified transition
  map `z ↦ 1/z`.
- The diagonal `{(x, x)}` of a real-analytic manifold `M × M` is an `n`-dimensional analytic
  submanifold of it in the sense of §0.2.

### Dependencies

Mathlib: analytic functions and the maximal analytic atlas. Tau Ceti: the chart dictionary for
analytic maps, analytic submanifolds of `ℝⁿ`, and the convergent complexification of germs and
charts. ComplexKahlerGeometry K3.0 (§3.1) for the realified atlas of a complex manifold.

## Layer 1: local normal decomposition, dimension and the Nash category (R1)

Semianalytic sets and their closure under finite Boolean operations, locally finite unions and
analytic preimages are those of Convention 3. This layer proves their local structure: a normal
decomposition into analytic submanifolds near each point, the resulting dimension theory and the
frontier condition, and their refinements in the Nash category. The decompositions are local; no
chartwise decompositions are glued into a global stratification here (§5.3 does that on a
triangulated manifold).

### 1.0 Local normal decomposition

Prove the local normal decomposition, part of the local theory of semianalytic sets that
Łojasiewicz states without proof in §1: let
`U ⊆ ℝⁿ` be open, `x ∈ U` and `f_1, …, f_k` analytic on `U`. There is an open neighbourhood
`V ⊆ U` of `x` and a finite partition of `V` into connected, locally closed analytic submanifolds
of `ℝⁿ` (the pieces) such that `x` lies in the closure of every piece (Łojasiewicz, §1.II.4,
p. 452); every `f_j` has constant sign (negative, zero or positive) on every piece; every piece is
semianalytic, and so is every connected component of every sign-condition
set `{sign f_1 = ε_1, …, sign f_k = ε_k} ∩ V`, which is a union of pieces; inside `V` the closure of
a piece is a union of pieces; and a piece contained in the closure of another, distinct piece has
strictly smaller dimension.

Route, by induction on `n`. The case `n = 1` is the three-cell normal form
(`TauCeti.semianalyticAt_real_iff`, `TauCeti.SemianalyticAt.exists_Ioo_mem_iff_sign_mem`). For
`n > 1`, after a generic linear change of coordinates and shrinking, real Weierstrass preparation
makes each nonzero `f_j` a unit times a monic polynomial in the last variable with analytic
coefficients in the others: complexify (`AnalyticAt.exists_complexification`), apply convergent
complex Weierstrass preparation (ComplexKahlerGeometry K3, §3.2), and use uniqueness and
conjugation (`TauCeti.analyticGerms.exists_complexify_eq_iff_eventually_apply_star`) to make the
factors real. Remove repeated factors by squarefree reduction with the subresultant gcd criterion
(RealAlgebraicGeometry Layer 2); the discriminant of a product with a repeated factor vanishes
identically, so the reduction comes first. Put the leading coefficients, the discriminants and
resultants, and every principal subresultant coefficient of `(P_i, P_i′)` and of `(P_i, P_j)`
into the family decomposed in dimension `n − 1`. On each base piece these coefficients have
constant sign, which fixes the degrees and the gcd degrees, so the family is delineable
(`TauCeti.nonempty_delineation`, with RealAlgebraicGeometry Layer 4 for the continuity
and constancy of the ordered roots); its root functions are analytic on the base piece
(`TauCeti.Delineation.analyticOnSubmanifold_root`; at simple roots also
`AnalyticAt.exists_analyticAt_eventually_eq_zero_iff`), and Thom encodings (RealAlgebraicGeometry
Layer 1) describe each section by sign conditions, which makes the sections and sectors
semianalytic. The roots of a Weierstrass polynomial tend to the last coordinate of `x` as the base
variable tends to the projection `x′` of `x`, so every section and sector over a base piece with
`x′` in its closure has `x` in its closure. Carry local connectedness at frontier points as an
induction invariant, and prove from it and the root-matching neighbourhoods that the boundary of a
section or sector is a union of lower sections and sectors. The induction terminates because each
step lowers the dimension. A global refinement of an analytic atlas is not a substitute for this
bad-set induction.
*Needs:* Tau Ceti `TauCeti.SemianalyticAt`, `TauCeti.semianalyticAt_real_iff`,
`AnalyticAt.exists_complexification`, `TauCeti.analyticGerms.exists_complexify_eq_iff_eventually_apply_star`,
`TauCeti.nonempty_delineation`, `TauCeti.Delineation.analyticOnSubmanifold_root`,
`AnalyticAt.exists_analyticAt_eventually_eq_zero_iff`; ComplexKahlerGeometry K3 (§3.2, Weierstrass
preparation and division); RealAlgebraicGeometry Layers 1, 2 and 4.

- *Analytic-coefficient delineability.* Subresultants of polynomials with analytic coefficients
  are polynomial expressions in those coefficients, hence analytic; on a connected analytic
  submanifold of the base where the selected pivot minors do not vanish, the constant-rank gcd
  and squarefree formulas have analytic coefficients.
- *Shrinking.* The decomposition can be chosen inside any prescribed neighbourhood of `x`, and
  restricts to a decomposition of the same kind on every smaller open neighbourhood of `x` on
  which the pieces stay connected; `x` stays in the closure of every restricted piece.
- *Compatibility.* For a semianalytic set `A` with a presentation near `x` by the functions
  `f_j`, every piece lies in `A` or in its complement, so `A ∩ V` is a union of pieces.

**Checks.**
- For `f = x² − y²` near the origin of `ℝ²`, a normal decomposition has nine pieces: the origin,
  the four open half-lines of the cross `{x² = y²}` and the four open sectors. The connected
  components of the sign conditions give only five sets, among them the whole cross, which is not
  an analytic submanifold at the origin; a decomposition into sign-condition components fails the
  submanifold requirement.

### 1.0a Dimension, components and the frontier condition

For a set `A` semianalytic at `x`, define its local dimension at `x` as the largest dimension of a
piece contained in `A` of a normal decomposition near `x` compatible with `A`, with
`dim_x ∅ = −∞`, and the dimension of a semianalytic set as the supremum of its local dimensions.
Prove that the local dimension does not depend on the decomposition; that `dim closure(A) = dim A`;
that `dim(closure(A) ∖ A) < dim A` for nonempty `A`; that a set of dimension `0` near `x` is
locally finite there; that the connected components of a semianalytic set form a locally finite
family and each is semianalytic; and that the pieces of a normal decomposition satisfy both parts
of the frontier condition: if `S ∩ closure(T) ≠ ∅` then `S ⊆ closure(T)`, and if
`S ⊆ closure(T)` with `S ≠ T` then `dim S < dim T`. The first is a containment and the second the
dimension drop for distinct incident pieces (Łojasiewicz, §1). The ambient boundary of a
lower-dimensional closed set is not asserted to have smaller dimension.
*Needs:* §1.0; Tau Ceti `TauCeti.IsSemianalytic`, `LocallyFinite.isSemianalytic_iUnion`.

**Checks.**
- For the closed segment `A = [0, 1] × {0} ⊂ ℝ²`, `dim A = 1`, `closure(A) ∖ A = ∅`, and the ambient
  boundary of `A` is `A` itself, of dimension `1`. A frontier statement written with the ambient
  boundary in place of `closure(A) ∖ A` would claim `dim A < dim A`.
- For `A = {(1, 0)} ⊂ ℝ²` and `x = 0`, `dim_x A = −∞`, since `A` misses the disc of radius `1/2`.
  Without the requirement of §1.0 that `x` lie in the closure of every piece, the partition of the
  disc of radius `2` into `{(1, 0)}` and its complement would be admissible for
  `f = (u − 1)² + v²` and would give `dim_x A = 0`: the local dimension would depend on the size of
  the neighbourhood.
- For the Whitney umbrella `W = {x² = z y²} ⊂ ℝ³`, points of `W` off the `z`-axis `S` have `y ≠ 0`
  and `z = x²/y² ≥ 0`, so `W ∖ S` is the graph of `x²/y²` over `{y ≠ 0}` and has the two components
  `T± = W ∩ {±y > 0}`. Since `(√z · y, y, z) → (0, 0, z)` as `y → 0⁺`, `closure(T₊) ∩ S` is the
  half-axis `z ≥ 0`. Then `S ∩ closure(T₊) ≠ ∅` but `S ⊄ closure(T₊)`: the partition `{S, T₊, T₋}`
  into connected analytic submanifolds fails the frontier condition, and a normal decomposition
  splits the axis at the origin.

### 1.1 Analytic-algebraic germs and locally semialgebraic sets (R1.1)

Nash germs, the local graph criterion and locally semialgebraic sets are those of Convention 4,
with their supplier contracts. This section owns the Nash comparisons for the analytic inverse
and implicit function theorems, the Nash refinement of §§1.0–1.0a, the Nashness of the
Weierstrass coefficients that refinement uses, and Nash maps on semialgebraic analytic
submanifolds (Łojasiewicz, §1.VI, p. 454).

**Nash inverse and implicit functions.** Prove that if a map `g : ℝⁿ → ℝⁿ` has Nash coordinates at
`x` and invertible derivative there, the analytic local inverse of `AnalyticAt.exists_openPartialHomeomorph`
has Nash coordinates at `g(x)`, and that the analytic implicit function of a Nash map
(`ImplicitFunctionData.analyticAt_implicitFunction`) has Nash coordinates. Route: the graph of the
inverse is the transposed graph, semialgebraic on an open semialgebraic neighbourhood by the map
form of the graph criterion (`TauCeti.forall_isNashAt_apply_iff_exists_isSemialgebraicOn`), and an
analytic function with semialgebraic graph near a point is a Nash germ there
(`TauCeti.IsSemialgebraicOn.isNashAt`).
*Needs:* Tau Ceti `TauCeti.IsNashAt`, `TauCeti.forall_isNashAt_apply_iff_exists_isSemialgebraicOn`,
`TauCeti.IsSemialgebraicOn.isNashAt`, `AnalyticAt.exists_openPartialHomeomorph`,
`ImplicitFunctionData.analyticAt_implicitFunction`, `TauCeti.HasSemialgebraicProjections`.

**Nash Weierstrass coefficients.** Let `f` be a Nash germ at a real point. Prove the algebraic
realification lemma: if `w` is the local holomorphic extension of `f` and `w̄` its conjugate, they
satisfy the original and the conjugate polynomial relations, and elimination by resultants makes
`(w + w̄)/2` and `(w − w̄)/(2i)` algebraic over the real polynomial ring; a nonzero real or
imaginary coefficient part gives a nonzero real relation for each real-valued component, so on a
smaller conjugation-invariant semialgebraic tube the real and imaginary parts of the extension
are Nash in the real coordinates, by the graph criterion. Containment in the common zero set of
the real and imaginary parts of a polynomial is not the graph criterion. Then isolate the finite
root cluster of the Weierstrass polynomial, express the coefficients of the factor by elementary
symmetric functions of the cluster counted with multiplicity, describe each root multiplicity by
the vanishing of the preceding derivatives and the nonvanishing of the next (finitely many
conditions, bounded by the Weierstrass degree), and use real and imaginary polynomial coordinates
and Tarski–Seidenberg for the graph. Prove that the root cluster and the coefficients are unique on
a smaller neighbourhood and that conjugation makes them real. Hence the coefficients of the real
Weierstrass factor of a Nash germ are Nash germs.
*Needs:* the inverse and implicit functions above; Tau Ceti `AnalyticAt.exists_complexification`,
`TauCeti.IsNashAt.fderiv_apply`, `TauCeti.isNashAt_iff_exists_isSemialgebraicOn`,
`TauCeti.HasSemialgebraicProjections`; ComplexKahlerGeometry K3 (§3.2).

**The Nash normal decomposition.** Prove §1.0 in the Nash category: for finitely many Nash germs
at `x`, the neighbourhood `V` can be taken open and semialgebraic and the pieces semialgebraic
analytic submanifolds, the root and graph maps are Nash, closures and frontiers of pieces are
semialgebraic, and the dimension and frontier conditions of §1.0a hold. The dimension of §1.0a of
a nonempty semialgebraic `k`-dimensional piece equals its semialgebraic dimension
`TauCeti.semialgebraicDim`, the dimension of AffineMorseLefschetz §5.1: both are `k`, the second by
`TauCeti.semialgebraicDim_eq_finrank_of_chartedSpace` (a nonempty subset of `ℝⁿ` that is a
topological manifold modelled on `ℝᵏ` has semialgebraic dimension `k`). Prove only the assembly:
the charts on `ℝᵏ` that the analytic submanifold structure gives the piece.
*Needs:* §§1.0–1.0a, the Nash Weierstrass coefficients; Tau Ceti `TauCeti.semialgebraicDim`,
`TauCeti.semialgebraicDim_eq_finrank_of_chartedSpace`,
`TauCeti.semialgebraicAt_iff_exists_isNashBooleanCombination`,
`TauCeti.IsSemialgebraic.semialgebraicDim_closure`.

**Nash maps on semialgebraic analytic submanifolds.** On a semialgebraic analytic submanifold of
`ℝⁿ`, define a Nash map to `ℝᵐ` as a map analytic on it (`TauCeti.AnalyticOnSubmanifold`) whose
graph over it is semialgebraic. Prove that restriction to a semialgebraic relatively open subset,
products, composition, and transport through the Nash inverse and implicit function theorems
above preserve Nash maps.
*Needs:* the paragraphs above; Tau Ceti `TauCeti.AnalyticOnSubmanifold`,
`TauCeti.IsSemialgebraicOn`, `TauCeti.HasSemialgebraicProjections`.

**Checks.**
- For the Nash germ `f(x) = √(1 + x)` at `0`, write its extension `w = √(1 + z)`, `z = x + iy`, as
  `a + ib`: then `a² − b² = 1 + x` and `2ab = y`, so `a` satisfies `4a⁴ − 4(1 + x)a² − y² = 0`, a
  nonzero real relation; at `y = 0` it factors as `4a²(a² − 1 − x)`, recovering `f`. The real part
  of the extension is Nash in `(x, y)` on a tube where `1 + x > 0`.
- The analytic function `exp` on `ℝ` is not a Nash germ at `0`: a relation `P(x, eˣ) = 0` near `0`
  holds on all of `ℝ` by analytic continuation, and a root `t` of `P(x, t)` with leading
  coefficient `a_d(x) ≠ 0` satisfies `|t| ≤ 1 + max_i |a_i(x)/a_d(x)|`, which grows at most
  polynomially in `x` for large `x`, while `eˣ` does not. So the Nash refinement is a genuine
  restriction on the pieces of §1.0, not a relabelling.

### Examples

- For `f = y² − x³` near the origin of `ℝ²` (the cusp), a normal decomposition has the origin, the
  two open branches `y = ±x^(3/2)`, `x > 0`, and the two open regions `y² > x³` and `y² < x³`; the
  branches are graphs of Nash functions of `x` on `x > 0`, so this is also a Nash normal
  decomposition.
- The union of the closed unit disc and the segment `[1, 2] × {0}` in `ℝ²` has dimension `2`, and
  its points of local dimension `1` are those of `(1, 2] × {0}`.

### Dependencies

§§1.0–1.0a: Tau Ceti semianalytic sets, convergent complexification, delineations and the analytic
implicit root theorem; ComplexKahlerGeometry K3 (§3.2); RealAlgebraicGeometry Layers 1, 2 and 4.
§1.1 adds Tau Ceti's Nash germs, graph criterion, locally semialgebraic sets, Tarski–Seidenberg and
semialgebraic dimension, and the analytic inverse and implicit function theorems.

## Layer 2: Łojasiewicz's theorem in affine space and the semialgebraic theorems (R2)

Theorem 1 (§2.0h) is Łojasiewicz's triangulation theorem in affine space, proved by induction on
the dimension `n`; dimensions `0` and `1` are handled directly, and §§2.0–2.0g are the steps of
the induction, in the order their *Needs:* lines force; with §2.0h they treat Łojasiewicz's
Lemmas 1–15 (§2) and the five steps of his §4, step V (the triangulation, printed p. 473) in
§2.0h. In these
sections `ℝⁿ = M × ℝ` with base `M = ℝ^(n−1)`, carrying its Euclidean norm, and vertical
coordinate `t`; `π : M × ℝ → M` is the projection. A set `Γ ⊆ M × ℝ` is *topographic* when it is
the graph of an analytic function on an analytic submanifold of `M`. A set `Z ⊆ M × ℝ` has
*property (P)* when `π` restricted to `Z` is an open map: the projection of every relatively open
subset of `Z` is open in `M`. §2.1 proves the bounded semialgebraic theorem, and §§2.1a–2.1b the
multiprojective theorem; they use from §§2.0–2.0h only the affine-coordinate statements, the
band maps and the subdivision theorem named there.

### 2.0 Normal boxes

Call a *normal box* at `c ∈ ℝⁿ` an open coordinate box `Q` around `c`, in some affine coordinates,
together with a finite partition of `Q` into connected analytic submanifolds `Γ^k_κ`, `0 ≤ k ≤ n`,
such that each `Γ^k_κ` is a connected component of the locus `V^k` where the successive real
distinguished (Weierstrass) polynomials `H^(n−1)_n, …, H^k_(k+1)` in the last `n − k` coordinates
vanish and the next one, `H^(k−1)_k` in the coordinate `x_k`, does not, with `H^(−1)_0 = 1`;
`Γ^k_κ` has dimension `k`; the pieces with `k = n` are open; a piece with `k < n` is
the graph of an analytic map over an open subset of the first `k` coordinates; and the frontier of
each piece in `Q` is a union of pieces of lower dimension (Łojasiewicz, §1.II, pp. 451–452). Prove,
using §§1.0–1.0a, that near every point, after an affine change of coordinates and shrinking, there
is a normal box compatible with any given finite family of analytic functions and semianalytic sets
(each piece inside or outside each set, each function of constant sign on each piece), and that it
can be chosen inside any prescribed neighbourhood (Łojasiewicz, §1.III.1 and §1.III.3,
pp. 452–453). Prove the *prescribed-zero-set* form: given a line `L` through the centre, a
hyperplane transverse to it, finitely many analytic `f_j` and an analytic `F` with
`f_j = 0 ⇒ F = 0` near the centre and `F` not identically zero along `L` near the centre, there is a
normal box adapted to the `f_j`, with `L` as last axis and the hyperplane as the coordinate
hyperplane, whose union of pieces of dimension `< n` is exactly `{F = 0}` near the centre
(Łojasiewicz, §1.III.2, pp. 452–453). Prove that the coordinate projection onto the first `m`
coordinates sends the normal data of a box to normal data of the projected box and preserves the
dimension label of every piece of dimension at most `m` (Łojasiewicz, §1.II, p. 452, the projection
statement). Route: Weierstrass preparation and division and the successive discriminant systems,
retaining the prescribed line and hyperplane. These normal-root, graph and projection statements
go beyond §1.0 and are targets here.
*Needs:* §§1.0–1.0a; ComplexKahlerGeometry K3 (§3.2, Weierstrass preparation and division); Tau
Ceti `AnalyticAt.exists_openPartialHomeomorph`, `AnalyticAt.exists_complexification`.

- *Affine coordinates.* An affine change of coordinates of `ℝⁿ` is polynomial and analytic with
  polynomial and analytic inverse. It preserves semianalytic sets (`Equiv.isSemianalytic_image_iff`),
  semialgebraic sets and graphs, analytic submanifolds and analytic isomorphisms between them
  (`TauCeti.IsAnalyticSubmanifold.image_of_leftInvOn`), and partially semialgebraic sets under
  affine changes of the base (`TauCeti.IsPartiallySemialgebraic.preimage_prodMap`) and of the
  fibre (a polynomial composed with an affine map is a polynomial). Hence properties (A) and
  (A⁻¹), and every statement of this layer about a finite-dimensional real affine space, do not
  depend on the affine coordinates.

### 2.0a Nonsingular directions (Lemmas 1–4)

For an analytic `f` on an open `G ⊆ ℝⁿ`, a direction `[v]` (a point of the projective space of
directions of `ℝⁿ`) is *singular* for `f` at `u ∈ G` when `ξ ↦ f(u + ξv)` vanishes identically near
`ξ = 0`, and singular for `f` when it is singular at some point of `G`. For a family of analytic
functions, a direction is nonsingular when it is nonsingular for each member.

Lemma 1 is the meagreness of the image of an everywhere rank-deficient analytic map between
second-countable analytic manifolds, `ContMDiff.isMeagre_range_of_finrank_mfderiv_lt`, and Lemma 2
the Lefschetz–Whitehead rank estimate, `HasFDerivAt.finrank_range_lt_of_infinite` (Łojasiewicz,
§2, Lemmas 1–2). Lemma 2 is stated there for `h` with values in an `(m − 1)`-dimensional
submanifold `S` with `u ∉ T_u S`; that form follows, because the range of the derivative of `h`
lies in the tangent space of `S`.

Prove Lemma 3 (Łojasiewicz, §2, Lemma 3): if `f` is analytic on a connected open `G ⊆ ℝⁿ` and not
identically zero, the singular directions of `f` form a meagre subset of the space of directions.
Represent a direction by a unit vector and consider the incidence set of pairs `(u, v)` for which
`f(u + ξv)` vanishes as a germ in `ξ`. Its equations are all the directional derivatives
`∂^m_ξ f(u + ξv)|_(ξ=0) = 0`, `m ≥ 0`, including `f(u) = 0` for `m = 0`. Prove that this countable
family is determined, locally, by finitely many of its members on a common complex neighbourhood:
complexify the single function `f` (`AnalyticOnNhd.exists_complexification`), so that all its
directional-derivative equations extend holomorphically on that neighbourhood, with analytic
charts for the directions; use Noetherianity of holomorphic germs (ComplexKahlerGeometry K3,
§3.4) to select finitely many equations at a point; take a small representative of their finitely
many analytic components, and use the holomorphic identity theorem on their dense connected
regular loci to make every remaining equation vanish on those components. This gives a uniform
neighbourhood for the common zero *set*, beyond the stabilization of germs. Own this
common-neighbourhood reduction and the component and identity adapters here, then apply the
normal boxes of §2.0 and Lemmas 1–2 to the incidence set. No simultaneous complexification of an
arbitrary countable family of unrelated analytic functions is assumed.
*Needs:* §2.0; Tau Ceti `AnalyticOnNhd.exists_complexification`,
`ContMDiff.isMeagre_range_of_finrank_mfderiv_lt`, `HasFDerivAt.finrank_range_lt_of_infinite`;
ComplexKahlerGeometry K3 (§3.4, Noetherian germs and analytic components).

Prove Lemma 4 (Łojasiewicz, §2, Lemma 4): for a countable family of analytic functions, each not
identically zero on its connected open domain (for instance the local defining functions of a
locally finite family of semianalytic sets, on a countable cover), the union of their
singular-direction sets is meagre, so the directions nonsingular for all of them form a dense
residual set, by the Baire category theorem in the space of directions. The same argument handles
the countable cover by normal boxes used in §2.0e.
*Needs:* Lemma 3; Mathlib's Baire category theorem.

**Checks.**
- For `f(x, y) = y` on `ℝ²`, `f(u + ξv) = u₂ + ξv₂` vanishes identically exactly when `u₂ = 0` and
  `v₂ = 0`, so the only singular direction is the horizontal one, a single point of the space of
  directions.
- For `f(x, y) = exp(y)`, every directional derivative of positive order along the horizontal
  direction vanishes identically, but `f` never vanishes, so no direction is singular. An incidence
  set built from the derivatives of positive order alone, omitting `f(u) = 0`, would contain every
  pair `(u, horizontal)`.

### 2.0b Partially semialgebraic sets, topographic graphs and property (P) (Lemmas 5–7)

Prove Lemma 5 (Łojasiewicz, §2, Lemma 5): a bounded semianalytic subset of `M × ℝ` whose vertical
direction is nonsingular for its local defining functions is partially semialgebraic with respect
to `t` (Convention 6). Route: the local Weierstrass polynomial description in the vertical
variable, patched over a locally finite cover of the base. For this projection convention the
closure rules of Łojasiewicz's §1.V are finite Boolean operations
(`TauCeti.isSetAlgebra_setOf_isPartiallySemialgebraic`), locally finite unions, those whose
projections to the base are locally finite (`LocallyFinite.isPartiallySemialgebraic_iUnion`), and
projection along fibre coordinates (`TauCeti.IsPartiallySemialgebraic.image_prodMap_comp_inl`) and
onto the base (`TauCeti.IsPartiallySemialgebraic.isSemianalytic_image_fst`), where one
semialgebraic formula with the analytic coefficients substituted serves a whole neighbourhood of
each base point and no global semialgebraic graph is asserted. Prove the remaining rule: the
connected components of a partially semialgebraic set are partially semialgebraic, through the
normal decomposition of §1.0.
*Needs:* §§1.0, 2.0a; Tau Ceti `TauCeti.IsPartiallySemialgebraic`,
`TauCeti.isSetAlgebra_setOf_isPartiallySemialgebraic`, `LocallyFinite.isPartiallySemialgebraic_iUnion`,
`TauCeti.IsPartiallySemialgebraic.image_prodMap_comp_inl`,
`TauCeti.IsPartiallySemialgebraic.isSemianalytic_image_fst`; ComplexKahlerGeometry K3 (§3.2).

Lemma 6 (Łojasiewicz, §2, Lemma 6) is used in the following form: an analytic submanifold of
`ℝ^(n−1) × ℝ` whose points satisfy `|t − t′| ≤ A |u − u′|` is topographic, the graph of an `A`-Lipschitz analytic
function on its projection (`TauCeti.IsAnalyticSubmanifold.exists_topographic`), and the shear
`(u, t) ↦ (u + tz, t)` (`TauCeti.horizontalShear`) keeps it so with constant `A/(1 − A|z|)` when
`A|z| < 1` (`TauCeti.dist_le_mul_dist_tail_of_mem_image_horizontalShear`,
`TauCeti.IsAnalyticSubmanifold.image_horizontalShear`), from
`|Δu + zΔt| ≥ (1 − A|z|)|Δu|`. There the base carries the sup norm of `Fin (n − 1) → ℝ` and the
height is the first coordinate; constants measured with the Euclidean norm of §2.0d convert by
`‖u‖_∞ ≤ ‖u‖₂ ≤ √(n − 1) ‖u‖_∞`.

Prove Lemma 7 (Łojasiewicz, §2, Lemma 7): if `f` is analytic at `(c, 0) ∈ M × ℝ` with `f(c, ·)` not
identically zero, there is `g` analytic at `(c, 0)` with `g(c, ·)` not identically zero such that
`{fg = 0}` has property (P) near `(c, 0)`. Prove also that a topographic submanifold of dimension
`n − 1 = dim M` has property (P): its projection is an analytic submanifold of full dimension, hence
open, and `π` is a homeomorphism from it onto that projection. Route for the first claim: induction
on `dim(M × ℝ)`, with a distinguished Weierstrass polynomial for `f`, its discriminant, a line
nonsingular for the discriminant (§2.0a), the roots of a second Weierstrass polynomial and the
product construction; the case of Weierstrass degree zero is handled separately.
*Needs:* §§2.0–2.0a; ComplexKahlerGeometry K3 (§3.2); Tau Ceti
`TauCeti.IsAnalyticSubmanifold.exists_topographic`.

**Checks.**
- The set `{(u, t) ∈ ℝ × ℝ : sin t = 0}` is semianalytic, its vertical direction is nonsingular
  (`sin(t + ξ)` is not identically zero in `ξ`), and its fibres are the infinite discrete set `πℤ`,
  whereas a fibre of a partially semialgebraic set over a neighbourhood is described by finitely
  many polynomials in `t`, hence is a finite union of points and intervals. So it is not partially
  semialgebraic, and Lemma 5 needs boundedness.
- For `f = t² − u` at `(0, 0)`, the projection of `{f = 0}` is `[0, ∞)`, not open, so `{f = 0}`
  lacks property (P); with `g = t² + u`, which has `g(0, ·) = t²`, the set `{fg = 0}` is the union of
  `u = t²` and `u = −t²`, and the projections of its relatively open subsets are open intervals.

### 2.0c Adapted decompositions (Lemmas 8–9)

Prove Lemma 8 (Łojasiewicz, §2, Lemma 8): given a point, a finite semianalytic family and a
vertical line through the point nonsingular for its defining functions (§2.0a), there is a normal
box at the point compatible with the family whose union of pieces of dimension `< n` is a
prescribed zero set `{fg = 0}` with property (P). In affine coordinates make the line the last axis
and the transverse slice the coordinate hyperplane; apply Lemma 7 to the product `f` of the
defining functions to obtain `g`, and the prescribed-zero-set normal box of §2.0 with `F = fg`. An
arbitrary Weierstrass zero set is not claimed to have open projection.

Prove Lemma 9 (Łojasiewicz, §2, Lemma 9): the pieces of such an adapted box are partially
semialgebraic, every piece of dimension `< n` is topographic, and projection onto the base gives a
normal decomposition with the same dimension labels `k < n`. Property (P) comes from the choice of
`g` in Lemma 8 and the prescribed-zero-set realization; the frontier and graph descriptions of §2.0
supply the remaining normal data. These normal-system and projection facts are not proved in the
article and are targets here.
*Needs:* §§2.0–2.0b.

### 2.0d Straightening graph families (Lemma 10)

Prove Lemma 10 (Łojasiewicz, §2, Lemma 10). Let `c ∈ M`, and let `φ_ν`, `ν = ±1, ±2, …`, be analytic
functions on neighbourhoods of `c` whose graphs form a locally finite family, with `φ_ν(c)`
strictly increasing in `ν` and tending to `±∞` as `ν → ±∞`; let `G ⊆ M × ℝ` be an open set
containing `{c} × ℝ`. After restricting each `φ_ν` to a connected neighbourhood of `c`, with graph
`φ_ν*`, there is an analytic isomorphism `g : M × ℝ → M × ℝ` such that the sets `ψ_ν = g(φ_ν*)`
satisfy:

1. `g((M × ℝ) ∖ G) ⊆ M × (−1, 1)`;
2. the `ψ_ν` are bounded, pairwise disjoint, semianalytic and topographic;
3. every bounded subset of `M` lies in `⋂_(|ν| ≥ N) Ω_ν` for some `N`, where `Ω_ν = π(ψ_ν)`;
4. the functions with graphs `ψ_ν` tend to `±∞` as `ν → ±∞`, uniformly on bounded subsets of `M`;
5. these functions satisfy one Lipschitz bound independent of `ν`;
6. `closure(ψ_ν) ⊆ g(graph φ_ν)` and `g(graph φ_ν) ∖ ψ_ν ⊆ M × (−1, 1)`; hence `ψ_ν ∩ {|t| ≥ 1}` is
   closed.

Route. Choose disjoint compact height intervals `Δ_ν` and radii `a_ν`,
and a positive function `γ`, constant on each `Δ_ν` and on each complementary interval, with
`γ < a_ν` on `Δ_ν` and the tube `{(u, t) : |u − c| ≤ γ(t)}` inside `G` minus the discarded portions
of the graphs. Take `h` positive and analytic with `h(t) > γ(t)⁻¹ √(t² − 1)` for `|t| ≥ 1`,
`h > 2k_ν` and `|h′| < a_ν⁻¹` on `Δ_ν`, where `k_ν` is a Lipschitz bound for `φ_ν*` on its
radius-`a_ν` domain (`TauCeti.exists_analyticOnNhd_sqrt_sq_sub_one_lt_mul`, built on the analytic
`C¹` approximation `ContDiff.exists_analyticOnNhd_abs_sub_lt`; only orders `0` and `1` are
approximated, with pointwise tolerances preserving the strict inequalities). Let `β` be the inverse
of `t ↦ (eᵗ − e⁻ᵗ)/(e − e⁻¹)` (`TauCeti.normalizedArsinh`: increasing, analytic, `β(±1) = ±1`,
`|β′(t)| ≤ min(2, 1/|t|)`), and put `g = g₂ ∘ g₁` with `g₁(u, t) = (h(t)u, t)` (`TauCeti.baseScaling`)
and `g₂(u, t) = (u, β(t/√(1 + |u|²)))` (`TauCeti.heightCompression`), both analytic isomorphisms
(`TauCeti.analyticAt_baseScaling`, `TauCeti.analyticAt_heightCompression` and their inverse forms),
in coordinates centred at `c`. Condition 1 follows from
`TauCeti.mapsTo_heightCompression_comp_baseScaling`, condition 5 with bound `3` from
`TauCeti.dist_snd_le_three_mul_dist_fst_of_mem_image_heightCompression_comp_baseScaling`, and
condition 3 from the fact that `Ω_ν` contains the ball of radius `½ √(b_ν² − 1)`, `b_ν = inf{|t| :
t ∈ Δ_ν}` (`TauCeti.closedBall_subset_fst_image_baseScaling_image_graphOn`). Prove conditions 2,
4 and 6 and assemble the six conditions. This lemma uses no manifold-level approximation theorem
and nothing from Layers 3–4.
*Needs:* §2.0b (topographic graphs); Tau Ceti `TauCeti.normalizedArsinh`,
`TauCeti.abs_mul_deriv_normalizedArsinh_le_one`, `TauCeti.deriv_normalizedArsinh_le_two`,
`TauCeti.baseScaling`, `TauCeti.heightCompression`, `TauCeti.exists_analyticOnNhd_sqrt_sq_sub_one_lt_mul`,
`ContDiff.exists_analyticOnNhd_abs_sub_lt`, `TauCeti.mapsTo_heightCompression_comp_baseScaling`,
`TauCeti.dist_snd_le_three_mul_dist_fst_of_mem_image_heightCompression_comp_baseScaling`,
`TauCeti.closedBall_subset_fst_image_baseScaling_image_graphOn`.

The band calculus of Łojasiewicz's Lemmas 11–14 is used below in the following form. For endpoint
functions `φ < φ′` on `E` whose graph closures are bounded single-valued functions on `closure(E)`,
the closure of the open band is the closed band between the extended endpoints (Lemma 11,
`TauCeti.closure_regionBetween_of_closure_graphOn_eq`). Over a base map `g` and endpoints `ψ, ψ′`,
the interpolation `TauCeti.regionBetweenMap` sends `(u, t)` to
`(g(u), ψ(g(u)) + (t − φ(u))(ψ′(g(u)) − ψ(g(u)))/(φ′(u) − φ(u)))` when `φ(u) < φ′(u)`, and to
`(g(u), ψ(g(u)))` on a collapsed fibre. It restricts to the graph maps of the endpoints and depends
only on the data over the points where it is evaluated (Lemma 12,
`TauCeti.image_regionBetweenMap_graphOn_lower`, `TauCeti.image_regionBetweenMap_graphOn_upper`,
`TauCeti.eqOn_regionBetweenMap`); for analytic data with strict source and target inequalities it
is an analytic isomorphism of the open bands (Lemma 13, `OpenPartialHomeomorph.regionBetween`,
`OpenPartialHomeomorph.analyticOnNhd_regionBetween`, `OpenPartialHomeomorph.analyticOnNhd_regionBetween_symm`);
under the collapsed-endpoint condition `φ(u) = φ′(u) ⇒ ψ(g(u)) = ψ′(g(u))` and continuous data it is
continuous on the closed band, and it has property (A⁻¹) when `g` has (A⁻¹), the source endpoints
have partially semialgebraic graphs and the target endpoints semialgebraic graphs (Lemma 14,
`TauCeti.continuousOn_regionBetweenMap`, `TauCeti.isPartiallySemialgebraic_graphOn_regionBetweenMap`).

**Checks.**
- Take `n = 2`, `c = 0`, `γ ≡ 1` and `G = {|u| < 2}`, which contains the tube `{|u| ≤ 1}`; the point
  `(u, t) = (2, 3)` lies outside `G`. With `h(t) = 2 + t²`, which satisfies `h(t) > √(t² − 1)`,
  `g₁(2, 3) = (22, 3)` and `3/√(1 + 22²) = 3/√485 < 1`, so `g` sends the point into the strip
  `|t| < 1`, as condition 1 asks. With `h ≡ 1`, which violates `h(3) > √8`, the height becomes
  `β(3/√5)` with `3/√5 > 1`, outside the strip: condition 1 needs the growth of `h`.

### 2.0e The topographic family (§4, step I)

Prove the global topographic-family construction (Łojasiewicz, §4, step I) for a locally finite
family `(B_ν)` of semianalytic subsets of `ℝⁿ`, from Lemmas 4–10. First use a common nonsingular
direction (Lemma 4) to make the vertical direction transverse for the whole family. Use countably
many adapted normal boxes (§2.0c) and their projected decompositions, and choose a base point
outside the countable union of the nowhere-dense lower-dimensional projected strata, by the Baire
category theorem; projection does not preserve local finiteness. Select a two-sided sequence of
graph levels through this point and disjoint strips between consecutive levels. Lemma 10, followed
by a shear `(u, t) ↦ (u + tz, t)` with `|z|` below the reciprocal of the Lipschitz bound and `z`
chosen in the dense set of nonsingular directions, produces the locally finite family of upper and
lower graphs outside `|t| < 1`; apply Lemma 5 after the shear to make these graphs partially
semialgebraic, and derive the uniform Lipschitz bounds through the two coordinate changes (first at
most `1`, then at most `3`) so that Lemma 6 applies. Inside the strip, cover each compact vertical
segment by finitely many adapted normal boxes and place truncated cones with locally finite bases.
Keep each lower-dimensional normal piece clipped to each truncated cone as an individual member of
the family, together with the cone sides and the two boundary planes; these individual members
carry the partially semialgebraic and topographic conditions and the compatibility with each
`B_ν`. For property (P), group the pieces only as an auxiliary union: for the adapted box indexed
by `(ν, σ)` put `C_νσ = ⋃_(k < n, κ) Γ^k_κ(ν, σ)`, which has (P) by the lower-dimensional-union clause
of Lemma 8, no individual piece being assumed to have (P). For each truncated cone `O` in that box,
`C_νσ ∩ O` is open in `C_νσ`, so the restricted projection has (P), and it is exactly the union of
the clipped pieces in that cone; with the (P) of the cone sides and boundary planes, proved from
their explicit construction, the union of all members has (P), since the projection of a relatively
open subset of the union is the union of the open projections of its parts. Prove closedness of
the union separately: within each closed cone region the grouped normal set is relatively closed,
a limit point leaving the open cone lies on its cone side or on a boundary plane, and local
finiteness gives closedness of the total union; property (P) alone does not imply closedness.
Prove that every connected set compatible with the individual members is compatible with each
`B_ν`, separately outside and inside the strip.

Record the six properties used later: (i) the members are partially semialgebraic topographic
sets whose intersections with `B × ℝ` are bounded for every bounded `B ⊆ M`, the two boundary
planes included; (ii) the family is locally finite; (iii) the tails `Γ ∩ {|t| ≥ 2}` of its
members `Γ` are compact and pairwise disjoint, and empty for members of dimension below `n − 1`
(Łojasiewicz, §4, step I, (3), p. 465, prints `dim Γ < n`, but every member is topographic, of
dimension at most `n − 1`);
(iv) its union is closed and has property (P); (v) over every base point the union meets both the
positive and the negative vertical rays in unbounded sets; (vi) compatibility passes from the
members to each `B_ν`.
*Needs:* §§2.0–2.0d.

### 2.0f The prismatic decomposition (§4, steps II–III)

Form the clipped projected family `π(Γ ∩ Γ′ ∩ (M × (−2, 2)))` over all pairs of members `Γ, Γ′` of the
topographic family, diagonal pairs included (Łojasiewicz, §4, steps II–III). Prove it semianalytic
by the projection rule of §2.0b. Near a compact base neighbourhood the relevant pieces meet its
compact product with `[−2, 2]`, so local finiteness of the family leaves finitely many relevant
pairs (`LocallyFinite.image_fst_of_subset`); this proves local finiteness of the clipped family,
not of the raw projections. Apply Theorem 1 in dimension `n − 1` to it. For distinct `Γ, Γ′`, or for
a lower-dimensional `Γ`, the tail properties place `Γ ∩ Γ′` inside the strip, which gives
compatibility with the whole intersection. For a diagonal pair with `Γ` a graph over an open subset
of `M`, the complement of its clipped projection splits into `M ∖ πΓ` and
`{u ∈ πΓ : |Γ(u)| ≥ 2}`; prove both closed, the first because the graph domain is open and the
second because the high portion of the graph is closed and bounded, so compact, with compact
projection. They are disjoint, so a connected open base simplex compatible with the clipped
projection lies in `πΓ` or outside it; the unbounded complement of the domain is not required to be
compact. Thus the base triangulation is compatible with every projected pair.

Subdivide it barycentrically, so that each new open simplex lies in a single open simplex of the
base triangulation and has that simplex's barycentre as a vertex (the distinguished vertex). Pull
the topographic family back over these simplices to obtain the prismatic pieces. Prove that they
are disjoint and locally finite, cover every vertical direction, have continuous closure graphs and
restrict to pieces over every face; the distinguished vertex gives strict order between disjoint
graph sections. Call two sections consecutive when no section lies strictly between them, and prove
that their restrictions to a face are equal or consecutive. Fill each gap with the open band
between consecutive sections. The graph pieces and the open bands form a locally finite disjoint
cover; over each connected base simplex the consecutive bands are open and closed in the
complement of the sections, so they cover the whole fibre. Lemma 11 gives the closure of each band,
and with the face and order results every closure is a union of pieces.
*Needs:* §2.0e; Theorem 1 in dimension `n − 1` (§2.0h, induction hypothesis); Tau Ceti
`LocallyFinite.image_fst_of_subset`, `TauCeti.closure_regionBetween_of_closure_graphOn_eq`.

### 2.0g The transfer map (§4, step IV)

Let `f = l ∘ g` be the analytic change of coordinates of step I (the map of Lemma 10 followed by the
shear `l`), and consider the transformed family `f(B_ν)` (Łojasiewicz, §4, step IV). Fix the
rectilinear cells first. For a graph `γ` over a base simplex `β`, let `ρ = τ_b⁻¹(β)`, where `τ_b` is
the homeomorphism of the base triangulation of §2.0f. At each vertex `v` of `closure(ρ)`, take the
height of the continuous closure graph of `γ` at `τ_b(v)`, where `v` is the barycentre of its
controlling projected simplex, and let `σ(γ)` be the graph over `ρ` of the affine interpolant of
these heights; the heights are prescribed, not chosen. Keep Łojasiewicz's notation
`s(β) = {τ_b(v) : v a vertex of closure(τ_b⁻¹ β)}` for that finite set. Prove his conditions
IV(1)–(4): `σ(γ)` projects onto `ρ`, the interpolants are strictly ordered on the open simplex,
the endpoint bounds hold, and compatibility and inclusion hold on the faces of the closure; the
distinguished vertex gives strict order even where endpoint values coincide on a face. Take the
rectilinear affine bands between consecutive interpolants, and the band maps over
`g_β = τ_b⁻¹|β` with these endpoint data. Verify the collapsed-endpoint condition on each closed
band, and use Lemmas 12–14 to prove that the graph and band maps agree on all face restrictions,
are continuous on closures and are analytic isomorphisms on each open graph or band. Define the
global map as the union of these locally finite cell maps; the closure compatibility makes it a
homeomorphism, not merely a bijection. Prove property (A⁻¹) for it by Lemma 14, the locally finite
union rule and the projection rule of §2.0b, and take the inverse to obtain property (A) for the
map `τ*` triangulating the transformed family; the final map is `τ = f⁻¹ ∘ τ*`. Prove that the
analytic isomorphism `f⁻¹` preserves the open-simplex analyticity and the compatibility with the
original `B_ν`, and that it preserves property (A): graphs of analytic isomorphisms are locally
polynomial in the affine source coordinate, and postcomposition substitutes `y = f(z)` in the
analytic coefficient functions of the target variable, leaving the polynomial dependence on the
source coordinate unchanged. General closure of property (A) under composition, where a quantified
intermediate variable would enter the analytic coefficients, is not assumed.
*Needs:* §2.0f; Tau Ceti `TauCeti.regionBetweenMap`, `TauCeti.image_regionBetweenMap_graphOn_lower`,
`TauCeti.image_regionBetweenMap_graphOn_upper`, `TauCeti.eqOn_regionBetweenMap`,
`TauCeti.continuousOn_regionBetweenMap`, `OpenPartialHomeomorph.regionBetween`,
`OpenPartialHomeomorph.analyticOnNhd_regionBetween`,
`OpenPartialHomeomorph.analyticOnNhd_regionBetween_symm`,
`TauCeti.isPartiallySemialgebraic_graphOn_regionBetweenMap`,
`TauCeti.IsPartiallySemialgebraic.image_prodMap_comp_inl`, `LocallyFinite.isPartiallySemialgebraic_iUnion`.

### 2.0h Rectilinear cells and Theorem 1 (Lemma 15)

Prove Lemma 15 (Łojasiewicz, §2, Lemma 15) for the rectilinear affine cells of §2.0g: a cell is
the graph of an affine function over a closed simplex, an affine simplex
(`AffineMap.graphOn_convexHull`), or a closed band `{(u, t) : u ∈ closure β, a(u) ≤ t ≤ b(u)}`
between ordered affine functions `a ≤ b`, the convex hull of the lower and upper endpoint vertices
(`TauCeti.closedRegionBetween_convexHull`), a convex polytope whose intrinsic interior is the open
band over the open simplex where `a < b` somewhere (`TauCeti.intrinsicInterior_closedRegionBetween`);
a face on which the width vanishes is an ordinary lower-dimensional face. These statements concern
the rectilinear cells; their images under `τ` need not be convex. Prove that every face of a cell
is a finite union of lower-dimensional cells of the family, using the order and equality
compatibility of §2.0f, and verify the hypotheses of the relative subdivision theorem
`Geometry.SimplicialComplex.exists_subdivision_extending`: it gives a simplicial complex
triangulating each cell by finitely many simplices, retaining chosen boundary triangulations, with
common faces and coverage, and the local finiteness of the cell family makes the complex locally
finite. Its support is all of `ℝⁿ`. Composing the affine simplex charts with `τ` gives compatibility,
property (A) and the analytic-isomorphism condition on every open simplex; for an open simplex `δ`
inside an open cell on which `τ` is an analytic isomorphism onto an analytic submanifold, `τ(δ)` is
an analytic submanifold of dimension `dim δ` and `τ|δ` an analytic isomorphism onto it
(`TauCeti.IsAnalyticSubmanifold.image_of_leftInvOn`).

**Theorem 1** (Łojasiewicz, §3, Theorem 1, printed p. 463), `exists_affine_semianalytic_triangulation`.
Let `(B_ν)` be a locally finite family of semianalytic subsets of `ℝⁿ`. There are a locally finite
simplicial complex `K` in `ℝⁿ` with `|K| = ℝⁿ` and a homeomorphism `τ : ℝⁿ → ℝⁿ` with property (A)
such that for every face `s` of `K`, with open simplex `σ`, the image `τ(σ)` is an analytic
submanifold of dimension `card s − 1`, `τ` restricted to `σ` is an analytic isomorphism onto it, and
for every `ν` either `τ(σ) ⊆ B_ν` or `τ(σ) ∩ B_ν = ∅`. By §2.0 the same holds on every
finite-dimensional real affine space. Since `ℝⁿ` is second countable, the nonempty members of a
locally finite family are countable; empty members impose nothing. The theorem concerns the whole
space and the whole locally finite family: the bounded Theorem 3 and the projective Theorem 4 are
distinct results.
*Needs:* §§2.0–2.0g; Tau Ceti `AffineMap.graphOn_convexHull`, `TauCeti.closedRegionBetween_convexHull`,
`TauCeti.intrinsicInterior_closedRegionBetween`, `TauCeti.intrinsicFrontier_closedRegionBetween`,
`Geometry.SimplicialComplex.exists_subdivision_extending`, `TauCeti.IsAnalyticSubmanifold.image_of_leftInvOn`,
`TauCeti.IsSemianalytic`, `TauCeti.IsPartiallySemialgebraic`.

**Checks.**
- The map `x ↦ sin x` of `ℝ` has property (A⁻¹), its graph being `y − sin x = 0` with `y` the
  polynomial variable, but not property (A): over a neighbourhood of a target value `y₀ ∈ (−1, 1)`,
  the fibre `{x : sin x = y}` is infinite and discrete, while a Boolean combination of sign
  conditions on finitely many polynomials in `x` has fibres that are finite unions of points and
  intervals. The two properties are not interchangeable.
- For `n = 1` and the single set `B = ℤ`, any compatible `K` has a vertex at each `τ⁻¹(k)` and
  infinitely many simplices; local finiteness, not finiteness, is the right condition when
  `|K| = ℝⁿ`.

### 2.1 Bounded affine semialgebraic triangulation (R2.1)

Use Mathlib's `Geometry.SimplicialComplex`, its faces and support, and `Affine.Simplex` for the
simplex charts, with open simplices the intrinsic interiors (Convention 7). Prove that a finite
complex has compact support; that the support of a finite complex, with the topology of the
ambient space, is homeomorphic to the realization of its vertex scheme
(`AbstractSimplicialComplex.Realization`, with its weak topology) by the barycentric-coordinate
map, the realization in which AffineMorseLefschetz §5.1 states its triangulations; and the empty
complex, zero-dimensional simplices, restriction to subcomplexes and finite subdivisions
(`Geometry.SimplicialComplex.IsSubdivision`). For a real affine space, choose an affine coordinate
equivalence with `ℝⁿ`, use §2.0 for independence of the choice, and transport vertices and
simplices back; all coordinates below refer to the original affine space.
*Needs:* Mathlib `Geometry.SimplicialComplex`, `Affine.Simplex`, `intrinsicInterior`; Tau Ceti
`AbstractSimplicialComplex.Realization`, `Geometry.SimplicialComplex.IsSubdivision`.

**Theorem 3** (Łojasiewicz, §3, Theorem 3, printed p. 464), `bounded_semialgebraic_analytic_triangulation`.
Let `B_1, …, B_k` be bounded semialgebraic subsets of `ℝⁿ` and `X = ⋃_i closure(B_i)`. There are a
finite simplicial complex `K` in `ℝⁿ` and a homeomorphism `τ : |K| → X` with semialgebraic graph
(bundled as `FiniteCompatibleAnalyticTriangulation`, with total extensions of `τ` and its inverse) such
that for every face `s` of `K`, with open simplex `σ`, `τ(σ)` is an analytic submanifold of dimension
`card s − 1`, `τ` is analytic on `σ` and its inverse analytic on `τ(σ)` in the submanifold charts,
and `τ(σ) ⊆ B_i` or `τ(σ) ⊆ ℝⁿ ∖ B_i` for every `i`. The `B_i` need not be closed: each is a union of
images of open simplices, and the image of a subcomplex exactly when it is closed in `X`. The map
and its inverse have semialgebraic graphs, so the analytic open-simplex maps are Nash. If the
family is empty or all members are empty, `X` and `K` are empty. Prove with it the compatibility
with finitely many further semialgebraic subsets of `X`, the restriction to a closed marked member,
one common triangulation for the union of two finite marked families (not that every change of
triangulation is piecewise linear), and transport under Nash automorphisms of `ℝⁿ`: postcompose
`τ` and transport the marked sets, keeping the affine `K`, since a nonlinear image of its vertices
is not an affine complex.

Route. Consume the parametrized finite compact lifting data of AffineMorseLefschetz Layer 5 (§5.3),
not only its final triangulation: the original marked signs, the adapted cells, the base maps, the
extended sections, the completed face lists and the distinguished vertices. Prove Theorem 3 by
induction on `n`. For `n = 0` use the empty complex or a single point; for `n = 1` subdivide a
bounding interval at the finitely many roots of the defining polynomials and the marked endpoints,
keeping exactly the cells of `X`. For `n > 1`, first make the generic invertible linear change that
renders the nonconstant defining polynomials quasi-monic in the last variable (AffineMorseLefschetz
§5.2). Choose a compact semialgebraic box containing the transformed `X` and polynomial
descriptions of the original `B_i`, their closures and `X`; choose `M > 0` bounding its last
coordinate, adjoin `t² − M²`, and close this finite quasi-monic family `F` under differentiation in
the last variable, treating zero and constant polynomials separately. Cut every completed section
list to `[−M, M]`. Build the projection decomposition, with its discriminant, gcd and frontier
refinements, before passing it to the lifting theorem, and substitute no unrelated decomposition
afterwards. Let `Y` be the projected box. Apply Theorem 3 in dimension `n − 1` to `Y` and the cells of
the projection decomposition meeting `Y`, as a finite bounded marked family; its map `Φ` is onto `Y`
and an analytic isomorphism on each open base simplex, which lies in one projection cell. Pass this
base complex and `Φ`, with `F` and the decomposition, to the lifting theorem. Each section carries a
nonzero witnessing polynomial `P` and a constant fibre multiplicity `m`: `∂_t^(m−1) P` vanishes on the
section and `∂_t^m P` does not, so the analytic implicit function theorem and the graph criterion
make each section a Nash analytic submanifold over its analytic base cell; pull it back through
`Φ` on each open base simplex. Apply the continuous closure extension of the lifting theorem with
the refined projection decomposition. Keep the membership signs of each original `B_i` on every
section and sector; replacing the family by its closures would lose them.

Prove the analytic invariant of the ordered auxiliary-section construction of AffineMorseLefschetz
§§5.4–5.5. Its initial barycentric subdivision and ordered top-vertex matching produce
face-coherent boundary lists inside each original gap; use their index maps, including sections
present only on a boundary face and copies coinciding with the upper endpoint, the auxiliary index
set `I = {x ∈ L(F_d) : a|F_d < x ≤ b|F_d}` and its prescribed restrictions to the other facets.
Auxiliary indices take the lower endpoint at the top vertex, while the original upper endpoint keeps
its value; no coherent boundary list on an unsubdivided simplex is assumed. When `I` is nonempty,
`a < b` on every open facet entering the extension formula, and the normalized boundary heights
`(c − a)/(b − a)` lie in `[0, 1]` and are Nash there; if the opposite gap collapses, `I` is empty and
no auxiliary map is created. On a `d`-simplex with barycentric coordinates `λ`, let `F_i` be its
`i`-th facet and `p_i(λ)_j = λ_j/(1 − λ_i)` for `j ≠ i`, with `i`-th coordinate `0`; for `d > 0` put
`w_i = ∏_(j≠i) λ_j` and `w_* = ∏_j λ_j`, and extend each ordered boundary ratio `r_l` by
`E_l(λ) = (w_* α_l + Σ_i w_i r_l(p_i(λ)))/(w_* + Σ_i w_i)` with fixed `0 < α_1 < ⋯ < α_L < 1`.
Prove that `E_l` is Nash on the open simplex: each `p_i` lands in an open facet, where the map is
Nash by the recursion on face dimension and by the induction hypothesis for `Φ`, and the
denominator is positive. The positive term `w_*` gives strict interior order even where sections
coincide on faces. The heights are `c_l = a + (b − a)E_l`; at a collapsed boundary gap only
boundedness of the ratios is needed, since `b − a` tends to zero. The continuity at vertices and
collapsed gaps, the finite ordered-face preparation and the dimension-decreasing recursion are
those of AffineMorseLefschetz §§5.4–5.5; this section proves the Nashness of those same extension
maps, not another boundary-matching construction. The case `d = 0` is direct.

After completing the stacks, use the second barycentric refinement of AffineMorseLefschetz §5.5:
every new simplex has a vertex in its controlling open simplex at which all its noncollapsed gaps
are positive, and face chains have the same property with their own controlling simplex, so the
affine interpolants of vertex heights are strictly ordered on each open simplex; completed
consecutive sections restrict to equal or consecutive sections on every face, an extra boundary
section having been extended into the incident stacks. Graph lifts are Nash isomorphisms by
projection. Band lifts use the band maps of §2.0d with positive width in source and target and the
collapsed-endpoint condition, and these face and order invariants make them agree with the face maps
already chosen. The rectilinear bands are finite polytopes, so subdivide them by
`Geometry.SimplicialComplex.exists_subdivision_extending` after verifying its hypotheses, as in
§2.0h. Compose the affine simplex charts with the lift and prove that every image lies in one
original sign cell, lower-dimensional pieces included. For the lower-dimensional simplices that
both subdivisions introduce, prove that an open affine `k`-simplex `δ` inside an open `d`-simplex `σ`
is a `k`-dimensional analytic submanifold and that, if `Φ|σ` is an analytic isomorphism onto an
analytic submanifold `T`, then `Φ(δ)` is a `k`-dimensional analytic submanifold and `Φ|δ` an analytic
isomorphism onto it (`TauCeti.IsAnalyticSubmanifold.image_of_leftInvOn`); this is stated for
nonempty `δ`, and an analytic immersion alone does not give it. Transport the final complex and map
back by the inverse of the initial linear change; the transported vertices and faces form an affine
complex in the original `ℝⁿ` and all analytic and semialgebraic properties are preserved. The finite
union of semialgebraic graphs and compactness of `|K|` with Hausdorff `X` give the global map and its
inverse. The noncompact Lemma 10 of §2.0d uses analytic approximation and a transcendental change of
coordinates and proves nothing about semialgebraicity of this finite map.
*Needs:* §1.1; §2.0d (band maps); AffineMorseLefschetz Layer 5 (§§5.2–5.7); Tau Ceti
`Geometry.SimplicialComplex.exists_subdivision_extending`, `TauCeti.IsAnalyticSubmanifold.image_of_leftInvOn`,
`TauCeti.isNashAt_iff_exists_isSemialgebraicOn`, `ImplicitFunctionData.analyticAt_implicitFunction`,
`TauCeti.HasSemialgebraicProjections`, `TauCeti.IsSemialgebraicOn`.

**Checks.**
- For `X = {(x, |x|) : |x| ≤ 1} ⊂ ℝ²` with `B_1 = X`, the map `t ↦ (t, |t|)` from the edge `[−1, 1]`
  is a homeomorphism with semialgebraic graph, but the image of the open edge contains the corner
  `(0, 0)`, where `X` is not an analytic submanifold. Every triangulation of Theorem 3 has a vertex
  mapped to `(0, 0)`; a theorem asking only for a semialgebraic homeomorphism would accept one edge.
- For `n = 1`, `B_1 = (0, 1)` and `B_2 = {1/2}`, a compatible triangulation of `X = [0, 1]` needs a
  vertex mapped to `1/2`, and `B_1` is the image of two open edges and one vertex but of no
  subcomplex, since it is not closed.

### 2.1a Real projective coordinates and semialgebraic transport

Real projective `n`-space is `Projectivization ℝ (Fin (n+1) → ℝ)` with Mathlib's quotient
topology, which is Hausdorff by AlgebraicTopology §4.6 and homeomorphic there to the sphere
quotient `TauCeti.RealProjectiveSpace n`. Its standard affine charts `Projectivization.affineChart i`,
partial equivalences defined on the affine opens `Projectivization.affineOpen i` without reference to
a topology, send `[v]` to the ratios `v (Fin.succAbove i j) / v i`, with inverse
`z ↦ [Fin.insertNth i 1 z]`; their transition maps are rational with nonvanishing denominators on the
overlaps, hence analytic there. Analyticity on real projective space is read through these chart
maps. Prove that, for Mathlib's topology, the affine opens are open and the charts are
homeomorphisms onto `ℝⁿ`, and that the space is compact and second countable; reduce arbitrary
finite-dimensional real vector spaces and complements of arbitrary hyperplanes to these charts by
linear coordinate equivalences; use `EuclideanSpace.equiv` for the Euclidean norm. For `n = 0` the
chart is a point; no second topology is introduced.

On the finite product `M = (i : Fin m) → Projectivization ℝ (Fin (n i + 1) → ℝ)` (`Multiprojective`),
flatten representatives to `(Σ i, Fin (n i + 1)) → ℝ` and matrix entries to
`(Σ i, Fin (n i + 1) × Fin (n i + 1)) → ℝ`, with the finite-coordinate equivalences. The standard
product chart for a choice `I` of one homogeneous coordinate in each factor is the product of the
charts `Projectivization.affineChart (I i)`, flattened by `finSigmaFinEquiv` to `ℝ^(∑ i, n i)`
(`multiprojectiveChart`, with inverse `multiprojectiveChartSymm`), on the product of the affine opens.
Define a subset `S ⊆ M` to be semialgebraic (`IsMultiprojectiveSemialgebraic`) when its preimage
under the product of the quotient maps from nonzero vectors is semialgebraic in the flattened
homogeneous coordinates. Prove that this is equivalent to semialgebraicity in every standard product
affine chart, and to local semialgebraicity at every point of `M` in those
charts; the local-to-global step uses compactness and finitely many bounded semialgebraic chart
patches, which a single unbounded affine chart does not supply. Define maps between such spaces, and
between products of affine and multiprojective spaces (the mixed spaces), by semialgebraic graphs,
the graph of a map from a subset of `ℝᴺ` to `M` being read through the quotient maps on the second
factor (`IsMultiprojectiveSemialgebraicOn`); prove finite Boolean operations, products, diagonals, composition, images and preimages through the
chart comparison and Tarski–Seidenberg. In particular this defines semialgebraic maps from the
support of an affine complex to `M`. Semialgebraicity of a graph does not assert continuity, and
Nash maps carry both the graph and the analytic condition. The empty product is included.

The projector embedding sends the line of `x ≠ 0` to the matrix `x xᵀ/(xᵀ x)`, using all `n + 1`
coordinates (`TauCeti.rankOneProjector`, `Projectivization.projector`); the formula printed on
p. 464 uses only the indices `1, …, n` and a target of dimension `n²`, which does not match
representatives with `n + 1` coordinates. It is a bijection onto the compact semialgebraic locus of
symmetric idempotent matrices of trace one (`Projectivization.range_projector`,
`Projectivization.projector_injective`, `TauCeti.projectorLocus`, `TauCeti.isSemialgebraic_projectorLocus`,
`TauCeti.isCompact_projectorLocus`), and a matrix of the locus is the projector of each of its rows
with nonzero diagonal entry (`TauCeti.rankOneProjector_row_eq_self`). Prove that it is a
homeomorphism onto the locus for Mathlib's topology, analytic with injective differential in the
projective charts, and that in the `i`-th chart its inverse is given by the ratios `A_ji/A_ii` on
`A_ii > 0`, hence analytic and semialgebraic: a Nash embedding with Nash inverse, beyond a continuous
compact embedding. For finite products use the product projector locus in the flattened matrix
coordinates. Prove that semialgebraicity of `S ⊆ M` in the sense above is equivalent to
semialgebraicity of its image, and transport relative complements inside the locus.
*Needs:* §1.1; AlgebraicTopology §4.6; Tau Ceti `Projectivization.affineChart`,
`Projectivization.affineOpen`, `TauCeti.rankOneProjector`,
`Projectivization.projector`, `Projectivization.range_projector`, `Projectivization.projector_injective`,
`TauCeti.projectorLocus`, `TauCeti.isSemialgebraic_projectorLocus`, `TauCeti.isCompact_projectorLocus`,
`TauCeti.rankOneProjector_row_eq_self`, `TauCeti.HasSemialgebraicProjections`; Mathlib
`Projectivization.instTopologicalSpace`, `EuclideanSpace.equiv`, `Fin.succAbove`, `Fin.insertNth`,
`finSigmaFinEquiv`.

**Checks.**
- For `n = 1`, a symmetric `2 × 2` matrix `[[a, b], [b, 1 − a]]` of trace one is idempotent exactly
  when `a² + b² = a`, so the locus is the circle `(a − 1/2)² + b² = 1/4`; the line of `(cos θ, sin θ)`
  goes to `a = cos² θ`, `b = cos θ sin θ`, which satisfies it. A model keeping only the entry
  `1 − a = sin² θ` would not separate the lines of `(cos θ, sin θ)` and `(cos θ, −sin θ)`, which the
  full projector separates by the sign of `b`.

### 2.1b The real multiprojective theorem

**Theorem 4** (Łojasiewicz, §3, Theorem 4, printed p. 464),
`exists_multiprojective_semialgebraic_triangulation`. Let `M` be a finite product of real
projective spaces as in §2.1a and `B_1, …, B_k` semialgebraic subsets of `M`. There are a finite
simplicial complex `K` in some `ℝᴺ` and a homeomorphism `τ : |K| → M` onto all of `M`, semialgebraic in
the mixed sense of §2.1a (with total extensions of `τ` and its inverse), such that `τ(σ) ⊆ B_i` or `τ(σ) ⊆ M ∖ B_i` for every open simplex `σ` and
every `i`, and such that for every open `d`-simplex `σ` and every standard product chart
`φ_I : U_I → ℝᴺ′`, on each nonempty `σ ∩ τ⁻¹(U_I)` the map `φ_I ∘ τ` is an analytic isomorphism onto
`φ_I(τ(σ) ∩ U_I)`, a `d`-dimensional analytic submanifold (`TauCeti.IsAnalyticSubmanifold`), with
analyticity in both directions in the sense of `TauCeti.AnalyticOnSubmanifold`; empty intersections
impose nothing. Prove that the chartwise condition does not depend on the charts and is equivalent to
the same condition in the matrix model: an analytic submanifold of the matrix space contained in the
projector locus is an analytic submanifold of the locus, and the rational chart and embedding maps
transport its analytic charts and dimension; own this containment and chart adapter here, using
the analytic chart calculus rather than treating an analytic immersion as an embedding. Route: apply
Theorem 3 to the compact projector locus itself together with the images of the `B_i`; keeping the
whole locus as a member forces the support to cover it. Compose with the Nash inverse of the
projector map, and prove the analytic and semialgebraic chart transport for every simplex and every
member. This theorem is about real projective spaces and arbitrary semialgebraic marked sets,
separately from the complex projective algebraic pairs of AffineMorseLefschetz §5.8, and uses
nothing from Layers 3–4.
*Needs:* §§2.1–2.1a; Tau Ceti `TauCeti.IsAnalyticSubmanifold`, `TauCeti.AnalyticOnSubmanifold`,
`TauCeti.IsAnalyticSubmanifold.image_of_leftInvOn`, `Projectivization.affineChart`.

**Checks.**
- For `M = ℝP¹` and the empty family, the theorem triangulates the projector circle of §2.1a. A
  simplicial complex in `ℝᴺ` has no loops or multiple edges, so `K` has at least three vertices; a
  single edge with identified ends is not a simplicial complex.

### Examples

- For `n = 2` and the single set `B = {(x, eˣ)}`, the graph of the exponential, Theorem 1 gives a
  triangulation of the plane in which `B` is a union of images of open edges and vertices, and `τ`
  has property (A) although `B` is not semialgebraic: property (A) is a local partial
  semialgebraicity of the graph of `τ`, not of `B`.
- For the closed unit disc `D ⊂ ℝ²` with marked sets `B_1 = D` and `B_2` its interior, Theorem 3
  triangulates `D` so that the boundary circle is the image of a subcomplex, at least a triangle.

### Dependencies

§§2.0–2.0h: Layer 1 (§§1.0–1.0a); ComplexKahlerGeometry K3 (§§3.2, 3.4); Tau Ceti semianalytic
and partially semialgebraic sets with their projection rules, Lemmas 1, 2 and 6, the analytic
pieces of Lemma 10, the band calculus of Lemmas 11–14, the rectilinear-cell lemmas and the relative
simplicial subdivision theorem. §§2.1–2.1b: §1.1, the band maps of §2.0d and the subdivision theorem
of §2.0h; AffineMorseLefschetz Layer 5; AlgebraicTopology §4.6; Tau Ceti's projective chart maps
and projector embedding.

## Layer 3: complexification, Stein theory and coherent sheaves (R3)

This layer builds a complexification of a real-analytic manifold with a strictly
plurisubharmonic tube around it (§3.0), the weighted `∂̄` theorem on complete Kähler manifolds
and, from it, the Stein criterion, interpolation and approximation (§3.1), and Cartan's theorems
for coherent sheaves (§3.2). The order is: scalar weighted theory, then compact coherent generation
and approximation, then theorem A and coefficient lifting, then theorem B. Layer 4 is not an input.
No proof here uses compact global Hodge theory (ComplexKahlerGeometry K5's compact parts or K6.1)
or the cycle theory of ComplexKahlerGeometry K6; of K6 only the local identities of K6.0 (§6.1) are
used.

### 3.0 Global complexification and tubes (R3.0)

**Complexification.** Construct a complexification of every Hausdorff, second-countable
real-analytic manifold `M` of dimension `n`, noncompact included, by Whitney and Bruhat's
paracompact gluing (Whitney–Bruhat, §1, Proposition 1), including its separation buffers and not
only its cocycle calculation: a complex manifold `X` modelled on `Fin n → ℂ`, with
`IsManifold 𝓘(ℂ, Fin n → ℂ) ∞ X`, an antiholomorphic involution of `X`, and a real-analytic embedding
of `M` onto its fixed locus, a closed subset, which is an `n`-dimensional analytic submanifold of the
realified `X` (§0.2). Use the coordinate charts of §0.1, read through a fixed linear equivalence
`E ≃L[ℝ] ℝⁿ`, and the open-gluing carrier and chart maps of ComplexManifolds Milestone 5; this section
owns the separation buffers and the real-structure choices of the gluing. Choose three locally
finite chart covers with `closure V_i ⊆ U_i` and `closure U_i ⊆ T_i`, each relatively compact in the
next. Complexify the transitions on the outer overlaps (`OpenPartialHomeomorph.exists_complexification`,
§0.1) and choose relatively compact complex overlap domains extending the middle overlaps, with the
inverse transitions and the intersections of closures with the real locus fixed. For each pair of
neighbouring charts put the compact common part of the inner real closures in a smaller overlap
`W`, and separate their remaining compact parts by disjoint open buffers `A` and `B`. Use these
buffers and local finiteness to choose complex neighbourhoods of the inner charts, subject to only
finitely many neighbour and triple-overlap constraints at each chart: they avoid the transitions to
disjoint real inner closures, the triple compositions lie in their domains, and the inverse and
cocycle identities hold there by analytic uniqueness (`AnalyticOnNhd.exists_eqOn_of_forall_real`).
Make every choice invariant under conjugation. Glue only these inner complex neighbourhoods along the
restricted transitions, and prove the buffer lemma: limits, inside the two chart neighbourhoods, of
transition-related pairs remain in the middle complex overlap where the transition is defined, so
by continuity the limit pair is related. Use this closed-graph property of the transitions and the
open chart identifications to separate distinct points of the quotient; the cocycle identities alone
do not prove Hausdorffness. Prove that the real charts embed with their original topology and that
the quotient has a countable atlas, hence is second countable and paracompact. Conjugation descends
to an antiholomorphic involution; shrink so that its fixed locus is exactly `M`, closed in `X`. Prove
uniqueness of the complexification germ: two complexifications are biholomorphic on neighbourhoods of
`M`, by extending the identity of `M` analytically and shrinking the overlaps.
*Needs:* §§0.1–0.2; ComplexManifolds Milestone 5; Tau Ceti `OpenPartialHomeomorph.exists_complexification`,
`AnalyticOnNhd.exists_eqOn_of_forall_real`, `IsManifold.restrictScalars_of_ne_zero`;
ComplexKahlerGeometry K3.0 (§3.1).

**Stein manifolds.** Define the predicate *Stein* on second-countable complex manifolds as in
Convention 8 (`IsStein`: holomorphic convexity through the holomorphic hull `holomorphicHull`,
holomorphic separation of points, holomorphic local coordinates).
- `ℂⁿ` is Stein: the coordinate functions separate points and give coordinates, and the holomorphic
  hull of a compact set lies in a closed polydisc containing it.
- The predicate is invariant under biholomorphisms.

**Grauert's p-function.** Prove Grauert's construction (Grauert, 1958, §3, Propositions 6 and 7).
A *p-function* for `M` is a
germ, on an open neighbourhood of the whole fixed locus `M` in the complexification, of a smooth
function `p` with `p ≥ 0`, `p⁻¹(0) = M`, `p = dp = 0` on `M`, strictly plurisubharmonic on a possibly
smaller neighbourhood of `M`. The neighbourhood may shrink under a positive smooth multiplier or a
locally finite sum. For every proper smooth exhaustion `r : M → ℝ`, construct a positive smooth
multiplier `λ` on `M` and an extension so that `r + λp` is strictly plurisubharmonic near `M`; the
multiplier depends on `r`, while the p-function germ is fixed before `r` is chosen. Define the
barrier `p*` as a further positive smooth multiple of `p` on a shrunk tube that remains strictly
plurisubharmonic there and such that `{p* < 1}` has closure inside the complexification
neighbourhood. State the smooth extension of `r`, and the domains of `λ` and `p*`, explicitly. The
multiplier lemma is local near `M`, from `p = dp = 0` and the positive Levi form there; it is not
asserted for arbitrary positive multipliers away from `M`.
*Needs:* the complexification above; Tau Ceti `TauCeti.IsManifoldStrictlyPlurisubharmonicAt`,
`TauCeti.manifoldLeviForm`.

**The tube and its exhaustion.** Use the tubular neighbourhood of the closed real fixed locus in the
realified complexification (`TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`,
GeometricTopology §1.5) and its smooth retraction `π` onto `M` (the bundle projection, through the
tubular diffeomorphism), and extend `r` by `R = r ∘ π`, with `r` normalized to be bounded below.
Choose `p*` and the tube `T` inside the common region where `p*`, `p` and `r + λp` are strictly
plurisubharmonic, so that for every compact `K ⊆ M` and `ε > 0` the set
`{x ∈ T : p*(x) ≤ 1 − ε, π(x) ∈ K}` has compact closure inside the complexification neighbourhood;
prove this by a tube of variable normal radius and compactness of the closed disc bundle over `K`,
the transverse compactness bound needed besides closure inside the neighbourhood. Construct a proper
smooth strictly plurisubharmonic exhaustion `q` of `T`, for example `q = (R + λp) + (1 − p*)⁻¹`,
after proving the Levi form of each term and of the barrier. Prove that `q` is proper, that its
sublevel sets are relatively compact and exhaust `T`, that its regular values are dense (Sard), and
that for each regular value `c` the sublevel `{q < c}` is relatively compact and strictly pseudoconvex
with smooth boundary. Steinness of `T` follows from the criterion of §3.1, not from an increasing
union of Stein open sets, and Grauert's generalized Runge limit theorem is not used as a black box.
*Needs:* the paragraphs above; Tau Ceti `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`,
`TauCeti.IsManifoldStrictlyPlurisubharmonicAt`, `ContDiff.addHaar_image_criticalPoints_eq_zero`;
GeometricTopology §1.5.

**Checks.**
- For `M = ℝ ⊂ ℂ`, `p(z) = (Im z)²` is a p-function: it is smooth, vanishes with its differential
  exactly on `ℝ`, and `i∂∂̄p = (i/2) dz ∧ dz̄ = dx ∧ dy`, which is positive. The function `|Im z|`
  vanishes exactly on `ℝ` too but is not differentiable there, so `dp = 0` on `M` fails.
- The circle `S¹` has the complexification `ℂ*` with the antiholomorphic involution `z ↦ 1/z̄`, whose
  fixed points are the `z` with `|z|² = 1`.
- `X = ℂ² ∖ {0}` separates points by holomorphic functions and has the coordinates `z, w` at every
  point, but it is not Stein: by Hartogs every holomorphic function on `X` extends to `ℂ²`, so by the
  maximum principle the holomorphic hull of the unit sphere is the closed unit ball minus the
  origin, which is not compact. A definition of Stein by separation and coordinates alone would
  accept `X`.

### 3.1 Weighted estimates, Stein criteria and approximation (R3.1)

**Dimension zero.** In complex dimension `0`, prove the Stein and embedding claims directly for a
countable discrete space, by a proper enumeration into `ℂ`; no `∂̄` estimate is needed.

**The weighted theorem.** For positive dimension, prove the noncompact weighted `∂̄` theorem
(Demailly, Chapter VIII, §§3–5, Theorems 3.2 and 4.5; Hörmander, 1965). Let `X` be a complete
Kähler manifold of complex dimension `n ≥ 1` without boundary, `E` a smooth Hermitian holomorphic
bundle, `φ` a smooth real weight and `1 ≤ k ≤ n`, with `B = [iΘ(E) + i∂∂̄φ, Λ]` on `E`-valued
`(n, k)`-forms (Convention 9). If `B` is positive semi-definite at every point and `f` is a
distributionally `∂̄`-closed `E`-valued `(n, k)`-form with `∫|f|² e^(−φ) dV < ∞` and
`∫⟨B⁻¹f, f⟩ e^(−φ) dV < ∞`, where `⟨B⁻¹f, f⟩` at a point is the least `α ≥ 0` with
`|⟨f, v⟩|² ≤ α⟨Bv, v⟩` for every `E`-valued `(n, k)`-covector `v` there, and `+∞` when there is
none (Demailly, Chapter VIII, p. 371; the usual value where `B` is invertible), there is an
`E`-valued `(n, k − 1)`-form `u` with `∂̄u = f` and `∫|u|² e^(−φ) dV ≤ ∫⟨B⁻¹f, f⟩ e^(−φ) dV`. The uniform
variant `B ≥ ε Id`, `ε > 0`, gives the closed-range bound `‖u‖ ≤ ε^(−1/2) ‖f‖` in the weighted norms;
the pointwise statement asserts no uniform constant. Prove that the maximal distributional `∂̄` is
closed and densely defined and that compactly supported smooth forms are dense in
`Dom ∂̄ ∩ Dom ∂̄*` for the graph norm, by completeness of the metric. Derive the estimate from the
Bochner–Kodaira–Nakano identity, this density, orthogonal projection onto `ker ∂̄` and the Riesz
representation theorem. The minimal solution is orthogonal to `ker ∂̄`; for smooth data it is smooth
by local elliptic regularity of its `∂̄`-Laplacian. Prove that the weight changes the formal adjoint
only in lower order, so that the weighted `∂̄`-Laplacian has the Laplace-type principal symbol
`½|ξ|² Id` on its open domain.
*Needs:* ComplexKahlerGeometry K6.0 (§6.1, Bochner–Kodaira–Nakano and the local Kähler identities),
K5a (§§5.1 and 5.7, distributions and local Laplace-type regularity), K5b.0 (§5.9, the Hermitian
Dolbeault formal adjoint and its principal symbol), K4 (§4.2, Chern connections);
SmoothBundlesConnections B2 (§§B2.1–B2.2, Hermitian bundle metrics and square-integrable sections).

**Complete metrics and twisting.** Construct a complete Kähler metric on `X` from a normalized
strictly plurisubharmonic exhaustion `q`, adding `i∂∂̄χ₀(q)` for a smooth increasing convex `χ₀`
whose first and second derivatives give completeness; prove a lower bound for the length of a path
along which `q` escapes. On a regular sublevel `D_c = {q < c}`, prove completeness of the metric
`i∂∂̄(q − log(c − q))` at its smooth boundary. Solve scalar `(0, k)` problems through the canonical
holomorphic identification with `(n, k)`-forms valued in `K_X⁻¹`, with the dual of the canonical
metric of the chosen Kähler metric; prove that it respects `∂̄` and the `L²` norms, its curvature
contributing the Ricci term. Choose a smooth increasing convex weight `χ₁(q)` whose derivative on
each compact shell of `q` dominates the negative curvature of `K_X⁻¹` and of `E`, so that `B ≥ Id`,
and, for a given locally square-integrable datum `f`, which grows fast enough that
`∫|f|² e^(−χ₁(q)) dV < ∞`; prove that such a choice exists from bounds on compact shells and the
positive Levi form of `q`.
On `D_c` use its proper exhaustion `q − log(c − q)` in the same way. A constant multiple of the
weight is used only where the corresponding uniform curvature bound is proved. Prove the
exhaustion-limit and weak compactness lemmas with bounds on each earlier compact set.
*Needs:* the weighted theorem; §3.0's exhaustion; ComplexKahlerGeometry K4 (§4.2) and the canonical
bundle of ComplexManifolds Milestone 7.

**Jet interpolation.** For finitely many distinct points `a` and prescribed holomorphic jet
polynomials `P_a` of degree at most `d`, choose disjoint coordinate balls and cutoffs `χ_a` equal to
one near `a`, put `v = Σ χ_a P_a`, and solve `∂̄u = ∂̄v` with the weight
`χ₁(q) + Σ s_a η_a log|z − a|²`, where `η_a` is one near `a` and vanishes outside its ball and
`s_a = n + d`. The logarithm is a singularity of the weight, and the resulting holomorphic functions
have no poles. Regularize by `log(|z − a|² + δ²)`, bound the negative Levi contributions on the cutoff
annuli uniformly in `δ` and increase `χ₁` to absorb them; the data are supported away from the
singularities, so the inverse-curvature estimates are uniform. Pass to a weak limit and prove
`∫|u|² |z − a|^(−2s_a) < ∞` near `a`. Since `u` is holomorphic near `a`, polar integration of its
Taylor expansion forces every coefficient of degree at most `s_a − n = d` to vanish, so `v − u` is
holomorphic with every prescribed jet: `d = 0` gives simultaneous separation of points, `d = 1`
holomorphic local coordinates. Include the local Cauchy bounds converting the `L²` estimates into
sup-norm bounds on compact sets.

**Bundle sections.** Prove the same finite-point jet interpolation for sections of every finite-rank
holomorphic bundle `E` on a Stein `X`, before Cartan's theorems: choose a smooth Hermitian metric on
`E` (SmoothBundlesConnections B2), apply the weighted theorem to `E ⊗ K_X⁻¹`, and choose `χ₁(q)` to
absorb its curvature on compact shells; in local frames the cutoff jets and singular weights give
the same vanishing-order argument. A prescribed value in any fibre extends to a global holomorphic
section, and finitely many such sections generate `E` near any given compact set, by continuity and
a finite subcover. This supplies the bundle sections of the block-matrix gluing of §3.2,
independently of Cartan's theorem A for coherent sheaves.

**Holomorphic convexity and Oka–Weil.** Given a compact `K` and `c > sup_K q`, construct for each
point `b` outside `{q ≤ c}` a holomorphic `f` with `f(b) = 1` and `sup_K |f| < 1`: use a cutoff near
`b` disjoint from `{q ≤ c}` and a logarithmic weight there with `s = n`, choose the convex part of the
weight to grow fast between `K` and the support of the cutoff derivative, and use the
inverse-curvature estimate and local Cauchy bounds to make the correction arbitrarily small on `K`,
while its value at `b` is zero. Prove that the holomorphic hull is closed and contained in the
compact sublevel `{q ≤ c}`. For Oka–Weil, given an `O(X)`-convex compact `K` and a neighbourhood `U`
of it, construct a smooth strictly plurisubharmonic exhaustion `ψ` with `ψ < 0` on `K` and `ψ > 0`
outside `U`, from finitely many holomorphic separators on a large compact shell, the given `q` outside
that shell and a smooth regularized maximum, preserving strict inequalities after a small strictly
plurisubharmonic perturbation. Choose an intermediate compact neighbourhood where the cutoff
derivative keeps a positive `ψ`-gap from `K`, solve with the weight `χ₁(q) + tψ`, `t → ∞`, and use local
Cauchy estimates to approximate a holomorphic germ on `K` by global holomorphic functions, with every
finite derivative, on smaller compact neighbourhoods.

**The Stein criterion** (`isStein_of_strictlyPlurisubharmonic_exhaustion`). Prove that a
second-countable complex manifold with a smooth strictly plurisubharmonic exhaustion is Stein, by
the holomorphic convexity and the jet interpolation above;
this precedes any use of Cartan's theorems for arbitrary coherent sheaves. In particular the tube `T`
of §3.0 is Stein.

**Stein neighbourhoods of convex compacts.** With `ψ` as above, prove that `D = {ψ < 0}` contains
`K`, is relatively compact in `U` and has the proper strictly plurisubharmonic exhaustion
`q − log(−ψ)`: prove its divergence at the boundary and its Levi positivity, then apply the Stein
criterion. Prove the finite-cut form used in §3.2. Write `t = Re F` for a global holomorphic `F`, and
take a fixed `O(X)`-convex compact `K_(≤s)`, `a < s`, `η > 0`, and open sets `U₁ ⊇ K_(≤a)`,
`U₂ ⊇ K_(a−η, s+η)`, `W_a ⊇ K_(a,a)` and `V ⊇ K_(≤s)` (notation of §3.2, item 2). For all sufficiently
small `ε > 0`, the set
`[(U₁ ∩ {t < a − ε/2}) ∪ (U₁ ∩ U₂ ∩ W_a ∩ {|t − a| < ε}) ∪ (U₂ ∩ {t > a + ε/2})] ∩ V`
is an open neighbourhood of the fixed cut `K_(≤s)`, by compactness and positive margins. Choose `ψ`,
hence the relatively compact Stein `D`, inside it. Then `ω₁ = D ∩ {t < a + ε/2}` and
`ω₂ = D ∩ {t > a − ε/2}` cover `D`, lie in `U₁` and `U₂` respectively, and meet inside
`U₁ ∩ U₂ ∩ W_a ∩ {|t − a| < ε/2}`. Take `V` to be the intersection of all common sheaf, section and
relation-column domains of the application, each containing the fixed cut, and choose `D` only after
this intersection.

**The converse exhaustion theorem.** Prove that every Stein manifold, in the sense of Convention 8,
has a smooth strictly plurisubharmonic exhaustion. Choose a countable exhaustion by `O(X)`-convex
compact sets and finitely many holomorphic separators of each compact shell; raise and rescale them
so that they are summably small, with every finite derivative, on earlier compact neighbourhoods,
while their squared moduli are large on the new shell. Add a countable positively weighted family of
global holomorphic coordinate functions whose differentials span at every point. Prove local
convergence with all derivatives by Cauchy estimates; the sum of squared moduli is smooth, strictly
plurisubharmonic and proper, its nonnegative terms preventing cancellation in the lower bound on
the shells. This gives the exhaustion that the weighted, approximation and coherent results need on
a general Stein `X`, independently of Layer 4 and of Cartan's theorems.
*Needs:* (for the paragraphs from jet interpolation on) the weighted theorem, the complete metrics
and twisting; ComplexKahlerGeometry K4 (§4.1, holomorphic bundles); SmoothBundlesConnections B2.

**Checks.**
- In `ℂ` (`n = 1`) with `d = 0`, the condition `∫_(|z−a|<r) |u|² |z − a|^(−2s_a) dV < ∞` with
  `s_a = n + d = 1` forces `u(a) = 0`, since `∫_(|z−a|<r) |z − a|^(−2) dV = 2π ∫₀^r dρ/ρ` diverges, while a
  monomial `(z − a)^m` with `m ≥ 1` gives a convergent integral. With the exponent `s_a = n + d − 1 = 0`
  the condition would force nothing; in `ℂⁿ`, `|z − a|^(2m − 2s)` is integrable near `a` exactly when
  `m > s − n`, which is why `s_a = n + d` kills the jets of degree at most `d`.
- On `ℂ² ∖ {0}` the function `|z|² + |w|²` is smooth and strictly plurisubharmonic but not an
  exhaustion (its sublevel sets contain points near the origin and are not compact), and the
  manifold is not Stein (§3.0, Checks): properness cannot be dropped from the Stein criterion.

### 3.2 Coherent Cartan theory from compact generation (R3.2)

Prove Cartan's theorems A and B for coherent analytic sheaves defined on the whole Stein manifold
`X`, in the following order. A section considered near a compact set may be local; the sheaf itself
is not silently extended from that neighbourhood. The numbers (7.2.2)–(7.4.3) below refer to
Chapter VII of Hörmander's *An Introduction to Complex Analysis in Several Variables* (3rd edition,
1990).

0. **The coherent module calculus.** Build the coherent analytic module sheaves and their calculus
   before the compact argument. Use Mathlib's `SheafOfModules` over the `RingCat`-valued holomorphic
   structure sheaf `R_W` of an open `W` (ComplexKahlerGeometry K4, §4.1); for `W = X`, with `X`
   modelled on `E` (Convention 1), it is
   `TauCeti.SheafOfModules.ringCatSheaf (smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) X ℂ)`, the sheaf of
   complex-smooth, that is holomorphic, functions with commutativity forgotten, and Mathlib's
   `smoothSheafCommRing` takes `X` in `Type`, the universe of `ℂ`. Use it with K4's locally free
   section sheaves as examples, and K4's identification of the structure sheaf `O_U` of an open
   `U ⊆ W` with the restriction `U.sheafRestrict.obj R_W`, compatible with germ maps. Work with
   `SheafOfModules.over` on `J.over U`, `J = Opens.grothendieckTopology W`, with
   `TopologicalSpace.Opens.overEquivalence` and its two continuous-site comparisons, and with the
   equivalence `TopologicalSpace.Opens.sheafOfModulesEquivOver` between modules over `R_W.over U` and
   modules over `U.sheafRestrict.obj R_W`, built from `SheafOfModules.pushforwardPushforwardEquivalence`,
   with its unit comparisons `TopologicalSpace.Opens.sheafOfModulesEquivOverUnit` and
   `TopologicalSpace.Opens.sheafOfModulesEquivOverInverseUnit`; transport them along K4's analytic ring
   isomorphism to obtain the equivalence `Ψ` between modules over `O_U` and over `R_W.over U` and its
   unit comparisons in both directions. Own the analytic section, stalk and germ comparisons across
   this transport, so that the bundle section sheaf on a Stein `D` and `F|_D` are modules over the same
   ring sheaf. Use `SheafOfModules.IsFiniteType`, `SheafOfModules.GeneratingSections` and
   `SheafOfModules.LocalGeneratorsData`, and `SheafOfModules.IsLocallyFree`, and prove their
   comparisons with analytic local frames and finite tuples.

   Define `F` to be *coherent* (`IsCoherentAnalyticSheaf`, for `W = X`) when it is of finite type
   and, for every open `U ⊆ W`, every `q ∈ ℕ` and
   every morphism `free (ULift (Fin q)) → F.over U` of modules over `R_W.over U` on `J.over U`, its
   kernel is of finite type (`SheafOfModules.IsFiniteType`); the lifted finite index lies in the ring
   and module universe. Own the lemmas transporting this condition to opens of `U`. Prove that `Ψ` and
   its inverse preserve finite free modules, kernels, finite type, local freeness and finite
   presentation: use `SheafOfModules.GeneratingSections.map` with its colimit-preservation and
   unit-isomorphism hypotheses, and `SheafOfModules.QuasicoherentData.pushforward` with the unit
   comparisons above, supplying continuity and cocontinuity in both directions, continuity of each
   `Over.post` on the over-sites, and the per-over colimit-preservation hypothesis. Prove that
   over-site continuity here, and discharge the colimit condition through the left-adjoint
   pushforwards with invertible ring maps (`SheafOfModules.isLeftAdjoint_pushforward_of_isIso`) and the
   pullbacks on `Opens U` and `Over U`, following `SheafOfModules.isQuasicoherent_pushforward_of_isLeftAdjoint`.
   Own the finite-type and finite-presentation comparisons beyond those statements, tracking the
   finite generator and relation index types in `SheafOfModules.Presentation.map`. Using
   `SheafOfModules.QuasicoherentData` and `SheafOfModules.IsFinitePresentation`, prove that over a
   coherent structure sheaf coherence is equivalent to finite presentation.

   Take ComplexKahlerGeometry K3's Oka theorem in its primitive local form (§3.4): the relations among
   any finite tuple of holomorphic functions on any open set admit, near each point, finitely many
   holomorphic relation vectors whose germs generate the relation module at every point of a
   neighbourhood. Translate it into kernels and prove that the structure sheaf is coherent; the
   primitive local proofs of K3 use nothing of this section. Translate K3's reduced-ideal and
   finite-tuple ideal generators into subsheaves of finite type of the structure sheaf, and prove them
   coherent from the coherent structure sheaf and the kernel comparisons. Build the section and stalk
   comparisons for restriction to smaller opens, through `CategoryTheory.Over.iteratedSliceEquiv` with
   `SheafOfModules.pushforwardPushforwardEquivalence`, as in `SheafOfModules.QuasicoherentData.bind`,
   and finite free presentations with their exactness and transport laws. Use the abelian structure on
   sheaves of modules, its kernels, cokernels and images, and sheafification, verifying
   `CategoryTheory.HasSheafify` and `CategoryTheory.GrothendieckTopology.WEqualsLocallyBijective` for
   `AddCommGrpCat` on `J`, `J.over U`, `(J.over U).over V`, `Opens.grothendieckTopology U` and its
   over-sites; these also give the weaker sheafification hypotheses of the finite-generator API. With
   the module stalks and `PresheafOfModules.germ_smul`, build the section and stalk comparisons and
   exactness adapters, and prove that coherent sheaves are closed under these operations and under
   extensions, by Oka's theorem. In particular the relation sheaf `R(h)` of any finite tuple `h` of
   sections of a coherent `F` is coherent; stalk generators extend to sections generating on a
   neighbourhood; every equality or finite relation of germs holds after shrinking; and coherent
   ideals, quotients and holomorphic bundle section sheaves have local presentations. No Cartan
   theorem and no global generation is an input to this calculus.
1. **Scalar vanishing.** Prove `Hᵏ(X, O) = 0` for `k > 0` from §3.1, the local Dolbeault lemma and the
   fine Dolbeault resolution, with ComplexKahlerGeometry K2's comparison of sheaf, Čech and Dolbeault
   cohomology (§2.5); own the scalar Cousin I splitting. These statements concern `O`, not arbitrary
   coherent sheaves, and precede theorems A and B.
2. **Compact generation.** For an `O(X)`-convex compact `K`, let `(E)(K)` quantify over every coherent
   sheaf `F` on a neighbourhood of `K`: clause (i) gives a finite holomorphic tuple generating `F` near
   `K`; clause (ii) says that for every finite tuple `h` generating `F` near `K` and every section `σ`
   defined near `K`, on a smaller neighbourhood `σ` is a combination of `h` with holomorphic
   coefficients. Prove both clauses for finite `K` from item 0 and disjoint small neighbourhoods.
   Choose finitely many global holomorphic `F_j` giving local coordinates at each point of `K`; their
   simultaneous real and imaginary level sets in `K` are finite. Induct by removing the `2N` real level
   constraints, with `(E)` for every choice of the remaining levels. For a real part `t(z)`, put
   `K_(a,b) = {z ∈ K : a ≤ t(z) ≤ b}` and `K_(≤u) = {z ∈ K : t(z) ≤ u}`. The finite-cut lemma (7.2.2)
   proves `(E)(K)` from `(E)` on every `K_(a,a)`. Prove the level sets and one-sided cuts `O(X)`-convex
   using `|exp(±F)|` (and `iF` for imaginary levels).

   Run the supremum continuation separately for each object. For clause (i) fix `F` and let `P_F(u)`
   say that `F` is generated near `K_(≤u)`; for clause (ii) fix `F, h, σ` on a neighbourhood of all of
   `K` and let `P_(F,h,σ)(u)` say that `σ` has coefficients in `h` near `K_(≤u)`. Both properties pass to
   smaller cuts, and the empty cuts below `min_K t` start them. At a finite supremum `α`, clause (i) on
   `K_(α,α)` gives a tuple `g` generating on a neighbourhood containing `K_(α−δ, α+δ)`, `δ > 0`. Choose
   `a ∈ (α − δ, α)` with `P_F(a)`, giving generators `f` near `K_(≤a)`, and a fixed `s ∈ (α, α + δ)`. On
   `K_(a,a)`, level `(E)`(ii) gives `γ₁f = g` and `γ₂g = f`. Once their coefficient domains are known,
   choose a coefficient neighbourhood `W_a` of `K_(a,a)` and `ε > 0`; with `U₁, U₂` the generation
   domains, intersect
   `(U₁ ∩ {t < a − ε/2}) ∪ (U₁ ∩ U₂ ∩ W_a ∩ {|t − a| < ε}) ∪ (U₂ ∩ {t > a + ε/2})` with the common
   sheaf domain, prove that the result contains the fixed `K_(≤s)` for small `ε` by compactness, and only
   then choose the Stein `D` inside it by §3.1. Put `ω₁ = D ∩ {t < a + ε/2}` and
   `ω₂ = D ∩ {t > a − ε/2}`, with `f` generating on `ω₁` and `g` on `ω₂`; their overlap lies in all matrix
   domains and in `W_a ∩ {a − ε < t < a + ε}`. The shrinking changes these neighbourhoods, not `s`. Put
   `T₁ = [[I, 0], [γ₁, I]]` and `T₂ = [[I, γ₂], [0, I]]`, so that `T₁(f, 0) = T₂(0, g)`; the frame change
   is `v = (T₂⁻¹ T₁) u` and the coefficient transition is `c₂ = (T₁⁻¹ T₂)ᵀ c₁`. Glue by the holomorphic
   cocycle construction (ComplexManifolds Milestone 7, ComplexKahlerGeometry K4) a bundle of rank
   `p + q` on `D` surjecting onto `F` there; the bundle sections of §3.1 and compactness give a finite
   tuple generating `F` near `K_(≤s)`, contradicting the supremum. Finish clause (i) near all of `K` for
   every coherent sheaf before clause (ii): refuting every finite supremum gives `P_F(u)` for all
   `u ≥ max_K t`. In particular obtain relation columns `r_k` generating `R(h)` on a neighbourhood of all
   of `K`, by item 0's coherence of `R(h)`.

   For clause (ii), at a finite supremum `α`, level `(E)`(ii) on `K_(α,α)` gives a coefficient vector
   `c²` for the fixed `h, σ` on a domain containing `K_(α−δ, α+δ)`. Choose `a ∈ (α − δ, α)` with
   `P_(F,h,σ)(a)`, giving `c¹` near `K_(≤a)`, and fix `s ∈ (α, α + δ)`. On the overlap `c¹ − c²` is a
   section of the coherent relation sheaf `R(h)`; with the tuple `r` defined near all of `K`, level
   `(E)`(ii) on `K_(a,a)` gives `c¹ − c² = Σ γ_k r_k` near the level. Only then choose `ε` and `W_a`, use
   the same three-part neighbourhood with `U₁, U₂` the domains of `c¹, c²` and `W_a` the domain of the
   level coefficients, intersect with the common domains of `F`, `σ`, `h` and all `r_k`, each containing
   all of `K`, and choose the Stein `D` by §3.1. The fixed cut lies in this open set by compactness, and
   only the overlap needs to lie in the domains of the `γ_k`. Scalar Cousin I on `D` splits each `γ_k`;
   correcting `c¹, c²` by the corresponding multiples of `r_k` preserves `σ` and makes them agree. This
   proves `P_(F,h,σ)(s)`, contradicting the supremum, so clause (ii) holds near all of `K`. Prove every
   domain choice by compactness and positive margins. This block gluing needs no near-identity
   hypothesis and no Cartan theorem; the approximation estimates of item 3 are separate.
3. **Approximation.** Prove the nested-compact summable-section lemma (7.2.4) and coherent
   approximation (7.2.7): for `F` coherent on `X`, `K` `O(X)`-convex and `s` a section defined near `K`,
   construct global sections of `F` approximating `s` in the finite-presentation seminorms on `K`, from
   the compact generators, scalar Oka–Weil and summable corrections. State the quotient seminorm
   topology, its independence of the finite presentation, the restriction maps and convergence.
4. **Theorem A and coefficient lifting.** Deduce theorem A (7.2.8): approximate a finite local
   generating tuple near each point so that its coefficient matrix stays invertible, and prove that
   `Γ(X, F) ⊗_(Γ(X, O)) O_x → F_x` is onto at every `x`, equivalently that some family of global
   sections of `F` induces an epimorphism onto `F` from a free module, a
   `SheafOfModules.GeneratingSections` (`nonempty_generatingSections_of_isStein`). Prove separately
   coefficient lifting (7.2.9): if global sections `f_1, …, f_q` generate `F` on `X`, every global
   section is `Σ a_i f_i` with `a_i ∈ O(X)`; stalk generation alone does not give this, which is
   proved by compact approximation and summable gluing, before theorem B.
5. **Fine Stein covers.** Build arbitrarily fine locally finite Stein covers of uniformly finite
   order, and prove that their finite intersections with each regular sublevel of `q` are Stein.
   Choose a smooth Hermitian metric and a positive radius function below the local coordinate,
   distance-Hessian and metric-comparison bounds and below the margins of a subordinate cover; take it
   Lipschitz enough that radii of meeting balls are comparable, so that a maximal disjoint family of
   smaller balls covers after enlargement. Prove a finite overlap bound depending on the dimension, by
   packing in uniformly comparable local Euclidean charts. Shrink the radii until the squared distance
   from each centre is strictly plurisubharmonic, giving a proper plurisubharmonic barrier on each
   ball; on a finite intersection add the nonnegative ball barriers and the sublevel barrier, prove
   properness and strict plurisubharmonicity, and apply §3.1. A merely contractible intersection of a
   good cover is not a Stein domain, and the analytic triangulation of Layer 5 is not used.
6. **Theorem B.** Prove theorem B (7.4.3), first on a relatively compact Stein stage `X′ ⊆ X`. By A on
   `X` and compactness of `closure X′`, choose finitely many sections of `Γ(X, F)` generating `F` on a
   neighbourhood of `closure X′`; the relation sheaf `R` in `0 → R → O^q → F → 0` is coherent. On the
   intersections of a Stein cover, coefficient lifting makes the map of Čech cochain groups onto;
   prove this exactness and its connecting maps. Scalar acyclicity and repeated dimension shifting
   along coherent kernels reduce positive cohomology to degrees beyond the finite order of the cover,
   where the cochains vanish. Prove this for every cover of the refinement family of item 5, pass to
   the Čech colimit and use ComplexKahlerGeometry K2's comparison of the Čech colimit with derived
   sheaf cohomology on paracompact spaces (§2.5); no acyclicity of `F` on intersections is assumed to
   invoke Leray. Finitely many generators on a noncompact stage are not inferred from A without the
   compact neighbourhood argument. Exhaust `X` by regular Stein stages; in degrees `> 1` correct
   primitives recursively on earlier stages, and in degree `1` use coherent approximation and summable
   errors to correct the differences of `0`-cocycles. Prove the resulting limit and `Hᵏ(X, F) = 0` for
   `k > 0` (`subsingleton_sheafH_of_isStein`), where `Hᵏ(X, F)` is Mathlib's sheaf cohomology
   `Sheaf.H`, the `Ext` group from the constant sheaf `ℤ`, of the underlying abelian sheaf of `F`.

Derive exactness of global sections, coherent ideal and quotient computations, and finite-point jet
interpolation from theorem B, and compare the last with the scalar construction of §3.1.

Grauert's paper also states a generalized Runge exhaustion theorem. Prove it in its conditional form
only: for increasing relatively compact domains `T_ρ` with dense Stein levels, the union is Stein when
each earlier domain is Runge in each later one, with the Runge property derived from holomorphic
convexity and plurisubharmonic sublevels in this construction. It is not stated for arbitrary nested
Stein domains, and the tube `T` does not need it, being Stein by §3.1.
*Needs:* §3.1; ComplexKahlerGeometry K2 (§2.5), K3 (§3.4, Oka coherence, Noetherian germs, ideal
generators), K4 (§4.1, structure sheaf and holomorphic bundles); ComplexManifolds Milestone 7; Mathlib
`SheafOfModules` and its finite-type, generating-sections, locally free, quasicoherent and
finite-presentation API, `TopologicalSpace.Opens.sheafOfModulesEquivOver`,
`SheafOfModules.pushforwardPushforwardEquivalence`, `CategoryTheory.Over.iteratedSliceEquiv`,
`PresheafOfModules.germ_smul`, `smoothSheafCommRing`, `SheafOfModules.toSheaf`, `Sheaf.H`; Tau Ceti
`TauCeti.SheafOfModules.ringCatSheaf`.

**Checks.**
- On `X = ℂ`, the ideal sheaf of the discrete set `ℤ` is coherent and is generated at every stalk by
  the single global section `sin(πz)`, whose zeros are exactly the integers and simple, as theorem A
  predicts; no polynomial generates it, a polynomial having finitely many zeros.
- On `ℂ² ∖ {0}`, which is not Stein, `H¹(ℂ² ∖ {0}, O)` is not zero: for the cover by `{z ≠ 0}` and
  `{w ≠ 0}` the Čech class of `1/(zw)` is not a difference of functions holomorphic on the two sets,
  since a Laurent series in `z, w` holomorphic on `{z ≠ 0}` has no terms with negative powers of `w`,
  and one on `{w ≠ 0}` none with negative powers of `z`. Theorem B needs the Stein hypothesis.

### Examples

- The unit disc with `q(z) = −log(1 − |z|²)`, strictly plurisubharmonic since
  `i∂∂̄q = i dz ∧ dz̄/(1 − |z|²)²`, is Stein by §3.1, and the metric of §3.1 built from `q` is complete
  (the Poincaré metric up to normalization).
- For `M = ℝⁿ ⊂ ℂⁿ`, the function `p(z) = |Im z|²` is a p-function, and the tube `{|Im z| < 1}` with
  `q = |Re z|² + (1 − |Im z|²)⁻¹`, of the shape of §3.0, is Stein.

### Dependencies

§3.0: Layer 0; ComplexManifolds Milestone 5; GeometricTopology §1.5; ComplexKahlerGeometry K3.0
(§3.1); Tau Ceti's convergent complexification, tubular neighbourhoods, Levi forms and Morse–Sard.
§3.1: §3.0; ComplexKahlerGeometry K4 (§§4.1–4.2), K5a (§§5.1, 5.7), K5b.0 (§5.9), K6.0 (§6.1);
ComplexManifolds Milestone 7; SmoothBundlesConnections B2. §3.2: §3.1; ComplexKahlerGeometry K2
(§2.5), K3 (§3.4), K4 (§4.1); ComplexManifolds Milestone 7; Mathlib's sheaves of modules.

## Layer 4: Grauert's proper real-analytic embedding (R4)

### 4.1 Proper holomorphic embedding of the tube

For `n = 0`, `M` is a countable discrete space and the enumeration of §3.1 embeds it properly in `ℂ`.
For `n ≥ 1`, prove that the Stein tube `T` of §3.0, of complex dimension `n`, has a proper holomorphic
embedding into `ℂ^(2n+1)`, by the following split-coordinate construction. It uses the consequences
of §3.1 (Steinness, Oka–Weil approximation, separation of points and tangents, finite-jet
interpolation) and no Cartan theorem for arbitrary coherent sheaves, and the target dimension
`2n + 1` is fixed from the start (Forstnerič, §2.1, Theorem 2.1 and Proposition 2.2).

1. Define the compact-open Fréchet topology on `O(T, ℂⁿ)`, prove completeness and the Baire theorem,
   and build Bishop's residual set of almost proper maps: those for which the connected components of
   the preimage of every compact set are relatively compact. Prove the polyhedral exhaustion lemma:
   `P_j ⋐ P_(j+1)` exhaust `T`, each `P_j` is a finite union of special analytic polyhedra, `h` maps `P_j`
   properly onto `a_j Dⁿ` (`D` the unit disc) and `a_j` increases strictly to infinity. Build the finite
   polyhedra and compact-component choices under successive small holomorphic perturbations, prove
   the compact-component conditions open and dense at each stage, and preserve them by summable
   errors. Prove the buffered compact-component approximation lemma from these polyhedra: choose
   `a_(j−1) < b_j < a_j` and put `Z_j = {‖h‖_∞ ≤ b_j}` and `Q_j = closure(P_(j+1)) ∩ Z_j`. The
   boundary-to-boundary property gives `Q_j = P_(j+1) ∩ Z_j`, compact and open and closed in `Z_j`.
   Prove `Q_j` is `O(T)`-convex: its holomorphic hull lies in `Z_j` by the coordinate bounds of `h`; the
   locally constant function equal to `0` on `Q_j` and `1` on `Z_j ∖ Q_j` extends holomorphically to a
   neighbourhood of `Z_j`, those parts being disjoint and closed; approximate its germ on the compact
   `O(T)`-convex hull by Oka–Weil; a point of the hull outside `Q_j` would have a value near `1` while the
   function is uniformly near `0` on `Q_j`, contradicting the hull inequality. Treat `Q_j = ∅`
   separately. Split `Q_j` into the disjoint compact sets `A_j = P_j ∩ Q_j` and `L_j = Q_j ∖ P_j`; the
   boundary values `‖h‖_∞ = a_j > b_j` make both open and closed in `Q_j`, and the strict buffer
   `b_j > a_(j−1)` puts `closure(P_(j−1))` in the interior of `A_j` (Forstnerič, §2.1, Theorem 2.1(d) and
   the paragraph on Bishop's maps, for the almost proper and polyhedral statements; the hull argument
   gives the compact set on which Oka–Weil controls both the old map and the growth on the shell).
2. Prove global holomorphic one-jet transversality and off-diagonal two-point transversality into
   Euclidean targets in every prescribed compact-open neighbourhood: use the finite-point jet
   interpolation of §3.1 to obtain finite-dimensional families of global holomorphic perturbations
   spanning the relevant value and jet fibres near each compact coordinate piece, apply parametric
   Sard, prove each finite-stage condition open and dense, and take a countable intersection. For the
   rank strata use compact coordinate pieces inside each exact-rank stratum and prove the needed
   stability there, without assuming a rank stratum closed; for pairs exhaust `(T × T) ∖ Δ` by compact
   pieces, asserting nothing on the diagonal `Δ`. Intersect these residual conditions with the almost
   proper residual set in the same mapping space, and choose `h` so that
   `D_h = {(x, y) : x ≠ y, h(x) = h(y)}` is a complex `n`-manifold and the locus where `dh` has corank
   exactly `k` has dimension `n − k²`, empty when that number is negative.
3. With `h` fixed, prove the same density, inside open neighbourhoods specifying finitely many strict
   shell inequalities, for the maps `g : T → ℂ^(n+1)` making `(h, g)` injective and immersive. On `D_h`
   the difference `g(x) − g(y)` has target dimension `n + 1 > n`. On a corank-`k` locus, the failure of
   injectivity of `dg` on `ker dh` has codimension `n + 2 − k`, which exceeds `n − k²` by `k² − k + 2`.
   Construct the surjective value and first-jet parameter families for these constrained loci and use
   Sard; dimension counting alone is not a proof.
4. At stage `j`, prescribe the old `g` on `A_j` and a first coordinate constant of modulus `> j` on `L_j`.
   They are disjoint compact sets whose union `Q_j` is `O(T)`-convex, so choose disjoint neighbourhoods
   and apply Oka–Weil to every coordinate; choose the perturbation of item 3 in the open neighbourhood
   preserving the strict growth and approximation bounds. Uniform approximation on `A_j` gives `C¹`
   control on the smaller `closure(P_(j−1))` by Cauchy estimates, through its positive buffer. Prove
   that every earlier `L_i`, `i < j`, lies in `A_j`, so that these approximations preserve the earlier
   growth margins.
5. Choose summable future errors below the growth margins on each `L_i`, the immersion margins on
   each earlier compact set and the pair-separation margins on compact off-diagonal pieces, scheduled
   so that every point and pair is covered. Prove locally uniform convergence and holomorphy of the
   limit `g`, and injectivity and injectivity of the differential from the persistent margins. On
   `closure(P_(j+1)) ∖ P_j` either `‖h‖_∞ > b_j` or `|g₁| > j`, so `(h, g)` leaves every compact set of
   the target: it is proper, a closed holomorphic embedding into `ℂ^(n+(n+1)) = ℂ^(2n+1)`.
*Needs:* §§3.0–3.1; Tau Ceti's Morse–Sard theorem `ContDiff.addHaar_image_criticalPoints_eq_zero`.

**Checks.**
- The surplus `k² − k + 2 = (k − 1/2)² + 7/4` is positive for every `k ≥ 1` (`2` for `k = 1`, `4` for
  `k = 2`), so the immersion condition of item 3 is generic in every corank. With `g` valued in `ℂⁿ`
  instead, the pair condition would ask `g(x) − g(y) ∈ ℂⁿ` to avoid `0` on the `n`-dimensional `D_h`;
  a generic map then has isolated zeros there, so injectivity would fail, and this count does not
  lower the target below `ℂ^(2n+1)`.

### 4.2 Grauert's embedding theorem

**Theorem** (Grauert, 1958, Theorem 3, p. 470), `grauert_proper_real_analytic_embedding`. Every
Hausdorff, second-countable real-analytic manifold `M` of dimension `n` has a regular proper real-analytic
embedding into `ℝ^(4n+2)` with closed image: a closed embedding `F : M → ℝ^(4n+2)`
(`ProperRealAnalyticEmbedding`) whose expression in every chart is analytic with injective
differential. The target dimension is `2N` for the fixed `N = 2n + 1` of §4.1. Route: complexify `M`
(§3.0); the tube `T` is Stein (§3.1); embed it properly in `ℂ^(2n+1)` (§4.1); restrict to the closed
fixed locus `M` and identify `ℂ^(2n+1)` with `ℝ^(4n+2)`. For `n = 0` the enumeration of §4.1 gives the
embedding into `ℂ`. For compact `M` properness of the restriction is automatic, but the theorem keeps
its full noncompact scope.
*Needs:* §§3.0–3.1, 4.1; Mathlib `Topology.IsClosedEmbedding`, `extChartAt`, `AnalyticAt`, `fderiv`.

**Checks.**
- The map `t ↦ (cos(2 arctan t), sin(2 arctan t))` is an analytic injective immersion of `ℝ` into `ℝ²`
  and a homeomorphism onto its image, the circle minus `(−1, 0)`, which is not closed. It is not
  proper, and the closed-embedding requirement excludes it.

### Examples

- For `M = ℝ` (`n = 1`), the complexification is a neighbourhood of `ℝ` in `ℂ`, the tube a strip, and
  the theorem gives a proper analytic embedding into `ℝ⁶`; any proper analytic embedding, such as
  `t ↦ (t, 0, …, 0)`, has the properties of §4.2.

### Dependencies

Layer 3 (§§3.0–3.1); Tau Ceti's Morse–Sard theorem; Mathlib's closed embeddings and analytic maps.

## Layer 5: manifold triangulation and transport (R5)

### 5.1 Realization of locally finite complexes

Prove that for a locally finite simplicial complex `K` in `ℝᴺ` the realization of its vertex scheme
(`AbstractSimplicialComplex.Realization`, with its weak topology) is homeomorphic to `|K|` with the
subspace topology of `ℝᴺ`, by the map sending barycentric coordinates to the affine point, with map and
inverse continuous; for finite `K` this is the comparison of §2.1. Local finiteness gives finite
vertex stars, and then the weak topology is the topology of barycentric coordinates
(`AbstractSimplicialComplex.isEmbedding_realization_coe_of_finite_vertex_stars`).
*Needs:* §2.1; Tau Ceti `AbstractSimplicialComplex.Realization`,
`AbstractSimplicialComplex.isEmbedding_realization_coe_of_finite_vertex_stars`.

**Checks.**
- The complex in `ℝ²` with vertices `0` and `(1, 1/k)`, `k ≥ 1`, and the edges from `0` to each
  `(1, 1/k)` is not locally finite at `0`. The points `x_k = (1, 1/k)/k`, one on each edge, form a set
  meeting every closed simplex in at most one point, hence closed for the weak topology, but they
  converge to `0` in `ℝ²`: the weak topology and the subspace topology differ, so local finiteness
  cannot be dropped.

### 5.2 Łojasiewicz's manifold theorem (Theorem 2)

Define property (A) for a map `τ` from a subset of `ℝᴺ` to a real-analytic manifold `M`
(`HasManifoldPropertyA`): for every `y ∈ M`, the graph of `τ` over the domain of the chart at `y`,
read through that chart (followed by the linear equivalence `e` of §0.2) in the target factor, is
partially semialgebraic over the chart image of `y` in the sense of `TauCeti.PartiallySemialgebraicAt`,
base the target and fibre `ℝᴺ`. Prove that this does not depend on the chart or on `e` and agrees with
Convention 6 for `M = ℝⁿ`.

**Theorem 2** (Łojasiewicz, §3, Theorem 2, printed p. 464),
`exists_manifold_semianalytic_triangulation`. Let `M` be a nonempty second-countable real-analytic
manifold and `(B_ν)` a locally finite family of semianalytic subsets of `M`
(`TauCeti.IsMSemianalytic`). There are a locally finite simplicial complex `K` in some `ℝᴺ` and a
homeomorphism `τ : |K| → M` (with total extensions of `τ` and its inverse) with property (A) such that
for every face `s` of `K`, with open simplex `σ`, `τ(σ)` is an analytic submanifold of `M` of dimension
`card s − 1` and `τ` restricted to `σ` is an analytic isomorphism onto it (§0.2), and `τ(σ) ⊆ B_ν` or
`τ(σ) ∩ B_ν = ∅` for every `ν`. For empty `M` the empty complex serves; the total extension of `τ`
to `ℝᴺ` needs a point of `M`. Route (the
reduction printed on p. 464): embed `M` as a closed analytic submanifold of `ℝ^(4n+2)` by §4.2, prove
that the images of the `B_ν` are semianalytic and, by properness, form a locally finite family;
include the image `F(M)` itself in the family passed to Theorem 1, and restrict the resulting complex
to the subcomplex over the closed set `F(M)`, which is locally finite and covers `F(M)`. Transport
property (A) by pulling the local graph presentations back along `F × id`
(`TauCeti.IsPartiallySemialgebraic.preimage_prodMap`); `F` is analytic and the source factor is not
required to be affine. Prove that the open-simplex analytic isomorphisms transport and that membership
of whole simplices in every `B_ν` is preserved. For compact `M`, derive by a finite subcover that `K` can
be taken finite and that only finitely many `B_ν` are nonempty; compactness is not a hypothesis of the
theorem.
*Needs:* §§0.2, 2.0h, 4.2, 5.1; Tau Ceti `TauCeti.IsMSemianalytic`, `TauCeti.PartiallySemialgebraicAt`,
`TauCeti.IsPartiallySemialgebraic.preimage_prodMap`.

**Checks.**
- For `M = S¹` and the family consisting of one point, `K` is a polygon with at least three vertices,
  one of them mapped to the point; an edge whose ends are glued is not a simplicial complex.

### 5.3 The global frontier stratification

Prove that the images of the open simplices of the triangulation of Theorem 2 form a locally finite
partition of `M` into semianalytic analytic submanifolds that is compatible with every `B_ν` and has the
frontier property: the closure of each piece is a union of pieces, and a piece in the closure of
another, distinct piece has strictly smaller dimension. Each piece `τ(σ)` is semianalytic because
`τ` has property (A) and the open simplex `σ` is semialgebraic (Łojasiewicz, §3, printed p. 463):
read in the chart at a point `y` of `M` as in §5.2, the part of the graph of `τ` over `σ` is
partially semialgebraic over the chart image of `y`, so its projection to the base, the chart
image of the part of `τ(σ)` in the chart domain, is semianalytic at the chart image of `y`. The
local dimension comes from §1.0a, the compatibility with every `B_ν` from Theorem 2, and the
frontier property from that of the locally finite subcomplex.
*Needs:* §§1.0a, 5.2; Tau Ceti `TauCeti.IsSemialgebraic.partiallySemialgebraicAt_preimage_snd`,
`TauCeti.PartiallySemialgebraicAt.inter`, `TauCeti.PartiallySemialgebraicAt.semianalyticAt_image_fst`.

### Examples

- For a compact real-analytic surface `M` and the zero set `B` of a nonconstant analytic function,
  Theorem 2 gives a finite triangulation with `B` a subcomplex, `B` being closed.

### Dependencies

Layer 1 (§1.0a), Layer 2 (§2.0h), Layer 4 (§4.2), §0.2 and §2.1; Tau Ceti's semianalytic sets on
manifolds, partial semialgebraicity and realizations of abstract simplicial complexes.

## Downstream consumers

- [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md): K3 (§3.4) builds its finite partition
  into regular pieces from the local semianalytic and component results of §§1.0–1.0a, and K6.1
  (§6.4) uses Theorem 2 and §5.3 for a finite triangulation compatible with its analytic strata and
  closed analytic subvarieties. The consumer proves its own subcomplex, homology and cycle
  statements; this roadmap supplies the semianalytic stratification and the triangulation, not
  analytic-cycle theory.
- ComplexComparisonPartII uses the Stein predicate and the Stein criterion (§§3.0–3.1), the weighted
  theorem, the complete metrics and approximation (§3.1), the coherent module calculus (§3.2, item 0)
  and Cartan's theorems (§3.2). SchubertGeometry uses the coherence predicate and Cartan's theorems
  (§3.2). GlobalHolomorphicFunctions proves the one-variable case of §3.2, item 1, on open subsets
  of `ℂ` itself and takes nothing from §3.2.
- Hyperfunctions uses the complexification of Layer 0 and §3.0 and the results of §§3.1–3.2, and
  AlgebraicTopologyPartII the bounded affine theorem with analytic simplex maps (§2.1).

## Scope and ownership

**This roadmap owns** the real-analytic and semianalytic theory of Layers 0–2 and the global theory
of Layers 3–5: analytic germs and chartwise analytic submanifolds on manifolds (§§0.1–0.2); the
local normal decomposition, semianalytic dimension, components and the frontier condition
(§§1.0–1.0a); the Nash inverse and implicit function theorems, the Nashness of real Weierstrass
coefficients, the Nash normal decomposition and its comparison with semialgebraic dimension, and
Nash maps on semialgebraic analytic submanifolds (§1.1); normal boxes and their prescribed-zero-set
and projection forms, Łojasiewicz's Lemmas 3, 4, 5, 7, 8, 9 and 10, the five steps of his §4, the face
statement of Lemma 15 and Theorem 1 (§§2.0–2.0h); the bounded semialgebraic Theorem 3 with the
analytic invariant of the semialgebraic lift (§2.1); semialgebraic structure and Nash projector
comparison for real multiprojective spaces and Theorem 4 (§§2.1a–2.1b); the Whitney–Bruhat
complexification, the Stein predicate, Grauert's p-function and the strictly plurisubharmonic tube
(§3.0); the noncompact weighted `∂̄` theorem with its precise curvature and domain hypotheses, the
complete metrics, jet interpolation, Oka–Weil approximation, the Stein criterion, Stein
neighbourhoods and the converse exhaustion theorem (§3.1); the coherent module predicate and its
calculus over the holomorphic structure sheaf, the scalar Cousin I splitting, compact generation,
coherent approximation, Cartan's theorems A and B, coefficient lifting, fine Stein covers and the
conditional Runge lemma (§3.2); the proper holomorphic embedding of the tube and Grauert's theorem
(Layer 4); and the realization homeomorphism for locally finite complexes, Theorem 2 and the global
frontier stratification (Layer 5). Subanalytic sets are outside it.

**Already in the library, used and not planned again.** The supplier contracts list the exact
declarations.

- *Semianalytic sets* (Tau Ceti): the definition at a point and globally, on normed spaces and on
  analytic manifolds, finite Boolean closure, shrinking and equivalence of presentations, analytic
  preimages, invariance under analytic isomorphisms and locally finite unions, and the normal form on
  the line.
- *Convergent complexification* (Tau Ceti, the implemented part of RealAlgebraicGeometry Layer 7): the
  extension of an analytic function on an open subset of `ℝⁿ` to a conjugation-invariant complex
  neighbourhood with the same real points, its uniqueness, the norm estimate `‖p_ℂ‖ ≤ 2ᵏ‖p‖` with the
  extension radius at least half the real one, the complexification of germs as a ring homomorphism
  compatible with pullback and characterized by commuting with conjugation, the complexification of
  analytic charts, the chart dictionary for analytic maps on manifolds and its germ isomorphisms, and
  the analytic inverse, implicit function and implicit root theorems.
- *Semialgebraic and Nash geometry* (Tau Ceti): semialgebraic sets and functions, Tarski–Seidenberg
  and quantifier elimination with parameters, closures, interiors and balls, connected components,
  semialgebraic dimension and its value on subsets that are topological manifolds; Nash germs and
  their closure under the ring operations, inverses,
  composition and directional derivatives; the local graph criterion in both directions, including
  nullified fibres and maps; one relation for a function Nash on a semialgebraic set; locally
  semialgebraic sets, their Nash Boolean presentations, Nash preimages and the theorem that a bounded
  locally semialgebraic set is semialgebraic. §1.1 states only what these do not cover.
- *Łojasiewicz's auxiliary lemmas* (Tau Ceti): partially semialgebraic sets with Boolean operations,
  locally finite unions and projections; Lemma 1, Lemma 2 and Lemma 6; the analytic ingredients of
  Lemma 10; the band calculus of Lemmas 11–14, including the analytic band isomorphisms and property
  (A⁻¹) of band maps; the rectilinear-cell statements of Lemma 15; the relative simplicial subdivision
  of a locally finite family of compact convex cells retaining a boundary triangulation, which is the
  relative convex-polyhedral subdivision lemma used in §§2.0h and 2.1; local finiteness of projected
  families; delineations with analytic roots; and the image of an analytic submanifold under an
  analytic map with analytic left inverse, the adapter used for the lower-dimensional simplices of
  §2.1.
- *Projective spaces* (Tau Ceti): the standard affine charts and their domains, and the projector
  embedding of real projective space with all homogeneous coordinates, its image,
  injectivity, the compactness and semialgebraicity of the projector locus and the row formula for its
  inverse.
- *Analysis on manifolds* (Tau Ceti): the tubular neighbourhood theorem, Levi forms and strict
  plurisubharmonicity on complex manifolds, the Morse–Sard theorem, and the realization of abstract
  simplicial complexes with its weak topology.
- *Sheaves of modules* (Mathlib): the finite-type, generating-sections, locally free, quasicoherent
  and finite-presentation API, pushforward equivalences, and the equivalence between modules over
  `R.over U` and over the restricted ring sheaf with its unit comparisons.

**Owned elsewhere and consumed here.**

- [RealAlgebraicGeometry](../../Completed/RealAlgebraicGeometry/README.md) owns polynomial semialgebraic
  sets, Thom encodings (Layer 1), subresultants (Layer 2), root continuity and matching in continuous
  families under fixed degree and gcd hypotheses (Layer 4), CAD and quantifier elimination (Layer 6),
  and the local analytic carriers and complexification (Layer 7). It supplies no semianalytic normal
  decomposition or triangulation, and its root facts are used only under their stated hypotheses.
- [AffineMorseLefschetz](../AffineMorseLefschetz/README.md) Layer 5 (A4.1) owns finite marked-family
  semialgebraic triangulation and semialgebraic dimension (§5.1), the generic direction and frontier
  preparation (§5.2), the parametrized compact lifting theorem with its exported data (§5.3), the
  rational extension of boundary heights (§5.4), completed face lists and the second refinement
  (§5.5), the continuous band transfer and endpoint pulling triangulation of its lift (§5.6), the
  projection-compatible lift (§5.7) and the complex projective algebraic pairs (§5.8). §2.1 proves the
  Nash invariant of that construction and does not build a second compact triangulation. That
  roadmap's lift uses its own pulling triangulation and takes no input from this one.
- [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) owns the realified atlas (K3.0, §3.1),
  convergent Weierstrass preparation and division (K3, §3.2), Noetherian germs, local
  parametrization, primitive Oka coherence and ideal generators (K3, §3.4), the Čech and Dolbeault
  comparisons (K2, §2.5), the holomorphic structure sheaf, holomorphic bundles and Chern connections
  (K4, §§4.1–4.2), local elliptic regularity and distributions (K5a, §§5.1, 5.7), the Hermitian
  Dolbeault adjoint and its symbol (K5b.0, §5.9), the local Kähler and Bochner–Kodaira–Nakano
  identities (K6.0, §6.1), and complex projective charts (K7.1, §7.1). Its analytic-cycle theory
  (K6.1) consumes Layer 5; no proof here uses K6.1 or its compact Hodge theory.
- [SmoothBundlesConnections](../SmoothBundlesConnections/README.md) B2 (§§B2.1–B2.2) owns Hermitian
  bundle metrics and square-integrable sections.
- [ComplexManifolds](../ComplexManifolds/README.md) owns compatible open gluing (Milestone 5) and
  holomorphic cocycle gluing and the canonical bundle (Milestone 7).
- [GeometricTopology](../GeometricTopology/README.md) §1.5 owns the uniqueness of tubular
  neighbourhoods and the retraction of the tube; [AlgebraicTopology](../AlgebraicTopology/README.md)
  §4.6 owns the Hausdorff property of Mathlib's topology on real projective space and its
  homeomorphism with the sphere quotient.

## Exact supplier contracts

### From Mathlib

- Analytic functions and manifolds: `AnalyticAt`, `AnalyticOnNhd`, `fderiv`, `IsManifold`,
  `ModelWithCorners.Boundaryless`, `extChartAt`, `MDifferentiable`, `mfderiv`, `ContMDiff`,
  `Topology.IsClosedEmbedding`,
  `IsProperMap` and `Topology.IsClosedEmbedding.isProperMap`.
- Simplicial complexes and convexity: `Geometry.SimplicialComplex` with `faces` and `space`
  (`Mathlib/Analysis/Convex/SimplicialComplex/Basic.lean`; it carries no local-finiteness notion,
  which is expressed by local finiteness of the convex hulls of the faces), `AbstractSimplicialComplex`,
  `Affine.Simplex`, `intrinsicInterior`, `convexHull`.
- Projective spaces and coordinates: `Projectivization`, `Projectivization.lift`,
  `Projectivization.mk'`, the quotient topology `Projectivization.instTopologicalSpace` with its open
  quotient map (`Mathlib/Topology/Algebra/Projectivization.lean`), `Projectivization.mk`,
  `EuclideanSpace.equiv`, `Equiv.sumArrowEquivProdArrow`, `finSigmaFinEquiv`, `Fin.succAbove`,
  `Fin.insertNth`.
- Sheaves of modules (under `Mathlib/Algebra/Category/ModuleCat/`): `SheafOfModules`,
  `SheafOfModules.unit`, `SheafOfModules.free` (`Sheaf/Free.lean`); `SheafOfModules.over`,
  `SheafOfModules.pushforward`, `SheafOfModules.pushforwardPushforwardEquivalence` and the instance
  `SheafOfModules.isLeftAdjoint_pushforward_of_isIso` (`Sheaf/PushforwardContinuous.lean`);
  `SheafOfModules.GeneratingSections`, `SheafOfModules.GeneratingSections.map` (for a functor
  preserving colimits with an isomorphism of units), `SheafOfModules.LocalGeneratorsData` and
  `SheafOfModules.IsFiniteType` (`Sheaf/Generators.lean`); `SheafOfModules.IsLocallyFree`
  (`Sheaf/LocallyFree.lean`); `SheafOfModules.Presentation.map`, `SheafOfModules.QuasicoherentData`,
  `SheafOfModules.QuasicoherentData.pushforward` (for continuous and cocontinuous functors with
  continuous `Over.post` and the colimit hypothesis), `SheafOfModules.QuasicoherentData.bind`,
  `SheafOfModules.isQuasicoherent_pushforward_of_isLeftAdjoint`, and the finite-presentation classes
  `SheafOfModules.IsFinitePresentation` and `SheafOfModules.QuasicoherentData.IsFinitePresentation`
  (`Sheaf/Quasicoherent.lean`); the abelian structure (`Sheaf/Abelian.lean`, under `HasSheafify` and
  `WEqualsLocallyBijective` for `AddCommGrpCat`); module stalks and `PresheafOfModules.germ_smul`
  (`Stalk.lean`). Also `TopologicalSpace.Opens.overEquivalence` (`Mathlib/Topology/Sheaves/Over.lean`),
  `TopologicalSpace.Opens.sheafRestrict`, `TopologicalSpace.Opens.sheafOfModulesEquivOver` with
  `TopologicalSpace.Opens.sheafOfModulesEquivOverUnit` and
  `TopologicalSpace.Opens.sheafOfModulesEquivOverInverseUnit` (`Mathlib/Topology/Sheaves/Module.lean`:
  modules over `R.over U` are equivalent to modules over the restriction of `R` to `U`, unit to unit),
  `Opens.grothendieckTopology`, `CategoryTheory.Over.iteratedSliceEquiv`, `CategoryTheory.HasSheafify`
  and `CategoryTheory.GrothendieckTopology.WEqualsLocallyBijective`.
- The holomorphic structure sheaf and sheaf cohomology: `smoothSheafCommRing`
  (`Mathlib/Geometry/Manifold/Sheaf/Smooth.lean`, the sheaf of commutative rings of smooth functions
  into a smooth ring, with the manifold and the ring in one universe), the forgetful functor
  `SheafOfModules.toSheaf` to abelian sheaves (`Mathlib/Algebra/Category/ModuleCat/Sheaf.lean`), and
  `Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`: the `Ext` groups from the
  constant sheaf `ℤ`, for a choice of universe in which `HasExt` holds).

### From Tau Ceti

Paths are under `TauCeti/`. Each declaration is assumed as stated there.

- Analytic submanifolds (`Analysis/Analytic/Submanifold/`): `TauCeti.IsAnalyticSubmanifold`,
  `TauCeti.AnalyticOnSubmanifold` (`Basic.lean`); `TauCeti.IsAnalyticSubmanifold.image_of_leftInvOn`
  (`Image.lean`: an analytic map on a `k`-dimensional analytic submanifold with an analytic left inverse
  on a submanifold containing its image has a `k`-dimensional analytic image); Lemma 6:
  `TauCeti.IsAnalyticSubmanifold.exists_topographic`, `TauCeti.horizontalShear`,
  `TauCeti.dist_le_mul_dist_tail_of_mem_image_horizontalShear` and
  `TauCeti.IsAnalyticSubmanifold.image_horizontalShear` (`Topographic.lean`, height first, sup norm).
- Analytic maps on manifolds and germs: `TauCeti.contMDiffAt_omega_iff_analyticAt`,
  `TauCeti.analyticOnNhd_ext_coord_change`, `ContMDiff.eq_of_eventuallyEq`
  (`Geometry/Manifold/ContMDiff/Analytic.lean`); `TauCeti.analyticGerms`,
  `TauCeti.analyticGerms.pullback` (`Analysis/Analytic/Germ.lean`); `ModelWithCorners.analyticGermsEquiv`
  and `ModelWithCorners.analyticGermsEquiv_ofAnalyticAt_comp_extend_symm_of_contMDiffAt`
  (`Geometry/Manifold/ContMDiff/Germ.lean`); `IsManifold.restrictScalars_of_ne_zero`
  (`Geometry/Manifold/Complex/Analytic.lean`).
- Complexification (`Analysis/Analytic/Complexification/`): `AnalyticAt.exists_complexification`,
  `AnalyticAt.exists_complexification_pi`, `ContinuousMultilinearMap.norm_complexifyPi_le_two_pow`,
  `FormalMultilinearSeries.le_radius_complexifyPi_two_mul`, `AnalyticAt.eventually_apply_star`
  (`Basic.lean`); `AnalyticOnNhd.exists_complexification`, `AnalyticOnNhd.exists_complexification_pi`,
  `AnalyticOnNhd.exists_eqOn_of_forall_real` (`Neighborhood.lean`: extension to a conjugation-invariant
  open set with the same real points, and uniqueness on a smaller such set);
  `TauCeti.analyticGerms.complexify`, `TauCeti.analyticGerms.complexify_pullback`,
  `TauCeti.analyticGerms.exists_complexify_eq_iff_eventually_apply_star` (`Germ.lean`);
  `OpenPartialHomeomorph.exists_complexification` (`Chart.lean`).
- Analytic inverse and implicit functions (`Analysis/Analytic/Inverse.lean`):
  `AnalyticAt.exists_openPartialHomeomorph`, `ImplicitFunctionData.analyticAt_implicitFunction`,
  `AnalyticAt.exists_analyticAt_eventually_eq_zero_iff`. The polydisc Cauchy formula, Osgood's lemma
  and analytic parameter integrals of `Analysis/Complex/CauchyIntegralPolydisc.lean`
  (`ContinuousOn.torusIntegral_prod_sub_inv_smul`, `ContinuousOn.analyticAt_of_differentiableAt_update`,
  `DifferentiableOn.analyticAt_of_finiteDimensional`, `TauCeti.analyticAt_circleIntegral`) underlie
  these and the complexification.
- Semianalytic sets (`Geometry/RealAnalytic/Semianalytic/`): `TauCeti.IsAnalyticBooleanCombination`,
  `TauCeti.SemianalyticAt`, `TauCeti.IsSemianalytic`, `TauCeti.SemianalyticAt.preimage`,
  `TauCeti.semianalyticAt_iff_exists_iUnion`, `LocallyFinite.isSemianalytic_iUnion`,
  `Equiv.isSemianalytic_image_iff` (`Basic.lean`); `TauCeti.MSemianalyticAt`, `TauCeti.IsMSemianalytic`
  (`Manifold.lean`, read in any chart of the maximal analytic atlas); `TauCeti.semianalyticAt_real_iff`,
  `TauCeti.SemianalyticAt.exists_Ioo_mem_iff_sign_mem` (`Real.lean`).
- Partially semialgebraic sets: `TauCeti.PartiallySemialgebraicAt`, `TauCeti.IsPartiallySemialgebraic`,
  `TauCeti.isSetAlgebra_setOf_isPartiallySemialgebraic`, `LocallyFinite.isPartiallySemialgebraic_iUnion`
  (for families with locally finite projections), `TauCeti.IsPartiallySemialgebraic.preimage_prodMap`
  (analytic changes of the base) (`PartiallySemialgebraic.lean`);
  `TauCeti.PartiallySemialgebraicAt.inter`, `TauCeti.IsSemialgebraic.partiallySemialgebraicAt_preimage_snd`
  (`PartiallySemialgebraic.lean`); `TauCeti.IsPartiallySemialgebraic.image_prodMap_comp_inl`,
  `TauCeti.PartiallySemialgebraicAt.semianalyticAt_image_fst`,
  `TauCeti.IsPartiallySemialgebraic.isSemianalytic_image_fst` (`PartiallySemialgebraic/Projection.lean`);
  `TauCeti.isPartiallySemialgebraic_graphOn_regionBetweenMap` (`PartiallySemialgebraic/RegionBetween.lean`,
  Lemma 14's property (A⁻¹)).
- Semialgebraic geometry (`Geometry/RealAlgebraic/`): `TauCeti.IsSemialgebraic`,
  `TauCeti.IsSemialgebraicOn` (`Semialgebraic/Basic.lean`, `Semialgebraic/Function.lean`); the instance
  `TauCeti.HasSemialgebraicProjections ℝ` (`CAD/Existence.lean`, Tarski–Seidenberg) and quantifier
  elimination with parameters `TauCeti.exists_isQF_realize_iff` (`Semialgebraic/QuantifierElimination.lean`);
  `TauCeti.isSemialgebraic_ball`, `TauCeti.IsSemialgebraic.closure`, `TauCeti.IsSemialgebraic.interior`
  (`Semialgebraic/Topology.lean`); `TauCeti.semialgebraicDim`,
  `TauCeti.IsSemialgebraic.semialgebraicDim_closure` (`Semialgebraic/Dimension/`) and
  `TauCeti.semialgebraicDim_eq_finrank_of_chartedSpace` (`Semialgebraic/Dimension/Manifold.lean`: a
  nonempty subset of `Fin n → ℝ` with charts on a finite-dimensional real space `E`, for the subspace
  topology, has semialgebraic dimension `finrank ℝ E`);
  `TauCeti.IsSemialgebraic.finite_image_connectedComponentIn` and
  `TauCeti.IsLocallySemialgebraic.locallyFinite_connectedComponentIn` (`Semialgebraic/Components.lean`);
  `TauCeti.SemialgebraicAt`, `TauCeti.IsLocallySemialgebraic` and
  `TauCeti.IsLocallySemialgebraic.isSemialgebraic_of_isBounded` (`Semialgebraic/Local.lean`).
- Nash germs (`Geometry/RealAlgebraic/Nash/`): `TauCeti.IsNashAt` with `TauCeti.IsNashAt.add`,
  `TauCeti.IsNashAt.mul`, `TauCeti.IsNashAt.inv` (`Basic.lean`), `TauCeti.IsNashAt.comp` (`Comp.lean`),
  `TauCeti.IsNashAt.fderiv_apply` (`Derivative.lean`), `TauCeti.isNashAt_iff_exists_isSemialgebraicOn`,
  `TauCeti.forall_isNashAt_apply_iff_exists_isSemialgebraicOn` and
  `TauCeti.exists_isSemialgebraicOn_of_forall_isNashAt` (`Graph.lean`: the local graph criterion for
  functions and maps, and a common neighbourhood for finitely many germs),
  `TauCeti.IsSemialgebraicOn.exists_ne_zero_polynomial_relation` and
  `TauCeti.IsSemialgebraicOn.isNashAt` (`OfSemialgebraic.lean`),
  `TauCeti.semialgebraicAt_iff_exists_isNashBooleanCombination` and
  `TauCeti.IsLocallySemialgebraic.preimage` (`LocallySemialgebraic.lean`). With
  `TauCeti.IsSemialgebraic.exists_ne_zero_polynomial_relation_of_isNashAt` (`Relation.lean`) and
  `TauCeti.isSemialgebraicOn_of_polynomial_relation` (`Graph.lean`), a Nash function on an open
  semialgebraic set has semialgebraic graph there.
- Delineations (`Geometry/RealAlgebraic/Stack/`): `TauCeti.nonempty_delineation`
  (`Delineation.lean`: a finite family of polynomials with continuous coefficients over a preconnected
  base, each zero everywhere or nowhere, with constant degree, number of distinct complex roots and
  pairwise gcd degree, has a delineation) and `TauCeti.Delineation.analyticOnSubmanifold_root`
  (`Analytic.lean`: over an analytic submanifold, with analytic coefficients, the root functions are
  analytic).
- Łojasiewicz's lemmas: `ContMDiff.isMeagre_range_of_finrank_mfderiv_lt`
  (`Geometry/Manifold/Sard/Meagre.lean`, Lemma 1: a smooth or analytic map from a Lindelöf manifold
  whose differential has rank below the target dimension everywhere has meagre range);
  `HasFDerivAt.finrank_range_lt_of_infinite` (`Analysis/Calculus/FDeriv/RankDrop.lean`, Lemma 2);
  `TauCeti.normalizedArsinh`, `TauCeti.deriv_normalizedArsinh_le_two`,
  `TauCeti.abs_mul_deriv_normalizedArsinh_le_one` (`Analysis/SpecialFunctions/Arsinh.lean`);
  `TauCeti.baseScaling`, `TauCeti.heightCompression`, `TauCeti.analyticAt_baseScaling`,
  `TauCeti.analyticAt_heightCompression`, `TauCeti.mapsTo_heightCompression_comp_baseScaling`,
  `TauCeti.dist_snd_le_three_mul_dist_fst_of_mem_image_heightCompression_comp_baseScaling`,
  `TauCeti.closedBall_subset_fst_image_baseScaling_image_graphOn`,
  `TauCeti.exists_analyticOnNhd_sqrt_sq_sub_one_lt_mul` (`Analysis/Analytic/HeightCompression.lean`);
  `ContDiff.exists_analyticOnNhd_abs_sub_lt` (`Analysis/Analytic/Approximation.lean`: analytic
  approximation of a `C¹` function on `ℝ` with its derivative within a positive continuous tolerance);
  `TauCeti.regionBetweenMap`, `TauCeti.closure_regionBetween_of_closure_graphOn_eq`,
  `TauCeti.image_regionBetweenMap_graphOn_lower`, `TauCeti.image_regionBetweenMap_graphOn_upper`,
  `TauCeti.eqOn_regionBetweenMap`, `TauCeti.continuousOn_regionBetweenMap`,
  `OpenPartialHomeomorph.regionBetween` (`Topology/Order/RegionBetween.lean`, Lemmas 11, 12 and 14);
  `OpenPartialHomeomorph.analyticOnNhd_regionBetween`,
  `OpenPartialHomeomorph.analyticOnNhd_regionBetween_symm` (`Analysis/Analytic/RegionBetween.lean`,
  Lemma 13); `AffineMap.graphOn_convexHull`, `TauCeti.closedRegionBetween_convexHull`,
  `TauCeti.intrinsicInterior_closedRegionBetween`, `TauCeti.intrinsicFrontier_closedRegionBetween`
  (`Analysis/Convex/RegionBetween.lean`, Lemma 15); `Geometry.SimplicialComplex.exists_subdivision_extending`,
  `Geometry.SimplicialComplex.IsSubdivision` (`Analysis/Convex/SimplicialComplex/Subdivision.lean`);
  `LocallyFinite.image_fst_of_subset` (`Topology/LocallyFinite/Projection.lean`).
- Projective spaces: `Projectivization.affineChart` and `Projectivization.affineOpen`
  (`LinearAlgebra/Projectivization/AffineChart.lean`, which imports no topology: ratios enumerated by
  `Fin.succAbove i`, inverse through `Fin.insertNth i 1`); `TauCeti.rankOneProjector`,
  `TauCeti.projectorLocus`, `TauCeti.rankOneProjector_row_eq_self`, `Projectivization.projector`,
  `Projectivization.projector_injective`, `Projectivization.range_projector`
  (`LinearAlgebra/Projectivization/Projector.lean`); `TauCeti.isCompact_projectorLocus` and
  `TauCeti.isSemialgebraic_projectorLocus` (`Geometry/RealAlgebraic/ProjectorEmbedding.lean`). Tau
  Ceti's analytic atlas of projective space (`Projectivization.instChartedSpace`,
  `Projectivization.instIsManifold`, `Geometry/Manifold/Instances/Projectivization.lean`) and its
  projector continuity are stated on Tau Ceti's own copy of the quotient topology
  (`Topology/Algebra/Projectivization.lean`), declared under the same instance name as Mathlib's, so
  those modules are not imported beside Mathlib's; §2.1a works with Mathlib's topology and reads
  analyticity through the chart maps, and does not use that atlas.
- Manifolds: `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`
  (`Geometry/Manifold/TubularNeighborhood/Existence.lean`: the normal bundle of a smooth embedding into
  a Hausdorff second-countable boundaryless manifold is diffeomorphic to an open neighbourhood of the
  image inside any given open set, the zero section going to the embedding);
  `TauCeti.manifoldLeviForm`, `TauCeti.IsManifoldStrictlyPlurisubharmonicAt`
  (`Geometry/Manifold/Complex/LeviForm.lean`); `ContDiff.addHaar_image_criticalPoints_eq_zero`
  (`Analysis/Calculus/Sard/OutermostStratum.lean`, the Morse–Sard theorem);
  `AbstractSimplicialComplex.Realization` and
  `AbstractSimplicialComplex.isEmbedding_realization_coe_of_finite_vertex_stars`
  (`AlgebraicTopology/SimplicialComplex/Realization/`).
- Sheaves of modules: `TauCeti.SheafOfModules.ringCatSheaf`
  (`Algebra/Category/ModuleCat/Sheaf/Defs.lean`: a sheaf of commutative rings with commutativity
  forgotten, the coefficient ring sheaf of `SheafOfModules`).

### From TauCetiRoadmap.RealAlgebraicGeometry

Layer 1 (Thom encodings of real roots), Layer 2 (subresultants and the gcd criterion at actual
degrees), Layer 4 (continuity and constancy of ordered real roots, and root matching for families of
fixed degree and gcd degree), Layer 6 (CAD with connected cells and quantifier elimination with
parameters, valid for every assignment of the parameters) and Layer 7 (analytic carriers and local
complexification, implemented in Tau Ceti as listed above). Assumed as stated there.

### From TauCetiRoadmap.AffineMorseLefschetz

Layer 5 (A4.1): §5.1 the finite semialgebraic triangulation theorem and semialgebraic dimension; §5.2 the
generic quasi-monic direction and the frontier preparation; §5.3 the parametrized finite compact
lifting theorem, with its exported adapted cells, marked signs, witnessing polynomials and fibre
multiplicities, extended sections, vertex orders, completed lists `L(σ)`, restriction maps `ρ`,
extension maps `E_l` and distinguished vertices; §5.4 positivity, order and continuity of the
rational extension `E_l`; §5.5 the auxiliary index set, the equal-or-consecutive restriction and the
second barycentric refinement; §5.7 the projection-compatible lift. Assumed as stated there.

### From TauCetiRoadmap.ComplexKahlerGeometry

K3.0 (§3.1, the realified atlas); K3 (§3.2, convergent Weierstrass preparation and division; §3.4,
Noetherian germs, analytic components, local parametrization, Oka coherence in primitive form and
the reduced-ideal and finite-tuple ideal generators); K2 (§2.5, the comparison of sheaf, Čech and
Dolbeault cohomology and of the Čech colimit with derived sheaf cohomology on paracompact spaces); K4
(§4.1, the `RingCat`-valued holomorphic structure sheaf, its restriction to opens through
`U.sheafRestrict` and the locally free section sheaves of holomorphic bundles; §4.2, Chern
connections); K5a (§5.1, densities and distributions; §5.7, local Laplace-type regularity); K5b.0
(§5.9, the Hermitian Dolbeault formal adjoint with principal symbol `½|ξ|² Id`); K6.0 (§6.1, the local
Kähler identities and the Bochner–Kodaira–Nakano identity). Assumed as stated there.

### From TauCetiRoadmap.ComplexManifolds

Milestone 5 (compatible open gluing of charted spaces along `TopCat.GlueData`) and Milestone 7
(holomorphic cocycle gluing of vector bundles and the canonical bundle). Assumed as stated there.

### From TauCetiRoadmap.GeometricTopology

§1.5 (tubular neighbourhoods: uniqueness and the retraction of the tube onto the submanifold).

### From TauCetiRoadmap.AlgebraicTopology

§4.6 (Mathlib's quotient topology on real projective space is Hausdorff, and the homeomorphism with
`TauCeti.RealProjectiveSpace n`).

### From TauCetiRoadmap.SmoothBundlesConnections

B2 (§B2.1, Hermitian bundle metrics; §B2.2, fibre metrics and the Hilbert space of square-integrable
sections).

## References

- S. Łojasiewicz, [“Triangulation of semi-analytic sets”](https://numdam.org/article/ASNSP_1964_3_18_4_449_0.pdf),
  *Annali della Scuola Normale Superiore di Pisa* (3) 18 (1964), 449–474. Theorem 1 is in §3, printed
  p. 463; Theorem 2 and the reduction through Grauert's embedding are printed p. 464; the Nash and
  projective comparisons of §1.VI are on p. 454, and Theorems 3 and 4 on p. 464. The introduction of
  the paper says that the basic properties of semianalytic sets in §1 are stated without proof, the
  proofs to appear separately.
- H. Grauert, [“On Levi's problem and the imbedding of real-analytic manifolds”](https://doi.org/10.2307/1970257),
  *Annals of Mathematics* (2) 68 (1958), 460–472: the real-analytic embedding theorem (Theorem 3,
  p. 470), the Stein criterion of Layer 3 (§2, Theorem 2, for relatively compact domains, and §3
  for the passage to an exhaustion) and its p-functions (§3, Propositions 6 and 7).
- H. Whitney and F. Bruhat, [doi:10.1007/BF02565913](https://doi.org/10.1007/BF02565913), §1,
  Proposition 1: the complexification of a real-analytic manifold, with its separation buffers.
- F. Forstnerič, [“Holomorphic embeddings and immersions of Stein manifolds: a survey”](https://arxiv.org/abs/1709.05630),
  §2.1, Theorem 2.1 and Proposition 2.2: almost proper maps, Bishop's polyhedral shells and the fixed
  target dimension of Layer 4. The constrained transversality and shell approximation are proved in
  §4.1 above.
- J.-P. Demailly, [*Complex Analytic and Differential Geometry*](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf),
  Chapter VIII, §§3–5, especially Theorems 3.2 and 4.5: complete metrics, the graph-domain density and
  the inverse-curvature estimate.
- L. Hörmander, [“L² estimates and existence theorems for the ∂̄ operator”](https://doi.org/10.1007/BF02391775),
  *Acta Mathematica* 113 (1965), 89–152: the weighted `∂̄` estimate and the solvability route, whose
  domain, positivity and completeness hypotheses §3.1 makes explicit.
- L. Hörmander, *An Introduction to Complex Analysis in Several Variables*, 3rd edition,
  North-Holland Mathematical Library 7 (1990), Chapter VII: the numbered results (7.2.2), (7.2.4),
  (7.2.7), (7.2.8), (7.2.9) and (7.4.3) cited in §3.2 for compact generation, approximation, theorem A,
  coefficient lifting and theorem B.
