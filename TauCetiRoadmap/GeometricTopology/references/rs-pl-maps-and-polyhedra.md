# Fair-use extract: Rourke–Sanderson, PL Topology: polyhedra, PL maps, complexes, links and stars

**Source.** C. Rourke, B. Sanderson, Introduction to Piecewise-Linear Topology, Springer, 1972 (Springer Study Edition, revised printing 1982).

**Locus.** Chapter 1 ("Polyhedra and P.L. Maps"), §§1.1–1.10, printed pp. 2–8; Chapter 2 ("Complexes"), §§2.1–2.18, printed pp. 11–22.

**Supports.** GeometricTopology roadmap, layers 1 and 11 (foundational vocabulary for piecewise-linear topology: what a polyhedron is, what a PL map is, the fact that every PL map is linear on a locally finite triangulation/cell decomposition, and the combinatorial notions of link and star).

*(Short attributed quotations of the essential definitions/statements, surrounding material summarised, for scholarly reference.)*

## Summary

Chapter 1 fixes the basic objects. "Linear" is used in the affine sense throughout. A *join* `AB` and a *cone* `aB` (with vertex `a`, base `B`) are defined first. A polyhedron is then defined locally, by requiring each point to have a *cone neighbourhood*; the cone is the *star* and its base the *link* (1.1). Examples (1.3) establish that subspaces of `ℝⁿ`, `ℝⁿ₊`, finite intersections, finite products, and locally finite unions of compact polyhedra are polyhedra; that cubes and cones on compact polyhedra are polyhedra; and that links and stars can themselves be taken to be polyhedra (so "from now on all links and stars are polyhedra"). A PL map is defined locally as a map that is conical on each star (1.4), and 1.5 records that linear maps, restrictions, and maps that are linear on each piece of a locally finite decomposition are PL.

Chapter 2 supplies the combinatorial tools. Simplexes (2.1), convex cells, cell complexes, subdivisions, simplicial complexes, simplicial/cellular maps, and triangulations are defined. The key structural results for the roadmap are:

- **2.3 Corollary**: every PL map admits a locally finite decomposition of the domain into simplexes on which it is linear.
- **2.11 Theorem**: every compact polyhedron is the underlying polyhedron of a simplicial complex (triangulability).
- **2.14 Theorem**: every PL map between polyhedra becomes simplicial after passing to simplicial subdivisions.
- **Triangulations** (printed p. 17): a triangulation of a compact polyhedron `P` is a pair `(K, t)` with `t : |K| → P` a homeomorphism, identified up to simplicial isomorphism.

The combinatorial *link* `lk(a,K)` and *star* `st(a,K)` of a vertex in a complex are defined in the "Pseudo-Radial Projection" section (printed pp. 20–21), where it is shown that `|st(a,K)| = a·|lk(a,K)|` and that links and stars are PL invariants (2.19).

## Key statements (quoted)

**Join (Chapter 1, "Joins and Cones", printed p. 1).**
> Let A, B ⊂ ℝⁿ be subsets. Define their join AB to be the subset AB = {λa+μb | a∈A, μ∈B} where λ, μ∈ℝ, λ, μ≧0 and λ+μ=1.

[Note: the printed condition reads "a∈A, μ∈B"; from context the second membership is "b∈B".]

**Cone (Chapter 1, "Joins and Cones", printed pp. 1–2).**
> We say that aB is a cone with vertex a and base B (or simply that aB is a cone) if each point not equal to a is expressed uniquely as λa + μb with b ∈ B, λ, μ ≧ 0 and λ + μ = 1.

**1.1 Polyhedron (printed p. 2).**
> **1.1** A subset P⊂ℝⁿ is a *polyhedron* if each point a∈P has a cone neighbourhood N=aL in P, where L is compact; N is called a *star* of a in P and L a *link* and we write N=Nₐ(P), L=Lₐ(P). Note that the case L=∅ is not excluded so that a point is a polyhedron.

