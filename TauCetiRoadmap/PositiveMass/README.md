# Asymptotically Euclidean geometry and positive mass

Develop the geometry and analysis of asymptotically Euclidean ends, ADM
mass, the Riemannian positive-mass theorem and its rigidity. Build both
the minimizing-hypersurface argument in dimensions3–7 and the spin argument
in every dimension≥3. Include the spin theorem for one specified AE end
when the rest of the complete manifold has arbitrary end geometry, as
needed by conformal Green blow-ups on covering spaces.

## Scope, conventions and suppliers

Manifolds are smooth, Hausdorff, second countable and connected, of real
dimension n≥3, with a smooth Riemannian metric. Completeness is metric
completeness of its Riemannian distance. Main positivity and zero-rigidity
theorems have no boundary; compact-boundary problems below are analytic
constructions with explicitly stated boundary conditions.

An AE end is a specified component outside a compact region, with a
diffeomorphism to ℝⁿ\B_R and coordinate estimates
`|∂^α(g_ij−δ_ij)|≤C r^(−t−|α|)` for |α|≤2,
where t>(n−2)/2. Require scalar curvature integrable in absolute value.
Use full scalar curvature, equal to n(n−1)κ at constant sectional
curvature κ. Write Δ⁺=−div grad. The chosen mass is

`m(E,g)=[2(n−1)|S^(n−1)|]⁻¹ lim_(r→∞) ∫_(|x|=r)(∂_i g_ij−∂_j g_ii)ν_j dS`.

Here dS and ν are Euclidean coordinate-sphere area and outward unit
normal. The radius limit, not a selected convergent subsequence, is part
of the theorem. Establish all independence statements in P0. In this
normalization `(1+c r^(2−n))^(4/(n−2))δ` has mass2c.

| Supplier | Interface consumed |
| --- | --- |
| [RiemannianGeometry R1–R5,R7.8](../RiemannianGeometry/README.md) | Native metric/connection/curvature, distance, Gauss and hypersurface variation, radial density, R4.3 covering criterion, R4.6 cut-locus and rigidity interfaces, and smooth Lipschitz approximation. R5b's normal Hessian/Jacobi identity is used with its compact-support and two-sidedness hypotheses. |
| [DifferentialGeometry 12.2–12.5](../DifferentialGeometry/README.md) | Native-compatible gradient, divergence, Laplace–Beltrami and density/Green identities. |
| [PDE Lanes A,C–E](../PDE/README.md), [VariationalMethods V1–V5](../VariationalMethods/README.md), [UnboundedOperators UO-D06](../OperatorTheory/UnboundedOperators/README.md) | Euclidean weak spaces, local and boundary estimates and scalar Dirichlet theory. VM V2.3 supplies realification, the complex `Complex.I` tests and the complex-linear forcing map; UO-D06 owns the dense form-domain self-adjoint realization (its closed-form operator over `RCLike 𝕜`, with both adjoint inclusions and the shifted resolvent), and VM V5.1 its compact specialization: the shifted inverse is the V2 form solution operator, compact when the inclusion is compact. Weighted/noncompact/end and Spin-boundary adaptations are constructed here. |
| [RiemannianGeometry R8](../RiemannianGeometry/README.md) | R8.1 finite scalar spherical harmonics and R8.2 their complete compact realization. P1 constructs the radial scalar inverse from these inputs. Round spinor spectrum and its ambient-bundle comparison are separate P1 producers. |
| [ComplexKahlerGeometry K5a](../ComplexKahlerGeometry/README.md) | Generic real/complex bundle distributions, local elliptic regularity and compact Hilbert Sobolev/L² comparisons. Its compact resolvent theorem is not a weighted noncompact inverse. |
| [SpinGeometry G3–G6](../SpinGeometry/README.md) | Geometric Spin lifts, spinor bundles, Clifford-compatible connections, Dirac operator, formal adjoint and Schrödinger–Lichnerowicz formula. P4–P7 extend their analytic use to the actual complete/end/boundary domains. |
| [GeometricCurrents G1–G7](../GeometricCurrents/README.md) | Integral current minimization, compactness, barriers, codimension-one interior regularity in ambient dimensions≤7 and G7's smooth stable-limit/no-cancellation interfaces. P3 verifies their hypotheses for its AE hypersurface family and owns the induced-end estimates. |
| [Yamabe Y0–Y3.1](../Yamabe/README.md) | Conformal scalar identity, Euclidean critical Sobolev inequality, Y1.2's compact first eigenfunction and Y3.1's fixed-sign conformal metric. P3 verifies the Rayleigh bounds for those interfaces; these early targets use no positive mass. Weighted/end corrections are P1 targets. |
| [GeometricTopology Layer1](../GeometricTopology/README.md) | Smooth triangulation of compact surfaces with boundary, its boundary compatibility and the smooth/PL comparison used by P3a's boundary Gauss–Bonnet. |
| [DifferentialGeometry 2,10](../DifferentialGeometry/README.md), [AlgebraicTopology Stages 2–3,6–7](../AlgebraicTopology/README.md) | Orientation cover and its smooth/local-system comparison, integral cup/cap products, degree and Poincaré duality, finite CW Euler characteristic, and Sard for regular exhaustion boundaries. P3 constructs its complete AE metric/end comparison and orientation-free mass corollary. |

