# Hamiltonian convexity, Duistermaat–Heckman and symplectic toric geometry

Develop the geometry and topology of compact Hamiltonian actions, from local weight normal forms to
moment polytopes, reduced symplectic classes and measures, and Delzant classification. Both the
symplectic geometry and the lattice geometry should have full usable APIs; a polytope without its
stabilizers, measure normalization or reconstruction theorem is not the intended result.

## Setting, conventions and prerequisites

Use the [family conventions](../README.md). A torus is a compact connected abelian Lie group with
Lie algebra t and period lattice ker(exp); coordinates use R^m/(2πZ)^m. Define the integral cocharacter lattice Λ_Z=(2π)⁻¹ker(exp)⊂t and its dual weight
lattice; χ maps to (1/i)dχ. Weights pair integrally with Λ_Z and into 2πZ with ker(exp).
Normalize Lebesgue measure on t* so the weight lattice Λ* dual to Λ_Z=(2π)⁻¹ker(exp) has covolume 1;
use Mathlib `IsZLattice`/`Basis.addHaar` and Tau Ceti `Toric.IsIntegralLattice` for scalar-extension data. A Hamiltonian action means the smooth symplectic action and
equivariant moment map of [HamiltonianReduction](../HamiltonianReduction/README.md). Convexity below
assumes compact **connected** M unless explicitly stated otherwise. No assertion of connected fibers
or a bounded polytope is made for arbitrary noncompact M.

