# Progress log: PolylogarithmFunctions

An append-only record of what landed on the PolylogarithmFunctions roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"8b70b2e7062930a9fcc12c9bb574735e79b344dc","prs":[35267],"roadmap":"PolylogarithmFunctions","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
## PolylogarithmFunctions: 2026-11-10 to 2026-11-11 (`8b70b2e` to `1c6a1a4`)

The roadmap has begun with its foundational definition: the [principal polylogarithm](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Basic.html#TauCeti.Polylog.polylog) `Liₙ` in every integer weight, given by `z/(1−z)` in weight zero, `−Log(1−z)` in weight one, a logarithmic radial integral in weights two and up, and iterated Euler derivatives `z·d/dz` in negative weight (TauCeti#35267). The basic API around it pins the conventions: every weight [vanishes at zero](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Basic.html#TauCeti.Polylog.polylog_zero), [weight minus one is `z/(1−z)²`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Basic.html#TauCeti.Polylog.polylog_neg_one), weight one [matches Mathlib's logarithm series](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Basic.html#TauCeti.Polylog.hasSum_polylog_one) on the disc, and [`Li₁(3) = −log 2 − πi`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Basic.html#TauCeti.Polylog.polylog_one_three) fixes the lower boundary value on the cut. Nonpositive weights are shown [analytic on the plane minus 1](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Polylogarithm/Basic.html#TauCeti.Polylog.analyticOnNhd_polylog_neg_nat).

None of the analysis of weights two and up is there yet: integrability of the radial integrand, the disc series in general weight, holomorphy and the derivative recursion on the cut plane, and the zeta values at 1 all remain open, as does the explicit rational form of the negative weights.
