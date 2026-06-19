# Fair-use extract: Thurston, Three-Dimensional Geometry and Topology: hyperbolic and geometric structures

**Source.** W. Thurston, Three-Dimensional Geometry and Topology, Vol. 1 (ed. S. Levy), Princeton University Press, 1997.

**Locus.**
- Pseudogroup / G-manifold: Definitions 3.1.1 and 3.1.2, §3.1 "Basic Definitions", printed pp. 110 (physical djvu pp. 119).
- (G,X)-manifold / geometric structure: §3.3 "Geometric Structures on Manifolds", printed p. 125; the (G,X)-manifold definition is the unnumbered paragraph on printed p. 125, with the hyperbolic case stated in Example 3.3.6, printed p. 127 (physical djvu pp. 134, 136).
- Developing map and completeness: Definition 3.4.2 and the completeness definition, §3.4 "The Developing Map and Completeness", printed pp. 140, 142; Proposition 3.4.15 (meanings of completeness), printed pp. 145–146 (physical djvu pp. 149, 151, 154–155).
- Hyperbolic space ℍⁿ: §2.3 "The Hyperboloid Model and the Klein Model", printed pp. 64–67 (physical djvu pp. 73–76).
- Offset: printed page p = physical djvu page (p + 9).

**Supports.** GeometricTopology roadmap, layers 7 and 8 (hyperbolic and geometric structures).

*(Short attributed quotations of the essential definitions, with surrounding material summarised, for scholarly reference.)*

## Summary

Thurston builds geometric structures in three steps. First (§3.1), a *pseudogroup* on a topological space packages the allowed local model-preserving maps; a *G-manifold* is then a topological space with a maximal atlas whose transition maps all lie in the pseudogroup G. Different pseudogroups recover different "flavours" of manifold: Top gives topological manifolds, Cʳ gives differentiable manifolds, and so on (Example 3.1.3).

Second (§3.3), the definition is broadened so that G may be a pseudogroup on any connected manifold X (not just ℝⁿ). The central case is when G comes from a group of analytic diffeomorphisms acting **transitively** on X: then a G-manifold is called a **(G,X)-manifold**. Specialising (G,X) recovers the geometric structures: (Isom(𝐄ⁿ), 𝐄ⁿ) gives Euclidean/flat manifolds (Example 3.3.2), (O(n+1), Sⁿ) gives spherical/elliptic manifolds (Example 3.3.5), and **(Isom(ℍⁿ), ℍⁿ) gives hyperbolic manifolds** (Example 3.3.6).

Third (§3.4), the *developing map* D : M̃ → X (analytic continuation of a chart over the universal cover) and its associated *holonomy* homomorphism H : π₁(M) → G are defined. M is a **complete (G,X)-manifold** when D is a covering map; if additionally X is simply connected then D identifies M̃ with X and M = X/Γ for the holonomy group Γ (Proposition 3.4.5). For the metric coming from a G-invariant Riemannian metric (Lemma 3.4.11), completeness of the (G,X)-structure coincides with metric completeness (Proposition 3.4.15).

Hyperbolic space ℍⁿ itself is defined in §2.3 (hyperboloid model): it is the upper sheet of the "sphere of radius i" in Lorentz space 𝐄ⁿ¹, i.e. one component of {Q⁻ = −1} where Q⁻(x) = −x₀² + x₁² + ⋯ + xₙ², equipped with the Riemannian metric induced by the indefinite form ds² = −dx₀² + dx₁² + ⋯ + dxₙ². This is a complete simply connected Riemannian manifold of **constant curvature −1**, with isometry group O(n,1). Hence a *hyperbolic structure* on a manifold M (in the sense relevant to the roadmap, namely complete and of constant curvature −1) is exactly a complete (Isom(ℍⁿ), ℍⁿ)-structure, which by Proposition 3.4.5 presents M as a quotient ℍⁿ/Γ by a discrete torsion-free group Γ of isometries.

**Deeper input (companion extract).** Thurston's Vol. 1 develops the definitions and existence techniques (gluing ideal polyhedra; Examples 3.3.7, 3.3.9, 3.3.10 for knot/link complements) but does not prove Mostow rigidity. Mostow–Prasad rigidity, which for n ≥ 3 makes a complete finite-volume hyperbolic structure unique up to isometry, and therefore makes **hyperbolic volume a topological invariant** (well defined), is the deeper input. See the planned Ratcliffe extract (Ratcliffe, *Foundations of Hyperbolic Manifolds*) for the rigidity statement and the well-definedness of volume.

## Key statements (quoted)

### Pseudogroup (Definition 3.1.1, printed p. 110)

