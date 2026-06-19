# Fair-use extract: Gompf–Stipsicz, 4-Manifolds and Kirby Calculus: surgery and handle calculus
**Source.** R. Gompf, A. Stipsicz, 4-Manifolds and Kirby Calculus, AMS GSM 20, 1999.
**Locus.** Chapter 4 "Handlebodies and Kirby diagrams" (§4.1 Handles, §4.2 Handle decompositions, §4.4 Kirby diagrams, §4.5 Linking numbers and framings; printed pp. 99–125) and Chapter 5 "Kirby calculus" (§5.2 Surgery, §5.3 Dehn surgery; printed pp. 153–160).
**Supports.** GeometricTopology roadmap, layer 5 (Dehn surgery).
*(Short attributed quotations of the essential definitions, surrounding material summarised, for scholarly reference.)*

## Summary

This file collects the definitions and main results behind handle attachment, the surgery description of 3- and 4-manifolds, Dehn surgery on links, and the framing/slope conventions, from the handlebody and Kirby-calculus chapters of Gompf–Stipsicz.

The page-offset calibration for this scanned PDF: printed page p = PDF page (p + 12) in the arabic-numbered body (verified: §4.1 "Handles" on printed p. 99 is PDF page 111).

Logical thread of the chapter:

- **Handles (§4.1).** A k-handle is a copy of D^k × D^(n−k) glued to ∂X along ∂D^k × D^(n−k). Attaching it is, up to homotopy, the same as attaching a k-cell. The attaching data reduce to (i) a framed embedding φ₀ : S^(k−1) → ∂X with trivial normal bundle (a "knot"), and (ii) a normal framing; the diffeomorphism type of X ∪_φ h depends only on the isotopy class of this framed embedding. Isotopy classes of framings of S^(k−1) form a torsor under π_(k−1)(O(n−k)).
- **Handle decompositions (§4.2).** Every smooth compact manifold pair (X, ∂₋X) admits a handle decomposition (Morse theory). The smooth/topological distinction is sharpest in dimension 4: a topological 4-manifold pair admits a (topological) handle decomposition iff X is smoothable.
- **Kirby diagrams (§4.4).** A Kirby diagram describes a 4-dimensional (relative) handlebody by a picture in ℝ³: 1-handles are pairs of balls, 2-handles are framed knots/links in the boundary of the 0- and 1-handles. For closed simply connected X, the complexity is concentrated in the 2-handles (3- and 4-handles can be attached canonically).
- **Linking numbers and framings (§4.5).** Linking number lk(K₁,K₂); the framing coefficient of a framed knot in ∂D⁴ equals lk(K,K′) for a parallel copy K′; this identifies integers with 2-handle attachments. The blackboard framing has coefficient = writhe; the 0-framing comes from a Seifert surface. The linking matrix of a framed link equals the intersection form of the 2-handlebody it describes.
- **Surgery (§5.2).** Surgery on a framed k-sphere in M^n; relation to handle attachment and to cobordism.
- **Dehn surgery (§5.3).** Dehn (rational) surgery on a knot in a 3-manifold, with slope p/q ∈ ℚ ∪ {∞}. For S³ the integer coefficients are exactly the framing coefficients of standard surgery. Theorem (Rohlin/Lickorish–Wallace): every closed oriented 3-manifold is integral surgery on a link in S³; Kirby's theorem (with Fenn–Rourke) gives the moves (blow up/down, handle slides) relating any two surgery descriptions of diffeomorphic 3-manifolds.

## Key statements (quoted)

All quotations transcribed from the page images; printed page numbers given.

### Handles

> **Definition 4.1.1.** For 0 ≤ k ≤ n, an *n-dimensional k-handle* h is a copy of D^k × D^(n−k), attached to the boundary of an n-manifold X along ∂D^k × D^(n−k) by an embedding φ : ∂D^k × D^(n−k) → ∂X.

(Printed p. 99.) The surrounding text names the parts: "we will call D^k × 0 the *core* of the handle, 0 × D^(n−k) the *cocore*, φ the *attaching map*, ∂D^k × D^(n−k) (or its image φ(∂D^k × D^(n−k))) the *attaching region*, ∂D^k × 0 (or its image) the *attaching sphere* and 0 × ∂D^(n−k) the *belt sphere*. … The number k is called the *index* of the handle." (Printed p. 99.)

The attaching data are reduced (printed p. 100) to two pieces:

> 1. an embedding φ₀ : S^(k−1) → ∂X (a *knot* in ∂X) with trivial normal bundle, and
> 2. a *(normal) framing* f of φ₀(S^(k−1)), or identification of the normal bundle νφ₀(S^(k−1)) with S^(k−1) × ℝ^(n−k).

