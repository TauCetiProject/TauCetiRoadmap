# Smooth principal bundles, connections, and holonomy

**Summary.** This roadmap develops smooth principal bundles and their associated vector bundles
as usable geometric objects: local trivializations and cocycles, regular fibres and fibre products
of submersions, free proper quotients and homogeneous spaces, Ehresmann's fibration theorem,
connections and curvature, the Atiyah sequence, parallel transport and its inverse
(reconstruction of a connection from smooth transport), holonomy groups with the Ambrose–Singer
theorem and the holonomy reductions, the finite-rank Hilbert space of square-integrable sections
of a metrized bundle, smooth good covers, the comparison of the native Čech complex of a good
cover with locally constant, smooth and circle-valued coefficients, and the integral
classification of circle bundles with connection by `H²(M;ℤ)` with its flat ambiguity
`H¹(M;ℝ/ℤ)`. It ends with the Yang–Mills energy and its first and second variations on a closed
Riemannian manifold. Its end theorems are Ehresmann's fibration theorem, the free proper quotient
theorem, the flat-bundle dictionary with representations of the fundamental group, Ambrose–Singer,
the reconstruction of connections from smooth parallel transport, the Čech–de Rham–singular
comparison on good covers, the classification of principal circle bundles by `H²(M;ℤ)` with the
Hopf normalization `⟨c₁(Hopf),[ℂP¹]⟩ = 1`, rank-one Chern–Weil, and the Yang–Mills
variational formulas with their gauge-fixed elliptic operator. The output supports differential
geometry, symplectic reduction and prequantization, Lie groupoids and gauge theory without a
separate bundle or connection language in each application.

## Scope and ownership

This roadmap owns: the principal-bundle mixin on Mathlib's fibre-bundle data and its smooth
atlas (B1.1); the regular fibre of a smooth map at a point where its derivative is surjective, the
transverse fibre product of smooth maps, and the kernel distribution of a submersion, all without a
Hausdorff hypothesis on the total space (B1.0); generic smooth descent along a principal
projection, the fibre product `P ×_M P` and the division map (B1.1); the slice theorem for proper
actions, free proper quotients, homogeneous spaces `G/H` and the properness of the principal right
action (B1.4); Ehresmann connections and Ehresmann's fibration theorem (B1.5); associated,
frame, tensor, dual, Hom and complexified bundles, reductions and extensions of the structure group,
and the adjoint bundle (B2); fibre metrics and the Hilbert space `L²(E,h,μ)` of sections of a
finite-rank bundle with all its functoriality (B2); principal connections, the Atiyah sequence as a
vector-bundle sequence, induced covariant derivatives (B3); curvature, exterior covariant
derivatives and the gauge group (B4); horizontal lifts, the reconstruction of connections from smooth
transport, holonomy groups, Ambrose–Singer, the holonomy reductions, the flat-bundle dictionary
and the countability of the fundamental group of a connected second-countable manifold (B5);
smooth good covers, the identification of the native Čech complex of a good cover in locally
constant, smooth and circle coefficients, raw refinement maps and refinement homotopies of native
Čech complexes on an arbitrary space, the Čech–de Rham and Čech–singular comparisons on good
covers, and the integral theory of circle bundles and lattice torus bundles (B6); the Yang–Mills
energy, its variations and its linear gauge-fixed operator (B8).

It leaves to named roadmaps: generic differential forms, wedge, exterior derivative, pullback,
Stokes, de Rham cohomology and theorem, the homotopy operator, orientations, smooth structures on
covering spaces, Riemannian metrics, distributions and Frobenius, to
[DifferentialGeometry](../DifferentialGeometry/README.md) (Layers 0–5, 8, 9, 12 and 2.3, 4.3);
the exponential map, adjoint representation, closed-subgroup theorem and immersed Lie subgroups
(the carrier `integralSubgroup`) to [LieGroups](../RepresentationTheory/LieGroups/README.md)
(Layers 0–2, 4); singular cohomology, cup and cap products, coefficient sequences and the
Bockstein, orientation local systems and fundamental classes, and the projectivization topology
to [AlgebraicTopology](../AlgebraicTopology/README.md) (Stages 3.2, 4.6, 6.1, 6.3); the
degree-one Hurewicz isomorphism to [DGFloer](../DGFloer/README.md) Layer 1.1; the Levi-Civita
connection, geodesics, the exponential map, normal neighbourhoods, the local logarithm and the Gauss
lemma to [HopfRinow](../HopfRinow/README.md) (Layers 1–2); the projective charts on `ℂP¹`, the
density line bundle, the real Hodge star and the compact real Hodge theorem to
[ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) (K7.1 and K5a); the universal cover's
manifold structure to Tau Ceti and the [UniversalCovers](../../Completed/UniversalCovers/README.md)
roadmap. Algebraic vector bundles on schemes are
[AlgebraicVectorBundles](../AlgebraicVectorBundles/README.md)'s objects; no analytification or
algebraic-to-topological comparison is asserted here.

Consumers that build on these layers and own what lies beyond them:
[LieGroupoidsPoisson](../LieGroupoidsPoisson/README.md) owns the Lie algebroid bracket on the
Atiyah bundle, its integration by the gauge groupoid, the constant-rank theorem, the bracket
naturality for related vector fields and the smooth-subbundle API, and consumes B1.0, B1.1, B1.4,
B2, B3 and B5; [HamiltonianReduction](../SymplecticGeometry/HamiltonianReduction/README.md) owns
the gluing of symplectic forms on slice charts, its orbifold reduction theorem, Sobolev completions
of gauge groups and Coulomb slices over a surface (R5); GeometricQuantization owns polarized
sections and quantization operators; [IntegrableSystems](../SymplecticGeometry/IntegrableSystems/README.md)
owns the symplectic and Lagrangian torus-bundle obstruction; FourManifolds (F5) and
InstantonFloerTheory (IF1) own the self-dual and anti-self-dual energy comparisons, the BPST
solution, instanton moduli, nonlinear gauge slices and their stabilizers; TopologicalSheafCohomology
owns Čech cohomology as a cover colimit on arbitrary and compact spaces and its comparison with
derived global sections; OperatorAlgebraDynamics consumes the countability theorem of B5.2 for its
topological groupoid layer.

Kept variants: the Čech complex used here is Mathlib's native fixed-cover complex on a smooth good
cover, identified degreewise with coordinate cochains, not a cover-colimit Čech cohomology; the
holonomy groups carry the immersed Lie-group topology, never the subspace topology of `G`; the
`L²` space is parametrized by an explicit fibre metric and a Borel measure, never by a density
alone.

## Conventions

Bases are finite-dimensional, Hausdorff, second-countable smooth real manifolds without boundary.
Structure groups are finite-dimensional real Lie groups, Hausdorff and second-countable. Vector
representations are finite-dimensional over ℝ or ℂ. Statements about a chosen base point assume a
connected nonempty base. Compactness is imposed only where stated. Smooth means `ContMDiff … ∞`.
Total spaces of bundles over these bases are Hausdorff; the regular fibres, fibre products and
kernel distributions of B1.0 are stated without a Hausdorff hypothesis on the ambient manifold,
because LieGroupoidsPoisson applies them to non-Hausdorff arrow manifolds.

