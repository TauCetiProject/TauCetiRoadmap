<!--tauceti-status:v1 {"roadmap":"FormalLaurentPuiseux","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
# Status: FormalLaurentPuiseux

This file documents the status of the FormalLaurentPuiseux roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap's summit is reached: for K algebraically closed of characteristic zero, the absolute Galois group of K((t)) is Ẑ, and the Newton–Puiseux closure, finite-extension classification and residue-trace formula beneath it are all proved. All seven layers now have their milestones in place. What remains is a small number of API items, chiefly the Newton-polygon Minkowski-sum formula in L5.

### Named results

- **The absolute Galois group of K((t)) is Ẑ** — once a compatible system of primitive roots of unity is fixed, Gal(K((t))) is topologically isomorphic to the profinite integers, independently of the chosen model of the algebraic closure, with the generator acting by t^(1/n) ↦ ζ_n t^(1/n) ([`absoluteGaloisGroupEquivZHat`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Puiseux/AbsoluteGalois.html#TauCeti.puiseuxField.absoluteGaloisGroupEquivZHat)).
- **The formal Newton–Puiseux theorem** — every nonconstant polynomial over the Puiseux field has a root at a single ramified level, so the Puiseux field is an algebraic closure of K((t)) ([`instIsAlgClosure`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Puiseux/AlgClosure.html#TauCeti.puiseuxField.instIsAlgClosure)).
- **Classification of finite extensions of K((t))** — an extension of degree e is isomorphic to K((t^(1/e))) ([`algEquivOfFinrankEq`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Puiseux/FiniteExtension.html#TauCeti.LaurentSeries.Level.algEquivOfFinrankEq)), with residue field K and ramification index e ([`ramificationIdx_valuationOfFinrankEq`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Level/FiniteExtensionValuation.html#TauCeti.LaurentSeries.Level.ramificationIdx_valuationOfFinrankEq)).
- **The trace preserves residues** — for a ramified level L of degree invertible in K, one-forms on L are the scalar extension of those on F, and Res_F(Tr_(L/F) ω) = Res_L(ω) ([`coeff_neg_one_equivLaurentSeries_trace`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Level/KaehlerDifferential.html#TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential.coeff_neg_one_equivLaurentSeries_trace)).
- **The finite-map residue formula** — for φ ∈ tK⟦t⟧ of order e, Res(f(φ)Dφ dt) = e·Res(f dt) in every characteristic, via a universal coefficient identity over any commutative ring ([`coeff_neg_one_substAlgHom_mul_derivative_eq_nsmul`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Substitution.html#TauCeti.LaurentSeries.coeff_neg_one_substAlgHom_mul_derivative_eq_nsmul)).

### Notable definitions and infrastructure

- **The Puiseux field as a valued colimit of levels** ([`levelCoconeIsColimit`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Colimit.html#TauCeti.puiseuxField.levelCoconeIsColimit)) — the carrier on which every later layer works. It now has its own derivative, continuous one-forms free on dt ([`ContinuousKaehlerDifferential`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Puiseux/KaehlerDifferential.html#TauCeti.puiseuxField.ContinuousKaehlerDifferential)) and a residue whose kernel is the exact forms.
- **Residue duality for vector-valued series** — the continuous dual of V((t)) is V*((t)) under the residue pairing, as a homeomorphism for the annihilator topology ([`residueDualContinuousLinearEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/ContinuousDual/AnnihilatorTopology.html#HahnModule.residueDualContinuousLinearEquiv)), natural in linear maps and compatible with formal coordinate changes.
- **Formal loop algebras L((t))** — the convolution Lie algebra with its derivative as a Lie derivation, the Lie equivalence with F ⊗ L ([`tensorProductLieEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/BaseChange/HahnModule.html#HahnModule.tensorProductLieEquiv)), and Res(Φ(f, Dg) dt) agreeing with Mathlib's loop-algebra residue pairing on polynomial loops ([`residuePairing_toHahnModule`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Loop/Derivative.html#LieAlgebra.LoopAlgebra.residuePairing_toHahnModule)). These are the supplier identities for formal loop cocycles.

### Roadmap coverage

**L1** and **L2** are done; L2 now includes the K⟦t⟧- and maximal-ideal-preserving vector fields with their comparison to infinitesimal substitutions, and functoriality of one-forms under coefficient-field embeddings. **L3** is done: residue calculus, primitives, scalar and vector-valued duality, D on L((t)), the F-Lie equivalence and the residue-pairing comparison. Completeness of V((t)) in its lattice topology was not confirmed in the supplied material. **L4** is done, now including D_t with its level chain rule, Puiseux one-forms, the residue with Res_u = n·Res_t, the primitive criterion and residues under continuous endomorphisms. **L5** has its summit and examples, and now a coefficient Newton-polygon API (initial polynomials, multiplicativity, faces, slope multiplicities, translation, scaling and ramification), but no Minkowski-sum formula for products. **L6** is done: Kummer structure, classification, the d! bound, integer rings, residue fields and ramification, trace on differentials with Res_F ∘ Tr = Res_L, residues along transition maps, compatible primitive roots (exp(2πi/n) for ℂ) and the profinite limit of the μ_n. **L7** is done: cofinality, the limit comparison, the Ẑ isomorphism with its change-of-ζ formula, Hensel n-th roots of units, uniformizer-independent θ_n, and commutation of parameter changes with the Galois group.

## The frontier

- **Minkowski-sum formula for Newton polygons (L5)** — the slopes of a product's Newton polygon are the union of the factors' slope multisets. Multiplicativity of initial polynomials and the slope-multiplicity count are both in place, so this should follow directly.
- **Completeness of V((t)) (L3)** — the README asks for completeness of the lattice topology on vector-valued series; the supplied material does not show it, so it is worth checking whether it exists or is still to do.
- **Adopting Mathlib's expansion and Hasse-derivative APIs** — the README asks for Tau Ceti's versions of `LaurentSeries.expand`/`contract` and the commutative-ring product rule to be replaced as Mathlib PR #42313 and PR #42471 land.
- **Transport to AlgebraicCurves Layer 9** — the coordinate-level residue and trace identities are now in the form that roadmap is meant to consume along its completion isomorphisms; that transport belongs to it, not here.
