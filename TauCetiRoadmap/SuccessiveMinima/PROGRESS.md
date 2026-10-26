# Progress log: SuccessiveMinima

An append-only record of what landed on the SuccessiveMinima roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"842d789dcea476794c214748c7a39161ca8b84fc","prs":[21412],"roadmap":"SuccessiveMinima","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3"}-->
## SuccessiveMinima: 2026-10-26 to 2026-10-26 (`842d789` to `938acbb`)

The first piece of this roadmap is in: the [volume of a weighted cross-polytope](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/Lebesgue/WeightedCrosspolytope.html#OrthonormalBasis.volume_weighted_crosspolytope) (TauCeti#21412). For an orthonormal basis `o`, any real basis `b` and positive weights `a_i`, the body `Σ a_i·|b.repr(x)_i| ≤ 1` has canonical Euclidean volume `(2^n/n!)·|det_o(b)|/∏ a_i`, including the empty case. This is target 2.1.1, stated over any finite index type rather than `Fin n`, and it is the volume computation in the lower half of Minkowski's second theorem. The other two ingredients of that proof, containment of the cross-polytope in the body and the covolume bound by a basis determinant, have not landed, and nor has the minima calculus of Layer 1 it relies on.
