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
| [PDE Lanes A,C–E](../PDE/README.md), [VariationalMethods V1–V5](../VariationalMethods/README.md) | Euclidean weak spaces, local and boundary estimates, scalar elliptic/Dirichlet theory and abstract form methods. Weighted/noncompact/end and Spin-boundary adaptations are constructed here. |
| [ComplexKahlerGeometry K5a](../ComplexKahlerGeometry/README.md) | Generic real/complex bundle distributions, local elliptic regularity and compact Hilbert Sobolev/L² comparisons. Its compact resolvent theorem is not a weighted noncompact inverse. |
| [SpinGeometry G3–G6](../SpinGeometry/README.md) | Geometric Spin lifts, spinor bundles, Clifford-compatible connections, Dirac operator, formal adjoint and Schrödinger–Lichnerowicz formula. P4–P7 extend their analytic use to the actual complete/end/boundary domains. |
| [GeometricCurrents G1–G7](../GeometricCurrents/README.md) | Integral current minimization, compactness, barriers, codimension-one interior regularity in ambient dimensions≤7 and G7's smooth stable-limit/no-cancellation interfaces. P3 verifies their hypotheses for its AE hypersurface family and owns the induced-end estimates. |
| [Yamabe Y0–Y3.1](../Yamabe/README.md) | Conformal scalar identity, Euclidean critical Sobolev inequality, Y1.2's compact first eigenfunction and Y3.1's fixed-sign conformal metric. P3 verifies the Rayleigh bounds for those interfaces; these early targets use no positive mass. Weighted/end corrections are P1 targets. |
| [GeometricTopology Layer1](../GeometricTopology/README.md) | Smooth triangulation of compact surfaces with boundary, its boundary compatibility and the smooth/PL comparison used by P3a's boundary Gauss–Bonnet. |
| [DifferentialGeometry 2,10](../DifferentialGeometry/README.md), [AlgebraicTopology Stages 2–3,6–7](../AlgebraicTopology/README.md) | Orientation cover and its smooth/local-system comparison, integral cup/cap products, degree and Poincaré duality, finite CW Euler characteristic, and Sard for regular exhaustion boundaries. P3 constructs its complete AE metric/end comparison and orientation-free mass corollary. |

Order the common analytic identities and linear inputs before P0–P7,
then prove the mass theorems P8. Yamabe Y6–Y8 uses P8 afterward. In
particular neither Yamabe existence nor positive mass is used to construct
the minimizing-current or weighted-Dirac inputs of its own proof.

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
   precise chart/derivative norms, prove the comparison with the stated
   C² class, and specify the versions of coordinate invariance each
   admits. Construct cutoffs and weighted partitions with controlled
   derivatives. No invariance theorem assumes an arbitrary coordinate
   change preserves the asymptotic class without proof.
4. Compute Euclidean mass0, Schwarzschild mass, finite covers of ends,
   conformal leading-term changes and inversion of a normalized Green
   expansion. For `u=1+c r^(2−n)+o_2(r^(2−n))` prove the conformal
   mass change is2c, with the differentiated error bounds. Compare
   alternative scalar and mass normalizations by explicit factors.

## P1. Weighted scalar and bundle analysis on AE manifolds

For a complete finite-ended AE manifold with compact remaining region,
choose a smooth positive radius ρ equal to r near each end. Set

`‖v‖_(Lp_δ)=(∫|v|^p ρ^(−δp−n)dV)^(1/p)`,

`‖v‖_(Wkp_δ)=Σ_(j=0)^k ‖∇^jv‖_(Lp_(δ−j))`;

the p=∞ norm is ess sup |v|ρ^(−δ), and H^k_δ=W^(k,2)_δ.
Construct these spaces as complete native Lp/weak-section spaces with
the trace and closure conventions specified, including compact boundary
when present. Prove independence of admissible radii/frames, density,
weak derivatives, weighted multiplication, duality, local compactness,
Rellich on compact regions and weighted elliptic estimates at infinity.
For the Euclidean model Laplacian the exceptional weights are
`{k:k∈ℕ}∪{2−n−k:k∈ℕ}`; for the Euclidean Dirac operator they are
`{k:k∈ℕ}∪{1−n−k:k∈ℕ}`. Derive these from the spherical harmonic and
spinor indicial decompositions, including multiplicities and weighted
mapping conventions `L:W^(k,p)_δ→W^(k−2,p)_(δ−2)` and
`D:W^(k,p)_δ→W^(k−1,p)_(δ−1)`. Construct the AE Fredholm theory away
from the corresponding exceptional weights. The scalar interval used is
`2−n<δ<0`; the Dirac weight `δ=−(n−2)/2` lies in `1−n<δ<0`.
Global invertibility still requires the kernel/coercivity hypotheses;
membership in a model weight interval alone does not imply it.

Construct scalar Laplace and conformal-Laplace parametrices on the ends,
their compact error operators and Fredholm indices in the weight
intervals actually used. Prove maximum-principle uniqueness and
solvability for the positive harmonic/conformal corrections tending to1.
Give the asymptotic expansion, differentiated remainder and coefficient
flux formula for those solutions. For the scalar Laplacian also solve the
end-value problem with one independently prescribed real constant at each
of the finitely many ends: subtract a smooth end-constant seed, solve its
compactly supported Laplacian in a decay weight 2−n<δ<0, and prove the
required Fredholm index0, kernel/range and maximum-principle statements.
For nonnegative nonzero end data prove strict interior positivity and
the leading harmonic expansions on harmonically flat ends; the Kelvin
removable-singularity and positive leading-coefficient assertions used
for P3b end capping are part of this scalar API. Derive the required Sobolev/coercive
estimates before using Lax–Milgram. On arbitrary other complete ends only
local Sobolev/elliptic theory is presumed; these global AE Fredholm
statements are not applied there.

## P2. Scalar-curvature reductions and rigidity variations

1. Construct harmonic-flat-at-infinity approximation of finite-ended AE
   metrics, preserving nonnegative scalar curvature and approximating
   each mass, with the exact weighted convergence. Solve the conformal
   corrections and prove their sign and mass estimates. For a negative
   chosen-end mass construct a reduced metric with that negative mass,
   nonnegative scalar curvature and the strict scalar positivity needed
   in the hypersurface argument. Prove preservation of completeness
   and all end/boundary hypotheses under the perturbations.
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
Derive the Green boundary term from the fixed inward normal and the
negative Clifford action. On coordinate spheres prove its limit equals
`(n−1)|S^(n−1)|m_ADM|v_∞|²/2` with this mass normalization.
Track every frame, density, normal and differentiated remainder term.
Prove that corrections in H¹_(-(n−2)/2) have exactly the vanishing
error/flux behavior used in the identity; an arbitrary pointwise decay
claim is not substituted for that weak-space statement.

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
conversion rather than changing those definitions.
