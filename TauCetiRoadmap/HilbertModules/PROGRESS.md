# Progress log: HilbertModules

An append-only record of what landed on the HilbertModules roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"ec6d3d6ffcbcf327386e942258d3f6948b1ae351","prs":[33590,33671],"roadmap":"HilbertModules","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
## HilbertModules: 2026-11-09 to 2026-11-11 (`ec6d3d6` to `1c6a1a4`)

The Hilbert-module roadmap has its first results, both from the opening layer H1. A finite family in a right Hilbert C*-module now has a [Gram matrix](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Gram.html#CStarMatrix.gram) of inner products, and that matrix is [positive](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Gram.html#CStarMatrix.gram_nonneg) in the C*-algebra of matrices over the coefficients (TauCeti#33590). The proof goes through the finite-sum quadratic-form criterion, which says that a matrix over a C*-algebra is [positive exactly when all its quadratic forms are](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/CStarMatrix.html#CStarMatrix.nonneg_iff_forall_sum_nonneg). Around it, the `CStarMatrix` type gained the real functional-calculus and scalar-tower instances it was missing. Gram positivity is what the roadmap later uses for positivity on interior tensor products and for the comparison between frames and projections.

The second piece is the basic example. A C*-algebra A is now a [right Hilbert module over itself](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Self.html#CStarModule.instMulOpposite), with inner product a*b, and this module is [full](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Module/Self.html#CStarModule.topologicalClosure_span_range_unop_inner_mulOpposite). The construction is separate from Mathlib's left self-module, as the README requires, and a compatibility lemma relates the two through the opposite algebra.
