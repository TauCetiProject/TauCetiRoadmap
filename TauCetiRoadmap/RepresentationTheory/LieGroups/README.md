# Roadmap: Lie groups and the Lie algebra correspondence

The whole representation-theory family presupposes a smooth-Lie-group theory that Mathlib does not have.
[The compact-groups roadmap](../CompactGroups/README.md) reduces a compact connected group "to its
maximal torus and rank-one `SU(2)` subgroups" and proves the Weyl integration formula by hand for
`SU(2)`; [the highest-weight roadmap](../LieHighestWeight/README.md) builds the representation theory of
the Lie *algebra* `𝔤` and remarks that its Weyl formulas are "the compact-group specializations that a
later general-compact-Lie-group roadmap (maximal tori, roots, the Weyl group) would abstract";
[the reductive-groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1011) works with algebraic groups over a field.
None of them builds the object that ties `G` to `𝔤`: the **exponential map**, the **Lie functor**
`G ↦ Lie(G)`, the **closed-subgroup theorem**, **Lie's third theorem**, and the structure theory
(maximal tori, complexification, Borel-Weil, the Cartan/Iwasawa decompositions) of a general Lie group.
This roadmap builds it.

Mathlib's smooth side is genuinely thin. It has the **class of Lie groups** itself
(`Geometry/Manifold/Algebra/LieGroup.lean`: `LieGroup I n G`, a group that is a `C^n` manifold with
smooth multiplication and inversion, with the instance `LieGroup I 0 G` for any topological group and a
worked `LieGroup 𝓘(𝕜, R) n Rˣ` on the units of a normed algebra), the **Lie algebra of a Lie group** as
left-invariant derivations (`Geometry/Manifold/Algebra/LeftInvariantDerivation.lean`:
`LeftInvariantDerivation I G` with its `LieRing` and `LieAlgebra 𝕜` instances and the evaluation
`LeftInvariantDerivation.evalAt` into point derivations), the **Lie bracket of vector fields on a
manifold** (`Geometry/Manifold/VectorField/LieBracket.lean`: `VectorField.mlieBracket`), and the
manifold-calculus toolkit (`ContMDiff`, `mfderiv`, `TangentSpace`, `ModelWithCorners`). On the analytic
side it has the **exponential of a Banach algebra** in full (`Analysis/Normed/Algebra/Exponential.lean`:
`NormedSpace.exp 𝕂`, `exp_zero`, `exp_add_of_commute`, `exp_sum_of_commute`), specialized to the **matrix
exponential** (`Analysis/Normed/Algebra/MatrixExponential.lean`: `Matrix.exp_transpose`,
`Matrix.exp_diagonal`, `Matrix.exp_add_of_commute`, `Matrix.isUnit_exp`, `Matrix.exp_conj`) and to the
**circle exponential** `Circle.exp : C(ℝ, Circle)` (`Analysis/Complex/Circle.lean`, with `exp_zero`,
`exp_add`). On the abstract-algebra side it has the whole theory of Lie algebras
(`Algebra/Lie/*`: `LieRing`, `LieAlgebra R L`, `LieHom` (`→ₗ⁅R⁆`), `LieEquiv` (`≃ₗ⁅R⁆`),
`LieAlgebra.ad : L →ₗ⁅R⁆ Module.End R L`, `UniversalEnvelopingAlgebra K L`, Cartan subalgebras, root
systems via `LieAlgebra.IsKilling.rootSystem`). And it has the concrete **matrix groups**
(`Matrix.GeneralLinearGroup`, `Matrix.SpecialLinearGroup`, `Matrix.unitaryGroup`,
`Matrix.specialUnitaryGroup`, `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`,
`Matrix.SymplecticGroup`, `Circle`), the topology of **covering maps** (`Topology/Covering/Basic.lean`:
`IsCoveringMap`) and **simple connectedness** (`SimplyConnectedSpace`). The abstract Lie-algebra library
is large but not complete for the reductive/highest-weight superstructure Deliverable C needs: the
integral weight lattice, Borel subalgebras, the root-space decomposition, the Weyl denominator, and the
highest-weight classification are not packaged around `LieAlgebra.IsKilling.rootSystem`, and are consumed
from [../RootSystems](../RootSystems/README.md) and [../LieHighestWeight](../LieHighestWeight/README.md)
or built as named interfaces here.

The native Mathlib foundations do not by themselves supply the roadmap's complete group/algebra
correspondence or compact/reductive classification. This repository's Tau Ceti modules already define
substantial general-Lie-group pieces: the derivation-to-tangent comparison, `lieExp` and its
one-parameter subgroup (`TauCeti.Geometry.Lie.Exponential.Basic`), `Ad`
(`TauCeti.Geometry.Lie.Adjoint.Derivation`), `lieMap` (`TauCeti.Geometry.Lie.Functor`),
`lieSubalgebraOfSubgroup` (`TauCeti.Geometry.Lie.Subgroup.LieAlgebra`), and the local BCH germ
(`TauCeti.Geometry.Lie.Exponential.BCH`). Those declarations have precise finite-dimensional,
smoothness, `T2Space`, interior-point and/or boundaryless hypotheses; the roadmap consumes them only
under those hypotheses and owns the remaining global theorems and applications. The native Banach
unit exponential (`TauCeti.expUnit`) and its matrix and circle specializations remain the worked
shadows. The closed-subgroup theorem, integration/equivalence, compact root and Weyl theory,
complexification, Borel–Weil and real-reductive global decompositions remain roadmap constructions.
This roadmap builds that theory, from the exponential map up to the structure theory of compact and
reductive Lie groups, with the matrix groups and the circle as the worked engine. It is organized into
three deliverables:

- **A. The Lie functor: from groups to algebras** (Layers 0-3): the exponential map, one-parameter
  subgroups, `Ad`/`ad`, the closed-subgroup theorem, the functor `G ↦ Lie(G)`, and
  Baker-Campbell-Hausdorff. This is the differentiation direction, `G ⟶ 𝔤`.
- **B. Integrating algebras to groups** (Layers 4-5): the subalgebra ↔ immersed-subgroup correspondence
  and Frobenius, Lie's third theorem, the equivalence of categories (simply-connected Lie groups ≃
  finite-dimensional Lie algebras), simply-connected covers, and the universal enveloping algebra. This
  is the integration direction, `𝔤 ⟶ G`.
- **C. The compact and reductive Lie-group structure** (Layer 5A, then Layers 6-9): first the real
  Ad-invariant metric and Lie-algebra splitting for compact connected groups, then maximal-torus
  conjugacy and exhaustion, the Weyl group and the general Weyl integration formula, complexification
  and real forms, Borel-Weil with flag manifolds and Bruhat, and Cartan/Iwasawa/KAK decompositions with
  restricted roots.

Suggested home: `TauCeti/Geometry/Lie/` (the general theory) and `TauCeti/Geometry/Lie/Matrix/` (the
matrix-group engine), mirroring Mathlib's `Geometry/Manifold/Algebra/`.

## Standing conventions

- **The group, and its two settings.** A **Lie group** is Mathlib's `LieGroup I n G`: a `Group G` that
  is a `C^n` manifold on a `ModelWithCorners I` with `C^n` multiplication and inversion. The default
  throughout is a **real, finite-dimensional, `C^∞`** Lie group: base field `ℝ`, model
  `I : ModelWithCorners ℝ E H` with `E` finite-dimensional, smoothness `n = ∞`, and `[IsManifold I ∞ G]`.
  Finite-dimensionality (`[FiniteDimensional ℝ E]`) is a **standing hypothesis of the whole general
  theory**, not an optional extra: `lieExp` is the integral curve of a vector field (ODE existence), the
  local-diffeomorphism-at-`0` and closed-subgroup theorems are the inverse function theorem, and
  Frobenius, Lie's third theorem, and the universal cover as a Lie group all fail without it (they would
  need a Banach-Lie theory over Banach manifolds and Banach ODEs, not developed here). Above that floor,
  state each result at the generality it needs, in the unbundled Zulip house style: the exponential map
  and `Ad` need the finite-dimensional `LieGroup`; the closed-subgroup theorem additionally uses local
  compactness (automatic in finite dimensions); the structure theory of Deliverable C adds
  `[CompactSpace G]` and `[ConnectedSpace G]` or, for the reductive statements, a complex or
  real-reductive hypothesis. **Do not** bundle "real, finite-dimensional, compact, connected, semisimple"
  into one mega-class; spell the hypotheses each theorem uses. Complexifications and real forms are
  **complex** Lie groups (base field `ℂ`), introduced in Layer 7 and named as such.
- **Real and complex Lie-algebra carriers.** For a standing real group use native
  `LeftInvariantDerivation I G`, its commutator over ℝ, and the finite-dimensional
  smooth identity-tangent equivalence to `GroupLieAlgebra I G`. For complex H use
  `GroupLieAlgebra Ic H`, not derivations on global holomorphic functions. Here
  Ic is a finite-dimensional complex model and `LieGroup Ic ∞ H`. Obtain
  `LieGroup Ic (minSmoothness ℂ 3) H` via `LieGroup.of_le`; completeness of E
  follows from finite-dimensionality. Use the resulting native bracket hypotheses. Layer7 uses
  `𝓘(ℂ,E)` after CM M1 model transport where needed, and names M1's realified
  model I_R on the same carrier. Complex Lie(H) below always means this tangent
  Lie algebra, compared after restriction of scalars with the real derivation
  algebra. Compact complex tori need no global holomorphic functions to have
  their nonzero tangent Lie algebra.
- **The native exponential map and its algebra shadows.** Consume the global `lieExp : 𝔤 → G`
  from `TauCeti.Geometry.Lie.Exponential.Basic`, defined by the time-one invariant integral curve.
  The flow theory it rests on — the maximal flow of a vector field with its jointly open domain, joint
  smoothness and group law, the fundamental theorem of flows (Lee, *Introduction to Smooth Manifolds*,
  Thm. 9.12) — is the [differential-geometry roadmap](../../DifferentialGeometry/README.md)'s layer 3,
  consumed here; that roadmap reconciles its `flowOf` with the invariant integral curves of this one by
  name. Likewise the **Frobenius theorem** and its immersed leaves (Layer 4 below) are that roadmap's
  layer 4, built to this roadmap's specification and consumed here, and the smooth structure on the
  covering spaces of Layer 5 is its 2.3.
  On `G = Rˣ` (units of a Banach algebra, `Lie(Rˣ) = R`) it must coincide with `NormedSpace.exp`, on
  matrix groups with `Matrix.exp`, and on the circle with `Circle.exp`; those coincidences are
  acceptance criteria, not definitions. Reuse Mathlib's `NormedSpace.exp`, `Matrix.exp` lemmas, and
  `Circle.exp` for the worked arena; never redefine the matrix exponential.
