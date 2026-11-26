<!--tauceti-status:v1 {"roadmap":"SchemeAndStackFoundations","to_sha":"01ef2fa22fc85dd69c8d7063fa166205dadb9d5c","ts":"2026-11-26T03:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0.9 non-affine approximation, 0.12 colimit form, 0.14 Elkik, 0.15, 0.20-0.21, 0.23a, 0.24 reflection results, 0.25-0.26","state":"partial"},{"id":"Layer 1","remaining":"effective descent along general fpqc coverings (1.1), fppf descent (1.2), quotient by an etale equivalence relation is an algebraic space (1.5) onward","state":"partial"},{"id":"Layer 2","remaining":"Leray and Cech spectral sequences (2.2), torsor pullback along morphisms of sites (2.3), ample Serre vanishing (2.6), 2.9","state":"partial"},{"id":"Layer 3","remaining":"affine-or-projective dichotomy (3.1), Riemann-Roch on curves (3.3), Weil comparison for Picard groups (3.4), 3.5 onward","state":"partial"},{"id":"Layer 4","remaining":"lifting criterion (4.1), deformation functors (4.3), formal functions and algebraization (4.9-4.10), generic flatness and Chow over Noetherian base (4.12)","state":"partial"},{"id":"Layer 5","remaining":"proper pushforward and flat pullback on Chow groups (5.2), freeness of top-dimensional Chow groups (5.1), first Chern class (5.3) onward","state":"partial"}],"readme_sha":"180774d70dd21d53dc8b9cf0fd4b56252387996f3010279b757fdbf8acc58996","roadmap":"SchemeAndStackFoundations","to_sha":"01ef2fa22fc85dd69c8d7063fa166205dadb9d5c"}-->
# Status: SchemeAndStackFoundations

