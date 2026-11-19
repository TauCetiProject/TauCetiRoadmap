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
[GeometricTopology](../GeometricTopology/README.md). Layers 1–3 realify and transport atlases,
orient, and build the Riemann sphere; Layers 4–6 take quotients, glue open pieces and prove the
point-set criteria for glued spaces and proper maps; Layer 7 builds holomorphic vector and line
bundles. The order of work is below.

## How to read the build

Layer 1 starts from Mathlib and the Tau Ceti realification API, and Layer 3 from Tau Ceti's atlas on
`OnePoint ℂ`. Layer 2 uses Layer 1 and the orientation carrier of DifferentialGeometry Layer 2. The
quotient foundation §§4.1–4.2 and the gluing adapter of Layer 5 use Layer 1. Layer 7 §§7.1–7.3 come
next, using the gluing adapter and only the smooth operation carriers of SmoothBundlesConnections
§B2.1. Bundle descent §4.3 then uses §§7.1–7.3, and the character application §7.6 uses §§4.1–4.3,
so the quotient foundation does not depend on the bundle application built on it. §§7.4–7.5 use the
preceding bundle sections and the orientation convention of Layer 2. Layer 6 uses the canonical maps
of Layer 5 for its gluing statements and develops its general topology independently.

Other roadmaps cite these layers as Milestones 1–7: Milestone `k` is Layer `k`, and its item `k.n`
is §`k.n`. Each layer ends with its examples and its dependencies, and each target carries a
`*Needs:*` line listing what its statement and its proof route use, so that a target proved another
way is not held behind an unrelated layer.

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
  input, Tau Ceti's `TopCat.GlueData.IsCompatible`; smoothness of `D.t i j` between independently
  chosen overlap atlases is not sufficient (Check in §5.1).
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

## Layer 1: restriction of scalars and atlas transport

Fix a finite-dimensional complex normed space `E` and the boundaryless model `𝓘(ℂ, E)`; §1.1 and
§1.2 hold for every boundaryless model over a field extension `𝕜 ⊆ 𝕜'`. Kobayashi–Nomizu, Volume I,
Chapter I, supplies atlases and compatible transformations; Huybrechts, Chapter 1, supplies complex
manifolds and their underlying real manifolds.

### 1.1 The underlying real model

The underlying real model is Tau Ceti's `ModelWithCorners.restrictScalars`: the same chart carrier
and the same chart maps, regarded over `ℝ`; for the self-model, `modelWithCornersSelf_restrictScalars`
identifies the realification of `𝓘(ℂ, E)` with `𝓘(ℝ, E)`. Membership in the complex `contDiffGroupoid`
implies membership in the real one (`ModelWithCorners.contDiffGroupoid_le_restrictScalars`). The real
charted space is the complex one itself, and the real manifold structure is
`IsManifold.restrictScalars`, with the complex maximal atlas contained in the real one
(`IsManifold.maximalAtlas_subset_restrictScalars`).
*Needs:* Tau Ceti `ModelWithCorners.restrictScalars`, `modelWithCornersSelf_restrictScalars`,
`ModelWithCorners.contDiffGroupoid_le_restrictScalars`, `IsManifold.restrictScalars`; Mathlib
`contDiffGroupoid`, `IsManifold`.

**Checks.**

- On `ℂ` with its single chart, `z ↦ z̄` is `C^∞` for `𝓘(ℝ, ℂ)` but not holomorphic, so the real
  groupoid is strictly larger than the complex one and realification is faithful but not full: a
  real structure built from the complex groupoid itself, rather than from the real one, would reject
  this real diffeomorphism.

### 1.2 Functoriality of realification

Realification is a faithful functor on the same carriers. A holomorphic map at a point, on a set,
or everywhere is smooth for the realified models (`ContMDiffAt.restrictScalars`,
`ContMDiffOn.restrictScalars`, `ContMDiff.restrictScalars`); a biholomorphism realifies to a
diffeomorphism with the same underlying map (`Diffeomorph.restrictScalars`), compatibly with
identities, inverses and composition (`Diffeomorph.restrictScalars_symm`,
`Diffeomorph.restrictScalars_trans`); local biholomorphisms realify to local diffeomorphisms
(`IsLocalDiffeomorph.restrictScalars`). The real derivative of a holomorphic map is its complex
derivative with scalars restricted (`MDifferentiableAt.mfderiv_restrictScalars`). The tangent
bundles are identified over the identity of the base by `TangentBundle.restrictScalarsHomeomorph`,
which carries tangent maps to tangent maps (`TangentBundle.restrictScalarsHomeomorph_tangentMap`)
and bundle charts to bundle charts (`TangentBundle.trivializationAt_restrictScalarsHomeomorph`);
the tangent coordinate changes are the complex ones with scalars restricted
(`TauCeti.tangentCoordChange_restrictScalars`). For products, realification of a product model is the
product of the realifications (`ModelWithCorners.restrictScalars_prod`).
*Needs:* §1.1; Tau Ceti `ContMDiff.restrictScalars`, `Diffeomorph.restrictScalars`,
`IsLocalDiffeomorph.restrictScalars`, `MDifferentiableAt.mfderiv_restrictScalars`,
`TangentBundle.restrictScalarsHomeomorph`, `ModelWithCorners.restrictScalars_prod`.

### 1.3 Transport of models and atlases

Transport along a continuous linear equivalence `e : E ≃L[𝕜] F` of model spaces is Mathlib's
`ModelWithCorners.transContinuousLinearEquiv`, with the identity map a diffeomorphism
`ContinuousLinearEquiv.toTransContinuousLinearEquiv`: for model changes on one carrier the
comparison diffeomorphism has underlying map the identity. Transport along a homeomorphism
`e : N ≃ₜ M` of carriers is Tau Ceti's `Homeomorph.pullbackChartedSpace` (charts
`Homeomorph.pullbackChartedSpace_chartAt`, atlas `Homeomorph.pullbackChartedSpace_atlas`), which
inherits every structure groupoid of `M` (`Homeomorph.pullback_hasGroupoid`), makes `e` a
structomorphism (`Homeomorph.pullbackStructomorph`) and a `C^n` diffeomorphism with underlying map
`e` (`Homeomorph.pullback_isManifold`, `Homeomorph.pullbackDiffeomorph`,
`Homeomorph.coe_pullbackDiffeomorph`). Transport along the identity is the original atlas, along a
composite it is the iterated transport, and transporting back along `e.symm` recovers the original
(`Homeomorph.pullbackChartedSpace_refl`, `Homeomorph.pullbackChartedSpace_trans`,
`Homeomorph.pullbackChartedSpace_symm_pullbackChartedSpace`). Prove the corresponding laws for model
transport: transport along the identity equivalence is the original model, and transport along
`e` followed by `e'` is transport along their composite, so that the comparison diffeomorphisms
compose. These atlases are named values, used through local or scoped instances (Conventions).
*Needs:* Mathlib `ModelWithCorners.transContinuousLinearEquiv`,
`ContinuousLinearEquiv.toTransContinuousLinearEquiv`; Tau Ceti `Homeomorph.pullbackChartedSpace`
and its API above.

**Checks.**

- Two homeomorphisms `e₁, e₂ : ℂ ≃ₜ ℂ`, `z ↦ z` and `z ↦ z̄`, transport the standard atlas of `ℂ` to
  two atlases on the same carrier that are not holomorphically compatible (`z ↦ z̄` is not
  holomorphic), so both must remain available as named values: a global instance for either would
  make the other unreachable.

### 1.4 Realification, recharting, products and open restriction

Realification commutes with recharting: realifying the transport of a model along a complex
equivalence `e` is transporting the realified model along `e` with scalars restricted
(`ModelWithCorners.restrictScalars_transContinuousLinearEquiv`), and with products
(`ModelWithCorners.restrictScalars_prod`). Prove that it commutes with restriction to an open
subset `U ⊆ M`: the realified manifold structure of the open submanifold `U` is the open
submanifold of the realified `M`, so that the identity of `U` is a diffeomorphism between the two.
*Needs:* §§1.1–1.3; Tau Ceti `ModelWithCorners.restrictScalars_transContinuousLinearEquiv`; Mathlib
`TopologicalSpace.Opens.instChartedSpace`.

### 1.5 Standard real coordinates on `ℂⁿ`

The standard coordinate equivalence between the realification of `EuclideanSpace ℂ (Fin n)` and
`EuclideanSpace ℝ (Fin (2 * n))` is Tau Ceti's `TauCeti.complexEuclideanRealLinearIsometryEquiv`, with
interleaved coordinates, and the real model it defines on `EuclideanSpace ℂ (Fin n)` is
`TauCeti.complexEuclideanRealModel n`, which is `𝓘(ℝ, EuclideanSpace ℂ (Fin n))` transported along that
equivalence (`TauCeti.complexEuclideanRealModel_def`); its comparison with the realification of
`𝓘(ℂ, EuclideanSpace ℂ (Fin n))` is therefore the identity diffeomorphism of §1.3.
*Needs:* §§1.1, 1.3; Tau Ceti `TauCeti.complexEuclideanRealModel`,
`TauCeti.complexEuclideanRealLinearIsometryEquiv`.