Order the common analytic identities and linear inputs before P0–P7,
then prove the mass theorems P8. For compact form inputs use the acyclic
chain VM V2.3 → UO-D06 → VM V5.1 → CKG K5a's closed-base domain
comparison → Yamabe Y1.2/Y3.1 → P3a. R5b consumes the same form
representation for its compact normal-Jacobi Dirichlet specialization;
that boundary domain is distinct from K5a's closed-base domain. In UO-D06's construction a dense
continuous injective j:V→H and a bounded Hermitian shifted-coercive form
specify Dom A={j u : ∃h, ∀v, a(u,v)=⟨h,j v⟩} and A(j u)=h.
Use that same graph, scalar structure and inner-product convention in
VM/CKG; prove the geometric H²/domain identification and compactness
hypotheses before its spectral application. Do not construct a second
form-realization engine. Yamabe Y6–Y8 uses P8 afterward. In particular
neither Yamabe existence nor positive mass is used to construct the
minimizing-current or weighted-Dirac inputs of its own proof.

## P0. Ends, decay and the mass functional

1. Construct AE structures on the native manifold/metric carriers,
   admissible coordinate changes and the order-dependent asymptotic
   estimates. Prove properness of the end radius, compact exhaustion,
   distance/radius comparison, inverse metric, volume/area density and
   normal estimates, and differentiation/product/inversion rules. A
   finite-ended AE structure means a finite collection of these specified
   ends with compact remaining region. The arbitrary-other-ends spin
   theorem uses a different hypothesis.
2. Prove existence and finiteness of the ADM limit from the scalar
   divergence expansion, the decay threshold and scalar L¹ integrability.
   Prove invariance under admissible AE charts, including the asymptotic
   rigid-motion theorem and the error terms at the given decay order.
   Establish isometry/pullback invariance, scale covariance and the local
   mass comparison under a covering isometry of a specified end.
3. Define weighted C^(k,α) and W^(k,p) asymptotic hypotheses with their
   precise chart/derivative norms and coordinate-invariance domains.
   With P1's sign of the weight, O_k(r^(−t)) implies W^(k,p)_δ
   membership for finite p only at δ>−t: the model tail integral is
   ∫ r^(−p(t+δ)−1)dr, with logarithmic divergence at equality.
   The supremum decay norm at δ=−t is a different endpoint statement.
   Construct cutoffs and weighted partitions with controlled derivatives.
   Separate the headline O_2 class from stronger order-dependent analytic
   classes: smoothness in the interior does not supply uniform weighted
   bounds on higher derivatives. Specify these additional bounds in P1
   and use P2's approximation and mass-limit transport for the headline
   theorems, retaining their C² AE hypotheses. No invariance theorem
   assumes an arbitrary coordinate change preserves the class without proof.
4. Compute Euclidean mass0, Schwarzschild mass, finite covers of ends,
   conformal leading-term changes and inversion of a normalized Green
   expansion. For `u=1+c r^(2−n)+o_2(r^(2−n))` prove the conformal
   mass change is2c, with the differentiated error bounds. Compare
   alternative scalar and mass normalizations by explicit factors.

## P1. Weighted scalar and bundle analysis on AE manifolds

### P1a. Spaces, ranges, coefficients and domains

For a complete finite-ended AE manifold with compact remaining region,
choose a smooth positive radius ρ equal to r near each end. For 1≤p<∞ set

`‖v‖_(Lp_δ)=(∫|v|^p ρ^(−δp−n)dV)^(1/p)`,

`‖v‖_(Wkp_δ)=Σ_(j=0)^k ‖∇^jv‖_(Lp_(δ−j))`.

Define the p=∞ norm by ess sup |v|ρ^(−δ), and H^k_δ=W^(k,2)_δ.
Construct all these complete native Lp/weak-section spaces, with the
specified trace and closure conventions. Prove equivalent norms for
admissible radii, charts and frames, weak differentiation and the bounded
multiplication/decay operations at the exponents where they hold. Smooth
compact-support density on a boundaryless manifold is asserted for
1≤p<∞, not for the whole W^(k,∞)_δ space. Define its compact-support
closure separately; give the appropriate local or weak endpoint
approximation statements without promoting them to norm density.
On compact-boundary domains distinguish unrestricted sections, zero-trace
and graph/trace-constrained closures. Keep the boundary trace, collar
lifting, duality, local compactness and compact-region Rellich targets
at their actual exponents and trace orders. Under the volume integral
pairing prove (Lp_δ)*≃Lp′_(−n−δ) for 1≤p<∞ (p′=∞ at p=1),
and the indicated L¹ predual pairing at p=∞ without identifying the
whole Banach dual with L¹. Prove Hölder multiplication
Lp_δ × Lq_ε → Lr_(δ+ε) when 1/r=1/p+1/q≤1, and its derivative
versions with their explicitly required Sobolev embedding orders.

The Sobolev elliptic estimates and Fredholm theorems below have
1<p<∞, integer k≥2 for scalar order two and k≥1 for Dirac order one:

`L:W^(k,p)_δ→W^(k−2,p)_(δ−2)`,
`D:W^(k,p)_δ→W^(k−1,p)_(δ−1)`.

