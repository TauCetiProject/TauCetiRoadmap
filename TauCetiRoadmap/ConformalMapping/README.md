# Roadmap: conformal mapping and the geometric theory of holomorphic functions

**Summary.** This roadmap builds the conformal and geometric function theory of one complex
variable on top of what the pinned Tau Ceti already proves: the argument principle, Rouché,
Hurwitz and Morera (Layer 0); Montel and Vitali (Layer 1); Schwarz–Pick and the Poincaré disc
(Layer 2); the Riemann mapping theorem (Layer 3); analytic continuation, monodromy, reflection and
removability (Layer 4); the Carathéodory correspondence for Jordan domains (Layer 5); and the
Schwarz–Christoffel theorem for bounded polygons and for polygons with a sector or half-strip end
(Layer 6). Its own targets are the results that connect these into a usable library and the
theorems the library still lacks: the compactness and closedness criteria for families of univalent
maps, the Cayley comparison of the half-plane and disc hyperbolic metrics, reflection across
analytic arcs through explicit straightening charts,
removability of a rectifiable arc, the Jordan curve theorem for an arbitrary Jordan curve, the
integer index of a continuous closed loop with the Jordan index theorem and the continuous-boundary
argument principle, Darboux's boundary-injectivity theorem, and the Schwarz–Christoffel
normalization with source infinity at a finite vertex. Its end theorems are the Jordan curve
theorem, the Jordan index theorem, Darboux boundary injectivity and the source-infinity
Schwarz–Christoffel formula. Every statement is on the native carriers `Set ℂ`, `ℂ → ℂ`,
`TauCeti.IsJordanCurve`, `TauCeti.IsJordanDomain`, `TauCeti.filledHull`,
`TauCeti.Contour.windingNumber` and `TauCeti.schwarzChristoffelPrimitive`, with every hypothesis
named.

| Layer | Title | What it delivers |
|---|---|---|
| 0 | Local mapping and zero counting | the cycle-level argument principle and the multiplicity bookkeeping the boundary argument principle needs |
| 1 | Normal families | the compactness criterion in `C(↥Ω, ℂ)`, closedness of normalized univalent families |
| 2 | Schwarz–Pick and Poincaré geometry | the Cayley comparison `dist_ℍ(z, w) = 2·hyperbolicDist(c z, c w)` with the transported infinitesimal metric and geodesics |
| 3 | The Riemann mapping theorem | conformal and bundled packaging of the Riemann map and its inverse |
| 4 | Continuation, reflection and removability | straightening charts for analytic arcs, reflection across them, removability of a rectifiable arc |
| 5 | Jordan domains and the boundary index | the closed-disc homeomorphism of a chosen map, the Jordan curve theorem, the continuous index, the Jordan index theorem, the continuous-boundary argument principle, Darboux boundary injectivity, the Jordan-contour argument principle, extension across analytic boundary arcs |
| 6 | Schwarz–Christoffel theory | orientation and turning data of a simple polygon, the bounded, source-infinity, sector-end and half-strip-end formulas with their uniqueness normalizations |

## Scope and ownership

**This roadmap owns** the integration of the pinned conformal-mapping library and the theorems
listed in the summary. In particular it owns the full ambient Jordan curve theorem for a
topological Jordan curve in `ℂ` (§5.3), the integer index of a continuous closed loop about a
point off its trace and its comparison with the contour winding number (§§5.4–5.5), the Jordan
index theorem and the continuous-boundary argument principle (§§5.6–5.7), Darboux boundary
injectivity (§5.8), removability of a rectifiable Jordan arc (§4.3), the Cayley metric comparison
(§2.1), and every Schwarz–Christoffel normalization not proved at the pin (§§6.1–6.7).

**Already in the library.** The pinned Tau Ceti proves the central theorem of every layer: the
argument principle, Rouché, Hurwitz, Morera and the local degree (Layer 0); Montel's criterion
and Vitali's theorem (Layer 1); Schwarz–Pick in contraction, infinitesimal and rigidity form, the
Poincaré metric and the disc automorphism group (Layer 2); the Riemann mapping theorem with its
normalized and uniqueness forms, the homeomorphism bundle, inverse holomorphy and conformality
(Layer 3); analytic continuation along paths, the monodromy
theorems, reflection across the real axis and across charted analytic arcs, and removability of a
charted real locus (Layer 4); the Carathéodory correspondence with boundary injectivity and the
closure homeomorphism, its converse, and Jordan separation for curves with a straight piece
(Layer 5); and the Schwarz–Christoffel existence, necessity, angle-sum and prevertex-uniqueness
theorems for bounded polygons, existence and necessity for polygons with a sector or half-strip
end, and the power and logarithmic end asymptotics (Layer 6). These
are consumed by name in the supplier contracts below and are not targets. Mathlib's
`Analysis/Complex/RiemannMapping.lean` contains two public lemmas toward the Riemann mapping
theorem (`Complex.exists_injective_not_dense_image_deriv_ne_zero`,
`Complex.exists_mapsTo_unitBall_injOn_deriv_ne_zero`), not the theorem; the theorem consumed is
Tau Ceti's. Mathlib has no winding number of a continuous loop at the pin, so the continuous
index is built here (§5.4).

**Left to other roadmaps.**

