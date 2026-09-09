<!--tauceti-status:v1 {"roadmap":"Chebotarev","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: Chebotarev

This file documents the status of the Chebotarev roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** None of the roadmap's fourteen layers is complete. Three foundation pieces exist: the power operation on conjugacy classes (all of Layer 1's group-theoretic half), the finite set of ramified primes (part of Layer 2), and the root-of-unity orientation of arithmetic Frobenius (the opening fact of Layer 4). The Frobenius prime set, both density theorems, and the entire counting spine have not begun.

### Named results

- **Frobenius orientation on roots of unity** — for `𝔭 ∤ m` and `Q` a prime of `𝓞 F` over `𝔭`, an arithmetic Frobenius at `Q` raises an `m`-th root of unity of `F` to the power `𝔑𝔭`; this is the roadmap's pinned "no inverse" orientation, proved for an arbitrary arithmetic Frobenius element rather than for the Artin class ([`AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.html#AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one)).
- **Membership in a power of a conjugacy class** — `τ ∈ C ^ j` exactly when `τ = σ ^ j` for some `σ ∈ C`, which is the form the Frobenius von Mangoldt fibre of Layer 11 will be defined by ([`ConjClasses.mem_pow_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Group/Conj.html#ConjClasses.mem_pow_iff)).
- **Membership in the ramified set** — `𝔭 ∈ ramifiedPrimes K L` exactly when some prime of `𝓞 L` over `𝔭` fails to be unramified over `𝓞 K` ([`NumberField.Chebotarev.mem_ramifiedPrimes_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/RamifiedPrimes.html#NumberField.Chebotarev.mem_ramifiedPrimes_iff)).

### Notable definitions and infrastructure

- **Powers of conjugacy classes** ([`ConjClasses.pow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Group/Conj.html#ConjClasses.pow)) — a `Pow (ConjClasses M) ℕ` on any monoid, with identity, composition and naturality laws; it lets `Frob(𝔭)^j ∈ C` be stated on classes without choosing a representative, which the von Mangoldt coefficient and the fibre count of Layer 8 both need.
- **The ramified primes of `L/K`** ([`NumberField.Chebotarev.ramifiedPrimes`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/RamifiedPrimes.html#NumberField.Chebotarev.ramifiedPrimes)) — a `Finset` on the roadmap's pinned prime carrier `HeightOneSpectrum (𝓞 K)`, which is the exceptional set every later density and counting statement discards. The finiteness proof it packages is not surfaced as a separate public declaration in this window.
- **Galois action commuting with the base ring of integers** ([`NumberField.RingOfIntegers.smulCommClass`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/AutomorphismAction.html#NumberField.RingOfIntegers.smulCommClass)) — the instance that lets automorphisms of `F` act on `𝓞 F` as `𝓞 K`-linear maps, needed to talk about Frobenius on residue fields of `𝓞 F`.

### Roadmap coverage

- Layer 1: partial. The conjugacy-class power API is done; the transport lemmas from `artinSymbol_map_restrictNormalHom` and `exists_isArithFrobAt_pow_inertiaDeg`, the identity class at split-completely primes, and representative-independence of the class cardinal are untouched.
- Layer 2: partial. `ramifiedPrimes` and its membership law exist; `frobeniusPrimeSet`, its proof-independence, equivariance, disjointness, and the complement statement are untouched.
- Layer 4: partial. Only the root-of-unity orientation is proved; abelianity, the conductor modulus, and `cyclotomicCharacterWeight` are untouched.
- Layers 3, 5–14 (prime sums, continuation, cyclotomic and abelian density, the auxiliary prime and crossing, the fixed-field fibre, Dirichlet-density Chebotarev, the von Mangoldt package, the weighted transfer, `π_C`, natural density and the agreement theorems): untouched.

## The frontier

- **`frobeniusPrimeSet K L C`** — the central carrier of Layer 2 is still missing. It needs the supplier's `artinSymbol` from Number Field Arithmetic, taking an unramifiedness proof as an argument, so that the set is defined by the dependent condition and never evaluates a class at a ramified prime; `ramifiedPrimes` is now in place for the complement statement.
- **Layer 1 transport lemmas** — the two restriction laws (shrinking the top field with no power; raising the base field with the power `f(𝔓/𝔭)`) must be specialised to Artin classes from the supplier's `artinSymbol_map_restrictNormalHom` and `exists_isArithFrobAt_pow_inertiaDeg`, and the `ℚ(ζ_7) ⊃ ℚ(√-7) ⊃ ℚ` regression at `p = 3` discharged.
- **Rest of Layer 4** — from the orientation theorem, deduce that `Gal(F/K)` is abelian for `F` cyclotomic over `K`, and define `cyclotomicCharacterWeight χ` with its value zero at ramified primes and its Euler product. The conductor identification waits on `Modulus` and `RayClassCharacter` from Global Number Fields.
- **Auxiliary-prime theorem (7.1–7.3)** — independent of the analytic work and of the Frobenius set; it needs only Mathlib's `Nat.exists_prime_gt_modEq_one`, `IsCyclotomicExtension.autEquivPow`, and the total ramification of `ℚ(ζ_q)` at `q`. With `ramifiedPrimes` available, the bound past the largest ramified prime can now be stated.
- **Discard estimates 11.3** — also independent of everything except `ramifiedPrimes`; the roadmap recommends proving them early because both 12.3 and 12.4 consume them. The all-prime `ψ - ϑ = o(x)` bound is a prerequisite owed by Arithmetic Dirichlet Series.
