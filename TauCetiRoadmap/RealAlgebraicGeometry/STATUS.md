<!--tauceti-status:v1 {"roadmap":"RealAlgebraicGeometry","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Sturm-Tarski without the simple-root hypothesis, the Cauchy index, and one-sided and closed-endpoint versions","state":"partial"},{"id":"Layer 2","remaining":"Bezout identities, the gcd-degree criterion, reducta, signed normalization, and the Cauchy index formula","state":"partial"},{"id":"Layer 3","remaining":"recursive BKR reduction, whole-line sign determination, semialgebraic sets, uniform root descriptions","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"4e22960daa5e9be64435d2e9eacdf53d942bab345e59d52a611561d4a59a67d3","roadmap":"RealAlgebraicGeometry","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: RealAlgebraicGeometry

This file documents the status of the RealAlgebraicGeometry roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Most of the univariate foundations of Layer 1 are in place: ordered real closures, the algebra of real closed fields, IVT, Rolle, Sturm–Tarski and Thom encodings. Layers 2 and 3 have their first definitions and identities. Nothing yet exists for the multivariate and topological layers (4–8).

### Named results

- **Existence of ordered real closures** — every ordered field `K` has a real closed, algebraic, order-extending field extension in the same universe, with no countability or Archimedean hypothesis: [`exists_realClosure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/RealClosure/Basic.html#TauCeti.RealClosure.exists_realClosure).
- **The fundamental theorem of algebra for real closed fields** — adjoining `√-1` to any real closed field gives an algebraically closed field, so irreducible polynomials have degree at most two: [`isAlgClosed_quadraticAlgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/RealClosure/AlgebraicClosed.html#TauCeti.RealClosure.isAlgClosed_quadraticAlgebra).
- **Polynomial IVT and Rolle over real closed fields** — both are derived algebraically, so they hold over non-Archimedean fields too: [`exists_root_Ioo`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/RealClosure/IVT.html#Polynomial.exists_root_Ioo), [`polynomialRolle_of_isRealClosed`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/RealClosure/AbstractRolle.html#TauCeti.RealClosure.polynomialRolle_of_isRealClosed).
- **The Sturm–Tarski theorem** — the drop in sign variations of a signed remainder chain counts the roots of `p` weighted by the sign of `q`. It is proved on bounded intervals and on the [whole line](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Polynomial/Sturm/Infinity.html#TauCeti.Sturm.sum_sign_univ), but only when the roots of `p` in the interval are simple: [`Sturm.sum_sign`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Polynomial/Sturm/Tarski.html#TauCeti.Sturm.sum_sign).
- **Thom's lemma for root encodings** — the signs of a root's derivatives identify it uniquely, and the order of two roots can be read off where their encodings last differ: [`thomEncoding_injOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Polynomial/Thom.html#Polynomial.thomEncoding_injOn), [`lt_iff_thomEncoding`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Polynomial/Thom.html#Polynomial.lt_iff_thomEncoding).

### Notable definitions and infrastructure

- **Tarski queries and the BKR moment matrix.** [`tarskiQuery`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/RealAlgebraic/SignDetermination/Defs.html#Polynomial.tarskiQuery) satisfies the full ternary matrix identity. [Inverting that tensor matrix](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/RealAlgebraic/SignDetermination/Roots.html#Polynomial.fullInverse_mulVec_tarskiQuery) recovers the number of roots realizing each sign condition. This is the non-recursive core of sign determination.
- **Subresultants as Sylvester minors.** The [principal coefficients](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Polynomial/Subresultant/Basic.html#Polynomial.psc) and [subresultant polynomials](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Polynomial/Subresultant/Polynomial.html#Polynomial.subresultant) are defined at fixed formal degree bounds. They come with degree bounds, the block-swap sign, scaling and coefficient-map compatibility, and agreement with the resultant at index zero. These are the data the gcd criterion and the Collins projection will be stated in.
- **Signed remainder chains.** An abstract signed remainder sequence records the positive scalings, common-factor cancellation and the fact that the last entry is the gcd. Mathlib's `sturmSeq` is shown to be one, which lets Sturm–Tarski use Mathlib's sequence directly.

### Roadmap coverage

Layer 1 is partial. Real closure existence, the real closed field algebra (including the `IsRealClosed ℝ` bridge), IVT, Rolle, root signs at infinity, the remainder-sequence/gcd relation and the Thom encoding API are done. Missing are Sturm–Tarski without the simple-root hypothesis, the Cauchy index, and the one-sided endpoint and closed-interval versions. Layer 2 is partial: the fixed-bound definitions and their basic laws are done, but not Bézout identities, the gcd-degree criterion, signed normalization or permanences-minus-variations. Layer 3 is partial: only the full BKR identity and its inversion exist. The recursive reduction, whole-line sign determination, semialgebraic sets and uniform root descriptions are not there. Layers 4–8 are untouched.

## The frontier

- **Sturm–Tarski without squarefreeness** — remove the simple-root hypothesis from [`Sturm.sum_sign`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Polynomial/Sturm/Tarski.html#TauCeti.Sturm.sum_sign), probably through the Cauchy index and its Euclidean recurrence, and add the `[a,b]`, `(a,b]`, `[a,b)` endpoint forms.
- **The subresultant gcd criterion** — for nonzero polynomials at their actual degrees, the gcd's degree is the first index with a nonzero principal coefficient. This needs the Bézout identities first; Layer 5 depends on it.
- **Signed subresultants and Cauchy index** — `signedPsc` and the permanences-minus-variations formula for the Cauchy index of `q/p`, which depend on the Cauchy index still missing from Layer 1.
- **Recursive BKR sign determination** — restrict to realized columns, choose independent rows, and prove counts are preserved when a polynomial is adjoined. The full-matrix inversion is already in place.
- **Semialgebraic sets and root continuity** — the intrinsic Boolean-combination definition of Layer 3 and the multiplicity-sensitive root matching of Layer 4. Neither has been started, and both are needed before Collins delineability.
