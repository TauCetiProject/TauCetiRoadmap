# Roadmap: arithmetic Fuchsian groups, commensurators and isospectral covers

**Summary.** This roadmap develops the arithmetic theory of lattices in `PSL₂(ℝ)` on top of the
geometric theory of the FuchsianOrbifolds roadmap. From an order `O` in a quaternion algebra over a
totally real number field that splits at exactly one real place it builds the lattice `Γ(O)`, proves
that it is discrete of finite covolume, cocompact exactly in the division case, and computes its
covolume `8π|d_k|^(3/2)ζ_k(2)(4π²)^(−n)∏(N𝔭−1)` from Tamagawa number one for the norm-one group. It
recovers the quaternion algebra of an arbitrary finitely generated nonelementary subgroup from its
squared traces, proves Odlyzko's discriminant estimate (5) for every signature and an explicit
totally real bound `|d_k|≥a₀R₀ⁿ`, proves the standard presentation of a lattice of given signature
and Borel's theorem that up to conjugacy only finitely many arithmetic lattices have covolume at
most a given bound, and deduces Takeuchi's theorem that only finitely many have a given signature.
Layer 2 proves Margulis' commensurator criterion in `PSL₂(ℝ)`: a lattice is arithmetic exactly when
its commensurator is dense, and otherwise the commensurator is a discrete group containing the
lattice with finite index; the criterion then passes to `PGL₂(ℝ)` with its quotient topology. Layer
3 identifies the distance-preserving bijections of the hyperbolic plane with `PGL₂(ℝ)`, lifts
isometries between quotients of the plane to `PGL₂(ℝ)`, and combines
the criterion with an explicit pair of almost-conjugate, nonconjugate subgroups of an affine group
of order 32, giving a pair of nonisometric isospectral degree-eight covers of every closed
hyperbolic surface of genus at least three whose uniformizing group is nonarithmetic and maximal
among discrete subgroups of `PGL₂(ℝ)`.

Suggested home: `TauCeti/NumberTheory/Quaternion/Fuchsian/` for Layers 1 and 2 and
`TauCeti/Geometry/Hyperbolic/Isospectral/` for Layer 3.
[`Suggested.lean`](Suggested.lean) states the headline theorems against the pinned libraries; it is
not the roadmap.

## Scope and ownership

### Owned here

- real splittings of a quaternion algebra over a totally real field at exactly one real place, the
  existence of a maximal order of `ℍ[k,a,b]` over `𝓞_k` containing a given order and the local
  structure of maximal orders, the norm-one group `O¹`, its projective image `Γ(O)`, the arithmetic
  predicate, the lattice property of `Γ(O)` and its cocompactness criterion (§1.1);
- the finite ramification set of `ℍ[k,a,b]`, the covolume formula for maximal orders, the
  quaternionic local volumes and the conversion of Haar measure to hyperbolic area, the positive
  normalizer `N_B⁺(O)`, the local order-to-tree adapter at split finite places with its local
  normalizer indices, and the indices `[N_B⁺(O) : Γ(O)]` and `[Γ(O) : Γ(O′)]` (§1.2);
- the squared-trace field and trace envelope of a finitely generated nonelementary subgroup of
  `PSL₂(ℝ)`, the envelope's structure as a quaternion algebra over the squared-trace field, their
  finite-index and commensurability invariance, integral trace lattices and the trace integrality
  of arithmetic groups (§1.3);
- Odlyzko's estimate (5) for number fields of every signature (§1.3b), the standard presentation
  of a cofinite subgroup of `PSL₂(ℝ)` of given signature, the index-two inclusion of `PSL₂(ℝ)` in
  `PGL₂(ℝ)`, finiteness of maximal-order type classes, the finiteness up to conjugacy of arithmetic
  lattices of bounded covolume and Takeuchi's fixed-signature finiteness (§1.4), and an explicit
  totally real discriminant bound (§1.5);
- the commensurator dichotomy and the dense-commensurator arithmeticity criterion for lattices of
  `PSL₂(ℝ)`, with the specialized boundary-map, characteristic-map and extension lemmas they use,
  and the passage to `PGL₂(ℝ)` with its quotient topology (Layer 2);
- the identification of the distance-preserving bijections of the hyperbolic plane with `PGL₂(ℝ)`
  and the lifting of isometries between quotients of the plane by discrete torsion-free subgroups
  of `PGL₂(ℝ)` (§3.1), the concrete
  order-32 Gassmann pair (§3.2) and the resulting nonisometric isospectral covers (§§3.3–3.5).

### Consumed, not redefined

- Orders and maximal orders of a finite-dimensional algebra over the fraction field of a domain,
  and cofinite Fuchsian groups with their covolume: Tau Ceti's `TauCeti.IntegralOrder.IsOrder`,
  `TauCeti.IntegralOrder.IsMaximalOrder` and `Subgroup.IsCofinite`, with Mathlib's
  `MeasureTheory.covolume`, as listed under Exact supplier contracts. This roadmap adds only the
  quaternionic statements about them.
- Tamagawa number one for `SL₁(B)`: EndoscopicTransferAndUnitaryTraceComparison §6.2 proves
  `τ(S)=1` for every simply connected semisimple group over a number field, inner forms included,
  with the measure of AdelicAlgebraicGroups §2.4 (AA.2.4). GeometryOfNumbersAndQuadraticArithmetic
  reaches the same value for a quaternion algebra through the zeta-residue calculation in its proof
  that the adjoint group `PGL₁(D)` has Tamagawa number two. The adelic Fourier analysis and Poisson summation behind that
  calculation are AnalyticNumberTheoryPartII §§5.3g–5.3h; nothing here uses them directly.
- The local and global reduced-norm images of a quaternion algebra, and the reduced-norm image
  `𝒪_v^×` of the units of a local maximal order: ClassicalArithmeticCompletion §7.60.
- The classification of quaternion algebras over a number field by their ramification sets
  (realizability exactly for sets of even cardinality containing only real infinite places, and
  isomorphism exactly when the local splitting predicates agree):
  GL2AutomorphicRepresentationsAndTransfer R17.1.5.
- Odlyzko's estimate (4), `log D ≥ r₁ log 60.1 + 2 r₂ log 22.2 − 254`: AnalyticNumberTheoryPartI
  §2.9a. It is not used here.
- The explicit formula for the Dedekind zeta function against an even, compactly supported test
  function that is `C¹` and piecewise `C²` with `F(0)=1`, and the nonnegativity of its zero terms
  throughout the critical strip for every even, continuous, compactly supported, nonnegative
  positive-definite kernel: SmallRamificationAndAbelianVarietyBaseCases §§1.0 and 1.6. That
  roadmap's §1.7 is the Poitou bound for a different kernel; §1.5 here applies the same two
  sections to Odlyzko's Table 4 kernel.
- The geometric theory of Fuchsian groups (topology of `PSL₂(ℝ)`, the `PGL₂(ℝ)` action, proper
  discontinuity, the hyperbolic metric and area, Dirichlet polygons, signatures, Gauss–Bonnet, the
  area minima, Riemann–Hurwitz and the orbifold area formula): FuchsianOrbifolds, by the items
  listed under Exact supplier contracts.
- Completed Dedekind zeta functions and their functional equation: LFunctions Layer 3. Digamma
  asymptotics, finite order, strip growth and Hadamard factorization: ZerosOfLFunctions §1.4,
  §3.1, §§3.4–3.5 and Layer 5.
- Strong approximation, adelic class-number finiteness, arithmetic-quotient finiteness and the
  Tamagawa normalization: AdelicAlgebraicGroups AA.2.4, AA.3.4 and AA.4.2.
- Bruhat–Tits buildings and the tree of `SL₂` and `PGL₂` over a local field: ReductiveGroupsPartII
  RG2.2.1, RG2.2.2 and RG2.2.4.
- Surface groups `S⁺(g, m)` with their peripheral elements, finite polygonal surface models, their
  normal forms and the comparison of a model's face group with `S⁺(g, m)`:
  FreeGroupsAndLimitGroups §§6.0a–6.1a.
- Quotient manifolds of free properly discontinuous actions, descended Riemannian metrics,
  Riemannian isometries and their distances, and orbit coverings: Tau Ceti and Mathlib, as listed
  under Exact supplier contracts.
- Generic almost conjugacy and permutation-representation equivalence: InductionRestriction Layer
  2.1. The quotient-`L²` adapter: NoncompactQuantumSymmetry M1. Finite-deck scalar-Laplacian
  transplantation: PseudodifferentialOperators P7a (Layer 8). The closed-subgroup
  theorem: LieGroups. The double-centralizer theorem: SemisimpleAlgebras Layer 3.

### Outside this roadmap

Arithmetic Kleinian groups, arithmetic lattices in other semisimple groups, superrigidity and
arithmeticity theorems beyond the two-dimensional statements of Layer 2, and asymptotic counts of
arithmetic lattices by covolume.

## Conventions

- `PSL₂(ℝ)` is Mathlib's `Matrix.ProjectiveSpecialLinearGroup (Fin 2) ℝ` with the quotient topology
  from `SL₂(ℝ)`, and `projSL : SL₂(ℝ) → PSL₂(ℝ)` is the quotient map. It acts on Mathlib's
  `UpperHalfPlane` by Tau Ceti's `UpperHalfPlane.instMulActionPSL2`, which agrees with Mathlib's
  `PGL₂(ℝ)` action along `Matrix.ProjectiveSpecialLinearGroup.toPGL`
  (`UpperHalfPlane.toPGL_smul`); this is FuchsianOrbifolds Layer 0 item 2's action. `PGL₂(ℝ)`
  acts by `z ↦ (az+b)/(cz+d)` for positive determinant and by `z ↦ (a z̄+b)/(c z̄+d)` for negative
  determinant.
- `PGL₂(ℝ)` is Mathlib's `Matrix.ProjGenLinGroup (Fin 2) ℝ`, a `def` for the quotient of
  `GL (Fin 2) ℝ` by its centre that carries no topology at the pins. It is given the quotient
  topology of `GL (Fin 2) ℝ`, the topology Mathlib puts on that quotient group
  (`instTopologicalSpacePGL`); since the centre is closed (Tau Ceti `Subgroup.isClosed_center`)
  this is a Hausdorff group topology. Discreteness of a subgroup of `PGL₂(ℝ)` refers to it.
- For a discrete torsion-free `Γ ≤ PGL₂(ℝ)`, the quotient `ℍ/Γ` is Tau Ceti's quotient manifold of
  the free properly discontinuous action (`TauCeti.instIsManifoldQuotient`), with the metric
  descended from the Poincaré metric `TauCeti.UpperHalfPlane.poincareRiemannianMetric`
  (`Bundle.ContMDiffRiemannianMetric.quotient`). An isometry between two such quotients is a Tau
  Ceti `TauCeti.RiemannianIsometry` for the descended metrics; orientation is not required to be
  preserved.
- Hyperbolic area is Mathlib's `volume` on `UpperHalfPlane`, with density `y⁻²`
  (`UpperHalfPlane.volume_def`); hyperbolic distance is Mathlib's metric (`UpperHalfPlane.dist_eq`).
  FuchsianOrbifolds L2.1 identifies both with the Riemannian ones.
- A lattice is a cofinite subgroup `Γ ≤ PSL₂(ℝ)` in Tau Ceti's sense (`Subgroup.IsCofinite`): `Γ` is
  discrete and its covolume `MeasureTheory.covolume Γ ℍ` is finite. A discrete `Γ` has a measurable
  fundamental domain (`Subgroup.exists_isFundamentalDomain`), and the covolume is the hyperbolic
  area of any such domain (`MeasureTheory.IsFundamentalDomain.covolume_eq_volume`). Cocompactness
  means that the translates of one compact set cover `ℍ`.
- Signatures are FuchsianOrbifolds Layer 4 item 5's `(g; m₁, …, m_r; c)` with `m_j ≥ 2`, and the
  area of a signature is `A = 2π(2g − 2 + Σ_j (1 − 1/m_j) + c)`.
- Quaternion algebras are presented as `B = ℍ[k,a,b]` with `a, b ≠ 0`, so `i² = a`, `j² = b`,
  `ij = −ji`. The reduced norm is Tau Ceti's `QuaternionAlgebra.normForm a 0 b`,
  `x₀² − a x₁² − b x₂² + ab x₃²`; the reduced trace is `x + x̄ = 2 x₀`; `B¹` is Mathlib's
  `unitary B`. `B` is a division algebra exactly when its norm form is anisotropic (Tau Ceti
  `QuaternionAlgebra.anisotropic_normForm_iff`), and otherwise `B ≃ M₂(k)` (Tau Ceti
  `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_iff_not_anisotropic_normForm`, for unit
  structure constants over a field in which `2` is invertible).
- Orders of `B` are the `𝓞_k`-subalgebras `O` with `TauCeti.IntegralOrder.IsOrder k O`: `O` is an
  `𝓞_k`-lattice in `B` (`Submodule.IsLattice`), finitely generated with `k`-span `B`. Maximal orders
  are those with `TauCeti.IntegralOrder.IsMaximalOrder k O`, maximal among orders for inclusion.
- The arithmetic data are a totally real field `k` of degree `n`, a quaternion algebra `B` over `k`
  and a `RealSplitting`: a real place `v₀` at which `B` splits, every other real place ramified,
  and a ring homomorphism `B → M₂(ℝ)` restricting to `v₀` on `k`. Conjugacy of lattices is stated
  in `PSL₂(ℝ)` with the splitting quantified; comparisons of algebraic embeddings are stated in
  `PGL₂(ℝ)`.
- For `γ ∈ PSL₂(ℝ)` the squared trace `tr(γ̃²)` is the same for both lifts `±γ̃ ∈ SL₂(ℝ)`.
- The completed Dedekind zeta function is `Λ_k(s) = |d_k|^(s/2) Γ_ℝ(s)^(r₁) Γ_ℂ(s)^(r₂) ζ_k(s)` in
  LFunctions' normalization, with `Γ_ℝ(s) = π^(−s/2) Γ(s/2)` and `Γ_ℂ(s) = 2(2π)^(−s) Γ(s)`.
- Adelic measures carry the AA.2.4 Tamagawa normalization. Local volumes are computed in the gauge
  `vol(𝒪_v) = 1` for the additive measure self-dual for the reduced-trace pairing and a character
  of conductor `𝒪_v`, with the single global multiplier `|d_k|^(−3/2)`.
- For `G = PSL₂(ℝ)` or `PGL₂(ℝ)`, `Comm_G(Γ)` is Mathlib's `Subgroup.Commensurable.commensurator`
  of `Γ` in `G`, and commensurability is `Subgroup.Commensurable`.

## Exact supplier contracts

### From Mathlib

- `Matrix.ProjectiveSpecialLinearGroup`, `Matrix.ProjGenLinGroup` (a `def`, with no topology),
  `Matrix.ProjectiveSpecialLinearGroup.toPGL`, `toPGL_injective` and `toPGL_surj_iff` (`toPGL` is
  onto exactly when every unit is a square, which fails over `ℝ` at `−1`)
  (`LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean`); the quotient topology and
  topological-group structure `QuotientGroup.instTopologicalSpace` and
  `QuotientGroup.instIsTopologicalGroup` (`Topology/Algebra/Group/Quotient.lean`); the
  `MulAction PGL(2, ℝ) UpperHalfPlane` instance (`Analysis/Complex/UpperHalfPlane/MoebiusAction.lean`)
  and its `FaithfulSMul` instance (`Analysis/Complex/UpperHalfPlane/FixedPoints.lean`);
