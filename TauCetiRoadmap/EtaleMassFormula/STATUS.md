<!--tauceti-status:v1 {"roadmap":"EtaleMassFormula","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"§0.4: the bridge from Galois sets to étale algebras, etaleDiscriminantExponent and tsum_etaleDiscriminantExponent","state":"partial"},{"id":"Layer 1","remaining":"the orbit count for every finite subextension (§1.3) and the automorphism count natCard_algEquiv_eq_mul (§1.2)","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"}],"readme_sha":"72a8d9379930fa3509ce15ff01035d3d75e6595457f431bbb661deec2cda5902","roadmap":"EtaleMassFormula","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: EtaleMassFormula

This file documents the status of the EtaleMassFormula roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The carrier layer is built except for its bridge to étale algebras: Galois sets, their discriminant weight, the étale mass and the transitive bridge to subextensions are proved. Layer 1 has its subfield form but not its counts, and the transitive mass by residue degree and Bhargava's formulas themselves have not begun.

### Named results

- **The transitive bridge** — summing any weight of the stabilizer's fixed field over the transitive Galois sets of size `n` gives `(n − 1)!` times its sum over the degree-`n` subextensions of `SeparableClosure K`: [`GaloisSet.tsum_isTransitive`](https://taucetiproject.org/docs/TauCeti/FieldTheory/Galois/GaloisSet.html#TauCeti.GaloisSet.tsum_isTransitive).
- **The transitive mass by subextensions** — the bridge specialised to `q^{-d}`, the form Layer 2 will combine with Serre's formula over `K_f`: [`tsum_isTransitive_one_div_natCard_residueField_pow_discriminantExponent`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/Mass.html#TauCeti.tsum_isTransitive_one_div_natCard_residueField_pow_discriminantExponent).
- **The unramified part of a subextension** — inside `SeparableClosure K`, a finite subextension `L` meets the maximal unramified extension exactly in the canonical unramified extension of degree `f(L/K)`: [`IntermediateField.inf_maximalUnramifiedExtension`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Unramified/IntermediateField.html#IntermediateField.inf_maximalUnramifiedExtension).

### Notable definitions and infrastructure

- **Galois sets** — homomorphisms `Gal(K^sep/K) →* Equiv.Perm (Fin n)` with open kernel, whose point stabilizers have finite fixed fields of degree equal to the orbit size. Every mass statement is posed over them: [`GaloisSet`](https://taucetiproject.org/docs/TauCeti/FieldTheory/Galois/GaloisSet.html#TauCeti.GaloisSet).
- **The étale mass** — `M_n(K) = (1/n!) ∑_ρ q^{-d(ρ)}` in `ℝ≥0∞`, with `M_0 = M_1 = 1` checked: [`etaleMass`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/Mass.html#TauCeti.etaleMass). Its weight is the [orbit discriminant exponent](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/OrbitWeight.html#TauCeti.orbitDiscriminantExponent), which is additive on disjoint unions and independent of the chosen orbit representatives.
- **The totalized residue degree** — [`IntermediateField.inertiaDegree`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Unramified/IntermediateField.html#IntermediateField.inertiaDegree), zero exactly on infinite subextensions and invariant under `K`-isomorphism. Splitting symbols will need it.

### Roadmap coverage

Layer 0 is done through §0.3 (orbit weight, Galois sets, the mass and the transitive bridge). §0.4, the bridge to étale algebras, is still open, so the mass is not yet identified with Bhargava's left-hand side. Layer 1 is partial: §1.3's subfield form and the isomorphism invariance of the residue degree are proved. The orbit count for every finite subextension and §1.2's automorphism count are not (§1.1 is README-only). Layers 2 and 3 are untouched.

## The frontier

- **The bridge to étale algebras (§0.4)** — `homMulAction`, `etaleDiscriminantExponent`, its additivity over products, and `tsum_etaleDiscriminantExponent` identifying `∑ 1/(#Aut_K(A) · q^{d(A)})` with `M_n(K)`. It needs Mathlib's `Algebra.FormallyEtale.iff_exists_algEquiv_prod`.
- **The orbit count for finite subextensions (§1.3)** — `ncard_isomorphic_mul_natCard_algEquiv_eq_finrank`, generalising the totally ramified count from the MassFormula roadmap.
- **The automorphism count (§1.2)** — `natCard_algEquiv_eq_mul`, `#Aut_K(L) = #Aut_{K_f}(L) · #Stab([L])`, now that the inclusion `K_{f(L/K)} ≤ L` is available.
- **The subfield count (§2.1–2.2)** — transport Serre's Theorem 1 to `K_f` inside `SeparableClosure K` and prove `tsum_inertiaDegree_eq`. Then splitting symbols and the transitive mass `q^{-f(e−1)}/f` follow from the bridge already in place.
- **The combinatorial core of §3.2** — `∑_{π(σ) = π} 1/#Aut(σ) = 1`, via conjugacy classes of `S_{n_0} × ⋯ × S_{n_k}`. It is independent of the arithmetic and could be started now.
