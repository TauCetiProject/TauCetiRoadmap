# Fair-use extract: Kirby–Siebenmann: the triangulation/smoothing obstruction

**Source.** R. Kirby, L. Siebenmann, Foundational Essays on Topological Manifolds, Smoothings, and Triangulations, Annals of Math. Studies 88, Princeton, 1977.

**Locus.** Essay I, §5, Thm 5.1 (printed p. 31); Essay IV, §10, Classification Thm 10.1 and the obstruction Δ(M) (printed pp. 194–195, 202), Appendix B, Assertion B.1 and the disproof of the Hauptvermutung (printed pp. 209–213); Annex 2 = the reprinted announcement "On the triangulation of manifolds and the Hauptvermutung", Bull. Amer. Math. Soc. 75 (1969), 742–749, here renumbered (printed pp. 299–306), with the Classification/Structure theorems, the H⁴ obstruction, and the "Added in proof" computing π₃(TOP/PL) (printed pp. 300–301, 305).

**Supports.** GeometricTopology roadmap, layer 1 (Top→PL obstruction) and layer 11.

*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

## Summary

This is the source for the **Kirby–Siebenmann obstruction**: a single cohomology class that decides whether a high-dimensional topological manifold admits a PL (piecewise-linear) structure, and that measures the failure of the Hauptvermutung (uniqueness of PL structures up to PL-isomorphism).

**Where the obstruction lives, and what it is.** For a topological manifold M^m, m ≥ 6 (or m = 5 if ∂M ⊆ C), with a CAT (= DIFF or PL) structure Σ₀ already given near a closed subset C, the existence of a CAT structure on all of M extending Σ₀ is classified by lifting the tangent-microbundle classifying map f: M → BTOP through the fibration p: BCAT → BTOP with fiber TOP/CAT (Classification Theorem 10.1). The obstruction theory is governed by the homotopy groups of the fiber. Kirby and Siebenmann compute (with Wall) that

  πᵢ(TOP/PL) = 0 for i ≠ 3, and π₃(TOP/PL) = ℤ/2,

i.e. TOP/PL ≃ K(ℤ/2, 3) (Essay IV, printed p. 202). Consequently the obstruction theory collapses to a single class. In the relative form (Essay IV, p. 202): M admits a PL structure equal to Σ₀ near C **if and only if a well-defined obstruction Δ(M) ∈ H⁴(M, C; ℤ/2) vanishes**. (Absolutely, with C empty, this is the class in H⁴(M; ℤ/2).) When one PL structure exists, the set of PL structures rel C is in natural bijection with H³(M, C; ℤ/2). The single class arises because the primary obstruction to a section of a fibration with fiber K(ℤ/2, 3) lives in H^{3+1} = H⁴ with ℤ/2 coefficients, and there are no higher obstructions since the fiber is an Eilenberg–MacLane space.

**Two distinct phenomena.** (1) *Existence/triangulability:* the H⁴(M; ℤ/2) class obstructs putting any PL structure on M (the triangulation conjecture for manifolds). (2) *Uniqueness/Hauptvermutung:* when PL structures exist, they are classified by H³(M; ℤ/2), so a nonzero H³ class produces homeomorphic PL manifolds that are not PL-isomorphic, the failure of the manifold Hauptvermutung.

**The engine: handle straightening and the product structure theorem.** The whole edifice rests on Essay I. The Product Structure Theorem 5.1 (printed p. 31) says a CAT structure on M × Rˢ comes, up to concordance, from a CAT structure on M. Its proof reduces, via "Concordance Implies Isotopy" (Essay I §4) and the s-cobordism theorem, to a *handle-straightening problem*: deciding when a homeomorphism of an open PL handle Bᵏ × Rⁿ onto a PL manifold can be isotoped to be PL on the core. The local obstruction to straightening a handle lands in πₖ(TOPₘ, PLₘ) ≅ πₖ(TOPₘ/PLₘ), and stably in πₖ(TOP/PL). Kirby's torus-unfurling trick reduces handle straightening to a *torus problem* whose obstruction lies in H^{3−k}(Tⁿ; ℤ/2); passing to a 2ⁿ-fold standard cover kills H^{3−k}(Tⁿ; ℤ/2) for k > 0, forcing those obstruction groups to vanish, while for k = 3 the class survives, yielding π₃(TOP/PL) = ℤ/2.