**Checks.**

- For `n = 2` the interleaved coordinates `(x₁, y₁, x₂, y₂)` and the block coordinates
  `(x₁, x₂, y₁, y₂)` differ by the transposition of the middle two entries, of determinant `−1`: a
  block convention would give `ℂ²` the orientation opposite to the canonical one of Layer 2.

### Examples

`OnePoint ℂ`, realified, is a smooth real surface whose charts are the two charts of Layer 3. The
pullback of the atlas of `ℂ` along `z ↦ z̄` and the identity atlas are the standard example of two
transported atlases on one carrier (Check in §1.3). On `ℂⁿ` the realified model and
`TauCeti.complexEuclideanRealModel n` differ only by the coordinate equivalence of §1.5.

### Dependencies

Mathlib manifolds, models with corners, `contDiffGroupoid` and model transport; the Tau Ceti
realification and pullback-atlas API named above. No other layer of this roadmap.

## Layer 2: the canonical real orientation

Orientations live in the shared orientation carrier of DifferentialGeometry Layer 2,
`TauCeti.Manifold.Orientation`, whose orientation-preserving predicate is
`TauCeti.Manifold.Orientation.IsOrientationPreservingAt`; this roadmap introduces no second
orientation carrier. Bott–Tu, Section 1, supplies the complex-orientation convention.

### 2.1 The canonical orientation of a complex vector space

For a finite-dimensional complex space `E`, regard an ordered complex basis `b` as the real basis
`(b₁, i b₁, …, bₙ, i bₙ)` (Tau Ceti's `Module.Basis.complexToReal`, reindexed by
`TauCeti.complexRealIndexEquiv`). The real determinant of the change between two such bases is the
squared modulus of the complex one (`Module.Basis.det_complexToReal`), hence positive, so all complex
bases give one real orientation (`Module.Basis.orientation_complexToReal_eq`). This is the canonical
orientation `TauCeti.complexOrientation E`, defined without choosing a basis; complex-linear
equivalences preserve it (`LinearEquiv.map_complexOrientation`), and on `ℂ` it is Mathlib's
`Complex.orientation` (`TauCeti.reindex_complexOrientation_complex`).
*Needs:* Mathlib `Orientation`, `Module.Basis.det`, `Complex.orientation`; Tau Ceti
`TauCeti.complexOrientation` and the lemmas above.

**Checks.**

- Multiplication by `c = a + b i` on `ℂ` has real matrix `[[a, −b], [b, a]]` and determinant
  `a² + b² = |c|² > 0`; the conjugation `z ↦ z̄` has determinant `−1`, so the bases `(1, i)` and
  `(1, −i)` have opposite orientations. An orientation defined from an arbitrary real basis would not
  be canonical.

### 2.2 The canonical orientation of a complex manifold

A holomorphic map between open subsets of `E` preserves the real orientation exactly where its
complex derivative is invertible (`TauCeti.orientationPreservingOn_iff_det_fderiv_ne_zero`), so the
complex groupoid lies in the orientation-preserving groupoid
(`TauCeti.contDiffGroupoid_complex_le_orientationPreservingGroupoid`) and the maximal holomorphic atlas
is an oriented atlas of the realification (`TauCeti.isOrientedAtlas_maximalAtlas_complex`). Transporting
`TauCeti.complexOrientation E` through every chart gives `TauCeti.complexManifoldOrientation E M`, an
orientation of `M` for the model `𝓘(ℝ, E)` in the shared carrier; it does not depend on the atlas
representative, since every chart of the maximal holomorphic atlas carries it to the canonical model
orientation (`TauCeti.map_orientationAt_complexManifoldOrientation`), and this property of the
preferred charts characterizes it (`TauCeti.eq_complexManifoldOrientation_iff`). Its orientation lift
indexed by the real dimension, `TauCeti.complexOrientationLift`, has every chart sign `+1`.
*Needs:* §2.1; Layer 1 §1.1; DifferentialGeometry Layer 2 §2.1 (`TauCeti.Manifold.Orientation`,
`TauCeti.IsOrientedAtlas`); Tau Ceti `TauCeti.complexManifoldOrientation` and the lemmas above.

**Checks.**

- On `OnePoint ℂ` the change from the finite chart to the chart at infinity is `z ↦ z⁻¹`, with complex
  derivative `−z⁻²` and real Jacobian `|z|⁻⁴ > 0` on `ℂ ∖ {0}`. The same two charts on `OnePoint ℝ`
  have transition `x ↦ x⁻¹` with Jacobian `−x⁻² < 0`, so they do not form an oriented atlas: a
  construction that used the charts of an arbitrary real atlas would fail there.

### 2.3 Compatibility with open subsets, products, realification and recharting

The canonical orientation restricts to open submanifolds: on `U ⊆ M` open it is the pullback of the
orientation of `M` along the inclusion (`TauCeti.complexManifoldOrientation_opens_eq_pullback`,
`TauCeti.isOrientationPreservingAt_subtype_val_complexManifoldOrientation`). On a product `M × M'` it
is the ordered product orientation, `M` first (`TauCeti.eq_prod_complexManifoldOrientation_iff`,
from `TauCeti.prod_complexOrientation`), and it lives on the realified manifold by construction.
Prove that interchanging the factors, `M × M' → M' × M`, preserves the canonical orientations (the
sign is `(−1)^(2m · 2m') = +1` in complex dimensions `m`, `m'`; the linear statement is
`TauCeti.map_prodComm_prod_complexOrientation`). Prove compatibility with recharting along a complex
continuous linear equivalence `e : E ≃L[ℂ] F`: the identity of `M` carries the canonical orientation
for `𝓘(ℂ, E)` to that for the transported model. Along a real continuous linear equivalence of the
realified model, real recharting preserves the transported orientation, and its comparison with a
separately fixed orientation of the new model has the sign of the real determinant.
*Needs:* §§2.1–2.2; Layer 1 §§1.3–1.4; DifferentialGeometry Layer 2 §2.2
(`TauCeti.Manifold.Orientation.prod`, `TauCeti.Manifold.Orientation.pullback`).

**Checks.**

- On `ℂ × ℂ` the interchange `(x₁, y₁, x₂, y₂) ↦ (x₂, y₂, x₁, y₁)` is a product of two transpositions,
  of sign `+1`. The tempting formula `(−1)^(m m')` in complex dimensions would give `−1` for
  `m = m' = 1`.

### 2.4 Biholomorphisms preserve the canonical orientation

Every biholomorphism, and every local biholomorphism at a point, preserves the canonical
orientations, in the predicate of the shared carrier itself
(`Diffeomorph.isOrientationPreservingAt_complexManifoldOrientation`,
`IsLocalDiffeomorphAt.isOrientationPreservingAt_complexManifoldOrientation`); along a local
biholomorphism the canonical orientation is the pullback of the target's
(`IsLocalDiffeomorph.complexManifoldOrientation_eq_pullback`).
*Needs:* §2.2; DifferentialGeometry Layer 2 §2.2.

**Checks.**

- `z ↦ z̄` is a real diffeomorphism of `ℂ` of Jacobian determinant `−1` at every point, so it reverses
  the canonical orientation: the theorem does not extend from biholomorphisms to real
  diffeomorphisms.

### Examples

`ℂ` has the orientation of `(1, i)`; `ℂⁿ` that of `(e₁, i e₁, …, eₙ, i eₙ)`; every Möbius
transformation of Layer 3 preserves the orientation of `OnePoint ℂ`, and every complex torus of
Layer 4 is oriented by its holomorphic charts.

### Dependencies

Layer 1; DifferentialGeometry Layer 2 (§§2.1–2.2); Mathlib `Orientation`; the Tau Ceti orientation
API named above.

## Layer 3: the Riemann sphere

The Riemann sphere is Mathlib's `OnePoint ℂ` with Tau Ceti's installed atlas
`OnePoint.instChartedSpace`; the named atlas of this roadmap is that instance, and no second atlas is
installed on `OnePoint ℂ` or on a projective-line carrier. Forster, Sections 1–2, supplies the two
charts and the holomorphic transition.

### 3.1 The two charts

The finite chart `OnePoint.affineChart` has source `OnePoint ℂ ∖ {∞}` and sends `z` to `z`; the chart
at infinity `OnePoint.invChart` has source `OnePoint ℂ ∖ {0}`, sends `∞` to `0` and `z` to `z⁻¹`
(`OnePoint.affineChart_source`, `OnePoint.invChart_source`, `OnePoint.affineChart_coe`,
`OnePoint.invChart_coe`, `OnePoint.invChart_infty`). Both have target `ℂ`, and the atlas consists of
exactly these two charts (`OnePoint.mem_atlas_iff`), the finite one at finite points and the other at
`∞` (`OnePoint.chartAt_coe`, `OnePoint.chartAt_infty`).
*Needs:* Mathlib `OnePoint`; Tau Ceti `OnePoint.affineChart`, `OnePoint.invChart`.

### 3.2 Transition and overlap formulas

