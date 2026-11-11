<!--tauceti-status:v1 {"roadmap":"EllipticCohomology","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe","ts":"2026-11-09T11:59:37+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"stack comparison, étale-site cohomology and duality, Hodge descent, height two at general p, Tate–Messing and Serre–Tate deformations","state":"partial"},{"id":"Layer 2","remaining":"every spectral target; only the Mahler translation-difference sequence and completion/fracture lemmas are in","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"ce79eac42b7caf9e3e0758660080c40de51a90b168a258ce01815846b560cdd2","roadmap":"EllipticCohomology","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe"}-->
# Status: EllipticCohomology

This file documents the status of the EllipticCohomology roadmap up until `d92acc5` (2026-11-09T11:59:37+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The algebraic side of Layer 1 has reached its stated headline: Deligne's computation of integral modular forms on the Weierstrass Hopf algebroid, with the comparison to analytic q-expansions. The stack-theoretic parts of Layer 1 have not started, and neither has its deformation theory. Layer 2 has only a few algebraic lemmas about p-adic functions and completions. Nothing spectral exists: no sheaf O^top, no tmf, Tmf or TMF, and no MString or orientation, so Layers 3–6 are untouched.

### Named results

- **Deligne's theorem on integral modular forms** — a polynomial in a₁, …, a₆ transforms with weight k under every coordinate change over every ring exactly when it lies in ℤ[c₄, c₆, Δ] and is weighted homogeneous of weight k ([`isIntegralModularForm_iff`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/ModularForm.html#WeierstrassCurve.isIntegralModularForm_iff)). This is the first of the roadmap's two target signatures.
- **The presentation ℤ[c₄, c₆, Δ] = ℤ[C₄, C₆, D]/(C₄³ − C₆² − 1728D)** — the only relation among the three invariants is the classical one ([`ker_aeval_c₄_c₆_Δ`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Invariants/Presentation.html#WeierstrassCurve.ker_aeval_c₄_c₆_Δ)). This holds for any curve whose c₄ and c₆ are algebraically independent, and the universal curve qualifies ([`algebraicIndependent_c₄_c₆`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Invariants/AlgebraicIndependent.html#WeierstrassCurve.Universal.algebraicIndependent_c₄_c₆)).
- **The integral q-expansion lattice** — a level-one analytic modular form with integer q-expansion is the Tate expansion of an integral modular form of the same weight ([`exists_isIntegralModularForm_specialize_tateCurve_eq`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/QExpansion.html#ModularForm.exists_isIntegralModularForm_specialize_tateCurve_eq)). The converse also holds, and the Tate curve's c₄, c₆ and Δ match E₄, −E₆ and the discriminant.
- **Integral modular forms are the Hopf-algebroid invariants** — f has weight k exactly when η_R f = u⁻ᵏ η_L f in the arrow ring Γ ([`isIntegralModularForm_iff_rightUnit`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/VariableChange/HopfAlgebroid.html#WeierstrassCurve.isIntegralModularForm_iff_rightUnit)).
- **Height strata in characteristics 2 and 3** — an elliptic curve is ordinary exactly when its formal group has height one, and supersingular exactly when it has height two ([`isSupersingular_iff_height_formalGroup_eq_two_of_char_three`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Char/Three.html#WeierstrassCurve.isSupersingular_iff_height_formalGroup_eq_two_of_char_three)). For a general prime there is so far only the height-one criterion ([`height_formalGroup_eq_one_iff`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Height.html#WeierstrassCurve.height_formalGroup_eq_one_iff)).

### Notable definitions and infrastructure

- **The Weierstrass Hopf algebroid** (A, Γ) carries its coproduct, counit and conjugation in the README's conventions, with coassociativity ([`coproduct_coassoc`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/VariableChange/HopfAlgebroid.html#TauCeti.WeierstrassHopfAlgebroid.coproduct_coassoc)), the counit laws and the antipode laws. Its source and target projections are smooth of relative dimension four ([`smoothOfRelativeDimension_source`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/VariableChange/Groupoid.html#TauCeti.WeierstrassHopfAlgebroid.smoothOfRelativeDimension_source)). E4 needs its cobar complex.
- **The coordinate-change group** is corepresented by ℤ[u, u⁻¹, r, s, t] and decomposes as the Heisenberg group semidirect 𝔾ₘ ([`semidirectProductEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/VariableChange/SemidirectProduct.html#WeierstrassCurve.VariableChange.semidirectProductEquiv)), as the README requires.
- **The cuspidal locus V(c₄, Δ)** has codimension two in the cubic atlas ([`height_span_c₄_Δ`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Invariants/CuspidalLocus.html#WeierstrassCurve.Universal.height_span_c₄_Δ)), with the atlas-level Hartogs extension from D(c₄) ∪ D(Δ). This is the route to the compactified H⁰.

### Roadmap coverage

Layer 1 is partial. Done:
- the cubic Hopf algebroid and its groupoid laws
- smoothness of the atlas projections
- codimension two of the cusp and the atlas-level Hartogs extension
- Deligne's invariant ring, its presentation and its ℤ[1/6] form
- the analytic q-expansion comparison
- the multiplicative formal group of the Tate curve at q = 0
- height strata at p = 2, 3

Not started:
- the moduli-stack comparison with M_(1,1) and the étale site
- stack cohomology, local cohomology and duality
- Hodge-line descent and the stack form of the Hartogs comparison
- Riemann–Roch on nodal families
- height-two strata at general p
- Tate–Messing, Serre–Tate and the residue-field descent

Layer 2 is partial in a narrow sense, with algebraic inputs only:
- the translation-difference exact sequence on C(ℤ_p) and on the p-adic units modulo torsion
- principal-adic completion exactness with torsion-free cokernel
- the cartesian localization–completion square

None of Layer 2's spectral targets has begun. Layers 3–6 are untouched.

## The frontier

- **Height two at every prime** — extend the char 2/3 height strata to a general prime p: supersingular exactly when the height is two, and the height is always at most two. The height-one criterion through the invariant differential is already in place.
- **The stack form of Deligne's theorem** — identify H⁰(Mbar_ell, ω^k) with the weight-k invariants. This is blocked on SchemeAndStackFoundations' stack carrier and §4.15's stable genus-one stack, and on descent of the Hodge line along the cubic atlas.
- **Cobar comparison** — compare the Hopf algebroid's cobar complex with stack cohomology. This is the input to E4's coefficient computation, and it needs E1's site and cohomology constructions first.
- **Formal deformations** — build the Tate–Messing equivalence and the ordinary/supersingular Serre–Tate split, with residue-field descent. These consume ModularCurves §§7C–7F and BordismFormalGroups F5.
- **Layer 2's algebraic lane** — prove (p, v₁)-regularity on étale charts and apply the new completion and fracture lemmas to the coefficient pullback square. All spectral work waits on GeneralizedCohomology and on BordismFormalGroups F6.
