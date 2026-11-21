<!--tauceti-status:v1 {"roadmap":"NoncommutativeIntegration","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"singular numbers and the measure topology on tau-measurable operators; only scalar rearrangements and Lorentz classes exist","state":"untouched"},{"id":"Layer 2","remaining":"regular couples, the upper method, complex duality and reiteration, and all noncommutative duality and interpolation","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"row and column spaces, the random-sum norm on Lp(M), and the p=1 Khintchine inequality; Kahane is done for real normed spaces","state":"partial"},{"id":"Layer 7","remaining":"everything; only abstract Rademacher type and cotype definitions exist","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"6a5cf12c302d870979c06d868e947192035df24fc7fe070d09aa1d687941ffd7","roadmap":"NoncommutativeIntegration","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: NoncommutativeIntegration

This file documents the status of the NoncommutativeIntegration roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The scalar and Banach-space groundwork is well advanced. The abstract interpolation functors, the scalar identifications of (L¹, L∞) and of the Lebesgue couples, and Kahane's inequality for Rademacher sums are all in place. Nothing noncommutative has begun: there are no τ-measurable operators, singular numbers, noncommutative Lp spaces or Haagerup spaces in the library. Layers 2 and 6 are partial and the rest are untouched.

### Named results

- **Kahane's inequality** — in any real normed space the q-th and p-th moments of a finite Rademacher sum agree up to an explicit constant depending only on 0<p,q<∞. The proof goes through Lévy's reflection inequality and the Hoffmann–Jørgensen tail iteration ([`rademacherMoment_le_kahaneConst_mul`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/RademacherSum/Kahane.html#TauCeti.rademacherMoment_le_kahaneConst_mul)).
- **The K-functional of (L¹, L∞)** — for the compatible couple (L¹, L∞), Peetre's K(t, f) equals ∫₀ᵗ f*, the integral of the decreasing rearrangement ([`ofReal_kFunctional_l1Linfty`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Interpolation/L1Linfty.html#TauCeti.CompatibleCouple.ofReal_kFunctional_l1Linfty)). This is the scalar model of the Fack–Kosaki formula K(t, x) = ∫₀ᵗ μ_s(x) ds of §2.5.
- **Real interpolation of (L¹, L∞) is Lorentz** — for 0<θ<1, 1/p = 1−θ and 1 ≤ q ≤ ∞, the space (L¹, L∞)_(θ,q) consists exactly of the Lorentz class L^(p,q), with equivalent norms. At q = p this gives an isomorphism with Lᵖ (`exists_mem_kMethod_lebesgue_one_top_iff_memLorentz`, `lebesgueOneTopKMethodEquivLp`).
- **Complex interpolation of Lebesgue spaces** — Lᵖ embeds contractively into [L^(p₀), L^(p₁)]_θ for complex Banach-valued functions. The reverse contraction holds for complex inner-product-valued functions on σ-finite spaces, so [L^(p₀), L^(p₁)]_θ = Lᵖ isometrically in that setting (`lpToLebesgueComplexMethod`, `ComplexMethodSpace.lebesgueToLp`).
- **Shifted subadditivity of rearrangements** — (f + g)*(s + t) ≤ f*(s) + g*(t), the commutative case of the Fack–Kosaki law for singular numbers ([`decreasingRearrangement_add_le`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Function/DecreasingRearrangement.html#MeasureTheory.Measure.decreasingRearrangement_add_le)).

### Notable definitions and infrastructure

- **The abstract interpolation functors** — compatible couples with their sums and intersections, Peetre's K-functional and the real K-method with exact operator interpolation and monotonicity in q. They also include Calderón's complex method with the three-lines bound, Gaussian multipliers, the [symmetry](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Interpolation/ComplexMethod/Symmetry.html#TauCeti.CompatibleCouple.ComplexMethodSpace.swap) [E₀, E₁]_θ = [E₁, E₀]_(1−θ) and a universal property. Every later Lp couple plugs into these.
- **The decreasing rearrangement** ([`decreasingRearrangement`](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Function/DecreasingRearrangement.html#MeasureTheory.Measure.decreasingRearrangement)) — defined for an arbitrary measure. It is the model that the noncommutative μ_t of §1.1 must reduce to on L∞(Ω).
- **Rademacher moments and type/cotype** — the moment [`rademacherMoment`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/RademacherSum/Moment.html#TauCeti.rademacherMoment) on the sign cube, with reindexing, sign, truncation and contraction laws, and the abstract notions of Rademacher type and cotype. These are the Banach-space shell for the random-sum norm K_p(a) of §6.2 and for the type and cotype statements of §7.5.

### Roadmap coverage

**Layer 2** is partial. Couples, the K-functional, the complex method with symmetry, the real method, and the scalar identifications (L¹, L∞)_(θ,q) = L^(p,q) and [L^(p₀), L^(p₁)]_θ = Lᵖ are all done. Still missing are regular couples, regularization, Calderón's upper method, complex duality and reiteration, and everything noncommutative: Lp–Lq duality, the semifinite identifications of §2.5 and noncommutative Riesz–Thorin. **Layer 6** is partial. The Banach-space content of §6.2 is done: Kahane's inequality, Lévy's inequality, the tail iteration, the contraction principle and truncation. The row and column spaces of §6.1, the random-sum norm on Lp(M) and the p=1 Khintchine inequality of §6.3 are untouched. **Layer 1** is untouched: scalar rearrangements and Lorentz classes exist, but no singular-number function on τ-measurable operators does. **Layers 3, 4, 5, 7 and 8** are untouched. For Layer 7, only the abstract type and cotype definitions exist.

## The frontier

- **Complex duality and reiteration (§2.3)** — regular couples, Calderón's upper method, the duality ([E₀, E₁]_θ)* = [E₀*, E₁*]^θ and reiteration remain. The lower method, symmetry and Gaussian multipliers are in place.
- **Finite-dimensional Khintchine and Ball–Carlen–Lieb** — the matrix statements in `Suggested.lean` are statable on `CStarMatrix (Fin d) (Fin d) ℂ`. Kahane's inequality now supplies the second-moment conversion, but the row, column and random-sum gauges are not yet defined in the library.
- **Generalized singular numbers (§1.1)** — d_x and μ_t on the τ-measurable algebra need VonNeumannAlgebras V10.TracialLp and V10.Affiliation, which this source does not contain. This blocks all of Layer 1 and the noncommutative half of Layer 2.
- **Row and column spaces (§6.1)** — these also need noncommutative Lp and the tensor products M⊗̄B(ℓ²). The scalar Kahane machinery is ready to be pointed at them.
- **Layers 3–8** — all wait on noncommutative Lp. Haagerup spaces additionally need the continuous core of VonNeumannAlgebras Layer 11.
