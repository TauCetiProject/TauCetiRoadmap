# Roadmap: complex manifolds — transport, quotients, bundles, and gluing

**Summary.** A complex manifold is a space covered by charts with values in a finite-dimensional
complex vector space whose changes of coordinates are holomorphic. In Mathlib it is a type with a
charted space structure and a `C^∞` manifold structure over the model `𝓘(ℂ, E)`. This roadmap
builds, on those carriers, the general constructions that produce complex manifolds and holomorphic
vector bundles from simpler data. Manifolds have no boundary, complex models are finite-dimensional,
and "holomorphic" means `C^∞` over a complex model; the statements about quotients and gluing hold
over every model.

The first main theorem is realification with its orientation. A complex manifold of complex
dimension `n` is, on the same charts, a smooth real manifold of dimension `2n`, and holomorphic maps
and biholomorphisms are smooth maps and diffeomorphisms of it. The real Jacobian determinant of a
holomorphic map is the squared modulus of the complex one, so the holomorphic charts form an
oriented atlas: every complex manifold carries a canonical orientation, and every biholomorphism
preserves it. The real diffeomorphism `z ↦ z̄` of `ℂ` reverses it.

The second concerns quotients. Let a group `G` act freely and properly discontinuously on a
Hausdorff, locally compact complex manifold `M`, each element acting holomorphically. Then the orbit
space `M/G` is a complex manifold, the orbit projection is a local biholomorphism, and a
`G`-invariant map on `M` descends to a holomorphic map on `M/G` exactly when it is holomorphic. If
moreover `M` is compact and connected and `G` is finite, the line bundle on `M/G` associated to a
character of `G` is holomorphically trivial only for the trivial character. Smoothness of the
action does not suffice: `z ↦ z̄ + 1` generates a free, properly discontinuous action of `ℤ` on `ℂ`
whose quotient, the open Möbius band, is not orientable.

The third concerns gluing. If spaces `Uᵢ` are glued along open subsets `Vᵢⱼ`, and each overlap maps
by local biholomorphisms into both adjacent pieces, the glued space is a complex manifold with a
unique structure in which the pieces are open submanifolds. It is Hausdorff exactly when each set of
identified pairs is closed in `Uᵢ × Uⱼ`, and two copies of `ℂ` glued along `ℂ ∖ {0}` by the
identity give a complex manifold with two origins that is not Hausdorff.

Along the way the roadmap makes `OnePoint ℂ` the Riemann sphere, with its Möbius transformations as
biholomorphisms, and builds holomorphic vector bundles from cocycles, with their operations, the
normal bundle of a complex hypersurface and the canonical bundle. The orientation lives in the
carrier of [DifferentialGeometry](../DifferentialGeometry/README.md) Layer 2; the holomorphic tensor
and exterior-power bundles refine the smooth carriers of
[SmoothBundlesConnections](../SmoothBundlesConnections/README.md) §B2.1; covering-space theory stays
with [UniversalCovers](../../Completed/UniversalCovers/README.md), and gluing along boundaries with
[GeometricTopology](../GeometricTopology/README.md). Milestones 1–3 realify and transport atlases,
orient, and build the Riemann sphere; Milestones 4–6 take quotients, glue open pieces and prove the
point-set criteria for glued spaces and proper maps; Milestone 7 builds holomorphic vector and line
bundles. The order of work is below.

## How to read the build

Milestone 1 starts from Mathlib, and Milestone 3 from Mathlib's `OnePoint ℂ` and Tau Ceti's atlas on
it. Milestone 2 uses Milestone 1 and the orientation carrier of DifferentialGeometry Layer 2. The
quotient foundation §§4.1–4.2 and the gluing adapter of Milestone 5 use Milestone 1. Milestone 7
§§7.1–7.3 come next, using the gluing adapter and only the smooth operation carriers of
SmoothBundlesConnections §B2.1. Bundle descent §4.3 then uses §§7.1–7.3, and the character
application §7.6 uses §§4.1–4.3, so the quotient foundation does not depend on the bundle
application built on it. §§7.4–7.5 use the preceding bundle sections and the orientation convention
of Milestone 2. Milestone 6 uses the canonical maps of Milestone 5 for its gluing statements and
develops its general topology independently.

Item `k.n` of Milestone `k` is §`k.n`. Each milestone ends with its examples and its dependencies,
and each target carries a `*Needs:*` line listing what its statement and its proof route use, so
that a target proved another way is not held behind an unrelated milestone. A target, or the part of
one, that the pinned Tau Ceti proves ends with an *In Tau Ceti:* line naming the declarations that
realise it, read at the hypotheses the target states.

## Conventions

- **Complex manifolds.** A complex manifold is a type with Mathlib's `TopologicalSpace`,
  `ChartedSpace`, `HasGroupoid` and `IsManifold` instances; its carrier, topology, atlas and
  properties are never collected in a new record. A complex atlas is one in
  `contDiffGroupoid ∞ 𝓘(ℂ, E)`, where `∞ : ℕ∞ω` is smoothness and, over `ℂ`, holomorphy.
  `PartialDiffeomorph` is a tool inside proofs, not a public compatibility condition. Tau Ceti's
  atlas on `OnePoint ℂ` is installed at regularity `ω`, which implies `∞`.
- **Holomorphic actions.** A group action used in a complex quotient preserves the complex structure
  groupoid: `∀ g, ContMDiff 𝓘(ℂ, E) 𝓘(ℂ, E) ∞ (g • ·)`, which is Mathlib's class
  `ContMDiffConstSMul 𝓘(ℂ, E) ∞ G M`. Applying it to `g⁻¹` makes every action map a
  biholomorphism. Continuity, or smoothness after realification, is not enough.
- **Orbit projections and bundle projections are distinct.** For an action on `M`, the map
  `M → MulAction.orbitRel.Quotient G M` is the covering map and local biholomorphism. A map from that
  quotient to another base can be a submersion, but it is not thereby a covering map, and the orbit
  projection is never called the projection of a bundle over an unrelated base. The orbit space is
  always Mathlib's `MulAction.orbitRel.Quotient G M` (additively `AddAction.orbitRel.Quotient`),
  never a tagged copy or a chosen quotient section.
- **Named atlases.** A transported atlas is a named definition; it is supplied at its use sites as a
  local or scoped instance, never as an unrestricted global instance when several transported
  atlases can live on the same carrier. The Riemann sphere carries exactly one atlas, Tau Ceti's
  installed `OnePoint.instChartedSpace`.
- **Gluing input.** The atlas on an overlap `D.V (i, j)` is compatible with the piece atlases when
  both canonical maps `D.f i j : D.V (i, j) → D.U i` and `x ↦ D.f j i (D.t i j x) : D.V (i, j) → D.U j`
  are open local diffeomorphisms for the chosen model. This pair of conditions is the public gluing
  input (§5.1); smoothness of `D.t i j` between independently chosen overlap atlases is not
  sufficient (Check in §5.1).
- **Bundles.** Transition data are functions into continuous linear equivalences satisfying Mathlib's
  cocycle equations. A holomorphic vector bundle with model fibre `F` over a base modelled on
  `𝓘(ℂ, EB)` is a complex `VectorBundle` carrying Mathlib's mixin
  `ContMDiffVectorBundle ∞ F V 𝓘(ℂ, EB)`; a short name for this predicate, where one is used, is a
  reducible abbreviation of the mixin, never a new class or carrier. The mixin's transition
  condition quantifies over trivializations `e`, `e'` of the atlas (`MemTrivializationAtlas e`,
  `MemTrivializationAtlas e'`) and asks for holomorphic coordinate changes on
  `e.baseSet ∩ e'.baseSet`; on a core the condition is `VectorBundleCore.IsContMDiff`, holomorphy of
  each `coordChange i j` on `baseSet i ∩ baseSet j`.
  A morphism is a fibrewise complex-linear bundle map whose total map is holomorphic. A line bundle
  is the rank-one case of this API, not a separate carrier. The model fibre `F` is fixed once and
  for all, and `FiniteDimensional ℂ F` is an explicit hypothesis of every finite-rank statement.
- **Real coordinates.** An ordered complex basis `(e₁, …, eₙ)` is read as the ordered real basis
  `(e₁, i e₁, …, eₙ, i eₙ)`, and the standard real coordinates on `ℂⁿ` interleave real and imaginary
  parts, `(Re z₁, Im z₁, …, Re zₙ, Im zₙ)`. Products are ordered with the first factor first.

## Milestone 1: restriction of scalars and atlas transport

Fix a finite-dimensional complex normed space `E` and the boundaryless model `𝓘(ℂ, E)`; §1.1 and
§1.2 hold for every boundaryless model over a field extension `𝕜 ⊆ 𝕜'`. Kobayashi–Nomizu, Volume I,
Chapter I, supplies atlases and compatible transformations; Huybrechts, Chapter 1, supplies complex
manifolds and their underlying real manifolds.

### 1.1 The underlying real model

Define the underlying real model of a boundaryless complex model `I` by restriction of scalars: the
same chart carrier and the same chart maps, regarded over `ℝ`, so that the extended charts are
unchanged; for the self-model, the realification of `𝓘(ℂ, E)` is `𝓘(ℝ, E)`. Prove that membership in
the complex `contDiffGroupoid` implies membership in the real one. The real charted space of a
complex manifold is the complex one itself; prove that a complex `C^n` manifold is a real `C^n`
manifold for the realified model, with the complex maximal atlas contained in the real one.
*Needs:* Mathlib `ModelWithCorners`, `contDiffGroupoid`, `IsManifold`.
*In Tau Ceti:* `ModelWithCorners.restrictScalars`, `ModelWithCorners.extChartAt_restrictScalars`,
`modelWithCornersSelf_restrictScalars`, `ModelWithCorners.contDiffGroupoid_le_restrictScalars`,
`IsManifold.restrictScalars`, `IsManifold.maximalAtlas_subset_restrictScalars`.

**Checks.**

- On `ℂ` with its single chart, `z ↦ z̄` is `C^∞` for `𝓘(ℝ, ℂ)` but not holomorphic, so the real
  groupoid is strictly larger than the complex one and realification is faithful but not full: a
  real structure built from the complex groupoid itself, rather than from the real one, would reject
  this real diffeomorphism.

### 1.2 Functoriality of realification

