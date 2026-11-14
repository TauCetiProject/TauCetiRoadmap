# Roadmap: quasiregular maps

**Summary.** Build quasiregular maps between oriented Riemannian manifolds of one dimension `n`
on the Sobolev class `W^{1,n}_loc(M, N)` of SobolevMapsBetweenManifolds. The construction runs from
the linear algebra of distortion (minimal stretch, outer, inner and Hilbert–Schmidt distortion of
a linear map) to the class of `K`-quasiregular maps `f : M → N`, defined by
`‖Df‖ⁿ ≤ K J_f` almost everywhere. Its invariants are the outer, inner, maximal and
Hilbert–Schmidt distortions. The roadmap proves their comparison inequalities and their
invariance under change of metric, reversal of orientation and composition with `C¹` factors.
It proves the `ACL^p` characterisation of continuous Sobolev maps on Euclidean domains, and
hence agreement with the classical definition of Martio, Rickman and Väisälä. It proves that
non-degenerate orientation-preserving simplicial maps between smoothly triangulated manifolds
with bounded simplexwise distortion, in particular with compact source, are quasiregular, and it
develops quasiregularly elliptic manifolds. The end theorems are:

- the sharp comparison `K_I(f) ≤ K_O(f)^{n−1}`, `K_O(f) ≤ K_I(f)^{n−1}`, so the outer and
  maximal definitions give one class of maps, between manifolds and, in the original setting of
  Martio, Rickman and Väisälä, on Euclidean domains;
- a continuous map of a Euclidean domain is `ACL^p` if and only if it lies in `W^{1,p}_loc`,
  so the definition here agrees with the classical one;
- a non-degenerate orientation-preserving simplicial map of `C¹`-triangulated manifolds with
  bounded simplexwise distortion, in particular one with closed source, is quasiregular, with its
  outer distortion computed simplex by simplex;
- quasiregular ellipticity of a closed connected orientable manifold is independent of the
  metric and the orientation;
- every closed orientable flat manifold is `1`-quasiregularly elliptic;
- a connected oriented Riemannian manifold that receives a non-degenerate orientation-preserving
  simplicial map from a flat torus is quasiregularly elliptic.

Reshetnyak's theorem, the composition of arbitrary quasiregular maps and the cohomological
constraints on quasiregularly elliptic manifolds of Bonk–Heinonen, Prywes and Heikkilä–Pankka
are the subjects of QuasiregularMaps, Part II and Part III, described under Downstream
consumers. Each of them consumes this roadmap.

## Scope and ownership

This roadmap owns:

- the minimal stretch `ℓ(A)` and the outer, inner and Hilbert–Schmidt distortion quotients of
  a linear map between oriented inner product spaces of equal dimension, with their comparison
  inequalities, equality cases and submultiplicativity;
- `K`-quasiregular and quasiregular maps between oriented Riemannian `n`-manifolds; the outer,
  inner, maximal and Hilbert–Schmidt distortions of a map; attainment of the outer distortion;
  the sign and integrability of the Jacobian of a quasiregular map; restriction and locality;
  constancy of maps with vanishing differential; the `C¹`, locally Lipschitz, Euclidean and
  planar descriptions of the class;
- invariance under uniformly comparable metrics, reversal of orientations, precomposition with
  `C¹` local diffeomorphisms of bounded distortion and postcomposition with `C¹` quasiregular
  maps;
- the formal derivative, `ACL` and `ACL^p` maps on Euclidean domains, the theorem
  `ACL^p = W^{1,p}_loc` for continuous maps, and the agreement with Definition 2.20 of
  Martio–Rickman–Väisälä;
- the measure-theoretic facts about `C¹` smooth triangulations of boundaryless manifolds that the
  Sobolev theory needs (local finiteness, purity, null lower skeleton, top simplices locally
  bi-Lipschitz in charts); simplicial maps between triangulated manifolds; the Lipschitz
  regularity of piecewise `C¹` maps; and the quasiregularity of non-degenerate
  orientation-preserving simplicial maps;
- quasiregularly elliptic and `K`-quasiregularly elliptic manifolds, their independence of the
  orientation and, for closed manifolds, of the metric; transfer along `C¹` local
  diffeomorphisms of bounded distortion; the orientation of the orbit space of a free, properly
  discontinuous action by orientation-preserving diffeomorphisms; flat examples; simplicial
  branched coverings by tori.

Already in Tau Ceti are the singular-value perturbation bound
`LinearMap.abs_singularValues_sub_singularValues_le`, scalar law
`LinearMap.singularValues_smul`, and isometric-equivalence laws
`LinearMap.singularValues_linearIsometryEquiv_comp` and
`LinearMap.singularValues_comp_linearIsometryEquiv`. Their specializations at index `n − 1`
supply the corresponding minimal-stretch laws in §1.1; this roadmap owns the minimum
characterisation and the distortion theory built from them.

It leaves to named roadmaps:

- **SobolevMapsBetweenManifolds** owns the continuous Sobolev class `W^{1,p}_loc(M, N)` with its
  chart independence (§4.2), its restriction, locality and metric independence (§4.5) and its
  `C¹` members (§4.4); the weak differential `Df` (§4.3) and the identification of chartwise and
  Riemannian null sets (§3.1); the measurable operator norm `‖Df‖` (§5.1) with its `L^p`
  characterisation (§5.2) and metric comparison (§5.3); the oriented Jacobian `J(A)` of a linear
  map (§6.1), the Jacobian `J_f` (§6.2) and Hadamard's inequality with the integrability of `J_f`
  (§6.3); the chain rules with `C¹` factors (§4.6, with null sets under `C¹` maps in §3.3); and
  the Euclidean class and compatibility (§1.2, §7.1). Everything here is stated on that class.
  The locally Lipschitz members of the class (§2.8) are owned here, because the supplier plans
  only `C¹` members. PseudoholomorphicCurveAnalysis §4.1 owns `W^{k,p}_loc(Σ, M)` for maps from
  a Riemann surface with `kp > 2`; it does not reach the borderline exponent `p = n = 2` that
  planar quasiregular maps need.
- **DifferentialGeometry** owns orientations and orientation-preserving maps (2.1–2.2), metrics
  on open submanifolds (12.1) and the Riemannian volume (12.4). Tau Ceti implements the parts used
  here. Chartwise null sets are already in Tau Ceti (`TauCeti.IsNullSet`) and are consumed from
  there. No roadmap plans the orientation of the quotient manifold of a general free, properly
  discontinuous action; it is owned here (§7.5). Orbifolds owns orientations of orbifold
  presentations, preserved by all arrows, and their descended coarse orientation local systems;
  §7.5 differs in producing a manifold orientation (`TauCeti.Manifold.Orientation`) of the
  orbit space itself, which is a manifold because the action is free.
- **RiemannianGeometry** R4 item 7 owns quotients of a Riemannian manifold by free properly
  discontinuous isometry groups, with the descended metric and covering projection, and the
  Killing–Hopf classification. Its orientability of `ℝPⁿ` is the antipodal case of §7.5 on the
  sphere; §7.5 is the general descent, for any free properly discontinuous action by
  orientation-preserving diffeomorphisms.
- **GeometricTopology** Layer 11 owns realizations of abstract simplicial complexes, simplicial
  maps and their realizations, and the compactness lemma for realizations (11.1), and the
  Cairns–Whitehead existence and uniqueness of smooth triangulations (11.3). §6.1 differs from
  11.3: it proves measure-theoretic and metric properties of one given `C¹` triangulation
  (local finiteness, purity, a null lower skeleton, locally bi-Lipschitz top simplices) by
  elementary arguments, without the combinatorial-manifold structure.
- **TeichmullerGeometry** §7.4 owns the weak Wirtinger derivatives, planar quasiconformal maps
  defined by the Beltrami equation, and the measurable Riemann mapping theorem; §2.10 here proves
  that its quasiconformal maps are quasiregular.
- **PDE** Layer 1 owns the Euclidean Sobolev spaces; they are consumed through Tau Ceti's
  `TauCeti.HasWeakFDerivOn` and `TauCeti.W1p`. Its §1.1 owns the one-dimensional
  identification of `W^{1,p}(a, b)` with the absolutely continuous functions whose derivative is
  in `L^p`. The theorem `ACL^p = W^{1,p}_loc` of §5.2 is the `n`-dimensional, local form along
  coordinate lines; it applies the one-dimensional statement on almost every line, through the
  Tau Ceti declarations that implement it.
- **QuasiregularMaps, Part II** owns Reshetnyak's theorem (continuity of `W^{1,n}_loc` solutions of
  the distortion inequality; non-constant quasiregular maps are open, discrete, sense-preserving,
  differentiable almost everywhere, satisfy Lusin's condition (N) and have `J_f > 0` almost
  everywhere), the composition of two arbitrary quasiregular maps, the transfer of ellipticity
  along a non-constant quasiregular map, the modulus of path families with the Poletsky and
  Väisälä inequalities, Liouville's theorem for `1`-quasiregular maps in dimension `n ≥ 3`, the
  higher integrability of the Jacobian, and Rickman's Picard theorem.
- **QuasiregularMaps, Part III** owns the cohomological constraints on closed quasiregularly
  elliptic manifolds: the Bonk–Heinonen bound, Prywes's binomial bound, the
  Heikkilä–Pankka embedding of the de Rham algebra into `⋀^* ℝⁿ`, and the non-ellipticity of
  `#^k (S² × S²)` for `k ≥ 4`.
- Mappings of finite distortion (IwaniecMartin2001, Ch. 6) lie outside this roadmap and its Parts
  II and III.

## Conventions

- **Dimension.** `n ≥ 1` for manifolds; a theorem that needs `n ≥ 2` says so. In dimension `0`
  the tangent spaces are zero, `‖A‖⁰ = 1` and `J(A) = ±1` according as the orientations at `x`
  and `f(x)` agree or not, so quasiregularity would only compare signs, and the convention
  excludes it. In dimension `1` the definitions make sense but Reshetnyak's theorem fails: `t ↦ max(0, t)` is
  `1`-quasiregular, non-constant and constant on a half-line (§2.1). The Euclidean definitions
  and theorems that `Suggested.lean` states (§1.1, §2.9, the Euclidean form of §3.2, §5.1–§5.3)
  carry no dimension hypothesis: in dimension `0` the space is a point, every map of it is
  `ACL^p` and `K`-quasiregular for every `K ≥ 1`, and each of those statements holds trivially.
