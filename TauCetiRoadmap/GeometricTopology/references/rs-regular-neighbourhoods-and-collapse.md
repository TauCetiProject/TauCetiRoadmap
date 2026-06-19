# Fair-use extract: Rourke–Sanderson, PL Topology: regular neighbourhoods, collapse, combinatorial manifolds

**Source.** C. Rourke, B. Sanderson, Introduction to Piecewise-Linear Topology, Springer, 1972 (Springer Study Edition, revised printing 1982).

**Locus.** Chapter 3 ("Regular Neighbourhoods"), printed pp. 31–41: Full Subcomplexes (3.1–3.4, pp. 31–32); Derived Neighbourhoods (3.5–3.7, p. 32); Regular Neighbourhoods and uniqueness (def. + 3.8, p. 33); Regular Neighbourhoods in Manifolds (3.10–3.14, pp. 34–35); 3.24 Regular Neighbourhood Theorem (p. 38); Collapsing (def., p. 39); Shelling (def. + 3.25–3.30, pp. 40–41). Plus the combinatorial-manifold link condition: Chapter 1 §1.8 (manifold, printed p. 7) and Chapter 2 Exercise 2.21(1) (link characterisation, printed p. 22).

**Supports.** GeometricTopology roadmap, layers 1 and 11 (the regular-neighbourhood / collapse machinery and the definition of a combinatorial manifold by the link condition: links of vertices are PL spheres or balls).

*(Short attributed quotations of the essential definitions/statements, surrounding material summarised, for scholarly reference.)*

## Summary

Chapter 3 builds regular neighbourhoods from full subcomplexes and derived subdivisions, rather than from collapsing (collapsing is introduced later in the chapter as a classical alternative tool).

- A subcomplex `L⊂K` is *full* (`L⊖K`) when `L = f_L⁻¹(0)` for the simplicial map `f_L : K → I` that sends vertices of `L` to 0 and other vertices to 1 (printed p. 31).
- The *simplicial neighbourhood* `N(L,K)`, *simplicial complement* `C(L,K)`, and the `ε`-neighbourhood `Nε(L,K)` are defined (printed p. 32). A *derived neighbourhood* is the underlying polyhedron of `N(L,K')` for `K'` a derived of `K` near `L`.
- A *regular neighbourhood* of a compact polyhedron `X` in `Y` is the underlying polyhedron of a derived neighbourhood `N(L,K')`, where `K` triangulates a neighbourhood of `X` in `Y` with `|L|=X` and `L` full (printed p. 33).
- Uniqueness up to homeomorphism is **3.8**; uniqueness up to ambient isotopy is the **Regular Neighbourhood Theorem 3.24** (printed p. 38).
- In a manifold, regular neighbourhoods are compact manifolds with boundary (**3.10**), recognised by the **Simplicial Neighbourhood Theorem (S.N.T.) 3.11** (printed p. 34) and, via collapsing, by the **Collapsing Criterion 3.30** (printed p. 41).

*Collapsing* is defined from elementary collapses across a ball `Bⁿ` onto a free face `Bⁿ⁻¹` (printed p. 39). *Shelling* is the manifold version of collapsing across an `n`-ball meeting the boundary (printed p. 40). The connection to regular neighbourhoods is **3.26** (a regular neighbourhood of `X` shells to one of `Y` when `X↘Y`), with corollaries that collapsible manifolds are balls (**3.28**) and the collapsing criterion (**3.30**).

The *combinatorial manifold* characterisation by links lives across two places: the topological/PL manifold is defined in 1.8 (printed p. 7), and the simplicial *link condition*, `|J|` is an `n`-manifold iff every vertex link is an `(n−1)`-sphere or ball, is Exercise 2.21(1) (printed p. 22).

## Key statements (quoted)

**Full subcomplex (Chapter 3, "Full Subcomplexes", printed p. 31).**
> Suppose L⊂K are simplicial complexes. Define the simplicial map f_L: K → I by setting f_L(v)=0 for vertices v∈L and f_L(v)=1 for other vertices. We then have L⊂f_L⁻¹(0)⊂K and we say that L is *full* in K if L=f_L⁻¹(0). We write L⊖K if L is a full subcomplex of K.