Prove that realification is a faithful functor on the same carriers. A holomorphic map at a point,
on a set, or everywhere is smooth for the realified models, and a complex-differentiable map is
real-differentiable; a biholomorphism realifies to a diffeomorphism with the same underlying map,
compatibly with identities, inverses and composition; local and partial biholomorphisms realify to
local and partial diffeomorphisms. The real derivative of a holomorphic map is its complex
derivative with scalars restricted. Identify the tangent bundles over the identity of the base by a
homeomorphism of total spaces that carries tangent maps to tangent maps and bundle charts to bundle
charts; the tangent coordinate changes are then the complex ones with scalars restricted. For
products, the realification of a product model is the product of the realifications; on open
subspaces and restrictions realification is the identity on the same charts (§1.4).
*Needs:* §1.1; Mathlib `ContMDiff`, `Diffeomorph`, `IsLocalDiffeomorph`, `mfderiv`, `TangentBundle`.
*In Tau Ceti:* `ContMDiffAt.restrictScalars`, `ContMDiffOn.restrictScalars`,
`ContMDiff.restrictScalars`, `MDifferentiable.restrictScalars`, `Diffeomorph.restrictScalars`,
`Diffeomorph.restrictScalars_symm`, `Diffeomorph.restrictScalars_trans`,
`IsLocalDiffeomorph.restrictScalars`, `PartialDiffeomorph.restrictScalars`,
`MDifferentiableAt.mfderiv_restrictScalars`, `TangentBundle.restrictScalarsHomeomorph`,
`TangentBundle.restrictScalarsHomeomorph_tangentMap`,
`TangentBundle.trivializationAt_restrictScalarsHomeomorph`,
`TauCeti.tangentCoordChange_restrictScalars`, `ModelWithCorners.restrictScalars_prod`.

### 1.3 Transport of models and atlases

Transport a model along a continuous linear equivalence `e : E ≃L[𝕜] F` of model spaces by Mathlib's
`ModelWithCorners.transContinuousLinearEquiv`; the identity map is then a diffeomorphism between the
two models (`ContinuousLinearEquiv.toTransContinuousLinearEquiv`), so for model changes on one
carrier the comparison diffeomorphism has underlying map the identity. Prove that transport along
the identity equivalence is the original model, that transport along `e` followed by `e'` is
transport along their composite, and that transport leaves the maximal atlas unchanged, for models
over any nontrivially normed field and at every regularity; since every comparison diffeomorphism
has underlying map the identity, the comparison diffeomorphisms compose.

Define the transport of an atlas along a homeomorphism `e : N ≃ₜ M` of carriers: the charted space
on `N` whose charts are `e` followed by the charts of `M`. Prove that it inherits every structure
groupoid of `M`, with no closure-under-restriction hypothesis on the groupoid; that `e` is a
structomorphism and, when `M` is a `C^n` manifold, a `C^n` diffeomorphism with underlying map `e`;
and that transport along the identity is the original atlas, along a composite it is the iterated
transport, and transporting back along `e.symm` recovers the original. These atlases are named
values, used through local or scoped instances (Conventions).
*Needs:* Mathlib `ModelWithCorners.transContinuousLinearEquiv`,
`ContinuousLinearEquiv.toTransContinuousLinearEquiv`, `StructureGroupoid`, `Structomorph`.
*In Tau Ceti:* `ModelWithCorners.transContinuousLinearEquiv_refl`,
`ModelWithCorners.transContinuousLinearEquiv_trans`,
`ModelWithCorners.maximalAtlas_transContinuousLinearEquiv`, `Homeomorph.pullbackChartedSpace`,
`Homeomorph.pullbackChartedSpace_chartAt`, `Homeomorph.pullbackChartedSpace_atlas`,
`Homeomorph.transOpenPartialHomeomorph_mem_pullbackChartedSpace_atlas`,
`Homeomorph.pullback_hasGroupoid`, `Homeomorph.pullbackStructomorph`, `Homeomorph.pullback_isManifold`,
`Homeomorph.pullbackDiffeomorph`, `Homeomorph.coe_pullbackDiffeomorph`,
`Homeomorph.pullbackChartedSpace_refl`, `Homeomorph.pullbackChartedSpace_trans`,
`Homeomorph.pullbackChartedSpace_symm_pullbackChartedSpace`.

**Checks.**

- Two homeomorphisms `e₁, e₂ : ℂ ≃ₜ ℂ`, `z ↦ z` and `z ↦ z̄`, transport the standard atlas of `ℂ` to
  two atlases on the same carrier that are not holomorphically compatible (`z ↦ z̄` is not
  holomorphic), so both must remain available as named values: a global instance for either would
  make the other unreachable.

### 1.4 Realification, recharting, products and open restriction

Prove that realification commutes with recharting: realifying the transport of a complex model along
a complex continuous linear equivalence `e` is transporting the realified model along `e` with
scalars restricted. Realification commutes with products (§1.2). It commutes with restriction to an
open subset `U ⊆ M` by definition: the open-subset charted space
`TopologicalSpace.Opens.instChartedSpace` does not depend on the model, so the realified open
submanifold `U` and the open submanifold of the realified `M` are one charted space with one real
`C^n` structure, and the identity of `U` is a diffeomorphism between them.
*Needs:* §§1.1–1.3; Mathlib `TopologicalSpace.Opens.instChartedSpace`.
*In Tau Ceti:* `ModelWithCorners.restrictScalars_transContinuousLinearEquiv`,
`ModelWithCorners.restrictScalars_prod`.

### 1.5 Standard real coordinates on `ℂⁿ`

Define the standard coordinate equivalence between the realification of `EuclideanSpace ℂ (Fin n)`
and `EuclideanSpace ℝ (Fin (2 * n))`: the real linear isometry with interleaved coordinates
`(Re z₁, Im z₁, …, Re zₙ, Im zₙ)`. Define the standard real model on `EuclideanSpace ℂ (Fin n)` as
`𝓘(ℝ, EuclideanSpace ℂ (Fin n))` transported along that equivalence; its comparison with the
realification of `𝓘(ℂ, EuclideanSpace ℂ (Fin n))` is then the identity diffeomorphism of §1.3.
*Needs:* §§1.1, 1.3; Mathlib `EuclideanSpace`, `LinearIsometryEquiv`.
*In Tau Ceti:* `TauCeti.complexEuclideanRealLinearIsometryEquiv`, `TauCeti.complexEuclideanRealModel`,
`TauCeti.complexEuclideanRealModel_def`.

**Checks.**

- For `n = 2` the interleaved coordinates `(x₁, y₁, x₂, y₂)` and the block coordinates
  `(x₁, x₂, y₁, y₂)` differ by the transposition of the middle two entries, of determinant `−1`: a
  block convention would give `ℂ²` the orientation opposite to the canonical one of Milestone 2.

### Examples

`OnePoint ℂ`, realified, is a smooth real surface whose charts are the two charts of Milestone 3.
The pullback of the atlas of `ℂ` along `z ↦ z̄` and the identity atlas are the standard example of
two transported atlases on one carrier (Check in §1.3). On `ℂⁿ` the realified model and the standard
real model of §1.5 differ only by the coordinate equivalence of §1.5.

### Dependencies

Mathlib manifolds, models with corners, `contDiffGroupoid` and model transport. No other milestone of
this roadmap.

## Milestone 2: the canonical real orientation

Orientations live in the shared orientation carrier of DifferentialGeometry Layer 2,
`TauCeti.Manifold.Orientation`, whose orientation-preserving predicate is
`TauCeti.Manifold.Orientation.IsOrientationPreservingAt`; this roadmap introduces no second
orientation carrier. Bott–Tu, Section 1, supplies the complex-orientation convention.

### 2.1 The canonical orientation of a complex vector space

For a finite-dimensional complex space `E` of dimension `n`, regard an ordered complex basis `b` as
the real basis `(b₁, i b₁, …, bₙ, i bₙ)`, indexed by `Fin (2n)`. Prove that the real determinant of
the change between two such bases is the squared modulus of the complex one, hence positive, so that
all complex bases give one real orientation. Define the canonical orientation of `E` as this
orientation, without choosing a basis. Prove that complex-linear equivalences preserve it and that
on `ℂ` it is Mathlib's `Complex.orientation`.
*Needs:* Mathlib `Orientation`, `Module.Basis.det`, `Complex.orientation`.
*In Tau Ceti:* `Module.Basis.complexToReal`, `TauCeti.complexRealIndexEquiv`,
`Module.Basis.det_complexToReal`, `Module.Basis.orientation_complexToReal_eq`,
`TauCeti.complexOrientation`, `LinearEquiv.map_complexOrientation`,
`TauCeti.reindex_complexOrientation_complex`.

**Checks.**

- Multiplication by `c = a + b i` on `ℂ` has real matrix `[[a, −b], [b, a]]` and determinant
  `a² + b² = |c|² > 0`; the conjugation `z ↦ z̄` has determinant `−1`, so the bases `(1, i)` and
  `(1, −i)` have opposite orientations. An orientation defined from an arbitrary real basis would not
  be canonical.

### 2.2 The canonical orientation of a complex manifold

Prove that a holomorphic map between open subsets of `E` preserves the real orientation exactly where
its complex derivative is invertible, so that the complex groupoid lies in the orientation-preserving
groupoid and the maximal holomorphic atlas is an oriented atlas of the realification. Define the
canonical orientation of a complex manifold `M` modelled on `𝓘(ℂ, E)` by transporting the canonical
orientation of `E` through every chart: an orientation of `M` for the model `𝓘(ℝ, E)` in the shared
carrier, indexed by `Fin (2 · finrank ℂ E)`. Prove that it does not depend on the atlas
representative: every chart of the maximal holomorphic atlas carries it to the canonical model
orientation, and this property of the preferred charts characterizes it. Its orientation lift,
indexed by the real dimension, has every chart sign `+1`.
*Needs:* §2.1; Milestone 1 §1.1; DifferentialGeometry Layer 2 §2.1 (`TauCeti.Manifold.Orientation`,
`TauCeti.IsOrientedAtlas`).
*In Tau Ceti:* `TauCeti.orientationPreservingOn_iff_det_fderiv_ne_zero`,
`TauCeti.contDiffGroupoid_complex_le_orientationPreservingGroupoid`,
`TauCeti.isOrientedAtlas_maximalAtlas_complex`, `TauCeti.complexManifoldOrientation`,
`TauCeti.map_orientationAt_complexManifoldOrientation`, `TauCeti.eq_complexManifoldOrientation_iff`,
`TauCeti.complexOrientationLift`.

**Checks.**