**The disproof of the Hauptvermutung (concrete manifold).** Essay IV Appendix B builds, from Casson's handle construction on the Poincaré homology 3-sphere P³ = SO(3)/A₅, a CAT exotic homotopy torus / homotopy S³ × Tⁿ realizing a nonzero element of the structure set (Assertion B.1, printed p. 209). Nontriviality is proved by deriving a contradiction with Rohlin's signature theorem (Rohlin: a closed smooth/PL 4-manifold with w₂ = 0 has signature divisible by 16; the Milnor plumbing P⁴ smashed to P⁴₀ = P⁴/∂P⁴ has signature exactly 8, see Essay IV B.2, printed p. 210). Combined with Farrell's fibration theorem (B.3, printed p. 211) and the invariance of the example under standard covers, this produces both a manifold with no PL structure of the expected homotopy type and homeomorphic-but-not-PL-isomorphic PL manifolds (printed pp. 212–213).

**Historical caution (read carefully when quoting Annex 2).** Annex 2 reprints the December 1968 BAMS announcement. Its main body still treats π₃(TOP/PL) as undetermined, "a single obstacle remains … to decide whether the homotopy group π₃(TOP/PL) is 0 or ℤ₂", and its Structure Theorem states "πₖ(TOP/PL) is 0 if i ≠ 3 and ℤ₂ or 0 if i = 3". The value ℤ/2 is established only in the "Added in proof" (printed p. 305): "We have proved that π₃(TOP/PL) is ℤ₂ not 0 … Therefore π₃(TOP/PL) = ℤ₂." So the definitive form of the obstruction theory is the Essay IV statement (TOP/PL ≃ K(ℤ/2,3), Δ(M) ∈ H⁴(M; ℤ/2)); the Annex-2 H⁴ obstruction is stated with coefficient group π₃(TOP/PL) before that group was pinned down.

## Key statements (quoted)

### Product Structure Theorem (Essay I, §5, Thm 5.1, printed p. 31)

> THEOREM 5.1 (Product Structure Theorem).
> Let Mᵐ be a TOP manifold and Σ be a CAT (= DIFF or PL) structure on M × Rˢ, s ≥ 1. Let U be an open subset of M so that there is a CAT structure ρ on U with Σ | U × Rˢ = ρ × Rˢ. Provide[d] that m ≥ 6, or m = 5 and ∂M ⊆ U. Then there exists a CAT structure σ on M extending ρ and a conditioned concordance rel U × Rˢ from Σ to σ × Rˢ.

The accompanying Remark 3 (printed p. 31) records the obstruction-theoretic consequence:

> Using (a) the classification theorem [KS₁] [IV] … (b) the calculation that πᵢ(TOP/PL) and πᵢ(TOP/O) are 0 for i ≤ 2 and are ℤ₂ = ℤ/2ℤ if i = 3 [KS₁] … one easily finds that for m ≥ 3 and m+s ≥ 6 (or m+s = 5 and ∂M ⊆ U) the statement (P) holds if and only if the cohomology group H³(M, U; ℤ₂) is zero. For example (P) fails if M³ = S³, s ≥ 2, and U = ∅ ! Statement (P) is undecided if m = 4.

### Classification Theorem 10.1 (Essay IV, §10, printed pp. 194–195)

> CLASSIFICATION THEOREM 10.1.
> Consider the data: Mᵐ a topological m-manifold (metrizable, and possibly with boundary); Σ₀ a CAT manifold structure defined on an open neighborhood U of a closed C ⊆ M; F₀: τ(M) | U → γ^CAT a microbundle map over F̄₀: U → BCAT that is CAT for the CAT microbundle structure on τ(M) | U given by Σ₀; f: τ(M) → γ^TOP a TOP microbundle map over f̄: M → BTOP(m) such that j∘F₀ ≃ f near C.
> Suppose m = dim M ≥ 6, (or m = 5 and ∂M ⊆ C). Then M admits a CAT manifold structure Σ equal Σ₀ near C if and only if f̄ has a lifting M → BCAT equal F̄₀ near C. In fact there is a bijection θ
>   θ: 𝒮^CAT(M rel C, Σ₀) → Lift(f̄ rel C, F̄₀)
> mapping from concordance classes rel C of such structures Σ and mapping to vertical homotopy classes rel C of liftings of f̄ to BCAT equal F̄₀ near C. Further, when one such Σ is singled out, there is a bijection θ₁
>   θ₁: 𝒮^CAT(M rel C, Σ₀) → [M rel C, TOP/CAT]
> to the homotopy classes rel C of maps M → TOP/CAT that send a neighborhood of C to the base point.