- **The adjoint carriers and their comparisons.** Reuse Mathlib's
  `ad = LieAlgebra.ad ℝ 𝔤 : 𝔤 →ₗ⁅ℝ⁆ Module.End ℝ 𝔤`
  (`LieAlgebra.ad_apply : ad x y = ⁅x, y⁆`) and the native group adjoint
  `TauCeti.Lie.Ad : G → (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)`, obtained by differentiating conjugation at `1`.
  Layer 1 consumes these carriers and the available native comparison laws; its derivative,
  entire-exponential and matrix comparisons are stated with their actual hypotheses below.
- **Matrix groups are the computable engine; the abstract manifold theory is the general statement.**
  Every abstract milestone has a matrix-group shadow that is Mathlib-native and where norms exist:
  `Matrix.GeneralLinearGroup (Fin n) ℝ = (Matrix (Fin n) (Fin n) ℝ)ˣ`, `Matrix.SpecialLinearGroup`,
  `Matrix.specialUnitaryGroup`, `Matrix.orthogonalGroup`/`specialOrthogonalGroup`. Where a smooth-manifold
  signature is fragile, `Suggested.lean` states the milestone over a matrix or normed group instead and
  the README records the general form; the two are kept in step, exactly as
  [../CompactGroups](../CompactGroups/README.md) keeps `SU(2)` beside the abstract compact group. Use
  Mathlib's matrix-group names, never a private matrix group.
- **Root systems and the Weyl group are the root-systems roadmap's; we consume them.** For the
  reductive/complex structure theory (Layers 8-9) the root system is `LieAlgebra.IsKilling.rootSystem`
  and the abstract Weyl group is `RootPairing.weylGroup`, the province of
  [../RootSystems](../RootSystems/README.md) and [../LieHighestWeight](../LieHighestWeight/README.md).
  The **geometric** Weyl group `N(T)/T` built here (Layer 6) is proved isomorphic to that abstract Weyl
  group in the reductive case, not reintroduced. The highest-weight modules `L(λ)` that Borel-Weil
  realizes are [../LieHighestWeight](../LieHighestWeight/README.md)'s `irreducibleQuotient`; we cite them.
- **Haar and Peter-Weyl are the compact-groups roadmap's.** The Weyl integration formula (Layer 6) is an
  identity of integrals against `MeasureTheory.Measure.haar`; the normalized Haar probability measure,
  its bi-invariance, and the character orthogonality it feeds are
  [../CompactGroups](../CompactGroups/README.md)'s `haarProb` and `character_orthonormal`, cited rather
  than rebuilt. This roadmap supplies the **general** maximal-torus reduction that the compact-groups
  roadmap proved only for `SU(2)`; specializing back to `SU(2)` recovers its `weyl_integration_formula`.

## What Mathlib already has (consume)

- **The class of Lie groups.** `Geometry/Manifold/Algebra/LieGroup.lean` - `LieGroup I n G` (and
  `LieAddGroup`), extending `ContMDiffMul I n G` with `contMDiff_inv`; `LieGroup.of_le`, the instance
  `LieGroup I 0 G` for `[IsTopologicalGroup G]`, and the units instance
  `Geometry/Manifold/Instances/UnitsOfNormedAlgebra.lean`: `ChartedSpace R Rˣ` and `LieGroup 𝓘(𝕜, R) n Rˣ`.
- **The tangent Lie algebra.** `Geometry/Manifold/GroupLieAlgebra.lean` supplies
  `GroupLieAlgebra I G`, the invariant-vector-field bracket at1 and LieRing/
  LieAlgebra instances over a nontrivially normed field, with actual smoothness
  and completeness hypotheses.
- **Real derivation face of the Lie algebra.** `Geometry/Manifold/Algebra/LeftInvariantDerivation.lean` -
  `LeftInvariantDerivation I G` with `instLieRing`/`instLieAlgebra` (`𝕜`), `LeftInvariantDerivation.evalAt`
  (`→ₗ[𝕜] PointDerivation I g`), and the bracket `⁅X, Y⁆` as the derivation commutator.
- **The Lie bracket of vector fields.** `Geometry/Manifold/VectorField/LieBracket.lean` -
  `VectorField.mlieBracket I V W`, `mlieBracketWithin`, `leibniz_identity_mlieBracket`,
  `mpullback_mlieBracket`.
- **The exponential of a Banach algebra.** `Analysis/Normed/Algebra/Exponential.lean` -
  `NormedSpace.exp 𝕂 : 𝔸 → 𝔸`, `expSeries`, `exp_zero`, `exp_add_of_commute`, `exp_add` (commutative
  `𝔸`), `exp_sum_of_commute`, `exp_sum`, `hasFPowerSeriesAt_exp_zero_of_radius_pos`.
- **The matrix exponential.** `Analysis/Normed/Algebra/MatrixExponential.lean` - `Matrix.exp_transpose`,
  `Matrix.exp_conjTranspose`, `Matrix.exp_diagonal`, `Matrix.exp_blockDiagonal`,
  `Matrix.exp_add_of_commute`, `Matrix.exp_sum_of_commute`, `Matrix.exp_nsmul`, `Matrix.exp_neg`,
  `Matrix.exp_zsmul`, `Matrix.isUnit_exp`, `Matrix.exp_units_conj`, `Matrix.exp_conj`.
- **The circle and its exponential.** `Analysis/Complex/Circle.lean` - `Circle` (`= Submonoid.unitSphere ℂ`,
  a group), `Circle.exp : C(ℝ, Circle)` (`t ↦ exp (t * I)`), `Circle.exp_zero`, `Circle.exp_add`; and
  `AddCircle`, `AddCircle.haarAddCircle`.
- **Abstract Lie algebras.** `Algebra/Lie/Basic.lean` - `LieRing`, `LieAlgebra R L`, `LieHom` (`→ₗ⁅R⁆`),
  `LieEquiv` (`≃ₗ⁅R⁆`), `LieSubalgebra`, `LieIdeal`; `Algebra/Lie/OfAssociative.lean` -
  `LieAlgebra.ad R L : L →ₗ⁅R⁆ Module.End R L`, `LieAlgebra.ad_apply`; `Algebra/Lie/UniversalEnveloping.lean`
  - `UniversalEnvelopingAlgebra K L`, `UniversalEnvelopingAlgebra.ι`, `.lift`; the structure theory
  (`CartanSubalgebra`, `IsKilling`, `IsSemisimple`, `rootSystem`) consumed by
  [../LieHighestWeight](../LieHighestWeight/README.md).
- **Matrix groups.** `LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`
  (`Matrix.GeneralLinearGroup n R = (Matrix n n R)ˣ`, `GLPos`), `LinearAlgebra/Matrix/SpecialLinearGroup.lean`
  (`Matrix.SpecialLinearGroup`, `SL(n, R)`), `LinearAlgebra/UnitaryGroup.lean` (`Matrix.unitaryGroup`,
  `Matrix.specialUnitaryGroup`, `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup` with their
  `Group` instances), `LinearAlgebra/SymplecticGroup.lean` (`Matrix.SymplecticGroup`).
- **Manifold calculus.** `Geometry/Manifold/MFDeriv/Defs.lean` (`mfderiv`, `TangentSpace`),
  `Geometry/Manifold/ContMDiff/Defs.lean` (`ContMDiff`), `Geometry/Manifold/IsManifold/Basic.lean`
  (`IsManifold`), `ModelWithCorners`.
- **Topology of covers and connectedness.** `Topology/Covering/Basic.lean`
  (`IsCoveringMap`, `IsCoveringMapOn`), `Topology/Homotopy/Lifting.lean`,
  `AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean` (`SimplyConnectedSpace`), `ConnectedSpace`,
  `LocallyCompactSpace`.
- **Haar measure (for Layer 6).** `MeasureTheory/Measure/Haar/Basic.lean` (`Measure.haar`),
  `CompactSpace.isFiniteMeasure`, and the uniqueness/normalization consumed by
  [../CompactGroups](../CompactGroups/README.md).

## What is missing (build here)

The existing native floor supplies the derivation/tangent Lie-algebra comparison,
`lieExp`, `oneParameterSubgroup`, `TauCeti.Lie.Ad`, the Lie functor on smooth homomorphisms,
the subgroup Lie-algebra carrier and the local BCH germ, with the laws and hypotheses named
in Layers 0–3. It also supplies global exponential smoothness
(`contMDiff_lieExp`) and the local-diffeomorphism-at-zero theorem
(`isLocalDiffeomorphAt_lieExp_zero`) in the standing finite-dimensional real,
`LieGroup I ∞ G`, `T2Space` and boundaryless context. Consume these results directly.

Construct the continuous one-parameter-subgroup classification and the required specific
matrix/unit/circle comparisons at their stated scopes; the remaining adjoint and Lie-functor
comparisons; the closed-subgroup theorem and arbitrary-subgroup direction-set identification;
the total degreewise Dynkin BCH series, explicit convergence and cubic-remainder estimates,
and its comparison with the native local germ. Construct the subalgebra–immersed-subgroup
correspondence using DifferentialGeometry's Frobenius theorem, Lie's third theorem,
the simply-connected Lie-group/Lie-algebra equivalence, the universal-cover Lie-group
construction and the enveloping-algebra/left-invariant-differential-operator comparison,
consuming LieHighestWeight's PBW theorem.

The compact and reductive targets retain maximal-torus conjugacy and exhaustion, the finite
Weyl group and Weyl integration; universal complexification with its period/kernel data,
real forms and holomorphic representation extension; the algebraic and analytic comparisons
preceding flag manifolds and Borel–Weil–Bott, consuming ReductiveGroups' generic Bruhat theorem;
and the Cartan, arbitrary-complement Iwasawa and restricted-root KAK decompositions.
The precise hypotheses, constructions and independent supplier boundaries are specified below;
Harish–Chandra harmonic analysis remains a separate downstream subject.

`Suggested.lean` wraps the existing native interfaces and gives nonexhaustive signatures for
further constructions, including `IsEmbeddedLieSubgroup`, `bch`, `IsMaximalTorus`, `weylGroup`,
`holomorphicEquivariantFunctionSpace` and `iwasawaDecomposition`. Its admitted targets are
construction goals; the complete mathematical specification is this README.

---

## The build, in layers

The ordering is the dependency order. Deliverable A (Layers 0-3) differentiates: it builds the
exponential map, the adjoint representations, the closed-subgroup theorem, and the Lie functor.
Deliverable B (Layers 4-5) integrates: Frobenius, Lie's third theorem, the equivalence of categories, and
the enveloping algebra. Deliverable C begins with the compact real metric floor (Layer 5A), then develops the
structure theory of compact and reductive Lie groups in Layers 6-9. As each layer makes the next layer's *types* expressible, its milestones go into `Suggested.lean`
(with `sorry`).

## A. The Lie functor: from groups to algebras

### Layer 0: the exponential map and one-parameter subgroups