- On `OnePoint ℂ` the change from the finite chart to the chart at infinity is `z ↦ z⁻¹`, with complex
  derivative `−z⁻²` and real Jacobian `|z|⁻⁴ > 0` on `ℂ ∖ {0}`. The same two charts on `OnePoint ℝ`
  have transition `x ↦ x⁻¹` with Jacobian `−x⁻² < 0`, so they do not form an oriented atlas: a
  construction that used the charts of an arbitrary real atlas would fail there.

### 2.3 Compatibility with open subsets, products, realification and recharting

Prove that the canonical orientation restricts to open submanifolds: on `U ⊆ M` open it is the
pullback of the orientation of `M` along the inclusion, and the inclusion preserves orientation. On a
product `M × M'` it is the ordered product orientation, `M` first, from the linear statement that
the canonical orientation of `E × E'` is the product of those of `E` and `E'`; it lives on the
realified manifold by construction. Prove that interchanging the factors, `M × M' → M' × M`,
preserves the canonical orientations: the sign is `(−1)^(2m · 2m') = +1` in complex dimensions `m`,
`m'`, and the linear statement is that exchanging the factors carries the product of the canonical
orientations of `E` and `F` to the product of those of `F` and `E`. Prove compatibility with
recharting along a complex continuous linear equivalence `e : E ≃L[ℂ] F`: the identity of `M` carries
the canonical orientation for `𝓘(ℂ, E)` to that for the transported model. Along a real continuous
linear equivalence of the realified model, real recharting preserves the transported orientation,
and its comparison with a separately fixed orientation of the new model has the sign of the real
determinant.
*Needs:* §§2.1–2.2; Milestone 1 §§1.3–1.4; DifferentialGeometry Layer 2 §2.2
(`TauCeti.Manifold.Orientation.prod`, `TauCeti.Manifold.Orientation.pullback`).
*In Tau Ceti:* `TauCeti.complexManifoldOrientation_opens_eq_pullback`,
`TauCeti.isOrientationPreservingAt_subtype_val_complexManifoldOrientation`,
`TauCeti.prod_complexOrientation`, `TauCeti.eq_prod_complexManifoldOrientation_iff`,
`TauCeti.map_prodComm_prod_complexOrientation` (the linear interchange).

**Checks.**

- On `ℂ × ℂ` the interchange `(x₁, y₁, x₂, y₂) ↦ (x₂, y₂, x₁, y₁)` is a product of two transpositions,
  of sign `+1`. The tempting formula `(−1)^(m m')` in complex dimensions would give `−1` for
  `m = m' = 1`.

### 2.4 Biholomorphisms preserve the canonical orientation

Prove that every biholomorphism, and every local biholomorphism at a point, preserves the canonical
orientations, in the orientation-preserving predicate of the shared carrier itself rather than
through an adapter or a second orientation definition, and that along a local biholomorphism the
canonical orientation is the pullback of the target's.
*Needs:* §2.2; DifferentialGeometry Layer 2 §2.2.
*In Tau Ceti:* `Diffeomorph.isOrientationPreservingAt_complexManifoldOrientation`,
`IsLocalDiffeomorphAt.isOrientationPreservingAt_complexManifoldOrientation`,
`IsLocalDiffeomorph.complexManifoldOrientation_eq_pullback`.

**Checks.**

- `z ↦ z̄` is a real diffeomorphism of `ℂ` of Jacobian determinant `−1` at every point, so it reverses
  the canonical orientation: the theorem does not extend from biholomorphisms to real
  diffeomorphisms.

### Examples

`ℂ` has the orientation of `(1, i)`; `ℂⁿ` that of `(e₁, i e₁, …, eₙ, i eₙ)`; every Möbius
transformation of Milestone 3 preserves the orientation of `OnePoint ℂ`, and every complex torus of
Milestone 4 is oriented by its holomorphic charts.

### Dependencies

Milestone 1; DifferentialGeometry Layer 2 (§§2.1–2.2); Mathlib `Orientation`.

## Milestone 3: the Riemann sphere

The Riemann sphere is Mathlib's `OnePoint ℂ` with Tau Ceti's installed atlas
`OnePoint.instChartedSpace`; the named atlas of this roadmap is that instance, and no second atlas is
installed on `OnePoint ℂ` or on a projective-line carrier. Forster, Sections 1–2, supplies the two
charts and the holomorphic transition.

### 3.1 The two charts

Define the finite chart, with source `OnePoint ℂ ∖ {∞}`, sending `z` to `z`, and the chart at
infinity, with source `OnePoint ℂ ∖ {0}`, sending `∞` to `0` and `z` to `z⁻¹`; both have target `ℂ`.
The atlas consists of exactly these two charts, the finite one chosen at finite points and the other
at `∞`.
*Needs:* Mathlib `OnePoint`.
*In Tau Ceti:* `OnePoint.affineChart`, `OnePoint.invChart`, `OnePoint.instChartedSpace`,
`OnePoint.affineChart_source`, `OnePoint.invChart_source`, `OnePoint.affineChart_coe`,
`OnePoint.invChart_coe`, `OnePoint.invChart_infty`, `OnePoint.mem_atlas_iff`, `OnePoint.chartAt_coe`,
`OnePoint.chartAt_infty`.

### 3.2 Transition and overlap formulas

Prove that the two charts overlap exactly on `ℂ ∖ {0}`, that the inverse of the chart at infinity
sends `w ≠ 0` to `w⁻¹`, and that the transition is inversion `z ↦ z⁻¹`, analytic on `ℂ ∖ {0}`; its
analyticity is part of the manifold structure of §3.3. Prove that holomorphy of a map into
`OnePoint ℂ` is tested in the finite chart at points sent to finite values and in the chart at
infinity at points sent to `∞`.
*Needs:* §3.1.
*In Tau Ceti:* `OnePoint.invChart_symm_of_ne_zero`, `OnePoint.inv_invChart`,
`OnePoint.mdifferentiableAt_iff_of_ne_infty`, `OnePoint.mdifferentiableAt_iff_of_eq_infty`.

**Checks.**

- The point `0` is outside the source of the chart at infinity and `∞` outside that of the finite
  chart, so the overlap is `ℂ ∖ {0}` and not `ℂ`: the transition `z ↦ z⁻¹` is analytic only there.
  At `z = 2` the two charts read `2` and `1/2`.

### 3.3 The complex manifold and its topology

Prove that `OnePoint ℂ` is an analytic manifold over `𝓘(ℂ)`, at regularity `ω`, hence a complex
manifold at `∞`, with its `ChartedSpace` and `HasGroupoid` structure. It is compact, Hausdorff (indeed
`T4`) and connected by Mathlib's instances for one-point compactifications of locally compact,
Hausdorff, connected, noncompact spaces, and second countable by
`ChartedSpace.secondCountable_of_sigmaCompact`.
*Needs:* §§3.1–3.2; Mathlib `OnePoint` instances, `ChartedSpace.secondCountable_of_sigmaCompact`.
*In Tau Ceti:* `OnePoint.instIsManifold` (at `ω`, for a proper nontrivially normed field).

**Checks.**

- `ℂ` is not compact while `OnePoint ℂ` is, and the finite chart has target all of `ℂ`: a single
  chart cannot cover a compact complex manifold of positive dimension, which is why two are needed.

### 3.4 Homogeneous coordinates and Möbius transformations

Relate the atlas to Mathlib's `OnePoint.equivProjectivization` by its homogeneous-coordinate
formulas: the finite chart sends `[v₀ : v₁]` with `v₁ ≠ 0` to `v₀ / v₁`, and the chart at infinity
sends `[v₀ : v₁]` with `v₀ ≠ 0` to `v₁ / v₀`. `GL(2, ℂ)` acts on `OnePoint ℂ` by Mathlib's
`OnePoint.instGLAction`, `[[a, b], [c, d]]` sending `z` to `(az + b)/(cz + d)`
(`OnePoint.smul_some_eq_ite`, `OnePoint.smul_infty_eq_ite`). Prove that each element acts
holomorphically, so that every Möbius transformation is a biholomorphism with inverse the
transformation of the inverse matrix, and that the inverse of the chart at infinity is the action of
`[[0, 1], [1, 0]]`.
*Needs:* §3.3; Mathlib `OnePoint.equivProjectivization`, `OnePoint.instGLAction`,
`ContMDiffConstSMul`.
*In Tau Ceti:* `OnePoint.affineChart_equivProjectivization_symm_mk`,
`OnePoint.invChart_equivProjectivization_symm_mk`, `OnePoint.instContMDiffConstSMul`,
`Diffeomorph.constSmul`, `OnePoint.invChart_symm_eq_smul`.

**Checks.**

- `[[0, 1], [1, 0]]` sends `z ≠ 0` to `1/z`, `0` to `∞` and `∞` to `0`, agreeing with the chart at
  infinity. The scalar matrix `2 · 1` acts as the identity, since `(2z)/2 = z`: the map from
  `GL(2, ℂ)` to biholomorphisms is not injective, and a definition of the action that let scalars act
  by `z ↦ 2z` would not be the projective one.

### Examples

The Riemann sphere is the target of meromorphic functions as holomorphic maps, tested as in §3.2;
`z ↦ 1/z`, translations `z ↦ z + b` and dilations `z ↦ az` are biholomorphisms of it. Its two charts
glue as in Milestone 5 from two copies of `ℂ` along `ℂ ∖ {0}` by `z ↦ z⁻¹`.

### Dependencies

Mathlib `OnePoint`, `OnePoint.equivProjectivization`, `OnePoint.instGLAction`. Milestone 2 for
orientation statements about `OnePoint ℂ` only.

## Milestone 4: smooth and complex quotients

Fix a group `G` acting freely and properly discontinuously on a manifold `M`, with
`ContinuousConstSMul G M`, `IsCancelSMul G M`, `T2Space M`, `LocallyCompactSpace M` and
`ContMDiffConstSMul I n G M`. The orbit space carries Mathlib's quotient atlas
`MulAction.instChartedSpaceQuotient`; the topological quotient and covering results of Mathlib
(`isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`, `MulAction.isOpenQuotientMap_quotientMk`,
`t2Space_of_properlyDiscontinuousSMul_of_t2Space`, `ContinuousConstSMul.secondCountableTopology`,
`Quotient.instConnectedSpace`) are inputs. Lee, Chapter 21, supplies the free proper-action quotient;
Forster, Sections 4–5, the analytic-covering and holomorphic descent pattern.

### 4.1 The orbit projection is a local diffeomorphism

