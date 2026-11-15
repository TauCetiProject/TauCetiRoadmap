<!--tauceti-status:v1 {"roadmap":"KacMoody","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"integral lattices P and Y, root lattice, dominance, fundamental weights; isomorphism of minimal realizations of a singular matrix","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"the cone-supported character ring; its convolution finiteness lemma is already proved","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"88caab9d77b59e185e0558625f814e097de0b02a9bb79d3e0fad2ee9c85edce2","roadmap":"KacMoody","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: KacMoody

This file documents the status of the KacMoody roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only Layer 0 has started. Symmetrizable data and rational realizations are largely in place, including singular matrices and non-minimal realizations. The integral weight and coweight lattices are still missing. Nothing from the Kac–Moody algebra onward exists yet: no presented algebra, Weyl group, modules, characters, paths or groups.

### Named results

- **Kac's dimension bound** — every realization of an `I × I` matrix `A` has dimension at least `2|I| − rank A` ([`two_mul_card_le_rank_add_finrank`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/Basic.html#TauCeti.CartanRealization.two_mul_card_le_rank_add_finrank)), and every matrix has a realization that attains it ([`Matrix.nonempty_cartanRealization`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/Basic.html#Matrix.nonempty_cartanRealization)).
- **The central splitting of a realization** — every finite-dimensional realization is a minimal sub-realization plus a summand killed by all simple roots ([`exists_isMinimal_restrict_isCompl`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/CentralSplitting.html#TauCeti.CartanRealization.exists_isMinimal_restrict_isCompl)). The extra directions of an enlarged realization are therefore central.
- **The center of the coroot span** — inside the coroot span, the vectors killed by every simple root are exactly the left kernel of `A` ([`cartanCenter_inf_corootSpan`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/Basic.html#TauCeti.CartanRealization.cartanCenter_inf_corootSpan)). A realization is minimal exactly when its whole center lies in that span ([`isMinimal_iff_cartanCenter_le_corootSpan`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/Basic.html#TauCeti.CartanRealization.isMinimal_iff_cartanCenter_le_corootSpan)).
- **Local finiteness of cone convolution** — for an independent family, only finitely many pairs from two translated negative cones have a given sum ([`finite_pairs_sub_mem_natSpan`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/LinearIndependent/NatSpan.html#LinearIndependent.finite_pairs_sub_mem_natSpan)). This holds even when the family is infinite, and it is the input for multiplying cone-supported characters.

### Notable definitions and infrastructure

- **Realizations of a matrix** ([`CartanRealization`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/Cartan/Realization/Basic.html#TauCeti.CartanRealization)) — independent roots and coroots over any field, kept in the full ambient space so that a singular Cartan matrix loses nothing. The structure comes with transport along linear equivalences and restriction to sub-realizations. It is also compared with Mathlib's finite-type realisation, with a unique isomorphism between minimal realizations when `A` is nonsingular.
- **Height on an independent cone** ([`natSpanHeight`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/LinearIndependent/NatSpan.html#LinearIndependent.natSpanHeight)) — the sum of the unique nonnegative coordinates. It makes the cone pointed and gives finite bounded-height intervals below a weight, which is what the dominance order on weights needs.

### Roadmap coverage

Layer 0 is partial. Section 0.1 (symmetrizable data, the symmetrized matrix, Levi restriction, reindexing, direct sums, and uniqueness of the symmetrizer up to scale for indecomposable matrices) is in the library. Section 0.2 is done apart from one item: isomorphism of two minimal realizations of a *singular* matrix. Section 0.3 has its cone facts in abstract form (pointedness and finite-height intervals for an independent `ℕ`-span). The lattices `P` and `Y`, the root lattice, dominance and fundamental weights are absent. Layers 1–9 are untouched. The local-finiteness lemma above is groundwork for Layer 4's character ring, not one of its milestones. The finite-root-datum Lakshmibai–Seshadri paths in the library belong to SchubertGeometry S4 and are not Layer 5's symmetrizable path model.

## The frontier

- **Weight and coweight lattices (0.3)** — free lattices `P` and `Y` with a perfect pairing, containing the simple roots and coroots, plus `Q`, `Q_+`, dominance, and the criterion for fundamental weights to exist. The abstract cone results only need to be specialised to the simple roots.
- **Isomorphism of minimal realizations for singular `A` (0.2)** — existence of a root- and coroot-preserving isomorphism, without uniqueness. The current uniqueness theorem assumes `A` is invertible, so affine types such as `A_1^(1)` are not covered.
- **The presented Kac–Moody algebra (1.1)** — the free Lie algebra on the full realization modulo Cartan and Serre relators, with its universal property and Cartan injectivity. Every later layer waits on this.
- **The cone-supported character ring (4.1)** — the convolution finiteness is proved. The ring itself, its embedding of the `P`-indexed ring, and its completion still need 0.3.
- **Weyl group of the realization as a Coxeter group (2.1)** — reflections on the full realization and the faithful comparison with the Coxeter system. These rest on Layer 0 alone and can start once the lattices exist.
