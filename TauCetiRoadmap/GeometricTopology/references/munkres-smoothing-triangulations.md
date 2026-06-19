# Fair-use extract: Munkres, Elementary Differential Topology: smoothing of triangulations
**Source.** J. Munkres, Elementary Differential Topology, Annals of Math. Studies 54, Princeton, 1966.
**Locus.** Chapter II ("Triangulations of Differentiable Manifolds"), §8 and §10. Definition 8.3 (pp. 80–81); Theorem 8.4 (p. 81); Theorem 10.4 (p. 101); Theorems 10.5 and 10.6 (pp. 103–104); added Theorem 10.12 (p. 107).
**Supports.** GeometricTopology roadmap, layer 1 (smooth-implies-PL).
*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

> Page calibration: the printed page number equals the PDF page number minus 12 (e.g. printed p. 103 is PDF page 115). All page references below are to the printed page numbers shown in the book. No locator corrections were needed; the printed theorem numbers and the table-of-contents page numbers agree with the body text.

## Summary

This book's Chapter II is, in Munkres' own words from the Preface, "devoted to proving the existence and uniqueness of a smooth triangulation of a differentiable manifold," following "J. H. C. Whitehead [14], with some modifications" (Preface, p. viii). This is the classical content behind "smooth implies PL" in the Whitehead/Cairns tradition.

The development proceeds as follows.

- **§7 (Cell Complexes and Combinatorial Equivalence, p. 69).** Establishes the combinatorial groundwork. The key output is Theorem 7.10: two finite simplicial complexes in Rⁿ have subdivisions whose union is again a simplicial complex (they "intersect nicely"). Theorem 7.9 (the Hauptvermutung-style statement for the linear case) states that two simplicial complexes K₁, K₂ with |K₁| = |K₂| have a common simplicial subdivision.

- **§8 (Immersions and Imbeddings of Complexes, p. 69).** Defines, for a Cʳ map f : K → M of a complex into a manifold, the differential dfb (Definition 8.2, p. 80), and then defines immersion, imbedding, and, the central notion, a **Cʳ triangulation of M** as an imbedding that is a homeomorphism onto M (Definition 8.3, pp. 80–81). Theorem 8.4 (p. 81) gives the basic recognition criterion: a non-degenerate Cʳ map that is a homeomorphism of |K| onto M is automatically a Cʳ triangulation. §8 also develops what a "strong C¹ approximation" to a map f : K → M means and proves that a sufficiently good approximation to an immersion/imbedding/triangulation is again one (8.5–8.8); the integer r is fixed with 1 ≤ r ≤ ∞ for the remainder of the chapter.

- **§9 (The Secant Map Induced by f, p. 79).** Introduces the secant map (linear interpolation of f on each simplex) used to straighten imbeddings near overlaps.

- **§10 (Fitting Together Imbedded Complexes, p. 97).** The technical heart. Given Cʳ imbeddings of two complexes into M whose images overlap, one alters them slightly so the images intersect in a subcomplex after subdivision. The construction is done first in euclidean space (Corollary 10.3, Theorem 10.4) and then on a general manifold by working chart-by-chart. Munkres notes: "After this, however, the two main theorems of Chapter II fall out almost trivially (10.5 – 10.6)" (p. 97).
  - **Theorem 10.5 (p. 103)** is the **uniqueness** statement: any two Cʳ triangulations of M have subdivisions that are linearly isomorphic (with a δ-approximation refinement).
  - **Theorem 10.6 (p. 104)** is the **existence** statement: every non-bounded Cʳ manifold has a Cʳ triangulation (and a relative version for manifolds with boundary).
- The revised edition adds problems "which exploit the Whitehead triangulation techniques" (Preface, p. ix), including a relative approximation/uniqueness theorem, **Theorem 10.12 (p. 107)**.

## Key statements (quoted)

### Definition 8.3, immersion, imbedding, Cʳ triangulation (pp. 80–81)

> "**8.3 Definition.** Let f : K → M be a Cʳ map, where M is a Cʳ submanifold of Rⁿ. The map f is said to be an **immersion** if
>
>     dfb: S̄t(b,K) → Rⁿ
>
> is one-to-one for each b. An immersion which is a homeomorphism is called an **imbedding**; if it is also a homeomorphism onto, it is called a **Cʳ triangulation** of M."