Prove that the orbit space is a `C^n` manifold for Mathlib's atlas and that the orbit projection is a
`C^n` local diffeomorphism, with additive versions on `AddAction.orbitRel.Quotient`. For the complex
theorem, the displayed holomorphy of every action map is exactly `ContMDiffConstSMul 𝓘(ℂ, E) ∞ G M`,
so the orbit projection is a local biholomorphism without rebuilding the quotient manifold. Prove
that every chart of the orbit space is a local section of the orbit projection followed by a chart of
`M`. For any right inverse `g` of the orbit projection, for instance `Quotient.out`, Mathlib's
`IsLocalHomeomorph.chartedSpaceOfRightInverse` builds an atlas from `g`, whose charts are the local
inverses of the orbit projection at the points `g q` followed by charts of `M`; prove that it makes
the orbit space a `C^n` manifold for which the orbit projection is a `C^n` local diffeomorphism, the
action maps serving as the local deck transformations, and that it and Mathlib's installed atlas,
which is that construction for one chosen right inverse, define the same `C^n` structure: the
identity of the orbit space is a `C^n` diffeomorphism between them. These are compatible atlases, not
definitionally equal instances, and no competing global quotient atlas is installed.
*Needs:* Mathlib `MulAction.instChartedSpaceQuotient`, `IsLocalHomeomorph.chartedSpaceOfRightInverse`,
`ContMDiffConstSMul`, `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`.
*In Tau Ceti:* `TauCeti.instIsManifoldQuotient`, `TauCeti.isLocalDiffeomorph_quotientMk`,
`TauCeti.instIsManifoldAddQuotient`, `TauCeti.isLocalDiffeomorph_addQuotientMk`,
`TauCeti.exists_trans_eq_of_mem_atlas_quotient`,
`IsLocalHomeomorph.isManifold_chartedSpaceOfRightInverse`,
`IsLocalHomeomorph.isLocalDiffeomorph_chartedSpaceOfRightInverse`.

**Checks.**

- The glide reflection `z ↦ z̄ + 1` generates a free, properly discontinuous action of `ℤ` on `ℂ` by
  real diffeomorphisms (its `k`-th power moves the real part by `k`). The quotient is the open Möbius
  band, a smooth surface that is not orientable, so by Milestone 2 it carries no complex structure
  making the orbit projection a local biholomorphism: the complex theorem needs every action map
  holomorphic, and smoothness of the real quotient does not supply it.

### 4.2 Descent of invariant maps

Define the descent of an invariant map `f : M → N` to the orbit space: the unique map whose composite
with the orbit projection is `f`. Prove that for `m ≤ n` it is `C^m`, at the orbit of a point or
everywhere, exactly when `f` is; over `𝓘(ℂ, E)` this is holomorphic descent. Continuity descends in
the same way. Prove that descent commutes with postcomposition and with products, and that it is
natural under equivariant maps: a `C^m` map intertwining two such actions along a group homomorphism
induces a `C^m` map of orbit spaces.
*Needs:* §4.1; Mathlib `MulAction.orbitRel.Quotient`.
*In Tau Ceti:* `TauCeti.MulAction.orbitRelQuotientLift`, `TauCeti.MulAction.eq_orbitRelQuotientLift_iff`,
`TauCeti.contMDiffAt_orbitRelQuotientLift_iff`, `TauCeti.contMDiff_orbitRelQuotientLift_iff`,
`TauCeti.continuous_orbitRelQuotientLift_iff`, `TauCeti.MulAction.comp_orbitRelQuotientLift`,
`TauCeti.MulAction.orbitRelQuotientLift_prodMk`, `MulActionHom.orbitRelQuotientMap`,
`TauCeti.contMDiff_orbitRelQuotientMap`.

**Checks.**

- On the cylinder `ℂ/ℤ`, `z ↦ exp(2π i z)` is invariant and descends to a holomorphic map
  `ℂ/ℤ → ℂ`, injective with image `ℂ ∖ {0}` since `exp(2π i z) = exp(2π i w)` exactly when
  `z − w ∈ ℤ`; `z ↦ z` is not invariant and has no descent.

### 4.3 Descent of sections and of bundle maps

For a fibre bundle `V` over the orbit space, define the descent of an invariant section `t` of its
pullback along the orbit projection, a section of `V`. Prove that for `m ≤ n` it is `C^m` exactly
when `t` is, read either in the total space or as a section of Mathlib's pullback bundle; over
`𝓘(ℂ, E)` with `m = n = ∞` the holomorphic sections of a holomorphic bundle on `M/G` are the
invariant holomorphic sections of its pullback. Prove that equivariant bundle maps descend: for
vector bundles `V`, `W` over the orbit space, a fibrewise linear map between their pullbacks that
commutes with the action descends to a bundle map `V → W`, which is `C^m` exactly when the map
upstairs is. Prove that descent commutes with pullback, dual, tensor product and determinant, on the
carriers of §7.2.
*Needs:* §§4.1–4.2; Milestone 7 §§7.1–7.3; Mathlib `Bundle.Pullback`.
*In Tau Ceti:* `TauCeti.MulAction.orbitRelQuotientRec`, `TauCeti.contMDiff_section_orbitRelQuotientRec_iff`,
`TauCeti.contMDiff_pullback_section_iff_orbitRelQuotientRec`,
`IsLocalDiffeomorph.contMDiff_section_iff_pullback` (descent of sections).

### 4.4 Compact quotients

Prove that if a compact set `K ⊆ M` meets every orbit, the orbit space is compact, as the image of
`K` under the continuous orbit projection, together with the additive version, and that for an action
by homeomorphisms of a weakly locally compact space this criterion is also necessary.
*Needs:* Mathlib `MulAction.orbitRel.Quotient`, `IsCompact.image`.
*In Tau Ceti:* `TauCeti.MulAction.compactSpace_orbitRelQuotient_of_isCompact`,
`TauCeti.AddAction.compactSpace_orbitRelQuotient_of_isCompact`,
`TauCeti.MulAction.compactSpace_orbitRelQuotient_iff_exists_isCompact`.

**Checks.**

- The closed unit square meets every orbit of `ℤ + ℤ i` acting by translation, so `ℂ/(ℤ + ℤ i)` is
  compact. For `ℤ` alone, translations preserve imaginary parts, so no compact set meets every orbit
  and the cylinder `ℂ/ℤ` is not compact.

### 4.5 Quotients, realification and recharting

Prove that quotient manifolds commute, up to the identity of the orbit space, with realification and
recharting. The quotient atlas `MulAction.instChartedSpaceQuotient` does not depend on the model. A
holomorphic action is `C^n` for the realified model, so the realified orbit space and the quotient
of the realified `M` are one charted space with one real `C^n` structure. An action is `C^n` for a
model transported along a continuous linear equivalence `e` exactly when it is for the original
model, so the quotient for the transported model is the orbit space with its model transported, and
its comparison with the original model is the identity diffeomorphism
`ContinuousLinearEquiv.toTransContinuousLinearEquiv` of §1.3.
*Needs:* §4.1; Milestone 1 §§1.1–1.4; Mathlib `MulAction.instChartedSpaceQuotient`,
`ContinuousLinearEquiv.toTransContinuousLinearEquiv`.
*In Tau Ceti:* `ContMDiffConstSMul.restrictScalars`,
`ContinuousLinearEquiv.contMDiffConstSMul_transContinuousLinearEquiv_iff`.

### Examples

The quotient of `ℂ` by integer translations is built on `AddAction.orbitRel.Quotient ℤ ℂ` from
Mathlib's quotient atlas and covering theorem and the local-diffeomorphism theorem of §4.1; it is a
complex manifold, the orbit projection is a local biholomorphism, and a `1`-periodic map descends to
a holomorphic map exactly when it is holomorphic.
*In Tau Ceti:* `TauCeti.ComplexIntTranslation.isLocalDiffeomorph_quotientMk`,
`Function.Periodic.liftIntTranslationQuotient`,
`Function.Periodic.contMDiff_liftIntTranslationQuotient_iff`.

Complex tori `ℂⁿ/Λ` for a lattice `Λ` are compact by §4.4. The Hopf surface `(ℂ² ∖ {0})/⟨z ↦ 2z⟩` is
a compact quotient by a free, properly discontinuous holomorphic action of `ℤ`.

### Dependencies

Mathlib quotient atlas, properly discontinuous actions, quotient covering maps and pullback bundles;
Milestone 1; Milestone 7 §§7.1–7.3 for §4.3 only.

## Milestone 5: compatible open gluing

Let `D : TopCat.GlueData` and give every piece `D.U i` and every overlap `D.V (i, j)` a charted-space
structure for one model and structure groupoid. The topology of the glued space is Mathlib's: its
carrier `D.toGlueData.glued`, the canonical maps `D.toGlueData.ι i`, which are open embeddings
(`TopCat.GlueData.ι_isOpenEmbedding`) covering it (`TopCat.GlueData.ι_jointly_surjective`), the
identification criterion `TopCat.GlueData.ι_eq_iff_rel` and its universal property as a colimit. Lee,
Chapter 1, and Kobayashi–Nomizu's pseudogroup formulation supply the manifold arguments.

### 5.1 Overlap compatibility

Define compatibility of `D` for a model `I` and a regularity `n`: both maps from `D.V (i, j)` to its
adjacent pieces, `D.f i j` and `D.f j i ∘ D.t i j`, are `C^n` local diffeomorphisms. The overlap
atlas is thus compatible with both piece atlases, and the second map records the transition
equation. Prove that, equivalently, every inclusion `D.f i j` and every transition `D.t i j` is a
`C^n` local diffeomorphism. Prove the symmetry, restriction and cocycle lemmas for compatible data
from the `GlueData` axioms, without copying the gluing relation into a new record: compatibility is
inherited by restriction to a subfamily of pieces, and on triple overlaps the composite transitions
are local diffeomorphisms.
*Needs:* Mathlib `TopCat.GlueData`, `IsLocalDiffeomorph`.
*In Tau Ceti:* `TopCat.GlueData.IsCompatible`, `TopCat.GlueData.isCompatible_iff`,
`TopCat.GlueData.IsCompatible.of_isLocalDiffeomorph_t`, `TopCat.GlueData.IsCompatible.reindex`.

**Checks.**

- Take `D.U 0 = D.U 1 = ℂ` and `D.V (0, 1) = D.V (1, 0) = ℂ ∖ {0}` with the conjugate atlas `w = z̄`,
  `D.t` the identity and `D.f` the inclusions. Then `D.t` is holomorphic between the two overlap
  atlases, but `D.f 0 1`, which reads `w ↦ w̄` in charts, is not, so the data are not compatible: a
  criterion asking only for holomorphy of `D.t` would accept them.
