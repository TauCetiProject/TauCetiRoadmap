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
  Finite-dimensionality (`[FiniteDimensional ℝ E]`) is the standing hypothesis of Layers0–5
  and the finite-dimensional structure theory. Layer5N specifies a separate **real Banach-Lie**
  branch with complete normed models, native identity tangents, Banach ODE/BCH and covering
  constructions, and an explicit nonintegrability example. That branch does not extend the
  finite-dimensional derivation–tangent equivalence or the closed-subgroup/Frobenius theorems
  to arbitrary Banach subgroups or distributions. Finite-dimensional Lie III remains Layer4;
  local Banach BCH does not imply global Banach integration. Above the finite-dimensional floor,
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
  On `G = Rˣ` for a real normed algebra with `[FiniteDimensional ℝ R]`, use the native
  derivation–tangent equivalence `Lie(Rˣ) ≃ R` and compare `lieExp` with `NormedSpace.exp`; on
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
- **The matrix and circle shadows.** For a real normed algebra `R` with
  `[FiniteDimensional ℝ R]`, consume native `unitsLieAlgebraEquiv` and `lieExp_eq_expUnit`
  from `TauCeti.Geometry.Lie.Exponential.Units.Compatibility` to identify the derivation
  algebra of `Rˣ` with `R` and its abstract `lieExp` with the unit exponential.
  The complete normed-algebra `TauCeti.expUnit`, its tangent one-parameter identity
  and the norm-series laws have their more general hypotheses; those do not assert
  an unrestricted Banach derivation–tangent equivalence. On matrix groups the value
  is `Matrix.exp`, with `Matrix.exp_diagonal`, `Matrix.exp_transpose` and `Matrix.exp_conj`;
  on the circle it is `Circle.exp`, with `Circle.exp_add`. Retain those specific comparisons.

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
- <a id="connected-adjoint-global-forms"></a> **Centers, adjoint quotients and
  marked global forms.** For connected G prove `ker Ad=Z(G)`,
  `ker ad=z(g)` and `g^Ad(G)=z(g)`, using exponential naturality and
  generation by an identity exponential neighbourhood. Identify the Lie
  algebra of the actual closed central subgroup by Layer2. Deduce that
  Z(G) is discrete iff z(g)=0, equivalently the adjoint representation
  has no nonzero invariant vector. For a smooth action of connected G,
  prove its fixed-point set equals the common zero set of all fundamental
  vector fields: uniqueness of their integral curves gives invariance
  under each exponential, and generation gives invariance under G.

  Prove that every discrete normal subgroup of connected G is central
  by its conjugation orbit, and use this to prove that G/Z(G) is
  centerless when Z(G) is discrete. Construct the actual quotient Lie
  group and its covering homomorphism with the stated differential.
  For a finite-dimensional real centerless Lie algebra g, let U be its
  simply connected integration from Layer4. Then Z(U) is discrete;
  construct `G_ad=U/Z(U)` and the faithful immersed adjoint map into
  Aut(g). Its Lie-group topology is the quotient/immersed topology;
  it is not asserted to be the subspace topology of its matrix image.

  Classify connected integrations with a specified Lie-algebra
  identification with g and isomorphisms preserving that identification:
  for every subgroup D≤Z(U), construct the smooth group U/D, the cover
  U/D→G_ad, and their kernels, differentials and inverse classification
  maps. Conversely integrate the marked identity from U to any such H;
  connectedness makes it onto with discrete central kernel D, and the
  quotient comparison is an isomorphism. Prove Z(U/D)=Z(U)/D by the
  discrete-normal-subgroup argument applied to its central preimage.
  Thus π₁(G_ad) identifies with Z(U), and this is the cover classification
  in general1 p3. If forgetting the marking, include the action of
  Aut(g) on these central subgroups instead of asserting an unmarked
  one-to-one correspondence with individual D. Treat g=0 as the point.
  The conclusions require connectedness and the stated centerless
  hypothesis: compare the finite Q₈ example and the native real
  Heisenberg group, whose quotient by its positive-dimensional center
  is abelian and has a nontrivial center.
<a id="connected-nilpotent-exponential"></a>
**Nilpotent global BCH coordinates and connected quotients.** For a
finite-dimensional nilpotent real Lie algebra n, construct the truncated
BCH polynomial on a type copy of its vector-space carrier, with the same
topology and smooth manifold. Specify a nilpotence bound: all Lie words
longer than it vanish, so Layer3's local BCH series has only finitely
many terms. Prove the global multiplication associative: both sides of
the associativity equation are polynomial maps and agree on an identity
neighbourhood by local BCH, hence agree everywhere. Prove unit0,
inverse−X and the smooth group laws, and identify its tangent Lie algebra
with n via the identity linear map. This BCH group is simply connected
by the vector-space contraction. Layer4's integration and uniqueness
identify it with the simply connected integration of n, with inverse maps.
Its one-parameter subgroup from X is t↦tX; thus its exponential is the
identity in these coordinates and is a global diffeomorphism. Prove
naturality under real Lie homomorphisms, not just coordinate existence.

For any connected finite-dimensional real Lie group H with nilpotent
Lie algebra h, consume Layer5's universal covering homomorphism p:H̃→H
and its actual Lie-algebra isomorphism dp. Compare H̃ with that BCH group
on h. Construct its discrete central kernel Γ=ker p and the smooth
quotient comparison H̃/Γ≃H. Exponential naturality gives
`p(exp_H̃((dp)⁻¹X))=exp_H(X)`, hence exp_H is surjective. For simply
connected H recover the global exponential diffeomorphism above. Contract
H̃ through its BCH coordinates and use AlgebraicTopology's covering
comparison to prove π_j(H,1)=0 for every j≥2; identify π₁(H,1) with Γ.
Connected H need not be contractible or have injective exponential.
Include the point and circle as boundary cases. These are the group
conclusions of Knutson's complex4 pp2–3. They do not weaken the simply
connected hypotheses of any orbit-method representation theorem.

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

### Layer 5N: Banach-Lie periods and an explicit nonintegrable algebra

This branch works over **ℝ on complete normed model spaces**, with Hausdorff, boundaryless
`C^∞` Banach manifolds and native `LieGroup`. An integration of a Banach Lie algebra means a
Lie group with a **continuous linear Lie equivalence with continuous inverse** from that algebra
to its identity tangent Lie algebra. It does not mean an abstract algebraic Lie isomorphism with
no topological compatibility. The counterexample below answers the infinite-dimensional existence
question in this precise category. It does not assign a category to an unqualified source assertion,
classify all locally convex groups, or assume that an arbitrary locally convex group is regular.

Use native `GroupLieAlgebra I G`, its `mulInvariantVectorField` and vector-field bracket. Its
actual complete-space and `LieGroup I (minSmoothness ℝ 3) G` hypotheses apply here. Do not extend
the finite-dimensional derivation–tangent equivalence to all Banach derivations. The existing
finite-dimensional Layers0–5 retain their stated generality. Neither Ado, finite-dimensional
Frobenius, nor a closed-subgroup theorem for arbitrary closed Banach subgroups is a prerequisite
or consequence of this branch.

**5N.1 Banach local and covering foundations.** Consume BanachSpaceTheory's actual complete normed
spaces, bounded multilinear maps and function-space completions; native real normed-algebra unit
charts and exponential; DifferentialGeometry 3.1–3.2 and3.5's
Banach local ODE/smooth-dependence extensions, 2.3's charts on covering spaces, and native
manifold derivatives. Build the following group-specific bridges here. Construct complete
one-parameter invariant flows by repeated translation of a common local time interval, the
Banach group exponential, its differential at0, the exponential/logarithm chart, and naturality.
Prove the native tangent bracket is continuous bilinear with a constructed bound C, not an
assumed norm bound1. Differentiate smooth group homomorphisms at1 to native LieHom, prove
continuity, identity/composition and exponential compatibility, and compare with existing finite
lieMap interfaces only under their actual hypotheses.
Construct convergent local BCH on a Banach Lie algebra with a bounded bilinear bracket, with an
explicit neighborhood controlled by a bracket bound, associativity on common domains, inverse,
restriction and continuous Lie-map functoriality. This is a local group for every such algebra,
not an assertion of global integrability. Compare it with the actual group exponential chart.
Build the smooth universal-cover group of a connected Banach Lie group by identity-based paths,
with lifted multiplication, local charts, covering homomorphism, central discrete kernel and
actual continuous tangent Lie equivalence. Banach manifolds are locally contractible; construct
path components, covering spaces and lifted charts under those hypotheses rather than infer
finite-dimensional local compactness. Prove **Banach Lie II**: a continuous Lie homomorphism out
of the tangent algebra of a simply connected Banach Lie group integrates uniquely to a smooth
group homomorphism. Construct the local homomorphism by BCH and extend along subdivided paths;
prove subdivision independence, invariance under based path homotopy, multiplicativity and
smoothness. This theorem has an already existing simply connected group as its source; it
asserts no Banach Lie III. All required Banach model, derivative and covering transports belong
to this phase.
Consume BanachSpaceTheory B5's scalar C¹ interval space with its complete sup/derivative-sup
sum norm. Build the needed Banach-valued path-space extension here as the closed value/derivative
graph in C([0,1],E)², with FTC/evaluation/differentiation and max-versus-sum norm API; identify
its scalar specialization with B5's actual space and finite-dimensional targets coordinatewise. Before the path construction below, give C¹ paths in an already supplied Banach Lie group
pointwise exponential charts, smooth product/inverse/superposition, and the fixed-initial-point
submanifold. Use finite covers of each compact path image for uniform chart estimates. The
periodic subspace and C¹ SU2 loop group in5N.3 specialize these early interval constructions;
they are not a prerequisite of this generic path-space floor.

**5N.2 Continuous central cocycles, periods and the integrability criterion.** Use native
`LieModule.Cohomology.twoCocycle`, `TrivialLieModule ℝ L ℝ` and
`LieAlgebra.ofTwoCocycle`, with its native inclusion/projection and bracket. Retain its actual
additive and scalar parents. Transport the product norm and topology along the actual native
linear coordinate equivalence, prove the coordinate equivalence is isometric and the inherited
module is a normed space, and transfer completeness. A continuous bilinear cocycle is a native
cocycle together with continuity of that same bilinear map, not an unrelated chosen extension.
Prove boundedness, centrality, exactness, changes by continuous coboundaries, pullback, scalar
pushout, products and their exact coordinate equations.

Let K be a connected, simply connected Banach Lie group, L its actual tangent algebra, and ω a
continuous real central2-cocycle. Build the smooth closed left-invariant2-form Ω whose value at1
is ω. Use `Additive` on the native positive-degree cubical `HomotopyGroup` for additive
notation; define `per_ω : π₂(K,1) →+ ℝ` by integrating the pullback over the **based oriented2-sphere**,
using smooth representative/homotopy comparison and actual derivative maps. Fix orientation,
concatenation and basepoint conventions, prove homotopy invariance using Stokes on the finite
parameter cylinder, additivity, smooth naturality and invariance under coboundary. This requires
no Banach manifold volume measure: only the pullback forms on finite-dimensional compact domains
are integrated. Own the relative smooth approximation for maps/homotopies from these compact
parameter domains into Banach charts, using finite covers and domain partitions; it must preserve
the designated basepoint/collar and commute with the continuous homotopy carrier. Reuse
DifferentialGeometry's forms, finite-domain integration/Stokes and degree, and AlgebraicTopology's
based homotopy maps; the Banach-target and loop-evaluation comparison adapters are built here.

Prove that `ofTwoCocycle ω` is integrable **if and only if** the subgroup `range per_ω` is discrete.
For necessity start with *any* integration, pass to its smooth simply connected cover and use
5N.1 LieII to integrate the actual projection to K. Its differential is the split projection;
prove the resulting homomorphism is a surjective submersion with local smooth sections. Its
kernel has identity component with Lie algebra ℝ. Use the actual local sections to construct
path and homotopy lifting, and the low-degree exact sequence
π₁(K)→π₀(kernel)→π₀(the simply connected covering group). Since the outside terms vanish,
prove that the full kernel is connected, hence equals its identity component. Prove its
centrality and that its exponential has a discrete kernel. Construct the associated principal-kernel bundle,
its connection from the fixed linear splitting, and the curvature/connecting-map identity
which puts every spherical period in that exponential kernel. No theorem is assumed asserting
that an arbitrary integration was already supplied as a central extension. For sufficiency,
construct the extension with kernel ℝ/`range per_ω`: use based paths and path homotopies, identify
two central coordinates by the integral of Ω over a spanning homotopy, prove independence
modulo the period subgroup, and build the group law, local smooth trivializations, inverse,
projection and differentiated bracket. Simple connectedness removes the separate descent/flux
obstruction; do not assert this sufficiency for a non-simply-connected base without additional
descent data. Discreteness includes the zero subgroup. Construct the zero-period and cyclic-period
cases, and prove actual naturality for products and central linear pushouts. This is the reusable
period theory used in the example, not a certificate postulating the desired obstruction.