with "the diffeomorphism type of X ∪_φ h depends only on the isotopy class of (φ₀, f)." (Printed p. 100.) Isotopy classes of framings of S^(k−1) in ∂X^n (fixed at a basepoint) are in bijection with π_(k−1)(GL(n−k)) ≅ π_(k−1)(O(n−k)); in general the framings form a torsor (free transitive action) under π_(k−1)(O(n−k)) rather than a group (printed p. 101).

### Handle decompositions

> **Definition 4.2.1.** Let X be a compact n-manifold with boundary ∂X decomposed as a disjoint union ∂₊X ∐ ∂₋X of two compact submanifolds (either of which may be empty). … A *handle decomposition* of X (relative to ∂₋X) is an identification of X with a manifold obtained from I × ∂₋X by attaching handles, such that ∂₋X corresponds to {0} × ∂₋X in the obvious way. A manifold X with a given handle decomposition is called a *relative handlebody* built on ∂₋X, or if ∂₋X = ∅ it is called a *handlebody*.

(Printed p. 104.)

Existence and the dimension-4 subtlety (printed pp. 104–105, summarised, with the quoted criterion):

> … if n = 4, then (X, ∂₋X) admits a topological handle decomposition if and only if X is smoothable, since the attaching maps can always be smoothed by an isotopy.

(Printed p. 105.) Every smooth compact manifold pair admits a handle decomposition by Morse theory; Freedman's closed 4-manifold with intersection form E₈ admits no handle decomposition.

### Kirby diagrams (description of 4-manifolds)

> A *Kirby diagram* is a description of a 4-dimensional (relative) handlebody by a diagram in ℝ³.

(Printed p. 115.) For closed X (∂₋X = ∅): a unique 0-handle D⁴ with boundary S³ = ℝ³ ∪ {∞}; each 1-handle is drawn as a pair of round balls (its attaching region D³ ∐ D³); 2-handles are attached along framed knots/links in ∂X₁. The union of 0- and 1-handles is ♮n S¹ × D³, with boundary #n S¹ × S² (printed pp. 115–116). For ∂₊X = ∅ the 3- and 4-handles can be attached canonically, so "the complexity of a 4-dimensional handlebody is mainly due to the 2-handles." (Printed p. 116.)

### Linking number and framing coefficient

> **Definition 4.5.1.** For K₁, K₂ and μ as above, K₂ represents the class n[μ] ∈ H₁(S³ − K₁; ℤ) for a unique n ∈ ℤ. We define the *linking number* ℓk(K₁, K₂) to be n.

(Printed p. 122; μ is the canonically oriented meridian of K₁.)

> **Proposition 4.5.2.** For K₁ and K₂ (as above) given by a link diagram, ℓk(K₁, K₂) equals the signed number of times that K₂ crosses underneath K₁. (That is, it is the number of positive undercrossings minus the number of negative undercrossings.)

(Printed p. 122.) Symmetric: ℓk(K₁,K₂) = ℓk(K₂,K₁) (Corollary 4.5.3). A third characterization: ℓk(K₁,K₂) = F · K₂ for a Seifert surface F of K₁ (Proposition 4.5.5, printed p. 123).

> **Definition 4.5.7.** For a framed knot (K, v) in the boundary of a 0-handle, we define the *framing coefficient* to be the integer ℓk(K, K′), where K′ is a parallel copy of K determined by v as in Section 4.4, and the orientations of K and K′ are chosen to be parallel.

(Printed p. 123.) This sets up "the promised canonical correspondence between integers and ways of attaching a 2-handle to D⁴ along K." (Printed p. 124.)

> **Proposition 4.5.8.** The framing coefficient of the blackboard framing on a knot K (given by a diagram) equals the writhe w(K), the signed number of self-crossings of K. The 0-framing is obtained from the outward normal to any orientable Seifert surface.

(Printed p. 124.)

> **Definition 4.5.10.** Let L be an ordered, oriented framed link in S³ (or ℝ³), with components K₁, …, K_m. The *linking matrix* of L is the symmetric m × m matrix [a_ij], where a_ij = ℓk(K_i, K_j) for i ≠ j and a_ii is the framing coefficient of K_i.

(Printed pp. 124–125.)

> **Proposition 4.5.11.** Let X be a connected handlebody without 1- or 3-handles, described by an ordered, oriented, framed link L. Then the matrix of Q_X with respect to the canonical ordered basis α₁, …, α_m (described above) is given by the linking matrix of L. In short, the intersection form of a 2-handlebody equals its linking pairing.

(Printed p. 125.)

### Surgery