- The contour calculus (piecewise-`C¹` curves, cycles, the principal-value winding number, the
  residue theorem and the homology form of Cauchy's theorem) is the completed
  ContourIntegration roadmap, Layers 0–3, implemented in `TauCeti.Analysis.Contour`.
- Absolutely continuous curves, their winding numbers, planar area and Green's area identity are
  DifferentialGeometry, 5.6; it consumes §5.3 and §5.5 here. Metric rectifiability, arclength,
  Hausdorff length, finite perimeter and the Jordan index theorem for an arclength
  parametrization with its outward normal are GeometricMeasureTheory, G1–G2 and G6; the
  rectifiable isoperimetric inequality is Isoperimetry, I6. Both consume §5.3. None of these is
  a supplier of any layer here.
- The bundled carrier `H(U)` of holomorphic maps on an open set with its compact-open uniformity
  and comparison metric is GlobalHolomorphicFunctions, GH0. Layer 1 is stated on families
  `F : ι → ℂ → ℂ` and on `C(↥Ω, ℂ)` and consumes nothing from it; GlobalHolomorphicFunctions
  restates §1.1 on its carrier and consumes §5.3 in its GH4.
- Modular and elliptic uniformization, the `λ`-function and Picard's theorem are ModularForms;
  deck groups and the Galois correspondence of covers are the completed UniversalCovers roadmap.
- Prime ends and the boundary correspondence for non-Jordan domains are outside this roadmap,
  which stops at Jordan domains.

## Conventions

- **Scalar `ℂ`.** Every conformal statement is for `f : ℂ → ℂ`. Reflection is scalar: the real
  boundary condition `(f z).im = 0` has no normed-space analogue without a real form. The
  normal-family estimates of Layer 1 keep the proper complex normed target `E` of their providers;
  the conformal applications take `E = ℂ`.
- **Domains.** A domain is an open connected `Ω : Set ℂ`; simple connectivity is Mathlib's
  `IsSimplyConnected Ω`. The Riemann-map hypotheses are `IsOpen Ω`, `IsSimplyConnected Ω`,
  `Ω ≠ univ`, in the form of `TauCeti.riemannMapping`. A Jordan domain is
  `TauCeti.IsJordanDomain Ω`: open, connected, bounded, with `TauCeti.IsJordanCurve (frontier Ω)`;
  a Jordan curve is a subset of `ℂ` homeomorphic to `Circle`.
- **Conformal isomorphism = holomorphic bijection.** A conformal map of `Ω` onto `Ω'` is
  `DifferentiableOn ℂ f Ω` with `Set.BijOn f Ω Ω'`; holomorphy of the inverse is derived by the
  open mapping theorem, and bundled equivalences are companions (§3.1), never replacements.
- **The disc** is `Metric.ball (0 : ℂ) 1`, and `Complex.UnitDisc` where a bundled type is needed.
- **Convergence of holomorphic families** is `TendstoLocallyUniformlyOn`, the compact-open
  topology; local boundedness is `TauCeti.IsLocallyBoundedOn`, bounded on every compact subset.
- **The hyperbolic distance** on the disc is `TauCeti.hyperbolicDist z w = Real.artanh p` with
  `p = |z − w|/|1 − conj(w) z|`, carrying the infinitesimal metric `|dz|/(1 − |z|²)`; there is no
  factor two. Mathlib's `UpperHalfPlane` distance is
  `dist z w = 2·arsinh (|z − w| / (2√(Im z · Im w)))`, carrying `|dz|/Im z`. Witness: for
  `z = i`, `w = 2i` the half-plane distance is `2·arsinh(1/(2√2)) = log 2`, and the Cayley images
  `0`, `1/3` have disc distance `artanh(1/3) = (log 2)/2`.
- **Conjugation** is `starRingEnd ℂ`; the real-axis reflection witness is
  `TauCeti.schwarzReflection f`, equal to `f z` for `Im z ≥ 0` and to `conj (f (conj z))` for
  `Im z < 0`.
- **Winding numbers.** `TauCeti.Contour.windingNumber γ a b w` is the principal-value integral
  `(2πi)⁻¹ PV∮ dz/(z − w)` of the completed ContourIntegration roadmap; it is junk on a
  nonrectifiable curve. The topological index of a continuous loop (§5.4) is an integer and is
  compared with it only under the integral's own hypotheses. Witness of orientation: the
  counterclockwise unit circle `t ↦ exp(2πit)` on `[0, 1]` has index `+1` about `0` and `0`
  about `3`; its reversal has index `−1` about `0`.
- **Orientation of a Jordan parametrization is a conclusion.** The sign `σ ∈ {1, −1}` of a Jordan
  parametrization (§5.6, §6.1) is proved to exist and is never a hypothesis.
- **Schwarz–Christoffel data.** Prevertices `a : ι → ℝ` are distinct reals; the exponent
  `e i ∈ (−1, 1)` at a vertex of interior angle `α i` is `e i = α i/π − 1`, so the sector at the
  vertex has opening `(e i + 1)π`; the primitive `TauCeti.schwarzChristoffelPrimitive a e z₀` is
  normalized by `F(z₀) = 0` and `F′(z) = ∏ᵢ (z − aᵢ)^{eᵢ}` on the upper half-plane with the
  analytic logarithm of argument in `(0, π)`; every map is an affine image `A·F + B`, `A ≠ 0`.
  The bounded polygon is Mathlib's `Polygon ℂ n` with vertices `poly i`, successor
  `finRotate n i`, edges `poly.edgeSet ℝ i` and boundary `poly.boundary ℝ`.
- **Mathlib coordination.** Layers 0–3 follow the shape of `Mathlib/Analysis/Complex/RiemannMapping.lean`
  and `Mathlib/Analysis/Complex/BranchLogRoot.lean`; a matching Mathlib result replaces the
  Tau Ceti proof by an import.

## Exact supplier contracts

### From Mathlib

- Cauchy theory and primitives: `Mathlib/Analysis/Complex/CauchyIntegral.lean`,
  `Mathlib/Analysis/Complex/HasPrimitives.lean` (Morera for a disc is
  `Complex.IsConservativeOn.isExactOn_ball`), removable singularities, the rectangle-integral
  criteria.
- The open mapping theorem `AnalyticOnNhd.is_constant_or_isOpenMap`
  (`Mathlib/Analysis/Complex/OpenMapping.lean`), the maximum modulus principle
  (`Mathlib/Analysis/Complex/AbsMax.lean`), the Schwarz lemma
  (`Mathlib/Analysis/Complex/Schwarz.lean`), continuous logarithms and roots on simply connected
  sets (`Mathlib/Analysis/Complex/BranchLogRoot.lean`).
- Holomorphy under locally uniform limits, `TendstoLocallyUniformlyOn.differentiableOn`, and
  convergence of derivatives, `TendstoLocallyUniformlyOn.deriv`
  (`Mathlib/Analysis/Complex/LocallyUniformLimit.lean`).
- `IsSimplyConnected` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean`),
  `Complex.UnitDisc`, the upper half-plane `UpperHalfPlane` with `upperHalfPlaneSet` and its
  metric (`Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean`, `UpperHalfPlane.dist_eq`,
  `UpperHalfPlane.tanh_half_dist`).
- Covering theory for the index: `AddCircle` as a covering of `ℝ`
  (`Mathlib/Topology/Covering/AddCircle.lean`), path lifting `IsCoveringMap.liftPath` with its
  uniqueness `IsCoveringMap.eq_liftPath_iff` (`Mathlib/Topology/Homotopy/Lifting.lean`), and the
  homeomorphism `AddCircle.homeomorphCircle'` of `AddCircle (2π)` with `Circle`. Mathlib has no
  winding number of a continuous loop at the pin.
- `eVariationOn` (`Mathlib/Topology/EMetricSpace/BoundedVariation.lean`), `OnePoint ℂ`,
  `Polygon` (`Mathlib/Geometry/Polygon/Basic.lean`) with `Polygon.edgeSet` and
  `Polygon.boundary`.

### From Tau Ceti

All modules are under `TauCeti.Analysis.Complex.Conformal` unless a path says otherwise.

- *Layer 0.* `TauCeti.argumentPrinciple_windingNumber` (`ArgumentPrinciple`): for `U` open, `S`
  a finite set, `f` analytic and nonvanishing on `U \ S`, meromorphic at the points of `S ∩ U`
  with integer order `ord`, and `γ` a closed piecewise-`C¹` curve in `U` avoiding `S` and
  null-homologous in `U`, the winding number of `f ∘ γ` about `0` is
  `Σ_{s ∈ S} windingNumber γ s · ord s`; its holomorphic form
  `TauCeti.argumentPrinciple_windingNumber_of_analyticOnNhd` reads the orders off
  `analyticOrderNatAt`. `TauCeti.Contour.argumentPrinciple_nullHomologous` is the integral form
  `∮ f′/f = 2πi Σ windingNumber · ord` (`TauCeti.Analysis.Contour.Argument.Cycle`). Rouché:
  `TauCeti.rouche`, `TauCeti.rouche_symm`, `TauCeti.rouche_add` on discs,
  `TauCeti.rouche_nullHomologous` and companions on null-homologous curves,
  `TauCeti.rouche_windingNumber_comp` in image-winding form (`Rouche`). Hurwitz:
  `TauCeti.hurwitz` (zero-free or identically zero), `TauCeti.hurwitz_eventually_exists_eq`,
  `TauCeti.hurwitz_injOn` (`Hurwitz`): for `Ω` open preconnected, `l` a nontrivial filter, `F i`
  eventually holomorphic and injective on `Ω` and `TendstoLocallyUniformlyOn F g l Ω`, `g` is
  injective on `Ω` or constant on `Ω`. `TauCeti.morera` (`Morera`): a continuous function on an
  open set whose rectangle integrals vanish is holomorphic. The local degree
  `TauCeti.localDegree`, `TauCeti.localDegree_card`, `TauCeti.exists_localDegree`,
  `TauCeti.exists_injOn_nhds_iff_deriv_ne_zero`, `TauCeti.deriv_ne_zero_of_injOn`
  (`LocalDegree`).
- *Layer 1.* `TauCeti.IsLocallyBoundedOn`, the Cauchy estimates and equicontinuity
  `TauCeti.IsLocallyBoundedOn.equicontinuousOn`, `TauCeti.IsLocallyBoundedOn.deriv`
  (`NormalFamilies`); `TauCeti.montel` (`Montel.Basic`): a locally bounded sequence of
  holomorphic maps of an open `Ω` into a proper complex normed space `E` has a subsequence
  converging locally uniformly on `Ω`; `TauCeti.isCompact_closure_range_iff_isLocallyBoundedOn`
  (`Montel.Precompact`): for `Ω : Opens ℂ`, `E` proper, `F : ι → ℂ → E` holomorphic on `Ω` and
  `f : ι → C(↥Ω, E)` with `⇑(f i) = Ω.domRestrict (F i)`, the range of `f` is relatively compact
  in `C(↥Ω, E)` iff `F` is locally bounded on `Ω`; `TauCeti.vitali`, `TauCeti.vitali_of_tendsto`
  (`Vitali`), for `Ω` open preconnected and `E = ℂ`.
- *Layer 2.* `TauCeti.pseudoHyperbolicExpr` (`PseudoHyperbolic`), `TauCeti.hyperbolicDist`,
  `TauCeti.hyperbolicDist_def`, `TauCeti.hyperbolicDist_map_le` (`Hyperbolic.Distance`),
  `TauCeti.tanh_hyperbolicDist` (`Hyperbolic.ClosedForm`), the Schwarz–Pick contraction
  `TauCeti.pseudoHyperbolicExpr_map_le` (`SchwarzPick.Basic`), the infinitesimal inequality
  `TauCeti.norm_deriv_div_one_sub_norm_sq_le` (`SchwarzPick.Derivative`): for `f` holomorphic on
  the unit disc mapping it into itself and `z` in the disc,
  `‖f′(z)‖/(1 − ‖f z‖²) ≤ 1/(1 − ‖z‖²)`; the rigidity theorems of `SchwarzPick.Rigidity`;
  `TauCeti.PoincareDisc.instMetricSpace`, `TauCeti.PoincareDisc.isometry_unitDiscStandardAutomorphismEquiv`
  (`Poincare.MetricSpace`); the automorphism classification
  `TauCeti.exists_forall_unitDisc_eq_unitDiscStandardAutomorphismEquiv`
  (`UnitDisc.Automorphism.Classification`) and parameter uniqueness
  `TauCeti.existsUnique_eq_unitDiscStandardAutomorphismEquiv`
  (`UnitDisc.Automorphism.Parametrization`); the Cayley maps
  `TauCeti.bijOn_sub_I_div_add_I_upperHalfPlaneSet`, `TauCeti.bijOn_I_mul_one_add_div_one_sub_ball`,
  `TauCeti.I_mul_one_add_sub_I_div_add_I_div_one_sub`, `TauCeti.differentiableOn_sub_I_div_add_I`
  (`TauCeti.Analysis.Complex.UpperHalfPlane.Cayley`), and the one-point special case
  `TauCeti.norm_discCoordinate` (`TauCeti.Analysis.Complex.UpperHalfPlane.DiscCoordinate`):
  `‖(τ − z)/(τ − conj z)‖ = tanh (dist τ z / 2)`.
- *Layer 3.* `TauCeti.riemannMapping` (`RiemannMapping.Existence`): for `Ω` open, simply
  connected and not `univ`, a holomorphic bijection of `Ω` onto the unit disc;
  `TauCeti.exists_bijOn_ball_differentiableOn_invFunOn` with the holomorphic inverse;
  `TauCeti.isSimplyConnected_iff_hasHolomorphicSquareRoots`;
  `TauCeti.riemannMapping_normalized`, `TauCeti.exists_isNormalizedRiemannMapOn`,
  `TauCeti.IsNormalizedRiemannMapOn.eqOn` (`RiemannMapping.Normalization`): the map with
  `f(z₀) = 0`, `f′(z₀) > 0` exists and is unique;
  `TauCeti.exists_eqOn_unitDiscStandardAutomorphismFormula_comp` (`RiemannMapping.Uniqueness`):
  two Riemann maps differ by a disc automorphism; `TauCeti.riemannMapping_homeomorph`,
  `TauCeti.riemannMapping_openPartialHomeomorph` (`RiemannMapping.Conformal`);
  `TauCeti.exists_bijOn_differentiableOn_invFunOn_of_isSimplyConnected`,
  `TauCeti.nonempty_homeomorph_of_isSimplyConnected` (`RiemannMapping.Equivalence`).
  For any holomorphic bijection of an open `U` onto `V`,
  `DifferentiableOn.toHomeomorphOfBijOn`, `DifferentiableOn.toHomeomorphOfBijOn_apply` and
  `DifferentiableOn.toHomeomorphOfBijOn_symm_apply` (`Biholomorph`) supply `U ≃ₜ V` and both
  coercions. `DifferentiableOn.invFunOn` (`Inverse.Function`) supplies inverse holomorphy;
  `DifferentiableOn.differentiableOn_toOpenPartialHomeomorph_symm`,
  `DifferentiableOn.conformalAt_of_isOpen_of_injOn` and
  `DifferentiableOn.conformalAt_toOpenPartialHomeomorph_symm` (`Biholomorph`) supply inverse
  holomorphy and conformality on the respective open sets. No boundedness is required.
- *Layer 4.* `TauCeti.IsAnalyticContinuationAlong f γ s` (`Continuation.Basic`): germs
  `f : X → ℂ → E` along `γ : X → ℂ` on the parameter set `s`, continuous path, analytic germs,
  local agreement; no completeness in the definition; uniqueness
  `TauCeti.IsAnalyticContinuationAlong.eventuallyEq` for `[CompleteSpace E]` and a preconnected
  `s` containing both parameters. `TauCeti.monodromy_theorem` (`Monodromy`): for a homotopy
  `h : p₀.Homotopy p₁` rel endpoints `z₀`, `z₁`, rows `f t` continuing along `x ↦ h(t, x)` from
  the same initial germ, every terminal germ equals `f 0 1` near `z₁`;
  `TauCeti.monodromy_theorem_of_free_homotopy`: if the initial germs continue along
  `t ↦ h(t, 0)`, the terminal germs continue along `t ↦ h(t, 1)`;
  `TauCeti.monodromy_theorem_of_free_homotopy_loop`, `TauCeti.monodromy_theorem_of_homotopy_refl`.
  `TauCeti.exists_differentiableOn_eqOn_conj_of_symmetric` (`Reflection.Principle`): for `Ω` open
  and conjugation-invariant, `f` continuous on `Ω ∩ {Im z ≥ 0}`, holomorphic on `Ω ∩ {Im z > 0}`
  and real on `Ω ∩ ℝ`, the witness `TauCeti.schwarzReflection f` is holomorphic on `Ω`, agrees
  with `f` on the closed upper part and satisfies `F(conj z) = conj(F z)`.
  `TauCeti.exists_differentiableOn_eqOn_chartedReflection_of_symmetric` (`Reflection.Arc`): for
  holomorphic charts `e`, `d` with conjugation-invariant targets, `f` mapping the closed positive
  side `e.source ∩ {Im(e z) ≥ 0}` into `d.source`, continuous there, holomorphic on the open side,
  with `Im(d(f z)) = 0` on the charted arc, the witness `TauCeti.chartedSchwarzReflection e d f`
  is holomorphic on `e.source`, agrees with `f` on the closed positive side and intertwines the
  chart reflections. `TauCeti.differentiableOn_of_continuousOn_of_differentiableOn_diff_of_subset_coord_im_eq_zero`
  (`Removability.Arc`): for a chart `e` holomorphic on an open `Ω ⊆ e.source`, `F` continuous on
  `Ω` and holomorphic on `Ω \ S` with `Ω ∩ S ⊆ {Im(e z) = 0}`, `F` is holomorphic on `Ω`.
- *Layer 5.* `TauCeti.IsJordanCurve` (`TauCeti.Topology.JordanCurve.Basic`),
  `TauCeti.IsJordanDomain`, `TauCeti.isJordanDomain_ball`, `TauCeti.IsJordanDomain.isSimplyConnected`,
  `TauCeti.IsJordanCurve.isJordanDomain_filledHull_sdiff_of_locally_eq_line` (`Jordan.Domain`): a
  Jordan curve agreeing with a line on a ball about one of its points bounds the Jordan domain
  `filledHull C \ C`; `TauCeti.IsJordanCurve.nonempty_filledHull_sdiff_of_locally_eq_line`,
  `TauCeti.IsJordanCurve.frontier_filledHull_sdiff_of_locally_eq_line`,
  `TauCeti.exists_ball_openSegment_eq_line` (`TauCeti.Analysis.Complex.PlaneSeparation.LocalSeparation`);
  `TauCeti.IsJordanCurve.frontier_connectedComponentIn`
  (`TauCeti.Analysis.Complex.PlaneSeparation.JordanCurve`): if `x`, `y` are off `C` and `y` is not
  in the component of `x`, that component has frontier `C`; `TauCeti.janiszewski`
  (`TauCeti.Analysis.Complex.PlaneSeparation.Basic`): two bounded closed sets with preconnected
  intersection, neither separating `x` from `y`, have a union not separating them. The filled hull
  `TauCeti.filledHull K = {x | IsBounded (connectedComponentIn Kᶜ x)}` (`TauCeti.Topology.FilledHull`)
  with `TauCeti.subset_filledHull_of_frontier_subset`, `TauCeti.filledHull_subset_closedConvexHull`
  for nonempty `K`, `TauCeti.isBounded_filledHull`,
  `TauCeti.connectedComponentIn_compl_eq_of_unbounded_component` for real dimension greater than
  one (`TauCeti.Analysis.Normed.Module.FilledHull`). Carathéodory:
  `TauCeti.exists_continuousOn_closedBall_eqOn_of_isJordanCurve_frontier` (`Caratheodory`): for
  `f` holomorphic and injective on `ball c r`, `0 < r`, with bounded image whose frontier is a
  Jordan curve, there is `F` continuous on `closedBall c r` agreeing with `f` on the open disc;
  `TauCeti.exists_continuousOn_closedBall_bijOn_ball_of_isJordanCurve_frontier`;
  `TauCeti.IsJordanDomain.injOn_closedBall_of_conformal` and
  `TauCeti.injOn_closedBall_of_isJordanCurve_frontier` (`Jordan.Approach`): that extension is
  injective on the closed disc; `TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`:
  for `Ω` open, connected, bounded with Jordan frontier, a map `g` continuous on the closed disc,
  holomorphic and bijective from the open disc onto `Ω`, and a homeomorphism `closedBall 0 1 ≃ₜ
  closure Ω` given by `g`. `TauCeti.image_frontier_eq_frontier_image`,
  `TauCeti.bijOn_closure_closure_image`, `TauCeti.closureHomeomorph` with
  `TauCeti.coe_closureHomeomorph_apply` and `TauCeti.coe_closureHomeomorph_symm_apply`
  (`BoundaryCorrespondence`): for `U` bounded, `F` continuous on `closure U`, `F = f` on `U` and
  `F` injective on `closure U`, `F` is a homeomorphism `closure U ≃ₜ closure (f '' U)` whose
  inverse is `Function.invFunOn F (closure U)`; the frontier statement needs `U` open, `f`
  holomorphic and injective on `U`. Converse: `TauCeti.isJordanDomain_of_isJordanCurve_frontier_image`
  and `TauCeti.isJordanDomain_of_image_eq_ball` (`Jordan.Domain`). Half-plane form:
  `TauCeti.exists_continuousOn_bijOn_upperHalfPlaneSet_of_isJordanCurve_frontier` and
  `TauCeti.exists_prevertices_of_isJordanCurve_frontier` (`Jordan.UpperHalfPlane`): a boundary
  point `p` is sent to infinity, the map is continuous and injective on the closed half-plane and
  tends to `p` at infinity, and finitely many other boundary points have real prevertices;
  `TauCeti.exists_continuousOn_bijOn_upperHalfPlaneSet_of_injOn_closedBall` (`UpperHalfPlane`) for a
  chosen disc map. The contour side: `TauCeti.Contour.exists_continuousOn_arg_lift_with_partition`
  (`TauCeti.Analysis.Contour.Argument.Lift`): a continuous curve on `[a, b]` avoiding `w` has a
  continuous real argument `θ` on `[a, b]` with `γ t − w = ‖γ t − w‖ exp(iθ t)`;
  `TauCeti.Contour.exists_contDiff_eq_endpoints_dist_lt` (`TauCeti.Analysis.Contour.Curve.Approximation`):
  a continuous `f : C(I, ℂ)` is approximated within any `ε` by a smooth curve with the same
  endpoints; `TauCeti.Contour.exists_int_windingNumber_of_closed`,
  `TauCeti.Contour.windingNumber_eq_of_dist_lt_dist` (the dog-on-a-leash proximity theorem for
  two closed curves differentiable off a common countable set with integrable derivatives),
  `TauCeti.Contour.windingNumber_eq_of_mem_connectedComponentIn`,
  `TauCeti.Contour.windingNumber_eq_zero_of_unbounded_component`,
  `TauCeti.Contour.windingNumber_circleMap_eq_one_of_dist_lt`, `TauCeti.Contour.IsPiecewiseC1On`
  with `TauCeti.Contour.IsPiecewiseC1On.exists_countable_differentiableAt`.
- *Layer 6.* `TauCeti.schwarzChristoffelIntegrand`, `TauCeti.schwarzChristoffelPrimitive`,
  `TauCeti.schwarzChristoffelPrimitive_apply_base`, `TauCeti.deriv_schwarzChristoffelPrimitive`,
  `TauCeti.logDeriv_deriv_schwarzChristoffelPrimitive` (`SchwarzChristoffel.Integrand`,
  `SchwarzChristoffel.Primitive`); the vertices `TauCeti.schwarzChristoffelVertex` and the vertex
  at infinity `TauCeti.schwarzChristoffelVertexAtInfinity` with
  `TauCeti.tendsto_schwarzChristoffelPrimitive_atInfinity` for `Σ eᵢ < −1`
  (`SchwarzChristoffel.Vertex`, `SchwarzChristoffel.Infinity.Basic`). Bounded polygons:
  `TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier` and
  `TauCeti.exponent_sum_eq_neg_two_of_isJordanCurve_frontier` (`SchwarzChristoffel.JordanPolygon`):
  for `U` open, connected, bounded with Jordan frontier, distinct vertices `v i` with a local
  sector model of opening `(e i + 1)π` and a local half-plane model at every other frontier
  point, there are distinct real prevertices `a` and `A ≠ 0`, `B` with `z ↦ A·F + B` a bijection
  of the upper half-plane onto `U` sending the vertex at `a i` to `v i`, and `Σ eᵢ = −2`.
  Necessity: `TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_domain` and
  `TauCeti.exponent_sum_eq_neg_two_of_polygonal_domain` (`SchwarzChristoffel.PolygonalDomain`):
  for `f` holomorphic on the half-plane, continuous and injective on the closed half-plane, with
  image `U`, vertex values `f (a i) = v i`, a finite limit `p` at infinity with
  `p ∉ f '' {Im z ≥ 0}`, and the local side and corner models, `f = f′(z₀)/F′(z₀)·F + f(z₀)` on
  the half-plane. Formula level:
  `TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_boundary`
  (`SchwarzChristoffel.Formula`) takes side and corner conditions on the boundary values of `f`
  and a finite limit `L` of `z f″/f′` at infinity, and `TauCeti.exponent_sum_eq_of_logDeriv_deriv_eqOn`
  gives `Σ eᵢ = L`. Uniqueness: `TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_iff`
  (`SchwarzChristoffel.Uniqueness`), `TauCeti.crossRatio_eq_of_bijOn_schwarzChristoffelPrimitive`,
  `TauCeti.eq_and_eqOn_of_bijOn_schwarzChristoffelPrimitive`,
  `TauCeti.exists_prevertex_cayley_automorphism` (`SchwarzChristoffel.PrevertexUniqueness`);
  affine covariance `TauCeti.schwarzChristoffelPrimitive_affine_prevertices`,
  `TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_affine_prevertices`
  (`SchwarzChristoffel.AffineCovariance`); the disc form
  `TauCeti.schwarzChristoffelDiscPrimitive`, `TauCeti.schwarzChristoffelDiscPrimitive_option_zero`,
  `TauCeti.exists_bijOn_const_mul_schwarzChristoffelDiscPrimitive_add_with_infty_of_bijOn`
  (`SchwarzChristoffel.Disc.Basic`); sector ends
  `TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_insert_infty`,
  `TauCeti.exponent_sum_eq_sub_one_of_isJordanCurve_insert_infty`,
  `TauCeti.exists_bijOn_const_mul_schwarzChristoffelDiscPrimitive_add_of_isJordanCurve_insert_infty`
  (`SchwarzChristoffel.JordanPolygon`, `SchwarzChristoffel.Disc.Infinity`),
  `TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_unbounded_polygonal_domain`,
  `TauCeti.exponent_sum_eq_sub_one_of_unbounded_polygonal_domain`,
  `TauCeti.tendsto_schwarzChristoffelPrimitive_div_cpow_atInfinity_of_neg_one_lt_sum`
  (`SchwarzChristoffel.Infinity.Power`): for any finite real data `a, e` with
  `S = Σ eᵢ > −1`, the normalized primitive satisfies `F(z)/z^{S+1} → 1/(S+1)` through the
  entire upper half-plane at infinity, with principal powers; no polygonality, distinctness
  or ordering is required. Half-strip ends
  `TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_of_halfStrip`,
  `TauCeti.exponent_sum_eq_neg_one_of_isJordanCurve_of_halfStrip`,
  `TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_halfStrip_polygonal_domain`,
  `TauCeti.exponent_sum_eq_neg_one_of_halfStrip_polygonal_domain`,
  `TauCeti.tendsto_schwarzChristoffelPrimitive_sub_log_atInfinity`
  (`SchwarzChristoffel.Infinity.Logarithmic`): for any finite real data with `Σ eᵢ = −1`,
  `F(z) − log z → TauCeti.schwarzChristoffelLogConstantAtInfinity a e z₀` through the entire
  upper half-plane, using the principal logarithm and the specified base point. Simple polygons:
  `Polygon.IsSimple`, `Polygon.IsSimple.three_le`, `Polygon.boundaryParamCircle`,
  `Polygon.IsSimple.boundaryParamCircle_injective`, `Polygon.IsSimple.isJordanCurve_boundary`,
  `Polygon.IsSimple.exists_mem_nhds_inter_boundary_eq` (`TauCeti.Geometry.Polygon.Simple`).

### From TauCetiRoadmap.ContourIntegration

The completed ContourIntegration roadmap, Layers 0–3, owns the piecewise-`C¹` curve and cycle
calculus, `TauCeti.Contour.windingNumber`, the residue theorem and the homology form of Cauchy's
theorem, all implemented at the pin in `TauCeti.Analysis.Contour`. Layer 0 and §§5.5, 5.9 consume
them with the hypotheses listed above; nothing about contours is re-proved here.

## How to read the build

Layers are in build order. Layer 0 adds the cycle-level argument principle and the multiplicity
bookkeeping that §5.7 consumes. Layer 1 states the compactness and closedness criteria for
families of holomorphic and univalent maps on `C(↥Ω, ℂ)`. Layer 2 proves the Cayley comparison
of the hyperbolic metrics and transports the infinitesimal metric and geodesics. Layer 3 uses
the conformal Riemann-map interfaces from the supplier contracts. Layer 4 builds straightening
charts for real-analytic arcs,
reflects across them, and proves removability of a rectifiable arc. Layer 5 is the core: the
closed-disc homeomorphism of a chosen map, the Jordan curve theorem, the continuous index, the
Jordan index theorem, the continuous-boundary argument principle, Darboux boundary injectivity,
the Jordan-contour argument principle, and extension across analytic boundary arcs. Layer 6 adds
the orientation and turning data of simple polygons and the Schwarz–Christoffel normalizations
the pin lacks, chiefly source infinity at a finite vertex. §§5.3–5.6 use nothing from Layer 6 or
from any roadmap that consumes this one.

## Layer 0: local mapping and zero counting

### 0.1 The argument principle for a cycle

Prove the argument principle for a null-homologous cycle, by linearity from the curve form:
for `U` open, `S` finite, `f` analytic and nonvanishing on `U \ S`, meromorphic with integer
order `ord s` at each `s ∈ S ∩ U`, and a cycle `Γ` of closed piecewise-`C¹` curves in `U` with
integer coefficients, avoiding `S` and null-homologous in `U`,
`∮_Γ f′/f = 2πi Σ_{s ∈ S} windingNumber(Γ, s) · ord s`, the winding number of the cycle being the
coefficient-weighted sum of the curves' winding numbers (Conway, *Functions of One Complex
Variable I*, V.3.4). Points of `S` outside `U` contribute zero by null homology. Give the
holomorphic form with `analyticOrderNatAt` and the image-winding form (the winding number of
`f ∘ Γ` about `0`). *Needs:* `TauCeti.Contour.argumentPrinciple_nullHomologous`,
`TauCeti.argumentPrinciple_windingNumber`, the cycle winding number of
ContourIntegration Layer 0.

