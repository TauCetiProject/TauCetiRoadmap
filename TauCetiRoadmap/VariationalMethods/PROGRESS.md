# Progress log: VariationalMethods

An append-only record of what landed on the VariationalMethods roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"a7fe63eee06aa3a088eac79a98dbe6431e75d8dd","prs":[39025],"roadmap":"VariationalMethods","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
## VariationalMethods: 2026-11-13 to 2026-11-13 (`a7fe63e` to `aa6e43e`)

The roadmap opens with the direct method of the calculus of variations in its topological form ([`exists_isMinOn_of_weak_closed`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Variational/DirectMethod.html#TauCeti.exists_isMinOn_of_weak_closed)): an energy that is lower semicontinuous for the weak topology and has norm-bounded sublevels attains its minimum on any nonempty weakly closed set in a reflexive space (TauCeti#39025). No lower bound on the energy is assumed, since one nonempty bounded sublevel is weakly compact and supplies it. The proof works over any proper nontrivially normed field, with values in any linear order. Along the way the sublevels and the whole set of minimizers are shown to be weakly compact ([`isCompact_toWeakSpace_minimizers`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Variational/DirectMethod.html#TauCeti.isCompact_toWeakSpace_minimizers)).

The supporting work is the bounded-sublevel predicate [`HasBoundedSublevelsOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Variational/BoundedSublevels.html#TauCeti.HasBoundedSublevelsOn), relative to an admissible set. It is characterized by sequences, by divergence of the energy at infinity and by a quantitative lower bound outside large balls, and it is stable under shrinking the set, positive scaling and adding an energy bounded below. What Layer 1 still lacks is the sequential direct method, the characterization of weak lower semicontinuity by sublevels, the sequential-closure form of Eberlein–Šmulian, the real/complex dictionary, convex energies and compact maps on bounded sets.
