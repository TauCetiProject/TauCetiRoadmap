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

- affine simply-laced Dynkin diagrams and their generalized Cartan matrices, which neither
  Mathlib nor Tau Ceti supplies and which several milestones below need;
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

For a binary finite subgroup `Γ ⊂ SU(2)`, the exterior skew group algebra
`Λ(C²) ⋊ Γ` is Morita equivalent to the **ordinary zigzag algebra of the affine ADE McKay graph**.
For a nonbinary subgroup, necessarily an odd cyclic group, the basic algebra has an odd-cycle
skew-zigzag relation in which the two backtracks sum to zero.  It is not the ordinary odd-cycle
zigzag algebra over characteristic zero.  The algebraic McKay roadmap therefore consumes:

- ordinary affine zigzag for binary groups; and
- the explicitly parameterized skew-zigzag algebra for odd cyclic groups.

It does not use “affine zigzag” as a name that hides this distinction.  In characteristic two the
sign distinction collapses, and that specialization is stated separately.

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
- `TauCeti.DynkinType`, its validity and simply-laced predicates, standard Cartan matrices, and
  Bourbaki numbering.  These are the **finite** types only: `DynkinType` has no affine
  constructors, and `FiniteType/AffineD.lean`'s `doubleForkCartanMatrix` is a single obstruction
  used inside the Cartan--Killing classification, not a general affine API.  Mathlib has none
  either.  Layer 0 below therefore constructs the affine simply-laced diagrams this roadmap and
  the downstream McKay roadmap both use.

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

- Define the affine simply-laced diagrams as an inductive family `ÃₙD̃ₙẼ₆Ẽ₇Ẽ₈` with its node count,
  underlying `SimpleGraph`, and generalized Cartan matrix `2I - A`.  Handle `Ã₁` as the
  multiplicity-two matrix `!![2,-2;-2,2]`, which is not the Cartan matrix of a simple graph, and
  exclude it from every simple-graph construction below rather than forcing it in.  Prove:
  each diagram is connected; deleting the marked affine node gives the corresponding finite
  `TauCeti.DynkinType` diagram, with an explicit relabelling matching the Bourbaki numbering; the
  symmetrized form is positive semidefinite; and its radical is spanned by the marks, the
  vector `δ` with `Cδ = 0` and `δ` equal to `1` at the affine node.  Give the star descriptions
  `Ẽ₆=T_{3,3,3}`, `Ẽ₇=T_{2,4,4}` and `Ẽ₈=T_{2,3,6}` and prove them.
  This is the data the downstream McKay roadmap identifies its McKay graphs with; it owns the
  representation-theoretic side and consumes the diagrams from here.
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
  define the uniform public `ZigzagAlgebra` as the finite product of the algebras of connected
  components, using the dual numbers precisely on singleton components.  Prove the comparison
  with the relation quotient on every connected component with an edge, without claiming a false
  quadratic presentation.
- For a graph with cyclically ordered or scalar-labelled incident edges, define a skew-zigzag
  algebra by nonzero ratios between backtracks.  State the cocycle/gauge equivalence relation on
  parameters.  For a connected graph of the cardinality required by Couture, over a field
  containing square roots, identify **vertex-fixing graded** isomorphism classes with
  `H¹(G,kˣ)`; identify arbitrary graded algebra isomorphism classes only after quotienting that
  set by `Aut(G)`.  Prove that every skew-zigzag algebra on a tree is isomorphic to the ordinary
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
  non-Dynkin graphs, including affine ADE, prove infinite-dimensionality and the relevant Hilbert
  series/Koszul theorem.  State the hypotheses excluding loops or handle looped quivers in a
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
  vanishing of `HH^{2,q}` for positive `q` implies intrinsic formality.  This roadmap adds the
  zigzag-specific Hochschild comparison; it does not redevelop general deformation theory.
- For a non-ADE finite tree, choose a nonzero Hochschild class, deform the differential of
  `Π₂(Q)`, and transfer along a specified contraction to obtain a nontrivial minimal `A∞`
  deformation of `Z(Γ)`.  Prove nontriviality modulo `A∞` isomorphism; merely displaying a higher
  multiplication is insufficient.