The two charts overlap exactly on `ℂ ∖ {0}`, the inverse of the chart at infinity sends `w ≠ 0` to
`w⁻¹` (`OnePoint.invChart_symm_of_ne_zero`), and the transition is inversion `z ↦ z⁻¹`
(`OnePoint.inv_invChart`), analytic on `ℂ ∖ {0}`; its analyticity is part of the manifold instance of
§3.3. Holomorphy of a map into `OnePoint ℂ` is tested in the finite chart at points sent to finite
values and in the chart at infinity at points sent to `∞` (`OnePoint.mdifferentiableAt_iff_of_ne_infty`,
`OnePoint.mdifferentiableAt_iff_of_eq_infty`).
*Needs:* §3.1.

**Checks.**

- The point `0` is outside the source of the chart at infinity and `∞` outside that of the finite
  chart, so the overlap is `ℂ ∖ {0}` and not `ℂ`: the transition `z ↦ z⁻¹` is analytic only there.
  At `z = 2` the two charts read `2` and `1/2`.

### 3.3 The complex manifold and its topology

`OnePoint ℂ` is an analytic manifold over `𝓘(ℂ)` (`OnePoint.instIsManifold`, at `ω`), hence a complex
manifold at `∞`, with its `ChartedSpace` and `HasGroupoid` structure. It is compact, Hausdorff (indeed
`T4`) and connected by Mathlib's instances for one-point compactifications of locally compact,
Hausdorff, connected, noncompact spaces, and second countable by
`ChartedSpace.secondCountable_of_sigmaCompact`.
*Needs:* §§3.1–3.2; Tau Ceti `OnePoint.instIsManifold`; Mathlib `OnePoint` instances,
`ChartedSpace.secondCountable_of_sigmaCompact`.

**Checks.**

- `ℂ` is not compact while `OnePoint ℂ` is, and the finite chart has target all of `ℂ`: a single
  chart cannot cover a compact complex manifold of positive dimension, which is why two are needed.

### 3.4 Homogeneous coordinates and Möbius transformations

The atlas is related to Mathlib's `OnePoint.equivProjectivization` by its homogeneous-coordinate
formulas: the finite chart sends `[v₀ : v₁]` with `v₁ ≠ 0` to `v₀ / v₁`, and the chart at infinity
sends `[v₀ : v₁]` with `v₀ ≠ 0` to `v₁ / v₀` (`OnePoint.affineChart_equivProjectivization_symm_mk`,
`OnePoint.invChart_equivProjectivization_symm_mk`). `GL(2, ℂ)` acts on `OnePoint ℂ` by Mathlib's
`OnePoint.instGLAction`, `[[a, b], [c, d]]` sending `z` to `(az + b)/(cz + d)`
(`OnePoint.smul_some_eq_ite`, `OnePoint.smul_infty_eq_ite`); each element acts holomorphically
(`OnePoint.instContMDiffConstSMul`), so every Möbius transformation is a biholomorphism, with inverse
the transformation of the inverse matrix (`Diffeomorph.constSmul`). The inverse of the chart at
infinity is the action of `[[0, 1], [1, 0]]` (`OnePoint.invChart_symm_eq_smul`).
*Needs:* §3.3; Mathlib `OnePoint.equivProjectivization`, `OnePoint.instGLAction`; Tau Ceti
`OnePoint.instContMDiffConstSMul`, `Diffeomorph.constSmul`.

**Checks.**

- `[[0, 1], [1, 0]]` sends `z ≠ 0` to `1/z`, `0` to `∞` and `∞` to `0`, agreeing with the chart at
  infinity. The scalar matrix `2 · 1` acts as the identity, since `(2z)/2 = z`: the map from
  `GL(2, ℂ)` to biholomorphisms is not injective, and a definition of the action that let scalars act
  by `z ↦ 2z` would not be the projective one.

### Examples

The Riemann sphere is the target of meromorphic functions as holomorphic maps, tested as in §3.2;
`z ↦ 1/z`, translations `z ↦ z + b` and dilations `z ↦ az` are biholomorphisms of it. Its two charts
glue as in Layer 5 from two copies of `ℂ` along `ℂ ∖ {0}` by `z ↦ z⁻¹`.

### Dependencies

Mathlib `OnePoint`, `OnePoint.equivProjectivization`, `OnePoint.instGLAction`; the Tau Ceti atlas on
`OnePoint ℂ` and its Möbius API. Layer 2 for orientation statements in the examples only.

## Layer 4: smooth and complex quotients

Fix a group `G` acting freely and properly discontinuously on a manifold `M`, with
`ContinuousConstSMul G M`, `IsCancelSMul G M`, `T2Space M`, `LocallyCompactSpace M` and
`ContMDiffConstSMul I n G M`. The orbit space carries Mathlib's quotient atlas
`MulAction.instChartedSpaceQuotient`; the topological quotient and covering results of Mathlib
(`isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`, `MulAction.isOpenQuotientMap_quotientMk`,
`t2Space_of_properlyDiscontinuousSMul_of_t2Space`, `ContinuousConstSMul.secondCountableTopology`,
`Quotient.instConnectedSpace`) are inputs. Lee, Chapter 21, supplies the free proper-action quotient;
Forster, Sections 4–5, the analytic-covering and holomorphic descent pattern.

### 4.1 The orbit projection is a local diffeomorphism

The orbit space is a `C^n` manifold for Mathlib's atlas (Tau Ceti's `TauCeti.instIsManifoldQuotient`)
and the orbit projection is a `C^n` local diffeomorphism (`TauCeti.isLocalDiffeomorph_quotientMk`),
with additive versions on `AddAction.orbitRel.Quotient` (`TauCeti.instIsManifoldAddQuotient`,
`TauCeti.isLocalDiffeomorph_addQuotientMk`). For the complex theorem, the displayed holomorphy of every
action map is exactly `ContMDiffConstSMul 𝓘(ℂ, E) ∞ G M`, so the orbit projection is a local
biholomorphism without rebuilding the quotient manifold. Every chart of the orbit space is a local
section of the orbit projection followed by a chart of `M`
(`TauCeti.exists_trans_eq_of_mem_atlas_quotient`). Prove that for any right inverse `g` of the orbit
projection, for instance `Quotient.out`, the atlas `IsLocalHomeomorph.chartedSpaceOfRightInverse` built
from `g` and Mathlib's installed atlas define the same `C^n` structure: the identity of the orbit space
is a `C^n` diffeomorphism between them, and the atlas built from local inverses of the orbit projection
in mathlib4#40727 is compared with the installed one in the same way. These are compatible atlases, not
definitionally equal instances, and no competing global quotient atlas is installed.
*Needs:* Mathlib `MulAction.instChartedSpaceQuotient`, `ContMDiffConstSMul`,
`isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`; Tau Ceti
`TauCeti.isLocalDiffeomorph_quotientMk`, `IsLocalHomeomorph.isLocalDiffeomorph_chartedSpaceOfRightInverse`.

**Checks.**

- The glide reflection `z ↦ z̄ + 1` generates a free, properly discontinuous action of `ℤ` on `ℂ` by
  real diffeomorphisms (its `k`-th power moves the real part by `k`). The quotient is the open Möbius
  band, a smooth surface that is not orientable, so by Layer 2 it carries no complex structure making
  the orbit projection a local biholomorphism: the complex theorem needs every action map holomorphic,
  and smoothness of the real quotient does not supply it.

### 4.2 Descent of invariant maps

For an invariant map `f : M → N`, its descent to the orbit space is Tau Ceti's
`TauCeti.MulAction.orbitRelQuotientLift`, unique among maps whose composite with the projection is `f`
(`TauCeti.MulAction.eq_orbitRelQuotientLift_iff`). For `m ≤ n` it is `C^m`, at the orbit of a point or
everywhere, exactly when `f` is (`TauCeti.contMDiffAt_orbitRelQuotientLift_iff`,
`TauCeti.contMDiff_orbitRelQuotientLift_iff`); over `𝓘(ℂ, E)` this is holomorphic descent. Descent
commutes with postcomposition (`TauCeti.MulAction.comp_orbitRelQuotientLift`) and with products
(`TauCeti.MulAction.orbitRelQuotientLift_prodMk`), and is natural under equivariant maps: a `C^m` map
intertwining two such actions along a group homomorphism induces a `C^m` map of orbit spaces
(`MulActionHom.orbitRelQuotientMap`, `TauCeti.contMDiff_orbitRelQuotientMap`). Continuity descends in the
same way (`TauCeti.continuous_orbitRelQuotientLift_iff`).
*Needs:* §4.1; Tau Ceti `TauCeti.MulAction.orbitRelQuotientLift`,
`TauCeti.contMDiff_orbitRelQuotientLift_iff`, `TauCeti.contMDiff_orbitRelQuotientMap`.

**Checks.**

- On the cylinder `ℂ/ℤ`, `z ↦ exp(2π i z)` is invariant and descends to a holomorphic map
  `ℂ/ℤ → ℂ`, injective with image `ℂ ∖ {0}` since `exp(2π i z) = exp(2π i w)` exactly when
  `z − w ∈ ℤ`; `z ↦ z` is not invariant and has no descent.

### 4.3 Descent of sections and of bundle maps

