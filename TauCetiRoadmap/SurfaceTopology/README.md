# Roadmap: Surface topology, finite presentations, and classification

A compact surface admits several finite combinatorial descriptions. A triangulation presents it as finitely many triangles with edge identifications.  A generalized map records the same incidence data by three involutions on a finite set of darts. This roadmap proves that the finite and topological descriptions determine one another, develops the finite invariants and moves, and derives the classification of compact surfaces.

The summits reached by this roadmap are:

1. **The realization theorem**: an admissible finite generalized map can be realized as a compact surface, and every compact surface has a presentation as a generalized map.
2. **The Heffter–Edmonds–Ringel theorem**: cellular embeddings of a graph correspond to rotation systems in the orientable case, and to signed embedding schemes in general.
3. **The normal-form theorem**: every closed polygonal schema is related by elementary moves to a standard orientable or nonorientable word. Surfaces with boundary are reduced to the closed case by capping.
4. **The classification of compact surfaces**: every compact connected surface, with or without boundary, is homeomorphic to exactly one standard model, determined by Euler characteristic, orientability, and number of boundary components.

Two later layers are further applications of the core thoery:

5. **Curves, cutting, and mapping class groups**: Dehn twists, the change-of-coordinates principle, and the Dehn–Lickorish generation theorem.
6. **Planarity**: Kuratowski, Whitney, Mac Lane, Fáry, and the five-colour theorem, as a theorem suite built on the map and embedding theory.

Layer 10 is best read as a mathematical validation and extension of the finite-map library.  It's not part of the proof of surface classificatio, and its not a complete roadmap for graphs on surfaces.

Each layer below is organized around its principal theorem, mathematical dependencies, and proof route. The Lean declarations are representative interfaces: they expose the intended connections to Tau Ceti without replacing the mathematicalstatements.

> **Naming.** The directory name `CombinatorialMaps` describes the method; `SurfaceTopology` describes the subject.

---

## Relationship to other roadmaps

### This roadmap supplies

| Consumer | What it needs |
|---|---|
| `GeometricTopology` layer 9 | the classification of closed orientable surfaces, for the splitting surface |
| `GeometricTopology` layer 9 | surface mapping classes |
| a future Four Colour roadmap | plane maps, duality, Euler's formula, the five-colour theorem |

### This roadmap consumes

From [PlanarTopology](../PlanarTopology/README.md), at the following points:

| Item | Which layer here |
|---|---|
| `IsCombinatorialSurface` and its realization theorem | 3 |
| Radó: every compact surface is triangulable | 8 |
| the two-dimensional Hauptvermutung | 3, 7, 8 |
| `Surface.eulerChar`, well defined and invariant | 3, 5, 7, 8, 10 |
| the Schoenflies theorem and tameness of arcs and simple closed curves in a surface | 9 |
| Top = PL structure comparison and isotopy to a PL homeomorphism | 9 |

From Tau Ceti and Mathlib:

| Item | Location |
|---|---|
| `Equiv.Perm`, orbits, `MulAction`, cycle types | Mathlib |
| `AbstractSimplicialComplex`, `Realization`, `link`, subdivision, `SimplicialMap` | `TauCeti/AlgebraicTopology/SimplicialComplex/` |
| `IsTriangulable` | `TauCeti/Topology/Triangulable.lean` |
| structure theorem for finitely generated modules over a PID | `Mathlib.Algebra.Module.PID` |
| free groups, group presentations, `Subgroup.closure`, abelianization | Mathlib |
| `Isotopic`, `AmbientIsotopic` | `TauCeti/Topology/Homotopy/` |
| the multigraph `Graph α β` | Mathlib, **verify the current API before layer 5** |
| `Combinatorics/SimpleGraph/{Acyclic, BranchComponents, PathGraph}` | Tau Ceti |

⚠ `TauCeti/LinearAlgebra/Matrix/SmithNormalForm.lean` covers only **square** integer matrices of positive determinant. Boundary matrices are rectangular. Use the PID structure theorem.


---

## Existing formal foundations and missing theorems

Verified against Lean `v4.34.0-rc1` and Mathlib `master` at
`05ae0103f49b1ad1248f6039bbbad43d8aeb52a9`.

**Absent from Tau Ceti** No `GMap`, no `Hypermap`, no `Cellulation`, no `rotationSystem`, no `eulerChar`, no `IsCombinatorialManifold`. `TauCeti/Combinatorics/`
contains Brauer diagrams, enumerative combinatorics, quivers, Young tableaux, and three thin `SimpleGraph` files. **The entire finite-map side of this roadmap is greenfield.**

**Present and relevant.** `TauCeti/AlgebraicTopology/UniversalCover/` is substantial and includes fundamental groups of the circle, the torus, and the real projective plane, which are useful cross-checks for layer 7. `TauCeti/AlgebraicTopology/SimplicialComplex/` is the target of layer 3's comparison theorem.



---

## Mathematical objects and formalization conventions

### A mathematical hub and several presentations

**The 2-dimensional generalized map is taken as the foundation.** A dart contains a complete flag, but also natively carries the side-incidence data that a face poset loses.  Boundary-ness is recorded by fixed points of the highest order innovation.  Non-orientability needs no signed variant.

Oriented maps, hypermaps, cellulations, and polygonal schemas are **presentations**: each can be bidirectionally translated into the language of generalized maps, and each possesses its own natural operations.  This roadmap does not propose a parallel realization theory. Realization, Euler characteristic, orientability, and the operations are defined once, on generalized maps.  This is deliberate, and it follows the discipline `GeometricTopology` layer 4 states for knot presentations: pick a hub, do not aim for the complete graph on presentations.

The six comparison theorems in layer 2 are not a claim that all presentations are co-equal. They state precisely which information each conversion preserves and certify that the chosen hub represents the same finite surface data.

### Bundled index types and isomorphism closure

Every finite object bundles its own index type: darts for maps, vertices for complexes, labels for schemas. Every move relation is **closed under isomorphism of that type** before `Relation.ReflTransGen` is applied.

⚠ This is not cosmetic. The Pachner 1↔3 move adds a vertex and the schema cancellation move removes a letter, so both changes affect the index type. A relation on a fixed index type cannot express them, and `ReflTransGen` demands that intermediate index types line up on the nose.

### Realization

`GMap2.realization G` is defined **directly**, as the quotient of `D × Δ²` by the
side-gluings induced by the three involutions. It is always defined, with no hypotheses, and
this object carries the topology.

⚠ **The flag complex of a generalized map is not in general an abstract simplicial complex.**
Take the projective plane as the word `aa`, with one vertex, one edge, and one face. As a
generalized map on darts `{1,2,3,4}` with

```
α₀ = (1 2)(3 4)      α₁ = (1 4)(2 3)      α₂ = (1 3)(2 4)
```

the involutions `α₀` and `α₂` commute, so this is a valid 2-generalized map; all three orbit
groups act transitively, so there is one cell of each dimension and `χ = 1 - 1 + 1 = 1`. The
flag vertex set has three elements and admits exactly one triangle. However the four darts collapse to one simplex. The one-vertex torus fails in a similar way: eight darts, four flag vertices, two distinct triples.