- The three forms agree when `Γ` is a single curve: the cycle form specializes to the pinned
  curve form.
- The sum over `S` is additive in the cycle and changes sign under reversal of every curve.

**Checks.**
- `f z = z` on the unit circle traversed once counterclockwise: the integral is `2πi`, one simple
  zero; a definition that forgot the factor `2πi` gets `1`.
- `f z = z²`: `2·2πi`; a definition counting zeros without multiplicity gets `2πi`.
- `f z = 1/z`: `−2πi`; a definition with the pole sign reversed gets `+2πi`.
- The circle about `3` of radius `1` and `f z = z`: `0`, the zero is not enclosed.
- The circle traversed twice (coefficient `2` in the cycle) and `f z = z`: `4πi`.
- The reversed circle and `f z = z`: `−2πi`, the orientation witness of the conventions.

### 0.2 Multiplicity bookkeeping for boundary zero counts

Prove the two facts the continuous-boundary argument principle (§5.7) needs. First, for `Ω` open
connected, `f` continuous on `closure Ω`, holomorphic on `Ω`, not identically zero on `Ω` and
nonvanishing on `frontier Ω` with `closure Ω` compact, the zero set of `f` in `Ω` is finite:
nonvanishing on the compact frontier and continuity confine the zeros to a compact subset of `Ω`,
where they are isolated by the identity theorem. Second, transport of multiplicity: for `φ` a
holomorphic bijection of an open `U` onto an open `V` and `f` analytic on `V`,
`analyticOrderNatAt (f ∘ φ) z = analyticOrderNatAt f (φ z)`, because `φ′(z) ≠ 0` by
`TauCeti.deriv_ne_zero_of_injOn` (Conway, IV.7.6). *Needs:* `TauCeti.deriv_ne_zero_of_injOn`,
Mathlib `analyticOrderNatAt`, the identity theorem.

- The zero count is unchanged by a conformal change of variable on the source.
- A constant zero function is excluded by the nonvanishing-on-the-frontier hypothesis.

**Checks.**
- `f z = z²` on the unit disc and `φ z = 2z` on the disc of radius `1/2`: both orders at `0`
  are `2`; a definition using `φ` without the derivative condition could lose the count if `φ`
  had a critical point.
- `f z = z` composed with `φ z = z²` on the unit disc, `φ` not injective: the order at `0` is
  `2 ≠ 1`, the negative control for the injectivity hypothesis.
- `f z = sin(1/(1 − z))` on the unit disc has no continuous extension at `1`, though it is
  analytic near every other boundary point. Its zeros `zₙ = 1 − 1/(nπ)`, `n ≥ 1`, tend to `1`;
  at `xₙ = 1 − 1/(π/2 + 2nπ)` its values are `1`, so the two limits disagree.

### Examples

The circle `γ t = exp(2πit)` on `[0, 1]` and `f z = (z − 1/2)(z + 1/2)`: the integral form gives
`2πi·2`, the image-winding form says `f ∘ γ` winds twice about `0`.

### Dependencies

Mathlib Cauchy theory; Tau Ceti `ArgumentPrinciple`, `Rouche`, `Hurwitz`, `Morera`,
`LocalDegree`; ContourIntegration Layers 0–3.

## Layer 1: normal families

### 1.1 The compactness criterion in the space of continuous maps

For `Ω : Opens ℂ`, `E` a proper complex normed space and a set `𝓕 ⊆ C(↥Ω, E)` of restrictions of
maps holomorphic on `Ω`, prove `compact_holomorphic_family`: `𝓕` is compact iff it is closed
in `C(↥Ω, E)` and locally bounded on `Ω`, and that the closure of a locally bounded such set consists of restrictions of
holomorphic maps (Conway, VII.2.9; Remmert, *Classical Topics in Complex Function Theory*,
Ch. 7). The adapter between a family `F : ι → ℂ → E` and its restrictions is
`⇑(f i) = Ω.domRestrict (F i)`; compact-open convergence in `C(↥Ω, E)` is
`TendstoLocallyUniformlyOn` on ambient representatives, by
`ContinuousMap.tendsto_iff_tendstoLocallyUniformly`. *Needs:*
`TauCeti.isCompact_closure_range_iff_isLocallyBoundedOn`,
`TendstoLocallyUniformlyOn.differentiableOn`, Mathlib's compact-convergence topology on
`C(↥Ω, E)`.

- The limit of a locally uniformly convergent family of holomorphic maps is holomorphic, and its
  derivatives converge locally uniformly (`TendstoLocallyUniformlyOn.deriv`).
- The words "compact" and "closed" refer to the compact-open topology of `C(↥Ω, E)`, nothing
  else.

**Checks.**
- `F n z = zⁿ` on the unit disc is locally bounded and converges locally uniformly to `0`; its
  closure in `C(↥𝔻, ℂ)` is compact.
- `F n z = n z` on the unit disc is `0` at `z = 0` for every `n`, is pointwise unbounded
  at each `z ≠ 0`, and is unbounded on every neighbourhood of `0`. On the compact disc
  `|z| ≤ 1/2`, the suprema are `n/2`, so local boundedness and subsequential convergence fail.
- `F n z = n` on `ℂ`: pointwise divergence everywhere, not locally bounded, a definition reading
  "bounded at each point" instead of "bounded on each compact" gets this case wrong in the same
  way.

### 1.2 Limits of univalent maps and fixed normalizations

