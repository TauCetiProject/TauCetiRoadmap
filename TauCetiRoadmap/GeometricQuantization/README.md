# Roadmap: prequantization and polarized geometric quantization

**Summary.** Build prequantum circle and Hermitian line bundles, lifts of Hamiltonian
symmetries, polarized sections and their Hilbert spaces. Develop the real and
Kähler polarizations and compute the cotangent, torus and projective examples.
Integrality, flat twists, polarization and the domain of a quantum operator
are mathematical data; each must remain visible in the API.

## Scope and ownership

This roadmap owns symplectic specializations of prequantum bundles, intrinsic
Hamiltonian lifts and their quantum operators, homogeneous character and
fixed-moment tests, polarized quantization, and the compact-torus distribution
and regular orbifold chamber theorems. Layer 3 owns the integral root-curve
and ordinary holomorphic Picard comparisons for compact flags needed by the
character/period dictionary. The generic holomorphic exponential-sequence and
Chern comparison belongs to ComplexComparisonPartII C5.4; the flag application
here proves its vanishing hypotheses and identifies its degree basis.

SmoothBundlesConnections B1–B6 owns principal/associated bundles, connections,
curvature, holonomy, integral existence and flat twists. HamiltonianSystems
owns Hamiltonian fields and the Poisson bracket; SymplecticGeometry's
CotangentLagrangian C1 and HamiltonianReduction R1–R3 own the cotangent,
coadjoint and reduced manifolds. DifferentialGeometry owns differential-form
calculus, integration and flows. ComplexKahlerGeometry K1–K7 owns the type,
Dolbeault, Hermitian and projective-section foundations. Orbifolds O1–O5 owns
the full-isotropy bundle and integration theory. Their constructions are
consumed with the contracts below. Generic character composition, kernels
and quotient lifting are Mathlib operations, not new character wrappers.

The acceptance file is Suggested.lean. Its module docstring lists the
headline theorems and the geometric carriers needed to state them; coordinate
calculations and API checks live in this README.

## Conventions

Use finite-dimensional Hausdorff second-countable smooth symplectic manifolds
without boundary, with `ω : TauCeti.SmoothTwoForm I M` and `ω.IsSymplectic`.
The symplectic linear/manifold structures are Tau Ceti's. Use the
HamiltonianSystems, Hamiltonian-vector-field and Poisson-bracket targets
for `ι_(X_f)ω=df` and `{f,g}=df(X_g)=ω(X_f,X_g)`, so
`[X_f,X_g]=-X_{ {f,g} }`. Consume DifferentialGeometry 0.4's form migration
and LieGroupoidsPoisson G4.2a's legacy Hamiltonian adapter for this convention.


Fix a real `ℏ>0`. A prequantum principal circle bundle has real connection
`a`, normalized by `a(V)=1` for the generator of `t↦exp(it)`, and
`da=π*(ω/ℏ)`. Its associated line uses the dual circle character, as in
[SmoothBundlesConnections](../SmoothBundlesConnections/README.md), so
`F_∇=-(i/ℏ)ω` and `c₁(L)_ℝ=[ω/(2πℏ)]`. Fix Kähler positivity as `g(u,v)=ω(u,Jv)`.
Connections, integral class,
gauge equivalence, flat holonomy and the torsor of fixed-curvature connections
are that roadmap's B3–B6; consume them, including their torsion data.

With these conventions the connection-preserving lift of a real function is
`Y_f=-(X_f)^hor+(f/ℏ)V`, and the prequantum operator is
`Q_f=iℏ∇_(X_f)+f`. Then `[Y_f,Y_g]=Y_{ {f,g} }` and
`[Q_f,Q_g]=-iℏ Q_{ {f,g} }`. This sign is part of the specification.
On vertical cotangent sections `Q_p=iℏ∂_q` and `[Q_q,Q_p]=−iℏ`.
Prove the alternate-sign dictionary by the antiunitary conjugation
`L→L̄≃L*`: it intertwines Q with `Q′_f=−iℏ∇^(L*)_(X_f)+f`,
whose commutator is `iℏQ′_{ {f,g} }`. Constants act by their
ordinary scalar value. Smooth compactly supported sections form the common
domain for the initial operator identities; no bounded-operator or
everywhere-defined unbounded-operator assertion is intended.

**Checks.**

- On the plane with θ=p dq, dθ=dp∧dq=−ω; hence da=ω/ℏ and
  F_∇(∂q,∂p)=−i/ℏ, fixing the dual-character sign.
- For q,p on that plane, X_q=−∂p, X_p=∂q and {q,p}=1;
  on a polarized test function q, [Q_q,Q_p]q=−iℏq.
- On a point ω=0 and Q_c=c; the zero function gives Y₀=0 and Q₀=0.
  ℏ=0 is excluded, so none of the displayed divisions uses a totalized zero inverse.

## Exact supplier contracts

### From Mathlib

Use `CovariantDerivative` in
`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean`,
`LinearPMap` for partial operators, `LieSubalgebra` for observable Lie algebras,
and `jacobiTheta₂` with its translation and summability theory.
`ContinuousMonoidHom.comp` in `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean`,
`MonoidHom.ker`, and `QuotientGroup.lift`, `QuotientGroup.lift_mk`,
`QuotientGroup.lift_comp_mk'` in `Mathlib/GroupTheory/QuotientGroup/Defs.lean`
supply character restriction and algebraic descent. `continuous_quot_lift`
supplies continuity for the quotient topology; none of these operations
asserts smoothness of a homogeneous bundle or constructs a stabilizer.

### From Tau Ceti

Use `TauCeti.SmoothTwoForm` and `TauCeti.SmoothTwoForm.IsSymplectic` in
`TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean`, the latter bundling
closedness and fibrewise nondegeneracy, with manifold separation assumptions
as fixed in Conventions. The smooth parameter ODE estimates in
`TauCeti/Analysis/ODE/SmoothParameter.lean` support the flow applications.
The compact-circle and formal-character inputs are specified in Layer 6.

### From TauCetiRoadmap.DifferentialGeometry

Consume §0.4's two-form migration, §1.4's Cartan calculus, Layer 3 and §3.5's
smooth parameter-dependent flows, Layer 4's Frobenius theorem, §5.4's homotopy
operator, and Layers 5–8's integration, densities and de Rham comparison.

### From TauCetiRoadmap.SmoothBundlesConnections

B1.4 supplies the actual closed-subgroup quotient and its local sections;
B2.1 the associated bundle and section dictionary; B2.2/B2.4 the Hermitian
L² space, smooth density and density of compactly supported smooth sections.
B3–B5 supply connections, curvature, constant connection-preserving gauge
ambiguity and holonomy. B6.2–B6.5 supply the integral Chern class, integral
existence and flat fixed-curvature torsor, retaining torsion and flat data.

### From TauCetiRoadmap.HamiltonianSystems and TauCetiRoadmap.LieGroupoidsPoisson

HamiltonianSystems Layer 1 supplies the contraction and Poisson conventions,
Layer 2 the Hamiltonian dynamics, and Layer 3 the moment-map Lie cocycle.
LieGroupoidsPoisson §G4.2a supplies the legacy Hamiltonian adapter.

### From TauCetiRoadmap.SymplecticGeometry

[CotangentLagrangian C1](../SymplecticGeometry/CotangentLagrangian/README.md)
supplies cotangent geometry. [HamiltonianReduction R1–R3](../SymplecticGeometry/HamiltonianReduction/README.md)
supplies group-level Hamiltonian actions, actual coadjoint homogeneous spaces,
R2a's finite even-cell model, and regular reduced symplectic orbifolds.
[ConvexityToric T1/T3/T4](../SymplecticGeometry/ConvexityToric/README.md)
supplies character periods, translated moment-square gradient convergence,
and the raw Liouville Duistermaat–Heckman measure and free-chamber density,
including its comparisons with full-isotropy reduced volumes.

### From TauCetiRoadmap.OperatorTheory

[SelfAdjointSpectralTheory Part A](../OperatorTheory/SelfAdjointSpectralTheory/README.md)
supplies graph cores, the von Neumann criterion and the comparison to the native
Stone theorem for Mathlib's `LinearPMap` and Tau Ceti's resolvent/group APIs.
Layer 2 proves the complete-flow geometric core result for its section operators.

### From TauCetiRoadmap.ComplexKahlerGeometry

K1/K2 supply type bundles and Dolbeault calculus, K3 locally bounded holomorphic
extension, K4 holomorphic/Hermitian bundles and Koszul–Malgrange, K5a/K5b.1
compact bundle elliptic and Dolbeault theory, K6.0/K6.1 curvature identities
and Kähler Hodge theory, and K7.1–K7.2 projective/torus carriers, O(k), the
section/polynomial dictionary and normalized Fubini–Study form.

### From TauCetiRoadmap.ComplexComparisonPartII

[C0.3](../ComplexComparisonPartII/README.md) supplies the holomorphic
line/locally-free-sheaf dictionary; C1.7–C1.9 supply analytic twists, analytic
Serre vanishing and projective/proper GAGA. C5.1 supplies the sheaf/singular
comparison and C5.4 the exponential-sequence connecting map and integral Chern
normalization. Layer 3 proves the flag-specific vanishing and root-degree
identification. Layer 6 constructs the positive-line embedding and the finite
list of residue twists needed for vanishing at every large tensor power.

### From TauCetiRoadmap.IndexTheory and TauCetiRoadmap.PseudodifferentialOperators

IndexTheory I6/I7.3 supplies the ordinary index and Dolbeault-symbol comparison,
and I8.4 the group section-action convention. PseudodifferentialOperators P1–P2
supplies the smooth differential/symbol floor. Layer 6 constructs the general
fixed-component equivariant character formula, the reduced orbifold Dolbeault
index and its inertia formula, extending the smooth floor to finite invariant charts.

### From TauCetiRoadmap.Orbifolds

[O1–O5](../Orbifolds/README.md), in particular O4-T/O4-W/O4-S/O5, supplies
full-isotropy orbibundles, weighted integration, and the cohomological comparison
maps on the actual reduced presentations. Keep these maps and all isotropy
characters in the Layer 6 descent and index construction.

### From TauCetiRoadmap.RepresentationTheory

[CompactGroups](../RepresentationTheory/CompactGroups/README.md) supplies the
circle Fourier characters and character projections. [LieGroups Layers 4–8](../RepresentationTheory/LieGroups/README.md)
supplies Lie integration, simply connected covers and kernels, compact real
root/rank-one data and torus periods, complexification and the homogeneous
full-flag comparison. Layer 3 constructs its root-curve degree and partial-flag
adapters; Layer 6 constructs the product-torus character-lattice conversion.

### From TauCetiRoadmap.AlgebraicTopology

Stages 4–6 supply integral cellular/singular comparison and universal
coefficients, applied to HamiltonianReduction R2a's even-cell model. Layer 3
identifies its root-curve generators and their integral degree pairing.

## How to read the build

Layers 1 and 2 specialize bundles and build intrinsic lifts, operators and
complete flows. Layer 3 builds homogeneous descent and ordinary flag degrees.
Layer 4 defines polarizations and their observable algebra; Layer 5 constructs
the cotangent, projective and torus quantizations. Layer 6 first builds the
positive-line, character, semistable and reduced-index interfaces, then proves
the distribution and uniform chamber conclusions. The labels Q1, Q2, Q2A,
Q3, Q4 and Q5 identify these six layers, respectively.

## Layer 1: Prequantum objects (Q1)

### 1.1 Symplectic specialization and the exact line

Specialize SmoothBundlesConnections B3–B6 to `F=ω/ℏ`: package the circle
bundle, real connection and curvature identity, expose the dual-character
Hermitian line, integral class and connection-preserving isomorphisms. Consume
B6.3 existence and B6.5 fixed-curvature torsor results, including distinct
flat holonomy and torsion data. Develop the symplectic pullback, product,
dual and integer-power specializations and their normalization formulas,
with coherent comparison maps. These are wrappers around the supplier's
objects, not independent circle-bundle constructions.

