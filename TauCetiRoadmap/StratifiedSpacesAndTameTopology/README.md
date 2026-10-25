# Roadmap: stratified spaces, tubular data and tame topology

A stratified space is a space cut into locally closed pieces, the strata, that fit together in a
controlled way along their frontiers.  This roadmap builds the general topology of such spaces and
the two classical mechanisms that make the "controlled way" precise: the conical charts and exit
paths of the topological theory, and the tubes, retractions and control functions of Thom and
Mather.  On the smooth side it carries the theory through Thom's first isotopy lemma to the
*unfolding* of a stratified space into manifolds with corners joined by fibrations, and to the
reconstruction of the space from that unfolded data.  On the tame side it builds o-minimal
structures, their cell decomposition, dimension theory and triangulation, and the Whitney
stratification of definable sets, so that semialgebraic sets, and every set definable in an
o-minimal expansion of the real field, are examples of all of the above.

Suggested homes in Tau Ceti are `TauCeti/Topology/Stratified/` for Layers 1--3,
`TauCeti/Geometry/OMinimal/` for Layers 4 and 8, `TauCeti/Geometry/Manifold/Corners/` for Layer 6,
and `TauCeti/Geometry/Stratified/` for Layers 5 and 7.  The file split is an implementation
choice; the dependency order below is not.  `Suggested.lean` gives selected target signatures;
this README is the specification.

## Scope boundary

This roadmap owns: stratifications over posets, the frontier condition, open cones, conically
stratified spaces, exit paths and the exit-path category; general o-minimal structures, their cell
decomposition, dimension, definable choice, curve selection and triangulation; smooth stratified
spaces with Thom--Mather control data, Whitney's condition (b), Mather's existence theorem for
control data, controlled vector fields and Thom's first isotopy lemma; manifolds with embedded
corners as far as unfolding needs them; unfolding data, their gluing, the unfolding of a
Thom--Mather space, and the reconstruction theorem; definable `C¹` cells and Whitney
stratifications of definable sets in o-minimal expansions of `ℝ`.

It does not construct or use:

- semialgebraic sets, cylindrical algebraic decomposition, Tarski--Seidenberg or Thom encodings
  as subjects: these are owned by [RealAlgebraicGeometry](../RealAlgebraicGeometry/README.md),
  which states that general o-minimal structures and triangulation are outside it.  This roadmap
  consumes its Layers 1, 3 and 6 to prove that semialgebraic sets form an o-minimal structure;
- semianalytic and subanalytic sets, the o-minimality of `ℝ_an` or `ℝ_exp`, and Łojasiewicz's
  semianalytic triangulation: these belong to the real-analytic geometry roadmap
  (RealAnalyticGeometry), and nothing here consumes them;
- Euler characteristics of any kind, including the o-minimal Euler characteristic and
  cellular-stratification additivity, which stay with [AlgebraicTopology](../AlgebraicTopology/README.md);
- collars and tubular neighbourhoods of manifolds and submanifolds as subjects: those are
  [GeometricTopology](../GeometricTopology/README.md) Layer 1 material, consumed here;
- constructible sheaves, exit-path ∞-categories, exit-path 2-categories and constructible
  stacks, hypercoverings and any topos-theoretic statement about stratified spaces: the last two
  belong to the Grothendieck topoi roadmap, the rest to a future sheaf-theoretic roadmap;
- intersection homology, Whitney's condition (a) as a separate subject, Verdier's condition (w)
  as a subject, and the second isotopy lemma.

Strata are indexed by a **finite** poset throughout the smooth and unfolding layers (5--7); the
topological Layers 1--3 allow an arbitrary poset.

## Standing conventions

- **Stratifications are maps to posets.**  A stratification of a topological space `X` by a
  partial order `P` is a function `s : X → P` such that `s⁻¹(U)` is open for every upper set `U`.
  This is continuity for Mathlib's upper-set topology (`Topology.WithUpperSet P`,
  `Topology.IsUpperSet`), the Alexandrov topology of Lurie, *Higher Algebra*, Definition A.5.1.
  The stratum of `p` is `X_p = s⁻¹{p}`.  Consequently `closure X_p ⊆ s⁻¹(Iic p)`: closures go
  **down** the poset, and the open stratum, when there is one, is maximal.  Do not use the
  opposite convention anywhere, including in examples taken from sources that index by dimension
  or codimension.
- **Strata need not be connected** and `s` need not be surjective; an empty stratum is allowed.
  Statements that need nonempty or connected strata carry the hypothesis.
- **The frontier condition** is: if `X_p ∩ closure X_q ≠ ∅` then `X_p ⊆ closure X_q`.  It is a
  hypothesis, never part of the definition of a stratification.
- **The open cone** `C(L)` on a space `L` is `{apex} ⊔ L × (0, ∞)`, with `U` open iff
  `U ∩ L × (0, ∞)` is open and, if `apex ∈ U`, `U ⊇ L × (0, ε)` for some `ε > 0` (Lurie,
  *Higher Algebra*, Definition A.5.3).  For compact `L` this equals the quotient topology of
  `L × [0, ∞)` with `L × {0}` collapsed; for noncompact `L` it does not, and the uniform-collar
  topology is the one used.  If `L` is stratified over `P` with every index `> p`, `C(L)` is
  stratified over `P` with the apex sent to `p`.
