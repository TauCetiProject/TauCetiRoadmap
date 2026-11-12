# Roadmap: real semisimple Lie groups, parabolic subgroups and Riemannian symmetric spaces

**Summary.** This roadmap builds the structure theory of real semisimple and real reductive Lie
groups that sits on top of the global Cartan, Iwasawa and `KAK` decompositions, and the
Riemannian geometry of the symmetric space `G/K`. At the Lie-algebra level it develops Cartan
involutions of a real semisimple or reductive Lie algebra with their conjugacy, maximal abelian
subspaces `𝔞 ⊆ 𝔭`, the restricted root system (possibly nonreduced) with its multiplicities, the
real rank, split forms and hyperbolic elements. At the group level it develops the real rank of a
Lie group and its almost-simple factors, the restricted Weyl group, minimal parabolic subgroups,
the Bruhat decomposition as a Tits system, standard and general parabolic subgroups with their
Langlands decompositions, Levi subgroups, the dynamical description and the comparison with
algebraic `ℝ`-parabolics. On the geometric side it develops Riemannian symmetric spaces, the
symmetric space `X = G/K` of a real reductive group with its invariant metric, curvature, geodesics
and distance, Cartan's fixed-point theorem and the conjugacy of maximal compact subgroups, flats
and the rank of `X`, the vector-valued distance, and quotients `Λ\X` by discrete subgroups with
their injectivity radius and volume.

This README is the roadmap. `Suggested.lean` states the roadmap's headline theorems against the
pinned Mathlib and Tau Ceti.

## Scope and ownership

This roadmap owns:

- the Cartan-involution predicate on a real semisimple and on a real reductive Lie algebra, the
  Cartan decomposition `𝔤₀ = 𝔨 ⊕ 𝔭` with its bracket, Killing-form and adjointness relations,
  the conjugacy of Cartan involutions under inner automorphisms, their behaviour on ideals and
  products, the compactness criterion, and the classical matrix realizations (Layer 0);
- maximal abelian subspaces of `𝔭`, the restricted root spaces and restricted roots of a real Lie
  algebra with a Cartan involution, LieGroups Layer 9's restricted root system read on such an
  algebra and packaged as a Mathlib `RootPairing` with multiplicities and the comparison with
  Mathlib's weight spaces, positive systems and simple restricted roots, conjugacy of maximal
  abelian subspaces, the real rank of a real semisimple Lie algebra, and split real forms
  (Layer 1);
- the real rank of a Lie group with semisimple Lie algebra, almost-simple and compact factors,
  higher rank, the hyperbolic elements and their conjugacy into the closed chamber, the
  characterization of real rank by `ℝ`-split abelian subalgebras and by algebraic split tori, the
  conjugacy of maximal `ℝ`-split tori of a connected reductive `ℝ`-group under its real points, the
  identification of the restricted Weyl group `N_K(𝔞)/Z_K(𝔞)` with the Weyl group of the
  restricted root system, and, for a real form `H^τ` of a connected complex reductive group, the
  identification of `τ` with the conjugation of an `ℝ`-form and the reading on `H^τ` of
  ArithmeticLocallySymmetricSpaces ALS.0.1's Cartan involutions, with their LieGroups Layer 9 datum
  and maximal compact subgroups (Layer 2);
- minimal parabolic subgroups beyond the class of real points of algebraic groups, the normalizer
  `N_G(𝔞)`, rank-one subgroups, the Tits system `(P, N_G(𝔞))`, the Bruhat decomposition, the big
  cell and the Furstenberg boundary `G/P` with its Bruhat cells (Layer 3);
- standard parabolic subalgebras and subgroups, their classification by subsets of the simple
  restricted roots, Levi subgroups and Langlands decompositions, general parabolic subgroups and
  their type, maximal parabolic subgroups, the dynamical description, and the comparison with
  algebraic `ℝ`-parabolic subgroups (Layer 4);
- Riemannian symmetric spaces, the symmetric space `G/K` of a real reductive group with its
  invariant metric, Levi-Civita connection, curvature, geodesics, completeness and distance;
  convexity of the squared distance on Hadamard manifolds, Cartan's fixed-point theorem and the
  conjugacy of maximal compact subgroups; totally geodesic submanifolds and Lie triple systems,
  flats, the rank of `X`, Weyl chambers and the vector-valued distance; quotients `Λ\X` by
  discrete subgroups, their injectivity radius, local symmetry and volume; and complex hyperbolic
  space, the symmetric space of `PU(1, n)`, in its ball model with its invariant metrics and its
  totally geodesic submanifolds (Layer 5).

It consumes, and does not rebuild:

- from RepresentationTheory/LieGroups: Lie groups, `lieExp`, `Ad`, closed and immersed subgroups,
  integration of subalgebras, universal covers (Layers 0–5); the splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤, 𝔤]` of
  the Lie algebra of a compact connected group, with negative definite Killing form on `[𝔤, 𝔤]`
  (Layer 5A); the compact real form of a complex semisimple Lie algebra and the **existence** of a
  Cartan involution of a real semisimple Lie algebra, and compactness of the simply connected
  integration of a compact semisimple Lie algebra, real forms of a complex Lie group as fixed
  groups of antiholomorphic involutions, the compact real forms of a connected complex reductive
  group with their conjugacy, and the lower analytic dictionary `H ≃ 𝐆(ℂ)` (Layer 7); and the
  global real-reductive datum
  `CartanInvolution`, the global Cartan polar decomposition `cartan_polar_decomposition`, the
  `IwasawaData` with its maximal abelian `𝔞`, `N₊` and positive chamber, `iwasawaDecomposition`,
  `kakDecomposition`, `Ad(K)𝔞 = 𝔭`, the compactness and maximality of `K`, and the possibly
  nonreduced restricted root system with its root space decomposition, the representatives in
  `N_K(𝔞)` of the restricted reflections, the root chambers and the carrying of every element of `𝔞`
  into the closed chamber by `N_K(𝔞)` (Layer 9);
- from AutomorphicFormsOnReductiveGroups §2.3a: the minimal parabolic subgroup `P = MAN` and its
  Langlands decomposition for real reductive groups in its supplied class
  (ArithmeticLocallySymmetricSpaces ALS.0.1–ALS.0.3: the real points `𝐇(ℝ)` of a connected
  reductive `ℝ`-group and the groups `𝐆(F_∞)`), with the real-rank-one description, and the
  algebraic comparison with minimal `ℝ`-parabolics for `𝐆(ℝ)` and its identity component;
- from RiemannianGeometry and HopfRinow: the curvature calculus, homogeneous metrics and
  Riemannian submersions (R1.3), Jacobi fields (R2), Cartan–Hadamard and the injectivity radius
  (R4.4, R4.6), immersion geometry and the second fundamental form (R5a), and the Riemannian
  distance and Hopf–Rinow theorem;
- from SmoothBundlesConnections: the smooth homogeneous space `G ⧸ H` of a closed subgroup and
  the principal bundle `G → G ⧸ H` (B1.4);
- from RootSystems and Mathlib: root pairings, bases, Weyl groups, chambers, Coxeter systems.

It leaves to other roadmaps:

- Lie groups and the global Cartan, Iwasawa and `KAK` decompositions:
  RepresentationTheory/LieGroups;
- representation theory of real reductive groups (principal series, Harish-Chandra modules,
  Langlands classification): AutomorphicFormsOnReductiveGroups and the representation-theory
  roadmaps that consume this one;
- algebraic groups over a field, their parabolic `k`-subgroups, cocharacter parabolics and
  relative root systems: ReductiveGroups;
- arithmetic subgroups, the symmetric space with the split-centre correction `G(F_∞)/K_∞A_∞`,
  Borel–Serre compactifications: ArithmeticLocallySymmetricSpaces and AdelicAlgebraicGroups;
- Hermitian symmetric domains and Shimura data: ShimuraData; the complex structure of a Hermitian
  symmetric domain, its Borel embedding into the compact dual, and arithmetic quotients of it as
  normal quasi-projective varieties (Baily–Borel), ball quotients by arithmetic lattices included:
  ShimuraVarieties (§§P.2–P.3 and Layers 1–3); Kähler forms and complex projective space:
  ComplexKahlerGeometry;
- lattices in locally compact groups (discrete subgroups with a fundamental domain of finite Haar
  measure), arithmetic subgroups, and arithmetic lattices in a real Lie group with their
  independence of choices: AdelicAlgebraicGroups (AA.2.2–AA.2.3 and §3.4, "Arithmetic lattices in
  a real Lie group"); §5.6 states its covolume results for an arbitrary discrete subgroup;
- the restricted root system of a group carrying LieGroups Layer 9's `IwasawaData` (its root
  space decomposition, the reflections realized in `N_K(𝔞)`, the root chambers and the carrying of
  `𝔞` into the closed chamber) and the maximality of `K`: LieGroups Layer 9; Layer 1 reads them on
  a real Lie algebra through the adjoint datum of §0.2 and adds the `RootPairing` packaging;
- the splitting of the Lie algebra of a compact group: LieGroups Layer 5A; §0.1 states it for a
  real Lie algebra with a negative definite invariant form, which needs no group;
- the conjugacy of the maximal compact subgroups of the real points of a reductive `ℝ`-group, every
  compact subgroup lying in one: ArithmeticLocallySymmetricSpaces ALS.F.1; §5.4 proves containment
  and conjugacy for every LieGroups `CartanInvolution` datum, nonlinear finite covers included;
- the Cartan involutions of a connected reductive `ℝ`-group, their existence and their conjugacy
  under its real points, and the transpose-stable realization of its real points:
  ArithmeticLocallySymmetricSpaces ALS.0.1 and ALS.F.1; §2.5 reads them on `H^τ` and refines the
  conjugacy to `(H^τ)°`, §0.2 proves the conjugacy of the Cartan involutions of a real semisimple
  Lie algebra under `Int(𝔤₀)`, and §5.4 that of LieGroups `CartanInvolution` data on a group,
  nonlinear finite covers included.

The boundary with LieGroups Layer 9 is the following. Layer 9 owns the global decompositions
of a group carrying its `CartanInvolution` datum, the group-level fields of `IwasawaData`, and the
restricted root system of such a group: its root space decomposition, the reflections realized in
`N_K(𝔞)`, the root chambers and the carrying of `𝔞` into the closed chamber. A real semisimple
`𝔤₀` with a Cartan involution `θ` is `Lie(Int(𝔤₀))` with `θ = dΘ` for the adjoint datum of §0.2,
so §1.1–§1.2 obtain these statements for `(𝔤₀, θ)` from Layer 9 and own only what Layer 9 does not
state: the Lie-algebra carriers `restrictedRootSpace` and `restrictedRoots`, the `RootPairing`
packaging, the multiplicities and the comparison with Mathlib's weight spaces. Everything in
Layers 2–5 is built on top of Layer 9 and is not restated there.

Outside this roadmap: the Lie-group structure of the full isometry group of a Riemannian
manifold (Myers–Steenrod) and the resulting Cartan classification of abstract symmetric spaces,
symmetric spaces of compact type and duality, the visual boundary and Tits building of `X`,
spherical functions and harmonic analysis on `X`; the theory of lattices beyond the definitions
AdelicAlgebraicGroups supplies (Selberg's lemma, finite generation, arithmeticity, superrigidity,
non-arithmetic ball quotients and their Siu–Yau–Mok compactification); the full biholomorphism
group of the ball (H. Cartan's uniqueness theorem); and representation and character varieties
of surface groups in real reductive groups (reductive representations, closed orbits,
Richardson–Slodowy), which consume §2.5 and Layer 0.

## Conventions

- **Lie algebras.** `𝔤₀` is a finite-dimensional real Lie algebra (Mathlib `LieRing`,
  `LieAlgebra ℝ`, `FiniteDimensional ℝ`). `B` is its Killing form, Mathlib's
  `killingForm ℝ 𝔤₀`, the Killing form of the **real** algebra, never of `𝔨` or of a
  complexification. Semisimple is Mathlib's `LieAlgebra.IsSemisimple ℝ`. Reductive means
  `𝔤₀ = 𝔷(𝔤₀) ⊕ [𝔤₀, 𝔤₀]` with `[𝔤₀, 𝔤₀]` semisimple, spelled through `LieAlgebra.center` and
  `LieAlgebra.derivedSeries ℝ 𝔤₀ 1` as in LieGroups Layer 9's `CartanInvolution`. For a Lie
  group `G` the Lie algebra is `LeftInvariantDerivation I G`.
- **Cartan involutions.** A Cartan involution of a semisimple `𝔤₀` is `θ : 𝔤₀ ≃ₗ⁅ℝ⁆ 𝔤₀` with
  `θ² = 1` and `B_θ(X, Y) = −B(X, θY)` positive definite. For reductive `𝔤₀` it is an involutive
  automorphism whose restriction to `[𝔤₀, 𝔤₀]` is a Cartan involution; on the centre it is an
  arbitrary involution. `𝔨 = ker(θ − 1)`, `𝔭 = ker(θ + 1)`. The group-level datum is LieGroups
  Layer 9's `CartanInvolution`, with group involution `Θ`, `dΘ = θ`, and `K = G^Θ`.
- **Restricted roots.** For an abelian subspace `𝔞 ⊆ 𝔭` and `λ ∈ 𝔞* = Module.Dual ℝ 𝔞`,
  `𝔤_λ = {X | [H, X] = λ(H)X for all H ∈ 𝔞}`. `Σ = Σ(𝔤₀, 𝔞)` is the set of nonzero `λ` with
  `𝔤_λ ≠ 0`; it may be nonreduced. `m_λ = dim 𝔤_λ`. `𝔪 = Z_𝔨(𝔞)`, `M = Z_K(𝔞)`, `A = lieExp 𝔞`.
  `W(Σ)` is the Weyl group of the restricted root pairing (`RootPairing.weylGroup`), and
  `W_G = N_K(𝔞)/Z_K(𝔞)` is the group-level restricted Weyl group. An **indivisible** root is a
  `λ ∈ Σ` with `λ/2 ∉ Σ`; chamber and base results that Mathlib and Tau Ceti state for reduced
  root pairings are applied to the reduced subsystem of indivisible roots, which has the same Weyl
  group, chambers and simple-root directions.
- **Positive systems.** A positive system is `Σ⁺ = {λ ∈ Σ | λ(H₀) > 0}` for a regular
  `H₀ ∈ 𝔞`; `Π` is its set of simple roots (indivisible), `𝔫 = ⊕_{λ ∈ Σ⁺} 𝔤_λ`
  (`positiveRestrictedRootSpace 𝔞 H₀`), `N = lieExp 𝔫`, and the closed positive chamber is
  `𝔞̄⁺ = {H | λ(H) ≥ 0 for λ ∈ Σ⁺}`. The `N` of a minimal
  parabolic is always the root-generated `N₊` of LieGroups Layer 9, never an arbitrary admissible
  Iwasawa complement.
- **Standard parabolics.** For `Π' ⊆ Π`, `Σ_{Π'} = Σ ∩ span_ℝ Π'` and
  `𝔮_{Π'} = 𝔪 ⊕ 𝔞 ⊕ ⊕_{λ ∈ Σ⁺ ∪ Σ_{Π'}} 𝔤_λ`. So `Π'` lists the simple roots whose negatives lie
  in the Levi: `𝔮_∅` is minimal and `𝔮_Π = 𝔤₀`. Sources that index by the complement `Π ∖ Π'`
  are translated by this rule. Groups act on `G/Q` on the left.
- **Bounded.** A subset of a Lie group is bounded when its closure is compact. The dynamical
  parabolic of `X ∈ 𝔤₀` is `{g | exp(−tX) g exp(tX), t ≥ 0, is bounded}`; with this sign it
  contains `N` when `X` lies in the open positive chamber.