For `Ω` open preconnected, a nontrivial filter `l`, and `F i` eventually holomorphic and injective
on `Ω` with `TendstoLocallyUniformlyOn F g l Ω`, the limit `g` is injective on `Ω` or constant on
`Ω` (Conway, VII.2.6); this is `TauCeti.hurwitz_injOn`, and the constant alternative occurs:
`F n z = z/(n + 1)` on the disc converges to `0`. Prove the closedness theorem: for `a ≠ b` in
`Ω` and `u ≠ v`, the family of maps holomorphic and injective on `Ω` with `f(a) = u`, `f(b) = v`
is closed under locally uniform limits, since point evaluations are continuous and the limit
takes distinct values at `a` and `b`, which excludes the constant branch; likewise the family with
`f(a) = u` and `f′(a) = w ≠ 0` is closed, by convergence of derivatives. These are closedness
statements; compactness needs local boundedness in addition (§1.1). Record the sequence-level
two-point Rouché route for the dichotomy: with `w_n = F_n(a) → g(a)`, compare `F_n − w_n` with
`g − g(a)` on a small closed disc about `b` not containing `a`; injectivity makes `F_n − w_n`
zero-free there, and if `g` were nonconstant with `g(b) = g(a)` the boundary minimum of
`|g − g(a)|` and locally uniform convergence would force a zero of `F_n − w_n`, by Rouché and the
isolated-zero theorem. *Needs:* `TauCeti.hurwitz_injOn`, `TauCeti.rouche`,
`TendstoLocallyUniformlyOn.deriv`, §1.1.

- If `g(a) ≠ g(b)` for some `a, b ∈ Ω`, the limit is injective on `Ω`.
- Both alternatives of the dichotomy concern `g` restricted to `Ω` only.

**Checks.**
- `F n z = z/(n + 1)`, `Ω` the unit disc: every `F n` is injective, the limit is the constant
  `0`; a statement claiming injectivity of every limit is refuted.
- `F n z = z + z²/(4(n + 1))`, `n ∈ ℕ`, on the unit disc: `F n 0 = 0`, `(F n)′(0) = 1`.
  For distinct `z,w`, the difference quotient is `1 + (z + w)/(4(n + 1))`, of modulus at
  least `1 − 1/(2(n + 1)) ≥ 1/2`; every member is injective, including `n = 0`, and the limit
  is `z`. Thus this is a family satisfying the derivative-one normalization at every index.
- For the same family, `F n (1/8) = 1/8 + 1/(256(n + 1)) → 1/8` and `F n 0 = 0`; the
  limiting values are distinct, so the nonconstant-limit criterion applies, although the
  family does not keep the second value fixed.
- `F n z = z/(n + 1)` has derivative `1/(n + 1)` at `0`, equal to `1` only at `n = 0`, and
  collapses to `0`; it is not a family with derivative-one normalization.
- Non-example: a family on a disconnected `Ω` (two disjoint discs) can converge to a map that is
  constant on one disc and injective on the other, so preconnectedness is needed.

### Examples

The pointed family of injective holomorphic maps `f : Ω → 𝔻` with `f(z₀) = 0` used by the Riemann
mapping theorem is locally bounded (by `1`), and by §1.2 its limits with `f′(z₀) ≠ 0` are
injective.

### Dependencies

Tau Ceti `NormalFamilies`, `Montel.Basic`, `Montel.Precompact`, `Vitali`, `Hurwitz`, `Rouche`;
Mathlib `LocallyUniformLimit`; Layer 0.

## Layer 2: Schwarz–Pick and Poincaré geometry

### 2.1 The Cayley comparison of the hyperbolic metrics

Prove `upperHalfPlane_dist_eq_two_mul_hyperbolicDist`: for `z, w : UpperHalfPlane` and the Cayley
map `c(z) = (z − i)/(z + i)`, Mathlib's half-plane distance equals `2·hyperbolicDist(c z, c w)`
(Ahlfors, *Conformal Invariants*, Ch. 1 §1-1; Mathlib's normalization is
`UpperHalfPlane.dist_eq`). The route: `tanh(dist z w / 2) = |z − w|/|z − conj w|`
(`UpperHalfPlane.tanh_half_dist`) and `tanh(hyperbolicDist(c z, c w)) = p(c z, c w)`
(`TauCeti.tanh_hyperbolicDist`), so it suffices to prove the norm identities
`|c z − c w| = 2|z − w|/(|z + i||w + i|)` and `|1 − conj(c w) c z| = 2|z − conj w|/(|z + i||w + i|)`,
whence `p(c z, c w) = |z − w|/|z − conj w|`, and `Im z > 0` gives `|c z| < 1`. Then
transport: the infinitesimal half-plane metric `|dz|/Im z` is the pullback of `2|dζ|/(1 − |ζ|²)`,
and the geodesics of the half-plane (vertical lines and semicircles orthogonal to `ℝ`) are the
Cayley preimages of the disc geodesics through the pinned `Poincare.Geodesic` API. *Needs:*
`UpperHalfPlane.tanh_half_dist`, `TauCeti.tanh_hyperbolicDist`, `TauCeti.hyperbolicDist_def`,
`TauCeti.bijOn_sub_I_div_add_I_upperHalfPlaneSet`, `TauCeti.differentiableOn_sub_I_div_add_I`,
Tau Ceti `Poincare.Geodesic`, `Poincare.MetricSpace`.

- `c` is a holomorphic bijection of the upper half-plane onto the disc with inverse
  `ζ ↦ i(1 + ζ)/(1 − ζ)`, and `c(i) = 0`.
- The pinned one-point case `TauCeti.norm_discCoordinate` with centre `i` is the case `w = i`.
- No second disc distance and no second automorphism carrier is introduced; the half-plane uses
  Mathlib's `UpperHalfPlane` and the disc `TauCeti.hyperbolicDist`.

**Checks.**
- `z = i`, `w = 2i`: the half-plane distance is `2·arsinh(1/(2√2)) = log 2`; the Cayley images
  are `0` and `1/3`, with `hyperbolicDist = artanh(1/3) = (log 2)/2`; the factor `2` is
  pinned, and a comparison without it fails by a factor of two.
- `z = w`: both sides `0`.
- `z = i`, `w = 1 + i`: `tanh(dist/2) = |z − w|/|z − conj w| = 1/|−1 + 2i| = 1/√5` on the left;
  `c(1 + i) = 1/(1 + 2i) = (1 − 2i)/5`, of modulus `1/√5`, and
  `hyperbolicDist(0, c w) = artanh(1/√5)`, agreeing.
- Non-example: the inverse Cayley direction `ζ ↦ (ζ − i)/(ζ + i)` applied to disc points does
  not land in the disc (`ζ = 0` goes to `−1`), so the direction of `c` is part of the statement.

### Examples

A function `f` holomorphic on the unit disc with `f(𝔻) ⊆ 𝔻` and `f(1/2) = 3/4` has
`|f′(1/2)| ≤ (1 − (3/4)²)/(1 − (1/2)²) = 7/12`, by `TauCeti.norm_deriv_div_one_sub_norm_sq_le`;
so the additional datum `f′(1/2) = 2/3` is impossible, since `2/3 > 7/12`. The disc automorphism
`z ↦ (z − 1/2)/(1 − z/2)` followed by a rotation and a Möbius map sending `0` to `3/4` attains
`7/12` in modulus, so the bound is sharp.

### Dependencies

Tau Ceti `PseudoHyperbolic`, `Hyperbolic.Distance`, `Hyperbolic.ClosedForm`, `SchwarzPick`,
`Poincare`, `UnitDisc.Automorphism`, `UpperHalfPlane.Cayley`; Mathlib `UpperHalfPlane.Metric`.

## Layer 3: the Riemann mapping theorem

### 3.1 Conformal packaging of the Riemann map

For `Ω` open, simply connected and not `univ`, the pinned `TauCeti.riemannMapping` gives a
holomorphic bijection `f` of `Ω` onto the unit disc (Conway, VII.4.2). Use the bundle and
inverse from the Layer 3 supplier contract, with the normalization
`f(z₀) = 0`, `f′(z₀) > 0`. The uniqueness provider compares maps `Ω → 𝔻` by postcomposing
with a disc automorphism `a`; the inverse of `a ∘ f` is `f⁻¹ ∘ a⁻¹`. Keep the proof route
explicit in the docstrings: nonemptiness of the pointed injective family by the square-root
construction (`TauCeti.isSimplyConnected_iff_hasHolomorphicSquareRoots`), normality by Layer 1,
and surjectivity of a maximizer of `|f′(z₀)|` by the Koebe argument. *Needs:*
`TauCeti.riemannMapping`, `TauCeti.exists_bijOn_ball_differentiableOn_invFunOn`,
`TauCeti.riemannMapping_normalized`, `TauCeti.exists_eqOn_unitDiscStandardAutomorphismFormula_comp`,
Mathlib `ConformalAt`, Tau Ceti `DifferentiableOn.toOpenPartialHomeomorph` (`Biholomorph`).

- Any two simply connected proper domains are conformally equivalent, by composing a Riemann map
  with the inverse of another (`TauCeti.exists_bijOn_differentiableOn_invFunOn_of_isSimplyConnected`).

**Checks.**
- `Ω = 𝔻`, `z₀ = 0`: the normalized Riemann map is the identity, by
  `TauCeti.eqOn_id_of_isNormalizedRiemannMapOn_ball`.
- `Ω` the upper half-plane, `z₀ = i`: the normalized map is `z ↦ (z − i)/(z + i)` rotated so
  that its derivative at `i`, namely `1/(2i)` times the rotation, is positive, so the rotation is
  multiplication by `i`.
- Non-example: `z ↦ z²` on the unit disc is `ConformalAt` every nonzero point but is not
  injective, so conformality at every point is not the packaging; the bijection is.
- Non-example: `Ω = ℂ` has no map onto the disc (Liouville), matching the hypothesis `Ω ≠ univ`.

### Examples

The slit plane `ℂ \ (−∞, 0]` is simply connected (`BranchLogRoot` gives its square root), and
its Riemann map normalized at `1` is `z ↦ (√z − 1)/(√z + 1)`.

### Dependencies

Tau Ceti `RiemannMapping.*`, `SquareRoots`, `LocalDegree`; Layers 1–2; Mathlib `ConformalAt`.

## Layer 4: analytic continuation, reflection and removability

### 4.1 Straightening charts for regular real-analytic arcs

Define a regular real-analytic arc as a map `γ : ℝ → ℂ` analytic on an open interval `I₀` about
`t₀`, with `γ′(t₀) ≠ 0` and injective on `I₀`. Construct its straightening chart: extend the real
power series of `γ` at `t₀` to a holomorphic map `Γ` on a complex neighbourhood of `t₀`, shrink
so that `Γ′` never vanishes and `Γ` is injective, and take the holomorphic inverse as an
`OpenPartialHomeomorph` `e` about `γ(t₀)`, shrunk again so that `e.target` is a
conjugation-invariant disc and the arc is exactly the real locus of the chart source:
`e.source ∩ {z | Im(e z) = 0} = γ(I₀ ∩ e-preimage)`. Choose the sign of `e` (replace `e` by
`−e`) so that a designated side of the arc maps to `Im(e z) > 0` (Ahlfors, *Complex Analysis*,
Ch. 6 §1.4, Theorem 4 and its preceding construction, pp. 234–235). Mere containment of the arc
in the real locus is
not enough: the exact equality and the chosen side are the content. Möbius maps straighten only
circles and lines, so a general analytic arc needs this chart. *Needs:* Mathlib
`AnalyticAt`, `HasFPowerSeriesAt`, the holomorphic inverse function theorem as Tau Ceti's
`DifferentiableOn.toOpenPartialHomeomorph` (`Biholomorph`),
`TauCeti.exists_injOn_nhds_iff_deriv_ne_zero`.

- The chart is holomorphic on its source, its target is conjugation-invariant, and the arc is its
  entire real locus.
- The two sides of the arc near `γ(t₀)` are the preimages of `Im(e z) > 0` and `Im(e z) < 0`,
  and the sign choice selects which is which.
- A target arc gets a chart `d` with the same clauses, for use in §4.2.

**Checks.**
- The real axis, `γ t = t`: the chart is the identity on a disc, real locus the real axis, the
  upper half-disc the positive side.
- The unit circle, `γ t = exp(it)` near `t₀ = 0`: the chart is `z ↦ −i log z` on a slit
  neighbourhood of `1`, whose real locus is the circle; since `Im(−i log z) = −log|z|`, the
  interior of the circle is the positive side, and `−e` selects the exterior; a chart with
  containment only, such as `z ↦ −i log z` on a disc not shrunk to make the target
  conjugation-invariant, fails the invariance clause.
- Non-example: `γ t = t + i t³` is real-analytic and regular, and its chart is the inverse of
  `z ↦ z + i z³`; the parabola `γ t = t + i t²` likewise. The arc `γ t = t + i|t|³`, `C²` but
  not analytic, has no such chart, and a cusp `γ t = t² + i t³` (`γ′(0) = 0`) is excluded by the
  regularity hypothesis.

### 4.2 Reflection across analytic arcs

With source and target charts `e`, `d` from §4.1, prove the reflection theorem for a map `f`
continuous on the closed positive side of the source arc, holomorphic on the open side, mapping
into `d.source`, and carrying the arc into the target arc: `f` extends holomorphically across the
source arc, agreeing with `f` on the closed positive side and intertwining the chart reflections
`e.symm ∘ conj ∘ e` and `d.symm ∘ conj ∘ d` (Conway, IX.1.1 for the real axis; Ahlfors,
Ch. 4 §6.5, Theorem 24, pp. 172–173 for real-axis reflection; Ch. 6 §1.4, Theorem 4,
p. 235 for analytic arcs). This is the pinned charted reflection applied to the charts of §4.1;
the adapter is
the verification of its hypotheses, in particular `Im(d(f z)) = 0` on the arc from the arc
condition. For the real axis, the extension is `TauCeti.schwarzReflection f`. *Needs:* §4.1,
`TauCeti.exists_differentiableOn_eqOn_chartedReflection_of_symmetric`,
`TauCeti.exists_differentiableOn_eqOn_conj_of_symmetric`.

- The extension is unique on the connected components of the reflected neighbourhood meeting the
  positive side, by the identity theorem.
