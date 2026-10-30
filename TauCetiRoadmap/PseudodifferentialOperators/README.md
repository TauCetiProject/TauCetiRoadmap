# Roadmap: pseudodifferential operators and elliptic analysis on bundles

**Summary.** Build differential operators, the classical pseudodifferential calculus and its
Sobolev, elliptic and microlocal consequences on smooth finite-rank bundles.
The result includes usable symbols and kernels, quantization, composition and
adjoints, parametrices, distributional regularity and Fredholm operators. It
supplies the analytical symbol theory used in index theory and the arbitrary-order
bundle operators used in Riemannian geometry.

## Scope and ownership

This roadmap owns the smooth differential-operator core (P1.0), classical symbol
calculus (P2–P4), bundle mapping estimates (P5), general elliptic regularity and
Fredholm theory (P6), elliptic powers and product indices (P7), finite-deck
isospectrality (P7a), and microlocal distribution operations (P8).
DifferentialGeometry Layers 0–1 and 5 supplies smooth forms and integration;
SmoothBundlesConnections B2–B4 supplies smooth bundles, metrics and connections;
ComplexKahlerGeometry K5a supplies manifold distributions and the compact p=2
Sobolev scale; PDE Lane A and Lane B items 8–10 supply scalar weak-derivative
and harmonic-analysis estimates. P5 owns the general-p bundle comparisons.

P5's compatible couples, strip quotient and K-method are generic constructions,
with arbitrary common Hausdorff topological vector spaces; the distribution-space
realization is an application. They are the common interpolation objects for
this roadmap and NoncommutativeIntegration §§2.2–2.4, whose noncommutative
Lp and Lorentz identifications use that generic theory. No reverse supply from
noncommutative integration is needed for the Bessel/Besov comparisons here.

## Conventions

Manifolds are finite-dimensional, smooth, Hausdorff, second countable and
boundaryless. Bundles are finite-rank real or complex smooth vector bundles;
complexify real bundles for Fourier symbols, and prove compatibility with
conjugation to recover real operators. Global Fredholm assertions concern compact
manifolds. Local assertions on noncompact manifolds use compact localization and
proper support; they do not assert a global Fredholm theorem on every noncompact
base. Euclidean uniform-symbol results explicitly impose bounds uniform in x.

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

## Exact supplier contracts

**From Mathlib.** Use the native manifold, smooth-section, distribution, Fourier,
Bessel-potential, compact-operator and Fredholm carriers with their own topologies.
The declarations and geometric supplier contracts are specified below.

Use Mathlib's `FiberBundle`, `VectorBundle`, `ContMDiffVectorBundle`,
`SchwartzMap`, `TemperedDistribution`, `TestFunction`, `Distribution`,
`ContinuousLinearMap`, `ContinuousLinearEquiv`
and `ContinuousLinearMap.IsFredholm`.

**From TauCetiRoadmap.DifferentialGeometry.** Layers 0–1 and 5 supply forms,
differentiation and integration/densities, using native smooth partitions of unity.

**From TauCetiRoadmap.SmoothBundlesConnections.** [B2–B4](../SmoothBundlesConnections/README.md)
supplies bundle sections, metrics, connections, L² and tensor/dual/Hom operations.

**From TauCetiRoadmap.ComplexKahlerGeometry.** [K5a](../ComplexKahlerGeometry/README.md) supplies bundle
distributions, the shared compact-bundle H^s Hilbert scale for every real s,
localization/duality/interpolation and Laplace-type Hodge theory. Consume that
scale and compare the constructions from P1.1 onward with it. P1.0's early smooth-section
module and first-jet constructions use only SBC B2's bundle floor. K5a's initial
density bundle precedes the density-valued transpose/formal-adjoint part of P1.0.
K5a's distributional action and Laplace analysis consume the differential-operator core;
P1.1 and P2–P7 consume K5a's analytic scale.

**From Mathlib's Bessel-potential theory.** Consume
`Analysis/FunctionalSpaces/BesselPotentialSpace` and its
`BesselPotentialSpace E F s p`, its distribution map and `toLpₗᵢ`, completeness,
and the p=2 Hilbert structure. Its unbundled comparison is
`TemperedDistribution.MemSobolev`, with
`memSobolev_iff_exists_smulLeftCLM_fourier`. Consume these actual Euclidean
carriers. Consume Tau Ceti's scalar weak-Sobolev and Bessel APIs in
`Analysis/Sobolev/{Wkp,W1p,BesselPotential,RellichKondrachov}`;
its existing Rellich theorem concerns W₀^(1,p), and W1p/Extension gives
extension by zero.

**From TauCetiRoadmap.PDE.** [Lane A.6](../PDE/README.md) supplies the required
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

**From TauCetiRoadmap.RepresentationTheory.** For compact equivariance consume
[CompactGroups Layers 0–3](../RepresentationTheory/CompactGroups/README.md)
for normalized Haar averaging, complete reducibility and Schur's lemma.