For a fibre bundle `V` over the orbit space, an invariant section `t` of its pullback along the orbit
projection descends to the section `TauCeti.MulAction.orbitRelQuotientRec t ht` of `V`, which for `m ≤ n`
is `C^m` exactly when `t` is, read either in the total space or as a section of Mathlib's pullback
bundle (`TauCeti.contMDiff_section_orbitRelQuotientRec_iff`,
`TauCeti.contMDiff_pullback_section_iff_orbitRelQuotientRec`); over `𝓘(ℂ, E)` with `m = n = ∞` the
holomorphic sections of a holomorphic bundle on `M/G` are the invariant holomorphic sections of its
pullback. Prove that equivariant bundle maps descend: for vector bundles `V`, `W` over the orbit space,
a fibrewise linear map between their pullbacks that commutes with the action descends to a bundle map
`V → W`, which is `C^m` exactly when the map upstairs is. Prove that descent commutes with pullback,
dual, tensor product and determinant, on the carriers of §7.2.
*Needs:* §§4.1–4.2; Layer 7 §§7.1–7.3; Tau Ceti `TauCeti.MulAction.orbitRelQuotientRec`,
`TauCeti.contMDiff_section_orbitRelQuotientRec_iff`; Mathlib `Bundle.Pullback`.

### 4.4 Compact quotients

If a compact set `K ⊆ M` meets every orbit, the orbit space is compact, as the image of `K` under the
continuous orbit projection (Tau Ceti's `TauCeti.MulAction.compactSpace_orbitRelQuotient_of_isCompact`,
additively `TauCeti.AddAction.compactSpace_orbitRelQuotient_of_isCompact`); for an action by
homeomorphisms of a weakly locally compact space this criterion is also necessary
(`TauCeti.MulAction.compactSpace_orbitRelQuotient_iff_exists_isCompact`).
*Needs:* Mathlib `MulAction.orbitRel.Quotient`; Tau Ceti
`TauCeti.MulAction.compactSpace_orbitRelQuotient_of_isCompact`.

**Checks.**

- The closed unit square meets every orbit of `ℤ + ℤ i` acting by translation, so `ℂ/(ℤ + ℤ i)` is
  compact. For `ℤ` alone, translations preserve imaginary parts, so no compact set meets every orbit
  and the cylinder `ℂ/ℤ` is not compact.

### 4.5 Quotients, realification and recharting

Prove that quotient manifolds commute, up to the identity diffeomorphism of the orbit space, with
realification and recharting: for a holomorphic action, the realified orbit space and the quotient
of the realified `M` by the realified action (`ContMDiffConstSMul.restrictScalars`) carry the same real
`C^n` structure, and likewise for a model transported along a continuous linear equivalence.
*Needs:* §4.1; Layer 1 §§1.1–1.4; Tau Ceti `ContMDiffConstSMul.restrictScalars`.

### Examples

The quotient of `ℂ` by integer translations is built on `AddAction.orbitRel.Quotient ℤ ℂ` from
Mathlib's quotient atlas and covering theorem and the Tau Ceti local-diffeomorphism theorem; it is a
complex manifold, the orbit projection is a local biholomorphism
(`TauCeti.ComplexIntTranslation.isLocalDiffeomorph_quotientMk`), and a `1`-periodic map descends to a
holomorphic map exactly when it is holomorphic (`Function.Periodic.liftIntTranslationQuotient`,
`Function.Periodic.contMDiff_liftIntTranslationQuotient_iff`). Complex tori `ℂⁿ/Λ` for a lattice `Λ`
are compact by §4.4. The Hopf surface `(ℂ² ∖ {0})/⟨z ↦ 2z⟩` is a compact quotient by a free, properly
discontinuous holomorphic action of `ℤ`.

### Dependencies

Mathlib quotient atlas, properly discontinuous actions, quotient covering maps and pullback bundles;
the Tau Ceti quotient-manifold and descent API named above; Layer 1; Layer 7 §§7.1–7.3 for §4.3 only.

## Layer 5: compatible open gluing

Let `D : TopCat.GlueData` and give every piece `D.U i` and every overlap `D.V (i, j)` a charted-space
structure for one model and structure groupoid. The topology of the glued space is Mathlib's: its
carrier `D.toGlueData.glued`, the canonical maps `D.toGlueData.ι i`, which are open embeddings
(`TopCat.GlueData.ι_isOpenEmbedding`) covering it (`TopCat.GlueData.ι_jointly_surjective`), the
identification criterion `TopCat.GlueData.ι_eq_iff_rel` and its universal property as a colimit. Lee,
Chapter 1, and Kobayashi–Nomizu's pseudogroup formulation supply the manifold arguments.

### 5.1 Overlap compatibility

The compatibility condition is Tau Ceti's `TopCat.GlueData.IsCompatible I n`: both maps from
`D.V (i, j)` to its adjacent pieces, `D.f i j` and `D.f j i ∘ D.t i j`, are `C^n` local diffeomorphisms.
The overlap atlas is thus compatible with both piece atlases, and the second map records the transition
equation. Equivalently, every inclusion `D.f i j` and every transition `D.t i j` is a `C^n` local
diffeomorphism (`TopCat.GlueData.isCompatible_iff`, `TopCat.GlueData.IsCompatible.of_isLocalDiffeomorph_t`).
Prove the symmetry, restriction and cocycle lemmas for compatible data from the `GlueData` axioms,
without copying the gluing relation into a new record: compatibility is inherited by restriction to a
subfamily of pieces (`TopCat.GlueData.IsCompatible.reindex`), and on triple overlaps the composite
transitions are local diffeomorphisms.
*Needs:* Mathlib `TopCat.GlueData`, `IsLocalDiffeomorph`; Tau Ceti `TopCat.GlueData.IsCompatible`,
`TopCat.GlueData.isCompatible_iff`.

**Checks.**

- Take `D.U 0 = D.U 1 = ℂ` and `D.V (0, 1) = D.V (1, 0) = ℂ ∖ {0}` with the conjugate atlas `w = z̄`,
  `D.t` the identity and `D.f` the inclusions. Then `D.t` is holomorphic between the two overlap
  atlases, but `D.f 0 1`, which reads `w ↦ w̄` in charts, is not, so the data are not compatible: a
  criterion asking only for holomorphy of `D.t` would accept them.
- Gluing two copies of `ℂ` along `ℂ ∖ {0}` by `z ↦ 1/z̄` is compatible for `𝓘(ℝ, ℂ)` but not for
  `𝓘(ℂ, ℂ)`, since `z ↦ 1/z̄` is a real diffeomorphism of `ℂ ∖ {0}` that is not holomorphic.

### 5.2 The glued atlas

The atlas on `D.toGlueData.glued` is Tau Ceti's `TopCat.GlueData.chartedSpace`, which is
`TauCeti.chartedSpaceOfIsOpenEmbedding` applied to the canonical maps; its local smooth transitions come
from `TopCat.GlueData.ι_eq_iff_rel` and the two compatible overlap maps. For compatible data with `C^n`
pieces the glued space is a `C^n` manifold (`TopCat.GlueData.IsCompatible.isManifold`), every canonical
map is a `C^n` local diffeomorphism (`TopCat.GlueData.IsCompatible.isLocalDiffeomorph_ι`) and a `C^n`
diffeomorphism onto its open image (`TopCat.GlueData.IsCompatible.partialDiffeomorphι`), and a map out of
the glued space is `C^m`, `m ≤ n`, exactly when its restriction to every piece is
(`TopCat.GlueData.IsCompatible.contMDiff_iff`). Over `𝓘(ℂ, E)` this glues complex manifolds along
holomorphic transitions. Empty pieces impose no extra hypothesis.
*Needs:* §5.1; Tau Ceti `TopCat.GlueData.chartedSpace`, `TopCat.GlueData.IsCompatible.isManifold`,
`TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding`.

### 5.3 Uniqueness and functoriality

The glued structure is unique: any `C^n` structure on the glued space for which every canonical map is a
local diffeomorphism has the same maximal atlas (`TopCat.GlueData.IsCompatible.maximalAtlas_chartedSpace_eq`),
so the identity is a diffeomorphism between the two. A subfamily of pieces covering the glued space gives
the same manifold (`TopCat.GlueData.IsCompatible.reindexDiffeomorph`). Maps out of a gluing are the
compatible families of maps on the pieces (`TopCat.GlueData.IsCompatible.descContMDiffMap`,
`TopCat.GlueData.IsCompatible.contMDiffMapEquiv`), and maps of gluing data induce maps of glued
manifolds, functorially (`TopCat.GlueData.IsCompatible.mapContMDiffMap`,
`TopCat.GlueData.IsCompatible.mapContMDiffMap_id`, `TopCat.GlueData.IsCompatible.mapContMDiffMap_comp`).
Prove compatibility with products, the glued manifold of the product gluing data being the product of the
glued manifolds, and with atlas transport along homeomorphisms of the pieces (Layer 1 §1.3).
*Needs:* §5.2; Layer 1 §1.3; Tau Ceti `TopCat.GlueData.IsCompatible.maximalAtlas_chartedSpace_eq`,
`TopCat.GlueData.IsCompatible.mapContMDiffMap`.

### 5.4 Two-chart and finite-star gluings

