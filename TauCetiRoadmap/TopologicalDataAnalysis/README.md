# Roadmap: Topological data analysis

**Summary.** This roadmap builds persistent homology over a field and its use on data: persistence
modules over the real line, their interval decompositions, rank invariants and diagrams; the
interleaving, bottleneck and Wasserstein distances and the isometry theorem; sublevel persistence
of functions on spaces and of monotone functions on simplicial complexes, with the persistence
algorithm by matrix reduction and its correctness; distance functions, offsets, critical points,
weak feature size and reach; Čech and Vietoris–Rips complexes, the nerve lemma and the
Gromov–Hausdorff stability of Rips persistence; homology inference from finite samples; and the
statistics of diagrams: the distance to a measure, persistence landscapes with their limit
theorems, confidence sets and sampling rates. The organisation is by proof dependency. Locators
come from Edelsbrunner–Harer (*Computational Topology*), Chazal–de Silva–Glisse–Oudot (*The
Structure and Stability of Persistence Modules*), Oudot (*Persistence Theory*), Dey–Wang
(*Computational Topology for Data Analysis*) and Carlsson–Vejdemo-Johansson (*Topological Data
Analysis with Applications*); results whose only source is a paper not at hand carry a proof
route of our own and are cited by author, title and year.

## Scope and ownership

The roadmap is complete when every target below is proved in Tau Ceti: the headlines with a Lean
name in `Suggested.lean`, and the headlines stated here in prose, which are targets of the same
standing. `Suggested.lean` states the headlines that carry a Lean name, each with every conclusion
this README attaches to it; it is not an exhaustive acceptance test.

Owned here:

- persistence modules over `ℝ` as functors into `ModuleCat`, pointwise finite dimension,
  `q`-tameness, interval modules, interval decompositions (finite type, and Crawley-Boevey's
  theorem for pointwise finite-dimensional modules) and the uniqueness of the barcode;
- the rank invariant, diagrams as multiplicity functions, matchings, the bottleneck and
  Wasserstein distances between diagrams, interleavings and the isometry theorem;
- sublevel persistence of functions on spaces, its stability, confidence sets from uniform bands,
  and sublevel persistence of Morse functions;
- simplicial filtrations, the Euler–Poincaré formula, positive and negative simplices, the
  persistence algorithm by matrix reduction with the pairing lemma and its correctness, bottleneck
  and Wasserstein stability of simplicial filtrations, zero-dimensional persistence as single
  linkage;
- distance functions to compact sets, Hausdorff perturbation of offsets, critical points, the weak
  feature size, the reach, the isotopy lemma, and the description of the Gromov–Hausdorff distance
  by correspondences;
- Čech and Vietoris–Rips complexes, their inclusions, the nerve lemma for finite open covers with
  contractible intersections, the identification of Čech persistence with offset persistence, and
  Gromov–Hausdorff stability of Rips persistence;
- homology inference: the Niyogi–Smale–Weinberger theorem, inference under positive weak feature
  size from offsets and from Rips complexes, Rips pairs below the reach;
- the distance to a measure with its stability and its empirical form, persistence landscapes with
  their stability and their uniform limit theorems, the sampling bound and the rate for
  `(a, b)`-standard laws.

**Not owned here.**

- Singular homology and its homotopy invariance are Mathlib's (`singularHomologyFunctor`); the
  ordered simplicial chain complex, its comparison with singular homology of the realization, the
  Čech double complex of an open cover and its quasi-isomorphism, and the vanishing of the homology
  of contractible spaces are Tau Ceti's (supplier contracts below). The AlgebraicTopology roadmap
  (§4.7, simplicial realizations) owns the general theory of realizations; nothing here re-owns it.
- The Wasserstein distance between probability measures is Tau Ceti's
  `TauCeti.wassersteinEDist`, presented in the OptimalTransport roadmap (§3.1); the
  Gromov–Hausdorff distance is Mathlib's `GromovHausdorff.ghDist`, consumed by OptimalTransport
  (§15.6), which does not own its description by correspondences; that description is owned here
  (5.4).
- The classification of indecomposable representations of equioriented type-`A` quivers is
  Tau Ceti's (`TauCeti.gabrielIndecomposableEquivPositiveRoot`), presented in the
  QuiverRepresentations roadmap (§5.1).
- Morse functions, the deformation of sublevel sets across bands without critical values, Milnor's
  cell attachment and the strong Morse inequalities are Tau Ceti's and the MorseTheory roadmap's
  (Layers 2 and 4.1); 3.4 consumes them. Tau Ceti's file on persistence of critical points
  (`Geometry/Manifold/Morse/Persistence.lean`) is about the survival of nondegenerate critical
  points under perturbation, not about persistent homology.
- Glivenko–Cantelli and Donsker classes, bracketing numbers and the bracketing theorems are
  MathematicalStatisticsAsymptotic's (§§3.1, 3.2, 3.4); 8.3 consumes them.
- The bootstrap and its consistency belong to a resampling roadmap in an open pull request; the
  confidence sets of 3.3 use only a uniform band whose coverage is given.
- Multiparameter persistence, zigzag persistence, Mapper, persistent cohomology algorithms and
  the other topics listed under Beyond are not owned by any roadmap.

## Conventions

- **Coefficients.** A field `𝕜 : Type`. All vector spaces are `ModuleCat 𝕜` objects in universe
  `0`; all spaces are `TopCat` objects in universe `0`.
- **Persistence modules.** `PersistenceModule 𝕜` is `ℝ ⥤ ModuleCat 𝕜`, with `ℝ` the preorder
  category of Mathlib (`Preorder.smallCategory`). Interleavings shift the index by
  `t ↦ t + ε`; they are stated pointwise (`IsInterleaved`) so that no equality `t + ε + ε = t + 2ε`
  of objects is needed.