**From TauCetiRoadmap.TopologicalKTheory.** Consume [T6.2](../TopologicalKTheory/README.md#t6-equivariant-k-theory-and-associated-bundle-products)'s
independent algebraic representation-ring construction for the SplitK0 ring of genuine continuous finite-dimensional
representations and its external tensor product. These precede equivariant
Bott and index theory.

**From Tau Ceti.** In addition to the Sobolev, Fredholm and spectral declarations
above, consume the point-derivation equivalence and its inverse equation in
`TauCeti/Geometry/Manifold/DerivationBundle.lean`, under finite dimension,
Hausdorffness and the interior-point hypothesis. The global smooth-field
identification in P1.0 extends this pointwise result.

## How to read the build

P1 develops differential operators and their symbols. P2–P4 construct and
quantize the local and global symbol calculus; P5 proves mapping estimates on
the stated analytic carriers; P6 constructs parametrices and their Fredholm
consequences. P7 builds powers, product indices and elliptic-complex Hodge theory,
P7a transports the scalar spectrum across finite coverings, and P8 establishes
the wavefront criteria. The labels P1–P8 also identify the corresponding
contracts in consuming roadmaps. The acceptance file states only the headline
theorems that its native carriers can express.

## Layer 1: Differential operators, jets and symbols (P1)

### P1.0. Differential-operator core

For the scalar foundations put A=C∞(M,ℝ), and use the kernel of evaluation
as the ideal I_x={f:f(x)=0}. Prove the global algebraic ideal identity
`I_x²={f:f(x)=0 and df_x=0}`, where the square consists of finite sums of
products, on every manifold in scope, including noncompact M. The acceptance declarations are `smoothVanishingIdeal` and
`mem_smoothVanishingIdeal_sq_iff`. Use the smooth
Hadamard factorization in a chart and nested compactly supported cutoffs
(Kolář–Michor–Slovák, §§1.3–1.6, pp. 5–7, for the partition-of-unity,
germ and local factorization inputs; the global finite-sum argument follows).
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
`I_x.Cotangent≃ₗ[ℝ]T_x*M`, stated as `exists_smoothCotangentEquiv`, sending the class of f∈I_x to `mvfderiv I f x`.
Prove compatibility with tangent-vector evaluation, restriction to open sets,
pullback differentials and the coordinate-differential bases. Construct the
complex-valued version using the scalar-function algebra described below.

The ideal and cotangent API includes:

- Evaluation kills exactly the vanishing ideal; the quotient class of f has zero differential
  exactly when f is a finite sum of products of functions vanishing at x.
- Cotangent evaluation on a tangent vector agrees with the differential of a representative.
- Restriction and pullback induce the corresponding maps on cotangent quotients.

**Checks.**

- At 0∈ℝ, f(t)=t² has f(0)=f′(0)=0 and f=t·t∈I₀²; t has derivative 1 and is not in I₀².
- The class of t at 0 evaluates on the vector 3 to 3; the class of t² evaluates to 0.
- On a discrete zero-dimensional manifold, e=1 away from x and e(x)=0 satisfies e²=e;
  every f∈I_x equals ef, so I_x²=I_x and both cotangent spaces are zero.

*Needs:* Mathlib evaluation kernels and `Ideal.Cotangent`; Tau Ceti's point-derivation,
chart-cutoff and Hadamard results; finite dimension, Hausdorffness and second countability.

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

The section-module API includes:

- Multiplication and evaluation obey (fs)(x)=f(x)s(x); restriction preserves this equation.
- Constant real functions recover the native real scalar action.
- The real scalar tower and commuting-action laws hold on the same section carrier.

**Checks.**

- On the trivial real line, f(x)=2+x and s(x)=x give (fs)(3)=15, not the constant-scalar value 6.
- For a rank-zero bundle every section and every product has value 0.
- With f=2 and s(x)=x, both smooth-function multiplication and real scalar multiplication
  give 6 at x=3; restricting to an open interval containing 3 preserves that value.

*Needs:* SmoothBundlesConnections B2's bundle operations; Mathlib smooth sections and
`ContMDiff.smul_section`.

#### First jets of a vector bundle

For every smooth finite-rank real vector bundle V, construct its first-jet bundle
`J¹V` from the value and first derivative of local sections, with transition
maps given by the first-order chain/product rules (Kolář–Michor–Slovák,
§§12.16–12.17, pp. 124–125, specialized to vector bundles). Prove smooth gluing,
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

The first-jet API includes:

- The projection keeps the value; its kernel is canonically T*M⊗V.
- Restriction and bundle isomorphisms preserve jet extension and the exact sequence.
- A connection splits the sequence; adding an endomorphism-valued one-form changes the
  derivative coordinate by its action on the value coordinate.

**Checks.**

- For f(t)=t² at t=1, the first jet in the trivial line is (1,2), so it remembers more than value.
- For g(t)=t²+(t−1)², the first jet at 1 is also (1,2), while f″(1)=2 and g″(1)=4;
  the first-jet equivalence must not identify second jets.
- Replacing d by d+a dt on the trivial line sends the jet of the constant section 1 from
  (1,0) to (1,a), leaving its value and the underlying jet unchanged.

*Needs:* the smooth section module; SmoothBundlesConnections B2's tensor/dual operations;
B3's connection only for the splitting.

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
equivalence to define `derivationVectorField`; prove smoothness as
`contMDiff_derivationVectorField` from its values on bump-localized coordinate
functions (Kolář–Michor–Slovák, Lemma 3.3, p. 16). Prove inverse evaluation `δ(f)(x)=df_x(X_x)`, locality and
restriction to open sets. Prove `field(fδ)=f·field(δ)` pointwise before
bundling it as a C∞-linear equivalence. The acceptance theorem
`exists_derivationEquivSmoothVectorField` states the underlying real-linear
equivalence with its pointwise equation; the C∞-linear upgrade uses the smooth
function-module construction above. Intertwine the derivation commutator
with `VectorField.mlieBracket I X Y`; consume its smoothness theorem
`ContDiff.mlieBracket_vectorField` and scalar rule `mlieBracket_smul_right`.

The real derivation API includes:

- The global equivalence has pointwise inverse equation δ(f)(x)=df_x(X_x).
- It is local, respects open restriction and intertwines the commutator with the vector-field bracket.
- Multiplying a derivation by a smooth function multiplies its field pointwise.

**Checks.**

- For δ=∂, f(x)=x² at x=3, both δf and df(δ) equal 6.
- For (2+x)δ at x=3, the field coefficient is 5; its action on x² is 30=5·6.
- For X=x∂ and Y=∂, [X,Y]=−∂, giving −1 on x; the reversed bracket gives +1.

*Needs:* the section module, point-derivation equivalence, compactly supported coordinate
functions and Tau Ceti's finite-dimensional Hadamard factorization.

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

The complex smooth-function and section API includes:

- Real and imaginary parts reconstruct a complex smooth function and commute with restriction.
- Multiplication by i defines J with J²=−Id; the function action agrees with constant complex scalars.
- Complex derivations correspond to pairs of real fields with the displayed inverse formula and
  preserve the complexified bracket.

**Checks.**

- For δ=∂+2i∂ and f=x²+ix at x=3, the formula gives 4+13i=(1+2i)(6+i).
- Acting twice by i on the constant section 1 gives −1, excluding J=Id and the zero action.
- Complex conjugation takes i to −i, whereas i times its value on 1 is i; it is real-linear
  but not a complex-linear operator and does not satisfy the complex scalar splitting.

*Needs:* the real dictionary and section modules; SmoothBundlesConnections B2 complexification;
real smoothness of complex addition and multiplication.

For an ℝ-linear endomorphism D of A, or an ℂ-linear endomorphism of A_ℂ,
prove that vanishing of every double commutator `[[D,M_f],M_g]` for f,g in
that full scalar-function algebra gives the unique splitting
`D(f)=X(f)+fD(1)`. Compare this with the local-coordinate definition through
the commutator equivalence below. Its symbols are
`σ_geom(D)(ξ)=ξ(X_x)` and `σ_F(D)(ξ)=iξ(X_x)`, extending ξ complex-linearly
in the complex case. Real-linear operators on complex-valued functions are
operators on the real rank-two trivial bundle, with matrix-valued order-zero
parts; the complex scalar splitting requires complex linearity.

**Checks.**

- For D=∂+3 on the trivial real line, D(1)=3 and X=∂; at x=2, D(x²)=16=4+12.
- For D=∂², the double commutator with multiplication by x equals 2Id, excluding first order.
- At ξ=2, the first-order symbols of ∂ are 2 geometrically and 2i in Fourier convention.

*Needs:* the real and complex derivation dictionaries and pointwise multiplication.

Using the preceding smooth section modules, restrictions and multiplication,
construct linear differential operators between bundles with an order filtration,
defined by local finite-coordinate derivative expressions of bounded order.
Prove the equivalent factorization
through the order-m jet bundle, and vanishing of m+1 iterated commutators with
scalar multiplication. Build the jet bundle from finite Taylor coefficients,
coordinate-chain-rule transition maps and truncation exact sequences
(Kolář–Michor–Slovák, §§12.2–12.5, pp. 117–119, and §§12.16–12.17,
pp. 124–125); prove
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

The differential-operator, higher-jet and transpose API includes:

- The order filtration agrees with jet factorization and with iterated scalar commutators.
- Truncation of jets commutes with restrictions and their coordinate changes.
- The density transpose and metric formal adjoint satisfy integration by parts on compact
  supports, reverse composition and agree with restriction.

**Checks.**

- On ℝ, [[∂²,x],x]=2Id, so division by 2! gives principal coefficient 1; the third commutator is 0.
- An order-zero bundle map is multiplication by its fiber map; multiplication by 3 has
  commutator 0 with every scalar function but is not the zero operator.
- For P=a(x)∂ on the trivial line with density dx, P*=−conj(a)∂−conj(a′);
  at a=x the zeroth-order term is −1, so merely negating the leading derivative is wrong.

*Needs:* the section module, finite Taylor jets and chart Hadamard factorization; for adjoints,
SmoothBundlesConnections B2–B4 metrics and the density bundle in ComplexKahlerGeometry K5a.

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

The symbol and connection-Laplacian API includes:

- The top coefficient is independent of the connection and agrees with iterated commutators.
- Composition multiplies principal symbols; formal adjunction has the convention fixed above.
- The negative metric trace agrees with ∇*∇ for a metric connection and canonical density.

**Checks.**

- For P=∂², σ_geom(P)(ξ)=ξ² and σ_F(P)(ξ)=−ξ²; at ξ=2 these are 4 and −4.
- On the circle, ∇=d gives ∇*∇ exp(ikx)=k²exp(ikx); k=0,1,2 give 0,1,4.
- The order-zero matrices e₁₂,e₂₁ have commutator diag(1,−1); commuting leading symbols
  are necessary for the one-order drop.

*Needs:* the differential/jet construction and formal adjoints; HopfRinow Layer 1's
Levi–Civita connection and SmoothBundlesConnections B3 induced connections.

For D of Dirac type use the polarized anticommutator
`σ_geom(D)(α)*σ_geom(D)(β)+σ_geom(D)(β)*σ_geom(D)(α)=2g*(α,β)Id`.
Prove D*D is Laplace type, with D* the formal adjoint for the canonical
Riemannian density of g and the chosen fiber metrics. Relative to an arbitrary
chosen metric connection the remainder has order≤1; construct the unique Bochner
connection absorbing the first-order term before asserting a zeroth-order
remainder (Gilkey, §2, Lemma 2.1, p. 289, applied to c⁻¹ times the operator
when its leading coefficient is c>0). Prove that this connection is metric,
and the zeroth-order remainder fiberwise self-adjoint, when the Laplace-type
operator is formally self-adjoint for the canonical Riemannian density and
those fiber metrics (Gilkey, paragraph after Lemma 2.1, p. 289). Acceptance includes
the failure for another density: on the standard circle with the trivial real
line, D=∂ₓ is of Dirac type, its formal adjoint for the density `e^(sin x) dx` is
`−∂ₓ−cos x`, the product `−∂ₓ²−cos(x)∂ₓ` is formally self-adjoint for that
density, and its Bochner connection `d+½cos(x)dx` is not metric for the standard
fiber metric.
RiemannianGeometry R7.2–3 consume these generic symbol/Bochner constructions;
SmoothBundlesConnections B3 supplies the chosen connection data.

The Laplace-type and Bochner API includes:

- Positive scalar multiples of a Laplace-type operator remain Laplace type with the rescaled coefficient.
- For canonical density a formally self-adjoint Laplace-type operator has a unique metric
  Bochner connection and self-adjoint zeroth-order remainder.
- Dirac polarization implies that D*D is Laplace type; arbitrary chosen connections give
  only an order-at-most-one remainder until the Bochner connection is selected.

**Checks.**

- For D=∂ on the flat line with density dx, D*D=−∂² and its Fourier symbol at ξ=2 is 4.
- Replacing −∂² by −2∂² changes c from 1 to 2 and that value from 4 to 8; −∂⁴ is not Laplace type.
- On the weighted circle in the example above, the Bochner connection coefficient at x=0
  is 1/2; metric compatibility on the unit constant section would require 0=1, which fails.

*Needs:* the symbol and formal-adjoint calculus, chosen metrics and canonical Riemannian density;
SmoothBundlesConnections B3 connections.

### 1.2 Locality and Peetre's theorem (P1.1)

Consume K5a's pointwise real Hodge star and its codifferential; construct curl in
oriented dimension 3 and the de Rham operator examples, comparing their symbols
with P1.0. Consume K5a's real codifferential sign and star/Laplacian
commutation identities. Consume K5a's Fréchet topology on all smooth bundle sections. Prove Peetre's
local finite-order statement for linear local maps between smooth section spaces,
without assuming continuity: for every compact K there is an integer r such that
j^r_x u=j^r_x v implies (Pu)(x)=(Pv)(x) for all x∈K
(Kolář–Michor–Slovák, Theorem 19.1, pp. 176–177).
Distinguish this from globally bounded order; deduce continuity in the
smooth-section Fréchet topology from the local differential expressions. This theorem consumes P1.0's operator core and K5a's topology;
K5a's Laplace-type regularity does not consume this theorem.

**Checks.**

- Multiplication by a nonzero smooth a is local and has order 0; its value on f is af.
- ∂ is local and has order 1, since [∂,x]=Id rather than 0.
- On the countable disjoint union of circles, take ∂^j on the jth component. Every compact
  set meets only finitely many components, so its order is bounded there; the global orders
  0,1,2,… have no common finite bound.

*Needs:* P1.0 differential operators; ComplexKahlerGeometry K5a's smooth-section Fréchet
topology and real Hodge-star/codifferential comparisons.

### Examples

The first-jet pair (1,2), the bracket [x∂,∂]=−∂ and the weighted-circle
connection give scalar, first-order and density-sensitive examples.

### Dependencies

Mathlib smooth manifolds and sections; Tau Ceti point derivations and Hadamard
factorization; DifferentialGeometry smooth integration; SmoothBundlesConnections
B2–B4; HopfRinow Layer 1; ComplexKahlerGeometry K5a's density and section-topology contracts.

## Layer 2: Symbols and asymptotic expansions (P2)

### 2.1 Local and uniform symbols

Use `CoordinateSpace` for ℝⁿ, `coordinateDeriv` for an iterated coordinate
derivative, and `mixedDeriv` for spatial derivatives after frequency derivatives.
The local carriers allow arbitrary normed complex coefficient spaces V,W;
the summation and operator headlines use finite-dimensional V,W, as for bundle
fibers. The acceptance carrier `Symbol` is on all of ℝⁿ; restriction to chart domains
and extension after compact localization give the local comparisons.
For every real m define smooth Hom(V,W)-valued `S^m_(1,0)` symbols on U×ℝⁿ by
`‖∂_x^α∂_ξ^β a(x,ξ)‖≤C_(K,α,β)〈ξ〉^(m−|β|)` on each compact K⊂U.
Use 〈ξ〉=(1+|ξ|²)^(1/2). Give seminorms, locally convex topology,
restriction, addition, order inclusions, matrix composition, differentiation,
smooth compact cutoffs and continuous parameter families. The predicate `Symbol.IsUniform`
uses the same bounds on all x. The predicate `Symbol.HasCompactSpatialSupport`
requires one compact K outside which the coefficient is zero for every ξ. Define smoothing symbols as the intersection of
all orders and prove its ideal laws.

The symbol API includes:

- Spatial derivatives preserve order, frequency derivatives lower order by their length,
  and composition of coefficient maps adds orders.
- Restriction preserves local bounds; a compact spatial cutoff gives global uniform bounds.
- Smoothing symbols form the intersection of all orders and an ideal under these products.

**Checks.**

- The constant scalar 1 has order 0 with bound 1; all its nonempty coordinate derivatives are 0.
- In one dimension ξ has order 1, since |ξ|≤〈ξ〉 and ∂_ξξ=1; it has no order-zero bound
  because its value at ξ=k is k→∞.
- In one dimension x has local order 0 with bound max_(x∈K)|x| and first derivative 1,
  but has no all-x uniform bound: its value at x=k is k→∞. A spatial bump has compact
  spatial support, whereas 1 does not when n>0.

*Needs:* finite-dimensional coordinate calculus, native continuous-linear coefficient maps,
compact cutoffs and P1's finite-rank local frames (Taylor, Lecture I, (1.15), p. 5).

### 2.2 Classical expansions and Borel summation

Define `HomogeneousSymbol` by smoothness off ξ=0 and positive real homogeneity;
its value at ξ=0 is set to zero and need not be continuous there.
Define `FrequencyCutoff` by smoothness, values in [0,1], vanishing for |ξ|≤1
and value one for |ξ|≥2. Define `ClassicalSymbol` by homogeneous terms a_(m−j) on ξ≠0, a fixed cutoff
near zero and remainders of order m−N after N terms. Prove uniqueness of these
terms, independence of the cutoff, restriction and product rules. Prove Borel
asymptotic summation using cutoffs at successively larger frequency radii with
explicit seminorm estimates, for any nonincreasing sequence m_j of real orders tending to −∞:
`exists_asymptoticSum` asserts that for a_j∈S^(m_j) there is b∈S^(m_0)
with b−Σ_(j<N)a_j∈S^(m_N) for every N≥0, with an actual remainder
symbol and coefficient equality. For a compact Hausdorff parameter space T
and continuous maps a_j:T→S^(m_j) in every compact-x symbol seminorm,
construct a continuous b:T→S^(m_0) and continuous remainder maps
r_N:T→S^(m_N) with the same coefficient equality for every t∈T and N≥0;
choose the frequency cutoffs independently of t. A proof route is Melrose,
Chapter 2, Proposition 2.3 and (2.55)–(2.57), pp. 39–40: that statement treats
uniform symbols of orders m−j. For the local, variable-order version, diagonalize
over a compact spatial exhaustion, derivative orders and remainder indices.
For each fixed N, eventually m_j<m_N, so a sufficiently large cutoff radius
makes the tail's S^(m_N) seminorms summable; the finitely many tail terms
with j≥N before that threshold already have order at most m_N. Subtracting
the first N original terms leaves only these tail terms and finitely many
compact-frequency cutoff discrepancies. For parameter families take the suprema over T
in these estimates; uniform convergence in each seminorm preserves continuity.
Construct the
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

The homogeneous-symbol API includes:

- Restriction and coefficient composition preserve positive homogeneity with the stated degrees.
- Extending a homogeneous term by zero at ξ=0 is a value convention; smoothness is required only off zero.
- Multiplying a homogeneous term by a frequency cutoff gives a smooth symbol of its degree.

**Checks.**

- For ξ², scaling ξ=1 by t=2 gives 4=2²·1, whereas degree-one homogeneity would give 2.
- On ℝ, for degree zero the term equal to 1 off zero has assigned value 0 at zero; it is not
  continuous there, while its cutoff product is smooth.
- In one dimension |ξ| is smooth off zero and positively homogeneous of degree 1:
  |2·1|=2|1|=2, while its values at 1 and −1 are both 1. Positive homogeneity
  imposes no odd-parity condition.

The frequency-cutoff API includes:

- The cutoff is identically zero on the closed unit ball and identically one outside the radius-two ball.
- Its derivatives of positive order vanish outside the transition annulus; every derivative is bounded.
- Two cutoffs differ by a smooth compactly supported function; multiplying their difference by
  a homogeneous term extended by zero gives a smoothing symbol.

**Checks.**

- On ℝ, put h(t)=exp(−1/t) for t>0 and h(t)=0 for t≤0, and set
  χ(ξ)=h(|ξ|−1)/(h(|ξ|−1)+h(2−|ξ|)). The denominator is positive since
  |ξ|−1 and 2−|ξ| cannot both be nonpositive. The values at radii 1, 3/2 and 2
  are 0, 1/2 and 1; flatness of h at zero and constancy near ξ=0 give smoothness.
- The step equal to 0 for |ξ|<3/2 and 1 otherwise has the endpoint values 0 and 1,
  but its one-sided limits at radius 3/2 are 0 and 1, so it is not a frequency cutoff.
- The smooth function χ+4χ(1−χ) has the same endpoint values as χ, but at radius 3/2
  it equals 3/2>1. The range condition excludes it.

The classical-expansion and summation API includes:

- Homogeneous terms are unique; changing a cutoff changes the cut-off expansion by smoothing terms.
- The remainder after N terms has order m−N, including N=0; composition adds exponent classes.
- Asymptotic sums are unique modulo smoothing and admit the compact-parameter comparison stated above.

**Checks.**

- For a=ξ²+1, the homogeneous degrees 2,1,0 have terms ξ²,0,1; after the third
  cutoff term the remainder is (1−χ)(ξ²+1), compact in frequency.
- For m_j=−j, a₀=1 and a_j=0 for j≥1, b=1 gives remainder 1 at N=0 and 0 for every N≥1.
- For a=ξ of classical order 1, the leading term is ξ and every later homogeneous
  term is zero; for every N≥1 the remainder is (1−χ)ξ. At ξ=3 it is 0,
  whereas at ξ=1 it is 1, so a nonzero smoothing remainder is allowed.
- The symbol 〈ξ〉^(1/2)+1 has no classical expansion of order 1/2 with integer steps:
  after its leading term the constant 1 cannot have order −1/2, since 〈k〉^(1/2)→∞.
- For a₀=1, a₁=2, all later terms zero and orders 0,0,−1,−2,…, b=3 has remainders
  3,2,0 at N=0,1,2. Equal successive orders are allowed; tending to −∞ is essential
  for uniqueness modulo smoothing. The same equalities hold for a constant parameter family.
- Put r=〈ξ〉, m_j=−j−1 and a_j=(−1)^j r^(−j−1). Then b=1/(r+1)
  has remainder (−1)^N r^(−N)/(r+1), of order −N−1. At ξ=0, b=1/2 and
  the first three remainders are 1/2, −1/2, 1/2. The original series at ξ=0
  does not converge; an asymptotic sum is not defined as its pointwise sum.

*Needs:* §2.1 symbol seminorms and cutoff estimates; finite-dimensional coefficient spaces;
compactness of the parameter set for uniform seminorm bounds. Classical expansions use
Taylor, Lecture I, (1.17), p. 5.

### Examples

The expansions of ξ²+1 and the finite sequences above fix both remainder indexing
and the distinction between the real-order and integer-step filtrations.

### Dependencies

P1 local frames; native Euclidean derivatives, compact cutoffs and continuous-linear maps.

## Layer 3: Oscillatory kernels and local quantization (P3)

### 3.1 Oscillatory integrals and the kernel theorem

Define oscillatory integrals by smooth compact cutoff regularization and
integration by parts, with polynomial-growth amplitude estimates. Prove the
limits, independence of cutoff, differentiation and distributional pairing
rules. First implement absolute single-Fourier-integral quantization on
Schwartz input as `quantizeSchwartzValue`, prove integrability and continuity in its seminorms, and
identify its distribution kernel. Consume K5a's finite-order estimates and extension of compactly
supported distributions to tempered distributions. Consume K5a's identification of compactly supported distributions with the
continuous dual of all smooth sections with its Fréchet seminorm topology,
rather than construct a second LF/Fréchet comparison. Prove
the Schwartz kernel theorem: continuous linear maps
`C_c^∞(N;E)→D′(M;F)` correspond uniquely to distributional kernels on M×N
with coefficient bundle `F⊠(E*⊗Density_N)` (Hörmander I, Theorem 5.2.1,
for the Euclidean scalar correspondence with its proof; Melrose, Introduction
to Microlocal Analysis, Theorem 1.2, p. 16, states the tempered version
`𝓢(ℝᵐ)→𝓢′(ℝⁿ)` with kernel in `𝓢′(ℝⁿ⁺ᵐ)`, and Dyatlov, MIT 18.155,
Fall 2021, Lecture 7, p. 11, states the compactly supported version;
the finite-rank and density comparison is obtained by the chart patching below).
Use the LF source topology and
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

The quantization and kernel API includes:

- The Schwartz-input integral is absolutely convergent, smooth in x and continuous in Schwartz seminorms.
- Kernel pairing recovers the original operator and determines the kernel uniquely.
- Transpose swaps the two kernel variables with the required dual/density coefficients.

**Checks.**

- For a=1, Fourier inversion gives Op(a)u=u; at u(x)=exp(−x²), x=0, the value is 1.
- For a=ξ, Op(a)u=−iu′; for the same u at x=1 this is 2i/e, fixing the sign and the 2π rescaling.
- The zero symbol gives zero kernel and zero operator; the identity has delta kernel on
  the diagonal, not a smooth constant kernel.

*Needs:* native Schwartz Fourier inversion and integration; §2.1 symbol bounds;
ComplexKahlerGeometry K5a test/distribution and density carriers. The Fourier convention
is Taylor, Lecture I, (1.1)–(1.4), pp. 3–4, after change of frequency.

### 3.2 Amplitudes and proper support

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

The amplitude and proper-support API includes:

- Integration by parts gives smooth kernels off the diagonal and the stated amplitude-to-symbol remainders.
- Properly supported kernels preserve compact test support and extend by transposition.
- Removing an off-diagonal kernel gives a smoothing remainder, with proper support retained when required.

**Checks.**

- The identity kernel is supported on the diagonal and preserves the support of every test function.
- On ℝ the smooth kernel K(x,y)=1 sends a compact test of integral 1 to the constant 1;
  it is smoothing locally but fails compact-support preservation.
- The kernel exp(−(x−y)²) is smooth; at (x,y)=(0,1) its value is 1/e. It is not properly
  supported on ℝ, since its support is all ℝ². Smoothness alone does not give properness.

*Needs:* §3.1 kernels and oscillatory integrals; §2.1 amplitude estimates; compact cutoffs
(Taylor, Lecture I, (1.21)–(1.28), pp. 6–7, for Euclidean amplitudes).

### Examples

The delta kernel and the constant smooth kernel separate identity, smoothing and
proper support. Quantizing ξ on exp(−x²) gives 2ix exp(−x²).

### Dependencies

P2; native Fourier and test-function APIs; ComplexKahlerGeometry K5a's distribution,
density and LF/Fréchet comparisons.

## Layer 4: Composition, adjoints and global bundles (P4)

### 4.1 Composition and adjoints

Prove the composition expansion (Taylor, Lecture I, (2.5)–(2.7), p. 8)

`a#b ∼ Σ_α (1/i)^|α|/α! (∂_ξ^α a)(∂_x^α b)`

and the analogous adjoint expansion (Taylor, Lecture I, (2.3), p. 7) with
matrix Hermitian adjoint and density/
metric factors in arbitrary frames. Every truncation includes its claimed
remainder order and continuity estimates. Derive leading symbols,
commutator formulas, smoothing ideal laws and associativity from actual
operators. If the leading symbols commute, the next commutator term is
`(1/i)Σ_j(∂_ξj a_m ∂_xj b_l−∂_ξj b_l ∂_xj a_m)` plus
`[a_m,b_(l−1)]+[a_(m−1),b_l]`. Give the Poisson-bracket formula when one
full symbol is scalar times Id; commuting principal matrices alone do not
remove the subprincipal commutators.

**Checks.**

- In one dimension, ξ#x=xξ−i and x#ξ=xξ, so [D,x]=−iId.
- For matrices e₁₂,e₂₁ the zeroth composition terms give e₁₁ and e₂₂ respectively;
  their commutator remains order 0 and is diag(1,−1).
- For p(x,ξ)=e^(ix)ξ, formal adjunction gives e^(−ix)(ξ−1), not just e^(−ix)ξ.

*Needs:* P3 amplitude reduction, kernel composition and transpose; P2 remainder estimates.

### 4.2 Global quantization and symbol recovery

Prove coordinate and frame transformation formulas by the amplitude calculus;
the principal symbol transforms intrinsically as a Hom-bundle-valued function
on T*M\0 (Taylor, Lecture I §8, (8.1)–(8.3), pp. 23–24, for the
compact scalar class; finite-rank frame changes follow entrywise from §4.1,
and proper support gives the locally finite noncompact construction).
Patch properly supported operators on bundles and show independence
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
of the principal-symbol map is order m−1. Derive this exact sequence by
restricting the local symbol quotient to classical symbols and patching:
a zero leading homogeneous term is precisely an order-m−1 classical symbol,
and a smooth degree-m homogeneous symbol is lifted using a fixed frequency
cutoff (Melrose, Chapter 2, §2.9, Lemma 2.5, p. 45, for the local quotient
sequence; Introduction to Microlocal Analysis, §5.3, Proposition 5.2,
(5.32)–(5.36), pp. 133–134, for the global patching argument).

With charts, partitions, frequency cutoffs and proper-support kernel cutoffs
fixed, construct a continuous linear quantization Q from smooth degree-m
homogeneous bundle symbols to properly supported classical order-m operators,
with σ_m(Q(a))=a. Use the C∞ seminorms on compact subsets of the cosphere
bundle for the source, and the localized classical coefficient, remainder
and smooth-kernel seminorms for the target. Deduce continuity on compact
parameter families and continuous lifts of symbol homotopies in these
topologies. This is a deduction from the explicit patching in Melrose,
Introduction to Microlocal Analysis, §5.3, proof of Proposition 5.2,
(5.35)–(5.36), p. 134: frequency-cutoff extension is linear and continuous
on homogeneous symbols, and the P2–P3 seminorm estimates control each
localized quantization. For a prescribed initial operator P₀ with symbol a₀,
the lift of a_t is Q(a_t)+P₀−Q(a₀).
Keep the residual smoothing term in equalities, including cross-chart terms.
Define membership in the global properly supported classical class by a
properly supported distribution kernel smooth off the diagonal, such that
every chart compression φPψ with compactly supported smooth chart cutoffs
is Op(a) plus a smooth-kernel operator for a local classical order-m symbol.
Prove equivalence with the patching construction and independence of charts
(Taylor, Lecture I §8, pp. 23–24; Melrose, Introduction to Microlocal
Analysis, §5.3, Proposition 5.1, (5.26)–(5.28), p. 133).
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
`a(x,ξ)=exp(−ix·ξ)Op(a)(exp(i·ξ))(x)` for full Euclidean quantization
(Melrose, Chapter 2, §2.8, (2.75)–(2.77), pp. 43–44: the inverse full-symbol
map). Interpret the exponential through its Fourier point mass, so this
identity does not assume a general operator action on noncompact smooth
inputs.
For a closed compact K⊂ℝⁿ define output support in K by
`supp(Op(a)f)⊆K` for every compactly supported smooth f. Prove this is
equivalent to x-support of the full symbol a being contained in K, using
the distribution kernel and Fourier injectivity in its second variable.
This support equivalence is a deduction: output support in K means that the
kernel vanishes on (ℝⁿ\K)×ℝⁿ; in the displacement variable z=x−y,
the angular-frequency Fourier transform of the kernel K_a(x,x−z) is
a(x,ξ), hence vanishes exactly when a does.
Use P3's kernel correspondence (Dyatlov, Lecture 7, p. 11) and Fourier
injectivity on tempered distributions (Melrose, Introduction to Microlocal
Analysis, §1.7, Corollary 1.1, p. 21). Localize in x to apply the tempered
statement when the symbol has only local x estimates.
Distinguish this from compact support only in the input variable or merely
proper support of the kernel. These are exact full-quantization statements.
For proper-support truncation state recovery modulo smoothing, not an exact
formula. Construct square partitions Σχ_j²=1 and their symmetric bundle
quantization, and compare with the ordinary partition construction.

The global-class and quantization API includes:

- Chart compression and the patched full-symbol definition give the same properly supported class.
- Principal symbols transform intrinsically, and equal principal symbols leave an order-m−1 difference.
- Full-symbol recovery is exact for full Euclidean quantization; proper-support truncation preserves it modulo smoothing.

**Checks.**

- Under y=eˣ, quantizing y²η² and pulling back gives −∂ₓ²+∂ₓ; on f(x)=x this is 1,
  whereas quantizing ξ² in x gives 0. Equal leading symbols do not imply a smoothing difference.
- For a(x,ξ)=χ(x), full quantization is multiplication by χ and symbol recovery returns χ;
  χ supported in K has output support in K, while the identity symbol 1 does not for proper K⊊ℝⁿ.
- In one dimension a(x,ξ)=1+ξ has displacement kernel δ₀−iδ₀′; its
  angular-frequency Fourier transform is 1+ξ. At ξ=2 recovery gives 3,
  whereas reversing the displacement sign would give 1−ξ=−1.
- For a square partition at a point with χ₁=χ₂=1/√2, Σχ_j²=1; the unsquared sum is √2.
- On the circle, take m=1, a_t(ξ)=(1+t)ξ and Q(a_t)=(1+t)D. If P₀=D+2Id,
  the prescribed-initial-value lift is (1+t)D+2Id: its symbol is (1+t)ξ and its
  value at t=0 is D+2Id. Dropping the correction would start at D.

*Needs:* §4.1 calculus; P3 kernels; P2 symbols; P1 differential polynomial symbols and
SmoothBundlesConnections B2 frame transitions; P2–P3 localized seminorm estimates
and native Fourier injectivity for the parameter and recovery deductions.

### Examples

The coordinate change y=eˣ detects the first lower-order correction. The scalar
commutator [D,x]=−iId fixes the composition convention.

### Dependencies

P1–P3; smooth partitions of unity and finite-rank bundle charts.

## Layer 5: Sobolev, Lp and Hölder mapping estimates (P5)

### 5.1 Hilbert-scale mapping estimates

Consume K5a's shared p=2 scale, Peetre inequalities and weighted Schur
bounds. For compactly x-supported local symbols, use the rapid decay of
their x-Fourier transforms to prove `Op(a):H^s→H^(s−m)` for every real s
(`exists_quantizeSobolev`; Taylor, Lecture I, (3.31), p. 12, after compact
x-localization). Its Schwartz-input comparison uses `schwartzToSobolev`, the
native distribution embedding into the Bessel-potential carrier. For symbols with
uniform x-bounds on all ℝⁿ, prove order-zero L² boundedness by a finite-seminorm
Calderón–Vaillancourt/Cotlar almost-orthogonality argument
(`exists_quantizeUniformOrderZero`; Taylor, Lecture I, (3.1), p. 9); supply the
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

**Checks.**

- For a=1 in the uniform class, quantization is the identity on H⁰, with operator norm 1
  on a nonzero fiber. It need not have compact spatial support.
- For a=χ(x) with compactly supported χ and s=m=0, the map is multiplication by χ;
  its L² norm is at most sup|χ|, and χ=0 gives the zero map.
- Multiplication by x has local order 0 but is not L² bounded on ℝ: for a normalized
  test supported in [0,1], its translate to [k,k+1] has L² norm 1 and output norm at least k.

*Needs:* P2 symbol estimates; P3 quantization; P4 uniform calculus; native
Bessel-potential spaces and ComplexKahlerGeometry K5a's p=2 localization.

### 5.2 Weak derivatives and endpoint embeddings

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
no self-adjoint boundary-condition classification is part of this example
(Brezis, Theorem 8.2 for the absolutely continuous representative, Theorem 8.7
for density of smooth restrictions, Theorem 8.12 for the H₀¹ characterization
by vanishing endpoint values).
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
counterexample at r=n. The Euclidean scalar inputs are Adams–Fournier,
Theorem 4.12 (Part I, cases A–C, including the p=1, r=n continuous map into
bounded continuous functions) and Theorem 6.3 (Rellich–Kondrachov, with the
strict exponent margins for compactness); Brezis, Theorems 9.9 and 9.16,
give the first-order p=1 inequality and the bounded-domain compactness. These statements are for positive-dimensional
compact bases, with finite bundle charts and their actual covariant norms;
for 1≤p≤∞ and integers k>l≥0 prove compact W^(k,p)→W^(l,p)
on compact bases. The single Ehrling target below consumes these
compact embeddings.
These weak-derivative endpoint results are independent of the
order-zero pseudodifferential and Calderón–Zygmund bounds below.

The weak-derivative bundle API includes:

- The finite-chart and connection norms are equivalent and complete on the weak-derivative carrier.
- Smooth sections are norm dense for finite p; restriction to open charts preserves weak derivatives.
- Integer Sobolev embeddings have the endpoint ranges and compactness margins stated above.

**Checks.**

- The constant function 1 belongs to H¹(0,1) with derivative 0 but not H₀¹(0,1);
  its endpoint traces are (1,1), not (0,0).
- For f(x)=exp(λx), λ>0, the ratio ‖f′‖₂/‖f‖₂ is λ, excluding L² boundedness of D
  without the graph norm; for λ=1 and 2 the ratios are 1 and 2.
- A fixed nonconstant smooth compact bump φ, rescaled as φ(x/ε) in dimension n,
  has ‖∂^nφ(x/ε)‖₁ constant and sup norm constant; its support shrinks to 0.
  Thus the critical W^(n,1) unit ball need not be relatively compact in C⁰.
- In one dimension |x| has weak derivative sign(x) almost everywhere; every smooth
  approximation has derivative error at least 1 in essential sup norm near 0,
  excluding smooth norm density in W^(1,∞).

*Needs:* PDE Lane A.3–A.7 weak derivatives, trace, extension and scalar embeddings;
SmoothBundlesConnections B3 connections; P1 finite-rank local frames.

### 5.3 Interpolation and Bessel/Besov comparisons

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
Build compatible Banach couples embedded in a common Hausdorff topological vector
space, with intersection and sum norms (Bergh–Löfström, §2.3, Lemma 2.3.1,
pp. 24–25), using distributions for the Bessel-space application. For 0<θ<1,
build the complex interpolation space (Bergh–Löfström, §4.1, Lemma 4.1.1
and Theorem 4.1.2, pp. 87–88): construct the Banach space of bounded continuous functions on the closed
strip into X₀+X₁, holomorphic inside, whose boundary maps t↦F(j+it) are
continuous into X_j and tend to zero as |t|→∞. Its norm is
`max_(j=0,1) sup_t ‖F(j+it)‖_(X_j)`. Build the evaluation-at-θ quotient
with its infimum norm. Consume `verticalClosedStrip`, `DiffContOnCl` and
`Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`.
Prove completeness, exact operator
interpolation, endpoint embeddings, retraction compatibility and equivalent-
norm naturality. Prove Stein's analytic-family interpolation and imaginary
Bessel-power bounds using PDE Lane B's multiplier estimates. First prove the
finite-dimensional-fiber Lebesgue space identity `[L^p₀,L^p₁]_θ=L^p_θ`
(Bergh–Löfström, Theorems 5.1.1–5.1.2, pp. 106–107):
construct analytic families for simple functions by complex powers of their
norm and fixed unit directions, then use density, duality and three lines for
the two continuous inclusions. Deduce
`[H^(s₀,p₀),H^(s₁,p₁)]_θ=H^(s_θ,p_θ)`, where
`s_θ=(1−θ)s₀+θs₁` and `1/p_θ=(1−θ)/p₀+θ/p₁`, with 1<p₀,p₁<∞
(Bergh–Löfström, Theorem 6.4.5(7), pp. 152–153, when s₀≠s₁;
for s₀=s₁ use the common Bessel isomorphism and Theorem 5.1.2;
finite-rank bundle comparisons use the retractions just specified).
The compatible-couple and complex-method API includes:

- Intersection and sum use their maximum and infimum norms on one common ambient space.
- A couple morphism is one map on the sum with bounded endpoint restrictions; the strip quotient
  is complete and its operator norm is at most the geometric interpolation of endpoint norms.
- Retractions and compatible endpoint isomorphisms induce the corresponding maps on the quotient.

**Checks.**

- For the couple (ℂ,ℂ) with equal norms, intersection and sum norms of 1 are both 1;
  adding the two endpoint norms without taking the infimum would give 2.
- For this couple the strip quotient norm of 1 is 1: three lines gives the lower bound;
  exp(δ(z−θ)²) gives value 1 at θ and boundary norms tending to 1 as δ decreases to 0.
  A constant nonzero strip function itself fails the boundary-vanishing condition.
- Doubling the second endpoint norm gives interpolation norm 2^θ|z|; at θ=1/4 and z=1
  this is 2^(1/4), not 2^(3/4). The function 2^(θ−z) times the same Gaussian pins the direction.

*Needs:* native Banach quotients and the three-lines bound; PDE Lane B items 8–10
for Stein interpolation and Bessel multiplier estimates.

Also build the real K-method space for
0<θ<1 and 1≤q≤∞ with
`K(t,u)=inf_(u=u₀+u₁)(‖u₀‖+t‖u₁‖)` and norm
`‖t^(−θ)K(t,u)‖_(L^q(dt/t))`, including q=∞, its Banach/functorial API
(Bergh–Löfström, §3.1, Theorem 3.1.2, pp. 38–41, and Theorem 3.4.2,
pp. 47–48) and the dyadic Besov comparison. The K-method API includes:

- For t>0 the functional is the infimum over decompositions in the common sum space.
- The real-method norm includes q=∞, is complete, and is functorial for couple morphisms.
- Endpoint isomorphisms and retractions induce equivalent real-method norms.

**Checks.**

- On (ℂ,ℂ), K(t,z)=min(1,t)|z|; for z=1 and t=1/4,1,4 the values are 1/4,1,1.
- At θ=1/2 and q=2, the square of the real-method norm of 1 is
  ∫₀¹ 1 dt+∫₁∞ t^(−2)dt=2, so its norm is √2, not the strip norm 1.
- At θ=1/2 and q=∞, sup_(t>0) t^(−1/2)min(1,t)=1. Taking z=0 gives 0
  for every t, θ and q; no division by the norm of z is permitted.

*Needs:* the common sum carrier and its quotient norm; native Lq spaces for dt/t.

For every fixed 1≤p≤∞, 1≤q≤∞, 0<θ<1 and distinct real s₀,s₁, prove on ℝⁿ,
with finite-dimensional fibers, the identity with equivalent norms
`(H^(s₀,p),H^(s₁,p))_(θ,q)=B^(s_θ)_(p,q)`
(Bergh–Löfström, Theorem 6.4.5(4), pp. 152–153), where
`s_θ=(1−θ)s₀+θs₁`; define the Besov carrier by
the dyadic Lp coefficient sequence norm for 1≤p,q≤∞ and real s.
Choose a smooth inhomogeneous Fourier partition supported in a low-frequency ball and dyadic annuli, summing to 1;
prove finite overlap, uniform rescaled derivative bounds, bounded dyadic
analysis/reconstruction and equivalence for any two such partitions (Bergh–Löfström, §6.2,
pp. 139–146, and Theorem 6.4.3, pp. 151–152). Prove
`B^s_(p,1)⊂H^(s,p)⊂B^s_(p,∞)` for every real s and 1≤p≤∞.
For this endpoint range, prove the localized convolution estimates
`‖J^s Δ_j u‖_p ≤ C_s 2^(js) ‖Δ_j u‖_p` for j≥1 and
`‖J^s Δ_0 u‖_p ≤ C_s ‖Δ_0 u‖_p`, with C_s independent of j and p,
whenever the indicated block is in Lp. Here J^s is the Bessel multiplier
`(1+‖ζ‖²)^(s/2)` in Mathlib's Fourier variable. Obtain these estimates from
uniform L¹ bounds on the rescaled convolution kernels: Tonelli and the integral
norm bound give the L¹ and L∞ operator bounds, and PDE Lane B.9's
Riesz–Thorin theorem gives the intervening p. Apply the estimates also
with −s to obtain the reverse block estimates (Bergh–Löfström, Lemma 6.2.1,
p. 140). Deduce the two embeddings and the real interpolation identity from
these estimates (Theorem 6.2.4, pp. 142–143), componentwise for finite-rank
fibers. Own the
weighted-sequence K-method interpolation formula for distinct weights s₀,s₁,
with ℓ^q coefficient norms and q=∞ included (Bergh–Löfström, Theorem 5.6.1,
pp. 122–123). Use dyadic decomposition and
these estimates to prove the stated Besov identification and its reverse
inclusion, rather than only an operator interpolation inequality.
Before the bundle construction, prove the Euclidean Besov transition
estimates for every real s and 1≤p,q≤∞: multiplication by a smooth matrix A
with every derivative, including order 0, uniformly bounded is bounded
`B^s_(p,q)(ℝⁿ;F)→B^s_(p,q)(ℝⁿ;G)`, and pullback by a diffeomorphism φ of ℝⁿ
such that φ and φ⁻¹ have uniformly bounded derivatives of every positive order
is a bounded isomorphism of B^s_(p,q)(ℝⁿ;F), inverse to pullback by φ⁻¹ and
agreeing with distribution pullback; the operator norms depend on s, n, the
partition and the derivative bounds, and not on p or q. Prove both by block
decomposition: with a second dyadic partition equal to 1 on the supports of the
first, write the transition T on a block as Σ_k Δ_j T Δ̃_k and show that the
kernel of Δ_j T Δ̃_k has L¹ bounds in each variable at most C_N 2^(−N|j−k|)
for every N, integrating by parts against the higher-frequency block, which is
2^(−N·max(j,k)) times derivatives of a Schwartz function by its annular Fourier
support, and using P2–P4's localized kernel estimates, distribution pullbacks
and the chain rule for the composed factor. Prove the Lp Schur test as part of
this target: an integral kernel whose L¹ norms in each variable are at most A
defines an operator of norm at most A on Lp for every 1≤p≤∞, by Tonelli at p=1,
the integral norm bound at p=∞ and Hölder's inequality with Tonelli in between.
It converts the kernel bounds into one Lp→Lp bound for every 1≤p≤∞, and the
ℓ^q triangle inequality applied to the shifted weighted block sequences, with the
factors 2^(−N|j|), gives the ℓ^q bound once N>|s|.
For s>0 the modulus-of-continuity norm of Bergh–Löfström, Theorem 6.2.5,
pp. 144–146, with the chain rule and mean value theorem is an alternative route
to the pullback bound; the general-s statement is the target.
Then prove the bundle Bessel/Besov interpolation identity for 1<p<∞ through
the bounded localization/reconstruction retractions, and construct bundle Besov
spaces and their partition and localization comparisons for the full range
1≤p,q≤∞ by finite chart localization, using the transition estimates just
stated for the choice-independence of the norms.
For finite p define the little Besov subspace of B^s_(p,∞) by the condition
`2^(js)‖Δ_j u‖_p → 0` as j→∞, using every localized component for bundles.
On compact bases prove that this is exactly the norm closure of smooth
sections, independent of the localization and dyadic partition; in ℝⁿ the
corresponding closure is that of compactly supported smooth functions.
Derive the closure description from dyadic truncation and the finite-p
approximation of each fixed block; compare the finite-q density and q=∞
closure distinction with Bergh–Löfström, Theorem 3.4.2(b,c), p. 47.
The full q=∞ Besov spaces
remain the targets of the real interpolation identity above.
The Besov and localized Bessel API includes:

- Dyadic analysis/reconstruction are bounded and independent, up to equivalent norms, of the partition.
- The weighted-sequence K-method and localized convolution estimates give both inclusions
  in the Euclidean Besov identification for s₀≠s₁ and 1≤p,q≤∞.
- The Euclidean Besov transition estimates hold for every real s and 1≤p,q≤∞, with
  constants independent of p and q; the resulting bounded coordinate/frame transitions give
  complete bundle Besov spaces for 1≤p,q≤∞ and complete bundle Bessel spaces for 1<p<∞,
  with norms independent of atlas, frame and partition up to equivalence; localized Bessel
  spaces H^(s,p), 1<p<∞, have smooth density and the specified bilinear density duality.
- Smooth sections are dense in bundle B^s_(p,q) on compact bases for 1≤p,q<∞;
  for 1≤p<∞ and q=∞ their closure is the little Besov subspace just defined.
- The little subspace is closed with complete inherited norm; inclusion into B^s_(p,∞)
  is isometric for the same chosen dyadic norm.
- Equivalent partitions and bundle localizations give the same little subspace with equivalent norms;
  bounded coordinate/frame transitions restrict to it, since the Euclidean transition estimates
  are bounded and preserve compactly supported smooth functions, whose closure it is.

**Checks.**

- A normalized dyadic sequence with one nonzero coefficient in position j has norm 2^(js)
  in the weighted sequence model; changing s from 0 to 1 at j=2 changes 1 to 4.
- At s₀=0,s₁=2,θ=1/4, the interpolated order is 1/2, not 3/2.
- A sequence of N unit weighted coefficients has ℓ¹ norm N and ℓ∞ norm 1;
  the two Besov bounds must retain their different q indices.
- On ℝ, the constant distribution 1 has H^(0,∞) and H^(2,∞) norms both 1.
  The inverse Bessel operator J^(−2) is convolution by the nonnegative mass-one
  kernel π exp(−2π|x|), so H^(2,∞) embeds contractively into L∞ and
  K(t,1)=min(1,t). At θ=1/2 and q=∞ the interpolation norm is 1;
  its inhomogeneous Besov blocks are (1,0,0,…) and its Besov norm is also 1.
  At q=2 the interpolation norm is √2, so the general identity uses equivalent norms.
- At p=1 on ℝ, put g(x)=π^(−1/2)exp(−x²) and u=J^(−2)g with the same kernel.
  Positivity and mass one give ‖u‖₁=‖J²u‖₁=1 and K(t,u)=min(1,t);
  at θ=1/2,q=∞ its interpolation norm is 1. The zero input instead has norm 0.
  This tests p=1 separately from the p=∞ constant, which is not integrable on ℝ.
- On ℝ/(2πℤ) with measure dx/(2π), choose annular multipliers equal to 1 at their
  central frequency 2ʲ and 0 at the other dyadic centers, with the low block zero
  at 2ʲ for j≥1. For u=Σ_(j≥1)2^(−j)exp(i2ʲx), each weighted L² block
  2ʲ‖Δ_j u‖₂ equals 1; the partial sum through N has B¹_(2,∞) error exactly 1.
  Every smooth v has weighted blocks tending to 0, so ‖u−v‖_(B¹_(2,∞))≥1.
  This excludes smooth density at q=∞ even though p=2.

**Checks (Euclidean Besov transitions).**

- On ℝ with annular multipliers ψ(2^(−j)ξ), j≥1, the Fourier transform of u∘φ for
  φ(x)=2x is û(ξ/2)/2, so for j≥2 the block Δ_j(u∘φ) equals (Δ_(j−1)u)∘φ, with Lp norm
  2^(−1/p)‖Δ_(j−1)u‖_p; the weighted block 2^(js)‖Δ_j(u∘φ)‖_p is 2^(s−1/p) times the
  weighted block j−1 of u, and the blocks j=0,1 of u∘φ are controlled by the blocks 0,1 of u.
  At p=1 the factor is 1/2 for s=0 and 2 for s=2: pullback is bounded for every p and q but is
  not an isometry, and its norm depends on s. The derivative bounds of φ and φ⁻¹ are 2 and 1/2.
- At p=q=∞ on ℝ, with annular multipliers equal to 1 at their central frequency 2ʲ and 0 at
  the other dyadic centers, and the low block 0 there, multiplication by a(x)=exp(2πi2^J x),
  J≥1, sends the constant 1 (every annular block zero, norm 1) to a function whose only
  nonzero block is j=J, of weighted norm 2^(Js); at s=1 and J=3 it is 8 although sup|a|=1.
  A transition bound with constant sup|A| is wrong; the derivatives of a, of size 2π2^J,
  enter the constant.
- At p=q=2 on ℝⁿ, Plancherel and the two-sided bound of Σ_j 2^(2js)|ψ_j(ξ)|² by
  constant multiples of (1+‖ξ‖²)^s give B^s_(2,2)=H^(s,2) with equivalent norms, so the
  shear (x,y)↦(x,y+x³) of §5.4, whose pullback is unbounded on H¹, is unbounded on
  B¹_(2,2): its derivative 3x² is unbounded, so the hypothesis of bounded derivatives
  of every positive order cannot be dropped.

**Checks (little Besov spaces).**

- The preceding series has weighted tails 1 and is excluded; zero and each finite
  trigonometric polynomial have eventually zero blocks and belong to the little space.
- Replacing the coefficients by 2^(−2j) gives weighted blocks 2^(−j) at s=1.
  The B¹_(2,∞) error after N terms is 2^(−N−1)→0, so this series is in the
  little space; requiring only bounded tails would also admit the preceding non-example.
- For these same coefficients and 1≤q<∞, the weighted tail norm is
  2^(−N−1)/(1−2^(−q))^(1/q)→0; at q=2 and N=0 it is 1/√3.
  The original unit weighted sequence instead has infinite ℓ^q norm.

*Needs:* the real interpolation construction and weighted-sequence formula, dyadic partitions,
the localized L¹ convolution-kernel bounds above, Tonelli, the integral norm bound
and PDE Lane B.9's Riesz–Thorin theorem for the Euclidean real identity;
P2–P4 localized kernel estimates and distribution pullbacks, Tonelli, the integral norm
bound and Hölder's inequality for the Lp Schur test, and finite-dimensional chart retractions
for the Euclidean Besov transition estimates and
the bundle Besov carriers and comparisons at every 1≤p,q≤∞;
the complex interpolation construction and PDE Lane B multiplier estimates for the
interior-p bundle Bessel transitions.

For 1<p<∞ and nonnegative integer k,
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
**Checks.**

- In dimension 3, k=2,p=2 gives k−n/p=1/2 and the C^(0,1/2) embedding.
- In dimension 2, k=p=2 gives k−n/p=1, so the integer-margin claim supplies
  C^(0,β) for every β<1, not a claimed Lipschitz endpoint.
- For φ(x,y)=(x,y+x³), det dφ=1 but ∂ₓ(f∘φ)=(∂ₓf)∘φ+3x²(∂_yf)∘φ;
  translated tests near x=k preserve L² norm while the second term grows like 3k².

*Needs:* PDE Lane A.4/A.7 and Lane B; the preceding interpolation and coordinate-transition
bounds; ComplexKahlerGeometry K5a's p=2 coordinate estimates.

### 5.4 Hölder, Zygmund and little Hölder spaces

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
Take the local dyadic estimates for multiplication by smooth matrices and
pullback by smooth chart diffeomorphisms, including negative r, from the
(p,q)=(∞,∞) case of §5.3's Euclidean Besov transition estimates, proved there
with P2–P4's localized kernels and distribution pullbacks. Prove completeness,
bounded localization/reconstruction and equivalence of the finite-atlas
norms under atlas, frame and partition changes. Transport the dyadic
operator estimates through these maps to obtain the bundle theorem above.
Also construct the little Hölder space h^(k,α), the closure of smooth
sections in this norm, as a closed Banach subspace. Characterize it by
vanishing small-scale α-Hölder modulus of the kth derivatives in the
finite chart/parallel-transport comparison, and prove independence of
those choices. This is the completion of smooth sections in the
`C^(k,α)` norm. Distinguish it from the full Hölder space: a local
cutoff times |x|^α lies in C^(0,α) but fails the vanishing-modulus test.
Prove smooth density on h^(k,α), the resulting completion maps from
Sobolev spaces, and restriction of the bounded operator mappings above
to these closed subspaces, using their action on smooth sections.
Prove bundle product estimates for W^(k,p)∩L∞ and multilinear coefficient
maps. In particular prove the algebra property of W^(k,p) for integer
k>n/p, 1≤p≤∞, and of H^(s,p) for s>n/p, 1<p<∞, with continuous
multiplication in those norms. Prove Ehrling:
for integers k>l≥0, 1≤p≤∞ and ε>0, the compact-base bound
`‖u‖_(W^(l,p))≤ε‖u‖_(W^(k,p))+C_ε‖u‖_(Lp)` from the compact embedding
W^(k,p)→W^(l,p) and the continuous embedding W^(l,p)→Lp. Argue by
contradiction: if the bound fails for some ε, normalize a failing sequence to
`‖u_j‖_(W^(k,p))=1`; then `‖u_j‖_(W^(l,p))>ε` while `‖u_j‖_(Lp)→0`, and a
W^(l,p)-convergent subsequence has a limit of W^(l,p) norm at least ε and Lp norm zero.
Include the Euclidean common-compact-support versions, consuming K5a's
p=2 Rellich and compact C^k embeddings; translations disprove
unqualified whole-space Rellich. Work out the shear (x,y)↦(x,y+x³): prove
pullback is an L² isometry but unbounded H¹→H¹, using translates of a
fixed smooth compactly supported function whose y derivative is nonzero.
This is the specified Sobolev-order counterexample to a determinant-only bound.

The Hölder and Zygmund API includes:

- Finite-chart norms are complete, invariant up to equivalence, and compatible with localization/reconstruction.
- C^(k+α)_*=C^(k,α) for 0<α<1; the little space is the closed smooth subspace,
  characterized by vanishing small-scale modulus.
- Properly supported classical operators shift the Zygmund order, and their smooth-input
  action restricts the noninteger Hölder mapping to the little spaces.

**Checks (full Hölder spaces).**

- On the trivial line over a nonempty compact base, the constant 1 has sup norm 1 and
  Hölder seminorm 0; the seminorm alone would incorrectly give norm 0.
- For f(x)=|x|^α near 0 with 0<α<1, the quotient
  |f(h)−f(0)|/|h|^α=1. A compactly supported cutoff of this function is α-Hölder.
- For 0<β<α, the corresponding quotient for |x|^β is |h|^(β−α)→∞;
  at α=3/4, β=1/4 and h=1/16 it is 4. A cutoff does not cure this local failure.

**Checks (little Hölder spaces).**

- The α-cusp has quotient 1 at every small scale and is excluded from h^(0,α).
  For any smooth g the quotient of g(h)−g(0) tends to 0, so the Hölder seminorm
  of |x|^α−g near zero is at least 1; smooth norm approximation is impossible.
- For a smooth f with bounded derivative the quotient is at most C|h|^(1−α)→0;
  the constant 1 has quotient 0 at every scale and belongs to the little space.
- For 0<α<β<1, a cutoff of |x|^β has small-scale α-Hölder modulus at most
  C r^(β−α)→0. With α=1/4, β=3/4, its quotient between 0 and h=1/16 is 1/4,
  and tends to 0 as h tends to 0; little Hölder membership does not require smoothness.

**Checks (Zygmund spaces).**

- On ℝ, the constant 1 has low block Δ₀1=1 and every annular block zero, hence norm 1
  for every r. Omitting the inhomogeneous low block would give 0.
- In the dyadic sequence model, a block at j=2 of L∞ norm 1 contributes 2^(2r);
  r=0 gives 1 and r=1 gives 4, fixing the sign of the weight.
- On ℝ take annular multipliers ψ(2^(−j)ξ), j≥1, with nonzero inverse Fourier
  transform of sup norm c>0. For δ₀ the jth block has sup norm c·2^j:
  at j=1,2 it is 2c,4c. Weight 2^(−j) gives c,c and a bounded sequence,
  while weight 1 gives an unbounded sequence; thus δ₀ belongs to C^(−1)_*
  and does not belong to C^0_*.

**Checks (Ehrling).**

- For a constant nonzero section with trivial connection, Ehrling reduces to
  ‖u‖≤ε‖u‖+C_ε‖u‖; at ε=1/2 one needs C_ε≥1/2.

*Needs:* P2–P4 localized kernels, dyadic estimates and distribution coordinate changes;
§5.3's Euclidean Besov transition estimates at (p,q)=(∞,∞);
PDE Lane A.7 Hölder conventions; §5.2 compact embeddings. The Euclidean Zygmund
identifications and order shift are Taylor, Lecture I, (3.32)–(3.34), p. 12.

### 5.5 Smoothing and compact equivariance

Prove smoothing operators send distributions to smooth sections locally and
act compactly between fixed finite Sobolev orders on compact bases. Negative-
order operators are compact H^s→H^s there by the strict-order Rellich inclusion
(Atiyah–Singer I, (5.2), p. 512: on a compact base the order-m operators with
vanishing principal symbol are exactly the compact maps H^s→H^(s−m) in the
closure of the class).
Prove the distribution-extension and smooth-input constructions agree; do not
infer weak regularity from an estimate proved only for smooth inputs.

For smooth compact-Lie actions on M and smooth fiberwise-linear actions on
E,F over it, choose invariant metrics/density and prove symbol/operator averaging preserves order,
classical homogeneous terms, continuity and invariant principal symbols
(Atiyah–Singer I, (5.5)–(5.6), pp. 516–517, for conjugation continuity and
averaging in the closure calculus). Prove preservation of the actual classical
class separately through its coefficient and remainder seminorms; operator-norm
closure alone does not supply that conclusion. Differentiate the coefficient
integral under Haar integration and prove
uniform seminorm bounds on compact group parameter sets; compare it with the
Bochner integral in the Sobolev operator spaces constructed above.

The smoothing and averaging API includes:

- Smoothing kernels regularize distributions; on compact bases the resulting maps between
  fixed finite Sobolev orders are compact.
- Group averaging preserves order and invariant principal symbols, with seminorm and operator-norm control.
- The averaged quantization is equivariant for the fixed invariant metrics and density.

**Checks.**

- On the circle the multiplier (1+k²)^(−1/2) tends to 0 as |k|→∞, so its negative-order
  operator is compact on H^s; the order-zero identity has eigenvalues 1 and is not compact.
- For the trivial group, normalized Haar averaging sends an operator T to T, not 0.
- For the reflection group acting on ℝ, averaging multiplication by x gives (x−x)/2=0;
  averaging the identity gives (1+1)/2=1.

*Needs:* §5.1 mapping estimates, strict-order compact embeddings, P3 kernels;
RepresentationTheory CompactGroups Layers 0–3 normalized averaging.

### Examples

Multiplication by x separates local symbol estimates from global L² boundedness.
The scalar interpolation couple has complex norm 1 and real (1/2,2) norm √2.

### Dependencies

P1–P4; ComplexKahlerGeometry K5a p=2 scale and coordinate bounds;
PDE Lane A.3–A.7 and Lane B items 8–10; native Bessel spaces and three lines;
RepresentationTheory CompactGroups Layers 0–3.

## Layer 6: Ellipticity, parametrices and Fredholm theory (P6)

### 6.1 Ellipticity and parametrices

Define `ClassicalSymbol.IsElliptic` by invertibility of the homogeneous principal symbol away
from zero. The local inverse-principal-symbol headline is
`exists_inversePrincipalSymbol`, on finite-dimensional complex fibers.
Prove matrix inverse-symbol derivative estimates, uniformly on
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

The ellipticity and parametrix API includes:

- The inverse principal term is smooth and homogeneous of opposite order and is a two-sided inverse off zero.
- Left and right inverse expansions have one common two-sided parametrix modulo smoothing.
- Parametrices preserve proper support and supply local estimates with compact-x constants.

**Checks.**

- For the scalar principal term ξ² on ℝ, the inverse at ξ=2 is 1/4 and both products are 1;
  its assigned value at ξ=0 is 0, where no inverse equation is asserted.
- The zero endomorphism on a nonzero fiber is not elliptic in positive dimension;
  on a zero-dimensional base there are no nonzero covectors, so ellipticity is vacuous
  and must not force equality of arbitrary bundle ranks.
- For P=1−∂² on the circle, Q has multiplier 1/(1+k²), so PQ=QP=1 on every mode,
  including k=0. For P=−∂², the inverse on k≠0 leaves the constant projection as remainder.

*Needs:* P2 asymptotic summation; P4 composition and global patching; finite-dimensional
matrix inversion (Taylor, Lecture I, (4.1)–(4.6), pp. 13–14).

### 6.2 Regularity and solvability

Deduce local distributional elliptic regularity (Taylor, Lecture I,
(4.6)–(4.11), pp. 14–15), including
`Pu∈H^s_loc ⇒ u∈H^(s+m)_loc`, using local finite negative Sobolev order and the
parametrix identity on distributions. On a compact base prove, for every real
s and r<s+m, an estimate with fixed-data C

`‖u‖_(H^(s+m))≤C(‖Pu‖_(H^s)+‖u‖_(H^r))`.

Prove the corresponding interior cutoff estimates and the 1<p<∞ H^(s,p)
versions (Taylor, Lecture II, (3.1)–(3.8), pp. 31–32, whose parametrix
iteration applies verbatim to smooth elliptic symbols); give the localized
Schauder version, from the same parametrix and the Zygmund mapping theorem
with the Hölder identification of §5.4 (Taylor, Lecture I, (3.32)–(3.34), p. 12):
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
orders (Atiyah–Singer I, §6, pp. 517–519: Fredholm property from the two-sided
parametrix, independence of the index from s, (6.2) homotopy invariance of the
index in the symbol, and (6.3) invariance under change of order). On the kernel-orthogonal complement prove the lower-order term can be
removed, including W^(k,p) estimates with L² orthogonality to the smooth
kernel for 1<p<∞; the finite-dimensional kernel projection extends to those
spaces. No coercive estimate without that condition is claimed.

Compare the Laplace-type estimates and Green operators with K5a by uniqueness,
so de Rham/Dolbeault Hodge theory uses the same analytic objects. Degreewise
d has noninvertible symbol in dimension at least two; in dimension one
d:Ω⁰→Ω¹ is elliptic. P7 supplies the common-order elliptic-complex Hodge development.
Acceptance includes curl and Laplace symbols, distributional weak-test solutions and the failure of coercivity on nonzero
kernels. Prove the nonlinear bootstrap example: on a compact 4-manifold, if D
is first-order elliptic and Df=Q(f,f) for a smooth fiberwise bilinear Q with
f∈W^(1,3), then f is smooth. Use W^(1,3)→L¹², Q(f,f)∈L⁶,
elliptic W^(1,6) regularity, its bounded/Hölder embedding, and the P5 product
estimates to bootstrap every order. The iteration pattern is Taylor,
Lecture II, (5.1)–(5.8), pp. 35–36; the exponents come from Adams–Fournier,
Theorem 4.12.

**Checks.**

- On the circle Δ1=0 but ‖1‖_(H²)>0; an estimate without a lower-order term or
  kernel-orthogonality fails. The equation Δu=1 has no solution since its right side has nonzero mean.
- For the mode exp(ikx), (1−∂²) multiplies by 1+k²; its inverse gains two Sobolev orders.
- On ℝ², the symbol of d:Ω⁰→Ω¹ at (1,0) has image span(dx), of dimension 1 rather than 2;
  on ℝ, the symbol at ξ=1 is the invertible scalar i.
- In the nonlinear four-dimensional example, 1/12=1/3−1/4 and
  1/6=1/12+1/12; W^(1,6) then has positive Hölder margin 1−4/6=1/3.

*Needs:* §6.1 parametrices, P5 Sobolev/Hölder mappings and compact embeddings,
K5a local finite negative distribution order, and native compact-parametrix Fredholm theory.

### Examples

The circle constant mode detects the solvability obstruction. The nonlinear
bootstrap uses the exponents 3→12→6 rather than an unproved L∞ starting bound.

### Dependencies

P1–P5; native Fredholm and compact-operator results; ComplexKahlerGeometry K5a
negative-order distribution comparison and Laplace-type Green operators.

## Layer 7: Elliptic powers and changes of order (P7)

### 7.1 Powers and their Sobolev domains

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

The elliptic-power and parameter-symbol API includes:

- Spectral and contour powers agree, with actual Sobolev domains, inverse identities and principal positive powers.
- Strong parameter homogeneity for differential operators and separate weak frequency/parameter orders
  for classical operators give the resolvent estimates needed for the contour.
- Fixed compact parameter families give operator-topology continuity; invariant operators have invariant powers.

**Checks.**

- On the circle, L=1−∂² has eigenvalues 1+k²; k=0,1,2 give 1,2,5, and L^(−1/2)
  has eigenvalues 1,1/√2,1/√5. The identity power is 1 even at k=0.
- For principal resolvent (ξ²−λ)^(−1), scaling (ξ,λ) by (2,4) gives a factor 1/4;
  λ on the positive real spectrum is excluded rather than assigned a fictitious inverse.
- At ξ=0 and λ=−1 the resolvent is 1; at λ=−2 it is 1/2. These low-frequency values
  must be retained in the parameter construction instead of replacing ξ²−λ by ξ².
- For circle factors the product shifted-Laplacian eigenvalue at (k,l)=(1,2) is
  2+5−1=6, not 7. There are finitely many integer pairs with 1+k²+l²≤R².

*Needs:* P6 maximal adjoint-domain regularity and compact resolvents; P4 parameter-symbol
composition; native compact symmetric spectral theorem; K5a's connection-Laplacian realization.
The contour construction uses Shubin, Chapter II, §§9–11 (parameter-dependent
symbols and the resolvent, definition and structure of the complex powers),
Seeley, pp. 288–307, and Grubb–Hansen, Definition 2.1 and §4.

### 7.2 Equivariant product index

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
For ordinary Fredholm paths, compose
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
operator D is self-adjoint. The cutoff construction asserts oddness and norm
convergence of D_ε; it does not assert formal self-adjointness. The homogeneous
symbol of its even-to-odd block is the corresponding small-cone
cutoff modification of the continuous product symbol. Prove its invertible
homotopy to A_χ by concatenating the norm-close straight homotopy to A with
the coefficient homotopy from A to A_χ. The latter has the diagonal-square
bound; the former uses the uniform inverse bound and the finite-atlas estimates.
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
eigen-expansions. Their difference gives the equivariant product index. The block operator and
its square, whose kernel and cokernel are read off from the block-diagonal
operators D*D and DD* once the two factors commute, follow Atiyah–Singer I,
§9, pp. 526–530,
where the product is built from commuting lifted factors on a fibre bundle; the
length-one representative `[[σ_P⊗1,−1⊗σ_Q*],[1⊗σ_Q,σ_P*⊗1]]` of the external
product of symbol complexes is Atiyah–Singer I, §2, p. 490. The small-cone
cutoff A_χ and the norm approximation D_ε are the additions needed here because
the factors act on independent product coordinates rather than on a fibre bundle
with commuting liftings.

The equivariant-index and product API includes:

- Kernel and cokernel are genuine finite-dimensional continuous representations and define a virtual index.
- Norm-continuous equivariant Fredholm paths preserve that index on fixed Hilbert spaces.
- Order normalizations, cutoff quantizations and their homogeneous-symbol homotopies preserve the
  even-to-odd index; the product kernel/cokernel identities determine its external product.

**Checks.**

- With scalar σ_P=ξ and σ_Q=η, the product matrix is [[ξ,−η],[η,ξ]];
  at (ξ,η)=(3,4), A*A=25Id. A plus sign in the upper-right entry produces off-diagonal 24.
- On the unit cosphere one squared covector norm is at least 1/2, so the corresponding
  cutoff is 1 and A_χ*A_χ≥(1/2)Id. At (1,0) it equals Id.
- On the product of two circles take P=e^(ix)D_x on the first factor, ε=1/4,R=4,
  and let f be the prescribed
  joint cutoff. At (2,16), its angular argument is 16/65<1/4, hence f=0;
  at (3,16) it is 144/265>1/2, hence f=1. Both radii exceed 2R.
  The cut-off left symbol of P* sends mode (3,16) to coefficient 2 at (2,16),
  whereas the adjoint of the cut-off P gives coefficient 2f(2,16)=0.
  Identical real symbol cutoffs do not preserve formal adjunction.
- For the constant family id_ℂ, kernel and cokernel dimensions are 0 and the index is 0.
  If the factor kernel/cokernel dimensions are (2,1) and (3,2), the product dimensions
  are 8 and 7, giving index 1=(2−1)(3−2).

*Needs:* §7.1 powers and product eigen-expansions; P4 quantization; P5 averaging;
P6 Fredholm estimates; VonNeumannAlgebras V2 Hilbert tensor products;
RepresentationTheory CompactGroups Layers 0–3; TopologicalKTheory T6.1–T6.2
continuous actions and representation ring; native Fredholm openness.

### 7.3 Elliptic complexes

Prove elliptic-complex symbols, Laplacians, Hodge splitting and finite cohomology on
compact bases for finite complexes whose differential operators have a common
positive order m, so the Hodge Laplacians have order 2m and exact symbol
complexes imply ellipticity (Atiyah–Singer I, §7, pp. 520–522: the symbol
complex, ellipticity of `Δ_i=d_(i−1)d_(i−1)*+d_i*d_i`, harmonic sections and
the Euler characteristic as the index of the rolled-up operator). Build their self-adjoint realizations, compact
inverse on the kernel complement and Hodge decomposition using the positive
elliptic spectral construction above applied first to 1+Δ. Restrict Δ to
its finite-kernel orthogonal complement. If that complement is zero, set
its Green operator to zero; otherwise use its first positive eigenvalue
to construct the Green inverse there. This follows P6's estimates/Fredholm
theory, rather than assuming K5a's Laplace-type theorem covers every order.
Acceptance includes the de Rham complex's exact nonzero-covector symbol
sequence and its identification with K5a's Hodge objects.

The elliptic-complex API includes:

- Exact nonzero-covector symbol complexes give elliptic Laplacians of order 2m.
- The Green operator on the kernel complement gives the Hodge splitting and finite cohomology.
- The de Rham complex agrees with K5a's Laplace-type Hodge objects.

**Checks.**

- On the circle, at ξ=1 the de Rham symbol 0→ℂ→ℂ→0 has middle map i and is exact;
  at ξ=0 that map is 0 and exactness is not required.
- For the circle Laplacian, the Green multiplier is 1/k² for k≠0 and 0 for k=0;
  at k=1,2 it is 1,1/4 and ΔG=1 on those modes.
- If the kernel complement is {0}, its Green operator is the zero map and ΔG=Id−Π=0.

*Needs:* P1 complexes and symbols; P6 Fredholm theory; §7.1 positive elliptic powers and
spectral cutoffs; K5a only for comparison with its de Rham objects.

### Examples

The product matrix at (3,4) fixes the grading sign. The torus cutoff example
separates oddness from self-adjointness without changing the block index argument.

### Dependencies

P1–P6; K5a Laplace realizations; VonNeumannAlgebras V2; CompactGroups Layers 0–3;
TopologicalKTheory T6.1–T6.2; native Fredholm and compact spectral APIs.

## Layer 8: Finite-deck scalar-Laplacian transplantation (P7a)

### 8.1 Quotients and the scalar realization

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
preserves `dom Δ=H²`, commutes with `Δ`, and preserves the energy form
`q(f,g)=∫⟨df,dg⟩` on `H¹(X)`. Deduce that
`L²(X)^H` reduces `Δ` for every `H≤Q`: the finite averaging projection preserves the domain
and commutes with `Δ`. Only then apply P7's invariant-operator results to its eigenspaces.

For the energy form `q(f,g)=∫⟨df,dg⟩` on `H¹(X)`, write `q[f]=q(f,f)`. P5 smooth
density identifies the completion of `C∞(X)` in the norm `(q[f]+‖f‖²)^(1/2)` with
`H¹(X)`. Prove the weak identity `q(f,g)=⟨Δf,g⟩` for `f∈H²(X)` and `g∈H¹(X)` by
integration by parts on smooth functions and density on both sides. The
realization used throughout P7a is K5a's `H²` realization; no abstract
form-representation theorem is an input, and the energy form enters only
through this weak identity and its transport in §8.2.

The quotient and scalar-realization API includes:

- Quotient charts give a local isometry and descend the metric and volume.
- The group action preserves the H² operator domain and the H¹ energy form.
- Finite averaging gives a reducing invariant subspace; the smooth-core completion is H¹.

**Checks.**

- For the trivial subgroup the quotient map is the identity, has degree 1, and preserves volume.
- For the rotation action of the cyclic group of order d on the circle of length 2π,
  the quotient has length 2π/d; the constant function has squared norms 2π and 2π/d.
- For the constant mode, Δ1=0 and the energy form is 0; for exp(ikx), both the
  form eigenvalue and operator eigenvalue are k², so the H² realization has the correct sign.

*Needs:* RiemannianGeometry R4.7 quotient geometry; P5 density and chart estimates;
P6 weak regularity; P7 spectral realization.

### 8.2 Normalized pullback and transplantation

For almost-conjugate subgroups `H₁,H₂≤Q`, write `Yᵢ=X/Hᵢ` and `πᵢ:X→Yᵢ`. Prove pullback
identifies `C∞(Yᵢ)` with the `Hᵢ`-invariant smooth functions on `X` and
`Δ_X(πᵢ* f)=πᵢ*(Δ_Yᵢ f)`. With Riemannian volume on both quotients, prove
`‖πᵢ* f‖²_(L²(X))=|Hᵢ|‖f‖²_(L²(Yᵢ))`; hence `Jᵢ=|Hᵢ|^(−1/2)πᵢ*` is the normalized
unitary onto the invariant subspace (Bérard, §II, Lemma 16, p. 159;
his quotient norms incorporate the covering degree, whereas these norms use
Riemannian volume, giving the displayed factor). Using covering charts and P5's Sobolev norms, prove that
`Jᵢ` identifies `H¹(Yᵢ)` and `H²(Yᵢ)` with the corresponding invariant subspaces on `X`.
Prove the exact operator-domain identity `Jᵢ(H²(Yᵢ))=H²(X)^{Hᵢ}=dom Δ_X∩L²(X)^{Hᵢ}`
and that `Jᵢ` transports `Δ_Yᵢ` to the invariant part of `Δ_X`: the intertwining
`Δ_X Jᵢ f=Jᵢ Δ_Yᵢ f` holds on smooth `f`, and both sides are continuous from `H²(Yᵢ)` to
`L²(X)`, so it extends from the dense smooth subspace to `H²(Yᵢ)`. This route uses only K5a's
`H²` realizations on `X` and `Yᵢ` and the `H²` comparison for `Jᵢ`, not the form
representation. Prove the corresponding resolvent and spectral-projection intertwining
identities. Also verify the energy-form identity `q_X(Jᵢf,Jᵢg)=q_Yᵢ(f,g)` on `H¹(Yᵢ)`: on smooth
`f,g` it is the local isometry together with the degree-`|Hᵢ|` integration formula, and
both sides are continuous on `H¹(Yᵢ)`, so it extends by density. The transplantation
and Sobolev/resolvent comparisons follow the route of Bérard, §II,
Theorem 14, Lemma 16 and Comment 18(iii)–(iv), pp. 158–159, with the
H² graph-domain equality established above.

Consume [InductionRestriction Layer 2.1](../RepresentationTheory/InductionRestriction/README.md#layer-21-almost-conjugacy-and-permutation-representations),
`Gassmann.almostConjugate_iff_permutation_equiv`, for almost-conjugacy and the complex left-coset
permutation-module equivalence. For each eigenvalue `λ`, identify `E_λ(Yᵢ)` with
`E_λ(X)^{Hᵢ}` by normalized pullback and then with
`Hom_Q(ℂ[Q/Hᵢ],E_λ(X))` by the native induced-trivial Frobenius identification consumed by
IR (`Rep.indResAdjunction` and `TauCeti.indTrivialIso`), with evaluation at the identity coset.
The permutation-module
equivalence gives equal dimensions of these Hom spaces for every `λ`, so the scalar Laplacians
on `Y₁,Y₂` are isospectral with multiplicities (Bérard, §II, Theorem 17,
p. 159). The pure-point and finite-multiplicity statements
here follow from the P7 conclusions just cited. The scope of P7a is scalar Laplacians on
closed manifolds with free finite-group actions. FuchsianOrbifolds L9
consumes this theorem after constructing its compact hyperbolic covering surfaces and normal
common cover. P7a has no Fuchsian dependency.


The covering and transplantation API includes:

- Normalized pullback is unitary onto invariants and identifies H¹ and H² domains.
- It intertwines the Laplacian, its resolvents and spectral projections and preserves the energy form.
- The permutation-module equivalence identifies eigenspace multiplicities through Frobenius reciprocity.

**Checks.**

- In the degree-d circle covering, multiplying pullback by d^(−1/2) gives
  d^(−1)·2π=2π/d for the squared norm of 1; for d=4 the factor is 1/2, not 1/4.
- For H₁=H₂, normalized pullback gives identical invariant eigenspaces and equal multiplicities.
- On the cyclic quotient, an invariant mode has k=dj, giving eigenvalue d²j² on both
  sides; k=1 is not invariant when d>1.
- In the nonabelian group S₃, the order-two subgroups generated by (12) and (23)
  are conjugate: their coset permutation characters are 3,1,0 on identity,
  transpositions and three-cycles respectively. This fixes the left-action convention.

*Needs:* §8.1 reducing domains; P5 Sobolev transport; RepresentationTheory/InductionRestriction
Layer 2.1 almost-conjugacy and induced-trivial Frobenius reciprocity.

### Examples

The degree-four circle covering has unitary normalization 1/2. Conjugate
order-two subgroups of S₃ give a nonabelian consistency test.

### Dependencies

P5–P7; ComplexKahlerGeometry K5a; RiemannianGeometry R4.7;
InductionRestriction Layer 2.1.

## Layer 9: Wave front sets and microlocal regularity (P8)

### 9.1 Wavefront detection and elliptic regularity

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

The wavefront API includes:

- The Fourier-decay definition is closed conic and independent of coordinates, cutoffs and frames.
- Its projection is singular support; restriction, sums and smooth multiplication obey their inclusions.
- Properly supported operators are pseudolocal, and a microlocal parametrix detects elliptic regular covectors.

**Checks.**

- A smooth function has empty wavefront set; the constant 1 has no singular support.
- On ℝ, δ₀ has Fourier transform 1, so WF(δ₀)={(0,ξ):ξ≠0}; no nonzero cone has rapid decay.
- For δ(x) on ℝ², the wavefront covectors are (ξ,0) with ξ≠0 along x=0;
  the tangential covector (0,1) is absent, distinguishing conormal from the whole cotangent fiber.

*Needs:* P2–P4 conic symbol calculus; P6 local parametrices; K5a distribution localization
(Taylor, Lecture I, Proposition 7.3, Corollary 7.4 and (7.7), p. 22).

### 9.2 Pullback, products and proper pushforward

Own the generic distribution pullback and product criteria consumed by field-theory
roadmaps. For a smooth map `f:X→Y`, define its normal set
`N_f={(f(x),η):η≠0, (df_x)^*η=0}`. If `WF(u)∩N_f=∅`, construct
`f^*u` (Brouder–Dang–Hélein, arXiv:1409.7662v2, Proposition 5.1,
pp. 13–14, for Euclidean domains), prove agreement with smooth pullback, coordinate independence, composition
under the corresponding admissibility hypotheses, and
`WF(f^*u)⊆{(x,(df_x)^*η):(f(x),η)∈WF(u)}` with zero covectors removed.
Submersions have empty normal set and pull back all distributions. Define external
tensor products (Brouder–Dang–Hélein v2, Theorem 4.6, p. 13), their wavefront bound including the zero-covector factors, and
same-variable products as diagonal pullbacks. By Brouder–Dang–Hélein v2, Theorem 6.1, p. 21, the product exists when no wavefront
covector of u is the negative of one of v at the same point; give its wavefront
sum bound and compatibility with smooth multiplication. Prove the failure of this
criterion for restricting a diagonal delta to that same diagonal, and distinguish
admissible pullback from an independently chosen renormalized extension. Develop the
local oscillatory-integral estimates and distribution topologies used in these
constructions, consuming the native test-function/LF and distribution carriers
supplied by [ComplexKahlerGeometry K5a](../ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality), the native Mathlib `TestFunction` LF topology and its Euclidean comparison.

Own pushforward of distribution **densities** under smooth maps, using scalar smooth tests; compare with the density-valued-test convention for scalar distributions after fixing smooth positive densities. For `f:X→Y` proper on `supp u`, construct `f_*u` by `⟨f_*u,φ⟩=⟨u,χ(φ∘f)⟩`, where χ is a compactly supported cutoff equal to one near `supp u∩f⁻¹(supp φ)`. Prove independence of χ, distribution continuity, support containment, identity/composition, and compatibility with the external tensor product. For compactly supported u every smooth f is admissible; for a projection this is integration over its fibers. Prove
`WF(f_*u)⊆{(f(x),η):η≠0, x∈supp u, (x,(df_x)^*η)∈WF(u)∪(supp u×{0})}`.
The zero-covector term records critical points of f and cannot be omitted. Proper support, rather than a pullback noncharacteristic condition, defines this operation. For a submersion, the zero term contributes no nonzero output covector. Establish continuity on a fixed proper-support carrier with a fixed wavefront cone Γ and the normal locally convex topology: for a
fixed closed C containing the base projection of Γ, with f proper on C, use
the fixed target cone obtained from Γ∪(C×{0}), not a cone varying with u;
 prove pullback continuity and tensor/product hypocontinuity in that topology, without promoting Hörmander's sequential continuity to continuity in a weaker topology. Use [Brouder–Dang–Hélein, arXiv:1409.7662v2, §§3–6, Proposition 5.1
and Theorem 6.3, pp. 13–14 and 21–22](https://arxiv.org/abs/1409.7662v2)
for the Euclidean seminorm and duality proof route. Prove the manifold and
finite-rank bundle versions by localization in charts, componentwise estimates
and the coordinate/frame comparisons of P1–P5. This supplies [RQFT5](../RelativisticQuantumFieldTheory/README.md#milestone-rqft5--graph-combinatorics-amplitudes-and-formal-perturbation-theory)'s compact-support functor and [RQFT6](../RelativisticQuantumFieldTheory/README.md#milestone-rqft6--distribution-products-extension-and-renormalization)'s proper-support integration; Fourier restriction for nonproper integration remains a separate application of the pullback theorem.

The distribution-operation API includes:

- Admissible pullback agrees with smooth pullback, composes under transversality and is continuous
  for fixed admissible cones in the normal topology.
- Tensor products retain the zero-factor covectors; diagonal pullback gives the product when
  opposite wavefront covectors do not meet.
- Proper-support pushforward of densities is independent of cutoffs, preserves composition and
  is continuous for the fixed support and fixed target cone stated above.

**Checks.**

- For the projection ℝ²→ℝ, (df)*η=(η,0); its normal set is empty and pullback of δ₀
  is δ(x), with conormal covectors (ξ,0).
- Restricting δ(x−y) to the diagonal would require (η,−η) to avoid its normal set;
  instead (d diagonal)*(η,−η)=0, so the pullback criterion fails. The product δ₀·δ₀
  fails the opposite-covector criterion as well.
- The tensor δ₀⊗1 has covectors (ξ,0), ξ≠0; omitting zero covectors in the smooth
  factor would incorrectly predict an empty wavefront set.
- For the constant map ℝ→ℝ, x↦0, push a compact smooth density of integral 1 forward:
  the result is δ₀ although the input wavefront is empty. Here (df)*η=0 for every η;
  the zero-covector term in the pushforward bound supplies all nonzero output covectors.
- For the identity map and a compact density u, a cutoff equal to 1 on its support
  gives ⟨id_*u,φ⟩=⟨u,φ⟩; pushing the constant density on ℝ to a point is excluded
  because its support is not proper over that point.

*Needs:* §9.1 wavefront sets; K5a LF tests and distributions; P1–P5 coordinate/frame
comparisons; Brouder–Dang–Hélein v2, Theorem 4.6, Proposition 5.1, Theorems 6.1 and 6.3.

### Examples

The projection pulls back every distribution, the diagonal delta cannot be
restricted to itself by this criterion, and a constant proper-on-support map
creates δ₀ from a smooth compact density.

### Dependencies

P1–P6; ComplexKahlerGeometry K5a manifold distributions and density conventions;
native Fourier/test-function topology; the conic estimates in this layer.

## Downstream consumers

IndexTheory I2/I4 consumes the elliptic symbol, parametrix and equivariant product
results. RiemannianGeometry R7 consumes the differential and Bochner comparisons;
LieGroupoidsPoisson G1.1 consumes smooth-section modules; ContactGeometry CG5
consumes first jets of real line bundles. FuchsianOrbifolds L9 consumes finite-deck
scalar isospectrality. RelativisticQuantumFieldTheory RQFT5–RQFT6 consumes the
wavefront pullback, product and proper-pushforward contracts. These applications
add their own geometric or algebraic constructions.

## References

- Ivan Kolář, Peter W. Michor and Jan Slovák,
  [Natural Operations in Differential Geometry](https://www.mat.univie.ac.at/~michor/kmsbookh.pdf),
  author's electronic edition of the 1993 book: §§1.3–1.6, Lemma 3.3,
  §§12.2–12.5, §§12.16–12.17 and Theorem 19.1, with the printed page numbers
  used above, for local Hadamard factors, derivations, jets and Peetre's theorem.
- Semyon Dyatlov, [MIT 18.155, Fall 2021, Lecture 7](https://math.mit.edu/~dyatlov/18.155-F21/Lecture7.pdf),
  p. 11: the Euclidean scalar Schwartz kernel correspondence and the identity kernel.
- Jöran Bergh and Jörgen Löfström, [Interpolation Spaces: An Introduction](https://www.math.chalmers.se/~bergh/Interpolation.pdf)
  (1976), §2.3, §3.1, Theorem 3.4.2(b,c) (p. 47), §4.1 and §§5.1, 5.6, 6.2, 6.4: compatible couples,
  the complex and real methods, and Euclidean Bessel/Besov comparisons.
- Peter Gilkey, [The spectral geometry of operators of Dirac and Laplace type](https://pages.uoregon.edu/gilkey/dirPDF/E27Handbook.pdf),
  author manuscript with 2007 imprint, §2, Lemma 2.1 and the following paragraph,
  p. 289: the Bochner connection and formal self-adjointness for canonical density.
- Pierre Bérard, [Transplantation et isospectralité I](https://www.numdam.org/item/TSG_1990-1991__9__153_0/),
  Séminaire de Théorie spectrale et géométrie 9 (1990–1991), §II,
  Theorem 14, Lemma 16, Theorem 17 and Comment 18, pp. 158–160:
  finite-group transplantation, Sobolev comparisons and isospectrality.
- Richard Melrose, [Pseudodifferential operators on Euclidean space,
  Chapter 2](https://math.mit.edu/~rbm/18.199-S08/Chapter2.pdf), MIT 18.199 (2008),
  §2.5, Proposition 2.3 and (2.55)–(2.57), pp. 39–40: asymptotic summation;
  §§2.8–2.9, (2.75)–(2.77) and Lemma 2.5, pp. 43–45: full quantization and
  the principal-symbol sequence.
- Michael Taylor, [Pseudodifferential Operators: Four Lectures at MSRI,
  September 2008](https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/msripde.pdf),
  Lecture I §§1–4,7–8: quantization, symbols, mapping estimates, parametrices and
  wave front sets.
- Christian Brouder, Nguyen Viet Dang and Frédéric Hélein,
  [Continuity of the fundamental operations on distributions having a specified
  wave front set](https://arxiv.org/abs/1409.7662v2), arXiv:1409.7662v2 (2016),
  Theorem 4.6, Proposition 5.1 and Theorems 6.1, 6.3, pp. 13–14, 21–22.
- M. F. Atiyah and I. M. Singer, [The index of elliptic operators: I](https://doi.org/10.2307/1970715),
  Annals of Mathematics 87 (1968), 484–530, §2 (p. 490), (5.2) (p. 512), §6
  (pp. 517–519), (5.6) (p. 517), §7 (pp. 520–522) and §9 (pp. 526–530): symbol products,
  compact negative-order operators, Fredholm elliptic operators, elliptic
  complexes and the multiplicative property of the index.
- Richard Melrose, [Introduction to Microlocal Analysis](https://math.mit.edu/~rbm/iml90.pdf),
  MIT lecture notes, Theorem 1.2, p. 16, and §1.7, Corollary 1.1, p. 21:
  the tempered Schwartz kernel theorem and Fourier injectivity; §5.3,
  Propositions 5.1–5.2, (5.26)–(5.36), pp. 133–134: global kernels, symbols
  and the explicit quantization used for continuous parameter lifts.
- Lars Hörmander, *The Analysis of Linear Partial Differential Operators I*,
  Grundlehren 256, Springer, 2nd ed. 1990, Theorem 5.2.1: the Schwartz kernel
  theorem (cited by locator; the text is not open).
- Robert A. Adams and John J. F. Fournier, *Sobolev Spaces*, 2nd ed., Academic
  Press, 2003, Theorems 4.12 and 6.3: the Sobolev embedding and
  Rellich–Kondrachov theorems with their p=1 endpoints (cited by locator; the
  text is not open).
- Haim Brezis, *Functional Analysis, Sobolev Spaces and Partial Differential
  Equations*, Springer, 2011, Theorems 8.2, 8.7, 8.12, 9.9 and 9.16: one-dimensional
  Sobolev functions, the first-order Sobolev inequality and Rellich–Kondrachov
  (cited by locator; the text is not open).
- M. A. Shubin, *Pseudodifferential Operators and Spectral Theory*, 2nd ed.,
  Springer, 2001, Chapter II, §§9–11: parameter-dependent symbols, the
  resolvent and complex powers of elliptic operators (cited by locator; the
  text is not open).
- Gerd Grubb, [Distributions and Operators, chapter 8](https://web.math.ku.dk/~grubb/dist8.pdf):
  coordinate transformations, compact-manifold bundles and elliptic Fredholm
  theory.
- Gerd Grubb and Lars Hansen, [Complex powers of resolvents of
  pseudodifferential operators](https://web.math.ku.dk/~grubb/manus/powers02.pdf),
  Definition2.1 and §4: weakly parameter-dependent symbol estimates and
  resolvent powers for classical pseudodifferential operators.
- R. Seeley, *Complex powers of an elliptic operator*, Proc. Sympos. Pure Math. 10
  (1967), 288–307, for P7's resolvent construction.
- The [mathlib PDE Theory discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/PDE.20Theory/near/578491976)
  identifies interpolation/Fredholm/spectral foundations. Follow native Bessel,
  distribution and Fourier designs, and implement required missing calculus in
  Tau Ceti; adopt Mathlib's corresponding interfaces when they land.
