# Roadmap: Lie algebroids, Lie groupoids and Poisson geometry

**Summary.** Build the differential geometry of Lie algebroids and their integrations, of
Poisson manifolds and of symplectic groupoids, from the existing manifold, vector-bundle, Lie,
category and differential-form libraries. The roadmap constructs Lie groupoids with possibly
non-Hausdorff arrow manifolds, their algebroids, actions, representations, orbits, isotropy,
restriction and Morita theory; Poisson bivectors, cotangent algebroids and symplectic leaves;
`A`-paths, `A`-homotopies, the Weinstein groupoid and the monodromy groups; symplectic and
cotangent groupoids. Its end theorems are the Crainic–Fernandes integrability criterion
(§G5.5), Lie II with uniqueness (§G5.4), the nonintegrable central extension on `S² × S²`
(§G5.6), the symplectic integration theorem for Poisson manifolds (§G6.4) and the comparison of
groupoid reduction with ordinary Marsden–Weinstein reduction (§G7.4). Every construction comes
with its basic API, functoriality, local formulas and examples.

## Scope and ownership

The layers are numbered G0–G7 and the targets §Gk.n; other roadmaps cite them by these labels.
The sub-items §G1.3a/§G1.3b, §G4.2a and §G4.6A/§G4.6B are targets of their own inside §G1.3,
§G4.2 and §G4.6.

This roadmap owns: the topological groupoid layer (total-arrow and composable-pair topology,
§G0.0); the comparison of Mathlib's normal-form submersion predicate with the split-derivative
predicate, the finite-dimensional constant-rank theorem without a Hausdorff hypothesis, the
generic finite-rank smooth-subbundle API and the naturality of the vector-field bracket under
related maps (§G0.1); Lie groupoids on possibly non-Hausdorff arrow manifolds, their examples,
bisections and isotropy Lie groups (§G0.2–§G0.4); Lie algebroids, their morphisms, pullbacks,
Chevalley–Eilenberg complexes, isotropy algebras and complex Lie algebroids (G1); the Lie
functor from groupoids to algebroids, the Atiyah algebroid bracket, the variable-rank orbit
theorem and algebroid representations (G2); groupoid actions, isotropy quotients, the
fundamental Lie groupoid, restriction and bibundles (G3); multivectors, the Schouten bracket,
Poisson structures, cotangent algebroids, symplectic leaves and linear Poisson structures on
algebroid duals (G4); `A`-paths, the path Banach manifold, the `A`-homotopy foliation,
monodromy and the integrability criterion (G5); symplectic and cotangent groupoids and the
symplectic integration theorem (G6); symplectic groupoid actions and their reduction data (G7).

What this roadmap leaves to named roadmaps:

- [DifferentialGeometry](../DifferentialGeometry/README.md) owns alternating bundles and
  differential forms (0.1–0.4), the exterior derivative, Lie derivative and Cartan identities,
  flows, distributions and the constant-rank Frobenius theorem with its leaves (Layer 4),
  smooth chains (8.3), regular points and values (10.1), the mapping degree (10.3–10.4),
  integration and de Rham cohomology, and Riemannian metrics (12.1). Its 0.4 owns the generic
  two-form carrier and the migration equivalence `legacySmoothTwoFormEquiv` from the pinned
  `SmoothTwoForm`, with its evaluation law and `legacySmoothTwoFormEquiv_isClosed_iff`. This
  roadmap owns multivector bundles, the Schouten bracket and the algebroid differential, which
  are distinct constructions with an explicit tangent-algebroid comparison. Kept variant: the
  orbit theorem of §G2.4 is for anchor distributions of variable rank, whereas DifferentialGeometry
  Layer 4 is the constant-rank Frobenius theorem; §G2.4 consumes Layer 4 on each regular locus.
- [SmoothBundlesConnections](../SmoothBundlesConnections/README.md) owns, in B1.0, the regular
  fibre of a smooth map (no Hausdorff hypothesis, possibly empty, the headline
  `exists_regularFiber_smoothEmbedding`), the transverse fibre product of two smooth maps and
  the kernel distribution of a submersion with its `ContMDiffVectorBundle` structure and smooth
  pullback; in B1.1 the division map and invariant-map descent of principal bundles; in B1.4
  the free proper quotient atlas and homogeneous spaces; in B2 complexification, exterior
  powers and Hom bundles; in B3 principal connections and the Atiyah sequence; in B5.2 the
  flat-bundle/parallel-transport dictionary and the countability of the fundamental group of a
  connected second-countable manifold. This roadmap owns the Atiyah **algebroid bracket**, its
  integration by the gauge groupoid, algebroid representations, the constant-rank theorem, the
  bracket naturality for related fields and the smooth-subbundle API, as SmoothBundlesConnections
  assigns them. Nothing of B1.0 or B5.2 is constructed here; every regular fibre, fibre product,
  kernel bundle and countability statement below is consumed from them.
- [HamiltonianSystems](../HamiltonianSystems/README.md) owns Layer 1's Hamiltonian vector
  fields, the symplectic Poisson bracket and its laws, Layer 2's Hamiltonian flows and Layer 3's
  infinitesimal actions, moment maps and cocycle, on Tau Ceti's pinned `SmoothTwoForm` carrier.
  This roadmap extends the bracket to degenerate Poisson structures and proves the symplectic
  identification through §G4.2a; it does not restate the shared Hamiltonian API.
- [CotangentLagrangian](../SymplecticGeometry/CotangentLagrangian/README.md) C1 owns smooth
  cotangent bundles, the tautological one-form and the canonical form `ω = −dθ`. This roadmap
  owns the **groupoid** structures on `T*G` and `T*Γ`.
