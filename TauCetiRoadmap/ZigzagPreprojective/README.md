# Roadmap: Zigzag, preprojective, and Ginzburg algebras

Zigzag algebras are finite-dimensional symmetric quotients of doubled-graph path algebras.
Their quadratic duals lead to preprojective algebras, while their derived Koszul duals lead to
2-dimensional Ginzburg DG algebras and Calabi--Yau completions.  This roadmap builds that chain
without identifying objects which agree only after a duality, a completion, or transfer of an
`A∞` structure.  It covers arbitrary finite simple graphs at the strict-algebra level, finite
trees for the sharp intrinsic-formality theorem, and finite and affine ADE graphs as named
examples.

The development consumes Tau Ceti's path algebra, bound-quiver, projective-module, Euler-form,
and Dynkin-type APIs.  It consumes the general graded Grothendieck, DG, `A∞`, Hochschild, transfer,
and Calabi--Yau interfaces from the sibling roadmaps rather than introducing local substitutes.

Suggested homes in Tau Ceti are `TauCeti/RepresentationTheory/Quiver/Zigzag/` for doubled graphs
and strict zigzag algebras, `TauCeti/RepresentationTheory/Quiver/Preprojective/` for additive
preprojective algebras, and `TauCeti/Algebra/Homology/Ginzburg/` for their DG and Calabi--Yau
comparisons.  The mathematical dependency order below is fixed even if the final file split is
different.

## Scope boundary

This roadmap constructs:

- affine simply-laced Dynkin diagrams on the native carrier, their null-vector/completeness
  comparisons, and the graph data consumed by the algebraic layers below;
- doubled quivers attached to finite simple graphs and symmetrifications of finite quivers;
- ordinary and skew zigzag algebras, including the one-vertex, one-edge, and non-bipartite cases;
- their gradings, bases, dimensions, centers, Frobenius traces, projectives, graded Cartan
  matrices, and convergent `q`-Euler comparisons;
- additive preprojective algebras, their local relations, and orientation/sign independence;
- quadratic, classical Koszul, and derived `A∞` Koszul duality under separately stated
  hypotheses;
- 2-dimensional Ginzburg DG algebras, ordinary and completed versions, and their relation to
  Calabi--Yau completions;
- the distinct 3-dimensional Ginzburg construction for a quiver with potential;
- Hochschild classes, DG deformations, minimal `A∞` deformations, transferred products, and
  intrinsic formality;
- the characteristic-zero finite-ADE-versus-non-ADE theorem for finite trees; and
- the published braid actions by complexes of bimodules and their precise spherical-twist
  comparison.

It does not construct the following research-specific material:

- a finiteness conjecture for affine `E₈`;
- a categorical quotient by the affine null root or any categorical delta quotient;
- a distinguished Hopf algebra or a choice of Hopf action;
- a categorification of a root lattice, the Leech lattice, or any rank-24 lattice;
- geometric McKay correspondence, quiver varieties, or surface resolutions; or
- the polynomial/exterior skew-group-algebra construction itself, which belongs to the algebraic
  McKay roadmap.

The affine examples here are unconditional calculations about graph-indexed algebras.  Nothing in
their inclusion asserts the excluded finiteness or categorification statements.

## Standing conventions

### Graphs and doubles

- The graph input is a finite `SimpleGraph V`: no loops and no multiple edges.  Definitions are
  componentwise for a disconnected graph.  Results using a common backtrack at every vertex state
  connectedness and nontriviality, or equivalently state the required no-isolated-vertex
  hypothesis.
- The doubled graph quiver has vertices `V` and one arrow `i ⟶ j` for each proof of `G.Adj i j`.
  Symmetry supplies an involutive reverse arrow.  A general oriented quiver `Q` uses Mathlib's
  `Quiver.Symmetrify Q`; this retains multiple arrows and is the input to the preprojective and
  Ginzburg constructions.
- Tau Ceti multiplies paths in **later-factor-first** order.  If `a : i ⟶ j`, then
  `e_j * a = a = a * e_i`, and left modules are quiver representations.  Every displayed product,
  corner relation, projective, and matrix is translated to this convention.

### Coefficients and gradings

- The base coefficient is a field `k` unless a theorem is explicitly proved over a commutative
  ring.  Basis, trace, and symmetric-Frobenius results are proved over every field, including
  characteristic two.
- Strict zigzag algebras carry path-length grading: vertex idempotents have degree `0`, arrows
  degree `1`, and volume/backtrack classes degree `2`.  The rank-one generator also has degree
  `2`.
- Additive preprojective algebras carry path length with every doubled arrow in degree `1`.
- A DG object has a cohomological grading and, where needed, a separate Adams/path grading.  The
  differential has bidegree `(1,0)`.  Forgetting the Adams grading may force completion; the
  ordinary and completed statements are never interchanged silently.
- The internal shift is normalized by `[M{1}] = q[M]`.  A graded Cartan entry records
  `∑_d q⁻ᵈ dim Hom(P_i,P_j{d})`, equivalently `∑_d q^d dim Hom(P_i{d},P_j)`, in the
  left-module convention fixed by the Grothendieck/Euler
  roadmap.

### The low-rank zigzag definitions

For a connected simple graph with at least three vertices, `Z_k(G)` is the path algebra of the
doubled graph modulo:

1. every length-two path whose endpoints differ;
2. the difference of any two length-two backtracks based at the same vertex.

These quadratic relations imply that every path of length at least three vanishes.  For a uniform
quotient implementation, the defining relation set may also contain all paths of length at least
three, and the redundancy theorem for graphs with at least three vertices is part of the API.

The two exceptional connected graphs use the conventions of Huerfano--Khovanov and
Liu--Wang:

- `A₁`: `Z_k(A₁) = k[x]/(x²)` with `deg x = 2`;
- `A₂`: the path algebra of the two-arrow double modulo every path of length greater than `2`.

Thus `A₁` is not obtained from a double having no arrows, and `A₂` is not an ordinary quadratic
algebra generated in degree one.  Any theorem about quadratic presentations, quadratic duals, or
classical Koszulity explicitly excludes these two presentations unless it supplies a separate
low-rank formulation.

### Four algebraic layers which remain distinct

| Layer | Object | Equality retained |
|---|---|---|
| strict algebra | `Z_k(G)` with only `μ₂` | the graph quotient and path grading |
| DG enhancement / dual | `Π₂(Q)` or another specified DG algebra | differential and both gradings |
| minimal `A∞` deformation | `(Z_k(G), μ₂, μ₃, …)` with `μ₁=0` | the underlying graded space and `μ₂` |
| transferred model | cohomology of a specified DG/`A∞` object plus contraction data | an `A∞` quasi-isomorphism class |

A transferred model can be a deformation of the strict algebra, but it is not definitionally the
strict algebra and is not determined before the source object and transfer data are named.
Intrinsic formality says that the relevant minimal deformations are `A∞`-isomorphic to the strict
one; it does not erase these types from the formalization.

### Downstream skew-group convention

For a finite subgroup `Γ ⊂ SU(2)` containing `−I` whose McKay graph is a simple graph (every
such `Γ` except `C₂ = {±I}`), the exterior skew group algebra `Λ(C²) ⋊ Γ` is Morita equivalent
to the **ordinary zigzag algebra of the affine ADE McKay graph**.  For an odd cyclic subgroup of
order at least `3`, the basic algebra has an odd-cycle skew-zigzag relation in which the two
backtracks sum to zero.  It is not the ordinary odd-cycle zigzag algebra over characteristic zero.
The algebraic McKay roadmap therefore consumes:

- the ordinary zigzag algebra of the McKay graph when `−I ∈ Γ` and the McKay graph is simple; and
- the explicitly parameterized skew-zigzag algebra for odd cyclic groups of order at least `3`.

The two remaining groups are not passed through a simple-graph zigzag algebra, and their actual
presentations belong to the McKay roadmap (McKaySkewGroup §4.1–4.2).  For `Γ = C₂` the McKay
diagram is `Ã₁`, two vertices joined by a double edge: `Λ(C²) ⋊ C₂` has dimension `8` with two
degree-one arrows in each direction, while the zigzag algebra of the one-edge simple graph has
dimension `2·2 + 2·1 = 6`.  For `Γ = 1`, `Λ(C²)` has dimension `4`, while the `A₁` zigzag algebra
`k[x]/(x²)` has dimension `2`.  The convention does not use “affine zigzag” as a name that hides
these distinctions.  In characteristic two the sign distinction collapses, and that specialization
is stated separately.

**Checks.**

- `Γ = C₄` (contains `−I`): the McKay graph is the `4`-cycle, and both `Λ(C²) ⋊ C₄` and the
  zigzag algebra of the `4`-cycle have dimension `4·4 = 2·4 + 2·4 = 16`; a convention that sent
  even cyclic groups to the skew class would change the backtrack sign but not this count, so the
  sign is pinned by the rescaling along a two-colouring.
- `Γ = C₂`: the multiplicity matrix of `V ⊗ −` on the two simples is `[[0,2],[2,0]]`, not the
  adjacency matrix `[[0,1],[1,0]]` of a simple graph; the dimensions `8 ≠ 6` above exclude the
  one-edge zigzag algebra.
- `Γ = 1`: the multiplicity matrix is `[2]`, a loop of multiplicity two, so no simple graph is
  attached; the dimensions `4 ≠ 2` exclude the `A₁` convention.

## Existing foundations and formalization boundary

### Mathlib material to consume

- `SimpleGraph`, connectedness, bipartiteness, graph isomorphisms, finite edge sets, adjacency
  matrices, and the named finite graph constructions;
- `Quiver`, `Quiver.Path`, `Quiver.Symmetrify`, `Quiver.HasInvolutiveReverse`, and path reversal;
- `TwoSidedIdeal.span`, `TwoSidedIdeal.asIdeal`, the supplied `Ideal.IsTwoSided` instance, and ideal
  quotients;
- graded objects, polynomials and Laurent polynomials, matrices, bases, bilinear forms, tensor
  algebras, homological complexes, and derived categories;
- Mathlib's Cartan matrices and root-system infrastructure.

