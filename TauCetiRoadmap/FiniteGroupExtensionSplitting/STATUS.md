<!--tauceti-status:v1 {"roadmap":"FiniteGroupExtensionSplitting","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"§1.5 for normalized crossed maps on an intermediate subgroup H; only the global case H = G is proved","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"}],"readme_sha":"9a902ef2c6902cf83820c5ec11de5e62247df11f225525b71576b932fbfd74ce","roadmap":"FiniteGroupExtensionSplitting","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: FiniteGroupExtensionSplitting

This file documents the status of the FiniteGroupExtensionSplitting roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All four headline theorems are proved: Gaschütz's splitting theorem, its Sylow form, the invariant-complement theorem in external and internal form, and the cohomological splitting criterion. Gaschütz's theorem is proved both through the crossed transfer and through the restriction formula. The only gap is a generalisation in Layer 1: principal crossed maps conjugating zero loci are handled only for complements in the whole group.

### Named results

- **Gaschütz's splitting theorem** — if an abelian normal subgroup N has a local complement in a subgroup H whose index is prime to |N|, then N has a complement in G. No solvability, centrality or coprimality of |N| with [G : N] is assumed ([`exists_isComplement'_of_coprime_index`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Complement/Gaschutz.html#Subgroup.IsLocalComplement.exists_isComplement'_of_coprime_index)).
- **Sylow detection of complements** — an abelian normal p-subgroup has a complement in G if and only if it has one in a Sylow p-subgroup of finite index ([`exists_isComplement'_iff_sylow`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Complement/Sylow.html#IsPGroup.exists_isComplement'_iff_sylow)).
- **The invariant-complement theorem** — if a finite q-group A acts on W and preserves an abelian normal p-subgroup N with p ≠ q, and N is complemented in a Sylow p-subgroup, then N has an A-stable complement in W. No coprimality of |A| and |W| is needed ([`exists_invariant_complement`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Complement/Invariant/Basic.html#Subgroup.exists_invariant_complement), with the internal form [`exists_invariant_local_complement`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Complement/Invariant/Internal.html#Subgroup.exists_invariant_local_complement)).
- **The cohomological splitting criterion** — for any group, an abelian normal N has a complement exactly when the class of the quotient extension in H²(G ⧸ N, N) vanishes ([`exists_complement_iff_cohomologyClass_eq_zero`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupExtension/Quotient/Cohomology.html#Subgroup.exists_complement_iff_cohomologyClass_eq_zero)).
- **The restriction formula for the extension class** — restricted to the image of H ≥ N, the class of the quotient extension of G is the class of the quotient extension of H ([`map_subtype_cohomologyClass_factorSet_quotientExtension`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupExtension/Quotient/Restriction.html#Subgroup.map_subtype_cohomologyClass_factorSet_quotientExtension)). With the criterion above it gives the second proof of Gaschütz's theorem and a cohomological Sylow detection.

### Notable definitions and infrastructure

- **The Gaschütz complement** ([`gaschutzComplement`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Complement/Gaschutz.html#Subgroup.IsLocalComplement.gaschutzComplement)) — the zero locus of the crossed transfer of a local complement's projection, normalized by an inverse of [G : H] modulo |N|. It makes the complement explicit, and it is well defined up to conjugation by N when the transversal changes.
- **The crossed transfer** ([`crossedTransfer`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Transfer/Crossed.html#TauCeti.crossedTransfer)) — a twisted transfer that moves crossed homomorphisms from a finite-index subgroup up to G. On N it raises elements to the power [G : H], which is what lets coprimality be used.
- **The local crossed-projection dictionary** ([`localCrossedProjectionEquiv`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Complement/CrossedProjection.html#Subgroup.localCrossedProjectionEquiv)) — local complements of N in H correspond to normalized crossed maps H → N. It is compatible with conjugation and restriction, and it is the input format for the transfer.

### Roadmap coverage

Layer 0 is done, now including the compatibility of `SemidirectProduct.mulEquivSubgroup` with the complement decomposition. Layer 2 is done. That covers the crossed transfer and its value on N; normalization and transversal independence up to N-conjugacy; the exported Gaschütz theorem; the quotient action and the comparison; and the restriction formula with the cohomological proof. Layer 3 is done: Sylow detection, plus invariant complements in external and internal form. Layer 1 is done except for one part of §1.5. Principal crossed maps conjugating the zero locus are proved for global complements (H = G), which is the case Gaschütz's route uses, but not for normalized crossed maps on an intermediate subgroup H. The README's small examples for S₃ over A₃ and A₄ over V₄ are formalized. The SL(2, 3) examples and Baer's non-abelian counterexample appear only in docstrings.

## The frontier

- **§1.5 on intermediate subgroups** — what remains is to prove that, for a normalized crossed map c : H → N and a ∈ N, the product of c with the principal crossed map of a is normalized and crossed, with zero locus a (ker c) a⁻¹. The global case is already proved. This finishes the roadmap as written.
- **The SL(2, 3) instances** — the README's check that the centre of SL(2, 3) has no complement in Q₈, and hence none in SL(2, 3), is not formalized. It would exercise Sylow detection in a non-split case.
- **Baer's counterexample** — the README's check that commutativity is needed, using Q₈ in the central product SL(2, 3) ∗ C₄, is recorded only in prose.
- **Downstream use** — the README names local finite group theory beyond the Schur–Zassenhaus range as the consumer of these complement-existence theorems.