(The symbol rendered S̄t(b,K) is Munkres' "star" S followed by t with an overbar; in the immersion criterion it is the closed star of the vertex/point b. dfb is the differential defined in Definition 8.2, p. 80.)

### Theorem 8.4, recognition criterion (p. 81)

> "**8.4 Theorem.** Let f : K → M be a Cʳ non-degenerate map which is a homeomorphism of |K| onto M. Then f is a Cʳ triangulation of M."

### Theorem 10.4, fitting together in euclidean space (p. 101)

> "**10.4 Theorem.** Let M be a non-bounded Cʳ submanifold of Rⁿ. Let f : K → M and g : L → M be Cʳ imbeddings whose images are closed in M. Given δ(x) > 0, there are δ-approximations f' : K' → M and g' : L' → M to f and g respectively, which intersect in a full subcomplex, such that their union is a Cʳ imbedding. (δ is to be continuous on the disjoint union of |K| and |L|.)"

### Theorem 10.5, uniqueness of smooth triangulations (p. 103)

> "**10.5 Theorem.** Let M be a Cʳ manifold; let f : K → M and g : L → M be Cʳ triangulations of M. There are subdivisions of K and L which are linearly isomorphic.
>
> In fact, given δ(x) > 0, there are δ-approximations f': K' → M and g': L' → M which are Cʳ triangulations of M, such that (f')⁻¹ g' is a linear isomorphism of L' with K'."

(Proof, p. 103: in the non-bounded case one applies Theorem 10.4 after choosing δ small enough that δ-approximations to f and g are necessarily onto, using Lemma 3.11; the bounded case is reduced to the non-bounded case via the double D(M) and Exercise (b) of 10.4.)

### Theorem 10.6, existence of a smooth triangulation (pp. 103–104)

> "**10.6 Theorem.** If M is a non-bounded Cʳ manifold, M has a Cʳ triangulation. If M is a manifold having a boundary, any Cʳ triangulation of the boundary may be extended to a Cʳ triangulation of M. (If f : J → Bd M is a Cʳ triangulation of Bd M, an **extension** of f is a Cʳ triangulation g : L → M of M such that g⁻¹ f is a linear isomorphism of J with a subcomplex of L.)"

(Proof, p. 104: cover M by m + 1 coordinate systems, build a finite rectilinear complex in each chart, approximate the inverse charts so that the m + 1 pieces intersect in full subcomplexes with imbedded union, the resulting union being a Cʳ triangulation. The bounded case triangulates a collar |J| × [0,1] and glues.)

### Theorem 10.12, relative approximation of imbeddings by triangulation-compatible maps (p. 107, added problems)

> "**10.12 Theorem.** Let f: K → M be a smooth triangulation of the non-bounded manifold M. Let g: L → M be a Cʳ imbedding, with g(L) closed in M. Given δ(x) > 0, there is a δ-approximation g': L' → M to g such that f⁻¹g': L' → K is linear."
>
> "(1) If f⁻¹g is linear on the subcomplex H of L, we may require that g' = g on |H|.
> (2) If g carries subcomplexes L₁, ..., L_k of L into the transversally intersecting non-bounded submanifolds N₁, ..., N_k of M, and if f triangulates a neighborhood of g(Lᵢ) in Nᵢ for each i, then we may require that g'(Lᵢ) ⊂ Nᵢ."

## Notes

- **Provenance / "smooth implies PL".** Theorems 10.5 (uniqueness) and 10.6 (existence) together are the precise form, in this book, of the statement that a C^∞ (more generally Cʳ, 1 ≤ r ≤ ∞) manifold has an essentially unique smooth triangulation, hence an underlying PL structure. Munkres credits the approach to J. H. C. Whitehead [14] and situates the 1930s "flowering" of the subject with H. Whitney, S. S. Cairns, and J. H. C. Whitehead (Preface, pp. vii–viii). This is the Whitehead/Cairns tradition referenced by the roadmap's layer-1 "smooth-implies-PL".

- **Meaning of "uniqueness."** Theorem 10.5 gives uniqueness only up to common subdivision and *linear* (PL) isomorphism, it does not assert that two triangulations are linearly isomorphic without subdivision (that is the unproved combinatorial Hauptvermutung). For the rectilinear/linear case, the common-subdivision statement is Theorem 7.9 (p. ~76).

- **Differentiability class.** Throughout Chapter II the class r is fixed once and for all with 1 ≤ r ≤ ∞ ("t < r < co" in the OCR is "1 < r < ∞", and the text earlier states 1 ≤ r ≤ ∞). The theorems therefore cover the C^∞ case directly.

- **Notation in quotes.** "S̄t(b,K)" denotes the closed star; "Bd M" the boundary; "|K|" the polytope (underlying space) of K; "δ(x)" a positive continuous function (so "δ-approximation" means a controlled, locally-varying approximation). These are rendered with the book's spellings.

- **Reading method.** Theorem statements were transcribed from the page images (Read of PDF pages 92–93, 98–99, 113, 115–116, 119, i.e. printed pp. 80–81, 86–87, 101, 103–104, 107). The OCR text layer (`pdftotext`) is unreliable for this scanned volume, it garbles "1 ≤ r ≤ ∞" as "t < r < co", "Cʳ" as "Gr/Or/0 r", and several theorem labels, so it was used only for navigation, not for quotation.