Consume Tau Ceti's compatible symplectic linear algebra and smooth forms, ordinary Darboux/Moser from
[HeegaardFloer](https://github.com/TauCetiProject/TauCetiRoadmap/pull/957), forms/integration from
[DifferentialGeometry](../../DifferentialGeometry/README.md), compact group actions/tori/roots from
[LieGroups](../../RepresentationTheory/LieGroups/README.md), quotient structures and integral Chern classes
from [SmoothBundlesConnections](https://github.com/TauCetiProject/TauCetiRoadmap/pull/887), and (co)homological
cellular and duality machinery from [AlgebraicTopology](../../AlgebraicTopology/README.md). For generic proper étale presentation, classifying/coarse, invariant-form, represented-bundle and weighted-integration interfaces, consume [Orbifolds O1–O5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/969), including O4-T's thin/CW torus comparison. That owner consumes the ordinary CC/AT/DG and compactly generated interfaces and constructs their groupoid-specific adapters. T4 owns the application to R3's actual Hamiltonian data, reduced-class variation and DH/reduced-volume normalization, retaining ineffective isotropy and isotropy-sensitive bundles.
Consume [MorseTheory M1–M5](../../MorseTheory/README.md)'s ordinary and abstract
Morse–Bott normal-form, deformation and attachment theory. T2 owns its moment-map
specialization and equivariant perfection.
Symplectic toric manifolds are distinct from algebraic/analytic toric varieties of
[AnalyticToricGeometry](../../../Completed/AnalyticToricGeometry/README.md); lattice comparisons are shared,
while quotient symplectic forms and Hamiltonian classification live here.

## T1. Compact symplectic actions and local models

Consume [LieGroups Layer6](../../RepresentationTheory/LieGroups/README.md)'s compact REAL adapter:
maximal-torus existence/conjugacy/exhaustion, the normalizer/Weyl comparison, actual adjoint root
characters χ_α with dχ_α=iα, the real root/coroot pairing and compact rank-one reflection
representatives. Consume [RootSystems Layer4](../../RepresentationTheory/RootSystems/README.md)'s abstract closed-wall
theory through that comparison. These are the real inputs to the integral refinement here.

Build the full 2π-normalized period/weight dictionary: compare a compact torus with its Lie
algebra modulo ker(exp), construct Λ_Z=(2π)⁻¹ker(exp), identify characters by (1/i)dχ, and
prove the dual lattice, restriction, quotient and integral basis-change formulas. For λ∈ker(exp),
prove α_χ(λ)/(2π)∈ℤ. For each adjoint root, prove 2πα∨∈ker(exp) through its realized compact
rank-one subgroup, and identify the resulting integer character/coroot pairing with the Cartan
integer. For the chosen compact rank-one map φ_α:SU(2)→G, consume Layer6's
normalization `dφ_α(diag(i,−i))=α∨` and check that the selected character convention
`dχ_α=iα` with α(α∨)=2 gives the same Cartan integer; the homomorphism identity gives
`exp_G(2πα∨)=1`. Use this as the consumer-side normalization check against the supplied Layer6 calibration; it
does not split the full torus period lattice integrally. Prove the finite-index lattice comparison under a central isogeny, retaining the full
torus lattice: the real center/semisimple splitting need not split the period lattice integrally.
Verify the index-two central/semisimple coupling for U(2).

LieGroups Layer6 owns maximal tori and the compact real root/Weyl adapter;
[HamiltonianReduction R2](../HamiltonianReduction/README.md#r2-coadjoint-orbits-and-kks) owns the
compact coadjoint chamber/centralizer application. T3 consumes that quotient and owns the
symplectic cross-section and convexity theorem. R2 is independent of this integral refinement.

Construct an invariant compatible almost complex structure and metric by averaging and polar
normalization; averaging an arbitrary compatible J does not preserve J²=−1. Prove a compact group's
fixed locus is a union of embedded symplectic submanifolds, tangent equal to invariant vectors, with
symplectic normal representation. Construct an equivariant tubular neighborhood; prove equivariant
Darboux near a fixed point and relative normal form along a fixed component using equivariant Moser, with
GeometricTopology Layer1’s generic tubular neighborhood as the nonequivariant floor.

For a torus-fixed p choose a unitary weight decomposition of its tangent space. In local coordinates
ω=Σdqᵢ∧dpᵢ and
**μ=μ(p)−½Σαᵢ(qᵢ²+pᵢ²)** for true complex weights αᵢ of
`zᵢ↦exp(i⟨αᵢ,ξ⟩)zᵢ` in compatible complex coordinates. Thus the local image is
μ(p)−cone{αᵢ}, and index of μ^ξ is twice the number of positive αᵢ(ξ). Relate integer αᵢ to the lattice, not just a chosen list of real vectors. Zero weights give fixed
tangent directions. Prove the quadratic identity, stabilizers, orbit rank and local moment cone.
For nonfixed orbits of general proper Hamiltonian actions of arbitrary finite-dimensional Lie groups consume HamiltonianReduction R3.1's full proper-orbit symplectic slice/Marle–Guillemin–Sternberg model, including its m*, coadjoint and slice directions, compact stabilizer and moment normalization. Construct its coordinate-compatible compact-torus specialization here and use it for global convexity and singularity descriptions. Its equivariant tube and relative Moser flow-germ theorem apply along the actual proper orbit; the compact-orbit averaging argument is a specialization.

## T2. Morse–Bott and moment-map topology

Consume MorseTheory M5's critical-submanifold/normal-Hessian carriers,
normal form and negative-disc-bundle attachment theorem. Identify these carriers
and indices for each moment component below. Consume
[CharacteristicClasses C2–C3](https://github.com/TauCetiProject/TauCetiRoadmap/pull/896)'s ordinary
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
positive-dimensional fixed components. For compact coadjoint orbits prove existence of a generic height
with isolated fixed points via root tangent planes and torus-centralizer structure, rather than a generic
Sard argument that never proves the fixed set is discrete.

## T3. Convexity and matrix examples

For compact connected Hamiltonian T-space prove: μ(M) is the convex hull of images of **fixed
components**, hence a compact polytope; every μ-fiber is connected. Build the torus local-to-global argument from proper moment map, local convexity cones and local
fiber connectedness (Condevaux–Dazord–Molino/Hilgert–Neeb–Plank), prove these hypotheses from
the symplectic slice normal form, then obtain convexity and connectedness at critical as well as
regular values. Finiteness of components is proved
from compact fixed-set manifold and local models; fixed points themselves need not be finite.
Prove restriction to subtori, translation/naturality and product polytopes. If the action is effective,
show μ(M) has full affine dimension dim T; otherwise identify its effective quotient and affine support.
Torus orbits are isotropic, hence dim T≤½dim M for effective actions. A regular level for a torus
is coisotropic; quotient dimension is dim M−2dim T, with an orbifold if only locally free.

For compact connected K prove **Kirwan convexity**: μ(M)∩t*_+ is a compact convex rational polytope
in a chosen closed positive Weyl chamber (rational facet directions in the weight lattice,
with real support constants), and the fibers of the orbit-projected map to t*_+ are
connected. The full K-moment image in k* need not be convex. Consume
[HamiltonianReduction R2](../HamiltonianReduction/README.md#r2-coadjoint-orbits-and-kks)'s compact
coadjoint-orbit, closed-chamber and centralizer theorems, including
`k*/K≅z(k)*×t*_(ss,+)`, on LieGroups Layer6 and RootSystems Layer4. Maximal-torus
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
Lerman–Duistermaat route with these explicit targets; an energy band alone
need not lie near one critical component. These analytic and stratification
targets are independent of the chosen convexity proof and do not assume a
nondegenerate Morse estimate. Keep stabilizer/central directions in the lattice
conventions.

Prove Kostant **compact coadjoint-orbit projection convexity**, `pr_t*(K·ν)=conv(W·ν)` for ν∈t*;
this is the precise version meant here, not the different nonlinear Iwasawa projection theorem.
For U(n), fix ⟨H,X⟩=−i tr(HX) with diagonal X=i diag(θ), so μ is the diagonal list, and show the diagonal moment image is the permutahedron of
eigenvalues. Prove Schur–Horn in both directions and equivalence with majorization (partial sums of
sorted entries and total trace). Repeated eigenvalues give lower-dimensional smooth coadjoint orbits but the same convex-hull
statement. Construct a 2×2 Hermitian matrix for every majorized diagonal and given eigenvalues and rank-one CP^(n−1) simplex as acceptance cases.

## T4. Liouville and Duistermaat–Heckman

Construct the orientation and smooth positive volume density ω^n/n! on a 2n-manifold and its Radon
Borel Liouville measure. Prove local finiteness, chart/change-of-variables formula, invariance under
symplectomorphisms and Hamiltonian flows, restriction/products and total-volume formulas. This is the
single owner consumed by integrable systems and quantization. No global Riemannian volume is chosen
as a substitute without a proved density identity.

For a Hamiltonian torus space with **proper** μ define DH measure as μ_*Liouville. Properness gives
local finiteness even when M is noncompact. For compact connected M and an effective action prove
absolute continuity with respect to the lattice-normalized Lebesgue measure on t*, with polynomial
density on each connected chamber of regular values of degree at most n−m. For a noneffective action
state absolute continuity on its affine support, not full ambient t*. Prove density from reduced volume
and orbit period, including finite generic stabilizers when applicable. For each locally-free Hamiltonian chamber use R3's actual possibly ineffective proper étale slice presentation S and restricted symplectic form. Construct the actual level principal-torus orbibundle using O4.1: for the left T-action on Z and a slice object x, put P=S₀×T, with right action (x,t)·k=(x,tk), and let a retained arrow h:x→y act by (x,t)↦(y,ht). The map (x,t)↦t⁻¹x is arrow-invariant and right-equivariant for z·k=k⁻¹z; prove these formulas and their slice-refinement comparisons. Construct a T-invariant connection on the locally-free level by an invariant orbit/horizontal splitting, with α(ξ_right)=ξ; its pullback gives the arrow-invariant principal connection on P. This is a CT specialization of O4's generic bundle/connection API, not an additional object assumed from R3. Consume [Orbifolds O1–O5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/969)'s generic presentations, invariant forms, represented bundles, classifying/coarse/de Rham comparisons and full-isotropy integration. O4-T supplies the normalized thin/CW and principal-torus comparison on the same model, with T1's actual character-basis/period datum. Prove that T4's concrete level bundle and R3's restricted symplectic form identify with these carriers before evaluating classes or integrals. O7's later completed-model comparison is not a prerequisite.

Construct the application classifier κ on O4-T's diagonal-Sing CW model `BS` from that theorem's intrinsic represented bundle, with its object/refinement comparisons. For every dual character χ pull back the normalized integral class `h_χ=-u_χ` to `H²(BS;ℤ)`, take its rational image and use O4-S for coarse rational cohomology. Prove O4-W/O4-T identifies its real image with the actual connection curvature `[F_χ/(2π)]` in R3's invariant-form complex. The arbitrary reduced symplectic class lies in real `H²(Ω(S))≃H²(BS;ℝ)` and need not be rational. Retain actual character-basis, atlas, connection and refinement maps; agreement on small charts alone does not identify these classes.

Use O5's full inverse-stabilizer integral for reduced volume with its actual orientation and ineffective isotropy. Rational coarse comparison does not turn it into unweighted coarse volume. In a connected common-weight-factor example with generic ineffective order k, keep the original model, effective reduction and possibly different descended bundle distinct. Compare classes only through actual bundle/character maps and prove `∫_effective=k·∫_full` for corresponding coarse forms. Integral descent of an isotropy-sensitive bundle does not follow from rational coarse cohomology. These application comparisons include the full ineffective scope and the effective special case.

Over a contractible chamber U on which reduction is free and proper, construct a smooth identification
of reduced spaces and principal bundles. With connection α valued in t, invariant torus convention
ι_ξMω=dμ_ξ and π*ω_red=i*ω, use the principal right action z·g=g⁻¹z,
α(ξ^right)=ξ and therefore α(ξ^left)=−ξ, with curvature F=dα. Pin
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

## T5. Toric classification and weighted quotients

A symplectic toric manifold is compact connected symplectic 2n-manifold with effective Hamiltonian
n-torus action. Prove all moment fibers are single torus orbits, action free over polytope interior,
and isotropy subtori on faces. Fixed points correspond exactly to vertices and never interior points.
The latter is **only a complexity-zero conclusion**: for higher complexity a fixed point may have
interior moment image, and finitely many weight rays can span all of t*. Use n independent weights
and local cone structure to prove it rather than the false assertion that every finitely generated
cone lies in a proper half-space.

Develop simple rational smooth (Delzant) polytopes with primitive integral inward facet normals; n
normals at each vertex form a Z-basis. Specify support inequalities ⟨x,u_j⟩≥λ_j and translations.
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

For the weighted circle action with coprime positive weights a,b on C² and fixed positive quadratic
level, compute S³/ellipsoid quotient, topological sphere, axial stabilizers of orders a,b and local
orbifold charts/cone angles 2π/a,2π/b. Use z_j↦e^(-ia_jθ)z_j, μ=(a|z₁|²+b|z₂|²)/2 and reduction at ε>0;
the orbifold area is 2πε/(ab). General weighted
projective spaces and labeled rational simple polytopes extend Delzant to effective toric orbifolds
(Lerman–Tolman), with facet multiplicity labels; prove orbifold convexity and reconstruction/uniqueness in that model;
smoothness is equivalent to unit labels **and** unimodular vertex cones.
Do not erase finite stabilizers or identify unequal weights with an ordinary smooth CP¹ symplectically.

## Acceptance and order

T4 consumes Orbifolds O4-N/S/R/K/W/T and O5 on R3's actual Hamiltonian presentation and symplectic form and on the level principal-torus orbibundle constructed in T4; T1 supplies the character/period datum. Generic O1–O5 proofs do not consume CT's integration, volume, convexity or DH endpoints. O7's completed-model comparisons are later and are not inputs to either construction. T1→T2→T3. T4's Liouville
density and measure use orientation/integration
alone; T4's Duistermaat–Heckman theory additionally consumes R3 reduction,
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
§2, for the diagonal nerve of a simplicial groupoid. The levelwise singular
adapter and the characteristic-class normalization are the explicit T4 targets above.