The bridge to `AbstractSimplicialComplex` is therefore a **theorem about a subdivision**, not
a definition.  After the canonical barycentric subdivision of the map, the flag map is
injective and the flag complex is honest. The `aa` map above is the certified counter-witness
recorded in layer 3's examples and mathematical checks.

### Euler characteristic

```lean
def GMap2.eulerChar (G : GMap 2 D) : ℤ :=
  (Nat.card (G.Cell 0) : ℤ) - Nat.card (G.Cell 1) + Nat.card (G.Cell 2)
```

with `Cell 0 = Orb⟨α₁,α₂⟩`, `Cell 1 = Orb⟨α₀,α₂⟩`, `Cell 2 = Orb⟨α₀,α₁⟩`.

**The boundary is recorded entirely by fixed points of `α₂`**.  Boundary vertices and edges are already counted by the ordinary orbit cells. A boundary edge has a two-element `⟨α₀,α₂⟩`-orbit and an interior edge a four-element one.  This is the decidable boundary test.

### Invariance

**Invariance comes from the Hauptvermutung, not from comparison with singular theory.** Every invariant here is defined on a finite presentation and proved invariant under isomorphism, subdivision, and the elementary moves. `PlanarTopology`'s Radó and Hauptvermutung then make it a homeomorphism invariant.

⚠ This roadmap does not contemplate a comparison theorem with Mathlib's `SingularHomology` or `FundamentalGroup`. None is needed.  Moreover Mathlib's singular homology has no excision and no Mayer–Vietoris at the pinned commit, so none is currently provable.

Consequently, ⚠ **the homology and fundamental group here are named for what they are.** Use `Cellulation2.homology` and `Cellulation2.edgePathGroup`, never bare `H₁` or `π₁`. A theorem reading `H₁_torus : H₁ T² ≅ ℤ × ℤ` would claim too much. When the comparison becomes available it will be a bridge theorem with two well-named sides.

---

## Structure

```
L0 finite conventions
 |
L1 generalized maps ------------------------------.
 |                                                 |
L2 presentations and comparison theorems           |
 |                                                 |
L3 realization  <---- PlanarTopology L3, L5, L6    |
 |                                                 |
L4 operations on finite surfaces -----.            |
 |                                      \          |
L5 embedded graphs and HER        L6 schemas and normal forms
 |                                 |
 |                                L7 combinatorial homology and edge-path group
 |                                 |
 |                                L8 classification  <---- PlanarTopology L2, L5, L6
 |                                 |
 |                                L9 mapping class groups (extension)
 |                                 |    <---- PlanarTopology L7, L8
 '------------------------------- L10 planarity (extension and validation)
```

---

## Layer 0: Finite conventions

This layer isolates the finite equivalence relations needed by cyclic words and by moves that change an object's indexing type.

**Representative formal statements.**

```lean
/-- Cyclic words. Kept deliberately separate from `CircularOrder` and from the
    topological circle: a cyclic word is a finite sequence with repeated labels,
    taken modulo rotation. -/
def CyclicWord (α : Type*) : Type* := Quotient (rotationSetoid α)

class HasIsoRel (X : Type*) where
  IsoRel : X → X → Prop
  isEquiv : Equivalence IsoRel

structure BundledFinite where
  ι : Type
  fintype : Fintype ι
  decEq : DecidableEq ι

/-- The isomorphism closure of a relation on bundled objects. -/
def isoClosure {X : Type*} [HasIsoRel X] (r : X → X → Prop) : X → X → Prop :=
  fun a b => ∃ a' b', IsoRel a a' ∧ IsoRel b b' ∧ r a' b'

theorem isoClosure_reflTransGen_congr : ...
```

**Proof strategy and formalization notes.** `Function.Involutive` and `Commute` in `Equiv.Perm D` are the Mathlib idioms; do not hand-roll `∀ d, f (f d) = d` or `f ∘ g = g ∘ f`.

**Examples and mathematical checks.** `CyclicWord` equality is `Decidable` and distinguishes `abab` from `aabb` while identifying `abab` with `baba`.

**Natural intermediate results.** (i) cyclic words; (ii) bundling and isomorphism closure; (iii) `ReflTransGen` lemmas for isomorphism-closed relations.

---

## Layer 1: Generalized maps

The foundational object for all of the combinatorial topology which follows.

**Representative formal statements.**

```lean
structure GMap (n : ℕ) (D : Type*) [Fintype D] [DecidableEq D] where
  adj : Fin (n + 1) → Equiv.Perm D
  involutive : ∀ i, Function.Involutive (adj i)
  commute_of_far : ∀ i j, i.1 + 2 ≤ j.1 → Commute (adj i) (adj j)


abbrev GMap2 (D : Type*) [Fintype D] [DecidableEq D] := GMap 2 D

def GMap.Cell (G : GMap n D) (i : Fin (n + 1)) : Type* :=
  MulAction.orbitRel.Quotient (Subgroup.closure {G.adj j | j ≠ i}) D

structure GMap2.Iso {D D' : Type*} [Fintype D] [Fintype D']
    (G : GMap2 D) (G' : GMap2 D') where
  toEquiv : D ≃ D'
  map_adj : ∀ i d, toEquiv (G.adj i d) = G'.adj i (toEquiv d)


def GMap2.eulerChar (G : GMap2 D) : ℤ := ...

/-- Boundary. -/
def GMap2.IsBoundaryDart (G : GMap2 D) (d : D) : Prop := G.adj 2 d = d
instance : DecidablePred G.IsBoundaryDart

/-- Candidate combinatorial surface condition. `IsSurfaceNondegenerate` abbreviates the
    exact finite local condition to be settled against Damiand--Lienhardt. It must still
    admit standard one-cell presentations such as `aa`. -/
def IsSurfaceGMap (G : GMap2 D) : Prop :=
  (∀ d, G.adj 0 d ≠ d) ∧ (∀ d, G.adj 1 d ≠ d) ∧ G.IsSurfaceNondegenerate
instance : DecidablePred (IsSurfaceGMap (D := D))

def IsClosedSurfaceGMap (G : GMap2 D) : Prop :=
  IsSurfaceGMap G ∧ ∀ d, G.adj 2 d ≠ d

/-- Orientability as a property; fixed points representing boundary do not change side. -/
def GMap2.IsOrientable (G : GMap2 D) : Prop :=
  ∃ S : Set D, ∀ i d, G.adj i d ≠ d → (d ∈ S ↔ G.adj i d ∉ S)
structure GMap2.Orientation (G : GMap2 D) where ...
instance : DecidablePred (GMap2.IsOrientable (D := D))

def GMap2.boundaryComponentCount (G : GMap2 D) : ℕ
def GMap2.orientableGenus (G : GMap2 D)
    (h : G.IsConnected ∧ IsSurfaceGMap G ∧ G.IsOrientable) : ℕ
def GMap2.nonorientableGenus (G : GMap2 D)
    (h : G.IsConnected ∧ IsSurfaceGMap G ∧ ¬ G.IsOrientable) : ℕ
```

**Proof strategy and formalization notes.**

