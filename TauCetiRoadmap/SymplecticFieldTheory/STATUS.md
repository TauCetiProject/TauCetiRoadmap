<!--tauceti-status:v1 {"roadmap":"SymplecticFieldTheory","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Reeb orbit multiplicities, markers and action-bounded finiteness (0.1); orientation lines and good/bad orbits (0.2); monomial expansion adapters","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"0d768f00d7f518c58294b7f1f0e418b5170eca58a44d72e7d71d3f153906796b","roadmap":"SymplecticFieldTheory","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: SymplecticFieldTheory

This file documents the status of the SymplecticFieldTheory roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only Layer 0 has begun. Its algebraic half is essentially done: the orbit algebra, its gradings, its comparisons, and the odd-derivation theorems (0.3–0.5). Its geometric half is barely started: there is a lower bound for Reeb periods, but no orbit multiplicities and no good or bad orbits. Layers 1–9, from punctured curves through the SFT algebra, have not started.

### Named results

- **Odd derivations are free on generators** — a Koszul-odd linear assignment V → A(V) [extends uniquely](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Derivation.html#TauCeti.SignedSym.existsUnique_odd_extension) to a map of A(V) obeying the signed Leibniz rule d(ab) = d(a)b + (−1)^p a d(b).
- **The square-zero criterion** — an odd signed Leibniz map [squares to zero](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Derivation.html#TauCeti.SignedSym.comp_self_eq_zero_iff) exactly when its square vanishes on generators. For integer gradings this is [packaged as a DG-algebra criterion](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Derivation.html#TauCeti.SignedSym.isDGAlgebra_liftDerivation_iff). It is the algebraic reduction of Layer 5's d² = 0, though not that identity itself.
- **The Sym ⊗ Λ decomposition** — when 2 is invertible, the orbit algebra is [canonically Sym(V_even) ⊗ Λ(V_odd)](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Parity/Decomposition.html#TauCeti.SignedSym.symTensorExteriorEquiv), and so it is a free module when both parity parts are.
- **The universal property of the signed symmetric algebra** — sign-compatible linear maps out of V correspond to [algebra maps out of A(V)](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Basic.html#TauCeti.SignedSym.liftEquiv), and there is a graded version that is unique among graded maps.
- **Koszul supercommutativity** — homogeneous generators [commute up to the sign (−1)^{pq}](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Basic.html#TauCeti.SignedSym.generator_mul_generator). This extends to all homogeneous elements, and odd elements square to zero once 2 is invertible.

### Notable definitions and infrastructure

- [`SignedSym`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Basic.html#TauCeti.SignedSym) is the orbit algebra A(V), with its [internal ℤ-grading](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Grading.html#TauCeti.isInternal_signedSymPiece) by input degree. It will be the source and target of the contact differential and the cobordism maps.
- **The disjoint-orbit splitting** identifies A(V × W) with the Koszul-signed graded tensor product. The factor inclusions [supercommute](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Prod/Basic.html#TauCeti.SignedSym.inl_mul_inr), and differentials on the factors give a [product differential](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Prod/Differential.html#TauCeti.SignedSym.isDGAlgebra_prodDifferential). This is what lets counts on disjoint unions of contact manifolds factor.
- **The [parity grading](https://taucetiproject.org/docs/TauCeti/Algebra/Module/GradedModule/Coarsen.html#TauCeti.InternalGrading.parity)** of an integer grading. The orbit algebra built from parities alone is identified with the integer-graded one, and derivations transport across that identification. This serves the roadmap's convention that the grading is by parity, without demanding an integer lift.

### Roadmap coverage

Layer 0 is partial. The algebraic parts 0.3, 0.4 and 0.5 are in, including scalar extension (also in characteristic two), the word-length grading and the parity-only derivation theory. Of 0.3's smaller adapters, finite signed monomial expansions and permutation and braid identities are not evident in the source. From 0.1 there is only the period lower bound `IsContactForm.exists_pos_period_le`: there are no unparametrized orbits, multiplicities, markers, action-bounded finiteness or generic nondegenerate forms. Nothing for 0.2 has started. Layers 1 through 9 are untouched.

## The frontier

- **Reeb orbits and their counting (0.1).** Build unparametrized orbits with covering multiplicities, asymptotic markers and the cyclic reparametrization action. Then prove finiteness below an action bound from the existing period bound, and construct generic nondegenerate forms. Layer 1 and much else wait on this.
- **Good and bad orbits (0.2).** Build the orientation lines and the marker action, and prove the even-cover eigenvalue criterion. This needs HeegaardFloer's determinant lines and Conley–Zehnder normalization as well as 0.1.
- **The Weyl-algebra carrier (7.1).** Layer 7 is independent algebra that needs only 0.3, so it is now unblocked. The first target is the normal-ordered coefficient algebra completed in p-word length, with the finite-support proof for its products.
- **Monomial adapters (0.3).** Finite signed monomial expansions and permutation and braid identities remain. They are small, but Layer 7's coefficient calculus will lean on them.
