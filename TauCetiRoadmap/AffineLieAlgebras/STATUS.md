<!--tauceti-status:v1 {"roadmap":"AffineLieAlgebras","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7","ts":"2026-11-08T16:58:25+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer A1","remaining":"a continuous cochain complex in all degrees with d squared zero and functoriality","state":"partial"},{"id":"Layer A2","remaining":"the affine loop lift Ad_g with the residue Maurer-Cartan term","state":"partial"},{"id":"Layer A3","remaining":"rational integration of finitely generated smooth modules to K_N","state":"partial"},{"id":"Layer A4","remaining":"completed loop lifts and their semidirect laws with coordinate lifts","state":"partial"},{"id":"Layer A5","remaining":"central-character quotients and automorphism pullback (A5.3)","state":"partial"},{"id":"Layer A6","remaining":"formal vertex algebra axioms, Borcherds, reconstruction, the vertex structure on V_k, Sugawara and deformation","state":"partial"},{"id":"Layer A7","state":"untouched"},{"id":"Layer A8","remaining":"everything beyond the extended affine algebra: completed and noncritical centers, Feigin-Frenkel","state":"partial"}],"readme_sha":"93bd20db828b521dac7ae0b2ed1168e7f0931152ea3c8b5105dacbd524ff35e1","roadmap":"AffineLieAlgebras","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7"}-->
# Status: AffineLieAlgebras

