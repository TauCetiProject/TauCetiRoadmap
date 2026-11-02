# Roadmap: complex manifolds, Dolbeault theory, and Kähler geometry

**Summary.** Develop the local analytic and differential geometry of complex manifolds, holomorphic
bundles, Dolbeault cohomology and compact Hermitian/Kähler Hodge theory. The development
includes analytic germs and subvarieties, canonical Hermitian connections, duality and
explicit projective, torus and non-Kähler examples. These are reusable theories with basic
calculus and functorial APIs, not only statements of Hodge decomposition or the Kähler
identities.

## Scope and ownership

This roadmap owns complex type calculus, local analytic geometry, holomorphic
connections, the shared bundle-distribution and Sobolev theory, Hermitian and
Kähler Hodge theory, analytic cycles and the projective, torus and nilmanifold
applications in Layers 1–8. ComplexManifolds Milestones 1–7 own atlas transport,
complex orientation, quotients, gluing and holomorphic bundle operations;
ComplexTori Milestone 1 owns lattice quotients. DifferentialGeometry Layers 0–9
own generic forms, real integration and absolute de Rham comparison. The complex
scalar extension here uses those same forms. SmoothBundlesConnections B2–B4 own
bundle operations, metrics and connections. Layer 2 owns the scalar compact-support
Cauchy–Green transform, finite-rank Runge approximation and simultaneous smooth and
holomorphic parameter solver; Layer 3 owns the finite-pole stalk comparison and
Layer 5 its planar de Rham consequence. GlobalHolomorphicFunctions owns global
prescribed singularities, divisors and factorization beyond these inputs. Layer 5
owns finite-order bundle differential operators, jets, symbols and density transposes;
PseudodifferentialOperators owns the subsequent pseudodifferential calculus and Peetre
extension. Layer 8 owns the all-degree finite-dimensional Lie-algebra cochain complex;
LieGroupoidsPoisson owns the manifold Lie-algebroid extension. VariationalMethods
§§2–5 and UnboundedOperators UO-D06 own abstract form representation and compact
spectral theory; Layer 5 identifies the geometric weak domains and regularity.

The acceptance statements are `finite_rank_runge_approximation` and
`mixed_parameter_solver` in Layer 2 and
`realified_isManifold_analytic`, `holomorphicStalk_noetherian` and
`holomorphicStalk_factorial` in Layer 3. The other headline theorems and their
missing geometric carriers are listed in the module docstring of Suggested.lean.

## Conventions

Manifolds are finite-dimensional, Hausdorff and second-countable, without boundary;
compactness and connectedness are stated where used. Native holomorphic sheaf
statements use small manifold carriers, matching the universe of the scalar ring ℂ. Complex manifolds use Mathlib's
complex `IsManifold`; holomorphic means `MDifferentiable ℂ` in charts. K3.0 proves its
equivalence to complex analytic and complex `ContMDiff ∞` maps in finite dimensions. The complex structure J has `J²=-1`; `T^(1,0)` and `T^(0,1)` are its `+i` and `−i`
eigensubbundles in `TM⊗ℂ`. Define the type projections explicitly. Write `d=∂+∂̄` on an
integrable complex manifold and `d^c=i(∂̄−∂)`, so `dd^c=2i∂∂̄`. Hermitian inner products
are conjugate-linear in the first argument and linear in the second. For a real Hermitian
metric and its fundamental form, pin `g(u,v)=ω(u,Jv)`; positivity and compatibility are
Tau Ceti's `SmoothTwoForm.Compatible` convention. The definitive degree-two
carrier is DG0.4's `SmoothForm I M ℝ 2`, with closedness `mextDeriv ω = 0`.
Transport the pinned native two-form compatibility and closedness API through
DG0.4's `legacySmoothTwoFormEquiv` and
`legacySmoothTwoFormEquiv_isClosed_iff`; these are comparison targets on that generic form carrier. On `(TM,J)` set
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

The normalization comparisons include:

- Conjugating coefficients commutes with the real exterior derivative and exchanges the type projections.
- The converted Hermitian tensor, its fundamental form and the Gram metric use the same scalar restriction.

**Checks.**

- On ℂ, J∂ₓ=∂ᵧ and ω(∂ₓ,J∂ₓ)=1=g(∂ₓ,∂ₓ); replacing J by −J would give −1.
- For f=|z|², d^c f=2x dy−2y dx and dd^c f=4 dx∧dy; 2i∂∂̄f has the same value.
- For u=1,v=i, h_T(u,v)=i, h_src,tensor(u,v)=−2i and h_src,native(u,v)=2i; the converted metric has fundamental form 2 dx∧dy.

*Needs:* DifferentialGeometry §§0.1–1.2; Layer 1 type projections and Layer 5 Gram metric.

## Exact supplier contracts

The real scalar restriction, holomorphic quotients, open gluing and holomorphic vector-bundle
objects follow the [ComplexManifolds](../ComplexManifolds/README.md). Its Milestones
1 and 2 supply real restriction, atlas transport, the canonical complex
orientation and its compatibility laws in DG's orientation carrier. Milestone 3
owns the OnePoint complex atlas consumed by K7.1; Milestones
4–6 own discrete holomorphic quotients, open gluing and their topology;
Milestone 7 owns the holomorphic-transition mixin, bundle cocycle gluing
and operations on native vector bundles. Consume these specified Tau Ceti
targets, including their model and tangent comparisons; the milestone references
are specified by the [ComplexManifolds contract](../ComplexManifolds/README.md).
Complex-torus quotients follow
[ComplexTori](../ComplexTori/README.md) Milestone 1, with the fixed-torus
theory used in K7 and the [specified ComplexTori contract](../ComplexTori/README.md).

