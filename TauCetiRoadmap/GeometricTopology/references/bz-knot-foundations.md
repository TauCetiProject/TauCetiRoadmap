# Fair-use extract: Burde–Zieschang, Knots: foundations
**Source.** G. Burde, H. Zieschang, Knots, 2nd ed., De Gruyter Studies in Mathematics 5, 2003.
**Locus.** Chapter 1 "Knots and Isotopies", §A "Knots" (printed pp. 1–4) and §B "Equivalence of Knots" (printed pp. 4–7); Chapter 2 "Geometric Concepts", §B "Seifert Surfaces and Genus" (printed pp. 17–19); Chapter 13 "Quadratic Forms of a Knot", §A "The Quadratic Form of a Knot" (printed pp. 219–221).
**Supports.** GeometricTopology roadmap, layer 4 (knot foundations).
*(Short attributed quotations of the essential definitions, surrounding material summarised, for scholarly reference.)*

## Summary

Burde–Zieschang develop the foundations in two stages. They first introduce a knot as an embedding of a circle, then identify which equivalence relation is appropriate. They observe that the naive notion of isotopy is too coarse (any two embeddings S¹ → S³ are isotopic), so they pass to **ambient isotopy** (Def. 1.2), and then restrict attention to **tame** knots (Def. 1.3), those ambient isotopic to a simple closed polygon. Having restricted to the p.l. category, they define knot **equivalence** as p.l.-ambient isotopy (Def. 1.5). Section B then compares this with combinatorial equivalence (isotopy by Δ-moves, Def. 1.6–1.7) and with the existence of an orientation-preserving homeomorphism of S³ carrying one knot to the other, proving these three notions coincide (Prop. 1.10, "Equivalence of equivalences").

The terminology is used loosely throughout: a "knot" k may denote an embedding, a class of embeddings, an image i(S¹) (a simple closed curve), or a class of such curves. Links ("knots of multiplicity μ > 1") are embeddings of a disjoint union of circles. Henceforth the book works only with tame knots, hence in the p.l. category, with all spaces compact polyhedra with a finite simplicial structure and all maps piecewise linear.

Chapter 2 §B gives the existence of a **Seifert surface** (Prop. 2.4): every simple closed curve in R³ bounds an embedded orientable surface, constructed via Seifert's algorithm (Seifert cycles obtained by smoothing the double points of a regular projection, capped by 2-cells joined by twisted bands). The minimal genus over all spanning Seifert surfaces is defined as the **genus** of the knot (Def. 2.5), a knot invariant with g(k) = 0 characterising the trivial knot.

Chapter 13 §A introduces the **Seifert matrix** V = (v_ik) (Def. 13.2) via linking numbers between a basis of H₁(S) (S a Seifert surface) and an "associated basis" of H₁ of the cut complement C*. Proposition 13.3 records that V − Vᵀ is the intersection matrix of the surface basis, and that the two push-off inclusions give Vs and Vᵀs.

## Key statements (quoted)

### Knot (informal definition), §A, printed p. 1

> A knot, in the language of mathematics, is an embedding of a circle S¹ into Euclidean 3-space, R³, or the 3-sphere, S³.

> (On occasion we digress to consider "links" or "knots of multiplicity μ > 1" which are embeddings of a disjoint union of 1-spheres S¹ᵢ, 1 ≤ i ≤ μ, into S³ or R³.)

Embedding (general, §A, printed p. 1):

> Let X and Y be Hausdorff spaces. A mapping f : X → Y is called an embedding if f : X → f(X) is a homeomorphism.

### 1.1 Definition (Isotopy), §A, printed p. 1

> **1.1 Definition (Isotopy).** Two embeddings, f₀, f₁ : X → Y are isotopic if there is an embedding
> F : X × I → Y × I
> such that F(x, t) = (f(x, t), t), x ∈ X, t ∈ I = [0, 1], with f(x, 0) = f₀(x), f(x, 1) = f₁(x).
> F is called a level-preserving isotopy connecting f₀ and f₁.

### 1.2 Definition (Ambient isotopy), §A, printed p. 2