- When the source and target arcs are both circles or lines, the charts may be Möbius maps, and
  the theorem specializes to the pinned line and circle reflections.

**Checks.**
- `f z = z` on the upper half-plane with both arcs the real axis: the extension is the identity.
- `f z = z²` on the upper half-disc near `1` with source arc the real axis and target arc the
  real axis: the extension is `z²`, and the intertwining identity reads `conj(z)² = conj(z²)`.
- Non-example: `f z = conj z` is continuous and real on the axis but not holomorphic on the open
  side; the hypothesis fails and the conclusion, holomorphy on a neighbourhood, is false.
- Non-example: a map sending the arc to a non-analytic curve has no target chart; nothing is
  claimed.

### 4.3 Removability of a rectifiable arc

Prove `differentiableOn_of_continuousOn_of_differentiableOn_diff_rectifiable_arc`: for `γ`
continuous and injective on `[a, b]`, `a < b`, with `eVariationOn γ (Icc a b) ≠ ⊤`, an open
`V ⊆ ℂ`, and `F` continuous on `V` and holomorphic on `V \ γ '' [a, b]`, `F` is holomorphic on
`V` (Besicovitch, Proc. London Math. Soc. (2) 32 (1931), pp. 1–9, for sets of finite length). The
route is Morera: holomorphy is local, so fix a closed square `Q ⊆ V`; at mesh `δ` the arc of
length `L` meets at most `O(1 + L/δ)` grid squares; on each such square subtract the value of `F`
at a corner and bound the contour integral by `4δ·ω(√2 δ)`, with `ω` the modulus of continuity
of `F` on `Q`; the squares not meeting the arc contribute zero by Cauchy; the total error
`O((L + δ)·ω(√2 δ))` tends to zero, so `∮_{∂Q} F = 0`. Distinguish this from the charted
removability of the pin, which needs a holomorphic chart with the exceptional set in its real
locus; a rectifiable arc has no such chart in general. The relatively closed form, for an arc
`Γ ⊆ V` with `Γ` closed in `V` and every point of `V` having a neighbourhood meeting `Γ` in a
compact finite-length subarc, follows by localization. *Needs:* `TauCeti.morera`, Mathlib
`eVariationOn`, the rectangle Cauchy theorem, Mathlib's modulus-of-continuity bounds on compact
sets.

- A compact regular `C¹` embedded arc is a special case (finite length by the fundamental theorem
  of calculus).
- No tubular neighbourhood of the arc is used; the hypothesis is finite length only.
- Nothing is claimed for a nonrectifiable arc.

**Checks.**
- The segment `[−1, 1]` on the real axis and `F z = z`: holomorphic on `V` trivially; the
  theorem is consistent with the pinned real-locus removability, which is its case `e = id`.
- The unit circle arc `γ t = exp(it)` on `[0, π]` with `F z = |z|²`: continuous, holomorphic
  off the arc fails (it is holomorphic nowhere), so the hypothesis fails; the negative control
  for "holomorphic off the arc".
- `F z = 1/(z − 1/2)` on `V = 𝔻` with the arc the segment `[0, 1/4]`: `F` is not continuous
  at `1/2 ∉ Γ`; the hypothesis fails and the conclusion fails, so continuity on all of `V` is
  needed.
- The Koch curve is a Jordan arc of infinite length; it is outside the hypotheses, and a
  definition of the arc that dropped the finite-variation clause would overstate the theorem.

### Examples

A function continuous on the plane and holomorphic off the unit circle is entire: the circle is
rectifiable, and this is the pinned circle removability `TauCeti.differentiableOn_of_continuousOn_of_differentiableOn_diff_sphere`
as a special case of §4.3.

### Dependencies

Tau Ceti `Continuation.Basic`, `Monodromy`, `Reflection.Principle`, `Reflection.Arc`,
`Removability.Arc`, `Removability.Circle`, `Morera`, `LocalDegree`; Mathlib `BranchLogRoot`,
`BoundedVariation`; Layer 0.

## Layer 5: Jordan domains and the boundary index

### 5.1 The closed-disc homeomorphism of a chosen map

Prove `chosen_map_closed_disc_homeomorphism`: for `Ω` a Jordan domain and a holomorphic bijection
`f` of `ball c r`, `0 < r`, onto `Ω`, there is `F` continuous on `closedBall c r`, equal to `f`
on the open disc, which is a homeomorphism of `closedBall c r` onto `closure Ω` (Pommerenke,
*Boundary Behaviour of Conformal Maps*, Thm 2.6). Route: the extension provider applied to this
`f`, then `TauCeti.IsJordanDomain.injOn_closedBall_of_conformal` for injectivity on the closed
disc, then `TauCeti.closureHomeomorph` with `Metric.closure_ball`. The pinned existence theorem
chooses the map; this target keeps it. *Needs:*
`TauCeti.exists_continuousOn_closedBall_eqOn_of_isJordanCurve_frontier`,
`TauCeti.IsJordanDomain.injOn_closedBall_of_conformal`, `TauCeti.closureHomeomorph`,
`TauCeti.coe_closureHomeomorph_apply`, `Metric.closure_ball`.

- The inverse homeomorphism is `Function.invFunOn F (closedBall c r)`, and on `Ω` it is the
  holomorphic inverse of `f`.
- The restriction to the circle `sphere c r` is a homeomorphism onto `frontier Ω`, by
  `TauCeti.image_frontier_eq_frontier_image` with its hypotheses (open bounded `U`, `f`
  holomorphic and injective on `U`, `F` continuous on the closure and equal to `f` on `U`).
- A base-point normalization of `f` is preserved: the statement is about the given `f`.

**Checks.**
- `Ω = 𝔻`, `f = id`, `c = 0`, `r = 1`: `F = id`, the homeomorphism is the identity.
- `Ω = ball 0 2`, `f z = 2z`: `F z = 2z`, the circle goes to the circle of radius `2`.
- Non-example: `Ω` the slit disc `𝔻 \ [0, 1)` is not a Jordan domain (its frontier is not a
  Jordan curve), and the Riemann map does not extend injectively to the closed disc: two
  boundary arcs are sent onto the slit; so the Jordan hypothesis is needed.

### 5.2 The converse correspondence and the half-plane form

Collect the converse and transport statements as consumers of the pin. Converse: a bounded open
`U` carried by a holomorphic `f` onto a Jordan domain, `f` extending continuously and injectively
to `closure U`, is a Jordan domain (`TauCeti.isJordanDomain_of_isJordanCurve_frontier_image`,
hypotheses: `U` open and bounded, `f` holomorphic on `U`, `F` continuous on `closure U`, `F = f`
on `U`, `F` injective on `closure U`, `f '' U` connected with Jordan frontier), with the disc
case `TauCeti.isJordanDomain_of_image_eq_ball`. Half-plane form: for a Jordan domain and a
frontier point `p`, a conformal map of the upper half-plane with continuous injective extension
to the closed half-plane tending to `p` at infinity
(`TauCeti.exists_continuousOn_bijOn_upperHalfPlaneSet_of_isJordanCurve_frontier`). Prove the
chosen-map version of the half-plane form by composing §5.1 with the rotated Cayley map, as the
pinned `TauCeti.exists_continuousOn_bijOn_upperHalfPlaneSet_of_injOn_closedBall` does for a map
given on the closed disc. *Needs:* §5.1, the two pinned theorems named.

- The compactified real line `ℝ ∪ {∞}` corresponds homeomorphically to `frontier Ω`, with `∞ ↦ p`.

**Checks.**
- `U = 𝔻`, `f = id`: the converse returns the disc.
- `U = 𝔻`, `f z = z²`: `F` is not injective on the closure; the hypothesis fails, and indeed
  nothing is concluded, although `U` is a Jordan domain anyway.
- The half-plane form on `Ω = 𝔻` with `p = 1`: the Cayley map `z ↦ (z − i)/(z + i)` tends to
  `1` at infinity, so no rotation is needed; with `p = −1` the rotation by `−1` is composed,
  giving `z ↦ (i − z)/(z + i)`, which tends to `−1`.

### 5.3 The Jordan curve theorem

Prove `jordan_separation`: for every Jordan curve `C ⊆ ℂ`, with no smoothness, polygonality or
locally straight point assumed, `ℂ \ C` has exactly two connected components, one bounded and
one unbounded; the bounded one is `filledHull C \ C`, open and connected; both have frontier `C`
(Thomassen, Theorem 2.12, p. 122). Route: the two-component statement on the sphere
is the pinned `TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two`
(`TauCeti.AlgebraicTopology.Singular.JordanBrouwer`) for an embedded circle in `S²`; transport it
to the plane through the one-point compactification, where the component of `∞` is the unbounded
one; identify the bounded component with `filledHull C \ C` by the definition of the filled hull;
then `TauCeti.IsJordanCurve.frontier_connectedComponentIn` gives both frontiers once two points
in distinct components are known. The pinned locally straight results are partial cases of this
theorem and are not used by it. *Needs:*
`TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two`, Mathlib `OnePoint ℂ` and its
homeomorphism with the sphere, `TauCeti.IsJordanCurve.frontier_connectedComponentIn`,
`TauCeti.filledHull`, `TauCeti.isBounded_filledHull`,
`TauCeti.connectedComponentIn_compl_eq_of_unbounded_component`.

- `filledHull C \ C` is a Jordan domain (`TauCeti.IsJordanDomain`) with frontier `C`, hence
  simply connected.
- `filledHull C` is compact, contained in the closed convex hull of `C`, and contains every
  bounded set whose frontier lies in `C`.
- The unbounded component is the complement of `filledHull C`.

**Checks.**
- `C` the unit circle: the components are `ball 0 1` and `{|z| > 1}`, `filledHull C` is the
  closed disc, both frontiers the circle.
- `C` the boundary of the square `[0, 1]²`: the inside is the open square; the pinned locally
  straight theorem already gives this case, and §5.3 agrees with it.
- `C` the Koch snowflake: nonrectifiable, no straight piece; the theorem applies, and no
  regularity is used; a proof that needed a straight piece would not cover it.
- Non-example: a segment is not a Jordan curve; its complement is connected, one component, so
  the hypothesis is necessary.
- Non-example: a figure eight is not a Jordan curve; its complement has three components.

### 5.4 The topological index of a continuous closed loop

Define `continuousIndex`, for a continuous `γ : ℝ → ℂ` on `[a, b]`, `a ≤ b`, with
`γ a = γ b` and `w` off
`γ '' [a, b]`, the index of `γ` about `w` as the integer `(θ(b) − θ(a))/(2π)`, where `θ` is a
continuous real argument of `γ t − w` on `[a, b]`, which exists by
`TauCeti.Contour.exists_continuousOn_arg_lift_with_partition`; prove that the difference is an
integer multiple of `2π` (since `γ a = γ b`) and independent of the lift. Set the total
function to `0` when these domain conditions fail
or no integer increment exists (two lifts on the valid domain differ by a
constant multiple of `2π` on the connected interval). Equivalently, normalize `(γ t − w)/|γ t − w|`
to `Circle`, read it in `AddCircle (2π)` through `AddCircle.homeomorphCircle'`, and lift through
the covering `ℝ → AddCircle (2π)` with `IsCoveringMap.liftPath`; prove the two descriptions
agree. Do not evaluate `TauCeti.Contour.windingNumber` on a nonrectifiable loop and call that the
index. Build the covering and lifting adapters at the pinned library, shaped so that a future
Mathlib winding number of a continuous loop replaces them by an import. Prove the API:
transport along increasing affine changes of parameter and along `Path`s on the unit interval;
independence of the base point of the lift; homotopy invariance for homotopies of closed loops
avoiding `w`; additivity under concatenation; sign reversal under reversal; local constancy in `w`
off the trace; vanishing on the unbounded component of the complement of the trace; and the
value `+1` for the counterclockwise circle about a point inside it (Burckel, Ch. IV, the index of
a closed curve). *Needs:* `TauCeti.Contour.exists_continuousOn_arg_lift_with_partition`,
Mathlib `IsCoveringMap.liftPath`, `IsCoveringMap.eq_liftPath_iff`, `AddCircle.isCoveringMap_coe`,
`AddCircle.homeomorphCircle'`, `Circle.exp`.

- The index is an integer-valued function of `(γ, w)` on its domain of definition.
- Homotopy invariance: two loops avoiding `w` and homotopic through loops avoiding `w` have the
  same index; in particular the pointwise proximity criterion of §5.5.
- Local constancy: the index is constant on each connected component of `ℂ \ γ '' [a, b]` and
  zero on the unbounded one (far from the trace the argument of `γ t − w` varies by less than `π`).
- Reparametrization: an increasing homeomorphism of `[a, b]` onto `[a', b']` preserves the
  index; a decreasing one negates it.

**Checks.**
- The counterclockwise unit circle `t ↦ exp(2πit)` on `[0, 1]` about `0`: the argument lift is
  `2πt`, index `1`; a definition dividing by `π` instead of `2π` gets `2`.
- The same circle about `3`: index `0`, the point is in the unbounded component.
- The reversed circle `t ↦ exp(−2πit)` about `0`: index `−1`; a definition taking the absolute
  value of the increment gets `1` and fails sign reversal.
- The circle traversed twice `t ↦ exp(4πit)` on `[0, 1]`: index `2` about `0`.
- The constant loop: index `0` about every other point, including on `[a,a]`, since the lift
  increment is `0`. If `w` is on the trace, or `a > b`, the total function is `0` by its guard;
  this fallback is not an index theorem about those inputs.
- A nonrectifiable Jordan parametrization of the Koch snowflake about an interior point: the
  index is defined and equals `±1` by §5.6, while `TauCeti.Contour.windingNumber` is undefined
  there; a definition through the integral has no value to compare.

### 5.5 Comparison with the integral winding number and proximity invariance