Use Mathlib's `FiberBundle`, `FiberBundleCore`, `Trivialization`, `Bundle.TotalSpace`,
`VectorBundle` and `ContMDiffVectorBundle`; principal structure is a mixin on this bundle data,
following the principal-bundle and connection direction of Mathlib's open principal-bundle and
connection-form pull requests
([leanprover-community/mathlib4#30121](https://github.com/leanprover-community/mathlib4/pull/30121),
[leanprover-community/mathlib4#38374](https://github.com/leanprover-community/mathlib4/pull/38374)):
bundle mixins, opposite-group right actions, Lie-algebra-valued connection forms and frame bundles.
Build the missing APIs in Tau Ceti with these interfaces, shaped so that Mathlib's declarations,
once adopted, replace ours by a deletion and an import; nothing waits for them. A principal bundle has a **right** action, encoded
by `MulAction (MulOpposite G)`. Every atlas trivialization is equivariant on its source, not only
the chosen trivialization at each point. Freeness and transitivity are fibrewise; smooth local
triviality supplies the projection's surjectivity and submersion property. Do not introduce a
second total-space topology. Open restrictions are pullbacks along `Subtype.val`; their chart maps
consume `Bundle.Trivialization.restrictPreimage`.

Use [`GroupLieAlgebra I G`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Geometry/Manifold/GroupLieAlgebra.html#GroupLieAlgebra)
for the structure Lie algebra. Its tangent-space definition and bracket are Mathlib's; the
left-invariant-derivation comparison is a theorem, not a choice of a competing Lie algebra. For `A`
in this Lie algebra, the fundamental vector at `p` is the derivative of `t ↦ p·exp(tA)` at zero.
For a right principal action these fundamental vector fields preserve the Lie bracket. Distinguish
this from the sign for fundamental fields of a left action. Consume Tau Ceti's
`leftInvariantDerivationLieEquivGroupLieAlgebra` in `Geometry/Lie/Tangent/LieEquiv.lean` and the
tangent exponential `mulInvariantExp` in `Geometry/Lie/Exponential/Basic.lean`; its
`lieExp_eq_mulInvariantExp` identifies the derivation-based exponential. The identity-interior
hypothesis holds for the boundaryless groups here.

The connection form satisfies `ω(A#)=A` and `R_g*ω=Ad_(g⁻¹)ω` (Freed, equations (1.9)–(1.10);
Kobayashi–Nomizu I, Ch. II §1). Curvature is `Ω=dω + ½[ω∧ω]`, so `Ω(X,Y)=dω(X,Y)+[ω(X),ω(Y)]`
in the determinant-style wedge normalization of DifferentialGeometry and Mathlib's `extDeriv`,
where `[ω∧ω](X,Y)=[ω(X),ω(Y)]−[ω(Y),ω(X)]=2[ω(X),ω(Y)]` (Freed, equation (1.13)). A change of
local section `s′=s·g` gives `A′=Ad_(g⁻¹)A + g⁻¹dg`. For the associated bundle use
`(p·g,v) ~ (p,ρ(g)v)`. Mathlib's covariant derivative takes its section argument first:
`∇ σ x (X x)` denotes `∇_X σ`. Sections of `P×_G V` correspond to functions `u(pg)=ρ(g)⁻¹u(p)`.
Pin `s_j=s_i g_ij`, so the bundle-core coordinate change from chart i to j is left multiplication
by `g_ij⁻¹`, and changing `s_i` to `s_i h_i` gives `g_ij′=h_i⁻¹g_ijh_j`. The left Maurer–Cartan
form is `θ_g=dL_(g⁻¹)` and satisfies `dθ+½[θ∧θ]=0` in the same normalization (Freed, equation
(1.5)).

The circle is Mathlib's `Circle`, identified explicitly with `ℝ/(2πℤ)` by `t ↦ exp(it)`. Identify
its Lie algebra with ℝ using this parameter, so a real connection has `ω(X)=1` for the fundamental
field X of 1∈ℝ and real curvature `F`, with integral class mapping to `[F/(2π)]`. The associated
complex line bundle uses the circle's dual character `z ↦ z⁻¹` for the prequantum line convention:
its unitary curvature is `-iF`, and its first Chern representative is `F/(2π)`. Here `c₁(P)`
denotes the first Chern class of this associated line. The line associated to the standard
character has the opposite class. Scaling to coefficients `ℝ/ℤ` is `t ↦ t/(2π)`. The circle
Lie-algebra identification with ℝ is `t ↦ t • (mfderiv 𝓘(ℝ,ℝ) (𝓡 1) Circle.exp 0 1)`. Prove this
is a linear equivalence and that its exponential is `t↦exp(it)`; no sign of the chosen
stereographic-coordinate basis is assumed. For the Hopf action `(z₁,z₂)·λ=(z₁λ,z₂λ)` and
connection `Im(z̄₁dz₁+z̄₂dz₂)`, require `∫_(ℂP¹)F=2π` in the complex orientation and
`⟨c₁(P),[ℂP¹]⟩=1`; the dual-character line is O(1).

Use the alternating Čech coboundary `(δt)_ijk=t_jk−t_ik+t_ij` and total Čech/de Rham differential
`D=δ+(-1)^p d` on Čech degree p. If `g_ij=exp(i φ_ij)`, the integer representative of the
dual-character class is `−(δφ)_ijk/(2π)`; the comparison sends it to `[F/(2π)]` and gives the Hopf
value above (B6.2).

Define holonomy by `τ_γ(p)=p·hol_p(γ)`. Mathlib's fundamental-group multiplication is
`p*q=q.trans p`, so holonomy is a homomorphism and `hol_(p g)=g⁻¹hol_p g`. For the exponential
coefficient Bockstein β and holonomy character `h(γ)=arg hol(γ)/(2π)`, the class convention is
`c₁(P)=β(h)` on flat bundles. Here the singular Bockstein is `β[h]=[d h̃]` for a real lift of a
circle-valued singular cocycle, with the ordinary alternating singular coboundary. For parallel
local sections, crossing from i to j multiplies the fibre coordinate by `g_ij⁻¹`, so the holonomy
around a subdivided loop, with final chart `i_n=i_0` and basepoint `p=s_(i_0)(γ(0))`, is
`g_(i_(n−1)i_n)⁻¹⋯g_(i_0 i_1)⁻¹`, with the last crossing leftmost. For `p·a` conjugate this
expression by `a⁻¹` and `a`. The dual-character line has the inverse transition cocycle, so its
exponential connecting class is `β(h)`; B6.4 proves this dictionary and B7 tests it on lens spaces.

Mathlib already provides smooth vector bundles and
[`CovariantDerivative`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.html#CovariantDerivative),
its `addOneForm` and `difference` API, and smoothness classes. Tau Ceti supplies curvature
operators and their basic linearity and Bianchi results. Consume those objects, supplying
principal/associated-bundle bridges and missing general bundle operations here.

## Exact supplier contracts

| Supplier | Exact interface consumed |
| --- | --- |
| Mathlib, at the pin | `FiberBundle`, `FiberBundleCore`, `Trivialization` (with `Bundle.Trivialization.restrictPreimage`, `Bundle.Trivialization.localFrame`), `Bundle.TotalSpace`, `VectorBundle`, `ContMDiffVectorBundle`; `GroupLieAlgebra`, `LieGroup`; `Manifold.IsSubmersionAt`, `Manifold.IsSubmersion`, `Manifold.IsSmoothEmbedding`; `MulAction.instChartedSpaceQuotient` (properly discontinuous actions only); `CovariantDerivative`, `CovariantDerivative.addOneForm`, `CovariantDerivative.difference`, `CovariantDerivative.leviCivitaConnection`; `IsContinuousRiemannianBundle`, `Bundle.ContinuousRiemannianMetric`, `EMetricSpace.ofRiemannianMetric` (which requires `T3Space`); `Circle`, `Circle.exp`, `FundamentalGroupoid`, `FundamentalGroup`; `MeasureTheory.Lp`, `MeasureTheory.L2.inner_def`, `MeasureTheory.Lp.dense_hasCompactSupport_contDiff`, `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`, `MeasurableEmbedding.subtype_coe`, `map_comap_subtype_coe`; `InnerProductSpace.toDual`, `InnerProductSpace.ofCoreOfTopology`; `Matrix.GeneralLinearGroup`, `Matrix.linftyOpNormedRing`, `CFC.sqrt` with `Matrix.PosSemidef.inv_sqrt` and `Matrix.PosSemidef.det_sqrt`; `CategoryTheory.constantSheaf`, `CategoryTheory.constantSheafAdj`, `CategoryTheory.cechComplexFunctor`, `CategoryTheory.Limits.isTerminalTop`, `CategoryTheory.Sheaf.H`; `smoothSheafCommGroup`, `smoothSheafAddCommGroup` and `smoothSheafAddCommGroup.compLeft`; `Projectivization`. |
| Tau Ceti, at the pin | `TauCeti.sectionZeroChartedSpace`, `TauCeti.isManifold_sectionZero`, `TauCeti.exists_isManifold_sectionZero_of_contMDiff`, `TauCeti.hasMFDerivAt_coe_sectionZero`, `TauCeti.isImmersionOfComplement_coe_sectionZero`, `TauCeti.sectionLinearization_trivial` (regular zero sets of smooth sections); `TauCeti.IsContMDiffDistribution`, `TauCeti.IsDistributionFrameOn`; `TauCeti.leftInvariantDerivationLieEquivGroupLieAlgebra`, `TauCeti.mulInvariantExp`, `TauCeti.lieExp_eq_mulInvariantExp`, `TauCeti.extChartPartialDiffeomorph`, `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`; `CovariantDerivative.curvatureOperator` and its Bianchi and linearity results; `TauCeti.Manifold.contMDiffOn_maximalIntegralCurve`, `ODE.exists_contDiffAt_localFlow`, `ODE.exists_contDiffAt_picard_solution` (whose zero-field base-parameter hypothesis is honoured in B5.0); `TauCeti.riemannianLog`, `TauCeti.Manifold.IsNormalDomain` and `TauCeti.Manifold.IsNormalDomain.contMDiffOn_riemannianLog`; `TauCeti.riemannianVolume`; `Matrix.linftyOpTopologicalSpace` (Tau Ceti's `L∞`-operator topology on matrices); `TauCeti.UniversalCover` with its `ChartedSpace` and `IsManifold` instances; `TauCeti.LensSpace`, `TauCeti.LensSpace.fundamentalGroupMulEquiv`; `TauCeti.CategoryTheory.cechAugmentation` and `TauCeti.CategoryTheory.cechAugmentation_f_zero_comp_π`, `TauCeti.CategoryTheory.quasiIsoAt_cechAugmentation_zero_iff`; `TauCeti.singularSubdivisionHomotopy`, `TauCeti.smallSingularChainHomotopyEquiv`; the smooth quotient construction for discrete actions in `Geometry/Manifold/Instances/Quotient.lean`. |
| DifferentialGeometry | Layer 0 (`SmoothBundleForm`, its fixed-coefficient specialization, the paired wedge and `CurvatureForm`), Layer 1 (`mextDeriv`, pullback), 2.3 (smooth structures on covering spaces), 3.5 (time-dependent flows), 4.1–4.3 (distributions, integral manifolds and the local Frobenius theorem on the native carriers), 5.2–5.5 (integration of top forms, Stokes, the homotopy operator `homotopyOperator` on `M × Icc 0 1`, densities and `integralDensity`), Layer 6 (the de Rham complex and cohomology), 8.3 (`SmoothSimplex`, smooth chains, `smoothToSingular` and the smoothing theorem with its chain homotopies, under T2, σ-compact, finite-dimensional hypotheses), 8.4 (`fullSimplex`, `simplexFace`, `chainIntegral`, `SmoothSimplex.integral_mextDeriv`, `deRhamHom`), 8.5 (`deRhamEquiv`), 9.1 (`poincarePairing`), 12.1 (`nonempty_contMDiffRiemannianMetric`), 12.4 (`riemannianVolumeForm`, `riemannianDensity`). |
| LieGroups | Layer 0 (`lieExp`, one-parameter subgroups), Layer 1 (`Ad`, `ad`), Layer 2 (the closed-subgroup theorem and embedded Lie subgroups), Layer 4 (`integralSubgroup`, `IsImmersedLieSubgroup`). |
| AlgebraicTopology | Stage 3.2 (the small-chain theorem for an open cover), Stage 4 (cellular chains and the cellular-to-singular comparison as a chain-homotopy equivalence), Stage 4.6 (the quotient topology on `Projectivization`), Stage 6.1 (absolute and relative singular cochains, the coefficient long exact sequence and the Bockstein for `0→ℤ→ℝ→ℝ/ℤ→0` and `0→ℤ→[×2]ℤ→F₂→0`, universal coefficients), Stage 6.3 (the integral orientation local system, the tangent-orientation comparison and the fundamental class of a closed oriented manifold). |
| DGFloer | Layer 1.1: the degree-one Hurewicz isomorphism `π₁(X)ᵃᵇ ≅ H₁(X;ℤ)` for path-connected X, natural in X. |
| HopfRinow | Layer 1 (the geodesic flow and `exp_p`), Layer 2 (normal neighbourhoods, `log_p` on a normal ball, the Gauss lemma, radial minimization). |
| ComplexKahlerGeometry | K7.1: the `Projectivization ℂ (Fin 2 → ℂ)` carrier of `ℂP¹`, its projective charts and underlying real smooth structure and complex orientation. K5a: the real density line bundle, the pointwise real Hodge star and form metric, the linear elliptic and Sobolev theory and the compact real Hodge theorem (consumed only by B8). |
| UniversalCovers (completed) | the universal cover's path model, its deck group and the identification of the deck group with `π₁`, as implemented in Tau Ceti. |

Every declaration named in this table is consumed, never restated.

## How to read the build

B1 constructs principal bundles, descent, quotients and Ehresmann's theorem, starting from the
regular-fibre and fibre-product foundations of B1.0. B2 builds associated bundles, frames,
reductions, the adjoint bundle and the `L²` theory of metrized bundles. B3 and B4 put connections,
curvature and gauge transformations on these bundles. B5 develops parallel transport in both
directions (lifting and reconstruction), holonomy groups and flat bundles. B6.0–B6.1 are
independent of B1–B5: they build smooth good covers and the Čech comparisons on them. B6.2–B6.6
combine both strands into the integral theory of circle and torus bundles. B7 fixes the acceptance
examples. B8 consumes B2–B4 and ComplexKahlerGeometry K5a for the Yang–Mills variational calculus.

## B1. Principal bundles and descent

### B1.0 Regular fibres, fibre products and kernel distributions of submersions

These three constructions are stated for smooth maps between finite-dimensional boundaryless real
manifolds, with no Hausdorff hypothesis on the ambient manifolds; the fibre may be empty.

Define the regular fibre of a smooth map `f : X → N` over `c : N` as the subtype `{x : X // f x = c}`
with its subspace topology, under the hypothesis that `mfderiv f x` is surjective at every point x
of the fibre. Construct on it a charted-space structure modelled on `Fin (dim X − dim N) → ℝ` with
its self model `𝓘`, and prove it is a smooth manifold for which `Subtype.val` is
`Manifold.IsSmoothEmbedding` with `range (mfderiv … Subtype.val z) = ker (mfderiv … f z)` at every
point (Lee, *Introduction to Smooth Manifolds*, 2nd ed., Corollary 5.14 and Proposition 5.38, in
the Hausdorff case; Kolář–Michor–Slovák §9.2 supplies the local form of a submersion). Route: in a
target chart φ at c, apply Tau Ceti's zero-section theorem
`exists_isManifold_sectionZero_of_contMDiff` and `sectionZeroChartedSpace` to the trivial-bundle
section `x ↦ φ(f x) − φ(c)` on the open set `f⁻¹(φ.source)`, which contains the whole fibre, and
transfer that one structure to the fixed subtype. Supply the atlas transfer from a general
finite-dimensional boundaryless `ModelWithCorners` to the self-modelled type synonym the native
theorem needs, restricting extended charts to `interior (range I)`, with the derivative comparison
for the identity transport; do not install a second global `ChartedSpace` on the ambient carrier.
The atlas depends on the target chart φ: fixing φ as Tau Ceti's `extChartPartialDiffeomorph` at c
selects one instance, and the identity is a diffeomorphism between the atlases of any two choices.
Specialize to a model-space target, retaining the comparison with the manifold-target atlas.

- The regular fibre is a smooth manifold of dimension `dim X − dim N`; when it is nonempty the
  surjectivity hypothesis forces `dim N ≤ dim X`, so the natural-number subtraction is exact.
- The inclusion is a smooth embedding whose tangent image at z is the kernel of `mfderiv f z`.
- Open restriction: the regular fibre of `f|U` over c is the open submanifold `U ∩ f⁻¹(c)`.
- The universal property: a map from a manifold into the fibre is smooth iff its composite with the
  inclusion is smooth.
- Independence: the identity between the atlases of two target charts is a diffeomorphism.

**Checks.**
- For the coordinate projection `ℝⁿ → ℝᵐ` and any c, the fibre is the affine subspace `ℝⁿ⁻ᵐ`, the
  constructed charts are affine, and the tangent image is the coordinate kernel; a definition
  giving dimension n instead of n − m fails the tangent-kernel statement.
- For `‖·‖² : EuclideanSpace ℝ (Fin (n+1)) → ℝ` over 1, the fibre is the unit sphere and the
  identity to Mathlib's sphere manifold structure is a diffeomorphism.
- For `(x,y) ↦ x² − y²` over 0 the derivative vanishes at the origin, the hypothesis fails there,
  and the fibre (two crossing lines) is not a manifold at the origin; the hypothesis is not
  removable.
- The empty fibre (c outside the range) satisfies the hypothesis vacuously and receives the empty
  manifold of dimension `dim X − dim N`.
- On the line with two origins mapped to ℝ by the obvious map, the fibre over 0 is a two-point
  0-manifold; the construction uses no Hausdorffness.

Define the transverse fibre product of smooth maps `f : X → N`, `g : Y → N` as the subtype
`{(x,y) : X × Y // f x = g y}` with its subspace topology, under transversality
`range (mfderiv f x) + range (mfderiv g y) = T_(f x) N` at every pair with `f x = g y`. Construct it
as the regular fibre of `(x,y) ↦ φ(f x) − φ(g y)` in a target chart φ, glued over the target charts,
with model `Fin (dim X + dim Y − dim N) → ℝ`; prove the local universal property before gluing.
Prove that the inclusion is a smooth embedding, both projections are `ContMDiff`, the tangent space
at (x,y) is `ker (mfderiv f x − mfderiv g y)`, the dimension is `dim X + dim Y − dim N`, the
structure is independent of the charts, and the smooth universal property. Prove that either
projection is a submersion when the other map is a submersion; for a submersion f the
transversality hypothesis holds automatically.

**Checks.**
- For `f = g = id_X` the fibre product is the diagonal, diffeomorphic to X by either projection.
- For f a submersion and g the constant map at m, the fibre product is `f⁻¹(m) × Y`, agreeing with
  the regular-fibre structure on the first factor.
- For the trivial bundle `M × G → M` the fibre product with itself is `M × G × G`, the local model
  of B1.1.
- For `f = g = (x ↦ x²) : ℝ → ℝ` the pair `(0,0)` violates transversality (both derivatives vanish),
  and the fibre product `{x² = y²}` is two crossing lines, not a manifold.

Construct the kernel distribution of a submersion `f : X → N`: the family `x ↦ ker (mfderiv f x)`
is a `TauCeti.IsContMDiffDistribution` of rank `dim X − dim N`, with local frames given by the
submersion normal form (Mathlib's `Manifold.IsSubmersionAt`). Equip the kernel fibres with a
`ContMDiffVectorBundle` structure modelled on `Fin (dim X − dim N) → ℝ` through the local frames,
and prove smooth pullback along smooth maps into X. No Hausdorff hypothesis is used.

**Checks.**
- For the coordinate projection `ℝⁿ → ℝᵐ` the kernel is the constant distribution spanned by the
  last `n − m` coordinate fields.
- For the Hopf map `S³ → S²` the kernel is the line spanned by the fundamental field of the circle
  action, the vertical distribution of B1.1.
- For the non-submersion `x ↦ x³` on ℝ the kernel has rank 1 at 0 and rank 0 elsewhere; the
  constant-rank conclusion fails, so the submersion hypothesis is used.

*Needs:* Tau Ceti `exists_isManifold_sectionZero_of_contMDiff`, `sectionZeroChartedSpace`,
`hasMFDerivAt_coe_sectionZero`, `isImmersionOfComplement_coe_sectionZero`,
`sectionLinearization_trivial`, `extChartPartialDiffeomorph`; Mathlib `Manifold.IsSubmersionAt`,
`Manifold.IsSmoothEmbedding`; Tau Ceti `IsContMDiffDistribution`.

### B1.1 Principal structure, descent and the fibre product

Define a smooth manifold-fibre bundle by smooth overlap maps on the product model. For a
principal bundle, require smoothness of `x↦(e′(e.toOpenPartialHomeomorph.symm(x,1))).2` on base
overlaps; equivariance then gives smooth full product transitions. Construct the smooth atlas for a
bundle with arbitrary manifold fibre F (including G): compose its atlas trivializations with charts
of G and prove smooth transitions on the product model `IB.prod IG`. A principal-total-space type
synonym carries the original total-space topology and this atlas, with the canonical homeomorphism
to `Bundle.TotalSpace`. This avoids competing with Mathlib's generic fibre-bundle chart instance
whose model contains G itself. Generalize the same type-copy construction to F for B1.5. No second
topology or vector-space structure on G is installed.

Define principal structure and smooth equivariant bundle maps (Kolář–Michor–Slovák §10.2;
Kobayashi–Nomizu I, Ch. I §5). Prove atlas extensionality, projection identities, fibrewise torsor
uniqueness, local sections, and smoothness of the division map `δ(p,q)=g` characterized by `p·g=q`
in one fibre. Prove the projection is a smooth surjective submersion in the sense of
`Manifold.IsSubmersion`/`IsSubmersionAt`, directly from the product form of the local
trivializations. Construct `P×_M P` as B1.0's fibre product of the projection with itself; identify
its inherited topology and charts with the principal local model `M×G×G`. Division is smooth on
this manifold, not a function on unrelated pairs. Conversely, a surjective submersion with a free
right action whose orbits are exactly the fibres is a principal bundle (Kolář–Michor–Slovák, Lemma
10.3).

Prove generic smooth descent along a principal projection: a map from the base to any smooth
manifold is smooth iff its composite with the projection is smooth. Every invariant smooth map on
the total space descends uniquely to a smooth base map; use the formula `f|U=F∘s_U` for local
sections and prove agreement on overlaps, restriction and composition. These generic results are
owned here; groupoid actions and Hamiltonian reduction consume them. From the principal local
trivializations prove `ker(dπ_p)=range(d(g↦p·g)_1)`, with the orbit map a diffeomorphism onto its
fibre; the vertical distribution is B1.0's kernel distribution of π. Isomorphisms have inverses,
composition, restriction, transport and extensionality APIs.

**Checks.**
- On the trivial bundle `M × G`, `δ((x,g),(x,h)) = g⁻¹h`; the other order of multiplication would
  give `h g⁻¹`, which fails `p·δ(p,q) = q` for non-abelian G.
- On the Hopf bundle `S³ → ℂP¹` with action `(z₁,z₂)·λ`, `δ(p, pλ) = λ`, and `|z₁|²` descends to
  the smooth function `[z₁:z₂] ↦ |z₁|²/(|z₁|²+|z₂|²)` on `ℂP¹`; the non-invariant function
  `Re z₁` does not descend.
- `ker dπ_p` has dimension `dim G`, and for G finite (a covering) the vertical distribution is zero.
- For a non-free action (the trivial action of a nontrivial G on M) the division map is not
  defined: the fibrewise torsor axiom excludes it.

*Needs:* Mathlib `FiberBundle`, `Trivialization`, `Manifold.IsSubmersionAt`; B1.0.

### B1.2 Trivial bundles, restrictions, pullbacks and products

Construct trivial bundles, restrictions, pullbacks and products over a common base, with universal
properties and coherent identity/composition comparisons. Convert a left principal action to a
right action by `p·g=g⁻¹p`; prove the infinitesimal generator changes sign.

**Checks.**
- The pullback along the identity is the identity bundle, and the pullback of a trivial bundle is
  trivial.
- The restriction of `M × G` to an open U is `U × G` through `Subtype.val`.
- For G acting on itself by left translation, the converted right action is `p·g = g⁻¹p`, and the
  fundamental field of A is the negative of the right-invariant field of A; forgetting the sign
  would make the fundamental fields anti-preserve the bracket.

*Needs:* B1.1.

### B1.3 Cocycles and nonabelian Čech H¹

Construct bundles from smooth transition functions `g_ij`, with the section and coordinate
conventions above (Kolář–Michor–Slovák §10.2 and Corollary 10.8). Prove the cocycle/bundle
classification up to equivariant isomorphism, changes by a smooth 0-cochain, and independence of
cover refinement. Define nonabelian Čech H¹ as the pointed set of these cocycle classes, with its
refinement maps.

**Checks.**
- The constant cocycle 1 gives the trivial bundle, the base point of the pointed set.
- For the Hopf bundle with sections `s₀([1:z]) = (1,z)/√(1+|z|²)` and
  `s₁([w:1]) = (w,1)/√(1+|w|²)`, the pinned convention `s₁ = s₀ g₀₁` gives `g₀₁([1:z]) = z̄/|z|`;
  the opposite convention `s₀ = s₁ g₀₁` would give `z/|z|`.
- On the two-arc cover of `S¹`, the `ℤ/2` cocycle equal to 1 on one component of the overlap and
  −1 on the other gives the connected double cover, not the trivial one; it is not a coboundary.
- Changing `s_i` to `s_i h_i` replaces `g_ij` by `h_i⁻¹ g_ij h_j`; the formula `h_i g_ij h_j⁻¹`
  corresponds to `s_i h_i⁻¹` and is excluded by `s_j = s_i g_ij`.

*Needs:* B1.1, B1.2.

### B1.4 Slices, quotients and homogeneous spaces

Prove the slice theorem for proper smooth actions (Meinrenken, Theorem 1.25; Lee, *Introduction
to Smooth Manifolds*, 2nd ed., Theorem 21.10 for the free case). Free proper actions give smooth
quotient manifolds with surjective submersion projection and a principal bundle (Meinrenken,
Theorem 1.21). For proper locally free actions with finite stabilizers, construct transverse slices
with finite isotropy actions and equivariant quotient-chart transitions. HamiltonianReduction owns
gluing symplectic forms and its orbifold reduction theorem on these charts. Prove properness of the
right action on any principal bundle over these bases: `(p,g) ↦ (p,pg)` is a homeomorphism onto
`P ×_M P`, which is closed in `P × P` because M is Hausdorff. For a closed Lie subgroup H≤G,
consume LieGroups' closed-subgroup structure and apply the free proper right H-action to construct
G/H; prove G→G/H is a principal H-bundle and its tangent quotient description
(Kolář–Michor–Slovák §10.5, Theorem; Lee, Theorem 21.17). Reuse Tau Ceti's smooth quotient
construction for discrete actions (`Geometry/Manifold/Instances/Quotient.lean`) in that
specialization.

**Checks.**
- ℤ acting on ℝ by translation is free and proper; the quotient is `S¹` and `ℝ → S¹` is a principal
  ℤ-bundle.
- The irrational linear flow of ℝ on `T²` is free but not proper; its orbit space is not Hausdorff,
  so properness cannot be dropped.
- The Hopf action of `Circle` on `S³` is free and proper with quotient `ℂP¹`; for `ℤ/n ⊂ Circle`
  the quotient is Tau Ceti's `LensSpace n ![1,1]`, and the quotient atlas agrees with the discrete
  quotient construction.
- The weighted action `λ·(z₁,z₂) = (λz₁, λ²z₂)` on `S³` is proper and locally free with stabilizer
  `ℤ/2` on the circle `z₁ = 0`; the slice there has a nontrivial finite isotropy action.
- `SO(3)/SO(2) ≅ S²` with `SO(3) → S²` the principal `SO(2)`-bundle of oriented orthonormal frames.

*Needs:* B1.1; LieGroups Layer 2; Tau Ceti `Geometry/Manifold/Instances/Quotient.lean`;
DifferentialGeometry 12.1 (an invariant metric for the slice).

### B1.5 Ehresmann connections and Ehresmann's fibration theorem

For a smooth surjective submersion `π:P→B` between these manifolds, define an Ehresmann connection
as a distribution H complementary to `ker(mfderiv π)` at every point, with native
`TauCeti.IsContMDiffDistribution` from DifferentialGeometry Layer 4 (Kolář–Michor–Slovák §9.3).
Construct H as the orthogonal complement of B1.0's kernel distribution for an auxiliary metric from
DifferentialGeometry 12.1. Specialize this same construction to smooth fibre bundles. Develop
pullback, restriction and local horizontal lifts; transport exists on its maximal interval and need
not be complete for an arbitrary connection (Kolář–Michor–Slovák, Theorem 9.8 and §9.9). Prove
Ehresmann's fibration theorem: a proper surjective submersion with connected base is a locally
trivial smooth fibre bundle with model fibre `π⁻¹(b₀)` for one fixed b₀ (Kolář–Michor–Slovák,
Lemma 9.2). Each fibre carries B1.0's regular-fibre manifold structure, with tangent `ker(dπ)`.
Horizontal lifts over compact inverse images give path-transport diffeomorphisms `π⁻¹(b)≃π⁻¹(b₀)`
for each b, by a chosen piecewise smooth path. Around each b choose a coordinate ball U and
transport along its radial paths to obtain `π⁻¹(U)≃U×π⁻¹(b)`, smoothly in both variables. Compose
with the fixed-fibre comparison to obtain the bundle charts and prove its projection identity and
smooth comparison maps. For disconnected B construct this bundle separately on each connected
component; different components need not have diffeomorphic fibres. IntegrableSystems consumes this
local trivialization.

**Checks.**
- On the trivial bundle `M × F` the product connection has horizontal lifts constant in the fibre
  coordinate; transport is the identity of F.
- On `ℝ × ℝ → ℝ` the connection with horizontal field `∂_x + y²∂_y` has transport `y ↦ y/(1−xy)`
  from 0 to x, undefined at `x = 1/y`; completeness fails, so the maximal-interval statement is the
  general one.
- The first-coordinate projection `ℝ² ∖ {0} → ℝ` is a non-proper surjective submersion whose fibre
  over 0 is `ℝ ∖ {0}` and over 1 is ℝ; it is not locally trivial, so properness cannot be dropped.
- A proper submersion over the disconnected base `ℝ ⊔ ℝ` with fibre a point over the first copy and
  two points over the second is a fibre bundle over each component with different fibres.

*Needs:* B1.0, B1.1; DifferentialGeometry 4.1, 12.1; Tau Ceti `IsContMDiffDistribution`.

### Examples

The trivial bundle `M × G` and the Hopf circle bundle `S³ → ℂP¹`. Consume ComplexKahlerGeometry
K7.1's projective charts and their underlying real structure (the chart construction does not
depend on B2's associated bundles); prove the Hopf projection/chart comparison here, with the
transition function `g₀₁([1:z]) = z̄/|z|` of B1.3. The frame-bundle example belongs to B2.

### Dependencies

B1.0 uses Tau Ceti's zero-section manifolds and Mathlib's submersion normal form only. B1.1–B1.3
use B1.0 and Mathlib's fibre bundles. B1.4 uses B1.1, LieGroups Layer 2 and DifferentialGeometry
12.1. B1.5 uses B1.0, B1.1, DifferentialGeometry Layer 4 and 12.1. Nothing in B1 uses B2–B8.

## B2. Associated bundles, frames and square-integrable sections

### B2.1 Associated bundles and complex structures

Construct `P×_G V` and its smooth local trivializations, section/equivariant-map correspondence,
functoriality and pullback comparisons (Kolář–Michor–Slovák §§10.7, 10.9, 10.11, 10.12).
Construct smooth finite-rank tensor, dual, exterior-power, direct-sum and Hom bundles and prove that
their associated-bundle descriptions agree. Use existing Mathlib constructions for dual and Hom
rather than introduce replacements.

Complex bundles over a real base are real smooth vector bundles with fibrewise complex structure and
complex-linear transition maps; supply the compatible `VectorBundle ℂ` structures without asserting
a complex structure on the base. Construct complexification of real bundles and the decomposition
maps needed for complex tangent spaces. For finite-rank real bundles V and D, construct the smooth
complex-linear comparison `(V_ℂ)*⊗_ℂ D_ℂ ≃ (V*⊗_ℝ D)_ℂ`, with complex-linear dual on the left and
real dual on the right. Fix the dual map by `(z⊗ℓ)(w⊗v)=zwℓ(v)` and use the complexified tensor map
for D. On the complex dual define conjugation by `(κξ)(u)=conj(ξ(κu))`. Prove inverse, chart
compatibility, conjugation equivariance, real-inclusion compatibility and naturality under bundle
isomorphisms and base diffeomorphisms.
[ComplexKahlerGeometry K5a](../ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality)
applies this generic comparison to its real density line, including its absolute-Jacobian
transition and pushforward laws; B2 does not construct that line. Build Hermitian bundle metrics
with their real metric comparison, positivity, local matrices, dual/tensor and pullback APIs.

**Checks.**
- The bundle associated to the trivial representation is `M × V`, and a section is a function
  `M → V`; the equivariant-map description gives constant-on-fibres functions `u(pg) = u(p)`.
- For the frame bundle of a vector bundle E with the standard representation, `[f,v] ↦ f(v)` is
  an isomorphism `P ×_G ℝⁿ ≅ E`; with the convention `(p·g,v) ~ (p,ρ(g)⁻¹v)` it would not be well
  defined.
- For `V = D = ℝ` (rank one) the comparison is the identity of ℂ with `(z⊗ℓ)(w⊗v) = zwℓ(v)`; the
  conjugation `κ` is conjugate-linear and involutive, and `κ` composed with the real inclusion is the
  real inclusion.
- For the trivial complex line, the Hermitian metric `h(u,v) = ū v` is conjugate-linear in the
  first slot, as Mathlib's `inner`; its real part is the Euclidean metric of `ℝ²`.

*Needs:* B1.1–B1.3; Mathlib `VectorBundle`, `ContMDiffVectorBundle`.

### B2.2 Fibre metrics and the Hilbert space of square-integrable sections

For the analytic section theory work over `[RCLike 𝕜]` (both real Riemannian and complex Hermitian
fibres) with **finite-rank** bundles, with continuous positive-definite fibre products compatible
with the bundle topology. Metrics are explicit data h on fixed topological-module fibres, with
`h.inner x : E x →L⋆[𝕜] E x →L[𝕜] 𝕜`, Hermitian symmetry, positive definiteness and continuous
dependence in charts. Prove the induced norm `sqrt(re(h.inner x v v))` gives the original fibre
topology, and parametrize `L²(E,h,μ)` by h rather than changing ambient fibre instances. Smooth
metrics are used for smooth unitary frames; only continuity is needed for the Hilbert construction.
Products are conjugate-linear in the first slot, as in Mathlib's `inner`. Consume
`IsContinuousRiemannianBundle`/`Bundle.ContinuousRiemannianMetric` in the real case; build their
complex Hermitian counterparts and real-part comparison. Construct the equivalence of real
continuous fibre-metric data with native `Bundle.ContinuousRiemannianMetric F E`, proving chartwise joint
continuity is equivalent to continuity in its Hom-bundle and positive metric unit balls are von
Neumann bounded in finite dimension. Preserve the given fibre topology.

Fix `[MeasurableSpace M] [BorelSpace M]` and a Borel measure μ. Define a section s to be
a.e.-strongly measurable when its coordinates in every atlas trivialization e are
`AEStronglyMeasurable` for `μ.restrict e.baseSet`; extend coordinates by zero outside that chart.
Prove independence under continuous linear bundle transitions, using a countable atlas, and
equivalence with `AEMeasurable (fun x ↦ (⟨x,s x⟩ : TotalSpace F E))` when the compatible Borel
total-space structure is installed. Define section support as `closure {x | s x ≠ 0}`. The `L²`
carrier consists of these sections with `MemLp (fun x ↦ ‖s x‖_h) 2 μ`, modulo a.e. equality. Prove
global norm a.e. measurability from a countable subatlas, and its equivalence to finite
`∫⁻ x, ‖s x‖ₑ,h^2 ∂μ`; the MemLp formulation retains measurability explicitly. Construct its
vector-space, norm and inner-product structures with `⟪s,t⟫=∫ x,⟪s x,t x⟫∂μ`; prove
well-definedness, Cauchy–Schwarz, completeness and identification with Mathlib's
`MeasureTheory.Lp` in the trivial bundle, using `MeasureTheory.L2.inner_def` for that comparison.
Finite-dimensionality of the model fibre F is a hypothesis in the signature of the completeness
theorem, of the Hilbert-space structure and of the trivial-bundle isometry, not only of an ambient
context. Completeness for an arbitrary measure holds in finite rank because each fibre norm is
equivalent, uniformly on compact chart domains, to a norm on the complete model fibre.

Fix the unitary chart model as `EuclideanSpace 𝕜 (Fin n)` with its standard inner product; compare
any original finite-dimensional bundle model by a fixed linear equivalence. Build unitary local
frames by Gram–Schmidt on `Bundle.Trivialization.localFrame` and prove smoothness for smooth metrics,
continuity for continuous metrics. For a unitary chart, prove the coordinate map is a linear
isometry between the restricted `L²` section space and `Lp (EuclideanSpace 𝕜 (Fin n)) 2 (μ.restrict U)`,
including the inverse. For a general frame assert bounded coordinate equivalence only on a
relatively compact open U whose closure lies in the frame domain; prove uniform bounds for the
metric matrix and its inverse there. Do not assert that arbitrary noncompact frame coordinates give
bounded maps. The trivial-bundle comparison is globally `L²(Bundle.Trivial M F,μ) ≃ₗᵢ[𝕜] Lp F 2 μ`
for its standard product metric.

Under `IsLocallyFiniteMeasure μ`, prove density of compactly supported smooth sections by
localization in relatively compact smooth frames with metric bounds and partitions of unity,
consuming `MeasureTheory.Lp.dense_hasCompactSupport_contDiff` and
`MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le` in the scalar/model-fibre case. The base is the
second-countable finite-dimensional smooth manifold above. The map from smooth compactly supported
sections has zero kernel precisely up to a.e. equality; under `IsOpenPosMeasure μ`, prove it is
injective and `L²` is its Hilbert completion with the integral norm. Without that hypothesis use
the quotient by the zero seminorm before completion. Prove separability using a countable atlas and
the finite-dimensional coefficient Lp separability theorem.

**Checks.**
- For F the finitely supported real sequences with the ℓ² product, a one-point base with unit mass
  gives `L² ≅ Lp F 2 μ ≅ F`, which is not complete; the completeness theorem is false without the
  finite-rank hypothesis, which is why it appears in the signature.
- For the trivial line bundle over ℝ with Lebesgue measure, the carrier is `L²(ℝ)` and the
  comparison isometry is the identity on representatives.
- In the frame `e, 2e` of the trivial rank-2 bundle with the standard metric, the coordinate map
  multiplies the norm of the second coordinate by 2, so it is bounded but not an isometry; the
  Gram–Schmidt frame restores the isometry.
- For μ the zero measure every section is a.e. zero, `L² = 0`, and the smooth-section map has
  nonzero kernel; `IsOpenPosMeasure` excludes this.
- The a.e.-measurability of a section is independent of the atlas: for the Möbius line bundle over
  `S¹`, a section measurable in one two-chart atlas is measurable in any other.

*Needs:* B2.1; Mathlib `Bundle.ContinuousRiemannianMetric`, `MeasureTheory.Lp`, `MeasureTheory.L2.inner_def`,
`Bundle.Trivialization.localFrame`, `MeasureTheory.Lp.dense_hasCompactSupport_contDiff`,
`MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`.

### B2.3 Operations on square-integrable sections

Supply restriction to measurable sets with restricted measures, extension by zero, their
isometry/projection identities and the orthogonal splitting over U and its complement. Restriction
of the smooth bundle to an open U means pullback along `Subtype.val`, with measure
`μ.comap Subtype.val`; use `MeasurableEmbedding.subtype_coe` and `map_comap_subtype_coe` to prove
`L²(E|_U,μ.comap (↑))≃ₗᵢ[𝕜]L²(E,μ.restrict U)`. Construct direct-sum isometries, dual/tensor
functoriality for bounded bundle maps and bounded multiplication by essentially bounded measurable
scalar functions, with operator bound `‖M_f‖≤essSup ‖f‖`, composition and adjoint `M_f*=M_(star f)`.
Smooth compactly supported domain formulas agree with these operators; unbounded multiplication
requires its explicitly defined dense domain and is not asserted to be bounded.

For continuous metrics h₀,h₁ on a compact base prove equivalence of `L²` norms. Construct the
positive fibre operator H characterized by `h₁(u,v)=h₀(Hu,v)` and the unitary metric-change map
`H^(1/2)` from h₁ to h₀. Work in local h₀-unitary frames and prove independence of that choice,
consuming finite-dimensional `CFC.sqrt` (`Matrix.PosSemidef.inv_sqrt`, `Matrix.PosSemidef.det_sqrt`
and the positive-operator calculus) and proving the continuous bundle transport/local matrix
comparison. For equivalent measures `ν=μ.withDensity w`, with measurable `w:M→ℝ≥0∞` and `0<w<∞`
μ-a.e., construct the unitary `s↦sqrt(w.toReal)s` from `L²(ν)` to `L²(μ)`, its inverse and integral
identities. Prove mutual absolute continuity from `0<w<∞` and transfer a.e. measurability/equality
between μ and ν before defining the class map. No boundedness of w or its inverse is required for
this unitary. Unweighted identity norm equivalence instead requires essential upper and lower
bounds.

Construct the conjugate-linear fibrewise Riesz bijection `u↦h.inner x u` to the continuous dual
bundle by finite dimension and positivity. Define the dual metric by the explicit formula
`h*(Ru,Rv)=h(v,u)`, where R is this conjugate-linear Riesz map; prove its continuity in dual
trivializations and its norm formula `‖φ‖_(h*)=sup_(‖u‖_h≤1) ‖φ u‖`. When consuming
`InnerProductSpace.toDual`/`ofCoreOfTopology`, use a metric-specific type copy of the fibre carrying
the induced inner product and the inherited topology, with an explicit identity transport back to
the fixed bundle. No global norm-instance change on E is part of the construction. The resulting
Riesz map is `≃ₗᵢ⋆[𝕜]` between those metric-specific Hilbert fibres, and its `L²` counterpart is
conjugate-linear. Bilinear integral evaluation identifies `L²(E*,h*,μ)` complex-linearly with
`StrongDual 𝕜 (L²(E,h,μ))`.

For real E use fibre `ℂ ⊗[ℝ] E x`. Give it the product topology transported through the
real/imaginary-part equivalence with `E x × E x`, and choose model `EuclideanSpace ℂ (Fin n)` for
real rank n after a fixed basis of the original model. Construct the complex scalar structure and
Hermitian product and prove compatibility with the complex bundle charts and existing real
complexification. Do not infer a complex inner product from Mathlib's real tensor-product one. Prove
the `L²` complexification identity using pairs `(s,t)` with `J(s,t)=(-t,s)`, product
`⟪(s,t),(s′,t′)⟫=⟪s,s′⟫+⟪t,t′⟫+i(⟪s,t′⟫−⟪t,s′⟫)` and squared norm `‖s‖²+‖t‖²`; compare the
fibrewise real/imaginary-part maps.

For a unitary bundle isomorphism A covering a `MeasurePreserving` diffeomorphism φ from (M,μ) to
(N,ν), construct the unitary from `L²(E,μ)` to `L²(E′,ν)` given by `(U_A s)(y)=A_(φ⁻¹y)(s(φ⁻¹y))`;
prove inverse, composition, a.e. transport and smooth compact-support compatibility. Its inverse is
`(U_A⁻¹t)(x)=A_x⁻¹(t(φ(x)))`, the pullback used by GeometricQuantization's flow operators.

**Checks.**
- For `h₁ = 4h₀` the fibre operator is `H = 4`, `H^(1/2) = 2`, and `‖2s‖²_(h₀) = 4‖s‖²_(h₀) = ‖s‖²_(h₁)`,
  so `s ↦ 2s` is unitary from `(L²,h₁)` to `(L²,h₀)`; the map `s ↦ s/2` would be its inverse, not
  the metric-change map.
- For `ν = μ.withDensity w`, `∫ |√w·s|² dμ = ∫ |s|² w dμ = ∫ |s|² dν`, so `s ↦ √w s` is an isometry
  from `L²(ν)` onto `L²(μ)`; for `w = 0` on a set of positive μ-measure the map is not surjective
  and `0 < w` is used.
- The multiplication operator by the indicator of a measurable set U is the orthogonal projection of
  the splitting over U and its complement, with norm 1 unless U is null.
- The dual of the standard metric on the trivial bundle is the standard metric, and the Riesz map
  sends `u` to `⟨u,·⟩`, conjugate-linearly: `R(iu) = −i R(u)`.
- For the real trivial line the complexification identity sends `(s,t)` to `s + it` with
  `‖s+it‖² = ‖s‖² + ‖t‖²`, and `J` is multiplication by i.
- For φ a rotation of `S¹` with its arc-length measure and A the identity of the trivial line,
  `U_A` is the Koopman operator, unitary with inverse the opposite rotation.

*Needs:* B2.2; Mathlib `CFC.sqrt`, `Matrix.PosSemidef.inv_sqrt`, `MeasurableEmbedding.subtype_coe`,
`InnerProductSpace.toDual`, `InnerProductSpace.ofCoreOfTopology`.

### B2.4 Measures from smooth densities

Construct the Borel measure associated with a smooth positive density, using local Lebesgue
densities and proving overlap independence and equality of its integral with DifferentialGeometry
5.5's density integral. Prove local finiteness and positivity on nonempty open sets. Compare with
`TauCeti.riemannianVolume` for Riemannian densities and construct the Liouville measure of a
symplectic form, agreeing with its oriented top-form integral. These are instances of the
measure-parametrized theory of B2.2–B2.3, not prerequisites silently supplied by a density.
ComplexKahlerGeometry K5 and GeometricQuantization Q2 consume this entire real/complex `L²`
construction; no complex structure on the base is needed.

**Checks.**
- The Lebesgue density on ℝⁿ gives Lebesgue measure.
- The Riemannian density of the round unit circle gives total mass `2π`, agreeing with
  DifferentialGeometry 12.5's `volume_circle`.
- The Liouville measure of `dx∧dy` on `ℝ²` is Lebesgue measure, and that of `2dx∧dy` is twice it;
  the orientation is irrelevant for the measure though not for the top-form integral.

*Needs:* DifferentialGeometry 5.5, 12.4; Tau Ceti `riemannianVolume`.

### B2.5 Frame bundles, reductions and the adjoint bundle

Construct real rank-n and complex rank-n frame bundles with `Matrix.GeneralLinearGroup (Fin n) ℝ`
and `Matrix.GeneralLinearGroup (Fin n) ℂ`, the latter regarded as a real Lie group. Pin the matrix
normed-ring instances to `Matrix.linftyOpNormedRing` and the topological-space instances to
`Matrix.linftyOpTopologicalSpace`, for both real and complex matrices, as in Tau Ceti's native
general-linear Lie construction. Prove the identity homeomorphism with the default entrywise matrix
topology by finite-dimensional norm equivalence, and its induced units-level homeomorphism on
`Matrix.GeneralLinearGroup (Fin n) 𝕜`, for `𝕜=ℝ,ℂ`. Prove compatibility of multiplication,
inversion, frame evaluation and manifold charts. The right action is `f·g=f∘g`; recovery is
`[f,v]↦f(v)`. Prove an equivalence of **groupoids of isomorphisms** between the corresponding
smooth vector bundles and principal GL_n bundles. Orthogonal, unitary and symplectic reductions
encode the corresponding nondegenerate fibrewise structures; give their transition criteria.
Positive metrics exist by partitions of unity. Define reduction of structure group to a closed Lie
subgroup as a principal subbundle inducing the original bundle; reductions to a closed subgroup H
correspond to sections of the associated `G/H`-bundle (Kolář–Michor–Slovák, Theorem 10.13). Also
define reductions to immersed Lie subgroups, with the reduced bundle carrying its own manifold
structure and an injective immersed map into P; no subspace topology is imposed on it. Define
extension along a smooth group homomorphism as the associated principal bundle. Prove
functoriality, pullback and extension/reduction identities. Circle tensor and dual bundles are
extensions along multiplication and inversion.

Construct `ad(P)` with its pointwise Lie bracket. An Ad-invariant bilinear form on the structure
Lie algebra induces a well-defined smooth fibre pairing on `ad(P)`; prove nondegeneracy when
assumed and its pullback compatibility. All equivalences expose maps on morphisms, unit/counit and
naturality. The tangent/frame example uses Mathlib's tangent bundle and metric interfaces, with no
competing tangent norms.

**Checks.**
- The frame bundle of the trivial bundle `M × ℝⁿ` is `M × GL_n(ℝ)`, and `[f,v] ↦ f(v)` recovers
  `M × ℝⁿ`; the left action `g·f = g∘f` would not commute with the recovery map.
- An orthogonal reduction of the frame bundle of E is the same as a Riemannian metric on E; the
  oriented orthonormal frame bundle of the round `S²` is `SO(3) → S²`, a reduction of its frame
  bundle to `SO(2)`.
- For G abelian, `ad(P)` is the trivial bundle `M × 𝔤` with zero bracket; for the frame bundle of E,
  `ad(P) ≅ End(E)` with the commutator bracket.
- The negative of the Killing form of `𝔰𝔲(2)` is Ad-invariant and positive definite, so it induces
  a positive fibre pairing on `ad(P)` for every `SU(2)`-bundle; the Killing form itself is negative
  definite and is excluded from B8's positivity hypothesis.
- The extension of a circle bundle along `z ↦ z²` is its tensor square, with class `2c₁`; along
  `z ↦ z⁻¹` it is the dual, with class `−c₁` (B6.2).

*Needs:* B1.1–B1.4, B2.1; Mathlib `Matrix.GeneralLinearGroup`, `Matrix.linftyOpNormedRing`;
LieGroups Layer 4 for immersed subgroups.

### Examples

The frame bundle of the tangent bundle with its orthonormal reductions; the trivial bundle with a
non-standard metric; the Möbius line bundle over `S¹` with the Lebesgue measure of arc length, whose
`L²` sections are the antiperiodic square-integrable functions on ℝ with period `2π`.

### Dependencies

B2.1 and B2.5 use B1. B2.2–B2.3 use B2.1, Mathlib's `Lp` and the pinned matrix calculus; they use no
connection. B2.4 uses DifferentialGeometry Layer 5 and 12.4.

## B3. Connections and covariant differentiation

### B3.1 Principal connections

Use DifferentialGeometry's `SmoothBundleForm` carrier and its fixed-coefficient specialization for
the principal Lie-algebra-valued form. Use its `bracketWedge` normalization and `CurvatureForm` for
induced endomorphism-valued curvature. Define connections by reproduction `ω(A#)=A` and
equivariance `R_g*ω=Ad_(g⁻¹)ω` (Freed, equations (1.9)–(1.10); Kobayashi–Nomizu I, Ch. II §1;
Kolář–Michor–Slovák §11.1), and equivalently by equivariant horizontal complements using B1.5's
native smooth-distribution carrier. Prove vertical-fibre identification, horizontal projections,
smoothness, pullback, restriction and isomorphism transport. The difference of two connections is
a basic `ad(P)`-valued one-form; build the affine action of `Ω¹(M;ad(P))`, addition/difference
identities and existence by locally finite partitions of unity (Kolář–Michor–Slovák, Lemma 11.3;
Kobayashi–Nomizu I, Ch. II §2). Prove the local-potential transformation `A′=Ad_(g⁻¹)A + g⁻¹dg` for
`s′=s·g` and the inverse gluing construction from local potentials satisfying it
(Kolář–Michor–Slovák §11.4), and the left Maurer–Cartan equation with the normalization above.

**Checks.**
- On the trivial bundle `M × G` the pullback of the Maurer–Cartan form by the second projection is
  a connection: `ω(A#) = A` since `A#_(x,g) = (0, dL_g A)`, and it is flat.
- For G abelian the transformation law is `A′ = A + g⁻¹dg`; for the circle and `g = exp(iφ)` it is
  `A′ = A + i dφ`, so in the real identification the potential changes by `dφ`.
- The Hopf connection `ω = Im(z̄₁dz₁ + z̄₂dz₂)` on `S³` satisfies `ω(X_1) = Im(z̄·iz) = |z|² = 1`
  for the fundamental field of `1 ∈ ℝ`, and is `Circle`-invariant; the form `Im(z₁dz̄₁ + z₂dz̄₂)`
  gives `−1` and is excluded.
- The difference of two connections vanishes on vertical vectors and is equivariant, hence a
  section of `T*M ⊗ ad(P)`; the sum of two connections is not a connection (it reproduces `2A`).

*Needs:* B1.5, B2.5; DifferentialGeometry Layer 0, Layer 1; LieGroups Layer 1.

### B3.2 The Atiyah sequence

Construct the smooth vector bundle `TP/G` and identify its sections with G-invariant vector fields
on P. Build the exact Atiyah sequence `0 → ad(P) → TP/G → TM → 0`; use `ξ ↦ −V_ξ` for the first
map, where `V_ξ(p)=ξ(p)#`, so its pointwise bracket agrees with the invariant-field bracket.
Connections correspond to smooth splittings `s(X)=X^h`; for the injection `j(ξ)=−V_ξ` prove
`ω(j(ξ))=−ξ` and `[s(X),s(Y)]−s([X,Y])=j(F(X,Y))`. LieGroupoidsPoisson owns the resulting Lie
algebroid structure and integration by the gauge groupoid. Prove the horizontal-field identity
`[X^h,Y^h]=[X,Y]^h−V_(F(X,Y))`.

**Checks.**
- For the trivial bundle, `TP/G = TM ⊕ (M × 𝔤)` and the sequence splits by the trivial connection.
- For M a point and `P = G`, an equivariant `ξ : G → 𝔤` has `ξ(g) = Ad(g⁻¹)ξ(e)` and `V_ξ` is the
  right-invariant field of `ξ(e)`; since right-invariant fields satisfy `[ξ^R,η^R] = −[ξ,η]^R`, one
  gets `[V_ξ,V_η] = −V_[ξ,η]`, so `j = −V` preserves brackets and `V` itself does not.
- For the Hopf connection, `[X^h,Y^h] − [X,Y]^h = −V_(F(X,Y))` with `F = ½ dvol` on the unit `S²`
  (B8 Checks), nonzero, so the horizontal distribution is not involutive.

*Needs:* B3.1; Mathlib `VectorField.mlieBracket`.

### B3.3 Induced connections on associated bundles

Induce a connection on each associated bundle and identify it with Mathlib's `CovariantDerivative`
(Kolář–Michor–Slovák §§11.8, 11.10). Prove `∇=d+ρ_*(A)` in local frames, complex linearity for
complex representations, and agreement with the frame-bundle description. Develop induced
dual/tensor/exterior/Hom connections and their pairing rules. For a vector fixed by the
structure-group representation, construct its associated section and prove it is parallel for every
induced principal connection. Apply this to invariant tensors as well as vectors, with the explicit
local equivariance and covariant-derivative comparison. Construct metric- and symplectic-compatible
connections by the corresponding principal reductions. Use Mathlib's `CovariantDerivative.leviCivitaConnection` and
Tau Ceti's regularity results for Levi-Civita; this roadmap supplies its frame-bundle description.

**Checks.**
- On the trivial circle bundle with real potential a, the line of the dual character `z ↦ z⁻¹` has
  induced operator `∇σ = dσ − ia σ` and curvature `−iF`, as the Conventions require; the standard
  character gives `dσ + ia σ` and curvature `iF`.
- The induced connection on `E* ⊗ E = End(E)` satisfies `∇(id) = 0`, the identity being fixed by
  the representation.
- The Levi-Civita connection is the connection induced from the unique torsion-free connection on
  the orthonormal frame bundle; the induced metric on `TM` is parallel.
- A metric-compatible connection on a real line bundle has potentials in `𝔬(1) = 0`, so it is flat;
  a non-compatible connection `d + a` with `a ≠ 0` is excluded by the `O(1)`-reduction.

*Needs:* B2.1, B2.5, B3.1; Mathlib `CovariantDerivative`, `CovariantDerivative.leviCivitaConnection`.

### Examples

The trivial connection and its flatness, the Hopf connection with `ω(X_1) = 1`, the Levi-Civita
connection of the round sphere through `SO(3) → S²`.

### Dependencies

B3 uses B1–B2, DifferentialGeometry Layers 0–1 and 4, and LieGroups Layers 0–1. It uses nothing from
B4–B8.

## B4. Curvature and gauge transformations

### B4.1 Curvature and the exterior covariant derivative

Prove curvature horizontal and equivariant, descending to `Ω²(M;ad(P))` (Freed, equations
(1.13)–(1.15); Kobayashi–Nomizu I, Ch. II §5; Kolář–Michor–Slovák §11.2). Build the exterior
covariant derivative `d_∇` here on the generic bundle forms, its graded Leibniz rule and
`d_∇²α=ρ_*(F)∧α` (Kolář–Michor–Slovák §§11.5, 11.13 and Theorem 11.15). For the Ad-invariant
fibre pairing B, define the wedge pairing on adjoint-valued forms and prove
`d B(α∧β)=B(d_Aα∧β)+(-1)^degα B(α∧d_Aβ)`; combine with Stokes for the integration-by-parts identity
used by HamiltonianReduction R5. Identify the endomorphism curvature with Tau Ceti's
`CovariantDerivative.curvatureOperator`: `∇_X∇_Yσ−∇_Y∇_Xσ−∇_[X,Y]σ=ρ_*(F(X,Y))σ`. Prove the
structure equation, Bianchi `d_AF=0` (Freed, equation (1.16)), pullback, dual/tensor curvature,
and `F_(A+a)=F_A+d_Aa+½[a∧a]`.

**Checks.**
- For G abelian the bracket term vanishes and `F_(A+a) = F_A + da`; for the Hopf connection
  `F = dω` descends to `½ dvol` on the unit `S²`, with `∫F = 2π`.
- The Maurer–Cartan form on `G → pt` has `dθ + ½[θ∧θ] = 0`, so its curvature vanishes; dropping
  the ½ (with the determinant-style wedge) would give `dθ + [θ∧θ] = ½[θ∧θ] ≠ 0` on a non-abelian G.
- On a flat bundle `d_∇² = 0`; on the Hopf line bundle `d_∇²σ = −iF σ`, nonzero.
- Integration by parts: on a closed M, `∫ B(d_Aα∧β) = (−1)^(deg α + 1) ∫ B(α∧d_Aβ)`; the sign is
  tested on `α` a 0-form and `β` an `(n−1)`-form, where it reads `∫ B(d_Aα∧β) = −∫ B(α∧d_Aβ)`.

*Needs:* B3.1, B3.3; DifferentialGeometry Layer 1, 5.3; Tau Ceti `CovariantDerivative.curvatureOperator`.

### B4.2 The gauge group

The gauge group is the group of smooth equivariant bundle automorphisms covering the identity,
identified with `u:P→G`, `u(pg)=g⁻¹u(p)g`, acting by `p↦p u(p)` (Freed, equation (1.8);
Kolář–Michor–Slovák §10.14). The left action on associated sections is
`f↦ρ(u)f=(Φ_(u⁻¹))^*f`; prove covariance with the inverse-pullback connection action. Prove its
actions on associated sections, connections and curvature, local formulas, composition, stabilizers
and connection-preserving subgroup. For the pullback action by `u=exp(tξ)`, differentiate to
`δA=d_Aξ`; the inverse-pullback left action has generator `−d_Aξ`. For equivariant adjoint
sections prove `[V_ξ,V_η]=−V_[ξ,η]`, `[−V_ξ,−V_η]=−V_[ξ,η]`, and `Φ_u∘Φ_v=Φ_(uv)` for
`Φ_u(p)=p u(p)`; distinguish the derivative of this left evaluation action from the
bracket-preserving Atiyah injection j. These are groups of smooth maps; Sobolev completions and
Coulomb slices for surface gauge reduction are HamiltonianReduction R5's work. Construct
connection-preserving bundle maps covering base diffeomorphisms and their coherent
pullback/composition identities, for GeometricQuantization.

**Checks.**
- `Φ_u∘Φ_v(p) = p·v(p)·u(p·v(p)) = p·v(p)·v(p)⁻¹u(p)v(p) = Φ_(uv)(p)`, and
  `Φ_u(pg) = pg·g⁻¹u(p)g = Φ_u(p)g`; with the law `u(pg) = g u(p) g⁻¹` instead, `Φ_u` would not be
  equivariant for non-abelian G.
- For the trivial circle bundle and `u = exp(iφ)`, the pullback action sends `A` to `A + i dφ`, and
  for `u = exp(tξ)` the derivative is `dξ = d_Aξ`; the inverse-pullback action gives `A − i dφ`
  and generator `−dξ`.
- A constant central `u` acts trivially on connections and curvature; the stabilizer of a connection
  is the centralizer of its holonomy group (B5.2), which for an irreducible connection is the
  centre of G.
- On M a point, `[V_ξ,V_η] = −V_[ξ,η]` is the right-invariant bracket identity of B3.2.

*Needs:* B3.1–B3.3, B4.1.

### Examples

Gauge transformations of the trivial circle bundle over `T²` and their action on the flat
connections `a dx + b dy`: `A ↦ A + i dφ` changes `(a,b)` by the periods of `dφ`, which lie in
`2πℤ²`, so the gauge classes of flat connections form `(ℝ/2πℤ)²` (B6.5).

### Dependencies

B4 uses B3, DifferentialGeometry Layers 1 and 5, and Tau Ceti's curvature operator.

## B5. Parallel transport, holonomy, and flat bundles

### B5.0 Horizontal lifts and the group equation

Construct unique horizontal lifts of piecewise `C¹` paths with prescribed initial point, throughout
each compact path interval (Kobayashi–Nomizu I, Ch. II §3; Kolář–Michor–Slovák, Theorem 11.6).
Use local trivializations and complete Lie-group evolution for the time-dependent group equation;
arbitrary Ehresmann connections do not inherit this completeness. Develop identity, concatenation,
reversal, reparametrization, equivariance and pullback. Compare associated transport with Tau Ceti's
covariant derivative along curves. Prove smooth dependence for smooth finite-dimensional families on
a common interval. Consume Tau Ceti's `contMDiffOn_maximalIntegralCurve` and
`exists_contDiffAt_localFlow` on the parameter- and time-augmented field, with DifferentialGeometry
3.5's manifold-flow interface. Prove local chart extension and uniqueness-based patching across the
compact interval. Prove complete evolution for the group equation `ġ=−dR_g(A(γ̇(t)))`: on a compact
time interval the coefficient has compact range, so right translation of a fixed identity
neighbourhood gives a uniform local existence time; finite iteration covers the interval. This is a
B5 target, not an assumed LieGroups theorem. The autonomous Picard theorem in
`Analysis/ODE/SmoothParameter.lean` requires a zero-field base parameter; use it only after time
rescaling supplies that hypothesis, not directly on an augmented field whose time component is 1.

**Checks.**
- With `p = s(γ)g` horizontal, `Ad(g⁻¹)A(γ̇) + g⁻¹ġ = 0` gives `ġ = −dR_g(A(γ̇))`; the equation
  `ġ = dR_g(A(γ̇))` would make `s(γ)g` horizontal for `−ω`.
- For the trivial circle bundle over `S¹` with constant potential `a dθ`, the lift from `(0,1)`
  is `θ ↦ (θ, exp(−iaθ))`, and the transport around the loop multiplies the fibre by `exp(−2πia)`;
  the opposite sign convention would give `exp(2πia)`.
- Reversal: transport along the reversed path is the inverse map; concatenation composes in
  traversal order, `T_(γ followed by η) = T_η ∘ T_γ`.
- For the Ehresmann connection `∂_x + y²∂_y` of B1.5 the lift leaves every compact set in finite
  time, so the completeness statement is specific to principal connections.

*Needs:* B3.1, B3.3; Tau Ceti `contMDiffOn_maximalIntegralCurve`, `exists_contDiffAt_localFlow`;
DifferentialGeometry 3.5; LieGroups Layer 0.

### B5.1 Reconstructing connections from smooth transport

For a fixed smooth finite-rank real or complex vector bundle E→M, construct the inverse dictionary
from smooth transport to a smooth connection (Schreiber–Waldorf, Proposition 4.7 with its proof in
Appendix B.4, and Theorem 5.8). Keep the base real and finite-dimensional; for complex fibres use
their real smooth structure and complex-linear fibre maps. The data and compatibility conditions
below are part of the theorem.

Use smooth paths with sitting instants, constant near both ends, and smooth endpoint-fixed thin
homotopies whose differential has rank at most one. Construct the thin path groupoid: objects are
points of M, arrows are thin classes, and composition follows traversal order. Prove identity,
associativity and inverse via the explicit thin homotopies, with reversal and sitting-instant
reparametrizations. This is a smooth-path refinement of the ordinary fundamental groupoid, with a
comparison functor to it.

Transport assigns the actual fibre `E_x` to x and a continuous linear equivalence `T_γ:E_x→E_y` to
each arrow γ:x→y. Require `T_constant=id` and `T_(γ followed by η)=T_η∘T_γ`. Specify smoothness in
finite-dimensional families: for every open `U⊂ℝ^k` and smooth family `c:U×[0,1]→M` of
sitting-instant paths, with locally common sitting collars, the matrices of `T_(c_u)` in endpoint
bundle frames vary smoothly with u wherever those frames are defined. Prove independence of the
chosen frames, restriction and pullback compatibility. Include families with varying endpoints;
based-loop smoothness alone is not the stated hypothesis. No first-jet-locality axiom is imposed on
this data.

In a bundle frame and base chart, choose a fixed smooth sitting function ρ with ρ=0 near 0 and ρ=1
near 1, and put `γ_(x,v,t)(r)=chart⁻¹(chart(x)+t ρ(r) v)` on its local domain. Let `P(x,v,t)` be
its transport matrix, so `P(x,v,0)=Id`. Construct `A_x(v)=−∂_t P(x,v,t)|_(t=0)`. Prove independence
from the sitting function and the chart curve with prescribed initial velocity, linearity in v and
smoothness in x. Own the finite-family first-variation lemmas needed for these assertions:
reparametrization and thin invariance remove pauses and backtracking, and the smooth transport
around a small two-parameter triangle is the identity when either side parameter vanishes, so its
first variation on the diagonal is zero. Use this estimate and the composition law to prove
additivity; prove scalar homogeneity and the general same-initial-velocity comparison. These are
construction targets, rather than assumptions about a path-space derivative.

If the new frame is `e′=e g`, prove `P′_γ=g(y)⁻¹ P_γ g(x)` and `A′=g⁻¹ A g+g⁻¹ dg`. Glue these
local forms by B3.1's local-potential construction to a native `CovariantDerivative`, with
`∇=d+A`. On complex bundles first use the real native operator and prove the additional
complex-linearity law. Recover its derivative from transport:

`(∇_v σ)_x = d/dt|_0 [T_(γ|[0,t])⁻¹ σ(γ(t))]`,

where `γ(0)=x`, `γ′(0)=v` and the short segment is smoothly flattened at its ends; t may have
either sign. Prove that the expression depends only on v and the section's first jet. Prove
additivity, the scalar Leibniz rule and agreement with the existing covariant derivative along
curves; on tangent bundles use the native pulled-back-field comparison. Establish the general bundle
version by local trivializations on the actual pullback bundle. The native bundled operator accepts
arbitrary raw sections but its axioms constrain differentiable inputs. State uniqueness on smooth
local sections and differentiable section germs; extensional equality on all raw sections requires
the same chosen extension convention at nondifferentiable inputs.

Prove the two inverse constructions. The reconstructed connection's parallel-transport ODE has
precisely T as its solution, by differentiating short segments and using composition; uniqueness on
each compact interval identifies the transports. Conversely, reconstructing the forward transport of
a connection recovers its local potentials and its operator on differentiable germs. Prove
naturality under base maps and bundle isomorphisms. A smooth bundle map intertwines all transports
iff it is connection-preserving; include noninvertible linear maps and specialize to the
isomorphism groupoids. Metrics are preserved by all transports iff the connection is
metric-compatible; give the real and Hermitian versions. Ordinary endpoint-fixed homotopy invariance
is the additional flatness condition, proved by the curvature/infinitesimal-holonomy comparison.

Schreiber–Waldorf's Proposition 4.7 and Appendix B supply the local smooth-functor/one-form
construction and its curve-choice lemmas; apply it to the real Lie groups `GL_n(ℝ)` and `GL_n(ℂ)`
and the frame bundle of B2.5. Their Theorem 5.8 treats Hermitian/unitary bundles; prove the
unrestricted real/complex fixed-bundle forms by the frame-group construction above.

**Checks.**
- The trivial flat transport `P ≡ Id` reconstructs `A = 0` and `∇ = d`.
- For a constant matrix potential A on the trivial bundle, `P(x,v,t) = exp(−tA(v))`, so
  `−∂_tP|_0 = A(v)`; the convention `A = +∂_tP` would reconstruct `−A`.
- Inverse-transport derivative sign: for `P(t) = exp(−tA)` and `σ(t) = σ₀ + tw`,
  `d/dt|_0 P(t)⁻¹σ(t) = d/dt|_0 exp(tA)(σ₀ + tw) = w + Aσ₀`, which is `(∇_v σ)` for `∇ = d + A`; the
  opposite sign convention would give `w − Aσ₀`.
- Changing the frame by a nonconstant g gives `A′ = g⁻¹Ag + g⁻¹dg`; the flat transport in the
  frame `e g` has potential `g⁻¹dg ≠ 0`, so a reconstruction ignoring the frame term is wrong.
- For A skew-adjoint the transports `exp(−tA(v))` are isometries, and conversely isometric
  transport forces the reconstructed potential to be skew-adjoint.
- A path that pauses or backtracks is thinly homotopic to one that does not, and has the same
  transport; a transport functor sensitive to pauses violates thin invariance.
- On the tangent bundle, the reconstruction formula recovers the Levi-Civita covariant derivative
  along curves from its own parallel transport.

*Needs:* B2.5, B3.1, B3.3, B5.0; Mathlib `CovariantDerivative`, `HasDerivAt`; DifferentialGeometry
Layer 1.

### B5.2 Holonomy and flat connections

Define based holonomy with the convention above and its conjugation under change of fibre point
(Kolář–Michor–Slovák, Theorem 11.7 (1); Kobayashi–Nomizu I, Ch. II §4). Prove zero curvature iff
local parallel trivializations exist, applying DifferentialGeometry 4.3's Frobenius theorem to B1.5's
horizontal distribution (Kolář–Michor–Slovák §9.6 and Theorem 11.7 (7); Kobayashi–Nomizu I, Ch. II
§9). For flat connections extend transport to **continuous** paths by local parallel charts and
finite subdivision, prove independence of subdivision and agreement with piecewise `C¹` transport,
and prove invariance under continuous homotopies rel endpoints. Thus the flat principal-bundle
groupoid is equivalent to representations of Mathlib's `FundamentalGroupoid` in right G-torsors.
The arrow sends its source fibre to its target fibre. Prove the morphism/intertwiner
correspondence. On connected based M identify isomorphism classes with `Hom(π₁(M),G)/conjugacy`.
Construct the inverse from Tau Ceti's smooth universal cover, identifying its path model and right
deck action `[a]·[γ]=[γ.trans a]`. Define the quotient using the right π₁-action
`([a],g)·γ=([a]·γ,ρ(γ)⁻¹g)` and the principal action `[a,g]·h=[a,gh]`; prove the lifted γ ends at
`[a₀,ρ(γ)]`, giving holonomy ρ. Supply the adapter to the existing universal-cover representation.
Associated vector bundles give the linear equivalence.

Prove that the fundamental group of a connected, second-countable, locally path-connected and
locally simply connected space is countable: choose a countable cover by simply connected
path-connected opens, use the countably many path components of each pairwise intersection, and
subdivide loops to obtain a countable generating family. A connected second-countable manifold
satisfies the hypotheses, verified by sufficiently small convex coordinate neighbourhoods. This
topological theorem uses no metric, connection or holonomy; OperatorAlgebraDynamics and
LieGroupoidsPoisson consume it.

On a connected based M with a chosen point of P over the basepoint, construct the restricted
holonomy `H⁰` and full holonomy H with their immersed Lie-group topologies, using LieGroups'
`integralSubgroup` carrier. Prove the subgroup theorem used here: a subgroup connected by piecewise
`C¹` arcs is an immersed Lie subgroup (Kobayashi–Nomizu I, Appendix 4). Prove Ambrose–Singer:
`Lie(H⁰)` is the linear span of curvature values transported to the base point, and that span is
bracket closed (Kobayashi–Nomizu I, Theorem II.8.1; Kolář–Michor–Slovák, Theorem 11.7 (4) and
§9.11). Identify `H⁰` with the identity component of H in its immersed topology; construct
`π₁(M)→H/H⁰`, surjective, so the countability theorem above makes `H/H⁰` countable
(Kolář–Michor–Slovák, Theorem 11.7 (3)). Give the countable coset union its Lie-group topology.

Construct the connection-preserving immersed principal **H** reduction Q→M using B2.5's reduction
notion, with smooth inclusion Q→P and the restricted connection (Kobayashi–Nomizu I, Theorem
II.7.1; Kolář–Michor–Slovák, Theorem 11.7 (5)). Form the regular covering `M'=Q/H⁰→M` and prove its
deck-group identification with `H/H⁰`; for right-action conventions use the left deck action
`[h]·[q]=[q h⁻¹]`. Construct the principal `H⁰`-bundle Q→M' and its connection-preserving map
`q↦([q],q)` into the pullback of P to M'. After pullback to the universal cover, construct the
restricted-holonomy reduction there as well. Over M itself this reduction applies when `H=H⁰`, in
particular when M is simply connected. Prove the base-change and basepoint-conjugation comparisons
on these actual bundles. Closedness of holonomy in G is not asserted.

**Checks.**
- `hol_(pg) = g⁻¹hol_p g`: for the subdivided-loop formula, `p·a` replaces each `s_(i_0)`-coordinate
  by its conjugate, giving `a⁻¹(⋯)a`; the formula `g hol_p g⁻¹` would correspond to a left action.
- The flat connection `a dx + b dy` on the trivial circle bundle over `T²` has holonomy
  `exp(−2πia)` and `exp(−2πib)` around the two generators and trivial restricted holonomy;
  `Hom(ℤ²,Circle)/conj = T²` recovers `(a,b) mod ℤ²`.
- The Hopf connection has `F ≠ 0`, so it admits no local parallel trivialization, and
  Ambrose–Singer gives `Lie(H⁰) = ℝ`, `H⁰ = Circle`.
- A flat connection has `H⁰ = 1`, `Lie(H⁰) = 0 = span of curvature values`; the holonomy bundle Q is
  a covering of M (lens-space case in B7).
- Countability: `π₁ = ℤ²` for `T²`, `ℤ/n` for the lens space `L(n,1)`, trivial for `ℝⁿ`; the
  Hawaiian earring is compact, path-connected and second countable but not locally simply
  connected, and its fundamental group is uncountable, so the local hypothesis is used.
- On `S¹`, flat G-bundles up to isomorphism are `Hom(ℤ,G)/conj`, the conjugacy classes of G; for
  `G = ℤ/2` this gives the trivial bundle and the connected double cover of B1.3.
- The arcwise-connected subgroup theorem is needed because H need not be closed: for the flat
  connection on the trivial `T²`-bundle over `S¹` with holonomy `(e^(2πiα), e^(2πiβ))`, α, β, 1
  rationally independent, `H⁰` is trivial and H is a dense infinite cyclic subgroup of `T²`, an
  immersed 0-dimensional Lie subgroup that is not embedded.

*Needs:* B1.5, B2.5, B3.1, B4.1, B5.0; DifferentialGeometry 4.3; LieGroups Layer 4; Tau Ceti
`UniversalCover`; Mathlib `FundamentalGroupoid`, `FundamentalGroup`.

### Examples

Flat torus connections, circle bundles with prescribed loop holonomy, the trivial bundle with
nontrivial holonomy `exp(−2πia)`, and the lens-space reductions of B7.

### Dependencies

B5.0 uses B3 and Tau Ceti's flow theory; B5.1 uses B2.5, B3 and B5.0; B5.2 uses B1.5, B3–B4,
B5.0, DifferentialGeometry 4.3, LieGroups Layer 4 and Tau Ceti's universal cover. The countability
theorem uses only point-set topology.

## B6. Circle bundles, integral classes, and flat ambiguity

### B6.0 Smooth good covers

Define `SmoothGoodCover I` as a locally finite indexed open cover together with, for every
nonempty finite set of indices whose intersection W is nonempty, a chosen centre in W and a smooth
map `ℝ×W→W` equal to the constant map at the centre at time 0, to the identity at time 1, and fixing
the centre at all times. Prove `exists_smoothGoodCover_refining`: every open cover of a
finite-dimensional Hausdorff second-countable boundaryless smooth manifold has a refinement by a
smooth good cover; and `exists_finite_smoothGoodCover_refining`: on a compact such manifold the
refinement can be taken finite (compactness implies second countability for a manifold, so the
compact statement carries no second-countability hypothesis).

On finite-dimensional Hausdorff second-countable manifolds with boundaryless model, prove the
following for **any chosen smooth positive-definite Riemannian metric**, including its given-metric
convexity radii and endpoint maps. DifferentialGeometry 12.1 constructs an auxiliary metric when
none is specified. Construct the compatible extended metric using `EMetricSpace.ofRiemannianMetric`;
the `T3Space` hypothesis it requires follows from Hausdorffness and local compactness. Consume
HopfRinow's exponential/logarithm and Gauss-lemma APIs (HopfRinow Layer 2). Prove the variable-base
inverse-function theorem for `(x,v)↦(x,exp_x v)`, then strict convexity of squared local radial
distance along sufficiently short geodesics (Lee, *Introduction to Riemannian Manifolds*, 2nd ed.,
Lemma 6.16 and Theorem 6.17). Construct strongly geodesically convex neighbourhoods in Lee's sense:
any pair is joined by a unique globally minimizing geodesic, entirely in the neighbourhood. Export
positive uniform normal and strong-convexity radius bounds on each compact set for the given metric,
with `IsNormalDomain` on every tangent ball of that normal radius. Prove these bounds by the
variable-base inverse-function neighbourhoods and a finite compact subcover; they do not require a
separately defined global injectivity-radius function. Export smooth dependence of the segment on
its endpoint pair and time. Build locally finite good-cover refinements, finite when compact.
Require each cover member V to be uniformly normal: for every q∈V choose `r_q>0` with
`IsNormalDomain` on `B(0,r_q)` and `V⊆exp_q(B(0,r_q))`. Each nonempty finite intersection W inherits
this property and strong convexity. Export a chosen q∈W, its normal ball parameter, and
`H(s,x)=exp_q(s log_q x)` on its natural open domain containing `[0,1]×W`. Use
`riemannianLog I M q (B(0,r_q))` and `contMDiffOn_riemannianLog` with the explicit normal-domain
witness. Unique minimizers and strong convexity keep H in W. For a globally smooth homotopy
`ℝ×W→W` usable by DifferentialGeometry 5.4, reparametrize with a fixed smooth step `ρ:ℝ→[0,1]`,
`ρ(0)=0` and `ρ(1)=1`, constant outside `[0,1]`, and prove the endpoint/basepoint and slice
identities. Raw H and its reparametrization have separate domain statements. Use product swap and
explicit restriction to `W×Icc(0,1)`, with model `I.prod(𝓡∂1)`, for DifferentialGeometry 5.4's
actual `homotopyOperator`. These covers and contractions precede the principal bundle/connection
layers and are inputs to DifferentialGeometry's homotopy operator.

- Every nonempty finite intersection of a smooth good cover is path connected (the path
  `t ↦ contract(t,x)` joins the centre to x), hence connected, and smoothly contractible.
- `exists_smoothGoodCover_refining` under `IsManifold I ∞ M`, `FiniteDimensional ℝ E`, `T2Space M`,
  `SecondCountableTopology M`, `I.Boundaryless`; `exists_finite_smoothGoodCover_refining` with
  `CompactSpace M` in place of second countability and `Finite C.Index` in the conclusion.
- The strong-convexity radius is positive and locally uniform; the uniformly normal property passes
  to subsets.

**Checks.**
- On ℝⁿ the one-member cover by ℝⁿ with centre 0 and `contract(t,x) = ρ(t)x` is a smooth good
  cover; without the step ρ the map `(t,x) ↦ tx` is fine on ℝⁿ but leaves a ball, so the
  reparametrization is what makes balls admissible.
- The two-arc cover of `S¹` whose arcs meet in two components is not a good cover: the intersection
  is nonempty but disconnected, and no contraction to a centre exists (the path from the centre
  would connect the components).
- An annulus is not an admissible member: a smooth contraction would make it simply connected, but
  its fundamental group is ℤ.
- On the unit circle the strong-convexity radius at every point is `π/2`: an open arc of length
  `π` is strongly convex, while an arc of length `π + ε` contains pairs at distance exactly `π` with
  two minimizing geodesics.
- The empty manifold has the good cover with empty index type; on a compact manifold with the cover
  by all coordinate balls, the refinement is finite.
- For `W` a ball in a normal neighbourhood, `H(s,x) = exp_q(s log_q x)` satisfies `H(0,x) = q`,
  `H(1,x) = x` and `H(s,q) = q`; a definition with `log_q` on a non-normal domain would be
  multivalued across the cut locus of `S¹`.

*Needs:* HopfRinow Layers 1–2; DifferentialGeometry 12.1, 5.4; Mathlib `EMetricSpace.ofRiemannianMetric`;
Tau Ceti `riemannianLog`, `IsNormalDomain`, `contMDiffOn_riemannianLog`.

### B6.1 Sheaves, native Čech complexes and the comparisons on good covers

**Sheaves and exactness.** Use the native `TopCat.Sheaf` carriers: `smoothSheafAddCommGroup` for
smooth ℝ-valued functions and `smoothSheafCommGroup` for `Circle`. Use `Additive Circle` and its
transported manifold model to put the exponential homomorphism into the additive sheaf category,
and consume `smoothSheafAddCommGroup.compLeft`; compare with the multiplicative circle sheaf.
Construct the locally constant integer sheaf and identify it with the exponential kernel, proving
exactness of `t↦exp(2πit)` on stalks. Prove acyclicity of smooth real functions by partitions of
unity: `subsingleton_H_smoothSheafAddCommGroup`, the sheaf cohomology `Sheaf.H` of
`smoothSheafAddCommGroup` with values in ℝ on a finite-dimensional Hausdorff second-countable smooth
manifold vanishes in every positive degree.

**Checks.**
- On `S¹` the constant sheaf ℝ has `H¹ = ℝ`, so acyclicity is specific to the fine sheaf of smooth
  functions and is not a property of all sheaves on a manifold.
- On the two-arc cover of `S¹`, a smooth function on the two-component overlap is a difference
  `f₁ − f₂` of smooth functions on the arcs, by a partition of unity; this is the degree-one case of
  acyclicity in Čech form.
- The exponential sequence is not sectionwise surjective: `z ↦ z` on `S¹ ⊂ ℂ` is a smooth
  circle-valued function with no global real logarithm, while locally it has one; the stalk
  statement is the correct one.
- The kernel of `exp(2πi·)` on a connected open set is the constant integers, and on the empty set
  it is zero, matching the locally constant sheaf and not the constant presheaf.

**Native fixed-cover complex and the displayed coordinates.** For every indexed open cover
`U : ι → Opens M`, use Mathlib's actual `CategoryTheory.cechComplexFunctor U` on the actual
presheaf underlying each relevant sheaf. In degree p its factors are indexed by every ordered
tuple `i : Fin (p+1) → ι`, including repetitions, and are sections over the categorical product
`∏ᶜ fun j ↦ U (i j)`, which in `Opens M` is their intersection. Construct the canonical
product/intersection isomorphism, including repeated factors; do not replace the native tuple
index by distinct finite subsets. Write `cechIntersection C i` for the intersection of the members
of a good cover C indexed by an ordered tuple i, and `locallyConstantRealSheaf` for Mathlib's
`constantSheaf` with value ℝ on the opens site. Define `cechTupleConstantSection C i` as the unit
of `constantSheafAdj` at ℝ followed by restriction from the whole space to the native product open
of the tuple. Prove `cechTupleConstantSection_bijective_iff`: this map is a bijection from ℝ onto
the sections over the tuple intersection exactly when that intersection is nonempty. Identify the
module of real cochains on ordered tuples that vanish on tuples with empty intersection with the
native complex of the locally constant real sheaf by these constant sections, factor by factor. The
finite contraction in B6.0 makes each nonempty intersection connected, so every locally constant
real section there is constant. On an empty intersection the locally constant sheaf has the zero
module, matching the zero-only factor of the coordinate cochains; the pointwise constant presheaf
with a spurious ℝ-valued section on `∅` is not this sheaf. Prove the degreewise maps are mutually
inverse and commute with every face restriction. Thus the native alternating-coface differential
`δc(i)=Σ_j (-1)^j c(i∘j.succAbove)|_{∩U_{i_k}}` is exactly the displayed formula, for repeated
tuples and empty intersections as well as distinct nonempty ones. Do this for integer and real
locally constant coefficients; use the additive-group-valued native sheaf for `Additive Circle`,
not a fictitious ℝ-module structure on the circle.

**Checks.**
- For `p = 1` and `i = (a,b)`, `δc(a,b) = c(b)|_W − c(a)|_W`, the pinned `(δt)_ij = t_j − t_i`; for
  `(a,b,c)` it is `c(b,c) − c(a,c) + c(a,b)`, the pinned `(δt)_ijk = t_jk − t_ik + t_ij`.
- For an empty tuple intersection the factor is the zero module and the constant section `ℝ → 0`
  is not injective; the bijectivity statement is false there, as it must be, and the coordinate
  cochain is forced to vanish.
- For the repeated tuple `(a,a)` the intersection is `U_a`, the same factor as the tuple `(a)`; the
  native complex keeps both factors and the differential `δc(a,a) = c(a) − c(a) = 0` on them.
- On a disconnected open set (not an intersection of a good cover) the locally constant sections
  are `ℝ²`, so the constant section is not surjective; connectedness of the good-cover intersections
  is what the bijection uses.

**Augmentation is a separate, conditional comparison.** For the actual terminal object `T=⊤` of
`Opens M`, consume Tau Ceti's `cechAugmentation U hT P`. Its degree-zero component followed by the
projection indexed by `a : Fin 1 → ι` is exactly `P.map (hT.from (∏ᶜ fun j : Fin 1 => U (a j))).op`
(`cechAugmentation_f_zero_comp_π`). Prove this component equation for the locally constant,
smooth-function, and additive-circle sheaves. Do not infer from this coordinate isomorphism that
the augmentation is a quasi-isomorphism. Tau Ceti's criterion `quasiIsoAt_cechAugmentation_zero_iff`
says the degree-zero statement holds exactly when the presieve sheaf condition holds, and the full
statement additionally needs exactness of the native Čech complex in each positive degree; prove
those hypotheses at the later good-cover/fine-sheaf comparison where they apply. A fixed-cover
augmentation for an arbitrary presheaf or arbitrary cover is not automatically a quasi-isomorphism.

**Raw refinement maps and homotopies.** For an arbitrary topological space X, an arbitrary presheaf
P on its opens with values in an abelian category, indexed open covers `U : ι → Opens X`,
`V : κ → Opens X`, a function `r : κ → ι` and inclusions `V_a ⊆ U_(r a)`, construct the raw
refinement cochain map on the native complexes: on tuple j precompose by `r ∘ j` and restrict to the
smaller intersection. Prove the cochain-map equation, naturality in P and in coefficient change,
the identity and composition equations. For two refinement functions of the same covers, build the
explicit native refinement cochain homotopy, so that the induced map in cohomology depends only on
the two covers; repeated indices are retained, and the category of raw refinement functions is not
asserted to be filtered. From this obtain the strict diagram of Čech cohomology groups on the
preorder of covers ordered by existence of a refinement, and its restriction to good covers of a
manifold; cofinality of good covers among all covers is `exists_smoothGoodCover_refining`.
TopologicalSheafCohomology's cover-colimit Čech cohomology on arbitrary and compact spaces and its
derived comparison are not needed here and are not targets here.

**Checks.**
- The identity refinement function induces the identity cochain map; composition of refinements
  induces the composite.
- For the cover `U = (X, X)` with two copies of X and `V = (X)`, the two refinement functions
  `0 ↦ 0` and `0 ↦ 1` induce different cochain maps (they pick different degree-zero factors) but
  the same map `H⁰ = P(X) → P(X)`, the identity; the refinement homotopy between them is the
  witness.
- Refinement commutes with the coordinate identification: a coordinate cochain supported on
  nonempty intersections of a good cover pulls back to one supported on nonempty intersections of
  the finer good cover.
- On the discrete two-point space with `P(∅) ≠ 0` the singleton cover refines every cover and
  refinement does not kill the spurious degree-one classes coming from empty intersections; this is
  why every comparison below is stated for sheaves, whose value on `∅` is zero.

**Coefficient maps and the connecting morphism.** Prove the locally constant, smooth-function and
additive-circle coefficient maps commute with the native Čech maps. Compare the stalk-exact
sequence `0 → ℤ → C^∞(ℝ) → C^∞(Additive Circle) → 0`, with its maps fixed by `t ↦ exp(2πit)`, to
the native exponential sequence of sheaves. Construct the induced connecting morphism by lifting
cochains after a cover refinement, record its alternating-Čech sign, and prove the comparison
square with AlgebraicTopology Stage 6.1's singular Bockstein commutes. Sheaf exactness is stalkwise:
do not assert that the exponential sequence is sectionwise surjective on each arbitrary open set or
that an arbitrary cover augmentation is a quasi-isomorphism. Use the good-cover/fine-sheaf
hypotheses at the exact later comparison where they apply.

**Čech–de Rham and Čech–singular comparisons.** Build Čech cochains, refinement and comparison with
singular integral cohomology on smooth manifolds using B6.0's locally finite smooth good covers. In
the double complex `Č^p(U;S^q)` use `D=δ+(-1)^p d_sing` and both edge inclusions. Require
coefficient naturality for ℤ, ℝ and ℝ/ℤ and exact compatibility with connecting maps. Consume
DifferentialGeometry 8.3–8.4's smooth singular chains, `smoothToSingular` and `chainIntegral` for
the map of double complexes from the Čech/de Rham complex to the Čech–smooth-singular complex.
Prove that native singular subdivision and `singularSubdivisionHomotopy` factor through
`smoothToSingular` as `S∘ι=ι∘S∞` and `P∘ι=ι∘P∞`: their affine-simplex pushforwards are smooth and
compatible on faces. Use DifferentialGeometry 8.4's `fullSimplex`/`StdSimplex` identification for
these factorizations. Prove the smooth small-chain theorem using these operators. Each horizontal
row, augmented by cover-small cochains on M, is exact simplexwise: it is the augmented Čech complex
on the nonempty set of cover indices containing that small simplex. Restriction along the natural
inclusion `smoothToSingular` gives a map from the Čech–continuous-singular to the
Čech–smooth-singular double complex.

The following are targets here, with their hypotheses, not consumed from DifferentialGeometry:

- *Smooth restriction on intersections.* On every open subset W of a T2 σ-compact finite-dimensional
  smooth manifold, restriction from all real singular cochains to smooth cochains (the dual of
  `smoothToSingular`) is a quasi-isomorphism, and so is restriction from all cochains to cover-small
  cochains for an open cover of W; both follow from DifferentialGeometry 8.3's smoothing chain
  homotopies and AlgebraicTopology Stage 3.2's small-chain theorem applied on W, and products of
  real modules preserve exactness. Hence the induced total map of double complexes is a
  quasi-isomorphism, by the Čech-degree filtration, finite in every total degree.
- *Naturality of chain integration.* For a smooth map `f : M → N`, a smooth chain c on M and a form
  η on N, `chainIntegral (f_* c) η = chainIntegral c (f^* η)`; `chainIntegral` is DifferentialGeometry
  8.4's, and its column-zero square with the de Rham differential is Stokes for chains
  (`SmoothSimplex.integral_mextDeriv`).
- *One de Rham comparison.* The cohomology comparison produced by the double complex agrees with
  DifferentialGeometry 8.4's `deRhamHom`, including the coefficient and sign normalization; there is
  one de Rham comparison.
- *Fundamental-class pairing.* For a closed oriented M, `∫_M η = ⟨deRhamHom [η], [M]_ℝ⟩`, where
  `[M]_ℝ` is the real image of AlgebraicTopology Stage 6.3's integral fundamental class for the
  orientation local system compared with the smooth orientation by Stage 6.3's tangent-orientation
  comparison, and `∫_M` is DifferentialGeometry 5.2's top-form integral. Route: both sides are
  natural and additive, and agree on a small top-dimensional simplex by Stage 6.3's local generator.

Prove the real-constant-coefficient Čech–de Rham isomorphism using the specified smooth contractions
and partition-of-unity double-complex maps, with refinement naturality. Write the two edge cochains
explicitly: a global q-form restricts to the `p=0` column, and a locally constant real p-cochain is
included as a constant `q=0` form. Check horizontal restriction and vertical de Rham differential
separately, then verify the total sign `D=δ+(-1)^p d` makes both inclusions cochain maps. The
vertical contraction and horizontal partition-of-unity contraction give the two comparison
directions; state their chain homotopies and refinement/coefficient naturality instead of
postulating an abstract isomorphism. Identify the horizontal row with the native fixed-cover Čech
complex above before using its augmentation or refinement; identify the vertical column with the
actual smooth de Rham resolution on that intersection. The integer-to-real and real-to-circle
connecting squares use these same edge maps and the pinned exponential/Bockstein sign consumed by
B6.2–B6.4. Pin the actual cochain maps and inverse homotopies by contracting each vertical column
with `dK+Kd=1−ι∘ev_q` and each horizontal row by the partition of unity. Prove the finite-degree
homological perturbation/totalization lemma for these contractions and its explicit zig-zag
formula, including smooth parameter dependence. For the continuous Čech–singular double complex use
AlgebraicTopology Stage 3.2's small-chain comparison; for the smooth one use the preceding smooth
subdivision theorem for the restriction from all cochains to cover-small cochains. An exact de Rham
form therefore maps to a Čech coboundary; export this implication and the explicit cochain maps.
Consume AlgebraicTopology Stage 6.1's coefficient long exact sequence and Bockstein on its actual
absolute/relative singular cochain complexes, including `0→ℤ→[×2]ℤ→F₂→0` and `0→ℤ→ℝ→ℝ/ℤ→0` on
arbitrary spaces/pairs. Prove the good-cover/sheaf comparison commutes with those maps, with
naturality and the exponential normalization above. Consume DGFloer Layer 1.1's degree-one Hurewicz
theorem and prove its component/groupoid dictionary for this good-cover comparison; do not
duplicate its general proof.

**Checks.**
- On `S¹` with the good cover by three arcs, the Čech 1-cocycle of the locally constant integer
  sheaf with value 1 on one overlap and 0 on the others generates `Ȟ¹ = ℤ`, and the comparison sends
  it to the generator of `H¹(S¹;ℤ)` evaluating to 1 on the oriented circle; the de Rham edge sends
  `dθ/(2π)` to the same class.
- The sign `D = δ + (−1)^p d`: for a 0-cochain of 1-forms `(ω_i)`, the bidegree `(1,2)` component
  of `D²ω` is `δ(dω) − d(δω) = 0` because δ and d commute; with `D = δ + d` it would be `2δdω`,
  nonzero for `ω` equal to `x dy` on one chart of `ℝ²` and 0 on another.
- An exact form `η = dα` on M maps to the Čech coboundary of `(α|_{U_i})` plus a zig-zag; on `S¹`
  the form `dθ` is not exact and maps to the nonzero class above.
- The fundamental-class pairing on `S¹` with `η = dθ` gives `2π` on both sides (DifferentialGeometry
  8.5's `circleLoop` acceptance), and on `ℂP¹` with the Hopf curvature gives `2π` (B6.2).
- The Bockstein square on `S¹`: the circle-valued function `z ↦ z` (winding number 1) has Bockstein
  the generator of `H¹(S¹;ℤ)`; the Čech connecting map of the exponential sequence on the three-arc
  cover produces the cocycle with value 1 on one overlap, matching.

*Needs:* B6.0; Mathlib `cechComplexFunctor`, `constantSheaf`, `constantSheafAdj`, `Sheaf.H`,
`smoothSheafAddCommGroup`, `smoothSheafCommGroup`; Tau Ceti `cechAugmentation`,
`singularSubdivisionHomotopy`, `smallSingularChainHomotopyEquiv`; DifferentialGeometry 5.2, 5.4,
Layer 6, 8.3, 8.4; AlgebraicTopology Stages 3.2, 6.1, 6.3; DGFloer Layer 1.1.

### B6.2 The first Chern class and the classification of circle bundles

Define `c₁(P)` using the exponential connecting map on the transition cocycle for the
**dual-character** associated line. With the comparison fixed in B6.1, use the fundamental-class
pairing of B6.1 on ComplexKahlerGeometry K7.1's `ℂP¹` carrier, oriented by its complex orientation
and AlgebraicTopology Stage 6.3's tangent-orientation comparison: `∫_(ℂP¹)η=⟨deRhamHom[η],[ℂP¹]_ℝ⟩`.
The integral uses DifferentialGeometry Layer 5's top-form carrier; the class is the real image of
Stage 6.3's integral fundamental class. Prove the Hopf normalization `⟨c₁(Hopf),[ℂP¹]⟩ = 1` as a
theorem and prove circle-bundle classification by `H²(M;ℤ)`: `c₁` is a bijection from isomorphism
classes of principal circle bundles to `H²(M;ℤ)`, natural under pullback. Tensor, dual and pullback
give sum, negation and pullback. Construct tensor products of bundles **with connection** and prove
curvature/holonomy addition and coherent associativity/unit.

**Checks.**
- `⟨c₁(Hopf),[ℂP¹]⟩ = 1` with the dual character; the standard-character line `O(−1)` has `−1`;
  the Hopf curvature integrates to `2π` and `F/(2π)` integrates to 1, consistent with B6.3.
- The integer representative `−(δφ)_ijk/(2π)` for `g_ij = exp(iφ_ij)`: for the line with cocycle
  `g_ij` the class is `(δφ)/(2π)`, and the dual line has cocycle `g_ij⁻¹`, hence the sign.
- The trivial bundle has `c₁ = 0`; `c₁(P ⊗ Q) = c₁(P) + c₁(Q)` and `c₁(P^*) = −c₁(P)`, tested on
  `Hopf ⊗ Hopf` (class 2) and `Hopf ⊗ Hopf^*` (trivial).
- Pullback along a constant map gives `c₁ = 0`; pullback of the Hopf bundle along a degree-d map
  `S² → S²` has class d.

*Needs:* B1.3, B2.5, B3.3, B4.1, B6.1; ComplexKahlerGeometry K7.1; AlgebraicTopology Stage 6.3;
DifferentialGeometry 5.2, 8.4.

### B6.3 Rank-one Chern–Weil

Prove rank-one Chern–Weil: `c₁(P)_ℝ=[F/(2π)]` under DifferentialGeometry 8.4's `deRhamHom`,
identified with the Čech comparison by B6.1. A prescribed closed real two-form F is circle
curvature iff its class divided by `2π` lies in the integral image. Prove adjustment of a chosen
connection by a global one-form and the equivalent integral-period criterion on singular
two-cycles.

**Checks.**
- On the unit `S²`, `F = c·dvol` is a circle curvature iff `4πc ∈ 2πℤ`, that is `c ∈ ½ℤ`; `c = ½`
  is the Hopf connection and `c = 1/3` is excluded.
- Changing the connection by a one-form a changes F by da, leaving the class unchanged; on `T²` the
  forms `F = c·dx∧dy` with `c ∈ 2πℤ` are exactly the curvatures.
- The period criterion on a torsion class: a flat bundle with nonzero torsion `c₁` has `F = 0`,
  all periods zero, and real class zero (B6.4), so the period criterion decides realizability of F,
  not the bundle.

*Needs:* B6.1, B6.2; DifferentialGeometry 8.4.

### B6.4 Flat circle bundles

Flat circle bundles with connection are classified by `H¹(M;ℝ/ℤ)`. On connected based M this is
`Hom(π₁(M),ℝ/ℤ)`; use the groupoid or product over components otherwise. Their Chern class is
`β(h)` for the holonomy convention fixed above. Flatness exists on a fixed bundle iff its real Chern
class is zero. Prove the kernel of `H²(M;ℤ) → H²(M;ℝ)` is the universal-coefficient subgroup
`Ext(H₁(M;ℤ),ℤ)`. It equals the torsion subgroup when `H₁(M;ℤ)` is finitely generated; prove that
specialization using universal coefficients. No finite-generation-free identification with torsion
is asserted.

**Checks.**
- On `S¹`, flat circle bundles with connection are `Hom(ℤ,ℝ/ℤ) = ℝ/ℤ`, the holonomy `−a mod 1` of
  the connection `a dθ` (B5.0), and all have `c₁ = 0`.
- On the lens space `L(n,1)`, the flat bundle with holonomy character `exp(2πik/n)` has
  `c₁ = k·u` (B7), torsion of order `n/gcd(n,k)`, and zero real class.
- `ker(H²(ℤ)→H²(ℝ)) = ker(H²(ℤ)→Hom(H₂,ℤ)) = Ext(H₁,ℤ)` because `Hom(H₂,ℤ)→Hom(H₂,ℝ)` is injective;
  for a space with `H₁ = ℚ` the kernel `Ext(ℚ,ℤ)` is torsion-free and uncountable, so finite
  generation is needed for the identification with torsion.

*Needs:* B5.2, B6.1, B6.2; AlgebraicTopology Stage 6.1; DGFloer Layer 1.1.

### B6.5 Fixed curvature and the torsor of connections

If a fixed curvature F has a realization, its bundle-with-connection isomorphism classes form a
torsor for `H¹(M;ℝ/ℤ)`. On a fixed underlying bundle with a curvature-F connection `A₀`, the
equal-curvature gauge classes form a torsor for `H¹_dR(M;ℝ)/(2π·image of H¹(M;ℤ))`. The chosen
origin `A₀` identifies it with that group by `[A]↦[A−A₀]`; replacing `A₀` by `A₁` translates
coordinates by `−[A₁−A₀]`. Prove the exact-sequence relationship retaining torsion classes and the
distinction between bundle and connection isomorphisms.

**Checks.**
- On `S¹` with `F = 0`, the gauge classes of flat connections on the trivial bundle are
  `H¹_dR(S¹)/2πℤ = ℝ/2πℤ`, parametrized by the holonomy; the change of origin from `A₀ = 0` to
  `A₁ = a dθ` subtracts `[a dθ]`.
- On `T²` the torsor is `(ℝ/2πℤ)²`, matching the gauge computation of B4's Examples.
- On `L(n,1)` with `F = 0`, bundle-with-connection classes form `ℤ/n` (torsion bundles, each with
  one flat connection up to gauge since `H¹_dR = 0`), so the two torsors differ: the first has n
  elements and the second one.

*Needs:* B4.2, B6.2–B6.4.

### B6.6 Lattice local systems and affine torus bundles

Generalize the exponential/Čech theory to an integral rank-n lattice local system Λ and its
associated real vector bundle. Construct the torus bundle `(Λ⊗ℝ)/Λ`, its sheaf of smooth sections,
and the affine torus bundle torsors with fixed lattice local system Λ; morphisms induce the identity
on Λ. Prove their characteristic class classification by singular cohomology with local
coefficients `H²(M;Λ)`. Construct Čech cohomology of the locally constant sheaf Λ and its natural
comparison with AlgebraicTopology's singular local-system cohomology carrier, compatible with the
exponential connecting map. Prove triviality iff the class vanishes, refinement/naturality and the
locally constant `GL_n(ℤ)` transition rule. This owns the topological torus-bundle obstruction for
IntegrableSystems; its symplectic/Lagrangian obstruction is owned there.

**Checks.**
- For the trivial rank-one system `Λ = ℤ` the torus bundle is the circle bundle `ℝ/ℤ`, and the class
  in `H²(M;ℤ)` is `c₁` of B6.2 (the two classifications agree).
- For Λ the Möbius local system over `S¹` (monodromy −1), `H²(S¹;Λ) = 0`, so every affine torus
  bundle with this local system is trivial as a torsor, although the local system itself is not.
- The transition rule: a change of local integral basis acts by `GL_n(ℤ)` on the fibre coordinates
  and is locally constant; a transition in `GL_n(ℝ) ∖ GL_n(ℤ)` does not preserve Λ.

*Needs:* B6.1, B6.2; AlgebraicTopology Stage 6.1 (local coefficients).

### Examples

Circle bundles and connections on the two-torus, the Hopf bundle, the trivial flat bundle with
nontrivial holonomy, and the torsion circle bundles on lens spaces of B7.

### Dependencies

B6.0 uses HopfRinow Layers 1–2 and DifferentialGeometry 12.1 and 5.4. B6.1 uses B6.0, Mathlib's
sites and smooth sheaves, Tau Ceti's Čech augmentation and subdivision, DifferentialGeometry Layers
5, 6 and 8, AlgebraicTopology Stages 3.2, 6.1, 6.3 and DGFloer Layer 1.1; nothing of B1–B5. B6.2–B6.6
use B1–B5 and B6.1; B6.2 also uses ComplexKahlerGeometry K7.1.

## B7. Acceptance examples and dependency order

B1 precedes B2; B3 uses B1–B2 and generic differential forms. B4 follows B3. B5 uses B3–B4,
universal covers and Lie subgroup theory. B6.0–B6.1 use differential forms, smooth partitions of
unity and the cohomological/convex-neighbourhood suppliers independently of B1–B5. The
circle-bundle and connection items B6.2–B6.6 consume B1–B5 as specified above, singular cohomology
and the de Rham comparison, while B6.0–B6.1 build the Čech/sheaf comparison and
convex-neighbourhood results from HopfRinow. B1's Hopf test consumes only the independent
projective charts/orientation layer ComplexKahlerGeometry K7.1, consuming AlgebraicTopology Stage
4.6's projectivization topology. The local curvature identities and flat classification can be
developed independently of B6's integral theory.

In addition to the examples already named, compute circle bundles and connections on the
two-torus, the trivial flat bundle with nontrivial holonomy, and a torsion circle bundle on a lens
space with nonzero integral class and zero real class. For the flat connection on `p*Hopf` fixed
below, with holonomy `ζ=exp(2πi/n)`, compute full holonomy `μ_n` and trivial restricted holonomy;
its full holonomy reduction is the `S³` covering and its restricted reduction has base `S³`. For
the character `exp(2πik/n)`, prove that full holonomy is `μ_(n/gcd(n,k))` and the covering
underlying the full reduction is `S³/μ_gcd(n,k)`, which is also the base of the restricted
reduction. Use these to test the tensor/pullback operations and the distinction between curvature,
integral class and holonomy. Consume Tau Ceti's existing lens-space manifold and
fundamental-group APIs (`LensSpace`, `LensSpace.fundamentalGroupMulEquiv`); construct on the native
`LensSpace n ![1,1]` carrier a CW structure with one cell in each degree 0–3, with explicit
characteristic maps. The one-cell loop is γ below; choose the two-cell generator so its boundary is
n times that loop, and prove `d₁=d₃=0`. Compute `H²` and the Bockstein from these cellular
complexes and AlgebraicTopology's universal-coefficient/coefficient-LES maps. Prove the
cellular-to-singular comparison commutes with Bocksteins by dualizing AlgebraicTopology Stage 4's
degreewise-free integral chain-homotopy comparison and comparing the coefficient short exact
sequences and lifted coboundaries. The residue of the dual two-cell cochain fixes the `ℤ/n`
identification. For `L(n,1)`, `n≥2` (and `n≥3` for a sign-distinguishing test), use the explicit
loop `γ(t)=[exp(2πit/n)w₀]` and `χ(γ)=1/n mod ℤ`. For the projection `p:L(n,1)→ℂP¹`, compute
`u=p^*c₁(Hopf)` as the class corresponding to 1 in this fixed `ℤ/n` identification: compute the
explicit pullback Hopf transition cocycle through B6.1 and compare it to the dual two-cell cocycle.
This is a calculation, not a definition of the generator. The pullback Hopf bundle is
`(S³×Circle)/μ_n`, with `(v,λ)~(vζ,ζ⁻¹λ)`. Construct its equivariant isomorphism to `p*Hopf` by
`[(v,λ)]↦([v],vλ)`, with right action `[(v,λ)]·μ=[(v,λμ)]`, and prove projection, action and chart
identities. Construct a flat connection and calculate its holonomy along γ as ζ. Prove
independently that `β(χ)=u`, tying the torsion sign to Hopf's value. The flat principal bundle with
holonomy `exp(2πik/n)` has `c₁=k u` in the dual-character convention. This is the torsion sign test
in addition to the Hopf test.

**Checks.**
- The map `[(v,λ)] ↦ ([v],vλ)` is well defined: `(vζ,ζ⁻¹λ) ↦ ([vζ], vζζ⁻¹λ) = ([v], vλ)`; with the
  relation `(vζ,ζλ)` it would not be.
- For `k = 1` the image of `ℤ/n → Circle` is `μ_n`, the kernel is trivial, the holonomy bundle is
  `S³ → L(n,1)` itself; for general k the image is `μ_(n/g)` with `g = gcd(n,k)`, the kernel is
  `ℤ/g`, and the holonomy bundle is `S³/μ_g`.
- `β(χ) = u` for `χ = 1/n mod ℤ`: a real lift of the cellular cocycle `χ` has coboundary `n·(1/n) = 1`
  on the two-cell, the dual two-cell generator; the opposite orientation of the two-cell would give
  `−u`, which is why `n ≥ 3` is needed to detect the sign.
- `c₁(p*Hopf) = u` has order n, nonzero in `H²(L(n,1);ℤ) = ℤ/n` and zero in `H²(L(n,1);ℝ) = 0`:
  nonzero integral class, zero real class, zero curvature for the flat connection.

## B8. Yang–Mills energy and its variational calculus

### B8.1 Formal adjoints and the energy

On a closed oriented Riemannian n-manifold, n≥2, let P be a principal compact-Lie-group bundle with
a specified positive-definite Ad-invariant real pairing B on its Lie algebra. Use B1–B4's affine
connection space, adjoint bundle, bracket wedge and gauge action. This layer is a consumer of B2–B4
and ComplexKahlerGeometry K5a's pointwise real Hodge-star/form-metric layer; it is not a
prerequisite of that layer, of B1–B7 or of the scalar/linear Hodge construction. Tensor that star
with the adjoint-bundle identity. Use increasing orthonormal wedges and B2's geometric `L²` pairing,
with no additional factorials. Construct `d_A*:Ω^r(ad P)→Ω^(r−1)(ad P)` for `1≤r≤n`, with
`d_A*=(-1)^(n(r+1)+1)*d_A*`, where the two stars on the right are Hodge stars, and prove the
formal-adjoint identity by B4's paired Leibniz rule and Stokes (Donaldson §2.1; Jiang, proof of
Proposition 2.9). On a noncompact base retain compact support for these identities.

Define `YM(A)=∫_M |F_A|² dvol`, with no factor 1/2 (Donaldson §2.1; Jiang §2). Construct its
reference-connection-independent polynomial variation on every finite smooth family of adjoint
one-forms. Prove nonnegativity, vanishing exactly for flat A, gauge invariance, and naturality
under oriented Riemannian isometries and bundle isomorphisms preserving B.

**Checks.**
- The sign `(−1)^(n(r+1)+1)`: for `n = 2`, `r = 1` it is `−1`, and for `n = 3`, `r = 2` it is `+1`,
  the standard codifferential signs; on `ℝ²` with the flat metric and `A = 0`, `d^*(f dx) = −∂_x f`.
- For the Hopf connection on the unit `S²`, `F = ½ dvol`, `|F|² = ¼`, `YM = ¼·4π = π`; with the
  factor 1/2 the value would be `π/2`.
- `YM(A) = 0` iff `F_A = 0`, since the integrand is pointwise nonnegative and continuous and the
  measure has full support; for the negative-definite Killing form of `𝔰𝔲(2)` the integrand would
  be nonpositive, which is why B is required positive.
- Gauge invariance: `F_(u·A) = Ad(u⁻¹)F_A` pointwise and B is Ad-invariant, so `|F|²` is unchanged.

*Needs:* B2.2, B2.5, B4.1, B4.2; ComplexKahlerGeometry K5a (pointwise Hodge star); DifferentialGeometry
5.3, 12.4.

### B8.2 First and second variations and the gauge-fixed operator

For smooth one-forms a, b, prove

```text
F_(A+t a)=F_A+t d_A a+(t²/2)[a∧a],
D YM_A(a)=2(F_A,d_A a)_L²=2(d_A*F_A,a)_L²,
D² YM_A(a,b)=2(d_A a,d_A b)_L²+2(F_A,[a∧b])_L².
```

(Jiang, Propositions 2.9 and 2.12, with the normalization fixed here.) Thus stationarity is exactly
`d_A*F_A=0`; Bianchi is the separate identity `d_AF_A=0`. A stationary connection is not asserted to
be a local minimum. Define the zero-order self-adjoint bundle map `R_A` by its pointwise equation
`⟨R_A a,b⟩=⟨F_A,[a∧b]⟩`, using the finite-dimensional metric Riesz map. Prove the linearization of
`A↦d_A*F_A` is `L_A=d_A*d_A+R_A`, and identify the Hessian with `2L_A`. Supply local expressions,
transition and gauge-conjugation equations for these operators, including all signs of the
bracket-wedge convention.

At a stationary A prove `L_A(d_A ξ)=0` and its formal-adjoint identity `d_A*L_A=0`, by
differentiating gauge covariance. The gauge generator for our left action is `−d_A ξ`. Construct
the gauge-fixed operator `J_A=L_A+d_Ad_A*` (Donaldson §2.1); with the positive-Laplacian
principal-symbol convention its symbol at a real covector ζ is `|ζ|² id`. Prove formal
self-adjointness, ellipticity and preservation of the Coulomb subspace `ker d_A*`. After K5a's
linear elliptic/Sobolev theory, construct its self-adjoint `L²` realization with `H²` domain,
compact resolvent, finite-dimensional kernel and finite negative spectral space. Prove
`ker J_A=ker L_A∩ker d_A*`. Construct the orthogonal decomposition of smooth one-forms into
`im d_A` and `ker d_A*` using the Green inverse of `d_A*d_A` on the complement of the parallel
adjoint sections. These are linear statements at A; nonlinear gauge slices and their stabilizers
remain HamiltonianReduction R5's, FourManifolds F5's and InstantonFloerTheory IF1's
dimension-specific constructions.

**Checks.**
- Expanding `|F_A + t d_Aa + (t²/2)[a∧a]|²` and using `[a∧b] = [b∧a]` on one-forms gives the
  displayed `D` and `D²` with coefficient 2; the factor-1/2 normalization would halve both.
- On the trivial circle bundle over `T²` at `A = 0`, `R_A = 0`, `D²YM(a,a) = 2‖da‖²_L² ≥ 0`,
  vanishing exactly for closed a; the stationary connections are all flat ones.
- At `A = 0` on a trivial bundle, `J_A = d^*d + dd^*` is the Hodge Laplacian on `𝔤`-valued
  one-forms, with symbol `|ζ|²·id`; the convention with the opposite sign would make `J_A`
  negative.
- At `A = 0` on a trivial bundle, `L_A(dξ) = d^*d(dξ) = 0` and `d^*L_A = d^*d^*d = 0` for every ξ;
  the sign of `R_A` is fixed by the `+2(F_A,[a∧b])` term of the second variation, and the
  candidate `d_A*d_A − R_A` is not the Hessian.

*Needs:* B4.1, B4.2, B8.1; ComplexKahlerGeometry K5a (linear elliptic and Sobolev theory).

### B8.3 Conformal scaling and stationary circle connections

For `g′=e^(2φ)g`, prove `*′=e^((n−2r)φ)*` on r-forms and the energy density scaling
`|F|²_g′ dvol_g′=e^((n−4)φ)|F|²_g dvol_g`. In dimension 4 deduce conformal invariance of the energy
and of its stationary equation (Donaldson §2.1). The self-dual/anti-self-dual energy and charge
comparisons, BPST solution and moduli applications have the FourManifolds F5 owner. For `Circle`
with B the ordinary real product, prove stationarity is harmonic curvature (Jiang, Exercise 2.11).
After B6 and K5a's compact real Hodge theorem, construct a stationary connection on each fixed
circle bundle: its real curvature is `2π` times the harmonic representative of `c₁(P)_ℝ`. Prove its
space of connections is an affine torsor for closed real one-forms, and its gauge classes form a
torsor for `H¹_dR(M;ℝ)/(2π·image of H¹(M;ℤ))`. Retain torsion bundles and the B6.5
change-of-origin law. This is the same fixed-curvature quotient, not a second
circle-classification construction.

**Checks.**
- `*′ = e^((n−2r)φ)*`: on 2-forms in dimension 4 the exponent is 0, so `*` is conformally invariant;
  `|F|²_g′ = e^(−4φ)|F|²_g` and `dvol_g′ = e^(nφ)dvol_g` give `e^((n−4)φ)`.
- On the unit `S²` scaled by the constant factor λ (`φ = log λ`), the Hopf energy becomes `π/λ²`,
  not π: the energy is not conformally invariant in dimension 2.
- For the circle, `d^*F = 0` and `dF = 0` make F harmonic; `A = A₀ + a` is stationary iff
  `d^*da = 0`, iff `da` is harmonic and exact, iff `da = 0` on a closed manifold; so the stationary
  connections form a torsor for closed one-forms, and on `S¹` every connection is stationary.
- On `L(n,1)` the torsion bundle `p*Hopf` has `c₁(P)_ℝ = 0`, harmonic representative 0, and its
  stationary connections are exactly the flat ones.

*Needs:* B6.3, B6.5, B8.1, B8.2; ComplexKahlerGeometry K5a (compact real Hodge theorem).

### Examples

The Hopf connection with energy π on the unit `S²`; flat connections on `T²` as stationary
connections with `D²YM ≥ 0`; the torsion lens-space bundle with stationary connections equal to the
flat ones.

### Dependencies

B8.1 uses B2, B4 and K5a's pointwise Hodge star; B8.2 uses B8.1 and K5a's elliptic theory; B8.3
uses B6.3, B6.5 and K5a's Hodge theorem. Nothing in B1–B7 uses B8.

## Downstream consumers

GeometricQuantization consumes B3–B6 for prequantum bundles and connection-preserving lifts, B2 for
Hermitian `L²` spaces and B4.2's bundle maps covering base diffeomorphisms; it owns polarized
sections and quantization operators. [HamiltonianReduction](../SymplecticGeometry/HamiltonianReduction/README.md)
consumes B1.1's descent, B1.4's quotients and homogeneous spaces, and B3–B5 for gauge spaces and
curvature moment maps. [LieGroupoidsPoisson](../LieGroupoidsPoisson/README.md) consumes B1.0's
regular fibres, fibre products and kernel distributions, B1.1's division and descent, B1.4's
quotient atlas, B2's complexification, B3.2's Atiyah bundle sequence, B5.2's flat-bundle dictionary
and countability theorem; the Lie algebroid/groupoid structures and their integrations are owned
there. [IntegrableSystems](../SymplecticGeometry/IntegrableSystems/README.md) consumes B1.5's
Ehresmann trivialization and B6.1/B6.6's Čech comparison and affine torus classification.
ComplexKahlerGeometry K5 consumes B2's `L²` construction and B2.1's complexification comparison.
OperatorAlgebraDynamics consumes B5.2's countability theorem. CharacteristicClasses and
TopologicalKTheory consume the circle-bundle classification and the frame-bundle groupoid
equivalence.

## References

- S. Kobayashi and K. Nomizu, *Foundations of Differential Geometry*, volume I, Interscience,
  1963: Ch. I §5 (principal bundles), Ch. II §1 (connections), §2 (existence), §3 (parallelism),
  §4 (holonomy groups), §5 (curvature form and structure equation), §7 (reduction theorem,
  Theorem 7.1), §8 (Theorem 8.1, Ambrose–Singer), §9 (flat connections), Appendix 4 (arcwise
  connected subgroups). Formulas are translated to the determinant-style wedge normalization above.
- I. Kolář, P. W. Michor and J. Slovák, [*Natural Operations in Differential Geometry*](https://www.mat.univie.ac.at/~michor/kmsbookh.pdf),
  Springer, 1993: §9.2 (Ehresmann's fibration theorem), §9.3 (connections on fibre bundles), §9.6
  (flat connections), Theorem 9.8 and §9.9 (parallel transport and completeness), §9.11 (the
  Ambrose–Singer generalization), §§10.2–10.3, 10.5, 10.7, 10.9, 10.11–10.14 (principal and
  associated bundles, homogeneous spaces, reductions, the bundle of gauges), §§11.1–11.8, 11.10,
  11.13, 11.15 (principal connections, curvature, local descriptions, covariant derivatives,
  holonomy Theorem 11.7, induced connections).
- E. Meinrenken, [*Group actions on manifolds*](https://www.math.utoronto.ca/mein/teaching/LectureNotes/action.pdf),
  lecture notes: Theorem 1.21 (free proper quotients) and Theorem 1.25 (slice theorem for proper
  actions).
- J. M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Springer, 2013: Corollary 5.14 and
  Proposition 5.38 (regular level sets), Theorem 21.10 (quotient manifold theorem), Theorem 21.17
  (homogeneous spaces).
- J. M. Lee, *Introduction to Riemannian Manifolds*, 2nd ed., Springer, 2018: Lemma 6.16 and
  Theorem 6.17 (uniformly normal and geodesically convex neighbourhoods).
- U. Schreiber and K. Waldorf, [*Parallel transport and functors*](https://arxiv.org/abs/0705.0452),
  J. Homotopy Relat. Struct. 4 (2009): Proposition 4.7 with its proof in Appendix B.4, and
  Theorem 5.8, for B5.1.
- D. S. Freed, [*Classical Chern–Simons theory, Part 1*](https://arxiv.org/abs/hep-th/9206021),
  Adv. Math. 113 (1995): §1, equations (1.5), (1.8)–(1.10), (1.13)–(1.16), for connections, curvature,
  Bianchi and gauge transformations.
- S. K. Donaldson, [*Mathematical uses of gauge theory*](https://cims.nyu.edu/~gromov/lectures%20on%20Curvature%202025/donaldson.pdf),
  §1.2 (gauge transformations and gauge fixing) and §§2.1–2.3 (the Yang–Mills functional, the
  gauge-fixed elliptic operator, conformal invariance), for B8; coefficients follow the energy
  normalization fixed here.
- J. Jiang, [*Yang–Mills minicourse notes*](https://web.ma.utexas.edu/SMC/2020/notes/YangMillsMinicourse.pdf),
  Propositions 2.9 and 2.12 and Exercise 2.11, for B8's first and second variations and the circle
  example; stationarity is distinguished from minimality.
