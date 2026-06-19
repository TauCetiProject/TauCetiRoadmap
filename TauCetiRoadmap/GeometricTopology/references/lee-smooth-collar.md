# Fair-use extract: Lee, Introduction to Smooth Manifolds: Collar Neighborhood Theorem

**Source.** J. Lee, Introduction to Smooth Manifolds, 2nd ed., Springer GTM 218, 2013.
**Locus.** Theorem 9.25 (Collar Neighborhood Theorem), printed p. 222.
**Supports.** GeometricTopology roadmap, layer 1 (collar neighborhoods of the boundary of a manifold with boundary; foundational for gluing, boundary normal forms, and the homotopy equivalence of a manifold with its interior).

*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

## Summary

The theorem appears in Chapter 9 ("Integral Curves and Flows"), in the section "Flows and Flowouts on Manifolds with Boundary". Lee first defines a *collar neighborhood* of ∂M as the image of a smooth embedding [0, 1) × ∂M → M that restricts to the obvious identification {0} × ∂M → ∂M.

The Collar Neighborhood Theorem states that every smooth manifold with nonempty boundary has a collar neighborhood of its boundary. The short proof derives it from the Boundary Flowout Theorem (Theorem 9.24): one takes a smooth vector field N that is inward-pointing along ∂M (existence from Problem 8-4), applies the flowout embedding Φ : 𝒫_δ → M, and reparametrises via the diffeomorphism (t, p) ↦ (t δ(p), p) to obtain a smooth embedding [0, 1) × ∂M → M with open image restricting to the identity on {0} × ∂M.

An immediate application (Theorem 9.26) is that every smooth manifold with boundary is homotopy equivalent to its interior.

## Key statements (quoted)

The definition of a collar neighborhood:

> "Let M be a smooth manifold with boundary. A neighborhood of ∂M is called a *collar neighborhood* if it is the image of a smooth embedding [0, 1) × ∂M → M that restricts to the obvious identification {0} × ∂M → ∂M. (See Fig. 9.9.)" — Lee, p. 222.

The theorem itself:

> "Theorem 9.25 (Collar Neighborhood Theorem). If M is a smooth manifold with nonempty boundary, then ∂M has a collar neighborhood." — Lee, Thm 9.25, p. 222.

The Boundary Flowout Theorem on which the proof relies:

> "Theorem 9.24 (Boundary Flowout Theorem). Let M be a smooth manifold with nonempty boundary, and let N be a smooth vector field on M that is inward-pointing at each point of ∂M. There exist a smooth function δ : ∂M → ℝ⁺ and a smooth embedding Φ : 𝒫_δ → M, where 𝒫_δ = {(t, p) : p ∈ ∂M, 0 ≤ t < δ(p)} ⊆ ℝ × ∂M, such that Φ(𝒫_δ) is a neighborhood of ∂M, and for each p ∈ ∂M the map t ↦ Φ(t, p) is an integral curve of N starting at p." — Lee, Thm 9.24, p. 222.

## Notes

- Suggested locator (≈Theorem 9.25) is correct: the result is Theorem 9.25, on printed page 222 (PDF page 237; printed page = PDF page − 15). The proof spills onto printed page 223.
- The statement is purely topological/smooth; no metric is involved. The proof uses an inward-pointing vector field and its flowout (Theorem 9.24, proved as Problem 9-11), with the existence of such a vector field coming from Problem 8-4.
- Theorem 9.26 (printed p. 223), an immediate corollary, gives a proper smooth embedding R : M → Int M making the inclusion Int M ↪ M a homotopy equivalence.
