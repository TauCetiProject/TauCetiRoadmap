# Fair-use extract: Lickorish, An Introduction to Knot Theory: slice knots, signatures, and knot cobordism (concordance)

**Source.** W. B. R. Lickorish, An Introduction to Knot Theory, Springer GTM 175, 1997.
**Locus.** Chapter 8, "The Conway Polynomial, Signatures and Slice Knots": Definition 8.8 (ω-signature, printed p. 84), Definition 8.11 (slice knot, printed p. 86), Theorems 8.18 and 8.19 (necessary conditions for sliceness, printed pp. 89–90), and Chapter 8 Exercise 7 (cobordant knots, printed p. 92; PDF pp. 94, 96, 99–100, 102).
**Supports.** GeometricTopology roadmap, layers 4 and 6 (slice/cobordant knots in `B⁴`, the link signature, and the signature/Alexander-polynomial obstructions to sliceness).

*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

## Summary

Chapter 8 introduces the signature and slice knots. The *ω-signature* `σ_ω(L)` of an oriented link, for a unit-modulus complex `ω ≠ 1`, is the signature of the Hermitian matrix `(1 − ω)A + (1 − ω̄)Aᵀ` built from a Seifert matrix `A` (Definition 8.8, printed p. 84); it is a well-defined invariant (Theorem 8.9). The case `σ₋₁(L)` is "the signature of `L`" (printed p. 85). A *slice knot* is one bounding a flat disc in the 4-ball `B⁴` (Definition 8.11, printed p. 86). Lickorish derives, via the Seifert form of a Seifert surface and the geometry of `B⁴` (Lemmas 8.12–8.15, Proposition 8.17), two classical obstructions: the Conway-normalised Alexander polynomial of a slice knot factors as `f(t)f(t⁻¹)` (Theorem 8.18, printed pp. 89–90), and the signature (and every `σ_ω` away from zeros of `Δ`) of a slice knot vanishes (Theorem 8.19, printed p. 90).

The *cobordism* (= concordance) relation between knots is given in Chapter 8 Exercise 7 (printed p. 92): `K₀` and `K₁` are cobordant if there is a PL embedding of `(S¹ × D²) × [0,1]` in `S³ × [0,1]` restricting to the two knots on the two ends; the exercise asks the reader to prove cobordant knots have equal signatures.

## Key statements (quoted)

The ω-signature (Definition 8.8, printed p. 84):

> Definition 8.8. Let L be an oriented link in S³ and let ω be a unit modulus complex number, ω ≠ 1. The ω-signature σ_ω(L) of L is defined to be the signature of the Hermitian matrix
> (1 − ω)A + (1 − ω̄)Aᵀ,
> where A is a Seifert matrix for L.

The signature as an invariant, and the special case (printed pp. 84–85):

> Theorem 8.9. The ω-signature σ_ω(L) is well defined as an invariant of L.

> Sometimes σ₋₁(L) is called the signature of L.

Slice knot (Definition 8.11, printed p. 86):

> Definition 8.11. A knot K ⊂ S³ is a slice knot if there is a flat disc D contained in B⁴ such that K = ∂D = D ∩ S³. Such a disc is called a slicing disc for K.

> Here "flat" means that D has a neighbourhood N that is a copy of D × I² meeting S³ in ∂D × I² (of course, I² = I × I, and this is just another disc).

Alexander-polynomial obstruction (Theorem 8.18, printed pp. 89–90):

> Theorem 8.18. If K is a slice knot, then the Conway-normalised Alexander polynomial of K is of the form f(t)f(t⁻¹), where f is a polynomial with integer coefficients.

Signature obstruction (Theorem 8.19, printed p. 90):

> Theorem 8.19. If K is a slice knot, then the signature of K is zero and, if the unit complex number ω is not a zero of the Alexander polynomial, then σ_ω(K) = 0.

Cobordant (concordant) knots (Chapter 8, Exercise 7, printed p. 92):

> 7. Two knots K₀ and K₁ are said to be cobordant if there is a (piecewise linear) embedding
> e : (S¹ × D²) × [0, 1] → S³ × [0, 1] so that e⁻¹(S³ × {i}) = (S¹ × D²) × {i} for i = 0, 1 and e((S¹ × 0) × {i}) = Kᵢ for i = 0, 1. Prove that cobordant knots have the same signatures.

## Notes

- **Terminology correction.** Lickorish does **not** use the word "concordance", and he does **not** construct a "concordance group". The relevant chapter is **Chapter 8** ("The Conway Polynomial, Signatures and Slice Knots", printed pp. 79–92), as suggested. The concordance relation appears under the name **cobordant** (Chapter 8, Exercise 7, printed p. 92, and again referenced in Chapter 10, Exercise 3, printed p. 108). The only occurrence of the literal word "concordance" in the book is in a bibliography entry. So for the roadmap target "concordance group", the corresponding Lickorish material is the *cobordism relation* of Exercise 7 plus the slice/signature theory of Chapter 8; the group structure itself is not developed here.
- The "signature" (`σ₋₁`) and the more general `σ_ω` (Tristram–Levine signatures) are both cobordism/concordance invariants in Lickorish's treatment: Exercise 7 has the reader prove invariance of the signature under cobordism, which is exactly the statement that the signature descends to the concordance group.
- A knot summed with the reverse of its reflection is slice (printed p. 86), the standard fact that `K # −K^r` bounds a slice disc, i.e. is null-concordant.
- The "slice knots are ribbon knots" conjecture is mentioned (printed pp. 86–87) but not resolved.
- Worked obstruction example: `4₁` has zero signature but determinant 5, so by Theorem 8.18 it is not slice (printed p. 90). The Kinoshita–Terasaka knot is slice; the slice status of the Conway knot is noted as unknown at time of writing (printed p. 90, this was later resolved, in 2020, by Lisa Piccirillo, after the book).
- OCR notes: `ω̄` (the complex conjugate of `ω`) is rendered in the source's display as the bar over the second `ω`; the Hermitian matrix is `(1 − ω)A + (1 − ω̄)Aᵀ`, equivalently `−(1 − ω)(ω̄A − Aᵀ)` as Lickorish remarks. The 4-ball genus inequality `|u(K)| ≥ 2g*(K)`... (actually `2g*(K) ≤ ...`) appears as Exercise 10 (printed p. 92); the printed exercise reads "lu(K)l ≥ 2g*(K)" in OCR, which should be read with the standard convention `g*(K) ≤ u(K)`.