Do not assert these estimates at p=1 or p=∞ merely because those spaces
are defined. Define the weighted Hölder realization separately for
0<α<1, with its explicit C^(k,α)→C^(k−2,α) scalar and
C^(k,α)→C^(k−1,α) Dirac domains. For each finite k, a sufficient
higher-order working hypothesis is g−δ∈C^(k,α)_(−s), s>0, with
uniform scaled-annulus bounds, uniform ellipticity and the corresponding
induced frame/connection bounds; an extra bundle connection is required
to have C^(k−1,α)_(−1−s) coefficients relative to its Euclidean model.
A scalar potential is C^(k−2,α)_(−2−s), or is handled on its explicitly
stated lower-regularity domain. Bind these derivatives and the cutoff
commutators before the order-k estimate; prove all-order consequences
only with the corresponding all-order data. Prove separately the basic
finite-p W^(2,p) scalar and W^(1,p) Dirac estimates for the headline
O_2 metric, using uniformly scaled Lipschitz principal coefficients and
bounded lower coefficients. No uniform weighted C^(2,α) or higher metric
derivatives are inferred from smoothness plus O_2. The stronger working
classes do not replace P0/P8's original metric hypotheses.

The global theorem is on a boundaryless complete finite-ended manifold,
or on a specified elliptic compact-boundary domain with its own estimate.
For scalar Dirichlet problems use
`{u∈W^(k,p)_δ : Tr u=0}` with the trace in W^(k−1/p,p)(∂M);
construct the inhomogeneous boundary lifting separately. For the doubled
Dirac/Callias problem use
`{u∈W^(k,p)_δ(S) : χ Tr u=Tr u}` with P5's actual χ and trace order,
first proving the boundary elliptic estimate. The Hilbert instance is
P5/P6's H¹_δ(S;χ). The unrestricted exterior-ball W^(k,p) domain is
not Fredholm: infinitely many scalar modes r^(2−n−j)Y_j lie in it
for 2−n<δ<0, and the analogous negative Dirac modes give the
first-order warning. Avoiding an indicial weight cannot replace a
boundary condition. Model end inverses below are localized parametrix
inputs and do not assert an unrestricted exterior-domain inverse.

### P1b. Scalar spherical harmonics and indicial inverse

Consume the full early R8 scalar harmonic decomposition on S^(n−1).
For degree j≥0 the eigenvalue is j(j+n−2), with multiplicity
`binomial(n+j−1,j)−binomial(n+j−3,j−2)`, the second term zero
for j<2. Use the complete orthogonal eigenspaces in the actual compact
L² realization, not just the existence of harmonic polynomials.
Derive the positive Euclidean polar Laplacian

`Δ⁺=−∂r²−(n−1)r⁻¹∂r+r⁻²Δ_S⁺`.

On r^δ Y_j its indicial factor is
`j(j+n−2)−δ(δ+n−2)=−(δ−j)(δ+j+n−2)`.
Thus the scalar exceptional set is `{j:j≥0}∪{2−n−j:j≥0}`.
Check j=0 and the multiplicity convention; for n≥3 the two roots for
each j are distinct. Record the repeated-root/logarithmic convention
when comparing a dimension-two radial formula, without applying that
formula as an n≥3 inverse. Derive the exact radial weighted norm after
the cylindrical variable log r, the derivative shifts and the Green
operators away from the exceptional set. Prove Hilbert mode estimates
and the finite-p kernel estimates specified in P1d. This scalar route
is separate from the monogenic spinor construction.

### P1c. Round Spin comparison, monogenic decomposition and full spectrum

Fix n≥3, m=n−1, the unit round sphere with outward radial normal ν,
and c(v)c(w)+c(w)c(v)=−2⟨v,w⟩. Through SpinGeometry G3–G6
construct the round Spin lift from TS^m⊕ℝ≃S^m×ℝ^n and compare
its associated intrinsic spinor bundle, metric and Levi-Civita spin
connection with the ambient restriction. Prove the transition and
Clifford intertwiners and their connection identity, not just equality
of ranks or positive-scalar kernel vanishing. For even n use a fixed
ambient half-spin space Σ_n^+; its restriction is the intrinsic
odd-dimensional chosen-factor spinor bundle. The opposite Σ_n^− is
retained to construct the other spectral branch. For odd n use one
ambient irreducible Clifford factor Σ_n; its restriction is the full
intrinsic even-dimensional spinor bundle, with both intrinsic chiral
parts. In both cases the intrinsic complex rank is 2^floor(m/2).
Do not substitute SpinGeometry's doubled faithful odd-dimensional module
and thereby double the multiplicities. P1 owns this concrete round
restriction/connection comparison; the generic bundle and connection
engines remain SpinGeometry's. Its G6.5 sphere kernel example alone is
not the full spectrum producer.

On ambient spinor-valued homogeneous polynomials define
X=Σ x_j c(e_j), D=Σ c(e_j)∂_j and E=Σ x_j∂_j. Prove

`X²=−r²`, `D²=−Σ_j ∂_j²=Δ⁺`, `DX+XD=−(2E+n)`.

Write P_k for degree-k polynomials and M_k=ker(D|P_k).
Construct the monogenic Fischer decomposition
`P_k=M_k⊕X P_(k−1)`, P_(−1)=0, by finite induction. For a
monogenic homogeneous v of degree ℓ, compute