- Gluing two copies of `ℂ` along `ℂ ∖ {0}` by `z ↦ 1/z̄` is compatible for `𝓘(ℝ, ℂ)` but not for
  `𝓘(ℂ, ℂ)`, since `z ↦ 1/z̄` is a real diffeomorphism of `ℂ ∖ {0}` that is not holomorphic.

### 5.2 The glued atlas

Define the atlas on `D.toGlueData.glued` by applying Tau Ceti's atlas of a space covered by open
embeddings, `TauCeti.chartedSpaceOfIsOpenEmbedding`, to the canonical maps: the chart at a point is
the inverse of the canonical map of a piece containing it, followed by a chart of that piece; its
local smooth transitions come from `TopCat.GlueData.ι_eq_iff_rel` and the two compatible overlap
maps. Prove that for compatible data with `C^n` pieces the glued space is a `C^n` manifold, every
canonical map is a `C^n` local diffeomorphism and a `C^n` diffeomorphism onto its open image, and a
map out of the glued space is `C^m`, `m ≤ n`, exactly when its restriction to every piece is. Over
`𝓘(ℂ, E)` this glues complex manifolds along holomorphic transitions. Empty pieces impose no extra
hypothesis.
*Needs:* §5.1; Mathlib `TopCat.GlueData.ι_isOpenEmbedding`, `TopCat.GlueData.ι_jointly_surjective`,
`TopCat.GlueData.ι_eq_iff_rel`; Tau Ceti `TauCeti.chartedSpaceOfIsOpenEmbedding`,
`TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding`, `TauCeti.partialDiffeomorphOfIsOpenEmbedding`.
*In Tau Ceti:* `TopCat.GlueData.chartedSpace`, `TopCat.GlueData.IsCompatible.isManifold`,
`TopCat.GlueData.IsCompatible.isLocalDiffeomorph_ι`, `TopCat.GlueData.IsCompatible.partialDiffeomorphι`,
`TopCat.GlueData.IsCompatible.contMDiff_iff`.

### 5.3 Uniqueness and functoriality

Prove that the glued structure is unique: any `C^n` structure on the glued space for which every
canonical map is a local diffeomorphism has the same maximal atlas, so the identity is a
diffeomorphism between the two. Prove that a subfamily of pieces covering the glued space gives the
same manifold, that maps out of a gluing are the compatible families of maps on the pieces, and that
maps of gluing data induce maps of glued manifolds, functorially. Prove compatibility with products,
the glued manifold of the product gluing data being the product of the glued manifolds, and with
atlas transport along homeomorphisms of the pieces (§1.3).
*Needs:* §5.2; Milestone 1 §1.3.
*In Tau Ceti:* `TopCat.GlueData.IsCompatible.maximalAtlas_chartedSpace_eq`,
`TopCat.GlueData.IsCompatible.reindexDiffeomorph`, `TopCat.GlueData.IsCompatible.descContMDiffMap`,
`TopCat.GlueData.IsCompatible.contMDiffMapEquiv`, `TopCat.GlueData.IsCompatible.mapContMDiffMap`,
`TopCat.GlueData.IsCompatible.mapContMDiffMap_id`, `TopCat.GlueData.IsCompatible.mapContMDiffMap_comp`.

### 5.4 Two-chart and finite-star gluings

Test the general theorem on two-chart and finite-star gluings, which are instances of it, not
separate constructions. Define the double of a manifold `X` along an open `U ⊆ X`, two copies of `X`
glued along `U` by the identity, and prove it compatible for every model. Prove that open subsets
`U i` covering a `C^n` manifold `X` form compatible gluing data (Mathlib's
`TopCat.GlueData.ofOpenSubsets`) whose glued manifold is `C^n` diffeomorphic to `X` by the canonical
map. Construct the finite-star gluing, a central piece `U₀` and pieces `U₁, …, Uₖ` each glued to `U₀`
alone along open subsets with holomorphic transitions, as `TopCat.GlueData`, prove it compatible, and
prove that every input overlap atlas is compatible with both adjacent piece atlases and every
canonical inclusion is an open local biholomorphism.
*Needs:* §§5.1–5.3; Mathlib `TopCat.GlueData.ofOpenSubsets`.
*In Tau Ceti:* `TauCeti.doubleGlueData`, `TauCeti.isCompatible_doubleGlueData`,
`TopCat.GlueData.isCompatible_ofOpenSubsets`, `TopCat.GlueData.openCoverGlueDiffeomorph`.

**Checks.**

- Two copies of `ℂ` glued along `ℂ ∖ {0}` by `z ↦ z⁻¹` give a compact complex manifold biholomorphic
  to `OnePoint ℂ` by the map that is the identity on the first piece and `w ↦ w⁻¹` on the second (with
  `0 ↦ ∞`); glued by the identity instead, they give the doubled origin of §6.6.

### 5.5 Gluing, realification and recharting

Prove that compatible open gluing commutes with realification and recharting up to the identity
diffeomorphism: the glued charted space does not depend on the model, compatibility for `𝓘(ℂ, E)`
implies compatibility for the realified model, and compatibility is invariant under recharting along
a continuous linear equivalence.
*Needs:* §5.2; Milestone 1 §§1.1, 1.3.
*In Tau Ceti:* `TopCat.GlueData.IsCompatible.restrictScalars`,
`TopCat.GlueData.isCompatible_transContinuousLinearEquiv_iff`.

### Examples

The Riemann sphere from two copies of `ℂ` (Check in §5.4); the doubled origin (§6.6); a manifold
recovered from an open cover (§5.4).

### Dependencies

Mathlib `TopCat.GlueData` and manifolds; the Tau Ceti atlas of a space covered by open embeddings
(supplier contracts below); Milestone 1.

## Milestone 6: finite-gluing topology and proper maps

The statements are in Mathlib's topology vocabulary. Bourbaki, Chapter I, supplies the
quotient-separation and proper-map criteria.

### 6.1 Second countability

Prove that for a countable, in particular finite, index type, the glued space of second-countable
pieces is second countable.
*Needs:* Mathlib `TopCat.GlueData`, `SecondCountableTopology`.
*In Tau Ceti:* `TopCat.GlueData.secondCountableTopology` (an instance).

**Checks.**

- Gluing uncountably many one-point spaces along empty overlaps gives an uncountable discrete space,
  which is not second countable: countability of the index cannot be dropped.

### 6.2 The Hausdorff criterion

Let `X = Σ i, D.U i`, and let `R ⊆ X × X` be the equivalence relation generated by every overlap
identification, including composites through other pieces. For `TopCat.GlueData` it is Mathlib's
`TopCat.GlueData.Rel`, already an equivalence relation (`TopCat.GlueData.rel_equiv`); its slice over
`(i, j)` is the set `Rᵢⱼ ⊆ D.U i × D.U j` of pairs with the same image in the glued space. Prove that
the map `X → D.toGlueData.glued` is an open quotient map, so that the glued space is Hausdorff exactly
when `R` is closed in `X × X`, with no hypothesis on the pieces (Mathlib's
`t2Space_iff_of_isOpenQuotientMap` for that map, with `TopCat.GlueData.ι_eq_iff_rel` identifying `R`
with the pairs of equal image), and exactly when every slice `Rᵢⱼ` is closed in `D.U i × D.U j`. Give
checkable hypotheses for closedness of the generated relation: for Hausdorff pieces, `Rᵢⱼ` is closed
exactly when points outside the two overlaps have neighbourhoods meeting no identified pair, and
closed overlaps in Hausdorff pieces suffice. Closedness of the graph of `D.t i j` inside
`D.V (i, j) × D.V (j, i)` is not a substitute.
*Needs:* Mathlib `TopCat.GlueData.Rel`, `TopCat.GlueData.ι_eq_iff_rel`, `t2Space_iff_of_isOpenQuotientMap`.
*In Tau Ceti:* `TopCat.GlueData.chartRel`, `TopCat.GlueData.mem_chartRel_iff`,
`TopCat.GlueData.isOpenQuotientMap_sigma_ι`, `TopCat.GlueData.t2Space_iff_isClosed_chartRel`,
`TopCat.GlueData.isClosed_chartRel_iff`, `TopCat.GlueData.t2Space_iff_forall_nhds`,
`TopCat.GlueData.t2Space_of_isClosed_range`.

**Checks.**

- For the doubled origin of §6.6 the graph of `D.t 0 1`, the diagonal of `ℂ ∖ {0}`, is closed in
  `(ℂ ∖ {0}) × (ℂ ∖ {0})`, while `R₀₁ = {(z, z) : z ≠ 0}` is not closed in `ℂ × ℂ`, its closure
  containing `(0, 0)`: a criterion testing the overlap graphs inside the overlaps would accept a
  non-Hausdorff space.

### 6.3 Connectedness

Prove that the glued space of nonempty connected pieces, over a nonempty index type, is connected
exactly when the graph on the indices with an edge for every nonempty overlap is connected, together
with the corresponding statement for preconnectedness.
*Needs:* Mathlib `TopCat.GlueData`, `ConnectedSpace`.
*In Tau Ceti:* `TopCat.GlueData.connectedSpace_iff_reflTransGen`,
`TopCat.GlueData.preconnectedSpace_iff_reflTransGen`.

**Checks.**

- Two copies of `ℂ` with empty overlap glue to `ℂ ⊔ ℂ`, which is disconnected, and the overlap graph has
  no edge; the doubled origin, with overlap `ℂ ∖ {0}`, is connected.

### 6.4 Properness is local on the target

Prove that for a continuous map `f : X → Y` and an open cover of `Y`, `f` is proper exactly when each
of its restrictions over the members of the cover is proper, with no separation hypothesis, so in
particular for a Hausdorff target, together with the pointwise form (properness over a neighbourhood
of every point of `Y`). Deduce that a proper map to a compact space has compact domain. The route
through finite closed refinements over compact subsets of a Hausdorff target is one proof; another
uses the characterization of proper maps as closed maps with compact fibres.
*Needs:* Mathlib `IsProperMap`, `isProperMap_iff_isClosedMap_and_compact_fibers`.
*In Tau Ceti:* `TopologicalSpace.IsOpenCover.isProperMap_iff_restrictPreimage`,
`Continuous.isProperMap_of_locally`, `IsProperMap.compactSpace`.

**Checks.**

- The inclusion `ℂ ∖ {0} → ℂ` is not proper (the preimage of the closed unit disc is not compact), yet
  its restriction over `ℂ ∖ {0}` is a homeomorphism: the open sets must cover the target, and dropping a
  neighbourhood of `0` hides the failure.