- ⚠ **The exact surface condition is the highest-risk definition of the roadmap.** A generalized map permits multi-incidence and folded configurations, so the bare involution axioms describe a wider class than regular cell decompositions. At the same time, valid surface presentations such as the one-face projective-plane word `aa` have repeated incidence and must not be excluded merely for failing regularity. In dimension two the incidence graph generated by two involutions has valence at most two, suggesting that the circle-or-arc link condition follows from a small local non-degeneracy condition. That implication should be proved, and the precise condition should be taken from Damiand–Lienhardt.
- The decisive characterization is the later equivalence between the finite local condition and the statement that every point of the realization has a disc or half-disc neighbourhood. Positive and negative finite examples belong to that theorem's specification.
- Orientability is a bipartition of the darts in which every **non-fixed** adjacency changes side. Fixed points of the final involution encode boundary and must not make orientability impossible. The existence of such a bipartition is a property; a chosen bipartition is additional data.
- The `commute_of_far` condition is stated only for `i + 2 ≤ j`; its symmetric form is an immediate lemma. The two genus numbers are first defined from the finite invariants; their identification with the genera of the standard surfaces is proved in layer 8.

**Examples and mathematical checks.** The following table is checked by `decide`, with the maps written out explicitly.

| Map | darts | V | E | F | χ | orientable |
|---|---|---|---|---|---|---|
| sphere, tetrahedral | 24 | 4 | 6 | 4 | 2 | yes |
| projective plane, `aa` | 4 | 1 | 1 | 1 | 1 | no |
| torus, `aba⁻¹b⁻¹` | 8 | 1 | 2 | 1 | 0 | yes |
| Klein bottle, `abab⁻¹` | 8 | 1 | 2 | 1 | 0 | no |
| disc, `n`-gon | 2n | n | n | 1 | 1 | yes |
| annulus | 8 | 2 | 3 | 1 | 0 | yes |
| Möbius band | 8 | 2 | 3 | 1 | 0 | no |

Counter-witnesses: `IsSurfaceGMap` is **false** for the immediate folded-edge configuration singled out by `IsSurfaceNondegenerate`, and **false** for a map with a fixed point of `α₀` or of `α₁`. `IsOrientable` is **false** for the Klein bottle map and **true** for the torus map, decided by the same procedure.

**Natural intermediate results.** (i) the structure and basic permutation lemmas; (ii) cells, orbits, and decidability; (iii) Euler characteristic and the example table; (iv) boundary darts and the boundary test; (v) `IsSurfaceGMap` and its counter-witnesses; (vi) orientability; (vii) boundary count and the two genus formulas for connected surface maps.

---

## Layer 2: Presentations and comparison theorems

Each presentation gets a constructor into generalized maps, accessors out, and its own natural operations. None gets a realization theory.

**Representative formal statements.**

```lean
/-- Oriented map: a rotation system. -/
structure CombinatorialMap (D : Type*) [Fintype D] [DecidableEq D] where
  σ : Equiv.Perm D          -- rotation at vertices
  α : Equiv.Perm D          -- edge involution
  α_involutive : Function.Involutive α
  α_free : ∀ d, α d ≠ d
def CombinatorialMap.toGMap2 : GMap2 (D × Bool)

/-- Hypermap. -/
structure Hypermap (D : Type*) [Fintype D] [DecidableEq D] where
  σ φ α : Equiv.Perm D
  comp : σ * φ * α = 1
def Hypermap.toGMap2 : GMap2 (D × Bool)

/-- Cellulation: a presentation, not an independent structure with its own validity theory. -/
structure Cellulation2 where ...
def Cellulation2.toGMap2 : GMap2 _

/-- Polygonal schema. A label occurring twice is glued; a label occurring once
    represents a boundary edge. Further compatibility is part of `IsSurface`. -/
structure PolygonalSchema where
  label : Type
  fintypeLabel : Fintype label
  faces : List (CyclicWord (label × Bool))
  occurs_once_or_twice : ∀ l, (occurrences l).length = 1 ∨ (occurrences l).length = 2
def PolygonalSchema.toGMap2 : GMap2 _
```

**The six comparison theorems.** These identify the information preserved by the conversions; they do not make the presentations co-equal foundations.

1. `K.toGMap2.flagComplex ≃ K.barycentricSubdivision` for a combinatorial surface `K`. ⚠ This is the master test. If it holds, the generalized map is not lying about the surface. It is stated here and proved in layer 3, where realization exists.
2. `|flagComplex G| ≃ₜ G.realization`. The two realizations agree. Proved in layer 3.
3. `G.toCellulation.toGMap2 ≃ G`, up to the canonical subdivision. Tests that the cellulation constructor loses no flag data.
4. `M.toGMap2.toCombinatorialMap ≃ M` after choosing the induced orientation. Tests the orientation encoding.
5. `G.dual.dual ≃  G`, with canonically homeomorphic realizations.
6. Converting a schema to a generalized map recovers both its glued edge-pairs and its singleton boundary edges, up to cyclic equivalence and relabelling.

**Examples and mathematical checks.** ⚠ **Exhibit two non-isomorphic surface cellulations with the same incidence poset.** This answers the question "why is this not just a poset?" and justifies `Cellulation2` carrying side-incidence data. Source: figures in Damiand–Lienhardt.  Each conversion is worked out on the layer 1 example table. Degenerate examples show why the hypotheses of the comparison theorems are necessary.

**Natural intermediate results.** (i) oriented maps and the conversion; (ii) hypermaps and the conversion; (iii) cellulations and the conversion; (iv) polygonal schemas and the conversion; (v) comparison theorems 3, 4, and 6; (vi) the poset counter-example.

---

## Layer 3: Realization

Where the finite side meets [PlanarTopology](../PlanarTopology/README.md).

**From PlanarTopology.** `IsCombinatorialSurface`, its realization theorem, the Hauptvermutung.

**Representative formal statements.**

```lean
/-- Direct. No hypotheses, no abstract simplicial complex. -/
def GMap2.realization (G : GMap2 D) : Type* :=
  Quotient (gluingSetoid G)    -- of `D × StandardSimplex (Fin 3)`

instance : TopologicalSpace (GMap2.realization G)
instance : CompactSpace (GMap2.realization G)

theorem IsSurfaceGMap.realization_isSurface (h : IsSurfaceGMap G) :
    IsCompactSurfaceWithBoundary G.realization

theorem IsSurfaceGMap.eulerChar_eq (h : IsSurfaceGMap G) :
    Surface.eulerChar G.realization = G.eulerChar

/-- The simplicial bridge: a theorem about a subdivision, not a definition. -/
theorem GMap2.flagComplex_isSimplicial_of_subdivided (G : GMap2 D) :
    Function.Injective (G.barycentricSubdivision.flagTriple)

theorem GMap2.realization_homeomorph_flagComplex (h : IsSurfaceGMap G) :
    G.realization ≃ₜ Realization (G.barycentricSubdivision.flagComplex)

/-- Every compact surface arises. Uses Rado. -/
theorem exists_gmap_of_compactSurface (M : Type*) [CompactSurface M] :
    ∃ (D : Type) (_ : Fintype D) (G : GMap2 D), IsSurfaceGMap G ∧
      Nonempty (G.realization ≃ₜ M)

/-- Comparison theorems 1 and 2 from layer 2. -/
theorem flagComplex_toGMap2 (hK : IsCombinatorialSurface K) :
    K.toGMap2.flagComplex ≅ K.barycentricSubdivision
```

