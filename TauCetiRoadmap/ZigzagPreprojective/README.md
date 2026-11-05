# Roadmap: zigzag, preprojective, and Ginzburg algebras

**Summary.** Zigzag algebras are finite-dimensional symmetric quotients of doubled-graph path algebras.
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

## Scope and ownership

This roadmap constructs:

- affine simply-laced Dynkin diagrams on the native carrier, their null-vector/completeness
  comparisons, and the graph data consumed by the algebraic layers below;
- doubled quivers attached to finite simple graphs and symmetrifications of finite quivers;
- ordinary and skew zigzag algebras, including the one-vertex, one-edge, and non-bipartite cases;
- their gradings, bases, dimensions, centers, Frobenius traces, projectives, graded Cartan
  matrices, and convergent `q`-Euler comparisons;
- additive preprojective algebras, their local relations, orientation/sign independence, and their
  self-injectivity in Dynkin type through the Baer--Geigle--Lenzing algebra; the Auslander--Reiten
  translate and the Nakayama functor that construction uses are the Artin algebras roadmap's
  (ArtinAlgebras §4.1 and §2.3);
- the zigzag and preprojective instances of quadratic, classical Koszul and derived `A∞` Koszul
  duality under separately stated hypotheses; the Koszul predicate and its general theorems are
  the DG and `A∞` roadmap's and the Grothendieck/Euler roadmap's;
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

## Conventions

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

## Exact supplier contracts

### From Mathlib

- `SimpleGraph`, connectedness, bipartiteness, graph isomorphisms, finite edge sets, adjacency
  matrices, and the named finite graph constructions;
- `Quiver`, `Quiver.Path`, `Quiver.Symmetrify`, `Quiver.HasInvolutiveReverse`, and path reversal;
- `TwoSidedIdeal.span`, `TwoSidedIdeal.asIdeal`, the supplied `Ideal.IsTwoSided` instance, and ideal
  quotients;
- graded objects, polynomials and Laurent polynomials, matrices, bases, bilinear forms, tensor
  algebras, homological complexes, and derived categories;
- Mathlib's Cartan matrices and root-system infrastructure.

Relation-generated noncommutative quotients use `TwoSidedIdeal`, not a private closure predicate.
If a needed interface is absent, Tau Ceti supplies the complete target in the same mathematical
shape and replaces it with the Mathlib declaration when available.

### From Tau Ceti

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
  kernel theorems consumed in Layer 0. Extend these same APIs with the coefficient-game
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
  isomorphism), from `Algebra/Minimal.lean`, `Algebra/Unit.lean` and `Algebra/Formal.lean`;
- the corner map `TauCeti.cornerMap k e f`, `x ↦ e x f`, and the corner submodule
  `TauCeti.cornerSubmodule` (`RingTheory/Idempotents/Corner.lean`), on which the graded corners of
  Layer 5 are built;
- Gabriel's theorem over every field,
  `TauCeti.isFiniteRepType_iff_card_hom_add_card_hom_le_one_and_exists_dynkinType_iso`
  (`RepresentationTheory/Quiver/FiniteRepType/Gabriel.lean`): a finite connected quiver has finite
  representation type exactly when it is an oriented simply-laced Dynkin diagram, consumed by the
  self-injectivity target of §4.2;
- Frobenius functionals: `LinearMap.IsFrobeniusFunctional φ` (the pairing `(a, b) ↦ φ(ab)` is
  nondegenerate), the bijection `TauCeti.frobeniusFunctionalEquivDualEquiv` between the Frobenius
  functionals on a finite-dimensional algebra and the isomorphisms of its regular right module with
  its dual, and `LinearMap.IsFrobeniusFunctional.moduleInjective_self` with
  `LinearMap.IsFrobeniusFunctional.moduleInjective_op_self`: a finite-dimensional algebra over a
  field carrying a Frobenius functional is injective as a left and as a right module over itself
  (`Algebra/Algebra/Frobenius/Basic.lean`), consumed by the self-injectivity target of §4.2;
- the native Layer 6 constructions, consumed rather than rebuilt: the two-dimensional Ginzburg
  differential `TauCeti.ginzburgTwoDifferential` with `TauCeti.isDGAlgebra_ginzburgTwoDifferential`,
  `TauCeti.ginzburgTwoDifferential_sq_zero` and the Adams grading `TauCeti.ginzburgTwoAdamsDegree`
  (`Algebra/Homology/Ginzburg/Basic.lean`), the zeroth cohomology
  `TauCeti.preprojectiveEquivGinzburgTwoCohomologyZero` (`Ginzburg/ZerothCohomology.lean`), the
  completed algebra `TauCeti.completedGinzburgTwo` with the comparison
  `TauCeti.ginzburgTwoToCompleted`, `TauCeti.ginzburgTwoToCompleted_injective` and
  `TauCeti.mem_range_ginzburgTwoToCompleted_iff` (`Ginzburg/Completion.lean`), and the
  three-dimensional differential `TauCeti.ginzburgThreeDifferential` with
  `TauCeti.isDGAlgebra_ginzburgThreeDifferential` and the cyclic derivative
  `TauCeti.PathAlgebra.cyclicDerivative` (`Ginzburg/ThreeDimensional.lean`,
  `RepresentationTheory/Quiver/PathAlgebra/CyclicDerivative.lean`);
- the native Layer 7 deformations: the loop deformations `TauCeti.zigzagLoopAInfinityAlgebra`
  (`RepresentationTheory/Quiver/Zigzag/AInfinity/Loop.lean`) and Liu--Wang's affine `D₄` example
  `TauCeti.liuWangAffineD4AInfinityAlgebra` with `TauCeti.liuWangAffineD4AInfinityAlgebra_m_four_values`,
  `TauCeti.isMinimal_liuWangAffineD4AInfinityAlgebra`,
  `TauCeti.strictUnit_one_liuWangAffineD4AInfinityAlgebra` and
  `TauCeti.isHomogeneous_liuWangAffineD4AInfinityAlgebra_m_adams` (`AInfinity/AffineD4.lean`);
- the native Layer 8 complexes: `TauCeti.zigzagBraidComplex` and `TauCeti.zigzagBraidInverseComplex`
  with their differentials `TauCeti.zigzagBraidEvaluationHom` and `TauCeti.zigzagBraidCoevaluationHom`,
  the gradings `TauCeti.zigzagEnvelopingGrading` on `Z ⊗ Zᵐᵒᵖ`, the degree statement
  `TauCeti.isHomogeneous_zigzagBraidCoevaluation` and the Casimir element `TauCeti.zigzagCasimir`
  (`Zigzag/Braid/Basic.lean`, `Zigzag/Componentwise/Casimir.lean`).

### From TauCetiRoadmap.QuiverRepresentations, GrothendieckEulerForms and DGAInfinity

The [quiver-representation roadmap](../RepresentationTheory/QuiverRepresentations/README.md)
owns general path algebras, projectives, bound quivers, and Ringel forms.  Its Layer 1 identifies
representations with left `kQ`-modules, which §4.2 uses.  This roadmap adds the specific relation
quotients and their homological structure.

The [Grothendieck groups and Euler forms roadmap](../GrothendieckEulerForms/README.md) supplies
graded `K₀`, the shift action, Laurent-polynomial sesquilinearity, finite-support `q`-Euler forms,
and comparison with projective/simple bases.  In particular, a `q`-Euler value is formed only after
cohomological and internal finite-support hypotheses are proved.  Its Layer 3 supplies linear
graded projective resolutions, their equivalence with the diagonal vanishing of bigraded `Ext` and
with the inversion of the graded Cartan and Poincaré series up to `q ↦ −q`: the vocabulary in
which the Koszulity of Layer 5 is stated.

The [DG and A-infinity roadmap](../DGAInfinity/README.md) supplies DG and `A∞` algebras and modules,
bar/cobar duality, completion, perfect modules, Hochschild cochains, homological perturbation,
minimal-model transfer, smoothness, Calabi--Yau structures, the derived tensor algebra and the
(deformed) Calabi--Yau completions `Π_n(C)=T_C(C![n-1])`, derived Morita equivalence, and, in its
Layer 11, the Koszul predicate on graded right modules over a quadratic algebra `T_S(V)/(R)` with
its quadratic dual `A^! = T_S(V^∨)/(R^⊥)`, the theorems that a Koszul algebra is quadratic, that
its dual is Koszul and is the Yoneda algebra `Ext^*_A(S,S)`, and the double-dual comparison
under its dualizability hypotheses.  This
roadmap instantiates those interfaces for zigzag and preprojective data.  It owns no second sign
convention or transfer theorem.  In particular, the sibling's DG and `A∞` module APIs are
right-module primary; the strict left modules used above enter them as right modules over the
opposite algebra.  Its unsuspended operations have cohomological degree `2-n`, satisfy the
Keller/Getzler--Jones `(-1)^(r+s*t)` Stasheff identities, use ordinary multiplication for `m₂`
without a Seidel-style twist, and are strictly unital in the deformation statements below.

### From TauCetiRoadmap.ArtinAlgebras

The Artin algebras roadmap owns the Auslander--Reiten translate `τ = D Tr` and its inverse
`τ⁻ = Tr D` of a finitely generated module over an Artin algebra (its §4.1: formed from a minimal
projective presentation, independent of the presentation, with `τ M = 0` exactly for `M`
projective) and the Nakayama functor `ν = D Hom_A(−, A)` (its §2.3: an equivalence from finitely
generated projective to finitely generated injective modules).  Over a field these are the pinned
`TauCeti.AuslanderReitenTranslate`, the dual of the transpose `TauCeti.AuslanderReitenTranspose` of
a presentation (`Algebra/Module/AuslanderReiten/Transpose.lean` and `Translate.lean`), and, on
pointwise finite-dimensional quiver representations, `TauCeti.arTranslate`
(`RepresentationTheory/Quiver/Representation/Translate.lean`).  §4.2 consumes them for the
hereditary path algebra `kQ` and proves only their hereditary description, Serre duality and the
preprojectivity of the injective modules of a Dynkin quiver.

