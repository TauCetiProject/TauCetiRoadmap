# Progress log: TensorProductCombinatorics

An append-only record of what landed on the TensorProductCombinatorics roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"91c89984d30abdbc04d9f80af67356b8b917f3e9","prs":[33128],"roadmap":"TensorProductCombinatorics","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
## TensorProductCombinatorics: 2026-11-10 to 2026-11-11 (`91c8998` to `1c6a1a4`)

The roadmap's first code is the triangular lattice that hives will live on (TauCeti#33128). Its points are the nonnegative barycentric triples summing to n, packaged as [`Vertex`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hive/Lattice.html#TauCeti.Hive.Vertex) with a computable enumeration, the third-turn [rotation](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hive/Lattice.html#TauCeti.Hive.Vertex.rotate) and a [reflection](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hive/Lattice.html#TauCeti.Hive.Vertex.reflect), and an injective equilateral [planar embedding](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hive/Lattice.html#TauCeti.Hive.Vertex.plane) whose squared distances are half the barycentric ones. Unit rhombi are [`IsRhombus`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Hive/Lattice.html#TauCeti.Hive.IsRhombus), recorded in perimeter order with the obtuse corners singled out so that the hive inequality can later be read off directly; the diagonals have the expected planar squared lengths 1 and 3, and rhombi are preserved by rotation, reflection and translation into a larger triangle.

This is lattice geometry only. Hives themselves, their boundaries and the rhombus inequalities, and everything built on them, have not started.
