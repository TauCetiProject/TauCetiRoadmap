# Smooth principal bundles, connections, and holonomy

Develop smooth principal bundles and their associated vector bundles as usable
geometric objects: local trivializations and cocycles, connections and curvature,
parallel transport, gauge transformations, and the integral classification of
circle bundles with connection. The output should support differential geometry,
symplectic reduction and prequantization, and gauge theory without a separate
bundle or connection language in each application.

## Setting, conventions, and existing interfaces

Bases are finite-dimensional, Hausdorff, second-countable smooth real manifolds
without boundary. Structure groups are finite-dimensional real Lie groups,
Hausdorff and second-countable. Vector representations are finite-dimensional
over ℝ or ℂ. Statements about a chosen base point assume a connected nonempty
base. Compactness is imposed only where stated. Smooth means `ContMDiff ... ∞`.

Use Mathlib's `FiberBundle`, `FiberBundleCore`, `Trivialization`,
`Bundle.TotalSpace`, `VectorBundle` and `ContMDiffVectorBundle`; principal structure
is a mixin on this bundle data. A principal bundle has a **right** action, encoded
by `MulAction (MulOpposite G)`. Every atlas trivialization is equivariant on its
source. Freeness and transitivity are fiberwise; smooth local triviality supplies
the projection's surjectivity and submersion property. Do not introduce a second
total-space topology. Open restrictions are pullbacks along `Subtype.val`; their chart maps consume `Trivialization.restrictPreimage`.

