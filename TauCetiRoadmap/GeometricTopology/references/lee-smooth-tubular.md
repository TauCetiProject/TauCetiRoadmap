# Fair-use extract: Lee, Introduction to Smooth Manifolds: Tubular Neighborhood Theorem

**Source.** J. Lee, Introduction to Smooth Manifolds, 2nd ed., Springer GTM 218, 2013.
**Locus.** Theorem 6.24 (Tubular Neighborhood Theorem), printed p. 139.
**Supports.** GeometricTopology roadmap, layer 1 (tubular neighborhoods of embedded submanifolds; a foundational result for normal bundles and the smooth structure near a submanifold).

*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

## Summary

The theorem appears in Chapter 6 ("Sard's Theorem"), in the section on the Whitney Approximation Theorems, immediately after the construction of the normal bundle map. Lee works with an embedded submanifold M ⊆ ℝⁿ and its normal bundle NM, regarded as a submanifold of ℝⁿ × ℝⁿ. He defines the smooth "addition" map E : NM → ℝⁿ by E(x, v) = x + v, which sends each normal space NₓM affinely onto the affine subspace through x orthogonal to TₓM. A *tubular neighborhood* of M is then defined as a neighborhood U of M in ℝⁿ that is the diffeomorphic image under E of an open subset V ⊆ NM of the form V = {(x, v) ∈ NM : |v| < δ(x)} for some positive continuous function δ : M → ℝ.

The theorem asserts that every embedded submanifold of ℝⁿ admits such a tubular neighborhood. The proof shows E is a local diffeomorphism on a neighborhood of the zero section M₀ = {(x, 0) : x ∈ M} (via the inverse function theorem, using Tₓℝⁿ = TₓM ⊕ NₓM), then constructs the function δ so that E becomes a global diffeomorphism on the corresponding V. Lee notes a shorter proof is available later via Corollary 10.36.

## Key statements (quoted)

The definition of a tubular neighborhood:

> "A *tubular neighborhood of* M is a neighborhood U of M in ℝⁿ that is the diffeomorphic image under E of an open subset V ⊆ NM of the form
> V = {(x, v) ∈ NM : |v| < δ(x)}, (6.4)
> for some positive continuous function δ : M → ℝ (Fig. 6.6)." — Lee, p. 139.

The theorem itself:

> "Theorem 6.24 (Tubular Neighborhood Theorem). Every embedded submanifold of ℝⁿ has a tubular neighborhood." — Lee, Thm 6.24, p. 139.

Where the map E is defined (preceding the theorem):

> "Thinking of NM as a submanifold of ℝⁿ × ℝⁿ, we define E : NM → ℝⁿ by
> E(x, v) = x + v." — Lee, p. 139.

## Notes

- Suggested locator (≈Theorem 6.24) is correct: the result is Theorem 6.24, on printed page 139 (PDF page 154; printed page = PDF page − 15).
- This is the ℝⁿ-embedded version. Lee remarks "(We will be able to give a shorter proof of this theorem in Chapter 10; see Corollary 10.36.)", the intrinsic/Riemannian generalisation appears later in the book and in his Riemannian Manifolds text.
- The proof spans pp. 139–140; only the statement and surrounding definitions are quoted above.