**Proof strategy and formalization notes.**

- ⚠ Do not define realization through `AbstractSimplicialComplex`.
- The subdivision needed for the bridge may be one barycentric step or two, depending on the map.

**Examples and mathematical checks.** The `aa` generalized map from the encoding conventions is a certified counter-witness: it is a valid surface map, its flag triple map is **not** injective, and its unsubdivided flag complex has one triangle where the map has four darts. Realization is checked to produce the correct Euler characteristic on the full layer 1 table, through `PlanarTopology`'s `Surface.eulerChar`, not through `GMap2.eulerChar`.

**Natural intermediate results.** (i) the gluing setoid and the quotient topology; (ii) compactness and the surface property; (iii) the flag triple, injectivity after subdivision, and the counter-witness; (iv) the homeomorphism with the flag complex realization; (v) `exists_gmap_of_compactSurface`; (vi) Euler characteristic agreement.

**Consequences.** `GeometricTopology` layer 11's dimension-two case.

---

## Layer 4: Topological operations on generalized maps

This layer separates two kinds of operation. Subdivision, admissible contraction, and duality preserve the represented surface. Connected sum, cutting, the orientation cover, capping, and doubling change it in controlled ways. Each operation is accompanied by its precise theorem on realizations and invariants, not only by orbit-count identities.

**Representative formal statements.**

```lean
def GMap2.subdivideEdge   (G : GMap2 D) (e : G.Cell 1) : GMap2 _
def GMap2.subdivideFace   (G : GMap2 D) (f : G.Cell 2) : GMap2 _
def GMap2.contractEdge    (G : GMap2 D) (e : G.Cell 1) (h : e.IsContractible) : GMap2 _
def GMap2.dual            (G : GMap2 D) (h : IsClosedSurfaceGMap G) : GMap2 D
def GMap2.connectedSum    (G : GMap2 D) (H : GMap2 E) : GMap2 _
def GMap2.cutAlong        (G : GMap2 D) (c : G.CombinatorialCurve) : GMap2 _
def GMap2.orientationDoubleCover (G : GMap2 D) : GMap2 (D × Bool)
def GMap2.cap             (G : GMap2 D) : GMap2 _   -- glue a disc on each boundary circle
def GMap2.double          (G : GMap2 D) : GMap2 (D × Bool)

theorem GMap2.subdivideEdge_realization : (G.subdivideEdge e).realization ≃ₜ G.realization
theorem GMap2.dual_realization (h : IsClosedSurfaceGMap G) :
    (G.dual h).realization ≃ₜ G.realization
theorem GMap2.dual_eulerChar (h : IsClosedSurfaceGMap G) :
    (G.dual h).eulerChar = G.eulerChar

theorem GMap2.orientationDoubleCover_isOrientable :
    G.orientationDoubleCover.IsOrientable
theorem GMap2.orientationDoubleCover_eulerChar :
    G.orientationDoubleCover.eulerChar = 2 * G.eulerChar
theorem GMap2.orientationDoubleCover_isConnected
    (hG : G.IsConnected) (h : ¬ G.IsOrientable) :
    IsConnected G.orientationDoubleCover
theorem GMap2.orientationDoubleCover_isCovering :
    IsCoveringMap (G.orientationDoubleCover.projection)

theorem GMap2.cap_eulerChar :
    G.cap.eulerChar = G.eulerChar + G.boundaryComponentCount
theorem GMap2.cap_isOrientable : G.cap.IsOrientable ↔ G.IsOrientable
theorem GMap2.cap_isConnected (hG : G.IsConnected) : G.cap.IsConnected

theorem GMap2.double_eulerChar : G.double.eulerChar = 2 * G.eulerChar
```

**Proof strategy and formalization notes.**

- The **orientation double cover** a covering map for surfaces with boundary. The orientation character is trivial on each boundary component because a collar supplies a two-sided neighbourhood; consequently every boundary circle lifts to two boundary circles, each mapping homeomorphically to the original one. (This behaviour should be included in the covering theorem.)
- ⚠ The **double** `DM = M ∪_∂M M` a quotient by an involution with fixed points, `Fix σ = ∂M` and `DM/σ = M`.  Record the double for its Euler characteristic identity and for later use. ⚠ Do not attempt to derive triangulation with boundary from it, that would require an equivariant triangulation theorem.
- An edge contraction preserves the surface only under the appropriate link or non-degeneracy condition. Its realization theorem should state the exact admissibility hypothesis (being a non-loop is not sufficient).
- Ordinary duality preserves the class of surface maps cleanly in the closed case. With boundary, reversing the involutions moves fixed points from `α₂` to `α₀`, so a relative or capped dual version is needed.
- **Capping** is the operation that simplifies the classification with boundary: every compact surface with boundary is a closed surface minus `b` open discs. That reduction is layer 8's main structural simplification.
- Do not build the Petrie dual or higher-dimensional operations.

**Examples and mathematical checks.** `dual (dual G) ≃ G` is checked on the closed maps in the layer 1 table (comparison theorem 5). `orientationDoubleCover` of the projective plane is the sphere map, of the Klein bottle map is the torus map, and of an already orientable map is disconnected. `cap` of the disc map is the sphere map. `double` of the Möbius band map is the Klein bottle map. All by `decide` on the explicit maps.

**Natural intermediate results.** (i) subdivision operations; (ii) contraction and deletion; (iii) duality; (iv) connected sum; (v) cutting along a combinatorial curve; (vi) orientation double cover; (vii) capping and doubling.

---

## Layer 5: Embedded graphs and the Heffter–Edmonds–Ringel theorem

This externally validates the finite model.  It says the maps are not merely an adequate encoding of embedded graphs but the right one.

**From Mathlib.** the multigraph `Graph α β`; ⚠ verify its API first.

**Representative formal statements.**

```lean
def GMap2.underlyingGraph (G : GMap2 D) : Graph (G.Cell 0) (G.Cell 1)

structure GraphEmbedding (Γ : Graph α β) (M : Type*) [Surface M] where ...
def GraphEmbedding.IsCellular : Prop   -- every face is an open disc

def RotationSystem (Γ : Graph α β) : Type* := ...
def SignedRotationSystem (Γ : Graph α β) : Type* := ...

theorem cellularEmbeddings_equiv_gmaps (Γ : Graph α β) (hΓ : Γ.Connected) :
    CellularEmbeddings Γ / EquivalenceOfEmbeddings
      ≃ {G : BundledGMap2 // G.underlyingGraph ≃ Γ} / GMap2.Iso

/-- Heffter--Edmonds--Ringel, orientable form. -/
theorem orientedCellularEmbeddings_equiv_rotationSystems
    (Γ : Graph α β) (hΓ : Γ.Connected) :
    OrientedCellularEmbeddings Γ / EquivalenceOfOrientedEmbeddings
      ≃ RotationSystem Γ / EquivalenceOfRotations

/-- General-surface form, using signed rotation systems (embedding schemes). -/
theorem cellularEmbeddings_equiv_signedRotationSystems
    (Γ : Graph α β) (hΓ : Γ.Connected) :
    CellularEmbeddings Γ / EquivalenceOfEmbeddings
      ≃ SignedRotationSystem Γ / EquivalenceOfSignedRotations

/-- Euler's formula for a cellular embedding. -/
theorem eulerFormula_cellular {Γ : Graph α β} (e : GraphEmbedding Γ M) (h : e.IsCellular) :
    (Γ.vertexCount : ℤ) - Γ.edgeCount + e.faceCount = Surface.eulerChar M

def Graph.genus (Γ : Graph α β) : ℕ            -- needs layer 8
def Graph.nonorientableGenus (Γ : Graph α β) : ℕ
```

