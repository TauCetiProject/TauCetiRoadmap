# Roadmap: complex Morse theory, affine topology and weak Lefschetz

**Summary.** Develop the topology controlled by the Levi form: real Morse index bounds,
closed holomorphic embeddings, proper pseudoconvex exhaustions, affine CW
dimension and projective hyperplane sections. Include integral homology and
relative homotopy, as well as the compact-pair topology needed when the
projective variety has singularities contained in the hyperplane.

## Scope and ownership

This roadmap owns the polynomial-family projective carrier (A0), complex Levi
index bounds (A1), closed-embedding and pseudoconvex CW bounds (A2–A3), generic
locally finite duality (A4.0), finite semialgebraic triangulation and compact-pair
comparison (A4.1), and weak Lefschetz with its Veronese transport (A5–A6).
The layers below retain these A-labels as section identifiers.

ComplexKahlerGeometry K1, K3 and K7 own complex submanifolds, analytic germs,
projective charts and orientation; MorseTheory M1–M4 own Morse approximation,
attachments and CW exhaustion. GeometricTopology Layer 1 owns collars and
normal bundles, Layer 11 owns simplicial subdivisions, and its
“Smoothing-and-triangulation comparison”, step 1, owns smooth triangulation.
The Euclidean chart distance/normal-endpoint calculation and the exhaustion-adapted
refinement needed here are the precise additional contracts in Layers 2 and 4.
RiemannianGeometry R5a/R6 own intrinsic second fundamental forms and focal geometry;
the chart calculation here is independent of that intrinsic comparison.
AlgebraicTopology Stages 2–6 and 8 own ordinary relative topology, compact
manifold duality and tower algebra; CharacteristicClasses C1.2a S0–S5 own
supported cochains. Their definitions are used without replacement.
RealAlgebraicGeometry Layers 3–6 own polynomial semialgebraic sets, CAD and
projection closure. Its completed roadmap is the supplier, not a second CAD
construction here. Mathlib owns projectivization, geometric simplicial complexes,
CW complexes and homotopy equivalences; Tau Ceti owns the Morse index and
semialgebraic predicate used in the acceptance signatures.

Layer 5 owns the continuous band-closure, endpoint/restriction and collapsed-band
transfer used by its semialgebraic lift. RealAnalyticGeometry R2/R2.1 consumes
these elementary maps and the completed lift for its analytic-simplex comparison;
its analytic normal decomposition, property (A) and relative interior-point coning
are outside this roadmap. No input to this lift comes from that consumer.
FourManifolds owns its quartic and intersection-of-quadrics examples and the
proper-family applications.

## Conventions

All manifolds are finite-dimensional, Hausdorff and second-countable. The
complex/affine stages use boundaryless models, complex dimension n and real
dimension 2n; A4.0's generic real-manifold duality also allows the specified
collared boundary and arbitrary real dimension m.
df=0 means real criticality. The real Hessian is d²f without a factor 1/2;
the normalized real Morse chart therefore has diagonal Hessian entries ±2.
For real-valued f define the Levi matrix in holomorphic coordinates by
`L_(j,bar k)=∂²f/(∂z_j∂bar z_k)`. Its diagonal value on the complex tangent
represented by a real v, with ξ_j=dz_j(v), is one quarter of the coordinate
real-second-derivative sum `D²f(v,v)+D²f(Jv,Jv)` at every point.
At a critical point this equals the intrinsic Hessian sum. Define strict
plurisubharmonicity by positive definiteness of this Hermitian Levi form.
Only at a critical point is the ordinary real Hessian coordinate independent;
the Levi form is intrinsic at every point.

Properness and a lower bound accompany every CW-exhaustion theorem. An
arbitrary holomorphic embedding into ℂᴺ does not give a proper distance
function. Affine algebraic sets below are presented by finitely many complex
polynomials; projective sets are presented by homogeneous polynomials in
the actual projective carrier. Work with their classical complex-point
topology and prove the polynomial/chart/analytic comparisons; no unconstructed
scheme analytification is assumed.

Define a smooth point of dimension n to mean X agrees locally in projective
charts with an embedded complex n-dimensional submanifold; the nonsmooth
locus is its complement. Dimension and pure dimension use reduced analytic
germs: every local irreducible component has complex dimension n. A4 builds
the needed dimension comparisons. Jacobian-rank criteria on a presentation
are sufficient tests, not the definition of singularity of the reduced set
(the equations x and x² have the same zero set).

The universe of the manifold/CW acceptance theorem is Type; the vector-space
bounds and finite marked-index type are universe-polymorphic. Integer degrees
are used in duality, and all local systems are modules over a fixed commutative
ring R, with orientation twist L⊗_ℤ or_M and R acting on L. Zero coefficients
are allowed. Semialgebraic dimension takes values in the integers with −∞
adjoined, with dim ∅=−∞; complex pure dimension n excludes zero-dimensional
components when n>0.

**Checks.**

- For f=x²+y², Hessian diag(2,2) gives Levi value (2+2)/4=1;
  f=x²−y² gives diag(2,−2) and Levi 0. A factor 1/2 would give 2 instead of 1.
- The equations x=0 and x²=0 define the same reduced point, of dimension 0,
  but their Jacobian values at 0 are 1 and 0; full rank is only a sufficient test.
- For U=ℝ and j=2, H₂^BM(U)=0=H⁻¹(U), while H⁰(U)=ℤ;
  integer subtraction excludes the truncated-degree convention.

## Exact supplier contracts

- **From Mathlib:** `Projectivization`, `Projectivization.equivSubmodule`
  (`Mathlib/LinearAlgebra/Projectivization/Basic.lean`),
  `MvPolynomial.homogeneousSubmodule` and
  `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv`
  (`Mathlib/RingTheory/MvPolynomial/Homogeneous.lean` and `EulerIdentity.lean`);
  `fderiv`, real restriction of complex scalars, `Module.finrank` and
  `Module.End.eigenspace`; `Manifold.IsImmersion`
  (`Mathlib/Geometry/Manifold/Immersion.lean`),
  `Topology.IsClosedEmbedding`, `Topology.CWComplex`
  (`Mathlib/Topology/CWComplex/Classical/Basic.lean`) and
  `ContinuousMap.HomotopyEquiv` (`Mathlib/Topology/Homotopy/Equiv.lean`).
  Immersion includes local complex smooth charts, not global injectivity or
  closedness; those are separate hypotheses. Use
  `Geometry.SimplicialComplex` and its `space` and `faces`
  (`Mathlib/Analysis/Convex/SimplicialComplex/Basic.lean`), with finite faces
  explicit, and `intrinsicInterior` for open simplices.
- **From Tau Ceti:** `TauCeti.hessianQuadraticForm` and `TauCeti.morseIndex`
  (`TauCeti/Analysis/Calculus/Morse/Index.lean`); the former uses the total
  second Fréchet derivative and the latter its negative inertia, with no implicit
  criticality or smoothness hypothesis.
  `TauCeti.addHaar_image_eq_zero_of_not_surjective_fderivWithin`
  (`TauCeti/Analysis/Calculus/Sard/EqualDimension.lean`) gives Haar-null critical
  images on subsets of equal-dimensional finite real normed spaces with Borel
  measurable structures; the normal-chart adapter in Layer 2 supplies these
  hypotheses for the C¹ endpoint map. `TauCeti.IsSemialgebraic`
  (`TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean`) is the algebra of
  sets generated by polynomial equalities and strict inequalities; compactness
  and finite coordinate dimension are separate hypotheses.
- **From TauCetiRoadmap.ComplexKahlerGeometry:** [K1, K3, K7.1](../ComplexKahlerGeometry/README.md)
  give scalar restriction, holomorphic submanifolds, reduced analytic germs and
  projective charts on the native quotient, with complex orientation and O(d).
- **From TauCetiRoadmap.MorseTheory:** [M1–M4](../MorseTheory/README.md)
  give Hessian/index comparison, compact-band attachment, bounded-below proper
  CW exhaustion, relative fine Morse approximation and the integral CW/UCT
  consequences. Properness is additional to the Morse predicate.
- **From TauCetiRoadmap.GeometricTopology:** [Layer 1, Layer 11, and
  Smoothing-and-triangulation comparison step 1](../GeometricTopology/README.md)
  give collars, tubular normal bundles, gluing/rounding of corner faces,
  simplicial complexes, subdivision, links and smooth-to-PL triangulation.
  Layer 4 below proves the stronger exhaustion-adapted refinement it uses.
- **From TauCetiRoadmap.RiemannianGeometry:** [R5a and R6](../RiemannianGeometry/README.md)
  give the intrinsic second fundamental form, the shape convention and the
  focal interpretation. Layer 2 proves its Euclidean chart inputs directly;
  the focal interpretation is not a premise of the distance-Morse proof.
- **From TauCetiRoadmap.AlgebraicTopology:** [Stages 2–4, 6.0–6.4, 8](../AlgebraicTopology/README.md)
  give relative chains, subdivision/excision, CW pairs, UCT, lim¹ and Milnor
  sequences with cofinal-shift naturality, orientation local systems, compact
  triad duality with arbitrary module-valued local coefficients and nested-cut
  naturality, and `BasedTopPair` with its relative homotopy sequence.
- **From TauCetiRoadmap.DifferentialGeometry:** [§10.2](../DifferentialGeometry/README.md)
  gives smooth Sard for the generic hyperplane family and chartwise null-set
  transport for the normal endpoint calculation in Layer 2.
- **From TauCetiRoadmap.CharacteristicClasses:** [C1.2a S0–S5](../CharacteristicClasses/README.md)
  gives the single supported-cochain complex, filtered compact-relative colimit
  and the supported sequence for a supplied collared boundary.
- **From TauCetiRoadmap.RealAlgebraicGeometry:** [Layers 3–6](../../Completed/RealAlgebraicGeometry/README.md)
  give polynomial sign sets, continuous roots under fixed-degree/gcd hypotheses,
  cylindrical algebraic decomposition and projection closure. Frontier preparation,
  dimension comparison and triangulation are Layer 5 targets.

## How to read the build

Layers 0–3 develop projective families, Levi index bounds and affine CW models.
Layer 4 is an independent real-topological branch: it needs none of Layers 0–3.
Layer 5 constructs the semialgebraic lift and combines compact pairs with Layer 4;
Layer 6 combines that comparison with the affine bounds to prove weak Lefschetz,
and Layer 7 transports it through Veronese embeddings. Each subsection lists the
inputs for its statement and its displayed proof route; another proof may use
fewer inputs. Suggested.lean states the index, closed-embedding and pseudoconvex CW bounds, and finite
marked-family triangulation headlines, and identifies the missing carriers for
the other headlines.

