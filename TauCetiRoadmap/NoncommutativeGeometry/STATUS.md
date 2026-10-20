<!--tauceti-status:v1 {"roadmap":"NoncommutativeGeometry","to_sha":"68a457ec2b1aee486f4192ee3ea36a04f70efb8c","ts":"2026-10-20T05:58:24Z"}-->
# Status: NoncommutativeGeometry

This file documents the status of the NoncommutativeGeometry roadmap up until `68a457e` (2026-10-20T05:58:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The algebraic core of N1 exists for unital algebras, and so does the first piece of N2: cyclic cohomology with Connes' B, the ground-ring computation, reduced and relative variants, and the even pairing with idempotents. The SBI sequence, periodic cohomology, cycles and characters are still missing, and so is all of N3–N7: Fredholm modules, Dixmier traces, spectral triples and the noncommutative torus have not begun.

### Named results

- **Connes' operator B** — B squares to zero ([`connesB_connesB`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/ConnesOperator.html#TauCeti.connesB_connesB)) and anticommutes with the Hochschild coboundary ([`hochschildCoboundary_connesB_add_connesB_hochschildCoboundary`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/ConnesOperator.html#TauCeti.hochschildCoboundary_connesB_add_connesB_hochschildCoboundary)), so the (b, B) mixed complex is in place.
- **Cyclic cohomology of the ground ring** — in even degree the cyclic cohomology of the ground ring is the coefficient module, via the product cochain, whenever 2 is not a zero divisor there ([`selfEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/GroundRing.html#TauCeti.cyclicCohomology.selfEquiv)). In odd degree it vanishes ([`isZero_cyclicCohomology_self_of_odd`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/GroundRing.html#TauCeti.isZero_cyclicCohomology_self_of_odd)).
- **Connes' even pairing** — for an idempotent matrix e and a cyclic 2m-cocycle φ, the value (m!)⁻¹(φ#Tr)(e,…,e) depends only on the class of φ ([`evenPairing_matrixExtension_mk`](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/EvenPairing.html#TauCeti.cyclicCohomology.evenPairing_matrixExtension_mk)). This needs a field of characteristic zero.
- **Universal property of universal one-forms** — one-forms over the forced unitization represent derivations into any bimodule ([`existsUnique_lift`](https://taucetiproject.org/docs/TauCeti/NoncommutativeGeometry/UniversalDifferential/OneForms.html#TauCeti.UniversalOneForms.existsUnique_lift)), with da = 1⊗a in [tensor coordinates](https://taucetiproject.org/docs/TauCeti/NoncommutativeGeometry/UniversalDifferential/TensorCoordinates.html#TauCeti.UniversalOneForms.tensorEquiv).
- **Hochschild cochains with dual coefficients** — currying the first argument turns the scalar Hochschild coboundary into the one with coefficients in the algebraic dual bimodule ([`multilinearCurryFirstEquiv_hochschildCoboundary`](https://taucetiproject.org/docs/TauCeti/RingTheory/HochschildCohomology/Dual.html#TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary)), as N1 requires.

### Notable definitions and infrastructure

- [Relative cyclic cohomology](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/Relative.html#TauCeti.relativeCyclicCohomology) is defined as the kernel of scalar restriction on the forced unitization, with the augmentation as splitting. This is the README's nonunital convention, and every later nonunital pairing will be built on it.
- [Matrix extension on cyclic cohomology](https://taucetiproject.org/docs/TauCeti/RingTheory/CyclicCohomology/Matrix.html#TauCeti.cyclicCohomology.matrixExtension) is the generalized trace φ#Tr, shown to commute with b, B, the cyclic operator and the cyclic norm. It is the ingredient for Morita invariance and for pairings with K-theory.
- The [completed projective tensor product](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/PiTensorProduct/Projective/Completion.html#TauCeti.CompletedProjectiveTensorProduct) of locally convex spaces comes with a uniquely determined continuous lift of bounded multilinear maps. This starts the analytic half of N1.

### Roadmap coverage

N1 is partial. The cochain-level cyclic theory is done for unital algebras: b, the cyclic operator, the cyclic norm, b′ with its contraction, B, cyclic, reduced and relative cohomology, functoriality and the ground ring. The universal-form side has only degree one, without the graded form algebra, d² = 0, or cycles and their characters. The SBI sequence and S, periodic cohomology, the bicomplex comparison and normalization constants, homotopy and Morita invariance, and products are all absent. The locally convex theory has the projective tensor product and its completion, but not Fréchet completeness, completed bar resolutions, continuous cochains or the smooth-circle tensor identity. N2 is partial: it has matrix extension and the even pairing on idempotents only. N3, N4, N5, N6 and N7 are untouched; the source contains nothing for Fredholm modules, the logarithmic ideal, Dixmier traces, spectral triples or the smooth torus.

## The frontier

- **SBI sequence and periodic cohomology** — the remaining N1 algebra. It needs S, defined as exterior product with σ₁, together with I and B on cohomology, exactness at every term, periodic cohomology as a direct limit, and its comparison with the (b, B) totalization at the pinned constants. B and the bicomplex relations are already there.
- **Algebraic K₀/K₁ and descent of the pairings** — the even pairing currently takes a single idempotent. Building K₀ by group completion and K₁ as GL∞/E∞, then proving invariance under stabilization and conjugation, would turn it into a pairing on K₀. The odd pairing with its (1+i)⁻¹ constant is not started.
- **Higher universal forms and cycles** — extend one-forms to the graded differential algebra over A⁺, prove d² = 0 and graded Leibniz, and realize cyclic cocycles as characters of cycles, including the nonunital example φ(a,b,c) = abc on ℂ.
- **Continuous cyclic theory** — Fréchet completeness of the completed projective tensor product, continuous multilinear cochains with the bounded-set topology, and completed bar resolutions. These are prerequisites for the smooth-torus computations in N6.
- **N3–N7** — not yet begun. N3 depends on the OperatorKTheory Fredholm suppliers, N4 on OperatorIdeals singular values, and N6 on the rotation algebra in OperatorKTheory K7. None of these dependencies has been checked here.
