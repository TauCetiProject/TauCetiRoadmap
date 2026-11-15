# Progress log: SNumbers

An append-only record of what landed on the SNumbers roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"8c42da5f2edabe28cb5fe278606d6f03fa5c4867","prs":[33152,33658],"roadmap":"SNumbers","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
## SNumbers: 2026-11-09 to 2026-11-11 (`8c42da5` to `1c6a1a4`)

The s-numbers roadmap has made its first move. Pietsch's axioms are now in place as [`IsSNumberSequence`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Basic.html#TauCeti.SNumbers.IsSNumberSequence): an s-number sequence starts at the operator norm and decreases, is stable under perturbation and two-sided composition, vanishes at index `n` on operators of rank at most `n`, and is normalized on the Euclidean identities. Beside it sits the strict variant [`IsStrictSNumberSequence`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Basic.html#TauCeti.SNumbers.IsStrictSNumberSequence), which normalizes the identity of every normed space below its dimension, infinite dimension included. The elementary consequences every sequence shares follow from the axioms: the norm bound, Lipschitz continuity in the operator, and absolute homogeneity (TauCeti#33152).

The approximation numbers, taken from the operator-ideals library, [form a strict s-number sequence](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Approximation.html#TauCeti.SNumbers.isStrictSNumberSequence_approximation) over every nontrivially normed field. The roadmap expected this to need a complete scalar field for Riesz's lemma, but the proof here gets by on a rank–nullity argument and needs neither a complete field nor a complete space (TauCeti#33658). The [upper half of the extremal sandwich](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/SNumbers/Approximation.html#TauCeti.SNumbers.IsSNumberSequence.le_singularValue) also landed: every s-number sequence lies below the approximation numbers. The other four classical sequences (Gelfand, Kolmogorov, Bernstein and Hilbert numbers) and the entropy numbers have not been started.
