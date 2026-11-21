# Progress log: AnalyticNumberTheoryPartIII

An append-only record of what landed on the AnalyticNumberTheoryPartIII roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"88e3264366933af05c814972db0c268d9686911a","prs":[42855,42858],"roadmap":"AnalyticNumberTheoryPartIII","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
## AnalyticNumberTheoryPartIII: 2026-11-16 to 2026-11-19 (`88e3264` to `b235000`)

The first work on this roadmap fills in half of target 11.4, the Dirichlet series of the classical arithmetic functions. The Liouville series is now [summed](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Liouville.html#TauCeti.LSeriesHasSum_liouville): `Σ λ(n) n^{−s} = ζ(2s)/ζ(s)` on `Re s > 1`. So is Euler's totient, with [`Σ φ(n) n^{−s} = ζ(s − 1)/ζ(s)`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Totient.html#TauCeti.LSeriesHasSum_totient) on `Re s > 2` (TauCeti#42855, TauCeti#42858). Each comes with its exact region of absolute convergence, so the abscissas are pinned down as [one for `λ`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Liouville.html#TauCeti.abscissaOfAbsConv_liouville) and [two for `φ`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Totient.html#TauCeti.abscissaOfAbsConv_totient). The second confirms the roadmap's warning that a hypothesis `Re s > 1` would be wrong for the totient series.

The other two series in 11.4 have not landed: those of `2^ω` and of `μ²`, with their abscissas. Neither has the combined statement the roadmap names. Nothing has yet appeared for the other layers.
