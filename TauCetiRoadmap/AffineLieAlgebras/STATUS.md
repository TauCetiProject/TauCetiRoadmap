<!--tauceti-status:v1 {"roadmap":"AffineLieAlgebras","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
# Status: AffineLieAlgebras

This file documents the status of the AffineLieAlgebras roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The core of A1 is proved: the continuous second cohomology of formal loops is classified by invariant forms. A2 and A5 are each partly built. A3, A4 and A6–A8 have not begun, so neither headline theorem has been started. Those are the scalar center away from critical level and Feigin–Frenkel.

### Named results

- **Classification of continuous central extensions of formal loops**: for a finite-dimensional Lie algebra over an algebraically closed field of characteristic zero, with irreducible adjoint module and nondegenerate Killing form, Φ ↦ [cΦ] is a linear equivalence from invariant symmetric forms onto H²_cont(g((t)), 𝕜) ([`invariantFormsResidueClassEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/InvariantForms.html#TauCeti.CurrentAlgebra.invariantFormsResidueClassEquiv)). That cohomology is [one-dimensional](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/ContinuousCohomology.html#TauCeti.CurrentAlgebra.finrank_continuousSecondCohomology_eq_one). Coefficients are scalars only.
- **The polynomial loop classification**: under the same hypotheses, the second cohomology of the polynomial loop algebra is spanned by the Killing residue class ([`twoCocycle_eq_span_killingForm_sup_range_d₁₂`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Loop/Cocycle.html#TauCeti.LieAlgebra.LoopAlgebra.twoCocycle_eq_span_killingForm_sup_range_d₁₂)). It is obtained by using Whitehead's lemmas to normalise a cocycle on constant loops and then applying the mode recurrence.
- **Whitehead's second lemma**: over a field of characteristic zero, for a finite-dimensional Lie algebra with nondegenerate Killing form, every 2-cocycle valued in a finite-dimensional module is a coboundary ([`twoCocycle_eq_range_d₁₂`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Whitehead.html#LieModule.Cohomology.twoCocycle_eq_range_d₁₂)). The first lemma, that derivations are inner, is also proved ([`IsKilling.exists_eq_inner`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Whitehead.html#LieDerivation.IsKilling.exists_eq_inner)).
- **Perfectness of the residue extension**: the residue central extension of a perfect Lie algebra is perfect exactly when its form is nonzero ([`derivedSeries_ofTwoCocycle_eq_top_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/Perfect.html#TauCeti.CurrentAlgebra.derivedSeries_ofTwoCocycle_eq_top_iff)).
- **Uniqueness of invariant forms**: on a finite-dimensional Lie algebra over an algebraically closed field, with irreducible adjoint module and nondegenerate Killing form, every invariant form is a multiple of the Killing form ([`exists_eq_smul_killingForm`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Killing/InvariantForm.html#TauCeti.LieAlgebra.exists_eq_smul_killingForm)).

### Notable definitions and infrastructure

- **The current topology** ([`instCompleteSpace`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Current/Topology.html#TauCeti.CurrentAlgebra.instCompleteSpace)): formal currents carry the t-adic linear topology. It is Hausdorff and complete over finite free coefficients, the bracket is jointly continuous, and polynomial currents are dense. This is the setting for every continuous statement downstream.
- **Continuous second cohomology** ([`continuousSecondCohomology`](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Cohomology/Continuous.html#TauCeti.LieModule.Cohomology.continuousSecondCohomology)): continuous cochains with discrete coefficients in degrees one and two, with the joint-continuity criterion and density extensionality. Only these low degrees exist; there is no general continuous cochain complex.
- **Coinduction for smooth modules** ([`coinduction`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Smooth/Coinduction.html#TauCeti.coinduction)): the smooth part of coextension of scalars. Composed with the smooth-part coreflection it gives [enough injectives](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Smooth/Coinduction.html#TauCeti.enoughInjectives_smoothModules) and Ext in the morphism universe, which is the ambient Ext the downstream consumers need.

### Roadmap coverage

A1 is done apart from three items: the classification with an arbitrary discrete coefficient space Z, the finite-product semisimple version, and a full continuous cochain complex in all degrees with d² = 0 and functoriality. The topology, the residue cocycle with its coordinate invariance, and the scalar classification are in place. A2 is partial. It has the residue extension ĝκ with its polynomial embedding, perfectness exactly when κ ≠ 0, level rescaling K ↦ λK, and coordinate substitution on currents. Still missing are the extension's topology and continuous section, the splitting classification and universality, an intrinsic h∨ with Killing = 2h∨κ0, the loop and Aut(O) lifts, and their extension to Uκ. A5 is partial. Its object properties, smooth-part coreflection, coinduction, enough injectives and Ext are done. Central-character quotients, automorphism pullback, the equivalence with Ûκ-modules, the completed center and field calculus are absent. A3, A4, A6, A7 and A8 are untouched.

## The frontier

- **Coefficient-valued classification**: extend the scalar result to H²_cont(g((t)), Z) ≃ Z for an arbitrary discrete Z by constructing the normalising continuous coboundary without finite-dimensionality. A2's universal property depends on this.
- **Topology and splitting of ĝκ**: give the residue extension its continuous inclusion, projection and section. Then classify continuously split central extensions with one-dimensional discrete kernel and prove universality.
- **The dual Coxeter number**: define h∨ intrinsically and prove Killing = 2h∨κ0, building on the invariant-form uniqueness already proved. This fixes the critical level κc = −h∨κ0.
- **Central-level UEA and its completion (A4)**: form Uκ by the relation ι(K) = 1, the left ideals I_N and the inverse limit Ûκ with its multiplication. The A5 smooth-module equivalence and everything centre-related wait on this.
- **Affine loop lifts**: lift Ad_g to ĝκ with the residue Maurer–Cartan term. This needs the pinned G((t)) and the Maurer–Cartan differential from FormalConnectionsOpers.