- Work out Liu--Wang Example 4.7 for extended `D₄`: the cycle
  `β₄ α₁ β₁ α₄` gives an operation `m₄` whose only nonzero values on arrow quadruples (up to one
  common scalar) are
  `m₄(β₄,α₁,β₁,α₄)=β₄α₄`,
  `m₄(α₄,β₄,α₁,β₁)=α₁β₁`,
  `m₄(β₁,α₄,β₄,α₁)=β₁α₁`, and
  `m₄(α₁,β₁,α₄,β₄)=α₄β₄`; all other higher products on arrows vanish.  Verify its Stasheff
  identity and bigrading.  Treat it as a non-ADE test, not as the classification proof.
- Prove Liu--Wang's exact theorem: for a finite tree over a field, path-graded `Z(Γ)` is
  intrinsically formal exactly when `Γ` is ADE and the characteristic is not bad: `2` for type
  `D`, `2` or `3` for `E₆,E₇`, and `2,3,5` for `E₈`.  Consequently, over characteristic zero it is
  intrinsically formal exactly for finite ADE trees.

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
- In a Hom-finite triangulated category with the required Serre duality/perfect pairings, and an
  `A_m`-configuration of `n`-spherical objects -- one-dimensional total Hom for adjacent vertices
  and vanishing total Hom for nonadjacent vertices -- construct the Seidel--Thomas evaluation-cone
  twists and prove the corresponding type-`A_m` braid relations.
  Compare it with the zigzag bimodule complex only after constructing the required graded/Serre
  identification.  Do not call a projective module cohomologically spherical solely because its
  graded endomorphism algebra has two basis elements.
- Prove natural transfer of the action through a **supplied** Morita or derived equivalence,
  including the derived-Koszul comparison when its hypotheses hold.  The downstream McKay roadmap
  constructs the exterior-skew-group equivalence and instantiates this abstract transfer theorem.

---

## Named examples and acceptance criteria

Every example is computed from the general definitions and also exposed through convenient named
declarations.

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
- Couture, [*Skew-Zigzag Algebras*](https://arxiv.org/abs/1509.08405), especially Theorems 4.8
  and 4.12: parameter gauge equivalence, graph cohomology, and the distinction between
  vertex-fixing and arbitrary graded algebra isomorphisms.
- Etingof--Eu, [*Koszulity and the Hilbert series of preprojective
  algebras*](https://arxiv.org/abs/math/0512287): non-Dynkin Koszulity and Hilbert series.
- Crawley-Boevey, [*Quiver algebras, weighted projective lines, and the Deligne--Simpson
  problem*](https://www.mathunion.org/fileadmin/ICM/Proceedings/ICM2006.2/ICM2006.2.ocr.pdf):
  additive/deformed preprojective conventions and orientation independence.
- Etgü--Lekili, [*Koszul duality patterns in Floer
  theory*](https://arxiv.org/abs/1502.07922): the 2-dimensional Ginzburg model, derived Koszul
  duality, completion, and formality comparisons.
- Keller, [*Deformed Calabi--Yau completions*](https://arxiv.org/abs/0908.3499): derived
  Calabi--Yau completions and the 3-dimensional Ginzburg construction.
- Liu--Wang, [*A-infinity deformations of zigzag algebras via Ginzburg dg
  algebras*](https://arxiv.org/abs/2301.06757): Hochschild comparison, explicit deformations, and
  the exact finite-tree intrinsic-formality theorem in arbitrary characteristic.
- Khovanov--Seidel, [*Quivers, Floer cohomology, and braid group
  actions*](https://arxiv.org/abs/math/0006056): two-term bimodule complexes and the faithful type
  `A` braid action.
- Seidel--Thomas, [*Braid group actions on derived categories of coherent
  sheaves*](https://arxiv.org/abs/math/0001043): spherical objects, evaluation-cone twists, braid
  relations, and faithfulness under its stated geometric/categorical hypotheses.

Review should include a specialist in zigzag/preprojective algebras, an `A∞` deformation theorist,
and a Lean reviewer familiar with graded quotients and DG sign conventions.  The acceptance review
checks the one-vertex and one-edge definitions, path-product handedness, the two Ginzburg
dimensions, completion hypotheses, bad characteristics, and every claimed braid-faithfulness
hypothesis.
