# Fair-use extract: Lickorish, An Introduction to Knot Theory: braids, Alexander's theorem and Markov's theorem

**Source.** W. B. R. Lickorish, An Introduction to Knot Theory, Springer GTM 175, 1997.
**Locus.** Chapter 1, "A Beginning for Knot Theory", braids and the braid group (printed p. 10; PDF p. 20); and Chapter 16, "Exploring the HOMFLY and Kauffman Polynomials", Proposition 16.10 (the combined Alexander–Markov statement, printed p. 187; PDF p. 197).
**Supports.** GeometricTopology roadmap, layer 4 (braid presentation of links: every oriented link is a braid closure, and two braids have the same closure iff related by Markov moves).

*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

## Summary

Lickorish introduces braids informally at the end of Chapter 1 (printed p. 10). An `n`-string braid is `n` oriented arcs running monotonically left-to-right across a box, joining `n` fixed points on the left edge to `n` on the right; two braids are the same when ambient isotopic rel endpoints. The standard generators `σᵢ` (he writes `aᵢ`) and the product (stacking braids) make the `n`-string braids into the *braid group* `Bₙ` with the usual presentation. Joining each braid's right ends to its left ends produces the *closed braid* `b̂`, a link in `S³`. He states Alexander's result that every oriented link is the closure of some braid, and points forward to Chapter 16 for the Markov moves describing when two braids have the same closure.

The combined Alexander–Markov statement is given as **Proposition 16.10** in Chapter 16 (printed p. 187), in the discussion of the original braid-theoretic origins of the Jones polynomial. It packages Alexander's theorem (existence of a braid presentation) and Markov's theorem (the two moves, conjugation and stabilisation, together with inverses generate the equivalence of braids with equivalent closures).

## Key statements (quoted)

Braids and the braid group (Chapter 1, printed p. 10):

> A braid of n strings is n oriented arcs traversing a box steadily from the left to the right. The box will be depicted as a square or rectangle, and the arcs will join n standard fixed points on the left edge to n such points on the right edge. Over-passes are indicated in the usual way. The arcs are required to meet each vertical line that meets the rectangle in precisely n points (the arcs can never turn back in their progress from left to right). Two braids are the same if they are ambient isotopic (that is, the strings can be "moved" from one position to the other) while keeping their end points fixed.

> Given any braid b, its ends on the right edge may be joined to those on the left edge, in the standard way shown, to produce the closed braid b̂ that represents a link in S³. Any braid can be written as a product of the aᵢ and their inverses (aᵢ⁻¹ is aᵢ with the crossing switched), and it is a result discovered by J. W. Alexander that any oriented link is the closure of some braid for some n. There are moves (the Markov moves; see Chapter 16) that explain when two braids have the same closure.

The braid group `Bₙ` presentation (Chapter 1, printed p. 10; OCR-garbled, reconstructed below):

> The n-string braids form a group Bₙ with respect to the above product; it has a presentation
> ⟨a₁, a₂, …, aₙ₋₁ ; aᵢaⱼ = aⱼaᵢ if |i − j| ≥ 2, aᵢaᵢ₊₁aᵢ = aᵢ₊₁aᵢaᵢ₊₁⟩.

The combined Alexander–Markov statement (Proposition 16.10, Chapter 16, printed p. 187):

> Proposition 16.10. Any oriented link in S³ is the closure of some β belonging to the braid group Bₙ, for some n. Oriented links β̂ and β̂′ are equivalent if β and β′ differ by a sequence of (Markov) moves of the following two types and inverses of such moves:
> (i) Change an element of Bₙ to a conjugate element in that group;
> (ii) Change β ∈ Bₙ to iₙ(β)σₙ^{±1} ∈ Bₙ₊₁, where iₙ : Bₙ → Bₙ₊₁ is the inclusion (that disregards the (n + 1)th string).

(Lickorish's surrounding text: "Fundamental were the theorems of Alexander and Markov that, combined, constitute the following proposition. Modern proofs can be found in [7] and [98].")

## Notes

- **The suggested locus (Chapters 10–11) is wrong.** Lickorish has no dedicated braids chapter, and no chapters titled for braids or Markov. Braids are introduced in **Chapter 1** (printed p. 10), and the Alexander + Markov theorems appear, combined, as **Proposition 16.10** in **Chapter 16** ("Exploring the HOMFLY and Kauffman Polynomials", printed pp. 179–191). Chapter 10 is "The Arf Invariant and the Jones Polynomial" and Chapter 11 is "The Fundamental Group"; neither treats braids or Markov moves.
- Lickorish does not split Alexander's theorem and Markov's theorem into two separately numbered results; he gives them jointly as Proposition 16.10. The existence half (Alexander) is also stated, attributed to "J. W. Alexander", in the Chapter 1 prose quoted above.
- Notation: Lickorish writes the standard braid generators as `aᵢ`; in Proposition 16.10 he uses `σₙ` for the stabilising generator. The OCR rendered braid variables inconsistently (e.g. `ξ`, `Tj`, `β`); I have used `β`, `β̂` for a braid and its closure, matching the statement's structure. The Chapter 1 presentation relations were OCR-mangled (`= aᵢ₊₁aᵢaᵢ₊₁` survived as "= ai+₁aiai+₁") and are reconstructed in standard form above.
- Move (ii) is the *Markov stabilisation*; move (i) is *conjugation*. The braid index of a link is the minimal `n` for which it is an `n`-braid closure (printed p. 179, Chapter 16).
- Figure 1.9 (the generator `σᵢ` and the closure operation) is referenced but not reproduced.
