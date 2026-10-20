# Prequantization and polarized geometric quantization

Build prequantum circle and Hermitian line bundles, lifts of Hamiltonian
symmetries, polarized sections and their Hilbert spaces. Develop the real and
Kähler polarizations and compute the cotangent, torus and projective examples.
Integrality, flat twists, polarization and the domain of a quantum operator
are mathematical data; each must remain visible in the API.

## Dependencies and conventions

Use finite-dimensional Hausdorff second-countable smooth symplectic manifolds
without boundary, with `ω : TauCeti.SmoothTwoForm I M` and `ω.IsSymplectic`.
The symplectic linear/manifold structures are Tau Ceti's. Use the
[HamiltonianSystems proposal](https://github.com/TauCetiProject/TauCetiRoadmap/pull/480)
for `ι_(X_f)ω=df` and `{f,g}=df(X_g)=ω(X_f,X_g)`, so
`[X_f,X_g]=-X_{ {f,g} }`. Consume DifferentialGeometry 0.4's form migration
and LieGroupoidsPoisson G4.2a's legacy Hamiltonian adapter for this convention.
The proposal's shared interfaces remain required supplier targets; they
impose no waiting condition.

Fix a real `ℏ>0`. A prequantum principal circle bundle has real connection
`a`, normalized by `a(V)=1` for the generator of `t↦exp(it)`, and
`da=π*(ω/ℏ)`. Its associated line uses the dual circle character, as in
[SmoothBundlesConnections](../SmoothBundlesConnections/README.md), so
`F_∇=-(i/ℏ)ω` and `c₁(L)_ℝ=[ω/(2πℏ)]`. Connections, integral class,
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

[DifferentialGeometry](../DifferentialGeometry/README.md) supplies forms,
integration, densities and Stokes. [CotangentLagrangian C1](../SymplecticGeometry/CotangentLagrangian/README.md),
[HamiltonianReduction R1](../SymplecticGeometry/HamiltonianReduction/README.md)
and [ConvexityToric T4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d0a68408c712ae78904a9709575a81a07ec5522f/TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md) supply
cotangent geometry, group-level Hamiltonian actions and Liouville measure. The
[OperatorTheory/SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md)
roadmap consumes Mathlib's `LinearPMap` partial operators and adjoints,
and supplies graph cores, the von Neumann criterion and Stone's theorem.
Q2 defines essential self-adjointness and proves the concrete core results.
SmoothBundlesConnections B2 supplies generic Hermitian-bundle L² spaces on
real bases. The Kähler branch consumes ComplexKahlerGeometry K1's type
bundles and K4's holomorphic/Hermitian bundles and Dolbeault operators.
Pin Kähler positivity as `g(u,v)=ω(u,Jv)`. For Q5, use the full
compact-torus character lattice and the actual left representation on sections
specified there; consume IndexTheory I8.4 for the section-action convention and
let Q5 own its general fixed-component equivariant character formula.
Consume [ComplexComparisonPartII C1.7–C1.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e3c8536df9555dc6e7027bfb3d60daef8bf33586/TauCetiRoadmap/ComplexComparisonPartII/README.md)
for projective/proper GAGA and analytic Serre vanishing, with Q5 constructing
the positive-line Kodaira embedding and the finitely many residue twists
needed to reach every sufficiently large tensor power. ComplexKahlerGeometry
K5b/K7 does not own this general comparison. Q5 consumes ConvexityToric T4's
full-isotropy raw Liouville Duistermaat–Heckman measure and free-chamber
density contract, and Orbifolds O4/O5's orbibundle, full-isotropy integration
and comparison contracts. Q5 constructs the reduced orbifold Dolbeault index,
its inertia formula and the multiplicity comparison. ConvexityToric T3 supplies
the moment-square gradient semiflow and convergence floor. Q5 constructs its
shifted semistable-locus application, the global complexified action and line
lift, and the invariant-section bound; ComplexKahlerGeometry K3 supplies the
locally bounded holomorphic extension theorem applied to its scalar frame
coefficients. The quotient-slice comparison and this global extension are
separate prerequisites for the actual H⁰ multiplicity isomorphism.
[Orbifolds O4-T/O4-W/O4-S/O5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7caa6c4bbd63052a56bb1fec29f4b2e885695eee/TauCetiRoadmap/Orbifolds/README.md)
provides the generic full-isotropy orbibundle, integration, and cohomological
comparison contracts used by the reduced spaces. Those clauses do not state
an orbifold Kawasaki/Riemann–Roch or inertia-sector multiplicity theorem;
Q5 owns that additional index formula and its coefficient extraction.
[RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md)
supplies the compact-circle Fourier characters and character-projection APIs;
build the finite product torus and its character-lattice identification from
those actual carriers rather than a private character decomposition.
[LieGroups Layer 5](../RepresentationTheory/LieGroups/README.md) supplies the
simply connected covering Lie group and its covering kernel.

## Q1. Prequantum objects and their API

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

## Q2. Hamiltonian lifts and prequantum operators

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

## Q2A. Homogeneous prequantization, periods and the specified group

Distinguish an ordinary prequantum line from a linearization by the specified
acting group. Retain Q1's ℏ>0, the right-circle action exp(it), a(V)=1,
da=π*ω/ℏ, the dual associated line, F_∇=−iω/ℏ and
c₁(L)=[ω/(2πℏ)]. For a positive left fundamental vector ξ_M, Q2's lifted
field is −Y_(μ^ξ), hence its connection value is −μ^ξ/ℏ. Preserve these
signs in every homogeneous, character and curvature comparison below.

**Q2A.1. Homogeneous characters and actual descent.** For a finite-dimensional
Lie group G and a closed subgroup H, consume SmoothBundlesConnections B1.4's
actual principal quotient G→G/H and associated-bundle construction. Build the
equivalence between smooth G-equivariant complex lines over G/H and smooth
characters λ:H→ℂ× by evaluation on the fibre at eH and the inverse
L_λ=(G×ℂ)/((g,z)·h=(gh,λ(h)⁻¹z)). Include equivariant maps, unit, tensor,
dual, change of basepoint/conjugation, restriction, pullback and products.
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

**Q2A.2. Coadjoint characters and period maps.** Work on HamiltonianReduction
R2's actual homogeneous coadjoint orbit G/H, H=G_μ₀, with moment map the
coadjoint inclusion and KKS form ω(ξ_M,η_M)=μ([ξ,η]). A prequantum lift
with this fixed moment map exists exactly when there is a smooth character
λ:H→Circle with λ(exp(tξ))=exp(it μ₀(ξ)/ℏ) for every ξ∈Lie(H).
The criterion involves the full H, including its components. Construct both
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
Use S3P.1's actual root-curve generators of H₂(K/H;ℤ) to characterize ordinary
prequantizability by these coroot periods. Specified-K equivariance instead
requires the character of H, or equivalently the appropriate full Y-lattice
condition with the stabilizer-root vanishing. Central moment components do
not change ω but do change this character condition. Twisting a
linearization by a character η of K changes μ by ℏℓ_η in these conventions;
keep the fixed-moment and variable-moment existence problems separate.

**Q2A.3. Global forms and boundary tests.** Construct the actual finite central
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
the ordinary lattice. S3P supplies the ordinary holomorphic Picard comparison;
the character/descent calculation here does not assume Borel–Weil.

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

Construction order: SBC B1/B2/B6 and HR R2 precede Q2A.1 and its coadjoint
connection construction. S3P.1's root-curve topology precedes the period and
ordinary-lattice assertions. K4.P and S3P.2 supply the holomorphic Picard
comparison used in Q2A.3. Q2A.1 supplies S3P.3's fibre-character/descent
calculation. These cuts are acyclic; none consumes the section-exhaustion,
Borel–Weil, LS, standard-monomial or quantization-commutes-with-reduction
theorems. The companion `HomogeneousCharacterTargets.lean` illustrates the
native character restriction, central quotient and lattice maps; the README
specifies the full geometric constructions and their proof obligations.


## Q3. Polarizations and polarized sections

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

Characterize polarization-preserving Hamiltonians by
`[X_f,Γ_local(P)]⊆Γ_local(P)` and prove their Q operators preserve
polarized sections and form a Poisson subalgebra. Exhibit Hamiltonians
that fail this condition. For regular real polarizations with smooth
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

## Q4. Quantization spaces and examples

1. **Cotangent/Schrödinger polarization.** On `T*Q` use the vertical
   polarization and Q1's exact line. Identify polarized smooth sections
   with functions on Q in coordinates and under cotangent lifts. Prove
   the polarization-preserving Hamiltonians are exactly
   `f(q,p)=⟨p,v(q)⟩+u(q)` with smooth v and u. Construct the real
   half-density bundle as the positive square root of the density bundle,
   its pullback and intrinsic `L²(Q;half-densities)`, whose inner product
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
2. **Kähler projective examples.** Consume ComplexKahlerGeometry K7's
   ℂPⁿ, O(k), section/polynomial dictionary and normalized ω_FS.
   For k≥1 use `ω=2πℏk ω_FS` and O(k), construct the polarized Hermitian
   L² inner product and prove dimension `binomial(n+k,n)`. The k=0
   holomorphic-section calculation is a bundle statement, not a
   symplectic prequantization. For ℂP¹ compare with LieGroups' full-flag
   Borel–Weil theorem; for n≥2 use K7's direct polynomial construction.
   For SU(2), `H⁰(O(k))≃Sym^k((ℂ²)*)`; use the invariant ε pairing for
   the explicit intertwiner with `Sym^k ℂ²`, and prove Q2's lift agrees
   with the natural action on O(k) with the normalized moment map.
3. **Torus polarizations.** Let `M=ℝ²/ℤ²`, `ω=2πℏk dq∧dp`, k>0,
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

## Q5. Equivariant weight distributions and chamber multiplicities

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

**Positive-line and index bridge.** Construct an equivariant Kodaira embedding
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

**Global distribution limit.** For
`ν_n=n^{-d} Σ_{λ∈Λ} m_n(λ) δ_{λ/n}`, prove weak convergence against every
compactly supported smooth test function f:
`⟨ν_n,f⟩ → (2π)⁻ᵈ ∫_M f(μ(x)) ωᵈ/d!`.
Equivalently the limit is `(2π)⁻ᵈ μ_*(ωᵈ/d!)`, with T4's raw
Liouville Duistermaat–Heckman measure. The factor follows from
`c₁(L)=[ω/(2π)]` and the lattice-covolume convention at ℏ=1. Q5 fixes
ℏ=1; if retaining arbitrary ℏ, replace this Chern form by `ω/(2πℏ)` and
scale the moment coordinate by `μ/ℏ` in the weight distribution. Prove this as
a distributional consequence of the equivariant Riemann–Roch expansion. It does
not by itself imply a pointwise estimate for one weight. The distribution
statement includes nonfaithful torus actions and measures supported on a
proper affine subspace; do not call such a pushforward an ambient density.

**Regular locally-free chamber estimate.** Let U be a chamber of regular
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

**Global complexified action and shifted semistability.** Fix an integer n≥1,
λ∈Λ, ξ=λ/n and E=L^n⊗ℂ_{−λ}, with its given Hermitian metric and
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

Descend E on this full-isotropy presentation to the holomorphic orbifold line
L_{n,λ,ξ}. Give the equivariant pullback and inverse descent maps on charts,
their transition equations, refinements and naturality. Its Hermitian metric
comes from the unitary quotient of E|Z_ξ; compare its Chern connection with
curvature −inω_ξ. Complexified transport is not assumed isometric. Finite
stabilizer characters on the fibres are retained; the line is not replaced
by a coarse line bundle unless the actual descent criterion holds. Construct
at this stage the local holomorphic-section descent isomorphism
H⁰(Mss_ξ,E)^T ≃ H⁰_orb(R_ξ,L_{n,λ,ξ}), including its inverse and the
T versus T_C invariant-section comparison.

**Shifted Kostant bound and global extension.** Choose any positive inner
product on𝔱 and an orthonormal basis a. Set η=μ−ξ and f=‖η‖². Derive the
infinitesimal section action from the declared positive-left lift:
a·s=−∇_{X_a}s+i(nμ_a−λ_a)s on E. Thus a T-invariant holomorphic section
on Mss_ξ satisfies

∇_{X_a}s=inη_a s,   ∇_{JX_a}s=i∇_{X_a}s=−nη_a s.

The convention g(u,v)=ω(u,Jv), dμ_a=ι_{X_a}ω gives grad μ_a=JX_a and
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

‖s(x)‖ ≤ sup_{z∈Z_ξ} ‖s(z)‖.

The right side is finite by compactness of Z_ξ. This is an angular ℏ=1
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
               ≃ H⁰_orb(R_ξ,L_{n,λ,ξ}).

The first map tensors with the specified unit vector inℂ_{−λ}; the middle
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

Let `ρ:T→Diff(M)` be the base action and set `K=ker ρ`, the full kernel of
the action on connected M. This is a closed subgroup of T; it acts trivially
on M and by one character `κ:K→S¹` on the fibers of L. Let `K⁰` be its
identity component and write the real differential of a character as
`wt(χ)=(1/i)dχ`, using `χ(exp X)=exp(i⟨wt(χ),X⟩)`. Construct an extension
`β∈X*(T)` of `κ|_{K⁰}`: prove surjectivity of restriction
`X*(T)→X*(K⁰)` from the primitive sublattice of cocharacters (for example by
integer Smith normal form). Twist the linearization to `L′=L⊗ℂ_{−β}`. Its
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
Apply the results to the two source CP² actions separately: [Knutson,
Semester 2](#knutson-semester2), physical page106 of131, has coordinate
weights `a=(0,1,2)`; physical page119 has `a=(0,1,−2)`. State both
the source exponent-count convention and the actual section convention. Let
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
their negatives. Preserve
the page-119 transcription's separate degree-two repeated-middle claim as an
unresolved source discrepancy; the direct monomial calculation is the
mathematical target. For each action compare rescaled counts and its own
T4 density with exact scaling, congruences and normalization.

## Completion and boundaries

Q1 uses SmoothBundlesConnections B3–B6 and cotangent geometry. Q2 uses Q1
and Hamiltonian/group-action theory, B2's L² spaces, the spectral supplier,
LieGroups Layer 5 and DifferentialGeometry 3.5's manifold flows. Palais's
integration uses DifferentialGeometry's Frobenius theorem. Q3 uses Q1–Q2, Frobenius and
DifferentialGeometry's smooth-parametric homotopy formula; its Kähler
branch uses ComplexKahlerGeometry. Q4 builds the concrete Hilbert-space and
representation examples after those branches. Q5 consumes the Kähler,
projective/GAGA, equivariant-index, regular-reduction, torus-weight and T4
Duistermaat–Heckman contracts stated above. Every introduced bundle,
polarization, lift, operator, character and measure has naturality, transport
and basic calculus. The representative plane prototype states contraction and
Poisson-bracket equations directly on native `TauCeti.SmoothTwoForm`; its
Hamiltonian field and bracket must be compared with the HamiltonianSystems
and SymplecticGeometry common interfaces at those exact equations. The
representational native prototype does not remove those mathematical suppliers.

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

- Kostant, *Quantization and Unitary Representations*, for prequantization and
  lifted symmetries.
- Woodhouse, *Geometric Quantization*, for real/complex polarizations and
  half-densities.
- [Śniatycki, *Geometric Quantization and Quantum Mechanics*](https://doi.org/10.1007/978-1-4612-6066-0),
  for real polarizations and the Bohr–Sommerfeld constructions.
- [Cannas da Silva, *Lectures on Symplectic Geometry*](https://www.math.ist.utl.pt/~acannas/Books/symplectic.pdf),
  for the symplectic, cotangent and Hamiltonian foundations.
- [Vergne, *The equivariant Riemann–Roch theorem and the graded Todd class*](https://arxiv.org/abs/1612.04651),
  especially §§1–3, for the compact-torus rescaled-character distribution
  expansion, the character convention and the Duistermaat–Heckman leading term.
- [Meinrenken, *On Riemann–Roch Formulas for Multiplicities*](https://arxiv.org/abs/alg-geom/9405014),
  for regular free and locally free reductions, orbifold multiplicity formulas,
  chamber dependence and singular reduction behavior.
- [Meinrenken–Sjamaar, *Singular Reduction and Quantization*](https://arxiv.org/abs/dg-ga/9707023),
  for singular-reduction context. Q5 makes no pointwise wall or singular-level
  coefficient assertion without a separately specified stratification and formula.
- [Kodaira, *On Kähler varieties of restricted type*](https://doi.org/10.2307/1969701),
  for the positive-line projective-embedding theorem.
- [Sjamaar, *Holomorphic Slices, Symplectic Reduction and Multiplicities of
  Representations*](https://arxiv.org/html/alg-geom/9304004), Proposition2.2,
  Theorem2.8, Proposition2.11 and Theorem2.15, for semistability, the regular
  quotient, local line descent and the distinct global bounded-extension step.
  Translate its Chern/moment normalization to the angular ℏ=1 convention above.
- <a id="knutson-semester2"></a>Allen Knutson, *Lie Groups notes, Semester 2*,
  April23 entries, physical pages106 and119 of131, for the two CP² actions.
  The page119 repeated-middle statement remains a source-transcription
  discrepancy; the explicit exponent calculation and section-action dictionary
  above specify the mathematical targets.