Prove that for a closed piecewise-`C¹` loop `γ` on `[a, b]`, `a ≤ b`, and `w` off its trace,
the index of
§5.4 cast to `ℂ` equals `TauCeti.Contour.windingNumber γ a b w`: the argument lift `θ` satisfies
`θ′ = Im(γ′/(γ − w))` off the breakpoints, so `θ(b) − θ(a) = Im ∫ γ′/(γ − w)`, and the real part
of the integral vanishes since `log|γ − w|` returns to its value (Ahlfors, Ch. 4 §2.1,
Lemma 1 and the index definition, pp. 114–116). Prove the pointwise proximity
criterion for continuous closed loops: if `dist(δ t, γ t) < dist(γ t, w)` for all `t`, then the
indices of `δ` and `γ` about `w` agree (the continuous analogue of
`TauCeti.Contour.windingNumber_eq_of_dist_lt_dist`), by the straight-line homotopy `s ↦ (1 − s)γ + sδ`, which
avoids `w`. Give the equivalent smooth-approximation construction of the index: a continuous loop
avoiding `w` has positive distance `ρ` from `w`; a smooth approximant within `ρ/3` with the same
endpoints exists; its integral winding number is an integer, independent of the approximant by
the pinned proximity theorem, and equal to the argument-lift index by subdividing into local
argument charts; an avoiding homotopy, being compact, gives one positive distance and a finite
chain of time slices, which proves invariance without differentiability of the intermediate
loops. *Needs:* §5.4, `TauCeti.Contour.windingNumber_eq_of_dist_lt_dist`,
`TauCeti.Contour.exists_int_windingNumber_of_closed`,
`TauCeti.Contour.exists_contDiff_eq_endpoints_dist_lt`, `TauCeti.Contour.IsPiecewiseC1On`.

- For piecewise-`C¹` loops the index is the pinned winding number, so every pinned winding-number
  theorem transfers.
- The comparison for absolutely continuous loops is DifferentialGeometry 5.6.1's statement, a
  consumer of this section, and is not needed here.

**Checks.**
- The unit circle: the integral `(2πi)⁻¹ ∮ dz/z = 1` agrees with the index `1`.
- The square with vertices `±1 ± i` traversed counterclockwise about `0`: both values are `1`;
  the integral is a sum of four logarithms, each with imaginary part `π/2`.
- The proximity criterion with `γ` the unit circle, `δ t = γ t + (1/2)exp(6πit)` (a small loop
  riding on the circle) about `0`: `dist(δ, γ) = 1/2 < 1 = dist(γ, 0)`, so `δ` has index `1`,
  although `δ` winds three times about the moving centre; a criterion comparing `dist(δ t, w)`
  instead would be the wrong hypothesis.
- Non-example: `δ t = 3γ t` is not within `dist(γ t, 0) = 1` of `γ t`, the hypothesis fails;
  here the indices happen to agree, which shows the criterion is sufficient, not necessary.

### 5.6 The Jordan index theorem

Prove `continuous_jordan_index`: for every Jordan parametrization, a homeomorphism `γ : Circle → C` onto a Jordan curve
`C`, read as a loop on `[0, 1]`, there is one sign `σ ∈ {1, −1}` such that the index of `γ` is
`σ` at every point of `filledHull C \ C` and `0` on the unbounded component. The sign depends on
the parametrization and is a conclusion. The route combines Thomassen, Theorem 2.12,
p. 122, with Ahlfors, Ch. 4 §5.2, Theorem 18, pp. 152–153, on interior circles and the
continuous-index comparison of §5.5: §5.3 gives the bounded Jordan domain `Ω` with
frontier `C`; `TauCeti.IsJordanDomain.isSimplyConnected` and Layer 3 give a holomorphic bijection
`F` of the disc onto `Ω`, and §5.1 its closed-disc homeomorphism, whose boundary circle
parametrizes `C`. For `w ∈ Ω` with unique preimage `ζ₀`, apply Layer 0's analytic argument
principle to `F − w` on the circle of radius `r < 1` containing `ζ₀`: injectivity gives
multiplicity one, so the index of `F ∘ (circle of radius r)` about `w` is `+1`; uniform
continuity of `F` on the closed disc and the positive distance of `w` from `C` make these loops
within the proximity criterion of the boundary loop for `r` near `1`, so the boundary
parametrization has index `+1` at `w`. Relate an arbitrary `γ` to this boundary parametrization
by a homeomorphism of the circle: prove that a circle homeomorphism lifts to a strictly monotone
real map with period increment `+2π` or `−2π`, hence has degree `+1` or `−1`, and that
precomposition multiplies the index by that degree; do not infer the degree from an arbitrary
continuous self-map of the circle. Local constancy and vanishing on the unbounded component
(§5.4) give the exterior value. The route uses the analytic argument principle on interior
circles only, never a boundary line integral or an area identity. The piecewise-`C¹` case is
`jordan_index_of_isPiecewiseC1On`: for `γ` piecewise `C¹` on `[a, b]`, `a < b`, closed and
injective on `[a, b)`, the trace is a Jordan curve and `TauCeti.Contour.windingNumber γ a b` is
`σ` on `filledHull C \ C` and `0` off `filledHull C`. *Needs:* §§5.1, 5.3, 5.4, 5.5, Layer 3,
`TauCeti.argumentPrinciple_windingNumber_of_analyticOnNhd`,
`TauCeti.Contour.windingNumber_circleMap_eq_one_of_dist_lt`, Mathlib
`IsCoveringMap.liftPath` for the degree of a circle homeomorphism.

- `σ` is `+1` iff the lift of `γ` through the boundary correspondence is increasing: the
  positively oriented parametrization of `C`.
- Reversal of `γ` negates `σ`; precomposition with a circle homeomorphism of degree `d` multiplies
  `σ` by `d`.
- The boundary loop of the closed-disc homeomorphism of §5.1, `t ↦ F(exp(2πit))`, has `σ = +1`.

**Checks.**
- The counterclockwise unit circle: `σ = 1`, index `1` inside, `0` outside.
- The clockwise unit circle: `σ = −1`.
- The square `0, 1, 1 + i, i` traversed in this order: `σ = +1`; in the reverse order `σ = −1`;
  the pinned winding number agrees by §5.5.
- The Koch snowflake with any Jordan parametrization: `σ = ±1` at every interior point, with no
  rectifiability; a theorem that assumed piecewise smoothness would not cover it.
- Non-example: the figure eight `t ↦ sin(2πt) + i sin(4πt)` is not injective; its index about
  the centre of one lobe is `+1` and about the centre of the other `−1`, so one sign is false
  without the Jordan hypothesis.

### 5.7 The continuous-boundary argument principle

Prove `continuous_boundary_argument_principle`: for a Jordan domain `Ω`, `f` continuous on `closure Ω` and holomorphic on `Ω`, and `w`
outside `f '' frontier Ω`, the index of the loop `f ∘ β` about `w`, where `β` is a positively
oriented Jordan parametrization of `frontier Ω` (`σ = +1` in §5.6), equals the number of zeros
of `f − w` in `Ω` counted with analytic multiplicity. Nonvanishing of `f − w` on the compact
frontier and continuity confine the zeros to a compact subset of `Ω`, so they are finitely many
by §0.2 (`f − w` is not identically zero on `Ω`, having nonzero boundary values). Pull back by
the closed-disc homeomorphism `F` of §5.1: `g = (f − w) ∘ F` is continuous on the closed disc,
holomorphic on the open disc with finitely many zeros, and nonvanishing on the circle; apply
Layer 0 on interior circles of radius `r < 1` enclosing all zeros, transport multiplicities
through the conformal bijection (§0.2), and pass to the boundary by uniform continuity and the
proximity criterion of §5.5. The conclusion is an integer zero count on a continuous loop, not a
boundary line integral. This extends Ahlfors, Ch. 4 §5.2, Theorem 18, pp. 152–153,
by the interior-circle limit just specified, rather than assuming boundary differentiability.
*Needs:* §§0.2, 5.1, 5.4, 5.5, 5.6,
`TauCeti.argumentPrinciple_windingNumber_of_analyticOnNhd`.

- If `f` is injective on `Ω`, every value `w ∈ f '' Ω` off the image of the frontier has index
  `1`, and every `w` off `f '' closure Ω` has index `0`.
- The index of `f ∘ β` about `w` is nonnegative for every `w` off `f '' frontier Ω`.

**Checks.**
- `Ω = 𝔻`, `f z = z²`, `w = 0`: the image loop winds twice, two zeros with multiplicity, count `2`.
- `Ω = 𝔻`, `f z = z² − 1/4`, `w = 0`: zeros `±1/2`, count `2`; `w = 2`: no zeros, index `0`.
- `Ω = 𝔻`, `f z = z`, `w = 1`: `w` lies on `f '' frontier Ω`, excluded by hypothesis; the
  index is undefined there, and a statement without the exclusion is meaningless.
- `Ω` the square `(0, 1)²` and `f z = z − (1/2 + i/2)`, `w = 0`: one zero, index `1`, on a
  domain whose boundary is only piecewise smooth.

### 5.8 Darboux boundary injectivity

Prove `darboux_boundary_injectivity`: for a Jordan domain `Ω` and `f` continuous on `closure Ω`,
holomorphic on `Ω` and injective on `frontier Ω`, the image `f '' frontier Ω` is a Jordan curve,
`f` maps `Ω` bijectively onto the bounded complementary component `filledHull(f '' frontier Ω) \
f '' frontier Ω` of that curve, and `f` restricts to a homeomorphism of `closure Ω` onto the
closure of that component (Burckel, Ch. IX, the Darboux–Picard theorem). Route: the image curve
is Jordan by the compact-to-Hausdorff embedding of the circle. By §5.7 the index of `f ∘ β` about
`w` is a nonnegative zero count; by §5.6 applied to the Jordan parametrization `f ∘ β` of the
image curve, this index is one sign `σ` inside and `0` outside; nonnegativity forces `σ = +1`.
Hence `f − w` has exactly one zero in `Ω` for `w` inside and none for `w` outside. No interior
point maps onto the image curve: by the open mapping theorem the image of `Ω` is open, and by the
two-sided frontier property of §5.3 a neighbourhood of a point of the image curve contains
exterior points, which would have to be values, contradicting the count `0`. Thus interior and
boundary fibres are disjoint, `f` is injective on `closure Ω`, and the closure homeomorphism is
`TauCeti.closureHomeomorph`; the inverse on the open image is holomorphic by the open mapping
theorem. Distinguish the open image from its closure: the statement is about the bounded
component, and its closure is the image of `closure Ω`. *Needs:* §§5.3, 5.6, 5.7,
`TauCeti.closureHomeomorph`, `TauCeti.bijOn_closure_closure_image`,
`AnalyticOnNhd.is_constant_or_isOpenMap`.

- `f` is injective on `closure Ω`, and `f '' closure Ω = closure (f '' Ω)`.
- The inverse of `f` on the open image is holomorphic, and `f '' Ω` is a Jordan domain.
- Injectivity on the frontier is the only hypothesis on the boundary behaviour of `f`; no
  smoothness of `f` or of `frontier Ω` is assumed.

**Checks.**
- `Ω = 𝔻`, `f = id`: image curve the circle, bijection onto the disc.
- `Ω = 𝔻`, `f z = z + z²/4`: injective on the circle (`|f(z) − f(z')| ≥ |z − z'|(1 − 1/2) > 0`),
  so `f` is injective on the disc, the classical application.
- Non-example: `Ω = 𝔻`, `f z = z²`: not injective on the circle; the conclusion fails (`±1/2`
  have the same value), the negative control for the frontier hypothesis.
- Non-example: `Ω = 𝔻`, `f z = conj z`: injective on the circle, continuous, not holomorphic;
  its restriction to the disc is a bijection onto the disc, but orientation-reversing, which the
  route excludes at the sign step; the hypothesis `DifferentiableOn` is what makes `σ = +1`.
- `Ω` the square `(0, 1)²`, `f z = z²`: injective on the boundary of the square (the square lies
  in the closed first quadrant, where `z ↦ z²` is injective), so `f` maps the open square onto
  the inside of the image curve.

### 5.9 The Jordan-contour argument principle

Let `a < b`, let `γ` be closed and piecewise `C¹` on `[a, b]`, injective on `[a, b)`,
and put `C = γ '' [a, b]`. For an open `U` with `filledHull C ⊆ U`, finite `S` avoiding `C`,
and `f` analytic and nonvanishing on `U \ S` and meromorphic of integer order `ord s` at
`s ∈ S ∩ U`, prove
`∮_γ f′/f = 2πi σ Σ_{s ∈ S ∩ (filledHull C \ C)} ord s`, where `σ` is the sign of §5.6 for `γ`;
the positive-orientation specialization is `σ = 1` (Ahlfors, Ch. 4 §5.2, Theorem 18,
pp. 152–153, combined with §5.6). This follows from Layer 0's finite-`S`
argument principle, the component identification of §5.3, and the piecewise-`C¹` Jordan index
theorem (`jordan_index_of_isPiecewiseC1On`), which supplies the winding numbers `σ` inside and
`0` outside; `γ` is null-homologous in every open `U ⊇ filledHull C` since its winding number
vanishes off `filledHull C`. The sign and reversal laws are conclusions of §5.6, not hypotheses
of a Green or argument-principle theorem. *Needs:* §§0.1, 5.3, 5.6,
`TauCeti.Contour.argumentPrinciple_nullHomologous`.

- A zero or pole outside `filledHull C` contributes nothing.
- Reversing `γ` negates the integral.

**Checks.**
- The counterclockwise unit circle and `f z = z`: `2πi`, with `σ = 1`.
- The clockwise unit circle and `f z = z`: `−2πi`, with `σ = −1`.
- The counterclockwise circle of radius `1` about `3` and `f z = z`: `0`.
- The counterclockwise square with vertices `±1 ± i` and `f z = (z − 1/2)/(z + 3)`: `2πi`, the
  zero inside and the pole outside.

- With `U = ℂ`, the counterclockwise unit circle and `f z = 1/z`, `S = {0}`, both sides
  are `−2πi`. With `U = {1/2 < |z| < 2}` and `S = ∅`, the integral is still `−2πi` but the
  sum is `0`; `filledHull C ⊆ U` fails because `0 ∉ U`.
- At `a = b` a constant curve is injective on the empty `[a, b)` but its trace is a singleton,
  not Jordan; the strict interval guard excludes it.

