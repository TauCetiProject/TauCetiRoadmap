<!--tauceti-status:v1 {"roadmap":"ProfiniteCohomology","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: ProfiniteCohomology

This file documents the status of the ProfiniteCohomology roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The explicit low-degree model is largely built: cochains, functoriality, the long exact sequence through degree 2, corestriction, the six cup products with their identities, and Shapiro's lemma in degrees 0 and 1, and the canonical carrier has its named maps and the discrete-module dictionary. The comparison with Mathlib's continuous cohomology exists only in degree zero, the finite-quotient colimit and the Galois isomorphisms have inputs but not conclusions, and Layers 10 to 13 have not begun.

### Named results

- **Shapiro's lemma in degrees 0 and 1** — for profinite `G` and closed `U`, evaluation at `1` is an isomorphism `H¹(G, Coind_U^G A) ≃+ H¹(U, A)`, with inverse a section formula for any continuous coset factorization ([`TauCeti.ContCohomology.explicitShapiro1`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.html#TauCeti.ContCohomology.explicitShapiro1)).
- **The low-degree long exact sequence** — a short exact sequence of discrete `G`-modules over any topological group gives `δ⁰`, `δ¹` and exactness at all eight nodes from `H⁰(G, A)` to `H²(G, B)` ([`TauCeti.ContCohomology.DiscreteShortExact.explicitDelta1`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.html#TauCeti.ContCohomology.DiscreteShortExact.explicitDelta1)).
- **`cor ∘ res = (G : U)` in degrees 0, 1 and 2** — corestriction along a finite-index open subgroup, independent of the transversal by an explicit coboundary, satisfies the index identity on cohomology with its correction terms named ([`TauCeti.ContCohomology.explicitCor2_comp_res2`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.html#TauCeti.ContCohomology.explicitCor2_comp_res2)).
- **The low-degree cup products** — the six shapes with `p + q ≤ 2`, associativity in all ten tridegrees, graded commutativity on classes, and the projection formula in every shape ([`TauCeti.ContCohomology.explicitCup11_eq_neg_flip`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/CupProduct.html#TauCeti.ContCohomology.explicitCup11_eq_neg_flip)).
- **The explicit complex is Mathlib's over a discrete group** — in degrees 0, 1, 2 the explicit cohomology is `groupCohomology` of `Rep.ofDistribMulAction ℤ G M` ([`TauCeti.ContCohomology.explicitH1IsoGroupCohomology`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/GroupCohomologyIso.html#TauCeti.ContCohomology.explicitH1IsoGroupCohomology)).

### Notable definitions and infrastructure

- **The discrete-module dictionary** — `ofDiscreteModule` lands in the smooth discrete subcategory of `TopRep R G`, equivalent to the discrete `G`-modules, with a non-smooth discrete object exhibited; it is where explicit statements meet the canonical carrier ([`TauCeti.discreteRepEquivSmoothTopRep`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.html#TauCeti.discreteRepEquivSmoothTopRep)).
- **The finite-quotient system** — the functor `U ↦ Hⁿ(G ⧸ U, A^U)` on `(OpenNormalSubgroup G)ᵒᵖ`, with all six Layer 4 milestones ([`TauCeti.finiteQuotientSystem`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient.html#TauCeti.finiteQuotientSystem)).
- **The Galois coefficient modules** — `AbsoluteGaloisGroup K = Gal(Kˢ/K)` identified topologically with Mathlib's, `UnitsCoeff` and `KummerCoeff` as discrete `G_K`-modules, and the Kummer sequence ([`TauCeti.kummerShortExact`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisCohomology/Coefficients.html#TauCeti.kummerShortExact)).

### Roadmap coverage

- **Layer 0** partial: openness, `M^U` as a `G ⧸ U`-module, the internal hom with `evalPairing`, and the extension lemma are done; no declaration for the continuous section of `G → G ⧸ H` appears in what landed, and closure under finite products, subgroups and quotients is not visible.
- **Layer 1** done except the closure properties of smooth discrete objects and the worked examples.
- **Layer 2** done except conjugation (`explicitConj1`, triviality of inner automorphisms) and the `ℤ_p` examples.
- **Layer 3** partial: the discrete-`groupCohomology` comparison and discreteness of the canonical side are done; the canonical comparison exists in degree 0 with its transports; degrees 1 and 2 are untouched.
- **Layer 4** partial: the system is done; the colimit theorem and its consequences are untouched.
- **Layer 5** partial: cochain exactness, the eight nodes, naturality and inflation-restriction are done; the five-term sequence is untouched.
- **Layer 6** partial: transversal calculus, `cor⁰`–`cor²`, `cor ∘ res` and coefficient naturality are done; compatibility with `δ`, transitivity and Mackey are untouched.
- **Layer 7** partial: coinduction with exactness and Shapiro in degrees 0, 1 are done; degree 2, the open-subgroup comparison and acyclicity are untouched.
- **Layer 8** partial: shapes, associativity, commutativity and projection are done; restriction and inflation compatibility, the connecting-map identities and the Bockstein are untouched.
- **Layer 9** partial: the group and coefficient modules are done; Hilbert 90, the Kummer isomorphism, field functoriality and the mod-2 form are untouched.
- **Layers 10 to 13** untouched; no §6 worked example has landed.

## The frontier

- **The canonical comparison in degrees 1 and 2** — `explicitH1IsoContinuousCohomology`, `explicitH2IsoContinuousCohomology` and their transports. The degree-0 template exists and the canonical side is known discrete; the chain-level currying correspondence remains.
- **The finite-quotient colimit theorem** — `explicitFiniteQuotientColimit0/1/2`. The system exists; the explicit transition, the comparison cocone and the strict-inflation surjectivity argument do not.
- **Conjugation and the five-term sequence** — `explicitConj1`, `H1ConjInvariants`, `transgression`, `fiveTerm_exact_H1N`, `fiveTerm_exact_H2Q`. The transgression lifts through a continuous section of `G → G ⧸ N` for closed `N`, which no landed declaration supplies.
- **Hilbert 90 and the Kummer isomorphism** — `hilbert90`, `kummerMap`, `kummerIso`, `h2KummerToUnits`. Both need the Layer 4 colimit and the finite-level Galois dictionary, neither of which exists.
- **The rest of change of groups and coinduction** — `explicitCor_delta0/1`, transitivity, Mackey, `explicitShapiro2` and `topologicalCoindIsoAlgebraic`; all inputs are present, and they unblock Layer 8's connecting-map identities and Layer 10.