> **Definition 3.1.1 (pseudogroup).** A *pseudogroup* on a topological space X is a set 𝒢 of homeomorphisms between open sets of X satisfying the following conditions:
>
> (a) The domains of the elements g ∈ 𝒢 cover X.
>
> (b) The restriction of an element g ∈ 𝒢 to any open set contained in its domain is also in 𝒢.
>
> (c) The composition g₁ ∘ g₂ of two elements of 𝒢, when defined, is in 𝒢.
>
> (d) The inverse of an element of 𝒢 is in 𝒢.
>
> (e) The property of being in 𝒢 is *local*, that is, if g : U → V is a homeomorphism between open sets of X and U is covered by open sets U_α such that each restriction g|_{U_α} is in 𝒢, then g ∈ 𝒢.

The text adds (printed p. 110): "the largest pseudogroup on ℝⁿ is the pseudogroup Top of all homeomorphisms between open subsets of ℝⁿ. A *topological manifold* is one for which the gluing homeomorphisms are in Top".

### G-manifold (Definition 3.1.2, printed pp. 110–111)

> **Definition 3.1.2 (𝒢-manifold).** Let 𝒢 be a pseudogroup on ℝⁿ. An n-dimensional 𝒢-*manifold* is a topological space M with a 𝒢-*atlas* on it. A 𝒢-atlas is a collection of 𝒢-*compatible coordinate charts* whose domains cover M. A coordinate chart, or *local coordinate system*, is a pair (Uᵢ, φᵢ), where Uᵢ is open in M and φᵢ : Uᵢ → ℝⁿ is a homeomorphism onto its image. Compatibility means that, whenever two charts (Uᵢ, φᵢ) and (Uⱼ, φⱼ) intersect, the *transition map* or *coordinate change*
>
> γᵢⱼ = φᵢ ∘ φⱼ⁻¹ : φⱼ(Uᵢ ∩ Uⱼ) → φᵢ(Uᵢ ∩ Uⱼ)
>
> is in 𝒢.

### (G,X)-manifold / geometric structure (§3.3, printed p. 125)

The numbered Definition 3.1.2 is broadened in §3.3. The defining passage (unnumbered, printed p. 125) reads:

> It is convenient to broaden slightly the definition of a 𝒢-manifold (3.1.2), by allowing 𝒢 to be a pseudogroup on any connected manifold X, not just on ℝⁿ. As long as 𝒢 acts transitively, this does not give any new types of manifolds:

> Many important pseudogroups come from group actions on manifolds. Given a group G acting on a manifold X, let 𝒢 be the pseudogroup generated by restrictions of elements of G: see Exercise 3.1.8(a). Thus every g ∈ 𝒢 agrees locally with elements of G: the domain of g can be covered with open sets U_α such that g|_{U_α} = g_α|_{U_α} for g_α ∈ G. A 𝒢-manifold is also called a (G, X)-*manifold*.

### Hyperbolic manifolds (Example 3.3.6, printed p. 127)

> **Example 3.3.6 (hyperbolic manifolds).** If G is the group of isometries of hyperbolic space 𝐇ⁿ, a (G, 𝐇ⁿ)-manifold is a *hyperbolic manifold*. We discussed hyperbolic surfaces in Section 1.2 and a three-dimensional example, the Seifert–Weber dodecahedral space, in Example 1.4.5.

(For comparison, Example 3.3.2: "If G is the group of isometries of Euclidean space 𝐄ⁿ, a (G, 𝐄ⁿ)-manifold is called a *Euclidean*, or *flat*, manifold"; Example 3.3.5: "If G is the orthogonal group O(n+1) acting on the sphere Sⁿ, a (G, Sⁿ)-manifold is called *spherical*, or *elliptic*.")

### Developing map (Definition 3.4.2, printed p. 140)

> **Definition 3.4.2 (developing map).** For a fixed basepoint and initial chart φ₀, the *developing map* of a (G, X)-manifold M is the map D : M̃ → X that agrees with the analytic continuation of φ₀ along each path, in a neighborhood of the path's endpoint. In symbols,
>
> D = φ₀^σ ∘ π
>
> in a neighborhood of σ ∈ M̃. If we change the initial data (the basepoint and the initial chart), the developing map changes by composition in the range with an element of G (Exercise 3.4.1).

### Completeness (definition, printed p. 142)

> In general, the holonomy of M need not determine the (G, X)-structure on M, but there is an important special case in which it does. We say that M is a *complete* (G, X)-*manifold* if D : M̃ → X is a covering map. Since a covering of a simply connected space is a homeomorphism, we see that if M is complete and X is simply connected, we can identify M̃ with X by the developing map, and often will do so tacitly.

> **Proposition 3.4.5 (holonomy group characterizes manifold).** If G is a group of analytic diffeomorphisms of a simply connected space X, any complete (G, X)-manifold may be reconstructed from its holonomy group Γ, as the quotient space X/Γ.

### Meanings of completeness (Proposition 3.4.15, printed pp. 145–146)