## How to read the build

The layers are in build order.  Layer 0 fixes the graph-theoretic input: the affine simply-laced
diagrams on the native carrier, doubled quivers, relation quotients and grading descent.  Layers
1--3 deliver the strict zigzag algebras, ordinary and skew, with their bases, traces, centres,
projectives and graded Cartan matrices; Layer 4 the additive preprojective algebras with
orientation independence, the finite/infinite dichotomy and the non-Dynkin Hilbert series; Layer 5
quadratic and classical Koszul duality between the two.  Layer 6 passes to the differential graded
level with the two- and three-dimensional Ginzburg algebras and their Calabi--Yau completions;
Layer 7 proves derived Koszul duality, the Hochschild comparison and Liu--Wang's intrinsic
formality theorem; Layer 8 delivers the braid actions by bimodule complexes and their comparison
with spherical twists.  Each layer ends with its examples and its dependencies on the earlier
layers and the suppliers.

## Layer 0: affine simply-laced diagrams, doubled graphs, relation quotients, and grading descent

### 0.1 Affine simply-laced diagrams and the recognition theorem

- Use native `TauCeti.AffineDynkinType` for the affine simply-laced diagrams, with its node
  count, underlying `SimpleGraph`, and generalized Cartan matrix `2I - A`. Consume its
  connectedness, marked-node deletion maps to the finite `TauCeti.DynkinType` diagrams,
  Bourbaki relabellings and marks `δ` with `Cδ=0` and value 1 at the affine node. Consume
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
  also has coefficient 0, and connectedness forces a=0. Consequently a
  nonzero nonnegative integral null vector is strictly positive. Divide
  its coordinates by their gcd to construct the unique positive primitive
  integral null vector δ, with gcd(δ_i)=1. Establish uniqueness through
  the one-dimensional real kernel below, and prove that all nonnegative
  integral null vectors are exactly mδ for m∈ℕ, including m=0; nonzero
  positions have m>0. Prove the integral coefficient claim using the gcd
  identity, not merely that the two vectors are real scalar multiples.
  Compare δ under a diagram isomorphism with the native `marks`; their
  affine-node value 1 fixes the primitive normalization. No arbitrary
  vertex is assumed to have mark 1 before this comparison.

  Consume `SimpleGraph.two_mul_dotProduct_graphCartanMatrix_mulVec`,
  `posSemidef_graphCartanMatrix` and `ker_mulVecLin_graphCartanMatrix`
  from the existing positive-additive-function theory. With C read over
  ℝ and x an arbitrary real vector, record the transported identity
  `2 xᵀCx=Σ_i Σ_(j∼i) δ_iδ_j(x_i/δ_i−x_j/δ_j)²`.
  The displayed sum counts each unoriented edge twice. These native
  theorems give positive semidefiniteness and ker(C)=ℝδ, hence corank 1;
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
  A cycle has length at least 3; a cycle copy and the proper-extension
  theorem force equality. A vertex of degree at least 4 supplies a D̃₄
  four-leaf-star copy. For a tree with maximum degree 3, two trivalent
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

  Compare with the finite recognition theorem
  `SimpleGraph.posDef_graphCartanMatrix_iff` (Tau Ceti,
  `LinearAlgebra/RootSystem/FiniteType/SimpleGraph.lean`): for a connected
  finite simple graph, `2I−Adj` is positive definite over `ℚ` exactly when the
  graph is isomorphic to `TauCeti.diagramGraph t.cartanMatrix` for a valid
  simply-laced `TauCeti.DynkinType` `t`. On such a graph a nonzero stuck
  position has a precarious vertex, since `aᵀCa > 0` for `a ≠ 0` forces some
  `(Ca)_i > 0`; prove that no affine copy can lie in a finite simply-laced
  diagram, by the proper-extension obstruction. The affine graph construction,
  additive-function criterion and completeness proof above use finite graph
  and matrix theory, before any later quiver representation, Lie-group,
  compact-group or highest-root application.

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
    and the centre is precarious. This is the finite-type behaviour of the positive-definite
    comparison: `aᵀCa = 2·1 = 2 > 0` and no nonzero nonnegative null vector exists.
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


### 0.2 Doubled quivers, relation quotients and grading descent

The doubled quiver, its path-algebra elements, the relation quotients and the grading descent are
native: consume `TauCeti.DoubledQuiver` with `TauCeti.DoubledQuiver.totalArrowEquivDart`,
`TauCeti.DoubledQuiver.card_hom_eq_adjMatrix` and `TauCeti.DoubledQuiver.map`
(`RepresentationTheory/Quiver/Zigzag/Basic.lean`), the orientations
`TauCeti.DoubledQuiver.Orientation` with `TauCeti.DoubledQuiver.symmetrifyMap` and
`unsymmetrifyMap` comparing `Quiver.Symmetrify` of an oriented quiver with the double
(`Zigzag/Orientation.lean`), the relator families `TauCeti.IsZigzagRelator` and
`TauCeti.IsQuadraticZigzagRelator` (`Zigzag/Admissible.lean`, `Zigzag/ArrowIdealPresentation.lean`),
the ideals `TauCeti.zigzagIdeal` and `TauCeti.quadraticZigzagIdeal` as two-sided spans, the
quotient `TauCeti.nonisolatedZigzagQuotient` with `TauCeti.zigzagMk` and `TauCeti.zigzagLift`
(`Zigzag/Relations.lean`), the descended grading
`TauCeti.zigzagGrade` with `TauCeti.isHomogeneous_zigzagIdeal` and `TauCeti.zigzagGradedAlgebra`
(`Zigzag/Grading.lean`), the relabelling isomorphisms `TauCeti.nonisolatedZigzagQuotientEquiv`
(`Zigzag/Isomorphism.lean`) and the componentwise product `TauCeti.zigzagAlgebra`
(`Zigzag/Componentwise/Basic.lean`).  The statements they realise are:

- `DoubledQuiver G` for a simple graph has an involutive reverse arrow, finitely many arrows, and is
  compatible with graph isomorphisms, components, adjacency matrices, and `Quiver.Symmetrify` after
  an orientation is chosen.
- Paths and path-algebra elements attached to vertices, oriented edges, and backtracks satisfy the
  source/target corner identities in Tau Ceti's multiplication convention.
- Homogeneous relation families, packaged by path degree, span a `TwoSidedIdeal`; the quotient
  algebra has its quotient map, universal property, scalar-algebra structure, and functoriality
  under graph/quiver isomorphism.
- The induced nonnegative grading: the relation ideal is homogeneous, multiplication adds degrees,
  and the direct sum of the pieces is the ungraded quotient itself rather than an unrelated graded
  copy.
- Component decomposition: the algebra of a finite disjoint union is the finite product of the
  component algebras, with matching grading, basis, centre, and trace decompositions.

*Needs:* Mathlib `Quiver.Symmetrify`, `Quiver.HasInvolutiveReverse`, `TwoSidedIdeal.span`;
Tau Ceti `TauCeti.pathAlgebra`, `TauCeti.PathAlgebra.grade`; QuiverRepresentations (path algebras
and bound quivers).

### Examples

- The triangle `Ã₂` at `a = (1,1,1)` and finite `D₄` at `a = (2,1,1,1)` are the two sides of the
  stuck-position criterion in the Checks above; the four-leaf star with a pendant vertex is the
  proper-extension negative control.
- The doubled quiver of the one-edge graph has two arrows and one backtrack at each vertex; the
  doubled quiver of the triangle has six arrows and its adjacency matrix is `J − I`.

### Dependencies

Layer 0 uses Mathlib's simple graphs, quivers and two-sided ideals, Tau Ceti's path algebras,
`TauCeti.AffineDynkinType`, `TauCeti.DynkinType`, `TauCeti.diagramGraph`,
`SimpleGraph.graphCartanMatrix` with its energy and kernel theorems, and
`SimpleGraph.posDef_graphCartanMatrix_iff`.  It uses no later layer and no sibling roadmap beyond
QuiverRepresentations.

## Layer 1: strict ordinary and skew zigzag algebras

### 1.1 The uniform quotient, the public algebra and the skew-zigzag classification

The strict algebras of this layer are native and are consumed, not redeclared: the uniform quotient
`TauCeti.nonisolatedZigzagQuotient` and `TauCeti.zigzagIdeal_eq_quadraticZigzagIdeal`
(`Zigzag/Relations.lean`), the public algebra `TauCeti.zigzagAlgebra` with the `A₁` dimension
`TauCeti.finrank_zigzagAlgebra_A1` (`Zigzag/Componentwise/Basic.lean`, `Zigzag/Dimension.lean`),
the skew parameters `TauCeti.SkewZigzagParameter` with Couture's classifications
`TauCeti.SkewZigzagParameter.cohomologyClass_eq_iff_exists_vertexFixing_algEquiv`
(`Zigzag/Cohomology.lean`),
`TauCeti.SkewZigzagParameter.exists_firstCohomologyRelabel_eq_iff_exists_graded_algEquiv`
(`Zigzag/Skew/Classification.lean`) and
`TauCeti.SkewZigzagParameter.exists_isGaugeEquivalent_relabel_iff_exists_vertexPermuting_algEquiv`
(`Zigzag/Skew/Automorphism.lean`), the tree theorem `TauCeti.nonempty_algEquiv_zigzagAlgebra_of_isTree`
(`Zigzag/Tree.lean`), the cycle results `TauCeti.nonempty_algEquiv_zigzagAlgebra_exteriorCycle` and
`TauCeti.not_exists_vertexFixing_algEquiv_skewZigzagQuotient_exteriorCycle` (`Zigzag/Cycle.lean`),
the characteristic-two identification `TauCeti.skewZigzagIdeal_exterior_eq_zigzagIdeal`
(`Zigzag/Exterior.lean`), the relabelling isomorphisms `TauCeti.nonisolatedZigzagQuotientEquiv`
(`Zigzag/Isomorphism.lean`) and scalar extension `SimpleGraph.skewZigzagBaseChange`
(`Zigzag/BaseChange/Basic.lean`).  The statements they realise are:

