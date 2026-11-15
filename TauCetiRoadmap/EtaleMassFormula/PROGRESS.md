# Progress log: EtaleMassFormula

An append-only record of what landed on the EtaleMassFormula roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"96bf5482480e1a939f672935784faba7e6f2c45f","prs":[28752,28766,28831,31882],"roadmap":"EtaleMassFormula","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
## EtaleMassFormula: 2026-11-06 to 2026-11-09 (`96bf548` to `7ca783d`)

The first window of this roadmap built most of its carrier layer. Labelled [Galois sets](https://taucetiproject.org/docs/TauCeti/FieldTheory/Galois/GaloisSet.html#TauCeti.GaloisSet), permutation representations of `Gal(K^sep/K)` on `Fin n` with open kernel, now exist alongside their discriminant weight and the [étale mass](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/Mass.html#TauCeti.etaleMass) `M_n(K) = (1/n!) ∑_ρ q^{-d(ρ)}`, the quantity Bhargava's formula evaluates. The headline is [the transitive bridge](https://taucetiproject.org/docs/TauCeti/FieldTheory/Galois/GaloisSet.html#TauCeti.GaloisSet.tsum_isTransitive): summing any weight of the stabilizer's fixed field over the transitive Galois sets of size `n` gives `(n − 1)!` times its sum over the degree-`n` subextensions of `SeparableClosure K`. Specialised to `q^{-d}`, this is [the transitive mass by subextensions](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/Mass.html#TauCeti.tsum_isTransitive_one_div_natCard_residueField_pow_discriminantExponent). The weight itself is an [orbit discriminant exponent](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/OrbitWeight.html#TauCeti.orbitDiscriminantExponent), additive on disjoint unions and independent of the chosen orbit representatives.

On the Layer 1 side, the residue degree is now totalized on subextensions as [`IntermediateField.inertiaDegree`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Unramified/IntermediateField.html#IntermediateField.inertiaDegree) and is invariant under `K`-isomorphism. A finite subextension's unramified part is [the canonical unramified extension of its residue degree](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Unramified/IntermediateField.html#IntermediateField.inf_maximalUnramifiedExtension), so `K_{f(L/K)} ≤ L`.

Still missing are the bridge from Galois sets to étale algebras (§0.4), the automorphism count and the general orbit count of Layer 1, and everything from Serre's formula over `K_f` onward.
