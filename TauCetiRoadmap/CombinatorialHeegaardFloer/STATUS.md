<!--tauceti-status:v1 {"roadmap":"CombinatorialHeegaardFloer","to_sha":"11ef09d4d6e560655ed762ace27ef2858e9117cd","ts":"2026-08-03T18:31:13Z"}-->
# Status: CombinatorialHeegaardFloer

This file documents the status of the CombinatorialHeegaardFloer roadmap up until `11ef09d` (2026-08-03T18:31:13Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Two of the five lanes are under construction and neither has reached its
first summit: Lane G has grid diagrams, grid states, the Maslov and Alexander gradings, the
fully blocked complex over `𝔽₂` and the complete grid-move calculus, but no invariance
theorem and no homology of a grid larger than `2 × 2`; Lane L has plumbing lattices,
characteristic covectors and a graded lattice chain complex over `𝔽₂[U]`, but no computed
example and no invariance. Lanes ALG, K and H have not begun.

### Named results

- **Links as grids modulo moves** — [`GridLink`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Move.html#TauCeti.GridLink) is grid diagrams of arbitrary size modulo cyclic permutation, commutation and (de)stabilization, and [two diagrams present the same link exactly when moves connect them](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Move.html#TauCeti.GridDiagram.toGridLink_eq_iff_movesTo), so the roadmap's "no privileged representation" convention is a definition and invariants can be built by [lifting](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Move.html#TauCeti.GridLink.lift) move-invariant functions.
- **The torus grid component count** — a standard `(p+1, q+1)` torus grid has [`gcd (p+1) (q+1)` components](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/TorusLink.html#TauCeti.GridDiagram.componentCount_torusLink), hence [is a knot exactly when the winding numbers are coprime](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/TorusLink.html#TauCeti.GridDiagram.isKnot_torusLink_iff): the first family the theory can name, with the trefoil and the Hopf link as instances.
- **The lattice differential squares to zero** — [`latticeDifferential_comp_self`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Plumbing/Differential.html#TauCeti.PlumbingGraph.latticeDifferential_comp_self), the weighted face-sum differential on plumbing-lattice cubes over `𝔽₂[U]`, which is what makes lattice homology exist at all.
- **Blow-up splits the intersection form** — [`intersectionForm_blowUpVertexEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Plumbing/BlowUp.html#TauCeti.PlumbingGraph.intersectionForm_blowUpVertexEquiv) identifies the blown-up lattice form with the old one plus an orthogonal `⟨-1⟩`, and hence [preserves and reflects negative-definiteness](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Plumbing/BlowUp.html#TauCeti.PlumbingGraph.isNegativeDefinite_blowUpVertex_iff): the first of the Neumann moves in usable form.
- **`E₈` is negative definite** — [`e8Plumbing_isNegativeDefinite`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Plumbing/E8.html#TauCeti.e8Plumbing_isNegativeDefinite), by an explicit integral completion of squares; the plumbing whose lattice homology is the roadmap's acceptance criterion is now a defined object satisfying the hypothesis the theory needs.

### Notable definitions and infrastructure

- [`componentPerm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Diagram/Components.html#TauCeti.GridDiagram.componentPerm) and [`IsKnot`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Diagram/Components.html#TauCeti.GridDiagram.IsKnot): traversing a diagram from `O` to `X` and back gives a permutation whose cycles are the link components, so a grid can say how many strands it presents; this is invariant under every symmetry and every commutation so far considered, and is what makes statements about knots rather than links possible.
- [`fullyBlockedHomology`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Grid/Homology.html#TauCeti.GridDiagram.fullyBlockedHomology): cycles of the fully blocked `𝔽₂` differential modulo boundaries, with the diagonal reflection, half-turn rotation and marking swap all promoted to linear equivalences of cycles and of boundaries, so symmetries of a diagram act on its homology.
- [`latticeChainComplex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Plumbing/ChainComplex.html#TauCeti.PlumbingGraph.latticeChainComplex): the cubically graded complex of a plumbing graph and a [characteristic covector](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Plumbing/Characteristic.html#TauCeti.PlumbingGraph.IsCharacteristicVector), built so that homology is Mathlib's canonical homology object rather than a hand-rolled quotient.

### Roadmap coverage

Lane G.1–G.2 are done: diagrams, states (`n!` of them), rectangles, the `J`-function gradings
`M_O`, `M_X` and `A`, and their behaviour under the diagram symmetries. G.3 is partial — the
fully blocked complex over `𝔽₂` exists with cycles, boundaries and homology, but the unblocked
`GC⁻` over `𝔽₂[V₁,…,Vₙ]` and the simply blocked theory do not, and the chain module carries no
grading decomposition. G.5 has its combinatorial half only: the moves are defined, reversible
and shown to preserve component counts, but no pentagon-counting chain map or hexagon homotopy
exists, so invariance is unproved. G.4 and G.6–G.13 are untouched, as are Lane ALG (no bigraded
or filtered API), Lane K and Lane H. Lane L is the furthest along relative to its own scope:
definitions, negative-definiteness criteria, spin^c conjugation and a graded complex, all in
characteristic two, with no invariance and no computed homology.

## The frontier

- **Grid homology of a nontrivial grid.** Every homology computed so far lives in size `n ≤ 2`,
  where the differential vanishes outright; the trefoil's `5 × 5` grid needs the rectangle-count
  and differential-support lemmas driven to an actual evaluation. This is the roadmap's own first
  acceptance criterion and it is not yet met.
- **Commutation invariance.** The move calculus supplies the statement and `GridLink.lift`
  supplies its home, but the pentagon-counting chain maps and hexagon-counting homotopies do not
  exist yet. Stabilization invariance additionally needs the mapping-cone identification, so it
  waits on the unblocked complex.
- **Euler characteristic = Alexander polynomial (G.4).** Blocked by Lane ALG: the gradings are
  functions on states, not a decomposition of the chain module, so there is nothing yet to take
  an Euler characteristic of.
- **Lattice homology of a concrete plumbing.** `E₈` and the complex both exist, but nothing
  computes `ℍ`. Matching the literature will also want `ℤ[U]` coefficients rather than the
  present characteristic-two theory, and invariance needs the remaining Neumann moves beyond
  blow-up.
- **Lane H (stable `HF̂`).** Untouched. Pointed Heegaard diagram combinatorics, admissibility and
  the nice-move calculus are all still to be built; nothing in the other lanes feeds it directly.
