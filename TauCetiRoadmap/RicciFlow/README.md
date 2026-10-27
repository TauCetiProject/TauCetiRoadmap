# Ricci flow, preserved curvature cones, and sphere theorems

Build Ricci flow on closed smooth real manifolds, from the actual space of
Riemannian metrics and the Ricci–DeTurck initial-value problem to curvature
pinching and smooth convergence. The main geometric outputs are Hamilton's
positive-Ricci theorem in dimension three, Böhm–Wilking's 2-positive-curvature-
operator theorem in dimensions at least three, and Brendle–Schoen's pointwise
quarter-pinched theorem in dimensions at least four. Include the separate
positive-Gauss-curvature surface argument and the source's complete globally
quarter-pinched sphere theorem.

The basic library includes metric variations, scaling and normalization,
short-time existence, uniqueness, maximal intervals, curvature continuation,
derivative estimates, tensor maximum principles, algebraic curvature cones,
pinching sets, smooth metric convergence, and naturality under isometries and
coverings. Every convergence theorem specifies an actual limit metric on the
original smooth manifold. A subsequential limit after changing coordinates is
an intermediate construction, not the final convergence statement.

## Carriers, conventions, and suppliers

Work on finite-dimensional smooth real boundaryless manifolds; closed means
compact and boundaryless. Connectedness and nonemptiness are imposed for
volume averages and space-form conclusions. Existence applies to disconnected
closed manifolds componentwise, with a common short time. Curvature and cone
calculations use real tensor spaces. Complexified isotropic descriptions are
compared with their real four-frame inequalities.

Use native `ContMDiffRiemannianMetric I ∞ E (fun x => TangentSpace I x)`.
Its `inner`, symmetry, positivity and smoothness fields are actual metric data;
`toRiemannianMetric` supplies the local `RiemannianBundle` and
`IsContMDiffRiemannianBundle` instances. A fixed smooth reference metric sets
section norms and charts, while each evolving metric determines its own
Levi-Civita connection, contractions and volume. Changing a metric never
changes the smooth manifold or silently changes the topology of a section
space. Construct time-dependent metrics as sections of Sym²T*M on an interval,
with the native metric object at each time. Interval equality is the equality
of these restrictions; arbitrary values outside an interval are not flow data.

Use the existing `CovariantDerivative.leviCivitaConnection`,
`curvatureTensor`, `ricciTensor` and `scalarCurvature`. The curvature convention is

`R(X,Y)Z=∇_X∇_Y Z−∇_Y∇_X Z−∇_[X,Y] Z`.

Write the four-tensor `r(u,v,z,w)=g(R(u,v)w,z)`. Thus `r(u,v,u,v)` is positive
on the unit sphere, and the bivector curvature operator is characterized by
`⟨Rop(u∧v),z∧w⟩=r(u,v,z,w)`. Its value on constant curvature κ is κ Id.
The tensor heat generator is `L_g=tr_g ∇²`, with scalar restriction div grad.
It is the negative of the positive rough/Hodge Laplacians used in CKG/PDO.
In PDO's Fourier convention its principal symbol is `−|ξ|² Id`; the real
geometric symbol is `+|ξ|² Id`. Uniform parabolicity means positivity of the
real principal coefficient, not positivity of this Fourier symbol.

Unnormalized flow is `∂_t g=−2 Ric(g)`. Volume-normalized flow, for n≥1, is
`∂_τ g=−2 Ric(g)+(2/n) r̄(g)g`, with `r̄=Vol(g)⁻¹∫Scal(g)dμ_g`.
In dimension zero define normalized flow to be stationary, with r̄=0 and no
`2/n` correction term;
dimension one is stationary because curvature vanishes. Moving orthonormal
frames satisfy `∂_t e=Ric# e` in the unnormalized flow and
`∂_τ e=(Ric#−r̄/n Id)e` in the normalized flow. The curvature-operator equation is

`D_t Rop=L_g Rop+Q(Rop)`, `Q(R)=2(R²+R#)`.

Here `R#=ad∘(R∧R)∘ad*` after identifying Λ²E with so(E), with scalar product
`−½tr(AB)` on so(E). Write `Id_E` for the identity on E and `I=Id_E∧Id_E` for the identity curvature operator on Λ²E, the curvature of the unit sphere. Normalize `I#=(n−2)I`. Böhm–Wilking's algebraic vector
field is `X=Q/2`; formulas for its deformation discrepancy acquire a factor
of two when used for Q. Normalized flow adds `−(2r̄/n)Rop`.

* [RiemannianGeometry R1–R4/R7](../RiemannianGeometry/README.md) supplies the
  curvature/Gram/exterior dictionaries, local jets, Jacobi and comparison
  theory, cut locus and injectivity-radius carrier, Myers, Schur and complete
  constant-curvature space-form classification. R6.2 below adds the quantitative
  pinched injectivity estimate and convergence-coordinate adapters it needs.
* [SmoothBundlesConnections B2–B4](../SmoothBundlesConnections/README.md)
  supplies tensor/dual/Hom bundles, frames, metrics and induced connections;
  [DifferentialGeometry](../DifferentialGeometry/README.md) supplies Lie
  derivatives of forms, covariant-form compatibility, integration/densities,
  Stokes and its 3.5 time-dependent evolution maps. R1.2 constructs the Lie
  derivative of symmetric covariant two-tensors; R2.4 builds the gauge and
  limiting-diffeomorphism comparisons on the shared flow maps.
* [PDE Lane F24–26 and F27.1–F27.5](../PDE/README.md) supply weak linear
  parabolic existence, Bochner/Galerkin foundations, and the scalar Euclidean
  parabolic Schauder model. In particular, F27.1 owns Euclidean parabolic
  Hölder spaces/interpolation/absorption; F27.2 owns constant-coefficient
  kernel derivative and cancellation estimates, trace attainment and linear
  coordinate changes; F27.3 owns freezing, cutoff localization and the method
  of continuity; F27.5 owns higher-order estimates. In a fixed bundle frame
  the scalar principal operator acts componentwise, so R2 consumes this model.
  R2 owns the additional finite-rank bundle charts and frame changes, the
  comparison of its section norms with F27.1, connection-induced coupled
  lower-order terms, the spectral/weak closed-manifold base, closed-manifold
  continuation, and the quasilinear tensor-bundle theorem. Consume PDE F24–F25's
  weak parabolic and autonomous finite-trial interfaces; R2.2 owns their
  compact-bundle spectral, weak-derivative and exact pivot-trace comparisons.
  The comparison signatures `TauCeti.exists_memLp_forall_setIntegral_eq_add_inner`
  and `TauCeti.PDE.existsUnique_galerkinSolution` are specified in Tau Ceti
  revision `b9ec3ab4b3fc4ca543e85dbd09b00087735cde9f`; they are not declarations
  available from the selected `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` floor.
  Use them as comparison locators for PDE's single assigned producer, not as
  required imports or an assumption that the selected pin has changed. The weak
  integral formulation alone supplies neither a weak time derivative nor an
  exact pivot initial trace. R4.2 owns evolving-manifold maximum principles.
  R2's spatial Sobolev inputs consume [CKG K5a](../ComplexKahlerGeometry/README.md),
  and its Hölder inputs consume [PDO P5–P7](../PseudodifferentialOperators/README.md).
  Elliptic estimates or a static eigenbasis alone are not a time-dependent
  existence theorem.
* [VariationalMethods V1–V6](../VariationalMethods/README.md) supplies energy
  and scalar mean-zero Poisson connectors. R8 constructs the time-dependent
  surface Green/potential comparison on the shared Hilbert scales.
  [HopfRinow](../HopfRinow/README.md) supplies actual geodesics, exponential
  maps, completeness and smooth dependence. No new geodesic carrier is required.
* [UniversalCovers](../../Completed/UniversalCovers/README.md) supplies universal-cover
  constructions and their deck API. [DifferentialGeometry Layers 2.3–2.4](../DifferentialGeometry/README.md)
  supply covering maps and the orientation double cover. R6.2 proves
  finite-sheetedness of a compact connected cover and its density-integral
  formula `Vol(cover)=degree·Vol(base)` using evenly covered charts and a
  partition of unity. No classification of surfaces is assumed before R8's
  flow convergence.

The closed-bundle and Ricci-specific adapters are owned by R2 and R1–R8.
The cited scalar and linear provider contracts are prerequisites for those
adapters.