**5N.3 Actual C¹ periodic loops and their group.** Let
`k={A : Matrix (Fin2) (Fin2) ℂ | Aᴴ=−A ∧ trace A=0}`, as a real native Lie subalgebra
with the inherited finite-dimensional topology. For the normed function-space construction,
use the topology induced by the actual matrix-submodule norm and prove that the identity map
identifies it with that inherited matrix-subtype topology. Use the standard matrix `SU(2)` and its actual
tangent comparison from Layer2; no new su₂ or matrix-group carrier is introduced. Define B to be
C¹ periodic k-valued functions on ℝ of period1, with norm equivalent to
`sup_[0,1] ‖f‖ + sup_[0,1] ‖f′‖`. One concrete complete model is the closed submodule of
`C([0,1],k)²` consisting of `(f,d)` with equal endpoint values for f and d and
`f(t)=f(0)+∫₀ᵗ d(s)ds`. Prove closedness, completeness, the derivative/restriction/periodic-extension
bijection, norm equivalence and its inverse, including derivatives at the seam. Use the inherited
product max norm in this model; it is not literally the sum norm. The bracket is
`([f,g],[f′,g]+[f,g′])`; prove closure, the native Lie identities in the original addition,
continuity/bounds, evaluation, constant-loop, differentiation and periodic-translation equations.
Prove the center is zero by evaluation against every constant su₂ loop.
The trigonometric loops along a fixed nonzero element prove B is infinite-dimensional.

Construct the actual group `K=C¹(ℝ/ℤ,SU(2))`, with pointwise multiplication/inverse and the C¹
topology. Give it Banach charts by left-translating pointwise finite-dimensional exponential/log
charts on a common uniform neighborhood. Prove the superposition, product and inverse estimates,
chart-transition smoothness, evaluation/constant-loop smoothness, and a continuous tangent Lie
equivalence `Lie(K)≃B` whose bracket is the preceding pointwise bracket. Own the based-loop
subgroup and explicit splitting `g↦(g(0), t↦g(0)⁻¹g(t))` as a manifold/topological-space product;
its group law is semidirect, not silently the direct-product law. Construct compact-parameter
relative smoothing from continuous loops to C¹ loops and compare it with the existing native
`HomotopyGroup.pathLoopSpaceMulEquiv` / `loopSpaceMulEquiv` and `prodMulEquiv`,
including their actual maps on homotopy classes and the oriented sphere generator. Consume Layer2's matrix `SU(2)≃S³`, the native based
homotopy carriers and AlgebraicTopology's sphere homology/Hurewicz. First prove that K
is path-connected: a loop in SU(2) is nullhomotopic since π₁SU(2)=0, and the owned relative
loop smoothing supplies a path through C¹ loops. Thus the π₀ comparison is explicit before
proving π₁K=0 and calling K simply connected. Prove `π₂K≃π₃SU(2)≃ℤ`. In particular prove π₂S³=0 before using simple connectedness of K.
No equivalence of C¹ Banach loops with smooth Fréchet, algebraic, formal or Laurent loops is asserted.

**5N.4 Nonzero cyclic seed periods, with an actual transgression calculation.** Fix the real
invariant symmetric pairing `κ(A,B)=−Re(trace(A*B))` and the cocycle
`ω(f,g)=∫₀¹ κ(f(t),g′(t))dt`. Prove bilinearity, a norm bound, alternation by integration by
parts with equal endpoints, and the cocycle identity by trace invariance and the integral of
`d κ(f,[g,h])`. Package that exact operation as the native central cocycle. On SU(2) define
the left-invariant3-form `H(X,Y,Z)=½κ(X,[Y,Z])`. Pin the orientation by the ordered matrices
`E₁=diag(i,−i)`, `E₂=[[0,1],[−1,0]]`, `E₃=[[0,i],[i,0]]` and the quaternionic unit-sphere
map at1. Compute `[E₂,E₃]=2E₁` cyclically, `κ(E_i,E_j)=2δ_ij` and `H(E₁,E₂,E₃)=2`.
For the *Euclidean* unit S³, prove these vectors are a positively oriented orthonormal tangent
frame at1 and translation preserves that metric and orientation. Thus H pulls back to twice
the oriented standard sphere volume form. Define `d=∫_{SU(2)}H` through that explicit comparison
and prove d>0; no guessed 2π normalization is needed. If the sphere-volume endpoint is evaluated,
the same calculation gives d=4π² in these conventions.

For every C¹ loop g write j=g⁻¹∂ₜg as a **continuous** k-valued loop, not necessarily C¹,
and use the C¹ left logarithmic tangent ξ. Construct this smooth map from K to the C⁰ function
space with its uniform norm. Define `β_g(ξ)=½∫κ(j,ξ)` and `τH_g(ξ,η)=∫H(j,ξ,η)`. Prove in the C¹ Banach charts that
`dβ=−Ω+τH`, using `δ_ξj=ξ′+[j,ξ]` and the periodic boundary term. Use smoothing/naturality
to obtain the identity for spherical periods in the actual C¹ group. With the oriented evaluation
map from sphere×circle, transgression sends the actual π₂K generator to the oriented π₃SU(2)
generator. Degree theory then gives `range per_ω=dℤ`. Prove both inclusions: every sphere has an
integer degree, and the adjunction supplies a generator with period d. The **seed extension is
integrable**, by5N.2, with central circle ℝ/dℤ. Its nonzero period is the ingredient for the
counterexample, not a claim that this seed is nonintegrable.

**5N.5 Irrational quotient and nonintegrability.** For each real θ define on B×B
`ω_θ((f₁,f₂),(g₁,g₂))=ω(f₂,g₂)−θω(f₁,g₁)` and let Eθ be the native central extension with
this exact cocycle, product topology and norm transported as in5N.2. Define the continuous
surjective Lie homomorphism from the product of two seed extensions by
`((f,a),(g,b))↦((f,g),b−θa)`. Its kernel is the closed central line
`{((0,t),(0,θt)) | t∈ℝ}`. Construct the actual quotient-to-Eθ continuous linear Lie equivalence,
its inverse on representatives and its norm/topology compatibility. This is a quotient of
Banach **Lie algebras**, not an assertion that the quotient of integrating groups by a dense
subgroup is a Hausdorff Lie group.

Use the actual two factor inclusions, projections and the homotopy product map to obtain
`per_ωθ(m,n)=d(n−θm)` and the exact subgroup `d(ℤ+θℤ)`. The coordinate is b−θa; it sends
(d,0) to −θd and (0,d) to d. Do not identify class(1,0) with class(0,1) or retain a coefficient
from a different quotient basis. For irrational θ prove this subgroup is dense in ℝ and has
nonzero elements tending to0 (pigeonhole approximation suffices), hence is not discrete.
Apply necessity in5N.2 to exclude **every** Banach Lie group integration of Eθ. Prove Eθ is
complete, Hausdorff, infinite-dimensional, with a bounded Lie bracket, and that its local BCH
group nevertheless exists. For rational θ=a/b in lowest terms, b>0, prove its period group
is `(d/b)ℤ` and construct an integration by sufficiency; θ=0 recovers the seed on the second
factor times the first loop group. These checks locate the failure in global periods rather
than local ODE or Jacobi identities. The source-existence corollary can take θ=√2 with the
actual irrationality theorem; it makes no claim that the source intended this example or category.

**5N.6 Comparisons and usable boundary API.** Prove all projection, inclusion, bracket, norm,
central kernel, period and quotient equations, functoriality under continuous Lie maps and
coboundary changes, and compatibility of native identity tangents with the chosen group charts.
For finite trigonometric loops in the complexification compare with the **existing** native
`loopAlgebra`, `residuePairing` and `twoCocycleOfBilinear`, not a second affine engine.
For `f(t)=Σ_m A_m e^(2πimt)`, `g(t)=Σ_n B_n e^(2πint)` the complex-bilinear continuation of κ
is −trace(AB), so `ω(f,g)=−2πi Σ_n n trace(A_−n B_n)`. This uses differentiation on the
second argument. Pin the finite-support coefficient map, trace form, reality condition
`A_−m=−A_mᴴ`, central rescaling −2πi, and the actual commuting bracket square. The Laurent
sum is finite; no unsupported assertion that the Banach completion is a formal affine algebra
or that a Lie-algebra isomorphism identifies their global integration problems is made.

Suggested companion `BanachNonintegrabilityTargets.lean` illustrates the actual curve graph,
cocycle and quotient coordinates and selected final theorem shapes. README remains definitive;
the companion is not exhaustive. The constructions and period proofs above are commissioned
mathematics, not existing implementations or assumptions hidden in a period certificate.


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
<a id="space-of-maximal-tori"></a>