- [HamiltonianReduction](../SymplecticGeometry/HamiltonianReduction/README.md) is a consumer of
  this roadmap (its R1 consumes §G4.2a and §G4.3, its R2 §G4.6A, its R3 the fibre-product
  interfaces, its R4 §G7.2–§G7.4) and is therefore never a supplier here. It owns group moment
  maps and the exact sequence of symplectic vector fields through `H¹_dR` (R1), the
  Kirillov–Kostant–Souriau form on coadjoint orbits and its pointwise sharp identity (R2), the
  generic descent of closed basic two-forms along surjective submersions, the ordinary reduced
  space, the orbit model `W_O` and its diffeomorphism with `G ×_{G_ξ} μ⁻¹(ξ)` (R3), and the final
  comparison of groupoid reduction with ordinary reduction (R4). Accordingly §G4.3 states only the
  Poisson side of the Hamiltonian homomorphism, §G4.6B identifies leaves with coadjoint orbits
  without the KKS form (the comparison of the leaf form of §G4.5 with KKS follows from R2's
  pointwise identity and is R2's), §G7.2 constructs the reduced form `ω_red` on its isotropy
  quotient directly from the kernel, closedness and basicness of the restricted form and the local
  sections of the quotient submersion, without R3's generic descent interface, and leaves to R4
  only the comparison of `ω_red` with R3's ordinary reduced form, and §G7.4 identifies the
  groupoid-side data without transporting anything across R3's `W_O`.
- [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) is a consumer of this roadmap (its
  K8 consumes §G1.3a) and is therefore never a supplier here. It owns complex tangent bundles,
  the `(1,0)`/`(0,1)` eigenbundles of an almost-complex structure, the Nijenhuis tensor and the
  Newlander–Nirenberg theorem (K1). §G1.6 states the subalgebroid/involutivity equivalence for
  an arbitrary constant-rank complex subbundle of `TM ⊗ ℂ`; its specialisation to the `±i`
  eigenbundles and the comparison with Newlander–Nirenberg are ComplexKahlerGeometry's, which may
  consume the general statement.
- [LieGroups](../RepresentationTheory/LieGroups/README.md) Layers 0–5 own the exponential map,
  the adjoint representations, the closed-subgroup theorem, Lie's third theorem and the
  simply-connected integration equivalence (Layer 4), and simply-connected covers (Layer 5).
  [AlgebraicTopology](../AlgebraicTopology/README.md) Stage 1 owns the fundamental groupoid and
  path-homotopy infrastructure; [Completed/UniversalCovers](../../Completed/UniversalCovers/README.md)
  owns covering classification; [Completed/HopfRinow](../../Completed/HopfRinow/README.md) Layer 1
  owns the exponential map of a Riemannian metric.
- [PseudodifferentialOperators](../PseudodifferentialOperators/README.md) P1.0 (smooth section
  modules) owns the `C∞(M,ℝ)`-module structure on smooth sections of a finite-rank bundle, its
  restriction and constant-scalar comparisons, `IsScalarTower` and `SMulCommClass`, and the
  complex-scalar structure `(u + iv)·s = u·s + v·(Js)` on sections of a complex bundle over a real
  base.

Kept variants, each differing from the library notion in one clause: the constant-rank theorem of
§G0.1 is for an arbitrary locally constant rank on a possibly non-Hausdorff manifold, whereas
SmoothBundlesConnections B1.0 is the regular (full-rank) case; the Banach split-regular-level
theorem of §G5.2 is for a derivative kernel of infinite dimension, whereas Tau Ceti's
`levelSetChartedSpace` and `isManifold_levelSet` are for Fredholm derivatives of finite index;
the Chevalley–Eilenberg complex of §G1.3 is for a Lie algebroid over a manifold and, in the
standalone Lie-algebra case, for all degrees, whereas Mathlib's `LieModule.Cohomology` carries the
cochains and differentials `d₁₂`, `d₂₃` in degrees one and two only; the isotropy group of §G0.4 is
the endpoint subtype with multiplication `gh = h ≫ g`, whereas Mathlib's `Groupoid.vertexGroup`
multiplies in the opposite order.


## Conventions

Real bases are finite-dimensional smooth boundaryless Hausdorff second-countable manifolds.
Algebroid fibres have finite rank. Lie groups are finite-dimensional real, Hausdorff and
second-countable, with smooth multiplication and inverse, as in SmoothBundlesConnections and
HamiltonianSystems. Smooth means `ContMDiff … ∞`. Lie groupoids are smooth. Arrow manifolds are
allowed to be non-Hausdorff: they carry finite-dimensional boundaryless smooth atlases, are locally
Hausdorff and are globally second-countable. The Hausdorff arrow case is a specialisation, not an
extra hypothesis on the integration theorem. Statements using partitions of unity apply on the
Hausdorff base or on explicitly Hausdorff manifolds; no `T2Space` instance is installed on an
arbitrary integration. Source fibres carry their induced smooth structures and are required to be
Hausdorff, as in the Crainic–Fernandes integration theorem (Crainic–Fernandes 2003, Theorem 2.1,
p. 589); this does not require a Hausdorff total arrow space. Source-simply-connected means that
each source fibre is connected and simply connected in its own topology.

An arrow `g : x ⟶ y` has `s(g) = x`, `t(g) = y`. Write `gh` for "first `h`, then `g`"; it is
defined when `s(g) = t(h)`. Thus `gh` is Mathlib's `h ≫ g`, and in `SingleObj G` it is the group
product `g * h` (`SingleObj.comp_as_mul`). The algebraic structure is `CategoryTheory.Groupoid`;
the total arrow type carries the topology and the smooth atlas, which are additional data, not a
second set of groupoid axioms. Smooth functors and natural transformations are the categorical
operations with total-arrow maps on `CategoryTheory.Arrow M`.

For a Lie groupoid, the algebroid is `A_x = ker(ds)_{1_x}` with anchor `dt`, and the bracket is
transported from source-vertical right-invariant vector fields. For a group over a point this is
the opposite of the Lie algebra defined by left-invariant fields; the isomorphism to Mathlib's
`GroupLieAlgebra` sends `v` to `−v` (`rightInvariant_bracket`, §G2.2). For a left group action the
action algebroid in standard Lie-algebra coordinates therefore has anchor `ξ ↦ −ξ_M`, where `ξ_M`
is the fundamental field; this makes the anchor a homomorphism for Mathlib's vector-field bracket.
These comparisons are proved; the bracket of `GroupLieAlgebra` is never changed.

For a left action `ξ_M(x) = d(g ↦ g·x)_1 ξ`, as in HamiltonianSystems Layer 3 and
HamiltonianReduction R1. For a principal right action `V_ξ(p) = d(h ↦ p·h)_1 ξ(p)` for an
equivariant adjoint-section function on `P`, as in SmoothBundlesConnections B3. These are
different actions; the minus Atiyah inclusion `j([p,ξ]) = [−V_ξ(p)]` uses the latter.

The Poisson sign is that of HamiltonianSystems: `ι_{X_f}ω = df`, `{f,g} = df(X_g)`, so
`X_{ {f,g} } = −[X_f,X_g]`. A bivector has `{f,g} = π(df,dg)`. Its sharp map is defined by
`β(π♯α) = π(α,β)`; hence `π♯df = −X_f` in the symplectic case and `π♯ = −(ω♭)⁻¹`, where
`ω♭v = ω(v,·)`. The cotangent bracket is `[α,β]_π = L_{π♯α}β − L_{π♯β}α − d(π(α,β))`, so that
`[df,dg]_π = d{f,g}`. Linear Lie–Poisson has `{ℓ_ξ,ℓ_η}(ν) = ν([ξ,η])`; the dual of an algebroid
carries the minus convention `{ℓ_a,ℓ_b} = −ℓ_{[a,b]}` of §G4.6A. Each of these signs has a
computed witness in the Checks of the layer that introduces it.

Composable pairs: the map `(s,t) : Γ → M × M` is not required to be transverse to the diagonal.
It is `(g,h) ↦ (s(g),t(h))` on `Γ × Γ` that is transverse to the diagonal, by the submersion
axioms; the unit groupoid on a positive-dimensional manifold separates the two statements.

## Exact supplier contracts

**From Mathlib.** `IsManifold`, `ContMDiffSection`, `ContMDiffVectorBundle`, `mfderiv`,
`mvfderiv`, `VectorField.mlieBracket`, `VectorField.mpullback_mlieBracket`, `Manifold.IsSubmersion`
and `Manifold.IsSubmersionAt` (the chart normal form `(u,v) ↦ u`), `Manifold.IsSmoothEmbedding`
(an immersion that is a topological embedding), `IsDiffImmersionAt`,
`ContinuousLinearMap.HasRightInverse` with `HasRightInverse.comp` and
`HasRightInverse.of_surjective_of_finiteDimensional`, `LieRinehartRing` and `LieRinehartAlgebra`
(the Leibniz and anchor-action laws on section spaces), `LieModule.Cohomology.oneCochain`,
`twoCochain`, `d₁₂` and `d₂₃` (with `d₂₃` landing in all trilinear maps), `TrivialLieModule` and
`TrivialLieModule.equiv`, `CategoryTheory.Groupoid`, `Groupoid.vertexGroup` (multiplication
`x * y = x ≫ y`), `Groupoid.isoEquivHom`, `Subgroupoid.full`, `Subgroupoid.vertexSubgroup`,
`SingleObj` with `SingleObj.comp_as_mul`, `Discrete`, `Codiscrete`, `CategoryTheory.ActionCategory`,
`CategoryTheory.Arrow`, `FundamentalGroupoid`, `MulAction.orbitRel`, `MulAction.orbitRel.Quotient`,
`IsEmbedding.subtypeVal`, `Derivation`, `GroupLieAlgebra` (the bracket is the value at `1` of the
bracket of left-invariant fields) and `LieGroup`.

**From Tau Ceti.** `TauCeti.SmoothTwoForm` (the pinned two-form carrier), `IsContMDiffDistribution`
(a `C^∞` local frame of `k` fields near every point), maximal integral curves and their smooth
flows, `mulRightInvariantVectorField v g = mfderiv I I (· * g) 1 v`, `mvfderiv_mlieBracket`
(complete model space, `minSmoothness 𝕜 2 ≤ n`), `isLocalDiffeomorphAt_of_mfderiv_eq`,
`extChartPartialDiffeomorph`, `leftInvariantDerivationLieEquivGroupLieAlgebra` (with its
interior-point hypothesis), the adjoint action and the covering and fundamental-groupoid code.
`levelSetChartedSpace` and `isManifold_levelSet` are for Fredholm derivatives and are not used for
§G5.2.

**From TauCetiRoadmap.DifferentialGeometry.** 0.1 (the wedge of alternating maps), 0.2 (the smooth
alternating-map bundle `Alt^k(E)` of a smooth bundle `E`), 0.4 (`SmoothForm I M ℝ 2`,
`legacySmoothTwoFormEquiv`, its tuple-evaluation law and `legacySmoothTwoFormEquiv_isClosed_iff`;
a generic form is evaluated by coercing to `RoughForm I M ℝ 2` and applying it to `![v,w]`),
Layer 4 (`IsContMDiffDistribution`, integral manifolds, the constant-rank Frobenius theorem and
its leaves), 8.3 (smooth chains), 10.1 (`IsRegularPoint`, `IsRegularValue`), 10.3–10.4 (the
degree formula `∫_M f*ω = deg(f) ∫_N ω`), 12.1 (`nonempty_contMDiffRiemannianMetric`).

**From TauCetiRoadmap.SmoothBundlesConnections.** B1.0: the regular fibre
`{x : X // f x = c}` of a smooth map between finite-dimensional boundaryless manifolds with a
surjective derivative along the fibre, with its subspace topology, smooth atlas modelled on
`Fin (dim X − dim N) → ℝ`, smooth-embedding inclusion and tangent image `ker(df)` (the headline
`exists_regularFiber_smoothEmbedding`), its open-restriction, independence and universal
properties; the transverse fibre product `{(x,y) // f x = g y}` with its atlas, projections,
tangent space `ker(df − dg)`, universal property and the submersion law for either projection;
the kernel distribution `x ↦ ker(df_x)` of a submersion as an `IsContMDiffDistribution` of rank
`dim X − dim N`, its `ContMDiffVectorBundle` structure and smooth pullback. All three are stated
without a Hausdorff hypothesis on the ambient manifold and are applied here to non-Hausdorff
arrow manifolds. B1.1: the division map `P ×_M P → G` and smooth descent of invariant maps. B1.2:
the conversion `x·h = h⁻¹·x` between left and right actions. B1.4: the free proper quotient atlas
on a Hausdorff second-countable manifold with a Hausdorff second-countable structure group, its
submersion property and homogeneous spaces. B2: complexification of real bundles, exterior powers
and Hom bundles with their associated-bundle agreement. B3.2: the Atiyah sequence
`0 → P ×_G 𝔤 → TP/G → TM → 0`, the injection `j([p,ξ]) = [−V_ξ(p)]`, the correspondence between
principal connections and splittings `s`, and the identity `[s(X),s(Y)] − s([X,Y]) = j(F(X,Y))`.
B5.2: the flat-bundle/parallel-transport dictionary, the right deck action
`[a]·[γ] = [γ.trans a]` on the universal cover, and the countability of `π₁(M,m₀)` for a connected
second-countable manifold.

**From TauCetiRoadmap.HamiltonianSystems.** Layer 1: `IsHamiltonianVectorField ω F X`
(`ι_{X_F}ω = dF`), `poissonBracket ω F G = dF(X_G)`, and `X_{ {F,G} } = −[X_F,X_G]`. Layer 2:
Hamiltonian flows and symplectomorphisms. Layer 3: `InfinitesimalAction` with
`(⁅Z,Z'⁆)_M = −[Z_M,Z'_M]`, `IsMomentMap ω a μ` with the sign `ι_{Z_M}ω = d⟨μ,Z⟩` for every `Z`
(so `X_{⟨μ,Z⟩} = Z_M`, and the moment map of the cotangent lift of left translation is
`μ(g,ν) = Coad_g ν` in §G7.3), and the cocycle.

**From TauCetiRoadmap.CotangentLagrangian.** C1: the smooth cotangent bundle of a Hausdorff
manifold, its local bundle charts, the tautological one-form `θ` and the canonical symplectic
form `ω = −dθ` with its nondegeneracy.

**From TauCetiRoadmap.LieGroups.** Layer 0 (exponential map), Layer 1 (`Ad`, `ad`), Layer 2
(closed-subgroup theorem), Layer 4 (Frobenius, Lie's third theorem, the equivalence between
simply-connected Lie groups and Lie algebras), Layer 5 (simply-connected covers).

**From TauCetiRoadmap.AlgebraicTopology.** Stage 1: the fundamental groupoid and path-homotopy
infrastructure. **From Completed/UniversalCovers:** classification of coverings. **From
Completed/HopfRinow.** Layer 1: the exponential map of a Riemannian metric and its local
diffeomorphism property.

**From TauCetiRoadmap.PseudodifferentialOperators.** P1.0, smooth section modules: the
`C∞(M,ℝ)`-module on `ContMDiffSection`, `(f • s)(x) = f(x) • s(x)`, restriction to opens, constant
scalar comparison, `IsScalarTower ℝ C∞(M,ℝ) Γ∞(V)`, `SMulCommClass ℝ C∞(M,ℝ) Γ∞(V)`, and the
complex scalar structure `(u + iv)·s = u·s + v·(Js)` on a complex bundle over a real base.

## How to read the build

Layer 0 fixes the topological and smooth foundations: the topological groupoid layer, the
submersion comparisons and constant-rank theorem that SmoothBundlesConnections B1.0 does not cover,
the subbundle API and bracket naturality, and Lie groupoids with their examples, bisections and
isotropy groups. Layer 1 defines Lie algebroids and their calculus, Layer 2 differentiates
groupoids to algebroids and proves the orbit theorem, Layer 3 treats actions, quotients,
restriction and Morita theory. Layer 4 builds Poisson geometry up to symplectic leaves and
linear structures. Layer 5 constructs `A`-paths, the path Banach manifold and its `A`-homotopy
foliation, monodromy and the integrability criterion. Layer 6 adds symplectic and cotangent
groupoids and proves the symplectic integration theorem. Layer 7 compares symplectic groupoid
actions with Hamiltonian actions and supplies the groupoid side of the reduction comparison. The
sections run in build order; every `*Needs:*` line names what the statement and the sketched route
use, and an implementer taking another route is not blocked behind an unrelated layer.

## Layer 0: Topological groupoids and smooth foundations (G0)

### G0.0 Topological groupoids

Define a topological groupoid as a `CategoryTheory.Groupoid` whose object type and total arrow
type carry topologies for which source, target, unit, inverse and multiplication are continuous,
the composable pairs `{(g,h) // s(g) = t(h)}` carrying the subspace topology of the product of
the total arrow type with itself. Build restriction to a subset of objects, products, continuous
functors and the unit, pair, group-over-a-point and action examples. Prove that the smooth atlas
of §G0.2 lives on this same `TopologicalSpace` instance, so that every Lie groupoid is a
topological groupoid by forgetting. No manifold structure is used in this target, which
OperatorAlgebraDynamics D5 consumes.

- Source and target are open maps when the groupoid admits continuous local sections of `s`
  through every arrow; for a Lie groupoid this holds by the submersion axiom.
- The composable-pair topology is the subspace topology of `Arrow × Arrow`, and multiplication is
  continuous for it; the iterated composable triples are the fibre product of two copies over the
  middle arrow.
- Restriction to a subset of objects, products of groupoids and continuous functors are
  functorial, and the forgetful functor from Lie groupoids to topological groupoids preserves
  them.

**Checks.**

- The unit groupoid on `M` has arrow space `M`, composable pairs the diagonal of `M × M`, and
  every structure map the identity or the diagonal; a definition putting the discrete topology on
  arrows would make the unit map `M → Arrow` discontinuous for `M = ℝ`.
- The pair groupoid on `M` has arrows `M × M` and composable pairs `{((z,y),(y',x)) // y = y'}`,
  homeomorphic to `M × M × M`; multiplication `(z,y)(y,x) = (z,x)` is the outer projection.
- For a group `G` over a point the composable pairs are all of `G × G` and multiplication is the
  group law `(g,h) ↦ g * h` in the convention `gh = h ≫ g`; with `SingleObj.comp_as_mul`
  (`f ≫ g = g * f`) a definition using `g ≫ h` would produce `h * g`, which differs on `S₃`.
- The action groupoid of `ℤ/2` acting on `ℝ` by negation has arrows `ℤ/2 × ℝ`, source `(ε,x) ↦ x`
  and target `(ε,x) ↦ εx`; its composable pairs are `{((ε,y),(δ,x)) // y = δx} ≅ ℤ/2 × ℤ/2 × ℝ`
  and multiplication is `(ε,δx)(δ,x) = (εδ,x)`, so the arrow `(−1,0)` composed with itself is the
  unit at `0`.

*Needs:* Mathlib `CategoryTheory.Groupoid`, `CategoryTheory.Arrow`, `Discrete`, `Codiscrete`,
`SingleObj`, `SingleObj.comp_as_mul`, `CategoryTheory.ActionCategory`.

### G0.1 Submersion comparisons, the constant-rank theorem, subbundles and bracket naturality

Regular fibres, transverse fibre products and the kernel distribution and kernel bundle of a
submersion are consumed from SmoothBundlesConnections B1.0 and are not constructed here. This
target supplies the four pieces SmoothBundlesConnections leaves to this roadmap.

Define `IsDiffSubmersionAt I J f x` as the statement that `mfderiv I J f x` has a continuous
linear right inverse (`ContinuousLinearMap.HasRightInverse`); this is Mathlib's
`IsDiffImmersionAt` with left inverse replaced by right inverse and is meaningful for arbitrary
models with corners. Prove the finite-dimensional boundaryless comparison with Mathlib's
normal-form predicate `Manifold.IsSubmersionAt`: the normal form `(u,v) ↦ u` gives a right inverse
of the derivative, and conversely a split derivative of a smooth map yields the normal form through
`isLocalDiffeomorphAt_of_mfderiv_eq` applied to `(f, pr_ker)` in charts. The global form is
`submersion_iff_split_mfderiv`: a smooth map between boundaryless finite-dimensional manifolds
satisfies `Manifold.IsSubmersion` exactly when `IsDiffSubmersionAt` holds at every point. The
smoothness hypothesis is used only in the backward direction. For finite-dimensional models
`HasRightInverse.of_surjective_of_finiteDimensional` identifies the predicate with surjectivity of
the derivative and with DifferentialGeometry 10.1's `IsRegularPoint`.

- Restriction to opens and transport along diffeomorphisms of source or target preserve
  `IsDiffSubmersionAt`; composition of split-surjective derivatives is split-surjective
  (`HasRightInverse.comp`).
- Either projection of a SmoothBundlesConnections B1.0 fibre product `X ×_N Y` is a submersion
  when the other map is one (restated here only as the bridge between B1.0's statement and the
  predicate `IsDiffSubmersionAt`).
- These comparisons use complete finite-dimensional real model spaces; no converse is asserted
  for arbitrary Banach manifolds.

**Checks.**

- For the coordinate projection `ℝⁿ → ℝᵐ` with `m ≤ n` the derivative is the projection, the
  inclusion of `ℝᵐ` into the first coordinates is a right inverse, and the normal form is the
  identity chart; both sides of `submersion_iff_split_mfderiv` hold.
- For `x ↦ x³` on `ℝ` the derivative at `0` is zero, so neither side holds at `0`, while both hold
  at every `x ≠ 0`; a definition demanding only a nonzero derivative somewhere would wrongly
  accept the global statement.
- For the Hopf map `S³ → S²` both sides hold everywhere; the right inverse at a point is the
  horizontal lift of the round metric.
- A right inverse is not a left inverse: for `ℝ² → ℝ`, `(x,y) ↦ x`, the derivative has a right
  inverse but no left inverse, so a definition using `HasLeftInverse` (that is, `IsDiffImmersionAt`)
  would reject every submersion with positive-dimensional fibres.

Prove the finite-dimensional boundaryless constant-rank theorem without a Hausdorff hypothesis: if
`rank(mfderiv f) = r` on an open neighbourhood of `x`, there are smooth local coordinates near `x`
and `f(x)` in which `f` is `(u,v) ↦ (u,0)`. Use the inverse function theorem on an invertible
`r × r` minor of the derivative and show that the remaining partial derivatives vanish by rank
constancy. Prove the immersed local image, the tangent kernel, restriction and coordinate-change
APIs and the local universal property of maps into a level fibre. For the whole level fibre
`f⁻¹(c)` to be an embedded manifold of dimension `dim X − r` with its inherited topology, assume
rank `r` on an open set containing the whole fibre and apply the local charts at every point; the
regular case `r = dim N` is SmoothBundlesConnections B1.0 and is not reproved. This theorem supplies
the isotropy groups of §G0.4.

- The local image of `f` near `x` is an embedded `r`-dimensional submanifold of the target, and
  `ker(df)` is the tangent space of the level fibre.
- Level fibres of a constant-rank map on an open set containing them are embedded submanifolds of
  dimension `dim X − r`, with the smooth universal property for maps into them.
- The theorem is local and uses no Hausdorffness or second countability of `X`.

**Checks.**

- `(x,y) ↦ (x,0)` on `ℝ²` has rank `1` everywhere; the level fibres are the vertical lines, of
  dimension `2 − 1 = 1`.
- `x ↦ x²` on `ℝ` has rank `1` away from `0` and `0` at `0`, so the rank is not locally constant at
  `0`; the level fibre over `0` is a point, of dimension `1 − 1 = 0`, not `1 − 0 = 1`, so the
  hypothesis cannot be dropped.
- The constant map has rank `0` and every level fibre is `X` itself, of dimension `dim X − 0`.
- The target map of the pair groupoid restricted to a source fibre is a diffeomorphism, of rank
  `dim M`, and its level fibres are points: the isotropy of the pair groupoid is trivial.

Develop the generic finite-rank smooth-subbundle API: for a family of subspaces of the fibres of a
smooth vector bundle locally spanned by smooth frames with smooth coefficient maps, construct the
induced fibre and total-space topology, the smooth inclusion, local trivialisations, pullback and
restriction. Form an internal sum of two subbundles only on a locus where its fibre rank is locally
constant, or as the image subbundle of the addition map where that map has constant rank. Prove the
kernel and image constructions for constant-rank smooth bundle maps, and compare tangent
subbundles with `IsContMDiffDistribution`. Real subalgebroids (§G1.2) use these subbundles before
bracket and anchor conditions are imposed; complex subbundles are built in §G1.6. The kernel bundle
of a submersion from SmoothBundlesConnections B1.0 is an instance of this API.

- A smooth subbundle of rank `k` in a bundle of rank `n` has smooth local frames of length `k`
  extending to local frames of the ambient bundle.
- Kernels and images of constant-rank bundle maps are smooth subbundles of the stated ranks.
- Pullback and restriction of subbundles commute with inclusion.

**Checks.**

- In `Tℝ²` the span of `∂_x` is a rank-one subbundle; its pullback along the inclusion of the
  `x`-axis is the tangent bundle of the axis.
- The spans of `∂_x` and `∂_x + y ∂_y` have internal sum of rank `1` on the axis `y = 0` and `2`
  elsewhere, so the sum is not a subbundle on `ℝ²`; a definition allowing arbitrary internal sums is
  wrong, while on `{y ≠ 0}` the sum is `Tℝ²`.
- The bundle map `(x,v) ↦ (x, x v)` of the trivial line bundle over `ℝ` has rank `0` at `0` and
  `1` elsewhere; its kernel is a subbundle on `{x ≠ 0}` (rank `0`) and the constant-rank hypothesis
  excludes `x = 0`.

Prove naturality of `VectorField.mlieBracket` for related fields: if `df(X) = X' ∘ f` and
`df(Y) = Y' ∘ f` for smooth vector fields on finite-dimensional boundaryless manifolds, then
`df([X,Y]) = [X',Y'] ∘ f`. In coordinates apply Tau Ceti's `mvfderiv_mlieBracket` to a target-chart
composition and rewrite the relatedness identities; the symmetric second-derivative cancellation
uses no Hausdorffness. Deduce open restriction, closure of submersion-vertical fields under the
bracket and the immersion-restriction corollary, where the restricted field is constructed and
proved smooth by the immersion normal form. This supplies §G1.2, §G2.1 and §G4.2;
`VectorField.mpullback_mlieBracket` alone covers only diffeomorphisms.

**Checks.**

- For `f = pr₁ : ℝ² → ℝ`, `X = x ∂_x + ∂_y` and `Y = ∂_x` are related to `x ∂_x` and `∂_x`;
  both `df([X,Y])` and `[x ∂_x, ∂_x] ∘ f` equal `−∂_x`.
- `Y = y ∂_x` is related to no field along `pr₁`, since `df(Y) = y` varies along the fibre; the
  relatedness hypothesis is not removable.
- Vertical fields `a(x,y) ∂_y` and `b(x,y) ∂_y` for `pr₁` have vertical bracket
  `(a b_y − b a_y) ∂_y`.

*Needs:* Mathlib `Manifold.IsSubmersionAt`, `Manifold.IsSubmersion`, `IsDiffImmersionAt`,
`ContinuousLinearMap.HasRightInverse`, `HasRightInverse.comp`,
`HasRightInverse.of_surjective_of_finiteDimensional`, `VectorField.mlieBracket`,
`VectorField.mpullback_mlieBracket`, `ContMDiffVectorBundle`; Tau Ceti
`isLocalDiffeomorphAt_of_mfderiv_eq`, `mvfderiv_mlieBracket`, `IsContMDiffDistribution`;
DifferentialGeometry 10.1, Layer 4; SmoothBundlesConnections B1.0.

### G0.2 Lie groupoids

Define a Lie groupoid as a `CategoryTheory.Groupoid` on a manifold of objects whose total arrow
type carries a finite-dimensional boundaryless, locally Hausdorff, second-countable smooth atlas
such that source and target are smooth submersions, units and inversion are smooth, multiplication
is smooth on the SmoothBundlesConnections B1.0 fibre product of source and target, and every
source fibre, with its B1.0 regular-fibre structure, is Hausdorff. Prove the iterated
composable-arrow manifolds, smoothness of all face and degeneracy maps, inverse cancellation, the
source and target laws, translations on source and target fibres, that units are smooth embeddings
and inversion a diffeomorphism, and the tangent identities at units including split surjectivity of
`ds` and `dt`.

- `s` and `t` are submersions, hence open, and `dim Γ ≥ dim M` with equality exactly when `s` is a
  local diffeomorphism (the étale case).
- Left translation `h ↦ gh` by `g` is a diffeomorphism `t⁻¹(s(g)) → t⁻¹(t(g))` of target fibres,
  and right translation `h ↦ hg` by `g` a diffeomorphism `s⁻¹(t(g)) → s⁻¹(s(g))` of source fibres,
  since `gh` is defined exactly when `t(h) = s(g)` and `hg` exactly when `s(h) = t(g)`.
- The composable pairs `Γ ×_{s,t} Γ` form a manifold of dimension `2 dim Γ − dim M`, and
  multiplication is a submersion onto `Γ`.

**Checks.**

- The unit groupoid of `M` is a Lie groupoid with `dim Γ = dim M`, and its composable pairs are
  the diagonal, of dimension `dim M = 2 dim M − dim M`.
- The pair groupoid of `M` has `dim Γ = 2 dim M`, source fibres diffeomorphic to `M`, and
  composable triples `M × M × M` of dimension `3 dim M = 2·2 dim M − dim M`.
- In the pair groupoid with `g = (y,x)`, left translation sends `(x,w) ∈ t⁻¹(x)` to
  `(y,w) ∈ t⁻¹(y)` and right translation sends `(w,y) ∈ s⁻¹(y)` to `(w,x) ∈ s⁻¹(x)`; a statement
  putting left translation on source fibres would need `gh` defined for `s(h) = s(g)`, which the
  arrows `(y,x)` and `(z,x)` with `z ≠ y` refute.
- The relation on `ℝ` identifying all points of the open interval `(0,1)` has arrow set
  `Δ ∪ (0,1)²`, which is a topological groupoid in the subspace topology but is not a manifold at
  `(0,0)`; it is not a Lie groupoid, so the atlas is data that must be exhibited.
- The fundamental groupoid of the horizontal-plane foliation of `ℝ³ ∖ {0}` is a Lie groupoid whose
  arrow manifold is not Hausdorff (a loop around the origin in the punctured plane `z = 0` is
  not leafwise null-homotopic, while its translates to the planes `z = ε` are, so that arrow and
  the unit cannot be separated) while every source fibre, the universal cover of a leaf, is a
  Hausdorff plane (Crainic–Fernandes,
  *Lectures on integrability of Lie brackets*, Example 1.18 and Exercise 8, p. 14); a definition
  requiring Hausdorff arrows excludes it.

*Needs:* §G0.0, §G0.1 (`submersion_iff_split_mfderiv`); SmoothBundlesConnections B1.0 (regular
fibres, fibre products, kernel distributions); Mathlib `Manifold.IsSubmersion`,
`Manifold.IsSmoothEmbedding`.

### G0.3 Unit, pair, group, action and gauge groupoids

Build the unit groupoid (arrows `M`, `s = t = id`), the pair groupoid (arrows `(y,x)` with source
`x`, target `y`), a Lie group over a point, the action groupoid of a smooth left action (arrows
`(g,x)` with source `x`, target `g·x` and multiplication `(g,h·x)(h,x) = (gh,x)`) and the gauge
groupoid `(P × P)/G` of a principal right `G`-bundle, with arrows `[p,q] : π(q) → π(p)`. Reuse
`Discrete M`, `SingleObj G`, `Codiscrete M` and `CategoryTheory.ActionCategory` for the algebraic
structures; for the gauge groupoid consume SmoothBundlesConnections B1.4's free proper quotient
atlas and B1.1's division map, and prove that multiplication `[p,q][q',r] = [p·δ(q,q'), r]` is
independent of representatives.

- Each example satisfies the axioms of §G0.2 with Hausdorff arrows, and its source fibres are
  `{x}`, `M`, `G`, `G × {x}` and `P` respectively.
- The action groupoid of `G` acting on itself by left multiplication is isomorphic to the pair
  groupoid of `G`.
- The gauge groupoid of a trivial bundle `M × G` is isomorphic to the product of the pair groupoid
  of `M` with `G`.

**Checks.**

- The action groupoid of the trivial action of `G` on `M` is the bundle of groups `M × G` with
  `s = t = pr₁`; a definition with target `(g,x) ↦ x` for every action would make every action
  groupoid a bundle of groups.
- In the gauge groupoid of `M × G`, `[(x,g),(y,h)]` corresponds to `(x,y,g h⁻¹)`; the pair
  `((x,g),(y,h)) ∼ ((x,gk),(y,hk))` has the same image, and a definition with `g⁻¹h` would not be
  invariant under the right action.
- The gauge groupoid of the Hopf bundle `S³ → S²` has arrow manifold `(S³ × S³)/U(1)` of
  dimension `5 = 2·2 + 1`, consistent with `dim Γ = 2 dim M + dim G`.
- For `ℤ/2` acting on `ℝ` by negation, the arrows `(−1,0)` and `(1,0)` are distinct and both lie in
  the isotropy at `0`; the isotropy at `x ≠ 0` is trivial.

*Needs:* §G0.2; SmoothBundlesConnections B1.1 (division map), B1.4 (free proper quotient); Mathlib
`Discrete`, `SingleObj`, `Codiscrete`, `CategoryTheory.ActionCategory`.

### G0.4 Smooth functors, bisections, isotropy Lie groups and source components

Define smooth functors and smooth natural transformations between Lie groupoids, with identity and
composition laws, opposite and product groupoids and their functoriality. Define a local bisection
as a smooth `σ : U → Γ` on an open `U ⊆ M` with `s ∘ σ = id_U` and `t ∘ σ` an open smooth
embedding onto an open subset of `M`; prove identity, product, inverse, restriction and the
induced local diffeomorphism API. Prove that two equal-dimensional subspaces of a
finite-dimensional real vector space have a common complement (split their intersection, pair bases
of the residual subspaces by diagonal vectors and add a complement of their sum), apply it to
`ker ds` and `ker dt` at an arrow, whose dimensions agree by split surjectivity, and use the inverse
function theorem on that complement to produce a local bisection through every arrow.

Prove, using translation derivatives along bisections, that `t` restricted to a source fibre has
constant rank, and apply the constant-rank level theorem of §G0.1 to its fibre over `x` to construct
the isotropy Lie group `Γ_x`, pinned to the endpoint subtype `{g // s(g) = x ∧ t(g) = x}` with the
topology and smooth atlas transported from the level subtype inside the source fibre. Its
multiplication is `gh = h ≫ g`, transported from `CategoryTheory.Aut x`; prove multiplication and
inversion smooth. Construct the group isomorphism `(x ⟶ x) ≃* (Aut x)ᵐᵒᵖ` for the
`Groupoid.vertexGroup` instance through `Groupoid.isoEquivHom`, and its restriction to
`Subgroupoid.vertexSubgroup` for objects of a subgroupoid. Build orbit equivalence, orbit maps,
and conjugation `Γ_x → Γ_y`, `h ↦ g h g⁻¹`, for each arrow `g : x → y`. Define source-connectedness
and source-simple-connectedness as predicates on source fibres, prove invariance under inversion,
and construct the open source-connected component subgroupoid by taking in each source fibre the
component of its unit; prove closure under all structure maps and that its algebroid (§G2.1) is
unchanged.

- Every arrow lies in the image of a local bisection; local bisections form a pseudogroup under
  pointwise multiplication where defined.
- `Γ_x` is a Lie group, Hausdorff as a subspace of the Hausdorff source fibre and second-countable
  as a subspace of the arrow manifold; it is a closed embedded submanifold of `s⁻¹(x)`.
- Conjugation by `g : x → y` is a Lie group isomorphism `Γ_x ≃ Γ_y`, and changing `g` changes it by
  an inner automorphism.

**Checks.**

- For the pair groupoid the local bisections through `(y,x)` are `z ↦ (φ(z),z)` for local
  diffeomorphisms `φ` with `φ(x) = y`, and `Γ_x` is trivial; `ker ds = T_yM × 0` and
  `ker dt = 0 × T_xM` at `(y,x)` have the diagonal as a common complement.
- For a group `G` over a point, `Γ_pt = G` with its own multiplication (`gh = h ≫ g = g * h` by
  `SingleObj.comp_as_mul`), while `Groupoid.vertexGroup` gives `Gᵐᵒᵖ`; on `S₃` the two laws differ,
  which the isomorphism `(x ⟶ x) ≃* (Aut x)ᵐᵒᵖ` records.
- For the action groupoid of `G` on `M`, `Γ_x` is the stabiliser `G_x` with the group law of `G`:
  `(g,x)(h,x) = (gh,x)` requires `h·x = x` and `g·x = x`.
- For the unit groupoid the only bisection is the unit section and `Γ_x` is trivial; for the
  action groupoid of `ℤ/2` on `ℝ` by negation `Γ_0 = ℤ/2` and `Γ_x` is trivial for `x ≠ 0`, so the
  isotropy dimension is constant (`0`) though the isotropy groups are not isomorphic.

*Needs:* §G0.1 (constant-rank level theorem), §G0.2; Mathlib `Groupoid.vertexGroup`,
`Groupoid.isoEquivHom`, `Subgroupoid.vertexSubgroup`, `CategoryTheory.Aut`.

### Examples

The unit groupoid over the real line; the pair groupoid of a manifold; a Lie group over a point
with the isotropy law compared with `Groupoid.vertexGroup`; the action groupoid of `ℤ/2` on `ℝ`;
the gauge groupoid of the Hopf bundle; the non-Hausdorff fundamental groupoid of the
horizontal-plane foliation of `ℝ³ ∖ {0}`.

### Dependencies

Mathlib `CategoryTheory.Groupoid` and the manifold library; Tau Ceti's local diffeomorphism and
bracket-derivative lemmas; DifferentialGeometry 10.1 and Layer 4; SmoothBundlesConnections B1.0,
B1.1 and B1.4. Layer 0 grounds every later layer.

## Layer 1: Lie algebroids and their basic calculus (G1)

### G1.1 Lie algebroids

Define a Lie algebroid as a smooth real vector bundle `A → M` of finite rank with an `ℝ`-Lie
bracket on its smooth sections and a smooth fibrewise-linear anchor `ρ : A → TM` satisfying
`[a, f b] = f [a,b] + (ρ(a) f) b`. Bundle each bracket, anchor and their laws, and define a
structure-indexed section type synonym `Γ(A)` (a `def`, not an `abbrev`), transporting the
`C∞(M,ℝ)`-module and scalar instances of PseudodifferentialOperators P1.0 to it, so that different
brackets or anchors on one underlying bundle cannot create instance diamonds. Install `LieRing`,
`LieAlgebra ℝ`, `LieRingModule`, `LieModule ℝ`, `LieRinehartRing` and `LieRinehartAlgebra` on
`Γ(A)`: the anchor is `C∞`-linear (`lie_smul_eq_mul'`), satisfies the product rule
(`leibniz_mul_right'`), the bracket satisfies the Leibniz rule (`leibniz_smul_right'`), and the
anchor is a Lie homomorphism (`LieRingModule.leibniz_lie`), the last proved from Jacobi and Leibniz.
Build evaluation, restriction to opens, local frames, structure functions and bracket locality, and
the converse local-frame criterion: skew structure coefficients and anchor coefficients satisfying
the Jacobi and anchor equations glue to an algebroid.

- The bracket is local: `[a,b]` on `U` depends only on `a|_U` and `b|_U`.
- `ρ([a,b]) = [ρ(a), ρ(b)]` for all sections (anchor Lie homomorphism), derived, not assumed.
- Restriction to an open set is a Lie algebroid with the restricted bracket and anchor, and local
  frames exist near every point.

**Checks.**

- `TM` with `ρ = id` and `VectorField.mlieBracket` is a Lie algebroid; the Leibniz rule is the
  derivation law of the vector-field bracket.
- `TM` with the same bracket and anchor `ρ = 2·id` is not: `[X, fY] = f[X,Y] + X(f) Y` while the
  law demands `2 X(f) Y`; the anchor is part of the data and is not free.
- A bundle of Lie algebras with zero anchor is a Lie algebroid exactly when its fibrewise bracket
  is `C∞`-bilinear on sections; the zero bundle and the zero bracket on any bundle are algebroids.
- On `ℝ` with `A = Tℝ`, anchor `ρ(∂_x) = x ∂_x` and bracket `[∂_x, ∂_x] = 0` on the frame: the
  Leibniz rule forces `[f ∂_x, g ∂_x] = x (f g' − g f') ∂_x`, and the anchor homomorphism law holds
  (both sides are `x (f g' − g f') x ∂_x`); a definition omitting the anchor term would give a
  non-skew bracket.

*Needs:* PseudodifferentialOperators P1.0 (smooth section modules); Mathlib `ContMDiffSection`,
`LieRinehartRing`, `LieRinehartAlgebra`, `LieRing`, `LieAlgebra`, `LieRingModule`, `LieModule`.

### G1.2 Morphisms, subalgebroids and pullbacks

After §G1.3a, define a Lie algebroid morphism over an arbitrary smooth base map `f : N → M` as a
bundle map `A → B` over `f` whose pullback of algebroid forms commutes with the differentials of
§G1.3a. Over the identity recover bracket- and anchor-preserving bundle maps. Prove identity,
composition, isomorphism transport and equivalence with the local-frame criterion; arbitrary
sections are not pushed forward along arbitrary base maps. Define Lie subalgebroids over the same
base as §G0.1 smooth subbundles closed under the bracket, with inherited anchor, restriction and
inclusion morphism. For a smooth `f : N → M` transverse to the anchor (the sum of `df(T_yN)` and
the anchor image at `f(y)` is the whole tangent space of `M` at `f(y)`, for all `y`), construct the
pullback algebroid `f^!A = {(v,a) ∈ TN × f*A : df(v) = ρ(a)}`, whose underlying bundle is a
SmoothBundlesConnections B1.0 fibre product, with anchor the projection to `TN`, bracket on locally related sections, universal morphism property and
composition and base-change identities.

- A morphism over the identity is exactly a bundle map `φ` with `ρ_B ∘ φ = ρ_A` and
  `φ([a,b]) = [φ a, φ b]`.
- The pullback `f^!A` has rank `rank A + dim N − dim M` and the projection `f^!A → TN` is its
  anchor; `(g ∘ f)^!A ≅ f^!(g^!A)` when both pullbacks exist.
- The inclusion of a subalgebroid is a morphism over the identity.

**Checks.**

- For any smooth `f : N → M`, `f^!TM = {(v,w) : df(v) = w} ≅ TN`; transversality is automatic
  since `ρ = id` is onto.
- For a bundle of Lie algebras `M × 𝔤` with zero anchor, transversality of `f` means `f` is a
  submersion, and then `f^!(M × 𝔤) = ker(df) ⊕ f*(M × 𝔤)`; for non-submersive `f` the subtype
  `{(v,a) : df(v) = 0}` has jumping rank and the hypothesis is not removable.
- Fibrewise negation on a bundle of Lie algebras `M × 𝔤` is a morphism over the identity exactly
  when `𝔤` is abelian (`[−a,−b] = [a,b] ≠ −[a,b]` on `𝔰𝔬(3)`).
- An involutive subbundle of `TM` is a subalgebroid; the span of `∂_x` and `∂_y + x ∂_z` in `Tℝ³`
  is a subbundle but `[∂_x, ∂_y + x ∂_z] = ∂_z` leaves it, so it is not a subalgebroid.

*Needs:* §G0.1 (subbundles, bracket naturality), §G1.1, §G1.3a; SmoothBundlesConnections B1.0
(fibre products), B2 (Hom bundles).

### G1.3 Chevalley–Eilenberg complexes

**G1.3a, the algebroid complex.** Construct the Chevalley–Eilenberg complex of a finite-rank Lie
algebroid on DifferentialGeometry 0.2's smooth alternating-map bundle with source `A` and target
`ℝ`: degree-`k` cochains are smooth sections of `Alt^k(A)`, equivalently alternating
`C∞(M)`-multilinear maps on `Γ(A)` by the local-frame tensoriality theorem. Build one smooth
fibrewise wedge on sections of `Alt^•(E)` for every finite-rank bundle `E`, from DifferentialGeometry
0.1's operations in local trivialisations, without a norm on the fibres; §G4.1 specialises it to
`T*M`. Pin, for `ω` of degree `k`,
`(d_A ω)(a₀,…,a_k) = Σ_i (−1)^i ρ(a_i)(ω(a₀,…,â_i,…,a_k)) + Σ_{i<j} (−1)^{i+j} ω([a_i,a_j], a₀,…,â_i,…,â_j,…,a_k)`,
the remaining arguments in the second sum in their original order. Prove smoothness, alternation,
`C∞`-multilinearity, the Leibniz rule and `d_A² = 0` in every degree, then contraction, Lie
derivative and the Cartan identities. **G1.3b**, after §G1.2: pullback of cochains along a morphism
is a chain map, functorially, with the induced map on cohomology.

Separately construct the all-degree Chevalley–Eilenberg complex of a finite-dimensional real Lie
algebra `L` with coefficients in a module `V` with `[LieRingModule L V] [LieModule ℝ L V]`:
`C^k = Alt^k_ℝ(L,V)` with
`(dω)(x₀,…,x_k) = Σ_i (−1)^i x_i·ω(x₀,…,x̂_i,…,x_k) + Σ_{i<j} (−1)^{i+j} ω([x_i,x_j], x₀,…,x̂_i,…,x̂_j,…,x_k)`.
Prove alternation, `d² = 0` and define cohomology in every degree. Prove the comparisons
`Alt¹_ℝ(L,V) ≃ LieModule.Cohomology.oneCochain ℝ L V` and
`Alt²_ℝ(L,V) ≃ LieModule.Cohomology.twoCochain ℝ L V`, and that `LieModule.Cohomology.d₁₂` and
`LieModule.Cohomology.d₂₃` equal the displayed differential in degrees one and two, the latter after
forgetting `Alt³` into all trilinear maps, where Mathlib's `d₂₃` lands. The trivial coefficient case
specialises through `TrivialLieModule ℝ L ℝ` and `TrivialLieModule.equiv`. This standalone complex
is what ComplexKahlerGeometry K8, CharacteristicClasses C5a and QuantumFoundations consume; it
claims no generic complex for arbitrary coefficient rings or formal Lie–Rinehart algebras.

- `d_A f = ρ*(df)` in degree zero, that is `(d_A f)(a) = ρ(a) f`.
- `(d_A² f)(a,b) = ([ρ(a),ρ(b)] − ρ([a,b])) f`, so `d_A² = 0` in degree zero is equivalent to the
  anchor homomorphism law, and in higher degrees uses Jacobi.
- Cartan: `L_a = ι_a d_A + d_A ι_a`, `[L_a, ι_b] = ι_{[a,b]}`, `[L_a, L_b] = L_{[a,b]}`.

**Checks.**

- For `A = TM` the complex is the de Rham complex and the pinned formula is the standard
  `dω(X,Y) = Xω(Y) − Yω(X) − ω([X,Y])` in degree one.
- For a Lie algebra over a point with trivial coefficients the complex is the Lie algebra
  cohomology complex; for `L = 𝔰𝔬(3)` with basis `e₁,e₂,e₃` and `[e₁,e₂] = e₃`, the one-cochain
  `e₃*` has `d(e₃*)(e₁,e₂) = −e₃*([e₁,e₂]) = −1`, so `H¹(𝔰𝔬(3)) = 0` while `H¹` of the abelian
  algebra `ℝ³` is `ℝ³`.
- Mathlib's `d₁₂ f (x,y) = x·f(y) − y·f(x) − f[x,y]` and
  `d₂₃ a (x,y,z) = x·a(y,z) − y·a(x,z) + z·a(x,y) − a([x,y],z) + a([x,z],y) − a([y,z],x)` are the
  displayed formula term by term; a definition with the opposite sign on the bracket terms would
  not satisfy `d₂₃ ∘ d₁₂ = 0`.
- For the algebroid of §G1.1 Check 4 (`A = Tℝ`, `ρ(∂_x) = x ∂_x`) one has `(d_A f)(∂_x) = x f'`,
  so `d_A x` is `x` times the dual frame covector and vanishes at the origin, unlike the de Rham
  `dx`; the degree-zero cocycles on a connected open set are still exactly the constants.

*Needs:* §G1.1; DifferentialGeometry 0.1, 0.2; Mathlib `LieModule.Cohomology.oneCochain`,
`twoCochain`, `d₁₂`, `d₂₃`, `TrivialLieModule`, `TrivialLieModule.equiv`; §G1.3b additionally §G1.2.

### G1.4 Tangent, involutive, zero-anchor and transformation algebroids

Construct the tangent algebroid, an involutive subbundle as a subalgebroid of `TM`, a smooth bundle
of Lie algebras with zero anchor, and the transformation algebroid of a Lie algebra homomorphism
`α : 𝔤 → 𝔛(M)`: bundle `M × 𝔤`, anchor `α`, and bracket
`[a,b](x) = [a(x),b(x)] + D b_x(α(a(x))) − D a_x(α(b(x)))` on `𝔤`-valued functions. Verify the laws
and compatibility with restriction and equivariant maps. For a left Lie group action the
homomorphism is `ξ ↦ −ξ_M`.

- On constant sections the transformation bracket is the Lie algebra bracket; the Leibniz rule
  follows from the two derivative terms.
- The anchor is a homomorphism exactly because `α` is one.
- A transformation algebroid has isotropy `𝔤_x = ker α_x` at `x`, the stabiliser algebra of the
  action.

**Checks.**

- For the affine group `{(a,b) : a > 0}` acting on `ℝ` by `x ↦ a x + b` with basis `e₁, e₂` of its
  Lie algebra (`[e₁,e₂] = e₂`), the fundamental fields are `(e₁)_ℝ = x ∂_x`, `(e₂)_ℝ = ∂_x` and
  `[x ∂_x, ∂_x] = −∂_x = −([e₁,e₂])_ℝ`, so `ξ ↦ ξ_M` is an anti-homomorphism and `ξ ↦ −ξ_M` is the
  homomorphism the transformation algebroid needs.
- For the trivial action the transformation algebroid is the zero-anchor bundle `M × 𝔤`.
- For `ℝ` acting on itself by translation the transformation algebroid is `Tℝ` with anchor
  `c ↦ −c ∂_x`, an isomorphism onto the tangent algebroid.

*Needs:* §G1.1; DifferentialGeometry Layer 4 (involutive distributions); HamiltonianSystems
Layer 3 (`InfinitesimalAction` sign `(⁅Z,Z'⁆)_M = −[Z_M,Z'_M]`).

### G1.5 Isotropy Lie algebras

Prove that the kernel of the anchor in each fibre is a Lie algebra, with the bracket of extensions
independent of the extensions chosen. Construct the smooth Lie-algebra-bundle structure on every
open set where the anchor rank is locally constant, and on the pullback to each embedded
submanifold on which that rank is constant; along each orbit (§G2.4) use its immersed structure for
the isotropy bundle and the exact sequence `0 → 𝔤_L → A|_L → TL → 0`. Fibres `A_x` on which the
anchor does not vanish are not Lie algebras.

**Checks.**

- For `TM` every isotropy algebra is zero; for a zero-anchor bundle of Lie algebras every fibre is
  its own isotropy.
- On `Tℝ` the bracket of vectors at a point is not defined by values: `[∂_x, x ∂_x] = ∂_x` at `0`
  although `x ∂_x` vanishes there; on the kernel of the anchor the Leibniz term vanishes, which is
  what makes the isotropy bracket well defined.
- For the transformation algebroid of `SO(3)` acting on `ℝ³`, the
  isotropy at `x ≠ 0` is the one-dimensional rotation algebra about `x` and at `0` it is all of
  `𝔰𝔬(3)`; the rank is constant on `ℝ³ ∖ {0}` and jumps at `0`.

*Needs:* §G1.1, §G0.1 (subbundles); §G2.4 for the orbit case.

### G1.6 Complex Lie algebroids and the involutivity equivalence

Build complex Lie algebroids over real bases: a complex vector bundle `A` with complex anchor into
`TM ⊗ ℂ`, acting on PseudodifferentialOperators P1.0's complex smooth-section module through the
scalar structure `(u + iv)·s = u·s + v·(Js)`; construct the complex Lie–Rinehart structure,
morphisms and the complexification of a real Lie algebroid. On the SmoothBundlesConnections B2
complexification of a real bundle construct the ℂ-linear constant-rank kernel and image subbundle
API (model `Fin k → ℂ`, local smooth ℂ-frames, induced ℂ-linear trivialisations). Prove, for an
arbitrary constant-rank complex subbundle `E ⊆ TM ⊗ ℂ`, that `E` is a subalgebroid of the
complexified tangent algebroid exactly when its sections are closed under the complexified bracket
(involutive). The specialisation of this statement to the `±i` eigenbundles of an almost-complex
structure and its comparison with the Nijenhuis tensor and Newlander–Nirenberg are
ComplexKahlerGeometry's.

- The complexification of a real algebroid is a complex algebroid whose real sections recover the
  original bracket.
- Kernels and images of constant-rank ℂ-linear bundle maps are complex subbundles.
- Involutive ⇔ subalgebroid, for any constant-rank complex subbundle of `TM ⊗ ℂ`.

**Checks.**

- The complexification of `Tℝ²` has the rank-one subbundle spanned by `∂_x + i ∂_y`; being of rank
  one it is involutive, hence a subalgebroid, and together with its conjugate it spans `Tℝ² ⊗ ℂ`.
- The complexified span of `∂_x` and `∂_y + x ∂_z` in `Tℝ³ ⊗ ℂ` has constant rank two but
  `[∂_x, ∂_y + x ∂_z] = ∂_z` leaves it; it is not a subalgebroid.
- The complex-scalar structure satisfies `i·(i·s) = −s` since `J² = −1`; a definition with
  `(u + iv)·s = u·s − v·(Js)` would make `i·(i·s) = −s` as well but would turn ℂ-linear maps into
  antilinear ones, which the kernel API detects on `s ↦ Js`.

*Needs:* §G1.1, §G0.1 (subbundle API); SmoothBundlesConnections B2 (complexification);
PseudodifferentialOperators P1.0 (complex section modules).

### Examples

The tangent algebroid; the affine-group transformation algebroid with its anti-homomorphism
witness; the Lie algebra cohomology of `𝔰𝔬(3)` and of the abelian `ℝ³`; the non-involutive
rank-two subbundle of `Tℝ³`.

### Dependencies

Layer 0 for subbundles and bracket naturality; PseudodifferentialOperators P1.0;
DifferentialGeometry 0.1, 0.2 and Layer 4; SmoothBundlesConnections B1.0 and B2; Mathlib's Lie
and Lie–Rinehart classes and low-degree Lie cohomology.

## Layer 2: Differentiation, orbits and representations (G2)

### G2.1 The Lie algebroid of a Lie groupoid

Construct `A(Γ) = u*(ker ds)` as a smooth vector bundle over `M`: the kernel bundle of the
submersion `s` from SmoothBundlesConnections B1.0 pulled back along the unit embedding, with anchor
`dt`. Extend each section uniquely to a source-vertical right-invariant vector field on `Γ`
(`a^R(g) = dR_g(a(t(g)))`), prove smoothness, restriction and the inverse construction, closure of
right-invariant source-vertical fields under the bracket (by §G0.1's bracket naturality along the
right translations `R_g : s⁻¹(t(g)) → s⁻¹(s(g))`, which are diffeomorphisms of source fibres),
Jacobi and Leibniz, and anchor
compatibility with `dt` (again by naturality, since `t` relates `a^R` to `ρ(a)`). Differentiate
smooth functors to algebroid morphisms, prove functoriality and the morphism criterion of §G1.2.

- `A(Γ)` has rank `dim Γ − dim M` and `ρ = dt|_{A}`.
- Right-invariant source-vertical fields form a Lie algebra isomorphic to `Γ(A(Γ))`.
- The Lie functor sends identities to identities and composites to composites, and the
  source-connected component of §G0.4 has the same algebroid.

**Checks.**

- The unit groupoid has `A = 0`; the pair groupoid has `A_{(x,x)} = T_xM × 0` with
  `dt = pr₁`, so `A(M × M) = TM` with the ordinary bracket.
- For a Lie group over a point `A = T_1G` with the right-invariant bracket, which is the opposite
  of `GroupLieAlgebra` (§G2.2); on the affine group the raw bracket of `e₁, e₂` is `−e₂`.
- For the action groupoid of a left action, raw coordinates give `A = M × 𝔤` with anchor
  `ξ ↦ ξ_M` and the opposite bracket on constant sections, consistent with `ξ ↦ ξ_M` being an
  anti-homomorphism; the negative identification turns this into the transformation algebroid of
  §G1.4 with anchor `ξ ↦ −ξ_M`.

*Needs:* §G0.1 (bracket naturality), §G0.2, §G0.4, §G1.1, §G1.2; SmoothBundlesConnections B1.0
(kernel bundle and its pullback).

### G2.2 The examples differentiated and the right-invariant bracket sign

Compute the algebroids of the unit, pair, group, action and gauge groupoids. For a Lie group `G`
prove `rightInvariant_bracket`: the bracket of the right-invariant fields extending `ξ, η` is minus
the right-invariant field of their `GroupLieAlgebra` bracket, so the algebroid of `G` over a point
is the opposite Lie algebra and `v ↦ −v` is the Lie algebra isomorphism to `GroupLieAlgebra`.
Prove that the isotropy Lie algebra `ker ρ_x` of any Lie groupoid (§G1.5) is isomorphic to the Lie
algebra of the isotropy Lie group `Γ_x` (§G0.4) through the **negative** of the tangent
identification; raw isotropy vectors are not compared by the identity.

- `[ξ^R, η^R] = −[ξ,η]^R` where `[ξ,η]` is Mathlib's `GroupLieAlgebra` bracket.
- `v ↦ −v : A(G) → GroupLieAlgebra I G` is a Lie algebra isomorphism.
- `−d(incl)_1 : ker ρ_x → Lie(Γ_x)` is a Lie algebra isomorphism for every Lie groupoid.

**Checks.**

- On the affine group `{(a,b) : a > 0}` with `(a,b)(a',b') = (aa', ab' + b)`: the left-invariant
  fields are `e₁^L = a ∂_a`, `e₂^L = a ∂_b` with `[e₁^L, e₂^L] = a ∂_b`, so `[e₁,e₂] = e₂` in
  `GroupLieAlgebra`; the right-invariant fields are `e₁^R = a ∂_a + b ∂_b`, `e₂^R = ∂_b` with
  `[e₁^R, e₂^R] = −∂_b = −e₂^R = −[e₁,e₂]^R`. A statement with `+` fails here.
- On an abelian group both brackets vanish and the sign is invisible; the abelian case is not a
  witness.
- For the action groupoid of `G` on itself by left translation (the pair groupoid of `G`), the
  isotropy is trivial on both sides, and for the trivial action on a point the isotropy algebra is
  the raw `T_1G` with the opposite bracket, which `−id` carries to `GroupLieAlgebra`.

*Needs:* §G2.1; Mathlib `GroupLieAlgebra`, `LieGroup`, `VectorField.mlieBracket`; Tau Ceti
`mulRightInvariantVectorField`, `leftInvariantDerivationLieEquivGroupLieAlgebra`.

### G2.3 The Atiyah algebroid

Prove that the gauge groupoid of a principal `G`-bundle `π : P → M` differentiates to `TP/G`:
sections are `G`-invariant vector fields on `P`, the bracket is their vector-field bracket, the
anchor is `dπ`, and SmoothBundlesConnections B3.2's sequence `0 → P ×_G 𝔤 → TP/G → TM → 0` is exact
as Lie algebroids, with the adjoint bundle carrying its pointwise bracket and the inclusion
`j([p,ξ]) = [−V_ξ(p)]`. Prove the local bracket formulas. Consume B3.2's correspondence between
principal connections and splittings `s : TM → TP/G` and its identity
`[s(X),s(Y)] − s([X,Y]) = j(F(X,Y))`, and deduce that `s` is a Lie algebroid morphism exactly when
the curvature `F` vanishes. The horizontal-field identity itself is B3.2's and is not reproved.

- Exactness: `j` is injective with image the vertical invariant fields, and `dπ` is onto `TM`.
- `j` is a Lie algebra homomorphism for the pointwise bracket on equivariant `𝔤`-valued functions.
- Flat connections are exactly the splittings that are algebroid morphisms.

**Checks.**

- On the trivial bundle `M × G`, for equivariant `f, h : P → 𝔤` one computes
  `V_f(h) = −[f,h]` and `[V_f, V_h] = V_{[f,h] + V_f(h) − V_h(f)} = −V_{[f,h]}`, so `V` is an
  anti-homomorphism and `j = −V` a homomorphism; the sign in `j` is forced.
- For `P = G` over a point, `TP/G` is the left-invariant fields with `[ξ^L,η^L] = [ξ,η]^L`, and
  `j(ξ) = −ξ^L` identifies it with the opposite algebra, agreeing with §G2.2.
- For the Hopf bundle `S³ → S²` with its standard connection the curvature is the area form up to a
  constant, so no splitting is a morphism; for the trivial bundle with the trivial connection
  `s(X) = (X,0)` is a morphism.

*Needs:* §G2.1, §G2.2, §G0.3; SmoothBundlesConnections B3.2 (Atiyah sequence, `j`, splitting
identity).

### G2.4 The orbit theorem

Construct the Stefan–Sussmann orbit decomposition for the anchor distribution `ρ(A)` of a Lie
algebroid: flows of anchors of sections preserve the distribution, orbit charts give connected
immersed manifolds tangent to `ρ(A)`, and maximal connected orbits partition `M`
(Crainic–Fernandes–Mărcuț, *Lectures on Poisson Geometry*, Theorem 4.1 and Lemma 4.2, p. 63, for
the cotangent algebroid, with orbit charts from Weinstein splitting charts; for a general algebroid
the same argument runs with the local splitting theorem of Fernandes, *Lie algebroids, holonomy and
characteristic classes*, Theorem 1.1, arXiv p. 11, in whose coordinates `(x,y)` the anchor images
of the frame are `∂_{x_i}` and fields in the `y`-directions vanishing on the plaque `{y = 0}`, so
that plaque is the local orbit through the centre). Build the smooth structure and
the universal immersion property; the rank may vary between orbits. Prove that each orbit is
Hausdorff and second-countable in its own topology by the countable-atlas argument from a
second-countable base and finite-rank local generators. For source-connected groupoids identify the
orbits of `A(Γ)` with the groupoid orbits; for a general groupoid the orbits of `A(Γ)` are those of
the source-connected component, and a full groupoid orbit may be a union of them. For Lie group
actions prove the orbit/stabiliser tangent theorem with the orbit's homogeneous-space topology.

- Each orbit `L` is an injectively immersed submanifold with `T_xL = ρ(A_x)`, and a smooth map
  into `M` with image in `L` is smooth into `L`.
- On the open set where the anchor rank is locally constant, the orbits are the leaves of
  DifferentialGeometry Layer 4's Frobenius theorem.
- Orbits of `A(Γ)` for source-connected `Γ` are the sets `t(s⁻¹(x))`.

**Checks.**

- For `TM` the orbits are the connected components; for a zero-anchor algebroid every point is an
  orbit (rank `0` everywhere).
- For the irrational flow on the torus (transformation algebroid of `ℝ` acting by
  `t·(x,y) = (x + t, y + λt)`, `λ ∉ ℚ`) every orbit is a dense line whose intrinsic topology is `ℝ`:
  Hausdorff and second-countable, but not embedded, so the subspace topology would be wrong.
- For the action groupoid of `ℤ/2` on `ℝ` by negation the groupoid orbits are `{x, −x}` while the
  algebroid is zero and its orbits are points: a groupoid orbit is a union of algebroid orbits.
- For `SO(3)` acting on `ℝ³` the orbits are the spheres of positive radius (rank `2`) and the
  origin (rank `0`); the rank is not constant, so Layer 4 alone does not cover the decomposition.

*Needs:* §G1.1, §G1.4, §G1.5, §G2.1; DifferentialGeometry Layer 4 (constant-rank Frobenius on the
regular locus), Layer 3 (flows); Tau Ceti maximal integral curves and flows.

### G2.5 Representations of Lie algebroids

Define a representation of `A` on a smooth vector bundle `E` as a flat `A`-connection:
`∇_{fa} u = f ∇_a u`, `∇_a(fu) = f ∇_a u + (ρ(a) f) u`, and curvature
`∇_a ∇_b − ∇_b ∇_a − ∇_{[a,b]} = 0`. Define the covariant exterior differential on
`Alt^•(A) ⊗ E` and cohomology with coefficients; prove tensor, dual, direct-sum and morphism APIs.
Differentiate linear representations of Lie groupoids to representations of their algebroids.
Integration over source-simply-connected integrations is §G5.4.

- The curvature of an `A`-connection is `C∞`-trilinear, and a flat connection makes
  `(Alt^•(A) ⊗ E, d_∇)` a complex.
- The trivial line bundle with `∇_a f = ρ(a) f` is a representation, with cohomology that of
  §G1.3a.
- A groupoid representation on `E` differentiates to a representation of `A(Γ)`, functorially.

**Checks.**

- For a Lie algebra over a point a representation is a Lie algebra representation, and the complex
  is §G1.3's complex with coefficients.
- On the trivial line bundle over `A = Tℝ²`, `∇_X u = X(u) + θ(X) u` has curvature `dθ`; for
  `θ = x dy` the curvature is `dx ∧ dy ≠ 0`, so this connection is not a representation, while
  `θ = dx` gives one.
- For `A = TM` representations are flat vector bundles, and the pair groupoid's representations
  on `E → M` are global trivialisations of `E` (§G3.2).

*Needs:* §G1.1, §G1.3a, §G2.1; Mathlib `ContMDiffVectorBundle`.

### Examples

The algebroids of the five standard groupoids; the affine-group sign witness for
`rightInvariant_bracket`; the Atiyah sequence of the trivial bundle and of the Hopf bundle; the
irrational torus flow and the `SO(3)` action as orbit decompositions.

### Dependencies

Layers 0 and 1; SmoothBundlesConnections B1.0 and B3.2; DifferentialGeometry Layers 3 and 4;
Mathlib's `GroupLieAlgebra`; Tau Ceti's right-invariant fields and flows.

## Layer 3: Actions, trivialisations and restriction (G3)

### G3.1 Groupoid actions and isotropy quotients

Define a smooth left action of a Lie groupoid `Γ` on a smooth map `p : X → M` as a smooth map on
the SmoothBundlesConnections B1.0 fibre product `Γ ×_{s,p} X` (which exists because `s` is a
submersion, whether or not `p` is) with `p(g·x) = t(g)`, the unit law and associativity. Convert a
right action of `Λ` on `b : P → Λ₀` to this convention by `p·λ := λ⁻¹·p`, and back. Prove that each
arrow induces a diffeomorphism between the fibres of `p` over its source and target when these carry
induced manifold structures (in particular for a submersion `p`), with inverse induced by `g⁻¹`.
Construct the action groupoid, equivariant maps, products and pullbacks of actions, and linear
representations. Prove the equivalence between algebraic `Γ`-actions on `p : X → M` and functors
`Γ ⥤ Type` sending `m` to `p⁻¹(m)`, with the dependent-sum total space as inverse and equivariant
maps as natural transformations; the smooth version keeps the total-space atlas and the smooth
total action map.

For every object `ξ` restrict the algebraic action to the isotropy group `Γ_ξ` of §G0.4 on
`Z_ξ = p⁻¹(ξ)`, prove invariance from the anchor law, and install `MulAction Γ_ξ Z_ξ` with the law
`gh = h ≫ g` (not the law of `Groupoid.vertexGroup`). Reuse `MulAction.orbitRel`,
`MulAction.orbitRel.Quotient` and `Quotient.lift`, prove that the orbit relation is
`∃ g : Γ_ξ, g·x = y` (inverting where the native relation reverses the variables), and export the
quotient projection and the invariant-map universal property. For an arrow `g : ξ → η` construct the
quotient bijection `[x] ↦ [g·x]`, prove it independent of representatives and of the connecting arrow
(the conjugation `Γ_ξ → Γ_η` itself changes by an inner automorphism), its inverse, identity and
composition laws, and that equivariant maps induce quotient maps commuting with these bijections.

For the smooth specialisation assume `X` Hausdorff and second-countable, `ξ` a regular value of `p`
and the restricted `Γ_ξ`-action free and proper. SmoothBundlesConnections B1.0 gives `Z_ξ` its
regular-fibre manifold and universal property, which make the restricted action smooth; `Z_ξ` is
Hausdorff and second-countable as a subspace of `X`, and `Γ_ξ` is Hausdorff and second-countable by
§G0.4, so B1.4's hypotheses hold. Consume B1.4's free proper quotient atlas, converting the left
action by `x·h = h⁻¹·x` as in B1.2, prove that the right-orbit setoid equals the native left-orbit
setoid, transport the atlas onto `MulAction.orbitRel.Quotient Γ_ξ Z_ξ` with its quotient topology,
and obtain the Hausdorff smooth structure, the surjective submersion `q`, and
`ker(dq_z) = T_z(Γ_ξ·z) = range(d(h ↦ h·z)_1)`, specialising B1.1's vertical-tangent identity with
the inversion sign. Consume B1.1's invariant-map smooth descent. When the smooth hypotheses hold at
both `ξ` and `η`, prove that each arrow-induced quotient bijection is a diffeomorphism, using B1.1's
local sections on the quotient charts. Arbitrary levels or isotropy actions carry only the
algebraic quotient. §G7.2 consumes this quotient and adds the symplectic data.

- An action of `Γ` on `p` restricts to an action of `Γ_ξ` on `Z_ξ`, and `Z_ξ/Γ_ξ ≅ Z_η/Γ_η` for
  any arrow `ξ → η`.
- Under the smooth hypotheses `Z_ξ/Γ_ξ` is a Hausdorff second-countable manifold of dimension
  `dim X − dim M − dim Γ_ξ`, and `q` is a surjective submersion.
- A `Γ`-invariant smooth function on `Z_ξ` descends to a smooth function on `Z_ξ/Γ_ξ`.

**Checks.**

- For a Lie group over a point an action on `X → pt` is a smooth `G`-action with `g·(h·x) =
  (gh)·x`; the law `gh = h ≫ g` makes this the ordinary `MulAction`, whereas the
  `Groupoid.vertexGroup` law would give a right action.
- The pair groupoid of `M` acts on `M × F → M` by `(y,x)·(x,f) = (y,f)`; every isotropy group is
  trivial, `Z_ξ = F` and the quotient is `F`.
- For the action groupoid `G ⋉ M` acting on `X = M` (`p = id`), `Z_ξ = {ξ}` and the isotropy
  `G_ξ` acts trivially; the orbit relation `∃ g, g·x = y` is reflexive, symmetric (via `g⁻¹`) and
  transitive, which the native `orbitRel` with its reversed variables also gives.
- For `S¹` acting freely and properly on `S³` (the Hopf action, as the action groupoid over a
  point) the quotient is `S²` of dimension `3 − 0 − 1 = 2`, and `ker(dq)` is the line of the
  fundamental field.

*Needs:* §G0.2, §G0.4; SmoothBundlesConnections B1.0 (fibre product, regular fibre), B1.1
(descent, vertical tangent identity, local sections), B1.2 (left/right conversion), B1.4 (free
proper quotient); Mathlib `MulAction.orbitRel`, `MulAction.orbitRel.Quotient`, `Quotient.lift`.

### G3.2 Pair-groupoid actions are trivialisations

For a nonempty base with chosen `m₀`, prove that a smooth action of the pair groupoid of `M` on a
smooth fibre bundle `X → M` is equivalent to a global smooth trivialisation `X ≅ M × X_{m₀}` over
`M`, by `x ↦ (p(x), (m₀,p(x))·x)` with inverse `(m,y) ↦ (m,m₀)·y`. State the equivalence of
categories with morphisms; without a basepoint, as coherent fibre identifications.

**Checks.**

- `M × F` with `(y,x)·(x,f) = (y,f)` recovers the identity trivialisation.
- The Möbius band over `S¹` admits no pair-groupoid action, since it is not trivial.
- Over a disconnected base the equivalence is componentwise, with one basepoint per component.

*Needs:* §G3.1, §G0.3.

### G3.3 The fundamental Lie groupoid

Construct the fundamental Lie groupoid of a connected manifold as the gauge groupoid
`(M̃ × M̃)/π₁(M,m₀)` of the universal covering principal bundle, consuming §G0.3,
SmoothBundlesConnections B5.2's right deck action `[a]·[γ] = [γ.trans a]` and B5.2's countability
of `π₁(M,m₀)`, which makes `M̃` and the arrow manifold second-countable. Keep the right-action
convention distinct from the inverse/left deck convention of the intermediate cover by `H⁰`.
Prove that its algebraic groupoid is Mathlib's `FundamentalGroupoid` of path classes, and that its
representations with smooth local parallel trivialisations are exactly the smooth actions of §G3.1,
with equivariant maps agreeing on both sides, through B5.2's dictionary; extend componentwise to
disconnected bases, choosing basepoints only for the group-representation specialisation.

- The arrow manifold is Hausdorff and second-countable, with source fibres `M̃` and isotropy
  `π₁(M,x)`.
- Its algebroid is `TM` and it is the source-simply-connected integration of `TM` (§G5.4).
- Flat bundles with their holonomy are its representations.

**Checks.**

- For simply connected `M` the construction is the pair groupoid.
- For `M = S¹`, `M̃ = ℝ`, `π₁ = ℤ`, and `(ℝ × ℝ)/ℤ ≅ S¹ × ℝ` via `(a,b) ↦ (a mod 1, b − a)`; the
  source fibres are copies of `ℝ` and the isotropy is `ℤ`, generated by the arrow `(a, a+1)`.
- Under `gh = h ≫ g` the gauge-groupoid product `[γ₁][γ₂]` must be the class of `γ₂.trans γ₁`
  (first `γ₂`, then `γ₁`), which the right deck action `[a]·[γ] = [γ.trans a]` delivers; the left
  convention `[a.trans γ]` would identify the gauge groupoid with the opposite of
  `FundamentalGroupoid`, which on the figure eight (`π₁` free on `a, b` with `ab ≠ ba`) is a
  different identification, though invisible on `S¹`.

*Needs:* §G0.3, §G3.1; SmoothBundlesConnections B5.2 (deck action, countability, flat-bundle
dictionary); Mathlib `FundamentalGroupoid`; AlgebraicTopology Stage 1; Completed/UniversalCovers.

### G3.4 Restriction to subsets and submanifolds

Use Mathlib's `Subgroupoid.full` for algebraic restriction to every subset `Y ⊆ M`, with
functoriality under inclusions. Prove smooth restriction separately: open subsets, and embedded
submanifolds transverse to the anchor (`T_yY + ρ(A_y) = T_yM`), yield SmoothBundlesConnections B1.0
fibre products `s⁻¹(Y) ∩ t⁻¹(Y)` with submersive source and target, and the restricted algebroid is
`{a ∈ A|_Y : ρ(a) ∈ TY}`. For invariant embedded submanifolds treat the clean case with explicit
constant-rank and submersion hypotheses; anchor transversality is false for invariant submanifolds
of positive codimension and is not asserted.

**Checks.**

- Restricting to a point `Y = {x}` gives `Γ_x` (`Subgroupoid.full` with `Subgroupoid.vertexSubgroup`).
- Restricting the pair groupoid of `M` to any embedded `Y` gives the pair groupoid of `Y`;
  transversality is automatic since `ρ = id`.
- For `SO(2)` acting on `ℝ²`, the circle `Y` of radius `1` is invariant and
  `T_yY + ρ(A_y) = T_yY ≠ T_yℝ²`; the restriction is the action groupoid on `Y`, obtained from the
  invariant case, not from transversality.

*Needs:* §G0.2, §G0.4, §G2.1; SmoothBundlesConnections B1.0; Mathlib `Subgroupoid.full`,
`Subgroupoid.vertexSubgroup`.

### G3.5 Restricted action groupoids, bibundles and Morita equivalence

For an action groupoid write the restriction to `Y` as `{(g,y) : y ∈ Y, g·y ∈ Y}`; it is the action
groupoid on `Y` when `Y` is invariant, and prove the converse for projection-preserving inherited
actions; include a noninvariant open subset where only a restricted groupoid exists. Define a smooth
`Γ`–`Λ` bibundle as a manifold `P` with commuting smooth actions and anchors `a : P → Γ₀`,
`b : P → Λ₀`; right-principal means `a` is a surjective submersion and the right principal action
map `P ×_{b,t} Λ₁ → P ×_a P`, `(p,λ) ↦ (p, p·λ)`, is a diffeomorphism; biprincipal adds the
symmetric condition for `b`. Total arrow and bibundle manifolds are locally Hausdorff and
second-countable, not necessarily Hausdorff: the identity bibundle of a non-Hausdorff groupoid is
its arrow manifold. Construct the balanced product `(P ×_{Λ₀} Q)/Λ₁` for the diagonal action
`(p,q)·λ = (p·λ, λ⁻¹·q)`, with charts from local sections `σ : U → P` of `a` and the fibre products
`U ×_{b∘σ, Λ₀, a_Q} Q`, transitions smooth by the division map `P ×_a P → Λ₁`. Prove chart
compatibility, local Hausdorffness, second countability, openness of the quotient map from the
principal-action charts, and the quotient universal property. Construct the associator, unitors and
their pentagon and triangle identities, functoriality on equivariant maps, opposite bibundles and
closure of principal and biprincipal bibundles under composition (Blohmann, *Stacky Lie groups*,
Propositions 2.11 and 2.12, pp. 7–8, in the Hausdorff convention; this roadmap proves the
locally-Hausdorff version and its quotient atlas). For biprincipal bibundles prove the orbit
correspondence and the induced isotropy Lie group isomorphisms; Morita equivalence is not isomorphism
of arrow manifolds. Separately prove the Hausdorff-subcategory statement: when `Γ₀, Λ₀, Ξ₀`, `P` and
`Q` are Hausdorff (the arrow manifold `Λ₁` only locally Hausdorff), the diagonal orbit relation on
`P ×_{Λ₀} Q` is closed and the balanced product is Hausdorff.

- A right-principal bibundle has `b` smooth and `a` a surjective submersion with fibres the
  `Λ`-orbits, and the division map is a smooth inverse to the principal action map.
- Composition of right-principal bibundles is right-principal, associatively up to the coherent
  associator.
- Morita-equivalent groupoids have homeomorphic orbit spaces and isomorphic isotropy Lie groups at
  corresponding points.

**Checks.**

- `M` is a biprincipal bibundle between the pair groupoid of `M` and the trivial groupoid on a
  point (`a = id`, `b` constant); the principal action map `M ×_{pt} pt → M ×_M M = M` is the
  identity, so the pair groupoid is Morita equivalent to a point, with one orbit and trivial
  isotropy on both sides.
- A principal `G`-bundle `P → M` is a biprincipal bibundle between its gauge groupoid and `G` over
  a point; the balanced product of `P` with its opposite is `(P × P)/G`, the gauge groupoid itself.
- The action groupoid of `ℤ/2` on `ℝ` by negation is not Morita equivalent to the unit groupoid of
  its orbit space: the isotropy at `0` is `ℤ/2` on one side and trivial on the other.
- For the open subset `Y = (0,∞)` and the action of `ℝ` on `ℝ` by translation, the restricted
  groupoid `{(t,y) : y > 0, y + t > 0}` is not an action groupoid on `Y`: the arrow `(−1, 1/2)`
  does not exist, while in an action groupoid on `Y` every group element acts at every point.

*Needs:* §G0.2, §G0.3, §G0.4, §G3.1; SmoothBundlesConnections B1.0 (fibre products), B1.1
(division map).

### Examples

The Hopf action and its quotient `S²`; the fundamental Lie groupoid of `S¹`; the `SO(2)`-invariant
circle; Morita equivalence of the pair groupoid with a point and of a gauge groupoid with its
structure group; the noninvariant restriction of the translation action.

### Dependencies

Layers 0 and 2; SmoothBundlesConnections B1.0, B1.1, B1.2, B1.4 and B5.2; AlgebraicTopology Stage 1;
Completed/UniversalCovers; Mathlib `MulAction.orbitRel`, `Subgroupoid.full` and
`FundamentalGroupoid`.

## Layer 4: Poisson structures, cotangent algebroids and leaves (G4)

### G4.1 Multivectors, the Schouten bracket and Poisson bivectors

Use DifferentialGeometry 0.2's smooth alternating-map bundle with source `T*M` and target `ℝ` as the
carrier of multivector fields, consume SmoothBundlesConnections B2's exterior-power bundle and prove
the finite-dimensional bundle isomorphism `Λ^k TM ≃ Alt^k(T*M)`. Own evaluation on covectors, the
specialisation of §G1.3a's fibrewise wedge, restriction and pushforward where defined. Build the
Schouten bracket with graded antisymmetry, graded Jacobi and graded Leibniz and its local
coordinate formulas (Crainic–Fernandes–Mărcuț, *Lectures on Poisson Geometry*, Theorem 2.8,
p. 26). Pin `[X,f] = X(f)`, `[X,Y] = VectorField.mlieBracket X Y`, graded antisymmetry
`[P,Q] = −(−1)^{(p−1)(q−1)} [Q,P]` and `[P, Q ∧ R] = [P,Q] ∧ R + (−1)^{(p−1)q} Q ∧ [P,R]`; hence
`[π,f] = −π♯df`. A smooth bivector `π` is Poisson when `[π,π] = 0`. Prove the equivalence with the
Jacobi identity for `{f,g} = π(df,dg)`, the biderivation and locality identities, recovery of the
bivector from the bracket on a finite-dimensional base, and install Lie and Poisson algebra
instances on smooth functions through Mathlib's Lie and derivation classes.

- `{·,·}` is a Lie bracket on `C∞(M)` and a derivation in each argument exactly when
  `[π,π] = 0`; in local coordinates `[π,π]^{ijk} = 2 Σ_l (π^{il} ∂_l π^{jk} + cyclic)`.
- The bracket is local and determines `π`: `π(df,dg) = {f,g}`.
- The Schouten bracket restricts to the vector-field bracket in degree one and to the action on
  functions in degree zero.

**Checks.**

- For `π = ∂_x ∧ ∂_p` on `ℝ²`, `[π,x] = ∂_p(x)∂_x − ∂_x(x)∂_p = −∂_p`, computed from the pinned
  Leibniz rule and antisymmetry, and `π♯dx = ∂_p` from `β(π♯dx) = π(dx,β)`; so `[π,f] = −π♯df`
  holds with this sign and fails with `+`.
- Every bivector on a surface is Poisson (`[π,π]` is a trivector); on `ℝ³`,
  `π = ∂_x ∧ ∂_y + y ∂_y ∧ ∂_z` has `{x,y} = 1`, `{y,z} = y`, `{x,z} = 0` and
  `{x,{y,z}} + {y,{z,x}} + {z,{x,y}} = {x,y} + 0 + 0 = 1 ≠ 0`, so it is not Poisson.
- The zero bivector is Poisson with zero bracket; a constant-coefficient bivector on `ℝⁿ` is
  Poisson, with `{x_i,x_j} = π^{ij}`.
- Linear Lie–Poisson `{ℓ_ξ,ℓ_η} = ℓ_{[ξ,η]}` on `𝔤*` satisfies Jacobi exactly because the Lie
  algebra bracket does (§G4.6A).

*Needs:* §G1.3a (fibrewise wedge); DifferentialGeometry 0.1, 0.2; SmoothBundlesConnections B2
(exterior powers); Mathlib `VectorField.mlieBracket`, `Derivation`, `LieRing`, `LieAlgebra`.

### G4.2 Poisson maps, the symplectic case and the legacy adapter

Define Poisson maps, products, the opposite structure `−π`, restriction to opens, Poisson
diffeomorphisms and coisotropic submanifolds; prove the pointwise tensor criterion
`φ_* π_x = π'_{φ(x)}` for a Poisson map. Prove that a nondegenerate Poisson structure is the same as
a closed nondegenerate two-form through `π♯ = −(ω♭)⁻¹`, with every sign, and that the resulting
bracket is HamiltonianSystems Layer 1's `poissonBracket` under §G4.2a.

- `φ` is Poisson iff `{f ∘ φ, g ∘ φ} = {f,g} ∘ φ` for all `f, g`, iff `φ_* π = π'` pointwise.
- The product of Poisson manifolds carries `π_M + π_N` and the projections are Poisson; the
  opposite structure is Poisson and `id : (M,π) → (M,−π)` is anti-Poisson.
- Nondegenerate `π` corresponds to symplectic `ω` with `π♯ = −(ω♭)⁻¹`, and `dω = 0 ⇔ [π,π] = 0`.

**Checks.**

- With `ω = dx ∧ dp` (CotangentLagrangian's `ω = −dθ`, `θ = p dx`): `ω♭(∂_p) = −dx`, so
  `−(ω♭)⁻¹(dx) = ∂_p = π♯dx` for `π = ∂_x ∧ ∂_p`, and `{x,p} = π(dx,dp) = 1`; HamiltonianSystems'
  `{x,p} = dx(X_p)` with `X_p = ∂_x` (from `ι_{X_p}ω = dp`) is also `1`. With `π♯ = +(ω♭)⁻¹` the two
  brackets would differ by sign.
- The diagonal `M → M × M` is Poisson for `(π, −π)` on the product only when `π = 0`
  (`{x,x'} ∘ Δ` would have to vanish); the graph of a Poisson map `φ` is coisotropic in
  `M × M̄`.
- `pr₁ : (M × N, π_M + π_N) → (M, π_M)` is Poisson; `pr₁ : (M × N, π_M + π_N) → (M, 2π_M)` is not.

**G4.2a, the legacy Hamiltonian adapter.** Using only HamiltonianSystems Layer 1's
`IsHamiltonianVectorField` on Tau Ceti's pinned `SmoothTwoForm` and DifferentialGeometry 0.4's
`legacySmoothTwoFormEquiv` with its ordered-pair evaluation law, prove that
`IsHamiltonianVectorField ω f X` is equivalent to the generic tuple equation `ω(X,·) = df`, sign
included; compare the legacy pointwise nondegeneracy predicate with separation of the generic
evaluation, and `IsSymplectic` with generic closedness plus separation through
`legacySmoothTwoFormEquiv_isClosed_iff`. This item depends on no other target of this roadmap and
is the only input HamiltonianReduction R1 takes from this roadmap for these predicates.

**Checks.**

- On HamiltonianSystems' canonical model `ω((q,α),(q',β)) = β q − α q'` the Hamiltonian field of
  `H` is `(∂H/∂α, −∂H/∂q)`, and `ω(X_H, (q',β)) = β(∂H/∂α) + (∂H/∂q)(q') = dH(q',β)`; the adapter
  equation holds with `+df`, and the opposite sign would give the field of `−H`.
- In coordinates this `ω` is `dq ∧ dp`, so `X_q = −∂_p` and `X_p = ∂_q`, consistent with
  `{q,p} = dq(X_p) = 1`.
- A degenerate legacy form (the zero form on `ℝ²`) is not symplectic on either side, and every
  vector field is Hamiltonian for `f` constant on both sides.

*Needs:* §G4.1; HamiltonianSystems Layer 1 (`IsHamiltonianVectorField`, `poissonBracket`,
`IsSymplectic`); DifferentialGeometry 0.4 (`legacySmoothTwoFormEquiv`, evaluation law,
`legacySmoothTwoFormEquiv_isClosed_iff`); CotangentLagrangian C1 (`ω = −dθ`); Tau Ceti
`SmoothTwoForm`.

### G4.3 The Hamiltonian homomorphism on a Poisson manifold

Prove that on a Poisson manifold the map `f ↦ π♯df` is a Lie algebra homomorphism from
`(C∞(M), {·,·})` to `(𝔛(M), [·,·])`, with `(π♯df)(g) = {f,g}`, whose kernel is the Casimir functions
(those with `{f,·} = 0`), and that `π♯df` is a Poisson vector field (`L_{π♯df} π = 0`). In the
symplectic case prove `π♯df = −X_f` for HamiltonianSystems' Hamiltonian field, that the kernel is
the locally constant functions, that the image lies in the symplectic vector fields (`L_Xω = 0`),
and that a vector field is symplectic iff `ι_Xω` is closed and Hamiltonian iff `ι_Xω` is exact. The
exact sequence of symplectic fields through `H⁰_dR` and `H¹_dR`, and the disconnected-base
statement, are HamiltonianReduction R1's, which consumes this identification.

- `π♯d{f,g} = [π♯df, π♯dg]`, by Jacobi.
- `ker(f ↦ π♯df) = Casimirs`; in the symplectic case these are the locally constant functions.
- `π♯df = −X_f` when `π♯ = −(ω♭)⁻¹`, and `L_{X_f}ω = d ι_{X_f}ω = ddf = 0`.

**Checks.**

- For `π = ∂_x ∧ ∂_p`: `π♯dx = ∂_p = −X_x` (since `ι_{−∂_p}(dx ∧ dp) = dx`), `π♯dp = −∂_x = −X_p`,
  and `[π♯dx, π♯dp] = [∂_p, −∂_x] = 0 = π♯d{x,p} = π♯d1`.
- For `π = u(x,y) ∂_x ∧ ∂_y` with `u = x`: `π♯df = x(f_x ∂_y − f_y ∂_x)`, which vanishes iff
  `f_x = f_y = 0` on `{x ≠ 0}`, hence by continuity everywhere; the Casimirs are the constants
  although the rank drops on the axis.
- For the zero Poisson structure every function is a Casimir and the image is `0`; for Lie–Poisson
  `𝔰𝔬(3)*` the function `|ν|²` is a Casimir (`{|ν|², ℓ_ξ}(ν) = 2 ν·(ν × ξ) = 0`).
- On `T²` with `ω = dx ∧ dy`, `X = ∂_x` has `ι_Xω = dy`, closed but not exact: symplectic, not
  Hamiltonian; the image of `f ↦ π♯df` is a proper subalgebra of the symplectic fields.

*Needs:* §G4.1, §G4.2, §G4.2a; HamiltonianSystems Layer 1; DifferentialGeometry Layer 1 (exterior
derivative) and Layer 6 (closed and exact forms).

### G4.4 The cotangent Lie algebroid and the Lichnerowicz complex

Prove that the sharp map and the Koszul bracket make `T*M` a Lie algebroid for every Poisson
structure: the anchor identity `ρ = π♯`, `[df,dg]_π = d{f,g}`, the local-coordinate formula,
naturality under Poisson diffeomorphisms. Construct the Lichnerowicz complex `d_π = [π,·]` on
multivectors with `d_π² = 0`, identify it with the cotangent-algebroid complex of §G1.3a through the
finite-dimensional comparison `Λ^k TM ≃ Alt^k(T*M)` of §G4.1 (degree one through the double dual,
then the `C∞`-multilinear section comparison). A Poisson map induces no covariant cotangent bundle
map in general; state the contravariant comorphism with its fibrewise domains.

- `[α, fβ]_π = f[α,β]_π + (π♯α f) β`, and `π♯` is a Lie algebra homomorphism for the Koszul
  bracket.
- `d_π f = −π♯df` and `d_π X = [π, X] = −L_X π`; `d_π² = 0 ⇔ [π,π] = 0`.
- The Poisson cohomology `H^•_π(M)` is the cohomology of the cotangent algebroid.

**Checks.**

- For `π = ∂_x ∧ ∂_p`: `[dx,dp]_π = d{x,p} = 0`, and the anchor sends `dx ↦ ∂_p`, `dp ↦ −∂_x`, so
  `T*ℝ²` is isomorphic to `Tℝ²` as an algebroid.
- `(d_A f)(α) = (π♯α)(f) = π(α,df)` and `α(−π♯df) = −π(df,α) = π(α,df)`: the two degree-zero
  differentials agree with the pinned signs and would differ with `π♯ = +(ω♭)⁻¹`.
- For the zero Poisson structure `T*M` has zero anchor and zero bracket (a bundle of abelian Lie
  algebras), and `H^k_π(M) = 𝔛^k(M)`.
- The inclusion of a symplectic leaf is Poisson but covectors restrict, not push forward: the
  comorphism direction is forced.

*Needs:* §G1.1, §G1.3a, §G4.1, §G4.2; DifferentialGeometry Layer 1 (Lie derivative, Cartan).

### G4.5 Symplectic leaves and the Weinstein splitting theorem

Apply §G2.4 to the cotangent algebroid. Prove that each leaf `L` carries a unique symplectic form
with `ω_L(π♯α, π♯β) = π(α,β)` (Crainic–Fernandes–Mărcuț, *Lectures on Poisson Geometry*,
Theorem 4.1, p. 63, whose formula carries the opposite sign because it attaches `X_f = π♯df`, so
`π♯ = (ω♭)⁻¹`, to a symplectic form, whereas this roadmap has `π♯df = −X_f`; the sharp map
`π♯α = π(α,·)` itself is the same, and both leaf forms equal `ω` on a symplectic manifold), that it
is closed, that the inclusion `L → M` is Poisson for the
intrinsic leaf structure, and that functions constant along leaves are exactly the Casimirs.
Construct regular local product charts and prove the Weinstein splitting theorem: at a point of
rank `2r` there are coordinates `(p_1,…,p_r,q_1,…,q_r,y_1,…,y_s)` in which
`π = Σ ∂_{p_i} ∧ ∂_{q_i} + Σ θ_{ab}(y) ∂_{y_a} ∧ ∂_{y_b}` with `θ_{ab}(0) = 0` (ibid., Theorem 3.2,
p. 44), by the inductive flow-box argument and §G4.1's coordinate Jacobi identities; for regular
Poisson structures the leaves form a symplectic foliation (ibid., Theorem 4.13, p. 69).

- `ω_L` is well defined (independent of the covectors representing the tangent vectors) because
  `ker π♯_x` annihilates `T_xL`.
- Leaves are the maximal connected immersed submanifolds with `T_xL = π♯(T*_xM)`; their dimension
  is the rank of `π` at any of their points.
- The transverse structure `θ` at a point is well defined up to Poisson diffeomorphism.

**Checks.**

- For `π = ∂_x ∧ ∂_p`: `ω_L(π♯dx, π♯dp) = π(dx,dp) = 1` with `π♯dx = ∂_p`, `π♯dp = −∂_x`, so
  `ω_L(∂_x,∂_p) = 1` and `ω_L = dx ∧ dp = ω`: the leaf form of a symplectic manifold is its
  symplectic form, which fixes the sign.
- For `π = u ∂_x ∧ ∂_y`: `π♯dx = u ∂_y`, `π♯dy = −u ∂_x`, `ω_L(u ∂_y, −u ∂_x) = u` gives
  `ω_L = (1/u) dx ∧ dy` on each component of `{u ≠ 0}`, and the zeros of `u` are point leaves.
- For `𝔰𝔬(3)*` with `{x,y} = z` and cyclic permutations, the leaves are the spheres of positive
  radius and the origin; at a point of a sphere the rank is `2` and the splitting has one
  transverse coordinate `y = |ν|` with `θ = 0`.
- The zero Poisson structure has point leaves and `r = 0` everywhere; a symplectic manifold has
  `s = 0`.

*Needs:* §G2.4, §G4.1, §G4.4; DifferentialGeometry Layer 3 (flows), Layer 4.

### G4.6 Linear Poisson structures and coadjoint orbits

**G4.6A, linear structures.** Construct the positive Lie–Poisson structure `{ℓ_ξ,ℓ_η} = ℓ_{[ξ,η]}`
on `𝔤*`, its coordinate brackets and coadjoint equivariance, independently of the orbit theorem.
Construct the linear Poisson structure on the dual `A*` of every Lie algebroid with the **minus**
convention `{ℓ_a,ℓ_b} = −ℓ_{[a,b]}`, `{ℓ_a, p*f} = −p*(ρ(a)f)`, `{p*f, p*g} = 0`; prove these
formulas, smoothness and Jacobi, and the converse recovering the algebroid from a fibrewise-linear
Poisson structure. Thus the dual of the tangent algebroid is the canonical cotangent Poisson
structure. A group over a point has the right-invariant (opposite) algebroid bracket, so its dual
in raw coordinates carries positive Lie–Poisson; the dual of the negative identification changes
this sign, and fibre negation is the Poisson isomorphism between the two presentations. Prove this
rather than identifying the brackets by notation.

- `A*` with the minus convention is Poisson, and `A ↦ A*` is a bijection between Lie algebroid
  structures on `A` and fibrewise-linear Poisson structures on `A*`.
- The coadjoint action is by Poisson diffeomorphisms of `(𝔤*, positive Lie–Poisson)`.
- Fibre negation `ν ↦ −ν` is a Poisson isomorphism from positive to negative Lie–Poisson.

**Checks.**

- For `A = TM` with frame `∂_x` and fibre coordinate `p_x = ℓ_{∂_x}`: `{p_x, x} = −p*(∂_x x) = −1`,
  so `{x,p_x} = 1`, the canonical bracket of §G4.2; the plus convention would give `{x,p_x} = −1`.
- For `G` over a point, `A = T_1G` has algebroid bracket `−[ξ,η]`, so the minus convention gives
  `{ℓ_ξ,ℓ_η} = −ℓ(−[ξ,η]) = ℓ([ξ,η])`: positive Lie–Poisson, as HamiltonianReduction R2 and
  LieHighestWeight consume it.
- Under `ν ↦ −ν`, `ℓ_ξ ↦ −ℓ_ξ` and `{−ℓ_ξ, −ℓ_η} = ℓ_{[ξ,η]} = −(−ℓ_{[ξ,η]})`, so the pulled-back
  bracket is negative Lie–Poisson.
- For the affine Lie algebra (`[e₁,e₂] = e₂`), positive Lie–Poisson on `ℝ²` is `{x,y} = y`.

**G4.6B, leaves are coadjoint orbits.** For a Lie group `G` with Lie algebra `𝔤` prove that the
cotangent algebroid of `(𝔤*, positive Lie–Poisson)` is isomorphic to the transformation algebroid
(§G1.4) of the coadjoint action, `dℓ_ξ ↦ ξ` on constant sections, with
`π♯dℓ_ξ = (η ↦ ν([ξ,η])) = −ξ_{𝔤*}` where `ξ_{𝔤*}(ν) = −ν ∘ ad_ξ` is the fundamental field of
`Coad_g ν = ν ∘ Ad_{g⁻¹}`. Apply §G2.4 to this transformation algebroid: each connected leaf of
`𝔤*` is the orbit of the identity component `G⁰` through any of its points, an immersed submanifold
equal to a connected component of `G/G_ν` with its homogeneous-space topology, not assumed to agree
with the subspace topology in `𝔤*`. No Kirillov–Kostant–Souriau form enters: the comparison of
`ω_L` with the KKS form is HamiltonianReduction R2's, which owns KKS and its pointwise sharp
identity and consumes this orbit identification.

- `[dℓ_ξ, dℓ_η]_π = d{ℓ_ξ,ℓ_η} = dℓ_{[ξ,η]}`, so the constant-section bracket is `[ξ,η]`.
- `T_ν L = π♯(T*_ν 𝔤*) = {ν ∘ ad_ξ : ξ ∈ 𝔤} = T_ν(G·ν)`.
- For disconnected `G` a coadjoint orbit is a finite or countable union of leaves.

**Checks.**

- For `𝔰𝔬(3)*` the leaves (spheres and the origin, §G4.5) are exactly the coadjoint orbits of
  `SO(3)`, and `π♯dℓ_ξ` at `ν` is `ν × ξ = −ξ_{𝔤*}(ν)`, the negative of the infinitesimal rotation
  `ξ × ν` of the coadjoint action.
- For the affine algebra, `{x,y} = y` has leaves the two open half-planes and the points of the
  axis, which are the coadjoint orbits of the connected affine group.
- For `G = ℝ ⋊ ℤ/2` (`ℤ/2` acting by negation), `𝔤 = ℝ` is abelian, the Lie–Poisson structure is
  zero and every leaf is a point, while the coadjoint orbit of `ν ≠ 0` is `{ν, −ν}`: two leaves, so
  "orbit of `G⁰`" cannot be weakened to "orbit of `G`".
- For `𝔤` abelian all leaves are points and `G⁰` acts trivially; the statement is consistent with
  `π = 0`.

*Needs:* §G1.1, §G1.4, §G2.4, §G4.1, §G4.4, §G4.5; LieGroups Layer 1 (`Ad`, `ad`); Mathlib
`GroupLieAlgebra`.

### G4.7 The rank-varying plane

Construct the acceptance cases: the zero Poisson structure (point leaves), the canonical cotangent
bracket, and the plane `π = u(x,y) ∂_x ∧ ∂_y` for any smooth `u`, with bracket
`{f,g} = u(f_x g_y − f_y g_x)`, point leaves on `{u = 0}`, symplectic leaves the connected components
of `{u ≠ 0}` with form `(1/u) dx ∧ dy`, and Casimirs the functions that are constant on each
component of `{u ≠ 0}` and smooth. For `u = x` compute the two half-plane leaves and the singleton
leaves on the axis, and verify the Casimirs and the local bracket without assuming constant rank
on the axis.

**Checks.**

- For `u = x`: `{x,y} = x`, leaves `{x > 0}`, `{x < 0}` with form `(1/x) dx ∧ dy`, and the points
  `(0,y)`; the Casimirs are the constants.
- For `u = x² + y² − 1`: three leaves of dimension two (disc, exterior) and a circle of point
  leaves; the Casimirs are the functions constant on the disc and on the exterior, hence constant.
- For `u = 1` the plane is symplectic with one leaf; for `u = 0` every point is a leaf and every
  function a Casimir.

*Needs:* §G4.1, §G4.3, §G4.5.

### Examples

The canonical plane `∂_x ∧ ∂_p` as the sign witness for `π♯`, `[π,f]`, `ω_L` and the algebroid
dual; the non-Poisson bivector on `ℝ³`; `𝔰𝔬(3)*` and the affine dual as Lie–Poisson examples; the
rank-varying plane; the two-leaf coadjoint orbit of a disconnected group.

### Dependencies

Layers 1 and 2; DifferentialGeometry 0.1, 0.2, 0.4 and Layers 1, 3, 4, 6; SmoothBundlesConnections
B2; HamiltonianSystems Layer 1; CotangentLagrangian C1; LieGroups Layer 1.

## Layer 5: Integration and the monodromy obstruction (G5)

### G5.1 `A`-paths and `A`-homotopies

Define an `A`-path as a `C¹` bundle path `a(t)` over a `C²` base path `γ(t)` on `[0,1]` with
`ρ(a(t)) = γ'(t)`. Use smooth paths vanishing near the endpoints as concatenation representatives
and prove that smoothing and reparametrisation preserve the path class and give the same quotient as
`C¹` paths. For a variation `a_ε` with fixed base endpoints, each `a_ε` `C¹` in `t` and the family
`C²` in `ε` for the local `C¹` path norms (defined by finite subdivision and bundle charts,
independently of the charts), choose a linear connection `∇` on `A` and define the transverse
component `b` by `∂_t b − ∂_ε a = T_∇(a,b)`, `b(ε,0) = 0`, with
`T_∇(a,b) = ∇_{ρ(a)} b − ∇_{ρ(b)} a − [a,b]` (Crainic–Fernandes 2003, Proposition 1.3, equation (1),
p. 585). Prove `ρ(b) = ∂_ε γ`, uniqueness and independence of `∇`. The variation is an
`A`-homotopy when `b(ε,1) = 0`. Prove equivalence with the algebroid-morphism equation on the
square through its boundary and corner charts (extending §G1.2's equation to the square's tangent
bundle), reversal, the equivalence relation, smooth concatenation associativity and the endpoint
laws. The square is a parameter domain and does not satisfy the boundaryless-base convention.

- The solution `b` exists, is unique, is `C¹` in `t`, and `ρ(b) = ∂_ε γ`.
- `A`-homotopy is an equivalence relation compatible with concatenation and reversal.
- Two `∇`'s give the same `b`.

**Checks.**

- For `A = TM` with `∇` torsion-free, `a = ∂_t γ` and the equation gives `b = ∂_ε γ`: `A`-paths are
  derivatives of `C²` paths and `A`-homotopy is homotopy of paths relative to the endpoints.
- For `A = 𝔤` over a point, `A`-paths are `C¹` curves in `𝔤`, and two of them are `A`-homotopic iff
  the solutions of `g' = dR_g(a)`, `g(0) = 1`, in the simply connected group end at the same point;
  the constant path `0` is homotopic to no nonzero constant path `ξ` unless `exp(ξ) = 1` and the
  loop is null-homotopic.
- For `A = 0` the only `A`-paths are the constant paths at points and every homotopy is constant.
- Changing `∇` by a tensor `S` changes `T_∇` by `S(ρ(a),b) − S(ρ(b),a)` and the equation by the
  same amount on both sides, so `b` is unchanged.

*Needs:* §G1.1, §G1.2; Mathlib `ContMDiffVectorBundle`; Tau Ceti integral curves and flows.

### G5.2 The path Banach manifold, the `A`-homotopy foliation and the Weinstein groupoid

Construct the Banach manifold of `C¹` bundle paths before imposing the anchor equation. Build a
smooth local addition `Σ` on the total space of `A` from DifferentialGeometry 12.1's metric and
Completed/HopfRinow Layer 1's exponential map with variable fibre radii: the first component of
`(x,v) ↦ (x, Σ(x,v))` forces collisions to share `x`; choose pointwise inverse neighbourhoods and a
smooth positive radius minorant to get a diffeomorphism from a neighbourhood of the zero section
onto a neighbourhood of the diagonal. For each centre path `a` choose a `C¹` trivialisation of
`a*TA` and identify `C¹(a*TA)` with `C¹([0,1], ℝ^{dim M + rank A})`; prove that changes of
trivialisation are bounded isomorphisms and that chart changes are smooth in the fixed `C¹` norms,
with finite subdivision across local-addition neighbourhoods. Construct a local addition on `M`
likewise, identify the anchor equation along nearby base paths with the fixed Banach space
`C⁰(γ_a*TM)`, prove the identification smooth, and prove the linearised anchor-ODE map split
surjective by initial-value existence and uniqueness with a bounded variation-of-constants right
inverse and an explicit complement of its closed kernel. Prove the Banach split-regular-level
theorem for `C^k` maps, `1 ≤ k ≤ ∞` (inverse function theorem on a complement of the kernel, level
as a `C^k` graph over the kernel) and apply it: admissible paths form a smooth split Banach
submanifold `P(A)`. The finite-dimensional theorem of SmoothBundlesConnections B1.0 and Tau Ceti's
Fredholm `levelSetChartedSpace` do not give this conclusion.

Construct the Weinstein groupoid `Σ(A) = P(A)/∼` as a topological groupoid of `A`-homotopy classes
with its quotient topology, isotropy and source-fibre connectivity (Crainic–Fernandes 2003,
Theorem 2.1, p. 589); the transversal construction at this stage is topological.

Construct the `A`-homotopy foliation of `P(A)` without changing the `C¹` path model. For a fixed
admissible `a` over `γ` use the Banach space of `C²` sections `b` of `γ*A` with `b(0) = b(1) = 0` and
its finite-chart `C²` norm, represent the variation by `(u,φ) = (∂_t b − T_∇(a,b), ρ(b))`, and make
the regularity explicit: the variation operator is bounded from this space to the `C¹` tangent
model of `P(A)`, and its image satisfies the linearised anchor equation. First let `b(1)` be free
with `b(0) = 0`: the operator identifies that space by a bounded inverse (the linearised initial-value
ODE) with the closed subspace of admissible tangent vectors whose base-start variation vanishes, of
codimension `dim M`; on it the endpoint map `b ↦ b(1) ∈ A_{γ(1)}` is continuous, onto and split
(use `C²` sections supported near `t = 1`), so the distribution, its kernel, is closed and split of
codimension `dim M + rank A`. Prove smooth dependence on `a` and independence of `∇` as tangent
vectors. For every §G5.1 homotopy family, differentiate in the local `C¹` norms: the forcing
`∂_ε a` is `C¹` in `t`, the equation `∇_t b = ∂_ε a + T_∇(a,b)` has `C¹` coefficients and forcing,
its solution is `C²` in `t` with a bounded solution operator, and conversely the `C²` endpoint-zero
variations are exactly the tangent vectors represented by that equation. Prove that local
boundary-value charts integrate the distribution and that its leaves are exactly the `A`-homotopy
classes including all `C¹` representatives; prove independence of `∇`, construct holonomy maps,
and prove that saturation is open in the quotient topology. Construct the algebroid-geodesic
exponential from a neighbourhood of the zero section into `P(A)` and prove that its image gives
finite-dimensional transversals near zero paths. These are the four assertions of Crainic–Fernandes
2003, Proposition 4.7, p. 604, whose codimension count is the endpoint argument.

- `P(A)` is a smooth split Banach submanifold with tangent space at `a` the linearised anchor
  solutions, and the `C²` base reconstruction is bounded.
- The `A`-homotopy foliation has codimension `dim M + rank A`, its leaves are the `A`-homotopy
  classes, and `Σ(A)` is its leaf space.
- The quotient map `P(A) → Σ(A)` is open.

**Checks.**

- For `A = TM` on `M = ℝⁿ`: `P(A)` is the space of `C²` paths, two paths are homotopic iff they
  share endpoints, so the leaf space is `ℝⁿ × ℝⁿ` and the codimension is `2n = dim M + rank A`.
- For `A = 𝔤` over a point: the leaves are the fibres of `P(𝔤) → G̃` (endpoint of the solution of
  `g' = dR_g a`), of codimension `dim 𝔤 = 0 + rank A`, and `Σ(𝔤) = G̃`.
- For `A = 0`: `P(A) = M` (constant paths), the leaves are points, the codimension is `dim M`, and
  `Σ(0)` is the unit groupoid.
- The finite-dimensional regular-value theorem does not apply: the kernel of the linearised anchor
  map for `A = TM` over `ℝⁿ` is the space of `C¹` vector fields along `γ` with `v(0) = 0`, which is
  infinite-dimensional.

*Needs:* §G5.1, §G1.1; DifferentialGeometry 12.1; Completed/HopfRinow Layer 1; Mathlib Banach
inverse function theorem and `ContinuousLinearMap.HasRightInverse`.

### G5.3 Monodromy groups

Define `N_x(A) ⊆ Z(ker ρ_x)` as the central isotropy vectors whose constant isotropy `A`-paths are
`A`-homotopic to the zero path. Relate it to the simply connected isotropy group, the leaf-sphere
boundary map `π₂(L,x) → Z(𝔤_x)` and the variation with the basepoint. Define local uniform
discreteness: near each basepoint there is a neighbourhood of the zero section in the isotropy
vectors containing no nonzero monodromy vector; the definition uses the ambient bundle topology and
makes sense when the isotropy rank changes.

- `N_x(A)` is a subgroup of `Z(𝔤_x)`, the image of the boundary map, and `N_x ≅ N_y` along an orbit.
- The isotropy group of `Σ(A)` at `x` is an extension of `π₁(L,x)` by `G̃(𝔤_x)/N_x`.
- Local uniform discreteness implies each `N_x` is discrete; the converse fails (§G5.5).

**Checks.**

- For `A = TM`: `ker ρ = 0`, so `N_x = 0`; for `A = 𝔤` over a point: `N = {v ∈ Z(𝔤) : exp v = 1}`
  in the simply connected `G̃`, and this is `0` because the identity component `Z(G̃)⁰` of the
  centre is a closed connected normal subgroup of the simply connected `G̃`, hence simply connected
  (`π₂(G̃/Z(G̃)⁰) = 0` for the Lie group `G̃/Z(G̃)⁰` and `π₁(G̃) = 0` in the long exact sequence),
  hence a vector group on which `exp : Z(𝔤) → Z(G̃)⁰` is bijective (for `𝔤 = ℝ`, `G̃ = ℝ`).
  Injectivity of `exp` near `0` alone would only show `N` discrete, as on the circle `ℝ/2πℤ`,
  which is not simply connected.
- For the central extension `TM ⊕ ℝ` of a closed two-form `η` (§G5.6), `N_x` is the group of
  spherical periods `{∫_{S²} σ*η}` (Crainic–Fernandes 2003, Example 3.7, p. 597); for `η = 0` it is
  `0`, and for `M = S²` with `∫η = 1` it is `ℤ`.
- For the transformation algebroid of `SO(3)` on `ℝ³`, `𝔤_x` at `x ≠ 0` is one-dimensional,
  spanned by the unit-speed rotation generator `ξ` about `x/|x|`, with `L = S²`, `π₂ = ℤ`, and
  `N_x = 4πℤ·ξ`: the source-simply-connected integration is `SU(2) ⋉ ℝ³`, whose isotropy at `x` is
  the circle `U(1) ⊂ SU(2)` in which `exp(tξ)` has period `4π`, equivalently the boundary map
  `π₂(S²) = ℤ → π₁(SO(2)) = ℤ` of `SO(2) → SO(3) → S²` is multiplication by `2` (cokernel
  `π₁(SO(3)) = ℤ/2`). It is discrete and uniformly so on `ℝ³ ∖ {0}`, and `G̃(𝔤_x)/N_x = ℝ/4πℤ` is
  the `U(1)` isotropy of `SU(2) ⋉ ℝ³`, as the extension bullet predicts; a computation in `SO(3)`
  instead of `SU(2)` would give `2πℤ·ξ`, half the group. At `0` the isotropy is `𝔰𝔬(3)` with
  trivial centre and `N_0 = 0`.

*Needs:* §G5.1, §G5.2, §G1.5, §G2.4; LieGroups Layer 5 (simply connected covers); AlgebraicTopology
Stage 1.

### G5.4 Lie II, uniqueness and integration of representations

For an integration `Γ` of `A`, integrate `A`-paths by the source-fibre ODE and prove that the
canonical morphism `Σ(A(Γ)) → Γ` is an isomorphism when `Γ` is source-simply-connected, giving
`Σ(A(Γ))` its smooth source-fibre-cover structure from `Γ`'s charts before the general criterion.
Prove Lie II: a morphism `A → B` of integrable algebroids integrates uniquely to a morphism `Γ → H`
of integrations when `Γ` is source-simply-connected (Crainic–Fernandes 2003, Theorem (Lie II),
p. 579; Crainic–Fernandes, *Lectures*, Theorem 2.19, p. 27), with uniqueness of the
source-simply-connected integration. Integrate representations by parallel transport along
`A`-paths and prove `A`-homotopy independence exactly from flatness. Identify `Σ(TM)` with the
fundamental groupoid (§G3.3), the integration of a Lie algebra with its simply connected group
through §G2.2's negative identification, and the action and gauge cases with their
source-simply-connected covers.

- Two source-simply-connected integrations of `A` are isomorphic over `A`.
- Every source-connected integration `Γ` of `A` is a quotient of `Σ(A)` by a discrete bundle of
  groups in its source fibres (Crainic–Fernandes, *Lectures*, Theorem 1.30, p. 18, which assumes
  `Γ` source-connected); for a general integration the image of `Σ(A) → Γ` is the source-connected
  component of §G0.4.
- Representations of `A` on `E` correspond to representations of `Σ(A)` on `E`.

**Checks.**

- `Σ(TM) = Π₁(M)`, the fundamental Lie groupoid; for simply connected `M` it is the pair
  groupoid, and the pair groupoid of `S¹` is a non-source-simply-connected integration of `TS¹`.
- For `𝔤` over a point Lie II is LieGroups Layer 4's statement that homomorphisms of Lie algebras
  integrate uniquely from the simply connected group; the identification `A(G) → GroupLieAlgebra`
  is `−id`, so a Lie algebra homomorphism `φ` corresponds to the algebroid morphism `−φ ∘ (−id)`,
  which is `φ` again.
- A flat connection on `E → M` integrates to the holonomy representation of `Π₁(M)`; the
  non-flat connection `θ = x dy` of §G2.5 has transport around the unit square equal to `e^{±1}`
  times the identity (the sign fixed by the orientation), not `1`, so flatness is needed.
- The bundle of groups `M × ℤ/2` with `s = t = pr₁` is an integration of the zero algebroid over
  `M` that is not source-connected; `Σ(0)` is the unit groupoid (§G5.2) and `Σ(0) → M × ℤ/2` is
  the unit section, whose image is the source-connected component `M × {1}` and not all of `Γ`, so
  the source-connectedness hypothesis of the quotient statement cannot be dropped.

*Needs:* §G5.1, §G5.2, §G5.3, §G2.1, §G2.5, §G3.3; LieGroups Layer 4.

### G5.5 The Crainic–Fernandes integrability criterion

Prove that a finite-rank real Lie algebroid admits a Lie groupoid integration iff its monodromy
groups are locally uniformly discrete; equivalently, with a continuous bundle metric and
`r(x) = inf {‖v‖ : 0 ≠ v ∈ N_x(A)}` (`∞` for the empty infimum), `r(x) > 0` and
`liminf_{y→x} r(y) > 0` for every `x` (Crainic–Fernandes 2003, Theorem 4.1, p. 600; Crainic–Fernandes,
*Lectures*, Theorems 4.1 and 4.2, pp. 55–56). The integration is `Σ(A)`, source-simply-connected,
unique by §G5.4, with Hausdorff source fibres and a possibly non-Hausdorff arrow manifold. Prove
necessity, sufficiency and the smooth quotient-chart theorem through the monodromy-to-slice
bridge: under local uniform discreteness choose through each admissible path a transversal of
dimension `dim M + rank A` meeting each `A`-homotopy class (each leaf, not merely each plaque) in at
most one point (Crainic–Fernandes 2003, Lemma 4.9, p. 606), prove the holonomy transitions smooth
and build the quotient atlas, with Hausdorff source fibres and a second-countable total space.
Prove second countability of `P(A)` (countable atlas, finite subdivisions, separable `C¹` models)
and that the open quotient map carries a countable basis to one on `Σ(A)`. Integrability does not
imply a Hausdorff arrow manifold.

- Necessity: an integration forces `N_x` discrete with `r` bounded below near each point.
- Sufficiency: the transversals of Lemma 4.9 give a smooth atlas on `Σ(A)` for which `s`, `t`,
  multiplication and inversion are smooth and `A(Σ(A)) = A`.
- `Σ(A)` is second-countable and its source fibres are Hausdorff.

**Checks.**

- For a Lie algebra `𝔤` over a point `N = 0`, `r = ∞`, and the criterion gives Lie's third theorem
  with `Σ(𝔤) = G̃`.
- For the central extension of `η` with dense period group (§G5.6) `r(x) = 0`, so the first
  obstruction fails and `A_η` is not integrable (Crainic–Fernandes 2003, Example 4.2, p. 600).
- For a regular foliation `TF ⊆ TM` the isotropy is zero, `N = 0`, and `Σ(TF)` is the monodromy
  groupoid `Π₁(F)`; for the horizontal planes in `ℝ³ ∖ {0}` it is a non-Hausdorff Lie groupoid
  (Crainic–Fernandes, *Lectures*, Example 1.18 and Exercise 8, p. 14), so the criterion is
  satisfied while the arrow manifold is not Hausdorff.
- The second condition is not implied by the first: an algebroid with `N_x = 0` at a point and
  `N_y = ε_y ℤ · v`, `ε_y → 0`, along a sequence `y → x` has each `N` discrete but `r(y) → 0`
  (the transverse obstruction in Crainic–Fernandes 2003, Section 4.1).

*Needs:* §G5.2, §G5.3, §G5.4; DifferentialGeometry 12.1 (bundle metric); Mathlib second
countability of separable Banach spaces.

### G5.6 The nonintegrable central extension on `S² × S²`

For a closed two-form `η` on `M` construct the central extension `TM ⊕ ℝ` with anchor the
projection and bracket `[(X,f),(Y,g)] = ([X,Y], X(g) − Y(f) + η(X,Y))`, and compute its monodromy as
spherical periods. For an `A`-homotopy square with coordinates `(ε,t)`, a torsion-free connection
on `TM` and the trivial one on the `ℝ` factor, §G5.1's equation and the bracket give
`∂_t b⁰ − ∂_ε a⁰ = η(∂_ε γ, ∂_t γ)` for the central components; with `b(ε,0) = b(ε,1) = 0`,
integrating over the square gives terminal minus initial central coordinate `= −∫_{I²} γ*η` in the
orientation `dε ∧ dt`. A `C¹` square constant on its boundary is turned into a based `C¹` sphere by
a collar reparametrisation, approximated by a smooth one through relative `C¹` Whitney approximation
(on the leaf, a Hausdorff second-countable manifold, using §G5.2's local addition and its jointly
smooth inverse for the short-geodesic homotopy), and the `C¹` Stokes formula for that homotopy shows
the smooth representative has the same `η`-period. Prove that based smooth sphere periods form a
group (pinched spheres for sums, reversal for negatives). For the example, identify the oriented
Riemann sphere with `S²`, prove that the based power maps `z ↦ z^m` have degree `m` for every
`m ≥ 0` (the constant map for `m = 0`), transport basepoints by orientation-preserving
diffeomorphisms, and with `η = pr₁*a + λ pr₂*a` for an area form `a` of integral `1` on `S²` and irrational `λ`, apply DifferentialGeometry 10.3–10.4's
degree formula to each projection once to show that the periods are `{m + λn}` = `ℤ + λℤ`, dense,
so `r = 0` and `A_η` is not integrable (Crainic–Fernandes 2003, Examples 3.7 and 4.2, pp. 597 and
600). This separates the criterion from Lie's third theorem.

- `A_η` is a Lie algebroid (Jacobi uses `dη = 0`), transitive, with isotropy `ℝ` and
  `N_x = ±{∫_{S²} σ*η : σ based at x}`.
- The period map `π₂(M,x) → ℝ` is a homomorphism.
- `A_η` is integrable iff the period group of `η` is discrete (for connected `M`).

**Checks.**

- Jacobi for the displayed bracket: the cyclic sum of the central components is
  `X(η(Y,Z)) − η([X,Y],Z) + cyclic = dη(X,Y,Z)`, so the bracket is a Lie bracket iff `dη = 0`.
- The square identity: `∫∫ ∂_t b⁰ = ∫ (b⁰(ε,1) − b⁰(ε,0)) dε = 0` and `∫∫ ∂_ε a⁰ = ∫ (a⁰(1,t) −
  a⁰(0,t)) dt`, so `∫ a⁰(1,·) − ∫ a⁰(0,·) = −∫∫ η(∂_ε γ, ∂_t γ) dε dt = −∫ γ*η`; a sign error in
  the bracket would give `+∫ γ*η` and the same group, so the period group, not its sign, is the
  invariant.
- For `σ = (f,g) : S² → S² × S²` with degrees `m, n ≥ 0`, `∫ σ*η = m ∫a + λ n ∫a = m + λ n`; the
  pair `(m,n) = (1,0)` gives `1` and `(0,1)` gives `λ`, and the negatives come from reversal.
- `z ↦ z⁻¹` is a holomorphic automorphism of the sphere, orientation-preserving, of degree `+1`,
  so `z ↦ z^m` has degree `|m|` for every integer `m`; a statement giving it degree `m` for `m < 0`
  is false, which is why negative periods are produced by reversal and not by negative exponents.
- For `λ ∈ ℚ`, `λ = p/q`, the period group is `(1/q)ℤ`, discrete, and `A_η` is integrable; for
  `M = S²` alone with `∫a = 1` the group is `ℤ` and `A_η` integrates to a prequantum circle bundle
  groupoid.

*Needs:* §G5.1, §G5.2, §G5.3, §G5.5, §G2.4; DifferentialGeometry 8.3, 10.3–10.4, Layer 5
(Stokes); Mathlib degree and orientation facts for the sphere.

### Examples

`Σ(TM) = Π₁(M)`; `Σ(𝔤) = G̃`; the non-Hausdorff monodromy groupoid of the horizontal planes in
`ℝ³ ∖ {0}`; the irrational central extension on `S² × S²`.

### Dependencies

Layers 1–3; DifferentialGeometry 8.3, 10.3–10.4, 12.1 and Layer 5; Completed/HopfRinow Layer 1;
LieGroups Layers 4 and 5; AlgebraicTopology Stage 1; Mathlib's Banach inverse function theorem.

## Layer 6: Symplectic and cotangent groupoids (G6)

### G6.1 Symplectic groupoids

Define a symplectic groupoid as a Lie groupoid with a closed nondegenerate `Ω` on its arrow manifold
satisfying `m*Ω = pr₁*Ω + pr₂*Ω` on composable pairs. Prove that the graph of multiplication is
Lagrangian in `Γ × Γ × Γ̄` (Crainic–Fernandes 2004, Proposition 4), that units are Lagrangian,
inversion anti-symplectic, source and target fibres symplectically orthogonal, and
`dim Γ = 2 dim M`. Prove that the base carries a unique Poisson structure for which the target is
Poisson and the source anti-Poisson (Bursztyn–Crainic–Weinstein–Zhu, Remark 2.3, p. 8, for the
right-invariant convention), constructed from the target submersion. Identify the cotangent
algebroid of the base with `A(Γ)` through `σ_Ω(a) = −Ω(a, du(·))` under §G1.1/§G4.4's sharp
convention, and verify anchor and bracket.

- `t` is a Poisson submersion and `s` an anti-Poisson one; `t_*Ω⁻¹` is the base bivector.
- `ker ds` and `ker dt` are `Ω`-orthogonal complements of each other.
- `σ_Ω : A(Γ) → T*M` is an algebroid isomorphism with `π♯ ∘ σ_Ω = ρ`.

**Checks.**

- The pair groupoid of `(M,ω)` with `Ω = pr₁*ω − pr₂*ω`: at `((z,y),(y,x))`,
  `m*Ω = ω_z − ω_x = (ω_z − ω_y) + (ω_y − ω_x)`, so it is multiplicative; `pr₁` is Poisson onto
  `(M, −(ω♭)⁻¹)` and `pr₂` anti-Poisson; `dim = 2 dim M`.
- At a unit `(x,x)` of the pair groupoid, `A = T_xM × 0`, `du(X) = (X,X)`, and
  `σ_Ω((v,0))(X) = −Ω((v,0),(X,X)) = −ω(v,X)`, so `σ_Ω = −ω♭` and `π♯ ∘ σ_Ω = −(ω♭)⁻¹ ∘ (−ω♭) = id`
  as the anchor requires; with `σ(a) = +Ω(a,du(·))` the composite would be `−id`.
- `T*M ⇉ M` with fibrewise addition and `Ω = ω_can` is a symplectic groupoid for the zero Poisson
  structure: in coordinates `m((x,p₁),(x,p₂)) = (x,p₁ + p₂)` and
  `dx ∧ d(p₁ + p₂) = dx ∧ dp₁ + dx ∧ dp₂`.
- The unit groupoid of `M` with any two-form fails `dim Γ = 2 dim M` unless `dim M = 0`.

*Needs:* §G0.2, §G2.1, §G4.2, §G4.4; DifferentialGeometry Layer 1; CotangentLagrangian C1.

### G6.2 Tangent and cotangent groupoids

Construct the tangent groupoid `TΓ ⇉ TM` and the cotangent groupoid `T*Γ ⇉ A(Γ)*` of any Lie
groupoid (Coste–Dazord–Weinstein, *Groupoïdes symplectiques*, Chapter II, §4, pp. 27–33;
Crainic–Fernandes–Mărcuț, *Lectures on Poisson Geometry*, Section 13.5, p. 344, and Proposition
13.76, p. 345, in the left-invariant convention). Extend CotangentLagrangian C1's local bundle
charts, tautological one-form and canonical nondegeneracy to the locally Hausdorff arrow manifold, keeping its cotangent carrier; these are
local and need no Hausdorff total space, and restriction and transition compatibility are proved,
not assumed. Pin the translated-covector formulas `t̃(φ_g)(a) = φ_g(dR_g a)` for `a ∈ A_{t(g)}` and
`s̃(φ_g)(b) = φ_g(dL_g(b − du(ρ b)))` for `b ∈ A_{s(g)}` (the vector `b − du(ρ b)` is target-vertical
at the unit), units the conormals of the unit manifold identified by restriction to `A`, inverse
`φ_g⁻¹ = −φ_g ∘ d(inv)_{g⁻¹}`, and multiplication the unique covector with
`λ(dm(v,w)) = α(v) + β(w)` on composable tangent vectors; prove existence, independence,
smoothness, associativity and the source and target signs. The tautological form is
multiplicative, `−dθ` is symplectic, and the base Poisson structure is §G4.6A's linear structure
on `A*`.

- `T*Γ` is a symplectic groupoid over `(A*, linear Poisson)`.
- `TΓ` is a Lie groupoid with `A(TΓ) ≅ TA(Γ)` (the canonical flip, §G6.4).
- Units of `T*Γ` are the covectors vanishing on `TM ⊆ TΓ|_M`.

**Checks.**

- For the pair groupoid of `M`: `t̃(α,β) = α`, `s̃(α,β) = −β` (since `b − du(ρb) = (0,−b)` and
  `dL_g` fixes it), composability is `α₂ = −β₁`, and the product of `(α₁,β₁)` and `(α₂,β₂)` is
  `(α₁,β₂)`; the base is `T*M` with the canonical structure, as §G4.6A gives for the dual of `TM`.
- For the unit groupoid `M`: `A = 0`, `A* = M`, and `T*M ⇉ M` is the additive groupoid of §G6.1.
- For a group over a point the construction is §G6.3's `T*G ⇉ 𝔤*`.
- The sign in `s̃` is forced: with `s̃(α,β) = +β` the pair-groupoid product would not satisfy
  `λ(dm(v,w)) = α(v) + β(w)` (the `v_y` terms `β₁(v_y) + α₂(v_y)` would not cancel).

*Needs:* §G0.2, §G2.1, §G4.6A, §G6.1; CotangentLagrangian C1.

### G6.3 The cotangent groupoid of a Lie group

For a Lie group `G` identify `T*G ≅ G × 𝔤*` by left translation: `s(α_g)(ξ) = α_g(dL_g ξ)`,
`t(α_g)(ξ) = α_g(dR_g ξ)`, so `s(g,ν) = ν`, `t(g,ν) = Coad_g ν = ν ∘ Ad_{g⁻¹}`, and multiplication
`(g, Coad_h ν)(h,ν) = (gh,ν)` (Crainic–Fernandes–Mărcuț, *Lectures on Poisson Geometry*,
Examples 14.7 and 14.22, pp. 363–364 and 375, which take `Ω = −ω_can` because their bivector of a
symplectic form is the negative of this roadmap's, so both choices give the same positive
Lie–Poisson base). Verify the target and source Poisson signs and the positive linear
Lie–Poisson bracket by evaluation on linear functions. The identification uses raw vectors
`A(G) = T_1G` and their duals, not §G2.2's negative isomorphism, whose dual would negate source
and target and reverse the base sign; prove the distinction by the raw right-invariant bracket.

- `T*G ⇉ 𝔤*` is a symplectic groupoid with `Ω = ω_can` over positive Lie–Poisson `𝔤*`.
- Its isotropy at `ν` is the coadjoint stabiliser `G_ν` and its orbits are the coadjoint orbits.
- It is source-simply-connected iff `G` is connected and simply connected.

**Checks.**

- Composability of `(g,ν')` and `(h,ν)` requires `ν' = Coad_h ν`, and the product `(gh,ν)` has
  target `Coad_{gh} ν = Coad_g Coad_h ν`, the target of `(g,ν')`.
- For `G = ℝ`: `T*ℝ = ℝ × ℝ ⇉ ℝ` with `s = t = pr₂`, the bundle of additive groups over `ℝ` with
  zero Poisson structure on the base.
- For the affine group the base bracket is `{x,y} = y`, and `t*ℓ_{e₂}(g,ν) = ν(Ad_{g⁻¹}e₂)` with
  `Ad_{(a,b)⁻¹} e₂ = a⁻¹ e₂`; the target is Poisson and the source anti-Poisson for this structure.
- `T*SO(3) ⇉ 𝔰𝔬(3)*` has isotropy `S¹` at `ν ≠ 0` and `SO(3)` at `0`; its source fibres are
  `SO(3)`, not simply connected, so `T*SU(2)` is the source-simply-connected integration.

*Needs:* §G2.2, §G4.6A, §G6.2; LieGroups Layers 0–1; CotangentLagrangian C1.

### G6.4 The symplectic integration theorem

Prove that a Poisson manifold has a source-simply-connected symplectic integration iff its cotangent
algebroid is integrable, iff its cotangent monodromy groups are locally uniformly discrete
(Crainic–Fernandes 2004, Theorems 2 and 5), and that the integration is unique. The multiplicative
form is constructed, not inferred from a bundle isomorphism. For a Lie algebroid `A` and an
algebroid isomorphism `σ : A → T*M` state and prove the closed IM two-form identities
`⟨σ(a), ρ(b)⟩ = −⟨σ(b), ρ(a)⟩` and `σ([a,b]) = L_{ρ(a)} σ(b) − ι_{ρ(b)} dσ(a)`
(Bursztyn–Crainic–Weinstein–Zhu, Theorem 2.5, p. 8, whose second identity has the form
`L_a σ(b) − L_b σ(a) + d⟨σ(a),ρ(b)⟩`, equal to this one by Cartan's formula).

Construct the tangent prolongation and the canonical-flip identifications `A(TΓ) ≃ TA(Γ)` and
`A(TΓ ×_Γ TΓ) ≃ TA(Γ) ×_A TA(Γ)` with the cotangent formulas of §G6.2. For `k = 2, 3` let
`T^[k]Γ` be the groupoid of `k` tangent vectors at one arrow with componentwise structure; its
source fibre over a `k`-tuple in `T^[k]M` projects to `s⁻¹(x)` with fibre the product of the affine
solution spaces `ds_g(v_i) = v_i^x`, an affine bundle with contractible fibres by local
source-submersion charts, so these source fibres are connected and simply connected when those of
`Γ` are; no global splitting, partition of unity or Hausdorff arrow space is used. Define the scalar
algebroid one-cocycle `λ_σ(ȧ,ḃ) = (−dθ_can)_{σ(a)}(Tσ(ȧ), Tσ(ḃ))` on `TA(Γ) ×_A TA(Γ)`, prove it
well defined under the flip, fibrewise linear, and a cocycle exactly by the two IM identities;
integrate it by Lie II (§G5.4) on the source-simply-connected `T^[2]Γ` to an additive cocycle,
prove the integrated function bilinear and alternating, and prove `dΩ = 0` on `T^[3]Γ` from the
differentiated IM identity. The cocycle equation is `m*Ω = pr₁*Ω + pr₂*Ω`. Recover the morphism
`Ξ_Ω : TΓ → T*Γ`, `Ξ_Ω(v_g)(w_g) = −Ω_g(v_g,w_g)`, prove its groupoid-morphism identities from
multiplicativity and §G6.2, verify at units `σ_Ω(a)(X) = −Ω(a,du(X)) = Ξ_Ω(a)(du(X)) = σ(a)(X)`,
nondegeneracy from `σ` being an isomorphism, and uniqueness from Lie II.

Fix the sign against §G4.4: with `θ_can = p_i dx^i`, `ω_can = −dθ_can = dx^i ∧ dp_i`, the map `Ξ_Ω`
has cotangent coordinates `p_j = −v^i Ω_{ij}` and `Ξ_Ω*ω_can = dx^j ∧ d(−v^i Ω_{ij})`; on the pair
groupoid with `Ω = pr₁*ω − pr₂*ω` this gives `σ_Ω = −ω♭` and `π♯ ∘ σ_Ω = id` (§G6.1's Check).

Include the pair symplectic groupoid of a symplectic manifold, its fundamental-groupoid cover, the
additive cotangent bundle for the zero Poisson structure, and `T*G` for linear Lie–Poisson, which is
source-simply-connected exactly for connected simply connected `G`.

- For integrable `T*M` the Weinstein groupoid `Σ(M)` carries a unique multiplicative symplectic
  form with `σ_Ω = id`.
- Every source-simply-connected symplectic integration of `(M,π)` is isomorphic to `(Σ(M), Ω)`.
- `(M,π)` is integrable by some symplectic groupoid iff `Σ(M)` is smooth.

**Checks.**

- For `σ = id : T*M → T*M`: `⟨σa, ρb⟩ = ⟨a, π♯b⟩ = π(b,a) = −π(a,b) = −⟨b, π♯a⟩`, the first IM
  identity; the second reduces to `[a,b]_π = L_{π♯a} b − ι_{π♯b} da`, the Koszul bracket of §G4.4
  rewritten with Cartan's formula.
- Zero Poisson structure: `Σ(M) = T*M` additive, `Ω = ω_can`, `σ_Ω = id`; the two IM identities
  reduce to `0 = 0` and `0 = 0` since `ρ = 0` and `[a,b] = 0`.
- Symplectic `(M,ω)` with simply connected `M`: `Σ(M)` is the pair groupoid with `pr₁*ω − pr₂*ω`,
  and the Check of §G6.1 gives `σ_Ω = −ω♭`, whose composite with `π♯ = −(ω♭)⁻¹` is the identity;
  for `M = T²` the pair groupoid is an integration but not the source-simply-connected one, which is
  `(ℝ² × ℝ²)/ℤ²`.
- `𝔤*` with positive Lie–Poisson: `Σ(𝔤*) = T*G̃ ⇉ 𝔤*` with `Ω = ω_can` (§G6.3), and
  `T*SO(3) ⇉ 𝔰𝔬(3)*` is a symplectic integration that is not source-simply-connected.

*Needs:* §G4.4, §G4.6A, §G5.4, §G5.5, §G6.1, §G6.2, §G6.3; CotangentLagrangian C1;
DifferentialGeometry Layer 1.

### Examples

The pair groupoid of a symplectic manifold with its sign witness; the additive cotangent groupoid;
`T*G ⇉ 𝔤*` for `ℝ`, the affine group and `SO(3)`; the integration of `T²`.

### Dependencies

Layers 2, 4 and 5; CotangentLagrangian C1; DifferentialGeometry Layer 1; LieGroups Layers 0–1.

## Layer 7: Symplectic actions and the reduction comparison (G7)

### G7.1 Symplectic groupoid actions

Assume `P` Hausdorff and second-countable. Define a symplectic groupoid action of `(Γ,Ω)` on `(P,ω)`
with moment map `μ : P → M` as a §G3.1 action along `μ` whose graph
`{(g,p,g·p) : (g,p) in the action domain}` is Lagrangian in `(Γ,Ω) × (P,ω) × (P,−ω)`. Pin the
pullback identity on the action domain `act*ω = pr_Γ*Ω + pr_P*ω`, with projections from the same
fibre product (Crainic–Fernandes–Mărcuț, *Lectures on Poisson Geometry*, Definition 14.38 and
Example 14.39, p. 388); prove the graph is Lagrangian, the dimension and tangent conditions, and
that `μ` is Poisson for the base structure of §G6.1 (ibid., Proposition 14.42, p. 389). Define the
infinitesimal action: for `a ∈ A_x` and `p ∈ μ⁻¹(x)`, `a_P(p)` is the derivative at `ε = 0` of
`g_ε·p` along any path `g_ε` in the source fibre `s⁻¹(x)` with `g_0 = 1_x` and `g_0' = a`, the
fundamental field of the action, and prove `ι_{a_P} ω = −μ*(σ_Ω(a))`; the converse, that an action
of a source-connected symplectic groupoid satisfying this identity is symplectic, is ibid.,
Proposition 14.45, p. 392. Both results there carry `+` because their algebroid is `ker dt` with
the left-invariant bracket and their infinitesimal action differentiates `g ↦ g⁻¹·p`; the
identification with `ker ds` through `dι` negates `σ_Ω`. Smoothness, graph and isotropy formulas
hold on the fibre product, not on `Γ × P`.

- The pullback identity is equivalent to the graph being Lagrangian.
- `μ` is a Poisson map and `μ` is `Γ`-equivariant in the sense `μ(g·p) = t(g)`.
- The infinitesimal action `a ↦ a_P` satisfies `ι_{a_P} ω = −μ*(σ_Ω(a))`, and for source-connected
  `Γ` this identity characterises the symplectic actions among the smooth ones.

**Checks.**

- `Γ` acting on itself by left multiplication with `μ = t`: `act = m`, and the identity is
  multiplicativity `m*Ω = pr₁*Ω + pr₂*Ω`; `t` is Poisson by §G6.1.
- The pair groupoid of `(M,ω)` acting on `(M,ω)` by `(y,x)·x = y` with `μ = id`:
  `act*ω = ω_y = (ω_y − ω_x) + ω_x = pr_Γ*Ω + pr_P*ω`; `μ = id` is Poisson for `π = −(ω♭)⁻¹`.
- With `Ω` replaced by `−Ω` the identity fails for the left action of `Γ` on itself, and `t` is
  anti-Poisson: the sign of `Ω` is tied to the choice of target as the Poisson map.
- The infinitesimal-action sign on the pair groupoid of `(M,ω)` acting on `M` with `μ = id`: for
  `a = (v,0) ∈ A_x = T_xM × 0`, the path `(x + εv, x)` in `s⁻¹(x)` gives `a_P = v`, so
  `ι_{a_P}ω = ω♭v`, while `σ_Ω(a) = −ω♭v` by §G6.1's Check; hence `ι_{a_P}ω = −μ*(σ_Ω(a))`, and
  the identity with `+` fails for every `v ≠ 0`. For `Γ` acting on itself with `μ = t`, `a_P = a^R`
  and at a unit `Ω(a,w) = Ω(a, du(dt w))` since `ker ds` and `ker dt` are `Ω`-orthogonal, which is
  again `−t*(σ_Ω(a))(w)`.

*Needs:* §G3.1, §G6.1, §G6.2; DifferentialGeometry Layer 1; CotangentLagrangian C1.

### G7.2 The isotropy quotient of a level and the kernel of the restricted form

For a regular value `ξ` of `μ`, the level `Z = μ⁻¹(ξ)` is the SmoothBundlesConnections B1.0 regular
fibre, and the isotropy group `Γ_ξ` acts on it; assume this action free and proper and consume
§G3.1 at `p = μ` for the orbit quotient `q : Z → Z/Γ_ξ`, its Hausdorff smooth structure and
submersion property (§G7.1 supplies the hypotheses on `P`, §G3.1 those on `Γ_ξ`). Using §G2.2's
isotropy identification and §G6.1's `σ_Ω`, prove that the kernel of `i*ω` at `z ∈ Z` is exactly the
tangent space of the `Γ_ξ`-orbit, hence `ker(dq_z)`, and that `i*ω` is closed and basic (its value
depends only on the projected tangent vectors). Construct the reduced form: on the quotient
submersion `q : Z → Z/Γ_ξ` of §G3.1 define `ω_red(dq(u), dq(v)) = (i*ω)(u,v)`, well defined because
`i*ω` is basic and `ker dq = ker(i*ω)`; prove it smooth through the local sections of `q` on the
quotient charts that §G3.1 takes from SmoothBundlesConnections B1.1 and B1.4; prove `dω_red = 0`
from `q*(dω_red) = d(i*ω) = 0` and the injectivity of `q*` on forms for a surjective submersion,
and nondegeneracy from `ker(i*ω) = ker dq`; the same injectivity gives uniqueness of a two-form
with `q*ω_red = i*ω` (Crainic–Fernandes–Mărcuț, *Lectures on Poisson Geometry*, Section 14.4,
p. 391, item (i)). SmoothBundlesConnections B1.4 (through §G3.1) supplies the quotient manifold;
the comparison of `ω_red` with the ordinary reduced form of a Hamiltonian action is
HamiltonianReduction R4's. Include the dimension formula `dim Z/Γ_ξ = dim P − dim M − dim Γ_ξ` and
the naturality of the kernel, basicness and reduced-form statements under equivariant symplectic
maps; invariant-function descent is §G3.1's.

- `T_zZ = ker dμ_z = (𝔞_P(z))^ω` where `𝔞_P(z)` is the tangent space of the `Γ`-orbit through `z`.
- `ker(i*ω)_z = T_z(Γ_ξ·z) = ker(dq_z)`.
- `i*ω` is closed and `Γ_ξ`-basic, and `ω_red` is the unique two-form on `Z/Γ_ξ` with
  `q*ω_red = i*ω`; it is symplectic.

**Checks.**

- For `Γ = T*G` acting through a Hamiltonian `G`-action (§G7.3), `Γ_ξ = G_ξ` and the kernel of
  `i*ω` at `z` is `𝔤_ξ·z`, the classical statement `ker(i*ω) = 𝔤_c·x` of ordinary reduction.
- For the pair groupoid of `(M,ω)` acting on `M` with `μ = id`: `Z = {ξ}`, `Γ_ξ` trivial, the
  quotient is a point of dimension `dim M − dim M − 0 = 0`.
- For `Γ` acting on itself with `μ = t`: `Z = t⁻¹(ξ)`, `Γ_ξ` acts by left multiplication, and
  `ker(Ω|_Z) = T(t⁻¹(ξ)) ∩ T(t⁻¹(ξ))^Ω = ker dt ∩ ker ds`, the tangent spaces of the isotropy
  cosets, by the symplectic orthogonality of §G6.1; the dimension is
  `dim Γ − dim M − dim Γ_ξ = dim M − dim Γ_ξ`, the dimension of the orbit through `ξ`.
- For the pair groupoid of `(M,ω)` acting on itself by left multiplication with `μ = t = pr₁`:
  `Z = {ξ} × M`, `Γ_ξ` is trivial, `q = s = pr₂` identifies `Z/Γ_ξ` with `M`, and
  `i*Ω = i*(pr₁*ω − pr₂*ω) = −ω`, so `ω_red = −ω`, the negative of the leaf form of §G4.5; a
  definition with `q*ω_red = −i*ω` would give `+ω`.

*Needs:* §G2.2, §G3.1, §G6.1, §G7.1; SmoothBundlesConnections B1.0 (regular fibre), B1.4 (through
§G3.1); DifferentialGeometry Layer 1.

### G7.3 Hamiltonian actions as cotangent-groupoid actions

Prove that an equivariant Hamiltonian action of `G` on `(P,ω)` with moment map `μ` induces a
symplectic action of `T*G ⇉ 𝔤*` (§G6.3) by `(g,ν)·p = g·p` when `ν = μ(p)`: the graph identity
follows from the moment equation and equivariance, and conversely the Hamiltonian action is
recovered (Crainic–Fernandes–Mărcuț, *Lectures on Poisson Geometry*, Example 14.40, p. 388, through
Proposition 14.45, p. 392, for connected `G`; the disconnected case by the graph identity on each
component). The moment equation is HamiltonianSystems Layer 3's `ι_{Z_P}ω = d⟨μ,Z⟩`, so that
`X_{⟨μ,Z⟩} = Z_P`; the opposite moment-map sign would replace `μ` by `−μ` throughout. At `ξ`
identify the isotropy with `G_ξ`, the action domain and induced action on `μ⁻¹(ξ)`, and match the orbit relations and quotient projections with those of ordinary reduction.
HamiltonianReduction R4 consumes these identifications together with §G7.2 for the final comparison.

- The `T*G`-action is symplectic in the sense of §G7.1 iff the `G`-action is Hamiltonian with
  equivariant moment map `μ`.
- `(T*G)_ξ = G_ξ` as Lie groups, and `μ⁻¹(ξ)/G_ξ` is §G7.2's quotient.
- Equivariant symplectic maps intertwine the two descriptions.

**Checks.**

- `G` acting on `T*G` by the cotangent lift of left translation with `μ(g,ν) = Coad_g ν`: the
  induced `T*G`-action on `T*G` is left multiplication in the groupoid, and §G7.1's first Check
  applies. The moment map is computed from the pinned sign: the lift preserves `θ`, so
  `ι_{ξ_P}(−dθ) = d(θ(ξ_P))` and `⟨μ(α_g),ξ⟩ = α_g(ξ_G(g)) = α_g(dR_g ξ) = ν(Ad_{g⁻¹}ξ)` for
  `α_g = ν ∘ dL_{g⁻¹}`, which is `(Coad_g ν)(ξ)`; with `ι_{Z_P}ω = −d⟨μ,Z⟩` one would get
  `−Coad_g ν`, which is not the target of §G6.3.
- For abelian `G`, `T*G = G × 𝔤*` is a bundle of groups, every `ν` is coadjoint-fixed, `G_ξ = G`,
  and the induced action on `μ⁻¹(ξ)` is the restriction of the `G`-action: reduction at every level
  is ordinary reduction by the whole group.
- For `SO(3)` acting on `T*ℝ³` with angular momentum `μ`, `G_ξ = S¹` at `ξ ≠ 0`, matching
  `T*SO(3)`'s isotropy in §G6.3.

*Needs:* §G6.3, §G7.1, §G7.2; HamiltonianSystems Layer 3 (`IsMomentMap`, `InfinitesimalAction`);
LieGroups Layers 0–1.

### G7.4 The restricted action groupoid of a coadjoint orbit

For a coadjoint orbit `O = G/G_ξ` with its homogeneous-space manifold structure and orbit immersion
`ι_O : O → 𝔤*`, construct the action groupoid `G ⋉ O` by its explicit action charts and identify it
with the restriction (§G3.4, invariant case) of `T*G ⇉ 𝔤*` to `O` in these intrinsic coordinates:
`(T*G)|_O = G × O` with `s(g,o) = o`, `t(g,o) = g·o`. This requires neither `O` embedded in `𝔤*` nor
the restricted groupoid symplectic. For a Hamiltonian `G`-space `P` with equivariant `μ`, identify
the action of `G ⋉ O` on `μ⁻¹(O) → O` induced by §G7.3 and its isotropy actions with those of
§G7.2 at each point of `O`. Allow disconnected `O`: connected symplectic leaves of `𝔤*` are orbits of
`G⁰` (§G4.6B) and are not identified with a disconnected full orbit. The orbit model `W_O`, its
diffeomorphism `Φ` with `G ×_{G_ξ} μ⁻¹(ξ)`, the quotient `e : W_O/G ≅ Q` and the comparison of the
reduced forms are HamiltonianReduction R3 and R4's, which consume this groupoid description.

- `G ⋉ O ≅ (T*G)|_O` as Lie groupoids, with isotropy `G_o` at `o` and a single orbit per component
  of `O`.
- The induced action on `μ⁻¹(O)` has isotropy quotients `μ⁻¹(o)/G_o`, all diffeomorphic through
  the arrow-induced bijections of §G3.1.
- `μ⁻¹(O)/G` is in bijection with `μ⁻¹(ξ)/G_ξ`.

**Checks.**

- `O = {0}`: `G ⋉ {0} = G` over a point, and `μ⁻¹(0)/G` is ordinary reduction at zero.
- `G = SO(3)`, `O = S²_r`: `G ⋉ O` has isotropy `S¹` and dimension `3 + 2 = 5`, which equals
  `dim (T*G)|_O = dim G + dim O`.
- `G = ℝ ⋊ ℤ/2`, `O = {ν,−ν}` (§G4.6B's Check): `G ⋉ O` has two objects, isotropy `ℝ` at each, and
  the leaf through `ν` is the `G⁰`-orbit `{ν}`, one of its two components.

*Needs:* §G0.3, §G3.1, §G3.4, §G4.6B, §G6.3, §G7.3; LieGroups Layer 2 (closed subgroups),
SmoothBundlesConnections B1.4 (homogeneous spaces).

### Examples

`Γ` acting on itself; the pair groupoid acting on its base; `T*G` acting through a Hamiltonian
action, with the abelian and `SO(3)` cases; `G ⋉ O` for the zero orbit, a sphere and a two-point
orbit.

### Dependencies

Layers 3 and 6; SmoothBundlesConnections B1.0 and B1.4; HamiltonianSystems Layer 3; LieGroups
Layers 0–2; DifferentialGeometry Layer 1; CotangentLagrangian C1.

## Downstream consumers

[HamiltonianReduction](../SymplecticGeometry/HamiltonianReduction/README.md) consumes §G4.2a's
adapter and §G4.3's identification `π♯df = −X_f` (R1), §G4.6A's positive Lie–Poisson structure and
sharp convention (R2), the fibre-product and regular-fibre interfaces (R3; these are
SmoothBundlesConnections B1.0's), and §G7.2's reduced form `ω_red` with its kernel and basicness
data, §G7.3's identifications and §G7.4's groupoid description (R4) for the comparison of groupoid
and ordinary reduction; it owns the exact sequence through `H¹_dR`, the KKS form, the generic
descent interface for closed basic two-forms, `W_O`, `Φ` and the final comparison.
[ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) K8 and
[CharacteristicClasses](../CharacteristicClasses/README.md) C5a consume §G1.3a's standalone Lie
algebra complex and its low-degree comparison; ComplexKahlerGeometry K1 may consume §G1.6's
involutivity equivalence for its eigenbundles. [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md)
D5 consumes §G0.0's topological groupoid layer. [Orbifolds](../Orbifolds/README.md) consumes §G0's
groupoids and §G3.5's bibundles and Morita composition. [LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md)
consumes §G4.6A's positive Lie–Poisson structure. [ContactGeometry](../SymplecticGeometry/ContactGeometry/README.md)
leaves generic Poisson and symplectic-groupoid theory to this roadmap. IntegrableSystems and
ReductiveGroups cite regular fibres and fibre products, which SmoothBundlesConnections B1.0 supplies;
RiemannianGeometry cites the countability of `π₁`, which SmoothBundlesConnections B5.2 supplies.
QuantumFoundations consumes §G1.3a's coefficient comparison.

## Worked examples

- The unit groupoid over the real line, with its atlas on the same topology as §G0.0's.
- The pair groupoid and the fundamental Lie groupoid as integrations of `TM`; the fundamental Lie
  groupoid of `S¹` as `S¹ × ℝ`.
- The source-simply-connected monodromy groupoid of the foliation of `ℝ³ ∖ {0}` by horizontal
  planes, a non-Hausdorff Lie groupoid with Hausdorff source fibres (Crainic–Fernandes, *Lectures on
  integrability of Lie brackets*, Example 1.18 and Exercise 8, p. 14).
- The affine group as the sign witness for `rightInvariant_bracket` and for the action-algebroid
  anchor `ξ ↦ −ξ_M`; the gauge groupoid and Atiyah sequence of the trivial and the Hopf bundle.
- The pair-action trivialisation; a flat circle bundle with nontrivial holonomy as a
  representation of the fundamental Lie groupoid; the noninvariant restriction of the translation
  action.
- The rank-varying plane `u ∂_x ∧ ∂_y`; `𝔰𝔬(3)*` with its sphere leaves identified with coadjoint
  orbits; the two-leaf coadjoint orbit of `ℝ ⋊ ℤ/2`.
- The irrational-period central extension on `S² × S²`.
- The additive cotangent groupoid of the zero Poisson structure and the pair symplectic groupoid;
  `T*G ⇉ 𝔤*` with its multiplication, source, target and linear bracket for `ℝ`, the affine group
  and `SO(3)`.
- The level and isotropy data of `T*G` acting through a Hamiltonian action, matched with ordinary
  reduction at a regular value.

Local formulas, restriction and naturality, identity and composition and evaluation lemmas
accompany every new carrier; a kernel, quotient or existence predicate alone does not discharge its
construction.

## References

- C. Blohmann, [*Stacky Lie groups*](https://doi.org/10.1093/imrn/rnn082), International
  Mathematics Research Notices 2008, Section 2.2, Propositions 2.11 and 2.12 (preprint pp. 7–8):
  composition of right-principal bibundles and the weak 2-category of Lie groupoids, in the
  Hausdorff convention; §G3.5 proves the locally Hausdorff version.
- H. Bursztyn, M. Crainic, A. Weinstein and C. Zhu, [*Integration of twisted Dirac
  brackets*](https://arxiv.org/abs/math/0303180), Duke Mathematical Journal 123 (2004), Remark 2.3
  and Theorem 2.5 (arXiv p. 8): the infinitesimally multiplicative two-form identities and the
  target-Poisson convention, for §G6.1 and §G6.4.
- A. Coste, P. Dazord and A. Weinstein, [*Groupoïdes
  symplectiques*](http://www.numdam.org/item/PDML_1987___2A_1_0/), Publications du Département de
  Mathématiques de Lyon, 1987, fascicule 2A, 1–62: Chapter II, §4 (pp. 27–33), the cotangent
  groupoid of a Lie groupoid, for §G6.2.
- R. L. Fernandes, [*Lie algebroids, holonomy and characteristic
  classes*](https://arxiv.org/abs/math/0007132), Advances in Mathematics 170 (2002), 119–179
  (arXiv math/0007132, whose numbering is cited): Theorem 1.1 (Local Splitting, arXiv p. 11), for
  the orbit charts of §G2.4.
- M. Crainic and R. L. Fernandes, [*Integrability of Lie
  brackets*](https://annals.math.princeton.edu/wp-content/uploads/annals-v157-n2-p06.pdf), Annals of
  Mathematics 157 (2003), 575–620: Lie II (p. 579), Proposition 1.3 (p. 585), Theorem 2.1 (p. 589),
  Example 3.7 (p. 597), Theorem 4.1 and Example 4.2 (p. 600), Proposition 4.7 (p. 604), Lemma 4.9
  (p. 606), for G5.
- M. Crainic and R. L. Fernandes, [*Integrability of Poisson
  brackets*](https://www.math.tecnico.ulisboa.pt/~rfern/Meus-papers/HTML/PoissonFinal.pdf), Journal
  of Differential Geometry 66 (2004), 71–137: Theorem 2, Proposition 4 and Theorem 5, for §G6.1 and
  §G6.4.
- M. Crainic and R. L. Fernandes, [*Lectures on integrability of Lie
  brackets*](https://arxiv.org/abs/math/0611259), Geometry & Topology Monographs 17 (2011), 1–107
  (arXiv math/0611259): Example 1.18 and Exercise 8 (p. 14), Theorem 1.30 (p. 18), Theorem 2.19
  (p. 27), Theorems 4.1 and 4.2 (pp. 55–56), for §G0.2, §G5.4 and §G5.5.
- M. Crainic, R. L. Fernandes and I. Mărcuț, [*Lectures on Poisson
  Geometry*](https://webspace.science.uu.nl/~crain101/gsm217.pdf), AMS Graduate Studies in
  Mathematics 217 (2021): Theorem 2.8 (p. 26, Schouten bracket), Theorem 3.2 (p. 44, Weinstein
  splitting), Theorem 4.1 and Lemma 4.2 (p. 63, symplectic leaves), Theorem 4.13 (p. 69, regular
  Poisson structures and symplectic foliations), for G4; Section 13.5 (p. 344, the cotangent
  groupoid) and Proposition 13.76 (p. 345), Examples 14.7 and 14.22 (pp. 363–364 and 375, `T*G`),
  Definition 14.38, Examples 14.39 and 14.40 (p. 388), Proposition 14.42 (p. 389), the reduction
  statement of Section 14.4 (p. 391, item (i)) and Proposition 14.45 (p. 392), for G6 and G7. Its
  sharp map `π♯α = π(α,·)` agrees with this roadmap's, but it attaches `X_f = π♯df` to a symplectic
  form, so its bivector of a symplectic form, its leaf form and its multiplicative forms on `T*G`
  carry the opposite sign; its algebroid of a groupoid is `ker dt` with the left-invariant bracket.
- J. M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Graduate Texts in Mathematics 218, Springer
  (2013), Corollary 5.14 and Proposition 5.38: regular level sets in the Hausdorff case, the
  classical statement behind SmoothBundlesConnections B1.0.
