<!--tauceti-status:v1 {"roadmap":"AlgebraicCodingTheory","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d","ts":"2026-10-02T05:38:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"}],"readme_sha":"0b5e5449adf97a35ee0f3ec937476cdd4828a496eda3657210e9b3cdb6213117","roadmap":"AlgebraicCodingTheory","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d"}-->
# Status: AlgebraicCodingTheory

This file documents the status of the AlgebraicCodingTheory roadmap up until `d449639` (2026-10-02T05:38:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All seven layers have their milestones proved, including the roadmap's end-to-end test. The extended binary Golay code is built from its displayed matrix and verified, and its Construction A lattice is literally the gluing of `2ℤ²⁴` along the code: an even unimodular lattice with trivial `C⊥/C`. Recent work extends the general API, mainly by giving additive codes the operations and duality formulas that linear codes had.

### Named results

- **The MacWilliams identity** — for a linear code `C` over a finite field with `q` elements, `#C · W_{C⊥}(X, Y) = W_C(X + (q - 1)Y, X - Y)` in `ℤ[X, Y]`, proved by Poisson summation over the code rather than through theta series ([`Submodule.natCard_mul_weightEnumerator_euclideanDual`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/InformationTheory/Coding/MacWilliams/Basic.html#Submodule.natCard_mul_weightEnumerator_euclideanDual)).
- **Type II lengths are divisible by eight** — a doubly even, Euclidean self-dual binary code has length `≡ 0 (mod 8)`, which follows from the MacWilliams symmetry together with the `Y ↦ iY` invariance ([`TauCeti.BinaryCode.IsTypeII.eight_dvd_card`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/InformationTheory/Coding/Binary/TypeII.html#TauCeti.BinaryCode.IsTypeII.eight_dvd_card)).
- **The extended binary Golay code** — the row space of `[I₁₂ | B]` is a doubly even self-dual `[24, 12, 8]` code with enumerator `X^24 + 759 X^16 Y^8 + 2576 X^12 Y^12 + 759 X^8 Y^16 + Y^24`. Every puncture of it is a `[23, 12, 7]` code ([`TauCeti.BinaryGolay.weightEnumerator_code`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/InformationTheory/Coding/Binary/Golay/Basic.html#TauCeti.BinaryGolay.weightEnumerator_code)), and its Construction A lattice is [even](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/Golay.html#TauCeti.BinaryGolay.isEven_constructionALattice) and [unimodular](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/Golay.html#TauCeti.BinaryGolay.isUnimodular_constructionALattice).
- **Type II codes over `ℤ/2^r`** — for `r ≥ 1`, a self-orthogonal code has an even unimodular Construction A lattice exactly when it is self-dual with every Euclidean weight divisible by `2^(r+1)` ([`TauCeti.ConstructionA.isEven_and_isUnimodular_integralLattice_iff_isTypeII`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/Even.html#TauCeti.ConstructionA.isEven_and_isUnimodular_integralLattice_iff_isTypeII)).
- **The discriminant module of Construction A is `C⊥/C`** — for a self-orthogonal additive code over `ℤ/m`, the discriminant bilinear module of `P_m(C)` is isometric to the actual quotient `C⊥/C`. The proof goes through the general gluing theorem, and there is a quadratic version for even `m` ([`TauCeti.ConstructionA.discriminantBilinearOrthogonalQuotientIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/Code/OrthogonalQuotient.html#TauCeti.ConstructionA.discriminantBilinearOrthogonalQuotientIsometry)).

### Notable definitions and infrastructure

- **The weight enumerator** — `W_C(X, Y)` with integer coefficients, defined for any set of words. MacWilliams, the named-code computations and the Type II symmetries are therefore all statements about one polynomial, and its product formula under concatenation holds for additive and linear codes alike ([`Set.weightEnumerator`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/InformationTheory/Coding/Weight/Enumerator.html#Set.weightEnumerator)).
- **The Construction A lattice** — the integer vectors of `ℚ^ι` that reduce into a code over `ℤ/m`, with the dot product divided by `m`. Every dual carrier lives in one rational space, so `P_m(C)^∨ = P_m(C^⊥)` is a literal equality ([`TauCeti.ConstructionA.integralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/Basic.html#TauCeti.ConstructionA.integralLattice)).
- **Codes as discriminant subgroups** — reduction modulo `m` identifies the discriminant module of `mℤ^ι` with `(ℤ/m)^ι`. An additive code is therefore a subgroup of an actual discriminant group, where the integral-lattices gluing API applies ([`TauCeti.ConstructionA.discriminantIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/CoordinateDiscriminant.html#TauCeti.ConstructionA.discriminantIsometry)).

### Roadmap coverage

All seven layers are done.

- **Layers 1 and 2** have:
  - matrix presentations with systematic forms, and reduction of a parity-check matrix to `n - k` independent rows;
  - puncturing, shortening and direct sums, for additive as well as linear codes, with [rank-nullity for puncturing and shortening](https://taucetiproject.github.io/TauCeti/docs/TauCeti/InformationTheory/Coding/Puncture.html#TauCeti.finrank_shorten_add_finrank_puncture_compl);
  - monomial and semilinear equivalences, the Hamming support lemmas and minimum distance, with the README's nonzero hypotheses for shortening and direct sums;
  - Euclidean, Hermitian and finite-bilinear-alphabet duality, including the puncture, shorten and direct-sum formulas.
- **Layers 3 and 4** have MacWilliams in all its forms and the Type II theory.
- **Layer 5** verifies the tetracode, the hexacode and both Golay codes.
- **Layers 6 and 7** hold every Construction A criterion, the `A₂` and `D₄` Lagrangian checks and the Golay acceptance test.

## The frontier

- **Nothing remains within scope.** Every milestone the README lists is proved. The README excludes decoding, cyclic and Reed-Solomon codes, theta series, glue tables and the Mathieu groups, so further work here is API polish or new roadmap material, not an open target.
- **Downstream use of the named lattices** — the Golay Construction A lattice and the `A₂` and `D₄` Lagrangians are packaged as input for explicit lattice constructions. Whether another roadmap uses them is outside this one.
