# Progress log: Foams

An append-only record of what landed on the Foams roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"6ffddaf3d8d33aae3646694b72ee2170b818c26f","prs":[36521],"roadmap":"Foams","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
## Foams: 2026-11-11 to 2026-11-13 (`6ffddaf` to `aa6e43e`)

The first foam result is in: [Frobenius reconstruction](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Algebra/Frobenius/Coalgebra.html#TauCeti.existsUnique_frobeniusCoalgebra), the Section 0.8 headline from the roadmap's acceptance tests. It says that a perfect trace ε on a finite commutative algebra determines exactly one coalgebra structure with counit ε that satisfies the Frobenius law (TauCeti#36521). The proof is more general than the target: it assumes a finite projective algebra over a commutative semiring rather than a finite free one over a ring. The comultiplication is [built](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Algebra/Frobenius/Coalgebra.html#LinearMap.frobeniusCoalgebra) without choosing a basis, by transposing multiplication through the trace pairing. The familiar dual-basis formula, Δ(a) as a sum over a basis and its [trace-dual basis](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Algebra/Frobenius/Coalgebra.html#LinearMap.traceDualBasis), is then [proved for every finite basis](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Algebra/Frobenius/Coalgebra.html#LinearMap.frobeniusCoalgebra_comul_eq_sum), so independence of the basis comes for free.

The rest of Section 0.8 is still open: transport along trace-preserving isomorphisms, tensor products and scalar extension, the handle element, the even-graded version, and the check that the reconstructed coproduct on the dual numbers is the chosen Khovanov one. Nothing has yet landed for webs, prefoams, evaluations or the higher-categorical layers.
