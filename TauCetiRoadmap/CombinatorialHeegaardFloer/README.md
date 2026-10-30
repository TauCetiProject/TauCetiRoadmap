# Roadmap: Combinatorial Heegaard Floer and grid homology

Heegaard Floer homology (Ozsváth–Szabó) and its knot-theoretic sibling knot Floer
homology are among the most consequential inventions of twenty-first-century
low-dimensional topology: they categorify the Alexander polynomial, detect Seifert
genus and fiberedness, bound the slice genus and unknotting number (reproving the
Milnor conjecture), and power most modern progress on surgery, concordance, and
contact geometry. Nothing remotely near them exists in any proof assistant; Mathlib
has no knots, no 3-manifolds, and no symplectic geometry. This roadmap is the
**combinatorial half**: the bodies of theory that are formalizable now, with real
topological payoffs of their own — grid homology, lattice homology, and the
Ozsváth–Stipsicz–Szabó stable HF̂ — carried all the way down (definition, invariance
proof, and applications). The analytic tower (Fredholm theory, transversality,
Gromov compactness, gluing, Lagrangian Floer homology, holomorphic HF̂) is its
companion [Heegaard Floer roadmap](../HeegaardFloer/README.md); the two meet at
reconciliation theorems that the analytic roadmap states, since they wait on
its slower track.

This is **not a linear roadmap**. It is a family of lanes with many independent
on-ramps; nearly every lane is publishable mathematics on its own, and several would
be a first in any prover. Suggested homes: `TauCeti/KnotTheory/Grid/`,
`TauCeti/KnotTheory/Diagrams/`, `TauCeti/Algebra/Bigraded/`,
`TauCeti/LowDimTopology/` (lattice homology, Heegaard diagrams).

## The organizing dichotomy

