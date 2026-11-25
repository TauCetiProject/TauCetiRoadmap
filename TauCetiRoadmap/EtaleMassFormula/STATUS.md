<!--tauceti-status:v1 {"roadmap":"EtaleMassFormula","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"}],"readme_sha":"9197e9a19fc38744c1b29ade679ae7a51d5990923959fc93a7e37410a8b98709","roadmap":"EtaleMassFormula","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: EtaleMassFormula

This file documents the status of the EtaleMassFormula roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap's milestones are all proved. Bhargava's mass formula holds for every non-archimedean local field, both over Galois sets and over étale algebras, together with its refinements by splitting type and by ramification partition. All four layers are done, and the classification of §1.1, which the README left to prose, is in Lean as well.

### Named results

- **Bhargava's mass formula** — the étale mass satisfies `M_n(K) = ∑_{k ≤ n} q(k, n − k) · q^{−k}`, where `q(k, m)` counts the partitions of `k` into at most `m` parts, in `ℝ≥0∞` and with no restriction on the characteristic: [`etaleMass_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/Main.html#TauCeti.etaleMass_eq). The same value is the sum of `1/(#Aut_K(A) · q^{v(Disc A)})` over any family of étale algebras of degree `n` in the universe of `K`, one from each isomorphism class: [`tsum_etaleDiscriminantExponent_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/Main.html#TauCeti.tsum_etaleDiscriminantExponent_eq).
- **The mass by splitting type and by ramification partition** — the Galois sets with splitting symbol `σ` have mass `1/(#Aut(σ) · q^{∑ f_i(e_i−1)})` ([`etaleMass_splittingSymbol`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/Main.html#TauCeti.etaleMass_splittingSymbol)). Those with ramification partition `π` of `k` have mass `q^{−k}` ([`etaleMass_ramificationPartition`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/Main.html#TauCeti.etaleMass_ramificationPartition)), Bhargava's Propositions 2.1 and 2.2.
- **The étale-algebra bridge** — Bhargava's left-hand side over isomorphism classes of étale algebras equals the mass of labelled Galois sets, by orbit–stabilizer for the relabelling action: [`tsum_etaleDiscriminantExponent`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/EtaleAlgebra.html#TauCeti.tsum_etaleDiscriminantExponent).
- **The transitive mass by residue degree** — the Galois sets with splitting symbol `{(f, e)}` have mass `q^{−f(e−1)}/f`. It comes from Serre's formula over `K_f` through the [subfield count](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/SubfieldCount.html#TauCeti.tsum_inertiaDegree_eq): [`etaleMass_isTransitive_splittingSymbol`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/Transitive.html#TauCeti.etaleMass_isTransitive_splittingSymbol).
- **The automorphism count over the unramified part** — for a finite subextension `L` of `SeparableClosure K`, `#Aut_K(L) = #Aut_{K_f}(L) · #Stab([L])`: [`IntermediateField.natCard_algEquiv_eq_mul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Unramified/IntermediateField.html#IntermediateField.natCard_algEquiv_eq_mul).

### Notable definitions and infrastructure

- **Galois sets** — homomorphisms `Gal(K^sep/K) →* Equiv.Perm (Fin n)` with open kernel. They are the carrier of every mass statement, and they now have disjoint unions, block decompositions, a relabelling action and [splitting symbols](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/Transitive.html#TauCeti.GaloisSet.splittingSymbol): [`GaloisSet`](https://taucetiproject.org/docs/TauCeti/FieldTheory/Galois/GaloisSet.html#TauCeti.GaloisSet).
- **Classes of finite and totally ramified extensions** — [`FiniteExtensionClass`](https://taucetiproject.org/docs/TauCeti/FieldTheory/ExtensionClass.html#TauCeti.FiniteExtensionClass) and [`TotallyRamifiedClass`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/Classification.html#TauCeti.TotallyRamifiedClass). On them, [`totallyRamifiedOrbitEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/Classification.html#TauCeti.totallyRamifiedOrbitEquiv) identifies the `K`-classes of residue degree `f` with the `Gal(K_f/K)`-orbits on totally ramified `K_f`-classes. This is the classification the PadicExtensionFamilies roadmap consumes.
- **Splitting-symbol combinatorics** — [`splittingSymbolAut`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/SplittingSymbol.html#TauCeti.splittingSymbolAut) and [`ramificationPartition`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/SplittingSymbol.html#TauCeti.ramificationPartition). With them comes the identity that [the weights `1/#Aut(σ)` over the symbols with a given partition sum to one](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/EtaleMassFormula/SplittingSymbol.html#TauCeti.tsum_one_div_splittingSymbolAut_ramificationPartition), the arithmetic-free core of §3.2.

### Roadmap coverage

All four layers are done. Layer 0 gained its étale-algebra bridge (§0.4, with `etaleDiscriminantExponent` additive over products). Layer 1 now has the automorphism count of §1.2, the weighted class-sum identity, and a Lean form of §1.1's classification. Its orbit count for finite subextensions is the general `IntermediateField.ncard_isomorphic_mul_natCard_algEquiv_of_isSepClosed`, which the README says to reuse. Layer 2 has the subfield count, splitting symbols and the transitive mass, with §2.1's transport folded into the subfield count. Layer 3 has all three of Bhargava's formulas, plus the evaluations `M_2 = 1 + q^{−1}` and `M_3 = 1 + q^{−1} + q^{−2}`.

## The frontier

- **The README's numerical checks** — the explicit counts over `ℚ_2` and `ℚ_3` are not established here as Lean examples. These are the seven quadratic classes of `ℚ_2`, the ten orbits of ramified quadratic extensions of `ℚ_4` under Frobenius, and `M_2(ℚ_2) = 3/2`. Only the general degree-2 and degree-3 evaluations are.
- **Hand-off to PadicExtensionFamilies** — Layer 1's classification, automorphism count and weighted identity are in place for that roadmap to consume. Nothing further is owed here.
- **Long horizon** — Kedlaya's and Wood's masses for Galois sets with values in a subgroup, weighted by an Artin conductor, are named by the README only to mark direction, not as work for this roadmap.