### The single ℤ/2 obstruction Δ(M) (Essay IV, printed p. 202)

> We have established a homotopy equivalence TOP/PL ≃ K(ℤ₂, 3). This means that the primary obstructions met in calculating PL structure sets are the only ones. More precisely, using 10.8, 10.9, 10.11, we see that in the situation of 10.1 the TOP manifold M admits a PL manifold structure equal to Σ₀ near C, if and only if a well-defined obstruction Δ(M) in H⁴(M, C; ℤ₂) vanishes. When one such structure is singled out, the pointed set 𝒮^PL(M rel C, Σ₀) is naturally isomorphic to H³(M, C; ℤ₂). Also C may be open in M instead of closed.

### Existence of an exotic homotopy torus / the disproof input (Essay IV, App. B, Assertion B.1, printed p. 209)

> ASSERTION B.1.
> If 3+n ≥ 5, there exists an element [M³⁺ⁿ] in 𝒮(I³ × Tⁿ rel ∂) that is nontrivial, but is nevertheless invariant under passage to standard coverings of I³ × Tⁿ.
> By matching M³⁺ⁿ with a copy of I³ × Tⁿ along the common boundary ∂I³ × Tⁿ one obtains … a CAT manifold homotopy equivalent to S³ × Tⁿ but not CAT isomorphic to S³ × Tⁿ, i.e. one obtains a CAT exotic homotopy S³ × Tⁿ.
> Again, by identifying the opposite ends of the three interval factors of I³ one derives from M³⁺ⁿ a CAT exotic homotopy T³⁺ⁿ.

### Rohlin's signature theorem as used (Essay IV, App. B, B.2, printed p. 210)

> B.2. V. A. Rohlin's Signature Theorem.
> Every closed oriented smooth 4-manifold M⁴ of which the second Stiefel-Whitney class w₂(M) is zero has signature σ(M) ∈ ℤ divisible by 16.

### Annex 2, the 1968 announcement: Classification and Structure theorems (printed pp. 299–301)

> (1) CLASSIFICATION THEOREM. Let Mᵐ be any topological manifold of dimension m ≥ 6 (or > 5 if the boundary ∂M is empty). There is a natural one-to-one correspondence between isotopy classes of PL structures on M and equivalence classes of stable reductions of the tangent microbundle τ(M) of M to PL microbundle.

> (II) STRUCTURE THEOREM (PARTIALLY ANNOUNCED IN [8]).
> πₖ(TOP/PL) is 0 if i ≠ 3 and ℤ₂ or 0 if i = 3. Also πₖ(TOPₘ/PLₘ) ≅ πₖ(TOP/PL) by stabilization, for k < m, m > 5.

> Combining (I) and (II) we find
> (1) There is just one well-defined obstruction in H⁴(M; π₃(TOP/PL)) to imposing a PL structure on M.
> (2) Given one PL structure on M the isotopy classes of PL structures on M are in (1-1)-correspondence with the elements of H³(M; π₃(TOP/PL)).

The announcement also lists the unconditional corollaries (printed p. 301):

> (III) FINITENESS OF COMPACT TYPES. Every compact topological manifold has the homotopy type of a finite complex — even if it be non-triangulable.
> (IV) TOPOLOGICAL INVARIANCE OF TORSIONS. Every topological manifold M has a well-defined simple homotopy type … if h: M → M' is a homeomorphism of compact connected PL manifolds, the Whitehead torsion τ(h) ∈ Wh(π₁M) of h is zero.

The opening paragraph (printed p. 299) frames the then-open value of the group:

> At this time a single obstacle remains — namely to decide whether the homotopy group π₃(TOP/PL) is 0 or ℤ₂. The positive results we obtain in spite of this obstacle are, in brief, these four: any (metrizable) topological manifold M of dimension ≥ 6 is triangulable, i.e. homeomorphic to a piecewise linear (= PL) manifold, provided H⁴(M; ℤ₂) = 0; a homeomorphism h: M₁ → M₂ of PL manifolds of dimension ≥ 6 is isotopic to a PL homeomorphism provided H³(M; ℤ₂) = 0; any compact topological manifold has the homotopy type of a finite complex (with no proviso); any (topological) homeomorphism of compact PL manifolds is a simple homotopy equivalence (again with no proviso).

### Annex 2, "Added in proof": π₃(TOP/PL) = ℤ/2 (printed p. 305)

> ADDED IN PROOF. We have proved that π₃(TOP/PL) is ℤ₂ not 0, see [17]. Here is an argument in outline. Surgery provides a homotopy equivalence g: B¹ × Tⁿ → W, n > 5, that is a PL homeomorphism on ∂ and has nonzero invariant [g] ∈ H²(Tⁿ; ℤ₂). … Therefore π₃(TOP/PL) = ℤ₂.

## Notes

- **Page offset.** The PDF (363 pages, a scanned djvu) is offset +8 from printed page numbers throughout the relevant range: printed p. 31 = PDF 39, printed p. 194 = PDF 202, printed p. 202 = PDF 210, printed p. 209 = PDF 217, printed pp. 299–306 (Annex 2) = PDF 307–314. The offset was verified independently in Essay IV and in the Annex 2 reprint.
- **OCR is poor.** The scan's OCR mangles math. All quotations above were read against the page images and normalized to Unicode: subscripts/superscripts restored (e.g. "H4(M; Z2)" → H⁴(M; ℤ/2), "1f3" / "1f₃" → π₃, "TOP m /PL m" → TOPₘ/PLₘ, "~" → ≃ or ≅ as context requires, "a" used by OCR for ∂, "S" for 𝒮). Where the OCR used "ℤ₂" the book means ℤ/2 = ℤ/2ℤ (the book itself writes "ℤ₂ = ℤ/2ℤ", Essay I Remark 3). The Greek index variable in the Annex-2 Structure Theorem is printed as "i" in two clauses and "k" in the stabilization clause; the OCR's "πₖ … if i ≠ 3" is faithfully transcribed (the book's own notation is loose here).
- **Apparent typo in the book.** Annex 2 Structure Theorem (printed p. 300) writes "πₖ(TOP/PL) is 0 if i ≠ 3 and ℤ₂ or 0 if i = 3", mixing the indices k and i. The intended statement is the unambiguous one given definitively in Essay IV: πᵢ(TOP/PL) = 0 for i ≠ 3 and = ℤ/2 for i = 3.
- **Coefficient group caveat.** The Annex-2 statement "(1) There is just one well-defined obstruction in H⁴(M; π₃(TOP/PL))" is written before π₃(TOP/PL) was known to be ℤ/2; read together with the "Added in proof" it becomes the H⁴(M; ℤ/2) obstruction. The clean, self-contained statement for the roadmap is the Essay IV one: TOP/PL ≃ K(ℤ/2, 3); Δ(M) ∈ H⁴(M, C; ℤ/2) is the obstruction to a PL structure, and 𝒮^PL(M rel C, Σ₀) ≅ H³(M, C; ℤ/2) classifies them.
- **Dimension hypotheses are essential.** All existence/classification statements require dim M ≥ 6 (or = 5 with the boundary inside the already-structured region C/U). The product structure and concordance results in Essay I §§3–5 carry the same restriction; Essay I notes m = 4 is undecided by these methods (Thm 5.1 Remark 3, "(P) is undecided if m = 4", printed p. 31). The 4-dimensional theory is genuinely outside this book's reach.
- **Two annex numbering schemes.** The PDF's running text labels the BAMS reprint "Annex B" in one header but the Table of Contents and Foreword call it "Annex 2"; they are the same item ("On the triangulation of manifolds and the Hauptvermutung", BAMS 75 (1969), 742–749).
