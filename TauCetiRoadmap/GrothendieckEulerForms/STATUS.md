<!--tauceti-status:v1 {"roadmap":"GrothendieckEulerForms","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: GrothendieckEulerForms

This file documents the status of the GrothendieckEulerForms roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The categorical spine is in place: exact structures, the presentation engine, the four Grothendieck groups with graded ℤ-actions and Laurent module structure, the projective resolution theorem, Euler–Poincaré, the Ext-Euler pairing and numerical quotients. Genuinely partial are the graded Euler form (defined, but neither sesquilinear nor descended to the Laurent K₀), the bounded-complex comparisons and general resolving subcategories; Layer 4 and every worked example have not begun.

### Named results

- **Resolution theorem** — for a property `P` of `E`-projectives containing zero and closed under biproducts, the inclusion of `P` into the objects of finite `P`-dimension induces an isomorphism on exact K₀, with inverse the alternating class of any finite resolution ([`TauCeti.ExactStructure.resolutionEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/GrothendieckGroup/ProjectiveResolution.html#TauCeti.ExactStructure.resolutionEquiv)).
- **Euler–Poincaré theorem** — in abelian K₀ the alternating class of the terms of a bounded cochain complex equals that of its cohomology, for any short-exact-additive invariant ([`TauCeti.AbelianK0.eulerChar_eq_homologyEulerChar`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.html#TauCeti.AbelianK0.eulerChar_eq_homologyEulerChar)).
- **Horseshoe lemma** — in any exact category, resolutions of a conflation's outer terms, the right one projective, combine to resolve its middle term; with Schanuel's lemma this lifts finite projective resolutions along conflations ([`TauCeti.ExactStructure.exists_conflation_biprod_of_conflation_of_projective`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/Exact/Projective.html#TauCeti.ExactStructure.exists_conflation_biprod_of_conflation_of_projective)).
- **Ext-Euler pairing** — for extension-closed properties whose pairs are Euler-admissible, `χ(X,Y) = ∑ (-1)ⁿ dim Extⁿ(X,Y)` descends to the unique biadditive pairing on the two exact K₀ groups ([`TauCeti.extEulerPairing`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/EulerCharacteristic/ExtEuler/Descent.html#TauCeti.extEulerPairing)).
- **Laurent normalisation of the shift** — on the graded K₀ of a graded exact category, `qⁿ · [M] = [M{n}]` ([`TauCeti.LaurentK0.T_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/GrothendieckGroup/Laurent.html#TauCeti.LaurentK0.T_smul)).

### Notable definitions and infrastructure

- [`TauCeti.ExactStructure`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/Exact/ExactStructure.html#TauCeti.ExactStructure) — Bühler's self-dual E0/E1/E2 axioms as instances on inflations and deflations; the split, abelian, induced, opposite, transported and graded structures all build on it.
- [`TauCeti.PresentedK0`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/GrothendieckGroup/Presentation.html#TauCeti.PresentedK0) — the free abelian group on `Shrink (Skeleton C)` modulo a relation family, with induction, lift and functoriality stated on objects of `C`; every K₀ of the roadmap is an instance.
- [`TauCeti.IsEulerAdmissible`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/EulerCharacteristic/ExtEuler/Basic.html#TauCeti.IsEulerAdmissible) — Ext-finiteness and an eventual-vanishing bound as separate predicates, closed under isomorphism, extensions in either variable and biproducts, so that `χ` is never a totalised junk value.

### Roadmap coverage

- **Layer 0** — done: kernel–cokernel pairs, exact structures, duality, conflation-exact functors with the Mathlib comparison ([`TauCeti.ExactStructure.isConflationExact_abelian_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/Exact/Functor.html#TauCeti.ExactStructure.isConflationExact_abelian_iff)), the three fundamental constructions, biproducts, bicartesian squares, transport and Noether isomorphisms.
- **Layer 1** — done except product categories; biadditive invariants descend ([`TauCeti.ExactK0.BiadditiveInvariant.bilift`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/GrothendieckGroup/Exact.html#TauCeti.ExactK0.BiadditiveInvariant.bilift)); choice independence appears only as equivalence invariance.
- **Layer 2** — split (with group completion), exact, abelian (as exact K₀ of the canonical structure) and triangulated K₀ (with `[X⟦n⟧] = (-1)ⁿ[X]`) done; graded ℤ-actions, shift-compatible universal properties and forgetting the grading done. Bounded-complex comparisons untouched.
- **Layer 3** — finite resolutions, the object-property presentation, Euler class and resolution theorem done for projective resolutions. Untouched: general resolving subcategories, comparison maps up to homotopy, graded and linear resolutions.
- **Layer 4** — untouched.
- **Layer 5** — Euler–Poincaré (not yet tied to Mathlib's `eulerChar`), Ext-finite pairs, the Ext-Euler value, descent, projective evaluation ([`TauCeti.extEuler_projective`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/EulerCharacteristic/ExtEuler/Basic.html#TauCeti.extEuler_projective)) and the resolution formula ([`TauCeti.ExactStructure.FiniteResolution.extEuler_eq_homEuler`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/EulerCharacteristic/ExtEuler/Resolution.html#TauCeti.ExactStructure.FiniteResolution.extEuler_eq_homEuler)) done; bigraded Ext, χ_q and its descent to ordinary exact K₀ done; naturality under functors and both quiver comparisons untouched.
- **Layer 6** — Laurent module structure with universal property, evaluation at units, finite Laurent support and target-shift graded dimension with reindexing done; sesquilinear χ_q, matrices, specialisation and the comparison after forgetting the grading untouched.
- **Layer 7** — radicals, numerical quotients, functoriality and the Ext-Euler specialisation done, the pairing nondegenerate on both quotients ([`TauCeti.extEulerNumericalPairing_nondegenerate`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/EulerCharacteristic/ExtEuler/Numerical.html#TauCeti.extEulerNumericalPairing_nondegenerate)); Laurent bar-stable analogues untouched.
- **Worked examples** — none present.

## The frontier

- **Sesquilinear q-Euler form** — descend `gradedExtEuler` to `LaurentK0` instead of exact K₀ and prove `χ_q(M{1},N) = q⁻¹χ_q(M,N)` and `χ_q(M,N{1}) = qχ_q(M,N)` using `LaurentPolynomial.invert`; the reindexing lemma ([`TauCeti.targetShiftGradedDimension_reindex_add`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/EulerCharacteristic/GradedDimension.html#TauCeti.targetShiftGradedDimension_reindex_add)) gives the shift identity at graded-dimension level.
- **Dual-numbers rejection and the other worked examples** — the README makes this test a precondition for accepting Ext-Euler descent, and descent has landed without it; the vector-space check needs nothing further, while `1 ⟶ 2` and E₈ wait on Layer 4.
- **Layer 4, the Cartan map** — nothing exists; needs the quiver roadmap's projective covers and simples, then `K₀(proj A) ⟶ G₀(mod A)` from the induced split structure, the resolution theorem supplying the finite-global-dimension isomorphism.
- **Specialisation at `q = ±1` and comparison after forgetting the grading** — `laurentEval` and the forgetful K₀ map ([`TauCeti.GradedExactStructure.map_shiftEquiv_of_commShift`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/CategoryTheory/GrothendieckGroup/Graded.html#TauCeti.GradedExactStructure.map_shiftEquiv_of_commShift)) exist; base change of `LaurentK0`, the factoring theorem and the graded/ungraded Ext comparison hypotheses do not.
- **Bounded-complex comparisons and general resolving subcategories** — split K₀ to the triangulated K₀ of the bounded homotopy category, the derived comparison, and Weibel's Theorem II.7.6 with kernel closure, beyond the projective case.
