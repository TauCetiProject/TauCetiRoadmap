<!--tauceti-status:v1 {"roadmap":"FiniteGroupExtensionSplitting","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the compatibility of SemidirectProduct.mulEquivSubgroup with the complement decomposition","state":"partial"},{"id":"Layer 1","remaining":"crossed projection of a local complement, equivariance and restriction, principal crossed maps conjugating kernels","state":"partial"},{"id":"Layer 2","remaining":"the exported Gaschuetz theorem, transversal-independence up to N-conjugacy, and the restriction formula of 2.7","state":"partial"},{"id":"Layer 3","state":"untouched"}],"readme_sha":"10c0021164497f77c101058d0ff589dada1fc2a75a8e2afdf65def4d89c772b0","roadmap":"FiniteGroupExtensionSplitting","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: FiniteGroupExtensionSplitting

This file documents the status of the FiniteGroupExtensionSplitting roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The splitting dictionaries are in place: complements correspond to splittings and to normalized crossed maps, and the cohomological comparison with H²(G ⧸ N, N) is proved for every group. The crossed transfer and its coprime-index extension property, which are the engine of Gaschütz's theorem, are also proved. Gaschütz's splitting theorem itself, its Sylow form and the invariant-complement theorem are not yet stated.

### Named results

- **The cohomological splitting criterion** — an abelian normal subgroup N of any group G has a complement exactly when the class of the quotient extension in H²(G ⧸ N, N) vanishes, for the quotient conjugation action and any normalized section ([`exists_complement_iff_cohomologyClass_eq_zero`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupExtension/Quotient/Cohomology.html#Subgroup.exists_complement_iff_cohomologyClass_eq_zero)).
- **Extension of crossed homomorphisms across a coprime index** — if [G : H] is prime to |M|, then a crossed homomorphism on H that is G-equivariant on a normal N ≤ H agrees on N with a crossed homomorphism on G ([`exists_isMulCocycle₁_eq_of_coprime_index`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Transfer/Crossed.html#TauCeti.exists_isMulCocycle₁_eq_of_coprime_index)). This is the analytic heart of Gaschütz's theorem.
- **Complements are splittings** — complements of a normal subgroup correspond bijectively to splittings of the quotient extension N → G → G ⧸ N ([`quotientSplittingEquiv`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupExtension/Quotient/Basic.html#Subgroup.quotientSplittingEquiv)).
- **Complements are normalized crossed maps** — an abelian normal subgroup has a complement if and only if there is a crossed map G → N that is the identity on N (`Subgroup.exists_complement_iff_crossedProjection`), proved with no finiteness assumption.

### Notable definitions and infrastructure

- **The crossed transfer** ([`crossedTransfer`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Transfer/Crossed.html#TauCeti.crossedTransfer)) — the twisted transfer ∏ t u • c(ℓ_u g) built on the degree-one corestriction. It preserves crossed homomorphisms and changes by a principal crossed map when the transversal changes. On restrictions it gives the [G : H]-th power up to a principal crossed map, and it is the classical transfer when the action is trivial.
- **Local complements** ([`IsLocalComplement`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Complement/Local.html#Subgroup.IsLocalComplement)) — complements of N inside an intermediate subgroup H. This is the hypothesis Gaschütz's theorem is phrased in. The API includes unique factorisation, both projections, restriction of global complements, transport along isomorphisms, and a matching dictionary with splittings of the quotient extension of H.
- **The quotient conjugation action** ([`quotientConjugationAction`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupExtension/Quotient/Action.html#Subgroup.quotientConjugationAction)) — G ⧸ N acting on the abelian N, shown to be the action induced by the quotient extension, which lets the factor-set cohomology class be attached to an actual subgroup.

### Roadmap coverage

Layer 0 is done except for one listed compatibility: the decomposition with `SemidirectProduct.mulEquivSubgroup`, which does not appear in the source. Layer 1 is partial. The conjugation action and the global crossed-projection dictionary (§1.1, §1.3 for H = G) are proved. Three pieces are missing: the crossed projection of a *local* complement on H (§1.2), equivariance and restriction (§1.4), and the effect of principal crossed maps on kernels (§1.5). Layer 2 is partial. The crossed transfer, its value on N, the inverse-exponent normalization (§2.1–2.3), the quotient action and the cohomological comparison (§2.5–2.6) are proved. Still missing are the conjugacy of the complements obtained from two transversals, the exported Gaschütz theorem (§2.4), and the restriction formula with its cohomological proof (§2.7). Layer 3 is untouched.

## The frontier

- **Gaschütz's splitting theorem** (`exists_isComplement'_of_coprime_index`) — the remaining work is to show that the left projection of a local complement K in H is a crossed map that is equivariant on N. Feeding it to the coprime-index extension theorem and taking the kernel of the result through the existing global dictionary then gives the theorem.
- **Sylow detection** (`exists_isComplement'_iff_sylow`) — a short corollary of Gaschütz's theorem plus restriction of complements (already proved). It is blocked only on the item above.
- **Principal crossed maps and conjugate complements** (§1.5, with the transversal-independence statement of §2.3) — twisting by δ_a conjugates the kernel by a. Combined with the existing change-of-transversal formula, this shows the complement produced is well defined up to N-conjugacy.
- **The invariant-complement theorem** (`exists_invariant_complement`, external and internal forms) — this needs the Sylow form, then a Sylow-conjugacy argument in W ⋊ A.
- **The restriction formula for the extension class** (§2.7) — this would give the second, cohomological proof of Gaschütz's theorem from the comparison already proved. It is independent of the transfer route.
