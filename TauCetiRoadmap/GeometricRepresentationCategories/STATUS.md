<!--tauceti-status:v1 {"roadmap":"GeometricRepresentationCategories","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
# Status: GeometricRepresentationCategories

This file documents the status of the GeometricRepresentationCategories roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** R1, the generic layer of categorical actions, is complete apart from one linearity statement. R2, R4 and R5 each have their first generic pieces but none of their affine-specific content. R3, the critical representation family, has not begun.

### Named results

- **Actions are pseudofunctors** — left actions of a discrete monoid on categories [correspond bijectively](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/Pseudofunctor.html#CategoryTheory.MonoidalCategory.MonoidalLeftAction.pseudofunctorEquiv) to pseudofunctors `LocallyDiscrete (SingleObj M) ⥤ᵖ Cat`. Both round trips recover the coherence cells, not just the action functors. This settles the TODO in Mathlib's action file for discrete acting categories.
- **Equivariant functors are strong transformations** — functors with a left-linear structure [correspond exactly](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/StrongTrans.html#CategoryTheory.MonoidalCategory.MonoidalLeftAction.strongTransEquiv) to strong transformations between the associated pseudofunctors. Equivariant natural transformations likewise [correspond to modifications](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/Modification.html#CategoryTheory.MonoidalCategory.MonoidalLeftAction.modificationEquiv).
- **Coherence is a 2-cocycle condition** — for an action by identity functors with central compositors, [associativity holds exactly when the compositors form a 2-cocycle](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Bicategory/Functor/CentralCocycle.html#TauCeti.centralUnitIso_associativity_iff). Changing trivialisations [acts by a coboundary](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Bicategory/Functor/CentralCocycle.html#TauCeti.centralUnitIso_naturality_comp_iff). This is the README's example showing that coherence is real data.
- **Inner derivations do not change the self-extension** — when `δ' = δ + ad b`, the map `(u, v) ↦ (u + b·v, v)` is an [isomorphism of extensions](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/DerivationExtension.html#TauCeti.DerivationExtension.innerEquiv) `E_δ(M) ≅ E_δ'(M)`, natural in `M`.
- **Congruence invariance is presentation-independent** — the objectwise congruence-invariance predicate is [invariant under equivariant equivalence](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Monoidal/Action/Congruence.html#TauCeti.isObjectwiseCongruenceInvariant_iff_of_equivalence) and under restriction to stable full subcategories.

### Notable definitions and infrastructure

- **The twisting action.** [Restriction of scalars along `(a h)⁻¹`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Twist.html#MonoidHom.restrictScalarsMonoidalLeftAction) is a coherent action on `ModuleCat A`. Its unit and associator are, on the nose, Mathlib's `restrictScalarsId'` and `restrictScalarsComp'`. It restricts to discrete and smooth modules, and R2's fiber actions will be built on it.
- **Equivariant groupoid lifts.** The type `TauCeti.EquivariantGroupoidLift` packages a pseudofunctor on `Γ × SingleObj H` with fiber comparisons. From it come normalized transport functors, their unit, composition and mixed coherence with the actions, and the isotropy action of each endomorphism monoid. It can also be pulled back along a functor of parameter categories. This is the carrier for R4's conjecture and R5.1's descent.
- **The self-extension `E_δ(M)`.** [This module](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/DerivationExtension.html#TauCeti.DerivationExtension) on `M ⊕ M` is short exact as an extension of `M` by `M`, also inside the discrete modules for continuous δ. This is the object whose Ext class R5.2 is after.

### Roadmap coverage

- **R1** is done except for one statement: it is not established here that transport along equivalences preserves scalar linearity.
- **R2** is partial. The generic twist action, its pinned cells, linearity and stability of discrete and smooth modules are in place. Not yet in place: the consumption of A5's continuous automorphisms and central-character categories, the twist functors between character fibers, the rank-one fiber actions, and the equivariance of the inclusion and central-quotient comparisons.
- **R3** is untouched.
- **R4** is partial. The lift type, its normalized transport data with all coherence, the equivalences `E_g`, the isotropy actions and the central-cocycle obstruction are present. Not yet present: the bicategory of lift packages and its biequivalence with normalized data, the linear refinement, and the critical conjecture, which needs R3.
- **R5** is partial. R5.1 has only pullback of lifts along a functor. R5.2 has the self-extensions and their inner comparisons but not `OutDer_cont`, θ or Ext classes. R5.3 is untouched.

## The frontier

- **Twists on character fibers (R2)** — apply the twist action to A5's continuous module categories. Then build the twist functors `C_χ → C_(χ∘a_h⁻¹)` and the rank-one fiber actions with their pinned unit and associator cells.
- **Ext classes of self-extensions (R5.2)** — lift `E_δ(M)` into A5's smooth category and form its `extClass`. Then prove the generic Baer-sum comparison and functoriality. This needs AffineLieAlgebras A5's `HasExt` adapter.
- **The lift-package bicategory (R4)** — define morphisms and modifications of lifts, and prove the biequivalence with normalized transport data. This is generic and does not wait on R3.
- **Descent along groupoid equivalences (R5.1)** — the pullback exists. What remains is the biequivalence on pseudofunctors induced by an equivalence `Γ ≌ Λ`, with its units and counits, and its application to `IsomOp → Loc`.
- **The critical family (R3)** — build `Ccrit(p)` with its `H` action and the semidirect `H⋊S` coordinate covariance. The prerequisites are AffineLieAlgebras A8 and FormalConnectionsOpers F5.