For an exact symplectic manifold `ω=−dθ`, construct the trivial prequantum
line with `∇=d+iθ/ℏ`; the principal potential is `A=−θ/ℏ` and the circle
connection is `a=dt−π*θ/ℏ`. Prove the section/equivariant-function dictionary
from B2, `s̃(p exp(it))=exp(it)s̃(p)`, hence `V s̃=i s̃`.
Compute line holonomy `exp(−(i/ℏ)∮θ)` and, for a bounding cycle, its expression
`exp((i/ℏ)∫ω)`; principal holonomy is its inverse. Changing θ by a closed
form β changes line holonomy by `γ↦exp(−(i/ℏ)∮_γβ)`.

Acceptance: cotangent bundles with tautological θ; a sphere of area
`2πℏk`, k≥1; and flat twists of a degree-k prequantum torus. Construct
connections and their loop holonomy in every example.

- Symplectic pullback carries the connection and its curvature to their pullbacks;
  tensor, dual and integer powers add, negate and multiply the curvature and Chern class.
- The exact-line trivialization identifies sections with equivariant functions and sends
  the vertical derivative to multiplication by i.
- Changing the primitive by a closed form changes the flat character by its periods;
  it does not change the curvature class.

**Checks.**

- On T*ℝ, θ=p dq gives F_∇(∂q,∂p)=−i/ℏ and integral class zero.
- On a positively oriented sphere of area 2πℏk, the Chern number is k; k=1 gives O(1)
  and dualizing gives −1. Area πℏ gives 1/2 and fails the integrality test.
- On a q-circle with closed change β=ℏ dq/2 of period ℏ/2 (q has period 1),
  the line-holonomy multiplier is exp(−i/2), while curvature change is zero;
  a change with period 2πℏ has multiplier 1.

*Needs:* SmoothBundlesConnections B2/B3/B4/B5/B6.3–B6.5;
CotangentLagrangian C1; DifferentialGeometry Layers 5–8.

### Examples

The cotangent exact line, degree-k sphere and flat-twisted torus distinguish
curvature, integral degree and flat holonomy.

### Dependencies

SmoothBundlesConnections B1–B6 and CotangentLagrangian C1; no quantum operator
or polarization is a premise.

## Layer 2: Hamiltonian lifts and prequantum operators (Q2)

### 2.1 Intrinsic lifts and the sign comparison

Construct `Y_f`, prove `L_(Y_f)a=0`, projection `−X_f`, and uniqueness
with the specified vertical component `a(Y_f)=π*(f/ℏ)`. All
circle-invariant connection-preserving fields projecting to `−X_f` are
`Y_(f+c)` for locally constant c. Prove linearity, bracket identity and the
Lie-algebra exact sequence with locally constant vertical functions and Hamiltonian fields.
For a symplectic field the exactness of its contraction with ω is the
obstruction to such a lift. Prove these assertions against the global
function/field objects and the componentwise cohomology sequence.

Build the convention comparison for arbitrary specified lifts as well. If a
circle-invariant field F projects to a base field H and satisfies
`a(F)=π*(f/ℏ)`, prove by Cartan's formula
`L_F a=(1/ℏ)π*(ι_Hω+df)`. Pullback by the principal projection is injective
on forms, using its local sections; nondegeneracy of ω then gives that F
preserves a iff `H=−X_f`. For `H=+X_f`, the derivative is
`(2/ℏ)·π*(df)`, which vanishes iff f is locally constant. At ℏ=1 this compares the
normalization `dφ=π*ω`, `φ(F)=π*f` and potential
`φ=dt−Σp_i dq_i` with Y_f; here t is the fiber angle and Q1's θ
is the tautological primitive, so this φ is Q1's a at ℏ=1. Keep the generator normalized by a(V)=1;
changing ℏ changes curvature and the vertical term together, and is not a
rescaling of the connection alone. State both conditional bracket formulas:
for `Y_f=−X_f^hor+(f/ℏ)V`, prove `[Y_f,Y_g]=Y_{ {f,g} }`; for
`F_f=+X_f^hor+(f/ℏ)V`, prove
`[F_f,F_g]=F_{−{f,g}}−(2{f,g}/ℏ)V`, whose connection value is
`−3{f,g}/ℏ`. Thus the latter assignment is not a Lie-algebra homomorphism
in general. These formulas do not identify an unspecified H with either sign.

- The lift is real-linear in f, has projection −X_f and connection value f/ℏ,
  and its bracket is the lift of the declared Poisson bracket.
- The comparison with the opposite horizontal sign retains its extra vertical term;
  a change of base-field sign is not a change of connection alone.

**Checks.**

- On the plane at ℏ=1, Y_q=∂p+q∂t, Y_p=−∂q and [Y_q,Y_p]=∂t=Y₁.
- The opposite lifts are F_q=−∂p+q∂t and F_p=∂q+2p∂t;
  their bracket is −3∂t, agreeing with F_(−1)−2V.
- For c constant, Y_c=(c/ℏ)V and L_(Y_c)a=0; on a point this is the whole lift.

*Needs:* Layer 1; HamiltonianSystems' contraction and Poisson identities;
DifferentialGeometry §1.4's Cartan calculus; SmoothBundlesConnections B3/B4.

### 2.2 Operators and their complete-flow domains

Define Q on smooth sections and prove `Q_f=−iℏY_f` on equivariant functions,
constants, linearity, Leibniz, and the common-domain commutator. Construct
its L² domain as compactly supported smooth sections in SmoothBundlesConnections
B2's Hilbert space, identifying its density with ConvexityToric T4's
Liouville density `ω^n/n!`. Consume B2's chartwise Lp comparisons and density;
prove formal symmetry for real f by integration by parts. Use Mathlib's
`LinearPMap` partial-operator carrier with Tau Ceti's resolvent API. Define essential
self-adjointness of a densely defined symmetric A by self-adjointness of
its graph closure, supplying the closure/adjoint comparison needed here.

If X_f is complete, prove Y_f complete and construct the unitary transport
`U_t s̃=s̃∘Φ_t`, where Φ is its flow. Prove strong continuity and that
its Stone generator A in the `(U_t−1)/(it)` convention contains
`C_c^∞` in its domain and agrees there with `Q_f/ℏ`. Its full domain is
that of the closure of this restriction.
Prove the invariant-dense-domain core theorem used here, then invariance
of `C_c^∞` and essential self-adjointness of Q on that domain. Complete
Hamiltonian flow is the hypothesis; compact M is a corollary. For incomplete
flows keep the symmetric operator and explicit domain, with no uniqueness
claim for self-adjoint extensions. Compute the deficiency behavior of
momentum `Q_p=iℏ∂_q` on `T*(0,∞)`: with
`n_+=dim ker(Q_p*−i)` and `n_−=dim ker(Q_p*+i)`, prove `n_+=0`
and `n_−=∞`, the latter containing `e^(−q/ℏ)g(p)` for every
`g∈L²(ℝ)`. On the base half-density space the indices are `(0,1)`.
These show failure of essential self-adjointness; define the deficiency
spaces and prove the closure/adjoint kernel criterion used in this example.

- The operator is real-linear in f, satisfies the section Leibniz rule and is symmetric
  on its compactly supported smooth domain for real f.
- Essential self-adjointness refers to the graph closure; complete flow yields a strongly
  continuous unitary group whose generator has precisely that closure domain.

**Checks.**

- At ℏ=1 on vertical plane sections, Q_q(q)=q² and Q_p(q)=i;
  Q_q Q_p(q)−Q_p Q_q(q)=iq−2iq=−iq.
- For f=c, U_t=exp(itc/ℏ) and (U_t−1)/(it) tends to c/ℏ,
  so its Stone generator agrees with Q_c/ℏ.
- For iℏ∂q on the half-line, the +i deficiency equation gives exp(q/ℏ), not L²;
  the −i equation gives exp(−q/ℏ), with squared norm ℏ/2. The indices are (0,1)
  on base half-densities and (0,∞) after tensoring with L²(ℝ_p).

*Needs:* §2.1; SmoothBundlesConnections B2.2/B2.4; ConvexityToric T4;
OperatorTheory/SelfAdjointSpectralTheory Part A's graph-core and Stone comparisons;
DifferentialGeometry Layer 3's flows and Layer 5's integration by parts.

### 2.3 Lifted actions and central extensions

For the group-action statements assume M and the acting Lie group G
connected and nonempty. For a moment map write
`c(ξ,η)={μ^ξ,μ^η}−μ^[ξ,η]`. Prove that the lift defect is
`(c(ξ,η)/ℏ)V`; an equivariant μ has c=0. Cite HamiltonianReduction R1
for the group-level moment-map defect and HamiltonianSystems for its
Lie-algebra cocycle. Prove lifted fundamental fields are complete using
completeness of base group-action fields and the compact circle fibers.

For equivariant μ integrate the anti-homomorphism `ξ↦−Y_(μ^ξ)` to a
left action of the simply connected cover G̃ on the bundle. Prove the
complete-vector-field integration theorem (Palais) needed for this step,
with its uniqueness and parameter smoothness. The action projects to the
original left action on M. Its kernel K acts by a circle character χ;
descent to G holds iff χ is trivial. Construct
`Ĝ=(G̃×Circle)/{(k,χ(k)⁻¹):k∈K}` and its action, and prove its Lie
and principal-central-extension structure. For a non-equivariant μ
construct the pullback of the connection-preserving bundle-automorphism
group over G, prove it is a finite-dimensional smooth circle extension,
and pin its Lie algebra by the anti-homomorphism
`(ξ,s)↦−Y_(μ^ξ)+sV` and bracket
`[(ξ,s),(η,t)]=([ξ,η],−c(ξ,η)/ℏ)`. Construct local lifts of `exp ξ`
by time-one flows of `−Y_(μ^ξ)`. Prove any two lifts differ by a constant
circle element, using connected M and B4's connection-preserving gauge
subgroup. These lifts give identity charts `(ξ,z)`; prove their smooth
transitions, multiplication and inversion using smooth parameter-dependent
manifold flows from DifferentialGeometry 3.5. In charts the local parameter
ξ enters linearly and the field vanishes at ξ=0; apply Tau Ceti's
`Analysis/ODE/SmoothParameter` estimates and glue by flow uniqueness. Prove that for equivariant μ this pullback
extension is isomorphic, as an extension with action, to the quotient
`(G̃×Circle)/K` above. These constructions supply circle extensions for
moment-map defects, with no arbitrary-cocycle integrability assertion.

- The kernel character multiplies under composition and controls descent through the
  specified covering; the pullback extension retains its action on the same bundle.
- The local time-one lifts define the smooth extension structure, with the Lie bracket
  dictated by the moment defect rather than by an arbitrary Lie-algebra cocycle.

**Checks.**

- For the trivial group the pullback extension is Circle and its Lie bracket is zero.
- For the SO(3) sphere with degree k, the SU(2) covering kernel acts by (−1)^k;
  degrees 1 and 2 give respectively −1 and 1, distinguishing failed and successful descent.
- For translations on (ℝ²,dq∧dp), μ^q=q and μ^p=p have defect 1;
  the lifted extension has central bracket −1/ℏ, while the zero moment defect gives zero.

*Needs:* §§2.1–2.2; HamiltonianReduction R1; HamiltonianSystems' moment cocycle;
LieGroups Layers 4–5; SmoothBundlesConnections B4's constant gauge subgroup;
DifferentialGeometry Layers 3–4 and Tau Ceti smooth parameter ODE estimates.

### Examples

The complete translation flow, incomplete half-line momentum and SO(3) covering
separate analytic core, completeness and global descent conditions.

### Dependencies

Layer 1, HamiltonianSystems, HamiltonianReduction R1, the named spectral and
smooth-flow contracts, and LieGroups Layers 4–5.

## Layer 3: Homogeneous prequantization and ordinary periods (Q2A)

Distinguish an ordinary prequantum line from a linearization by the specified
acting group. Retain Q1's ℏ>0, the right-circle action exp(it), a(V)=1,
da=π*ω/ℏ, the dual associated line, F_∇=−iω/ℏ and
c₁(L)=[ω/(2πℏ)]. For a positive left fundamental vector ξ_M, Q2's lifted
field is −Y_(μ^ξ), hence its connection value is −μ^ξ/ℏ. Preserve these
signs in every homogeneous, character and curvature comparison below.

### 3.1 Homogeneous characters and actual descent (Q2A.1)

 For a finite-dimensional
