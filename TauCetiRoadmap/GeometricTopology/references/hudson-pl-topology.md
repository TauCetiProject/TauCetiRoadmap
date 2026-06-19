# Fair-use extract: Hudson, Piecewise Linear Topology: PL maps and manifolds
**Source.** J. F. P. Hudson, Piecewise Linear Topology, W. A. Benjamin, 1969.
**Locus.** Chapter I (Basic Definitions and Subdivision Theorems), §1 "Basic Definitions" (printed pp. 1–4) and §5 "Piecewise Linear Manifolds" (printed pp. 20, 23, 26). PDF page = printed page + 5 (e.g. printed p. 2 = PDF p. 7).
**Supports.** GeometricTopology roadmap, layer 1 (the PL structure groupoid).
*(Short attributed quotations of the essential definitions, surrounding material summarised, for scholarly reference.)*

## Summary

Hudson builds the PL category concretely on Euclidean polyhedra rather than abstractly. A *cell* is a (bounded) intersection of half-spaces; a *Euclidean polyhedron* is any finite union of cells (printed p. 2). A map between polyhedra is *piecewise linear* exactly when it is continuous and its graph is itself a polyhedron (printed p. 2). Lemma 1.1 records that PL is local, that the identity is PL, and that PL maps compose (printed p. 3), which is what makes the PL maps a category.

On top of this Hudson defines a PL structure on an arbitrary topological space `X` via charts: a *co-ordinate map* is a polyhedron-domain embedding into `X`; two co-ordinate maps are *compatible* when their overlap is itself a co-ordinate image with PL transition maps; and a *P.L. structure* is a maximal family of pairwise-compatible co-ordinate maps covering `X` (printed pp. 3–4). This is the atlas/structure-groupoid presentation directly relevant to layer 1.

PL manifolds are then introduced two ways. The direct definition (§5, printed p. 20): a *p.l. manifold* `Mᵐ` is a Euclidean polyhedron in which every point has a closed neighbourhood that is a *p.l. m-ball* (a polyhedron PL homeomorphic to an m-simplex). Equivalently, via triangulations, a simplicial complex `K` is a *combinatorial n-manifold* when every link is a sphere or ball of the complementary dimension (printed p. 26); Corollary 1.16 plus the following Remark show `|K|` is a p.l. n-manifold iff `K` is a combinatorial n-manifold. "PL homeomorphism" is not boxed as a separate definition; it is simply a PL map that is a homeomorphism, with `≅` defined to mean "p.l. homeomorphic" (note to Lemma 1.14, printed p. 23).

## Key statements (quoted)

### PL map (printed p. 2; PDF p. 7)

> If f: P —> Q is a map, P and Q polyhedra, then we say that f is **piecewise linear** provided that
> (1) f is continuous; and
> (2) Γ_f = {(x, f(x)) | x ∈ P} is a polyhedron.

Immediately preceding, on the same page (printed p. 2):

> A **Euclidean Polyhedron** in E^h is any finite union of cells.

### Lemma 1.1, PL is local, reflexive, and closed under composition (printed p. 3; PDF p. 8)

> **Lemma 1.1** a) If P₁ and P₂ are polyhedra, and f: P₁ ∪ P₂ —> Q, Q another polyhedron, then f is piecewise linear if and only if f|P₁ and f|P₂ are piecewise linear.
> b) i: P —> P is p.l. (= piecewise linear), P any polyhedron.
> c) The composite of p.l. maps is a p.l. map.

(The statement of part a) writes the domain as "P₁ P₂"; from the proof this is the union P₁ ∪ P₂. The abbreviation "p.l." is fixed here as meaning "piecewise linear".)

### Co-ordinate map, compatibility, and P.L. structure (printed pp. 3–4; PDF pp. 8–9)

End of printed p. 3 into p. 4:

> A **co-ordinate map** of X is a map f: P —> X, P a polyhedron, which is an embedding [i.e., a homeomorphism onto its image]. We usually write (f, P) to denote such a map. Two co-ordinate maps (f, P) and (g; Q) are said to be **compatible** if either f(P) ∩ g(Q) = ∅ or there exists a co-ordinate map (h; R) such that the following hold:
> (1) h(R) = f(P) ∩ g(Q)
> (2) f⁻¹h and g⁻¹h are piecewise linear.