- `UpperHalfPlane.volume_def` (`Analysis/Complex/UpperHalfPlane/Measure.lean`),
  `UpperHalfPlane.dist_eq`, `UpperHalfPlane.cosh_dist` (`cosh d(z,w) = 1 + |z − w|²/(2 Im z Im w)`)
  and the metric instance (`Analysis/Complex/UpperHalfPlane/Metric.lean`),
  `UpperHalfPlane.isPretransitiveSL2R` (`Analysis/Complex/UpperHalfPlane/MoebiusAction.lean`);
- `MeasureTheory.IsFundamentalDomain`, `MeasureTheory.covolume` (the measure of any fundamental
  domain, `0` when there is none) and `MeasureTheory.IsFundamentalDomain.covolume_eq_volume`
  (`MeasureTheory/Group/FundamentalDomain.lean`);
- `QuaternionAlgebra`, `unitary`, `NumberField.RingOfIntegers`, `NumberField.discr`,
  `NumberField.IsTotallyReal`, `NumberField.InfinitePlace.nrRealPlaces`, `nrComplexPlaces`,
  `NumberField.dedekindZeta` (`NumberTheory/NumberField/DedekindZeta.lean`),
  `IsDedekindDomain.HeightOneSpectrum.adicCompletion`, `Ideal.absNorm`;
- `NumberField.finite_of_discr_bdd` (`NumberTheory/NumberField/Discriminant/Basic.lean`), on
  finite-dimensional intermediate fields of one fixed extension of `ℚ`, and
  `Ring.HasFiniteQuotients.finite_absNorm_heightOneSpectrum_le` (`RingTheory/Ideal/Norm/AbsNorm.lean`:
  a Dedekind domain with finite quotients, such as `𝓞_k`, has finitely many height-one primes of
  bounded absolute norm);
- `Subgroup.Commensurable`, `Subgroup.Commensurable.commensurator` (`GroupTheory/Commensurable.lean`),
  `Subgroup.IsFiniteRelIndex`, `Group.IsSolvable`, `Group.FG`, `Maximal`, `PresentedGroup`;
- `jacobson_density` and `Module.Finite.toModuleEnd_moduleEnd_surjective`
  (`RingTheory/SimpleModule/Basic.lean`); `Algebra.IsCentral`, `IsSimpleRing`;
- `IsCoveringMap.existsUnique_continuousMap_lifts` (`Topology/Homotopy/Lifting.lean`), the lifting
  criterion for a simply connected, locally path-connected source, and
  `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul` (`Topology/Covering/Quotient.lean`:
  the orbit projection of a free, properly discontinuous action by homeomorphisms on a locally
  compact Hausdorff space is a covering map whose fibres are the orbits);
- `Complex.digamma`, `Real.eulerMascheroniConstant`, `MeasureTheory.convolution`.

### From Tau Ceti

- `QuaternionAlgebra.normForm` and `QuaternionAlgebra.anisotropic_normForm_iff` (a quaternion
  algebra over a field is a division algebra exactly when its norm form is anisotropic)
  (`TauCeti/Algebra/Quaternion/NormForm.lean`), and
  `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_iff_not_anisotropic_normForm` (for `a, b ∈ Kˣ`
  over a field `K` in which `2` is invertible, `ℍ[K,a,b] ≃ M₂(K)` exactly when the norm form is
  isotropic) (`TauCeti/Algebra/Quaternion/SplittingCriterion.lean`);
- `TauCeti.IntegralOrder.IsOrder` (`TauCeti/RingTheory/IntegralOrder/Basic.lean`: an `R`-subalgebra
  whose underlying submodule is an `R`-lattice in the `F`-algebra, `Submodule.IsLattice F`) and
  `TauCeti.IntegralOrder.IsMaximalOrder` (`TauCeti/RingTheory/IntegralOrder/Maximal.lean`: `Maximal`
  for `IsOrder`, with `IsMaximalOrder.isOrder`); used with `R = 𝓞_k`, `F = k`, `E = ℍ[k,a,b]`;
- `Subgroup.IsCofinite` (discrete, with `MeasureTheory.covolume Γ ℍ ≠ ∞`),
  `Subgroup.exists_isFundamentalDomain`, `Subgroup.IsCofinite.volume_ne_top`,
  `MeasureTheory.IsFundamentalDomain.isCofinite_of_volume_ne_top`,
  `Subgroup.isCofinite_iff_isCofinite_and_finiteIndex` and `Subgroup.isCofinite_conjAct_smul_iff`
  (`TauCeti/Analysis/Complex/Fuchsian/Covolume.lean`); `MeasureTheory.covolume_pos` (positivity),
  `MeasureTheory.covolume_conjAct_smul` (conjugation invariance) and
  `MeasureTheory.covolume_eq_card_mul_covolume` (for `Δ ≤ Γ`, the covolume of `Δ` is the index times
  the covolume of `Γ`) (`TauCeti/MeasureTheory/Group/FundamentalDomain.lean`);
- `UpperHalfPlane.instMulActionPSL2`, `UpperHalfPlane.toPGL_smul`, and the `FaithfulSMul` and
  `SMulInvariantMeasure` instances for `PSL(2, ℝ)` on `(ℍ, volume)`
  (`TauCeti/Analysis/Complex/UpperHalfPlane/PSL/Action.lean`);
- `TauCeti.ratPosToPSL2R` (`TauCeti/Analysis/Complex/UpperHalfPlane/RatPSLAction.lean`), the map
  from `GL₂(ℚ)⁺` to `PSL₂(ℝ)`;
