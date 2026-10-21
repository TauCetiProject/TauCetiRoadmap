<!--tauceti-status:v1 {"roadmap":"GeometricRepresentationCategories","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5","ts":"2026-10-21T00:36:19Z"}-->
# Status: GeometricRepresentationCategories

This file documents the status of the GeometricRepresentationCategories roadmap up until `c1c6773` (2026-10-21T00:36:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** R1, the generic layer of categorical group actions and invariant full subcategories, is essentially in place. R2 (coherent twists on the supplied module categories), R3 (the critical representation family), R4 (equivariant groupoid transport and the categorical-lift conjecture) and R5 (descent, the outer-derivation bridge and relative transport) have not begun.

### Named results

- **Actions are pseudofunctors** — a left action of a discrete monoid on `C` gives a [pseudofunctor](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/Pseudofunctor.html#CategoryTheory.MonoidalCategory.MonoidalLeftAction.pseudofunctor) from the one-object bicategory to `Cat`, and conversely. [Going there and back](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/Pseudofunctor.html#CategoryTheory.MonoidalCategory.MonoidalLeftAction.monoidalLeftAction_pseudofunctor) returns the original action with its associator and unitor. This settles the TODO in Mathlib's action file for discrete acting categories (TauCeti#18648).
- **Equivariant functors are strong transformations** — functors with a left-linear structure [correspond exactly](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/StrongTrans.html#CategoryTheory.MonoidalCategory.MonoidalLeftAction.strongTransEquiv) to strong transformations between the associated pseudofunctors.
- **Equivariant natural transformations are modifications** — [this correspondence](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/Modification.html#CategoryTheory.MonoidalCategory.MonoidalLeftAction.modificationEquiv) respects identities and vertical composition. The strong transformations of identity and composite functors are canonically isomorphic to the identity and composite transformations.
- **Congruence invariance is presentation-independent** — the objectwise predicate "every object is fixed up to isomorphism by some congruence subgroup" is [invariant under equivariant equivalence](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/Congruence.html#TauCeti.isObjectwiseCongruenceInvariant_iff_of_equivalence) and under restriction to stable full subcategories.

### Notable definitions and infrastructure

- **Restriction to stable full subcategories.** An action [restricts](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/FullSubcategory.html#CategoryTheory.ObjectProperty.fullSubcategoryMonoidalLeftAction) to `P.FullSubcategory` whenever [P is stable under the action](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/FullSubcategory.html#CategoryTheory.ObjectProperty.IsStableUnderLeftAction). The restricted action is linear and additive whenever the ambient one is, and it is exact on subcategories containing zero and closed under finite products and kernels or cokernels. This is the form in which R2 will meet the strict central-character fibers.
- **Transport along equivalences.** The [right adjoint of an oplax left-linear functor](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/LinearFunctor.html#CategoryTheory.Adjunction.rightAdjointLaxLeftLinear) is lax left-linear. So the inverse of an equivariant equivalence is equivariant, with left-linear unit and counit.
- **The congruence-invariance predicate.** The [objectwise predicate](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/Congruence.html#TauCeti.IsObjectwiseCongruenceInvariant) asks only for objectwise isomorphisms, as the README requires. R3 needs this form for both its finitely generated modules and the `Q_M` counterexample.

### Roadmap coverage

R1 has its main interfaces: the action/pseudofunctor comparison, the matching statements for equivariant functors and natural transformations, full-subcategory restriction with two-step compatibility, linearity, exactness and congruence invariance. Two gaps remain. Only one direction of the comparison is stated as a round-trip theorem; the reverse round trip, from pseudofunctor to action and back, is not. And it is not established here that transport along equivalences preserves scalar linearity. R2–R5 are untouched: none of the source contains the R2 twist actions on A5's module categories, the R3 critical family `Ccrit`, the R4 lift packages, or the R5 outer-derivation and self-extension constructions.

## The frontier

- **The reverse round trip in R1** — show that a pseudofunctor `LocallyDiscrete (SingleObj H) ⥤ᵖ Cat` is recovered, up to the appropriate equivalence, from its associated action. Then make sure transport along equivalences keeps `Functor.Linear`.
- **Coherent twists (R2)** — assemble restriction of scalars through `a_h⁻¹` into a monoidal action and its pseudofunctor, with unit and product cells pinned to `ModuleCat.restrictScalarsId'` and `restrictScalarsComp'`, and do the same for the rank-one fibers. This consumes AffineLieAlgebras A5's continuous module categories and central-character comparisons.
- **The critical family (R3)** — build `Ccrit(p)` from A3, A5 and A8 with its `H` action, and add the semidirect `H⋊S` coordinate covariance. Its prerequisites are AffineLieAlgebras A8 and FormalConnectionsOpers F5.
- **Lift packages (R4)** — define coherent equivariant transport over `Γ × SingleObj H` and the bicategory of lift packages, and prove its biequivalence with normalized transport data. These steps are generic and could proceed before R3; only the critical conjecture's statement needs R3's fibers.
- **The infinitesimal bridge (R5.2)** — `OutDer_cont`, the map `θ` and the self-extensions `Eδ(M)` with their Ext classes. These depend on AffineLieAlgebras A6's deformation exports and the A5 `HasExt` adapter.