Lie group G and a closed subgroup H, consume SmoothBundlesConnections B1.4's
actual principal quotient G→G/H and associated-bundle construction. Build the
equivalence between smooth G-equivariant complex lines over G/H and smooth
characters λ:H→ℂ× by evaluation on the fibre at eH and the inverse
L_λ=(G×ℂ)/((g,z)·h=(gh,λ(h)⁻¹z)). Include equivariant maps, unit, tensor,
dual, change of basepoint/conjugation, restriction, pullback and products.
(The associated quotient is Graham–Vogan, *Geometric quantization for nilpotent
coadjoint orbits*, Example 5.8, p. 25; the inverse by fibre evaluation and the
central-descent test are deductions using the displayed quotient relation.)
For unitary homogeneous lines use characters into Circle, with the actual
metric and unit-circle reduction. The principal-circle character is λ⁻¹,
not λ. Construct the corresponding continuous and smooth character
dictionaries and uniqueness of a continuous homomorphism from its derivative
when its source is connected; do not determine a character of disconnected H
from its derivative alone.

For a central covering p:G̃→G with kernel F, construct the action descent
equivalence: a G̃-linearized line descends to G exactly when every f∈F acts
as the identity on every fibre. On a homogeneous line this is the restriction
of its actual stabilizer character to F. Construct the descended action and
its inverse pullback, including bundle, connection, holomorphic-structure and
moment-map compatibility under their respective invariance hypotheses.
For compact connected homogeneous flags identify the difference between two
linearizations of the same holomorphic line with an actual character of K,
using constancy of holomorphic units. Do not assert this description for
arbitrary noncompact spaces with nonconstant invertible functions. On a
connected base the connection-preserving gauge ambiguity is constant Circle;
flat twists of ordinary prequantizations remain H¹(M;ℝ/ℤ) as in Q1/B6.

- Evaluation at eH and the associated-line construction are inverse on objects and maps.
- Tensor, dual and restriction correspond to product, inverse and restriction of characters.
- Descent through a central cover holds exactly for trivial action of its full kernel;
  on disconnected stabilizers the derivative alone is insufficient.

**Checks.**

- For H=1 the associated line is G×ℂ, and evaluation has trivial character.
- For H=μ₂, the trivial and sign characters both have zero derivative, but send −1
  to 1 and −1; only the former descends through the quotient killing μ₂.
- For H=S₃ the sign character has kernel A₃, with 3 elements; its quotient C₂
  character takes the nonidentity coset to −1. Native kernel and quotient lifting suffice.

*Needs:* SmoothBundlesConnections B1.4/B2.1; LieGroups Layers 0–5;
Mathlib character composition, kernels and quotient lifting; ComplexKahlerGeometry
K3's constancy of holomorphic functions on connected compact manifolds for the flag ambiguity.

### 3.2 Coadjoint characters and period maps (Q2A.2)

 Work on HamiltonianReduction
R2's actual homogeneous coadjoint orbit G/H, H=G_μ₀, with moment map the
coadjoint inclusion and KKS form ω(ξ_M,η_M)=μ([ξ,η]). A prequantum lift
with this fixed moment map exists exactly when there is a smooth character
λ:H→Circle with λ(exp(tξ))=exp(it μ₀(ξ)/ℏ) for every ξ∈Lie(H).
The criterion involves the full H, including its components. This is the
one-dimensional case of the stabilizer differential condition in Graham–Vogan,
Definition 6.4, p. 37, with their additive character chosen as exp(it/ℏ); the
connection equivalence is the Maurer–Cartan construction that follows. Their
higher-dimensional orbit data are not substituted for line characters. Construct both
directions, not just a differential condition: evaluate the lifted fibre
action, and conversely put a=dt−⟨μ₀,θ_left⟩/ℏ on G×Circle. Prove it is
basic for the principal character λ⁻¹, descends to the associated principal
bundle, has curvature ω/ℏ and has Q2's lifted moment value. Prove uniqueness
of this invariant connection at fixed λ and fixed μ₀ by transitivity. Use
the Maurer–Cartan equation with its factor1/2 and explicitly compare the
quotient tangent map, HR's positive left fundamental fields and Q2's signs.

For compact connected K use HR R2's connected coadjoint centralizer H and
LieGroups' actual maximal torus T⊂H and compact root datum. Write Y=X_*(T)
and define ι:Y→𝔱 by y(exp(2πit))=exp_K(2πtι(y)). For a character ν of T
write ν(exp X)=exp(iℓ_ν(X)); then ℓ_ν(ι(y))=⟨ν,y⟩. Construct these maps,
their differential identities and the perfect character/cocharacter pairing.
For a noncollapsed positive root curve C_α, oriented by the negative-Borel complex flag,
prove

∫_(C_α) ω/(2πℏ)=μ₀(ι(α∨))/ℏ=⟨λ|_T,α∨⟩

when λ exists. Establish the integral formula directly in the actual compact
rank-one subgroup and transport its quotient sphere, tangent map and
orientation; a root-system name or a dimension count is not that transport.
Use §3.3's actual root-curve generators of H₂(K/H;ℤ) to characterize ordinary
prequantizability by these coroot periods. Specified-K equivariance instead
requires the character of H, or equivalently the appropriate full Y-lattice
condition with the stabilizer-root vanishing. Central moment components do
not change ω but do change this character condition. Twisting a
linearization by a character η of K changes μ by ℏℓ_η in these conventions;
keep the fixed-moment and variable-moment existence problems separate.

- The invariant connection has the prescribed curvature and moment map, and evaluation
  of its fibre action recovers exactly the character used in its construction.
- Coroot periods detect ordinary integrality; the full cocharacter lattice detects the
  prescribed-group lift. A central moment shift changes only the latter test.

**Checks.**

- With ℏ=1 the SO(3) radius-1/2 sphere has area 2π and ordinary degree 1,
  but the period-2π stabilizer character would have weight 1/2 and cannot exist.
- On its SU(2) cover the coroot pairs to 1 and the central element −I acts by −1;
  radius 1 has degree 2 and central action +1.
- On a point orbit of Circle, ω=0 for every central moment; moments 0 and 1
  give characters 1 and z, whereas moment 1/2 fails exp(2πiμ)=1.

*Needs:* §3.1; HamiltonianReduction R2; LieGroups Layer 6;
ConvexityToric T1's character/cocharacter period normalization;
§3.3 only for the inference from all root periods to ordinary integrality.

### 3.3 Integral root curves and the ordinary holomorphic Picard group

Let K be compact and connected, H its coadjoint centralizer, and I the simple
roots of its Levi factor for a fixed chamber face. On the actual K/H construct
the rank-one root spheres for simple roots outside I using LieGroups Layer 6's
rank-one subgroups. Compare their quotient tangent maps with HamiltonianReduction
R2a's oriented two-handles: the characteristic map of each two-cell represents
the corresponding root sphere with degree +1. Prove that these classes give a
basis of H₂(K/H;ℤ), and that evaluation gives
H²(K/H;ℤ)≃ℤ^(Δ∖I). This is a root-labelled comparison with the supplied
cellular/singular map, not a second construction of the even-cell model.
Prove naturality for flag projections, products and finite central coverings.
The simply connected derived cover gives fundamental-weight associated lines;
the rank-one transition of its jth line has degree δᵢⱼ on the ith root sphere.
This degree matrix also checks the orientation of the characteristic maps.

Give K/H its invariant complex structure from the chosen negative parabolic:
the non-Levi root spaces determine the (1,0) tangent space, and their bracket
closure proves integrability. Identify it with the complex homogeneous flag
using the quotient charts and LieGroups Layer 8's full-flag comparison, followed
by the parabolic projection. A coadjoint element in the relative interior of
the face supplies a positive invariant Kähler form; this construction needs no
integral weight or projective embedding.

Define its ordinary holomorphic Picard group as tensor-isomorphism classes of
ComplexKahlerGeometry K4's holomorphic lines. Use ComplexComparisonPartII C0.3's
bundle/sheaf dictionary to identify it with H¹(K/H,𝒪×) by transition cocycles.
For this compact flag prove H^q(K/H,𝒪)=0 for q>0: connected K acts trivially on
de Rham cohomology by isotopy, and uniqueness of harmonic representatives for
the invariant Kähler metric makes every harmonic (0,q)-form K-invariant.
The T-weights of its fibre at eH are sums of q roots of one strict sign outside
the Levi. For q>0 they pair strictly with the chosen face element, so no weight
is zero; for q exceeding the complex dimension the exterior power is zero.
Apply the exponential-sequence segment from ComplexComparisonPartII C5.4 to get
Pic_hol(K/H)≃H²(K/H;ℤ)≃P_I, with the actual integral Chern and degree maps.
This is a deduction from the vanishing just proved and the exponential sequence
(Demailly, V §11, p. 267; VI §9.1, equation (9.1), p. 314), not an assumption
that ordinary lines already carry a K-linearization.

- Tensor product adds degrees, the dual negates them, and the trivial line has all degrees zero.
- The Chern map is bijective on these compact flags, and evaluation on the root curves identifies
  it with the fundamental-weight basis; torsion is excluded by the integral cell comparison.
- Pullback along a parabolic projection is the inclusion of weights vanishing on the larger Levi;
  products give direct sums, and a finite central covering induces an isomorphism of ordinary flags
  and Picard groups while changing the equivariant character lattice.

**Checks.**

- For the rank-one flag ℂP¹, the degree matrix is (1), H²=ℤ and c₁(O(k))=k;
  replacing the degree matrix by (2) would lose the ordinary line O(1).
- For SU(3)/T the two simple-root curves and fundamental lines have degree matrix
  ((1,0),(0,1)); for a maximal-parabolic ℂP² the surviving matrix is (1).
- For I=Δ, including a torus or the trivial group, the flag is a point,
  H²=0 and Pic_hol=0; H⁰(𝒪)=ℂ and H^q(𝒪)=0 for q>0.
- A complex elliptic curve has h^(0,1)=1 and nontrivial degree-zero Picard classes;
  the Chern map is not injective there, so the flag vanishing hypotheses are essential.

*Needs:* §3.1's associated lines; §3.2's rank-one period computation;
HamiltonianReduction R2/R2a's homogeneous orbit, root tangent planes and even-cell model;
LieGroups Layers 6–8's rank-one groups, complexification and full-flag quotient;
AlgebraicTopology Stages 4–6's integral cellular/singular comparison;
ComplexKahlerGeometry K1/K2/K4/K5b.1/K6.1; ComplexComparisonPartII C0.3/C5.1/C5.4.

### 3.4 Global forms and boundary tests (Q2A.3)

 Construct the actual finite central
cover D_sc×Z₀→K, its finite kernel F, the induced stabilizer maps and the
isomorphism of flag manifolds. This is a finite quotient, not a direct-product
decomposition of K. The ordinary full-flag Picard lattice is the weight
lattice P=Hom(Q∨,ℤ) of the simply connected derived group; the equivariant
lattice is X^*(T). The forgetful map is restriction/pairing X^*(T)→P. Its
kernel is the restriction of characters of K. Its image consists exactly of
those p∈P for which there exists a character ν of Z₀ such that (p,ν) is
trivial on F. Prove this using actual characters and the quotient map,
including F∩D_sc and the mixed central gluing. For a partial flag with Levi
simple roots I replace P by P_I={p:⟨p,α_i∨⟩=0 for i∈I} and X^*(T) by
characters extending to H; prove the analogous maps and rank r−|I|, r=|Δ| the semisimple rank, for
the ordinary lattice. Section 3.3 proves the ordinary holomorphic Picard comparison;
the character/descent calculation here does not assume Borel–Weil. It is a
deduction from §3.1 and §3.3 (Graham–Vogan, Example 5.8, p. 25; Demailly,
VI §9.1, equation (9.1), p. 314), with the central-kernel restriction proved here.

For semisimple K the forgetful map is injective, surjective for simply
connected K, and has image the root lattice for adjoint K. A torus has point
flags, ordinary Picard group0, equivariant Picard group X^*(K) and zero
forgetful map. A point orbit at central μ₀ has an ordinary trivial
prequantization, but the prescribed moment still requires a character with
the prescribed derivative. Include the trivial group, rank0, full-Levi point
case, products and finite central quotients; do not use a positive-dimensional
sphere formula at radius0.

