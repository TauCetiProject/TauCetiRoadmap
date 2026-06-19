# Fair-use extract: Moise, Geometric Topology in Dimensions 2 and 3: triangulation of 3-manifolds
**Source.** E. Moise, Geometric Topology in Dimensions 2 and 3, Springer GTM 47, 1977.
**Locus.** Chapter 35 "The Triangulation theorem" (printed pp. 247-252) and Chapter 36 "The Hauptvermutung; Tame imbedding" (printed pp. 253-255). Main statements: Theorem 35.3 (printed p. 252) and Theorem 36.2 (printed p. 253).
**Supports.** GeometricTopology roadmap, layer 11 (triangulation).
*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

## Summary

The two layer-11 results are stated near the end of the book, as the culmination of Chapters 33-36.

Chapter 35 ("The Triangulation theorem", pp. 247-252) builds the analytic machinery: a sequence of piecewise-linear-homeomorphism (PLH) approximation theorems for mappings of polyhedra in PL 3-manifolds. Theorem 35.1 (p. 247) gives, for a 1-dimensional polyhedron K in a PL 3-manifold and a homeomorphism h of an open set onto a PL 3-manifold, a regular neighborhood N of K and a PLH f: N -> X that φ-approximates h. Theorem 35.2 (pp. 251-252) upgrades this from 1-dimensional polyhedra to polyhedral 3-manifolds with boundary. From these, the chapter concludes with **Theorem 35.3, the triangulation theorem for 3-manifolds**: every 3-manifold is homeomorphic to a polyhedron |K|.

Moise notes (p. 252) that the first "almost PL" proof of the triangulation theorem is due to Peter B. Shalen [S₁], and that the idea of using the Loop theorem to prove polyhedral interpolation theorems is Shalen's; he describes this as reducing "by order of magnitude, the difficulty of the triangulation problem." He also references Bing [B₁] for an "alternate proof," and remarks that the corresponding portion of his own earlier paper [M₅] "is best forgotten."

Chapter 36 ("The Hauptvermutung; Tame imbedding", pp. 253-255) derives the uniqueness result. Theorem 36.1 (p. 253) is the open-set PLH approximation theorem that additionally preserves the image (f(U) = h(U)). Specializing it to U = M₁ with the two manifolds presented as |K₁| and |K₂| yields **Theorem 36.2, the Hauptvermutung for 3-manifolds**: a homeomorphism between the underlying spaces of two triangulated 3-manifolds can be approximated by (indeed implies the existence of) a PLH between them. The chapter then develops tame, semi-locally tame, and locally tame sets, proving that in dimension 3 all three notions coincide (Theorems 36.3 and 36.4), and ends with exercises/questions.

## Key statements (quoted)

### Theorem 35.3, the triangulation theorem for 3-manifolds (printed p. 252)

> Theorem 3 (The triangulation theorem for 3-manifolds). Let M be a 3-manifold. Then there is a complex K such that M and |K| are homeomorphic.

(Immediately following remark, p. 252:)

> The proof is by a straightforward analogy with the proof that was used in the 2-dimensional case, in Section 8. For an "alternate proof," see Bing [B₁].

### Theorem 36.2, the Hauptvermutung for 3-manifolds (printed p. 253)

> Theorem 2. (The Hauptvermutung for 3-manifolds). Let K₁ and K₂ be triangulated 3-manifolds. If there is a homeomorphism |K₁|→|K₂|, then there is a PLH |K₁|→|K₂|.

### Supporting approximation theorems (context)

Theorem 35.1 (printed p. 247):

> Theorem 1. Let K be a 1-dimensional polyhedron in a PL 3-manifold M₁. Let U be an open set containing K, and let h be a homeomorphism of U into a PL 3 manifold M₂. Let φ be a strongly positive function on U. Then there is a regular neighborhood N of K in U, and a PLH
>     f: N→X ⊂ M₂,
> such that (1) X is a neighborhood of K' = h(K) and (2) f is a φ-approximation of h|N.

Theorem 35.2 (printed pp. 251-252):

> Theorem 2. Let M₁ and M₂ be PL 3-manifolds, let K be a polyhedral 3-manifold with boundary in M₁, let h be a homeomorphism K→M₂, and let φ be a strongly positive function on K. Then there is a PLH f: K→M₂, such that f is a φ-approximation of h.

Theorem 36.1 (printed p. 253):

> Theorem 1. Let M₁ and M₂ be PL 3-manifolds, let U be an open set in M₁, let h be a homeomorphism U⇒M₂, and let φ be a strongly positive function on U. Then there is a PLH f: U⇒M₂ such that (1) f is a φ-approximation of h and (2) f(U) = h(U).

### Tameness results (Chapter 36 context)

Theorem 36.3 (printed pp. 253-254):

> Theorem 3. In R³, or in a PL 3-manifold M, every semi-locally tame set is tame. In fact, if L is semi-locally tame, then for every open set V containing L, and for every ψ ≫ 0 on V, there is a homeomorphism g': M↔M such that (1) g'(L) is a polyhedron, (2) g'|(M − V) is the identity, and (3) g'|V is a ψ-approximation of the identity.

Theorem 36.4 (printed p. 254):

> Theorem 4. In R³, or in a PL 3-manifold, every locally tame set is tame.

## Notes

- **Theorem numbering.** Moise numbers theorems per chapter/section: within Chapter 35 the statements are referred to in the text as "Theorem 35.1", "Theorem 35.2", "Theorem 35.3"; within Chapter 36 as "Theorem 36.1", "Theorem 36.2", etc. On the page itself each is printed simply as "Theorem 1", "Theorem 2", "Theorem 3". Cross-references in the running text use the dotted form (e.g. p. 251 "Just as in the proof of Theorem 35.1"; p. 252 "Theorem 2, and the latter was proved in [M₅]").
- **Page offset.** PDF page = printed page + 10 (PDF p. 257 = printed p. 247, the Chapter 35 title page). Verified against the printed page-number footers.
- **Transcription notes / OCR corrections.** The source uses φ (phi) and ≫ ("strongly positive", written φ ≫ 0); the raw OCR rendered these variously as "cp", "cj>", "<[>", "«f>", and "»". The PLH codomain arrow and inclusion in Theorem 35.1 read "f: N→X ⊂ M₂" (OCR: "f: N~x cM2"). In Theorem 36.1 the homeomorphism/PLH arrows print as a long rightward arrow (OCR: "U--'? M₂", "U⇒M₂"); transcribed here as "⇒". The double-headed homeomorphism arrow in Theorem 36.3 (OCR "M+->;M") is transcribed "M↔M". Bibliography keys appear as subscripts in the original ([S₁], [B₁], [M₅]); OCR rendered them as "[Sd", "[BI]", "[M 5]".
- **Attribution within the book.** Moise credits the "almost PL" approach to Shalen [S₁] (P. B. Shalen, "A 'Piecewise Linear' Proof of the Triangulation Theorem ...") and references Bing [B₁] (an alternative triangulation proof) and Hamilton [H₃] (A. J. S. Hamilton, "The triangulation of 3-manifolds", Quart. J. Math. Oxford). His own original proof is [M₅] (Moise V, "The Triangulation theorem and Hauptvermutung", Ann. of Math.).