Use [DifferentialGeometry](../DifferentialGeometry/README.md)'s generic smooth forms,
exterior derivative, pullback, wedge, integration, Stokes and de Rham comparison. Its chain integration and Stokes already allow complete vector-valued coefficients;
its de Rham comparison is stated over ℝ. K5a owns the complex-linear manifold integration compatibility and complex-coefficient de Rham
comparison on the same generic form carrier, viewed over ℝ; do not construct a second form carrier.
For any open Ω⊆ℂ, derive smooth complex two-form exactness from Layer 2's
scalar solver on this same form carrier. If β=b dx∧dy and ∂̄u=b/(2i),
then d(u dz)=2i∂̄u dx∧dy=β; pass to `H²_dR(Ω;ℂ)=0` in Layer 5.
Consume [RealAlgebraicGeometry Layer 7](../../Completed/RealAlgebraicGeometry/README.md#layer-7-analytic-preparation-and-mccallum-projection)
for analytic inversion and local real-germ complexification in model spaces;
consume the native joint analytic implicit-function theorem as specified in K1,
which owns the complex-manifold, chart and local-uniqueness adapters.
[SmoothBundlesConnections](../SmoothBundlesConnections/README.md) supplies real smooth
bundles with complex structure, tensor/dual/Hom/complexification, Hermitian metrics,
connections, curvature and their principal-bundle comparison maps. [PDE](../PDE/README.md)
supplies scalar real-domain Sobolev, embedding, Rellich and elliptic estimates, not system
estimates. Layer 5 constructs the differential-operator, jet, symbol and formal-density-adjoint
core after its density line, and then develops distributions and the all-real-order
Hilbert scale. It owns smooth Laplace-type regularity, pointwise real Hodge star
and real/complex Hodge theory.
[AlgebraicTopology](../AlgebraicTopology/README.md) owns singular cohomology
and products. The linear Hodge-structure objects in `Completed/HodgeStructures` are a
target for K6's comparison, not a proof of analytic Hodge theory.

**From Mathlib.** Use native manifold differentiability, real Fréchet derivatives,
continuous alternating maps, sheaf stalks, distributions, Bessel potential spaces,
linear maps and cochain complexes. In particular, the solver uses `ContMDiffOn`,
`DifferentiableOn` and `fderiv`; its displayed open sets are part of the hypotheses.

**From Tau Ceti.** The finite-dimensional Cauchy and parametric contour declarations
in `TauCeti.Analysis.Complex.CauchyIntegralPolydisc` supply Layer 3's analytic
comparison; `TauCeti.Analysis.Analytic.Inverse` supplies analytic implicit functions.
The smooth implicit-function theorem is Mathlib's
`ImplicitFunctionData.contDiffAt_implicitFunction`, in
`Mathlib/Analysis/Calculus/ImplicitContDiff.lean`.

## How to read the build

Layers retain the K1–K8 locators used by consumers. K3.0's local transition-map
comparison feeds K1; the remaining local analytic and bundle constructions feed
the elliptic layer, then compact Hodge theory and the examples. Each target's
inputs are stated with it; proof routes specify the analysis they use without
restricting alternative proofs. The final dependency discussion specifies the
individual interfaces used by downstream consumers.

## Layer 1: complex structures and type calculus

### 1.1 Atlas, orientation and type calculus (K1)

Consume ComplexManifolds Milestones 1 and 2, including the orientation construction,
atlas independence, product law and preservation by biholomorphisms (Milestone 2 item 4).
These targets use DifferentialGeometry 2.1's `Manifold.Orientation`, whose fibers are
`Orientation ℝ (TangentSpace I x) ι`. Reindex `Fin (2 * finrank ℂ E)`
to `Fin (finrank ℝ E)` using the scalar-restriction dimension equality,
and prove every chart sign of the resulting `OrientationLift` is positive.
Consume ComplexManifolds Milestone 2 item 1's real determinant positivity, expressed by
`LinearMap.det_restrictScalars` and `Algebra.norm_complex_eq`.
The shared carrier in ComplexManifolds is literally DG2.1's `Manifold.Orientation`
through HeegaardFloer's delegation to DG. K1 owns the tangent-index and
positive-chart-sign comparisons just stated, derived from ComplexManifolds Milestone 2 item 1's
determinant positivity and Milestone 2 item 2's overlap lemma; it constructs no second
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
K1 also equips the generic DG carrier `SmoothForm I M F k` with its natural
`Module ℂ` action whenever `F` is a normed complex vector space, regarded as a real
normed coefficient space by scalar restriction. For `c : ℂ`, define `c • ω` through
DG's fixed-coefficient map `SmoothForm.mapCoeff (L_c) ω`, where
`L_c : F →L[ℝ] F` is multiplication by `c`. Prove this agrees pointwise with
complex scalar multiplication, restricts along `ℝ → ℂ` to DG's existing real action,
and satisfies `IsScalarTower ℝ ℂ (SmoothForm I M F k)`. Prove complex-linearity of
`mextDeriv` from DG1.2 coefficient naturality, and of `mpullback` pointwise from its
definition. For every continuous complex-bilinear pairing `μ : F × G → H`, prove
complex-linearity of `wedgeWith μ` in each form argument using DG0.1's permutation
formula, complex bilinearity of `μ`, and DG0.3's coefficient-map/paired-wedge compatibility.
Coefficient conjugation is semilinear:
`conj(c • ω) = conj(c) • conj(ω)` for complex coefficients. Use these structures for
the complex type forms and cochain complexes below; do not construct a second form carrier.

For holomorphic `G(z,v)` with invertible v-derivative at `(z₀,v₀)`, construct
the joint holomorphic implicit map `F(z,w)` near `(z₀,G(z₀,v₀))`, with
`F(z₀,G(z₀,v₀))=v₀` and `G(z,F(z,w))=w`, and prove its local uniqueness.
Consume Mathlib’s `ImplicitFunctionData.contDiffAt_implicitFunction` and
`ImplicitFunctionData.analyticAt_implicitFunction` from
`TauCeti.Analysis.Analytic.Inverse`, which give joint smooth and
analytic regularity of `implicitFunction.uncurry`, by applying their data to
`(z,v)↦(z,G(z,v))`. Prove the holomorphic/chart and local-uniqueness adapters
from those native joint theorems; the fixed-level `ContDiffAt.implicitFunction`
wrapper supplies the single-level specialization.
Develop holomorphic submanifolds, embeddings and their tangent/normal exact sequences,
extending ComplexManifolds Milestone 7.4's codimension-one normal bundle to arbitrary codimension.
Prove equivalence of regular holomorphic parametrizations and regular holomorphic zero
sets.

For any smooth almost complex structure, apply SBC B2's complexification to TM and construct
the eigenbundles, exterior type `(p,q)`, projections, wedge/pullback/conjugation and the
decomposition of d into its four bidegrees. Define the Nijenhuis tensor by
`N_J(X,Y)=[JX,JY]−[X,Y]−J[JX,Y]−J[X,JY]`; prove tensoriality, skew-symmetry, its type
identities and the precise formulas connecting the non-`(1,0)/(0,1)` components of d and
the squares of ∂/∂̄ to N. Use DifferentialGeometry's determinant wedge and
`dα(X,Y)=Xα(Y)−Yα(X)−α([X,Y])` evaluation, without a 1/2 factor. On `(0,1)` fields X,Y,
pin `∂̄²f(X,Y)=−(1/4)∂f(N_J(X,Y))`; on `(1,0)` fields pin `∂²f(X,Y)=−(1/4)∂̄f(N_J(X,Y))`,
extending N complex-bilinearly. Deduce the same evaluation formulas on real
tangent vectors by projecting to their (0,1) or (1,0) components and using
`N(X^(0,1),Y^(0,1))=N(X,Y)^(1,0)` and its conjugate identity.
For the convention N′=N/4, prove the
corresponding evaluation formulas without the factor 1/4.
The first right-hand side uses ∂f, as required by its type.

Prove equivalence of `N_J=0` and involutivity of both eigenbundles, using local sections.
Prove the smooth **Newlander–Nirenberg theorem**: `N_J=0` iff J is induced by a compatible
complex atlas. Its proof includes the local complex first-order coordinate equations and
transition holomorphicity. Follow Webster's 1989 rapidly converging proof: construct
Henkin's homotopy operator on strictly convex domains with its half-derivative
Hölder–Zygmund gain, smoothing operators and their tame estimates, the nonlinear
correction estimates and shrinking-domain KAM/Nash–Moser iteration. Prove convergence and
invertibility of the composed coordinate maps and smooth regularity by
iteration/bootstrapping. These analytic prerequisites belong here, consuming PDE's scalar
Hölder/Schauder tools. A fixed-Hölder contraction using polydisc Cauchy–Green alone does
not give the required derivative control. This is not a consequence of real Frobenius
alone. LieGroupoidsPoisson consumes the eigensubbundle/involutivity dictionary and builds
their complex Lie algebroid structures.

The type bundles and Nijenhuis tensor have the following API:

- Type projections sum to the identity and commute with complex-linear pullback; conjugation exchanges their bidegrees.
- The Nijenhuis expression is tensorial and skew in its two arguments; the vanishing criterion agrees with involutivity and the compatible-atlas criterion.

**Checks.**

- For v=∂ₓ on ℂ, v^(1,0)=(∂ₓ−i∂ᵧ)/2 and v^(0,1)=(∂ₓ+i∂ᵧ)/2 sum to v; multiplication by J has eigenvalues i and −i respectively.
- For constant J and coordinate fields on ℂ², all four brackets in N vanish, so N=0; in complex dimension zero both eigenbundles are zero.
- On ℂ, ∂̄z=0 but ∂̄bar(z)=dbar(z); conjugation has real determinant −1 and cannot satisfy the holomorphic-map criterion.

*Needs:* ComplexManifolds Milestones 1–2; SmoothBundlesConnections B2; DifferentialGeometry §§0.1–1.3; K3.0; for Newlander–Nirenberg, the local homotopy and tame estimates above and PDE scalar Schauder theory.

### Examples

The identity complex chart gives N=0 and positive real determinant 1; conjugation reverses orientation.

### Dependencies

ComplexManifolds Milestones 1–2; SmoothBundlesConnections B2; DifferentialGeometry Layers 0–2;
K3.0; PDE's scalar Hölder/Schauder estimates for the stated Newlander–Nirenberg route.

## Layer 2: Dolbeault calculus and the local lemmas

### 2.1 Local calculus and the parameter solver (K2)

On an integrable complex manifold construct ∂ and ∂̄ on generic type forms and prove their
bidegrees, squares zero, anticommutation, graded Leibniz, conjugation and holomorphic-pullback
naturality. Prove the local Dolbeault–Grothendieck lemma for smooth `(p,q)` forms, q>0, on a
polydisc. First construct the following scalar inputs on arbitrary open plane domains.

For compactly supported smooth φ:ℂ→ℂ, define Tφ by the Bochner area integral
`Tφ(z)=(1/π)∫ φ(ζ)/(z−ζ) dA(ζ)`, with native Lebesgue area and positive basis (1,i).
Prove local integrability of the kernel, smoothness of Tφ, ∂̄Tφ=φ and
T(∂̄φ)=φ (Demailly I §3, Corollary 3.4, p. 21). Its weak normalization is
`∫ (1/(πζ))∂̄φ(ζ) dA(ζ)=−φ(0)`. The kernel's assigned value at ζ=z
has no effect on the integral because that singleton has area zero.

- T is complex-linear on compactly supported smooth inputs, commutes with translations
  and commutes with differentiation of fixed-support smooth families.
- A cutoff equal to one near a compact K expresses a holomorphic function near K by
  a kernel integral over the cutoff-derivative support, separated from K.

**Checks.**

- For a compactly supported smooth φ equal to 1 near 0, ∂̄Tφ(0)=1;
  reversing the kernel to 1/(ζ−z) would give −1.
- For φ=0, Tφ=0 and both ∂̄Tφ and T(∂̄φ) are 0.
- For a radial test with φ(0)=1, polar integration gives
  ∫(1/(πζ))∂̄φ dA=∫₀^∞φ′(r)dr=−1, fixing the sign and the factor π.

For an open Ω⊆ℂ and compact K⊆Ω whose complement in Ω has no relatively compact
connected component, prove uniform approximation of neighborhood-holomorphic functions
by functions holomorphic on Ω. Establish `finite_rank_runge_approximation`: for every open
U⊇K choose compact L⊆U∩Ω with K⊆int L; for each ε>0 there are finitely many
ζ_j∈int L and g_j holomorphic on Ω, independent of f, such that
`A_ε f=Σ_j f(ζ_j)g_j` obeys `sup_K|f−A_ε f|≤ε sup_L|f|` for every f holomorphic
on U. For empty K take L=∅ and the zero operator, interpreting the suprema as zero.
Equivalently, the acceptance signature requires the pointwise error bound εB for
every B≥0 that bounds |f| on L; L is chosen before ε, and the evaluation points and
output functions before f and B. The no-hole hypothesis means that for every
z∈Ω∖K the ambient closure of its component in Ω∖K is not both compact and contained in Ω.
The scalar Runge input is Rainer, Theorems 11.1 and 11.7, pp. 25 and 29;
the uniform operator estimate is a consequence to prove here: apply the cutoff formula,
uniform finite-sum approximation of its separated kernel, Cauchy estimates on a smaller
collar inside L, and approximation of the finitely many resulting kernel functions.
Prove those uniform estimates, including the bound by sup_L|f|; pointwise choices of
approximants depending on f do not imply the operator statement. Construct compact
Runge exhaustions of every open Ω, with K_j⊆int K_(j+1) and union Ω, by filling
relatively compact complementary components of native compact exhaustions.

- The approximation maps are complex-linear with fixed evaluation points and output
  functions, so preserve holomorphic parameters and commute with smooth parameter derivatives.
- Cauchy estimates on nested collars upgrade uniform errors to any specified finite
  collection of derivative errors on smaller compacta.
- Restrictions to smaller compacta preserve the approximation bounds; empty and
  disconnected domains use the same exhaustion and approximation statements.

**Checks.**

- For K=∅, N=0 and f=0, each displayed supremum and finite sum is 0.
- For K={0}⊂Ω=ℂ, A f=f(0) has rank one and error 0, whereas A=0 has error 1
  on f=1 and fails for ε<1.
- For K={2≤|z|≤3}⊂{|z|<4}, the missing Runge hypothesis matters: the period of
  1/z on |z|=5/2 is 2πi while every disk-holomorphic approximant has period 0.
  On Ω={1<|z|<4}, that K has no relatively compact complementary component and
  1/z itself is an admissible approximant with error 0.

*Needs:* Native area integration and finite-dimensional complex calculus; compact
exhaustions and smooth cutoffs; Cauchy coefficient estimates and the scalar Runge,
separated-kernel and filled-complement arguments specified above.

For whole-open-polydisc exactness and successive Dolbeault elimination, prove one joint
parameter-dependent one-variable solver `mixed_parameter_solver`. Let P be a finite-dimensional
Hausdorff second-countable smooth parameter manifold without boundary,
Q⊆E any open domain in a finite-dimensional complex normed space E (including punctured-plane factors), and Ω⊆ℂ any open
plane domain. For jointly smooth `f:P×Q×Ω→ℂ` with `∂̄_{q_j}f=0` for every complex parameter
coordinate, construct jointly smooth `u` with `∂̄_z u=f` and `∂̄_{q_j}u=0`. This includes
Q=P=point (the scalar case), Q=point with general P (smooth parameters), and P=point with
holomorphic Q (holomorphic parameters). Do not restrict Q to a polydisc, and do not patch with a
partition of unity in Q.

The parameter solver preserves the following structure:

- The solution is jointly smooth on P×Q×Ω and holomorphic in Q for every fixed p and z.
- The Wirtinger equation is required only at q∈Q and z∈Ω; no extension regularity is imposed outside that open product.

**Checks.**

- For real p and complex q, f(p,q,z)=pq admits u=pq bar(z): uₓ=pq, uᵧ=−ipq, hence (uₓ+i uᵧ)/2=pq; the q-antiholomorphic derivative is zero, also on Q=ℂ∖{0}.
- With P and Q points and f=1, u=bar(z) gives ∂̄u=1 on every Ω; u=z gives 0 and is not a solution.
- If Q or Ω is empty, the equation has no evaluation points and u=0 satisfies every on-set condition; for Ω=ℂ and f=0, u=0 also works.

*Needs:* This section’s fixed-support Cauchy–Green and finite-rank Runge targets; real differentiation under a compactly supported integral; parameter-chart partitions of unity.

**Parameter Cauchy–Green.** Prove the following lemma for this solver. For a fixed
`χ ∈ C_c^∞(Ω)` independent of all parameters and jointly smooth `f` on
`P × Q × Ω`, extend `χ f(p,q,·)` by zero and apply this section's fixed-normalization
Cauchy–Green operator `T` (Demailly I §3, Corollary 3.4, p. 21).
The parameter differentiation assertions below are consequences of that fixed-support
integral and differentiation under the integral, rather than part of the cited corollary. The map `(p,q,z) ↦ T(χ f(p,q,·))(z)` is jointly `C^∞`;
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
`T f_j` is holomorphic on a neighborhood of `K_{j-1}^+`. Apply the fixed finite-rank
operator `A_j`, chosen for `K_{j-1}^+` and a compact collar `L_j` inside that holomorphy
neighborhood, and set `u_j=T f_j−A_j(T f_j)`; for the finitely many initial indices use
`u_j=T f_j`. Thus `∂̄_z u_j=f_j`, and on each fixed earlier compact the tail is bounded by the
preceding operator-norm error
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
Define the Dolbeault complex in `ModuleCat ℂ` using K1's complex scalar action, and prove
`∂̄` and the induced maps on `H^(p,q)_∂̄(M)` and its quotient modules are complex-linear.
Define its quotient maps, functoriality, wedge product and identification of `H^(p,0)` with
holomorphic p-forms. Construct the sheaves
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

The Dolbeault complex and holomorphic-form sheaves have the following API:

- The differential squares to zero and the quotient maps are complex-linear; pullback and wedge descend to cohomology.
- In degree q=0 the kernel is the holomorphic p-form space; the sheaf comparison respects restriction and products.

**Checks.**

- On a point, H^(0,0)=ℂ and all positive-degree forms are zero; the local exactness theorem requires q>0.
- On a polydisc, dbar(z_j)=∂̄bar(z_j), so its positive-degree Dolbeault class is zero.
- On two isolated points, the holomorphic functions are ℂ²; (0,1) is locally constant and not globally constant.

*Needs:* Layer 1 type calculus; this layer’s parameter solver; Mathlib sheaf cohomology; for bundle coefficients, Layer 4 section sheaves.

### Examples

The right-hand side pq on a punctured parameter plane has the solution pq bar(z).

### Dependencies

Layer 1; §2.1 scalar analytic inputs; Mathlib sheaf cohomology; Layer 4 for the bundle-valued comparison.

## Layer 3: analytic germs and subvarieties

### 3.0 Realification and analytic comparison (K3.0)

K3.0 supplies K1's holomorphic/analytic comparisons. Consume the native
`TauCeti.Analysis.Complex.CauchyIntegralPolydisc` polydisc Cauchy formula,
`DifferentiableOn.analyticOnNhd_of_finiteDimensional` and
`TauCeti.analyticOnNhd_iff_differentiableOn_of_finiteDimensional`, including
finite-dimensional complex domain, complete codomain and open-set hypotheses.
Consume its `TauCeti.analyticAt_circleIntegral` and
`TauCeti.analyticOnNhd_circleIntegral` for jointly analytic integrands near
the parameter set times the integration circle. Prove Osgood separate
holomorphy and its locally uniform contour bounds, then use that joint
analyticity with the native parametric integral theorem. Consume Mathlib's
one-variable Cauchy APIs as well; construct the manifold/chart transports.
Use `AnalyticAt.restrictScalars` on the resulting analytic
chart transitions and inverses, followed by `AnalyticAt.contDiffAt`, to build
the realified atlas's `HasGroupoid M (contDiffGroupoid ω 𝓘(ℝ,E))`, equivalently
real `IsManifold 𝓘(ℝ,E) ω M`, as stated by `realified_isManifold_analytic`.
This local transition-map theorem also holds without global Hausdorffness or second
countability. Its underlying smooth structure agrees with
ComplexManifolds Milestone 1. Export the real-analytic transition and local defining-equation
comparisons required by K6's analytic-set triangulation. Use the native
`contDiffGroupoid` at order ω; no separate analytic groupoid carrier is needed.

The realified atlas comparison has the following API:

- The real analytic transition maps are the same set maps on the same chart sources and targets.
- Restriction of a complex analytic chart or its inverse agrees with scalar restriction of its derivative.

**Checks.**

- For the complex chart transition z↦iz, the real matrix is ((0,−1),(1,0)), with determinant 1 and analytic inverse z↦−iz.
- For E=0, the unique transition has a zero-dimensional derivative and is real analytic; there is no positive-dimensionality requirement.
- The transition z↦bar(z) is real analytic but not complex differentiable: D(i)=−i differs from iD(1)=i. The theorem does not assert the converse.

*Needs:* Tau Ceti finite-dimensional Cauchy analyticity; `AnalyticAt.restrictScalars`; native analytic `contDiffGroupoid`.

### 3.1 Holomorphic stalks (K3.HolomorphicStalk)

Define holomorphic germs on every finite-dimensional complex domain E using
the analytic/smooth sheaf stalk carrier; retain its chosen point, local
coordinates and convergent multivariable power-series comparison. Consume
`smoothSheafCommRing`, its `IsLocalRing` stalk instance and `isUnit_stalk_iff` after K3.0
identifies analytic and complex-smooth sections. Supply restriction/pullback and the
maximal-ideal comparison. Consume `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` for
the identity theorem. Develop several-variable convergent power-series comparisons. Prove
Weierstrass preparation and division with their precise uniqueness: when `w ↦ f(0,w)` has
finite order d, the germ is a unit times a monic degree-d polynomial with holomorphic coefficient
germs vanishing at the origin (Demailly II §2, Theorems 2.1 and 2.3, pp. 79–81). Construct the contour/power-sum proof and Newton
identities, using ContourIntegration's residue/argument-principle inputs and K3.0
parameter dependence. Consume `MvPolynomial.mul_esymm_eq_sum` for Newton identities and
align the factorization API with `PowerSeries.IsWeierstrassFactorization`.

The holomorphic stalk API includes:

- Units are exactly the germs nonzero at the chosen point; the maximal ideal is the kernel of evaluation.
- Germ restriction and pullback agree with representatives and convergent power series; preparation and division retain their uniqueness.

**Checks.**

- At the point of ℂ⁰ the stalk is ℂ, its maximal ideal is zero and every nonzero constant is a unit.
- At 0∈ℂ the coordinate germ z has value 0 and is a nonunit; its order is 1.
- The germ 1+z at 0 has value 1 and inverse germ 1/(1+z); treating every nonconstant germ as a nonunit would fail.
- In the one-variable stalk, (z²,z³)=(z²) and z²(1+z) has two factors z up to the unit 1+z; in two variables zw has the two nonassociate prime factors z and w.
- The analogous real smooth stalk is not a domain: the smooth germs exp(−1/x) on x>0, extended by zero, and its reflection are both nonzero but their product is zero. The complex smooth sheaf in the theorem is essential.

*Needs:* K3.0; native `smoothSheafCommRing`, `isUnit_stalk_iff` and analytic identity theorem; ContourIntegration residue/argument principle.

### 3.2 Meromorphic germ fields (K3.MeromorphicGermField)

For
`a∈ℂ`, use K3's holomorphic stalk O_a and its comparison with holomorphic
neighborhood representatives in native `Filter.Germ (𝓝 a)`. Prove O_a is
a domain by the identity/isolated-zero theorem and construct
`K_a=FractionRing O_a`. Identify it with a field structure on the subring of punctured
`Filter.Germ (𝓝[≠] a)` represented by native `MeromorphicAt f a`.
Use `MeromorphicAt`'s finite-power analytic characterization and
`meromorphicOrderAt_eq_int_iff`; the zero germ is treated separately.
Prove the holomorphic-to-punctured map is injective, every fraction has a
finite pole, every such punctured germ is a fraction, and all operations
commute with these maps. For a specified local biholomorphism taking a to b,
prove the pullback comparison with K_b and its local-inverse identities.

Derive the finite principal-part and regular-germ comparison directly from the
native finite-power characterization of `MeromorphicAt`:
choose N≥0 and an analytic germ h with `f(z)=(z-a)^(-N)h(z)` on a
punctured neighbourhood, split its convergent Taylor expansion as
`h(z)=Σ_(j<N)c_j(z-a)^j+(z-a)^N q(z)`, and identify the resulting
finite principal part and holomorphic germ q. Prove that changing N,
shrinking the neighbourhood or changing a punctured representative gives
the same principal coefficients and regular germ. Prove uniqueness by
multiplying the difference by a sufficiently high power and comparing the
Taylor coefficients below that power. Include N=0 and the zero germ.
Identify the negative Laurent coefficient of order -k, k≥1, with
`(2πi)^(-1) ∮_(|z-a|=ρ) f(z)(z-a)^(k-1) dz` for every
sufficiently small positive ρ. Use native Cauchy coefficient formulas and
annulus integral invariance to prove radius independence and agreement with the Taylor construction.
Transport restriction, finite sums/products and differentiation to this
field; in the product formula a fixed negative coefficient is a finite
convolution because both input Laurent series are bounded below. Prove
these comparisons with the native analytic factorization and all existing
field maps, rather than selecting a second generic Laurent construction.
Identify the regular subring with O_a and its value-at-a ring homomorphism
to ℂ; the arbitrary value assigned to a meromorphic representative at its
centre is never used. K3.MeromorphicGermField consumes the stalk/identity
foundation and native analytic/meromorphic APIs, and
precedes applications needing scalar meromorphic coefficient germs. It
has no QFT prerequisite. General isolated essential-singularity and global
Mittag–Leffler constructions retain their GlobalHolomorphicFunctions owner.

The meromorphic germ field API includes:

- The embedding of the holomorphic stalk into its fraction field and punctured germs is injective and respects all field operations.
- The finite principal part and regular germ are independent of the representative, cutoff radius and chosen pole bound; regular evaluation uses the regular germ.

**Checks.**

- At 0, z⁻¹ has order −1, residue 1 and regular part 0; its value at the removed point does not alter the germ.
- At 0, exp(1/z) has infinitely many negative Laurent terms, so it is not a finite-pole meromorphic germ.
- The zero germ has principal part 0 and regular value 0; the germ 1+z has no principal part and regular value 1.

*Needs:* Holomorphic stalk domain and identity theorem; native Taylor and Cauchy coefficient formulas; native `MeromorphicAt` and `FractionRing`.

Prove the analytic local rings are Noetherian and factorial of dimension n, with regular
parameters. The native stalk statements are `holomorphicStalk_noetherian` and
`holomorphicStalk_factorial` (Demailly II §2, Theorems 2.7 and 2.10, pp. 81–83);
like realification, these local assertions need no global separation or countability assumption. Follow Griffiths–Harris, *Principles of Algebraic Geometry*, chapter 0 §§1–2, and Demailly, chapter II: prove local parametrization of
a pure-dimensional analytic germ by a finite branched projection to a polydisc,
elimination under finite projections, density of regular points and dimension/finite-fiber
formulas. Prove the hypersurface weak Nullstellensatz: for irreducible f, a germ h
vanishing on the zero germ of f is divisible by f. Prove Rückert's Nullstellensatz
`I(V(𝔞))=√𝔞` for every ideal 𝔞 of the convergent local ring using local parametrization.
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
germs generate the relation module at every point of V.

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
locally specified by a finite holomorphic tuple.
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
nowhere-dense analytic subset extend across it. Prove Hartogs extension across an analytic subset
A with `dimℂ A ≤ n−2` in an n-dimensional complex manifold, without a boundedness
assumption. No extension theorem for arbitrary singular ambient spaces is asserted. Work
out the node `z²=w²+w³` and cusp `z²=w³`, distinguishing global irreducibility from local
analytic branches on the actual zero sets and germs.

Reduced analytic subsets and their regular-locus manifolds have the following API:

- Restrictions preserve the reduced ideal and the regular/singular partition; regular-locus inclusions are holomorphic embeddings with the induced topology.
- Local irreducible branches and global irreducible components are distinguished, with dimension drop for the singular locus.

**Checks.**

- The crossing zw=0 has two smooth complex one-dimensional branches; the origin is singular of complex dimension 0.
- The cusp z²=w³ has one local analytic branch and singular locus {0}; a two-branch model gives the wrong local decomposition.
- A finite reduced set of points has dimension 0 and empty singular locus; the empty analytic subset contributes no regular component.

*Needs:* K3.0 and local Weierstrass/Nullstellensatz/coherence theory; Layer 1 submanifold charts; RealAnalyticGeometry R1 for the finite regular-piece partition.

### Examples

The coordinate germ z is a nonunit, 1+z is a unit and z⁻¹ lies in the fraction field.

### Dependencies

Tau Ceti finite-dimensional complex analysis; native holomorphic stalks and Taylor/Cauchy coefficient formulas;
ContourIntegration; Layer 1 for regular-locus manifolds; RealAnalyticGeometry R1 for component finiteness.

## Layer 4: holomorphic and Hermitian bundles

### 4.1 Holomorphic section sheaves and connections (K4)

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
morphisms and pullbacks, on these actual carriers. This fixed-model theorem follows the locally free sheaf/cocycle comparison
(Demailly II §3, (3.1)–(3.3), pp. 83–85). It does not identify a varying-rank sheaf with a single `VectorBundle ℂ F E`;
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
`F_C=(Fin (r C) → ℂ)` on C and ComplexManifolds's native fixed-F construction there.
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
local systems; recover the equivalences of isomorphism groupoids as well.
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

The holomorphic connection and componentwise bundle API includes:

- The section/sheaf reconstruction maps are inverse on objects and morphisms; pullback carries the component rank function along the component map.
- Chern and holomorphic connections have their specified, distinct curvature types; flat transport agrees with the chosen monodromy frame.

**Checks.**

- For a trivial Hermitian line with h=1, the Chern matrix and curvature are 0; for h=exp(|z|²), A=bar(z)dz and Θ=dbar(z)∧dz, which is not a holomorphic-connection curvature on a curve.
- On three points with ranks (0,1,2), the section space is 0×ℂ×ℂ² of dimension 3; it is not a fixed-rank bundle over all three points.
- On a countable discrete base with rank r at the rth point, all stalks are finite-dimensional and the ranks are unbounded; the empty base has the zero section space.

*Needs:* ComplexManifolds Milestone 7; SmoothBundlesConnections B2–B5; Layers 1–3; for flat correspondence, native fundamental groupoids and parallel transport.

### Examples

Rank (0,1,2) on three components is the basic reconstruction and morphism test.

### Dependencies

ComplexManifolds Milestone 7; SmoothBundlesConnections B2–B5; Layers 1–3 and native sheaf/groupoid carriers.

## Layer 5: compact Hermitian elliptic theory and Serre duality

### 5.1 Real and complex analysis on real manifolds (K5a)
 This shared
layer uses DifferentialGeometry, SmoothBundlesConnections B2–B4, PDE Lane A.3,
[VariationalMethods §§2–5](../VariationalMethods/README.md),
[UnboundedOperators UO-D06](../OperatorTheory/UnboundedOperators/README.md),
AlgebraicTopology and Mathlib, and HopfRinow Layer 1's Levi-Civita connection
directly. Construct its pointwise real star, orientation and density lines first,
then its finite-order differential operators, symbols and transposes below.
Distributional action and Laplace analysis use that core. It precedes the complex-manifold
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

Pin the pointwise product on exterior forms by Gram determinants, making increasing wedges
of an orthonormal real coframe orthonormal (not summing over all ordered tuples).
On an oriented real inner-product space V of dimension m construct the
pointwise Hodge star on all exterior degrees, with vol the native
`Orientation.volumeForm` (including its signed degree-zero value), characterized by
`α∧*β=⟨α,β⟩vol`, with `*²=(−1)^(k(m−k))` on degree k. Prove isometry,
oriented-isometry naturality, orientation-reversal sign and wedge/contraction
adjoint identities. Transport smoothly to real cotangent/exterior bundles.
Construct the orientation line from the sign-of-determinant tangent-frame
transition cocycle, identifying its square with the trivial line and its
oriented trivializations with DG's orientations. Without orientation the
star codomain is twisted by this line and its local sign changes glue.
This pointwise algebra precedes the elliptic scale
and is the shared supplier for RiemannianGeometry and SpinGeometry's
Clifford–star/chirality comparison.
Complex-linearly extend this real star to the complexified exterior algebra.
Pin `α∧*β=B_ℂ(α,β)vol=⟨bar α,β⟩_Gram vol`, where B_ℂ is the bilinear
extension of the real Gram product and the Hermitian product is
conjugate-linear in its first slot. Define `barStar β=*(bar β)` already
on these complexified real forms and prove
`α∧barStar β=⟨β,α⟩vol`. For a finite-dimensional orthogonal complex
structure on the real fiber, prove the pointwise (p,q) type law for this
star and barStar on its complexified exterior algebra. This algebra uses
no integrability or holomorphic bundle. K5b transports that law to its type bundles.

First equip DG's actual `Density V (finrank ℝ V)` with pointwise
`AddCommGroup` and `Module ℝ` extending DG's existing pointwise `SMul ℝ`,
and prove evaluation on any basis is a
linear equivalence with ℝ. Transport its rank-one topology through this
equivalence, proving basis independence and continuity of the |det| action.
Construct the smooth real density line bundle on M with local
transition |det D(chart change)|, its dual/tensor and pullback maps, and construct
its `ContMDiffVectorBundle ∞` structure. Identify its smooth sections with
chart-smooth values of DG 5.5's `RoughDensity` carrier; scalar-extend it
to 𝕜 for complex coefficient bundles. Define
the density-valued dual-bundle test space as the compactly supported smooth sections,
using native `ContMDiffSection` with `ContMDiffVectorBundle ∞`, and fixed-compact
derivative seminorms. Prove equivalence with chart/frame seminorms and independence
of atlas and auxiliary connection on each fixed compact support. Equip it with
the final locally convex topology for the native `TestFunction Ω F ⊤`
chart/frame extension maps. Pin those maps by their pointwise extension-by-zero
formula and prove the universal continuity criterion: a linear map into a
locally convex space is continuous iff its compositions with every such native
test map are continuous. Prove this topology equals the fixed-compact inductive
limit and its real/complex scalar compatibility. Define
the bundle-distribution space as the continuous 𝕜-linear dual of those tests,
with compact-convergence topology, matching native Distribution. Keep the
pointwise topology of native TemperedDistribution distinct; prove the
localized test-pairing maps into these carriers continuous, using uniform
estimates on compact test families, without silently identifying topologies.
Consume Mathlib `TestFunction Ω F ⊤`, its LF topology and
`TestFunction.continuous_iff_continuous_comp`, and `Distribution Ω F ⊤`.
Build frame/chart/restriction/gluing comparisons with native real-test
F-valued distributions. For 𝕜=ℂ, complex-linearly extend real tests; prove
compatibility with `TemperedDistribution`'s complex-test convention.
After the differential-operator and density-transpose construction below, construct
the action of differential operators on distributions by the
bilinear transpose on E*⊗density tests. Prove compactly supported
Euclidean distributions extend uniquely to tempered distributions after
cutoff, with the explicit test-pairing and cutoff-independence on their
support. Prove finite derivative order on each fixed compact support.

The star, density line, tests and distribution carriers have the following API:

- The real star is isometric and reverses sign with orientation; its complex-linear extension and conjugate-linear dual variant retain their stated wedge identities.
- Density transition maps use the absolute determinant; tests extend by zero from chart frames and their final locally convex topology has the stated universal property.
- Distribution restriction, gluing and differential-operator action agree with their bilinear density test pairings.

**Checks.**

- In the oriented plane, *dx=dy and *dy=−dx, hence *²dx=−dx; in dimension 0 with positive orientation *1=1.
- A real coordinate change with derivative −2 multiplies density by 2 and orientation by −1; a signed determinant is not the density transition.
- For the line bundle over one point, the test space and its continuous dual are ℂ with the usual topology; evaluation at 1 distinguishes this from an indiscrete test topology.
- On an empty base the test and distribution spaces are zero; on a point, δ(1)=1, ruling out the zero pairing.
- For the planar two-form dx∧dy, u=bar(z)/(2i) satisfies ∂̄u=1/(2i)
  and d(u dz)=dx∧dy; using −1/(2i) would give −dx∧dy. The denominator 2i is nonzero.
- For P=∂ₓ and density dx, ∫(∂ₓf)g dx=−∫f(∂ₓg)dx on compact supports, so Pᵗ=−∂ₓ; for P=x∂ₓ the transpose is −x∂ₓ−1.

*Needs:* DifferentialGeometry §§0.1–0.4, 5.5; SmoothBundlesConnections B2–B4; native test functions and distributions; the differential-operator construction below for operator transpose.

#### Finite-order operators, jets and density transpose

For finite-rank smooth real or complex bundles E,F over a boundaryless smooth real
manifold M, construct the space of scalar-linear differential operators
Γ∞(E)→Γ∞(F) of order at most m, m≥0, using smooth local coefficient expressions
`P=Σ_(|α|≤m) a_α ∂^α`. Construct the linear jet bundle J^m E by equality of
coordinate Taylor coefficients through order m and the chain-rule transition maps.
Prove that such operators are exactly smooth bundle maps J^m E→F composed with
j^m, equivalently the linear operators whose (m+1)-fold commutators with scalar
multiplication vanish. Include restriction, smooth section-module structures and the
local Hadamard argument needed by that equivalence; no locality-only hypothesis
is substituted for bounded order. The finite jet and truncation construction follows
Kolář–Michor–Slovák §§12.2–12.5, pp. 117–119 and §§12.16–12.17, pp. 124–125.

- Jet truncation commutes with restriction and frame changes; the kernel of
  J^m E→J^(m−1)E is Sym^m(T*M)⊗E for m≥1, while J^0 E=E.
- Operators compose with addition of order bounds. Their top coefficient gives a
  homogeneous bundle map Sym^m(T*M)⊗E→F; its polynomial symbol is invariant under
  coordinates and frame changes and independent of the connections used for a
  symmetrized covariant-derivative expansion.
- In real geometric convention the top polynomial is Σ_(|α|=m)a_α ξ^α;
  in Fourier convention it is Σ_(|α|=m)a_α(iξ)^α, complexifying real bundles.
  With [P,f]=PM_f−M_fP, the repeated commutator with f, divided by m!, is the
  geometric symbol at df; composition multiplies principal symbols in order.

**Checks.**

- For m=0, J^0 E=E and multiplication by 3 has symbol 3; its commutator with x is 0.
- On ℝ, [[∂²,x],x]=2Id and the third commutator is 0; division by 2! gives 1.
  At ξ=2 the geometric and Fourier symbols of ∂² are 4 and −4.
- On a point, J^m E=E for every m and the positive-order symbol is 0;
  for the zero bundle every jet fiber is 0.
- On ℝ, j²₀(x²) has Taylor coefficients (0,0,1) and truncates to (0,0);
  under x=2y its quadratic coefficient becomes 4, as does the tensor (dx)²=4(dy)².
- The order-zero matrices e₁₂ and e₂₁ have commutator diag(1,−1), of order zero;
  an order-drop law without commuting top symbols would fail.

Construct the bilinear density transpose
Pᵗ:Γ∞(F*⊗Dens)→Γ∞(E*⊗Dens) by
`Pᵗψ=Σ_α(−1)^|α| ∂^α(a_α^t ψ)` in density coordinates, and prove that
these formulas glue by compact-support integration by parts. For chosen smooth
positive density and fiber metrics construct the formal metric adjoint
P†:Γ∞(F)→Γ∞(E); it includes complex conjugation, unlike Pᵗ.
Both are characterized by their integration identities for compactly supported
sections. For a metric connection ∇ on E, prove that its negative metric trace
of the second covariant derivative equals ∇†∇ and has Fourier symbol |ξ|²_g Id.
Define Laplace type with scale c>0 by order at most two and symbol c|ξ|²_g Id,
including c=1 and finite-rank real/complex bundles.

- Transpose and formal adjoint reverse composition, are involutive under the
  natural double-dual identifications and commute with restriction to open subsets.
- The formal-adjoint Fourier symbol is the fiber adjoint of the Fourier symbol.
  Distributional action is defined by ⟨Pu,ψ⟩=⟨u,Pᵗψ⟩, with these exact test bundles.
- The connection Laplacian has energy ∫⟨u,∇†∇u⟩=∫|∇u|² on compact supports;
  positive rescaling multiplies its symbol and energy by c.

**Checks.**

- With density dx, (∂ₓ)ᵗ=−∂ₓ and (x∂ₓ)ᵗ=−x∂ₓ−1;
  omitting the derivative of the coefficient loses the term −1.
- Multiplication by i has bilinear transpose i but Hermitian adjoint −i;
  these agree on real multiplication by 2, where both are 2.
- On the circle, ∇=d gives ∇†∇ exp(ikx)=k² exp(ikx), with eigenvalues
  0,1,4 for k=0,1,2. For the zero fiber both the operator and its energy are 0.

*Needs:* This section’s density line; native smooth sections; SmoothBundlesConnections
B2–B4 bundle operations and induced connections; DifferentialGeometry §5.5 integration;
HopfRinow Layer 1 Levi-Civita connection; local Taylor/chain rules and Hadamard factorization.

### 5.2 Distribution local structure (K5a.DistributionLocalStructure)
 Own the continuous-primitive and supported
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
`D^mH_m=δ` and the pairing identity give `D^mF=w`, hence `D^mF=u` on J.
Own this compact distribution–finite-regularity convolution API, not just
the name of a convolution. The order is that of w, not of an unspecified
uncut distribution.

Own the supported finite-jet structure on these same carriers (Hörmander,
The Analysis of Linear Partial Differential Operators I, Theorem 2.3.5). For a closed embedded submanifold S of
codimension q, in every product normal chart (y,z), prove that a distribution
supported in S has a locally finite-order expression
`u=Σ_(|α|≤N)u_α(y)⊗∂_z^αδ(z)` on compact chart stages, with unique
tangential distribution coefficients. N may depend on the compact stage.
Construct coefficients by proper normal projection of z^β times u with a
cutoff equal1 near S, giving `(-1)^|β|β!u_β`, and prove the Taylor/Hadamard
remainder argument that the remaining distribution vanishes. Prove restriction,
chart/density/bundle transport and compatibility of finite stages; coordinate
normal jets transform by their actual normal-jet law. For S a point, deduce
finite delta-derivative sums and linear independence. For scalar pullback under
positive dilation prove `∂^αδ` has degree−q−|α|. The generic support/structure
theorem is supplied here; application-specific scaling and wavefront ambiguity
bounds belong to their consumers.

For every real n≥1 own the distribution nonextension example
`exp(1/‖x‖²)` on the punctured Euclidean space. Choose a nonzero nonnegative
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

The local distribution structure API includes:

- Finite-order extensions agree on smooth tests and are independent of auxiliary cutoffs near the fixed compact support.
- Normal-jet coefficients are unique on each compact chart stage and transform by the normal-jet law.

**Checks.**

- For w=δ₀ and m=2, H₂(x)=max(x,0) is continuous and D²H₂=δ₀; replacing it by a smooth primitive is impossible.
- For u=δ′₀, pairing x u with a test equal to 1 near 0 gives −1, agreeing with (−1)¹1!; the opposite derivative convention gives +1.
- For the compact test equal to 1/(1+2x) near 0, the pairings with δ^(n)/n! are 1,2,4 at n=0,1,2, and partial sums are 1,3,7.

*Needs:* The LF tests and compact finite-order bounds of §5.1; native finite-order distributions; smooth cutoff/mollification and Taylor remainder formulas.

### 5.3 Smooth-section Montel theorem (K5a.SmoothSectionMontel)
 For a finite-dimensional second-countable Hausdorff smooth manifold M and a finite-rank real or complex smooth bundle E, use the preceding complete compact-C^k Fréchet section topology. Prove that every bounded subset has compact closure: on each compact chart/frame set apply Arzelà–Ascoli to every derivative using the next derivative bound, choose a diagonal subsequence along the countable exhaustion and derivative orders, and show the limits are compatible smooth sections. Include finite/disconnected and compact M. Install the native `MontelSpace` instance from `Mathlib.Analysis.LocallyConvex.Montel`; do not define another Montel predicate. Consume its `ContinuousLinearEquiv.toCompactConvergenceCLM` (and its pointwise apply laws) for the continuous-dual strong/compact-convergence comparison, supplying the native Hausdorff and scalar/module hypotheses. Its two continuity directions use that compact sets are von Neumann bounded and every von Neumann bounded set lies in its compact closure. The new target here is the smooth-section Montel instance and its bundle/density adapters, not a duplicate generic dual-topology theorem. Transport through the section/density trivializations already constructed here. This comparison supplies E′ on Euclidean configuration spaces and on the compact real sphere; it does not identify the LF compact-test dual topology or the pointwise Schwartz-dual topology with either topology by notation.

The smooth-section Fréchet topology has the following API:

- The compact-derivative seminorm topology is complete, independent of frames and compatible with restriction.
- Bounded sets have compact closure, and the induced dual comparison respects the actual section/test pairings.

**Checks.**

- On one point, smooth sections of the trivial line are ℂ and the bounded unit disk has compact closure; on an empty base the section space is zero.
- On ℝ the functions sin(jx) have sup norm at most 1, but their first derivatives have value j at 0, so they are not bounded in the smooth-section topology.
- On the discrete base ℕ, sections are ℂ^ℕ with product topology; the sequences with each coordinate in the closed unit disk form a compact set even though the base is not compact.

*Needs:* The countable compact-chart seminorm construction, Arzelà–Ascoli and compatibility of derivative limits; native `MontelSpace` and its continuous-dual comparison.

### 5.4 Geometric Sobolev spaces and elliptic realization

For compact M define H^s(M;E), s∈ℝ, as the subspace of
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
between complexified tests and pairs of real tests given by
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
the real bundle-distribution space by the inverse extension. Prove real chart
independence, norm equivalence, density and all scale/duality/regularity
comparisons on this actual carrier. The same construction defines real
H^s_loc using the compact localization seminorms. Consume SBC B2's
isometric geometric `L²(V_ℂ)` complexification identity, using pairs of
real L² sections and its real/imaginary-part maps on the complete
almost-everywhere quotient. Prove conjugation has exactly the real L²
image as fixed points. At s=0, compose that identity with the distribution extension
to give H⁰(M;V) ≃L[ℝ] L²(V), with the same distributional
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
`exp((z/2) log(1+|ζ|²))`. Prove temperate growth at each z, analytic
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
for every bundle differential operator P from §5.1 of integer order at most m≥0,
prove P : H^(s+m)(M;E) →L[𝕜] H^s(M;F) for every real s
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
u ↦ Au : H^s(M;E) →L[𝕜] H^s(M;F) for every real s,
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
Laplace-type layer uses §5.1's differential operators, not the general
calculus or P1.1's Peetre theorem. Prove BundleSobolev E 0 and B2's
geometric L² have the same distributional image and equivalent norms, using
`TemperedDistribution.memSobolev_zero_iff`, the distribution map
`s ↦ (φ ↦ ∫ φ(s))`, the chart metric/density bounds
and B2's chart isometries. This gives a continuous linear equivalence, not
an isometry for the pinned atlas norm. Every formal adjoint, self-adjoint
realization, harmonic projection and orthogonal Hodge splitting uses B2's
inner product ∫⟨s,t⟩_h dμ; the atlas H^s inner products provide the Hilbert
scale and compactness. Compare §5.1's formal density adjoints with that
geometric L² pairing even on nonorientable real manifolds, and prove the
real de Rham instantiation on this shared API.

Own the complex-linear manifold top-form integration and pairing API by real
and imaginary parts on DifferentialGeometry's carrier, proving agreement with
DG8.4's existing vector-valued simplex/chain integrals and Stokes. Use that
agreement for the complex-linear de Rham integration map and its naturality. On an
oriented real Riemannian manifold, extend compactly supported smooth top-form
integration to integrable `f dvol_g` through the L¹ density completion;
prove independence of the approximants. Combine DG 5.5's
`integralTopForm_eq_integralDensity` and 12.4's
`integral_riemannianVolume_eq_integralDensity` to prove
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
theorem to the four arcs, using DG's open-subtype flat adapter and DG1.5's comparison with
native `curveIntegral`. Their sum gives `Per(ω)=c_U−c_L`. Thus zero period makes the constants
equal; after one constant adjustment the two local primitives glue to a global smooth primitive.
For general `ω`, set `k=(2πi)⁻¹Per(ω)`; the closed form `ω−k dz/z` has zero period and is
exact, so `[ω]=k[dz/z]`. Since `Per(dz/z)=2πi`, `P([dz/z])=1` and `P` is a
complex-linear equivalence.
For the normalization, construct `dz/z` as a smooth form through DG0.3 and prove
`dz/z=β+iα` in the polar notation of DG1.5. Define `Log_+` as the principal logarithm on `V_+` with argument
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
compare the degree-two result with the specialization to `Ω=D` of the planar exactness consequence of Layer 2; this example adds no new dependency edge. Keep it on DG's existing form carrier.

Use §5.1's differential-operator carrier and Laplace-type predicate:
order at most 2 and Fourier principal symbol c|ξ|²_g Id for a fixed c>0.
Use §5.1's restriction-compatible symbol and formal-adjoint maps,
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
metric connection A, compatibly with §5.1's principal symbol and the Clifford relation. R5 owns its
Sobolev-coefficient perturbation estimates, gauge-specific identifications and
Coulomb slice.

For every formally self-adjoint nonnegative Laplace-type system on a compact
boundaryless base, identify its form and inclusion in B2's geometric L² with
[VariationalMethods §5.1](../VariationalMethods/README.md)'s
compact-pair specialization of
[UnboundedOperators §4.7 (UO-D06) `existsUnique_selfAdjoint_of_closed_form`](../OperatorTheory/UnboundedOperators/README.md).
Use the unique operator characterized by that representation theorem.
The representing graph is {(ju,f) | ∀v, a(u,v)=⟨f,jv⟩}; the form-domain
preimage is `CompactFormPair.operatorDomainV`. Consume §5.1’s
`CompactFormPair.exists_compact_selfAdjoint_shifted_inverse` and §5.2’s
`CompactFormPair.mem_operatorDomainV_iff_summable`.
UO-D06 owns general closed-form representation, real-shift self-adjointness,
both adjoint inclusions and witness independence; §5.1 applies these on the
identical form/inclusion data and owns its compact-pair comparisons. Prove
here that the operator domain and adjoint/maximal weak domain are H² by
elliptic regularity, thereby obtaining the specified geometric H² realization.
Prove the shifted energy form coercive on H¹ using its scalar principal part
and bounded lower-order coefficients. Consume
[VariationalMethods §§2.2–2.4](../VariationalMethods/README.md)'s RCLike
H-forcing map S_α : H → V and conjugate-linear dual-forcing map F_α : V* → V.
For a_α(u,v)=a(u,v)+α⟨ju,jv⟩, their equations are
a_α(S_α h,v)=⟨h,jv⟩ and a_α(F_α ℓ,v)=ℓ(v). At real scalars §2.2
identifies these with `IsCoercive.continuousLinearEquivOfBilin` and Tau Ceti’s
`IsCoercive.formSolutionMap`; complex Hermitian forms use its realification and i-test. Use H¹ Rellich and
[VariationalMethods §§3.1 and 4.3](../VariationalMethods/README.md)'s abstract compact-
embedding form/solution-operator spectral theorem, with
[§§5.1–5.3](../VariationalMethods/README.md)'s same-operator
compact-resolvent, graph/domain and eigen-expansion comparisons, to obtain
finite-dimensional kernel, complete smooth eigensections, Green inverse on
the kernel's orthogonal complement and its projection/recovery identities.
The geometric elliptic weak-domain identification and smoothness are owned
here; the abstract represented operator and compact spectral arguments are
consumed through those suppliers. For an energy form a(u,v)=⟨Du,Dv⟩,
consume §5.3's domain-restricted D₀†D₀ comparison, with
D₀(ju)=Du on range j; its domain is {ju | Du∈Dom D₀†}. The bounded
Hilbert adjoint of D : H¹ → L² has a different domain/codomain and cannot replace D₀†.
Apply the same construction to Δ_d and Δ_A;
PDO P7 and HamiltonianReduction R5 consume it for smooth reference operators
before their additional estimates.

Pin d* as the formal L² adjoint and the nonnegative Hodge Laplacian
`Δ=d*d+dd*`, `σ_F(Δ_d)=|ξ|²_g Id`. Prove its self-adjoint realization with
domain H² and compact resolvent by the shared estimates/weak-domain
identification, before constructing its eigensection decomposition. On
functions it is the negative of DG's `laplaceBeltrami=div∘grad`. Construct
harmonic projection and Green operator, the orthogonal harmonic/exact/coexact
splitting, and the de Rham Hodge theorem on compact real Riemannian manifolds;
identify its cohomology with DifferentialGeometry's de Rham object.
Own `d*=(−1)^(m(k+1)+1)*d*` on real k-forms of an oriented m-manifold
and `*Δ_d=Δ_d*`; PDO P1.1, Riem R7.4 and K5b consume these identities.

The geometric Sobolev space and realization API includes:

- Localization and reconstruction are inverse on geometric distributions; the compatible image is proved closed, giving completeness.
- Every admissible atlas gives equivalent Sobolev norms; at order zero the comparison with geometric L² is a continuous linear equivalence.
- The represented operator has the actual weak H² domain, with compact shifted inverse and smooth eigensections.

**Checks.**

- On a point with trivial line, choose χ₁=1: the section 1 has squared norm 1. An empty atlas gives Σχᵢ²=0≠1 and cannot represent this space; the empty base gives the zero space.
- On a point, two cutoffs χ₁=χ₂=1/√2 give squared norm 1/2+1/2=1 and reconstruction 1/2+1/2=1, excluding an unsquared partition convention.
- For a(u,v)=2 conj(u)v with j=id on ℂ, the graph gives Au=2u and (A+1)⁻¹u=u/3; the dual-forcing map sends ℓ(v)=cv to conj(c)/3 after shift 1.
- For D=2 id, the energy form is 4 conj(u)v and D₀†D₀=4 id; using D alone would give the wrong factor 2.

*Needs:* §§5.1–5.3, including the differential-operator core; PDE Lane A.3; SmoothBundlesConnections B2; VariationalMethods §§2.2–2.4, 3.1, 4.3, 5.1–5.3; UnboundedOperators UO-D06.

### 5.5 Planar Hodge and Laplacian conventions
 On an arbitrary open subset
of the Euclidean plane, use orientation `dx∧dy`, the standard metric, and the
complex-linear extension of the real Hodge star. Prove the coordinate comparisons
on DifferentialGeometry §0.3's rough-form carrier on the open subtype.
At regularity Cʳ, require every coefficient of an ambient representative to
satisfy `ContDiffOn ℝ r` on the open set, with r=1 or r=2 as specified below.
Use §1.1's exterior derivative of rough forms, and define the pointwise
codifferential by the star formula; restriction to the smooth-section carrier
of §0.4 agrees with the smooth formal L² adjoint on compactly supported tests:
`*1=dx∧dy`, `*(dx∧dy)=1`, `*dx=dy`, `*dy=−dx`, hence
`*dz=−i dz` and `*dbarz=i dbarz`. For a `C¹` complex-valued one-form
`α=P dx+Q dy`, prove
`dα=(∂ₓQ−∂ᵧP) dx∧dy` and `δ α=−(∂ₓP+∂ᵧQ)`.
For a top form with a `C¹` coefficient h,
`δ(h dx∧dy)=(∂ᵧh) dx−(∂ₓh) dy`; δ is zero on functions.
These are the actual coefficients of `δ=d*=−*d*` in real dimension2.
The formal-adjoint comparison uses compactly supported tests in the open set,
so it introduces no boundary condition on the pointwise formulas.

For forms with `C²` coefficients on the open set, prove `Δ_H=dδ+δd` acts
coefficientwise as the negative Euclidean Laplacian in every degree0,1,2.
For a `C²` complex-valued function u, use
`∂z=(∂ₓ−i∂ᵧ)/2`, `∂barz=(∂ₓ+i∂ᵧ)/2` to prove
`Δ_H u=−(∂ₓ²u+∂ᵧ²u)=−4∂z∂barz u`;
compare with native `Laplacian.laplacian` and DG's `div grad` sign.
Calibrate `Δ_H(x²+y²)=−4`, whereas `div grad(x²+y²)=4`.
For compactly supported smooth α, prove
`⟨Δ_H α,α⟩_L²=‖dα‖²_L²+‖δα‖²_L²`, using the Hermitian pairing for
complex coefficients. The coordinate formulas agree with the generic star,
formal adjoint and Laplacian through these comparisons, including restrictions
to open subsets. The smooth comparison is a separate restriction theorem: it
identifies these pointwise rough-form operations with the smooth form, star
and formal-adjoint constructions of this layer.
These formulas follow by specializing the Gram star and formal-adjoint
identities (Demailly, VI §3.1, (3.1)–(3.5), and §3.2, Theorem 3.9,
pp. 291–292), then using the C² equality of mixed derivatives; the
Wirtinger normalization is Demailly I (3.1), p. 20.

The finite-regularity planar comparison API includes:

- The rough-form identities commute with restriction to any smaller open set.
- At smooth regularity the pointwise codifferential agrees with the compact-support formal adjoint; C² coefficients suffice for the Laplacian identities.

**Checks.**

- For α=x dx+y dy, δα=−2 and dα=0; for α=x dy, dα=dx∧dy and δα=0.
- For h=x²+y², δ(h dx∧dy)=2y dx−2x dy and Δ_H h=−4, while the Euclidean Laplacian is +4.
- For u(x+iy)=|x|³, uₓₓ=6|x| and uᵧᵧ=0, hence Δ_H u=−6|x|, including 0 on x=0. This C² function is not C³ and must be admitted by the statement.
- On the empty open set the restriction carrier has a unique section and every pointwise identity is vacuous; no global extension is required.
- For a compactly supported smooth scalar u, integration by parts gives ∫conj(u)Δ_Hu=∫(|uₓ|²+|uᵧ|²), fixing the nonnegative sign.

*Needs:* DifferentialGeometry §§0.3, 0.4 and 1.1; §5.1 pointwise star and integration by parts; real C² mixed-derivative symmetry.

### 5.6 Compact component assembly (K5a.ComponentwiseCompact)

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
with the finite product of component bundle test spaces. For distributions,
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
bundle-distribution by component membership in H^s(C;E_C), and
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
Consume [VariationalMethods §3.1's finite orthogonal-sum transport](../VariationalMethods/README.md)
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

The compact component assembly API includes:

- Restriction and clopen extension by zero identify sections, tests and distributions with their finite component products.
- Geometric L² and the chosen Sobolev norm split isometrically with sum-of-squares norms; local operators, their adjoints and their domains split on the same components.

**Checks.**

- For three points with ranks (0,1,2) and section (0,1,(1,i)), the squared L² norm is 0+1+2=3 on either side of the component map.
- If the component operators are 0 on the zero fiber, 2 id on ℂ and 2 id on ℂ², eigenvalue 2 has multiplicity 1+2=3; the empty eigenbasis on the zero fiber contributes nothing.
- On two scalar components, a matrix exchanging the components has off-diagonal entries 1 and is not a local differential operator; the splitting claim excludes it.

*Needs:* Layer 4 component families; §§5.1–5.4 at fixed rank; VariationalMethods §3.1 finite sums and §5.1 graph characterization.

### 5.7 Local Hermitian identities (K5b.0)

Consume K1, K2, K4 and K5a's pointwise density/formal-adjoint layer.
The Gram/type/star identities, Dolbeault formal adjoint on compact supports
and principal symbol `σ(Δ_∂̄_E)(ξ)=½|ξ|²_g Id` below hold on arbitrary
Hermitian complex manifolds and their open sets, without compactness.
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
square identities, and the `(n−p,n−q)` type of K5a's `barStar β=*(bar β)`. Pin
`α∧barStar β=⟨β,α⟩dvol` and `∂̄*=−*∂*`. Consume K5a's
`*Δ_d=Δ_d*` and prove `barStar Δ_∂̄=Δ_∂̄ barStar`.
For a Hermitian holomorphic bundle E construct conjugate-linear
`barStar_E:Ω^(p,q)(E)→Ω^(n−p,n−q)(E*)` using the fiberwise metric identification; pin
the identity `α∧_ev barStar_E β=⟨β,α⟩_(Gram⊗h_E)dvol_g`, using
`wedgeWith` with evaluation `(s,φ)↦φ(s)` in that order, and its integral/norm
consequence. Use this same slot order in the Serre pairing. Prove inverse/square
and `barStar_E Δ_∂̄_E=Δ_∂̄_(E*) barStar_E`, where E* has B2's Riesz-transported
dual metric.


### 5.8 Compact Dolbeault Hodge theory (K5b.1)

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
including rank zero and empty M. This is the finite-component consequence
of the fixed-rank Hodge and Serre theorems (Demailly VI §7, Theorems 7.1–7.3,
pp. 309–310), via the explicit restriction/pasting maps above; it is not a
fixed-rank theorem applied to a varying-rank native model. Do not impose connectedness or a single
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
manifolds. No Kähler hypothesis is needed for these Hermitian/Dolbeault statements.
For scalar coefficients, transport `barStar` through the harmonic
identification to an anti-complex-linear isomorphism
`H^(p,q)(M) ≃ H^(n−p,n−q)(M)`. Prove its inverse and square sign.
It depends on the Hermitian metric; it is distinct from the complex-linear
pointwise star, whose type is `(n−q,n−p)`.

The Hermitian harmonic and Serre pairing API includes:

- Harmonic projection and the Green inverse commute with clopen restrictions and recover the orthogonal harmonic/exact/coexact decomposition.
- The Serre pairing is the bilinear evaluation-wedge integral; the dual-star map is conjugate linear.

**Checks.**

- On ℂ with the standard metric, |dz|²_Gram=2, whereas |dz|² for the h_T-dual metric is 1; the two contraction normalizations cannot be identified.
- On a point with E=ℂ², the Serre pairing is (v,φ)↦φ(v): e₁ paired with e₁* is 1 and with e₂* is 0.
- On three point components of ranks (0,1,2), H⁰ has dimension 3 and the pairing is the sum of three component pairings; higher Dolbeault degrees vanish.

*Needs:* Layers 1, 2, 4; §§5.1–5.6; Demailly VI §7, Theorems 7.1–7.3 for the fixed-rank analytic input.

### Examples

The point, empty base and ranks (0,1,2) test the distribution, Sobolev and compact Hodge carriers.
The C² function |x|³ tests the distinction between pointwise and smooth form calculus.

### Dependencies

DifferentialGeometry; SmoothBundlesConnections B2–B4; PDE Lane A.3;
§5.1 differential-operator core; VariationalMethods §§2–5; UnboundedOperators UO-D06;
Layers 1, 2 and 4 for the complex applications.

## Layer 6: Kähler identities and Hodge decomposition

### 6.0 Local Kähler and curvature identities (K6.0)

The canonical predicate is a Hermitian metric on a complex manifold with closed
fundamental form. Prove its comparison, through K1 Newlander–Nirenberg, with the
real-carrier condition of compatibility, closedness and N=0. Define Kähler metrics by
closedness of the fundamental form and prove equivalence to `∇J=0` for Levi-Civita and
holomorphic coordinates with `h_ij=δ_ij+O(|z|²)` at a point. Prove the adapted unitary
frame lemma, the standard Kähler structure on ℂⁿ, that complex submanifolds inherit Kähler
metrics, and that every Hermitian metric on a complex curve is Kähler. Develop `L=ω∧·`,
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

### 6.1 Compact Kähler Hodge theory and analytic cycles (K6.1)

#### Relative integration contract

Construct the boundaryless open-pair comparison needed below from
DifferentialGeometry §§8.3–8.5's absolute smooth-chain integration and
AlgebraicTopology Stages 3 and 6's relative chains and evaluation pairing.
For every Hausdorff second-countable finite-dimensional smooth manifold X
and open W⊆X, use the relative form complex with degree-q term
Ω^q(X;ℝ) ⊕ Ω^(q−1)(W;ℝ), with negative-degree forms zero, and differential
(α,β) ↦ (dα, α|_W−dβ). Construct its integration map to the shifted cone
of singular-cochain restriction, then to relative singular cohomology.
Prove it is an isomorphism, by the two absolute de Rham comparisons and
the long exact sequences. On the chain side first prove the relative
smooth/continuous comparison by the same argument. Singular cochains
restrict surjectively by extending coefficients on simplices by zero;
restriction of differential forms is not assumed surjective. Prove
naturality for smooth maps of open pairs and compatibility with enlargement
of W, absolute images and the relative evaluation pairing. In particular,
if α is closed and zero on W, (α,0) integrates by the ordinary smooth-chain
formula and maps to the absolute class of α.

For an oriented boundaryless n-manifold X and a smooth top form η supported
in a compact K, prove that the relative integration class evaluated on
AlgebraicTopology §6.3's compact-set orientation class in H_n(X,X∖K;ℤ),
after real coefficient extension, equals ∫_X η. Include the compact absolute
case, the orientation sign in dimension zero, and compatibility under
support enlargement and orientation-preserving open embeddings. Prove the
formula first for support inside an injective oriented chart simplex whose
boundary misses that support, using DifferentialGeometry §§5.2 and 8.4;
then assemble by a finite partition of unity and excision. The chosen
simplex is smooth; no smoothness of a triangulation of an analytic set is
assumed. These are relative comparison targets extending the absolute
supplier contracts, not consequences of Poincaré nondegeneracy alone.

- Integration commutes with the relative differential and the maps of long exact sequences.
- Evaluation and compact-support integration commute with smooth pair maps and support enlargement.
- The local orientation generators fix the integral comparison, including its sign.

**Checks.**

- In degree zero the complex is Ω⁰(X) with no negative-degree summand; for W=X its cohomology is zero, whereas W=∅ recovers absolute cohomology.
- On X=ℝ² take a smooth compactly supported density η of integral 1 inside a disk K. Its absolute top class is zero, but its relative evaluation on [X,X∖K] is 1=∫η; confusing the relative class with its absolute image would give 0.
- For a positive oriented point and η=2, evaluation and integration are both 2; reversing its orientation gives −2 on both sides.

*Needs:* DifferentialGeometry §§5.2, 8.3–8.5; AlgebraicTopology Stages 3 and 6,
including §6.3's compact-set orientation classes; smooth partitions of unity.

On compact Kähler M prove the `∂∂̄` lemma, then prove Hodge decomposition `H^k_dR(M;ℂ)≃⊕_(p+q=k)H^(p,q)(M)`, Hodge
conjugation/symmetry, and compatibility with wedge/singular cup product and
integral/rational coefficient images. Construct the corresponding pure real/rational Hodge
structures using the existing linear Hodge-structure library. Prove odd real Betti numbers
are even from Hodge symmetry and decomposition, including the degree-one obstruction
consumed by SymplecticGeometry. Prove Hard Lefschetz `L^(n-k):H^k→H^(2n-k)` is an
isomorphism for k≤n, primitive decomposition and Hodge–Riemann bilinear relations: for a
nonzero primitive `(p,q)` class α, `k=p+q≤n`, the real value
`i^(p−q)(−1)^(k(k−1)/2)∫α∧bar(α)∧ω^(n−k)/(n−k)!` is positive. Construct the associated
real polarization; obtain a rational polarization from this Lefschetz construction when
the Kähler class is rational.

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
fundamental class. Use the preceding relative integration contract's compact absolute
formula to identify its real pushforward with the analytic integration class.

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
The relative integration contract's open-pair cone sends `(α′,0)` to `[α′]_rel∈H^(2k)(M,U;ℝ)`,
whose absolute image is `deRhamHom[α′]`. Evaluate this relative class on
the image of `[V]` under the continuous map of pairs
`(V,V∩U)→(M,U)`. Excise the closed singular locus, which is contained in
the interior of V∩U, to obtain
`H_(2k)(V_reg,V_reg∩U;ℤ)≃H_(2k)(V,V∩U;ℤ)`.
The remaining inclusion `(V_reg,V_reg∩U)→(M,U)` is smooth, so the relative integration contract's
smooth-pair naturality compares evaluation with the pulled-back form.
Let C be the closed support of that top form on V_reg; prove C is compact,
and `V_reg∩U⊆V_reg∖C`. Under enlargement of the relative subset to
V_reg∖C, the class coming from `[V]` is AT6.3's compact-set orientation
class. Prove this by its local orientation images and excision naturality.
Prove the analytic integral of a form whose pullback has compact support
equals DG5's `integralTopForm` on the oriented smooth manifold V_reg.
Apply the relative integration contract's compact-support formula and
smooth/continuous relative-chain comparison, with compatibility of the
two relative evaluation maps under enlargement.
This yields `∫_(V_reg)α=⟨deRhamHom[α],ι_*[V]_ℝ⟩` without a smoothness
assumption on the analytic triangulation. Positivity proves the integral
ambient class is nonzero. Extend to effective analytic cycles by summing
their irreducible component classes with the specified positive integer
multiplicities, and prove additivity of the integration comparison.

The Kähler, Lefschetz and cycle API includes:

- The metric predicate agrees with closedness of the fundamental form and parallelness of J; Lefschetz operators descend to cohomology.
- Cycle classes have positive local complex-orientation generators on every regular component and are additive in integral multiplicities.

**Checks.**

- On a complex curve, dω is a 3-form on a real 2-manifold and equals 0; every Hermitian curve metric is Kähler.
- On a point, n=k=0 and L⁰ is the identity on H⁰=ℂ; on ℂP¹, L sends 1 to [ω_FS] with integral 1.
- For the union of two transverse projective lines, the two regular components have generators +1,+1; the singular point has real dimension 0 and contributes no 2-cell.
- For a positively oriented point as a zero-dimensional analytic cycle, integrating 1 gives 1; multiplicity 2 gives 2 and the empty cycle gives 0.

*Needs:* Layers 1–5; K3 analytic-set theory; RealAnalyticGeometry R1/R5 and AlgebraicTopology/GeometricTopology inputs stated in K6.1 for integral cycles.

### Examples

Two transverse projective lines distinguish the real integration functional from a construction
that incorrectly gives a singular point a top-dimensional cell.

### Dependencies

Layers 1–5; RealAnalyticGeometry R1/R5; AlgebraicTopology §§4.5, 4.7, 6.1, 6.3;
GeometricTopology Layer 11; the relative integration contract constructed in K6.1.

## Layer 7: projective, torus, and Hopf examples

### 7.1 Projective charts and orientation (K7.1)
 Use the single carrier
`Projectivization ℂ (Fin (n+1) → ℂ)` with AlgebraicTopology Stage 4.6's
quotient topology from the nonzero vectors. Consume ComplexManifolds Milestones 1–3's
complex-manifold, real-restriction and atlas-transport interfaces,
K3.0's finite-dimensional holomorphic calculus and
K1's complex orientation. This construction precedes associated bundles
and uses neither SmoothBundlesConnections B2 nor K5.

Construct the affine chart on `U_i={ [v] : v_i≠0 }` by the ratios
`(v_(i.succAbove j)/v_i)_(j : Fin n)`. Fix the coordinate enumeration
`Fin.succAbove i`, its inverse insertion `Fin.insertNth i 1 z`, and
the chart model `Fin n → ℂ` with
`𝓘(ℂ, Fin n → ℂ)`. Prove openness, representative independence, the
inverse `[1:z]` in those coordinate positions, chart homeomorphism and
holomorphic transition maps. Give the complex-linear comparison to
`EuclideanSpace ℂ (Fin n)` and its real scalar restriction. These affine
charts construct the projective manifold directly; the discrete quotient
theorem in ComplexManifolds is not used for the ℂ× action.

Prove `T2Space`, `CompactSpace`, `SecondCountableTopology` and
`ConnectedSpace` on this same carrier for every n≥0. Use chart ratios to
separate distinct lines, the continuous surjection from the finite-dimensional
unit sphere for compactness, and the finite atlas for second countability;
include ℂP⁰ as a point. Prove the underlying real smooth atlas and its
complex orientation agree with K1. Upgrade the existing equivalence
`OnePoint.equivProjectivization ℂ` to a homeomorphism and a biholomorphism
for ComplexManifolds's OnePoint atlas, using its formulas `t ↦ [t:1]`, `∞ ↦ [1:0]`
and the complex-linear identification `Fin 1 → ℂ ≃ ℂ`. Supply chart,
inclusion, coordinate-permutation and linear-action naturality APIs.
The n=1 member of this projective family has its own native carrier;
the biholomorphism identifies its atlas with ComplexManifolds's `OnePoint ℂ` atlas.
The single-carrier convention in ComplexManifolds governs its Riemann-sphere construction
on `OnePoint ℂ`; K7.1 owns the general-n projective family, including n=1.
Projective-family consumers use the `Projectivization` carrier; Riemann-sphere
consumers use `OnePoint ℂ` and this biholomorphism. Use that comparison for
every ℂP¹ example and transport theorem.

### 7.2 Projective bundles, forms and cohomology (K7.2)
 Construct tautological O(−1),
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
Compute the projective Dolbeault/Hodge groups and cup
ring: construct on this same carrier Mathlib's `CWComplex` structure with
one cell in each even dimension 0,2,…,2n and none in odd dimensions, specifying
its characteristic maps and skeleta. The CW construction uses only K7.1
and AlgebraicTopology Stage 4. Its cellular/cup calculation consumes Stage 6, without
its Stage 7 Euler-characteristic theorem. Own the cellular/cup calculation `H*(ℂPⁿ;ℤ)=ℤ[u]/(u^(n+1))`, |u|=2, using
AlgebraicTopology's cellular groups and products, with u the hyperplane class
normalized by `⟨u,[ℂP¹]⟩=+1`. Compare its real de Rham image with
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

For a complex torus `ℂⁿ/Λ` with a full real lattice, consume ComplexTori's quotient and descent.
Prove its flat Kähler structure, invariant holomorphic forms, and
`h^(p,q)=binomial(n,p)binomial(n,q)`. Include the elliptic one-dimensional case and its
genus/Betti dictionary. For every compact connected Riemann surface define
its geometric genus g=h^(1,0) and prove `h^(0,0)=h^(1,1)=1`,
`h^(0,1)=g` and `b₁=2g` by Hodge comparison. Prove the topological dictionary:
use K1's realification of the complex curve and its complex tangent
orientation to construct the native topological surface required by
[PlanarTopology's surface convention](../PlanarTopology/README.md).
Own the adapter from its real two-dimensional atlas to the half-space-charted
carrier, with empty boundary, T2, compactness and connectedness, and compare
the complex orientation with
[PlanarTopology Layer 6's `Surface.Orientation`](../PlanarTopology/README.md).
Consume [SurfaceTopology Layers 2–3](../SurfaceTopology/README.md)'s
presentation/realization comparisons,
[Layer 6](../SurfaceTopology/README.md)'s polygon normal forms and
[Layer 8](../SurfaceTopology/README.md)'s compact-surface classification
to obtain the unique orientable closed model of genus j and a homeomorphism.
Transport the chosen complex orientation to that model, comparing it with
the polygon orientation (and an orientation-reversing model reflection when
needed). K7 owns this orientation adapter; a classification homeomorphism
does not assert compatibility with a preassigned smooth triangulation.
Construct the comparison of that realization with AlgebraicTopology's
standard CW model (one vertex, 2j edges, one face attached by the product of
commutators), treating j=0 by the sphere comparison rather than identifying
an empty polygon word with SurfaceTopology's schema. Use AT's singular/cellular
comparison to compute b₁=2j, hence g=j. SurfaceTopology supplies presentations
and their topological uniqueness; K7 with AT owns cohomology, the
real/smooth de Rham comparison and the genus calculation. On this oriented CW model compute
`H²(Σ;ℤ)≃ℤ`, identify its generator by evaluation on AlgebraicTopology
Stage6.3's fundamental class, and prove that evaluation is an isomorphism.
Compute the integral degree-one cup pairing on the 2g polygon generators
as the standard unimodular symplectic matrix, preserving the complex
orientation and the cohomology comparison with the smooth surface.
These are the integral fundamental/intersection comparisons used in Index I7.4.
Define the geometric genus of a
compact n-fold as `h^(n,0)`. The theta sections of positive torus line bundles and their
quantization are GeometricQuantization's targets.

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

The projective and quotient example API includes:

- Projective chart ratios, inclusions and linear actions agree on the single projectivization carrier; the n=1 comparison preserves the sphere atlas and orientation.
- Line-bundle tensor/dual operations preserve degree and the specified curvature normalization; cohomology comparisons preserve products.

**Checks.**

- ℂP⁰ is one point and has H⁰=ℤ, with no positive-dimensional cells; ℂP¹ has cells in dimensions 0 and 2 and u²=0.
- For O(−1) on ℂP¹, h⁰=h¹=0; for O(0), h⁰=1 and h¹=0; the transition dz=−w⁻²dw identifies the canonical line with O(−2).
- For a one-dimensional complex torus, h^(1,0)=h^(0,1)=1 and b₁=2; the primary Hopf surface instead has h^(1,0)=0 and h^(0,1)=1.

*Needs:* ComplexManifolds Milestones 1–4 and 7; ComplexTori Milestone 1; Layers 2–6; AlgebraicTopology Stages 4 and 6.

### Examples

The point, projective line, elliptic torus and primary Hopf surface distinguish zero dimension,
positive curvature, flat Kähler geometry and failure of Hodge symmetry.

### Dependencies

ComplexManifolds; ComplexTori; Layers 2–6; AlgebraicTopology Stages 4 and 6;
SurfaceTopology Layers 2, 3, 6, 8 and PlanarTopology for the genus comparison.

## Layer 8: the Frölicher spectral sequence and non-Kähler comparison

### 8.1 The filtered complex and invariant comparison

Construct the spectral sequence of the double complex of smooth type forms, with
`E₁^(p,q)=H^(p,q)_∂̄`, converging to complex de Rham cohomology. Consume DGFloer's generic
filtered-complex spectral sequence and own its decreasing cohomological column-filtration
adapter, with `d_r:E_r^(p,q)→E_r^(p+r,q−r+1)`, finite filtration and associated-graded
convergence. Use Mathlib's `SpectralObject`/bicomplex carriers; do not create another
spectral-sequence object. Prove E₁ degeneration in the compact Kähler case using K6.

Construct the complex Heisenberg group and its Gaussian-integer lattice, the compact
Iwasawa quotient and invariant form equations (Angella, arXiv:1212.4351v1,
§3.1, pp. 9–10). Compute `h^(1,0)=3`, `h^(0,1)=2`, `b₁=4`
with a proof that the invariant-form calculation gives the relevant cohomology. Exhibit
the nonzero first spectral differential and the failure of an additive Hodge decomposition
on this compact complex manifold. Own the Heisenberg group and lattice, the
freeness and proper discontinuity of its holomorphic lattice action, and
cocompactness. Consume ComplexManifolds Milestone 4 for the quotient complex manifold and
its projection/descent API. Build the cohomology-comparison prerequisites here, using
the all-degree Lie-algebra cochain construction below and its scalar-extension and complex-summand adapter:
on the underlying real algebra, identify the complexification with `𝔤⊕bar(𝔤)`, with zero
mixed bracket, and construct the complex-linear CE complex of `bar(𝔤)` and the invariant
Dolbeault bicomplex. Own Nomizu's real de Rham comparison for compact nilmanifolds and
Sakane's Dolbeault comparison for compact complex parallelizable nilmanifolds.

#### Lie-algebra cochains in every degree

For a finite-dimensional real or complex Lie algebra L and a Lie module V over the
same field 𝕜, define C^k(L,V) as native alternating 𝕜-multilinear maps L^k→V.
Define d:C^k→C^(k+1) by the sum of the action terms
Σ_i(−1)^i x_i·ω(x₀,…,x̂_i,…,x_k) and bracket terms
Σ_(i<j)(−1)^(i+j)ω([x_i,x_j],x₀,…,x̂_i,…,x̂_j,…,x_k), with the remaining
arguments in their original order. Chevalley–Eilenberg §23, equations (23.1)–(23.2),
pp. 115–116, gives the coefficient construction with its opposite bracket convention
and differential divided by k+1; after reversing that bracket, multiply its degree-k
differential by k+1 to obtain this formula. Its finite-dimensional-coefficient proof
extends to arbitrary V because its finite-sum module/Jacobi calculation uses no
basis or dimension bound on V. Prove alternation and d²=0 using the module
identity and Jacobi, and construct the cochain complex and its cohomology.
Use native linear maps and alternating maps, not another Lie-algebra carrier.
Compare degrees one and two with `LieModule.Cohomology.oneCochain`,
`LieModule.Cohomology.twoCochain`, `LieModule.Cohomology.d₁₂` and
`LieModule.Cohomology.d₂₃` in `Mathlib/Algebra/Lie/Cochain.lean`; the degree-three
comparison forgets alternation into the trilinear codomain of the last map.

- Pullback by a Lie-algebra homomorphism is a chain map when the coefficient
  action on its source is restricted along that homomorphism; coefficient-module
  maps induce covariant chain maps, and identity and composition are respected.
- With trivial scalar coefficients, wedge makes the complex a differential graded
  algebra. Extension from ℝ to ℂ commutes with cochains on finite-dimensional L
  and with the differential.
- For left-invariant forms on a Lie group the evaluation-at-identity map identifies
  the exterior derivative with this differential; inversion to right-invariant
  forms also transports the bracket sign. This supplies the invariant-form input
  of Sakane §2, Theorem 1, pp. 188–189.

**Checks.**

- For L=0, C⁰=V, every positive-degree cochain space is 0 and d=0;
  the trivial one-dimensional abelian algebra has H⁰=𝕜 and H¹=𝕜.
- For [X,Y]=Z with trivial coefficients, dZ*(X,Y)=−1, while dX*=dY*=0;
  hence d²Z*=0 and H¹ of the three-dimensional Heisenberg algebra has dimension 2.
  In the source convention δZ*(X,Y)=−1/2; the degree-one factor 2 gives −1.
- For the abelian algebra ℝ acting on ℝ by scalar multiplication, (dv)(1)=v;
  v=1 gives 1, so omitting the action terms would incorrectly make every v closed.
- The Iwasawa equation dφ₃=−φ₁∧φ₂ evaluates to −1 on (X₁,X₂), agreeing
  with the real Heisenberg sign after complexification; d²φ₃=0.

*Needs:* Native Lie algebras, Lie modules, alternating maps and cochain complexes;
DifferentialGeometry §§0.1–1.4 for the invariant-to-manifold comparison only.

### 8.2 Central reduction (K8.NilpotentCentralReduction)
 Supply the existence and lattice theorem
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
connected and simply connected, `Γ∩A` is a uniform lattice, AΓ is closed,
and the image Γ̄ in G/A is discrete and cocompact. Construct G/A as a
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
[ComplexManifolds ComplexManifolds Milestone 4](../ComplexManifolds/README.md)'s
quotient/descent API. That supplier handles those discrete quotients; the
continuous central quotient, rationality, lattice existence and
smooth/holomorphic principal-torus comparison are K8's targets.
Use real and complex tori, including dimension zero, as the abelian base
cases, and the constructed A at each nonabelian step. Compare the chosen
left/right lattice-quotient and invariant-form conventions by inversion,
with the corresponding CE chain map from §8.1. This supplies the
full Nomizu/Sakane induction, not just the Iwasawa example. The central
reduction follows Sakane §2, Theorem 1 and its proof, p. 189, whose lattice
step invokes Raghunathan, p. 31 Corollary 1 and p. 23 Theorem 1.13; K8 owns that needed theory here.

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

The central reduction and filtered-complex API includes:

- The central quotient lowers dimension and preserves the uniform-lattice hypotheses; the fiber cohomology local systems are trivial by centrality.
- The invariant-to-global maps respect the filtrations and identify the required pages before convergence is applied.

**Checks.**

- For an abelian group the base case is a torus; in dimension 0 the quotient is a point with H⁰=ℂ and zero positive-degree cohomology.
- For the real Heisenberg algebra [X,Y]=Z, its last nonzero lower-central ideal is ℝZ of dimension 1, and the quotient is ℝ²; the integer central lattice yields circle fiber ℝ/ℤ.
- For the Iwasawa coframe, dφ₁=dφ₂=0 and dφ₃=−φ₁∧φ₂, so d₁[φ₃]=−[φ₁∧φ₂] is nonzero; h^(1,0)+h^(0,1)=3+2=5 differs from b₁=4.

*Needs:* §8.1 Lie-algebra cochain complex; ComplexManifolds Milestone 4; ComplexTori Milestone 1; Layers 2 and 5; DGFloer filtered-complex comparison; the central rationality/lattice target above.

### Examples

The Heisenberg central quotient supplies the first nonabelian induction step; the Iwasawa d₁
separates invariant Dolbeault classes from de Rham classes.

### Dependencies

Layers 2, 5, 6; §8.1 Lie-algebra cochain complex; ComplexManifolds Milestone 4;
ComplexTori Milestone 1; DGFloer's filtered-complex spectral sequence.

## Downstream consumers

GlobalHolomorphicFunctions uses Layer 2's compact-support transform and finite-rank
approximation inputs for its scalar global applications. Its global Laurent and prescribed
singularity theory extends Layer 3's finite-pole germ construction. PseudodifferentialOperators
uses Layer 5's density, differential-operator and analytic core for its pseudodifferential
calculus. LieGroupoidsPoisson extends Layer 8's Lie-algebra cochains to Lie algebroids.

K3.0 several-variable calculus precedes K1. K1's scalar-restriction and
orientation paragraph precedes K7.1 and SBC B1's acceptance examples;
K1's eigenbundle calculus consumes SBC B2's complexification and precedes K2.
K2's scalar calculus, whole-polydisc local lemma, parameter-dependent shell solver, and Ω^p sheaves
use §2.1's fixed finite-rank operators and Cauchy–Green map under their stated interfaces and precede K4's holomorphic bundles and connections. K2's bundle-valued comparison follows
K4's holomorphic-section sheaf and ∂̄_E. The rest of K3 uses that local analysis and feeds K4's
analytic-sheaf examples. K5a's pointwise real
star, orientation line and density bundle use DG and SBC B2 independently
of K1–K4. Its finite-order operator and jet construction uses that density line,
HopfRinow Layer 1's Levi-Civita connection and SBC B3–B4's induced connections.
Its bundle tests, distributions and Fréchet sections use chart/frame analysis;
the Hilbert scale, Laplace regularity and de Rham Hodge theory then use these
constructions, SBC B2–B4, PDE Lane A.3 componentwise on finite-dimensional fibers,
[VariationalMethods §§2–5](../VariationalMethods/README.md),
[UO-D06](../OperatorTheory/UnboundedOperators/README.md) and AT.
UO-D06 supplies form representation to VariationalMethods §§2.3 and 5.1;
§§3.1 and 4.3 supply compact pairs and their spectral expansion. Layer 5
consumes the same represented operator and §5.3’s abstract differential-energy
adapter, and proves the geometric H²-domain comparison here.
K5a.ComponentwiseCompact follows its component fixed-model analytic theorems
and the smooth component-family assembly, and feeds K5b.1 for K4's holomorphic
componentwise bundles. Its finite-product/orthogonal-sum maps precede the
global compact Hodge/Serre conclusions for locally finite varying ranks.
PDO P1.1 and P2 onward consume this analysis. K5b uses K1, K2, K4
and K5a. K6.0 uses K1/K2/K4 and K5a local identities, and precedes
RealAnalyticGeometry R3/R4/R5. K6.1 follows K5b, K6.0 and K3's analytic-set theory, K3.0's real-analytic
atlas, RealAnalyticGeometry R1/R5, DG8.3–8.5/9.3/12.1, AT4.5/4.7/6.1/6.3
and GT Layer11. K7.1 uses K3.0, K1's complex orientation and
ComplexManifolds Milestones 1–3 and AT Stage4.6's projective quotient topology, and precedes K2's ℂP¹ acceptance. K7.2's CW
construction uses K7.1 and AT Stage 4 before AT Stage 7, independently
of K2–K6; its bundle/forms/Hodge applications use K4–K6. K8 uses K2/K5/K6
and the generic spectral-sequence machinery. K7.2's torus computations follow
ComplexTori Milestone 1 and K5b/K6.1. Its Riemann-surface genus and integral cup
computations follow K1's realification/complex orientation, the K7 adapter to
[PlanarTopology](../PlanarTopology/README.md) and
[SurfaceTopology Layers 2/3/6/8](../SurfaceTopology/README.md),
AT Stage4's CW theory, Stage6's cellular/cohomology-product comparisons
including Stage6.3, and K6.1. Its Hopf computations
follow ComplexManifolds Milestone 4, K2's Leray-cover comparison, K3's Hartogs theorem,
K5b's Serre duality and DG's Mayer–Vietoris theorem. The Iwasawa quotient
consumes ComplexManifolds Milestone 4; the general invariant-cohomology comparisons
first use K8.NilpotentCentralReduction's Γ-rational central subgroup,
lattice, lower-dimensional quotient and smooth/holomorphic principal-torus
bundle theorem, then §8.1's CE adapter and the geometric
spectral-sequence page comparisons in K8. The generic filtered-complex
machinery supplies convergence after those inputs.
Every local definition and bundle construction has restriction, gluing, functoriality and transport
APIs before it becomes a global theorem's input.
Within K3, the convergent complex local-algebra and singular-locus targets
precede RealAnalyticGeometry R1's local semianalytic/component results; those
results then supply K3's finite regular-piece partition. R1 does not consume
that later partition. RealAnalyticGeometry R5 applied to that finite family
supplies the compatible triangulation in K6.

## References

- Griffiths and Harris, *Principles of Algebraic Geometry*, chapter 0, for
  local analytic geometry, Dolbeault/Hermitian and Kähler foundations.
- [Demailly, *Complex Analytic and Differential Geometry*](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf),
  21 June 2012 version: I §3 (3.1)–(3.4), pp. 20–21; II §§2–3, pp. 79–85;
  VI §3, pp. 291–295 and §7, Theorems 7.1–7.3, pp. 309–310.
- Webster, *A new proof of the Newlander–Nirenberg theorem*, Math. Z. 201 (1989), 303–316, for the convex-domain homotopy and rapidly converging iteration route.
- [Sakane, *On compact complex parallelisable solvmanifolds*](https://ir.library.osaka-u.ac.jp/repo/ouka/all/5964/ojm13_01_13.pdf), Theorem 1 and the nilpotent case, for the invariant Dolbeault comparison.
- Hörmander, *The Analysis of Linear Partial Differential Operators I* (2003 reprint),
  Theorem 2.3.5, for distributions supported on a submanifold.
- Raghunathan, *Discrete Subgroups of Lie Groups* (1972), p. 23 Theorem 1.13
  and p. 31 Corollary 1, for the lattice inputs used in Sakane’s central reduction.
- Chevalley and Eilenberg, *Cohomology Theory of Lie Groups and Lie Algebras*
  (1948), §23, equations (23.1)–(23.2), pp. 115–116; §8.1 states the bracket and
  differential normalization comparison explicitly.
- Rainer, *Advanced Complex Analysis*, Vienna 2016–2017 course notes,
  Theorems 11.1 and 11.7, pp. 25 and 29, for scalar Runge; the finite-rank
  uniform estimate in §2.1 is an additional consequence with its inputs specified there.
- Kolář, Michor and Slovák, *Natural Operations in Differential Geometry* (1993),
  §§12.2–12.5 and §§12.16–12.17, for finite jets and truncation.
- Wells, *Differential Analysis on Complex Manifolds*, for Dolbeault, elliptic
  Hodge theory and duality.
- [Angella, *The cohomologies of the Iwasawa manifold and of its small deformations*](https://arxiv.org/abs/1212.4351),
  for the explicit non-Kähler cohomology comparison.