For SO(3) fix HR's unit rotation generator Z with period2π. Its radius-r>0
orbit has area4πr, so ordinary prequantization requires k=2r/ℏ∈ℤ.
Identify the same oriented flag with ℂP¹ and O(k). Construct the actual
SU(2)→SO(3) and SU(2)/T→S² maps. In the negative-Borel base line [e₂],
diag(z,z⁻¹) acts on the fibre of O(k) by z^k, so −I acts by (−1)^k.
Thus every integer k gives an SU(2) lift and an SO(3) lift exists exactly
when k is even. Prove necessity for every possible lift, not just failure
of one chosen construction. Compare d p(diag(i,−i)) with twice the chosen
SO(3) generator (fixing the pole/orientation sign in the actual map), and
with HR's period4π Pauli basis; this accounts for the factor2. O(1) on
S² is an ordinary prequantum line for area2πℏ, but is not SO(3)-linearized.
For negative k retain the dual-line and orientation-reversal calculation;
with the fixed positive symplectic orientation require k>0. At k=0 distinguish
the degree-zero line calculation from the point coadjoint orbit.

For U(N) on ℂP^(N−1), N≥2, use stabilizer U(N−1)×U(1) at [e_N]. Its
character det(A)^a z^b has ordinary degree a−b; the kernel a=b consists of
determinant characters of U(N). O(k) is a=0,b=−k. On SU(N) its central
ζI acts by ζ^(−k), hence descent to PU(N) holds exactly for N|k. Give
the actual restriction and quotient maps, including SU(2)'s compatible pole
choice. For U(n)/T verify ℤ^n→ℤ^n/ℤ(1,…,1), with determinant kernel;
for coadjoint eigenvalues ordinary periods test differences divided by ℏ,
whereas a fixed U(n) moment tests individual integral weights. Central shifts
must be recorded. N=1 is a point with no degree generator; N=0 has empty
projectivization, not an asserted ℂP^(−1) line classification.

- The ordinary degree lattice and the equivariant character lattice are related by
  restriction to coroots, with kernel the characters of K and the stated central-kernel image.
- The degree and descent maps commute with products, flag projections and finite central covers.

**Checks.**

- For SO(3), X*(T)→P is a↦2a: kernel 0, image 2ℤ; for SU(2) it is a↦a.
- For U(2) at [e₂], (a,b)↦a−b sends (1,1) to 0 and (0,−1) to 1;
  the latter line has central SU(2) phase −1 and does not descend to PU(2).
- For U(3), O(1) has central phase exp(−2πi/3), while O(3) has phase 1.
  For a torus the ordinary lattice is 0 and every character is in the forgetful kernel.

*Needs:* §§3.1–3.3; LieGroups Layers 5–8's covering and compact root data;
HamiltonianReduction R2's concrete SO(3), SU(2) and U(N) comparisons.

### Examples

SO(3), SU(2), U(N), a torus and the trivial group test ordinary versus
specified-group quantization, including the point and empty projectivization cases.

### Dependencies

Layer 1 and the named homogeneous, root, topology, Dolbeault and exponential-sequence
contracts. The root-curve comparison and holomorphic vanishing precede the ordinary
Picard conclusion; no section-exhaustion or Borel–Weil theorem is used to prove it.

## Layer 4: Polarizations and polarized sections (Q3)

### 4.1 Polarizations and leafwise equations

A real polarization is an involutive smooth Lagrangian subbundle of TM.
The complex polarization in this roadmap is `T^(0,1)M` of a Kähler manifold,
with the positivity convention above. Define polarized sections by
`∇_Zs=0` for **local** smooth polarization fields Z, prove the adapted
real-coordinate and holomorphic-chart equations and restriction/gluing.
For the real branch prove the parametric leafwise Poincaré lemma in Frobenius
charts from DifferentialGeometry's homotopy operator: a local potential
restricts to a closed one-form on each Lagrangian plaque and can be modified
by a smoothly parameterized exact form to vanish on P. Use that gauge to
construct local parallel sections and their complete leafwise equations.
This requires no adapted symplectic Darboux-chart assertion.
Connection-preserving isomorphisms carrying the polarization induce
isomorphisms of these spaces. Tensoring with a local parallel section of
an added flat line identifies the local equations; globally a flat twist
can change leaf holonomy and the space of sections.

- A real polarization has half the tangent rank, is isotropic and is closed under local
  vector-field brackets; its pullback by a symplectomorphism has these same properties.
- Polarized sections form a complex vector space and a sheaf under restriction and gluing.
  A connection-preserving polarized bundle isomorphism induces an isomorphism of this sheaf.
- For the Kähler polarization the equations are the Chern ∂̄ equations, and tensoring
  by a locally parallel flat section intertwines them.

**Checks.**

- On T*ℝ, span(∂p) has rank 1, ω(∂p,∂p)=0 and bracket closure;
  TM has rank 2 and ω(∂q,∂p)=1, so it is not a polarization.
- In the same trivialization, ∇_(∂p)q=0 but ∇_(∂p)p=1;
  q is a polarized section and p is not. Their restrictions obey the same equations.
- On a point the polarization is 0 and the polarized section space is the one-dimensional
  fibre; on the flat complex line ∂̄z=0 and ∂̄z̄=d z̄, selecting holomorphic sections.

*Needs:* Layer 1; DifferentialGeometry §4.3 and §5.4; ComplexKahlerGeometry
K1/K2/K4 for the Kähler branch.

### 4.2 Observable Lie algebra and basic functions

Characterize polarization-preserving real Hamiltonians by
`[X_f,Γ_local(P)]⊆Γ_local(P)`. Over the shared HamiltonianSystems
real Lie algebra of Hamiltonian smooth functions with the declared Poisson
bracket, construct their native `LieSubalgebra ℝ`: prove closure under
addition, real scalar multiplication and Poisson brackets, and inclusion of
constants. Use Jacobi for the normalizer of local polarization fields and
`X_{ {f,g} }=−[X_f,X_g]` for bracket closure. They need not be closed under
pointwise multiplication. Prove their Q operators preserve polarized smooth
sections and retain `[Q_f,Q_g]=−iℏ Q_{ {f,g} }` on the actual common domains
of Q2 and their invariant polarized restrictions; do not assert closure
under composition of first-order quantum operators.

For a real polarization, let A_P be the smooth real functions annihilated
by every local field in P. Prove A_P is a commutative subalgebra under
pointwise operations, its Hamiltonian fields lie in P, and it is contained
in the polarization-preserving Hamiltonians. The latter form an A_P-module
under pointwise multiplication: use `X_(af)=a X_f+f X_a`, the Leibniz rule
for vector-field brackets and involutivity of P.

Retain the vertical cotangent regression on `T*ℝ`, `ω=dq∧dp` and
`P=span{∂p}`: `X_p=∂q` normalizes every local vertical field, whereas
`X_(p²)=2p∂q` and `[X_(p²),∂p]=−2∂q` is not vertical. In Q1's
trivialization the smooth local polarized section `1` satisfies
`Q_(p²)(1)=−p²`, which is not polarized; this is a local smooth-section
test, not a claim that `1` lies in the compactly supported L² domain.
Keep Q4's fibre-affine classification and kinetic-energy exclusion.
- The polarization-preserving Hamiltonians form a real Lie subalgebra and act by Q
  on polarized sections. Their first-order operators are not closed under composition.
- The basic algebra A_P is closed under pointwise multiplication and its Hamiltonian
  fields lie in P; the observable Lie algebra is an A_P-module.

**Checks.**

- For vertical P, ∂p q=0, so q∈A_P.
- For the same P, ∂p p=1, so p∉A_P.
- On a point every derivative is zero and A_P=ℝ, retaining the rank-zero case.
- The observable p preserves P because [∂q,∂p]=0.
- The function p² fails since [2p∂q,∂p]=−2∂q. Thus the observable Lie algebra is not an algebra of products.
- For the polarized section 1, Q_(p²)1=−p² and ∂p(−p²)=−2p,
  excluding that observable. For basic a=q and observable f=p, af=qp remains affine in p.

*Needs:* §4.1; §2.1–§2.2; HamiltonianSystems' vector-field bracket and Leibniz laws;
Mathlib `LieSubalgebra` and the native subalgebra/module carriers.

### 4.3 Descent and Bohr–Sommerfeld leaves

For regular real polarizations with smooth
Hausdorff leaf space, prove descent and its holonomy obstruction. Define
Bohr–Sommerfeld leaves by trivial restricted prequantum holonomy and
prove their transport under bundle/polarization isomorphisms. Pullback
of polarized sections is stated for connection-preserving maps carrying
source polarization vectors into the target polarization; construct and
prove that precise pullback operation.

For the Kähler branch, curvature has type (1,1); consume
ComplexKahlerGeometry K4's Koszul–Malgrange theorem and identify polarized
smooth sections with holomorphic sections of the induced line bundle.
The positive `T^(0,1)` choice and Chern normalization are retained.

- A leaf supports a nonzero parallel section exactly when its restricted flat line has
  trivial holonomy; transport carries both that character and its parallel line.
- Pullback of sections is defined for connection-preserving maps sending source
  polarization vectors into the target distribution, and commutes with composition.
- The Kähler polarized sheaf is the holomorphic-section sheaf of the induced line.

**Checks.**

- A circular leaf with holonomy 1 has a one-dimensional parallel line; holonomy −1
  forces a parallel value v=−v, hence v=0 over ℂ.
- For k=2 and α=0 on the quantized torus, p=0 and p=1/2 have holonomy 1,
  whereas p=1/4 has holonomy −1; α=1/2 shifts the two leaves to 1/4 and 3/4.
- For a point leaf every loop has holonomy 1 and its parallel line is the fibre;
  the identity polarized map pulls a section back to itself.

*Needs:* §§4.1–4.2; SmoothBundlesConnections B5; DifferentialGeometry Layer 4;
ComplexKahlerGeometry K4's Koszul–Malgrange theorem for the complex branch.

### Examples

Vertical cotangent sections, shifted torus leaves and holomorphic sections
separate local equations, global holonomy and the choice of polarization.

### Dependencies

Layers 1–2, Frobenius and the parametric homotopy formula, and the named Kähler bundle theory.

## Layer 5: Quantization spaces and examples (Q4)

### 5.1 Cotangent and Schrödinger polarization

 On `T*Q` use the vertical
polarization and Q1's exact line. Identify polarized smooth sections
with functions on Q in coordinates and under cotangent lifts. Prove
the polarization-preserving Hamiltonians are exactly
`f(q,p)=⟨p,v(q)⟩+u(q)` with smooth v and u. Construct the real
half-density bundle as the positive square root of the density bundle,
its pullback and intrinsic `L²(Q;half-densities)` (Graham–Vogan, Definition 5.5,
pp. 23–24 and equation (5.7), pp. 24–25), whose inner product
integrates the product density without choosing a reference density.
Define the corrected operator on `L⊗π*|Λ|^(1/2)` by
`Q_f^(1/2)(s⊗π*ν)=Q_f s⊗π*ν+iℏ s⊗π*(L_vν)`;
prove it respects tensor balancing and polarized sections. Under the
cotangent trivialization prove `Q_f^(1/2)=iℏ L_v^(1/2)+u`, including the half-divergence term in a volume
trivialization. On Euclidean Q compute `Q_q=q`, `Q_p=iℏ∂_q` and the
canonical commutator. The domain is `C_c^∞` half-densities. For
complete v and real smooth u, construct the unitary flow with its
transported phase: if ψ is the flow of v, pin
`U_tφ=exp((i/ℏ)∫₀ᵗ u∘ψ_(−s) ds)·ψ_(−t)*φ`.
Prove its group law, strong continuity, domain invariance and
essential self-adjointness by Q2's core theorem. Kinetic energy is
not a polarization-preserving observable in this construction.
- The half-density transition is the positive square root of the absolute Jacobian;
  product of a half-density and its conjugate is a density, giving a coordinate-independent norm.
- The corrected operator respects tensor balancing, has half the divergence term in a
  volume frame, and its complete-flow realization is essentially self-adjoint on C_c^∞.

**Checks.**

- Under q↦2q a half-density pulls back by √2, so its squared norm gains 2,
  exactly the density Jacobian; the uncorrected scalar pullback lacks this factor.
- On ℝ, v=q∂q gives L_v^(1/2)φ=qφ′+φ/2, whereas v=∂q gives φ′.
  The zero vector field and u=c give Q=c and U_t=exp(itc/ℏ).
- For complete translation v=∂q and u=0, U_tφ(q)=φ(q−t);
  its derivative is −φ′=(i/ℏ)(iℏφ′), fixing the flow direction.

