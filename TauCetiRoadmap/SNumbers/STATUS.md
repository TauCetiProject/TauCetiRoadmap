<!--tauceti-status:v1 {"roadmap":"SNumbers","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"Pietsch's lifting identity SN-A14, Kolmogorov s-numbers over non-complete fields, and Milestone A4 (metric injections/surjections, SN-A21 to SN-A24)","state":"partial"},{"id":"Part B","remaining":"scalar factorization, uniqueness on Hilbert spaces, the lower bound by Hilbert numbers, compactness criteria, Bernstein comparisons","state":"partial"},{"id":"Part C","state":"untouched"},{"id":"Part D","state":"untouched"},{"id":"Part E","state":"untouched"}],"readme_sha":"dc9f4f51f3dc11bad12c5e463e7fb9690d27f9613741b09b9211937cd270d0fe","roadmap":"SNumbers","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: SNumbers

This file documents the status of the SNumbers roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five classical s-number sequences are now defined, and each is proved to satisfy Pietsch's axioms, so Milestones A1 and A3 are done and A2 lacks only the lifting identity. Injectivity and surjectivity (A4) have not begun. In Part B only the upper half of the sandwich is proved. The inequalities, the entropy numbers and the examples (Parts C–E) have not begun.

### Named results

- **Gelfand, Bernstein and Kolmogorov numbers are strict s-number sequences** — they satisfy the axioms and equal 1 on the identity of every normed space below its dimension. For the [Gelfand](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Gelfand.html#TauCeti.SNumbers.isStrictSNumberSequence_gelfand) and [Bernstein](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Bernstein.html#TauCeti.SNumbers.isStrictSNumberSequence_bernstein) numbers this holds over any nontrivially normed field, and for the [Kolmogorov](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Kolmogorov.html#TauCeti.SNumbers.isStrictSNumberSequence_kolmogorov) numbers over a complete one.
- **Hilbert numbers are an s-number sequence** — over ℝ or ℂ, the supremum of the approximation numbers of compressions through `ℓ₂` satisfies Pietsch's axioms; [`isSNumberSequence_hilbert`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Hilbert.html#TauCeti.SNumbers.isSNumberSequence_hilbert).
- **Approximation numbers are a strict s-number sequence** — over every nontrivially normed field, with no completeness hypothesis, which is weaker than the roadmap expected; [`isStrictSNumberSequence_approximation`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Approximation.html#TauCeti.SNumbers.isStrictSNumberSequence_approximation).
- **Approximation numbers are the largest s-numbers** — `sₙ(T) ≤ aₙ(T)` for every s-number sequence, the upper half of the sandwich `hₙ ≤ sₙ ≤ aₙ`; [`IsSNumberSequence.le_singularValue`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Approximation.html#TauCeti.SNumbers.IsSNumberSequence.le_singularValue).
- **Pietsch's embedding identity** — over ℝ or ℂ, `cₙ(T)` is the approximation number of `T` followed by evaluation on the dual unit ball of the target, with no completeness assumed. It is in the library as `singularValue_dualBallEmbedding_comp`, outside the work recorded for this roadmap.

### Notable definitions and infrastructure

- **Pietsch's axioms and their strict form** — [`IsSNumberSequence`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Basic.html#TauCeti.SNumbers.IsSNumberSequence) and [`IsStrictSNumberSequence`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Basic.html#TauCeti.SNumbers.IsStrictSNumberSequence). The [constructor](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Basic.html#TauCeti.SNumbers.IsStrictSNumberSequence.of_normalize_of_lt_rank) takes the first four axioms plus normalization below the dimension, and it proved strictness for the approximation, Kolmogorov and Bernstein numbers.
- **The unit-ball form of the Kolmogorov numbers** — [`kolmogorovNumber_eq_iInf_sSup_infNndist`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Kolmogorov.html#ContinuousLinearMap.kolmogorovNumber_eq_iInf_sSup_infNndist) gives `dₙ` as the deviation of the image of the unit ball from `n`-dimensional subspaces. The covering estimates and compactness criteria of Part B start from this form.
- **The ratio form of the Hilbert numbers** — [`hilbertNumber_eq_iSup_div`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Hilbert.html#ContinuousLinearMap.hilbertNumber_eq_iSup_div) removes the contraction constraint, which makes it convenient for comparing `hₙ` with other sequences.

### Roadmap coverage

**Part A is partial.**
- Milestone A1 (`SN-A01`–`SN-A07`) is done, as is Milestone A3 (`SN-A16`–`SN-A20`).
- Milestone A2 is done except Pietsch's lifting identity `SN-A14`. `SN-A12` holds only over complete scalar fields, where the roadmap asks for any nontrivially normed field.
- Milestone A4 (`SN-A21`–`SN-A24`) is untouched.

**Part B is partial:** only `SN-B01` is proved.

**Parts C, D and E are untouched.**

## The frontier

- **Injectivity and surjectivity** (Milestone A4) — define metric injections and surjections, then prove that `cₙ` is injective and `dₙ` is surjective. The norm of the quotient map has just landed, and `SN-A14` and `SN-B12` both wait on this milestone.
- **Pietsch's lifting identity** (`SN-A14`) — `dₙ(T) = aₙ(T ∘ Q_X)` for the summation surjection `Q_X : ℓ₁(B_X) → X`, over a complete densely normed field. It needs `SN-A24`.
- **Bernstein below Gelfand** (`SN-B11`) — `bₙ ≤ cₙ` over any nontrivially normed field. Both definitions now exist, and the proof is a dimension count.
- **The sandwich and uniqueness on Hilbert spaces** (`SN-B02`–`SN-B05`) — the scalar factorization through `ℓ₂^{n+1}` from the min–max theory gives `sₙ = aₙ` on Hilbert spaces. Since the Hilbert numbers now exist, that would then give the lower bound `hₙ ≤ sₙ`.
- **The maximal difference theorem** (Milestone C2) — `aₙ ≤ e (n+1) hₙ` through the determinant quantities `Δ_k`. Its prerequisite, the Hilbert numbers, is in place, but none of the determinant machinery has started.
