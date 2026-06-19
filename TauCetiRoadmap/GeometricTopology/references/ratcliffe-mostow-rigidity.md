# Fair-use extract: Ratcliffe, Foundations of Hyperbolic Manifolds: Mostow rigidity and volume
**Source.** J. Ratcliffe, Foundations of Hyperbolic Manifolds, Springer GTM 149 (Third Edition, 2019; ISBN 978-3-030-31596-2, eBook ISBN 978-3-030-31597-9, DOI 10.1007/978-3-030-31597-9).
**Locus.** Theorem 11.8.5 (Mostow's rigidity theorem) and its Corollary 1, printed p. 594 (§11.8 "Mostow Rigidity", pp. 578–595); volume definition, printed p. 341 (§8.2 "Clifford-Klein Space-Forms"), with isometry-invariance Theorem 8.2.2, pp. 341–342.
**Supports.** GeometricTopology roadmap, layer 7 (Mostow rigidity, hyperbolic volume well-definedness).
*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

## Summary

Section §11.8 ("Mostow Rigidity") proves Mostow's rigidity theorem for closed, connected, orientable, hyperbolic n-manifolds with n > 2. The section sets up Lipschitz conditions, pseudo-isometries, and a chain of results (Theorems 11.8.1–11.8.4) establishing that a lift of a homotopy equivalence between such manifolds extends to a boundary map ϕ̃∞ : Sⁿ⁻¹ → Sⁿ⁻¹ that is a Möbius transformation. Theorem 11.8.5 then concludes that the homotopy equivalence itself is homotopic to an isometry; its Corollary 1 restates this as uniqueness of the hyperbolic structure up to isometry. The book proves the theorem for the closed case directly; it records (Historical Notes, §11.9) that Prasad generalized the result to complete hyperbolic manifolds of finite volume.

The notion of "volume of a hyperbolic manifold" used throughout is the volume of a Clifford-Klein space-form, defined in §8.2: for X = Sⁿ, Eⁿ, or Hⁿ and Γ a discrete group of isometries acting freely on X, the volume of the orbit space X/Γ is the volume of any proper fundamental region of Γ in X. This is well-defined because all proper fundamental regions of Γ have equal volume (Theorem 6.7.2), and it is an isometry invariant of the space-form (Theorem 8.2.2). In particular a closed hyperbolic n-manifold M = Hⁿ/Γ has a well-defined volume Vol(M).

## Key statements (quoted)

**Theorem 11.8.5 (Mostow's rigidity theorem)**, printed p. 594:

> **Theorem 11.8.5.** *(Mostow's rigidity theorem)* If ϕ : M → N is a homotopy equivalence between closed, connected, orientable, hyperbolic n-manifolds, with n > 2, then ϕ is homotopic to an isometry.

**Corollary 1** (following Theorem 11.8.5), printed pp. 594–595:

> **Corollary 1.** The hyperbolic structure on a closed, connected, orientable, hyperbolic n-manifold, with n > 2, is unique up to isometry homotopic to the identity.

**Opening of §11.8**, printed p. 578:

> Let M and N be closed, connected, orientable, hyperbolic n-manifolds, with n > 2. In this section, we prove Mostow's rigidity theorem which states that a homotopy equivalence ϕ : M → N is homotopic to an isometry. Since M and N are complete, we may assume that M and N are hyperbolic space-forms, say M = Hⁿ/Γ and N = Hⁿ/H.

**Definition of volume of a Clifford-Klein space-form**, printed p. 341 (§8.2):

> **Definition:** The volume of a Clifford-Klein space-form X/Γ is the volume of any proper fundamental region R of Γ in X.

> Note that the volume of a Clifford-Klein space-form X/Γ is well-defined, since all the proper fundamental regions of Γ have the same volume by Theorem 6.7.2.

**Theorem 8.2.2 (isometry invariance of volume)**, printed pp. 341–342:

> **Theorem 8.2.2.** If X/Γ and X/H are two isometric Clifford-Klein space-forms, then
> Vol(X/Γ) = Vol(X/H).

(In §8.2, X = Sⁿ, Eⁿ, or Hⁿ, and a Clifford-Klein space-form is an orbit space X/Γ where Γ is a discrete group of isometries of X acting freely on X; the hyperbolic case X = Hⁿ gives a hyperbolic space-form.)

## Notes

- **Edition.** This file is the Third Edition (2019). Page numbers above are the printed page numbers of that edition (verified against the running page markers and the table of contents, which lists §11.8 at p. 578 and §8.2 at p. 341).
- **Dimension hypothesis.** The theorem as stated and proved in the book requires n > 2 (i.e. dimension ≥ 3); this matches the roadmap's "dimension ≥ 3" condition. The 2-dimensional analogue fails (Teichmüller space).
- **Finite-volume / Prasad generalization.** Ratcliffe proves the closed case only. The finite-volume extension is attributed in the Historical Notes (§11.9, printed pp. 595–596): "Prasad generalized Mostow's rigidity theorem to complete hyperbolic manifolds of finite volume in his 1973 paper [361]." So the combined "Mostow–Prasad" statement (a complete finite-volume hyperbolic structure in dimension ≥ 3 is determined up to isometry by the fundamental group / homotopy type) is not stated as a single theorem in this text; the closed case is Theorem 11.8.5 and the finite-volume extension is the cited Prasad result.
- **Group-theoretic form.** Exercise 11.8.10 (printed p. 595) records the equivalent statement at the level of fundamental groups: for compact orientable hyperbolic space-forms Hⁿ/Γ and Hⁿ/H, any isomorphism ξ : Γ → H is realized by conjugation by an element f of I(Hⁿ) (so that ξ(g) = f g f⁻¹). This is the "determined by the fundamental group" reading of rigidity.
- **Volume well-definedness.** The roadmap's "volume is well-defined" requirement is supported by two facts: equality of volumes of proper fundamental regions (Theorem 6.7.2, invoked in the §8.2 definition note) and invariance under isometry of the space-form (Theorem 8.2.2). The book defines volume via a proper fundamental region; it does not, in §8.2, present the alternative measure-theoretic definition as an integral over the manifold.
- **MSC.** The title page lists Mathematics Subject Classification (2010): 57M50, 20H10, 30F40.