> A **P.L. structure** on X is a family 𝓕 of co-ordinate maps satisfying the following:
> (1) Any two elements of 𝓕 are compatible.
> (2) If x ∈ X, there exists (f, P) ∈ 𝓕 such that f(P) is a neighborhood of x in X.
> (3) 𝓕 is maximal; i.e., if (f, P) is compatible with every map in 𝓕, then (f, P) ∈ 𝓕.

> If 𝓕 satisfies (1) and (2), it is called a **basis for a P.L. structure on X**.

(Examples on printed p. 4: for a polyhedron `P`, the identity `1_P : P → P` is a basis for a P.L. structure; for `U ⊆ Eⁿ`, the family of inclusions of polyhedra `P ⊆ U` is a basis.)

### p.l. m-ball, m-sphere, and p.l. manifold (printed p. 20; PDF p. 25)

> **Definition.** A piecewise linear **m-ball** is a polyhedron which is piecewise homeomorphic to an m-simplex. A piecewise linear **m-sphere** is a polyhedron which is p.l. homeomorphic to the boundary on [sic; read: of] an (m+1)-simplex. A **p.l. manifold of dimension m**, Mᵐ, is a Euclidean polyhedron in which every point has a (closed) neighborhood which is a p.l. m-ball.

(The m-ball clause reads "piecewise homeomorphic"; from context, and the parallel m-sphere clause, this means "piecewise linearly homeomorphic". The m-sphere clause's "boundary on an (m+1)-simplex" is an apparent typo for "boundary of an (m+1)-simplex".)

### `≅` means PL homeomorphic (note to Lemma 1.14, printed p. 23; PDF p. 28)

> **Note:** ≅ means p.l. homeomorphic.

### Combinatorial n-manifold; interior and boundary (printed p. 26; PDF p. 31)

> **Definition.** The complex K is called a **combinatorial n-manifold** if for all A ∈ K, link(A; K) is a sphere or ball of dimension n − dim A − 1. (Note: We have been writing link(A; K) = |link(A; K)|.)

The following Remark records the equivalence with the p.l.-manifold definition:

> Corollary 1.16 asserts that if |K| is a p.l. n-manifold, then K is a combinatorial n-manifold. Conversely, if K is a combinatorial n-manifold, [...] K a combinatorial n-manifold implies |K| is a p.l. n-manifold.

Same page, interior and boundary:

> **Definition.** Let P be an n-manifold. Let x ∈ P. We say x ∈ P̊ if given **any** triangulation of P having x as a vertex, K, link(x; K) is a sphere. We say x ∈ Ṗ (or x ∈ ∂P) if for |K| = P a triangulation of P, with x a vertex, link(x; K) is a ball. P̊ is called the **interior** of P, and Ṗ = ∂P is called the **boundary** of P. If Ṗ = ∅, we say that P is a **manifold without boundary**.

## Notes

- **Page-offset calibration.** Confirmed printed "-13-" on PDF p. 18, "-2-" on PDF p. 7, "-20-" on PDF p. 25, "-23-" on PDF p. 28, "-26-" on PDF p. 31. So printed page n = PDF page n + 5 throughout Chapter I.
- **OCR quality.** The volume was printed from typescript ("A Note from the Publisher", printed front matter); the extracted text layer is heavily garbled (letters spaced and mis-recognised). All quotations above were transcribed from the rendered page images, not from `pdftotext` output.
- **Relation to the roadmap (Rourke–Sanderson primary).** Hudson's "co-ordinate map / compatible / P.L. structure" triple (printed pp. 3–4) is the chart-and-transition-map presentation of a PL structure, i.e. the PL structure groupoid restricted to opens, the layer-1 target. Hudson uses concrete Euclidean polyhedra and PL maps with polyhedral graphs, where Rourke–Sanderson work with abstract polyhedra and PL maps defined by triangulation; the two presentations agree on the resulting category. Treat this file as supporting context for the verbatim definitions of "PL map" and "PL manifold"; defer to Rourke–Sanderson for the primary formulation.
- **No standalone "PL homeomorphism" definition.** Hudson does not box one. A PL homeomorphism is a PL map (printed p. 2 definition) that is a homeomorphism; `≅` is fixed to mean "p.l. homeomorphic" on printed p. 23. The inverse of a PL homeomorphism is automatically PL (standard; consistent with Lemma 1.1's closure properties).
- **Two equivalent manifold definitions.** The direct definition (printed p. 20) is via local p.l.-ball neighbourhoods; the combinatorial definition (printed p. 26) is via links in a triangulation. Corollary 1.16 (printed p. 24) and the printed-p. 26 Remark establish their equivalence.