- Define the uniform relation quotient containing non-returning length-two paths, differences of
  backtracks at one vertex, and paths of length at least three.  Prove agreement with the purely
  quadratic presentation for every connected graph with at least three vertices.  This quotient
  is the component algebra only when the component has an edge; do not expose it as the public
  algebra of an isolated vertex.
- Construct the `A₁` dual-numbers presentation and the `A₂` radical-cube-zero presentation and
  define the uniform public `TauCeti.zigzagAlgebra` as the finite product of the algebras of connected
  components, using the dual numbers precisely on singleton components.  Prove the comparison
  with the relation quotient on every connected component with an edge, without claiming a false
  quadratic presentation (Huerfano--Khovanov, §3, p. 4, for the low-rank conventions).
  *Needs:* Layer 0 (relation quotients, grading descent, component decomposition); Mathlib
  `DualNumber`.
- For a graph with cyclically ordered or scalar-labelled incident edges, define a skew-zigzag
  algebra by nonzero ratios between backtracks.  State the cocycle/gauge equivalence relation on
  parameters.  For a connected graph with at least three vertices, over a field containing
  square roots, identify **vertex-fixing graded** isomorphism classes with `H¹(G,kˣ)` (Couture,
  Theorem 4.8, using Lemma 4.3 and Proposition 4.4, which assume at least three vertices);
  identify arbitrary graded algebra isomorphism classes only after quotienting that set by
  `Aut(G)` (Couture, Theorem 4.12, p. 15).  Prove that every skew-zigzag algebra on a tree is
  isomorphic to the ordinary one (Huerfano--Khovanov, §4.6, p. 9, for the skew deformations).
  *Needs:* Layer 0; Mathlib `SimpleGraph.IsTree`, units and the first cohomology of a graph as a
  quotient of edge labellings by vertex rescalings.
- Work out cycles explicitly.  On an even cycle the exterior-skew relation is gauge-equivalent to
  the ordinary zigzag relation; on an odd cycle over characteristic different from two it is the
  nontrivial skew class (Couture, Theorem 4.8, p. 12, applied to the cycle).  Record the
  characteristic-two identification.
  *Needs:* the skew classification above; Mathlib `SimpleGraph.cycleGraph`.
- Prove invariance under graph isomorphism.  For a specified field homomorphism, extend every
  parameter by applying the homomorphism and construct the resulting scalar-extension comparison;
  state injectivity or preservation of a classification class only under the hypotheses that make
  the induced map on units (and hence `H¹`) injective.  Normalize the skew Frobenius trace using
  the chosen skew parameters rather than importing the ordinary all-volumes-equal normalization.
  *Needs:* Layer 0 (relabelling isomorphisms); Mathlib `RingHom`, `Units.map`.

### Examples

- The `4`-cycle with the exterior parameter is gauge-equivalent to the ordinary zigzag algebra;
  the triangle with the exterior parameter is not, over any field in which `2 ≠ 0`, and is, over
  `𝔽₂`.
- On the path `A₃` every skew parameter is gauge-trivial, so there is one algebra up to
  vertex-fixing isomorphism; `H¹(A₃, kˣ) = 1`.

### Dependencies

Layer 1 uses Layer 0 (doubled quivers, relation quotients, grading descent, relabelling) and
Mathlib's simple graphs, units and dual numbers.

## Layer 2: bases, dimensions, centers, and symmetric Frobenius traces

### 2.1 Bases, dimensions, traces and centres

For a connected nontrivial graph, choose no preferred incident edge in the public definitions;
backtrack independence makes the volume element `x_i` at vertex `i` canonical in the quotient.
This layer is native and is consumed: the basis `TauCeti.zigzagBasis` with
`TauCeti.finrank_nonisolatedZigzagQuotient` (`Zigzag/Basis.lean`), the public dimension
`TauCeti.finrank_zigzagAlgebra` (`Zigzag/Dimension.lean`), the socle and top
`TauCeti.socle_nonisolatedZigzagQuotient_eq_jacobson_sq` and `TauCeti.zigzagTopEquiv`
(`Zigzag/Socle.lean`), the trace `TauCeti.zigzagTrace` with `TauCeti.zigzagTracePairing_isPerfPair`
(`Zigzag/Trace.lean`) and its componentwise form `TauCeti.zigzagAlgebraTrace`
(`Zigzag/Componentwise/Trace.lean`), self-injectivity `TauCeti.moduleInjective_zigzagAlgebra`
(`Zigzag/SelfInjective.lean`), the centre `TauCeti.zigzagCenterBasis` with
`TauCeti.finrank_center_nonisolatedZigzagQuotient` (`Zigzag/Center.lean`), and the skew versions
`TauCeti.skewZigzagTrace`, `TauCeti.skewZigzagTracePairing_isSymm_iff` and
`TauCeti.skewZigzagCenterBasis` (`Zigzag/Skew/Trace.lean`, `Zigzag/Skew/Center.lean`).  The
statements they realise are:

- The vertex idempotents `e_i`, all oriented arrows, and volumes `x_i` form a homogeneous basis, in
  degrees `0`, `1`, and `2` respectively, with the complete multiplication table, radical
  filtration, socle, and top (Huerfano--Khovanov, §3, p. 4: the graded pieces have dimensions
  `|V|`, `2|E|`, `|V|`; Ehrig--Tubbenhauer, Definition 2.2, p. 3, and §4A, p. 11, for the radical).
- `dim_k Z_k(G) = 2|V| + 2|E|`, with the componentwise correction when isolated vertices are
  present and the separate `A₁` convention (Huerfano--Khovanov, §3, p. 4).
- `tr(e_i)=0`, `tr(a)=0`, and `tr(x_i)=1` define a trace with `tr(xy)=tr(yx)` whose form
  `(x,y) ↦ tr(xy)` is symmetric and nondegenerate, giving the symmetric Frobenius and self-injective
  algebra structures (Huerfano--Khovanov, Proposition 1, p. 4; Ehrig--Tubbenhauer, Lemma 2.6, p. 4).
- The centre of a connected nontrivial simple graph has basis `1` together with the volumes `x_i`,
  hence dimension `|V|+1`, with the rank-one and disconnected formulas.
- The basis, centre, and trace extend to skew parameters, recording exactly which central
  combinations change and that the skew trace pairing is symmetric exactly when the Gram weights
  of every dart and its reverse agree.

### Examples

- `A₂`: six basis elements `e₁, e₂, a, a*, x₁, x₂`, dimension `2·2 + 2·1 = 6`, centre of
  dimension `3`, trace pairing with Gram matrix pairing `e_i` with `x_i` and `a` with `a*`.
- An isolated vertex contributes the dual numbers: dimension `2`, centre of dimension `2`, so a
  graph with `c` components has centre of dimension `|V| + c`.

### Dependencies

Layer 2 uses Layers 0--1 and Mathlib's bases, bilinear forms, `Module.finrank`, Jacobson radical
and injective modules.

## Layer 3: projectives, graded Cartan matrices, and `q`-Euler forms

### 3.1 Projectives, graded Hom spaces and the graded Cartan matrix

The projectives, their graded Hom spaces and the graded Cartan matrix are native and are consumed:
the dictionary `TauCeti.zigzagProjectiveHomEquivCorner` and its graded form
`TauCeti.zigzagProjectiveHomOfDegreeEquivGradedCorner` (`Zigzag/Hom.lean`), the corners
`TauCeti.zigzagGradedCorner` and the matrix `TauCeti.zigzagGradedCartanMatrix` with the entrywise
formula `TauCeti.zigzagGradedCartanMatrix_apply` and its matrix form
`TauCeti.zigzagGradedCartanMatrix_eq` (`Zigzag/CartanMatrix.lean`), the period-four projective
resolution of a vertex simple on an `A₂` component `TauCeti.zigzagPeriodicProjectiveResolution`
(`Zigzag/Projective/Resolution.lean`), and the named matrices
`TauCeti.zigzagGradedCartanMatrix_D4_eq`, `TauCeti.zigzagGradedCartanMatrix_affineE8_eq` and
`TauCeti.eval_neg_one_det_zigzagGradedCartanMatrix_affineE8` (`Zigzag/ADE/CartanMatrix.lean`).

- The indecomposable graded left projective `P_i = Z e_i`, its simple head, socle, radical layers,
  grading shifts, and all homogeneous `Hom(P_i,P_j{d})` spaces are the corners `e_i Z e_j` and their
  graded pieces (Ehrig--Tubbenhauer, Lemma 2.7, p. 4: graded dimension `1 + q²` for `i = j`, `q`
  for adjacent vertices, `0` otherwise); they agree with Tau Ceti's projective representation under
  the bound-quiver/module equivalence.
- In the vertex basis, the graded Cartan formula

  ```text
  C_G(q) = (1 + q²) I + q A_G,
  ```

  where `A_G` is the adjacency matrix, holds entrywise before matrix notation is used
  (Ehrig--Tubbenhauer, Proposition 2.8, p. 5; Huerfano--Khovanov, §6.1, p. 11).  At `q=1` this is the
  ordinary composition-factor Cartan matrix.

### 3.2 Grothendieck groups and `q`-Euler forms

- Interpret this matrix through the graded Grothendieck group from the sibling roadmap.  Prove the
  projective `q`-Hom pairing without invoking an infinite projective resolution.
  *Needs:* the graded Cartan matrix above; GrothendieckEulerForms (graded `K₀`, the shift action
  and the projective `q`-pairing).
- Define an Ext `q`-Euler value only for pairs satisfying the sibling roadmap's finite
  cohomological and Laurent support predicates.  Zigzag algebras are self-injective and their
  simples generally have infinite resolutions, so no unconditional integer-valued Ext-Euler form
  on all finite-dimensional modules is asserted.
  *Needs:* the periodic resolution above; GrothendieckEulerForms (finite-support `q`-Euler forms).
