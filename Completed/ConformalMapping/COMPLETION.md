# Conformal mapping: completion audit

**Archive candidate (2026-10-30).** Twenty of the twenty-one source prerequisites of the
nine-roadmap archive are verified on actual main
[`ec93262aafc8`](https://github.com/TauCetiProject/TauCeti/commit/ec93262aafc8c3daaa4057352705faab817907e4),
including [#22743](https://github.com/TauCetiProject/TauCeti/pull/22743) (Morera/Hurwitz) and
[#22936](https://github.com/TauCetiProject/TauCeti/pull/22936) (Vitali).
The remaining citation repair [#23036](https://github.com/TauCetiProject/TauCeti/pull/23036),
head `b49262a9ba27`, has passed all ten normal reviews and
[genuine CI](https://github.com/TauCetiProject/TauCeti/actions/runs/41007757860).
Normal merge eligibility has also passed; Bors assignment, its candidate CI and actual-main
inclusion remain pending.
The final actual-main native replay has not run; the historical checks below establish only
their stated revisions.

The complete [README](README.md), including the general planar Jordan-separation target of L5,
is the completion criterion. The historical interface file is neither exhaustive nor the
criterion. Prime ends and the siblings’ metric-measure and winding-number comparisons keep
their stated owners; none has been substituted for the Jordan-domain target.

The Jordan-separation prerequisite [Tau Ceti #21991](https://github.com/TauCetiProject/TauCeti/pull/21991)
was reported merged by Bors on 2026-10-28. Direct comparison with upstream
`f5604a97062487140a029c405f32d8f199f2316b` confirms the full Jordan inside/frontier and two-component
results remain present. A subsequent refactor exposes the stronger component-classification
theorem and uses it to prove the two-component result.

Paths below are relative to `TauCeti/Analysis/Complex/`, except the stated topological suppliers.

| Definitive target | Native implementation and scope |
| --- | --- |
| L0: local mapping | `Conformal/{Rouche,Hurwitz,Morera,LocalDegree}.lean` consume the existing contour and Mathlib complex-analysis foundations. |
| L1: normal families | `Conformal/Montel/Basic.lean` and `Conformal/Vitali.lean` use locally uniform convergence of holomorphic functions, not the unrelated locally convex Montel-space notion. |
| L2: disc geometry | `Conformal/SchwarzPick/Basic.lean`, `Conformal/Poincare/MetricSpace.lean` and `Conformal/UnitDisc/Automorphism/Group.lean` use the canonical disc and pseudo-hyperbolic/Poincaré metrics. |
| L3: Riemann mapping | `Conformal/RiemannMapping/{Existence,Uniqueness,Conformal}.lean` supply existence, holomorphic inverse and uniqueness up to disc automorphism for every nonempty simply connected proper open complex domain. |
| L4: reflection and continuation | `Conformal/Reflection/{Basic,Principle,Arc,Circle/Conjugate,Circle/Principle}.lean`, `Conformal/Removability/Arc.lean` and `Conformal/Monodromy.lean` retain the real-axis explicit witness, arc/circle reductions, removability and homotopy-invariant continuation. |
| L5: Jordan topology | `TauCeti/Topology/JordanCurve/Basic.lean`, `TauCeti/Topology/FilledHull.lean` and `PlaneSeparation/Inside.lean` prove the actual two components, bounded connected inside, unbounded outside, frontiers and containment/separation API without RMT or a boundary smoothness premise. |
| L5: boundary correspondence | `Conformal/Caratheodory.lean` and `Conformal/Jordan/Approach.lean` give the continuous extension for every conformal disc map of a bounded Jordan domain, injectivity on the closed disc and the homeomorphism of closures. |
| L6: polygonal maps | `Conformal/SchwarzChristoffel/{Integrand,Primitive,Vertex,JordanPolygon}.lean` supply the explicit polygonal maps, vertex values and the domain-qualified forms, including the unbounded half-strip case retained in the suggested interfaces. |

A historical actual-main replay at `f5604a970624` built 88 entry modules across conformal mapping,
global arithmetic and heights in 10,659 Lake jobs. It also recompiled the full 503-line interface-check file with
warnings treated as errors, using the native APIs at `f5604a970624`. The only API adaptation
was replacing the old Jordan-specific continuity theorem by its stronger locally-connected
boundary supplier and deriving that instance from the same Jordan hypothesis. The theorem
statements were unchanged. The replay imports the new general Jordan-separation module too.
The two-component theorem, component classification, closure homeomorphism and polygonal map
report only `propext`, `Classical.choice` and `Quot.sound` under axiom inspection.

The prepared final replay covers the union of 922 native modules, sixteen unchanged probes and
128 expected axiom reports. Its compilation scope includes 239 conformal-area modules (including
external suppliers), 136 global-number-field suppliers, 117 height/unit suppliers, 199
Hopf–Rinow modules and 85 local-field modules; these inventories overlap. The current conformal certificate has 509 lines,
28 imports and four axiom reports, and remains nonexhaustive. Compiling additional prime-end and
other companion modules does not declare those follow-on targets complete.

The prototype kept in this repository is separately built at Tau Ceti `358314d4ab97`,
Mathlib `f6090c7095e1`, Lean `4.35.0-rc3`. Its old API names are historical. The recorded native
replay used Mathlib `2cabef97b63d` and Lean `4.36.0-rc1`; it establishes the stated source revision,
not the pending final actual-main replay.

AI assistance: scope, source and acceptance audit with Codex (GPT-6), 2026-10-28–30.