> **1.2 Definition (Ambient isotopy).** Two embeddings f₀, f₁ : X → Y are ambient isotopic if there is a level preserving isotopy
> H : Y × I → Y × I,  H(y, t) = (hₜ(y), t),
> with f₁ = h₁f₀ and h₀ = id_Y. The mapping H is called an ambient isotopy.

The book emphasises the crucial difference: if f₀ and f₁ are ambient isotopic then h₁ restricts to a homeomorphism (Y − f₀(X)) → (Y − f₁(X)) of the complements, which need not hold for mere isotopy (printed p. 2).

### 1.3 Definition (Tame knots), §A, printed p. 3

> **1.3 Definition (Tame knots).** A knot k is called tame if it is ambient isotopic to a simple closed polygon in R³ resp. S³. A knot is wild if it is not tame.

Surrounding text (printed pp. 2–3): a wild knot example (the Fox–Artin curve, Figure 1.2) has a limit point L at which it is "wild"; Milnor proved "most" knots are wild, and almost all knots are wild at every point. "Henceforth we shall be concerned only with tame knots. Consequently we shall work always in the p.l.-category."

### 1.4 Definition (p.l. isotopy and p.l.-ambient isotopy), §A, printed p. 3

The p.l. analogues of 1.1 and 1.2: f₀, f₁ : X → Y (polyhedra) are p.l. isotopic if there is a level-preserving p.l.-embedding F : X × I → Y × I, F(x, t) = (fₜ(x), t), 0 ≤ t ≤ 1; and p.l.-ambient isotopic if there is a level-preserving p.l.-isotopy H : Y × I → Y × I, H(y, t) = (hₜ(y), t), with f₁ = h₁f₀ and h₀ = id_Y. "In future we shall usually omit the prefix 'p.l.'."

### 1.5 Definition (Equivalence), §A, printed pp. 3–4

> **1.5 Definition (Equivalence).** Two (p.l.)-knots are equivalent if they are (p.l.)-ambient isotopic.

For oriented knots (printed p. 4): "Two oriented knots are equivalent, if there is an ambient isotopy connecting them which respects the orientation of the knots."

### 1.6 Definition (Δ-move), §B, printed p. 4

> **1.6 Definition (Δ-move).** Let u be a straight segment of a polygonal knot k in R³ (or S³), and D a triangle in R³, ∂D = u ∪ v ∪ w; u, v, w 1-faces of D. If D ∩ k = u, then k′ = (k − u) ∪ v ∪ w defines another polygonal knot. We say k′ results from k by a Δ-process or Δ-move. If k is oriented, k′ has to carry the orientation induced by that of k − u. The inverse process is denoted by Δ⁻¹.

(The Δ symbol is rendered in the PDF as the section symbol/blank in places; here written Δ to match the section heading and figure caption "Δ-move".)

### 1.7 Definition (Combinatorial equivalence), §B, printed p. 4

> **1.7 Definition (Combinatorial equivalence).** Two knots are combinatorially equivalent or isotopic by moves, if there is a finite sequence of Δ- and Δ⁻¹-moves which transforms one knot to the other.

### 1.10 Proposition (Equivalence of equivalences), §B, printed p. 6

> **1.10 Proposition (Equivalence of equivalences).** Let k₀ and k₁ be p.l.-knots in S³. The following assertions are equivalent.
> (1) There is an orientation preserving homeomorphism f : S³ → S³ which carries k₀ onto k₁, f(k₀) = k₁.
> (2) k₀ and k₁ are equivalent (ambient isotopic).
> (3) k₀ and k₁ are combinatorially equivalent (isotopic by moves).

### 2.4 Proposition (Seifert surface), Ch. 2 §B, printed p. 17

> **2.4 Proposition (Seifert surface).** A simple closed curve k ⊂ R³ is the boundary of an orientable surface S, embedded in R³. It is called a Seifert surface.

The proof (printed pp. 17–18) is Seifert's algorithm: smooth the double points of an oriented regular projection p(k) to obtain disjoint oriented simple closed **Seifert cycles**, cap each by an oriented 2-cell placed in a parallel plane, and rejoin at the double points by twisted bands to obtain a connected orientable surface S with ∂S = k.