- The quantum Cartan matrix is invertible over `ℚ(q)` for every graph, although `C_G(−1) = 2I − A_G`
  is singular for the affine graphs (Huerfano--Khovanov, §6.1, pp. 11--12).  Its inverse in the
  formal power-series completion is compared with the Hilbert series of the preprojective algebra
  in Layer 5, where the Koszul duality that explains the comparison lives; a Laurent-polynomial
  `q`-Euler value is never identified with that completed series.
  *Needs:* the graded Cartan matrix above; Mathlib `Matrix.det`, `Polynomial`.

### Examples

- `A₂`: the graded Cartan matrix is `[[1+q², q],[q, 1+q²]]`, of determinant `1 + q² + q⁴`, which is
  nonzero at `q = −1`; `Ẽ₈` has `det C(−1) = 0`, the singular affine Cartan matrix.
- The resolution of the vertex simple at `i` of `A₂` has terms `P_i, P_j, P_j, P_i, …` with
  period four, the differentials being right multiplication by `a`, `x_j`, `a*` and `x_i`, and never
  terminates, so the Ext-Euler form of two simples is defined only after a finite-support
  hypothesis.

### Dependencies

Layer 3 uses Layers 0--2 and GrothendieckEulerForms.

## Layer 4: additive preprojective algebras and orientation independence

### 4.1 The preprojective algebra, orientation independence and the finite/infinite dichotomy

Let `Q` be a finite quiver and `Q̄ = Quiver.Symmetrify Q`.  For each original arrow
`a : i ⟶ j`, write `a* : j ⟶ i` for its formal reverse.  Define the global relation in Tau Ceti's
path-product convention and also state it as the vertex-corner relations

```text
ρ_i = ∑_{head(a)=i} a a* - ∑_{tail(a)=i} a* a = 0.
```

The implementation proves which displayed word corresponds to “traverse first” under
later-factor-first multiplication.

The algebra, its grading, orientation and gauge independence, the opposite comparison, base change,
the moment-map comparison and the finite/infinite dichotomy are native and are consumed:
`TauCeti.preprojectiveAlgebra`, `TauCeti.preprojectiveMk`, `TauCeti.localPreprojectiveRelator` and
`TauCeti.preprojectiveIdeal` (`Preprojective/Basic.lean`), `TauCeti.preprojectiveGrade` and
`TauCeti.preprojectiveGradedAlgebra` (`Preprojective/Grading.lean`),
`TauCeti.reorientPreprojectiveAlgebraEquiv` (`Preprojective/Orientation.lean`),
`TauCeti.preprojectiveAlgebraEquivGauged` (`Preprojective/Gauge.lean`),
`TauCeti.preprojectiveOpAlgEquiv` (`Preprojective/Opposite.lean`),
`TauCeti.preprojectiveBaseChange` (`Preprojective/BaseChange.lean`),
`TauCeti.QuiverRep.momentMap` and `TauCeti.QuiverRep.toEnd_preprojectiveRelator_eq_sum_lie`
(`Preprojective/MomentMap.lean`), `TauCeti.finiteDimensional_preprojectiveAlgebra_of_isSimplyLaced`
(`Preprojective/ADE/FiniteDimensional.lean`) and
`TauCeti.not_module_finite_preprojectiveAlgebra_orientedQuiver_of_not_exists_dynkinType_iso`
(`Preprojective/InfiniteDimensional.lean`).  The statements they realise are:

- `Π_k(Q) = kQ̄ / (ρ)` with the two-sided span, its grading, local relations, quotient universal
  property, opposite-algebra comparison, and base change (Crawley-Boevey, §1, p. 119, for the
  relation `∑_a (a a* − a* a)`).
- Reversing one chosen original arrow gives the algebra isomorphism which fixes every other doubled
  arrow and rescales one of the exchanged arrows by `-1`; it sends every local relation to the
  corresponding relation, and composing these maps gives independence of all orientations of a
  fixed underlying graph, including characteristic two (Crawley-Boevey, §1, p. 119).
- The signs `{±1}` generalise to an antisymmetric sign function on oriented edges, with
  independence under the explicit gauge change; the proof is the explicit rescaling, not the
  assertion that the defining sum “obviously” has no orientation.
- For finite ADE graphs `Π` is finite-dimensional over every field, and for connected non-Dynkin
  graphs, including affine ADE, infinite-dimensional (Etingof--Eu, Theorem 3.4.2, p. 7, for the
  non-Dynkin growth; the finite-type bound on path lengths is the native proof).
- The preprojective relation agrees with the moment-map commutator formula algebraically; no
  quiver variety is constructed.

### 4.2 Self-injectivity in finite type

Let `Q` be a finite quiver without oriented cycles and `k` any field, so that `kQ` is
finite-dimensional, basic and hereditary; write `D = Hom_k(−, k)`.

- **Auslander--Reiten data of a hereditary path algebra over any field.** The translate
  `τ = D Tr`, its inverse `τ⁻ = Tr D` and the Nakayama functor `ν = D Hom_{kQ}(−, kQ)` are
  ArtinAlgebras' (§4.1 for `τ` and `τ⁻` over any Artin algebra, realised over a field by
  `TauCeti.AuslanderReitenTranslate` and, on quiver representations, `TauCeti.arTranslate`; §2.3
  for `ν`, an equivalence from finitely generated projective to finitely generated injective
  modules); none of them is redefined here.  Prove, for the `kQ`-bimodule
  `E = Ext¹_{kQ}(D(kQ), kQ)`, the hereditary description `τ⁻ ≅ E ⊗_{kQ} −` and
  `τ ≅ Hom_{kQ}(E, −)` as endofunctors of finite-dimensional `kQ`-modules, hence that `τ⁻` is left
  adjoint to `τ` and that `τ⁻ M ≅ Ext¹_{kQ}(D(kQ), M)` (Grant, Proposition 2.5, p. 6, from the
  description of the transpose over a hereditary algebra by `Ext¹_{kQ}(−, kQ)`; Crawley-Boevey,
  Lemma 2.2, p. 5).  Prove Serre duality `Hom_{kQ}(P, M) ≅ D Hom_{kQ}(M, νP)`, natural in the
  projective `P` and the finite-dimensional `M` (Grant, Theorem 2.3, p. 5), and that for a Dynkin
  quiver every indecomposable injective `I_i` is `τ^{−ℓ(i)} P_{ρ(i)}` for a permutation `ρ` of the
  vertices and a length function `ℓ` (Grant, Theorem 2.7, p. 7, after Auslander--Platzeck and
  Gabriel: a hereditary algebra has finite representation type exactly when every injective
  module is preprojective).  For `A₂` the simple projective module `S` has
  `E ⊗_{kQ} S ≅ Ext¹_{kQ}(D(kQ), S)` one-dimensional, the simple injective module, while the
  projective-injective module is sent to `0`; so `ℓ` takes the values `1` and `0`, `ρ` exchanges
  the two vertices, `E` is one-dimensional and `E ⊗_{kQ} E = 0`.
  *Needs:* ArtinAlgebras §2.3 and §4.1 (the Nakayama functor and the translate);
  QuiverRepresentations Layer 1 (representations as `kQ`-modules); Mathlib `Ext`,
  `Module.Injective`.
- **The Baer--Geigle--Lenzing algebra and the identification.** Define
  `Π_BGL(kQ) = ⊕_{r ≥ 0} Hom_{kQ}(kQ, τ^{−r} kQ)`, graded by `r`, with the product of
  `f : kQ → τ^{−r} kQ` and `g : kQ → τ^{−s} kQ` given by `τ^{−r}(g) ∘ f` (Grant, Definition 2.6,
  p. 6; Crawley-Boevey, §2, p. 5), and prove `Π_k(Q) ≅ Π_BGL(kQ)` as graded `k`-algebras, the
  isomorphism restricting to the identity on `kQ` and sending the ideal generated by the reverse
  arrows onto the positive part (Crawley-Boevey, Theorem 2.3, p. 5, and Theorem 3.1 at `λ = 0`,
  p. 6, both algebras being his `Π⁰(kQ)`, over an arbitrary field; Ringel, Theorem A, p. 2, in the
  equivalent form `Π_k(Q) ≅ T_{kQ}(E)`, the tensor algebra of the bimodule `E`, with
  `τ^{−r} kQ = E^{⊗_{kQ} r}`).  Sign normalisation: Crawley-Boevey's relation is
  `∑_a (a a* − a* a)`, the native one, and Ringel's is `∑_{α ∈ Q̄₁} ε(α) α* α` with `ε = 1` on
  original and `ε = −1` on reverse arrows, which the gauge isomorphism
  `TauCeti.preprojectiveAlgebraEquivGauged` of §4.1 identifies with it; the signless relation
  `∑ α* α` is not a normalisation of the same algebra (Ringel, §6, pp. 16--17: on a three-vertex
  affine quiver of type `Ã` in characteristic different from two the two algebras are not
  isomorphic), in accordance with §5.1.
  *Needs:* the Auslander--Reiten data above; ArtinAlgebras §4.1 (the translate); §4.1 above (the
  presentation, grading and gauge isomorphism); QuiverRepresentations Layer 1; Mathlib `Ext` and
  graded algebras.
