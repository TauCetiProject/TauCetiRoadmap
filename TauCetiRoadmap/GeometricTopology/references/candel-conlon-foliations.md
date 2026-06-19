# Fair-use extract: Candel–Conlon, Foliations: foliations, leaves, tautness
**Source.** A. Candel, L. Conlon, Foliations I (AMS GSM 23, 2000) and II (AMS GSM 60, 2003).
**Locus.**
- Foliated chart / foliated atlas / foliation / leaf: Definitions 1.1.16–1.1.20, Chapter 1 §1.1 ("What Is a Foliation?"), printed pp. 19–22; physical djvu pp. 34–37; Volume I.
- Integrable subbundle (distribution, involutive, completely integrable) and the Frobenius theorem: Definitions 1.3.2–1.3.6 and Theorem 1.3.8, Chapter 1 §1.3 ("The Frobenius Theorem"), printed pp. 36–37; physical djvu pp. 51–52; Volume I.
- Taut foliation (topological): Definition 6.3.3, Chapter 6 §6.3 ("Compact Leaves and Closed Transversals"), printed p. 146; physical djvu p. 161; Volume I.
- Geometrically taut foliation: Definition 10.5.1, Chapter 10 §10.5 ("Taut Foliations of Arbitrary Codimension"), printed p. 261; physical djvu p. 276; Volume I.
**Supports.** GeometricTopology roadmap, layer 10 (foliations and the Euler class).
*(Short attributed quotations of the essential definitions, surrounding material summarised, for scholarly reference.)*

## Summary

**Foliation via foliated charts (Vol. I, §1.1).** Candel and Conlon define a foliation by way of a *foliated atlas*. A foliated chart of codimension q on an n-manifold M is a pair (U, φ) with φ: U → B_τ × B_⋔ a diffeomorphism onto a product of rectangular neighborhoods (B_τ "tangential", dimension k = n − q; B_⋔ "transverse", dimension q ⊂ 𝔽^q). The slices P_y = φ⁻¹(B_τ × {y}) are the *plaques* and the slices S_x = φ⁻¹({x} × B_⋔) the *transversals*. A foliation (Definition 1.1.18) is then a decomposition 𝔉 = {L_λ} of M into connected, topologically immersed submanifolds of dimension k together with a foliated atlas whose plaques are compatibly arranged so that each L_λ ∩ U_α is a union of plaques. The L_λ are the *leaves*; (M, 𝔉) is a *foliated manifold*; the smoothness class C^r of the atlas is the class of 𝔉. The leaf through a point is recovered (Remark (2)) as the equivalence class under "connected by a finite chain of overlapping plaques." Manifolds with boundary and corners are allowed, with tangential boundary ∂_τ M (a union of leaves) and transverse boundary ∂_⋔ M; one requires 𝔉 either tangent or transverse to each boundary component (Definition 1.1.11, 1.1.20).

**Integrable subbundle / Frobenius (Vol. I, §1.3).** The second, equivalent viewpoint: a *k-plane distribution* E on a C^∞ manifold M is the total space of a C^∞ k-dimensional subbundle of the tangent bundle T(M) (Definition 1.3.2). E is *involutive* if Γ(E) is a Lie subalgebra of 𝔛(M) (Definition 1.3.3), and *completely integrable* if through each point there passes an integral manifold (Definitions 1.3.4–1.3.5). The Frobenius theorem (Theorem 1.3.8) lists five equivalent conditions, including involutivity, complete integrability, and the existence of a C^∞ foliated atlas of codimension q = n − k whose plaques are integral manifolds. Corollary 1.3.9 closes the loop: a k-plane distribution E is completely integrable iff E = T(𝔉) for a C^∞ foliation 𝔉 of codimension n − k. This is the "integrable subbundle of the tangent bundle" characterization.

**Taut foliation (Vol. I, §6.3).** Throughout §6.3, (M, 𝔉) is compact, connected, transversely-oriented, codimension one, with ∂_⋔ M = ∅. The *accessible set* A(L) of a leaf L is the set of points reachable from L by a nontrivial, positively-directed, 𝔉-transverse curve (Definition 6.3.1). A leaf meets a closed transversal iff L ⊂ A(L). Definition 6.3.3 declares 𝔉 *taut* if every leaf meets a closed transversal (with a boundary variant when ∂_τ M ≠ ∅). Corollary 6.3.4 reformulates tautness as the absence of a finite family of compact leaves cobounding a submanifold on their positive sides; Theorem 6.3.5 (Goodman) says in closed foliated 3-manifolds a leaf meeting no closed transversal is a torus, so absence of toral leaves forces tautness. The text immediately ties tautness to the Euler class e(𝔉) ∈ H²(M; ℝ) of the bundle T(𝔉) (the layer-10 connection). Definition 10.5.1 gives the alternative *geometric* tautness (existence of a Riemannian metric making every leaf a minimal submanifold), which Sullivan's theorem shows equivalent to the topological version in codimension one.

