# Progress log: SobolevPolynomialApproximation

An append-only record of what landed on the SobolevPolynomialApproximation roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"753063010dc631845f9f8e19a65ae1a38c6dcbc2","prs":[34779],"roadmap":"SobolevPolynomialApproximation","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
## SobolevPolynomialApproximation: 2026-11-10 to 2026-11-11 (`7530630` to `1c6a1a4`)

The roadmap's first piece of its own landed: the space [`polynomialsDegLE`](https://taucetiproject.org/docs/TauCeti/Analysis/MvPolynomial/PolynomialSpace.html#TauCeti.polynomialsDegLE) of real polynomial functions of total degree at most `m` on Euclidean space, defined as the image of the formal bounded-degree polynomials under [evaluation](https://taucetiproject.org/docs/TauCeti/Analysis/MvPolynomial/PolynomialSpace.html#TauCeti.polynomialEvalₗ) (TauCeti#34779). Evaluation is [injective](https://taucetiproject.org/docs/TauCeti/Analysis/MvPolynomial/PolynomialSpace.html#TauCeti.polynomialEvalₗ_injective), so the space is [linearly equivalent](https://taucetiproject.org/docs/TauCeti/Analysis/MvPolynomial/PolynomialSpace.html#TauCeti.restrictTotalDegreeEquivPolynomialsDegLE) to its formal counterpart, and its [dimension](https://taucetiproject.org/docs/TauCeti/Analysis/MvPolynomial/PolynomialSpace.html#TauCeti.finrank_polynomialsDegLE) is the binomial coefficient `(m + n).choose n`. Small sanity lemmas pin down the conventions the README asks for: degree zero means exactly the constants, and a coordinate function belongs exactly when the degree bound is positive. The statements are for an arbitrary finite coordinate type rather than only `Fin n`.

This is §1.2 of Layer 1, and these are still functions on the whole space. Their Sobolev classes on a domain, the seminorms, the polynomial Poincaré lemma and the kernel of the top seminorm are next in line.