`D(X^(2a)v)=−2a X^(2a−1)v`,
`D(X^(2a+1)v)=−(2ℓ+n+2a)X^(2a)v`.

The nonzero coefficients and injectivity of X prove invertibility of
D∘X on P_(k−1), surjectivity D:P_k→P_(k−1), directness and all
inverse maps. For even n use the chiral versions
`P_k^±=M_k^±⊕X P_(k−1)^∓`; D and X switch ambient chirality.
Compute dim M_k (or each dim M_k^±) by this exact sequence and
Pascal's identity, keeping the actual ambient rank.

From the hypersurface connection comparison derive, with the intrinsic
Dirac sign fixed by this equation,

`D_R=c(ν)(∂r+(m/2+D_S)/r)`.

Pin also the Fourier symbol i c(ξ), rather than changing the geometric
Clifford sign. A degree-k monogenic polynomial restricts to eigenvalue
−(k+m/2). For even n construct the positive eigenspace on the chosen
Σ_n^+ restriction by c(ν) times restricted M_k^−; for odd n use
c(ν) times restricted M_k in the chosen ambient module. Prove the
required anticommutation of c(ν) with this extrinsic realization of
D_S and the inverse branch maps. These are the degree-(k+1) X M_k
terms of Fischer decomposition on the sphere, not an extra copy of
the negative branch. Hence each eigenvalue ±(k+m/2) has multiplicity

`2^floor(m/2) * binomial(k+m−1,k)`.

Prove full eigenspace equality and completeness. Fischer decomposition
spans all restricted polynomial spinors; their density follows from the
ambient bundle comparison/orthogonal projection and Stone–Weierstrass
for coefficient functions, then continuous/smooth L² density. Use the
closed self-adjoint round Dirac realization from generic compact G6/CKG
and its graph-norm/H¹ elliptic comparison to get orthogonality, exclude
additional spectrum and identify the actual H¹ domain. Reverse Dirac
sign only by an explicit comparison exchanging the branches. Do not use
scalar harmonic completeness, Lichnerowicz, minimal eigenmaps, highest
weights or positive mass to prove this monogenic spectrum.

For a homogeneous solution r^δ ψ the polar equation gives
δ=−m/2−λ; thus the Euclidean Dirac exceptional set is
`{k:k≥0}∪{1−n−k:k≥0}`. Derive the radial/Mellin mode inverse,
weighted norm, derivative shift and branch multiplicities from these
actual carriers. A critical homogeneous mode obstructs the Fredholm
estimate by cutoffs spreading in the logarithmic radial variable;
it is not asserted to be globally Lp on an uncut whole end.

### P1d. Finite-p estimates, gluing and kernel/range

For p=2 use the complete angular decompositions and radial Green
operators. For general 1<p<∞ construct a cylinder/dyadic-annulus kernel
parametrix, with angular derivatives and off-diagonal bounds, the actual
local Calderón–Zygmund estimates and scaling, and summable radial
exponential estimates away from the exceptional weights. Prove the
finite-p derivative estimates and their agreement with the Hilbert
construction on common smooth compactly supported data by uniqueness
on the chosen model realization and density. L² spectral-projector
bounds alone do not give the Lp estimate. Treat the separate Hölder
realizations at 0<α<1 with their own Schauder estimates.

Glue to a compact-interior elliptic parametrix using P0's cutoffs and
controlled commutators. Prove compact error by local Rellich and the
asymptotically small coefficient perturbation, first at each permitted
finite order. Prove Fredholmness away from the corresponding indicial
sets, index invariance in each weight component and the changes across
modes with their actual multiplicities. Retain the boundary conditions
and estimates of P1a/P5 when a compact boundary is present. The scalar
interval used is 2−n<δ<0; δ=−(n−2)/2 for Dirac lies in 1−n<δ<0.
An interval alone does not imply invertibility: identify kernels,
adjoint/cokernel and coercivity for each operator and geometric domain.
Conformal-Laplace potentials are handled with their actual decay/sign
and kernel assumptions, not inferred to have the Laplacian's kernel.

Construct scalar Laplace and conformal-Laplace parametrices on the ends,
their compact errors and indices in the intervals actually used. Prove
maximum-principle uniqueness and solvability for the positive harmonic
and conformal corrections tending to1. Give their asymptotic expansion,
differentiated remainder and coefficient flux formula. For the scalar
Laplacian also solve the end-value problem with one independently
prescribed real constant at each finite end: subtract a smooth
end-constant seed, solve its compactly supported Laplacian in a decay
weight 2−n<δ<0, and prove the required index0 and kernel/range
statements. For nonnegative nonzero end data prove strict interior
positivity and the leading harmonic expansions on harmonically flat
ends; Kelvin removability and the positive leading coefficient used
for P3b capping are part of this scalar API. Derive the Sobolev/coercive
estimates before Lax–Milgram. On arbitrary other complete ends only
local theory is presumed; no global AE Fredholm inverse is assigned
to that remainder. Lichnerowicz is a later P4–P7 positivity/coercivity
input, not a circular input to the model Dirac spectrum or parametrix.

## P2. Scalar-curvature reductions and rigidity variations