- `TauCeti.skolemNoether` (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean`): two algebra maps
  from a central simple algebra to a finite-dimensional simple algebra are conjugate by a unit;
- `TauCeti.dedekindZeta_eulerProduct_hasProd`
  (`TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean`), the Euler product
  of `ζ_k` on `Re s > 1`;
- `Subgroup.AlmostConjugate` (`TauCeti/GroupTheory/AlmostConjugate.lean`): equal intersection counts
  with every conjugacy class;
- `Subgroup.isClosed_center` (`TauCeti/Topology/Algebra/Group/Subgroup.lean`): the centre of a
  Hausdorff group with separately continuous multiplication is closed;
- `TauCeti.instIsManifoldQuotient` and `TauCeti.isLocalDiffeomorph_quotientMk`
  (`TauCeti/Geometry/Manifold/Instances/Quotient.lean`): for a free, properly discontinuous action
  by `C^n` maps on a Hausdorff, locally compact `C^n` manifold, the orbit space is a `C^n` manifold
  and the orbit projection a `C^n` local diffeomorphism;
- `Bundle.ContMDiffRiemannianMetric.quotient` and
  `Bundle.ContMDiffRiemannianMetric.isLocalRiemannianIsometry_descend`
  (`TauCeti/Geometry/Manifold/Riemannian/Pullback/Descent.lean`): a smooth metric preserved by such
  an action descends to the orbit space, and the projection is then a local Riemannian isometry
  (`TauCeti.IsLocalRiemannianIsometry`, `TauCeti/Geometry/Manifold/Riemannian/Isometry/Local.lean`);
- `TauCeti.RiemannianIsometry` (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Basic.lean`) and
  `TauCeti.RiemannianIsometry.riemannianEDist_eq`
  (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Distance.lean`): a Riemannian isometry preserves
  the Riemannian extended distance;
- `TauCeti.UpperHalfPlane.poincareRiemannianMetric`
  (`TauCeti/Analysis/Complex/UpperHalfPlane/PoincareMetric.lean`), the Poincaré metric
  `(Re v Re w + Im v Im w)/y²` on `ℍ` over the real model `𝓘(ℝ, ℂ)`, whose distance FuchsianOrbifolds
  L2.1 identifies with Mathlib's.

### From TauCetiRoadmap.FuchsianOrbifolds

Layer 0 item 1 (the quotient topology of `PSL₂(ℝ)`, Hausdorff, second countable, a topological
group), item 2 (the `PGL₂(ℝ)` action and the map `PSL₂(ℝ) → PGL₂(ℝ)`, faithful and isometric) and
item 3 (proper discontinuity of discrete subgroups); Layer 2 item 1, L2.1 (the hyperbolic metric,
distance and area comparison with Mathlib's, the isometric `PSL₂(ℝ)` and `PGL₂(ℝ)` actions,
covolume through measurable fundamental domains, Gauss–Bonnet), item 3 (Poincaré's polygon theorem
with the side-pairing presentation: generated by the pairing maps, with the vertex-cycle relators),
item 4 (the Dirichlet polygon of a cofinite group, finite-sided, side-paired and presenting it in
that way) and item 5 (its elliptic cycles, cusp orbits and polygon genus); these give the
side-pairing presentation only, and the standard presentation is §1.4 here; Layer 4 item 5 (the
orbifold signature and its area);
Layer 4a (the compact minimum `π/21`, and the cusped minimum `π/3`, its named target
`minimum_area_finite_area_orbifold`); Layer 5 item 5 (the compactified quotient map `X(Γ′) → X(Γ)`
of a finite-index inclusion as a finite holomorphic map of degree the index), item 6 (the Fuchsian
Riemann–Hurwitz formula) and item 7 (the genus bridge between the polygon genus and the genus of
the compactified quotient, and the orbifold area formula
`covolume Γ = 2π(2g − 2 + Σₑ(1 − 1/mₑ) + c)`, its `covolume_eq_two_pi_mul_signature`).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§6.2: `τ(S) = 1` for every simply connected semisimple group `S` over a number field, with the
AA.2.4 Tamagawa measure; applied to `S = SL₁(B)`, an inner form of `SL₂`.

### From TauCetiRoadmap.AdelicAlgebraicGroups

AA.2.4 (gauge forms, the Tamagawa normalization and quotient volumes), AA.3.4 (finiteness of the
volume of arithmetic quotients, compactness of anisotropic quotients, and the finiteness of
`G(k)\G(𝔸_(k,f))/U` for compact open `U`, its `Reduction.finite_classes`), AA.4.2 (strong
approximation for simply connected absolutely almost simple groups noncompact at a given place).

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

R17.1.5: a set of places is the ramification set of a quaternion algebra over a number field
exactly when it is finite, contains only real infinite places and has even cardinality, and two
quaternion algebras are isomorphic exactly when their local splitting predicates agree at every
place.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§7.60: the reduced-norm image of `B^×` is the set of elements positive at the ramified real places,
the local image is `k_v^×` at every finite place and `ℝ_(>0)` at a ramified real place, and the
units of a local maximal order have reduced-norm image `𝒪_v^×`.

### From TauCetiRoadmap.LFunctions and TauCetiRoadmap.ZerosOfLFunctions

LFunctions Layer 3: continuation, poles, residue and functional equation of `Λ_k`. ZerosOfLFunctions
§1.4 (logarithmic derivatives of `Γ_ℝ` and `Γ_ℂ` through the digamma function), §3.1 (finite order
of the entire completion), §§3.4–3.5 (growth on vertical strips), and Layer 5 with §5.6 (Hadamard
factorization at order one and the grouped partial-fraction expansion of `Λ_k'/Λ_k`).

### From TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases

§1.0: for every number field `K` of degree `n` and signature `(r₁, r₂)`, and every real even,
compactly supported `C¹` function `F`, piecewise `C²` with integrable second derivative,
`F(0) = 1` and `F(x) = 1 + O(x²)`, with `Φ(s) = ∫ F(x) e^((s−1/2)x) dx`,

    log |d_K| = r₁π/2 + n(γ + log 8π) − n ∫₀^∞ (1−F(x))/(2 sinh(x/2)) dx
                − r₁ ∫₀^∞ (1−F(x))/(2 cosh(x/2)) dx − 4 ∫₀^∞ F(x) cosh(x/2) dx
                + Σ_ρ Φ(ρ) + 2 Σ_𝔭 Σ_(m≥1) log(N𝔭) N𝔭^(−m/2) F(m log N𝔭).

§1.6: for `f` even, continuous, compactly supported, nonnegative and positive definite, and
`F(x) = f(x)/cosh(x/2)`, `Re Φ(s) ≥ 0` for `0 ≤ Re s ≤ 1`.

### From TauCetiRoadmap.ReductiveGroupsPartII

RG2.2.1 (the enlarged building and its bounded fixed-point theorem,
`Building.exists_fixedPoint_of_bounded`), RG2.2.2 (the reduced `GL₂` building and its comparison
with the enlarged carrier), RG2.2.4 (the tree of `SL₂`, the type function of `BTTree`, `type_smul`
and `sl2_preserves_type`). These are distinct carriers; their comparison with orders is §1.2 here.

### From TauCetiRoadmap.RepresentationTheory

LieGroups (the closed-subgroup theorem and automatic smoothness of continuous homomorphisms),
SemisimpleAlgebras Layer 3 (the double-centralizer theorem, with Mathlib's density theorem), and
InductionRestriction Layer 2.1 (finite almost conjugacy is equivalent to equivalence of the
permutation representations).

### From TauCetiRoadmap.FreeGroupsAndLimitGroups

§6.1 (`SurfaceGroup.orientable`: `S⁺(g, m)` is the `PresentedGroup` on
`a₁, b₁, …, a_g, b_g, p₁, …, p_m` with the single relator `[a₁, b₁] ⋯ [a_g, b_g] p₁ ⋯ p_m`, `[x, y] = x⁻¹y⁻¹xy`, and peripheral
elements `p_j`); §§6.0a–6.0c (finite polygonal surface models with boundary, their normal forms
under subdivision and face splitting, and face presentations); §6.1a (`SurfaceGroup.modelEquiv`:
the face group of a finite connected orientable surface model of genus `g` with `m` boundary
components is isomorphic to `S⁺(g, m)`, each boundary traversal going to a conjugate of some
`p_j^(±1)`, bijectively on boundary components).

### From TauCetiRoadmap.NoncompactQuantumSymmetry and PseudodifferentialOperators

NoncompactQuantumSymmetry M1 (the finite-index
lattice-quotient `L²` adapter for induced representations). PseudodifferentialOperators P7a, Layer
8 (finite-deck scalar-Laplacian transplantation, on P7's compact-resolvent spectral theory).

## How to read the build

Layer 1 is arithmetic. §1.1 builds orders, real splittings and the lattices `Γ(O)`; §1.2 computes
their covolumes from Tamagawa number one and builds the normalizers and the local order-to-tree
adapter; §1.3 develops the squared-trace field and the trace envelope of an arbitrary finitely
generated nonelementary subgroup. The envelope and invariance targets of §1.3 need only
FuchsianOrbifolds Layer 0 and the algebraic suppliers and proceed in parallel with §§1.1–1.2; its
trace-integrality and `Γ(O)` statements need §1.1. §1.3b and §1.5 are the two discriminant bounds,
built from the analytic suppliers alone and in parallel with the rest; §1.4 proves the standard
presentation of a cofinite group from FuchsianOrbifolds' polygons and FreeGroupsAndLimitGroups'
surface models, and combines it and §§1.1–1.3 with §1.3b into the finiteness of arithmetic lattices
of bounded covolume and of a fixed signature. Layer 2 proves the commensurator criterion from
Layer 1 and the Lie-theoretic and boundary-theoretic inputs, and passes to `PGL₂(ℝ)` with its
quotient topology. Layer 3 identifies the isometries of `ℍ` and lifts isometries between quotient
surfaces to them, verifies the finite order-32 pair, which depends on nothing in Layers 1 and 2,
and assembles the isospectral covers from §1.4's standard presentation, Layer 2's maximality
consequence and the analytic transplantation suppliers.

## Layer 1: quaternion orders, arithmetic lattices and discriminant bounds

This layer constructs and classifies arithmetic Fuchsian lattices, including the noncocompact
split examples. The finiteness theorems of §1.4 assume arithmeticity; no finiteness is claimed for
all lattices of a signature or of bounded covolume.

### 1.1 Real splittings, orders and the lattices `Γ(O)`

Define `RealSplitting k a b` for a field `k` and `a, b ∈ k`: a ring homomorphism `place : k → ℝ`,
the nonvanishing of `a` and `b`, the condition that `σ(a) < 0` and `σ(b) < 0` for every other ring
homomorphism `σ : k → ℝ`, and a ring homomorphism `ℍ[k,a,b] → M₂(ℝ)` sending each scalar `x` to the
scalar matrix `place(x)`. For a number field the last field induces an isomorphism
`ℍ[k,a,b] ⊗_(k,place) ℝ ≃ M₂(ℝ)`, so `B` splits at `place` and ramifies at every other real place.

- Two real splittings with the same place differ by conjugation by an element of `GL₂(ℝ)`
  (`TauCeti.skolemNoether`), so every construction below is defined up to `PGL₂(ℝ)`-conjugacy.
- If `k` is totally real of degree `n`, a real splitting exists exactly when `B` ramifies at the
  `n − 1` real places other than `place` and splits at `place`; the ramification set then has
  `n − 1` real places and, by GL2AutomorphicRepresentationsAndTransfer R17.1.5, an even total
  cardinality, so its finite part has the parity of `n − 1`.
- When `n ≥ 2`, `B` ramifies at a real place and is a division algebra; the split case
  `B ≃ M₂(k)` occurs only for `k = ℚ`.

**Checks.**

- Over `ℚ(√2)` with `(a,b) = (−1, √2)`, take `place : √2 ↦ 1.414…`: the other embedding sends
  `a ↦ −1 < 0` and `b ↦ −1.414… < 0`, so it ramifies, and `place` sends `b` to a positive number, so
  `B` splits there and a real splitting exists. With `place : √2 ↦ −1.414…` the other embedding
  sends `b` to `1.414… > 0`, so no real splitting exists with that place.
- Over `ℚ` the Hamilton quaternions `(−1,−1)` have no real splitting: a ring homomorphism to `M₂(ℝ)`
  restricting to the real embedding would make the real Hamilton quaternions, a division algebra,
  isomorphic to `M₂(ℝ)`.
- Over `ℚ(√2)` the algebra `(1,1) ≃ M₂(ℚ(√2))` splits at both real places, so the ramification
  condition fails for either choice of `place`; a definition that only asked for one split place
  would accept it, and `Γ(O)` would then not be discrete in `PSL₂(ℝ)`.

Orders and maximal orders of `ℍ[k,a,b]` are Tau Ceti's `TauCeti.IntegralOrder.IsOrder k O` and
`TauCeti.IntegralOrder.IsMaximalOrder k O` for an `𝓞_k`-subalgebra `O` (Conventions). Prove for them:

- Every order is contained in a maximal order (Noetherian induction on the reduced discriminant).
- At a finite place where `B` is a division algebra, the valuation ring of `B_v` is the unique
  maximal order; at a split finite place the maximal orders of `M₂(k_v)` are the `End(L)` for lattices
  `L ⊆ k_v²` (§1.2).

**Checks.**

- In `ℍ[ℚ,1,1] ≃ M₂(ℚ)`, `M₂(ℤ)` is a maximal order; the Eichler order of level 2, the integral
  matrices with lower-left entry even, is an order strictly contained in it, hence not maximal.
- In `ℍ[ℚ,−1,−1]` the Lipschitz order `ℤ⟨1,i,j,ij⟩` is an order strictly contained in the Hurwitz
  order, which adds `(1+i+j+ij)/2`; the Hurwitz order is maximal.
- `ℤ·1` is finitely generated but spans only `ℚ·1`, so it is not an order; `ℤ[1/2]·ℤ⟨1,i,j,ij⟩` spans
  the algebra but is not finitely generated over `ℤ`, so it is not an order either.

Define `normOneImage S O`, written `Γ(O)`: the subgroup of `PSL₂(ℝ)` generated by the classes
`projSL(g)` of the matrices `g = S.splitting(x)` for `x ∈ O ∩ B¹`; these matrices have determinant
one because the determinant of the splitting is the reduced norm read through `place`. Define
`IsArithmetic Γ`: for some totally real number field `k`, quaternion algebra `ℍ[k,a,b]` with a real
splitting `S`, order `O` and `c ∈ PSL₂(ℝ)`, the conjugate `cΓc⁻¹` is commensurable with `Γ(O)`.
Finite-index subgroups and nonmaximal orders are included. Lattices are the cofinite subgroups
`Subgroup.IsCofinite` of Tau Ceti (Conventions).

- `isCofinite_normOneImage`: for a totally real number field `k`, a real splitting `S` of `ℍ[k,a,b]`
  and an order `O`, `Γ(O)` is a lattice: discrete, with finite covolume. Route: AA.3.4's finiteness
  of arithmetic quotients for `SL₁(B)` over `k`; the factors of `SL₁(B)(k ⊗ ℝ)` at the ramified real
  places are compact, so projection to the distinguished factor `SL₂(ℝ)` gives a discrete subgroup
  of finite covolume (Voight, Proposition 38.3.8 for discreteness).
- `cocompact_normOneImage_iff_anisotropic`: under the same hypotheses, the translates of one compact
  set cover `ℍ` exactly when the norm form of `ℍ[k,a,b]` is anisotropic, that is, when `B` is a
  division algebra. The division case is AA.3.4's anisotropic compactness (Voight, Main Theorem
  38.4.3); in the split case `k = ℚ`, `B = M₂(ℚ)`, and `Γ(O)` is commensurable up to conjugacy with
  `PSL₂(ℤ)` and contains parabolic elements, so the quotient has a cusp.
- Every arithmetic group is a lattice, and every finite-index subgroup of an arithmetic group is
  arithmetic. Route: if `cΓc⁻¹` is commensurable with `Γ(O)`, the intersection is cofinite by
  `Subgroup.isCofinite_iff_isCofinite_and_finiteIndex`; a group containing a discrete subgroup with
  finite index is discrete, so the same lemma makes `cΓc⁻¹` cofinite, and
  `Subgroup.isCofinite_conjAct_smul_iff` passes back to `Γ`.

**Checks.**

- For `k = ℚ`, `(a,b) = (1,1)` and the order mapping to `M₂(ℤ)`, `Γ(O)` is conjugate to the image of
  `SL₂(ℤ)`: a lattice of covolume `π/3` with one cusp, and the norm form `x₀² − x₁² − x₂² + x₃²` is
  isotropic, as the cocompactness criterion requires.
- For `k = ℚ` and `(a,b) = (−1,3)`, `B` splits at `∞` (`a < 0 < b`) and is a division algebra: the norm
  form `x₀² + x₁² − 3x₂² − 3x₃²` is anisotropic, since `3 | x₀² + x₁²` forces `3 | x₀, x₁` and infinite
  descent; so `Γ(O)` is cocompact, the Shimura-curve group of discriminant 6.
- `O = ℤ·1` is not an order and gives `Γ(O) = {1}`, which is not a lattice: a fundamental domain of
  the trivial group is `ℍ`, of infinite area. This is why both theorems assume an order.
- `IsArithmetic` holds for `PSL₂(ℤ)` and for every finite-index subgroup of it; it fails for the
  trivial group, which is not commensurable with an infinite `Γ(O)`, and for the Hecke group
  `G₅ = ⟨z ↦ −1/z, z ↦ z + φ⟩`, `φ = (1+√5)/2`: it has a cusp, so an arithmetic structure would
  have `k = ℚ`, but `tr(ST)² = φ² = φ + 1 ∉ ℚ` contradicts the field identification `K₀ = k` of
  §1.3. Trace integrality alone does not exclude it: `tr(ST) = φ` is an algebraic integer, and
  every trace of `G₅` lies in `ℤ[φ]`.
- The lattice property fails for `⟨z ↦ z + 1⟩`, which is discrete with the strip `0 < Re z < 1` of
  infinite area as fundamental domain, so its covolume is `∞`, and for the image of `GL₂(ℚ)⁺`
  (`TauCeti.ratPosToPSL2R`), which is not discrete.

*Needs:* Mathlib `QuaternionAlgebra`, `unitary`, `NumberField.IsTotallyReal`,
`MeasureTheory.IsFundamentalDomain`, `MeasureTheory.covolume`; Tau Ceti
`UpperHalfPlane.instMulActionPSL2`, `QuaternionAlgebra.normForm`,
`QuaternionAlgebra.anisotropic_normForm_iff`, `TauCeti.skolemNoether`,
`TauCeti.IntegralOrder.IsOrder`, `TauCeti.IntegralOrder.IsMaximalOrder`, `Subgroup.IsCofinite`,
`Subgroup.isCofinite_iff_isCofinite_and_finiteIndex`, `Subgroup.isCofinite_conjAct_smul_iff`;
AdelicAlgebraicGroups AA.3.4;
GL2AutomorphicRepresentationsAndTransfer R17.1.5; FuchsianOrbifolds Layer 0 items 1–3 and L2.1.
(Voight, Proposition 38.3.8 and Main Theorem 38.4.3; Borel 1981, §§3–4.)

### 1.2 Covolumes and normalizers

Define `finiteRamification a b`: the finite places `v` of `k` at which the norm form of
`ℍ[k_v, a, b]` is anisotropic, that is, the finite part of the ramification set of
GL2AutomorphicRepresentationsAndTransfer R17.1.5.

- It is finite, and its cardinality has the parity of the number of ramified real places.
- It is unchanged when `a` or `b` is multiplied by a nonzero square.

**Checks.**

- For `(−1,−1)` over `ℚ` it is `{2}`: the Hilbert symbol `(−1,−1)_p` is `1` for odd `p`, and at `2`
  the algebra is the local division algebra.
- For `(−1,3)` over `ℚ` it is `{2, 3}`: `(−1,3)_3 = (−1/3) = −1`, and the product formula forces
  ramification at `2` as well, while `∞` is split.
- For `(1,1)` over `ℚ` it is empty; for `(−1,−1)` over `ℚ(√2)` it is also empty, since that algebra
  ramifies exactly at the two real places, so the set depends on the field and not only on `a, b`.

`covolume_normOneImage`: for a totally real field `k` of degree `n`, a real splitting `S` of
`B = ℍ[k,a,b]` and a maximal order `O`, the covolume of `Γ(O)`, the area of any measurable
fundamental domain, is

    covol(Γ(O)) = 8π |d_k|^(3/2) ζ_k(2) (4π²)^(−n) ∏_(𝔭 ∈ Ram_f(B)) (N𝔭 − 1).

The formula covers the division case and the split case `k = ℚ`, `B = M₂(ℚ)`, `O ≃ M₂(ℤ)`, where it
reads `π/3`. Route, in four steps:

- (a) Tamagawa number one: `τ(SL₁(B)) = 1` for the AA.2.4 measure,
  EndoscopicTransferAndUnitaryTraceComparison §6.2 applied to the inner form `SL₁(B)` of `SL₂`;
  `SL₁(B)` is simply connected and semisimple with trivial character group, so `ρ_G = 1` and no
  convergence factors occur.
- (b) Real places: in Iwasawa coordinates the determinant-fibre Haar measure of `SL₂(ℝ)` is
  `dx dy dθ/(2y²)`, and the stabilizer angle has period `π` in `PSL₂(ℝ)`, giving `(π/2)` times
  hyperbolic area; at each of the other `n − 1` real places `vol(SL₁(ℍ)) = 4π²` from the
  reduced-trace self-dual measure and the coarea formula on the unit sphere of `ℝ⁴`.
- (c) Finite places of residue cardinality `q`: in the gauge `vol(𝒪_v) = 1` the maximal-order unit
  fraction is `1 − q⁻²` at a split place, and at a division place the maximal order has volume `q⁻¹`,
  so its norm-one volume is `(1 − q⁻²)/(q − 1)` after dividing by the reduced-norm image `𝒪_v^×` of
  volume `1 − q⁻¹` (ClassicalArithmeticCompletion §7.60); the product over all finite places is
  `ζ_k(2)⁻¹ ∏_(𝔭 ∈ Ram_f)(N𝔭 − 1)⁻¹` by `TauCeti.dedekindZeta_eulerProduct_hasProd` at `s = 2`.
- (d) Strong approximation for `SL₁(B)`, noncompact at `v₀` (AA.4.2), identifies the adelic quotient
  with `Γ(O)\SL₂(ℝ)` times the compact local factors; with the global multiplier `|d_k|^(−3/2)`,
  `1 = |d_k|^(−3/2) (π/2) area(Γ(O)\ℍ) (4π²)^(n−1) ζ_k(2)⁻¹ ∏(N𝔭 − 1)⁻¹`, which rearranges to the
  displayed formula.

This roadmap owns the local volumes, the real Haar-to-area normalization and the passage from the
supplier statements to the formula (Voight, Main Theorem 39.1.8 and (39.1.9) with `t = 1`, `r = n`,
`c = 0` and the Eichler symbol `−1` at ramified primes; Theorem 39.1.2 over `ℚ`; Borel 1981,
Theorem 7.3).

For a maximal order `O`, define the positive normalizer
`N_B⁺(O) = {[g] ∈ B^×/k^× : g O g⁻¹ = O, v₀(Nrd g) > 0}`, mapped into `PSL₂(ℝ)` by the splitting;
positivity of the reduced norm is well defined modulo scalars. Define
`ν : N_B⁺(O) → k^×/(k^×)²`, `ν([g]) = [Nrd g]`.

- `N_B⁺(O)` is a discrete subgroup of `PSL₂(ℝ)` containing `Γ(O)` with finite index, `ker ν = Γ(O)`,
  and `N_B⁺(O)/Γ(O) ≃ im ν`; the projective image is not divided by squares a second time.
- `im ν` is a finite elementary abelian 2-group, computed from the local normalizer conditions and
  the image of the global points in the adelic normalizer double coset; the global class
  constraint is part of the computation, which is not a product of independent local quotients.
- Finite-index covolume scaling: `area(N_B⁺(O)\ℍ) = area(Γ(O)\ℍ)/[N_B⁺(O) : Γ(O)]`, and for an order
  `O′ ⊆ O`, `[Γ(O) : Γ(O′)]` is finite and `area(Γ(O′)\ℍ) = [Γ(O) : Γ(O′)] area(Γ(O)\ℍ)`; the index
  formula itself is Tau Ceti's `MeasureTheory.covolume_eq_card_mul_covolume`, and what is proved
  here is the finiteness of the two indices.
- The local order-to-tree adapter at a split finite place `v`: `[L] ↦ End_(𝒪_v)(L)` is a bijection
  from vertices of the tree of `PGL₂(k_v)` (RG2.2.2, RG2.2.4) to maximal orders of `M₂(k_v)`; adjacent
  vertices correspond to maximal orders meeting in an Eichler order of level `v`; conjugation of
  orders agrees with the action on the tree. The pointwise stabilizer of an edge is distinguished
  from its setwise stabilizer, which may exchange the endpoints and is the normalizer of the
  Eichler order. Order units, scalar quotients and normalizers are identified with the
  corresponding stabilizers, with the determinant and reduced-norm restrictions. A compact
  type-preserving subgroup that fixes a midpoint of an edge (RG2.2.1's
  `Building.exists_fixedPoint_of_bounded`) fixes both endpoints, hence a vertex.
- At a finite division place, the unique maximal order is the valuation ring of `B_v`, with
  normalizer all of `B_v^×`.

**Checks.**

- For `M₂(ℤ)`: the normalizer in `GL₂(ℚ)` is `ℚ^× GL₂(ℤ)`, so `N_B⁺(O)` is the image of `SL₂(ℤ)` and
  `im ν` is trivial. The covolume formula gives `8π · ζ(2)/(4π²) = π/3`, the area of the
  `(0; 2, 3; 1)` quotient.
- For the maximal order of `(−1,3)_ℚ` (discriminant 6) the formula gives `(π/3)(2−1)(3−1) = 2π/3`, the
  area of signature `(0; 2, 2, 3, 3)`; the Atkin–Lehner elements of reduced norms `2, 3, 6` give
  `im ν = {1, 2, 3, 6}` mod squares, and the normalizer has area `(2π/3)/4 = π/6`, the area of the
  `(2, 4, 6)` triangle group.
- For the Hurwitz order over `k = ℚ(cos 2π/7)`, `d_k = 49`, `n = 3`, `Ram_f = ∅` and
  `ζ_k(2) = 8π⁶/(21 · 343)`, so the formula gives `8π · 343 · ζ_k(2)/(4π²)³ = π/21`, the area of the
  `(2, 3, 7)` triangle group; omitting the `(4π²)^(−n)` factor or using `|d_k|^(1/2)` would not.
- A level-2 Eichler order of `M₂(ℤ)` gives `Γ₀(2)`, of index `3` in `PSL₂(ℤ)` and area `π`, matching
  finite-index scaling; it is the intersection of the two maximal orders at adjacent vertices of the
  tree at `2`.

*Needs:* §1.1; EndoscopicTransferAndUnitaryTraceComparison §6.2; AdelicAlgebraicGroups AA.2.4 and
AA.4.2; ClassicalArithmeticCompletion §7.60; ReductiveGroupsPartII RG2.2.1, RG2.2.2, RG2.2.4;
Tau Ceti `TauCeti.dedekindZeta_eulerProduct_hasProd`; Mathlib `NumberField.dedekindZeta`,
`IsDedekindDomain.HeightOneSpectrum.adicCompletion`; FuchsianOrbifolds L2.1.
(Voight, Main Theorem 39.1.8, Theorem 39.1.2; Borel 1981, Theorem 7.3.)

### 1.3 Squared-trace data and the trace envelope

Let `Γ ≤ PSL₂(ℝ)` be finitely generated and nonelementary. Define `liftSL Γ`, the full preimage of
`Γ` in `SL₂(ℝ)`; `squareSubgroup Γ`, written `Γ^(2)`, the subgroup generated by the squares `γ²`;
`squaredTraceField Γ`, written `K₀(Γ) = ℚ(tr(γ̃²) : γ ∈ Γ)`; and `traceEnvelope Γ`, written
`A_Γ`, the `K₀(Γ)`-span in `M₂(ℝ)` of every determinant-one lift of every element of `Γ^(2)`, both
signs included. Define `IsNonelementary Γ`: no finite-index subgroup of `Γ` is solvable;
equivalently `Γ` has no finite orbit on `ℍ ∪ ∂ℍ`.

- `Γ^(2)` has finite index in `Γ`, at most `2^r` for a group generated by `r` elements, and `K₀(Γ)` is
  finitely generated over `ℚ`, by the identity `tr(X) tr(Y) = tr(XY) + tr(XY⁻¹)` on a finite
  generating set.
- The trace adapter: `K₀(Γ) = ℚ(tr(η̃) : η ∈ Γ^(2))`; changing the sign of a lift changes a trace by
  a rational sign.
- `traceEnvelope_isCentral_isSimpleRing_finrank_eq_four`: for finitely generated nonelementary `Γ`,
  `A_Γ` is the underlying `K₀(Γ)`-subspace of a `K₀(Γ)`-subalgebra of `M₂(ℝ)` (so it contains `1` and
  is closed under multiplication) that is central (`Algebra.IsCentral`), simple (`IsSimpleRing`) and
  of dimension four over `K₀(Γ)`, without assuming `K₀(Γ)` algebraic; it is the quaternion algebra
  recovered from the squared traces. Route: absolute irreducibility of `Γ^(2)`, Mathlib's
  `jacobson_density` and `Module.Finite.toModuleEnd_moduleEnd_surjective`, SemisimpleAlgebras
  Layer 3's double-centralizer theorem, and reconstruction from the trace form; the
  finite-dimensionality, absolute irreducibility and scalar commutant of `Γ^(2)` are proved first.
- `invariant_squared_trace_data_finite_index`: for `Δ ≤ Γ` of finite index, `K₀(Δ) = K₀(Γ)` and
  `A_Δ = A_Γ` as subsets of `M₂(ℝ)`; `Δ^(2) ≤ Γ^(2)` gives `A_Δ ≤ A_Γ`, and both have dimension four
  over the common field.
- `invariant_squared_trace_data_commensurable`: if `cΔc⁻¹` is commensurable with `Γ` for
  `c ∈ SL₂(ℝ)`, then `K₀(Δ) = K₀(Γ)` and `A_Γ = c A_Δ c⁻¹`.
- `integral_trace_lattice_order`: for a number field `K`, `a, b ≠ 0` and a subgroup `H ≤ ℍ[K,a,b]¹`
  whose `K`-span is the algebra and whose reduced traces are algebraic integers, the `𝓞_K`-span of
  `H` is an order contained in a maximal order. Route: choose a `K`-basis `h₁, …, h₄` in `H`; with
  `L = Σ 𝒪_K h_i` and `L^#` its reduced-trace dual, `trd(h h_i) ∈ 𝒪_K` gives `L ⊆ R ⊆ L^#`;
  Noetherianity gives finite generation and the group law gives closure under multiplication. `H`
  need not be finitely generated.
- `squared_trace_integrality_of_commensurable_arithmetic_group`: if `Γ` is arithmetic, every lift
  `g ∈ liftSL Γ` has `tr(g²)` and `tr(g)` algebraic integers. Route: some `γ^m` lies in the conjugate
  of `Γ(O)`, so an eigenvalue `λ` has `λ^m` and `λ^(−m)` integral; `t = λ² + λ⁻²` satisfies the monic
  equation `P_m(t) = λ^(2m) + λ^(−2m)` for the monic integral Chebyshev polynomial `P_m`, and
  `(tr g)² = t + 2` gives the ordinary trace.
- For `Γ = Γ(O)` the `k`-span of the norm-one lifts of `Γ(O)^(2)` is `B` and `K₀(Γ(O)) = k`, so
  `A_(Γ(O)) ≃ B`. The span is an explicit density statement for this square-generated subgroup. For
  the field: if `K₀ ⊊ k`, an embedding of `K₀` extends to the split real place and to a ramified one;
  the two complex representations of the norm-one preimage of `Γ(O)^(2)` then have equal characters,
  are absolutely irreducible, hence isomorphic, which would place the noncompact lattice inside the
  compact group `SL₁(ℍ)`. Real splittings are compared in `PGL₂(ℝ)` by `TauCeti.skolemNoether`, and
  the two possible `PSL₂(ℝ)`-conjugacy classes are treated separately.

**Checks.**

- `liftSL` of the trivial group is the centre `{±I}`; `Γ^(2)` of `PSL₂(ℤ) ≃ C₂ ∗ C₃` has index 2, the
  kernel of the map to `C₂`; `Γ^(2)` of a group of order two is trivial.
- `K₀(PSL₂(ℤ)) = ℚ` and `A = M₂(ℚ)`; for the `(2, 3, 7)` triangle group `K₀ = ℚ(cos 2π/7)`, of degree
  three, and `A` is the quaternion algebra over it ramified at the two non-identity real places;
  for the Hecke group `G₅`, `tr((ST)²) = φ² − 2 = φ − 1`, so `K₀ ⊇ ℚ(√5)`.
- Nonelementarity is needed: for `Γ = ⟨diag(λ, λ⁻¹)⟩` with `t = λ² + λ⁻²` transcendental,
  `K₀(Γ) = ℚ(t)` while its index-two subgroup `⟨diag(λ², λ⁻²)⟩` has `K₀ = ℚ(t² − 2) ≠ ℚ(t)`; and for
  the trivial group `A = ℚ·I` has dimension one, not four.
- `IsNonelementary` fails for the trivial group, for every finite group and for
  `⟨z ↦ 2z, z ↦ −1/z⟩`, which has an abelian subgroup of index two and the finite orbit `{0, ∞}`;
  it holds for `PSL₂(ℤ)`, whose finite-index subgroups contain free groups of rank two.
- The direction of conjugation: for `Γ = PSL₂(ℤ)`, `c = diag(2^(1/6), 2^(−1/6))` and `Δ = c⁻¹Γc`,
  `c A_Δ c⁻¹ = M₂(ℚ)`, while `c⁻¹ A_Δ c` has entries scaled by `2^(±2/3)`.
- For `H = SL₂(ℤ)` in `M₂(ℚ)`, the `ℤ`-span of `I`, `I + E₁₂`, `I + E₂₁` and `(2 1; 1 1)` is `M₂(ℤ)`; for
  `H = {±1}` the span is `ℚ·1`, so the span hypothesis fails.
- A group containing `diag(2, 1/2)` has a trace `5/2` that is not integral, so it is not arithmetic.

*Needs:* FuchsianOrbifolds Layer 0; §1.1; Mathlib `jacobson_density`,
`Module.Finite.toModuleEnd_moduleEnd_surjective`, `Subgroup.Commensurable`, `Group.IsSolvable`;
SemisimpleAlgebras Layer 3; Tau Ceti `TauCeti.skolemNoether`. (Maclachlan–Reid, Theorem 11.2.1, for
the square-subgroup and maximal-order argument.)

### 1.3b Odlyzko's estimate (5) for every signature

`discr_ge_odlyzko_five`: every number field `k` with `r₁` real and `r₂` complex places satisfies
`|d_k| ≥ 58.6^(r₁) · 21.8^(2r₂) · e^(−70)` (Odlyzko 1977, Theorem 1, estimate (5), p. 210, with the
sum `f₂ ≥ 0` dropped). The route is Odlyzko's.

- Equation (7) puts `A = D^(1/2) 2^(−r₂) π^(−n/2)`, and the Stark identity (8) (p. 212) is
  `log A = G(s) − 1/(s−1) − 1/s + Z(s) + Σ′_ρ 1/(s − ρ)` with `G(s) = −(r₁/2)ψ(s/2) − r₂ψ(s)`,
  `Z(s) = Σ_𝔭 log N𝔭/(N𝔭^s − 1)` for `Re s > 1` and the zeros grouped with `1 − ρ`. It is derived from
  LFunctions Layer 3's completion, ZerosOfLFunctions Layer 5's Hadamard factorization and §5.6's
  partial-fraction expansion, and ZerosOfLFunctions §1.4's digamma formulas; no second completed
  zeta function or Hadamard product is built.
- For real `σ > 1` put `Z_j(σ) = ((−1)^j/j!) Z^((j))(σ) > 0`, `G_j` likewise, `E(σ,z) = Re(1/(σ−z) +
  1/(σ−1+z̄))` and `E_j(σ,z) = −Re(1/(σ−z)^j + 1/(σ−1+z̄)^j)`. Differentiating (9) gives (10) (p. 213):
  for `j ≥ 2`, `(1/2) Σ′_ρ E_j(σ,ρ) = G_(j−1)(σ) − (σ−1)^(−j) − σ^(−j) + Z_(j−1)(σ)`.
- Zero inequality (11): for the estimate-(5) data `σ = 1.1` and the nine rows `(k_i, σ_i, a_i) =
  (2,2,.592), (3,1.2,.149), (3,2.3,1.02), (4,1.7,.538), (4,2.5,1.473), (5,1.6,.0442), (5,2.25,1.785),
  (5,2.5,.0917), (5,2.75,.758)`, `E(σ,ρ) ≥ Σ_i a_i E_(k_i)(σ_i, ρ)` for every nontrivial zero. It
  follows from the same inequality (13) at every point `z` of the closed strip `0 ≤ Re z ≤ 1` (p. 214):
  both sides are harmonic, tend to zero uniformly as `|Im z| → ∞`, are even in `Im z` and invariant
  under `z ↦ 1 − z̄`, and (13) holds trivially on the real segment, so by the maximum principle it
  suffices to prove (13) on the line `Re z = 1`. This is the reduction AnalyticNumberTheoryPartI
  §2.9a applies to the estimate-(4) rows. On `Re z = 1`, with `z = 1 + iy` and `u = y²`, the
  difference of the two sides is `Q₅(u)/R₅(u)` with `R₅ > 0` a product of powers of `a² + u` and `Q₅`
  a polynomial of degree 65; prove `Q₅(u) > 0` for every `u ≥ 0`.
- Inequality (12) (p. 213) then gives
  `log A ≥ G(σ) + Σ_i a_i G_(k_i−1)(σ_i) − 1/(σ−1) − 1/σ − Σ_i a_i((σ_i−1)^(−k_i) + σ_i^(−k_i))
  + Z(σ) + Σ_i a_i Z_(k_i−1)(σ_i)`, and `log D = 2 log A + 2r₂ log 2 + (r₁ + 2r₂) log π` converts it
  to `D ≥ 58.6^(r₁) 21.8^(2r₂) exp(f₂ − 70)` with
  `f₂ = 2Z(1.1) + 1.184 Z₁(2) + .298 Z₂(1.2) + 2.04 Z₂(2.3) + 1.076 Z₃(1.7) + 2.946 Z₃(2.5)
  + .0884 Z₄(1.6) + 3.57 Z₄(2.25) + .1834 Z₄(2.5) + 1.516 Z₄(2.75)`, whose coefficients are `2a_i`.
- The archimedean and pole constants: with `g^R_j(σ) = −(−1)^j ψ^((j))(σ/2)/(2 · j! · 2^j)` and
  `g^C_j(σ) = −(−1)^j ψ^((j))(σ)/j!`, `G_j = r₁ g^R_j + r₂ g^C_j`; put
  `C_R = log π − ψ(σ/2) + 2Σ_i a_i g^R_(k_i−1)(σ_i)`, `C_C = log 2π − ψ(σ) + Σ_i a_i g^C_(k_i−1)(σ_i)` and
  `C_pole = 2[−1/(σ−1) − 1/σ − Σ_i a_i((σ_i−1)^(−k_i) + σ_i^(−k_i))]`. Prove
  `C_R − log(293/5) > 0.0008515`, `C_C − log(109/5) > 0.0036156` and `C_pole > −70`
  (`C_pole = −69.5895…`).
- Totally real weakening used by §1.4: `|d_k| ≥ e^(−70) 58.6ⁿ > 10^(−34) 58.6ⁿ`, from `e < 3` and
  `3⁷⁰ < 10³⁴`.

**Checks.**

- For `k = ℚ` the bound reads `1 ≥ 58.6 e^(−70) ≈ 2.3 · 10^(−29)`; without the factor `e^(−70)` it
  would claim `1 ≥ 58.6`, so the pole term cannot be dropped.
- Each `f₂` coefficient is twice the row's `a_i`: `1.184 = 2 · .592`, …, `1.516 = 2 · .758`; a sum with
  the `a_i` themselves gives a weaker but still valid bound, while a sum with any negative
  coefficient would invalidate dropping `f₂`.
- `3⁷⁰ ≈ 10^33.4 < 10³⁴`, and `58.6^(3/2)/(4π²) = 11.36… > 10`, the comparison §1.4 uses.
- For a totally real field of degree `n` the bound gives root discriminant at least
  `58.6 e^(−70/n)`, increasing to `58.6`, below the unconditional limit `60.8` of Odlyzko's tables,
  as it must be.

*Needs:* LFunctions Layer 3; ZerosOfLFunctions §1.4, §3.1, §§3.4–3.5, Layer 5 and §5.6; Mathlib
`Complex.digamma`, `NumberField.discr`, `NumberField.InfinitePlace.nrRealPlaces`, `nrComplexPlaces`.
(Odlyzko 1977, Theorem 1 p. 210, (7)–(8) p. 212, (9)–(12) p. 213, (13) and its reduction p. 214, the
estimate-(5) table p. 215.)

### 1.4 Finiteness for bounded covolume and for a fixed signature

`finite_conj_isArithmetic_covolume_le`: for every real `C` there are finitely many subgroups
`Δ₁, …, Δ_q` of `PSL₂(ℝ)` such that every arithmetic lattice of covolume at most `C` is
`PSL₂(ℝ)`-conjugate to one of them (Borel 1981, Theorem 8.2, p. 26). For `C` below the minimum
covolume `π/21` (FuchsianOrbifolds Layer 4a) no lattice qualifies and the family is empty.

Borel states the theorem up to `PGL₂(ℝ)`-conjugacy. Prove the index-two inclusion: the image of
`Matrix.ProjectiveSpecialLinearGroup.toPGL`, injective by Mathlib's `toPGL_injective`, is the kernel
of the determinant sign `PGL₂(ℝ) → {±1}`, `[g] ↦ sign(det g)`, which is well defined because
`det(λg) = λ² det g` and is onto because `diag(−1, 1)` has sign `−1` (consistently, Mathlib's
`toPGL_surj_iff` says that `toPGL` is not onto, `−1` not being a square in `ℝ`). So `PSL₂(ℝ)` is a
normal subgroup of index two in `PGL₂(ℝ)`, and a `PGL₂(ℝ)`-class of subgroups of `PSL₂(ℝ)` is the
union of at most two `PSL₂(ℝ)`-classes, those of `H` and of `diag(−1, 1) H diag(−1, 1)⁻¹`.

**The standard presentation.** Let `Γ ≤ PSL₂(ℝ)` be cofinite of signature `(g; m₁, …, m_r; c)`
(FuchsianOrbifolds Layer 4 item 5). Prove that there are `a₁, b₁, …, a_g, b_g, x₁, …, x_r,
y₁, …, y_c ∈ Γ`, with `x_j` generating the stabilizer of a point of the `j`-th elliptic orbit and
`y_k` the stabilizer of a cusp of the `k`-th cusp orbit, such that the homomorphism to `Γ` from the
quotient of FreeGroupsAndLimitGroups §6.1's `S⁺(g, r + c)` by the normal closure of the
`p_j^(m_j)`, `j ≤ r`, sending `a_i, b_i` to `a_i, b_i` and the peripheral generators
`p₁, …, p_(r+c)` to `x₁, …, x_r, y₁, …, y_c`, is an isomorphism. Equivalently, `Γ` is generated by
these elements with the defining relations `x_j^(m_j) = 1` and
`[a₁, b₁] ⋯ [a_g, b_g] x₁ ⋯ x_r y₁ ⋯ y_c = 1`, a cyclic conjugate of the relation in the literature;
in particular `Γ` is generated by `2g + r + c` elements (Belolipetsky–Gelander–Lubotzky–Shalev, §4,
presentation (11), p. 12, recalling Fricke and Klein; Borel 1981, Lemma 8.1, bounds the number of
generators from this presentation). Route: the Dirichlet polygon of FuchsianOrbifolds
Layer 2 item 4 presents `Γ` by its side pairings with the vertex-cycle relators (item 3). Cut a
small sector off every vertex of an elliptic cycle and every ideal vertex, and read the result as a
finite connected orientable polygonal surface model with one face (FreeGroupsAndLimitGroups
§6.0a), whose `r + c` boundary components are the elliptic cycles and the cusp orbits (Layer 2
item 5). Prove that its face group is the side-pairing group with only the accidental-cycle
relators, each elliptic or parabolic cycle transformation being a boundary traversal. By §6.1a this
face group is `S⁺(h, r + c)`, with the cycle transformations conjugate to the `p_j^(±1)`, where `h`
is the polygon genus, which is `g` by FuchsianOrbifolds Layer 5 item 7. Imposing the elliptic
relators, the `m_j`-th powers of the elliptic cycle transformations, gives the presentation.

Takeuchi's fixed-signature finiteness is the corollary for `C = A`. For a signature
`(g; m₁, …, m_r; c)` with `g, c, r ≥ 0` and `m_j ≥ 2` put `A = 2π(2g − 2 + Σ_j(1 − 1/m_j) + c)`. If
`A ≤ 0`, no lattice has this signature (Gauss–Bonnet); otherwise every lattice of this signature
has covolume `A` by the orbifold area formula (FuchsianOrbifolds Layer 5 item 7), so only finitely
many `PSL₂(ℝ)`-conjugacy classes of arithmetic lattices have it (Takeuchi 1983, Theorem 2.1;
Maclachlan–Reid, Theorem 11.3.1). The splitting is quantified throughout. The bounded-covolume form
is the stronger statement: the signatures `(0; 2, 3, m)`, `m ≥ 7`, are pairwise distinct, each of
covolume `2π(1/6 − 1/m) < π/3`.

Route, for `C > 0`, with `d_C = ⌊C/π⌋ + 4` and `C′ = 2^(d_C) C`; write `covol(Γ)` for
`MeasureTheory.covolume Γ ℍ`. The steps are named targets.

- Generators: a lattice `Γ` of covolume `A ≤ C` has a signature with `2g + r + c ≤ A/π + 4`, since
  each `1 − 1/m_j ≥ 1/2` gives `A ≥ π(4g − 4 + r + 2c)` (Borel 1981, Lemma 8.1). Its standard
  presentation (above) has `2g + r + c ≤ d_C` generators, so `Γ/Γ^(2)`, an elementary abelian
  2-group on at most `d_C`
  generators, has order at most `2^(d_C)`, and `covol(Γ^(2)) ≤ C′` by
  `MeasureTheory.covolume_eq_card_mul_covolume`.
- Containment in a maximal-order group: for arithmetic `Γ`, §1.3 gives integral traces on `Γ^(2)`
  and identifies the trace envelope with `B`; the norm-one preimage `H_Γ` of `Γ^(2)` contains both
  central signs, spans `B` and has integral reduced traces, so `integral_trace_lattice_order` and
  extension to a maximal order give `Γ^(2) ≤ Λ = Γ(O)` and `covol(Λ) ≤ C′`.
- Field and discriminant bound: `ζ_k(2) ≥ 1` (`TauCeti.dedekindZeta_eulerProduct_hasProd` at `s = 2`)
  and `∏(N𝔭 − 1) ≥ 1` turn the covolume formula into `8π |d_k|^(3/2)/(4π²)^n ≤ C′`, so
  `|d_k| ≤ (C′ (4π²)^n/(8π))^(2/3)`; with §1.3b's weakening,
  `C′ ≥ 8π · 10^(−51) (58.6^(3/2)/(4π²))^n ≥ 24 · 10^(n−51)`, which bounds `n`. Then
  `NumberField.finite_of_discr_bdd`, after embedding the fields in `ℂ`, leaves finitely many fields
  up to isomorphism.
- Ramification: `∏_(𝔭 ∈ Ram_f)(N𝔭 − 1) ≤ M_ram = C′ (4π²)^n/(8π)`, so every ramified prime has
  `N𝔭 ≤ 1 + M_ram`; `Ring.HasFiniteQuotients.finite_absNorm_heightOneSpectrum_le` leaves finitely
  many ramification sets, and by GL2AutomorphicRepresentationsAndTransfer R17.1.5 each set
  determines at most one algebra up to isomorphism.
- Maximal-order types: for a maximal order `O` put `G = PGL₁(B)` and let `U ≤ G(𝔸_(k,f))` be the image
  of the normalizer of the adelic completion of `O`; `U` is compact open, local maximal orders are
  conjugate, and an order is determined by its localizations, so `G(k)\G(𝔸_(k,f))/U` is in bijection
  with the maximal orders modulo `B^×`-conjugacy, a finite set by AA.3.4 (`Reduction.finite_classes`).
  Through the splitting, `B^×`-conjugate maximal orders give `PGL₂(ℝ)`-conjugate groups `Λ = Γ(O)`,
  so by the index-two inclusion above finitely many `PSL₂(ℝ)`-classes of `Λ` occur. The split case
  is handled by its own covolume formula and contributes only cusped signatures.
- Bounded index: each candidate `Λ` has covolume at most `covol(Γ^(2)) ≤ C′`, so by the generator
  step it has a presentation with `d = 2g_Λ + r_Λ + c_Λ ≤ C′/π + 4` generators;
  `[Λ : Γ^(2)] ≤ M_Λ = ⌊C′/covol(Λ)⌋`, and a group on `d` generators has at most `m · (m!)^d`
  subgroups of index `m`, through the coset action and a distinguished coset. So only finitely many
  `K = Γ^(2)` occur.
- Overgroups: for each such `K` the normalizer `N(K)` in `PSL₂(ℝ)` is discrete, since a nonelementary
  lattice has trivial centralizer, and its covolume is at least `π/21` (FuchsianOrbifolds Layer 4a,
  with the cusped minimum `π/3`); so `[N(K) : K] ≤ 21 covol(K)/π`, and since `K ◁ Γ` with
  `[Γ : K] ≤ 2^(d_C)`, only finitely many `Γ` occur.

For a fixed signature the same steps run with the signature's own generator count
`r₀ = 2g + r + c` in place of `d_C` and with `C_sig = 2^(r₀) A` in place of `C′`.

**Checks.**

- `PSL₂(ℤ)`, of signature `(0; 2, 3; 1)`: the standard presentation is
  `⟨x₁, x₂, y₁ | x₁², x₂³, x₁x₂y₁⟩ ≃ ⟨x₁, x₂ | x₁², x₂³⟩ = C₂ ∗ C₃`, with `x₁ = S`, `x₂ = ST` and
  `y₁ = (S · ST)⁻¹ = T⁻¹` parabolic. Without the product relator the group would be `C₂ ∗ C₃ ∗ ℤ`,
  whose abelianization `ℤ/6 × ℤ` is infinite, unlike `ℤ/6` for `PSL₂(ℤ)`.
- `Γ̄(2)`, of index six in `PSL₂(ℤ)`, has area `2π` and signature `(0; −; 3)`: the presentation
  `⟨y₁, y₂, y₃ | y₁y₂y₃⟩` is free of rank two, matching the free basis `z ↦ z + 2`, `z ↦ z/(2z + 1)`;
  without the product relator it would be free of rank three, with abelianization `ℤ³` instead of
  `ℤ²`.
- The `(2, 3, 7)` triangle group: `⟨x₁, x₂, x₃ | x₁², x₂³, x₃⁷, x₁x₂x₃⟩` is perfect, since
  `ℤ/2 × ℤ/3 × ℤ/7 ≃ ℤ/42` modulo the generator `(1, 1, 1)` is trivial; without the product relator
  the abelianization would be `ℤ/42`.
- A closed genus-3 group has a Dirichlet polygon with up to `12g − 6 = 30` sides, every vertex cycle
  then having three vertices (`10 − 15 + 1 = 2 − 2g`): 15 side-pairing generators and 10 cycle
  relators, against 6 standard generators and one relator, both presentations abelianizing to
  `ℤ⁶`. So the count `2g + r + c` is not the number of side pairings of FuchsianOrbifolds Layer 2
  item 4, and a map sending `b₁, b₂, b₃` to `1` is not read off the side pairings.
- Index two: `diag(2, 1)` has positive determinant and its class is `toPGL` of the class of
  `diag(√2, 1/√2)`; `diag(−1, 1)` has negative determinant and is not in the image, since
  `λ² det h = −1` has no real solution for `det h = 1`. The `PGL₂(ℝ)`-class of `Γ₀(2)` is a single
  `PSL₂(ℝ)`-class: conjugation by `diag(−1, 1)` sends `(a b; c d)` to `(a −b; −c d)`, which keeps
  the lower-left entry even, so it normalizes `Γ₀(2)`.
- `C = π/21`, the covolume of the `(2, 3, 7)` triangle group: `d_C = 4` and `C′ = 16π/21`, and for
  `n = 3` the discriminant bound `(2(4π²)³/21)^(2/3) ≈ 325.0` admits `d_k = 49`. With the signature's
  own count `r₀ = 3` for `(0; 2, 3, 7)`, `C_sig = 8π/21`, the bound `((4π²)³/21)^(2/3) ≈ 204.8` still
  admits `d_k = 49`, and `d = 3 ≤ C_sig/π + 4 = 8/21 + 4`.
- The covolume bound cannot be dropped: the images of the principal congruence subgroups `Γ(N)` are
  arithmetic lattices whose covolumes `[PSL₂(ℤ) : Γ̄(N)] · π/3` (`2π` for `N = 2`, `4π` for `N = 3`)
  tend to infinity, and conjugate lattices have equal covolume (`MeasureTheory.covolume_conjAct_smul`),
  so they lie in infinitely many conjugacy classes.
- Signatures `(0; 2, 3, 7)` and `(0; 2, 3, 8)` have covolumes `π/21` and `π/12`, both below `π/3`, and
  the family `(0; 2, 3, m)` is infinite: the theorem bounds conjugacy classes of arithmetic lattices,
  not signatures, and a statement counting signatures of bounded covolume would be false.
- Signature `(1; −)` has `A = 0` and signature `(0; 2, 2, 2, 2)` has `A = 0`; neither is the signature
  of a lattice, which is why `A ≤ 0` is discharged before any covolume bound is used.
- Signature `(2; −)`: `A = 4π`, `r₀ = 4` and `C_sig = 64π`, while the bounded-covolume constants are
  `d_C = 8` and `C′ = 1024π`; the cocompact genus-two arithmetic surfaces come from finitely many
  quaternion algebras.
- A group on `d` generators has at most `(m!)^d/(m−1)!` subgroups of index `m` (homomorphisms to
  `S_m` up to relabellings fixing the marked coset), so `m · (m!)^d` is a valid bound; for the
  infinite cyclic group, `m = 2`, it gives `4 ≥ 1`.

*Needs:* for the statement, §1.1 (`IsArithmetic`), Tau Ceti `Subgroup.IsCofinite` and Mathlib
`MeasureTheory.covolume`; for the standard presentation, FuchsianOrbifolds Layer 2 items 3–5, Layer
4 item 5 and Layer 5 item 7, FreeGroupsAndLimitGroups §§6.0a–6.1a and Mathlib `PresentedGroup`; for
the index-two inclusion, Mathlib `Matrix.ProjectiveSpecialLinearGroup.toPGL`, `toPGL_injective` and
`toPGL_surj_iff`; for the route, §§1.1–1.3b, the standard presentation and the index-two inclusion,
FuchsianOrbifolds Layer 4a and Layer 5 item 7, AdelicAlgebraicGroups AA.3.4,
GL2AutomorphicRepresentationsAndTransfer R17.1.5, ReductiveGroupsPartII RG2.2.2, Tau Ceti
`MeasureTheory.covolume_eq_card_mul_covolume` and `MeasureTheory.covolume_conjAct_smul`, and Mathlib
`NumberField.finite_of_discr_bdd` and `Ring.HasFiniteQuotients.finite_absNorm_heightOneSpectrum_le`.
(Borel 1981, §7.1, Lemma 8.1 and Theorem 8.2; Takeuchi 1983, Theorem 2.1; Maclachlan–Reid,
Theorems 11.2.1 and 11.3.1; Belolipetsky–Gelander–Lubotzky–Shalev, §4, presentation (11), p. 12,
for the standard presentation, and §§2–5 for the counting of subgroups by generators and
covolume.)

### 1.5 An explicit totally real discriminant bound

`discr_ge_totallyReal`: every totally real field of degree `n` has `|d_k| ≥ a₀ R₀ⁿ` with
`a₀ = 2439/10⁷` and `R₀ = 29.099`. It is not an input to §1.4. Route: Odlyzko's unconditional Table 4
kernel in the explicit formula of SmallRamificationAndAbelianVarietyBaseCases §1.0.

- The kernel: `h(t) = 1 + cos(πt)` on `|t| ≤ 1` and `0` otherwise, and `H = h ∗ h/3`; on `0 ≤ x ≤ 2`,
  `H(x) = (2 − x)(1 + cos(πx)/2)/3 + sin(πx)/(2π)`, extended evenly and by zero. `H` is nonnegative,
  positive definite (its Fourier transform is `|ĥ|²/3`), `C¹` with `H(2) = H′(2) = H′(0) = 0`,
  analytic on `[0, 2]`, with `H(0) = 1` and `∫H = 4/3`.
- For `b > 0` put `F_b(x) = H(x/b)/cosh(x/2)`. It satisfies the hypotheses of
  SmallRamificationAndAbelianVarietyBaseCases §1.0 (even, supported in `[−2b, 2b]`, `C¹`, piecewise
  `C²` on the partition `−2b < 0 < 2b`, `F_b(0) = 1`), and `f = H(·/b)` satisfies those of §1.6, so the
  zero terms are nonnegative; the prime terms are nonnegative because `F_b ≥ 0`. For a totally real
  field (`r₁ = n`) this gives `log |d_k| ≥ n log A_b − 8b/3`, with
  `log A_b = π/2 + γ + log 8π − I₁(b) − I₂(b)`, `I₁(b) = ∫₀^∞ (1 − F_b)/(2 sinh(x/2))`,
  `I₂(b) = ∫₀^∞ (1 − F_b)/(2 cosh(x/2))`, and pole term `4∫₀^∞ F_b(x) cosh(x/2) dx = 2b∫H = 8b/3`.
  On `[2b, ∞)` the integrals are `−log tanh(b/2)` and `π − 2 arctan(e^b)`.
- The table inequalities: for each of the 31 rows `(n₀, b, B; A, E)` below, `A_b ≥ A`, `E ≥ 8b/3` and
  `A e^(−E/n₀) > B`. The rows are the distinct cutoffs of Odlyzko's unconditional Table 2 with the
  matching rows of Table 4.

| `n₀` | `b` | `B` | `A` | `E` |
|---:|---:|---:|---:|---:|
| 1 | .420 | .996 | 3.055 | 1.1201 |
| 2 | .900 | 2.222 | 7.379 | 2.4001 |
| 3 | 1.350 | 3.609 | 11.985 | 3.6001 |
| 4 | 1.750 | 5.062 | 16.259 | 4.6667 |
| 5 | 2.050 | 6.514 | 19.441 | 5.4667 |
| 6 | 2.350 | 7.926 | 22.526 | 6.2667 |
| 7 | 2.600 | 9.279 | 24.987 | 6.9334 |
| 8 | 2.850 | 10.568 | 27.327 | 7.6001 |
| 9 | 3.100 | 11.787 | 29.534 | 8.2667 |
| 10 | 3.300 | 12.941 | 31.202 | 8.8001 |
| 11 | 3.400 | 14.034 | 32.002 | 9.0667 |
| 12 | 3.600 | 15.068 | 33.536 | 9.6001 |
| 13 | 3.800 | 16.044 | 34.984 | 10.134 |
| 14 | 3.900 | 16.971 | 35.676 | 10.401 |
| 15 | 4.000 | 17.849 | 36.347 | 10.667 |
| 16 | 4.200 | 18.684 | 37.629 | 11.201 |
| 17 | 4.300 | 19.479 | 38.241 | 11.467 |
| 18 | 4.400 | 20.234 | 38.833 | 11.734 |
| 19 | 4.600 | 20.954 | 39.964 | 12.267 |
| 20 | 4.700 | 21.642 | 40.502 | 12.534 |
| 21 | 4.800 | 22.299 | 41.024 | 12.801 |
| 22 | 4.900 | 22.929 | 41.529 | 13.067 |
| 23 | 5.000 | 23.531 | 42.018 | 13.334 |
| 24 | 5.100 | 24.109 | 42.492 | 13.601 |
| 25 | 5.200 | 24.664 | 42.951 | 13.867 |
| 26 | 5.300 | 25.196 | 43.395 | 14.134 |
| 28 | 5.400 | 26.203 | 43.826 | 14.401 |
| 30 | 5.600 | 27.138 | 44.646 | 14.934 |
| 32 | 5.800 | 28.008 | 45.415 | 15.467 |
| 34 | 5.900 | 28.821 | 45.782 | 15.734 |
| 36 | 6.100 | 29.582 | 46.482 | 16.267 |

- Assembly: `n ↦ A e^(−E/n)` increases, so each row bounds `|d_k|^(1/n)` for `n ≥ n₀`. For
  `1 ≤ n ≤ 35`, the last cutoff `n₀ ≤ n` gives `B_n^n > a₀ R₀^n`, the smallest ratio `1.20369…` being at
  `n = 9`; for `n ≥ 36` the last row gives `|d_k|^(1/n) > 29.582 > R₀`, and `a₀ < 1`.

**Checks.**

- `n = 1, 2, 3, 4, 5`: the smallest discriminants `1, 5, 49, 725, 14641` exceed
  `a₀R₀ⁿ = 0.0071, 0.2065, 6.0096, 174.87, 5088.6`.
- At `b = 0.42`, `A_b = 3.0576…`, so the table value `A = 3.055` is a valid lower bound and
  `A e^(−E) = 0.99669 > 0.996`; at `b = 6.1`, `A_b = 46.498…` and `A e^(−E/36) = 29.5831 > 29.582`,
  the smallest margin in the table being `0.0002` at `n₀ = 32`.
- `H(0) = 1`, `H(1) = 1/6` and `H(1/2) = 1/2 + 1/(2π) ≈ 0.659`; omitting the sine term would give
  `H(1/2) = 1/2` and `H′(0) ≠ 0`, breaking the `C¹` hypothesis of §1.0.
- `E` is at least `8b/3` in every row (`1.1201 ≥ 1.12`, `16.267 ≥ 16.2667`): the pole term enters with
  the negative sign, and rounding it down would invalidate the row.

*Needs:* SmallRamificationAndAbelianVarietyBaseCases §§1.0 and 1.6; Mathlib
`Real.eulerMascheroniConstant`, `MeasureTheory.convolution`, `NumberField.discr`,
`NumberField.IsTotallyReal`. (Odlyzko, unpublished Tables 2 and 4 of November 29, 1976; Table 4's
`b = 0.42` and `b = 6.1` rows are `odlyzko1976tables` lines 23 and 105.)

### Examples

- `PSL₂(ℤ)` is `Γ(M₂(ℤ))` for `k = ℚ`, `(a,b) = (1,1)`: a cusped arithmetic lattice of area `π/3`, with
  `K₀ = ℚ` and `A_Γ = M₂(ℚ)`.
- The Shimura-curve group of discriminant 6 is cocompact of area `2π/3`, with normalizer the `(2,4,6)`
  triangle group of area `π/6`.
- The `(2,3,7)` triangle group is `Γ(O)` for the Hurwitz order over `ℚ(cos 2π/7)`, of area `π/21`; it
  is the smallest compact orbifold, and §1.4 finds it from `C = π/21`, or from the signature
  constant `C_sig = 8π/21`.

### Dependencies

FuchsianOrbifolds Layers 0, 2 (items 1 and 3–5), 4 (item 5), 4a and 5 (item 7).
FreeGroupsAndLimitGroups §§6.0a–6.1a. EndoscopicTransferAndUnitaryTraceComparison §6.2.
AdelicAlgebraicGroups AA.2.4, AA.3.4, AA.4.2.
GL2AutomorphicRepresentationsAndTransfer R17.1.5. ClassicalArithmeticCompletion §7.60.
ReductiveGroupsPartII RG2.2.1, RG2.2.2, RG2.2.4. SemisimpleAlgebras Layer 3. LFunctions Layer 3.
ZerosOfLFunctions §1.4, §3.1, §§3.4–3.5, Layer 5. SmallRamificationAndAbelianVarietyBaseCases §§1.0,
1.6.

## Layer 2: the arithmetic commensurator criterion and the PGL passage

The theorems of this layer are for lattices and use the arithmetic predicate and invariant data of
Layer 1.

### 2.0 Commensurability and commensurators

Commensurability is an equivalence relation, preserved by conjugation and unchanged under
replacement by a finite-index subgroup. `Comm_G(Γ)` is a subgroup containing `Γ`, unchanged when `Γ`
is replaced by a commensurable subgroup; if finite-index subgroups of `Γ` are conjugate by `a ∈ G`,
then `a ∈ Comm_G(Γ)`.

**Checks.**

- `Comm_PSL(PSL₂(ℤ))` contains the image of `GL₂(ℚ)⁺`: `diag(2,1)` conjugates `Γ₀(2)` onto a subgroup
  commensurable with `PSL₂(ℤ)`.
- `Comm_PSL(Γ) = Γ` for the `(2,3,7)` triangle group fails: it is arithmetic, so its commensurator is
  dense; for the Hecke group `G₅` it holds, since `G₅` is nonarithmetic and maximal.

*Needs:* Mathlib `Subgroup.Commensurable`, `Subgroup.Commensurable.commensurator`.

### 2.1 The discrete/dense dichotomy

- `isArithmetic_iff_dense_commensurator`: a lattice `Γ ≤ PSL₂(ℝ)` is arithmetic exactly when
  `Comm_PSL(Γ)` is dense.
- `commensurator_discrete_of_not_isArithmetic`: if a lattice is not arithmetic, its commensurator is
  discrete and contains it with finite index.

Arithmetic to dense: a `k`-basis of `B` maps to an `ℝ`-basis of `B ⊗_(k,v₀) ℝ ≃ M₂(ℝ)` and `ℚ ⊆ k` is
dense in `ℝ`, so `B(k)` is dense in `M₂(ℝ)`; elements `g ∈ B^×` with `v₀(Nrd g) > 0` are dense in the
positive-determinant matrices and project densely onto `PSL₂(ℝ)`. For such `g`, `O` and `gOg⁻¹` are
orders with finite-index intersection; if `mO` lies in it, the kernel of `O¹ → (O/mO)^×` has finite
index in `O¹` and lies in `(gOg⁻¹)¹`, and reversing the roles gives commensurability. So `g`
commensurates `Γ(O)` and every arithmetic group commensurable with it. Nondense to discrete: if the
closure `H` of the commensurator is not discrete, its identity component has positive dimension and
is normalized by `Γ`; the closed-subgroup theorem (LieGroups) and the irreducibility of the adjoint
action of a nonelementary subgroup on `sl₂(ℝ)` give `H = PSL₂(ℝ)`. A discrete overgroup of a lattice
contains it with finite index, by covolume scaling. Dense to arithmetic is §2.2.

**Checks.**

- `PSL₂(ℤ)`: arithmetic, with commensurator containing the dense image of `GL₂(ℚ)⁺`.
- `G₅`: a lattice with a cusp and `K₀ ⊇ ℚ(√5)`, hence nonarithmetic; its commensurator is discrete.
- The trivial group is not a lattice, though its commensurator `PSL₂(ℝ)` is dense: the lattice
  hypothesis cannot be dropped.

*Needs:* §§1.1, 1.3, 2.0, 2.2; LieGroups (closed-subgroup theorem); FuchsianOrbifolds L2.1.
(Margulis, Chapter IX.)

### 2.2 Dense-commensurator arithmeticity

Let `Γ` be a lattice with dense commensurator. The criterion is a staged theorem; the squared-trace
field is not assumed to be a number field, and the envelope is not assumed split at the places
considered. It consumes §1.3's adapters (`invariant_squared_trace_data_finite_index`,
`invariant_squared_trace_data_commensurable`, the trace adapter and the envelope), applying the
commensurable theorem to the common finite-index intersection for each commensurator element.

- `dense_commensurator_squared_trace_field_is_number_field`: `K₀(Γ)` is a number field. Route: for an
  embedding `σ : K₀ → ℂ`, absolute irreducibility and the density theorem identify
  `A_Γ ⊗_(K₀,σ) ℂ ≃ M₂(ℂ)`, giving `ρ_σ : Γ^(2) → PGL₂(ℂ)`. If `K₀` had positive transcendence
  degree, a transcendental generator `t` and an embedding with `|σ(t)|² > 4` and `σ(t)² ≠ t²` give an
  unbounded, faithful, Zariski-dense `ρ_σ` (a proper algebraic subgroup of `PGL₂(ℂ)` is virtually
  solvable). The extension lemma below extends it to `PSL₂(ℝ)` as the complexified standard
  representation, so `σ(tr η̃)² = (tr η̃)²` for all `η ∈ Γ^(2)`, contradicting `σ(t)² ≠ t²`.
- The extension lemma: for `K = ℝ`, `ℂ` or a nonarchimedean local field of characteristic zero, a
  split scalar extension `A_Γ ⊗_(K₀) K ≃ M₂(K)` and the resulting unbounded Zariski-dense
  `ρ : Γ^(2) → PGL₂(K)`, `ρ` extends to a continuous homomorphism `PSL₂(ℝ) → PGL₂(K)`, uniquely once
  its restriction to a finite-index subgroup is fixed, and nontrivially exactly when the image is
  unbounded. For `c ∈ Comm(Γ)`, §1.3 gives `c A_Γ c⁻¹ = A_Γ` fixing `K₀` pointwise; Skolem–Noether over
  `K₀` (`TauCeti.skolemNoether`) gives `b_c ∈ A_Γ^×`, unique modulo `K₀^×`, with `Ad(b_c) = Ad(c)` on
  `A_Γ`, and `c ↦ [b_c]` is a homomorphism `T_ext` into `PGL₁(A_Γ)(K₀)`. Lifts of a projective
  representation to a subgroup `Δ` differ by a character `Δ → {±1}` that vanishes on `Δ^(2)`.
- The boundary pair: for `G = PSL₂(ℝ)` and its lattices, `∂₊ = ∂₋ = G/P ≃ ∂ℍ` with the Lebesgue class
  is amenable, and the diagonal action on `∂₋ × ∂₊` is isometrically ergodic: the generic orbit is
  `G/A′` with `A′` the centralizer of a split torus, Mautner contraction gives the stabilizer
  criterion, and measurable-field, induction and finite-index inheritance adapters pass it to `Γ`
  (Bader–Furman, Definition 2.3, Theorem 2.5, Lemma 2.6). The product class is quasi-invariant.
- The characteristic map: `J = PGL₂(K)` acts on `ℙ¹(K)` as a convergence action, proper on distinct
  triples. Amenability gives `𝔭_± : ∂_± → Prob(ℙ¹(K))`; the measure
  `𝔭₋(x) × 𝔭₊(y) × (𝔭₋(x) + 𝔭₊(y))/2` restricted to distinct triples, if it had positive mass, would
  give an equivariant map to `Prob(ℙ¹(K)^(3))`, whose orbit space is standard Borel and whose
  stabilizers are compact; isometric ergodicity, through a compactly supported `L²(J)` function, would
  then put `ρ(Γ)` in a compact group. So `supp 𝔭₋(x) ∪ supp 𝔭₊(y)` has at most two points almost
  everywhere, Zariski density forces Dirac values `φ_±`, and ergodicity on the coincidence set makes
  `φ₋(x) ≠ φ₊(y)` almost everywhere. Averaging two equivariant fields gives uniqueness (Bader–Furman,
  Theorem 3.2).
- Continuity: with `η = (φ₊)_* m` for a probability `m` in the boundary class, `supp η` is the limit
  set and has more than two points; convergence of `∫(u ∘ g_n − u) v dη` to zero detects `g_n → 1`, and
  equivariance `T_ext(c_n) 𝔭₊(x) = 𝔭₊(c_n x)` gives it for `c_n → 1` (Bader–Furman, Lemma 4.2). So
  `T_ext` extends from the dense commensurator to `PSL₂(ℝ)`. For nonarchimedean `K` connectedness
  makes the extension trivial; for `K = ℝ, ℂ` a nontrivial continuous homomorphism with Zariski-dense
  image is the standard representation or its complexification (LieGroups, automatic smoothness).
  No general rank-one superrigidity theorem is assumed.
- Places of `K₀`: at a split finite place an unbounded image would extend nontrivially from the
  connected `PSL₂(ℝ)` to a totally disconnected group, so the image is relatively compact; at a
  nonidentity real split place an unbounded image would extend to the standard representation and
  `σ` would fix every `tr(η̃²) + 2`, hence `K₀`, and a compact image would make the faithful image of
  `Γ^(2)` virtually solvable; at a complex place both cases contradict, the compact one because
  conjugation into `PU₂` makes every `σ(tr η̃)` real. So `K₀` is totally real and `A_Γ` splits exactly
  at the identity place.
- Integrality: at a finite division place a reduced-norm-one lift lies in the unique maximal order;
  at a split finite place `Γ^(2)` preserves vertex types (reduced norm one has even valuation), a
  compact type-preserving group fixes a vertex (§1.2's adapter with RG2.2.1 and RG2.2.4), and so a
  reduced-norm-one lift `X = λA` with `A` integral has `λ` a unit and `tr X ∈ 𝒪_v`. So every `tr(η̃)`
  lies in `𝒪_(K₀)`, and `integral_trace_lattice_order` applied to the norm-one preimage `H_Γ` of
  `Γ^(2)` gives an order `O`.
- Conclusion: both inclusions `Γ^(2) ≤ Γ(O)` up to finite index and the reverse show that `Γ` is
  commensurable with `Γ(O)`; the ramification set of `A_Γ` is that of a quaternion algebra over a
  totally real field split at one real place, as GL2AutomorphicRepresentationsAndTransfer R17.1.5
  requires.

**Checks.**

- For `PSL₂(ℤ)`, `K₀ = ℚ` and the order produced is `M₂(ℤ)` up to conjugacy.
- For the `(2,3,7)` group, `K₀ = ℚ(cos 2π/7)` has three real places; `A_Γ` splits at the identity
  place and ramifies at the other two, an even total with empty finite ramification.
- A Zariski-dense image can be bounded: for the `(2,3,7)` group the two non-identity real embeddings
  of `ℚ(cos 2π/7)` give Zariski-dense subgroups of the compact group `PU₂`, so the extension lemma
  needs unboundedness as a hypothesis, not only Zariski density.

*Needs:* §§1.1–1.3, 2.0; Tau Ceti `TauCeti.skolemNoether`; SemisimpleAlgebras Layer 3; LieGroups;
ReductiveGroupsPartII RG2.2.1 and RG2.2.4; GL2AutomorphicRepresentationsAndTransfer R17.1.5.
(Bader–Furman, Definition 2.3, Theorem 2.5, Lemma 2.6, Theorem 3.2, Lemma 4.2; Margulis, Chapter IX.)

### 2.3 The projective extension

`PGL₂(ℝ)` carries the quotient topology of `GL₂(ℝ)` (`instTopologicalSpacePGL`, Conventions). Prove
that `toPGL` is a homeomorphism of `PSL₂(ℝ)` onto the open subgroup of classes of positive
determinant: it is continuous, being induced by the inclusion `SL₂(ℝ) → GL₂(ℝ)`; that subgroup is
open because the determinant sign is continuous on `GL₂(ℝ)` and the quotient map is open; and on it
the inverse is induced by `g ↦ g/√(det g)`, continuous on the positive-determinant matrices. By the
index-two inclusion of §1.4 that subgroup is the image of `toPGL`, of index two. For a lattice
`Γ ≤ PSL₂(ℝ)` write `Comm_PGL(Γ)` for the commensurator in `PGL₂(ℝ)` of `toPGL(Γ)`; then
`Comm_PGL(Γ) ∩ toPGL(PSL₂(ℝ)) = toPGL(Comm_PSL(Γ))`. If no orientation-reversing element
commensurates `toPGL(Γ)`, `Comm_PGL(Γ) = toPGL(Comm_PSL(Γ))`; otherwise, for any
orientation-reversing `a ∈ Comm_PGL(Γ)`, `Comm_PGL(Γ) = toPGL(Comm_PSL(Γ)) ∪ a toPGL(Comm_PSL(Γ))`.

- `commensurator_pgl_discrete_of_not_isArithmetic`: for a nonarithmetic lattice `Γ ≤ PSL₂(ℝ)`,
  `Comm_PGL(Γ)` is discrete and contains `toPGL(Γ)` with finite index. Route: §2.1 gives both for
  `Comm_PSL(Γ)`; the homeomorphism above carries it to a discrete, hence closed, subgroup of
  `PGL₂(ℝ)`, and a union of at most two of its cosets is discrete, with index at most
  `2 [Comm_PSL(Γ) : Γ]` over `toPGL(Γ)`. Discreteness comes from this finite-index reduction, not
  from applying the connected-group theorem to `PGL₂(ℝ)`.

**Checks.**

- For `PSL₂(ℤ)`, `z ↦ −z̄` (the class of `diag(−1, 1)`) normalizes it, so `Comm_PGL` is the subgroup and
  its coset.
- The coset alone is not a group; the union is.
- The topology matters: in the quotient topology the classes of `diag(1 + 1/n, 1)` tend to `1`,
  and they commensurate `PSL₂(ℤ)`, so its `PGL₂(ℝ)`-commensurator is not discrete, as arithmeticity
  requires. With the discrete topology on `PGL₂(ℝ)` every subgroup would be discrete and the theorem
  would hold for every lattice, arithmetic or not.
- For the nonarithmetic `G₅`, `z ↦ −z̄` conjugates `z ↦ −1/z` to itself and `z ↦ z + φ` to
  `z ↦ z − φ`, so it normalizes `G₅` and `Comm_PGL(G₅)` contains `toPGL(G₅)` with index at least
  two: a finite index, not index one.

*Needs:* §1.4 (the index-two inclusion); §2.1; Mathlib `QuotientGroup.instTopologicalSpace`,
`QuotientGroup.instIsTopologicalGroup`, `Matrix.ProjectiveSpecialLinearGroup.toPGL`; Tau Ceti
`Subgroup.isClosed_center`; FuchsianOrbifolds Layer 0 items 1–2.

### 2.4 Maximality

`commensurator_pgl_eq_of_maximal`: if `Γ ≤ PSL₂(ℝ)` is a nonarithmetic lattice and `toPGL(Γ)` is
maximal among discrete subgroups of `PGL₂(ℝ)` (Mathlib's `Maximal` for the predicate
`DiscreteTopology`), then `Comm_PGL(Γ) = toPGL(Γ)`. Route: `Comm_PGL(Γ)` is a discrete subgroup
containing `toPGL(Γ)` (§2.3), so maximality forces equality. Maximality is used only after
discreteness of the commensurator.

**Checks.**

- Maximality cannot be dropped: by §2.3's Check, `Comm_PGL(G₅)` contains `toPGL(G₅)` with index at
  least two; consistently `toPGL(G₅)` is not maximal, having index two in the discrete extended
  Hecke group generated by it and `z ↦ −z̄`.
- Nonarithmeticity cannot be dropped: an arithmetic lattice has dense commensurator (§2.1), which is
  not discrete and so is never equal to `toPGL(Γ)`.
- Maximality in `PSL₂(ℝ)` is weaker than the hypothesis: the `(2,3,7)` group is maximal among
  discrete subgroups of `PSL₂(ℝ)`, but it has index two in the discrete extended triangle group
  generated by the reflections in the sides of a `(π/2, π/3, π/7)` triangle, so its image is not
  maximal in `PGL₂(ℝ)`.

*Needs:* §§2.1, 2.3; Mathlib `Maximal`.

### Examples

- `PSL₂(ℤ)` and its congruence subgroups have dense commensurator; `G₅` has commensurator `G₅`.

### Dependencies

Layer 1. FuchsianOrbifolds Layers 0 and 2. LieGroups. SemisimpleAlgebras Layer 3. ReductiveGroupsPartII
RG2.2.1, RG2.2.4. GL2AutomorphicRepresentationsAndTransfer R17.1.5.

## Layer 3: the order-32 Gassmann covers

Fix `g ≥ 3` and a subgroup `Γ₀ ≤ PSL₂(ℝ)` that is discrete, cocompact and torsion-free, with closed
quotient `S₀ = ℍ/Γ₀` of genus `g`, not arithmetic in the sense of §1.1, and whose image in `PGL₂(ℝ)` is
maximal among discrete subgroups of `PGL₂(ℝ)` containing it. Every theorem of this layer is stated for
every such `Γ₀`, and uses only these hypotheses.

### 3.1 Isometries of the hyperbolic plane

`existsUnique_pgl_smul_eq_isometryEquiv`: every distance-preserving bijection `f` of `ℍ` for
Mathlib's hyperbolic distance, no differentiability being assumed, is `z ↦ c · z` for exactly one
`c ∈ PGL₂(ℝ)`. The route uses only the distance (Voight, Theorem 33.5.5, whose proof is metric):

- `PGL₂(ℝ)` acts by isometries (FuchsianOrbifolds Layer 0 item 2), and `PSL₂(ℝ)` moves any two
  points `z ≠ z′` to `i` and `iy` with `y > 1` (Voight, Lemma 33.4.11, followed by a diagonal matrix
  and, if needed, `z ↦ −1/z`, which fixes `i` and sends `iy` to `i/y`). Applied to `f(i)` and
  `f(2i)`, at distance `log 2`, this gives `c₁ ∈ PSL₂(ℝ)` with `c₁f` fixing `i` and `2i`.
- For `z = x + iy`, `UpperHalfPlane.cosh_dist` gives `cosh d(z, i) = (x² + y² + 1)/(2y)` and
  `cosh d(z, 2i) = (x² + y² + 4)/(4y)`, so `4 cosh d(z, 2i) − 2 cosh d(z, i) = 3/y` determines `y`
  and then `x²`. Hence `c₁f(z) ∈ {z, −z̄}` for every `z`.
- If `c₁f(1 + i) = −1 + i`, compose with `z ↦ −z̄`, the class of `diag(−1, 1)`, which fixes `i` and
  `2i`; this gives `c ∈ PGL₂(ℝ)` with `c⁻¹f` fixing `i`, `2i` and `1 + i`. For `z` off the imaginary
  axis, `d(−z̄, 1 + i) = d(z, −1 + i) ≠ d(z, 1 + i)`, since `|z − (1 + i)|² − |z − (−1 + i)|² = −4x`;
  so `c⁻¹f(z) = z` for every `z`, and `f = c`.
- Uniqueness is faithfulness of the action (Mathlib's `FaithfulSMul PGL(2, ℝ) ℍ`).

**Isometry lifting.** Let `Γ₁, Γ₂ ≤ PGL₂(ℝ)` be discrete and torsion free. Each acts freely and
properly discontinuously on `ℍ`: `Γᵢ⁺ = Γᵢ ∩ toPGL(PSL₂(ℝ))` has index at most two in `Γᵢ` (§1.4),
its preimage under the continuous injective `toPGL` (§2.3) is a discrete subgroup of `PSL₂(ℝ)`, which
acts properly discontinuously (FuchsianOrbifolds Layer 0 item 3), so `Γᵢ`, a union of at most two
cosets of `Γᵢ⁺`, does too, and a point stabilizer is then finite, hence trivial. So the projection
`pᵢ : ℍ → ℍ/Γᵢ` is a covering map whose fibres are the orbits (Mathlib
`isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`) and a local Riemannian isometry onto
the quotient surface of Conventions (Tau Ceti `TauCeti.isLocalDiffeomorph_quotientMk` and
`Bundle.ContMDiffRiemannianMetric.isLocalRiemannianIsometry_descend`, every element of `PGL₂(ℝ)`
acting by a smooth isometry of the Poincaré metric by FuchsianOrbifolds L2.1). Prove that for every
isometry `f : ℍ/Γ₁ → ℍ/Γ₂` there is `c ∈ PGL₂(ℝ)` with `p₂(c • z) = f(p₁ z)` for every `z ∈ ℍ`,
that every such `c` satisfies `c Γ₁ c⁻¹ = Γ₂`, and that these `c` form exactly the coset `Γ₂ c`.
Route:

- The lifting criterion (`IsCoveringMap.existsUnique_continuousMap_lifts`, `ℍ` being simply connected
  and locally path connected) lifts `f ∘ p₁` through `p₂` to a continuous `F`, and `f⁻¹ ∘ p₂` through
  `p₁` to `G`, with compatible base points; uniqueness of lifts gives `G ∘ F = id` and `F ∘ G = id`.
- Near each point `F` is a local inverse of `p₂` composed with `f ∘ p₁`, so `F` is a smooth bijection
  with smooth inverse whose differential preserves the metric: a `TauCeti.RiemannianIsometry` of `ℍ`.
  It preserves the Riemannian distance (`TauCeti.RiemannianIsometry.riemannianEDist_eq`), which is
  Mathlib's distance (FuchsianOrbifolds L2.1), so `F = (c • ·)` for a unique `c` by
  `existsUnique_pgl_smul_eq_isometryEquiv`.
- For `γ ∈ Γ₁`, the maps `cγc⁻¹ • ·` and `δ • ·`, for the `δ ∈ Γ₂` with `cγc⁻¹ • w₀ = δ • w₀` at a
  chosen `w₀`, are both lifts of `p₂` through `p₂` agreeing at `w₀`, so they are equal, and
  `cγc⁻¹ = δ` by faithfulness. Hence `c Γ₁ c⁻¹ ≤ Γ₂`; the lift `c⁻¹` of `f⁻¹` gives the reverse
  inclusion. Two lifts `c, c′` give the lift `c′c⁻¹` of the identity of `ℍ/Γ₂`, which lies in `Γ₂` by
  the same argument.

**Checks.**

- The identity is given by `c = 1` only: the scalar matrix `2I` is `1` in `PGL₂(ℝ)`, and the action is
  faithful.
- `z ↦ −z̄` is `diag(−1, 1)`, of negative determinant; `z ↦ 2z` is `diag(2, 1)`, equal in `PGL₂(ℝ)` to
  `diag(√2, 1/√2)`.
- A Möbius map with negative determinant applied without conjugation, `z ↦ −z`, leaves `ℍ`; the
  convention `(a z̄ + b)/(c z̄ + d)` is forced.
- Two fixed points do not determine an isometry: `z ↦ −z̄` fixes `i` and `2i` and sends `1 + i` to
  `−1 + i`, at distance `arcosh 3` from `1 + i` (`cosh d = 1 + 4/2`), which is why the route fixes the
  third point `1 + i` off the imaginary axis.
- Direction of the lifting: for `Γ₁ = ⟨z ↦ z + 1⟩`, `Γ₂ = ⟨z ↦ z + 2⟩` and `c = diag(2, 1)`,
  `c • (z + 1) = (c • z) + 2`, so `z ↦ 2z` descends to an isometry `ℍ/Γ₁ → ℍ/Γ₂` with
  `cΓ₁c⁻¹ = Γ₂`, while `c⁻¹Γ₁c = ⟨z ↦ z + 1/2⟩ ≠ Γ₂`.
- Lifts form a coset and are not unique: for `Γ = ⟨z ↦ 2z⟩` the lifts of the identity of `ℍ/Γ` are
  exactly the maps `z ↦ 2ᵏz`.
- Orientation-reversing groups are included: the glide reflection `z ↦ −2z̄`, the class of
  `diag(−2, 1)`, generates a discrete torsion-free `Γ` with `Γ⁺ = ⟨z ↦ 4z⟩` of index two (an odd
  power `z ↦ −2ⁿz̄` moves every point, multiplying imaginary parts by `2ⁿ`); `ℍ/Γ` is a Möbius band,
  and the lifts of its identity include the orientation-reversing generator, which a statement for
  subgroups of `PSL₂(ℝ)` alone would miss.
- Torsion-freeness is needed for the covering: for `Γ = ⟨z ↦ −1/z⟩`, of order two, `i` is fixed and
  the projection is two-to-one near `i` but one-to-one at `i`, so it is not a covering there.

*Needs:* for the identification, FuchsianOrbifolds Layer 0 item 2; Mathlib `UpperHalfPlane.cosh_dist`,
the `PGL(2, ℝ)` action and its `FaithfulSMul` instance. For the isometry lifting, the identification,
§1.4 (the index-two inclusion), §2.3 (continuity of `toPGL`), FuchsianOrbifolds Layer 0 items 2–3 and
L2.1; Mathlib `IsCoveringMap.existsUnique_continuousMap_lifts` and
`isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`; Tau Ceti
`TauCeti.UpperHalfPlane.poincareRiemannianMetric`, `TauCeti.instIsManifoldQuotient`,
`TauCeti.isLocalDiffeomorph_quotientMk`, `Bundle.ContMDiffRiemannianMetric.quotient`,
`Bundle.ContMDiffRiemannianMetric.isLocalRiemannianIsometry_descend`, `TauCeti.RiemannianIsometry`
and `TauCeti.RiemannianIsometry.riemannianEDist_eq`. (Voight, Lemma 33.4.11 and Theorem 33.5.5.)

### 3.2 The finite pair

Let `Q = (ℤ/8ℤ)^× ⋉ ℤ/8ℤ` with `(u,a)(v,b) = (uv, a + ub)`, `H₁ = {(1,0), (3,0), (5,0), (7,0)}` and
`H₂ = {(1,0), (3,4), (5,4), (7,0)}`. Prove `|Q| = 32` and `|H_i| = 4`; the conjugation formula
`(u,a)(v,b)(u,a)⁻¹ = (v, ub + (1−v)a)`; that `H₁` and `H₂` meet every conjugacy class in the same
number of elements, which is `Subgroup.AlmostConjugate`; that they are not conjugate; that `(1,1)`,
`(3,0)`, `(5,0)` generate `Q`; and that both subgroups have trivial core, so both coset actions are
faithful. This is the specific order-32 pair; InductionRestriction Layer 2.1 supplies only the
generic equivalence between almost conjugacy and equivalence of permutation representations.

**Checks.**

- The eleven classes, with representatives `(1,0), (1,1), (1,2), (1,4), (3,0), (3,1), (5,0), (5,1),
  (5,2), (7,0), (7,1)`, have sizes `1, 4, 2, 1, 4, 4, 2, 4, 2, 4, 4`, summing to 32; both intersection
  sequences are `1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0`.
- Nonconjugacy: a conjugate of `H₁` equal to `H₂` would need translation part `a ≡ 2 (mod 4)` from
  its unit-3 element and `a` odd from its unit-5 element.
- Generation: `(1,1)^a (3,0)^j (5,0)^m = (3^j 5^m, a)` for `0 ≤ a < 8`, `j, m ∈ {0,1}` lists all 32
  elements.
- The common coset character in the same class order is `8, 0, 0, 0, 2, 0, 4, 0, 0, 2, 0`.

*Needs:* Tau Ceti `Subgroup.AlmostConjugate`; InductionRestriction Layer 2.1.

### 3.3 The genericity hypotheses and the full commensurator

§2.1 makes `Comm_PSL(Γ₀)` discrete; §2.3 makes `Comm_PGL(Γ₀)` discrete, with positive-determinant part
`toPGL(Comm_PSL(Γ₀))` of index at most two; maximality then gives `Comm_PGL(Γ₀) = toPGL(Γ₀)` (§2.4).
An isometry `h` of `S₀`, conformal or anticonformal, lifts by §3.1's isometry lifting, with
`Γ₁ = Γ₂ = toPGL(Γ₀)`, to some `c ∈ PGL₂(ℝ)` normalizing `toPGL(Γ₀)`; so `c ∈ Comm_PGL(Γ₀) =
toPGL(Γ₀)`, `h` is the identity, and `S₀` has trivial isometry group.

**Checks.**

- The hypotheses are about `Γ₀`, not a coordinate model: conjugating `Γ₀` by an element of `PGL₂(ℝ)`
  preserves all of them.
- The `(2,3,7)` group is excluded twice: it has torsion and it is arithmetic.

*Needs:* §§2.1, 2.3, 2.4 and 3.1 (the isometry lifting).

### 3.4 The covers and their nonisometry

The standard presentation of §1.4 gives `Γ₀`, of signature `(g; −; 0)` with `g` the genus of `S₀`
(FuchsianOrbifolds Layer 4 item 5), the presentation `⟨a₁, b₁, …, a_g, b_g | [a₁, b₁] ⋯ [a_g, b_g]⟩`.
For every surjection `φ : Γ₀ → Q` (one exists for `g ≥ 3`: send `a₁, a₂, a₃` to `(1,1), (3,0), (5,0)`
and the other generators to `1`, which respects the relator and is onto by §3.2) put `Γ = ker φ` and
`Γ_i = φ⁻¹(H_i)`. Then `Γ ◁ Γ₀`, `Γ_i/Γ ≃ H_i`, `[Γ₀ : Γ_i] = 8`, and the covers `S_i = ℍ/Γ_i → S₀` are
unbranched of degree `8` (FuchsianOrbifolds Layer 5 item 5) and genus `8g − 7` (Layer 5 item 6, the
Fuchsian Riemann–Hurwitz formula with no ramification). The quotient `X = ℍ/Γ` is a closed
connected surface with the descended metric (Conventions; Tau Ceti `TauCeti.instIsManifoldQuotient`
and `Bundle.ContMDiffRiemannianMetric.quotient`); `Q` acts freely on `X` by isometries, and for
every `H ≤ Q` the map induced by the identity of `ℍ` is an isometry `X/H ≃ ℍ/φ⁻¹(H)`, and `X → X/H`
is the finite regular covering with deck group `H` (Mathlib
`isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`).

Nonisometry: if `f : S₁ → S₂` is an isometry, orientation-preserving or not, §3.1's isometry lifting,
with `Γ₁, Γ₂` read in `PGL₂(ℝ)` through `toPGL`, gives `c ∈ PGL₂(ℝ)` with `c Γ₁ c⁻¹ = Γ₂`. Both have
finite index in `Γ₀`, so `c` commensurates `toPGL(Γ₀)` and `c = toPGL(γ)` for some `γ ∈ Γ₀` (§3.3);
then `φ(γ)` conjugates `H₁` to `H₂`, contradicting §3.2.

**Checks.**

- Genus: `2h − 2 = 8(2g − 2)` gives `h = 8g − 7`, so `h = 17` for `g = 3`.
- The covers `S_i → S₀` need not be normal; the common cover `X → S₀` is.

*Needs:* §1.4 (the standard presentation); §§3.1–3.3; FuchsianOrbifolds Layer 4 item 5 and Layer 5
items 5–6; Tau Ceti `TauCeti.instIsManifoldQuotient` and `Bundle.ContMDiffRiemannianMetric.quotient`;
Mathlib `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`.

### 3.5 Representation equivalence and isospectrality

The right-regular representations of `G = PSL₂(ℝ)` on `L²(Γ₁\G)` and `L²(Γ₂\G)` are unitarily
equivalent, by NoncompactQuantumSymmetry M1 applied to the finite left deck action of `Q` on
`L²(Γ\G)`, which commutes with the right `G`-action because `Γ ◁ Γ₀`, and InductionRestriction Layer
2.1; Haar measure is normalized by probability measure on `PSO(2)` and hyperbolic area on `G/PSO(2)`.
Separately, `S₁` and `S₂` are isospectral for the scalar Laplacian with multiplicities, by
PseudodifferentialOperators P7a with the normalized pullbacks `|H|^(−1/2) π_H^*`, whose isometry is the
degree-`|H|` integration formula. The quotient surfaces are proved closed, connected and smooth, with
their covering and local-isometry structure, before any Sobolev or spectral argument is applied. The
statement is not formalized in `Suggested.lean`: the pins have no Laplace spectrum of a compact
quotient surface.

**Checks.**

- Equal multiplicity of the eigenvalue `0`: both surfaces are connected, so each has multiplicity one.
- Equal area: `area(S₁) = area(S₂) = 8 · 4π(g − 1)`, as Weyl's law requires of isospectral surfaces.

*Needs:* §3.2, §3.4; NoncompactQuantumSymmetry M1; PseudodifferentialOperators P7a; InductionRestriction
Layer 2.1.

### Examples

- For `g = 3` the construction gives two nonisometric isospectral surfaces of genus 17 covering `S₀`
  with degree eight.

### Dependencies

Layers 1 (§1.1, and §1.4's standard presentation and index-two inclusion) and 2. FuchsianOrbifolds
Layers 0, 2, 4 (item 5) and 5. InductionRestriction Layer 2.1. NoncompactQuantumSymmetry M1.
PseudodifferentialOperators P7a.

## Downstream consumers

- TeichmullerGeometry takes §1.1 and §1.4 (cited there as §1.1 and §1.4) for its arithmetic
  locus, and §3.1, for distance-preserving bijections with no differentiability assumed, for its
  §0.4a identification of `Isom(ℍ)` with `PGL₂(ℝ)`. §3.1's isometry lifting, between quotients of
  `ℍ` by discrete torsion-free subgroups of `PGL₂(ℝ)` and unique up to left multiplication by `Γ₂`,
  is the lifting statement its §0.4a uses, and the quotient topology of `PGL₂(ℝ)` fixed under
  Conventions (`instTopologicalSpacePGL`) is the topology its discreteness conditions refer to.
  Surfaces in its Layer 11
  common generic locus satisfy the hypotheses of Layer 3; the order-32 pairs in every genus `g ≥ 3` over
  that locus belong to the later roadmap named in TeichmullerGeometry's Downstream consumers section.
- QuaternionArithmetic, which consumes the arithmetic lattice theorem of §1.1 and so comes after this
  roadmap, takes from here the existence of a maximal order containing a given order and the local
  structure of maximal orders, the norm-one group `O¹`, the local order-to-tree adapter, the
  normalizers, the covolume formula (§§1.1–1.2) and the finiteness of maximal-order types (§1.4), for
  its §§1.2, 1.7, 1.12, 3.5, 3.6 and 8.2; orders and maximal orders themselves are Tau Ceti's
  `TauCeti.IntegralOrder.IsOrder` and `TauCeti.IntegralOrder.IsMaximalOrder`.

## References

- **odlyzko1977.** A. M. Odlyzko, “Lower bounds for discriminants of number fields. II,” *Tôhoku
  Mathematical Journal* 29 (1977), 209–216: Theorem 1 with estimate (5), p. 210; (7)–(8), p. 212;
  (9)–(12), p. 213; (13) and its reduction to `Re z = 1`, p. 214; the tables, p. 215.
  <https://www.jstage.jst.go.jp/article/tmj1949/29/2/29_2_209/_pdf/-char/en>
- **odlyzko1976tables.** A. M. Odlyzko, unpublished unconditional discriminant-bound Tables 2 and 4
  (November 29, 1976), <https://www-users.cse.umn.edu/~odlyzko/unpublished/discr.bound.table4>.
- **voight2021.** John Voight, *Quaternion Algebras*, Graduate Texts in Mathematics 288 (open access;
  locators in the author edition at <https://jvoight.github.io/quat-book.pdf>): Lemma 33.4.11,
  Theorem 33.5.5, Proposition 38.3.8, Main Theorem 38.4.3, Theorem 39.1.2, Main Theorem 39.1.8 with
  (39.1.9).
- **borel1981.** Armand Borel, “Commensurability classes and volumes of hyperbolic 3-manifolds,”
  *Annali della Scuola Normale Superiore di Pisa* (4) 8 (1981), 1–33: §§3–4, 7.1, Theorem 7.3,
  Lemma 8.1, Theorem 8.2. <http://www.numdam.org/item/ASNSP_1981_4_8_1_1_0/>
- **takeuchi1983.** Kisao Takeuchi, “Arithmetic Fuchsian groups with signature (1;e),” *Journal of
  the Mathematical Society of Japan* 35 (1983), 381–407, Theorem 2.1.
- **maclachlanreid2003.** Colin Maclachlan and Alan W. Reid, *The Arithmetic of Hyperbolic
  3-Manifolds*, Graduate Texts in Mathematics 219: Theorems 11.2.1 and 11.3.1.
- **bgls2010.** M. Belolipetsky, T. Gelander, A. Lubotzky and A. Shalev, “Counting arithmetic
  lattices and surfaces,” *Annals of Mathematics* 172 (2010), 2197–2221, §§2–5, with presentation
  (11) of §4, p. 12 of arXiv:0811.2482v2.
- **baderfurman2021.** Uri Bader and Alex Furman, “Boundaries, rigidity of representations, and
  Lyapunov exponents,” arXiv:1404.5107: Definition 2.3, Theorem 2.5, Lemma 2.6, Theorem 3.2, Lemma 4.2.
- **margulis1991.** G. A. Margulis, *Discrete Subgroups of Semisimple Lie Groups*, Ergebnisse der
  Mathematik 17, Chapter IX.