*Needs:* Layers 1, 2 and 4; DifferentialGeometry Layer 5's density integration;
CotangentLagrangian C1 and SmoothBundlesConnections B2 for the bundle/L² comparisons.

### 5.2 Kähler projective examples

 Consume ComplexKahlerGeometry K7's
ℂPⁿ, O(k), section/polynomial dictionary and normalized ω_FS.
For k≥1 use `ω=2πℏk ω_FS` and O(k), construct the polarized Hermitian
L² inner product and prove dimension `binomial(n+k,n)`. The k=0
holomorphic-section calculation is a bundle statement, not a
symplectic prequantization. For ℂP¹ compare with LieGroups' full-flag
Borel–Weil theorem; for n≥2 use K7's direct polynomial construction.
For SU(2), `H⁰(O(k))≃Sym^k((ℂ²)*)`; use the invariant ε pairing for
the explicit intertwiner with `Sym^k ℂ²`, and prove Q2's lift agrees
with the natural action on O(k) with the normalized moment map.
- The polarized L² pairing is positive on nonzero holomorphic sections, and the
  projective quantization identifies the section action with the dual polynomial action.
- For SU(2), the invariant alternating pairing supplies the stated dual-to-standard intertwiner.

**Checks.**

- For ℂP¹, k=1 gives dimension 2 and k=2 gives dimension 3; k=0 gives the
  constants of dimension 1 without a positive symplectic form from this formula.
- For ℂP², k=2 gives binomial(4,2)=6, the six degree-two monomials.
- For projective dimension 0 every k gives dimension 1; for SU(2), −I acts
  by −1 at k=1 and +1 at k=2, agreeing with Layer 3's descent test.

*Needs:* Layers 1 and 4; ComplexKahlerGeometry K7.1–K7.2;
LieGroups Layer 8 for the SU(2) representation comparison.

### 5.3 Torus polarizations

 Let `M=ℝ²/ℤ²`, `ω=2πℏk dq∧dp`, k>0,
`τ∈ℍ` and `z=q+τp`. Pin the holomorphic-section automorphy law
`s(z+1)=exp(2πiα)s(z)` and
`s(z+τ)=exp(2πiβ−πikτ−2πikz)s(z)`, α,β real modulo integers.
Construct the bundle and Hermitian metric with these factors, prove
curvature and derive its principal/line holonomy. Pin the local metric
`h(z)=exp(−2πk(Im z)²/Im τ)`, Chern form
`A=2πik(Im z/Im τ)dz`, and q-loop line holonomy
`exp(−2πi(kp+α))`; principal holonomy is its inverse. Develop theta
series using Mathlib's `jacobiTheta₂`, consuming its existing summability
and translation laws; prove the level-k characteristic versions and
a k-element basis, hence dimension k.
On the real leaves `{p=constant}`, prove the Bohr–Sommerfeld criterion
`kp+α∈ℤ`; flat twisting shifts these k leaves. Define this real
quantization as the direct sum of their parallel lines and prove its
dimension k. Prove every smooth global polarized section is zero,
since non-Bohr–Sommerfeld leaves are dense. The direct-sum
quantization is not that zero smooth-section space.

All comparison maps retain their normalization and respect the declared
bundle/gauge morphisms. Explicit bases and examples are actual constructions,
not only dimension formulas.

- The automorphy factors satisfy the lattice cocycle law and the displayed metric
  descends; curvature and holonomy identify the same degree-k line as in Layer 1.
- The characteristic theta sections form a basis of size k; the direct sum of
  Bohr–Sommerfeld parallel lines also has dimension k, although smooth real-polarized
  global sections vanish.

**Checks.**

- Translating by 1 then τ versus τ then 1 changes the factor by exp(−2πik)=1;
  at k=1/2 it is −1, so nonintegral k does not define the stated torus line.
- At τ=i, k=1, α=β=0 the metric ratio under z↦z+i is exp(−4π Im z−2π),
  inverse to the squared automorphy norm exp(4π Im z+2π); their product is 1.
- At k=2, α=0 the real direct sum has dimension 2, while a smooth section
  vanishing on the dense complement of p=0,1/2 is identically zero. At k=1, α=1/2,
  the unique Bohr–Sommerfeld leaf is p=1/2, not p=0.

*Needs:* Layers 1 and 4; ComplexKahlerGeometry K7.2's torus line examples;
Mathlib `jacobiTheta₂` and its translation/summability laws.

### Examples

The cotangent commutator, projective binomial dimensions and degree-k torus
spaces compare the three quantization constructions without identifying their domains.

### Dependencies

Layers 1–4 and the named density, projective and theta suppliers.

## Layer 6: Equivariant distributions and chamber multiplicities (Q5)

### 6.1 The geometric character and moment map

Let a compact torus T act holomorphically and Hamiltonianly on a compact
connected Kähler manifold M of complex dimension d, with positive T-linearized
Hermitian holomorphic line L. Normalize the Chern connection by
`F_∇=−iω` (the ℏ=1 specialization of Q1). For the character lattice Λ of T use
`χ_λ(exp X)=exp(i⟨λ,X⟩)`, and use the lattice measure on `𝔱*` for which Λ
has covolume one. Fix the moment map by
`d⟨μ,ξ⟩=ι_(ξ_M)ω` and Q2's compatible Kostant lift. Define the actual
section representation by `(t·s)(x)=t_L(s(t⁻¹·x))`; `m_n(λ)` is the
multiplicity of `χ_λ` in `H⁰(M,L^n)`. Prove the moment-map/Kostant/fixed-point
dictionary for these choices, including how twisting the linearization by a
character translates the moment map and weight labels, so the moment-map sign
and weight sign cannot be changed independently.

- The section representation is a left action, and tensor powers multiply fibre weights
  by n; a linearization twist by κ sends μ to μ+κ and λ to λ+nκ.
- Multiplicities are dimensions of the actual character subspaces, are nonnegative
  integers and sum to the dimension of H⁰(M,L^n).

**Checks.**

- On ℂP¹ with coordinate weights (0,2), the natural O(n) section weights are
  0,−2,…,−2n, each with multiplicity 1; every odd weight has multiplicity 0.
- Twisting this line by character 1 changes those weights to n,n−2,…,−n;
  at n=1 the two weights are 1 and −1, and their sum of multiplicities is 2.
- For a point with fibre character κ, H⁰(L^n) is one line of weight nκ and
  moment κ; its rescaled character is the point mass at κ.

*Needs:* Layers 1–2 and 4; ComplexKahlerGeometry K4/K5b.1;
IndexTheory I8.4's section-action convention; CompactGroups' character projections.

### 6.2 Positive-line and index bridge

 Construct an equivariant Kodaira embedding
`i:M→ℙ^N` from a very-ample power `L^m`, with a T-equivariant isomorphism
`L^m≃i*O(1)`. Prove the positive-line embedding independently of reduction:
use K5b's Dolbeault Green/regularity floor and K6's local positive-curvature
Bochner identities for L^m⊗K_M⁻¹ to solve the cutoff local peak-section
∂̄ errors with estimates as m grows. Construct sections separating points and
first jets, with compactness giving a common sufficiently large power;
prove the resulting map is an injective holomorphic immersion and hence a
closed embedding. Its evaluation map gives the displayed pullback isomorphism.
Use the actual T-action on the finite section space and its dual to prove
equivariance; this construction assumes neither the reduced multiplicity
identity nor a projective embedding of M in advance. For each residue
`0≤j<m`, form the coherent analytic sheaf
`i_*(L^j)` on ℙ^N. Apply ComplexComparisonPartII C1.8's analytic Serre
vanishing to this finite list after twists by `O(k)`; the closed-embedding
cohomology comparison then gives `H^q(M,L^{mk+j})=0` for every `q>0` and all
sufficiently large k, hence for every sufficiently large n. This explicitly
handles n not divisible by m and does not silently assume Chow's theorem to
algebraize the embedding. Use C1.7–C1.9's analytic/projective comparison
where the equivariant index is identified with the section representation.
Then Dolbeault identifies the equivariant holomorphic Euler character with
the actual `H⁰` character. Do not duplicate the vanishing theorem. The
embedding from a positive compact-Kähler line is a separate Q5 construction,
not a claim already owned by ComplexKahlerGeometry K7. Q5 must supply the
compact-torus equivariant character/Riemann–Roch formula and coefficient
extraction, including positive-dimensional fixed components and finite
sector phases. Consume IndexTheory I6/I7.3 for the ordinary index, and I8.4
for the section-action convention; I8.3's isolated-nondegenerate-fixed-point
case is not the general fixed-component theorem. The Kodaira map,
linearization, residue twists and comparison maps must all be equivariant
and explicit.

The nonequivariant embedding assertion is the positive-implies-ample theorem
(Demailly, VII Theorem 13.1, pp. 358–359, Corollary 13.3 and Theorem 14.1,
p. 359). The equivariant evaluation map and finite-residue Serre argument are
deductions with the specified T-action, not extra hypotheses on that theorem.

- Evaluation gives the line isomorphism L^m≃i*O(1) and respects the torus action.
- A finite maximum of the residue-class vanishing bounds yields a bound for every n,
  so the index agrees with H⁰ on all large powers, not merely on a subsequence.

**Checks.**

- On ℂP¹, L=O(1) embeds at m=1 with two sections; at m=2 the map
  [x:y]↦[x²:xy:y²] pulls O(1) back to O(2), whose degree is 2.
- With m=3 and residue thresholds k₀=2, k₁=4, k₂=1, the uniform choice k≥4
  covers n≥12: 12=3·4, 13=3·4+1, 14=3·4+2.
- The trivial line on a positive-dimensional compact connected complex manifold
  has only constant sections, so its evaluation map is constant and not an embedding;
  on a point it is the identity map to ℙ⁰.

*Needs:* §6.1; ComplexKahlerGeometry K4/K5b.1/K6.0/K7;
ComplexComparisonPartII C1.7–C1.9; IndexTheory I6/I7.3/I8.4.

### 6.3 Integral torus characters

Do not identify Tau Ceti's generic Lie `formalCharacter` carrier with the
compact-torus lattice by coercion. Its native value is in
`AddMonoidAlgebra ℤ (Module.Dual K L)` and its coefficients are dimensions of
generalized Lie weight spaces. Under the stated Killing-semisimple Cartan,
algebraically-closed characteristic-zero hypotheses, consume the native
identification with honest weight spaces and its integral-support theorem.
For a compact circle of period P, construct the actual differential/period
identification from `fourierChar P n` and `fourierRep P n`: its differential
frequency is `2πn/P` under the convention `χ(exp X)=exp(i⟨λ,X⟩)`. Assemble the
product torus and prove that this period lattice is its character lattice.
This conversion and compatibility with the actual section action are Q5
obligations; the whole-dual formal-character source alone does not establish
them.

- Differential characters and integral cocharacters pair perfectly with the specified
  angular period; finite products identify the full torus character lattice.
- The integral character conversion intertwines the actual section representation,
  rather than assigning a lattice label to an arbitrary element of the Lie dual.

**Checks.**

- Period P=2π and character n=1 give frequency 1; P=1 gives frequency 2π.
- A frequency 1/2 on the period-2π circle has value −1 after one period, so
  it is not a character of that circle.
- The rank-zero torus has character lattice 0; the two-circle character (1,−1)
  takes angles (t,u) to exp(i(t−u)), and its two fundamental periods both give 1.

*Needs:* CompactGroups' circle Fourier and character-projection APIs;
Tau Ceti `TauCeti.fourierChar`, `TauCeti.fourierRep` and `TauCeti.formalCharacter`;
ConvexityToric T1's period lattice; §6.1's geometric representation.

### 6.4 Global distribution limit

 For
`ν_n=n^{-d} Σ_{λ∈Λ} m_n(λ) δ_{λ/n}`, prove weak convergence against every
compactly supported smooth test function f:
`⟨ν_n,f⟩ → (2π)⁻ᵈ ∫_M f(μ(x)) ωᵈ/d!`.
Equivalently the limit is `(2π)⁻ᵈ μ_*(ωᵈ/d!)`, with T4's raw
Liouville Duistermaat–Heckman measure. The factor follows from
`c₁(L)=[ω/(2π)]` and the lattice-covolume convention at ℏ=1. Q5 fixes
ℏ=1; if retaining arbitrary ℏ, replace this Chern form by `ω/(2πℏ)` and
scale the moment coordinate by `μ/ℏ` in the weight distribution. Prove this as
a distributional consequence of the equivariant Riemann–Roch expansion
(Vergne, arXiv v1, Theorem 3.2, p. 5), using §6.2 to replace the index by H⁰. It does
not by itself imply a pointwise estimate for one weight. The distribution
statement includes nonfaithful torus actions and measures supported on a
proper affine subspace; do not call such a pushforward an ambient density.

