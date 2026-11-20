<!--tauceti-status:v1 {"roadmap":"SymplecticFieldTheory","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"orbit multiplicities and finiteness, orientation lines and good/bad orbits, Sym-Lambda and tensor/parity comparisons, odd derivations","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"d5e70d6f0a72cc3e9f319a149e501c9968f88368b8ae0801b36255a734efb750","roadmap":"SymplecticFieldTheory","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: SymplecticFieldTheory

This file documents the status of the SymplecticFieldTheory roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only Layer 0 has begun. The algebra side of it is well under way: the free supercommutative orbit algebra exists, with its integer grading and universal properties. The geometric side, Reeb orbits with their multiplicities and orientation lines, is mostly unbuilt. Layers 1–9 (punctured curves, Fredholm theory, gluing, implicit atlases, the contact differential, and the SFT algebra) have not started.

### Named results

- **The universal property of the signed symmetric algebra.** A linear map whose values on homogeneous generators obey the Koszul sign rule extends uniquely to an algebra map. This is stated as an [equivalence of hom-sets](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Basic.html#TauCeti.SignedSym.liftEquiv).
- **The graded universal property.** A degree-preserving generator assignment satisfying the Koszul relations has a [graded extension](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Grading.html#TauCeti.SignedSym.gradedLift), and it is [unique among graded algebra maps](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Grading.html#TauCeti.SignedSym.gradedLift_unique).
- **Koszul supercommutativity.** Homogeneous generators [supercommute with sign (−1)^{pq}](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Basic.html#TauCeti.SignedSym.generator_mul_generator). The library extends this to all homogeneous elements and shows that odd elements square to zero once 2 is invertible. That is the roadmap's check that this algebra, unlike the unsigned symmetric algebra, is the right carrier for odd orbits.
- **A uniform lower bound for Reeb periods.** On a compact contact manifold, the positive periods of Reeb trajectories, including multiply covered ones, are bounded below by a positive constant. In the library this is `IsContactForm.exists_pos_period_le`.

### Notable definitions and infrastructure

- [`SignedSym`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Basic.html#TauCeti.SignedSym) is the orbit algebra A(V): the tensor algebra modulo signed swaps of homogeneous generators. It will be the source and target of the contact differential and the cobordism maps.
- [The input-degree grading of the tensor algebra](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/TensorAlgebra/Grading.html#TauCeti.instGradedAlgebraIntTensorAlgebraTensorAlgebraPiece) comes from an internal grading of the generators. Because the Koszul ideal is homogeneous, it descends to an [internal ℤ-grading on the orbit algebra](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Grading.html#TauCeti.instGradedAlgebraIntSignedSymSignedSymPiece). That descended grading is what will let a degree-one differential be stated.

### Roadmap coverage

Layer 0 is partial. From 0.3, the carrier, grading, universal properties, functoriality and odd-square vanishing are in. The comparison with Sym(V_even) ⊗ Λ(V_odd) and the monomial-expansion adapters are not. From 0.1, only the period lower bound is in: there are no orbit multiplicities, markers, finiteness below an action bound, or generic nondegenerate forms. 0.2 (orientation lines, good and bad orbits), 0.4 (tensor and parity comparisons) and 0.5 (odd derivations) have not been started. Layers 1 through 9 are untouched.

## The frontier

- **Odd derivations (0.5).** Prove that a degree-one assignment on generators extends uniquely to a signed Leibniz map, and that such a map squares to zero exactly when it does on generators. The grading and its universal property are the starting point. This is the result that reduces d² = 0 in Layer 5 to an algebraic check.
- **Disjoint-orbit tensor comparison (0.4).** Show A(V ⊕ W) ≅ A(V) ⊗ A(W) with the Koszul-signed graded tensor product, compatibly with generators and differentials. Also needed: the parity grading, with the parity-built algebra shown to be the reduction of the integer one.
- **Sym ⊗ Λ comparison (0.3).** Identify the orbit algebra over ℚ with the symmetric algebra on the even part tensored with the exterior algebra on the odd part.
- **Reeb orbits and their counting (0.1).** Build unparametrized orbits with covering multiplicities and asymptotic markers. Then prove finiteness below an action bound from the existing period bound, and construct generic nondegenerate forms.
- **Good and bad orbits (0.2).** The orientation lines need the HeegaardFloer determinant-line and Conley–Zehnder suppliers. The even-cover eigenvalue criterion is the main theorem.