The general theorem is tested on two-chart and finite-star gluings, which are instances of it, not
separate constructions. Two copies of a manifold `X` glued along an open `U` by the identity form Tau
Ceti's `TauCeti.doubleGlueData X U`, compatible for every model (`TauCeti.isCompatible_doubleGlueData`);
the open subsets of a manifold form compatible gluing data whose glued manifold is the union
(`TopCat.GlueData.isCompatible_ofOpenSubsets`, `TopCat.GlueData.openCoverGlueDiffeomorph`). Construct the
finite-star gluing, a central piece `U₀` and pieces `U₁, …, Uₖ` each glued to `U₀` alone along open
subsets with holomorphic transitions, as `TopCat.GlueData`, prove it compatible, and prove that every
input overlap atlas is compatible with both adjacent piece atlases and every canonical inclusion is an
open local biholomorphism.
*Needs:* §§5.1–5.3; Tau Ceti `TauCeti.doubleGlueData`, `TopCat.GlueData.isCompatible_ofOpenSubsets`.

**Checks.**

- Two copies of `ℂ` glued along `ℂ ∖ {0}` by `z ↦ z⁻¹` give a compact complex manifold biholomorphic
  to `OnePoint ℂ` by the map that is the identity on the first piece and `w ↦ w⁻¹` on the second (with
  `0 ↦ ∞`); glued by the identity instead, they give the doubled origin of §6.6.

### 5.5 Gluing, realification and recharting

The glued charted space does not depend on the model, and compatibility for `𝓘(ℂ, E)` implies
compatibility for the realified model (`TopCat.GlueData.IsCompatible.restrictScalars`) and is invariant
under recharting (`TopCat.GlueData.isCompatible_transContinuousLinearEquiv_iff`), so compatible open
gluing commutes with realification and recharting up to the identity diffeomorphism.
*Needs:* §5.2; Layer 1 §§1.1, 1.3; Tau Ceti `TopCat.GlueData.IsCompatible.restrictScalars`.

### Examples

The Riemann sphere from two copies of `ℂ` (Check in §5.4); the doubled origin (§6.6); a manifold
recovered from an open cover (`TopCat.GlueData.openCoverGlueDiffeomorph`).

### Dependencies

Mathlib `TopCat.GlueData` and manifolds; the Tau Ceti gluing API named above; Layer 1.

## Layer 6: finite-gluing topology and proper maps

The statements are in Mathlib's topology vocabulary. Bourbaki, Chapter I, supplies the
quotient-separation and proper-map criteria.

### 6.1 Second countability

