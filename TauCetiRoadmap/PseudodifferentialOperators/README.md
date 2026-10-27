# Pseudodifferential operators and elliptic analysis on bundles

Build differential operators, the classical pseudodifferential calculus and its
Sobolev, elliptic and microlocal consequences on smooth finite-rank bundles.
The result includes usable symbols and kernels, quantization, composition and
adjoints, parametrices, distributional regularity and Fredholm operators. It
supplies the analytical symbol theory used in index theory and the arbitrary-order
bundle operators used in Riemannian geometry.

## Scope, conventions and suppliers

Manifolds are finite-dimensional, smooth, Hausdorff, second countable and
boundaryless. Bundles are finite-rank real or complex smooth vector bundles;
complexify real bundles for Fourier symbols, and prove compatibility with
conjugation to recover real operators. Global Fredholm assertions concern compact
manifolds. Local assertions on noncompact manifolds use compact localization and
proper support; they do not assert a global Fredholm theorem on every noncompact
base. Euclidean uniform-symbol results explicitly impose bounds uniform in x.

Use Mathlib's `FiberBundle`, `VectorBundle`, `ContMDiffVectorBundle`,
`SchwartzMap`, `TemperedDistribution`, `TestFunction`, `Distribution`,
`ContinuousLinearMap`, `ContinuousLinearEquiv`
and `ContinuousLinearMap.IsFredholm`. DifferentialGeometry supplies smooth forms,
differentiation, integration/densities and manifold partitions of
unity. [SmoothBundlesConnections B2–B4](../SmoothBundlesConnections/README.md)
supplies bundle sections, metrics, connections, L² and tensor/dual/Hom operations.
[ComplexKahlerGeometry K5a](../ComplexKahlerGeometry/README.md) supplies bundle
distributions, the shared compact-bundle H^s Hilbert scale for every real s,
localization/duality/interpolation and Laplace-type Hodge theory. Consume that
scale and compare the constructions from P1.1 onward with it. P1.0's early smooth-section
module and first-jet constructions use only SBC B2's bundle floor. K5a's initial
density bundle precedes the density-valued transpose/formal-adjoint part of P1.0.
K5a's distributional action and Laplace analysis consume the differential-operator core;
P1.1 and P2–P7 consume K5a's analytic scale.

