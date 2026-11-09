# Complex manifolds, Dolbeault theory, and Kähler geometry

Develop the local analytic and differential geometry of complex manifolds, holomorphic
bundles, Dolbeault cohomology and compact Hermitian/Kähler Hodge theory. The development
includes analytic germs and subvarieties, canonical Hermitian connections, duality and
explicit projective, torus and non-Kähler examples. These are reusable theories with basic
calculus and functorial APIs, not only statements of Hodge decomposition or the Kähler
identities.

## Conventions and suppliers

Manifolds are finite-dimensional, Hausdorff and second-countable, without boundary;
compactness and connectedness are stated where used. Complex manifolds use Mathlib's
complex `IsManifold`; holomorphic means `MDifferentiable ℂ` in charts. K3.0 consumes Tau
Ceti's equivalence of this with complex `ContMDiff` maps of every nonzero order, including ω,
in finite dimensions (`TauCeti.contMDiff_iff_mdifferentiable`). Their
real scalar restriction, holomorphic quotients, open gluing and holomorphic vector-bundle
objects follow the [ComplexManifolds roadmap](../ComplexManifolds/README.md). Its Milestones
1 and 2 supply real restriction, atlas transport, the canonical complex
orientation and its compatibility laws in DG's orientation carrier. Milestone 3
owns the OnePoint complex atlas consumed by K7.1; Milestones
4–6 own discrete holomorphic quotients, open gluing and their topology;
Milestone 7 owns the holomorphic-transition mixin, bundle cocycle gluing
and operations on native vector bundles. Consume these specified Tau Ceti
targets, including their model and tangent comparisons; the milestone references
are pinned to the [ComplexManifolds contract](../ComplexManifolds/README.md).
Complex-torus quotients follow
[ComplexTori](../ComplexTori/README.md) Milestone 1, with the fixed-torus
theory used in K7 and the [specified ComplexTori contract](../ComplexTori/README.md).