## Layer 0: Polynomial-family projective carriers (A0)

### 0.1 Projective zero loci

Own the projective zero locus for a finite family
p:ι→MvPolynomial(Fin N) ℂ with specified homogeneous degrees d:ι→ℕ.
Its carrier is the subtype of the native
`Projectivization ℂ (Fin N → ℂ)` whose corresponding line under
`Projectivization.equivSubmodule` has every p_i zero on every vector.
Give the induced topology from K7.1's same native projective space.
For N>0 identify Fin N with Fin((N−1)+1) by the canonical arithmetic
Fin equivalence and transport K7.1's existing complex atlas through that
coordinate linear equivalence; N=0 is the empty projectivization branch.
Pin every incidence/Jacobian/normal map to this same transported subtype.
Prove the representative criterion: for v≠0, its projective point
lies in that subtype exactly when every p_i(v)=0. Include homogeneous
scalar evaluation, degree0 constant/zero equations, N=0 and empty families.
Build closedness in the compact Hausdorff projective carrier, coordinate-chart
polynomial equations, reindexing and adding/removing redundant equations,
finite-family intersections and their inclusion maps, and functoriality under
injective complex-linear coordinate changes. Prove invariance under replacing
a homogeneous equation by a positive power, at the level of the reduced
zero set rather than its Jacobian presentation.

The projective zero-locus API includes:

- The homogeneous representative criterion is invariant under every nonzero rescaling.
- Finite intersections and redundant equations give the same reduced subset with its inclusion.
- Injective linear changes transport the zero locus and its chart equations continuously.

**Checks.**

- N=0 gives no lines and hence the empty locus; N=1 with no equations gives one point.
- On ℂP¹, the constant equations 0 and 1 give the whole space and the empty set.
- For X₀=0 and X₀²=0 the locus is {[0:1]}, while at (0,1) the
  Jacobian rows are (1,0) and (0,0); reduced-locus invariance does not assert rank invariance.
- Without homogeneity, X₀−1 vanishes at (1,0) but not at (2,0), so a line test fails.

*Needs:* Mathlib projectivization and homogeneous polynomial evaluation;
ComplexKahlerGeometry K7.1 quotient topology and charts. Closedness uses
continuity in those charts and compactness of projective space.

### 0.2 Coefficient parameters

For fixed finite ι and degrees d_i, define the coefficient vector space
P_d=∏_(i:ι) MvPolynomial.homogeneousSubmodule (Fin N) ℂ (d_i), including
zero equations. Give each graded piece the finite-dimensional topology from
its monomial-coefficient equivalence with ℂ^(S_i), where
S_i={α:Fin N→ℕ | Σ_j α_j=d_i}; give P_d the product topology. Prove these
coordinate equivalences and evaluation/derivative continuity and holomorphicity.
Use the coefficient vector space itself as the parameter carrier.

The coefficient-space API includes:

- Monomial coefficients identify each degree-d piece with the finite coordinate space indexed by total degree d.
- Evaluation and every partial derivative depend polynomially, hence holomorphically, on the coefficients and point.
- Reindexing the finite equation family gives the corresponding product linear equivalence.

**Checks.**

- In two variables and degree 2 the basis is X₀²,X₀X₁,X₁², of dimension 3, not 4.
- In zero variables the degree-0 piece is ℂ and each positive-degree piece is zero.
- For p=aX₀²+bX₀X₁+cX₁² at (1,2), evaluation is a+2b+4c and
  the first partial is 2a+2b, including the zero coefficient vector.

*Needs:* Mathlib homogeneous submodules and finite monomial bases;
finite-dimensional normed-space calculus.

### 0.3 Incidence and its projections

Define
the incidence space for d as the closed subtype
{(c,L):P_d×Projectivization ℂ (Fin N→ℂ) | ∀i,∀v∈line(L), (c_i)(v)=0},
with the two actual projections and its fiber identification with
the projective zero locus of c. The projection to P_d is proper
because the projective factor is compact; retain the exact projection/pullback
maps and the degenerate N=0, empty-family and degree0 branches.

The incidence API includes:

- Projection to the coefficient vector has the specified projective zero locus as its fibre.
- The incidence is closed; projection to coefficients is proper, including empty fibres.
- Parameter pullbacks preserve these fibre identifications and both projections.

**Checks.**

- A single degree-0 parameter c on ℂP¹ has fibre ℂP¹ for c=0 and ∅ for c≠0.
- With no equations the incidence is P_d×ℂP^(N−1); projection forgets only the projective point.
- N=0 gives empty incidence for every parameter, so the proper projection is not necessarily surjective.

*Needs:* Layer 0.1 zero loci; Layer 0.2 parameters; compact projective topology
from ComplexKahlerGeometry K7.1.

### 0.4 Cone Jacobian and the full-rank family

Display the cone Jacobian for v≠0:
J_p(v)_(i,j)=MvPolynomial.eval v (MvPolynomial.pderiv j (p_i)),
as a complex linear map ℂ^N→ℂ^ι. Consume native
`MvPolynomial.IsHomogeneous.sum_X_mul_pderiv` for
Σ_j v_j J_p(v)_(i,j)=d_i p_i(v). On the zero locus its radial line lies
in the kernel. Define the induced projective differential in the finite
ratio charts, with output in ⊕_i O(d_i); prove its agreement with the
cone matrix, representative rescaling and coordinate-change formulas.
Full rank means surjectivity of J_p(v), equivalently row rank |ι|, and
is independent of the chosen nonzero representative. It forces |ι|≤N−1
at a zero-locus point. On this locus construct K7's induced complex
submanifold of dimension N−1−|ι| and its exact tangent/normal sequence.
In the joint incidence prove the bad-rank locus is closed, so its proper
projection has closed image; the parameter locus where every fiber point
has full rank is open. Its incidence restriction is a proper holomorphic
submersion, with the actual fiber maps, parameter paths and pullback
comparisons used by Four's proper-family argument.
Smoothness of a reduced locus
is still the earlier intrinsic chart definition. FourManifolds owns the
Fermat quartic and Vandermonde-quadric examples on this single carrier.

The projective differential API includes:

- The radial direction lies in the cone kernel by Euler's homogeneous identity.
- Rescaling row i by a nonzero scalar to degree d_i−1 preserves rank; chart changes give the O(d_i)-valued differential.
- Full rank gives the tangent kernel, normal quotient and open proper submersion family specified above.

**Checks.**

- For p=X₀²+X₁² at v=(1,i), J=(2,2i) and Jv=2+2i²=0; at 2v the row doubles.
- For X₀=0 on ℂP¹ the row rank is 1 and dimension is 1−1=0; X₀² at that point has rank 0.
- For aX₀+bX₁ the bad parameter set is {(0,0)}; every other fibre is one reduced point.

*Needs:* Layers 0.1–0.3; Mathlib Euler identity; ComplexKahlerGeometry K1 and
K7 holomorphic submanifold and line-bundle charts.

### Examples

The linear point and the repeated-equation point above have the same topology
and different Jacobian ranks; the constant family tests empty fibres.

### Dependencies

Mathlib projectivization and polynomials; ComplexKahlerGeometry K1/K3/K7.
No affine CW theorem is used by this layer.

## Layer 1: Levi calculus and real index bounds (A1)

### 1.1 Levi forms and negative inertia

On a complex normed vector space define `realHessian` by the second real
Fréchet derivative and `leviDiagonal` by its J-paired sum divided by four.
These definitions need no finite-dimensional instance. The three acceptance
bounds explicitly assume finite dimension: `finrank_negative_subspace_le_complex`
holds for every continuous real bilinear B with positive Levi diagonal and every
negative real subspace W, without requiring B symmetric;
`morseIndex_le_complex_finrank` specializes this to the total Hessian of any
function at any point. `morseIndex_le_complex_finrank_add` assumes 0≤q≤n and
a complex subspace P of dimension at least n−q on which that diagonal is
strictly positive, and concludes index≤n+q. Smoothness and criticality enter
only when interpreting this as the intrinsic geometric Hessian.

Construct the Hermitian Levi form and its coordinate-change, pullback, sum,
product and increasing-convex composition laws. Prove the local
Wirtinger/real-second-derivative comparison, and its critical-point intrinsic
Hessian version. Give continuity of the Levi eigenvalue bounds under C²
perturbations on compact coordinate sets, and openness in the smooth fine
topology with varying positive tolerances. Establish the maximum principle
on compact complex submanifolds for strictly plurisubharmonic restrictions.

For a symmetric real Hessian B on a complex n-dimensional tangent space,
prove positivity of `B(v,v)+B(Jv,Jv)` for v≠0 forces every negative-definite
real subspace W to have W∩JW=0 and dimℝW≤n. Compare maximal negative
subspaces with Tau Ceti's actual quadratic-form negative inertia and
the intrinsic manifold Morse index.

The Levi-form API includes:

- Holomorphic coordinate change pulls the Hermitian form back by the complex derivative.
- Sums, products and increasing-convex compositions obey the second-derivative chain rules, including product cross terms.
- Strict positivity is open in fine C² tolerances; at critical points the intrinsic Hessian has the same diagonal sum.

**Checks.**

- Hessians diag(2,2), diag(2,−2), diag(6,−2) have Levi values 1,0,1 and
  negative indices 0,1,1. The real y-axis in the third case realizes equality dimℝW=1=n.
- For f(w)=|w|² and w=z² at z=1, the pullback Levi value is 4=|2|²;
  for |z|⁴ it is also 4, detecting the missing product cross terms.
- For f=Re z and z=w+w² at 0, coordinate Hessians are 0 and diag(2,−2);
  their Levi values are both 0, but intrinsic real Hessian invariance would fail without criticality.
- For f_ε=(1−ε)|z|², ε=1/2 gives Levi 1/2 and ε=1 gives 0;
  nonnegative Levi is not the strict-positive hypothesis. On the zero space both indices are 0.

*Needs:* Mathlib real/complex derivatives and subspace dimension; Tau Ceti
Hessian quadratic forms and negative inertia; ComplexKahlerGeometry K1/K3
chart comparison; MorseTheory M1/M3 for intrinsic indices and fine topology.
The strict-index argument is the J-intersection dimension argument, with the
complex quadratic model in Milnor, proof of Theorem 7.2, pp. 39–40.

### 1.2 Positive directions and q-pseudoconvexity