> **Definition 5.2.1.** Let φ : S^k → M^n (−1 ≤ k ≤ n) be an embedding of a k-sphere in an n-manifold, with a (normal) framing f on φ(S^k) (which we assume lies in int M). Then the pair (φ, f) determines an embedding φ̂ : S^k × D^(n−k) → M (uniquely up to isotopy), and *surgery* on (φ, f) is the procedure of removing φ̂(S^k × int D^(n−k)) and replacing it by D^(k+1) × S^(n−k−1), with gluing map φ̂|S^k × S^(n−k−1).

(Printed p. 154.) Relations (printed p. 154, summarised): attaching a handle to (X, ∂₋X) has the effect of surgery on ∂₊X; any surgery on a closed M is realized as ∂₊(I × M ∪ h); closed manifolds M₁, M₂ are related by a sequence of surgeries iff they are cobordant; surgery on φ : S^k → M^n can be interpreted as attaching a (k+1)-handle and an n-handle. Surgering the resulting framed S^(n−k−1) recovers M ("reversing the surgery").

### Dehn surgery (surgery on 3-manifolds)

> **Definition 5.3.1.** Let K be a knot in an oriented 3-manifold, with a closed tubular neighborhood νK ≈ S¹ × D². A *Dehn surgery* on K is the operation of removing int νK and gluing in S¹ × D² by any diffeomorphism φ of the boundary tori.

(Printed p. 157.) The slope/coefficient convention (printed p. 157, quoted in part):

> … We let λ ∈ H₁(∂νK; ℤ) be a *longitude* given by some parallel copy of K. If M = S³, we define λ using the 0-framing. … Then (μ, λ) is an oriented basis for H₁(∂νK; ℤ), and α = pμ + qλ for unique relatively prime integers p and q. … we lose no information by taking the quotient p/q, and we call this a Dehn surgery with *coefficient* (or *slope*) p/q ∈ ℚ ∪ {∞}.

> Note that a Dehn surgery with coefficient ∞ is trivial. For a standard surgery on S³ (arising as the boundary of a 2-handlebody as in Section 5.2), α is the parallel copy of K determined by the framing, which can be any class with q = ±1. Thus, standard surgeries correspond to Dehn surgeries with integer coefficients, and the surgery coefficient equals the framing coefficient.

(Printed p. 157.) Lens space L(p,q) is −(p/q)-surgery on the unknot; L(p,1) bounds the disk bundle over S² with Euler number −p; L(0,1) = S² × S¹, L(±1,1) = S³ (Example 5.3.2, printed p. 158).

> **Theorem 5.3.4.** ([R1]) Any closed, oriented 3-manifold M bounds a compact, oriented 4-manifold X.

(Printed p. 159; due to Rohlin.)

> **Corollary 5.3.5.** Any closed, oriented, connected 3-manifold M is realized by integral surgery on a link L in S³.

(Printed p. 159.) Proof: write M = ∂X, decompose X as a handlebody, eliminate 1- and 3-handles so M bounds a 2-handlebody. (The framing coefficients can also be taken even; see Theorem 5.7.14.)

> **Theorem 5.3.6.** Let L and L′ be two framed links in S³ describing (orientation-preserving) diffeomorphic 3-manifolds (by integral surgery). Then L can be transformed into L′ by blowing up and down (and isotopy). In fact, any preassigned orientation-preserving diffeomorphism can be realized in this manner.

(Printed p. 160; Kirby's theorem [K1], augmented by Fenn–Rourke [FR]. Kirby's original version allows handle slides as well; Fenn–Rourke eliminated the handle slides.)

## Notes

- This PDF is a scanned/OCR-free image (originally a .djvu); pdftotext returns no text. All quotations were read directly from the rendered page images, so an [?] would mark any character I could not resolve, none were needed for the statements above.
- Slope/orientation conventions worth carrying into Lean formalisation: μ is the meridian oriented by the right-hand rule so the meridian disk meets K with positive sign (Figure 4.27, printed p. 122); on S³ the longitude λ is fixed by the 0-framing; the basis (μ, λ) gives α = pμ + qλ and slope p/q. The Dehn-surgery coefficient for q = ±1 coincides with the framing coefficient = ℓk(K, K′) of the parallel copy. Lens space sign convention: L(p,q) is −(p/q)-surgery on the unknot (printed p. 158).
- "Linking number = signed undercrossings" (Prop 4.5.2) and "framing coefficient of blackboard framing = writhe" (Prop 4.5.8) are the diagrammatic computations; the homological definition is Def 4.5.1.
- The framing torsor fact (isotopy classes of framings of S^(k−1) form a torsor under π_(k−1)(O(n−k)), printed p. 101) is the precise statement behind "framings need not have a canonical zero" unless a basepoint framing f₀ is chosen.
- For 3-manifold surgery moves the book also references Rolfsen [Ro]; the nonorientable analogue of Kirby's theorem replaces S³ by the twisted S²-bundle over S¹ (printed p. 160).