**Proof strategy and formalization notes.**

- ⚠ The correspondence is only for **cellular** embeddings. A graph embedded in a torus with a non-disc face is the counter-witness and is given in the examples and mathematical checks.
- The general case needs the signed or generalized-map version. The standard theorem for the orientable case is stated in terms of `CombinatorialMap` (rotation systems).  Derive the latter from the former
- `Graph.genus` minimises over surfaces and therefore waits on layer 8; the HER correspondence and Euler formula do not.

**Examples and mathematical checks.** `K₅` and `K₃,₃` have genus 1 and embed cellularly in the torus.
`IsCellular` is **false** for `K₄` drawn inside a disc in the torus. Euler's formula is
checked on the layer 1 table.

**Natural intermediate results.** (i) the underlying multigraph; (ii) embeddings and cellularity;
(iii) rotation systems; (iv) the orientable HER correspondence; (v) the general HER
correspondence; (vi) Euler's formula; (vii) genus, after layer 8.

---

## Layer 6: Polygonal schemas and normal forms

The classification theorem is stated for closed schemas. The classification with boundary in layer 8 uses capping to reduce to this theorem.

**Representative formal statements.**

```lean
inductive ElementarySchemaMove : PolygonalSchema → PolygonalSchema → Prop
  | cancel   : ...        -- `a a⁻¹` adjacent, removes a label
  | relabel  : ...
  | cut      : ...
  | paste    : ...

def SchemaMove := isoClosure ElementarySchemaMove

def normalFormOrientable (g : ℕ) : PolygonalSchema
def normalFormNonorientable (k : ℕ) (hk : 0 < k) : PolygonalSchema

theorem closedSchema_reduces_to_normalForm
    (S : PolygonalSchema) (hS : S.IsSurface) (hclosed : S.IsClosed) :
    ∃ N, IsClosedNormalForm N ∧ Relation.ReflTransGen SchemaMove S N

/-- Relative form used after capping: the distinguished cap faces remain identifiable
    through the reduction and become standard disjoint discs in the normal form. -/
theorem closedSchema_reduces_to_normalForm_rel_caps
    (S : PolygonalSchema) (caps : Finset S.Face)
    (hS : S.IsSurface) (hclosed : S.IsClosed) (hcaps : PairwiseDisjointCaps caps) : ...

theorem SchemaMove.realization_homeomorph (h : SchemaMove S T) :
    S.toGMap2.realization ≃ₜ T.toGMap2.realization
```

**Proof strategy and formalization notes.**

