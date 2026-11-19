# Progress log: HomotopySpheres

An append-only record of what landed on the HomotopySpheres roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"cbcf10edb31450c5ea5e2b0f8229f7005ed65ecd","prs":[38969],"roadmap":"HomotopySpheres","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
## HomotopySpheres: 2026-11-13 to 2026-11-13 (`cbcf10e` to `aa6e43e`)

The first work for this roadmap is a small algebraic ingredient for the positive half of the parallelizable-spheres theorem, which says that Sⁿ has a smooth tangent frame exactly when n is 1, 3 or 7. Any Clifford module over a negative-definite Clifford algebra with a finite orthogonal basis squaring to −1 carries a [positive-definite symmetric form making every Clifford vector skew-adjoint](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Module/Metric.html#AlgHom.exists_posDef_isSymm_isSkewAdjoint_map_cliffordAlgebraι). It comes from averaging a starting form over the finite group of signed monomials, and needs neither irreducibility nor faithfulness. A companion lemma says that a skew-adjoint vector [scales the form by −Q(v)](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Module/Metric.html#AlgHom.bilinForm_map_cliffordAlgebraι_apply_map_cliffordAlgebraι_apply) when it acts on both arguments (TauCeti#38969). Over the reals, these are the facts that make the fields Aᵢx orthonormal and tangent on the unit sphere. The frames themselves are not built yet: that still needs the modules of dimensions 2, 4 and 8 and the tangent trivialization on the sphere.