Use [`GroupLieAlgebra I G`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Geometry/Manifold/GroupLieAlgebra.html#GroupLieAlgebra)
for the structure Lie algebra. Its tangent-space definition and bracket are
Mathlib's; the left-invariant-derivation comparison is a theorem, not a choice of
a competing Lie algebra. For `A` in this Lie algebra, the fundamental vector at
`p` is the derivative of `t ↦ p·exp(tA)` at zero. For a right principal action
these fundamental vector fields preserve the Lie bracket. Distinguish this from
the sign for fundamental fields of a left action.
Consume Tau Ceti's `leftInvariantDerivationLieEquivGroupLieAlgebra` in
`Geometry/Lie/Tangent/LieEquiv.lean` and the tangent exponential
`mulInvariantExp` in `Geometry/Lie/Exponential/Basic.lean`; its
`lieExp_eq_mulInvariantExp` identifies the derivation-based exponential.
The identity-interior hypothesis holds for the boundaryless groups here.

The connection form satisfies `ω(A#)=A` and `R_g*ω=Ad_(g⁻¹)ω`. Curvature is
`Ω=dω + ½[ω∧ω]`, so `Ω(X,Y)=dω(X,Y)+[ω(X),ω(Y)]`. A change of local section
`s′=s·g` gives `A′=Ad_(g⁻¹)A + g⁻¹dg`. For the associated bundle use
`(p·g,v) ~ (p,ρ(g)v)`. Mathlib's covariant derivative takes its section argument
first: `∇ σ x (X x)` denotes `∇_X σ`.
Sections of `P×_G V` correspond to functions `u(pg)=ρ(g)⁻¹u(p)`.
Pin `s_j=s_i g_ij`, so the bundle-core coordinate change from chart i to j
is left multiplication by `g_ij⁻¹`, and changing `s_i` to `s_i h_i` gives
`g_ij′=h_i⁻¹g_ijh_j`. The left Maurer–Cartan form is
`θ_g=dL_(g⁻¹)` and satisfies `dθ+½[θ∧θ]=0` in the determinant-style
wedge normalization of DifferentialGeometry and Mathlib's `extDeriv`.

The circle is Mathlib's `Circle`, identified explicitly with `ℝ/(2πℤ)` by
`t ↦ exp(it)`. Identify its Lie algebra with ℝ using this parameter, so a real
connection has `ω(X)=1` for the fundamental field X of 1∈ℝ and real curvature `F`, with integral class mapping to
`[F/(2π)]`. The associated complex line bundle uses the circle's
dual character `z ↦ z⁻¹` for the prequantum line convention: its unitary
curvature is `-iF`, and its first Chern representative is `F/(2π)`.
Here `c₁(P)` denotes the first Chern class of this associated line. The line
associated to the standard character has the opposite class. Scaling to
coefficients `ℝ/ℤ` is `t ↦ t/(2π)`.
The circle Lie-algebra identification with ℝ is
`t ↦ t • (mfderiv 𝓘(ℝ,ℝ) (𝓡 1) Circle.exp 0 1)`.
Prove this is a linear equivalence and that its exponential is `t↦exp(it)`;
no sign of the chosen stereographic-coordinate basis is assumed. For the Hopf action
`(z₁,z₂)·λ=(z₁λ,z₂λ)` and connection `Im(z̄₁dz₁+z̄₂dz₂)`, require
`∫_(ℂP¹)F=2π` in the complex orientation and
`⟨c₁(P),[ℂP¹]⟩=1`; the dual-character line is O(1).
Use the alternating Čech coboundary
`(δt)_ijk=t_jk−t_ik+t_ij` and total Čech/de Rham differential
`D=δ+(-1)^p d` on Čech degree p. If `g_ij=exp(i φ_ij)`, the
integer representative of the dual-character class is
`−(δφ)_ijk/(2π)`. Prove the comparison sends it to `[F/(2π)]`
and gives the Hopf value above.
Define holonomy by `τ_γ(p)=p·hol_p(γ)`. Mathlib's fundamental-group
multiplication is `p*q=q.trans p`, so holonomy is a homomorphism and
`hol_(p g)=g⁻¹hol_p g`. For the exponential coefficient Bockstein β
and holonomy character `h(γ)=arg hol(γ)/(2π)`, the class convention
is `c₁(P)=β(h)` on flat bundles. Here the singular Bockstein is
`β[h]=[d h̃]` for a real lift of a circle-valued singular cocycle, with the
ordinary alternating singular coboundary. For parallel local sections, crossing
from i to j multiplies the fiber coordinate by `g_ij⁻¹`, so the holonomy
around a subdivided loop, with final chart `i_n=i_0` and basepoint
`p=s_(i_0)(γ(0))`, is
`g_(i_(n−1)i_n)⁻¹⋯g_(i_0 i_1)⁻¹`, with the last crossing leftmost.
For `p·a` conjugate this expression by `a⁻¹` and `a`.
The dual-character line has the inverse transition cocycle, so its exponential
connecting class is `β(h)`; prove this dictionary and test it on lens spaces.

Mathlib already provides smooth vector bundles and
[`CovariantDerivative`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.html#CovariantDerivative),
its `addOneForm` and `difference` API, and smoothness classes. Tau Ceti supplies
curvature operators and their basic linearity and Bianchi results. Consume those
objects, supplying principal/associated-bundle bridges and missing general
bundle operations here. The
[DifferentialGeometry](../DifferentialGeometry/README.md) roadmap owns generic
forms, wedge, exterior derivative, pullback, Stokes, de Rham theory and the smooth
covering-space structure. The
[LieGroups](../RepresentationTheory/LieGroups/README.md) roadmap owns exponential,
adjoint and Lie-group structure. The
[AlgebraicTopology](../AlgebraicTopology/README.md) roadmap owns singular
cohomology, products and the fundamental group. B6 consumes its Stage6.1
coefficient exact sequences and DGFloer Layer1.1's degree-one
Hurewicz/abelianization theorem, and builds the good-cover comparisons used here.
The sheaf and
Čech comparison needed for the circle classification is built in B6 below.
Algebraic vector bundles on schemes remain the
[AlgebraicVectorBundles](../AlgebraicVectorBundles/README.md) roadmap's objects;
no analytification or algebraic-to-topological comparison is asserted here.

Follow the principal-bundle/connection direction in Mathlib
[#30121](https://github.com/leanprover-community/mathlib4/pull/30121) and
[#38374](https://github.com/leanprover-community/mathlib4/pull/38374): bundle mixins,
opposite-group right actions, Lie-algebra-valued connection forms and frame
bundles. Build the missing APIs in Tau Ceti with these interfaces. Require
equivariance for all atlas trivializations on their domains, not only the
chosen trivialization at each point. Adopt Mathlib's resulting interfaces and
replace the corresponding local constructions when they become available.

## B1. Principal bundles and descent

1. Define a smooth manifold-fiber bundle by smooth overlap maps on the
   product model. For a principal bundle, require smoothness of
   `x↦(e′(e.toOpenPartialHomeomorph.symm(x,1))).2` on base overlaps;
   equivariance then gives smooth full product transitions. Construct the
   smooth atlas for a bundle with arbitrary manifold fiber F (including G): compose
   its atlas trivializations with charts of G and prove smooth transitions
   on the product model `IB.prod IG`. A principal-total-space type synonym
   carries the original total-space topology and this atlas, with the
   canonical homeomorphism to `Bundle.TotalSpace`. This avoids competing
   with Mathlib's generic fiber-bundle chart instance whose model contains G
   itself. Generalize the same type-copy construction to F for B1.5.
   No second topology or vector-space structure on G is installed.
   Define principal structure and smooth equivariant bundle maps. Prove
   atlas extensionality, projection identities, fiberwise torsor uniqueness,
   local sections and smoothness of `δ(p,q)=g` characterized by `p·g=q` in
   one fiber. Prove the projection is a smooth surjective submersion using
   `Manifold.IsSubmersion`/`IsSubmersionAt`. Consume LieGroupoidsPoisson G0.1's
   independent submersion fiber product for `P×_M P`; identify its inherited
   topology and charts with the principal local model `M×G×G`.
   Division is smooth on this manifold, not a function on unrelated pairs.
   Prove generic smooth descent along a principal projection: a map from the
   base to any smooth manifold is smooth iff its composite with the projection
   is smooth. Every invariant smooth map on the total space descends uniquely
   to a smooth base map; use the formula `f|U=F∘s_U` for local sections and
   prove agreement on overlaps, restriction and composition. These generic
   results are owned here; groupoid actions and Hamiltonian reduction consume
   them. From the principal local trivializations prove
   `ker(dπ_p)=range(d(g↦p·g)_1)`, with the orbit map a diffeomorphism onto
   its fiber. Isomorphisms have inverses, composition, restriction, transport
   and extensionality APIs.
2. Construct trivial bundles, restrictions, pullbacks and products over a
   common base, with universal properties and coherent identity/composition
   comparisons. Convert a left principal action to a right action by
   `p·g=g⁻¹p`; prove the infinitesimal generator changes sign.
3. Construct bundles from smooth transition functions `g_ij`, with the
   section and coordinate conventions above. Prove cocycle/bundle
   classification up to equivariant isomorphism, changes by a smooth
   0-cochain, and independence of cover refinement. Define nonabelian Čech
   H¹ as the pointed set of these cocycle classes.
4. Prove the slice theorem for proper smooth actions. Free actions give
   smooth quotient manifolds with surjective submersion projection and a
   principal bundle. For proper locally free actions with finite stabilizers,
   construct transverse slices with finite isotropy actions and equivariant
   quotient-chart transitions. HamiltonianReduction owns gluing symplectic
   forms and its orbifold reduction theorem on these charts. Prove
   properness of the right action on any principal bundle over these bases.
   For a closed Lie subgroup H≤G, consume LieGroups’ closed-subgroup
   structure and apply the free proper right H-action to construct G/H;
   prove G→G/H is a principal H-bundle and its tangent quotient description.
   Reuse Tau Ceti's smooth quotient construction for discrete actions
   (`Geometry/Manifold/Instances/Quotient.lean`) in that specialization.
5. For a smooth surjective submersion `π:P→B` between these manifolds,
   define an Ehresmann connection as a distribution H complementary to
   `ker(mfderiv π)` at every point, with native
   `TauCeti.IsContMDiffDistribution` from DifferentialGeometry Layer4.
   Consume G0.1's smooth constant-rank kernel distribution and construct
   H by orthogonal complement for an auxiliary metric from DG12.1.
   Specialize this same construction to smooth fiber bundles. Develop pullback,
   restriction and local horizontal lifts; transport exists on its maximal
   interval and need not be complete for an arbitrary connection. Prove
   Ehresmann's fibration theorem: a proper surjective submersion with connected
   base is a locally trivial smooth fiber bundle with model fiber `π⁻¹(b₀)`
   for one fixed b₀. Consume LieGroupoidsPoisson G0.1's independent regular-level
   manifold carrier for every fiber, with tangent ker(dπ); G0.1 uses only the
   submersion normal form, not principal bundles or gauge groupoids. Horizontal
   lifts over compact inverse images give path-transport diffeomorphisms
   `π⁻¹(b)≃π⁻¹(b₀)` for each b, by a chosen piecewise smooth path. Around
   each b choose a coordinate ball U and transport along its radial paths to
   obtain `π⁻¹(U)≃U×π⁻¹(b)`, smoothly in both variables. Compose with the
   fixed-fiber comparison to obtain the bundle charts and prove
   its projection identity and smooth comparison maps. For disconnected B
   construct this bundle separately on each connected component; different
   components need not have diffeomorphic fibers. IntegrableSystems
   consumes this local trivialization.

Acceptance: the trivial bundle and the Hopf circle bundle over ℂP¹. Consume
ComplexKahlerGeometry K7.1's projective charts and their underlying real structure
(the chart construction does not depend on B2's associated bundles);
prove the Hopf projection/chart comparison here. The frame-bundle acceptance
example belongs to B2.

## B2. Associated bundles and frames

Construct `P×_G V` and its smooth local trivializations, section/equivariant-map
correspondence, functoriality and pullback comparisons. Construct smooth
finite-rank tensor, dual, exterior-power, direct-sum and Hom bundles and prove
that their associated-bundle descriptions agree. Use existing Mathlib
constructions for dual and Hom rather than introduce replacements.

Complex bundles over a real base are real smooth vector bundles with fiberwise
complex structure and complex-linear transition maps; supply the compatible
`VectorBundle ℂ` structures without asserting a complex structure on the base.
Construct complexification of real bundles and the decomposition maps needed
for complex tangent spaces. For finite-rank real bundles V and D, construct the smooth complex-linear comparison
`(V_ℂ)*⊗_ℂ D_ℂ ≃ (V*⊗_ℝ D)_ℂ`, with complex-linear dual on the left
and real dual on the right. Fix the dual map by
`(z⊗ℓ)(w⊗v)=zwℓ(v)` and use the complexified tensor map for D.
On the complex dual define conjugation by
`(κξ)(u)=conj(ξ(κu))`. Prove inverse, chart compatibility, conjugation
equivariance, real-inclusion compatibility and naturality under bundle
isomorphisms and base diffeomorphisms.
[ComplexKahlerGeometry K5a](../ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality) applies this generic comparison to its real density line, including its
absolute-Jacobian transition and pushforward laws; B2 does not construct that line.
Build Hermitian bundle metrics with their real
metric comparison, positivity, local matrices, dual/tensor and pullback APIs.

For the analytic section theory work over `[RCLike 𝕜]` (both real Riemannian and
complex Hermitian fibers), with continuous positive-definite fiber products
compatible with the bundle topology. Metrics are explicit data h on fixed topological-module fibers, with `h.inner x : E x →L⋆[𝕜] E x →L[𝕜] 𝕜`, Hermitian symmetry, positive definiteness and continuous dependence in charts. Prove the induced norm `sqrt(re(h.inner x v v))` gives the original fiber topology, and parametrize `L²(E,h,μ)` by h rather than changing ambient fiber instances. Smooth metrics are used for smooth unitary
frames; only continuity is needed for the Hilbert construction. Products are
conjugate-linear in the first slot, as in Mathlib's `inner`. Consume
`Bundle.IsContinuousRiemannianBundle`/`ContinuousRiemannianMetric` in the real
case; build their complex Hermitian counterparts and real-part comparison.
Construct the equivalence of real `ContinuousFiberMetric` data with native
`ContinuousRiemannianMetric F E`, proving chartwise joint continuity is
equivalent to continuity in its Hom-bundle and positive metric unit balls are
von Neumann bounded in finite dimension. Preserve the given fiber topology.

Fix `[MeasurableSpace M] [BorelSpace M]` and a Borel measure μ. Define a section s
to be a.e.-strongly measurable when its coordinates in every atlas trivialization e
are `AEStronglyMeasurable` for `μ.restrict e.baseSet`; extend coordinates by zero
outside that chart. Prove independence under continuous linear bundle transitions,
using a countable atlas, and equivalence with `AEMeasurable (fun x ↦ (⟨x,s x⟩ : TotalSpace F E))` when the
compatible Borel total-space structure is installed. Define section support as
`closure {x | s x ≠ 0}`. The L² carrier consists of these sections with
`MemLp (fun x ↦ ‖s x‖_h) 2 μ`, modulo a.e. equality. Prove global norm a.e. measurability from a countable subatlas, and its equivalence to finite `∫⁻ x, ‖s x‖ₑ,h^2 ∂μ`; the MemLp formulation retains measurability explicitly. Construct its
vector-space, norm and inner-product structures with
`⟪s,t⟫=∫ x,⟪s x,t x⟫∂μ`; prove well-definedness, Cauchy–Schwarz,
completeness and identification with Mathlib's `MeasureTheory.Lp` in the trivial
bundle. Use `MeasureTheory.L2.inner_def` for that comparison.

Fix the unitary chart model as `EuclideanSpace 𝕜 (Fin n)` with its standard inner product; compare any original finite-dimensional bundle model by a fixed linear equivalence. Build unitary local frames by Gram–Schmidt on `Trivialization.localFrame` and
prove smoothness for smooth metrics, continuity for continuous metrics. For a
unitary chart, prove the coordinate map is a linear isometry between the
restricted L² section space and `Lp (EuclideanSpace 𝕜 (Fin n)) 2 (μ.restrict U)`, including the inverse.
For a general frame assert bounded coordinate equivalence only on a relatively
compact open U whose closure lies in the frame domain; prove uniform bounds for
the metric matrix and its inverse there. Do not assert arbitrary noncompact
frame coordinates give bounded maps. The trivial-bundle comparison is globally
`L²(Bundle.Trivial M F,μ) ≃ₗᵢ[𝕜] Lp F 2 μ` for its standard product metric.

Under `IsLocallyFiniteMeasure μ`, prove density of compactly supported smooth
sections by localization in relatively compact smooth frames with metric bounds and partitions of unity, consuming
`MeasureTheory.Lp.dense_hasCompactSupport_contDiff` and
`MemLp.exists_hasCompactSupport_eLpNorm_sub_le` in the scalar/model-fiber case.
The base is the second-countable finite-dimensional smooth manifold above.
The map from smooth compactly supported sections has zero kernel precisely up
to a.e. equality; under `IsOpenPosMeasure μ`, prove it is injective and L² is
its Hilbert completion with the integral norm. Without that hypothesis use the
quotient by zero seminorm before completion. Prove separability using a countable
atlas and the finite-dimensional coefficient Lp separability theorem.

Supply restriction to measurable sets with restricted measures, extension by
zero, their isometry/projection identities and the orthogonal splitting over U
and its complement. Restriction of the smooth bundle to an open U means pullback
along `Subtype.val`, with measure `μ.comap Subtype.val`; use `MeasurableEmbedding.subtype_coe` and `map_comap_subtype_coe` to prove `L²(E|_U,μ.comap (↑))≃ₗᵢ[𝕜]L²(E,μ.restrict U)`.
Construct direct-sum isometries, dual/tensor functoriality for bounded bundle
maps and bounded multiplication by essentially bounded measurable scalar
functions, with operator bound `‖M_f‖≤essSup ‖f‖`, composition and adjoint
`M_f*=M_(star f)`. Smooth compactly supported domain formulas agree with these
operators; unbounded multiplication requires its explicitly defined dense domain
and is not asserted to be bounded.

For continuous metrics h₀,h₁ on a compact base prove equivalence of L² norms.
Construct the positive fiber operator H characterized by
`h₁(u,v)=h₀(Hu,v)` and the unitary metric-change map `H^(1/2)` from h₁ to h₀. Work in local h₀-unitary frames and prove independence of that choice,
consuming finite-dimensional `CFC.sqrt` (`Matrix.PosSemidef.inv_sqrt`/`det_sqrt` and positive-operator calculus) and proving the continuous bundle transport/local matrix comparison.
For equivalent measures `ν=μ.withDensity w`, with measurable `w:M→ℝ≥0∞` and `0<w<∞` μ-a.e., construct the
unitary `s↦sqrt(w.toReal)s` from L²(ν) to L²(μ), its inverse and integral identities;
Prove mutual absolute continuity from `0<w<∞` and transfer a.e. measurability/equality between μ and ν before defining the class map. No boundedness of w or its inverse is required for this unitary. Unweighted
identity norm equivalence instead requires essential upper/lower bounds.

Construct the conjugate-linear fiberwise Riesz bijection `u↦h.inner x u`
to the continuous dual bundle by finite dimension and positivity. Define the
dual metric by the explicit formula `h*(Ru,Rv)=h(v,u)`, where R is this
conjugate-linear Riesz map; prove its continuity in dual
trivializations and its norm formula `‖φ‖_(h*)=sup_(‖u‖_h≤1) ‖φ u‖`. When
consuming `InnerProductSpace.toDual`/`ofCoreOfTopology`, use a metric-specific
type copy of the fiber carrying the induced inner product and the inherited
topology, with an explicit identity transport back to the fixed bundle.
No global norm-instance change on E is part of the construction. The resulting
Riesz map is `≃ₗᵢ⋆[𝕜]` between those metric-specific Hilbert fibers, and its L²
counterpart is conjugate-linear. Bilinear integral evaluation identifies
`L²(E*,h*,μ)` complex-linearly with `StrongDual 𝕜 (L²(E,h,μ))`.

For real E use fiber `ℂ ⊗[ℝ] E x`. Give it the product topology transported
through the real/imaginary-part equivalence with `E x × E x`, and choose model
`EuclideanSpace ℂ (Fin n)` for real rank n after a fixed basis of the original
model. Construct the complex scalar structure and Hermitian product and prove
compatibility with the complex bundle charts and existing real complexification.
Do not infer a complex inner product from Mathlib's real tensor-product one.
Prove the L² complexification identity using pairs `(s,t)` with J(s,t)=(-t,s),
product `⟪(s,t),(s′,t′)⟫=⟪s,s′⟫+⟪t,t′⟫+i(⟪s,t′⟫−⟪t,s′⟫)` and squared
norm `‖s‖²+‖t‖²`; compare the fiberwise real/imaginary-part maps.

For a unitary bundle isomorphism A covering a `MeasurePreserving` diffeomorphism
φ from (M,μ) to (N,ν), construct the unitary from L²(E,μ) to L²(E′,ν) given by
`(U_A s)(y)=A_(φ⁻¹y)(s(φ⁻¹y))`; prove inverse, composition, a.e. transport and
smooth compact-support compatibility. Its inverse is
`(U_A⁻¹t)(x)=A_x⁻¹(t(φ(x)))`, the pullback used by
GeometricQuantization's flow operators.

Construct the Borel measure associated with a smooth positive density, using
local Lebesgue densities and proving overlap independence and equality of its
integral with DifferentialGeometry 5.5's density integral. Prove local finiteness
and positivity on nonempty open sets. Compare with `TauCeti.riemannianVolume`
for Riemannian densities and construct the Liouville measure of a symplectic
form, agreeing with its oriented top-form integral. These are instances of the
measure-parametrized theory, not prerequisites silently supplied by a density.
ComplexKahlerGeometry K5 and GeometricQuantization Q2 consume this entire
real/complex L² construction; no complex structure on the base is needed.

Construct real rank-n and complex rank-n frame bundles with
`Matrix.GeneralLinearGroup (Fin n) ℝ` and
`Matrix.GeneralLinearGroup (Fin n) ℂ`, the latter regarded as a real Lie group.
Pin the matrix normed-ring instances to `Matrix.linftyOpNormedRing`
and the topological-space instances to `Matrix.linftyOpTopologicalSpace`,
for both real and complex matrices, as in Tau Ceti's native general-linear
Lie construction. Prove the identity homeomorphism with default entrywise
matrix topology by finite-dimensional norm equivalence, and its induced
units-level homeomorphism on `Matrix.GeneralLinearGroup (Fin n) 𝕜`,
for `𝕜=ℝ,ℂ`. Prove compatibility
of multiplication, inversion, frame evaluation and manifold charts.
The right action is `f·g=f∘g`; recovery is `[f,v]↦f(v)`.
Prove an equivalence of **groupoids of isomorphisms**
between the corresponding smooth vector bundles and principal GL_n bundles. Orthogonal,
unitary and symplectic reductions encode the corresponding nondegenerate
fiberwise structures; give their transition criteria. Positive metrics exist
by partitions of unity. Define reduction of structure group to a closed Lie
subgroup as a principal subbundle inducing the original bundle. Also define
reductions to immersed Lie subgroups, with the reduced bundle carrying its own
manifold structure and an injective immersed map into P; no subspace topology
is imposed on it. Define extension
along a smooth group homomorphism as the associated principal bundle. Prove
functoriality, pullback and extension/reduction identities. Circle tensor and
dual bundles are extensions along multiplication and inversion.

Construct `ad(P)` with its pointwise Lie bracket. An Ad-invariant bilinear
form on the structure Lie algebra induces a well-defined smooth fiber pairing
on `ad(P)`; prove nondegeneracy when assumed and its pullback compatibility. All equivalences expose maps
on morphisms, unit/counit and naturality. The tangent/frame example uses
Mathlib's tangent bundle and metric interfaces, with no competing tangent norms.

## B3. Connections and covariant differentiation

Use DifferentialGeometry's `SmoothBundleForm` carrier and its fixed-coefficient
specialization for the principal Lie-algebra-valued form. Use its `bracketWedge`
normalization and `CurvatureForm` for induced endomorphism-valued curvature. Define connections by
reproduction and equivariance, and equivalently by equivariant horizontal
complements using B1.5's native smooth-distribution carrier. Prove vertical-fiber identification, horizontal projections,
smoothness, pullback, restriction and isomorphism transport. The difference is
a basic `ad(P)`-valued one-form; build the affine action of `Ω¹(M;ad(P))`,
addition/difference identities and existence by locally finite partitions of
unity. Prove the local-potential transformation and inverse gluing construction,
and the left Maurer–Cartan equation with the normalization above.

Construct the smooth vector bundle `TP/G` and identify its sections with
G-invariant vector fields on P. Build the exact Atiyah sequence
`0 → ad(P) → TP/G → TM → 0`; use `ξ ↦ −V_ξ` for the first map, where
`V_ξ(p)=ξ(p)#`, so its pointwise bracket agrees with the invariant-field bracket.
Connections correspond to smooth splittings s(X)=X^h; for the injection
j(ξ)=−V_ξ prove `ω(j(ξ))=−ξ` and
`[s(X),s(Y)]−s([X,Y])=j(F(X,Y))`. LieGroupoidsPoisson owns the resulting
Lie algebroid structure and integration by the gauge groupoid. Prove the
horizontal-field identity `[X^h,Y^h]=[X,Y]^h−V_(F(X,Y))`.

Induce a connection on each associated bundle and identify it with Mathlib's
`CovariantDerivative`. Prove `∇=d+ρ_*(A)` in local frames, complex linearity for
complex representations, and agreement with the frame-bundle description.
Develop induced dual/tensor/exterior/Hom connections and their pairing rules.
For a vector fixed by the structure-group representation, construct its
associated section and prove it is parallel for every induced principal
connection. Apply this to invariant tensors as well as vectors, with the
explicit local equivariance and covariant-derivative comparison.
Construct metric- and symplectic-compatible connections by the corresponding
principal reductions. Use Mathlib’s `leviCivitaConnection` and Tau Ceti’s regularity results for
Levi-Civita; this roadmap supplies its frame-bundle description.

## B4. Curvature and gauge transformations

Prove curvature horizontal and equivariant, descending to `Ω²(M;ad(P))`.
Build the exterior covariant derivative `d_∇` here on the generic bundle forms,
its graded Leibniz rule and `d_∇²α=ρ_*(F)∧α`. For the Ad-invariant
fiber pairing B, define the wedge pairing on adjoint-valued forms and prove
`d B(α∧β)=B(d_Aα∧β)+(-1)^degα B(α∧d_Aβ)`; combine with Stokes
for the integration-by-parts identity used by HamiltonianReduction R5. Identify the endomorphism curvature
with Tau Ceti's `CovariantDerivative.curvatureOperator`:
`∇_X∇_Yσ−∇_Y∇_Xσ−∇_[X,Y]σ=ρ_*(F(X,Y))σ`.
Prove the structure equation, Bianchi `d_AF=0`, pullback, dual/tensor curvature,
and `F_(A+a)=F_A+d_Aa+½[a∧a]`.

The gauge group is smooth equivariant bundle automorphisms covering identity,
identified with `u:P→G`, `u(pg)=g⁻¹u(p)g`, acting by `p↦p u(p)`.
The left action on associated sections is `f↦ρ(u)f=(Φ_(u⁻¹))^*f`;
prove covariance with the inverse-pullback connection action.
Prove its actions on associated sections, connections and curvature, local
formulas, composition, stabilizers and connection-preserving subgroup.
For the pullback action by `u=exp(tξ)`, differentiate to `δA=d_Aξ`; the
inverse-pullback left action has generator `−d_Aξ`. For equivariant adjoint sections prove `[V_ξ,V_η]=−V_[ξ,η]`,
`[−V_ξ,−V_η]=−V_[ξ,η]`, and `Φ_u∘Φ_v=Φ_(uv)` for
`Φ_u(p)=p u(p)`; distinguish the derivative of this left evaluation action
from the bracket-preserving Atiyah injection j. These are groups of smooth maps; Sobolev completions and
Coulomb slices for surface gauge reduction are HamiltonianReduction R5's work.
Construct connection-preserving bundle maps covering base diffeomorphisms and
their coherent pullback/composition identities, for GeometricQuantization.

## B5. Parallel transport, holonomy, and flat bundles

Construct unique horizontal lifts of piecewise C¹ paths with prescribed initial
point, throughout each compact path interval. Use local trivializations and
complete Lie-group evolution for the time-dependent group equation; arbitrary
Ehresmann connections do not inherit this completeness. Develop identity,
concatenation, reversal, reparametrization, equivariance and pullback. Compare
associated transport with Tau Ceti's covariant derivative along curves.
Prove smooth dependence for smooth finite-dimensional families on a common
interval. Consume Tau Ceti’s `contMDiffOn_maximalIntegralCurve` and
`exists_contDiffAt_localFlow` on the parameter- and time-augmented field,
with DifferentialGeometry 3.5's manifold-flow interface. Prove local chart
extension and uniqueness-based patching across the compact interval.
Prove complete evolution for the group equation
`ġ=−dR_g(A(γ̇(t)))`: on a compact time interval the coefficient has compact
range, so right translation of a fixed identity neighborhood gives a uniform
local existence time; finite iteration covers the interval. This is a B5
target, not an assumed LieGroups theorem. The autonomous Picard theorem in
`Analysis/ODE/SmoothParameter.lean` requires a zero-field base parameter;
use it only after time rescaling supplies that hypothesis, not directly on
an augmented field whose time component is 1.

Define based holonomy with the convention above and its conjugation under
change of fiber point. Prove zero curvature iff local parallel trivializations
exist, applying DG4.3's Frobenius theorem to B1.5's horizontal distribution.
For flat connections extend transport to **continuous** paths by local
parallel charts and finite subdivision, prove independence of subdivision and
agreement with piecewise C¹ transport, and prove invariance under continuous
homotopies rel endpoints. Thus the flat principal-bundle groupoid is equivalent
to representations of Mathlib's `FundamentalGroupoid` in right G-torsors.
The arrow sends its source fiber to its target fiber. Prove the morphism/
intertwiner correspondence. On connected based M identify isomorphism classes
with `Hom(π₁(M),G)/conjugacy`. Construct the inverse from Tau Ceti's smooth
universal cover, identifying its path model and right deck action
`[a]·[γ]=[γ.trans a]`. Define the quotient using the right π₁-action
`([a],g)·γ=([a]·γ,ρ(γ)⁻¹g)` and the principal action
`[a,g]·h=[a,gh]`; prove lifted γ ends at `[a₀,ρ(γ)]`, giving
holonomy ρ. Supply the adapter to the existing universal-cover representation. Associated vector bundles give the linear equivalence.

On a connected based M with a chosen point of P over the basepoint, construct
the restricted holonomy H⁰ and full holonomy H with their immersed Lie-group
topologies, using LieGroups’ `integralSubgroup` carrier. Prove the subgroup
theorem used here: a subgroup connected by piecewise C¹ arcs is an immersed
Lie subgroup. Prove Ambrose–Singer: Lie(H⁰) is the linear span of curvature
values transported to the base point, and that span is bracket closed.
Identify H⁰ with the identity component of H in its immersed topology;
construct π₁(M)→H/H⁰, and consume
[LieGroupoidsPoisson G0.0](../LieGroupoidsPoisson/README.md)'s independent
topological theorem that the fundamental group of a connected second-countable
manifold is countable. Verify its local path-connectedness and local simple
connectedness hypotheses using sufficiently small convex coordinate neighborhoods.
That theorem uses countable coordinate neighborhoods and components of their
overlaps, without connections or holonomy. Give the
countable coset union its Lie-group topology.

Construct the connection-preserving immersed principal **H** reduction Q→M
using B2's reduction notion, with smooth inclusion Q→P and the restricted
connection. Form the regular covering `M'=Q/H⁰→M` and prove its deck-group
identification with H/H⁰; for right-action conventions use the left deck
action `[h]·[q]=[q h⁻¹]`. Construct the principal H⁰-bundle Q→M' and its
connection-preserving map `q↦([q],q)` into the pullback of P to M'. After
pullback to the universal cover, construct the restricted-holonomy reduction
there as well. Over M itself this reduction applies when H=H⁰, in particular
when M is simply connected. Prove the base-change and basepoint-conjugation
comparisons on these actual bundles. Closedness of holonomy in G is not
asserted. Flat torus connections and
circle bundles with prescribed loop holonomy are acceptance examples.

## B6. Circle bundles, integral classes, and flat ambiguity

**B6.0. Smooth good covers.** On finite-dimensional Hausdorff second-countable
manifolds with boundaryless model, prove the following for **any chosen smooth
positive-definite Riemannian metric**, including its given-metric convexity
radii and endpoint maps. DifferentialGeometry 12.1 constructs an auxiliary
metric when none is specified. Construct the compatible extended
metric using `EMetricSpace.ofRiemannianMetric`; T3 follows from Hausdorffness
and local compactness. Consume HopfRinow's exponential/logarithm
and Gauss-lemma APIs. Prove the variable-base inverse-function theorem for
(x,v)↦(x,exp_x v), then strict convexity of squared local radial distance
along sufficiently short geodesics, following Lee RM Lemma6.16/Thm6.17.
Construct strongly geodesically convex neighborhoods in Lee's sense: any
pair is joined by a unique globally minimizing geodesic, entirely in the
neighborhood. Export positive uniform normal and strong-convexity
radius bounds on each compact set for the given metric, with `IsNormalDomain`
on every tangent ball of that normal radius. Prove these bounds by the
variable-base inverse-function neighborhoods and a finite compact subcover;
they do not require a separately defined global injectivity-radius function.
Export smooth dependence of the segment on its endpoint pair/time. Build locally
finite good-cover refinements, finite when compact.
Require each cover member V to be uniformly normal: for every q∈V choose
r_q>0 with `IsNormalDomain` on B(0,r_q) and V⊆exp_q(B(0,r_q)), following
Lee RM Lemma6.16/Theorem6.17. Each nonempty finite intersection W inherits
this property and strong convexity. Export a chosen q∈W, its normal ball
parameter, and `H(s,x)=exp_q(s log_q x)` on its natural open domain containing
[0,1]×W. Use `riemannianLog I M q (B(0,r_q))` and
`contMDiffOn_riemannianLog` with the explicit normal-domain witness. Unique
minimizers and strong convexity keep H in W. For a globally smooth homotopy
ℝ×W→W usable by DG5.4, reparameterize with a fixed smooth step ρ:ℝ→[0,1],
ρ(0)=0 and ρ(1)=1, constant outside [0,1], and prove the endpoint/basepoint
and slice identities. Raw H and its reparameterization have separate domain
statements. Use product swap and explicit restriction to W×Icc(0,1),
with model I.prod(𝓡∂1), for DG5.4's actual homotopyOperator. These covers and contractions precede the principal
bundle/connection layers and are inputs to DifferentialGeometry's homotopy operator.

1. **B6.1.** Use the native `TopCat.Sheaf` carriers: `smoothSheafAddCommGroup` for
   smooth ℝ-valued functions and `smoothSheafCommGroup` for `Circle`.
   Use `Additive Circle` and its transported manifold model to put the
   exponential homomorphism into the additive sheaf category, and consume
   `smoothSheafAddCommGroup.compLeft`; compare with the multiplicative
   circle sheaf. Construct the locally constant integer sheaf and identify
   it with the exponential kernel, proving exactness of `t↦exp(2πit)` on stalks.
   Prove acyclicity of smooth real functions by partitions of unity.

   **Native fixed-cover complex and the displayed coordinates.** For every
   indexed open cover `U : ι → Opens M`, use Mathlib's actual
   `CategoryTheory.cechComplexFunctor U` on the actual presheaf underlying each
   relevant sheaf. In degree `p` its factors are indexed by every ordered
   tuple `i : Fin (p+1) → ι`, including repetitions, and are sections over the
   categorical product `∏ᶜ fun j ↦ U (i j)`, which in `Opens M` is their
   intersection. Construct the canonical product/intersection isomorphism,
   including repeated factors; do not replace the native tuple index by
   distinct finite subsets. Identify the concrete module `cechConstants U p`
   with the native complex of the locally constant real sheaf by the map that
   sends a scalar on each nonempty good intersection to its constant section.
   The finite contraction in B6.0 makes each nonempty intersection connected,
   so every locally constant real section there is constant. On an empty
   intersection the locally constant sheaf has the zero module, matching the
   zero-only factor in `cechConstants`; the pointwise constant presheaf with a
   spurious ℝ-valued section on `∅` is not this sheaf. Prove the degreewise
   maps are mutually inverse and commute with every face restriction. Thus
   the native alternating-coface differential
   `δc(i)=Σ_j (-1)^j c(i∘j.succAbove)|_{∩U_{i_k}}` is exactly the displayed
   formula, for repeated tuples and empty intersections as well as distinct
   nonempty ones. Do this for integer and real locally constant coefficients;
   use the additive-group-valued native sheaf for `AdditiveCircle`, not a
   fictitious ℝ-module structure on the circle.

   **Augmentation is a separate, conditional comparison.** For the actual terminal object
   `T=⊤` of `Opens M`, consume Tau Ceti's `cechAugmentation U hT P`. Its degree-zero
   component followed by the projection indexed by `a : Fin 1 → ι` is exactly
   `P.map (hT.from (∏ᶜ fun j : Fin 1 => U (a j))).op`. Prove this component equation
   for the locally constant, smooth-function, and additive-circle sheaves. Do not infer
   from `cechConstantsNativeIso` that the augmentation is a quasi-isomorphism. Tau Ceti's
   criterion says this happens exactly when the presieve sheaf condition holds and the
   native Čech complex is exact in each positive degree; prove those hypotheses at the
   later good-cover/fine-sheaf comparison where they apply. A fixed-cover augmentation
   for an arbitrary presheaf or arbitrary cover is not automatically a quasi-isomorphism.

   Construct raw refinement maps from a function `r : κ → ι` and actual
   inclusions `V_a ⊆ U_(r a)`: on tuple `j` precompose by `r ∘ j` and restrict
   to the smaller intersection. Prove the cochain-map equation, coefficient
   and sheaf-morphism naturality, identity and composition equations. For two
   refinement functions of the same covers, build the explicit native
   refinement cochain homotopy; repeated indices are retained, so do not claim
   the category of raw refinement functions is filtered. Consume TS973 TS1.1–1.2
   here for its arbitrary-space fixed-cover, raw-map, homotopy and small-cofinal
   cohomological-colimit constructions. Only after that raw construction prove
   independence in cohomology and pass to its directed refinement preorder.
   Do not import TS1's later compact-derived or support comparisons, or its
   advanced duality, as a prerequisite.

   Prove the locally constant, smooth-function and additive-circle coefficient
   maps commute with the native Čech maps. Compare the stalk-exact sequence
   `0 → ℤ → C^∞(ℝ) → C^∞(AdditiveCircle) → 0`, with its maps fixed by
   `t ↦ exp(2πit)`, to the native exponential sequence of sheaves. Construct
   the induced connecting morphism by lifting cochains after a cover
   refinement, record its alternating-Čech sign, and prove the comparison
   square with AlgebraicTopology Stage6.1's singular Bockstein commutes.
   Sheaf exactness is stalkwise: do not assert that the exponential sequence
   is sectionwise surjective on each arbitrary open set or that an arbitrary
   cover augmentation is a quasi-isomorphism. Use the good-cover/fine-sheaf
   hypotheses at the exact later comparison where they apply.

   Build Čech cochains, refinement and comparison with singular integral cohomology
   on smooth manifolds using B6.0's locally finite smooth good covers. In the double complex
   `Č^p(U;S^q)` use `D=δ+(-1)^p d_sing` and both edge inclusions.
   Require coefficient naturality for ℤ, ℝ and ℝ/ℤ and exact compatibility
   with connecting maps. Consume DifferentialGeometry 8.3–8.5's smooth singular
   chains and `chainIntegral` for the map of double complexes from the
   Čech/de Rham complex to the Čech–smooth-singular complex. Prove that native
   singular subdivision and `singularSubdivisionHomotopy` factor through
   `smoothToSingular` as `S∘ι=ι∘S∞` and `P∘ι=ι∘P∞`: their affine-simplex
   pushforwards are smooth and compatible on faces. Use DG8.4's
   `fullSimplex`/`StdSimplex` identification for these factorizations.
   Prove the smooth small-chain theorem using these operators. Each horizontal
   row, augmented by cover-small cochains on M, is exact simplexwise: it is the
   augmented Čech complex on the nonempty set of cover indices containing
   that small simplex. Restriction along the natural inclusion
   `smoothToSingular` gives a map from the Čech–continuous-singular to the
   Čech–smooth-singular double complex. On each intersection DG8.4 gives
   `smoothCochainRestriction_quasiIso`; products of real modules preserve exactness.
   Prove the induced total map is a quasi-isomorphism by the Čech-degree
   filtration, finite in every total degree. The
   column-zero integration square is DG's `smoothIntegration`, with evaluation
   exactly `chainIntegral`. Consume its `chainIntegral_map` and naturality.
   Prove the resulting
   cohomology comparison agrees with DG's `deRhamHom` by
   `deRhamHom_comparison`, including the
   coefficient/sign normalization; there is one de Rham comparison.
   Prove the real-constant-coefficient Čech–de Rham isomorphism using the
   specified smooth contractions and partition-of-unity double-complex maps,
   with refinement naturality. Write the two edge cochains explicitly: a global
   q-form restricts to the p=0 column, and a locally constant real p-cochain is
   included as a constant q=0 form. Check horizontal restriction and vertical de Rham
   differential separately, then verify the total sign `D=δ+(-1)^p d` makes both
   inclusions cochain maps. The vertical contraction and horizontal
   partition-of-unity contraction give the two comparison directions; state their
   chain homotopies and refinement/coefficient naturality instead of postulating an
   abstract isomorphism. Identify the horizontal row with the native fixed-cover
   Čech complex above before using its augmentation or refinement colimit; identify
   the vertical column with the actual smooth de Rham resolution on that intersection.
   The integer-to-real and real-to-circle connecting squares use these same edge maps
   and the pinned exponential/Bockstein sign consumed by B6.2–B6.4.
   Pin the actual cochain maps and inverse
   homotopies by contracting each vertical column with
   dK+Kd=1−ι∘ev_q and each horizontal row by the partition of unity.
   Prove the finite-degree homological perturbation/totalization lemma for
   these contractions and its explicit zig-zag formula, including smooth
   parameter dependence. For the continuous Čech–singular double complex use AT3.2's
   small-chain comparison; for the smooth one use the preceding smooth
   subdivision theorem for the restriction from all cochains to cover-small
   cochains. An exact de Rham form therefore maps to a Čech
   coboundary; export this implication and the explicit cochain maps.
   Consume AlgebraicTopology Stage6.1's coefficient long exact sequence and
   Bockstein on its actual absolute/relative singular cochain complexes,
   including `0→ℤ→[×2]ℤ→F₂→0` and `0→ℤ→ℝ→ℝ/ℤ→0` on arbitrary spaces/pairs.
   Prove the good-cover/sheaf comparison commutes with those maps, with
   naturality and the exponential normalization above. Consume DGFloer Layer1.1's
   degree-one Hurewicz theorem and prove its component/groupoid dictionary
   for this good-cover comparison; do not duplicate its general proof.
2. **B6.2.** Define `c₁(P)` using the exponential connecting map on the transition
   cocycle for the **dual-character** associated line. With the comparison
   fixed in B6.1, consume DG9.3's general fundamental-class integration
   comparison on K7.1's common ℂP¹ carrier, oriented by its complex
   orientation and AT6.3's tangent-orientation comparison:
   `∫_(ℂP¹)η=⟨deRhamHom[η],[ℂP¹]_ℝ⟩`.
   The integral uses DG5's top-form carrier; the class is the real image
   of AT6.3's integral fundamental class. Consume DG8.3's smooth/continuous
   relative-chain comparison and DG9.3's local-generator comparison for this
   identification.
   Prove the Hopf normalization above as a theorem and prove circle-bundle
   classification by `H²(M;ℤ)`. Tensor, dual and pullback give sum, negation
   and pullback. Construct tensor products of bundles **with connection**
   and prove curvature/holonomy addition and coherent associativity/unit.
3. **B6.3.** Prove rank-one Chern–Weil: `c₁(P)_ℝ=[F/(2π)]` under DG8's `deRhamHom`, identified with the Čech comparison by B6.1.
   A prescribed closed real two-form F is circle curvature iff its class
   divided by `2π` lies in the integral image. Prove adjustment of a chosen
   connection by a global one-form and the equivalent integral-period
   criterion on singular two-cycles.
4. **B6.4.** Flat circle bundles with connection are classified by `H¹(M;ℝ/ℤ)`.
   On connected based M this is `Hom(π₁(M),ℝ/ℤ)`; use the groupoid or product
   over components otherwise. Their Chern class is `β(h)` for the holonomy
   convention fixed above. Flatness exists on a fixed bundle iff its real
   Chern class is zero. Prove the kernel is the universal-coefficient subgroup `Ext(H₁(M;ℤ),ℤ)`.
   It equals torsion when H₁(M;ℤ) is finitely generated; prove that specialization using universal coefficients. No
   finite-generation-free identification with torsion is asserted.
5. **B6.5.** If fixed curvature F has a realization, its bundle-with-connection
   isomorphism classes form a torsor for `H¹(M;ℝ/ℤ)`. On a fixed underlying
   bundle with a curvature-F connection A₀, the equal-curvature gauge classes
   form a torsor for `H¹_dR(M;ℝ)/(2π image H¹(M;ℤ))`. The chosen origin A₀
   identifies it with that group by `[A]↦[A−A₀]`; replacing A₀ by A₁
   translates coordinates by `−[A₁−A₀]`. Prove the exact-sequence relationship
   retaining torsion classes and the distinction between bundle and
   connection isomorphisms.
6. **B6.6.** Generalize the exponential/Čech theory to an integral rank-n lattice
   local system Λ and its associated real vector bundle. Construct the
   torus bundle `(Λ⊗ℝ)/Λ`, its sheaf of smooth sections, and the affine torus
   bundle torsors with fixed lattice local system Λ; morphisms induce the identity on Λ. Prove their characteristic
   class classification by singular cohomology with local coefficients
   `H²(M;Λ)`. Construct Čech cohomology of the locally constant sheaf Λ
   and its natural comparison with AlgebraicTopology’s singular local-system
   cohomology carrier, compatible with the exponential connecting map. Prove
   triviality iff the class vanishes,
   refinement/naturality and the locally constant GL_n(ℤ) transition rule.
   This owns the topological torus-bundle obstruction for IntegrableSystems;
   its symplectic/Lagrangian obstruction is owned there.

## B7. Acceptance and dependency order

B1 precedes B2; B3 uses B1–B2 and generic differential forms. B4 follows B3.
B5 uses B3–B4, LieGroupoidsPoisson G0.0's independent fundamental-group
countability theorem, and universal covers/Lie subgroup theory. B6.0–B6.1 use differential forms, smooth partitions of unity, the early
arbitrary-space TS973 TS1.1–1.2 raw fixed-cover/refinement interfaces, and
the cohomological/convex-neighbourhood suppliers independently of B1–B5;
TS1 is used only at its generic cover-map/homotopy/cofinality scope here, not
through later compact-derived or support comparisons. The
circle-bundle and connection items B6.2–B6.6 consume B1–B5 as specified above,
singular cohomology and the de Rham comparison, while B6.0–B6.1 build the missing
Čech/sheaf comparison and convex-neighborhood results from HopfRinow.
B1’s Hopf test consumes only the independent projective charts/orientation
layer ComplexKahlerGeometry K7.1, consuming AT4.6's projectivization topology. The local curvature identities and flat classification
can be developed independently of B6's integral theory.

In addition to the examples already named, compute circle bundles and
connections on the two-torus, the trivial flat bundle with nontrivial holonomy,
and a torsion circle bundle on a lens space with nonzero integral class and zero
real class. For the flat connection on p*Hopf fixed below, with holonomy
`ζ=exp(2πi/n)`, compute full holonomy μ_n and trivial restricted holonomy;
its full holonomy reduction is the S³ covering and its restricted reduction
has base S³. For character `exp(2πik/n)`, prove that full holonomy is
`μ_(n/gcd(n,k))` and the covering underlying the full reduction is
`S³/μ_gcd(n,k)`, which is also the base of the restricted reduction. Use these to test the tensor/pullback operations and the distinction
between curvature, integral class and holonomy. Consume Tau Ceti’s existing lens-space manifold and fundamental-group APIs;
construct on the native `LensSpace n ![1,1]` carrier a CW structure with
one cell in each degree 0–3, with explicit characteristic maps. The
one-cell loop is γ below; choose the two-cell generator so its boundary is
n times that loop, and prove d₁=d₃=0. Compute H² and the Bockstein from
these cellular complexes and AT's universal-coefficient/coefficient-LES maps.
Prove the cellular-to-singular comparison commutes with Bocksteins by
dualizing AT4's degreewise-free integral chain-homotopy comparison and
comparing the coefficient short exact sequences and lifted coboundaries.
The residue of the dual two-cell cochain fixes the ℤ/n identification.
 For L(n,1), n≥2 (and n≥3 for a sign-distinguishing test), use the
explicit loop `γ(t)=[exp(2πit/n)w₀]` and `χ(γ)=1/n mod ℤ`.
For the projection `p:L(n,1)→ℂP¹`, compute `u=p^*c₁(Hopf)` as the
class corresponding to 1 in this fixed ℤ/n identification: compute the
explicit pullback Hopf transition cocycle through B6.1 and compare it to the
dual two-cell cocycle. This is a calculation, not a definition of the generator. The pullback Hopf
bundle is `(S³×Circle)/μ_n`, with `(v,λ)~(vζ,ζ⁻¹λ)`. Construct its
equivariant isomorphism to p*Hopf by `[(v,λ)]↦([v],vλ)`, with right action
`[(v,λ)]·μ=[(v,λμ)]`, and prove projection, action and chart identities.
Construct a flat connection and calculate its holonomy along γ as ζ.
Prove independently that `β(χ)=u`, tying the torsion sign to Hopf’s value. The flat principal
bundle with holonomy `exp(2πik/n)` has `c₁=k u` in the dual-character
convention. This is the torsion sign test in addition to the Hopf test.

[GeometricQuantization](../GeometricQuantization/README.md) consumes B3–B6 for
prequantum bundles and connection-preserving lifts; it owns polarized sections
and quantization operators. [HamiltonianReduction](../SymplecticGeometry/HamiltonianReduction/README.md)
consumes B1, B3–B5 for gauge spaces and curvature moment maps. [LieGroupoidsPoisson](../LieGroupoidsPoisson/README.md)
consumes the Atiyah bundle sequence and flat-bundle dictionary; the Lie
algebroid/groupoid structures and their integrations are owned there.

## References

- Kobayashi and Nomizu, *Foundations of Differential Geometry*, volume I,
  principal connections, curvature, holonomy and Ambrose–Singer, translated
  to the determinant-style wedge normalization above.
- Laurent Charles, [*Holonomy and Chern classes*](https://webusers.imj-prg.fr/~laurent.charles/IMPA/chapt2.pdf), §2.4, for the singular-cochain characteristic formula; translate from associated-line holonomy to the principal holonomy fixed here.
- Loring Tu, *Differential Geometry: Connections, Curvature, and Characteristic
  Classes*, principal bundles and connection forms; its formulas are translated
  to the right-action and real-circle conventions above.
- [Cannas da Silva, *Lectures on Symplectic Geometry*](https://www.math.ist.utl.pt/~acannas/Books/symplectic.pdf),
  for bundle/form prerequisites and symplectic applications.
- [Freed, *Classical Chern–Simons Theory, Part 1*](https://arxiv.org/abs/hep-th/9206021),
  for principal connections, gauge transformations and integral geometric data.