- The rescaled measure uses the actual finite H⁰ character and scales mass by n⁻ᵈ
  for n≥1; its limit is the normalized pushforward measure, including singular support.
- Character twists translate both the measure and its limiting moment image.

**Checks.**

- For ℂP¹ with coordinate weights (0,2), ν_n has mass (n+1)/n→1 and
  lattice spacing 2/n on [−2,0]; its limiting density is 1/2, not 1.
- For ℂP² with O(1), total mass is binomial(n+2,2)/n²→1/2,
  agreeing with (2π)⁻²∫ω²/2!=1/2.
- For a point of fibre weight κ, d=0 and ν_n=δ_κ for every n≥1;
  the zero character has mass 0 and cannot replace this quantization.

*Needs:* §§6.1–6.3 and §6.8's equivariant index formula;
ConvexityToric T4's raw Liouville measure; Vergne Theorem 3.2, p. 5 (v1).

### 6.5 Reduced lines and admissible weights

 Let U be a chamber of regular
values and suppose its levels are locally free for T. For ξ∈U let
`R_ξ=μ⁻¹(ξ)/T` be the reduced orbifold. If `λ/n=ξ`, restrict
`L^n⊗ℂ_{−λ}` to the level and take its quotient as an orbifold line bundle
`L_{n,λ,ξ}` on R_ξ. The regular reduction theorem must identify the actual
weight multiplicity `m_n(λ)=dim Hom_T(ℂ_λ,H⁰(M,L^n))` with the orbifold
Riemann–Roch number of `(R_ξ,L_{n,λ,ξ})` for the stated sufficiently large
n and regularity hypotheses. Define `m_{n,B}(λ)` only as the Riemann–Roch
contribution of a connected component B of the reduced orbifold; then
`m_n(λ)=Σ_B m_{n,B}(λ)`. This is a reduction/index statement, not a splitting
of the global section space over open subsets of `μ⁻¹(U)`.

(Meinrenken, arXiv v2, Theorem 2.1, p. 5; the uniform joint-parameter
conclusion of §6.9 is a deduction from the sector formula on pp. 6–7.)

Refine U by stabilizer type. On a component branch B let H_B be the generic
finite stabilizer, let κ_B be its character on L's fibers, and put
q_B=|H_B|. The shifted line has generic stabilizer character
`κ_Bⁿ χ_{−λ}|_{H_B}`. Thus it is trivial on the generic stabilizer exactly
when `χ_λ|_{H_B}=κ_Bⁿ`; admissible weights form a coset of
`Ann(H_B)={λ∈Λ:χ_λ|_{H_B}=1}`, which has index q_B in Λ. Keep the orbifold
line and this coset, or explicitly extend the character and twist/translate
the linearization, moment map and weights back; never silently descend the
original lift. Let `DH_B` be T4's raw Liouville pushforward density from this
branch and put `ρ_B=(2π)⁻ᵈ DH_B`.

- The shifted line retains the full isotropy action in every chart; it is a coarse line
  precisely when that action is trivial at every point, not just generically.
- Generic admissibility is a coset of the annihilator lattice with index |H_B|;
  it is distinct from the finer residue classes used for sector phases.

**Checks.**

- On the doubled-circle ℂP¹ action, H_B=μ₂ and κ_B=1; the coset is 2ℤ,
  its index is 2, and the odd weight multiplicities are zero.
- On [point/μ₂], the trivial line has index (1+1)/2=1 and the sign line
  has index (1−1)/2=0; the identity-sector integral alone is 1/2 in both cases.
- For a free action H_B=1, the annihilator is all Λ and its index is 1;
  an empty level contributes zero sections and zero index.

*Needs:* Layers 1–2; §§6.1–6.3; HamiltonianReduction R3;
Orbifolds O4/O5 and ConvexityToric T4. The section/index equality is proved
using §§6.6–6.8 before the estimates of §6.9.

### 6.6 Global complexified action and shifted semistability

 Fix an integer n≥1,
λ∈Λ, ξ=λ/n and E=L^n⊗ℂ_(−λ), with its given Hermitian metric and
holomorphic structure. Construct the global complexified torus
T_C=T·exp(i𝔱), with the actual angular period lattice. Consume LieGroups
Layer7's generic complex integration/period-quotient prefix for the abelian
Lie algebra, before its compact semisimple, Peter–Weyl and Borel–Weil
applications; compare its actual torus with 𝔱_C/(2πΛ_Z) and polar coordinates
T×𝔱 from the initial Layer6 period lattice. Construct its holomorphic action
on M and the fibrewise complex-linear holomorphic lift to E from the
commuting real holomorphic fields X_a and JX_a. Integrate their commuting
flows using Q2's complete-field integration and DifferentialGeometry's
parameter-dependent flow APIs; do not apply a finite-dimensional complex-group
universal property to an infinite-dimensional automorphism group. For the lift prove
completeness of the fibre-linear scalar ODE over each finite base-flow
interval. Verify the original T-periods and descend the integrated action
from the simply connected complex Lie group to T_C. Recover Q2's specified unitary
T-linearization, tensor powers, character twists, restrictions and bundle maps.
The complexified action preserves the holomorphic structure; only T is
required to preserve the Hermitian metric. On a T_C-invariant open subset,
prove that a holomorphic E-section is T-invariant iff it is T_C-invariant,
by differentiating its holomorphic orbit map and using connectedness.

(Sjamaar, arXiv v1, §2.2, p. 24, assumes the global complexified base action;
the commuting-flow construction above supplies it here.)

Put Z_ξ=μ⁻¹(ξ) and define
Mss_ξ={x∈M : closure(T_C·x) intersects Z_ξ}. Prove the global geometry of
this moment-dependent open set, including its analytic complement and its
regular-level saturation, before comparing its sections with those on M.
Use Q5's independent equivariant Kodaira construction for a very-ample power
E^m, m≥1, and the actual finite character decomposition of H⁰(M,E^m)^*.
These are positive-line/compact elliptic inputs, not reduction or the desired
multiplicity identity. Write a_j∈Λ for the coordinate-vector weights in that
projective representation. On a fixed nonzero fibre vector ℓ∈E^m_x construct
the real potential

κ_x(a)=−log‖exp(ia)·ℓ‖²+log‖ℓ‖²,   a∈𝔱.

Prove independence of the chosen nonzero ℓ, κ_x(0)=0, the additive orbit
cocycle identity, and the tensor-power, character-twist and base-change formulas.

Prove dκ_x(a)(b)=2mn⟨μ(exp(ia)x)−ξ,b⟩ and
Hess κ_x(a)(b,c)=2mn g(X_b,X_c) at exp(ia)x. Compare with the
Fubini–Study metric on the SAME equivariant E^m: in projective coordinates its
potential is log(Σ_j |z_j|² exp(−2⟨a_j,a⟩))−log(Σ_j |z_j|²).
The difference of the two potentials is bounded, because the ratio of the two
smooth Hermitian metrics is a globally defined positive function on compact M.
This comparison does not assume the Kodaira embedding is a symplectic isometry.
Use K7's O(1) Chern normalization: if ω_FS has integral1 on a projective
line, its angular curvature form is 2πω_FS. The coordinate O(1) fibre weight
is −a_j, so this potential has fixed-fibre moment values −a_j; the actual
E^m moment is mn(μ−ξ). Keep these scale and dual-action signs explicit.

Prove the finite-support criterion: x is semistable exactly when0 lies in the
convex hull of the a_j with z_j≠0. Construct the orbit-closure limits for its
faces and the critical point on each minimal0-containing face. On the
quotient by its infinitesimal stabilizer the potential is proper and strictly
convex, hence attains its minimum; on stabilizer directions the fixed-fibre
character and Kostant equation give zero shifted moment. This supplies an
actual point of Z_ξ in the orbit closure, not only a combinatorial label.
Conversely a separating cocharacter and the bounded metric comparison exclude
such a point when0 lies outside that hull. The unstable set is the finite
union of the unstable-support coordinate projective subspaces intersected
with the Kodaira image. Prove it is closed analytic in M. If Z_ξ is nonempty,
this subset is proper and nowhere dense on connected M.

At a regular value show every semistable support has0 in its full-dimensional
interior: a proper minimal face would give a point in Z_ξ with a
positive-dimensional stabilizer, contradicting surjectivity of dμ. The
potential is then proper and strictly convex on𝔱. Its unique critical point
proves Mss_ξ=T_C·Z_ξ, and each such complex orbit meets Z_ξ in exactly one
T-orbit. Construct the actual map T_C×_T Z_ξ→Mss_ξ and its inverse, including
smoothness from the positive Hessian/implicit-function comparison. Prove that
the T_C-action on Mss_ξ is proper with finite stabilizers, and identify its
quotient with the already constructed R_ξ=Z_ξ/T as a Kähler orbifold. Construct
holomorphic slices from complements to the complex orbit directions and the
holomorphic inverse theorem; retain the finite stabilizer action, its local
linearization, overlap arrows and refinements. These are Q5's torus applications
of the generic manifold/orbifold floors, not an assumed general reductive GIT
quotient or a new generic slice engine.

(Sjamaar, arXiv v1, Proposition 2.2, p. 19 and Theorem 2.8, p. 22; the
proper finite-isotropy specialization uses regularity.)

Descend E on this full-isotropy presentation to the holomorphic orbifold line
L_(n,λ,ξ). Give the equivariant pullback and inverse descent maps on charts,
their transition equations, refinements and naturality. Its Hermitian metric
comes from the unitary quotient of E|Z_ξ; compare its Chern connection with
curvature −inω_ξ. Complexified transport is not assumed isometric. Finite
stabilizer characters on the fibres are retained; the line is not replaced
by a coarse line bundle unless the actual descent criterion holds. Construct
at this stage the local holomorphic-section descent isomorphism
H⁰(Mss_ξ,E)^T ≃ H⁰_orb(R_ξ,L_(n,λ,ξ)), including its inverse and the
T versus T_C invariant-section comparison.

(Sjamaar, arXiv v1, Proposition 2.11, pp. 24–25.)

- The integrated complex action restricts to the given unitary T-action and is compatible
  with tensor powers and twists; only the compact real subgroup preserves the metric.
- The orbit potential is independent of a nonzero fibre vector, is zero at the origin,
  and satisfies the orbit cocycle law. Its Hessian is positive on non-stabilizer directions.
- The semistable set is open with analytic complement; at a nonempty regular level its
  complex orbits meet the level in one T-orbit and its quotient retains finite isotropy.
- Full-isotropy descent identifies invariant holomorphic sections with orbifold sections,
  with inverse pullback on the same local slices.

**Checks.**

- For ℂP¹ coordinate weights (0,1), take n=2, λ=−1 and E=L²⊗ℂ₁.
  At [1:1], m=1 gives potential 2 log((exp(a)+exp(−a))/2):
  value 0, derivative 0 and Hessian 2 at a=0.
  At a fixed point the potential is linear, its Hessian is 0, and regularity fails.
- The support weights {−1,1} contain 0 in their interior, giving semistable locus ℂ×;
  a singleton {1} excludes 0 and is unstable. At the endpoint shift a singleton {0}
  is semistable but has positive-dimensional stabilizer, so strict convexity on 𝔱 fails.
- For rank-zero T the potential is 0 on the zero vector space, the semistable locus is M,
  and quotient/descent are the identity; for an empty shifted level no orbit is semistable.
- For a μ₂ slice acting trivially on the base, an invariant section of the sign line
  must satisfy s=−s and is zero; the trivial line has all local scalar sections.

*Needs:* §§6.1–6.3/6.5; §2.3's complete-field integration;
LieGroups Layers 6–7; DifferentialGeometry Layer 3; ComplexKahlerGeometry
K3/K4/K7; HamiltonianReduction R3; Orbifolds O1/O2/O4.

### 6.7 Shifted Kostant bound and global extension

 Choose any positive inner