### 6.5 Invariance and agreement with Mathlib's typeclasses

Prove that the four results above, second countability, the Hausdorff criterion, connectedness and the
locality of properness for maps into glued spaces, are preserved by isomorphisms of gluing data (a
family of homeomorphisms of the pieces and of the overlaps commuting with `f` and `t`), and that their
conclusions are Mathlib's typeclasses `SecondCountableTopology`, `T2Space`, `ConnectedSpace` and the
predicate `IsProperMap` on the glued carrier.
*Needs:* §§6.1–6.4; Mathlib `TopCat.GlueData`.

### 6.6 The doubled origin

As a regression test, glue two copies of `ℂ` along `U = ℂ ∖ {0}` by the identity, the double of `ℂ`
along `U` of §5.4. Compute the generated relation: two points are identified exactly when they are
equal and either lie on the same copy or lie in `U`. Prove that it is not closed at the two origins,
and that the resulting doubled origin fails the Hausdorff criterion: the double of `X` along `U` is
Hausdorff exactly when `X` is Hausdorff and `U` is closed, and the two origins have no disjoint
neighbourhoods. It is nevertheless a complex manifold by Milestone 5.
*Needs:* §6.2; Milestone 5 §5.4.
*In Tau Ceti:* `TauCeti.doubleGlueData_ι_eq_iff`, `TauCeti.not_isClosed_doubleGlueData_chartRel`,
`TauCeti.t2Space_doubleGlueData_iff`, `TauCeti.not_disjoint_nhds_doubleGlueData_ι`,
`TauCeti.isCompatible_doubleGlueData`.

### Examples

The doubled origin (§6.6); the Riemann sphere as a Hausdorff gluing, since `R₀₁` for the inversion
gluing is the closed set `{(z, w) : zw = 1}` of `ℂ × ℂ`; `ℂ ⊔ ℂ` as a disconnected gluing.

### Dependencies

Mathlib `TopCat.GlueData`, proper maps and the separation and countability typeclasses; Milestone 5
for the canonical maps.

## Milestone 7: holomorphic vector and line bundles

Fix a complex normed space `F`, the model fibre, once and for all, and a complex manifold `B` modelled on
`𝓘(ℂ, EB)`. A holomorphic vector bundle is a complex `VectorBundle ℂ F V` with
`ContMDiffVectorBundle ∞ F V 𝓘(ℂ, EB)` (Conventions); the total-space manifold and the holomorphy of the
projection are Mathlib's. Huybrechts, Chapters 1–2, supplies analytic vector bundles and the canonical
bundle; Steenrod supplies transition functions and changes of trivialization.

### 7.1 Holomorphic trivializations

The admissible trivializations are those of the designated atlas and, equivalently, those of the
maximal compatible atlas `(contMDiffFiberwiseLinear B F 𝓘(ℂ, EB) ∞).maximalAtlas`. Prove that a linear
trivialization lies in it exactly when its coordinate changes with every trivialization of the atlas
are holomorphic; that atlas trivializations lie in it; that two members have holomorphic coordinate
changes; that changes of frame within it are exactly holomorphic gauges; and that holomorphy of a
section is tested in any member. An arbitrary continuous or real-smooth complex-linear trivialization
is not admissible: on the trivial line over `ℂ`, the gauge `exp(Re z)` sends the holomorphic constant
section to a nonholomorphic coordinate function (Check). `FiniteDimensional ℂ F` is explicit in every
finite-rank statement.
*Needs:* Mathlib `ContMDiffVectorBundle`, `contMDiffFiberwiseLinear`, `MemTrivializationAtlas`.
*In Tau Ceti:* `Bundle.Trivialization.mem_maximalAtlas_contMDiffFiberwiseLinear_iff`,
`Bundle.Trivialization.mem_maximalAtlas_of_memTrivializationAtlas`,
`Bundle.Trivialization.contMDiffOn_coordChangeL_of_mem_maximalAtlas`,
`Bundle.Trivialization.transFiberwiseLinear_mem_maximalAtlas_iff`,
`Bundle.Trivialization.contMDiffAt_section_iff_of_mem_maximalAtlas`; for the gauge `exp(Re z)`,
`TauCeti.expReTrivialization`, `TauCeti.expReTrivialization_notMem_maximalAtlas`.

**Checks.**

- On the trivial line over `ℂ`, the trivialization `(z, v) ↦ (z, v · exp(Re z))` is real-smooth and
  fibrewise complex-linear, but it sends the holomorphic constant section `1` to the coordinate function
  `exp(Re z)`, which is not holomorphic, so it is not admissible: an atlas of all real-smooth
  complex-linear trivializations would make holomorphy of sections chart-dependent.

### 7.2 Cocycle gluing and bundle operations

Holomorphic cocycle gluing uses Mathlib's core and prebundle constructors: a `VectorBundleCore` with
`VectorBundleCore.IsContMDiff 𝓘(ℂ, EB) ∞` is a holomorphic vector bundle
(`VectorBundleCore.instContMDiffVectorBundle`), and a prebundle with holomorphic coordinate changes
(`VectorPrebundle.IsContMDiff`) likewise. Mathlib's operations are holomorphic over `ℂ`: direct sums
(`Bundle.Prod.contMDiffVectorBundle`), Hom bundles and hence duals, as Hom bundles into the trivial line
(`ContMDiffVectorBundle.continuousLinearMap`), bundles of alternating maps
(`ContMDiffVectorBundle.continuousAlternatingMap`), and pullbacks along holomorphic maps, on Mathlib's
installed pullback carrier (`ContMDiffVectorBundle.pullback`). On the shared tensor, tensor-power and
exterior-power carriers of SmoothBundlesConnections §B2.1, prove that the induced transition maps are
holomorphic, so that tensor products, tensor powers and exterior powers of holomorphic bundles are
holomorphic. Supply bundle equivalences, identity, composition and naturality for every operation, and
equality or a canonical isomorphism with the generic §B2.1 operations after realification. Define the
determinant of a bundle of rank `r = finrank ℂ F` on the chosen top-exterior-power carrier of §B2.1, with
fibre `⋀^r F`, and prove its holomorphic structure and these comparisons there. No other operation
carrier is constructed.
*Needs:* §7.1; SmoothBundlesConnections §B2.1; Mathlib `VectorBundleCore`, `VectorPrebundle`,
`Bundle.Prod.contMDiffVectorBundle`, `ContMDiffVectorBundle.continuousLinearMap`,
`ContMDiffVectorBundle.pullback`.

**Checks.**

- A line bundle glued from a cocycle `g` has dual glued from `g⁻¹` (the inverse transpose of a `1 × 1`
  matrix), so `L ⊗ L*` is glued from `g · g⁻¹ = 1` and is trivial; the transpose without inverse would
  give `g²`.
- For the diagonal rank-two cocycle `diag(a, b)` the determinant line is glued from `ab`, while the bundle
  of alternating `2`-forms on the same bundle is glued from `(ab)⁻¹`: it is the dual of the determinant,
  and confusing the two would identify the canonical bundle of §7.5 with the determinant of the tangent
  bundle.

### 7.3 Holomorphic line bundles

Develop the rank-one case with the same API, with no separate line-bundle carrier. Prove that a
holomorphic line bundle (`finrank ℂ F = 1`) is trivial, through an admissible trivialization over all
of `B`, exactly when it has a nowhere-vanishing holomorphic section, and likewise over an open
`U ⊆ B`. Prove that cocycle isomorphisms are the holomorphic bundle equivalences: for holomorphic
cores with finite-dimensional fibre, a cocycle morphism glues to a biholomorphism of total spaces
exactly when its chart operators are holomorphic and its fibre maps are bijective, and every
holomorphic bundle equivalence arises from a unique such morphism.
*Needs:* §§7.1–7.2; Mathlib `VectorBundleCore`.
*In Tau Ceti:* `ContMDiffVectorBundle.exists_trivialization_baseSet_eq_univ_iff_exists_ne_zero`,
`ContMDiffVectorBundle.exists_trivialization_baseSet_eq_iff_exists_isLocalFrameOn`,
`VectorBundleCore.CoordinateHom`, `VectorBundleCore.CoordinateHom.exists_diffeomorph_iff`,
`VectorBundleCore.CoordinateHom.toDiffeomorph`, `VectorBundleCore.CoordinateHom.exists_toDiffeomorph_eq`.

**Checks.**

- On the two-chart cover of `OnePoint ℂ`, the cocycles `z ↦ zᵏ` and `z ↦ (2z)ᵏ = 2ᵏ zᵏ` on the overlap
  differ by the coboundary of nonzero constants, so they glue isomorphic line bundles: a notion of
  isomorphism as equality of cocycles would separate them.

### 7.4 The normal bundle of a complex hypersurface

For a holomorphic embedding `i : Z → M`, in the sense of Tau Ceti's `TauCeti.SmoothEmbedding` over
`𝓘(ℂ, ·)`, the normal spaces `T_{i z} M / di(T_z Z)` (`TauCeti.SmoothEmbedding.NormalSpace`, the quotient
by `TauCeti.SmoothEmbedding.tangentRange`) form a holomorphic vector bundle with model fibre any complex
space of the codimension (`TauCeti.SmoothEmbedding.normalSpaceContMDiffVectorBundle`). For a closed embedded
complex submanifold of complex codimension one, prove that `tangentMap i` is complex-linear and injective,
that its image is a complex vector subbundle of `i* TM`, and that the quotient `i* TM / TZ` is a
holomorphic line bundle. Construct its transition cocycle from transverse complex charts, in which `Z` is
the zero set of the last coordinate and the cocycle is the derivative of the last coordinate change in the
normal direction along `Z`, and prove that the quotient-bundle model and the transition-cocycle model are
isomorphic holomorphic line bundles. If the last coordinates `u_α`, `u_β` of two transverse charts are local
equations of `Z`, then `u_α = (u_α/u_β) u_β` gives `∂u_α/∂u_β = u_α/u_β` along `Z`: the cocycle is the
restriction to `Z` of the cocycle `u_α/u_β` of the line bundle of the divisor `Z` (Demailly, Chapter V,
(13.5), p. 271), and the differential of the canonical section of that bundle identifies the normal bundle
with its restriction to `Z` (Demailly, Chapter VII, proof of Proposition (12.4) a), p. 357, for an
exceptional divisor; the argument uses only that the section vanishes to first order along a smooth
hypersurface).
*Needs:* §§7.1–7.3; Milestone 2 (for the orientation convention of §7.5); Tau Ceti
`TauCeti.SmoothEmbedding`, `TauCeti.SmoothEmbedding.normalSpaceContMDiffVectorBundle`; Mathlib
`Manifold.IsSmoothEmbedding`.

