# Fair-use extract: Lickorish, An Introduction to Knot Theory: link diagrams and Reidemeister's theorem

**Source.** W. B. R. Lickorish, An Introduction to Knot Theory, Springer GTM 175, 1997.
**Locus.** Chapter 1, "A Beginning for Knot Theory", Definitions 1.1–1.2 (printed p. 1) and the link-diagram definition plus the Reidemeister statement (printed pp. 2–4; PDF pp. 12–14).
**Supports.** GeometricTopology roadmap, layer 4 (link diagrams, ambient isotopy, and the generation of equivalence by the three Reidemeister moves).

*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

## Summary

Lickorish develops knot theory in the piecewise-linear category. A link is a finite disjoint union of piecewise-linear simple closed curves in `S³` (or `ℝ³`); a one-component link is a knot (Definition 1.1, printed p. 1). Equivalence of links is defined by an orientation-preserving PL homeomorphism of `S³` carrying one link to the other (Definition 1.2, printed p. 1); he notes that such an `h` is then isotopic to the identity, so equivalence really is an ambient-isotopy notion.

He records that equivalent links differ by a finite sequence of elementary "triangle moves" (replace one edge of a planar triangle meeting `L` in that edge by the other two edges, or the reverse), an assumed result of PL topology (printed p. 2). Projecting in general position to `ℝ²` and recording over/under data at the (transverse, double-point) crossings gives a *link diagram* (printed p. 3). Analysing the effect of the triangle moves on diagrams yields the Reidemeister statement: any two diagrams of equivalent links are related by a sequence of Reidemeister moves (Types I, II, III) and an orientation-preserving homeomorphism of the plane (printed pp. 3–4). Note that Lickorish states this as running prose, not as a numbered theorem.

Diagrams related by Type II and Type III moves only are called *regularly isotopic* (printed p. 4). This regular-isotopy notion is what the Kauffman bracket later respects (see lickorish-jones.md).

## Key statements (quoted)

Definition of a link and a knot (printed p. 1):

> Definition 1.1. A link L of m components is a subset of S³, or of ℝ³, that consists of m disjoint, piecewise linear, simple closed curves. A link of one component is a knot.

Definition of equivalence (printed p. 1; OCR rendered the final "h(L₁) = h(L₂)" with a typo):

> Definition 1.2. Links L₁ and L₂ in S³ are equivalent if there is an orientation-preserving piecewise linear homeomorphism h : S³ → S³ such that h(L₁) = [?](L₂).

Definition of a link diagram (printed p. 3):

> Given such a situation, the image of L in ℝ² together with "over and under" information at the crossings is called a link diagram of L. Of course, a crossing is a point of intersection of the projections of two line segments of L; the "over and under" information refers to the relative heights above ℝ² of the two inverse images of a crossing. This information is always indicated in pictures by breaks in the under-passing segments.

The Reidemeister statement (printed pp. 3–4):

> With a little careful thought, it follows that any two diagrams of equivalent links L₁ and L₂ are related by a sequence of Reidemeister moves and an orientation-preserving homeomorphism of the plane. The Reidemeister moves are of three types, shown below in Figure 1.3; each replaces a simple configuration of arcs and crossings in a disc by another configuration. A move of Type I inserts or deletes a "kink" in the diagram; moves of Type III preserve the number of crossings. Any homeomorphism of the plane must, of course, preserve all crossing information.

Regular isotopy (printed p. 4):

> Diagrams related by moves of Type II and Type III only are sometimes said to be regularly isotopic.

## Notes

- The suggested locus (Chapter 1) is correct.
- Lickorish does **not** state "Reidemeister's theorem" as a numbered theorem; it appears as the prose sentence quoted above on printed pp. 3–4. There is no "Theorem 1.x" attached to it.
- The OCR in Definition 1.2 dropped the leading `h` from the right-hand side `h(L₂)`; the intended statement is `h(L₁) = h(L₂)`. I have marked the affected token with `[?]`.
- Figure 1.3 (the three move types) and Figure 1.1 (the triangle move) are referenced but not reproduced here.
- Lickorish emphasises that the equivalence in Definition 1.2 is genuinely ambient: he remarks the PL homeomorphism `h` "is isotopic to the identity", giving `hₜ : S³ → S³` with `h₀ = 1`, `h₁ = h`, so the whole of `S³` is continuously distorted to move `L₁` to `L₂` (printed p. 1).
- Crossing-sign conventions (used later for the writhe) are fixed in Figure 1.11; see lickorish-jones.md.
