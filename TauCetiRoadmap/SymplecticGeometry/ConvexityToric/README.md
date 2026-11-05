# Roadmap: hamiltonian convexity, Duistermaat–Heckman and symplectic toric geometry

**Summary.** Develop the geometry and topology of compact Hamiltonian actions, from local weight normal forms to
moment polytopes, reduced symplectic classes and measures, and Delzant classification. Both the
symplectic geometry and the lattice geometry should have full usable APIs; a polytope without its
stabilizers, measure normalization or reconstruction theorem is not the intended result.

## Scope and ownership

This roadmap owns compact Hamiltonian fixed-locus and weight geometry, moment-map
Morse theory, torus and Kirwan convexity, the two-sided Schur–Horn theorem, the word121
moment polygon, Duistermaat–Heckman applications, and smooth and orbifold toric classification.
It develops the existing ConvexityToric layers in their original order.

SmoothBundlesConnections B2.4 owns measures from smooth positive densities, including
Liouville measure; Layer 4 applies that measure to Hamiltonian invariance and reduction.
Orbifolds O1–O5, specifically O4-T, owns generic classifying/coarse maps and represented
bundles. Layer 4 specializes them to the Hamiltonian level bundle. SchubertGeometry S2,
S9 and its word121 acceptance calculation own the incidence threefold, its flag map and
complex realization. Layer 3 owns its symplectic form and moment image.
OperatorTheory/Majorization Part A, MAJ-A18–A25, owns forward diagonal inequalities;
Layer 3 adds realization of every majorized diagonal and the exact unitary-orbit image.
LieGroups Layer 6 owns maximal tori, conjugacy, the Weyl comparison and the compact real
root adapter: adjoint root characters, invariant-metric coroots and rank-one SU(2)
representatives. Layer 1 adds only the integral period/character/isogeny normalization
of those real data. HamiltonianReduction R2 owns coadjoint orbits, R2a.2–4 owns their
root-plane Hessians, generic isolated-critical-point heights and even-cell consequences,
and R3 owns reduction;
MorseTheory M1–M5 owns ordinary Morse–Bott attachments. Algebraic/analytic toric varieties,
cones and fans belong to AnalyticToricGeometry, independently of symplectic classification.

## Conventions

Use the [family conventions](../README.md). A torus is a compact connected abelian Lie group with
Lie algebra t and period lattice ker(exp); coordinates use R^m/(2πZ)^m. Define the integral cocharacter lattice Λ_Z=(2π)⁻¹ker(exp)⊂t and its dual weight
lattice; χ maps to (1/i)dχ. Weights pair integrally with Λ_Z and into 2πZ with ker(exp).
Normalize Lebesgue measure on t* so the weight lattice Λ* dual to Λ_Z=(2π)⁻¹ker(exp) has covolume 1;
use Mathlib `IsZLattice`/`Basis.addHaar` and Tau Ceti `Toric.IsIntegralLattice` for scalar-extension data. A Hamiltonian action means the smooth symplectic action and
equivariant moment map of [HamiltonianReduction](../HamiltonianReduction/README.md). Convexity below
assumes compact **connected** M unless explicitly stated otherwise. No assertion of connected fibers
or a bounded polytope is made for arbitrary noncompact M.


All manifolds are finite-dimensional, Hausdorff, second countable and without boundary.
Dimensions may be zero. Symplectic forms are smooth, closed and nondegenerate. The
Hamiltonian sign is ι_(ξ_M)ω=dμ_ξ. Fiber connectedness means preconnectedness for all
fibers, hence connectedness for every nonempty fiber; fibers outside the image are empty.
Integral cohomology uses ℤ, equivariant perfection uses ℚ unless explicitly strengthened,
and reduced symplectic classes use ℝ. Lean carriers have arbitrary type universes.

## Exact supplier contracts

- **From Mathlib:** `Matrix.unitaryGroup` and conjugate transpose in
  `Mathlib/LinearAlgebra/UnitaryGroup.lean`; `Submodule.starProjection` in
  `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`; `EuclideanSpace`,
  `convexHull`, `Set.extremePoints`, `Representation.invariants`, `mfderiv`,
  `LieGroup`, `IsZLattice` and `Basis.addHaar`. These give matrices, fixed subspaces,
  derivatives, convex sets and lattice-normalized Haar measure, without Hamiltonian hypotheses.