For 0≤q≤n, define strongly q-pseudoconvex to mean
the Levi form has at least n−q strictly positive eigenvalues. Prove the
index bound λ≤n+q, using a complex positive subspace and dimension
intersection, and the corresponding perturbation openness. No nonnegative
Levi hypothesis is substituted for the strictly positive directions.
This everywhere-positive convention counts n−q positive directions, so q=0
is strict plurisubharmonicity; it corresponds to Andreotti–Grauert q+1 in
the n−q+1 convention. Positivity holds everywhere here, rather than only
outside a compact set.

Acceptance includes a positive Hermitian quadratic function, the real part
of a holomorphic quadratic form, and a sum of both with explicit inertia.
For a real self-adjoint operator anti-commuting with J prove J identifies its
λ and −λ eigenspaces, including multiplicities and the zero eigenspace.
Use native `Module.End.eigenspace` and finite-dimensional spectral theory.

The q-positive API includes:

- q=0 agrees with strict plurisubharmonicity; increasing q weakens the condition.
- A positive complex subspace of dimension at least n−q gives index at most n+q.
- Under compact C² perturbations retaining a positive eigenvalue margin, the same number of positive directions persists.

**Checks.**

- On ℂ², |z₁|²−|z₂|² has Levi diag(1,−1), q=1, real index 2≤3;
  it fails q=0.
- For q=n and f=−Σ|z_j|² the positive subspace is zero and index=2n=n+q;
  the n−q+1 convention would incorrectly demand a positive direction.
- On ℂ, 3x²−y² has q=0 and index 1=1+0; constant f has Levi 0,
  so it fails q=0 when n>0, but satisfies q=n with index 0.
- For A=diag(1,−1), J sends (1,0) to (0,1), exchanging eigenvalues 1 and −1;
  A=0 has the whole space as its zero eigenspace.

*Needs:* Layer 1.1 Levi calculus; complex subspace intersection dimension and
finite-dimensional spectral theory. The q-index proof intersects a negative
space with a complex (n−q)-dimensional positive space. Hain's notes are the
reference for this convention and its geometric exhaustion use.

### Examples

The three diagonal Hessians above separate positive Levi from positive real
Hessian, and the two-eigenvalue model pins the J sign.

### Dependencies

Mathlib calculus and finite-dimensional linear algebra; Tau Ceti Morse index;
ComplexKahlerGeometry K1/K3 and MorseTheory M1/M3 for geometric interpretation.

## Layer 2: Closed embeddings and squared-distance exhaustions (A2)

### 2.1 Complex second fundamental forms

For a holomorphic immersion i:M→ℂᴺ with the induced real metric, identify
the tangent and normal spaces as J-invariant spaces. Prove
`B(Jv,w)=J B(v,w)=B(v,Jw)` and `B(Jv,Jw)=−B(v,w)` for the real second
fundamental form. With `g(S_νv,w)=g(B(v,w),ν)` prove
`S_νJ=−JS_ν` and `S_(Jν)=JS_ν`. Give the complex-bilinear normal-valued
second fundamental form and its relation to these real identities, without
describing a sesquilinear Hermitian pairing as a complex quadratic form.
Deduce the paired eigenvalues and symmetric focal distances on each normal
line, with focal multiplicities and zero-eigenvalue cases explicit.

The second fundamental form specialization has the following API:

- J acts on the normal bundle and the form is complex-bilinear in its tangent arguments.
- With the displayed real shape convention, S_ν anti-commutes with J and S_(Jν)=JS_ν.
- Nonzero shape eigenvalues pair with their negatives, preserving multiplicity and the corresponding signed focal distances.

**Checks.**

- For the graph z↦(z,z²) at 0, B(1,1)=2, B(i,i)=−2 and B(1,i)=2i;
  the equality B(Jv,Jw)=−B(v,w) fixes the sign.
- With real normal ν=1, S_ν=diag(2,−2) and S_i has off-diagonal entries 2;
  multiplying J S_ν gives exactly this latter matrix.
- A complex affine plane has B=0 and only zero shape eigenvalues, hence no finite
  focal distance; division by a zero eigenvalue is not a focal point.

*Needs:* RiemannianGeometry R5a/R6 intrinsic forms and shape convention;
ComplexKahlerGeometry K1 holomorphic immersion; Layer 1.2 paired spectrum.
Milnor's proof of Theorem 7.2, pp. 39–40, supplies the complex quadratic model.

### 2.2 Euclidean distance and normal endpoints

For every finite-dimensional real Euclidean space E and C² immersion
i:M→E of an m-dimensional Hausdorff second-countable manifold, define
ρ_a(x)=‖i(x)−a‖² and the normal endpoint map e(x,ν)=i(x)+ν on the orthogonal
normal bundle. The bundle has real dimension dim E. Develop these contracts
on that bundle, before any complex specialization (Milnor, §6, Corollary 6.2, Assertions 6.3–6.4, Lemma 6.5
and Theorem 6.6, pp. 32–36):

- The distance function is C² and nonnegative (smooth for a smooth immersion); dρ_a(x)=0 exactly when
  a−i(x) is normal. In a C² local parametrization u its critical Hessian is
  `2⟨Du v,Du w⟩ − 2⟨D²u(v,w),a−u⟩`.
- Differentiating `⟨ν,Du w⟩=0` gives the normal derivative pairing
  `⟨Dν v,Du w⟩=−⟨ν,D²u(v,w)⟩`. The endpoint differential has tangential
  block I−S_ν and identity normal block. Thus its singularity is equivalent
  to degeneracy of that critical Hessian, with the same kernel dimension.
- The critical image of e is Haar-null by equal-dimensional C¹ Sard and
  countably many normal charts. Outside it every critical point of ρ_a is
  nondegenerate; for a smooth immersion, ρ_a is therefore a smooth Morse
  function for almost every a. The C² immersion makes the endpoint map C¹;
  equal source and target dimensions are essential to this regularity threshold.
- If i is a closed embedding, ρ_a is proper: for R≥0 its sublevel is the
  inverse image of the intersection of the closed image with the closed ball
  of radius √R; negative sublevels are empty. The same holds for a proper
  embedding. No focal theorem is needed for these conclusions.

Compare the local normal carrier and shape convention with RiemannianGeometry
R5a/R6. For a holomorphic immersion prove
`Hess ρ_a(v,v)+Hess ρ_a(Jv,Jv)=4‖di(v)‖²` at critical points;
its Levi form is positive everywhere (Milnor, proof of Theorem 7.2, pp. 39–41).

**Checks.**

- On the closed graph i(z)=(z,z²), at z=0 and a=(0,c) for real c,
  ρ_a=c²+(1−2c)x²+(1+2c)y²+(x²+y²)². The Hessian is
  diag(2−4c,2+4c), so the paired sum is 4 and Levi value is 1.
- At c=1/2 its determinant is 0 and I−S has eigenvalues 0,2;
  at c=1 the Hessian eigenvalues are −2,6 and its index is 1.
- On that graph ρ_0=|z|²+|z|⁴, so ρ_0≤2 implies |z|≤1.
  On the nonclosed inclusion ℂ*→ℂ, 1/k has distance tending to 0 but
  no convergent subsequence in ℂ*, excluding the false properness assertion.

*Needs:* Mathlib finite-dimensional differentiation and Euclidean orthogonal
complements; GeometricTopology Layer 1 normal bundle;
`TauCeti.addHaar_image_eq_zero_of_not_surjective_fderivWithin` in equal dimensions;
DifferentialGeometry §10.2 chartwise null-set transport. The intrinsic comparison additionally needs
RiemannianGeometry R5a/R6, but the distance and CW route do not.

### 2.3 The closed-embedding CW theorem

For a closed holomorphic embedding of a Hausdorff second-countable complex
n-manifold into ℂᴺ, prove `closed_holomorphic_embedding_cw_bound`:
there is a homotopy-equivalent CW complex with no cells of dimension greater
than n (Milnor, Theorem 7.2, p. 39; proof pp. 39–41).
Apply M1–M2 and A1 to
give a CW model of real dimension≤n, one cell per critical point with its
actual index, and compatible sublevel maps. State the proper holomorphic
embedding formulation as well. Establish the same conclusion for every
smooth affine algebraic submanifold using closedness of polynomial zero sets
and the Jacobian/holomorphic submanifold comparison.

**Checks.**

- ℂ has a point CW model; no cells occur above dimension 1.
- ℂ* embeds closed in ℂ² as zw=1 and has a circle model with one 0-cell and one 1-cell.
- A zero-dimensional closed submanifold is discrete and has only 0-cells;
  the empty manifold has the empty CW model.
- ℂ²∖{0} deformation retracts to S³ and has H₃=ℤ, so its nonclosed inclusion
  into ℂ² cannot satisfy the dimension-2 conclusion.

*Needs:* Layer 2.2 proper distance and generic Morse centre; Layer 1 index bound;
MorseTheory M1–M2 attachment and proper CW exhaustion; ComplexKahlerGeometry K1
for the smooth affine submanifold comparison.

### Examples

The graph and hyperbola computations distinguish Hessian degeneracy, Morse
index, closedness and the resulting CW bound.

### Dependencies

Layer 1; GeometricTopology Layer 1; DifferentialGeometry §10.2;
MorseTheory M1–M2; ComplexKahlerGeometry K1. RiemannianGeometry R5a/R6 is used
only in §2.1 and the intrinsic comparison in §2.2.

## Layer 3: Pseudoconvex exhaustions and their topology (A3)

### 3.1 Exhaustion and CW consequences

Define `qPositiveLeviInCharts` on the native complex charted space by requiring,
at every point x, a complex subspace of dimension at least n−q where the Levi
diagonal of f composed with the inverse extended chart is strictly positive
at the chart image of x. For real C² f
on a complex manifold, Layer 1's holomorphic pullback law makes it equivalent
to the intrinsic q-positive definition for 0≤q≤n.

- Its chart formula agrees with Layer 1's diagonal on complex affine space.
- Holomorphic chart changes preserve the positive-subspace dimension, using their invertible derivatives.
- Restriction to open subsets and composition with biholomorphic maps preserves the predicate for smooth f.

**Checks.**

- In the identity chart on ℂ, f=|z|² and q=0 give P=ℂ, Levi 1 and dimension 1≥1.
- For f=−|z|² and q=0 the Levi value is −1, so no dimension-1 positive P exists;
  for q=1 take P=0, giving dimension 0≥0.
- Under z=2w, |z|² becomes 4|w|² and Levi 4; the positive dimension stays 1,
  whereas the noninvertible map z=0 gives Levi 0 and is not a chart change.

