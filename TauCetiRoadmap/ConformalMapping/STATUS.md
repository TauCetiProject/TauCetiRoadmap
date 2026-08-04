<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"6919462d4134c7850ded5c71cc7a2e8a9054a2d0","ts":"2026-08-01T03:46:02Z"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `6919462` (2026-08-01T03:46:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

The core layers L0–L4, the ones for which `Suggested.lean` states representative `sorry`-goals,
are all discharged. L5 is partly done and L6 untouched.

**L0 — the local-mapping engine: done.** Rouché in several forms
(`TauCeti.rouche`, <https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Rouche.html#TauCeti.rouche>),
Hurwitz as the dichotomy "nowhere zero or identically zero"
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Hurwitz.html#TauCeti.hurwitz_forall_ne_or_forall_eq>)
together with the eventual-zero and eventual-value forms, Morera as a named theorem
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Morera.html#TauCeti.morera>),
the open-mapping degree in count, existential and distinct-and-simple forms
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/LocalDegree.html#TauCeti.exists_localDegree>),
the local injectivity criterion `deriv f z₀ ≠ 0`, and a zero-count API on discs
(`TauCeti.finsum_analyticOrderNatAt_ball_eq_zero_iff`). The residue/argument-principle inputs are
consumed from the sibling `ContourIntegration` material, as the roadmap directs.

**L1 — normal families / Montel: done.** `TauCeti.IsLocallyBoundedOn` with its Cauchy-estimate
and equicontinuity API, Montel's selection theorem
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Montel.html#TauCeti.montel>),
and Vitali in both the plain and prescribed-pointwise-values forms
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Vitali.html#TauCeti.vitali>).
Stated for `TendstoLocallyUniformlyOn`, independently of Mathlib's `MontelSpace`, as the roadmap
requires.

**L2 — Schwarz lemma extensions: done.** The Schwarz–Pick contraction estimate
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/SchwarzPick/Basic.html#TauCeti.pseudoHyperbolicExpr_map_le>),
its infinitesimal form `‖deriv f z‖ / (1 - ‖f z‖²) ≤ 1 / (1 - ‖z‖²)`, and rigidity in five
equivalent packagings, ending in "equality at one pair of points forces a standard disc
automorphism". The hyperbolic metric is a full metric space, `TauCeti.PoincareDisc`
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Poincare/MetricSpace.html#TauCeti.PoincareDisc>),
proper, homeomorphic to `Complex.UnitDisc`, geodesic and uniquely geodesic, with the geodesic lines
through the origin classified as exactly the Euclidean diameters. `Aut(𝔻)` is both classified
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/UnitDisc/Automorphism/Classification.html#TauCeti.exists_forall_unitDisc_eq_unitDiscStandardAutomorphismEquiv>)
and available as a subgroup `TauCeti.unitDiscAut`, acting transitively, with the rotations as the
stabiliser of the origin.

**L3 — the Riemann mapping theorem: done, and past the stated milestone.** The summit
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping>),
its biholomorphic form with holomorphic inverse, the normalized existence-and-uniqueness statement
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Normalization.html#TauCeti.riemannMapping_normalized>),
uniqueness up to `Aut(𝔻)`, the packaged `Homeomorph` and `OpenPartialHomeomorph` forms, and
conformal equivalence of any two simply connected proper domains
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Equivalence.html#TauCeti.exists_bijOn_differentiableOn_invFunOn_of_isSimplyConnected>).
The route's own pieces are named and reusable: the extremal family
`TauCeti.IsPointedDiscInjectionOn` and its maximizer, the Koebe expansion step, the disc-injection
nonemptiness, and holomorphic (not merely continuous) branch-log and `n`-th-root statements
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/BranchLogRoot.html#TauCeti.exists_differentiableOn_pow_eq>)
upgrading Mathlib's `BranchLogRoot`. All of this is shim material under the roadmap's coordination
clause.

**L4 — analytic continuation and reflection: done for the stated targets.** The Schwarz reflection
principle across the real axis, in explicit-witness and existential form
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/Principle.html#TauCeti.differentiableOn_schwarzReflection_of_symmetric>),
then across an arbitrary line, across an analytic arc by transport through biholomorphic charts
(`TauCeti.chartedSchwarzReflection`), and across a circle by Möbius reduction
(`TauCeti.circleSchwarzReflection`). Painlevé removability across a segment, an arc and a sphere is
proved. Analytic continuation along a path is a predicate `TauCeti.IsAnalyticContinuationAlong` with
germ-level API, and the monodromy theorem
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Monodromy.html#TauCeti.monodromy_theorem>)
holds for homotopies rel endpoints in `ℂ`, via a uniform-representative and path-stability argument.
An étale-space construction for presheaves landed alongside but is not yet what monodromy is stated
against. The reflected map is also shown injective and conformal, which is what a boundary-regularity
consumer needs.

**L5 — Carathéodory boundary correspondence: partly done, and the hard direction is missing.**
What exists is the converse: a bounded open set carried by a holomorphic map onto a Jordan-bounded
region, with an injective continuous extension to the closure, is itself a Jordan domain
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/JordanDomain.html#TauCeti.isJordanDomain_of_isJordanCurve_frontier_image>);
and the "only if" half of the continuity theorem, that such an extension forces the image boundary
to be locally connected
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/LocallyConnectedBoundary.html#TauCeti.locallyConnectedSpace_frontier_image>).
Both take the extension as a hypothesis. Around them sits the machinery the forward direction will
need: `TauCeti.IsJordanDomain`, boundary cluster sets with closedness, compactness, connectedness and
covering results
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/ClusterSet.html#TauCeti.clusterSetOn>),
the criterion that a subsingleton cluster set is an honest limit, injectivity on the closure from
injectivity on the frontier, `TauCeti.IsUniformlyLocallyConnected` and its compact-image theory, and
the area formula for holomorphic injections with the Dirichlet integral of a Riemann map computed to
be `π`
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Area.html#TauCeti.volume_image_eq_lintegral_enorm_deriv_sq>).

**L6 — Schwarz–Christoffel: untouched.** No polygon-map vocabulary has been introduced.

## The frontier

- **The Carathéodory continuity theorem, forward direction.** The nearest target: the Riemann map
  of a Jordan domain extends continuously to the closure. Everything downstream of it is already
  proved — `TauCeti.bijOn_closure_closure_image` and `TauCeti.closureHomeomorph` turn such an
  extension into a homeomorphism of closures the moment it exists, and
  `TauCeti.injOn_closure_of_injOn_frontier` supplies the injectivity. The missing step is the
  length–area (Koebe–Wolff) estimate that shows the boundary cluster sets are singletons; the
  integrability and finite-Dirichlet-integral inputs it spends are in `Conformal/Area.lean`, and
  `TauCeti.exists_continuousOn_closure_eqOn_of_isBounded` is the topological form the estimate
  should be fed into.
- **Jordan curve input.** `TauCeti.IsJordanDomain` is used but the strong facts about Jordan curves
  that the forward direction classically leans on (the Jordan curve theorem, the Schoenflies
  theorem) are not established here, and the facts file gives no evidence either way about their
  availability upstream. Whoever attacks L5 should settle that first: it determines whether the
  Jordan-domain case is reachable now or needs a topological prerequisite of its own.
- **Schwarz–Christoffel (L6)** is blocked on L5 and has no vocabulary yet; it is the right target
  only after the boundary correspondence closes.
- **Prime ends** remain deliberately out of scope, as the roadmap states; the L5 milestone is the
  Jordan-domain case only.
- **Shim retirement.** L0–L3 duplicate mathematics that upstream Mathlib is formalizing. The
  outstanding obligation is to re-back `TauCeti.rouche`, the Hurwitz family, `TauCeti.montel`,
  `TauCeti.riemannMapping` and the `BranchLogRoot` upgrades onto the Mathlib lemmas once they land,
  and to refactor the L4/L5 consumers accordingly. Nothing in this window discharged that; it is
  waiting on upstream, not on work here.
- **Monodromy against étale spaces.** `TauCeti.TopCat.Presheaf.EtaleSpace` landed with its
  germ-section API, but `TauCeti.monodromy_theorem` is still stated in the ad hoc germ-family
  language of `TauCeti.IsAnalyticContinuationAlong`. Restating monodromy as a lifting property of
  the étale space, and generalising the base from `ℂ` to a simply connected domain, is a well-scoped
  piece of consolidation.