1. For the original smooth O_2(r^(−t)) finite-ended AE metric with
   t>(n−2)/2 and absolute scalar L¹, construct harmonic-flat-at-infinity
   approximating metrics with Scal≥0 when the original Scal≥0.
   Fix (n−2)/2<q<min(t,n−2) and any fixed p>n. Require convergence
   in W^(2,p)_(−q) for the end coefficient differences and in C² on
   every compact set, with uniform ellipticity/completeness comparisons.
   Use the strict q<t loss to place the original metric in this finite-p
   class. Build the smoother order-dependent working metrics and
   conformal corrections rather than assuming higher weighted derivatives
   of the original metric. Prove separately, at every end,
   |m(E,g_j)−m(E,g)|→0 by the scalar divergence/flux identity,
   integrable scalar tails, quadratic metric errors and the computed
   conformal leading coefficient. Weaker weighted norm convergence alone
   is not a mass-continuity theorem. Prove the sign estimates and preserve
   strict negativity of a selected negative mass, then the strict scalar
   positivity needed for P3b. Preserve completeness and all relevant
   end/boundary hypotheses. For use with the C² headline theorem prove
   the actual positivity limit step by convergence of each mass; prove
   zero rigidity by P2.2/P2.3 and P6/P7 on their stated domains, not by
   claiming a sequence of positive masses gives equality rigidity.
2. Prove the zero-mass deformation lemma: if Ricci is nonzero somewhere,
   use a compactly supported metric variation and its scalar-curvature
   linearization, then the conformal correction, to produce a metric
   with nonnegative scalar curvature and negative chosen-end mass.
   Compute the first mass variation and its nonzero sign, including
   the function-space solvability and remainder control. Zero mass
   therefore implies Ricci0 after positivity has been established.
3. Prove the maximal-volume rigidity completion. An AE end gives
   `liminf_(r→∞) Vol(B_r(p))/(ω_n r^n)≥1` by the coordinate/distance
   comparison. If Ricci≥0, R4 item1's Bishop–Gromov comparison and the
   small-ball volume limit force all ratios equal1. Construct that limit
   here from R1.4 normal-coordinate density and R4.6 polar integration.
   Derive from R4.1's radial density/Jacobi equality and R4.6 cut-locus
   description, using R4.3's covering criterion, a global Euclidean
   isometry. Prove completeness/surjectivity and absence of nontrivial
   covering identifications; simple connectedness is not assumed.

## P3. Nonspin positivity and compact stable hypersurfaces

Work first on oriented finite-ended AE manifolds, 3≤n≤7. The compact
obstruction and negative-mass compactification below prove nonnegativity.
All minimizing hypersurfaces used in the compact obstruction have ambient
dimension at most7, so G6's smooth codimension-one regularity applies.

### P3a. Compact torus obstruction and boundary Gauss–Bonnet

Prove that a closed oriented d-manifold, 3≤d≤7, admitting a nonzero-degree
map to T^d has no positive-scalar-curvature metric. Use the pulled-back
integral H¹ classes and their nonzero cup-product pairing with [M].
Consume AT's cup/cap products, integral Poincaré duality and degree
comparison, with DG's smooth degree/pullback integration theorem. Minimize
an integral hypersurface representing the Poincaré dual of one class,
using G3–G7 compactness, homology-class closure and interior regularity.
Use compactness and integral constancy to prove its regular support has
finitely many compact connected embedded components, each oriented and
two-sided, with a constant positive integer multiplicity after choosing
its orientation. Each component is stable minimal: a normal variation
in a tube disjoint from the others is an admissible homologous current
competitor by G5's homotopy formula; its mass change is that positive
multiplicity times the area change. Apply G6/R5b to its second variation.
Prove at least one component retains a
nonzero product of the remaining classes, hence a nonzero-degree map to
the smaller torus. Prove this restriction/cap identity on the actual
singular/current comparison maps, rather than inferring it from dimensions.

For a compact stable two-sided minimal hypersurface Σ^k in a compact
PSC ambient manifold, consume R5b's full-scalar stability identity

`∫(2|dφ|²+Scal_Σ φ²)≥∫(Scal_M+|A|²)φ²`.

When k≥3, the coefficient `a_k=4(k−1)/(k−2)>2` gives a strictly positive
first eigenvalue for `a_k Δ⁺+Scal_Σ`. Prove the quantitative Rayleigh
lower bound `λ₁≥min Scal_M>0`. Consume Y1.2's smooth positive
first eigenfunction and Y3.1's positive-scalar conformal metric on that
connected component. Iterate this
construction down to a surface. At k=2 use φ=1 in the compact stability
inequality and Gauss–Bonnet to obtain χ(Σ)>0. Prove directly that a
closed connected oriented surface mapping with nonzero degree to T²
has two rationally independent pulled-back H¹ generators: their cup
product is nonzero, while a degree-one class squares to0 in its
torsion-free H². Thus b₁≥2 and AT Stage7's Euler–Poincaré identity
gives χ=2−b₁≤0, a contradiction without surface classification.
No noncompact test tending to1 enters this induction.

