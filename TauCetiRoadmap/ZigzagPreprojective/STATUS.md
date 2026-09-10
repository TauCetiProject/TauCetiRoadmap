<!--tauceti-status:v1 {"roadmap":"ZigzagPreprojective","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: ZigzagPreprojective

This file documents the status of the ZigzagPreprojective roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–2 are done for graphs without isolated vertices, Layer 3's graded Cartan matrix and projective Hom dictionary are done, and Layer 4's preprojective algebra is defined with orientation and gauge independence proved. Skew zigzag, the componentwise corrections, and the Frobenius packaging are partial; Layers 5–8 and every named example beyond `A₁` have not begun.

### Named results

- **Graded Cartan formula** — for a finite simple graph with no isolated vertex, the graded Cartan matrix of the zigzag relation quotient is `(1 + q²) I + q A_G`, proved entrywise and equal to the graded dimensions `∑_d dim Hom(P_i{d}, P_j) q^d` of the vertex projectives ([`TauCeti.zigzagGradedCartanMatrix_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/CartanMatrix.html#TauCeti.zigzagGradedCartanMatrix_eq)).
- **Orientation independence of the preprojective algebra** — reversing any set of arrows of a finite quiver gives an isomorphic additive preprojective algebra, the isomorphism negating exactly the reverses of the turned-around arrows, over any commutative ring ([`TauCeti.reorientPreprojectiveAlgebraEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Preprojective/Orientation.html#TauCeti.reorientPreprojectiveAlgebraEquiv)).
- **Symmetric perfect Frobenius pairing** — `(x, y) ↦ tr(xy)` on a zigzag algebra without isolated vertices is symmetric and perfect, its Gram matrix being the permutation matrix of an involution of the basis ([`TauCeti.zigzagTracePairing_isPerfPair`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Trace.html#TauCeti.zigzagTracePairing_isPerfPair)).
- **Centre of a zigzag algebra** — for a preconnected graph with at least two vertices the centre has basis `1` and the volume classes, hence dimension `|V| + 1` ([`TauCeti.finrank_center_nonisolatedZigzagQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Center.html#TauCeti.finrank_center_nonisolatedZigzagQuotient)).
- **Affine simply-laced form is positive semidefinite** — with radical exactly the line of the marks, for every valid affine diagram including `Ã₁` ([`TauCeti.AffineDynkinType.posSemidef_realCartanMatrix`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/PositiveSemidefinite.html#TauCeti.AffineDynkinType.posSemidef_realCartanMatrix)).

### Notable definitions and infrastructure

- The public componentwise zigzag algebra, a product over connected components using dual numbers on singletons, which lets the low-rank `A₁` convention coexist with the uniform quotient ([`TauCeti.zigzagAlgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Componentwise.html#TauCeti.zigzagAlgebra)).
- Grading descent to quotients by homogeneous two-sided ideals, which turns both the zigzag and preprojective quotients into internal direct sums of graded pieces ([`TauCeti.GradedAlgebra.gradedAlgebraGradeQuot`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.html#TauCeti.GradedAlgebra.gradedAlgebraGradeQuot)).
- The dictionary `Hom(Ae, Af) ≅ eAf` for idempotents, which reduces every Cartan and Hom computation to corners of the algebra ([`TauCeti.spanSingletonHomEquivCorner`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Idempotents/Hom.html#TauCeti.spanSingletonHomEquivCorner)).

### Roadmap coverage

- **Layer 0**: done — affine diagrams with `Ã₁` excluded from graph constructions, marks, semidefiniteness, Bourbaki-numbered deletion, doubled quivers with components, adjacency matrices and the `Symmetrify` comparison, short paths, relation ideals with universal property and graph functoriality, grading descent. The componentwise product is defined; its basis, centre, and trace decompositions are not.
- **Layer 1**: partial — uniform quotient, quadratic agreement for connected graphs with at least three vertices, `A₁` dual numbers, public product, graph invariance done; `A₂` is served only by the uniform quotient, with no dedicated presentation; the skew quotient with Couture's parameter laws exists, but the `H¹(G, kˣ)` classification, tree triviality, cycle analysis, scalar extension, and skew trace are untouched.
- **Layer 2**: done for graphs without isolated vertices — basis, dimension, multiplication table, radical filtration with `rad³ = 0`, socle, top, trace, centre. Untouched: isolated-vertex correction, the `A₁` check, the Frobenius/self-injective packaging, rank-one and disconnected centre formulas, skew extensions.
- **Layer 3**: partial — vertex projectives, shifts, `Hom(P_i, P_j{d})`, the graded Cartan formula and its Hom interpretation done; head and radical layers of `P_i`, the bound-quiver comparison, the `K₀` reading, Ext `q`-Euler values, and the inverse quantum Cartan comparison untouched.
- **Layer 4**: partial — definition, local relations, universal property, grading, ring-level base change, orientation and gauge independence done; the opposite-algebra comparison, ADE finite-dimensionality, non-Dynkin infinite-dimensionality and Koszulity, and the moment-map comparison untouched.
- **Layers 5–8**: untouched.
- **Named examples**: only `A₁`, via the dual-numbers comparison; `D₄`, `E₈`, affine `E₈`, the `A₂` verifications, and the non-bipartite example are untouched, though the `Ẽ₈` diagram and its deletion to `E₈` exist from Layer 0.

## The frontier

- **Componentwise corrections** — dimension, basis, centre, and trace for the public `zigzagAlgebra` with isolated vertices; the product definition and the `A₁` comparison are in place.
- **Frobenius and self-injective packaging** — the pairing is symmetric and perfect; what remains is to package the symmetric Frobenius and self-injective structures the README names.
- **Named examples** — `dim Z(D₄) = 14`, `dim Z(E₈) = 30`, `dim Z(Ẽ₈) = 34` with centres `5`, `9`, `10` are now instances of the general basis and centre theorems once the graphs are built from `DynkinType.cartanMatrix` and the Layer 0 `Ẽ₈`.
- **Skew-zigzag classification** — Couture's `H¹(G, kˣ)` theorem, tree triviality, and the odd-cycle skew class; the parameterised quotient exists but nothing is proved about isomorphism classes.
- **Preprojective dichotomy** — finite-dimensionality and self-injectivity for finite ADE, infinite-dimensionality and Koszulity for non-Dynkin graphs; no Hilbert-series or Koszul infrastructure has landed.
