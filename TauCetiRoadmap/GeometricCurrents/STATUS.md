<!--tauceti-status:v1 {"roadmap":"GeometricCurrents","to_sha":"941bb58ae04c2464c632a44d715f17b21b6bea5e","ts":"2026-11-12T09:51:59+11:00"}-->
# Status: GeometricCurrents

This file documents the status of the GeometricCurrents roadmap up until `941bb58` (2026-11-12T09:51:59+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Euclidean half of G1 is essentially complete: test forms, currents as their duals, mass with its Radon measure, normal currents and the real constancy theorem all work on open subsets of a finite-dimensional space. Euclidean pieces of G2 and G4a have also landed: pushforward, interval products, cones and the real flat norm. Nothing yet lives on a manifold, there are no integer-rectifiable or integral currents, and G3 and G4b–G7 have not begun.

### Named results

- **The constancy theorem** — on a connected open subset of an oriented real vector space, a top-degree current with zero boundary is a unique real multiple of the oriented integration current ([`existsUnique_eq_smul_integrationCurrent_of_comp_extDerivCLM_eq_zero`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/Constancy/Current.html#Orientation.existsUnique_eq_smul_integrationCurrent_of_comp_extDerivCLM_eq_zero)). A local version on arbitrary open sets and a degree-zero case come with it.
- **Distributions with vanishing derivatives are constant** — a Banach-valued distribution on a connected open set whose directional derivatives all vanish is integration against a unique constant ([`existsUnique_eq_ofFun_const_of_forall_lineDerivOp_eq_zero`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/Constancy/Basic.html#Distribution.existsUnique_eq_ofFun_const_of_forall_lineDerivOp_eq_zero)). It is proved by mollification, as the README asks.
- **Polar decomposition of a current** — a current of locally finite mass is integration of a measurable density of dual norm one against its mass measure, T = τ‖T‖ ([`apply_eq_integral_polarDensity`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/Mass/PolarDensity.html#Distribution.apply_eq_integral_polarDensity)).
- **The cone inequality** — the cone from p over a k-current supported in the ball of radius r about p has mass at most r M(T)/(k+1) ([`mass_cone_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/TestFunction/Cone.html#Distribution.mass_cone_le)). Its boundary formula includes the degree-zero augmentation term.
- **The homotopy formula** — for a smooth proper homotopy H, ∂H#([0,1]×T) = H₁#T − H₀#T − H#([0,1]×∂T) ([`comp_homotopyPullbackCLM_comp_extDerivCLM`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/TestFunction/Homotopy.html#ContinuousLinearMap.comp_homotopyPullbackCLM_comp_extDerivCLM)). It comes with the README's interval-product bounds, for example [M(∂([[a,b]]×T)) ≤ 2M(T)+|b−a|M(∂T)](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/TestFunction/CylinderHomotopy.html#Distribution.mass_comp_intervalCylinderHomotopyCLM_comp_extDerivCLM_le).

### Notable definitions and infrastructure

- **The mass measure** [`massMeasure`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/Mass/Measure.html#Distribution.massMeasure) is the least outer-regular measure dominating evaluation, and on open sets it equals the local mass. Borel restriction T⌞A and slicing are built on it.
- **Normal and locally normal currents** [`IsNormal`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/Mass/Normal.html#Distribution.IsNormal) are stable under boundary, restriction, smooth multiples, pushforward and interval products.
- **The real flat completion** [`RealFlatChain`](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/Flat/Completion.html#TauCeti.RealFlatChain) completes normal currents under the flat norm. Boundary and test evaluation extend continuously to it, and it maps back to currents.

### Roadmap coverage

- **G1** is partial. Its Euclidean part is done: currents on test forms, support, gluing, augmentation, mass and its measure, Borel restriction, normal currents and constancy. The README's R⁴ check that e₀∧e₁+e₂∧e₃ has [mass 2](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/HodgeStar/Kahler/Mass.html#OrthonormalBasis.norm_formDualEquiv_ιMulti_add_ιMulti_finFour) but Hilbert norm √2 is proved. Still missing are the manifold `TestForm k M` and `Current k M`, their chart and LF comparisons, and mass on manifolds. Only the fibre algebra for the identification `V_k* ⊗ D ≃ A_k` exists so far ([`lineTwistedBidualEquiv`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Dual/LineTwistedBidual.html#TauCeti.lineTwistedBidualEquiv) and a bundle double dual).
- **G2** is partial, and Euclidean and real only. Smooth and cutoff pushforward with mass bounds, segment and simplex currents with boundary formulas, interval products and the homotopy formula have landed. The library also slices by smooth functions, with the slicing inequality. Integer-rectifiable and integral currents, Lipschitz pushforward, rectifiable coarea and Lipschitz slicing are all absent.
- **G4a** is partial: it has the real flat norm and completion, and the cone with its mass estimate. There is no deformation theorem, polyhedral approximation or isoperimetric filling.
- **G5** has only the README's point-current acceptance example, that a [weighted point current minimizes mass](https://taucetiproject.org/docs/TauCeti/Analysis/Distribution/Mass/Augmentation.html#Distribution.mass_mul_apply_finZero_le_mass_add_comp_extDerivCLM) against compactly supported boundary perturbations.
- **G3, G4b, G6 and G7** are untouched.

## The frontier

- **The manifold carrier** — specialize ComplexKahlerGeometry K5a's bundle tests to `TestForm k M` through the fibre isomorphism, and prove that the Euclidean chart comparison with the native test functions used so far is a topological linear equivalence. The K5a supplier is the main prerequisite.
- **Integer-rectifiable and integral currents** — represent currents by a countably rectifiable set, an orientation and integer multiplicity, then define the locally integral, integral and compactly supported integral subgroups. This needs GeometricMeasureTheory G2's approximate tangents and the rectifiable coarea formula.
- **The Euclidean deformation theorem** — cubical grid projection with remainder and filling estimates, together with integral polyhedral approximation. The cone, the homotopy formula and the flat norm it consumes are in place.
- **Lipschitz pushforward and Lipschitz slicing** — extend the smooth pushforward and the smooth-function slices to locally Lipschitz maps, with the homotopy decompositions f_j#T − f#T = R_j + ∂S_j.
- **Federer–Fleming compactness and closure (G4b)** — this waits on integral currents and the deformation theorem. Weak compactness of real currents with bounded mass does not substitute for it.