### 5.10 Extension across analytic boundary arcs

Prove the analytic-boundary extension adapter: let `Ω` be a Jordan domain, `f : 𝔻 → Ω` a chosen
conformal bijection with closed-disc homeomorphism `F` (§5.1), `J₀` a relatively open arc of the
unit circle and `J₁` a regular real-analytic arc of `frontier Ω` (§4.1) with `F(J₀) = J₁`. Shrink
the target chart `d` of `J₁` so that its entire real locus is `frontier Ω ∩ d.source`, excluding
other boundary pieces, and prove one-sidedness: after a sign choice, `Ω ∩ d.source` is exactly the
positive side of the chart, by the component and frontier statements of §5.3 and connectedness.
This side selection is an owned adapter: mapping the arc into `ℝ` does not give it. Choose the
source chart of the circle arc with the same exact real-locus and interior-side clauses (for the
circle, `z ↦ −i log z` on a slit neighbourhood). The normalized map `d ∘ F ∘ e.symm` is continuous
on the closed positive side, holomorphic on the open side, maps into the target chart and is real
on the arc; §4.2 extends it holomorphically across `J₀`. Do the same for the inverse map with the
inverse boundary homeomorphism, and prove the two composition identities on the reflected
neighbourhoods by the identity theorem, since they hold on the interior side. Conclude that the
extension of `f` across `J₀` is locally injective with a local holomorphic inverse, and state the
agreement on the original closed side and the source and target reflection identities
(Ahlfors, Ch. 6 §1.4, Theorem 4, pp. 234–235, with the one-sidedness and inverse adapters
specified here). *Needs:*
§§4.1, 4.2, 5.1, 5.3.

- The extended map carries `J₀` onto `J₁` and reflects the exterior of the circle near `J₀` to
  the reflected side of `J₁`.
- Where `J₁` is a segment or a circular arc the charts are Möbius and the extension is the
  pinned line or circle reflection.

**Checks.**
- `Ω = 𝔻`, `f = id`, `J₀ = J₁` an arc of the circle: the extension is the identity.
- `Ω` the upper half-disc, `J₁` its open diameter `(−1, 1)`, `f` a Riemann map of the disc onto
  `Ω` and `J₀` the circle arc with `F(J₀) = J₁`: the target chart is the identity, the extended
  map carries the exterior of the circle near `J₀` into the lower half-disc, and the reflection
  identity is `F(e.symm(conj(e z))) = conj(F z)` with `e` the circle chart; the two corners `±1`
  of `Ω` lie outside `J₁`.
- Non-example: if `J₁` has a corner (a polygon vertex) inside it, it is not a regular analytic
  arc and the extension fails there: `z ↦ z^{3/2}` type behaviour, which is not holomorphic.

### Examples

For `Ω` the square `(0, 1)²` with a Riemann map `f`, §5.1 gives the homeomorphism of the closed
disc onto the closed square; §5.10 extends `f` across the four open circle arcs corresponding to
the sides; and §6.2 identifies `f` with an affine image of the Schwarz–Christoffel primitive with
exponents `−1/2` at four prevertices.

### Dependencies

Layers 0–4; Tau Ceti `Jordan.*`, `Caratheodory`, `BoundaryCorrespondence`, `PlaneSeparation.*`,
`FilledHull`, `AlgebraicTopology.Singular.JordanBrouwer`, `Contour.*`; Mathlib
`Topology/Homotopy/Lifting`, `Topology/Covering/AddCircle`, `OnePoint`; ContourIntegration
Layers 0–3.

## Layer 6: Schwarz–Christoffel theory for polygonal Jordan domains

### 6.1 Orientation, turning and sector data of a simple polygon

For `poly : Polygon ℂ n` with `poly.IsSimple ℝ` and `[NeZero n]` (so `3 ≤ n` by
`Polygon.IsSimple.three_le`), set `C := poly.boundary ℝ`, the union of the edges
`poly.edgeSet ℝ i` from `poly i` to `poly (finRotate n i)`, a Jordan curve by
`Polygon.IsSimple.isJordanCurve_boundary`, and `U := filledHull C \ C`. Prove that `U` is a
nonempty bounded Jordan domain with `frontier U = C`, through the locally straight point supplied
by a nondegenerate open edge (`TauCeti.exists_ball_openSegment_eq_line`,
`Polygon.IsSimple.exists_mem_nhds_inter_boundary_eq`) and
`TauCeti.IsJordanCurve.isJordanDomain_filledHull_sdiff_of_locally_eq_line`; §5.3 gives the same
conclusion without the straight piece. Derive injectivity of the vertex map from simplicity
(`Polygon.IsSimple.boundaryParamCircle_injective`). Define the edge vectors
`dᵢ = v_{finRotate n i} − vᵢ`, the midpoints `mᵢ`, and the orientation sign `σ ∈ {−1, 1}` by the
unique local choice at edge `0`: for all small `ε > 0`, `m₀ + σ·i·ε·d₀ ∈ U` and
`m₀ − σ·i·ε·d₀ ∉ closure U`; prove existence, uniqueness and propagation of the same sign to
every open edge (the two sides of each edge lie in different components, by §5.3 and the local
half-plane model, and the sign is locally constant along the boundary). Define the principal
signed turn `τᵢ = arg(dᵢ/d_{i−1}) ∈ (−π, π)` at vertex `i`, left turns positive; simplicity
excludes backtracking, so `τᵢ ≠ ±π`; a straight marked vertex has `τᵢ = 0`. Define the interior
angle `θᵢ = π − σ τᵢ` and the exponent `eᵢ = −σ τᵢ/π ∈ (−1, 1)`, including reflex vertices. Prove
the local models in the exact native form: every nonvertex frontier point has a local open
half-plane model `z ∈ U ↔ Im((z − q)/b) > 0` on a ball, and at each vertex there are `ρ > 0`,
`bᵢ ≠ 0` with `z ∈ U ↔ |arg((z − vᵢ)/bᵢ)| < (eᵢ + 1)π/2` for `z ∈ ball vᵢ ρ`, `z ≠ vᵢ`. The
two-edge neighbourhood gives the boundary shape; a separate interior-side argument, using `σ`,
selects the sector belonging to `U`, including openings larger than `π`; the side theorem alone
does not give corner geometry (Driscoll–Trefethen, §2.1, pp. 9–10, for the angle convention;
the local side selection uses §5.3). *Needs:* `Polygon.IsSimple` and its API, §5.3,
`TauCeti.IsJordanCurve.isJordanDomain_filledHull_sdiff_of_locally_eq_line`,
`TauCeti.exists_ball_openSegment_eq_line`, Mathlib `Complex.arg`.

- `σ` is a conclusion from the polygon, never an input; both vertex orders are handled.
- `Σᵢ τᵢ = 2πσ`, derived from the exponent sum `Σ eᵢ = −2` of §6.2 and `eᵢ = −σ τᵢ/π`, not
  presupposed.
- The sector model at a vertex has `bᵢ` a unit vector along the interior bisector and opening
  `θᵢ = (eᵢ + 1)π`.

**Checks.**
- The square `0, 1, 1 + i, i`: `d₀ = 1`, `m₀ = 1/2`, and `1/2 + iε ∈ U`, so `σ = +1`; all
  `τᵢ = π/2`, `θᵢ = π/2`, `eᵢ = −1/2`, `Σ eᵢ = −2`, `Σ τᵢ = 2π`.
- The same square in the order `0, i, 1 + i, 1`: `σ = −1`, `τᵢ = −π/2`, and again `eᵢ = −1/2`;
  a definition of `eᵢ` without the factor `σ` would give `+1/2` and `Σ eᵢ = +2`, which is wrong.
- The L-shaped hexagon `0, 2, 2 + i, 1 + i, 1 + 2i, 2i`: five turns `π/2` and one turn `−π/2`
  at `1 + i`, `σ = +1`, exponents five times `−1/2` and once `+1/2` at the reflex vertex, sum
  `−2`; the sector at `1 + i` has opening `3π/2`, which a half-plane model cannot express.
- A triangle with a straight marked vertex, `0, 1, 2, 1 + i`: `τ = 0` at `1`, `e = 0` there, the
  remaining exponents sum to `−2`.
- Non-example: the self-intersecting bow-tie `0, 1 + i, 1, i` is not simple; `Polygon.IsSimple`
  fails and no sign exists (the "inside" changes orientation between the two lobes).

### 6.2 Existence, necessity and uniqueness for bounded polygons

Apply the pinned existence theorem to the data of §6.1: there are distinct real prevertices
`a : Fin n → ℝ`, `A ≠ 0` and `B` with `z ↦ A·F(z) + B` a bijection of the upper half-plane onto
`U` sending the vertex at `aᵢ` to `vᵢ`, where `F = schwarzChristoffelPrimitive a e z₀`, and
`Σ eᵢ = −2` (Ahlfors, Ch. 6 §2.2). Every existence theorem solves for the prevertices from the
target polygon: a chosen tuple of distinct prevertices is not by itself a univalence theorem.
Necessity: a conformal bijection `f` of the half-plane onto `U`, continuous and injective on the
closed half-plane with vertex values at the prevertices and a limit `p ∉ f '' {Im z ≥ 0}` at
infinity, equals `f′(z₀)/F′(z₀)·F + f(z₀)` on the half-plane, with the pre-Schwarzian identity
`f″/f′ = Σᵢ eᵢ/(z − aᵢ)`; the limit point is therefore a nonvertex side point, and this
normalization does not cover infinity at a vertex, which is §6.3. Uniqueness: the residual source
freedom is `PSL(2, ℝ)`, the orientation-preserving real Möbius maps, not `PGL(2, ℝ)`; three
matched prevertices fix it, and the cross-ratio and affine-output uniqueness statements hold with
matched vertices. Affine covariance: record how the base point and the output similarity
`w ↦ Aw + B` change the constants. *Needs:* §6.1, the pinned theorems of
`SchwarzChristoffel.JordanPolygon`, `SchwarzChristoffel.PolygonalDomain`,
`SchwarzChristoffel.Uniqueness`, `SchwarzChristoffel.PrevertexUniqueness`,
`SchwarzChristoffel.AffineCovariance`.

- The interior angle sum is `(n − 2)π`, equivalently `Σ eᵢ = −2`.
- Two Riemann maps of the half-plane onto `U` differ by an element of `PSL(2, ℝ)`, and agree once
  three prevertices match.

**Checks.**
- The square: exponents `−1/2` four times, sum `−2`; the prevertices `±1, ±(3 + 2√2)`
  give a square. In the Jacobi form `∫ dz/√((1 − z²)(1 − k²z²))`, adjacent side lengths are
  proportional to `2K(k)` and `K(√(1 − k²))`, where `K(k) = ∫₀^{π/2}(1 − k² sin² t)^{−1/2} dt`.
  For `k = 3 − 2√2`, both lengths are approximately `3.16510345445`, ratio `1`; the square
  condition is `2K(k) = K(√(1 − k²))` (Ahlfors, Ch. 6 §2.3, pp. 238–240, after a real Möbius
  change of prevertices). Explicitly, with `L = 3 + 2√2` and `d = 1 + √2`,
  `T(x) = (Lx − d)/(x + d)` carries `−1, 0, 1, ∞` to `−L, −1, 1, L`, respectively;
  its determinant `d(L + 1)` is positive. The negative control `±1, ±√2` has `k = 1/√2`, with lengths
  `3.70814935460` and `1.85407467730`, ratio `2`, although `K = K′`. Output similarity preserves
  that ratio; prevertices must be solved from the polygon.
- The equilateral triangle: exponents `−2/3` three times, sum `−2`; the map
  `∫ (z − a₁)^{−2/3}(z − a₂)^{−2/3}(z − a₃)^{−2/3}` with three matched prevertices is unique.
- A prevertex tuple containing `∞`, such as `−1, 0, 1, ∞`, is outside this normalization and is
  §6.3.
- `PGL(2, ℝ) \ PSL(2, ℝ)` contains `z ↦ −z`, which maps the upper half-plane to the lower one
  and is excluded; a uniqueness statement over `PGL(2, ℝ)` would be false.

### 6.3 Source infinity at a finite vertex

Prove `eqOn_const_mul_schwarzChristoffelPrimitive_add_of_source_infinity_at_vertex`: with the
polygon data of §6.1 and a marked vertex `k`, let `f` be holomorphic on the half-plane,
continuous and injective on the closed half-plane, with image `U`, vertex values `f(aᵢ) = vᵢ` at
distinct real prevertices `a : {i // i ≠ k} → ℝ`, and `f → vₖ` at infinity in the closed
half-plane with `vₖ ∉ f '' {Im z ≥ 0}`. Then on the half-plane
`f = f′(z₀)/Fₖ′(z₀)·Fₖ + f(z₀)` with `Fₖ = schwarzChristoffelPrimitive a (e ∘ val) z₀`, and
`Σ_{i ≠ k} eᵢ = −2 − eₖ` (Driscoll–Trefethen, *Schwarz–Christoffel Mapping*, Theorem 2.1,
p. 10, equation (2.2)). Derive, by differentiating the product and integrating its tail,
`z f″(z)/f′(z) → −2 − eₖ` at infinity, the tail
asymptotics `f′(z) = O(z^{−2−eₖ})`, hence `f(z) − vₖ = O(z^{−1−eₖ})` since `eₖ > −1`, and that
the compactified closed half-plane `insert ∞ (coe '' {Im z ≥ 0}) ⊆ OnePoint ℂ` is carried
homeomorphically onto `closure U` with `∞ ↦ vₖ`, by §5.1 through the Cayley map extended by
`∞ ↦ 1`. Necessity route: choose a finite nonprevertex `b` and the Möbius map
`ψ(w) = b − c/(w − r)`, `c > 0`, `r` real and not a prevertex, so that `ψ(∞) = b`, `ψ(r) = ∞`;
set `g := Function.update (f ∘ ψ) r vₖ` on the closed half-plane and prove its continuity and
injectivity at `r` from the source-infinity limit of `f` (the rational formula at its pole is not
the extension). Then `g` has all `n` vertices at finite prevertices, its limit at infinity `f(b)`
is a nonvertex side point outside its closed-half-plane image, and the pinned all-finite
necessity theorem applies; transport back by the chain rule and product identity with logarithm
branches and reindexing to `{i // i ≠ k}`, the full sum `Σ eᵢ = −2` cancelling the Möbius
denominator and leaving the omitted factor. Existence: apply the pinned bounded existence theorem,
the boundary homeomorphism of §5.1 and the inverse source reparametrization sending the selected
vertex to source infinity; the prevertices are solved from the polygon. The formula-level provider
with limit `L = −2 − eₖ` can be used once the finite side and corner conditions and the limit are
derived. Uniqueness: source infinity is fixed, so the residual freedom is the positive affine
group `z ↦ αz + β`, `α > 0`, `β ∈ ℝ`, and two matched finite prevertices fix it. *Needs:* §§5.1,
6.1, 6.2, `TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_domain`,
`TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_boundary`,
`TauCeti.exponent_sum_eq_of_logDeriv_deriv_eqOn`,
`TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier`,
Mathlib `OnePoint`.