product on𝔱 and an orthonormal basis a. Set η=μ−ξ and f=‖η‖². Derive the
infinitesimal section action from the declared positive-left lift:
a·s=−∇_(X_a)s+i(nμ_a−λ_a)s on E. Thus a T-invariant holomorphic section
on Mss_ξ satisfies

∇_(X_a)s=inη_a s,   ∇_(JX_a)s=i∇_(X_a)s=−nη_a s.

The convention g(u,v)=ω(u,Jv), dμ_a=ι_(X_a)ω gives grad μ_a=JX_a and
−grad f=−2Σ_a η_a JX_a. Metric compatibility therefore gives, along its
negative-gradient flow φ_t,

d/dt ‖s(φ_t x)‖²=4n‖μ(φ_t x)−ξ‖²‖s(φ_t x)‖²≥0.

Construct this flow using ConvexityToric T3's translated moment-square
semiflow and prove that its stable locus for Z_ξ is exactly Mss_ξ. In the
regular saturation compare it with exp(ia(t))x, a'(t)=−2η(exp(ia(t))x).
The proper convex potential decreases along this equation, so a(t) stays in
a compact sublevel; its positive Hessian there and the unique minimum give
convergence to the critical imaginary parameter. Compare with T3's actual
single-point limit and stratum topology. Consequently φ_t x converges to
z∈Z_ξ and

‖s(x)‖ ≤ sup_(z∈Z_ξ) ‖s(z)‖.

The right side is finite by compactness of Z_ξ (Sjamaar, arXiv v1,
Theorem 2.15 and its proof, pp. 27–28; the factor 4n is the angular
normalization of that proof, not its printed curvature convention). This is an angular ℏ=1
formula; rederive it together with the curvature and character conventions
under any rescaling, rather than importing a2π constant from another Chern
normalization. Invariant sections with nontrivial ineffective isotropy may
vanish; do not remove that character in applying the bound.

Apply ComplexKahlerGeometry K3's locally bounded holomorphic extension
across a nowhere-dense analytic subset on the smooth complex manifold M.
In each holomorphic frame on a relatively compact coordinate neighbourhood,
its positive frame norm has a positive lower bound, so the displayed bound
bounds the scalar coefficient of s. Extend that coefficient, prove frame
independence and glue by uniqueness on dense overlaps. Prove that extension
is complex-linear, inverse to restriction and equivariant: translated
extensions agree on Mss_ξ and hence on M. This argument includes an analytic
divisor in the complement; no unbounded codimension-two Hartogs assertion
is substituted. Construct the actual isomorphisms

H⁰(M,L^n)_λ ≃ H⁰(M,E)^T ≃ H⁰(Mss_ξ,E)^T
               ≃ H⁰_orb(R_ξ,L_(n,λ,ξ)).

The first map tensors with the specified unit vector inℂ_(−λ); the middle
map is restriction and its inverse is the unique bounded extension; the last
map and its inverse are the full-isotropy descent just constructed. Prove all
inverse, naturality and integer-power/character-translation identities. The
H⁰ comparison holds for every n≥1 at these regular levels; higher-degree
vanishings are used only in the later numerical index step.

If Z_ξ is empty, Mss_ξ is empty and its complement need not be nowhere dense.
Prove the shifted invariant section space is zero independently: a nonzero
global invariant section has a nonzero norm maximum on compact M, and its
JX_a derivatives and the shifted Kostant equation force μ=ξ there. Thus
no such section exists; the empty reduced orbifold has zero section space
and index. Do not apply extension across all of M in this case. Treat empty
M by zero spaces, and rank-zero T by Mss_ξ=M and the identity comparisons.
For a positive-dimensional action kernel use the T′ and character-twist
transport specified below before the regular locally-free theorem; no
ambient regular-level hypothesis is imposed on a lower-dimensional moment
support. OnℂP¹ at an interior level, verify the saturation isℂ× and its two
missing fixed points illustrate the bounded extension across a divisor.

- Restriction and bounded extension are inverse complex-linear maps and commute with
  the group action, powers and character twists; descent composes with these maps.
- The empty-level case uses the maximum argument and gives zero spaces without an
  extension assertion across all of M.

**Checks.**

- On ℂP¹ with weights (0,1), take n=2, λ=−1, r=|z|²=1/4 and
  the invariant section xy. Its norm squared is r/(1+r)²=4/25 and
  η=−r/(1+r)+1/2=3/10; the norm derivative is
  4·2·(3/10)²·(4/25)=72/625, agreeing with differentiation along the gradient flow.
- Its maximum on the level r=1 is 1/4; at r=1/4 its norm squared 4/25≤1/4,
  fixing the direction of the bound. The section extends across both missing points.
- A Laurent pole z⁻¹ on a punctured disc is unbounded and does not extend;
  the bounded constant 1 does. On an empty shifted level invariant sections are zero,
  whereas rank-zero T gives the identity restriction on H⁰(M,L^n).

*Needs:* §6.6; ConvexityToric T3's translated moment-square flow;
ComplexKahlerGeometry K3's locally bounded extension theorem;
Sjamaar Theorem 2.15 and proof, pp. 27–28 (v1).

### 6.8 Orbifold index and its inertia formula

On a compact Kähler orbifold define the orbifold Dolbeault complex of
`L_{n,λ,ξ}`-valued `(0,q)` forms as compatible invariant chart forms. Use O5's
full-isotropy integral for its L² pairing, construct the elliptic Dolbeault
Laplacian and its self-adjoint Fredholm realization, and prove the orbifold
Hodge theorem: its harmonic spaces are finite-dimensional and compute
`H^{0,q}_{orb}`. Define the finite virtual index
`Ind_{orb}(L_{n,λ,ξ})=Σ_q(−1)^q dim H^{0,q}_{orb}`. State the positivity/Bochner–Kodaira
argument giving higher-degree vanishing for the shifted line in the needed large-n range.
Specify the uniform positivity bound on compact C⊂U: prove
`L_{n,λ,ξ}⊗K_{R_ξ}^{−1}` is positive there and apply the orbifold Kodaira
vanishing theorem to `K_{R_ξ}⊗(L_{n,λ,ξ}⊗K_{R_ξ}^{−1})`; positivity of
`L_{n,λ,ξ}` alone is not the hypothesis of that theorem. Then its index is
the actual holomorphic-section dimension in that range.

Construct the weighted inertia expression for this index. On a local finite
chart `[U/G]`, sum over conjugacy classes `[g]` the O5-weighted integral on
`[U^g/C_G(g)]` of the fixed-stratum Todd form times the eigenvalue-weighted
Chern character of the line, divided by the normal factor
`ch_g(λ_{−1}N_g^*)`. If the eigenvalue of g on a normal eigenbundle `N_θ` is
`e^{2πiθ}`, `0<θ<1`, its factor is
`∏_j(1−e^{−2πiθ}e^{−x_{θ,j}})`, where `x_{θ,j}` are its Chern roots; the line
factor includes its actual fiber phase `tr(g|L_{n,λ,ξ})`. For a global finite
group chart this weighted convention is
`Σ_[g]|C_G(g)|⁻¹∫_{U^g}`; O5 integration supplies exactly this factor, so no
second stabilizer division is inserted. Construct and prove independence under
chart refinement and Morita equivalence, including ineffective isotropy. This
Kawasaki-type formula is a Q5 proof target, not a theorem attributed to O4/O5
or the isolated-fixed-point IndexTheory clause.

Prove the regular Kähler quantization-commutes-with-reduction identity
`dim Hom_T(ℂ_λ,H⁰(M,L^n))=Ind_{orb}(L_{n,λ,ξ})` for sufficiently large n
under the stated compactness, positive-line, regular-value and local-freeness
hypotheses. Use the global restriction/extension and local full-isotropy
H⁰ descent isomorphisms above. Combine them with the assigned higher-degree
vanishings on M and the reduced orbifold; this gives the numerical equality
of the multiplicity and reduced Dolbeault Euler characteristics in that range.
Keep the chartwise orbifold Dolbeault maps, refinement/gluing and compact
elliptic/Fredholm/Hodge comparison used to compute the reduced cohomology.
The global bridge is a constructed H⁰ restriction isomorphism; no global
Dolbeault quasi-isomorphism is required or asserted by slice gluing alone.

- The orbifold Dolbeault complex uses invariant chart forms and restriction-compatible
  differentials; its harmonic representatives compute the same sheaf cohomology.
- The finite alternating index and its inertia expression agree under chart refinement,
  including ineffective actions. On a compact set of regular parameters, positivity of
  L_(n,λ,ξ)⊗K⁻¹ holds uniformly for large n and gives the numerical multiplicity formula.
- The normal denominator is invertible because each moving eigenvalue differs from 1;
  its degree-zero term is nonzero and higher positive-degree forms are nilpotent.

**Checks.**

- For [point/μ₂], the two sectors each have weight 1/2; the trivial and sign
  fibre characters give total indices 1 and 0, respectively, not 1/2 or 1/4.
- For the nontrivial μ₂ normal eigenvalue −1 and zero Chern root, the normal factor
  is 1−(−1)=2, giving inverse 1/2; the fixed eigenvalue 1 must be omitted from the normal bundle.
- On a point, only degree-zero Dolbeault forms occur, so index equals fibre invariants;
  on an empty orbifold all groups and the index are zero. For O(n) on ℂP¹,
  twisting by K⁻¹=O(2) gives positive degree n+2 for n≥1.

*Needs:* §§6.2/6.5–6.7; Orbifolds O4/O5; ComplexKahlerGeometry K5a/K5b/K6.0;
IndexTheory I6/I7.3 and PseudodifferentialOperators P1–P2 for the smooth elliptic
floor, extended here to invariant finite charts; Meinrenken Theorem 2.1, p. 5 (v2).

### 6.9 Joint quasi-polynomials and the uniform estimate

For every compact C⊂U, prove this reduced index formula uniformly for
admissible λ_n with λ_n/n∈C. Orbifold sector phases are finite-order characters
of the joint parameter lattice `ℤ×Λ`. Exhibit a finite-index sublattice
Γ₀⊂`ℤ×Λ` on which all sector phases factor trivially. On every coset of Γ₀,
after restricting to a chamber and separately imposing the generic
stabilizer admissible weight coset for H_B, each component contribution is a
polynomial of total degree at most d−r in (n,λ), hence jointly
quasipolynomial in degree and weight. This bound is for the local chamber
formula, not a polynomial assertion across chamber walls. The
H_B coset alone does not fix sector phases. The CP² example with weights `(0,1,2)` has trivial generic stabilizer, but
on `0<j<n` its exponent count is
`floor(j/2)+1`; fixing n modulo a period does not remove dependence on `j mod
2`.

Let `A_B(c,ξ)` be the sum of leading densities from all inertia sectors whose
fixed stratum has generic reduced dimension, with phases evaluated at joint
residue `c∈(ℤ×Λ)/Γ₀`. The q_B generic stabilizer sectors have matching phase on
admissible weights and contribute `q_Bρ_B(ξ)` relative to full-lattice
measure. Thus `A_B=q_Bρ_B` if there are no additional same-dimensional
sectors; otherwise retain their residue-dependent terms in `A_B`. If all
remaining sectors have strictly smaller dimension, prove
`m_{n,B}(λ_n)=n^{d-r}A_B(c_n,λ_n/n)+O_C(n^{d-r-1})`, uniformly on C, where
`c_n` is the joint residue of (n,λ_n). The q_B factor is absorbed when density
is measured relative to `Ann(H_B)`. The smooth-free case H_B=1 is a specialization.
Identify fixed strata and normal factors and prove degree, joint finite-period
dependence and the uniform error from this orbifold index formula, never from
weak convergence. The target is for regular locally free levels; it includes
both smooth and finite-isotropy orbifold reductions.

- A single finite-index sublattice of ℤ×Λ kills all sector phases on a fixed chamber;
  the generic stabilizer coset is imposed separately.
- On a fixed compact C in that chamber, the finitely many coefficient functions are bounded,
  giving one error constant and one degree threshold for all admissible pairs in C.

**Checks.**

- For weights (0,1,2) and 0<j<n, C_n(j)=floor(j/2)+1 equals j/2+1 for even j
  and j/2+1/2 for odd j; the error from j/2 is bounded by 1 but depends on weight parity.
