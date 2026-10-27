# Lie algebroids, Lie groupoids, and Poisson geometry

Build the differential geometry of Lie algebroids and their integrations, Poisson
manifolds and symplectic groupoids. The theory includes actions and representations,
orbits and isotropy, restriction, the cotangent groupoid, and the comparison of
groupoid reduction with ordinary Hamiltonian reduction. Its foundation is the
existing manifold, vector-bundle, Lie, category and differential-form APIs; its
summits are the monodromy integrability criterion and integration of the cotangent
algebroid of a Poisson manifold. Every construction below includes its basic API,
functoriality, local formulas and examples.

## Conventions and ownership

Real bases are finite-dimensional smooth boundaryless Hausdorff second-countable
manifolds. Algebroid fibers have finite rank. Lie groups are finite-dimensional real,
Hausdorff and second-countable, with smooth multiplication and inverse, as in
SmoothBundlesConnections and HamiltonianReduction. Lie groupoids are smooth.
Arrow manifolds are allowed to be non-Hausdorff: they have finite-dimensional
boundaryless smooth atlases, are locally Hausdorff, and are globally
second-countable. The Hausdorff arrow
case is a specialization, not an extra hypothesis on the integration theorem.
Statements using partitions of unity apply on the Hausdorff base or on explicitly
Hausdorff manifolds; do not install `T2Space` on an arbitrary integration. Source
fibers use their induced smooth structures and are required to be Hausdorff,
as in the Crainic–Fernandes integration theorem; this does not require a
Hausdorff total arrow space. Here source-simply-connected means
each source fiber is connected and simply connected, with its actual topology.

An arrow `g : x ⟶ y` has `s(g)=x`, `t(g)=y`. Write `gh` for first `h`, then `g`;
it is defined when `s(g)=t(h)`. Thus `gh` is Mathlib's `h ≫ g`. Reuse
[`CategoryTheory.Groupoid`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/CategoryTheory/Groupoid.lean)
for the algebraic structure, with the total arrow type carrying the topology and
smooth atlas. Smooth structure is additional data, not a second set of groupoid
axioms. Smooth functors and natural transformations use the existing categorical
operations and total-arrow maps on `CategoryTheory.Arrow M`. Install its
topology explicitly; its unit, pair and group-over-a-point comparisons
carry the corresponding manifold topology.

For a Lie groupoid, the algebroid is `A_x=ker(ds)_{1_x}`, with anchor `dt`.
The bracket is transported from source-vertical right-invariant vector fields.
For a group over a point this gives the opposite of the Lie algebra defined by
left-invariant vector fields; the isomorphism to Mathlib's
[`GroupLieAlgebra`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Geometry/Manifold/GroupLieAlgebra.lean) sends
`v` to `-v`. For a left group action, the action algebroid in standard Lie-algebra
coordinates consequently has anchor `ξ ↦ -ξ_M`, where `ξ_M` is the fundamental
field. These signs also make the anchor a homomorphism for Mathlib's vector-field
bracket. Prove these comparisons, rather than silently changing the bracket of
`GroupLieAlgebra`.

For a left action, `ξ_M(x)=d(g↦g·x)_1 ξ`, as in HamiltonianReduction R1.
For a principal right action, `V_ξ(p)=d(h↦p·h)_1 ξ(p)` for the equivariant
adjoint-section function on P, as in SmoothBundlesConnections B3. These
are different actions; the minus Atiyah inclusion uses the latter.

The Poisson sign is that of HamiltonianSystems:
`ι_{X_f}ω=df`, `{f,g}=df(X_g)`, so `X_{ {f,g} }=-[X_f,X_g]`.
A bivector has `{f,g}=π(df,dg)`. Define its sharp map by
`β(π♯α)=π(α,β)`; hence `π♯df=-X_f` in the symplectic case and
`π♯=-(ω♭)⁻¹`, where `ω♭v=ω(v,·)`. The cotangent bracket is
`[α,β]_π=L_{π♯α}β-L_{π♯β}α-d(π(α,β))` and
`[df,dg]_π=d{f,g}`. Linear Lie–Poisson has
`{ℓ_ξ,ℓ_η}(ν)=ν[ξ,η]`.

- [DifferentialGeometry](../DifferentialGeometry/README.md) owns manifold forms,
  exterior derivative, pullback, Lie derivative/Cartan identities, integration and
  de Rham cohomology. Layer 0.4 specifies the generic `SmoothForm I M ℝ 2`
  carrier and the migration equivalence `legacySmoothTwoFormEquiv` from the
  pinned `SmoothTwoForm` implementation, with its tuple-evaluation law and
  `legacySmoothTwoFormEquiv_isClosed_iff`. Consume HamiltonianSystems' Hamiltonian predicates
  and operations on the pinned `SmoothTwoForm` carrier through this named
  equivalence, whose construction belongs to DG0.4. Evaluate the generic
  form by coercing to `RoughForm I M ℝ 2` and applying it to `![v,w]`.
  Consume G4.2a's adapter law identifying HamiltonianSystems'
  `IsHamiltonianVectorField` with `ω(X,·)=df` in tuple evaluation, including
  the pinned sign. Do not add a competing degree-two coercion.
  This roadmap owns multivector bundles, Schouten bracket and algebroid
  differential, which are distinct constructions with explicit tangent-algebroid
  comparison.
- [SmoothBundlesConnections](../SmoothBundlesConnections/README.md) B1–B4 owns
  principal/associated bundles, the vector bundle `TP/G`, its exact Atiyah sequence,
  connections and curvature; B5 owns the flat/parallel-transport dictionary.
  This roadmap owns the Atiyah **algebroid bracket**, gauge-groupoid integration,
  algebroid representations, and the smooth Lie-groupoid atlas/action comparison
  with that dictionary. B5 retains its algebraic functor expression.
- [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) owns complex tangent
  bundles, `(1,0)`/`(0,1)` eigenbundles, Nijenhuis tensor and Newlander–Nirenberg.
  Its K1 supplies complex tangent/eigenbundles and the Nijenhuis/Newlander–Nirenberg
  comparison. SmoothBundlesConnections supplies complexification of real vector bundles.
  This roadmap owns complex algebroids and the subalgebroid/involutivity
  comparison; it does not prove Newlander–Nirenberg a second time.
- [HamiltonianSystems](../HamiltonianSystems/README.md)
  owns these shared declarations: Layer 1 Hamiltonian fields and the symplectic
  Poisson bracket/laws, Layer 2 Hamiltonian flows, and Layer 3 infinitesimal
  actions, moment maps and their cocycle. Consume those named contracts for
  G4.2–G4.3 and G7.1/G7.3 on its current `SmoothTwoForm` carrier, using
  DifferentialGeometry 0.4's migration equivalence and the G4.2a adapter law.
  This roadmap extends the bracket to degenerate
  Poisson structures and proves the symplectic identification; it does not
  duplicate the shared Hamiltonian API.
- [SymplecticGeometry/CotangentLagrangian](../SymplecticGeometry/CotangentLagrangian/README.md)
  owns smooth cotangent bundles, tautological one-forms and canonical `ω=-dθ`.
  This roadmap owns the **groupoid** structure on `T*G` and `T*Γ`, and the groupoid
  action/reduction comparison. [HamiltonianReduction](../SymplecticGeometry/HamiltonianReduction/README.md)
  owns group moment maps, KKS orbits, and ordinary Marsden–Weinstein reduction;
  it consumes the groupoid action/graph/isotropy comparison here and owns the final
  quotient and reduced-form comparison (R3–R4).
- [LieGroups](../RepresentationTheory/LieGroups/README.md) Layers 0–5 owns Lie III and the simply-connected
  integration equivalence (Layer 4), plus the universal-cover construction
  (Layer 5), the group Lie algebra, exponential and
  adjoint action. AlgebraicTopology supplies fundamental groupoids and path-homotopy
  infrastructure; [Completed/UniversalCovers](../../Completed/UniversalCovers/README.md)
  supplies covering classification. DifferentialGeometry supplies smooth covering
  comparisons. Its
  involutive-distribution/Frobenius theory is the constant-rank leaf substrate;
  the variable-rank orbit theorem is built here.

## Pinned substrate and interface direction

At Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, use
`IsManifold`,
[`ContMDiffSection`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Geometry/Manifold/VectorBundle/ContMDiffSection.lean),
`ContMDiffVectorBundle`, `mfderiv`, `mvfderiv`,
`VectorField.mlieBracket`, [`Manifold.IsSubmersion`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Geometry/Manifold/Submersion.lean),
[`LieRinehartRing` and `LieRinehartAlgebra`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/LieRinehartAlgebra/Defs.lean),
`CategoryTheory.Groupoid`, `FundamentalGroupoid` and
`Derivation`. The Lie-Rinehart classes already express the section-space Leibniz
and anchor-action laws; install them for algebroid sections instead of creating
parallel algebraic laws.

At Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, the implemented
manifold two-form is `TauCeti.SmoothTwoForm`; the generic
`SmoothForm I M ℝ 2`, its `mextDeriv` closedness and its pointwise
nondegeneracy predicate are DifferentialGeometry 0.4 migration targets. Consume
the named `legacySmoothTwoFormEquiv`, evaluation law and closedness comparison
there when connecting pinned HamiltonianSystems declarations to the generic carrier. Do not
identify the linear-algebra `SymplecticForm` structure with the manifold
predicate. Also use maximal integral curves and their smooth flow, distribution theory, and
`TauCeti.Geometry.Lie.Tangent.LieEquiv`'s
`leftInvariantDerivationLieEquivGroupLieAlgebra` (with its interior-point hypothesis).
Use the existing adjoint action and covering/fundamental-groupoid code.