- The finite endpoint is part of the conclusion: `Fₖ(∞)` exists (the restricted exponent sum is
  `< −1`, by `TauCeti.tendsto_schwarzChristoffelPrimitive_atInfinity`) and
  `B = vₖ − A·Fₖ(∞)`, equivalently `B = f(z₀)` and `f(z₀) + A·Fₖ(∞) = vₖ`.
- This is a finite target vertex at source infinity, distinct from the unbounded target ends of
  §§6.5–6.6.
- The hypothesis `vₖ ∉ f '' {Im z ≥ 0}` is the injectivity of the compactified boundary
  correspondence at `∞`; it is stated explicitly, in the shape of the pinned necessity theorem.

**Checks.**
- The square with one vertex `k` at source infinity and prevertices `−1, 0, 1` for the other
  three: exponents `−1/2` three times, restricted sum `−3/2 = −2 − (−1/2)`; the primitive
  `∫ (z + 1)^{−1/2} z^{−1/2} (z − 1)^{−1/2}` maps the half-plane onto a rectangle, which is a
  square because `z ↦ (z − 1)/(z + 1)` cyclically permutes the four prevertices
  `−1 → ∞ → 1 → 0 → −1` and carries the differential to a constant of modulus `1` times
  itself, so adjacent sides have equal length; the half-turn `z ↦ −1/z` alone would not suffice.
- The equilateral triangle with one vertex at infinity: `∫ (z − a₁)^{−2/3}(z − a₂)^{−2/3}`,
  restricted sum `−4/3 = −2 − (−2/3)`, tail `f′ = O(z^{−4/3})`, `f − vₖ = O(z^{−1/3})`.
- `z f″/f′ → −3/2` for the square: the pre-Schwarzian `Σ_{i≠k} eᵢ/(z − aᵢ)` times `z` tends to
  the restricted sum; a formula keeping the factor `(z − aₖ)^{eₖ}` would give `−2`, which is the
  all-finite value and is wrong here.
- Non-example: a bounded polygon map whose limit at infinity is a side point is §6.2, with
  `L = −2`; the restricted-sum formula does not apply to it, and the two normalizations are
  distinguished by whether the limit is a vertex.

### 6.4 The disc formula

For any distinct `wᵢ ∈ ∂𝔻`, the disc primitive
`TauCeti.schwarzChristoffelDiscPrimitive` has derivative `∏ᵢ (1 − ζ/wᵢ)^{eᵢ}`; each base
`1 − ζ/wᵢ` is in the right half-plane inside the disc, fixing the principal power.
For the prescribed bounded polygon `U`, prove that there exist such prevertices and constants
`A ≠ 0`, `B` for which the affine image of this primitive maps the disc conformally onto `U`:
choose the half-plane prevertices from §6.2 and transport them through Cayley. Arbitrary
circle data specify a derivative but do not prescribe the image polygon (Ahlfors, Ch. 6 §2.2,
pp. 236–238, equations (3)–(5); Driscoll–Trefethen, §1.1, pp. 3–4). Own the
adapter from `TauCeti.exists_bijOn_const_mul_schwarzChristoffelDiscPrimitive_add_with_infty_of_bijOn`
through the all-finite sum `Σ eᵢ = −2` and `TauCeti.schwarzChristoffelDiscPrimitive_option_zero`:
the auxiliary infinity prevertex carries exponent `0` in this normalization and its factor is
`1`. *Needs:* §6.2, the pinned disc theorems of `SchwarzChristoffel.Disc.Basic`.

- The disc and half-plane primitives are related by the Cayley map and an affine change.
- In the sector-end case (§6.5) the disc formula carries the extra boundary prevertex `1` with
  exponent `−β − 1`, so that the full disc exponent sum is `−2`.

**Checks.**
- The square with `wᵢ = iᵏ`: `∏ (1 − ζ/iᵏ)^{−1/2} = (1 − ζ⁴)^{−1/2}`, the classical disc map of
  the square.
- Cayley transport of `±1, ±(3 + 2√2)` gives side ratio `1`; transport of `±1, ±√2` gives
  ratio `2`, with the same exponents `−1/2`. Distinct circle prevertices alone do not give the
  prescribed square.
- `ζ = 0`: every factor is `1`, the derivative at the centre is `1` before normalization.
- Non-example: a prevertex `wᵢ` inside the disc makes `1 − ζ/wᵢ` vanish at `ζ = wᵢ`, so the
  hypothesis `|wᵢ| = 1` is needed for the principal power.

### 6.5 Polygons with a sector end

For `U` connected and open with `insert ∞ (frontier U)` a Jordan curve in `OnePoint ℂ`, distinct
finite vertices with local sectors of opening `(eᵢ + 1)π`, local half-plane models at other finite
boundary points, and the far-field sector condition `ρ < ‖z − c‖ → (z ∈ U ↔ |arg((z − c)/b)| <
βπ/2)` for some `ρ, c, b ≠ 0` and `β ∈ (0, 2)`, consume the pinned existence and necessity
theorems: the map is an affine image of the primitive and `Σ eᵢ = β − 1`
(`TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_insert_infty`,
`TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_unbounded_polygonal_domain`).
Use the power asymptotic from the supplier contract with `S + 1 = β > 0` to obtain escape
of `f` to infinity. Include the disc
normalization with the extra prevertex `1` of exponent `−β − 1`. *Needs:* the pinned sector-end
theorems, §6.1 for the finite vertex data.

- The exponent sum `β − 1` lies in `(−1, 1)`.
- The end of opening `2π` (`β = 2`) is excluded by the hypothesis `β < 2`.

**Checks.**
- The quadrant `{Re z > 0, Im z > 0}` with no finite vertex other than `0`: `β = 1/2`, `e₀ =
  −1/2`, sum `−1/2 = β − 1`, map `z ↦ √z` up to affine change.
- The half-plane itself: `β = 1`, no finite vertex, sum `0`, map affine.
- Non-example: the half-strip is not a sector end (`β = 0` is excluded) and is §6.6; applying the
  sector theorem to it is a hypothesis failure.

### 6.6 Polygons with a half-strip end

Treat the parallel-sided end separately, with the far-field condition
`ρ < ‖z − c‖ → (z ∈ U ↔ 0 < Re((z − c)/b) ∧ Im((z − c)/b) ∈ (0, π))`, `b ≠ 0`, the spherical
Jordan frontier, finite vertices and local models as in §6.5. Consume the pinned existence and
necessity theorems with `Σ eᵢ = −1`
(`TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_of_halfStrip`,
`TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_halfStrip_polygonal_domain`).
Use the logarithmic limit in the supplier contract to obtain escape at infinity.
*Needs:* the pinned half-strip theorems, §6.1.

- The half-strip normalization is distinct from the sector normalization: `Σ eᵢ = −1` and
  logarithmic growth.

**Checks.**
- The half-strip `{Re z > 0, 0 < Im z < π}`: two finite vertices `0`, `iπ` with exponents
  `−1/2`, sum `−1`, map `z ↦ log(...)` type, namely the inverse of `cosh`.
- Non-example: the full strip has two ends and is outside both unbounded cases.

### 6.7 Source normalization for unbounded polygons

For two holomorphic bijections `f, g : ℍ → U` onto the same open domain, first compare them
without any boundedness assumption: `g⁻¹ ∘ f : ℍ → ℍ` has holomorphic inverse `f⁻¹ ∘ g`.
Conjugate by Cayley and apply the disc automorphism classification to obtain a real Möbius
map with positive determinant (Ahlfors, Ch. 3 §3.4, pp. 83–84; the classification provider below).
For the maps of §§6.5–6.6, use their continuous finite-boundary extensions and their prescribed
escape at infinity to show this Möbius map fixes infinity: otherwise its value at infinity is a
finite real point `r`, and `f = g ∘ (g⁻¹ ∘ f)` would tend to the finite boundary value `g(r)`.
Its denominator coefficient is therefore zero, so it has the form `z ↦ αz + β`, `α > 0`,
`β ∈ ℝ`. Two distinct matched finite prevertices force `α = 1`, `β = 0`; with fewer marks,
fixing an interior source point instead gives the same conclusion by its imaginary and real
parts. This owns the unbounded comparison and stabilizer argument; its inputs are the inverse
and classification contracts, not the bounded prevertex theorem. *Needs:* §§6.5, 6.6,
`DifferentiableOn.invFunOn` (`Inverse.Function`),
`TauCeti.exists_forall_unitDisc_eq_unitDiscStandardAutomorphismEquiv`
(`UnitDisc.Automorphism.Classification`), the Cayley bijections and derivatives in Layer 2's
supplier contract.

- The finite-index core indexed by `Fin n` is an adapter to the `Fintype` statements of the pin.

**Checks.**
- The quadrant with the single finite vertex `0` and prevertex `0`: the stabilizer is `z ↦ αz`,
  fixed by a base point `i ↦ i`: imaginary parts give `α = 1`.
- The half-strip with prevertices `−1`, `1`: `−α + β = −1` and `α + β = 1`, so
  `α = 1`, `β = 0`, and the automorphism is the identity.
- Non-example: a Möbius map not fixing infinity, such as `z ↦ −1/z`, is excluded by the end
  behaviour; it would move the unbounded end to a finite point.

### Examples

The unit square: §6.1 gives `σ = +1`, exponents `−1/2`; §6.2 gives the prevertices `±1, ±(3 + 2√2)`,
unique up to `PSL(2, ℝ)`; §6.3 with one vertex at source infinity gives the three-factor
elliptic integral with prevertices `−1, 0, 1`; §6.4 gives the disc map with derivative
`(1 − ζ⁴)^{−1/2}`.

### Dependencies

Layers 2, 3, 5; Tau Ceti `SchwarzChristoffel.*`, `Geometry.Polygon.Simple`; Mathlib `Polygon`,
`OnePoint`, `Complex.arg`.

## Downstream consumers

- DifferentialGeometry, 5.6.1, consumes §5.3 (components and filled hull) and §5.5, and extends
  the winding-number comparison to absolutely continuous curves.
- GeometricMeasureTheory, G6, consumes §5.3 for the Jordan index theorem of an arclength
  parametrization, where it adds the outward normal and the perimeter comparison; Isoperimetry,
  I6, consumes §5.3 for the two-component theorem.
- GlobalHolomorphicFunctions restates §1.1 on its carrier `H(U)` in GH0 and consumes §5.3 in GH4
  for single-Jordan separation.
- ConformalMappingPartII consumes Layer 2 (the Schwarz lemma and Cayley coordinate) for its
  conformal radius and covering theory.
- ModularForms is the natural consumer of Layers 4–5 for modular and elliptic uniformization;
  HeegaardFloer can consume §4.2 for Cauchy–Riemann boundary conditions; PDE and the several
  complex variables and special-function roadmaps consume the conformal mapping and boundary
  layers.

## References

- L. V. Ahlfors, *Complex Analysis*, 3rd ed., McGraw–Hill, 1979: Ch. 4 §3.4 (the Schwarz lemma),
  Ch. 4 §6.5 (reflection), Ch. 6 §1 (the Riemann mapping theorem), Ch. 6 §2.2
  (Schwarz–Christoffel), Ch. 8 §1.6 (monodromy).
- L. V. Ahlfors, *Conformal Invariants*, McGraw–Hill, 1973, Ch. 1 (the Poincaré metric,
  Schwarz–Pick).
- A. S. Besicovitch, *On Sufficient Conditions for a Function to be Analytic, and on Behaviour
  of Analytic Functions in the Neighbourhood of Non-Isolated Singular Points*, Proc. London
  Math. Soc. (2) 32 (1931), 1–9, DOI 10.1112/plms/s2-32.1.1 (finite-length removability).
- R. B. Burckel, *An Introduction to Classical Complex Analysis I*, Birkhäuser, 1979, Ch. IV
  (the index), Ch. IX (the Darboux–Picard theorem).
- J. B. Conway, *Functions of One Complex Variable I*, 2nd ed., Springer, 1978: IV.7 (open
  mapping), V.3 (argument principle, Rouché), VI.2 (Schwarz's lemma), VII.2 (Hurwitz, Montel),
  VII.4 (Riemann mapping), IX.1 (reflection).
- T. A. Driscoll and L. N. Trefethen, *Schwarz–Christoffel Mapping*, Cambridge, 2002, Ch. 2.
- Ch. Pommerenke, *Boundary Behaviour of Conformal Maps*, Springer, 1992, Thm 2.6
  (Carathéodory).
- R. Remmert, *Classical Topics in Complex Function Theory*, Springer, 1998, Ch. 7 (Montel,
  Vitali).
- C. Thomassen, The Jordan–Schönflies theorem and the classification of surfaces, Amer. Math.
  Monthly 99 (1992), 116–130, Theorem 2.12, p. 122 (the Jordan curve theorem).
- L. C. Paulson, Isabelle/HOL, *Riemann_Mapping*, theorem Riemann_mapping_theorem
  (the theorem's formalizability).