Native Mathlib already has continuous multilinear maps, exterior powers,
symmetric endomorphisms and finite-dimensional spectral theory,
`InnerProductSpace.instLaplacian` (notation `Δ`) and
`InnerProductSpace.laplacianWithin`, `ConvexCone`, and
[Mathlib’s `ProperCone`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Analysis/Convex/Cone/Basic.lean#L60), the closed submodule over nonnegative scalars (containing zero, not necessarily salient),
`tangentConeAt ℝ≥0`, ODE Picard–Lindelöf, manifold derivatives and smooth
Riemannian metrics. Tau Ceti already has real metric-compatible curvature
symmetries, Ricci/scalar traces and constant-curvature contractions, actual
Levi-Civita regularity, canonical Riemannian densities/volumes, and compact
manifold flows. Consume them directly. Its `Riemannian/MetricVariation` file
concerns total variation of paths; that is distinct from differentiating a
family of metric tensors. The new metric-family derivatives are R1 targets.

## R1 — metric families and variation calculus

**R1.1 — Section and metric API.** Construct Sym²T*M as the symmetric
subbundle of the existing bilinear Hom bundle, the image of the smooth fibre
idempotent `B↦(B+Bᵀ)/2`. Prove the image/kernel splitting, constant rank
n(n+1)/2, closed fibre submodules, smooth local symmetric-matrix frames,
transition maps and evaluation/contraction API. Compare its sections literally
with the symmetric native fibre CLMs and metric objects. This metric subbundle
is distinct from PDO P1’s jet carrier; construct their canonical fibre
symmetrization/evaluation comparison. For scalar second jets identify the
kernel of `J²→J¹` with this symmetric cotangent fibre, pinning the Hessian
versus Taylor-coefficient factor 1/2. A connection supplies a splitting of the
full jet sequence; do not assume a canonical inclusion of lower jets.
On this carrier construct interval metric
families with joint spatial/time regularity, evaluation and restriction,
translation of time, reparametrization, pullback and positive scaling. Prove the
positive-definite metrics form an open cone in C^k and C^(k,α) section spaces
on a compact base, with explicit uniform two-sided bounds against the reference
metric. Include smooth inverse metrics, musical maps, orthonormal-frame changes,
contractions, induced tensor metrics and equivalence of all fixed-time norms.
Positivity must hold on every nonzero tangent vector, not just a chosen basis.

**R1.2 — Variations.** For h=∂_t g prove `∂_t g⁻¹=−g⁻¹ h g⁻¹`,
`∂_t dμ_g=½tr_g(h)dμ_g`, and
`∂_tΓ^k_ij=½g^kℓ(∇_i h_jℓ+∇_j h_iℓ−∇_ℓ h_ij)`.
Define the connection difference as the native tensorial difference, prove its
chart expression, and derive curvature, Ricci, scalar and Laplacian variations.
In particular
`∂_t Scal=−⟨h,Ric⟩+div div h−L_g tr_g h`.
Construct `L_X` on covariant two-tensors by the derivative of pullback along
DG3.5's local flow and prove its tensorial coordinate formula and
`(L_Xg)(Y,Z)=g(∇_Y X,Z)+g(Y,∇_Z X)`.
Derive Lie differentiation and
`∂_t(φ_t* g_t)=φ_t*(∂_t g_t+L_(∂_tφ_t∘φ_t⁻¹)g_t)`.
Prove differentiating an integral includes the volume-variation term. The
formulas apply to densities without an orientation assumption. Include product,
restriction, pullback and scaling compatibility and quantitative estimates on
all these maps between the stated section spaces.

**R1.3 — Scaling and normalization.** Prove constant scaling g↦c g preserves
its connection and covariant Ricci tensor, while scalar/sectional curvature
scale by c⁻¹ and volume by c^(n/2). For n≥1 and unnormalized g(t), define
`a(t)=(Vol(g₀)/Vol(g(t)))^(2/n)` and `τ(t)=∫₀ᵗ a(s)ds`;
`ĝ(τ(t))=a(t)g(t)` solves the volume-normalized equation. Construct the inverse
time change on its image, initial normalization and maximal-interval comparisons.
Include `c g(t/c)` as parabolic scaling and time translation. Every later claim
that normalized time tends to infinity proves that fact, rather than identifying
finite unnormalized and infinite normalized intervals by notation.

**R1.4 — Examples and solitons.** Compute Einstein solutions
`g(t)=(1−2λt)g₀` for Ric(g₀)=λg₀ on their positive-scale interval, and the
stationary volume-normalized solution. Include round spheres, flat metrics,
products with independent scale factors, and dimensions zero and one. Define
Ricci solitons by `Ric+½L_Xg=λg`, gradient solitons by
`Ric+Hess f=λg`; construct their scaling/pullback flow and converse self-similar
comparison. Normalize λ by scaling, record gradient-potential additive constants
and completeness hypotheses on X, and distinguish a metric limit from a soliton
limit in moving coordinates. R8 proves the required closed surface rigidity.

## R2 — classical compact-bundle parabolic foundations and DeTurck gauge

**R2.1 — Parabolic section spaces.** For 0<α<1 construct the Banach spaces
C^(α,α/2) and C^(2+α,1+α/2) of sections of a smooth finite-rank real bundle
over M×[0,T]. Use finite smooth frames and parabolic distance
`|x−y|+|t−s|^(1/2)`; include complete norm, closed symmetry subspaces, endpoint
trace, restriction, multiplication/contraction/composition, interpolation,
adjacent-slab gluing (bound the combined parabolic Hölder seminorm by the two
slab norms when the required traces match),
partition and chart-change estimates. Compare time slices with PDO P5's spatial
Hölder objects. Define higher parabolic regularity and compact inclusions into
strictly lower exponents. Build the smooth one-sided-time extension used
by R2.4 on a compact slab. In each fixed bundle frame use negative dyadic
numbers b_k and coefficients a_k with `Σ_k a_k b_k^j=1` for every j≥0 and
`Σ_k |a_k||b_k|^j<∞`; construct them by finite polynomial interpolation and
uniform summability estimates. For t<0 use `Σ_k a_k χ(b_k t)u(b_k t)`,
where χ is one near zero and supported inside the positive slab. Prove every
mixed spatial/time jet matches at zero, locally finite sums away from zero,
uniform differentiated convergence at zero, and compatibility/gluing under
fixed smooth frame changes. Open metric positivity persists on a sufficiently
small negative slab. Coefficients are actual tensors, not an unspecified
predicate of being parabolic.

**R2.2 — Linear solution and Schauder theory.** Fix a smooth fibre metric and
compatible connection ∇̄ on the real bundle, using ḡ’s Levi-Civita connection
on cotangent factors. Thus `Δ⁺_(ḡ)=∇̄*∇̄=−tr_(ḡ)∇̄²` is exactly the operator
of the form q(u,v)=∫⟨∇̄u,∇̄v⟩. For
`∂_t u−a^ij(x,t)∇̄_i∇̄_j u−B^i(x,t)∇̄_i u−C(x,t)u=f`,
assume a symmetric real principal tensor `a∈C^{α,α/2}` with a specified norm
bound and
`λ|ξ|²_(ḡ)≤a(ξ,ξ)≤Λ|ξ|²_(ḡ)`, λ>0; its principal action on the bundle is
scalar times Id. Lower terms are bundle endomorphisms, with specified Hölder
norm bounds. Prove the global initial Schauder estimate
`‖u‖_(2+α,1+α/2)≤C(‖f‖_(α,α/2)+‖u₀‖_(2+α))`,
and the corresponding interior and higher estimates, with C controlled by
λ,Λ, the parabolic Hölder norms of a,B,C, atlas and a fixed upper bound T₀ for T. For the Euclidean component estimate extend a and the forcing constantly from T to T₀, preserving their Hölder bounds, solve on the fixed slab, and restrict using scalar uniqueness. This gives constants uniform for 0<T≤T₀.

In each local bundle frame apply F27.3 componentwise to the localized section
`χu` with scalar operator `∂_t−a^{ij}∂_i∂_j`, taking its scalar lower
coefficients to be zero. Extend the coordinate principal matrix to all of
Euclidean space by a smooth cutoff convex blend with a fixed positive matrix;
the cutoff is one on a neighborhood of the support of χ. Prove uniform
ellipticity and parabolic Hölder bounds for this extension. Move the coupled
connection, frame, B and C terms, together with the cutoff commutators, into
the componentwise forcing. Bound these terms in `C^{α,α/2}` by interpolation
with an arbitrarily small multiple of the `C^{2+α,1+α/2}` norm plus a
controlled `C⁰` norm, and absorb the small multiple using F27.1.
Prove uniform coefficient bounds and Hölder regularity under the finite
frame/chart changes, compare the component norms with R2.1's intrinsic norms,
and patch the estimates on the compact base. R2 owns this closed-bundle
estimate, the base metric-compatible weak solution and its exact initial
trace, and the closed-bundle coefficient-continuation inverse. Consume F27's
Euclidean kernel cancellation, trace, freezing and scalar continuity theorem;
R2's bundle continuation below is a separate application of the resulting
uniform estimates.
The preliminary global estimate contains ‖u‖_(C⁰); remove it by
`‖u‖_(C⁰)≤‖u₀‖_(C⁰)+T‖∂_t u‖_(C⁰)` in the fixed reference fibre norms,
absorb on a sufficiently small uniform slab, then iterate using R2.1's
endpoint/gluing estimates. The final constant is uniform on the whole
coefficient-continuation path and each fixed upper bound for T.

Construct the base solution for `∂_t u+Δ⁺_(ḡ)u=f` on this closed real
bundle using a real countable (possibly finite) orthonormal eigenbasis indexed
by ι. Construct that real basis from VariationalMethods V4/V5.3 on CKG K5’s
real compact pair H¹⊂L², with q(u,v)=∫⟨∇̄u,∇̄v⟩ and coercive shifted form
q+⟨u,v⟩. Prove its eigenvectors are smooth by K5/PDO regularity and its
partial operator is the actual rough Laplacian by the distributional energy
identity. If λ_i are the eigenvalues of P7’s shifted L=1+∇̄*∇̄, use
μ_i=λ_i−1≥0 for Δ⁺_(ḡ); compare real/complexification and finite kernel.
The ith heat coefficient is
`exp(−μ_i t)(u₀)_i+∫₀ᵗexp(−μ_i(t−s))f_i(s)ds`.
Prove convergence in `C⁰_t L²∩L²_t H¹`, the `L²_t H⁻¹` derivative and trace,
and the weak equation by energy estimates on finite spectral sums. Compare
the finite coefficient ODEs with PDE F25's autonomous Galerkin interface,
whose newer-source comparison name is `TauCeti.PDE.existsUnique_galerkinSolution`.
Use a finite-dimensional real trial space and a trial map injective into the
pivot L² space. The energy map is bounded and autonomous; this theorem does
not assert a nonautonomous Galerkin result. Hölder forcing is continuous into
H⁻¹, and endpoint-constant extension gives the globally continuous forcing
required for its unique global C¹ coordinate solution.

Identify the spectral solution with PDE F25's weak integral solution, whose
newer-source comparison name is
`TauCeti.exists_memLp_forall_setIntegral_eq_add_inner`. On the real pair
H¹⊂L² supply its complete form space, continuous injective dense pivot
inclusion, a.e. measurable bounded energy form and quantitative Gårding
bound with positive coercivity coefficient. The lower-bound shift may have
either sign; use L²(0,T;H⁻¹) forcing and the actual L² initial datum. Density
of the pivot inclusion makes its initial boundary pairing detect the full
datum, rather than only its projection onto the pivot range closure. The
weak conclusion is an L²(0,T;H¹) representative satisfying the terminal-zero
C¹-test integral identity. Test against each eigenvector times a C¹ scalar
function with terminal value zero, recover the unique one-dimensional weak
coefficient ODE and its initial boundary value, and use basis completeness
to prove AE equality. This comparison supplies the variational solution's
weak Gelfand derivative and its C⁰([0,T];L²) representative with exact pivot
trace; neither is presupposed in the weak integral conclusion. These
comparisons consume PDE F24–F25 and the preceding spectral construction;
they do not rely on importing either newer name at the selected native pin. For smooth initial data and forcing,
use the spectral characterization of every power of `1+∇̄*∇̄` from PDO P7
to prove convergence of the heat series in every spatial `H^{2k}`, uniformly
on compact time slabs. Differentiate the coefficient ODEs to obtain the same
control for time derivatives; CKG K5a's Sobolev embeddings then give joint
smoothness, including the one-sided initial jets. This constructs a smooth
solution to which the closed-bundle Schauder estimate applies and identifies
it with the weak solution by the coefficient uniqueness just proved.
For general Hölder data use smooth approximations uniformly bounded in the
stated α norms and converging at each strictly lower β exponent; smooth
functions need not be dense in the full α Hölder norm. Compactness at β and
lower semicontinuity of the α seminorm give the stated initial Schauder solution.
Continue from this base operator along the convex interpolation of positive
principal tensors and lower coefficients. Uniform estimates and operator-norm
continuity give open/closed solvability and the bounded initial-value inverse;
PDE F25’s abstract weak theory alone gives no closed-bundle Schauder solution.
Prove uniqueness for the Hölder nondivergence operator from the absorbed
Schauder estimate applied to zero data. Energy/Gronwall is used for the smooth
metric-compatible base, not by differentiating merely Hölder a. Include the
bounded initial-value inverse and parameter dependence. Higher regularity and
positive-time smoothing have the corresponding additional coefficient/forcing
regularity; all-order smoothing assumes smooth coefficients and forcing.

**R2.3 — Quasilinear solution.** For a depending smoothly on (x,t,u), uniformly
positive near u₀, and smooth lower terms F(x,t,u,∇̄u), prove local existence,
uniqueness and smooth dependence for
`∂_t u=a^ij(x,t,u)∇̄_i∇̄_j u+F(x,t,u,∇̄u)`.
The linearization has scalar principal coefficient a; dependence of a on ∇u
is not part of this theorem. Use the linear solution operator frozen at u₀,
a smooth reference solution with the prescribed trace and zero-trace corrections.
Prove a positive power of T controls their **lower** parabolic Hölder norms
from their top norm, and smallness of a(u)−a(u₀); there is no unjustified small-T
factor on the full top Schauder norm. Composition/product estimates give a
self-map and contraction on an explicit ball after choosing its radius and T.
Prove positivity/open-admissibility persists, regularity bootstraps to all
spatial/time orders, initial compatibility for smooth data, restart and
continuation while ellipticity and the controlling section norms remain bounded.
This is the analytic theorem used by the metric equation, not a new assumption.

**R2.4 — Geometric gauge and uniqueness.** Define
`W(g,ḡ)^k=g^ij(Γ(g)^k_ij−Γ(ḡ)^k_ij)` by tracing the connection-difference
tensor. Prove it is a vector field and
`∂_t g=−2Ric(g)+L_W g`
has principal part `g^ab ∂_a∂_b g_ij`. Prove the cancellation in the Ricci
linearization, including its degenerate diffeomorphism directions, and identify
the remaining smooth quadratic first-derivative terms. Apply R2.3 on Sym²T*M;
it is the real scalar-principal tensor system just constructed.

Integrate −W using DG3.5’s time-dependent evolution maps and their
suspension on ℝ×M, smooth parameter dependence and compactness on each finite
time slab. Prove the required endpoint extension for the one-sided initial
interval, and build the metric pullback/differentiation comparisons on those
actual diffeomorphisms. Recover Ricci flow by pullback.
For uniqueness of two Ricci flows, solve the harmonic-map heat gauge into the
same fixed target (M,ḡ), starting at id. Build the equation in an exponential
neighborhood of id as an R2.3 system with scalar principal g(t)⁻¹, prove C¹-close
maps to id are diffeomorphisms, and compare the resulting DeTurck metrics and
gauge ODEs. Forward uniqueness suffices here; backward uniqueness is not
assumed. Prove independence of ḡ, isometry naturality, and an integrable-vector-
field criterion giving a limiting diffeomorphism when all spatial derivatives
of its generator are time integrable, with inverse/Jacobian control.

The construction order is R1, R2, the algebraic carriers/reaction R5.1–2,
R4.1–3, R3, R5.3–6, then R6–R8. R1’s metric-family equation predicate is
available before curvature evolution; R3 adds maximal intervals and estimates.

## R3 — flows, continuation and estimates

**R3.1 — Maximal flow.** Define Ricci flow on an actual interval with native
metric initial data and the differential equation. Give short-time existence,
uniqueness on overlaps, restriction/restart, gluing and a unique maximal interval
[0,T), T∈(0,∞]. Include smooth dependence on data in the section topologies,
transport under diffeomorphisms, isometries, finite covers and products. The
normalized version has its corresponding initial-value and maximal theory.

**R3.2 — Curvature derivative estimates.** Derive the commuted equations for
∇^k Rm and the metric-norm evolution, with each lower term an explicitly bounded
contraction. If |Rm|≤K on M×[0,A/K], prove global Shi-type bounds
`|∇^k Rm|≤C(n,k,A) K t^(−k/2)` for t>0, and versions including the initial
higher-derivative bounds up to t=0. Build the Bernstein weighted-sum argument
from R4's scalar maximum principle; constants and scaling must be uniform.
For time-varying bundles include commutators of ∂_t and ∇ and the extra
normalization terms. Supply interpolation with bounded higher covariant
derivatives, so decay in the zeroth norm yields decay of every derivative on
positive-time slabs.

**R3.3 — Continuation.** For a finite maximal time T, prove
`sup_(M×[0,T)) |Rm|=∞`. A curvature bound controls g and g⁻¹ on finite time
intervals, R3.2 controls all covariant derivatives, and R1's connection variation
transfers these to a fixed background atlas. Construct a C∞ positive limit at T
and restart R2. Establish equivalence of the relevant fixed/covariant norms
before invoking an existence theorem. Give short existence-time bounds from
curvature/metric data, scalar lower blow-up comparison
`Scal_min(t)≥s₀/(1−2s₀t/n)` for s₀>0, and the appropriate finite-time inequality.
Positive scalar curvature alone forces finite unnormalized lifespan; it does
not prove spherical convergence.

## R4 — curvature evolution and tensor maximum principles

**R4.1 — Evolution and frame comparison.** Derive the Ricci, scalar,
Riemann-tensor and volume equations from R1. In particular
`∂_t Scal=L_g Scal+2|Ric|²`, and volume differentiation gives
`d Vol/dt=−∫Scal`. Construct the moving-frame/Uhlenbeck connection on the
pullback tangent bundle over M×time; prove its metric compatibility and compare
all tensors with the native fixed-time ones. Construct isometries `ι_(t,x)` from
the fixed reference tangent fibre `(T_xM,g₀)` to `(T_xM,g(t))` by the
moving-frame ODE, and express the curvature equation for the pullbacks
`ι_(t,x)*curvatureFourTensor (g t) x` in that fixed metric bundle. Derive the operator Q equation
and its normalized radial term, and verify it on the Einstein/round examples.
Differentiate in local frames only after proving the change-of-frame law.

**R4.2 — Scalar and convex-bundle maximum principles.** Prove comparison on
a closed evolving manifold for ∂_t u≤L_g u+b·∇u+F(t,u), with locally Lipschitz
F and bounded coefficients on each finite slab. Include strict barriers,
one-sided extrema/time derivatives, nonnegative preservation, strong positivity,
Gronwall bounds and drifting equations. For sections of a metric vector bundle
with a compatible evolving connection, prove the ODE–PDE principle for a
parallel-transport-invariant closed convex fibre set C and a reaction locally
Lipschitz on bounded sets: ODE invariance implies preservation by the heat system.
Build nearest-point/supporting-functional and distance-to-C estimates in finite
fibres and the scalar comparison for its maximal distance. Identify the convex
positive tangent cone with native `tangentConeAt ℝ≥0`; the real cone allowing
negative scalar multiples is not the required one. Include time-dependent C
with its stated tangent/normal velocity condition and positive-improvement
results for strict inward reactions. Do not turn an arbitrary ODE-invariant
nonconvex set into a tensor maximum-principle hypothesis.

**R4.3 — Finite-dimensional ODE API.** On the actual algebraic tensor space
of R5 prove local existence, uniqueness, continuous dependence and restart for
Q and its εI perturbations. Prove closed convex invariance from the inward
positive-tangent/supporting inequalities, with bounded-set Lipschitz estimates
and strict-barrier limits. This is the invariance criterion applied to the concrete Q cones and
sets constructed in R5–R6. A volume-normalized equation preserves the homogeneous cones via scaling;
a translated/nonhomogeneous pinching set F is used in the unnormalized flow,
not incorrectly assumed invariant under the normalized radial term.

## R5 — algebraic curvature operators and invariant cones

**R5.1 — Actual finite-dimensional objects.** Construct the closed submodule
of native `ContinuousMultilinearMap ℝ (fun _ : Fin 4 => E) ℝ` defined by the
pair skew-symmetries, pair interchange and first Bianchi identity. Compare it
with the self-adjoint Bianchi subspace of End(Λ²E), using RiemannianGeometry's
Gram/exterior carrier. Prove basis change, orthogonal equivariance, scalar/Ricci
traces, Weyl/scalar/traceless-Ricci projections and their reconstruction.
Construct `curvatureFourTensor g x` in this submodule on `T_xM`, characterized
by `curvatureFourTensor g x (u,v,z,w)=g_x(R^g_x(u,v)w,z)`, with `R^g` the
native Levi-Civita `curvatureTensor`. Install g's native metric instance
locally, as for `metricRicci`, and use finite dimensionality to pass from
multilinearity to continuity. Prove its symmetry/Bianchi membership from
metric compatibility and torsion freeness, and identify its Ricci/scalar
contractions and its bivector operator with the native ones and RG R1's
curvature operator. Prove smooth dependence on x and equivariance under
orthonormal frames; R4's moving-frame equation and R6–R7's pointwise cone
conditions use this map. For every linear isometry `ι:V≃ₗᵢ(T_xM,g_x)`,
construct its four-tensor pullback in the fixed space
`algebraicCurvatureSubmodule V`, and prove membership in each O(n)-invariant
cone is independent of ι. R4.1’s time-dependent pullbacks use this same map.
Define the Kulkarni–Nomizu product explicitly and compare it with the symmetric
operator product A∧B, whose value on u∧v is
`½(Au∧Bv+Bu∧Av)`; `Id_E∧Id_E=I`. State the dimension restrictions n≥3 on the
Ricci/Weyl splitting; in dimension three Weyl vanishes, while dimension two
has its separate one-dimensional curvature space.

**R5.2 — Reaction.** Define Q by its actual contraction in an orthonormal basis,

`Q(r)_ijkl=Σ_pq r_ijpq r_klpq+2Σ_pq r_ipkq r_jplq−2Σ_pq r_iplq r_jpkq`.

Prove independence of basis, Bianchi preservation, equality to 2(R²+R#),
orthogonal equivariance, homogeneity, continuous bilinear polarization and
bounded-set Lipschitz estimates. Build finite spectral calculus for Rop and
Ric, ordered eigenvalues and continuity, and prove positivity/2-positivity
as native symmetric-operator inequalities. For 2-positivity use the sum of
the two smallest eigenvalues on Λ², only when that space has dimension≥2;
use the equivalent positive trace on every two-dimensional subspace.

**R5.3 — Basic cones and dimension-three identity.** Define nonnegative
curvature operator, 2-nonnegative operator, nonnegative sectional curvature,
PIC and PIC2 as `ProperCone ℝ` objects in the algebraic-curvature space,
with interiors/strict conditions
and orthogonal invariance. Use the same `ProperCone` carrier for the deformed
families and `ProperCone.map` for their invertible deformation maps; prove the
underlying set is the actual image, using finite-dimensional invertibility.
Prove nonempty interior and salience where asserted as separate properties.
In particular do not assume salience for PIC: in dimension four every pure
traceless-Ricci tensor has zero isotropic expression, giving nonzero lines
in that cone. The PIC2 and pinching-family positive-scalar conclusions have
their own proofs below. Prove operator positivity implies 2-positivity
in n≥3, 2-positivity implies positive Ricci and scalar curvature, and
in n=3 positive Ricci is equivalent to 2-positive Rop. Diagonal Ricci and
Rop in corresponding three-frame/bivector bases: Ricci eigenvalues are pairwise
sums of the three operator eigenvalues. Prove preservation of 2-nonnegativity
by the eigenvalue/supporting two-plane reaction inequalities. For n=3 build the
pinching family `C(s)={Ric≥(s/3)Scal Id}`, 0≤s<1, prove strict transversality
for s>0 by its three-eigenvalue polynomial, and the round-ray endpoint.
Do not claim positive sectional entries in one basis imply operator positivity,
or positive Ricci preservation in arbitrary dimension.

**R5.4 — Böhm–Wilking deformation.** For n≥3 define
`ℓ_(a,b)(R)=R+2(n−1)a R_I+(n−2)b R_Ric₀` and its inverse for the explicit
nonzero eigenfactors `1+2(n−1)a≠0` and `1+(n−2)b≠0`. Here
`λ̄=Scal/n`, `Ric₀=Ric−λ̄Id`, `R_I=(λ̄/(n−1))I`, and
`R_Ric₀=(2/(n−2))Ric₀∧Id`, with the wedge convention of R5.1.
For X=Q/2 compute
`D_(a,b)=ℓ⁻¹X(ℓR)−X(R)`, prove independence of Weyl, and the full tensor
formula and Ricci-diagonal eigenvalue formulas of Böhm–Wilking Theorem2 and
Corollary2.3. These formulas are required, with n and every denominator's
nonvanishing hypotheses, rather than an unexplained claim that a cone deforms.
In particular prove, writing I for the identity curvature operator,

`D_(a,b)(R)=((n−2)b²−2(a−b))Ric₀∧Ric₀+2a Ric∧Ric`
`             +2b² Ric₀²∧Id+κ_(a,b) I`,

where
`κ_(a,b)=tr(Ric₀²)/(n(1+2(n−1)a))`
`         ·(nb²(1−2b)−2(a−b)(1−2b+nb²))`.
The discrepancy for Q is exactly `ℓ⁻¹Q(ℓR)−Q(R)=2D_(a,b)(R)`.
For n=3 verify the identity with the Weyl summand zero.
Prove Proposition3.2 for a closed convex
O(n)-invariant Q-invariant cone C whose nonzero elements have positive
scalar curvature, every element has nonnegative Ricci curvature, and which
contains every nonnegative rank-one curvature operator. Its parameter
hypotheses are `2a=2b+(n−2)b²`,
`0<b≤(sqrt(2n(n−2)+4)−2)/(n(n−2))`. Prove `ℓ_(a,b)(C)`
is Q-invariant and Q points strictly into its positive tangent cone at every
nonzero boundary point.

For n≥4 set
`b_*=(sqrt(2n(n−2)+4)−2)/(n(n−2))` and
`a_*=(2b_*+(n−2)b_*²)/2`. The first piece is
`A_b=ℓ_(a(b),b)(C_2)` for `0≤b≤b_*`, where `C_2` is the cone of
2-nonnegative curvature operators and `a(b)=(2b+(n−2)b²)/2`. Show `C_2`
meets every hypothesis just stated.
At the endpoint prove `A_(b_*)⊆{R≥0}` by the smallest-curvature-operator and
smallest-Ricci eigenvalue estimates in the proof of Corollary 3.3.

Define the nonnegative-operator path `D_b` for `0≤b≤1/2` by
`D_b=ℓ_(a_b,b){R≥0, Ric≥(p_b/n)Scal Id}`,
`a_b=((n−2)b²+2b)/(2+2(n−2)b²)` and
`p_b=(n−2)b²/(1+(n−2)b²)`. It starts at `D_0={R≥0}` and ends at `D_(1/2)`.
For `u≥0` continue with
`E_u=ℓ_((1+u)/2,1/2){R≥0, Ric≥(p_u/n)Scal Id}`,
`p_u=1−4/(n+2+4u)`; its `u=0` cone is exactly `D_(1/2)`.
Use Lemma 3.4 for ODE invariance of `D_b` for `0≤b≤1/2`, and for strict
inward transversality at every nonzero boundary tensor only for `0<b≤1/2`.
At `b=0` the entire cone `D_0={R≥0}` is invariant, but is not asserted strictly
inward: the rank-one product curvature of `S²×ℝ^(n−2)` has `Q(R)=2R` on its
nonzero boundary ray. Use Lemma 3.5 for both properties of `E_u` for every
`u≥0`. Concatenate the three pieces as the single path: first `A_b` from `b=0` to
`b=b_*`; then `A_(b_*)∩D_b` from `b=0` to `b=1/2`; then
`A_(b_*)∩E_u` from `u=0` to `u=∞`. Reparameterize the concatenated compactified
interval continuously onto `[0,1)`. The first cone is `A_0=C_2`; the second
starts at `A_(b_*)∩D_0=A_(b_*)` because `A_(b_*)⊆{R≥0}`, so the first and
second pieces meet at `A_(b_*)`. At this join strict transversality is that
of `A_(b_*)`, since `b_*>0`; it is not a strictness claim about all of `D_0`.
The last two meet at
`A_(b_*)∩D_(1/2)=A_(b_*)∩E_0`. Since intersections of invariant closed convex
cones remain invariant, the strictness, full dimension, positive scalar,
continuity of scalar-normalized sections, and round-ray limit must be checked
for these intersections; the endpoint inclusion alone does not prove those
properties.
Use the eigenvalue estimates in Lemmas 3.4–3.5 to prove strictness, not just
ODE invariance. Use R5.3's explicit family in n=3.

**R5.5 — Nonnegative isotropic curvature and PIC2.** Here PIC names the
closed nonnegative-isotropic-curvature cone; the strict condition is called
positive isotropic curvature. With `r(u,v,z,w)=g(R(u,v)w,z)`, verify the
complexified identity for `z=e₁+i e₂`, `w=e₃+i e₄`:
`r(z,w, z̄,w̄)=r₁₃₁₃+r₁₄₁₄+r₂₃₂₃+r₂₄₂₄−2r₁₂₃₄`.
Prove it from pair interchange and first Bianchi in the chosen convention;
this is the bridge from complex isotropic vectors to the real four-frame
inequality, not an independent curvature convention. PIC means
`r_1313+r_1414+r_2323+r_2424−2r_1234≥0` on every orthonormal four-frame.
Prove its Q boundary inequality. The proof builds the frame-rotation first
variation identities, separates contraction sums into the four-frame block,
mixed block and orthogonal complement, and uses second variation to make the
complement block matrix positive semidefinite. Its blocks are
`A_pq=r_1p1q+r_2p2q`, `B_pq=r_3p3q+r_4p4q`,
`C_pq=r_3p1q+r_4p2q`, `D_pq=r_4p1q−r_3p2q`,
`E_pq=r_12pq`, `F_pq=r_34pq`.
All complement indices run from 5 to n, and the frame is a boundary frame
where the isotropic expression vanishes, and assume R has nonnegative
isotropic curvature on every orthonormal four-frame. Prove from the second variation
that
`L=[[B,−F,−C,−D],[F,B,D,−C],[−Cᵀ,Dᵀ,A,−E],[−Dᵀ,−Cᵀ,E,A]]`
is positive semidefinite. Set
`U=[[0,0,I,0],[0,0,0,−I],[−I,0,0,0],[0,I,0,0]]`, with blocks of size n−4.
Construct these actual block matrices from Brendle–Schoen Proposition9 and prove
`tr(AB)+tr(EF)−tr(C²)−tr(D²)≥0` from its positive-semidefinite trace pairing.
Specifically expand `tr(LULUᵀ)/4` to the displayed expression and prove it
nonnegative by the trace pairing of L with `ULUᵀ`; include the empty-block
n=4 case.
The first-variation identities make the other two blocks zero. The remaining
squares in Q are nonnegative. Include the εI barrier argument and passage to
limits, proving PIC ODE and PDE preservation.

Define PIC2 as the condition that the zero extension of R to E⊕ℝ² has
nonnegative isotropic curvature. Prove Q commutes with zero extension, so PIC
preservation gives PIC2 preservation. For n≥4 prove its exact four-frame
characterization, for λ,μ∈[−1,1],

`r_1313+λ²r_1414+μ²r_2323+λ²μ²r_2424−2λμr_1234≥0`.

Build both directions through the two-bivector normal-form lemmas, including
the degenerate/self-dual cases and the planar rotation of the pair; the simple
choice of extended frames proves only one direction. Show PIC2 implies
nonnegative sectional curvature, contains all nonnegative operators, and its
nonzero elements have positive scalar. Interior means a strict inequality
with a uniform positive margin on the compact frame/parameter space.
Using R5.4's discrepancy, construct the Brendle–Schoen deformed PIC2 family
with R∈PIC2 in place of R≥0. Define its combined parameter σ≥0: for
0≤σ≤½ take b=σ and the first branch’s a,p; for σ≥½ take b=½, a=σ and
`p=1−4/(n−2+8σ)`, so R5.4’s second-branch variable is u=2σ−1. Verify the
common endpoint and all inward inequalities, continuity and the round-ray
limit as σ→∞. PIC alone is a weaker condition and
is not the convergence hypothesis in R7.

**R5.6 — Quarter pinching and PIC2.** Prove Berger's mixed-component estimate
`|r_1234|≤(2/3)(Kmax−Kmin)` from sectional polarization and Bianchi.
For positive sectional min m and max M at a point with M<4m, insert it into
the PIC2 expression to prove a strictly positive value for every λ,μ and frame:
`m(1+λ²+μ²+λ²μ²)−(4/3)(M−m)|λμ|>0`.
Treat λμ=0 directly; the weak borderline M=4m gives only ≥0. Prove min/max
existence and continuity on the compact Grassmann/frame fibres, and uniform
strict margins over a compact base. Do not use PIC2 interior for weak quarter
pinching: complex projective space at the borderline is an acceptance counterexample.

## R6 — pinching sets and smooth normalized convergence

**R6.1 — Pinching family to invariant set.** A pinching family consists of
closed full-dimensional convex O(n)-invariant cones, with positive scalar on
nonzero elements, strict inward Q on every nonzero boundary for positive
parameters, continuity in the parameter of the scalar-normalized compact
sections in Hausdorff distance, and convergence of those sections to
the positive round ray. State this using explicit Hausdorff/epsilon conditions
on trace-one sections; prove equivalence with pointed cone convergence.
For every compact initial tensor set K in the initial cone interior, construct
a closed convex invariant F containing K whose tensors outside any specified
later cone form a bounded set. Prove the translated/truncated cone lemma with
uniform transversality on compact parameter intervals, then build F by nested
intersections or the minimal invariant convex hull. Include all boundedness,
nonempty-intersection and ODE-limit arguments. In the PIC2 family build the
Brendle–Schoen sequence with its scale fixed by K. Choose
`h≥max(1,sup_(R∈K)Scal(R))` and `θ₀>0` with `K⊂C(θ₀)`, and start
`F₀=C(θ₀)`. Construct increasing θ_j with
`F_(j+1)=F_j∩{R+2^(j+1)hI∈C(θ_(j+1))}` and
`F_j∩{Scal≤2^j h}⊂F_(j+1)`. Prove θ_j→1 and that each F_j is
closed, convex, O(n)-invariant, Q-invariant by the translated-cone lemma, and contains K,
and that their intersection has the required invariance and boundedness.
Equivalently normalize K by h before the unit-shift construction and scale
the resulting sets back by h, proving that positive scaling preserves Q
invariance by the corresponding time rescaling. Here θ=σ/(1+σ) converts R5.5’s combined unbounded parameter
σ to the common [0,1) parameter; construct the inverse and transport every
continuity/transversality estimate under that reparametrization. F need not be homogeneous; its asymptotic cone is the nonnegative round ray.

**R6.2 — Coordinate and noncollapse connectors.** Prove C^k control of the
pullback metric on exponential balls of radius r<π when K≤1 and curvature
derivatives are uniformly bounded, from Jacobi equations and radial parallel
frames. Conjugate-radius control suffices here; exp need not be injective.
Give compactness on every smaller ball by Arzelà–Ascoli/diagonal extraction,
with positive-definite lower bounds from Rauch. Build overlapping-ball
propagation and comparison of their tensor/frame limits.

Prove the Klingenberg quantitative estimate needed after global pinching:
on a closed simply connected n≥3 manifold with `δ≤K≤1`, δ>¼,
`inj≥π`. Build its cut/conjugate/short-geodesic-loop alternative on RiemannianGeometry R4.6's
carrier. The strict-quarter argument below applies in every n≥3; the
separate oriented even-dimensional positive-curvature argument also includes
surfaces, without a quarter-pinching hypothesis. The n≥3 argument consumes
RiemannianGeometry R3’s
finite broken-geodesic models, subdivision/straightening, node-value Hessian
and Morse index theorem, with [MorseTheory M1–M3](../MorseTheory/README.md)’s compact-band deformation
and relative C² Morse approximation.
Define the conjugate radius as the infimum of first positive singular
exponential times over the unit tangent bundle, with ∞ for no singular time,
include local/global and ∞ conventions, isometry/pullback and sqrt(c) scaling,
positive compact lower bounds, finite attainment and nonsingularity of every
smaller tangent ball. Prove Rauch gives `conj≥π` under K≤1. Prove the
Klingenberg cut lemma:
if the global injectivity minimum is less than the conjugate radius, it is
half the length of a closed geodesic, whose minimizing halves are the only
minimizing segments between its endpoints.

Own the bounded-energy version of Cheeger–Ebin Lemma4.11 on
RiemannianGeometry R3’s finite
vertex manifold: when every critical point above a has Hessian index≥2,
every path with endpoint values≤a can be deformed relative endpoints to
energy≤a+ε. Prove it by compact-band finite Morse approximation, lower
semicontinuity of the negative index, and perturbing the one-dimensional
path off each codimension≥2 positive-coordinate locus before handle
retraction. Own that relative handle retraction explicitly: on
`D^λ×D^(m−λ)` remove the cocore `{0}×D^(m−λ)`, radially retract the nonzero
negative coordinate to `∂D^λ×D^(m−λ)`, and transport through M2’s handle
homeomorphism, extending by the identity on the lower sublevel. Prove
continuity across the attaching overlap and fix the endpoint sublevel pointwise.
Consume RiemannianGeometry R3’s no-critical-value deformation/compact-band
comparison and MorseTheory M1–M3’s deformation/local Morse/relative
approximation APIs. Consume R3’s compact-band and subdivision/refinement
verification for the energy; verify here that the C²-small perturbation,
with compact support in a larger band, preserves band compactness and the
energy error used to transport the deformed path back. This uses **based** paths; no new
Hilbert manifold or free-loop Morse–Bott theory is assumed.

For δ>¼ and n≥3, construct the n−1 negative sine-parallel fields on every
fixed-endpoint geodesic of length **greater than** π/sqrt(δ). Endpoint equality
has nullity and must not be counted as negative index. If a closed geodesic
γ has length<2π, choose `max(length γ,π/sqrt(δ))<A<2π`. Its based nullhomotopy
is captured by a finite subdivision; the preceding lemma gives a based
contraction with every length<A, with the energy normalization made explicit.
For a curve on `[t₀,t₀+T]`, the pinned energy is
`E(γ)=½∫|γ′|²`; Cauchy–Schwarz gives `Length(γ)²≤2T E(γ)`, and the R3
polygonal energy uses the same factor `½`. Parametrize the initial geodesic
loop with constant speed, so `E(γ)=Length(γ)²/(2T)`. Put
`a=max{Length(γ),π/√δ}²/(2T)` and choose `ε>0` with
`a+ε<A²/(2T)`. The based-path deformation bound `E≤a+ε` then gives
`Length<A` by the same inequality. This strict margin is what the long-homotopy
obstruction requires.
Prove the long homotopy obstruction: a nonconstant geodesic loop cannot
contract through based loops all of length<2 conj. With a uniform length
margin, lift the contraction through exp to its nonsingular tangent ball;
Gauss lemma bounds the radial escape of a closed lift by half its length,
local inverse charts make the set of liftable parameters open, and compactness
makes it closed. A geodesic lift is a radial ray and cannot be closed.
Thus no closed geodesic of length<2π exists. This proves the required
n≥3 strict-quarter bound through Cheeger–Ebin Theorem5.10’s strict-pinch route,
with the endpoint length included in A.
The even-dimensional argument constructs a holonomy-fixed periodic normal
field, shortens the closed cut geodesic by second variation, and takes a
maximum-distance segment to the shortened loop. At the limit this segment
is perpendicular to the original loop’s midpoint, contradicting the two
nonconjugate minimizing halves there. Prove the loop/cut and endpoint-continuity
lemmas used in both arguments. Also prove the closed oriented even-dimensional
positive-sectional
estimate `inj≥π/sqrt(Kmax)` used on the oriented surface cover in R8.
Prove the volume lower bound of such an injectivity ball from RiemannianGeometry R4.1's Günther
comparison. Transfer it through the fixed finite universal-cover degree. Prove compact
connected covers have finitely many sheets (their fibres are compact discrete),
and `Vol(cover)=degree·Vol(base)` by evenly covered charts and density
integration with a partition. Myers supplies compactness of the complete
universal cover once a positive Ricci lower bound is obtained. This is
a quantified noncollapse statement, not an assumption that bounded curvature
alone prevents collapse. Compare covariant derivative norms with finite-chart
norms and bound Sobolev/Hölder/interpolation constants on these controlled
balls, using the actual shared section spaces.

**R6.3 — From F to global roundness and normalized existence.** For n≥3 and
initial tensors in K⊂F, tensor maximum gives Rm(t)∈F. Positive scalar gives
finite maximal unnormalized T. Choose curvature-record times approaching T;
R3 supplies uniform derivative bounds after scaling the maximum sectional
curvature to one. First prove `|Rm|≤C_F(1+Scal)` on F by the
compactness of its scalar-normalized asymptotic sections; the positive scalar
minimum along this flow converts it to the needed norm/scalar comparability.
Pull back to exponential balls at a maximum point. Every limit tensor lies
on the nonnegative round ray because F's non-round part is bounded. Schur in
n≥3 makes the connected-ball limit constant curvature one. Propagate on
overlapping radius-<π balls to radius 2π. The minimizing-segment index/Myers
argument then bounds the diameter by 3π/2 and makes the sectional minimum
converge to one globally.

Extend from record times to all late times explicitly: scalar minima are
nondecreasing; at the record times they approach the current maximum. The
last preceding record bounds the earlier curvature maxima by a fixed multiple
of the present maximum, so R3's derivative estimates apply at every late time.
Repeat the local/propagation argument to obtain global min/max ratio→1.
This step cannot be replaced by a local limit or a subsequence-only conclusion.

At late times global pinching is strict quarter pinching. Apply R6.2 to the
simply connected finite cover to bound the scaled volume below, and Myers/
Bishop comparison to bound it above. With fixed normalized volume these give
positive lower and finite upper bounds for normalized sectional curvature.
Scalar maximum/minimum ODE comparisons now show unnormalized curvature is
comparable to `(T−t)⁻¹`; the normalization scale is comparable to that curvature.
Hence τ(t)→∞. Prove normalized continuation by R3.3. These arguments establish
all-time normalized existence, uniform curvature/derivative/diameter controls,
and global operator pinching tending to the round ray.

**R6.4 — Fixed-manifold smooth convergence.** Prove the remaining analytic
convergence step intrinsically. Let E=Ric#−Scal/n Id be the traceless Ricci
endomorphism; define `(Rm*E)_ij=Σ_pq r_ipjq E_pq` in an orthonormal
frame and prove its invariant contraction formula. In normalized flow derive

`(∂_τ−L_g)E=2 Rm*E+(2/n)(Scal−r̄)E−(2/n)|E|²Id`.

For an operator globally sufficiently close to κId, κ=r̄/(n(n−1)) bounded
above and away from zero, the constant-curvature contraction on tracefree E
is −κE. The norm equation and R6.3's global pinching give
`(∂_τ−L_g)|E|²≤−2|∇E|²−c|E|²`, c>0, for all late τ.
Prove the finite-dimensional contraction norm bound and choose an explicit
small pinching threshold depending on n to absorb every error.
Maximum principle gives exponential decay of E; R3 derivative interpolation
gives decay of every covariant derivative. Contracted Bianchi gives
`div E=((n−2)/(2n))d Scal`; n≥3 is essential. Diameter control therefore
makes Scal−r̄ and all its spatial derivatives decay exponentially.

Since `∂_τ g=−2 E_cov−(2/n)(Scal−r̄)g`, its metric norm is time integrable.
Integrate to get uniform equivalence to one late reference metric. The
connection-variation formula and decaying derivatives transfer all higher
estimates to this fixed connection, inductively, making ∂_τ g integrable in
every C^k norm. Construct a positive C∞ limit g∞ on the original M and prove
exponential C^k convergence. R6.3's pinching tending to one makes this limit
constant **positive** curvature; an Einstein limit alone would not suffice.

Derive also `g(t)/(2(n−1)(T−t))→g_round` with curvature one by differentiating
the inverse scale b=1/a, with `db/dt=−2r̄(ĝ)/n`, `b(T)=0`,
and `b/(T−t)→2(n−1)κ∞`. Thus the limit is κ∞g∞, of curvature one. This gives the
source's factors 4 in dimension three and 6 in dimension four. This proof
supplies the convergence step used by the curvature-cone theorems; no
unproved near-round stability theorem or metric-slice construction is assumed.

## R7 — positive curvature operators and pointwise sphere theorems

**R7.1 — Böhm–Wilking and Hamilton.** Apply R5's 2-nonnegative pinching family
and R6 to every closed connected n≥3 initial metric with 2-positive curvature
operator. Prove volume-normalized all-time C∞ convergence to a positive
constant-curvature metric, and the unnormalized round scaling. Positive
operator is a special case. In n=3 use the explicit Ricci-pinch family and
positive-Ricci/2-positive equivalence; conclude Hamilton's theorem with its
full smooth metric convergence. In n=4 obtain the source's positive-operator
sphere theorem, keeping positivity on all bivectors rather than replacing it
by basis-diagonal sectional positivity.

**R7.2 — Brendle–Schoen.** For n≥4 and a closed connected metric whose
curvature lies in the interior of PIC2, apply its deformed cones and R6.
Pointwise strict quarter pinching implies this hypothesis by R5.6, so its
normalized flow exists for all time and converges smoothly to a round metric.
State pointwise pinching as `0<K_x(π)<4 K_x(π')` for all two-planes at the
same point; it is different from one pair of global bounds over all points.
The strict theorem supplies a diffeomorphism to a spherical space form.
Neither PIC alone nor weak quarter pinching is substituted for its hypothesis.

**R7.3 — Space forms, naturality and equivariance.** On the same smooth
manifold use RiemannianGeometry R4.7's complete positive constant-curvature
model/covering classification to construct the actual diffeomorphism to
Sⁿ/Γ, with Γ finite acting freely by orthogonal transformations. Simple
connectivity makes Γ trivial. Compare the native sphere's induced Riemannian
metric and smooth structure; its ambient chordal distance is not the round
geodesic distance. Do not infer a homeomorphism/diffeomorphism merely from
vanishing Betti numbers.

Uniqueness makes every initial isometry preserve the evolving metrics and
limit. For a group acting by smooth initial isometries, transport the action
to the round quotient. In the simply connected case obtain an equivariant
diffeomorphism to Sⁿ and a homomorphism to O(n+1). For a jointly smooth compact
Lie action prove the resulting orthogonal homomorphism smooth by evaluating
on a fixed round-sphere frame of points; no unconstructed general isometry-
group Lie structure is needed. Include restrictions, commuting actions, finite
cover/descent and normalized-volume compatibility.

## R8 — positive surfaces and the complete global sphere statement

**R8.1 — Surface potential, Harnack and entropy.** In dimension two identify
Ric=(Scal/2)g. Set R=Scal and r=r̄; normalized flow has
`∂_τ g=(r−R)g`, `∂_τ R=L_g R+R(R−r)`, and r is constant by variation of
∫R and volume. Preserve R>0. Construct the smoothly time-dependent potential
`L_g f=R−r`, unique modulo time constants, on the shared mean-zero Sobolev/
smooth carriers. Prove dependence and differentiating the inverse on each
finite slab, using its kernel/complement projections; choose the time constant
so `∂_τ f=L_g f+r f`. For
`M=Hess f−½(L_g f)g` and `h=R−r+|∇f|²` prove
`(∂_τ−L_g)h=r h−2|M|²`. This gives curvature bounds on every finite normalized
interval and all-time existence **before** using the entropy argument.

For L=log R and Q=L_g L+R−r derive
`(∂_τ−L_g−2∇L·∇)Q=2|Hess L+½(R−r)g|²+r Q≥Q²+rQ`.
Prove `Q≥−r/(1−exp(−rτ))` and integrate along space-time paths to obtain
Hamilton's Harnack inequality with the time factor exp(rτ)−1 and the actual
evolving-metric path energy. Derive
`d/dτ ∫R logR=∫(R−r)²−∫|∇R|²/R`.
The weighted average Z=(∫QR)/(∫R) satisfies Z'≥Z²+rZ; global existence
forces Z≤0, so the entropy is nonincreasing.

**R8.2 — Uniform surface geometry.** Pass to the oriented cover when
necessary. Positive R makes the scalar average r strictly positive directly;
the constancy of ∫R is the R8.1 evolution/Stokes calculation. No Euler-number
or simple-connectivity argument is needed here. Use R6.2’s oriented even-
dimensional injectivity estimate and Günther comparison on that cover.
If the scalar maximum is A, the short interval of length c/A has
R≤2A; Harnack gives R≥cA on a ball of radius c/sqrt(A). Its area is ≥c/A.
Thus the entropy is ≥c log A−C (bound the negative contribution outside the
ball separately), proving a uniform scalar upper bound. Injectivity, fixed
area and ball-volume comparison bound diameter. Harnack plus the positive
constant average r then gives a uniform positive lower bound. Derive uniform
curvature derivatives and controlled Sobolev/Hölder constants. Construct the
uniform mean-zero inverse estimates by the Bochner/Lichnerowicz bound on the
first scalar eigenvalue and VariationalMethods V3.4’s kernel-orthogonal
Poincaré and V4’s Rayleigh comparison, proving the spectral
bound from Hessian trace Cauchy–Schwarz rather than assuming it.

**R8.3 — Soliton rigidity and convergence.** Prove
`(∂_τ−L_g)|M|²=−2|∇M|²−2R|M|²` and exponential decay of all derivatives.
Pull back along +grad f: the modified metric derivative is **+2M**. Its
integrable derivatives give a smooth limit with M=0 and
`Ric−Hess f=(r/2)g`; the R1 gradient-soliton potential is −f. This is a
gradient shrinking soliton, with positive r/2. Prove such a soliton on a closed surface is round, using the
Chen–Lu–Tian argument independently of uniformization/Kazdan–Warner:
J grad f is Killing on the oriented cover and vanishes at an extremum. Its
nonzero derivative at a zero produces an effective circle isometry action.
Build the orbit-interval and polar metric `ds²+H(s)²dθ²` from Killing-flow,
normal-geodesic and isometry value/tangent uniqueness, proving smooth pole
conditions H(0)=H(A)=0, H'(0)=−H'(A)=1. The soliton equations imply f'=aH;
multiplying the curvature equation by HH' and integrating gives
`a∫₀ᴬ H(H')²=0`, so a=0. Include the identically zero Killing field and
orientation-cover descent. A compact higher-dimensional soliton is not
asserted to satisfy this rigidity.

The modified metric converges exponentially to its round limit. Curvature
norms and r are invariant under pullback, so the original flow has exponential
decay of R−r and its covariant derivatives. Integrate `∂_τ g=(r−R)g` for
fixed-reference norm equivalence and use R1’s connection variation, as in
R6.4, to transfer all covariant decay to fixed C^k norms. This makes ∂_τ g
exponentially integrable in every fixed C^k norm and directly constructs the
original flow’s positive smooth limit, with R≡r>0 and hence round.

Uniform elliptic estimates give exponential decay of the spatially mean-zero
potential in **every fixed C^k norm**, and of every derivative of its gradient.
Subtracting its time-dependent spatial mean leaves the gradient and M unchanged;
it need not preserve the earlier choice `∂_τ f=L_g f+r f`. R2.4’s integrable-
gauge criterion therefore supplies a limiting diffeomorphism and identifies
the modified and original round limits by its pullback. The fixed-norm
transfer is required: convergence only after a time-dependent pullback is
insufficient. Conclude the positive-Gauss surface space-form theorem,
including S²/RP² and cover descent.

**R8.4 — Source acceptance and global quarter pinching.** Math240
`0226_034`, physical pages3–4 (archive145–146), asks for the following.

| Source claim | Exact target and proof supplier |
| --- | --- |
| p3: complete simply connected, strictly more than quarter-pinched sectional curvature ⇒ homeomorphic to Sⁿ | n≥2; fixed constants 0<a≤b<4a bound all sectional curvatures at all points. Myers first proves compactness. Apply R7.2 for n≥4, R7.1 for n=3, and R8.1–3 for n=2; R7.3 gives an actual diffeomorphism and hence the stated homeomorphism, using the specified flow proof. |
| p3–4: closed simply connected three-manifold with positive Ricci ⇒ diffeomorphic to S³ | R5.3's dimension-three identity, R6's full convergence and R7.1/R7.3. The combined p3–4 sentence supplies the positive-Ricci hypothesis. |
| p4: closed simply connected four-manifold with positive curvature operator ⇒ diffeomorphic to S⁴ | R5.2 positivity on every bivector; R7.1 and R7.3. Positive entries on a selected wedge basis do not meet the hypothesis. |
| p3: stronger sphere statements supersede a Bochner rational-homology conclusion | Keep RiemannianGeometry R7's Bochner statement separate; Ricci-flow convergence and the space-form/diffeomorphism comparison are the mathematical suppliers here. |

For a compact pointwise-quarter-pinched metric the modern theorem has n≥4;
in dimensions two/three positive sectional curvature implies the separately
proved positive-Gauss/positive-Ricci inputs. The complete global theorem has a
fixed **positive** lower bound and a dimension at least two; vacuous plane
conditions in dimensions zero/one do not imply a sphere theorem.

Acceptance also includes round/flat/Einstein scaling and volume normalization,
nonorientable density calculations, a round quotient with nontrivial Γ,
PIC2 versus PIC and weak-quarter projective-space distinctions, and the
Ricci-linearization's pure gauge kernel versus DeTurck's scalar principal part.
The proof obligations concern closed real flow and these pinched convergence
theorems; surgery/geometrization and Kähler–Ricci evolution belong their own
geometric developments and are not implied by the preceding assertions.

## Proof references

Use the actual tensor conventions and numbered arguments in
[Brendle–Schoen, Manifolds with 1/4-pinched curvature are space forms](https://arxiv.org/abs/0705.0766)
(§§2–4), [Böhm–Wilking, Manifolds with positive curvature operators are space forms](https://annals.math.princeton.edu/2008/167-3/p10)
(§§2–5), and [Brendle–Schoen, Sphere theorems in geometry](https://arxiv.org/abs/0904.2604).
[Topping, Lectures on the Ricci flow](https://warwick.ac.uk/fac/sci/maths/people/staff/peter_topping/rfnotes/)
provides metric variation, DeTurck and ODE–PDE calculations; R2 constructs
the analytic proof of its quasilinear existence theorem.
[Cheeger–Ebin, Comparison Theorems in Riemannian Geometry](https://tysunseven.github.io/reference/Cheeger-Comparison%20theorems%20in%20riemannian%20geometry.pdf)
Lemmas4.11/5.6 and Theorems5.9–10 provide the finite-path deformation, cut
and strict-quarter lifting arguments used in R6.2.
[Petersen, Riemannian Geometry, §6.2](https://poisson.phc.dm.unipi.it/~lmigliorini/secondo_magistrale/riemanniana/petersen.pdf)
provides the oriented even-dimensional injectivity proof.
[Santoro, Introduction to Evolution Equations in Geometry](https://arxiv.org/abs/1205.1039)
provides surface-potential, Harnack and entropy calculations, with the exact
R8 definitions fixing their signs and normalizations.
[Chen–Lu–Tian's surface rigidity argument](https://arxiv.org/abs/math/0505163)
provides the independent positive-surface soliton step. Every cited convergence
result is implemented through R6/R8's explicit estimates and comparison maps,
rather than used as an additional unproved hypothesis.

## Secondary provenance

The external [DifferentialGeometry Ricci-flow development](https://github.com/qinz1yang/differential-geometry/tree/main/DifferentialGeometry/Geometry/Flow/RicciFlow)
provides references for concrete formulations. Its
`SmoothRiemannianMetric` abbreviates a native metric,
`PDE.RicciFlow.ricci_flow_short_time_existence` states a coefficient equation
and joint chart-Gram regularity, and
`exists_completeBoundedCurvatureSolutionOn_from_time_of_compact` packages joint
total-space smoothness and curvature bounds. Its
`HamiltonPositiveRicci.hamilton_positive_ricci` is a dimension-three
space-form endpoint. These are references, not imported axioms or replacements
for these mathematical contracts. Coordinate with its authors where possible,
including for independent development. Before copying or adapting code, obtain
the authors’ agreement; if coordination is not possible, verify that its
licence permits the intended reuse and discuss the plan on the Lean Zulip.
Its transitive axioms and modified dependencies are not certified here.