**Simplicial neighbourhood, complement, derived neighbourhood (Chapter 3, "Derived Neighbourhoods", printed p. 32).**
> Suppose L⊂K. Define the *simplicial neighbourhood* of L in K
> N(L,K)={A | A∈K, A<B, B∩|L|≠∅}
> i.e. the smallest subcomplex of K which is also a topological neighbourhood of L in K. Define the *simplicial complement* of L in K
> C(L,K)={A | A∈K, A∩|L|=∅}.

> A subdivision K'◁K obtained by deriving K away from L ∪ C(L,K) is said to be a *derived of K near L*. … Now suppose L⊖K and K' is a derived of K near L. Then N(L,K') is a *derived neighbourhood* of L in K.

**Regular neighbourhood (Chapter 3, "Regular Neighbourhoods", printed p. 33).**
> Now suppose X⊂Y are polyhedra, with X compact, and that K triangulates a neighbourhood of X in Y with |L|=X where L⊖K, and such that |Ṅ(L,K)| is the frontier of |N(L,K)| in Y. Suppose that K' is a derived of K near L. We then have a derived neighbourhood N(L,K') and the underlying polyhedron N=|N(L,K')| is said to be a *regular neighbourhood* of X in Y.

**3.8 Theorem, uniqueness up to homeomorphism (printed p. 33).**
> **3.8 Theorem.** *If N₁, N₂ are regular neighbourhoods of X in Y then there is a homeomorphism h: Y → Y which carries N₁ onto N₂ and is the identity on X and outside some compact subset of Y.*

**3.10 Proposition, regular neighbourhoods in manifolds are manifolds (printed p. 34).**
> **3.10 Proposition.** *A regular neighbourhood N of X in M is a compact manifold with boundary. If X⊂int M then ∂N=|Ṅ(L,K)|.*

**3.11 Theorem, Simplicial Neighbourhood Theorem, S.N.T. (printed p. 34).**
> **3.11 Theorem (S.N.T.).** *Suppose X is a compact polyhedron in the interior of the manifold M and that N is a neighbourhood of X in int M. Then N is a regular neighbourhood if and only if*
> *(i) N is a compact manifold with boundary*
> *(ii) there are triangulations (K, L, J) of (N, X, ∂N) with L⊖K, K=N(L,K) and J=Ṅ(L,K).*

**3.24 Regular Neighbourhood Theorem (printed p. 38).**
> **3.24 Regular neighbourhood theorem.** *Suppose N₁ and N₂ are regular neighbourhoods of X in Y then there is an isotopy H of Y fixed on X and of compact support carrying N₁ onto N₂ (H₁(N₁)=N₂). Moreover if Y is a manifold and X⊂int Y then we can assume further that H is fixed on any regular neighbourhood N⊂(int N₁∩int N₂) and outside any open neighbourhood U of N₁∪N₂.*

**Elementary collapse and collapse (Chapter 3, "Collapsing", printed p. 39).**
> *Definition.* Suppose X⊃Y are polyhedra and that X=Y∪Bⁿ and Y∩Bⁿ=a face Bⁿ⁻¹. Then we say that there is an *elementary collapse* of X on Y, and write X↘Y. The collapse is *across* Bⁿ *onto* Bⁿ⁻¹ *from* the complementary face Cⁿ⁻¹=cl(∂Bⁿ−Bⁿ⁻¹) …

> We say X *collapses* on Y and write X↘Y if there is a sequence of elementary collapses X=X₀↘X₁↘⋯↘Xₙ=Y. If Y is a point we say X is *collapsible* and write X↘0.

**Shelling (Chapter 3, "Shelling", printed p. 40).**
> Now suppose that M₁⊂M are n-manifolds and M↘M₁ across Bⁿ from Cⁿ⁻¹ onto Bⁿ⁻¹. Then we must have Bⁿ⁻¹⊂∂M₁ and Cⁿ⁻¹⊂∂M. A collapse of this type is an *elementary shelling* and a sequence of such collapses is a *shelling*.

**3.26 Theorem, collapse and regular neighbourhoods (printed p. 41).**
> **3.26 Theorem.** *Suppose X⊂M is a compact polyhedron and that X↘Y. Then a regular neighbourhood of X in M shells to a regular neighbourhood of Y in M.*

**3.27–3.30 Corollaries (printed p. 41).**
> **3.27 Corollary.** *If X↘0 then a regular neighbourhood of X is a ball.*
> **3.28 Corollary.** *A collapsible manifold is a ball.*
> **3.29 Corollary.** *If X⊂int M and X↘Y then a regular neighbourhood of X is a regular neighbourhood of Y.*
> **3.30 Corollary (Collapsing criterion for regular neighbourhoods).** *Let N be a neighbourhood of X in int M. Then N is regular if and only if*
> *(i) N is a compact manifold with boundary,*
> *(ii) N↘X.*

### Combinatorial manifolds via the link condition

**1.8 Manifold (Chapter 1, "Manifolds", printed p. 7).**
> **1.8** A polyhedron M is an *unbounded p.l. manifold of dimension n* (or simply an *n-manifold*) if each point x∈M has a neighbourhood in M, which is (p.l.) homeomorphic to an open set in ℝⁿ; such a neighbourhood is called a *coordinate neighbourhood*. We often indicate the dimension of an n-manifold M by writing Mⁿ.
> M is an *n-manifold with boundary* if each point has a neighbourhood homeomorphic to an open subset of either ℝⁿ or ℝⁿ₊. Define the *boundary* of M, ∂M, an unbounded (n−1)-manifold, to consist of points corresponding to ℝⁿ⁻¹×0⊂ℝⁿ₊. The boundary is well-defined by 1.7(2) and elementary algebraic topology. This also follows by an easy induction using p.l. invariance of links (2.21(2)).

**Balls and spheres (Chapter 1, "Balls and Spheres", printed p. 8).**
> A manifold homeomorphic with Iⁿ is called an *n-ball* or *n-disc* often written Bⁿ or Dⁿ. A manifold homeomorphic with ∂Iⁿ⁺¹ is called an *n-sphere*, usually written Sⁿ.

**Link condition for manifolds (Chapter 2, Exercise 2.21(1), printed p. 22).**
> **2.21** *Exercises*
> (1) Suppose J is a simplicial complex then |J| is an n-manifold if and only if |lk(x,J)| is an (n−1) sphere or ball for each vertex x∈J.

(Exercise 2.21(2): "Prove that Iⁿ≇İⁿ⁺¹ by induction using 2.19. Deduce that the boundary of a manifold is well-defined." The Remark following 2.21 notes that by 2.20 a cell C is a manifold with int C = Ĉ and ∂C = Ċ.)

## Notes

- **Page offset.** Printed page N = PDF page N + 8 (printed p. 33 is PDF p. 41). Calibrated against running page numbers/headers and consistent across Chapters 1–3.
- **OCR caveat.** The PDF text layer is garbled OCR; all quotations were transcribed from the rendered page images. Unicode has been used for mathematical symbols (`↘`, `⊖`, `⊂`, `∩`, `∪`, `∅`, `∂`, `≧`, `≅`, `≇`, superscripts/subscripts).
- **Two named "regular neighbourhood" results.** 3.8 gives uniqueness up to a (compactly supported) homeomorphism; the result the book *titles* "Regular neighbourhood theorem" is 3.24, giving uniqueness up to *ambient isotopy*. Both are quoted above.
- **Collapse arrow.** The book uses a single arrow `↘` for both elementary collapse and (sequence) collapse; the text distinguishes them by wording ("elementary collapse" vs. "collapses on"). Reproduced as `↘` throughout.
- **Manifold link condition.** The link-based definition of a combinatorial manifold is Exercise 2.21(1) (printed p. 22) rather than a numbered Definition; the PL manifold itself is defined topologically by coordinate neighbourhoods in 1.8 (printed p. 7). The combinatorial link `lk(x,J)` referenced here is defined in Chapter 2 (see companion file `rs-pl-maps-and-polyhedra.md`).
