<!--tauceti-status:v1 {"roadmap":"NumberFieldArithmetic","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: NumberFieldArithmetic

This file documents the status of the NumberFieldArithmetic roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 2.1 and 2.2 are done, Layer 2.3 has its definition and one characterising lemma but none of its comparison API, and Layer 1.1's count criterion is published. Nothing else has begun: Layers 1.2 to 1.5, 2.4 to 2.7, and all of Layers 3 to 8 have no declarations.

### Named results

- **Existence of relative Frobenius elements** — for a finite Galois extension of number fields and a nonzero prime of the top ring of integers, some Galois element is an arithmetic Frobenius there ([`NumberField.exists_isArithFrobAt_of_isGalois`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Frobenius.html#NumberField.exists_isArithFrobAt_of_isGalois)).
- **Uniqueness of the Frobenius at an unramified prime** — two arithmetic Frobenius elements at an unramified prime are equal in the Galois group, not merely as algebra homomorphisms ([`NumberField.isArithFrobAt_eq_of_isUnramifiedAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Frobenius.html#NumberField.isArithFrobAt_eq_of_isUnramifiedAt)).
- **Every Frobenius over `𝔭` represents the Artin symbol** — the well-definedness statement that makes the symbol a single conjugacy class ([`NumberField.artinSymbol_eq_mk_of_isArithFrobAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/ArtinSymbol.html#NumberField.artinSymbol_eq_mk_of_isArithFrobAt)).
- **The relative splitting criterion** — over a Galois extension of an arbitrary Dedekind base, the prime count equals the relative degree iff `e = 1` and `f = 1` ([`NumberField.ncard_primesOver_eq_finrank_iff_of_isGalois`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/SplitsCompletely.html#NumberField.ncard_primesOver_eq_finrank_iff_of_isGalois)).

### Notable definitions and infrastructure

- **The Artin symbol** ([`NumberField.artinSymbol`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/ArtinSymbol.html#NumberField.artinSymbol)) — the conjugacy-class-valued symbol indexed by a prime ideal of the base, on the carrier the README freezes for Chebotarev and for the Layer 2.5 Artin map.
- **The subsingleton instance** ([`NumberField.subsingleton_isArithFrobAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Frobenius.html#NumberField.subsingleton_isArithFrobAt)) — lets "the Frobenius at `Q`" be used as one element at an unramified `Q`.
- **Ring-generic group-level uniqueness** ([`IsArithFrobAt.eq_of_isUnramifiedAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Frobenius.html#IsArithFrobAt.eq_of_isUnramifiedAt)) — the invariant-ring statement behind the number-field one, under a Noetherian hypothesis and a prime containing all zero-divisors.

### Roadmap coverage

- Layer 1: 1.1 partial. The count-versus-`(e,f)` criterion is published; the decomposition-group form is not among these declarations. 1.2 to 1.5 untouched.
- Layer 2: 2.1 done; 2.2 done; 2.3 partial, with the definition and the representation lemma only, and no conjugation formula, `orderOf Frob = f`, `zpowers = stabilizer`, residue-Frobenius identification, or `K = ℚ` corollary; 2.4 to 2.7 untouched.
- Layers 3 to 8 untouched: no index, Dedekind–Kummer, Dedekind's theorem, relative discriminant, local-global dictionary, ramification exponents, subfields, units, or label declarations exist.

## The frontier

- **Layer 2.4, functoriality of the Frobenius** — restriction along `AlgEquiv.restrictNormal`, then `artinSymbol_map_restrictNormalHom` and the tower formula `exists_isArithFrobAt_pow_inertiaDeg`. Its prerequisites, Layers 2.1 and 2.3, now exist, and both names are the Chebotarev contract.
- **The rest of Layer 2.3's API** — conjugation covariance `Frob (σ • Q) = σ (Frob Q) σ⁻¹`, `orderOf (Frob Q) = f`, `zpowers = stabilizer` at an unramified `Q`, the image under `stabilizerHom` being the residue Frobenius, and the corollary at `span {p}` over `ℚ`.
- **Layer 2.5, the ideal-theoretic Artin map** — `idealsAway`, `artinHomAway`, and the five named lemmas; blocked on Layer 2.4.
- **Layers 1.3 and 1.4** — the decomposition and inertia dictionary and the double-coset law `doubleCosetEquiv`, which Dedekind's theorem in Layer 3.9 needs.
- **Layers 3.1 to 3.5 and 4.1** — the power-basis index, the index formula, and the `relDiscr` definition; independent of Layer 2 and available now.
