# Fair-use extract: Lickorish, An Introduction to Knot Theory: the Kauffman bracket and the Jones polynomial

**Source.** W. B. R. Lickorish, An Introduction to Knot Theory, Springer GTM 175, 1997.
**Locus.** Chapter 3, "The Jones Polynomial", Definition 3.1 (Kauffman bracket, printed pp. 23–24), Definition 3.4 (writhe, printed p. 25), Theorem 3.5 and Definition 3.6 (Jones polynomial, printed pp. 26–27; PDF pp. 33–37).
**Supports.** GeometricTopology roadmap, layer 4 (the Kauffman bracket as a regular-isotopy invariant and its writhe-normalisation to the ambient-isotopy Jones polynomial).

*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

## Summary

Lickorish builds the Jones polynomial from the Kauffman bracket. The bracket `⟨D⟩ ∈ ℤ[A⁻¹, A]` is defined on unoriented link diagrams by three rules (Definition 3.1, printed pp. 23–24): it sends the crossingless unknot to 1, multiplies by `(−A⁻² − A²)` for each extra disjoint crossingless circle, and resolves each crossing as an `A`-smoothing plus an `A⁻¹`-smoothing. Expanding all `n` crossings gives a sum over `2ⁿ` crossingless diagrams, and the order of resolution does not matter.

The bracket is invariant under orientation-preserving homeomorphisms of the plane, and under Type II and Type III Reidemeister moves (Lemma 3.3, printed pp. 25–26), so it is a *regular-isotopy* invariant. It changes by a factor `−A⁻³` or `−A³` under a Type I move (Lemma 3.2, printed p. 24). The writhe `w(D)`, the sum of crossing signs of an oriented diagram (Definition 3.4, printed p. 25), changes by `±1` under Type I and is unchanged under Types II/III. Combining the two, the expression `(−A)⁻³ʷ⁽ᴰ⁾⟨D⟩` is an invariant of the oriented link (Theorem 3.5, printed p. 26). Substituting `A = t⁻¹ᐟ⁴` yields the Jones polynomial `V(L) ∈ ℤ[t⁻¹ᐟ², t¹ᐟ²]` (Definition 3.6, printed p. 27), normalised so that `V(unknot) = 1`.

Lickorish also gives the skein relation for `V` (Proposition 3.7) and notes the Jones polynomial is independent of the knot's orientation and depends on link-component orientations only through a `t⁻³ˡᵏ` factor.

## Key statements (quoted)

The Kauffman bracket (Definition 3.1, printed pp. 23–24; OCR renders the smoothing pictures in rule (iii) as plain symbols):

> Definition 3.1. The Kauffman bracket is a function from unoriented link diagrams in the oriented plane (or, better, in S²) to Laurent polynomials with integer coefficients in an indeterminate A. It maps a diagram D to ⟨D⟩ ∈ ℤ[A⁻¹, A] and is characterised by
> (i) ⟨○⟩ = 1,
> (ii) ⟨D ⊔ ○⟩ = (−A⁻² − A²)⟨D⟩,
> (iii) ⟨⤬⟩ = A⟨)(⟩ + A⁻¹⟨≍⟩.

(In (iii) the three diagrams "are exactly the same except near a point where they differ in the way indicated"; `⟨)(⟩` and `⟨≍⟩` denote the two crossingless smoothings of the crossing `⤬`.)

Invariance under Types II and III (Lemma 3.3, printed pp. 25–26):

> Lemma 3.3. If a diagram D is changed by a Type II or Type III Reidemeister move, then ⟨D⟩ does not change. … Hence ⟨D⟩ is invariant under regular isotopy of D.

The writhe (Definition 3.4, printed p. 25):

> Definition 3.4. The writhe w(D) of a diagram D of an oriented link is the sum of the signs of the crossings of D, where each crossing has sign +1 or −1 as defined (by convention) in Figure 1.11.

Existence of the Jones invariant (Theorem 3.5, printed p. 26):

> Theorem 3.5. Let D be a diagram of an oriented link L. Then the expression
> (−A)⁻³ʷ⁽ᴰ⁾⟨D⟩
> is an invariant of the oriented link L.

The Jones polynomial (Definition 3.6, printed p. 27):

> Definition 3.6. The Jones polynomial V(L) of an oriented link L is the Laurent polynomial in t¹ᐟ², with integer coefficients, defined by
> V(L) = ((−A)⁻³ʷ⁽ᴰ⁾⟨D⟩) |_{t¹ᐟ² = A⁻²} ∈ ℤ[t⁻¹ᐟ², t¹ᐟ²],
> where D is any oriented diagram for L.

(Lickorish writes the substitution as evaluating the regular-isotopy invariant at `A⁻² = t¹ᐟ²`, i.e. `A = t⁻¹ᐟ⁴`. He notes immediately that `V(unknot) = 1`.)

## Notes

- The suggested locus is partly right and partly off. The Kauffman bracket and Jones polynomial are both in **Chapter 3** (printed pp. 23–30), not split across Chapters 3 and 5. **Chapter 5** ("The Jones Polynomial of an Alternating Link", printed pp. 41–48) is a later application (the Kauffman–Murasugi–Thistlethwaite results on alternating diagrams), not the definition. The Reidemeister-invariance machinery the bracket uses is Chapter 1.
- Type I behaviour is Lemma 3.2 (printed p. 24): a Type I move multiplies the bracket by `−A³` or `−A⁻³`. This is the obstruction that the writhe normalisation in Theorem 3.5 corrects.
- The crossing-sign convention used in `w(D)` is fixed in Figure 1.11 (Chapter 1); the bracket smoothing pictures are Figure-based and have been transcribed as `)( ` and `≍` here.
- The Jones skein relation `t⁻¹ V(L₊) − t V(L₋) = (t¹ᐟ² − t⁻¹ᐟ²) V(L₀)` is Proposition 3.7 (printed p. 28, referencing Figure 3.2); it is the oriented-link analogue of the bracket rule (iii).
- OCR note: rule (iii)'s smoothing diagrams and the various worked-example pictures are images; I have transcribed the bracket arguments with text symbols and flagged none as uncertain since the algebraic content (coefficients `A`, `A⁻¹`) is unambiguous in the source text.
