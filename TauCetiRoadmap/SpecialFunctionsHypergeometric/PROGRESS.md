# Progress log: SpecialFunctionsHypergeometric

An append-only record of what landed on the SpecialFunctionsHypergeometric roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"6bcc2f687ab163c6cf9920ad6305ab44dc143239","prs":[36492,36494],"roadmap":"SpecialFunctionsHypergeometric","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
## SpecialFunctionsHypergeometric: 2026-11-11 to 2026-11-13 (`6bcc2f6` to `aa6e43e`)

The roadmap's first results lay the ground for its definition of the Gauss function: Euler's integral, normalized by `(Γ(b) Γ(c − b))⁻¹` so that it should represent the regularized function `𝐅(a, b; c; z)` of DLMF 15.6.1, now exists as [`eulerIntegral`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hypergeometric/EulerIntegral.html#Complex.eulerIntegral) (TauCeti#36494). Its integrand is [integrable](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hypergeometric/EulerIntegral.html#Complex.intervalIntegrable_eulerIntegrand) for `0 < Re b < Re c` and every `z` with `1 − z` in the slit plane, and the normalized integral is [jointly holomorphic in `(a, z)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hypergeometric/EulerIntegral.html#Complex.analyticOnNhd_eulerIntegral) on the cut plane, for fixed `b` and `c` in that region. It takes the [value `Γ(c)⁻¹` at `z = 0`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hypergeometric/EulerIntegral.html#Complex.eulerIntegral_zero), by the Beta integral, and the supporting fact that `1 − tz` stays off the cut for `t ∈ [0, 1]` went into the slit-plane API.

This is the start of 1.1 and not yet all of it. Holomorphy is proved only in `(a, z)`, not in all four variables `(a, b, c, z)` as the roadmap asks, and the agreement of the integral with Mathlib's series on the unit disk is still to come. Neither the principal branch `regularizedGaussHypergeometric` nor its uniqueness and shift-relation existence argument has been started.