Own the boundary version used also by P3c: for compact oriented surfaces
with smooth boundary prove `∫K dA+∫_(∂Σ)k_g ds=2πχ(Σ)` with outward-first
boundary orientation and `k_g=⟨∇_T T,inward conormal⟩`, giving boundary
integral2π on the Euclidean unit disc. Include piecewise smooth corners,
exterior angles, triangulation/Euler identification and exhaustion-boundary
naturality. Derive it from R1/R5a connection/curvature, DG Stokes and AT
Stage7's finite CW Euler characteristic. A closed index formula alone is
not the boundary theorem.

### P3b. Negative mass to a compact contradiction

Starting with a negative chosen mass, apply P2's harmonic-flat-at-infinity
approximation while preserving its strict negativity, Scal≥0 and all
completeness/end hypotheses. In particular the resulting end scalar is
zero, satisfying any stronger pointwise decay used by the compactification
source. Construct a one-ended reduction explicitly. On a finite-ended
harmonically flat metric solve for a positive g-harmonic function U tending
to1 on the chosen end and0 on every other end. Prove existence by P1's
weighted end-value Dirichlet theory, 0<U≤1, and differentiated expansions.
At the chosen end `U=1+b r^(2−n)+o_2(r^(2−n))` has b≤0; show its
conformal mass is `m+2b<0`. On another end write
`g=w^(4/(n−2))δ`; prove `Uw=c r^(2−n)+O_2(r^(1−n))` with c>0.
Because Scal_g=0 on that end, Y0's conformal covariance converts
Δ_gU=0 to Δ_Eucl(Uw)=0. Its Kelvin transform extends smoothly and positively across the origin
by the harmonic removable-singularity theorem. Adding these finitely many
points to the metric `U^(4/(n−2))g` caps those ends with a smooth metric.
Construct the smooth charts, topology, orientation extension and gluing,
and prove completeness and preservation of the chosen AE end and Scal≥0.

In the remaining end write `g=h^(4/(n−2))δ`, with h positive harmonic and
`h=1+(m_cap/2)r^(2−n)+O_2(r^(1−n))`, with the capped mass
`m_cap=m+2b<0` in P0's normalization. Choose R₀ with h<1 for
r≥R₀ and let s₀ be its maximum on R₀≤r≤R₀+1. Choose s₀<s₁<1
and a smooth positive nondecreasing concave scalar function F with
F(s)=s for 0<s≤s₀ and F constant for s≥s₁. Choose R₁ with h>s₁
for r≥R₁. Apply F to h; the collar equality glues it to the unchanged
interior, and the exterior is constant. Use this negative-mass transition
and prove `Δ_Eucl F(h)=F''(h)|dh|²≤0`, strictly negative somewhere.
The conformally modified metric therefore has Scal≥0, positive somewhere,
and an exactly Euclidean exterior after constant coordinate rescaling.
Prove the smoothing, derivative estimates and collar agreement explicitly.
This is the geometric reduction of Schoen–Yau Proposition5.4; no spin
obstruction is used in this construction.

Replace a ball in a large flat T^n by the compact interior of this metric,
gluing across its exact Euclidean collar. Construct the resulting closed
oriented smooth manifold and metric, with Scal≥0 and positive somewhere.
Construct a smooth collapse map to T^n of degree1 and prove its degree
using a regular value in the unchanged torus region; identify the pulled-back
integral H¹ product. The compact conformal Laplacian has strictly positive
first eigenvalue; prove that positivity by the Rayleigh quotient and
compactness. Consume Y1.2/Y3.1 for its positive first eigenfunction and
PSC conformal metric, without Yamabe existence. This contradicts P3a. Apply P2's
zero-mass deformation and maximal-volume argument for rigidity. Finally
prove the orientation-double-cover corollary, including completeness,
lifted chosen-end masses and exclusion of extra ends in the equality case,
to remove orientation from the finite-ended theorem.

### P3c. AE minimizing hypersurfaces and the three-dimensional route

Construct the coordinate-plane Plateau boundary problems and confining
barriers in P2's negative-mass reduced end. Prove uniform local mass
bounds, fixed-core intersection/nonvanishing and boundary avoidance.
Apply G3–G7 on their precise compact domains, supports, dimension,
multiplicity and metric bounds to obtain a complete two-sided stable
minimal hypersurface. Prove the AE-family estimates needed for G7's
sheeting/no-cancellation interface; weak convergence alone is insufficient.

In the harmonically flat end prove one graph outside a compact set.
For n≥4 its height is `a+O_2(r^(3−n))`; derive its leading harmonic term
and refinements from the minimal graph equation and P1. Prove the induced
(n−1)-metric is AE of order n−2, its scalar is L¹, and its initial ADM
mass is zero, including all curvature errors through second derivatives.
These are independent geometric asymptotic targets, outside the P8.1
positivity proof route. Compactly supported stability
does not imply that a conformal factor tending to1 has negative mass.

For n=3 treat the graphical logarithmic alternative, prove the required
total-curvature and boundary/topology estimates and use logarithmic
cutoffs to extend stability to the limiting constant test. Combine P3a's
boundary Gauss–Bonnet with the strict positive core contribution of
`Scal_M+|A|²` to obtain the classical contradiction. Verify cutoff errors,
multiple ends and Euler bounds on this actual hypersurface. This second
three-dimensional proof agrees with the compactification theorem.

## P4. Spinors at infinity and the boundary mass identity

