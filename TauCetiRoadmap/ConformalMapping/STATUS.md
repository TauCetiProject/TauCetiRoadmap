<!--tauceti-status:v1 {"roadmap":"ConformalMapping","to_sha":"03fcee5c26082d455072bee2d3044ce5bec908cd","ts":"2026-08-10T15:35:51Z"}-->
# Status: ConformalMapping

This file documents the status of the ConformalMapping roadmap up until `03fcee5` (2026-08-10T15:35:51Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit and the layers around it are done: the Riemann mapping theorem, the
normal-families and Schwarz-lemma machinery beneath it, reflection and continuation above it. The
live layer is L5, the Carathéodory boundary correspondence, where the converse direction and most of
the length–area machinery are proved but the continuous extension of the Riemann map of a Jordan
domain is not. L6, Schwarz–Christoffel, has not begun.

### Named results

- **The Riemann mapping theorem** — every nonempty, simply connected, open proper subset of `ℂ` is
  carried by a holomorphic bijection onto the unit disc
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/RiemannMapping/Existence.html#TauCeti.riemannMapping>),
  with a normalized form, uniqueness up to a disc automorphism, and conformal equivalence of any two
  such domains.
- **The Schwarz reflection principle** — a function holomorphic on a domain symmetric about the real
  axis and real on the axis continues across it by conjugation
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Reflection/Principle.html#TauCeti.differentiableOn_schwarzReflection_of_symmetric>),
  and likewise across a line, an analytic arc and a circle.
- **The monodromy theorem** — a germ continuing along every path of a simply connected domain from a
  base point is the germ of a single function holomorphic on the whole domain
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/GlobalBranch.html#TauCeti.continuesInside_iff_exists_analyticOnNhd>);
  the homotopy form, that continuations along homotopic paths agree, is stated in `ℂ`
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Monodromy.html#TauCeti.monodromy_theorem>).
- **The isometry group of the Poincaré disc** — every isometry of the hyperbolic disc is a disc
  automorphism or the conjugate of one
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Poincare/Isometry/Classification.html#TauCeti.PoincareDisc.isometry_iff_exists_eq_unitDiscStandardAutomorphismIsometryEquiv_or_comp_star>),
  the holomorphic ones being exactly the automorphisms; its geodesics are exactly the Euclidean
  diameters and the arcs of circles orthogonal to the unit circle.
- **Wolff's lemma and the length–area inequality** — the weighted total of the image lengths of the
  circles about a point is at most `2π` times the area of the image, so some circle of intermediate
  radius has short image
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/LengthArea.html#TauCeti.exists_circleImageLength_sq_lt>).
  It drives the boundary correspondence.

### Notable definitions and infrastructure

- **The image length of a circle**, `TauCeti.circleImageLength`, the derivative-weighted angular
  integral over the part of a circle inside a set
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/LengthArea.html#TauCeti.circleImageLength>).
  The crosscut chain — chord bounds, endpoint limits, diameters of cut-off pieces — is stated
  against it.
- **Jordan curves**, `TauCeti.IsJordanCurve`, a subset homeomorphic to the circle
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/JordanCurve/Basic.html#TauCeti.IsJordanCurve>),
  with the arc theory the boundary work needs: two points cut it into two arcs, and two nearby
  points cut off a small one, joined by an injective path along it.
- **Continuation predicates**, `TauCeti.ContinuesAlong` and `TauCeti.ContinuesInside`
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Continuation/Basic.html#TauCeti.ContinuesInside>),
  closed under the ring operations and differentiation and stable under concatenation and
  reparametrisation, so continuation is usable without unfolding germ families.

### Roadmap coverage

L0–L4 are done, past their stated milestones. L0 has Rouché, Hurwitz, Morera and the
open-mapping degree, with the argument principle also in winding-number form for null-homologous
cycles. L1 has Vitali and Montel, the latter as a selection theorem and as an
equivalence with relative compactness in `C(Ω, E)` for a proper target
(<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/Montel/Precompact.html#TauCeti.isCompact_closure_range_iff_isLocallyBoundedOn>).
L2 goes well beyond Schwarz–Pick: closed forms for the hyperbolic distance, which is the least length
of a joining path, classified geodesics and isometries, and `Aut(𝔻) ≃ Circle × 𝔻`. L3 is complete
with normalization and uniqueness. L4 has reflection across line, arc and circle, Painlevé
removability and monodromy. L5 has the converse direction — a conformal map with an injective
continuous extension makes its domain a Jordan domain — the local-connectedness half of the
continuity theorem, and much forward machinery; prime ends stay out of scope by design. L6 is
untouched.

## The frontier

- **The Carathéodory continuity theorem, forward direction.** What remains is to show that the
  boundary piece a small crosscut cuts off is itself small; short image crosscuts now lie on small
  Jordan curves, and the diameter bound and the criterion turning "cut-off pieces are small" into a
  continuous extension on the closure are proved
  (<https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Conformal/CutDiameter.html#TauCeti.exists_continuousOn_closure_eqOn_of_forall_exists_diam_union_le>).
- **Plane separation for Jordan curves.** The arc theory is developed, but nothing here establishes
  that a Jordan curve separates the plane, or the Schoenflies theorem, or settles whether they are
  available upstream. How much of either the forward direction needs should be settled first.
- **Monodromy in its intended generality.** The homotopy-invariance statement is still for paths in
  `ℂ` rather than in a domain, and is phrased in germ families rather than against the étale space
  that landed beside it.
- **Schwarz–Christoffel (L6)** is blocked on L5 and has no vocabulary yet.
- **Duplication with Mathlib's RMT work.** L0–L3 duplicate mathematics Mathlib is also formalizing;
  the roadmap commits to reproving them from Mathlib's lemmas, and deleting `TauCeti.riemannMapping`,
  once those land. Nothing here shows that they have.
