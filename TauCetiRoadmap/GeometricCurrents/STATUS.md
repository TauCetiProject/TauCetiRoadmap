<!--tauceti-status:v1 {"roadmap":"GeometricCurrents","to_sha":"5d671b97e3d9afab126136a621a8044b6f545468","ts":"2026-10-24T12:00:07Z"}-->
# Status: GeometricCurrents

This file documents the status of the GeometricCurrents roadmap up until `5d671b9` (2026-10-24T12:00:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only Euclidean groundwork for G1 has landed so far. Test forms on open subsets of a finite-dimensional space have a continuous exterior derivative, the oriented integration current exists and has zero boundary, and distributions can be regularized by translation. The manifold carrier, mass, and every layer from G2 to G7 have not been started.

### Named results

- **Stokes' theorem for compactly supported forms** — on an open set of an oriented finite-dimensional real space, integrating an exact compactly supported top-degree form gives zero, so the integration current has no boundary ([`integrationCurrent_extDerivCLM`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/TestFunction/IntegrationCurrent.html#Orientation.integrationCurrent_extDerivCLM)).
- **d∘d = 0 on test forms** — the exterior derivative of compactly supported test forms squares to zero as an identity of continuous linear maps ([`extDerivCLM_comp_extDerivCLM`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/TestFunction/ExtDeriv.html#TestFunction.extDerivCLM_comp_extDerivCLM)), which is the step that gives ∂² = 0 once currents are defined as its dual.
- **Differentiating a regularization** — pairing a distribution with translates of a test function gives a smooth function whose derivative is the regularization of the distributional derivative ([`fderiv_translatePairing_apply`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/Regularization.html#Distribution.fderiv_translatePairing_apply)). So a distribution with vanishing derivatives has [locally constant regularizations](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/Regularization.html#Distribution.translatePairing_eq_of_lineDerivOp_eq_zero).
- **Distributions have locally finite order** — on each compact set a distribution is bounded by finitely many derivatives of the test function ([`exists_norm_apply_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/Order.html#Distribution.exists_norm_apply_le)).

### Notable definitions and infrastructure

- **The oriented integration current** [`integrationCurrent`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/TestFunction/IntegrationCurrent.html#Orientation.integrationCurrent) is the comparison current that the constancy theorem needs. It is defined using only the orientation, it changes sign when the orientation is reversed, it is compatible with restriction to smaller open sets, and it is a Dirac mass in dimension zero.
- **The exterior derivative on test forms** [`extDerivCLM`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/TestFunction/ExtDeriv.html#TestFunction.extDerivCLM) works on native vector-valued test functions, the Euclidean model of G1's test forms. It comes with a top-degree reduction: a current with zero boundary kills every derivative of a scalar test function, which turns constancy into a question about scalar distributions.
- **Operator-valued distributions** [`dualEquivDistribution`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/TestFunction/DualEquiv.html#TestFunction.dualEquivDistribution) identifies continuous linear maps on vector-valued tests with operator-valued distributions, compatibly with derivatives. This is the route to the componentwise vector-valued form of the constancy criterion.

### Roadmap coverage

G1 is partial, and only in its Euclidean part. Exterior derivative on Euclidean test forms, the integration current, and the regularization inputs to the scalar constancy criterion are in place. Still to come for G1: the manifold `TestForm` carrier and its chart comparisons, `Current k M` with boundary, restriction and gluing, extended and local mass with the Radon mass measure, the scalar criterion, and the real constancy theorem. G2 (rectifiability, integration, pushforward, products, slicing), G3 (integral-current homology), G4a/G4b (flat topology, deformation, Federer–Fleming compactness), G5 (Plateau and homological minimizers), G6 (first variation and interior regularity) and G7 are untouched.

## The frontier

- **The scalar constancy criterion** — show that a distribution on a connected Euclidean open set whose derivatives all vanish is a constant multiple of Lebesgue integration. Locally constant regularizations are done. What remains is mollifier convergence in the test topology, to recover the distribution from its regularizations, and then matching the constants on overlapping balls.
- **The Euclidean constancy theorem for top-degree currents** — combine the top-degree zero-boundary reduction with the scalar criterion to show that such a current on a connected open set is a constant multiple of the integration current. This waits only on the criterion above.
- **The manifold carrier** — define `TestForm k M` and `Current k M` by specializing ComplexKahlerGeometry K5a's real bundle-test foundation. Prove the Euclidean chart comparison with the native test functions already in use here. The supplier is the main prerequisite.
- **Mass** — extended mass as a supremum over tests of comass at most one, local finite mass, and the Radon mass measure. This needs CalibratedGeometry C1's comass.
- **G2 onward** — integer-rectifiable and integral currents depend on G1's carrier and mass and on GeometricMeasureTheory G2–G6. Nothing here has started.