## Key statements (quoted)

Foliated chart and its plaques/transversals (printed pp. 19–20):

> "**Definition 1.1.17.** Let M be an n-manifold. A *foliated chart* on M of codimension q is a pair (U, φ), where U ⊆ M is open and φ: U → B_τ × B_⋔ is a diffeomorphism, B_⋔ being a rectangular neighborhood in 𝔽^q and B_τ a rectangular neighborhood in 𝔽^{n−q}. The set P_y = φ⁻¹(B_τ × {y}), where y ∈ B_⋔, is called a *plaque* of this foliated chart. For each x ∈ B_τ, the set S_x = φ⁻¹({x} × B_⋔) is called a *transversal* of the foliated chart. The set ∂_τ U = φ⁻¹(B_τ × (∂B_⋔)) is called the *tangential boundary* of U and ∂_⋔ U = φ⁻¹((∂B_τ) × B_⋔) is called the *transverse boundary* of U." — Candel–Conlon, Foliations I, Def. 1.1.17, pp. 19–20.

The definition of a foliation (printed pp. 20–21):

> "**Definition 1.1.18.** Let M be an n-manifold, possibly with boundary and corners, and let 𝔉 = {L_λ}_{λ∈𝔏} be a decomposition of M into connected, topologically immersed submanifolds of dimension k = n − q. Suppose that M admits an atlas {U_α, φ_α}_{α∈𝔄} of foliated charts of codimension q such that, for each α ∈ 𝔄 and each λ ∈ 𝔏, L_λ ∩ U_α is a union of plaques. Then 𝔉 is said to be a *foliation* of M of codimension q (and dimension k) and {U_α, φ_α}_{α∈𝔄} is called a *foliated atlas associated to 𝔉*. Each L_λ is called a *leaf* of the foliation and the pair (M, 𝔉) is called a *foliated manifold*. If the foliated atlas is of class C^r (0 ≤ r ≤ ∞ or r = ω), then the foliation 𝔉 and the foliated manifold (M, 𝔉) are said to be of class C^r." — Candel–Conlon, Foliations I, Def. 1.1.18, pp. 20–21.

The leaf as an equivalence class (printed p. 22, Remark (2) following Def. 1.1.18):

> "In the case of a foliation 𝔉, we can describe this equivalence relation as follows. Let {U_α, φ_α}_{α∈𝔄} be an associated foliated atlas. If x, y ∈ M, we write x ∼ y if and only if there is a finite sequence {P_{α_i} ⊂ U_{α_i}}_{i=0}^p of plaques such that x ∈ P_{α_0}, y ∈ P_{α_p}, and P_{α_{i−1}} ∩ P_{α_i} ≠ ∅, 1 ≤ i ≤ p. It is trivial that this is an equivalence relation on M. The fact that the equivalence classes are exactly the leaves of 𝔉 is left to the reader. ... Finally, if 𝔉 is of class C^r, each leaf is a C^r-immersed submanifold (Exercise 1.1.19)." — Candel–Conlon, Foliations I, p. 22.

Distribution / subbundle of the tangent bundle (printed p. 36):

> "**Definition 1.3.2.** A *k-plane distribution* E on the C^∞ manifold M is the total space of a C^∞, k-dimensional subbundle of the tangent bundle T(M)." — Candel–Conlon, Foliations I, Def. 1.3.2, p. 36.

> "**Definition 1.3.3.** A k-plane distribution E on M is *involutive* if the space Γ(E) of C^∞ sections of E is a Lie subalgebra of 𝔛(M)." — Candel–Conlon, Foliations I, Def. 1.3.3, p. 36.

> "**Definition 1.3.4.** Let E be a k-plane distribution on M, w ∈ M. An *integral manifold* to E through w is a smoothly immersed submanifold N of M of dimension k such that w ∈ N and E_x = T_x(N), ∀ x ∈ N." — Candel–Conlon, Foliations I, Def. 1.3.4, p. 36.

> "**Definition 1.3.5.** A k-plane distribution E on M is *completely integrable* if, through each point w ∈ M, there passes an integral manifold to E." — Candel–Conlon, Foliations I, Def. 1.3.5, p. 36.

The Frobenius theorem and its foliation/integrability equivalence (printed p. 37):

> "**Theorem 1.3.8** (Frobenius Theorem). For a k-plane distribution E on M, the following are equivalent:
>
>   1. E is completely integrable;
>   2. I*(E) is a differential graded ideal;
>   3. d(I¹(E)) ⊆ I²(E);
>   4. E is involutive;
>   5. there is a C^∞ foliated atlas on M of codimension q = n − k, every plaque of which is an integral manifold to E." — Candel–Conlon, Foliations I, Thm. 1.3.8, p. 37.