**1.3(5) Locally finite union (printed p. 4).**
> (5) Let P=⋃Pₐ where Pₐ⊂ℝⁿ are compact polyhedra and the union is *locally finite* in the sense that each point p∈P has a neighbourhood meeting only finitely many of the Pₐ. Then P is a polyhedron. (Use 1.2.)

**1.4 Piecewise-linear map (printed p. 5).**
> **1.4** A map f: P → Q between polyhedra is *piecewise-linear* (abbreviated p.l.) if each point a∈P has a star N=aL such that f(λa+μx)=λf(a)+μf(x) where x∈L and λ,μ≧0, λ+μ=1. In other words, f is locally conical, in the sense that it maps rays of the local cone structure linearly.

**1.5 Examples of PL maps (printed p. 5).**
> **1.5** *Examples*
> (1) A linear map is p.l.
> (2) The restriction of a p.l. map to a subpolyhedron is p.l. A *subpolyhedron* is a subset which is itself a polyhedron.
> (3) Define f: P → Q to be *linear* if it is the restriction of a linear map ℝⁿ → ℝᵐ. Then, combining (1) and (2), f is p.l.
> (4) Let P=⋃Pₐ be a locally finite decomposition of P into compact subpolyhedra. If f: P → Q is a map such that f|Pₐ is p.l. for each α, then f is p.l.

The Remark following 1.5 (printed p. 5) states: "a map which is linear in pieces is p.l. In Chapter 2 we prove that all p.l. maps are obtained in this way, and this explains the terminology."

**2.1 Simplex / face / vertex (Chapter 2, "Simplexes", printed p. 11).**
The join is associative and commutative with
> A₀A₁…Aₙ = {∑λᵢaᵢ | λᵢ≧0, ∑λᵢ=1, aᵢ∈Aᵢ}.

> Now define a finite set {v₀, v₁, …, vₙ}⊂ℝᵐ to be *independent* if it is not contained in any subspace of dimension <n, or equivalently if the vectors {vᵢ−v₀} are linearly independent. Then define an *n-simplex* A⊂ℝᵐ to be the repeated join v₀v₁…vₙ of n+1 independent points. We call the points vᵢ the *vertices* of A and say that they *span* A. A simplex spanned by a subset of the vertices is called a *face* of A. If B is a face of A we write B<A. B is a *proper* face if also B≠A. The vertices are also regarded as faces. The point Â=∑(1/(n+1))vᵢ is the *barycentre* of A.

**2.3 Corollary, PL maps are linear on a locally finite simplicial decomposition (printed p. 12).**
> **2.3 Corollary.** *Let f: P → Q be p.l., then there is a locally finite decomposition of P into simplexes, P=⋃Aᵢ, such that f|Aᵢ is linear for each i.*

**Cell / cell complex (Chapter 2, "Cells" and "Cell Complexes", printed pp. 13–14).**
> A subset C⊂ℝᵐ is *convex* if for each pair of points a, b∈C, the arc ab⊂C. A compact convex polyhedron which spans a subspace of dimension n is called a *linear n-cell* or just a *cell*.

> A *cell complex* K is a finite collection of cells in some ℝⁿ satisfying
> (1) If C∈K and B<C then B∈K.
> (2) If B, C∈K then B∩C is a face of both B and C.
> Define the *underlying polyhedron* |K| to be the union of the cells of K.

**Subcomplex and star of a cell (Chapter 2, "Subdivisions", printed p. 15).**
> Now define L⊂K to be a *subcomplex* if L is also a cell complex.
> (8) The *r-skeleton* of K, Kʳ={C|C∈K, dim C≦r}, is a subcomplex.
> (9) If C∈K then the *star* of C in K, st(C,K)={B|B<D>C, D∈K} is a subcomplex.

**Subdivision (Chapter 2, "Subdivisions", printed p. 15).**
> L is a *subdivision* of K, written L◁K, if |L|=|K| and each cell of L is contained in a cell of K.

**Simplicial complex / simplicial & cellular maps (Chapter 2, "Simplicial Complexes" and "Simplicial Maps", printed p. 16).**
> A cell complex K is *simplicial* if each C∈K is a simplex.
> **2.9 Proposition.** *A cell complex can be subdivided to a simplicial complex without introducing any new vertices.*

