<!--tauceti-status:v1 {"roadmap":"SNumbers","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Part A","remaining":"Gelfand, Kolmogorov, Bernstein and Hilbert numbers with lifting/embedding identities and injectivity/surjectivity (A2-A4)","state":"partial"},{"id":"Part B","remaining":"scalar factorization, uniqueness on Hilbert spaces, the lower bound by Hilbert numbers, compactness criteria, Bernstein bounds","state":"partial"},{"id":"Part C","state":"untouched"},{"id":"Part D","state":"untouched"},{"id":"Part E","state":"untouched"}],"readme_sha":"257327b8a6873c0ba6e838035e6c15dfa439ecf409a9c5dbebe60b46e4ebff78","roadmap":"SNumbers","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
# Status: SNumbers

This file documents the status of the SNumbers roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The axioms are in place, and so is their first model, the approximation numbers, which form a strict s-number sequence. That completes Milestone A1. One step of Part B is also proved: every s-number sequence lies below the approximation numbers. The Gelfand, Kolmogorov, Bernstein, Hilbert and entropy numbers have not been started, so neither have the inequalities and examples built on them.

### Named results

- **Approximation numbers are a strict s-number sequence** — over every nontrivially normed field, the approximation numbers satisfy all of Pietsch's axioms and are normalized on the identity of every normed space below its dimension; [`isStrictSNumberSequence_approximation`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Approximation.html#TauCeti.SNumbers.isStrictSNumberSequence_approximation). The roadmap asked for a complete scalar field here, but the proof goes through rank–nullity and needs no completeness.
- **Approximation numbers are the largest s-numbers** — `sₙ(T) ≤ aₙ(T)` for every s-number sequence and every operator, the upper half of the sandwich `hₙ ≤ sₙ ≤ aₙ`; [`IsSNumberSequence.le_singularValue`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Approximation.html#TauCeti.SNumbers.IsSNumberSequence.le_singularValue).

### Notable definitions and infrastructure

- **Pietsch's axioms** — [`IsSNumberSequence`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Basic.html#TauCeti.SNumbers.IsSNumberSequence), on the one-universe family type [`SNumberFamily`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Basic.html#TauCeti.SNumbers.SNumberFamily). It already proves the shared calculus (norm bound, continuity, homogeneity), so each new sequence only has to verify the axioms.
- **Strict s-numbers** — [`IsStrictSNumberSequence`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Basic.html#TauCeti.SNumbers.IsStrictSNumberSequence), with a [constructor](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Basic.html#TauCeti.SNumbers.IsStrictSNumberSequence.of_normalize_of_lt_rank) that takes the first four axioms plus normalization below the dimension. This is the form the Gelfand, Kolmogorov and Bernstein numbers will need.

### Roadmap coverage

Part A is partial. Milestone A1 (`SN-A01`–`SN-A07`) is done, though the approximation family is built directly on `singularValue` and not under the README's name `approximationNumber`. Milestones A2–A4 (the other four sequences, the lifting and embedding identities, injectivity and surjectivity) are untouched. Part B is partial: only `SN-B01` is proved. Parts C (inequalities, the maximal difference theorem, duality), D (entropy numbers) and E (the `ℓ_p^m` and `ℓ₁ → ℓ_∞` examples) are untouched.

## The frontier

- **Gelfand and Kolmogorov numbers** (Milestone A2) — define `cₙ` and `dₙ` and verify that they are strict. Pietsch's lifting identity needs the summation surjection from `ℓ₁(B_X)`, and his embedding identity needs Hahn–Banach over `RCLike`.
- **Bernstein and Hilbert numbers** (Milestone A3) — define `bₙ` and `hₙ` and verify the axioms. The Hilbert numbers are only an s-number sequence, not a strict one.
- **The sandwich and uniqueness on Hilbert spaces** (Milestone B1) — the scalar factorization `SN-B02` comes from the operator-ideals min–max theory. It gives `sₙ = aₙ` on Hilbert spaces, then the lower bound `hₙ ≤ sₙ` once the Hilbert numbers exist.
- **Entropy numbers** (Milestone D1) — the covering definition and its index laws use only the norm, so they do not wait on Parts B and C.
- **The maximal difference theorem** (Milestone C2) — `aₙ ≤ e (n+1) hₙ` through the determinant quantities `Δ_k`. It needs the Hilbert numbers first.
