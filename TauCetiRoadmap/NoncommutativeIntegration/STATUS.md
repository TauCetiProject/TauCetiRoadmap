<!--tauceti-status:v1 {"roadmap":"NoncommutativeIntegration","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"singular numbers and the measure topology on tau-measurable operators; only the scalar decreasing rearrangement exists","state":"untouched"},{"id":"Layer 2","remaining":"upper method, complex duality and reiteration, the (L1, Linf) real identification, and all noncommutative duality and interpolation","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"ef8decec5efbba3312a33f9b3586de0c65424d89db01aef85690cdf23e22fa73","roadmap":"NoncommutativeIntegration","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
# Status: NoncommutativeIntegration

This file documents the status of the NoncommutativeIntegration roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the scalar and abstract groundwork of Layer 2 exists: compatible couples, the K-functional, the complex and real interpolation methods as exact functors, and the scalar decreasing rearrangement with the K-functional formula for (L¹, L∞). Nothing noncommutative has begun: there are no τ-measurable operators, singular numbers, noncommutative Lp spaces or Haagerup spaces in the library, so Layers 1 and 3–8 are untouched.

### Named results

- **The K-functional of (L¹, L∞)** — for an a.e. strongly measurable f, ∫₀ᵗ f* equals the infimum of ‖f₀‖₁ + t‖f₁‖_∞ over splittings f = f₀ + f₁, attained by the radial retraction at level f*(t) ([`lintegral_decreasingRearrangement_enorm_eq_iInf_eLpNorm`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Function/DecreasingRearrangement.html#MeasureTheory.Measure.lintegral_decreasingRearrangement_enorm_eq_iInf_eLpNorm)). This is the scalar input to the real-method identification of §2.4 and to the singular-number retraction of §2.5; it is phrased with Lᵖ seminorms, not yet through the compatible-couple K-functional.
- **Equimeasurability of the decreasing rearrangement** — on (0, ∞) with Lebesgue measure, f* has the same superlevel-set measures as f, hence the same Lᵖ norms for every exponent ([`volume_restrict_setOf_lt_decreasingRearrangement`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Function/DecreasingRearrangement.html#MeasureTheory.Measure.volume_restrict_setOf_lt_decreasingRearrangement), [`eLpNorm_decreasingRearrangement`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Function/DecreasingRearrangement.html#MeasureTheory.Measure.eLpNorm_decreasingRearrangement)).
- **Shifted subadditivity of rearrangements** — (f + g)*(s + t) ≤ f*(s) + g*(t), the commutative case of the Fack–Kosaki law μ_(s+t)(x+y) ≤ μ_s(x) + μ_t(y) ([`decreasingRearrangement_add_le`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Function/DecreasingRearrangement.html#MeasureTheory.Measure.decreasingRearrangement_add_le)), with the multiplicative twin [`decreasingRearrangement_mul_le`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Function/DecreasingRearrangement.html#MeasureTheory.Measure.decreasingRearrangement_mul_le).
- **Monotonicity of real interpolation in the secondary exponent** — (X₀, X₁)_{θ,p} embeds continuously in (X₀, X₁)_{θ,q} for 1 ≤ p ≤ q ≤ ∞, with a bound independent of the couple ([`KMethodSpace.inclusion`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Interpolation/Exponent.html#TauCeti.CompatibleCouple.KMethodSpace.inclusion), [`norm_inclusion_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Interpolation/Exponent.html#TauCeti.CompatibleCouple.KMethodSpace.norm_inclusion_le)).

### Notable definitions and infrastructure

- **The decreasing rearrangement** ([`decreasingRearrangement`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Function/DecreasingRearrangement.html#MeasureTheory.Measure.decreasingRearrangement)) — defined for an arbitrary measure with no σ-finiteness hypothesis, right continuous and tied to the distribution function by the generalized-inverse relation. It is the model that the noncommutative μ_t of §1.1 must reduce to on L∞(Ω).
- **The abstract interpolation functors** — compatible couples with their sum and intersection, Peetre's K-functional, Calderón's complex method with the three-lines operator bound, and the real K-method with exact interpolation of operators, retracts and endpoint isomorphisms. These cover the constructive core of §§2.2–2.4 and are where every later Lp couple will be plugged in.

### Roadmap coverage

Layer 2 is partial. Done: compatible couples, the sum and intersection, the K-functional and its basic laws, the complex method with its interpolation estimate and the real method with operator interpolation and monotonicity in q. Missing: regular couples, Calderón's upper method, complex duality and reiteration, the scalar identification (L¹, L∞)_{θ,q} = L^{p,q} (which also needs the Lorentz gauges of §1.6), and everything noncommutative (Lp–Lq duality, the semifinite interpolation identifications and noncommutative Riesz–Thorin). Layer 1 is untouched: the scalar rearrangement supplies the commutative model, but no τ-measurable operator or singular-number function exists. Layers 3–8 are untouched.

## The frontier

- **Generalized singular numbers (§1.1)** — define d_x and μ_t on the τ-measurable algebra and prove their calculus; this is blocked on VonNeumannAlgebras V10.TracialLp and V10.Affiliation, which this source does not yet contain.
- **Real interpolation of (L¹, L∞)** — connect the new K-functional formula to the compatible-couple K-functional and prove (L¹, L∞)_{θ,q} = L^{p,q} via the weighted Hardy inequalities; this needs the scalar Lorentz gauges first.
- **Complex duality and reiteration (§2.3)** — regular couples, Calderón's upper method and the duality ([E₀, E₁]_θ)* = [E₀*, E₁*]^θ remain; the lower method itself is in place.
- **Finite-dimensional Khintchine and Ball–Carlen–Lieb** — the matrix statements in `Suggested.lean` are statable now on `CStarMatrix (Fin d) (Fin d) ℂ`, but none has been stated in the library.
- **Layers 3–8** — all wait on noncommutative Lp; Haagerup spaces additionally need the continuous core of VonNeumannAlgebras Layer 11.