> Let K, L be cell complexes and f: |K| → |L| a map. We say (f, K, L) is *cellular* or simply f is cellular if, for each C∈K, f|C is linear and f(C) is a cell of L. If K and L are simplicial then we say that f is *simplicial*.

**2.11 Theorem, triangulability (printed p. 16).**
> **2.11 Theorem.** *Any compact polyhedron is the underlying polyhedron of some simplicial complex.*

**2.14 Theorem, every PL map is simplicial after subdivision (printed p. 17).**
> **2.14 Theorem.** *Let f: |K| → |L| be p.l. then there are simplicial subdivisions K'◁K, L'◁L such that f: |K'| → |L'| is simplicial.*

The following Convention (printed p. 17) states: "From now on 'complex' means simplicial complex and letters J, K, L, K', L' etc. denote simplicial complexes."

**Triangulation (Chapter 2, "Triangulations", printed p. 17).**
> A *triangulation* of a compact polyhedron P is a pair (K, t) where t: |K| → P is a (p.l. as always) homeomorphism. We identify two triangulations of P if they differ by a (simplicial) isomorphism …

**Derived subdivision (Chapter 2, "Derived Subdivisions", printed p. 20).**
> If in the proof of 2.17 we have L'=L and allow L, K to be cell complexes then K'◁K is called a *derived* subdivision of K, obtained by *deriving* K *away from* L. If L=∅ then K' is a *first derived*, usually denoted K⁽¹⁾, and an *r-th derived* K⁽ʳ⁾ is defined inductively by K⁽ʳ⁾=(K⁽ʳ⁻¹⁾)⁽¹⁾. A derived is *barycentric* if each aᵢ=Âᵢ. Note that K⁽¹⁾ is always a simplicial complex.

**Combinatorial link and star of a vertex (Chapter 2, "Pseudo-Radial Projection", printed pp. 20–21).**
> Let K be a complex and let a∈K be a vertex. Define
> lk(a,K)={A|A∈K, aA∈K, a∉A}
> then it is easy to see that st(a,K) is the cone a lk(a,K). Thus |st(a,K)| and |lk(a,K)| are an example of a link and star of a in |K|.

The text continues (printed p. 21): given a compact polyhedron P with a∈P and a star N=aL of a in P, one may triangulate so that "N=|st(a,K)| and L=|lk(a,K)| in this triangulation."

**2.19 Lemma, PL invariance of links and stars (printed p. 21).**
> **2.19 Lemma.** *Suppose that f: (|K|, a) → (|L|, b) is a homeomorphism with a∈K, b∈L. Then there is a homeomorphism |lk(a,K)| → |lk(b,L)|.*

The simplicial isomorphism produced in the proof "is referred to as a *pseudo-radial projection*."

## Notes

- **Page offset.** Printed page N = PDF page N + 8 (printed p. 2 is PDF p. 10). Calibrated against the running page numbers and headers; consistent across Chapters 1–3.
- **OCR caveat.** The PDF text layer is garbled OCR; all quotations above were transcribed by reading the rendered page images, not the text layer. Unicode has been used for mathematical symbols (`⋃`, `∑`, `≧`, `∈`, `∉`, `◁`, `<`, `>`, subscripts).
- **Quoted-text correction.** In the join definition (printed p. 1) the printed set-builder condition reads `{λa+μb | a∈A, μ∈B}`; the second clause should read `b∈B`. Flagged inline with `[Note: …]`.
- **Manifold definition (1.8, printed p. 7)** belongs primarily to the companion file (combinatorial manifolds / link condition); see `rs-regular-neighbourhoods-and-collapse.md`. It is recorded there together with the link-condition characterisation (Exercise 2.21(1)).
- The convention from 1.7 onward (printed p. 7) drops the prefix "p.l.": "map, embedding, homeomorphism will mean p.l. map etc.", with "topological map" used for the non-PL case.