### 2.5 Definition (Genus), Ch. 2 §B, printed p. 18

> **2.5 Definition (Genus).** The minimal genus g of a Seifert surface spanning a knot k is called the genus of the knot k.

The book notes g is a knot invariant (independent of the representative in the equivalence class), and "g(k) = 0 characterizes the trivial knot." The genus was introduced by H. Seifert in [Seifert 1934]. The construction above also yields a "canonical genus" g′ of a given projection (printed pp. 18–19).

### 13.2 Definition (Seifert matrix), Ch. 13 §A, printed p. 220

Set-up (printed pp. 219–220): cut the knot complement C along a Seifert surface S to obtain C* (the complement of a handlebody of genus 2g in S³), with surfaces S⁺ and S⁻ in ∂C*; {aᵢ | 1 ≤ i ≤ 2g} a basis of H₁(S), with push-offs {aᵢ⁺}, {aᵢ⁻} on S⁺, S⁻; and {sₖ} generators of H₁(C*) associated to {aᵢ} by linking numbers lk(aᵢ, sₖ) = δ_ik.

> **13.2 Definition.** Let {aᵢ | 1 ≤ i ≤ 2g} be a basis of H₁(S). A basis {sᵢ | 1 ≤ i ≤ 2g} of H₁(C*) is called an associated basis with respect to {aᵢ}, if lk(aᵢ, sₖ) = δ_ik. The matrix V = (v_ik) defined by the inclusion
> i⁻ : S⁻ → C*,  i\*⁻(aᵢ⁻) = Σ v_ik sₖ
> is called a Seifert matrix.

### 13.3 Proposition (properties of V), Ch. 13 §A, printed p. 220

> **13.3 Proposition.** Let a, s be associated bases of H₁(S), H₁(C*), respectively. If i\*⁻(a⁻) = Vs then i\*⁺(a⁺) = Vᵀs. Moreover V − Vᵀ is the intersection matrix of the basis a = (aᵢ).

### 13.4 Definition (A-equivalence of symmetric matrices), Ch. 13 §A, printed pp. 220–221

> **13.4 Definition.** Two symmetric n×n-matrices M, M′ over A are called A-equivalent if there is an A-unimodular matrix P — a matrix over A with det P a unit of A — with M′ = PMPᵀ.

"We use the term equivalent instead of Z-equivalent." (printed p. 221)

## Notes

- **Page offset.** Printed page 1 = PDF page 13 (offset 12), calibrated against running heads ("B Equivalence of Knots 5" on PDF p. 17, etc.). Locators above use printed page numbers.
- **Δ-symbol rendering.** In the extracted text the triangle symbol Δ for the Δ-move (Defs. 1.6, 1.7, and the "−1" inverse) renders as blanks/garbled glyphs. The section is titled with the move and Figure 1.3 is captioned for it; I have written "Δ" throughout, matching standard usage. Reading the printed page directly is advised if the exact glyph matters.
- **Cross-reference quirk.** In the §2B genus discussion (printed p. 18) the book cites "(Proposition 1.5)" for the existence of a homeomorphism h : S³ → S³ with h(k) = k′ when k, k′ are equivalent. Item 1.5 is itself a Definition (Equivalence); the substantive statement that equivalence yields such an orientation-preserving homeomorphism is Proposition 1.10. This appears to be an internal cross-reference imprecision in the book, not a transcription error.
- **Garbled math in Lemma 13.5 / Cor. 13.6.** The matrix normal forms in Lemma 13.5 (the "reduced" Seifert matrix block form) and the surrounding proof (printed pp. 221–223) extract as heavily scrambled glyphs from the PDF (matrix entries, the form of U, etc.). They are summarised here only at the level of named objects ("reduced Seifert matrix W with det W ≠ 0"); the exact matrix entries are [?] from this extraction and should be read from the printed page if needed. Definitions 13.2–13.4 and Proposition 13.3 extracted cleanly.
- **Seifert matrix size.** Def. 13.2 takes bases of size 2g where g is the genus of the Seifert surface S used; V is then a 2g × 2g integer matrix.
- This is a supporting reference. Lickorish is the primary source for the GeometricTopology layer-4 knot foundations.