- **Self-injectivity.** Prove `moduleInjective_preprojectiveAlgebra_of_dynkin`: for an orientation
  `o` of a finite simple graph `G` isomorphic to `TauCeti.diagramGraph t.cartanMatrix` for a valid
  simply-laced `TauCeti.DynkinType` `t`, and every field `k`, the additive preprojective algebra
  `Π_k(Q_o)` is injective as a module over itself (`Module.Injective`), extending the native `A₁`
  and `A₂` cases (`Preprojective/ADE/A1/SelfInjective.lean`, `A2/SelfInjective.lean`); `D₄` is an
  instance of the general statement.  The route is Grant's (Grant, Theorem 3.1, p. 7, after
  Brenner--Butler--King, Theorem 4.8, for the path algebra of a quiver): `kQ_o` is basic and
  hereditary, and representation-finite over every field by Gabriel's theorem
  (`TauCeti.isFiniteRepType_iff_card_hom_add_card_hom_le_one_and_exists_dynkinType_iso`,
  `FiniteRepType/Gabriel.lean`), so every indecomposable injective is `τ^{−ℓ(i)} P_{ρ(i)}`;
  Serre duality, the adjunction `τ⁻ ⊣ τ` and this identification give an isomorphism of left
  modules `ϕ : Π_BGL(kQ) ≅ D Π_BGL(kQ)` (Grant, Theorem 3.1, p. 7, and Definition 2.1, p. 4).  The
  functional `φ = ϕ(1)`, for which the pairing `(a, b) ↦ φ(ab)` is nondegenerate, is a Frobenius
  functional in the sense of `LinearMap.IsFrobeniusFunctional`, so `Π_BGL(kQ)`, finite-dimensional
  by the identification and §4.1, is injective over itself by
  `LinearMap.IsFrobeniusFunctional.moduleInjective_self` (`Algebra/Algebra/Frobenius/Basic.lean`),
  and the identification transports this to `Π_k(Q_o)`.  For `A₂`, in the basis `e₁, e₂, a, a*`
  of `Π_k(A₂)`, the functional with `φ(a) = φ(a*) = 1` and `φ(e₁) = φ(e₂) = 0` has a Gram matrix
  with exactly one nonzero entry in each row and column, the products `a a*` and `a* a` being the
  relators and the only other nonzero products being an idempotent times an arrow; a functional
  vanishing on `a` would pair `a` to zero against every basis element.
  *Needs:* the two items above; the finite-dimensionality of §4.1; Tau Ceti Gabriel's theorem and
  Frobenius functionals above; ArtinAlgebras §2.3 and §4.1; QuiverRepresentations Layer 1; Mathlib
  `Module.Injective`, `Module.Baer`.
The Hilbert series and the Koszulity of `Π_k(Q)` for non-Dynkin graphs are proved in Layer 5,
where the Koszul duality with the zigzag algebra that their proof uses is established.

### Examples

- Finite `D₄` with any orientation: `Π` has dimension `28 = 4 + 6 + 8 + 6 + 4` in degrees `0..4`,
  and `H₂` has centre entry `2`, one less than for `D̃₄`.
- `Ẽ₈` with the source--sink orientation of the worked examples: `Π` is infinite-dimensional,
  since the nine-vertex graph is not a Dynkin diagram, while deleting its affine node gives the
  finite-dimensional `Π(E₈)`.

### Dependencies

Layer 4 uses Layer 0 (affine subgraphs of non-Dynkin graphs, the `D̃₄` and `Ẽ₈` carriers),
ArtinAlgebras §2.3 and §4.1 (the Nakayama functor and the translate), QuiverRepresentations
Layer 1 (representations as `kQ`-modules), Mathlib's `Quiver.Symmetrify`, two-sided ideals, `Ext`,
graded algebras and injective modules, and Tau Ceti's path algebras, Gabriel's theorem and
Frobenius functionals.

## Layer 5: quadratic and Koszul duality

The quadratic dual and its comparison with the preprojective
algebra are native and are consumed: the quadratic presentation
`TauCeti.quadraticZigzagPresentationEquivZigzagQuotient` and the dual
`TauCeti.quadraticDualQuadraticZigzagEquivSignless` (`Zigzag/Quadratic/Dual.lean`), the signless
preprojective algebra `TauCeti.signlessPreprojectiveAlgebra` with the bipartite comparison
`TauCeti.symmetrifySignlessPreprojectiveAlgebraEquiv` (`Preprojective/Signless.lean`), the
non-bipartite obstruction `TauCeti.not_exists_forall_vertexCorner_eq_smul_of_odd_length`
(`Preprojective/Bipartite.lean`) and the named comparisons
`TauCeti.zigzagD4SignlessEquivPreprojective`, `TauCeti.zigzagE8SignlessEquivPreprojective` and
`TauCeti.zigzagAffineE8SignlessEquivPreprojective` (`Zigzag/ADE/Preprojective.lean`).

### 5.1 Quadratic dual and comparison with the preprojective algebra

**Quadratic dual.** For a connected simple graph with at least three vertices, the quadratic
dual of strict zigzag is the double-path algebra with the **signless local relation**
`∑_{j∼i} (i→j→i)=0` (Huerfano--Khovanov, Proposition 11, p. 11, second sentence).

**Comparison with standard preprojective.** For a bipartite graph a source--sink orientation
gives an explicit rescaling isomorphism from the signless relation to the signed preprojective
relation (Huerfano--Khovanov, Proposition 11, p. 11, third sentence).  For a non-bipartite graph
the signless dual is its own algebra: no unit-valued rescaling of the arrows carries the
signless relator to the signed one, and in characteristic two the two algebras coincide
(`TauCeti.signlessPreprojectiveAlgebraEquivPreprojectiveOfTwoEqZero`, `Preprojective/Signless.lean`).

### 5.2 Classical Koszulity of the zigzag algebra

Koszulity is the predicate of DGAInfinity Layer 11: a quadratic algebra `A = T_S(V)/(R)` over the
semisimple `S = k^{Q₀}` is Koszul when the graded right `A`-module `S` has a linear graded
projective resolution, GrothendieckEulerForms Layer 3 supplying linear resolutions (the `n`-th
term generated in internal degree `n`), their equivalence with the diagonal vanishing of the
bigraded `Ext^{i,j}_A(S,S)` for `i ≠ j` (on quadratic algebras the formulation of Etingof--Eu,
Definition 2.3.3, p. 3) and with the inversion of the graded Cartan and Poincaré series up to
`q ↦ −q`.  DGAInfinity Layer 11 also supplies the general theorems used below: a Koszul algebra
is quadratic, its quadratic dual `A^! = T_S(V^∨)/(R^⊥)` is Koszul and is the Yoneda algebra
`Ext^*_A(S,S)` with the handedness fixed there, and `(A^!)^! ≅ A` under its dualizability
hypotheses.  None of this is redefined here; the left modules of Layer 3 enter the supplier's
right-module predicate as right modules over the opposite algebra, as in the supplier contract.
The statements of this section are the zigzag-specific ones.

**Classical Koszulity.** For a finite connected simple graph with at least three vertices, prove
that the path-graded zigzag algebra is Koszul exactly when the graph is not a finite ADE Dynkin
graph (Huerfano--Khovanov, Proposition 11, p. 11, after Martínez-Villa).  In the Koszul cases
identify its Koszul dual with the signless algebra of §5.1, through the quadratic dual
`TauCeti.quadraticDualQuadraticZigzagEquivSignless`.  State finite ADE as the non-Koszul,
almost-Koszul case and treat `A₁` and `A₂` through their explicit resolutions.  The proof
includes the zigzag Koszul complexes, their exactness and the handedness of left and right
quadratic duals; a matrix inverse alone is not used as a definition of duality.

- **Matrix Hilbert series.** For a Koszul algebra `A` over `S = k^{Q₀}` the matrix Hilbert series
  (Etingof--Eu, Definition 2.1.2, p. 2) of `A` and of `A^!` are inverse up to the sign change
  `t ↦ −t` and a transpose, `h_A(t) · h_{A^!}(−t)ᵀ = I`: the matrix form of the series inversion
  of GrothendieckEulerForms Layer 3, by the Euler characteristic of the exact Koszul complex whose
  `n`-th term is `A ⊗_S (A^!_n)^*` (Etingof--Eu, proof of Theorem 2.3.4, p. 3, for the terms up
  to homological degree two).

**Checks.**

- The path algebra of the `A₂` quiver `1 → 2`, graded by path length, is Koszul: the simple at
  the sink is projective, and the simple at the source has the resolution
  `0 → P_2{1} → P_1 → S_1 → 0`, generated in degrees `0` and `1`; a predicate that demanded a
  nonzero term in every homological degree would reject it.  The quiver has no path of length
  two, so its quadratic dual is `A₀` plus the dual arrow, which lies in the corner
  `e_1 A^! e_2`: `h_A(t) = I + tE₂₁`, `h_{A^!}(t) = I + tE₁₂`, and
  `h_A(t) · h_{A^!}(−t)ᵀ = (I + tE₂₁)(I − tE₂₁) = I`, whereas the product without the transpose
  has degree-one term `E₂₁ − E₁₂ ≠ 0`; this pins the transpose in the Hilbert-series bullet.
- `Z(A₂)` is not Koszul: the periodic resolution of a vertex simple (Layer 3 Examples) has
  differentials of internal degrees `1, 2, 1, 2, …`, so its terms are generated in degrees
  `0, 1, 3, 4, …`, and the term in homological degree `2` fails; a predicate that ignored the
  internal shifts and tested only that the terms are projective would accept it.  The supplier's
  theorem that a Koszul algebra is quadratic refutes it independently, since the relations of
  `Z(A₂)` are cubic.
- The triangle `Z(Ã₂)` is Koszul with dual the signless algebra of §5.1, and with `A = J − I`
  the series satisfy `((1 + t²)I − tA)(I − At + t²)⁻¹ = I`, whereas the product without the sign
  change, `((1 + t²)I + tA)(I − At + t²)⁻¹`, has degree-one term `2A ≠ 0`; a dual series taken
  at `t` instead of `−t` fails.  The degree-two coefficient of the dual series is
  `A² − I = J`, of total `9`, and the signless algebra agrees: its `6 · 2 = 12` doubled paths of
  length two modulo the three vertex relations span a space of dimension `9`, one class at each
  vertex and one from each vertex to each other vertex.
*Needs:* §5.1, Layers 2--3 (basis, projectives, graded Hom spaces and the periodic
resolutions), Layer 0 (affine subgraphs of non-Dynkin graphs); DGAInfinity Layer 11 (the Koszul
predicate, Koszul implies quadratic, the Koszul dual as the Yoneda algebra and its Koszulity);
GrothendieckEulerForms Layer 3 (linear graded projective resolutions, the `Ext` reformulation and
the series inversion); Mathlib graded modules and `CategoryTheory.ProjectiveResolution`.

