<!--tauceti-status:v1 {"roadmap":"PadicMeasuresIwasawaAlgebras","to_sha":"68a457ec2b1aee486f4192ee3ea36a04f70efb8c","ts":"2026-10-20T05:58:24Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"unit coordinates of measures on Z_p units, the homeomorphism clause of the comparison, finite free base change","state":"partial"},{"id":"Layer 2","remaining":"phi and psi on power series, root-of-unity averaging, bounded Amice norm, unit measures inside measures on Z_p, residue projections","state":"partial"},{"id":"Layer 3","remaining":"positive pseudo-moments and evaluation at characters of the units (3.2-3.3)","state":"partial"},{"id":"Layer 3a","state":"untouched"},{"id":"Layer 4","remaining":"pseudo-isomorphism, structure theorem, height-one primes of Lambda, mu and lambda, characteristic ideals, growth formula","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"e6d4333167578933731d5a2542a702d15b8f16b05abfe38157e71d9a88aa7fcf","roadmap":"PadicMeasuresIwasawaAlgebras","to_sha":"68a457ec2b1aee486f4192ee3ea36a04f70efb8c"}-->
# Status: PadicMeasuresIwasawaAlgebras

This file documents the status of the PadicMeasuresIwasawaAlgebras roadmap up until `68a457e` (2026-10-20T05:58:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0, the theory of measures on a compact space, is done. The comparison of integral measures with the completed group algebra holds as an algebra isomorphism. Layers 1–4 are partial: each has its foundations in, but the unit coordinates, most of the Mahler–Amice operator calculus, evaluation at characters and the whole structure theory of Λ-modules remain. Layers 3a, 5 and 6 have not begun.

### Named results

- **Measures are the completed group algebra** — for a profinite group Γ, integral measures D(Γ, ℤ_p) and ℤ_p[[Γ]] are [isomorphic ℤ_p-algebras](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/CompletedGroupAlgebra.html#AbstractMeasure.completedGroupAlgebraEquiv) via the [comparison map](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/CompletedGroupAlgebra.html#AbstractMeasure.toCompletedGroupAlgebra), which is continuous from the weak topology.
- **Multiplication by x is the Mahler derivation** — the Amice transform of x·μ is [(1+T)d/dT applied to A_μ](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/Moments.html#AbstractMeasure.amiceTransform_weight_id), so the k-th moment is [k! times the k-th coefficient of A_μ(e^T − 1)](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/Moments.html#AbstractMeasure.ordinaryMoment_eq_factorial_coeff).
- **Division by x on the units** — an integral measure supported on ℤ_pˣ is [x·ν for a unique such ν](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/InverseWeight.html#AbstractMeasure.existsUnique_unitSupported_div_id) (RJW (4-3)).
- **Admissible evaluation of pseudo-measures** — every pseudo-measure has an [evaluation that is unique](https://taucetiproject.org/docs/TauCeti/RingTheory/Iwasawa/Pseudomeasure.html#TauCeti.Iwasawa.existsUnique_evalAt) and independent of the clearing element.
- **Pseudo-null means finite** — over a two-dimensional noetherian local ring with finite residue field, such as O⟦T⟧, a finitely generated module is [pseudo-null exactly when it is finite](https://taucetiproject.org/docs/TauCeti/RingTheory/Iwasawa/PseudoNull.html#TauCeti.Iwasawa.isPseudoNull_iff_finite).

### Notable definitions and infrastructure

- **Finite coordinates of measures.** A measure on a profinite space is [determined by its binary projections](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/FiniteProjection.html#AbstractMeasure.finiteProjection_ext). Together with descent of locally constant functions through a [tower of finite quotients](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/QuotientTower.html#TauCeti.FiniteQuotientTower), this is what the comparison theorem is built from.
- **[Extension of coefficients](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/ExtendCoefficients.html#AbstractMeasure.extendCoefficients)** from O-valued to K-valued measures, with norm at most one. It is the bridge Layer 3a will use to evaluate O-measures at C_p-valued characters.
- **[Regularity of power series rings](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/PowerSeries.html#TauCeti.PowerSeries.isRegularLocalRing)** over a regular local ring. This gives the regular local structure of Λ = O⟦T⟧ that opens §4.3.

### Roadmap coverage

Layer 0 is done: clopen restriction and decomposition, weak and strong closed embeddings and homeomorphisms, Dirac separation, the non-compact unit ball, and rational test scaling. Layer 1 is partial. Finite projections, the finite measure algebras, the finite quotients of ℤ_pˣ, character integrals and the completed-group-algebra isomorphism are in. Missing are the unit coordinates (§1.4–1.5), the homeomorphism clause of §1.7 and finite free base change. Layer 2 is partial. Moments and the Mahler derivation (§2.1), restriction to pℤ_p and to ℤ_pˣ, division by x (§2.3) and the Cartier operators (§2.9) are in. Missing are φ/ψ on power series, root-of-unity averaging, the bounded Amice norm, unit measures inside measures on ℤ_p, and §2.10–2.12. Layer 3 has §3.1 done, while §3.2–3.3 (positive moments, the non-extension of total mass, characters of ℤ_pˣ) are untouched. Layer 4 has pseudo-null modules and Λ's regularity, but no pseudo-isomorphism, structure theorem, Weierstrass ring theory, μ/λ, characteristic ideals or growth formula. Layers 3a, 5 and 6 are untouched.

## The frontier

- **Unit coordinates of measures (§1.4–1.5)** — ℤ_pˣ is already presented by its finite quotients (ℤ/p^n)ˣ. What remains is the coordinate description of D(ℤ_pˣ, R) and its weak closed embedding. Layer 2's unit domain and §3.2 depend on it.
- **Homeomorphism and base change in §1.7** — the remaining work is upgrading the comparison isomorphism to a weak-to-inverse-limit homeomorphism, and proving O ⊗ D(Γ, ℤ_p) ≅ D(Γ, O) for finite free O.
- **φ and ψ on power series (§2.2, §2.6)** — restriction to pℤ_p is in, but the transport of φ and ψ through the Amice transform is not. Neither is the identification of unit measures with ker ψ. Both rest on PadicFunctionalAnalysis §3.4.
- **Evaluation at characters of ℤ_pˣ (§3.2–3.3)** — this needs the unit coordinates and the regularity of δ_{1+p} − 1. The abstract evaluation is already in place.
- **Pseudo-isomorphism and the structure theorem (§4.1–4.2)** — this needs the height-one primes of Λ via Weierstrass preparation, which is supplied by NewtonPolygons §6.3 and has not yet been contributed.