Relation-generated noncommutative quotients use `TwoSidedIdeal`, not a private closure predicate.
The open path/category-algebra work in
[#22809](https://github.com/leanprover-community/mathlib4/pull/22809), the homogeneous-quotient
work in [#36501](https://github.com/leanprover-community/mathlib4/pull/36501), and the graded
`A∞`-quiver work beginning at
[#40984](https://github.com/leanprover-community/mathlib4/pull/40984) guide compatible interfaces
but are not dependencies.  If a needed interface is absent, Tau Ceti supplies the complete target
in the same mathematical shape and replaces it with the Mathlib declaration when available.

### Tau Ceti material to consume

The landed declarations include:

- `TauCeti.pathAlgebra`, `TauCeti.Quiver.TotalPath`, `TauCeti.pathAlgebraBasis`,
  `TauCeti.PathAlgebra.ofPath`, `ofArrow`, and `vertexIdempotent`;
- multiplication and basis-coordinate lemmas implementing the left-module convention;
- admissible ideals, radical powers, primitive idempotents, semisimple quotients, projective quiver
  representations, and finite-dimensional path-algebra results;
- `TauCeti.eulerForm`, `titsForm`, projective evaluation, and path-count computations; and
- `TauCeti.DynkinType`, its validity and simply-laced predicates, standard finite Cartan
  matrices and Bourbaki numbering;
- the separate native `TauCeti.AffineDynkinType` carrier and its `Basic`, `Star`, `Deletion`
  and `PositiveSemidefinite` modules: affine graphs, Cartan matrices, marks, star models,
  finite-node deletion and singular-semidefinite comparisons; and
- native `SimpleGraph.graphCartanMatrix` and the positive-additive-function energy and
  kernel theorems consumed in Layer0. Extend these same APIs with the coefficient-game
  adapters and affine classification below; do not introduce a second affine family;
- the native implementations of the strict algebras of Layers 1--5, which the headline
  statements consume rather than redeclare: `TauCeti.DoubledQuiver`, `TauCeti.nonisolatedZigzagQuotient`,
  the componentwise public algebra `TauCeti.zigzagAlgebra` (dual numbers on singleton
  components) with its path-length pieces `TauCeti.zigzagAlgebraGrade`,
  `TauCeti.zigzagAlgebraIntegerGrade` and `TauCeti.zigzagAlgebraGradedAlgebra`
  (`TauCeti/RepresentationTheory/Quiver/Zigzag/Componentwise/Basic.lean` and `Grading.lean`),
  the orientations `TauCeti.DoubledQuiver.Orientation` and their quivers
  `TauCeti.DoubledQuiver.OrientedQuiver` (`Zigzag/Orientation.lean`), the additive preprojective
  algebra `TauCeti.preprojectiveAlgebra` and its path-length pieces `TauCeti.preprojectiveGrade`
  (`Preprojective/Basic.lean`, `Preprojective/Grading.lean`), and the finite diagram graph
  `TauCeti.diagramGraph` of a Cartan matrix (`LinearAlgebra/RootSystem/FiniteType/Diagram.lean`);
- the `A∞` carrier `TauCeti.AInfinityAlgebra` (unsuspended operations `m n` of degree `2 - n`,
  `Algebra/Homology/AInfinity/Algebra.lean`), its predicates `IsMinimal` (`m₁ = 0`),
  `StrictUnit` (degree-zero two-sided unit for `m₂` killing every other operation) and
  `IsFormal` (an `A∞` quasi-isomorphism to the cohomology algebra with `m₂` only), and
  `TauCeti.AInfinityHom.isQuasiIso_iff_isIso` (a quasi-isomorphism of minimal algebras is an
  isomorphism), from `Algebra/Minimal.lean`, `Algebra/Unit.lean` and `Algebra/Formal.lean`.

The [quiver-representation roadmap](../RepresentationTheory/QuiverRepresentations/README.md)
owns general path algebras, projectives, bound quivers, and Ringel forms.  This roadmap adds the
specific relation quotients and their homological structure.

### Sibling-roadmap dependencies

The [Grothendieck groups and Euler forms roadmap](../GrothendieckEulerForms/README.md) supplies
graded `K₀`, the shift action, Laurent-polynomial sesquilinearity, finite-support `q`-Euler forms,
and comparison with projective/simple bases.  In particular, a `q`-Euler value is formed only after
cohomological and internal finite-support hypotheses are proved.

The [DG and A-infinity roadmap](../DGAInfinity/README.md) supplies DG and `A∞` algebras and modules,
bar/cobar duality, completion, perfect modules, Hochschild cochains, homological perturbation,
minimal-model transfer, smoothness, Calabi--Yau structures, the derived tensor algebra and the
(deformed) Calabi--Yau completions `Π_n(C)=T_C(C![n-1])`, and derived Morita equivalence.  This
roadmap instantiates those interfaces for zigzag and preprojective data.  It owns no second sign
convention or transfer theorem.  In particular, the sibling's DG and `A∞` module APIs are
right-module primary; the strict left modules used above enter them as right modules over the
opposite algebra.  Its unsuspended operations have cohomological degree `2-n`, satisfy the
Keller/Getzler--Jones `(-1)^(r+s*t)` Stasheff identities, use ordinary multiplication for `m₂`
without a Seidel-style twist, and are strictly unital in the deformation statements below.

---

## The build, in layers

### Layer 0: affine simply-laced diagrams, doubled graphs, relation quotients, and grading descent

- Use native `TauCeti.AffineDynkinType` for the affine simply-laced diagrams, with its node
  count, underlying `SimpleGraph`, and generalized Cartan matrix `2I - A`. Consume its
  connectedness, marked-node deletion maps to the finite `TauCeti.DynkinType` diagrams,
  Bourbaki relabellings and marks `δ` with `Cδ=0` and value1 at the affine node. Consume
  its star comparisons `Ẽ₆=T_{3,3,3}`, `Ẽ₇=T_{2,4,4}`, `Ẽ₈=T_{2,3,6}` and the
  positive-semidefinite/radical theorem. Retain `Ã₁` as the multiplicity-two matrix
  `!![2,-2;-2,2]`, excluding it from simple-graph constructions. The downstream McKay
  roadmap identifies its graphs with these same carriers and owns the representation side.
- **Stuck coefficients and completeness of the affine graph list.** Implement
  the preceding diagram family on native `TauCeti.AffineDynkinType`, with
  its `Valid`, `IsGraphical`, `graph`, `cartanMatrix`, `marks` and
  `affineNode` interfaces. Consume its existing `Basic`, `Star`,
  `Deletion` and `PositiveSemidefinite` modules, including the actual
  star-graph isomorphisms, Bourbaki deletion maps and normalized marks.
  The following targets extend that carrier and its comparisons.

  Let G be a finite connected simple graph on a nonempty vertex type V,
  and use native `G.graphCartanMatrix ℤ`, denoted C=2I−Adj(G). A position
  is a nonzero vector a:V→ℕ, read in ℤ^V. Define the coefficient reflection
  s_i on ℤ^V by changing only coordinate i to
  `Σ_(j∼i)a_j−a_i`; prove `(s_i a)_i=a_i−(Ca)_i` and s_i²=id.
  The reflection is an operation on integer vectors; its value need not
  remain nonnegative. A position is stuck when `(s_i a)_i≤a_i` for every i.
  Prove that this is exactly the coordinatewise inequality Ca≥0. For a
  stuck position, a vertex i is precarious precisely when `(Ca)_i>0`,
  equivalently when its reflected coefficient strictly decreases. Thus a
  stuck position has no precarious vertex iff Ca=0. Prove invariance of
  these statements under the actual vertex/graph relabelling maps.

  Prove zero propagation: if a≥0 and Ca≥0 and a_i=0, every neighbour
  also has coefficient0, and connectedness forces a=0. Consequently a
  nonzero nonnegative integral null vector is strictly positive. Divide
  its coordinates by their gcd to construct the unique positive primitive
  integral null vector δ, with gcd(δ_i)=1. Establish uniqueness through
  the one-dimensional real kernel below, and prove that all nonnegative
  integral null vectors are exactly mδ for m∈ℕ, including m=0; nonzero
  positions have m>0. Prove the integral coefficient claim using the gcd
  identity, not merely that the two vectors are real scalar multiples.
  Compare δ under a diagram isomorphism with the native `marks`; their
  affine-node value1 fixes the primitive normalization. No arbitrary
  vertex is assumed to have mark1 before this comparison.

  Consume `SimpleGraph.two_mul_dotProduct_graphCartanMatrix_mulVec`,
  `posSemidef_graphCartanMatrix` and `ker_mulVecLin_graphCartanMatrix`
  from the existing positive-additive-function theory. With C read over
  ℝ and x an arbitrary real vector, record the transported identity
  `2 xᵀCx=Σ_i Σ_(j∼i) δ_iδ_j(x_i/δ_i−x_j/δ_j)²`.
  The displayed sum counts each unoriented edge twice. These native
  theorems give positive semidefiniteness and ker(C)=ℝδ, hence corank1;
  prove the rational/integer kernel comparison used above. Conversely,
  for a connected G, prove that positive semidefiniteness and singularity
  yield a positive integral null vector: replace a nonzero real null
  vector by its coordinatewise absolute value, use the nonpositive
  off-diagonal entries and positive semidefiniteness to keep it in the
  kernel, then use zero propagation. The one-dimensional kernel of the
  integer matrix has a rational generator; normalize and clear its
  denominators, proving the required sign and scalar-extension equations.
  Thus the stuck/no-precarious criterion and the singular-semidefinite
  criterion are equivalent on these connected finite simple graphs.

  Prove the proper-extension obstruction for actual graph copies, without
  an induced-subgraph assumption. If H is finite and connected and a
  copy f:G→H of an affine graph has either a vertex outside its image or
  an extra H-edge between image vertices, then C_H a≥0 with a≥0 forces
  a=0. Pair the inequalities at f(V) with the positive marks of G: the
  internal terms cancel by C_Gδ=0, leaving the negative sum of the
  nonnegative contributions from boundary and extra edges. Prove that
  properness and connectedness force one coefficient to be zero, and
  apply zero propagation throughout H. Equivalently, a connected graph
  carrying a nonzero nonnegative stuck position can contain an affine
  copy only as the whole graph, with no extra edge. Connectedness is
  essential here; the assertion is not extended to an unrelated component
  of a disconnected graph or to positions with negative coefficients.

  Complete the classification: the existence of a nonzero nonnegative
  stuck position without precarious vertices is equivalent to an actual
  graph isomorphism with `t.graph` for a unique t satisfying `t.Valid`
  and `t.IsGraphical`. The possible types are cycles Ã_n with n≥2,
  D̃_n with n≥4, and Ẽ₆,Ẽ₇,Ẽ₈. Prove existence and uniqueness of the
  type and supply the vertex, adjacency, Cartan-matrix and mark transports.
  A cycle has length at least3; a cycle copy and the proper-extension
  theorem force equality. A vertex of degree at least4 supplies a D̃₄
  four-leaf-star copy. For a tree with maximum degree3, two trivalent
  vertices supply a D̃_n double-fork copy; an affine position again forces
  equality. Prove that a finite path has no positive additive function.
  The remaining tree has one trivalent vertex and three arms of positive
  edge lengths a≤b≤c. Solve the null equations along each arm, and derive
  `1/(a+1)+1/(b+1)+1/(c+1)=1` at the centre. Prove the complete integer
  solution list `(2,2,2)`, `(1,3,3)`, `(1,2,5)` and compare it with the
  existing `T_{3,3,3}`, `T_{2,4,4}`, `T_{2,3,6}` carriers and marks.
  The one-vertex and one-edge simple graphs have no such position.
  Ã₁ retains its separate multiplicity-two matrix and is excluded from
  this simple-graph classification; a loop is never a simple-graph edge.

  `affine_graph_recognition` states the recognition theorem on the native
  graph and affine-type carriers: for a connected finite simple graph G,
  a nonzero `a : V → ℕ` with `Σ_(j∼i) a_j = 2a_i` at every vertex exists
  iff `G ≃g t.graph` for a unique t with `t.Valid` and `t.IsGraphical`.
  The semidefinite form of this classification is Etingof et al.,
  *Introduction to representation theory*, Problem 5.3(c)–(g), pp. 79–80
  (arXiv v5); the null-vector and stuck-position route above is this
  roadmap's own and uses only the listed native theorems.
  *Needs:* Tau Ceti `TauCeti.AffineDynkinType` (`Basic`, `Star`,
  `PositiveSemidefinite`), `SimpleGraph.graphCartanMatrix` and its
  energy and kernel theorems; Mathlib `SimpleGraph.Connected`,
  `SimpleGraph.IsTree`, graph isomorphisms and `Nat.gcd`.

  Compare with RootSystems Layer5's independently supplied positive-definite
  finite Cartan matrices: a nonzero stuck position there has a precarious
  vertex, since otherwise it would be a nonzero null vector. In the
  simply-laced case use the actual simple-root coefficient identification
  with 2I−Adj and prove that no affine copy can lie in its finite diagram.
  The affine graph construction, additive-function criterion and completeness
  proof above use finite graph and matrix theory, before any later quiver
  representation, Lie-group, compact-group or highest-root application.

  **Checks.**

  - Reflection on the one-edge graph `A₂` at `a = (1,0)`: `(s_0 a)_0 = 0 − 1 = −1`, so the
    reflection leaves `ℕ^V`; `(s_1 a)_1 = 1 > 0 = a_1`, so the position is not stuck, matching
    `Ca = (2,−1) ≱ 0`. A definition that clipped reflected coefficients at zero would hide the
    first value.
  - The triangle at `a = (1,1,1)`: every reflected coefficient is `1 + 1 − 1 = 1 = a_i` and
    `Ca = 0`, so the position is stuck with no precarious vertex, and the triangle is `Ã₂`. The
    vector `(2,2,2)` is also null but has gcd `2`; only `(1,1,1)` is the primitive null vector.
  - Finite `D₄` at `a = (2,1,1,1)` (centre first): the reflected centre coefficient is
    `3 − 2 = 1 < 2` and each leaf gives `2 − 1 = 1`; `Ca = (1,0,0,0)`, so the position is stuck
    and the centre is precarious. This is the finite-type behaviour of the RootSystems
    comparison: no nonzero nonnegative null vector exists.
  - `D̃₄` (four-leaf star) at `a = (2,1,1,1,1)`: `Ca = (4 − 4, 0,0,0,0) = 0`; the gcd is `1` and
    every leaf has value `1`, agreeing with the native marks normalised by the value `1` at the
    affine node.
  - `Ẽ₈ = T_{2,3,6}` with arms of edge lengths `1,2,5`: the null vector has centre `6`, arms
    `3`; `4,2`; `5,4,3,2,1`, and the centre equation is `3 + 4 + 5 = 12 = 2·6`; the arm equation
    `1/2 + 1/3 + 1/6 = 1` holds, while `(1,2,4)` gives `1/2 + 1/3 + 1/5 > 1`, the finite `E₈`.
  - Paths have no positive additive function: on the path with vertices `1,…,n` an endpoint
    forces `a_2 = 2a_1` and then `a_j = j·a_1`, and the other endpoint forces
    `(n−1)a_1 = 2n·a_1`, so `a = 0`; on the one-vertex graph the condition reads `0 = 2a`.
  - Proper extension: the four-leaf star with one extra vertex attached to a leaf is a tree with
    a `D̃₄` copy and a vertex outside it; any `a ≥ 0` with `C_H a ≥ 0` is zero, so the graph is
    not affine although it contains an affine subgraph.


- Define `DoubledQuiver G` for a simple graph and prove the reverse-arrow involution, finiteness of
  arrows, and compatibility with graph isomorphisms, components, adjacency matrices, and
  `Quiver.Symmetrify` after an orientation is chosen.
- Define paths and path-algebra elements attached to vertices, oriented edges, and backtracks.
  Prove all source/target corner identities using Tau Ceti's multiplication convention.
- Package homogeneous relation families by path degree and form their `TwoSidedIdeal.span`.
  Prove the quotient algebra, quotient map, universal property, scalar-algebra structure, and
  functoriality under graph/quiver isomorphism.
- Construct the induced nonnegative grading.  Prove that the relation ideal is homogeneous and
  that multiplication adds degrees.  Compare the direct-sum graded algebra with the ungraded
  quotient rather than postulating an unrelated graded copy.
- Prove component decomposition: the algebra of a finite disjoint union is the finite product of
  the component algebras, with matching grading, basis, center, and trace decompositions.

### Layer 1: strict ordinary and skew zigzag algebras

- Define the uniform relation quotient containing non-returning length-two paths, differences of
  backtracks at one vertex, and paths of length at least three.  Prove agreement with the purely
  quadratic presentation for every connected graph with at least three vertices.  This quotient
  is the component algebra only when the component has an edge; do not expose it as the public
  algebra of an isolated vertex.
- Construct the `A₁` dual-numbers presentation and the `A₂` radical-cube-zero presentation and
  define the uniform public `TauCeti.zigzagAlgebra` as the finite product of the algebras of connected
  components, using the dual numbers precisely on singleton components.  Prove the comparison
  with the relation quotient on every connected component with an edge, without claiming a false
  quadratic presentation.
- For a graph with cyclically ordered or scalar-labelled incident edges, define a skew-zigzag
  algebra by nonzero ratios between backtracks.  State the cocycle/gauge equivalence relation on
  parameters.  For a connected graph with at least three vertices, over a field containing
  square roots, identify **vertex-fixing graded** isomorphism classes with `H¹(G,kˣ)` (Couture,
  Theorem 4.8, using Lemma 4.3 and Proposition 4.4, which assume at least three vertices);
  identify arbitrary graded algebra isomorphism classes only after quotienting that set by
  `Aut(G)` (Couture, Theorem 4.12).  Prove that every skew-zigzag algebra on a tree is isomorphic to the ordinary
  one.
- Work out cycles explicitly.  On an even cycle the exterior-skew relation is gauge-equivalent to
  the ordinary zigzag relation; on an odd cycle over characteristic different from two it is the
  nontrivial skew class.  Record the characteristic-two identification.
- Prove invariance under graph isomorphism.  For a specified field homomorphism, extend every
  parameter by applying the homomorphism and construct the resulting scalar-extension comparison;
  state injectivity or preservation of a classification class only under the hypotheses that make
  the induced map on units (and hence `H¹`) injective.  Normalize the skew Frobenius trace using
  the chosen skew parameters rather than importing the ordinary all-volumes-equal normalization.

### Layer 2: bases, dimensions, centers, and symmetric Frobenius traces

For a connected nontrivial graph, choose no preferred incident edge in the public definitions;
backtrack independence makes the volume element `x_i` at vertex `i` canonical in the quotient.

- Prove that vertex idempotents `e_i`, all oriented arrows, and volumes `x_i` form a homogeneous
  basis, in degrees `0`, `1`, and `2` respectively.  Prove the complete multiplication table,
  radical filtration, socle, and top.
- Deduce
  `dim_k Z_k(G) = 2|V| + 2|E|`.  Give the componentwise correction when isolated vertices are
  present and verify the separate `A₁` convention.
- Define `tr(e_i)=0`, `tr(a)=0`, and `tr(x_i)=1`.  Prove that `tr(xy)=tr(yx)` and that
  `(x,y) ↦ tr(xy)` is a symmetric nondegenerate bilinear form.  Package the resulting symmetric
  Frobenius and self-injective algebra structures.
- Compute the center.  For a connected nontrivial simple graph it has basis `1` together with the
  volumes `x_i`, hence dimension `|V|+1`.  State and prove the rank-one and disconnected formulas.
- Extend the basis, center, and trace calculation to skew parameters, recording exactly which
  central combinations change.

### Layer 3: projectives, graded Cartan matrices, and `q`-Euler forms

- Define the indecomposable graded left projective `P_i = Z e_i`, its simple head, socle, radical
  layers, grading shifts, and all homogeneous `Hom(P_i,P_j{d})` spaces.  Compare with Tau Ceti's
  projective representation under the bound-quiver/module equivalence.
- In the vertex basis, prove the graded Cartan formula

  ```text
  C_G(q) = (1 + q²) I + q A_G,
  ```

  where `A_G` is the adjacency matrix.  Pin rows and columns by an entrywise theorem before using
  matrix notation.  At `q=1` this is the ordinary composition-factor Cartan matrix.
- Interpret this matrix through the graded Grothendieck group from the sibling roadmap.  Prove the
  projective `q`-Hom pairing without invoking an infinite projective resolution.
- Define an Ext `q`-Euler value only for pairs satisfying the sibling roadmap's finite
  cohomological and Laurent support predicates.  Zigzag algebras are self-injective and their
  simples generally have infinite resolutions, so no unconditional integer-valued Ext-Euler form
  on all finite-dimensional modules is asserted.
- In the non-Dynkin classical-Koszul cases, compare the inverse quantum Cartan matrix in a formal
  power-series completion with the graded dimensions on the preprojective side, including the
  substitution `q ↦ -q`.  Keep this completed-series identity separate from Laurent-polynomial
  `q`-Euler values.

### Layer 4: additive preprojective algebras and orientation independence

Let `Q` be a finite quiver and `Q̄ = Quiver.Symmetrify Q`.  For each original arrow
`a : i ⟶ j`, write `a* : j ⟶ i` for its formal reverse.  Define the global relation in Tau Ceti's
path-product convention and also state it as the vertex-corner relations

```text
ρ_i = ∑_{head(a)=i} a a* - ∑_{tail(a)=i} a* a = 0.
```

The implementation proves which displayed word corresponds to “traverse first” under
later-factor-first multiplication.

- Define `Π_k(Q) = kQ̄ / (ρ)` using the two-sided span, its grading, local relations, quotient
  universal property, opposite-algebra comparison, and base change.
- Reverse one chosen original arrow and construct the algebra isomorphism which fixes every other
  doubled arrow and rescales one of the exchanged arrows by `-1`.  Prove that it sends every local
  relation to the corresponding relation.  Compose these maps to prove independence of all
  orientations of a fixed underlying graph, including characteristic two.
- Generalize from signs `{±1}` to an antisymmetric sign function on oriented edges and prove
  independence under the explicit gauge change.  Do not replace this proof by the assertion that
  the defining sum “obviously” has no orientation.
- For finite ADE graphs prove finite-dimensionality and self-injectivity of `Π`; for connected
  non-Dynkin graphs, including affine ADE, prove infinite-dimensionality, the matrix Hilbert
  series `h_Π(t) = (1 − C t + t²)⁻¹` with `C` the adjacency matrix of the doubled quiver, and
  Koszulity, over every field (Etingof--Eu, Theorem 3.4.2).  State the hypotheses excluding loops or handle looped quivers in a
  separate theorem.
- Compare the preprojective relation with the moment-map commutator formula only algebraically;
  no quiver variety is constructed.

### Layer 5: quadratic and Koszul duality

This layer has three different statements.

1. **Quadratic dual.** For a connected simple graph with at least three vertices, compute the
   quadratic dual of strict zigzag as the double-path algebra with the **signless local relation**
   `∑_{j∼i} (i→j→i)=0`.
2. **Comparison with standard preprojective.** For a bipartite graph choose a source--sink
   orientation and give an explicit rescaling isomorphism from the signless relation to the signed
   preprojective relation.  For a non-bipartite graph retain the signless dual as its own algebra;
   analyze the sign/gauge obstruction and characteristic-two collapse rather than calling it
   preprojective without proof.
3. **Classical Koszulity.** For a finite connected simple graph with at least three vertices, prove
   that the path-graded zigzag algebra is Koszul exactly when the graph is not a finite ADE Dynkin
   graph.  In the Koszul cases identify its Koszul dual with the algebra from items 1--2.  State
   finite ADE as the non-Koszul, almost-Koszul case and treat `A₁` and `A₂` through their explicit
   resolutions.

The proof includes the Koszul complexes, exactness, Hilbert-series identities, and handedness of
left and right quadratic duals.  A matrix inverse alone is not used as a definition of duality.

### Layer 6: 2-dimensional Ginzburg DG algebras and Calabi--Yau completion

For a finite quiver `Q`, construct the non-completed 2-dimensional Ginzburg DG algebra
`Π₂(Q)` from the doubled quiver by adjoining a loop `t_i` of cohomological degree `-1` at each
vertex.  In the differential bigrading, original and reverse arrows have bidegree `(0,1)`, loops
have bidegree `(-1,2)`, and `d(t_i)=ρ_i`, with the signed local preprojective relation from Layer
4; hence the differential has bidegree `(1,0)`.

- Prove `d²=0`, the Leibniz signs, the bidegree statement, and `H⁰(Π₂(Q)) ≅ Π_k(Q)`.
- Identify this DG algebra with the derived 2-preprojective / `2`-Calabi--Yau completion
  `Π₂(kQ)`, taking the completion itself from the sibling roadmap's Layer 9 rather than
  constructing a local copy, under Keller's homological-smoothness hypotheses, and state the
  resulting bimodule `2`-Calabi--Yau theorem.  Any finite-Dynkin stable-module-category consequence, together with
  its Frobenius and triangulated hypotheses, belongs to the downstream stable-category roadmap;
  it is not inferred here from the bimodule theorem.
- Construct the length-adic completion and the comparison map from the ordinary tensor/path DG
  algebra.  Record exactly when derived Koszul duality produces the ordinary algebra as a
  bigraded object and when forgetting Adams degree produces the completion.
- For a quiver with potential `(Q,W)`, construct the standard **3-dimensional** Ginzburg DG algebra:
  original arrows in degree `0`, reverse arrows in degree `-1`, loops in degree `-2`, and
  differential given by cyclic derivatives and commutators.  Identify it with the sibling
  roadmap's deformed `3`-Calabi--Yau completion `Π₃(kQ,ξ_W)` under Keller's hypotheses, exhibiting
  the Hochschild class `ξ_W` the potential determines; the deformation input is a hypothesis
  supplied here, not something the sibling produces.
- Keep `Π₂(Q)` and `Γ₃(Q,W)` as distinct public definitions, with a comparison theorem only in
  genuinely matching examples.

### Layer 7: derived Koszul duality, Hochschild classes, and `A∞` deformation theory

Let `Γ` be a finite tree and choose a source--sink orientation `Q`.

- Regrade each zigzag arrow from path degree `1` to bidegree `(1,-1)` before invoking the sibling
  bigraded DG and `A∞` APIs.  Prove the bigraded derived Koszul dualities, with module side and
  opposites pinned:
  `RHom_{Π₂(Q)}(k^{Q₀},k^{Q₀}) ≃ Z(Γ)` and the converse comparison with `Π₂(Q)` (or its
  completion after forgetting Adams degree).  Include `A₁` and `A₂`; this is not the classical
  quadratic claim from Layer 5.
- Construct the small cofibrant bimodule resolution used to compute Hochschild cohomology.  Prove
  the bigraded comparison
  `HH^{2,q}(Π₂(Q),Π₂(Q)) ≅ (Π(Q)/[Π(Q),Π(Q)])_{q+2}` and transport it across derived Koszul
  duality to zigzag Hochschild cohomology.
- Instantiate the sibling roadmap's definitions of a strictly unital minimal `A∞` deformation
  (`μ₁=0` and fixed `μ₂`), gauge/`A∞`-isomorphism, obstruction classes, and its criterion that
  vanishing of Hochschild cohomology in the relevant degrees implies intrinsic formality
  (DGAInfinity Layer 8; Liu--Wang, Theorem 4.2).  The sibling indexes the criterion as
  `HH^{n,2-n}(H,H) = 0` for `n ≥ 3`: Hochschild arity `n`, internal degree `2 - n`.  Prove the
  adapter to the local bigraded index: when every element of `H` of path degree `i` has bidegree
  `(i,-i)`, a cochain `H^{⊗n} → H` in Liu--Wang's `C^{p,q}` has internal degree `p - n` and Adams
  degree `q = -(p - n)`, so `C^{2,q}` consists exactly of arity `n = q + 2` cochains of internal
  degree `2 - n`, and `HH^{2,q}` for `q > 0` is the sibling's `HH^{n,2-n}` for `n = q + 2 ≥ 3`.
  This roadmap adds the zigzag-specific Hochschild comparison; it does not redevelop general
  deformation theory.
- **Positive-degree cyclic quotient.** Let `o` orient a finite connected simple graph `G` and let
  `Π = Π_k(Q_o)` over a field `k`, graded by path length.  Prove
  `preprojective_cyclicQuotient_vanishes_iff`: every element of degree `d ≥ 3` lies in the
  `k`-span of the commutators `xy - yx`, that is `(Π/[Π,Π])_d = 0` for all `d ≥ 3`, exactly when
  `G` is isomorphic to `TauCeti.diagramGraph t.cartanMatrix` for a valid simply-laced
  `TauCeti.DynkinType` `t` and `ringChar k` is not a bad prime for `t` (`IsBadPrime`).  Route:
  `Π_k(Q) = Π_ℤ(Q) ⊗ k` and right exactness give `(Π_k/[Π_k,Π_k]) = Λ_Q ⊗ k` with
  `Λ_Q = Π_ℤ/[Π_ℤ,Π_ℤ]`; Schedler, Theorem 13.1.1 (arXiv v3, p. 62), computes the positive part
  of `Λ_Q` for Dynkin `Q` as a finite group whose nonzero graded pieces are `ℤ/2` (type `D`,
  degrees `m ≡ 0 mod 4`, `m ≤ 2(n-2)`), `ℤ/2,ℤ/3` (`E₆`, `E₇`) and `ℤ/2,ℤ/3,ℤ/5` (`E₈`), and
  zero for type `A`, so `Λ_Q ⊗ k` vanishes in positive degrees exactly away from the listed
  primes; for an extended Dynkin `Q̃` the same theorem splits `Λ_{Q̃}` with a free summand
  `i₀Π_{Q̃}i₀` of infinite rank.  A connected non-Dynkin `G` contains an affine subgraph `G'`
  (a cycle, a four-leaf star, a double fork or `T_{3,3,3}`, `T_{2,4,4}`, `T_{2,3,6}`, by the
  Layer 0 classification), and killing the vertices and arrows outside `G'` sends preprojective
  relations to preprojective relations, giving a graded surjection `Λ_Q ⊗ k ↠ Λ_{Q'} ⊗ k` onto an
  infinite-dimensional positive part (Liu--Wang, Corollary 3.4).  The statement is for oriented
  simple graphs, the input of this roadmap; Liu--Wang state it for every finite connected quiver.
  Through the Hochschild comparison above (`HH^{2,q}(Π₂(Q)) ≅ (Π/[Π,Π])_{q+2}`, Liu--Wang,
  Proposition 3.2) this is the vanishing criterion `HH^{2,q} = 0` for all `q > 0`.
  *Needs:* Tau Ceti `TauCeti.preprojectiveAlgebra`, `TauCeti.preprojectiveGrade`, the base-change
  and orientation-independence results of Layer 4, `TauCeti.diagramGraph`, Layer 0 (affine
  subgraphs of non-Dynkin graphs).
- Define `IsBadPrime t p` for a finite Cartan type: `p = 2` for `D_n`; `p ∈ {2,3}` for `E₆` and
  `E₇`; `p ∈ {2,3,5}` for `E₈`; never for type `A` (and never for the non-simply-laced types,
  which do not occur in the statements).  The argument is `ringChar k`, so characteristic zero is
  never bad.
  - API: `IsBadPrime t 0` is false for every `t`; `IsBadPrime (A n) p` is false for all `p`; for
    `t ∈ {D_n, E₆, E₇, E₈}` and a prime `p ≥ 7`, `IsBadPrime t p` is false.
  - **Checks.**
    - `D₄` in degree `4`: with centre `0` and leaves `1,2,3`, the cyclic classes are the walks
      `x_{ij}` through leaves `i ≠ j`, while a walk returning through the same leaf contains the
      leaf relation and vanishes; the centre relation multiplied by each leaf backtrack gives
      `x₁₂ + x₁₃ = x₁₂ + x₂₃ = x₁₃ + x₂₃ = 0` up to signs.  The relation matrix has determinant
      `±2`: rank `3` over `ℚ` or `𝔽₃`, rank `2` over `𝔽₂`, so `(Π/[Π,Π])₄` has dimension `0`,
      `0`, `1`.  A bad-prime list omitting `2` for type `D` contradicts this.
    - `A₂` over `𝔽₂`: `Π` vanishes in degrees `≥ 2`, so the cyclic quotient vanishes in every
      characteristic; a list making `2` bad for type `A` is refuted.
    - `E₆` over `𝔽₃`: Schedler's list gives `(Λ_{E₆})₆ = ℤ/3`, so `(Π/[Π,Π])₆ ≠ 0` over `𝔽₃`,
      while `(Λ_{E₆})_m ⊗ 𝔽₅ = 0` for all `m ≥ 1`; `5` is bad only for `E₈`.
- Define a **strictly unital minimal `A∞` deformation** of `Z(Γ)` (`IsZigzagAInfinityDeformation`)
  as an `A∞` structure on `TauCeti.zigzagAlgebra k G` whose grading is
  `TauCeti.zigzagAlgebraIntegerGrade k G`, which is minimal, whose `m₂` is the product, and for
  which `1` is a strict unit (Liu--Wang, Definition 4.1), and call `Z(Γ)` **intrinsically formal**
  (`IsIntrinsicallyFormal`) when every such deformation `IsFormal`.  Since a quasi-isomorphism of
  minimal `A∞` algebras is an isomorphism, `IsFormal` for a minimal deformation is
  `A∞`-isomorphism with the strict algebra.  Over a field every homologically unital minimal
  structure is isomorphic to a strictly unital one, so the strict-unit restriction does not change
  the notion.
  - API: the strict algebra (all `m_n = 0` for `n ≠ 2`, from the zero-differential DG algebra)
    satisfies `IsZigzagAInfinityDeformation` and `IsFormal`; a deformation with `m_n = 0` for all
    `n ≥ 3` is formal; the class of deformations is invariant under graph isomorphism.
  - **Checks.**
    - `A₁`: on `k[x]/(x²)` with `deg x = 2`, `m_n(x,…,x)` would have degree `2n + 2 − n = n + 2`,
      which is neither `0` nor `2` for `n ≥ 3`, and the strict unit kills inputs `1`; so every
      deformation has `m_n = 0` for `n ≥ 3` and `A₁` is intrinsically formal in every
      characteristic.  Without the strict-unit condition, `m₄(1,1,1,x)` of degree `0` would be
      allowed.
    - Extended `D₄`: a linear combination of quartic loop operations of closed walks of length
      four (`m₂` the product, `m₄` the loop operation, all other `m_n = 0`) is a deformation in
      this sense, with `m₄` of internal degree `−2` sending four arrows to a volume.  Here the
      degree-`4` cyclic part is nonzero (the centre has four neighbours), so `HH^{2,2} ≠ 0` and
      the vanishing criterion does not apply, as the non-ADE half of the theorem below requires.
    - The Adams grading is automatic: every element of path degree `i` has bidegree `(i,-i)`, so an
      operation of internal degree `2 − n` has Adams degree `n − 2`; a definition imposing a
      separate Adams condition defines the same class.
- For a non-ADE finite tree, choose a nonzero Hochschild class, deform the differential of
  `Π₂(Q)`, and transfer along a specified contraction to obtain a nontrivial minimal `A∞`
  deformation of `Z(Γ)`.  Prove nontriviality modulo `A∞` isomorphism; merely displaying a higher
  multiplication is insufficient (Liu--Wang, §4.4).  The nonzero class is supplied by the
  positive-degree cyclic quotient theorem above.
- Work out Liu--Wang Example 4.7 for extended `D₄`: the cycle
  `β₄ α₁ β₁ α₄` gives an operation `m₄` whose only nonzero values on arrow quadruples (up to one
  common scalar) are
  `m₄(β₄,α₁,β₁,α₄)=β₄α₄`,
  `m₄(α₄,β₄,α₁,β₁)=α₁β₁`,
  `m₄(β₁,α₄,β₄,α₁)=β₁α₁`, and
  `m₄(α₁,β₁,α₄,β₄)=α₄β₄`; all other higher products on arrows vanish.  Verify its Stasheff
  identity and bigrading.  Treat it as a non-ADE test, not as the classification proof.
- Prove Liu--Wang's exact theorem `isIntrinsicallyFormal_zigzagAlgebra_iff`: for a finite tree
  `G` (`G.IsTree`) over a field `k`, path-graded `Z(Γ)` is intrinsically formal exactly when `G`
  is isomorphic to `TauCeti.diagramGraph t.cartanMatrix` for a valid simply-laced `t` and
  `ringChar k` is not bad for `t`: `2` for type `D`, `2` or `3` for `E₆,E₇`, and `2,3,5` for `E₈`
  (Liu--Wang, Theorem 1.1, p. 1).  Sufficiency combines the criterion, the adapter, the derived
  Koszul Hochschild comparison (Liu--Wang, Proposition 4.4) and the cyclic quotient theorem;
  necessity is the nontrivial deformation of the preceding item.  Consequently, over
  characteristic zero it is intrinsically formal exactly for finite ADE trees.
  *Needs:* the derived Koszul dualities and Hochschild comparison above, the positive-degree
  cyclic quotient theorem, DGAInfinity Layers 3 and 8 (transfer, Hochschild criterion), Tau Ceti
  `TauCeti.AInfinityAlgebra` with `IsMinimal`, `StrictUnit`, `IsFormal`,
  `TauCeti.zigzagAlgebra`, `TauCeti.zigzagAlgebraIntegerGrade`.

**Dependencies.** Layer 7 uses Layer 0 (affine subgraphs of non-Dynkin graphs), Layers 1--2 (the strict algebra,
its basis and grading), Layer 4 (preprojective algebras, orientation independence and base
change), Layer 6 (`Π₂(Q)` and its completion), and DGAInfinity Layers 1--3, 8 and 11.

The characteristic-zero conclusion is uniform across `A`, `D`, `E₆`, `E₇`, and `E₈`; the roadmap
does not single out `E₈` as having a special ordinary zigzag formality phenomenon.

### Layer 8: braid complexes and spherical-twist comparisons

- For every vertex `i`, form the two-term graded bimodule complex
  `B_i = [P_i ⊗_k e_i Z ⟶ Z]`, with the first term in cohomological degree `-1`, the second in
  degree `0`, and no internal shift, so multiplication has internal degree `0`.  Pin the inverse
  coevaluation complex as `Z ⟶ (P_i ⊗_k e_i Z){-2}` in cohomological degrees `0,1`; prove the
  coevaluation has internal degree `2`, or state and prove the equivalent shifted convention used
  in the implementation.
- Prove the inverse, commuting, and braid homotopy equivalences:
  `B_i B_j ≃ B_j B_i` for nonadjacent vertices and
  `B_i B_j B_i ≃ B_j B_i B_j` for adjacent vertices.  Deduce an action of the Artin braid group
  of any finite graph on the homotopy/derived category of graded modules.
- Compute the action on graded `K₀` and compare it with the standard reflection representation.
  State faithfulness only in the cases supplied by a published theorem; in particular,
  Khovanov--Seidel proves faithfulness for type `A`, while the existence of the arbitrary-graph
  action does not itself imply faithfulness.
- Work in a specified `k`-linear pretriangulated DG enhancement (DGAInfinity Layers 1 and 5:
  chain-level `Hom` complexes, shifts, cones and the tensor action of finite-dimensional graded
  vector spaces), or in Seidel--Thomas's concrete model of bounded-below complexes of injectives
  (Seidel--Thomas, Definition 2.2, p. 12).  For an object `E` that is bounded and has finite
  **total** graded `Hom` dimension from and to every object (Seidel--Thomas, Definition 2.5
  (K1)--(K2), pp. 13--14), define the twist `T_E(F)` as the chain-level cone of the evaluation
  `hom(E,F) ⊗ E → F`; finiteness of each single `Hom^i` is not enough, since `Hom^i = k` for
  infinitely many `i` makes the evaluation source infinite.  Call `E` `n`-spherical for `n > 0`
  when moreover `Hom^*(E,E) = k ⊕ k[−n]` and composition into `Hom^n(E,E) ≅ k` is a perfect
  pairing (Definition 2.9, p. 15).  For an `A_m`-configuration of `n`-spherical objects
  (one-dimensional total `Hom` for adjacent vertices and zero total `Hom` for nonadjacent ones),
  prove that the twists satisfy the braid relations of `B_{m+1}` up to graded natural isomorphism
  (Theorem 2.17, p. 18), and faithfulness only for `n ≥ 2` (Theorem 2.18, p. 19).  Cones in an
  unenhanced triangulated category do not define a functor, so the enhancement is part of the
  hypothesis.
  *Needs:* DGAInfinity Layers 1, 2 and 5 (DG categories, `A∞` functors, pretriangulated
  envelopes and cones).
  **Checks.**
  - Two `2`-spherical objects with one-dimensional total `Hom` between them: on the span of their
    classes in `K₀` the twists act by `[F] ↦ [F] − χ(E,F)[E]` with `χ(E_i,E_i) = 2` and
    `χ(E₁,E₂) = χ(E₂,E₁) = −1` up to sign, giving the matrices `A = [[−1,1],[0,1]]` and
    `B = [[1,0],[1,−1]]`; both products `ABA` and `BAB` equal `[[0,−1],[−1,0]]`.
  - An object with `Hom^i(E,E) = k` for every even `i ≥ 0` has finite single `Hom` spaces but
    infinite total dimension and does not satisfy (K2).
  - A `0`-spherical object (two-dimensional `Hom^0(E,E) = k[t]/t²`) is excluded by `n > 0`.
  Compare it with the zigzag bimodule complex only after constructing the required graded/Serre
  identification.  Do not call a projective module cohomologically spherical solely because its
  graded endomorphism algebra has two basis elements.
- Prove natural transfer of the action through a **supplied** Morita or derived equivalence,
  including the derived-Koszul comparison when its hypotheses hold.  The downstream McKay roadmap
  constructs the exterior-skew-group equivalence and instantiates this abstract transfer theorem.

---

## Named examples and acceptance criteria

Every example is computed from the general definitions.

### `A₁` and `A₂`

- Verify the dual-numbers basis `{1,x}`, `x²=0`, `deg x=2`, dimension `2`, center dimension `2`,
  trace, and Cartan polynomial `[1+q²]` for `A₁`.
- For `A₂`, verify the six-element basis, radical cube zero, center dimension `3`, and

  ```text
  C_A₂(q) = [1+q²    q  ]
  [   q   1+q²].
  ```

- Exhibit why omitting the cubic paths from the `A₂` ideal gives an infinite-dimensional algebra.

### `D₄`, `E₈`, and affine `E₈`

- Use `TauCeti.DynkinType.cartanMatrix` to construct the finite `D₄` and `E₈` graphs with Bourbaki
  labels.  Compute their zigzag dimensions and center dimensions:
  `dim Z(D₄)=14`, `dim Z(E₈)=30`, `dim center Z(D₄)=5`, and
  `dim center Z(E₈)=9`.
- Take affine `E₈` from the Layer 0 family: the nine-vertex tree `T_{2,3,6}`, with arms of edge
  lengths `1,2,5` from the trivalent vertex.  Prove that the concrete nine-vertex graph used in
  the calculations agrees with the Layer 0 `Ẽ₈` under an explicit relabelling, and that deleting
  its affine node gives Tau Ceti's `DynkinType.E8` diagram.  Compute `dim Z(Ẽ₈)=34` and center
  dimension `10`.
- Materialize all three graded Cartan matrices as
  `(1+q²)I+qA`.  Verify entrywise symmetry, diagonal and adjacency entries, and the exact
  Bourbaki/affine labels.  At `q=-1`, prove that affine `E₈` specializes to its singular affine
  Cartan matrix, while the Laurent-polynomial matrix has nonzero determinant.
- Construct chosen source--sink orientations, their preprojective relations, and the explicit
  signless/signed quadratic-dual comparison.  Verify finite-dimensionality for finite `D₄,E₈`
  preprojective algebras and infinite-dimensionality/Koszulity for affine `E₈`.
- Apply the characteristic-zero intrinsic-formality theorem to `D₄` and `E₈`, and apply the
  non-ADE half to affine `E₈`; these are instances of one finite-tree theorem.

### A non-bipartite graph

- Compute the ordinary and skew zigzag presentations for an odd cycle, their gauge invariant,
  bases, traces, and centers.
- Compute the signless quadratic dual and show exactly why the source--sink preprojective
  comparison is unavailable over characteristic different from two.
- Match the skew version, not the ordinary version, with the odd-cyclic exterior skew group
  algebra used downstream.

## Primary references

- Huerfano--Khovanov, [*A category for the adjoint
  representation*](https://arxiv.org/abs/math/0002060): strict and skew zigzag algebras, low-rank
  conventions, bases, trace, quantum Cartan matrices, quadratic duals, McKay Morita equivalence,
  and graph braid actions.
- Ehrig--Tubbenhauer, [*Algebraic properties of zigzag
  algebras*](https://arxiv.org/abs/1807.11173): bases, graded Cartan matrices, symmetric Frobenius
  structure, projectives, and representation-theoretic structure.
- Couture, [*Skew-Zigzag Algebras*](https://arxiv.org/abs/1509.08405) (arXiv v2), Theorems 4.8
  and 4.12, with Lemma 4.3 and Proposition 4.4 for graphs with at least three vertices: parameter
  gauge equivalence, graph cohomology, and the distinction between vertex-fixing and arbitrary
  graded algebra isomorphisms.
- Etingof--Eu, [*Koszulity and the Hilbert series of preprojective
  algebras*](https://arxiv.org/abs/math/0512287) (arXiv v1), Theorem 3.4.2: non-Dynkin
  Koszulity and the Hilbert series `(1 − Ct + t²)⁻¹` over every field.
- Crawley-Boevey, [*Quiver algebras, weighted projective lines, and the Deligne--Simpson
  problem*](https://www.mathunion.org/fileadmin/ICM/Proceedings/ICM2006.2/ICM2006.2.ocr.pdf):
  additive/deformed preprojective conventions and orientation independence.
- Etgü--Lekili, [*Koszul duality patterns in Floer
  theory*](https://arxiv.org/abs/1502.07922): the 2-dimensional Ginzburg model, derived Koszul
  duality, completion, and formality comparisons.
- Keller, [*Deformed Calabi--Yau completions*](https://arxiv.org/abs/0908.3499): derived
  Calabi--Yau completions and the 3-dimensional Ginzburg construction.
- Liu--Wang, [*A-infinity deformations of zigzag algebras via Ginzburg dg
  algebras*](https://arxiv.org/abs/2301.06757) (arXiv v3): Definition 4.1 (deformations and
  intrinsic formality), Theorem 4.2 (criterion), Propositions 3.2 and 4.4 (Hochschild
  comparisons), Corollary 3.4 (cyclic quotient criterion), Theorem 1.1 (the finite-tree theorem in
  arbitrary characteristic) and Example 4.7.
- Khovanov--Seidel, [*Quivers, Floer cohomology, and braid group
  actions*](https://arxiv.org/abs/math/0006056): two-term bimodule complexes and the faithful type
  `A` braid action.
- Seidel--Thomas, [*Braid group actions on derived categories of coherent
  sheaves*](https://arxiv.org/abs/math/0001043) (arXiv v2): Definitions 2.2, 2.5 and 2.9
  (the injective model, the finiteness conditions and spherical objects), Theorems 2.17 and 2.18
  (braid relations, and faithfulness for `n ≥ 2`).
- Schedler, [*Zeroth Hochschild homology of preprojective algebras over the
  integers*](https://arxiv.org/abs/0704.3278) (arXiv v3), Theorem 13.1.1, p. 62: the torsion of
  `Π/[Π,Π]` in the Dynkin and extended Dynkin cases and its bad primes.
- Etingof, Golberg, Hensel, Liu, Schwendner, Vaintrob, Yudovina, [*Introduction to
  representation theory*](https://arxiv.org/abs/0901.0827) (arXiv v5), Problem 5.3(c)–(g),
  pp. 79–80: the Dynkin and affine Dynkin graphs through definite and semidefinite forms.
