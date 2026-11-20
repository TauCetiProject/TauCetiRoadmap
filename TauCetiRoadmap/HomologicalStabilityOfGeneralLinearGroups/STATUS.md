<!--tauceti-status:v1 {"roadmap":"HomologicalStabilityOfGeneralLinearGroups","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"G_n^(P,Q) and frame actions (1.1), the spectral sequence (1.2), Nesterenko-Suslin bijectivity, frame transitivity and Suslin's spectral sequence (1.3)","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"}],"readme_sha":"f102b376721b5ee032cbe9d895e06a33dfb8755ed5accd094b07da504fbe3f9b","roadmap":"HomologicalStabilityOfGeneralLinearGroups","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: HomologicalStabilityOfGeneralLinearGroups

This file documents the status of the HomologicalStabilityOfGeneralLinearGroups roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the group-theoretic groundwork of Layer 1.3 has landed: the affine group, its split structure, and its identification with the stabiliser of a standard frame. No homological statement of the roadmap is proved yet, and Layers 2 and 3 have not begun.

### Notable definitions and infrastructure

- **The affine group** — [`TauCeti.affineGroup`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Affine.html#TauCeti.affineGroup) is the subgroup of `GL(n ⊕ m, R)` of block matrices `(g 0; u 1)`, the stabiliser of the last `m` standard basis vectors. With the [inclusion](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Affine.html#TauCeti.affineInclusion) `g ↦ diag(g, 1)` and its retraction [`TauCeti.affineProjection`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Affine.html#TauCeti.affineProjection), whose kernel is [the additive group of `m × n` matrices](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Affine.html#TauCeti.affineTranslationEquivKer), it is the object of the Nesterenko–Suslin property and so supplies the `E¹`-terms of Suslin's spectral sequence.
- **Stabilisers of standard frames** — [`TauCeti.stabilizerCastLEEquivAffineGroup`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Affine.html#TauCeti.stabilizerCastLEEquivAffineGroup) identifies the stabiliser of `(e₁, …, e_r)` in `GL_n(R)` with `A_{n−r,r}(R)`, the step that lets Shapiro's lemma turn the frame complex's `E¹` into homology of affine groups. It holds over any commutative ring; nothing semilocal is used yet.

### Roadmap coverage

Layer 1 is partial: of its three sections only 1.3 has begun, and only with its API (the affine group, inclusion, projection with its kernel, and the stabiliser identification). The groups `G_n^(P,Q)` and their actions on frame complexes (1.1), the spectral sequence of such an action with its `d¹` differentials (1.2), and in 1.3 the Nesterenko–Suslin bijectivity `homology_affineInclusion_bijective`, transitivity on frames over semilocal rings and Suslin's spectral sequence are all still to be done. Layer 2 (van der Kallen's theorem for `E_n(R)`, the noetherian and semilocal specializations, the range `m ≤ n`, the plus construction and `K_m(R)`) and Layer 3 (coefficient systems, the relative spectral sequence, twisted stability and `H_m(GL_n(R); Rⁿ)`) are untouched.

## The frontier

- **The Nesterenko–Suslin property** — prove that `affineInclusion` induces a bijection on `H_k(−; ℤ)` over a semilocal ring with all residue fields infinite; the groups and maps are now in place, and the README's checks show the infinite-residue hypothesis is essential.
- **Transitivity on frames over semilocal rings** — show `GL_n(A)` acts transitively on unimodular `r`-frames of `Aⁿ` for `r ≤ n`, completing a frame to a basis; with the stabiliser identification already proved this finishes the group theory of 1.3.
- **Van der Kallen's groups `G_n^(P,Q)`** — define them, let them act on SchemeKTheoryOperations §6.7's frame complexes, and prove transitivity with stabilisers of the same shape (1.1); the affine group is the special case `P = ∅`. Depends on §6.7's frames and their acyclicity.
- **The spectral sequence of 1.2** — build it from §6.7's hyperhomology spectral sequence and Shapiro's lemma, with the `d¹` parity rule; Suslin's spectral sequence and all of Layer 2 wait on it.