This file documents the status of the SchemeAndStackFoundations roadmap up until `01ef2fa` (2026-11-26T03:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All six layers are partial. Descent, quasi-coherent cohomology and Chow groups each now have a recognised theorem: affine faithfully flat descent, Serre's affineness criterion and the localization sequence. None of the summit theorems (Keel–Mori, Grothendieck duality, Schlessinger, de Jong, Grothendieck–Riemann–Roch) has begun.

### Named results

- **Faithfully flat descent of quasi-coherent modules on affine schemes**: for `R → S` faithfully flat, quasi-coherent modules on `Spec R` are equivalent to descent data along `Spec S → Spec R`, so such data are effective ([`isEquivalence_toDescentData_specMap`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Descent/QuasicoherentSheaf/Affine.html#TauCeti.AlgebraicGeometry.Descent.isEquivalence_toDescentData_specMap)).
- **Serre's criterion for affineness**: a quasi-compact scheme on which `H¹` of every quasi-coherent module vanishes is affine ([`isAffine_of_subsingleton_cohomology_one`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Cohomology/AffinenessCriterion.html#AlgebraicGeometry.Scheme.isAffine_of_subsingleton_cohomology_one)).
- **The localization sequence for Chow groups**: for `Z` closed in `X` with open complement `U`, over a field, `CH_n(Z) → CH_n(X) → CH_n(U) → 0` is exact ([`exact_pushforward_restrict`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Chow/Localization.html#TauCeti.AlgebraicGeometry.Chow.ChowGroup.exact_pushforward_restrict)).
- **The divisor class comparison**: for an integral Noetherian scheme of dimension `n`, locally of finite type over a field, the Weil divisor class group is `CH_{n-1}` ([`classGroupEquivChowGroup`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Chow/DivisorClass.html#TauCeti.AlgebraicGeometry.Chow.classGroupEquivChowGroup)).
- **Torsor classes and `H¹`**: for an abelian sheaf `F` on a site, isomorphism classes of `F`-torsors are in bijection with `H¹(F)`, compatibly with connecting maps ([`NonabelianH1.equivSheafH`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Sites/NonabelianCohomology/SheafH.html#CategoryTheory.Sheaf.NonabelianH1.equivSheafH)).

### Notable definitions and infrastructure

- **The total direct image** [`Rf_*`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Modules/Derived/TotalDirectImage.html#AlgebraicGeometry.Scheme.Hom.totalDirectImage) on unbounded derived categories of modules is built from K-injective replacements. With [`D_QCoh`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Modules/Derived/DQCoh.html#TauCeti.AlgebraicGeometry.Coherent.DQCoh), it is the starting point for §2.18 and the duality sections after it.
- **Chow groups** ([`Chow.ChowGroup`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Chow/Basic.html#TauCeti.AlgebraicGeometry.Chow.ChowGroup)) now come with restriction to opens and with [flat pullback of cycles](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Chow/FlatPullback.html#TauCeti.AlgebraicGeometry.Chow.cyclesPullback), weighted by fibre lengths.
- **The Picard groupoid** ([`picardGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/LineBundle/PicardGroupoid.html#TauCeti.AlgebraicGeometry.picardGroupoid)) has `π₀` the Picard group and `π₁` the global units, and pullback is monoidal. Line bundles are [determined by their `𝔾_m`-frame torsors](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/LineBundle/FrameTorsor.html#TauCeti.AlgebraicGeometry.LineBundleClass.frameTorsorClass_injective).

### Roadmap coverage

All six layers are partial.

- **Layer 0.** §0.5 and most of §§0.13–0.14 are complete. Perfection is functorial, preserves fibre products and is compatible with étale base change. Still open:
  - non-affine Noetherian approximation (§0.9);
  - the colimit form of `(R_p)^h` (§0.12) and Elkik's lifting (§0.14);
  - essential surjectivity in §0.23a;
  - §0.24's reflection results;
  - §0.15, §§0.20–0.21 and §§0.25–0.26.
- **Layer 1.** It has algebraic spaces, also over a base scheme, together with étale equivalence relations and the quotient sheaf. It also has affine faithfully flat descent, Zariski descent of quasi-coherent modules and stacks in groupoids. Still open:
  - effective descent along general fpqc coverings (§1.1);
  - fppf descent of spaces (§1.2);
  - the quotient sheaf being an algebraic space (§1.5);
  - almost everything from §1.6 on.
- **Layer 2.** It has higher direct images and their quasi-coherence and filtered colimits. It also has Serre's criterion, torsors and `H¹`, cohomology with supports, the étale-to-Nisnevich comparison and the first derived-category foundations. Still open:
  - the Leray and Čech spectral sequences (§2.2);
  - pullback of torsor classes along morphisms of sites (§2.3);
  - ample Serre vanishing (§2.6).
- **Layer 3.** It has genus invariance, part of §3.3's degree laws and the Picard groupoid. Still open:
  - the affine-or-projective dichotomy (§3.1);
  - Riemann–Roch on curves (§3.3);
  - the Weil comparison for Picard groups (§3.4);
  - everything from §3.5 on.
- **Layer 4.** It has thickenings, formal smoothness without the lifting criterion, the coefficient category, `Spf` and formal completion, coherent formal modules on `Spf A` as finite `A`-modules, modifications, regular schemes, and Chow's lemma over an affine base.
- **Layer 5.** It has Chow groups, the divisor class comparison, the localization sequence, flat pullback of cycles and numerical equivalence on surfaces.

## The frontier

- **Effective fpqc descent of quasi-coherent modules (§1.1).** The affine faithfully flat case and Zariski gluing are proved; what remains is arbitrary fpqc coverings.
- **Proper pushforward and flat pullback on Chow groups (§5.2).** Both exist on cycles; what remains is that they preserve rational equivalence, and the base-change square.
- **Quotients by étale equivalence relations (§1.5).** The quotient sheaf exists; what remains is that `U/R` is an algebraic space for an étale equivalence relation.
- **The Leray spectral sequence (§2.2).** Leray acyclicity and the edge maps are in place. What remains is `H^p(D, R^q f_* F) ⇒ H^{p+q}(C, F)` itself and the Čech-to-cohomology spectral sequence.
- **Chow's lemma over a Noetherian base (§4.12).** The affine-base case is proved; what remains is a non-affine Noetherian base, with generic flatness and flattening by blowup.