- ⚠ Every move changes the label type. The isomorphism closure from layer 0 is what makes `ReflTransGen` usable. Do not fix an alphabet.
- The reduction is the classical closed-surface algorithm: merge to one polygon, cancel adjacent inverse pairs, make the schema have a single vertex class, group crosscaps, group handles, and convert a handle plus a crosscap into three crosscaps (Dyck's theorem). Each step needs its realization theore, from `SchemaMove.realization_homeomorph`, not a separate argument.

**Examples and mathematical checks.** The reduction is run on `abab⁻¹` (the Klein bottle), `aabb` (the same surface, reaching the same normal form), and `abca⁻¹b⁻¹c⁻¹` (a nontrivial six-edge schema). A label occurring once is accepted as a boundary edge; a label occurring three times, or a pairing with an invalid local incidence, must fail `IsSurface`.

**Natural intermediate results.** (i) schemas and the surface condition; (ii) the moves and isomorphism closure; (iii) realization invariance of each move; (iv) reduction to a single vertex class; (v) handle and crosscap grouping; (vi) Dyck's theorem; (vii) the closed orientable and nonorientable normal forms; (viii) the relative theorem for distinguished cap faces.

---

## Layer 7: Cellulation homology and the edge-path group

This layer attaches finite chain complexes and finite group presentations to a cellulation. The chain complex and its homology are needed for classification.  The edge-path group is a natural companion that records the nonabelian presentation before abelianization. Both are combinatorial models of familiar topological invariants, but their comparison with singular homology and the topological fundamental group is out of scope.

**Representative formal statements.**

```lean
/-- Three finite free modules and two matrices. -/
def Cellulation2.chainComplex (C : Cellulation2) (R : Type*) [CommRing R] :
    ChainComplex (ModuleCat R) ℕ

theorem Cellulation2.d_comp_d (C : Cellulation2) : C.boundary₁ ∘ₗ C.boundary₂ = 0

def Cellulation2.homology (C : Cellulation2) (R : Type*) [CommRing R] (i : ℕ) : ModuleCat R

theorem Cellulation2.eulerPoincare (C : Cellulation2) (F : Type*) [Field F] :
    C.eulerChar = ∑ i, (-1 : ℤ) ^ i * Module.finrank F (C.homology F i)

theorem Cellulation2.homology_zero_iff_connected : ...
theorem Cellulation2.homology_two_iff_orientable
    (h : C.IsClosed ∧ C.IsConnected) :
    Nontrivial (C.homology ℤ 2) ↔ C.IsOrientable

/-- The combinatorial fundamental group. -/
def Cellulation2.edgePathGroup (C : Cellulation2) : Group   -- presented

theorem Cellulation2.edgePathGroup_presentation (C : Cellulation2) (T : C.SpanningTree) :
    C.edgePathGroup ≃* PresentedGroup (generators := edges off T) (relations := face words)

theorem Cellulation2.abelianization_edgePathGroup :
    Abelianization C.edgePathGroup ≃* C.homology ℤ 1

theorem Graph.edgePathGroup_free (Γ : Graph α β) (h : Γ.Connected) :
    IsFreeGroup Γ.edgePathGroup ∧ Nat.card (FreeGroup.basis Γ.edgePathGroup) = 1 - Γ.eulerChar

/-- Invariance, from the moves and nothing else. -/
theorem Cellulation2.homology_subdivision : (C.subdivide).homology R i ≅ C.homology R i
theorem Cellulation2.edgePathGroup_subdivision : (C.subdivide).edgePathGroup ≃* C.edgePathGroup

/-- The normal forms. Uses the PID structure theorem, not Smith normal form. -/
theorem homology_normalFormOrientable (g : ℕ) :
    (normalFormOrientable g).homology ℤ 1 ≅ (ℤ : Type) ^ (2 * g)
theorem homology_normalFormNonorientable (k : ℕ) (hk : 0 < k) :
    (normalFormNonorientable k hk).homology ℤ 1 ≅ (ℤ : Type) ^ (k - 1) × ZMod 2
```

**Proof strategy and formalization notes.**

- Abelianizing a presentation turns relators into the columns of the boundary matrix, so `abelianization_edgePathGroup` is a mechanical algebraic theorem and not a topological one.  This is Munkres' strategy with the topology removed.
- ⚠ Use `Mathlib.Algebra.Module.PID`, not `TauCeti/LinearAlgebra/Matrix/SmithNormalForm.lean`, which handles only square matrices of positive determinant.
- ⚠ van Kampen is out of scope. The edge-path group is defined combinatorially and its invariance comes from the moves, so no comparison with `π₁` of the realization is needed.
- Cross-check opportunity: `TauCeti/AlgebraicTopology/UniversalCover/` already computes the fundamental groups of the circle, the torus, and the real projective plane. Comparing those against `edgePathGroup` of the corresponding normal forms is not a required but it would be strong independent evidence and is worth attempting for these models.

**Examples and mathematical checks.** The chain complexes of the layer 1 table are written out explicitly and `d_comp_d` is checked by `decide`. `homology_two_iff_orientable` is checked **false** for the Klein bottle and **true** for the torus. The `ZMod 2` torsion class in `homology_normalFormNonorientable` is exhibited, not merely asserted, since it is what distinguishes the nonorientable normal forms and an off-by-one here would be invisible.

**Natural intermediate results.** (i) the chain complex and `d ∘ d = 0`; (ii) homology and Euler-Poincaré;
(iii) `H₀` and connectedness; (iv) `H₂` and orientability; (v) the edge-path group and its presentation; (vi) abelianization; (vii) free groups for graphs; (viii) the normal-form computations; (ix) invariance under the moves.

---

## Layer 8: The classification of compact surfaces


**Representative formal statements.**

```lean
inductive StandardSurface
  | orientable    (g : ℕ) (b : ℕ)
  | nonorientable (k : ℕ) (hk : 0 < k) (b : ℕ)

def StandardSurface.model : StandardSurface → Type
def StandardSurface.eulerChar : StandardSurface → ℤ
  -- orientable g b => 2 - 2*g - b ; nonorientable k hk b => 2 - k - b

/-- Existence. -/
theorem exists_standard_homeomorph (M : Type*) [CompactConnectedSurface M] :
    ∃ S : StandardSurface, Nonempty (M ≃ₜ S.model)

/-- Uniqueness. -/
theorem standard_homeomorph_unique {S T : StandardSurface}
    (h : Nonempty (S.model ≃ₜ T.model)) : S = T

/-- The library statement. -/
theorem classification_of_surfaces (M : Type*) [CompactConnectedSurface M] :
    ∃! S : StandardSurface, Nonempty (M ≃ₜ S.model)

/-- The complete invariant. -/
theorem homeomorph_iff_invariants {M N : Type*}
    [CompactConnectedSurface M] [CompactConnectedSurface N] :
    Nonempty (M ≃ₜ N) ↔
      Surface.eulerChar M = Surface.eulerChar N ∧
      (IsOrientable M ↔ IsOrientable N) ∧
      boundaryComponentCount M = boundaryComponentCount N

/-- The reduction that makes the boundary case cheap. -/
theorem exists_closed_minus_discs (M : Type*) [CompactConnectedSurface M] :
    ∃ (N : Type) (_ : ClosedConnectedSurface N) (b : ℕ), Nonempty (M ≃ₜ N.minusDiscs b)
```

**Proof strategy and formalization notes.**

- Existence: Radó gives a triangulation, layer 3 gives a generalized map, layer 6 reduces the schema to normal form, and layer 4's realization theorems transport the homeomorphism back.
- Uniqueness: layer 7's invariants separate the normal forms. Euler characteristic separates within each family, orientability separates the families, and boundary count is preserved because ⚠ `∂M` is a topological invariant only by `PlanarTopology`'s
  `invarianceOfDomain₂`.
- ⚠ The `∃!` form is the form for the library. A quotient-and-representative form, of the kind lean-eval statements use, is a a bridge if it appears at all.
- The boundary case leverages `exists_closed_minus_discs`, via layer 4's `cap`, but the attached discs cannot simply be forgotten. One must either carry the cap faces as marked faces through the relative normal-form theorem of layer 6, or prove an ambient theorem that any two finite families of disjoint discs in a connected surface are equivalent. In any case, avoid using Schoenflies for the classification, it's not needed.

**Examples and mathematical checks.** The classification is instantiated on a surface presented only by charts, with no combinatorial data supplied, and produces the correct `StandardSurface`. The completeness statement is accompanied by a sharpness table. If Euler characteristic is dropped, the torus and the closed orientable genus-two surface agree on orientability and boundary count. If orientability is dropped, the torus and Klein bottle agree on Euler characteristic and boundary count. If boundary count is dropped, the torus and annulus agree on Euler characteristic and orientability. Dyck's theorem is exercised by identifying a torus connected-summed with a projective plane with the nonorientable genus-three surface.

**Natural intermediate results.** (i) `StandardSurface` and its models; (ii) existence in the closed case; (iii) capping with marked cap faces; (iv) relative reduction and uncapping; (v) existence with boundary; (vi) uniqueness; (vii) the complete invariant and its sharpness table.

**Consequences.** `GeometricTopology` layer 9. Layer 5's `Graph.genus`.

---

## Follow-on layer 9: Curves, cutting, and mapping class groups

To fix the convention that the theorem statements use: For oriented surfaces, Dehn twists and the Lickorish theorem concern orientation-preserving mapping classes. For surfaces with boundary, the standard base cases use homeomorphisms and isotopies fixing the boundary pointwise. The full mapping class group is stated separately.

**From PlanarTopology.** Schoenflies, tameness of arcs and simple closed curves in a surface, and isotopy to a PL homeomorphism.

**Representative formal statements.**

```lean
def SimpleClosedCurve (M : Type*) [Surface M] : Type*
def IsEssential {M} [Surface M] (c : SimpleClosedCurve M) : Prop
def IsSeparating {M} [Surface M] (c : SimpleClosedCurve M) : Prop

def cutAlong {M} [Surface M] (c : SimpleClosedCurve M) : Type*
theorem eulerChar_cutAlong : Surface.eulerChar (cutAlong c) = Surface.eulerChar M

/-- Full mapping classes, with no orientation restriction. -/
def MappingClassGroupFull (M : Type*) [Surface M] : Type* :=
  Homeomorph M M ⧸ isotopicSetoid

/-- Orientation-preserving mapping classes; in the boundary case the maps and isotopies
    fix the boundary pointwise. -/
def MappingClassGroupPlus (M : Type*) [OrientedSurface M] : Type* := ...

/-- Base cases, with conventions made explicit. -/
theorem mcg_disc_rel_boundary : MappingClassGroupPlus Disc ≃* Unit
theorem mcg_annulus_rel_boundary : MappingClassGroupPlus Annulus ≃* Multiplicative ℤ
theorem mcg_sphere_plus : MappingClassGroupPlus Sphere2 ≃* Unit
theorem mcg_sphere_full : MappingClassGroupFull Sphere2 ≃* ZMod 2

def dehnTwist {M} [OrientedSurface M] (c : SimpleClosedCurve M) :
    MappingClassGroupPlus M

/-- The workhorse of the induction. -/
theorem change_of_coordinates {M} [ClosedConnectedOrientedSurface M]
    (c d : SimpleClosedCurve M) (hc : ¬ IsSeparating c) (hd : ¬ IsSeparating d) :
    ∃ f : OrientationPreservingHomeomorph M M, f '' c.carrier = d.carrier

theorem mcg_torus_plus :
    MappingClassGroupPlus Torus ≃* Matrix.SpecialLinearGroup (Fin 2) ℤ
theorem mcg_torus_full :
    MappingClassGroupFull Torus ≃* Matrix.GeneralLinearGroup (Fin 2) ℤ

/-- Dehn--Lickorish, for a closed connected oriented surface of positive genus. -/
theorem dehn_lickorish {M} [ClosedConnectedOrientedSurface M] (hg : 0 < genus M) :
    Subgroup.closure (Set.range (dehnTwist (M := M))) = ⊤ ∧
    ∃ S : Finset (SimpleClosedCurve M), S.card = 3 * genus M - 1 ∧
      Subgroup.closure (dehnTwist '' S) = ⊤

/-- Category comparisons, for the same orientation and boundary convention. -/
theorem mcg_top_eq_pl {M} [CompactOrientedSurface M] :
    MappingClassGroupTopPlus M ≃* MappingClassGroupPLPlus M
theorem mcg_pl_eq_smooth {M} [CompactOrientedSurface M] :
    MappingClassGroupPLPlus M ≃* MappingClassGroupSmoothPlus M
```

**Proof strategy and formalization notes.**

- A **Dehn twist** about a simple closed curve is supported in an annular neighbourhood, rotates once across the annulus, and is the identity outside. Tameness and the collar theorem from `PlanarTopology` provide the annulus, while the isotopy class is independent of the chosen collar.
- The distinction between `MappingClassGroupPlus` and `MappingClassGroupFull` is essential. Dehn twists generate the orientation-preserving group: for the torus this is `SL(2,ℤ)`, whereas the full group is `GL(2,ℤ)`. Likewise, the usual disc and annulus base cases require the boundary to be fixed pointwise.
- Target Lickorish's generating set of `3g - 1` twists. Humphries' minimal `2g + 1` set and its minimality proof are a separate theorem and remain out of scope.
- Do not write “of finite type” for compact surfaces. In this literature the phrase normally signals punctures as well as boundary components, leading to the Birman exact sequence and point-pushing, which are out of scope.

**Examples and mathematical checks.** On the torus, twists about the two standard curves map to the elementary generators of `SL(2,ℤ)`. A separating and a nonseparating curve on a genus-two surface show that the nonseparating hypothesis in the change-of-coordinates principle is necessary. A twist about a curve bounding a disc represents the identity mapping class.

**Natural intermediate results.** (i) simple closed curves, essentiality, and separation; (ii) cutting and its Euler characteristic; (iii) full, positive, and relative-boundary mapping class groups; (iv) the base cases; (v) Dehn twists; (vi) the change-of-coordinates principle; (vii) the torus computations; (viii) the Lickorish induction; (ix) the category comparisons.

**Consequences.** `GeometricTopology` layer 9.

---

## Follow-on layer 10: Planarity

This layer is not needed for the classification theorem. It is a substantial mathematical extension that tests the embedding, duality, and cellulation theories against the classical theorems of planar graph theory: Kuratowski tests embeddings, Whitney tests the interaction between connectivity and duality, Mac Lane compares cycle-space algebra with planarity, and the five-colour theorem carries the plane-map theory to a nontrivial conclusion.

The intended scope is **Mohar and Thomassen, *Graphs on Surfaces*, chapter 2**, together with Fáry's theorem and Wagner's theorem. This is not intended to be a full roadmap of topological graph theory.

**Out of scope:** planarity-testing algorithms such as Hopcroft–Tarjan and LR-planarity (the theorems are the target, not the algorithms); Steinitz's theorem (a convexity theorem needing polytope machinery not built here); embeddings in general surfaces, face-width, edge-width, embedding extension, and Robertson–Seymour (a separate subject and a separate roadmap); Grötzsch's theorem (named as a known gap rather than silently omitted); the four colour theorem and the Heawood/Ringel–Youngs map colour theorem (see the roadmap-for-a-roadmap below).

**Representative formal statements.**

```lean
theorem eulerFormula_plane {Γ : Graph α β} (e : PlaneEmbedding Γ) (h : Γ.Connected) :
    (Γ.vertexCount : ℤ) - Γ.edgeCount + e.faceCount = 2
theorem edge_bound_of_planar (Γ : Graph α β) (h : Γ.IsPlanar) (hs : Γ.IsSimple)
    (h3 : 3 ≤ Γ.vertexCount) : Γ.edgeCount ≤ 3 * Γ.vertexCount - 6
theorem exists_vertex_degree_le_five (Γ : Graph α β) (h : Γ.IsPlanar)
    (hs : Γ.IsSimple) (hV : 0 < Γ.vertexCount) : ∃ v, Γ.degree v ≤ 5

/-- Connectivity machinery. -/
/-- Tutte's Wheel Theorem. -/
theorem exists_wheel_reduction (Γ : Graph α β) (h : Γ.IsThreeConnected) : ...
theorem exists_contractible_edge (Γ : Graph α β) (h : Γ.IsThreeConnected)
    (h5 : 5 ≤ Γ.vertexCount) : ∃ e, (Γ.contract e).IsThreeConnected

/-- Kuratowski, via Thomassen's 3-connectivity induction. -/
theorem isPlanar_iff_no_K5_K33_topologicalMinor (Γ : Graph α β) (hs : Γ.IsSimple) :
    Γ.IsPlanar ↔ ¬ Γ.HasTopologicalMinor (completeGraph 5) ∧
                 ¬ Γ.HasTopologicalMinor (completeBipartiteGraph 3 3)

/-- Wagner's Theorem. -/

theorem isPlanar_iff_no_K5_K33_minor (Γ : Graph α β) (hs : Γ.IsSimple) :
    Γ.IsPlanar ↔ ¬ Γ.HasMinor (completeGraph 5) ∧
                 ¬ Γ.HasMinor (completeBipartiteGraph 3 3)
theorem isPlanar_minorClosed : Γ.IsPlanar → Δ.IsMinorOf Γ → Δ.IsPlanar

/-- Tutte's Peripheral Cycle Theorem. -/
theorem isPeripheral_iff_isFacial (Γ : Graph α β) (h : Γ.IsThreeConnected) (e : PlaneEmbedding Γ) :
    ∀ C, C.IsPeripheral ↔ e.IsFacial C

/-- Whitney's Unique Embedding Theorem. -/
theorem planeEmbedding_unique_up_to_equivalence (Γ : Graph α β) (h : Γ.IsThreeConnected)
    (h' : Γ.IsPlanar) : Subsingleton (PlaneEmbedding Γ / EquivalenceOfEmbeddings)

/-- Whitney's 2-Isomorphism Theorem. -/
theorem cycleMatroid_iso_iff_twoIsomorphic (Γ Δ : Graph α β) : ...

/-- Cycle space, cut space, duality, Mac Lane. -/
def Graph.cycleSpace (Γ : Graph α β) : Submodule (ZMod 2) (β → ZMod 2)
def Graph.cutSpace   (Γ : Graph α β) : Submodule (ZMod 2) (β → ZMod 2)
theorem cycleSpace_finrank : Module.finrank (ZMod 2) Γ.cycleSpace
    = Γ.edgeCount - Γ.vertexCount + Γ.componentCount
theorem cycleSpace_orthogonal_cutSpace : ...
theorem planar_dual_cycleSpace_eq_cutSpace (e : PlaneEmbedding Γ) : ...

/-- Mac Lane's Planarity Criterion. -/
def Graph.HasTwoBasis (Γ : Graph α β) : Prop := ...

theorem isPlanar_iff_hasTwoBasis (Γ : Graph α β) (hs : Γ.IsSimple) :
    Γ.IsPlanar ↔ Γ.HasTwoBasis

/-- Straight-line and convex embeddings. -/
/-- Fáry's Theorem. -/
theorem exists_straightLine_planeEmbedding (Γ : Graph α β) (hs : Γ.IsSimple) (h : Γ.IsPlanar) :
    ∃ e : PlaneEmbedding Γ, e.IsStraightLine

/-- Tutte's Spring Embedding Theorem. -/
theorem exists_convex_planeEmbedding (Γ : Graph α β) (h : Γ.IsThreeConnected) (h' : Γ.IsPlanar) :
    ∃ e : PlaneEmbedding Γ, e.IsConvex

/-- The Five Color Theorem -/

theorem colorable_five_of_isPlanar (Γ : Graph α β) (hs : Γ.IsSimple) (h : Γ.IsPlanar) :
    Γ.Colorable 5
```

**Proof strategy and formalization notes.**

- ⚠ Use **Thomassen's** proof of Kuratowski, via contracting an edge in a 3-connected graph. It is shorter and considerably more formalization-friendly than the Tutte and Bondy–Murty's approach using bridges and conflict graphs. Also, the 3-connectivity machinery it needs (the wheel theorem, contractible edges) is shared with Whitney.
- The dual of a simple plane graph need not be simple, which is why duality lives on multigraphs and why layer 1 didn't build on `SimpleGraph` as the foundation.
- Tutte's spring embedding is a linear-algebra argument and is unusually formalization-friendly for its strength. Its precise form fixes a facial cycle as a convex outer polygon and produces a straight-line embedding with convex faces. It is the natural bridge toward Steinitz.
- Prove Fáry via Tutte. Given simple planar Γ on at least 4 vertices, add edges within a fixed embedding until it is maximal planar. Maximal planar graphs on at least 4 vertices are 3-connected. Apply Tutte, then delete the added edges. The remaining segments are still non-crossing.
- Whitney's unique-embedding theorem and Whitney's 2-isomorphism theorem are different results. Target both, and do not cite the 2-isomorphism paper for the unique-embedding statement. The unique-embedding theorem is uniqueness up to a homeomorphism of the sphere, allowing orientation reversal; with orientation-preserving equivalence, the two mirror-image embeddings remain distinct.

**Examples and mathematical checks.** Explicit finite models verify that `K₅` and `K₃,₃`
are non-planar and that `K₄` is planar. `edge_bound_of_planar` is checked to **fail** for a multigraph with parallel edges, exhibiting the necessity of `IsSimple`. `whitney_unique_embedding` is checked to **fail** for a 2-connected but not 3-connected planar graph, with two inequivalent embeddings exhibited. `maclane` is checked against `K₅`, whose cycle space has no sparse basis. Five-colouring is computed on a concrete triangulation with a degree-5 vertex requiring a Kempe chain interchange.

**Natural intermediate results.** (i) plane embeddings, faces, and Euler's formula; (ii) the edge bound and the degree-5 lemma; (iii) minors, topological minors, and minor-closure; (iv) the 3-connectivity machinery; (v) Kuratowski; (vi) Wagner and the equivalence; (vii) peripheral cycles; (viii) Whitney unique embedding; (ix) Whitney 2-isomorphism; (x) cycle and cut spaces; (xi) planar duality of the two spaces; (xii) Mac Lane; (xiii) Tutte's spring embedding;(xiv) Fáry; (xv) the five-colour theorem.

---

## Roadmap-for-a-roadmap: map colouring

This section is motivation for a separate future roadmap and is not work here.

With plane maps, duality, Euler's formula, and the five-colour theorem in place, the four colour theorem becomes a specification problem rather than a foundations problem: an unavoidable set, discharging configurations, and a verified reducibility check. Gonthier's Coq development is the reference for how the statement and the discharging argument should be
encoded, and its use of hypermaps is the reason this roadmap  on permutations rather than on `SimpleGraph`. The Heawood map colour theorem and the Ringel–Youngs solution for higher genus are the natural companions, and they consume layer 5's `Graph.genus`.

---

## Out of scope

- Everything in [PlanarTopology](../PlanarTopology/README.md): the Jordan curve theorem, Schoenflies, Radó, the Hauptvermutung, the PL toolkit, invariance of domain, tameness.
- Punctured surfaces, the Birman exact sequence, point pushing, and the mapping class groups of surfaces with marked points.
- Humphries' minimal generating set and the presentation of the mapping class group.
- Teichmüller theory, hyperbolic structures, and geodesic representatives.
- Non-compact surfaces and their classification.
- Singular homology, van Kampen, Mayer–Vietoris, cohomology, duality. See the encoding
  conventions on invariance.
- Higher-dimensional generalized maps beyond the dimension-polymorphic definition itself.
- Planarity-testing algorithms and the other layer 10 exclusions listed above.
- Dessins d'enfants, ribbon graphs, and the Galois action, which are natural follow-ons to
  layers 1 through 5 but are a different subject.

-
## References

- G. Damiand and P. Lienhardt, *Combinatorial Maps: Efficient Data Structures for Computer  Graphics and Image Processing*. The definition of generalized maps, the non-degeneracy conditions, and the operations in layer 4.
- J.-F. Dufourd and collaborators, and Dehlinger–Dufourd, *Formalizing generalized maps in Coq*. The prior formalization experience.
- G. Gonthier, *Formal proof: the four-color theorem*, Notices AMS **55** (2008). The hypermap encoding and the discipline of deriving graphs from maps.
- S. Lando and A. Zvonkin, *Graphs on Surfaces and Their Applications*, chapter 1. The identification of embedded graphs with combinatorial maps, which is layer 5.
- B. Mohar and C. Thomassen, *Graphs on Surfaces*, chapter 2. The scope statement for layer 10, and the proof strategy for Whitney and Mac Lane.
- C. Thomassen, *Kuratowski's theorem*, J. Graph Theory **5** (1981).  Kuratowski reference for layer 10.
- W. B. R. Lickorish, *A finite set of generators for the homeotopy group of a 2-manifold*, Proc. Cambridge Philos. Soc. **60** (1964). The generating set targeted in layer 9.
- B. Farb and D. Margalit, *A Primer on Mapping Class Groups*, chapters 1–4. The change-of-coordinates principle and the Lickorish induction as presented for a modern reader.
- J. R. Munkres, *Topology*, chapter 12. The classification via normal forms and abelianization, which is the proof strategy in layers 6 through 8 with the topology replaced by the Hauptvermutung.
- E. Moise, *Geometric Topology in Dimensions 2 and 3*, chapter 8, and A. Gallier and D. Xu, *A Guide to the Classification Theorem for Compact Surfaces*. The classification itself.