- **The symmetric space.** `X = G ⧸ K` (left cosets, Mathlib's `G ⧸ K`), base point `o = 1·K`,
  left `G`-action. For semisimple `𝔤₀` the metric at `o` is `B|𝔭`, unscaled, transported along
  `dπ_1|𝔭 : 𝔭 ≅ T_oX`. For reductive `𝔤₀` the metric at `o` is `B` on `𝔭 ∩ [𝔤₀, 𝔤₀]` plus a
  specified `Ad(K)`-invariant inner product on `𝔭 ∩ 𝔷(𝔤₀)`, the two summands orthogonal. In both
  cases `⟨·,·⟩_o` denotes this inner product on `𝔭`.
  Curvature follows RiemannianGeometry: `R(X, Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y] Z` and
  `K(X, Y) = ⟨R(X, Y)Y, X⟩ / (|X|²|Y|² − ⟨X, Y⟩²)`. Noncompact type means `𝔤₀` semisimple with
  no compact simple ideal.
- **Groups considered.** Results about groups state their hypotheses: a `CartanInvolution`
  datum, an `IwasawaData`, connectedness, finiteness of the centre, or the hypothesis that `M`
  meets every connected component of `G` (`G = M·G⁰`). Connected semisimple groups with finite
  centre, including nonlinear ones such as finite covers of `SL₂(ℝ)` and the metaplectic group,
  are always covered.

## Exact supplier contracts

### From Mathlib

- Lie algebras: `killingForm`, `LieAlgebra.IsKilling`,
  `LieAlgebra.HasTrivialRadical.instIsKilling` (Cartan's criterion, so a real semisimple Lie
  algebra has nondegenerate Killing form), `LieAlgebra.IsSemisimple`, `LieAlgebra.center`,
  `LieAlgebra.derivedSeries`, `LieDerivation.IsKilling.exists_eq_ad` (every derivation of a
  Killing Lie algebra is inner), `LieAlgebra.ad`, `Module.End.eigenspace`,
  `LieModule.genWeightSpace`, `LieModule.Weight`, `LieAlgebra.rootSpace`,
  `LieSubalgebra.IsCartanSubalgebra`, `LieAlgebra.exists_isCartanSubalgebra_engel`.
- Classical matrix Lie algebras: `LieAlgebra.SpecialLinear.sl`, `LieAlgebra.Orthogonal.so'`
  with `LieAlgebra.Orthogonal.indefiniteDiagonal`, `LieAlgebra.Symplectic.sp`,
  `skewAdjointMatricesLieSubalgebra`.
- Root pairings: `RootPairing`, `RootPairing.IsRootSystem`, `RootPairing.IsCrystallographic`,
  `RootPairing.IsReduced`, `RootPairing.Base`, `RootPairing.nonempty_base`,
  `RootPairing.weylGroup`, `CoxeterSystem`.
- Groups and topology: `Subgroup.normalizer`, `Subgroup.centralizer`, `DoubleCoset`,
  `QuotientGroup`, `ProperlyDiscontinuousSMul`, `ContractibleSpace`, `IsIsometricSMul`,
  `MeasureTheory.Measure.haar`, `MeasureTheory.IsFundamentalDomain`.
- Manifolds: `LieGroup`, `LeftInvariantDerivation`, `mfderiv`, `IsManifold`,
  `Bundle.RiemannianBundle`, `IsRiemannianManifold`, `Manifold.riemannianEDist`,
  `CovariantDerivative.leviCivitaConnection`, `SimplyConnectedSpace`.
- Order: `Maximal` (for maximal abelian subspaces), `Module.finrank`.

### From Tau Ceti

- The Lie-group floor of LieGroups Layers 0–3: `lieExp`
  (`TauCeti/Geometry/Lie/Exponential/Basic.lean`),
  `TauCeti.Lie.Ad` (`TauCeti/Geometry/Lie/Adjoint/Derivation.lean`),
  `finiteDimensional_leftInvariantDerivation`, `TauCeti.Lie.lieSubalgebraOfSubgroup`,
  `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`.
- The symplectic Cartan involution `LieAlgebra.Symplectic.cartanInvolution` with
  `LieAlgebra.Symplectic.killingForm_cartanInvolution_apply` and
  `LieAlgebra.Symplectic.killingForm_cartanInvolution_self_neg`
  (`TauCeti/Algebra/Lie/Symplectic/{Cartan,Killing}.lean`) and its group form
  (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Cartan.lean`,
  `TauCeti/Geometry/Lie/Symplectic/Cartan.lean`).
- Matrix Iwasawa data: `TauCeti.iwasawaHomeomorph`
  (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Iwasawa.lean`),
  `TauCeti.iwasawaSLHomeomorph`, `TauCeti.posDiagonalSubgroup`,
  `TauCeti.upperUnitriangularGroup`, `TauCeti.upperTriangularGroup`, the restricted Weyl group
  of `GL n` `TauCeti.unitaryNormalizerPosDiagonalQuotientMulEquivPerm`
  (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/RestrictedWeylGroup.lean`) and the maximal
  compact subgroups of `GL n` (`.../GeneralLinearGroup/MaximalCompact.lean`).
- Tits systems: `TauCeti.TitsSystem`, its Bruhat cells and
  `TauCeti.TitsSystem.existsUnique_mem_bruhatCell`; standard parabolic subgroups
  `TauCeti.TitsSystem.standardParabolic`, `standardParabolicOrderIso` (subgroups containing `B`),
  `mem_doubleCoset_standardParabolic_iff`, `normalizer_standardParabolic` and
  `parabolicTitsSystem` (`TauCeti/GroupTheory/TitsSystem/Parabolic/`).
- Coxeter parabolics: `CoxeterSystem.parabolic` and minimal coset representatives
  (`TauCeti/GroupTheory/Coxeter/Parabolic`).
- Root systems: `RootPairing.dominantChamber`,
  `TauCeti.existsUnique_mem_orbit_inter_dominantChamber`,
  `RootPairing.Base.existsUnique_map_eq`, `TauCeti.longestElement`
  (`TauCeti/LinearAlgebra/RootSystem/`).
- Borel subalgebras `TauCeti.borelSubalgebra` and `TauCeti.positiveNilradical`
  (`TauCeti/Algebra/Lie/Weights/Borel.lean`).
- Algebraic parabolics: `TauCeti.HopfIdeal.IsParabolic`, `TauCeti.Cocharacter.parabolic`
  (`TauCeti/Algebra/AlgebraicGroup/Parabolic/Basic.lean`, `.../Dynamic/`).
- Riemannian geometry: `TauCeti.RiemannianIsometry`, `TauCeti.IsLocalRiemannianIsometry` and
  `TauCeti.IsLocalRiemannianIsometry.hasParallelCurvature`
  (`TauCeti/Geometry/Manifold/Riemannian/Isometry/`), `CovariantDerivative.HasParallelCurvature`
  and `CovariantDerivative.sectionalCurvature`
  (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/`),
  `TauCeti.leftInvariantMetric` (`.../Riemannian/LieGroup/LeftInvariant.lean`),
  `TauCeti.completeSpace_of_isPretransitive_isom_of_finiteDimensional`
  (`.../Riemannian/Homogeneous.lean`),
  `TauCeti.Manifold.norm_le_norm_mfderiv_riemannianExp_of_sectionalCurvature_nonpos`
  (`.../Riemannian/Jacobi/Comparison.lean`), `TauCeti.riemannianVolume`
  (`.../Riemannian/VolumeDensity/Volume.lean`), the upper half-space model `TauCeti.UpperHalfSpace`
  of real hyperbolic space (`TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/`), and
  the quotient manifold of a free properly
  discontinuous action (`TauCeti/Geometry/Manifold/Instances/Quotient.lean`).

### From other roadmaps

- **RepresentationTheory/LieGroups.** Layers 0–5 as above. Layer 5A: for compact connected `G`,
  `𝔤 = 𝔷(𝔤) ⊕ [𝔤, 𝔤]` with `[𝔤, 𝔤]` semisimple of negative definite Killing form. Layer 7: the
  compact real form `τ` of `𝔤₀ ⊗ ℂ` and the Cartan involution `θ = στ|_{𝔤₀}` of a real semisimple
  `𝔤₀` (existence), the compact semisimple integration theorem; a real form of a complex Lie group
  `H` as a closed embedded real Lie subgroup with `Lie(R) ⊗ ℂ ≅ Lie(H)`, the full and
  identity-component fixed subgroups of an antiholomorphic involution, the compact real forms of a
  connected linear complex reductive group with their compact-case polar decomposition and their
  conjugacy, and the identification `H ≃ 𝐆(ℂ)` with a connected reductive `ℂ`-group with its
  faithful closed immersion. Layer 9: `CartanInvolution`,
  `IsRealReductive`, `cartan_polar_decomposition`, the adjoint model of a connected semisimple group
  with finite centre, `IwasawaData`, `iwasawaDecomposition`, `kakDecomposition`, `Ad(K)𝔞 = 𝔭`, the
  compactness and maximality of `K`, the restricted root system with its root space decomposition
  and root chambers, `N_K(𝔞)/Z_K(𝔞)`, the reflection representatives and the carrying of `𝔞` into
  the closed chamber by `N_K(𝔞)`.
- **AutomorphicFormsOnReductiveGroups §2.3a.** `M`, `A`, `N`, `P = MAN`, the Langlands
  decomposition `M × A × N ≅ P`, `P = N_G(𝔫) = N_G(P)`, `P ∩ Θ(P) = MA`, `G = KP`, conjugacy of
  minimal parabolics, recovery of the decomposition from `P` and `θ`, the real-rank-one
  description, and the algebraic comparison `P = G ∩ 𝐏(ℝ)` with `A = 𝐒(ℝ)°` for a maximal
  `ℝ`-split torus `𝐒`, for its supplied class of real reductive groups.
- **ArithmeticLocallySymmetricSpaces ALS.0.1 and ALS.F.1.** ALS.0.1: the Cartan involutions of a
  connected reductive `ℝ`-group (involutions with compact twisted real form), their existence, their
  conjugacy under real points, and the Cartan involution `g ↦ (gᵀ)⁻¹` of a transpose-stable group,
  consumed by §2.5. ALS.F.1: real points of linear algebraic groups as Lie groups with finitely
  many components and the transpose-stable realization of a reductive group, consumed by §2.4,
  §2.5 and §4.5 and through AF §2.3a (whose class they form). Its maximal-compact clauses are the
  linear case of §5.4, cited there and not consumed.
- **ReductiveGroups Layer 7.** Parabolic `k`-subgroups, the cocharacter description
  `P_G(λ)` with its Levi `Z_G(λ)` and unipotent radical `U_G(λ)`. Layer 4: split tori and their
  diagonalizable representations. Layer 6: the derived group `𝐆_der`, the central torus `Z(𝐆)°`
  and the central isogeny `Z(𝐆)° × 𝐆_der → 𝐆`.
- **SmoothBundlesConnections B1.4.** The smooth quotient `G ⧸ H` by a closed subgroup, the
  principal `H`-bundle `G → G ⧸ H` and its tangent description.
- **RiemannianGeometry.** R1.3 (curvature of left-invariant metrics, homogeneous metrics on
  `G ⧸ H` from an `Ad(H)`-invariant product on a reductive complement, completeness of
  `G`-invariant metrics, Riemannian submersions), R1.2 (`HasParallelCurvature` and parallel
  transport), R2 (Jacobi fields and the exponential differential), R4.1 (index comparison),
  R4.4 (`cartanHadamard_isCoveringMap`), R4.6 (injectivity radius), R5a (second fundamental
  form of an immersion).
- **HopfRinow (completed).** Riemannian distance, minimizing geodesics, Hopf–Rinow, compactness
  of closed balls in a complete connected manifold.
- **RootSystems.** Bases, chambers, simple transitivity of the Weyl group on bases, longest
  element, standard parabolic subgroups of the Weyl group.
- **CompactGroups.** Haar probability measure on a compact group and averaging.

## How to read the build

Layer k is cited as Lk and its subsection k.n as §k.n; AF §2.3a is
AutomorphicFormsOnReductiveGroups §2.3a. Layers 0 and 1 are pure Lie-algebra
theory over `ℝ`: no group appears except the inner automorphism group `Int(𝔤₀)`, which §0.2 takes
from LieGroups. Layer 2 passes to Lie groups. Layers 3 and 4 are the parabolic theory and need
LieGroups Layer 9's `IwasawaData`. Layer 5 is the geometry of `G/K`; it needs Layers 0–2 and the
Cartan polar decomposition, and its §5.5 uses the `KAK` decomposition and the restricted Weyl
group of §2.3. Layers 3–4 and Layer 5 are independent of each other and can be built in
parallel once Layer 2 exists.

## Layer 0: Cartan involutions of real semisimple and reductive Lie algebras

### 0.1 The predicate and the Cartan decomposition

Define `IsCartanInvolution θ` for a real Lie algebra and the reductive Cartan-involution predicate
as in Conventions, with the eigenspaces `𝔨 = ker(θ − 1)` and `cartanP θ = 𝔭 = ker(θ + 1)`. Prove,
for an involutive automorphism: `𝔤₀ = 𝔨 ⊕ 𝔭`, `[𝔨, 𝔨] ⊆ 𝔨`, `[𝔨, 𝔭] ⊆ 𝔭`, `[𝔭, 𝔭] ⊆ 𝔨`, and
`B(𝔨, 𝔭) = 0`. For a Cartan involution prove: `B` is negative definite on `𝔨` and positive definite
on `𝔭`; `B_θ` is an inner product; `ad X` is `B_θ`-skew for `X ∈ 𝔨` and `B_θ`-symmetric for `X ∈ 𝔭`,
so `ad X` for `X ∈ 𝔭` is diagonalizable over `ℝ`; `θ` is `B_θ`-orthogonal; `B_θ` is invariant under
every automorphism commuting with `θ`; and `𝔨` is a compact Lie algebra in the sense that `B|_𝔨` is
a negative definite `ad(𝔨)`-invariant form. Prove that a finite-dimensional real Lie algebra with a
negative definite invariant symmetric bilinear form is the orthogonal direct sum of its centre and
its derived algebra, and that the derived algebra is semisimple with negative definite Killing form
(the orthogonal complement of an ideal is an ideal, and `ad X` is skew for the form); so `𝔨` is
reductive with semisimple derived algebra. Positivity of `B_θ` on all of `𝔤₀` forces `𝔤₀` to be
semisimple (nondegenerate Killing form, Mathlib's Cartan criterion). For the reductive predicate
prove the same statements on `[𝔤₀, 𝔤₀]`, that `θ` preserves the centre, and that
`𝔭 = (𝔭 ∩ 𝔷) ⊕ (𝔭 ∩ [𝔤₀, 𝔤₀])`. Existence of a Cartan involution of a real semisimple Lie algebra is
LieGroups Layer 7's; for reductive `𝔤₀` extend by any involution of the centre. (Knapp, *Lie Groups
Beyond an Introduction*, 2nd ed., Ch. VI §2; Helgason, *Differential Geometry, Lie Groups, and
Symmetric Spaces*, Ch. III §7.)

**Checks.**

- `𝔰𝔩₂(ℝ)` with `θ(X) = −Xᵀ`: `𝔨 = 𝔰𝔬(2)`, `𝔭` the symmetric trace-zero matrices,
  `B(X, Y) = 4 tr(XY)`, and `B_θ(X, X) = 4 tr(XXᵀ) > 0` for `X ≠ 0`.
- `θ = 1` on `𝔰𝔩₂(ℝ)` is not Cartan: `B_θ(H, H) = −B(H, H) = −8 < 0` for `H = diag(1, −1)`.
- On the abelian `ℝ`, every involution is a reductive Cartan involution (`[𝔤₀, 𝔤₀] = 0`), and
  none is a Cartan involution in the semisimple sense, because `B = 0`.

*Needs:* Mathlib Killing form and Cartan's criterion; LieGroups Layer 7 for existence.

### 0.2 Conjugacy, uniqueness and the inner automorphism group

Prove that any two Cartan involutions `θ, θ'` of a real semisimple `𝔤₀` are conjugate by an
inner automorphism: there is `Z ∈ 𝔭_θ` with `θ' = e^{ad Z} θ e^{−ad Z}`. For the Lie algebra of
a Lie group `G`, where `e^{ad Z} = Ad(lieExp Z)`, this is `exists_conj_cartanInvolution`; every
real semisimple `𝔤₀` is such a Lie algebra (`Int(𝔤₀)`). Route (Knapp, Ch. VI, Thm. 6.16 and
Cor. 6.19): `ω = θ'θ` is a `B_θ`-self-adjoint automorphism, so `ω²` is `B_θ`-positive; its real
powers `(ω²)^s` are automorphisms (eigenspace product law); `log ω²` is a derivation, hence `ad Z₀`
by `LieDerivation.IsKilling.exists_eq_ad`; `φ = (ω²)^{1/4}` conjugates `θ` to a Cartan involution
commuting with `θ'`, and two commuting Cartan involutions are equal. Prove also: a Cartan
involution is determined by `𝔨` (`𝔭 = 𝔨^{⊥_B}`), so the map `θ ↦ 𝔨` is injective; the
conjugating `φ` carries `𝔭_θ` onto `𝔭_θ'` and maximal abelian subspaces of `𝔭_θ` onto those of
`𝔭_θ'`.

Define `Int(𝔤₀)`, the inner automorphism group, as the connected Lie subgroup of `GL(𝔤₀)` with
Lie algebra `ad(𝔤₀)` (LieGroups Layer 4), and prove it equals the identity component of the
closed group `Aut(𝔤₀)` (LieGroups Layer 2, with `Der(𝔤₀) = ad(𝔤₀)`). Prove that `Int(𝔤₀)` is
stable under the `B_θ`-adjoint, that `φ ↦ θφθ⁻¹` is an involution of it whose fixed group
`K_θ` is compact with Lie algebra `ad(𝔨)`, and that this is LieGroups Layer 9's adjoint
`CartanInvolution` datum on `Int(𝔤₀)`. The conjugating element above lies in `Int(𝔤₀)`.

**Checks.**

- On `𝔰𝔩₂(ℝ)`, `θ(X) = −Xᵀ` and `θ'(X) = −g Xᵀ g⁻¹` with `g = diag(2, 1/2)` are both Cartan,
  and `θ' = Ad(h) θ Ad(h)⁻¹` with `h = diag(√2, 1/√2) = exp(Z)`, `Z = diag(log √2, −log √2) ∈ 𝔭_θ`.
- For compact `𝔤₀` the only Cartan involution is the identity.
- `Int(𝔰𝔩₂(ℝ)) ≅ PSL₂(ℝ)`, whose `K_θ` is `PSO(2)`, a circle.

*Needs:* §0.1; Mathlib `LieDerivation.IsKilling.exists_eq_ad`; LieGroups Layers 2, 4 and 9;
Tau Ceti `lieExp` and `TauCeti.Lie.Ad` for the group form.

### 0.3 Ideals, products and compactness

Prove that a Cartan involution of a semisimple `𝔤₀` preserves every simple ideal: like every
automorphism it permutes them (Eschenburg, *Lecture Notes on Symmetric Spaces*, §7, Lemma, p. 17,
and the proof of Theorem 7.1, p. 18), and it fixes each because `B` vanishes between distinct simple
ideals while `B(X, θX) < 0` for `X ≠ 0`. Prove that its restriction to an ideal is a Cartan
involution of that ideal; conversely a family of Cartan involutions of the simple ideals assembles
into one of `𝔤₀`. Prove that `𝔤₀` is compact (negative definite `B`) iff `1` is a Cartan involution
iff `𝔭 = 0` for some, equivalently every, Cartan involution. Prove that a semisimple `𝔤₀` is the
direct sum of its compact ideal (the sum of the compact simple ideals) and its noncompact ideal,
both `θ`-stable. For a complex semisimple Lie algebra `𝔩` viewed as real, a compact real form `𝔲`
gives the Cartan involution with `𝔨 = 𝔲` and `𝔭 = i𝔲`.

**Checks.**

- `𝔰𝔩₂(ℝ) × 𝔰𝔲(2)`: `θ = (−ᵀ) × 1`, the compact ideal is `𝔰𝔲(2)`, `𝔭 = 𝔭_{𝔰𝔩₂} × 0`.
- `𝔰𝔩₂(ℂ)` as a real Lie algebra: `𝔨 = 𝔰𝔲(2)`, `𝔭 = i𝔰𝔲(2)` (Hermitian trace zero), and
  `θ(X) = −X*`.
- The flip of `𝔰𝔩₂(ℝ) × 𝔰𝔩₂(ℝ)` is an involutive automorphism that does not preserve the simple
  ideals and is not Cartan: its fixed algebra is the diagonal `𝔰𝔩₂(ℝ)`, on which `B` is not
  negative definite.

*Needs:* §0.1; Mathlib's decomposition of a semisimple Lie algebra into simple ideals.

### 0.4 Matrix realizations

Prove that if `𝔤₀` is a real Lie subalgebra of `𝔤𝔩_n(ℂ)` (as a real Lie algebra), closed under
conjugate transpose, and semisimple, then `θ(X) = −X*` is a Cartan involution (Knapp, Ch. VI,
Prop. 6.28), with `B_θ` a positive multiple of `Re tr(XY*)` on each simple ideal. Apply it to:
`𝔰𝔩_n(ℝ)`, `𝔰𝔬(p, q)` (`LieAlgebra.Orthogonal.so'`), `𝔰𝔭(2n, ℝ)` (`LieAlgebra.Symplectic.sp`,
recovering Tau Ceti's `LieAlgebra.Symplectic.cartanInvolution`), `𝔰𝔲(p, q)`, `𝔰𝔭(p, q)`, and the
complex algebras `𝔰𝔩_n(ℂ)`, `𝔰𝔬_n(ℂ)`, `𝔰𝔭_{2n}(ℂ)` viewed as real. Record the Killing forms
`B = 2n tr(XY)` on `𝔰𝔩_n(ℝ)`, `(p + q − 2) tr(XY)` on `𝔰𝔬(p, q)`, `(2n + 2) tr(XY)` on
`𝔰𝔭(2n, ℝ)` and `2(p + q) tr(XY)` on `𝔰𝔲(p, q)`.

**Checks.**

- `𝔰𝔭(2n, ℝ)`: `−B(X, θX) = (2n + 2) tr(XXᵀ)`, Tau Ceti's
  `LieAlgebra.Symplectic.killingForm_cartanInvolution_apply` with `n` the size of the index type,
  positive for `X ≠ 0`.
- `𝔰𝔬(2, 1)`: `B = tr(XY)`, `𝔨 = 𝔰𝔬(2)`, `𝔭` two-dimensional; the isomorphism
  `𝔰𝔩₂(ℝ) ≅ 𝔰𝔬(2, 1)` intertwines the two Cartan involutions.
- The upper-triangular trace-zero `2 × 2` real matrices are not closed under transpose and not
  semisimple; `−Xᵀ` does not even preserve them.

*Needs:* §0.1, §0.3; Mathlib's classical Lie algebras; Tau Ceti's symplectic Cartan involution.

### Examples

`𝔰𝔩_n(ℝ)`, `𝔰𝔬(n, 1)`, `𝔰𝔲(n, 1)` and `𝔰𝔩_n(ℂ)` with `θ = −X*` are the running examples of
Layers 0–2 and 5.

### Dependencies

Mathlib Lie algebras; LieGroups Layers 2, 4, 7 and 9; Tau Ceti's symplectic Lie algebra
results.

## Layer 1: restricted roots and real rank

### 1.1 Maximal abelian subspaces and the restricted root space decomposition

Define `IsMaximalAbelianInP θ 𝔞` (Mathlib's `Maximal` among the abelian subspaces of `𝔭`),
`restrictedRootSpace 𝔞 λ = 𝔤_λ` and `restrictedRoots 𝔞 = Σ`, the Lie-algebra carriers of LieGroups
Layer 9's restricted roots. Maximal abelian subspaces exist and every `X ∈ 𝔭` lies in one. When `θ`
is the Cartan involution of LieGroups Layer 9's datum and `𝔤₀ = Lie(G)`, prove that the
`restrictedRoots` and `restrictedRootSpace` fields of an `IwasawaData` are these carriers. Through
the adjoint datum of §0.2, transported along `ad : 𝔤₀ ≅ Lie(Int(𝔤₀))`, Layer 9's restricted root
space decomposition then holds for every Cartan involution `θ` of a real semisimple `𝔤₀`:
`𝔤₀ = 𝔤_0 ⊕ ⊕_{λ ∈ Σ} 𝔤_λ` with `Σ` finite; `[𝔤_λ, 𝔤_μ] ⊆ 𝔤_{λ+μ}`; `θ𝔤_λ = 𝔤_{−λ}`, so `Σ = −Σ` and
`m_λ = m_{−λ}`; `B(𝔤_λ, 𝔤_μ) = 0` unless `λ + μ = 0`; `𝔤_0 = 𝔪 ⊕ 𝔞` with `𝔪 = Z_𝔨(𝔞)`; and `𝔞`
equals its centralizer in `𝔭`. A direct route needs no group: `{ad H | H ∈ 𝔞}` is a commuting family
of `B_θ`-symmetric operators. Identify `𝔤_λ` with Mathlib's `LieModule.genWeightSpace` of `𝔞` acting
on `𝔤₀` (generalized and honest weight spaces agree because `ad 𝔞` is diagonalizable), and `Σ` with
the nonzero `LieModule.Weight`s. (Knapp, Ch. VI §4.)

**Checks.**

- `𝔰𝔩_n(ℝ)`, `𝔞` the trace-zero diagonal matrices: `Σ = {e_i − e_j | i ≠ j}`,
  `𝔤_{e_i − e_j} = ℝE_ij`, `𝔪 = 0`.
- `𝔰𝔬(n, 1)`, `n ≥ 2`, `𝔞 = ℝ(E_{n,n+1} + E_{n+1,n})`: `Σ = {±λ}`, `m_λ = n − 1`,
  `𝔪 = 𝔰𝔬(n − 1)`.
- The zero subspace is abelian but not maximal in `𝔭 ≠ 0`; on a compact `𝔤₀`, `𝔞 = 0`, `Σ = ∅`
  and `𝔤_0 = 𝔤₀`.

*Needs:* §0.1; for the route through LieGroups Layer 9, §0.2 and Layer 9; Mathlib weight spaces
and eigenspaces.

### 1.2 The restricted root system

For semisimple `𝔤₀`, package LieGroups Layer 9's possibly nonreduced restricted root system, read on
`(𝔤₀, θ, 𝔞)` through §1.1, as the restricted root pairing (`exists_restrictedRootPairing`): a
`RootPairing` indexed by `Σ` on `(𝔞*, 𝔞)` with the evaluation pairing, roots `λ` and coroots
`H'_λ = 2H_λ / B(H_λ, H_λ)`, where `H_λ ∈ 𝔞` represents `λ` under `B|_𝔞`. Layer 9 states the root
system and its reflections for a group with an `IwasawaData`; the `RootPairing` packaging and the
multiplicities are this roadmap's. Route (Knapp, Ch. VI, Prop. 6.52): for nonzero `E ∈ 𝔤_λ`, the
elements `E`, `θE` and `[E, θE] = B(E, θE)H_λ` span a copy of `𝔰𝔩₂(ℝ)`; its action on `𝔤₀` is
integral (LieHighestWeight Layer 0's `𝔰𝔩₂` strings), which gives crystallographicity, and
`e^{ad((π/2)(E' + θE'))} ∈ K_θ` for suitably normalized `E'` realizes the reflection `s_λ` on `𝔞`
and permutes `Σ`. Prove: the pairing is crystallographic and a root system (roots span `𝔞*`); the
multiples of `λ` in `Σ` are among `±λ/2, ±λ, ±2λ`; `m_λ` is `W(Σ)`-invariant; the indivisible roots
form a reduced root system with the same Weyl group and chambers; `Σ` may be nonreduced (`BC_r`).
Positive systems are the sets `Σ⁺` of Conventions; prove that they correspond bijectively to bases
of the reduced subsystem (Mathlib's `Base`, `nonempty_base`), that `W(Σ)` acts simply transitively
on them (`RootPairing.Base.existsUnique_map_eq` on the reduced subsystem), and that every root is an
integer combination of `Π` with coefficients all `≥ 0` or all `≤ 0`. For reductive `𝔤₀` the
construction applies to `[𝔤₀, 𝔤₀]`, and `𝔞` contains `𝔞_𝔷 = 𝔞 ∩ 𝔷(𝔤₀) = 𝔭 ∩ 𝔷(𝔤₀)`, on which every
restricted root vanishes. (Knapp, Ch. VI §5; Helgason, Ch. VII §2.)

**Checks.**

- `𝔰𝔲(n, 1)`, `n ≥ 2`: `Σ = {±λ, ±2λ}` (type `BC₁`), `m_λ = 2(n − 1)`, `m_{2λ} = 1`; the
  indivisible subsystem is `{±λ}` of type `A₁`.
- `𝔰𝔭(n, 1)`, `n ≥ 2`: `Σ = {±λ, ±2λ}`, `m_λ = 4(n − 1)`, `m_{2λ} = 3`.
- `𝔰𝔩₃(ℝ)`: type `A₂`, all multiplicities `1`; `𝔰𝔩₃(ℂ)` as real: type `A₂`, all multiplicities
  `2`, `𝔪 = i𝔞`.
- `𝔰𝔲(p, q)`, `1 ≤ p < q`: type `BC_p`; `𝔰𝔲(p, p)`: type `C_p`.

*Needs:* §1.1; Mathlib root pairings and bases; LieHighestWeight Layer 0; RootSystems for
chambers and simple transitivity.

### 1.3 Conjugacy of maximal abelian subspaces and the real rank

Prove that for a Cartan involution `θ` of semisimple `𝔤₀`, any two maximal abelian subspaces of `𝔭`
are conjugate under `K_θ ⊆ Int(𝔤₀)`, and `𝔭 = ⋃_{k ∈ K_θ} k(𝔞)`. Route: LieGroups Layer 9's
`Ad(K)𝔞 = 𝔭` for the adjoint datum of §0.2; for maximal abelian `𝔞'` choose `H' ∈ 𝔞'` with
`Z_𝔭(H') = 𝔞'` (an element off the finitely many root hyperplanes), take `k` with `k(H') ∈ 𝔞`; then
`𝔞 ⊆ Z_𝔭(k H') = k𝔞'`, and maximality gives equality (Eschenburg, *Lecture Notes on Symmetric
Spaces*, §9, Theorem 9 and the Lemma after it, pp. 20–21, by a nearest-point argument on an
`Ad(K)`-orbit). Combined with §0.2 this proves that `finrank 𝔞` does not depend on `θ` or `𝔞`.

Define `realRank 𝔤₀`, the **real rank** of a real semisimple Lie algebra, as in `Suggested.lean`:
the common value of `finrank ℝ 𝔞` over Cartan involutions and maximal abelian subspaces of their
`𝔭`, written as a supremum so that the definition makes no choice, with `finrank_eq_realRank` as
the theorem that every choice attains it. A real Lie algebra that is not semisimple has no Cartan
involution (§0.1), so the supremum is empty and `realRank 𝔤₀ = 0`. For reductive `𝔤₀` and a
reductive Cartan involution `θ`, every maximal abelian `𝔞 ⊆ 𝔭_θ` is `(𝔭_θ ∩ 𝔷(𝔤₀)) ⊕ 𝔞'` with `𝔞'`
maximal abelian in `𝔭_θ ∩ [𝔤₀, 𝔤₀]`, so `finrank ℝ 𝔞 = realRank [𝔤₀, 𝔤₀] + dim(𝔭_θ ∩ 𝔷(𝔤₀))`:
the split centre is counted through `θ`, and the second summand depends on `θ` (on the abelian
`ℝ`, `θ = 1` gives `0` and `θ = −1` gives `1`), so a reductive algebra has no real rank of its own.
Prove, for semisimple `𝔤₀`: the real rank is invariant under Lie algebra isomorphism; it is
additive over direct sums and over the simple ideals; it equals the rank of the restricted root
system; `realRank 𝔤₀ = 0` iff `𝔤₀` is compact (`realRank_eq_zero_iff`); and
`realRank 𝔤₀ ≤ rank_ℂ(𝔤₀ ⊗ ℂ)`, the dimension of a Cartan subalgebra of the complexification.

**Checks.**

- `rank_ℝ 𝔰𝔩_n(ℝ) = n − 1`, `rank_ℝ 𝔰𝔩_n(ℂ) = n − 1` (as a real Lie algebra),
  `rank_ℝ 𝔰𝔭(2n, ℝ) = n`, `rank_ℝ 𝔰𝔬(p, q) = rank_ℝ 𝔰𝔲(p, q) = min(p, q)`, `rank_ℝ 𝔰𝔭(n, 1) = 1`;
  compact algebras have real rank `0`.
- `𝔰𝔩₂(ℝ) × 𝔰𝔩₂(ℝ)` has real rank `2` and no simple ideal of real rank `2`.
- `𝔤𝔩_n(ℝ)`, `n ≥ 1`: `realRank 𝔤𝔩_n(ℝ) = 0`, since `ad 1 = 0` makes the centre `ℝ·1`
  `B`-isotropic and no Cartan involution exists; for the reductive Cartan involution `θ = −Xᵀ` the
  diagonal `𝔞` has `finrank ℝ 𝔞 = n = (n − 1) + 1`, the real rank of `𝔰𝔩_n(ℝ)` plus
  `dim(𝔭 ∩ 𝔷) = 1`. A definition through all reductive Cartan involutions would give `𝔲(n)`, the
  Lie algebra of the compact `U(n)`, the value `1`.
- Non-example: in `𝔰𝔩₂(ℂ)` viewed as real, a Cartan subalgebra (the complex diagonal) is a
  maximal abelian subalgebra of real dimension `2`, while the real rank is `1`; in `𝔰𝔩₂(ℝ)` the
  maximal abelian subalgebra `𝔰𝔬(2) = 𝔨` meets `𝔭` only in `0`. Real rank counts abelian
  subspaces of `𝔭`, not abelian subalgebras of `𝔤₀`.

*Needs:* §0.2, §1.1, §1.2; LieGroups Layer 9 (`Ad(K)𝔞 = 𝔭`).

### 1.4 Split real forms and the complex comparison

For semisimple `𝔤₀`, prove that `realRank 𝔤₀ = rank_ℂ(𝔤₀ ⊗ ℂ)` iff `𝔪 = 0` iff `𝔞` is a Cartan
subalgebra of `𝔤₀` (Mathlib's `LieSubalgebra.IsCartanSubalgebra`); call such `𝔤₀` **split**. Prove
that `𝔞 ⊕ 𝔱`, for `𝔱` a maximal abelian subalgebra of `𝔪`, is a `θ`-stable Cartan subalgebra of `𝔤₀`
(a maximally split one), and that restriction from its complexified roots to `𝔞` maps the nonzero
restrictions onto `Σ`, with `m_λ` the number of roots restricting to `λ` (Knapp, Ch. VI §§5–6).
Prove `𝔰𝔩_n(ℝ)`, `𝔰𝔬(n, n)`, `𝔰𝔬(n, n + 1)` and `𝔰𝔭(2n, ℝ)` split.

**Checks.**

- `𝔰𝔩₂(ℝ)` is split; `𝔰𝔲(2)` is not (rank `0 < 1`); `𝔰𝔩₂(ℂ)` as real has `𝔪 = i𝔞 ≠ 0`, real
  rank `1` and complexification `𝔰𝔩₂(ℂ) × 𝔰𝔩₂(ℂ)` of rank `2`.
- `𝔰𝔲(2, 1)`: `𝔞 ⊕ 𝔱` with `dim 𝔞 = dim 𝔱 = 1`; the six roots of `𝔰𝔩₃(ℂ)` restrict to `±λ`
  (two roots each) and `±2λ` (one each), matching `m_λ = 2`, `m_{2λ} = 1`.
- `𝔰𝔬(2, 3)` is split (`𝔪 = 𝔰𝔬(1) = 0`, real rank `2 = rank 𝔰𝔬₅(ℂ)`) and `𝔰𝔬(2, 4)` is not
  (`𝔪 ≅ 𝔰𝔬(2)`, real rank `2 < 3 = rank 𝔰𝔬₆(ℂ)`); a test of `𝔨 = 0` in place of `𝔪 = Z_𝔨(𝔞) = 0`
  would call neither split.

*Needs:* §1.1–§1.3; Mathlib Cartan subalgebras.

### Examples

The tables of `Σ`, `m_λ` and real rank for `𝔰𝔩_n(ℝ)`, `𝔰𝔩_n(ℂ)`, `𝔰𝔬(p, q)`, `𝔰𝔲(p, q)`,
`𝔰𝔭(2n, ℝ)` and `𝔰𝔭(p, q)` (Knapp, Appendix C; Helgason, Ch. X, Table VI) are acceptance
criteria for §§1.1–1.4 in the cases `p + q ≤ 4` and `n ≤ 3`.

### Dependencies

Layer 0; Mathlib weights, root pairings and Cartan subalgebras; RootSystems; LieHighestWeight
Layer 0; LieGroups Layer 9 (the restricted root system and, for §1.3, `Ad(K)𝔞 = 𝔭`).

## Layer 2: real rank, restricted Weyl group, hyperbolic elements and real forms

### 2.1 Real rank, factors and higher rank

For a Lie group `G` with semisimple Lie algebra define
`groupRealRank I G = realRank (LeftInvariantDerivation I G)`. Prove it is unchanged by passing to
open subgroups, coverings and quotients by discrete central subgroups. For connected `G` with
semisimple Lie algebra, define the **almost-simple factors** as the connected Lie subgroups `G_i`
with Lie algebras the simple ideals `𝔤_i` (LieGroups Layer 4; the splitting of `𝔤₀` into simple
ideals is Eschenburg, *Lecture Notes on Symmetric Spaces*, §7, Lemma, pp. 17–18), and prove: each
`G_i` is closed and normal (it is the identity component of the centralizer of the sum of the other
ideals); the `G_i` commute pairwise and their product is `G`; with finite centre the multiplication
map `∏ G_i → G` has finite central kernel. Call `G_i` compact if `𝔤_i` is compact. Prove
`groupRealRank I G = Σ_i realRank 𝔤_i` (§1.3's additivity over simple ideals), that a factor has
real rank `0` iff it is compact, and that a connected `G` with semisimple Lie algebra has real rank
`0` iff it is compact, for any centre (`groupRealRank_eq_zero_iff_compactSpace`; LieGroups Layer 7's
compact simply connected integration for one direction, LieGroups Layer 5A's negative definite
Killing form on the Lie algebra of a compact connected semisimple group for the other). Define `G`
to have **higher rank** if `groupRealRank I G ≥ 2`, and to have **no compact factors** if no `G_i`
is compact.

**Checks.**

- `SL₂(ℝ) × SL₂(ℝ)` has real rank `2`, two almost-simple factors of rank `1`.
- `SL₂(ℝ) × SU(2)` has real rank `1` and one compact factor; `SU(2)` has real rank `0`.
- The universal cover of `SL₂(ℝ)` has infinite centre and real rank `1`; `PSL₂(ℝ)` and
  `SO₀(2, 1)` have real rank `1`.
- `SL₃(ℝ)`, `Sp(4, ℝ)` and `SO(2, 3)` have real rank `2`; `SU(n, 1)` and `Sp(n, 1)` have real
  rank `1`.

*Needs:* Layer 1; LieGroups Layers 2, 4, 5A and 7.

### 2.2 The global Cartan involution of a semisimple group

For connected `G` with semisimple Lie algebra and finite centre, prove that LieGroups Layer 9's
datum exists, integrating any given Cartan involution `θ` of `𝔤₀` (`dΘ = θ`; from §0.1's existence
and Layer 9's adjoint model), that `K = G^Θ` is connected
and contains `Z(G)`, and that `K` is the connected Lie subgroup with Lie algebra `𝔨`. For any
centre, prove that `Ad : G → Int(𝔤₀)` is surjective with kernel `Z(G)`, and that the connected
Lie subgroup `K` with Lie algebra `𝔨` is closed, contains `Z(G)`, and is the preimage of
`K_θ ⊆ Int(𝔤₀)`; it is compact iff `Z(G)` is finite. (Knapp, Ch. VI, Thm. 6.31.)

**Checks.**

- `SL₂(ℝ)`: `K = SO(2) ∋ −1`. The universal cover of `SL₂(ℝ)`: `K ≅ ℝ`, noncompact, containing
  the centre `ℤ`.
- `SO(2, 1)` (two components): `K = S(O(2) × O(1)) ≅ O(2)`, not connected; the connectedness
  claim needs `G` connected.

*Needs:* §0.1, §0.2, §2.1; LieGroups Layers 4, 5 and 9.

### 2.3 The restricted Weyl group

For `G` with an `IwasawaData`, LieGroups Layer 9 supplies `W_G = N_K(𝔞)/Z_K(𝔞)`, its faithful action
on `𝔞`, representatives of the reflections `s_λ`, so that `W(Σ) ⊆ W_G` as groups of linear maps of
`𝔞`, and the carrying of every element of `𝔞` into `𝔞̄⁺` by `N_K(𝔞)`. Prove that `W_G = W(Σ)` when
`M` meets every connected component of `G`, in particular for connected `G`; then `W_G` is a Coxeter
group generated by the simple reflections, acts simply transitively on positive systems, and every
`W_G`-orbit in `𝔞` meets `𝔞̄⁺` exactly once, by
`TauCeti.existsUnique_mem_orbit_inter_dominantChamber` for the reduced subsystem (Knapp, Ch. VI,
Thm. 6.57, and Ch. VII §2). Prove that two elements of `𝔞` conjugate under `G` are conjugate under
`W_G` (by the Iwasawa decomposition `g = kan`: `Ad(an)H − H ∈ 𝔫` and `𝔭 ∩ 𝔫 = 0` give
`Ad(k)H = H'`, Kostant, *On convexity, the Weyl group and the Iwasawa decomposition*, Proposition
2.4, p. 422; then `k·exp(H)·k⁻¹ = exp(H')` and the uniqueness of the middle factor of
`kakDecomposition` modulo `W_G`). Prove that `M`
meets every component of `G = 𝐆(ℝ)` for `𝐆` connected reductive over `ℝ`, from `𝐆(ℝ) = 𝐆(ℝ)°·𝐒(ℝ)`
for the maximal split torus `𝐒` of AutomorphicFormsOnReductiveGroups §2.3a and `𝐒(ℝ) ∩ K ⊆ M`
(Borel–Tits, *Groupes réductifs*, §14).

**Checks.**

- `GL_n(ℝ)`: `W_G ≅ S_n`, Tau Ceti's `unitaryNormalizerPosDiagonalQuotientMulEquivPerm`, and
  `M = {diag(±1)}` meets both components.
- `SL₂(ℝ)`: `W_G` has order `2`, generated by the class of `[[0, −1], [1, 0]]`.
- Negative control: `G = O(1, 1)`, `𝔞 = 𝔭 = ℝ[[0, 1], [1, 0]]`, `Σ = ∅`, `W(Σ) = 1`, but
  `diag(1, −1) ∈ K` acts on `𝔞` by `−1`, so `W_G` has order `2`; here `M = {±1}` misses two of
  the four components.

*Needs:* §1.2, §2.2; LieGroups Layer 9; Tau Ceti's root-system chambers;
AutomorphicFormsOnReductiveGroups §2.3a for `𝐒`.

### 2.4 Hyperbolic elements, `ℝ`-split subgroups and split tori

For semisimple `𝔤₀`, call `X ∈ 𝔤₀` **hyperbolic** if `ad X` is diagonalizable over `ℝ`, and an
abelian subalgebra **`ℝ`-split** if it consists of hyperbolic elements. Prove that every hyperbolic
`X` is `Int(𝔤₀)`-conjugate to a unique element of the closed chamber `𝔞̄⁺`, and that every `ℝ`-split
abelian subalgebra is `Int(𝔤₀)`-conjugate into `𝔞`; hence the maximal `ℝ`-split abelian subalgebras
are exactly the `Int(𝔤₀)`-conjugates of `𝔞`, and `realRank` is the maximal dimension of an `ℝ`-split
abelian subalgebra. For the Lie algebra of a connected Lie group `G`, where `Ad(G) = Int(𝔤₀)`
(§2.2), the first statement is `existsUnique_ad_mem_closedChamber`. Route: `ad X` semisimple puts
`X` in a Cartan subalgebra (take a Cartan subalgebra of its reductive centralizer); every Cartan
subalgebra is `Int(𝔤₀)`-conjugate to a `θ`-stable one `𝔱' ⊕ 𝔞'` with `𝔱' ⊆ 𝔨`, `𝔞' ⊆ 𝔭`
(Knapp, Ch. VI, Prop. 6.59); real eigenvalues force `X ∈ 𝔞'`; then §1.3 and §2.3 for `G = Int(𝔤₀)`
conclude, and uniqueness is §2.3's `W_G`-conjugacy. For an `ℝ`-split abelian subalgebra apply this
to an element of it that is regular among its elements, whose centralizer contains the whole
subalgebra (Kostant, *On convexity, the Weyl group and the Iwasawa decomposition*, §2, Proposition
2.4, p. 422, for elements).

For `G` with semisimple Lie algebra, call `g ∈ G` hyperbolic if `g = lieExp X` with `X`
hyperbolic, and a connected abelian Lie subgroup `ℝ`-split if its Lie algebra is `ℝ`-split. For
such `G` with an `IwasawaData`, prove: every `ℝ`-split connected abelian subgroup is `G`-conjugate
into `A`; `A` is a maximal one; and `groupRealRank I G` is the maximal dimension of an `ℝ`-split
connected abelian subgroup. For `G = 𝐆(ℝ)` or `𝐆(ℝ)°` with `𝐆` connected reductive over `ℝ`, with
the transpose-stable realization, the `𝔞` and the maximal `ℝ`-split torus `𝐒`, `A = 𝐒(ℝ)°`, of
AutomorphicFormsOnReductiveGroups §2.3a, prove that every `ℝ`-split torus `𝐓` of `𝐆` has a
`G°`-conjugate contained in `𝐒`. Hence the maximal `ℝ`-split tori of `𝐆` are exactly the
`G°`-conjugates of `𝐒` (the conjugacy of maximal `ℝ`-split tori, Borel–Tits, *Groupes réductifs*,
Thm. 4.21; Borel, *Linear Algebraic Groups*, 2nd ed., Thm. 20.9(ii)), they all have dimension
`finrank ℝ 𝔞` (the Borel–Tits `ℝ`-rank), and this is `groupRealRank` of every open subgroup of
`𝐆(ℝ)` when `𝐆` is semisimple. Route: the real Lie algebra
`𝔱` of `𝐓(ℝ)°` consists of commuting matrices diagonalizable over `ℝ` (ReductiveGroups Layer 4), so
its projection to `[𝔤₀, 𝔤₀]` is an `ℝ`-split abelian subalgebra and is conjugate into `𝔞` by an
element of the connected Lie subgroup with Lie algebra `[𝔤₀, 𝔤₀]` (the first paragraph). After
this conjugation each `X ∈ 𝔱` is `X_𝔷 + X'` with `X'` symmetric, commuting with `X`, so the central
part `X_𝔷` is diagonalizable over `ℝ`; its component in `𝔨 ∩ 𝔷(𝔤₀)` is skew-symmetric with real
eigenvalues, hence zero, and `X_𝔷 ∈ 𝔭 ∩ 𝔷(𝔤₀) ⊆ 𝔞`. So the conjugate of `𝐓(ℝ)°` lies in `A`, and
the conjugate of `𝐓`, the Zariski closure of its identity component of real points, lies in `𝐒`,
the Zariski closure of `A`. For the reductive count, prove that the maximal central `ℝ`-split
torus `𝐙_s` of `𝐆` (inside ReductiveGroups Layer 6's central torus `Z(𝐆)°`) has `𝐙_s(ℝ)° =
lieExp(𝔭 ∩ 𝔷(𝔤₀))`, by the same argument for central `X`, and that the real Lie algebra of
`𝐆_der(ℝ)` is `[𝔤₀, 𝔤₀]`; with §1.3's count this gives the Borel–Tits form
`finrank ℝ 𝔞 = groupRealRank (𝐆_der(ℝ)) + dim 𝐙_s`.

**Checks.**

- In `𝔰𝔩₂(ℝ)`, `E₁₂` is nilpotent, not hyperbolic; `[[0, 1], [1, 0]]` is hyperbolic and
  conjugate to `diag(1, −1) ∈ 𝔞̄⁺`; `[[0, 1], [−1, 0]]` is elliptic (eigenvalues `±2i` of `ad`).
- In `𝔰𝔩₃(ℝ)`, `diag(1, 0, −1)` and `diag(−1, 0, 1)` are conjugate; the chamber representative
  is `diag(1, 0, −1)`.
- `GL_n(ℝ)`: the diagonal torus is split of dimension `n = finrank ℝ 𝔞` for the diagonal `𝔞`,
  the Borel–Tits `ℝ`-rank, while `groupRealRank` of `GL_n(ℝ)` is `0` because `𝔤𝔩_n(ℝ)` is not
  semisimple; for `SL_n(ℝ)` both are `n − 1`.
- `SO(2)` inside `SL₂(ℝ)` is abelian but not `ℝ`-split; `SO(1, 1)°` is `ℝ`-split.
- `𝐆 = GL₂`: the diagonal torus and its conjugate by the rotation through `π/4` are both maximal
  `ℝ`-split tori, of dimension `2`; the circle `SO(2)` is a torus of `𝐆` that is not `ℝ`-split
  (its real points are compact), so the conjugacy statement concerns split tori only, and
  `𝐙_s` is the scalar torus with `𝐙_s(ℝ)° = ℝ_{>0}·1 = lieExp(𝔭 ∩ 𝔷)`.

*Needs:* §1.2, §1.3, §2.2, §2.3; LieGroups Layer 9; AutomorphicFormsOnReductiveGroups §2.3a;
ReductiveGroups Layers 4 and 6; ArithmeticLocallySymmetricSpaces ALS.F.1.

### 2.5 Real forms of complex reductive groups

Let `H` be a connected complex reductive Lie group, identified with `𝐇(ℂ)` for a connected
reductive `ℂ`-group by LieGroups Layer 7's lower analytic dictionary, and `τ` an antiholomorphic
involutive automorphism of `H` (a **real form**), with fixed group `H^τ` (LieGroups Layer 7's full
fixed subgroup). Call a holomorphic involutive automorphism `σ` of `H` a **Cartan involution for
`τ`** if `στ = τσ` and `H^{στ}` is compact. Prove:

- `𝔥 = 𝔥^τ ⊕ i𝔥^τ` with `𝔥^τ = Lie(H^τ)`, and `𝔥^τ` is a real reductive Lie algebra; `H^τ` is a
  closed real Lie subgroup of `H` with finitely many components.
- `τ` is the complex conjugation of a real form `𝐇₀` of `𝐇`: a connected reductive `ℝ`-group with
  `𝐇₀ ⊗_ℝ ℂ = 𝐇` and `𝐇₀(ℝ) = H^τ`. Route: every holomorphic automorphism `φ` of `H` is regular,
  because `φ(U)` is a compact real form, hence `hUh⁻¹` for some `h ∈ H` (LieGroups Layer 7's
  compact real form `U` and the conjugacy of compact real forms), and `c_h⁻¹ ∘ φ` is the holomorphic
  extension of a continuous automorphism of `U`, which is regular by Layer 7's compact-real-form
  pairs and algebraic morphisms. The conjugation `κ` fixing `U` is antiregular (it is `g ↦ (g*)⁻¹`
  for a `U`-invariant Hermitian form in Layer 7's faithful representation), so `τ = (τκ)κ` is
  antiregular, and the regular functions `f` with `f = conj ∘ f ∘ τ` form an `ℝ`-structure on
  `ℂ[𝐇]` (a conjugate-linear involution of a complex vector space `V` gives `V = V^τ ⊕ iV^τ`),
  the coordinate ring of `𝐇₀`.
- The Cartan involutions for `τ` are the complexifications of the Cartan involutions `θ` of `𝐇₀`
  in the sense of ArithmeticLocallySymmetricSpaces ALS.0.1: `σ` is regular by the previous item and
  commutes with `τ`, so it descends to an involution `θ` of `𝐇₀`, whose twisted real form
  `{g ∈ H | g = θ(ḡ)}` is `H^{στ}`. So a Cartan involution for `τ` exists and any two are
  conjugate by an element of `H^τ = 𝐇₀(ℝ)` (ALS.0.1). Prove that they are conjugate by an element
  of `(H^τ)°`: write the conjugating element as `k·lieExp X` with `k ∈ K`, `X ∈ 𝔭` (the polar
  decomposition of the next item); since `σ(k) = k`, conjugation by `lieExp(Ad(k)X)` has the same
  effect on `σ`.
- `dσ|_{𝔥^τ}` is a reductive Cartan involution of `𝔥^τ` (§0.1), and `H^τ` with `Θ = σ|_{H^τ}` is a
  LieGroups Layer 9 `CartanInvolution` datum with `K = H^τ ∩ H^σ`. Route: the transpose-stable
  realization of `𝐇₀` of ArithmeticLocallySymmetricSpaces ALS.F.1, in which `g ↦ (gᵀ)⁻¹` is a
  Cartan involution (ALS.0.1), conjugated by the element of `𝐇₀(ℝ)` that ALS.0.1's conjugacy gives
  between that involution and `σ`, makes `H^τ` a closed transpose-stable subgroup of `GL_N(ℝ)` with
  finitely many components (ALS.F.1) on which `σ` restricts to `g ↦ (gᵀ)⁻¹`. This is LieGroups
  Layer 9's global matrix model with `π = id`.
- Consequently `K = H^τ ∩ H^σ` is a maximal compact subgroup of `H^τ` meeting every component
  (LieGroups Layer 9), `K × 𝔭 → H^τ` is a diffeomorphism, and `M` meets every component of `H^τ`
  (§2.3, since `H^τ` is the group of real points of a connected reductive `ℝ`-group), so Layers 3–5
  apply to `H^τ`.
- A connected complex reductive group `H` viewed as a real Lie group is the fixed group of the
  antiholomorphic swap `(x, y) ↦ (y, x)` on `H × H̄` (`H̄` the conjugate complex group), and a
  compact connected Lie group `U` is the fixed group of `κ` on its complexification, with `σ = 1`;
  so this section covers both.

**Checks.**

- `H = SL_n(ℂ)`, `τ(g) = ḡ`: `H^τ = SL_n(ℝ)`, `σ(g) = (gᵀ)⁻¹`, `H^{στ} = SU(n)` and
  `K = SO(n)`. With `τ(g) = (g*)⁻¹`: `H^τ = SU(n)`, `σ = 1`.
- `H = ℂˣ`, `τ(z) = z̄`: `H^τ = ℝˣ` has two components, `σ(z) = z⁻¹`, `K = {±1}` meets both.
- `H = SO_{p+q}(ℂ)` for the form `I_{p,q}`, `τ(g) = ḡ`: `H^τ = SO(p, q)`, which for `p, q ≥ 1`
  has two components, and `K = S(O(p) × O(q))`.
- Non-example: on `SL₂(ℂ)` with `τ(g) = ḡ`, `σ = 1` is a holomorphic involution commuting with `τ`,
  but `H^{στ} = SL₂(ℝ)` is not compact, so `1` is not a Cartan involution for `τ`.

*Needs:* §0.1, §2.3; LieGroups Layers 7 and 9; CompactGroups (an invariant Hermitian form);
ArithmeticLocallySymmetricSpaces ALS.0.1 and ALS.F.1.

### Examples

`SL_n(ℝ)`, `SO₀(n, 1)`, `SU(n, 1)`, `Sp(2n, ℝ)` and `SL_n(ℂ)` with their `K`, `𝔞`, `M` and `W_G`
are worked in full.

### Dependencies

Layers 0–1; LieGroups Layers 2, 4, 5, 5A, 7 and 9; AutomorphicFormsOnReductiveGroups §2.3a;
ReductiveGroups Layers 4 and 6; ArithmeticLocallySymmetricSpaces ALS.0.1 and ALS.F.1;
CompactGroups.

## Layer 3: minimal parabolic subgroups and the Bruhat decomposition

### 3.1 Minimal parabolic subgroups

AutomorphicFormsOnReductiveGroups §2.3a owns `M = Z_K(𝔞)`, `A`, `N`, the minimal parabolic subgroup
`P = MAN` and its Langlands decomposition for its supplied class of real reductive groups; this
roadmap consumes it. This section owns the same statements for every connected `G` with semisimple
Lie algebra and finite centre, linear or not: `M` is compact with Lie algebra `𝔪`; `lieExp : 𝔞 → A`
and `lieExp : 𝔫 → N` are diffeomorphisms; `MA = Z_G(𝔞)`; `M` and `A` normalize `N`; `P` is closed
with Lie algebra `𝔪 ⊕ 𝔞 ⊕ 𝔫`; `M × A × N → P` is a diffeomorphism; `P = N_G(𝔫) = N_G(P)`;
`P ∩ Θ(P) = MA`; `G = KP`; any two triples `(θ, 𝔞, Σ⁺)` are conjugate under `G`, so the minimal
parabolic subgroups form one conjugacy class (Knapp, Ch. VII §7). Route: AF §2.3a applies to
`𝐆_ad(ℝ)`, the real points of the adjoint group `𝐆_ad` of `𝔤₀` (the identity component of the real
algebraic group of automorphisms of `𝔤₀`, connected reductive over `ℝ`), which is in its class with
the transpose-stable realization on `(𝔤₀, B_θ)`. Its objects restrict to the open subgroup
`Int(𝔤₀) = 𝐆_ad(ℝ)°` by intersection (`A` and `N` are connected, and `𝐆_ad(ℝ) = K·Int(𝔤₀)` by the
Cartan decomposition), and the statements survive the restriction, except the conjugacy of triples,
which inside `Int(𝔤₀)` comes from §0.2, §1.3 and the simple transitivity of `W(Σ)` on positive
systems, with LieGroups Layer 9's reflection representatives. `Ad : G → Int(𝔤₀)` is a finite central
covering (§2.2); every object for `G` is the `Ad`-preimage (`M`, `P`, `MA`) or the unique lift
through the simply connected `A`, `N` of the corresponding object for `Int(𝔤₀)`, and the statements
transfer because `Z(G) ⊆ M`.

Package the result as a **minimal parabolic datum**: an `IwasawaData` with `N = N₊` together
with `M`, `P`, `Σ⁺` and the conclusions above. Layers 3–4 take such a datum, together with the
hypothesis that `M` meets every component of `G`, as input; it is supplied by AF §2.3a for real
points of connected reductive `ℝ`-groups and by this section for connected semisimple groups with
finite centre.

**Checks.**

- `SL₂(ℝ)`: `M = {±1}`, `A` positive diagonal, `N` upper unitriangular, `P` upper triangular.
- The double cover `G̃` of `SL₂(ℝ)`: `M̃` is cyclic of order `4`, the preimage of `{±1}`, and
  `P̃ = Ad⁻¹(P)` has four components.
- `SO₀(n, 1)`: `M = SO(n − 1)`, `N ≅ ℝ^{n−1}`, `G/P ≅ S^{n−1}`.

*Needs:* §0.2, §1.2, §1.3, §2.2; AutomorphicFormsOnReductiveGroups §2.3a; LieGroups Layers 5 and
9.

### 3.2 The normalizer of `𝔞` and rank-one subgroups

Prove `N_G(𝔞) = N_K(𝔞)·A`, `N_G(𝔞) ∩ P = MA`, and that `MA` is normal in `N_G(𝔞)` with
`N_G(𝔞)/MA ≅ W_G` (for the real points of a semisimple `ℝ`-group: Borel–Tits, *Groupes
réductifs*, 14.7, pp. 147–148). For an indivisible `α ∈ Σ` let `𝔤^{(α)}` be the subalgebra
generated by `𝔤_{±α}` and `𝔤_{±2α}`, a `θ`-stable semisimple subalgebra of real rank one, and
`G^{(α)}` its connected Lie subgroup. Prove the rank-one Bruhat decomposition
`G^{(α)} = P^{(α)} ⊔ P^{(α)} s_α P^{(α)}` with `P^{(α)} = G^{(α)} ∩ MAN`, using that the
`N^{(α)}`-orbit of the base point of `G^{(α)}/P^{(α)} ≅ K^{(α)}/M^{(α)}` (a sphere) is the
complement of one point. Prove the open big cell: `N⁻ × M × A × N → G`,
`(n̄, m, a, n) ↦ n̄man`, is a diffeomorphism onto an open subset, `N⁻ = Θ(N)` (for real points:
Borel–Tits, 4.10(d), pp. 88–89, and the proof of 14.2, p. 146); its density is proved in §3.3
from the Bruhat decomposition.

**Checks.**

- `SL₂(ℝ)`: `G = P ⊔ PwP`, `w = [[0, −1], [1, 0]]`; `N⁻P` is the set of matrices with nonzero
  `(1, 1)` entry.
- `SL₃(ℝ)`: for `α = e₁ − e₂`, `G^{(α)}` is the upper-left `SL₂(ℝ)`.
- `SO₀(n, 1)`, `n ≥ 2`: in real rank one the subalgebra generated by the restricted root spaces is
  an ideal, so `𝔤^{(α)} = 𝔰𝔬(n, 1)` and `G^{(α)} = G`; the rank-one decomposition is the two-cell
  Bruhat decomposition of `S^{n−1}`, and `N_G(𝔞)/MA` has order `2`.

*Needs:* §2.3, §3.1; LieGroups Layer 9.

### 3.3 The Tits system and the Bruhat decomposition

Given a minimal parabolic datum with `M` meeting every component, construct the Tau Ceti
`TitsSystem` on `G` with `B = P`, `N = N_G(𝔞)`, Weyl group `N_G(𝔞)/MA ≅ W_G = W(Σ)`, and simple
reflections `s_α`, `α ∈ Π`. Verify the axioms: `P` and `N_G(𝔞)` generate `G` (the big cell contains
a neighbourhood of `1`, `N⁻ = w₀Nw₀⁻¹` for a representative `w₀` of the longest element, and
`G = M·G⁰`); `MA` is normal in `N_G(𝔞)`; the simple reflections are involutions generating `W(Σ)`;
`s_α P w ⊆ PwP ∪ Ps_αwP` (from §3.2's rank-one decomposition and `N = N_{α}·(N ∩ s_α N s_α)`, where
`N_α` is the root subgroup of `α` and `2α`); and `s_α P s_α ≠ P`. Consume
`TauCeti.TitsSystem.existsUnique_mem_bruhatCell` for the Bruhat decomposition `G = ⊔_{w ∈ W} PwP`.
For connected `G` with semisimple Lie algebra and finite centre, with `θ`, `𝔞` and a regular
`H₀ ∈ 𝔞` taken from Layers 0–1 for `Lie(G)` (§2.2 integrates `θ`, and §3.1 identifies `P` with
`N_G(𝔫)`), this is `exists_titsSystem`: the normalizers in `G` of
`𝔫 = positiveRestrictedRootSpace 𝔞 H₀` and of `𝔞` are the `B` and `N` of a Tits system. Prove that
`PwP` is a submanifold and that `N w P / P ≅ N ∩ wN⁻w⁻¹` has dimension `Σ m_λ` over the positive `λ`
with `w⁻¹λ < 0`; the cell of the longest element `w₀` is open and dense in `G/P`. (Knapp, Ch. VII
§7, Thm. 7.40; Warner, *Harmonic Analysis on Semi-Simple Lie Groups I*, §1.2; Bourbaki, *Lie*, Ch.
IV §2.)

The **Furstenberg boundary** `G/P ≅ K/M` is a compact smooth manifold (SmoothBundlesConnections
B1.4), independent of choices up to `G`-equivariant diffeomorphism, with `dim G/P = Σ_{λ ∈ Σ⁺} m_λ`.

**Checks.**

- `SL₃(ℝ)`: six Bruhat cells, of dimensions `0, 1, 1, 2, 2, 3` in the flag manifold of
  dimension `3`.
- `SO₀(n, 1)`: two cells, a point and `ℝ^{n−1}`, in `S^{n−1}`.
- Negative control: in `O(1, 1)` the group `N_G(𝔞)/MA` has order `2` while `Σ = ∅` gives no
  simple reflections, so the axiom that the simple reflections generate the Weyl group fails; the
  hypothesis that `M` meets every component is needed.

*Needs:* §3.1, §3.2; Tau Ceti Tits systems; RootSystems (longest element, simple transitivity);
SmoothBundlesConnections B1.4.

### Examples

The Bruhat decomposition of `GL_n(ℝ)` and `SL_n(ℝ)` is Gaussian elimination with permutation
matrices; that of `Sp(4, ℝ)` has eight cells.

### Dependencies

Layer 2; AutomorphicFormsOnReductiveGroups §2.3a; LieGroups Layer 9; Tau Ceti Tits systems;
SmoothBundlesConnections B1.4.

## Layer 4: parabolic subgroups and Langlands decompositions

### 4.1 Standard parabolic subalgebras

For a minimal parabolic datum and `Π' ⊆ Π` define `𝔮_{Π'}` as in Conventions, and
`𝔞_{Π'} = {H ∈ 𝔞 | α(H) = 0 for α ∈ Π'}`, `𝔫_{Π'} = ⊕_{λ ∈ Σ⁺ ∖ Σ_{Π'}} 𝔤_λ`,
`𝔩_{Π'} = Z_{𝔤₀}(𝔞_{Π'})`. Prove: `𝔮_{Π'}` is a subalgebra; `Π' ↦ 𝔮_{Π'}` is an
inclusion-preserving bijection from subsets of `Π` to subalgebras containing `𝔮_∅`;
`𝔮_{Π'} = 𝔩_{Π'} ⊕ 𝔫_{Π'}` with `𝔫_{Π'}` an ideal, the nilradical of `𝔮_{Π'} ∩ [𝔤₀, 𝔤₀]`;
`𝔩_{Π'} = 𝔮_{Π'} ∩ θ𝔮_{Π'}`
is reductive and `θ`-stable with `𝔩_{Π'} = 𝔪_{Π'} ⊕ 𝔞_{Π'}`, where
`𝔪_{Π'} = 𝔪 ⊕ span{H'_α | α ∈ Π'} ⊕ ⊕_{λ ∈ Σ_{Π'}} 𝔤_λ`. Prove the dynamical description:
for `X ∈ 𝔞̄⁺` with `{α ∈ Π | α(X) = 0} = Π'`, `𝔮_{Π'}` is `nonnegEigenSubmodule X`, the sum of the
eigenspaces of `ad X` with nonnegative eigenvalue. (Knapp, Ch. VII §7.)

**Checks.**

- `𝔰𝔩₃(ℝ)`, `Π = {α₁, α₂}`: `𝔮_∅` upper triangular; `𝔮_{α₁}` has zero `(3, 1)` and `(3, 2)`
  entries (block type `(2, 1)`); `𝔮_{α₂}` block type `(1, 2)`; `𝔮_Π = 𝔰𝔩₃(ℝ)`.
- `X = diag(1, 0, −1)` gives `𝔮_∅`; `X = diag(1, 1, −2)/3` gives `𝔮_{α₁}`; `X = 0` gives `𝔤₀`.
- `𝔰𝔩₂(ℝ)`, `Π = {α}`: `𝔮_∅` is the upper triangular trace-zero matrices, `𝔫_∅ = ℝE₁₂` and
  `𝔩_∅ = 𝔞` (here `𝔪 = 0`); `𝔮_Π = 𝔤₀` with `𝔞_Π = 0`, `𝔩_Π = 𝔤₀` and `𝔫_Π = 0`.

*Needs:* §1.2; §3.1.

### 4.2 Standard parabolic subgroups

Define `Q_{Π'}` as the Tau Ceti `standardParabolic` of §3.3's Tits system for the simple
reflections in `Π'`. Prove: `Π' ↦ Q_{Π'}` is an inclusion-preserving bijection onto the
subgroups of `G` containing `P` (`TauCeti.TitsSystem.standardParabolicOrderIso`), with
`Q_∅ = P` and `Q_Π = G`; `Q_{Π'} = ⊔_{w ∈ W_{Π'}} PwP` with `W_{Π'}` the Coxeter parabolic
subgroup; every subgroup containing `P` is closed; `Q_{Π'} = N_G(𝔮_{Π'})`; its Lie algebra is
`𝔮_{Π'}`; `N_G(Q_{Π'}) = Q_{Π'}` (`TauCeti.TitsSystem.normalizer_standardParabolic`); and the
double cosets `Q_{Π'} \ G / Q_{Π''}` are indexed by `W_{Π'} \ W / W_{Π''}`
(`TauCeti.TitsSystem.parabolicDoubleCosetEquiv`). (Bourbaki, *Lie*, Ch. IV §2, nos. 5–6, for the
subgroups containing `B` in a Tits system; Knapp, Ch. VII §7, for closedness, `N_G(𝔮_{Π'})` and the
Lie algebra.)

**Checks.**

- `SL₃(ℝ)` has exactly four subgroups containing the upper triangular group.
- `SL₂(ℝ)`: `P` and `G`, nothing between.
- `SL₃(ℝ)`: `Q_{α₁} \ G / Q_{α₁}` has two elements (two planes of `ℝ³` are equal or meet in a
  line), as `W_{α₁} \ S₃ / W_{α₁}` does for `W_{α₁} = ⟨s₁⟩`; an indexing by the one-sided cosets
  `W_{α₁} \ S₃` would give three.

*Needs:* §3.3, §4.1; Tau Ceti Tits-system parabolics; Tau Ceti Coxeter parabolics.

### 4.3 Levi subgroups and the Langlands decomposition

For `Q = Q_{Π'}` define `A_{Π'} = lieExp 𝔞_{Π'}`, `N_{Π'} = lieExp 𝔫_{Π'}`, the Levi subgroup
`L_{Π'} = Z_G(𝔞_{Π'})`, and `M_{Π'} = ⋂_χ ker |χ|` over continuous homomorphisms
`χ : L_{Π'} → ℝ^×`. Prove: `L_{Π'} = Q ∩ Θ(Q)` is `Θ`-stable, closed, with Lie algebra
`𝔩_{Π'}`; `M_{Π'} × A_{Π'} → L_{Π'}` is an isomorphism of Lie groups; `M_{Π'}` is `Θ`-stable
with Lie algebra `𝔪_{Π'}`, contains `M`, and has the minimal parabolic datum
`(M, A ∩ M_{Π'}, N ∩ M_{Π'})`, so that `P = (P ∩ M_{Π'})·A_{Π'}·N_{Π'}`; `N_{Π'}` is a connected,
simply connected, normal nilpotent subgroup of `Q` whose Lie algebra is the nilradical of
`𝔮_{Π'} ∩ [𝔤₀, 𝔤₀]`, with `lieExp : 𝔫_{Π'} → N_{Π'}` a diffeomorphism, and for semisimple `𝔤₀` it
is the largest connected normal nilpotent subgroup of `Q`; `Q = L_{Π'} ⋉ N_{Π'}`; and the
**Langlands decomposition** `M_{Π'} × A_{Π'} × N_{Π'} → Q`, `(m, a, n) ↦ man`, is a diffeomorphism.
For `Π' = ∅` this is §3.1's `P = MAN`. Prove that the Langlands decomposition is the unique one with
`Θ`-stable Levi relative to `K`, and that `G = KQ`. (Knapp, Ch. VII §7.)

**Checks.**

- `GL₃(ℝ)`, `Q` of block type `(2, 1)`: `L = GL₂(ℝ) × GL₁(ℝ)`,
  `A_{Π'} = {diag(s, s, t) | s, t > 0}`, `M_{Π'} = {(g, u) | |det g| = 1, |u| = 1}`, `N_{Π'} ≅ ℝ²`.
- `SL₂(ℝ)`, `Q = P`: `M_∅ = {±1}`, `A_∅ = A`; `Q = G`: `M_Π = G`, `A_Π = 1`, `N_Π = 1`.
- `Sp(4, ℝ)` for the form `[[0, 1], [−1, 0]]` in `2 × 2` blocks, Siegel parabolic
  `Q = {[[g, b], [0, (gᵀ)⁻¹]]}`: `L_{Π'} ≅ GL₂(ℝ)` by `g ↦ diag(g, (gᵀ)⁻¹)`,
  `A_{Π'} = {diag(s, s, s⁻¹, s⁻¹) | s > 0}`, `M_{Π'} ≅ {g ∈ GL₂(ℝ) | |det g| = 1}`, and
  `N_{Π'} = {[[1, S], [0, 1]] | S = Sᵀ}` of dimension `3 = dim Sp(4, ℝ)/Q = 10 − 7`.

*Needs:* §4.1, §4.2; LieGroups Layers 2 and 4.

### 4.4 Parabolic subgroups, type and the dynamical description

A **parabolic subgroup** of `G` is a subgroup containing a minimal parabolic subgroup. Prove:
every parabolic subgroup is `gQ_{Π'}g⁻¹` for a unique `Π'` (its **type**) and some `g`; two
parabolic subgroups are conjugate iff they have the same type; parabolic subgroups are closed
and self-normalizing; the maximal proper ones are those of type `Π ∖ {α}`; the codimension
`dim G/Q_{Π'} = dim 𝔫_{Π'}`; `G/Q` is compact; a **parabolic subalgebra** is an
`Ad(G)`-conjugate of some `𝔮_{Π'}`, and `Q ↦ Lie(Q)`, `𝔮 ↦ N_G(𝔮)` are inverse bijections
between parabolic subgroups and parabolic subalgebras. Prove the complexification criterion: a
real subalgebra `𝔮` is parabolic iff `𝔮 ⊗ ℂ` contains a Borel subalgebra of `𝔤₀ ⊗ ℂ`
(`TauCeti.borelSubalgebra` for some Cartan subalgebra and base). Define `dynamicalParabolic X`
as in `Suggested.lean` and prove: it is a subgroup for every `X`; for hyperbolic `X` it is a
closed parabolic subgroup with Lie algebra `nonnegEigenSubmodule X`, equal to `Q_{Π'}` when
`X ∈ 𝔞̄⁺` with `Π' = {α ∈ Π | α(X) = 0}`; and every parabolic subgroup is `dynamicalParabolic X`
for some `X ∈ 𝔭`. For connected `G` with semisimple Lie algebra and finite centre the
closed-parabolic clause is `dynamicalParabolic_isClosed_lie`, parabolic meaning that it contains
`N_G(𝔫)` for some Cartan involution, maximal abelian `𝔞 ⊆ 𝔭` and regular `H₀ ∈ 𝔞`. (Knapp,
Ch. VII §7; Borel–Ji, *Compactifications of Symmetric and Locally Symmetric Spaces*, Ch. I.1.)

For a connected complex reductive group `H` viewed as a real group (§2.5), with compact real form
`U`, so that `𝔨 = 𝔲` and `𝔭 = i𝔲`, prove that the parabolic subgroups are exactly the complex
parabolic subgroups `N_H(𝔮)`, `𝔮 ⊆ 𝔥` a complex subalgebra containing a Borel subalgebra
(`TauCeti.borelSubalgebra`): `𝔞 = i𝔱` for a maximal abelian `𝔱 ⊆ 𝔲`, `𝔪 = 𝔱`, the restricted
roots are the roots of the Cartan subalgebra `𝔱 ⊗ ℂ = 𝔱 ⊕ i𝔱` restricted to `𝔞`, and the
restricted root spaces are its complex root spaces, so each `𝔮_{Π'}` is a complex parabolic
subalgebra. For `s ∈ i𝔲` the group `P_s = {g | e^{ts} g e^{−ts}, t ≥ 0, is bounded}` of the
Higgs-bundle literature is `dynamicalParabolic (−s)`, and every parabolic subgroup of `H` is a
`P_s` (García-Prada, Gothen and Mundet i Riera, *The Hitchin–Kobayashi correspondence, Higgs pairs
and surface group representations*, §2.1, Definition 2.1, p. 5, and §2.4, Lemma 2.5, p. 7).

**Checks.**

- `SL₃(ℝ)`: three conjugacy classes of proper parabolics: Borel (type `∅`), and the stabilizers
  of a line and of a plane (types `{α₂}` and `{α₁}`), of codimensions `3`, `2` and `2`.
- For `X = diag(1, −1)` in `𝔰𝔩₂(ℝ)`, `dynamicalParabolic X` is the upper triangular group; for
  `X = −diag(1, −1)` it is the lower triangular group; for elliptic `X = [[0, 1], [−1, 0]]` it is
  all of `SL₂(ℝ)` (type `Π`).
- `SO₀(n, 1)`, `n ≥ 2`: `Π = {α}`, so the only proper type is `∅` and every proper parabolic
  subgroup is a conjugate of `P`; in real rank one the minimal and the maximal proper parabolic
  subgroups coincide.
- `SL₂(ℂ)` as a real group, `s = diag(1, −1) ∈ i𝔰𝔲(2)`: `e^{ts} g e^{−ts}` multiplies `g₁₂` by
  `e^{2t}`, so `P_s` is the lower triangular Borel subgroup, while `dynamicalParabolic s` is the
  upper triangular one; the two conventions differ by `s ↦ −s`.

*Needs:* §2.4, §2.5, §4.2, §4.3; Tau Ceti Borel subalgebras.

### 4.5 Comparison with algebraic `ℝ`-parabolic subgroups

For `G = 𝐆(ℝ)` or `𝐆(ℝ)°`, `𝐆` connected reductive over `ℝ` with the transpose-stable realization
of AutomorphicFormsOnReductiveGroups §2.3a, prove: for every `ℝ`-cocharacter `ν` of the maximal
split torus `𝐒` of AF §2.3a with `α(dν(1)) = 0` for `α ∈ Π'` and `> 0` for `α ∈ Π ∖ Π'`,
`Q_{Π'} = G ∩ P_𝐆(ν)(ℝ)` (ReductiveGroups Layer 7's `TauCeti.Cocharacter.parabolic`), with
`N_{Π'} = G ∩ U_𝐆(ν)(ℝ)` and `L_{Π'} = G ∩ Z_𝐆(ν)(ℝ)`; and the map `𝐐 ↦ G ∩ 𝐐(ℝ)` is a bijection
from the parabolic `ℝ`-subgroups of `𝐆` (`TauCeti.HopfIdeal.IsParabolic`) onto the parabolic
subgroups of `G`, preserving inclusion and conjugacy. Route: ReductiveGroups Layer 7 writes
every parabolic `ℝ`-subgroup as `P_𝐆(ν)` for an `ℝ`-cocharacter `ν`; `dν(1)` is hyperbolic, so
§2.4 conjugates it into `𝔞̄⁺`, and §4.4's dynamical description identifies the real points.
For connected `G` this agrees with §4.4; for disconnected `𝐆(ℝ)` the components are handled by
`G = M·G⁰` (§2.3). Prove that the parabolic subgroups of `G` are also exactly the `N_G(𝔮)` for the
parabolic subalgebras `𝔮 ⊆ 𝔤₀`, with `Lie(N_G(𝔮)) = 𝔮`. For a real form `G = H^τ` of §2.5, prove
that `𝔮 ↦ 𝔮 ⊗ ℂ` is a bijection from the parabolic subalgebras of `𝔥^τ` onto the `dτ`-stable
parabolic subalgebras of `𝔥` (§4.4's complexification criterion), and hence that the parabolic
subgroups of `H^τ` are exactly the `H^τ ∩ Q` for the `τ`-stable parabolic subgroups `Q` of `H`:
`H^τ ∩ N_H(𝔮 ⊗ ℂ) = N_{H^τ}(𝔮)` because `Ad(g)` commutes with `dτ` for `g ∈ H^τ`, and the
parabolic subgroups of `H` are the `N_H` of its parabolic subalgebras (§4.4, complex case).
(Borel–Tits, *Groupes réductifs*, §§4–5 and §14; Borel–Ji, Ch. I.1.)

**Checks.**

- `GL_n`: the standard parabolics are the block upper triangular groups, matching both sides.
- `SO(n, 1)` as `𝐆(ℝ)`, `𝐆 = SO(q)` for `q` of signature `(n, 1)`: the proper parabolic
  `ℝ`-subgroups are the stabilizers of isotropic lines, and their real points are the
  conjugates of `P`.
- `SL₂(ℝ) = SL₂(ℂ)^τ`, `τ(g) = ḡ`: the `τ`-stable Borel subgroups of `SL₂(ℂ)` are the stabilizers
  of the real points of `ℙ¹(ℂ)`, and their intersections with `SL₂(ℝ)` are the conjugates of the
  upper triangular group; the stabilizer of `[i : 1]` is a Borel subgroup that is not `τ`-stable,
  and its intersection with `SL₂(ℝ)` is the compact `SO(2)`, not a parabolic subgroup.

*Needs:* §2.5, §4.4; AutomorphicFormsOnReductiveGroups §2.3a; ReductiveGroups Layer 7;
ArithmeticLocallySymmetricSpaces ALS.F.1.

### Examples

The standard parabolics, Levi subgroups and Langlands decompositions of `GL_n(ℝ)`, `Sp(4, ℝ)`
(Siegel and Klingen parabolics) and `SU(2, 1)` are worked in full.

### Dependencies

Layer 3; Tau Ceti Tits-system and Coxeter parabolics and Borel subalgebras;
AutomorphicFormsOnReductiveGroups §2.3a; ReductiveGroups Layer 7.

## Layer 5: Riemannian symmetric spaces

### 5.1 Riemannian symmetric spaces

Define the predicate **Riemannian symmetric space** on a Riemannian manifold `M`: every `p` has an
involutive `TauCeti.RiemannianIsometry` `s_p` fixing `p` with `d(s_p)_p = −1`. For connected `M`
prove: `p` is an isolated fixed point of `s_p` and `s_p` is unique; `s_p` reverses geodesics
through `p`; `M` is complete (HopfRinow; Eschenburg, *Lecture Notes on Symmetric Spaces*, §1,
p. 2); `∇R = 0` (`CovariantDerivative.HasParallelCurvature`, since `s_p` preserves `∇R` and
negates odd tensors at `p`; Eschenburg, §5, proof of Theorem 5, p. 15); the group generated by the
`s_p` acts transitively (the symmetry at the midpoint of a minimizing geodesic exchanges its ends;
Eschenburg, §1, p. 2, the paragraph before Theorem 1); and `s_p s_q` translates along the geodesic
through `p` and `q` (Eschenburg, §2, Theorem 2, p. 8). Prove that a Riemannian product of
symmetric spaces and the universal Riemannian cover of a connected symmetric space are symmetric.

**Checks.**

- `ℝⁿ` with `s_p(x) = 2p − x`; the round sphere with reflection through the line `ℝp`; the real
  hyperbolic space with the hyperboloid reflection.
- A flat torus `ℝ²/Λ` is symmetric (`x ↦ 2p − x` descends); a surface of nonconstant curvature
  is not, since `∇R ≠ 0` (RiemannianGeometry §1.2's metric `dx² + e^{2x²}dy²`).
- `ℝ² ∖ {0}` with the flat metric has `∇R = 0` but is not symmetric: a symmetry at `p` would have
  to be `x ↦ 2p − x`, which sends `2p` to the removed origin; a predicate tested only by parallel
  curvature would accept this space.

*Needs:* Tau Ceti Riemannian isometries and parallel curvature; HopfRinow; RiemannianGeometry
R1.2.

### 5.2 The symmetric space `G/K` as a manifold

Let `G` carry a LieGroups Layer 9 `CartanInvolution` datum with `K = G^Θ`. Construct `X = G ⧸ K`
with the smooth structure of SmoothBundlesConnections B1.4 and the projection `π : G → X` a
principal `K`-bundle. Prove: `dπ_1|𝔭 : 𝔭 → T_oX` is an isomorphism intertwining `Ad(k)|𝔭` with the
isotropy action of `k ∈ K`; `Y ↦ lieExp(Y)·o` is a diffeomorphism `𝔭 ≅ X` (from
`cartan_polar_decomposition`); hence `X` is contractible and simply connected; the action of `G` on
`X` is proper with point stabilizers the conjugates `gKg⁻¹`; a discrete subgroup acts properly
discontinuously; and `X` depends on choices only up to `G`-equivariant diffeomorphism (`gK ↦ gh⁻¹K'`
for `θ' = Ad(h)θAd(h)⁻¹`). For connected `G` with semisimple Lie algebra and any centre, define
`X_{𝔤₀} = Int(𝔤₀)/K_θ` with `G` acting through `Ad`, prove that it is `G`-equivariantly
diffeomorphic to `G/K` for `K` of §2.2, and that the kernel of the action is the `Ad`-preimage of
the product of the compact factors of `Int(𝔤₀)`, which is `Z(G)` when `𝔤₀` has noncompact type. For
reductive `𝔤₀`, prove `X ≅ X_{[𝔤₀,𝔤₀]} × (𝔭 ∩ 𝔷(𝔤₀))`. (Eschenburg, *Lecture Notes on Symmetric
Spaces*, §3, Theorem 3, p. 11, for `𝔭 ≅ T_oX`, and §6, p. 17, for simple connectivity and `X ≅ ℝⁿ`
when `X` is isotropy irreducible of noncompact type; in general both follow from
`cartan_polar_decomposition`.)

**Checks.**

- `SL₂(ℝ)/SO(2)` is identified with Mathlib's `UpperHalfPlane` by `g ↦ g·i`, equivariantly.
- `SL_n(ℝ)/SO(n)` is the space of positive definite symmetric matrices of determinant `1`, via
  `g ↦ ggᵀ`; `GL_n(ℝ)/O(n)` is all positive definite symmetric matrices, of dimension
  `n(n + 1)/2`.
- `SO₀(n, 1)/SO(n)` is the upper sheet of the hyperboloid, isometric after rescaling to Tau Ceti's
  `TauCeti.UpperHalfSpace`.

*Needs:* §2.2; LieGroups Layer 9; SmoothBundlesConnections B1.4.

### 5.3 The invariant metric, curvature and geodesics

Give `X` the `G`-invariant metric of Conventions, through RiemannianGeometry R1.3's homogeneous
metric from an `Ad(K)`-invariant inner product on the reductive complement `𝔭`. Prove: it is the
unique `G`-invariant metric with value `B|𝔭` at `o` (semisimple case); the **geodesic symmetry**
`s_o(gK) = Θ(g)K` is an isometry with `d(s_o)_o = −1`, so `X` is a Riemannian symmetric space
(§5.1); the Levi-Civita connection at `o` is the canonical connection, so for `Y ∈ 𝔭` the curve
`t ↦ lieExp(tY)·o` is a geodesic, every geodesic through `o` has this form, and
`d(lieExp(tY))` is parallel transport along it; the curvature at `o` is
`R(Y, Z)W = −[[Y, Z], W]`; the sectional curvature of the plane spanned by a `⟨·,·⟩_o`-orthonormal
pair `Y, Z ∈ 𝔭` is `B([Y, Z], [Y, Z]) ≤ 0`, zero iff `[Y, Z] = 0`; the Ricci tensor is
`Ric = −½ B|𝔭`, so the Killing metric is Einstein with constant `−½` when `𝔤₀` is semisimple; `X`
is complete (`TauCeti.completeSpace_of_isPretransitive_isom_of_finiteDimensional`); `X` is a
Hadamard manifold, so by R4.4 `exp_o` is a diffeomorphism and any two points are joined by a
unique geodesic; and the distance formula `d(g·o, h·o) = ⟨Y, Y⟩_o^{1/2}`, which is `B(Y, Y)^{1/2}`
when `𝔤₀` is semisimple, where `g⁻¹h = lieExp(Y)k`, `Y ∈ 𝔭`, `k ∈ K`. Prove that for simple
noncompact `𝔤₀` the isotropy representation of `K` on `𝔭` is irreducible and every `G`-invariant
metric is a constant multiple of the Killing metric. Prove that, for semisimple `𝔤₀`, the
`G`-equivariant diffeomorphisms of §5.2 between the spaces `X` of two Cartan involution data
(`gK ↦ gh⁻¹K'`) and the identification `G/K ≅ X_{𝔤₀}` are isometries for the Killing metrics, so
that `(X, g_X)` depends only on `𝔤₀` up to `G`-equivariant isometry. (Helgason, Ch. IV §§3–4 and
Ch. V §3; Eberlein, *Geometry of Nonpositively Curved Manifolds*, Ch. 2.)

**Checks.**

- `SL₂(ℝ)/SO(2)`: `B = 4 tr(XY)`, curvature `−½`; the Killing metric is `2·(dx² + dy²)/y²` on
  the upper half-plane.
- `SO₀(n, 1)/SO(n)`, `n ≥ 2`: `B = (n − 1) tr(XY)`, constant curvature `−1/(2(n − 1))`.
- `SU(n, 1)/S(U(n) × U(1))`, `n ≥ 2`: `B = 2(n + 1) tr(XY)`; complex lines have curvature
  `−1/(n + 1)` and totally real planes `−1/(4(n + 1))`, so the curvature is `1/4`-pinched.
- `SL₃(ℝ)/SO(3)`: the plane spanned by `diag(1, −1, 0)` and `diag(1, 1, −2)` is flat, so the
  curvature is not strictly negative.

*Needs:* §5.1, §5.2; RiemannianGeometry R1.3 and R4.4; HopfRinow.

### 5.4 Convexity, Cartan's fixed-point theorem and maximal compact subgroups

On a Hadamard manifold (complete, simply connected, nonpositive sectional curvature) prove: the
squared distance `x ↦ d(x, p)²` is smooth with Hessian at least `2g`, hence strictly convex along
geodesics; `t ↦ d(γ(t), σ(t))` is convex for geodesics `γ, σ`; and **Cartan's fixed-point theorem**:
a compact group acting continuously by isometries has a fixed point, the unique minimizer of
`x ↦ ∫_L d(x, l·q)² dl` (Haar probability, CompactGroups). Route: Jacobi comparison
(RiemannianGeometry R2 and R4.1 with `κ = 0`) for the Hessian bound away from `p`, smoothness in the
global exponential chart at `p`, and closed-ball compactness (HopfRinow) for existence of the
minimizer. This is `exists_forall_smul_eq_of_sectionalCurvature_nonpos`. For `G` with a
`CartanInvolution` datum, `K` is a maximal compact subgroup (LieGroups Layer 9); prove: every
compact subgroup of `G` lies in a conjugate of `K` (it fixes a point of `X`); the maximal compact
subgroups are exactly the conjugates of `K`; and any two Cartan involution data on `G` are conjugate
by an inner automorphism of `G`. For connected `G` with semisimple Lie algebra and finite centre,
prove that `θ ↦ K_θ`, the connected Lie subgroup with Lie algebra `𝔨_θ` (§2.2), is a bijection from
the Cartan involutions of `𝔤₀` onto the maximal compact subgroups of `G`; the inverse sends `K'` to
the unique Cartan involution with `𝔨 = Lie(K')`, whose `𝔭` is `Lie(K')^{⊥_B}` (§0.2: a Cartan
involution is determined by `𝔨`). This is `existsUnique_isCartanInvolution_lie_eq`.
ArithmeticLocallySymmetricSpaces ALS.F.1 proves the containment and
conjugacy for the real points of a reductive `ℝ`-group; this section proves them for every
`CartanInvolution` datum, nonlinear finite covers included. For connected `G` with semisimple Lie
algebra and finite centre, which carries such a datum (§2.2), the existence of a maximal compact
subgroup, the containment and the conjugacy are `exists_maximal_isCompact_and_le_conj`. (Helgason,
Ch. I §13 and Ch. VI §2; Eberlein, §1.4.)

**Checks.**

- `SL₂(ℤ)`'s finite subgroup generated by `[[0, −1], [1, 1]]` (order `6`) fixes the point
  `e^{2πi/3}` of the upper half-plane (`z ↦ −1/(z + 1)`) and lies in the conjugate of `SO(2)`
  stabilizing it.
- On `ℝⁿ` a compact group of isometries fixes the barycentre of any orbit; the integer
  translations (noncompact) have no fixed point.
- `SL₂(ℝ)`: the maximal compact subgroups are the stabilizers `SO(2)_z` of the points `z` of the
  upper half-plane, and `SO(2)_z` corresponds to the Cartan involution `X ↦ −g Xᵀ g⁻¹` with
  `g = hhᵀ`, `h·i = z`; the bijection fails for the universal cover of `SL₂(ℝ)`, whose infinite
  centre lies in every `K_θ`, so that no `K_θ` is compact.

*Needs:* §2.2, §5.3; LieGroups Layer 9 (maximality of `K`); RiemannianGeometry R2, R4.1;
HopfRinow; CompactGroups Haar probability.

### 5.5 Totally geodesic submanifolds, flats and rank

Prove: for a **Lie triple system** `𝔰 ⊆ 𝔭` (`[[𝔰, 𝔰], 𝔰] ⊆ 𝔰`), `lieExp(𝔰)·o` is a complete
totally geodesic embedded submanifold (second fundamental form zero, RiemannianGeometry R5a),
and every complete totally geodesic submanifold through `o` arises this way. Prove that every
connected totally geodesic embedded submanifold `N ∋ o`, not necessarily closed or complete, has
`T_oN = dπ_1(𝔰)` for a Lie triple system `𝔰` and is an open subset of `lieExp(𝔰)·o`: the Gauss
equation makes `T_oN` invariant under the curvature `R(Y, Z)W = −[[Y, Z], W]` of §5.3, and two
connected totally geodesic submanifolds with the same tangent space at a common point agree near
it, since both contain the short geodesics in its directions; a connectedness argument gives the
inclusion. A **flat** is a
complete totally geodesic submanifold isometric to a Euclidean space; it comes from an abelian
`𝔰`. Prove: `F_𝔞 = A·o` is a maximal flat, isometric to `(𝔞, ⟨·,·⟩_o|𝔞)`; every flat through `o`
lies in `k·F_𝔞` for some `k ∈ K`; the maximal flats are the `g·F_𝔞`; any two points lie in a common
maximal flat (`kakDecomposition`); the **rank** of `X`, the maximal dimension of a flat, equals
`finrank ℝ 𝔞`, which is `groupRealRank` when `𝔤₀` is semisimple; for noncompact type, rank one is
equivalent to strictly negative sectional curvature. Define the **Weyl chambers** of `F_𝔞` as the
images of the chambers of `𝔞`, and the **vector-valued distance** `d_𝔞(g·o, h·o) ∈ 𝔞̄⁺`, the
`𝔞̄⁺`-component of `g⁻¹h` in `kakDecomposition`; prove it is well defined (uniqueness of the
middle `KAK` factor modulo `W_G`, §2.3), `G`-invariant, satisfies `d_𝔞(y, x) = −w₀ d_𝔞(x, y)`,
and `|d_𝔞(x, y)|_o = d(x, y)`, the norm of `⟨·,·⟩_o`. (Helgason, Ch. IV §7 and Ch. V §6;
Eberlein, Ch. 2.)

**Checks.**

- `SL₃(ℝ)/SO(3)`: maximal flats are `2`-dimensional; for `x = o`,
  `y = diag(e², 1, e⁻²)·o`, `d_𝔞(x, y) = diag(2, 0, −2)` and `d(x, y) = (6·8)^{1/2} = 4√3`
  (`B = 6 tr(XY)`).
- `SL₂(ℝ)/SO(2)`: flats are the geodesics, the rank is `1`.
- A geodesic `lieExp(tY)·o` with `Y` regular lies in exactly one maximal flat; with `Y` singular
  in `SL₃(ℝ)/SO(3)` (`Y = diag(1, 1, −2)`) it lies in a one-parameter family of them.

*Needs:* §1.3, §2.3, §5.3; LieGroups Layer 9 (`kakDecomposition`); RiemannianGeometry R5a.

### 5.6 Quotients by discrete subgroups

For a discrete subgroup `Λ ≤ G` prove: `Λ` acts properly discontinuously on `X` with finite
stabilizers; define the **injectivity radius** of `Λ\X` at `[x]` by displacement, the
**displacement radius** `½ inf_{γ ∈ Λ ∖ {1}} d(x, γx)` (`∞` for trivial `Λ`), and prove it is
independent of the lift, the infimum is attained when `Λ` is nontrivial, and it vanishes exactly
at points with nontrivial stabilizer. When `Λ` acts freely (for instance `Λ` torsion-free),
prove `Λ\X` is a complete connected locally symmetric Riemannian manifold (Tau Ceti's quotient
of a free properly discontinuous action, with `X → Λ\X` a Riemannian covering, the universal
covering with deck group `Λ` because `X` is simply connected), and that the
displacement radius equals RiemannianGeometry R4.6's injectivity radius of `Λ\X` (there are no
conjugate points). Prove that `TauCeti.riemannianVolume` on `X` is `G`-invariant, hence a
positive multiple of the pushforward of a Haar measure of `G`, and that a measurable fundamental
domain of `Λ` in `X` (`MeasureTheory.IsFundamentalDomain`) has finite volume iff `Λ` has finite
covolume in `G`; for free actions this volume is `riemannianVolume(Λ\X)`. (Helgason, Ch. IV;
Eberlein, Ch. 1.)

**Checks.**

- `SL₂(ℤ)` acting on the upper half-plane: stabilizer of `i` of order `4` (`2` modulo `±1`), so
  the displacement radius vanishes at `i`; `Λ\X` has finite volume (`π/3` for the hyperbolic
  metric, `2π/3` for the Killing metric `2(dx² + dy²)/y²`).
- `Λ = ⟨diag(e, e⁻¹)⟩ ⊆ SL₂(ℝ)`: at `x = i`, `d(i, e²i)` is the length of the geodesic segment,
  `√8` for the Killing metric, so the displacement radius at `i` is `√2`; the quotient has
  infinite volume.
- `Λ = {±1} ⊆ SL₂(ℝ)`: `−1` acts trivially on the upper half-plane, so every stabilizer is `Λ` and
  the displacement radius is `0` at every point, although `Λ\X = X`; a definition through the
  quotient metric alone would give `∞`, and the comparison with R4.6 needs a free action.

*Needs:* §5.2, §5.3; Tau Ceti quotient manifolds and Riemannian volume; RiemannianGeometry R4.6;
Mathlib properly discontinuous actions and Haar measure.

### 5.7 Complex hyperbolic space

Fix `n ≥ 1` and the Hermitian form `⟨z, w⟩ = z₀w̄₀ − Σ_{i=1}^n z_i w̄_i` of signature `(1, n)` on
`ℂ^{n+1}`, with Gram matrix `J = diag(1, −1, …, −1)`. Let `U(1, n) = {g ∈ GL_{n+1}(ℂ) | g*Jg = J}`
and `PU(1, n) = U(1, n)/{λ·1 : |λ| = 1}`. Prove: `U(1, n)` is a closed subgroup of `GL_{n+1}(ℂ)`
stable under `g ↦ (g*)⁻¹`, connected, with `K̃ = U(1) × U(n)` (block diagonal) its maximal compact
subgroup and `K̃ × 𝔭 → U(1, n)` a diffeomorphism (LieGroups Layer 9's matrix model, realified);
`PU(1, n)` is a connected centre-free Lie group whose Lie algebra is identified with `𝔰𝔲(1, n)`;
`SU(1, n) → PU(1, n)` is surjective with kernel the `(n + 1)`-th roots of unity; and `Ad` is an
isomorphism `PU(1, n) ≅ Int(𝔰𝔲(1, n))` (the centralizer of `𝔰𝔲(1, n)` in `𝔤𝔩_{n+1}(ℂ)` is the
scalars). With `θ(X) = −X*` (§0.4), `𝔭 = {Y_v | v ∈ ℂⁿ}` with `Y_v = [[0, v*], [v, 0]]`, the image
`K` of `K̃` is isomorphic to `U(n)`, and `(a, A) ∈ U(1) × U(n)` acts on `𝔭` by `Y_v ↦ Y_{āAv}`.

The **ball model.** Let `𝔹ⁿ = {[z] ∈ ℙ(ℂ^{n+1}) | ⟨z, z⟩ > 0}` (Mathlib's `Projectivization`)
and `[z] ↦ (z₁/z₀, …, z_n/z₀)` its chart, a bijection onto the open unit ball of `ℂⁿ`
(`EuclideanSpace ℂ (Fin n)`), whose smooth and complex structures `𝔹ⁿ` takes. Prove that
`[g]·[z] = [gz]` is a faithful transitive action of `PU(1, n)` on `𝔹ⁿ` by maps that are
fractional linear, hence holomorphic, in the chart; that the stabilizer of `o = [1 : 0 : … : 0]`
is `K`; and that the orbit map is a `PU(1, n)`-equivariant diffeomorphism `X = PU(1, n)/K ≅ 𝔹ⁿ`
whose differential at `o` sends `dπ_1(Y_v)` to `v`. Define the Riemannian metric
`g_𝔹(u, u) = 2(|u|²/(1 − |w|²) + |⟨u, w⟩|²/(1 − |w|²)²)` at `w`, the metric `ω_X(·, J·)` of the
Kähler form `ω_X = −i∂∂̄ log(1 − |w|²)` (ComplexKahlerGeometry for Kähler forms), and prove that
it is `PU(1, n)`-invariant and that the orbit map carries the Killing metric of §5.3 to
`2(n + 1)·g_𝔹`. By §5.3 every `PU(1, n)`-invariant Riemannian metric on `𝔹ⁿ` is a constant
multiple of `g_𝔹`.

**Totally geodesic submanifolds.** Prove that the Lie triple systems in `𝔭 ≅ ℂⁿ` are exactly the
complex subspaces and the totally real subspaces (real subspaces `V` with `⟨u, v⟩ ∈ ℝ` for
`u, v ∈ V`), from `[[Y_u, Y_v], Y_w] = Y_{u(v*w) − v(u*w) − (u*v − v*u)w}`. So the complete totally
geodesic submanifolds of `𝔹ⁿ` through `o` are the `𝔹ⁿ ∩ V` for complex subspaces `V`, isometric
to complex hyperbolic spaces, and the images of totally real subspaces, isometric to real
hyperbolic spaces (§5.5). For a complex subspace `W' ⊆ ℂ^{n+1}` of dimension `m + 1`, `1 ≤ m ≤ n`,
on which the form has signature `(1, m)`, prove that `X_{W'} = 𝔹ⁿ ∩ ℙ(W')` is a closed connected
totally geodesic submanifold, equal in the chart to the intersection of the unit ball with a complex
affine subspace and biholomorphic to `𝔹^m`, and that its stabilizer in `PU(1, n)` is the image of
`U(W') × U(W'^⊥)`, acting on it through `PU(W') ≅ PU(1, m)`. Conversely, prove that every connected
totally geodesic submanifold of `𝔹ⁿ` of real dimension `2m ≥ 2` whose tangent spaces are complex
subspaces in the chart is an open subset of `X_{W'}` for a unique such `W'`, by §5.5's local
statement after translating a point to `o`. (Goldman, *Complex Hyperbolic Geometry*, Ch. 3.)

**Checks.**

- `n = 1`: `PU(1, 1) ≅ PSL₂(ℝ)`, `𝔹¹` is the unit disc, `g_𝔹 = 2|dw|²/(1 − |w|²)²` has curvature
  `−2`, and the Killing metric `4·g_𝔹` has curvature `−½`, matching §5.3's `SL₂(ℝ)/SO(2)`.
- In `𝔹²`, `V = ℂe₁` gives the complex geodesic `{(w₁, 0)}`, of Killing curvature `−1/3`, and
  `V = span_ℝ(e₁, ie₂)` (totally real) gives a real hyperbolic plane of Killing curvature `−1/12`.
- Non-example: `V = span_ℝ(e₁, i(e₁ + e₂))` is neither complex nor totally real; with `u = w = e₁`,
  `v = i(e₁ + e₂)` the bracket formula gives `−v − 3ie₁ ∉ V`, so `V` is not a Lie triple system and
  `lieExp(V)·o` is not totally geodesic.
- The form of signature `(1, m)` is needed: for `W'` on which the form is negative definite,
  `𝔹ⁿ ∩ ℙ(W')` is empty.

*Needs:* §0.4, §5.2, §5.3, §5.5; LieGroups Layer 9; ComplexKahlerGeometry (Kähler forms).

### Examples

Real hyperbolic space `SO₀(n, 1)/SO(n)`, complex hyperbolic space `PU(1, n)/K` (§5.7),
`SL_n(ℝ)/SO(n)` and the products `ℍ² × ℍ²` are worked through §§5.2–5.7.

### Dependencies

Layers 0–2; LieGroups Layer 9; SmoothBundlesConnections B1.4; RiemannianGeometry R1.2, R1.3, R2,
R4.1, R4.4, R4.6, R5a; HopfRinow; CompactGroups; ComplexKahlerGeometry.

## Ordering

§0.1, §0.3 and §0.4 need LieGroups Layer 7 only for the existence of Cartan involutions; they are
otherwise self-contained Lie algebra and can be built first, with existence taken as a hypothesis in
each statement that needs it. §0.2 needs LieGroups Layers 2, 4 and 9 for `Int(𝔤₀)` and its adjoint
datum. Layer 1 follows; it reads LieGroups Layer 9's
restricted root system on the adjoint `CartanInvolution` datum of §0.2 (the direct route for §1.1
needs only §0.1), and §1.3 needs Layer 9's `Ad(K)𝔞 = 𝔭` on the same datum. Layer 2 follows
Layer 1. Layers 3–4 and Layer 5 depend on Layer 2 and not on each other, except that §4.4's
complex case and §4.5's real forms use §2.5. Within Layer 5, §5.4 needs §5.3, §5.5 needs §2.3 and
§5.3, §5.6 needs §5.3, and §5.7 needs §5.5.

## Downstream consumers

ShimuraData (Hermitian symmetric spaces as Riemannian symmetric spaces),
NoncompactQuantumSymmetry (Cartan involutions, `Int(𝔤₀)`, maximal compact subgroups), and
roadmaps on lattices in semisimple groups, character varieties of surface groups, and complex
hyperbolic geometry.

## References

- A. W. Knapp, *Lie Groups Beyond an Introduction*, 2nd ed., Birkhäuser (2002): Ch. VI (Cartan
  involutions, Cartan and Iwasawa decompositions, restricted roots, Cartan subalgebras) and
  Ch. VII (real reductive groups, `KAK`, Bruhat decomposition, parabolic subgroups, Langlands
  decompositions), Appendix C (tables).
- S. Helgason, *Differential Geometry, Lie Groups, and Symmetric Spaces*, Academic Press (1978):
  Ch. I §13 (Cartan's fixed-point theorem), Ch. III §7, Ch. IV (symmetric spaces, curvature,
  totally geodesic submanifolds), Ch. V (noncompact type, rank), Ch. VI (Cartan and Iwasawa
  decompositions, maximal compact subgroups), Ch. VII (restricted roots), Ch. X (classification
  tables).
- J.-H. Eschenburg, *Lecture Notes on Symmetric Spaces*, lecture notes on the author's page at
  the University of Augsburg: §§1–3, 5–7 and 9 (symmetries, transvections, the tangent space as
  infinitesimal transvections, parallel curvature, noncompact type, simple ideals, conjugacy of
  maximal abelian subspaces).
- P. Eberlein, *Geometry of Nonpositively Curved Manifolds*, Chicago (1996): Ch. 1 (Hadamard
  manifolds) and Ch. 2 (symmetric spaces of noncompact type).
- G. Warner, *Harmonic Analysis on Semi-Simple Lie Groups I*, Springer (1972): §1.2 (Tits systems
  and the Bruhat decomposition of a real reductive group).
- A. Borel and J. Tits, *Groupes réductifs*, Publ. Math. IHÉS 27 (1965): §§4–5 and §14.
- A. Borel and L. Ji, *Compactifications of Symmetric and Locally Symmetric Spaces*,
  Birkhäuser (2006): Ch. I.1 (parabolic subgroups, Langlands decompositions, dynamical
  description).
- N. Bourbaki, *Lie Groups and Lie Algebras*, Ch. IV §2 (Tits systems and their parabolic
  subgroups).
- B. Kostant, *On convexity, the Weyl group and the Iwasawa decomposition*, Ann. Sci. ÉNS 6
  (1973): §2 (hyperbolic elements).
- A. Borel, *Linear Algebraic Groups*, 2nd ed., Springer GTM 126 (1991): §20 (conjugacy of
  maximal split tori).
- W. M. Goldman, *Complex Hyperbolic Geometry*, Oxford (1999): Ch. 3 (the ball model, its
  invariant metric and its totally geodesic submanifolds).
- O. García-Prada, P. B. Gothen and I. Mundet i Riera, *The Hitchin–Kobayashi correspondence, Higgs
  pairs and surface group representations*, arXiv:0909.4487 (v3, 2012): §2.1 and §2.4 (parabolic
  subgroups of a complex reductive group and the groups `P_s`).