Mathlib's `Analysis/FunctionalSpaces/BesselPotentialSpace` already bundles
`BesselPotentialSpace E F s p`, its distribution map and `toLpₗᵢ`, completeness,
and the p=2 Hilbert structure. Its unbundled comparison is
`TemperedDistribution.MemSobolev`, with
`memSobolev_iff_exists_smulLeftCLM_fourier`. Consume these actual Euclidean
carriers. Consume Tau Ceti's scalar weak-Sobolev and Bessel APIs in
`Analysis/Sobolev/{Wkp,W1p,BesselPotential,RellichKondrachov}`;
its existing Rellich theorem concerns W₀^(1,p), and W1p/Extension gives
extension by zero. [PDE Lane A.6](../PDE/README.md) owns the required
general extension and Rellich theorems; Lane A.3 owns the W^(k,p)/H^(k,p) comparison.
PDE Lane B items 8–10 own maximal-function, operator interpolation,
Calderón–Zygmund and Mihlin multiplier estimates; consume those precise
harmonic-analysis targets, rather than attribute them to existing Sobolev code. This roadmap
owns their finite-rank bundle/all-order operator comparisons, not another scalar
PDE theory. Mathlib's and Tau Ceti's existing Fredholm composition, compact
perturbation, closed-range and adjoint APIs supply the operator-theoretic output.
In particular consume Mathlib's
`ContinuousLinearMap.IsFredholm.eventually_nhds_index_eq` from
`Analysis/Normed/Operator/Fredholm/Open` and Tau Ceti's
`ContinuousLinearMap.IsFredholm.exists_pos_isFredholm_and_index_eq_of_norm_sub_lt`
from `Analysis/Fredholm/SmallPerturbation` for the norm-approximation step.
For compact self-adjoint spectral decompositions consume
`ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector` and its
injective/nonzero-eigenvalue version from Tau Ceti's
`Analysis/InnerProductSpace/Spectrum`, built on Mathlib's compact spectral
theorem. P7 owns the unbounded-domain and Sobolev comparisons.
For compact equivariance consume
[CompactGroups Layers0–3](../RepresentationTheory/CompactGroups/README.md)
for normalized Haar averaging, complete reducibility and Schur's lemma,
and [TopologicalKTheory T6.2](../TopologicalKTheory/README.md#t6-equivariant-k-theory-and-associated-bundle-products)'s
independent algebraic representation-ring construction for the SplitK0 ring of genuine continuous finite-dimensional
representations and its external tensor product. These precede equivariant
Bott and index theory.

Use the Fourier principal symbol σ_F throughout P2–P8, including powers,
positivity, adjoints and the external-product matrix. Use left Kohn–Nirenberg
quantization. In angular frequency ξ, put
`D_j=−i∂_j` and

`Op(a)u(x)=(2π)^(-n) ∫∫ exp(i(x−y)·ξ) a(x,ξ)u(y) dy dξ`.

These are oscillatory integrals, not iterated Bochner integrals without a
convergence proof. On Schwartz input the equivalent single Fourier integral is
absolutely convergent under the symbol estimates. Mathlib uses the negative
`2π` Fourier phase. Implement the formula as

`Op(a)u(x)=∫ exp(2πi x·ζ) a(x,2πζ) (𝓕u)(ζ) dζ`.

Prove the change-of-frequency equality and retain it in composition, adjoint and
symbol examples. Thus the differential principal symbol of ∂_j is iξ_j.
Also expose the real geometric convention without i, used in the Riemannian
notes: an order-m differential symbol gains i^m when converted to the Fourier
convention. Adjoints have geometric symbol `(−1)^m σ_geom(P)*` and Fourier
symbol `σ_F(P)*`. A matrix commutator can retain the sum of the orders;
order reduction by one requires vanishing of its leading symbol commutator.

## P1. Differential operators, jets and symbols

### P1.0. Differential-operator core

For the scalar foundations put A=C∞(M,ℝ), and use the kernel of evaluation
as the ideal I_x={f:f(x)=0}. Prove the global algebraic ideal identity
`I_x²={f:f(x)=0 and df_x=0}`, where the square consists of finite sums of
products, on every manifold in scope, including noncompact M. Use the smooth
Hadamard factorization in a chart and nested compactly supported cutoffs.
First cut off the chart expression in the chart target, so it extends smoothly
to the whole model space before applying `hadamardFactor`. Its coefficients
at x are the coordinate derivatives of f, hence zero when df_x=0. Localized
coordinate functions and coefficients therefore give a finite sum of products
in I_x; the residual `(1−χ)f` is another such product. This handles dimension
zero. Expose the existing Tau Ceti chart/bump and finite-basis Hadamard helpers
as reusable public APIs: `exists_contMDiffMap_eventuallyEq_extChartAt`,
`exists_contMDiffMap_comp_eventuallyEq`, `exists_contMDiffMap_hadamard_coords`
and `sub_algebraMap_eq_sum_mul_sub_algebraMap` from its DerivationBundle file,
with their smoothness, germ and evaluation equations. Consume them in these
constructions and the smooth-field argument below.

Use Mathlib's `Ideal.Cotangent` for I_x/I_x², its `Ideal.toCotangent` and
`Ideal.mem_toCotangent_ker`/`toCotangent_eq_zero` for the algebraic quotient.
Use `TangentSpace I x →L[ℝ] ℝ` for T_x*M. Construct the ℝ-linear equivalence
`I_x.Cotangent≃ₗ[ℝ]T_x*M` sending the class of f∈I_x to `mvfderiv I f x`.
Prove compatibility with tangent-vector evaluation, restriction to open sets,
pullback differentials and the coordinate-differential bases. Construct the
complex-valued version using the scalar-function algebra described below.

#### Smooth section modules

For every smooth finite-rank real vector bundle, construct the `C∞(M,ℝ)`-module
on the existing `ContMDiffSection` carrier. Use `ContMDiff.smul_section` for
closure, prove the module laws pointwise, and supply the evaluation formula
`(f • s)(x)=f(x) • s(x)`, restriction to open sets and constant-function
comparisons with the native real scalar action. Export `IsScalarTower ℝ
C∞(M,ℝ) Γ∞(V)` and `SMulCommClass ℝ C∞(M,ℝ) Γ∞(V)` from this comparison.
[SmoothBundlesConnections B2](../SmoothBundlesConnections/README.md) supplies
the bundles and their associated-section dictionary. This module construction
uses only those bundle/section foundations and smooth scalar multiplication;
it precedes the rest of P1.0 independently of ideal quotients, derivation
correspondences, jets, densities, connections and analytic Sobolev theory.
LieGroupoidsPoisson G1.1 consumes these module and scalar-compatibility
instances and owns the additional algebroid-specific Lie structures.

#### First jets of a vector bundle

For every smooth finite-rank real vector bundle V, construct its first-jet bundle
`J¹V` from the value and first derivative of local sections, with transition
maps given by the first-order chain/product rules. Prove smooth gluing,
projection to V, open restriction, pullback by base diffeomorphisms and
naturality under bundle isomorphisms. Construct the exact sequence
`0 → T*M ⊗ V → J¹V → V → 0`, and the jet extension of a smooth section,
with its value and derivative equations. This connection-free first-jet
construction uses the preceding section module and SBC B2's dual/tensor bundle
operations, independently of densities, connections, formal adjoints and analytic
scales. After SBC B3 supplies a bundle connection, prove its splitting of this
sequence and the difference-of-connections change-of-splitting formula.
ContactGeometry CG5 consumes its real-line-bundle specialization; it owns the
contact distribution and neighborhood theorem on that carrier. The all-order
jets and differential-operator factorization below extend this same first-jet
construction and agree with it at order1.

#### Global derivations and higher jets

Use Mathlib's `Derivation` and `PointDerivation`, with the latter's scalar
action given by evaluation at x. Consume Tau Ceti's
`Geometry/Manifold/DerivationBundle` and its
`pointDerivationEquivTangentSpace`, `PointDerivation.congr_of_eventuallyEq`
and `tangentToPointDerivation_mfderiv`; their finite-dimensional real,
Hausdorff and interior-point hypotheses hold here. Its
`Analysis/Calculus/Hadamard` supplies smooth Hadamard factors. Construct the
`C∞(M,ℝ)`-linear equivalence between algebraic derivations A→A and smooth
sections of the actual tangent bundle, using Mathlib's `ContMDiffSection`,
without assuming a derivation is continuous, using the preceding section module.
Evaluate the derivation at each point and use the native point
equivalence; prove smoothness from its values on bump-localized coordinate
functions. Prove inverse evaluation `δ(f)(x)=df_x(X_x)`, locality and
restriction to open sets. Prove `field(fδ)=f·field(δ)` pointwise before
bundling it as a C∞-linear equivalence. Intertwine the derivation commutator
with `VectorField.mlieBracket I X Y`; consume its smoothness theorem
`ContDiff.mlieBracket_vectorField` and scalar rule `mlieBracket_smul_right`.

On the same real base use the actual carrier
`C^∞⟮I,M;𝓘(ℝ,ℂ),ℂ⟯` for A_ℂ. Construct and export the instance
`ContMDiffRing 𝓘(ℝ,ℂ) ∞ ℂ`, proving real smoothness of addition,
negation and complex multiplication; consumers use it without opening a
roadmap namespace scope. Its induced function-ring operations are pointwise.
Construct the ℂ-algebra structure by constant complex functions and prove
its scalar action agrees with multiplication by those constants and with
the native ℝ-algebra structure. Construct Re, Im, conjugation and inclusion
of real functions as smooth maps, with their ring/linear identities.
SmoothBundlesConnections B2 supplies the complexified real tangent bundle
with fiber `ℂ⊗[ℝ]T_xM` and its real/imaginary-part comparison. For a smooth
complex bundle over this real base, construct its smooth real bundle
endomorphism J given by multiplication by i, using complex-linear
transition maps. Define `(u+iv)·s=u·s+v·(Js)` for real smooth u,v.
In these charts J is the constant fiber map multiplication by i, so
`x↦J_x(s(x))` is smooth. Real scalar multiplication and addition then give smoothness; prove the
A_ℂ-module laws pointwise and compatibility with restriction and constant
complex scalars. Apply this to the complexified tangent bundle. Prove
`ℂ⊗[ℝ]Γ∞(TM)≃Γ∞(ℂ⊗[ℝ]TM)` via pairs of real fields. A complex-linear
derivation corresponds to X+iY by
`δ(u+iv)=Xu−Yv+i(Yu+Xv)`: restrict to real functions, take Re/Im to obtain
two real derivations, and prove the inverse formula and uniqueness. Compare
the scalar-function module actions, restrictions and complexified brackets.

For an ℝ-linear endomorphism D of A, or an ℂ-linear endomorphism of A_ℂ,
prove that vanishing of every double commutator `[[D,M_f],M_g]` for f,g in
that full scalar-function algebra gives the unique splitting
`D(f)=X(f)+fD(1)`. Compare this with the local-coordinate definition through
the commutator equivalence below. Its symbols are
`σ_geom(D)(ξ)=ξ(X_x)` and `σ_F(D)(ξ)=iξ(X_x)`, extending ξ complex-linearly
in the complex case. Real-linear operators on complex-valued functions are
operators on the real rank-two trivial bundle, with matrix-valued order-zero
parts; the complex scalar splitting requires complex linearity.

Using the preceding smooth section modules, restrictions and multiplication,
construct linear differential operators between bundles with an order filtration,
defined by local finite-coordinate derivative expressions of bounded order.
Prove the equivalent factorization
through the order-m jet bundle, and vanishing of m+1 iterated commutators with
scalar multiplication. Build the jet bundle from finite Taylor coefficients,
coordinate-chain-rule transition maps and truncation exact sequences; prove
those equivalences by a local Hadamard lemma and induction on order. Do not
assume a bare locality condition implies a uniform order bound. P1.0 owns these linear vector-bundle jets, extending its first-jet subtarget.
The differential-operator and jet construction uses smooth sections and bundle
operations. The following adjoint part additionally uses metrics and densities
from DifferentialGeometry/SmoothBundlesConnections and K5a's initial density
bundle, independently of K5a's distribution or Sobolev topologies.
Construct the bilinear density transpose and the metric/density
formal adjoint by their local derivative formulas, prove integration by parts
on compact supports, and prove both operations commute with restriction to
open sets. K5a extends these fixed operators to its distributions and L² domains.

Identify the top jet quotient with symmetric cotangent tensors. Construct the
homogeneous principal symbol on the actual cotangent bundle, its restriction,
pullback under diffeomorphisms, frame changes, additivity, scalar multiplication,
composition and adjoint formulas. Compare the jet/iterated-commutator and local
polynomial definitions. With `[P,f]=P∘M_f−M_f∘P`, pin
`σ_geom(P)(df)=(1/m!)[…[P,f],…,f]` (m copies), and polarize for distinct
covectors. Prove the connection expansion with Sym^j∇^j, using the chosen
bundle connection and the base Levi–Civita connection from HopfRinow Layer1 and its actual
`CovariantDerivative.leviCivitaConnection`, with induced dual/tensor
connections from SmoothBundlesConnections B3, and
smooth coefficient bundle maps for j≤m, and independence of the top coefficient
from the connection. Define the Laplace-type predicate on this carrier by
order at most 2 and Fourier principal symbol `c|ξ|²_g Id` for a fixed c>0.
Prove restriction, frame invariance, positive rescaling and the c=1 comparison;
CKG K5a consumes this predicate for its analytic regularity.
Supply order-zero bundle homomorphisms, covariant derivatives, exterior
derivative and rough Laplacians. Define ∇*∇ by negative
metric trace of its second covariant derivative, prove its formally
self-adjoint/nonnegative energy identity for a metric connection, and give
`σ_F(∇*∇)=|ξ|²_g Id`, equivalently `σ_geom=−|ξ|²_g Id`.
Using the induced metric on T*M⊗E and the canonical density, prove this
negative-trace operator is the composition of ∇ with its P1.0 metric/density
formal adjoint. Prove the identity on compactly supported smooth sections
by integration by parts and compare the local expressions.
RiemannianGeometry R7 consumes this generic operator and supplies geometric
curvature identities.

For D of Dirac type use the polarized anticommutator
`σ_geom(D)(α)*σ_geom(D)(β)+σ_geom(D)(β)*σ_geom(D)(α)=2g*(α,β)Id`.
Prove D*D is Laplace type, with D* the formal adjoint for the canonical
Riemannian density of g and the chosen fiber metrics. Relative to an arbitrary
chosen metric connection the remainder has order≤1; construct the unique Bochner
connection absorbing the first-order term before asserting a zeroth-order
remainder. Prove that this connection is metric, and the zeroth-order remainder
fiberwise self-adjoint, when the Laplace-type operator is formally self-adjoint
for the canonical Riemannian density and those fiber metrics. Acceptance includes
the failure for another density: on the standard circle with the trivial real
line, D=∂ₓ is of Dirac type, its formal adjoint for the density `e^(sin x) dx` is
`−∂ₓ−cos x`, the product `−∂ₓ²−cos(x)∂ₓ` is formally self-adjoint for that
density, and its Bochner connection `d+½cos(x)dx` is not metric for the standard
fiber metric.
RiemannianGeometry R7.2–3 consume these generic symbol/Bochner constructions;
SmoothBundlesConnections B3 supplies the chosen connection data.

### P1.1. Locality and Peetre's theorem

Consume K5a's pointwise real Hodge star and its codifferential; construct curl in
oriented dimension 3 and the de Rham operator examples, comparing their symbols
with P1.0. Consume K5a's real codifferential sign and star/Laplacian
commutation identities. Consume K5a's Fréchet topology on all smooth bundle sections. Prove Peetre's
local finite-order statement for continuous linear local maps in that topology,
with order bounded on compact subsets, and distinguish it from globally
bounded order. This theorem consumes P1.0's operator core and K5a's topology;
K5a's Laplace-type regularity does not consume this theorem.

## P2. Symbols and asymptotic expansions

For every real m define smooth Hom(V,W)-valued `S^m_(1,0)` symbols on U×ℝⁿ by
`‖∂_x^α∂_ξ^β a(x,ξ)‖≤C_(K,α,β)〈ξ〉^(m−|β|)` on each compact K⊂U.
Use 〈ξ〉=(1+|ξ|²)^(1/2). Give seminorms, locally convex topology,
restriction, addition, order inclusions, matrix composition, differentiation,
smooth compact cutoffs and continuous parameter families. The uniform class
uses the same bounds on all x. Define smoothing symbols as the intersection of
all orders and prove its ideal laws.

Define classical symbols by homogeneous terms a_(m−j) on ξ≠0, a fixed cutoff
near zero and remainders of order m−N after N terms. Prove uniqueness of these
terms, independence of the cutoff, restriction and product rules. Prove Borel
asymptotic summation using cutoffs at successively larger frequency radii with
explicit seminorm estimates, for prescribed orders tending to −∞;
include uniform summation for parameter families
continuous in each relevant seminorm on compact parameter sets. Construct the
principal homogeneous symbol and its quotient by order m−1. Use actual
subspaces and quotient maps, rather than a predicate with an unspecified
“asymptotic expansion”.

For these one-step classical expansions, addition and order inclusions respect
the exponent class modulo ℤ: order m−j embeds in order m for integer j≥0.
Two classical orders with noninteger difference need not have a one-step
classical sum. The full S_(1,0) classes carry the real-order filtration;
classical operators carry its integer-step refinements for each exponent class,
and composition adds those classes. Keep this distinction in every algebra and
principal-symbol exact-sequence statement.

## P3. Oscillatory kernels and local quantization

Define oscillatory integrals by smooth compact cutoff regularization and
integration by parts, with polynomial-growth amplitude estimates. Prove the
limits, independence of cutoff, differentiation and distributional pairing
rules. First implement absolute single-Fourier-integral quantization on
Schwartz input, prove integrability and continuity in its seminorms, and
identify its distribution kernel. Consume K5a's finite-order estimates and extension of compactly
supported distributions to tempered distributions. Consume K5a's identification of compactly supported distributions with the
continuous dual of all smooth sections with its Fréchet seminorm topology,
rather than construct a second LF/Fréchet comparison. Prove
the Schwartz kernel theorem: continuous linear maps
`C_c^∞(N;E)→D′(M;F)` correspond uniquely to distributional kernels on M×N
with coefficient bundle `F⊠(E*⊗Density_N)`. Use the LF source topology and
native compact-convergence distribution topology, with bilinear evaluation
of E and E*. K5a owns the smooth density line bundle and local frame dictionary.
On fixed compact
coordinate boxes, build smooth periodic Fourier expansions and their rapid
coefficient decay in every derivative seminorm. Continuity gives polynomial
bounds for the images of cutoff Fourier modes; the convergent double Fourier
pairing constructs the kernel. Prove tensor-test density, uniqueness and
compatibility on overlapping boxes, then patch by partitions of unity. This
supplies the test-function tensor comparison needed by that theorem. Supply its
bundle/density, transpose, restriction and proper-support comparisons.

Prove kernels are smooth off the diagonal by repeated integration by parts.
Reduce amplitudes a(x,y,ξ) to left symbols, with Taylor expansion in y and
remainder estimates in every seminorm. Localize kernels near the diagonal to
obtain properly supported operators; the removed kernel is smoothing locally.
On a noncompact manifold a smooth kernel is not automatically properly
supported or a globally compact operator. Prove properly supported operators
map compactly supported smooth sections to compactly supported smooth sections,
and extend to distributions by transposition. For general local operators
compose on compactly supported smooth inputs when at least one factor is
properly supported, using its compact-support-preserving or C∞ extension
as appropriate. Otherwise compose chart compressions with specified compact
cutoffs. Extend by transpose only with those same test-support conditions.

## P4. Composition, adjoints and global bundles

Prove the composition expansion

`a#b ∼ Σ_α (1/i)^|α|/α! (∂_ξ^α a)(∂_x^α b)`

and the analogous adjoint expansion with matrix Hermitian adjoint and density/
metric factors in arbitrary frames. Every truncation includes its claimed
remainder order and continuity estimates. Derive leading symbols,
commutator formulas, smoothing ideal laws and associativity from actual
operators. If the leading symbols commute, the next commutator term is
`(1/i)Σ_j(∂_ξj a_m ∂_xj b_l−∂_ξj b_l ∂_xj a_m)` plus
`[a_m,b_(l−1)]+[a_(m−1),b_l]`. Give the Poisson-bracket formula when one
full symbol is scalar times Id; commuting principal matrices alone do not
remove the subprincipal commutators.

Prove coordinate and frame transformation formulas by the amplitude calculus;
the principal symbol transforms intrinsically as a Hom-bundle-valued function
on T*M\0. Patch properly supported operators on bundles and show independence
of atlas, partition and local quantization modulo smoothing operators, for a
family of compatible full local symbols: on each chart overlap the two full
symbols are related by the complete coordinate and frame transformation
expansions above, modulo order −∞. Sharing only the principal symbol is not
enough: on an interval, write the principal symbol ξ² in the coordinate y=eˣ
as `(dy/dx)²η²`; quantizing that in y and pulling back gives `−∂ₓ²+∂ₓ`,
whereas quantizing ξ² in x gives `−∂ₓ²`, a difference of order 1. Build the filtered algebra/category of operators, its full symbol
quotient, principal symbol exact sequence and quantization of every smooth
homogeneous principal symbol; two quantizations of the same principal symbol
differ by an operator of order m−1. In the classical class the order-m kernel
of the principal-symbol map is order m−1. Construct a quantization continuous on compact parameter families
and prove homotopies of principal symbols admit continuous operator lifts.
Keep the residual smoothing term in equalities, including cross-chart terms.
Define membership in the global properly supported classical class by a
properly supported distribution kernel smooth off the diagonal, such that
every chart compression φPψ with compactly supported smooth chart cutoffs
is Op(a) plus a smooth-kernel operator for a local classical order-m symbol.
Prove equivalence with the patching construction and independence of charts.
Identify every P1.0 differential operator of order at most m with the classical
properly supported pseudodifferential operator given in charts by quantizing
its polynomial symbol. Prove exact equality on smooth inputs and distributions,
including the density/frame comparisons, and agreement of its principal symbol
with P1.0's angular-frequency convention `σ(∂_j)=iξ_j`. Its kernel is supported
on the diagonal; on noncompact bases polynomial coefficients need only satisfy
the local symbol estimates, not uniform all-x estimates.

Build the full all-x uniform calculus as well: composition, adjoint and
frequency-multiplier composition preserve uniform symbol estimates. Prove
compactly x-supported quantization composed on either side with the native
Bessel multipliers remains in this controlled calculus, without pretending
those multipliers are properly supported. Recover symbols by testing on
exponentials, interpreted by the oscillatory/distribution construction:
`a(x,ξ)=exp(−ix·ξ)Op(a)(exp(i·ξ))(x)` for full Euclidean quantization.
For a closed compact K⊂ℝⁿ define output support in K by
`supp(Op(a)f)⊆K` for every compactly supported smooth f. Prove this is
equivalent to x-support of the full symbol a being contained in K, using
the distribution kernel and Fourier injectivity in its second variable.
Distinguish this from compact support only in the input variable or merely
proper support of the kernel. These are exact full-quantization statements.
For proper-support truncation state recovery modulo smoothing, not an exact
formula. Construct square partitions Σχ_j²=1 and their symmetric bundle
quantization, and compare with the ordinary partition construction.

## P5. Sobolev, Lp and Hölder mapping estimates

Consume K5a's shared p=2 scale, Peetre inequalities and weighted Schur
bounds. For compactly x-supported local symbols, use the rapid decay of
their x-Fourier transforms to prove `Op(a):H^s→H^(s−m)` for every real s. For symbols with
uniform x-bounds on all ℝⁿ, prove order-zero L² boundedness by a finite-seminorm
Calderón–Vaillancourt/Cotlar almost-orthogonality argument; supply the
almost-orthogonality lemma and dyadic localization estimates here. A compact
x-support estimate alone is not that uniform theorem. Patch the local bounds
to compact bundles, including parameter continuity in operator norm. For
uniform symbols prove all-real-order H^s mapping by composing with the native
Bessel multipliers through P4. Consume K5a's global bounded-derivative
matrix multiplication theorem for the p=2 instance; prove the H^(s,p)
comparison below for general p. For P1.0 differential operators consume
K5a's independently proved all-real p=2 differential mapping theorem and
prove its extension equals P4's polynomial-symbol quantization extension.

Consume K5a's all-real-order coordinate-change estimates, including the
bounded-domain test-function completion isomorphism and the uniform-derivative
global diffeomorphism theorem. Use its localized versions for the chart
patching above.

First construct the weak-covariant-derivative bundle W^(k,p) carrier for
integer k≥0 and 1≤p≤∞ on a compact smooth base, using PDE Lane A's
scalar weak derivatives in finite bundle charts. Prove completeness and
equivalence of the finite-chart/connection norms. For finite p prove
smooth density; at p=∞ use the weak-derivative carrier itself, without
asserting smooth norm density. As an interval acceptance example for PDE's
weak-derivative comparison, take `D:H¹(0,1)→L²(0,1)`, Df=f′, with no
boundary condition. Prove boundedness for the graph norm
`‖f‖₂+‖f′‖₂`, density in H¹ of restrictions to [0,1] of functions smooth
on a neighbourhood of that interval, and density of its
inclusion in L². On native `LinearPMap` represent D as a closed densely
defined L² operator, using the weak-derivative identity to prove graph
closedness. Normalized exponentials e^(λx) show it is unbounded in the L²
norm. Distinguish this domain from the C_c∞ completion H₀¹(0,1);
no self-adjoint boundary-condition classification is part of this example.
Transport PDE's compact-support
Gagliardo–Nirenberg–Sobolev estimate componentwise and through partitions
to obtain W^(1,1)→L^(n/(n−1)) for n≥2, consuming native
`eLpNorm_le_eLpNorm_fderiv_of_eq` and adding the lower-order L¹ term
on a closed base. For integers k>l≥0 set r=k−l. If1≤r<n, prove
continuous W^(k,1)→W^(l,q) for1≤q≤n/(n−r), and compactness for
q<n/(n−r). If r=n, prove continuous W^(n,1)→C⁰ and
W^(k,1)→C^l (hence W^(l,∞)), and compactness into W^(l,q) for
every finite q; the critical C^l/∞ map is not compact in general.
For r>n prove compactness into C^l and W^(l,∞). At n=1 the critical
W^(1,1)→C⁰ theorem is the absolutely-continuous representative/FTC
comparison; its unit ball need not be equicontinuous, so no C⁰
compactness is asserted there. Include the concentrating smooth-bump
counterexample at r=n. These statements are for positive-dimensional
compact bases, with finite bundle charts and their actual covariant norms;
for 1≤p≤∞ and integers k>l≥0 prove compact W^(k,p)→W^(l,p)
on compact bases. The single Ehrling target below consumes these
compact embeddings.
These weak-derivative endpoint results are independent of the
order-zero pseudodifferential and Calderón–Zygmund bounds below.

First establish the Euclidean general-p interpolation and operator estimates
below on the native Bessel carriers. Use them to prove bounded frame and
coordinate transitions before constructing bundle H^(s,p), 1<p<∞, by finite
chart localization and distribution comparison. Prove completeness,
choice-independent equivalent norms, smooth density and duality. Pin bilinear
density duality `H^(−s,p′)(E*)≃(H^(s,p)(E))*`, 1/p+1/p′=1, and its
conjugate-linear Hermitian Riesz comparison as in K5a, using the fixed smooth
positive density and bundle metrics. After this construction,
transport the Euclidean interpolation theorems to bundles by the bounded
localization/reconstruction retractions.
Build the complex interpolation space for 0<θ<1 and compatible Banach couples embedded
in a common Hausdorff distribution space: construct the intersection and
sum norms and the Banach space of bounded continuous functions on the closed
strip into X₀+X₁, holomorphic inside, whose boundary maps t↦F(j+it) are
continuous into X_j and tend to zero as |t|→∞. Its norm is
`max_(j=0,1) sup_t ‖F(j+it)‖_(X_j)`. Build the evaluation-at-θ quotient
with its infimum norm. Consume `verticalClosedStrip`, `DiffContOnCl` and
`Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`.
Prove completeness, exact operator
interpolation, endpoint embeddings, retraction compatibility and equivalent-
norm naturality. Prove Stein's analytic-family interpolation and imaginary
Bessel-power bounds using PDE Lane B's multiplier estimates. First prove the
finite-dimensional-fiber Lebesgue space identity `[L^p₀,L^p₁]_θ=L^p_θ`:
construct analytic families for simple functions by complex powers of their
norm and fixed unit directions, then use density, duality and three lines for
the two continuous inclusions. Deduce
`[H^(s₀,p₀),H^(s₁,p₁)]_θ=H^(s_θ,p_θ)`, where
`s_θ=(1−θ)s₀+θs₁` and `1/p_θ=(1−θ)/p₀+θ/p₁`, with 1<p₀,p₁<∞.
Also build the real K-method space for
0<θ<1 and 1≤q≤∞ with
`K(t,u)=inf_(u=u₀+u₁)(‖u₀‖+t‖u₁‖)` and norm
`‖t^(−θ)K(t,u)‖_(L^q(dt/t))`, including q=∞, its Banach/functorial API
and the dyadic Besov comparison. For a fixed p and s₀≠s₁ pin
`(H^(s₀,p),H^(s₁,p))_(θ,q)=B^(s_θ)_(p,q)`; define the Besov carrier by
the dyadic Lp coefficient sequence norm. Choose a smooth inhomogeneous Fourier
partition supported in a low-frequency ball and dyadic annuli, summing to1;
prove finite overlap, uniform rescaled derivative bounds, bounded dyadic
analysis/reconstruction and equivalence for any two such partitions. Prove
`B^s_(p,1)⊂H^(s,p)⊂B^s_(p,∞)` using the multiplier bounds. Own the
weighted-sequence K-method interpolation formula for distinct weights s₀,s₁,
with ℓ^q coefficient norms and q=∞ included. Use dyadic decomposition and
these estimates to prove the stated Besov identification and its reverse
inclusion, rather than only an operator interpolation inequality.
Prove the bundle versions through
the bounded localization/reconstruction retractions. At nonnegative integer k
identify H^(k,p) with the bundle W^(k,p) weak-covariant-
derivative carrier, identified with the smooth completion when p<∞.
Apply PDE's scalar Calderón–Zygmund theory componentwise
to order-zero matrix kernels and prove the needed kernel size/smoothness and
L² hypotheses from P3–P4. Deduce all-real order shifts in H^(s,p), and prove
bounded and compact bundle Sobolev/Morrey embeddings with explicit exponents.
Before the bundle choice-independence proof, establish the following Euclidean
instances for every real s and 1<p<∞. Multiplication by a smooth matrix A with
every derivative, including order0, uniformly bounded is bounded
`H^(s,p)(ℝⁿ;F)→H^(s,p)(ℝⁿ;G)`. If φ and φ⁻¹ have uniformly bounded
derivatives of every positive order, pullback is a bounded isomorphism of
H^(s,p), inverse to pullback by φ⁻¹ and agreeing with distribution pullback.
Use P4's controlled calculus and PDE's Mihlin/CZ estimates for the coefficient
multipliers; alternatively obtain the coordinate estimates first at integer
orders by chain rule, then at negative orders by density transpose with its
bounded Jacobian multiplier, and at real orders by the interpolation theorem
above. Export cutoff versions inside chart domains and the resulting bounded
bundle-frame transitions; these estimates justify the finite-chart carrier
and equivalent norms stated above. At p=2 consume K5a's instances.
For 0<δ<n/p derive H^(s+δ,p)→H^(s,q), 1/q=1/p−δ/n, by the Bessel kernel/
Hardy–Littlewood–Sobolev estimate, built here from its Gaussian integral
representation and PDE's maximal-function bounds. On compact bases, for
1<p,q<∞, strict δ>n·max(1/p−1/q,0) gives the corresponding compact inclusion. Consume K5a's
H^s→C^k theorem for s>k+n/2. For integers k>l≥0 and 1<p<∞ put r=k−l:
if rp<n, prove continuous W^(k,p)→W^(l,q) for 1≤q≤np/(n−rp), compact
for strict q below that endpoint; if rp=n, prove the inclusion for every
finite q, compact for every such q, with no general W^(l,∞) bound.
For k−n/p=j+α>0 with j≥0 integral and 0<α<1, prove
W^(k,p)→C^(j,α); at a positive integer k−n/p=j prove instead
W^(k,p)→C^(j−1,β) for every 0<β<1. Prove compactness on strict
Hölder exponent margins. Include H^(2,2)→C^(0,1/2) in dimension3.
For k≥1 prove W^(k,∞)→C^(k−1,1) by the Lipschitz representatives;
the p=1 endpoints remain those specified above. Consume PDE A.4's scalar
Morrey theorem and A.7's scalar Hölder norm conventions.
Supply the compact-base bundle C^(k,α) norms by chart/connection comparisons.
Define C^r_* for every real r by the dyadic norm
`sup_j 2^(jr) ‖Δ_j u‖_∞`, using the inhomogeneous partition above.
Prove a properly supported classical order-m operator maps
`C^r_* → C^(r−m)_*` locally and on compact bases, for every real r,m,
with cutoff estimates and seminorm control. Identify C^(k+α)_* with
C^(k,α) for k≥0 and 0<α<1 using kernel cancellation estimates. No general strong
L¹ or L∞ order-zero bound or integer Hölder endpoint is asserted.
Before the bundle mapping theorem, construct the compact-base bundle C^r_*
carrier for every real r by finite chart/frame localization of distributions.
Prove the local dyadic estimates for multiplication by smooth matrices and
pullback by smooth chart diffeomorphisms, including negative r, using
P2–P4's localized kernels and distribution pullbacks. Prove completeness,
bounded localization/reconstruction and equivalence of the finite-atlas
norms under atlas, frame and partition changes. Transport the dyadic
operator estimates through these maps to obtain the bundle theorem above.
Also construct the little Hölder space h^(k,α), the closure of smooth
sections in this norm, as a closed Banach subspace. Characterize it by
vanishing small-scale α-Hölder modulus of the kth derivatives in the
finite chart/parallel-transport comparison, and prove independence of
those choices. This is the completion of smooth sections in the source
course's Hölder norm. Distinguish it from the full Hölder space: a local
cutoff times |x|^α lies in C^(0,α) but fails the vanishing-modulus test.
Prove smooth density on h^(k,α), the resulting completion maps from
Sobolev spaces, and restriction of the bounded operator mappings above
to these closed subspaces, using their action on smooth sections.
Prove bundle product estimates for W^(k,p)∩L∞ and multilinear coefficient
maps. In particular prove the algebra property of W^(k,p) for integer
k>n/p, 1≤p≤∞, and of H^(s,p) for s>n/p, 1<p<∞, with continuous
multiplication in those norms. Prove Ehrling:
for integers k>l≥0, 1≤p≤∞ and ε>0, the compact-base bound
`‖u‖_(W^(l,p))≤ε‖u‖_(W^(k,p))+C_ε‖u‖_(Lp)` from interpolation/Rellich.
Include the Euclidean common-compact-support versions, consuming K5a's
p=2 Rellich and compact C^k embeddings; translations disprove
unqualified whole-space Rellich. Work out the shear (x,y)↦(x,y+x³): prove
pullback is an L² isometry but unbounded H¹→H¹, using translates of a
fixed smooth compactly supported function whose y derivative is nonzero.
This is the specified Sobolev-order counterexample to a determinant-only bound.

Prove smoothing operators send distributions to smooth sections locally and
act compactly between fixed finite Sobolev orders on compact bases. Negative-
order operators are compact H^s→H^s there by the strict-order Rellich inclusion.
Prove the distribution-extension and smooth-input constructions agree; do not
infer weak regularity from an estimate proved only for smooth inputs.

For smooth compact-Lie actions on M and smooth fiberwise-linear actions on
E,F over it, choose invariant metrics/density and prove symbol/operator averaging preserves order,
classical homogeneous terms, continuity and invariant principal symbols.
Differentiate the coefficient integral under Haar integration and prove
uniform seminorm bounds on compact group parameter sets; compare it with the
Bochner integral in the Sobolev operator spaces constructed above.

## P6. Ellipticity, parametrices and Fredholm theory

Define ellipticity by invertibility of the homogeneous principal symbol away
from zero. Prove matrix inverse-symbol derivative estimates, uniformly on
compact bases or under the uniform Euclidean bound
`‖a(x,ξ)⁻¹‖≤C〈ξ〉^(−m)` for |ξ|≥R with C,R independent of x.
For positive-dimensional bases prove ellipticity forces equal fiber ranks.
Construct left and right inverse-symbol recursions, asymptotically sum them and
compare them modulo smoothing to obtain one two-sided global parametrix of
order −m. For a subordinate partition φ_j and cutoffs ψ_j equal to1
near supp φ_j, use `Q=Σ_j ψ_j Q_j φ_j`. Keep the smoothing terms
`[P,ψ_j]Q_jφ_j` and all other chart/restriction remainders; smoothness of
these commutator terms uses their separated supports. Preserve proper support. Ellipticity at
infinity in ξ on each compact x-set suffices for local parametrices, but not
for an unqualified global uniform estimate.

Deduce local distributional elliptic regularity, including
`Pu∈H^s_loc ⇒ u∈H^(s+m)_loc`, using local finite negative Sobolev order and the
parametrix identity on distributions. On a compact base prove, for every real
s and r<s+m, an estimate with fixed-data C

`‖u‖_(H^(s+m))≤C(‖Pu‖_(H^s)+‖u‖_(H^r))`.

Prove the corresponding interior cutoff estimates and the 1<p<∞ H^(s,p)
versions; give the localized Schauder version:
for a smooth-coefficient elliptic differential operator or a properly
supported classical elliptic ΨDO, in both cases of integer order m
with k+m≥0,
a distribution u∈D′(U;E) on an open U with Pu locally C^(k,α),
k≥0 and 0<α<1, is locally C^(k+m,α). Give interior cutoff estimates
with lower-order term ‖u‖_(H^r) for any real r for which the local
norm is finite, their bundle chart/gluing comparisons and qualitative
regularity for Sobolev solutions; retain the same lower-order term
on a compact base. For K5a's self-adjoint Laplace-type Green
operator on the kernel-orthogonal complement, its L² spectral-gap
estimate controls the lower-order term; use the kernel-orthogonal
estimates below for a general elliptic P.
Prove every distributional solution of Pu=0 or P*u=0 smooth. Apply native
Fredholm/compact-parametrix APIs to `P:H^(s+m)(E)→H^s(F)`; give finite-dimensional
kernel, closed range, cokernel-dual identification by the formal adjoint and
solvability iff the finite adjoint-kernel compatibility conditions vanish.
Prove kernel, cokernel and integer index independence of s and metric, and local constancy in elliptic parameter families with common
orders. On the kernel-orthogonal complement prove the lower-order term can be
removed, including W^(k,p) estimates with L² orthogonality to the smooth
kernel for 1<p<∞; the finite-dimensional kernel projection extends to those
spaces. No coercive estimate without that condition is claimed.

Compare the Laplace-type estimates and Green operators with K5a by uniqueness,
so de Rham/Dolbeault Hodge theory uses the same analytic objects. Degreewise
d has noninvertible symbol in dimension at least two; in dimension one
d:Ω⁰→Ω¹ is elliptic. P7 supplies the common-order elliptic-complex Hodge development.
Acceptance includes curl and Laplace symbols, distributional weak-test solutions and the failure of coercivity on nonzero
kernels. Prove the nonlinear course example: on a compact 4-manifold, if D
is first-order elliptic and Df=Q(f,f) for a smooth fiberwise bilinear Q with
f∈W^(1,3), then f is smooth. Use W^(1,3)→L¹², Q(f,f)∈L⁶,
elliptic W^(1,6) regularity, its bounded/Hölder embedding, and the P5 product
estimates to bootstrap every order.

## P7. Elliptic powers and changes of order

For a Hermitian bundle choose a metric connection and P1's
`L=1+∇*∇`. Consume K5a's generic nonnegative Laplace-system
self-adjoint H² realization, positive compact inverse and complete smooth
eigenbasis for this strictly positive L. Own its powers and their domains.
Use the bounded positive compact inverse's spectral theorem: define negative
powers by its eigen-expansion
and positive powers as inverse maps on the Sobolev scale. Specify domains
and the identity power separately. Extend this spectral realization/power
construction to formally self-adjoint positive classical elliptic ΨDOs of even
positive integer order with a strict positive lower bound, including
differential operators through P4; this is the supplier for
the external-product normalization and elliptic-complex Hodge subitems below.
For such an A of order d, prove symmetry on H^d and use P6's maximal
distributional adjoint-domain regularity to identify dom(A*)=H^d.
Thus A is self-adjoint; its strict lower bound, closed range and adjoint
kernel imply invertibility, and Rellich makes its positive inverse compact.
Apply the native compact spectral theorem just cited and P6 regularity to
obtain a complete smooth eigenbasis. Derive positivity of its principal
Fourier symbol from localized high-frequency tests and ellipticity.
Use Mathlib's `LinearMap.IsSymmetric.conj_eigenvalue_eq_self` for realness
of symmetric eigenvalues. Prove that for a compact symmetric operator
and δ>0, only finitely many members of an orthonormal eigenbasis have
eigenvalue of absolute value≥δ: otherwise their images are uniformly
separated in the image of the unit ball. Derive finite spectral cutoffs,
finiteness of eigenvalues below a fixed bound for the positive elliptic
operator, and the first positive eigenvalue on a nonzero kernel complement.
For product connection Laplacians use λ_i,μ_j≥1 to prove finiteness of
the pairs with λ_i+μ_j−1≤R².

Prove L^(s/2) is classical of order s, principal symbol |ξ|_g^s Id.
For the differential connection Laplacian L, build the strongly
parameter-dependent resolvent symbol class for λ in a closed sector
avoiding the positive real spectrum. Its terms are jointly homogeneous under
(ξ,λ)↦(tξ,t²λ) and its derivative bounds use (1+|ξ|+|λ|^(1/2)) with a loss
of one for ξ derivatives and two for λ derivatives. Prove uniform inverse,
composition and remainder estimates there.

For an A in the formally self-adjoint, strictly positive classical elliptic
class above, of even order d, construct
the weakly parameter-dependent calculus of
[Grubb–Hansen, Definition2.1 and §4](https://web.math.ku.dk/~grubb/manus/powers02.pdf),
with anisotropy d and parameter λ, holomorphic on the open resolvent
sector. Define its symbol seminorms by the
uniform ordinary-symbol estimates for successive derivatives in r=1/λ
of r^δ a(x,ξ,1/r), allowing the frequency order to increase by d for
each r derivative, as in that definition. Build the weakly homogeneous
expansions, composition, parameter-elliptic inverse and remainder estimates;
retain the separate frequency and parameter orders, including smoothing
terms with polynomial parameter decay. Prove coordinate and bundle
invariance and the estimates needed to integrate the resolvent on the
spectral contour. Construct the contour/Mellin powers, initially in a
convergent negative-power strip and then by integer composition, handle
the strict positive lower bound at low frequency, and identify them with
the spectral powers. For every real z prove A^z classical of order dz,
with Fourier principal symbol (σ_F,d(A))^z defined by the positive matrix power.
Prove its Sobolev domains and inverse-power identities, and agreement with
the preceding strongly parametric construction for differential L.
For invariant operators prove that spectral and contour powers preserve their
domains and commute with the unitary group action: the resolvents and spectral
eigenspaces are invariant. Apply this to both order normalizations below.

Prove L^(s/2):H^t→H^(t−s) is an isomorphism, inverse L^(−s/2), for all real s,t.
The native Euclidean Bessel norm has weight 〈ξ/(2π)〉^t; the spectral norm
and chart/connection norms define the same spaces with equivalent norms,
not literal equality of the chosen norms. Consume K5a's comparison
(1+|ξ|)^(2t)≍(1+|ξ|²)^t for every real t. Prove coefficient/metric parameter
continuity in the operator topologies for fixed compact parameter sets.
Use these isomorphisms to change elliptic order without changing Fredholm
index, including the square-root/order-one case.

For smooth compact-Lie G and H actions on the two compact bases and their
Hermitian bundles, take equivariant elliptic P:E₀→E₁ and Q:F₀→F₁ and choose
invariant metrics, connections and densities. Include the trivial groups.
Use these same base metrics g_X,g_Y for all covector norms below and their
product metric for the product Sobolev spaces.
For any compact Lie K and strongly continuous unitary K-actions on complex
Hilbert spaces, own equivariant Fredholm-index local constancy and homotopy invariance:
for an equivariant Fredholm T prove its invariant finite-dimensional kernel
and cokernel carry genuine continuous representations. On an invariant
finite-dimensional subspace, strong continuity implies operator-norm
continuity by evaluation on a finite orthonormal basis; identify the quotient
cokernel equivariantly with the orthogonal complement of the closed range.
Define its virtual index `[ker T]−[coker T]` in T6.2's continuous-representation
SplitK0 ring here. Restrict T to each compact-group irreducible
multiplicity Hilbert space of intertwiners with its finite-source
Hilbert–Schmidt norm. Identify its range by the equivariant inverse of T on
the orthogonal complement of its kernel, and its kernel/cokernel with the
corresponding intertwiner spaces. Their dimensions are the multiplicities
by CompactGroups' Schur and complete-reducibility theorems. The induced
operator norm difference is at most the original operator norm difference.
Own the ordinary Fredholm path lemma here: compose
`ContinuousLinearMap.index_continuousOn_isFredholm` with a norm-continuous
Fredholm path on [0,1]; connectedness and the discrete integer codomain
make its index constant. Apply this lemma to each restricted path. For local
constancy choose one ordinary Fredholm norm ball about T₀; its equivariant
part is convex, so join T₀ to every T in it by the straight path. This uses
the same ball for every restricted path. Equal multiplicities and finite representation
support at the two endpoints give equality of virtual classes. Use
T6.2's external tensor map R(G)×R(H)→R(G×H), with bilinearity
and the corresponding tensor-of-irreducibles comparison.
Normalize both orders
to1 by right composition with the preceding positive elliptic powers;
prove this preserves their indices and give the invertible homogeneous-symbol
homotopies. Next replace P by
`P(1+P*P)^(−1/2)L_(E₀)^(1/2)`, and likewise Q, where L_(E₀) is the
source bundle's positive connection Laplacian1+∇*∇. The right factor
is an invertible order0 map on every H^s. Prove this second normalization
preserves the index and give its positive-symbol homotopy.
Writing P,Q for the resulting operators, their principal symbols satisfy
`σ_P*σ_P=|ξ|² Id`, `σ_Pσ_P*=|ξ|² Id`, and the analogous Q identities:
compute the new symbol as `σ_P(σ_P*σ_P)^(−1/2)|ξ|` before relabeling.
Construct the equivariant kernel/cokernel identifications with the original
operators through these invertible source maps. Grade each pair
by + on subscript0 and − on subscript1. The continuous homogeneous product
symbol, from even `E₀⊠F₀⊕E₁⊠F₁` to odd `E₁⊠F₀⊕E₀⊠F₁`, is
`A=[[σ_P⊗1,−1⊗σ_Q*],[1⊗σ_Q,σ_P*⊗1]]`.
Extend each degree1 symbol by0 at its own zero covector. These extensions
are continuous, but can fail to be smooth along the separate zero axes.
Fix a smooth χ:[0,1]→[0,1], zero on [0,1/4] and one on [1/2,1]. For
`ρ²=|ξ|²+|η|²>0`, replace σ_P by `a=χ(|ξ|²/ρ²)σ_P` and σ_Q by
`b=χ(|η|²/ρ²)σ_Q`, extended by0 across their respective axes.
Prove the resulting A_χ smooth and homogeneous of order1, with
`A_χ* A_χ≥cρ² Id` and `A_χ A_χ*≥cρ² Id` for a fixed c>0.
Use the diagonal square and the fact that at least one cutoff is1.
Interpolating each coefficient from1 to its χ value gives an invertible
continuous homogeneous-symbol homotopy. Prove cutoff
and normalization independence and quantize A_χ by P4, averaging the
quantization by P5 to make it equivariant.

Consume VonNeumannAlgebras V2's completed Hilbert tensor product. Own its
unitary comparison with L² of the external bundle by Fubini and simple-tensor
density, and completeness of the product eigen-expansions. On these spaces
put `D_P=[[0,P*],[P,0]]`, `D_Q=[[0,Q*],[Q,0]]`.
With the external product connection compute
`∇*∇_(E⊠F)=∇*∇_E⊗1+1⊗∇*∇_F`; hence its shifted Laplacian is
`L_(E⊠F)=L_E⊗1+1⊗L_F−1`. Prove the product H¹ norm comparison
with `(H¹⊗̂L²)∩(L²⊗̂H¹)`. Identify P⊗1 with P acting in X with y∈Y
as parameter, through the fibres E_x⊗F_y, and similarly for Q; these
identities make the chart decomposition of D exact.
Prove D_P is self-adjoint on `H¹(X;E₀⊕E₁)` and D_Q on `H¹(Y;F₀⊕F₁)`, each on
its own factor: P6's distributional elliptic regularity identifies the maximal L²
adjoint domain with H¹, and formal symmetry identifies the actions. The amplified
terms D_P⊗1 and Γ_E⊗D_Q on the product do not have the product H¹ as maximal
domain; the product domain is the intersection-domain statement below. Prove smooth sections are graph cores and their
resolvents compact by the H¹ embedding. Define
`D=D_P⊗1+Γ_E⊗D_Q` on the common product graph domain. Prove its even-to-odd block is the displayed
matrix and `D²=D_P²⊗1+1⊗D_Q²`. Use the commuting square spectral
expansions to identify this graph domain with product H¹ and prove
Fredholmness. Consume TKT T6.1's strong continuity of the L² section action;
the invariant metrics and densities make it unitary. For an equivariant
closed operator use the graph inner product `⟨u,v⟩+⟨Du,Dv⟩`: its action is
unitary and strongly continuous by the two L² actions. For classical elliptic
operators use P6's estimate to compare their graph norm with H¹; for the
product D use the preceding commuting-square spectral comparison. Use this one
fixed graph-H¹ Hilbert structure of D for both D and every D_ε; the averaged
D_ε are intertwiners for the same actions. Thus the generic local-constancy
theorem applies on fixed Hilbert spaces without using IndexTheory.
Compare D with classical product operators by norm approximation
on this H¹→L² realization. Decompose each factor by P4 into finitely
many chart-supported full-symbol operators plus its entire residual
smoothing operator S, retaining the cross-chart kernels. For each
bounded product term T=S⊗1 or Γ⊗S, replace it by TΠ_R, with Π_R
the source product connection-Laplacian projection onto eigenvalues≤R².
Prove TΠ_R is finite-rank with smooth kernel and
`‖T−TΠ_R‖_(H¹→L²)≤C‖T‖_(L²→L²)/R` by the product spectral expansion.
This treats the residual terms separately from the chart symbols.
Extend χ constantly by1 above1/2, put
`θ_ε(t)=χ(t/ε²)` for 0<ε<1/2, and choose a smooth radial β which is0
below1 and1 above2. In compactly supported product charts, replace each
full order1 chart factor symbol p(x,ξ) by
`[1−β(ρ/R)+β(ρ/R)θ_ε(|ξ|²/ρ²)]p(x,ξ)`, and likewise q in η,
with coefficient1 at ρ=0 and R≥ε⁻¹. Use identical scalar principal-cutoff
data for P and P*, and likewise for Q and Q*. Prove these are classical joint
symbols: their high-frequency terms vanish near the offending separate
axis and retain all homogeneous lower terms on the remaining cone.
Multiply each modified quantization on the input by a compact chart cutoff
equal to1 on the original input support, in both variables. The original
operator kills its complementary cutoff, so the error is exactly the
modified-minus-original symbol quantization followed by this input cutoff.
Prove its H¹ multiplier bound and hence the same Cε estimate. This makes
each new chart operator well-defined on the product manifold.
For the difference from the unmodified full symbol prove, for every fixed
finite set of base derivatives, the bound `C_α ε〈(ξ,η)〉`, uniformly
in ε,R. The removed region has |ξ|≤Cερ, and its bounded-frequency
contribution is controlled by R⁻¹≤ε. Prove the weighted Fourier–Schur
lemma converting these base-derivative bounds into an H¹→L² bound Cε;
no frequency-derivative bounds uniform in ε are assumed. Patch with square
partitions and prove the same estimate for the actual global D, retaining
all lower-order chart terms and the truncated residual smoothing terms.
Average over G×H and prove uniform boundedness
of its action on these Sobolev maps. Prove the principal symbols are uniformly
O(ε) close on the product cosphere to the invariant continuous symbol A;
averaging preserves this bound. For small ε the averaged symbols and the
straight homotopy back to A stay invertible by its uniform inverse bound.
Thus the resulting classical D_ε
converges to D in H¹→L² norm. The modifications are made blockwise, so each D_ε
is odd for the product grading; write `D⁺:H¹(E₀⊠F₀⊕E₁⊠F₁)→L²(E₁⊠F₀⊕E₀⊠F₁)` and
`D_ε⁺` for the even-to-odd blocks. Apply Fredholm openness and local constancy to
`D_ε⁺→D⁺` in H¹→L² norm, which gives equal index for small ε; the full graded
operators D and D_ε are self-adjoint, so their ordinary index is zero and carries
no information. Its homogeneous block symbol is the corresponding small-cone
cutoff modification of the continuous product symbol. Prove its invertible
homotopy to A_χ, using the same diagonal-square bound; for chart-dependent
cutoffs use their uniform norm comparisons on the finite atlas.
Prove continuous invertible homogeneous-symbol homotopies between smooth
endpoints admit homotopies jointly smooth on the nonzero cotangent bundle,
continuous in the path parameter in every symbol seminorm, by relative mollification
and compact-cosphere invertibility bounds. For invariant paths average
the sufficiently close mollified path, retaining its endpoints and
invertibility. Average P4's continuous quantization of this path as well.
P6 and the equivariant local-constancy lemma above then compare `D_ε⁺`
with the even-to-odd block of the equivariant quantization of A_χ by an
elliptic Fredholm path.
IndexTheory I2/I4 owns converting these explicit symbol homotopies into
K-class/product equalities; no symbol K-theory construction is a prerequisite here.
Finally export the finite-dimensional identifications
`ker D⁺ ≃ (ker P⊗ker Q)⊕(coker P⊗coker Q)` and
`coker D⁺ ≃ (coker P⊗ker Q)⊕(ker P⊗coker Q)`,
using the adjoint-kernel/cokernel isomorphisms and positive tensor-sum
eigen-expansions. Their difference gives the equivariant product index.

Prove elliptic-complex symbols, Laplacians, Hodge splitting and finite cohomology on
compact bases for finite complexes whose differential operators have a common
positive order m, so the Hodge Laplacians have order 2m and exact symbol
complexes imply ellipticity. Build their self-adjoint realizations, compact
inverse on the kernel complement and Hodge decomposition using the positive
elliptic spectral construction above applied first to 1+Δ. Restrict Δ to
its finite-kernel orthogonal complement. If that complement is zero, set
its Green operator to zero; otherwise use its first positive eigenvalue
to construct the Green inverse there. This follows P6's estimates/Fredholm
theory, rather than assuming K5a's Laplace-type theorem covers every order.
Acceptance includes the de Rham complex's exact nonzero-covector symbol
sequence and its identification with K5a's Hodge objects.

## P7a. Finite-deck scalar-Laplacian transplantation

For a closed connected Riemannian manifold `X`, let a finite group `Q` act freely by smooth
isometries. Prove the finite action is properly discontinuous by choosing disjoint translates
of a sufficiently small neighborhood at each point. Consume
[RiemannianGeometry R4.7](../RiemannianGeometry/README.md#r4-comparison-complete-manifolds-and-space-forms)'s
quotient-atlas, descended-metric and covering construction for free properly discontinuous
isometric actions, and specialize it to each `H≤Q`. Construct `Y=X/H` and `π:X→Y`, verify
that `Y` is closed, connected and without boundary, and that its quotient metric is the unique
one making `π` a local isometry. Prove descent of Riemannian volume and the covering degree
`|H|`. Define the action on functions by `(q·f)(x)=f(q⁻¹x)`, a left unitary `Q`-action.

Use P7 with the trivial Hermitian line bundle and trivial connection. Its operator
`L=1+∇*∇` has the self-adjoint `H²` realization supplied by K5a, a positive compact inverse
and complete smooth eigenbasis; define `Δ=L−1` on that same domain and identify its smooth
expression with the nonnegative scalar Laplacian `d*d`. Derive finite eigenvalue multiplicities from P7's finite eigenbasis cutoffs and completeness.
Thus `Δ` has pure point spectrum, a smooth eigenbasis and finite multiplicities, including its
zero eigenvalue. For each isometry `q:X→X`, prove Riemannian volume preservation and
naturality of `d*d` under the inverse-pullback action, first on smooth functions and then on
`H¹` and `H²` using P5's chartwise estimates and density. Prove the action is unitary and
preserves `dom Δ=H²`, commutes with `Δ`, and preserves its closed form. Deduce that
`L²(X)^H` reduces `Δ` for every `H≤Q`: the finite averaging projection preserves the domain
and commutes with `Δ`. Only then apply P7's invariant-operator results to its eigenspaces.

Also identify this operator with the Friedrichs realization. Consume
[UnboundedOperators UO-D06](../OperatorTheory/UnboundedOperators/README.md#uo-d06--closed-forms-and-the-friedrichs-extension):
for a dense continuous injective form inclusion `j:V→H` and a closed Hermitian form `q` with
lower bound `γ`, its `closedFormOperator` `A` is the unique partial operator with
`j(u)∈dom A` iff some `h∈H` satisfies `q(u,v)=⟨h,j(v)⟩` for every `v∈V`, and then `A j(u)=h`
(inner product conjugate-linear in the first slot); it is self-adjoint with lower bound `γ`, its
selection does not depend on the admissible shift, and for a densely defined semibounded
symmetric `S` the Friedrichs extension `S_F` is `closedFormOperator` of the completion of
`q_S(u,v)=⟨Su,v⟩`. K5a, in its construction of the self-adjoint realization of formally
self-adjoint nonnegative Laplace-type systems, identifies `L` with `closedFormOperator` of the
`H¹` energy form on the geometric `L²` inclusion and proves that its domain and the maximal weak
domain are `H²`; consume that comparison here. For `q(f,g)=∫⟨df,dg⟩`, P5 smooth density
identifies the completion of `q` on `C∞(X)` in the norm `(q[f]+‖f‖²)^(1/2)` with `H¹`, so by
the uniqueness clause and shift independence the Friedrichs extension of `Δ|C∞` is K5a's `L−1`
on `H²`. This layer owns this smooth-core/Friedrichs comparison and its finite-cover transport,
while K5a retains the weak regularity/domain identification.

For almost-conjugate subgroups `H₁,H₂≤Q`, write `Yᵢ=X/Hᵢ` and `πᵢ:X→Yᵢ`. Prove pullback
identifies `C∞(Yᵢ)` with the `Hᵢ`-invariant smooth functions on `X` and
`Δ_X(πᵢ* f)=πᵢ*(Δ_Yᵢ f)`. With Riemannian volume on both quotients, prove
`‖πᵢ* f‖²_(L²(X))=|Hᵢ|‖f‖²_(L²(Yᵢ))`; hence `Jᵢ=|Hᵢ|^(−1/2)πᵢ*` is the normalized
unitary onto the invariant subspace. Using covering charts and P5's Sobolev norms, prove that
`Jᵢ` identifies `H¹(Yᵢ)` and `H²(Yᵢ)` with the corresponding invariant subspaces on `X`.
Prove the exact operator-domain identity `Jᵢ(H²(Yᵢ))=H²(X)^{Hᵢ}=dom Δ_X∩L²(X)^{Hᵢ}`
and that `Jᵢ` transports `Δ_Yᵢ` to the invariant part of `Δ_X`: the intertwining
`Δ_X Jᵢ f=Jᵢ Δ_Yᵢ f` holds on smooth `f`, and both sides are continuous from `H²(Yᵢ)` to
`L²(X)`, so it extends from the dense smooth subspace to `H²(Yᵢ)`. This route uses only K5a's
`H²` realizations on `X` and `Yᵢ` and the `H²` comparison for `Jᵢ`, not the form
representation. Prove the corresponding resolvent and spectral-projection intertwining
identities. Also verify the closed-form identity `q_X(Jᵢf,Jᵢg)=q_Yᵢ(f,g)` on `H¹(Yᵢ)`; with
the uniqueness clause of UO-D06 applied to the unitarily transported form on the reducing
subspace `L²(X)^{Hᵢ}`, it gives the same transport for the Friedrichs realizations.

Consume [InductionRestriction Layer 2.1](../RepresentationTheory/InductionRestriction/README.md#layer-21-almost-conjugacy-and-permutation-representations),
`Gassmann.almostConjugate_iff_permutation_equiv`, for almost-conjugacy and the complex left-coset
permutation-module equivalence. For each eigenvalue `λ`, identify `E_λ(Yᵢ)` with
`E_λ(X)^{Hᵢ}` by normalized pullback and then with
`Hom_Q(ℂ[Q/Hᵢ],E_λ(X))` by the native induced-trivial Frobenius identification consumed by
IR (`Rep.indResAdjunction` and `TauCeti.indTrivialIso`), with evaluation at the identity coset.
The permutation-module
equivalence gives equal dimensions of these Hom spaces for every `λ`, so the scalar Laplacians
on `Y₁,Y₂` are isospectral with multiplicities. The pure-point and finite-multiplicity statements
here follow from the P7 conclusions just cited. The scope of P7a is scalar Laplacians on
closed manifolds with free finite-group actions. FuchsianOrbifolds L9
consumes this theorem after constructing its compact hyperbolic covering surfaces and normal
common cover. P7a has no Fuchsian dependency.


## P8. Wave front sets and microlocal regularity

Define the wave front set of a bundle distribution by rapid Fourier decay of
localized frame components in open conic frequency neighborhoods. Prove
independence of cutoff, frame and coordinates, closed conicity, projection to
the singular support, restriction, sums, conjugation and smooth multiplication.
Prove `WF(Pu)⊆WF(u)` for properly supported pseudodifferential operators and
`WF(u)⊆WF(Pu)∪Char(P)` by a microlocal parametrix with conic cutoffs and the
P2–P4 remainder estimates. Construct localized symbols and operators detecting
regular covectors and compare the Fourier-decay and elliptic-test-operator
definitions. Give Sobolev wave front sets and their order shifts using P5.
Acceptance includes point masses, a smooth-submanifold delta distribution and
their conormal wave front sets, computed on the actual density-valued test
carrier.

Own the generic distribution pullback and product criteria consumed by field-theory
roadmaps. For a smooth map `f:X→Y`, define its normal set
`N_f={(f(x),η):η≠0, (df_x)^*η=0}`. If `WF(u)∩N_f=∅`, construct
`f^*u`, prove agreement with smooth pullback, coordinate independence, composition
under the corresponding admissibility hypotheses, and
`WF(f^*u)⊆{(x,(df_x)^*η):(f(x),η)∈WF(u)}` with zero covectors removed.
Submersions have empty normal set and pull back all distributions. Define external
tensor products, their wavefront bound including the zero-covector factors, and
same-variable products as diagonal pullbacks. The product exists when no wavefront
covector of u is the negative of one of v at the same point; give its wavefront
sum bound and compatibility with smooth multiplication. Prove the failure of this
criterion for restricting a diagonal delta to that same diagonal, and distinguish
admissible pullback from an independently chosen renormalized extension. Develop the
local oscillatory-integral estimates and distribution topologies used in these
constructions, consuming the native test-function/LF and distribution carriers
supplied by [ComplexKahlerGeometry K5a](../ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality), the native Mathlib `TestFunction` LF topology and its Euclidean comparison.

Own pushforward of distribution **densities** under smooth maps, using scalar smooth tests; compare with the density-valued-test convention for scalar distributions after fixing smooth positive densities. For `f:X→Y` proper on `supp u`, construct `f_*u` by `⟨f_*u,φ⟩=⟨u,χ(φ∘f)⟩`, where χ is a compactly supported cutoff equal to one near `supp u∩f⁻¹(supp φ)`. Prove independence of χ, distribution continuity, support containment, identity/composition, and compatibility with the external tensor product. For compactly supported u every smooth f is admissible; for a projection this is integration over its fibers. Prove
`WF(f_*u)⊆{(f(x),η):η≠0, x∈supp u, (x,(df_x)^*η)∈WF(u)∪(supp u×{0})}`.
The zero-covector term records critical points of f and cannot be omitted. Proper support, rather than a pullback noncharacteristic condition, defines this operation. For a submersion, the zero term contributes no nonzero output covector. Establish continuity on a fixed proper-support carrier with a fixed wavefront cone and the normal locally convex topology; prove pullback continuity and tensor/product hypocontinuity in that topology, without promoting Hörmander's sequential continuity to continuity in a weaker topology. Use [Brouder–Dang–Hélein, §§3–6, Proposition5.1 and Theorem6.3](https://arxiv.org/html/1409.7662) for the seminorm and duality proof route. This supplies [RQFT5](../RelativisticQuantumFieldTheory/README.md#milestone-rqft5--graph-combinatorics-amplitudes-and-formal-perturbation-theory)'s compact-support functor and [RQFT6](../RelativisticQuantumFieldTheory/README.md#milestone-rqft6--distribution-products-extension-and-renormalization)'s proper-support integration; Fourier restriction for nonproper integration remains a separate application of the pullback theorem.

## References and design context

- Michael Taylor, [Pseudodifferential Operators: Four Lectures at MSRI,
  September 2008](https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/msripde.pdf),
  Lecture I §§1–4,7–8: quantization, symbols, mapping estimates, parametrices and
  wave front sets.
- Gerd Grubb, [Distributions and Operators, chapter 8](https://web.math.ku.dk/~grubb/dist8.pdf):
  coordinate transformations, compact-manifold bundles and elliptic Fredholm
  theory.
- Gerd Grubb and Lars Hansen, [Complex powers of resolvents of
  pseudodifferential operators](https://web.math.ku.dk/~grubb/manus/powers02.pdf),
  Definition2.1 and §4: weakly parameter-dependent symbol estimates and
  resolvent powers for classical pseudodifferential operators.
- R. Seeley, *Complex powers of an elliptic operator*, Proc. Sympos. Pure Math. 10
  (1967), 288–307, for P7's resolvent construction.
- The source courses are Thomas Mark's Index Theory and Thomas Mark's Math 240 Riemannian
  Geometry. The explicit symbol, weight, shear, square-partition, Ehrling,
  Morrey and nonlinear-bootstrap acceptance statements above include the
  differential-operator and Sobolev exercises.
- The [mathlib PDE Theory discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/PDE.20Theory/near/578491976)
  identifies interpolation/Fredholm/spectral foundations. Follow native Bessel,
  distribution and Fourier designs, and implement required missing calculus in
  Tau Ceti; adopt Mathlib's corresponding interfaces when they land.