*Needs:* Layer 1's real Hessian and Levi diagonal; Mathlib `extChartAt`,
`ContDiffOn` and submodule dimension; ComplexKahlerGeometry K1 for the intrinsic
interpretation. The definition itself uses only the pinned chart and derivative carriers.

Prove `q_positive_exhaustion_cw_bound` for every Hausdorff second-countable
complex n-manifold, 0≤q≤n and f smooth as a real function in every extended
complex chart: if f is proper, its range is bounded below, and
`qPositiveLeviInCharts` holds, the manifold has a CW homotopy model with no
cells above n+q. Given this smooth proper bounded-below strongly q-pseudoconvex exhaustion,
use A1's fine C² openness and MorseTheory M3's approximation with global C⁰
error<1 to produce a proper bounded-below Morse exhaustion preserving that
positivity. Prove the chosen local tolerances and index bounds survive the
whole exhaustion construction. Give the relative version preserving an
already Morse closed neighborhood. Obtain a CW model of dimension≤n+q.
For strict plurisubharmonicity q=0 this includes A2 independently of its
distance-specific proof. A proper strictly plurisubharmonic exhaustion is
the hypothesis here; a Stein embedding theorem or the Levi problem is not
an implicit premise.

Apply MorseTheory M4's integral H_j vanishing above CW dimension d, H_d
freeness including countably infinite cells, and UCT cohomology vanishing
above d to these actual CW models. Degree-d cohomology can have torsion from
H_(d−1); do not claim its freeness. Give field Betti bounds on each finite
regular band, and comparisons of different exhaustions via the underlying
space's singular groups. Prove a compact complex submanifold of a manifold
with such a strongly q-pseudoconvex exhaustion has complex dimension≤q,
by the maximum/Levi test on its tangent space.

The exhaustion API includes:

- A global C⁰ error less than 1 preserves boundedness below and compact sublevels.
- Relative fine approximation fixes the prescribed already-Morse neighborhood while retaining q-positive Levi directions.
- The resulting CW model is homotopy equivalent to the underlying manifold, so its groups and comparisons are independent of the chosen exhaustion.

**Checks.**

- For ρ=|z|² and |g−ρ|<1, {g≤R}⊂{|z|²≤R+1}; the inclusion gives the required compact containment.
- On ℂ*, ρ=|z|²+|z|⁻² is proper with positive Levi 1+|z|⁻⁴;
  the circle model gives H₁=ℤ and H₂=0, with dimension bound 1.
- On ℂ², ρ=|z|² has q=0; a compact positive-dimensional complex curve
  would contradict the maximum-point Levi test, giving dimension≤0.
- The 2-dimensional CW space ℝP² has H₂=0 (free) and H²=ℤ/2;
  the abstract top-homology assertion does not imply top-cohomology freeness.

*Needs:* Layer 1 fine positivity and index bounds; MorseTheory M2–M4 proper
relative approximation, CW models and homology; AlgebraicTopology Stage 6.1 UCT.
Hain's pseudoconvex exhaustion argument and the J-intersection bound give the
q-version; the strict closed-embedding case is Milnor Theorem 7.2.

### Examples

The hyperbola exhaustion and the projective-plane CW example test properness
and the distinction between top homology and cohomology.

### Dependencies

Layer 1 and MorseTheory M2–M4; AlgebraicTopology Stage 6.1.
Layer 2 provides the closed-embedding specialization, not an input to the general exhaustion theorem.

## Layer 4: Locally finite chains and noncompact duality (A4.0)

### 4.1 Locally finite chains and compact pairs

 This generic
foundation uses AT2–6's chains/cochains/tower algebra, CC C1.2a S0–S5's supported
cohomology and supplied-collared-boundary pair sequence, AT6.0/6.3/6.4's tower/orientation/compact-boundary duality,
MorseTheory M2–M3's proper exhaustions and GT's locally finite triangulations
and collar/corner rounding. It precedes A4.1 and uses
none of A0–A3's complex/affine geometry or Four's smoothing/classification.
Its real smooth-manifold statements also allow collared boundary; the complex
manifold statements in the other stages retain their boundaryless models.

Construct Borel–Moore homology with module-valued local coefficients from
locally finite singular chains on
second-countable locally finite polyhedra and smooth manifolds, with proper-map
functoriality (with a coefficient-system morphism) and restriction to opens.
Own the coefficient transport, boundary, local finiteness and square-zero
proofs and the locally finite singular/simplicial comparison with these coefficients.
For an open V⊂U with compact exhaustion L_s inside V, define restriction on
homology by the zigzag
`C^lf(U;L)→lim_s C(U,U\L_s;L)←lim_s C(V,V\L_s;L|_V)=C^lf(V;L|_V)`.
The left arrow records relative restrictions; the right arrow is levelwise
excision between degreewise-surjective towers and is inverted on homology
using AT 6.0's limit-homology comparison. Prove exhaustion independence,
composition of open restrictions and proper-map compatibility.
Own a locally finite triangulation
of X\A using successive subdivided barycentric-neighborhood shells, compatible
on their overlaps, using that coefficient-sensitive chain comparison.
For the closed/open exact sequence require the closed piece to be a closed
subpolyhedron in a compatible locally finite triangulation, so both pieces
remain in this category. Build the required open-complement triangulation
and subdivision/excision maps rather than assert a sequence for arbitrary
closed subsets. For compact finite triangulated X and subcomplex A, prove
`H_j(X,A;ℤ)≃H_j^BM(X\A;ℤ)` using cofinal regular neighborhoods. Construct them on the finite polyhedral
pair by making A full in a barycentric subdivision, taking the open locus with
positive total A-vertex weight, and normalizing those weights to retract onto A.
The homotopy transfers weight linearly to the normalized A-coordinates and
fixes A; repeated subdivisions give cofinal neighborhoods. Empty A uses the
empty neighborhood, and A=X uses the identity.
Own the missing limit argument: identify locally finite chains with the
inverse limit of `C(U,U\K_r)` for a countable compact exhaustion, whose
chain-level transition maps are surjective. Consume
[AlgebraicTopology Stage 6.0](../AlgebraicTopology/README.md)'s generic lim¹,
Milnor chain/cochain sequences and
cofinal-shift naturality. Specialize its cochain sequence to restrictions
to compact exhaustion pieces. For the compact pair, subdivision/excision and cofinal
neighborhood retractions identify the homology tower with a constant tower;
prove its lim¹ vanishes. Extend AT Stage 6's orientation-
local-system duality to noncompact manifolds:
`H_j^BM(U;ℤ)≃H^(m−j)(U;orientation_U)`.
Use integer degree for this formula, extending the native ordinary cochain
complex by zero in negative degrees and proving its nonnegative-degree
comparison. For j>m the right side is zero; avoid natural-number truncated
subtraction turning it into H⁰.
The locally finite chain and restriction API includes:

- The differential transports coefficients to the first vertex and squares to zero; proper maps preserve local finiteness.
- Open restriction is independent of exhaustion and composes through the displayed excision zigzag.
- Compatible closed subpolyhedra give the closed/open exact sequence, and compact pairs give the relative/Borel–Moore comparison.

**Checks.**

- On a countable discrete set, C₀^lf is ∏ℤ whereas ordinary C₀ is ⊕ℤ;
  restriction to the even points deletes precisely the odd coordinates.
- On ℝ, the locally finite sum of unit oriented edges has boundary 0;
  the ray sum from 0 to +∞ has boundary −[0], so H₀^BM(ℝ)=0.
- For ([0,1],{0,1}), relative H₁=ℤ=H₁^BM((0,1)), while ordinary H₁((0,1))=0.
- The nonproper map ℤ→point sends the coefficient-1 chain to an undefined
  infinite integer sum; properness is necessary for chain pushforward.

*Needs:* AlgebraicTopology Stages 2–3 and 6.0 relative chains, excision and
Milnor comparison; GeometricTopology Layer 11 subdivisions for shell triangulations;
CharacteristicClasses C1.2a for supported cochains. Compact-pair comparison
uses the cofinal neighborhood construction of Layer 5.7 only when applied to
an algebraic pair; the polyhedral neighborhood proof is part of this subsection.

### 4.2 Exhaustion-adapted refinement

Starting with GeometricTopology's smooth-to-PL triangulation (comparison,
step 1), prove the exhaustion-adapted subdivision theorem here: for every
compact exhaustion K_r with K_r⊂int K_(r+1) and union M, there is a countable
locally finite subdivision such that every closed simplex meeting K_r lies
in int K_(r+1), for all r. To retain a specified subcomplex triangulation,
require that it already satisfies these containments and is locally finite;
otherwise subdivide it too. Prove the relative subdivision smallness theorem
for a locally finite open cover, using compact finite stars and iterated
barycentric subdivisions with compatible face refinements. Near x there are
only finitely many relevant exhaustion boundaries; choose a neighborhood
avoiding earlier K_r and contained in the next interior for each K_r
containing x. This cover reduces the desired refinement to that smallness
theorem. General smooth triangulation supplies the starting complex, not the
quantified refinement. A further barycentric subdivision preserves it.
Use regular compact-sublevel exhaustions from MorseTheory M2–M3.

**Checks.**

- On ℝ with K_r=[−r−1,r+1], a mesh of length 1/2 has each closed
  interval meeting K_r inside (−r−2,r+2); the interval [−3,3] fails at r=0.
- For the point manifold every simplex is a vertex, so K_r=M works and
  every containment is equality with the interior.
- A prescribed edge [−3,3] cannot be retained in the first example;
  subdivision relative to that edge without the compatibility premise is false.

*Needs:* GeometricTopology Layer 11 subdivisions and comparison step 1;
MorseTheory M2–M3 only for the choice of smooth exhaustion. The refinement
is a consequence of open-cover subdivision, independent of affine geometry.

### 4.3 Locally finite fundamental classes

Order its vertices by the dimensions of their
original faces; each simplex is a strict face chain, so this restricts to a
total order and the restricted orders agree on shared faces. Use the local
orientation generators on these ordered top simplices to construct a locally
finite singular fundamental cycle with coefficients in `orientation_U`.
Own the cycle proof: the link of every codimension-1 simplex in a boundaryless
triangulated m-manifold is a 0-sphere, so exactly two top simplices contain
that face; the shared face is literally the same ordered singular simplex.
Prove their transported orientation coefficients cancel in its first-vertex
fibre. Use GT's PL-manifold/link comparison. Whenever further refinement is
needed, perform it first, then barycentrically subdivide and order anew by
face dimension; verify the subdivision comparison with transported
coefficients between the two ordered complexes.
Prove its local orientation characterization, uniqueness, independence of the
triangulation and compatibility with Borel–Moore restriction to opens. A chosen
orientation identifies this cycle with its untwisted integral version.
Prove uniqueness using the twisted Milnor sequence: AT 6.3's local-homology
vanishing gives `H_(m+1)(K_r,∂K_r;orientation_U)=0`, hence lim¹ vanishes;
its top-local-image injectivity determines relative classes on every component.
Use AT 6.4's collar/excision zigzag to compare these groups with
`H_*(U,U\K_r;orientation_U)`, compatibly with cap and orientation restriction.
The fundamental-class API includes:

- At each point the class has the specified local orientation generator with the orientation-system twist.
- The class restricts to that of every open submanifold and is unchanged by compatible subdivision.
- A choice of orientation trivializes the twist; the generator pairing sends o⊗o to 1.

**Checks.**

- Two oriented edges [0,1] and [1,2] contribute +[1] and −[1] at their common vertex, so their boundary terms cancel.
- Replacing a local generator o by −o leaves (−o)⊗(−o)↦1, not −1.
- On a countable discrete 0-manifold the fundamental class is the product element (1,1,…), not an ordinary finite chain.

*Needs:* Layer 4.1 coefficient transport and Milnor sequence; Layer 4.2 refinement;
AlgebraicTopology Stage 6.3 local homology and orientation; GeometricTopology
Layer 11 link comparison. Hatcher §3.3, pp. 233–238 gives the local-orientation prototype.

### 4.4 Cap towers and the integer-graded comparison

For manifolds
use that exhaustion and compare
the homology and cohomology Milnor sequences, including both lim¹ terms and
cap-product naturality, to pass from compact-boundary duality to U. Construct
the ordered locally finite fundamental chain from that adaptively refined
then barycentrically subdivided triangulation; its simplices meeting K_r
lie in K_(r+1). Form the
strict shifted tower map
`Φ_r:C^k(K_(r+1);orientation_U)→C_(m−k)(U,U\K_r;ℤ)` by cap with
that cycle and AT 6.3's canonical local-system pairing
`orientation_U⊗orientation_U→ℤ` (o⊗o maps to 1 for each local generator o).
Surviving back faces meeting K_r come from simplices wholly in
K_(r+1), so restriction and projection commute exactly. Use the AT cap
boundary identity; in Hatcher's front-face/back-face convention (§3.3, pp. 239–240) give the
reindexed cochain complex differential `d^k=(−1)^(k+1)∂`, so this is a
cochain map in every integer degree. Extend the native chain complex using
`ComplexShape.embeddingUpIntLE m`, whose degree map is j↦m−j. Own the
chain isomorphism from its unsigned differential to the signed complex by
degree-k multiplication by `ε_k=(−1)^(k(k+1)/2)`; prove
`ε_(k+1)=(−1)^(k+1)ε_k`, and transport the integer-graded Milnor sequence
and naturality through this isomorphism. Identify Φ's homology map with
AT 6.4's orientation-local-system compact-boundary duality composed with
`H^k(K_(r+1);orientation_U)→H^k(K_r;orientation_U)`.
That restriction need not be an isomorphism;
apply Stage 6.0's cofinal-shift isomorphisms on lim and lim¹, Milnor naturality
and the five lemma, rather than a levelwise-quasi-isomorphism claim. Treat
the resulting duality map as `[φ]↦[z⌢φ]`, with the displayed tensor pairing.
The ε isomorphism transports only Milnor exactness/naturality; it does not
rescale this map. Prove agreement with AT 6.4 for compact boundaryless U.
Treat dimension 0 separately by the product of pointwise coefficient groups on the
discrete manifold, without a half-space/boundary model. Distinguish
it from `H_j(U)≃H_c^(m−j)(U)`.

The shifted cap-complex API includes:

- The tower map uses the actual cap operation and the pairing of two orientation systems, not a choice of an isomorphism on groups.
- Degree-k multiplication by ε_k identifies the unsigned and signed reindexings.
- Cofinal shift identifies inverse limits and lim¹, without assuming each finite-stage restriction is invertible.

**Checks.**

- ε_0=1, ε_1=−1, ε_2=−1; the successive ratios −1,1 equal (−1)^(k+1).
- On [v₀,v₁] and a 0-cochain with values a,b, cap gives a[v₀,v₁];
  ∂cap=a[v₁]−a[v₀]=b[v₁]−a[v₀]−(b−a)[v₁], pinning the front/back convention.
- On ℝ, H⁰=ℤ=H₁^BM and H_c¹=ℤ=H₀, whereas H₀^BM=0=H_c⁰.
- For a point and j=1, the integer-degree target H⁻¹ is 0, not H⁰=ℤ.

*Needs:* Layers 4.1–4.3; AlgebraicTopology Stage 6.0 Milnor naturality and
cofinal shift, Stage 6.3 cap signs, Stage 6.4 compact duality; Mathlib
`ComplexShape.embeddingUpIntLE`. Hatcher §3.3, pp. 239–240 fixes cap signs;
the tower derivation here is an extension of the compact theorem.

### 4.5 Collared boundary and four dualities

Export noncompact Poincaré–Lefschetz duality for an m-dimensional smooth manifold
M with collared boundary, Hausdorff and second countable, and any module-valued
local system L. Construct [M,∂M]^BM with its actual boundary class and prove
all four cap isomorphisms, with integer degrees and the displayed orientation
twist: H^k(M;L)≃H_(m−k)^BM(M,∂M;L⊗or_M),
H^k(M,∂M;L)≃H_(m−k)^BM(M;L⊗or_M),
H_c^k(M;L)≃H_(m−k)(M,∂M;L⊗or_M), and
H_c^k(M,∂M;L)≃H_(m−k)(M;L⊗or_M).
These arbitrary-local-system, noncompact conclusions are derived from the
supplier's local-coefficient compact triad theorem by the tower argument below;
Hatcher, Theorem 3.43, p. 254, supplies the compact orientable constant-coefficient
prototype, not this whole extension. For each compact cut K with original boundary ∂₀K and artificial cut ∂₁K,
the finite-stage cap maps have the four sources and targets
Hᵏ(K;L)→H_(m−k)(K,∂K;L⊗or_K),
Hᵏ(K,∂₀K;L)→H_(m−k)(K,∂₁K;L⊗or_K),
Hᵏ(K,∂₁K;L)→H_(m−k)(K,∂₀K;L⊗or_K), and
Hᵏ(K,∂K;L)→H_(m−k)(K;L⊗or_K), respectively.
Retain nested-cut naturality and both lim¹ terms in the first two inverse-limit
comparisons; the latter two use the filtered compact-support colimits.

For collared boundary first construct the boundaryless collar extension
M⁺=M∪_(∂M×{0})(∂M×(−1,0]). Choose a proper exhaustion there using
MorseTheory M2–M3; rectify it on the specified collar to be product-like
in the normal coordinate, using a proper exhaustion on ∂M, locally finite
collar cutoffs and relative fine perturbations away from that collar. Choose
regular levels for the interior and boundary restrictions. Intersect their
compact sublevels with M, then round their collar corners by GT's relative
rounding, retaining the actual compact boundary pairs and cofinal inclusions.
On each rounded piece take ∂₀K from K∩∂M and ∂₁K from its regular cut,
with their labelled collar/edge comparisons; these collars supply the
excisive triad neighborhoods. Consume AT6.4's single
`compactTriadPoincareLefschetz` and its nested-cut naturality. Its relative
cap maps are the finite-stage maps for all four displayed limits/colimits.
Prove cofinality, including along every noncompact boundary component;
this construction does not apply a boundaryless Morse theorem directly to M.
Use the same locally finite fundamental chain and this compatible compact
exhaustion; relative boundary faces and regular cuts have the actual rounded
models from GT. For compact-support cohomology pass through the filtered
compact-relative colimit; for ordinary cohomology/BM chains retain the
preceding Milnor/lim¹ comparisons. Prove restriction, proper pushforward/
pullback adjunction, supported pair-sequence and boundary-sign compatibility,
and agreement with AT6.4 on compact pieces. Prove H_0^BM(M)=0 when M has no
compact connected component by locally finite proper-ray boundaries. These
are comparisons of CC's supported and this stage's single BM carriers,
not new cohomology definitions. Four's early proper-cobordism calculation
consumes only A4.0.

The collar-exhaustion API includes:

- Each compact cut retains the original boundary face ∂₀K and artificial face ∂₁K, with their compatible collars and edge.
- The cuts are cofinal both in M and in its boundary and compare with the same supported and locally finite complexes.
- Boundary classes and all four cap maps commute with restriction and the specified coefficient morphisms.

**Checks.**

- For [0,1], H⁰=ℤ pairs with H₁([0,1],∂)=ℤ and H¹([0,1],∂)=ℤ
  pairs with H₀=ℤ; compact supports give the same two formulas.
- For [0,∞), H⁰=ℤ=H₁^BM(M,∂M), while H⁰(M,∂M)=0=H₁^BM(M);
  H_c¹(M)=0=H₀(M,∂M) and H_c¹(M,∂M)=ℤ=H₀(M).
- On a point with coefficient module L, all four degree-0 maps are the identity L→L;
  if L=0 all groups vanish. No orientability assumption removes the twist by default.

*Needs:* Layers 4.1–4.4; MorseTheory M2–M3 relative exhaustion;
GeometricTopology Layer 1 collars and corner rounding; AlgebraicTopology
Stage 6.4 compact triads and nested-cut naturality; CharacteristicClasses
C1.2a S0–S5 supported relative sequences.

### Examples

The line, half-line, compact interval and discrete 0-manifold distinguish
support, boundary and degree conventions in the four formulas.

### Dependencies

AlgebraicTopology Stages 2–6; CharacteristicClasses C1.2a S0–S5;
MorseTheory M2–M3; GeometricTopology Layer 1, Layer 11 and smooth-to-PL
comparison step 1. There is no dependency on Layers 0–3 or on algebraic triangulation.

## Layer 5: Semialgebraic triangulation and compact algebraic pairs (A4.1)

### 5.1 Finite marked-family triangulation and dimension

Prove `finite_semialgebraic_triangulation`: finite triangulation of a compact
semialgebraic set X⊂ℝⁿ compatible with a
finite family of semialgebraic subsets S_i of X: produce an actual finite
simplicial complex and a semialgebraic homeomorphism of its realization such
that each S_i is a union of open-simplex images. The semialgebraic homeomorphism means its graph is semialgebraic in the
product coordinate space; finite marked subsets are contained in X and need
not be closed. Closed S_i are realized by subcomplexes as a consequence.
This is Bochnak–Coste–Roy, Theorem 9.2.1 (§9.2); the additional completed-list
and projection invariants below are construction targets, not assertions that
this theorem states those refinements. Supply restrictions, compatible subdivisions and dimension
comparison. Own semialgebraic dimension from CAD
cells, its independence, finite-union/product/closure and fiber-dimension API,
and comparison with smooth real and reduced complex analytic dimensions.
The dimension and finite-triangulation API includes:

- Dimension from CAD cells is independent of the decomposition, respects finite unions, products and closure, and has the fibre-dimension stratification theorem.
- Smooth real pieces have their manifold dimension; a complex n-dimensional smooth piece has real dimension 2n.
- Triangulations restrict to the marked subsets and admit compatible subdivisions; closed marks are subcomplexes.

**Checks.**

- A point, open interval and empty set have dimensions 0,1,−∞;
  the closure of (0,1) still has dimension 1.
- A complex line has real dimension 2; an isolated reduced point defined by x²=0 has dimension 0.
- On X=[0,1] marked by (0,1) and {0}, the edge interior and left vertex are the two prescribed marks;
  treating every mark as a closed subcomplex would fail for (0,1).
- Empty X has an empty complex; marking {1/2} requires subdividing [0,1]
  at 1/2, so the unsubdivided edge fails compatibility.

*Needs:* RealAlgebraicGeometry Layers 3–6 sign sets, CAD and projection;
GeometricTopology Layer 11 complexes; ComplexKahlerGeometry K3 reduced germs
for the complex dimension comparison. The triangulation uses §§5.2–5.6 below
(Bochnak–Coste–Roy §9.2, Theorem 9.2.1); its dimension inputs precede that construction.

### 5.2 Generic direction and frontier preparation

For each nonzero input polynomial p of total degree d, let H_p be its
nonzero homogeneous degree-d part. For the shear `(y,t)↦(y+a t,t)`, prove
that its coefficient of t^d is the constant H_p(a,1). On the parameter
set where this is nonzero it is the last-variable leading coefficient.
Prove simultaneous nonvanishing for a nonempty open dense set of a, using
the nonzero product of these dehomogenized polynomials; treat zero and
constant polynomials separately. This supplies the generic-direction claim.
Then construct the derivative/slicing-family completion of
Bochnak–Coste–Roy §9.1, Proposition 9.1.2, retaining every original sign
marker. Prove that its cylindrical cells project to lower cells and that
each cell closure is a union of cells, with the compatible graph-section
restrictions of Theorem 9.1.4. Own this preparation before triangulation;
a bare sign-invariant CAD is not assumed to have the frontier property.
The polynomial-preparation API includes:

- The coefficient of t^d after shear is H_p(a,1), with a common nonempty open dense nonvanishing locus for any finite family of nonzero polynomials.
- The derivative completion retains original sign markers and handles zero/constant derivatives separately.
- Prepared cylindrical cells satisfy the frontier condition and compatible graph restrictions, beyond sign invariance alone.

**Checks.**

- For p(y,t)=y²+t, the transformed t² coefficient is a²; a=0 fails and a=1 works.
- For p=y and p=t−y, simultaneous nonvanishing requires a≠0,1; a=2 gives coefficients 2,−1.
- A nonzero constant has d=0 and that same constant as leading coefficient; the zero polynomial is excluded from the nonvanishing claim.

*Needs:* RealAlgebraicGeometry Layers 4–6 root matching, CAD and projection;
polynomial homogeneity and the fact a nonzero real polynomial has zero set with empty interior.
Bochnak–Coste–Roy §9.1, Proposition 9.1.2 and Theorem 9.1.4 supply the preparation locators.

### 5.3 Root extension and completed face lists

Choose the lower-dimensional base triangulation compatible with the projected
strata and signs. Prove continuous extension of bounded section roots to
closed base simplices when the witnessing polynomial specializes to a
nonzero polynomial at every point of the closed simplex. Quasi-monicity
supplies this hypothesis. Use finiteness of the boundary roots, compactness
of the bounded vertical interval, and connected intersections of small balls
with the simplex interior to prove existence and continuity of the limit.
Construct the inductive simplicial lift and finite-family compatibility
refinement. Prove compact extension, gluing and bijectivity;
compact-to-Hausdorff gives inverse continuity. CAD cells alone are not a
triangulation.

Expose a parametrized finite compact lifting theorem. Its input is a
caller-supplied finite quasi-monic polynomial family F closed under last-variable
differentiation ∂_t, with zero and constant derivatives handled separately,
the frontier-compatible cylindrical refinement prepared above, and a base
triangulation compatible with every projected stratum, with its map. Choose
M>0 bounding the compact set's last coordinate, include
`t²−M²` and its derivatives in F, and retain only section heights in [−M,M]
in every completed list. The bounding sections are retained on every face;
all section-coverage claims concern this closed bounded vertical interval.
Export the finite adapted cells, the original marked signs, each section's
witnessing polynomial and constant fiber multiplicity, continuously extended
section functions and lifted face maps. Export as definitions the first
subdivision's vertex orders, the per-simplex completed lists L(σ), their face
restriction maps ρ, the E_l extension maps below, and the second subdivision's
distinguished vertices, so consumers can prove further invariants of those
same maps. Prove each
open-simplex image lies in one adapted cell. Use the coordinate-permutation
adapter `Equiv.swap 0 (Fin.last n)` from the last affine variable in
`Fin (n+1)` to RealAlgebraicGeometry's distinguished coordinate0 and back. Retain all derivative polynomials added by a caller;
no replacement by an unrelated merely sign-invariant CAD is permitted.

The bounded-root API includes:

- Each section keeps a witnessing nonzero specialized polynomial and constant fibre multiplicity.
- Bounded sections extend continuously to closed simplices under that nonzero-specialization hypothesis.
- Restriction keeps the bounding sections and every caller-added derivative polynomial.

**Checks.**

- The bounded root √x of t²−x on (0,1) extends to 0 and 1; at x=0 the polynomial remains t², nonzero despite its double root.
- The bounded root x/(x+y) on x,y>0, x+y<1 solves (x+y)t−x=0;
  at (0,0) that polynomial is zero and limits along x=y and x=2y are 1/2 and 2/3. The specialization hypothesis excludes it.
- Roots of t²−M² for M>0 retain the distinct heights −M,M on every face;
  M=0 would collapse the bounding interval and is excluded.

*Needs:* §5.2 frontier preparation; RealAlgebraicGeometry Layer 4 root continuity;
compactness of the bounded interval and connected small-simplex neighborhoods.
The boundary extension follows from finite roots of each nonzero specialization.


Barycentrically subdivide the base **before** completing its stacks. Vertices
are ordered by their chain of controlling faces, with the top vertex in the
controlling open cell. Complete stacks recursively on dimension and this
ordered-face data, retaining the original section functions. Inside a gap
a<b on σ=[v₀<⋯<v_d], use precisely the auxiliary index set
`I={x∈L(F_d): a|F_d<x≤b|F_d}`, where F_d is the opposite face.
It is empty if the gap collapses on F_d. Include the upper endpoint in I;
its auxiliary extension is distinct from the original section b. Assign every
auxiliary index the value a at v_d, retaining b as the original upper endpoint.
For i<d prescribe the facet restriction
`aux_x|F_i=aux^{F_i}_{ρ(x)}` if `ρ(x)≠a|F_id`, and `a|F_i` otherwise,
where F_id=F_i∩F_d and ρ is restriction from F_d to F_id.
For an empty opposite face the top-vertex value is a. Prove these prescriptions
agree on all common faces by the dimension-decreasing recursion. Elements of
L(τ) are pairwise distinct on each open τ; any tagged copies are only local
auxiliary-index labels. Thus ρ is plain function restriction, possibly identifying
heights on a face, and is nondecreasing and natural under iterated restriction.
Prove its surjectivity onto each completed boundary list in [−M,M], using the
fixed top-vertex rule and the included upper-endpoint index. Repetition/padding
is through these maps, not an asserted coherent list on an arbitrary
unsubdivided boundary.
This supplies the boundary lists for the extension below. Only after the
ordered-face preparation may the facet formula be applied. A root present
only on a boundary face is extended into its incident stacks. Prove finiteness
by the finite base/section families and strict decrease of dimension in the
recursive calls, and prove order, shared-face compatibility and coverage.
The completed-list API includes:

- Face restriction is ordinary restriction of distinct interior heights, may merge them on a boundary, and is natural under repeated restriction.
- Auxiliary indices include the upper endpoint but have value a at the top vertex; they do not replace the original upper section.
- Boundary restriction is surjective onto the completed bounded list; equal-or-consecutive sections remain so on every face.

**Checks.**

- On an interval with constant gap [0,1], the opposite endpoint contributes the index 1;
  its auxiliary section has endpoint values 1 and 0, while the original upper section has values 1 and 1.
- If a=b on the opposite face, {x:a<x≤b}=∅; no auxiliary index can be manufactured by dividing by b−a.
- Heights 0,x,1 on [0,1] restrict at x=0 to 0,0,1: the restriction is nondecreasing and surjective onto {0,1}, but not injective.

*Needs:* §5.3 bounded sections; GeometricTopology Layer 11 barycentric face chains;
dimension induction and the rational extension of §5.4, applied only after its
face-compatible boundary data are constructed. The extension itself uses no completed-list theorem.

### 5.4 Rational extension of boundary heights

For a face-coherent boundary list in a gap a≤b on a d-simplex, normalize each
height by r_l=(c_l−a)/(b−a) where b>a. In barycentric coordinates λ use facet
projections p_i removing λ_i and dividing by 1−λ_i, weights
`w_i=∏_{j≠i}λ_j`, `w_*=∏_j λ_j`, and fixed ordered constants
`0<α₁<⋯<α_L<1`. The interior extension is
`E_l=(w_*α_l+Σ_i w_i r_l(p_i))/(w_*+Σ_i w_i)` and the height is
`a+(b−a)E_l`. If I is nonempty, every open facet entering this E-formula
has a<b: facets containing v_d remain in the controlling open cell, and
nonemptiness of I forces a<b on F_d. Thus each normalized facet ratio is
defined there; no arbitrary value for an undefined collapsed-facet ratio is
needed. A gap collapsed on F_d contributes no auxiliary indices. Collapse
on lower-dimensional boundary faces is handled by bounded ratios multiplied
by the vanishing width. Prove positivity/order, semialgebraicity and continuity to
the prescribed boundary heights, including vertices and collapsed gaps;
bounded ratios suffice where b−a tends to zero. Handle d=0 separately.
Expose preparation and extension lemmas separately, with equality on every
shared face. At a noncollapsed boundary point, prove the facets containing
its face have dominant weights and their projected values converge to the
prescribed ratio; the other weights are negligible. At a vertex the weight
of its opposite facet is negligible. At a collapsed point use boundedness
of all ratios and the vanishing factor b−a.
The boundary-extension API includes:

- E_l lies in [0,1], is strictly ordered in the interior by the ordered α_l, and gives semialgebraic heights.
- At each noncollapsed boundary face it has the prescribed limit, with dominant incident-facet weights.
- At collapsed faces the height converges to a=b by the width bound, even if the normalized ratio has no limit; d=0 uses the prescribed vertex value.

**Checks.**

- On an interval with λ₀=λ₁=1/2, r(v₀)=0, r(v₁)=1 and α=1/2,
  the numerator is 1/8+1/2=5/8 and denominator is 1/4+1=5/4, hence E=1/2.
- If the gap is [2,2+x] and 0≤E≤1, then the height is in [2,2+x]
  and tends to 2 as x→0, irrespective of E's limit.
- Near a triangle vertex, λ=(1−2ε,ε,ε) gives opposite weight ε²,
  incident weights (1−2ε)ε twice and interior weight (1−2ε)ε²;
  the opposite-weight fraction tends to 0. Equal incident limits c give E→c.
- For interior coordinates all w_i and w_* are positive, so the denominator
  is positive; for d=0 the separate rule avoids a facet projection with denominator 0.

*Needs:* continuous face-compatible normalized boundary data, finite barycentric
coordinates, and positivity of the open-facet widths. This formula and its
weight estimates are construction lemmas, not quoted theorems of Bochnak–Coste–Roy.


The completed consecutive sections restrict to equal or consecutive sections
on every face. After completing the stacks, barycentrically subdivide the
base so each new simplex has a distinguished vertex in its controlling open
simplex, where every noncollapsed gap is positive. This is a second refinement,
following the initial ordered-face refinement. Prove strict ordering of
affine vertex-height interpolants from this vertex and the exact band/graph
face restrictions.

### 5.5 Continuous band transfer and pulling triangulation

Define the closed band B[a,b] over a compact base C by
{(x,t) | x∈C, a(x)≤t≤b(x)} for continuous a≤b. Given a homeomorphism
 g:C→D, continuous A≤B on D, and matching collapse loci
`a(x)=b(x) ↔ A(g(x))=B(g(x))`, define the band map by
`(x,t) ↦ (g(x), A(g(x))+(B(g(x))−A(g(x)))(t−a(x))/(b(x)−a(x)))`
when a(x)<b(x), and by (g(x),A(g(x))) on the collapsed fibre.
This layer owns its continuous endpoint/restriction calculus and collapsed-band
continuity, as elementary consequences of interpolation and compactness.
For a dense open base stratum with positive width, prove that the closure
of its open band is this closed band, when the endpoints extend continuously.
The map has the following API:

- It sends lower to lower and upper to upper, commutes with projection by g,
  and restricts to the same formula on every closed base face.
- It is continuous at a collapsed fibre because the target width tends to zero
  and the normalized coordinate stays in [0,1]; no quotient is evaluated there.
- It is a homeomorphism, with inverse the same construction for g⁻¹ and
  exchanged endpoints. Composition and identity agree on each fibre.
  If only source collapse implies target collapse, the formula still gives a
  continuous map, but a homeomorphism additionally needs the converse.

**Checks.**

- Over a point, [0,2]→[1,5] sends 0,1,2 to 1,3,5; the inverse sends 3 to 1.
- For a=0, b=x, A=2, B=2+x² on C=[0,1], t=x/2 maps to 2+x²/2,
  tending to 2 at the collapsed fibre, independently of the ratio's path.
- Collapsing [0,1] to {0} gives a continuous surjection but not an inverse;
  matching collapse loci excludes it from the homeomorphism assertion.

*Needs:* Layer 5.4 completed face lists; Mathlib continuous maps, intervals and
compact-to-Hausdorff homeomorphisms. This elementary band theorem is independent
of semianalytic induction.

For subdivision construct here a coherent pulling triangulation of these
completed affine bands and graphs. Their vertices are the prescribed upper
and lower endpoints over base vertices, identifying coincident endpoints.
Prove that all their faces have the same graph/band form over base faces,
and that any two cells meet in a common face, using the equal-or-consecutive
section restrictions. Include all such faces. Fix one total order on the
finite set of endpoint vertices. Recursively triangulate a polytope by
coning its least vertex to the pulling triangulations of the facets not
containing it. Prove coverage, simplicial intersections and restriction to
every face, with the same vertex order. All cones use existing vertices;
no interior lifted vertex is added.

The pulling-triangulation API includes:

- One global vertex order restricts to each face; coning the least vertex over facets missing it covers each polytope.
- Intersections are common simplicial faces and restrictions agree on every shared polyhedral face.
- Every new simplex uses only original endpoints over base vertices.

**Checks.**

- A square with least vertex (0,0) pulls into the triangles with other vertices
  (1,0),(1,1) and (0,1),(1,1); they meet in the diagonal [(0,0),(1,1)].
- A collapsed band over an interval is a graph edge with two vertices, not a quadrilateral with four distinct vertices.
- An interior vertex (1/2,1/2) over the base interval would project to 1/2,
  not a base vertex; the endpoint-only rule excludes this failed simplicial projection.

*Needs:* §5.4 section order and §5.5 band homeomorphisms; finite convex polytopes,
face intersections and induction on dimension. The refinement is a proof of
existence, with no executable construction required.

### 5.6 Projection-compatible lift

Export the normal projection property of the resulting lift. Let K_b be
the final base complex after the two specified refinements, and let
`Ψ_b:|K_b|→B` include their canonical subdivision homeomorphisms and the
original base map. For the lifted complex K_l and triangulation map Φ,
construct a simplicial vertex map `p:K_l→K_b`: every lifted simplex projects
onto a base simplex, allowing dimension drop on vertical faces. Prove the
commuting identity `π∘Φ=Ψ_b∘|p|`, where π drops the last coordinate.
In the rectilinear realization identify |p| with that coordinate projection.
Retain this identity on every face and on restrictions to the marked subsets.
The endpoint-only pulling construction supplies this guarantee; generic
coning to a new interior point does not preserve the final base vertices.

The semialgebraic lift owns the frontier preparation, completed lists,
extension/restriction maps and projection-compatible endpoint pulling
triangulation. Its dimension API precedes lifting and uses no analytic-simplex
invariant. The analytic-simplex refinement is a downstream comparison on
these same maps.

The simplicial projection API includes:

- Vertex projection extends to a simplicial map, allowing vertical simplices to drop dimension.
- The triangulation and base maps satisfy π∘Φ=Ψ_b∘|p|, including the two base subdivision maps.
- The same equality holds after restricting to every face and every marked subset.

**Checks.**

- The vertical edge from (0,a) to (0,b) projects to the single vertex 0, so a nondegenerate-simplex requirement would fail.
- A graph edge over [0,1] sends (1−t)(0,a)+t(1,b) to t on both sides of the projection identity.
- For the square pulling triangles the projected vertex sets are {0,1};
  for the excluded centre vertex the projection is 1/2, detecting the wrong base complex.

*Needs:* §§5.3–5.5 completed restrictions, band maps and pulling triangulation;
GeometricTopology Layer 11 realization and subdivision maps.

### 5.7 Projective pairs and complement comparison

Apply this to real/imaginary polynomial equations and to projective sets
using the finite affine atlas and a compact real algebraic projector model
for ℂPᴺ. Prove comparison of the models and semialgebraicity of the chart
changes; triangulate a presented projective algebraic pair (X,A) jointly.
Specialize Layer 4.1's polyhedral neighborhood retractions: make A full after barycentric subdivision,
construct an open simplicial neighborhood by barycentric coordinates and
a straight-line strong deformation retraction onto A fixing A. Iterated
subdivisions give cofinal neighborhoods. Prove the NDR/cofibration comparison
and construct AT Stage 8's `BasedTopPair` with basepoint in A.
This applies even when X or A is singular. Give hypersurface and complete-
intersection Jacobian checks for a smooth complement of pure dimension n.

For a compact triangulated pair with oriented smooth complement U of real
dimension 2n obtain the actual natural composite
`H_j(X,A;ℤ)≃H^(2n−j)(U;ℤ)`. Pin naturality under orientation-preserving
isomorphisms of pairs and open restrictions with Borel–Moore restriction
maps, without asserting covariance of ordinary cohomology under arbitrary
inclusions. In particular it applies to a pure-dimensional
projective algebraic X when all its nonsmooth points belong to A and U is
complex n-dimensional. Prove this comparison before invoking affine
cohomology vanishing; compact manifold duality alone does not cover singular X.

The projective-pair and neighborhood API includes:

- Realification and the rank-one Hermitian projector model identify the projective equations and chart changes semialgebraically.
- After making A full, barycentric weight normalization retracts a neighborhood onto A fixing A; subdivisions give cofinal neighborhoods and the NDR comparison.
- The resulting relative/Borel–Moore and orientation-duality maps give the displayed natural complement isomorphism.

**Checks.**

- In ℂP¹, [1:0] maps to diag(1,0); rescaling by 2 gives the same projector zz*/‖z‖², with denominator 1 or 4 and rank 1 in both cases.
- For the full vertex A={0} of [0,1], the neighborhood [0,1) retracts by
  (t,s)↦(1−s)t; t=0 stays 0. For A=∅ the neighborhood is empty; for A=X the retraction is the identity.
- For (S²,{point}), H₂(X,A)=ℤ=H⁰(ℝ²) and H₁(X,A)=0=H¹(ℝ²);
  ordinary H₂(ℝ²)=0 would give the wrong comparison.

*Needs:* Layer 0 and ComplexKahlerGeometry K3/K7 for projective charts and smooth
locus; §§5.1–5.6 for simultaneous triangulation; GeometricTopology Layer 11
subdivision; AlgebraicTopology Stage 4 NDR and Stage 8 pairs; Layer 4 for duality.
This supplies the neighborhood premise in Milnor, proof of Theorem 7.4, p. 42.

### Examples

Intervals with open and closed marks test triangulation; collapsed bands test
face restrictions; the sphere-point pair tests the complement comparison.

### Dependencies

RealAlgebraicGeometry Layers 3–6, GeometricTopology Layer 11 and elementary
convexity feed §§5.1–5.6. Layer 0, ComplexKahlerGeometry K3/K7, AlgebraicTopology
Stages 4/8 and Layer 4 are additionally used only for §5.7.