This file documents the status of the AffineLieAlgebras roadmap up until `a4fcb57` (2026-11-08T16:58:25+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** A1 is done except for higher-degree continuous cochains, and A4.1, the completion Ûκ, is done. A2, A3, A4.2 and A5 are each partly built, and A6 has a vacuum module but no vertex algebra. A7 has not begun and A8 barely has, so neither headline theorem, the scalar center away from critical level or Feigin–Frenkel, has been started.

### Named results

- **Classification of continuous central extensions of formal loops**: for a finite-dimensional Lie algebra over a field of characteristic zero with nondegenerate Killing form, for instance a semisimple one, Φ ↦ [cΦ] is a linear equivalence from invariant symmetric forms onto H²_cont(g((t)), 𝕜) ([`invariantFormsResidueClassEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/InvariantForms.html#TauCeti.CurrentAlgebra.invariantFormsResidueClassEquiv)). For simple g that cohomology is [one-dimensional](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/ContinuousCohomology.html#TauCeti.CurrentAlgebra.finrank_continuousSecondCohomology_eq_one).
- **The coefficient-valued classification**: for simple g and every vector space Z with trivial action, of arbitrary dimension, z ↦ [cΨ ⊗ z] is a linear equivalence from Z onto H²_cont(g((t)), Z) ([`residueClassEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/ContinuousCohomology.html#TauCeti.CurrentAlgebra.residueClassEquiv)).
- **Universality of the residue extension**: the nonzero scalar residue extension is initial among extensions given by continuous two-cocycles with arbitrary trivial coefficients ([`existsUnique_residueExtensionLift`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/Universal.html#TauCeti.CurrentAlgebra.existsUnique_residueExtensionLift)), and the [universal map is continuous](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/Universal.html#TauCeti.CurrentAlgebra.continuous_residueExtensionLift).
- **The Killing normalisation by the dual Coxeter number**: on a simple Lie algebra over an algebraically closed field of characteristic zero, κ = 2h∨Φ exactly when Φ(θ∨, θ∨) = 2 ([`killingForm_eq_smul_iff_apply_coroot_highestRoot_eq_two`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Killing/DualCoxeterNumber.html#RootPairing.Base.killingForm_eq_smul_iff_apply_coroot_highestRoot_eq_two)). Here h∨ is [defined](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/DualCoxeterNumber.html#RootPairing.Base.dualCoxeterNumber) intrinsically as 1 + ht(θ∨), and this gives the [critical level](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Killing/DualCoxeterNumber.html#RootPairing.Base.neg_inv_two_smul_killingForm_eq_neg_smul) −h∨Φ.
- **Smooth modules are discrete modules over the completion**: modules over U(ĝ)/(K − a) on which each vector is killed by currents of high order form a category equivalent to discrete Ûκ-modules ([`smoothModulesEquivalence`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/CompletedModules.html#TauCeti.CurrentAlgebra.smoothModulesEquivalence)).

### Notable definitions and infrastructure

- **The completed enveloping algebra** ([`CompletedEnveloping`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/Completion.html#TauCeti.CurrentAlgebra.CompletedEnveloping)): the inverse limit of U/I_N, with a [ring structure](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/Completion.html#TauCeti.CurrentAlgebra.instRingCompletedEnveloping) and continuous multiplication. Its center acts on every smooth module, and [centrality is detected on currents](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/Center.html#TauCeti.CurrentAlgebra.mem_center_iff_forall_commute). A8's center theorems live here.
- **The vacuum module** ([`VacuumModule`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/Vacuum/Basic.html#TauCeti.CurrentAlgebra.VacuumModule)): U/I₀, with its [PBW identification](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/Vacuum/Basic.html#TauCeti.CurrentAlgebra.vacuumPBWEquiv) with U(t⁻¹g[t⁻¹]) at every level, including the critical one. It also has the translation and degree operators, and the current fields are [translation covariant](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/Vacuum/VectorField.html#TauCeti.CurrentAlgebra.lie_vacuumTranslation_ncoeff_currentField).
- **Coinduction for smooth modules** ([`coinduction`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Smooth/Coinduction.html#TauCeti.coinduction)): the smooth part of coextension of scalars, which gives [enough injectives](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Smooth/Coinduction.html#TauCeti.enoughInjectives_smoothModules) and Ext in the module universe.

### Roadmap coverage

**A1** is partial. Only one item is missing: continuous cochains exist just in degrees one and two, with no complex in all degrees satisfying d² = 0. Everything else, including [Whitehead's lemmas](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Whitehead.html#LieModule.Cohomology.twoCocycle_eq_range_d₁₂), is in place.

**A2** is partial. ĝκ has its topology, continuous section, splitting for discrete kernels and universality. Also in place are h∨ with Killing = 2h∨κ0, coordinate substitution with its composition law, and Uκ with its left ideals, right-shift estimate and level comparison (which extends after adjoining d). The affine loop lift is absent.

**A3** is partial. The polynomial/formal comparison of smooth modules is done, and finitely generated smooth modules are [presented by copies of U/I_N](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/Presentation.html#TauCeti.CurrentAlgebra.exists_surjective_pi_orderQuotient). Rational integration to K_N is absent.

**A4** is partial. A4.1 is done, and coordinate lifts and the level comparison extend to Ûκ, but loop lifts do not.

**A5** is partial. A5.1, A5.2 and most of A5.4 are done, including the module equivalence, the completed center and local current fields. A5.3, central characters and automorphism pullback, is absent.

**A6** is partial: the vacuum module and field-level calculus exist, but there are no vertex algebra axioms, no Borcherds identity, no Sugawara vector and no deformation family.

**A7** is untouched.

**A8** is partial in the thinnest sense. It has only the extended affine algebra ĝ′ = ĝ ⋊ 𝕜d, whose level enveloping algebra is [an Ore extension by t d/dt](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/ExtendedAffine.html#TauCeti.CurrentAlgebra.extendedEnvelopingOreEquiv). No center theorem has started.

## The frontier

- **Central characters and automorphism pullback (A5.3)**: quotients of Ûκ by closed central ideals, the equivalence with modules killed by them, and transport along continuous automorphisms. It needs only A5.1.
- **Formal vertex algebras (A6.1)**: FormalVertexAxioms, the Borcherds identity and the reconstruction theorem. Locality, derivatives and residue products of fields already exist.
- **The vacuum vertex algebra Vκ (A6.2)**: apply reconstruction to the vacuum module, whose current fields are already local and translation covariant. Then build the Sugawara vector and its central charge k·dim g/(k + h∨).
- **The affine loop lift (A2.3, A4.2)**: lift Ad_g to ĝκ with the residue Maurer–Cartan term, then to Uκ and Ûκ. This is blocked on the pinned G((t)) and Maurer–Cartan differential from FormalConnectionsOpers.
- **Rational integration to K_N (A3.2)**: the finite presentation step is done, but the finite-jet nilpotence estimates on U/I_N and the exponential to K_N remain. These need the supplier's congruence subgroups.