- At n=6, j=2,3 give multiplicities 2,2 with leading terms 1,3/2 and errors 1,1/2.
  Fixing n alone leaves these distinct errors and cannot determine the joint residue.
- For the doubled ℂP¹ action, q_B=2 and ρ_B=1/2; on even weights the leading
  coefficient is q_Bρ_B=1, matching multiplicity 1, while odd weights have multiplicity 0.
  Here d−r=0, so the exact zero remainder also satisfies the O(n⁻¹) bound.

*Needs:* §§6.5–6.8; ConvexityToric T4's chamber variation;
Meinrenken, v2, equations (17)–(21), pp. 6–7. Joint uniformity is the deduction
specified here, rather than an assertion that weak convergence implies a coefficient bound.

### 6.10 Ineffective actions and support transport

Let `ρ:T→Diff(M)` be the base action and set `K=ker ρ`, the full kernel of
the action on connected M. This is a closed subgroup of T; it acts trivially
on M and by one character `κ:K→S¹` on the fibers of L. Let `K⁰` be its
identity component and write the real differential of a character as
`wt(χ)=(1/i)dχ`, using `χ(exp X)=exp(i⟨wt(χ),X⟩)`. Construct an extension
`β∈X*(T)` of `κ|_{K⁰}`: prove surjectivity of restriction
`X*(T)→X*(K⁰)` from the primitive sublattice of cocharacters by extending a basis of that primitive sublattice. Twist the linearization to `L′=L⊗ℂ_{−β}`. Its
`K⁰` action is trivial on both M and the fibers, so construct the descended
`T′=T/K⁰`-linearized holomorphic line on M and its naturality under changing
β. Since K was the full base-action kernel, the residual subgroup
`K′=K/K⁰⊂T′` is the full finite kernel of the quotient base action. It acts
on the descended line by the character `δ=κ·(β|_K)^{−1}`; keep this as the
finite-kernel datum for the local theorem. Thus the Lie algebra action of T′
is effective, and `r_eff=dim(T′)` is the effective Lie rank used by the local
theorem. Prove the moment-map relation
`μ=wt(β)+q^*μ′` and the actual section weight transport
`m^T_n(nβ+q^*η)=m^{T′}_n(η)` for `η∈X*(T′)`, with zero multiplicity outside
`nβ+q^*X*(T′)`. The residual admissibility is
`η|_{K′}=δ^n`; it contributes its finite-index coset once, through the
finite-kernel theorem, not as another independent volume factor.

The global distribution remains supported on
`μ|_{Lie(K⁰)}=wt(κ|_{K⁰})`. Write `q:T→T′` for the quotient and
`q*:𝔱′*→𝔱*` for the dual differential. After twisting by β, the exact
rescaled-weight map is
`φ_β(η)=wt(β)+q*η`. Define the rescaled measures using the same
normalization `n^{−d}` on both sides, with multiplicities for L and L′, and
prove the exact identity `ν_n^T=(φ_β)_*ν_n^{T′}`; before rescaling, the
original weights have zero multiplicity outside `nβ+q*X*(T′)`. The support-relative limit
is therefore the pushforward of the T′ limit under φ_β, on the annihilator
lattice `X*(T′)=Ann(K⁰)` with its covolume-one measure. The differential
support equation means `⟨μ,ξ⟩=⟨wt(κ|_{K⁰}),ξ⟩` for every
`ξ∈Lie(K⁰)`. Prove this measure transport and the weight/moment translation
under β. If β is replaced by another extension,
the difference is a character of T′; prove the induced translation of η and
μ′ leaves this pushforward identity and its limit unchanged. Apply the preceding finite-kernel
regular locally-free result to T′ and its residual K′, retaining the K′
character coset and counting its lattice index exactly once. There is no
ambient Lebesgue density on the lower-dimensional support and no estimate off
it. The global distribution includes such actions, but wall and singular-level
pointwise estimates remain outside this contract absent their own explicit
stratification and coefficient formula.
- The full base kernel acts by a single fibre character; extending its connected part
  and twisting produces a T/K⁰-linearized line, with residual finite character retained.
- Weight transport and affine pushforward are exact for each n≥1 and independent of
  the extension β after the corresponding translation of quotient weights and moment.

**Checks.**

- Let T² act on ℂP¹ by (t,u)[x:y]=[x:ty] and let u act on the line with
  weight b. The weights of L^n are (−j,nb), 0≤j≤n; rescaling gives (−j/n,b),
  a line-supported measure rather than an ambient two-dimensional density.
- Replacing β=(0,b) by β=(1,b) changes quotient weights from −j to −j−n;
  adding β back gives the same (−j,nb), and both affine pushforwards agree.
- For a trivial torus action on a point with fibre weight κ, K⁰=T and T′=1;
  the sole weight nκ gives δ_κ. For a doubled circle K⁰=1 and K′=μ₂,
  so the even-weight coset is imposed once, with index 2.

*Needs:* §§6.1/6.3/6.5/6.9; LieGroups Layer 6 and ConvexityToric T1;
Mathlib's character restriction and quotient maps.

### 6.11 Projective exponent counts

Apply the results to the CP² actions with coordinate weights `a=(0,1,2)`
and `a=(0,1,−2)` (Knutson, *Lie Groups notes, Semester 2*, physical pp. 106
and 119 of 131). Compute their exponent counts directly and distinguish
exponent pairing from the actual section convention. Let
`C_n(j)` count degree-n monomials whose exponent pairing with `a` is j.
With the natural O(1) lift, the specified section action
`(t·s)(x)=t_L(s(t⁻¹·x))` acts on those monomial sections by the negative
pairing. Twisting the linearization by `χ_κ` adds `nκ`; hence in these
one-dimensional examples the actual section multiplicity is
`m_n(λ)=C_n(nκ−λ)`, and for the natural lift (`κ=0`) it is `C_n(−λ)`.
The source exponent-count density `f_C` therefore becomes the actual section
weight density `f_C(−x)` for the natural lift; a character twist translates
it by `κ`. Do not identify positive source exponent weights with positive
`H⁰` weights under this section-action convention.

For the first action, `C_n(j)` is the number of integers c with
`max(0,j−n)≤c≤floor(j/2)`. Its source exponent-count density is
`min(x,2−x)/2` on `[0,2]`, with total mass `1/2`; the natural-lift section
density is `min(−x,2+x)/2` on `[−2,0]`. For the second, `C_n(j)` is the
number of integers c with `max(0,ceil(−j/2))≤c≤floor((n−j)/3)`. Its source
density is `(x+2)/6` on `[−2,0]` and `(1−x)/3` on `[0,1]`, again with total
mass `1/2`; its natural-lift section density is `(1+x)/3` on `[−1,0]` and
`(2−x)/6` on `[0,2]`. Insert the actual `c₁/ω/(2π)` factor when comparing
these distributions to raw Liouville volume. At degree 2 the six source
exponent pairings for the second action are `0,1,−2,2,−1,−4`, all distinct;
the natural-lift section weights are their negatives. At degree 3 source
exponent weight 0 occurs twice and the other weights
`−6,−4,−3,−2,−1,1,2,3` occur once; the actual section weights are again
their negatives. For each action compare rescaled counts and its own
T4 density with exact scaling, congruences and normalization.

- Exponent counts use nonnegative triples summing to n; a negative upper-minus-lower
  bound gives zero count, rather than a negative multiplicity.
- The map j↦nκ−j converts exponent counts into the actual section weights and
  translates/reflections their limiting densities with no extra volume factor.

**Checks.**

- For (0,1,−2), n=2 gives the six distinct exponent weights −4,−2,−1,0,1,2.
  For n=3, weight 0 occurs twice and −6,−4,−3,−2,−1,1,2,3 each occurs once,
  so the total is 10=binomial(5,2).
- At n=0 both actions have just the constant monomial, of weight 0 and multiplicity 1;
  this is a section calculation and is not inserted into an n⁻ᵈ rescaling.
- For (0,1,2), the two density triangles have areas 1/4+1/4=1/2;
  for (0,1,−2) they have areas 1/3+1/6=1/2. Reflection to section weights preserves mass.

*Needs:* §5.2; §§6.1/6.4/6.9; ComplexKahlerGeometry K7.2's polynomial dictionary.

### Examples

The two CP² actions test volume and joint residue classes. The doubled-circle
CP¹ action tests ineffective isotropy, and a trivially acting circle tests
support on a proper affine subspace.

### Dependencies

Layers 1–5, the positive-line and torus-character bridges, followed by
complexified-action geometry, bounded extension, orbifold index and chamber
variation. The distribution proof uses the equivariant index formula;
the local estimate uses the sector formula and its uniform coefficient bounds.

## Downstream consumers

The homogeneous fibre-character and ordinary-degree comparisons supply
compact-group representation and flag applications. Polarized quantization
supplies geometric realizations of the cotangent and theta representations;
the torus index comparison supplies regular reduced multiplicities with their
finite-isotropy phases. These consumers use the constructions in this roadmap
without supplying premises to them.

General complex polarizations, half-form/metaplectic corrections, singular-polarization theory,
quantization of arbitrary observables and deformation quantization are separate
subjects. Q5 specifies only the compact-torus distribution and regular locally-free
chamber results stated there; it does not assert a general compact-group
“quantization commutes with reduction” theorem. Its half-density bundle does
not assert the existence of a square root
of a complex canonical bundle. Poisson geometry and symplectic groupoids belong to LieGroupoidsPoisson;
prequantization of Poisson/algebroid structures and quantization via symplectic
groupoids have no target here. Analytic Floer theory remains HeegaardFloer’s subject.

## References

- [Graham–Vogan, *Geometric quantization for nilpotent coadjoint orbits*](https://math.mit.edu/~dav/quant.pdf),
  author manuscript, Definition 5.5 and equation (5.7), pp. 23–25; Example 5.8,
  p. 25; Definition 6.4, p. 37, for half-densities, homogeneous associated bundles
  and the stabilizer differential condition.
- [Demailly, *Complex Analytic and Differential Geometry*](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf),
  V §11, p. 267; VI §9.1, p. 314; VII §13–§14, pp. 358–360, for holomorphic
  Picard classes and the positive-line embedding theorem.
- Kostant, *Quantization and Unitary Representations*, for prequantization and
  lifted symmetries.
- Woodhouse, *Geometric Quantization*, for real/complex polarizations and
  half-densities.
- [Śniatycki, *Geometric Quantization and Quantum Mechanics*](https://doi.org/10.1007/978-1-4612-6066-0),
  for real polarizations and the Bohr–Sommerfeld constructions.
- [Cannas da Silva, *Lectures on Symplectic Geometry*](https://www.math.ist.utl.pt/~acannas/Books/symplectic.pdf),
  for the symplectic, cotangent and Hamiltonian foundations.
- [Vergne, *The equivariant Riemann–Roch theorem and the graded Todd class*](https://arxiv.org/abs/1612.04651),
  arXiv v1, Theorem 3.2, p. 5, for the compact-torus rescaled-character distribution
  expansion, the character convention and the Duistermaat–Heckman leading term.
- [Meinrenken, *On Riemann–Roch Formulas for Multiplicities*](https://arxiv.org/abs/alg-geom/9405014),
  arXiv v2, Theorem 2.1, p. 5 and pp. 6–7, for regular free and locally free reductions, orbifold multiplicity formulas,
  chamber dependence and singular reduction behavior.
- [Meinrenken–Sjamaar, *Singular Reduction and Quantization*](https://arxiv.org/abs/dg-ga/9707023),
  for singular-reduction context. Q5 makes no pointwise wall or singular-level
  coefficient assertion without a separately specified stratification and formula.
- [Kodaira, *On Kähler varieties of restricted type*](https://doi.org/10.2307/1969701),
  for the positive-line projective-embedding theorem.
- [Sjamaar, *Holomorphic Slices, Symplectic Reduction and Multiplicities of
  Representations*](https://arxiv.org/html/alg-geom/9304004), arXiv v1, Proposition 2.2, p. 19,
  Theorem 2.8, p. 22, Proposition 2.11, pp. 24–25 and Theorem 2.15, pp. 27–28, for semistability, the regular
  quotient, local line descent and the distinct global bounded-extension step.
  Translate its Chern/moment normalization to the angular ℏ=1 convention above.
- Allen Knutson, *Lie Groups notes, Semester 2*,
  April23 entries, physical pages106 and119 of131, for the two CP² actions.
