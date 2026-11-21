<!--tauceti-status:v1 {"roadmap":"TemperleyLiebOperatorAlgebras","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"1.7 blocks and braid units; 1.8 cubic model at sqrt 3; 1.6 Potts-FK identity; comparisons 1.1-1.4; 1.5 Powers-state comparison","state":"partial"},{"id":"Layer 2","remaining":"the sign isomorphism and markovTrace_neg_one_pow_nonneg_iff","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"}],"readme_sha":"92657fafa5a387572677dc7fc2ff95cb1245ef53580848b14b9c7db691721529","roadmap":"TemperleyLiebOperatorAlgebras","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: TemperleyLiebOperatorAlgebras

This file documents the status of the TemperleyLiebOperatorAlgebras roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** One of the roadmap's finite realisations is proved: the Jones quotient at `δ = √2` is the even Clifford algebra, with generators, traces, adjoints and strand inclusions matched. The rest of Layer 1 has barely started, and the sign isomorphism (Layer 2), the unitary Temperley–Lieb category (Layer 3) and the affine theory (Layer 4) have not begun.

### Named results

- **The even Clifford model at `δ = √2`** — for every Markov trace at `√2` there is a surjective, adjoint-preserving map from the `m`-strand Temperley–Lieb algebra onto the even complex Clifford algebra, sending `e_j` to `√2` times a Clifford projection, matching the Markov trace with `(√2)^m` times the scalar trace, and with kernel the trace radical ([`exists_evenCliffordModel`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/EvenClifford/Quotient.html#TauCeti.TemperleyLieb.exists_evenCliffordModel)). This is one of the roadmap's end theorems, with the adjoint included, which the target statement left out.
- **The Jones quotient at `√2` as an even Clifford algebra** — the quotient of the Temperley–Lieb algebra by the trace radical is isomorphic to the even Clifford algebra, compatibly with the trace and the strand inclusions ([`quotientEvenCliffordEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/EvenClifford/Quotient.html#TauCeti.TemperleyLieb.IsMarkovTrace.quotientEvenCliffordEquiv)), so it has [dimension `2^(m-1)`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/EvenClifford/Quotient.html#TauCeti.TemperleyLieb.IsMarkovTrace.finrank_quotient_traceRadical_sqrt_two). The quotient here is the algebraic trace-radical quotient; its identification with Subfactors 3.3's C*-quotient `Q_m` is not stated.
- **Positivity of the Markov trace at `√2`** — `tr(x† x) ≥ 0` on every number of strands, read off from faithfulness of the Clifford scalar trace ([`map_star_mul_self_nonneg_sqrt_two`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/EvenClifford/Quotient.html#TauCeti.TemperleyLieb.IsMarkovTrace.map_star_mul_self_nonneg_sqrt_two)), an independent check of one discrete-series case of Jones's positivity theorem.

### Notable definitions and infrastructure

- **The analytic adjoint on the complex Clifford algebra** ([`cliffordAdjoint`](https://taucetiproject.org/docs/TauCeti/Algebra/TemperleyLieb/EvenClifford/Basic.html#TauCeti.TemperleyLieb.cliffordAdjoint)) — the conjugate-linear, product-reversing involution fixing the Majorana generators, with the scalar trace faithful for it. It is what makes the Clifford projections genuine projections, and the 1.8 cubic model will need the same kind of structure.
- **Even Clifford dimension and trace nondegeneracy** — [the even Clifford algebra has dimension `2^(n-1)`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Dimension.html#CliffordAlgebra.finrank_even) over any field, and [the scalar-trace pairing on it is nondegenerate](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/CliffordAlgebra/ScalarTrace/Radical.html#CliffordAlgebra.forall_even_scalarTrace_mul_eq_zero_iff) for a nondegenerate form. These are general Clifford-algebra facts, usable beyond this roadmap.

### Roadmap coverage

Layer 1 is partial. In 1.7 the comparison map, its surjectivity, the trace identity, the kernel, and the adjoint and inclusion compatibilities are proved. The blocks, Pauli realisation, path-label identification, expectation, Jones's generator convention and the braid units are not. In 1.5 the spin representation is known to carry the adjoint to the conjugate transpose, but the projection `p_t`, the product state and the Powers comparison are absent. The comparisons 1.1–1.4 wait on the diagram category, cell modules and negligible ideal of TemperleyLieb Layers 3–7, and 1.6 (Potts and Fortuin–Kasteleyn) and 1.8 (the `√3` cubic model) have nothing yet. Layers 2, 3 and 4 are untouched.

## The frontier

- **Blocks and braid image at `√2`** — the matrix-block decomposition with its Pauli realisation, and the braid units `g_j = −(1 + d_j)/√2` with a braid image of order `2^m m!`. These need the structure of complex Clifford algebras from SpinRepresentations Layers 0–1. The braid units themselves need nothing new.
- **The cubic model at `δ = √3`** — `exists_cubicFixedModel` and `finite_gaussianBraid_closure` (1.8), the other two finite realisations among the end theorems. They are already statable on Tau Ceti's twisted monoid algebras.
- **Positivity at negative loop parameters** — the sign isomorphism `TL_n(δ) ≅ TL_n(−δ)` and `markovTrace_neg_one_pow_nonneg_iff` (2.1). Jones's positivity theorem for `δ > 0` is already in Tau Ceti, so this looks like the nearest Layer 2 target.
- **The Potts–Fortuin–Kasteleyn identity** — `pottsPartition_eq_fkPartition` (1.6) needs only finite graphs and partition-function adapters.
- **Comparisons 1.1–1.4 and Layers 3–4** — blocked on TemperleyLieb's diagram category, `presentedTLEquiv`, cell modules and negligible ideal, and for Layer 3 on CategoricalOperatorAlgebras' dagger tensor interfaces.