### 5.3 The Hilbert series of a non-Dynkin preprojective algebra

**The Hilbert series of a non-Dynkin preprojective algebra.** Define the graded corner
`preprojectiveGradedCorner k Q d j i = e_j Π_d e_i`, the image of `TauCeti.preprojectiveGrade k Q d`
under `TauCeti.cornerMap k e_j e_i`, and for an orientation `o` of a finite simple graph `G` the
Hilbert matrix `preprojectiveHilbertMatrix k G o d` with `(j,i)` entry `dim_k e_j Π_d e_i`, the
coefficient of `t^d` in the matrix Hilbert series `h_Π(t)` (Etingof--Eu, Definition 2.1.2,
p. 2).  Prove `preprojectiveHilbertMatrix_recursion`: for a connected finite simple graph `G`
which is not isomorphic to `TauCeti.diagramGraph t.cartanMatrix` for any valid simply-laced `t`,
any orientation `o` and any field `k`, `h_Π(t) = (1 − C t + t²)⁻¹` with `C = A_G` the adjacency
matrix of the doubled quiver, that is `H₀ = I`, `H₁ = C` and `H_{d+2} + H_d = C H_{d+1}` for
every `d` (Etingof--Eu, Theorem 3.4.2, p. 7).  Equivalently `h_Π(t) = C_G(−t)⁻¹` in `ℤ[[t]]`
for the quantum Cartan matrix of Layer 3 (Huerfano--Khovanov, Proposition 12 and Corollary 2,
p. 12); keep this completed-series identity separate from Laurent-polynomial `q`-Euler values.
Route: for the signless algebra of every connected non-Dynkin graph with at least three vertices
the identity is Koszul duality with §5.2, `h_{A^!}(t) h_A(−t) = 1` for a Koszul algebra `A`
with dual `A^!`; for the signed algebra of a bipartite graph it follows through the comparison of §5.1; for the
signed algebra of the cycle `Ã_n` prove the **cyclic normal form**: in `Π_k(Q)` for the cyclic
orientation every doubled path equals, up to sign, the unique path with the same start which
traverses first its forward and then its backward darts, so `dim e_j Π_d e_i` is the number of
pairs `(p,q)` with `p + q = d` and `p − q ≡ j − i` modulo `n + 1`, which satisfies the
recursion; the general signed case is Etingof--Eu's reduction to the affine subgraph through
**partial preprojective algebras** `Π_{Q,J}` (white vertices `J` carry no relation; Etingof--Eu,
Definition 3.1.1, p. 4), the free-product Hilbert-series lemma (Lemma 2.2.5, p. 2), the
termwise inequality for filtered algebras (Lemma 2.3.2, p. 3) and the Golod--Shafarevich
inequality (Theorem 2.3.4 (i), p. 3), as in §3.4, pp. 6--7.  Etingof--Eu prove the affine case
instead through Lusztig's identification of `Π(Q̃)` with a corner of the skew group algebra
`k[x,y] ⋊ Γ` (Proposition 3.2.2, p. 4); that identification belongs to the McKay roadmap and is
not an input here.  Loops are excluded by the simple-graph input; Etingof--Eu allow them.
- API: `preprojectiveGradedCorner k Q 0 j i` is `k e_i` for `j = i` and `0` otherwise;
  `preprojectiveGradedCorner k Q 1 j i` is spanned by the doubled arrows from `i` to `j`; the
  corners of one degree are the direct summands of `TauCeti.preprojectiveGrade k Q d`; the
  Hilbert matrix is symmetric, by `TauCeti.preprojectiveOpAlgEquiv`, and commutes with `C`.
- **Checks.**
  - The triangle `Ã₂` with `C = J − I`: `H₂ = C² − I = J`, `H₃ = C J − C = J + I`,
    `H₄ = C(J + I) − J = 2J − I`, `H₅ = C(2J − I) − (J + I) = 2J`; so the row sums are
    `1, 2, 3, 4, 5, 6`, which is `d + 1` per vertex, as the cyclic normal form requires
    (`d + 1` pairs `(p, q)` with `p + q = d`, one for each residue).  A recursion with
    `H_{d+2} = C H_{d+1} + H_d` would give row sums `1, 2, 5, 12, …`.
  - `D̃₄` (four-leaf star, centre first): `H₂` has centre entry `3` and leaf-leaf entries `1`
    off the diagonal, `0` on it, so the centre corner `e₀ Π₂ e₀` has dimension `3`, not `4`: the
    four backtracks at the centre satisfy one relation, the centre relator.
  - `A₂`: `H₂ = C² − I = 0` and the recursion at `d = 1` would force `H₃ + H₁ = C H₂ = 0`
    although `H₁ = C ≠ 0`; on finite `D₄` the recursion holds for `d ≤ 3` and fails at `d = 4`,
    where `H₆ + H₄ = I` but `H₅ = 0`.  Both are excluded by the non-Dynkin hypothesis, as is the
    one-vertex graph, where `H₂ + H₀ = I ≠ 0 = C H₁`.
*Needs:* §5.1--5.2, Layer 4 (`TauCeti.preprojectiveGrade`, orientation independence and base
change), Layer 0 (affine subgraphs of non-Dynkin graphs), Tau Ceti `TauCeti.cornerMap`,
`TauCeti.preprojectiveOpAlgEquiv`; Mathlib `Module.finrank`, `SimpleGraph.adjMatrix`,
`PowerSeries`, `Matrix` inverses.

### 5.4 Koszulity of the preprojective algebra

**Koszulity of the preprojective algebra.** For a connected non-Dynkin graph prove that
`Π_k(Q)` is Koszul over every field, in the sense of the predicate of DGAInfinity Layer 11
consumed in §5.2: the Hilbert series of §5.3 forces exactness of its Koszul complex
`0 → Π(2) → Π ⊗_R Π[1] → Π → R → 0` by the Golod--Shafarevich inequality (Etingof--Eu,
Theorem 2.3.4 (ii), p. 3, and Theorem 3.4.2, p. 7, second statement).
*Needs:* §5.2--5.3; DGAInfinity Layer 11 (the Koszul predicate); Mathlib graded modules and
`CategoryTheory.ProjectiveResolution`.

### Examples

- The triangle: the quadratic dual of `Z(Ã₂)` is the signless algebra, which is not isomorphic to
  the signed `Π` by any rescaling of arrows when `2 ≠ 0`, while both have Hilbert series
  `(1 − (J − I)t + t²)⁻¹`.
- `D₄`: `Z(D₄)` is not Koszul, the resolution of a vertex simple being periodic rather than
  linear, and `Π(D₄)` is finite-dimensional with `H₅ = 0`.
- `Ẽ₈` with the source--sink orientation of the worked examples: the signless and signed algebras
  agree, and the Hilbert matrix is `(1 − A t + t²)⁻¹` for the nine-vertex adjacency matrix `A`.

### Dependencies

Layer 5 uses Layers 0--4 and Mathlib's graded modules, projective resolutions, power series and
matrices, DGAInfinity Layer 11 (the Koszul predicate and the general Koszul duality theorems) and
GrothendieckEulerForms Layer 3 (linear resolutions and the series inversion).

## Layer 6: 2-dimensional Ginzburg DG algebras and Calabi--Yau completion

### 6.1 The Ginzburg algebras and their Calabi--Yau completions

For a finite quiver `Q`, the non-completed 2-dimensional Ginzburg DG algebra `Π₂(Q)` is native and
is consumed: `TauCeti.ginzburgTwoDifferential` on the path algebra of the Ginzburg quiver (the
doubled quiver with a loop `t_i` of cohomological degree `-1` at each vertex), with
`TauCeti.isDGAlgebra_ginzburgTwoDifferential` (the Leibniz rule and the degree of `d`) and
`TauCeti.ginzburgTwoDifferential_sq_zero`, the Adams grading `TauCeti.ginzburgTwoAdamsDegree`
(original and reverse arrows of bidegree `(0,1)`, loops of bidegree `(-1,2)`, `d(t_i) = ρ_i` the
signed local preprojective relation of Layer 4, so the differential has bidegree `(1,0)`), and
`H⁰(Π₂(Q)) ≅ Π_k(Q)` as `TauCeti.preprojectiveEquivGinzburgTwoCohomologyZero`.  The length-adic
completion `Π̂₂(Q)` along the Adams grading is `TauCeti.completedGinzburgTwo`, with the injective
comparison morphism `TauCeti.ginzburgTwoToCompleted` whose image is the finite-support part
(`TauCeti.ginzburgTwoToCompleted_injective`, `TauCeti.mem_range_ginzburgTwoToCompleted_iff`).  The
3-dimensional Ginzburg DG algebra `Γ₃(Q,W)` of a quiver with potential is
`TauCeti.ginzburgThreeDifferential` (original arrows in degree `0`, reverse arrows in degree `-1`,
loops in degree `-2`, `d(a*) = ∂_a W` by the cyclic derivative `TauCeti.PathAlgebra.cyclicDerivative`,
`d(t_i) = ρ_i`), with `TauCeti.isDGAlgebra_ginzburgThreeDifferential`.  `Π₂(Q)` and `Γ₃(Q,W)` are
distinct declarations on the same quiver.  The targets of this layer are the identifications with
the sibling roadmap's Calabi--Yau completions:

- Identify `Π₂(Q)` with the derived 2-preprojective / `2`-Calabi--Yau completion `Π₂(kQ)`, taking
  the completion `Π_n(C) = T_C(C![n-1])` itself from DGAInfinity Layer 9 rather than constructing a
  local copy, under Keller's homological-smoothness hypothesis on `kQ`, and state the resulting
  bimodule `2`-Calabi--Yau theorem: `Π₂(kQ)` is homologically smooth and `2`-Calabi--Yau as a
  bimodule (Keller, Theorem 4.8, p. 20).  Any finite-Dynkin stable-module-category consequence,
  together with its Frobenius and triangulated hypotheses, belongs to the downstream
  stable-category roadmap; it is not inferred here from the bimodule theorem.
  *Needs:* the native `Π₂(Q)` above; DGAInfinity Layer 9 (smoothness, the inverse dualizing
  bimodule `C!`, the completion `Π_n(C)` and its Calabi--Yau structure); QuiverRepresentations (the
  path algebra `kQ` and its small bimodule resolution, giving homological smoothness).