**Checks.**

- The real hypersurface `Z = ℂ × ℝ ⊂ ℂ²` has tangent spaces `ℂ × ℝ`, which are not complex subspaces
  (`i · (0, 1) = (0, i) ∉ ℂ × ℝ`), so `TM / TZ` is a real line bundle, not a complex one: the theorem needs
  a complex submanifold, and a merely real-smooth hypersurface does not satisfy it.
- For the line `Z = {x₂ = 0}` in `ℙ²`, covered by the charts `x₀ ≠ 0` and `x₁ ≠ 0` with transverse
  coordinates `u₀ = x₂/x₀` and `u₁ = x₂/x₁`, the cocycle `u₀/u₁ = x₁/x₀` is the affine coordinate `t`
  of `Z`. Normal components satisfy `du₀ = t du₁` along `Z`, so the sections of the normal bundle are
  `s₀ = a + b t`, `s₁ = a/t + b`: a two-dimensional space containing `s₀ = t`, which vanishes once, so
  the normal bundle is `O(1)`. The inverse cocycle `1/t` would require `s₀` entire with `t s₀` bounded
  near `∞`, hence `s₀ = 0`: it glues the conormal bundle `O(−1)`, which has no nonzero section.

### 7.5 The holomorphic cotangent and canonical bundles

Define the holomorphic cotangent bundle as the cotangent bundle for the model `𝓘(ℂ, E)`: the bundle of
complex-linear functionals on the tangent spaces, with Mathlib's Hom-bundle structure. Construct its
determinant, of rank one, on the top-exterior-power carrier of §7.2, and the canonical line bundle
`K_M` from it, the top exterior power of the holomorphic cotangent bundle (Demailly, Chapter VII,
(3.4), p. 334), with the dual and top-exterior-power conventions stated in the declarations; identify
`K_M` with Mathlib's holomorphic bundle of complex alternating maps of degree `n = finrank ℂ E` on the
tangent spaces (`ContMDiffVectorBundle.continuousAlternatingMap`).
*Needs:* §7.2; Mathlib `ContMDiffVectorBundle.continuousLinearMap`,
`ContMDiffVectorBundle.continuousAlternatingMap`.
*In Tau Ceti:* `TauCeti.CotangentBundle` (the cotangent bundle, here at `𝓘(ℂ, E)`).

**Checks.**

- On `OnePoint ℂ` with `w = 1/z` on the overlap, `dw = −z⁻² dz` while `∂/∂w = −z² ∂/∂z`: the cotangent
  and tangent transitions are inverse to each other. A dual convention that transposed without inverting
  would give the cotangent bundle the tangent bundle's cocycle.

### 7.6 Line bundles from characters of a deck group

Let a finite group `G` act freely by biholomorphisms on a Hausdorff complex manifold `M`, so that
Milestone 4 applies (a finite group acts properly discontinuously), and for a character
`χ : G → ℂˣ` let `L_χ` be the associated holomorphic line bundle on `M/G`, the quotient of `M × ℂ` by
`g · (x, v) = (g x, χ(g) v)`, glued through §7.2 and §4.3 (Demailly, Chapter V, §6, p. 261, builds in
the same way, with locally constant transition functions, the bundle of a representation of the
fundamental group on the universal covering; here the covering is `M → M/G`); its holomorphic sections
are the holomorphic `f : M → ℂ` with `f(g x) = χ(g) f(x)`. Prove that the order of `χ` bounds the
tensor order of `L_χ`, since `L_χ^{⊗ k}` is `L_{χᵏ}`. Prove that the order is exact when the
character-to-Picard homomorphism `χ ↦ [L_χ]` is injective. Prove the standard sufficient theorem: if
`M` is compact and connected, every invertible holomorphic function on `M` is constant, so triviality
of `L_χ`, a nowhere-vanishing section, forces `χ` to be trivial, and the homomorphism is injective.
These are statements about bundle isomorphisms, not numerical fields of a divisor record.
*Needs:* §§7.2–7.3; Milestone 4 §§4.1–4.3; Mathlib's maximum principle on compact connected complex
manifolds (`MDifferentiable.apply_eq_of_compactSpace`).

**Checks.**

- `G = ℤ/2` acting on `ℂ ∖ {0}` by `z ↦ −z` with `χ(1) = −1`: `f(z) = z` is a nowhere-vanishing
  holomorphic section of `L_χ`, so `L_χ` is trivial although `χ` is not; compactness of `M` cannot be
  dropped.
- `G = ℤ/2` acting on a complex torus `ℂ/Λ` by translation by a point of order two, with `χ(1) = −1`:
  `L_χ ⊗ L_χ` is trivial, and `L_χ` is not, since a nowhere-vanishing section would be a constant `f`
  with `f = −f`; the tensor order is exactly `2`.
- Glue two copies of a complex torus `T = ℂ/Λ` by the identity along the complement of the four
  points `p` with `2p = 0` (§5.4), and let `ℤ/2` act by `z ↦ −z`, exchanging the two copies `p₁`, `p₂`
  of each such point `p`. The action is free and by biholomorphisms, and the glued space is compact and
  connected but not Hausdorff. Every neighbourhood of `p₁` contains the orbit `{p + w, p − w}` for small
  `w ≠ 0`, so the orbit projection is injective on no neighbourhood of `p₁`; and for `χ(1) = −1` a
  continuous `f` with `f(−z) = −f(z)` has `f(p₁) = f(p₂)`, both being limits of `f(p + w)`, and
  `f(p₂) = −f(p₁)`, so `f` vanishes at both: without the Hausdorff hypothesis there is no line bundle
  `L_χ` whose local sections are these functions.

### Examples

A cocycle for a trivial line bundle and a cocycle for a nontrivial finite-order character pass through the
same holomorphic-line-bundle constructor of §7.2. The tangent bundle of `OnePoint ℂ` is glued from the
cocycle `−z⁻²`, and its holomorphic vector field `∂/∂z` reads `−w² ∂/∂w` near `∞`, vanishing there.

### Dependencies

Mathlib vector bundles, cores, prebundles and their holomorphic operations; SmoothBundlesConnections
§B2.1; the Tau Ceti smooth-embedding and normal-space API (supplier contracts below); Milestones 2 and 4
where stated.

## Downstream consumers

[ConformalMapping](../../Completed/ConformalMapping/README.md) owns the one-variable analytic theorems,
Riemann mapping (Layer 3) and reflection (Layer 4), on Mathlib's `OnePoint ℂ`.
[ComplexTori](../ComplexTori/README.md) and [AnalyticToricGeometry](../../Completed/AnalyticToricGeometry/README.md)
consume the quotient, bundle and open-gluing interfaces here (Milestones 4, 5 and 7, with §7.6), and own
their geometric constructions without adding competing general quotient theorems.
[ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) consumes Milestones 1–4 and 7, and
[FuchsianOrbifolds](../FuchsianOrbifolds/README.md) Milestones 1, 2 and 4–6.

## Scope and ownership

This roadmap owns boundaryless atlas mechanics (realification, model and atlas transport), the canonical
orientation of complex manifolds as a construction in the shared orientation carrier, the Riemann-sphere
atlas and its Möbius API, the local-diffeomorphism and descent theory extending Mathlib's free properly
discontinuous quotients, compatible open gluing of `TopCat.GlueData` with its point-set criteria, and
holomorphic vector bundles with their gluing, operations, normal and canonical bundles and the deck
character theorem: Milestones 1–7 above. It extends Mathlib's `ChartedSpace`, `ModelWithCorners`,
`StructureGroupoid`, `HasGroupoid`, `Structomorph`, `IsManifold`, `Diffeomorph`, `IsLocalDiffeomorph`,
`TopCat.GlueData`, `FiberBundle`, `VectorBundle`, `ContMDiffVectorBundle` and orbit quotients, and
introduces no replacement manifold, gluing, quotient, orientation or bundle carrier. Suggested homes are
`TauCeti/Geometry/Manifold/Complex/`, `TauCeti/Geometry/Manifold/Quotient/` and
`TauCeti/Geometry/Manifold/VectorBundle/Holomorphic/`. The Mathlib work cited in the references determines
the shape of the API here, never whether a target proceeds, and overlapping implementations from that
work or from sibling roadmaps are integrated in coordination with their authors.

**Already in Mathlib.** The holomorphic cores and prebundles, direct sums, Hom and dual bundles,
alternating-map bundles and pullbacks that §7.2 uses are Mathlib's, over any nontrivially normed field,
and are used here over `ℂ` at `∞`; this roadmap states only their holomorphic refinements on the shared
§B2.1 carriers and the comparisons with them.

**Left to other roadmaps.**

- Universal covers, deck groups, quotient-cover classification and lifting theory:
  [UniversalCovers](../../Completed/UniversalCovers/README.md). This roadmap consumes Mathlib's
  `IsQuotientCoveringMap` and `IsAddQuotientCoveringMap` and adds the compatible local-diffeomorphism and
  holomorphic descent theory.
- Manifolds with boundary, collars, gluing along boundaries, handle attachment, connected sum and
  cobordisms: [GeometricTopology](../GeometricTopology/README.md) Layer 1 (§§1.1–1.4). Open gluing of
  boundaryless structure-groupoid atlases is owned here.
- Chosen manifold orientations, oriented atlases, orientation-preserving maps and the degree:
  [DifferentialGeometry](../DifferentialGeometry/README.md) Layers 2 and 10. This roadmap proves that a
  complex atlas has its canonical real orientation in that carrier, equal to the orientation defined by
  the source-indexed chart signs there, and supplies the integrable atlas constructions.
- Generic associated, direct-sum, dual, tensor, exterior-power and Hom bundle carriers that Mathlib lacks:
  [SmoothBundlesConnections](../SmoothBundlesConnections/README.md) §B2.1, of which only the foundational
  operation carriers are an input here, not its connections or projective examples. This roadmap proves
  their holomorphic refinements on those carriers, with explicit realification comparisons.
- One-variable analytic theorems such as Riemann mapping and Schwarz reflection:
  [ConformalMapping](../../Completed/ConformalMapping/README.md) Layers 3–4.
- Complex-torus families and analytic toric geometry: [ComplexTori](../ComplexTori/README.md) and
  [AnalyticToricGeometry](../../Completed/AnalyticToricGeometry/README.md), consumers of Milestones 4, 5
  and 7.