- **Euclidean domains in Lean.** An open set `Ω` of a finite-dimensional real inner product
  space `E` is a `TopologicalSpace.Opens E`, as in `TauCeti.HasWeakFDerivOn`. A map of `Ω` is a
  function `E → E` (or `E → F`) whose values off `Ω` play no role: continuity is `ContinuousOn`
  on `Ω`, weak derivatives are tested against functions supported in `Ω`, and "almost every
  `x ∈ Ω`" is for `volume.restrict Ω`, Lebesgue measure normalised by orthonormal bases
  (Mathlib's `measureSpaceOfInnerProductSpace`).
- **Manifolds.** `M`, `N`, `P` are smooth, Hausdorff, second countable and boundaryless,
  modelled with `𝓘(ℝ, E)` on a real normed space `E` of dimension `n`, and carry a continuous
  Riemannian metric (Mathlib's `Bundle.RiemannianBundle` with `IsContinuousRiemannianBundle`) and an
  orientation `o_M : TauCeti.Manifold.Orientation 𝓘(ℝ, E) M (Fin n)`. The tangent orientation at
  `x` is `o_M.orientationAt x`. A second metric on the same manifold is carried by Tau Ceti's
  `TauCeti.WithMetric` copy. The measure on `M` is `TauCeti.riemannianVolume`; "almost
  everywhere" refers to it. Its null sets are the chartwise `TauCeti.IsNullSet`s
  (SobolevMapsBetweenManifolds §3.1), so the notion depends on neither the metric nor the
  orientation.
- **Euclidean space.** `ℝⁿ` is `EuclideanSpace ℝ (Fin n)` with the flat metric and the
  orientation of its standard basis, made a manifold orientation by
  `TauCeti.Manifold.Orientation.model`. Lebesgue measure is `volume`.
- **Linear algebra.** For a linear map `A : V → W` between real inner product spaces of
  dimension `n`, `σ₁(A) ≥ … ≥ σₙ(A) ≥ 0` are its singular values: Mathlib's
  `LinearMap.singularValues`, zero-indexed, so `σᵢ` is the value at `i − 1`. Then
  `‖A‖ = σ₁(A)` is the operator norm, `ℓ(A) = σₙ(A)` is the minimal stretch (§1.1) and
  `normDet(A) = σ₁(A) ⋯ σₙ(A)` is Mathlib's `LinearMap.normDet`. Given orientations `o_V`, `o_W`,
  `J(A)` is the oriented Jacobian of SobolevMapsBetweenManifolds §6.1, determined by
  `A^*(o_W.volumeForm) = J(A) · o_V.volumeForm` with Mathlib's `Orientation.volumeForm`. Then
  `|J(A)| = normDet(A)`, and `J(A) = det A` (Mathlib's `LinearMap.det`) when `V = W` with one
  orientation.
- **Normalisation of the distortion inequality.** The operator norm, not the Hilbert–Schmidt
  norm: `f` is `K`-quasiregular when `‖Df‖ⁿ ≤ K J_f` almost everywhere (HeikkilaPankka2025
  line 25; Prywes2019 line 25; MartioRickmanVaisala1969 (2.21), line 411). Witness: for
  `A = diag(2, 1)` on `ℝ²`, `‖A‖² = 4`, `J(A) = 2`, so the least admissible `K` is `2`; the
  Hilbert–Schmidt normalisation of Callender and Reshetnyak (MartioRickmanVaisala1969 (2.23),
  lines 426–430) gives `5/4` for the same map (§1.4).
- **Quotient conventions.** `q_O(0) = 0` (the quotient `0/0` counts as `0`), so constant maps have
  outer distortion `1`. `q_O(A) = ∞` when `A ≠ 0` and `J(A) ≤ 0`, so orientation-reversing
  differentials have infinite distortion. `q_I(A) = 0` when `J(A) ≤ 0`. Witness:
  `R = diag(−1, 1)` has `‖R‖² = 1`, `J(R) = −1`, `q_O(R) = ∞`, `q_I(R) = 0`, while the naive
  ratio `‖R‖²/J(R)` is `−1`.
- **Distortions of maps** take values in `[1, ∞]`, as extended non-negative reals, and are `∞`
  off the class. The constant `K` of a quasiregular map is a real number with `K ≥ 1`; the linear
  statements of §1.3 allow every real `K ≥ 0`.
- **Two meanings of "`K`-quasiregular".** Here, as in HeikkilaPankka2025 and Prywes2019,
  `K`-quasiregular means `K_O(f) ≤ K`. In MartioRickmanVaisala1969 (line 418) it means
  `K(f) = max(K_O(f), K_I(f)) ≤ K`; this roadmap calls that "`K`-quasiregular in the maximal
  sense". Witness: the radial stretch `x ↦ |x|^{−1/2} x` of `ℝ³` has `K_O = 2`, `K_I = 4`, so it
  is `2`-quasiregular, and `4`-quasiregular but not `2`-quasiregular in the maximal sense
  (§5.3).
- **Orientation sign.** Reversing exactly one of `o_M`, `o_N` negates `J_f`; reversing both
  leaves it unchanged. Witness: the identity `(ℝ², std) → (ℝ², −std)` has `J = −1`, and the
  reflection `(x₁, x₂) ↦ (−x₁, x₂)` from `(ℝ², std)` to `(ℝ², −std)` has `J = +1` (§4.2).
- **Exponents.** `K_I ≤ K_O^{n−1}` and `K_O ≤ K_I^{n−1}`, both with exponent `n − 1`. Witness:
  `diag(2, 1, 1)` has `q_O = 4`, `q_I = 2`, and `diag(1, 1, 1/2)` has `q_O = 2`, `q_I = 4` (§1.3).

## Exact supplier contracts

### From Mathlib

- `LinearMap.singularValues`, `LinearMap.singularValues_antitone` and
  `LinearMap.injective_iff_forall_lt_finrank_singularValues_pos`
  (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean`): singular values in descending order,
  zero beyond the dimension; injectivity iff the first `n` are positive.
- `LinearMap.normDet`, `LinearMap.normDet_eq_prod_singularValues` and
  `LinearMap.normDet_eq_abs_det` (`Mathlib/Analysis/InnerProductSpace/NormDet.lean`): the
  unsigned Jacobian, the product of the singular values, equal to `|det|` for endomorphisms.
- `LinearMap.det` (`Mathlib/LinearAlgebra/Determinant.lean`): the determinant of an
  endomorphism. `Orientation.volumeForm`, `Orientation.volumeForm_robust`,
  `Orientation.volumeForm_neg_orientation`, `Orientation.volumeForm_map` and
  `Orientation.abs_volumeForm_apply_le` (`Mathlib/Analysis/InnerProductSpace/Orientation.lean`):
  the oriented volume form, its value `1` on positive orthonormal bases, its sign under reversal,
  its naturality, and Hadamard's inequality for vectors. `Orientation.map`
  (`Mathlib/LinearAlgebra/Orientation.lean`): the orientation carried along a linear
  equivalence.
- `MulAction.instChartedSpaceQuotient` (`Mathlib/Geometry/Manifold/Instances/Quotient.lean`) and
  `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`
  (`Mathlib/Topology/Covering/Quotient.lean`): the charts of the orbit space of a free, properly
  discontinuous action, pushed forward along the orbit projection, which is a covering map (§7.5).
- `essSup`, `ae_le_essSup` and `essSup_le_of_ae_le`
  (`Mathlib/MeasureTheory/Function/EssSup.lean`): the essential supremum; the function is bounded
  by it almost everywhere, and an almost-everywhere bound bounds it.
- `AbsolutelyContinuousOnInterval` (`Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean`),
  `AbsolutelyContinuousOnInterval.ae_differentiableAt` (same file) and
  `AbsolutelyContinuousOnInterval.integral_mul_deriv_eq_deriv_mul`
  (`Mathlib/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`): absolute
  continuity on a closed interval, almost-everywhere differentiability, integration by parts.
- `MeasureTheory.volume_preserving_piFinSuccAbove`
  (`Mathlib/MeasureTheory/Constructions/Pi.lean`): splitting one coordinate off Lebesgue
  measure, the Fubini step for coordinate lines.
- `IsOpen.ae_eq_zero_of_integral_contDiff_smul_eq_zero`
  (`Mathlib/Analysis/Distribution/AEEqOfIntegralContDiff.lean`): the fundamental lemma of the
  calculus of variations.
- `LipschitzWith.ae_differentiableAt` (`Mathlib/Analysis/Calculus/Rademacher.lean`),
  `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` and
  `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le'`
  (`Mathlib/Analysis/Calculus/MeanValue.lean`): Rademacher's theorem; the mean value inequality
  on convex sets, and its variant against a fixed linear map.
- `extChartAt` and `Manifold.locallyCompact_of_finiteDimensional`
  (`Mathlib/Geometry/Manifold/IsManifold/ExtChartAt.lean`): the preferred extended chart at a
  point, in which the local bi-Lipschitz property of §6.1 is stated; a manifold modelled on a
  finite-dimensional space over a locally compact field is locally compact, which §6.1 uses for
  local finiteness of a triangulation.
- `DifferentiableAt.conformalAt` (`Mathlib/Analysis/Complex/Conformal.lean`): a complex
  differentiable map with non-zero derivative is conformal.
- `lineDeriv`, `HasLineDerivAt` and `LineDifferentiableAt`
  (`Mathlib/Analysis/Calculus/LineDeriv/Basic.lean`) and `measurable_lineDeriv`
  (`Mathlib/Analysis/Calculus/LineDeriv/Measurable.lean`): the derivative of `t ↦ u(x + t v)` at
  `0`, which `lineDeriv` sets to `0` where it does not exist, and its measurability for
  continuous `u`. `EuclideanSpace.basisFun` (`Mathlib/Analysis/InnerProductSpace/PiL2.lean`),
  `Module.Basis.constr` (`Mathlib/LinearAlgebra/Basis/Defs.lean`) and
  `LinearMap.toContinuousLinearMap` (`Mathlib/Topology/Algebra/Module/FiniteDimension.lean`): the
  standard basis, the linear map with prescribed values on it, and its continuity in finite
  dimension (§5.1).
- `MeasureTheory.MemLp` (`Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean`),
  `MeasureTheory.LocallyIntegrableOn` (`Mathlib/MeasureTheory/Function/LocallyIntegrable.lean`)
  and `measureSpaceOfInnerProductSpace` (`Mathlib/MeasureTheory/Measure/Haar/OfBasis.lean`):
  membership in `L^p`, local integrability on a set, and the Lebesgue measure of a
  finite-dimensional inner product space. `MemLp` includes almost-everywhere strong
  measurability; at `p = 0` it asks nothing else
  (`MeasureTheory.memLp_zero_iff_aestronglyMeasurable`,
  `Mathlib/MeasureTheory/Function/LpSeminorm/Basic.lean`).

### From Tau Ceti

- `LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero`
  (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean`): `‖A‖ = σ₁(A)`.
- `LinearMap.abs_singularValues_sub_singularValues_le`
  (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean:106`):
  `|σᵢ(A) − σᵢ(B)| ≤ ‖A − B‖` for every index and maps between finite-dimensional inner
  product spaces. At index `n − 1` it gives the minimal-stretch perturbation bound.
- `LinearMap.singularValues_smul`, `LinearMap.singularValues_linearIsometryEquiv_comp` and
  `LinearMap.singularValues_comp_linearIsometryEquiv`
  (`TauCeti/Analysis/InnerProductSpace/SingularValues.lean:602`, 589, 595): scaling by `c`
  multiplies each singular value by `‖c‖`, and composition on either side by a linear isometric
  equivalence preserves it. At index `n − 1` these give `ℓ(c A) = |c| ℓ(A)` and
  `ℓ(U ∘ A ∘ U') = ℓ(A)`; the domain dimensions agree under `U'`.
- `LinearMap.singularValues_mul_norm_le_norm_apply`
  (`TauCeti/Analysis/InnerProductSpace/SingularValues.lean`): `σ_k |x| ≤ |Ax|` on the span of the
  first `k` right singular vectors; with `k = n` it gives `ℓ(A)|v| ≤ |Av|` for all `v`.
- `TauCeti.UnitarilyInvariantSeminorm.frobenius_apply_eq_sqrt_sum_sq_singularValues`
  (`TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Frobenius.lean`): the
  Hilbert–Schmidt norm is `√(Σ σᵢ²)`.
- `TauCeti.Manifold.Orientation`, `TauCeti.Manifold.Orientation.orientationAt`,
  `TauCeti.Manifold.Orientation.eq_or_eq_neg` and `TauCeti.Manifold.Orientation.model`
  (`TauCeti/Geometry/Manifold/Orientation/Basic.lean`); `TauCeti.Manifold.Orientation.IsOrientationPreservingAt`
  and `TauCeti.Manifold.Orientation.IsOrientationReversingAt`
  (`TauCeti/Geometry/Manifold/Orientation/Preserving.lean`);
  `TauCeti.Manifold.Orientation.restrict` (`…/Orientation/OpenSubset.lean`);
  `TauCeti.Manifold.Orientation.pullback` and
  `IsLocalDiffeomorphAt.eventually_mapOrientation_eq` (`…/Orientation/Pullback.lean`): the
  pullback orientation along a `C¹` map with invertible differential, and the local constancy,
  in a trivialization of the tangent bundle, of a family of tangent orientations that the
  differential of a local diffeomorphism carries from an orientation of its source.
  `TauCeti.Manifold.Orientation.ext`, `TauCeti.Manifold.Orientation.ofVectorBundleOrientation`
  and `TauCeti.Manifold.Orientation.orientationAt_ofVectorBundleOrientation` (`…/Orientation/Basic.lean`)
  with `TauCeti.VectorBundleOrientation.ofEventually`
  (`TauCeti/Topology/VectorBundle/Orientation/Basic.lean`): two orientations with the same
  tangent orientations are equal, and a family of tangent orientations that is locally constant
  in trivializations is the family of tangent orientations of an orientation. An orientation is
  a quotient of chart-sign data; `IsOrientationPreservingAt` asks that `mfderiv` be an
  isomorphism carrying one tangent orientation to the other. It does not include
  differentiability of the map near the point.
- `TauCeti.IsNullSet`, `TauCeti.IsNullSet.iUnion` and `TauCeti.IsNullSet.interior_eq_empty`
  (`TauCeti/Geometry/Manifold/Measure.lean`): chartwise null sets against every Haar measure on
  the model; they are closed under countable unions and have empty interior.
- `TauCeti.riemannianVolume` (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean`),
  `TauCeti.isLocallyFiniteMeasure_riemannianVolume` (same file) and
  `TauCeti.isOpenPosMeasure_riemannianVolume` (`…/VolumeDensity/Support.lean`): the Riemannian
  measure of a continuous metric on a Lindelöf manifold; locally finite, positive on non-empty
  open sets. `TauCeti.riemannianVolumeForm` (`…/Riemannian/VolumeForm.lean`): the oriented volume
  form. `TauCeti.WithMetric` (`…/Riemannian/WithMetric.lean`): a copy of a manifold carrying a
  second metric.
- `TauCeti.IsLocalRiemannianIsometry` (`…/Riemannian/Isometry/Local.lean`): a smooth map whose
  differential is everywhere invertible and inner-product preserving.
  `Bundle.ContMDiffRiemannianMetric.quotient` and
  `Bundle.ContMDiffRiemannianMetric.isLocalRiemannianIsometry_descend`
  (`…/Riemannian/Pullback/Descent.lean`), with `TauCeti.instIsManifoldQuotient`,
  `TauCeti.isLocalDiffeomorph_quotientMk` and `TauCeti.mfderiv_quotientMk_smul_apply`
  (`TauCeti/Geometry/Manifold/Instances/Quotient.lean`): the metric descended to the orbit space
  of a free, properly discontinuous smooth isometric action, for which the orbit projection is a
  local Riemannian isometry; the smooth structure of the orbit space of a free, properly
  discontinuous action by `Cⁿ` maps, for which the orbit projection `π` is a `Cⁿ` local
  diffeomorphism with `dπ_{γx} ∘ dγ_x = dπ_x`.
- `TauCeti.HasWeakFDerivOn` and `Module.Basis.hasWeakFDerivOn_of_forall`
  (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean`): vector-valued weak Fréchet derivatives on an
  open set, checked in the directions of a basis. The definition includes completeness of the
  target and local integrability of `u` and of every `x ↦ Du(x) v` on the open set; it puts no
  condition on `u` off the open set. In the same file, `TauCeti.HasWeakFDerivOn.ae_eq` (two weak
  derivatives agree almost everywhere on the open set, in finite dimension),
  `TauCeti.HasWeakFDerivOn.congr_ae_deriv` (replacing the derivative by an almost-everywhere
  equal field preserves the weak derivative),
  `TauCeti.HasWeakFDerivOn.mono` (restriction to a smaller open set) and
  `TauCeti.hasWeakFDerivOn_of_differentiableOn` (a map differentiable at every point of the open
  set, with locally integrable `fderiv`, has `fderiv` as weak derivative). `TauCeti.hasWeakFDerivOn_iff_forall_isCompact_closure`
  (`…/WeakDeriv/Local.lean`): locality.
  `TauCeti.hasWeakFDerivOn_of_hasFDerivAt_off_countable` (`…/WeakDeriv/Removable.lean`): a
  continuous map, classically differentiable off a countable set with locally integrable
  derivative, has it as weak derivative. `LocallyLipschitzOn.hasWeakFDerivOn_fderiv`
  (`…/WeakDeriv/Lipschitz.lean`): a locally Lipschitz map has `fderiv` as weak derivative.
  `TauCeti.HasWeakLineDerivOn.absolutelyContinuousOnInterval` and
  `TauCeti.HasWeakLineDerivOn.ae_hasDerivAt` (`…/WeakDeriv/Interval.lean`): on an interval a
  continuous function with integrable weak derivative is absolutely continuous and differentiable
  almost everywhere with that derivative.
- `TauCeti.W1p` (`TauCeti/Analysis/Sobolev/W1p/Basic.lean`) and
  `TauCeti.W1p.exists_value_ae_eq_const_of_gradient_eq_zero`
  (`TauCeti/Analysis/Sobolev/Poincare/Wirtinger/W1p.lean`): on a preconnected open set a
  scalar `W^{1,p}` function with zero gradient is almost everywhere constant.
- `LocallyLipschitzOn.ae_differentiableAt_of_mem` (`TauCeti/Analysis/Calculus/Rademacher.lean`):
  Rademacher's theorem on open sets. `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank`
  (`TauCeti/Analysis/Calculus/Sard/LowDimension.lean`): differentiable images of lower-dimensional
  sets are null.
- `TauCeti.cantorFunction` and `TauCeti.not_absolutelyContinuousOnInterval_cantorFunction`
  (`TauCeti/Analysis/SpecialFunctions/CantorFunction.lean`): the Cantor function on `ℝ`, `0` on
  `(−∞, 0]` and `1` on `[1, ∞)`, is not absolutely continuous on `[0, 1]`.
- `TauCeti.IsSmoothTriangulation` and `TauCeti.IsSimplexImmersion`
  (`TauCeti/Geometry/Manifold/SmoothTriangulation/Basic.lean`): a homeomorphism from a realization
  onto a manifold that is `Cᵏ` within every closed simplex with injective differential there.
  The definition does not include local finiteness or purity, which §6.1 proves.
  `AbstractSimplicialComplex.Realization`, `AbstractSimplicialComplex.faceInclusion`,
  `AbstractSimplicialComplex.continuous_faceInclusion`, `AbstractSimplicialComplex.carrier` and
  `AbstractSimplicialComplex.faceBarycenter`
  (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean`): the realization with
  the weak topology, final for the continuous face inclusions; the carrier of a point, the support
  of its barycentric coordinates; the barycentre of a face, with coordinate `1/|σ|` on each vertex
  of `σ`. `AbstractSimplicialComplex.exists_finset_support_subset_of_isCompact` and
  `AbstractSimplicialComplex.compactSpace_realization_iff_finite` (`…/Realization/Compact.lean`):
  the carriers of the points of a compact subset lie in one finite vertex set, for every complex;
  the realization is compact exactly when the vertex type is finite. Neither assumes nor yields
  local finiteness, which §6.1 proves for triangulations of manifolds;
  `PreAbstractSimplicialComplex.SimplicialMap` (`…/SimplicialComplex/Maps.lean`) and
  `PreAbstractSimplicialComplex.SimplicialMap.realizationMap` (`…/Realization/Map.lean`), affine
  on each face, with its identity and composition laws; `PreAbstractSimplicialComplex.IsPure`
  (`…/SimplicialComplex/Pure.lean`).

### From TauCetiRoadmap.SobolevMapsBetweenManifolds

Every statement of Layers 2–4 and 7, and the oriented Jacobian of Layer 1, is made on the
continuous Sobolev class of maps between manifolds that SobolevMapsBetweenManifolds builds. This
roadmap assumes exactly the following of the sections cited, and nothing about how they are
constructed.

The class: its §4.2 (the class and its independence of the atlases), §4.4 (`C¹` members) and
§4.5 (restriction, locality and metric copies).

What SobolevMapsBetweenManifolds must provide (gap:sobolev-maps-class): For continuous maps between Hausdorff, second countable, boundaryless manifolds and `1 ≤ p ≤ ∞`, the chartwise class `W^{1,p}_loc(M, N)`, independent of the atlases and of the metrics, closed under restriction to open submanifolds, local for open covers, and containing every `C¹` map with `Df = mfderiv f` almost everywhere.

The weak differential and null sets: its §4.3 (the weak differential) and §3.1 (chartwise null
sets are Riemannian null sets).

What SobolevMapsBetweenManifolds must provide (gap:sobolev-maps-weak-differential): For `f ∈ W^{1,p}_loc(M, N)`, the almost-everywhere unique, chart-measurable weak differential `Df(x) : T_xM → T_{f(x)}N` with its chart formula, and the agreement of chartwise `TauCeti.IsNullSet` null sets with the null sets of `TauCeti.riemannianVolume` for every continuous metric.

The norm: its §5.1 (the norm `‖Df‖`), §5.2 (the `L^p` characterisation) and §5.3 (comparable
metrics).

What SobolevMapsBetweenManifolds must provide (gap:sobolev-maps-norm): For Riemannian `M` and `N`, the measurability of `x ↦ ‖Df(x)‖` and, for continuous `f` with local representatives in `W^{1,1}_loc`, the equivalence of `f ∈ W^{1,p}_loc(M, N)` with `‖Df‖ ∈ L^p_loc(M)`, with `‖Df‖` changed only by bounded factors under uniformly comparable metrics.

The Jacobian: its §6.1 (the oriented Jacobian of a linear map), §6.2 (the Jacobian of a Sobolev
map) and §6.3 (Hadamard's inequality and integrability).

What SobolevMapsBetweenManifolds must provide (gap:sobolev-maps-jacobian): For oriented inner product spaces of one dimension `n`, the oriented Jacobian `J(A)` with `A^*(o_W.volumeForm) = J(A) · o_V.volumeForm`, multiplicative, negated by reversing one orientation, with `|J(A)| = normDet(A) ≤ ‖A‖ⁿ` and `J(A) = det A` for endomorphisms; and, for `f ∈ W^{1,p}_loc(M, N)` between oriented Riemannian `n`-manifolds, the measurable Jacobian `J_f = J(Df)` almost everywhere, with `|J_f| ≤ ‖Df‖ⁿ` and `J_f ∈ L¹_loc(M)` when `p ≥ n`.

The chain rules: its §4.6 (a)–(b) (chain rules on manifolds), with §3.3 (null sets under `C¹`
maps of manifolds).

What SobolevMapsBetweenManifolds must provide (gap:sobolev-maps-chain-rules): For a `C¹` local diffeomorphism `θ : M' → M`, `f ∘ θ ∈ W^{1,p}_loc(M', N)` with `D(f ∘ θ)(y) = Df(θ y) ∘ dθ_y` almost everywhere and null preimages of null sets, and for a `C¹` map `g : N → P`, `g ∘ f ∈ W^{1,p}_loc(M, P)` with `D(g ∘ f)(x) = dg_{f(x)} ∘ Df(x)` almost everywhere, with no bound on `dθ` or `dg`.

The Euclidean case: its §1.2 (the class `W^{1,p}_loc(Ω; F)` on a Euclidean domain) and §7.1
(Euclidean compatibility).

What SobolevMapsBetweenManifolds must provide (gap:sobolev-maps-euclidean): For an open `Ω` of an `n`-dimensional real inner product space `E` with identity charts and flat metrics, `f ∈ W^{1,p}_loc(Ω, E)` if and only if `f` is continuous on `Ω` with a `TauCeti.HasWeakFDerivOn` derivative `Du` such that `‖Du‖ ∈ L^p_loc(Ω)`, and then `Df = Du` almost everywhere and, for one orientation on both sides, `J_f = det Du` almost everywhere.

### From TauCetiRoadmap.DifferentialGeometry

- 2.1–2.2: orientations, tangent orientations, orientation-preserving maps and pullback
  orientations along local diffeomorphisms, through the Tau Ceti declarations above.
- 12.1: the metric of an open submanifold (used in §2.5).
- 12.4: the Riemannian volume form and the measure `TauCeti.riemannianVolume` with full
  support.

### From TauCetiRoadmap.RiemannianGeometry

- R4 item 7: the quotient atlas, descended metric and covering for a free, properly
  discontinuous group of isometries, through `Bundle.ContMDiffRiemannianMetric.quotient` and
  `TauCeti.isLocalDiffeomorph_quotientMk`, and the Killing–Hopf classification, by which a
  connected complete flat manifold is isometric to `ℝⁿ/Γ` for a free, properly discontinuous
  group `Γ` of isometries of `ℝⁿ` (§7.6).

### From TauCetiRoadmap.GeometricTopology

- Layer 11: realizations of abstract simplicial complexes, simplicial maps and their
  realizations, and the lemma that every compact subset of a realization lies in the realization
  of a restriction to finitely many vertices, through the Tau Ceti declarations above (Layer 6).

### From TauCetiRoadmap.TeichmullerGeometry

- §7.4: the weak Wirtinger derivatives `f_z`, `f_z̄` of a `W^{1,2}_loc` map of a planar domain,
  their agreement with the classical ones at points of differentiability, and orientation-preserving
  quasiconformal maps as `W^{1,2}_loc` homeomorphisms with `f_z̄ = μ f_z` almost everywhere for a
  measurable `μ` with `‖μ‖_∞ < 1` (§2.10).

## How to read the build

Layer 1 is finite-dimensional linear algebra. It defines the minimal stretch and the three
distortion quotients of a linear map, proves the comparison inequalities with their equality
cases and submultiplicativity, and computes the planar case. Layer 2 defines `K`-quasiregular
maps on the imported Sobolev class and the outer distortion. It proves attainment, the sign of
the Jacobian, locality and constancy, and gives the `C¹`, locally Lipschitz, Euclidean and planar
descriptions. Layer 3 adds the inner, maximal and Hilbert–Schmidt distortions and proves the
sharp comparison of the Martio–Rickman–Väisälä inequalities (2.24) and (2.25). Layer 4 proves
invariance under metrics, orientations and `C¹` factors. Layer 5 is Euclidean and independent of
Layers 2–4 except in §5.3: `ACL^p` maps, their identification with continuous `W^{1,p}_loc` maps,
and the agreement with the classical definition. Layer 6 proves that piecewise `C¹` maps of
`C¹`-triangulated manifolds are locally Lipschitz and that non-degenerate orientation-preserving
simplicial maps with bounded simplexwise distortion are quasiregular. Layer 7 defines
quasiregular ellipticity, proves its invariances, orients the orbit spaces of free, properly
discontinuous orientation-preserving actions, and proves its examples.

Layers 1 and 5 can be built at once. Layer 2 needs Layer 1. Layer 3 needs Layer 2, and Layer 4
needs Layers 2 and 3. Layer 6 needs §2.2, §2.7, §2.8 and §3.1. Layer 7 needs Layers 4 and 6. The
Euclidean part of the roadmap needs no supplier roadmap: the minimal stretch (§1.1), Euclidean
quasiregularity (§2.9, the definition), the Euclidean form of §3.2 and §5.1–§5.3 rest on Mathlib
and Tau Ceti alone, and they are what `Suggested.lean` states.

## Layer 1: linear distortion

Throughout this layer `V`, `W`, `X` are real inner product spaces of dimension `n ≥ 1`, each with
an orientation, and `A : V → W`, `B : W → X` are linear.

### 1.1 Minimal stretch

Define the minimal stretch `ℓ(A) = σₙ(A)` (`minimalStretch`), the smallest of the `n` singular
values of `A`: Mathlib's `LinearMap.singularValues` at the zero-based index `n − 1`, for a linear
map between finite-dimensional real inner product spaces. Prove that it is the minimum of `|Av|`
over unit vectors `v` of `V`, the quantity written `ℓ(T)` in MartioRickmanVaisala1969 line 127.

- For every `v ∈ V`, `ℓ(A)|v| ≤ |Av|`, with equality for a right singular vector of `σₙ(A)`; so
  `ℓ(A)` is attained as the minimum over the unit sphere.
- `ℓ(A) ≤ ‖A‖`, with equality iff `A` is a non-negative multiple of a linear isometry.
- `ℓ(A) > 0` iff `A` is injective; then `ℓ(A) · ‖A⁻¹‖ = 1`.
- `ℓ(B ∘ A) ≥ ℓ(B) ℓ(A)`.
- `ℓ(A)ⁿ ≤ normDet(A) ≤ ‖A‖ⁿ`, since `normDet(A) = σ₁(A) ⋯ σₙ(A)`.
- The supplied perturbation bound makes `ℓ` `1`-Lipschitz for the operator norm, hence continuous
  and Borel.

**Checks.**

- For `A = diag(3, 1/2)` on `ℝ²`, `ℓ(A) = 1/2`, `‖A‖ = 3`, `‖A⁻¹‖ = 2`, and `ℓ(A)‖A⁻¹‖ = 1`.
- For the shear `[[1, 1], [0, 1]]`, `AᵀA = [[1, 1], [1, 2]]` has eigenvalues `(3 ± √5)/2`. So
  `ℓ(A) = (√5 − 1)/2 ≈ 0.618` and `‖A‖ = (√5 + 1)/2`. A definition taking the minimum of
  `|Ae_i|` over the standard basis gives `1`, which is wrong.
- The zero map and the orthogonal projection of `ℝ²` onto a line both have `ℓ = 0`; the
  projection has `‖A‖ = 1`. A definition as the minimum of `|Av|` over all `v`, not unit
  vectors, gives `0` for every map, including the identity.
- In dimension one, `ℓ(a · id) = ‖a · id‖ = |a|`.
- For `A = diag(3, 1/2)` and `A' = diag(3, 3/4)`, the supplied perturbation bound reads
  `|1/2 − 3/4| = 1/4 ≤ ‖diag(0, −1/4)‖ = 1/4`. Scaling `A` by `−2` gives minimal stretch
  `1 = 2 · (1/2)`, while composition on either side by the coordinate swap keeps it `1/2`;
  using the signed scalar or the determinant of the isometry would give the wrong sign.
- The index is the last one, not the first: for `diag(3, 1/2)` the singular values in Mathlib's
  descending order are `3, 1/2`, and index `n − 1 = 1` gives `1/2`. Index `0` would give the
  operator norm `3`, and index `n = 2`, beyond the dimension, gives `0` for every map.

*Needs:* Mathlib `LinearMap.singularValues`, `LinearMap.singularValues_antitone`,
`LinearMap.injective_iff_forall_lt_finrank_singularValues_pos`,
`LinearMap.normDet_eq_prod_singularValues`; Tau Ceti
`LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero`,
`LinearMap.singularValues_mul_norm_le_norm_apply`,
`LinearMap.abs_singularValues_sub_singularValues_le`, `LinearMap.singularValues_smul`,
`LinearMap.singularValues_linearIsometryEquiv_comp`,
`LinearMap.singularValues_comp_linearIsometryEquiv`.

### 1.2 Outer and inner distortion of a linear map

With the oriented Jacobian `J(A)` of SobolevMapsBetweenManifolds §6.1, define the outer distortion
`q_O(A) ∈ [0, ∞]` and the inner distortion `q_I(A) ∈ [0, ∞)`:

    q_O(A) = ‖A‖ⁿ / J(A)   if J(A) > 0,     q_O(0) = 0,     q_O(A) = ∞   if A ≠ 0 and J(A) ≤ 0;
    q_I(A) = J(A) / ℓ(A)ⁿ  if J(A) > 0,     q_I(A) = 0      if J(A) ≤ 0.

These are the pointwise quotients whose essential suprema are the outer and inner dilatation of
MartioRickmanVaisala1969 (2.21)–(2.22), lines 411–416. When `J(A) > 0` all singular values are
positive, so the denominators do not vanish.

- If `J(A) > 0` then `q_O(A) = σ₁ⁿ/(σ₁ ⋯ σₙ) = Π_{i ≥ 2} σ₁/σᵢ ≥ 1` and
  `q_I(A) = (σ₁ ⋯ σₙ)/σₙⁿ = Π_{i ≤ n−1} σᵢ/σₙ ≥ 1`, and both are at least `σ₁/σₙ`.
- For an orientation-preserving linear isometric equivalence `U` on either side and `c > 0`:
  `q_O(U ∘ A) = q_O(A ∘ U) = q_O(c A) = q_O(A)`, and likewise for `q_I`. For `c < 0`,
  `J(c A) = cⁿ J(A)`: nothing changes for even `n`, while for odd `n` and `J(A) > 0`,
  `q_O(c A) = ∞` and `q_I(c A) = 0`.
- Reversing exactly one of the orientations of `V`, `W` replaces `J(A)` by `−J(A)`; reversing
  both changes neither quotient.
- Submultiplicativity: `q_O(B ∘ A) ≤ q_O(B) q_O(A)` for all `A`, `B`, with `0 · ∞ = 0`; and
  `q_I(B ∘ A) ≤ q_I(B) q_I(A)` when `J(A) ≥ 0` and `J(B) ≥ 0`.
- `q_O(A) ≤ 1` iff `A = 0` or `A = λ U` with `λ > 0` and `U` a linear isometry with
  `J(U) = 1`.
- For fixed orientations, `q_O` is lower semicontinuous on the space of linear maps `V → W`, and
  `q_O`, `q_I` are Borel.

**Checks.**

- `A = diag(2, 1)` on `ℝ²`, standard orientation on both sides: `‖A‖ = 2`, `J(A) = 2`,
  `ℓ(A) = 1`, so `q_O(A) = 4/2 = 2` and `q_I(A) = 2/1 = 2`.
- `R = diag(−1, 1)`: `q_O(R) = ∞` and `q_I(R) = 0`, while the naive quotient `‖R‖²/J(R)` is
  `−1`; a definition by the naive quotient would make `R` `1`-quasiregular.
- The zero map: `q_O(0) = q_I(0) = 0`. The convention `0/0 = ∞` would give `q_O(0) = ∞`, and
  every constant map would fail to be quasiregular.
- `R ∘ R = id`: `q_I(id) = 1 > 0 = q_I(R) q_I(R)`, so the sign hypotheses of
  `q_I`-submultiplicativity cannot be dropped.
- `−id` with one orientation on both sides: `J = (−1)ⁿ`, so `q_O(−id) = ∞` for `n = 3` and
  `q_O(−id) = 1` for `n = 2`.

*Needs:* §1.1; SobolevMapsBetweenManifolds §6.1 (gap `sobolev-maps-jacobian`); Mathlib
`Orientation.volumeForm_neg_orientation`, `Orientation.volumeForm_map`.

### 1.3 Comparison of the linear distortions

Prove that for every real `K ≥ 0`, `‖A‖ⁿ ≤ K J(A)` iff `q_O(A) ≤ K`, and `J(A) ≤ K ℓ(A)ⁿ` iff
`q_I(A) ≤ K`. The hypothesis `K ≥ 0` is needed: for `K = −1` and `R = diag(−1, 1)`,
`‖R‖² = 1 ≤ (−1)(−1)` holds while `q_O(R) = ∞`.

Prove the pointwise form of MartioRickmanVaisala1969 (2.25), line 438: if `J(A) > 0` then

    q_I(A) ≤ q_O(A)^{n−1}   and   q_O(A) ≤ q_I(A)^{n−1}.

Route: each of the `n − 1` factors `σᵢ/σₙ` of `q_I` is at most `σ₁/σₙ ≤ q_O(A)`, and each of the
`n − 1` factors `σ₁/σᵢ` of `q_O` is at most `σ₁/σₙ ≤ q_I(A)`. Equality cases:
`q_I = q_O^{n−1}` iff `σ₁ = … = σ_{n−1}`; `q_O = q_I^{n−1}` iff `σ₂ = … = σₙ`; for `n = 2`,
`q_O = q_I = σ₁/σ₂`; and `q_O = 1` iff `q_I = 1` iff `A = λU` as in §1.2. For `A = 0` both
inequalities hold. For `A ≠ 0` with `J(A) ≤ 0` the second fails.

**Checks.**

- `diag(2, 1, 1)`: `q_O = 8/2 = 4`, `q_I = 2/1 = 2`, so `q_O = q_I²`, the case `σ₂ = σ₃`.
- `diag(1, 1, 1/2)`: `q_O = 1/(1/2) = 2`, `q_I = (1/2)/(1/8) = 4 = q_O²`, the case `σ₁ = σ₂`.
- `diag(3, 2, 1)`: `q_O = 27/6 = 9/2` and `q_I = 6`; `6 < (9/2)² = 81/4` and `9/2 < 36`, both
  strict.
- `n = 1`, `A = a · id` with `a > 0`: `q_O = q_I = 1` and the exponents are `0`.
- The projection `diag(1, 0)` of `ℝ²`: `J = 0`, `q_O = ∞`, `q_I = 0`, so `q_O ≤ q_I^{1}` fails
  and the hypothesis `J(A) > 0` is used.

*Needs:* §1.1, §1.2; Mathlib `LinearMap.normDet_eq_prod_singularValues`; SobolevMapsBetweenManifolds
§6.1 (gap `sobolev-maps-jacobian`).

### 1.4 Hilbert–Schmidt distortion

Define the Hilbert–Schmidt distortion

    q_S(A) = ‖A‖_HSⁿ / (n^{n/2} J(A))   if J(A) > 0,     q_S(0) = 0,     q_S(A) = ∞   otherwise,

where `‖A‖_HS² = Σ σᵢ(A)²` is the Hilbert–Schmidt norm (Tau Ceti's Frobenius seminorm). This is
the normalisation of Callender and Reshetnyak (MartioRickmanVaisala1969 (2.23), lines 426–430).

- `q_S(A) = (σ₁² + … + σₙ²)^{n/2} / (n^{n/2} σ₁ ⋯ σₙ)` when `J(A) > 0`.
- `q_S(A) ≥ 1` when `J(A) > 0`, by the inequality of arithmetic and geometric means on the
  `σᵢ²`, with equality iff `q_O(A) = 1`.
- `q_S` has the invariances of `q_O` listed in §1.2.
- For every `A`, `q_S(A) ≤ q_O(A) ≤ n^{n/2} q_S(A)` (MartioRickmanVaisala1969 (2.24),
  line 435). The constant `n^{n/2}` cannot be lowered, and for `J(A) > 0` and `n ≥ 2` the upper
  bound is strict.

**Checks.**

- `q_S(id) = n^{n/2}/n^{n/2} = 1`.
- `diag(2, 1)`: `‖A‖_HS² = 5`, `q_S = 5/(2 · 2) = 5/4`, `q_O = 2`, and `5/4 ≤ 2 ≤ 5/2`.
- `diag(1, ε)`, `0 < ε < 1`: `q_O = 1/ε`, `q_S = (1 + ε²)/(2ε)`, and
  `q_O/q_S = 2/(1 + ε²) → 2 = n^{n/2}` as `ε → 0`, never reaching `2`.
- `diag(1, ε, ε)` in `ℝ³`: `q_O/q_S = 3^{3/2}/(1 + 2ε²)^{3/2} → 3^{3/2}`.
- `diag(−1, 1)`: `q_S = ∞`; the zero map: `q_S = 0`.

*Needs:* §1.2, §1.3; Tau Ceti
`TauCeti.UnitarilyInvariantSeminorm.frobenius_apply_eq_sqrt_sum_sq_singularValues`.

### 1.5 Planar linear maps

Prove, for a real-linear map `A z = a z + b z̄` of `ℂ`, with `ℂ` oriented by the basis `(1, i)`:
`‖A‖ = |a| + |b|`, `ℓ(A) = ||a| − |b||` and `J(A) = det A = |a|² − |b|²`. If `|b| < |a|` then
`q_O(A) = q_I(A) = (|a| + |b|)/(|a| − |b|)`; if `A ≠ 0` and `|b| ≥ |a|` then `q_O(A) = ∞`. For
`0 ≤ k < 1`, `q_O(A) ≤ (1 + k)/(1 − k)` iff `|b| ≤ k|a|` (Ahlfors2006, Ch. I).

**Checks.**

- `a = 1`, `b = 1/2`: `‖A‖ = 3/2`, `ℓ(A) = 1/2`, `J(A) = 3/4`, `q_O(A) = (9/4)/(3/4) = 3`.
- `a = 0`, `b = 1` (conjugation): `J(A) = −1` and `q_O(A) = ∞`.
- `a = 2i`, `b = 0`: `q_O(A) = 1`.
- `K = 2` corresponds to `k = 1/3`: `z + z̄/3` has `q_O = (4/3)/(2/3) = 2`.

*Needs:* §1.2, §1.3; Mathlib `LinearMap.det`; SobolevMapsBetweenManifolds §6.1 (gap
`sobolev-maps-jacobian`).

### Examples

- For `A = diag(σ₁, …, σₙ)` with `σ₁ ≥ … ≥ σₙ > 0` on `ℝⁿ`: `q_O(A) = σ₁^{n−1}/(σ₂ ⋯ σₙ)` and
  `q_I(A) = (σ₁ ⋯ σ_{n−1})/σₙ^{n−1}`.
- A positive multiple of a rotation has `q_O = q_I = q_S = 1`.
- The shear `[[1, 1], [0, 1]]` has `q_O = q_I = (3 + √5)/2`.

### Dependencies

Mathlib's singular values, `LinearMap.normDet` and oriented volume forms; Tau Ceti's singular-value
and Frobenius lemmas; SobolevMapsBetweenManifolds §6.1 for `J(A)`. No earlier layer.

## Layer 2: quasiregular maps and the outer distortion

Throughout, `M` and `N` are as in the Conventions, of dimension `n ≥ 1`, and `W^{1,n}_loc(M, N)`,
`Df`, `‖Df‖` and `J_f` are those of SobolevMapsBetweenManifolds.

### 2.1 Quasiregular maps

For a real `K`, call `f : M → N` `K`-quasiregular when `1 ≤ K`, `f` is continuous,
`f ∈ W^{1,n}_loc(M, N)`, and `‖Df(x)‖ⁿ ≤ K J_f(x)` for almost every `x ∈ M`. Call `f`
quasiregular when it is `K`-quasiregular for some `K`. This is the definition of
HeikkilaPankka2025 lines 22–27 and Prywes2019 lines 22–26. On Euclidean domains it is
MartioRickmanVaisala1969 Definition 2.20 (lines 409–412), with `ACLⁿ` in place of
`W^{1,n}_loc`; §5.3 identifies the two.

- If `f` is `K`-quasiregular and `K ≤ K'` then `f` is `K'`-quasiregular.
- `f` is `K`-quasiregular iff `1 ≤ K`, `f` is continuous, `f ∈ W^{1,n}_loc(M, N)` and
  `q_O(Df(x)) ≤ K` for almost every `x` (§1.3).
- The notion depends only on `f`, the two metrics and the two orientations; "almost every" does
  not depend on the metric.
- Constant maps are `K`-quasiregular for every `K ≥ 1`; every map out of an empty manifold is
  `1`-quasiregular.
- If `0 ≤ K < 1` and `‖Df‖ⁿ ≤ K J_f` almost everywhere, then `Df = 0` almost everywhere, by
  Hadamard's inequality `J_f ≤ ‖Df‖ⁿ`. This is why `K ≥ 1` is part of the definition.

**Checks.**

- The identity of `M`, one orientation on both sides: `‖id‖ = 1` and `J = 1`, so it is
  `1`-quasiregular.
- The identity `(M, o) → (M, −o)` of a non-empty `M` has `J = −1` and is not quasiregular.
  Without the requirement `1 ≤ K`, the value `K = −1` would satisfy `1 ≤ (−1)(−1)` and accept it.
- The fold `F(x₁, …, xₙ) = (|x₁|, x₂, …, xₙ)` of `ℝⁿ` has `‖DF‖ = 1` and `J_F = sign x₁` almost
  everywhere. It is not quasiregular, while a definition through `|J_f|` would accept it with
  `K = 1`.
- In dimension one, `t ↦ max(0, t)` on `ℝ` has `Df = 1` on `t > 0` and `Df = 0` on `t < 0`. It
  is `1`-quasiregular, non-constant, and constant on `(−∞, 0]`.

*Needs:* §1.2, §1.3; SobolevMapsBetweenManifolds §4.2, §4.3, §5.1, §6.1–§6.3 (gaps `sobolev-maps-class`,
`sobolev-maps-weak-differential`, `sobolev-maps-norm`, `sobolev-maps-jacobian`).

### 2.2 The outer distortion of a map

Define the outer distortion `K_O(f) ∈ [1, ∞]`. For continuous `f ∈ W^{1,n}_loc(M, N)` it is
`max(1, ess sup_x q_O(Df(x)))`, the essential supremum (`essSup`) taken for
`TauCeti.riemannianVolume`. For every other map it is `∞` (MartioRickmanVaisala1969
lines 412–413 and 418–419).

- `K_O(f) = 1` for constant maps and for every map out of an empty manifold.
- `K_O(f|_U) ≤ K_O(f)` for open `U ⊆ M` (§2.5).
- For `C¹` maps, `K_O(f) = max(1, sup_x q_O(df_x))` (§2.7).
- `K_O` is unchanged by composing with orientation-preserving isometries on either side, and
  submultiplicative under the compositions of §4.3–§4.4.

**Checks.**

- A constant map has `ess sup q_O(Df) = 0` and `K_O = 1`. Without the `max(1, ·)` its value
  would be `0`, outside `[1, ∞]`.
- `z ↦ z²` on `ℂ`: `Df(z)` is multiplication by `2z`, `‖Df‖ = 2|z|`, `J = 4|z|²`, so
  `q_O = 1` off `0` and `q_O = 0` at `0`, and `K_O = 1`.
- The radial stretch `x ↦ |x|^{a−1} x` of `ℝ³` has `K_O = a²` for `a ≥ 1` and `K_O = 1/a` for
  `0 < a < 1`: `4` for `a = 2` and `2` for `a = 1/2` (§2.9).
- The fold has `K_O = ∞`, while the essential supremum of the naive ratio `‖Df‖ⁿ/J_f = ±1` is `1`.

*Needs:* §1.2, §2.1; Mathlib `essSup`; Tau Ceti `TauCeti.riemannianVolume`;
SobolevMapsBetweenManifolds §4.2, §4.3, §5.1, §6.2 (gaps `sobolev-maps-class`, `sobolev-maps-weak-differential`,
`sobolev-maps-norm`, `sobolev-maps-jacobian`).

### 2.3 Attainment of the outer distortion

Prove that for continuous `f ∈ W^{1,n}_loc(M, N)`,

    { K ∈ ℝ : f is K-quasiregular } = { K ∈ ℝ : 1 ≤ K and K_O(f) ≤ K }.

So `f` is `K_O(f)`-quasiregular when `K_O(f) < ∞`, and `f` is quasiregular iff `K_O(f) < ∞`; the
least admissible constant of MartioRickmanVaisala1969 lines 412–413 exists. Route: by §1.3 the
inequality at `x` is `q_O(Df(x)) ≤ K`. An almost-everywhere bound bounds the essential supremum
(`essSup_le_of_ae_le`), and the function is bounded by its essential supremum almost
everywhere (`ae_le_essSup`).

**Checks.**

- For the identity of `M` the set is `[1, ∞)`.
- For the fold the set is empty and `K_O = ∞`.
- For `M` empty the measure is zero, the essential supremum is `0`, `K_O = 1`, and the set is
  `[1, ∞)`.

*Needs:* §1.3, §2.1, §2.2; Mathlib `ae_le_essSup`, `essSup_le_of_ae_le`;
SobolevMapsBetweenManifolds §4.3, §6.2 (gaps `sobolev-maps-weak-differential`, `sobolev-maps-jacobian`).

### 2.4 The Jacobian of a quasiregular map

Prove that if `f` is `K`-quasiregular then, almost everywhere on `M`: `J_f ≥ 0`;
`Df = 0` wherever `J_f = 0`; `J_f ≤ ‖Df‖ⁿ ≤ K J_f`; and `J_f = |J_f| = normDet(Df)`. Moreover
`J_f ∈ L¹_loc(M)`. Route: `‖Df‖ⁿ ≥ 0` and `K > 0` give `J_f ≥ 0`. On `{J_f = 0}` the inequality
gives `‖Df‖ⁿ ≤ 0`. Hadamard's inequality and the integrability of `J_f` for `p = n` are
SobolevMapsBetweenManifolds §6.3 (Rickman1993, Ch. I).

**Checks.**

- `z ↦ z²`: `J = 4|z|² ≥ 0`, vanishing only at `0`, where `Df = 0`.
- The projection `P(x) = (x₁, …, x_{n−1}, 0)` of `ℝⁿ`, `n ≥ 2`, has `J_P = 0` and `DP ≠ 0`
  everywhere, so it is not quasiregular.
- The radial stretch with `a > 0` has `J = a |x|^{n(a−1)}`, which is integrable near `0` exactly
  because `n(a − 1) > −n`.

*Needs:* §2.1, §2.3; SobolevMapsBetweenManifolds §6.2–§6.3 (gap `sobolev-maps-jacobian`).

### 2.5 Restriction and locality

Prove the following. If `f` is `K`-quasiregular and `U ⊆ M` is open, then `f|_U` is
`K`-quasiregular. Here `U` carries the restricted metric (DifferentialGeometry 12.1) and the
restricted orientation `TauCeti.Manifold.Orientation.restrict`, and `K_O(f|_U) ≤ K_O(f)`. A
continuous `f` is `K`-quasiregular iff every point has an open neighbourhood `U` with `f|_U`
`K`-quasiregular. For every open cover `(U_i)` of `M` and continuous `f`,
`K_O(f) = max(1, sup_i K_O(f|_{U_i}))`; the `max` matters only for the empty cover of `M = ∅`,
since every `K_O(f|_{U_i})` is at least `1`. Route: locality of the class
(SobolevMapsBetweenManifolds §4.5), a countable subcover (second countability) and
`TauCeti.IsNullSet.iUnion` (Rickman1993, Ch. I).

**Checks.**

- The shear `f(x, y) = (x, y + x³/3)` of `ℝ²` has `J = 1` and `Df = [[1, 0], [x², 1]]` with
  `‖Df‖ = (x² + √(x⁴ + 4))/2`. On `{|x| < R}`, `K_O = ((R² + √(R⁴ + 4))/2)²`, finite for each
  `R`, while `K_O(f) = ∞` on `ℝ²`. The map is locally quasiregular but not quasiregular, so
  quasiregularity is a uniform condition.
- `z ↦ z²` on `{Re z > 0}` is injective and `1`-quasiregular.
- For `M = ∅` and the empty cover, `K_O(f) = 1` (§2.3), while the supremum of the empty family
  in `[0, ∞]` is `0`. The bare supremum would give `0`, and `max(1, ·)` restores `1`.

*Needs:* §2.1, §2.2; Tau Ceti `TauCeti.IsNullSet.iUnion`, `TauCeti.Manifold.Orientation.restrict`;
DifferentialGeometry 12.1; SobolevMapsBetweenManifolds §4.5 (gap `sobolev-maps-class`).

### 2.6 Maps with vanishing differential

Prove that if `M` is connected and `f : M → N` is continuous, `f ∈ W^{1,1}_loc(M, N)` and
`Df = 0` almost everywhere, then `f` is constant. Hence a quasiregular map of a connected `M`
with `J_f = 0` almost everywhere is constant. A non-constant quasiregular map of a connected `M`
has `J_f > 0` on a set of positive measure. Route: in a chart ball the coordinates of the local
representative have zero weak gradient, so they are almost everywhere constant
(`TauCeti.W1p.exists_value_ae_eq_const_of_gradient_eq_zero`). By continuity they are constant on
the ball, so `f` is locally constant, and connectedness gives the claim (Rickman1993, Ch. I). The
second statement follows with §2.4.

**Checks.**

- Two disjoint open balls mapped to two different points: `Df = 0` and `f` is not constant, so
  connectedness is used.
- `(x₁, x₂) ↦ (c(x₁), 0)` on `ℝ²`, with the Cantor function `c` (Tau Ceti's
  `TauCeti.cantorFunction`, `0` on `(−∞, 0]` and `1` on `[1, ∞)`), is continuous with classical
  derivative `0` almost everywhere and is not constant. It is not in `W^{1,1}_loc`: by §5.2 it
  would be `ACL`, so `c` would be absolutely continuous on the segment `[0, 1]` of the box
  `[0, 1]²`, which it is not (`TauCeti.not_absolutelyContinuousOnInterval_cantorFunction`).
- In dimension one, `t ↦ max(0, t)` on the connected `ℝ` is quasiregular and non-constant. Its
  Jacobian is `1` on `(0, ∞)`, a set of positive measure, as the second statement requires, and
  `0` on the half-line `(−∞, 0)`, also of positive measure. So the statement claims positivity
  on a set of positive measure only; positivity almost everywhere is Reshetnyak's theorem
  (QuasiregularMaps, Part II), which needs `n ≥ 2`.

*Needs:* §2.4; Tau Ceti `TauCeti.W1p.exists_value_ae_eq_const_of_gradient_eq_zero`,
`TauCeti.cantorFunction` (for the Check);
SobolevMapsBetweenManifolds §4.2–§4.3 (gaps `sobolev-maps-class`, `sobolev-maps-weak-differential`).

### 2.7 `C¹` maps

Prove that a `C¹` map `f : M → N` is `K`-quasiregular (`K ≥ 1`) iff
`‖df_x‖ⁿ ≤ K J(df_x)` for every `x ∈ M`, where `J` is taken for `o_M.orientationAt x` and
`o_N.orientationAt (f x)`. Prove that `K_O(f) = max(1, sup_x q_O(df_x))`. In particular `f` is
`1`-quasiregular iff every `df_x` is `0` or a positive multiple of an orientation-preserving linear
isometry. Identities, orientation-preserving isometries, local Riemannian isometries
(`TauCeti.IsLocalRiemannianIsometry`) that are orientation preserving at every point, and
orientation-preserving conformal `C¹` maps are therefore `1`-quasiregular. Route: `C¹` maps lie
in the class with `Df = mfderiv f` almost everywhere (SobolevMapsBetweenManifolds §4.4). The
function `x ↦ ‖df_x‖ⁿ − K J(df_x)` is continuous, and a null set has empty interior
(`TauCeti.IsNullSet.interior_eq_empty`), so an almost-everywhere bound holds everywhere. For the
supremum, `x ↦ q_O(df_x)` is lower semicontinuous (§1.2) and `TauCeti.riemannianVolume` is
positive on non-empty open sets (`TauCeti.isOpenPosMeasure_riemannianVolume`), so the essential
supremum is the supremum (Rickman1993, Ch. I).

**Checks.**

- `z ↦ z²` on `ℂ` is `C¹`, `1`-quasiregular and not injective.
- `x ↦ −x` on `ℝⁿ`, one orientation on both sides: `J = (−1)ⁿ`, so it is `1`-quasiregular iff
  `n` is even.
- `(x, y) ↦ (x³, y)` is a smooth homeomorphism of `ℝ²` with `J = 3x² ≥ 0`. For `x ≠ 0`,
  `q_O = max(3x², 1)²/(3x²) → ∞` as `x → 0`, and at `x = 0`, `df = diag(0, 1) ≠ 0` with `J = 0`.
  So it is not quasiregular.
- The orbit projection `ℝⁿ → ℝⁿ/ℤⁿ` with the descended flat metric has `‖dπ‖ = 1` and `J = 1`
  for an orientation for which it is orientation preserving, so `K_O(π) = 1`.

*Needs:* §1.2, §2.2, §2.3; Tau Ceti `TauCeti.IsNullSet.interior_eq_empty`,
`TauCeti.isOpenPosMeasure_riemannianVolume`, `TauCeti.IsLocalRiemannianIsometry`;
SobolevMapsBetweenManifolds §4.4, §5.1, §6.2 (gaps `sobolev-maps-class`, `sobolev-maps-norm`,
`sobolev-maps-jacobian`).

### 2.8 Locally Lipschitz maps

Call `f : M → N` locally Lipschitz in charts when it is continuous and every local representative
`ψ ∘ f ∘ φ⁻¹` is locally Lipschitz on its open domain. Prove that such an `f`:

- lies in `W^{1,p}_loc(M, N)` for every `p ∈ [1, ∞]`;
- is differentiable at almost every point;
- has `Df = mfderiv f` almost everywhere.

Consequently `f` is `K`-quasiregular iff `‖mfderiv f x‖ⁿ ≤ K J(mfderiv f x)` for almost every `x`.
Route: Rademacher's theorem on the chart domains
(`LocallyLipschitzOn.ae_differentiableAt_of_mem`) and `LocallyLipschitzOn.hasWeakFDerivOn_fderiv`
for each representative, with the chart definition of the class. HeikkilaPankka2025 Lemma B.2,
lines 1255–1260, proves the `W^{1,∞}` case for piecewise smooth functions on closed manifolds by
Stokes' theorem; this statement holds on every `M` and is what Layer 6 uses.

**Checks.**

- The winding map `(r, θ, z) ↦ (r, 2θ, z)` of `ℝ³` is `((x² − y²)/r, 2xy/r, z)` with
  `r = √(x² + y²)`. It is positively homogeneous of degree one in `(x, y)` and smooth off the
  axis, hence Lipschitz. Off the axis its singular values are `2, 1, 1` and `J = 2`, so
  `K_O = 4` and `K_I = 2`.
- The fold is `1`-Lipschitz and not quasiregular (§2.1).
- `x ↦ |x|^{1/2}` on `ℝ` is not locally Lipschitz at `0`; it lies in `W^{1,p}_loc(ℝ)` only for
  `p < 2`, so the conclusion "every `p`" is specific to Lipschitz maps.

*Needs:* §2.1; Tau Ceti `LocallyLipschitzOn.ae_differentiableAt_of_mem`,
`LocallyLipschitzOn.hasWeakFDerivOn_fderiv`; SobolevMapsBetweenManifolds §1.2, §4.2, §4.3 (gaps
`sobolev-maps-class`, `sobolev-maps-weak-differential`, `sobolev-maps-euclidean`).

### 2.9 Euclidean domains

Let `E` be an `n`-dimensional real inner product space with Lebesgue measure `volume`, and
`Ω ⊆ E` open. For a real `K` and `f : E → E`, define `IsQuasiregularOn`, the Euclidean
`K`-quasiregularity of `f` on `Ω`, as the conjunction of:

- `1 ≤ K` and `f` is continuous on `Ω`;
- there is `Du : E → (E →L[ℝ] E)` with `TauCeti.HasWeakFDerivOn volume Ω f Du` and `‖Du‖ⁿ`
  locally integrable on `Ω`;
- `‖Du(x)‖ⁿ ≤ K det Du(x)` for almost every `x ∈ Ω`, with the operator norm and Mathlib's
  `LinearMap.det`.

Give `E` an orientation `o` and let `Ω` and `E` carry the flat metric and the orientation `o`.
Prove that the restriction of `f` to the open submanifold `Ω` is `K`-quasiregular in the sense
of §2.1 if and only if `f` is Euclidean `K`-quasiregular on `Ω`. The statement does not depend
on `o`, since `J_f = det Du` for either choice used on both sides (MartioRickmanVaisala1969
Definition 2.20, lines 409–412; Prywes2019 lines 22–26). Route: SobolevMapsBetweenManifolds §7.1.

- The condition does not depend on the choice of `Du`: two weak derivatives agree almost
  everywhere on `Ω` (`TauCeti.HasWeakFDerivOn.ae_eq`).
- It is monotone in `K` for `K ≥ 1`, and it passes to open subsets of `Ω`
  (`TauCeti.HasWeakFDerivOn.mono`).
- For `f` differentiable at every point of `Ω` with `fderiv` locally integrable, `Du` may be
  taken to be `fderiv ℝ f` (`TauCeti.hasWeakFDerivOn_of_differentiableOn`), and the condition
  is the pointwise inequality of §2.7 almost everywhere.

**Checks.**

- The radial stretch `x ↦ |x|^{a−1} x` of `ℝⁿ`, `n ≥ 2`, `a > 0`, is smooth off `0`. Its derivative has
  singular values `a|x|^{a−1}` (radial, once) and `|x|^{a−1}` (tangential, `n − 1` times), and
  `‖Du‖ⁿ ≍ |x|^{n(a−1)}` is integrable near `0`. By `TauCeti.hasWeakFDerivOn_of_hasFDerivAt_off_countable`
  with the exceptional set `{0}` it lies in `W^{1,n}_loc`, with `K_O = a^{n−1}`, `K_I = a` for
  `a ≥ 1` and `K_O = 1/a`, `K_I = a^{1−n}` for `0 < a < 1`. In dimension one it has
  `K_O = K_I = 1` for every `a > 0`, its derivative `a|t|^{a−1}` being positive off `0`.
- For `a = 0` the map `x ↦ x/|x|` is not continuous at `0` and `|x|^{−n}` is not integrable
  there, so it is excluded twice.
- With `o` on `Ω` and `−o` on `E` the Jacobian is `−det Du`, and the identity is not
  quasiregular; the Euclidean condition, which uses `det`, does not see the orientation.
- The identity of a non-zero `E` satisfies the condition with `K = 1`: its weak derivative is the
  constant identity map, `‖id‖ⁿ = 1 = det id`.
- The fold `(x₁, …, xₙ) ↦ (|x₁|, x₂, …, xₙ)` has weak derivative `diag(sign x₁, 1, …, 1)`, with
  `‖Du‖ⁿ = 1` and `det Du = −1` on `{x₁ < 0}`, so it fails the condition for every `K`. A
  definition with `|det Du|` in place of `det Du` would accept it with `K = 1`.

*Needs:* for the definition and its API, Tau Ceti `TauCeti.HasWeakFDerivOn`,
`TauCeti.HasWeakFDerivOn.ae_eq`, `TauCeti.HasWeakFDerivOn.mono`,
`TauCeti.hasWeakFDerivOn_of_differentiableOn`,
`TauCeti.hasWeakFDerivOn_of_hasFDerivAt_off_countable` and Mathlib `LinearMap.det`; for the
agreement with §2.1, the definition of §2.1 and SobolevMapsBetweenManifolds §7.1 (gaps
`sobolev-maps-euclidean`, `sobolev-maps-jacobian`).

### 2.10 The plane and the Beltrami equation

Let `Ω ⊆ ℂ` be open with the standard orientation and flat metric. Let `f` be continuous with a
weak derivative `Du` such that `‖Du‖²` is locally integrable, and let `f_z`, `f_z̄` be its weak
Wirtinger derivatives (TeichmullerGeometry §7.4). Prove that for `K ≥ 1` and
`k = (K − 1)/(K + 1)`, `f` is `K`-quasiregular iff `|f_z̄| ≤ k |f_z|` almost everywhere. For
quasiregular `f`, prove `K_O(f) = (1 + k₀)/(1 − k₀)`, where `k₀` is the essential
supremum of `|f_z̄|/|f_z|` over `{f_z ≠ 0}` (and `k₀ = 0` if that set is null). Prove that every
orientation-preserving quasiconformal map of TeichmullerGeometry §7.4 with Beltrami coefficient
`μ`, `‖μ‖_∞ < 1`, is an injective `K`-quasiregular map with `K = (1 + ‖μ‖_∞)/(1 − ‖μ‖_∞)`.
Route: §1.5 pointwise, since `Du = f_z dz + f_z̄ dz̄`. On `{f_z = 0}` the inequality forces
`f_z̄ = 0`. For a sense-preserving homeomorphism, `K`-quasiconformal and `K`-quasiregular agree
(MartioRickmanVaisala1969 lines 420–422; Ahlfors2006, Ch. I).

**Checks.**

- `z ↦ z + a z̄`, `|a| < 1`: `f_z = 1`, `f_z̄ = a`, `K_O = (1 + |a|)/(1 − |a|)`, which is `3` for
  `a = 1/2`. This agrees with the dilatation of TeichmullerGeometry §7.4 for `μ = a`.
- `z ↦ z̄`: `f_z = 0`, `f_z̄ = 1`, `J = −1`; not quasiregular, and not orientation preserving in
  §7.4.
- A holomorphic `f` has `f_z̄ = 0`, so `k₀ = 0` and `K_O = 1`.

*Needs:* §1.5, §2.2, §2.9; TeichmullerGeometry §7.4; Mathlib `DifferentiableAt.conformalAt`.

### Examples

- `z ↦ z^m` on `ℂ`, `m ≥ 1`: `1`-quasiregular, `m`-to-one off `0`.
- The winding map of `ℝ³` (§2.8): `K_O = 4`, `K_I = 2`, branched along the axis.
- In each dimension `n ≥ 2` the radial stretches (§2.9) realise every value of `K_O ≥ 1`.

### Dependencies

Layer 1; SobolevMapsBetweenManifolds §1.2, §3.1, §4.2–§4.5, §5.1–§5.2, §6.1–§6.3 and §7.1;
DifferentialGeometry 12.1; Tau Ceti's measure, orientation and weak-derivative declarations;
TeichmullerGeometry §7.4 for §2.10.

## Layer 3: inner, maximal and Hilbert–Schmidt distortion

### 3.1 Inner and maximal distortion of a map

For quasiregular `f : M → N` define the inner distortion `K_I(f) = max(1, ess sup_x q_I(Df(x)))`,
and set `K_I(f) = ∞` for maps that are not quasiregular. Define the maximal distortion
`K(f) = max(K_O(f), K_I(f))`. Call `f` `K`-quasiregular in the maximal sense when `K(f) ≤ K`
(MartioRickmanVaisala1969 lines 413–419).

- For quasiregular `f`, `K_I(f)` is the least `K ≥ 1` with `J_f ≤ K ℓ(Df)ⁿ` almost everywhere.
- `K_I(f|_U) ≤ K_I(f)` for open `U`; for `C¹` quasiregular `f`, `K_I(f) = max(1, sup_x q_I(df_x))`.
- `K(f) < ∞` iff `f` is quasiregular.
- For quasiregular `f`: `K(f) = 1` iff `K_O(f) = 1` iff `K_I(f) = 1`.

**Checks.**

- The radial stretch of `ℝ³` with `a = 1/2` has `K_O = 2`, `K_I = 4`, `K = 4`; with `a = 2` it
  has `K_O = 4`, `K_I = 2`, `K = 4`.
- The projection `P` of §2.4 has `q_I(DP) = 0` everywhere but `K_I(P) = ∞`, since it is not
  quasiregular; defining `K_I` for every map by the essential supremum would give `1`.
- In dimension two `K_I = K_O`; `z + z̄/2` has `K_I = K_O = 3`.

*Needs:* §1.2, §2.2, §2.3, §2.4.

### 3.2 Comparison of inner and outer distortion

Prove MartioRickmanVaisala1969 (2.25), line 438: for quasiregular `f`,

    K_I(f) ≤ K_O(f)^{n−1}   and   K_O(f) ≤ K_I(f)^{n−1},

so `K_O(f) ≤ K(f) ≤ K_O(f)^{n−1}`. Both are best possible (line 439): for `n ≥ 2` and every
`s ≥ 1`, the radial stretch with `a = s` has `K_I = s`, `K_O = s^{n−1}`, and the one with
`a = 1/s` has `K_O = s`, `K_I = s^{n−1}`. Hence finite `K_O` and finite `K` single out the same
class, the quasiregular maps. A map `K`-quasiregular in the maximal sense
is `K`-quasiregular, and a `K`-quasiregular map is `K^{n−1}`-quasiregular in the maximal sense.
Route: at almost every point either `J_f > 0`, where §1.3 applies, or `Df = 0` (§2.4), where
both quotients vanish. Then pass to essential suprema, using that `t ↦ t^{n−1}` is monotone and
continuous on `[0, ∞]`.

On Euclidean domains this is MartioRickmanVaisala1969 (2.25) in its own setting, and it is
stated without the distortion functions, through the inequalities that define them. Let `E` be
an `n`-dimensional real inner product space, `Ω ⊆ E` open and `f : E → E`, with the Euclidean
quasiregularity of §2.9 (`IsQuasiregularOn`).

- If `f` is Euclidean `K`-quasiregular on `Ω`, then every weak derivative `Du` of `f` on `Ω`
  satisfies `det Du(x) ≤ K^{n−1} ℓ(Du(x))ⁿ` for almost every `x ∈ Ω`
  (`IsQuasiregularOn.det_le_pow_mul_minimalStretch_pow`). This is `K_I ≤ K_O^{n−1}`.
- If `f` is Euclidean `K'`-quasiregular on `Ω` for some `K'`, `1 ≤ K`, and some weak derivative
  `Du` of `f` on `Ω` satisfies `det Du(x) ≤ K ℓ(Du(x))ⁿ` for almost every `x ∈ Ω`, then `f` is
  Euclidean `K^{n−1}`-quasiregular on `Ω` (`IsQuasiregularOn.of_det_le_mul_minimalStretch_pow`).
  This is `K_O ≤ K_I^{n−1}`. The hypothesis that `f` is quasiregular is the one of the source
  and cannot be dropped (§3.3); `1 ≤ K` is needed for the conclusion `1 ≤ K^{n−1}`.

Route: at almost every `x ∈ Ω`, either `det Du(x) > 0`, where §1.3 applies to `A = Du(x)`, or
`det Du(x) ≤ 0`, where the outer inequality forces `Du(x) = 0` and both sides vanish (for
`n ≥ 1`). Two weak derivatives agree almost everywhere (`TauCeti.HasWeakFDerivOn.ae_eq`).

**Checks.**

- Winding map: `K_O = 4 = K_I²`.
- A linear map `diag(3, 2, 1)` of `ℝ³`, as a quasiregular map: `K_O = 9/2`, `K_I = 6`, both
  inequalities strict.
- `n = 1`: `K_O = K_I = 1` for every quasiregular map.
- The radial stretch with `a = 1/2` in `ℝ³`: `K_I = 4 = K_O²`.
- Euclidean form, radial stretch with `a = 1/2` in `ℝ³`: `‖Du‖ = |x|^{−1/2}`,
  `ℓ(Du) = |x|^{−1/2}/2` and `det Du = |x|^{−3/2}/2`. It is Euclidean `2`-quasiregular, since
  `|x|^{−3/2} ≤ 2 · |x|^{−3/2}/2`, and the first bullet gives
  `|x|^{−3/2}/2 ≤ 2² · |x|^{−3/2}/8`, an equality. With `K^{n−1}` replaced by `K` it would read
  `|x|^{−3/2}/2 ≤ |x|^{−3/2}/4`, which is false.
- Euclidean form, radial stretch with `a = 2` in `ℝ³`: `det Du = 2|x|³` and `ℓ(Du) = |x|`, so the
  inner inequality holds with `K = 2`; it is Euclidean `4`-quasiregular, and the second bullet
  gives `K^{n−1} = 4`, attained, since `‖Du‖³ = 8|x|³ = 4 · 2|x|³`.
- Euclidean form, the projection `(x₁, x₂) ↦ (x₁, 0)` of `ℝ²`: `det Du = 0 = ℓ(Du)`, so the
  inner inequality holds with `K = 1`, but it is not quasiregular (`‖Du‖² = 1 > 0 = K det Du`),
  and the second bullet does not apply to it.

*Needs:* §1.3, §2.4, §2.9, §3.1. The Euclidean form needs only §1.1, the definition of §2.9,
the singular-value argument of §1.3 for an endomorphism with `J = det` (Mathlib
`LinearMap.normDet_eq_prod_singularValues`, `LinearMap.normDet_eq_abs_det`), which does not use
the oriented Jacobian of the supplier, and Tau Ceti `TauCeti.HasWeakFDerivOn.ae_eq`.

### 3.3 The inner inequality does not define the class

Prove that for `n ≥ 2` the projection `P(x) = (x₁, …, x_{n−1}, 0)` of `ℝⁿ` lies in
`W^{1,∞}_loc` and satisfies `J_P ≤ 1 · ℓ(DP)ⁿ` everywhere, both sides being `0`, yet is not
quasiregular (MartioRickmanVaisala1969 lines 423–425). For `n = 1` the same formula is the zero
map, which is quasiregular.

**Checks.**

- `J_P = 0 = ℓ(DP)ⁿ`, while `‖DP‖ = 1`.
- `n = 1`: `P = 0`, `K_O(P) = 1`.

*Needs:* §2.4, §2.8, §3.1.

### 3.4 Hilbert–Schmidt distortion of a map

For continuous `f ∈ W^{1,n}_loc(M, N)` define `K_S(f) = max(1, ess sup_x q_S(Df(x)))`, and
`K_S(f) = ∞` for other maps. Prove MartioRickmanVaisala1969 (2.24), line 435:
`K_S(f) ≤ K_O(f) ≤ n^{n/2} K_S(f)`. The constants cannot be improved, and `f` is quasiregular iff
`K_S(f) < ∞`.

- For `K ≥ 1`, `K_S(f) ≤ K` iff `‖Df‖_HSⁿ ≤ n^{n/2} K J_f` almost everywhere, the normalisation
  (2.23).
- `K_S(f) = 1` iff `K_O(f) = 1`.

**Checks.**

- Identity: `K_S = K_O = 1`.
- The linear map `diag(2, 1)`: `K_S = 5/4`, `K_O = 2`.
- `diag(1, ε)`: `K_O/K_S = 2/(1 + ε²)`, approaching `n^{n/2} = 2` and never reaching it.

*Needs:* §1.4, §2.2, §2.3.

### Examples

| map | `K_O` | `K_I` | `K` | `K_S` |
| --- | --- | --- | --- | --- |
| identity, isometries, `z ↦ z²` | `1` | `1` | `1` | `1` |
| linear `diag(2, 1)` | `2` | `2` | `2` | `5/4` |
| winding map of `ℝ³` | `4` | `2` | `4` | `(4 + 1 + 1)^{3/2}/(3^{3/2} · 2) = √8/2 = √2` |
| radial stretch, `a ≥ 1` | `a^{n−1}` | `a` | `a^{n−1}` | `(a² + n − 1)^{n/2}/(n^{n/2} a)` |
| radial stretch, `0 < a < 1` | `1/a` | `a^{1−n}` | `a^{1−n}` | `(a² + n − 1)^{n/2}/(n^{n/2} a)` |

The rows for radial stretches assume `n ≥ 2`; in dimension one every radial stretch has all four
distortions equal to `1`. For the winding map, `‖Df‖_HS² = 6` and `J = 2`, so `q_S = 6^{3/2}/(3^{3/2} · 2) = 2^{3/2}/2 = √2`.
For the radial stretch, `q_S = (a² + (n − 1))^{n/2} |x|^{n(a−1)} / (n^{n/2} a |x|^{n(a−1)})`.

### Dependencies

Layers 1 and 2. The Euclidean form of §3.2 needs only §1.1, §1.3 and §2.9.

## Layer 4: invariance

### 4.1 Change of metric

Let `g_M`, `g'_M` be continuous metrics on `M` with `a|v| ≤ |v|' ≤ b|v|` for every tangent vector,
`0 < a ≤ b`, and `g_N`, `g'_N` continuous metrics on `N` with `α|w| ≤ |w|' ≤ β|w|`,
`0 < α ≤ β`, with unchanged orientations. Prove:

- membership in `W^{1,n}_loc(M, N)` and "almost everywhere" are unchanged;
- for linear `A : T_xM → T_yN`, `‖A‖' ≤ (β/a) ‖A‖`, and `J'(A) = J(A) ρ_N(y)/ρ_M(x)`, where
  `vol'_M = ρ_M vol_M` with `ρ_M ∈ [aⁿ, bⁿ]` and `vol'_N = ρ_N vol_N` with `ρ_N ∈ [αⁿ, βⁿ]`;
- hence `q'_O(A) ≤ (bβ/(aα))ⁿ q_O(A)`, `K'_O(f) ≤ (bβ/(aα))ⁿ K_O(f)`, and a `K`-quasiregular map
  for the unprimed metrics is `(bβ/(aα))ⁿ K`-quasiregular for the primed ones. The symmetric
  statement holds with the roles exchanged.
- Any two continuous metrics on a compact manifold are uniformly comparable. So for compact `M`
  and `N` the quasiregular maps `M → N` do not depend on the metrics, and for compact `N` the
  quasiregular maps `ℝⁿ → N` depend only on the smooth structure and the orientation of `N`.
- Conformal changes leave the distortion quotients unchanged pointwise. If `g'_M = e^{2u} g_M`
  and `g'_N = e^{2w} g_N` for continuous `u`, `w`, bounded or not, then `‖A‖' = e^{w(y) − u(x)} ‖A‖`
  and `J'(A) = e^{n(w(y) − u(x))} J(A)`. So `q'_O = q_O`, `q'_I = q_I`, and every distortion of
  every map is unchanged.

Route: the second metric through `TauCeti.WithMetric`; the density `ρ_M` is the square root of
the Gram determinant of `g'_M` in a `g_M`-orthonormal basis, whose eigenvalues lie in
`[a², b²]` (`Orientation.volumeForm_robust`, `TauCeti.riemannianVolumeForm`); the norm comparison
of SobolevMapsBetweenManifolds §5.3 (Rickman1993, Ch. I; HeikkilaPankka2025 lines 20–27).

**Checks.**

- `g'_N = c² g_N` with `c > 0` constant and `g'_M = g_M`: `a = b = 1`, `α = β = c`, factor
  `(c/c)ⁿ = 1`, and indeed `q'_O(A) = cⁿ ‖A‖ⁿ/(cⁿ J(A)) = q_O(A)`.
- `T² = ℝ²/ℤ²` with `g' = dx² + 4 dy²`, compared with the flat metric (`α = 1`, `β = 2`): the
  projection has `‖dπ‖' = 2`, `ρ_N = 2`, `J' = 2`, so `q'_O = 4/2 = 2 ≤ (2/1)² · 1 = 4`.
- `ℝ²` with `g' = dx² + e^{2x} dy²`, not comparable to the flat metric: the identity from flat
  `ℝ²` has `‖id‖' = max(1, eˣ)` and `J' = eˣ`, so `q'_O = e^{|x|}`. It is quasiregular on every
  bounded set and not on `ℝ²`.
- The conformal metric `e^{2x}(dx² + dy²)` on the target, which is not comparable to the flat
  metric either: the identity from flat `ℝ²` has `‖id‖' = eˣ` and `J' = e^{2x}`, so `q'_O = 1`.
  The comparison bound of the third bullet is infinite here, while the conformal statement gives
  the exact value.

*Needs:* §1.2, §2.1, §2.2; for the conformal bullet also §1.4, §3.1 and §3.4; Tau Ceti
`TauCeti.WithMetric`, `TauCeti.riemannianVolumeForm`; Mathlib `Orientation.volumeForm_robust`;
SobolevMapsBetweenManifolds §4.5, §5.3, §6.2 (gaps `sobolev-maps-class`, `sobolev-maps-norm`,
`sobolev-maps-jacobian`).

### 4.2 Orientations

Prove that `f` is `K`-quasiregular for `(o_M, o_N)` iff it is for `(−o_M, −o_N)`, with the same
`J_f`, `K_O(f)` and `K_I(f)`. For `(o_M, −o_N)` the Jacobian is `−J_f`. If `f` is quasiregular
for both `(o_M, o_N)` and `(o_M, −o_N)`, then `Df = 0` almost everywhere, and `f` is constant on
each component of `M` (§2.6). Route: `Orientation.volumeForm_neg_orientation` and the sign law of
SobolevMapsBetweenManifolds §6.2 (HeikkilaPankka2025 lines 20–27).

**Checks.**

- The identity `(M, o) → (M, −o)`, `M` non-empty: `J = −1`, not quasiregular.
- The reflection `R(x₁, …, xₙ) = (−x₁, x₂, …, xₙ)` from `(ℝⁿ, std)` to `(ℝⁿ, −std)`: its
  Jacobian is `−det R = 1`, so it is `1`-quasiregular.
- Constant maps are quasiregular for all four pairs of orientations.

*Needs:* §2.2, §2.4, §2.6, §3.1; Mathlib `Orientation.volumeForm_neg_orientation`;
SobolevMapsBetweenManifolds §6.2 (gap `sobolev-maps-jacobian`).

### 4.3 Precomposition with local diffeomorphisms

Let `M'` be an oriented Riemannian `n`-manifold and `θ : M' → M` a `C¹` local diffeomorphism,
orientation preserving at every point (`TauCeti.Manifold.Orientation.IsOrientationPreservingAt`),
with `K_θ = max(1, sup_y q_O(dθ_y)) < ∞`. Prove that if `f` is `K`-quasiregular then `f ∘ θ` is
`K_θ K`-quasiregular, `K_O(f ∘ θ) ≤ K_O(θ) K_O(f)` and `K_I(f ∘ θ) ≤ K_I(θ) K_I(f)`; when `M'` is
compact, `K_θ < ∞` automatically. Route: the chain rule of SobolevMapsBetweenManifolds §4.6(a),
with null preimages of null sets (its §3.3), and §1.2 submultiplicativity. The sign hypotheses of
`q_I`-submultiplicativity hold because `J(dθ) > 0` everywhere and `J_f ≥ 0` almost everywhere
(Rickman1993, Ch. I).

**Checks.**

- `f ∘ π` for the projection `π : ℝⁿ → ℝⁿ/ℤⁿ` (`K_π = 1`) has the same `K_O` as `f`.
- `θ` the shear of §2.5 and `f = id`: `θ` is a smooth orientation-preserving diffeomorphism with
  `K_θ = ∞`, and `id ∘ θ = θ` is not quasiregular, so bounded distortion is used.
- `θ = R` the reflection, with standard orientations on both sides: `id ∘ R` has `J = −1`, so
  orientation preservation is used.

*Needs:* §1.2, §2.1, §2.7, §3.1; Tau Ceti `TauCeti.Manifold.Orientation.IsOrientationPreservingAt`;
SobolevMapsBetweenManifolds §3.3, §4.6(a), §6.1 (gaps `sobolev-maps-chain-rules`, `sobolev-maps-jacobian`).

### 4.4 Postcomposition with `C¹` quasiregular maps

Let `P` be an oriented Riemannian `n`-manifold and `g : N → P` a `C¹` map with
`‖dg_y‖ⁿ ≤ K' J(dg_y)` for every `y`, that is, a `C¹` `K'`-quasiregular map (§2.7). Prove that
if `f : M → N` is `K`-quasiregular then `g ∘ f` is `K' K`-quasiregular,
`K_O(g ∘ f) ≤ K_O(g) K_O(f)` and `K_I(g ∘ f) ≤ K_I(g) K_I(f)`. Route: the chain rule of
SobolevMapsBetweenManifolds §4.6(b), which needs no bound on `dg` because `f` is continuous and the
class is local, and §1.2 submultiplicativity with `J(dg) ≥ 0` everywhere and `J_f ≥ 0` almost
everywhere (Rickman1993, Ch. I). The composition of two quasiregular maps with no `C¹` factor is
QuasiregularMaps, Part II.

**Checks.**

- `z ↦ z²` after `z ↦ z²` is `z ↦ z⁴`, `1`-quasiregular.
- An orientation-preserving isometry after `f` leaves `K_O(f)` unchanged.
- In `ℝ³`, the radial stretch with `a = 2`, which is `C¹` with `df_0 = 0` and `4`-quasiregular,
  after the one with `a = 1/2`, which is `2`-quasiregular, is the identity. Its `K_O = 1` is
  within the bound `4 · 2 = 8`.

*Needs:* §1.2, §2.1, §2.7, §3.1; SobolevMapsBetweenManifolds §4.6(b), §6.1 (gaps
`sobolev-maps-chain-rules`, `sobolev-maps-jacobian`).

### Examples

- On a compact `N`, replacing the metric by a conformal one `e^{2u} g_N` leaves `K_O` unchanged.
  The comparison of §4.1 with `α = e^{min u}`, `β = e^{max u}` gives only the factor
  `e^{n(max u − min u)}`.
- For `M'` the flat torus `ℝⁿ/Λ` and `θ` its orbit projection, quasiregular maps on the torus
  pull back to quasiregular maps of `ℝⁿ` with the same distortion.

### Dependencies

Layers 1–3; SobolevMapsBetweenManifolds §3.3, §4.5–§4.6, §5.3 and §6.1–§6.2; Tau Ceti's metric-copy and volume-form
declarations.

## Layer 5: `ACL^p` maps and the classical definition

Throughout, `Ω ⊆ ℝⁿ` is open, `ℝⁿ = EuclideanSpace ℝ (Fin n)` with coordinates `xᵢ` and standard
basis `eᵢ`, and `F` is a real normed space. The definitions of §5.1 allow any such `F`;
its differentiation and stability assertions below, and §5.2, assume `F` finite-dimensional.
A closed coordinate box
is `Q = Π_j [a_j, b_j]` with `a_j < b_j` for every `j`. For `x ∈ Q` and a coordinate `i`, the
line function through `x` is `t ↦ u(x + (t − xᵢ) eᵢ)` on `[aᵢ, bᵢ]`: the restriction of `u` to
the segment of `Q` through `x` parallel to the `i`-th axis, with `t` the `i`-th coordinate.

### 5.1 `ACL` and `ACL^p` maps

Define the formal derivative `u'(x)` (`formalDeriv`) of `u : ℝⁿ → F` at `x` as the linear map
`ℝⁿ → F` with `u'(x) eᵢ = ∂ᵢu(x)` for every `i`. Here `∂ᵢu(x)` is Mathlib's `lineDeriv ℝ u x eᵢ`,
the derivative at `0` of `t ↦ u(x + t eᵢ)`, which is `0` where that derivative does not exist
(MartioRickmanVaisala1969 lines 118–121).

Call `u` `ACL` on `Ω` (`IsACLOn`) when `u` is continuous on `Ω` and, for every closed coordinate
box `Q ⊆ Ω` and every `i`, the line function through `x` is absolutely continuous on `[aᵢ, bᵢ]`
(Mathlib's `AbsolutelyContinuousOnInterval`) for almost every `x ∈ Q`. For an exponent
`0 < p ≤ ∞`, call `u` `ACL^p` on `Ω` (`IsACLpOn`) when it is `ACL` on `Ω` and `u'` lies in `L^p`
on every compact subset of `Ω` (MartioRickmanVaisala1969 Definition 2.16, lines 332–340, where
the boxes are open `n`-intervals with closure in `Ω`, the segments are those of the closure, and
`p ≥ 1`). The theorems of §5.2 assume `p ≥ 1`, and a Check there shows that they need it. The
Lean definition accepts every `p : ℝ≥0∞`; at `p = 0` its integrability clause asks only
almost-everywhere strong measurability (Mathlib's
`MeasureTheory.memLp_zero_iff_aestronglyMeasurable`). The only statement that reaches that value
is §5.3 in dimension `0`, where `ℝ⁰` is a point and both sides of the equivalence hold
(Conventions).

- The line function through `x` depends only on the coordinates of `x` other than the `i`-th.
  So, by Fubini's theorem (`MeasureTheory.volume_preserving_piFinSuccAbove`), "for almost every
  `x ∈ Q`" is equivalent to the condition of the source, that the points of the face
  `Π_{j ≠ i} [a_j, b_j]` whose segment is exceptional form a set of `(n − 1)`-dimensional measure
  zero. The equivalence uses `aᵢ < bᵢ`.
- For finite-dimensional `F`, the partial derivatives of an `ACL` map exist almost everywhere
  on `Ω`, by the scalar `AbsolutelyContinuousOnInterval.ae_differentiableAt` on lines,
  componentwise in a basis of `F`, and Fubini. The formal derivative of a map continuous on `Ω`
  is measurable on `Ω`, by the argument of Mathlib's `measurable_lineDeriv`. Thus for an `ACL`
  map into this `F`, `u'` is the derivative along coordinate lines up to a null set, and its
  value `0` where a partial derivative fails to exist plays no role.
- `u'(x) = fderiv ℝ u x` wherever `u` is differentiable at `x`.
- `ACL^p` is local, passes to open subsets, is closed under linear combinations and under
  composition with continuous linear maps `F → F'`, and `ACL^q` implies `ACL^p` for `p ≤ q`.
- `C¹` maps are `ACL^p` for every `p`; locally Lipschitz maps are `ACL^∞`.

**Checks.**

- For `F = C([0, 1], ℝ)` with the supremum norm, `u(t)(s) = |t − s|` on `(0, 1)` satisfies
  `‖u(t) − u(r)‖ = |t − r|`, so it is `1`-Lipschitz and `ACL`. At every `t`, evaluation at
  `s = t` gives difference quotients `+1` for positive increments and `−1` for negative ones;
  no norm derivative exists. The finite-dimensional hypothesis is essential for the
  almost-everywhere differentiation assertion. For the scalar map `t ↦ |t − s₀|`, the
  derivative is `−1` for `t < s₀` and `+1` for `t > s₀`, failing only at `s₀`.
- `u(x) = |x₁|` on `ℝ²` is `ACL^∞`, with `u'(x)` the row `(sign x₁, 0)` off the line `x₁ = 0`.
  On that line `∂₁u` does not exist and `u'` has first entry `0`; the line is a null set.
- `u(x) = c(x₁)` on `ℝ²`, with the Cantor function `c` (Tau Ceti's `TauCeti.cantorFunction`),
  has partial derivatives `0` almost everywhere. On the box `[0, 1]²` every line function in the
  first direction is `c` on `[0, 1]`, which is not absolutely continuous
  (`TauCeti.not_absolutelyContinuousOnInterval_cantorFunction`), so `u` is not `ACL`. A
  definition asking only for partial derivatives almost everywhere would accept it.
- `u(x) = |x|^{1/2}` on `ℝ²` is `ACL^p` exactly for `p < 4`, since `|∇u| = |x|^{−1/2}/2` and
  `∫_{|x|<1} |x|^{−p/2} dx = 2π ∫₀¹ r^{1 − p/2} dr < ∞` iff `p < 4`.
- The indicator of `{0}` in `ℝ²` is absolutely continuous on every coordinate segment missing
  `0`, hence on almost every one, but it is not continuous, so it is not `ACL`.
- The formal derivative takes partial derivatives as columns. For `u(x₁, x₂) = (x₂, 0)` on `ℝ²`,
  `∂₁u = 0` and `∂₂u = e₁`, so `u'(x)` is `e₁ ↦ 0`, `e₂ ↦ e₁`, the matrix `[[0, 1], [0, 0]]`,
  which is `fderiv ℝ u x`. Rows in place of columns would give `[[0, 0], [1, 0]]`, the map
  `e₁ ↦ e₂`, which is not the derivative.
- The segment through `x` is the one of the box. For `x = (1/2, 1/2)` in the box `[0, 1]²` and
  `i = 2`, the line function is `t ↦ u(1/2, t)` on `[0, 1]`. The unshifted `t ↦ u(x + t e₂)` on
  `[a₂, b₂] = [0, 1]` would read `u` on the segment from `(1/2, 1/2)` to `(1/2, 3/2)`, which leaves
  the box.

*Needs:* Mathlib `lineDeriv`, `fderiv`, `measurable_lineDeriv`, `AbsolutelyContinuousOnInterval`,
`AbsolutelyContinuousOnInterval.ae_differentiableAt`, `MeasureTheory.volume_preserving_piFinSuccAbove`,
`MeasureTheory.MemLp`; Tau Ceti `TauCeti.cantorFunction`,
`TauCeti.not_absolutelyContinuousOnInterval_cantorFunction` (for the Checks).

### 5.2 `ACL^p` maps are the continuous Sobolev maps

Prove that for `1 ≤ p ≤ ∞`, a finite-dimensional `F` and `u` continuous on `Ω`, `u` is `ACL^p`
on `Ω` if and only if there is `Du` with `TauCeti.HasWeakFDerivOn volume Ω u Du` and `Du` in
`L^p` on every compact subset of `Ω` (`isACLpOn_iff_exists_hasWeakFDerivOn`; Vaisala1971, Ch. 3;
Rickman1993, Ch. I). Prove also that if `u` is continuous on `Ω` and `Du` is any weak derivative
of `u` on `Ω`, then for almost every `x ∈ Ω` and every `i` the partial derivative `∂ᵢu(x)` exists
and equals `Du(x) eᵢ` (`ae_hasLineDerivAt_of_hasWeakFDerivOn`); in particular `Du = u'` almost
everywhere on `Ω`. That statement needs no exponent beyond the local integrability that is part
of a weak derivative. The equality `Du = u'` alone would not contain the existence of the partial
derivatives, since `u'` is `0` where one fails to exist.

Route. (⇒) For a test function `φ` supported in a box, Fubini splits off the `i`-th coordinate.
Integration by parts for absolutely continuous functions on almost every line
(`AbsolutelyContinuousOnInterval.integral_mul_deriv_eq_deriv_mul`) gives the weak derivative in
direction `eᵢ`; it is locally integrable because `p ≥ 1`. `Module.Basis.hasWeakFDerivOn_of_forall`
assembles the directions, and locality is `TauCeti.hasWeakFDerivOn_iff_forall_isCompact_closure`.
(⇐) Test the weak identity against products `φ(z) ψ(t)`, and use a countable family of `ψ` dense
in the test functions of `(aᵢ, bᵢ)`, with `IsOpen.ae_eq_zero_of_integral_contDiff_smul_eq_zero`.
This shows that for almost every `z` the line function has weak derivative `t ↦ Du(z, t) eᵢ`,
which is integrable by Fubini. The continuous line function is then absolutely continuous
(`TauCeti.HasWeakLineDerivOn.absolutelyContinuousOnInterval`) and differentiable almost everywhere
with that derivative (`TauCeti.HasWeakLineDerivOn.ae_hasDerivAt`), which is the one-dimensional
statement of PDE §1.1. Since a compact box in `Ω` lies in a slightly larger open box in `Ω`, the
closed segments of the definition are covered. The same argument gives `Du = u'` almost
everywhere, and then `u'` is in `L^p` on compact sets because `Du` is.

**Checks.**

- `|x|^{1/2}` has a weak derivative on `ℝ²` in `L^p` on compact sets iff `p < 4`, matching §5.1.
- The Cantor example of §5.1 is in neither class: it is not `ACL`, and a weak derivative would
  equal its formal derivative `0` almost everywhere, which would make `c` constant on lines.
- A `C¹` map is in both classes, with `Du = fderiv ℝ u = u'`.
- For `u(x) = |x₁|` on `ℝ²`, `Du(x)` is the row `(sign x₁, 0)` almost everywhere and `u'` agrees
  with it off the null line `x₁ = 0`.
- The hypothesis `p ≥ 1` is used. For `k ≥ 1` let `χ_k` be a smooth bump of height `1` supported in
  the strip `{|y − 2^{−k}| < 8^{−k}}` (these strips are disjoint), with `|χ_k'| ≲ 8^k`, and let
  `u(x, y) = Σ_k 2^{−k} χ_k(y) sin(16^k x)` on `ℝ²`. It is continuous (`|u| ≤ 2^{−k}` on the `k`-th
  strip) and `ACL`: on a horizontal segment it is smooth, and on a vertical one it is a sum of
  smooth functions whose derivatives have `L¹` norms summing to at most `Σ_k 2 · 2^{−k}`, so it is
  absolutely continuous. Its partial derivatives are in `L^{1/2}` on compact sets, the `k`-th strip
  contributing about `8^{−k/2}` to `∫ |∂₁u|^{1/2}` and `4^{−k}` to `∫ |∂₂u|^{1/2}`. But
  `∫_{[0,1]²} |∂₁u|` is about `Σ_k 2^{−k} 16^k 8^{−k} = Σ_k 1 = ∞`. So `u` is `ACL^{1/2}` and has
  no weak derivative, since one would equal `u'` almost everywhere.

*Needs:* §5.1; PDE §1.1 (the one-dimensional case, through Tau Ceti); Mathlib
`AbsolutelyContinuousOnInterval.integral_mul_deriv_eq_deriv_mul`,
`IsOpen.ae_eq_zero_of_integral_contDiff_smul_eq_zero`, `MeasureTheory.volume_preserving_piFinSuccAbove`;
Tau Ceti `TauCeti.HasWeakFDerivOn`, `Module.Basis.hasWeakFDerivOn_of_forall`,
`TauCeti.hasWeakFDerivOn_iff_forall_isCompact_closure`,
`TauCeti.HasWeakLineDerivOn.absolutelyContinuousOnInterval`, `TauCeti.HasWeakLineDerivOn.ae_hasDerivAt`.

### 5.3 Agreement with Martio–Rickman–Väisälä

Prove that for open `G ⊆ ℝⁿ`, `f : ℝⁿ → ℝⁿ` and `K ≥ 1`, `f` is Euclidean `K`-quasiregular on
`G` (§2.9) if and only if `f` is `ACLⁿ` on `G` and `‖f'(x)‖ⁿ ≤ K det f'(x)` for almost every
`x ∈ G`, with `f'` the formal derivative (`isQuasiregularOn_iff_isACLpOn`). The right-hand side
is the definition of a quasiregular map in MartioRickmanVaisala1969 Definition 2.20 and (2.21),
lines 409–411, where the Jacobian `J(x, f)` of line 124 is the determinant of the derivative,
`det f'(x)`. With §2.9, `f` is `K`-quasiregular in the sense of §2.1 for the standard orientation
and flat metric if and only if it is quasiregular in the sense of Martio–Rickman–Väisälä with
outer dilatation at most `K`.

Prove also that the outer, inner and maximal dilatations of MartioRickmanVaisala1969
(lines 412–419) are `K_O(f)`, `K_I(f)` and `K(f)` of §2.2 and §3.1, including the value `∞` for
maps that are not quasiregular. Their "`K`-quasiregular" (line 418) is `K`-quasiregular in the
maximal sense. Route: §5.2 with `p = n`, which gives `Du = f'` almost everywhere, and §2.9.

**Checks.**

- The radial stretch with `a = 1/2` in `ℝ³` is `2`-quasiregular here. In the terminology of
  MartioRickmanVaisala1969 it is `4`-quasiregular and not `2`-quasiregular, since `K = 4`.
- The identity has all dilatations `1` in both terminologies.
- The hypothesis `K ≥ 1` is used: for `K = 0` and a constant `f`, `‖f'‖ⁿ = 0 ≤ 0 · det 0` holds
  and `f` is `ACLⁿ`, while Euclidean `0`-quasiregularity fails because it asks `1 ≤ K`.
- In dimension one, `f(t) = max(0, t)` on `G = ℝ` satisfies both sides with `K = 1`:
  `f' = 1` on `(0, ∞)` and `0` on `(−∞, 0]`, and `|f'| = f'` everywhere.

*Needs:* the definition of §2.9 and §5.2 for the equivalence; the agreement of §2.9 with §2.1
for the sentence after it; §3.1 for the dilatations.

### Examples

- `u(x) = |x|^{−β}` on `ℝⁿ ∖ {0}` extended arbitrarily at `0` is not continuous for `β > 0`, so
  it is not `ACL`, even when `β < (n − p)/p` makes it `W^{1,p}_loc`. The continuity requirement is
  part of both sides of §5.2.

### Dependencies

Mathlib's absolutely continuous functions, line derivatives and Fubini; Tau Ceti's weak
derivatives and their one-dimensional line lemmas, which implement PDE §1.1; §2.9 and §3.1 for
§5.3 only.

## Layer 6: piecewise smooth and simplicial maps

Throughout, a `C¹` smooth triangulation of `M` is a homeomorphism
`κ : AbstractSimplicialComplex.Realization K ≃ₜ M` with `TauCeti.IsSmoothTriangulation` at
smoothness exponent `1`. For a simplex `σ` of `K`, `σ°` is its open simplex (all barycentric
coordinates of its vertices positive).

### 6.1 Smooth triangulations of boundaryless manifolds

Prove, for a `C¹` smooth triangulation `κ` of a boundaryless `n`-manifold `M` (`n ≥ 1`):

- `K` is locally finite: every simplex of `K`, in particular every vertex, is a face of only
  finitely many simplices; and every compact subset of `M` meets `κ(σ)` for only finitely many
  simplices `σ`;
- `K` is pure of dimension `n` (`PreAbstractSimplicialComplex.IsPure`): every simplex is a face
  of an `n`-simplex, and there are no simplices of dimension above `n`;
- the image under `κ` of the union of the simplices of dimension below `n` is a null set
  (`TauCeti.IsNullSet`);
- for each `n`-simplex `σ`, `κ(σ°)` is open in `M` and `κ` restricts to a `C¹` diffeomorphism of
  `σ°` onto it;
- for each `n`-simplex `σ`, `κ|σ` is locally bi-Lipschitz in charts: for every `x ∈ σ` there
  are a neighbourhood `σ'` of `x` in `σ` and constants `0 < c ≤ C` such that `κ(σ')` lies in the
  source of the chart `φ = extChartAt 𝓘(ℝ, E) (κ x)` of `M` and
  `c |y − z| ≤ |φ(κ y) − φ(κ z)| ≤ C |y − z|` for all `y, z ∈ σ'`. Here `σ` carries its barycentric
  coordinates, as a subset of `σ → ℝ` with a fixed norm (`TauCeti.IsSimplexImmersion`). A closed
  simplex image need not lie in one chart domain, so the property is stated point by point; any
  other chart at `κ x` gives the same property after shrinking `σ'`, since transition maps are
  `C¹` with invertible differentials.

Route. Local finiteness uses the local compactness of `M`, which holds because `E` is
finite-dimensional (`Manifold.locallyCompact_of_finiteDimensional`); the realization alone does
not give it. Let `p` be a point of the realization with carrier `τ`, the support of its
barycentric coordinates (`AbstractSimplicialComplex.carrier`), and let `C` be a compact
neighbourhood of `p`, the preimage under `κ` of a compact neighbourhood of `κ p`. The carriers of
the points of `C` are subsets of one finite vertex set `V`
(`AbstractSimplicialComplex.exists_finset_support_subset_of_isCompact`). For every simplex
`σ ⊇ τ`, with barycentre `b_σ` (`AbstractSimplicialComplex.faceBarycenter`), the point
`(1 − t) p + t b_σ` has carrier `σ` for `0 < t ≤ 1` and tends to `p` as `t → 0`, since it moves
along a segment of the closed simplex `σ` and `AbstractSimplicialComplex.continuous_faceInclusion`
holds. It lies in `C` for small `t`, so `σ ⊆ V`. Hence only finitely many simplices contain `τ`;
every simplex is the carrier of its barycentre, so this holds for every simplex. A compact
`C' ⊆ M` meets `κ(σ)` only if some face `τ` of `σ` is the carrier of a point of `κ⁻¹(C')`. Such
`τ` are subsets of one finite vertex set by the same lemma, so there are finitely many of them,
and each is a face of finitely many `σ`.

The null images come from `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank` in
charts. A maximal simplex `τ` has `τ°` open in the realization. If `dim τ < n` then `κ(τ°)`
would be a non-empty open null set, which is impossible (`TauCeti.IsNullSet.interior_eq_empty`).
If `dim τ > n`, an injective differential from a space of dimension above `n` into `ℝⁿ` is
impossible. For the local bi-Lipschitz property at `x ∈ σ`, the chart representative `φ ∘ κ` is
`C¹` within `σ` near `x`, with a continuous family `A(y)` of derivatives within `σ`. The
derivative `A(x)` is injective on the directions of `σ`, the vectors with coordinate sum zero
(`TauCeti.IsSimplexImmersion`). Since `y − z` is such a direction for `y, z ∈ σ`, there is
`c₀ > 0` with `|A(x)(y − z)| ≥ c₀ |y − z|`. Choose `σ'` a small convex neighbourhood of `x` in `σ`
on which `‖A(y) − A(x)‖ ≤ c₀/2` and `‖A(y)‖` is bounded. The mean value inequality against the
fixed map `A(x)` (`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le'`) gives the lower bound
with `c = c₀/2`, and the mean value inequality
(`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`) gives the upper bound. The notion
of piecewise smooth triangulation is HeikkilaPankka2025 Appendix B, lines 1236–1245, which asks
for an extension of `κ|σ` to a neighbourhood of `σ` in its plane. The within-simplex formulation
of `TauCeti.IsSmoothTriangulation` suffices for every statement here.

**Checks.**

- The boundary of a triangle, mapped onto the unit circle by radial projection, is a `C¹` smooth
  triangulation of `S¹`. Its complex is pure of dimension `1`, and the image of its `0`-skeleton
  is `3` points, a null set. For the inscribed triangle with vertices at angles `0`, `2π/3`,
  `4π/3`, the edge `p(t) = (1 − t)v₀ + t v₁` has `|p(t)|² = 1 − 3t + 3t² ∈ [1/4, 1]`, and its
  angle has `dθ/dt = (√3/2)/|p(t)|²`, between `√3/2` and `2√3`. The image arc has length `2π/3`
  and misses the antipode of each of its points, so it lies in the stereographic chart at any of
  them, and the edge is bi-Lipschitz there.
- The boundary of a tetrahedron radially projected onto `S²` is pure of dimension `2`; the image
  of its `1`-skeleton is `6` great-circle arcs, a null set.
- Following a triangulation of `[0, 1]` by `t ↦ t²` gives a homeomorphism whose differential
  vanishes at `0`. Tau Ceti's `TauCeti.exists_contMDiff_not_isSmoothTriangulation_trans` shows it is not
  a `C¹` triangulation, and its inverse `t ↦ √t` is not Lipschitz near `0`, so the local
  bi-Lipschitz statement at the vertex `0` uses the injectivity of the differential.
- The infinite star, one vertex `v` joined by an edge to each of infinitely many vertices, is
  not locally finite, although every compact subset of its realization lies in a finite
  subcomplex: `{v}` is compact, has carrier `{v}`, and meets every closed edge. Every
  neighbourhood of `v` meets every open edge, so none is compact, and the route above does not
  apply; nor is the realization a `1`-manifold, since removing `v` from any neighbourhood of `v`
  leaves infinitely many components, while a point of a `1`-manifold has an interval
  neighbourhood that it cuts into two. Local finiteness is a consequence of the manifold, not of
  the realization.

*Needs:* Mathlib `extChartAt`, `Manifold.locallyCompact_of_finiteDimensional`,
`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`,
`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le'`; Tau Ceti `TauCeti.IsSmoothTriangulation`,
`TauCeti.IsSimplexImmersion`,
`AbstractSimplicialComplex.Realization`, `AbstractSimplicialComplex.carrier`,
`AbstractSimplicialComplex.faceBarycenter`, `AbstractSimplicialComplex.continuous_faceInclusion`,
`AbstractSimplicialComplex.exists_finset_support_subset_of_isCompact`,
`PreAbstractSimplicialComplex.IsPure`, `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank`,
`TauCeti.IsNullSet.interior_eq_empty`; GeometricTopology Layer 11.

### 6.2 Simplicial maps between triangulated manifolds

Let `κ₁` and `κ₂` be `C¹` smooth triangulations of `M` and `N`, and `s : K₁ → K₂` a simplicial
map (`PreAbstractSimplicialComplex.SimplicialMap`) with realization `|s|`
(`PreAbstractSimplicialComplex.SimplicialMap.realizationMap`). The simplicial map of manifolds
is `p = κ₂ ∘ |s| ∘ κ₁⁻¹ : M → N`. It is non-degenerate when `s` is injective on the vertices of
every simplex of `K₁`. It is orientation preserving when for every `n`-simplex `σ` of `K₁` and
every `x ∈ κ₁(σ°)`, `p` is orientation preserving at `x`
(`TauCeti.Manifold.Orientation.IsOrientationPreservingAt`). This is the setting of
HeikkilaPankka2025 Proposition B.1, lines 1247–1251.

- `p` is continuous. For non-degenerate `p` and an `n`-simplex `σ`, `|s|` maps `σ` affinely and
  bijectively onto the `n`-simplex `s(σ)`. The restriction of `p` to `κ₁(σ)` is
  `κ₂ ∘ L_σ ∘ (κ₁|σ)⁻¹`, `C¹` within `κ₁(σ)`, with invertible differential at every point of
  `κ₁(σ)`, boundary points included (HeikkilaPankka2025 lines 1322–1327 build the corresponding
  local diffeomorphisms `ϕᵢ`).
- If `p` is non-degenerate and orientation preserving, `J(dp) > 0` on the whole closed `κ₁(σ)`,
  since `J(dp)` is continuous there, positive on `κ₁(σ°)` and nowhere zero.
- If `p = κ₂ ∘ |s| ∘ κ₁⁻¹` and `q = κ₃ ∘ |t| ∘ κ₂⁻¹` then `q ∘ p = κ₃ ∘ |t ∘ s| ∘ κ₁⁻¹`, and it is
  non-degenerate and orientation preserving when `p` and `q` are. The identity is such a map.

**Checks.**

- The identity, with `κ₂ = κ₁` and `s = id`, is non-degenerate and orientation preserving.
- Take a locally finite triangulation of `ℝ²` symmetric under `x₁ ↦ −x₁`, with the line `x₁ = 0`
  in its `1`-skeleton. The fold `(x₁, x₂) ↦ (|x₁|, x₂)` is then simplicial and non-degenerate,
  but orientation reversing on `x₁ < 0`.
- A simplicial map with exactly one pair of identified vertices in an `n`-simplex and all
  other vertex images distinct collapses that simplex onto an `(n−1)`-simplex. For a triangle
  the affine map has rank `1`; sending all three vertices to one vertex instead gives rank `0`.
- Sending every vertex of a triangulated manifold to one target vertex gives a constant
  simplicial map. For `n ≥ 1` its differential has rank `0`, norm `0` and Jacobian `0`, so it
  satisfies `0 ≤ 1 · 0` and is `1`-quasiregular despite being degenerate.

*Needs:* §6.1; Tau Ceti `PreAbstractSimplicialComplex.SimplicialMap`,
`PreAbstractSimplicialComplex.SimplicialMap.realizationMap`,
`TauCeti.Manifold.Orientation.IsOrientationPreservingAt`; GeometricTopology Layer 11.

### 6.3 Piecewise `C¹` maps are locally Lipschitz

Let `κ` be a `C¹` smooth triangulation of `M` and `p : M → N` a map such that for every
`n`-simplex `σ` the composite `p ∘ κ` is `C¹` within `σ`. Prove that `p` is continuous and
locally Lipschitz in charts. By §2.8 it then lies in `W^{1,∞}_loc(M, N) ⊆ W^{1,n}_loc(M, N)`, and
the classical differential of `p|κ(σ°)` exists at every `x ∈ κ(σ°)`. The chosen weak
differential `Dp` agrees with this classical differential almost everywhere on each simplex
interior, hence almost everywhere on `M` by the null lower skeleton and countable local
finiteness of §6.1.
HeikkilaPankka2025 Lemma B.2, lines 1255–1260, gives the case of closed `M` with a proof through
Stokes' theorem (lines 1261–1316). Route here:

- continuity, by the pasting lemma for the locally finite closed cover by the `κ(σ)` (§6.1);
- Lipschitz bounds near each point of each `κ(σ)` in chart coordinates. Take `x ∈ σ`, the
  chart `φ` of `M` at `κ x` and a chart `ψ` of `N` at `p(κ x)`. Then `ψ ∘ p ∘ κ` is Lipschitz on
  a small convex neighbourhood of `x` in `σ`, by the mean value inequality
  (`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`). The local bi-Lipschitz property of
  §6.1 makes `(φ ∘ κ)⁻¹` Lipschitz on `φ(κ(σ'))`, so `ψ ∘ p ∘ φ⁻¹` is Lipschitz there. Only this
  local form is used, never a bound on a whole closed simplex. Constants from different
  simplices are combined by taking their maximum;
- gluing along segments: a continuous function on a segment that is `L`-Lipschitz on each of
  finitely many closed pieces covering it is `L`-Lipschitz. The pieces near `κ x` are the local
  pieces of the finitely many `n`-simplices through `x`, which cover a neighbourhood of `κ x`:
  the other `κ(σ)` form a locally finite family of closed sets missing `κ x` (§6.1).

**Checks.**

- `|x₁|` on `ℝ²` with a triangulation containing `x₁ = 0` in its `1`-skeleton is linear on each
  triangle and `1`-Lipschitz.
- The eight-sector map of the Worked examples is linear on eight sectors, Lipschitz, and has
  `q_O = 1 + √2` on each sector.
- For `p = id` on a triangulated `ℝ²`, let `D(x) = id` except at one simplex-interior point
  `x₀`, where `D(x₀) = 0`. This remains a weak differential since `{x₀}` has measure `0`
  (`TauCeti.HasWeakFDerivOn.congr_ae_deriv`), but `D(x₀) = 0 ≠ dp(x₀) = id`. Equality holds
  off `{x₀}`, which is exactly what the distortion conclusions require.
- Continuity of `p` is not a hypothesis: a function that is `C¹` on each closed `κ(σ)` agrees on
  shared faces because it is a single function on `M`.

*Needs:* §2.8, §6.1; SobolevMapsBetweenManifolds §4.3;
Mathlib `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`;
Tau Ceti `TauCeti.HasWeakFDerivOn.congr_ae_deriv` (for the Check).

### 6.4 Simplicial maps are quasiregular

Let `p` be a non-degenerate orientation-preserving simplicial map (§6.2) and
`K_p = sup { q_O(dp_x) : x ∈ κ₁(σ°), σ an n-simplex of K₁ }`. Prove:

- `K_p < ∞` when `K₁` has finitely many `n`-simplices, in particular when `M` is compact
  (`AbstractSimplicialComplex.compactSpace_realization_iff_finite`);
- if `K_p < ∞` then `p` is `max(1, K_p)`-quasiregular, `K_O(p) = max(1, K_p)` and
  `K_I(p) = max(1, sup q_I(dp_x))` over the same points;
- `K_p ≥ 1` when `M` is non-empty.

This is HeikkilaPankka2025 Proposition B.1, lines 1247–1251, with proof at lines 1317–1339,
there for closed `M` and `N` and `n ≥ 2`. Route: §6.3 for the class; on each closed `κ₁(σ)`,
`q_O(dp)` is a continuous function on a compact set (§6.2); §2.7's argument identifies the
essential supremum with the supremum.

**Checks.**

- The identity has `K_p = 1`.
- On the flat torus `T² = ℝ²/ℤ²`, take `κ₂` from the `3 × 3` grid triangulation and `κ₁` from
  the `6 × 3` grid. The doubling `(x, y) ↦ (2x, y)` is simplicial with `dp = diag(2, 1)`, so
  `K_O = 4/2 = 2`.
- The fold of §6.2 violates orientation preservation and is not quasiregular.
- A simplicial map with exactly one pair of identified vertices on an `n`-simplex, `n ≥ 2`,
  and all other vertex images distinct has `dp` of rank `n − 1 ≥ 1` on its interior. There
  `‖dp‖ > 0` and `J = 0`, so the distortion inequality fails on a set of positive measure.
  On a standard triangle, `(x, y) ↦ (x, 0)` gives `‖dp‖² = 1 > K · 0 = 0` for every finite `K`.
- Total collapse to one target vertex instead has rank `0`, norm `0` and Jacobian `0`, so
  `0 ≤ 0` holds and the map is `1`-quasiregular (§2.1). Non-degeneracy is sufficient in the
  theorem, not necessary for every quasiregular simplicial map.
- Let `h : ℝ → ℝ` be continuous and piecewise linear, with slope `1` on `(−∞, 1]` and slope `k`
  on `[k, k + 1]` for each integer `k ≥ 1`. The homeomorphism `(x, y) ↦ (h(x), y)` of `ℝ²` is
  simplicial for the integer grid with diagonals, triangulating source and target compatibly. It
  has `q_O = k²/k = k` on the `k`-th strip, so `K_p = ∞`. It is quasiregular on every bounded set
  and not on `ℝ²`, so finiteness of `K_p` is used.

*Needs:* §2.2, §2.7, §3.1, §6.2, §6.3; Tau Ceti
`AbstractSimplicialComplex.compactSpace_realization_iff_finite`.

### Examples

- `p : S² → S²` of degree `2`, the simplicial suspension of the doubling of a triangulated
  circle, is non-degenerate and orientation preserving for suitable triangulations, hence
  quasiregular.

### Dependencies

§2.2, §2.7, §2.8 and §3.1; Tau Ceti's smooth triangulations, realizations and simplicial maps;
GeometricTopology Layer 11.

## Layer 7: quasiregularly elliptic manifolds

Throughout, `N` is a connected oriented Riemannian `n`-manifold, `n ≥ 1`, and `ℝⁿ` carries the
flat metric and the standard orientation.

### 7.1 Quasiregular ellipticity

For `K ≥ 1`, call `N` `K`-quasiregularly elliptic when there is a non-constant `K`-quasiregular
map `ℝⁿ → N`, and quasiregularly elliptic when it is `K`-quasiregularly elliptic for some `K`
(HeikkilaPankka2025 lines 20–21 and 271–273; Prywes2019 lines 26–27).

- If `N` is `K`-quasiregularly elliptic and `K ≤ K'`, then it is `K'`-quasiregularly elliptic.
- `N` is `K`-quasiregularly elliptic iff some `K`-quasiregular `f : ℝⁿ → N` has `J_f > 0` on a
  set of positive measure (§2.6).
- The notion is invariant under orientation-preserving isometries of `N` and of `ℝⁿ` (§4.3,
  §4.4).

**Checks.**

- `ℝⁿ` is `1`-quasiregularly elliptic through the identity.
- Without "non-constant", every `N` would be elliptic through a constant map.
- With the unit ball in place of `ℝⁿ`, every `N` would be elliptic. A chart diffeomorphism from a
  ball onto a small coordinate ball of `N`, orientation preserving and with bounded distortion on
  the closed ball, is quasiregular. So the domain `ℝⁿ` is essential.
- In dimension one, `ℝ` and `S¹ = ℝ/ℤ` are `1`-quasiregularly elliptic.

*Needs:* §2.1, §2.6.

### 7.2 Independence of the orientation

Prove that `N` is `K`-quasiregularly elliptic for `o_N` iff it is for `−o_N`, with the same `K`.
Route: if `f : (ℝⁿ, std) → (N, o_N)` is `K`-quasiregular, then by §4.2 it is `K`-quasiregular
from `(ℝⁿ, −std)` to `(N, −o_N)`. The reflection `R` is an orientation-preserving isometry
`(ℝⁿ, std) → (ℝⁿ, −std)`, so §4.3 makes `f ∘ R` `K`-quasiregular to `(N, −o_N)`. It is
non-constant because `R` is a bijection, so it is a witness in the sense of the definition
(HeikkilaPankka2025 lines 20–21).

**Checks.**

- The Jacobian of `f ∘ R` for `(std, −o_N)` at `x` is `−(J_f(Rx) · det R) = J_f(Rx)`.
- Without the reflection, a non-constant `f` is not quasiregular for `−o_N` (§4.2).

*Needs:* §4.2, §4.3, §7.1.

### 7.3 Independence of the metric

Prove that if `0 < α ≤ β`, `α|w| ≤ |w|' ≤ β|w|` on `TN`, and `N` is
`K`-quasiregularly elliptic for `g_N`,
then it is `(β/α)ⁿ K`-quasiregularly elliptic for `g'_N` (the definition on a Riemannian
manifold is HeikkilaPankka2025 lines 20–21; the comparison is §4.1). Hence for closed `N`,
quasiregular ellipticity does not depend on the metric. This is the reading HeikkilaPankka2025
takes for granted: its Theorem 1.1 (line 18) speaks of a closed quasiregularly elliptic manifold
without fixing a metric, and lines 32–34 measure quasiregularity of a branched covering of a
closed `N` by a torus against the two smooth structures only. With §7.2, quasiregular
ellipticity of a closed `N` is a property of the closed connected orientable smooth manifold.
Route: §4.1 with `a = b = 1` on `ℝⁿ`.

**Checks.**

- Equal metrics with `α = β = 1` give factor `1`. A constant rescaling `g'_N = c² g_N`,
  `c > 0`, keeps `K` (factor `(c/c)ⁿ = 1`).
- For equal metrics on `ℝ`, `α = −2`, `β = 1` satisfy the norm inequalities but give factor
  `−1/2`; `α = 0` also satisfies them but supplies no nonzero denominator. Positivity of `α`
  excludes both, and `α ≤ β` ensures `(β/α)ⁿ K ≥ 1`.
- `T²` with `dx² + 4 dy²`: the bound from the flat case is `4`, although this torus is isometric
  to the flat `ℝ²/(ℤ × 2ℤ)` and so is `1`-quasiregularly elliptic. The bound is not sharp.

*Needs:* §4.1, §7.1, §7.2.

### 7.4 Transfer along local diffeomorphisms

Let `N'` be a connected oriented Riemannian `n`-manifold and `q : N → N'` a `C¹` local
diffeomorphism, orientation preserving at every point, with
`K_q = max(1, sup_y q_O(dq_y)) < ∞`, which is automatic for compact `N`. Prove that if `N` is
`K`-quasiregularly elliptic then `N'` is `K_q K`-quasiregularly elliptic. In particular, a closed
manifold finitely and orientation-preservingly covered by a quasiregularly elliptic closed
manifold is quasiregularly elliptic. Postcomposing a non-constant quasiregular map `ℝⁿ → N`
with a map `N → N'` is the construction of HeikkilaPankka2025 lines 85–91, there with a
piecewise linear branched covering in place of `q` (§7.7). Route: §4.4 with §2.7. If `q ∘ f`
were constant, `f(ℝⁿ)` would be a connected subset of a fibre of `q`; the fibres of a local
homeomorphism are discrete, so `f` would be constant.

**Checks.**

- The doubling `(x, y) ↦ (2x, y)` of the flat `T²` has `K_q = 2`. For the pulled-back metric on
  the source, it is a local isometry with `K_q = 1`.
- The inclusion `ℂ ∖ {0} → ℂ` has `K_q = 1`, and `ℂ ∖ {0}` is `1`-quasiregularly elliptic through
  `exp`.
- Complex conjugation `ℂ → ℂ` is orientation reversing; as a map between the standard
  orientations its `K_q` is `∞`.

*Needs:* §2.7, §4.4, §7.1.

### 7.5 Orientations of orbit spaces

Let `X` be a Hausdorff boundaryless manifold modelled with `𝓘(ℝ, E)`, `dim E = n`, with an
orientation `o_X`, and let a group `Γ` act on `X` freely (Mathlib's `IsCancelSMul`), properly
discontinuously (`ProperlyDiscontinuousSMul`) and by `C¹` maps (`ContMDiffConstSMul`). The orbit
space `X/Γ` carries the charts `MulAction.instChartedSpaceQuotient` and is a `C¹` manifold
(`TauCeti.instIsManifoldQuotient`), and the orbit projection `π : X → X/Γ` is a `C¹` local
diffeomorphism (`TauCeti.isLocalDiffeomorph_quotientMk`). Call the action orientation
preserving when, for every `γ ∈ Γ` and every `x ∈ X`, the map `z ↦ γz` is orientation preserving
at `x` from `o_X` to `o_X` (`TauCeti.Manifold.Orientation.IsOrientationPreservingAt`).

Prove that if the action is orientation preserving, then `X/Γ` has exactly one orientation, the
descended orientation `o_X/Γ`, for which `π` is orientation preserving at every point
(Lee2012, Ch. 15). Route: for `y ∈ X/Γ` choose `x` with `π x = y` and carry `o_X.orientationAt x`
along the invertible `dπ_x` (Mathlib's `Orientation.map`). Another point of the fibre is `γx`,
and `dπ_{γx} ∘ dγ_x = dπ_x` (`TauCeti.mfderiv_quotientMk_smul_apply`) with `dγ_x` carrying
`o_X.orientationAt x` to `o_X.orientationAt (γx)`, so the result does not depend on `x`. The
family is locally constant in trivializations (`IsLocalDiffeomorphAt.eventually_mapOrientation_eq`
at each `x`), hence is the family of tangent orientations of an orientation
(`TauCeti.VectorBundleOrientation.ofEventually`,
`TauCeti.Manifold.Orientation.ofVectorBundleOrientation`,
`TauCeti.Manifold.Orientation.orientationAt_ofVectorBundleOrientation`), and `π` is orientation
preserving for it by construction. Uniqueness: an orientation for which `π` is orientation
preserving has the tangent orientation `dπ_x(o_X.orientationAt x)` at every `π x`, and `π` is
surjective, so `TauCeti.Manifold.Orientation.ext` applies.

- The pullback of `o_X/Γ` along `π` (`TauCeti.Manifold.Orientation.pullback`) is `o_X`.
- The descended orientation of `−o_X` is `−(o_X/Γ)`.
- Conversely, if `X/Γ` has an orientation for which `π` is orientation preserving at every point,
  then the action is orientation preserving, since `π ∘ γ = π`.
- If `X` is connected, `X/Γ` is orientable (`TauCeti.Orientable`) if and only if the action is
  orientation preserving, and then its orientations are exactly `o_X/Γ` and `−(o_X/Γ)`: an
  orientation `o` of `X/Γ` pulls back to `o_X` or `−o_X`
  (`TauCeti.Manifold.Orientation.eq_or_eq_neg` on `X`), so `π` is orientation preserving for `o`
  or for `−o`, and `X/Γ` is connected.

**Checks.**

- The trivial group: `X/Γ` is `X` up to the diffeomorphism `π`, and `o_X/Γ` is `o_X` carried
  along it. A construction that ignored `o_X` and returned a fixed orientation would give the
  same answer for `o_X` and `−o_X`, against the second bullet.
- `Γ = ℤⁿ` acting on `ℝⁿ` by translations: every `dγ_x` is the identity, the action is
  orientation preserving, and `o/Γ` on the torus `ℝⁿ/ℤⁿ` is the orientation in which the images
  of the standard basis vectors are positive at every point.
- `Γ = ℤ` acting on `ℝ²` by `k · (x, y) = (x + k, (−1)ᵏ y)`: the generator has differential
  `diag(1, −1)`, of determinant `−1`, so the action is not orientation preserving, and the
  orbit space, the open Möbius band, is not orientable. A criterion asking only that `Γ` act by
  isometries would wrongly orient it.
- The antipodal action of `ℤ/2` on `Sⁿ`, `n ≥ 1`: the antipodal map has degree `(−1)ⁿ⁺¹`, so it is
  orientation preserving exactly for odd `n`, and `ℝPⁿ` is orientable exactly for odd `n`, in
  agreement with RiemannianGeometry R4 item 7.

*Needs:* Mathlib `MulAction.instChartedSpaceQuotient`, `Orientation.map`; Tau Ceti
`TauCeti.instIsManifoldQuotient`, `TauCeti.isLocalDiffeomorph_quotientMk`,
`TauCeti.mfderiv_quotientMk_smul_apply`, `IsLocalDiffeomorphAt.eventually_mapOrientation_eq`,
`TauCeti.VectorBundleOrientation.ofEventually`,
`TauCeti.Manifold.Orientation.ofVectorBundleOrientation`,
`TauCeti.Manifold.Orientation.orientationAt_ofVectorBundleOrientation`,
`TauCeti.Manifold.Orientation.ext`, `TauCeti.Manifold.Orientation.pullback`,
`TauCeti.Manifold.Orientation.eq_or_eq_neg`; DifferentialGeometry 2.1–2.2.

### 7.6 Conformal maps and flat manifolds

Prove:

- If `π : ℝⁿ → N` is `C¹` and non-constant, and every `dπ_x` is `0` or a positive multiple of an
  orientation-preserving linear isometry, then `N` is `1`-quasiregularly elliptic (§2.7).
- If `π : ℝⁿ → N` is a local Riemannian isometry (`TauCeti.IsLocalRiemannianIsometry`), then `N`
  is `1`-quasiregularly elliptic for each of its orientations. Route: pull `o_N` back along `π`
  (`TauCeti.Manifold.Orientation.pullback`). On connected `ℝⁿ` it is the standard orientation or
  its negative (`TauCeti.Manifold.Orientation.eq_or_eq_neg`). In the first case `π` is
  orientation preserving into `(N, o_N)`; in the second it is into `(N, −o_N)`, and §7.2
  transfers.
- If a group `Γ` acts on `ℝⁿ` freely and properly discontinuously by isometries, the orbit space
  `ℝⁿ/Γ` with the descended metric (`Bundle.ContMDiffRiemannianMetric.quotient`; RiemannianGeometry
  R4 item 7) is `1`-quasiregularly elliptic for every orientation it carries
  (`Bundle.ContMDiffRiemannianMetric.isLocalRiemannianIsometry_descend`). It carries an
  orientation exactly when every element of `Γ` preserves the orientation of `ℝⁿ`, and its
  orientations are then the descended orientation of §7.5 and its negative. This covers the flat
  tori `ℝⁿ/Λ`; that the `n`-torus is quasiregularly elliptic is noted in HeikkilaPankka2025
  lines 56–57 and Prywes2019 lines 35–36. It also covers every closed orientable flat manifold
  `N`: by the Killing–Hopf theorem (RiemannianGeometry R4 item 7) `N` is isometric to such a
  quotient `ℝⁿ/Γ`, the orbit projection followed by that isometry is a local Riemannian isometry
  `ℝⁿ → N`, and the second bullet makes `N` `1`-quasiregularly elliptic for each of its
  orientations.

**Checks.**

- For `Tⁿ = ℝⁿ/ℤⁿ`, `dπ` is an orientation-preserving isometry at every point, `J_π = 1` and
  `K_O(π) = 1`.
- `ℂ → ℂ/(ℤ + iℤ)` and `exp : ℂ → ℂ ∖ {0}` are holomorphic with nowhere-zero derivative, hence
  conformal (`DifferentiableAt.conformalAt`) and orientation preserving.
- The Klein bottle is `ℝ²/Γ` with `Γ` containing glide reflections, which reverse orientation.
  The quotient carries no orientation and lies outside the definition. The rotation by `π` of
  `ℝ²` has a fixed point, so it does not act freely.

*Needs:* §2.7, §7.1, §7.2, §7.5; Tau Ceti `TauCeti.IsLocalRiemannianIsometry`,
`TauCeti.Manifold.Orientation.pullback`, `TauCeti.Manifold.Orientation.eq_or_eq_neg`,
`Bundle.ContMDiffRiemannianMetric.quotient`,
`Bundle.ContMDiffRiemannianMetric.isLocalRiemannianIsometry_descend`,
`TauCeti.isLocalDiffeomorph_quotientMk`; RiemannianGeometry R4 item 7.

### 7.7 Simplicial branched coverings by tori

Let `T` be an oriented Riemannian `n`-manifold and `π : ℝⁿ → T` a `C¹` local
diffeomorphism, orientation preserving at every point, with `K_π < ∞`. Let `κ₁`, `κ₂` be `C¹`
smooth triangulations of `T` and `N`, and `p = κ₂ ∘ |s| ∘ κ₁⁻¹` non-degenerate and orientation
preserving with `K_p < ∞` (automatic for compact `T`). Prove that `p ∘ π` is non-constant and
`K_π max(1, K_p)`-quasiregular, so `N` is quasiregularly elliptic. No compactness of `N` is
assumed. In particular a non-degenerate orientation-preserving simplicial map from a flat torus
`ℝⁿ/Λ → N` makes `N` `max(1, K_p)`-quasiregularly elliptic. This is the construction of
HeikkilaPankka2025 lines 32–34 and 85–91, where `N` is closed and the piecewise linear branched
coverings come from Piergallini and Zuddas; Proposition B.1 there (lines 1247–1251) is likewise
stated for closed manifolds.

Route: §4.3 and §6.4. For non-constancy, the image of `π` is open and non-empty, so it meets
some `κ₁(σ°)` (§6.1: the union of these is the complement of a null set and is dense). Near a
point of `π⁻¹(κ₁(σ°))`, `p ∘ π` is a composition of local diffeomorphisms, so it is not
constant. No surjectivity of `π` and no connectedness of `T` is needed: the image of `π` is
connected, and only it enters.

**Checks.**

- `T = N = Tⁿ` and `p = id` recover §7.6 with `K = 1`.
- The doubling of `T²` (§6.4) composed with `π : ℝ² → T²` is `2`-quasiregular and non-constant.
- A degenerate simplicial map fails §6.4 and gives no conclusion.
- `T = N = ℝ²` with the integer grid triangulated by diagonals, `s = id` and `π = id`: `K_π = 1`,
  `K_p = 1`, and `p ∘ π = id` is non-constant and `1`-quasiregular although `N` is not compact.

*Needs:* §4.3, §6.1, §6.4, §7.1.

### Examples

- Closed orientable flat manifolds, in particular all flat tori, are `1`-quasiregularly elliptic
  (§7.6).
- The round sphere `Sⁿ` is `1`-quasiregularly elliptic for each orientation. The inverse
  stereographic projection `ℝⁿ → Sⁿ` is smooth and non-constant, with differential
  `2/(1 + |x|²)` times a linear isometry. So §7.6 applies for the orientation that makes it
  orientation preserving, and §7.2 applies for the other.

### Dependencies

Layers 2, 4 and 6; RiemannianGeometry R4 item 7; DifferentialGeometry 2.1–2.2; Mathlib's
orbit-space charts and Tau Ceti's quotient manifolds and orientation constructors (§7.5).

## Worked examples

- **The eight-sector map.** Divide `ℝ²` into the eight closed sectors between the rays at angles
  `kπ/4`, and map each linearly onto the sector between the rays at angles `kπ/2` and
  `(k + 1)π/2`, sending the unit vector at angle `kπ/4` to the unit vector at angle `kπ/2`. On
  the first sector the linear part sends `e₁ ↦ e₁` and `(1, 1)/√2 ↦ e₂`, so it is
  `L = [[1, −1], [0, √2]]`. Then `det L = √2` and `LᵀL = [[1, −1], [−1, 3]]` has eigenvalues
  `2 ± √2`. So `‖L‖² = 2 + √2` and `q_O(L) = q_I(L) = (2 + √2)/√2 = 1 + √2`. Rotations conjugate
  the other sectors to the first, the pieces agree on the shared rays, and the map is a
  piecewise linear branched covering of degree two. By §6.3–§6.4 it is
  `(1 + √2)`-quasiregular, while the smooth map `z ↦ z²` with the same branching is
  `1`-quasiregular.
- **Radial stretches** `x ↦ |x|^{a−1} x` of `ℝⁿ`, `n ≥ 2`: singular values `a|x|^{a−1}` once and
  `|x|^{a−1}` `n − 1` times; `J = a |x|^{n(a−1)}`; `K_O = max(a^{n−1}, 1/a)`,
  `K_I = max(a, a^{1−n})`. They attain both comparison inequalities of §3.2.
- **The flat torus.** `π : ℝⁿ → ℝⁿ/ℤⁿ` has `‖dπ‖ = 1`, `J_π = 1`, `K_O = K_I = 1`.

## Downstream consumers

QuasiregularMaps, Part II and Part III are separate roadmaps. The lists below fix where this
roadmap stops and describe those two; nothing in them is a target of this roadmap.

- **QuasiregularMaps, Part II** (Reshetnyak theory) consumes Layers 2–4 and 7. Its targets:
  - Reshetnyak's continuity theorem for `W^{1,n}_loc` solutions of the distortion inequality.
  - Reshetnyak's theorem (MartioRickmanVaisala1969 Lemma 2.26, lines 440–444; Reshetnyak1989,
    Ch. II; Rickman1993, Ch. I): a non-constant quasiregular map of a connected manifold is
    discrete, open and sense preserving, differentiable almost everywhere, satisfies Lusin's
    condition (N), and has `J_f > 0` almost everywhere.
  - The composition theorem `K_O(g ∘ f) ≤ K_O(g) K_O(f)` for arbitrary quasiregular `f`, `g`.
  - The transfer of ellipticity along a non-constant quasiregular map of closed connected
    manifolds.
  - The modulus inequalities of Poletsky and Väisälä, Liouville's theorem in dimension `n ≥ 3`,
    and Rickman's Picard theorem (Rickman1993, Ch. VI).
- **QuasiregularMaps, Part III** (cohomology of quasiregularly elliptic manifolds) consumes
  Part II, de Rham cohomology with the de Rham theorem and Poincaré duality, and
  SobolevDifferentialForms. Its targets:
  - The Bonk–Heinonen bound `dim H^k_dR(N) ≤ C(n, K)` (BonkHeinonen2001, Theorem 1.1, as cited by
    Prywes2019 lines 33–34).
  - Prywes's bound `dim H^k_dR(N) ≤ binom(n, k)` (Prywes2019 Theorem 1.1, lines 28–30).
  - The Heikkilä–Pankka embedding `H^*_dR(N) → ⋀^* ℝⁿ` (HeikkilaPankka2025 Theorem 1.1,
    lines 18–19).
  - The non-ellipticity of `#^k (S² × S²)` for `k ≥ 4` (Prywes2019 Corollary 1.2, lines 41–53),
    answering the question of Gromov1981 p. 200, restated in Gromov1999, Ch. 2.
  - The classification of closed simply connected quasiregularly elliptic `4`-manifolds up to
    homeomorphism (HeikkilaPankka2025 Corollary 1.2, lines 94–96). It combines the
    Heikkilä–Pankka embedding with the classification by intersection forms of FourManifolds,
    which precedes this roadmap and Part III and so is a supplier of Part III, not a consumer.
- A later roadmap on `n`-dimensional quasiconformal maps and uniformly quasiregular dynamics, and
  the dimension-two comparison with Stoïlow factorisation (Prywes2019 lines 59–62), consume
  Layers 2–4.

## References

- `HeikkilaPankka2025`: S. Heikkilä, P. Pankka, *De Rham algebras of closed quasiregularly
  elliptic manifolds are Euclidean*, Ann. of Math. 201 (2025); arXiv 2302.11440v2. Lines 18–27
  (Theorem 1.1, the definition), 32–34 and 85–91 (branched coverings by tori), 271–273
  (`K`-quasiregular ellipticity), 1234–1339 (Appendix B: Proposition B.1, Lemma B.2).
- `Prywes2019`: E. Prywes, *A bound on the cohomology of quasiregularly elliptic manifolds*, Ann.
  of Math. 189 (2019); arXiv 1806.05306v1. Lines 22–30 (definition, Theorem 1.1), 33–36, 41–53
  (Corollary 1.2), 59–65.
- `MartioRickmanVaisala1969`: O. Martio, S. Rickman, J. Väisälä, *Definitions for quasiregular
  mappings*, Ann. Acad. Sci. Fenn. Ser. A I 448 (1969). Lines 117–127 (formal derivative,
  Jacobian, `ℓ(T)`), 332–340 (Definition 2.16), 409–439 (Definition 2.20, (2.21)–(2.25)),
  440–444 (Lemma 2.26).
- `Rickman1993`: S. Rickman, *Quasiregular Mappings*, Springer Ergebnisse 26 (1993), Ch. I and
  Ch. VI.
- `Vaisala1971`: J. Väisälä, *Lectures on n-Dimensional Quasiconformal Mappings*, LNM 229 (1971),
  Ch. 3.
- `Reshetnyak1989`: Yu. G. Reshetnyak, *Space Mappings with Bounded Distortion*, AMS Transl. Math.
  Monogr. 73 (1989), Ch. II.
- `Ahlfors2006`: L. V. Ahlfors, *Lectures on Quasiconformal Mappings*, 2nd ed., AMS University
  Lecture Series 38 (2006), Ch. I.
- `IwaniecMartin2001`: T. Iwaniec, G. Martin, *Geometric Function Theory and Non-linear
  Analysis*, Oxford (2001), Ch. 6.
- `BonkHeinonen2001`: M. Bonk, J. Heinonen, *Quasiregular mappings and cohomology*, Acta Math. 186
  (2001), Theorem 1.1.
- `Gromov1981`: M. Gromov, *Hyperbolic manifolds, groups and actions*, Ann. of Math. Stud. 97
  (1981), p. 200.
- `Gromov1999`: M. Gromov, *Metric Structures for Riemannian and Non-Riemannian Spaces*,
  Birkhäuser (1999), Ch. 2.
- `Lee2012`: J. M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Graduate Texts in
  Mathematics 218, Springer (2012), Ch. 15 (orientations, including orientations of covering and
  quotient manifolds).