Use the specified geometric Spin structure and negative Clifford
convention `c(v)c(w)+c(w)c(v)=−2g(v,w)`. Construct asymptotically
constant orthonormal Spin frames on an AE end, the comparison of spin
connections with the Euclidean one and the differentiated error bounds.
For every constant model spinor construct an exterior section and a
global cutoff extension; identify its finite Dirac/gradient errors.

Extend the SpinGeometry Dirac and Lichnerowicz identities to compact
domains with smooth boundary and to weak H¹ sections by density.
With ν inward to the truncated domain define the signed raw term
`G_r(u)=∫_(S_r) Re⟨u,c(ν)Du+∇_νu⟩ dS_g`.
Derive the integrated identity with this sign. For the asymptotically
constant solutions used below its mass contribution is
`lim G_r(u)=−(n−1)|S^(n−1)|m_ADM|v_∞|²/2`.
The positive mass-side quantity is −G_r, obtained by moving this term
across the identity; do not silently replace ν by the outward normal
or change the negative Clifford action. Track every frame, density,
normal and differentiated remainder. For the actual weak solutions with
correction in H¹_(-(n−2)/2), prove the required annular cutoff/trace
and error limits and their agreement with the mass identity; mere
weighted H¹ membership does not supply an arbitrary all-radius boundary
trace limit. Use a justified exhaustion/cutoff limit when that is the
weak formulation. P0's ADM radius limit remains the full radius limit.
An arbitrary pointwise decay assertion is not substituted for these
weak-space estimates.

## P5. Doubled Callias operators and compact-boundary problems

On S=Σ⊕Σ use the direct-sum connection and
`c(ξ)(u₁,u₂)=(c_Σ(ξ)u₂,c_Σ(ξ)u₁)`,
`σ=[[0,−i],[i,0]]`, `𝓓=[[0,D],[D,0]]`, `B_ψ=𝓓+ψσ`.
Prove the Clifford, adjoint, parallelism and anticommutation identities,
and
`B_ψ²=∇*∇+Scal/4+c(dψ)σ+ψ²`.

For a compact boundary and inward unit normal ν construct
`χ=c(ν)σ` and the +1 trace condition χu=u. Prove χ is a self-adjoint
involution and the boundary symbol gives an elliptic self-adjoint local
condition. Construct the H¹ trace subspace, smooth boundary-condition
density, collar extension and the boundary trace inequality. Prove the
H¹ Gårding estimate for this domain from the integrated Lichnerowicz
identity and the trace inequality, with explicit local coefficient bounds.
Establish H¹ regularity of L² weak adjoint solutions satisfying the
adjoint trace condition by boundary flattening, Clifford-compatible
trivializations and tangential Friedrichs mollification with commutator
bounds, normal derivative recovery from the Dirac equation and the
Gårding estimate. Use tangential difference quotients for higher
regularity after H¹ is established. Identify the
adjoint trace condition via Green's form, prove equality of adjoint and
closed domains and self-adjointness of the closure. These compact-boundary
bundle targets are constructed here; closed-manifold compact resolvent
or scalar Dirichlet theory does not supply them. Compare the averaged scalar mean curvature with R5b's
`A(X,Y)=⟨B(X,Y),ν⟩`: derive its exact sign in the Green identity,
including flat half-space and sphere checks, before translating any
source's H convention.

Derive the integrated estimates with interior potential
`θ=Scal/4+ψ²−|dψ|` and its twistor refinement
`θ̄=n Scal/[4(n−1)]+ψ²−|dψ|`. Express the boundary term first in
the derived A convention and prove its comparison with
`η=(n−1)H/2+ψ`, `η̄=nH/2+ψ` under the identified source H.
Construct the twistor operator and prove its pointwise norm decomposition.
The boundary inequality used in each solver carries the actual sign and
normal, rather than an unspecified assertion of mean convexity.

## P6. Weighted solvability and finite-ended spin positivity

For q=(n−2)/2 prove the weighted Poincaré estimate on a compact-interior
AE manifold and its local-boundary version. Establish Fredholmness and
nonnegative index for `B_ψ:H¹_(-q)(S;χ)→L²(S)` under its stated
compact-potential/end hypotheses. Identify its adjoint/cokernel and
prove the coercive estimate and surjectivity when θ,η are nonnegative
with the required strictness or weighted Poincaré control. Include the
small-negative-part estimate with explicit norms and compact support.
Do not infer surjectivity from injectivity alone.

Construct the corrected harmonic/asymptotically constant spinors for a
specified model spinor on one end and zero model data on the other AE
ends. Apply the boundary mass identity with ψ=0 in the boundaryless
nonnegative-scalar case. Obtain positivity on each end. For zero mass
prove the corrected spinors parallel, their evaluations span the spinor
fibres, and Clifford curvature identities force flatness. Use P2's
AE-volume rigidity completion for the global Euclidean isometry.

## P7. One AE end and arbitrary other complete ends

Let M be complete, connected, spin and boundaryless with Scal≥0 and
one specified AE end satisfying P0; impose no AE or finite-end condition
on its complement. Carry out the localized doubled-Callias proof.