- **The space of maximal tori and its universal cover.** For compact connected
  K and maximal torus T, put N=N_K(T), W=N/T and `Tor(K)=K/N`, with the native
  homogeneous quotient topology and basepoint N. Construct the bijection
  `[k]↦kTk⁻¹` with the set of maximal torus subgroups and its inverse; give that
  set the orbit quotient topology. Prove the stabilizer is exactly N, identify
  the conjugation action of K with left translation on K/N, and prove that
  changing the reference maximal torus gives the same topology on this set.
  Use the closed-subgroup homogeneous-space construction from Layer2 and
  [SmoothBundlesConnections B1.4](../../SmoothBundlesConnections/README.md)
  for the actual smooth quotient structures and projection maps.

  Construct `p:K/T→K/N`, `[k]_T↦[k]_N`, with the commuting quotient square.
  First export `SimplyConnectedSpace (K/T)` from the preceding regular-chamber
  argument: its diffeomorphism `K/T×C≃g_reg`, the convex chamber C and the
  proved simple connectedness of g_reg give this result without a hypothesis
  that K is simply connected. Then construct the free right action
  `[k]_T·[n]_T=[kn]_T` of W, proving independence of both representatives,
  continuity, and that its orbits are exactly the fibres of p. Give finite
  evenly covered neighbourhoods and the homeomorphism `(K/T)/W≃K/N`.
  Thus p is the universal covering, with |W| sheets. Identify its whole native
  `deck p` group with `Wᵐᵒᵖ` by `[n]↦([k]↦[kn])`, including surjectivity
  from uniqueness of deck transformations on the connected total space.

  With chosen lift `[1]_T` over N, construct
  `FundamentalGroup (K/N) N ≃* W`. Characterize it by lifted endpoints:
  a loop class maps to `[n]` exactly when its lift from `[1]_T` ends at
  `[n]_T`. Pin the multiplication convention using native
  `FundamentalGroup.mul_def`, where `a*b=b.trans a`; the right deck action
  and its opposite group then give the displayed group isomorphism. Reuse
  native `IsCoveringMap.monodromy` and
  `TauCeti.Deck.IsRegular.fundamentalGroupEquiv` from
  `TauCeti.AlgebraicTopology.UniversalCover.Deck.FundamentalGroup.Basic`.
  Do not replace either covering theory or the fundamental group by a
  private carrier. Export the inverse loop construction, homotopy invariance,
  and change-of-torus/basepoint-path squares, with the resulting inner
  conjugacy ambiguity when a basepoint path changes.

  Construct the associated bundles of Lie algebras, character and cocharacter
  lattices of these maximal tori from N's conjugation action; T acts trivially
  on these fibres, so the structural action factors through W. Prove their
  monodromy through the displayed isomorphism is the actual Weyl action:
  `X↦Ad_n X`, `χ↦(t↦χ(n⁻¹tn))` and `ν↦(z↦nν(z)n⁻¹)`, respectively.
  The root/coroot subsets are preserved. This supplies transport of the root
  datum around torus loops without asserting that every root-system
  automorphism is a Weyl element. The lattice construction consumes Layer7F's
  later period dictionary; the quotient, cover and fundamental-group result
  above use only Layer6 and the native covering API. Treat a torus K directly:
  N=K, W=1 and both quotients are points. For SU2 and SO3 construct the
  respective identifications `K/T≃S²`, `Tor(K)≃ℝP²`, p with the antipodal
  cover, and the endpoint isomorphism with C2. In U(n), identify K/T with
  ordered orthogonal complex-line decompositions and K/N with their unordered
  versions; the fundamental group is S_n, including n=0,1.
  [Knutson, Construction11 p1](https://pi.math.cornell.edu/~allenk/courses/16spring/Construction11.pdf)
  is the source passage for this specification. For generic covering APIs,
  follow the [Mathlib universal-cover work](https://github.com/leanprover-community/mathlib4/pull/44186)
  and the [homotopy-lifting discussion](https://leanprover.zulipchat.com/#narrow/channel/217875-Is-there-code-for-X.3F/topic/How.20to.20deal.20with.20fundamental.20group.20.28homotopy.20class.29/near/507388894),
  using the implemented native comparison cited above. Suggested forms are in
  [`MaximalTorusSpaceTargets.lean`](MaximalTorusSpaceTargets.lean).

- **Invariant volume and Haar.** Construct the left-invariant Riemannian volume
  from Layer5A's Ad-invariant form, prove bi-invariance and identify its normalized
  measure with CompactGroups Layer0's Haar probability by uniqueness. Prove the
  quotient/product integration and orientation/Jacobian comparisons used next.
- **The Weyl integration formula.** For compact connected G and maximal torus T, use
  normalized Haar probabilities μG,μT and the quotient probability μ_(G/T), the actual
  pushforward of μG. Construct c:G/T×T→G, c([g],t)=gtg⁻¹, and prove the Borel measure identity
  `c_*((D(t)/|W|) dμ_(G/T) dμT)=μG`, with D(t)=|Δ(t)|² and its actual determinant/Jacobian.
  Include measurability, singular-locus null sets, normalizations and the rank-zero case.
  Deduce by change of variables and Tonelli/absolute-value comparison that a conjugation-invariant
  real- or complex-valued L¹(μG) function has integrable weighted restriction f|T·D with respect to μT, and prove
  `∫_G f dμG=|W|⁻¹∫_T f(t)D(t)dμT`. The measure identity also compares almost-everywhere
  representatives in these weighted spaces. The unweighted restriction to torus Haar need
  not be integrable. First prove the continuous formula, then derive this L¹ extension from
  the measure identity; boundedness of D alone does not justify restricting an L¹ class.
  For SU₂ recover D=4sin²θ and check f=1/sin²θ off the two central elements, with f=0 there: f∈L¹(G),
  its unweighted torus restriction is not L¹, while fD is. Retain the general positive-root
  formula D(t)=∏_(α>0)|1−α(t)⁻¹|² and derive compact Weyl character orthogonality using
  the actual torus Fourier and CompactGroups Haar interfaces.

### Layer 6A: projective unit groups and a central-circle obstruction to linearity

These are two definite applications of the early Lie-group interfaces. The first uses only
Layer 6's initial compact connected abelian classification, before maximal-torus conjugacy,
roots, Weyl integration or complexification. The second uses Layers 0–3 and
[CompactGroups Layers 0–2](../CompactGroups/README.md#layer-0-normalized-haar-measure-and-averaging)
with its circle-character comparison. Neither application uses Lie's triangularization theorem.

**6A.1. Smooth units of a finite real field extension.** Let `F` be a finite-dimensional
**commutative** field extension of ℝ, with `d=finrank ℝ F`. Prove `0<d`. Choose an actual real
basis `b` and use its coordinate linear equivalence to give F its finite-dimensional real
vector-space topology and smooth atlas. This construction uses the original additive/module
parents of the algebra. Transport along changes of basis and prove independence of b; do not
assume a normed-field structure obtained by first identifying F with ℝ or ℂ.

Use native `Algebra.leftMulMatrix b x`: its entries are `b.repr(x*b_j)_i`. Prove the
multiplication-coordinate map is bilinear and smooth. For `x≠0`, multiplication by x has
inverse multiplication by `x⁻¹`, so its determinant is nonzero. Derive the inverse-coordinate
formula
`b.repr(x⁻¹)=(det L_x)⁻¹ • (adjugate L_x *ᵥ b.repr(1))`.
This gives smooth inversion on the open complement of zero, independently of field
classification. Transfer the open-submanifold structure to the **native units** `Fˣ`, prove
its group laws smooth, identify its tangent space with F, and prove the inclusion, multiplication,
inverse, and real-scalar-unit maps are smooth. The basis-coordinate norm need not be
multiplicative; use the displayed polynomial/rational formulas, not an assumed Banach-field
classification.

**6A.2. The projective quotient and its fundamental group.** The scalar homomorphism
`ℝˣ→Fˣ` is induced by `algebraMap ℝ F`. Prove injectivity and closedness of its image:
in b-coordinates it is the nonzero part of the closed real line `ℝ·1`, closed relative to
`F\{0}`. Its image is central. Apply the closed-subgroup/homogeneous-space floor to construct
`P_F=Fˣ/image(ℝˣ)` with its actual quotient topology, smooth abelian group structure and
projection. The map `[u]↦ℝ·u` is a bijection to native `Projectivization ℝ F`; construct its
inverse from a nonzero representative made into `Units.mk0`, and prove representative
independence, both inverse laws, and naturality under real algebra equivalences. Equip this
native projectivization with the quotient topology and smooth ratio charts from
[AlgebraicTopology Stage 4.6](../../AlgebraicTopology/README.md), and prove this is a
diffeomorphism, including its projection and tangent-quotient equations. This is a group on
the projective space of this particular field; it is not a group structure on arbitrary
real projective spaces supplied without a field.

For `d=n+1`, construct the explicit comparison with `TauCeti.RealProjectiveSpace n`, the
native antipodal quotient of the **Euclidean** unit sphere: apply b, normalize using its
Euclidean ℓ² norm, and quotient by sign. Prove this agrees with the Stage 4.6 projective
comparison and is a homeomorphism/diffeomorphism. Do not confuse the default finite-Pi sup
norm with that sphere. Hence P_F is compact; for d≥2 it is connected, abelian and of dimension
d−1. (For d=1 it is a point.) The early compact connected abelian theorem gives an actual
Lie-group equivalence with a finite product of circles. Use its real exponential/lattice
proof: exp is a homomorphism and local diffeomorphism, its image is an open subgroup
and hence all of the connected group, its kernel is discrete and torsion-free, and
compactness makes that lattice full rank. Construct the lattice basis and the actual
quotient equivalence. No complex eigenvalue, compact-representation or algebraic-closure
classification enters this early abelian proof. Transport based fundamental groups
along these specified maps and basepoint paths. Consume the native product/circle calculation
`AddCircle.piFundamentalGroupMulEquiv`, giving a torsion-free integer lattice, and the native
`TauCeti.RealProjectiveSpace.fundamentalGroupMulEquivAt` for n≥2, giving the nontrivial
order-two element of `ℤˣ`. They cannot be isomorphic. This excludes d≥3; it uses no
vanishing of π₂. Retain both low-dimensional cases: RP⁰ is a point and RP¹ has infinite
cyclic fundamental group, not a group of cardinality zero. The `Nat.card=0` convention for
infinite types is not used as an emptiness argument.

Conclude d=1 or d=2. In dimension one prove the scalar algebra map is an equivalence. In
dimension two choose u outside the real scalar line, express u² in the basis `(1,u)`, and
complete the square. Its discriminant is negative: a nonnegative discriminant would factor
that quadratic over ℝ and force u to be scalar in a field. Normalize to j²=−1; prove
`x+iy↦x+yj` is the actual real algebra equivalence ℂ→F, with its inverse in that basis.
Export the resulting finite-extension classification and the polynomial/algebraic corollaries
with their explicit finite-dimensionality reductions. For a real irreducible polynomial,
use its native field quotient and the power basis to obtain degree one or two. For a
complex irreducible polynomial of degree greater than one, its field quotient is finite
over ℂ and hence has real dimension at least four by the tower formula and the explicit
basis `(1,i)` of ℂ over ℝ, contradicting this result. This constructs the geometric FTA
corollary before comparing it with the native algebraic endpoint. Native `Real.nonempty_algEquiv_or`
may compare the **final** algebra equivalences, after finite dimensionality implies algebraicity.
It is not an input to the unit-group, projective quotient or dimension argument: its proof
already uses the algebraic-closure theorem for ℂ.

**6A.3. The period-one Heisenberg quotient.** Use native `TauCeti.HeisenbergGroup ℝ`, with
`(x,y,z)(x',y',z')=(x+x',y+y',z+z'+xy')`, and its native transported product topology.
Construct the explicit faithful homomorphism to `GL₃(ℝ)` with rows
`(1,x,z),(0,1,y),(0,0,1)` and the displayed polynomial inverse; identify its image as the
closed unitriangular subgroup and its Lie algebra with native `TauCeti.heisenberg ℝ`.
Prove the coordinate smoothness and transport the actual native topology, rather than
installing unrelated additive or topological parents. The generators are the native
`heisenbergX=E₀₁`, `heisenbergY=E₁₂`, `heisenbergZ=E₀₂`, with `[X,Y]=Z`.

Let `S={(0,0,m):m∈ℤ}`. Construct its integer parametrization, prove it is a closed discrete
central subgroup, and construct `Q=H/S` on the native quotient-group carrier. The covering
map and quotient Lie structure can be built in z-intervals of length less than one; prove
compatibility with the closed-subgroup quotient interface. Give the homeomorphism
`Q≃ℝ²×AddCircle 1`, `[x,y,z]↦(x,y,[z])`, its inverse, quotient-map laws and local smooth
lifts. This is a space identification with the **twisted** multiplication
`(x,y,c)(x',y',c')=(x+x',y+y',c+c'+[xy'])`, not the direct-product group law.
Prove the center is precisely the embedded circle `c↦[0,0,c]`, with the lift
`t↦[0,0,t]` of period one. Fix its multiplicative-circle comparison as
`[t]↦Circle.exp(2*π*t)`; consequently the weight-k scalar is
`exp(2*π*i*k*t)`. Prove injection of this circle, its closed image and its nontrivial
half-period element. Prove the horizontal homomorphism `Q→(ℝ²,+)` is onto, with this circle
as kernel and hence as its commutator subgroup, using
`[ [s,0,0], [0,t,0] ]=[0,0,st]`.

**6A.4. Every finite-dimensional continuous complex representation kills that circle.**
For such a representation ρ of Q, automatic smoothness is Layer 2's theorem; apply the
Layer 3 Lie functor to the actual quotient projection and representation, matching its
three generators with X,Y,Z above. Restrict ρ to the central circle and consume early
CompactGroups unitarization and internal complete reducibility, followed by the native
circle irreducible classification `ContRepresentation.exists_nonempty_equiv_fourierRep`.
Construct the finite-support **internal** direct sum of integer weight spaces
`V_k={v | ρ(c)v=fourierChar(1,k)(c)v for every c}`. Centrality, not irreducibility of ρ,
makes every V_k Q-invariant. Prove the restriction and differentiation maps on these
actual subspaces, and the identities
`[dρ(X)|V_k,dρ(Y)|V_k]=dρ(Z)|V_k=(2*π*i*k) Id`.
Trace the commutator using native `LinearMap.trace_mul_comm`; its trace is zero, while
the scalar right side has trace `(2*π*i*k)*finrank ℂ V_k`. If V_k is nonzero, finite
dimensionality makes its dimension positive, forcing k=0. Include the zero space and
zero-dimensional representation directly. Thus the whole central circle is killed by
**every** finite-dimensional continuous complex representation; none is faithful.

Export the useful stronger API: each such representation factors uniquely through the
horizontal quotient Q/Z(Q)≃(ℝ²,+), with continuity and the converse pullback operation.
Transport the matrix proof to any finite-dimensional complex carrier by an actual basis/
continuous-linear equivalence; do not restrict the theorem to a chosen matrix size. Real
finite-dimensional faithful representations are also excluded by complexifying their
actual matrices. H itself has the faithful unitriangular representation, whose central
period-one element is not the identity matrix, so it does not descend to Q. This example
separates faithful Lie-algebra representations and faithful representations of a specified
global Lie group without adding a new triangularization or complexification prerequisite.

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
<a id="sl2-real-cover-complexification"></a>
**The nontrivial covers of SL₂(ℝ).** Compute this example of the preceding
universal complexification, including its actual unit map and kernel.
For the native matrix group G=SL₂(ℝ), construct the real QR diffeomorphism
`SO(2)×ℝ_(>0)×ℝ≃G`, using the positive upper-triangular factor with
entries (a,b;0,a⁻¹). It identifies π₁(G) with ℤ, generated by the full
rotation θ↦[[cos θ,−sin θ],[sin θ,cos θ]], 0≤θ≤2π. Let
p:G̃→G be Layer5's connected universal covering group and let ζ be the
endpoint of the lift of this full rotation from1. Construct its kernel
as the infinite cyclic central subgroup generated by ζ. For m≥1 put
H_m=G̃/⟨ζ^m⟩, and put H_∞=G̃. Construct the covering maps p_m:H_m→G,
the finite cyclic kernel of order m and the infinite cyclic kernel for
H_∞, and identify all connected covers by these actual maps.

Compare sl₂(ℝ)⊗ℂ with sl₂(ℂ). Prove SL₂(ℂ) simply connected using
its polar deformation to the earlier SU₂≃S³, with the positive Hermitian
determinant-one factor contractible by its logarithm. The integrated map
j:G̃→SL₂(ℂ) equals the composite of p with the real matrix inclusion,
by its differential and connected-source uniqueness. In particular j(ζ)=1.
The period-quotient construction therefore gives
`(H_m)_ℂ≃SL₂(ℂ)` and `η_m=ι∘p_m`, including m=∞. Construct the two
universal-property comparisons and their inverse equations.

Every continuous finite-dimensional complex representation of H_m factors
uniquely through p_m: smooth it by Layer2, complexify its differential,
integrate from SL₂(ℂ) and compare on the connected source. Conversely
pullback gives all such representations. The intersection of their kernels
is exactly ker p_m, using the faithful standard representation of G.
Thus for m≥2 and m=∞ there is no faithful such representation, and η_m
is not injective. An injective realization as a real form in a complex
Lie group is impossible by the same universal property, although the
universal complexification itself exists. This pins complex4 p2's notion
of complexification without replacing it by the universal one.

As the separate exponential-map exercise, prove diag(−2,−1/2) is not
exp(X) for X∈sl₂(ℝ): X commutes with its exponential, so this distinct-
eigenvalue diagonal forces X real diagonal; its exponential then has
positive diagonal entries. Compare with the surjective unitary exponential
from spectral diagonalization. These are explicit global examples of the
earlier exponential and representation interfaces, not new integrations.

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
  a real Lie group R, a specified smooth group homomorphism R→H that is a closed
  embedding, and the induced complex
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

- **Compact-real-form pairs and algebraic morphisms.** Construct the category whose
  objects are smooth connected affine reductive algebraic groups G over ℂ,
  connected compact Lie groups K, and specified smooth group homomorphisms
  ι:K→G(ℂ) that are closed embeddings and whose complexified differentials
  are Lie-algebra isomorphisms.
  A morphism consists of a regular algebraic group homomorphism F:G→G′ and
  a continuous group homomorphism f:K→K′ with F(ℂ)∘ι=ι′∘f. Prove f unique
  and identify these morphisms with the regular F carrying ι(K) into ι′(K′).
  Construct identities and composition, and restriction to connected compact
  Lie groups with continuous homomorphisms. The preceding compact-form/polar
  theorem identifies the displayed G(ℂ) with K's universal complexification;
  retain dim_ℝ Lie(K)=dim_ℂ Lie(G(ℂ)) and the actual embedding.

  For every f:K→K′, construct its unique holomorphic extension by that universal
  property, then prove this extension regular algebraic. Own the algebraicity
  comparison here. In RG1's faithful algebraic models form the compact graph
  Γ_f⊂K×K′ and its algebraic Zariski closure H⊂G×G′. Unitarize the restricted
  faithful representation and apply the preceding compact algebraization,
  polar and universal-property comparisons to Γ_f. Prove H(ℂ) is the actual
  analytic graph of the extension and its first projection onto G(ℂ) is a
  holomorphic group isomorphism; density or a Lie-algebra comparison alone
  does not prove these global assertions. Prove the algebraic projection
  H→G is an isomorphism: construct its scheme kernel and image using RG0–3,
  use characteristic-zero smoothness and the point/tangent comparisons to
  prove the kernel trivial, and prove surjectivity and faithful flatness.
  Give the quotient/descent argument constructing its regular inverse.
  This projection criterion is part of this comparison, not an assumption
  that an arbitrary analytic inverse is algebraic. Compose that inverse
  with H→G′ to obtain the required F, and prove uniqueness from the Zariski
  density of ι(K) in G. Prove identity and composition compatibility.

  Use compact algebraization to construct a quasi-inverse to restriction.
  Construct its unit and counit from the actual compact embeddings and
  unique regular extensions, prove their naturality and triangle equations,
  and conclude the equivalence of these two specified categories. Prove
  independence, through these unique isomorphisms, of faithful matrix models,
  unitarizing metrics and chosen algebraizations. Include the point, compact
  tori and finite central quotients with their full character and period
  lattices. For G=SL₂(ℂ), K=SU₂, compute that conjugation by diag(2,1/2)
  sends ((0,−1),(1,0)) to ((0,−4),(1/4,0)), which is not unitary: the compact
  form condition on morphisms is substantive. Use the earlier FCO F2.4/F4.3
  algebraic-point/tangent dictionary and LG7's compact polar/algebraization
  theorems in this construction, before LG8; it requires no generic RG10
  representation reconstruction or analytic GAGA theorem. The finite-dimensional
  representation restriction equivalence above remains a separate comparison.

### Layer 7E: compact exceptional symmetric spaces and their full isometries

Construct the following late compact applications of Layers2,4–7, using Layer7's
actual compact real forms, LieHighestWeight Layer8's concrete exceptional algebras
and scalar-extension comparisons, and
[SpinRepresentations](../SpinRepresentations/README.md)' Clifford/spin modules. Use
native Clifford/Spin carriers and construct the real compact topology, Lie structure,
covering map and representation comparisons on those same carriers. These real
compact groups are not the split Serre groups over ℝ. This layer supplies the named
exceptional homogeneous/symmetric applications; the generic integration, quotient,
metric and isometry-group theories retain their existing owners.

**Actual carriers, homomorphisms and isotropy.** For each compact simple algebra of
type F4,E6,E7,E8 construct its simply connected compact integration G_sc by Layer7.
For FII consume TangentialBordism's concrete compactF4/Spin9 homomorphism and
transport it through Layer4's unique simply connected integration comparison; that
owner retains its Peirce/Clifford construction. For the other rows build the displayed
isotropy homomorphism from the chosen root/Clifford inclusion,
its derivative, image, closedness and connectedness. Construct the inner symmetric
involution, identify its fixed Lie algebra h and Killing-orthogonal complement p,
and prove [h,h]⊂h, [h,p]⊂p, [p,p]⊂h and [p,p]=h. Identify the connected
fixed subgroup with that actual image H. Prove its full stabilizer/normalizer below;
no abstract subgroup of the right dimension is substituted for the image.

| Compact symmetric quotient G_sc/H | Isotropy map and exact kernel | Actual tangent module |
| --- | --- | --- |
| FII | Spin(9)→F4, injective | real spin16 |
| EIII | Spin(10)×U1→E6, kernel ⟨(z,i)⟩ of order4 | S−10 of circle weight−3, complex16/real32 |
| EVI | Spin(12)×Sp1→E7, kernel ⟨(ω,−1)⟩ of order2 | real form of S−12⊗ℂ², real64 |
| EVIII | Spin(16)→E8, kernel ⟨ω⟩ of order2 | real half-spin S+16, real128 |

For the even-dimensional covers pin negative-square Euclidean Clifford generators
and their ordered volume element. For FII keep TangentialBordism's positive Cliff(9,0)
Peirce module and its pinned volume−Id, with an explicit even-Spin comparison if a
different Clifford signature is used.
For Spin(10), z=e1…e10 has order4 and acts on V10,S+10,S−10 by−1,i,−i.
Parameterize U1 by t=exp(iθ), with weight q meaning t^q. Integrate the minuscule
27 with restriction V10_2⊕S+10_(−1)⊕1_(−4), and its dual with opposite weights.
Prove faithfulness from its generator central character on P(E6)/Q(E6)=C3 and
simplicity. Its three scalar equations give precisely (z^k,i^k) in the isotropy
kernel. Obtain the U1 period from these integral weights when descending the
integrated Spin(10)×ℝ map. In the 27* projective model the base line has weight+4
and the varying spinor summand weight+1; construct the tangent intertwiner as
Hom(1_4,S−_1)=S−_(−3), including the central-kernel descent. Changing to a dual
Jordan model requires its explicit equivariant comparison, not a silent sign change.

For Spin(12) and Spin(16), choose chirality so ω acts+1 on S+ and−1 on S−;
ω²=1, while scalar−1 acts−1 on both spin modules. For E7 construct both
133=(66,1)⊕(1,3)⊕(S−,2) and the faithful minuscule56=(S+,1)⊕(V12,2).
The latter's two scalar equations give exactly ⟨(ω,−1)⟩. Construct the invariant
quaternionic structures on S−12 and ℂ²; their tensor has square+1, whose fixed
real form supplies the64-dimensional tangent and invariant real metric. For E8
construct 248=120⊕S+128; faithfulness of its center-free adjoint representation
makes the kernel exactly {1,ω}. Distinguish this semispin subgroup from SO(16),
whose covering kernel is {1,−1}. For F4 the decomposition52=36⊕spin16 proves
that the possible Spin(9) central kernel is trivial. Export actual representation
and differential intertwiners, real/complex scalar-extension maps and dimension
identities; branching dimensions alone are not the tangent comparison.

**Root coordinates and global forms.** In the E8 Euclidean model use roots ±ei±ej
and half roots with an even number of minus signs. E7 is perpendicular to e7+e8,
with D6 on the first six coordinates and A1=±(e7−e8). E6 is perpendicular to
e6+e8 and e7+e8; D5 uses the first five coordinates and its remaining line is
u=e6+e7−e8. Construct the root/base isomorphisms, generator and chirality
comparisons with the selected compact integrations. E7's64 mixed roots have
opposite last signs and the indicated D6 half-spin parity; E8's128 half roots
pick S+. Keep the actual maximal torus, character/coroot lattices and central
maps. Prove |Z(G_sc)|=1,3,2,1 through the root-lattice comparison. Since H
contains a maximal torus it contains the center. Its core in G_sc has zero Lie
algebra by simplicity and properness of h; a discrete normal subgroup of a
connected group is central. Thus the effective connected actions are F4,
E6/C3,E7/C2,E8. Construct those quotient homomorphisms and identify their
kernels and induced faithful actions; E6 and E7 themselves are ineffective.

**Quotients and metrics on the actual models.** Consume Layer6's SBC B1.4
smooth G_sc/H and tangent quotient. Consume [RiemannianGeometry R1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/505150c263c8793d8836d2a79f5ed7494ffa7ea3/TauCetiRoadmap/RiemannianGeometry/README.md#r1-intrinsic-curvature-calculus-and-normal-coordinate-jets)
for the normal homogeneous metric from −Killing and its horizontal/tangent
comparison. Prove these are the compact irreducible symmetric metrics,
R(X,Y)Z=−[[X,Y],Z] in the stated convention, completeness and the isometric
G_sc action. Fix the common positive metric scale in every comparison.
For FII consume [TangentialBordism's Albert/Cayley-plane construction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4a5e27d2dd1b94abcca3e9b2151e9adf460a8a2f/TauCetiRoadmap/TangentialBordism/README.md),
consume its actual rank-one-idempotent orbit/stabilizer and quotient diffeomorphism,
and construct the tangent and metric comparison with the selected LG normalization. For EIII construct
the 27* highest-line orbit and its real cubic/Jordan coordinate comparison,
including the orbit equations, inverse, stabilizer and invariant Hermitian/Fubini–Study
metric comparison with this symmetric quotient. EVI and EVIII mean these
explicit compact quotients with their spin tangent models. Tensor-octonionic
“plane” notation is a name for the compared Rosenfeld models, not projectivization
over an asserted tensor-product division algebra.

**Self-normalizers and inner components.** For each actual connected full-rank H
containing T, prove N_G(H)/H≃N_W(Ψ)/WΨ by conjugating H's maximal tori and
comparing the root-generated subgroup. Construct chamber adjustment modulo WΨ
before passing to the length-preserving diagram action. For B4⊂F4 the diagram
action is trivial. For D6+A1⊂E7 and D8⊂E8 the only possible quotient has
order1 or2, while the subsystem indices are63 and135. For D5⊂E6 its image
on the D5 diagram and kernel on ℝu each have order1 or2, so the quotient has
order1,2 or4 and divides27. Prove these indices from the actual Weyl groups,
including1152/384=3 in F4; conclude N_G(H)=H in all four cases. Also give the
coordinate checks: a D6 odd sign change cannot preserve E7's mixed-root parity,
and a D8 odd sign change exchanges the absent/present half-root chirality.
In E6 the simultaneous D5 odd sign change and u reversal preserves roots but
sends λ=(2/3)u to−λ, nontrivially on P/Q=C3; it is outer, not Weyl.
This normalizer computation is needed in addition to the diagram-outer classification.

**Full metric isometries.** Consume [PositiveScalarCurvature P2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/5517349e4ad45a4bdb2a736c2776c0a55a525dcc/TauCetiRoadmap/PositiveScalarCurvature/README.md#p2-positive-fibres-and-bundle-metrics)'s
metric-isometry Lie-group/smoothness and1-jet framework. Apply it to these actual
connected compact quotients. For a basepoint-fixing isometry, prove that its orthogonal
derivative A:p→p preserves curvature/Lie triples. Construct its extension on
h=[p,p] by [X,Y]↦[AX,AY]; prove well-definedness using the faithful h-action on p,
then the Lie bracket identities. Integrate on G_sc, compare connected H, descend to
the quotient and apply the1-jet theorem. Inner pair automorphisms contribute only
H/Z(G) by self-normalization. Use Out(F4)=Out(E7)=Out(E8)=1 and Out(E6)=C2.
For EIII construct the explicit anti-linear projective map c[v]=[bar v] from the
chosen real cubic/Jordan structure, prove orbit and metric preservation, compatibility
with the actual dual-model/pinning, antiholomorphicity, c²=1 as a map, and its
nontrivial outer conjugation on E6/C3. Construct the semidirect action and prove

    Isom(FII) ≃ F4,       Isom(EIII) ≃ (E6/C3) ⋊ C2,
    Isom(EVI) ≃ E7/C2,   Isom(EVIII) ≃ E8.

These are group/Lie-group comparisons on the specified Riemannian-distance carriers,
with the actual action maps and identity components; no table or Lie-algebra dimension
substitutes for the lower map or the LTS upper bound. Export restriction/conjugation,
isotropy, evaluation and metric-rescaling compatibility for the application API.
This layer consumes generic metric and isometry suppliers and does not duplicate them.
It is independent of Layer8's Borel–Weil–Bott and Layer9's noncompact decompositions.
For the EIII projective/spinor and E8 Lie-algebra constructions use
[Qiu, *Plücker Coordinates and the Rosenfeld Planes*, §2.2 and Appendix B](https://arxiv.org/html/2401.07735v2).
The central kernels, normalizers, metric comparisons and full-isometry proof targets
above require their explicit maps and arguments; the model descriptions alone do not supply them.

### Layer 7F: compact centers from the actual coweight quotient

Consume the abstract affine/coweight construction of
[LieHighestWeight Layer 10](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c6ff879b0c301bec739ff485a5cffb082cec0239/TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md#layer-10-affine-weyl-geometry-and-the-compact-coweight-quotient) only after LieGroups Layers 6–7 have constructed the compact root
comparison and actual torus period quotient. Work first with compact connected semisimple groups.
For compact connected reductive `G`, use the actual finite central covering homomorphism
`Z(G)^0 × G_der,sc → G` and carry its finite central kernel: the torus and simply connected derived
group are factors of the covering product, not in general direct factors of `G`. For an actual compact torus `T`, let `Y =
ker(exp_T)` in the dimensionless root-datum coordinates and retain the full character and
cocharacter maps. Prove `Q∨ ⊆ Y ⊆ P∨` for the corresponding semisimple isogeny form.

The coordinate comparison is a theorem, not notation: if `α_comp` is the real compact root
functional from Layer 6 (`dχ_α = i α_comp`) and `α∨_comp` is the compact coroot calibrated there
(`α_comp(α∨_comp)=2`), map a dimensionless coroot to `2π α∨_comp`. Prove this sends the root-datum
period lattice `Q∨` into the actual exponential kernel and reconciles the algebraic cocharacter
differential and the compact circle homomorphism in the commutative comparison square. The rank-one
calibration in Layer 6 is `dφ(diag(i,−i)) = α∨_comp`,
`dν_alg(1) = −iα∨_comp`, and `d(ν_alg|S¹)(i) = α∨_comp`; together with `dχ_α = iα_comp`, these fix
the sign and factor. The algebraic cocharacter differential and the real compact Lie-algebra
coordinate are different carriers.

First prove every central element lies in this fixed `T`: every element of a compact connected group
lies in a maximal torus, maximal tori are conjugate, and conjugation fixes a central element. For
`t ∈ T`, identify its adjoint action on the actual root-space decomposition and use connectedness to
prove `t ∈ Z(G)` exactly when every root character takes value `1`. Lift through the actual torus
universal cover to identify these points with `P∨/Y`, naturally for the pinned root
datum. Establish the simply connected case `Y=Q∨` by a separate period argument: rank-one maps give
`Q∨⊆Y`; integrate every finite-dimensional module of a fundamental Lie weight to the simply connected
compact group, compare its actual torus character differential using the Layer 6–7 `2π` calibration,
and apply each actual period in `Y` to obtain integral evaluation on the fundamental-weight basis.
The dual-lattice comparison gives `Y⊆Q∨`. This construction is required before specializing the
center formula; do not infer it from the rank-one inclusion or from the center classification. Thus
`Z(G_sc) ≃ P∨/Q∨`;
an intermediate isogeny form has center `P∨/Y` and extended affine alcove stabilizer `Y/Q∨`. State
both quotients: for the simply connected form the latter stabilizer is trivial while the former need
not be. The abstract `P∨/Q∨` alcove stabilizer formed using all coweight translations is not the
extended affine stabilizer of the actual simply connected group.

This finite-center statement does not include a positive-dimensional central torus. For compact
connected reductive `G`, first split its actual Lie algebra into center and semisimple derived ideal
using Layer 5A; apply the finite quotient statement to the simply connected semisimple cover and
carry the central torus and finite central gluing through the existing Layer 7 period-quotient data.

**Compact conjugacy classes and the closed alcove.** For compact connected K
and its actual maximal torus T, construct the homeomorphism
`T/W≃K/conjugation` induced by inclusion. Exhaustion gives surjectivity.
If t,u∈T and gtg⁻¹=u, both T and gTg⁻¹ lie in C_K(u)⁰; apply maximal-torus
conjugacy in this compact connected identity component to obtain
c∈C_K(u)⁰ with cg∈N_K(T). This gives the reverse orbit implication.
The full group centralizer C_K(u) need not be connected. Prove continuity
and both quotient-map identities; use compactness and Hausdorffness of the
compact-group orbit quotient to obtain the homeomorphism. Compare it with
`𝔱/(ker(exp_T)⋊W)` through the actual exponential quotient and equivariant
linear maps, rather than just a bijection of representative sets.

For semisimple K, use the preceding calibration to construct the linear
comparison C:V→𝔱, with C(α∨)=2π α∨_comp, and prove
`ker(exp_T∘C)=Y` and W-equivariance. Consume LHW10's closed-point-orbit
and stabilizer theorems on this same action to construct
`K/conjugation≃V/(Y⋊W)≃Abar/Ω_Y`, including their quotient topologies and
boundary stabilizers. When K is simply connected, the independently proved
Y=Q∨ makes Ω_Y trivial, so exponentiation gives exactly one representative
in Abar. For other isogeny forms retain Ω_Y and its actual action; a closed
Q∨-alcove is then not itself a set of unique conjugacy representatives.
For compact connected reductive K use its actual finite central covering
`Z(K)⁰×K_der,sc→K` and kernel F. Construct the action of F on
`Z(K)⁰×Abar_der` induced by multiplication on the covering group, using the
semisimple central-translation/alcove maps, and prove its quotient is
K/conjugation. Compare this quotient with the actual full period-lattice
model on 𝔱. Preserve mixed central/derived gluing; a pure torus has its own
torus as conjugacy quotient, and the trivial group gives a point.

For SU(n), n≥2, fix the diagonal coordinates
`exp(2πi diag(a₁,…,a_n))` with Σa_i=0 and positive roots x_i−x_j for i<j.
Compute the actual kernel as the sum-zero integer lattice and identify Abar
with `a₁≥⋯≥a_n` and `a₁−a_n≤1`. Give the exponential, affine-Weyl and
conjugacy-quotient comparisons in these coordinates. For SU(2) this is
`(a₁,a₂)=(t,−t)`, 0≤t≤1/2. For SU(3) compute the vertices
`(0,0,0)`, `(1/3,1/3,−2/3)` and `(2/3,−1/3,−1/3)` and their
exponentials I, ωI and ω²I, respectively, with ω=exp(2πi/3). Prove these
are exactly its three central classes. Compare SU(2)→SO(3): multiplication
by −I induces t↦1/2−t on the SU(2) alcove, so the SO(3) quotient is
represented by 0≤t≤1/4, with rotation angle 4πt. In particular the two
SU(2) endpoints become the same SO(3) identity class, while t=1/4 is the
half-turn class. Construct the maps and boundary isotropy, not just the
interval lengths. Transport the source's labels x_(i+1)−x_i by the
explicit reversing permutation/opposition before using these descending
inequalities; retain its root-sign/order mismatch as a source discrepancy.
Handle n=1 by the point group and n=0 by the native trivial-group
convention, without an invalid type-A root datum.


### Layer 7G₂: the compact automorphism group of the positive division octonions

This is the compact real-form application of the **positive** division carrier built in
LieHighestWeight Layer8. It is a distinct owner from the split construction
`Der(TauCeti.Octonion ℂ) ≃ 𝔤₂(ℂ)`; neither a dimension count nor equality of
complexifications identifies the real group. Reuse that algebra owner’s ordered
`ℍ⊕ℍ` product comparison, positive norm, trace-zero seven-plane, cross product,
Cayley-frame table, and native
`TauCeti.derivationLieAlgebra ℝ A`. The dependency is one-way: the division algebra is
constructed without this layer’s group or classification.

**The actual full automorphism group and its Lie algebra.** Define `G` as the subgroup of
`A ≃ₗ[ℝ] A` whose elements fix `1` and preserve the binary product. This is the full
automorphism group, not its identity component. Prove restriction to `Im(A)` identifies
it with the closed subgroup of `O(Im(A))` preserving the actual cross product; the inverse
extends by the identity on the scalar line. For closedness, use the finitely many
bilinear basis equations and the unit equation in the finite-dimensional matrix carrier.
This proves compactness and gives the actual embedded-subgroup Lie structure. Do not use
`AlgEquiv`: this multiplication is nonassociative.

Identify `Lie(G)` with the native derivation Lie algebra by both inclusions. For a
derivation D, first prove D(1)=0. In the associative endomorphism algebra set
`E_t=exp(tD)`. For fixed x,y, prove `f(t)=(E_t x)(E_t y)` solves `f′=D f` by the
Leibniz rule and the derivative rule for the bilinear product, while `q(t)=E_t(xy)` solves
the same linear ODE with the same initial value. Uniqueness proves multiplicativity;
`E_t(1)=1` and `E_{−t}` is the inverse. This gives a smooth one-parameter curve in the
actual automorphism group. Only now differentiate the already established automorphism
norm equation to obtain skew-adjointness for every D. Conversely differentiate the group
unit and product equations along a smooth automorphism curve to put its tangent in the
native derivation carrier. Prove these maps inverse and bracket preserving. The roadmap uses the ODE route above. A trace-based alternative would need a separate
trace-to-norm argument: taking traces in `[D,L_x]=L_(Dx)` gives `tr(L_(Dx))=0`, not
`tr(D L_x)=0`. Do not presuppose norm preservation for an arbitrary Leibniz map.

**Cayley frames, transitivity, and local orbit charts.** A frame is an ordered tuple
`(u,v,z)` of unit imaginary vectors with `u⊥v` and `z` orthogonal to
`Q=span{1,u,v,uv}`. Prove the complete multiplication table of
`(1,u,v,uv,z,uz,vz,(uv)z)` on the positive carrier. The table makes the linear map
between any two such frames a unital product-preserving map; this proves transitivity
without assuming connectedness. For a fixed frame `(u₀,v₀,z₀)`, on a neighborhood of `u₀` put
`ṽ(u)=v₀−⟨v₀,u⟩u`, `v(u)=ṽ(u)/‖ṽ(u)‖`. Let `Q(u)` be the actual orthonormal
four-frame `1,u,v(u),u v(u)` and put
`z̃(u)=z₀−Σ_(e∈Q(u))⟨z₀,e⟩e`, `z(u)=z̃(u)/‖z̃(u)‖`.
At `u₀` both denominators equal one, hence remain nonzero on an explicit open
neighborhood. These formulas are local sections of the orbit map. State all-orders regularity using smooth extensions
in ambient finite-dimensional coordinates on open domains: the sphere point lies in the open
chart domain in `Im(A)`, and the automorphism is represented in `End(A)`. Each extension domain
must contain every actual coordinate value on which that extension is used. Do not assert
`ContDiff` on the sphere or subgroup subtype without first constructing their manifold charts.
Show the ambient extensions agree with the actual section and subgroup-valued map on the chart. For `H=Stab_G(u₀)`, give the inverse local trivializations
`g ↦ (g u₀, s(g u₀)⁻¹g)` and `(u,h) ↦ s(u)h`, verify both composites are identities,
and prove smoothness and right-H compatibility. Thus `G→S(Im(A))≃S⁶` is a principal H-bundle for the **full possibly
disconnected** G and `G/H≃S⁶` is a diffeomorphism, not just an orbit bijection or
dimension comparison.

**The stabilizer is the actual matrix SU(3).** Keep the real scalar plane
`span_ℝ{1,u₀}≃ℂ` as one complex line. Let
`V=(span_ℝ{1,u₀})⊥⊂A`; on this real six-plane put `Jv=u₀×v`. Prove `J²=−1`
and orthogonality from the algebra owner’s identities, so V is a complex 3-space.
Use `ω(v,w)=g(Jv,w)`, the Hermitian form
`h(v,w)=g(v,w)+iω(v,w)` (conjugate-linear in its first variable), and
`ρ=φ|V³`. Fix the Cayley frame `u=i`, `b₁=j`, `b₂=ℓ`, `b₃=jℓ`; in this frame
`J(jℓ)=−(ij)ℓ`. Prove that ρ has type `(3,0)+(0,3)`, and set
`Ω(v,w,z)=ρ(v,w,z)−iρ(Jv,w,z)`. Verify complex multilinearity and the normalization
`Ω(b₁,b₂,b₃)=1` on the fixed coordinate frame `u=i`, `b₁=j`, `b₂=ℓ`, `b₃=jℓ`,
including the identity `J(jℓ)=−(ij)ℓ`. For
`g(c(v,w),z)=ρ(v,w,z)`, prove the full reconstruction, for real s,t,r,q and v,w∈V,

`(s1+tu+v)(r1+qu+w)=(sr−tq−g(v,w))1+(sq+tr+ω(v,w))u+s w+r v+tJw−qJv+c(v,w)`.

In particular the `u` coefficient is `+ω(v,w)`. Restriction of an automorphism fixing u
is a unitary map preserving Ω. For every complex-linear A,
`Ω(Av,Aw,Az)=det_ℂ(A)Ω(v,w,z)`; since Ω is nonzero, its unitary preservers are exactly
SU(V,h). Conversely a unitary map preserving Ω preserves every term in this product formula and extends by the identity on the single real plane
`span_ℝ{1,u}`. Prove these inverse maps are smooth group isomorphisms with the actual
`Matrix.specialUnitaryGroup (Fin 3) ℂ`, including all components. A Lie-algebra dimension
calculation or a claim about two independent complex lines does not establish this
stabilizer.

**Topology with no connectedness circularity.** Construct
`SU(2)→SU(3)→S⁵` by the first-column map. Give the block-diagonal stabilizer and its
inverse, and local sections on a neighborhood of each fixed unit first column x. With the Hermitian
convention `h` conjugate-linear in its first variable, project fixed orthonormal complement
vectors `w₂,w₃` by
`ṽ₂=w₂−h(x,w₂)x`, `v₂=ṽ₂/‖ṽ₂‖`, then
`ṽ₃=w₃−h(x,w₃)x−h(v₂,w₃)v₂`, `v₃=ṽ₃/‖ṽ₃‖`.
(The real orthogonal formulas use `g(x,w₂)`, `g(x,w₃)`, and `g(v₂,w₃)`.) These denominators
are nonzero on a sufficiently small open neighborhood of the selected base column. Extend the
resulting matrix-valued section to all orders smoothly in ambient Euclidean coordinates on that open domain;
do not assert differentiability on the sphere or SU(3) subtype without first supplying manifold
charts. The stabilizer of the standard column is the block-diagonal subgroup `diag(1,A)` with
`A∈SU(2)`. A fiber over an arbitrary x is a torsor for this stabilizer, not a group; choose a
basepoint in each fiber to identify it with the standard stabilizer as a set. For
`U=(x,v₂,v₃)`, multiply its last column by `det(U)⁻¹`. This retains x and gives determinant
one without a cube-root choice. Prove the bundle charts and right-SU(2) laws. Reuse LG Layer2’s SU(2)≃S³
construction and its explicit sphere low-homotopy method, extending the latter to S⁵ and
S⁶: based smoothing, Sard to choose a missing point, and based stereographic contraction.
Use the native DGFloer Layer1 item2 fibration exact sequence, including its π₀ term, after
proving these locally trivial bundles are Serre fibrations. First show SU(3) connected and
simply connected; then use `SU(3)→G→S⁶` to show π₀(G)=0 and next π₁(G)=0. No compact
G₂ classification, presumed connected Aut(A), or theorem whose hypotheses assume G
connected is an input. Prove and export `π₂(S⁶)=0` by the same based
smoothing/Sard method, and use that result in the homotopy exact-sequence computation.

**Root datum and compact global form.** Differentiating the now-constructed orbit bundle
gives an actual SU(3)-equivariant sequence
`0→su(3)→Lie(G)→V_ℝ→0`. Split it using the positive invariant inner product obtained by
restricting `tr(DᵀE)` from the concrete orthogonal representation. Thus the actual
complexified adjoint module is `sl₃ ⊕ ℂ³ ⊕ (ℂ³)*`, by explicit maps. For the diagonal
torus put `εᵢ=eᵢ−(e₁+e₂+e₃)/3`. Compute the six roots `εᵢ−εⱼ`, the six short
weights `±εᵢ`, and the zero-weight plane; prove their differentials agree with LG6's
`dχ=iα` convention. This yields the actual centralizer and maximal torus, and the Lie
center is zero. Prove the Weyl-invariant inner product on the sum-zero plane is a positive
multiple of the Euclidean one. With short α=ε₂ and long β=ε₁−ε₂, pin
`α²=2/3`, `β²=2`, `(α,β)=−1` and root-entry convention
`αᵢ(αⱼ∨)=[[2,−1],[-3,2]]`. Construct the six positive roots, one-dimensional root
spaces, coroots and bracket constants; compare the simple-Chevalley matrix once with the
native Serre transpose. Match the native twelve roots and seven weights of the fundamental seven-dimensional module
entry-by-entry, but do not call its indefinite invariant form the positive division norm.

Consume `TauCeti.DynkinType.g2SimplyConnectedRootDatum` only after the actual compact root
and bracket comparison. Match the positive-root coordinates and coroots, and compare the
native seven-weight `TauCeti.G2ShortRoot` Cartan, raising and lowering matrices with the
actual SU(3)-equivariant action, including their Serre relations and cross-product
intertwiner. Construct the compact conjugation on the complex split Serre algebra and its
fixed real Lie algebra; prove its brackets and normalized root vectors give the same real
compact form as `Lie(G)`. Complexification equality alone is insufficient. Then LG4
integrates this real Lie isomorphism and its inverse between the simply connected
integrations; uniqueness proves they are inverse. The G₂ Cartan matrix has determinant
one, so the actual character and cocharacter lattices identify `P=Q` and the center of
the simply connected compact form is trivial. Independently prove the seven-dimensional
action faithful: an automorphism acting trivially on Im(A) fixes the scalar unit and hence
every element of A. Do not infer the global form or its center from the label `G₂` or the
dimension 14.
This lower Lie-algebra and period comparison consumes the explicit actual-root datum above;
it does not feed back into the division algebra or Cayley-frame construction.

<a id="g2-su3-branching-multiplicity"></a>
**Restriction to the stabilizer and branching multiplicity.** For the
actual stabilizer inclusion i:SU(3)→G above, complexify the seven-dimensional
real action and retain the complexified adjoint action. Write U_(a,b) for
the compact G₂ irreducible with highest weight aω₁+bω₂, with ω₁ attached
to the short simple root, and W_(p,q) for the SU(3) irreducible of highest
weight pϖ₁+qϖ₂. Construct these actions from LieHighestWeight's existing
modules and Layer7's actual integration/extension maps. Identify the
standard SU(3) module W_(1,0) with the complex three-plane supplied by the
chosen imaginary unit, and W_(0,1) with its dual; use the same torus map
as in the preceding root calculation.

Construct equivariant linear equivalences with the following restrictions:

| G₂ module | Restriction along i |
| --- | --- |
| U_(1,0), dimension7 | W_(0,0) ⊕ W_(1,0) ⊕ W_(0,1) |
| U_(0,1), dimension14 | W_(1,1) ⊕ W_(1,0) ⊕ W_(0,1) |
| U_(2,0), dimension27 | W_(0,0) ⊕ W_(1,0) ⊕ W_(0,1) ⊕ W_(2,0) ⊕ W_(0,2) ⊕ W_(1,1) |
| U_(1,1), dimension64 | W_(1,0) ⊕ W_(0,1) ⊕ W_(2,0) ⊕ W_(0,2) ⊕ W_(1,1)^(⊕2) ⊕ W_(2,1) ⊕ W_(1,2) |

Prove the first two rows from the actual division-octonion and differentiated
orbit maps, including their scalar extension, rather than by dimensions.
For the next rows prove `Sym² U_(1,0)≃1⊕U_(2,0)` and
`U_(1,0)⊗U_(0,1)≃U_(1,0)⊕U_(2,0)⊕U_(1,1)` by the existing highest-weight
character/tensor theory on the computed root datum. Restrict these characters,
apply the typeA tensor rules, and prove coefficientwise equality on the actual
SU(3) torus. Complete reducibility supplies the displayed module equivalences.
In particular construct the multiplicity space
`Hom_SU(3)(W_(1,1),Res_i U_(1,1))` and prove its complex dimension is2.
This proves failure of multiplicity-free restriction for this embedding,
as asserted in Knutson's second-semester p5, without assigning meaning to
its informal phrase “largest subgroup.” Compare the numeric character with
[the Sage G₂→A₂ branching example](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/root_system/branching_rules.html),
while proving the actual compact inclusion and all intertwining maps here.

**Owner boundary.** LieHighestWeight Layer8 owns the positive ℍ⊕ℍ algebra, all
nonassociative identities, the real trace/cross tensors, and scalar-extension comparison.
This late LieGroups Layer7G₂ subsection owns the full automorphism group, orbit/stabilizer
geometry and topology, and compact Lie/root/global-form identification. Existing generic
subgroup Lie theory, integration, compact roots, DGFloer exact sequence and homogeneous
bundle theory remain their existing single owners. Preserve all split exceptional,
formally-real Albert, triality, Layer7E and downstream symmetric-space targets unchanged.

### Layer 8: Borel-Weil, flag manifolds, and Bruhat

- **Borel subgroups and the flag manifold.** The inputs are (i) a compact connected Lie group `K`, its Layer 7 universal complexification `K_ℂ`, and the Layer 7 algebraization comparison `𝐊(ℂ)≃K_ℂ`; or (ii) a connected affine reductive algebraic group `𝐆` over `ℂ`, with its analytic group `𝐆(ℂ)` identified by the RG6/FCO lower dictionary and its compact form `K` constructed by Layer 7's algebraic compact-form specialization from that lower dictionary. Thus case (ii)'s compact form is a later Layer 7 output, not an input supplied by the lower FCO dictionary. In either case work with the resulting actual affine reductive algebraic group `𝐆` and its full character/cocharacter lattice, maximal torus `𝐓`, and positive-root system. Construct the algebraic Borel `𝐁=𝐓⋉𝐍₊`, where `Lie(𝐍₊)=⊕_{α>0}𝔤_α`; use its algebraic characters as holomorphic characters of `𝐆(ℂ)`. The quotient `𝐆(ℂ)/𝐁(ℂ)` is the compact complex flag manifold, and RG7's generic algebraic Bruhat theorem applies to `𝐆` before transport through the specified analytic isomorphism. The diffeomorphism `K/T≅𝐆(ℂ)/𝐁(ℂ)` follows from the Layer 7 compact-form/algebraization comparison; it is not asserted for an unrelated real group. In particular, the elliptic complex torus `ℂ/(ℤ+iℤ)` is not a linear complex reductive group and is outside these hypotheses.
- **Bruhat and Schubert geometry.** ReductiveGroups RG7 is the single owner of the generic Bruhat/root-data theorem `G_ℂ=⨆_{w∈W}B w B`. Apply it to the preceding groups and construct Schubert cells `BwB/B`, their complex dimensions `ℓ(w)`, the flag CW structure, and cohomology.
<a id="block-borel-flag-orbits"></a>
- **The smaller block-Borel action on complete flags.** Over ℂ, for n≥1 put
  W=span(e₁,…,e_(n−1)) and
  `H={diag(b,1):b∈B_(n−1)}⊂GLₙ`, where each B_r is the upper-triangular
  subgroup. Construct this subgroup, its actual action on GLₙ/Bₙ and the
  following orbit chart. For 1≤j<n let
  `E⁰_j=span(e_(n−1)+e_n,…,e_(n−j)+e_n)`.
  The orbit of this complete flag is free and Zariski open dense. Give an
  isomorphism H→H·E⁰ with its regular inverse, rather than deducing an orbit
  assertion from equal dimensions.

  Explicitly, let p:ℂⁿ→W be projection along ℂe_n. On the chart where
  E_(n−1) is transverse to ℂe_n, write it uniquely as the graph of
  ℓ:W→ℂ and put F_j=p(E_j). Require F_• to lie in the upper-unipotent
  orbit of the opposite standard flag of W. By the existing Bruhat coordinates
  write it uniquely as u·F^opp_• with u upper unitriangular. Set
  `c_i=ℓ(u e_i)` for 1≤i<n and require every c_i≠0. Prove these conditions
  define a nonempty Zariski open subset of the actual flag variety and that
  its inverse orbit coordinate is `diag(u·diag(c_i⁻¹),1)∈H`. Prove both
  inverse equations, regularity, uniqueness and trivial stabilizer; use
  irreducibility of the flag variety for density. For n=1 the flag variety
  and H are points and all coordinate lists are empty. This chart concerns
  the smaller H action from Knutson's first-semester p49.

  Give the complete orbit classifications in ranks2 and3. For n=2 the
  representatives are the lines ℂe₁, ℂe₂ and ℂ(e₁+e₂), with the last the
  free open orbit. For n=3 write a flag as
  `(ℂl⊂span(l,q)⊂ℂ³)`. Its thirteen orbit representatives are:

  | l | allowed q (one orbit for each entry) |
  | --- | --- |
  | e₁ | e₂, e₃, e₂+e₃ |
  | e₂ | e₁, e₃, e₁+e₃ |
  | e₂+e₃ | e₁, e₃, e₁+e₃ |
  | e₁+e₃ | e₂, e₃ |
  | e₃ | e₁, e₂ |

  Prove exhaustiveness and distinctness constructively. First reduce the
  line to exactly one of these five representatives by upper-triangular
  coordinate operations. On ℂ³/ℂl the line stabilizers induce diagonal
  groups diag(a,1), a∈ℂ×, in the first three rows (using quotient bases
  (e₂,e₃), (e₁,e₃), (e₁,e₃)); these have exactly the two coordinate-line
  orbits and the orbit with both coordinates nonzero. In the fourth row use
  quotient basis (e₂,e₃): the induced group is
  `{[[d,0],[c,1]]:d≠0}`, with its fixed line ℂe₃ and its complementary
  orbit represented by ℂe₂. In the fifth row the quotient basis (e₁,e₂)
  gives the full upper-triangular B₂, with fixed line ℂe₁ and complementary
  orbit ℂe₂. Prove the stated stabilizer images and quotient orbit reductions;
  these identify planes containing l and establish all thirteen classes.
  The free open representative is the third row with q=e₁+e₃.


  Compute the stabilizers of the five line representatives and the full
  flag stabilizers in the actual group
  `b(a,t,c)=[[a,t,0],[0,c,0],[0,0,1]]`, a,c∈ℂ×. For l=e₁,e₂,e₂+e₃,
  e₁+e₃,e₃ the line stabilizers are respectively all B₂; t=0;
  t=0,c=1; a=1; all B₂. Prove each flag orbit is locally closed
  using the rank charts and quotient actions just given, and compute
  its dimension as3 minus its full stabilizer dimension. In the same
  row and q-entry order as the preceding table the dimensions are
  `(0,0,1); (1,1,2); (2,2,3); (2,1); (0,1)`.
  Thus there are three dimension-zero, five dimension-one, four
  dimension-two and one dimension-three orbits.

  In semester1 pp173–176 retain the uncertainties in the rewritten flag,
  incidence-star notation and small orbit diagrams. The literal candidate
  e_i=f_i+f_(i+1), e_n=f_n has its first line in the preserved hyperplane
  span(f₁,…,f_(n−1)) for n≥3; its orbit lies in that proper closed
  incidence locus and is not dense. It is not the displayed E⁰.
  Likewise b(1,1,1) moves both ℂe₂ and span(e₂,e₃); the invariant
  coordinate lines are ℂe₁,ℂe₃ and the invariant coordinate planes are
  span(e₁,e₂),span(e₁,e₃). Keep these matrix checks distinct from
  identifying the source's overwritten labels. A comparison reference is
  [Colarusso–Evens, §2 and Example4.15](https://arxiv.org/html/2406.10122v2).

- **Associated coherent lines and the two Borel conventions.** For the preceding connected
  linear complex groups use the actual algebraic character lattice X of T and the positive
  Borel B+. For χ∈X construct the algebraic associated line Eχ by descent, its G-linearization,
  transition functions, tensor E_(χ+ψ), dual E_(−χ), and base/character-change maps. Its analytic
  line is (G_C×ℂ)/((gb,z)∼(g,χ(b)z)). Construct its locally free rank-one coherent sheaf of
  holomorphic sections, and identify H⁰ with the actual holomorphic function subspace
  f(gb)=χ(b)⁻¹f(g), with (a·f)(g)=f(a⁻¹g). Compare evaluation, multiplication of sections,
  pullback and duals under this identification. Consume only the algebraic associated-line
  and rank-one bundle contracts of [SchubertGeometry S2.1, S3.1 and S3.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7cf01b380473933670e894c7b42390e08648eb71/TauCetiRoadmap/SchubertGeometry/README.md#s2-all-word-bottsamelson-and-crank-interfaces),
  with their precise negative-Borel convention, and own their application to this actual flag.
  Choose a longest-element representative n₀ and construct the G-equivariant isomorphism
  φ:G/B+→G/B−, gB+↦gn₀B−. Prove that φ* of the negative-Borel line with fibre character κ
  is the positive-Borel E_(w₀κ), including the linearization. Thus Lμ:=E_(−μ) corresponds
  to SchubertGeometry's L(−w₀μ). Record the change on torus characters, root-curve degrees,
  section actions and highest weights; inversion without its action change is not this
  equivariant identification. Pure central characters remain actual group characters.
- **Native cohomology and equivariant analytification.** Use native scheme-module cohomology
  `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (the underlying native `Sheaf.H`)
  for the algebraic line, with `cohomologyZeroEquiv` for global sections. Construct its
  ℂ-module structure and finite-dimensionality on this projective complex flag. On the
  analytic side use the same native sheaf cohomology for the coherent section sheaf,
  not ordinary singular/CW cohomology. Consume [ComplexComparisonPartII C−1.1,
  C0.1/C0.3–C0.5 and C1.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e3c8536df9555dc6e7027bfb3d60daef8bf33586/TauCetiRoadmap/ComplexComparisonPartII/README.md#c19-projective-and-proper-coherent-gaga):
  the actual analytification/ring sheaf, bundle–locally-free-sheaf dictionary, coherent
  pullback and canonical all-degree GAGA/exchange maps. Identify analytification of the
  algebraic associated line with the preceding holomorphic associated line by their actual
  transition functions and descent maps. Compare FCO's smooth analytic flag carrier with
  that same analytification through the point/chart/sheaf maps; this is an application
  after the independent analytic constructions, not a premise of generic GAGA.

  For every q≥0, construct the complex-linear G_C action on H^q from the line's linearization
  and pullback by g⁻¹. Prove identity, multiplication, naturality in line maps, tensor/character
  transport and the preceding H⁰ action formula. Construct the finite-dimensional algebraic
  representation on algebraic H^q, using proper projection G×X→G, coherent base change and
  the linearization cocycle; its analytification is the holomorphic action just constructed.
  Prove the canonical GAGA isomorphism is equivariant in every degree, using its naturality
  with those translations and, over the parameter G, the relative proper exchange map.
  Neither a dimension equality nor unrelated degreewise isomorphisms supply this comparison.
  This application consumes the stated early coherent/GAGA contracts, not all of SchubertGeometry;
  its S7 and S9 compact/topological comparisons consume these LieGroups flags afterwards.
<a id="big-cell-contragredient-verma"></a>
- **The full big-cell module and its contragredient Verma pairing.**
  In the preceding negative-Borel chart put C_λ=Γ(Ω,L(λ)|Ω), identified
  with O(N+) through the chosen nonzero fibre vector. This target
  supplies Knutson semester2 p6's module statement, beyond the preceding
  torus restriction and polynomial weight bound. Here Γ means algebraic
  regular sections. Preserve the earlier distinction from all holomorphic
  or arbitrary functions. Work with λ in the actual character lattice X.

  Construct the rational B+ action from the line's linearization and a
  complex Lie-algebra action D:g→End_ℂ(C_λ) by first-order polynomial
  differential operators. For g⁻¹n in the open Gauss domain write
  `g⁻¹n=n'(g,n)b−(g,n)`, with n'∈N+ and b−∈B−. In this domain the
  section formula is
  `f ↦ (n↦λ(b−(g,n))⁻¹ f(n'(g,n)))`.
  Differentiate at g=exp(tX), t=0, to define D_X. Prove that the result
  is a regular first-order operator on all N+, its independence from
  Gauss-chart presentations, complex linearity and the bracket law.
  Prove differentiation and Ad(B+) compatibility with the actual B+
  action, including the earlier torus weight λ−Σm_αα. This constructs
  the (g,B+) module; a global G action on the entire cell-section space
  is not inferred from this partially defined G formula. Prove that
  restriction of global sections R_λ intertwines this full Lie action
  and the B+ action, not only T.

  Use LieHighestWeight Layer3's native `TauCeti.VermaModule`, its PBW
  equivalence `universalEnvelopingEquivVermaModule` and native finite
  weight spaces. For reductive g first use its actual center/derived
  splitting: tensor the native semisimple Verma module with the
  one-dimensional central character λ|z, and compare with the full
  enveloping quotient by the positive-Borel highest-weight relations.
  The λ passed to the native module is the differential restricted to
  the derived Cartan. Keep the central lattice and character in the maps.

  Construct the pinned enveloping anti-involution τ fixing the Cartan
  and exchanging e_i,f_i. Use the native Chevalley involution ω,
  `TauCeti.IsChevalleySystem`, and the native enveloping antipode
  `TauCeti.UniversalEnvelopingAlgebra.antipodeOp`; on the center take
  ω=−id, so τ fixes it. Prove τ²=id and the product-reversal and
  generator equations. For M=M(λ) define its restricted contravariant
  dual as the direct sum of the **individual** weight-space duals,
  with action `(x·φ)(v)=φ(τ(x)v)`. Construct this action on that
  direct sum and prove its weight/support laws. There is no minus sign
  in this formula; ordinary dual action `−φ(xv)` is different.

  Construct the pairing on the actual native Verma quotient by
  `⟨f,u v_λ⟩=(D_(τ(u)) f)(1)`, extending D to U(g).
  Prove descent through the Verma relations, the normalization
  `⟨1,v_λ⟩=1`, contravariance
  `⟨D_x f,v⟩=⟨f,τ(x)v⟩`, and perfectness on every matching weight
  pair. In ordered root coordinates give the finite PBW/derivative
  matrices and inverses, with their factorial coefficients and
  nonzero diagonal. Prove every polynomial has finite weight support
  and that every finite-support family of functionals reconstructs a
  unique polynomial. Obtain an actual Lie-module equivalence
  `C_λ≃M(λ)^∨` and its inverse; equality of formal characters alone
  is insufficient. Compare with the B+ action by the same weights and
  locally nilpotent positive-root exponentials. When the root system is
  nonempty, the full algebraic dual of M is the strictly larger product
  of weight-space duals, admitting formal series. For a pure torus both
  duals equal the one-dimensional polynomial carrier O(point).
  Prove compatibility with
  changes of pinned root order, the chosen fibre-vector rescaling,
  determinant/central shifts, products and a pure torus or flag point.
  This construction uses the existing PBW/Verma supplier and Gauss
  charts, with no Borel–Weil or irreducible-character formula premise.

  For SL₂ use Ω={ [z:1] } and fibre character
  λ(diag(t,t⁻¹))=t^m, m∈ℤ. Prove on ℂ[z] that
  `D_e=−∂_z`, `D_h=m−2z∂_z`, `D_f=z²∂_z−mz`,
  so `[D_e,D_f]=D_h`, `[D_h,D_e]=2D_e`, `[D_h,D_f]=−2D_f`.
  For the native lowering basis f^j v_m the pairing is
  `⟨z^i,f^j v_m⟩=δ_ij(−1)^j j!`. Construct the coefficient
  extraction inverse and check this factorial/sign normalization.
  After the independent Borel–Weil target below, identify global
  restriction with the polynomial subspace of degree≤m for m≥0;
  it is the simple (m+1)-dimensional submodule generated by1.
  For m<0 the global image is zero. In particular m=0 gives constants,
  while the full cell module is still infinite-dimensional. The native
  polynomial signature examples are in [BigCellVermaTargets.lean](BigCellVermaTargets.lean).
  For a reference compare [Styrkas, *Regular representation on the big
  cell and big projective modules in the category O*, §2, Eq.2.17](https://archive.mpim-bonn.mpg.de/id/eprint/1247/2/preprint_2005_2.pdf),
  transporting its left/right and generator signs through the displayed maps.

- **Borel–Weil in degree zero.** For dominant λ∈X retain Lλ=E_(−λ) and prove
  H⁰(G_C/B+,Lλ)≃L(λ)*=L(−w₀λ), through the coefficient map
  ℓ↦(g↦ℓ(gvλ)), intertwining the actual actions. Prove the equivalent realizations
  H⁰(G_C/B−,E_(+λ))≃L(λ) and H⁰(G_C/B+,E_(w₀λ))≃L(λ)
  with their base/character comparisons. For B+ and fibre character+λ, some positive
  simple-coroot pairing gives negative degree on the corresponding rank-one curve and
  hence no sections. Pure central characters give their one-dimensional section spaces.
  The representation L(λ) is LieHighestWeight's actual irreducible carrier, transported
  by Layer7's representation comparison; do not replace the actual character lattice by
  all abstract Lie-algebra weights.
- **Relative rank-one cohomology and the reflection shift.** On the actual smooth proper
  minimal-parabolic map pα:G/B+→G/Pα+ construct its P¹ fibres, root-coordinate/local
  trivializations, relative canonical line ω_pα=E_α=L_(−α), restricting to O(−2),
  and equivariant restriction of Lμ of degree
  m=⟨μ,α∨⟩. Apply the opposite-Borel transport above to SchubertGeometry S2.1/S3.3's
  all-integer P¹ calculation: H⁰(O(m)) has dimension m+1 and H¹=0 for m≥0;
  both vanish for m=−1; for m≤−2, H⁰=0 and H¹ has dimension−m−1, with
  the actual T-weights and residue/relative-Serre pairing. Prove the relative higher-image
  vanishing and bundle identifications over G/Pα+, including base change, rather than
  using only fibre dimensions. Compare the relative canonical character and determinant
  factor to obtain a G-equivariant isomorphism pα*Lμ≃R¹pα*L_(sα·μ) for m≥0,
  with the other direct images zero, where sα·μ=μ−(m+1)α. Consume the generic Leray
  spectral sequence and edge/naturality interfaces of SchemeAndStackFoundations §2.2,
  through the same sheaf carriers and C0.5's composition comparison. Own its collapse
  on these two rows and prove H^q(X,Lμ)≃H^(q+1)(X,L_(sα·μ)) for every q≥0.
  For m=−1 all relative images and all H^q vanish. These are representation-level maps,
  not only Euler-character identities.
- **Dominant vanishing and the BWB deduction.** Construct the canonical-line identity
  K_X≃L_(−2ρ) with its G-linearization from the tangent-root weights; 2ρ is the sum
  of positive roots and lies in X even when ρ does not. For dominant λ, L_(λ+2ρ) is
  ample on the flag (central twists change the linearization, not positivity). Construct
  a positive Hermitian metric from a very-ample power and its Fubini–Study pullback,
  compare its curvature and line powers, and apply [ComplexKahlerGeometry K5b and
  K6.0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/17de96c131cb4bba925c11191595b59dd39cde98/TauCetiRoadmap/ComplexKahlerGeometry/README.md#k60-local-kähler-and-curvature-identities)'s
  compact Dolbeault/Hodge comparison and positive-curvature estimate on top-degree
  bundle-valued forms. Own this flag application: harmonic forms with values in
  K_X⊗L_(λ+2ρ)=Lλ vanish for q>0, so the actual coherent H^q(X,Lλ) vanishes.
  The root-free case X=point and arbitrary central characters are separate zero-dimensional
  tests. This is a specialized application of those generic suppliers, not a duplicate
  general Kodaira or coherent-vanishing owner.

  Iterate the equivariant reflection shifts along Weyl length. For a fibre character χ put
  μ=−χ. If μ+ρ is singular, transport to a simple wall m=−1 and prove every cohomology
  group zero. Otherwise choose the unique w with w(μ+ρ) strictly dominant, prove that
  the successive allowed rank-one shifts give the unique nonzero degree ℓ(w), and identify
  that representation as L(w(μ+ρ)−ρ)* by dominant vanishing and the degree-zero theorem.
  Identify the resulting representation independently of the reflection route; record
  changes of the chosen intertwiners under rank-two moves instead of asserting equality
  of unnormalized maps. Define each simple dot action by μ↦μ−(⟨μ,α∨⟩+1)α,
  so the construction preserves X without assuming ρ is itself a group character. Retain
  central characters, all Borel-change maps and the finite-component representation and
  component-cocycle applications of Layer7; those groups are not identified with connected
  highest-weight irreducibles without their component data.

### Layer 8N: compact normalizers, finite Tits lifts and splitting examples

This late application consumes Layer6's actual normalizer quotient and root/coroot
maps, Layers7/7F's compact-form/pinning and actual period dictionaries, and
[RootSystems4A](../RootSystems/README.md)'s finite root automorphisms. It is
independent of Layer8's flag/Borel–Weil endpoint and of Layer9's real-reductive
decompositions. No exceptional octonion application is a premise. Work with an
actual compact connected finite-dimensional real Lie group K, maximal T and
its actual full reductive datum; retain all central covering/gluing maps.

**Normalizer and action API.** Reuse `W=N_K(T)/T`, the quotient projection and
its exact kernel from Layer6, with the root/coroot comparison and conjugation
action on T. Construct change-of-torus, based-data and central-quotient
comparison maps, their inverses where appropriate and all commuting squares.
The quotient action on T exists without a homomorphic section. For semisimple
isogeny forms use the actual dual X,Y lattices; preserve the unrestricted
central torus and its finite gluing for reductive K. A finite root-space
automorphism need not preserve the chosen group form. Distinguish these maps
from the integral signed ADE lattice cover and its character kernel in
[ReductiveGroups9A.1a-L](../../ReductiveGroups/README.md).

**Coherent pinned representatives.** Construct simple representatives n_i in
this actual compact normalizer from one compact-compatible pinning and the
normalized rank-one maps. Compare them over ℂ, through the actual compact-form
and lattice maps, with native
[`geckSimpleWeylPoint`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/GeckLattice/Weyl/Basic.lean#L111-L121),
[`geckWeylWordPoint`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/GeckLattice/Weyl/Basic.lean#L350-L352) and
their torus-conjugation equations, or the corresponding actual group-form
transport. Split real Geck points are not a compact model. Prove the braid
equations and `n_i²=α_i∨(−1)` for these same representatives, their conjugation
on the full torus and the simple-root/coroot action. Separate arbitrary
rank-one phase choices do not automatically satisfy the braid equations.
Reuse the existing native word multiplication/action maps and RootSystems'
finite Coxeter presentation, not a second Coxeter or root construction.

In dimensionless compact coordinates write the actual torus as V/Y. By
Layer7F's calibration a dimensionless coroot maps to `2π α∨_comp`; hence
`n_i²` is the class of `α_i∨/2`, or `exp(π α_i∨_comp)`. Let Q∨ be the actual
coroot lattice in V, and H the subgroup of K generated by the n_i. Construct
normal-form reduction for words and inverse words: braid moves and deleting
repeated simple reflections give `a n_w`, where n_w is the specified reduced
word representative and a lies in the image A of `(1/2)Q∨` in T. Prove
independence of reduced words, the torus multiplication defect for products,
inverse/recovery equations, and changes of pinning. Conjugation preserves A;
squares generate A, so construct the exact finite extension

`1 → Q∨/(Q∨∩2Y) → H → W → 1`,

with both maps, the kernel isomorphism `q↦[q/2]`, inverse and evaluation
equations. Here `2Y={2y:y∈Y}`; the intersection is taken inside the actual V,
not in a guessed direct product. The kernel is elementary2 and need not be
central. For simply connected semisimple K it is `Q∨/2Q∨`, using the actual
two-inclusion period theorem Y=Q∨; for another group form it can shrink.
Root-free central directions create no new n_i, but retain their possible
gluing in Y. With no roots, H and W are trivial while N=T=K for a torus.
Construct the faithful permutation action of finite H on itself and its
finite-dimensional regular linear representation. Also restrict an actual
faithful finite-dimensional compact K representation from Layer7 and prove
its restriction faithful. The adjoint action cannot be silently used when
central elements lie in its kernel. No “double cover” wording identifies
this extension with a topological cover, a central signed-Q extension or the
whole extension of W by T.

**Actual splitting exercises.** In native matrix SU2 take
`T={diag(z,conj z):|z|=1}` and `j=[[0,−1],[1,0]]`. Prove T maximal, j normalizes
T, conjugation by j is inversion, `j²=−I`, and every element over the
nontrivial Weyl class is tj. Then `(tj)²=−I`, so the actual quotient N→W≃C2
has no group-homomorphic section. The adjoint SU2→SO3 quotient kills this
square; carry the actual map rather than transfer nonsplitting by a root label.

For SO(2r), choose the rotations in r coordinate two-planes. Define plane
permutation matrices, with determinant+1, and the reflections diag(1,−1)
in selected planes. Even reversal patterns give an actual complement
`C2^(r−1)⋊S_r` when r≥2. For SO(2r+1), also multiply the last line by the
product of the plane-reflection signs; every pattern is allowed and the
complement is `C2^r⋊S_r`. Prove the matrix products, orthogonality,
determinants, normalization, trivial intersection with T and coverage of the
entire normalizer quotient. One direct coverage proof uses the distinct
standard torus character pairs ±ε_i to show a normalizer permutes the real
two-planes; the residual rotations lie in T and determinant gives exactly
the displayed sign condition. Export the actual section and inverse
semidirect decomposition `T⋊complement≃N`, consuming native
`SemidirectProduct.mulEquivSubgroup`, and compare with the native matrix
carrier on `Fin n` through specified reindexing equivalences. Cardinality
alone is not a complement proof. Treat SO0/SO1 as points, SO2 with trivial W,
SO3 as the odd r=1 case, SO4 as reducible D2=A1×A1, and SO6 through D3=A3
without invalid irreducible Dynkin-type witnesses. Do not infer the same
splitting for Spin, SU or another central quotient from the SO calculation.

**Functorial scope.** Export maps of the finite lift extensions for compatible
central quotients/pinnings, actual image/kernel equations and the resulting
splitting comparisons. The action of based root-datum automorphisms must
preserve the actual isogeny lattice, including D4 triality restrictions.
For a central torus use Layer7F's finite central covering product and carry
its kernel instead of asserting an integral or group direct product.
Include rank0, rank1, disconnected root diagrams and component permutations.
The SU2 obstruction concerns its specified normalizer extension; it does not
assert impossibility of a based diagram→Lie functor, which the existing
pinned constructions already supply. All source notation/cover intent and
handwritten qualifications remain separate from these constructions.

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
- **Connected subgroups of the positive triangular group.** For n≥0,
  let A N⊂GL_n(ℂ) be the real Lie subgroup of upper-triangular matrices
  with strictly positive real diagonal, and let a n be its real Lie
  algebra of upper-triangular matrices with real diagonal. Construct
  these actual closed Lie subgroups inside GL_n(ℂ), their tangent
  identifications, and global inverse smooth maps exp:a n→A N and log.
  The diagonal entries of log(g) are log(g_ii). Recover off-diagonal
  entries recursively in the gap j−i: in exp(X)_ij the coefficient of
  X_ij is (exp(X_ii)−exp(X_jj))/(X_ii−X_jj), with its equal-diagonal
  value exp(X_ii)>0; all other terms involve smaller gaps. Prove the
  removable-value smoothness, positivity and both inverse identities,
  including repeated diagonal eigenvalues and complex off-diagonal
  entries. Compare with the native matrix exponential and the Lie-group
  exponential. This is a real completely solvable group: prove that its
  Lie algebra is solvable and every adjoint eigenvalue is real, rather
  than describing the generally nonnilpotent diagonal extension as nilpotent.

  For every connected finite-dimensional immersed Lie subgroup C of
  A N, with its given Lie-group topology and injective immersion into
  the matrix group, prove exp_C:Lie(C)→C is a global diffeomorphism.
  No embeddedness or closedness hypothesis is imposed on C. Identify
  Lie(C) with its finite-dimensional real Lie subalgebra c⊂a n and prove
  exponential naturality. For X∈c the left-trivialized derivative
  dexp_X=∫₀¹exp(−s ad X) ds preserves c; ambient invertibility and finite
  dimension imply that its restriction to c is invertible. Therefore
  exp_C is a local diffeomorphism at every X. The image exp(c) is closed
  in A N because c is a closed vector subspace and the ambient exp/log
  maps are homeomorphisms. Pull this closedness back along the given
  continuous inclusion of C, and use the open image of exp_C and
  connectedness to prove surjectivity. Ambient injectivity gives
  injectivity; construct the smooth inverse and prove that the original
  immersion is an embedding with closed image. These are conclusions
  about its original intrinsic topology, not a replacement topology.

  For every compact subgroup K≤GL_n(ℂ), prove K∩C={1}. Construct a
  K-invariant positive Hermitian form by the existing compact averaging
  theorem; every element of K is unitary for that form and hence
  diagonalizable with eigenvalues on the unit circle. An element of
  A N has positive real eigenvalues, so an element of the intersection
  has every eigenvalue1 and is the identity. Include the trivial n=0
  group and the n=1 real-logarithm case, and export the inclusion,
  exponential/logarithm and restriction equations for the subsequent
  KAN application.

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

Layer5N has its own Banach analytic cut: BanachSpaceTheory normed/function-space foundations,
DifferentialGeometry2.3 and3.1–3.2/3.5, native GroupLieAlgebra, and local Banach BCH precede its
covering/LieII and central-period constructions. Its C¹ loop charts and relative smoothing are
owned there; Layer2 SU(2)≃S³ and the early AlgebraicTopology sphere/Hurewicz and DG degree/Stokes
inputs feed its nonzero-period computation. The seed integration and product/central-pushout
maps then precede the irrational quotient obstruction. No finite-dimensional Frobenius/Ado,
compact conjugacy, Peter–Weyl, complexification, affine integrability or VOA is a premise.
The finite-Fourier/native affine comparison is terminal and does not feed nonintegrability.

Layer6A.1–6A.2 is placed after the initial compact connected abelian theorem of Layer6,
but before its conjugacy, root and integration applications and before Layer7. Its finite-vector
multiplication/adjugate construction has no field-classification premise. AT4.6 supplies the
native projectivization quotient topology/ratio charts and antipodal comparison; native
UniversalCover circle/product/RP fundamental-group maps give the final obstruction. The
dimension-two completion and polynomial quotient/tower argument then give the algebraic
endpoint. Layer6A.3–6A.4 uses Layers0–3, the closed/discrete quotient constructions and only
CompactGroups0–2 plus the native circle-character exhaustion; no Peter–Weyl separation,
complexification or triangularization is required. Its arbitrary finite-dimensional carrier
statement is transported from the actual matrix calculation, retaining the same scalar action.
The position of the section does not make later Layer6 conjugacy a premise of either argument.

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
tangent, center/derived and root-generation constructions. Its algebraic prerequisites include RG1/RG4/RG6
and the early generic RG7 Levi/Bruhat and RG8/RG9 full-root-datum/pinned-Chevalley contracts: FCO F4.3 uses
these for actual root-generation connectedness before the LG7 compact-form specialization. Those generic
algebraic contracts do not consume their later compact-form applications. The lower dictionary uses no
LG7 algebraic compact-form specialization, LG8, LG9 or C5.1. LG7 then uses the completed lower dictionary
and these actual algebraic inputs to construct its compact-form specialization; LG8 applies the same
single-owner generic RG7 Bruhat theorem on the resulting flag group. Its separate algebraization
target identifies `K_ℂ` with the complex points of an affine reductive algebraic group before LG8. Only after these
LG7 constructions does late FCO consume the compact form, the Layer 6 root/Weyl comparison and C5.1 for compact
restriction. Universal complexification retains Layer 4/5 integration and period data, Layer 6 tori, and
LieHighestWeight Layer 7 Serre data. Layer 8 (Borel–Weil) uses the group/compact-form inputs and actual character
lattice stated above, the root systems of [../RootSystems](../RootSystems/README.md), and `L(λ)` of
[../LieHighestWeight](../LieHighestWeight/README.md). Its associated-line/rank-one inputs are only SchubertGeometry
S2.1/S3.1/S3.3, followed by CCPII C−1/C0/C1.9's coherent and canonical GAGA maps; the actual cohomology
actions, opposite-Borel transport, relative P¹/Leray reflection shifts and BWB deduction are owned in LG8.
Its dominant-vanishing application consumes ComplexKahlerGeometry K5b/K6.0 and Schubert S3.1's ampleness,
not the downstream Schubert S7/S9 compact comparisons. Generic Bruhat remains RG7's single-owner theorem. Layer 9
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

- K.-H. Neeb, [*Towards a Lie theory of locally convex groups*](https://arxiv.org/html/1501.06269v1),
  VI.1.1–VI.1.16 — period obstructions, continuous central extensions, and the periodic su₂-loop
  construction used in Layer5N. The chosen quotient coordinate, matrix orientation and native
  adapters are fixed in Layer5N itself.
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


**Prototype typing boundary for the positive-pair application.** The new compact derivation targets are quantified over `A`, `PositivePairCoordinates A`, and an explicit comparison datum to native `TauCeti.Octonion ℂ`; the theorem hypotheses include the actual normed, finite-dimensional and real scalar-compatibility structures. They do not refer to `CompactDivisionOctonion.DivisionOctonionReal` from another unimported file. Every linear-to-bounded coordinate helper is finite-dimensional, every local chart smoothness witness is `ContDiffOn ℝ ⊤` on an open ambient domain containing the actual coordinates, and the native octonion/derivation modules are explicitly imported.