- Identify `Γ₃(Q,W)` with the sibling roadmap's deformed `3`-Calabi--Yau completion
  `Π₃(kQ,ξ_W)` under Keller's hypotheses, exhibiting the Hochschild class `ξ_W ∈ HH_1(kQ)` the
  potential determines (Keller, Theorem 6.3, p. 27: the deformed completion is quasi-isomorphic to
  the Ginzburg DG algebra); the deformation input is a hypothesis supplied here, not something the
  sibling produces.
  *Needs:* the native `Γ₃(Q,W)` above; DGAInfinity Layer 9 (deformed completions `Π_n(C,c)`) and
  Layer 8 (the Hochschild class of a potential).
- Keep `Π₂(Q)` and `Γ₃(Q,W)` as distinct public definitions, with a comparison theorem only in
  genuinely matching examples: for `W = 0` the differential of `Γ₃(Q,0)` kills every reverse
  arrow, so the two differentials agree on loops but the gradings differ.
  *Needs:* the two native differentials.

### Examples

- `A₁` (one vertex, no arrows): `Π₂(A₁)` is `k[t]` with `|t| = -1` and `d = 0`, so `H⁰ = k` and
  `H^{-n} = k t^n`; the preprojective algebra is `k`.  Each cohomological degree is
  one-dimensional, so the completion along the Adams grading changes nothing: `Π̂₂(A₁) = Π₂(A₁)`.
- `A₂` with one arrow `a`: `d(t₁) = −a* a` and `d(t₂) = a a*` (in the signed convention of Layer
  4), so `H⁰(Π₂) = Π(A₂)` has dimension `4`.  The cohomological degree-`0` part of `Π₂(A₂)` is
  the doubled path algebra, which is infinite-dimensional (the powers of `a a*`), and the completion
  adds the series `∑_n c_n (a a*)^n`: here `Π̂₂(A₂)` is strictly larger than `Π₂(A₂)`.

### Dependencies

Layer 6 uses Layer 4 (the preprojective relation and `Π_k(Q)`), Tau Ceti's Ginzburg modules, and
DGAInfinity Layers 1, 8 and 9.

## Layer 7: derived Koszul duality, Hochschild classes, and `A∞` deformation theory

### 7.1 Derived Koszul duality and the Hochschild comparison

Let `Γ` be a finite tree and choose a source--sink orientation `Q`.

- Regrade each zigzag arrow from path degree `1` to bidegree `(1,-1)` before invoking the sibling
  bigraded DG and `A∞` APIs.  Prove the bigraded derived Koszul dualities, with module side and
  opposites pinned:
  `RHom_{Π₂(Q)}(k^{Q₀},k^{Q₀}) ≃ Z(Γ)` (Etgü--Lekili, Corollary 25, p. 40, for the right module
  `k^{Q₀} = Π₂(Q)/Π₂(Q)_{>0}`, where the cohomological and internal gradings on the left coincide
  and match path length on the right) and the converse comparison with `Π₂(Q)` (or its
  completion after forgetting Adams degree), the cohomological and internal gradings on the left
  matching path length and internal degree on the right (Etgü--Lekili, Theorem 23, p. 37, stated
  there for right modules over the opposite zigzag algebra; Liu--Wang, Proposition 4.4, p. 5, for
  the source--sink orientation).  Part of each statement is which of the two native objects of
  Layer 6 it produces: with the Adams grading retained the dual of the zigzag algebra is the
  bigraded `Π₂(Q)` itself, and after forgetting the Adams degree it is the completion `Π̂₂(Q)`,
  the two being related by the native comparison morphism `TauCeti.ginzburgTwoToCompleted`
  (Etgü--Lekili, Theorem 23, p. 37, whose statement keeps both gradings).  Include `A₁` and
  `A₂`; this is not the classical quadratic claim from Layer 5.
  *Needs:* Layer 6 (`Π₂(Q)`, `Π̂₂(Q)` and the comparison morphism), Layer 2 (the basis of `Z(Γ)`),
  DGAInfinity Layers 1--3
  and 11 (DG modules, `RHom`, minimal models and derived Koszul duality).
- Construct the small cofibrant bimodule resolution used to compute Hochschild cohomology.  Prove
  the bigraded comparison
  `HH^{2,q}(Π₂(Q),Π₂(Q)) ≅ (Π(Q)/[Π(Q),Π(Q)])_{q+2}` (Liu--Wang, Proposition 3.2, p. 3) and
  transport it across derived Koszul duality to zigzag Hochschild cohomology (Liu--Wang,
  Proposition 4.4, p. 5).
  *Needs:* the dualities above, Layer 6, DGAInfinity Layer 8 (Hochschild cochains of a DG algebra
  and their Morita invariance).
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
  *Needs:* DGAInfinity Layer 8 (deformations, obstruction classes and the vanishing criterion);
  the Hochschild comparison above.

### 7.2 The positive-degree cyclic quotient

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

### 7.3 Minimal `A∞` deformations and intrinsic formality

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
  *Needs:* Tau Ceti `TauCeti.AInfinityAlgebra`, `IsMinimal`, `StrictUnit`, `IsFormal`,
  `TauCeti.zigzagAlgebraIntegerGrade`; Layer 2.
- For a non-ADE finite tree, choose a nonzero Hochschild class, deform the differential of
  `Π₂(Q)`, and transfer along a specified contraction to obtain a nontrivial minimal `A∞`
  deformation of `Z(Γ)`.  Prove nontriviality modulo `A∞` isomorphism; merely displaying a higher
  multiplication is insufficient (Liu--Wang, §4.4, pp. 5--6).  The nonzero class is supplied by the
  positive-degree cyclic quotient theorem above.
  *Needs:* the cyclic quotient theorem and the Hochschild comparison above, Layer 6, DGAInfinity
  Layer 3 (homological transfer along a contraction) and Layer 8 (deformations of the
  differential).
- Liu--Wang's Example 4.7 for extended `D₄` is native and is consumed: the cycle `β₄ α₁ β₁ α₄`
  gives the operation `m₄` of `TauCeti.liuWangAffineD4AInfinityAlgebra` whose only nonzero values
  on arrow quadruples (up to one common scalar `c`) are
  `m₄(β₄,α₁,β₁,α₄)=β₄α₄`,
  `m₄(α₄,β₄,α₁,β₁)=α₁β₁`,
  `m₄(β₁,α₄,β₄,α₁)=β₁α₁`, and
  `m₄(α₁,β₁,α₄,β₄)=α₄β₄` (`TauCeti.liuWangAffineD4AInfinityAlgebra_m_four_values`); all other
  higher products on arrows vanish, the Stasheff identities hold as an instance of the loop
  deformations `TauCeti.zigzagLoopAInfinityAlgebra` attached to closed walks of length four, and
  the algebra is minimal and strictly unital with `m₄` of bidegree `(-2,2)`
  (`TauCeti.isMinimal_liuWangAffineD4AInfinityAlgebra`,
  `TauCeti.strictUnit_one_liuWangAffineD4AInfinityAlgebra`,
  `TauCeti.isHomogeneous_liuWangAffineD4AInfinityAlgebra_m_adams`; Liu--Wang, Example 4.7, p. 6).
  It is a non-ADE test of the deformation notion, not the classification proof: nontriviality of
  this particular `m₄` modulo `A∞` isomorphism is not claimed, and the non-ADE half of the theorem
  below rests on the preceding item.
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

The characteristic-zero conclusion is uniform across `A`, `D`, `E₆`, `E₇`, and `E₈`; the roadmap
does not single out `E₈` as having a special ordinary zigzag formality phenomenon.

### Examples

- `A₁` and `A₂` are intrinsically formal in every characteristic: for `A₁` by the degree count in
  the Checks above, for `A₂` because `Π(A₂)` vanishes in degrees `≥ 2`, so every positive-degree
  cyclic class is zero.
- `D₄` over `𝔽₂` is not intrinsically formal, the degree-`4` cyclic quotient being `𝔽₂`; over
  `𝔽₃` and `ℚ` it is.
- `D̃₄` over every field carries the loop deformation of Example 4.7, and its degree-`4` cyclic
  quotient is nonzero (the centre has four neighbours), as the non-ADE half requires.

### Dependencies

Layer 7 uses Layer 0 (affine subgraphs of non-Dynkin graphs), Layers 1--2 (the strict algebra, its
basis and grading), Layer 4 (preprojective algebras, orientation independence and base change),
Layer 6 (`Π₂(Q)` and its completion), and DGAInfinity Layers 1--3, 8 and 11.

## Layer 8: braid complexes and spherical-twist comparisons

### 8.1 Braid complexes and the Artin action

- The two-term graded bimodule complexes are native and are consumed: for every vertex `i`,
  `B_i = [P_i ⊗_k e_i Z ⟶ Z]` is `TauCeti.zigzagBraidComplex`, with the first term in cohomological
  degree `-1`, the second in degree `0`, and no internal shift, so that the multiplication
  `TauCeti.zigzagBraidEvaluationHom` has internal degree `0`; the inverse coevaluation complex
  `B_i' = [Z ⟶ (P_i ⊗_k e_i Z){-2}]` in cohomological degrees `0,1` is
  `TauCeti.zigzagBraidInverseComplex`, whose differential `TauCeti.zigzagBraidCoevaluationHom` is
  the coevaluation `1 ↦ e_i ⊗ x_i + x_i ⊗ e_i + ∑_{d.fst = i} a_d ⊗ a_{d.symm}`, of internal
  degree `2` (`TauCeti.isHomogeneous_zigzagBraidCoevaluation`), the image of the Casimir element
  `TauCeti.zigzagCasimir` of the Frobenius trace.  Both live in `TauCeti.GradedModuleCat` over
  `Z ⊗ Zᵐᵒᵖ` graded by `TauCeti.zigzagEnvelopingGrading` (Huerfano--Khovanov, §4.6, (35), p. 9;
  Khovanov--Seidel, §2d, p. 11, the complexes `R_i` and `R_i'` with the maps `β_i`, `γ_i`).