- **From Tau Ceti:** `TauCeti.SmoothTwoForm` in
  `TauCeti/Geometry/Manifold/TwoForm/Basic.lean`, with
  `TauCeti.SmoothTwoForm.IsSymplectic` in
  `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean`, and
  `TauCeti.Toric.IsIntegralLattice` in `TauCeti/Geometry/Toric/Algebraic/Lattice.lean`.
  The last includes finite freeness and real scalar extension, rather than merely an
  injective additive map with spanning image. For smooth Riemannian isometries use
  `TauCeti.RiemannianIsometry.riemannianExp_mfderiv` in
  `TauCeti/Geometry/Manifold/Riemannian/Isometry/Exponential.lean`: on finite-dimensional
  smooth boundaryless Hausdorff manifolds with smooth Riemannian metrics, it intertwines
  exponential maps with the actual differential; completeness is not assumed.
  For abstract Weyl chambers use `TauCeti.dominantChamber` and
  `TauCeti.openDominantChamber` in `TauCeti/LinearAlgebra/RootSystem/Chamber.lean`
  (the weak and strict sign cones of the simple coroots of a base of a root pairing over an
  ordered commutative ring), `TauCeti.weylChamber` and `TauCeti.openWeylChamber` in
  `TauCeti/LinearAlgebra/RootSystem/Weyl/Chamber.lean` (their Weyl translates, with
  `TauCeti.exists_smul_eq_of_mem_openWeylChambers` for transitivity on open chambers and
  `TauCeti.existsUnique_mem_openWeylChamber` placing each regular weight in exactly one open
  chamber), and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` in
  `TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean` (each Weyl orbit meets the
  closed dominant chamber in exactly one point, walls included). The last two assume a
  root system over a linearly ordered strict ordered commutative ring with finite index set,
  crystallographic and reduced with reduced flip, where a root system means that the roots
  span their module and the coroots theirs. The real root system of a compact connected
  Lie group satisfies all of these on the semisimple part t_ss*, the span of its roots, and
  LieGroups Layer 6's compact comparison transports them to t*_(ss,+); the closed positive
  chamber is t*_+=z(k)*×t*_(ss,+), with the centre an unrestricted factor on which no root
  or chamber wall acts.
- **From TauCetiRoadmap.HamiltonianReduction:** R1's smooth action and equivariant
  moment-map equations, R2's coadjoint orbit/KKS and chamber comparisons,
  R2a.2–4's root-plane Hessians, critical set Wμ for regular heights, generic distinct
  values and even-cell consequences on compact connected coadjoint orbits, R3's free and
  locally free reduction, and R3.1's proper-orbit symplectic slice normal form.
- **From TauCetiRoadmap.LieGroups:** Layer 1's smooth adjoint representation, its
  differential ad and conjugation/exponential identities; Layer 6's maximal tori, conjugacy,
  normalizer/Weyl comparison, exponential surjectivity and compact real root adapter. For
  compact connected G with maximal torus T that adapter is assumed to provide: an
  Ad-invariant inner product on g with the orthogonal splitting g=z(g)⊕[g,g]; the
  adjoint root characters χ_α:T→S¹ with dχ_α=iα and their real root planes; the
  invariant-metric coroot α∨=2α♯/‖α‖² with α(α∨)=2; a smooth homomorphism
  φ_α:SU(2)→G with dφ_α(diag(i,−i))=α∨ and
  φ_α(diag(e^(it),e^(−it)))=exp_G(tα∨); a normalizer representative acting on t
  by X↦X−α(X)α∨; and transport of all of these under torus conjugation and change
  of unit root vector. Layer 1 constructs none of these; the kernel bound
  ker(φ_α)⊆{I,−I} is not assumed of the adapter but proved in §1.1 from the
  derivative equation, using Layer 2's closed-subgroup theorem.
- **From TauCetiRoadmap.SmoothBundlesConnections:** B2.4's Liouville density measure
  and integral comparison, principal connections in Layers 1–4, and B6.2–B6.3's
  dual-character Chern class and curvature convention.
- **From TauCetiRoadmap.Orbifolds:** O1–O5's proper étale presentations, invariant forms,
  represented bundles and full-isotropy integration; O4-N/S/R/K/W/T's classifying,
  coarse and de Rham comparisons, including O4-T's diagonal singular CW model.
- **From TauCetiRoadmap.MorseTheory:** M1–M5's Hessians, normal forms and attachments.
  From TauCetiRoadmap.CharacteristicClasses, C1's universal torus bundles and C2–C3's
  Thom, Euler and Leray–Hirsch interfaces. From TauCetiRoadmap.AlgebraicTopology,
  Stage 6's ordinary cohomology, products and manifold duality.
- **From TauCetiRoadmap.DifferentialGeometry:** Layers 0–1's forms and exterior
  derivative, §5.5's density integration and Layer 6's de Rham cohomology.
  From TauCetiRoadmap.HeegaardFloer, §4.1's Darboux/Moser theory;
  from TauCetiRoadmap.HopfRinow, Layer 1's local exponential map and Layer 4's
  transport under smooth Riemannian isometries;
  from TauCetiRoadmap.GeometricTopology, Layer 1's tubular neighborhoods.
- **From TauCetiRoadmap.SchubertGeometry:** S2's Bott–Samelson space and word121
  incidence/flag projection, and S9's complex realization.
  From TauCetiRoadmap.ComplexKahlerGeometry, K7.2's Fubini–Study form of line area 1.
  From TauCetiRoadmap.AnalyticToricGeometry, the integral cone/fan and lattice dictionary.

## How to read the build

Layers 1–3 proceed from local Hamiltonian geometry through Morse theory to global
convexity and matrix images. Layer 4 uses reduction and density integration for
Duistermaat–Heckman, independently of the nonabelian convexity proof. Layer 5 uses
torus convexity, reduction, equivariant cohomology and exact volumes for reconstruction
and classification. The labels T1–T5 denote these same five layers in supplier and
consumer contracts. `Suggested.lean` states the headline acceptance theorems that use
native carriers; its docstring identifies the missing carriers for the other headlines.

## Layer 1: Compact symplectic actions and local models

### 1.1 Periods, characters and rank-one normalization

For every compact connected real Lie group G with maximal torus T, consume LieGroups
Layer 6's compact real root adapter: the adjoint root characters χ_α:T→S¹ with
dχ_α=iα, the invariant-metric coroots α∨ with α(α∨)=2, the rank-one homomorphisms
φ_α:SU(2)→G with dφ_α(diag(i,−i))=α∨ and
φ_α(diag(e^(it),e^(−it)))=exp_G(tα∨), and their transport under torus conjugation.
None of these real data is constructed here; changing the unit root vector conjugates
φ_α by its diagonal torus, so no choice-independent map is assumed. For a torus the
root family is empty. This subsection adds only the integral normalization of those data
and the kernel bound on φ_α.

Build the 2π-normalized period/weight dictionary: compare T with t/ker(exp), put
Λ_Z=(2π)⁻¹ker(exp), and identify a character with (1/i)dχ. Prove duality, restriction,
quotient and integral basis-change formulas. For λ∈ker(exp), prove α_χ(λ)/(2π)∈ℤ.
Evaluate the consumed identity φ_α(diag(e^(it),e^(−it)))=exp_G(tα∨) at t=2π to prove
exp_G(2πα∨)=1, so that α∨∈Λ_Z is an integral cocharacter, and identify the pairing of
every character differential with α∨ as the Cartan integer, so that the consumed
reflection X↦X−α(X)α∨ preserves the weight lattice (Conrad–Landesman, *Compact Lie
Groups*, Appendix R, Proposition R.2.1 and its proof, pp. 254–256). Under a central
isogeny prove the finite-index lattice comparison, retaining the full torus lattice
rather than an integral center/semisimple splitting (Conrad–Landesman, Appendix Q,
pp. 248–253, for the isogeny formalism; Appendix R, §§R.1–R.2).

Prove ker(φ_α)⊆{I,−I} from the derivative equation alone. The real Lie algebra su(2)
is ℝ³ with the cross-product bracket and has no ideal other than 0 and itself, and
dφ_α(diag(i,−i))=α∨ is nonzero because α(α∨)=2, so the Lie algebra map dφ_α is
injective. The kernel of φ_α is a closed normal subgroup of SU(2); by the closed-subgroup
theorem its Lie algebra is ker(dφ_α)=0, so it is discrete. A discrete normal subgroup of
a connected group is central, since each of its conjugacy classes is connected and
discrete, and the centre of SU(2) is {I,−I} (Conrad–Landesman, §18, p. 82, where the
same argument bounds the kernel of a rank-one map integrated from a section su(2)→g).

- Characters add under multiplication, and their real differentials pair integrally with Λ_Z.
- Restriction of characters is dual to inclusion of cocharacters; quotient tori use the quotient lattice.
- The consumed rank-one homomorphism intertwines exponentials, so its diagonal circle
  has period 2πα∨ in ker(exp): the coroot is an integral cocharacter and the consumed
  normalizer representative preserves the weight and cocharacter lattices.
- The consumed rank-one homomorphism has kernel contained in {I,−I}: its differential is
  injective, so its kernel is a discrete normal subgroup of the connected group SU(2),
  hence central.
- Torus conjugation transports the consumed characters, coroots and rank-one maps together
  with their period lattices; central quotients compose the maps, transport their
  differentials, retain any order-two kernel and compare the two lattices with finite index.

**Checks.**

- For S¹, exp(t)=e^(it), Λ_Z=ℤ and χ_k has real differential k; χ_k(2π)=1.
- For SU(2), H=diag(i,−i) has α(H)=2 and exp(2πH)=1; choose φ as the identity,
  so dφ(H)=H and the kernel is {I}. The zero homomorphism has pairing 0 and fails the
  required value 2, and its kernel is all of SU(2): a kernel escapes {I,−I} only when
  the derivative equation already fails. H/2 has pairing 1 and exp(2πH/2)=−I,
  excluding a half-coroot.
- Conjugation by diag(e^(it),e^(−it)) sends E₁₂ to e^(2it)E₁₂ and E₂₁ to
  e^(−2it)E₂₁. Differentiation at t=0 gives [H,E₁₂]=2iE₁₂ and
  [H,E₂₁]=−2iE₂₁, agreeing with dχ=iα and excluding a missing imaginary factor.
- For SU(2)→SO(3), H maps to 2Z for a period-2π rotation generator Z;
  α(2Z)=2 and the kernel is {I,−I}, the whole centre, so injectivity is not required
  and the kernel bound is attained. The element diag(i,−i) lies in no kernel: conjugation
  by it sends E₁₂ to −E₁₂, so it is not central.
- For a torus, including the trivial group, there are no nonzero roots or rank-one
  maps; no division by the squared norm of the zero weight is performed.
- In U(2), the central and semisimple generators (1,1),(1,−1) span index 2 in ℤ²;
  the lattice vector (1,0) is not their integral combination. In rank zero all lattices vanish.

*Needs:* LieGroups Layers 1, 2 and 6 (adjoint representation, the closed-subgroup
theorem, maximal tori and the compact real root adapter); Tau Ceti's Weyl chambers; Mathlib `IsZLattice`; Tau Ceti's integral lattice API.

Define `HamiltonianTorusData` on a smooth two-form σ, a torus action and a map
μ:M→t* by smoothness of both maps, preservation of σ, invariance of μ and
σ_x(d(g↦g·x)_1 ξ,v)=d(μ_ξ)_x(v). This is the abelian specialization of the
HamiltonianReduction R1 equations on native smooth-form and manifold carriers.
The geometric headlines separately require σ symplectic and T compact connected.

- Adding a constant in t* to μ preserves these equations.
- Products of Hamiltonian torus data use the direct sum of the moment maps and forms.
- Restriction along a torus homomorphism composes μ with its dual differential.

**Checks.**

- On ℂ with dx∧dy, positive rotation has field (−y,x), giving contraction
  −y dy−x dx=d(−|z|²/2); the positive quadratic moment fails this equation.
- Reversed rotation has field (y,−x), giving d(|z|²/2); adding 7 leaves the derivative unchanged.
- The trivial torus on a point satisfies the equations with the unique zero-dimensional moment map.

*Needs:* HamiltonianReduction R1; Mathlib `mfderiv`; Tau Ceti `SmoothTwoForm`.

### 1.2 Fixed loci with a preserved metric

Let K be an arbitrary group acting on M by smooth diffeomorphisms preserving ω and a
specified smooth positive definite Riemannian metric g. No topology or Lie-group structure
on K is required. Define M^K as the common fixed set. Prove it is closed and each connected
component is an embedded symplectic submanifold, with
`T_p(M^K)={v∈T_pM : d(k)_p v=v for every k∈K}` at every fixed p. Components
may have different even dimensions. Construct the restricted symplectic form, tangent
inclusion and symplectic normal bundle, and prove naturality under equivariant
symplectic diffeomorphisms. Each component is totally geodesic for g. This theorem
requires neither completeness of g nor compactness of M or K.

Use HopfRinow's transport of local exponential maps under smooth Riemannian isometries.
For each fixed p choose a tangent ball on which exp_p is a diffeomorphism onto its
image. Every d(k)_p preserves that same ball, so equivariance and injectivity identify
the common fixed set in its image with the ball's intersection with the common fixed
subspace. This supplies the embedded charts and tangent identity without intersecting
submanifolds transversely. Construct the derivative representation at p using native
`Representation ℝ K (TangentSpace I p)` and its `Representation.invariants` submodule.

Polar-normalize the bundle endomorphism A defined by `g(Au,v)=ω(u,v)`:
`J=A(−A²)^(−1/2)`. Prove smoothness, `J²=−1`, positivity `ω(v,Jv)>0` for v≠0,
and invariance under every element of K. The common fixed tangent subspace is J-stable;
testing a vector against Jv proves nondegeneracy of the restricted form. This uses the
given invariant metric directly. As examples, an irrational rotation of the first
factor of ℂ² generates an infinite cyclic group with fixed locus `{0}×ℂ`; the
symplectic shear `(q,p)↦(q+p,p)` on ℝ² instead has a Lagrangian fixed line and
preserves no positive definite smooth Riemannian metric. Prove both claims, using
the derivative at the origin for the shear's metric obstruction.
The invariant-subspace stability calculation is part of the API: if J commutes with
the derivative representation, ρ(k)Jv=Jρ(k)v=Jv for every fixed v. For the invariant-J/exponential method see also
[Cannas da Silva, Homework21, exercise2](https://www.math.ist.utl.pt/~acannas/Books/symplectic.pdf#page=182).

For a compact Lie group with a smooth symplectic action, average a smooth Riemannian
metric and apply this theorem and its polar construction. Averaging an arbitrary
compatible J does not preserve J²=−1. Construct an equivariant tubular neighborhood;
prove equivariant Darboux near a fixed point and relative normal form along a fixed
component using equivariant Moser, with GeometricTopology Layer1's generic tubular
neighborhood as the nonequivariant floor.

For a torus-fixed p choose a unitary weight decomposition of its tangent space. In local coordinates
ω=Σdqᵢ∧dpᵢ and
**μ=μ(p)−½Σαᵢ(qᵢ²+pᵢ²)** for true complex weights αᵢ of
`zᵢ↦exp(i⟨αᵢ,ξ⟩)zᵢ` in compatible complex coordinates. Thus the local image germ agrees with the germ of
μ(p)−cone{αᵢ}, and index of μ^ξ is twice the number of positive αᵢ(ξ). Relate integer αᵢ to the lattice, not just a chosen list of real vectors. Zero weights give fixed
tangent directions. Prove the quadratic identity, stabilizers, orbit rank and local moment cone.
For nonfixed orbits of general proper Hamiltonian actions of arbitrary finite-dimensional Lie groups consume HamiltonianReduction R3.1's full proper-orbit symplectic slice/Marle–Guillemin–Sternberg model, including its m*, coadjoint and slice directions, compact stabilizer and moment normalization. Construct its coordinate-compatible compact-torus specialization here and use it for global convexity and singularity descriptions. Its equivariant tube and relative Moser flow-germ theorem apply along the actual proper orbit; the compact-orbit averaging argument is a specialization.

The common fixed-set and polar-complex-structure API includes:

- At a fixed point, the tangent inclusion has image the common invariant subspace.
- A commuting complex structure preserves that subspace, and the restricted form is nondegenerate.
- Equivariant symplectomorphisms transport fixed components, restricted forms and normal bundles;
  the preserved-metric exponential charts make the components totally geodesic.

**Checks.**

- Trivial K gives M^K=M; a rotation by an irrational multiple of 2π on the first ℂ
  coordinate gives M^K={0}×ℂ with tangent dimension 2.
- The shear on ℝ² fixes p=0, where the form restricts to zero; for an invariant metric
  its derivative would send e₂ to e₁+e₂ with equal norm for every iterate, contradicting positivity.
- On ℝ², exp₀(v)=v; for the quarter-turn R and v=(1,0),
  exp₀(dR₀v)=(0,1)=R(exp₀v). On an open unit disk the same identity holds
  for v=(1/2,0), giving (0,1/2) on both sides without completeness.
- With Euclidean g and ω=dq∧dp, A(q,p)=(−p,q), −A²=1, J=A and ω(e₁,Je₁)=1;
  replacing J by −J gives −1 and fails positivity.
- A positive weight +1 gives μ=−(q²+p²)/2 with Hessian −Id and index 2;
  weight −1 gives index 0. A zero weight gives a fixed tangent plane.

For the fixed-locus proof use Cannas da Silva, Homework 21, exercise 2, p. 174,
with the specified invariant metric supplying the same equivariant exponential argument
for arbitrary K; the polar construction is Proposition 12.6, p. 70.
The local model and quadratic weight formula use Hilgert–Neeb–Plank, Lemmas 2.1–2.2,
pp. 141–143. Translate their infinitesimal-action and compatible-complex-structure
conventions to the positive fundamental field and ω(v,Jv)>0 used here; the weight +1
calculation above fixes the resulting minus sign.

*Needs:* HopfRinow Layers 1 and 4; Tau Ceti's Riemannian-isometry exponential identity;
HeegaardFloer §4.1; GeometricTopology Layer 1;
HamiltonianReduction R3.1; Layer 1.1's weight dictionary.

### Examples

The trivial action, irrational cyclic rotation and shear above distinguish compactness
from the preserved-metric hypothesis. The weight +1 and −1 planes pin the moment sign.

### Dependencies

LieGroups Layers 1, 2 and 6, Tau Ceti's Weyl chambers, HamiltonianReduction R1/R3.1,
HopfRinow Layers 1 and 4, HeegaardFloer §4.1 and GeometricTopology Layer 1.

## Layer 2: Morse–Bott and moment-map topology

### 2.1 Moment components and equivariant perfection

Consume MorseTheory M5's critical-submanifold/normal-Hessian carriers,
normal form and negative-disc-bundle attachment theorem. Identify these carriers
and indices for each moment component below. Consume
[CharacteristicClasses C2–C3](../../CharacteristicClasses/README.md)'s ordinary
cohomological Thom/Euler and Leray–Hirsch interfaces for the resulting relative
(co)homology; use twisted coefficients or F₂ for general negative bundles.
Moment-action negative bundles are complex, giving their integral orientations. Noncompact flow conclusions require an explicit properness or completeness hypothesis;
the application here uses compact M. Prove generic moment components have critical set M^T and
Morse–Bott Hessian determined by nonzero weights, with even index and coindex. For every ξ the critical set is M^(T_ξ), where T_ξ is the closure of exp(Rξ);
use this closure for irrational as well as rational directions.

Prove connectedness of scalar moment levels, including critical levels, by the even-index/coindex
handle argument. Prove perfection of moment-map Morse–Bott functions over rational coefficients using
the equivariant Euler-class/Thom argument. Consume
CharacteristicClasses C1's torus universal-bundle models, including the finite
models `ET_N=(S^(2N+1))^m`, `BT_N=(CP^N)^m`, their standard inclusions/colimits,
contractibility/free action and integral cohomology. Use its generator sign:
the standard coordinate-character class is `u_i=−h_i`, where h_i is the positive
dual-character hyperplane class; hence `H*(BT;ℤ)=ℤ[u₁,…,u_m]` and a weight
`Σ a_iχ_i` has first Chern class `Σ a_i u_i=−Σ a_i h_i`. Keep this sign in
equivariant Euler classes. Compare Borel constructions to those existing models.
Build the Borel fibration M_T→BT, equivariant Thom classes, Euler classes, localization by
nonzero weights, Leray–Hirsch and integral equivariant formality when ordinary cohomology is
free/even. These constructions are explicit targets here over AT’s ordinary cohomology.
Build equivariant Morse exact sequences and prove rational perfection.
Integral conclusions require their own proof and torsion hypotheses: when fixed points are isolated,
even cells give free integral homology/cohomology, vanishing odd groups, rank H^(2k) equal to the number of critical points of index 2k, unique maximum/minimum and simple connectedness. Do not assert these conclusions for arbitrary
positive-dimensional fixed components. Apply HamiltonianReduction R2a.2–4
to compact coadjoint orbits: its regular heights have critical set Wμ, its root-plane
Hessians give the indices, and its finite hyperplane avoidance gives distinct values.
The general Hamiltonian torus Morse–Bott and equivariant-perfection targets above
apply beyond coadjoint orbits.

For the Borel construction and equivariant Euler classes prove:

- Pullback along equivariant maps commutes with the map to BT and with ordinary restriction.
- A complex weight line of character Σa_iχ_i has Euler class Σa_i u_i.
- Inverting nonzero weights identifies equivariant cohomology with that of the fixed locus
  over ℚ; the complex normal Euler classes give the Morse exact sequences.

The moment-component topology uses Cannas da Silva, §27.1 and Homework 21,
exercises 3–5, pp. 170–175; rational equivariant perfection uses Kirwan,
*Cohomology of quotients*, Part I, §§4–5, pp. 44–78 (cited by locator).

**Checks.**

- On the SU(2) coadjoint sphere, HamiltonianReduction R2a.2–4 gives two height
  critical points of indices 0 and 2, hence integral Betti numbers (1,0,1).
- For a central coadjoint orbit there is one point, its index is 0 and its only
  nonzero Betti number is b₀=1; the sphere's two-point count does not apply.
- A trivial action on a symplectic two-torus has one fixed component, but H¹ has rank 2;
  the isolated-fixed-point hypothesis cannot be dropped from the even-cell conclusion.
- For the trivial rank-zero torus, M_T=M and BT is a point; for a weight-2 circle line,
  its Euler class is 2u=−2h, not 2h.
- An irrational ξ in a two-torus has closure T, whereas ξ=0 has closure {1};
  the critical sets are respectively M^T and all of M.

*Needs:* Layer 1; HamiltonianReduction R2a.2–4 for the coadjoint application;
MorseTheory M1–M5; CharacteristicClasses C1–C3;
AlgebraicTopology Stage 6. The isolated-fixed-point integral conclusions additionally
use the complex orientations of the negative bundles.

### Examples

S² and CP² have even cells; a trivial action on a positive-genus surface retains
its odd cohomology. Compact coadjoint-orbit heights and their even-cell models
use HamiltonianReduction R2a.2–4.

### Dependencies

Layer 1, HamiltonianReduction R2a.2–4, MorseTheory M1–M5, CharacteristicClasses C1–C3,
and AlgebraicTopology Stage 6.

## Layer 3: Convexity and matrix examples

### 3.1 Torus and nonabelian convexity

The headline `torus_convexity` states the following for every compact connected
Hamiltonian T-space (Cannas da Silva, Theorem 27.1, p. 169): μ(M) is the convex hull of images of **fixed
components**, hence a compact polytope; every μ-fiber is connected. Build the torus local-to-global argument from proper moment map, local convexity cones and local
fiber connectedness (Condevaux–Dazord–Molino/Hilgert–Neeb–Plank), prove these hypotheses from
the symplectic slice normal form, then obtain convexity and connectedness at critical as well as
regular values. Finiteness of components is proved
from compact fixed-set manifold and local models; fixed points themselves need not be finite.
Prove restriction to subtori, translation/naturality and product polytopes. If the action is effective,
show μ(M) has full affine dimension dim T; otherwise identify its effective quotient and affine support.
Torus orbits are isotropic, hence dim T≤½dim M for effective actions. A regular level for a torus
is coisotropic; quotient dimension is dim M−2dim T, with an orbifold if only locally free.

For compact connected K acting on compact connected M prove **Kirwan convexity**
(Lerman–Meinrenken–Tolman–Woodward, arXiv:dg-ga/9603015v1, Theorem 1.1, for convexity,
polyhedrality and connected fibers): μ(M)∩t*_+ is a compact convex polytope
in a chosen closed positive Weyl chamber, and the fibers of the orbit-projected map to t*_+ are
connected. The polytope is rational, with facet directions in the weight lattice and real
support constants, because on the symplectic cross-section the local cone of the image at
the value of a point m is t₀^⊥ plus the cone on the t-weights of the symplectic slice at m,
where t₀ is the Lie algebra of the stabilizer of m (Hilgert–Neeb–Plank, Theorem 4.1(v),
p. 151): the slice weights lie in the weight lattice and t₀^⊥ is a rational subspace.
The full K-moment image in k* need not be convex. Lerman–Meinrenken–Tolman–Woodward use
ι_(ξ_M)ω=−dΦ_ξ; transport by Φ=−μ and the corresponding opposite chamber. Consume
[HamiltonianReduction R2](../HamiltonianReduction/README.md#r2-coadjoint-orbits-and-kks)'s compact
coadjoint-orbit, closed-chamber and centralizer theorems, including
`k*/K≅z(k)*×t*_(ss,+)`, on LieGroups Layer 6 and Tau Ceti's Weyl chambers. Maximal-torus
conjugacy, Weyl uniqueness and this quotient are inputs from those owners. Construct the symplectic cross-section
and prove its moment-map and stabilizer comparisons. Prove Kirwan by cross-sections
and the local-to-global theorem. Also build the norm-square moment stratification,
including minimal degeneracy and strata. Before its convergence theorem, prove the
specialized degenerate gradient inequality for the transverse MGS polynomial
`p(η,v)=‖ν+η+μ_V(v)‖²`: near a critical point of value b there are
`c>0` and `0<θ<1` with `‖∇p‖≥c|p−b|^θ`. Transport it through the
slice coordinates, compare the chosen smooth metric with Euclidean norms on
relatively compact charts, and obtain constants near each compact critical
component by a finite cover, restricting `|f−b|<1` when combining exponents.
For `f=‖μ‖²` construct the negative-gradient semiflow, using compactness of M
for forward existence. Prove trapping neighborhoods and eventual entry on its
stable stratum, the finite-length bound
`∫_[t₀,∞) ‖∇f(φ_t x)‖ dt ≤ (f(φ_t₀ x)−b)^(1−θ)/(c(1−θ))`,
and tails locally uniform on that stratum, hence uniform on its compact subsets.
Construct the single-point limit and the continuous strong deformation
retraction of the stable stratum onto its critical component. Use the
Lerman–Duistermaat route (Lerman, arXiv:math/0410568v2, Theorem 1.1 and its
proof, pp. 3–5) with these explicit targets; an energy band alone
need not lie near one critical component. These analytic and stratification
targets are independent of the chosen convexity proof and do not assume a
nondegenerate Morse estimate. Keep stabilizer/central directions in the lattice
conventions.

For the local convexity cones, cross-sections and stable strata, prove naturality
under equivariant symplectomorphisms, compatibility with restriction to a subtorus,
and product compatibility. A stable stratum is the set of points whose negative-gradient
limit belongs to its specified critical component; the finite-length and uniform-tail
theorems above construct this limit and its continuous retraction.

**Checks.**

- A point with the trivial torus has image {0}, fixed-image hull {0} and one-point fiber;
  an off-image fiber is empty and preconnected.
- A trivial circle action on S² has image {c}, of affine dimension 0 rather than 1.
- A nonzero SU(2) coadjoint orbit is a sphere in ℝ³, whose midpoint 0 is outside the orbit;
  its chamber image is one point and its torus projection is an interval.
- For p(x)=x⁴, |∇p|=4|x|³=4|p|^(3/4), and the tail bound is |x₀|;
  at x₀=0 both sides vanish. A quadratic Morse estimate cannot replace this exponent.

*Needs:* Layers 1–2; HamiltonianReduction R2/R3.1. The local-to-global route also
requires its properness, local-cone and local-fiber-connectedness targets above
(Hilgert–Neeb–Plank, Theorems 3.10 and 4.1, pp. 149–151).

### 3.2 Coadjoint projections and Schur–Horn

Prove Kostant **compact coadjoint-orbit projection convexity**, `pr_t*(K·ν)=conv(W·ν)` for ν∈t*;
this is the precise version meant here, not the different nonlinear Iwasawa projection theorem.
For U(n), fix ⟨H,X⟩=−i tr(HX) with diagonal X=i diag(θ), so μ is the diagonal list, and show the diagonal moment image is the permutahedron of
eigenvalues. The headline `schur_horn` states Schur–Horn in both directions for every n≥0;
prove its equivalence with majorization (partial sums of
sorted entries and total trace). Repeated eigenvalues give lower-dimensional smooth coadjoint orbits but the same convex-hull
statement. Construct a 2×2 Hermitian matrix for every majorized diagonal and given eigenvalues and rank-one CP^(n−1) simplex as acceptance cases.

**Checks.**

- Spectrum (2,0) gives diagonals (2t,2−2t) for 0≤t≤1: a unitary first row
  (√t,√(1−t)) realizes the first coordinate; t=1/2 gives (1,1).
- Spectrum (1,1) gives only (1,1), since UIdU*=Id. A strict-spectrum hypothesis would lose this case.
- The empty spectrum has one empty diagonal and one permutation, so both sets are the singleton {()}.

The coadjoint projection form follows from Cannas da Silva, Theorem 27.1, applied
to the compact orbit; the matrix identification and the two-sided realization are
this section's application. *Needs:* HamiltonianReduction R2; Layer 3.1;
OperatorTheory/Majorization Part A, MAJ-A18–A25, for the forward comparison;
Mathlib `Matrix.unitaryGroup` and `convexHull`.

### 3.3 The word121 Bott–Samelson moment polygon

Use [SchubertGeometry S2 and its word121 incidence comparison](../../SchubertGeometry/README.md)
for the existing smooth projective threefold
`X={(L₁,P,L):L₁⊂P₀, L₁⊂P, L⊂P}`, where P₀=span(e₁,e₂)⊂ℂ³,
L₁,L are lines and P is a plane. Use its actual embedding in
Gr₁(ℂ³)×Gr₂(ℂ³)×Gr₁(ℂ³), its complex-point/manifold comparison,
and π:X→Flag(ℂ³), π(L₁,P,L)=(L,P). T=(S¹)³ acts diagonally and
preserves P₀. The full ambient U(3) action does not preserve this fixed
P₀ incidence condition; a restricted Hermitian-valued ambient map is
not asserted to be a U(3) moment map on X. This is the worked
incidence model with two separately marked line factors; its map to the full flag
forgets the first line.

In the acceptance file `BottSamelson.V3` denotes `EuclideanSpace` ℂ (Fin 3),
`BottSamelson.initialPlane` is span(e₁,e₂), `BottSamelson.projectorDiagonal`
is the real diagonal of the orthogonal projector, and `BottSamelson.moment` is
the weighted sum a diag(Π_L₁)+b diag(Π_P)+c diag(Π_L). These definitions use
actual submodules and their ranks; the incidence conditions are the ones displayed above.

- The diagonal entries of a projector are nonnegative and sum to its complex rank.
- Coordinate subspaces give their 0–1 coordinate indicators, and diagonal unitary
  conjugation leaves the projector diagonal invariant.
- The weighted moment has trace a+2b+c on the incidence variety and is linear in the weights.

**Checks.**

- The zero and full subspaces have projector diagonals (0,0,0) and (1,1,1);
  the initial plane has (1,1,0) and rank 2, excluding the full-space model.
- The line span(e₁+e₂) has diagonal (1/2,1/2,0), not (1,1,0), since the projector
  divides by the squared norm 2. Its trace is 1.
- At (e₁,span(e₁,e₂),e₂) and (a,b,c)=(1,1,1), the weighted diagonal is (2,2,0).
  The line e₃ is not contained in the initial plane, excluding a full flag product.

*Needs:* Mathlib `Submodule.starProjection`; SchubertGeometry S2 and S9;
HamiltonianReduction R2; ComplexKahlerGeometry K7.2.

**Forms and the projector formula.** On a complex Grassmannian let Π_V
be the orthogonal projector for the standard Hermitian form, using native
`Submodule.starProjection` on `EuclideanSpace ℂ (Fin 3)`. Construct its
smooth dependence on the subspace through the existing Grassmannian
charts and the unitary orbit map. Identify the orbit of rank-r projectors
with this same Grassmannian, for r=1,2, with tangent and action maps.
Use R2's KKS form σ_r, pairing `⟨H,ξ⟩=−i tr(Hξ)`, and inclusion
moment map V↦Π_V. Compare the form with the Plücker pullback of
ComplexKahlerGeometry K7.2's positive Fubini–Study form of projective-line
area1: in these conventions `σ_r=−2π Plücker*ω_FS`. Prove the sign
and factor in a rank-one affine chart and then by unitary invariance.

For a,b,c>0 restrict `aσ₁+bσ₂+cσ₁` from the three factors to X.
Prove it is closed and nondegenerate: its negative is the restriction
of a positive product Kähler form through the holomorphic immersion.
The ambient diagonal U(3) moment is
`H=aΠ_(L₁)+bΠ_P+cΠ_L`. Restrict to T and prove its actual moment map
is `μ=diag(H)∈ℝ³`, with `ι_(ξ_X)ω=d⟨μ,ξ⟩` in the standing convention.
Its coordinate sum is S=a+2b+c. Prove the kernel of the T action is
exactly the diagonal circle, so the effective torus has dimension2 and
the image lies in that affine trace plane. If using the positive
Kähler form −ω, transport the moment map to −μ; reflect the entire
polygon and retain the same period normalization.

**Fixed points and exact image.** Write ij for span(e_i,e_j).
Prove that X has precisely the following eight T-fixed flags, by the
coordinate-subspace criterion and the incidence conditions. In the table
L₁=e_i and L=e_j denote their spans.

| (L₁,P,L) | μ |
| --- | --- |
| (e₁,12,e₁) | (a+b+c,b,0) |
| (e₁,12,e₂) | (a+b,b+c,0) |
| (e₁,13,e₁) | (a+b+c,0,b) |
| (e₁,13,e₃) | (a+b,0,b+c) |
| (e₂,12,e₁) | (b+c,a+b,0) |
| (e₂,12,e₂) | (b,a+b+c,0) |
| (e₂,23,e₂) | (0,a+b+c,b) |
| (e₂,23,e₃) | (0,a+b,b+c) |

Define `BottSamelson.fixedMoment` by the eight rows of this table. Its API
retains the row labels when two values coincide, its trace S and its behavior
under swapping the first two coordinates and the corresponding flags.
Use Layer 3.1's torus convexity theorem (Cannas da Silva, Theorem 27.1, p. 169) to identify μ(X) with the convex
hull of this actual finite list. Prove its exact inequality description

`x+y+z=S,  0≤x≤a+b+c,  0≤y≤a+b+c,  0≤z≤b+c`.

Give both inclusions and a finite convex-combination or half-plane
vertex argument. Its six vertices, in cyclic order, are rows
1,3,4,8,7,6. Prove these are all the extreme points and that each
listed inequality cuts out the stated edge in the trace plane.
Rows2 and5 lie strictly inside the edge z=0, which joins rows1 and6:
with D=a+c, their coefficients of row6 on that segment are c/D
and a/D, respectively. They have the same image exactly when a=c;
their fixed flags are distinct even then. For a≠c there are eight
distinct fixed-point images and six vertices; for a=c there are seven
distinct images and six vertices. Thus the T action on this real
six-dimensional X has complexity1; T5's complexity-zero identification
of fixed points with vertices is not applied here.

At a=b=c=1 give the six vertices
`(3,1,0),(3,0,1),(2,0,2),(0,2,2),(0,3,1),(1,3,0)`
and the common nonvertex fixed value `(2,2,0)`. At the boundary a=0,
b,c>0, identify H with the pullback through π of `bΠ_P+cΠ_L`.
Its image is the flag permutahedron of eigenvalues (b+c,b,0), since
π is onto. The form at this boundary is π* of the flag KKS form
and is degenerate along the exceptional P¹ fibres; the image claim
uses the flag and surjectivity, not a symplectic theorem on a degenerate
form. Prove these comparisons through the existing π and its exceptional
locus, rather than identifying diagrams by their vertex counts.

The two image theorems are `BottSamelson.incidence_moment_range` and
`BottSamelson.fixedMoment_convexHull` in `Suggested.lean`.
For the product-Grassmannian construction compare
[Escobar, *Brick manifolds and toric varieties of brick polytopes*, §3.2, p. 8, and §4.1, pp. 12–13](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v23i2p25/pdf/);
the explicit weights, signs, inequalities and boundary maps above are
part of this target.

**Checks.**

- At (a,b,c)=(1,1,1), the list has eight rows, seven distinct values and six vertices;
  rows 2 and 5 both equal (2,2,0), so fixed flags cannot be identified with vertices.
- At (a,b,c)=(2,1,1), rows 2 and 5 are (3,2,0) and (2,3,0), with row-6
  coefficients 1/3 and 2/3 on the edge from (4,1,0) to (1,4,0).
- At a=0,b=c=1, the eight rows collapse to the six permutations of (2,1,0).
  The image is still a hexagon but the form vanishes on the exceptional line fiber.
- At the line e₁ in CP¹ with affine coordinate w=x+iy, the projector moment is
  (1/(1+|w|²),|w|²/(1+|w|²)); its first component has quadratic term −|w|².
  The positive action on e₁ induces weight −1 on w, so contraction forces
  σ(∂x,∂y)=−2. The area-1 Fubini–Study value is 1/π, verifying σ=−2π ω_FS.

*Needs:* Layer 3.1; Layer 1's sign convention; SchubertGeometry S2/S9 and its
word121 acceptance calculation; HamiltonianReduction R2; ComplexKahlerGeometry K7.2.
The finite-list inequality theorem uses only convex geometry once the values are known.

### Examples

Schur–Horn includes repeated and empty spectra. The word121 example has complexity 1,
including nonvertex fixed values; its zero-weight boundary uses the flag projection.

### Dependencies

Layers 1–2; HamiltonianReduction R2/R3.1; OperatorTheory/Majorization Part A;
SchubertGeometry S2/S9; ComplexKahlerGeometry K7.2. The gradient-convergence route
uses the specialized polynomial gradient inequality stated in §3.1.

## Layer 4: Liouville and Duistermaat–Heckman

### 4.1 Hamiltonian measures and level bundles

Apply the Liouville measure of SmoothBundlesConnections B2.4 to the symplectic
density |ω^n/n!|. Prove invariance under symplectomorphisms and Hamiltonian flows,
restriction/products and the total-volume formulas below, using the supplier's
chart and density-integral comparison (Cannas da Silva, §30.1, pp. 191–192).
These are Hamiltonian applications of that measure, with its symplectic normalization.

- A symplectomorphism pushes forward Liouville measure to Liouville measure.
- Products use the product symplectic form and the product measure; restriction uses the restricted form.
- For positive r in real dimension 2n, replacing ω by rω multiplies the measure by r^n.

**Checks.**

- The unit square for dx∧dy has mass 1, excluding the zero measure.
- For 2dx∧dy the same square has mass 2, excluding an unnormalized volume choice.
- A point in dimension zero has mass 1; the product of two unit symplectic squares has mass 1.

*Needs:* SmoothBundlesConnections B2.4; DifferentialGeometry §5.5; HamiltonianReduction R1.

For a Hamiltonian torus space with **proper** μ define DH measure as μ_*Liouville
(Cannas da Silva, Definition 30.2 and Theorem 30.3, p. 191). Properness gives
local finiteness even when M is noncompact. For compact connected M and an effective action prove
absolute continuity with respect to the lattice-normalized Lebesgue measure on t*, with polynomial
density on each connected chamber of regular values of degree at most n−m. For a noneffective action
state absolute continuity on its affine support, not full ambient t*. Prove density from reduced volume
and orbit period, including finite generic stabilizers when applicable. For each locally-free Hamiltonian chamber use R3's actual possibly ineffective proper étale slice presentation S and restricted symplectic form. Construct the actual level principal-torus orbibundle using Orbifolds O4, item 1 (orbibundles and principal bundles): for the left T-action on Z and a slice object x, put P=S₀×T, with right action (x,t)·k=(x,tk), and let a retained arrow h:x→y act by (x,t)↦(y,ht). The map (x,t)↦t⁻¹x is arrow-invariant and right-equivariant for z·k=k⁻¹z; prove these formulas and their slice-refinement comparisons. Construct a T-invariant connection on the locally-free level by an invariant orbit/horizontal splitting, with α(ξ_right)=ξ; its pullback gives the arrow-invariant principal connection on P. This is a CT specialization of O4's generic bundle/connection API, not an additional object assumed from R3. Consume [Orbifolds O1–O5](../../Orbifolds/README.md)'s generic presentations, invariant forms, represented bundles, classifying/coarse/de Rham comparisons and full-isotropy integration. O4-T supplies the normalized thin/CW and principal-torus comparison on the same model, with T1's actual character-basis/period datum. Prove that T4's concrete level bundle and R3's restricted symplectic form identify with these carriers before evaluating classes or integrals. O7's later completed-model comparison is not a prerequisite.

Construct the application classifier κ on O4-T's diagonal-Sing CW model `BS` from that theorem's intrinsic represented bundle, with its object/refinement comparisons. For every dual character χ pull back the normalized integral class `h_χ=-u_χ` to `H²(BS;ℤ)`, take its rational image and use O4-S for coarse rational cohomology. Prove O4-W/O4-T identifies its real image with the actual connection curvature `[F_χ/(2π)]` in R3's invariant-form complex. The arbitrary reduced symplectic class lies in real `H²(Ω(S))≃H²(BS;ℝ)` and need not be rational. Retain actual character-basis, atlas, connection and refinement maps; agreement on small charts alone does not identify these classes.

Use O5's full inverse-stabilizer integral for reduced volume with its actual orientation and ineffective isotropy. Rational coarse comparison does not turn it into unweighted coarse volume. In a connected common-weight-factor example with generic ineffective order k, keep the original model, effective reduction and possibly different descended bundle distinct. Compare classes only through actual bundle/character maps and prove `∫_effective=k·∫_full` for corresponding coarse forms. Integral descent of an isotropy-sensitive bundle does not follow from rational coarse cohomology. These application comparisons include the full ineffective scope and the effective special case.

The pushforward and level-bundle API includes:

- For a Borel set A, DH(A) is the Liouville mass of μ⁻¹(A); moment shifts translate DH.
- Products push forward to product DH measures; proper moment maps give local finiteness.
- Retained slice arrows act on the level bundle by (x,t)↦(hx,ht), and the map
  (x,t)↦t⁻¹x is invariant under those arrows and intertwines the right torus actions.

**Checks.**

- S² with height moment has DH mass 4π on [−1,1], hence density 2π;
  the same sphere with a trivial circle action has mass 4π concentrated at one point.
- For an arrow h and right multiplication k, (ht)⁻¹(hx)=t⁻¹x and
  (tk)⁻¹x=k⁻¹(t⁻¹x); using t rather than t⁻¹ would reverse the required action.
- For a point with isotropy of order k, the classifying model retains BG and its
  full-isotropy integral of 1 is 1/k; for k=1 both are the ordinary point model.

*Needs:* SmoothBundlesConnections B2.4; HamiltonianReduction R3;
Orbifolds O4, item 1 (orbibundles and principal bundles), O4-N/S/R/K/W/T and O5; Layer 1's character lattice.

### 4.2 Reduced classes and chamberwise density

Over a contractible chamber U on which reduction is free and proper, construct a smooth identification
of reduced spaces and principal bundles. With connection α valued in t, invariant torus convention
ι_ξMω=dμ_ξ and π*ω_red=i*ω, use the principal right action z·g=g⁻¹z,
α(ξ^right)=ξ and therefore α(ξ^left)=−ξ, with curvature F=dα. Prove the variation identity (Cannas da Silva, Proposition 30.7 and
Theorem 30.8, p. 194, transported from its left-connection convention):
**[ω_red(c)] = [ω_red(c₀)] + ⟨c−c₀,[F]⟩**. For a circle write `[F/(2π)]=c₁(P)_ℝ` in SBC B6.2’s convention: c₁(P) is the class of the dual-character associated line. It is the positive h class, whereas T2’s standard-character line has class u=−h. Thus the same variation formula is +2π(c−c₀)c₁(P)_ℝ. Derive the sign from λ_level=λ_horizontal−⟨c,α⟩ and ω=−dλ.
A connection normalized on left fundamental fields is −α and has negative curvature;
its equivalent variation formula has a minus sign. Keep this adapter explicit. Prove Gauss–Manin transport and polynomial volume by expanding the
powers of this class. Over a contractible chamber U with locally free
proper reduction, construct the smooth orbifold identifications
`M_c≃M_c₀` and the corresponding orbifold principal torus bundle. Use
invariant horizontal lifts and properness to transport the level bundles,
and prove the presentation/Morita and Gauss–Manin comparisons. In these
identifications prove the same variation identity in `H²(Ω(S))` (or its
compared `H²(BS;ℝ)`), with `[F/(2π)]` the real image of the rational
orbifold dual-character Chern class. The symplectic classes remain real.
The measure theorem must handle critical values as a null set, and show the density's chamberwise
polynomial continuation and support; no smoothness across all walls is asserted.

Examples: S² with longitude θ and height h has ω=dθ∧dh and DH density 2π on
its height interval. C^m with reversed standard rotation z_j↦e^(-iθ_j)z_j and
μ_j=|z_j|²/2 has DH=(2π)^m Lebesgue on the positive orthant. On a free chamber
density=(2π)^m vol(M_c); for toric M total volume=(2π)^n vol(Δ). Prove the CP²
simplex/product formulas and weighted-circle factors. As a curvature-sign test, reduce C²
by the diagonal reversed circle action at μ=(|z₁|²+|z₂|²)/2=c>0: its quotient is CP¹
with area 2πc, and the positive Hopf right connection has SBC B6.2’s dual-character class `c₁(P)` with real image `[F/(2π)]` equal to the positive generator. The standard-character line has the negative class. Verify `[ω_c]=2πc c₁(P)_ℝ` and compare measure variation with reduced cohomology variation directly.

For chamber identifications, curvature and volume prove:

- Horizontal transport identifies the actual reduced spaces and their level bundles;
  isotopic choices induce the same real cohomology transport.
- Character evaluation commutes with curvature and the integral-to-real Chern comparison.
- The top power of the affine reduced class gives a polynomial of degree at most n−m
  for a 2n-dimensional Hamiltonian m-torus manifold (Cannas da Silva, §30.3, pp. 195–196).

**Checks.**

- For the reversed diagonal circle on ℂ², [ω_c]=2πc h and area=2πc;
  changing c by δ changes the area by +2πδ, excluding the opposite curvature sign.
- In ℂ with reversed circle, the preimage of [0,R] is a disk of radius √(2R),
  of area 2πR; in ℂ² the positive quadrant rectangle [0,R]×[0,S] has mass (2π)²RS.
- With common weight k, at μ=c the effective quotient has area 2πc/k;
  full-isotropy volume is 2πc/k². At k=2 these are πc and πc/2, respectively.

*Needs:* Layer 4.1; HamiltonianReduction R3; SmoothBundlesConnections B6.2–B6.3;
Orbifolds O4-W/T and O5; DifferentialGeometry Layer 6.

### Examples

The height sphere, Hopf reduction and common-weight quotient fix the orbit period,
curvature sign and full-isotropy volume. The CP² simplex has Euclidean area c²/2,
hence symplectic volume (2π)²c²/2.

### Dependencies

Layer 1; SmoothBundlesConnections B2.4 and B6.2–B6.3; HamiltonianReduction R3;
Orbifolds O1–O5; DifferentialGeometry §§5.5 and 6. No Kirwan convexity input is needed.

## Layer 5: Toric classification and weighted quotients

### 5.1 Delzant polytopes and classification

A symplectic toric manifold is compact connected symplectic 2n-manifold with effective Hamiltonian
n-torus action. The headline `toric_fibers` states that μ(x)=μ(y) iff y=g·x
for some g∈T. Prove action free over polytope interior,
and isotropy subtori on faces. Fixed points correspond exactly to vertices. If n>0, their images never lie in the
interior; for n=0 the unique point is both a vertex and an interior point.
The latter is **only a complexity-zero conclusion**: for higher complexity a fixed point may have
interior moment image, and finitely many weight rays can span all of t*. Use n independent weights
and local cone structure to prove it rather than the false assertion that every finitely generated
cone lies in a proper half-space.

**Checks.**

- For the point and trivial torus, the polytope is {0} in ℝ⁰; its interior and its
  vertex set both equal {0}, and the unique point is fixed.
- For the effective circle on S², the only fixed images are the two endpoints;
  interior fibers are free circles.
- In the word121 complexity-1 example with weights (1,1,1), (2,2,0) is a fixed
  image which is not a vertex, excluding extension of the vertex equivalence to all actions.

Develop simple rational smooth (Delzant) polytopes with primitive integral inward facet normals; n
normals at each vertex form a Z-basis. Specify support inequalities ⟨x,u_j⟩≥λ_j and translations.
The acceptance predicate uses `IntegralFacetPresentation` for a lattice map,
its `TauCeti.Toric.IsIntegralLattice` witness, finite normal list and real support constants.
`IntegralFacetPresentation.pairing` evaluates a dual vector on a mapped normal, and
`IntegralFacetPresentation.region` intersects the inequalities. The API is:

- Translation by v adds ⟨v,u_j⟩ to each support constant and translates the region.
- Permuting the facet list preserves the region and transports the incidence labels.
- Integral basis changes act dually on points and preserve the pairings and inequalities.

**Checks.**

- Normals +1,−1 with supports 0,−1 give the interval [0,1], since x≥0 and −x≥−1.
- Translating by 2 changes the supports to 2,−3 and gives [2,3]; changing only one
  constant changes the length and is not translation.
- In rank zero the empty list gives the unique point; in rank one the empty list gives
  all of ℝ, so a finite presentation alone does not imply boundedness.

Define `IntegralFacetPresentation.IsSmoothVertex` by requiring exactly n active facets
whose normals form a ℤ-basis. It records the active-facet bijection and its integral basis.
Its API transports bases under facet permutations and lattice isomorphisms, and proves
that every active normal is primitive and that the real tangent cone is simplicial.

**Checks.**

- At 0 in the primitive-normal interval the active normal +1 is a ℤ-basis;
  at 1 the active normal −1 is a ℤ-basis.
- Normals +2,−2 with supports 0,−2 give the same region but fail the integral basis test.
- A duplicated active facet gives two active indices in dimension 1 and fails the
  exact active-facet count. Rank zero has the empty active list and empty basis.

Define `IntegralFacetPresentation.IsDelzant` by compactness, nonempty ambient interior,
smoothness at every extreme point and irredundancy: each listed facet contains a point
where all other inequalities are strict. This is the facet version of Cannas da Silva,
Definition 28.1, pp. 177–178. Its API proves invariance under translations, facet
permutations and integral lattice isomorphisms, and recovers simple rational smooth
polytopes from their irredundant inward-facet presentations.

**Checks.**

- The primitive-normal interval satisfies all four conditions, whereas its doubled-normal
  presentation fails smoothness and its duplicate-facet presentation fails irredundancy.
- Normals +1,−1 with both supports 0 give {0} in ℝ and fail nonempty interior;
  the single inequality x≥0 fails compactness.
- The rank-zero empty presentation is compact, has nonempty interior and satisfies
  smoothness and irredundancy, so it is Delzant.

The headline `toricImage_delzant` asserts existence of such a presentation for every
compact connected effective Hamiltonian torus manifold of dimension 2 dim T. It uses
an exponential with derivative the identity and period condition exp(2πv)=1 iff v∈Λ_Z,
and keeps its given lattice map in the conclusion (Cannas da Silva, Theorem 28.2,
p. 179, and §§29.1–29.3, pp. 183–185).

*Needs:* Layers 1 and 3.1; Tau Ceti `Toric.IsIntegralLattice`; Mathlib convex geometry.

Construct the lattice exact sequence Z^d→Z^n, surjectivity (from a smooth vertex basis) and connected kernel torus N, level in C^d using the reversed action z_j↦e^(-iθ_j)z_j and μ_j=½|z_j|²+λ_j,
Z=(ι*μ)⁻¹(0), and quotient manifold. Prove level regularity,
N freeness/properness, compactness, smooth reduced form and effective residual torus; moment image
is the specified polytope. Prove that an arbitrary symplectic toric moment image is Delzant. Prove Delzant theorem as
existence and uniqueness up to equivariant
symplectomorphism preserving the moment map, with translations corresponding to moment-map shifts.
Lattice GL(n,Z) changes relabel the torus; they are not equivariance for a fixed torus identity. For uniqueness construct local equivariant
models over faces and glue their symplectomorphisms, proving vanishing of the relevant sheaf
obstruction on the convex polytope, as in Delzant/Lerman–Tolman.

Build the face/stabilizer orbit-space dictionary, local vertex models, fundamental group/even-cell
cohomology and facet presentation of the integral cohomology ring (linear lattice relations and
Stanley–Reisner nonface products), plus symplectic class **[ω]=−2πΣ_j λ_j D_j** with D_j the primitive positively
oriented facet-divisor class in the reversed-action/inward-normal convention. Prove the integral
ring via the face/Borel model and equivariant formality of T2; establish the Stanley–Reisner
presentation of the equivariant ring first, then quotient by the linear lattice classes. CP^n, products of spheres, Hirzebruch surfaces
and small corner chops/symplectic blowups are worked acceptance models with exact volume and lattice
checks; the algebraic fan dictionary consumes AnalyticToricGeometry’s `Toric.IsIntegralLattice` and integral cone/fan API.

For the Delzant quotient construction prove independence under relabeling facets,
compatibility with integral affine changes and moment shifts, and the orbit-space
homeomorphism with the given polytope (Cannas da Silva, §§29.1–29.3, pp. 183–185).

**Checks.**

- For [0,c], c>0, normals +1,−1 and supports 0,−c give area 2πc;
  the divisor expression −2πΣλ_jD_j is 2πc times the positive point class.
- The standard n-simplex of size c has volume c^n/n!, hence toric volume
  (2π)^n c^n/n!; for n=0 both are 1.
- The rectangle [0,a]×[0,b] gives S²×S² with volume (2π)²ab and four vertices;
  a doubled facet normal would introduce finite isotropy and cannot define the same smooth presentation.

*Needs:* Layers 2, 3.1 and 4; HamiltonianReduction R3; AnalyticToricGeometry's
integral cone/fan dictionary; AlgebraicTopology Stage 6 and CharacteristicClasses C1–C3.

### 5.2 Weighted reductions and labeled polytopes

For the weighted oscillator take coprime positive integers a,b, ε>0,
`ω=dx₁∧dy₁+dx₂∧dy₂`, and `μ=(a|z₁|²+b|z₂|²)/2` on C².
The negative rotations `θ·(z₁,z₂)=(e^(−iaθ)z₁,e^(−ibθ)z₂)` are its
Hamiltonian flow in the fixed convention. Prove that their least period is
2π when both coordinates are nonzero, and 2π/a or 2π/b on the respective
axes. Construct the equivariant diffeomorphism from the ellipsoid E_ε=μ⁻¹(ε)
to the unit S³ by `(z₁,z₂)↦(√(a/(2ε))z₁,√(b/(2ε))z₂)`.

Give the reduced orbifold two actual slice charts. Over z₁≠0 use
`w↦(√((2ε−b|w|²)/a),w)` on `|w|<√(2ε/b)`, with residual group ℤ/a
acting by `w↦e^(−2πibk/a)w`. Over z₂≠0 use
`u↦(u,√((2ε−a|u|²)/b))` on `|u|<√(2ε/a)`, with residual ℤ/b action
`u↦e^(−2πiak/b)u`. Prove these identify the slice quotients with the
indicated open quotient sets and construct their compatible changes of charts
on the overlap, retaining the finite groups. Coprimality makes each residual
action effective, free away from its center. The axial stabilizers have
orders a,b; an order-one chart is an ordinary smooth point. Compare the
rotation representations with the standard cone charts of angles 2π/a,2π/b.
Construct the coarse homeomorphism to CP¹ by
`[(z₁,z₂)]↦[z₁^b:z₂^a]`, including orbit separation and the two poles.

Pull the reduced form back to each slice and prove it is respectively
`d(Re w)∧d(Im w)` and `d(Re u)∧d(Im u)`. Using T4's inverse-stabilizer
integration, the first chart, whose omitted pole has measure zero, gives
`area(E_ε/S¹)=(1/a)π(2ε/b)=2πε/(ab)`.
At the notes' level ε=1/2 this is π/(ab). Compare the a=b=1 case with
T4's Hopf reduction and its curvature convention. These slice calculations
consume R3's locally-free reduction and T4's orbifold forms/integration;
they do not require the general classification below.

General weighted projective spaces and labeled rational simple polytopes extend Delzant to effective toric orbifolds
(Lerman–Tolman), with facet multiplicity labels; prove orbifold convexity and reconstruction/uniqueness in that model;
smoothness is equivalent to unit labels **and** unimodular vertex cones.
Do not erase finite stabilizers or identify unequal weights with an ordinary smooth CP¹ symplectically.

The slice and labeled-polytope API includes:

- The slice quotient maps agree on overlaps and retain each axial cyclic stabilizer.
- The power map to CP¹ separates full circle orbits, including both axes.
- Facet labels retain finite isotropy under toric-orbifold isomorphisms; unit labels
  give smoothness precisely when every vertex cone is unimodular
  (Lerman–Tolman, arXiv:dg-ga/9511008v1, Theorem 1.5).

**Checks.**

- For a=b=1 the generic and axial periods are 2π, and area=2πε;
  both slices are ordinary smooth disks and agree with Hopf reduction.
- For a=2,b=3 the generic period is 2π, axial periods are π and 2π/3,
  and area=πε/3; at ε=1/2 it is π/6, excluding the smooth-sphere area π.
- In the first chart at (a,b)=(2,3), the nonidentity residual element sends w to −w;
  the chart contribution is half the disk area, namely πε/3. On the second chart
  the order-three rotation is nontrivial off zero. The two power-map axes go to [1:0] and [0:1].

*Needs:* HamiltonianReduction R3; Layer 4's full-isotropy integration;
Orbifolds O1–O5; Layer 5.1 for labeled-polytope reconstruction.

### Examples

CPⁿ, products, Hirzebruch polygons and corner chops test the smooth classification.
Weighted projective lines test the full orbifold scope and its stabilizer-sensitive volume.

### Dependencies

Layers 1–4; HamiltonianReduction R3; Orbifolds O1–O5; AnalyticToricGeometry;
AlgebraicTopology Stage 6; CharacteristicClasses C1–C3.

## Downstream consumers

T4 consumes Orbifolds O4-N/S/R/K/W/T and O5 on R3's actual Hamiltonian presentation and symplectic form and on the level principal-torus orbibundle constructed in T4; T1 supplies the character/period datum. Generic O1–O5 proofs do not consume CT's integration, volume, convexity or DH endpoints. O7's completed-model comparisons are later and are not inputs to either construction. T1→T2→T3. T4's Liouville applications use SmoothBundlesConnections B2.4's density measure; T4's Duistermaat–Heckman theory additionally consumes R3 reduction,
independently of full Kirwan;
T5 consumes torus convexity/reduction, T2 integral equivariant cohomology and T4 exact volumes. Check isolated versus positive-dimensional fixed loci,
noneffective versus full-dimensional DH support, nonabelian chamber versus full image, central torus
factors, repeated eigenvalues and weighted finite isotropy. Every Delzant example verifies the quotient
form and polytope together. Flat periods and Chern signs must agree with cotangent reduction and
prequantization, not just produce a positive density after absolute values.

## References

Cannas da Silva, [*Lectures on Symplectic Geometry*](https://people.math.ethz.ch/~acannas/Papers/lsg.pdf),
§§26–30. Atiyah, *Convexity and commuting Hamiltonians*, Bull. LMS 14 (1982), 1–15;
Guillemin–Sternberg, *Convexity properties of the moment mapping*, Invent. Math. 67 (1982), 491–513;
Kirwan, *Convexity properties of the moment mapping III*, Invent. Math. 77 (1984), 547–552;
Lerman–Meinrenken–Tolman–Woodward, *Non-abelian convexity by symplectic cuts*, Topology 37
(1998), 245–259; Lerman, *Gradient flow of the norm squared of a moment map*, Enseign. Math.
51 (2005), 117–127;
Kirwan, *Cohomology of quotients in symplectic and algebraic geometry*, Princeton (1984);
Duistermaat–Heckman, *On the variation in the cohomology of the symplectic form of the reduced phase
space*, Invent. Math. 69 (1982), 259–268; Delzant, *Hamiltoniens périodiques et images convexes de
l'application moment*, Bull. SMF 116 (1988), 315–339;
Lerman–Tolman, *Hamiltonian torus actions on symplectic orbifolds and toric varieties*, Trans. AMS
349 (1997), 4201–4230.

Moerdijk, [*Orbifolds as Groupoids: an Introduction*](https://arxiv.org/html/math/0203100),
§§4–6, for classifying/coarse comparisons and groupoid bundles;
van den Berg–Moerdijk, [*Univalent completion*](https://eprints.whiterose.ac.uk/127339/1/s00208-017-1614-3.pdf),
§2, for the diagonal nerve of a simplicial groupoid. The generic diagonal-singular construction belongs to Orbifolds O4-T; Layer 4
uses its comparison on the actual Hamiltonian level bundle.

Conrad–Landesman, [*Compact Lie Groups*, Spring 2018](https://math.stanford.edu/~conrad/210CPage/handouts/lie_groups_notes.pdf),
§18, p. 82, Appendix Q, pp. 248–253, and Appendix R, Proposition R.2.1, pp. 254–256,
for the rank-one kernel bound, the integral coroot cocharacter and the isogeny lattice comparison.
Escobar, [*Brick manifolds and toric varieties of brick polytopes*](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v23i2p25/pdf/),
Electronic Journal of Combinatorics 23(2) (2016), P2.25, §3.2 p. 8 and §4.1 pp. 12–13.
Hilgert–Neeb–Plank, *Symplectic convexity theorems and coadjoint orbits*, Compositio
Mathematica 94 (1994), Lemmas 2.1–2.2, pp. 141–143, and Theorems 3.10 and 4.1, pp. 149–151.
