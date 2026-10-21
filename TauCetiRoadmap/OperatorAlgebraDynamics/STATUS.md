<!--tauceti-status:v1 {"roadmap":"OperatorAlgebraDynamics","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5","ts":"2026-10-21T00:36:19Z"}-->
# Status: OperatorAlgebraDynamics

This file documents the status of the OperatorAlgebraDynamics roadmap up until `c1c6773` (2026-10-21T00:36:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the foundations of D1 (actions, multipliers, twisted convolution, integrated forms) and D7 (generators, entire analytic elements, the definition of KMS states) have landed. No crossed product, groupoid algebra, modular-theory comparison or spin-system result exists yet, and D2–D6 and D8–D9 are untouched.

### Named results

- **The analytic KMS condition** — for a β-KMS state ω and an entire analytic b, ω(a α_{iβ}(b)) = ω(ba) ([`IsKMSState.apply_mul_entireExtension_mul_I`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/KMS.html#TauCeti.CStarAction.IsKMSState.apply_mul_entireExtension_mul_I)). The converse is proved only when every element is entire analytic ([`isKMSState_iff_of_forall_isEntireAnalytic`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/KMS.html#TauCeti.CStarAction.isKMSState_iff_of_forall_isEntireAnalytic)).
- **Uniqueness and the norm bound for KMS functions** — the KMS function of a pair is unique by Schwarz reflection and bounded on the strip by ‖φ‖‖a‖‖b‖ by Phragmén–Lindelöf ([`IsKMSFunction.eqOn`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/KMS.html#TauCeti.CStarAction.IsKMSFunction.eqOn), [`IsKMSFunction.norm_le`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/KMS.html#TauCeti.CStarAction.IsKMSFunction.norm_le)).
- **0-KMS states are traces** — at β = 0 the KMS states are exactly the tracial states, with no invariance forced ([`isKMSState_zero_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/KMS.html#TauCeti.CStarAction.isKMSState_zero_iff)).
- **Associativity and L¹ submultiplicativity of twisted convolution** — on C_c(G,A) for an arbitrary locally compact group, with no σ-finiteness ([`convolution_assoc`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/Convolution.html#TauCeti.CStarAction.convolution_assoc), [`integral_norm_convolution_le`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/Convolution.html#TauCeti.CStarAction.integral_norm_convolution_le)).
- **Boundedness of the integrated form** — the integrated form of a covariant pair, defined by vector integration, is bounded by the L¹ norm ([`norm_integratedOperator_le`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/Covariant/Integrated.html#TauCeti.CStarAction.CovariantRepresentation.norm_integratedOperator_le)).

### Notable definitions and infrastructure

- **The generator of a real action** ([`generator`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/Generator.html#TauCeti.CStarAction.generator)) — a closed, densely defined *-derivation whose domain is a *-subalgebra. It is the object on which perturbations, ground states and the D7 equivalences will be stated.
- **Entire analytic elements and complex-time evolution** ([`entireAnalytic`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/Analytic.html#TauCeti.CStarAction.entireAnalytic), [`entireExtension`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/Analytic.html#TauCeti.CStarAction.entireExtension)) — a star subalgebra with α_z defined by unique continuation, multiplicative, satisfying the star relation α_z(a*) = (α_{z̄}(a))* and bounded on strips. This makes the analytic form of the KMS condition expressible.
- **Multiplier extensions** ([`multiplierExtension`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Representation/Nondegenerate.html#NonUnitalStarAlgHom.multiplierExtension), [`CStarAction.multiplier`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/Multiplier.html#TauCeti.CStarAction.multiplier)) — nondegenerate representations and actions extend to the multiplier algebra, the induced action being strictly continuous. This is what the universal property of the crossed product will be phrased in.

### Roadmap coverage

**D1** is partial. Actions, equivariant maps, invariant subalgebras, restriction, multiplier extensions, twisted convolution with its support, associativity and L¹ bound, the twisted involution, and the bounded integrated form are in place. Still missing are the involution laws for the integrated form (multiplicativity, star), the L¹ Banach *-algebra and its approximate units, the regular covariant representation, the full norm and `A⋊αG`, its universal property, and the ideal exact sequence. **D7** is partial: the generator, entire analytic elements and the KMS definition with its basic analytic theory exist. Gaussian density, perturbations, invariance for β ≠ 0, the modular characterization, the simplex structure, ground states and the Gibbs example do not. **D2–D6** (reduced products, induction, Takai duality, groupoids) and **D8–D9** (CAR/Weyl and spin systems) are untouched.

## The frontier

- **Integrated form as a *-representation** — prove multiplicativity and the star law for the integrated form of a covariant pair. The README prescribes doing this first for compact-support integrands, then by L¹ approximation.
- **The twisted L¹ algebra** — prove ‖f*‖₁ = ‖f‖₁ and that the involution is anti-multiplicative for convolution, complete to the Banach *-algebra, and build approximate units. This is the input to the full norm.
- **Density of entire analytic elements** — Gaussian smearing gives a norm-dense invariant subalgebra. With it, the KMS characterization can be upgraded from the all-entire special case to checking on a dense invariant algebra.
- **Invariance of β-KMS states for β ≠ 0** and the finite-dimensional Gibbs state — both are self-contained D7 milestones on top of the existing KMS API.
- **Regular covariant representation and the full crossed product** — the regular representation on L²(G,H), then the full norm via a bounded family of cyclic representations, `A⋊αG`, and its universal property into multiplier algebras.