- Prove the inverse, commuting, and braid homotopy equivalences:
  `B_i B_i' ≃ Z ≃ B_i' B_i`, `B_i B_j ≃ B_j B_i` for distinct nonadjacent vertices and
  `B_i B_j B_i ≃ B_j B_i B_j` for adjacent vertices (Huerfano--Khovanov, Proposition 7, p. 9, after
  Khovanov--Seidel and Seidel--Thomas for type `A`).  The composite `B_i B_j` is the tensor product
  of complexes of graded bimodules over `Z`; prove that for distinct nonadjacent vertices `i ≠ j`
  the corner `e_i Z e_j` is zero, from the basis of §2.1, hence that the middle factor
  `e_i Z ⊗_Z Z e_j` vanishes over any commutative ring, which is the input to the commuting
  relation; for `i = j` the factor is `e_i Z e_i ≠ 0`.  Deduce an action of the Artin
  braid group of any finite graph on the homotopy category of complexes of graded modules and on
  its derived category.
  *Needs:* the native complexes above and the middle-factor vanishing, Layer 2 (basis,
  trace, Casimir element), Layer 3 (projectives and graded Hom spaces); Mathlib
  `HomologicalComplex`, homotopy equivalences and the homotopy category; DGAInfinity Layer 1 (the
  tensor product of DG bimodules) and Layer 5 (derived categories of DG modules).
- Compute the action on graded `K₀` and compare it with the standard reflection representation:
  `[B_i]` acts by `[M] ↦ [M] − [P_i] · (graded multiplicity of e_i M)`, the deformed simple
  reflection which specialises at `q = −1` to the reflection of the graph Cartan matrix.  State
  faithfulness only in the cases supplied by a published theorem; in particular, Khovanov--Seidel
  prove faithfulness for type `A_m` for every `m ≥ 1` (Khovanov--Seidel, Corollary 1.2, p. 5),
  while the existence of the arbitrary-graph action does not itself imply faithfulness.
  *Needs:* the braid action above, Layer 3 (graded Cartan matrix), GrothendieckEulerForms (graded
  `K₀` of the homotopy category and the shift action).

### 8.2 Spherical twists and transfer

- Work in a specified `k`-linear pretriangulated DG enhancement (DGAInfinity Layers 1 and 5:
  chain-level `Hom` complexes, shifts, cones and the tensor action of finite-dimensional graded
  vector spaces), or in Seidel--Thomas's concrete model of bounded-below complexes of injectives
  (Seidel--Thomas, Definition 2.2, p. 12).  For an object `E` that is bounded and has finite
  **total** graded `Hom` dimension from and to every object (Seidel--Thomas, Definition 2.5
  (K1)--(K2), pp. 13--14), define the twist `T_E(F)` as the chain-level cone of the evaluation
  `hom(E,F) ⊗ E → F`; finiteness of each single `Hom^i` is not enough, since `Hom^i = k` for
  infinitely many `i` makes the evaluation source infinite.  Call `E` `n`-spherical for `n > 0`
  when moreover `Hom^*(E,E) = k ⊕ k[−n]` and, for every object `F` and every `j ∈ ℤ`, the
  composition `Hom^j(F,E) × Hom^{n−j}(E,F) → Hom^n(E,E) ≅ k` is a nondegenerate pairing
  (Definition 2.9, (K3) and (K4), p. 15).  For an `A_m`-configuration of `n`-spherical objects
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
  *Needs:* the braid action above; DGAInfinity Layer 6 (derived Morita theory) and Layer 11 (the
  derived Koszul comparison); Layer 7 (the dualities).

### Examples

- `A₂`: the two complexes `B₁`, `B₂` satisfy `B₁ B₂ B₁ ≃ B₂ B₁ B₂`, and on graded `K₀` with basis
  `[P₁], [P₂]` the matrices of the Check above at `q = −1` give the braid group `B₃` acting
  through two reflections in `GL₂(ℤ)`, each of determinant `−1`.
- Two distinct nonadjacent vertices `i, j` of any graph: `e_i Z e_j = 0`, so the middle factor of
  `B_i B_j` vanishes and the two complexes commute up to homotopy.
- An isolated vertex: `Z` has the dual-numbers factor `k[x]/(x²)`, `B_i` is the complex
  `[k[x]/(x²) ⊗_k k[x]/(x²) ⟶ k[x]/(x²)]`, and the coevaluation is `1 ↦ e_i ⊗ x_i + x_i ⊗ e_i`.

### Dependencies

Layer 8 uses Layers 2--3 (basis, trace, projectives and graded Homs), Layer 7 (the dualities, for
the transfer item), Tau Ceti's braid complexes, Mathlib's homological complexes and homotopy
categories, GrothendieckEulerForms, and DGAInfinity Layers 1, 2, 5, 6 and 11.

## Downstream consumers

- McKaySkewGroup consumes the ordinary zigzag algebra of a simple McKay graph and the
  parameterized skew-zigzag algebra of an odd cycle (the skew-group convention above), the
  orientation independence of Layer 4 and the transfer theorem of Layer 8.
- StablePeriodicCurved consumes the symmetric Frobenius traces of Layer 2 as its class of
  examples and supplies in return the stable-category machinery that Layer 6 leaves to it.
- KhovanovHomology leaves the Khovanov--Seidel braid actions to Layer 8.

## Worked examples

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

## References

- Huerfano--Khovanov, [*A category for the adjoint
  representation*](https://arxiv.org/abs/math/0002060) (arXiv v2): strict and skew zigzag algebras, low-rank
  conventions, bases, trace, quantum Cartan matrices, quadratic duals, McKay Morita equivalence,
  and graph braid actions.
- Ehrig--Tubbenhauer, [*Algebraic properties of zigzag
  algebras*](https://arxiv.org/abs/1807.11173) (arXiv v2): bases, graded Cartan matrices, symmetric Frobenius
  structure, projectives, and representation-theoretic structure.
- Couture, [*Skew-Zigzag Algebras*](https://arxiv.org/abs/1509.08405) (arXiv v2), Theorems 4.8
  and 4.12, with Lemma 4.3 and Proposition 4.4 for graphs with at least three vertices: parameter
  gauge equivalence, graph cohomology, and the distinction between vertex-fixing and arbitrary
  graded algebra isomorphisms.
- Etingof--Eu, [*Koszulity and the Hilbert series of preprojective
  algebras*](https://arxiv.org/abs/math/0512287) (arXiv v1), Theorem 3.4.2: non-Dynkin
  Koszulity and the Hilbert series `(1 − Ct + t²)⁻¹` over every field; Definitions 2.1.2 and
  2.3.3 and Theorem 2.3.4 for matrix Hilbert series and the Koszul complex.
- Crawley-Boevey, [*Quiver algebras, weighted projective lines, and the Deligne--Simpson
  problem*](https://www.mathunion.org/fileadmin/ICM/Proceedings/ICM2006.2/ICM2006.2.ocr.pdf):
  additive/deformed preprojective conventions and orientation independence.
- Crawley-Boevey, [*Preprojective algebras, differential operators and a Conze embedding for
  deformations of Kleinian singularities*](https://www.math.uni-bielefeld.de/~wcrawley/preproj2.pdf),
  Comment. Math. Helv. 74 (1999): Lemma 2.2 and Theorem 2.3, p. 5, and Theorem 3.1, p. 6, the
  identification of the presented preprojective algebra with the Baer--Geigle--Lenzing algebra over
  an arbitrary field.
- Ringel, [*The preprojective algebra of a
  quiver*](https://www.math.uni-bielefeld.de/sfb343/preprints/pr97046.ps.gz), SFB 343 preprint
  97-046, in *Algebras and modules II*, CMS Conf. Proc. 24 (1998): Theorem A, p. 2, the
  tensor-algebra form of the identification, and §6, pp. 16--17, the sign normalisation.
- Brenner--Butler--King, [*Periodic algebras which are almost
  Koszul*](https://doi.org/10.1023/A:1020146502185), Algebr. Represent. Theory 5 (2002),
  Theorem 4.8: the Frobenius property of the preprojective algebra of a Dynkin quiver, cited by its
  locator as attributed by Grant.
- Grant, [*The Nakayama automorphism of a self-injective preprojective
  algebra*](https://arxiv.org/abs/1906.11817) (arXiv v2), Theorem 3.1, p. 7: the preprojective
  algebra of a basic representation-finite hereditary algebra over any field is Frobenius.
- Etgü--Lekili, [*Koszul duality patterns in Floer
  theory*](https://arxiv.org/abs/1502.07922) (arXiv v6): the 2-dimensional Ginzburg model, derived Koszul
  duality, completion, and formality comparisons.
- Keller, [*Deformed Calabi--Yau completions*](https://arxiv.org/abs/0908.3499) (arXiv v5): derived
  Calabi--Yau completions and the 3-dimensional Ginzburg construction.
- Liu--Wang, [*A-infinity deformations of zigzag algebras via Ginzburg dg
  algebras*](https://arxiv.org/abs/2301.06757) (arXiv v3): Definition 4.1 (deformations and
  intrinsic formality), Theorem 4.2 (criterion), Propositions 3.2 and 4.4 (Hochschild
  comparisons), Corollary 3.4 (cyclic quotient criterion), Theorem 1.1 (the finite-tree theorem in
  arbitrary characteristic) and Example 4.7.
- Khovanov--Seidel, [*Quivers, Floer cohomology, and braid group
  actions*](https://arxiv.org/abs/math/0006056) (arXiv v2): two-term bimodule complexes and the faithful type
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