Consume the global `lieExp` and `oneParameterSubgroup` declarations from
`TauCeti.Geometry.Lie.Exponential.Basic`. Their native construction evaluates the invariant
curve at time one and requires a finite-dimensional real model, a smooth Lie group,
`T2Space`, and a boundaryless model (so the identity is an interior point).
Consume `contMDiff_lieExp` from `TauCeti.Geometry.Lie.Exponential.Smoothness` and
`isLocalDiffeomorphAt_lieExp_zero` from `TauCeti.Geometry.Lie.Exponential.LocalInverse`
under these same hypotheses. The matrix/unit/circle coincidences are applications of this
common derivation-based carrier. Keep the arbitrary model-with-corners scope of later
statements separate from this boundaryless native interface.

- **The Lie algebra and the tangent space at `1`.** Reuse `LeftInvariantDerivation I G` as `𝔤`. The
  identification `𝔤 ≃ₗ[ℝ] TangentSpace I (1 : G)` is not a one-line upgrade of Mathlib's `evalAt`: it is
  three milestones. (i) `LeftInvariantDerivation.evalAt (1 : G) : 𝔤 →ₗ[ℝ] PointDerivation I (1 : G)`
  lands in point derivations, not tangent vectors. (ii) `PointDerivation I (1 : G) ≃ₗ[ℝ] TangentSpace I
  (1 : G)`, the identification of derivations at a point with tangent vectors, holds because `E` is
  finite-dimensional and `G` is `C^∞` (Mathlib's `DerivationBundle` records that it fails in general);
  this is where finite-dimensionality enters. (iii) `evalAt 1` is a bijection, via the inverse that
  builds a left-invariant vector field from a tangent vector and checks its derivation is smooth and
  left-invariant. Only after (i)-(iii) is `finrank ℝ 𝔤 = finrank ℝ E` available. Every left-invariant
  derivation is a left-invariant vector field; state that dictionary.
- **The exponential map.** Reuse `lieExp : 𝔤 → G`, with `lieExp X = γ_X 1` for the invariant
  integral curve through `1`. Consume its native zero law, `contMDiff_lieExp` and
  `isLocalDiffeomorphAt_lieExp_zero`; the latter supplies the local exponential chart at `1`.
  Use the canonical derivation–tangent/model comparison when expressing the derivative at `0`
  as the identity, and retain naturality and the specific algebra/circle comparisons below.
- **One-parameter subgroups.** `oneParameterSubgroup X : ℝ → G`, `t ↦ lieExp (t • X)`, is a **smooth
  group homomorphism** `(ℝ, +) → G`: `lieExp ((s + t) • X) = lieExp (s • X) * lieExp (t • X)` and
  `lieExp (0 • X) = 1`. Conversely, **every** continuous homomorphism `ℝ → G` is `oneParameterSubgroup X`
  for a unique `X` (a continuous one-parameter subgroup is automatically smooth). This bijection
  `Hom_cont(ℝ, G) ≃ 𝔤` is the definition's justification.
- **The matrix and circle shadows.** On `G = Rˣ` for a Banach algebra `R` (with `Lie(Rˣ) ≅ R`),
  `lieExp = NormedSpace.exp` landing in `Rˣ` (`isUnit_exp`); on matrix groups it is `Matrix.exp`, whose
  `Matrix.exp_diagonal`, `Matrix.exp_transpose`, `Matrix.exp_conj` are the computational identities; on
  the circle it is `Circle.exp`, with `Circle.exp_add` its one-parameter-subgroup law. These are proved
  here as the coincidence lemmas that ground the abstract `lieExp`.

### Layer 1: the adjoint representations `Ad` and `ad`

- **The group adjoint.** `Ad : G → (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)`, `Ad g = d(c_g)_1` the differential at `1` of conjugation
  `c_g : x ↦ g x g⁻¹`. It is a Lie-algebra automorphism, and `Ad : G →* (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)` is a **smooth
  representation** of `G` on `𝔤`, the **adjoint representation**. On matrix groups `Ad g X = g X g⁻¹`.
- **The infinitesimal adjoint.** The Lie-algebra adjoint is Mathlib's
  `ad = LieAlgebra.ad ℝ 𝔤 : 𝔤 →ₗ⁅ℝ⁆ Module.End ℝ 𝔤`, `ad X = ⁅X, ·⁆` (`LieAlgebra.ad_apply`). The
  milestone is that it is the derivative of `Ad`: `ad = d(Ad)_1`, i.e.
  `mfderiv Ad 1 X = LieAlgebra.ad ℝ 𝔤 X`. This *is* the geometric meaning of the bracket.
- **Conjugation and the global exponential derivative.** Prove
  `Ad(lieExp X)=exp(ad X)` and `g·lieExp X·g⁻¹=lieExp(Ad g X)`.
  Construct for every X the entire left-trivialized derivative
  `d(lieExp)_X=d(L_(lieExp X))_1 ∘ ∫_(s∈[0,1]) exp(−s ad X) ds`,
  with its parameter smoothness and convergent series comparison. The notation
  `(1−exp(−ad X))/ad X` means this operator also at singular ad X. Retain
  `Ad_lieExp` naturality as the headline.

### Layer 2: the closed-subgroup (Cartan) theorem

- **The Lie subalgebra of any subgroup.** For every subgroup H≤G define
  h={X∈g | exp(tX)∈H for every real t}. Prove it is a Lie subalgebra by a
  finite-product construction, without assuming H closed. Let K⊂H be generated
  by these one-parameter groups and let V span Ad_k X for k∈K and X∈h.
  Choose a basis Y_i among these vectors; each exp(tY_i) lies in K. The product
  map ∏exp(t_iY_i) is an embedded patch near0, by the finite-dimensional rank
  theorem. Its tangent spaces are left translates of V, using Ad_K-invariance.
  Pull back each left-invariant Z∈V to that patch and use Layer0's local ODE
  existence/uniqueness to show exp(tZ)∈K locally, then globally by integer powers.
  Hence V=h. Differentiate Ad_{exp(tX)}V=V inside the finite-dimensional closed
  vector space V to obtain bracket closure. This uses Layer1's Ad and early
  flow/finite-dimensional chart calculus, not closedness of H or later Lie integration.
- **The closed-subgroup theorem.** For finite-dimensional real G and CLOSED H,
  prove H has its unique embedded Lie-group structure, Lie(H)=h and exp_H the
  restriction of exp. First establish the exact closed-H limit criterion:
  X∈h iff there are sequences 0<t_n→0 and X_n→X with exp(t_nX_n)∈H for every n.
  Necessity takes X_n=X and t_n=1/(n+1). Conversely choose integers m_n with
  m_nt_n→s for each real s; closedness applied to exp(t_nX_n)^{m_n} gives exp(sX)∈H.
  In a complement g=h⊕m the map (X,Y)↦exp X exp Y is a chart near1.
  If arbitrarily small nonzero transverse Y_n satisfy exp Y_n∈H, normalize
  t_n=||Y_n|| and X_n=Y_n/||Y_n|| and extract a unit limit in m; the criterion
  contradicts h∩m=0. Thus H is the h-slice locally, and translate these charts.
  The criterion is not asserted for nonclosed subgroups: Q⊂R is a counterexample.
  The embedded theorem uses finite-dimensionality, and is not a Banach-Lie assertion.
- **Consequences.** The **matrix groups are Lie groups**: `Matrix.SpecialLinearGroup`,
  `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `Matrix.orthogonalGroup`,
  `Matrix.specialOrthogonalGroup`, and `Matrix.SymplecticGroup` are closed subgroups of
  `Matrix.GeneralLinearGroup`, hence embedded Lie subgroups, with Lie algebras the trace-zero,
  skew-Hermitian, skew-symmetric, etc. matrices. State each `Lie(-)` explicitly; these are the acceptance
  criteria that give the compact-groups and classical-groups roadmaps their smooth structures. **Cartan's
  automatic-smoothness corollary**: every continuous homomorphism between Lie groups is smooth (its graph
  is a closed subgroup), so "Lie group homomorphism" may be stated as "continuous homomorphism".

- **The simply connected rank-one source before Layer6.** Construct the smooth
  identification `SU(2)≃S³` from first column (a,b), with inverse
  `[[a,−conj b],[b,conj a]]` and actual determinant/unit/inverse laws. Prove S³
  simply connected: approximate continuous based loops by smooth based loops,
  with a basepoint-fixed homotopy from finite sphere charts/normalized short
  interpolation and rounding. Apply [DifferentialGeometry10.2](../../DifferentialGeometry/README.md)
  Sard on the boundaryless Circle parametrization to find a point outside
  the smooth based loop, then contract it through stereographic ℝ³. This proves SU(2) simply connected before Layer4's
  integration is applied to it in Layer6, without torus/Weyl structure.

### Layer 3: the Lie functor and Baker-Campbell-Hausdorff

- **The functor on morphisms.** For a smooth homomorphism `φ : G →* G'`,
  `lieMap φ = d(φ)_1 : 𝔤 →ₗ⁅ℝ⁆ 𝔤'` is a **Lie-algebra homomorphism**, natural against the
  exponential: `φ (lieExp X) = lieExp (lieMap φ X)`. Functoriality: `lieMap (id) = id`,
  `lieMap (ψ ∘ φ) = lieMap ψ ∘ lieMap φ`. Together with Layer 0 this is the **Lie functor**
  `G ↦ (𝔤, Lie(G))`, `φ ↦ lieMap φ`, from Lie groups to finite-dimensional real Lie algebras. Layer 2's
  automatic-smoothness theorem shows that a continuous homomorphism is smooth.
- **Injectivity on connected groups.** If `G` is **connected**, `lieMap` determines `φ`: two smooth
  homomorphisms with the same differential at `1` agree (they agree on `lieExp 𝔤`, which generates a
  connected `G`). So the functor is **faithful on connected groups**, and a connected Lie group is
  generated by any neighborhood of `1`.
- **Baker-Campbell-Hausdorff.** Define the formal `bch(X,Y)` by the degreewise Dynkin Lie series in the completed free Lie algebra; its first terms are `X + Y + ½[X,Y] + 1/12([X,[X,Y]] + [Y,[Y,X]]) + ⋯`. For a complete normed algebra `R`, define its total numerical value at arbitrary `x,y : R` as the `tsum` of the evaluated degreewise Dynkin terms, with the ambient `tsum` convention that a nonsummable series has value zero. This convention makes `bch_R` a total function; it does not grant algebraic identities where the series is not norm-summable. On either coordinate axis all terms except the degree-one term have finite support, so the numerical endpoint laws `bch_R(0,y)=y` and `bch_R(x,0)=x` hold for every `x,y`. Prove absolute convergence on an explicit neighborhood (for example, a constructed `r>0` with `‖x‖+‖y‖<r`), the product identity `exp(x)exp(y)=exp(bch_R(x,y))`, associativity whenever every series and intermediate product in the identity lies in its convergence domain, and functoriality under continuous algebra/Lie homomorphisms on that domain. On a smaller closed ball prove an explicit cubic remainder bound `‖bch_R(x,y)-x-y-½[x,y]‖ ≤ C(‖x‖+‖y‖)^3`. Identify the convergent series with `lieLog(lieExp x · lieExp y)` only where the exponential chart and logarithm are defined; this is a local-germ comparison, not a global logarithm. Prove the matrix/unit Banach-algebra case and transport that local identity to abstract `lieExp` by a chart. The global endpoint laws come from the finite-support axis sums, while other numerical laws are claimed only on their stated convergence domains.

## B. Integrating algebras to groups

### Layer 4: Frobenius, Lie's third theorem, and the equivalence of categories

- **The subalgebra ↔ immersed-subgroup correspondence.** For a Lie subalgebra `𝔥 ≤ 𝔤`, the left-invariant
  distribution `x ↦ d(L_x)_1 𝔥 ⊆ TangentSpace I x` is **involutive** (`⁅𝔥, 𝔥⁆ ⊆ 𝔥`), so by **Frobenius
  integrability** it is integrable; the leaf through `1` is a **connected immersed Lie subgroup**
  `integralSubgroup 𝔥` with `Lie(integralSubgroup 𝔥) = 𝔥`. An immersed Lie subgroup is **not** a
  subspace-topology `Subgroup G`: it carries its own (generally finer) manifold and group structure with
  an injective smooth immersion into `G`, recorded by the predicate `IsImmersedLieSubgroup`. The
  Frobenius theorem (`VectorField.mlieBracket`-involutive ⇒ integrable), with distributions, integral
  manifolds and the leaf through a point as honest immersed manifolds, is the named analytic
  prerequisite, owned by the [differential-geometry roadmap](../../DifferentialGeometry/README.md) (its
  layer 4: `Distribution`, `IsInvolutive`, `IntegralManifold`, `leafThrough`) and consumed here;
  `integralSubgroup 𝔥` is `leafThrough` of the left-invariant distribution. The map
  `𝔥 ↦ integralSubgroup 𝔥` is a **bijection** between Lie subalgebras of `𝔤` and
  connected immersed subgroups of `G` up to immersed-subgroup equivalence (the closed ones are Layer 2's
  embedded subgroups).
- **Lie's third theorem.** Every **finite-dimensional real Lie algebra** `L` is `Lie(G)` for some
  **simply-connected** Lie group `G`: `∃ G, [LieGroup] ∧ SimplyConnectedSpace G ∧ Nonempty (Lie(G) ≃ₗ⁅ℝ⁆ L)`.
  Prove it via the real specialization of the [**Ado–Iwasawa theorem**](../AdoIwasawa/README.md) (every
  finite-dimensional Lie algebra embeds in `𝔤𝔩_n = Matrix n n ℝ`) reducing to the subalgebra
  `L ↪ 𝔤𝔩_n`, integrating by the Frobenius
  correspondence to a connected immersed subgroup of `GL_n`, and passing to its **universal cover**. The
  covering-space construction is the topological half of Layer 5 and does **not** depend on Lie's third,
  so it is a prerequisite developed first, and the dependency is acyclic (universal covers precede Lie's
  third, which precedes the equivalence of categories).
- **The equivalence of categories.** The Lie functor of Layer 3, restricted to **simply-connected** Lie
  groups, is an **equivalence** onto finite-dimensional real Lie algebras. Concretely: for simply-connected
  `G` and any Lie group `G'`, `lieMap : Hom(G, G') ≃ Hom(𝔤, 𝔤')` is a **bijection** (existence lifts a
  Lie-algebra homomorphism to a group homomorphism using simple connectedness and the local BCH group law;
  uniqueness is Layer 3's faithfulness). Combined with Lie's third theorem (essential surjectivity), this
  is the categorical statement `SimplyConnLieGrp ≃ FinDimLieAlg`.

### Layer 5: simply-connected covers and the enveloping algebra

- **Simply-connected covers.** Every **connected** Lie group `G` has a **universal cover** `G̃` that is a
  simply-connected Lie group with a **covering homomorphism** `p : G̃ →* G` (`IsCoveringMap p`), and
  `lieMap p : Lie(G̃) ≃ₗ⁅ℝ⁆ Lie(G)` is an **isomorphism** (a covering is a local diffeomorphism). The
  smooth structure on the covering space and the smoothness of lifts are the
  [differential-geometry roadmap](../../DifferentialGeometry/README.md)'s 2.3
  (`IsCoveringMap.inducedChartedSpace`), consumed here. This
  construction (the covering space, the lifted group law, and the transported Lie-group structure) is
  **independent of Lie's third theorem** and is exactly the prerequisite Layer 4 draws on; presented here
  it is logically prior. The kernel `ker p` is a discrete central subgroup isomorphic to `π₁(G)`. So
  Lie-group homomorphisms out of a connected `G` correspond to homomorphisms out of `G̃` trivial on
  `ker p`, refining Layer 4's bijection to connected (not just simply-connected) sources, and this
  refinement is what needs Layer 4.
- **The universal enveloping algebra.** Identify Mathlib's U_R(g) with the
  left-invariant differential operators, with the derivative action and
  `UniversalEnvelopingAlgebra.lift` universal property. Consume
  [LieHighestWeight Layer3](../LieHighestWeight/README.md) for PBW and its basis.
  For an irreducible real U_R(g)-module V retain the action
  Z(U_R(g))→Z(End_{U_R(g)}V), with its division commutant; it need not consist
  of real scalars. The real circle rotation module has central X acting by J,
  J²=−Id, rather than a real scalar. On finite-dimensional complex irreducibles,
  or real absolutely irreducible modules, construct the scalar central character
  under the actual coefficient and irreducibility hypotheses. For highest-weight
  modules use LHW Layer7's one-dimensional highest-weight-line construction,
  including its possibly infinite-dimensional scope and Casimir comparison.

## C. The structure of compact and reductive Lie groups

### Layer 5A: compact Lie-algebra metric and splitting

For a compact connected Hausdorff real finite-dimensional smooth Lie group `G`, write
`𝔤 = Lie(G)`. This floor supplies the compact real inner product and splitting used by Layer 6; it
is independent of the universal-cover/asphericity and complexification constructions.

- **The real `Ad`-invariant metric and derived-algebra splitting.** Consume Layer 1's continuous
  adjoint representation and CompactGroups Layer 0's normalized Haar probability and Bochner
  averaging operator. Starting with any positive-definite real inner product `⟨·,·⟩₀` on `𝔤`,
  construct
  `B_G(X,Y) = ∫_G ⟨Ad(g⁻¹)X, Ad(g⁻¹)Y⟩₀ dμ_G(g)`.
  Prove that `B_G` is positive-definite, symmetric and `Ad(G)`-invariant; positivity uses that
  every `Ad(g)` is invertible and Haar measure is positive on nonempty open sets. Differentiate
  invariance along `lieExp(tX)` to prove every `ad(X)` is skew-adjoint for `B_G`. Then prove
  `𝔤 = z(𝔤) ⊕ [𝔤,𝔤]` orthogonally, that `s=[𝔤,𝔤]` is a centerless semisimple ideal, and that
  its Killing form is negative-definite. Give the radical/center and bracket-orthogonality arguments
  from this same real invariant form and the trace identities. This is the real application of
  Haar averaging; the complex unitarization theorem is not substituted for it.

### Layer 6: maximal tori, the Weyl group, and Weyl integration

- **Tori and maximal tori.** A **torus** in `G` is a compact connected abelian Lie subgroup. In this
  initial Layer 6 subgroup block, prove the compact connected abelian classification `T ≅ (Circle)^r`,
  that `Lie(T)` is a maximal abelian subalgebra when `T` is maximal, and that `lieExp|Lie(T)` is onto
  `T`. These are compact abelian/exponential targets built from Layer 0's local exponential and
  one-parameter-subgroup APIs; restricted or global exponential surjectivity is not imported from Layer 0.
  `IsMaximalTorus T` means a torus maximal under inclusion. Before conjugacy
  prove the compact-torus character criterion and Kronecker density: coordinates
  with 1 rationally independent give a dense cyclic subgroup in ℝ^r/ℤ^r.
  Thus every T has a topological generator, independently of ConvexityToric's
  later integral/isogeny applications. Prove `Lie(C_G(T))=Lie(T)` from maximal
  abelianness, hence `C_G(T)⁰=T`. With the invariant form prove
  `Lie(N_G(T))=Lie(T)`: [X,t] lies both in t and its orthogonal complement.
  The compact zero-dimensional quotient N_G(T)/T is therefore finite, before
  the later full C_G(T)=T argument.

- **Homogeneous-space floor.** Consume [SmoothBundlesConnections B1.4](https://github.com/TauCetiProject/TauCetiRoadmap/pull/887)
  for a closed Lie subgroup `H ≤ G`: its free proper right action gives the smooth quotient
  `G/H`, the principal bundle `G → G/H`, and the tangent-quotient description of the
  projection. Before applying it to `H=T` or each `H_α`, establish that the chosen subgroup
  is closed; the concrete manifold, tangent-space and projection identifications remain
  explicit Layer 6 applications. SBC B1.1's principal-bundle construction consumes the
  independent regular-fibre-product floor [LieGroupoidsPoisson G0.1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1050); B1.4 uses that earlier
  principal-bundle interface together with the closed-subgroup structure from Layer 2.
  Neither prerequisite depends on Layer 6.

- **Conjugacy and exhaustion.** For compact connected G, first prove maximal
  tori exist. Consume [DifferentialGeometry10.3–10.5](../../DifferentialGeometry/README.md)
  for oriented degree, regular-value counts, homotopy invariance and
  `∫f*ω=deg(f)∫ω`, including top cohomology under its actual hypotheses.
  Own the application to `F:G/T×T→G`, `F([g],t)=gtg⁻¹`, with compact domain.
  Put m=t-perp for the invariant form. Fix orientations of m and t so their
  ordered product (m,t) is the chosen orientation of g; use left translations
  for G/T, T and G. Connected T makes this quotient orientation well defined.
  At a dense cyclic generator a∈T prove the fibre is N_G(T)/T. Ad_a has no
  nonzero fixed vector on m, hence 1−Ad_a is invertible there. Since T is
  connected, Ad_a has determinant+1 and fixes t pointwise. Orthogonality and
  absence of the +1 eigenvalue on m imply its −1 multiplicity is even, and
  dim m is even, before any root-space theorem. For the domain curves
  `([g exp(sX)],t exp(sY))`, X∈m and Y∈t, the derivative left-trivialized at
  gtg⁻¹ is `Ad_g((Ad_(t⁻¹)−Id)X+Y)`. At every point of the fibre the same
  parity argument applies: the real blocks contribute (−2) to an even power
  and each nonreal pair contributes `|λ⁻¹−1|²>0`. Thus all local degrees are
  positive with these fixed orientations, including the empty m block.
  Nonzero degree gives surjectivity; closing the cyclic subgroup of a generator
  of any maximal torus proves conjugacy. Deduce exhaustion and global real
  lieExp surjectivity, treating the connected zero-dimensional group directly.
  The root/Weyl comparison is downstream; SU(2) recovers CompactGroups' example.
- **Compact real roots and the Weyl comparison.** For compact connected G and maximal torus T, consume Layer5A’s real Ad-invariant positive inner product and orthogonal splitting g=z(g)⊕[g,g], with their actual invariance and bracket equations. Construct t=z(g)⊕t_ss by restriction; the center lies in every maximal toral Lie algebra. Simultaneously diagonalize the commuting unitary adjoint action of T on g_C, form its actual nonzero root characters χ_α:T→S¹ and real root planes, and prove dχ_α=iα. Identify the zero weight with t_C. Prove t_ss,C is a Cartan subalgebra of the complexified semisimple summand and match the actual weight and root spaces. Consume LieHighestWeight Layer0's sl₂ strings/integrality and the native one-dimensional semisimple-root-space theorem with these hypotheses. Prove complex root multiplicity1 and real root-plane dimension2, then that roots vanish on z(g), span t_ss*, and give the finite reduced crystallographic root/coroot pairing. Establish the root-space bracket/rank-one normalization needed for the comparison, not just a list of weights. With the invariant metric put α∨=2α♯/‖α‖² and prove the root reflections act as X↦X−α(X)α∨. Export its actual root-pairing isomorphism with LieHighestWeight’s `rootSystem` on t_ss,C, preserving roots, coroots, reflections and the center-fixed Weyl action. This is the compact REAL realization of RootSystems’ abstract carrier; character PERIODS and integral lattice/isogeny refinements are consumed later by ConvexityToric T1.
- **Rank-one representatives.** For each root build the compact su(2) subalgebra from its real root plane and coroot, with its normalized brackets. Consume Layer4’s integration of Lie homomorphisms out of the simply-connected SU(2) source to obtain SU(2)→G, and prove the derivative and torus/normalizer equations. Its image is compact and connected; its standard normalizer element gives n_α∈N_G(T) inducing the displayed reflection. For X∈t with α(X)=0, show the rank-one Lie algebra centralizes X and, by connectedness, its group image and n_α lie in Z_G(X)⁰. Prove restriction and conjugation laws. This assertion supplies actual representatives, not merely an abstract reflection name. For the compact rank-one map pin dφ(diag(i,−i))=α∨. With dχ_α=iα and α(α∨)=2, export the calibration for a later algebraic cocharacter ν_alg extending this compact circle: dν_alg(1)=−iα∨ and d(ν_alg|S¹)(i)=α∨. Its root pairing is therefore dα_alg(dν_alg(1))=2. The later pinned-algebraic comparison proves the extension and matches root maps; the compact construction here assumes no FCO or algebraic-group theorem.
- **The Weyl group.** Construct weylGroup T=N_G(T)/T, prove finiteness and faithful action on T and t, and identify its action on t_ss with the root-pairing Weyl group, fixing the center. Prove both inclusions in the geometric/abstract action comparison: rank-one representatives realize the abstract reflection subgroup, while the converse requires the compact normalizer/root-crossing argument showing every geometric normalizer action is a product of root reflections. Supply the actual regular-chamber comparison here. For t_reg={X:α(X)≠0 for every root}, define g_reg=Ad(G)·t_reg. Prove every element of g is conjugate into t and use the centralizer-dimension formula to identify this with the minimal-centralizer locus and the complement of the displayed singular images. In the zero-root case g_reg=g and the singular union is empty. Construct the proper local-diffeomorphism covering q:G/T×t_reg→g_reg, q([g],X)=Ad_gX, using the root-plane derivative, maximal-torus conjugacy and invariant norm. For each root form the compact subgroup H_α=T·image(SU(2)_α), of dimension dim T+2; prove it centralizes ker α and that the singular set is the finite union of the images of G/H_α×ker α, each domain of dimension dim g−3. Use DifferentialGeometry 10.2 for finite-dimensional Sard. In this Layer6 milestone, construct and justify the smooth perturbation families relative to fixed boundary collars (including the interior evaluation/submersion and finite-dimensional parameter argument); do not assume a separate relative-genericity theorem from DifferentialGeometry. First approximate continuous paths/discs in g by smooth maps, preserving a compact avoidance reserve on the designated already-regular subset, in particular the endpoint/boundary collars; prove the straight-line homotopy there remains in g_reg. No avoidance is assumed on an initial filling disc away from that subset. Fix data already smooth near the collars; smooth arbitrary continuous boundary data before fixing a smooth collar. Prove the finite-family path/disc avoidance application in dimensions1 and2 with those fixed smooth boundary data in g_reg, so `g_reg` is connected and simply connected. A bare dimension label on an arbitrary singular set does not supply this application. Identify the connected components of t_reg with the nonempty root-sign cones: signs are constant on connected sets, and each such cone is open and convex. Under the compact real realization identify them with the W-translates of the abstract open dominant chamber on the dual Cartan carrier, including the unrestricted z(g) factor. Prove the reflection/action and cone-intersection comparisons before applying abstract transitivity to these components. Each component G/T×C then covers g_reg diffeomorphically. Thus the geometric Weyl action on chambers is free; the abstract reflection group acts transitively, giving the reverse inclusion. For the zero-root case prove both Weyl groups trivial directly. No HR chamber/centralizer endpoint, CT period theorem, Layer7 complexification or later flag theorem is an input. For the kernel prove C_G(T)=T using only the earlier compact maximal-torus theorems: if g centralizes T, choose a maximal torus S containing g; both S and T lie in C_G(g)⁰ and are maximal there. Conjugate S to T inside C_G(g)⁰; that conjugation fixes g, hence g∈T. This avoids using HR’s later full Lie-algebra-centralizer theorem. Export the equivariant linear/root/coroot maps and reflection evaluations. The abstract closed-wall/stabilizer theorem belongs to RootSystems; the compact coadjoint chamber and centralizer application belongs to HamiltonianReduction R2. No integral T1 or downstream convexity endpoint is a premise of this real comparison.
- **Invariant volume and Haar.** Construct the left-invariant Riemannian volume
  from Layer5A's Ad-invariant form, prove bi-invariance and identify its normalized
  measure with CompactGroups Layer0's Haar probability by uniqueness. Prove the
  quotient/product integration and orientation/Jacobian comparisons used next.
- **The Weyl integration formula.** For a compact connected `G` with maximal torus `T` and normalized
  Haar `μ_G`, `μ_T`, and any class function (conjugation-invariant integrable) `f`,
  `∫_G f dμ_G = |W|⁻¹ ∫_T f(t) · |Δ(t)|² dμ_T(t)` with Weyl density `|Δ(t)|² = ∏_{α > 0} |1 - α(t)⁻¹|²`
  over the positive roots. This reduces integration over `G` to the torus, the general form of
  [../CompactGroups](../CompactGroups/README.md)'s `weyl_integration_formula` for `SU(2)`; specializing to
  `SU(2)` with `T = Circle` recovers `|Δ|² = 4 sin²θ` exactly. Consequence: **Weyl character
  orthogonality** for compact `G`, via the formula and the torus Fourier theory.

### Layer 7: complexification and real forms
- **Compact real forms of semisimple Lie algebras.** Own this construction
  before the group-level statements below. Consume LieHighestWeight Layer7's
  simple Chevalley/Serre presentation, not an unstated normalization of all
  root vectors. Define the conjugate-linear involution τ through the Serre
  universal property into the conjugate Lie algebra: its integer relations
  permit `h_i↦−h_i`, `e_i↦−f_i`, `f_i↦−e_i` and conjugation of scalars.
  Prove bracket compatibility and τ²=Id. Construct the full root-vector
  normalization by height induction and LieHighestWeight Layer0's sl₂ strings, proving the
  real structure constants and opposite-root sign relations used in the
  Killing calculation. For `H_τ(x,y)=−B_ℂ(x,τy)` (linear in x), prove
  Hermitian symmetry and `ad(e_i)†=ad(f_i)`, positivity on the Cartan,
  and positivity on root spaces by sl₂ height induction. Deduce negative
  definiteness of the real Killing form on the fixed real form, comparing
  real and complex Killing forms explicitly, and prove real-form descent.
  This Lie-algebra supplier uses no NoncompactQuantumSymmetry theorem;
  that roadmap consumes it and owns compatibility with an arbitrary real
  conjugation and the ensuing Cartan involution.
- **Complex tangent carriers, realification and exponential compatibility.** For a
  finite-dimensional complex Lie group H modelled on `𝓘(ℂ,E)`, use native
  `GroupLieAlgebra 𝓘(ℂ,E) H`, with its complex Lie bracket from left-invariant
  tangent vector fields. Consume [ComplexManifolds M1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/279)
  to construct H_R on the same carrier with the named realified model I_R,
  including multiplication and inversion.
  Construct the natural real-linear tangent equivalence
  from the underlying real vector space of `GroupLieAlgebra 𝓘(ℂ,E) H` to
  `GroupLieAlgebra I_R H_R`.
  Prove it preserves brackets by comparing the real and complex derivatives of
  the invariant fields in realified charts. Apply
  `leftInvariantDerivationLieEquivGroupLieAlgebra` only to H_R, with its real
  finite-dimensional smooth model and interior identity. Transport multiplication
  by i to that real derivation algebra; prove J²=−Id and complex bilinearity
  `[JX,Y]=J[X,Y]=[X,JY]`. This gives the complex-structured real derivation
  comparison without asserting a derivation equivalence on arbitrary complex
  smooth-function algebras. Prove naturality under holomorphic homomorphisms,
  adjoint maps and embedded real forms, including `Lie(K)⊗ℝℂ≃Lie(H)` for a
  specified real form and its Cartan/central restrictions. For such a real form
  require the actual complexified differential to be an isomorphism, with
  `dim_ℝ Lie(K)=dim_ℂ Lie(H)`; the realification of Lie(H) instead has twice
  that real dimension and is not the algebra being complexified in this map.
  Define the global `exp_H:Lie(H)→H` by transporting Layer0's real lieExp on
  H_R along the preceding equivalence. Prove holomorphy: Layer1's entire dexp
  integral commutes with multiplication by i because ad X is complex-linear,
  and complex translations have complex-linear derivatives. Hence exp_H has
  complex-linear real derivative everywhere; finite-dimensional complex calculus
  gives holomorphy. Its derivative at0 is identity; consume
  [ComplexKahlerGeometry K1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/953)
  for complex-manifold transport of the holomorphic inverse/implicit theorem,
  using the native strict-derivative inverse over ℂ, to obtain charts near0 and1. Naturality supplies included-real-subgroup
  compatibility. Compare holomorphic matrix groups with the unit exponential
  through the realified finite-dimensional algebra and native lieExp_eq_expUnit,
  retaining its hypotheses. For arbitrary source and target universes, prove the corresponding universe-polymorphic transport: use
  `ULift` type copies to transport the group, charted-space and Lie-group structures, the native
  `GroupLieAlgebra`, and the tangent equivalences, and prove the transports commute with the actual
  character/period maps and the universal property. State the complexification and holomorphic
  representation-extension targets for arbitrary allowed target universes; do not restrict the group,
  coefficient module, or representation class to the universe fixed by a prototype signature.
  Export the total-real chart for a specified real
  form. This global map on an already-given complex group is independent of the
  next construction of a new complex group by convergent complex BCH.
- **Universal complexification and its periods.** First construct the complex version of
  Layer 4's finite-dimensional integration theorem: holomorphic exponential charts from
  convergent complex BCH give the simply connected complex integration of a complex Lie
  algebra, and complex-linear Lie homomorphisms integrate holomorphically. Include the
  convergence, chart transitions and holomorphic multiplication/inversion proofs; the smooth
  local BCH germ alone is not this analytic result. For a connected real Lie group G, let
  p:G̃→G be Layer 5's universal cover, H the simply connected complex integration of
  g⊗ℝℂ, and j:G̃→H the integrated real inclusion. Construct the smallest closed complex
  subgroup N containing j(ker p), prove it is central, construct the complex quotient H/N,
  and descend j to η:G→G_ℂ. Prove universality among continuous homomorphisms from G
  to complex Lie groups, uniqueness, functoriality and the quotient Lie-algebra formula
  Lie(G_ℂ)≅(g⊗ℝℂ)/Lie(N). A reductive Lie algebra alone does not remove N or force η
  to be injective. This construction includes connected real reductive groups and their
  non-linear covers. For groups with finitely many components, extend the construction
  from G⁰: choose component representatives, extend their conjugation automorphisms to
  (G⁰)_ℂ, transport the component multiplication cocycle, prove its compatibility equations,
  and glue the corresponding copies of (G⁰)_ℂ. Prove independence of the representatives
  and the same universal property. The connected period-quotient construction is
  recorded in [Heins, Proposition 2.1](https://arxiv.org/html/2512.07479v1#S2);
  construct the quotient and all its descent laws here.
- **Compact semisimple integration.** Integrate a compact semisimple real Lie
  algebra k_s simply connectedly by Layer4. Its −Killing form gives a bi-invariant
  metric; compute all geodesics as all-time one-parameter groups and Ric=(1/4)g.
  Consume [HopfRinow Layer3](../../HopfRinow/README.md) completeness and
  [RiemannianGeometry R4.5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/935) Bonnet–Myers to
  prove this integration compact; the zero algebra gives a point. Its center
  is discrete and compact, hence finite. Deduce finite π₁ and compact universal
  cover for connected compact semisimple groups through Layer5's central kernel.
  These precede compact complexification and algebraic compact-form descent.
- **Finite faithful representations and compact-case polar geometry.** For every
  compact Lie group G, including all its components, consume [CompactGroups Layer5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1047)'s
  independent Peter–Weyl point separation and unitarization. Own the finite Lie-group
  consequence: intersect finitely many derivative kernels to get an injective
  differential, giving a discrete compact and therefore finite residual kernel;
  add finitely many representations separating its nonidentity elements. This
  constructs a faithful finite-dimensional unitary ρ:G→U(V), smooth by Layer2.
  Extend ρ to ρ_C:G_C→GL(V) by the already-constructed finite-dimensional universal
  property, before any representation-equivalence theorem. Since ρ=ρ_Cη, η is
  injective; compactness gives its topological embedding. The differential is
  injective after complexification because dρ(g)⊂u(V) is totally real, and the
  universal Lie-algebra quotient formula then makes dη_C an isomorphism.
  For K=ρ(G) construct P=K exp(i k)⊂GL(V). Consume [CotangentLagrangian C2.0](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1049)'s ambient complex
  unitary/positive polar decomposition and logarithm, and prove that this is a closed embedded
  submanifold with unique smooth polar coordinates K×k. Its left-trivialized
  tangents equal k_C by the entire dexp formula. Construct its complex subgroup
  and holomorphic atlas by local exponential/leaf uniqueness; K normalizes k_C,
  so the construction includes all components. Prove P's universal property:
  polar coordinates give π1(K0)≅π1(P0), hence extension of the differential
  descends through exactly the compact periods; then check the finite component
  representatives, conjugation and multiplication cocycle. Identify P with G_C
  by uniqueness of the universal property and prove naturality under faithful
  representations. This compact-case construction takes no general Layer9 theorem.
- **The compact complexification theorem.** For every compact Lie group G obtain
  the smooth polar diffeomorphism G×g→G_C, (g,X)↦η(g)exp(i dη(X)), with the
  preceding complexified differential and embedded η. Every compact subgroup
  containing η(G) equals it: divide by the compact polar factor, then bounded
  positive and negative powers of a positive Hermitian exponential force X=0.
  Thus η(G) is maximal compact; retain toral lattices, finite semisimple centers
  and the actual identification π0(G)≅π0(G_C). Prove the full identifications
  U(n)_C≅GL_n(C), SU(n)_C≅SL_n(C), SO(n)_C≅SO_n(C) and Sp(n)_C≅Sp_2n(C),
  including embeddings and differentials. Noncompact groups and nonlinear covers
  retain the general universal construction and all actual kernel/period data;
  they are not asserted compact or maximal compact in their complexifications.
- **Algebraic realization of compact complexifications.** Before Layer 8 applies algebraic Bruhat or
  Borel–Weil to a compact group's complexification, construct for every compact connected `K` a connected
  affine reductive algebraic group `𝐊` over `ℂ` and an analytic group isomorphism
  `𝐊(ℂ) ≃ K_ℂ` to the Layer 7 universal complexification. A proof route starts with a faithful unitary representation `ρ:K→U(V)` on a finite-dimensional complex vector space `V`, extends it by the already-constructed universal
  property as a homomorphism `ρ_C:K_ℂ→GL_ℂ(V)` and defines `𝐊` to be the Zariski closure of `ρ(K)`
  in `GL_ℂ(V)`. Prove that `𝐊` is connected and reductive and that `ρ_C` identifies `K_ℂ` analytically
  with `𝐊(ℂ)`: establish the extension's image and kernel, surjectivity onto the complex points, and
  differential and period comparisons. Zariski density or a Lie-algebra comparison alone is insufficient. Transport the actual maximal torus, root subgroups and full
  character/cocharacter lattice, including central and isogeny data. A dense-image or Lie-algebra
  comparison alone is insufficient. This LG7 construction is independent of LG8 and RG7; RG7 then supplies
  the single generic algebraic Bruhat theorem used in Layer 8.

- **Real forms and global descent.** A real form of a complex Lie group H consists of
  a real Lie group R, a specified closed smooth embedding R→H, and the induced complex
  Lie-algebra isomorphism Lie(R)⊗ℝℂ≅Lie(H). Define the identity-component and full
  fixed-subgroup variants for an antiholomorphic group involution. Prove that its fixed
  identity component is an embedded real form, and compare the full fixed subgroup
  by its actual component group. For a connected complex H with universal cover
  H̃ and period subgroup D, integrate a real Lie-algebra form's conjugation to the
  antiholomorphic involution σ̃ of H̃. Prove it descends to H exactly when σ̃(D)=D;
  then identify the connected embedded real form with the fixed identity component,
  and require the actual inclusion R⊂H^σ together with equality of its displayed
  component image for a full fixed-group identification. Abstract component-group
  data alone do not supply that inclusion.
  Include the regression H=ℂ/(ℤ+(√2+i)ℤ), R=ℝ/ℤ: R is a closed embedded real form,
  but its conjugation does not preserve the period lattice, so no antiholomorphic
  group involution fixes R pointwise. Component conditions alone do not supply descent.
  For a connected complex Lie group H with a specified biholomorphic group
  isomorphism `H≃G(ℂ)`, take G smooth connected affine reductive over ℂ as in RG6,
  with RG1's faithful closed algebraic immersion `G→GL(V)`. Consume the explicit
  lower [FormalConnectionsOpers F2.4/F4.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c9f4ac867e9f22bbf6f71d6f5c4a361ab9f0e622/TauCetiRoadmap/FormalConnectionsOpers/README.md)
  dictionary: native Hopf points with matrix-subspace topology/complex atlas,
  algebraic tangent↔complex GroupLieAlgebra with brackets, Z(G)⁰ as an RG4 torus,
  and G_der(ℂ) as its closed connected complex subgroup, including the central
  multiplication isogeny and finite kernels. These are data supplied before
  compact forms or compact Chevalley; generic L7 carriers/exp use no FCO input.
  Integrate the compact semisimple form by the compact simply connected theorem
  above. Its image in the closed derived subgroup is compact; combine with the
  central torus's compact part and descend through the specified finite kernel.
  Prove this is a compact real form. Own conjugacy: for compact semisimple
  conjugations τ,τ′ prove σ=ττ′ positive self-adjoint for −B(x,τy); construct
  positive powers as Lie automorphisms and show log σ is a derivation. Consume
  native `LieDerivation.IsKilling.exists_eq_ad` for the finite-dimensional
  complex Killing-semisimple summand to write log σ=ad Z, and realize
  `σ^(−1/2) τ σ^(1/2)=τ′` by Ad(exp_H(−Z/2)). Check central-kernel descent.
  First prove conjugacy for connected compact real forms, treating the central
  algebraic torus by its character lattice. For this connected LINEAR reductive H,
  prove the constructed K0 has a compact-case polar decomposition onto H. Prove
  N_H(K0)=K0 exp(i z(k0)), with quotient a split vector group, from the positive
  adjoint operator in polar coordinates. Any compact real form R has R0 inner
  conjugate to K0 and normalizes R0; its compact image in that split quotient
  is trivial, hence R=R0. Thus every compact real form of this H is connected
  and the full compact-real-form conjugacy follows. This connectedness theorem
  is not asserted for arbitrary connected complex period quotients. For a connected H
  whose Lie algebra is merely reductive, retain its actual discrete central subgroup D
  in its simply connected complex integration. Prove the compact-complexification
  criterion: H is the universal complexification of a compact Lie group if and only
  if there is a compact Lie-algebra real form k whose connected real subgroup K̃
  in that integration contains D and has compact quotient K̃/D. Construct the
  resulting compact real form and prove the universal complexification identification
  in both directions. Distinguish this from existence of a compact embedded real form:
  ℝ/ℤ embeds as such a form in ℂ/(ℤ+iℤ), while its universal complexification is
  ℂ/ℤ≅ℂˣ and the induced map onto ℂ/(ℤ+iℤ) has a nontrivial discrete kernel.
  Retain these actual quotient maps and lattices. Reductivity of Lie(H) alone is
  not a compact-real-form existence theorem.
- **Representations and holomorphic descent.** Representations land in the group
  GL(V)=(V→L[ℂ]V)ˣ, with holomorphy of group homomorphisms an explicit condition.
  For compact G, construct the restriction equivalence between finite-dimensional
  holomorphic representations of G_ℂ and continuous representations of G, including
  its action on intertwiners, inverse functor, unit and counit, and tensor/dual compatibility.
  For connected G, extend the differential complex-linearly and integrate it on H above.
  By uniqueness its restriction along j equals the original representation pulled back
  along p; hence its closed complex kernel contains j(ker p), and therefore N. Descend
  through H/N and prove uniqueness there. For finite components check the extended
  conjugation and multiplication-cocycle equations as well. This proves descent using
  the original representation's period law; it does not assume G_ℂ is simply connected.
  Check G=Circle, G_ℂ=ℂˣ and all integral characters as the toral regression. Compare
  the connected compact highest-weight classification with
  [LieHighestWeight](../LieHighestWeight/README.md), and with
  [CompactGroups](../CompactGroups/README.md)'s representations and characters. Generic
  Peter–Weyl remains CompactGroups' independent Haar/compact-operator construction.

### Layer 8: Borel-Weil, flag manifolds, and Bruhat

- **Borel subgroups and the flag manifold.** The inputs are (i) a compact connected Lie group `K`, its Layer 7 universal complexification `K_ℂ`, and the Layer 7 algebraization comparison `𝐊(ℂ)≃K_ℂ`; or (ii) a connected affine reductive algebraic group `𝐆` over `ℂ`, with its analytic group `𝐆(ℂ)` identified by the RG6/FCO lower dictionary and its compact form `K` constructed by Layer 7's algebraic compact-form specialization from that lower dictionary. Thus case (ii)'s compact form is a later Layer 7 output, not an input supplied by the lower FCO dictionary. In either case work with the resulting actual affine reductive algebraic group `𝐆` and its full character/cocharacter lattice, maximal torus `𝐓`, and positive-root system. Construct the algebraic Borel `𝐁=𝐓⋉𝐍₊`, where `Lie(𝐍₊)=⊕_{α>0}𝔤_α`; use its algebraic characters as holomorphic characters of `𝐆(ℂ)`. The quotient `𝐆(ℂ)/𝐁(ℂ)` is the compact complex flag manifold, and RG7's generic algebraic Bruhat theorem applies to `𝐆` before transport through the specified analytic isomorphism. The diffeomorphism `K/T≅𝐆(ℂ)/𝐁(ℂ)` follows from the Layer 7 compact-form/algebraization comparison; it is not asserted for an unrelated real group. In particular, the elliptic complex torus `ℂ/(ℤ+iℤ)` is not a linear complex reductive group and is outside these hypotheses.
- **Bruhat and Schubert geometry.** ReductiveGroups RG7 is the single owner of the generic Bruhat/root-data theorem `G_ℂ=⨆_{w∈W}B w B`. Apply it to the preceding groups and construct Schubert cells `BwB/B`, their complex dimensions `ℓ(w)`, the flag CW structure, and cohomology.
- **Borel–Weil and Borel–Weil–Bott.** For the preceding connected linear complex groups, choose the actual algebraic Borel `B_+` and a holomorphic character `χ:B_+→ℂˣ` arising from the actual group character lattice. Form `E_χ=(G_ℂ×ℂ)/((g b,z)∼(g,χ(b)z))`; sections are holomorphic functions with `f(gb)=χ(b)^{-1}f(g)`, and `(a·f)(g)=f(a^{-1}g)`. For a dominant integral character `λ` in that lattice, retain `L_λ=E_{−λ}` and prove `H⁰(G_ℂ/B_+,L_λ)≅L(λ)^*=L(−w₀λ)`.
  The coefficient map l↦(g↦l(gv_λ)) fixes the representation convention.
  Prove the equivalent realizations H0(G_C/B−,E_{+λ})≅L(λ) and
  H0(G_C/B+,E_{w0λ})≅L(λ), with their base/character identifications. For B+
  and +λ prove vanishing when some simple-coroot pairing is positive by the
  negative-degree rank-one Schubert-curve restriction. Pure central characters
  have their one-dimensional sections and are retained. Use the actual
  character lattice of the given group, not all abstract weights of its algebra.
  Construct the higher cohomology groups and PROVE Borel–Weil–Bott: for a fiber
  character χ put μ=−χ. If μ+ρ is singular all cohomology vanishes; otherwise
  let w(μ+ρ) be dominant and prove the only nonzero group is in degree ℓ(w),
  isomorphic to L(w(μ+ρ)−ρ)*, including the central factor and base-change of
  Borel. For finite-component compact groups retain the representation and
  component-cocycle applications from Layer7 rather than identifying their
  section spaces with connected highest-weight irreducibles without that data.

### Layer 9: the Cartan, Iwasawa, and KAK decompositions

- **Global real-reductive inputs.** In this layer a global matrix-cover model
  consists of a closed transpose-stable H≤GL_N(R), with finitely many components,
  its matrix Lie structure, and a specified finite central covering π:G→H.
  Construct its Cartan automorphism as the lift of h↦(h^T)^{-1} that fixes
  the ENTIRE compact preimage π^{-1}(H∩O(N)) pointwise. Use matrix polar
  coordinates and cover path-lifting, then prove multiplicativity and involutivity
  with the actual component/kernel data. A merely compatible lift need not fix
  the kernel or represent all components, so that weaker datum is not used. This is global input, not merely
  reductivity of Lie(G). Construct such a model for connected semisimple G with
  finite center and a positive integrated Lie Cartan involution: the faithful
  adjoint image with its Cartan metric supplies H, and G→Ad(G) is the finite
  central cover. Consume only the pre-polar part of [NoncompactQuantumSymmetry M0](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1015): its compatible compact real form, positive Cartan involution, adjoint-image comparison, and finite-cover construction that precede its instruction to consume Layer9 polar decomposition. Layer9 owns the global matrix-cover model and polar application, including nonlinear finite covers. M0's later polar/lift application consumes Layer9 and is downstream. Construct
  compatible models for the finite central products with compact central tori
  and split vector groups, and for finite extensions with compatible component
  data. Identify the central period lattice: θ fixes the compact central torus,
  negates the split vector factor, and exp on that split center is injective and
  proper. Prove the model construction and its independence/comparison before
  using it. Arbitrary infinite central covers and general period quotients keep
  their full Layer7 theory; no compact-fixed polar theorem is inferred for them.
- **Cartan decomposition.** For these actual global models first prove matrix
  polar factors remain in H, identify K_H=H∩O(N) and its compactness/maximality,
  and prove K_H×p_H→H a diffeomorphism. Transfer through the finite central cover:
  construct the compatible involution θ, prove K=π^{-1}(K_H)=G^θ, and lift the
  smooth inverse/factorization with the actual kernel and component data. Thus
  k=ker(dθ−1), p=ker(dθ+1) and (k,X)↦k exp X gives K×p≅G. The connected
  semisimple finite-center specialization proves these conclusions from the
  integrated positive Cartan involution via its adjoint model, without assuming
  maximality first. GL_n(R) is the orthogonal/symmetric polar example and consumes
  CotangentLagrangian C2.0's ambient real polar map. For the matrix applications take
  H=C_R, the realification of GL_n(C) in GL_{2n}(R), or H=Sp_{2n}(R), with π=id.
  Establish closedness, transpose stability and connectedness of each selected H, and identify its
  maximal compact K_H with the standard realification of U(n). For both matrix applications consume
  C2.0's ambient polar coordinates, then C2.1's direct matrix-intersection, subgroup-polar-preservation,
  trace-growth and maximal-compact constructions for the selected GL/Sp groups. C2.1's direct matrix
  arguments are primary constructions of these concrete maximal-compact conclusions. The generic
  Layer9 theorem is independent of C2.1; only the selected matrix applications consume those results. The compact semisimple finite-center
  branch remains a separate application from the
  integrated positive-Cartan/adjoint model and retains its own finite-cover hypotheses. A circle
  with inversion and compact fixed {±1} is not such compatible central data.
- **Iwasawa decomposition.** The general theorem retains its full input: any closed, connected exponential subgroup N normalized by a whose Lie algebra complements k+a. Prove its nilpotence and the global K×A×N diffeomorphism from exactly those hypotheses. Separately construct the canonical root-generated subgroup N₊ from the restricted-root decomposition and prove it satisfies those KAN hypotheses when applicable; do not define the arbitrary complement N to be N₊.
  The simultaneous real a-weight decomposition has g_0=m+a, so n_0=0. Put
  s=a⋉n; invariance of its OWN Killing form gives B_s(s,n)=0: a pairs trivially
  with nonzero weights, and opposite n-weights bracket to n_0=0. Since [s,s]⊂n,
  consume native Cartan solvability criterion to prove s solvable. Complex Lie
  triangularization gives an invariant flag; choose its orthonormal basis using
  the selfadjoint a action. Then a is real diagonal and n=[a,n] strictly upper
  triangular, proving its nilpotence, polynomial exp/log and injective N image.
  Prove AN is a closed positive-diagonal/unipotent subgroup with K∩AN={1},
  first in the matrix model, then on its finite cover (AN is simply connected).
  Its action on G/K is proper since AN is closed and K compact, and its orbit
  has an invertible differential by the complement. The orbit is open and
  closed; G/K is connected because K meets every component. Thus G=ANK,
  inversion gives KAN, and the intersections give uniqueness. Prove smoothness
  of the inverse from the local differential and these global identifications.
  No extra nilpotence or KAN-conclusion field is assumed. The positive-root N₊ is a separate
  distinguished instance; comparing it with an arbitrary admissible N is a theorem.
  GL_n(R)/SL_n(R) recovers Gram–Schmidt.
- **Restricted roots and KAK.** Build the possibly nonreduced restricted root
  system and the actual normalizer quotient N_K(a)/Z_K(a). Use the separately constructed
  N₊ for the canonical positive chamber and KAK; any relation to the arbitrary KAN complement N
  must be proved rather than imposed by definition. Define a_bar_plus={X∈a | α(X)≥0 for all
  positive restricted roots}; its lineality contains the ENTIRE split center. Prove the compact normalizer representatives
  give the restricted reflections, root chambers and every orbit's intersection
  with this closed chamber, including walls and the zero-root case. First prove
  Ad(K)a=p by the maximal-abelian symmetric-pair argument. With Cartan's polar
  theorem this yields G=K exp(a_bar_plus) K and uniqueness of the middle factor
  modulo the actual restricted Weyl action. A spanning arbitrary cone is not the
  chamber input. Structure is retained; spherical/Harish–Chandra harmonic analysis
  is downstream work with its own scope.

---

## Worked examples (acceptance criteria)

- **The circle `Circle` and its exponential.** `Circle` is a one-dimensional compact connected abelian Lie
  group with `Lie(Circle) ≅ ℝ`; `lieExp` specialized to `Circle` **is** Mathlib's `Circle.exp`, with
  `Circle.exp_add` the one-parameter-subgroup law and `Circle.exp_zero` the unit. `Circle` is its own
  maximal torus, `weylGroup = 1`, and `Circle_ℂ = ℂˣ`. Acceptance: `lieExp = Circle.exp` up to the
  identification `Lie(Circle) ≅ ℝ`, and the Weyl integration formula degenerates to `∫_{Circle} = ∫_T`.
- **`GL_n(ℝ)` and the matrix exponential.** `Matrix.GeneralLinearGroup (Fin n) ℝ = (Matrix (Fin n) (Fin n) ℝ)ˣ`
  has `Lie(GL_n) = Matrix (Fin n) (Fin n) ℝ` and `lieExp = Matrix.exp`; `Ad g X = g X g⁻¹`,
  `ad X Y = X*Y - Y*X`, and `Ad (exp X) = exp(ad X)` are checked directly via
  `Matrix.exp_conj`, `Matrix.exp_add_of_commute`. Acceptance: the abstract Layer-0/1 statements, restricted
  to `Rˣ` with `R = Matrix (Fin n) (Fin n) ℝ`, become the `NormedSpace.exp` / `Matrix.exp` identities.
- **`SU(2)`, `SO(3)`, and the double cover.** `SU(2) = Matrix.specialUnitaryGroup (Fin 2) ℂ` has
  `Lie(SU(2)) = ` skew-Hermitian trace-zero matrices `≅ ℝ³` with the cross-product bracket;
  `SO(3) = Matrix.specialOrthogonalGroup (Fin 3) ℝ` has the same Lie algebra. `Ad : SU(2) → SO(3)` (the
  adjoint on `𝔰𝔲(2) ≅ ℝ³`) is a **surjective** homomorphism with kernel `{±1}`, exhibiting `SU(2)` as the
  **simply-connected double cover** of `SO(3)` (Layer 5), and `lieMap Ad : 𝔰𝔲(2) ≅ 𝔰𝔬(3)` is the
  Lie-algebra isomorphism of Layers 3-5. Acceptance: `SU(2)` is simply connected, `SO(3)` is not, and the
  covering `SU(2) → SO(3)` induces a Lie-algebra isomorphism.
- **The maximal torus of `U(n)`.** `T = ` diagonal unitary matrices `≅ (Circle)^n` is a maximal torus of
  `U(n) = Matrix.unitaryGroup (Fin n) ℂ`; every unitary matrix is conjugate into `T` (spectral theorem =
  torus exhaustion), all maximal tori are conjugate, `weylGroup T ≅ Equiv.Perm (Fin n)` (permuting the
  eigenvalues), and the Weyl integration formula is the classical `U(n)` eigenvalue-density formula
  `|Δ|² = ∏_{i<j} |z_i - z_j|²`. Acceptance: torus exhaustion for `U(n)` is the spectral theorem, and
  `weylGroup ≅ S_n`.
- **Complexification on the classical groups.** `(U(n))_ℂ = GL_n(ℂ)`, `(SU(n))_ℂ = SL_n(ℂ)`,
  `(SO(n))_ℂ = SO_n(ℂ)`; finite-dimensional representations of `SU(n)` extend to holomorphic
  representations of `SL_n(ℂ)`, matching [../LieHighestWeight](../LieHighestWeight/README.md)'s
  highest-weight classification and [../CompactGroups](../CompactGroups/README.md)'s Peter-Weyl. Acceptance:
  the `SU(2)` irreducibles `Sym^n(ℂ²)` of the compact-groups roadmap are the holomorphic `SL_2(ℂ)`-modules
  `L(n)` of the highest-weight roadmap, via Layer 7.

## Ordering

Layer 0 (the exponential map, one-parameter subgroups) comes first and consumes the existing
Tau Ceti derivation/tangent and exponential interfaces under their actual finite-dimensional,
`T2Space`, interior-point and boundaryless hypotheses. Layer 1 consumes the native `Ad` transport and
Mathlib's `LieAlgebra.ad`; Layer 2 consumes the native subgroup Lie-algebra carrier while constructing
the closed-subgroup theorem. Layer 3 consumes native `lieMap` and local BCH, while proving the
remaining global BCH estimates and integration consequences. Layer 2 (the closed-subgroup theorem) needs
Layer 0's `lieExp` chart and gives every matrix group its Lie structure, so it precedes all concrete
examples. Layer 3's Lie functor on smooth homomorphisms and the Banach-algebra and general-linear-group
proof of BCH need Layer 0. Passing from continuous homomorphisms to smooth ones and specializing to
closed matrix subgroups use Layer 2. Layer 4
(Frobenius, Lie's third, the equivalence of categories) needs Layer 3's functor and BCH and the Frobenius
theorem named within it; [Ado–Iwasawa](../AdoIwasawa/README.md) is the separately specified algebraic
prerequisite. Within Deliverable B the
dependency is acyclic: the **universal-cover construction** (the covering space, lifted group law, and
transported Lie structure) is logically prior to Lie's third theorem, which uses it; Lie's third then
feeds the equivalence of categories. Layer 5's remaining content (the connected-source refinement of the
functor and the enveloping algebra) needs Layer 4 and Mathlib's covering-space and enveloping-algebra
API, and cites [../LieHighestWeight](../LieHighestWeight/README.md) for PBW. Deliverable C uses the earlier real Lie functor/integration. Layer5A consumes Ad and CompactGroups Layer0 Haar. Layer6's preconjugacy block uses its torus/Kronecker and identity-centralizer/normalizer-finiteness targets, SBC B1.4's homogeneous quotients (its B1.1 specifies LGP G0.1) and DG10.3–10.5 degree/top-form comparison. Layer2's SU(2)≃S³/simple-connectedness argument uses DG10.2 before Layer4 integration is applied in Layer6. Root multiplicity/Cartan comparison uses native semisimple root-space results and LieHighestWeight Layer0 sl₂/integrality; RootSystems supplies abstract chamber transitivity. Continuous-relative smoothing and Sard avoidance remain actual Layer6 constructions consuming DG10.2. Identify invariant volume with Haar before Weyl integration. Generic L7 carriers/global exponential use ComplexManifolds M1, native `GroupLieAlgebra`, Tau's real derivation/tangent,
adjoint and unit-exponential comparisons, and Layers 0–2's real exponential and entire derivative; complex BCH
owns the separate complex integration. L7 and L9 use CotangentLagrangian C2.0's ambient real/complex polar
coordinates only in their respective matrix-subgroup applications. C2.1 owns the direct GL/Sp matrix compatibility,
subgroup polar preservation, maximal-compact constructions and trace-growth arguments. These are primary C2.1
constructions; the generic Layer 9 theorem is independent, and only its concrete GL/Sp applications consume them.
Compact semisimple integration uses the generic Hopf–Rinow completeness and RiemannianGeometry R4.5 Bonnet–Myers
targets. Generic L7 carriers, global exponential and realification precede the lower FCO F2.4/F4.3 dictionary.
That lower dictionary uses LG0–6 and only the generic pre-compact-form LG7 interfaces needed for its complex-point,
tangent, center/derived and root-generation constructions, together with the relevant RG1/RG4/RG6 contracts. RG7's
generic Bruhat theorem is used only later in Layer 8; the lower dictionary does not use LG7's algebraic compact-form
specialization, LG8, LG9 or C5.1. LG7 then uses the completed lower dictionary, actual RG1/RG4/RG6 data and
root-generation connectedness to construct its algebraic compact-form specialization. Its separate algebraization
target identifies `K_ℂ` with the complex points of an affine reductive algebraic group before LG8. Only after these
LG7 constructions does late FCO consume the compact form, the Layer 6 root/Weyl comparison and C5.1 for compact
restriction. Universal complexification retains Layer 4/5 integration and period data, Layer 6 tori, and
LieHighestWeight Layer 7 Serre data. Layer 8 (Borel–Weil) uses the group/compact-form inputs and actual character
lattice stated above, the root systems of [../RootSystems](../RootSystems/README.md), and `L(λ)` of
[../LieHighestWeight](../LieHighestWeight/README.md); generic Bruhat remains RG7's single-owner theorem. Layer 9
(Cartan/Iwasawa/KAK) needs Layer 7's real forms and Layer 6's tori. A contributor can complete Layers 0-3 (the exponential map and the Lie functor)
as a self-contained first deliverable, well before the integration theorems of Layer 4 or the structure
theory of Deliverable C. The layers are far from uniform in size. Each of Layers 6-9 (maximal tori and
Weyl integration; complexification and real forms; Borel-Weil with flag manifolds and Bruhat;
Cartan/Iwasawa/KAK) rests on large bodies of complex geometry, homogeneous spaces, sheaf cohomology, and
real-reductive structure, and is itself on the scale of an independent Mathlib-sized project: completing
Deliverable A makes their statements expressible, not cheap. A natural fracture, should this roadmap be
split, is `LieGroupsCore` (Layers 0-3), `LieIntegration` (Layers 4-5), `CompactLieGroups` (Layer 6),
`ComplexReductiveGroups` (Layers 7-8), and `RealReductiveGroups` (Layer 9), with only the cross-roadmap
interfaces kept here.

## References

- A. Kirillov Jr., *An Introduction to Lie Groups and Lie Algebras*, Cambridge Studies in Advanced
  Mathematics 113 (2008) - the exponential map, one-parameter subgroups, `Ad`/`ad`, the closed-subgroup
  theorem, the Lie functor and BCH, and the correspondence with Lie algebras (Chs. 2-3), the structure of
  compact groups and complexification (Chs. 5-8).
- D. Bump, *Lie Groups*, 2nd ed., Springer GTM 225 (2013) - the matrix-group exponential, maximal tori,
  the Weyl group and Weyl integration formula, complexification and real forms, the Borel-Weil theorem and
  the Bruhat decomposition, and the Iwasawa and Cartan decompositions (Parts I-III).
- A. W. Knapp, *Lie Groups Beyond an Introduction*, 2nd ed., Birkhäuser (2002) - the definitive treatment
  of the closed-subgroup theorem, the structure theory, complexification, restricted roots, and the
  Cartan/Iwasawa/KAK decompositions (Chs. I, IV-VII).
- T. Bröcker, T. tom Dieck, *Representations of Compact Lie Groups*, Springer GTM 98 (1985) - maximal-torus
  conjugacy and exhaustion, the Weyl group, the Weyl integration and character formulas, and the reduction
  of a compact connected group to its torus (Chs. IV-VI).
- B. C. Hall, *Lie Groups, Lie Algebras, and Representations*, 2nd ed., Springer GTM 222 (2015) - the
  matrix-Lie-group development of the exponential map, `Ad`, BCH, and the group-algebra correspondence,
  with `SU(2)`/`SO(3)` as the running example (Chs. 2-5).
- J.-P. Serre, *Lie Algebras and Lie Groups*, Springer LNM 1500 (1992) - the formal-group and BCH
  treatment of the local correspondence and Lie's third theorem.
- V. S. Varadarajan, *Lie Groups, Lie Algebras, and Their Representations*, Springer GTM 102 (1984) - the
  exponential map, the closed-subgroup theorem, Ado's theorem, and Lie's third theorem with the
  simply-connected integration in full detail (Chs. 2-3).