- **Homology.** The homology of a filtered space is singular homology with coefficients in `𝕜`
  (Mathlib's `singularHomologyFunctor`, evaluated at the object `𝕜`) of the filtered subspaces,
  with the maps induced by inclusions (`setFiltrationModule`). A filtration of a simplicial complex
  on a vertex type `ι` is a filtration of the realization of the full simplex on `ι`
  (`fullComplex`, `facePoints`), so that every simplicial module is a functor without further
  construction. The algebraic layer computes simplicial homology with Tau Ceti's
  `TauCeti.orderedSimplicialChainComplex`; the two meet through Tau Ceti's comparison isomorphism
  and its naturality (4.1).
- **Ranks and junk values.** `rankInv V s t` is the rank of `V_s → V_t` in `ℕ∞` (infinite ranks
  are `⊤`, never a junk `0`), and is `0` for `t < s`.
- **Diagrams.** A diagram is a multiplicity function `Diagram` on `OffDiag`, the points `(b, d)` of
  `EReal × EReal` with `b < d`. Essential classes have `d = ⊤`; classes born at `-∞` have `b = ⊥`.
  The diagonal is not part of a diagram; it is available to every matching at the cost
  `diagDist (b, d) = (d - b)/2`, which is `⊤` for an infinite coordinate. Bars of length zero
  never appear.
- **Distances.** Points of the extended plane are compared in `ℓ^∞` (`pointDist`), with
  `eRealDist ⊤ ⊤ = 0` and `eRealDist ⊤ a = ⊤` for `a ≠ ⊤`. The bottleneck, Wasserstein and
  interleaving distances take values in `ℝ≥0∞` and are `⊤` when no finite matching or interleaving
  exists.
- **Rips parameter.** `ripsComplex x r` has the faces of diameter at most `2r`, following
  Edelsbrunner–Harer (p. 74) and Dey–Wang (Def 2.10, p. 32). With the maximum-edge parameter all
  Rips scales are doubled. Čech complexes are ambient: `cechComplex x r` has the faces whose closed
  balls of radius `r` meet in the ambient space.
- **Offsets.** `offsetModule A p` is sublevel persistence of `x ↦ infDist x A`. For `r < 0` the
  offset is empty, for `r ≥ 0` it is the closed thickening of `A` (Mathlib's `cthickening`).
  Mathlib's `infDist x ∅` is the junk value `0`, so every theorem about offsets assumes `A`
  nonempty.
- **Measures.** Sampling statements live on `Fin n → E` under `Measure.pi`. Events that need not
  be measurable are measured by the outer measure and expectations of possibly non-measurable
  quantities are lower Lebesgue integrals `∫⁻`, so no measurability hypothesis is hidden.

## Exact supplier contracts

### From Mathlib

- `Preorder.smallCategory` (`CategoryTheory/Category/Preorder.lean`) and
  `Monotone.functor` (same file): the index category and the functor of a monotone family of sets.
- `AlgebraicTopology.singularHomologyFunctor` (`AlgebraicTopology/SingularHomology/Basic.lean`),
  with its homotopy invariance in the same directory.
- `ModuleCat`, `Module.rank`, `Cardinal.toENat`, `Matrix.rank`
  (`LinearAlgebra/Matrix/Rank.lean`), `Matrix.BlockTriangular` (`LinearAlgebra/Matrix/Block.lean`).
- `PreAbstractSimplicialComplex` and `AbstractSimplicialComplex`
  (`AlgebraicTopology/SimplicialComplex/Basic.lean`): faces are a set of nonempty finsets closed
  under nonempty subsets; an abstract complex contains every singleton.
- `Metric.infDist`, `Metric.hausdorffDist`, `Metric.infDist_le_infDist_add_hausdorffDist`,
  `Metric.hausdorffDist_le_of_infDist` (`Topology/MetricSpace/HausdorffDistance.lean`) and
  `Metric.cthickening` (`Topology/MetricSpace/Thickening.lean`).
- `GromovHausdorff.ghDist` and `GromovHausdorff.ghDist_le_hausdorffDist`
  (`Topology/MetricSpace/GromovHausdorff.lean`).
- `SimpleGraph.IsTree` (`Combinatorics/SimpleGraph/Acyclic.lean`), `Manifold.IsSmoothEmbedding`
  (`Geometry/Manifold/SmoothEmbedding.lean`), `MeasureTheory.Measure.support`
  (`MeasureTheory/Measure/Support.lean`), `MeasureTheory.Measure.pi`.

### From Tau Ceti

- `TauCeti.orderedSimplicialChainComplex`
  (`AlgebraicTopology/SimplicialComplex/ChainComplex.lean`): for a linearly ordered vertex type,
  the free module on the faces of each dimension with the alternating boundary.
- `AbstractSimplicialComplex.Realization`
  (`AlgebraicTopology/SimplicialComplex/Realization/Basic.lean`)
  and the comparison of ordered simplicial homology with singular homology of the realization,
  `TauCeti.orderedSimplicialHomologyIsoSingularHomology`
  (`AlgebraicTopology/SimplicialComplex/Realization/CWComplex/OrderedChainComplex.lean`).
- `TauCeti.quasiIso_cechTotalAugmentation` (`AlgebraicTopology/Singular/Cech/OrderedQuasiIso.lean`):
  the augmentation of the total complex of the Čech double complex of an open cover (ordered
  form) is a quasi-isomorphism onto the singular chains of the union.
- `TauCeti.isZero_singularHomologyFunctor_of_contractibleSpace`
  (`AlgebraicTopology/Singular/Contractible.lean`).
- `ChainComplex.eulerChar_eq_homologyEulerChar`
  (`Algebra/Homology/EulerCharacteristic/ChainComplex.lean`).
- `TauCeti.sublevelInclusion` (`Topology/Order/Sublevel.lean`),
  `TauCeti.exists_sublevelHomotopyEquiv`
  (`Geometry/Manifold/Morse/Deformation.lean`) and
  `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation`
  (`Geometry/Manifold/Morse/RelCWComplex.lean`).
- `TauCeti.gabrielIndecomposableEquivPositiveRoot`
  (`RepresentationTheory/Quiver/FiniteRepType/Correspondence.lean`) and the Krull–Schmidt theorem
  in Azumaya's form for finite families, `TauCeti.exists_equiv_linearEquiv_of_isLocalRing_end`
  (`RingTheory/KrullSchmidt/Uniqueness.lean`).
- `TauCeti.wassersteinEDist` (`MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`), valued in
  `ℝ≥0∞`, the infimum over couplings of the `L^p` norm of the distance.

### From roadmaps on main

- **MathematicalStatisticsAsymptotic**, §3.1 (Glivenko–Cantelli and Donsker classes, the
  Brownian-bridge limit), §3.2 (bracketing numbers; Lipschitz parametric classes, van der Vaart,
  Ex 19.7) and §3.4 (Glivenko–Cantelli and Donsker under bracketing): consumed in 8.3.
- **QuiverRepresentations**, §5.1 (indecomposables of equioriented type `A` are intervals):
  consumed in 1.3 through the Tau Ceti declaration above.
- **MorseTheory**, Layer 2 (deformation across bands and cell attachment) and §4.1 (strong
  inequalities): consumed in 3.4.
- **OptimalTransport**, §3.1 (the Wasserstein distance `W_p` of Tau Ceti): consumed in 8.1.

No other roadmap's definitions are copied into `Suggested.lean`.

## How to read the build

Layer 1 is pure algebra: modules, intervals, decompositions and diagrams. Layer 2 puts metrics on
diagrams and modules and proves the isometry theorem; everything later reaches stability through
it. Layer 3 turns filtered spaces into modules and derives sublevel stability. Layer 4 specializes
to finite simplicial complexes, where everything is computable. Layer 5 is metric geometry of
distance functions, independent of homology except for the offset modules. Layer 6 builds the
complexes on point clouds and connects them with offsets through the nerve lemma. Layer 7 combines
Layers 5 and 6 into inference theorems. Layer 8 is statistics: the distance to a measure, landscape
limit theorems and sampling rates.

Each section states targets, gives locators (printed pages) and a proof route, and ends with a
*Needs:* line. Numbers like 2.3 refer to sections of this roadmap.

## Layer 1: persistence modules, intervals and diagrams

### 1.1 Modules, ranks and tameness

- `PersistenceModule 𝕜`: a functor `ℝ ⥤ ModuleCat 𝕜` (Chazal–de Silva–Glisse–Oudot, §2.1,
  p. 17).
- `IsPFD V`: every `V_t` is finite-dimensional.
- `rankInv V s t`: the rank of `V_s → V_t` in `ℕ∞` for `s ≤ t`, and `0` otherwise.
- `IsQTame V`: `rankInv V s t < ⊤` whenever `s < t` (Chazal–de Silva–Glisse–Oudot, §2.1, p. 17).
- Every pointwise finite-dimensional module is `q`-tame; ranks are monotone:
  `rankInv V s' t' ≤ rankInv V s t` for `s' ≤ s ≤ t ≤ t'`, since the long map factors through the
  short one.

*Needs:* Mathlib `Module.rank`, `Cardinal.toENat`, `Preorder.smallCategory`.

### 1.2 Interval modules and decompositions

- `intervalModule 𝕜 I hI` for an order-connected `I ⊆ ℝ`: the space at `t` is `𝕜` (functions on a
  one-point type) when `t ∈ I` and `0` otherwise, with identity maps inside `I`.
  Order-connectedness is what makes it a functor: if
  `s, u ∈ I` and `s ≤ t ≤ u` then `t ∈ I`.
- `IntervalDecomposition V`: an index type, nonempty order-connected sets `I j` and an isomorphism
  of `V` with the coproduct of the `intervalModule 𝕜 (I j)`. The coproduct is the colimit in the
  functor category, computed pointwise.
- **The rank invariant counts intervals** (`rankInv_eq_encard_of_decomposition`): for every
  decomposition and `s ≤ t`, `rankInv V s t` is the number of `j` with `s, t ∈ I j`.
  *Route.* Ranks are additive over coproducts of modules (the map on a coproduct is the coproduct
  of the maps and the range of a direct sum of maps is the direct sum of the ranges); the rank of
  `intervalModule 𝕜 I` at `(s, t)` is `1` when both lie in `I` and `0` otherwise.
- In particular, for a finite simplicial filtration with half-open bars `[b, d)`, the persistent
  Betti number `β(s, t)` counts the bars with `b ≤ s` and `t < d`, and `β(t, t)` counts the bars
  alive at `t`.

*Needs:* 1.1; Mathlib coproducts in `ModuleCat` and in functor categories.

### 1.3 Existence and uniqueness of decompositions

- `IsFiniteType V`: `V` is pointwise finite-dimensional and there is a finite set `A` of reals
  such that `V_s → V_t` is an isomorphism whenever `(s, t]` contains no point of `A`.
- **Decomposition of modules of finite type** (`exists_intervalDecomposition_of_isFiniteType`):
  such a module has an interval decomposition with finitely many summands, each of the form
  `[a, a')`, `[a, ∞)`, `(-∞, a')` or `ℝ` with `a, a' ∈ A`
  (Oudot, Thm 1.9, p. 20, via Gabriel's theorem, Thm 1.2, p. 17).
  *Route.* Let `a₁ < … < a_k` be the points of `A`; choose `t₀ < a₁` and evaluate `V` at
  `t₀, a₁, …, a_k`. This is a finite-dimensional representation of the equioriented quiver of type
  `A_{k+1}`, so by `TauCeti.gabrielIndecomposableEquivPositiveRoot` (the QuiverRepresentations
  roadmap, §5.1) and Krull–Schmidt it is a finite direct sum of interval representations. Each
  interval representation on the grid extends to an interval module on `ℝ`, the cell
  `[a_i, a_{i+1})`
  carrying the value at `a_i`, and the extension of the grid decomposition is a decomposition of
  `V` because both sides are constant on each cell.
- **Crawley-Boevey's theorem** (`exists_intervalDecomposition_of_isPFD`): every pointwise
  finite-dimensional module has an interval decomposition (Oudot, Thm 1.6, p. 19;
  Chazal–de Silva–Glisse–Oudot, Thm 2.8, p. 22).
  *Route* (Crawley-Boevey, *Decomposition of pointwise finite-dimensional persistence modules*,
  2015). For each cut `c` of `ℝ` (a partition into a lower and an upper set) and `t` in its lower
  part, form the images `Im⁻_{c,t}` and `Im⁺_{c,t}` of the maps from below `c` and the kernels
  `Ker^±_{c,t}` of the maps beyond it; the subquotient functor attached to a pair of cuts
  `(c, c')` is finite-dimensional at each `t`. Choose complements of these subquotients
  compatibly with the structure maps, by the descending-chain argument on finite-dimensional
  spaces (pointwise finiteness gives the stabilization), and show that the resulting submodules
  are interval modules on the interval `(c, c')` and that their sum is direct and exhausts `V`.
  The construction is entirely within the linear algebra of `ModuleCat 𝕜`.
- **Uniqueness of the barcode** (`IntervalDecomposition.exists_equiv`): two decompositions of a
  pointwise finite-dimensional module are matched by a bijection of the index types preserving the
  intervals (Chazal–de Silva–Glisse–Oudot, Thm 2.7, p. 22, Krull–Remak–Schmidt–Azumaya).
  *Route.* An interval `I` is determined by its endpoints and their decorations. Its
  multiplicity in a decomposition is recovered from the rank invariant by 1.2: for real endpoints
  `b < d`, the number of summands equal to `I` is a finite alternating sum of ranks at points
  approaching `b` and `d` from the side prescribed by the decoration, and is finite because
  `V_t` is finite-dimensional for a point `t` of `I`. Since the counts depend on `V` only, they
  agree for the two decompositions, and a bijection is assembled interval by interval. Tau Ceti's
  `TauCeti.exists_equiv_linearEquiv_of_isLocalRing_end` covers the finite case directly; the count
  argument handles arbitrary index types.

*Needs:* 1.2; Tau Ceti `TauCeti.gabrielIndecomposableEquivPositiveRoot`,
`TauCeti.exists_equiv_linearEquiv_of_isLocalRing_end`.

### 1.4 Diagrams

- `OffDiag`: the pairs `(b, d)` of `EReal × EReal` with `b < d`; `Diagram`: a function
  `OffDiag → ℕ∞`; `Diagram.Pt D`: the points with multiplicity, pairs `(x, k)` with `k < D x`.
- `lowerEnd I` and `upperEnd I`: the infimum and supremum of `I` in `EReal`.
- `rankE V s t`: the rank invariant at extended arguments, the infimum over real arguments equal to
  `s` and `t`, or arbitrary when `s = ⊥` or `t = ⊤`.
- `rankDiagram V`: the multiplicity of `(p, q)` is the infimum, over rectangles `[a, b] × [c, d]`
  with `a < p < b < c < q < d` (with `a = p = ⊥` or `d = q = ⊤` allowed), of the rectangle measure
  `r(b, c) - r(a, c) - r(b, d) + r(a, d)` (Chazal–de Silva–Glisse–Oudot, Def 3.3, p. 33; Oudot,
  Thm 1.13, p. 25). For `q`-tame modules the four ranks are finite because `b < c`, and the
  rectangle measure is a nonnegative count, so the truncated subtraction of `ℕ∞` is exact.
- **The diagram of a decomposition** (`rankDiagram_eq_encard_of_decomposition`): for a
  pointwise finite-dimensional module and any decomposition, the multiplicity of `(p, q)` is the
  number of intervals with `lowerEnd = p` and `upperEnd = q`.
  *Route.* By 1.2 the rectangle measure counts the intervals with lower endpoint in the closed
  window around `p` and upper endpoint in the window around `q`; shrinking the windows isolates
  the endpoints, and decorations do not matter because the windows are open at `p` and `q`.

*Needs:* 1.2, 1.3.

**Checks.**

- `rankInv`: for `intervalModule 𝕜 (Set.Ico 0 1)`, `rankInv` at `(0, 1/2)` is `1` and at
  `(0, 1)` is `0`; at `(1/2, 0)` it is `0` by the convention for `t < s`.
- `rankInv`: the constant module `𝕜^ℕ` (countable dimension, identity maps) has
  `rankInv = ⊤` at every `s ≤ t`, so it is not `q`-tame; a definition with Mathlib's `finrank`
  would give the junk value `0` and declare it tame.
- `IsQTame`: the module with `V_t = 𝕜^ℕ` for every `t` and zero maps between distinct indices is
  `q`-tame but not pointwise finite-dimensional, so the converse of the first bullet of 1.1 fails.
- `IsPFD`: every interval module is pointwise finite-dimensional, and so is every finite coproduct
  of interval modules.
- `intervalModule`: for the set `I = {0, 2}`, which is not order-connected, the maps
  `V_0 → V_1 → V_2` would compose to `0` while `V_0 → V_2` is the identity, so no functor exists;
  order-connectedness is a hypothesis of the definition.
- `IsFiniteType`: the sublevel module of `x ↦ x` on `ℝ` in degree `0` has `A = ∅` after
  `t ↦ {x ≤ t}`: every `V_t ≅ 𝕜` and every map is an isomorphism, with decomposition the single
  interval `ℝ`.
- `IsFiniteType`: the interval module of `(0, 1)` is not of finite type: for every finite `A`
  choose `t ∈ (0, 1)` below the positive points of `A`; then `(0, t]` avoids `A` while
  `V_0 = 0 → V_t = 𝕜` is not an isomorphism. Intervals open on the left are reached only by
  Crawley-Boevey's theorem.
- `rankDiagram`: for `intervalModule 𝕜 (Set.Ico 0 1)` the multiplicity is `1` at `(0, 1)` and
  `0` elsewhere; for `intervalModule 𝕜 (Set.Icc 0 1)` it is also `1` at `(0, 1)`: the diagram
  forgets decorations.
- `rankDiagram`: for `intervalModule 𝕜 (Set.Ici 0)` the multiplicity is `1` at `(0, ⊤)`; the
  rectangle with `d = ⊤` uses `rankE V a ⊤`, the limit `0` of the ranks for `a < 0`.
- `rankDiagram`: a singleton interval `{0}` contributes nothing: the rectangles need `b < c`, and
  the module of `{0}` has `rankInv = 0` at every `s < t`.
- `Diagram.Pt`: a diagram with multiplicity `⊤` at one point has countably many points there,
  so infinite multiplicities are matched point by point.

- `PersistenceModule`: the constant functor with value `𝕜` and identity maps is the interval
  module of `ℝ`; the zero functor has every rank `0`.
- `PersistenceModule`: the family `V_t = 𝕜` with `V_s → V_t` multiplication by `t - s + 1` is not
  a functor, since `(u - t + 1)(t - s + 1) ≠ u - s + 1` for `s < t < u`.
- `IsPFD`: the coproduct of the interval modules of `[n, n + 1)`, `n ∈ ℕ`, is pointwise
  finite-dimensional with infinitely many summands; the coproduct of countably many copies of
  `[0, 1)` is not, its space at `0` having countable dimension.
- `rankInv`: for `intervalModule 𝕜 (Set.Ico 0 1)` and `s = t = 0`, `rankInv = 1` (the identity).
- `IsQTame`: the coproduct of countably many copies of the interval module of `[0, 1)` is not
  `q`-tame: `rankInv = ⊤` at `(0, 1/2)`.
- `IsQTame`: every pointwise finite-dimensional module is `q`-tame (1.1), for instance every
  interval module.
- `intervalModule`: for `I = ∅` it is the zero module, and for `I = Set.univ` it is the constant
  module `𝕜`.
- `intervalModule`: for `I = Set.Ico 0 1` the map `V_0 → V_1` is `0` and `V_0 → V_{1/2}` is the
  identity of `𝕜`.
- `IntervalDecomposition`: the zero module has the decomposition with empty index type.
- `IntervalDecomposition`: `intervalModule 𝕜 (Set.Ico 0 1)` has a one-summand decomposition and
  none with two summands, since `rankInv` at `(0, 0)` is `1`.
- `IntervalDecomposition`: the field `nonempty` excludes empty summands; without it any number of
  zero summands could be added and the bijection of 1.3 would fail.
- `IsFiniteType`: a finite coproduct of interval modules of the form `[a, a')` is of finite type,
  with `A` the set of endpoints.
- `lowerEnd`: `lowerEnd (Set.Ico 0 1) = 0` and `lowerEnd (Set.Iic 0) = ⊥`.
- `upperEnd`: `upperEnd (Set.Ico 0 1) = 1` and `upperEnd (Set.Ici 0) = ⊤`.
- `lowerEnd`: `lowerEnd ∅ = ⊤` and `upperEnd ∅ = ⊥`, junk values that the field `nonempty` of
  `IntervalDecomposition` keeps out of every diagram.
- `OffDiag`: `(0, 0)` is not a point, so bars of length `0` never appear.
- `OffDiag`: `(⊥, ⊤)` is a point, the endpoints of the interval `ℝ`.
- `OffDiag`: `(⊤, ⊤)` is not a point, so no class is born at `+∞`.
- `Diagram`: the zero function is the empty diagram; the diagram of the zero module is zero.
- `Diagram`: multiplicities take values in `ℕ∞` so that `rankDiagram` is defined for every
  module; for `q`-tame modules they are finite off the diagonal.
- `Diagram`: a function with `D (0, 1) = 2` is the diagram of two copies of `[0, 1)`.
- `Diagram.Pt`: the zero diagram has no points, and multiplicity `2` at `(0, 1)` gives the two
  points `((0, 1), 0)` and `((0, 1), 1)`.
- `rankE`: for `intervalModule 𝕜 (Set.Ici 0)`, `rankE V 0 ⊤ = 1`; for the module of
  `Set.Ico 0 1`, `rankE V 0 ⊤ = 0`.
- `rankE`: for `intervalModule 𝕜 (Set.Iic 0)`, `rankE V ⊥ 0 = 1`; without the condition
  `s' ≤ t'` the infimum would include `rankInv` at `s' > t'`, the value `0`.
- `rankE`: at real arguments `s ≤ t` it equals `rankInv V s t`.

### Examples

- For the lower-star filtration of `x ↦ |x|` on the path `-1 — 0 — 1`, the degree-zero module is
  the interval module of `[0, ∞)`, and the degree-one module is `0`.
- For the sublevel filtration of the height function on a circle standing on a point, at heights
  `0` (minimum) and `2` (maximum), degree zero is `[0, ∞)` and degree one is `[2, ∞)`.

### Dependencies

1.1 → 1.2 → 1.3 → 1.4. Tau Ceti's Gabriel classification and Krull–Schmidt enter in 1.3.

## Layer 2: distances between diagrams and between modules

### 2.1 Matchings and the bottleneck distance

- `eRealDist`, `pointDist`, `diagDist`: see Conventions.
- `Matching D E`: a partial bijection between `Diagram.Pt D` and `Diagram.Pt E`.
- `Matching.cost`: the maximum of the matched distances and of the distances of unmatched points
  to the diagonal; `bottleneckDist D E`: the infimum of the costs
  (Edelsbrunner–Harer, p. 216).
- **Triangle inequality** (`bottleneckDist_triangle`).
  *Route.* Compose matchings: a point matched in both steps is matched to its image, a point
  matched only in the first step is sent to the diagonal at cost at most the sum by the triangle
  inequality `diagDist x ≤ pointDist x y + diagDist y`, and symmetrically. The case analysis on
  infinite coordinates is handled by `eRealDist`, which is a metric on `EReal` with values in
  `ℝ≥0∞`.

*Needs:* 1.4.

### 2.2 Wasserstein distances between diagrams

- `Matching.qCost M q`: `(Σ matched pointDist^q + Σ unmatched diagDist^q)^(1/q)`, sums in `ℝ≥0∞`;
  `wassersteinDist q D E`: the infimum (Dey–Wang, Def 3.10, p. 75; Oudot, p. 63).
- **Comparison** (`bottleneckDist_le_wassersteinDist`): for `1 ≤ q`, `d_B ≤ W_q`, since each term
  is at most the `ℓ^q` norm.
- **Triangle inequality** (`wassersteinDist_triangle`): for `1 ≤ q`, by composing matchings as in
  2.1 and Minkowski's inequality in `ℓ^q`.

*Needs:* 2.1; Mathlib `ENNReal.Lp_add_le` for the Minkowski step.

### 2.3 Interleavings and the isometry theorem

- `IsInterleaved V W ε`: families of maps `φ_t : V_t → W_{t+ε}`, `ψ_t : W_t → V_{t+ε}` natural in
  `t` with both composites equal to the structure maps over `[t, t + 2ε]`
  (Oudot, Def 3.3, p. 52).
- `interleavingDist V W`: the infimum of the `ε` with an interleaving, `⊤` if none.
- The interleaving distance satisfies the triangle inequality, by composing interleavings
  (Chazal–de Silva–Glisse–Oudot, Prop 5.3, p. 82); it is `0` between `intervalModule (Ico 0 1)`
  and `intervalModule (Icc 0 1)`, which are not isomorphic.
- **The isometry theorem** (`interleavingDist_eq_bottleneckDist`): for `q`-tame `V` and `W`,
  `interleavingDist V W = bottleneckDist (rankDiagram V) (rankDiagram W)`
  (Chazal–de Silva–Glisse–Oudot, Thm 5.14, p. 91; Oudot, Thm 3.1, p. 49).
  *Route, `d_I ≤ d_B`.* For decomposable modules (Chazal–de Silva–Glisse–Oudot, Thm 5.11, p. 87):
  a matching of cost `ε` gives interleavings of matched interval modules (two intervals whose
  endpoints differ by at most `ε` are `ε`-interleaved by identities where defined) and of
  unmatched ones with `0` (an interval of half-length at most `ε` is `ε`-interleaved with `0`);
  coproducts of interleavings are interleavings. For `q`-tame modules, approximate: for every
  `δ > 0` the module `V` is `δ`-interleaved with the pointwise finite-dimensional module of its
  images `Im(V_{t-δ} → V_t)`, which decomposes by 1.3 and has diagram within `δ` of that of `V`.
  *Route, `d_B ≤ d_I`.* The induced-matching argument (Bauer–Lesnick, *Induced matchings and the
  algebraic stability of persistence barcodes*, 2015) for pointwise finite-dimensional modules: an
  `ε`-interleaving `φ` factors as a surjection followed by an injection through its image, and
  surjections and injections induce explicit matchings of barcodes moving each endpoint by at most
  `ε`, leaving unmatched only bars of length at most `2ε`. The `q`-tame case follows by the same
  `δ`-approximation as above and the triangle inequalities.

*Needs:* 1.3, 1.4, 2.1.

### 2.4 Persistence beyond the error scale

- **Attainment and long bars** (`exists_matching_of_bottleneckDist_le`): if `D` and `E` have
  finitely many points and `bottleneckDist D E ≤ η`, there is a matching of cost at most `η`, and
  under it every point of either diagram whose distance to the diagonal exceeds `η` (bar length
  greater than `2η`) is matched. Matched points differ by at most `η` in each coordinate.
  *Route.* There are finitely many partial matchings, so the infimum is attained; a point with
  `η < diagDist` left unmatched would make the cost exceed `η`.
- On the event of a confidence band of radius `r_n` (3.3), every bar of the estimated diagram
  longer than `2 r_n` corresponds to a bar of the true diagram with both endpoints within `r_n`.

*Needs:* 2.1.

**Checks.**

- `bottleneckDist`: for `D = {(0, 2)}` and `E = {(0, 3)}` the distance is `1`, by matching the two
  points (computed in `checks.py`).
- `bottleneckDist`: for `D = {(0, 2)}` and `E = {(5, 7)}` it is `1`, by sending both to the
  diagonal; the matched cost would be `5`. A definition without the diagonal would give `5`.
- `bottleneckDist`: `{(0, 2)}` against the empty diagram is `1 = (2 - 0)/2`; a convention measuring
  the distance to the diagonal by `d - b` instead of `(d - b)/2` would give `2`.
- `bottleneckDist`: `{(0, ⊤)}` against `{(1, ⊤)}` is `1`, and against the empty diagram is `⊤`:
  essential classes are never matched to the diagonal.
- `wassersteinDist`: for `D = {(0, 2), (0, 4)}` and `E = ∅`, `W_1 = 1 + 2 = 3` while `d_B = 2`.
- `wassersteinDist`: for `D = {(0, 2), (0, 4)}` and `E = ∅`, `W_2 = √(1 + 4) = √5`, and for
  `D = {(0, 2)}`, `E = {(0, 3)}`, `W_q = 1` for every `q ≥ 1`.
- `IsInterleaved`: `intervalModule (Ico 0 1)` and `0` are `ε`-interleaved exactly for `ε ≥ 1/2`;
  for `ε < 1/2` the composite `V_t → V_{t+2ε}` at `t = 0` is nonzero but factors through `0`.
- `interleavingDist`: between `intervalModule (Ico 0 2)` and `intervalModule (Ico 0 3)` it is `1`,
  equal to the bottleneck distance of their diagrams.
- `interleavingDist`: between `intervalModule (Ici 0)` and `0` it is `⊤`.

- `eRealDist`: `eRealDist 0 1 = 1` and `eRealDist ⊤ ⊤ = 0`.
- `eRealDist`: `eRealDist ⊤ 5 = ⊤`; through `EReal.toReal`, whose value at `⊤` is the junk `0`, it
  would be `5`.
- `eRealDist`: it satisfies the triangle inequality, including `eRealDist ⊥ ⊤ = ⊤`.
- `pointDist`: `pointDist (0, 2) (1, 4) = 2`; the Euclidean distance would be `√5`.
- `pointDist`: `pointDist (0, ⊤) (1, ⊤) = 1`.
- `pointDist`: `pointDist (0, ⊤) (0, 5) = ⊤`.
- `diagDist`: `diagDist (0, 2) = 1`.
- `diagDist`: `diagDist (0, ⊤) = ⊤` and `diagDist (⊥, 0) = ⊤`; through `toReal` they would be the
  junk values `0` and `0`.
- `diagDist`: `diagDist x ≤ pointDist x y + diagDist y`, used in 2.1; for `x = (0, 2)`,
  `y = (0, 3)`, `1 ≤ 1 + 3/2`.
- `Matching`: the empty matching exists between any two diagrams, so `bottleneckDist` is an
  infimum over a nonempty set.
- `Matching`: between `{(0, 2)}` and `{(0, 3)}` there are exactly two matchings.
- `Matching`: a matching needs no condition on matched points; a point at `(0, ⊤)` matched with
  `(0, 5)` has cost `⊤`.
- `Matching.cost`: between `{(0, 2)}` and `{(0, 3)}` the empty matching costs `3/2` and the full
  one costs `1`.
- `Matching.cost`: between two empty diagrams the empty matching costs `0`, the supremum over an
  empty family in `ℝ≥0∞`.
- `Matching.cost`: matching `(0, 2)` with `(5, 7)` costs `5`, more than sending both to the
  diagonal.
- `Matching.qCost`: between `{(0, 2)}` and `{(0, 3)}` with `q = 1` the empty matching costs
  `1 + 3/2 = 5/2`, and the full one `1`.
- `Matching.qCost`: with `q = 2` the empty matching costs `√(1 + 9/4) = √13/2`.
- `Matching.qCost`: with `q = 2` it is not the bottleneck cost: for two unmatched points
  `(0, 2)`, `(0, 2)` it is `√2`, the bottleneck cost `1`.
- `IsInterleaved`: every module is `0`-interleaved with itself by identities, and two modules are
  `0`-interleaved iff they are isomorphic.
- `interleavingDist`: it is `0` between the interval modules of `Set.Ico 0 1` and `Set.Icc 0 1`,
  which are not isomorphic, so it is a pseudometric only.

### Examples

- Two diagrams with the same essential classes and finite points perturbed by at most `η` are at
  bottleneck distance at most `η`, whatever the multiplicities of short bars.

### Dependencies

2.1 → 2.2; 2.1 → 2.3 (with Layer 1); 2.1 → 2.4.

## Layer 3: sublevel persistence of functions on spaces

### 3.1 Filtered spaces and their homology

- `setFunctor X`: subsets of `X` under inclusion, as a functor to `TopCat`.
- `setFiltrationModule 𝕜 X F hF p`: the composite of `Monotone.functor` for a monotone family
  `F : ℝ → Set X`, `setFunctor X` and degree-`p` singular homology with coefficients `𝕜`.
- `sublevelModule 𝕜 X f p`: the module `t ↦ H_p({f ≤ t})`; `offsetModule 𝕜 A p`: the sublevel module
  of `x ↦ infDist x A`.
- `IsHomCriticalValue X f a`: for every `ε > 0` some degree `p` has
  `H_p({f ≤ a - ε}) → H_p({f ≤ a + ε})` not an isomorphism (Edelsbrunner–Harer, p. 192).
- `IsTameFunction 𝕜 X f`: finitely many homological critical values and pointwise
  finite-dimensional sublevel modules in every degree (Edelsbrunner–Harer, p. 219).
- Sublevel modules of continuous functions on compact polyhedra are `q`-tame
  (Chazal–de Silva–Glisse–Oudot, Thm 3.33, p. 52; Oudot, Prop 2.3, p. 32), by factoring
  `H(X_s) → H(X_t)` through the homology of a finite subcomplex of a fine subdivision.

*Needs:* Mathlib `singularHomologyFunctor`, `Monotone.functor`; Tau Ceti
`TauCeti.sublevelInclusion`.

### 3.2 Stability of sublevel persistence

- **Sublevel interleaving** (`isInterleaved_sublevelModule`): if `|f - g| ≤ δ` pointwise, the
  inclusions `{f ≤ t} ⊆ {g ≤ t + δ} ⊆ {f ≤ t + 2δ}` give a `δ`-interleaving
  (Chazal–de Silva–Glisse–Oudot, Example 4.3, p. 69). Functoriality of homology gives the four
  identities of `IsInterleaved`.
- **Bottleneck stability for tame functions** (`bottleneckDist_sublevelModule_le`): for tame `f`,
  `g` with `|f - g| ≤ δ`, the diagrams in every degree are within `δ`
  (Edelsbrunner–Harer, Stability Theorem for Tame Functions, p. 219; Oudot, Cor 3.6, p. 61).
  *Route.* Tame implies pointwise finite-dimensional implies `q`-tame (1.1); combine the sublevel
  interleaving with the isometry theorem (2.3). Edelsbrunner–Harer assume a triangulable space;
  the route through the isometry theorem needs no triangulation.

*Needs:* 2.3, 3.1.

### 3.3 Confidence sets for diagrams

- **Coverage from a uniform band** (`measure_bottleneckDist_le`): for tame `f` and random tame
  `f̂`, the probability that `|f̂ - f| ≤ r` everywhere is at most the probability that the diagrams
  are within `r` in bottleneck distance, in every degree. Hence if the band has coverage
  `1 - α`, the bottleneck ball of radius `r` about the diagram of `f̂` covers the diagram of `f`
  with probability at least `1 - α`. Both events are measured by the outer measure.
  *Route.* Inclusion of events by 3.2, and monotonicity of the measure.
- With 2.4: on that event every bar of the estimated diagram longer than `2r` is a genuine feature.

*Needs:* 3.2.

### 3.4 Sublevel persistence of a Morse function

Target, stated in prose (no Lean name): let `M` be a closed smooth manifold, `f` a Morse function
with distinct critical values, `c_q` its number of critical points of index `q`, and use field
coefficients.

- Every finite endpoint of every bar of the sublevel diagrams of `f` is a critical value, and each
  critical point is an endpoint of exactly one bar: passing a critical value of index `q` either
  creates a degree-`q` bar or ends a degree-`(q - 1)` bar.
- `c_q` is the number of degree-`q` bars plus the number of finite degree-`(q - 1)` bars, and
  exactly `β_q(M)` degree-`q` bars are infinite.
- Hence `c_q - β_q(M)` is the number of finite bars of degree `q` plus those of degree `q - 1`,
  which recovers the polynomial form of the strong Morse inequalities with the coefficient of
  `t^q` in `Q` equal to the number of finite degree-`q` bars (compare the MorseTheory roadmap,
  §4.1).

*Route.* Between critical values the sublevel sets are homotopy equivalent
(`TauCeti.exists_sublevelHomotopyEquiv`), so the module is of finite type (1.3) with critical
values as `A`, and every endpoint is a critical value. Across a critical value of index `q`, the
relative CW model `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation` attaches one
`q`-cell, so the relative homology of the pair is `𝕜` in degree `q` and `0` elsewhere; the long
exact sequence of the pair shows that exactly one of `β_q` rising or `β_{q-1}` falling occurs, and
1.2 converts these jumps into bar endpoints. The infinite bars are counted by `H(M)` since the
top sublevel set is `M`. (Edelsbrunner–Harer, p. 159, for the Morse inequalities.)

*Needs:* 1.2, 1.3; MorseTheory, Layer 2 and §4.1.

**Checks.**

- `sublevelModule`: for `f = 0` on a one-point space, degree `0` is the interval module of
  `[0, ∞)`; for `t < 0` the sublevel set is empty and its homology is `0`.
- `sublevelModule`: for `f(x) = x²` on `ℝ`, degree `0` is `[0, ∞)`; for `f(x) = (x² - 1)²` it is
  `[0, ∞) ⊕ [0, 1)`, the second component dying at the local maximum value `1`.
- `offsetModule`: for `A = {0, 2}` in `ℝ`, degree `0` is `[0, ∞) ⊕ [0, 1)`: the offsets of radius
  `r` meet at `r = 1`.
- `offsetModule`: for `A = ∅` the junk `infDist x ∅ = 0` makes every offset of radius `r ≥ 0` the
  whole space; theorems on offsets assume `A` nonempty, and the convention would otherwise make
  the empty set look like `ℝ^D`.
- `IsHomCriticalValue`: for `f(x) = x²` on `ℝ`, `0` is critical (the sublevel set changes from
  empty to a point) and no other value is.
- `IsTameFunction`: `f(x) = x sin(1/x)` (with `f(0) = 0`) on `[-1, 1]` has infinitely many
  homological critical values, so it is not tame, while its sublevel modules are `q`-tame by
  Thm 3.33 of Chazal–de Silva–Glisse–Oudot; the stability of 3.2 for it comes from the `q`-tame
  route of Oudot, Cor 3.6.
- `IsTameFunction`: the constant function `0` on an infinite discrete space has `H_0` of infinite
  dimension at `t = 0`, so it is not tame although it has a single critical value.

- `setFunctor`: the inclusion of `∅` into any subset is the unique map from the empty space.
- `setFiltrationModule`: for the constant family `F t = X` it is the constant module of
  `H_p(X)`, and for `F t = ∅` it is `0`.
- `setFiltrationModule`: a non-monotone family, `F t = {t}` in `ℝ`, gives no functor, since there
  is no inclusion `{0} ⊆ {1}`; monotonicity is an argument.
- `sublevelModule`: the modules of `f` and `f + c` differ by the shift `t ↦ t + c`.
- `offsetModule`: for `A = {0}` in `ℝ`, degree `0` is the interval module of `[0, ∞)` and degree
  `1` is `0`.
- `IsHomCriticalValue`: for `f = 0` on a point, `0` is critical (empty to a point) and no other
  value is.
- `IsHomCriticalValue`: for `f(x) = x` on `[0, 1]`, `0` is critical and `1` is not, since the
  sublevel set at every level `t ≥ 0` is the contractible interval `[0, min(t, 1)]`.
- `IsTameFunction`: `x ↦ x²` on `[-1, 1]` is tame, with single critical value `0`.

### Examples

- The height function of a torus standing upright has critical values `0 < 1 < 3 < 4` with
  indices `0, 1, 1, 2`; its diagrams are `{(0, ⊤)}` in degree `0`, `{(1, ⊤), (3, ⊤)}` in degree
  `1` and `{(4, ⊤)}` in degree `2`, and `c_q = β_q` for every `q`.

### Dependencies

3.1 → 3.2 → 3.3; 3.1 → 3.4 (with 1.3 and MorseTheory).

## Layer 4: simplicial filtrations and the persistence algorithm

### 4.1 Simplicial filtrations

- `fullComplex ι`: the full simplex on `ι` (every nonempty finset is a face).
- `facePoints L`: the points of the realization of `fullComplex ι` lying in a closed face of `L`,
  that is the realization of `L` inside that of the full simplex.
- `complexFiltrationModule 𝕜 L hL p`: degree-`p` homology of `t ↦ facePoints (L t)` for a monotone
  family of complexes.
- `IsMonotoneOn K f`: faces never exceed their cofaces; `sublevelComplex K f hf t`: the faces with
  `f σ ≤ t`; `simplicialModule 𝕜 K f hf p`: its homology (Dey–Wang, Defs 3.1 and 3.3, pp. 64
  and 67).
- **Naturality of the comparison** (target, prose): for a subcomplex `L ≤ K` (both abstract
  complexes on a linearly ordered vertex type), Tau Ceti's
  `TauCeti.orderedSimplicialHomologyIsoSingularHomology` commutes with the map of ordered chain
  complexes
  induced by the inclusion of faces and the map of singular homology induced by the closed
  embedding of realizations. *Route.* Both maps are induced by the cellular chain map of the
  inclusion of CW complexes, through which Tau Ceti's comparison is built
  (`TauCeti.cellularChainComplexRealizationIso` and its scaling are compatible with restriction to
  subcomplexes). Consequently `simplicialModule` is naturally isomorphic, in each degree and over
  each `t` at which the sublevel complex contains every vertex, to ordered simplicial homology of
  the sublevel complexes; at other `t` one passes to the vertex subtype.

*Needs:* 3.1; Tau Ceti `TauCeti.orderedSimplicialChainComplex`,
`AbstractSimplicialComplex.Realization`.

### 4.2 Euler–Poincaré and positive and negative simplices

- `eulerChar K`: `Σ_{σ ∈ K} (-1)^{dim σ}`, written with `σ.card + 1` as exponent; `betti 𝕜 K p`: the
  dimension of degree-`p` homology of the ordered chain complex.
- **The Euler–Poincaré formula** (`eulerChar_eq_sum_betti`): for a finite complex with faces of
  at most `N` vertices, `eulerChar K = Σ_{p < N} (-1)^p β_p` over any field (Edelsbrunner–Harer,
  Euler–Poincaré Theorem, §IV.2, p. 101).
  *Route.* `ChainComplex.eulerChar_eq_homologyEulerChar` applied to
  `TauCeti.orderedSimplicialChainComplex K 𝕜`, whose degree-`p` term is free on the `p`-faces.
- Individual Betti numbers depend on the field while `χ` does not: the six-vertex real projective
  plane has `β = (1, 0, 0)` over `ℚ` and over `𝔽₃`, and `β = (1, 1, 1)` over `𝔽₂`, both with
  alternating sum `1 = 6 - 15 + 10` (computed in `checks.py`).
- **Positive and negative simplices** (`betti_insert_face`): adding a `(p + 1)`-simplex whose
  faces are present either raises `β_{p+1}` by one or lowers `β_p` by one and changes no other Betti
  number (Edelsbrunner–Harer, §VII.1, p. 183, positive and negative simplices).
  *Route.* The chain complexes differ by one basis vector in degree `p + 1`; the boundary of the
  new simplex is a `p`-cycle, which is either a boundary in `K` (then a new `(p+1)`-cycle appears)
  or not (then the class of the boundary dies). Rank–nullity in degrees `p` and `p + 1`.

*Needs:* 4.1; Tau Ceti `ChainComplex.eulerChar_eq_homologyEulerChar`.

### 4.3 The persistence algorithm

- `boundaryMatrix 𝕜 σ` for an enumeration `σ : Fin m → Finset ι` of faces: entry `(i, j)` is
  `(-1)^k` when `σ i` is `σ j` with its `k`-th vertex (in increasing order) deleted, and `0`
  otherwise. Over `𝔽₂` it is the boundary matrix of Edelsbrunner–Harer, §IV.2, p. 102.
- `low R j`: the largest row with a nonzero entry in column `j`, `⊥` for a zero column;
  `IsReduced R`: distinct nonzero columns have distinct lows; `cornerRank D i j`: the rank of the
  block of rows `≥ i` and columns `< j`.
- **The pairing lemma** (`low_eq_iff_cornerRank`): for any square matrix `D` over a field and any
  factorization `R = D V` with `R` reduced and `V` upper triangular with nonzero diagonal,
  `low R j = i` if and only if
  `r(i, j+1) - r(i+1, j+1) + r(i+1, j) - r(i, j) = 1`, with `r = cornerRank D`
  (Edelsbrunner–Harer, Pairing Lemma, §VII.1, p. 183; Dey–Wang, Prop 3.5, p. 82).
  *Route.* Right multiplication by an invertible upper triangular matrix preserves every
  `cornerRank` (column operations within the first `j` columns), so the alternating sum is the same
  for `D` and `R`. For a reduced matrix the nonzero columns among the first `j` have distinct lows,
  and the rank of the block of rows `≥ i` is the number of those lows that are `≥ i`; the
  alternating sum is `1` exactly when column `j` has low `i`.
- **Independence of the reduction** (corollary, prose): the pairs `(low R j, j)` and the zero
  columns are the same for every such factorization, since the pairing lemma expresses them in
  terms of `D` only.
- **Correctness of the algorithm** (`rankInv_simplicialModule_eq_card`): let `σ` enumerate the
  faces of a finite complex `K` with `f(σ i)` nondecreasing in `i` and faces before cofaces, and
  `R = D V` a reduction of `D = boundaryMatrix 𝕜 σ`. Then for `s ≤ t`, the rank of
  `H_p(K_s) → H_p(K_t)` is the number of `i` with `σ i` a `p`-simplex, column `i` of `R` zero,
  `f(σ i) ≤ s`, and every `j` with `low R j = i` having `f(σ j) > t`
  (Edelsbrunner–Harer, §VII.1, p. 184; Dey–Wang, Thm 3.6, p. 82).
  *Route.* The columns of `V` with `R`-column zero form a basis of cycles adapted to the
  filtration; the nonzero columns of `R` form a basis of boundaries, the column `j` entering at
  `f(σ j)` with lowest simplex `σ (low R j)`. A cycle with lowest simplex `σ i` is born at
  `f(σ i)` and is a boundary in `K_t` exactly when some `j` with `low R j = i` has `f(σ j) ≤ t`.
  The persistent homology rank counts the cycles of `K_s` independent modulo boundaries of `K_t`;
  the adapted bases make this a count. Finally 4.1 identifies the simplicial and singular ranks.
- Consequently the bars of degree `p` are the intervals `[f(σ i), f(σ j))` for `low R j = i` and
  `[f(σ i), ∞)` for unpaired positive `i`, bars of length `0` discarded. Standard column reduction
  uses `O(m³)` field operations (Edelsbrunner–Harer, §IV.2, p. 105).

*Needs:* 1.2, 4.1, 4.2; Mathlib `Matrix.rank`, `Matrix.BlockTriangular`.

### 4.4 Stability of simplicial filtrations

- **Bottleneck stability** (`bottleneckDist_simplicialModule_le`): for monotone `f`, `g` on a
  finite complex, the diagrams are within `max_σ |f σ - g σ|`
  (Edelsbrunner–Harer, Stability Theorem for Filtrations, §VIII.2, p. 218; Dey–Wang, Thm 3.2,
  p. 74). *Route.* The sublevel complexes interleave as in 3.2; the modules are of finite type
  (1.3) and the isometry theorem applies.
- **Wasserstein stability** (`wassersteinDist_simplicialModule_le`): for `1 ≤ q`,
  `W_q ≤ (Σ_σ |f σ - g σ|^q)^{1/q}` (Dey–Wang, Thm 3.4, p. 75; Skraba–Turner, *Wasserstein
  stability for persistence diagrams*, 2020).
  *Route.* Interpolate `h_s = (1 - s) f + s g`; the simplexwise order of `h_s` changes at finitely
  many `s`. Between changes the pairing is fixed (4.3) and each bar endpoint is a value
  `h_s(σ)` of a single simplex, so the matching by pairs moves each point by
  `(|Δ f(σ_i)|, |Δ f(σ_j)|)` and the `q`-cost is at most the `ℓ^q` norm of the increments over
  the simplices; at a transposition of two consecutive simplices the pairing changes by the
  transposition rules of Cohen-Steiner, Edelsbrunner and Morozov (*Vines and vineyards*, 2006),
  which
  keep the matching continuous. Summing over the pieces with Minkowski's inequality
  (`wassersteinDist_triangle`) and the convexity of `s ↦ ‖h_s - f‖_q` gives the bound.
- Sublevel persistence of Lipschitz functions on triangulable spaces (Cohen-Steiner, Edelsbrunner,
  Harer, Mileyko, 2010) is under Beyond.

*Needs:* 2.2, 2.3, 3.2, 4.3.

### 4.5 Zero-dimensional persistence and single linkage

- `IsMinSpanningTree T`: a spanning tree of minimum total edge length.
- **Single linkage** (`rankInv_ripsModule_zero_eq`): for a finite metric space `X` with a minimum
  spanning tree `T` and `r ≥ 0`, the number of connected components of the Rips complex at scale
  `r`, that is `rankInv` in degree `0` at `(r, r)`, is one more than the number of edges of `T` of
  length greater than `2r` (Carlsson–Vejdemo-Johansson, §4.1, p. 94; Dey–Wang, Thm 3.18, p. 107).
  *Route.* The components of `ripsComplex id r` are those of the graph of edges of length at most
  `2r` (degree-zero homology of a complex is free on its components). Kruskal's cut property: two
  points are joined by edges of length `≤ 2r` iff they are joined in `T` by such edges, since any
  edge of `T` of length `> 2r` separates two sides with no shorter edge between them (otherwise
  exchanging would shorten `T`). A tree minus `k` edges has `k + 1` components.
- Consequently the degree-zero barcode has `|X|` bars born at `0`, one infinite, and the finite
  death times are the halved edge lengths of any minimum spanning tree, the merge heights of
  single-linkage clustering computed by Kruskal's algorithm; in the maximum-edge parameter they are
  the edge lengths themselves.

*Needs:* 1.2, 6.1.

**Checks.**

- `eulerChar`: the hollow triangle has `χ = 3 - 3 = 0`, with `β = (1, 1)`; the filled triangle has
  `χ = 1`, `β = (1, 0)` (computed in `checks.py`).
- `eulerChar`: an exponent `σ.card` instead of `σ.card + 1` would give `-1` for a point.
- `betti`: over `𝔽₂` the projective plane has `β₁ = 1`, over `ℚ` it has `β₁ = 0` (computed in
  `checks.py`).
- `sublevelComplex`: for `f` not monotone (an edge with a value below that of one of its vertices)
  the sublevel family is not a complex; the definition takes `IsMonotoneOn` as an argument.
- `boundaryMatrix`: for the edge `{0, 1}`, deleting vertex `0` (`k = 0`) leaves `{1}` with entry
  `1`, and deleting vertex `1` (`k = 1`) leaves `{0}` with entry `-1`, so `∂[0, 1] = [1] - [0]`; a
  sign `(-1)^(k+1)` would give the opposite boundary, and over `𝔽₂` the two agree.
- `low`: for the filtration of the triangle in the order `0, 1, 2, 01, 12, 02, 012` the reduced
  pairs are `(1, 3)`, `(2, 4)` and `(5, 6)` (0-indexed), and only vertex `0` is unpaired: one
  essential component, no essential cycle (computed in `checks.py`).
- `IsReduced`: the boundary matrix of the triangle in the order above is not reduced: the columns
  of `12` and `02` both have low `2`. Adding the column of `12` to that of `02` (over `𝔽₂`) gives
  low `1`, which collides with the column of `01`, and a second addition makes it zero, so `02` is
  positive (it creates the cycle).
- `cornerRank`: the pairing lemma was tested on 300 random square matrices of size at most `7` over
  `𝔽₂` and `𝔽₃` (`checks.py`); a version with columns `≤ j` and rows `> i` would be off by one.
- `IsMinSpanningTree`: for the points `0, 1, 3, 6` of `ℝ` the tree has edges of lengths `1, 2, 3`,
  and at `r = 0.6` there are `3` components (`checks.py`).
- `IsMinSpanningTree`: the path `0 — 6 — 3 — 1` is a spanning tree of length `11 > 6`, and with it
  the count at `r = 0.6` would be `4`, not `3`; minimality is needed.

- `fullComplex`: `fullComplex (Fin 2)` has the faces `{0}`, `{1}`, `{0, 1}`; `∅` is never a face.
- `fullComplex`: its realization for `Fin 3` is a filled triangle, with the homology of a point.
- `fullComplex`: every complex on `ι` is below it, so `facePoints` is defined for all of them.
- `facePoints`: for the complex with no faces it is `∅`.
- `facePoints`: for the complex with faces `{0}`, `{1}` it is two points, with `H_0 = 𝕜²`.
- `facePoints`: for the hollow triangle it is a circle, with `H_1 = 𝕜`.
- `complexFiltrationModule`: for a constant family it is the constant module of the homology of
  the complex.
- `complexFiltrationModule`: for the family `t ↦ ripsComplex x t` of two points at distance `2`
  it has degree-`0` diagram `{(0, ⊤), (0, 1)}`.
- `complexFiltrationModule`: on a nonempty vertex type, for the family with no faces below `0` and
  the full simplex from `0` on, degree `0` is `[0, ∞)`.
- `IsMonotoneOn`: `f σ = σ.card` is monotone on every complex, and so is every constant.
- `IsMonotoneOn`: `f σ = -σ.card` is not, on any complex with an edge.
- `IsMonotoneOn`: the maximum of vertex values (the lower-star function) is monotone.
- `sublevelComplex`: for `f = card` on the filled triangle, the levels `1`, `2`, `3` give the three
  vertices, the hollow triangle and the filled triangle.
- `sublevelComplex`: below the minimum of `f` it has no faces.
- `simplicialModule`: for `f = card` on the filled triangle, degree `1` is the interval module of
  `[2, 3)` and degree `0` is `[1, ∞) ⊕ [1, 2) ⊕ [1, 2)`.
- `simplicialModule`: for `f = 0` on the hollow triangle, degree `1` is `[0, ∞)`.
- `simplicialModule`: for `f = 0` on the filled triangle, degree `1` is `0`: the cycle and the
  triangle enter together and bars of length zero do not appear.
- `eulerChar`: the complex with no faces has `eulerChar = 0`, the empty finite sum.
- `betti`: a point has `β₀ = 1` and `β₁ = 0`; the hollow triangle has `β = (1, 1)` over every
  field.
- `boundaryMatrix`: for `σ = ({0}, {1}, {0, 1})` the column of `{0, 1}` is `(-1, 1, 0)`.
- `boundaryMatrix`: an enumeration of vertices only gives the zero matrix.
- `low`: a zero column has `low = ⊥`; the column `(-1, 1, 0)` has `low = 1`.
- `IsReduced`: the zero matrix and the identity matrix are reduced.
- `cornerRank`: `cornerRank D 0 m = rank D` for an `m × m` matrix, and `cornerRank D i 0 = 0`.
- `IsMinSpanningTree`: for the collinear points `0, 1, 2` the minimum spanning tree is the path
  with two edges of length `1`.

### Examples

- The lower-star filtration of a function on a path graph recovers the elder rule: when two
  components merge, the younger dies.

### Dependencies

4.1 → 4.2 → 4.3 → 4.4; 4.1 → 4.5 (with 6.1).

## Layer 5: distance functions, offsets and correspondences

### 5.1 Distance functions and the Hausdorff distance

- **Distance functions** (`iSup_abs_infDist_sub_eq_hausdorffDist`): for nonempty compact `A`, `B`
  in a pseudometric space, `sup_x |d(x, A) - d(x, B)| = d_H(A, B)`.
  *Route.* `≤` by `Metric.infDist_le_infDist_add_hausdorffDist` in both directions; `≥` by
  evaluating at points of `A` and `B`, where one distance vanishes, and
  `Metric.hausdorffDist_le_of_infDist`.
- **Offsets are `q`-tame and stable** (`bottleneckDist_offsetModule_le`): in Euclidean space the
  offset module of a nonempty compact set is `q`-tame (Chazal–de Silva–Glisse–Oudot, Cor 3.35,
  p. 53) and the diagrams of `A` and `B` are within `d_H(A, B)`.
  *Route.* `q`-tameness: for `s < t` the map `H(A^s) → H(A^t)` factors through the homology of a
  finite union of balls covering `A^s` inside `A^t`, which is the realization of a finite nerve
  (6.2), hence finite-dimensional. Stability: 5.1's first bullet bounds the distance functions,
  then 3.2 and 2.3.
- Consequently `A^r ⊆ B^{r+η}` and `B^r ⊆ A^{r+η}` when `d_H(A, B) ≤ η`.

*Needs:* 2.3, 3.2, 6.2; Mathlib `Metric.hausdorffDist`.

### 5.2 Critical points, weak feature size and reach

- `nearestPoints K x`; `IsDistCritical K x`: `x ∉ K` and `x` lies in the convex hull of its nearest
  points.
- `wfs K`: the infimum of `d(x, K)` over critical points, `⊤` if there are none (Oudot, p. 75).
- `reach K`: the supremum of the `r` such that every point within distance `r` of `K` has a unique
  nearest point (Oudot, p. 72; Federer, *Curvature measures*, 1959).
- **The reach bounds the weak feature size** (`reach_le_wfs`): for compact nonempty `K`.
  *Route.* A critical point `x` has at least two nearest points, since a single nearest point `y`
  with `x` in its convex hull would give `x = y ∈ K`; so `d(x, K) ≥ reach K`.
- **The isotopy lemma** (`isIso_offsetModule_map_of_noCritical`): if `0 < a ≤ b` and no critical
  value lies in `[a, b]`, the inclusion `K^a → K^b` induces isomorphisms in homology
  (Oudot, Lemma 4.3, p. 75; Grove, *Critical point theory for distance functions*, 1993).
  *Route.* The generalized gradient of `d_K` (the vector from the centre of the minimal ball
  enclosing the nearest points) is bounded away from `0` on the compact band `a ≤ d_K ≤ b`, by
  upper semicontinuity of the nearest-point set; a continuous vector field approximating it has a
  flow that decreases `d_K` at a uniform rate and gives a deformation retraction of `K^b` onto
  `K^a`. Homotopy invariance of `singularHomologyFunctor` concludes. The
  deformation retraction itself is a stronger conclusion recorded here without a Lean name.
- **Offsets below the reach** (`isIso_offsetModule_map_of_lt_reach`): for `0 ≤ a ≤ b < reach K`,
  `K^a → K^b` induces isomorphisms; with `a = 0`, every offset below the reach has the homology of
  `K`. *Route.* The nearest-point map is continuous on the open tube of radius `reach K`: if
  `x_n → x` and `y` is a limit point of `π(x_n)`, then `y` is a nearest point of `x`, which is
  unique.
  The straight-line homotopy from the identity to `π` stays in `K^b`, since `d_K` decreases along
  segments toward the nearest point; so `K` is a deformation retract of `K^b` compatibly with
  inclusions.
- Every compact polyhedron has positive weak feature size, and a convex compact set has
  `wfs = ⊤` (Oudot, p. 75); a finite set of points has positive reach.

*Needs:* 3.1; Mathlib `convexHull`, homotopy invariance of singular homology.

### 5.3 The sampling geometry of manifolds

Target, stated in prose: let `M ⊂ ℝ^D` be a compact smooth `d`-dimensional submanifold with reach
`τ > 0`. For `x ∈ M` and `0 < r < τ`, the volume of `M ∩ B(x, r)` is at least
`(1 - r²/(4τ²))^{d/2} ω_d r^d`, with `ω_d` the volume of the unit ball of `ℝ^d` (Niyogi, Smale and
Weinberger, *Finding the homology of submanifolds with high confidence from random samples*,
2008). *Route.* The orthogonal projection of `M ∩ B(x, r)` to the tangent space at `x` contains a
ball of radius `r cos θ` with `sin θ = r/(2τ)`, by the reach estimate
`|⟨n, y - x⟩| ≤ |y - x|²/(2τ)` for normal unit vectors `n`; projection is `1`-Lipschitz, so the area
formula gives the bound. Hence a law on `M` with density at least `c > 0` with respect to the
`d`-dimensional Hausdorff measure satisfies `μ(B(x, r)) ≥ a r^d` for `r ≤ r₀`, with `a` depending
on `c`, `d` and `τ`, which is the local form of `(a, d)`-standardness used in 8.4.

*Needs:* 5.2; Mathlib `MeasureTheory.Measure.hausdorffMeasure` and the area formula.

### 5.4 Correspondences and the Gromov–Hausdorff distance

- `IsCorrespondence C`: `C ⊆ X × Y` projects onto both factors; `distortion C`: the supremum of
  `|d(x, x') - d(y, y')|` over pairs in `C`, in `ℝ≥0∞` (Dey–Wang, Def 6.3, p. 182).
- **Correspondences compute d_GH** (`ghDist_eq_iInf_distortion`): for compact nonempty metric
  spaces, Mathlib's `GromovHausdorff.ghDist X Y` is half the infimum of the distortions
  (Dey–Wang, Def 6.3, p. 182, where it is the definition).
  *Route.* `≤`: given `C` of distortion `2η`, define a metric on `X ⊔ Y` by
  `d(x, y) = inf_{(x', y') ∈ C} (d(x, x') + η + d(y', y))`; both embeddings are isometric and the
  Hausdorff distance of the images is `≤ η`, so `GromovHausdorff.ghDist_le_hausdorffDist` applies.
  `≥`: from isometric embeddings into a common space with Hausdorff distance `< η + δ`, the relation
  of points at distance `< η + δ` is a correspondence of distortion `< 2(η + δ)`.

*Needs:* Mathlib `GromovHausdorff.ghDist`, `GromovHausdorff.ghDist_le_hausdorffDist`.

**Checks.**

- `nearestPoints`: for `K = {0, 2}` in `ℝ` and `x = 1`, both points are nearest; for `x = 3` only
  `2` is.
- `IsDistCritical`: `x = 1` is critical for `K = {0, 2}` (midpoint of its nearest points) with
  critical value `1`, so `wfs {0, 2} = 1`; `x = 3` is not critical.
- `wfs`: a convex compact set has no critical points, so `wfs = ⊤`; with a real-valued infimum the
  empty infimum would be the junk value `0`.
- `wfs`: for the circle of radius `1` in `ℝ²`, the centre is the only critical point, so
  `wfs = 1 = reach`.
- `reach`: `reach {0, 2} = 1` (the midpoint has two nearest points), equal to `wfs` here; for the
  union of two tangent circles the reach is `0` while `wfs > 0`, so `reach_le_wfs` is strict.
- `reach`: the reach of a single point is `⊤`, and of the empty set is `0` (Mathlib's
  `infDist x ∅ = 0` and no nearest points); theorems assume `K` nonempty.
- `distortion`: for two two-point spaces with distances `2` and `2 + 2ε`, the obvious
  correspondence has distortion `2ε`, so `d_GH ≤ ε`; their Rips diagrams in degree `0` are
  `{(0, ⊤), (0, 1)}` and `{(0, ⊤), (0, 1 + ε)}`, at bottleneck distance `ε` (computed in
  `checks.py`), so 6.3 is attained.
- `distortion`: the full product `X × Y` is a correspondence of distortion
  `max(diam X, diam Y)`, so `d_GH ≤ max(diam X, diam Y)/2`.
- `IsCorrespondence`: the empty relation is not one, though its distortion is `0`; dropping the
  surjectivity clauses would make every d_GH zero.

- `nearestPoints`: `nearestPoints K x = {x}` for `x ∈ K`, and `nearestPoints ∅ x = ∅`.
- `IsDistCritical`: points of `K` are never critical; for the unit circle the centre is critical
  with critical value `1`.
- `reach`: a closed convex set has reach `⊤`.
- `IsCorrespondence`: the graph of a bijection is a correspondence, of distortion `0` iff the
  bijection is an isometry.
- `IsCorrespondence`: `X × Y` is always one.
- `distortion`: the diagonal of `X × X` has distortion `0`.

### Examples

- For `A = {0}` and `B = {0, 1}` in `ℝ`, `sup |d_A - d_B| = 1 = d_H(A, B)` (`checks.py`).

### Dependencies

5.1 needs 2.3, 3.2 and 6.2; 5.2 → 5.3; 5.4 is independent of homology.

## Layer 6: Čech and Vietoris–Rips complexes and the nerve

### 6.1 The complexes and their inclusions

- `ripsComplex x r` and `cechComplex x r` for a family `x : ι → E` (Dey–Wang, Defs 2.9 and 2.10,
  p. 32; Edelsbrunner–Harer, §III.2, pp. 71–74); `ripsModule 𝕜 x p`, `cechModule 𝕜 x p`: their
  homology through `complexFiltrationModule`.
- **Inclusions in every metric space** (`cechComplex_le_ripsComplex_le`):
  `Čech(r) ⊆ Rips(r) ⊆ Čech(2r)`. *Route.* A common point `z` within `r` of every vertex gives
  pairwise distances `≤ 2r`; a face of diameter `≤ 2r` lies in the ball of radius `2r` about any of
  its vertices. In the maximum-edge parameter this reads `Rips_r ⊆ Čech_r ⊆ Rips_{2r}` after
  rescaling.
- **The Vietoris–Rips lemma** (`ripsComplex_le_cechComplex_sqrt_two`): in a real inner product
  space, `Rips(r) ⊆ Čech(√2 r)` (Edelsbrunner–Harer, Vietoris–Rips Lemma, p. 74).
  *Route.* Jung's theorem (Edelsbrunner–Harer, p. 72): a finite set of diameter `δ` in a
  `d`-dimensional Euclidean space lies in a ball of radius `δ √(d/(2(d+1))) < δ/√2`. A finite set
  spans a finite-dimensional subspace, so the bound `δ/√2` holds in every inner product space.
  Jung's theorem is a target here: the minimal enclosing ball has its centre in the convex hull of
  the points on its boundary sphere (Carathéodory), and averaging the identities
  `|p_i - c|² = R²` over barycentric weights gives `R² ≤ δ² d/(2(d+1))`.
- The two complexes share their edges: the edge `{a, b}` lies in `Čech(r)` iff `d(a, b) ≤ 2r`
  (midpoint) in a geodesic space, in particular in Euclidean space.

*Needs:* 4.1.

### 6.2 The nerve lemma

- `nerveComplex U hU`: the faces are the nonempty `σ` with `⋂_{i ∈ σ} U i` nonempty.
- **The nerve lemma** (`nonempty_iso_homology_nerveComplex`): for finitely many nonempty open
  subsets `U i` of a space whose nonempty finite intersections are contractible, the ordered
  simplicial homology of the nerve is isomorphic to the singular homology of the union, in every
  degree (Dey–Wang, Thm 2.1, p. 31; Edelsbrunner–Harer, Nerve Theorem, §III.2, p. 71).
  *Route.* `TauCeti.quasiIso_cechTotalAugmentation` identifies the singular chains of the union
  with the total complex of the Čech double complex of the cover (ordered form). Filter by the
  Čech degree: the `E¹` page in column `σ` is the homology of `⋂_{i∈σ} U i`, which by
  `TauCeti.isZero_singularHomologyFunctor_of_contractibleSpace` is `𝕜` in degree `0` and `0`
  otherwise (and `0` for empty intersections). Hence the column homology is concentrated in one
  row, which is the ordered simplicial chain complex of the nerve, and the double complex is
  quasi-isomorphic to it. The isomorphism is natural for maps of covers `U i ⊆ V i`
  (`TauCeti.cechSingularChainsMap`), which 6.3 uses.
- The homotopy-type statement for finite closed convex covers of Euclidean space (Borsuk) is under
  Beyond; the homological statement suffices for every use here.

*Needs:* 4.1; Tau Ceti `TauCeti.quasiIso_cechTotalAugmentation`,
`TauCeti.isZero_singularHomologyFunctor_of_contractibleSpace`.

### 6.3 Čech persistence is offset persistence

- **Čech equals offsets** (`nonempty_iso_cechModule_offsetModule`): for a finite family of points
  in Euclidean space, `cechModule 𝕜 x p` and `offsetModule 𝕜 (range x) p` are isomorphic
  persistence modules.
  *Route.* For `r < 0` both are `0`. For `r ≥ 0`, closed balls have intersections that are
  intersections of open balls of radius `r + δ` for small `δ > 0`: a finite family of closed balls
  of
  radius `r` meets iff its minimal enclosing radius is `≤ r`, and the strict inequalities for the
  non-meeting faces survive a small enlargement. So `cechComplex x r` is the nerve of the open
  balls of radius `r + δ`, whose intersections are convex, hence contractible, and 6.2 identifies
  its homology with that of the open offset of radius `r + δ`. The distance function to a finite
  set has finitely many critical values (circumradii of subsets), so for small `δ` the open and
  closed offsets have the same homology by 5.2. Naturality in `r` comes from the naturality of 6.2
  and of the inclusions.

*Needs:* 5.2, 6.2.

### 6.4 Gromov–Hausdorff stability of Rips persistence

- **Rips stability** (`bottleneckDist_ripsModule_le_ghDist`): for compact nonempty metric spaces,
  the Rips modules are `q`-tame and their diagrams in every degree are within `d_GH(X, Y)`
  (Chazal–de Silva–Glisse–Oudot, Thm 1.1, p. 6; Dey–Wang, Thm 6.3, p. 182, for finite spaces).
  *Route.* `q`-tameness: for `s < t`, a finite `(t - s)/2`-net `N` of `X` and a nearest-net-point
  map give `Rips_s(X) → Rips_{(s+t)/2}(N) → Rips_t(X)`, whose composite is contiguous to the
  inclusion, so `H(Rips_s) → H(Rips_t)` factors through a finite complex. Stability: a
  correspondence `C` of distortion `2η` (5.4) gives simplicial maps `Rips_r(X) → Rips_{r+η}(Y)` by
  choosing
  `c(x)` with `(x, c(x)) ∈ C`; any two choices are contiguous, so they induce the same maps in
  homology, and the composites with the reverse maps are contiguous to inclusions. This
  `η`-interleaving and 2.3 give the bound; infimize over `C`.
- In the maximum-edge parameter the bound is `2 d_GH(X, Y)`. For finite subsets `P`, `Q` of one
  metric space the Rips diagrams are within `d_H(P, Q)`, by
  `GromovHausdorff.ghDist_le_hausdorffDist`.
- **Intrinsic Čech stability** (prose target): for finite metric spaces, the Čech complexes with
  centres in the space itself have diagrams within `2 d_GH(X, Y)` (Dey–Wang, Thm 6.3(b), p. 182).
  *Route.* A correspondence of distortion `2η` carries a ball of radius `r` about `z ∈ X` into the
  ball of radius `r + 2η` about a partner of `z`, giving a `2η`-interleaving.

*Needs:* 2.3, 5.4, 6.1.

**Checks.**

- `ripsComplex`: an equilateral triangle of side `2` is a face of `Rips(1)` but not of `Čech(1)`
  (circumradius `2/√3 ≈ 1.155 > 1`), and it is a face of `Čech(√2)` (`checks.py`).
- `ripsComplex`: with the maximum-edge parameter (diameter `≤ r`) the same triangle enters at
  `r = 2`; a mixed convention would put it in `Rips(1)` and `Čech(1)` simultaneously, contradicting
  the previous check.
- `ripsComplex`: for `r < 0` the complex is empty (distances are nonnegative), and so is
  `cechComplex`; in degree `0` both modules vanish below `0`.
- `cechComplex`: in Jung's bound, `√(d/(2(d+1)))` is `1/√3` for `d = 2` and tends to `1/√2` as
  `d → ∞` (`checks.py`), so `√2` cannot be lowered uniformly in dimension.
- `cechComplex`: Čech complexes are ambient: for the two points `(±1, 0)` of `ℝ²` the edge is in
  `Čech(1)` (centre `(0, 0)`), but not in the intrinsic Čech complex of radius `1`, whose centres
  must be among the two points.
- `nerveComplex`: the open cover of a circle by three arcs whose pairwise intersections are arcs
  and whose triple intersection is empty has the hollow triangle as nerve, with `β₁ = 1`; with two
  arcs the pairwise intersection has two components, is not contractible, and the nerve (an edge)
  has the wrong homology.
- `nerveComplex`: the singleton faces are present because every `U i` is assumed nonempty; an
  empty member would make the nerve fail `singleton_mem`.

- `cechComplex`: for injective `x` with distinct points, `cechComplex x 0` has only the vertex
  faces.
- `ripsModule`: for two points at distance `2`, degree `0` is `[0, ∞) ⊕ [0, 1)`; with the
  maximum-edge parameter the death would be at `2`.
- `ripsModule`: for the four corners of the unit square, degree `1` is the interval module of
  `[1/2, √2/2)`.
- `ripsModule`: for a single point, degree `0` is `[0, ∞)` and all higher degrees vanish.
- `cechModule`: for the corners of the unit square, degree `1` is `[1/2, √2/2)` as well, the
  circumradius being `√2/2`.
- `cechModule`: for the vertices of an equilateral triangle of side `2`, degree `1` is
  `[1, 2/√3)`, while for the Rips module the cycle never appears (`(1, 1)` is empty).
- `cechModule`: for a single point it is the offset module of the point (6.3).
- `nerveComplex`: the nerve of a single nonempty set is a point.

### Examples

- Four points at the corners of a unit square: `Rips(1/2)` is the 4-cycle, `Rips(√2/2)` the full
  simplex; the degree-one diagram is `{(1/2, √2/2)}`, and the Čech diagram is `{(1/2, √2/2)}` as
  well, since the circumradius of the square is `√2/2`.

### Dependencies

6.1 → 6.4; 6.2 → 6.3; 5.4 → 6.4; 5.2 → 6.3.

## Layer 7: homology inference from samples

### 7.1 The Niyogi–Smale–Weinberger theorem

- **Noiseless sampling of a submanifold** (`exists_deformationRetraction_offset`): let
  `M = j(N) ⊂ ℝ^D` be a compact smooth embedded submanifold with reach at least `τ > 0`, and
  `P ⊆ M` finite and nonempty with `d_H(P, M) ≤ ε < √(3/20) τ`. For `r ∈ (2ε, √(3/5) τ)` the offset
  `P^r` contains `M` and strongly deformation retracts onto it (Oudot, Thm 4.1, p. 72; Niyogi,
  Smale and Weinberger, 2008). By 6.3, the Čech complex of radius `r` then has the homology of `M`.
- Oudot's printed statement does not require `P ⊆ M`; the noiseless hypothesis is the one of the
  original paper, and noisy samples are treated by 7.2 and 7.4, whose conclusions concern images
  of persistent homology rather than homotopy type.
  *Route.* The retraction is the nearest-point projection `π` onto `M`, continuous on the tube of
  radius `τ` (5.2). For `x ∈ P^r` the segment from `x` to `π(x)` lies in `P^r`: write
  `x = v + s n` with `v = π(x)` and `n` a unit normal; choose `q ∈ P` with `|q - v| ≤ ε` and
  `p ∈ P` with `|x - p| ≤ r`; by the reach estimate `|⟨n, y - v⟩| ≤ |y - v|²/(2τ)` for `y ∈ M`, the
  squared distance from `v + s' n` to `q` is at most `ε² + s' ε²/τ + s'²`, which is `≤ r²` for small
  `s'`, and the squared distance to `p` is a convex function of `s'` that is `≤ r²` at `s' = s`.
  The two ranges overlap when `2ε < r < √(3/5) τ` and `ε < √(3/20) τ`, which is where the constants
  come from. `M ⊆ P^r` since `r > ε`.

*Needs:* 5.2; Mathlib `Manifold.IsSmoothEmbedding`.

### 7.2 Inference under positive weak feature size

- **Offsets** (`nonempty_range_offsetModule_equiv`): let `K ⊂ ℝ^D` be compact nonempty, `P` finite
  nonempty with `d_H(K, P) ≤ ε`. If `ε < i`, `i + 2ε ≤ j` and `j + ε < wfs K`, then the image of
  `H_p(P^i) → H_p(P^j)` is isomorphic to `H_p(K^r)` for every `0 < r < wfs K` (Oudot, Thm 4.4,
  p. 75; Chazal and Lieutier, *Stability and computation of topological invariants of solids in
  ℝ^n*, 2007). The hypotheses force `ε < wfs K / 4`.
  *Route.* The chain `K^{i-ε} ⊆ P^i ⊆ K^{i+ε} ⊆ P^j ⊆ K^{j+ε}` (from 5.1) has all three `K`-offsets
  at radii in `(0, wfs K)`, so the composites `K^{i-ε} → K^{i+ε} → K^{j+ε}` induce isomorphisms by
  the isotopy lemma (5.2). Then `H(P^i) → H(K^{i+ε})` is onto and `H(K^{i+ε}) → H(P^j)` is
  injective, so the image of `H(P^i) → H(P^j)` is isomorphic to `H(K^{i+ε}) ≅ H(K^r)`. By 6.3 the
  same holds for the Čech complexes of radii `i` and `j`.
- **Rips complexes** (`nonempty_range_ripsModule_equiv`): with `d_H(K, P) ≤ ε`, if `ε < a`,
  `2a + 2ε ≤ b` and `2b + ε < wfs K`, then the image of `H_p(Rips(a)) → H_p(Rips(b))` is
  isomorphic to `H_p(K^r)` for `0 < r < wfs K`. With `a = α/2` and `b = 2α` the conditions read
  `2ε < α < (wfs K - ε)/4`, a window that is nonempty exactly when `ε < wfs K / 9`
  (Oudot, Thm 5.3, p. 90, where the sweet range is stated on a logarithmic scale; Chazal and
  Oudot, *Towards persistence-based reconstruction in Euclidean spaces*, 2008).
  *Route.* `Čech(a) ⊆ Rips(a) ⊆ Čech(2a) ⊆ Čech(b) ⊆ Rips(b) ⊆ Čech(2b)` by 6.1. Through 6.3 the
  outer and middle maps are offset maps whose ranks equal `dim H(K^r)` by the first bullet (the
  conditions are those of that bullet for `(a, 2b)` and `(2a, b)`). The sandwich lemma
  (Dey–Wang, Fact 6.3, p. 195): in a sequence `A → B → C → D → E → F` of finite-dimensional spaces
  with `rank(A → F) = rank(C → D)`, the rank of `B → E` is the same; here also the images are
  identified, giving the isomorphism.

*Needs:* 5.1, 5.2, 6.1, 6.3.

### 7.3 Rips pairs below the reach

- **Rips pairs** (`rankInv_ripsModule_eq_of_reach`): let `K ⊂ ℝ^D` be compact nonempty with reach
  at least `τ`, and `P` finite with `d_H(K, P) ≤ ε`. If `(2 + √2) ε ≤ α` and `2√2 α + ε < τ`, then
  `rank(H_p(Rips(α)) → H_p(Rips(2α))) = dim H_p(K)`. The window is nonempty exactly when
  `ε < τ/(5 + 4√2) ≈ 0.0938 τ` (`checks.py`). No manifold structure is needed.
  *Route.* `Čech(α) ⊆ Rips(α) ⊆ Čech(√2α) ⊆ Čech(2α) ⊆ Rips(2α) ⊆ Čech(2√2α)` by 6.1 (the
  Vietoris–Rips lemma). For offsets of `P`, `rank(H(P^s) → H(P^t)) = dim H(K)` whenever
  `ε ≤ s`, `s + 2ε ≤ t` and `t + ε < τ`: the route of 7.2 with `K^{s-ε} → K^{s+ε} → K^{t+ε}`
  isomorphisms by `isIso_offsetModule_map_of_lt_reach`, the radius `s - ε = 0` included. The pairs
  `(α, 2√2α)` and `(√2α, 2α)` satisfy this; the second needs `√2α + 2ε ≤ 2α`, which is
  `α ≥ (2 + √2) ε`. The sandwich lemma gives the rank of `Rips(α) → Rips(2α)`.
- Dey–Wang (Thm 6.11, p. 196) state the version for submanifolds with
  `3ε ≤ α ≤ (3/16) √(3/5) τ`, through their Prop 6.10 (p. 196), a noisy form of 7.1 taken from the
  literature; the constants above come from the reach route alone and are the targets here.

*Needs:* 5.2, 6.1, 6.3, 7.2.

**Checks.**

- `nonempty_range_offsetModule_equiv`: for `K = {0, 2}` (`wfs = 1`) and `P = K`, `ε = 0`: with
  `i = 0.1`, `j = 0.5` the image is `H_0 ≅ 𝕜²`, the homology of `K^r` for `r < 1`; with
  `j = 1.2 > wfs` the image is `𝕜`, and the hypothesis `j + ε < wfs` excludes it.
- The window of 7.2 for offsets, `ε < i` and `i + 2ε ≤ j < wfs - ε`, is nonempty iff
  `ε < wfs/4`: `ε = 0.24 wfs` admits one, `ε = 0.26 wfs` does not (`checks.py`).
- The Rips window `2ε < α < (wfs - ε)/4` is nonempty iff `ε < wfs/9`: `0.11 wfs` admits one,
  `0.112 wfs` does not (`checks.py`).
- The constants of 7.1: `√(3/20) ≈ 0.3873`, `√(3/5) ≈ 0.7746`, and `2 √(3/20) = √(3/5)`, so the
  window `(2ε, √(3/5) τ)` is nonempty exactly when `ε < √(3/20) τ` (`checks.py`).
- The constant of 7.3: `α ≥ (2 + √2) ε` is exactly `√2 α + 2ε ≤ 2α`, and
  `1/(5 + 4√2) ≈ 0.09383`; Dey–Wang's upper constant `(3/16) √(3/5) ≈ 0.14524` (`checks.py`).

### Examples

- A circle of radius `1` in `ℝ²` has reach `1`; a sample with `ε = 0.05` admits `α ∈ [0.171, 0.336)`
  in 7.3, and the rank in degree `1` is `1`.

### Dependencies

7.1 uses 5.2; 7.2 uses Layers 5 and 6; 7.3 uses 7.2.

## Layer 8: statistics of diagrams and of the distance to a measure

### 8.1 The distance to a measure

- `massRadius μ x u`: the least `r ≥ 0` with `μ(closedBall x r) ≥ u`, in `ℝ≥0∞`, `⊤` if none.
- `dtm μ m x`: `(m⁻¹ ∫_0^m massRadius(u)² du)^{1/2}` in `ℝ≥0∞`, for a mass parameter `m ∈ (0, 1]`
  (Oudot, Ch. 5, §6, p. 110; Chazal, Cohen-Steiner and Mérigot, *Geometric inference for
  probability measures*, 2011).
- **Stability in `W₂`** (`dtm_le_add_wassersteinEDist`): for probability measures,
  `d_{μ,m}(x) ≤ d_{ν,m}(x) + m^{-1/2} W₂(μ, ν)` with `W₂ = TauCeti.wassersteinEDist 2`; with the
  roles
  exchanged, `‖d_{μ,m} - d_{ν,m}‖_∞ ≤ m^{-1/2} W₂(μ, ν)` (Oudot, p. 110). The `ℝ≥0∞` form needs no
  moment hypothesis: if `W₂ = ⊤` it is trivial.
  *Route.* `d_{μ,m}(x)²` is the minimum of `m⁻¹ ∫ |x - y|² dρ(y)` over submeasures `ρ ≤ μ` of mass
  `m`
  (the mass is placed on the nearest points). Given a coupling `π` of `μ` and `ν` and the optimal
  submeasure `ρ` for `ν`, the disintegration of `π` transports `ρ` to a submeasure `ρ'` of `μ` of
  mass `m`, and Minkowski's inequality in `L²(π)` bounds `(m⁻¹∫|x - y'|²dρ')^{1/2}` by
  `d_{ν,m}(x) + m^{-1/2} (∫|y - y'|² dπ)^{1/2}`.
- **Lipschitz** (`dtm_le_add_edist`): `d_{μ,m}` is `1`-Lipschitz, by the same submeasure
  formula and the triangle inequality in `L²(ρ)`.
- **The empirical distance to a measure** (`dtm_empirical_sq`): for the empirical measure of
  `X₁, …, X_n` and `m = k/n` with `1 ≤ k ≤ n`, `d_{μ,m}(x)²` is the mean of the `k` smallest
  squared distances `|x - X_{(i)}(x)|²` (Oudot, eq. (5.13), p. 110). *Route.* `massRadius` is
  the `i`-th smallest distance for `u ∈ ((i - 1)/n, i/n]`, ties included, since closed balls are
  used.

*Needs:* Tau Ceti `TauCeti.wassersteinEDist`; OptimalTransport, §3.1.

### 8.2 Persistence landscapes

- `tent (b, d) t = max(0, min(t - b, d - t))`; `landscape D k t`: the `k`-th largest tent value
  (from `k = 0`), `0` beyond the number of bars (Dey–Wang, Def 13.1, p. 391; Bubenik, *Statistical
  topological data analysis using persistence landscapes*, 2015).
- `Diagram.ofMultiset D`: the diagram of a finite multiset of real bars, bars with `d ≤ b` dropped
  (their tents vanish, so landscapes do not see them either).
- **Landscape stability** (`abs_landscape_sub_le`): `|λ_k(D, t) - λ_k(D', t)| ≤ d_B(D, D')`
  (Dey–Wang, Thm 13.1, p. 393). *Route.* A matching of cost `η` changes every tent value by at most
  `η` (the tent of a point within `η` of the diagonal is at most `η`), and the `k`-th largest of
  two families that are `η`-close after a bijection (padding with zeros) differ by at most `η`.
- **Lipschitz and bounded** (`landscape_lipschitz_bounded`): `t ↦ λ_k(D, t)` is `1`-Lipschitz,
  nonnegative, and bounded by half the longest bar.

*Needs:* 2.1.

### 8.3 Limit theorems for landscapes

Targets, stated in prose: let `D₁, D₂, …` be i.i.d. random finite diagrams whose bars lie in
`[0, T]` almost surely, and fix `k`.

- **Uniform strong law.** `sup_{t ∈ [0, T]} |n⁻¹ Σ_i λ_k(D_i, t) - E λ_k(D, t)| → 0` almost
  surely.
- **Central limit theorem in `ℓ^∞([0, T])`.** `√n (n⁻¹ Σ_i λ_k(D_i, ·) - E λ_k(D, ·))` converges
  weakly to a tight centred Gaussian process with the covariance of `λ_k(D, ·)`.

*Route.* The class `{D ↦ λ_k(D, t) : t ∈ [0, T]}` is a Lipschitz parametric class in the sense of
MathematicalStatisticsAsymptotic §3.2: by `landscape_lipschitz_bounded`,
`|λ_k(D, t) - λ_k(D, s)| ≤ |t - s|`, with the constant envelope `T/2`. Hence its bracketing
numbers are at most `K (T/ε)`, its bracketing entropy integral is finite, and the Glivenko–Cantelli
and Donsker theorems under bracketing (MathematicalStatisticsAsymptotic §3.4) give both statements;
the limit is the Brownian-bridge law of the class (§3.1), the centred Gaussian process with
covariance `Cov(λ_k(D, s), λ_k(D, t))`. Measurability of `D ↦ λ_k(D, t)` holds for
every measurable random diagram since `λ_k` is continuous in the bar endpoints.

The landscape central limit theorem in `L^p(ℕ × ℝ)` for `2 ≤ p < ∞` and the strong law in `L^p`
under moment conditions (Bubenik 2015) are under Beyond.

*Needs:* 8.2; MathematicalStatisticsAsymptotic §§3.1, 3.2, 3.4.

### 8.4 Sampling bounds and rates

- A law `μ` with compact support `S` is `(a, b)`-standard if `μ(closedBall x r) ≥ min(1, a r^b)` for
  `x ∈ S` and `r > 0` (Chazal, Glisse, Labruère and Michel, *Convergence rates for persistence
  diagram estimation in topological data analysis*, 2015). The hypotheses `μ(Sᶜ) = 0` and
  standardness force `S` to be the support of `μ` (`MeasureTheory.Measure.support`).
- **The sampling bound** (`measure_hausdorffDist_gt_le`): for an `(a, b)`-standard law, `ε > 0`
  and `n` independent draws,
  `P(d_H(X̂_n, S) > ε) ≤ max(1, 4^b/(a ε^b)) · exp(-n min(1, a ε^b/2^b))`.
  *Route.* A maximal `ε/2`-separated subset of `S` has at most `max(1, 4^b/(a ε^b))` points, as the
  disjoint balls of radius `ε/4` about them each carry mass `≥ min(1, a (ε/4)^b)`. If every ball of
  radius `ε/2` about these points contains a sample point, every point of `S` is within `ε` of the
  sample, and the sample lies in `S` almost surely. A union bound and
  `(1 - u)^n ≤ e^{-nu}` give the bound.
- **The rate** (`lintegral_hausdorffDist_le`): there is `C` depending only on `a` and `b` such that
  `E d_H(X̂_n, S) ≤ C (log n / n)^{1/b}` for every `(a, b)`-standard law and every `n ≥ 2`, the
  expectation a lower integral (Chazal, Glisse, Labruère and Michel, 2015).
  *Route.* `S` lies in a ball of radius `a^{-1/b}` about any of its points (the ball of that
  radius has mass `1`), so `d_H ≤ 2 a^{-1/b}`. Split `E d_H ≤ ε_n + 2 a^{-1/b} P(d_H > ε_n)` with
  `a ε_n^b / 2^b = (1 + 1/b) log n / n` and apply the sampling bound.
- **Rates for Rips diagrams** (corollary, prose): with the same `C`,
  `E d_B(dgm Rips(X̂_n), dgm Rips(S)) ≤ C (log n / n)^{1/b}`, by 6.4 and
  `GromovHausdorff.ghDist_le_hausdorffDist`. By 5.3, a law on a compact submanifold with density
  bounded below is `(a, d)`-standard at small radii, which gives the sample-size bound
  `n ≥ C ε^{-d} (log(1/ε) + log(1/δ))` for `P(d_H ≤ ε) ≥ 1 - δ`.

*Needs:* 5.3, 6.4; Mathlib `MeasureTheory.Measure.pi`.

**Checks.**

- `massRadius`: for `μ = (δ₀ + δ₂)/2` and `x = 1`, `massRadius = 1` for every `u ∈ (0, 1]`; for
  `x = 0` it is `0` for `u ≤ 1/2` and `2` for `u ∈ (1/2, 1]`.
- `massRadius`: for a law with unbounded support, `massRadius μ x 1 = ⊤`; a real-valued infimum
  would give the junk value `0` and make the distance to a measure wrong at `m = 1`.
- `dtm`: for `μ = (δ₀ + δ₂)/2`, `d_{μ,1/2}(1) = 1` and `d_{μ,1}(0) = √2` (`checks.py`).
- `dtm`: the stability bound is attained: for `μ = δ₀`, `ν = (1 - m) δ₀ + m δ_L` and mass `m`,
  `d_{μ,m}(L) = L`, `d_{ν,m}(L) = 0` and `m^{-1/2} W₂ = m^{-1/2} L √m = L`; for `m = 1/4`,
  `L = 3` both sides are `3` (`checks.py`). A bound `W₂` without the factor `m^{-1/2}` fails here.
- `kNNDist`: for the sample `{0, 1, 3}` and `x = 0`, `k = 2`, the empirical distance to a measure
  squared is `(0 + 1)/2` (`checks.py`).
- `landscape`: for `D = {(0, 4), (1, 3)}` at `t = 2`, `λ_0 = 2` and `λ_1 = 1` (`checks.py`); with
  increasing sort order the two would be exchanged.
- `landscape`: for `D = {(0, 2)}`, `D' = {(0, 3)}`, `sup_t |λ_0(D, t) - λ_0(D', t)| = 1 = d_B`
  (`checks.py`), so the stability bound is attained.
- `landscape`: `λ_k` beyond the number of bars is `0`, and a bar `(1, 1)` adds a zero tent, so the
  multiset `{(1, 1)}` and the empty multiset have equal landscapes and equal diagrams.
- `Diagram.ofMultiset`: the multiset `{(0, 1), (0, 1)}` gives multiplicity `2` at `(0, 1)`.
- The uniform law on `[0, 1]` is `(1, 1)`-standard and not `(2, 1)`-standard (at `x = 0`,
  `r = 1/4` the mass is `1/4 < 1/2`) (`checks.py`).
- For `n = 60` uniform points on `[0, 1]` and `ε = 0.1`, the simulated `P(d_H > ε) ≈ 0.003` is
  below the sampling bound `≈ 1.99` (`checks.py`); the bound becomes informative near
  `n ≥ 2 log(40)/0.1 ≈ 74`.

- `massRadius`: `massRadius μ x 0 = 0`.
- `dtm`: for a Dirac measure `δ_y`, `dtm δ_y m x` is `dist x y` for every `m ∈ (0, 1]`.
- `kNNDist`: if `x` is a sample point then `kNNDist X x 0 = 0`.
- `kNNDist`: for an index `i ≥ n` it is the junk value `0`, never used by `dtm_empirical_sq`, which
  assumes `k ≤ n`.
- `tent`: `tent (0, 2) 1 = 1`, `tent (0, 2) 0 = 0` and `tent (0, 2) 3 = 0`; without the `max 0` it
  would be `-1` at `3`.
- `tent`: for a reversed pair, `tent (2, 0) t = 0` for every `t`.
- `tent`: it is `1`-Lipschitz in `t`.
- `Diagram.ofMultiset`: the empty multiset gives the zero diagram, and `{(1, 1)}` gives the zero
  diagram as well.
- `landscape`: `landscape ∅ k t = 0`.

### Examples

- For `n` points from the uniform law on the unit circle, which is `(a, 1)`-standard, the Rips
  diagrams converge in expected bottleneck distance at rate `log n / n`.

### Dependencies

8.1 is independent of Layers 1–7; 8.2 needs 2.1; 8.3 needs 8.2; 8.4 needs 5.3 and 6.4.

## Downstream consumers

No other roadmap consumes the results of this one.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Multiparameter persistence** (rank invariants, the absence of a complete discrete invariant,
  Hilbert functions, signed barcodes): no interval decomposition exists, so it needs its own
  algebra.
- **Zigzag persistence** and levelset persistence: they rest on Gabriel's theorem for arbitrarily
  oriented type-`A` quivers and on Mayer–Vietoris pyramids, independent of everything above.
- **Mapper** (pullback covers, clustering and nerves) and Reeb graphs: their stability theory uses
  the functional distortion distance and is a separate subject.
- **Persistent cohomology algorithms** and clearing, twist and dualization optimizations: they
  speed up 4.3 but add no new theorem.
- **The homotopy-level nerve theorem** for finite closed convex covers (Borsuk; Edelsbrunner–Harer,
  p. 71): 6.2 states the homological form, which is all that Layers 6–8 use; the homotopy form
  needs CW approximation or the Quillen fibre lemma.
- **Wasserstein stability for Lipschitz functions on triangulable spaces** (Cohen-Steiner,
  Edelsbrunner, Harer, Mileyko, 2010), with exponents `q > j` for polynomially growing
  triangulations: it needs a total-persistence bound through triangulations of controlled mesh.
- **Landscapes in `L^p`**: the central limit theorem in `L^p(ℕ × ℝ)` for `2 ≤ p < ∞` and the strong
  law in `L^p` (Bubenik 2015) need central limit theorems in Banach spaces of type 2, which no
  roadmap on main supplies; 8.3 states the `ℓ^∞([0, T])` versions.
- **Bootstrap confidence sets** for diagrams and landscapes: they need bootstrap consistency for
  empirical processes, owned by a resampling roadmap in an open pull request.
- **Minimax lower bounds for diagram estimation** (Chazal, Glisse, Labruère and Michel 2015, Le Cam
  two-point arguments): the upper bound is 8.4; the lower bound needs constructions of standard
  laws with distant diagrams.
- **Noisy Niyogi–Smale–Weinberger** (samples off the manifold with Gaussian or bounded noise)
  and the `μ`-reach and critical-function theory of Chazal, Cohen-Steiner and Lieutier.
- **Witness complexes, alpha complexes and sparse Rips filtrations**: alternative filtrations
  with their own interleaving constants.

## Prior formalization

Layers 1–8 are formalized in part in `CKSD/Geometry/` of
[lean-CKSD](https://github.com/bjbraams/lean-CKSD) (Apache 2.0), the Core Knowledge of Statistics
and Data Science project, where they are items 18–39 of its file SYNOPSIS108.md. Proved there:
the pairing lemma and the independence of the reduction, persistent Betti numbers of a reduced
matrix, uniqueness of interval bases, the half `d_I ≤ d_B` of the isometry theorem, the triangle
inequalities for bottleneck and Wasserstein distances, the inclusions of Čech and Rips complexes
with the Euclidean constant, the stability of the distance to a measure, the landscape strong law,
bottleneck and Wasserstein stability for finite simplicial filtrations, Rips stability for finite
metric spaces, and the manifold sampling bound. Admitted there: Crawley-Boevey's theorem, the
isometry equality, the Niyogi–Smale–Weinberger retraction, the two weak-feature-size inference
theorems and the sublevel bars of a Morse function. Its definitions are not canonized here; in
particular it uses its own sublevel homology functor, where this roadmap uses Mathlib's singular
homology directly.

The map, which is not prescriptive, lists files of `CKSD/Geometry/`:

| Layer | lean-CKSD files | synopsis items |
|---|---|---|
| 1, 2 | Persistence/Modules, Persistence/Basic, Persistence/DiagramDistances | 18, 20, 26, 30 |
| 3 | Persistence/TopologicalInference (sublevel modules, Morse bars) | 19, 25, 34 |
| 4 | MatrixReduction/{Basic, Filtered, Homology}, SimplicialPersistence/{Chains, Stability} | 31, 32, 33, 35 |
| 5, 6 | Reach, Persistence/CechRips, Persistence/RipsStability | 21, 27, 36 |
| 7 | Persistence/TopologicalInference | 22, 37, 38 |
| 8 | Persistence/Landscapes, ManifoldSampling | 23, 24, 28, 29, 39 |

Related libraries:
- [Statlib](https://github.com/stat-lib/statlib) (Apache 2.0) has no material on topological data
  analysis; its total-variation inequalities are not used here.

## References

The locators refer to these editions; page numbers are printed page numbers.

- G. Carlsson and M. Vejdemo-Johansson, *Topological Data Analysis with Applications*, Cambridge
  University Press, 2022. §4.1 (single linkage).
- F. Chazal, V. de Silva, M. Glisse and S. Oudot, *The Structure and Stability of Persistence
  Modules*, SpringerBriefs in Mathematics, Springer, 2016. §§1–5 (q-tameness, decomposition,
  diagrams, interleavings, isometry).
- T. K. Dey and Y. Wang, *Computational Topology for Data Analysis*, Cambridge University Press,
  2022. Chs. 2, 3, 6, 13 (complexes, nerve, persistence algorithm, stability, inference,
  landscapes).
- H. Edelsbrunner and J. L. Harer, *Computational Topology: An Introduction*, American
  Mathematical Society, 2010; page numbers as in the authors' 2008 manuscript of the book.
  Chs. III, IV, VII, VIII (complexes, nerve, Jung, Euler–Poincaré, pairing lemma, stability).
- S. Y. Oudot, *Persistence Theory: From Quiver Representations to Data Analysis*, Mathematical
  Surveys and Monographs 209, American Mathematical Society, 2015. Chs. 1–5 (decomposition,
  diagrams, isometry, inference, distance to a measure).

Papers cited by author, title and year, without locators, with proof routes given here:
U. Bauer and M. Lesnick (2015), P. Bubenik (2015), F. Chazal, D. Cohen-Steiner and Q. Mérigot
(2011), F. Chazal, M. Glisse, C. Labruère and B. Michel (2015), F. Chazal and A. Lieutier (2007),
F. Chazal and S. Oudot (2008), D. Cohen-Steiner, H. Edelsbrunner and D. Morozov (2006),
D. Cohen-Steiner, H. Edelsbrunner, J. Harer and Y. Mileyko (2010), W. Crawley-Boevey (2015),
H. Federer (1959), K. Grove (1993), P. Niyogi, S. Smale and S. Weinberger (2008), P. Skraba and
K. Turner (2020).
