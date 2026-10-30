<!--tauceti-status:v1 {"roadmap":"OperatorAlgebraDynamics","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
# Status: OperatorAlgebraDynamics

This file documents the status of the OperatorAlgebraDynamics roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Two layers have started. D1 has its convolution ⋆-algebra, a multiplicative integrated form and the regular covariant representation, but no completed crossed product yet. D7 has its basic KMS theory, including the dense criterion, invariance, and compactness and convexity of K_β, but none of the modular, simplex or ground-state theory. D2–D6 and D8–D9 have not begun.

### Named results

- **The dense analytic KMS criterion** — a state is β-KMS exactly when ω(a α_{iβ}(b)) = ω(ba) holds for a and b in some norm-dense invariant set of entire analytic elements ([`isKMSState_iff_of_dense`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/KMS/Dense.html#TauCeti.CStarAction.isKMSState_iff_of_dense)). Gaussian smearing provides such a set.
- **Invariance of KMS states** — for β ≠ 0, every β-KMS state is invariant under the dynamics ([`IsKMSState.apply_action`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/KMS/Basic.html#TauCeti.CStarAction.IsKMSState.apply_action)). At β = 0 the KMS states are exactly the tracial states, which need not be invariant.
- **Compactness and convexity of K_β** — for a unital algebra, the β-KMS states form a [convex](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/KMS/StateSpace.html#TauCeti.CStarAction.convex_kmsStates), [weak-* compact](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/KMS/StateSpace.html#TauCeti.CStarAction.isCompact_kmsStates) set. A pointwise limit of KMS states is again a KMS state whenever it has norm one ([`IsKMSState.of_tendsto`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/KMS/StateSpace.html#TauCeti.CStarAction.IsKMSState.of_tendsto)).
- **Uniqueness and the norm bound for KMS functions** — Schwarz reflection makes the KMS function of each pair unique, and Phragmén–Lindelöf bounds it on the strip by ‖φ‖‖a‖‖b‖ (`IsKMSFunction.eqOn`, `IsKMSFunction.norm_le`).
- **Multiplicativity of the integrated form** — for a covariant pair, the integrated form satisfies (π⋊U)(f⋆g) = (π⋊U)(f)(π⋊U)(g) and is bounded by the L¹ norm ([`integratedOperator_convolution`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/Covariant/Integrated.html#TauCeti.CStarAction.CovariantRepresentation.integratedOperator_convolution), [`norm_integratedOperator_le`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/Covariant/Integrated.html#TauCeti.CStarAction.CovariantRepresentation.norm_integratedOperator_le)). It holds for arbitrary locally compact G, with no σ-finiteness.

### Notable definitions and infrastructure

- **The convolution ⋆-algebra of a C⋆-dynamical system** ([`ConvolutionAlgebra`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/Convolution/Algebra.html#TauCeti.CStarAction.ConvolutionAlgebra)) — C_c(G,A) with twisted convolution and the modular-twisted involution, packaged as a nonunital star ring and star module. Both the full norm and the reduced norm will be defined on this algebra.
- **The regular covariant representation** ([`CovariantRepresentation.regular`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/Covariant/Regular.html#TauCeti.CStarAction.CovariantRepresentation.regular)) — the covariant pair on L²(G,H) induced by any representation ρ of A. Its coefficient map is multiplication by an operator-valued function, and its group part is the strongly continuous left regular representation. Its integrated forms will give definiteness of the full norm and, in D2, the reduced norm.
- **Entire analytic elements and Gaussian smearing** ([`entireAnalytic`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/Analytic.html#TauCeti.CStarAction.entireAnalytic), [`dense_entireAnalytic`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Action/GaussianSmearing.html#TauCeti.CStarAction.dense_entireAnalytic)) — a dense star subalgebra on which complex-time evolution α_z is defined. This is the domain on which the analytic form of the KMS condition is stated and checked.

### Roadmap coverage

**D1** is partial. In place are actions and multiplier extensions, twisted convolution with its associativity and L¹ bound, the involution's reversal of convolution, the convolution ⋆-algebra, the bounded and multiplicative integrated form, and the regular covariant representation. Still missing are the star law for the integrated form, ‖f*‖₁ = ‖f‖₁ and the L¹ Banach ⋆-algebra with its approximate units, nondegeneracy and injectivity of the regular representation, the full norm and `A⋊αG` with its universal property, the ideal exact sequence, and the group-algebra identifications. **D7** is partial. Beyond the generator and the KMS definition, it now has the dense criterion, invariance for β ≠ 0, pullback along quotients, restriction to invariant subalgebras, and the convexity, compactness and weak-* closedness of K_β. Still missing are tensor products of KMS states, bounded perturbations of the generator, the modular characterization, the simplex and extreme-state theory, ground states and the finite-dimensional Gibbs state. **D2–D6** and **D8–D9** are untouched.

## The frontier

- **The integrated form as a ⋆-representation** — prove (π⋊U)(f*) = (π⋊U)(f)*. Multiplicativity is already done, so this is the last step before the integrated form becomes a ⋆-homomorphism of the convolution algebra.
- **The twisted L¹ Banach ⋆-algebra** — prove that the twisted involution is L¹-isometric, complete C_c(G,A), and build approximate units compatible with those of A.
- **The full crossed product** — prove that the integrated regular representation of a faithful ρ is injective on C_c(G,A). Then define the full norm over a bounded family of cyclic representations, complete to `A⋊αG`, and prove its universal property into multiplier algebras.
- **The Gibbs state and ground states** — for a matrix Hamiltonian K, the unique β-KMS state is Tr(e^{−βK}·)/Tr(e^{−βK}), and the β → ∞ limits are ground states. Both build directly on the existing KMS and state-space API.
- **The KMS simplex and modular characterization** — show that extreme KMS states are exactly the factor states and that K_β is a Choquet simplex, and identify the modular flow with τ_{−βt}. These need the GNS normal extension and V10's modular operator, and are the heaviest remaining part of D7.