> "**Corollary 1.3.9.** The k-plane distribution on M is completely integrable if and only if E = T(𝔉) for a C^∞ foliation 𝔉 of codimension q = n − k." — Candel–Conlon, Foliations I, Cor. 1.3.9, p. 37.

The accessible set and the topological definition of tautness (printed p. 146):

> "**Definition 6.3.1.** The *accessible set* A(L) of a leaf L is the set of x ∈ M for which there is a nontrivial, positively directed, 𝔉-transverse curve from L to x." — Candel–Conlon, Foliations I, Def. 6.3.1, p. 145.

> "**Definition 6.3.3.** The foliation 𝔉 is *taut* if every leaf meets a closed transversal. In the case that ∂_τ M ≠ ∅, the foliation is taut if each leaf either meets a closed transversal or a transverse arc from one component of ∂_τ M to another." — Candel–Conlon, Foliations I, Def. 6.3.3, p. 146.

Reformulation of tautness via cobounding compact leaves (printed p. 147):

> "**Corollary 6.3.4.** The foliation 𝔉 is taut if and only if no finite family of compact leaves {L_1, ..., L_q} cobounds a submanifold Q ⊂ M in such a way that Q lies on the positive side of L_i, 1 ≤ i ≤ q." — Candel–Conlon, Foliations I, Cor. 6.3.4, p. 147.

Connection to the Euler class (printed p. 147, following Theorem 6.3.5):

> "The C^∞ hypothesis is for convenience, enabling us to define the Euler class e(𝔉) ∈ H²(M; ℝ) via differential forms. This is a characteristic class of the vector bundle T(𝔉) with the remarkable property that, if L is a compact leaf with Euler characteristic χ(L), then the value of e(𝔉) on [L] ∈ H₂(M; ℝ) is exactly χ(L) (Proposition 6.3.7)." — Candel–Conlon, Foliations I, p. 147.

Geometric tautness (printed p. 261):

> "**Definition 10.5.1.** The foliated manifold (M, 𝔉) is *geometrically taut* if there exists a Riemannian metric g on M relative to which all leaves are minimal submanifolds (mean curvature zero). In this case, 𝔉 is also said to be geometrically taut or *harmonic* and the triple (M, 𝔉, g) is called a *harmonic foliated manifold*." — Candel–Conlon, Foliations I, Def. 10.5.1, p. 261.

## Notes

- **Page calibration.** Printed page = physical djvu page − 15 throughout Volume I (verified: printed 19 = physical 34; printed 146 = physical 161; printed 261 = physical 276). The book prints the page number at the head of each page.
- **Two equivalent definitions of "foliation".** The roadmap prompt asked for both the *foliated atlas* formulation and the *integrable subbundle of the tangent bundle* formulation. Candel–Conlon give the atlas/plaque formulation as the primary definition (Def. 1.1.18) and then prove their equivalence to integrable subbundles through the Frobenius theorem (Thm. 1.3.8, Cor. 1.3.9). The two coincide only in the C^∞ (or at least C^1) case: the subbundle T(𝔉) requires a differentiable tangent distribution, whereas Def. 1.1.18 permits any class C^r ≥ 0.
- **Notation transcribed.** The book uses Fraktur 𝔉 (script "F") for a foliation, 𝔛(M) for the C^∞ vector fields, Γ(E) for sections, B_τ / B_⋔ for the tangential / transverse factors (subscript "th" in OCR = ⋔, the transverse / proper-intersection symbol), and 𝔽^p for "ℝ^p or the half-space ℍ^p". The original prints B_⋔ with a small pitchfork glyph; rendered as ⋔ here.
- **"Closed transversal."** Matching the roadmap's phrasing, Def. 6.3.3 makes tautness exactly "every leaf meets a closed transversal" (a closed transverse curve / loop transverse to 𝔉). The accessible-set machinery (Def. 6.3.1, Lemma 6.3.2) is the surrounding apparatus; the cobounding-submanifold form (Cor. 6.3.4) is the standard 3-manifold-topology criterion used in Volume II for Gabai's constructions.
- **Volume II.** Volume II does not restate the basic taut definition; it re-uses Def. 6.3.3 and adds the sutured-manifold variant (Definition 11.2.4, printed-page region around physical p. 12728 of the OCR dump) for Gabai's taut finite-depth foliations. Not transcribed here, as the layer-10 target only needs the closed-transversal definition, which lives in Volume I.
- **Possible point to double-check.** Definition 6.3.1's quotation is from printed p. 145 (physical 160); Definitions 6.3.2 (Lemma) and 6.3.3 are on printed p. 146 (physical 161). The locus line lists the taut definition at p. 146, which is correct for Def. 6.3.3 itself.