## Layer 6: Projective hyperplanes and relative homotopy (A5)

### 6.1 The smooth complement and homological theorem

For a presented pure n-dimensional projective algebraic X and hyperplane H
containing every nonsmooth point of X, set A=X∩H. Identify U=X\A with a
closed smooth affine submanifold in the standard chart ℂPᴺ\H≃ℂᴺ,
and identify its dimension. Allow whole components contained in H; if U is
empty the relative groups vanish directly. Prove A meets every connected
component of X for n≥1: a component missing H would be a compact positive-
dimensional complex submanifold of the affine chart, contradicting A1.

Combine A2–A4 to prove (Milnor, Corollary 7.3, p. 41) H_j(X,A;ℤ)=0 for j<n. The pair exact sequence
then gives H_j(A;ℤ)→H_j(X;ℤ) isomorphisms for j<n−1 and surjectivity
for j=n−1. Pin the maps as actual inclusion-induced maps. Include reduced
degree-zero and connected-component statements. For smooth X, DG Sard on
the incidence/dual-projective parameter family gives transverse hyperplanes
forming a dense full-measure set; full-measure means a null exceptional set
in every affine chart of the dual projective parameter space. Verify A is a
smooth hypersurface there.
The homological theorem also applies when A itself is singular under the
stated complement hypothesis.

**Checks.**

- For X=ℂP¹ and A one point, H₀(A)→H₀(X) is the identity ℤ→ℤ;
  n=1 asserts surjectivity, without asserting H₁ is an isomorphism.
- For a line A⊂ℂP², the low-degree maps give H₀≃H₀ and H₁=0→0;
  relative H_j=0 for j<2.
- If U is empty then X=A and every relative group is 0. At n=0 the
  range j<n is empty and no component-surjectivity assertion is made.

*Needs:* Layers 0 and 5.7 pair carriers and affine chart; Layer 2 CW bound;
Layer 3 cohomology vanishing; Layer 4 compact-pair duality;
AlgebraicTopology Stage 2 exact sequence. Generic transversality additionally
uses DifferentialGeometry §10.2 on Layer 0's incidence family.

### 6.2 Reversed exhaustion and relative homotopy

Prove (Milnor, Theorem 7.4, pp. 41–42) the relative homotopy strengthening π_j(X,A)=0 for 1≤j<n with
basepoints in A. Use a good-center distance exhaustion ρ on U and the
function F=(1+ρ)⁻¹ on U, extended continuously by 0 on A. Prove continuity
at A from properness of the affine chart coordinates. For every small
regular ε>0 the band ε≤F≤1 is compact inside U; its critical indices
are 2n−λ≥n. Attach the reversed M2 handles to X_ε={F≤ε}, leaving A
fixed, and compare through cofinal ε. Consume M2 handle homotopies fixing
the entire lower sublevel, and prove extension-by-identity over A: the set
`{F<a}∪A` is open and the homotopy is the identity there. For any compact relative disc map,
cellular approximation removes the cells of dimension≥n in dimensions<n,
placing it in a regular neighborhood of A, which A4 retracts onto A.
Prove the pair/basepoint and relative-map homotopies explicitly. Do not
infer relative homotopy vanishing solely from integral homology vanishing.
For every connected X in this smooth-complement scope deduce π_j(A)→π_j(X)
isomorphisms for j<n−1 and surjectivity for j=n−1, with the π₁ and
component cases treated by the actual long exact sequence of pairs. Also
derive homological weak Lefschetz directly from relative high-cell attachment
and the neighborhood retraction; A4 duality gives the independent source
duality proof on the same groups.

The reversed-exhaustion API includes:

- F=(1+ρ)⁻¹ extends by 0 on A, is positive on U, and its positive regular bands are compact.
- At a critical point its Hessian is a negative scalar times that of ρ, so a nondegenerate index λ becomes 2n−λ.
- Lower-sublevel-fixed handle homotopies extend by the identity over A and compare relative disc maps through cofinal neighborhoods.

**Checks.**

- For ρ=|z|², F=1/(1+|z|²) tends to 0 at infinity; the denominator is ≥1 and F(0)=1.
- At z=0 on ℂ, Hess F=diag(−2,−2) and its index is 2=2−0;
  a complex-index-1 saddle would become index 1=2−1.
- For (ℂP²,ℂP¹), π₁ of the pair is 0; a single ≥2-cell cannot obstruct
  a relative 1-disc. For (ℂP¹,point), the range 1≤j<1 is empty.

*Needs:* Layers 2 and 5.7; MorseTheory M2 handle homotopies relative to the entire
lower sublevel; AlgebraicTopology Stage 8 cellular approximation and pair sequence.
The negative derivative of t↦(1+t)⁻¹ gives the index reversal.

### Examples

The projective line and plane pin the boundary dimensions in the isomorphism
and surjectivity ranges, and distinguish them from absolute homology vanishing.

### Dependencies

Layers 0–5 with the subsection-specific inputs above; AlgebraicTopology
Stages 2 and 8; MorseTheory M2; DifferentialGeometry §10.2 for generic hyperplanes.

## Layer 7: Veronese embeddings and naturality (A6)

### 7.1 Examples and Veronese transport

Compute ℂⁿ, (ℂ*)ⁿ, affine quadrics and smooth affine hypersurface examples
on the actual exhaustion and CW carriers. Show the complex closed-embedding
hypothesis matters using ℂ²−{0} with its ordinary inclusion into ℂ²:
a bounded distance sublevel can accumulate at the missing origin and is
not compact. State this example without claiming it is Stein. For projective curves identify
the n=1 degree-zero surjectivity conclusion. For n≥2 compare hyperplane
connectedness, π₁ and low-degree groups of smooth projective hypersurfaces
with the ambient projective calculation. For every positive degree d build
the classical degree-d Veronese map on K7.1's native projective carriers,
indexed by the finite set of exponent vectors α:Fin(n+1)→ℕ with Σα=d,
ordered by a fixed lexicographic order. Its image is the A0 common zero
locus of the homogeneous quadratic binomials y_α y_β−y_γ y_δ with
α+β=γ+δ. Prove the ideal/image equality, the reduced image's pure
complex dimension n and its smoothness by explicit coordinate-chart
inverses where an original coordinate is nonzero. Prove well-definedness,
closed holomorphic embedding, compatibility with A0's native chart
transport, properness and those actual local inverses, and the pullback
of O(1) as O(d);
express a homogeneous polynomial as
the corresponding linear functional in those monomials. Identify its A0
zero locus and inclusion with the hyperplane section of the embedded
ambient projective space. Apply A5 to that actual inclusion and transport
the resulting maps back through the Veronese homeomorphism. Degree1 is
the linear case; degree0 equations retain A0's separate conventions.
Include projective varieties whose
singular points all lie in H, verifying the complement and triangulated-pair
hypotheses. Inclusion-induced Lefschetz maps form commuting squares under
inclusions of presented pairs. Duality identifications are natural under
projective-linear isomorphisms and the specified open restrictions.

The Veronese API includes:

- Nonzero rescaling multiplies every degree-d coordinate by the same scalar power, giving a projective map for d>0.
- The quadratic-binomial image, chart inverses and O(1) pullback determine the same closed holomorphic embedding.
- Homogeneous equations become linear sections in those coordinates, and the transported Lefschetz maps are the actual inclusions.

**Checks.**

- Degree 1 on ℂP¹ is the identity [x:y]↦[x:y]; the pullback line bundle is O(1).
- Degree 2 gives [x²:xy:y²], satisfying y₀y₂−y₁²=0; at [1:2]
  the image is [1:2:4] and 1·4−2²=0. The equation x²+y² becomes y₀+y₂=0.
- Degree 0 maps every point to the single monomial 1 and is not an embedding
  of ℂP¹; d>0 excludes it. For ℂP⁰ and d>0 the map is the one-point identity.

*Needs:* Layer 0 polynomial projective carrier; ComplexKahlerGeometry K7.1
projective and O(d) charts; homogeneous monomial algebra for the binomial image;
Layer 6 only for the transported Lefschetz conclusion. The chart inverse on
x_i≠0 recovers x_j/x_i from the coordinates x_i^(d−1)x_j and x_i^d.

### Examples

ℂⁿ has a point model; (ℂ*)ⁿ has its n-torus model with top group ℤ.
The conic and linear Veronese cases above test image equations and degree restrictions.

### Dependencies

Layer 0 and ComplexKahlerGeometry K7.1 for the embedding; Layer 6 for Lefschetz
transport. Layers 2–3 give the affine example comparisons.

## Downstream consumers

RealAnalyticGeometry R2/R2.1 uses Layer 5's continuous band maps and the completed
projection-compatible lift for its analytic-simplex comparison. FourManifolds
uses Layer 0's projective families and Layer 4's proper-cobordism topology.
Weak hyperplane and hypersurface applications use Layers 6–7 with their actual
inclusion maps; compact Hodge and Hard Lefschetz theory have independent inputs.

## References

- Milnor, [Morse Theory](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/milnmors.pdf),
  §6, pp. 32–38 (normal endpoints and distance Morse functions);
  Theorems 7.1–7.2, p. 39 and proof pp. 39–41 (affine/CW bounds);
  Corollary 7.3, p. 41 and Theorem 7.4, pp. 41–42 (weak Lefschetz).
- Hain, [Notes on the Morse theory of complex manifolds](https://sites.math.duke.edu/~hain/teaching/archive/spring_12/mini_s12/levi.pdf):
  Levi positivity and q-pseudoconvex index bounds in Layers 1 and 3.
- Hatcher, [Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  §3.3, pp. 239–240 (cap convention), Theorem 3.35, p. 246 (compact-support
  duality), Theorem 3.43, p. 254 (compact orientable triads). Layer 4's
  local-system/noncompact extension is the stated derivation through
  AlgebraicTopology Stage 6.0/6.3/6.4 and CharacteristicClasses C1.2a S0–S5.
- Bochnak, Coste and Roy, [Real Algebraic Geometry](https://doi.org/10.1007/978-3-662-03718-8),
  §9.1, Proposition 9.1.2 and Theorem 9.1.4 (preparation), and §9.2,
  Theorem 9.2.1 (finite triangulation). These are locator-only references;
  the completed-list, rational-extension and endpoint-pulling refinements are
  proved from the explicit inputs in Layer 5.
- Thomas Mark, Math240 December 7, 2001 lecture: complex second fundamental
  forms and affine/weak Lefschetz examples. The closedness and smooth-complement
  hypotheses are those explicitly stated in Layers 2 and 6.