Choose a fixed AE exterior X₀ with a compact collar K, cutoff f and
asymptotically constant ξ₀. Construct compact-boundary AE truncations
X_λ of the remaining geometry. Define the admissible λ-class by complete
spin codimension-zero X_λ⊃X₀ with Scal≥0, compact smooth boundary,
relatively compact X_λ\X₀ and
`dist(∂X₀,∂X_λ)>1/λ` (empty boundary has infinite distance). Set λ₀
to its infimum. Construct these regions from completeness and smooth
proper exhaustions: use R7.8's controlled Lipschitz approximation and
DG10 Sard for the distance and regular boundary selections, proving
λ₀=0 for the present complete M.

On X_λ\X₀ construct a locally Lipschitz potential h_λ≥λ, equal λ near
∂X₀, with `h_λ²−|dh_λ|≥0` almost everywhere and
`h_λ+(n−1)H_λ/2≥0` on ∂X_λ for the identified inward-normal H.
Set ψ_λ=λf on X₀ and h_λ elsewhere. Extend P5's identities to these
potentials by Lipschitz approximation, convergence of weak derivatives
and quadratic forms; prove the square identity almost everywhere.
Obtain boundary η≥0, θ≥0 outside K and `θ≥−λ|df|` on K.
State uniform estimates only on the fixed regions where they
are proved. Each X_λ has the finite-ended compact-interior geometry
required by P6; M itself is not assigned an unsupported AE Fredholm
inverse on its arbitrary remainder.

Solve `B_(ψ_λ)ξ_λ=−𝓓ξ₀` with the chiral boundary condition and obtain
the mass/energy estimate with error Cλ. Let λ decrease to0 to prove
chosen-end nonnegativity. At zero mass construct the limiting spinors
on fixed compact subsets using the energy, weighted Poincaré and local
regularity estimates. Prove compatibility on the exhaustion, global
parallelism, the full parallel-spinor family and flatness. Complete the
global rigidity by P2's AE-volume argument. This excludes any additional
ends in the equality case without first assuming simple connectedness.

## P8. Theorems and conformal applications

State and prove on the native geometric carriers:

1. A complete finite-ended AE n-manifold with Scal≥0 and integrable
   scalar has nonnegative mass at every end if 3≤n≤7; zero at one end
   implies a global isometry to Euclidean space.
2. A complete finite-ended AE spin n-manifold satisfies the same result
   for every n≥3.
3. A complete boundaryless spin n-manifold with arbitrary other ends
   satisfies the same chosen-end positivity and zero-rigidity theorem
   for every n≥3 when its specified AE end has P0's hypotheses.

Prove stability under the admissible isometries/covers and the exact
Green-blow-up corollary: assume a complete scalar-flat metric satisfying
the applicable AE hypotheses and a verified identity m_ADM=2A. Then
A≥0 and A=0 gives
Euclidean rigidity whenever the applicable dimension or Spin hypotheses
are verified. P0.4 owns the abstract conformal leading-term mass calculation;
Yamabe Y4/Y6 owns its verification for the actual Green metric, including
its normal-coordinate curvature terms. Yamabe owns the conformal developing map, lifted-pole
completeness and compactification of this conclusion. Spacetime ADM
momentum, the dominant energy condition and Jang's equation require
different geometric targets and are not inferred from these Riemannian
statements.

## Sources

Schoen–Yau's positive-mass and scalar-curvature minimal-hypersurface papers
provide the nonspin route through ambient dimension7. The compactification
uses Schoen–Yau, [*Positive Scalar Curvature and Minimal Hypersurface
Singularities*](https://arxiv.org/abs/1704.05490), Proposition5.4 and
Theorems5.1–5.3; P3a builds only the smooth stable-hypersurface obstruction
in dimensions≤7. Lohkamp, [*Scalar curvature and hammocks*](https://www.uni-muenster.de/imperia/md/content/theoretische_mathematik/geoana/art16/scalcurvhammocks.pdf),
Proposition6.1, supplies the geometric Euclidean-exterior deformation; its
spin-dependent compact contradiction is replaced by P3a. Witten's spinor
argument and Cecchini–Zeidler, *The positive mass theorem and distance
estimates in the spin setting*, provide the spin and arbitrary-other-ends
routes. The mathematical statements above fix full scalar curvature,
ordinary ADM mass, derivative-weight order and boundary Clifford signs;
comparisons with other printed conventions prove the corresponding
conversion rather than changing those definitions. In particular compare
the inward raw Green term in Cecchini–Zeidler, Proposition2.5, with
P4's −G_r mass side, and the factor2 between P0's ordinary mass and
the normalization used in the cited Schoen–Yau compactification.
The full R8 scalar harmonic and P1 monogenic spinor constructions are
independent radial-model inputs; positive-scalar kernel vanishing alone
is not a spectral-completeness reference. Weighted-space arguments must
prove the finite-p and separate Hölder estimates and their precise
coefficient/boundary hypotheses stated in P1.
Bartnik, *The mass of an asymptotically flat manifold* (Comm. Pure Appl.
Math. 39, 1986), §1 is the source of P1a's weight convention and of the
weighted elliptic estimates and Fredholm theorems for 1<p<∞ (Theorem1.7),
with its coefficient hypotheses stated before that theorem; §§2–4 give the
Laplacian isomorphism on 2−n<δ<0, harmonic coordinates and the chart
invariance of the mass used in P0.2 and P1d.