- **Exit paths** are paths `γ : [0,1] → X` with `t ↦ s(γ t)` monotone.  Two exit paths with the
  same endpoints are *exit-homotopic* when they are homotopic rel endpoints through exit paths.
  Composition is Mathlib's `Path.trans`.
- **Coordinates for tame geometry.**  Definable sets live in `Fin n → R`.  A cylinder over
  `Fin n → R` adds coordinate `0`: the point over `x` at height `t` is `Fin.cons t x`, and the
  projection is `Fin.tail`.  This is the convention of
  [RealAlgebraicGeometry](../RealAlgebraicGeometry/README.md#conventions-and-dependency-order) and
  of Tau Ceti's `TauCeti.IsCAD`, so that cylindrical algebraic decompositions are cell
  decompositions without reindexing.  Graphs of maps `(Fin m → R) → (Fin n → R)` are subsets of
  `Fin (m + n) → R` via `Fin.append`.
- **O-minimal structures carry parameters.**  Every point of `R` is definable (the one-variable
  axiom forces it); "definable" always means definable with parameters.  An o-minimal structure is
  a family of sets, not a first-order theory; the bridge to Mathlib's `FirstOrder.Language` is a
  theorem (Layer 4), not the definition.
- **Smoothness.**  Smooth means `C^∞`.  Strata of a smooth stratified space are boundaryless
  smooth manifolds modelled on `EuclideanSpace ℝ (Fin d)` (with `d` depending on the stratum),
  in Mathlib's sense `IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin d)) ∞`, whose topology is the
  subspace topology.  Submersions are Mathlib's `IsSubmersionAt`.
- **Manifolds with corners** are modelled on `EuclideanQuadrant n` through
  `modelWithCornersEuclideanQuadrant n`.  The *depth* of a point is the number of vanishing
  coordinates of its image in any chart.  Every manifold with corners in Layers 6--7 has
  **embedded** corners: each boundary hypersurface is embedded, and a point of depth `k` lies in
  exactly `k` boundary hypersurfaces.
- **Fibrations** are locally trivial fibre bundles given by Mathlib's `Bundle.Trivialization`:
  `p : E → B` with fibre `F` is locally trivial when every `b` lies in the base set of some
  `Bundle.Trivialization F p`.  Hurewicz and Serre fibrations are not used.

## Existing foundations

### Mathlib material to consume

- `IsLocallyClosed`, `closure`, `frontier`, `LocallyFinite`, `IsProperMap`,
  `Topology.IsOpenEmbedding`, `Topology.IsClosedEmbedding`, `Homeomorph`;
- the upper-set topology in `Mathlib/Topology/Order/UpperLowerSetTopology.lean`:
  `Topology.WithUpperSet`, `Topology.IsUpperSet`, `Topology.IsUpperSet.isClosed_iff_isLower`,
  `Topology.IsUpperSet.closure_eq_lowerClosure`, `Topology.IsUpperSet.specializes_iff_le`, and
  `AlexandrovDiscrete`;
- `Path`, `Path.trans`, `Path.Homotopy`, `Path.Homotopy.eval`, `Path.Homotopic`, and
  `FundamentalGroupoid` with its groupoid instance;
- `Bundle.Trivialization` and fibre bundles;
- smooth manifolds: `IsManifold`, `ContMDiff`, `IsSubmersionAt`, `IsImmersionAt`, `Diffeomorph`,
  integral curves (`IsMIntegralCurve`, `exists_isMIntegralCurveAt_of_contMDiffAt`), the models
  `EuclideanQuadrant`, `EuclideanHalfSpace`, `modelWithCornersEuclideanQuadrant`, and
  `ModelWithCorners.boundary`;
- `tangentConeAt`, `fderiv`, Picard--Lindelöf (`IsPicardLindelof`);
- `Geometry.SimplicialComplex`, `AbstractSimplicialComplex`, and `Setoid.IsPartition`;
- `FirstOrder.Language`, `Set.Definable`, and the ordered-ring language used by
  RealAlgebraicGeometry Layer 6.

Mathlib has no stratified spaces, open cones, exit paths, o-minimal structures, cells, control
data, or manifolds with corners beyond the quadrant model.

### Tau Ceti and sibling-roadmap material to consume

- `TauCeti.IsSemialgebraic` and its Boolean, polynomial-preimage and section API
  (`TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean`), `TauCeti.IsSemialgebraicOn`
  and `TauCeti.IsSemialgebraicMap` (`.../Semialgebraic/Function.lean`), and `TauCeti.IsCAD`
  with `TauCeti.IsCAD.isSemialgebraic_image_tail` (`TauCeti/Geometry/RealAlgebraic/CAD.lean`).
  Projection closure of semialgebraic sets over `ℝ` (Tarski--Seidenberg) is
  [RealAlgebraicGeometry Layer 6](../RealAlgebraicGeometry/README.md#layer-6-cad-and-quantifier-elimination);
  sign determination on the line by roots and complementary intervals is its Layer 3.
- `TauCeti.FundamentalGroupoid.isPushout_fundamentalGroupoid`, the two-set van Kampen theorem
  for fundamental groupoids (`TauCeti/AlgebraicTopology/FundamentalGroupoid/Pushout.lean`),
  which [AlgebraicTopology](../AlgebraicTopology/README.md) Stage 1 owns.
- `AbstractSimplicialComplex.Realization` and `TauCeti.IsTriangulable`
  (`TauCeti/Topology/Triangulable.lean`), and
  `TauCeti.AbstractSimplicialComplex.orderComplex`, whose faces are the nonempty finite chains
  of a poset; chains of strata are indexed by it.
- Collars of boundaries of manifolds with boundary (`TauCeti/Geometry/Manifold/Boundary/Collar/`)
  and tubular neighbourhoods of submanifolds from
  [GeometricTopology](../GeometricTopology/README.md) Layer 1.
- `TauCeti.HasHomotopyExtensionProperty` (`TauCeti/Topology/Homotopy/Extension/Basic.lean`).

---

## The build, in layers

### Layer 1: stratified spaces over a poset

1. **Definition and basic API.**  `Stratification X P` as in the conventions, with the stratum
   `X_p`.  Prove: equivalence with continuity into `Topology.WithUpperSet P`; each `X_p` is
   locally closed (it is `s⁻¹(Ici p) ∩ s⁻¹(Ioi p)ᶜ`); `closure X_p ⊆ s⁻¹(Iic p)`; `s⁻¹(Iic p)`
   is closed and `s⁻¹(Ici p)` is open; the strata partition `X`.
2. **Operations.**  Restriction to a subspace; pullback along a continuous map; refinement
   along a monotone map `P → Q` (pushing a stratification forward by a monotone map is again a
   stratification); products, stratified over `P × Q` with the product order; the trivial
   stratification over `Unit`; disjoint unions; stratified maps (a continuous `f : X → Y` with a
   monotone `φ : P → Q` and `s_Y ∘ f = φ ∘ s_X`) and their category.
3. **Frontier condition.**  `SatisfiesFrontierCondition`.  Prove: if it holds, `P` is finite
   and the strata are nonempty, the relation `X_p ⊆ closure X_q` is a partial order on the
   indices, and `s` refines to a stratification over that order (the *incidence order*); it is
   preserved by products and by restriction to open subsets; it holds for the realization of an
   abstract simplicial complex stratified by its open simplices over the face poset.
4. **Chains of strata.**  For finite `P`, the nonempty chains `p₀ < ⋯ < p_k` with
   `X_{p_i} ⊆ closure X_{p_{i+1}}` are the faces of the order complex of the incidence order;
   use `TauCeti.AbstractSimplicialComplex.orderComplex`.  Depth of a stratum is the length of the
   longest chain ending at it.

### Layer 2: open cones and conically stratified spaces

1. **Open cones.**  The open cone with the topology of the conventions.  Prove: it is a
   topological space; `L × (0,∞)` is an open subspace; the apex has the neighbourhood basis
   `{apex} ∪ L × (0, ε)`; for compact `L` the topology equals the quotient topology; `C(L)` is
   contractible; `C(∅)` is a point; `C(L)` is Hausdorff when `L` is; a homeomorphism `L ≅ L'`
   induces `C(L) ≅ C(L')`; `C(S^{n-1}) ≅ ℝ^n` with the apex at `0` (radial coordinates); the
   cone stratification over `P` and its continuity.
2. **Conically stratified spaces** (Lurie, *Higher Algebra*, Definition A.5.5).  Every point
   `x ∈ X_p` has a stratum-preserving open embedding `Z × C(L) → X` onto a neighbourhood of `x`
   sending `(z, apex)` to `x`, with `L` stratified by indices `> p`.  Prove: open subsets,
   products, and disjoint unions of conically stratified spaces are conically stratified; a
   space homeomorphic to a conically stratified one by a stratum-preserving homeomorphism is
   conically stratified; the link `L` of a chart may be replaced by any stratum-preservingly
   homeomorphic space.  Conical stratification does not imply the frontier condition (a stratum
   `{0, 2}` below `(0, 1)` in `[0, 1) ∪ {2}` is a counterexample); prove this.
3. **Examples, each a target.**  (a) A manifold with boundary, stratified by boundary `<`
   interior, is conically stratified with links points; use the Tau Ceti collar.  (b) The
   realization of a locally finite abstract simplicial complex, stratified by its open simplices
   over the face poset (with `σ ≤ τ` iff `σ ⊆ τ`), is conically stratified: the link of a point
   in the open simplex `σ` is the realization of the link of `σ`, and the chart is
   `int σ × C(|lk σ|)` onto the open star.  (c) `ℝ²` stratified by `{0} < (ℝ × {0}) ∖ {0} <
   ℝ² ∖ (ℝ × {0})` over `{0 < 1 < 2}`, with the link of the origin the circle stratified by two
   points below two open arcs.  (d) A smooth manifold with a closed submanifold, using the
   GeometricTopology tubular neighbourhood theorem.
4. **Covering pairs do not suffice.**  For the stratification (c), let `V₀₁ = (−1,1) × {0}`,
   `V₁₂ = {(x,y) : x ≠ 0, |y| < |x|}`, and let `V*₀₁`, `V*₁₂` be their intersections with the
   strata `1` and `2`.  The final topology on `ℝ²` with respect to the inclusions of the seven
   sets `X₀, X₁, X₂, V₀₁, V*₀₁, V₁₂, V*₁₂` is strictly finer than the Euclidean topology: the set
   `(−ε, ε) × {0} ∪ {0 < |x| < ε, |y| < |x|}` is open for it but is not a neighbourhood of the
   origin.  State and prove this; it is the reason Layer 7 glues along all pairs `i < k`, not only
   covering pairs.

### Layer 3: exit paths and the exit-path category

1. **Exit paths.**  `IsExitPath`, closure under `Path.trans`, under monotone reparametrization,
   and under stratified maps; the constant path; an exit path between two points with the same
   index stays in that stratum; there is an exit path from `x` to `y` only if `s x ≤ s y`.
2. **Exit homotopy and the category.**  `ExitHomotopic` is an equivalence relation compatible
   with `Path.trans`; reparametrization homotopies are through exit paths.  Build the exit-path
   category `Exit(X)`: objects the points of `X`, morphisms exit paths modulo exit homotopy,
   composition by concatenation.  Prove the category axioms, functoriality along stratified maps,
   and that stratum-preserving homotopic stratified maps induce naturally isomorphic functors.
3. **Structure theorems.**  (a) For a trivial stratification `Exit(X) ≌ FundamentalGroupoid X`.
   (b) The full subcategory on the points of `X_p` is isomorphic to `FundamentalGroupoid X_p`.
   (c) Every endomorphism in `Exit(X)` is an isomorphism, and `Hom(x, y)` is empty unless
   `s x ≤ s y`.  (d) The forgetful functor `Exit(X) → FundamentalGroupoid X`.  (e) For the open
   cone with its cone stratification, `Hom(apex, y)` is a singleton for every `y`, and the full
   subcategory on `L × (0, ∞)` is equivalent to `Exit(L)`.  (f) For `Z × C(L)`, the exit-path
   category is the product of `FundamentalGroupoid Z` with that of `C(L)`.
4. **The sphere.**  Stratify `S² = ℂ ∪ {∞}` by `{∞} < ℂ`.  Prove `Exit(S²)` is equivalent to
   the poset `Fin 2` regarded as a category, using (e) on a cone chart at `∞` and simple
   connectivity of `ℂ`.  Since the nerve of `Fin 2` is contractible, the exit-path category does
   not determine the homotopy type of `S²`; record this as the docstring of the theorem.

### Layer 4: o-minimal structures, cells, dimension, triangulation

Work over a linearly ordered type `R`; topology is the order topology and the product topology on
`Fin n → R`.

1. **Structures.**  `OMinimalStructure R` as in `Suggested.lean` (van den Dries, *Tame Topology
   and o-minimal Structures*, Chapter 1, §§2--3): Boolean algebras of subsets of
   `Fin n → R`, closed under `Fin.tail`- and `Fin.init`-cylinders, containing the diagonals and
   `{x 0 < x 1}`, closed under the projection `Fin.tail`, with the definable subsets of
   `Fin 1 → R` exactly the finite unions of points and open intervals with endpoints in
   `WithBot R`/`WithTop R`.  Derive: closure under coordinate permutations, products `A × B` via
   `Fin.append`, all coordinate projections, fibres, finite intersections; definable maps by
   graphs, their composition, images and preimages; closure, interior and frontier of a
   definable set are definable.
2. **Semialgebraic sets are o-minimal.**  The structure on `ℝ` whose definable sets are the
   `TauCeti.IsSemialgebraic` sets, using RealAlgebraicGeometry Layer 6 for projection and Layer 3
   for the one-variable axiom.  Prove that it is the smallest structure on `ℝ` containing the
   graphs of addition and multiplication and the order.  The identification of semialgebraic sets
   with sets definable with parameters in Mathlib's `FirstOrder.Language` sense is
   RealAlgebraicGeometry Layer 6 material and is consumed, not reproved.
3. **Monotonicity** (van den Dries, Chapter 3, (1.2)).  For `R` dense without endpoints, a
   definable `f : R → R` is, off finitely many points, continuous and either constant or strictly
   monotone on each of finitely many open intervals.
4. **Cells and cell decomposition** (Chapter 3, (2.3)--(2.11)).  `IsCell` and
   `IsCellDecomposition` with the `Fin.cons`/`Fin.tail` convention.  Prove: cells are definable,
   nonempty, definably connected and locally closed; each cell is definably homeomorphic to an
   open cell of its dimension by a coordinate projection; the cell decomposition theorem, part (I)
   (decompositions partitioning finitely many given definable sets) and part (II) (a definable
   function is continuous on each cell of some decomposition).  Every finite `TauCeti.IsCAD` is,
   as a `Finset`, an `IsCellDecomposition` for the semialgebraic structure.  Uniform finiteness: a definable family
   of finite subsets of `R` has a uniform bound on cardinality (Chapter 3, §2).
5. **Dimension** (Chapter 4, §1).  `dim A` is the largest dimension of a cell in a
   decomposition partitioning `A`, with `dim ∅ = ⊥` in `WithBot ℕ`.  Prove independence of the
   decomposition, invariance under definable bijections, `dim (A ∪ B) = max`, and the frontier
   inequality `dim (closure A ∖ A) < dim A` for nonempty `A` (Chapter 4, §1).
6. **Definable choice and curve selection** (Chapter 6, §1).  For an o-minimal expansion of an
   ordered abelian group, definable families have definable sections; for an expansion of an
   ordered field, a point in the closure of a definable `A` is the limit at `0⁺` of a continuous
   definable curve `(0, ε) → A`.
7. **Triangulation** (Chapter 8, (2.9)), for an o-minimal expansion of an ordered field (graphs
   of `+` and `·` definable): every definable `A ⊆ Fin n → R` and finitely many definable
   `B_i ⊆ A` admit a finite `Geometry.SimplicialComplex R (Fin n → R)`, a set `T` of its faces
   and a definable homeomorphism of `A` onto the union of the open simplices of `T` mapping each
   `B_i` onto a union of open simplices.  For `R = ℝ` and closed bounded `A`, deduce
   `TauCeti.IsTriangulable A`.
8. **Definable sets are conically stratified.**  For `R = ℝ`, a definable set with the
   stratification by images of open simplices of a triangulation is conically stratified over the
   face poset (Layer 2.3(b)), and satisfies the frontier condition.

### Layer 5: smooth stratified spaces, control data and the first isotopy lemma

A **smooth stratified space** is a Hausdorff, locally compact, second-countable `X` with a
stratification over a finite `P` satisfying the frontier condition, each stratum a smooth manifold
as in the conventions.

1. **Tubes and control data** (Mather, *Notes on topological stability*, §7).  A tube around
   `X_p` is `(T_p, π_p, ρ_p)`: an open `T_p ⊇ X_p`, a continuous retraction `π_p : T_p → X_p`,
   and a continuous `ρ_p : T_p → [0,∞)` with `ρ_p⁻¹(0) = X_p`.  Control data are tubes for all
   `p` such that for `p < q` and `x ∈ T_p ∩ T_q` with `π_q x ∈ T_p`,
   `π_p(π_q x) = π_p x` and `ρ_p(π_q x) = ρ_p x`, and `(π_p, ρ_p)` restricted to `T_p ∩ X_q` is a
   smooth submersion to `X_p × (0, ∞)`.  A **Thom--Mather space** is a smooth stratified space with
   control data.  Prove: restriction of control data to smaller tubes (shrinking by a continuous
   `ε : X_p → (0,∞)` to `T_p(ε) = {ρ_p < ε ∘ π_p}`); open subsets and products of Thom--Mather
   spaces are Thom--Mather; the explicit control data on Layer 2.3(c) with `π₀ = 0`,
   `ρ₀ = x² + y²`, `T₁ = {|y| < |x|}`, `π₁(x,y) = (sign x · √(x² + y²), 0)`,
   `ρ₁ = arctan(y/x)²`.
2. **Whitney's condition (b).**  A smooth submanifold of `E = EuclideanSpace ℝ (Fin n)` is a set
   locally the zero set of a smooth map to `ℝ^{n−d}` with surjective derivative; its tangent space
   at `x` is the kernel of that derivative.  Prove it is independent of the defining map and
   equals `tangentConeAt ℝ S x`.  Subspaces of fixed dimension converge when their orthogonal
   projections converge in operator norm.  For submanifolds `Y ⊆ closure X ∖ X`, the pair
   `(X, Y)` satisfies (b) at `y ∈ Y` when for all sequences `x_k ∈ X`, `y_k ∈ Y` converging to
   `y` with `x_k ≠ y_k`, if the lines `ℝ(x_k − y_k)` converge to `ℓ` and `T_{x_k}X` converge to
   `τ`, then `ℓ ⊆ τ`.  A Whitney stratified set is a closed `A ⊆ E` with a finite stratification
   into submanifolds satisfying the frontier condition and (b) for every incident pair.
3. **Existence of control data** (Mather, §7).  Every Whitney stratified closed subset of `E`
   is a Thom--Mather space.  The proof builds tubes from tubular neighbourhoods (GeometricTopology
   Layer 1) by downward induction on the strata, using (b) to make `(π_p, ρ_p)` a submersion
   near `X_p`.
4. **Controlled vector fields** (Mather, §§9--10).  A controlled vector field is a family of
   smooth vector fields `ξ_q` on the strata with `dπ_p(ξ_q) = ξ_p ∘ π_p` and
   `dρ_p(ξ_q) = 0` on `T_p ∩ X_q` near `X_p`.  Prove that its stratumwise integral curves
   (Mathlib's `IsMIntegralCurve`) assemble into a continuous local flow on `X`, and lifting:
   given a controlled submersion `f : X → ℝ^m` (smooth submersion on each stratum, with
   `f ∘ π_p = f` near `X_p`), every vector field on `ℝ^m` lifts to a controlled vector field.
5. **Thom's first isotopy lemma** (Mather, Proposition 11.1).  A proper controlled submersion
   `f : X → ℝ^m` from a Thom--Mather space is a locally trivial fibre bundle by a
   stratum-preserving homeomorphism `f⁻¹(U) ≅ U × F`.  Corollaries: (a) **local conical
   structure**: each `x ∈ X_p` has a neighbourhood stratum-preservingly homeomorphic to
   `ℝ^{dim X_p} × C(L_p)` with `L_p = ρ_p⁻¹(ε) ∩ π_p⁻¹(x)`, so every Thom--Mather space is
   conically stratified (Layer 2); (b) the link `L_p` is a compact Thom--Mather space when `X` is
   locally compact, with control data induced from `X`, and its homeomorphism type is locally
   constant along `X_p`; (c) `π_p : T_p(ε) ∩ π_p⁻¹(U) → U` is stratum-preservingly trivial over
   small `U`.

### Layer 6: manifolds with embedded corners

1. **Depth.**  For a manifold with corners modelled on `modelWithCornersEuclideanQuadrant n`,
   prove that the number of vanishing coordinates of the chart image is independent of the chart
   (smooth transition maps preserve the depth of a point of the quadrant, via the derivative and
   the tangent cone).  Prove depth `0` is `ModelWithCorners.interior` and depth `≥ 1` is
   `ModelWithCorners.boundary`.
2. **Boundary hypersurfaces.**  The closures of the connected components of the depth-`1`
   locus.  A manifold has *embedded corners* when each is a closed embedded manifold with corners
   of codimension one and each depth-`k` point lies in exactly `k` of them.  Prove: open subsets
   and products have embedded corners; the intersection of `k` distinct boundary hypersurfaces is
   a union of components of the depth-`≥ k` locus and a manifold with embedded corners of
   codimension `k`; `[0,1]^n` and `EuclideanQuadrant n` have embedded corners.
3. **Collars of faces.**  A collar of a boundary hypersurface `H` is an open embedding
   `H × [0,1) → M` restricting to the inclusion on `H × {0}`; collars of a finite family of
   hypersurfaces are *compatible* when they commute where defined.  Collars are data in Layer 7;
   no existence theorem for compatible collars is a target here.

### Layer 7: unfolding, gluing and reconstruction

Fix a finite poset `I`.

1. **Unfolding data.**  An unfolding datum over `I` consists of Hausdorff spaces `Σ_j`; for each
   `i < j` a closed subset `∂_iΣ_j ⊆ Σ_j` with a collar `c_ij : ∂_iΣ_j × [0,1) → Σ_j`, and a
   proper continuous map `s_ij : ∂_iΣ_j → Σ_i`; such that: for `i, j` incomparable,
   `∂_iΣ_k ∩ ∂_jΣ_k = ∅`; for `i < j < k`, `∂_iΣ_k ∩ ∂_jΣ_k = s_jk⁻¹(∂_iΣ_j)` and
   `s_ik = s_ij ∘ s_jk` there; the collars commute where defined and satisfy
   `s_jk ∘ c_ik(y, t) = c_ij(s_jk y, t)`; and the datum is **locally trivial**: every `b ∈ Σ_i`
   has a neighbourhood `U` over which all the maps `s_ij` (`j > i`) are trivialized
   simultaneously, compatibly with the faces and collars above them.  A **smooth** unfolding datum
   has each `Σ_j` a manifold with embedded corners whose boundary hypersurfaces are exactly the
   `∂_iΣ_j`, and all maps smooth.
2. **Gluing.**  `glue(Σ) = (⊔_j Σ_j)/∼` where `∼` is generated by `y ∼ s_ij(y)` for
   `y ∈ ∂_iΣ_j`, stratified over `I` by sending the image of `Σ_j ∖ ⋃_i ∂_iΣ_j` to `j`.  Prove:
   `glue(Σ)` is Hausdorff, compact when every `Σ_j` is compact; its stratum `j` is homeomorphic
   to `Σ_j ∖ ⋃_i ∂_iΣ_j`; it is conically stratified, with the link of a point of stratum `i`
   over `b ∈ Σ_i` equal to `glue` of the fibre datum `(s_ij⁻¹(b))_{j > i}` over `I_{>i}`.
3. **Unfolding a Thom--Mather space.**  Given a Thom--Mather space `X` over `I`, there are
   continuous `ε_i : X_i → (0, ∞)` such that `Σ_j = closure X_j ∖ ⋃_{i<j} T_i(ε_i)`,
   `∂_iΣ_j = Σ_j ∩ {ρ_i = ε_i ∘ π_i}`, `s_ij = π_i`, and collars from the flow of a controlled
   vector field transverse to the level sets of `ρ_i`, form a smooth unfolding datum.  The
   control conditions give `s_ik = s_ij ∘ s_jk`; the first isotopy lemma gives local triviality.
4. **Reconstruction.**  For `X` and `Σ` as in 3, `glue(Σ)` is homeomorphic to `X` by a
   stratum-preserving homeomorphism that is the identity on the complement in each `Σ_j` of the
   images of the collars `c_ij`.
5. **Faces indexed by flags.**  For a chain `d = (i_1 < ⋯ < i_n)` let
   `Σ_d = ∂_{i_1}Σ_{i_n} ∩ ⋯ ∩ ∂_{i_{n−1}}Σ_{i_n}` (and `Σ_d = Σ_{i_1}` when `n = 1`); for `d` the
   initial segment `(i_1 < ⋯ < i_p)` of `d'`, the compatibilities make `s_{i_p i_n}` a map
   `Σ_{d'} → Σ_d`.  In a smooth unfolding datum: (a) the set indexed by a subset
   `{k_1, …, k_m}` of `]i, j[` in the fibre `F = s_ij⁻¹(b)`, namely
   `F ∩ ∂_{k_1}Σ_j ∩ ⋯ ∩ ∂_{k_m}Σ_j`, is empty unless the subset is a chain; (b) the boundary of
   each fibre of `Σ_{d'} → Σ_d` is the union of the sets indexed by the nonempty chains of the
   ordinal sum `]i_p, i_{p+1}[ ⊔ ⋯ ⊔ ]i_{n−1}, i_n[`, so the fibres are boundaryless when each
   `i_{l+1}` covers `i_l` for `l ≥ p`; (c) for a datum from 3, with nonempty strata and `I` the
   incidence order, every one of these sets is nonempty, so the fibres are boundaryless exactly
   when each `i_{l+1}` covers `i_l` for `l ≥ p`.  The condition involves `i_p, …, i_n` and not
   `i_1, …, i_{p−1}`.
6. **The ordered-space form.**  On `Σ = ⊔_j Σ_j` let `x < y` iff `y ∈ ∂_iΣ_j` and
   `x = s_ij y` for some `i < j`.  Prove: `<` is a strict partial order; the index map
   `Σ → I` is locally constant and strictly monotone; for each `y`, `{x | x < y}` is a finite
   chain whose cardinality is the depth of `y` in a smooth datum; `∂_iΣ_j` is the set of `y ∈ Σ_j`
   with some `x < y` in `Σ_i`, and `s_ij y` is the unique such `x`.  Hence the datum without
   collars is determined by `(Σ, <, Σ → I)`.
7. **Mixed tubes.**  For `i ≤ j ≤ k` in a Thom--Mather space, let
   `M^j_{ik} = (T_i ∩ closure X_k) ∖ ⋃_{j ≤ l < k} X_l`.  Prove: `M^i_{ik} = T_i ∩ X_k`,
   `M^k_{ik} = T_i ∩ closure X_k`, `j ↦ M^j_{ik}` is monotone, and over a small open `U ⊆ X_i`,
   `π_i : M^j_{ik} ∩ π_i⁻¹(U) → U` is trivial with fibre the subset of `C(L_i) ∩ closure X_k`
   obtained by deleting the strata indexed in `[j, k[`.

### Layer 8: definable stratifications over `ℝ`

Work with an o-minimal expansion of the real field (graphs of `+`, `·` on `ℝ` definable).

1. **`C¹` cells** (van den Dries, Chapter 7).  Definable functions are `C¹` off a definable
   set of lower dimension; every finite family of definable sets is partitioned by a decomposition
   into `C¹` cells, each a `C¹` submanifold of `Fin n → ℝ`.
2. **Whitney stratification** (van den Dries--Miller, *Geometric categories and o-minimal
   structures*, §4).  For every finite `k ≥ 1`, every closed definable set admits a finite
   stratification into definable connected `C^k` submanifolds satisfying the frontier condition
   and Whitney's condition (b) (Layer 5.2 with `C^k` in place of smooth), compatible with finitely
   many definable subsets.
3. **The semialgebraic case with smooth strata** (Bochnak--Coste--Roy, *Real Algebraic
   Geometry*, Theorem 9.7.11).  For the semialgebraic structure the strata can be taken to be
   Nash, hence smooth, submanifolds.  Consequently every compact semialgebraic set carries a
   Thom--Mather structure (Layer 5.3), a smooth unfolding datum (Layer 7.3) and the
   reconstruction of Layer 7.4.

## Acceptance checks

- `ℝ` stratified by `{0} < ℝ ∖ {0}`: conically stratified with link two points; exit-path
  category equivalent to the category with one object `a`, two objects `b, c`, one morphism
  `a → b` and one `a → c`.
- Layer 2.4: the seven-piece final topology on `ℝ²` is strictly finer than the Euclidean one.
- Layer 3.4: `Exit(S²) ≌ Fin 2`.
- The explicit control data of Layer 5.1 on `ℝ²` satisfy the control conditions; its unfolding
  has `Σ₀` a point, `Σ₁` two closed half-lines and `Σ₂` the complement in `ℝ²` of an open disc
  and of two open wedges, a manifold with four corner points, each over the chain `0 < 1`; gluing
  recovers `ℝ²`.
- The semialgebraic structure on `ℝ` is o-minimal; the closed unit disc has a semialgebraic
  triangulation compatible with its boundary circle.
- The cone `{x² + y² = z²}` in `ℝ³` with strata `{0}` and its complement is Whitney stratified;
  its link is two circles; its unfolding has `Σ₀ = {0}` and `Σ₁` the cone minus an open ball
  around `0`, two copies of `S¹ × [ε, ∞)` with `∂₀Σ₁` the two boundary circles, and gluing
  recovers the cone.

## Ordering and cross-roadmap dependencies

Layers 1, 2 and 3 are topological and depend only on Mathlib and the Tau Ceti van Kampen and
simplicial-complex material.  Layer 4 depends on RealAlgebraicGeometry Layers 3 and 6 for its
semialgebraic instance only; its general theory depends on Mathlib alone.  Layer 4.8 uses
Layer 2.3(b).  Layer 6 depends on Mathlib's manifolds with corners.  Layer 5 depends on Layers 1,
2 and GeometricTopology Layer 1 (tubular neighbourhoods).  Layer 7 depends on Layers 5 and 6.
Layer 8 depends on Layers 4 and 5.  Each acceptance check is completed with the first layer that
makes it expressible.

## Provenance

The scope was assembled from the tame-topology programme of Grothendieck's *Esquisse d'un
programme* (1984), §5, and the notes on stratified spaces, tubes and unfolding ("dépliage") in
the Grothendieck fonds of the University of Montpellier, folders 120, 121, 150, 151 and 156,
as edited in the Grothendieck edition (github.com/mycaule/grothendieck-project), which also built
some objects by hand in Lean (`lean/Grothendieck/Folder120.lean`, families of tame subsets with
axioms M'1--M'4; `Folder121.lean`, the coarsest cell decomposition for a Boolean algebra of
subsets; `Folder150.lean`, a counterexample on `[0,1]` to a reconstruction without the condition
`X_i ∩ Y = f(Ẋ_i)`; `Folder156_2.lean`, the rives of a closed subset).  Layer 2.4 is that
edition's counterexample to gluing along covering pairs only; Layers 7.5--7.7 state, in the
standard language, the flag combinatorics, the ordered-space form of unfolded data and the mixed
tubes of folders 150--151.  None of this code is prescriptive.

## References

- J. Lurie, *Higher Algebra*, Appendix A: Definitions A.5.1 (Alexandrov topology and
  stratifications), A.5.3 (open cone), A.5.5 (conically stratified spaces), and §A.6 (exit
  paths).
- J. Woolf, "The fundamental category of a stratified space", *Journal of Homotopy and Related
  Structures* 4 (2009), 359--387: the 1-categorical exit-path category.
- L. van den Dries, *Tame Topology and o-minimal Structures*, LMS Lecture Note Series 248,
  Cambridge University Press (1998): Chapter 1, §§2--3 (structures, o-minimality); Chapter 3,
  (1.2) (monotonicity) and §2, especially (2.11) (cells, cell decomposition, uniform
  finiteness); Chapter 4, §1 (dimension, dimension of the frontier); Chapter 6, §1 (definable
  choice, curve selection); Chapter 7 (`C¹` cell decomposition); Chapter 8, (2.9)
  (triangulation).
- L. van den Dries and C. Miller, "Geometric categories and o-minimal structures", *Duke
  Mathematical Journal* 84 (1996), 497--540, §4 (stratifications).
- J. Bochnak, M. Coste and M.-F. Roy, *Real Algebraic Geometry*, Ergebnisse der Mathematik 36,
  Springer (1998), Theorem 9.7.11 (Whitney stratification of semialgebraic sets with Nash
  strata).
- J. Mather, "Notes on topological stability", *Bulletin of the AMS* 49 (2012), 475--506
  (Harvard notes, 1970): §§6--7 (Whitney's condition (b), tubes, control data and their
  existence), §§9--10 (controlled vector fields), Proposition 11.1 (Thom's first isotopy lemma).
- R. Thom, "Ensembles et morphismes stratifiés", *Bulletin of the AMS* 75 (1969), 240--284.
- A. Verona, *Stratified Mappings — Structure and Triangulability*, Lecture Notes in
  Mathematics 1102, Springer (1984): abstract stratified spaces and their resolution.
- P. Albin, É. Leichtnam, R. Mazzeo and P. Piazza, "The signature package on Witt spaces",
  *Annales scientifiques de l'École normale supérieure* 45 (2012), 241--310, §2 (resolution of a
  Thom--Mather space to a manifold with corners and iterated fibration structure, and its
  blow-down).
- D. Joyce, "On manifolds with corners", in *Advances in Geometric Analysis*, Advanced Lectures
  in Mathematics 21 (2012), 225--258, §2 (depth and boundary of manifolds with corners).
- A. Grothendieck, *Esquisse d'un programme* (1984), §5 ("tame topology"), in *Geometric Galois
  Actions 1*, LMS Lecture Note Series 242 (1997).
