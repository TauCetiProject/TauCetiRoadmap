<!--tauceti-status:v1 {"roadmap":"FormalLaurentPuiseux","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"L1","state":"done"},{"id":"L2","state":"done"},{"id":"L3","state":"done"},{"id":"L4","state":"done"},{"id":"L5","state":"done"},{"id":"L6","state":"done"},{"id":"L7","state":"done"}],"readme_sha":"e14aa22a29174e4fbef2d5b426a49e4e0f6e395f96bc3122d75cf2403cb76b49","roadmap":"FormalLaurentPuiseux","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: FormalLaurentPuiseux

This file documents the status of the FormalLaurentPuiseux roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap's summit is reached. For K algebraically closed of characteristic zero, the absolute Galois group of K((t)) is Ẑ, and the Newton–Puiseux closure, the classification of finite extensions and the residue–trace formula beneath it are all proved. All seven layers have their milestones in place. What remains is to adopt Mathlib's versions of a few designs once Mathlib has them.

### Named results

- **The absolute Galois group of K((t)) is Ẑ** — for K algebraically closed of characteristic zero, with a compatible system of primitive roots of unity fixed, Gal(K((t))) is topologically isomorphic to the profinite integers, independently of the model of the algebraic closure, with the generator acting by t^(1/n) ↦ ζ_n t^(1/n) ([`absoluteGaloisGroupEquivZHat`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Puiseux/AbsoluteGalois.html#TauCeti.puiseuxField.absoluteGaloisGroupEquivZHat)).
- **The formal Newton–Puiseux theorem** — for K algebraically closed of characteristic zero, every nonconstant polynomial over the Puiseux field has a root at a single ramified level, so the Puiseux field is an algebraic closure of K((t)) ([`instIsAlgClosure`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Puiseux/AlgClosure.html#TauCeti.puiseuxField.instIsAlgClosure)).
- **Classification of finite extensions of K((t))** — for K algebraically closed of characteristic zero, an extension of degree e is isomorphic to K((t^(1/e))) ([`algEquivOfFinrankEq`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Puiseux/FiniteExtension.html#TauCeti.LaurentSeries.Level.algEquivOfFinrankEq)), with residue field K and ramification index e ([`ramificationIdx_valuationOfFinrankEq`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Level/FiniteExtensionValuation.html#TauCeti.LaurentSeries.Level.ramificationIdx_valuationOfFinrankEq)).
- **Residues on finite extensions** — on any formally étale extension L of K((t)), the residue Res_F ∘ Tr_(L/F) ([`residue`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/KaehlerDifferential/Trace.html#TauCeti.LaurentSeries.Extension.ContinuousKaehlerDifferential.residue)) satisfies Tate's axioms in every characteristic, and on a level of degree invertible in K it is the u⁻¹-coefficient in any level chart ([`residue_eq_coeff_laurentDifferentialEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/KaehlerDifferential/FiniteExtension.html#AlgEquiv.residue_eq_coeff_laurentDifferentialEquiv)), which is the roadmap's Res_F(Tr ω) = Res_L(ω).
- **The finite-map residue formula** — for φ ∈ tK⟦t⟧ of order e, Res(f(φ) dφ) = e·Res(f dt) in every characteristic, via a universal coefficient identity over any commutative ring ([`coeff_neg_one_substAlgHom_mul_derivative_eq_nsmul`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Substitution/Basic.html#TauCeti.LaurentSeries.coeff_neg_one_substAlgHom_mul_derivative_eq_nsmul)).

### Notable definitions and infrastructure

- **The Puiseux field as a valued colimit of levels** ([`levelCoconeIsColimit`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Colimit.html#TauCeti.puiseuxField.levelCoconeIsColimit)) — the carrier every later layer works on, with its own derivative, one-forms free on dt and a residue whose kernel is the exact forms.
- **Continuous one-forms on étale extensions** ([`ContinuousKaehlerDifferential`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/KaehlerDifferential/Etale.html#TauCeti.LaurentSeries.Extension.ContinuousKaehlerDifferential)) — free on dt, universal for derivations continuous on K((t)), and the scalar extension of the one-forms of K((t)). They let residues and traces be stated without choosing an isomorphism with a level.
- **Residue duality for vector-valued series** — the continuous dual of V((t)) is V*((t)) under the residue pairing, as a homeomorphism ([`residueDualContinuousLinearEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/ContinuousDual/AnnihilatorTopology.html#HahnModule.residueDualContinuousLinearEquiv)). Together with the formal loop algebras L((t)) and their comparison with Mathlib's loop residue pairing, these are the supplier identities for formal loop cocycles.

### Roadmap coverage

All seven layers are done. **L1–L3** (substitution, coordinate and jet groups; derivations and one-forms; residues, primitives, scalar and vector-valued duality, formal loop algebras) are complete, and the higher Leibniz rule of §2.1 now holds over any ring. **L4** (levels, the Puiseux field, its valuation and calculus) is complete, now with pullback of Puiseux one-forms along continuous endomorphisms. **L5** is complete. Its root theorem goes through a Tschirnhaus shift, slope normalization and Hensel lifting rather than through faces and initial polynomials, but a coefficient Newton-polygon API over K((t)) also exists. **L6** is complete: the finite-level Galois correspondence that §6.1 asks for ([`restrictLevelOrderIso`](https://taucetiproject.org/docs/TauCeti/RingTheory/LaurentSeries/Level/GaloisCorrespondence.html#TauCeti.puiseuxField.restrictLevelOrderIso)) is now in place, and splitting fields of polynomials that split over the Puiseux field are levels. **L7** is complete: cofinality, the limit comparison, the Ẑ isomorphism with its change-of-ζ formula, uniformizer-independent characters θ_n, and the fact that the whole Galois group is inertia.

## The frontier

- **Adopting Mathlib's designs** — `LaurentSeries.expand`/`contract`, the embedding-range criterion, the product rule and the Hasse–Leibniz rule follow designs proposed for Mathlib in commutative-ring generality; the README asks that Tau Ceti switch to Mathlib's versions once Mathlib adopts them.
- **Transport to AlgebraicCurves §9.2** — the coordinate-level substitution, residue and trace identities are meant to be carried along that roadmap's completions at places. That transport belongs to AlgebraicCurves, not here.
- **Wild ramification** — the comparison of the trace-defined residue with the level reading needs the degree to be invertible in K. The algebraic closure of K((t)) in positive characteristic is explicitly outside this roadmap.