**Outside the roadmap.** Almost-complex structures and pseudoholomorphic curves, arbitrary covering-space
classification, coherent sheaf cohomology and Riemann–Roch.

## Exact supplier contracts

### From Mathlib

- **Manifolds** (`Mathlib/Geometry/Manifold/`): `ChartedSpace`, `ModelWithCorners`, `StructureGroupoid`,
  `HasGroupoid`, `contDiffGroupoid`, `Structomorph`, `IsManifold` with `IsManifold.maximalAtlas`,
  `ContMDiff`, `Diffeomorph`, `IsLocalDiffeomorph`, `PartialDiffeomorph`; model transport
  `ModelWithCorners.transContinuousLinearEquiv` with the identity diffeomorphism
  `ContinuousLinearEquiv.toTransContinuousLinearEquiv`; the open-subset charted space
  `TopologicalSpace.Opens.instChartedSpace` (`HasGroupoid.lean`); `ChartedSpace.secondCountable_of_sigmaCompact`;
  `Manifold.IsSmoothEmbedding`; `ContMDiffConstSMul` (`Mathlib/Geometry/Manifold/Algebra/SMul.lean`).
  Assumed: these are the carriers; nothing here restates them.
- **Gluing** (`Mathlib/Topology/Gluing.lean`): `TopCat.GlueData`, its carrier `D.toGlueData.glued`, the
  canonical maps `D.toGlueData.ι i`, `TopCat.GlueData.ι_isOpenEmbedding`,
  `TopCat.GlueData.ι_jointly_surjective`, `TopCat.GlueData.ι_eq_iff_rel`, the relation
  `TopCat.GlueData.Rel` with `TopCat.GlueData.rel_equiv`, `TopCat.GlueData.ofOpenSubsets`, its open-set
  criterion and its colimit universal property.
- **Quotients** (`Mathlib/Topology/Algebra/ConstMulAction.lean`, `Mathlib/Topology/Algebra/Group/Quotient.lean`,
  `Mathlib/Topology/Covering/Quotient.lean`, `Mathlib/Geometry/Manifold/Instances/Quotient.lean`): `ProperlyDiscontinuousSMul`,
  `ProperlyDiscontinuousVAdd`, `IsQuotientCoveringMap`, `IsAddQuotientCoveringMap`,
  `MulAction.orbitRel.Quotient`, `AddAction.orbitRel.Quotient`,
  `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul` (with its `isCoveringMap` field),
  `isAddQuotientCoveringMap_quotientMk_of_properlyDiscontinuousVAdd`, `MulAction.isOpenQuotientMap_quotientMk`,
  `t2Space_of_properlyDiscontinuousSMul_of_t2Space`, `ContinuousConstSMul.secondCountableTopology`,
  `Quotient.instConnectedSpace`, and the quotient atlas `MulAction.instChartedSpaceQuotient`
  (`AddAction.instChartedSpaceQuotient`), assumed for a free (`IsCancelSMul`), properly discontinuous
  action by homeomorphisms of a Hausdorff, locally compact charted space; that atlas is
  `IsLocalHomeomorph.chartedSpaceOfRightInverse` (`Mathlib/Geometry/Manifold/ChartedSpace.lean`) for a
  chosen right inverse of the orbit projection, its charts the local inverses
  `IsLocalHomeomorph.localInverseAt` followed by charts of the space.
- **Bundles** (`Mathlib/Topology/FiberBundle/`, `Mathlib/Topology/VectorBundle/`,
  `Mathlib/Geometry/Manifold/VectorBundle/`): `FiberBundle`, `VectorBundle`, `VectorBundleCore`,
  `VectorPrebundle`, `ContMDiffVectorBundle`, `VectorBundleCore.IsContMDiff` with
  `VectorBundleCore.instContMDiffVectorBundle`, `VectorPrebundle.IsContMDiff`, `MemTrivializationAtlas`,
  `contMDiffFiberwiseLinear`, bundle trivializations, `Bundle.Pullback` with
  `ContMDiffVectorBundle.pullback`, `Bundle.Prod.contMDiffVectorBundle`,
  `ContMDiffVectorBundle.continuousLinearMap`, `ContMDiffVectorBundle.continuousAlternatingMap`, all over
  an arbitrary nontrivially normed field and used here over `ℂ` at `∞`.
- **The projective line** (`Mathlib/Topology/Compactification/OnePoint/`): `OnePoint ℂ` with its compact,
  `T4` and connected instances, `OnePoint.equivProjectivization` and its homogeneous-coordinate formulas,
  the action `OnePoint.instGLAction` with `OnePoint.smul_some_eq_ite` and `OnePoint.smul_infty_eq_ite`.
- **Orientation and topology**: `Orientation`, `Complex.orientation`, `IsProperMap`,
  `isProperMap_iff_isClosedMap_and_compact_fibers`, `SecondCountableTopology`, `T2Space`,
  `t2Space_iff_of_isOpenQuotientMap` (`Mathlib/Topology/Separation/Hausdorff.lean`),
  `ConnectedSpace`; the maximum principle `MDifferentiable.apply_eq_of_compactSpace` for §7.6.

### From Tau Ceti

The declarations realising this roadmap's own items are named on the *In Tau Ceti:* lines of the
milestones above. Besides those, the roadmap consumes the following declarations, proved at the Tau Ceti
pin (paths under `TauCeti/`).

- **Atlases from open embeddings** (`Geometry/Manifold/Gluing/Basic.lean`):
  `TauCeti.chartedSpaceOfIsOpenEmbedding`, the charted space on a space covered by open embeddings of
  charted spaces, whose chart at a point is the inverse of the embedding of a piece containing it
  followed by a chart of that piece; `TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding`, which makes it
  a `C^n` manifold when the local transitions are `C^n`; and
  `TauCeti.partialDiffeomorphOfIsOpenEmbedding`. Assumed: §5.2 applies them to the canonical maps of a
  gluing, with no other atlas on the glued carrier.
- **Smooth embeddings and normal spaces** (`Geometry/Manifold/SmoothEmbedding/NormalSpace/`):
  `TauCeti.SmoothEmbedding`, `TauCeti.SmoothEmbedding.NormalSpace`, `TauCeti.SmoothEmbedding.tangentRange`,
  `TauCeti.SmoothEmbedding.normalSpaceContMDiffVectorBundle` (over a complete field, for
  finite-dimensional models, `m + 1 ≤ n`). Assumed: over `ℂ` they give the holomorphic normal bundle of a
  holomorphic embedding on which §7.4 builds.

### From TauCetiRoadmap.DifferentialGeometry

Layer 2, §§2.1–2.2: the orientation carrier `TauCeti.Manifold.Orientation` (the quotient of
`TauCeti.Manifold.OrientationLift`, a model orientation with source-indexed chart signs), oriented atlases
`TauCeti.IsOrientedAtlas`, the predicate `TauCeti.Manifold.Orientation.IsOrientationPreservingAt`, product
orientations `TauCeti.Manifold.Orientation.prod` (first factor first) and pullback along local
diffeomorphisms `TauCeti.Manifold.Orientation.pullback`. Assumed: one carrier for all orientations, with
the canonical complex orientation of Milestone 2 here living in it.

### From TauCetiRoadmap.SmoothBundlesConnections

§B2.1: the smooth finite-rank tensor, exterior-power, direct-sum, dual and Hom bundle carriers and their
fibrewise charts, generic over the field. Assumed: their charts are the fibrewise operations, so that the
transition maps of the induced bundles are the corresponding operations on transition matrices; only these
foundational carriers are consumed, not connections or projective examples.

## References

- Shoshichi Kobayashi and Katsumi Nomizu, *Foundations of Differential Geometry*, Volume I, Chapter I, for
  atlases, compatible transformations and pseudogroups.
- John M. Lee, *Introduction to Smooth Manifolds*, second edition, for atlases, smooth maps, quotients by
  free proper actions, and smooth bundles.
- Otto Forster, *Lectures on Riemann Surfaces*, Sections 1–2 for the Riemann sphere and its two charts, and
  Sections 4–5 for analytic coverings and holomorphic descent.
- Daniel Huybrechts, *Complex Geometry: An Introduction*, Chapters 1–2, for complex manifolds, their
  underlying real manifolds, holomorphic vector bundles and the canonical bundle.
- Jean-Pierre Demailly, *Complex Analytic and Differential Geometry*, version of 21 June 2012, on the
  [author's page](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf): Chapter V,
  §6 (p. 261) and (13.5) (p. 271), and Chapter VII, (3.4) (p. 334) and Proposition (12.4) (p. 357), for
  flat bundles of representations, the line bundle of a divisor, the canonical line bundle and the normal
  bundle of a hypersurface.
- Raoul Bott and Loring W. Tu, *Differential Forms in Algebraic Topology*, Section 1, for the
  complex-orientation convention.
- Norman Steenrod, *The Topology of Fibre Bundles*, for transition functions, changes of trivialization and
  bundle gluing.
- Nicolas Bourbaki, *General Topology*, Chapter I, for quotient separation and proper maps.
- [mathlib4#40727](https://github.com/leanprover-community/mathlib4/pull/40727), at
  [revision 9da60c2](https://github.com/pepamontero/mathlib4/blob/9da60c2df334c05bcf3b745a17854c9404bb0518/Mathlib/Geometry/Manifold/Instances/Quotient.lean):
  quotient manifolds through local inverses of the orbit projection, with
  `orbitRel.Quotient.localInverseAt`, `localInverseAt_apply_mk_eq_smul`,
  `localInverseAt_symm_trans_eqOn_smul`, `exists_smul_mem_localInverseAt_target`, `transitionMap`,
  `transitionMap_eqOn_smul`, `mk_chartAt_symm_mem_localInverseAt_source` and
  `MulAction.isManifold_quotient_of_contMDiffConstSMul`; its quotient atlas is
  `IsLocalHomeomorph.chartedSpaceOfRightInverse` for the right inverse `Quotient.out`, one of the atlases
  that §4.1 compares with the installed one.
- [mathlib4#42847](https://github.com/leanprover-community/mathlib4/pull/42847): transport of charted
  spaces and structure groupoids along homeomorphisms (module `Mathlib.Geometry.Manifold.PullbackGroupoid`,
  with `Homeomorph.pullbackChartedSpace`, `_chartAt`, `_atlas`,
  `transOpenPartialHomeomorph_mem_pullbackChartedSpace_atlas`, `pullback_symm_trans`,
  `pullback_hasGroupoid` and `pullbackStructomorph`), the design followed by §1.3.