**Combinatorial computability is not combinatorial definition-with-invariance.**
Most "combinatorial" results in this field (Sarkar–Wang nice diagrams
([arXiv:math/0607777](https://arxiv.org/abs/math/0607777)), the grid-diagram
computability of all flavors (Manolescu–Ozsváth–Thurston
[arXiv:0910.0078](https://arxiv.org/abs/0910.0078), resting on the ~280-page
Manolescu–Ozsváth link surgery formula
[arXiv:1011.1317](https://arxiv.org/abs/1011.1317)), bordered-Floer factoring of
mapping classes ([arXiv:1010.2550](https://arxiv.org/abs/1010.2550))) are
*algorithms whose correctness certificates are holomorphic*. Exactly two bodies of
theory are combinatorial all the way down (definition, invariance proof, and
applications), plus one combinatorial neighbor:

1. **Grid homology for knots and links** (Manolescu–Ozsváth–Szabó–Thurston
   [arXiv:math/0610559](https://arxiv.org/abs/math/0610559); the book
   Ozsváth–Stipsicz–Szabó, *Grid Homology for Knots and Links*, AMS 2015). The
   book's main line (Chapters 1–15) is deliberately self-contained: invariance
   reduces to Cromwell's theorem (proved in its Appendix B), spectral sequences are
   explicitly avoided, and the holomorphic identification (Chapter 16) is needed for
   **nothing**: not invariance, not τ, not the combinatorial Milnor-conjecture
   proof, not the slice-genus bound, not the Legendrian/transverse invariants, not
   ℤ coefficients. What is lost without holomorphic input is only sharpness and
   detection (genus *detection*, fiberedness, unknot detection).
2. **Stable combinatorial HF̂ of 3-manifolds** (Ozsváth–Stipsicz–Szabó
   [arXiv:0912.0830](https://arxiv.org/abs/0912.0830), ℤ-signs sequel
   [arXiv:1301.0480](https://arxiv.org/abs/1301.0480)): the *unique* published
   fully-combinatorial definition-plus-invariance of a Heegaard Floer 3-manifold
   invariant: HF̂ up to tracked `(𝔽 ⊕ 𝔽)`-tensor factors, exactly HF̂ for
   `b₁(Y) = 0` via a twisted refinement.
3. **Lattice homology** has distinct algebraic models whose hypotheses must stay visible.
   Némethi's cohomological weight-function model is not, by notation alone, the
   homology of the full cubical `[K,E]` complex used by the analytic roadmap. The
   full integral model here is an independent target; its signed cubical differential,
   nonnegative exponents, and homology are specified below. The comparison with
   `HF⁻` belongs to the analytic roadmap (item 2 of the Reconciliations section of
   the [Heegaard Floer roadmap](../HeegaardFloer/README.md)); the source-backed
   scope that this roadmap supplies it for is Zemke's Theorem 1.1:
   plumbing trees of spheres, completed `𝔽[[U]]` coefficients, relatively graded
   when `b₁ = 0`. No comparison among the lattice models below, and no integral or
   general-graph comparison with `HF⁻`, follows from that theorem.

These three are exactly what this roadmap formalizes. The holomorphic theory is
**on the roadmap, not a non-goal** — it is just the [other half](../HeegaardFloer/README.md),
and the seams where the two halves meet are the reconciliation theorems, which that
roadmap owns (they are analytic-blocked, so they live with the slower track).

## The end goals

- **v1 (knots, combinatorial).** Grid homology `GH̃`, `GĤ`, `GH⁻` over 𝔽₂ with full
  invariance, the concordance invariant τ, and the **Milnor conjecture**
  `u(T_{p,q}) = (p−1)(q−1)/2`, a genuinely celebrated theorem (first proved by
  Kronheimer–Mrowka with gauge theory), by pure combinatorics.
- **v2 (3-manifolds, combinatorial).** Ozsváth–Stipsicz–Szabó's stable `HF̂_st(Y)`
  over 𝔽₂, with its purely topological invariance proof.
- **Reconciliations (owned by the analytic roadmap).** Each invariant here has a
  "the two definitions agree" theorem matching it to its holomorphic counterpart
  (grid homology = knot Floer homology; `HF̂_st` = stabilized holomorphic `HF̂`;
  completed mod2 lattice homology = completed `HF⁻` for spherical plumbing
  trees, with integral and broader-graph comparisons as separately specified
  problems). These seams wait on the
  analytic tower, which is the long pole, so they are stated and tracked in the
  [analytic roadmap](../HeegaardFloer/README.md), not here.

```lean
-- shapes of the end goals (Suggested.lean states those statable at the pins):
--
-- v1: grid homology is a link invariant, and τ bounds unknotting number:
-- def GH' (G : GridDiagram) : BigradedModule (ZMod 2) := ...   -- simply blocked GĤ
-- theorem GH'_invariant (G G' : GridDiagram) (h : G.MovesTo G') : GH' G ≅ GH' G'
-- theorem tau_le_unknotting (K : GridKnot) : |τ K| ≤ unknottingNumber K
-- theorem milnor_conjecture (p q : ℕ) (h : Nat.Coprime p q) :
--     unknottingNumber (torusKnot p q) = (p - 1) * (q - 1) / 2
```

## Standing conventions (spell them out; never bake in)

- **𝔽₂ first, ℤ as a separate later stage.** Signs are a genuinely separable layer
  everywhere in this subject: grid homology has sign assignments
  (MOST; Gallais [arXiv:0706.0089](https://arxiv.org/abs/0706.0089)). State every 𝔽₂
  theorem so the coefficient ring can be generalized without restating the topology.
- **A link *is* (at first) a grid diagram modulo grid moves.** Knot theory needs no
  privileged representation: the grid theory is self-contained with this
  definition, and the identification with embeddings `S¹ ↪ S³` (via Cromwell's
  theorem and Reidemeister calculus) is its own lane (K), not a prerequisite.
  Reconciliation theorems connect representations later; nothing in Lane G waits
  for topology.
- **State invariance naturality-ready.** In a proof assistant you must decide on
  day one whether "the invariant" is an isomorphism class, a group, or a transitive
  system of groups and isomorphisms (Juhász–Thurston–Zemke
  [arXiv:1210.4996](https://arxiv.org/abs/1210.4996)). Phrase invariance as
  specified isomorphisms attached to elementary moves, with composition laws stated
  as separate (later) targets, even while the first theorems prove only the
  isomorphism class. ⚠ Basepoint-moving maps act nontrivially (Zemke); do not
  quotient them away silently.
- **Track stabilization factors explicitly.** For an `ℓ`-component link, the
  fully blocked grid homology satisfies `GH̃(G) ≅ GĤ(L) ⊗ W^{⊗(n−ℓ)}` under the
  chosen grading convention; the knot case has `ℓ=1` and exponent `n−1`.
  Here `W = 𝔽 ⊕ 𝔽` in bigradings (0,0), (−1,−1); OSS's 3-manifold invariant is *stable*
  in the same sense. Build the "graded vector space up to `⊗W`-stabilization"
  quotient as API, not ad hoc.
- **Mind the knot/link grading bookkeeping.** For a grid of size `n` with `ℓ`
  components, the blocked-to-unblocked Alexander normalization uses the link
  correction `(n−ℓ)/2`; the knot-only formula is the special case `ℓ = 1`, hence
  `(n−1)/2`. Integer-valuedness is a lemma, not a definition. State the chosen
  Maslov/Alexander conventions and prove the correction is invariant under each
  link stabilization. Do not reuse the knot shift for links.
- **Keep "computes" as a requirement, not an afterthought.** The acceptance
  criteria below evaluate the invariants on explicit small grids (`n ≤ 5` has at
  most `120` generators). Definitions whose differentials cannot be evaluated by
  `decide`/`Decidable` instances (or fast enough kernel reduction) on those
  examples should be revised. (Lesson from Coq/Agda homology efforts: making
  formal homology compute is the recurring pain point.)

## Inventory: what Mathlib master gives us (consume)

- **Homological algebra, the strong point:** `Mathlib/Algebra/Homology/*`,
  complexes over any `ComplexShape ι` (so ℤ×ℤ-bigraded complexes are immediate),
  homology via `ShortComplex`, homotopies and `HomotopyEquiv.toHomologyIso`
  (`Homotopy.lean`), **mapping cones** (`HomotopyCofiber.lean`,
  `HomotopyCategory/MappingCone.lean`), snake lemma and the long exact sequence
  (`ShortComplex/ShortExact.lean`, `HomologySequence.lean`), bicomplexes/total
  complexes, Euler characteristics (`EulerCharacteristic.lean`). All of it applies
  over `ModuleCat (MvPolynomial (Fin n) (ZMod 2))` directly.
- **Grid combinatorics:** `Mathlib/GroupTheory/Perm/*` (including `Sign`),
  permutation matrices, `Finset`/`Fintype`, `ZMod n` for toroidal indexing.
- **Graded objects:** `Mathlib/CategoryTheory/GradedObject.lean` (+ monoidal
  structure), `DirectSum`, `MvPolynomial`.
- **Presented monoids** (`Mathlib/Algebra/PresentedMonoid/Basic.lean`, from Hannah
  Fechtner's braid program): the seed for Lane K's braid groups.

## Inventory: what Tau Ceti gives us (consume)

At the pinned Tau Ceti the first layers of Lanes G and L exist and are consumed, not
rebuilt.

- **Grid diagrams and moves** (`TauCeti/KnotTheory/Grid/Diagram`, `Move`):
  `TauCeti.GridState`, `TauCeti.GridDiagram` (`O`/`X` markings as grid states),
  the move relation `GridDiagram.IsMove` with its closure `GridDiagram.MovesTo`,
  the quotient `TauCeti.GridLink`, commutations (`GridDiagram.IsCommutation`),
  stabilizations (`GridDiagram.IsStabilization`), and the component count with
  `GridDiagram.IsKnot` and `GridDiagram.MovesTo.isKnot_iff`.
- **Grid complexes and homology** (`Grid/Chain/Complex.lean`, `Grid/Homology`):
  `GridDiagram.fullyBlockedComplex`, `GridDiagram.unblockedComplex`,
  `GridDiagram.simplyBlockedComplex` with their homologies
  `GridDiagram.fullyBlockedHomology`, `GridDiagram.unblockedHomology` and
  `GridDiagram.IsKnot.simplyBlockedHomology`; the `𝔽[U]`-module structure on `GH⁻`
  of a knot grid (`GridDiagram.IsKnot.unblockedHomologyModule`) and its Alexander
  grading (`GridDiagram.IsKnot.alexanderUnblockedHomologyGrading`).
- **Euler characteristic** (`Grid/EulerCharacteristic.lean`): for grids with an odd number of components, the graded Euler
  characteristic of the fully blocked complex as a grid determinant,
  `OddComponentGridDiagram.gradedEulerChar_eq_smul_T_mul_det_weightMatrix`.
- **τ on one diagram** (`Grid/Homology/Tau.lean`): `GridDiagram.IsKnot.tau`, its
  transfer along degree-zero isomorphisms (`GridDiagram.IsKnot.tau_eq_of_linearEquiv`)
  and along maps with a left inverse up to `U`-powers
  (`GridDiagram.IsKnot.tau_le_tau_sub_of_comp_eq_X_pow_smul`), invariance under one
  `X`-stabilization (`GridDiagram.IsKnot.tau_stabilizeX`), and the torus-link values
  in `Grid/TorusLink/Tau.lean`. Invariance of `τ` under all grid moves is not at the
  pin; it is the headline `tau_eq_of_movesTo` below.
- **Seifert-matrix Alexander polynomial** (`TauCeti/KnotTheory/Alexander.lean`):
  `TauCeti.KnotTheory.alexander` on matrices; no grid diagram has a Seifert matrix at the pin.
- **Heegaard region systems** (`TauCeti/LowDimTopology/Heegaard`):
  `TauCeti.HeegaardRegionSystem` with domains, periodic domains and weak
  admissibility, the data side of Lane H.1.
- **Plumbing lattices** (`TauCeti/LowDimTopology/Plumbing`): `TauCeti.PlumbingGraph`
  (a simple graph with integer framings and no genus decoration),
  `PlumbingGraph.IsNegativeDefinite`, `PlumbingGraph.characteristicVectors`,
  `PlumbingGraph.canonicalCharacteristic`, the orbit quotient
  `PlumbingGraph.characteristicOrbits`, and the weight `PlumbingGraph.characteristicWeight`
  `χ_k(x) = −(k(x)+x·x)/2`.
- **Native lattice complex** (`Plumbing/Differential.lean`, `ChainComplex.lean`,
  `Homology.lean`): `TauCeti.PlumbingChain`, the finite-support free module over
  `PlumbingCoefficient = 𝔽₂[U]` on cubes `(x,E)`, the unsigned differential with
  `PlumbingGraph.latticeDifferential_comp_self`, the cubical chain complex
  `PlumbingGraph.latticeChainComplex`, and `PlumbingGraph.latticeChainHomology`.
- **Moves and computations**: `PlumbingGraph.blowUpVertex` and
  `PlumbingGraph.blowUpEdge` with their characteristic covectors
  `PlumbingGraph.blowUpCharacteristic`, `PlumbingGraph.blowUpEdgeCharacteristic`
  and preservation of negative-definiteness; the `U`-tower
  (`PlumbingGraph.exists_injective_latticeHomologyCycleMap`); the one-vertex computation
  (`PlumbingGraph.coefficientEquivLatticeHomologyOfUnique`); and the `E₈` plumbing
  (`Plumbing/E8.lean`). Invariance of homology under the two blow-ups is not at the
  pin; it is the pair of headlines `latticeChainHomology_blowUpVertex` and
  `latticeChainHomology_blowUpEdge` below.

## Inventory: what is missing (build here)

Knot theory beyond grid diagrams, braid words and Seifert matrices; invariance of
`GH⁻` and `GĤ` under commutation and of `τ` under all grid moves; crossing-change
maps and the unknotting number on grid links; bigraded modules over
`𝔽₂[V₁,…,Vₙ]` as a working API; the structure theorem for finitely generated
bigraded `𝔽[U]`-modules (τ's home); filtered complexes and filtered homotopy type
(Mathlib's spectral-sequence machinery is young and has no filtered-complex
constructor, and the grid main line deliberately avoids spectral sequences, so
only the filtered-complex API is needed); the nice-move calculus on Heegaard
diagrams; genus-decorated plumbing graphs, the integral signed lattice complex,
Némethi's cohomological carrier, lattice blow-up invariance, and the comparisons
among cohomological, characteristic-cubical, and completed carriers.

---

## The lanes

### Lane G: grid homology (the spine)

Follow Ozsváth–Stipsicz–Szabó's book, whose chapters are nearly a blueprint
already. Milestone order:

1. **Grid diagrams and grid states.** Toroidal `n × n` grids with `O`/`X`-markings
   (one per row and column); grid states as bijections columns → rows; rectangles,
   and **empty** rectangles `Rect°(x, y)`. ⚠ Encoding choice (plain
   `Equiv.Perm (Fin n)` vs functions on `ZMod n` vs a `2n × 2n` double cover; cf.
   Kyle Miller's "pointed cyclic orders" suggestion) deserves a short experiment
   before committing; the 2025 summer project (acknowledgements) tried all three.
2. **Gradings.** The `J`-function, `M_O`, `M_X`, `A`; integer-valuedness of `A`;
   grading-change formulas across a rectangle.
3. **The complexes and `∂² = 0`.** Fully blocked `GC̃` over 𝔽₂ (rectangles avoiding
   all markings): `∂² = 0` by the juxtaposition case analysis (disjoint /
   overlapping / annular pairs of empty rectangles), finite combinatorics, the
   ideal first nontrivial theorem. Then unblocked `GC⁻` over `𝔽₂[V₁,…,Vₙ]` and
   simply blocked `GĤ`.
4. **Euler characteristic = Alexander polynomial**, via the grid determinant
   formula (book, Chapter 3.3): an early, decidable, self-validating milestone.
5. **Invariance over 𝔽₂.** Grid moves = commutation + (de)stabilization.
   Commutation: pentagon-counting chain maps with hexagon-counting homotopies.
   Stabilization: identify `GC⁻(G')` with the mapping cone of
   `V₁ − V₂ : GC⁻(G)[V₁] → GC⁻(G)[V₁]` (consume Mathlib's cones). ⚠ The homologies
   of the *blocked* theories depend on grid size through `⊗W` factors; only the
   stabilization-quotient (or `GĤ`, `GH⁻`) is the link invariant. The headline
   consequence for knots is `tau_eq_of_movesTo`: if `G` presents a knot and
   `G.MovesTo G'`, then `τ(G') = τ(G)` over every commutative ring of characteristic
   two (book Theorem 5.3.1 with Definition 6.1.5). Tau Ceti already proves the
   `X`-stabilization case (`GridDiagram.IsKnot.tau_stabilizeX`); the remaining input is
   the commutation and `O`-stabilization invariance of `GH⁻` as an Alexander-graded
   `𝔽[U]`-module, transferred by `GridDiagram.IsKnot.tau_eq_of_linearEquiv`.
6. **Basepoint actions.** Within each link component, the corresponding `V`-actions
   are chain homotopic; variables attached to different components are not thereby
   identified. Retain the multivariable `𝔽[V₁,…,V_ℓ]` action until a stated
   specialization/forgetful map is applied. For knots (`ℓ=1`) this gives the usual
   `𝔽[U]`-module and its finitely generated bigraded structure theorem, the home of
   **τ**. For links, record the componentwise action and its naturality.
7. **`|τ(K)| ≤ u(K)`** via crossing-change maps; `τ(T_{p,q})` via the canonical
   cycle; **the Milnor conjecture** (book Chapter 6, after Sarkar
   [arXiv:1011.5265](https://arxiv.org/abs/1011.5265)).
8. **Symmetries and the genus bound** `g(K) ≥ max{s : GĤ(K, s) ≠ 0}`. ⚠ The book is
   explicit that the combinatorial treatment "falls short of showing these bounds
   are sharp"; sharpness is holomorphic (the analytic roadmap's far future); state
   the bound, not detection.
9. **Skein exact sequence; alternating knots are thin; links.** Fix the
   symmetric Alexander-lattice and flavor conventions. For the hat theory the
   Euler characteristic has two branches: for a knot (`ℓ=1`) it is the normalized
   symmetrized Alexander polynomial `Δ_K(t)`; for a link with `ℓ>1` it is
   `∏ᵢ(tᵢ^{1/2}−tᵢ^{−1/2}) Δ_L(t₁,…,tℓ)`, with the source's unit/sign normalization.
   The factor depends on the flavor: for `ℓ>1`, with `nᵢ` the number of
   `O`-markings on component `i`, the fully blocked theory has
   `±Δ_L·∏ᵢ(1−tᵢ^{−1})^{nᵢ} tᵢ^{1/2}` and the unblocked theory `±Δ_L·∏ᵢ tᵢ^{1/2}`
   (book Theorem 11.6.1); the fully blocked factor carries the grid-size dependence.
   Do not obtain the knot formula by substituting `ℓ=1` into the link factor.
   Test both branches on the unknot and the two-component unlink. The grid
   polytope vs Thurston norm remains a bound, not detection.
10. **Slice genus:** `|τ(K)| ≤ g_s(K)` via saddle/birth/death maps and normal forms
    of knot cobordisms (book Appendix B.5): the most topologically substantial
    step of the combinatorial line; gives the combinatorial Kronheimer–Mrowka
    theorem.
11. **Legendrian and transverse GRID invariants** `λ^±`; reprove Chekanov's
    Legendrian non-simplicity of `m(5₂)` combinatorially.
12. **ℤ coefficients** via sign assignments (existence and uniqueness up to gauge;
    MOST §15.2, or Gallais's spin-extension construction).
13. **The filtered theory** (book Chapters 13–14): the Alexander filtration on the
    grid complex over `𝔽[V]`; invariant = filtered quasi-isomorphism type: the
    combinatorial counterpart of `CFK^∞`, and the door to Υ-type concordance
    invariants. Needs Lane ALG's filtered-complex API.

### Lane ALG: bigraded and filtered homological algebra

Mostly assembling Mathlib pieces into a working API, plus genuinely new material:
bigraded modules over `𝔽₂[V₁,…,Vₙ]` with grading-shift conventions; mapping-cone
API at the bigraded level; the **structure theorem for finitely generated bigraded
`𝔽[U]`-modules** (the algebraic home of τ and of "tower plus torsion"
decompositions); **filtered chain complexes** and filtered chain homotopy
equivalence, new to Mathlib, needed only from G.13 onward, and reusable far beyond
this roadmap. ⚠ No spectral sequences are needed anywhere on the main line; resist
building them here.

### Lane K: knot-theory reconciliation

The "no privileged representation" lane, which **consumes** the knot theory built in
the [geometric-topology roadmap](../GeometricTopology/README.md) (layer 4: the
presentations of a knot or link as first-class types, the maps between them, slice-ness,
and the knot polynomials) and connects grid diagrams to it. Grid diagrams are one more
presentation; this lane adds the grid-specific **adequacy theorem**, Cromwell's theorem
(grid moves generate grid equivalence of links; book Appendix B.4, elementary but fiddly
diagrammatic combinatorics), reconciling them with that roadmap's diagrams, braid closures,
and embeddings `S¹ ↪ S³`, and checks G.4's grid determinant against that roadmap's
Alexander polynomial. ⚠ Prior art (Isabelle/AFP knot theory; the Lean `leanknot`
experiment) shows diagram-calculus *adequacy* is where such projects stall, which is
exactly why Lane G does not wait for this lane. ⚠ Coordinate the braid-group and
diagram-calculus foundations with the geometric-topology roadmap (and Hannah Fechtner's
braid-group program) rather than duplicating them here.

### Lane L: lattice homology

Keep three models separate, beside the native Tau Ceti complex, and state their
carrier, coefficient ring, degree, weight, and comparison domain before asserting an
isomorphism. The table fixes each scope; the numbered items below give the
definitions. Section numbers refer to Némethi, arXiv:0709.0841v1, and Zemke,
arXiv:2111.14962v4.

| Model | Graphs and decorations | Carrier and coefficients | Weight | Characteristic sector | Grading | Moves for invariance | Numerical invariants |
|---|---|---|---|---|---|---|---|
| L.1 Némethi cohomology | finite connected, negative-definite intersection form, genus `g_v ≥ 0` (Némethi §2, §3.2.1) | `F^q = Hom_ℤ(C_q, T⁺)`, `T⁺ = ℤ[U,U⁻¹]/Uℤ[U]`, coboundary `δ_w` (§3.1.4) | `w₀ = χ_k`, edge `max(χ_k) + M^{g_v}(|Δχ_k|)`, higher cubes the maximum over edges (§3.2.1) | `k ∈ Char`, orbits `[k]` = torsion `Spin^c` (§2.2.2, §3.3) | value of degree `d − 2w(c)` on a cube `c` (§3.1.4); normalised module `H^*(Γ,[k])` (§3.3.2) | genus-zero `(−1)`-blow-ups/downs of valence ≤ 2 (§3.4.1–3.4.2) | `m_k = min χ_k` (§3.2.3), `eu(H⁰)`, `eu(H^*)` (§3.2.6) |
| L.2 spherical `[K,E]` | finite tree, every genus `0`, arbitrary integral framings (`Q` may be singular) | finite-support `𝔽₂[U]` on `[K,E]`; completed variant `∏ 𝔽₂[[U]]` (Zemke §2.3) | exponents `A_v − g`, `B_v − g` of item 2 | every `K ∈ Char(Γ)`; label = orbit of `K` | cube degree `|E|`; the source's grading on its hypotheses, an absolute grading only for nonsingular `Q` | none requested | none |
| L.3 integral graph/surface chains | finite graph, cycles allowed, integral symmetric `Q`, genus `g_v ≥ 0` | finite-support `ℤ[U]` on oriented cubes `(l,I)`, signed `∂` | Némethi's weight of L.1 | every characteristic `K` | chain degree `q`, `deg U = −2` | none; Némethi's moves only on L.1's domain | none |
| native Tau Ceti | `TauCeti.PlumbingGraph`: simple graph, integer framings, genus `0` implicit | `P.latticeChainComplex k` over `𝔽₂[U]`, finite support on `(x,E)` | maximum of `χ_k` over the cube's vertices (Némethi §3.2.2(a)) | `k : P.characteristicVectors`; orbits `P.characteristicOrbits` | cubical degree `q` only | `PlumbingGraph.blowUpVertex`, `PlumbingGraph.blowUpEdge` on negative-definite `P` | `m_k` (the `U`-tower) |

The native row is the genus-zero, characteristic-two specialisation of the
homological form of L.1 (Némethi Remark 3.4.3(a)) with free `𝔽₂[U]` rather than `T⁺`
coefficients. Grading `U^j·c` by `−2(w(c)+j)`, its degree `−2n` part is the cellular
chain complex of the sublevel cube complex `S_n = ⋃{c : w(c) ≤ n}` (Némethi
§3.1.11), and `U` is induced by `S_n ⊂ S_{n+1}`; hence
`P.latticeChainHomology k q ≅ ⊕ₙ H_q(S_n; 𝔽₂)` as `𝔽₂[U]`-modules. Némethi's proof
of Proposition 3.4.2 gives homotopy equivalences `S_n(Γ',k') ≃ S_n(Γ,k)` compatible
with these inclusions. The two headlines are therefore stated on the native carrier
for a negative-definite `P` and every odd value `ε` on the exceptional class:
`latticeChainHomology_blowUpVertex` (blow-up at a vertex, valence one) and
`latticeChainHomology_blowUpEdge` (blow-up along an edge, valence two), each an
isomorphism of `𝔽₂[U]`-modules in every cubical degree. Némethi's value is
`ε = −1`, for which the blown-up weight is `χ_k(x) + s(s+1)/2` on `φ(x,s)`; any
other odd `ε` lies in the same orbit after adding `2Q(mE_new)`, which changes
`ε` by `−2m` and shifts every weight by a constant (Némethi Lemma 3.3.2), so the
exponents of the differential, and the module, do not change.

1. **Némethi cohomological weight-function model.** On the negative-definite
   decorated-graph domain of Némethi §§3.1–3.2, retain the source's characteristic
   covectors, normalization and genus correction. Let `C_q` be the free abelian
   group on its oriented q-cubes and use the actual tower-valued cochain module
   `F^q=Hom_ℤ(C_q,T⁺)`, where `T⁺=ℤ[U,U⁻¹]/Uℤ[U]`; this full Hom carrier is
   not a finite-support free `𝔽₂[U]` cube module. Retain the source grading, `U`
   action, weighted face-evaluation coboundary, augmentation and reduced output.
   Its vertex function `χ` and `M^g` edge correction use the exact source
   normalization. The degree-zero cohomological construction is distinct from
   homology of the integral chain complex below. Its cited §3.4 invariance target is
   the stated genus-zero `(-1)`-vertex blow-up/down with valence at most two, under
   the source's graph and negative-definiteness hypotheses. Do not promote it to
   arbitrary Neumann moves or arbitrary lattice isometries. The genus-one `(-1)`
   one-vertex case is a required regression: for its canonical `K=-E`, both
   vertices of its edge have weight zero while the edge has weight one; replacing
   the source weight by the spherical maximum loses the reduced cohomology term.
2. **Spherical characteristic `[K,E]` model.** For a finite tree of genus-zero
   vertices with integral weights, a characteristic covector `K`, and a finite
   vertex subset `E`, use cube degree `|E|`. In the source normalization, for
   `I ⊆ E` write `f_K(I)=(⟨K,E_I⟩+Q(E_I,E_I))/2`, where
   `E_I=Σ_{v∈I}E_v`, and `g(K,E)=min_{I⊆E} f_K(I)`. For `v∈E`, set
   `A_v(K,E)=g(K,E\{v})` and
   `B_v(K,E)=min_{I⊆E, v∈I} f_K(I)`. Over `𝔽₂[U]`, the two faces are
   `U^(A_v−g)[K,E\{v}]` and
   `U^(B_v−g)[K+2v*,E\{v}]`, summed over `v∈E`; `v*` is the covector
   `Q(v,·)` in the chosen lattice convention. The roadmap targets nonnegative
   exponents, `d²=0`, and the source's absolute/relative grading and boundary
   `Spin^c` label on their actual hypotheses, then full homology in every cube
   degree—not only degree zero. State orientation and weight normalization. Signs
   and the integral coefficient system are separate targets; they are not supplied
   by this characteristic-two formula.
3. **General graph/surface integral cubical chain model and exact source overlap.** For a
   finite plumbing graph `Γ` with integral symmetric intersection form `Q` and a
   nonnegative genus `g_v` at each vertex (cycles are allowed), fix a characteristic
   covector `K` (`K(x)≡Q(x,x) mod 2`) and use
   `χ_K(l)=−(K(l)+Q(l,l))/2`. Its source-defined edge correction is the fixed
   function `M^{g_v}` of the absolute endpoint change, not a free choice: for the
   oriented edge from `l` to `l+E_v`, set
   `w_K(l,[v]) = max(χ_K(l), χ_K(l+E_v)) + M^{g_v}(|χ_K(l+E_v)−χ_K(l)|)`.
   Here `M^g(n)` is Némethi's function of §3.2.1 (the largest `h¹` of a line bundle
   of holomorphic Euler characteristic `n` on a genus-`g` curve; `M⁰ = 0`,
   `M¹(0) = 1`, `M¹(n) = 0` for `n ≥ 1`, §3.2.2). The weight of a positive-dimensional
   cube is the maximum of its one-dimensional edge weights; vertices retain `χ_K`.
   This fixes the graph, surface labels, characteristic sector, support and weight,
   including the genus-one `(-1)` regression. It does not replace this edge weight
   by the spherical maximum-of-vertices rule.

   Define `w_K(l,∅)=χ_K(l)` and, for `c=(l,I)` with `|I|≥2`, let `w_K(c)` be the
   maximum of its one-dimensional edge weights. For `I={v₁<⋯<v_q}`, let
   `C_q^{Γ,K}` be the finite-support free `ℤ[U]`-module on oriented q-cubes, with
   **chain degree** `q`, `deg(U)=−2`, and the source's absolute/relative grading
   kept separate. Its signed cubical **boundary** is

   `∂(l,I)=Σ_j (−1)^(j−1)(U^(w(c)−w(l,I\{v_j})) (l,I\{v_j})`
   `− U^(w(c)−w(l+E_vj,I\{v_j})) (l+E_vj,I\{v_j}))`.

   The fixed product orientation comes from the displayed vertex order. This map
   lowers cube degree by one. Prove that the exponents are nonnegative integers,
   `∂²=0`, and a vertex-order change induces the orientation isomorphism. Coefficient
   reduction `ℤ[U]→𝔽₂[U]` gives a chain map only to the characteristic-two
   finite-support chain model when the actual generators, weights, and characteristic
   coordinate dictionary match; state and prove those conditions. It is **not** a
   map to Némethi's cochain module merely by reducing coefficients.

   **Némethi's cohomological model is a different carrier.** Let `C_q(Γ,K;ℤ)` be
   the free abelian group on the oriented source cubes and
   `T⁺=ℤ[U,U⁻¹]/Uℤ[U]`. The source cochains are
   `F^q=Hom_ℤ(C_q(Γ,K;ℤ),T⁺)`, with the source grading (a degree-d cochain has
   value of degree `d−2w(c)` on a cube `c`) and the source `U` action. This Hom is
   the full linear-dual carrier; do not silently impose finite support. Its
   coboundary `δ:F^q→F^(q+1)` evaluates on an oriented (q+1)-cube by the
   source's weighted incidence sum of values on its q-faces. Use Némethi's exact
   coefficient and weight conventions, including the augmentation and reduced
   output; prove `δ²=0` on those definitions. This source cochain model has a
   degree-raising differential, while `∂` above is degree-lowering. Even the
   point-cube coefficient modules differ: every element of `T⁺` is killed by some
   power of `U`, while nonzero elements of the free polynomial module `ℤ[U]` are
   not. Therefore no same-generator equality or direct identification is implied.

   State three separate scopes: the integral finite-support chain target above;
   Némethi's `Hom_ℤ(-,T⁺)` cochain target on the negative-definite decorated-graph
   hypotheses of §§3.1–3.2; and the existing characteristic-two native coordinate
   chain complex. The coefficient-reduction arrow is `ρ_q:C_q^{int}→C_q^{native}`
   only after an explicit shared-generator/weight/characteristic-coordinate
   equivalence is constructed; its chain-map equation must be proved. For the source
   cochains, retain the actual evaluation pairing
   `ev_q:C_q^{source}×F^q→T⁺` and the source coboundary `δ_q:F^q→F^(q+1)`.
   Any further map between the native chain model and the source cochains must be
   supplied with an explicit degree rule (including any reversal/shift), support or
   completion, coefficient action, characteristic-label map, and chain/cochain
   compatibility equation. If that comparison needs an intermediate completed dual,
   name its carrier and both maps; do not invent a direct isomorphism. Keep the
   source augmentation/reduced map in the diagram. On graphs outside
   Némethi's domain, retain the integral model without claiming Némethi invariance.
   For the singular-form coordinate map `K=k+2Qx`, specify the characteristic orbit
   or prove a different comparison; it need not be onto all characteristic covectors.

   This lane supplies the integral chain complex, Némethi's cochain complex on its
   source domain, and the comparison data and characteristic labels above to the
   lattice reconciliation (item 2 of the Reconciliations section of the
   [Heegaard Floer roadmap](../HeegaardFloer/README.md)); the surgery presentation, higher maps and
   completion arguments belong to that reconciliation. The source's graph-move
   result is only the genus-zero `(-1)`-vertex blow-up/down of valence at most two;
   any broader move invariance is a separate target.

The Némethi-to-`[K,E]` comparison is a third, separate theorem on the exact overlap
of its hypotheses. It must state whether it compares source cohomology with a dual or
with homology, and give the coefficient, support, completion, degree, sign, grading,
and characteristic-covector translations. For nonsingular `Q`, the affine map
`x ↦ K₀ + 2Qx` identifies the lattice points with characteristic covectors in its
chosen orbit; for singular `Q`, specify the orbit or prove a different comparison.

The current native coordinate chain module has finite-support generators `(x,E)`
over `𝔽₂[U]` and fixes a characteristic vector `k`. Its actual typed interface is
`P.latticeChainComplex k : ChainComplex (ModuleCat PlumbingCoefficient) ℕ`, with
degree object `(P.latticeChainComplex k).X q`, differential
`(P.latticeChainComplex k).d (q+1) q`, and `P.latticeChainHomology k q`; use its
actual `d²=0` theorem and homology API rather than recreating them. These are native
characteristic-two chain signatures only, not the signed `ℤ[U]` model or Némethi's
`Hom_ℤ(-,T⁺)` cochains. A coordinate-to-characteristic reindexing uses `K=k+2Qx`.
When `Q` is singular, this map can identify different coordinates, so an isomorphism
with the full characteristic-labelled complex is not automatic. The zero-framed
one-vertex case must be checked before any completion claim: in the native
finite-support coordinate complex `d(e_x)=v_x+v_(x+1)`, giving `H₀=𝔽₂[U]` and
`H₁=0`; in the characteristic `K=0` sector the two faces coincide and cancel,
giving `H₀=H₁=𝔽₂[U]`. The source's completed characteristic version has `𝔽₂[[U]]`
in both degrees. These are different carriers/support conventions, not an
isomorphism. Keep this regression and prove each comparison on its own domain.

The comparison of lattice homology with `HF⁻` is the lattice reconciliation of the
analytic roadmap (item 2 of the Reconciliations section of the
[Heegaard Floer roadmap](../HeegaardFloer/README.md)), which is downstream of this lane: Lane L is its input and
uses none of its results. The source-backed completed mod-2 theorem (Zemke, Theorem 1.1)
has scope plumbing trees of spheres, completed `𝔽[[U]]` coefficients, and a
relative grading when `b₁ = 0`; any statement of that reconciliation beyond this
scope is not supported by the source. The present lane supplies the concrete
lattice complex and naturality data. Before the theorem is applied, establish the
coefficient-change chain map, the precise completion (direct sum, restricted
product, or full product), its support/topology, and the derived/UCT/limit
hypotheses. Neither an infinite product nor its homology is silently an algebraic
tensor or an unrestricted U-adic limit. The theorem does not establish the
integral comparison or the broader graph/surface extension. The analytic owner
supplies the surgery hypercube, higher polygon maps, and comparison/perturbation;
there is no reverse analytic dependency here.

For the negative-definite nonsingular rational-homology-sphere case, give the
source-normalized correction-term formula only with its orientation, boundary
`Spin^c`, grading, and sign conventions. On that domain `k²` is defined through
`Q⁻¹`, and `(k+2l)² = k² − 8χ_k(l)` (Némethi §3.3) gives the lattice-side identity
`max_{k'∈[k]} (k'²+|V|)/4 = (k²+|V|)/4 − 2m_k`; its identification with the
Heegaard Floer `d`-invariant belongs to the reconciliation. State whether the input is the Némethi
minimum or full-complex grading and supply the comparison theorem before identifying
them. A minimum of a quadratic weight on an arbitrary integral matrix is not by
itself a correction-term formula.

### Lane H: combinatorial HF̂ of 3-manifolds

The Ozsváth–Stipsicz–Szabó stable invariant
([arXiv:0912.0830](https://arxiv.org/abs/0912.0830)):

1. Pointed multi-pointed Heegaard diagram *combinatorics* (the diagram as data:
   surface genus, attaching-curve combinatorics, basepoints, no smooth topology
   yet); generators, domains, periodic domains, weak/strong **admissibility**.
2. The nice-move calculus and "convenient" diagrams from pair-of-pants
   decompositions; the chain complex (every count is a bigon or square).
3. `HF̂_st(Y)` over 𝔽₂: well-definedness and the purely topological invariance
   proof; lens spaces and `S¹ × S²` as the first computations.
4. ℤ coefficients via sign assignments
   ([arXiv:1301.0480](https://arxiv.org/abs/1301.0480)); the twisted refinement
   recovering `HF̂(Y)` on the nose for `b₁(Y) = 0`.

⚠ The serious topological input is **Reidemeister–Singer with basepoints** (any two
pointed Heegaard diagrams of `Y` are connected by moves): Morse/Cerf theory that
does not exist in Mathlib. Treat it the way Lane G treats Cromwell: make "diagrams
modulo moves" the *definition* of the input equivalence class, state the invariance
theorem against it, and put the identification with smooth 3-manifolds in a
separable reconciliation target. Consume [MorseTheory](../MorseTheory/README.md)'s
ordinary Morse/handle foundation and build the required Cerf moves and basepoint
comparisons in that reconciliation target. ⚠ This package has no absolute gradings and no `U`-flavors; do not
promise them here.

The diagram combinatorics of H.1 are also the input the analytic roadmap's Lane F4
consumes when it builds holomorphic `HF̂` over the same diagrams.

## Acceptance criteria ("checks along the way")

Concrete checks that rule out vacuous or mis-stated definitions:

- **Grid homology computes:** `GĤ` of the unknot (2×2 grid) and the trefoil
  (5×5), with their bigradings, by `decide`-style evaluation; `GH̃` of an `n × n`
  unknot grid exhibits the `W^{⊗(n−1)}` factor (the grid-size dependence is real,
  ruling out a vacuous stabilization quotient).
- **Euler characteristic:** `χ(GĤ(K)) = Δ_K(t)` on the trefoil and figure-eight,
  and in general (G.4), matching the grid determinant.
- **τ bites:** `τ(T_{3,4}) = 3`; the Milnor conjecture for `T_{2,3}` and `T_{3,4}`
  as instances of G.7; an alternating knot is thin (G.9).
- **Oracle agreement:** spot-check `GĤ` ranks against published tables
  (HFKcalc/Knot Atlas data) for a handful of ≤ 8-crossing knots.
- **Lattice homology:** check the concrete negative-definite `E₈` plumbing against
  the literature separately in Némethi's degree-zero model and the full spherical
  `[K,E]` model, with the stated characteristic sector, coefficient ring, grading,
  orientation and comparison. Do not treat agreement in one degree/model as the
  other comparison.
- **Blow-up invariance bites:** for `oneVertexPlumbing w` with `w < 0` both sides of
  `latticeChainHomology_blowUpVertex` are `𝔽₂[U]` in cubical degree `0` and zero in
  higher degrees (Tau Ceti's one-vertex computation on one side, the two-vertex chain
  with framings `w−1, −1` on the other); the values `ε = 1` and `ε = −1` give the same
  module. Negative control: the zero-framed vertex is not negative definite, its
  native homology is `H₀ = 𝔽₂[U]`, `H₁ = 0`, and the headline does not apply to it.
- **τ is a knot invariant:** every unknot grid has `τ = 0`; the grids `torusLink 1 2`
  (`5 × 5`) and `torusLink 2 1` both present the `(2,3)` torus knot, and
  `GridDiagram.two_mul_tau_torusLink` (symmetric in `p, q`) gives `τ = −1` for both,
  as `tau_eq_of_movesTo` requires; `torusLink 2 3` presents the `(3,4)` torus knot
  with `τ = −3`, so it is related to neither by grid moves.
- **Seifert-fibered computations:** for normalized data `(g₀,b;(α₁,β₁),…,(αᵣ,βᵣ))`
  with `αᵢ>βᵢ>0`, `gcd(αᵢ,βᵢ)=1`, choose and retain this plumbing convention:
  write the unique negative continued fraction
  `αᵢ/βᵢ=[cᵢ₁,…,cᵢₛ]⁻ = cᵢ₁−1/(cᵢ₂−⋯−1/cᵢₛ)`, with every `cᵢⱼ≥2`;
  take a central vertex of genus `g₀` and weight `−b`; attach to it a linear leg
  of weights `−cᵢ₁,…,−cᵢₛ` for each i. Orient the boundary as the boundary of
  this oriented plumbing (outward-normal-first). In this convention the rational
  Euler/Schur-complement number is `e=−b+Σᵢ βᵢ/αᵢ`; for the stated normalized
  legs the intersection form is negative definite exactly when `e<0` (and for
  `r=0` this reads `−b<0`). Record the convention, orientation, and `e` with every
  output; an orientation reversal requires the corresponding explicit sign
  conversion, not a silent change of `b` or the leg fractions. Compute characteristic
  sectors, source cohomological cube weights, and d-type outputs only on the source
  hypotheses, recording boundary `Spin^c`, coefficient flavor, and absolute/relative
  grading normalization. For rational-homology-sphere cases, compute d-invariant
  outputs only after the comparison theorem and its sign/orientation convention
  are established. Compare degree-zero Némethi and full spherical `[K,E]` outputs
  only on their common genus-zero hypotheses and after proving the comparison. For
  positive-base-genus or other Seifert cases, retain the central surface-genus
  decoration, use the L.3 graph/surface **chain** model and, on Némethi's domain, the
  L.1 cochains; do not infer the spherical-tree theorem. These remain
  assigned computations, not established formulas.
- **`HF̂_st` computes:** lens spaces give `𝔽^p` (one generator per spin^c
  structure); `S¹ × S²` exercises weak admissibility.

The reconciliation seam — `HF̂(L(p,q))` computed analytically from the genus-1
diagram agreeing with Lane H's combinatorial computation — is an acceptance
criterion of the [analytic roadmap](../HeegaardFloer/README.md), where the
holomorphic side lives.

## References

- P. Ozsváth, A. Stipsicz, Z. Szabó, *Grid Homology for Knots and Links*, AMS
  Mathematical Surveys and Monographs 208, 2015: **the spine of Lane G**, nearly a
  blueprint; Appendix A is Lane ALG's contents, Appendix B is Lane K's. Use
  Remark 4.6.10, §11.1, and Theorem 11.6.1 for the link grading, componentwise
  variables, and multivariable Euler-characteristic conventions; state the selected
  normalization explicitly.
- C. Manolescu, P. Ozsváth, S. Sarkar,
  [arXiv:math/0607691](https://arxiv.org/abs/math/0607691); Manolescu–Ozsváth–
  Szabó–Thurston [arXiv:math/0610559](https://arxiv.org/abs/math/0610559): grid
  homology's origins; the latter is the self-contained one. Use v2 §6,
  Theorem 6.1 for the separate `ℓ=1` knot and `ℓ>1` link Euler branches. (The former is also the
  **grid homology = HFK** reconciliation, which the analytic roadmap owns.)
- P. Ozsváth, A. Stipsicz, Z. Szabó,
  [arXiv:0912.0830](https://arxiv.org/abs/0912.0830) and
  [arXiv:1301.0480](https://arxiv.org/abs/1301.0480): Lane H.
- A. Némethi, [arXiv:0709.0841](https://arxiv.org/abs/0709.0841), especially
  §§3.2.1–3.2.2, Example 4.2.4, and §3.4: Lane L's cohomological weights and
  restricted graph moves. Zemke, [arXiv:2111.14962](https://arxiv.org/abs/2111.14962),
  Theorem 1.1 and §2.3 (including equation (2.3)): the completed mod-2 spherical-tree
  comparison and its characteristic-cube conventions. These are distinct targets;
  the analytic roadmap separately specifies broader comparison problems.
- É. Gallais, [arXiv:0706.0089](https://arxiv.org/abs/0706.0089): sign assignments
  and ℤ coefficients for grid homology (G.12).
- A. Juhász, D. Thurston, I. Zemke,
  [arXiv:1210.4996](https://arxiv.org/abs/1210.4996): naturality, the capstone for
  invariance phrased as a transitive system.
- Hannah Fechtner's braid-group program
  ([Lean Together 2025 talk](https://www.youtube.com/watch?v=qVzuTWycPaw)), whose
  presented-monoid infrastructure is already in Mathlib and which Lane K should
  build on rather than duplicate.

## How to drive it

Lanes G.1–3 (with ALG), L, and K can all start immediately and independently. The
spine to push hardest is **G**: it reaches a famous theorem (Milnor conjecture)
entirely within reach of current technology. Lane H follows G once the nice-move
idiom is established. Nothing here waits for the analytic roadmap; the seams between
them are the reconciliation theorems, which the analytic roadmap states and tracks.

## Acknowledgements

This roadmap builds directly on earlier discussions on the [Lean
Zulip](https://leanprover.zulipchat.com/), and would not have been possible without
them:

- [#maths > Feasibility of formalizing Grid Homology for summer pro...](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/Feasibility.20of.20formalizing.20Grid.20Homology.20for.20summer.20pro.2E.2E.2E)
  (summer 2025): an undergraduate team's grid-homology project (the first attempt
  at this material in Lean) with Kevin Buzzard's encouragement ("It would be a
  shame to miss this opportunity to get Heegaard Floer homology into mathlib") and
  Kyle Miller's observation that grid-diagram combinatorics stands alone, the design
  position Lane G adopts.
- [#new members > knot theory](https://leanprover.zulipchat.com/#narrow/channel/113489-new%20members/topic/knot.20theory)
  (2022–2024, Monica Omar, Kyle Miller, Kim Morrison, Junyan Xu, and others): the
  richest design discussion of knot representations in Lean: oriented PD codes,
  quandle invariants, and the "no privileged representation" philosophy this
  roadmap follows; Junyan Xu raised grid diagrams and Heegaard Floer homology
  there years before this roadmap.
- [#general > dreams of big projects](https://leanprover.zulipchat.com/#narrow/channel/113488-general/topic/dreams.20of.20big.20projects)
  (2025, Siddhartha Gadgil, Patrick Massot): exotic ℝ⁴'s via combinatorial
  Heegaard Floer theory and the Milnor conjecture as dream targets, and the
  objection (combinatorial computation must "relate the result to actual
  information") that this roadmap's reconciliation targets are designed to
  answer.
- [#general > O(1000) definitions for Annals](https://leanprover.zulipchat.com/#narrow/channel/113488-general/topic/O.281000.29.20definitions.20for.20Annals)
  (2026, Kevin Buzzard and others): Heegaard Floer homology and basic knot theory
  as recurring missing definitions in recent Annals papers; also raised in recent
  TauCetiProject target-selection discussions.
- Hannah Fechtner's braid-group program
  ([Lean Together 2025 talk](https://www.youtube.com/watch?v=qVzuTWycPaw)), whose
  presented-monoid infrastructure is already in Mathlib and which Lane K should
  build on rather than duplicate.

Thanks to everyone who contributed to these discussions.