> **Proposition 3.4.15 (meanings of completeness).** Let G be a transitive group of real analytic diffeomorphisms of X with compact stabilizers G_x, fix a G-invariant metric on X (whose existence is guaranteed by Lemma 3.4.11), and let M be a (G, X)-manifold with the metric inherited from X. The following conditions are equivalent:
>
> (a) M is a complete (G, X)-manifold.
>
> (b) For some ε > 0, every closed ε-ball in M is compact.
>
> (c) For every a > 0, every closed a-ball in M is compact.
>
> (d) There is some family of compact subsets S_t of M, for t ∈ ℝ₊, such that ⋃_{t∈ℝ₊} S_t = M and S_{t+a} contains the neighborhood of radius a about S_t.
>
> (e) M is complete as a metric space.

### Hyperbolic space ℍⁿ: the hyperboloid model (§2.3, printed pp. 64–65)

The section opens (printed p. 64):

> A sphere in Euclidean space with radius r has constant curvature 1/r². By analogy, since hyperbolic space has constant curvature −1, hyperbolic space should be a sphere of radius i = √−1.

The construction proper (printed p. 64), starting from the indefinite metric labelled equation 2.3.1:

> **2.3.1.**   ds² = −dx₀² + dx₁² + ⋯ + dxₙ²
>
> in ℝⁿ⁺¹ associated to the quadratic form Q⁻(x) = −x₀² + x₁² + ⋯ + xₙ². With this metric, ℝⁿ⁺¹ is often referred to as *Lorentz space*, and denoted 𝐄ⁿ¹.

> The sphere of radius i about the origin in 𝐄ⁿ¹ is the hyperboloid H = {Q⁻ = −1}. When restricted to this hyperboloid, the indefinite metric ds² of equation 2.3.1 becomes a *bona fide*, positive definite Riemannian metric: it is easy to check that any tangent vector to the hyperboloid has real length. Topologically, H is the union of two open disks.

> [...] this subset of 𝐑𝐏ⁿ can be modeled by one component of the hyperboloid, say, the upper sheet H⁺, where x₀ > 0. This is the *hyperboloid model* of hyperbolic space.

Isometry group (printed p. 66):

> Just as the group of isometries of S is identical with O(n + 1), the group of orthogonal transformations of 𝐄ⁿ⁺¹, so also the group of isometries of H is O(n, 1), the group of orthogonal transformations of 𝐄ⁿ¹.

That the Klein and hyperboloid models genuinely model hyperbolic space (printed p. 67):

> Since the set of geodesics is sufficient to characterize hyperbolic geometry (problem 2.2.17), we conclude that K, and consequently also H⁺, are indeed legitimate models for 𝐇ⁿ.

## Notes

- **Unicode/OCR fidelity.** Thurston typesets the model spaces in boldface as 𝐑ⁿ, 𝐄ⁿ, 𝐇ⁿ, 𝐒ⁿ; here transcribed as ℝⁿ, 𝐄ⁿ, ℍⁿ/𝐇ⁿ, Sⁿ respectively (the book itself writes 𝐇ⁿ, not ℍⁿ, both denote hyperbolic n-space). The pseudogroup symbol is a script/calligraphic G, transcribed as 𝒢. "Lorentz space" is written 𝐄ⁿ¹ in the book (a superscript "n,1"); rendered here as 𝐄ⁿ¹.
- **Where the formal definitions live.** The Reader's Advisory (printed p. x, physical djvu p. 10) explicitly notes: "manifolds and geometric structures on manifolds are discussed intuitively in the first two chapters, even though the formal definition and basic properties are only presented in Chapter 3." So Chapter 1–2 treatments (hyperbolic surfaces §1.2, model spaces §2.x) are motivational; the load-bearing definitions for a roadmap are Definitions 3.1.1, 3.1.2, the (G,X)-manifold paragraph in §3.3, and Definition 3.4.2 with the completeness condition in §3.4.
- **"Complete, constant curvature −1."** The roadmap's notion of a hyperbolic structure (complete, constant curvature −1) is captured precisely by combining (i) Example 3.3.6 (the model is ℍⁿ with its isometry group, hence locally constant curvature −1 by §2.3) with (ii) the completeness condition of §3.4. For closed manifolds, Proposition 3.4.10 (compact stabilizers imply completeness, printed p. 144) makes every closed (G,X)-manifold automatically complete; for non-closed manifolds (e.g. cusped knot complements, Examples 3.3.7/3.3.9/3.3.10) completeness must be checked separately, see Examples 3.4.16 and 3.4.17, printed p. 147.
- **Quotient convention.** Thurston writes the quotient as X/Γ with Γ acting on the left, noting (Convention 3.4.6, printed p. 143) that Γ\X would be more correct but X/Γ is used "for esthetic reasons". A Lean formalisation should pin down the side convention.
- **Mostow rigidity is not in this volume.** Vol. 1 supplies the definitions and construction techniques but not the rigidity theorem. Well-definedness of hyperbolic volume as a topological invariant depends on Mostow–Prasad rigidity; defer to the Ratcliffe extract for that statement.
- **No corrections needed:** the quoted statements match the rendered pages.
