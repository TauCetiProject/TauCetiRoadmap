<!--tauceti-status:v1 {"roadmap":"SchemeAndStackFoundations","to_sha":"9fc5d5a87d00cb696e606ccdae66420cc837c05e","ts":"2026-10-19T21:24:00Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"henselization universal property and ind-etale package; excellent, Nagata and Japanese rings; pseudo-coherence; perfect schemes; rest of Frobenius","state":"partial"},{"id":"Layer 1","remaining":"algebraic spaces from representable diagonals and etale atlases (1.3) onward","state":"untouched"},{"id":"Layer 2","remaining":"site cohomology functoriality (2.1-2.3) and the Nisnevich site","state":"untouched"},{"id":"Layer 3","remaining":"curve genus checks, Riemann-Hurwitz for schemes, degrees of vector bundles","state":"untouched"},{"id":"Layer 4","remaining":"thickenings and the lifting criterion (4.1), Artinian coefficient category","state":"untouched"},{"id":"Layer 5","remaining":"cycles, rational equivalence and Chow groups (5.1)","state":"untouched"}],"readme_sha":"c1d86d70a4c88de33a4097a5466c4dac5f903eb2d1b5c761ae3d7f191dbe430c","roadmap":"SchemeAndStackFoundations","to_sha":"9fc5d5a87d00cb696e606ccdae66420cc837c05e"}-->
# Status: SchemeAndStackFoundations

This file documents the status of the SchemeAndStackFoundations roadmap up until `9fc5d5a` (2026-10-19T21:24:00Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All the work so far is in Layer 0, and it is partial there. The henselization of a pair is henselian, but its universal property is still open. Scheme Frobenius, normal schemes, catenary rings and Cohen–Macaulay modules are largely in place. Excellent and Nagata rings, ind-étale algebras and pseudo-coherence have not started. Layers 1–5, from algebraic spaces through intersection theory, are untouched.

### Named results

- **The henselization of a pair is henselian** — for any ring `R` and ideal `I`, the colimit of the étale neighbourhoods of `(R, I)` is henselian along the extended ideal, with no Noetherian or local hypothesis ([`Henselization.henselian`](https://taucetiproject.org/docs/TauCeti/RingTheory/Henselization/Henselian.html#TauCeti.Henselization.henselian)); this is the main theorem of §0.12.
- **Finiteness of Frobenius** — on a scheme locally of finite type over a perfect ring of characteristic `p`, the absolute Frobenius is a finite morphism ([`Scheme.isFinite_frobenius`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Frobenius/Finite.html#AlgebraicGeometry.Scheme.isFinite_frobenius)).
- **Normal schemes are DVRs in codimension one** — on a locally Noetherian normal scheme, the local ring at every point of coheight one is a discrete valuation ring ([`IsNormalScheme.isDiscreteValuationRing_stalk`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Scheme/Normal.html#TauCeti.AlgebraicGeometry.IsNormalScheme.isDiscreteValuationRing_stalk)).
- **Codimension-one points lift** — a surjective locally quasi-finite morphism of irreducible schemes, for instance a finite dominant map of integral schemes, hits every codimension-one point with a codimension-one point ([`codimensionOneMap_surjective`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Morphisms/CodimensionOne.html#AlgebraicGeometry.Scheme.Hom.codimensionOneMap_surjective)).
- **Regular domains are integrally closed** — Stacks 0567 for domains, proved from the fact that associated primes of a principal ideal in a regular ring have height one ([`IsRegularRing.isIntegrallyClosed`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/Normal.html#TauCeti.IsRegularRing.isIntegrallyClosed)).

### Notable definitions and infrastructure

- **The henselization algebra** ([`Henselization.algebra`](https://taucetiproject.org/docs/TauCeti/RingTheory/Henselization/Algebra.html#TauCeti.Henselization.algebra)), built as a colimit over a small model of the filtered category of étale neighbourhoods. Every element and every finite family comes from a single stage, which reduces the remaining universal-property arguments to statements about étale algebras.
- **The iterated relative Frobenius** ([`iterateRelativeFrobenius`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Frobenius/Twist.html#AlgebraicGeometry.Scheme.Hom.iterateRelativeFrobenius)) to the `p^n`-th Frobenius twist. It is natural, compatible with composition of twists and with base change, and is a homomorphism on group schemes; the finite-field `q`-power Frobenius is a special iterate.
- **Cohen–Macaulay modules** ([`Module.IsCohenMacaulay`](https://taucetiproject.org/docs/TauCeti/RingTheory/CohenMacaulay/Basic.html#Module.IsCohenMacaulay)), with depth at most the dimension of the support and dropping by exactly one modulo a regular element. This is the input that §0.6's Hartogs statements and the coherent half of Layer 2 wait on.

### Roadmap coverage

Layer 0 is partial. Several subsections are largely complete: catenary and universally catenary rings (§0.16, lacking only "Cohen–Macaulay implies universally catenary"); flat base change of annihilators and cokernels (§0.27); and normal schemes with codimension-one points and ramification at a point (§0.30, lacking multiplicativity of the ramification index). §0.12 has its main theorem but not the universal property or functoriality. §0.29 has absolute, relative and iterated Frobenius with base change and finiteness. It does not yet show that Frobenius is a universal homeomorphism, that relative Frobenius is an isomorphism for étale maps, or the rank of relative Frobenius for smooth maps. §0.2, §0.3, §0.7, §0.14, §0.17 and §0.21 have begun: morphism properties of the relative spectrum, Proj base change, local Krull dimension, idempotent lifting, depth and Cohen–Macaulay modules, and the regular locus. There is no sign yet of pseudo-coherence (§0.5), ind-étale algebras (§0.13), Popescu (§0.15), or Japanese, Nagata and excellent rings (§§0.20–0.21). Layers 1–5 are untouched. The wider library's Zariski cohomology, Picard functors and genus-one divisor results are supplier inputs these layers cite, not their own milestones.

## The frontier

- **Universal property of the henselization** — `existsUnique_lift`, `fixed_of_henselian` and the local-ring case remain open. The section-splitting lemmas for unramified algebras and unique idempotent lifting that landed are the inputs; still missing is lifting étale sections over a henselian pair.
- **Ind-étale algebras and flatness of the henselization (§0.13)** — this needs §0.12's universal property. It opens `R/Iⁿ ≅ R^h/(I^h)ⁿ`, Noetherianity of `R^h`, and henselization at a prime.
- **Rest of scheme Frobenius (§0.29)** — what remains is the universal-homeomorphism, étale and smooth-rank statements. They gate perfect schemes and perfection (§§0.24–0.26).
- **Excellent rings (§0.21)** — only the regular locus exists. G-rings, J-2 rings and the excellence predicate are still to come, and so is "Cohen–Macaulay rings are universally catenary", which closes §0.16.
- **Algebraic spaces (§1.3)** — representable diagonals and étale atlases are the entry point to Layer 1, and none of it has been started.
