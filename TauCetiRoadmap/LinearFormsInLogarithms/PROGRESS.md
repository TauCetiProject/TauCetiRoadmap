# Progress log: LinearFormsInLogarithms

An append-only record of what landed on the LinearFormsInLogarithms roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"0afe3c390ab2b64c9d684d4a9b889af969f56f39","prs":[35370],"roadmap":"LinearFormsInLogarithms","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
## LinearFormsInLogarithms: 2026-11-10 to 2026-11-11 (`0afe3c3` to `1c6a1a4`)

The first piece of this roadmap's analysis in several variables is target 0.2, sums of power series. The new theorem [`hasFPowerSeriesOnBall_tsum`](https://taucetiproject.org/docs/TauCeti/Analysis/Analytic/InfiniteSum.html#TauCeti.hasFPowerSeriesOnBall_tsum) says that a family of functions with power series on a common ball can be summed term by term. The condition is that the coefficient norms, weighted by the radius to the degree, are summable over degree and index together. The sum then has the summed series as its power series on the same ball, so it is analytic at the centre. The index set is arbitrary and the domain need not be finite-dimensional. This is the interchange of summations that 0.3 needs to turn a normally convergent multi-index series into a power series. The multi-index coefficients themselves have not been started.