For a countable, in particular finite, index type, the glued space of second-countable pieces is second
countable (Tau Ceti's instance `TopCat.GlueData.secondCountableTopology`).
*Needs:* Mathlib `TopCat.GlueData`, `SecondCountableTopology`.

**Checks.**

- Gluing uncountably many one-point spaces along empty overlaps gives an uncountable discrete space,
  which is not second countable: countability of the index cannot be dropped.

### 6.2 The Hausdorff criterion

Let `X = Σ i, D.U i`, and let `R ⊆ X × X` be the equivalence relation generated by every overlap
identification, including composites through other pieces. For `TopCat.GlueData` it is Mathlib's
`TopCat.GlueData.Rel`, already an equivalence relation (`TopCat.GlueData.rel_equiv`), whose slice over
`(i, j)` is Tau Ceti's `TopCat.GlueData.chartRel i j ⊆ D.U i × D.U j`, the pairs with the same image in
the glued space (`TopCat.GlueData.mem_chartRel_iff`). The map `X → D.toGlueData.glued` is an open quotient
map (`TopCat.GlueData.isOpenQuotientMap_sigma_ι`). State and prove that the glued space is Hausdorff when
the pieces are Hausdorff and `R` is closed in `X × X`
(`TauCetiRoadmap.ComplexManifolds.glued_t2Space_of_isClosed_rel`); Hausdorffness of the pieces is not used
by the argument, and conversely the glued space is Hausdorff only if every slice is closed
(`TopCat.GlueData.t2Space_iff_isClosed_chartRel`). Checkable hypotheses for closedness of the generated
relation are Tau Ceti's: for Hausdorff pieces, `chartRel i j` is closed exactly when points outside the
two overlaps have neighbourhoods meeting no identified pair (`TopCat.GlueData.isClosed_chartRel_iff`,
`TopCat.GlueData.t2Space_iff_forall_nhds`), and closed overlaps in Hausdorff pieces suffice
(`TopCat.GlueData.t2Space_of_isClosed_range`). Closedness of the graph of `D.t i j` inside
`D.V (i, j) × D.V (j, i)` is not a substitute.
*Needs:* Mathlib `TopCat.GlueData.Rel`, `TopCat.GlueData.ι_eq_iff_rel`; Tau Ceti
`TopCat.GlueData.isOpenQuotientMap_sigma_ι`, `TopCat.GlueData.t2Space_iff_isClosed_chartRel`.

**Checks.**

- For the doubled origin of §6.6 the graph of `D.t 0 1`, the diagonal of `ℂ ∖ {0}`, is closed in
  `(ℂ ∖ {0}) × (ℂ ∖ {0})`, while `chartRel 0 1 = {(z, z) : z ≠ 0}` is not closed in `ℂ × ℂ`, its
  closure containing `(0, 0)`: a criterion testing the overlap graphs inside the overlaps would accept a
  non-Hausdorff space.

### 6.3 Connectedness

The glued space of nonempty connected pieces, over a nonempty index type, is connected exactly when the
graph on the indices with an edge for every nonempty overlap is connected (Tau Ceti's
`TopCat.GlueData.connectedSpace_iff_reflTransGen`; the preconnected form is
`TopCat.GlueData.preconnectedSpace_iff_reflTransGen`).
*Needs:* Mathlib `TopCat.GlueData`, `ConnectedSpace`.

**Checks.**

- Two copies of `ℂ` with empty overlap glue to `ℂ ⊔ ℂ`, which is disconnected, and the overlap graph has
  no edge; the doubled origin, with overlap `ℂ ∖ {0}`, is connected.

### 6.4 Properness is local on the target

For a continuous map `f : X → Y` and an open cover of `Y`, `f` is proper exactly when each of its
restrictions over the members of the cover is proper (Tau Ceti's
`TopologicalSpace.IsOpenCover.isProperMap_iff_restrictPreimage`, with no separation hypothesis, so in
particular for a Hausdorff target; pointwise form `Continuous.isProperMap_of_locally`). A proper map to a
compact space has compact domain (`IsProperMap.compactSpace`). The route through finite closed
refinements over compact subsets of a Hausdorff target is one proof; Tau Ceti's uses closed maps with
compact fibres.
*Needs:* Mathlib `IsProperMap`, `isProperMap_iff_isClosedMap_and_compact_fibers`; Tau Ceti
`TopologicalSpace.IsOpenCover.isProperMap_iff_restrictPreimage`, `IsProperMap.compactSpace`.

**Checks.**

- The inclusion `ℂ ∖ {0} → ℂ` is not proper (the preimage of the closed unit disc is not compact), yet
  its restriction over `ℂ ∖ {0}` is a homeomorphism: the open sets must cover the target, and dropping a
  neighbourhood of `0` hides the failure.

### 6.5 Invariance and agreement with Mathlib's typeclasses

Prove that the four results above, second countability, the Hausdorff criterion, connectedness and the
locality of properness for maps out of glued spaces, are preserved by isomorphisms of gluing data (a
family of homeomorphisms of the pieces and of the overlaps commuting with `f` and `t`), and that their
conclusions are Mathlib's typeclasses `SecondCountableTopology`, `T2Space`, `ConnectedSpace` and the
predicate `IsProperMap` on the glued carrier.
*Needs:* §§6.1–6.4; Mathlib `TopCat.GlueData`.

### 6.6 The doubled origin

As a regression test, glue two copies of `ℂ` along `ℂ ∖ {0}` by the identity, the gluing data
`TauCeti.doubleGlueData ℂ U` with `U = ℂ ∖ {0}`. Compute the generated relation (two points are identified
exactly when they are equal and either lie on the same copy or lie in `U`,
`TauCeti.doubleGlueData_ι_eq_iff`), prove that it is not closed at the two origins
(`TauCeti.not_isClosed_doubleGlueData_chartRel`), and show that the resulting doubled origin fails the
Hausdorff criterion (`TauCeti.t2Space_doubleGlueData_iff`: the double is Hausdorff exactly when `X` is and
`U` is closed), the two origins having no disjoint neighbourhoods
(`TauCeti.not_disjoint_nhds_doubleGlueData_ι`). It is nevertheless a complex manifold by Layer 5
(`TauCeti.isCompatible_doubleGlueData`).
*Needs:* §6.2; Layer 5 §5.4; Tau Ceti `TauCeti.doubleGlueData` and its lemmas.

### Examples

The doubled origin (§6.6); the Riemann sphere as a Hausdorff gluing, since `chartRel 0 1` for the
inversion gluing is the closed set `{(z, w) : zw = 1}` of `ℂ × ℂ`; `ℂ ⊔ ℂ` as a disconnected gluing.

### Dependencies

Mathlib `TopCat.GlueData`, proper maps and the separation and countability typeclasses; Layer 5 for the
canonical maps; the Tau Ceti glue-data topology named above.

## Layer 7: holomorphic vector and line bundles

Fix a complex normed space `F`, the model fibre, once and for all, and a complex manifold `B` modelled on
`𝓘(ℂ, EB)`. A holomorphic vector bundle is a complex `VectorBundle ℂ F V` with
`ContMDiffVectorBundle ∞ F V 𝓘(ℂ, EB)` (Conventions); the total-space manifold and the holomorphy of the
projection are Mathlib's. Huybrechts, Chapters 1–2, supplies analytic vector bundles and the canonical
bundle; Steenrod supplies transition functions and changes of trivialization.

### 7.1 Holomorphic trivializations

The admissible trivializations are those of the designated atlas and, equivalently, those of the maximal
compatible atlas `(contMDiffFiberwiseLinear B F 𝓘(ℂ, EB) ∞).maximalAtlas`. A linear trivialization lies
in it exactly when its coordinate changes with every trivialization of the atlas are holomorphic
(`Bundle.Trivialization.mem_maximalAtlas_contMDiffFiberwiseLinear_iff`); atlas trivializations lie in it
(`Bundle.Trivialization.mem_maximalAtlas_of_memTrivializationAtlas`); two members have holomorphic
coordinate changes (`Bundle.Trivialization.contMDiffOn_coordChangeL_of_mem_maximalAtlas`); changes of
frame within it are exactly holomorphic gauges (`Bundle.Trivialization.transFiberwiseLinear_mem_maximalAtlas_iff`);
and holomorphy of a section is tested in any member
(`Bundle.Trivialization.contMDiffAt_section_iff_of_mem_maximalAtlas`). An arbitrary continuous or
real-smooth complex-linear trivialization is not admissible (Check). `FiniteDimensional ℂ F` is explicit
in every finite-rank statement.
*Needs:* Mathlib `ContMDiffVectorBundle`, `contMDiffFiberwiseLinear`, `MemTrivializationAtlas`; Tau Ceti
`Bundle.Trivialization.mem_maximalAtlas_contMDiffFiberwiseLinear_iff` and the lemmas above.

**Checks.**

- On the trivial line over `ℂ`, the trivialization `(z, v) ↦ (z, v · exp(Re z))` is real-smooth and
  fibrewise complex-linear, but it sends the holomorphic constant section `1` to the coordinate function
  `exp(Re z)`, which is not holomorphic, so it is not admissible
  (`TauCeti.expReTrivialization_notMem_maximalAtlas`): an atlas of all real-smooth complex-linear
  trivializations would make holomorphy of sections chart-dependent.

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
  of alternating `2`-forms on the same bundle (`ContMDiffVectorBundle.continuousAlternatingMap`) is glued
  from `(ab)⁻¹`: it is the dual of the determinant, and confusing the two would identify the canonical
  bundle of §7.5 with the determinant of the tangent bundle.

### 7.3 Holomorphic line bundles

The rank-one case uses the same API, with no separate line-bundle carrier. A holomorphic line bundle
(`finrank ℂ F = 1`) is trivial, through an admissible trivialization over all of `B`, exactly when it has
a nowhere-vanishing holomorphic section, and over an open `U` likewise
(`ContMDiffVectorBundle.exists_trivialization_baseSet_eq_univ_iff_exists_ne_zero`,
`ContMDiffVectorBundle.exists_trivialization_baseSet_eq_iff_exists_isLocalFrameOn`). Cocycle isomorphisms
are the holomorphic bundle equivalences: for holomorphic cores, a cocycle morphism glues to a
biholomorphism of total spaces exactly when its chart operators are holomorphic and its fibre maps are
bijective, and every holomorphic bundle equivalence arises from a unique such morphism
(`VectorBundleCore.CoordinateHom.exists_diffeomorph_iff`, `VectorBundleCore.CoordinateHom.toDiffeomorph`,
`VectorBundleCore.CoordinateHom.exists_toDiffeomorph_eq`).
*Needs:* §§7.1–7.2; Tau Ceti `ContMDiffVectorBundle.exists_trivialization_baseSet_eq_univ_iff_exists_ne_zero`,
`VectorBundleCore.CoordinateHom.exists_diffeomorph_iff`.

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
isomorphic holomorphic line bundles.
*Needs:* §§7.1–7.3; Layer 2 (for the orientation convention of §7.5); Tau Ceti `TauCeti.SmoothEmbedding`,
`TauCeti.SmoothEmbedding.normalSpaceContMDiffVectorBundle`; Mathlib `Manifold.IsSmoothEmbedding`.

**Checks.**

- The real hypersurface `Z = ℂ × ℝ ⊂ ℂ²` has tangent spaces `ℂ × ℝ`, which are not complex subspaces
  (`i · (0, 1) = (0, i) ∉ ℂ × ℝ`), so `TM / TZ` is a real line bundle, not a complex one: the theorem needs
  a complex submanifold, and a merely real-smooth hypersurface does not satisfy it.

### 7.5 The holomorphic cotangent and canonical bundles

The holomorphic cotangent bundle is Tau Ceti's `TauCeti.CotangentBundle 𝓘(ℂ, E) M`, the bundle of
complex-linear functionals on the tangent spaces, with Mathlib's Hom-bundle structure. Construct its
determinant, of rank one, on the top-exterior-power carrier of §7.2, and the canonical line bundle
`K_M` from it, with the dual and top-exterior-power conventions stated in the declarations; identify
`K_M` with Mathlib's holomorphic bundle of complex alternating maps of degree `n = finrank ℂ E` on the
tangent spaces (`ContMDiffVectorBundle.continuousAlternatingMap`).
*Needs:* §7.2; Tau Ceti `TauCeti.CotangentBundle`; Mathlib `ContMDiffVectorBundle.continuousAlternatingMap`.

**Checks.**

- On `OnePoint ℂ` with `w = 1/z` on the overlap, `dw = −z⁻² dz` while `∂/∂w = −z² ∂/∂z`: the cotangent
  and tangent transitions are inverse to each other. A dual convention that transposed without inverting
  would give the cotangent bundle the tangent bundle's cocycle.

### 7.6 Line bundles from characters of a deck group

Let a finite group `G` act freely by biholomorphisms on a complex manifold `M`, and for a character
`χ : G → ℂˣ` let `L_χ` be the associated holomorphic line bundle on `M/G`, the quotient of `M × ℂ` by
`g · (x, v) = (g x, χ(g) v)`, glued through §7.2 and §4.3; its holomorphic sections are the holomorphic
`f : M → ℂ` with `f(g x) = χ(g) f(x)`. Prove that the order of `χ` bounds the tensor order of `L_χ`, since
`L_χ^{⊗ k}` is `L_{χᵏ}`. Prove that the order is exact when the character-to-Picard homomorphism
`χ ↦ [L_χ]` is injective. Prove the standard sufficient theorem: if `M` is compact and connected, every
invertible holomorphic function on `M` is constant, so triviality of `L_χ`, a nowhere-vanishing section,
forces `χ` to be trivial, and the homomorphism is injective. These are statements about bundle
isomorphisms, not numerical fields of a divisor record.
*Needs:* §§7.2–7.3; Layer 4 §§4.1–4.3; Mathlib's maximum principle on compact connected complex
manifolds (`MDifferentiable.apply_eq_of_compactSpace`).

**Checks.**

- `G = ℤ/2` acting on `ℂ ∖ {0}` by `z ↦ −z` with `χ(1) = −1`: `f(z) = z` is a nowhere-vanishing
  holomorphic section of `L_χ`, so `L_χ` is trivial although `χ` is not; compactness of `M` cannot be
  dropped.
- `G = ℤ/2` acting on a complex torus `ℂ/Λ` by translation by a point of order two, with `χ(1) = −1`:
  `L_χ ⊗ L_χ` is trivial, and `L_χ` is not, since a nowhere-vanishing section would be a constant `f`
  with `f = −f`; the tensor order is exactly `2`.

### Examples

A cocycle for a trivial line bundle and a cocycle for a nontrivial finite-order character pass through the
same holomorphic-line-bundle constructor of §7.2. The tangent bundle of `OnePoint ℂ` is glued from the
cocycle `−z⁻²`, and its holomorphic vector field `∂/∂z` reads `−w² ∂/∂w` near `∞`, vanishing there.

### Dependencies

Mathlib vector bundles, cores, prebundles and their holomorphic operations; SmoothBundlesConnections
§B2.1; the Tau Ceti trivialization, line-bundle, normal-bundle and cotangent API named above; Layers 2
and 4 where stated.

## Downstream consumers

[ConformalMapping](../../Completed/ConformalMapping/README.md) owns the one-variable analytic theorems,
Riemann mapping (Layer 3) and reflection (Layer 4), on Mathlib's `OnePoint ℂ`.
[ComplexTori](../ComplexTori/README.md) and [AnalyticToricGeometry](../../Completed/AnalyticToricGeometry/README.md)
consume the quotient, bundle and open-gluing interfaces here (Layers 4, 5 and 7, with §7.6), and own their
geometric constructions without adding competing general quotient theorems.
[ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) consumes Layers 1–4 and 7, and
[FuchsianOrbifolds](../FuchsianOrbifolds/README.md) Layers 1, 2 and 4–6.

## Scope and ownership

This roadmap owns boundaryless atlas mechanics (realification, model and atlas transport), the canonical
orientation of complex manifolds as a construction in the shared orientation carrier, the Riemann-sphere
atlas and its Möbius API, the local-diffeomorphism and descent theory extending Mathlib's free properly
discontinuous quotients, compatible open gluing of `TopCat.GlueData` with its point-set criteria, and
holomorphic vector bundles with their gluing, operations, normal and canonical bundles and the deck
character theorem. It extends Mathlib's `ChartedSpace`, `ModelWithCorners`, `StructureGroupoid`,
`HasGroupoid`, `Structomorph`, `IsManifold`, `Diffeomorph`, `IsLocalDiffeomorph`, `TopCat.GlueData`,
`FiberBundle`, `VectorBundle`, `ContMDiffVectorBundle` and orbit quotients, and introduces no replacement
manifold, gluing, quotient, orientation or bundle carrier. Suggested homes are
`TauCeti/Geometry/Manifold/Complex/`, `TauCeti/Geometry/Manifold/Quotient/` and
`TauCeti/Geometry/Manifold/VectorBundle/Holomorphic/`. The Mathlib work cited in the references determines
the shape of the API here, never whether a target proceeds, and overlapping implementations from that
work or from sibling roadmaps are integrated in coordination with their authors.

**Already in the libraries at the pins.** Tau Ceti proves most of Layers 1–6 and the foundations of
Layer 7: the realification API of §§1.1–1.2, §1.5, the pullback atlases of §1.3 and the recharting and
product halves of §1.4; the canonical orientation with its open-subset, product and biholomorphism
statements of §§2.1–2.4; the whole of Layer 3; §§4.1–4.2 (save the right-inverse atlas comparison), the
section descent of §4.3 and §4.4; §§5.1–5.2, uniqueness, maps and subfamilies of §5.3, the two-chart
gluings of §5.4 and §5.5; §§6.1–6.4 and §6.6; the trivialization characterization of §7.1, the
trivial-line criterion and cocycle isomorphisms of §7.3, and the holomorphic normal bundle of an embedding
in §7.4. Mathlib supplies the holomorphic cores, direct sums, Hom and dual bundles, alternating-map
bundles and pullbacks of §7.2. The layers name each declaration. The targets that remain are: model
transport laws (§1.3) and open restriction (§1.4); recharting and factor interchange for the orientation
(§2.3); the right-inverse atlas comparison (§4.1), bundle-map descent and its compatibility with bundle
operations (§4.3), and §4.5; the overlap lemmas of §5.1, products and atlas transport (§5.3) and the
finite-star gluing (§5.4); the Hausdorff criterion in generated-relation form (§6.2) and §6.5; the
holomorphic tensor, exterior-power and determinant refinements of §7.2, the codimension-one statements and
the cocycle comparison of §7.4, §7.5 beyond the cotangent bundle, and §7.6.

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
  [AnalyticToricGeometry](../../Completed/AnalyticToricGeometry/README.md), consumers of Layers 4, 5 and 7.

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
  action by homeomorphisms of a Hausdorff, locally compact charted space.
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
  `ConnectedSpace`; the maximum principle `MDifferentiable.apply_eq_of_compactSpace` for §7.6.

### From Tau Ceti

All the declarations below are proved at the Tau Ceti pin; paths are under `TauCeti/`.

- **Realification** (`Geometry/Manifold/ModelWithCorners/RestrictScalars/`,
  `Geometry/Manifold/{IsManifold,ContMDiff,Diffeomorph,LocalDiffeomorph,MFDeriv}/RestrictScalars.lean`,
  `Geometry/Manifold/VectorBundle/Tangent/RestrictScalars.lean`): `ModelWithCorners.restrictScalars`,
  `modelWithCornersSelf_restrictScalars`, `ModelWithCorners.restrictScalars_prod`,
  `ModelWithCorners.restrictScalars_transContinuousLinearEquiv`, `ModelWithCorners.extChartAt_restrictScalars`,
  `ModelWithCorners.contDiffGroupoid_le_restrictScalars`, `IsManifold.restrictScalars`,
  `IsManifold.maximalAtlas_subset_restrictScalars`, `ContMDiffAt.restrictScalars`,
  `ContMDiffOn.restrictScalars`, `ContMDiff.restrictScalars`, `Diffeomorph.restrictScalars` with
  `Diffeomorph.restrictScalars_symm` and `Diffeomorph.restrictScalars_trans`,
  `IsLocalDiffeomorph.restrictScalars`, `PartialDiffeomorph.restrictScalars`,
  `MDifferentiable.restrictScalars`, `MDifferentiableAt.mfderiv_restrictScalars`,
  `TangentBundle.restrictScalarsHomeomorph`, `TangentBundle.restrictScalarsHomeomorph_tangentMap`,
  `TangentBundle.trivializationAt_restrictScalarsHomeomorph`, `TauCeti.tangentCoordChange_restrictScalars`,
  `ContMDiffConstSMul.restrictScalars`; the standard coordinates `TauCeti.complexEuclideanRealLinearIsometryEquiv`
  (`Analysis/InnerProductSpace/Euclidean/Complex.lean`), `TauCeti.complexEuclideanRealModel` and
  `TauCeti.complexEuclideanRealModel_def` (`Geometry/Manifold/Complex/Euclidean.lean`). The realified
  model has the same chart carrier and chart maps.
- **Pullback atlases** (`Geometry/Manifold/PullbackGroupoid.lean`): `Homeomorph.pullbackChartedSpace`,
  `Homeomorph.pullbackChartedSpace_chartAt`, `Homeomorph.pullbackChartedSpace_atlas`,
  `Homeomorph.transOpenPartialHomeomorph_mem_pullbackChartedSpace_atlas`,
  `Homeomorph.pullbackChartedSpace_refl`, `Homeomorph.pullbackChartedSpace_trans`,
  `Homeomorph.pullbackChartedSpace_symm_pullbackChartedSpace`, `Homeomorph.pullback_hasGroupoid` (no
  `ClosedUnderRestriction` hypothesis), `Homeomorph.pullbackStructomorph`, `Homeomorph.pullback_isManifold`,
  `Homeomorph.pullbackDiffeomorph`, `Homeomorph.coe_pullbackDiffeomorph`. These follow the design of
  mathlib4#42847, from which they take their names.
- **Orientation** (`LinearAlgebra/Complex/Orientation.lean`, `Geometry/Manifold/Complex/Orientation.lean`):
  `Module.Basis.complexToReal`, `Module.Basis.det_complexToReal`, `Module.Basis.orientation_complexToReal_eq`,
  `TauCeti.complexRealIndexEquiv`, `TauCeti.complexOrientation`, `LinearEquiv.map_complexOrientation`,
  `TauCeti.reindex_complexOrientation_complex`, `TauCeti.prod_complexOrientation`,
  `TauCeti.map_prodComm_prod_complexOrientation`, `TauCeti.orientationPreservingOn_iff_det_fderiv_ne_zero`,
  `TauCeti.contDiffGroupoid_complex_le_orientationPreservingGroupoid`,
  `TauCeti.isOrientedAtlas_maximalAtlas_complex`, `TauCeti.complexManifoldOrientation` (for
  `[IsManifold 𝓘(ℂ, E) 1 M]`, indexed by `Fin (2 * finrank ℂ E)`), `TauCeti.eq_complexManifoldOrientation_iff`,
  `TauCeti.map_orientationAt_complexManifoldOrientation`, `TauCeti.complexOrientationLift`,
  `TauCeti.complexManifoldOrientation_opens_eq_pullback`,
  `TauCeti.isOrientationPreservingAt_subtype_val_complexManifoldOrientation`,
  `TauCeti.eq_prod_complexManifoldOrientation_iff`,
  `Diffeomorph.isOrientationPreservingAt_complexManifoldOrientation`,
  `IsLocalDiffeomorphAt.isOrientationPreservingAt_complexManifoldOrientation` and
  `IsLocalDiffeomorph.complexManifoldOrientation_eq_pullback` (each for `n ≠ 0`).
- **The Riemann sphere** (`Geometry/Manifold/Instances/OnePoint/`, `Geometry/Manifold/Algebra/SMul.lean`):
  `OnePoint.affineChart`, `OnePoint.invChart`, `OnePoint.instChartedSpace`, `OnePoint.instIsManifold` (at
  `ω`, for a proper nontrivially normed field), `OnePoint.affineChart_source`, `OnePoint.invChart_source`,
  `OnePoint.affineChart_coe`, `OnePoint.invChart_coe`, `OnePoint.invChart_infty`,
  `OnePoint.invChart_symm_of_ne_zero`, `OnePoint.inv_invChart`, `OnePoint.mem_atlas_iff`,
  `OnePoint.chartAt_coe`, `OnePoint.chartAt_infty`, `OnePoint.mdifferentiableAt_iff_of_ne_infty`,
  `OnePoint.mdifferentiableAt_iff_of_eq_infty`, `OnePoint.affineChart_equivProjectivization_symm_mk`,
  `OnePoint.invChart_equivProjectivization_symm_mk`, `OnePoint.invChart_symm_eq_smul`,
  `OnePoint.instContMDiffConstSMul`, `Diffeomorph.constSmul`.
- **Quotients and descent** (`Geometry/Manifold/Instances/Quotient.lean`, `Geometry/Manifold/Quotient/`,
  `Algebra/GroupAction/OrbitRelQuotient.lean`, `Topology/Algebra/GroupAction/Quotient.lean`,
  `Geometry/Manifold/VectorBundle/Pullback.lean`, `Geometry/Manifold/Complex/IntTranslationQuotient.lean`):
  `TauCeti.instIsManifoldQuotient`, `TauCeti.isLocalDiffeomorph_quotientMk`,
  `TauCeti.instIsManifoldAddQuotient`, `TauCeti.isLocalDiffeomorph_addQuotientMk`,
  `TauCeti.exists_trans_eq_of_mem_atlas_quotient`, `IsLocalHomeomorph.chartedSpaceOfRightInverse`,
  `IsLocalHomeomorph.isManifold_chartedSpaceOfRightInverse`,
  `IsLocalHomeomorph.isLocalDiffeomorph_chartedSpaceOfRightInverse`, `TauCeti.MulAction.orbitRelQuotientLift`,
  `TauCeti.MulAction.eq_orbitRelQuotientLift_iff`, `TauCeti.MulAction.comp_orbitRelQuotientLift`,
  `TauCeti.MulAction.orbitRelQuotientLift_prodMk`, `TauCeti.continuous_orbitRelQuotientLift_iff`,
  `MulActionHom.orbitRelQuotientMap`,
  `TauCeti.MulAction.orbitRelQuotientRec`, `TauCeti.contMDiffAt_orbitRelQuotientLift_iff`,
  `TauCeti.contMDiff_orbitRelQuotientLift_iff`, `TauCeti.contMDiff_orbitRelQuotientMap`,
  `TauCeti.contMDiff_section_orbitRelQuotientRec_iff`,
  `TauCeti.contMDiff_pullback_section_iff_orbitRelQuotientRec`, `IsLocalDiffeomorph.contMDiff_section_iff_pullback`,
  `TauCeti.MulAction.compactSpace_orbitRelQuotient_of_isCompact`,
  `TauCeti.MulAction.compactSpace_orbitRelQuotient_iff_exists_isCompact`,
  `TauCeti.AddAction.compactSpace_orbitRelQuotient_of_isCompact`,
  `TauCeti.ComplexIntTranslation.isLocalDiffeomorph_quotientMk`, `Function.Periodic.liftIntTranslationQuotient`,
  `Function.Periodic.contMDiff_liftIntTranslationQuotient_iff`. All descent statements assume
  `ContMDiffConstSMul I n G M` and `m ≤ n`.
- **Gluing** (`Geometry/Manifold/Gluing/`): `TauCeti.chartedSpaceOfIsOpenEmbedding`,
  `TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding`, `TauCeti.partialDiffeomorphOfIsOpenEmbedding`,
  `TopCat.GlueData.chartedSpace`,
  `TopCat.GlueData.IsCompatible`, `TopCat.GlueData.isCompatible_iff`,
  `TopCat.GlueData.IsCompatible.of_isLocalDiffeomorph_t`, `TopCat.GlueData.IsCompatible.isManifold`,
  `TopCat.GlueData.IsCompatible.isLocalDiffeomorph_ι`, `TopCat.GlueData.IsCompatible.partialDiffeomorphι`,
  `TopCat.GlueData.IsCompatible.contMDiff_iff`, `TopCat.GlueData.IsCompatible.maximalAtlas_chartedSpace_eq`,
  `TopCat.GlueData.IsCompatible.descContMDiffMap`, `TopCat.GlueData.IsCompatible.contMDiffMapEquiv`,
  `TopCat.GlueData.IsCompatible.mapContMDiffMap`, `TopCat.GlueData.IsCompatible.mapContMDiffMap_id`,
  `TopCat.GlueData.IsCompatible.mapContMDiffMap_comp`, `TopCat.GlueData.IsCompatible.reindex`,
  `TopCat.GlueData.IsCompatible.reindexDiffeomorph`, `TopCat.GlueData.IsCompatible.restrictScalars`,
  `TopCat.GlueData.isCompatible_transContinuousLinearEquiv_iff`, `TopCat.GlueData.isCompatible_ofOpenSubsets`,
  `TopCat.GlueData.openCoverGlueDiffeomorph`, `TauCeti.isCompatible_doubleGlueData`.
- **Glued-space topology and proper maps** (`Topology/Category/TopCat/GlueData.lean` and
  `Topology/Category/TopCat/GlueData/`, `Topology/Maps/Proper/`): `TopCat.GlueData.chartRel`,
  `TopCat.GlueData.mem_chartRel_iff`, `TopCat.GlueData.isOpenQuotientMap_sigma_ι`,
  `TopCat.GlueData.t2Space_iff_isClosed_chartRel`, `TopCat.GlueData.isClosed_chartRel_iff`,
  `TopCat.GlueData.t2Space_iff_forall_nhds`, `TopCat.GlueData.t2Space_of_isClosed_range`,
  `TopCat.GlueData.secondCountableTopology` (countable index),
  `TopCat.GlueData.preconnectedSpace_iff_reflTransGen`, `TopCat.GlueData.connectedSpace_iff_reflTransGen`,
  `TauCeti.doubleGlueData`, `TauCeti.doubleGlueData_ι_eq_iff`, `TauCeti.not_isClosed_doubleGlueData_chartRel`,
  `TauCeti.t2Space_doubleGlueData_iff`, `TauCeti.not_disjoint_nhds_doubleGlueData_ι`,
  `TopologicalSpace.IsOpenCover.isProperMap_iff_restrictPreimage`, `Continuous.isProperMap_of_locally`,
  `IsProperMap.compactSpace`.
- **Bundles** (`Geometry/Manifold/VectorBundle/`, `Topology/VectorBundle/Descent.lean`,
  `Geometry/Manifold/SmoothEmbedding/NormalSpace/`): `Bundle.Trivialization.mem_maximalAtlas_contMDiffFiberwiseLinear_iff`,
  `Bundle.Trivialization.mem_maximalAtlas_of_memTrivializationAtlas`,
  `Bundle.Trivialization.contMDiffOn_coordChangeL_of_mem_maximalAtlas`,
  `Bundle.Trivialization.transFiberwiseLinear_mem_maximalAtlas_iff`,
  `Bundle.Trivialization.contMDiffAt_section_iff_of_mem_maximalAtlas`, `TauCeti.expReTrivialization`,
  `TauCeti.expReTrivialization_notMem_maximalAtlas`,
  `ContMDiffVectorBundle.exists_trivialization_baseSet_eq_univ_iff_exists_ne_zero` and
  `ContMDiffVectorBundle.exists_trivialization_baseSet_eq_iff_exists_isLocalFrameOn` (for
  `finrank ℂ F = 1`), `VectorBundleCore.CoordinateHom`, `VectorBundleCore.CoordinateHom.exists_diffeomorph_iff`,
  `VectorBundleCore.CoordinateHom.toDiffeomorph`, `VectorBundleCore.CoordinateHom.exists_toDiffeomorph_eq`
  (finite-dimensional source fibre), `TauCeti.SmoothEmbedding`, `TauCeti.SmoothEmbedding.NormalSpace`,
  `TauCeti.SmoothEmbedding.tangentRange`, `TauCeti.SmoothEmbedding.normalSpaceContMDiffVectorBundle` (over a
  complete field, for finite-dimensional models, `m + 1 ≤ n`), `TauCeti.CotangentBundle`.

### From TauCetiRoadmap.DifferentialGeometry

Layer 2, §§2.1–2.2: the orientation carrier `TauCeti.Manifold.Orientation` (the quotient of
`TauCeti.Manifold.OrientationLift`, a model orientation with source-indexed chart signs), oriented atlases
`TauCeti.IsOrientedAtlas`, the predicate `TauCeti.Manifold.Orientation.IsOrientationPreservingAt`, product
orientations `TauCeti.Manifold.Orientation.prod` (first factor first) and pullback along local
diffeomorphisms `TauCeti.Manifold.Orientation.pullback`. Assumed: one carrier for all orientations, with
the canonical complex orientation of Layer 2 here living in it.

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
  `MulAction.isManifold_quotient_of_contMDiffConstSMul`; §4.1 compares its atlas with the installed one.
- [mathlib4#42847](https://github.com/leanprover-community/mathlib4/pull/42847): transport of charted
  spaces and structure groupoids along homeomorphisms (module `Mathlib.Geometry.Manifold.PullbackGroupoid`,
  with `Homeomorph.pullbackChartedSpace`, `_chartAt`, `_atlas`,
  `transOpenPartialHomeomorph_mem_pullbackChartedSpace_atlas`, `pullback_symm_trans`,
  `pullback_hasGroupoid` and `pullbackStructomorph`), the design followed by §1.3.
