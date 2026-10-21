<!--tauceti-status:v1 {"roadmap":"HamiltonianFloerOperations","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
# Status: HamiltonianFloerOperations

This file documents the status of the HamiltonianFloerOperations roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the first algebraic step of H1 has landed: the period group Γ of spherical classes and its basic structure theory, in an abstract setting. Caps, the Floer coefficient ring, the punctured domains and every analytic, counting and comparison layer (H2–H8) have not begun.

### Named results

- **Classes are separated by their periods** — two classes in Γ are equal exactly when they have the same area and the same first Chern number, so Γ embeds in ℝ × ℤ and is torsion-free ([`PeriodGroup.ext_iff`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PeriodGroup.html#TauCeti.Floer.PeriodGroup.ext_iff)).
- **The monotone period group is cyclic** — if area is a fixed multiple of the Chern number on spherical classes, the Chern number embeds Γ into ℤ and Γ is cyclic. This is the finite Laurent model behind the positive spherical-monotone branch ([`PeriodGroup.isAddCyclic_of_area_eq_mul_chern`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PeriodGroup.html#TauCeti.Floer.PeriodGroup.isAddCyclic_of_area_eq_mul_chern)).
- **The c1-zero period group lives in ℝ** — when the first Chern number vanishes on spherical classes, area alone embeds Γ into ℝ ([`PeriodGroup.area_injective_of_chern_eq_zero`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PeriodGroup.html#TauCeti.Floer.PeriodGroup.area_injective_of_chern_eq_zero)).
- **Aspherical targets have trivial Γ** — the period group is trivial exactly when area and Chern number vanish on every spherical class, the setting of the roadmap's ordinary-cup-product check ([`PeriodGroup.subsingleton_iff`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PeriodGroup.html#TauCeti.Floer.PeriodGroup.subsingleton_iff)).

### Notable definitions and infrastructure

- **The period group** — [`PeriodGroup`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PeriodGroup.html#TauCeti.Floer.PeriodGroup) is the quotient by the joint kernel of area and Chern number, as H1 requires, rather than by the kernel of area alone. It is defined for any additive group with homomorphisms to ℝ and ℤ, so it can be applied equally to the spherical Hurewicz image and to G7's class group.
- **Functoriality in the class group** — [`PeriodGroup.map`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PeriodGroup.html#TauCeti.Floer.PeriodGroup.map) sends a period-preserving homomorphism of class groups to an injective map of period groups. This is the starting point for H1's descent from a common class group to joint-period quotients.

### Roadmap coverage

H1 is partial. The group Γ and its monotone, c1-zero and aspherical specialisations are done abstractly. Still missing from H1 are the identification of S with the spherical Hurewicz image of an actual manifold, caps as Γ-torsors with cap gluing and recapping, the Floer coefficient ring with its valuation and degree, the cochain regrading C^k = CF_(n−k), and the comparison q^A ↦ e^(−A) with G7. Nothing has landed for H2 (punctured domains and perturbation data), H3 (energy and raw compactness), H4 (classical transversality, gluing and orientations), H5 (the rational virtual branch), H6 (the product, unit and sewing equations) or H7 (multiplicative PSS). None of H8's required checks has been carried out.

## The frontier

- **Caps as Γ-torsors** — define capped orbits over Γ, with class addition, cap gluing and reference changes, and prove that action and Conley–Zehnder index shift by ω(B) and 2c1(B).
- **The Floer coefficient ring** — build the energy-completed ring of e^B with degree 2c1(B) and valuation −ω(B), using MorseNovikov N1's finite-sublevel completion. The monotone case should first get its finite Laurent model, now that Γ is known to be cyclic there.
- **Attaching Γ to a manifold** — instantiate the abstract group with the spherical image of π₂ → H₂ and the actual symplectic area and first Chern class of a closed symplectic manifold. This depends on the Hurewicz and Chern-class interfaces from the lower geometry roadmaps.
- **The coefficient map to G7** — compare G7's class group with Γ through a common class group, so that q^A ↦ e^(−A) descends and is continuous under N1's hypotheses. `PeriodGroup.map` supplies the group-level part.
- **Punctured pair-of-pants data (H2)** — the three-ended domain, its strip-like ends and the perturbation data K and J. This is the first analytic layer, and it consumes DGFloer 7.C and HeegaardFloer F0–F2.