Use [DifferentialGeometry](../DifferentialGeometry/README.md)'s generic smooth forms,
exterior derivative, pullback, wedge, integration, Stokes and de Rham comparison. Its chain integration and Stokes already allow complete vector-valued coefficients;
its de Rham comparison is stated over ℝ. K5a owns the complex-linear manifold integration compatibility and complex-coefficient de Rham
comparison on the same generic form carrier, viewed over ℝ; do not construct a second form carrier.
For an open planar domain Ω⊂ℂ, consume [GlobalHolomorphicFunctions GH5.1](../GlobalHolomorphicFunctions/README.md)'s proof that every smooth complex-valued 2-form is
exact, and prove the adapter to this carrier's complex de Rham quotient and `H²_dR(Ω;ℂ)=0`.
Consume [RealAlgebraicGeometry Layer 7](../../Completed/RealAlgebraicGeometry/README.md#layer-7-analytic-preparation-and-mccallum-projection)
for analytic inversion and local real-germ complexification in model spaces;
consume the native joint analytic implicit-function theorem as specified in K1,
which owns the complex-manifold, chart and local-uniqueness adapters.
[SmoothBundlesConnections](../SmoothBundlesConnections/README.md) supplies real smooth
bundles with complex structure, tensor/dual/Hom/complexification, Hermitian metrics,
connections, curvature and their principal-bundle comparison maps; its B6.1 owns the
manifold good-cover/sheaf/singular comparison and B6.2 the circle-bundle
classification by `H²(M;ℤ)`, which B2's associated-bundle comparison turns into the
smooth complex-line classification consumed in K4.P. TopologicalKTheory consumes K5–K7,
including K7.2's complex characteristic cells, and is not a supplier here; K4.P compares
smooth and continuous complex lines itself through the two exponential sheaf sequences, a
rank-one statement that differs from TopologicalKTheory's arbitrary-rank smoothing of
continuous bundles by partitions and matrix models.
K4.P owns, on every complex manifold, the unit sheaf, `Pic_hol`, the holomorphic
exponential segment, the conditional `c₁` isomorphism and `F_M`; ComplexComparisonPartII
C5.4, K3Surfaces 1.1 and GeometricQuantization §3.3 consume them, and this roadmap
cites no section of theirs. [PDE](../PDE/README.md)
supplies scalar real-domain Sobolev, embedding, Rellich and elliptic estimates, not system
estimates. [PseudodifferentialOperators P1.0](../PseudodifferentialOperators/README.md#p10-differential-operator-core)
supplies differential-operator carriers, jets, symbols and formal density adjoints
after K5a's initial density-line construction and before its analytic scale.
K5 owns generic finite-rank real/complex bundle distributions,
the all-real-order Hilbert scale, smooth Laplace-type regularity and real/complex Hodge
theory; the pointwise real and complex Hodge stars and the codifferential of real forms are
Tau Ceti's, cited in K5a. The later pseudodifferential calculus
and its Peetre theorem consume that analysis; K5a's analytic operator layer
consumes only P1.0. The initial orientation-line and density layer consumes no PDO.
[AlgebraicTopology](../AlgebraicTopology/README.md) owns singular cohomology
and products. The linear Hodge-structure objects in `Completed/HodgeStructures` are a
target for K6's comparison, not a proof of analytic Hodge theory.

The complex structure J has `J²=-1`; `T^(1,0)` and `T^(0,1)` are its `+i` and `−i`
eigensubbundles in `TM⊗ℂ`. Define the type projections explicitly. Write `d=∂+∂̄` on an
integrable complex manifold and `d^c=i(∂̄−∂)`, so `dd^c=2i∂∂̄`. Hermitian inner products
are conjugate-linear in the first argument and linear in the second. For a real Hermitian
metric and its fundamental form, pin `g(u,v)=ω(u,Jv)`; positivity and compatibility are
Tau Ceti's `SmoothTwoForm.Compatible` convention. The definitive degree-two
carrier is DG0.4's `SmoothForm I M ℝ 2`, with closedness `mextDeriv ω = 0`.
The pinned `TauCeti.SmoothTwoForm I M` is the abbreviation `SmoothForm I M ℝ 2`, so
`TauCeti.SmoothTwoForm.Compatible` and `TauCeti.SmoothForm.IsClosed` are used directly on
DG0.4's carrier. No independent two-form carrier is introduced. On `(TM,J)` set
`h_T(u,v)=g(u,v)+iω(u,v)` (conjugate-linear first slot). Transport through
`u↦u^(1,0)=(u−iJu)/2`. If `g_ℂ` is the complex-bilinear extension, then
`h_T(u^(1,0),v^(1,0))=2g_ℂ(bar(u^(1,0)),v^(1,0))`. In holomorphic coordinates,
`ω=(i/2)Σ h_T(∂_(z_k),∂_(z_j)) dz^j∧dbar(z^k)`; the standard metric has
`h_T(∂_(z_j),∂_(z_k))=δ_jk` and `ω=Σdx^j∧dy^j`. A coframe's h_T-dual norm
is its complexified-real Gram norm divided by √2.

For the source's tensor notation `h_src,tensor=2Σdz^j⊗dbar(z^j)` alongside
`ω=(i/2)Σdz^j∧dbar(z^j)`, pin the slots before comparing metrics:
`h_src,tensor(u,v)=2h_T(v,u)`. This tensor is linear in its first
argument and conjugate-linear in its second. Convert it to the native
Hermitian convention by
`h_src,native(u,v)=h_src,tensor(v,u)=2h_T(u,v)`.
Prove that the associated fundamental form of this converted metric is `2ω`;
the unconverted tensor is not a conjugate-linear-first Hermitian metric.

For a column of section coefficients in a holomorphic frame with metric matrix
`h=(h(e_i,e_j))`, the Chern connection is `d+A` with `A=h⁻¹∂h`. Frame change `e′=e g`
gives `h′=g*hg` and `A′=g⁻¹Ag+g⁻¹dg`. Its curvature is `dA+A∧A`. The normalized
Fubini–Study form is `ω_FS=(i/(2π))∂∂̄ log(1+∑|z_j|²)`; its integral over a projective
line is 1. The O(1) Chern curvature is `−2πiω_FS`. These conventions match the
dual-character line in SmoothBundlesConnections and GeometricQuantization.

Hodge Laplacians are the nonnegative operators `Δ_d=dd*+d*d` and `Δ_∂̄=∂̄∂̄*+∂̄*∂̄`. On
functions the real one is the negative of DifferentialGeometry's `div grad`
Laplace–Beltrami operator. Do not use one sign for both without the comparison theorem.

## K1. Complex structures and type calculus

Consume ComplexManifolds Milestones 1 and 2, including the orientation construction,
atlas independence, product law and preservation by biholomorphisms (Milestone 2, item 4).
These targets use DifferentialGeometry 2.1's `Manifold.Orientation`, whose fibers are
`Orientation ℝ (TangentSpace I x) ι`. Reindex `Fin (2 * finrank ℂ E)`
to `Fin (finrank ℝ E)` using the scalar-restriction dimension equality,
and prove every chart sign of the resulting `OrientationLift` is positive.
Consume ComplexManifolds Milestone 2, item 1's real determinant positivity, expressed by
`LinearMap.det_restrictScalars` and `Algebra.norm_complex_eq`.
The shared carrier in ComplexManifolds is literally DG2.1's `Manifold.Orientation`
through HeegaardFloer's delegation to DG. K1 owns the tangent-index and
positive-chart-sign comparisons just stated, derived from ComplexManifolds Milestone 2, item 1's
determinant positivity and item 2's overlap lemma; it constructs no second
orientation. The consumed orientation laws include compatibility with
DG 2.2's pullback along open inclusions and along
the identity between compatible atlases, and with its product orientation.
K1 also proves, from the same determinant comparison, that every local biholomorphism is
`IsOrientationPreservingAt` for these complex orientations. Transport the
orientation and these laws together.
Holomorphic differentials are complex-linear; a smooth map is holomorphic iff its
differential intertwines J, equivalently carries `T^(1,0)` into `T^(1,0)`. In the flat
one-variable chart, make this criterion explicit: for a C¹ real map `φ:U→V` between open
subsets of ℂ and an ambient representative near each point, write
`dφ=φ_z dz+φ_{\bar z}d\bar z`. The pullback of `dz` is of type `(1,0)` exactly when
`φ_{\bar z}=0`; preservation of all target `(1,0)` covectors is
therefore equivalent to this equation (the converse tests `dz`, i.e. coefficient `1`).
Equivalently, for the real-linear covector `ℓ=Dφ(z)`, complex-linearity is
`ℓ(I)=I • ℓ(1)`; use native `real_linearMap_map_smul_complex` and
`ContinuousLinearMap.complexOfReal` to construct the complex-linear map. With the stated
real C¹ hypothesis, consume Mathlib's
`differentiableAt_complex_iff_differentiableAt_real` to identify this with complex
differentiability. Pointwise covectors need only the C¹ map; the bundled smooth-form
pullback requires a smooth map. This is a coordinate test for K1's existing criterion, not
another type-form carrier. Consume
`ContDiffAt.to_localInverse` and `ContDiffAt.implicitFunction` over ℂ, with
RealAlgebraicGeometry Layer 7's analytic inverse/complexification comparison, and prove their
complex-manifold transport, composition and inverse APIs, with the relevant derivative invertible.
The complex scalar action on the generic carrier `SmoothForm I M F k`, for `F` a normed
complex vector space regarded as a real coefficient space by scalar restriction, is Tau
Ceti's: `TauCeti.SmoothForm.instModule` acts through the coefficients, `smul_eq_mapCoeff`
identifies `c • ω` with the coefficient map of multiplication by `c`, the real action is
its restriction (`IsScalarTower ℝ ℂ`), and `mextDerivₗ_smul`, `mpullback_smul`,
`wedgeWith_smul_left_of_map_smul` and `wedgeWith_smul_right_of_map_smul` give the
complex-linearity of the exterior derivative, of pullback and of the paired wedge for a
complex-bilinear pairing. K1 proves that coefficient conjugation is semilinear,
`conj(c • ω) = conj(c) • conj(ω)` for complex coefficients. Use these structures for
the complex type forms and cochain complexes below; do not construct a second form carrier.

For holomorphic `G(z,v)` with invertible v-derivative at `(z₀,v₀)`, construct
the joint holomorphic implicit map `F(z,w)` near `(z₀,G(z₀,v₀))`, with
`F(z₀,G(z₀,v₀))=v₀` and `G(z,F(z,w))=w`, and prove its local uniqueness.
Consume Mathlib's `ImplicitFunctionData.contDiffAt_implicitFunction`
(`Mathlib.Analysis.Calculus.ImplicitContDiff`) and Tau Ceti's
`ImplicitFunctionData.analyticAt_implicitFunction` (`TauCeti.Analysis.Analytic.Inverse`),
which already give joint smooth and
analytic regularity of `implicitFunction.uncurry`, by applying their data to
`(z,v)↦(z,G(z,v))`. Prove the holomorphic/chart and local-uniqueness adapters
from those native joint theorems; the fixed-level `ContDiffAt.implicitFunction`
wrapper supplies the single-level specialization.
Develop holomorphic submanifolds, embeddings and their tangent/normal exact sequences,
extending ComplexManifolds Milestone 7.4's codimension-one normal bundle to arbitrary codimension.
Prove equivalence of regular holomorphic parametrizations and regular holomorphic zero
sets.

For any smooth almost complex structure the type calculus of complex-valued forms is Tau
Ceti's, and K1 consumes it rather than restating it. `TauCeti.SmoothForm.IsOfType` and
`SmoothAlmostComplexStructure.typeProjection` give the types `(p,q)` and the complementary
type projections, compatible with complex-linear coefficient maps, with pullback along
pseudoholomorphic maps, and exchanged by conjugate-linear coefficient maps;
`SmoothForm.IsOfType.mextDerivₗ_eq_add_del_add_delBar_add` decomposes d into its four
bidegrees. The Nijenhuis tensor `N_J(X,Y)=[JX,JY]−[X,Y]−J[JX,Y]−J[X,JY]`, with Mathlib's
bracket sign and no factor 1/4, is `SmoothAlmostComplexStructure.nijenhuis`, built as a
tensor through Mathlib's tensoriality criterion; `nijenhuis_apply` evaluates it on
differentiable fields, `nijenhuis_eq_zero_iff` states its vanishing field-wise,
`nijenhuis_antisymm` and `nijenhuis_apply_left` give skew-symmetry and anticommutation with
J, and `baseChange_nijenhuis_antiholomorphicPart_antiholomorphicPart` with its companions
give the type identities, `N(X^(0,1),Y^(0,1))=N(X,Y)^(1,0)` and its conjugate.
`SmoothAlmostComplexStructure.del` and `delBar` are the `(1,0)` and `(0,1)` components of d,
and, with DifferentialGeometry's determinant wedge and the evaluation
`dα(X,Y)=Xα(Y)−Yα(X)−α([X,Y])` without a 1/2 factor, `delBar_delBar_apply` and
`del_del_apply` pin, on real tangent vectors,
`∂̄²f(v,w)=−(1/4)∂f(N_J(v,w))` and `∂²f(v,w)=−(1/4)∂̄f(N_J(v,w))`; the first right-hand side
uses ∂f, as required by its type. K1 adds the eigenbundles of SBC B2's complexification of TM
as smooth subbundles, compared fibrewise with these pointwise type projections, and, for the
convention N′=N/4, the corresponding evaluation formulas without the factor 1/4.

Prove equivalence of `N_J=0` and involutivity of both eigenbundles, using local sections.
Prove the smooth **Newlander–Nirenberg theorem**: `N_J=0` iff J is induced by a compatible
complex atlas. The converse direction is Tau Ceti's `nijenhuis_ofComplexManifold` for the
structure `SmoothAlmostComplexStructure.ofComplexManifold`. The local form,
`newlander_nirenberg`, states that on a boundaryless real manifold of dimension 2n with
`N_J=0` every point has a map to `ℂⁿ` that is a local diffeomorphism there and is
pseudoholomorphic (`IsPseudoholomorphicOn`) from J to multiplication by i on a
neighbourhood; these coordinates have holomorphic transitions and form the atlas. Its proof
includes the local complex first-order coordinate equations and
transition holomorphicity. Follow Webster's 1989 rapidly converging proof: construct
Henkin's homotopy operator on strictly convex domains with its half-derivative
Hölder–Zygmund gain, smoothing operators and their tame estimates, the nonlinear
correction estimates and shrinking-domain KAM/Nash–Moser iteration. Prove convergence and
invertibility of the composed coordinate maps and smooth regularity by
iteration/bootstrapping. These analytic prerequisites belong here, consuming PDE's scalar
Hölder/Schauder tools. A fixed-Hölder contraction using polydisc Cauchy–Green alone does
not give the required derivative control. This is not a consequence of real Frobenius
alone.

**Checks.**

- Complex orientation: the chart change `z↦2z` of ℂ has real determinant `4=|2|²`, as
  `LinearMap.det_restrictScalars` and `Algebra.norm_complex_eq` give for every
  complex-linear map, so its chart sign is positive; `z↦z̄` has real determinant `−1` and
  is no chart of the complex structure. On `ℂ=ℝ²` the complex orientation is that of
  `dx∧dy`; the biholomorphism `z↦iz`, real determinant `1`, preserves it, while the
  antiholomorphic diffeomorphism `z↦z̄` reverses it.
- Holomorphy criterion: `φ(z)=z̄` has `φ_z=0`, `φ_z̄=1` and `φ*dz=dz̄`, of type `(0,1)`,
  so the criterion rejects it; `φ(z)=z²` has `φ_z̄=0` and `φ*dz=2z dz`; `φ(z)=|z|²` has
  `φ_z̄=z`, zero only at `0`, so the criterion holds at the single point `0` and on no
  open set. For `φ(z)=z̄` the real derivative `ℓ=Dφ(z)` has `ℓ(i)=−i` and `i·ℓ(1)=i`, so
  `ℓ` is not complex-linear.
- Implicit map: `G(z,v)=v²−z` at `(z₀,v₀)=(1,1)` has `G(1,1)=0` and `∂_vG=2v=2≠0`; the
  implicit map near `(1,0)` is `F(z,w)=√(z+w)` on the branch with `F(1,0)=1`, and
  `G(z,F(z,w))=(z+w)−z=w`; the other branch `−√(z+w)` solves the equation but not
  `F(1,0)=1`, which is what local uniqueness pins. At `(0,0)`, `∂_vG=0` and no such map
  exists, since `w↦√w` is not holomorphic near `0`.
- Submanifolds: `{w=z²}⊂ℂ²` is the graph of a holomorphic function and a holomorphic
  submanifold whose normal line is trivialised by `w−z²`, with `d(w−z²)=dw−2z dz≠0`
  everywhere; `{z²=w³}` is the zero set of a function whose differential `2z dz−3w² dw`
  vanishes at `0` and the image of `t↦(t³,t²)`, whose derivative `(3t²,2t)` vanishes at
  `t=0`, so neither regularity criterion applies there, and it is not a holomorphic
  submanifold at `0` (K3's Checks compute `Sing={0}`); the circle `{|z|=1}⊂ℂ` is a real
  submanifold whose tangent line at `1` is spanned by `∂_y`, and `J∂_y=−∂_x` is not
  tangent, so its tangent spaces are not `J`-invariant.
- Eigenbundles: on ℂ with `J=i`, `J∂_x=∂_y`, and `u=∂_x` has
  `u^(1,0)=(∂_x−i∂_y)/2=∂_z`, the `+i` eigenvector (`J∂_z=(∂_y+i∂_x)/2=i∂_z`); the
  convention `(u+iJu)/2` would give `∂_z̄`, the `−i` eigenvector. Coefficient conjugation
  sends `i dz` to `−i dz̄`, exchanging the types `(1,0)` and `(0,1)`, which no
  complex-linear coefficient map does. For a complex atlas every bracket of the
  coordinate fields `∂_z`, `∂_z̄` vanishes, so `N_J=0` and both eigenbundles are
  involutive, as the Newlander–Nirenberg converse requires.

## K2. Dolbeault calculus and the local lemmas

On a complex manifold, with its almost complex structure
`SmoothAlmostComplexStructure.ofComplexManifold`, the operators ∂ and ∂̄ on generic type forms
and their calculus are Tau Ceti's: bidegrees (`SmoothForm.IsOfType.del`,
`SmoothForm.IsOfType.delBar`), `d=∂+∂̄` and squares zero with anticommutation
(`mextDerivₗ_eq_del_add_delBar_ofComplexManifold`, `del_del_ofComplexManifold`,
`delBar_delBar_ofComplexManifold`, `del_delBar_add_delBar_del_ofComplexManifold`), graded
Leibniz (`del_wedgeWith`, `delBar_wedgeWith`), conjugation
(`mapCoeff_delBar_of_map_smul_conj`) and pullback naturality along pseudoholomorphic maps
(`mpullback_delBar`). Prove the Dolbeault–Grothendieck lemma for smooth `(p,q)` forms, q>0,
on a whole open polydisc: `dolbeault_grothendieck_polydisc` states it on `polydisc c r`, the
open polydisc with centre c and polyradius r as an open subset of `ℂⁿ` (empty when some
radius is nonpositive), for the pinned types and `delBar`. For the scalar Cauchy–Green step consume
[GlobalHolomorphicFunctions §0.3](../GlobalHolomorphicFunctions/README.md)'s compact-support
operator (Tau Ceti's Cauchy transform), its identities and its real-plane area normalization
under their support and smoothness hypotheses, and consume
[GH0's finite-rank Runge operator](../GlobalHolomorphicFunctions/README.md) (GlobalHolomorphicFunctions
Layer 2, §2.5) with its
operator bound `sup_K|f−A_jf|≤ε sup_L|f|` for holomorphic f on the stated neighborhood. The
finite-rank operators have fixed spatial evaluation points and output functions, independent of
external parameters.

For whole-open-polydisc exactness and successive Dolbeault elimination, prove one joint
parameter-dependent one-variable solver. Let P be a finite-dimensional smooth parameter manifold,
Q⊆ℂ^m any open complex parameter domain (including punctured-plane factors), and Ω⊆ℂ any open
plane domain. For jointly smooth `f:P×Q×Ω→ℂ` with `∂̄_{q_j}f=0` for every complex parameter
coordinate, construct jointly smooth `u` with `∂̄_z u=f` and `∂̄_{q_j}u=0`. This includes
Q=P=point (the scalar case), Q=point with general P (smooth parameters), and P=point with
holomorphic Q (holomorphic parameters). Do not restrict Q to a polydisc, and do not patch with a
partition of unity in Q. The existential statement of this solver on the native
carriers, with `∂̄_z=(∂_x+i∂_y)/2` written through the real Fréchet derivative,
is `exists_mixed_parameter_dbar_solution`.

**Parameter Cauchy–Green.** Prove the following lemma for this solver. For a fixed
`χ ∈ C_c^∞(Ω)` independent of all parameters and jointly smooth `f` on
`P × Q × Ω`, extend `χ f(p,q,·)` by zero and apply GlobalHolomorphicFunctions §0.3's
fixed-normalization Cauchy–Green operator `T`. The map `(p,q,z) ↦ T(χ f(p,q,·))(z)` is jointly `C^∞`;
in parameter charts every smooth derivative in `p` commutes with `T`, and
`∂̄_{q_j} T(χ f) = T(χ ∂̄_{q_j} f)`. Its `z`-equation is
`∂̄_z T(χ f)=χ f`. Prove these identities by differentiating under the integral
with the common compact spatial support, and prove smoothness in `z` after the kernel
substitution `ζ=z−ξ`, using local integrability of the Cauchy kernel. The region
`ℂ \ tsupport χ` where `T(χ f)` is holomorphic is independent of `p` and `q`. In particular,
when `f` is holomorphic in `Q`, so is `T(χ f)`. Apply this lemma to each fixed shell
cutoff `χ_j`; its support is independent of the parameters.

Choose a nested exhaustion of Ω by Runge compacts `K_j⊂int K_j^+⊂K_j^+⊂int K_{j+1}`
with each `K_j^+` also Runge. Use the open shell cover whose late members are
`int K_{j+1}\setminus K_{j-1}^+` (with finitely many initial sets), and choose a locally finite
smooth partition `χ_j` compactly supported in these members. Thus `supp χ_j` misses a
neighborhood of `K_{j-1}^+` for all sufficiently large j. Write `f_j=χ_j f`. Let `T` be the fixed-cutoff Cauchy–Green operator. Then for such j,
`T f_j` is holomorphic on a neighborhood of `K_{j-1}^+`. Apply the fixed GH0 finite-rank
operator `A_j`, chosen for `K_{j-1}^+` and a compact collar `L_j` inside that holomorphy
neighborhood, and set `u_j=T f_j−A_j(T f_j)`; for the finitely many initial indices use
`u_j=T f_j`. Thus `∂̄_z u_j=f_j`, and on each fixed earlier compact the tail is bounded by the
GH0 operator-norm error
`sup_{K_{j-1}^+}|h−A_jh|≤ε_j sup_{L_j}|h|`.

For parameter dependence apply these same spatial operators to all parameter values:
`T f_j(p,q,·)` is differentiable in `p` and preserves `q`-holomorphy by differentiation under
its compactly supported integral; `A_j h(q,·)=Σ_k w_k h(q,ζ_k)g_k` preserves both because its
points, weights and output functions are fixed independently of parameters. On each relatively
compact parameter chart in `P`, exhaust that chart and `Q` by compact subsets and define mixed
seminorms using finitely many parameter coordinates. Choose `ε_j` against the finite suprema of
every required parameter derivative of `T f_j` on a slightly larger product compact and collar;
Cauchy estimates on slightly larger `Q`-compacts control holomorphic-parameter derivatives, and
on `K_{j−1}^+` they control the `z`-derivatives on `K_{j−1}`. Use a diagonal schedule so the `j`th tail
correction and every mixed derivative through order `j` are at most `2^(−j)` on each earlier
compact product. No smallness is imposed on the prescribed new-shell datum; it contributes only
finitely often on each compact, while the later corrected tails satisfy the summable bounds. The
resulting series converges in every compact-product smooth seminorm,
permits termwise differentiation, solves `∂̄_z u=f`, and remains holomorphic in `Q`.
For general `P`, carry this construction in relatively compact parameter charts and glue the
local solutions with a locally finite smooth partition of unity in `P`; multiplication by those
functions preserves `q`-holomorphy because the partition is independent of `Q`. Never use a
partition in `Q`.

Separately prove the multivariable Taylor approximation on ℂⁿ and Laurent approximation on
`ℂ*×ℂ` and `ℂ*×ℂ*`, with their compact exhaustions, locally finite gluing and convergence of all
smooth derivatives. Do not infer multivariable Runge from one-variable Runge. Develop the
product-domain approximation and gluing API. The solver yields solutions on the full open
parameter/domain products. The resulting 𝒪 and holomorphic-form sheaves are acyclic on the product
domains used here, so K7's punctured-plane cover is a verified Leray cover. Here 𝒪 is Mathlib's
`smoothSheafCommRing` for `𝓘(ℂ,ℂ)`, with the native carrier comparison of K3.0; K2 precedes K3's
local coherence calculations.
Define Dolbeault cohomology on a complex manifold from the pinned complex-linear `delBar` and
type projections: `dolbeaultCocycles E M p q` are the ∂̄-closed forms of type `(p,q)`,
`dolbeaultCoboundaries E M p q` the images under ∂̄ of the forms of type `(p,q−1)` (zero for
q=0), and `DolbeaultCohomology E M p q` is `H^(p,q)_∂̄(M)`, the image of the cocycles in the
quotient of all `(p+q)`-forms by the coboundaries, a complex vector space. Define the
Dolbeault complex in `ModuleCat ℂ` and identify its cohomology with this quotient. Define its
quotient maps, functoriality, wedge product and identification of `H^(p,0)` with
holomorphic p-forms, extending Tau Ceti's `kerDelBarZeroEquiv`, the case p=0.

**Checks.**

- On ℂ, `H^(0,0)_∂̄` is the space of entire functions and `H^(0,1)_∂̄=0` by the whole-plane
  Dolbeault–Grothendieck lemma; a definition taking all ∂̄-closed 1-forms as cocycles would
  also admit the `(1,0)`-forms `h dz` with h entire, which are ∂̄-closed but of the wrong
  type, and would give a nonzero group in degree one.
- On a polydisc with some radius ≤0 the space is empty, every form vanishes and every
  `H^(p,q)` is zero; for n=0 the polydisc is a point, `H^(0,0)=ℂ` and the other groups vanish.
- On ℂ×, the `(0,1)`-form `dz̄/z̄` is `∂̄ log|z|²`, so its class in `H^(0,1)_∂̄` is zero, while it
  is d-closed with `∮_(|z|=1) dz̄/z̄=−2πi≠0`; a definition with d in place of ∂̄ would give it a
  nonzero class.

Construct the sheaves
Ω^p and smooth type forms, prove the latter fine/acyclic using partitions of unity, and
prove the Dolbeault theorem `H^q(M;Ω^p)≃H^(p,q)_∂̄(M)` with naturality and products. Build
the needed analytic-sheaf/Čech/derived comparison using Mathlib's Ext-based sheaf
cohomology carrier. Prove fine-implies-acyclic on the paracompact Hausdorff manifolds here
and the Čech comparison for acyclic covers. Also prove that for every
abelian sheaf on a paracompact Hausdorff manifold, the colimit of Čech
cohomology over locally finite open refinements agrees with native derived
sheaf cohomology. Construct refinement maps, prove independence up to cochain
homotopy, use paracompact shrinking for exactness after refinement, and compare
with an injective/flabby resolution. No coherent Cartan B is an input.
RealAnalyticGeometry R3.2 consumes this colimit theorem after proving vanishing
on an arbitrarily fine cofinal family of finite-order Stein covers; it does
not assume F is already acyclic on their intersections.
 SmoothBundlesConnections B6 supplies scalar
good-cover comparison where it applies, not a general coherent-sheaf theorem.

After K4 constructs 𝒪(E), E-valued type forms and ∂̄_E, prove the
bundle-valued comparison `H^q(M;𝒪(Ω^p⊗E))≃H^(p,q)(M;E)` for every finite-rank
holomorphic vector bundle E, its naturality, and `Ω^(n,q)(E*)≃Ω^(0,q)(E*⊗K_M)`.

Acceptance: whole-polydisc exactness and no nonzero holomorphic one-form on
K7.1's `Projectivization ℂ (Fin 2 → ℂ)` carrier. Consume
Mathlib’s `MDifferentiable.exists_eq_const_of_compactSpace` for functions on connected
compact complex manifolds and `MDifferentiable.isLocallyConstant` without the
connectedness hypothesis. Do not assert global constancy for disconnected manifolds.

## K3. Analytic germs and subvarieties

K3.0 supplies K1's holomorphic/analytic comparisons. Consume the native
`TauCeti.Analysis.Complex.CauchyIntegralPolydisc` polydisc Cauchy formula,
`DifferentiableOn.analyticOnNhd_of_finiteDimensional` and
`TauCeti.analyticOnNhd_iff_differentiableOn_of_finiteDimensional`, including
finite-dimensional complex domain, complete codomain and open-set hypotheses.
Consume its `TauCeti.analyticAt_circleIntegral` and
`TauCeti.analyticOnNhd_circleIntegral` for jointly analytic integrands near
the parameter set times the integration circle, and its Osgood lemma
`ContinuousOn.analyticAt_of_differentiableAt_update` (with
`TauCeti.analyticOnNhd_iff_continuousOn_and_differentiableAt_update` on open sets): a
continuous function holomorphic in each variable separately is analytic. Prove the locally
uniform contour bounds of separately holomorphic families, then use joint analyticity with
the native parametric integral theorem. Consume Mathlib's one-variable Cauchy APIs as well;
construct the manifold/chart transports. The realified atlas is Tau Ceti's: for a boundaryless
finite-dimensional complex model, `IsManifold.restrictScalars_of_ne_zero` makes a complex
manifold of any nonzero order a real `C^n` manifold for every n, in particular real-analytic
(`IsManifold 𝓘(ℝ,E) ω M`), with the same charts
(`IsManifold.maximalAtlas_subset_restrictScalars_of_ne_zero`), and
`TauCeti.contMDiff_iff_mdifferentiable` identifies holomorphic maps with complex `C^n` maps for
every `n≠0`. The holomorphic structure sheaf is Tau Ceti's `TauCeti.holomorphicStructureSheaf`
(`TauCeti.Geometry.Manifold.Complex.StructureSheaf.Basic`), whose sections on `U` are the `C^ω`
maps `U→ℂ`; on a finite-dimensional boundaryless complex manifold
`holomorphicStructureSheaf.smoothSheafIso` identifies it with Mathlib's complex-smooth sheaf
`smoothSheafCommRing I 𝓘(ℂ) X ℂ`, the sheaf of Mathlib's `ChartedSpace.locallyRingedSpace`, and
`smoothStalkIso` identifies their stalks preserving evaluation
(`…StructureSheaf.SmoothComparison`). K3 cites the two sheaves through this comparison and
constructs no third. Its underlying smooth structure agrees with ComplexManifolds Milestone 1 and with
Tau Ceti's `TauCeti.ComplexManifold.isManifold_real`. Export the real-analytic transition and
local defining-equation comparisons required by K6's analytic-set triangulation, using the
native `contDiffGroupoid` at order ω; no separate analytic groupoid carrier is needed.

**K3.HolomorphicStalk — finite-dimensional complex local germs.**
The ring `O_x` of holomorphic germs at a point `x` of a complex manifold modelled on a
finite-dimensional `E` is the stalk at `x` of `TauCeti.holomorphicStructureSheaf`, and its local
algebra at the pins is consumed, not restated: the stalk is a local ring
(`holomorphicStructureSheaf.instIsLocalRingStalk`) whose units are the germs with nonzero value
(`isUnit_stalk_iff`, for any complex model), whose maximal ideal is the kernel of evaluation
(`maximalIdeal_stalk`) with residue field ℂ (`residueFieldEquiv`); it is an integral domain by
the identity theorem (`stalkIsDomain`, boundaryless finite-dimensional models, zero-dimensional
ones included; `smoothStalkIsDomain` for Mathlib's complex-smooth stalk through
`smoothStalkIso`); for a holomorphic chart `e` at `x` and a basis of `E` the `n=dim_ℂ E`
centred coordinate germs generate the maximal ideal, by Hadamard's lemma
(`OpenPartialHomeomorph.ker_eval_eq_span_holomorphicLinearCoordinateGerm`,
`…StructureSheaf.MaximalIdeal`), and a germ lies in `𝔪²` exactly when its value and its
derivative read in the chart vanish (`mem_ker_eval_sq_iff`); on a complex curve the stalk is a
discrete valuation ring with any centred coordinate as uniformizer
(`instIsDiscreteValuationRingStalk`). Germs are compared with Mathlib's function germs along
`𝓝 x` or any finer filter by `holomorphicStructureSheaf.toFilterGerm` (`…StructureSheaf.Germ`),
injective along `𝓝 x`, with image the germs of the functions analytic near `x`; holomorphic
maps pull germs back by `stalkPrecomp`; and in a model space `TauCeti.analyticGerms` with
`analyticGerms.pullback` and `equivOfInverse` (`TauCeti.Analysis.Analytic.Germ`) give the
chart-free comparison. Mathlib's `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` is the
identity theorem used again below for analytic closure and irreducibility. Retain the chosen
point and its local coordinates, and own the convergent several-variable power-series
comparison: identify `O_x` through a chart with the ring of convergent power series in `n`
variables, compatibly with the coordinate germs. Prove
Weierstrass preparation and division with their precise uniqueness: when `w ↦ f(0,w)` has
order d, the germ is a unit times a monic degree-d polynomial with holomorphic coefficient
germs vanishing at the origin (`weierstrass_preparation`, on `ℂⁿ×ℂ` with the order read off
from the iterated derivatives of `w ↦ f(0,w)` at 0), and the unit and coefficient germs are
unique (`weierstrass_preparation_unique`); for such a g every germ f holomorphic at 0 is
`q·g+r` with q holomorphic and r a polynomial in w of degree less than d with holomorphic
coefficients (`weierstrass_division`) (Demailly, Chapter II, (2.1) for preparation and
(2.3)–(2.4) for division with its uniqueness, from which the uniqueness of the preparation
follows by dividing one Weierstrass polynomial by the other). Construct the contour/power-sum proof and Newton
identities, using ContourIntegration's residue/argument-principle inputs and K3.0
parameter dependence. Consume `MvPolynomial.mul_esymm_eq_sum` for Newton identities and
align the factorization API with `PowerSeries.IsWeierstrassFactorization`.

**K3.MeromorphicGermField — one-variable finite-pole local field.** For `a∈ℂ` the
local field `K_a` of meromorphic germs at `a` is Tau Ceti's `TauCeti.meromorphicGerms ℂ a`
(`TauCeti.Analysis.Meromorphic.Germ`): the subring of the punctured germs
`Filter.Germ (𝓝[≠] a) ℂ` represented by functions with native `MeromorphicAt f a`, a field
(`meromorphicGerms.instField`) whose inverse is the pointwise inverse by the principle of
isolated zeros, the zero germ included. Its comparison with the holomorphic stalk `O_a` of
K3.HolomorphicStalk is pinned in `TauCeti.Geometry.Manifold.Complex.StructureSheaf.MeromorphicGerm`:
restriction to punctured neighbourhoods is the injective ring homomorphism
`holomorphicStructureSheaf.toMeromorphicGerms a` (`toMeromorphicGerms_injective`); every
meromorphic germ is `h/(z−a)^n` with `h` holomorphic (`exists_eq_toMeromorphicGerms_div`), so
`K_a` is a fraction field of `O_a` (`isFractionRing_meromorphicGerms`, identified with
`FractionRing O_a` by `IsFractionRing.algEquiv`); and a germ is holomorphic exactly when its
order is nonnegative (`exists_toMeromorphicGerms_eq_iff`, read through
`meromorphicOrderAt_eq_int_iff`), equivalently exactly when its principal part vanishes
(`mem_range_toMeromorphicGerms_iff_principalPart_eq_zero`). The finite principal part is
`meromorphicGerms.principalPart` (`TauCeti.Analysis.Meromorphic.PrincipalPart`), the polynomial
`P` without constant term with `φ−P((z−a)⁻¹)` analytic (`principalPart_eq_iff`), hence
independent of the exponent `N`, of the representative and of the neighbourhood, and computed
from the Taylor coefficients of `h` below `N` when `φ=(z−a)^(−N)h`
(`principalPart_eq_sum_coeff`); `evalInvSub` is the injective evaluation `P↦P((z−a)⁻¹)` and
`holomorphicStructureSheaf.regularPart` the holomorphic remainder, with `N=0` and the zero germ
included. The coefficient of order `−(k+1)` is the circle integral
`(2πi)⁻¹∮_(|z−a|=ρ)(z−a)^k f(z)dz` for every sufficiently small `ρ>0`
(`coeff_principalPart_succ_eq_circleIntegral`, `TauCeti.Analysis.Contour.Residue.PrincipalPart`).
The regular subring is identified with `O_a` (`rangeToMeromorphicGermsEquiv`) and its value at
`a` is `regularEval` (`…StructureSheaf.RegularEval`), the limit along `𝓝[≠] a`, so the arbitrary
value of a representative at its centre is never used. A local biholomorphism `e` with
`a∈e.source` induces the contravariant field isomorphism `meromorphicGermsEquiv` from the germs
at `e a` to those at `a` (`TauCeti.Analysis.Meromorphic.Pullback`), which respects regular germs
(`meromorphicGermsEquiv_mem_range_iff`) and agrees with `stalkPrecomp` on holomorphic germs
(`toMeromorphicGerms_stalkPrecomp`, `…StructureSheaf.Pullback`); differentiation is the
derivation `meromorphicGerms.derivation` with the chain rule `derivation_pullback`
(`TauCeti.Analysis.Meromorphic.Derivation`).

Own what the pins lack. Consume [GH2](../GlobalHolomorphicFunctions/README.md)'s local Laurent
decomposition and Laurent-coefficient extraction (GlobalHolomorphicFunctions Layer 4, §4.1),
which GlobalHolomorphicFunctions owns, and prove that GH2's negative Laurent coefficients of a
finite-pole germ are the
coefficients of its `principalPart`, by the circle-integral formula above and annulus integral
invariance, and that GH2's finite-pole output is the germ with that principal part and that
regular germ. Prove the product formula: a fixed negative coefficient of `φψ` is the finite
convolution of the coefficients of `φ` and `ψ`, because both Laurent series are bounded below;
transport the restriction, finite-sum and differentiation laws of GH2's coefficients through
the pinned field operations rather than through a second Laurent construction. A change of
K1's charts at `a` is a local biholomorphism `e` of ℂ, and its pinned facts are consumed:
`meromorphicGermsEquiv` is a ring isomorphism whose inverse is pullback along `e.symm`
(`meromorphicGermsEquiv_symm_apply`), pullback along an analytic map preserves the value of a
regular germ (`regularEval_pullback`, `…StructureSheaf.RegularEval`), and `regularEval` is the
evaluation of `O_a` at `a` through the regular part (`regularEval_eq_eval_regularPart`). For
`e(z)=2z` at `a=0`, `1/z` pulls back to `1/(2z)`, pullback of `1/(2z)` along `w↦w/2` returns
`1/w`, and the regular germ `1+z` pulls back to `1+2z`, with value 1 on both sides.
K3.MeromorphicGermField consumes the stalk/identity foundation, these native
analytic/meromorphic APIs and GH2's Laurent decomposition, and precedes applications needing scalar
meromorphic coefficient germs. It has no QFT prerequisite. General isolated
essential-singularity and global Mittag–Leffler constructions retain their
GlobalHolomorphicFunctions owner.

Prove the analytic local rings are Noetherian and factorial of dimension n, with the pinned
coordinate germs as regular parameters: for the stalk at x of `smoothSheafCommRing 𝓘(ℂ,E) 𝓘(ℂ) M ℂ`
on a complex manifold M modelled on E, the holomorphic stalk through `smoothStalkIso`,
`isRegularLocalRing_holomorphicStalk` states that it is a regular local ring
of Krull dimension `finrank ℂ E`, and `uniqueFactorizationMonoid_holomorphicStalk` that it is
a factorial domain (Demailly, Chapter II, (2.7) and (2.10)); Noetherianity, regularity, the
Krull dimension and factoriality are at neither pin. Follow Griffiths–Harris, *Principles of Algebraic Geometry*, chapter 0 §§1–2, and Demailly, chapter II: prove local parametrization of
a pure-dimensional analytic germ by a finite branched projection to a polydisc,
elimination under finite projections, density of regular points and dimension/finite-fiber
formulas. Prove the hypersurface weak Nullstellensatz: for irreducible f, a germ h
vanishing on the zero germ of f is divisible by f. Prove Rückert's Nullstellensatz
`I(V(𝔞))=√𝔞` for every ideal 𝔞 of the convergent local ring using local parametrization;
`ruckert_nullstellensatz` states it for the ideal generated by finitely many germs
`f₁,…,f_k` at a point of `ℂⁿ`, which is every ideal by the Noetherian property: a germ
vanishing near the point on their common zero set has a power in that ideal (Demailly,
Chapter II, (4.22)).
Define reduced analytic subsets, their dimension, regular/singular loci and locally finite
irreducible components. For every pure k-dimensional reduced analytic subset V,
construct on the subtype `Reg(V)` K1's holomorphic-submanifold atlas with model ℂ^k.
Prove second countability, the complex `IsManifold` instance, compatibility with
the subspace topology, and that its inclusion into the ambient manifold is a
holomorphic embedding. Export K3.0's realification and the corresponding smooth
immersion and tangent comparisons. For subsets of mixed dimension apply this
construction to each constant-dimensional regular piece. Prove Oka coherence via Weierstrass division and
relations induction in the following primitive local form: for every open U,
every finite tuple of holomorphic functions on U and every x∈U, construct a
neighborhood V of x and finitely many holomorphic relation vectors on V whose
germs generate the relation module at every point of V (`oka_coherence`, on open subsets of
`ℂⁿ`; Demailly, Chapter II, (3.19)).

Own Cartan's coherence theorem for the reduced ideal sheaf as a separate
local-algebra target: for every closed analytic subset A of an open complex
manifold Ω, locally the common zero set of finitely many holomorphic functions,
and every point of Ω, construct a neighborhood and finitely many holomorphic
functions whose germs generate its reduced ideal at every point of that
neighborhood. By Rückert this ideal is
the radical of the defining ideal, so the construction must produce generators
of the radical. Prove the theorem by reducing to irreducible germs, using
local parametrization and the Weierstrass-polynomial description on the
branched cover, and applying the preceding Oka relations theorem. Recombine
local irreducible components using `I_A=⋂I_(A_k)`; generate each finite
intersection from Oka relations of concatenated generating tuples `(f,−g)`.
Follow Demailly chapter II §4.4, Theorem4.29. Give also the local-generator statement for ideals
locally specified by a finite holomorphic tuple; `cartan_coherence_reducedIdeal` states it for
the common zero set of finitely many holomorphic functions on an open subset of `ℂⁿ`: near
every point there are finitely many holomorphic functions vanishing on the zero set whose
germs generate, at every nearby point, the germs vanishing on the zero set.
RealAnalyticGeometry R3.2 item0 owns the native coherent `SheafOfModules`
predicate and the translation of these primitive statements to that predicate;
these local proofs consume only the preceding convergent local algebra.
Prove that the singular locus of every reduced analytic subset is a closed analytic
subset, with strictly smaller complex dimension for a nonempty subset. Use the
local generators of the reduced ideal and the holomorphic Jacobian criterion on each local
irreducible component, then include the intersections of distinct components; local
parametrization and its discriminant give density of regular points and the dimension
drop. This also covers subsets that are not pure-dimensional. Follow
[Demailly, chapter II §4.4, Theorem 4.31](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf).
For a compact analytic subset V, build the finite descending sequence
`S₀=V`, `S_(i+1)=Sing(S_i)` until it is empty. Split each regular difference
`S_i∖S_(i+1)` by its constant complex dimension and connected components, and
prove the pieces lying in V are locally closed analytic submanifolds and
semianalytic in the realified atlas. R1 local finiteness and compactness of V
give finitely many such pieces; dimension drop bounds the iteration count.
The components of M∖V give a locally finite complementary family. When the
ambient M is compact, that family is finite as well.
The iterates can have components of different dimensions, so no whole regular
difference is given a single fixed-dimensional manifold model. This partition
supplies K6's finite family; RealAnalyticGeometry R5 supplies the global compatible
triangulation and its frontier refinement, and R5 owns compatible analytic triangulation.
Prove the analytic closure theorem for a regular-locus component and the locally finite
global component decomposition. Prove an irreducible reduced analytic subset has connected
regular locus, and conversely, first for hypersurfaces and then from local parametrization
and density in general.

On a complex manifold, prove locally bounded holomorphic functions on the complement of a
nowhere-dense analytic subset extend across it; `riemann_extension` states the local form, on
an open subset of `ℂⁿ` with the subset the common zero set of finitely many holomorphic
functions and empty interior, from which the manifold statement follows chart by chart
(Demailly, Chapter II, (4.2)). Prove Hartogs extension across an analytic subset
A with `dimℂ A ≤ n−2` in an n-dimensional complex manifold, without a boundedness
assumption. Its point case, extension across one point of a complex manifold of
dimension at least two, is `hartogs_extension_across_point`; it is the analytic
input of K7.2.TautologicalIncidence, and in dimension one `1/z` shows the
dimension hypothesis is needed. No extension theorem for arbitrary singular
ambient spaces is asserted. Work
out the node `z²=w²+w³` and cusp `z²=w³`, distinguishing global irreducibility from local
analytic branches on the actual zero sets and germs.

**Checks.**

- Weierstrass preparation and division: for `f(z,w)=w²−z` the order of `w↦f(0,w)=w²` is
  d=2, the unit is 1 and the coefficient germs `(0,−z)` vanish at 0; dividing `w³` by it
  gives `q=w` and remainder `zw`, of degree 1<2 in w. If `f(0,0)≠0` the order is 0 and f
  is a unit times the polynomial 1; for `f=z` the function `w↦f(0,w)` vanishes
  identically, so no preparation in w exists without a linear change of coordinates.
- Reduced ideal and singular locus: `V={zw=0}⊂ℂ²` has `Sing V={0}`, two irreducible
  components and dimension 1; computing the Jacobian criterion from the nonreduced
  equation `(zw)²`, whose gradient vanishes on all of V, would make every point singular.
- Global irreducibility versus local branches: the node `z²=w²+w³` is the image of
  `t↦(t(t²−1),t²−1)`, with `t=±1` both sent to 0, so its regular locus is the connected
  `ℂ∖{±1}` and V is irreducible, while its germ at 0 has the two branches
  `z=±w√(1+w)`; the cusp `z²=w³`, the image of `t↦(t³,t²)`, has `Sing={0}` and an
  irreducible germ there.
- Extension: `1/z` on `ℂ∖{0}` does not extend, so Hartogs needs `dimℂ A≤n−2`; on `ℂ²` every
  holomorphic function on `ℂ²∖{0}` extends, and a function bounded near a hypersurface
  such as `{z=0}` extends by the Riemann extension theorem, while `1/z` is unbounded there.

## K4. Holomorphic and Hermitian bundles

Consume ComplexManifolds Milestone 7's holomorphic-transition mixin on the native bundle,
cocycle gluing, tensor/dual/exterior operations and canonical bundle Ω^n.
Construct the holomorphic `Hom(E,F) ≃ E*⊗F` comparison from those operations.
Compare their underlying smooth complex bundles with SmoothBundlesConnections B2.
Build holomorphic sections and their local frame, transition and restriction
formulas. Supply the RingCat-valued holomorphic structure sheaf R for native
`SheafOfModules`: compose K3's `smoothSheafCommRing` with
`forget₂ CommRingCat RingCat` and verify the underlying sheaf condition.
For each open U, identify the holomorphic structure sheaf on U with R
restricted by native `U.sheafRestrict`, compatibly with ring operations,
restrictions and germ maps. Use `Opens.overPullbackSheafEquivOver` to compare
this restriction with the native over-site carrier.
These are the ring-sheaf inputs for bundle sections here and coherent analytic
sheaves in RealAnalyticGeometry R3.2. For a fixed finite-dimensional complex normed model F and every native
`VectorBundle ℂ F E` equipped with that holomorphic-transition mixin,
construct the sheaf of holomorphic sections in Mathlib's `SheafOfModules`
over R. Put `r=finrank ℂ F`. Define sections by holomorphic local frame
coordinates, prove frame independence and local freeness of the same rank r
at every point, and compare with sections of the bundle glued by ComplexManifolds from
a holomorphic GL_r cocycle. Conversely reconstruct the native F-bundle from
a locally free O-module whose rank is r at every point, transporting its
local bases to F. Prove the section/reconstruction equivalence, including
morphisms and pullbacks, on these actual carriers. This fixed-model theorem
does not identify a varying-rank sheaf with a single `VectorBundle ℂ F E`;
the componentwise construction below supplies that full locally finite-rank scope.
K4 supplies the holomorphic bundle and holomorphic-connection carriers to
[ComplexComparisonPartII C−1.1, C0.4 and C5.1–C5.2](../ComplexComparisonPartII/README.md),
which own scheme analytification and the algebraic-to-holomorphic comparison
prefix, using K1's manifold inverse/implicit function theorem.
[FormalConnectionsOpers F2.4](../FormalConnectionsOpers/README.md)
consumes that prefix for its fixed-model manifold, tangent/derivation, toric,
group and gauge applications. K4 does not construct algebraic analytification.

Prove existence and uniqueness of the Chern connection on a Hermitian holomorphic bundle,
with `(0,1)` part ∂̄ and metric compatibility; prove the local formula and curvature type
`(1,1)`, frame independence, tensor/dual and pullback formulas. Construct Dolbeault
operators on complex bundles and prove **Koszul–Malgrange**: an integrable `(0,1)`
connection gives a holomorphic bundle structure recovering the given operator: sections
are holomorphic exactly when `∂̄_E s=0`. Build its local frame-solving theorem and gluing,
first in rank one and then at arbitrary fixed finite rank. For rank r, build the induced
almost complex structure on the total space from the `(0,1)` connection, prove its
Nijenhuis tensor vanishes iff the connection is integrable, and apply K1
Newlander–Nirenberg to obtain local holomorphic bundle frames; prove projection, fiber
addition and scalar multiplication are holomorphic for that structure. Use the holomorphic
implicit-function theorem to obtain local sections through a basis and prove they remain a
frame, giving compatibility with the fiberwise complex-linear structure. This supplies the
nonlinear rank-r solvability step rather than assuming scalar ∂̄ solves a matrix equation.
This supplies GeometricQuantization's holomorphic prequantum line dictionary.

Define a holomorphic connection on a holomorphic bundle E as a ℂ-linear
sheaf operator `∇:E→Ω¹_hol⊗E` with `∇(fs)=df⊗s+f∇s`; its contraction
with a holomorphic vector field is O-linear in that field. Give local
holomorphic connection matrices, their gauge-change law, pullback, tensor,
dual and Hom operations and curvature. Construct the smooth connection D
agreeing with ∇ on local holomorphic sections and prove uniqueness. It
has `(0,1)` part ∂̄_E and holomorphic `(1,0)` coefficients; prove the
converse comparison. Prove D² equals the holomorphic curvature ∇² viewed
as a smooth `(2,0)` form, so their flatness criteria coincide. Every holomorphic
connection on a complex curve is flat. This assertion concerns holomorphic
connections; the Hermitian Chern connection above has its stated `(1,1)`
curvature. For flat holomorphic connections prove parallel local frames are
holomorphic. With a frame e at a basepoint, continue it along γ to
e_γ=e·M(γ), and pin `T_γ∘e=e∘M(γ)`, where T_γ is B5's source-to-target
parallel transport; thus M(γ)=e⁻¹T_γe, with the same frame-bundle holonomy,
not its inverse. The inverse in B5's deck quotient remains in that quotient
action. Prove the flat correspondence first at fixed rank r on the native
fixed-model bundles just constructed. Its local-system carrier is a functor
from Mathlib's `FundamentalGroupoid M` to `ModuleCat ℂ` whose value at every
object has dimension r. Include all connection-preserving fibrewise linear
maps and natural transformations, not only isomorphisms.

**K4.ComponentwiseFiniteRankAssembly.** Retain the full pointwise finite-dimensional
scope on a disconnected M: local systems have finite-dimensional values at
each object, with no uniform bound on their dimensions. Prove that connected
components C of M are open complex submanifolds, that their disjoint union is
homeomorphic to M, and that the rank is constant on each component. For an
arbitrary rank function `r : ConnectedComponents M → ℕ`, use the model
`F_C=(Fin (r C) → ℂ)` on C and ComplexManifolds' native fixed-F construction there.
Define the componentwise category of these native bundles with connections;
its morphisms are families of connection-preserving linear bundle maps,
including maps between objects with different rank functions. Construct the
assembly over M with fibre at x equal to the fibre over x in its component,
and total space the disjoint union of the component total spaces. Give its
local charts, smooth/holomorphic transition comparisons and projection on
the open component cover; reconstruct its sheaf of sections by sections over
`U∩C`, with componentwise connections and restriction/gluing. Prove restriction
and assembly are inverse up to natural bundle/sheaf isomorphism. This is an
explicit family and assembly adapter using native fixed-model bundles on
each component, not a purported global `VectorBundle ℂ F E` instance with
varying `finrank ℂ F`.

Apply restriction/assembly and the fixed-rank section/reconstruction theorem
also without a connection: locally free O-modules of arbitrary locally
constant finite rank correspond to componentwise native holomorphic bundles,
with all holomorphic fibrewise linear maps. Prove this equivalence using the
same section sheaf on the open component cover; no flatness assumption is
imposed on this holomorphic-bundle/sheaf comparison.

Use the absence of paths between distinct components to compare the full
componentwise category with pointwise finite-dimensional functors on
`FundamentalGroupoid M` and with locally constant sheaves of ℂ-modules
having finite-dimensional stalks. Prove the three category equivalences for
flat holomorphic connections, flat smooth ℂ-linear connections and those
local systems; recover the equivalences of isomorphism groupoids as well. At a fixed rank
on a connected base these are the classical correspondences (Demailly, Chapter V, (6.6),
(6.7) and the construction after (6.7), pp. 260–261, for flat bundles and representations
of the fundamental group; Chapter IV, (16.8), p. 249, for locally constant sheaves); the
componentwise assembly without a rank bound is this roadmap's own statement.
Use local parallel frames and path transport, including inverse sheaf/gluing,
stalk and monodromy naturality. Extract `(D^(0,1),D^(1,0))` by
Koszul–Malgrange. Construct the inverse holomorphic object as `L⊗𝒪` with
connection `1⊗d`, using constant GL_(r C) transition cocycles componentwise,
and identify its section sheaf with that tensor sheaf. Include the units,
counits, all morphisms and naturality under holomorphic pullback, with the
rank function pulled back along the induced component map. Cover rank zero
and the empty base, and permit unbounded ranks across infinitely many
components. These constructions retain the analytic correspondence on the
actual componentwise carriers without changing the fixed finite-rank
hypotheses of later elliptic theorems.

For bundle-valued forms construct ∂_∇, ∂̄ and curvature identities on the generic carrier.
Prove the torsion tensor and Cartan frame structure equations for tangent connections,
consuming existing covariant-derivative curvature and torsion APIs and translating frame
conventions. These include the dual and tensor-connection exercises as specializations of
B3 rather than new connection objects.

**Checks.**

- Chern connection: on the trivial line over ℂ with `h=e^(−|z|²)`, `A=h⁻¹∂h=−z̄ dz` and
  `F=dA=dz∧dz̄`, so `(i/(2π))F=(1/π)dx∧dy` is positive of type `(1,1)`; the formula
  `h⁻¹∂̄h=−z dz̄` would give a connection whose `(0,1)` part is not ∂̄.
- Frame change: for `e′=e g` with `g=e^z`, `h′=|e^z|²h` and `A′=A+dz`, which is
  `g⁻¹Ag+g⁻¹dg` in rank one; a constant `g=2` gives `h′=4h` and `A′=A`.
- Monodromy convention: for the flat connection `d−a dz/z` on the trivial line over ℂ×
  the parallel sections are `c z^a`, so the positive loop has `M(γ)=e^(2πia)`; the inverse
  convention would give `e^(−2πia)`, and for `a∈ℤ` the gauge `z^a` makes the connection
  trivial.
- Flatness on curves: on a complex curve `Ω^(2,0)=0`, so every holomorphic connection is
  flat, while the Chern connection of `O(1)` on ℂP¹ has nonzero curvature.
- Componentwise ranks: on `M=ℂ⊔ℂ` with ranks 0 and 2 the assembled bundle has fibres 0
  and ℂ², which no single fixed model F describes; the empty base and rank zero give zero
  bundles, sheaves and local systems.

### K4.P. Holomorphic Picard groups and the exponential comparison

On K1–K3's complex manifolds, construct the sheaf of units 𝒪× of the actual
holomorphic-function sheaf, its multiplicative group operations, restriction and
local logarithms. Use native sheaves of abelian groups (applying `Additive` to
𝒪× for cohomology), native sheaf cohomology and its connecting maps. This is
the sheaf Picard construction; `CommRing.Pic` alone classifies invertible
modules over a ring and does not identify line bundles on an arbitrary space.

K4.P owns, on every complex manifold, the holomorphic exponential sequence, the
isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` and the identification of its connecting map
with the integral first Chern class of the underlying smooth line. It supplies this
segment and its `c₁` identification to ComplexComparisonPartII C5.4 (for its
analytic-space and cycle comparisons), to K3Surfaces 1.1 and to
GeometricQuantization §3.3, which are its consumers. The normalization is one and
the same in the two conventions in use: `c₁(O(1))·[ℂP¹]=+1` for
SmoothBundlesConnections B6.2's dual-character Hopf line, equivalently
`c₁(O(−1))·[ℂP¹]=−1` as ComplexComparisonPartII writes it, both against K1's
complex orientation.

Define Pic_hol(M) as holomorphic isomorphism classes of K4's rank-one locally
free 𝒪-modules, equivalently holomorphic line bundles: a commutative group under
tensor product, with the trivial line as unit and the dual as inverse, and with
pullback homomorphisms f*:Pic_hol(M)→Pic_hol(N) for holomorphic f:N→M,
functorial in f and compatible with restriction to open subsets. Construct the
frame 𝒪×-torsor and its inverse by gluing trivial lines, including the actual
overlap cocycles, coboundary changes of frames and refinement maps, in the frame
convention e_j=e_i g_ij, so that g_ij carries j-coordinates to i-coordinates.
Prove the group isomorphism Pic_hol(M)≃H¹(M,𝒪×), with tensor, dual, trivial-line
and pullback laws (Demailly, Chapter V, (8.2), p. 264, is the smooth statement;
the holomorphic one is the same gluing with holomorphic cocycles). Relate this
construction to K4's kernel-of-∂̄ sheaf and, through K4's comparison with
SmoothBundlesConnections B2, to the underlying smooth line of B1/B6, its
unit-circle reduction, connection and Čech constructions; do not introduce a
second bundle carrier.

Prove exactness, including stalkwise surjectivity by a local holomorphic
logarithm, of 0→ℤ→𝒪→𝒪×→1, with f↦exp(2πif) and ℤ the constant sheaf.
Construct its long exact sequence using the native `Sheaf.H.δ` API and prove
its naturality in M. In particular retain the complete segment

H¹(M,ℤ)→H¹(M,𝒪)→Pic_hol(M)→H²(M,ℤ)→H²(M,𝒪)

(Demailly, Chapter VI, §9.1, (9.1), p. 314, writes it for a compact connected
Kähler manifold; the segment on an arbitrary complex manifold is this roadmap's
own statement). Identify the middle connecting map with the integral first Chern
class of the underlying smooth line, through the explicit exponential/Čech maps
and SBC B6.1's sheaf/singular comparison on manifolds, and check the signs
against B6's dual associated line and its principal-circle transitions rather
than equating a frame cocycle with its inverse. Verify on K7's positively
oriented ℂP¹ that O(1) has Chern number 1 and that the Chern connection has
c₁=[iF/(2π)] (Demailly, Chapter V, (9.5), p. 265). Construct compatibility with
curvature and the real de Rham comparison, including torsion invisible to
curvature, tensor powers and conjugate/dual signs.

Prove that H¹(M,𝒪)=H²(M,𝒪)=0 makes c₁:Pic_hol(M)→H²(M,ℤ) an isomorphism.

On the underlying smooth manifold, Hausdorff and second-countable hence paracompact,
write Pic_sm(M) and Pic_cont(M) for smooth and continuous complex-line
isomorphism classes, respectively, and construct the forgetful group isomorphism
F_M:Pic_sm(M)≃Pic_cont(M) in **unstabilized rank one** from the two exponential
sheaf sequences. Let `C⁰_ℂ` and `C^∞_ℂ` be the sheaves of continuous and smooth
complex functions and `C⁰_ℂ×`, `C^∞_ℂ×` their unit sheaves. Prove stalkwise exactness
of `0→ℤ→C⁰_ℂ→C⁰_ℂ×→1` and `0→ℤ→C^∞_ℂ→C^∞_ℂ×→1`, both with f↦exp(2πif): a
nonvanishing continuous function on a chart ball has a continuous logarithm by
Mathlib's `IsCoveringMap.existsUnique_continuousMap_lifts` for
`Complex.isCoveringMap_exp`, and that logarithm is smooth when the function is,
since exp is a local diffeomorphism. Both function sheaves are fine, by continuous
partitions of unity (`PartitionOfUnity.exists_isSubordinate`) and by smooth ones, so
K2's fine-implies-acyclic theorem gives `H^q(M;C⁰_ℂ)=H^q(M;C^∞_ℂ)=0` for q≥1
(Demailly, Chapter IV, (4.11)–(4.12), p. 204, and (4.15), p. 205). Hence both
connecting maps `H¹(M;C^∞_ℂ×)→H²(M;ℤ)` and `H¹(M;C⁰_ℂ×)→H²(M;ℤ)` are isomorphisms.
The inclusion `C^∞_ℂ⊂C⁰_ℂ` is a morphism of the two sequences that is the identity
on ℤ, so naturality of the connecting maps makes the induced map
`H¹(M;C^∞_ℂ×)→H¹(M;C⁰_ℂ×)` an isomorphism commuting with both. Identify Pic_sm(M)
and Pic_cont(M) with these two H¹ groups through transition cocycles in K4's frame
convention, and the induced map with F_M (Demailly, Chapter V, (8.2) and (9.2),
p. 264, for the smooth case; the continuous case is the same argument with
continuous functions, and is this roadmap's own statement). Thus every continuous
line has a smooth representative continuously isomorphic to it, and continuously
isomorphic smooth lines admit a smooth isomorphism; the latter makes the inverse on
classes independent of all representative choices. This is a bijection of actual
rank-one isomorphism classes, not merely stable K₀ classes and not a claimed
bijection between the individual smooth and continuous morphism sets.
Identify F_M with forgetting regularity of the SAME underlying complex line.
Prove compatibility with the trivial line, tensor product and dual, and
F_N(f*L)=f*F_M(L) for smooth maps f:N→M, in particular for holomorphic maps.
Both integral classes are the connecting images just described, so
c₁_cont(F_M[L])=c₁_sm([L]), including torsion; SBC B6.1's sheaf/singular comparison
identifies this class with the integral singular c₁ fixed above.

Compose Pic_hol(M)→Pic_sm(M)→[F_M]Pic_cont(M). Prove that it is the ordinary
forgetful map on underlying lines and respects tensor, dual and holomorphic
pullback. Under H¹(M,𝒪)=H²(M,𝒪)=0, the conditional c₁ isomorphism above,
its identification of c₁ with the class of the underlying smooth line and
SBC B2/B6's smooth complex-line classification make the first map an
isomorphism; F_M then gives each **continuous** complex-line isomorphism
class exactly one holomorphic isomorphism class. This asserts neither a
unique literal Dolbeault operator on a fixed smooth bundle nor a lift of a
specified group action. Without the vanishing
hypotheses retain the exact sequence, its kernel and image, instead of an
unrestricted Picard–H² identification. For compact connected M prove that
global holomorphic units are constants; identify automorphisms of a
holomorphic line with those units. Give the disconnected componentwise
version without replacing componentwise constants by one global scalar.

This generic construction uses K2's local ∂̄/Dolbeault resolution and
Čech/derived comparison, K3's function sheaf and K4's line bundles.
SBC B6.1 owns the manifold good-cover/sheaf/singular comparison; consume
SBC B6's smooth line classification and curvature comparisons through it.
AlgebraicTopology supplies singular cochains and their coefficient exact
sequences, not a second manifold sheaf/singular bridge. The continuous-line
corollary additionally uses K2's fine-implies-acyclic theorem, continuous partitions of
unity and the covering-space logarithm specified above. These are its explicit lower
inputs. Its conditional Picard isomorphism uses supplied vanishing and does
not assume Borel–Weil, Kodaira embedding, flag cohomology or K7's section
dimension calculations. K4.P owns, on every complex manifold, the unit sheaf
𝒪×, the group `Pic_hol(M)` and its frame-torsor description in `H¹(M,𝒪×)`,
the exponential segment, the conditional `c₁` isomorphism, `F_M`, the composite
forgetful map and the global-unit and automorphism statements.
ComplexComparisonPartII C5.4, K3Surfaces 1.1 and GeometricQuantization §3.3
consume the segment and its `c₁` identification; GeometricQuantization §3.3
owns the compact-flag application, proving `H^q(K/H,𝒪)=0` for q>0 by K5/K6
harmonic theory and the actual isotropy weights, deducing
`Pic_hol(K/H)≃H²(K/H;ℤ)` from the generic segment, and identifying its
root-degree basis. SchubertGeometry S5's vanishing on Schubert
varieties is algebraic coherent cohomology; it uses no holomorphic Picard group
and is neither an input nor a consumer of K4.P.

*Needs:* K2's local ∂̄/Dolbeault resolution, Čech/derived comparison and
fine-implies-acyclic theorem; K3's function sheaf; K4's line bundles;
SmoothBundlesConnections B6.1–B6.2; AlgebraicTopology's singular cochains;
Mathlib `Sheaf.H.δ`, `Additive`, `PartitionOfUnity.exists_isSubordinate`,
`Complex.isCoveringMap_exp` and `IsCoveringMap.existsUnique_continuousMap_lifts`.

**Checks.**

- On a point, `𝒪=ℂ`, `𝒪×=ℂ×`, `H¹` vanishes, `Pic_hol` is trivial and the segment
  is `0→0→0→0→0`; the exponential `exp(2πi·)` is surjective onto `ℂ×` with kernel
  `ℤ`, which a map `f↦exp(f)` would fail (kernel `2πiℤ`).
- On `ℂP¹`, `H¹(𝒪)=H²(𝒪)=0` and `c₁:Pic_hol(ℂP¹)→H²(ℂP¹;ℤ)≃ℤ` is an isomorphism with
  `c₁(O(1))·[ℂP¹]=+1` and `c₁(O(−1))·[ℂP¹]=−1`; the inverse frame cocycle would give
  `−1` for `O(1)`.
- On a complex torus of dimension one, `H¹(𝒪)≃ℂ` is nonzero, the kernel of `c₁` is
  the group of degree-zero lines of K7.FlatDegreeZero (unitary characters), and
  `c₁` is not injective; a wrong "unrestricted `Pic_hol≃H²`" would claim it is.
- Torsion is seen: on a complex manifold with `H²(M;ℤ)` having a torsion class `t`
  and `H¹(𝒪)=H²(𝒪)=0`, the line with `c₁=t` is holomorphically nontrivial while its
  curvature class is zero, so curvature alone does not determine the class.
- `F_M` on `ℂP¹`: both `Pic_sm` and `Pic_cont` are `H²(ℂP¹;ℤ)=ℤ` through the two
  connecting maps, and the underlying line of `O(1)` has `c₁·[ℂP¹]=+1` on both sides, so
  `F_M` is the identity of ℤ; a comparison through the inverse frame cocycle on one side
  only would be multiplication by `−1`.
- `F_M` sees torsion: on the smooth manifold `ℝP²`, `H²(ℝP²;ℤ)=ℤ/2`, and the
  complexified Möbius line has `c₁` the nonzero class, since the Bockstein
  `H¹(ℝP²;ℤ/2)→H²(ℝP²;ℤ)` is injective (`H¹(ℝP²;ℤ)=0`); it is smoothly and continuously
  nontrivial although its real curvature class vanishes, and a de Rham-valued `c₁` would
  call it trivial.
- The connecting maps need the fine function sheaves: on `S¹` the locally constant sheaf ℂ
  has `H¹=ℂ≠0`, while `C⁰_ℂ` and `C^∞_ℂ` are acyclic; and classifying complex lines on `S²`
  by `H¹(S²;ℤ/2)=0` (the real-line classification) would miss the lines `O(k)`, `k≠0`.


## K5. Compact Hermitian elliptic theory and Serre duality

**K5a. Real and complex-coefficient analysis on real manifolds.** This shared
layer uses DifferentialGeometry, SmoothBundlesConnections B2–B4, PDE Lane A.3,
[VariationalMethods V2–V5.2](../VariationalMethods/README.md),
[UnboundedOperators UO-D06](../OperatorTheory/UnboundedOperators/README.md),
AlgebraicTopology and Mathlib, and HopfRinow Layer 1's Levi-Civita connection
through PDO P1.0. Its orientation line and
density bundle precede PDO P1.0; its pointwise star is Tau Ceti's. Its distributional operator action and
Laplace analysis then consume P1.0's operator and symbol core. It precedes the complex-manifold
and holomorphic-bundle applications in K5b.

Consume SmoothBundlesConnections B2's RCLike L² section construction. The
bundle is DifferentialGeometry's actual alternating bundle
`V_x=T_xM [⋀^Fin k]→L[ℝ] E_x`, with `E_x=𝕜` in the scalar real/complex cases.
Prove its natural identification with the appropriate exterior-power bundle,
its `VectorBundle 𝕜` structure and the basis-independent Gram⊗h_E metric as
B2's `ContinuousFiberMetric`: `h.inner x : V_x →L⋆[𝕜] V_x →L[𝕜] 𝕜`.
Supply chartwise smoothness and positivity. Use `μ=TauCeti.riemannianVolume I M`;
consume DifferentialGeometry 12.4's full-support/open-positive comparison to
provide B2's `IsOpenPosMeasure μ`. Consume the native
`TauCeti.isLocallyFiniteMeasure_riemannianVolume` instance with the
finite-dimensional, continuous-metric, Borel and Lindelöf hypotheses in
`TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume`; second countability
supplies the Lindelöf condition here.
Use B2's compactly supported smooth density and `MeasureTheory.Lp` comparison
on these bundles.

The pointwise Hodge algebra is Tau Ceti's and is consumed, not restated. On an oriented real
inner-product space V of dimension m the exterior-power inner product is the Gram-determinant
metric, which makes increasing wedges of an orthonormal real coframe orthonormal rather than
summing over all ordered tuples (`TauCeti.exteriorPower_innerₗ`,
`TauCeti.Analysis.InnerProductSpace.HodgeStar.Basic`); the pointwise star
`Orientation.hodgeStar : ⋀^k V ≃ ⋀^l V` for `k+l=m` is characterized by `⟨*α,β⟩=vol(α∧β)`,
equivalently `α∧*β=⟨α,β⟩vol`, with vol the trivialization `Orientation.volumeEquiv` induced by
the native `Orientation.volumeForm` (its signed degree-zero value included), and
`*²=(−1)^(k(m−k))` on degree k is `hodgeStar_hodgeStar`. Its isometry (`hodgeStarIsometry`),
oriented-isometry naturality and orientation-reversal sign (`hodgeStar_neg_orientation`,
`…HodgeStar.Isometry`), the wedge/contraction adjoint identities (`adjoint_wedgeLeft`,
`koszulDifferential_hodgeStar`, `…HodgeStar.Contraction`) and the smooth transport to real
forms on an oriented Riemannian manifold, `TauCeti.SmoothForm.hodgeStar` for DG 2.1's
`Manifold.Orientation` and the Riemannian tangent bundle with `α∧*β=⟨α,β⟩vol` and
`**=(−1)^(kl)` pointwise (`TauCeti.Geometry.Manifold.Riemannian.HodgeStar`), are pinned.
Construct the orientation line from the sign-of-determinant tangent-frame
transition cocycle, identifying its square with the trivial line and its
oriented trivializations with DG's orientations. Without orientation the
star codomain is twisted by this line and its local sign changes glue; this twisted star
is the target here. The orientation line precedes the elliptic scale, and
RiemannianGeometry and SpinGeometry's Clifford–star/chirality comparison consume the same
pinned pointwise algebra. The complex-linear extension of the real star to the complexified
exterior algebra is `Orientation.complexHodgeStar` (`…HodgeStar.Complex`), with
`α∧*β=B_ℂ(α,β)vol=⟨bar α,β⟩_Gram vol`, where B_ℂ is the bilinear
extension of the real Gram product and the Hermitian product is its sesquilinear
complexification, conjugate-linear in its first slot; `barStar β=*(bar β)` is the
conjugate-linear `Orientation.barHodgeStar`, with `α∧barStar β=⟨β,α⟩vol`
(`complexWedgePairing_barHodgeStar`). For a skew-adjoint `J` on the real fiber, in particular
a finite-dimensional orthogonal complex structure, the pointwise (p,q) type law on
`exteriorPower.typeSubmodule` is `complexHodgeStar_mem_typeSubmodule_iff` and
`barHodgeStar_mem_typeSubmodule_iff`: `*` carries type `(p,q)` to `(m/2−q,m/2−p)` and `barStar`
to `(m/2−p,m/2−q)`. This algebra uses no integrability or holomorphic bundle. K5b transports
that law to its type bundles, which is a target of K5b.0.

First equip DG's actual `Density V (finrank ℝ V)` with pointwise
`AddCommGroup` and `Module ℝ` extending DG's existing pointwise `SMul ℝ`,
and prove evaluation on any basis is a
linear equivalence with ℝ. Transport its rank-one topology through this
equivalence, proving basis independence and continuity of the |det| action.
Construct the smooth real density line bundle `DensityBundle M` with local
transition |det D(chart change)|, its dual/tensor and pullback maps, and construct
its `ContMDiffVectorBundle ∞` structure. Identify its smooth sections with
chart-smooth values of DG 5.5's `RoughDensity` carrier; scalar-extend it
to 𝕜 for complex coefficient bundles. Define
`BundleTest(E*⊗DensityBundle M)` as the compactly supported smooth sections,
using native `ContMDiffSection` with `ContMDiffVectorBundle ∞`, and fixed-compact
derivative seminorms. Prove equivalence with chart/frame seminorms and independence
of atlas and auxiliary connection on each fixed compact support. Equip it with
the final locally convex topology for the native `TestFunction Ω F ⊤`
chart/frame extension maps. Pin those maps by their pointwise extension-by-zero
formula and prove the universal continuity criterion: a linear map into a
locally convex space is continuous iff its compositions with every such native
test map are continuous. Prove this topology equals the fixed-compact inductive
limit and its real/complex scalar compatibility. Define
`BundleDistribution(E)=BundleTest(E*⊗DensityBundle M) →L_c[𝕜] 𝕜`,
with compact-convergence topology, matching native Distribution. Keep the
pointwise topology of native TemperedDistribution distinct; prove the
localized test-pairing maps into these carriers continuous, using uniform
estimates on compact test families, without silently identifying topologies.
Consume Mathlib `TestFunction Ω F ⊤`, its LF topology and
`TestFunction.continuous_iff_continuous_comp`, and `Distribution Ω F ⊤`.
Build frame/chart/restriction/gluing comparisons with native real-test
F-valued distributions. For 𝕜=ℂ, complex-linearly extend real tests; prove
compatibility with `TemperedDistribution`'s complex-test convention.
After PDO P1.0's differential-operator and density-transpose core, construct
the action of differential operators on distributions by the
bilinear transpose on E*⊗density tests. Prove compactly supported
Euclidean distributions extend uniquely to tempered distributions after
cutoff, with the explicit test-pairing and cutoff-independence on their
support. Prove finite derivative order on each fixed compact support.

**K5a.DistributionLocalStructure.** Own the continuous-primitive and supported
finite-jet structure on these distribution carriers, before their consumers.

For an interval I and J relatively compact in I, choose χ∈C_c∞(I), equal1
near closure J, and χ̃∈C_c∞(I), equal1 near supp χ. Put w=χu, extended
by0 to ℝ. Choose compact support stages around both cutoffs and prove a
finite order k for w there. Prove the density/extension theorem from smooth
tests to C^k compact tests on a slightly larger stage, using mollification
with support control and the C^k bound; express the result on the native
order-indexed `Distribution Ω F (k:ℕ∞)` carrier and its smooth-test restriction.
Keep its native compact-convergence topology; prove the restriction map
continuous without identifying the finite-order topology with a subspace
topology on `Distribution Ω F ⊤`.
Use χ̃ to pair w with arbitrary C^k functions near its compact support,
and prove independence of this second cutoff.

For m≥k+2 put `H_m(t)=t_+^(m−1)/(m−1)!`, which is C^(m−2). Define
`F(x)=⟨w(t),χ̃(t)H_m(x−t)⟩` using that finite-order extension. Prove
continuity from C^k translation continuity on the common compact t-stage,
and the explicit pairing identity, for every compact smooth ψ,
`⟨F,ψ⟩=⟨w,χ̃(t)∫_ℝH_m(x−t)ψ(x)dx⟩`.
Prove this Fubini interchange in the C^k test topology, even though H_m is
noncompact and not infinitely differentiable. Its distribution derivative
`D^mH_m=δ` and the pairing identity give `D^mF=w`, hence `D^mF=u` on J
(Hörmann–Steinbauer, *Lecture Notes on the Theory of Distributions*, Theorem
4.22, pp. 89–90: the cutoff, finite order N and the fundamental solution
`E_(N+2)` of `(∂₁⋯∂_n)^(N+2)`, whose one-variable case is `H_(N+2)`).
Own this compact distribution–finite-regularity convolution API, not just
the name of a convolution. The order is that of w, not of an unspecified
uncut distribution.

Own the supported finite-jet structure on these same carriers. For a closed embedded submanifold S of
codimension q, in every product normal chart (y,z), prove that a distribution
supported in S has a locally finite-order expression
`u=Σ_(|α|≤N)u_α(y)⊗∂_z^αδ(z)` on compact chart stages, with unique
tangential distribution coefficients (Hörmander, *The Analysis of Linear
Partial Differential Operators I*, Theorem 2.3.5, in the product chart). N may
depend on the compact stage.
Construct coefficients by proper normal projection of z^β times u with a
cutoff equal1 near S, giving `(-1)^|β|β!u_β`, and prove the Taylor/Hadamard
remainder argument that the remaining distribution vanishes. Prove restriction,
chart/density/bundle transport and compatibility of finite stages; coordinate
normal jets transform by their actual normal-jet law. For S a point, deduce
finite delta-derivative sums and linear independence (Hörmander, Theorem
2.3.4; Hörmann–Steinbauer, Theorem 1.70, p. 35). For scalar pullback under
positive dilation prove `∂^αδ` has degree−q−|α|. The generic support/structure
theorem is supplied here; application-specific scaling and wavefront ambiguity
bounds belong to their consumers.

For every real n≥1 own the distribution nonextension example
`exp(1/‖x‖²)` on the punctured Euclidean space, this roadmap's own worked
example, whose proof is the estimate that follows. Choose a nonzero nonnegative
smooth bump φ supported in the unit ball and `0<c<1/4`, and put
`φ_ε(x)=φ((x−εe₁)/(cε))`. All small supports lie in one fixed compact ball
and avoid0. A finite-order extension would bound its value by `Cε^(−N)`,
while its positive punctured-domain integral is at least
`C'ε^n exp((1+c)^(−2)ε^(−2))`. Prove this contradicts every finite N.
Transport by the native Euclidean/chart comparison. Dimension0 is separate.
This generic distribution theorem supplies both the Hyperfunctions and RQFT
source examples and uses no hyperfunction or renormalization theorem.

Own the literal delta-series failure at distribution level. With a compact
smooth test equal near0 to `1/(1+2x)` and supported inside `(-1/4,1/4)`,
prove `⟨δ^(n)/n!,φ⟩=2^n`; its partial sums do not converge in D′.
The point-supported analytic-functional interpretation and convergent
factorial-square comparison belong to Hyperfunctions HF5.

Construct the Fréchet topology on all smooth sections of every finite-rank
bundle, including E*⊗DensityBundle M,
from a countable exhaustion by compact chart/frame sets and all derivative
seminorms; prove completeness, atlas independence and continuous restriction.
Identify its continuous dual with compactly supported distributions, proving
that continuity bounds the pairing by finitely many such seminorms and hence
forces compact support. These carriers precede the Hilbert scale.

**K5a.SmoothSectionMontel — compact and bounded dual convergence.** For a finite-dimensional second-countable Hausdorff smooth manifold M and a finite-rank real or complex smooth bundle E, use the preceding complete compact-C^k Fréchet section topology. Prove that every bounded subset has compact closure: on each compact chart/frame set apply Arzelà–Ascoli to every derivative using the next derivative bound, choose a diagonal subsequence along the countable exhaustion and derivative orders, and show the limits are compatible smooth sections. Include finite/disconnected and compact M. Install the native `MontelSpace` instance from `Mathlib.Analysis.LocallyConvex.Montel`; do not define another Montel predicate. Consume its `ContinuousLinearEquiv.toCompactConvergenceCLM` (and its pointwise apply laws) for the continuous-dual strong/compact-convergence comparison, supplying the native Hausdorff and scalar/module hypotheses. Its two continuity directions use that compact sets are von Neumann bounded and every von Neumann bounded set lies in its compact closure. The new target here is the smooth-section Montel instance and its bundle/density adapters, not a duplicate generic dual-topology theorem; this bundle-valued Montel statement is this roadmap's own, proved by the Arzelà–Ascoli route above. Transport through the section/density trivializations already constructed here. This comparison supplies E′ on Euclidean configuration spaces and on the compact real sphere; it does not identify the LF compact-test dual topology or the pointwise Schwartz-dual topology with either topology by notation.

For compact M define `BundleSobolev E s`, s∈ℝ, as the subspace of
BundleDistribution(E) whose localizations χ_i u in a fixed finite smooth
bundle atlas, after tempered extension, satisfy native
`TemperedDistribution.MemSobolev s 2`; bundle them in the corresponding
`BesselPotentialSpace ℝⁿ F_i s 2`.
Choose a real continuous linear equivalence from the finite-dimensional
M's model space E_M to `EuclideanSpace ℝ (Fin n)`. Use finite-dimensional complex Hilbert
fiber models F_i and χ_i supported inside
chart/frame domains with Σχ_i²=1; extension by zero is distributional.
Pin the norm `‖u‖²=Σ_i‖χ_i u‖²_(Bessel s)`. Prove the localization map is
injective with closed image in `PiLp 2` of those complete Hilbert spaces,
using overlap compatibility and reconstruction Σχ_i(χ_i u). Prove the
Euclidean bounded cutoff/chart-change estimates below first; they make
reconstruction bounded and its compatibility equations closed.
This gives the complete/Hilbert carrier. Define H^s_loc on noncompact M by
membership of every compactly supported chart localization in the native
space, with its localization seminorm topology. For real bundles use
the complexification and real-distribution comparison below, not an
unidentified subspace of complex distributions.

For every real bundle V, consume SBC B2's fibers `ℂ⊗_ℝ V_x`, their natural
inclusion and conjugation, and its dual/tensor comparison for density-valued
tests. Prove the real topological linear equivalence
`BundleTest(V_ℂ) ≃L[ℝ] RealBundleTest(V) × RealBundleTest(V)` given by
`φ=ι(φ_R)+iι(φ_I)`. Multiplication by i corresponds to
`(φ_R,φ_I)↦(−φ_I,φ_R)`; conjugation corresponds to `(φ_R,−φ_I)`.
Prove these identities and continuity in the LF topologies through real
chart/frame maps. Construct the real-linear continuous extension of real
distributions, pinned by `u_ℂ(φ)=u(φ_R)+i u(φ_I)`, and the inverse on fixed
points by evaluation on included real tests. Construct distribution
conjugation `κu(φ)=conj(u(κφ))` as a continuous real-linear involution and
prove that the extension image is exactly its fixed-point subspace, with
the compact-convergence subspace topology and inverse-continuity comparison.
These statements apply to the dual coefficient bundle tensored with the
density line used in the distribution pairing.

Equip complexified real Hilbert fiber models, identified with native
`EuclideanSpace ℂ (Fin r)`, with the sesquilinear extension of the real metric:
`h(a+ib,c+id)=g(a,c)+g(b,d)+i(g(a,d)−g(b,c))`.
The real inclusion is isometric and componentwise `star` is antiunitary.
Prove the coordinate-free tensor-product comparison. Construct conjugation on
their native Schwartz functions, tempered distributions and Bessel spaces.
Prove Fourier conjugation includes reflection `ξ↦−ξ`; since the real-order
Bessel symbol is real and even, conjugation commutes with `besselPotential`
and is isometric on every H^s, including negative s. Choose real cutoff
functions and complexified real frames; prove localization, tempered
extension and reconstruction commute with conjugation. Thus the fixed
part of the closed compatible-tuple carrier is a closed real Hilbert
subspace, with inner product `Re⟨·,·⟩`, canonically a subspace of
`RealBundleDistribution(V)` by the inverse extension. Prove real chart
independence, norm equivalence, density and all scale/duality/regularity
comparisons on this actual carrier. The same construction defines real
H^s_loc using the compact localization seminorms. Consume SBC B2's
isometric geometric `L²(V_ℂ)` complexification identity, using pairs of
real L² sections and its real/imaginary-part maps on the complete
almost-everywhere quotient. Prove conjugation has exactly the real L²
image as fixed points. At s=0, compose that identity with the distribution extension
to give `RealBundleSobolev V 0 ≃L[ℝ] L²(V)`, with the same distributional
image and equivalent norms. The complexification identity uses geometric
L² norms and is isometric; the s=0 distributional comparison uses the
pinned atlas Sobolev norm and is only a norm equivalence. Real operator adjoints and
orthogonal projections use the geometric inner product.

Before chart estimates, construct the Euclidean bilinear density pairing
on native `BesselPotentialSpace` H^s(ℝⁿ;F)×H^(−s)(ℝⁿ;F*)→𝕜,
and prove its continuous-dual identification directly by weighted Plancherel
and reciprocal Fourier weights. Prove density and transpose compatibility on
Schwartz functions first and extend to the completed spaces. This Euclidean
duality precedes the bundle carrier's closed-image/completeness argument.
In the complex Euclidean case also compare the course's Fourier-side
bilinear pairing `B_F(f,g)=∫ f̂(ξ)·ĝ(ξ)dξ` with the spatial density
pairing `B₀(f,g)=∫ f(x)·g(x)dx`. For `Rg(x)=g(−x)`, prove in the
native Fourier normalization `B_F(f,g)=B₀(f,Rg)` by bilinear Plancherel,
and prove R is an involutive isometry on every real-order Euclidean H^s.
Consequently the two transposes satisfy `T^(t_F)=R T^(t₀) R` on
Schwartz functions. Prove the abstract reciprocal-Fourier-weight duality
lemma, including the pairing normalization, and derive the transpose
bound with the same C in the matched primal/dual norms. Apply it to
the native Bessel norms and separately to the course's angular-weight
norms with their chosen pairing constant, then extend by density.
Transporting to other equivalent norms uses their explicit equivalence
constants; it does not preserve C automatically.
For matrix multiplication identify the B_F transpose as multiplication
by `A(−x)ᵀ`, rather than a Hermitian adjoint. These comparisons include
the real-fiber complexification convention already specified above.
Consume PDE Lane A.3's Euclidean H^(k,2)=W^(k,2) comparison with equivalent
norms for every nonnegative integer k, componentwise in each finite-dimensional
fiber model. Construct pullback of distributions
by smooth diffeomorphisms using the dual density pushforward and its Jacobian;
prove support, composition and localized tempered comparisons. Prove
multiplication and compactly localized chart-change estimates first
at nonnegative integer orders by chain rule, coefficient derivative bounds
and the Jacobian change of variables; obtain negative integers by transpose
and density duality. Build the p=2 Hilbert interpolation theorem from weighted
Fourier L², `verticalClosedStrip`, `DiffContOnCl`,
`Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`
and the bounded-operator interpolation argument for this weighted Hilbert scale.
This argument is built here; PDE Lane B.9 supplies the distinct Lp
Riesz–Thorin theorem. Construct complex-order multipliers
Λ^z from `fourierMultiplierCLM` with symbol
`exp((z/2) log(1+|ζ|²))` (`complexBesselSymbol`), on Schwartz functions through
`SchwartzMap.fourierMultiplierCLM` and on tempered distributions through
`TemperedDistribution.fourierMultiplierCLM`. Prove temperate growth at each z (`complexBesselSymbol_temperate`),
agreement at real z=s with the native `besselPotential` of order s, analytic
dependence and imaginary-axis L² isometry. Apply three-lines first to Schwartz
functions with smooth compactly supported Fourier transform, verifying strip
boundedness and density in every real-order space, then extend
these estimates to every real s. Prove choice-independent equivalent norms,
smooth density, connection W^(k,2) comparison and localization naturality.
Own global matrix multiplication by every smooth A:ℝⁿ→Hom(F,G)
with all derivatives, including order0, uniformly bounded: prove bounded
H^s→H^s for each real s by the integer Leibniz estimates, density transpose
and this Hilbert interpolation. This includes the bounded Jacobian factors
in the global diffeomorphism theorem and precedes its negative-order proof.
Pin the global and bounded-domain instances of these coordinate estimates.
Before Laplace estimates, own the differential-operator mapping theorem:
for every P1.0 bundle differential operator P of integer order at most m≥0,
prove `P : BundleSobolev E (s+m) →L[𝕜] BundleSobolev F s` for every real s
on a compact base, with cutoff/local versions on arbitrary chart domains.
On native Euclidean Bessel carriers prove the Fourier-multiplier bound for
each ∂_j, then compose derivatives and the matrix multipliers above in P's
local coefficient formula. Patch by the bounded localization/reconstruction
maps and prove agreement on smooth sections and distributions, independently
of the general pseudodifferential calculus. P5 compares this extension with
its quantization extension when both are defined.
For a smooth diffeomorphism φ:ℝⁿ→ℝⁿ whose every positive-order derivative
and every positive-order derivative of φ⁻¹ is uniformly bounded, prove
pullback extends to a continuous linear isomorphism of each native H^s,
s∈ℝ, inverse to pullback by φ⁻¹, agreeing with distributional pullback
in the native tempered-distribution carrier. Construct that global tempered
pullback first: prove the dual density pushforward
`f ↦ |det Dφ⁻¹|·(f∘φ⁻¹)` maps native Schwartz functions continuously to
Schwartz functions. Bounded first derivatives of φ and φ⁻¹ give linear
growth and properness, while all higher bounds control each Schwartz seminorm.
Define pullback on tempered distributions by this transpose and compare its
image in distributions with the preceding local construction.
The adjoint used at negative orders
includes the Jacobian factor from the dual density pushforward.
For bounded smooth domains U,V, define a smooth diffeomorphism of their
closures as a mutually inverse pair satisfying `ContDiffOn ℝ ∞` on each
closure. Construct
extension of smooth functions/maps across a smooth boundary by a collar,
the half-space Seeley extension and a finite partition of unity; include its
derivative estimates. Use the inverse function theorem and compactness to
extend such a closure diffeomorphism to a diffeomorphism between open
neighbourhoods of the closures, shrinking both neighbourhoods as necessary.
For this extension prove the
corresponding estimate on C_c^∞(V), with both norms computed after
zero extension to ℝⁿ. Export the completion isomorphism and its
compatibility with distributional pullback. This carrier is the completion
of test functions in the whole-space zero-extension norm; its theorem does
not identify it with the restriction Sobolev space on a domain.
The localized cutoff estimates above apply inside arbitrary chart domains
and precede the finite-atlas norm comparison.
Define ξ as the angular frequency, so σ_F(∂_j)=iξ_j. The native Fourier
variable is ζ=ξ/(2π) and its weight is 〈ζ〉^s; prove equivalence, rather than
equality, to 〈ξ〉^s and connection norms. Also prove for every real s
`(1+|ξ|)^(2s) ≍ (1+|ξ|²)^s`, with both constants explicit in s, and
compare the associated completed norms before using either source weight.
Prove continuous embeddings
H^s→C^k for s>k+n/2 and supported Rellich H^s→H^r for every real r<s.
For fixed compact support, prove compactness H^s→C^k under the same strict
margin by choosing k+n/2<r<s and composing Rellich with the continuous
H^r→C^k map. Patch to compact bundles; use the sum over the fixed finite
atlas of `sup_x Σ_(|α|≤k)|D^α(χ_j f_j)(x)|` in its bundle frames, with
the chart cutoffs χ_j extended by zero, and prove equivalence with connection
norms. For every smooth bundle map A:E→F on a compact base prove
`u↦Au : BundleSobolev E s →L[𝕜] BundleSobolev F s` for every real s,
using this same localization and the Euclidean matrix multiplier theorem.
For Rellich, fix a common compact support. Use its distributional pairing
bounds to make Fourier transforms and their frequency derivatives uniformly
bounded on each bounded frequency ball, apply Arzelà–Ascoli there, and bound
the H^r high-frequency tail by 〈ζ〉^(2(r−s)) times the uniform H^s bound.
Use a diagonal subsequence, then the bundle localization/reconstruction maps.
Use the Riemannian density to identify E*⊗DensityBundle M with E* in the
continuous bilinear density pairing H^s(E)×H^(−s)(E*)→𝕜. This pairing identifies
H^(−s)(E*) with the 𝕜-linear continuous dual of H^s(E). Hermitian Riesz
transport to E is conjugate-linear and gives the second/first slot pairing
∫⟨v,u⟩, consistent with Mathlib's conjugate-first inner product.
Finite distribution order and these continuous embeddings then show every
bundle distribution lies locally in H^(−N) for some finite N.
The general pseudodifferential calculus consumes this shared scale; this
Laplace-type layer consumes P1.0's differential operators, not the general
calculus or P1.1's Peetre theorem. Prove BundleSobolev E 0 and B2's
geometric L² have the same distributional image and equivalent norms, using
`TemperedDistribution.memSobolev_zero_iff`, the distribution map
`s ↦ (φ ↦ ∫ φ(s))`, the chart metric/density bounds
and B2's chart isometries. This gives a continuous linear equivalence, not
an isometry for the pinned atlas norm. Every formal adjoint, self-adjoint
realization, harmonic projection and orthogonal Hodge splitting uses B2's
inner product ∫⟨s,t⟩_h dμ; the atlas H^s inner products provide the Hilbert
scale and compactness. Compare P1.0's formal density adjoints with that
geometric L² pairing even on nonorientable real manifolds, and prove the
real de Rham instantiation on this shared API.

Own the complex-linear manifold top-form integration and pairing API by real
and imaginary parts on DifferentialGeometry's carrier, proving agreement with
DG8.4's existing vector-valued simplex/chain integrals and Stokes. Use that
agreement for the complex-linear de Rham integration map and its naturality. On an
oriented real Riemannian manifold, extend compactly supported smooth top-form
integration to integrable `f dvol_g` through the L¹ density completion;
prove independence of the approximants. Combine DG 5.5's agreement of the density
integral with `integralTopForm` on oriented manifolds and DG 12.4's agreement of
`TauCeti.riemannianVolume` with the density integral to prove
`∫_M f dvol_g=∫ f d(riemannianVolume I M)` for integrable complex f,
first on compactly supported smooth functions and then by L¹ density. Use
this comparison in every L² formal-adjoint and Hodge pairing identity.
Construct the ℂ-valued de Rham complex on DG's same generic form carrier as a cochain
complex in `ModuleCat ℂ`, using K1's complex scalar action and complex-linear `mextDeriv`.
Equip its de Rham cohomology quotients with the induced `Module ℂ` structure, prove the quotient
maps are complex-linear, and prove the complex-linear isomorphism
`H_dR(M;ℂ) ≃ ℂ ⊗_ℝ H_dR(M;ℝ)` by scalar extension of the complex. Include the
singular-cohomology comparison supplied by DifferentialGeometry and AlgebraicTopology.

As a punctured-plane regression, compute `H¹_dR(ℂ\{0};ℂ)≃ℂ` on this same complex
form carrier. Give `ℂ\{0}` its canonical open-subtype manifold structure with model `𝓘(ℝ,ℂ)`.
For a smooth closed complex 1-form `ω`, view it as its real-linear covector field on the
open subtype. Let `γ(t)` be `circleMap 0 1 t`, regarded as a curve in that subtype using its
nonvanishing unit-circle proof. Define the positive unit-circle period by
`Per(ω)=∫₀^{2π} ω(γ(t))(deriv (circleMap 0 1) t) dt`.
Prove the native scalar comparison `Per(f dz)=circleIntegral f 0 1` when the form is the
complex-linear covector `v↦f(z)v`; the circle-integral definition uses the same derivative
parametrization. Set `P([ω])=(2πi)⁻¹Per(ω)`. Prove exact forms have zero period by the C¹
path fundamental theorem, so `P` is well-defined. Prove its complex linearity.

Use the slit domains `V_+=ℂ\(-∞,0]` and `V_-=ℂ\[0,∞)`.
The first is Mathlib's `Complex.slitPlane`, star-convex about `1` by
`Complex.starConvex_one_slitPlane`; the second is its image under `z↦−z`, hence star-convex
about `−1`. Apply DG6.2's smooth star-convex primitive target, constructed from DG5.4's
radial homotopy, to obtain smooth primitives `g_+` and `g_-` of `ω` on these domains.

Split the positively oriented circle into four arcs: `1→i` and `−i→1` lie in `V_+`, while
`i→−1` and `−1→−i` lie in `V_-`. The upper and lower overlap components are connected, so
`g_+−g_-` is constant there, with values `c_U` and `c_L`. Apply the interval fundamental
theorem to the four arcs, reading each 1-form on the open subtype as its flat covector field
on the ambient plane and comparing with native `curveIntegral` by Mathlib's
`curveIntegral_eq_intervalIntegral_deriv`. Their sum gives `Per(ω)=c_U−c_L`. Thus zero period makes the constants
equal; after one constant adjustment the two local primitives glue to a global smooth primitive.
For general `ω`, set `k=(2πi)⁻¹Per(ω)`; the closed form `ω−k dz/z` has zero period and is
exact, so `[ω]=k[dz/z]`. Since `Per(dz/z)=2πi`, `P([dz/z])=1` and `P` is a
complex-linear equivalence.
For the normalization, construct `dz/z` as a smooth form through DG0.3 and prove
`dz/z=β+iα`, where `α=(−y dx+x dy)/(x²+y²)` and `β=(x dx+y dy)/(x²+y²)` on the
punctured plane, so that the polar map `(r,θ)↦(r cos θ,r sin θ)` pulls α back to `dθ` and
β to `dr/r`. Define `Log_+` as the principal logarithm on `V_+` with argument
`(−π,π)`, and `Log_−(z)=log(−z)+iπ` on `V_-`, with argument `(0,2π)`. Then
`Log_−−Log_+` is `0` on the upper overlap and `2πi` on the lower. Prove
`d Log_±=dz/z` on the corresponding slit domains from the real derivative of the complex
logarithm and the chain rule. This proves closedness of `dz/z` by locality and `d²=0`.
For these primitives, `c_U=0`, `c_L=−2πi`, and hence `Per(dz/z)=2πi` by the four-arc formula.
Relate the real slit
primitive to `Re(Log_-)+Im(Log_-)=log r+θ` on `V_-`. Use the complex form carrier and
cohomology quotient above throughout this computation.

As a disk regression, let `D={z:|z|<1}` with its open-subtype smooth structure and DG's existing
form carrier with coefficients in `ℂ`. Compute `H⁰_dR(D;ℂ)≃ℂ` by a complex-linear equivalence,
and `H¹_dR(D;ℂ)=H²_dR(D;ℂ)=0`. For degrees one and two use DG5.4's `homotopyOperator` for
the radial contraction `H(z,t)=tz` with complete complex coefficients; degree-two forms are
closed by dimension. Pass from primitives to the K5a complex quotient. As a consistency check,
compare the degree-two result with the specialization to `Ω=D` of the GH5.1 adapter already
consumed above; this example adds no new dependency edge. Keep it on DG's existing form carrier.

Consume P1.0's differential-operator carrier and Laplace-type predicate:
order at most 2 and Fourier principal symbol c|ξ|²_g Id for a fixed c>0.
Consume P1.0's restriction-compatible symbol and formal-adjoint maps,
bilinear density transpose and their local coordinate formulas.
Own local elliptic estimates for these operators on finite-rank real Riemannian and
complex Hermitian bundles over `[RCLike 𝕜]`, with smooth coefficients and
principal symbol `c g^{ij}ξ_iξ_j Id` for a fixed c>0, using the convention
`σ(∂_j)=iξ_j` (complexify real operators for this symbol), including the c=1
Laplace-type normalization. Give the positive-scalar rescaling of norm,
resolvent and Green-operator identities. Use frozen-principal-part Fourier estimates at every real order and absorb
smooth matrix lower-order coupling by the Hilbert interpolation inequalities
and interior cutoffs. Compare the integer-order conclusions with PDE's scalar
estimates, without using its H¹-weak theorem as the distributional starting step. Prove frame
invariance, localization/partition estimates and bundle Sobolev Rellich compactness.
Pin s∈ℝ throughout the Hilbert-scale estimates. Build the local regularizing
mollifier/Friedrichs commutator estimates for smooth matrix coefficients,
uniform for 0<ε≤1: for chart-localized order 2 P and convolution
regularizer J_ε, prove `[P,J_ε]:H^r→H^(r−1)` bounded independently of ε,
for every real r, with nested cutoff versions and strong J_ε→Id on each
fixed Sobolev order. Prove them from Fourier convolution,
the following explicit Fourier targets, proved here: for every real s,
`〈ζ+η〉^s≤2^(|s|/2)〈ζ〉^s〈η〉^|s|`, and the weighted Schur
test together with the L¹*L² Young bound. Consume native
`SchwartzMap.fourier_convolution` for the Fourier product/convolution
identity. Use cutoffs to give rapidly decaying
coefficient transforms. Combine frozen constant-principal-part Fourier
estimates with the following all-real-order coefficient estimate. For every
smooth compactly supported matrix f and s∈ℝ, prove
`[Λ^s,M_f]:H^(s−1)→L²` bounded by Fourier convolution, Peetre and Schur
estimates, hence
`‖fw‖_(H^s) ≤ sup_x‖f(x)‖·‖w‖_(H^s)+C_f,s‖w‖_(H^(s−1))`.
Here `sup_x‖f(x)‖` is the fiber operator norm and the Euclidean H^s norm
is the native Bessel norm `‖Λ^s w‖₂`; the leading coefficient is 1 in
that norm. Compare the resulting estimate with the equivalent angular-
frequency and connection norms, allowing their fixed equivalence constants.
The lower-order constant
may depend on derivatives and support. This permits the small principal
coefficient term to be absorbed on small charts; interpolation absorbs the
remaining lower-order terms. Use this estimate and interior cutoffs to prove
interior estimates before passing from smooth to weak inputs. For cutoffs
χ,χ′ with χ′=1 on a neighbourhood of supp χ, every real s and r<s+2,
prove for smooth u and some C>0 depending on these fixed data

`‖χu‖_(H^(s+2)) ≤ C(‖χ′Pu‖_(H^s)+‖χ′u‖_(H^r))`.

Apply the uniform regularization/commutator estimates and weak compactness to
gain one Sobolev derivative starting from H^r_loc. Iterate from the proved
finite negative local order to obtain distributional regularity:
Pu∈H^s_loc implies u∈H^(s+2)_loc. In particular explicitly prove the
L²_loc→H¹_loc starting step, rather than invoking scalar PDE's H¹-weak
regularity on an L² input. On compact boundaryless manifolds give the global
estimate with any lower r<s+2, extend it to the operator domains, and prove
L²-weak solutions with Pu∈H^s lie in H^(s+2). Smooth right-hand sides then
give smooth solutions. These are targets for general smooth Laplace-type
bundle systems before the specific Hodge applications.
HamiltonianReduction R5 consumes this smooth-coefficient layer at smooth
reference connections for the Laplace operator of `d_A⊕d_A*`. K5 computes
the exterior-multiplication/contraction symbols to prove
`σ_F((d_A⊕d_A*)*(d_A⊕d_A*))=|ξ|²_g Id` on each degree, for every smooth
metric connection A, compatibly with P1.0's symbol and Dirac-type API. R5 owns its
Sobolev-coefficient perturbation estimates, gauge-specific identifications and
Coulomb slice.

For every formally self-adjoint nonnegative Laplace-type system on a compact
boundaryless base, identify its form and inclusion in B2's geometric L² with
[VariationalMethods §5.1](../VariationalMethods/README.md)'s represented
operator of a compact form pair, with domain `CompactFormPair.operatorDomainV`,
which is the specialization of the same
[UO-D06 `closedFormOperator`](../OperatorTheory/UnboundedOperators/README.md).
UO-D06 owns general closed-form representation, real-shift self-adjointness,
both adjoint inclusions and witness independence; §5.1 applies these on the
identical form/inclusion data and owns its compact-pair comparisons. Prove
here that the operator domain and adjoint/maximal weak domain are H² by
elliptic regularity, thereby obtaining the specified geometric H² realization.
Prove the shifted energy form coercive on H¹ using its scalar principal part
and bounded lower-order coefficients. Consume
[VariationalMethods §2.3](../VariationalMethods/README.md)'s RCLike
coercive solution map and its identification at real scalars with native
real `IsCoercive.continuousLinearEquivOfBilin`; complex Hermitian forms
use the realification and i-test supplied there. Use H¹ Rellich and
[VariationalMethods V3–V4](../VariationalMethods/README.md)'s abstract compact-
embedding form/solution-operator spectral theorem, with
[V5.1–V5.2](../VariationalMethods/README.md)'s same-operator
compact-resolvent, graph/domain and eigen-expansion comparisons, to obtain
finite-dimensional kernel, complete smooth eigensections, Green inverse on
the kernel's orthogonal complement and its projection/recovery identities.
The geometric elliptic weak-domain identification and smoothness are owned
here; the abstract represented operator and compact spectral arguments are
consumed through those suppliers. Apply the same construction to Δ_d and Δ_A;
PDO P7 and HamiltonianReduction R5 consume it for smooth reference operators
before their additional estimates.

The codifferential on real forms is Tau Ceti's `TauCeti.SmoothForm.codifferential`
(`TauCeti.Geometry.Manifold.Riemannian.Codifferential`), `d*=(−1)^(m(k+1)+1)*d*` on k-forms of
an oriented Riemannian m-manifold, with `d*d*=0` (`codifferential_codifferential`),
independence of the orientation (`codifferential_neg_orientation`), Green's formula
`d(α∧*β)=⟨dα,β⟩vol−⟨α,d*β⟩vol` (`mextDeriv_wedge_hodgeStar`) and formal adjointness
`∫⟨dα,β⟩vol=∫⟨α,d*β⟩vol` on a boundaryless Hausdorff σ-compact manifold when one of the two
forms has compact support (`integralTopForm_inner_mextDeriv_eq_inner_codifferential`). Prove
that this `d*` is the L² adjoint of `d` in B2's L² sections and define the nonnegative Hodge
Laplacian `Δ=d*d+dd*`, `σ_F(Δ_d)=|ξ|²_g Id`. Prove its self-adjoint realization with
domain H² and compact resolvent by the shared estimates/weak-domain
identification, before constructing its eigensection decomposition. On
functions it is the negative of DG's `laplaceBeltrami=div∘grad`. Construct
harmonic projection and Green operator, the orthogonal harmonic/exact/coexact
splitting, and the de Rham Hodge theorem on compact real Riemannian manifolds;
identify its cohomology with DifferentialGeometry's de Rham object.
Own `*Δ_d=Δ_d*` on real forms of an oriented m-manifold, from the pinned sign of `d*`; PDO
P1.1, Riem R7.4 and K5b consume this identity and that sign.

**K5a.ComponentwiseCompact — analytic transport for locally finite rank.**
For a compact locally connected boundaryless manifold M and a smooth real or
complex bundle family assembled from native fixed-model bundles E_C on its
connected components, prove that the component open cover has a finite
subcover. Components are disjoint and nonempty, so every component occurs in
that finite subcover; they are clopen and compact. Give the resulting finite
component index and restrict the metric, density and all bundle operations
to each C. The rank r(C) may vary. This supplies an analytic adapter on the
actual componentwise carriers, without constructing a single fixed-F native
bundle from a finite rank bound. Its smooth bundle-family input uses the
componentwise assembly of K4; in the real smooth case construct the same
restriction/pasting adapter directly from native smooth bundles. K4's
holomorphic construction supplies this input for K5b. The early pointwise,
density and fixed-model analysis of K5a remains independent of that application.

Define smooth sections on the assembled fibre family by the actual pointwise
pasting of the component native `ContMDiffSection` carriers, and prove that
restriction and pasting are inverse topological linear maps for the smooth
section seminorms. Construct the corresponding compactly supported
density-dual test sections and their fixed-compact/LF topology, with the
explicit restriction and clopen extension-by-zero maps. Prove their comparison
with the finite product of component `BundleTest` spaces. For distributions,
pin `u_C(φ_C)=u(ext_C φ_C)` and
`u(φ)=Σ_C u_C(φ|C)`; prove inverse continuous linear maps with the actual
compact-convergence dual topologies, compact test families and distributional
section embeddings. Include restriction, evaluation, real/complex scalar and
conjugation compatibility. These constructions act on sections/tests of the
assembled fibres and use the component native maps, rather than introducing
an unconstrained space merely named after a section carrier.

Prove the induced geometric measure on each C agrees with restriction of
the measure on M under the open-submanifold inclusion, and prove the finite
component integration formula before comparing completed section spaces.
Construct geometric L² on that assembled family from measurable sections
with square-integrable fibre norm, modulo almost-everywhere equality for the
actual geometric measure. Prove the restriction map and measurable pasting
map descend to inverse linear isometries with native `PiLp 2 (fun C => L²(E_C))`;
its inner product is the finite sum of the component geometric integrals.
Identify smooth-section and test/distribution embeddings through this map.
For every real s, define the assembled Sobolev subspace in the assembled
`BundleDistribution` by component membership in `BundleSobolev E_C s`, and
prove equivalence with localization in the disjoint union of the component
finite atlases. Pin the sum-of-squares component Sobolev norm; restriction
identifies it isometrically with `PiLp 2` of the component H^s spaces. Give
its completeness, embeddings, interpolation, density, localization and
all-real-order duality comparisons, including negative s. The bilinear
H^s/H^(−s) density pairing is the sum of component pairings; realification,
conjugation and Hermitian Riesz transport commute with these maps. At s=0,
compare with geometric L² by the component continuous linear equivalences
and equivalent norms; retain the distinction between that comparison and
the isometric component splitting of each separately chosen norm.

For a finite-order local differential operator between these bundle families,
prove that its smooth and distributional action commutes with restriction
and clopen extension by zero, hence acts by the component operators. Prove
the same for their density transposes and geometric formal adjoints using
the summed Green pairing, and transport their real-order Sobolev mapping
bounds. This block assertion concerns local differential operators, including
the geometric Laplace-type and Dolbeault operators used here; a general
nonlocal linear operator may couple components. For the specified formally
self-adjoint nonnegative Laplace-type systems, prove the maximal weak/adjoint
domain is the finite product of component maximal domains and thus exactly
the assembled H². Give the actual domain/action and graph comparison with
the finite orthogonal sum of the component realizations by testing against
single-component extensions. For each stated operator and Sobolev order,
choose common admissible shifts and positive coercivity constants by finite
maxima/minima of the component data, and finite constants for the estimates.
Consume [VM V3.1's finite orthogonal-sum transport](../VariationalMethods/README.md)
for the resulting compact form pair and identify its represented operator
with that same component operator through the UO-D06 graph characterization;
no second generic form-representation or self-adjointness theorem is owned
by this adapter. Prove compactness of the assembled inclusion/resolvent,
the componentwise harmonic projection and Green inverse with their recovery
identities, and the complete smooth eigenbasis obtained from the component
bases. The eigenbasis index is the disjoint union of the component indices;
coincident eigenvalues retain the sum of their multiplicities. Treat empty M
and zero-rank component bundles by the zero section/test/distribution/Hilbert
spaces and empty eigenbases, with vacuous positive bounds and zero operators
where appropriate. None of these finite-component estimates supplies a
uniform rank, shift or analytic constant for an arbitrary noncompact base;
K4 retains its unbounded-rank componentwise scope there.

**Checks.**

- `complexBesselSymbol` at `z=0` is 1 at every ζ, so `Λ^0` is the identity, as is Mathlib's
  `besselPotential` at order 0; at `z=2` it is `1+‖ζ‖²`, the multiplier of `1−(2π)^(−2)Δ` in the
  native Fourier normalization, not of `1−Δ`.
- At real `z=s` it is `(1+‖ζ‖²)^(s/2)`, the symbol of Mathlib's `besselPotential` of order s;
  at `z=it` its modulus is `exp(Re((it/2)log(1+‖ζ‖²)))=1`, so `Λ^(it)` is an L² isometry. A
  symbol built from `log(1+‖ζ‖)` would give `1+‖ζ‖` at z=2, which is 3 instead of 5 at
  `‖ζ‖=2`; the symbols multiply, `z=1` and `z=−1` giving 1.
- The density line transition is `|det|`: under the chart `x↦−x` on ℝ the density `|dx|`
  is unchanged while the form `dx` changes sign; with `det` the density line would be the
  orientation line, nontrivial on `ℝP²`, whereas `DensityBundle ℝP²` is trivial.
- `BundleTest` and `BundleDistribution` on ℝ with the trivial line: the delta
  `φ|dx|↦φ(0)` is chart independent, and the locally integrable function 1 pairs as
  `φ|dx|↦∫φ dx`, also chart independent; pairing with bare functions instead of densities
  would make it depend on the chart, since under `y=2x` `∫φ dy=2∫φ dx`. The empty base and
  the zero bundle give zero test and distribution spaces.
- `BundleSobolev`: a point delta on a compact n-manifold lies in `BundleSobolev E s` exactly
  when `s<−n/2`, since its Fourier transform has modulus 1 and `∫(1+‖ζ‖²)^s dζ` is finite
  exactly then (`s<−1/2` on `S¹`); a weight `(1+‖ζ‖²)^(2s)` would move the threshold to
  `s<−n/4`. Smooth sections lie in every `BundleSobolev E s`.

**K5b. Hermitian type calculus, Dolbeault Hodge theory and Serre duality.**
**K5b.0 — Local Hermitian identities on arbitrary complex manifolds.**
Consume K1, K2, K4 and K5a's pointwise density/formal-adjoint layer.
The Gram/type/star identities, Dolbeault formal adjoint on compact supports
and principal symbol `σ(Δ_∂̄_E)(ξ)=½|ξ|²_g Id` below hold on arbitrary
Hermitian complex manifolds and their open sets, without compactness (Demailly,
Chapter VI, §7, p. 309: the formal adjoint `D*_E=−⋆D_E⋆`, where Demailly's ⋆ is the
complex-linear star `*` here and his conjugate-linear variant `#` is `barStar`, and the
principal part of `Δ''_E` equal to one half that of `Δ_E`).
RealAnalyticGeometry R3.1 consumes them for its weighted noncompact estimate.
Prove
`dvol_g=ω^n/n!` for the complex orientation. Identify K1's
(p,q) summands as smooth Gram-orthogonal subbundles, with their orthogonal
splitting and coefficient-space models. Prove the complex Dolbeault
formal-adjoint instantiation on K5a's shared density and L² API.
For H_kl=h_T(∂_(z_k),∂_(z_l)), pin
`|dz_j|²_Gram=2(H⁻¹)_jj` and
`dz_j♯=2 Σ_k (H⁻¹)_kj ∂_(z_k)`. Thus `|dz_j|²=2` and
`dz_j♯=2∂_(z_j)` hold where H=I, including the standard metric.
For a `(1,0)` coframe ψ orthonormal in the complexified-real Gram product,
define wedge `e_θ=θ∧·` and `i_θ=e_θ*=ι_(θ♯)`, where ♯ is the
conjugate-linear Gram dual. Prove `(1,0)` and `(0,1)` cotangent subspaces are
Gram-orthogonal. For ψ_j and its conjugate, pin `i_j=e_j*`, `bar(i_j)=bar(e_j)*`,
`e_θ i_η+i_η e_θ=⟨η,θ⟩_Gram`. In particular the two same-type
anticommutators are δ_jk and both mixed-type anticommutators vanish.
In coordinates use the preceding H⁻¹ formula for contraction; interior at
the ordinary dual-frame vector is a different normalization.
A unitary `(1,0)` coframe φ for h_T* has Gram norm √2; prove the scaling
ψ=φ/√2 and the resulting identity
`e_(φ_j)i_(φ_k)+i_(φ_k)e_(φ_j)=2δ_jk`. Transport K5a's pointwise type law to the
complex-linear Hodge star `*:Ω^(p,q)→Ω^(n−q,n−p)`, its degree
square identities, and the `(n−p,n−q)` type of the pinned `barHodgeStar`, `barStar β=*(bar β)`. Pin
`α∧barStar β=⟨β,α⟩dvol` and `∂̄*=−*∂*` (Demailly, Chapter VI, (5.2)–(5.3), p. 300, where
⋆ is the complex-linear star of type `(n−q,n−p)`). Consume K5a's
`*Δ_d=Δ_d*` and prove `barStar Δ_∂̄=Δ_∂̄ barStar`.
For a Hermitian holomorphic bundle E construct conjugate-linear
`barStar_E:Ω^(p,q)(E)→Ω^(n−p,n−q)(E*)` using the fiberwise metric identification; pin
the identity `α∧_ev barStar_E β=⟨β,α⟩_(Gram⊗h_E)dvol_g`, using
`wedgeWith` with evaluation `(s,φ)↦φ(s)` in that order, and its integral/norm
consequence. Use this same slot order in the Serre pairing. Prove inverse/square
and `barStar_E Δ_∂̄_E=Δ_∂̄_(E*) barStar_E`, where E* has B2's Riesz-transported
dual metric.


**K5b.1 — Compact Dolbeault Hodge theory.**
For K4's pointwise finite-rank holomorphic bundles on a compact base, consume
K5a.ComponentwiseCompact on the actual component restrictions, including
E-valued type forms, the dual bundle and `E*⊗K_M`. Prove that clopen
restriction/pasting intertwines ∂̄, its geometric adjoint, the Dolbeault
Laplacian and barStar_E. Transport the H² realization, harmonic/Green maps
and decomposition below through those explicit comparisons. Identify the
Dolbeault complex and its cohomology with the finite products of component
complexes and cohomology groups, compatibly with the section-sheaf Dolbeault
comparison. Prove the global integration pairing is the sum of the component
integrals with the already pinned wedge/evaluation slot order. Use the
component perfect pairings and the finite-product dual comparison to obtain
the stated global finite-dimensionality and Serre duality for varying ranks,
including rank zero and empty M; do not impose connectedness or a single
native fibre model on this compact conclusion.

On compact boundaryless Hermitian manifolds, consume K5b.0's symbol and
instantiate K5a's full real-manifold generic
estimates, regularity, self-adjoint H² realization in B2's geometric L²,
compact resolvent, kernel and smooth eigenbasis at c=½,
equivalently using `2Δ_∂̄_E` at c=1. Construct harmonic
projection and Green operator, prove orthogonal decomposition into harmonic, ∂̄-exact and
∂̄*-exact terms, and identify Dolbeault cohomology with harmonic forms.

Prove the integration pairing `H^(p,q)(M;E) × H^(n-p,n-q)(M;E*) → ℂ` is nondegenerate and
identifies the second factor with the linear dual. Derive holomorphic-vector-bundle Serre
duality `H^q(M;E)*≃H^(n-q)(M;E*⊗K_M)` via Dolbeault comparison. Prove finite Hodge
numbers, metric independence and the dual Hodge-diamond symmetry on compact complex
manifolds. No Kähler hypothesis is needed for these Hermitian/Dolbeault statements. With
scalar coefficients, `finiteDimensional_dolbeaultCohomology` states that every
`DolbeaultCohomology E M p q` of a compact complex manifold is finite-dimensional (Demailly,
Chapter VI, (7.2)), and `finrank_dolbeaultCohomology_serre` states the dual Hodge-diamond
symmetry `h^(p,q)=h^(n−p,n−q)` for `p,q≤n` (Demailly, Chapter VI, (7.3) and (8.12)).
For scalar coefficients, transport `barStar` through the harmonic
identification to an anti-complex-linear isomorphism
`H^(p,q)(M) ≃ H^(n−p,n−q)(M)`. Prove its inverse and square sign.
It depends on the Hermitian metric; it is distinct from the complex-linear
pointwise star, whose type is `(n−q,n−p)`.

**Checks.**

- Volume normalization: on ℂ with the standard metric `ω=(i/2)dz∧dz̄=dx∧dy=dvol`, and on ℂ²
  `ω²/2!=dx₁∧dy₁∧dx₂∧dy₂`; dropping the `1/n!` gives `2dvol` on ℂ².
- Gram norm and adjoint: `|dz|²_Gram=|dx|²+|dy|²=2`, hence `∂̄*(f dz̄)=−2∂f/∂z` and
  `Δ_∂̄ g=−2∂_z∂_z̄ g=−½Δ_flat g` on functions, whose symbol is `½|ξ|²`, as stated above;
  the normalization `|dz|²=1` would give symbol `¼|ξ|²`.
- Serre duality without Kähler: on the Hopf surface `h^(0,1)=1=h^(2,1)` while
  `h^(1,0)=0`, so `h^(p,q)=h^(n−p,n−q)` holds and `h^(p,q)=h^(q,p)` fails; on ℂP¹
  `h^(0,0)=h^(1,1)=1` and `h^(1,0)=h^(0,1)=0`.
- Complex-linear versus conjugate-linear star: on ℂ, `*dz` is a multiple of `dz` (type
  `(n−q,n−p)=(1,0)`), while `barStar dz` is a multiple of `dz̄` (type `(n−p,n−q)=(0,1)`).

## K6. Kähler identities and Hodge decomposition

### K6.0. Local Kähler and curvature identities

The canonical predicate is a Hermitian metric on a complex manifold with closed
fundamental form. Prove its comparison, through K1 Newlander–Nirenberg, with the
real-carrier condition `IsKahler form J`: the real two-form is closed (`SmoothForm.IsClosed`),
compatible with J (`SmoothTwoForm.Compatible`, invariance and positivity on complex lines)
and the pinned Nijenhuis tensor `J.nijenhuis` vanishes. Define Kähler metrics by
closedness of the fundamental form and prove equivalence to `∇J=0` for Levi-Civita.
For an arbitrary smooth Hermitian metric and a fixed p, prove that holomorphic
coordinates with metric matrix `H(0)=I` and real derivative `dH(0)=0` exist
exactly when `dω(p)=0`. The global Kähler equivalence requires these coordinates
at every point. Give actual neighborhood and Taylor bounds: on a smaller chart,
`‖H(w)−I‖≤C‖w‖²` for a finite C. Use K4's native Hermitian slot convention.

For the Kähler construction first normalize a holomorphic chart at p so H(0)=I.
Derive zero Chern torsion directly from dω=0; Levi-Civita uniqueness then
identifies the two connections before the coordinate construction. Write `∇_(∂_j)∂_k=Σ_i Γ^i_jk ∂_i` for the common Levi-Civita/Chern
connection on `T^(1,0)M`. Torsion-freeness makes Γ symmetric in j,k.
Construct the polynomial map from the new coordinates to the old ones,
`z^i(w)=w^i−(1/2)Σ_(j,k) Γ^i_jk(p)w^j w^k`. Its derivative at0 is I;
K1's holomorphic inverse-function theorem makes it a biholomorphic chart
change on specified neighborhoods. Prove by the connection and metric
transformation laws that the new Γ and first metric derivatives vanish at0.
Its two-jet at 0 is pinned: the first differential is the identity and the
second differential is `(u,v)↦−Γ(p)(u,v)`, using the symmetry of Γ.

In these coordinates construct a smooth unitary `(1,0)` coframe φ by
Gram–Schmidt, with `φ_j=Σ_k A_jk(w)dw^k`, `A(0)=I` and `dA(0)=0`.
Prove smooth dependence of Gram–Schmidt on positive Hermitian matrices,
and derive the first-derivative assertion from `dH(0)=0`. In particular
`dφ_j(p)=0`. Retain K5b.0's Gram normalization: φ has complexified-real
Gram norm √2 and ψ=φ/√2 is Gram-orthonormal. This supplies the actual
coframe used in the Kähler commutator calculation. The global equivalences
(Kähler, `dω=0`, `∇J=0`, normal coordinates at every point) are
[Ballmann, *Lectures on Kähler Manifolds*, Theorem 4.17, pp. 47–48](https://people.maths.ox.ac.uk/joyce/Nairobi2019/BallmannKahlerManifolds.pdf);
the pointwise criterion `dω(p)=0` at one fixed p is this roadmap's
strengthening, proved by the same quadratic coordinate change at that point.

*Needs:* K1's holomorphic inverse-function theorem; K4's Chern connection, torsion
and Hermitian slot convention; Mathlib's finite-dimensional Gram–Schmidt.

**Checks.**

- On ℂⁿ with the standard metric, `H≡I`, `Γ=0`, the coordinate change is the
  identity and `C=0`.
- On ℂP¹ in the affine chart scaled by `√π`, `H(w)=(1+π|w|²)^(−2)` has `H(0)=1`,
  `dH(0)=0` and `|H(w)−1|≤2π|w|²` near 0, so the chart is already normal at 0.
- Negative control: `H=diag(1+z₂+bar(z₂),1)` on ℂ² is Hermitian positive near 0
  with `dω(0)=(i/2)(dz₂+dbar(z₂))∧dz₁∧dbar(z₁)≠0`, so no holomorphic
  coordinates with `dH(0)=0` exist at 0; a criterion that omitted `dω(p)=0`
  would claim them.

Prove the standard Kähler structure on ℂⁿ, that complex submanifolds inherit
Kähler metrics, and that every Hermitian metric on a complex curve is Kähler.
Develop `L=ω∧·`,
its adjoint Λ, primitive forms and `[Λ,L]=(n-k)` on degree k. Prove `[Λ,∂]=i∂̄*`,
`[Λ,∂̄]=-i∂*` and the adjoint/conjugate identities, explicitly `[Λ,d]=−(d^c)*` and
`[L,d*]=d^c`. For `d_c=d^c/(4π)`, prove the corresponding commutator
identities with the factor 4π. Prove
`Δ_d=2Δ_∂=2Δ_∂̄`, preserving type.

For a smooth Hermitian holomorphic bundle E with K4's Chern connection, prove
pointwise Lefschetz algebra on E-valued forms and the twisted Kähler identities
`[Λ,∂̄_E]=−i(D'_E)*` and their adjoints. Prove
`Δ''_E=Δ'_E+[iΘ(E),Λ]` and the integrated Bochner–Kodaira–Nakano identity
on compactly supported smooth forms. On `(n,k)` forms prove the curvature
lower bound: if `iΘ(E)≥aω⊗Id_E` in Nakano sense, then
`[iΘ(E),Λ]≥ka Id` for `k≥1`, with the corresponding pointwise bounds for
scalar weight curvature. Define Nakano positivity by its Hermitian form on
`T^(1,0)M⊗E`; prove the contraction/eigenvalue calculation in a unitary frame.
This local layer consumes K1/K2 type calculus, K4 Chern connections, and K5a's
local formal-adjoint comparison. It uses no compact Hodge theorem, analytic-set
triangulation or RealAnalyticGeometry R5. RealAnalyticGeometry R3 consumes these
identities and owns their complete-metric weighted domain and existence theory.

### K6.1. Compact Kähler Hodge theory and analytic cycles

On compact Kähler M prove the `∂∂̄` lemma, then prove Hodge decomposition `H^k_dR(M;ℂ)≃⊕_(p+q=k)H^(p,q)(M)`, Hodge
conjugation/symmetry, and compatibility with wedge/singular cup product and
integral/rational coefficient images. `del_delBar_lemma` states the `∂∂̄` lemma for a
d-exact complex-valued form of type `(p+1,q+1)`: it is `∂∂̄γ` for a form γ of type `(p,q)`
(Demailly, Chapter VI, (8.6)). `finrank_deRhamCohomology_eq_sum_dolbeault` states the
decomposition in its dimension form, `b_k=Σ_(p≤k) h^(p,k−p)` with the real Betti number of
the pinned `deRhamCohomology`, and `finrank_dolbeaultCohomology_symm` states Hodge symmetry
`h^(p,q)=h^(q,p)` (Demailly, Chapter VI, (8.5) and (8.12)); these three take the Kähler
hypothesis as `IsKahler κ (SmoothAlmostComplexStructure.ofComplexManifold E M)`.
Construct the corresponding pure real/rational Hodge
structures using the existing linear Hodge-structure library. Prove odd real Betti numbers
are even from Hodge symmetry and decomposition, including the degree-one obstruction
consumed by SymplecticGeometry; `even_finrank_deRhamCohomology_odd` states it on the real
carrier, for a boundaryless compact manifold with `IsKahler form J`. Prove Hard Lefschetz
`L^(n-k):H^k→H^(2n-k)` is an isomorphism for k≤n: with `lefschetzMap c k j`, the j-fold
wedge with a degree-two class c from `H^k_dR` to `H^(k+2j)_dR` built from the pinned
`deRhamCohomology.wedge`, `hard_lefschetz` states that `lefschetzMap [ω] k (n−k)` is
bijective on a boundaryless compact manifold of real dimension 2n with `IsKahler ω J`
(Demailly, Chapter VI, (8.17)). Prove primitive decomposition and Hodge–Riemann bilinear relations: for a
nonzero primitive `(p,q)` class α, `k=p+q≤n`, the real value
`i^(p−q)(−1)^(k(k−1)/2)∫α∧bar(α)∧ω^(n−k)/(n−k)!` is positive. Construct the associated
real polarization; obtain a rational polarization from this Lefschetz construction when
the Kähler class is rational.

**Checks.**

- Elliptic curve: `b₁=2=h^(1,0)+h^(0,1)=1+1` and `h^(0,0)=h^(1,1)=1`; on ℂP¹,
  `b₂=1=h^(2,0)+h^(1,1)+h^(0,2)=0+1+0` and `b₁=0`. A sum over `p+q=k` that omitted the
  mixed types would give `b₂=0` on ℂP¹.
- Hopf surface `S¹×S³`, compact complex but not Kähler: `b₁=1` is odd and
  `h^(1,0)=0≠1=h^(0,1)`, so neither the parity nor Hodge symmetry survives without the
  Kähler hypothesis. The closed annulus `{1≤|z|≤2}`, Kähler with boundary, has `b₁=1`, so the
  boundaryless hypothesis of the parity statement is needed.
- Kodaira–Thurston manifold: symplectic with a compatible almost complex structure and
  `b₁=3` odd, so the vanishing of the Nijenhuis tensor in the Kähler condition cannot be
  dropped.
- Lefschetz map: for `j=0` it is the identity; on ℂP² with `∫ω_FS²=1`, `L²:H⁰→H⁴` sends 1
  to `[ω_FS]²≠0`, a bijection of lines. On `S²×S²` with area classes `σ₁,σ₂`,
  `∫σ₁∧σ₂=1`, a Kähler class `aσ₁+bσ₂` (`a,b>0`) has square `2ab≠0`, so `L²:H⁰→H⁴` is
  bijective, while the class `σ₁` of a closed form pulled back from one factor, which is not
  a Kähler form, has square 0 and `L²` is zero.
- `∂∂̄` lemma: the Kähler form of an elliptic curve is a closed `(1,1)`-form with positive
  integral, hence neither d-exact nor `∂∂̄` of a function; a version without the exactness
  hypothesis would claim it is.

Prove `[ω^k]≠0` for 0≤k≤n on nonempty compact Kähler manifolds, and that a nonzero
holomorphic k-form is d-closed and has nonzero de Rham class. For a nonempty compact pure
k-dimensional analytic subvariety V, construct integration over V_reg as a de Rham
functional, not an unspecified singular fundamental class. Define this integral using
K5a's L¹ extension on the complex-oriented smooth manifold V_reg with its induced
metric obtained from DG12.1's pullback along the regular-locus immersion on
K1/K3's actual holomorphic-submanifold carrier and its realification. K6.1
constructs and installs as local instances the `RiemannianBundle`,
`IsContinuousRiemannianBundle` and `IsContMDiffRiemannianBundle` structures
for that metric, preserving the given topology. Derive local compactness
and σ-compactness from the finite-dimensional second-countable manifold
structure before applying `riemannianVolume`. For each metric separately,
write the pulled-back top form as `f dvol_g` and integrate the L¹ function f
against the native Riemannian volume. Own Lelong local finite-mass estimates, and
deduce integrability from those estimates and boundedness of the ambient smooth
form on compact M. Prove agreement with DG5's `integralTopForm` when the pullback
has compact support, independence of the induced metric, Wirtinger's calibrated
volume equality and Stokes for analytic sets. Own the analytic cutoff lemma:
for a compactly supported smooth (2k−1)-form β on M, construct smooth ambient
cutoffs χ_j vanishing near S, tending to one on V_reg, with
`∫_(V_reg) |dχ_j∧ι*β| → 0` and convergence of the integrals of
`χ_j ι*(dβ)` to the L¹ integral of `ι*(dβ)`. Derive these bounds from the
analytic local parametrizations, their finite-sheet mass estimates and
the lower-dimensional singular-set covering estimates, proving the required
covering and gradient bounds; dimension drop alone is not an integral estimate.
Combine smooth compact-support Stokes with this cutoff lemma to obtain
`∫_(V_reg)dβ=0`, using singular-locus cutoffs and finite-mass boundary control. Prove
positivity `∫_(V_reg)ω^k/k!>0`, hence the nonzero functional `[α]↦∫_(V_reg)α` on
`H^(2k)_dR(M;ℝ)`. This avoids presupposing a triangulation/fundamental class of a singular
space. Via the real de Rham comparison and the perfect evaluation pairing for compact
ambient manifolds, identify this functional with a nonzero ambient class in `H_(2k)(M;ℝ)`;
construct that comparison from AlgebraicTopology's universal-coefficient and
finite-dimensionality APIs. This supplies the real homology class by ambient perfect duality;
an integral singular cycle on V is not presupposed by this analytic construction.
Also construct the integral fundamental class rather than stopping at that
real class. For compact pure-dimensional analytic V, define `[V]` as the
unique class in `H_(2k)(V;ℤ)` whose local images at regular points are K1's
complex-orientation generators. Prove existence and uniqueness by the
following construction, including reducible V with coefficient one on every
regular component. For smooth V this definition agrees with AT6.3's integral
fundamental class (Tau Ceti's `HomologicalOrientation.fundamentalClass`).
Apply K6.1.RelativeIntegration (iii) below, the integration comparison
`∫_N η=⟨deRhamHom[η],[N]_ℝ⟩` for compact oriented boundaryless N, to N=V and
η=ι*α, with the naturality of DG8.4's `deRhamHom`, to identify its real
pushforward with the analytic integration class.

For singular V, consume K3's finite regular-piece partition and construct the
subcomplex comparison for a triangulation of the compact ambient M with V and
S=V_sing as subcomplexes.
Use K3.0's real `IsManifold` at order ω and its real-analytic defining
equations. Derive `dim_ℝ S≤2k−2` from K3's complex dimension drop and the
realified analytic-submanifold dimensions. Consume
[RealAnalyticGeometry R0–R5](../RealAnalyticGeometry/README.md), including
real semianalytic normal decomposition, the affine Łojasiewicz theorem,
real-analytic embedding and transport, for the manifold-level semianalytic
triangulation theorem of Łojasiewicz (§3, Theorem 2, p. 464).
This theorem applies to second-countable real-analytic manifolds and locally
finite semianalytic families. Prove that M, V, S and the chosen strata meet
these hypotheses using K3.0's real-analytic chart equations; compactness
reduces the locally finite triangulation to a finite complex. Require the
realization map on each open simplex to be an analytic isomorphism onto
its analytic-submanifold image inside a single stratum. Its differential is
injective, so simplex dimension is at most the stratum's dimension. Derive
that V has no simplices above dimension 2k and S none above dimension 2k−2.
Use GT Layer11's carrier `|K|` and a homeomorphism `|K|≃ₜ M`, with the two
subcomplex images exactly V and S. Semialgebraic triangulation alone does not
supply this theorem. Transport the native CW structures using GT Layer11
and AT4.7's `simplicialRealizationCW`; AT Stage4's cellular/singular comparison
then gives homology vanishing for S in degrees 2k and 2k−1. Prove that
the oriented top simplices define the relative class in
`H_(2k)(V,S;ℤ)`. Prove that each (2k−1)-simplex outside S has exactly two
top-dimensional cofaces, by the local homology of the smooth 2k-manifold
V_reg and the simplicial star/link description. Own the comparison
`H_j(|L|,|L|∖{x};ℤ) ≃ H̃_(j−d−1)(Lk_L τ;ℤ)` for x in the interior
of a d-simplex τ, using GT Layer11's star/link API, excision and the suspension
homology comparison, including the empty-link/augmented degree convention.
In codimension one the link is a finite set of c points, whose reduced H₀ is
`ℤ^(c−1)`; the local orientation group is ℤ, forcing c=2.
The complex orientations
induce opposite face orientations, so their contributions cancel. The long exact
sequence identifies this with `H_(2k)(V;ℤ)`. Its local orientation images
establish the characterization above and independence of the triangulation.
For k=0, S is empty and `[V]` is the sum of the positively oriented points.

Own the integration comparison for this class through forms supported away
from S; do not integrate a smooth form over nonsmooth triangulation simplices.
Construct an open neighborhood N of S in M which deformation retracts onto
S, using AT Stage4's `cwSubcomplexNeighborhoods` and transport through the
ambient triangulation. For k>0, cellular dimension
vanishing, AT's real universal-coefficient comparison and DG8's de Rham
isomorphism give `H^(2k)_dR(N)=0`. Thus every closed smooth 2k-form α on M
restricts to `dβ` on N. Choose a smooth χ with `tsupport χ⊆N` and equal to
one on an open neighborhood U of S, using DG's bump functions and partitions
of unity. Extend χβ by
zero and set `α′=α−d(χβ)`. Prove α′ is smooth, closed, cohomologous to α
and zero on U. Analytic-set Stokes gives
`∫_(V_reg)α′=∫_(V_reg)α`; the ambient homology pairing is unchanged too.
K6.1.RelativeIntegration (ii) sends the relative cocycle `(α′,0)` of the
open pair (M,U) to `[α′]_rel∈H^(2k)(M,U;ℝ)`, whose absolute image is
`deRhamHom[α′]`. Evaluate this relative class on
the image of `[V]` under the continuous map of pairs
`(V,V∩U)→(M,U)`. Excise the closed singular locus, which is contained in
the interior of V∩U, to obtain
`H_(2k)(V_reg,V_reg∩U;ℤ)≃H_(2k)(V,V∩U;ℤ)`.
The remaining inclusion `(V_reg,V_reg∩U)→(M,U)` is a smooth map of open
pairs, so the naturality of K6.1.RelativeIntegration (ii) under smooth maps
of open pairs compares evaluation with the pulled-back form.
Let C be the closed support of that top form on V_reg; prove C is compact,
and `V_reg∩U⊆V_reg∖C`. Under enlargement of the relative subset to
V_reg∖C, the class coming from `[V]` is AT6.3's compact-set orientation
class (Tau Ceti's `fundamentalClassOn`). Prove this by its local orientation images and excision naturality.
Prove the analytic integral of a form whose pullback has compact support
equals DG5's `integralTopForm` on the oriented smooth manifold V_reg.
Apply K6.1.RelativeIntegration (iii)'s compact-support formula on N=V_reg
with K=C and its independence of K, and (i)'s relative smooth/continuous
chain comparison with its naturality under enlargement of the relative
subset.
This yields `∫_(V_reg)α=⟨deRhamHom[α],ι_*[V]_ℝ⟩` without a smoothness
assumption on the analytic triangulation. Positivity proves the integral
ambient class is nonzero. Extend to effective analytic cycles by summing
their irreducible component classes with the specified positive integer
multiplicities, and prove additivity of the integration comparison.

**K6.1.RelativeIntegration — open pairs and fundamental classes.** Own the
relative integration theory that the analytic-cycle comparison uses, on top of
DifferentialGeometry 8.3–8.5's absolute smoothing, chain integration and de Rham
theorem, which do not treat pairs. Let M be a Hausdorff σ-compact
finite-dimensional boundaryless manifold and U⊆M open; the cases used above are
the compact ambient M and the regular locus V_reg. K6.1.RelativeIntegration
owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality
§§2.4, 3.1–3.3 and 4.1, which extend them to models with corners, consume
these instances. Statements (i) and (iii) are this roadmap's own relative forms of
DG8.3's smoothing and DG8.5's de Rham comparison, proved by the routes given; (ii) is
the open-pair case of Bott–Tu's relative de Rham complex.

- (i) Relative smooth chains: the quotient of Tau Ceti's smooth singular chains
  of M (`smoothSingularSubcomplex`) by the image of those of U under
  `smoothSingularSubcomplexMap` of the inclusion, with its map to relative
  singular chains. Prove that map a quasi-isomorphism by the five lemma from
  DG8.3's absolute smoothing equivalences for M and for U, natural in smooth
  maps of open pairs and under enlargement of U.
- (ii) The relative de Rham complex: degree-q term `Ω^q(M)⊕Ω^(q−1)(U)` with
  differential `(α,β)↦(dα,α|_U−dβ)` (Bott and Tu, *Differential Forms in Algebraic
  Topology*, §6, relative de Rham theory, p. 78). Relative integration takes values in the
  mapping cone of the restriction `C^•_sm(M;ℝ)→C^•_sm(U;ℝ)` of real cochains on smooth singular chains:
  degree-q term `C^q_sm(M)⊕C^(q−1)_sm(U)`, differential `(a,b)↦(δa,a|_U−δb)` with
  `(δa)(c)=a(∂c)`. Relative integration is `(α,β)↦(∫α,∫β)`, where `(∫α)(σ)=∫_σα`
  through Tau Ceti's `SmoothSimplex.integral`. Prove it is a cochain map by DG8.4's
  Stokes for chains, `∫dα=δ∫α` and `∫(α|_U−dβ)=(∫α)|_U−δ∫β`, natural under smooth
  maps of open pairs (`integral_smoothSingularSubcomplexMap_app`). Restriction of
  cochains is degreewise surjective (extend by zero on simplices not contained in U),
  so `a↦(a,0)` from the relative cochains, the cochains vanishing on the image of the
  chains of U and hence the dual of the quotient in (i), into the cone is a
  quasi-isomorphism, by the five lemma on the two long exact sequences. On a relative
  cycle c, a chain of M whose boundary is a chain of U, the induced pairing of cone
  cohomology is `(a,b)↦a(c)−b(∂c)`. A closed α vanishing on U gives the relative
  cocycle `(α,0)`, whose image `(∫α,0)` is the image of the relative cocycle `∫α`; its
  class `[α]_rel∈H^q(M,U;ℝ)` has absolute image DG8.4's `deRhamHom[α]`.
- (iii) The integration comparison: for compact oriented N of dimension n and a
  smooth top form η, `∫_Nη=⟨deRhamHom[η],[N]_ℝ⟩`, with `[N]_ℝ` Tau Ceti's
  `realFundamentalClass` of AT6.3's homological orientation of N; for oriented
  N, compact K⊆N and η vanishing outside K, `∫_Nη=⟨[η]_rel,[N]_K⟩` for the
  relative cocycle `(η,0)` of `(N,N∖K)` and the real image `[N]_K` of
  `fundamentalClassOn` for K, independent of K through the map of pairs
  `(N,N∖K′)→(N,N∖K)` for K⊆K′. Route: subdivide a representative of `[N]_K`
  until each simplex meeting K lies in one oriented chart, compute there by the
  one-chart integral, and sum by the finite additivity of DG5's
  `integralTopForm`.

*Needs:* DG5's `integralTopForm`, DG8.3's smoothing and DG8.4's Stokes and
`deRhamHom`; Tau Ceti's smooth singular simplices and their integral, its
relative singular chains and its fundamental classes; AT6.3's homological
orientation of an oriented smooth manifold.

**Checks.**

- Sign of (ii): on `(ℝ,ℝ∖{0})` let ψ be supported in `(−1,1)` with `∫ψ=1`, Ψ
  its primitive vanishing far left, and `β=Ψ|_U`, which is 0 left of the
  support and 1 right of it. Then `(ψdx,β)=d(Ψ,0)`, and the cone pairing of its image
  `(∫ψdx,∫β)` with the relative cycle given by the path from −1 to 1 is `1−(1−0)=0`;
  evaluating by `∫_cα+∫_(∂c)β` would give 2 on this coboundary.
- Cone, not quotient: on `(ℝ,ℝ∖{0})`, `(dx,0)` is not a cocycle (`d(dx,0)=(0,dx|_U)`),
  and its image `(∫dx,0)` takes the value 1 on the 1-simplex `[1,2]⊂U`, which is zero in
  the quotient of (i). A formula `c↦∫_cα−∫_(∂c)β` on that quotient would have to vanish
  there, and on the simplex `[0,1]` it would need `β(0)` with `0∉U`; the cone cochain has
  neither requirement. For the consumers' cocycle `(α′,0)` with `α′|_U=0`, the image
  `(∫α′,0)` is the image of the relative cochain `∫α′`.
- Compact support in (iii): on `N=ℝ` with `K=[−1,1]` and `η=ψdx`, `[N]_K` is
  the class of the smooth path from −2 to 2, whose boundary lies in `N∖K`, and
  the pairing is `∫_(−2)^2ψ=1`; enlarging K to `[−3,3]` (the path from −4 to 4)
  gives 1 again. The absolute class `deRhamHom[η]` is 0 since `H¹_dR(ℝ)=0`, so
  only the relative formula sees η.
- Compact case of (iii): on the counterclockwise circle `∫dθ=2π=⟨deRhamHom[dθ],[S¹]_ℝ⟩`;
  reversing the orientation negates both sides.
- Degenerate pairs: `U=∅` gives the absolute complex and DG8.5's comparison;
  `U=M` gives an acyclic relative complex and zero relative homology.

## K7. Projective, torus, and Hopf examples

**K7.1. Projective charts and orientation.** Use the single carrier
`Projectivization ℂ (Fin (n+1) → ℂ)` with Mathlib's quotient topology from the nonzero
vectors, `Projectivization.instTopologicalSpace`, and its open quotient map
`isOpenQuotientMap_mk'` (`Mathlib.Topology.Algebra.Projectivization`, the interface that
AlgebraicTopology Stage 4.6 names), and Tau Ceti's instances
(`TauCeti.Topology.Algebra.Projectivization`)
`instT2Space` (continuous linear forms separate the points of the vector space),
`instCompactSpace` (finite-dimensional normed spaces over ℝ or ℂ, by the continuous surjection
from the unit sphere), `instSecondCountableTopology` and `instPathConnectedSpace` (every nonzero
normed space, so every n≥0, ℂP⁰ being a point). Consume ComplexManifolds Milestones 1–3's
complex-manifold, real-restriction and atlas-transport interfaces,
K3.0's finite-dimensional holomorphic calculus and
K1's complex orientation. This construction precedes associated bundles
and uses neither SmoothBundlesConnections B2 nor K5.

The affine atlas is pinned as well (`TauCeti.Geometry.Manifold.Instances.Projectivization`):
the chart on `U_i={ [v] : v_i≠0 }` is `Projectivization.affineChart i`, the ratios
`(v_(i.succAbove j)/v_i)_(j : Fin n)` with inverse `z ↦ [Fin.insertNth i 1 z]`, packaged as the
open partial homeomorphism `affineOpenPartialHomeomorph i` (`isOpen_affineOpen` for openness,
`mk_eq_mk_iff` for representative independence); `instChartedSpace` is the atlas of these
`n+1` charts with model `Fin n → ℂ` and `𝓘(ℂ, Fin n → ℂ)`, the transition maps are `C^r` for
every `r` including ω (`contDiffOn_affineChart_symm_trans`), so `instIsManifold r` holds for
every `r`, and the charts and their inverses are `C^r` (`contMDiffOn_affineChart`,
`contMDiff_affineChart_symm`). K7.1 adopts these coordinate conventions, `Fin.succAbove i` for
the enumeration and `Fin.insertNth i 1 z` for the inverse insertion, in every formula below.
Mathlib and Tau Ceti each declare `Projectivization.instTopologicalSpace`, so a file importing
all of Mathlib cannot import this Tau Ceti module until one copy is removed; the Lean
acceptance tests of K7 therefore use the second pinned model below. Give the complex-linear
comparison to `EuclideanSpace ℂ (Fin n)` and its real scalar restriction. These affine charts
construct the projective manifold directly; the discrete quotient theorem in ComplexManifolds
is not used for the ℂ× action.

Tau Ceti pins a second model of ℂPⁿ that imports together with Mathlib:
`TauCeti.ComplexProjectiveSpace n`, the quotient of the unit sphere of
`EuclideanSpace ℂ (Fin (n+1))` by the unit complex scalars
(`TauCeti.Topology.ComplexProjectiveSpace.Basic`, with `instCompactSpace`, `instT2Space`,
`instPathConnectedSpace` and `mk_eq_mk_iff`: two unit vectors give the same point exactly when
they differ by a unit scalar). Its charts `affineChart k` read the homogeneous ratios
`ratio k (k.succAbove j)` on `affineOpen k={v_k≠0}`, with inverse `affineParam k` inserting the
coordinate one (`TauCeti.Topology.ComplexProjectiveSpace.Charts`); they form `instChartedSpace`
with model `Fin n → ℂ`, and `instIsManifold r` holds for every `r` including ω
(`TauCeti.Geometry.Manifold.Instances.ComplexProjectiveSpace`). These are the coordinate
conventions above. Own the comparison of the two models, which neither pin has: through the
identification of `Fin (n+1) → ℂ` with `EuclideanSpace ℂ (Fin (n+1))`, the map
`[v]↦[v/‖v‖]` from `Projectivization ℂ (Fin (n+1) → ℂ)` to `TauCeti.ComplexProjectiveSpace n`
is well defined (two representatives of a line normalize to unit vectors differing by a unit
scalar), a homeomorphism whose inverse is induced by the inclusion of the sphere into the
nonzero vectors, and a biholomorphism: it carries `U_i` onto `affineOpen i` and is the identity
in the charts `Projectivization.affineChart i` and `affineChart i`, both of which read
`v_(i.succAbove j)/v_i`. Transport every K7 theorem through it in both directions; the Lean
statements of K7.2 are on the sphere-quotient model.

Prove the underlying real smooth atlas and its
complex orientation agree with K1. Upgrade the existing equivalence
`OnePoint.equivProjectivization ℂ` to a homeomorphism and a biholomorphism
for ComplexManifolds' OnePoint atlas, using its formulas `t ↦ [t:1]`, `∞ ↦ [1:0]`
and the complex-linear identification `Fin 1 → ℂ ≃ ℂ`. Supply chart,
inclusion, coordinate-permutation and linear-action naturality APIs.
The n=1 member of this projective family has its own native carrier;
the biholomorphism identifies its atlas with ComplexManifolds' `OnePoint ℂ` atlas.
The single-carrier convention in ComplexManifolds governs its Riemann-sphere construction
on `OnePoint ℂ`; K7.1 owns the general-n projective family, including n=1.
Projective-family consumers use the `Projectivization` carrier; Riemann-sphere
consumers use `OnePoint ℂ` and this biholomorphism. Use that comparison for
every ℂP¹ example and transport theorem.

**Checks.**

- The model comparison `[v]↦[v/‖v‖]`: `v=(3,4)` and `2iv=(6i,8i)` go to `(3/5,4/5)` and
  `i(3/5,4/5)`, which differ by the unit scalar i and give one point, with chart value
  `4/3` in the chart `v₀≠0` of both models.
- It is holomorphic, not antiholomorphic: `v=(1,i)` has chart value i in both models,
  while the equally well defined map `[v]↦[v̄/‖v‖]` gives `−i`, so the chart identity
  excludes it.
- n=0: both models are one point; for n=1, `v=(0,1)` lies only in the chart `v₁≠0`,
  with value 0 in both models.

**K7.2. Projective bundles, forms and cohomology.** Construct tautological O(−1),
dual powers O(k), Hermitian metrics and normalized Fubini–Study form. Prove
the holomorphic tensor and dual laws `O(a)⊗O(b)≃O(a+b)` and
`O(k)*≃O(−k)` for all integers a,b,k by their transition maps. Prove global
well-definedness, positivity, closedness, Chern-curvature formula and the hyperplane
identity `∫_(ℂPⁿ)ω_FS∧β=∫_H β` for every closed degree-(2n−2) form β, in the real de Rham
carrier. Prove `∫_(ℂPⁿ)ω_FS^n=1` with complex orientation. Identify `H⁰(O(k))` with
homogeneous degree-k polynomials for k≥0 by the local transition/Hartogs argument, and
prove dimension `binomial(n+k,n)`. For ℂP¹ prove H⁰(O(k))=0 for k<0
directly from its two projective charts and the Laurent/Cauchy growth estimates.
Construct the holomorphic isomorphism `K_(ℂP¹)≃O(−2)` from
`dz=−w⁻²dw`, keeping the transition-frame convention. With K5b's Serre
duality deduce H¹(O(−1))=0 and `h⁰(O(−1))−h¹(O(−1))=0`, independently of
Riemann–Roch or classification of Pic(ℂP¹) by degree.
**Fubini–Study form and projective unitary symmetry.** On K7.1's projective
carrier, construct the action induced by each complex-linear unitary map of
ℂ^(n+1), compare it with the general linear projective action, and prove the
composition, identity, inverse and chart-transport laws. Use
`Projectivization.map` and the existing native unitary/linear-isometry APIs,
transporting through K7.1's linear identification with `EuclideanSpace ℂ (Fin
(n+1))`; do not introduce a second projective carrier.

Fix the normalization
`ω_FS=(i/(2π))∂∂bar log ||z||²` for a local nonzero holomorphic lift z. In
the chart z=(1,w), set r=1+Σ_i|w_i|² and prove
`ω_FS=(i/(2π))Σ_ij(δij/r−bar(w_i)w_j/r²)dw_i∧dbar(w_j)`.
Keep this coefficient order tied to the displayed wedge order. With the
conjugate-linear-first Hermitian convention and `h=g+iω`, the corresponding
Hermitian matrix is
`h(e_i,e_j)=(δij/r−w_i bar(w_j)/r²)/π`. Prove both formulas and their
compatibility with the real fundamental form, not just an unindexed Hessian
identity. The homogeneous tangent formula, for z≠0, is
`H_z(v,w)=(||z||²⟨v,w⟩−⟨v,z⟩⟨z,w⟩)/(π||z||⁴)`.
Prove it is Hermitian, has kernel ℂz, is positive on the quotient, is
unchanged by adding multiples of z to tangent representatives, and satisfies
`H_(cz)(cv,cw)=H_z(v,w)` for c≠0. Identify it with the chart Hermitian
form using the derivative of the projectivization map. These lift and
quotient identities supply the representative-independent tangent metric.

Prove `H_(Uz)(Uv,Uw)=H_z(v,w)` and hence the induced projective action
satisfies `U*ω_FS=ω_FS`. Scalar unitary maps act trivially; prove they are
exactly the kernel of this action and construct its descent to
`PU(n+1)=U(n+1)/{λI:|λ|=1}` using native quotient-group vocabulary. Prove
transitivity by extending normalized representatives to orthonormal bases.
Identify the stabilizer of the standard line in U(n+1) with U(1)×U(n),
and its descended stabilizer with `(U(1)×U(n))/U(1)_diag ≃ U(n)`; state
these as explicit subgroup/action comparisons with their maps. This makes
checking positivity at one point valid (Ballmann, §4, Example 5, (4.12)–(4.14),
pp. 43–44, for the unitary invariance of `i∂∂̄ ln‖z‖²` and the reduction of positivity to
one point by transitivity; Demailly, Chapter VI, (4.4), p. 297, for the normalization
`(i/(2π))∂∂̄ log` and `∫_(ℂPⁿ)ω^n=1`). Include n=0: CP⁰ is a point, its
tangent space and FS form are zero, positivity is vacuous, the full U(1)
action is the scalar kernel and PU(1) is trivial. Retain K7.2's integral
normalization `∫_(CP¹)ω_FS=1` and `∫_(CPⁿ)ω_FS^n=1`.

Prove the contrasting CP¹ calculation for the projective linear map induced
by diag(1,2): in the chart w↦2w, its pullback at 0 is `4ω_FS(0)`, and
`ω_FS(0)≠0`. Thus projective unitary invariance does not assert invariance
under all projective linear automorphisms.

*Needs:* K7.1's projective charts and linear-action naturality, K4's
Hermitian convention, the local differential/type calculus and native
finite-dimensional complex inner-product/orthonormal-basis theory. This is
a finite projective metric/action bridge inside K7.2, independent of later
Hodge or projective cohomology calculations.

**Checks.**

- At the standard line `z=(1,0)` of ℂP¹ with tangent representative
  `v=w=(0,1)`, `H_z(v,v)=1/π`, agreeing with the chart value
  `h(e₁,e₁)=(1/r)/π` at `w=0`, `r=1`. At `w=(1,i)/√2` in ℂP², `r=2` and
  `h(e₁,e₂)=i/(8π)`; the transposed mixed coefficient `bar(w_i)w_j` would
  give `−i/(8π)`.
- Radial directions are in the kernel: `H_z(z,w)=0=H_z(v,z)`; and
  `H_(cz)(cv,cw)=H_z(v,w)` for `c=2` because numerator and denominator both
  scale by `|c|⁴=16`.
- The projective map induced by `diag(1,2)` doubles the tangent representative
  at the standard line: `H_z(2v,2v)=4/π≠1/π`, so it does not preserve `ω_FS`,
  while every unitary `U` gives `H_(Uz)(Uv,Uw)=H_z(v,w)` exactly.
- `n=0`: the tangent space of ℂP⁰ is zero, `H` is the zero form and `PU(1)` is
  trivial; `∫_(ℂP¹)ω_FS=1` in the chart is `∫_ℂ (1/π)(1+|w|²)^(−2) dλ=1`.

Compute the projective Dolbeault/Hodge groups and cup ring. The CW
structure and the additive groups are pinned on the sphere-quotient model of
K7.1: `TauCeti.ComplexProjectiveSpace.cwComplex`
(`TauCeti.Topology.CWComplex.Classical.ComplexProjective`) is Mathlib's
`CWComplex` structure with one cell in each even dimension 0,2,…,2n and none
in odd dimensions (`nat_card_cell_cwComplex`), whose characteristic map
`cellMap` sends the closed disk of `ℂⁱ` to the classes of
`(v,√(1−‖v‖²),0,…,0)` and whose skeleta are the linear ℂPⁱ; its cellular
homology gives `H₂ᵢ(ℂPⁿ;R)≅R` for i≤n (`singularHomologyIso`) and zero in odd
degrees and above 2n (`isZero_singularHomology_of_odd`,
`isZero_singularHomology_of_lt`, `TauCeti.AlgebraicTopology.Cellular.ComplexProjective`),
with Euler characteristic n+1 (`eulerChar_complexProjectiveSpace`). Transport
them to the `Projectivization` carrier through K7.1's comparison. The cup
calculation consumes Stage 6, without its Stage 7 Euler-characteristic
theorem. Own the cup calculation `H*(ℂPⁿ;ℤ)=ℤ[u]/(u^(n+1))`, |u|=2, with Tau
Ceti's integral cup product `TopCat.integralCup` and AlgebraicTopology's
products, with u the hyperplane class normalized by `⟨u,[ℂP¹]⟩=+1`
(Demailly, Chapter V, (15.10)). `integralCohomology_complexProjectiveSpace`
states the ring on the sphere-quotient model through the cup powers
`integralCupPow`: some `u∈H²(ℂPⁿ;ℤ)` has powers `u^k` generating
`H^(2k)(ℂPⁿ;ℤ)` freely for k≤n, and the groups in odd degrees and in degrees
above 2n vanish; the normalization fixes the sign of u. On the same model,
`finrank_dolbeaultCohomology_complexProjectiveSpace` states `h^(p,q)(ℂPⁿ)=1`
for p=q≤n and `h^(p,q)(ℂPⁿ)=0` otherwise (Demailly, Chapter VI, (8.8)), and
`finrank_deRhamCohomology_complexProjectiveSpace` states `b_k(ℂPⁿ)=1` for even
k≤2n and `b_k(ℂPⁿ)=0` otherwise (Demailly, Chapter V, (15.10), with DG8.5's de
Rham theorem); both hold for every n, p, q and k. Compare its real de Rham image with
`[ω_FS]` and SBC B6.2's `c₁(P)` for the Hopf circle bundle P,
whose dual-character associated line is O(1),
using SBC B6.3's Chern–Weil comparison. This c₁ is the independently
constructed circle-bundle class; it does not consume CharacteristicClasses'
later universal class construction.
Use Stage 6 Poincaré duality and restrictions to ℂP^k to identify the
powers of u and the cup multiplication, beyond the additive cellular groups.
CharacteristicClasses C1.5 consumes these finite carrier inclusions, cup
rings and restriction-normalized u classes for its finite-to-infinite
comparison; AT 8.12 consumes that later comparison.
Prove nonempty closed complex submanifolds of projective space are compact Kähler and `h^(k,k)≥1` for
0≤k≤dim from nonzero Kähler powers. These are the geometric inputs to
GeometricQuantization, whose scaled symplectic forms use k≥1.

**Checks.**

- `n=0`: ℂP⁰ is a point, `h^(0,0)=b₀=1`, every other Hodge and Betti number is
  zero, `H²(ℂP⁰;ℤ)=0` forces `u=0`, and `u⁰=1` generates `H⁰=ℤ`.
- `n=1`: `h^(1,1)=1`, `h^(1,0)=h^(0,1)=0`, `b₂=1`, `b₁=0`; `p=q=2>n` gives
  `h^(2,2)(ℂP¹)=0`, which a statement without `p≤n` would get wrong (it would
  give 1), as there are no nonzero 4-forms on a real surface.
- `n=2`: the wedge `S²∨S⁴` has the same integral cohomology groups as ℂP² but
  `u²=0`, so the condition that `u²` generate `H⁴` separates ℂP² from it; a
  class `u` equal to twice a generator of `H²` fails already at k=1.
- Agreement with K6.1: ℂPⁿ is compact Kähler, and `∑_(p≤k) h^(p,k−p)` is 1 for
  even k≤2n (the single term p=k/2) and 0 otherwise, which is `b_k`, as the
  Hodge decomposition `finrank_deRhamCohomology_eq_sum_dolbeault` requires;
  Hodge symmetry and the dual Hodge-diamond symmetry `h^(p,q)=h^(n−p,n−q)` hold
  for the diagonal diamond.
- The Euler characteristic `∑(−1)^k b_k=n+1` agrees with the pinned
  `eulerChar_complexProjectiveSpace`.

**K7.2.TautologicalIncidence — blowdown and homogeneous functions.** For a
nonzero finite-dimensional complex vector space V of dimension d, use the
same projectivization P(V) of lines and the tautological line O(−1).
Identify its holomorphic total space with
`E={(v,ℓ)∈V×P(V):v∈ℓ}` by actual bundle maps and their inverses.
For an ordered basis e₁,…,e_d, the chart ℓ_i≠0 has coordinates
`(a,(z_j)_(j≠i))↦(a(e_i+Σ_(j≠i)z_j e_j),[e_i+Σ_(j≠i)z_j e_j])`.
On its overlap with chart k prove `a'=a z_k`, `z'_i=1/z_k` and
`z'_j=z_j/z_k` for j≠i,k. Construct both projections in these charts,
the zero section and the map b:E→V, (v,ℓ)↦v. Off that section construct
the holomorphic inverse v↦(v,[v]); identify b⁻¹(0) with P(V).

Consume [StableReduction Layer4](../StableReduction/README.md#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces)'s
Rees blowup of the origin ideal in affine V. Compare, on ℂ-points, its affine
charts `v_j=v_i z_j`, their inverses, transitions and blowdown with the
preceding incidence charts, and identify the incidence projection E→P(V)
as the total space of O(−1). This is the application-specific comparison of
chart data with the existing algebraic blowup, not a second blowup
construction. At d=1, P(V) is a point and b is
the identity on V under the total-line identification.

Construct the algebra isomorphism `b*:O_hol(V)≃O_hol(E)` on entire
holomorphic functions. For d≥2 descend a function off the zero section
through the displayed inverse, extend it across 0 by K3's Hartogs theorem,
and prove its pullback equals the original function by density and
continuity. For d=1 use the identity blowdown. Compare restriction to the
compact zero section, where the function is constant, with evaluation of
the descended function at 0. These algebras contain all entire functions;
only their homogeneous pieces below are asserted polynomial.

Let A_t(v,ℓ)=(tv,ℓ) for t∈ℂ×. For each integer k define the homogeneity
condition `F(A_t x)=t^k F(x)`. Use the Taylor expansion of the descended
entire function at 0 to prove that this space is the homogeneous degree-k
polynomial space for k≥0 and is zero for k<0. With the ordinary function
action `(t·F)(x)=F(A_(t⁻¹)x)`, these functions have character t↦t^(−k).
Thus the source's degree-k scaling convention is distinguished from the
weight of inverse pullback. For k≥0, evaluation on each fibre gives the
natural isomorphism with `H⁰(P(V),O(k))`: a section s defines
`F_s(v,ℓ)=s(ℓ)(v^⊗k)`, with the constant interpretation at k=0.
Construct the inverse using the degree-k coefficient on each fibre and
prove holomorphicity through the chart transitions. Compare with K7.2's
existing homogeneous-polynomial section map, tensor multiplication,
linear changes of V and the contragredient GL(V) action. At k=1 recover
`H⁰(P(V),O(1))≃V*`. For d≥2 also prove H⁰(O(k))=0 when k<0 by restriction
to projective lines and the existing P¹ calculation. At d=1 every O(k)
on the point has a one-dimensional section space, even for k<0; do not
identify those negative-k sections with holomorphic functions of negative
homogeneity on E. This supplies the incidence/function comparison of
[Knutson, *Representations of U(n): the Borel–Weil theorem*, §1, p. 1](https://pi.math.cornell.edu/~allenk/courses/16spring/BorelWeil.pdf)
with all scaling signs fixed.

*Needs:* K7.1's projective charts; K7.2's O(−1), O(k) and monomial section
map; K3's Hartogs extension across a point (`hartogs_extension_across_point`);
K1's holomorphic inverse-function theorem; StableReduction Layer 4's Rees
blowup charts.

**Checks.**

- `d=1`: P(V) is a point, `E=V`, `b` is the identity, every O(k) has a
  one-dimensional section space including `k<0`, while the degree-`k`
  homogeneous functions on `E` vanish for `k<0`; the fibre-evaluation
  isomorphism is asserted only for `k≥0`.
- `d=2`, `k=1`: `F(v,ℓ)=φ(v)` for `φ∈V*`, and
  `(t·F)(v,ℓ)=φ(t⁻¹v)=t⁻¹φ(v)`, character `t↦t^(−1)`; a convention taking
  `F(A_t x)=t^(−k)F(x)` would make the `k=1` space zero (an entire F with
  `F(tv)=t⁻¹F(v)` has `F(v)=tF(tv)→0·F(0)=0` as `t→0`) and put `V*` at `k=−1`.
- `k=0`: a homogeneous entire function is constant on each punctured line,
  hence constant by continuity at 0, matching `H⁰(P(V),O)=ℂ`.
- The algebra is not polynomial: `(v,ℓ)↦exp(v₁)` is entire on `E` for `d≥2`
  and satisfies no homogeneity condition, since `exp(tv₁)≠t^k exp(v₁)`.

**K7.2.RationalQuartic — a section that does not extend.** On K7.1's single
projective carriers construct the holomorphic map
`q:ℂP¹→ℂP³`, `[s:t]↦[s⁴:s³t:st³:t⁴]`. Prove representative independence
from the common degree four and nonvanishing from `s≠0` or `t≠0`. Its two
source charts map to the ambient charts `x₀≠0` and `x₃≠0`, respectively,
by `z=t/s↦(z,z³,z⁴)` and `u=s/t↦(u⁴,u³,u)`. Supply the inverse coordinates
`x₁/x₀` and `x₂/x₃`, the overlap law `u=1/z`, and the graph equations in
these charts. Prove injectivity and the holomorphic immersion and inverse
onto the image. Compactness of ℂP¹ and the Hausdorff property of ℂP³ give
the topological embedding and closed image `M`; the graph charts make M a
smooth closed complex submanifold. Identify M biholomorphically with ℂP¹.

Construct the actual pullback isomorphism `q*O_(ℂP³)(1)≃O_(ℂP¹)(4)`
by the homogeneous frames, and compare its transitions and section pullback
with K7.2's monomial identifications. Under the ordered bases
`x₀,x₁,x₂,x₃` and `s⁴,s³t,s²t²,st³,t⁴`, prove that the actual restriction
`H⁰(ℂP³,O(1))→H⁰(M,O(1)|_M)` is `(a,b,c,d)↦(a,b,0,c,d)`.
Its image has dimension four inside a five-dimensional target, with image
exactly the vectors whose middle coefficient is zero; the section `s²t²`
does not extend. In these coordinates the restriction has the left inverse
`(b₀,b₁,b₂,b₃,b₄)↦(b₀,b₁,b₃,b₄)`, so it is injective, and its image is
exactly `{b₂=0}`.

Compute the actual higher-twist restriction maps by multiplying the same
four degree-four sections. For n=2 the attainable exponents of t are all
0,…,8, from the pairs `(0,0),(0,1),(1,1),(0,3),(0,4),(1,4),(3,3),(3,4),(4,4)`
of exponents in `{0,1,3,4}`. Inductively their n-fold sums fill 0,…,4n
for every n≥2. Prove restriction is therefore surjective for n≥2 and
`h⁰(M,O(n)|_M)=4n+1` for n≥0. For n=0 the restriction is the identity on
constants. This gives an explicit low-twist failure and its subsequent
surjectivity on the same embedding. For a general closed complex submanifold
of ℂPᴺ the eventual surjectivity of restriction for large twists, by the
coherent ideal sequence and analytic Serre vanishing, is
ComplexComparisonPartII's and is not a target here; the rational quartic
supplies the specific nonextension example, and its higher-twist calculation
uses only the explicit monomial products above.

*Needs:* K7.1's projective charts and the OnePoint comparison; K7.2's O(k),
section pullback and monomial section identification; K1's holomorphic
immersion/embedding criteria.

**Checks.**

- `n=1`: the image of `(a,b,c,d)↦(a,b,0,c,d)` has dimension 4 in the
  5-dimensional `H⁰(ℂP¹,O(4))`, and `s²t²`, coefficient vector `(0,0,1,0,0)`,
  is outside it.
- `n=2`: the nine exponent pairs give every `t`-exponent 0,…,8, so
  `h⁰(M,O(2)|_M)=9=4·2+1`, and the restriction from the 10-dimensional
  `H⁰(ℂP³,O(2))` is surjective with kernel spanned by `x₀x₃−x₁x₂`, the
  quadric containing M.
- `n=0`: the restriction is the identity on constants and `h⁰=1`.
- Control: the rational normal quartic `[s⁴:s³t:s²t²:st³:t⁴]` in ℂP⁴ has
  surjective restriction already at `n=1`; the failure comes from projecting
  away from the `s²t²` coordinate.


For a complex torus `ℂⁿ/Λ` with a full real lattice, consume ComplexTori's quotient and descent.
Prove its flat Kähler structure, invariant holomorphic forms, and
`h^(p,q)=binomial(n,p)binomial(n,q)`. Include the elliptic one-dimensional case and its
genus/Betti dictionary. For every compact connected Riemann surface define
its geometric genus g=h^(1,0) and prove `h^(0,0)=h^(1,1)=1`,
`h^(0,1)=g` and `b₁=2g` by Hodge comparison (Demailly, Chapter VI,
(10.1)–(10.2)); every positive (1,1)-form on a curve is a Kähler form, so
K6.1 applies. `finrank_dolbeaultCohomology_riemannSurface` states
`h^(0,1)=h^(1,0)` and `b₁=2h^(1,0)` on every compact complex manifold of
complex dimension one, with no Kähler form assumed and connectedness not
needed, both sides being additive over components. Prove the integral dictionary
on the realified surface Σ itself, with K1's real restriction and complex
tangent orientation; no step classifies surfaces or uses a homeomorphism to
a standard genus-g model. Σ is a closed, connected, oriented real surface of
finite CW type (AlgebraicTopology Stage 8, item 7), so `H_*(Σ;ℤ)` is
finitely generated. AlgebraicTopology Stage 6.3 turns K1's tangent
orientation into a homological orientation, and Tau Ceti's
`TauCeti.HomologicalOrientation.fundamentalClass` is its integral fundamental
class `[Σ]`, with `fundamentalClassEquiv` giving `H₂(Σ;ℤ)=ℤ[Σ]` for connected
Σ. Evaluation on `[Σ]` is an isomorphism `H²(Σ;ℤ)≃ℤ`. Route: Stage 6.4's
Poincaré duality gives `H₁(Σ;ℤ)≃H¹(Σ;ℤ)`; Tau Ceti's universal-coefficient
sequence (`TopCat.singularUniversalCoefficientEquiv`, through the Kronecker
map `TopCat.singularKronecker`) gives `H¹(Σ;ℤ)≃Hom(H₁(Σ;ℤ),ℤ)`, as
`H₀(Σ;ℤ)=ℤ` is free, so `H₁(Σ;ℤ)` is free; the same sequence in degree two
then identifies `H²(Σ;ℤ)` with `Hom(H₂(Σ;ℤ),ℤ)≃ℤ` by evaluation on `[Σ]`.
The degree-one cup pairing `(a,b)↦⟨a⌣b,[Σ]⟩`, with Tau Ceti's integral cup
product `TopCat.integralCup`, is unimodular on the free module `H¹(Σ;ℤ)`: its
adjoint is the composite of Stage 6.4's duality `b↦[Σ]⌢b` onto `H₁(Σ;ℤ)`
with the evaluation isomorphism of a finitely generated free module onto its
double dual (Stage 6.5's intersection pairing on a closed oriented manifold
of finite CW type). It is alternating: `integralCup_self_add_self_eq_zero`
gives `2(a⌣a)=0` for `a` of degree one, and `H²(Σ;ℤ)≃ℤ` is torsion-free. Its rank
is `b₁=2g`. Own, as the unimodular case `d_i=1` of the elementary-divisor
normal form that AbelianSchemesAndArithmeticModuli A5.4 states in general, the
algebra target that fixes its normal form: a unimodular
alternating bilinear form ω on a free ℤ-module L of finite rank r has even
rank r=2h and a symplectic basis `a₁,b₁,…,a_h,b_h` with `ω(a_i,b_j)=δ_ij`
and `ω(a_i,a_j)=ω(b_i,b_j)=0`. Route: for r>0 pick a primitive x; under the
adjoint isomorphism `L≃Hom(L,ℤ)` the functional `ω(x,−)` is primitive, hence
surjective, so `ω(x,y)=1` for some y; the plane P spanned by x and y has Gram
matrix `[[0,1],[−1,0]]`, which is unimodular, so `L=P⊕P^⊥` with `P^⊥`
unimodular alternating of rank r−2; induct, with the empty basis at r=0.
Tau Ceti's `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` is the same
induction over a field, where every nonzero functional is surjective; the
integral step is the primitivity of `ω(x,−)`.
Applied to the cup pairing it gives a basis of `H¹(Σ;ℤ)` whose cup matrix is
the block sum of g copies of `[[0,1],[−1,0]]`, for the complex orientation,
and compatible with the smooth surface through the real de Rham comparison.
These are the integral fundamental/intersection comparisons used in
IndexTheory I7.4. Define the geometric genus of a compact n-fold as
`h^(n,0)`. The theta sections of positive torus line bundles and their
quantization are GeometricQuantization's targets.

**Checks.**

- Elliptic curve `ℂ/(ℤ+τℤ)`: `g=1`, `H¹(Σ;ℤ)=ℤ²`, and the classes dual to
  the loops `1` and `τ` have cup matrix `[[0,1],[−1,0]]`; its determinant 1
  is the unimodularity.
- `ℂP¹`: `g=0`, `H¹(Σ;ℤ)=0` with the empty symplectic basis, and evaluation
  on `[ℂP¹]` identifies `H²(ℂP¹;ℤ)` with ℤ.
- Two disjoint elliptic curves: `h^(1,0)=h^(0,1)=2` and `b₁=4=2·2`, so
  `finrank_dolbeaultCohomology_riemannSurface` needs no connectedness; there
  `H²≃ℤ²`, which is why the integral dictionary assumes Σ connected.
- Negative control in dimension two: the Hopf surface has `h^(1,0)=0`,
  `h^(0,1)=1` and `b₁=1`, so neither identity of the dictionary survives
  outside complex dimension one without a Kähler form.
- Negative control: `[[0,2],[−2,0]]` on ℤ² is alternating and nondegenerate
  over ℚ but has determinant 4, so no basis puts it in the standard form;
  unimodularity, not mere nondegeneracy, is what the normal form uses.
- Negative control: the symmetric unimodular form `[[1,0],[0,1]]` has
  `ω(e₁,e₁)=1≠0`; the alternating law excludes it, as it must for a cup
  pairing of degree-one classes.


**K7.FlatDegreeZero — elliptic lines and vanishing cohomology.** Fix Im τ>0
and the same complex-torus carrier `E_τ=ℂ/(ℤ+τℤ)` supplied above. Write
`λ_(m,n)=m+nτ` and let ρ be a character of the additive lattice into ℂ×.
Use K4's holomorphic bundle descent to construct the line L_ρ from
`(z,v)~(z+λ,ρ(λ)v)`. Give its local frames, projection, fibrewise linear
charts and the tensor/dual/pullback comparisons
`L_ρ⊗L_σ≃L_(ρσ)` and `L_ρ*≃L_(ρ⁻¹)`. Here ρ is a factor of automorphy:
the descended flat connection has source-to-target holonomy ρ(λ)⁻¹ around
the loop lifting from0 to λ. Prove this inverse against K4/B5's actual
parallel-transport convention.

Identify holomorphic sections with entire functions satisfying
`f(z+λ)=ρ(λ)f(z)`, by mutually inverse linear descent/pullback maps. For
unitary ρ, prove |f| is lattice-periodic and bounded by its maximum on a
compact fundamental parallelogram. Apply native
`Differentiable.exists_eq_const_of_bounded`: f is constant, and its value c
satisfies `(ρ(λ)−1)c=0` for all λ. Thus H⁰(E_τ,L_ρ) is a line for ρ=1
and zero otherwise, with the actual constant-section isomorphism in the
trivial case. No such assertion for every nontrivial complex character is
made: a character `ρ(λ)=exp(aλ)` has the nowhere-zero section exp(az).

Prove the complete gauge criterion
`L_ρ≃L_σ ↔ ∃a∈ℂ, σ(λ)=exp(aλ)ρ(λ) for every λ`, with forward maps,
inverses and scalar choices: the displayed exponential sends
`[z,v]↦[z,exp(az)v]`. For arbitrary ρ, put
`u=log|ρ(1)|`, `v=log|ρ(τ)|` and
`a=u+i(u Re τ−v)/Im τ`. Prove `σ(λ)=exp(−aλ)ρ(λ)` is unitary. The
corresponding entire gauge reduces the section and isomorphism problems
to the bounded-function argument above. Between two unitary characters the
criterion forces a=0 and ρ=σ. Export the full isomorphism spaces: they are
empty for distinct unitary characters and are ℂ× for equal ones.

Prove L_ρ is smoothly trivial, with integral c₁=0 and degree0. For unitary
`ρ(1)=exp(2πiα)`, `ρ(τ)=exp(2πiβ)`, a smooth nowhere-zero section is
represented by `f(x+τy)=exp(2πi(αx+βy))`; changing the real lifts α,β changes
the frame, not the line. Transfer this result through the exponential gauge
for arbitrary ρ. Construct every degree-zero holomorphic line this way:
choose a Hermitian metric, write `iF=φω` on the flat elliptic metric and
use its zero integral. With the nonnegative scalar Laplacian and K5's Green
operator G, set `u=−2Gφ` and `h'=exp(u)h`. Prove
`F_(h')=F_h−∂∂̄u` and `i∂∂̄u=−(Δ_du)ω/2`, hence F_(h')=0.
Parallel frames and the inverse holonomy convention give the required
unitary ρ. This identifies the degree-zero subgroup of K4.P's holomorphic
Picard group with the group of unitary lattice characters, preserving
products and duals; it does not construct a second Picard functor.

Trivialize the canonical line by dz. K5b's Serre pairing then identifies
H¹(E_τ,L_ρ) with the dual of H⁰(E_τ,L_(ρ⁻¹)); higher cohomology vanishes.
For unitary ρ≠1 both H⁰ and H¹ vanish, whereas for ρ=1 both have dimension1.
Give the perfect pairing and the invariant dz/dbar(z) representatives in
that trivial case. For the square torus take ρ(m+ni)=(−1)^m as an explicit
smoothly trivial, holomorphically nontrivial acyclic line. These targets
supply the degree-zero elliptic example independently of a Riemann–Roch
theorem. The unitary-character description of degree-zero lines is
[Berwick-Evans and Tripathy, *A de Rham model for complex analytic equivariant elliptic cohomology*, §2.1, Remark 2.1, p. 6](https://par.nsf.gov/servlets/purl/10339859).

*Needs:* ComplexTori Milestone 1's fixed torus; K4's holomorphic descent and
Chern formulas; K4.P; K5's Green operator and K5b's Serre duality; Mathlib
`Differentiable.exists_eq_const_of_bounded`.

**Checks.**

- `ρ=1`: `H⁰(E_τ,L_1)` is the constants, `H¹` is one-dimensional with
  representative `dbar(z)`, and the gauge criterion gives `a=0`.
- The square torus `τ=i`, `ρ(m+ni)=(−1)^m`: unitary and nontrivial, so
  `H⁰=H¹=0`; the smooth frame `f(x+iy)=exp(πix)` (`α=1/2`, `β=0`) satisfies
  `f(z+1)=−f(z)` and `f(z+i)=f(z)`, so `L_ρ` is smoothly trivial with `c₁=0`.
- The gauge formula recovers `a`: for `ρ(λ)=exp(aλ)` with `a=α+iβ` and
  `τ=x+iy`, `u=α`, `v=αx−βy` and `u+i(u Re τ−v)/Im τ=α+iβ`, so `σ=1` and
  `L_ρ` is trivial, with the nowhere-zero section `exp(az)`.
- Holonomy convention: transporting `(0,v)` along the lift of the loop from 0
  to λ ends at `(λ,v)~(0,ρ(λ)⁻¹v)`, so the holonomy is `ρ(λ)⁻¹`; the convention
  `(z,v)~(z+λ,ρ(λ)⁻¹v)` would give `ρ(λ)`.

Construct the primary Hopf surface `(ℂ²\{0})/(z↦2z)` using ComplexManifolds
Milestone 4's free properly discontinuous holomorphic quotient, and its smooth
diffeomorphism to `S¹×S³`. Compute its de Rham groups and prove it is not Kähler since
`H²(M;ℝ)=0`. Prove `h^(1,0)=0` by Hartogs extension and dilation invariance, compute
`h^(0,1)=1`, and identify the failure of Hodge symmetry. Own the Laurent/Čech computation
of `H¹(ℂ²\{0},𝒪)` and its dilation action: its invariant part is zero, while
`H¹(ℤ,𝒪(ℂ²))≃ℂ` by coefficientwise coinvariants. Own the covering Čech/group-cohomology
(Cartan–Leray) comparison and use it to obtain h^(0,1)=1. Extend the same Leray-cover
Laurent computation to Ω¹ with its twisted dilation action: holomorphic monomials times
dz_j have weights `2^(d+1)` (d≥0); H¹ Laurent monomials `z₁^(−m)z₂^(−n)dz_j` have weights
`2^(1−m−n)` (m,n≥1). No weight is 1; prove vanishing of coinvariants and invariants to
obtain `h^(1,1)=0`. Prove the full diamond has precisely
`h^(0,0)=h^(0,1)=h^(2,1)=h^(2,2)=1` and all others zero; consequently
`b_k=Σ_(p+q=k)h^(p,q)` despite failure of symmetry. Prove it admits no holomorphic
embedding in any ℂPⁿ.

## K8. The Frölicher spectral sequence and non-Kähler comparison

Construct the spectral sequence of the double complex of smooth type forms, with
`E₁^(p,q)=H^(p,q)_∂̄`, converging to complex de Rham cohomology. Consume DGFloer's generic
filtered-complex spectral sequence and own its decreasing cohomological column-filtration
adapter, with `d_r:E_r^(p,q)→E_r^(p+r,q−r+1)`, finite filtration and associated-graded
convergence. Use Mathlib's `SpectralObject`/bicomplex carriers; do not create another
spectral-sequence object. Prove E₁ degeneration in the compact Kähler case using K6.

Construct the complex Heisenberg group and its Gaussian-integer lattice, the compact
Iwasawa quotient and invariant form equations. Compute `h^(1,0)=3`, `h^(0,1)=2`, `b₁=4`
with a proof that the invariant-form calculation gives the relevant cohomology (Angella,
§4.1 for `b₁=4` and §4.2 for `h^(1,0)=3` and `h^(0,1)=2` on the Iwasawa manifold itself,
p. 13). Exhibit
the nonzero first spectral differential and the failure of an additive Hodge decomposition
on this compact complex manifold. Own the Heisenberg group and lattice, the
freeness and proper discontinuity of its holomorphic lattice action, and
cocompactness. Consume ComplexManifolds Milestone 4 for the quotient complex manifold and
its projection/descent API; build the cohomology-comparison prerequisites here. Consume [LieGroupoidsPoisson G1.3](../LieGroupoidsPoisson/README.md)'s all-degree real
Chevalley–Eilenberg differential and own its scalar-extension and complex-summand adapter:
on the underlying real algebra, identify the complexification with `𝔤⊕bar(𝔤)`, with zero
mixed bracket, and construct the complex-linear CE complex of `bar(𝔤)` and the invariant
Dolbeault bicomplex. Own Nomizu's real de Rham comparison for compact nilmanifolds and
Sakane's Dolbeault comparison for compact complex parallelizable nilmanifolds.

**K8.NilpotentCentralReduction.** Supply the existence and lattice theorem
needed at every induction step, for a finite-dimensional simply connected
real nilpotent Lie group G with a given discrete uniform lattice Γ. Include
the universal-cover/lifted-lattice comparison for a connected nilpotent
presentation of the same compact quotient. Prove the restricted Malcev
rationality statement from Γ: using the global exponential/BCH coordinates
and a Γ-adapted Malcev basis, `𝔤_ℚ=span_ℚ(log Γ)` is a rational Lie form of
𝔤, and rational ideals give closed connected exponential subgroups with
uniform lattice intersection and discrete cocompact projected lattice.
Own the finite-generation, rational-basis and subgroup/lattice arguments;
a theorem label or a conditional assumption that a suitable A exists is
not this input. In the nonabelian case take the last nonzero lower-central
ideal of 𝔤. Prove it is positive-dimensional, central, proper and rational
for this Γ-induced rational form; put `A=exp(𝔞)`. Prove A is closed,
connected and simply connected, `Γ∩A` is a uniform lattice (Raghunathan, Corollary 1,
p. 31), AΓ is closed (Raghunathan, Theorem 1.13, p. 23), as Sakane, p. 189, uses them at
this step, and the image Γ̄ in G/A is discrete and cocompact. The remaining rationality
and quotient-chart steps are this roadmap's own, proved by the route given. Construct G/A as a
simply connected nilpotent Lie group of strictly smaller dimension using
quotient BCH charts. Construct the smooth principal torus bundle
`G/Γ → (G/A)/Γ̄` with fibre `A/(Γ∩A)`, its local trivializations and
translation transition maps. In particular prove the resulting cohomology
local systems have trivial monodromy by centrality, rather than assuming
triviality from a merely abstract fibration.

For simply connected complex nilpotent G, apply that rationality theorem to
the underlying real group. Its last nonzero lower-central ideal is also a
complex ideal by complex bilinearity of the bracket; prove this without
requiring the rational form itself to be stable under multiplication by i.
Thus A is a complex central subgroup, its lattice has real rank
`2 dim_ℂ A`, and `A/(Γ∩A)` is a complex torus. Own the complex quotient
charts/local holomorphic sections for G/A and prove the torus bundle above
is holomorphic, with complex-nilpotent simply connected base group of
strictly smaller complex dimension. Prove freeness, proper discontinuity
and compactness for each discrete lattice action before consuming
[ComplexManifolds Milestone 4](../ComplexManifolds/README.md)'s
quotient/descent API. That supplier handles those discrete quotients; the
continuous central quotient, rationality, lattice existence and
smooth/holomorphic principal-torus comparison are K8's targets.
Use real and complex tori, including dimension zero, as the abelian base
cases, and the constructed A at each nonabelian step. Compare the chosen
left/right lattice-quotient and invariant-form conventions by inversion,
with the corresponding CE chain map, before applying [G1.3](../LieGroupoidsPoisson/README.md). This supplies the
full Nomizu/Sakane induction, not just the Iwasawa example. The central
reduction follows the nilpotent case in Sakane, pp. 188–189, whose lattice
step invokes the restricted Malcev theory; K8 owns that needed theory here.

For these constructed central extensions by compact tori, filter the CE
complex by base/horizontal degree and
prove the Hochschild–Serre E₂ identification with base CE cohomology tensor central-fiber
cohomology. For the full de Rham complex own the central-torus bundle spectral-sequence
page identifications (vertical de Rham E₁ followed by base cohomology E₂). For Dolbeault
own the Borel spectral-sequence construction for these holomorphic central-torus
fibrations: fiberwise ∂̄ harmonic projection and translation-invariant fiber cohomology,
the smooth local-system/trivial-monodromy comparison, and the corresponding base/fiber E₂
identification. Prove the inclusion from invariant to full filtered complexes induces the
comparison on these pages; apply induction on the central torus quotient and the
finite-filtration comparison theorem. Generic DGFloer machinery supplies
convergence/naturality, not these geometric page identifications. Apply Sakane only to
this precise complex-parallelizable nilpotent class. An invariant subcomplex alone does
not prove its inclusion is a quasi-isomorphism.

**Checks.**

- Iwasawa manifold: `h^(1,0)+h^(0,1)=3+2=5>4=b₁`, so some differential of the
  Frölicher spectral sequence is nonzero; with `dφ₃=−φ₁∧φ₂` for the invariant
  holomorphic coframe, `d₁[φ₃]=[∂φ₃]=−[φ₁∧φ₂]≠0` in `E₁^(2,0)`.
- A complex torus `ℂⁿ/Λ` has `h^(1,0)+h^(0,1)=2n=b₁` and degenerates at E₁; so does the
  non-Kähler Hopf surface (`0+1=1=b₁`), so E₁ degeneration does not imply Kähler.
- Malcev rationality for the integer Heisenberg group: the element with entries
  `x=y=z=1` has logarithm `X+Y+½Z`, so log Γ is not an additive subgroup of 𝔤 but spans
  the rational form `ℚX+ℚY+ℚZ`; the centre `A=exp(ℝZ)` has `Γ∩A≅ℤ`, `G/A≅ℝ²` and
  `Γ̄≅ℤ²`. For the Iwasawa manifold A is the complex centre, `Γ∩A=ℤ[i]` and the fibre
  `A/(Γ∩A)` is the elliptic curve with `τ=i`.

## Order and references

GlobalHolomorphicFunctions, whose Layer k is cited as GH(k−2), is consumed in this order:
K2 takes §0.3's compact-support Cauchy–Green operator and area normalization and GH0's
finite-rank Runge operators and exhaustion (§§2.1, 2.5) to build its own
smooth/holomorphic/mixed parameter solver, without a parameter export from GH5's scalar
theorem; K3.MeromorphicGermField takes GH2's Laurent decomposition and coefficient extraction
(§4.1); K5a takes GH5.1's complex two-form exactness (§7.4) and owns the complex-coefficient
carrier comparison. GlobalHolomorphicFunctions does not consume ComplexKahlerGeometry.

K3.0 several-variable calculus precedes K1. K1's scalar-restriction and
orientation paragraph precedes K7.1 and SBC B1's acceptance examples;
K1's eigenbundle calculus consumes SBC B2's complexification and precedes K2.
K2's scalar calculus, whole-polydisc local lemma, parameter-dependent shell solver, and Ω^p sheaves
consume GH0's fixed finite-rank operators and GlobalHolomorphicFunctions §0.3's Cauchy–Green map under their stated interfaces and precede K4's holomorphic bundles and connections. K2's bundle-valued comparison follows
K4's holomorphic-section sheaf and ∂̄_E. The rest of K3 uses that local analysis and feeds K4's
analytic-sheaf examples. K5a's orientation line and density bundle use DG, SBC B2 and Tau Ceti's pointwise star
independently of PDO P1.0 and K1–K4. K5a's BundleTest, BundleDistribution and Fréchet
section carriers follow its density line and use chart/frame analysis
and SBC B3–B4's connection comparisons,
independently of P1.0. PDO P1.0 consumes that density bundle; K5a's
distributional operator action, Hilbert-scale, Laplace-type and de Rham Hodge
developments then consume P1.0, SBC B2–B4, PDE Lane A.3 (componentwise
on finite-dimensional fibers), [VariationalMethods V2–V5.2](../VariationalMethods/README.md),
[UO-D06](../OperatorTheory/UnboundedOperators/README.md) and AT, with
HopfRinow Layer 1's Levi-Civita connection through P1.0. The abstract order is
VM V2.3 → UO-D06 → VM V5.1, with VM V3–V4 also preceding V5.1;
CKG consumes that same-operator compact specialization. VM V5.3's geometric
comparison follows K5a, so it is not an input to this abstract order.
K5a.ComponentwiseCompact follows its component fixed-model analytic theorems
and the smooth component-family assembly, and feeds K5b.1 for K4's holomorphic
componentwise bundles. Its finite-product/orthogonal-sum maps precede the
global compact Hodge/Serre conclusions for locally finite varying ranks.
PDO P1.1 and P2 onward consume this analysis. K5b uses K1, K2, K4
and K5a. K6.0 uses K1/K2/K4 and K5a local identities, and precedes
RealAnalyticGeometry R3/R4/R5. K6.1 follows K5b, K6.0 and K3's analytic-set theory, K3.0's real-analytic
atlas, RealAnalyticGeometry R1/R5, DG5/8.3–8.5/12.1 (the absolute smoothing,
chain integration, `deRhamHom` and `deRhamEquiv`), Tau Ceti's smooth singular
simplices and fundamental classes for K6.1.RelativeIntegration, AT4.5/4.7/6.1/6.3
and GT Layer11. K7.1 uses K3.0, K1's complex orientation and
ComplexManifolds Milestones 1–3, Mathlib's `Projectivization.instTopologicalSpace`, Tau Ceti's
projectivization instances and affine atlas and Tau Ceti's sphere-quotient model
`TauCeti.ComplexProjectiveSpace` with its atlas, and precedes K2's ℂP¹ acceptance. K7.2's CW
structure and additive groups are Tau Ceti's on the sphere-quotient model, transported by
K7.1's comparison; its cup calculation uses AT Stage 6 before AT Stage 7, independently
of K2–K6; its bundle/forms/Hodge applications use K4–K6. K8 uses K2/K5/K6
and the generic spectral-sequence machinery. K4.P follows K2's Čech/derived comparison
and fine-implies-acyclic theorem, K3's function sheaf, K4's line bundles and SBC
B6.1–B6.2, none of which uses K4.P; it owns the unit sheaf, `Pic_hol`, the
exponential segment, the conditional `c₁` isomorphism and `F_M`, which
ComplexComparisonPartII C5.4, K3Surfaces 1.1 and GeometricQuantization §3.3
consume; its ℂP¹ normalization check uses K7.1's charts, and K7.FlatDegreeZero
consumes it. Its
continuous-line corollary uses the continuous exponential sequence and
no TopologicalKTheory input; TopologicalKTheory consumes K5–K7, including K7.2's
complex characteristic cells.
K7.2.RationalQuartic's embedding uses
K7.1; its bundle and section comparisons use K7.2's twists and monomial
section calculation. Its explicit higher-twist surjectivity uses monomial
products. K7.2's torus computations follow
ComplexTori Milestone 1 and K5b/K6.1. Its Riemann-surface genus and integral cup
computations follow K1's realification/complex orientation, Tau Ceti's
integral fundamental class, universal-coefficient sequence and integral cup
product, AT Stage 6.3's tangent-to-homological orientation comparison, Stage
6.4–6.5's Poincaré duality and intersection pairing, Stage 8 item 7's finite
CW type of compact manifolds, and K6.1; they use no classification of
surfaces. Its Hopf computations
follow ComplexManifolds Milestone 4, K2's Leray-cover comparison, K3's Hartogs theorem,
K5b's Serre duality and DG's Mayer–Vietoris theorem. The Iwasawa quotient
consumes ComplexManifolds Milestone 4; the general invariant-cohomology comparisons
first use K8.NilpotentCentralReduction's Γ-rational central subgroup,
lattice, lower-dimensional quotient and smooth/holomorphic principal-torus
bundle theorem, then [LieGroupoidsPoisson G1.3](../LieGroupoidsPoisson/README.md)'s CE adapter and the geometric
spectral-sequence page comparisons in K8. The generic filtered-complex
machinery supplies convergence after those inputs.
Every local definition and bundle construction has restriction, gluing, functoriality and transport
APIs before it becomes a global theorem's input.
Within K3, the convergent complex local-algebra and singular-locus targets
precede RealAnalyticGeometry R1's local semianalytic/component results; those
results then supply K3's finite regular-piece partition. R1 does not consume
that later partition. RealAnalyticGeometry R5 applied to that finite family
supplies the compatible triangulation in K6.

- Griffiths and Harris, *Principles of Algebraic Geometry*, chapter 0, for
  local analytic geometry, Dolbeault/Hermitian and Kähler foundations.
- [Demailly, *Complex Analytic and Differential Geometry*](https://www-fourier.ujf-grenoble.fr/~demailly/manuscripts/agbook.pdf),
  for analytic germs, bundle connections, elliptic theory and Kähler identities;
  Chapter V, (8.2), p. 264, (9.2) and (9.5), pp. 264–265, and Chapter VI, §9.1, (9.1),
  p. 314, for the exponential sequences and first Chern classes of K4.P.
- Webster, *A new proof of the Newlander–Nirenberg theorem*, Math. Z. 201 (1989), 303–316, for the convex-domain homotopy and rapidly converging iteration route.
- [Sakane, *On compact complex parallelisable solvmanifolds*](https://ir.library.osaka-u.ac.jp/repo/ouka/all/5964/ojm13_01_13.pdf), Theorem 1 and the nilpotent case, for the invariant Dolbeault comparison.
- Wells, *Differential Analysis on Complex Manifolds*, for Dolbeault, elliptic
  Hodge theory and duality.
- [Hörmann and Steinbauer, *Lecture Notes on the Theory of Distributions*, Universität Wien, 2009](https://mat.univie.ac.at/~stein/teaching/courses/SoSem09/distrvo.pdf),
  Theorem 1.70, p. 35, and Theorem 4.22, pp. 89–90, for the point-supported
  and continuous-primitive structure theorems in K5a.DistributionLocalStructure.
- Hörmander, *The Analysis of Linear Partial Differential Operators I*,
  Theorems 2.3.4 and 2.3.5, for distributions supported in a point and in a
  submanifold in K5a.DistributionLocalStructure.
- [Angella, *The cohomologies of the Iwasawa manifold and of its small deformations*](https://arxiv.org/abs/1212.4351),
  §§4.1–4.2, p. 13, for the explicit non-Kähler cohomology comparison.
- Raghunathan, *Discrete Subgroups of Lie Groups*, Springer, 1972, Theorem 1.13, p. 23,
  and Corollary 1, p. 31, for the lattice steps of K8.NilpotentCentralReduction.
- Bott and Tu, *Differential Forms in Algebraic Topology*, Springer, 1982, §6, relative
  de Rham theory, p. 78, for the relative de Rham complex of K6.1.RelativeIntegration.
- [Ballmann, *Lectures on Kähler Manifolds*, ESI Lectures in Mathematics and Physics, EMS, 2006](https://people.maths.ox.ac.uk/joyce/Nairobi2019/BallmannKahlerManifolds.pdf),
  Theorem 4.17, for the global Kähler/normal-coordinate equivalences in K6.0, and §4,
  Example 5, pp. 43–44, for the unitary invariance of the Fubini–Study form in K7.2.
- [Berwick-Evans and Tripathy, *A de Rham model for complex analytic equivariant elliptic cohomology*, 2021](https://par.nsf.gov/servlets/purl/10339859),
  §2.1, Remark 2.1, for the unitary-character description of degree-zero elliptic lines.
- [Knutson, *Representations of U(n): the Borel–Weil theorem*, notes for Math 261, 2001](https://pi.math.cornell.edu/~allenk/courses/16spring/BorelWeil.pdf),
  §1, for the incidence-variety/homogeneous-function picture of O(k) in K7.2.TautologicalIncidence.
- [Łojasiewicz, *Triangulation of semi-analytic sets*, Ann. Scuola Norm. Sup. Pisa (3) 18 (1964), 449–474](https://www.numdam.org/item/ASNSP_1964_3_18_4_449_0/),
  §3, Theorem 2, p. 464, for the semianalytic triangulation used in K6.1.