[Mathlib #41039](https://github.com/leanprover-community/mathlib4/pull/41039)
proposes topological categories/groupoids with topology on objects and the total
arrow type, retaining the categorical hom-types. Follow that shape for the smooth
layer; when its API is available, consume it. The composable-arrow topology and
all smooth prerequisites needed below are Tau Ceti targets here, regardless of
that proposal's merge status.

## G0. Smooth fiber products and groupoid foundations

0. Build the topological layer independently of any smooth atlas: topology
   on objects and total arrows, inherited subspace topology on composable
   pairs, and continuous source, target, unit, inverse and multiplication.
   Use Mathlib #41039's categorical total-arrow shape, with restriction,
   products, morphisms and the unit/pair/action examples. Prove the smooth
   groupoid atlas lives on this same `TopologicalSpace` instance. This item supplies
   OperatorAlgebraDynamics D5 without a manifold prerequisite. For a connected
   second-countable locally simply connected manifold, separately prove that
   `π₁(M,m₀)` is countable: choose a countable cover by simply connected
   coordinate neighborhoods, use the countably many path components of each
   pairwise intersection, and subdivide loops to obtain a countable generating
   family. This topological lemma does not require a metric, connection or
   holonomy theory.
1. Consume Tau Ceti's `exists_isManifold_sectionZero_of_contMDiff`,
   `sectionZeroChartedSpace`, `isManifold_sectionZero`,
   `hasMFDerivAt_coe_sectionZero`, `isImmersionOfComplement_coe_sectionZero`,
   `sectionZeroChartedSpace_chartAt`, `sectionZeroChartedSpace_atlas`,
   `sectionLinearization_trivial`, and
   `levelSetChartedSpace`/`isManifold_levelSet`. These already construct regular
   section-zero manifolds, smooth immersions and their tangent kernels with
   inherited subtype topology, including non-Hausdorff ambient manifolds.
   Consume DG10.1's `IsRegularPoint` and `IsRegularValue`.

   Own the map-level regular fiber `{x : X // f x=c}` with its subspace
   topology. In a target chart φ at c, apply the existing zero-section
   theorem to the trivial-bundle section `x ↦ φ(f x)−φ(c)` on
   `f⁻¹(φ.source)`. The entire fiber lies in that open set; transfer this
   one structure onto the fixed fiber,
   with model `Fin (dim X−dim M) → ℝ` and its self model `𝓘`.
   Supply the smooth atlas transfer from general finite-dimensional boundaryless
   `ModelWithCorners` to a self-modelled type synonym needed by the native
   theorem, restricting extended charts to `interior (range I)`. Prove
   the derivative comparison for the identity transport. Do not install
   a second global `ChartedSpace` on the original ambient carrier.
   Define the manifold-target fiber atlas, depending on the target chart φ
   and kept irreducible, by transport of
   `sectionZeroChartedSpace` along the homeomorphism from its local zero subtype
   to the actual map fiber. Fixing φ=`TauCeti.extChartPartialDiffeomorph` at c
   gives the selected manifold-target atlas. Prove the identity is a
   diffeomorphism between choices of target chart. The model-space target
   specializes these constructions to a chart-parametrized atlas and its
   selected instance at the extended chart; retain its explicit comparison
   with the manifold-target atlas.
   Export its chartAt/atlas descriptions, smooth inclusion and tangent
   kernel theorems. Own immersion invariance under open inclusions and
   these model-change diffeomorphisms, using the native normal form.
   Prove `Manifold.IsSmoothEmbedding` for `Subtype.val`, combining the native
   immersion with `IsEmbedding.subtypeVal`, and identify
   `(mfderiv … Subtype.val z).range=(mfderiv … f z.1).ker`. The headline
   form is `exists_regularFiber_manifold`: for a smooth map of boundaryless
   manifolds of dimensions n and m that is surjective on derivatives at every
   point of the fiber over c, the fiber with its subspace topology has a
   smooth atlas of dimension n−m for which the inclusion is a smooth
   embedding with tangent image the derivative kernel; X is not assumed
   Hausdorff and the fiber may be empty (Lee, *Introduction to Smooth
   Manifolds*, 2nd ed., Corollary 5.14 and Proposition 5.38, in the
   Hausdorff case). Include empty fibers, dimension, atlas independence, open restriction,
   coordinate change and the smooth map-into-the-fiber universal property.

   Build the transverse fiber product of smooth maps `f:X→M`, `g:Y→M`
   on the subtype `{(x,y) : X×Y // f x=g y}` with its subspace topology.
   State transversality as `range(df_x)+range(dg_y)=T_mM` at every
   equal-image pair. Prove the local smooth universal property before
   gluing the native regular-level charts for `φ∘f−φ∘g`,
   using model `Fin (dim X+dim Y−dim M) → ℝ`. Prove smooth embedding of
   the inclusion, `ContMDiff` projections, tangent image `ker(df−dg)`,
   dimension, chart independence and the smooth universal property.

   Own the finite-dimensional boundaryless comparison between Mathlib's
   `Manifold.IsSubmersionAt` normal form and `IsDiffSubmersionAt`, defined
   by the differential predicate
   `(mfderiv … f x).HasRightInverse`, following native
   `IsDiffImmersionAt` with left replaced by right inverse:
   derive `ContinuousLinearMap.HasRightInverse` from the normal form;
   conversely construct the normal form from a split derivative using
   `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`. The smoothness hypothesis
   and interior-point condition are explicit; use `BoundarylessManifold`
   for the global corollary. Prove restriction, diffeomorphism transport,
   composition via `HasRightInverse.comp` and the global
   `IsSubmersion` equivalence `submersion_iff_split_mfderiv`: a smooth map of
   boundaryless finite-dimensional manifolds satisfies Mathlib's
   `Manifold.IsSubmersion` exactly when `IsDiffSubmersionAt` holds at every
   point. For finite model spaces apply native
   `HasRightInverse.of_surjective_of_finiteDimensional` to compare with
   surjectivity and DG10.1's `IsRegularPoint`. Prove either fiber-product projection is a submersion when
   the other map is a submersion. These comparisons use complete finite-dimensional
   real model spaces and do not assert the converse for arbitrary Banach spaces.
   Follow Mathlib's normal-form design and the
   [normal-form and differential design discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/Composition%20of%20immersions%20is%20an%20immersion%3A%20infinite-dimensio).

   Construct the smooth constant-rank kernel distribution of every such
   submersion, as native `TauCeti.IsContMDiffDistribution` from DG Layer 4,
   with its normal-form frames and rank dim X−dim M
   (`submersionKernel_smooth`). Equip the actual
   kernel fibers with a `ContMDiffVectorBundle` structure modelled on
   `Fin (dim X−dim M) → ℝ` by applying the generic subbundle API below,
   and prove smooth pullback, including along
   the unit map for `u*ker ds`. This construction needs no T2 assumption.
   Develop the generic finite-rank smooth-subbundle API on a family of
   submodules locally admitting smooth frames and coefficient maps: induced
   fiber and total-space topology, smooth inclusion, local trivializations,
   pullback and restriction. Form an internal sum only on a locus where its
   fiber rank is locally constant, or construct it as the image subbundle of
   the addition map on a locus where that map has constant rank. Prove the
   kernel/image constructions for constant-rank smooth bundle maps. Compare
   tangent subbundles with the native distribution predicate. Real
   subalgebroids use these subbundles before imposing bracket and anchor
   conditions. Complex subbundle constructions are constructed in G1.6,
   after their complexification and eigenbundle suppliers.

   Own the finite-dimensional boundaryless constant-rank theorem without
   T2: if `rank(mfderiv f)=r` on an open neighborhood of `x`, construct
   domain/target local smooth coordinates near `x` in which f is `(u,v)↦(u,0)`.
   Prove the immersed local image, tangent kernel, restriction and
   coordinate-change APIs and the local smooth map-into-the-level-fiber
   universal property. For the entire level fiber `f⁻¹(c)` to be an embedded
   manifold of dimension `dim X−r` with its inherited topology, separately
   assume rank `r` on an open set containing that whole fiber and apply the
   local charts at every point. Use the inverse function theorem on a chosen
   invertible r×r derivative minor, then show the remaining coordinate
   derivatives vanish by rank constancy. This precedes isotropy groups.

   Prove naturality of `VectorField.mlieBracket` for smooth f-related
   fields: if df(X)=X′∘f and df(Y)=Y′∘f, then
   df([X,Y])=[X′,Y′]∘f. The theorem is local on finite-dimensional
   boundaryless manifolds and requires no T2 assumption. In coordinates
   consume Tau Ceti's root `mvfderiv_mlieBracket` applied to a target-chart
   composition, then rewrite the relatedness identities and chart comparison.
   Its symmetric second-derivative cancellation needs no T2 assumption. Supply open restriction, the closure of
   submersion-vertical fields under brackets and immersion-restriction
   corollaries; the restricted field is constructed and proved smooth by
   the immersion normal form. This supplies G1.2, G2.1 and G4.2; native pullback of brackets
   under diffeomorphisms alone is insufficient for submersions.
2. Equip the total arrows of a `Groupoid M` with a smooth atlas. Require source
   and target to be smooth submersions, units and inversion smooth, and
   multiplication smooth on the fiber product of source and target. Each source
   fiber with its induced smooth structure is Hausdorff, as required by the
   global groupoid convention; the total arrow manifold may remain non-Hausdorff.
   Prove
   iterated composable-arrow manifolds, smoothness of all face/degeneracy maps,
   inverse cancellation, source/target laws and translations on source/target
   fibers. Units are smooth embeddings and inversion is a diffeomorphism.
   Derive the tangent/unit identities, including split surjectivity of `ds,dt`.
3. Build unit, pair, Lie-group-over-a-point, action and gauge groupoids.
   The unit groupoid has arrows `M` and `s=t=id`; the pair groupoid has arrows
   `(y,x)` and source `x`, target `y`. For a smooth left action, arrows `(g,x)`
   have source `x`, target `g·x` and multiplication `(g,h·x)(h,x)=(gh,x)`.
   Reuse `Discrete M` for the unit groupoid, `SingleObj G` for a group
   over a point (f≫g=g*f), and `Codiscrete` for the pair groupoid and `CategoryTheory.ActionCategory`
   for the algebraic action groupoid. The gauge groupoid is `(P×P)/G` for a principal right `G` bundle, with arrows
   `[p,q] : π(q)→π(p)`; consume SBC B1.4's free-proper quotient atlas and
   B1.1's division, and prove multiplication and representative independence.
4. Smooth functors, their identity/composition, and smooth natural transformations;
   opposite/product groupoids and their functoriality. Construct local
   bisections first: a local bisection is a smooth σ:U→Γ, U open in M,
   with s∘σ=id_U and t∘σ an open smooth embedding onto an open subset
   of M. Prove identity, product, inverse, restriction and the induced
   local diffeomorphism API. Prove that two equal-dimensional subspaces of a
   finite-dimensional real vector space have a common complement: split
   their intersection, pair bases of the two residual subspaces by diagonal
   vectors, and add a complement of their sum. Apply this to ker ds and
   ker dt, whose equal dimensions follow from split surjectivity, and use
   the inverse function theorem on that complement. Use bisection/translation derivatives
   to prove t restricted to each source fiber has constant rank. Apply
   G0.1's constant-rank level theorem to its fiber over x to construct the
   isotropy Lie group at x, with inherited topology and smooth group laws.
   Then build orbit equivalence, orbit maps and conjugation of isotropy.
   Pin Γ_x to the flat endpoint subtype `{g // s(g)=x ∧ t(g)=x}`.
   Construct its canonical equivalence with the nested level subtype inside
   the source fiber, and transport that level's topology and smooth atlas
   along the equivalence. Its multiplication is gh=h≫g, transported from
   `CategoryTheory.Aut x`;
   transport the group structure along the endpoint bijection to Aut x,
   and prove multiplication and inversion smooth on the level-set manifold.
   Mathlib's `Groupoid.vertexGroup` uses x*y=x≫y; construct
   `(x ⟶ x)≃*(Aut x)ᵐᵒᵖ` with the `vertexGroup` instance through `Groupoid.isoEquivHom`, and restrict
   it for `Subgroupoid.vertexSubgroup` when x is in the subgroupoid's objects. This pin fixes G2.2's negative
   comparison with the left-invariant Lie algebra.
   Source-connectedness/source-simple-connectedness and invariance under inversion
   are explicit predicates on fibers. Construct the open source-connected
   component subgroupoid by taking, in each source fiber, the component of its
   unit; prove closure under all structure maps and that its algebroid is unchanged.

Do not require `(s,t):Γ→M×M` transverse to the diagonal. For composable pairs
it is `(g,h)↦(s(g),t(h))` on `Γ×Γ` that is transverse, by the submersion axioms.
The unit groupoid on a positive-dimensional manifold is an acceptance test for
this distinction.

## G1. Lie algebroids and their basic calculus

1. A Lie algebroid is a smooth vector bundle `A→M`, an `ℝ`-Lie bracket on its
   smooth sections, and a smooth fiberwise-linear anchor `ρ:A→TM`, with
   `[a,fb]=f[a,b]+(ρ(a)f)b`. Build evaluation, restriction to opens, local frames,
   structure functions, bracket locality and the anchor Lie-homomorphism theorem.
   Consume [PseudodifferentialOperators P1.0's smooth-section module anchor](../PseudodifferentialOperators/README.md#smooth-section-modules),
   including its restriction, constant-real scalar comparison, `IsScalarTower`
   and `SMulCommClass`; do not rebuild any of those generic facts. Bundle each
   Lie-algebroid bracket, anchor and their laws, and define a distinct
   structure-indexed section type synonym `Γ(A)` (a `def`, not an `abbrev`).
   Transport PDO's module and scalar instances to that synonym. Install the
   algebroid-specific `LieRing`, `LieAlgebra ℝ`, `LieRingModule`, `LieModule ℝ`,
   `LieRinehartRing` and `LieRinehartAlgebra` instances on `Γ(A)`, so different
   brackets or anchors on the same underlying bundle cannot create typeclass
   diamonds. Prove the anchor is C∞-linear for `lie_smul_eq_mul'`, the anchor's
   product rule for `leibniz_mul_right'`, and the bracket Leibniz rule for
   `leibniz_smul_right'`; separately prove the anchor Lie-homomorphism for
   `LieRingModule.leibniz_lie`. The converse local-frame criterion is
   included: skew structure coefficients and anchor coefficients satisfying
   Jacobi and anchor equations glue to an algebroid. The smooth section module
   and real/function scalar tower are consumed from PDO P1.0, not reconstructed
   here.
2. After the G1.3 cochain-complex core is available, define morphisms over
   arbitrary smooth base maps by commutation with that differential on pullbacks
   of algebroid forms. Over identity
   recover bracket/anchor-preserving bundle maps. Prove identity, composition,
   isomorphism transport and equivalence with the local-frame criterion; do not
   try to push arbitrary sections forward along arbitrary base maps. Define
   Lie subalgebroids over the same base as smooth subbundles closed under the
   bracket, with inherited anchor, restriction and inclusion-morphism API.
   For a map `f:N→M` transverse to the anchor, construct the pullback algebroid
   `f!A={(v,a)∈TN×f*A : df(v)=ρ(a)}` with anchor projection, bracket on local
   related sections, universal morphism property, and composition/base-change
   identities. Its bundle/kernel atlas is built from G0's transverse construction.
3. G1.3a constructs the smooth Chevalley–Eilenberg complex of a finite-rank
   Lie algebroid. Use DG Layer 0.2's smooth alternating-map bundle with source
   `A` and scalar target `ℝ`; degree `k` sections are alternating fiberwise
   multilinear forms on `A`. Prove the equivalence with alternating
   `C∞(M)`-multilinear maps on `Γ(A)` by the local-frame tensoriality theorem.
   Build a single smooth fiberwise wedge on sections of `Alt^•(E)` for any
   finite-rank bundle `E`, using DG 0.1's alternating-map operations in local
   trivializations and DG 0.2's bundle charts; this construction must not
   require a norm on the fibers. Use it for the CE Leibniz, contraction,
   Lie-derivative and Cartan identities here, and specialize it to the
   cotangent bundle in G4.1. For `ω` of degree `k`, pin
   `(d_Aω)(a₀,…,a_k)=Σ_i(-1)^iρ(a_i)(ω(a₀,…,omit a_i,…,a_k))+
   Σ_(i<j)(-1)^(i+j)ω([a_i,a_j],a₀,…,omit a_i,…,omit a_j,…,a_k)`;
   the remaining arguments in the second sum retain their original order.
   Prove smoothness, alternation, `C∞`-multilinearity, Leibniz and `d_A²=0`
   in every degree, then contraction, Lie derivative and Cartan identities.
   G1.3b is completed after G1.2: prove morphism pullback and naturality of the
   cochain complex and induced cohomology.

   Separately construct the all-degree Chevalley–Eilenberg complex of a
   finite-dimensional real Lie algebra `L` and a coefficient module `V` with
   `[LieRingModule L V] [LieModule ℝ L V]`: `C^k=Alt^k_ℝ(L,V)`, with differential
   `dω(x₀,…,x_k)=Σ_i(-1)^i x_i·ω(x₀,…,omit x_i,…,x_k)+
   Σ_(i<j)(-1)^(i+j)ω([x_i,x_j],x₀,…,omit x_i,…,omit x_j,…,x_k)`.
   Prove alternation, `d²=0` and cohomology in every degree. Prove the general
   coefficient comparisons
   `Alt¹_ℝ(L,V)≃LieModule.Cohomology.oneCochain ℝ L V` and
   `Alt²_ℝ(L,V)≃LieModule.Cohomology.twoCochain ℝ L V`, and compare
   `LieModule.Cohomology.d₁₂` and `LieModule.Cohomology.d₂₃`
   with the displayed differential in these degrees, forgetting the roadmap's
   `Alt³` codomain to all trilinear maps. Mathlib's `d₂₃` already has a
   trilinear codomain. The trivial coefficient case specializes through
   `TrivialLieModule ℝ L ℝ` and `TrivialLieModule.equiv`. This standalone complex is consumed
   by ComplexKahlerGeometry K8 and QuantumFoundations' finite-dimensional
   representation-coefficient comparison. This item does not claim a generic
   CE complex for arbitrary commutative coefficient rings or formal Lie–Rinehart algebras;
   FormalConnectionsOpers retains its domain-specific algebraic/formal owners.
4. Tangent algebroid, involutive subbundle, zero-anchor smooth bundle of Lie
   algebras, and transformation algebroid. For a Lie algebra homomorphism
   `α:𝔤→𝔛(M)`, the last has bundle `M×𝔤`, anchor `α` and
   `[a,b](x)=[a(x),b(x)]+D b_x(α(a(x)))-D a_x(α(b(x)))`.
   Verify all laws and compatibility with restriction and equivariant maps.
5. Kernels of anchor in each fiber are isotropy Lie algebras; prove independence
   of section extensions. Construct their smooth Lie-algebra-bundle structure on
   every open set where the anchor rank is locally constant, and on the pullback
   to each embedded submanifold on which that rank is constant. Along each orbit,
   use its immersed manifold structure for the isotropy bundle and the exact
   sequence. A fixed-rank locus carries these smooth constructions when supplied
   with the stated submanifold structure. Arbitrary fibers `A_x` are not Lie
   algebras unless the anchor vanishes there.
6. Build complex Lie algebroids over real bases with complex anchor into
   `TM⊗ℂ` acting on PDO P1.0's complex smooth-section module. Consume
   its real-base complex-scalar construction `(u+iv)·s=u·s+v·(Js)`,
   constant-scalar and restriction laws, and the real scalar tower from its
   smooth-section anchor; construct
   the complex Lie-Rinehart structure, morphisms and complexification. After
   SBC B2, construct the ℂ-linear constant-rank kernel/image subbundle API on
   the same real-smooth complexified bundle (model `Fin k → ℂ`, local smooth
   ℂ-frames and induced ℂ-linear trivializations). For smooth almost-complex `J`,
   consume SBC B2's tangent complexification and CK K1's `+i` and `-i`
   eigenbundles; either identify those carriers with the kernel construction
   or use their supplied subbundle structures, without claiming K1 instantiated
   this roadmap's API. Compare `(TM,J)` with the `+i` eigenbundle by `v↦v−iJv`,
   using the induced complex-bundle trivializations; the native real tangent
   atlas need not be J-linear. Prove each eigenbundle is a subalgebroid exactly
   when its sections are involutive. With ComplexKahlerGeometry's Nijenhuis/NN
   equivalences deduce the integrability equivalence; `v-iJv` is the `+i` vector.
   This is not the assertion that a complex anchor lands in the real `TM`.

## G2. Differentiation, orbits and representations

1. Construct `A(Γ)=ker(ds)|units` as a smooth vector bundle using the submersion
   kernel API built in G0. Extend its sections uniquely to source-vertical
   right-invariant fields; prove smoothness, restriction and inverse construction,
   bracket closure/Jacobi/Leibniz and anchor compatibility with `dt`. Differentiate
   functors, prove functoriality and the morphism criterion of G1.
2. Compute the tangent algebroids of the unit, pair, action and gauge examples.
   The unit gives zero fibers; the pair gives `TM`; group-over-a-point gives
   the right-invariant bracket and the negative identification with
   `GroupLieAlgebra`, from `rightInvariant_bracket`: the Lie bracket of the
   right-invariant fields of ξ and η is minus the right-invariant field of
   their `GroupLieAlgebra` bracket; the action example uses `α=-ξ_M` in standard coordinates.
   Prove the isotropy Lie algebra is isomorphic to the standard left-invariant
   Lie algebra of groupoid isotropy via the **negative** tangent identification,
   exactly as in the group-over-a-point case. Raw isotropy vectors are not
   identified by identity when comparing their Lie brackets.
3. The gauge groupoid differentiates to `TP/G`. Smooth invariant vector fields on
   `P` supply its bracket, the anchor is `dπ`, and the sequence from
   SmoothBundlesConnections B3 is exact as Lie algebroids. Its adjoint-bundle
   inclusion is `[p,ξ]↦[-V_ξ(p)]`, giving the pointwise adjoint Lie bracket.
   Prove local algebroid bracket formulas. Consume B3's correspondence between
   principal connections and smooth anchor splittings; show that such a
   splitting is a Lie-algebroid morphism exactly when curvature vanishes,
   by consuming B3's identity
   `[s(X),s(Y)]−s([X,Y])=j(F(X,Y))`, where `s` is its horizontal splitting
   and `j([p,ξ])=[-V_ξ(p)]` its injection. This roadmap proves the
   Lie-algebroid-morphism/flatness corollary, not the horizontal-field identity
   a second time.
4. Construct the Stefan–Sussmann orbit decomposition for locally finitely generated
   anchor distributions of Lie algebroids: local flows preserve the distribution,
   orbit charts give connected immersed manifolds tangent to `ρ(A)`, and maximal
   connected leaves partition the base. Build the smooth structure and universal
   immersion property; the rank may vary between leaves. Prove each leaf is
   Hausdorff and second-countable in its intrinsic topology, and give the
   countable-atlas argument from a second-countable base and finite-rank local
   generators. For source-connected
   groupoids identify these leaves with groupoid orbits. For a general groupoid,
   leaves are the orbits of its source-connected component, and a full orbit may
   be a union of leaves. For Lie-group actions prove the orbit/stabilizer tangent
   theorem with the orbit's intrinsic homogeneous-space topology.
5. An algebroid representation is a flat `A`-connection on a smooth vector bundle:
   `∇_{fa}u=f∇_au`, `∇_a(fu)=f∇_au+(ρ(a)f)u`, and zero curvature.
   Define covariant exterior differential and cohomology with coefficients;
   prove tensor/dual/direct-sum and morphism APIs. Differentiate groupoid linear
   representations, verifying these laws. Integration of representations over
   source-simply-connected integrations is built in G5.

## G3. Actions, trivializations and restriction

1. A smooth left groupoid action on `p:X→M` is a smooth map on
   `Γ×_{s,p}X` with `p(g·x)=t(g)`, unit and associativity laws. A right action
   of `Λ` on `b:P→Λ₀` is converted to this convention by
   `p·λ := λ⁻¹·p` on `P×_{b,t}Λ₁`; conversely, the inverse formula converts a
   left action to a right one. G0 gives the action-domain atlas since `s` is a
   submersion, even when `p` is not.
   Prove each arrow induces a diffeomorphism between source and target fibers
   when these fibers carry their induced manifold structures (in particular for
   a submersion `p`), with inverse induced by `g⁻¹`. Construct the action groupoid,
   equivariant maps, products/pullbacks of actions and linear representations.
   Prove the equivalence between algebraic Γ-actions on `p:X→M` and functors
   `Γ ⥤ Type`, sending `m` to `p⁻¹(m)` and `g` to its fiber map; the inverse
   is the dependent-sum total space. Morphisms are equivariant maps/natural
   transformations. The smooth version retains the total-space atlas and
   smooth total action map, rather than replacing it by discrete-object enrichment.

   For every object ξ, restrict the algebraic action to the G0.4-pinned
   isotropy group Γ_ξ on Z_ξ=p⁻¹(ξ), and prove invariance from the anchor law.
   Install `MulAction Γ_ξ Z_ξ` with `gh=h≫g`, not the opposite law in
   `Groupoid.vertexGroup`. Reuse `MulAction.orbitRel`,
   `MulAction.orbitRel.Quotient` and `Quotient.lift`; prove that its orbit
   relation is equivalent to `∃ g : Γ_ξ, g·x=y`, using inversion where the
   native relation reverses the two variables. Export the quotient projection
   and invariant-map universal property from these native constructions.
   No symplectic groupoid or moment map is required. Consume G0.4's
   conjugation Γ_ξ→Γ_η by `h↦ghg⁻¹` for every arrow g:ξ→η and its
   comparison with the vertex-group isomorphism through the opposite-group
   comparison. Construct the quotient bijection `[x]↦[g·x]`; prove
   representative independence, inverse, identity and composition laws.
   Prove independence of the connecting arrow for this quotient bijection.
   The conjugation isomorphism itself changes by an inner automorphism
   when the connecting arrow changes. Equivariant maps induce quotient maps
   commuting with all these arrow-induced bijections.
   When the smooth hypotheses below hold at both ξ and η, prove that each
   arrow-induced quotient bijection `[x]↦[g·x]` is a diffeomorphism. The action
   by g is a diffeomorphism between the regular fibers, its inverse is the
   action by `g⁻¹`, and it intertwines the isotropy actions by conjugation;
   use B1.1's local sections to verify smoothness on the quotient charts.

   For the smooth specialization assume X is Hausdorff and second-countable,
   ξ is a regular value of p, and the restricted Γ_ξ-action is free and
   proper. G0.1 gives Z_ξ its embedded level manifold and the smooth
   map-into-the-fiber/fiber-product universal properties, which prove the
   restricted action smooth. The level is Hausdorff and second-countable as
   a subspace of X. G0.4's isotropy Lie group Γ_ξ is Hausdorff as a subspace
   of the Hausdorff source fiber and second-countable as a subspace of the
   arrow manifold, so it satisfies the structure-group hypotheses of
   SmoothBundlesConnections B1.4. Consume its free-proper quotient atlas,
   converting the left action by `x·h=h⁻¹·x` as in B1.2. Prove that
   the right-orbit setoid equals the native left-orbit setoid, using
   `h↦h⁻¹`, and construct the induced quotient homeomorphism. Transport
   B1.4's atlas onto `MulAction.orbitRel.Quotient Γ_ξ Z_ξ` with its quotient
   topology; prove the transported projection is the native quotient map.
   Obtain its Hausdorff smooth structure and surjective-submersion property.
   Export `ker(dq_z)=range(d(h↦h·z)_1)=T_z(Γ_ξ·z)`, specializing
   B1.1's vertical-tangent identity and accounting for the inversion sign.
   Consume B1.1's invariant-map smooth descent and prove the specialized
   quotient-map naturality whenever the smooth hypotheses hold on both sides. Arbitrary levels or arbitrary
   isotropy actions carry only the algebraic quotient conclusion. G7.2
   consumes this same quotient and adds the reduced symplectic form.

2. For a nonempty base and chosen `m₀`, a smooth pair-groupoid action on a smooth
   fiber bundle `X→M` is equivalent to a global smooth trivialization
   `X≅M×X_{m₀}` respecting projection: `x↦(p(x),(m₀,p(x))·x)`.
   The inverse uses `(m,m₀)`. State the category equivalence with morphisms;
   without choosing `m₀`, express it as coherent fiber identifications.
3. Construct the fundamental Lie groupoid as the gauge groupoid
   `(M̃×M̃)/π₁(M,m₀)` of the universal covering principal bundle, using G0.3,
   G0.0's independent countability lemma, and SmoothBundlesConnections B5's
   right deck action `[a]·[γ]=[γ.trans a]`. Keep
   the right-action convention distinct from the inverse/left deck convention
   used for the intermediate cover by `H⁰`.
   Prove its algebraic groupoid is the existing fundamental groupoid of path
   classes. SmoothBundlesConnections B5 owns the equivalence of flat principal
   bundles/linear connections with fundamental-groupoid representations,
   parallel-transport homotopy invariance, holonomy/isotropy and the universal-cover
   inverse construction. Prove that its representations with smooth local parallel
   trivializations are precisely G3.1's smooth actions of this Lie groupoid;
   equivariant torsor/linear fiber maps agree on both sides. This comparison and
   its morphism naturality use one B5 dictionary. Extend the construction
   componentwise to disconnected bases, choosing basepoints only for the
   group-representation specialization.
4. Use Mathlib `Subgroupoid.full` for algebraic restriction to **every subset**
   `Y⊆M`: it has arrows with both endpoints
   in `Y`, inherited composition, units and inversion. Prove functoriality under
   subset inclusion. Smooth restriction is a separate theorem: open subsets,
   or embedded submanifolds transverse to algebroid anchor
   `T_yY+ρ(A_y)=T_yM`, yield the transverse fiber products and submersions.
   Identify the restricted algebroid with
   `{a∈A|_Y : ρ(a)∈TY}`. For invariant embedded submanifolds treat the clean
   fiber-product case with explicitly constant rank and submersion hypotheses;
   do not falsely assert anchor transversality for invariant submanifolds.
5. For an action groupoid, write restriction as
   `{(g,y) | y∈Y, g·y∈Y}`. It is the action groupoid on `Y` when `Y` is invariant;
   prove the converse for the projection-preserving inherited action description.
   Include a noninvariant open-subset example where only a restricted groupoid
   exists. Define a smooth `Γ`–`Λ` bibundle with commuting smooth actions and
   anchors `a:P→Γ₀`, `b:P→Λ₀`; for a right-principal bibundle require `a` to be
   a surjective submersion and require the right principal action map
   `P×_{b,t}Λ₁ → P×_{a}P`, `(p,λ)↦(p,p·λ)`, to be a diffeomorphism. The other
   anchor `b` is smooth; biprincipality additionally requires `b` surjective
   submersive and the analogous left-principal map to be a diffeomorphism.
   Total arrow and bibundle manifolds are locally Hausdorff and second-countable;
   do not require them Hausdorff, since the identity bibundle of a non-Hausdorff
   groupoid has its arrow space as total space. Construct the balanced product
   `(P×_{Λ₀}Q)/Λ₁` by the diagonal action
   `(p,q)·λ=(p·λ,λ⁻¹·q)`. For local charts, choose local sections `σ:U→P`
   of `a` and use the fiber products
   `U×_{b∘σ,Λ₀,a_Q}Q`; prove transitions smooth using the division map
   `P×_aP→Λ₁` inverse to the principal action map. Establish chart compatibility,
   local-Hausdorffness, second-countability and the quotient universal property.
   Prove the quotient map is open from the local-section principal-action charts
   in this general locally-Hausdorff setting; use this before forming the
   composition charts. Construct the associator, unitors and their pentagon/triangle identities,
   functoriality on equivariant bibundle maps, opposite bibundles, and closure
   of principal/biprincipal bibundles under composition. This proves transitivity
   in the locally-Hausdorff category. For biprincipal bibundles, prove orbit correspondence and induced
   isotropy Lie-group isomorphisms; do not equate Morita equivalence with
   isomorphism of arrow manifolds. Separately prove the Hausdorff-subcategory
   result for right-principal bibundles `P` from `Γ` to `Λ` and `Q` from `Λ`
   to `Ξ`: assume object manifolds `Γ₀, Λ₀, Ξ₀` and total spaces `P,Q` are
   Hausdorff (the arrow manifold `Λ₁` need only be locally Hausdorff). Show
   the diagonal orbit relation on `P×_{Λ₀}Q` is closed using division maps
   and Hausdorff object spaces, and that the quotient map is open by the
   principal-action charts; deduce the quotient is Hausdorff with a smooth
   atlas. Keep this separate from the locally-Hausdorff theorem.

## G4. Poisson structures, cotangent algebroids and leaves

1. Use DG Layer 0.2's smooth alternating-map bundle with source `T*M` and
   scalar target `ℝ` as the carrier of multivectors; consume SmoothBundlesConnections
   B2's exterior-power bundle and prove the finite-dimensional bundle
   isomorphism `Λ^k TM≃Alt^k(T*M)`. Own evaluation on covectors, specialization
   of G1.3a's fiberwise wedge, restriction and pushforward where defined. Build the Schouten bracket, graded antisymmetry/Jacobi/Leibniz
   and its local coordinate formulas. Pin `[X,f]=X(f)`,
   `[X,Y]=VectorField.mlieBracket X Y`, graded antisymmetry with exponent
   `(p−1)(q−1)`, and
   `[P,Q∧R]=[P,Q]∧R+(−1)^((p−1)q) Q∧[P,R]`.
   Thus `[π,f]=−π♯df`. A smooth bivector `π` is Poisson when
   `[π,π]=0`. Prove equivalence with Jacobi for the bracket on smooth functions,
   the biderivation/locality identities and recovery of the bivector from that
   bracket on a finite-dimensional base. Install Lie and Poisson algebra APIs
   on smooth functions using existing Mathlib Lie/derivation classes.
2. Poisson maps, products, opposite Poisson structure, restriction to opens,
   Poisson diffeomorphisms and coisotropic submanifolds. Prove the pointwise
   tensor-map criterion for a Poisson map. Recover HamiltonianSystems' bracket
   when `π♯=-(ω♭)⁻¹`. Prove nondegenerate Poisson is equivalent to a closed
   nondegenerate two-form, including all sign comparisons.
2a. **G4.2a, legacy Hamiltonian adapter.** Using only HamiltonianSystems Layer 1's
   `IsHamiltonianVectorField` definition on Tau Ceti's pinned
   `SmoothTwoForm` carrier and DifferentialGeometry 0.4's
   `legacySmoothTwoFormEquiv` plus its ordered-pair evaluation law, prove the
   adapter equivalence with the generic tuple equation `ω(X,·)=df`, including
   its sign. Also compare the legacy pointwise nondegeneracy predicate with
   separation of the generic tuple evaluation, and compare `IsSymplectic` with
   generic closedness plus that separation, using DG 0.4's closedness
   equivalence. This item has no dependency on G4.1, G4.2, HamiltonianReduction
   R1, or the Poisson/symplectic exact sequence. It precedes HR R1 and is the
   only groupoid-roadmap input that R1 consumes for these legacy predicates.
3. Consume HamiltonianReduction R1's symplectic vector-field algebra and exact
   sequence `0 → H⁰_dR(M) → C∞(M) → 𝔛_symp(M) → H¹_dR(M) → 0`.
   Its middle arrow is the Lie homomorphism `f↦π♯df=−X_f`; its final arrow is
   `X↦[ι_Xω]`. Here prove the Poisson/symplectic identification for those arrows
   and the closed/exact one-form description in the G4.2 interface. Locally
   constant `H⁰` and the disconnected-base statement remain with that owner.
4. The sharp map and Koszul bracket above make `T*M` a Lie algebroid.
   Prove the anchor and exact-one-form identities, local-coordinate formula,
   naturality under Poisson diffeomorphisms, and the Lichnerowicz complex
   `d_π=[π,·]` with `d_π²=0`; identify it with cotangent-algebroid cohomology
   using G4.1's finite-dimensional alternating-map comparison. The cochain
   carriers coincide; identify only degree one via the finite-dimensional
   double-dual map and prove the `C∞`-multilinear section comparison.
   A general Poisson map need not induce a covariant cotangent bundle map:
   state the contravariant comorphism with its fiberwise domains.
5. Apply G2's orbit theorem to `π♯(T*M)`. Each connected leaf has a unique smooth
   symplectic form, determined by the inverse of the induced nondegenerate
   bivector with the pinned minus sign:
   `ω_L(π♯α,π♯β)=π(α,β)`. Prove its closedness, inclusion is
   Poisson in the intrinsic leaf structure, and functions constant along leaves
   are exactly Casimirs. Construct regular local product charts and the Weinstein
   splitting theorem: at a point of rank `2r`, coordinates split off the canonical
   symplectic `2r`-plane and a transverse Poisson tensor vanishing at that point.
   Build the parametric local normal-form arguments, using flows and G4.1's
   coordinate Jacobi identities; this is a theorem to prove, not an assumed chart.
6. **G4.6A: linear structures.** Construct positive standard Lie–Poisson on
   `𝔤*`, its coordinate/linear-function brackets and coadjoint equivariance,
   independently of the orbit theorem. Build the linear Poisson structure on
   the dual of **every** Lie
   algebroid using the **minus** convention
   `{ℓ_a,ℓ_b}=−ℓ_[a,b]`, `{ℓ_a,p*f}=−p*(ρ(a)f)`,
   `{p*f,p*g}=0`. Prove these formulas, smoothness/Jacobi and the converse
   recovering the algebroid. Thus the tangent-algebroid dual is the canonical
   cotangent Poisson structure. A groupoid over a point has the right-invariant
   (opposite) algebroid bracket, so its dual in raw tangent coordinates has the
   positive standard Lie–Poisson structure. The dual of the negative Lie-algebra
   identification changes this Poisson sign; it is not the raw coordinate map.
   For a standalone standard Lie algebra viewed as a zero-anchor algebroid,
   its minus-linear dual is the opposite of positive Lie–Poisson; fiber negation
   is the Poisson isomorphism between these two presentations. Prove this
   comparison explicitly rather than identify the two brackets by notation.
   **G4.6B: orbit/leaf comparison.** For any second-countable Lie group `G` with Lie algebra
   `𝔤`, consume HamiltonianReduction R2's KKS construction and pointwise
   pairing identity, together with G4.5's connected-leaf theorem. Give `G/G_ν`
   its intrinsic homogeneous-space manifold topology; do not assume its
   subspace topology in `𝔤*` agrees. Prove each connected Lie–Poisson leaf is
   the immersed orbit of `G⁰`, equivalently a connected component of `G/G_ν`
   as an immersed manifold. The KKS form restricts to the leaf's symplectic form. G4.6A supplies the linear Poisson structure;
   R2 owns the KKS construction and pointwise identity, not this orbit/leaf
   identification.
7. Concrete acceptance cases: zero Poisson (point leaves), canonical cotangent
   bracket, the plane `π=u(x,y)∂x∧∂y` for any smooth `u`, bracket
   `u(f_xg_y-f_yg_x)`, point leaves on the zero locus and symplectic leaves on
   connected components of `{u≠0}` with form `(1/u)dx∧dy`. For `u=x`, compute
   the two half-plane leaves and singleton axis leaves. Verify smooth Casimirs
   and the local bracket without assuming constant rank at the axis.

## G5. Integration and the monodromy obstruction

1. Define `A`-paths as `C¹` bundle paths `a(t)` over `C²` base paths `γ(t)`
   on `[0,1]` with `ρ(a(t))=γ'(t)`. Use smooth paths **vanishing** near endpoints
   for concatenation representatives, and prove smoothing/reparametrization
   preserves the path class and yields the same quotient as `C¹` paths.
   For variations with fixed base endpoints, each `a_ε` is `C¹` in `t` and
   the family is `C²` in `ε` in the local `C¹` path norms: finite interval
   subdivision and bundle charts define these norms, independently of the
   chosen charts. This is not joint `C²` regularity in `(ε,t)`; a constant
   ε-family of a merely `C¹` path is permitted. Choose a smooth linear bundle
   connection and define the transverse component by
   `∂_t b−∂_ε a=T_∇(a,b)`, where
   `T_∇(a,b)=∇_{ρ(a)}b−∇_{ρ(b)}a−[a,b]`; derivatives are covariant along
   the base square. Solve for `b`, `C¹` in `t`, with initial condition
   `b(ε,0)=0`. Prove `ρ(b)=∂_εγ` and uniqueness from this initial-value
   equation. The variation is an `A`-homotopy when the resulting solution also
   satisfies `b(ε,1)=0`. Prove connection independence,
   equivalence with the algebroid-morphism equation on the square interpreted
   through its boundary/corner charts: extend G1.2's morphism equation to
   the square's tangent bundle and prove agreement on interior and faces.
   Prove reversal, homotopy equivalence,
   smooth concatenation associativity and all endpoint laws. The square is a
   parameter domain; it does not silently satisfy the boundaryless-base convention.
2. Construct the Banach manifold of `C¹` bundle paths before imposing the
   anchor equation. Build a smooth local addition `Σ` on the total manifold of
   `A` (consume DifferentialGeometry 12.1's metric existence and HopfRinow's
   exponential map). Since the base is not assumed compact, use variable fibre
   radii: the first component of `(x,v)↦(x,Σ(x,v))` forces any collision to
   have the same `x`; choose pointwise inverse neighborhoods and a smooth
   positive radius minorant to obtain a diffeomorphism from an open neighborhood
   of the entire zero section onto an open neighborhood of the diagonal. For
   each center path `a`, choose a `C¹` trivialization of `a^*TA` along the
   compact interval and identify `C¹(a^*TA)` with the fixed Banach model
   `C¹([0,1],ℝ^{dim M+rank A})`. Prove changes of trivialization act by bounded
   linear isomorphisms and local-addition chart changes are smooth in the fixed
   `C¹` norms; finite subdivision handles paths crossing multiple local
   addition neighborhoods. Construct a local addition on `M` by the same
   pointwise exponential and variable-radius argument. Identify the moving
   anchor equation along a nearby base path with the fixed Banach space
   `C⁰(γ_a^*TM)` using this local addition and its vertical differential (or
   an explicitly constructed equivalent connection transport); prove this
   identification and inverse are smooth in the path variable. Impose
   `ρ(a(t))=γ'(t)` in these charts. Prove
   the linearized anchor-ODE map between the specified Banach spaces is split
   surjective by initial-value existence/uniqueness and its bounded
   variation-of-constants right inverse, with closed kernel and an explicit
   complement. Prove the Banach split-regular-level theorem for `C^k`
   maps, `1≤k≤∞`: split the source into the derivative kernel and a closed
   complement, apply the Banach inverse-function theorem at that regularity
   on the complement, and express the level locally as a `C^k` graph over
   the kernel. Prove the anchor-constraint map is smooth in the fixed path
   Banach norms and apply the `k=∞` case. The finite-dimensional regular-value
   theorem G0.1 alone does not imply this conclusion. Hence admissible paths
   form a smooth split Banach submanifold. Pin the
   induced `C¹` norm and `C²` base reconstruction.
   Construct the Weinstein groupoid `Σ(A)` as a topological groupoid of path
   classes, its quotient topology, isotropy and source-fiber connectivity; the
   transversal-slice construction at this stage is topological and does not give
   a smooth quotient atlas. Build the required ordinary parameter-dependent ODE
   facts from the existing smooth-flow theory, and prove independence of the
   auxiliary bundle connection. The smooth quotient charts on `Σ(A)` are owned
   by G5.5 under its local-uniform-discreteness hypothesis.

   Construct the A-homotopy foliation of the admissible-path Banach manifold
   used above, without changing its `C¹` path model or the G5.1 homotopy
   relation. For a fixed admissible path `a` over a `C²` base path `γ`, use
   the Banach space of `C²` sections `b` of `γ* A` satisfying
   `b(0)=b(1)=0`, with its finite-chart `C²` norm. For a connection ∇,
   represent the variation by
   `(u, φ) = (∂ₜb − T∇(a,b), ρ(b))`, where
   `T∇(a,b)=∇_{ρ(a)}b−∇_{ρ(b)}a−[a,b]`. Make the regularity maps explicit:
   the variation operator is a bounded linear map from this endpoint-zero
   `C²` section space to the `C¹` tangent model of the admissible-path
   manifold, and its image satisfies the linearized anchor equation.
   For the split proof, first allow `b(1)` to be free while imposing
   `b(0)=0`. Prove the same operator identifies this initial-zero section
   space by a bounded inverse with the closed subspace of admissible tangent
   vectors whose base-start variation vanishes; the inverse is the
   linearized anchor initial-value ODE. This subspace has codimension
   `dim M`. On it, define the continuous endpoint map by solving for `b`
   and taking `b(1) ∈ A_{γ(1)}`. Prove this endpoint map is onto and split
   using C² sections supported near `t=1`. The distribution is its kernel,
   so it is closed and split and has codimension `dim M + rank A`.
   Establish these statements in the fixed path charts rather than infer
   them from a finite-rank distribution API.
   Prove the operator and its split data depend smoothly on `a` in the
   fixed path Banach charts and are independent of ∇ as actual tangent
   vectors.

   The `C²` section domain is a variation coordinate, not a restriction of
   the `C¹` admissible paths or their homotopy classes. For every G5.1
   homotopy family, differentiate in its specified local `C¹` path norms:
   the forcing `∂εa` is `C¹` in `t`, and the defining linear equation
   `∇ₜb=∂εa+T∇(a,b)` has `C¹` coefficients and forcing. Prove its initial-value
   solution is `C²` in `t`, with a bounded solution operator in these norms;
   conversely, show the resulting `C²` endpoint-zero variations are exactly
   the tangent vectors represented by that equation. Thus every infinitesimal
   variation of a permitted G5.1 family is represented, while arbitrary
   `C¹` sections that would produce a non-`C¹` component `u` are not used as
   tangent coordinates. Prove that the local boundary-value charts integrate
   this distribution and that its leaves are exactly the full G5.1
   A-homotopy classes, including all `C¹` representatives.

   Prove the distribution and its leaves are independent of ∇, construct
   the holonomy maps, and prove saturation is open in the quotient topology.
   Construct the algebroid-geodesic exponential from a neighborhood of the
   zero section into admissible paths and prove that its image gives
   finite-dimensional transversals near zero paths. These are the four
   assertions of Crainic–Fernandes, *Integrability of Lie brackets*,
   Proposition 4.7 (p. 604), whose codimension count is the endpoint
   argument above.

   In G5.5, prove the monodromy-to-slice bridge: under local uniform
   discreteness, choose through each admissible path a finite-dimensional
   transversal of dimension `dim M + rank A` that meets each entire
   A-homotopy class (each leaf, not merely each plaque) in at most one
   point (Crainic–Fernandes, *Integrability of Lie brackets*, Lemma 4.9,
   p. 606). Prove the induced holonomy transitions are smooth
   and use them to construct the quotient atlas. Show the atlas has
   Hausdorff source fibers and a second-countable total space, while the
   total arrow space is allowed to be non-Hausdorff. The proof is specific
   to this path foliation and does not assume a general Banach Frobenius
   theorem or a finite-rank foliation API.
3. Define monodromy `N_x(A)⊆Z(kerρ_x)` as the central isotropy vectors whose
   constant isotropy `A`-paths are `A`-homotopic to the zero path; develop its
   relation to the simply-connected isotropy Lie group, the leaf-sphere boundary
   map and variation with the basepoint. Define local uniform discreteness by
   existence near each basepoint of a neighborhood of the zero section in the
   isotropy vectors containing no nonzero monodromy vectors. The definition
   makes sense when isotropy rank changes and uses the ambient bundle topology.
4. For an existing integration Γ, integrate A(Γ)-paths by Γ's source-fiber
   ODE and prove the canonical morphism `Σ(A(Γ))→Γ` is an isomorphism
   when Γ is source-simply-connected. Construct its smooth source-fiber-cover
   structure using Γ's charts before invoking the general integrability
   criterion. Differentiate and integrate morphisms with a source-simply-connected domain
   integration, assuming both algebroids integrable (Lie II), including uniqueness.
   Integrate representations by
   parallel transport of `A`-paths and prove `A`-homotopy independence exactly
   from flatness. Identify `Σ(TM)` with the fundamental groupoid, the integration
   of a Lie algebra with its simply-connected group through G2.2's explicit
   negative identification of the raw right-invariant algebroid with
   `GroupLieAlgebra`, and the action/gauge cases with their
   source-simply-connected covers where needed.
5. Prove the Crainic–Fernandes criterion: a finite-rank real Lie algebroid has a
   smooth integrating Lie groupoid iff these monodromy groups are locally
   uniformly discrete. Equivalently, with a continuous bundle metric,
   `r(x)=inf {‖v‖ : 0≠v∈N_x(A)}` (empty infimum `∞`) satisfies `r(x)>0` and
   `liminf_{y→x}r(y)>0` for every `x`. The smooth integration is `Σ(A)` and is
   source-simply-connected; uniqueness follows from Lie II, proved before this
   criterion. Prove that the Crainic–Fernandes construction has Hausdorff
   source fibers while its total arrow manifold may remain non-Hausdorff. Prove
   necessity, sufficiency and the smooth quotient-chart theorem; the charts
   come from the monodromy-to-slice bridge specified at the end of G5.2,
   built on the A-homotopy foliation constructed there. Prove
   second countability of the admissible path space: use a countable atlas
   and finite interval subdivisions to reduce to separable `C¹` Banach
   models. Prove the leaf quotient projection is open, so images of a
   countable basis form a countable basis on `Σ(A)`. This verifies global
   second countability even when the arrow space is non-Hausdorff. Arbitrary
   integrability does not imply a Hausdorff source-simply-connected arrow
   manifold.
6. For a closed real two-form `η`, build the central extension
   `TM⊕ℝ` with anchor projection and bracket
   `[(X,f),(Y,g)]=([X,Y],Xg-Yf+η(X,Y))`. Compute its monodromy as spherical
   periods, proving homotopy invariance from `dη=0`. For an `A`-homotopy square
   with coordinates `(ε,t)`, choose a torsion-free connection on `TM` and the
   trivial connection on the central `ℝ` factor. Use G5.1's pinned equation
   and the displayed bracket to prove
   `∂_t b⁰−∂_ε a⁰=η(∂_εγ,∂_tγ)` for the central components. With
   `b(ε,0)=b(ε,1)=0`,
   integrate over the square to show the terminal-minus-initial central path
   coordinate is `−∫_{I²} γ*η` in the orientation `dε∧dt`; this is the
   monodromy-period identity, not a smooth-sphere assumption.
   A homotopy square only known to be `C¹` and constant on its boundary does
   not yet give a smooth based sphere: construct a collar reparametrization
   homotopic to the identity relative to the boundary that makes the map
   constant on a boundary neighborhood, and descend it to a based `C¹` map
   `S²→L`. Prove relative `C¹` Whitney approximation for compact `S²` maps
   into a finite-dimensional Hausdorff second-countable manifold, fixed on a
   smaller disk where the map is based; choose the smooth approximation
   `C¹`-close. Apply G5.2's local-addition construction to the leaf `L`: the
   inverse of its map from a neighborhood of the zero section in `TL` to a
   neighborhood of the diagonal in `L×L` is jointly smooth in both points.
   Use a finite subcover of the compact sphere image to choose the homotopy
   neighborhood, and use the inverse's short geodesics for the `C¹` homotopy
   relative to that disk. Prove the `C¹` Stokes
   formula for this homotopy (by local charts and approximation of its
   derivatives), so the smooth representative has exactly the square's
   `η`-period. DG 8.3's relative smooth-simplex theorem may supply continuous
   homotopy representatives, but alone it does not establish this period
   equality.
   Prove closure of smooth based sphere periods under addition by representing
   the based sum with a pinched sphere and smoothing its collars; homotopy
   invariance then identifies its period with the sum. Reversal gives negatives
   and the constant sphere gives zero, so these periods form the subgroup used
   by monodromy. Do not claim chartwise approximations can be glued across
   arbitrary manifold charts.

   For the example, identify the oriented Riemann sphere with the chosen `S²`
   carrier and prove based power maps have degree `m` for every integer `m`
   (conjugate powers for negative degree, constant map for zero). Transport the
   basepoint from `1` to any chosen `x` by an orientation-preserving
   diffeomorphism. Use the degree formula on both projections to show every
   smooth sphere has period `m+λn`, and the two power maps realize every pair.
   Exhibit the nonintegrable example on `S²×S²` using an oriented area form `a`
   of integral `1` and `η=pr₁*a+λ pr₂*a` for irrational `λ`; its period group
   is `ℤ+λℤ`. The monodromy subgroup
   `N_x=±{∫_{S²}σ*η : σ:S²→L smooth and based at x}` is unchanged by the sign.
   Apply DifferentialGeometry 10.3–10.4's degree formula
   `∫_M f*ω=deg(f)∫_Nω` on each projection exactly once to prove the period
   claim, then deduce density and nonintegrability. This distinguishes the
   criterion from Lie's third theorem for finite-dimensional Lie algebras.

## G6. Symplectic groupoids and cotangent groupoids

1. A symplectic groupoid is a Lie groupoid with closed nondegenerate `Ω` satisfying
   `m*Ω=pr₁*Ω+pr₂*Ω` on composable pairs. Prove multiplication graph is
   Lagrangian in `Γ×Γ×Γ̄`, units are Lagrangian, inversion is anti-symplectic,
   source and target fibers are symplectically orthogonal, and
   `dimΓ=2dimM`. The unique base Poisson structure has **target Poisson, source
   anti-Poisson**. Its cotangent algebroid is canonically `A(Γ)`; spell out
   `a↦-Ω(a,du(·))` under the G1/G4 sharp convention and verify the anchor and
   bracket. Uniqueness is proved from the target submersion, not postulated.
2. Construct tangent and cotangent groupoids of any Lie groupoid. Extend the
   cotangent owner's local bundle charts, tautological one-form and canonical
   nondegeneracy proof to the locally Hausdorff arrow manifold, retaining exactly
   its cotangent carrier; these local constructions need no Hausdorff total arrow
   assumption. Establish restriction/transition compatibility rather than assume
   the Hausdorff-base version applies without proof. The cotangent
   groupoid has base `A(Γ)*`. Pin the translated-covector formulas:
   `t̃(φ_g)(a)=φ_g(dR_g a)` for `a∈A_{t(g)}`, and
   `s̃(φ_g)(b)=φ_g(dL_g(b−du(ρb)))` for `b∈A_{s(g)}`.
   The vector `b−du(ρb)` lies in the target-vertical tangent space at its unit.
   Units are conormals to the unit manifold, identified by restriction to `A`;
   inverse is `φ_g⁻¹=−φ_g∘d(inv)_{g⁻¹}`. Multiplication is the
   unique covector satisfying
   `λ(dm(v,w))=α(v)+β(w)` on composable tangent vectors; prove existence,
   independence, smoothness, associativity and the exact source/target signs.
   The tautological form is multiplicative and canonical `-dθ` is symplectic;
   its base structure is G4.6's linear algebroid-dual Poisson structure.
3. For a Lie group `G`, identify `T*G≅G×𝔤*` by left translation.
   `s(α_g)(ξ)=α_g(dL_g ξ)` and `t(α_g)(ξ)=α_g(dR_g ξ)`;
   thus `s(g,ν)=ν`, `t(g,ν)=Coad_gν`, with
   `Coad_gν=ν∘Ad_{g⁻¹}`. Multiplication is
   `(g,Coad_hν)(h,ν)=(gh,ν)`. Verify target/source Poisson signs and
   the linear Lie–Poisson bracket by evaluation on linear functions. The
   identification here uses **raw** vectors `A(G)=T₁G` and their duals.
   It does not apply the negative Lie-algebra isomorphism from G2: applying its
   dual negates both source and target and reverses the base Poisson sign.
   Prove this distinction by the raw right-invariant bracket computation.
4. Prove a Poisson manifold has a source-simply-connected symplectic integration
   iff its cotangent algebroid is integrable, hence iff G5's cotangent monodromy
   groups are locally uniformly discrete. Assign the construction of the
   multiplicative form, rather than treating a bundle isomorphism as an
   integration theorem. For a Lie algebroid A and an algebroid isomorphism
   `σ:A→T*M`, state and prove the closed IM two-form identities
   `⟨σ(a),ρ(b)⟩ = −⟨σ(b),ρ(a)⟩` and
   `σ([a,b]) = L_{ρ(a)}σ(b) − ι_{ρ(b)}dσ(a)`.

   Construct the tangent prolongation and prove the canonical-flip
   identification `A(TΓ) ≃ TA(Γ)` and the componentwise identification
   `A(TΓ ×_Γ TΓ) ≃ TA(Γ) ×_A TA(Γ)`, including the cotangent-algebroid
   formulas from G6.2's translated-covector operations. For `k=2,3`, write
   `T^[k]Γ` for the groupoid of k tangent vectors at the same arrow, with
   componentwise source, target, and multiplication. Its source fiber over
   a fixed k-tuple in `T^[k]M` projects to `s⁻¹(x)` with fiber the product
   of the affine solution spaces `ds_g(v_i)=v_i^x`. Use local source-submersion
   charts to prove these are affine bundles with contractible fibers; hence
   their source fibers are connected and simply connected whenever those of
   Γ are. This is a fiberwise argument and assumes no global tangent-bundle
   splitting, partition of unity, or Hausdorff total arrow space.

   Construct the scalar Lie-algebroid 1-cocycle on
   `A(TΓ ×_Γ TΓ) ≃ TA(Γ) ×_A TA(Γ)` by the explicit formula
   `λσ(ȧ,ḃ) = (−dθ_can)_{σ(a)}(Tσ(ȧ),Tσ(ḃ))`, where
   `ȧ,ḃ ∈ T_aA` and `θ_can` is the tautological one-form on `T*M`.
   Prove this formula is well-defined and coordinate-independent under the
   canonical flip, is linear on the algebroid fibers, and satisfies the
   Lie-algebroid 1-cocycle identity exactly by the two displayed IM
   identities. Lie-II integrates λσ on the source-simply-connected twofold
   tangent groupoid to an additive cocycle. Prove the integrated function is
   bilinear and alternating in the two tangent vectors. Use the threefold
   tangent groupoid and the differentiated IM identity to prove the
   closedness equation `dΩ=0`. Its bilinear cocycle is the multiplicative
   two-form Ω: prove the cocycle equation is precisely
   `m*Ω=pr₁*Ω+pr₂*Ω` on composable tangent pairs.

   Recover the cotangent-groupoid morphism `ΞΩ:TΓ→T*Γ` with
   `ΞΩ(v_g)(w_g)=−Ω_g(v_g,w_g)`. Prove its groupoid-morphism identities
   from multiplicativity and G6.2, and verify at units that
   `σΩ(a)(X) := −Ω(a,du(X)) = ΞΩ(a)(du(X)) = σ(a)(X)`.
   Prove Ω is nondegenerate from the vector-bundle-isomorphism hypothesis
   on σ and uniqueness from Lie-II uniqueness of the scalar cocycle.

   Fix the sign against G1/G4's convention explicitly. With
   `θ_can=p_i dx^i` and `ω_can=−dθ_can=dx^i∧dp_i`, the map ΞΩ has local
   cotangent coordinates `p_j=−v^iΩ_{ij}`; compute
   `ΞΩ*ω_can = dx^j∧d(−v^iΩ_{ij})`. At a unit, its value on `a` and
   `du(X)` is `ΞΩ(a)(du(X))=−Ω(a,du(X))=σ(a)(X)`. For the pair groupoid
   with `Ω=pr₁*ω−pr₂*ω`, this gives `σΩ=−ω♭`, and the pinned convention
   `π♯=−(ω♭)⁻¹` makes `π♯∘σΩ` the identity. Use this calculation to
   verify the canonical cotangent two-form sign; do not infer it from an
   unqualified convention. These constructions prove existence and
   uniqueness of the multiplicative symplectic form on the integration.

   Include the pair symplectic groupoid `(M×M,pr₁*ω-pr₂*ω)` for symplectic
   `M`, its fundamental-groupoid cover, the additive cotangent bundle for
   zero Poisson, and `T*G` for linear Lie–Poisson. The last is
   source-simply-connected precisely when `G` is connected and simply
   connected; use the simply-connected integrating group for that example
   of the source-simply-connected theorem.

## G7. Symplectic actions and the reduction comparison

1. Assume P is Hausdorff and second-countable. A symplectic groupoid
   action on `(P,ω)` with moment map `μ:P→M` is a G3
   action whose graph is the subset
   `{(g,p,g·p) : (g,p) is in the action domain}` in
   `(Γ,Ω)×(P,ω)×(P,-ω)`. Pin the pullback identity on that action domain as
   `act*ω=pr_Γ*Ω+pr_P*ω`, with projections from the same fiber product; prove
   the graph is Lagrangian, the dimension and tangent conditions, and that `μ`
   is Poisson. Smoothness and graph/isotropy formulas
   hold in the actual fiber product, not in all of `Γ×P`.
2. For a **regular value of μ** `ξ`, the level `Z=μ⁻¹(ξ)` is the G0.1 regular
   level manifold. Suppose the isotropy action of `Γ_ξ` on `Z` is free and
   proper. Consume G3.1 at p=μ for the same native orbit quotient
   `q:Z→Z/Γ_ξ`, its Hausdorff smooth structure and surjective-submersion
   property. G7.1 supplies the Hausdorff/second-countable hypotheses on P;
   G3.1 supplies the isotropy-group hypotheses and the B1.4 application.
   Using G2.2's isotropy Lie algebra identification
   and G6.1's cotangent-algebroid identification, prove the kernel of the
   restricted form is precisely the isotropy orbit tangent distribution,
   hence `ker(dq)`. Verify closedness and basicness of the restricted form.
   Consume HamiltonianReduction R3's generic `descendedForm_exists` and
   `descendedForm_unique` for closed basic forms on a surjective submersion;
   the induced symplectic form is that theorem's specialization. This roadmap
   owns the groupoid graph/kernel/isotropy input; B1 owns the quotient-manifold
   theorem and R3 the generic form-descent theorem. Include the dimension formula
   and equivariant symplectic-map naturality; generic invariant-function descent
   is consumed from G3.1.
3. An equivariant Hamiltonian action of `G` on `P` induces the action of its
   cotangent groupoid: `(g,ν)·p=g·p` when `ν=μ(p)`.
   Prove the graph Lagrangian/pullback identity from the moment equation and
   equivariance, and conversely recover the Hamiltonian action from this
   cotangent-groupoid action. At `ξ`, identify isotropy with `G_ξ`, identify
   the action domain and induced action on `μ⁻¹(ξ)`, and match their orbit
   equivalence relations and quotient projections. HamiltonianReduction R4
   consumes G7.2's quotient and descended form together with these G7.3
   identifications; it owns the final quotient diffeomorphism and compares
   G7.2's descended form with R3's `ω_red`, without repeating generic
   form-descent.
4. Under HamiltonianReduction R3's hypotheses (`ξ` is a regular value of `μ`
   and `G_ξ` acts freely and properly on that level), consume its transverse
   fiber-product manifold `W_O`, induced-space diffeomorphism and quotient
   map. Here `O=G/G_ξ` has its intrinsic homogeneous-space manifold and
   immersion `ι_O:O→𝔤*`; R3's `W_O={(p,o)∈P×O : μ(p)=ι_O(o)}` has the diagonal `G` action and
   moment/anchor projection `pr_O(p,o)=o`. Construct the restricted-arrow
   action groupoid `G⋉O` by its explicit action charts and identify it with
   the endpoint restriction of `T*G` in these intrinsic coordinates. This
   construction does not require `O` embedded and does not claim the restricted
   groupoid is symplectic. Identify the associated action groupoid on
   `W_O` and its isotropy actions. Consume R3's diffeomorphism
   `Φ:G×_{G_ξ}μ⁻¹(ξ)≃W_O`, the induced quotient diffeomorphism `e:W_O/G≃Q`,
   and its two-form identity. Transport the `G`-action groupoid and quotient
   maps across `Φ`; this item owns the groupoid interpretation and proves no
   second orbit/value form identity. If `π_G:W_O→W_O/G` is the orbit quotient,
   the reduction map is exactly `q_O=e∘π_G:W_O→Q`; this is the transported
   quotient map, not another descended-form construction. Allow disconnected `O`;
   connected Poisson
   leaves use the identity component, and are not silently identified with a
   disconnected full orbit.

## Dependency order and acceptance

G0.1 consumes DG10.1's regular predicates independently of SBC and supplies SBC B1.1/B1.5,
HamiltonianReduction R3, MorseTheory M2 and IntegrableSystems with regular fibers and
fiber products. G0.3 and G3.3 consume SBC B1.1's division and B1.4's
quotient. B1.1 owns generic invariant-map smooth descent and the vertical
tangent identity; G3.1 specializes them to the native isotropy orbit quotient.
G3.3 uses G0.0's independent topological countability lemma for
`π₁(M,m₀)`. Its flat-bundle and holonomy comparison separately consumes B5. G0.0 supplies OperatorAlgebraDynamics D5's topological layer.
G1.1 consumes [PseudodifferentialOperators P1.0's smooth-section module anchor](../PseudodifferentialOperators/README.md#smooth-section-modules), including its module and scalar-tower instances;
G1.3a (the smooth section-complex core) precedes G1.2; G1.3b (morphism
naturality) follows G1.2. G1.3a consumes DG Layer 0.2's alternating-map bundle
and the PDO section module; G1.2 consumes SBC B2's associated-section and bundle-map
operations. The point-base Lie-algebra CE construction is algebraic and independent
of those geometric suppliers. G1.2 consumes SBC B2's Hom-bundle construction and its associated-bundle
agreement, together with the pullback/functoriality comparison for bundle maps;
do not refer to an unnamed generic "bundle-map dictionary."
The principal bundles used by G7 are Hausdorff and second-countable, as in
SBC's quotient contract. G0 grounds G1–G3. G1/G2 and DifferentialGeometry
ground G4.1–2 and G4.4–5. G4.2a depends only on DifferentialGeometry 0.4
and HamiltonianSystems Layer 1, and precedes HamiltonianReduction R1; HR R1 supplies the
exact sequence consumed by G4.3.
G4.6A supplies linear Lie–Poisson and precedes HamiltonianReduction R2, which owns the KKS
construction and pointwise form identity, while G4.5 supplies the connected-leaf
theorem consumed in G4.6B. G1.3 constructs the standalone all-degree Lie-algebra CE complex consumed by
ComplexKahlerGeometry K8 and by QuantumFoundations for finite-dimensional
representation coefficients. G4.4 uses DG 0.2's alternating-map bundle on `T*M`
and proves the finite-dimensional comparison needed for the multivector
Lichnerowicz complex.
G1.6 consumes SBC B2's complexification, CK K1's eigenbundles and PDO P1.0's
real-base complex section module, including its J-based complex-scalar
construction and the real smooth-section anchor's scalar tower. G0–G3 ground G5; G5.2 also consumes DG12.1's metric
and HopfRinow Layer 1's exponential and local-diffeomorphism targets, while G5.6
consumes G2.4's Hausdorff second-countable leaf and G5.2's joint local-addition
inverse. G4/G5 and
the cotangent-form owner ground G6. G3/G6 and HamiltonianReduction's
R1–R2 group moment-map interfaces ground G7.1/G7.3. B1.4's quotient atlas
supplies G3.1, which supplies G7.2's underlying smooth quotient;
HamiltonianReduction R3's generic form descent/induced-space construction
supplies the remaining G7.2/G7.4 inputs. HamiltonianReduction R4 consumes G7.2's quotient and
descended form plus G7.3's identifications for the final ordinary/groupoid
quotient and comparison with R3's reduced form. The complex
subalgebroid comparison additionally consumes ComplexKahlerGeometry K1 and
the complex-bundle targets of SmoothBundlesConnections.

Acceptance includes: unit groupoid over the real line; pair/tangent and
fundamental-groupoid integrations; the source-simply-connected monodromy groupoid
of the foliation of `ℝ³\{0}` by horizontal planes (Crainic–Fernandes–Mărcuț,
*Lectures on Poisson Geometry*, §1, Example 1.18 and Exercise 8); action
algebroid signs and gauge/Atiyah
sequence; pair-action trivialization; a flat circle bundle with nontrivial
holonomy; noninvariant restriction; the rank-varying plane Poisson example;
`so(3)*` sphere leaves with the KKS comparison; the irrational-period
nonintegrable central extension; zero-Poisson and pair symplectic integrations;
`T*G` multiplication/source/target/linear-bracket formulas; and the exact
value/orbit reduction comparison. Local formulas, restriction/naturality,
identity/composition and `_apply` lemmas accompany every new carrier. A kernel,
quotient or existence predicate alone does not discharge its construction.

## References

- C. Blohmann, [*Stacky Lie Groups*](https://doi.org/10.1093/imrn/rnn082),
  *International Mathematics Research Notices* (2008), §2.2, Propositions
  2.11–2.12: balanced bibundle composition, its principality,
  and identity/associator coherence in the source's Lie-groupoid manifold
  convention. This is the reference construction, not an imported theorem for
  this roadmap's locally-Hausdorff non-Hausdorff-arrow category; G3.5 proves
  the local quotient atlas and its hypotheses in that category.

- J. M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Graduate Texts in
  Mathematics 218, Springer (2013), Corollary 5.14 and Proposition 5.38:
  regular level sets and their tangent spaces, in the Hausdorff case (G0.1).
- M. Crainic and R. L. Fernandes, [*Integrability of Lie brackets*](https://annals.math.princeton.edu/wp-content/uploads/annals-v157-n2-p06.pdf),
  Annals of Mathematics 157 (2003), 575–620: A-paths, monodromy and the exact
  integrability criterion; Proposition 4.7 (the A-homotopy foliation) and
  Lemma 4.9 (transversals meeting each leaf once) for G5.2 and G5.5; use the algebroid definitions in §§1–3, not a
  universal claim that every algebroid integrates.
- M. Crainic and R. L. Fernandes, [*Integrability of Poisson brackets*](https://www.math.tecnico.ulisboa.pt/~rfern/Meus-papers/HTML/PoissonFinal.pdf),
  Journal of Differential Geometry 66 (2004), 71–137: symplectic integration
  and the cotangent-monodromy criterion in G6.4.
- M. Crainic, R. L. Fernandes and I. Mărcuț, [*Lectures on Poisson Geometry*](https://webspace.science.uu.nl/~crain101/gsm217.pdf),
  AMS Graduate Studies in Mathematics 217 (2021): Poisson/Koszul/leaf/splitting
  foundations and symplectic groupoids; §1, Example 1.18 and Exercise 8 give
  the non-Hausdorff fundamental groupoid of the horizontal-plane foliation of
  `ℝ³\{0}`.
