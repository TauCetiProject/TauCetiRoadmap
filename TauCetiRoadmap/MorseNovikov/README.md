# Roadmap: Morse–Novikov homology and dynamical Reidemeister torsion

**Summary.** Morse theory reads the topology of a closed manifold off the critical
points of a function and the gradient trajectories between them. Novikov replaced the
function by a closed one-form α, which is locally the differential of a function but
need not be one globally. Its gradient flow can then have closed orbits. This roadmap
builds the Morse theory of closed real one-forms. Its main theorem is that the
torsion of the resulting complex, multiplied by a zeta function counting closed
orbits, equals the Reidemeister torsion of the manifold (Hutchings, Forum Math. 14
(2002), Theorems A and B).

Throughout, X is a closed connected smooth manifold, Hausdorff and second countable,
not necessarily oriented. Fix a connected regular cover of X with abelian deck group H
on which the pullback of α is exact. The periods of α give a homomorphism from H to ℝ,
which may have a kernel or a dense image, and H may have torsion. The Novikov ring of
H consists of the series Σ a_h e^h with finitely many terms below each bound on N(h),
where N is minus that homomorphism. When the zeros of α are nondegenerate and its
trajectories are transverse, chosen lifts of the zeros form a basis of the Novikov
complex over this ring. Its differential counts signed trajectories between zeros of adjacent index,
weighted by deck class.

This complex is chain homotopy equivalent to the cellular chains of the cover,
completed over the Novikov ring. When the class of α is nonzero, its top-degree
integral homology vanishes, also for nonorientable X.

The total quotient ring of the integral Novikov ring is a finite product of fields of
characteristic zero. The Novikov torsion lies there, and is zero exactly on the
components where the complex is not acyclic. Suppose also that all closed orbits,
iterates included, are nondegenerate. The zeta function ζ is the exponential of
Σ ε(γ)/p(γ) e^[γ] over the closed orbits γ, with return sign ε(γ) and multiplicity
p(γ); it has integer coefficients and constant term 1. If χ(X)=0, the product of the
Novikov torsion and ζ, taken modulo signs and elements of H, depends only on the
cohomology class of α and the cover, and equals the image of the cellular torsion of
the cover, for every real class and every finitely generated abelian H. On the
circle, a form of nonzero period without zeros has torsion 1 and ζ=(1−t)⁻¹; perturbed
to have a maximum and a minimum, it has torsion (1−t)⁻¹ and ζ=1. Both products are
the cellular torsion (1−t)⁻¹. Zero surgery on a knot K in S³ has cellular
torsion Δ_K(t)/(1−t)² up to ±t^k, with Δ_K the Conway-normalized Alexander polynomial.

Two classical theorems are built along the way and stated in Suggested.lean. Let M be
a compact Hausdorff smooth manifold of finite dimension without boundary, possibly
disconnected, nonorientable or empty. The Lefschetz fixed-point formula: if every
fixed point of a smooth map f:M→M is nondegenerate (1 is not an eigenvalue of df_x),
then the sum over the fixed points of the sign of det(1−df_x) is
Σ(i=0,…,dim M)(−1)^i tr(f_* on H_i(M;ℚ)). For z↦z² on the circle, its one fixed point
and its traces both give −1. The Poincaré–Hopf theorem: for a smooth vector field on M
whose derivative at each zero has nonzero determinant, the sum over the zeros of the
sign of that determinant is the alternating sum of the rational Betti numbers of M in
degrees 0 to dim M.

[HeegaardFloer](../HeegaardFloer/README.md) provides
ordinary Morse moduli spaces and the return maps of periodic orbits.
[DifferentialGeometry](../DifferentialGeometry/README.md) provides forms, de Rham
cohomology and periods. AlgebraicTopology and GeometricTopology provide covers,
cellular chains and the Alexander polynomial. Downstream, TaubesGromov uses the
torsion and zeta results for its orbit expansions.

Layers 1 and 4 are algebra: the Novikov ring, and torsion over its total quotient.
Layers 2, 3 and 5 build the trajectory spaces, the Novikov complex and the orbit count.
Layer 6 proves the equality and the Lefschetz formula. Layer 7 adds Poincaré–Hopf and
Euler structures, which refine the equality up to sign alone.

## How to read the build

Layers 1–7 retain the names N1–N7. Layer 1 develops the coefficient algebra; it is
independent of geometry. Layer 2 builds
bounded-period geometry on native Morse and flow topology and HeegaardFloer Lanes M
and F0. Layer 3 consumes Layers 1–2 and the AlgebraicTopology, GeometricTopology and
native cellular suppliers to build the Novikov complex and its comparisons. Layer 4
develops based torsion algebra independently of Layers 2–3, then applies it to their
based complexes. Layer 5 consumes Layers 1–2 and §4.4's norms
and counts return orbits. Layer 6 uses all five, including its own Lefschetz and
knot/surgery adapters, to prove unrefined dynamical invariance and cellular equality;
Layer 7 constructs the Euler carrier before using it to refine Layer 6. Generic
ordinary Morse homology is not proved using the dynamical torsion theorem, and the
Novikov homology comparison is not used to infer torsion invariance without its based
comparison factor. Where the pinned Tau Ceti has the declarations that realise an item,
its *In Tau Ceti:* line names them. The two native headline signatures are in
Suggested.lean; its docstring names the pinned declarations that prove the algebraic
headlines and the carriers missing for the others.

## Conventions

The geometric setting is a finite-dimensional real smooth Hausdorff second-countable
closed connected manifold X. The Novikov complex does not require X to be oriented.
The torsion comparison assumes χ(X)=0; retain the zero convention of rt3
Definition A.1, p. 239 when a field component is not acyclic. Smooth one-forms use
[DifferentialGeometry 0–1](../DifferentialGeometry/README.md)'s common smooth-form
carrier (`closedForms`, `RoughForm`) and exterior derivative, with its pullback and
de Rham comparisons.
A closed one-form α is Morse if its local potentials have nondegenerate critical
points. This predicate includes neither Morse–Smale transversality nor periodic-orbit
nondegeneracy. Use the metric dual V=α♯, and count trajectories and closed orbits
of **−V** (rt3 §1.1, pp. 210–211).

Choose a connected regular abelian covering π:X̃→X on which π*α is exact, with
specified deck-group identification H. Periods factor as
`π₁(X)→H₁(X;ℤ)→H→ℝ`; denote the final homomorphism by P. Write H additively,
monomials as e^h, and use **N=−P** in the Novikov completion (rt3 §1.2, p. 211,
where the ring is Nov(H,−[α])). A primitive f̃ satisfies
`f̃(h·x)=f̃(x)+P(h)`. Thus e^h shifts critical values by P(h), and completed chains
are finite above each potential threshold. A downward closed orbit γ has
`N([γ])=−∫γ α>0`. Neither injectivity nor discreteness of N is assumed.
For S¹ use ℝ/ℤ, Mathlib's `AddCircle (1 : ℝ)`; its angular form with integral 1 is the pinned
`AddCircle.timeForm`. The Laurent variable t is the
monomial of the generator of H≅ℤ with **N(h)>0**, not a silently chosen positive
angular deck generator. In the exact N=0 circle example, separately fix
t as the positive angular deck generator; no N(t)>0 condition applies.

The algebraic coefficient ring R is any commutative ring. Torsion over ℤ and
rational characteristic-zero field components is its own layer; do not assume a
Novikov ring over an arbitrary ring is a field. Every geometric deck group H is
finitely generated, proved using a finite CW model of X. N1's completion algebra
also treats arbitrary abelian groups, without claiming a finite field decomposition
in that generality.

Lean targets are universe-polymorphic in the manifold and its model: a real
finite-dimensional model E, a boundaryless model with corners I, and rational
singular homology of the pair (M,∅), whose coefficient object `ULift ℚ` lies in the
universe of M. The Lefschetz and
Poincaré–Hopf statements also allow disconnected and empty compact manifolds;
the connectedness convention above belongs to the covering/torsion development.
The determinant of the endomorphism of the zero-dimensional vector space is 1.

## Layer 1: Period-controlled completed group rings and modules

### 1.1 Completion coefficients and convolution

For an abelian group H, a homomorphism N:H→ℝ and a commutative ring R, define
Nov(R,H,N) by coefficient functions a:H→R satisfying
`∀ C:ℝ, {h | a(h)≠0 ∧ N(h)<C}.Finite`.
Use this exact support condition. Prove it is equivalent with ≤C in place of <C, that
the periods of a support are bounded below, and that a nonzero support attains a least
N-value. Prove equality coefficientwise; construct zero, addition, negation, coefficient
scalar maps and convolution. For each h the pairs `(u,v)` with u+v=h and a(u)b(v)≠0 are
finite; prove this before interpreting the coefficient sum. Prove all commutative-ring and
R-algebra laws by finite support arguments, including the uniform cutoff lemma needed for
associativity. Monomials multiply by adding exponents, and a monomial with unit
coefficient u at h is a unit with inverse u⁻¹ at −h. Embed `AddMonoidAlgebra R H` by its
actual coefficient map and prove the embedding injective; for nontrivial R prove it is
onto iff N=0. Every later layer uses this carrier and no other model of the completion.

The integral support model is rt3 §1.2, p. 211, and for H=H₁ with N=−θ rt2 §1, p. 371; the arbitrary-ring extension and finite-sum proofs are constructed here.

The API includes:

- Equality is coefficientwise, with zero, addition and negation evaluated in the specified R.
- Every convolution coefficient is a finite sum, and associativity uses a common finite cutoff.
- Monomials are units and the finite group-ring inclusion is injective; for nontrivial R it is onto exactly when N=0.

**Checks.**

- For H=0 there is one coefficient, so Nov(R,0,0)=R; for the zero ring every support is empty.
- For H=ℤ and N=0, the support of 1+t is allowed but Σ(k≥0)t^k is excluded: below C=1 the latter has infinitely many terms.
- For N(k)=k, Σ(k≥0)t^k has three terms below C=3; its square has coefficient 3 at t² and 0 at t⁻¹.
- For H=ℤ², N(a,b)=a, infinitely many coefficients at (1,b) fail the cutoff C=2; finite ties 1+e^(0,1) are allowed.
- Transporting the ring on ℤ by negation changes the monomial coefficient at its exponent from 1 to −1; the coefficient operations must be parameters of the construction.

*Needs:* Mathlib `AddMonoidAlgebra`, `Finsupp` and finite sums.
*In Tau Ceti:* `TauCeti.NovikovSeries`, `TauCeti.NovikovSeries.forall_finite_lt_iff_forall_finite_le`,
`TauCeti.NovikovSeries.bddBelow_image_support`, `TauCeti.NovikovSeries.exists_isLeast_image_support`,
`TauCeti.NovikovSeries.finite_setOf_add_eq`, `TauCeti.NovikovSeries.finite_setOf_period_add_add_lt`,
`TauCeti.NovikovSeries.single_mul_single`, `TauCeti.NovikovSeries.isUnit_single`,
`TauCeti.NovikovSeries.ofAddMonoidAlgebra`, `TauCeti.NovikovSeries.ofAddMonoidAlgebra_injective`,
`TauCeti.NovikovSeries.ofFinsupp_surjective_iff`.

### 1.2 Filtration, completion and functoriality

Put U_C={a | ∀h, N(h)<C→a(h)=0}. These additive subgroups define the separated
period-filtration topology. Prove completeness and the universal completion property
for the group ring with this filtration, density of finite truncations, continuity of
ring operations, and cutoff/convolution compatibility. Scalar change is coefficientwise;
do not identify base change of completed rings with a tensor product without its own
proof. Positive rescaling of N gives the same ring and topology; −N reverses the
completion and is related by h↦−h, not the identity. Construct both identifications as
continuous algebra isomorphisms along an exponent isomorphism that rescales periods by a
positive constant. For commutative ground rings R,S, a unital homomorphism ρ:R→S, an
exponent homomorphism φ:H→H′ and c>0 satisfying N′∘φ=cN, construct the continuous
unital ring homomorphism P_(ρ,φ):Nov(R,H,N)→Nov(S,H′,N′) with coefficient
`P_(ρ,φ)(a)(h′)=Σ_(φ(h)=h′)ρ(a(h))`, summing over nonzero source coefficients.
Prove this sum and every target sublevel support finite using the period identity.
Prove additivity, multiplication, preservation of 1 and monomials, ground-coefficient
naturality, identity and composition laws by reindexing the actual finite sums.
If U_C and U′_D are the declared period neighborhoods, prove
`P_(ρ,φ)(U_C)⊆U′_(cC)` and deduce continuity. Construct its restrictions to the
nonnegative subrings and strictly positive ideals. With fixed ground ring export
the R-algebra homomorphism specialization. Finite kernel is not required for this
pushforward. With finite kernel also construct restriction φ^* by coefficient
precomposition and prove its support bound. Export the inclusion/restriction cases
used in finite cyclic covers: for a subgroup K of H, Nov(R,H,N) as an algebra over
Nov(R,K,N|K) by pushforward along the inclusion, and the projection formula for
restriction along that inclusion. A pushforward with a finer grading additionally
requires a target degree map commuting with φ, or an explicit degree quotient;
the period identity alone supplies the ungraded map. Do not claim an unrestricted
series pushforward for arbitrary φ or infer flatness, injectivity, or a completed
tensor-product identification from this construction.

The filtration extends the support definition of rt3 §1.2, p. 211; the cutoff relation O(R) and limits in Nov are rt3 §2.1, p. 220; finite-cover restriction is rt3 §3.4, pp. 226–227. The general period-compatible pushforward and universal property are proved from these finite supports.

The API includes:

- The neighborhoods U_C give a separated complete additive topology, with continuous ring operations and dense finite sums.
- Period-compatible pushforward preserves products, monomials and composition and sends U_C into U′_(cC).
- Finite-kernel coefficient precomposition preserves support; it is not asserted to be a unital ring map.

**Checks.**

- The tail Σ(k>m)t^k vanishes below any fixed C once m≥C, and t² lies in U₂ but not U₃.
- U₂ is an additive subgroup but not an ideal: t²∈U₂ while t⁻³·t²=t⁻¹∉U₂.
- Projection ℤ²→ℤ, (a,b)↦a, sends 1+e^(0,1) to 2 although the kernel is infinite; period fibers in an allowed support are finite. Precomposition along it is unavailable: Σ(a≥0)t^a pulls back to infinitely many terms of period 0.
- For the inclusion 2ℤ→ℤ with N the identity, restriction takes the even-exponent part, and restriction after pushforward is the identity.
- For ℤ→ℤ/2 with N(k)=k and N′=0, no c>0 satisfies N′∘φ=cN, so no pushforward is claimed; summing Σ(k≥0)t^k over cosets would diverge.
- Precomposition along ℤ⊕ℤ/2→ℤ sends 1 to 1+g; its square is 2+2g, not 1+g, excluding ring-homomorphism language.
- N and 2N admit Σt^k; −N excludes it but admits Σt^(−k), so reversal uses h↦−h.

*Needs:* §1.1; Mathlib topological rings and additive groups.
*In Tau Ceti:* `TauCeti.NovikovSeries.periodFiltration`, `TauCeti.NovikovSeries.denseRange_ofFinsupp`,
`TauCeti.NovikovSeries.completionPkg`, `TauCeti.NovikovSeries.mul_sub_mul_trunc_mem_periodFiltration`,
`TauCeti.NovikovSeries.domCongr`, `TauCeti.NovikovSeries.continuousDomCongr`,
`TauCeti.NovikovSeries.map`, `TauCeti.NovikovSeries.mapRingHom`, `TauCeti.NovikovSeries.mapRingHom_id`,
`TauCeti.NovikovSeries.mapRingHom_comp`, `TauCeti.NovikovSeries.map_mem_periodFiltration`,
`TauCeti.NovikovSeries.continuous_mapRingHom`, `TauCeti.NovikovSeries.mapNonnegSubring`,
`TauCeti.NovikovSeries.mapNonnegSubring_mem_posIdeal`, `TauCeti.NovikovSeries.mapAlgHom`,
`TauCeti.NovikovSeries.comap`, `TauCeti.NovikovSeries.instAlgebraAddSubgroup`,
`TauCeti.NovikovSeries.comap_subtype_algebraMap_mul`.

### 1.3 Positive series and convergent operations

Construct the nonnegative-period subring of series supported on N≥0 and its
strictly positive ideal of series supported on N>0. Construct geometric series
for a in that ideal and prove both inverse identities for 1−a, over any R. Over a
commutative ℚ-algebra build the exponential from the positive ideal onto the units 1+a
with a in it, inverse to the logarithm, with convergence and formal identities in the
period topology. Prove filtered infinite products converge for families whose
nonconstant supports escape every cutoff, that is, in which only finitely many factors
differ from 1 below each cutoff. Include monomial `(1−e^h)^−1=Σ(k≥0)e^(kh)` when N(h)>0.

Use rt3 §1.3, equations (1.1)–(1.2) and Remark 1.4, p. 212; construct the coefficient-ring generalizations with the stated rational-scalar hypothesis.

The API includes:

- The nonnegative subring contains a strictly positive ideal; geometric inversion works over any R.
- Over a ℚ-algebra, exponential and logarithm are mutually inverse between the positive ideal and 1 plus that ideal.
- Infinite products converge when only finitely many factors contribute below each cutoff.

**Checks.**

- For N(t)=1, (1−t)(1+t+t²+⋯) has coefficients 1,0,0 in degrees 0,1,2.
- A constant series 1 is nonnegative but not positive: 1−1=0 has no inverse in a nonzero ring.
- Over ℚ, exp(t) starts 1+t+t²/2 and log(1+t) starts t−t²/2; in characteristic 2 division by 2 is unavailable.
- For N(k)=−k, Σ(k≥0)t^k is not in the ring; there 1−t has inverse −t⁻¹Σ(k≥0)t^(−k).
- Π(n≥1)(1−t^n)⁻¹ converges because its n-th factor is 1 modulo U_n, and its t⁴ coefficient is the partition number 5; for N(t)<0 the factors do not escape the cutoffs and no convergence is claimed.

*Needs:* §§1.1–1.2; rational power-series identities.
*In Tau Ceti:* `TauCeti.NovikovSeries.nonnegSubring`, `TauCeti.NovikovSeries.posIdeal`,
`TauCeti.NovikovSeries.unitsOneSub`, `TauCeti.NovikovSeries.one_sub_single_mul_tsum`,
`TauCeti.NovikovSeries.tsum_mul_one_sub_single`, `TauCeti.NovikovSeries.expMulEquiv`,
`TauCeti.NovikovSeries.multipliable_of_finite_cutoffs`.

### 1.4 Laurent, Hahn and leading-term comparisons

For H=ℤ with N(k)=k, construct the coefficient-preserving ring isomorphism with native
`LaurentSeries R`, retaining the group-ring Laurent-polynomial inclusion, and prove that
over a field it is a uniform equivalence for the period and X-adic topologies.
For a general H and a supplied splitting of the period kernel, give the comparison
with the locally finite subring of Hahn series whose coefficients are finite sums
in the kernel group ring: an injective ring homomorphism whose image is the locally
finite Hahn series; prove coefficient and topology formulas. The splitting and ordered
period group are data, and this comparison is not the definition. For finitely
generated torsion-free H and a domain R prove Nov is a domain using leading
coefficients in the period-kernel group ring; finite ties in N are retained.

The cyclic case is rt3 Example 1.3, p. 211; the leading-coefficient domain argument is in the proof of Lemma A.4, p. 240. The split-kernel topological comparison is an extension built here.

The API includes:

- The cyclic comparison preserves each coefficient; over a field it also identifies the period topology with the X-adic topology.
- The split-kernel comparison retains finite group-ring coefficients in each period fiber.
- For finitely generated torsion-free H and a domain R the least-period coefficient proves the product of two nonzero series is nonzero.

**Checks.**

- The Laurent element t⁻²+3+t³ has minimum exponent −2 on both sides of the comparison.
- For N(a,b,c)=a+√2b, 1+e^(0,0,1) has two leading terms of period 0; collapsing them to one exponent loses a coefficient.
- For H=ℤ/2 and R=ℤ, (1−g)(1+g)=0 with both factors nonzero; the domain theorem must exclude torsion.
- For H=ℤ² and the injective dense period N(a,b)=a+√2b, a nonzero series attains its least period at exactly one exponent, so leading terms multiply and Nov(ℤ,ℤ²,N) is a domain.

*Needs:* §§1.1–1.3; Mathlib `LaurentSeries`, `HahnSeries` and group algebras.
*In Tau Ceti:* `TauCeti.NovikovSeries.toLaurentSeries`, `TauCeti.NovikovSeries.toLaurentSeriesUniformEquiv`,
`TauCeti.NovikovSeries.PeriodKernelSplitting`, `TauCeti.NovikovSeries.toHahnSeries`,
`TauCeti.NovikovSeries.hahnSeriesEquiv`, `TauCeti.NovikovSeries.mem_periodFiltration_iff_coeff_toHahnSeries`,
`TauCeti.NovikovSeries.tendsto_nhds_iff_coeff_toHahnSeries`, `TauCeti.NovikovSeries.leadingTerm`,
`TauCeti.NovikovSeries.isDomain_of_fg`.

### 1.5 Completed orbit modules

For a free H-set S with finitely many orbits and an equivariant potential
F(hs)=F(s)−N(h), construct completed R-linear combinations of S finite above every
F-threshold, with its potential-cutoff topology. Chosen orbit lifts identify this
module with a finite free Nov-module. Prove change-of-lift matrices are diagonal
monomials, cutoff convergence, and the extension of equivariant matrices to continuous
maps: an equivariant group-ring matrix extends uniquely to a continuous map. Export the
uniform support estimates for differentials, continuation maps, homotopies and
compositions in the form of kernel maps: a kernel with a potential bound C gives a map
shifting cutoffs by C; the composite of two kernels has the sum of their bounds and
gives the composite map; a kernel identity m−m′=kδ₀+δ₁k among kernels with potential
bounds gives the same identity of their kernel maps, and the identity kernel gives the
identity map; and a deck-invariant kernel gives a Nov-linear map.

The critical-lift model is rt3 §1.4, pp. 212–213; the finite-orbit module and uniform matrix estimates generalize that model.

The API includes:

- Chosen orbit lifts give a finite free module over the completion.
- Changing a lift by h multiplies its basis vector by e^h.
- Equivariant finite matrices extend continuously with uniform cutoff bounds.

**Checks.**

- One orbit with lift s and F(s)=0 identifies e^h s with potential −N(h), giving the same finite-below condition as the ring.
- Replacing s by h·s multiplies its basis by e^h; the empty orbit set gives the zero module.
- Multiplication by t² sends U₃ into U₅, since 2+3=5; reversing the potential sign would give the wrong direction.

*Needs:* §§1.1–1.2; finite free modules.
*In Tau Ceti:* `TauCeti.NovikovModule`, `TauCeti.NovikovModule.coordinatesLinearEquiv`,
`TauCeti.NovikovModule.coordinates_apply_eq_mul_single`, `TauCeti.NovikovModule.potentialFiltration`,
`TauCeti.NovikovModule.kernelMap`, `TauCeti.NovikovModule.kernelComp`,
`TauCeti.NovikovModule.kernelMap_kernelMap`, `TauCeti.NovikovModule.kernelMap_sub_kernelMap`,
`TauCeti.NovikovModule.kernelMap_eq_id`, `TauCeti.NovikovModule.novikovKernelMap`,
`Matrix.continuous_mulVec_extension_iff`.

### Examples

Use the irrational period N(a,b,c)=a+√2b on ℤ³ with coefficients ℤ, whose nontrivial
kernel is generated by (0,0,1), not only discrete injective periods. The product of
1+e^(0,0,1) with Σ(n≥0)e^(n,0,0) keeps both tied exponents in its leading term, and along
its infinite support the periods exceed every cutoff. It is the coefficient example with
nonintegral and noninjective periods that the later layers' algebra is held against,
alongside the discrete injective periods of the circle.
*In Tau Ceti:* `TauCeti.NovikovSeries.IrrationalExample.period`,
`TauCeti.NovikovSeries.IrrationalExample.ker_period`, `TauCeti.NovikovSeries.IrrationalExample.series`,
`TauCeti.NovikovSeries.IrrationalExample.leadingTerm_series`,
`TauCeti.NovikovSeries.IrrationalExample.eventually_period_ge`.

### Dependencies

N1 uses only the pinned algebra, topology and finite-sum APIs. Its arbitrary-ring completion does not depend on geometry.

## Layer 2: Morse closed one-forms, covers and bounded-period moduli

### 2.1 Closed forms and critical geometry

Define the zero locus using the actual cotangent bundle, and the Morse condition on the
actual cotangent fibers through local primitives. Prove local-potential independence of
the critical Hessian and index; compare a nondegenerate zero with transversality of the
section α to the zero section. Establish local normal forms, isolation and finite
critical sets: every local primitive of a Morse one-form is nondegenerate at each zero in
its domain, so the local normal form at a zero is the pinned Morse lemma
`TauCeti.IsManifoldNondegenerateCriticalPoint.nonempty_morseChart` for a local primitive,
and the zeros are isolated and finite on a compact manifold. Define
negative dual trajectories; their stable and unstable sets are the pinned `Flow.stableSet`
and `Flow.unstableSet` of the negative dual flow. Build the manifold structures on these
sets and Morse–Smale transversality for a closed one-form, separately from the Morse
condition: the pinned `TauCeti.IsAdaptedPseudoGradient.exists_stableSet_isManifold` and
`TauCeti.IsAdaptedPseudoGradient.IsMorseSmale` concern a pseudo-gradient adapted to a
function and apply only when α is exact. Specify descending orientation
lines over critical points and their deck transport; the sign convention is
`TD(p)=TM(p,q)⊕R(negative-flow tangent)⊕TD(q)`. Compare it with Lane M's
integer boundary convention rather than counting unsigned trajectories.

Use rt3 §1.1, pp. 210–211 and §1.4, pp. 212–213 for the local potential and orientation conventions; the Morse and Morse–Smale conditions are admissibility conditions (a) and (b) of rt3 Definition 1.1, p. 211.

The API includes:

- Local primitives differing by a constant have the same Hessian and index.
- Nondegenerate zeros are isolated and hence finite on the compact manifold.
- Stable/unstable intersections and descending orientation lines use the negative metric-dual flow, separately from the Morse condition.

**Checks.**

- On ℝ, potentials x²/2 and x²/2+7 give α=x dx, Hessian 1 and index 0; −x²/2 gives index 1.
- The form x² dx has a degenerate zero since its derivative there is 0, even though the zero is isolated.
- On the noncompact line, d(sin x) has infinitely many nondegenerate zeros, so finiteness of the zero set needs compactness.
- For f=cos θ on S¹ with maximum unstable direction +∂θ, the two downward paths have signs +1 and −1, so their ordinary incidence sum is 0.

*Needs:* DifferentialGeometry Layers 0–3 and 12; MorseTheory M1 and M6; HeegaardFloer Lane M; Tau Ceti `TauCeti.IsManifoldNondegenerateCriticalPoint.nonempty_morseChart`, `Flow.stableSet` and `Flow.unstableSet`.
*In Tau Ceti:* `TauCeti.IsMorseOneForm`, `TauCeti.IsPrimitiveOn.criticalHessian_eq`,
`TauCeti.IsPrimitiveOn.manifoldMorseIndex_eq`, `TauCeti.IsMorseOneForm.isManifoldNondegenerateCriticalPoint`,
`TauCeti.IsMorseOneForm.finite_zeroSet`.

### 2.2 Periods and connected abelian covers

Construct the period homomorphism by integrating loops, with homotopy, concatenation,
homology and de Rham naturality: on π₁ it is a homomorphism depending only on homotopy
classes and on the de Rham class, natural under pullback, and it factors through H₁ by
the Hurewicz isomorphism `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` with its
naturality. Specialize the pinned classification of pointed connected covers
(`TauCeti.UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient`) and the deck
group of the cover of a normal subgroup
(`TauCeti.UniversalCover.deckSubgroupQuotientProjEquivOfNormal`) to surjections π₁(X)→H, using
π₁-abelianization; prove π*α is exact iff periods vanish on that kernel, for the smooth
covering map out of the connected cover. The lifted smooth structure is the pinned `IsLocalHomeomorph.chartedSpaceComap`
along the covering map, a manifold by `IsLocalHomeomorph.isManifold_chartedSpaceComap`, for
which the covering map is a local diffeomorphism
(`IsLocalHomeomorph.isLocalDiffeomorph_chartedSpaceComap`) and the smoothness of deck
transformations reduces to `IsLocalHomeomorph.contMDiff_chartedSpaceComap_iff`. Build the
lifted metric, vector field and primitive,
with deck-equivariance and positive/negative flow comparison. For a connected
regular cover with abelian deck group H, prove that
`H₁(X̃;ℤ) → H₁(X;ℤ) → H → 0` is exact at H₁(X;ℤ) and surjective onto H,
using the subgroup of π₁(X) defining the cover and the natural abelianization
maps. The first arrow need not be injective.

The cover and exactness hypothesis are rt3 Choice 1.2, p. 211. Exactness on H₁ follows from the defining subgroup and natural abelianization; no initial zero is asserted.

The API includes:

- Loop integration factors through H₁ and through H precisely when it vanishes on the covering subgroup.
- A primitive upstairs obeys f̃(h·x)=f̃(x)+P(h), and the negative flow has positive N-drop.
- The H₁ sequence is exact at the base and surjective onto H, without an injective first arrow.

**Checks.**

- For α=dθ on ℝ/ℤ, P(1)=1 and N(1)=−1; the downward deck generator −1 has N=1.
- For an exact form P=0, the pulled-back potential is invariant under every deck transformation.
- For the universal cyclic cover of S¹, H₁(upstairs)=0 and H₁(base)→ℤ is the identity; its kernel is 0.

*Needs:* DifferentialGeometry Layers 5–6 and 8; AlgebraicTopology Stages 1 and 5; Tau Ceti `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`, `TauCeti.HurewiczOne.homologyMap_hurewiczHomologyAddEquiv`, `TauCeti.UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient`, `TauCeti.UniversalCover.deckSubgroupQuotientProjEquivOfNormal` and Geometry/Manifold/Instances/Comap.lean.
*In Tau Ceti:* `TauCeti.periodHom`, `TauCeti.deRhamCohomology.period`, `TauCeti.periodHom_mpullback`,
`TauCeti.mpullback_mem_exactForms_one_iff_periodHom_map_eq_zero`.

### 2.3 The Klein-bottle cover and period kernel

Make that failure explicit on the Klein bottle
`X=([0,1]×(ℝ/ℤ))/((1,y)∼(0,−y))`. Its smooth model is the pinned
`TauCeti.SmoothMappingTorus` of the reflection y↦−y of ℝ/ℤ, the quotient of ℝ_s×(ℝ_y/ℤ) by
(s,y)∼(s+1,−y); build that reflection as a diffeomorphism, and use GT's smooth gluing only
to compare this model with the glued cylinder. Use AT's
fundamental-group/abelianization APIs to construct the connected smooth cover `C=ℝ_s×(ℝ_y/2ℤ)` and its commuting
deck transformations `A(s,y)=(s+1,−y)`, `B(s,y)=(s,y+1)`. Prove B has
order 2 and that these generate a free proper action of `H=ℤ⊕ℤ/2`, whose
quotient, a manifold by the pinned `TauCeti.instIsManifoldQuotient` with local
diffeomorphism `TauCeti.isLocalDiffeomorph_quotientMk`, is the same Klein bottle X. The
integral closed form α=ds descends to X, where it is the pinned
`TauCeti.SmoothMappingTorus.timeForm`; its pullback has primitive s, and `P(n,e)=n`,
`N(n,e)=−n`.
Prove that this cover is the universal abelian cover: for the based section
a at y=0 and fiber loop b, use `π₁(X)=⟨a,b | aba⁻¹=b⁻¹⟩`, identify the
cover subgroup with ⟨b²⟩, and identify its deck quotient with H₁(X;ℤ).

The cover retracts onto its length-two fiber circle, so H₁(C;ℤ)=ℤ. Its
positive fiber generator maps to b² on π₁ and to `2[b]=0` on H₁(X;ℤ).
Thus the induced H₁ map is zero on a nonzero group, although the covering
map induces an injective map of fundamental groups. Identify
H₁(X;ℤ)→H with the isomorphism sending [a] to (1,0) and [b] to (0,1).
The coordinate calibration sends n to 2n upstairs and to (0,2n mod 2)=(0,0)
downstairs; it does not by itself construct the cover.

For integral period classes construct the circle-valued map and its pullback
cover, then identify a connected component and the divisibility of its deck
generator. Every real class, including irrational ones, has a period-kernel
cover: build it as a connected component of the pinned `TauCeti.PrimitiveSpace` of α, a
covering by `TauCeti.PrimitiveSpace.isCoveringMap_proj` on which constants act by
`TauCeti.PrimitiveSpace.translate` (`TauCeti.PrimitiveSpace.value_translate`) and monodromy
adds the period (`TauCeti.PrimitiveSpace.value_monodromy`). Prove that the value function is
a primitive of the pulled-back form on it and that its deck group is the group of periods.
In the preceding example the minimal period-kernel cover instead has
deck group ℤ and kills b; distinguish it from the larger abelian cover C,
whose period map has kernel ℤ/2. With downward monomial t=A⁻¹ and g=B,
compare N1's completion to `(ℤ[ℤ/2])((t))`, retaining both coefficients at
each period. Exhibit the nonzero factors 1−g and 1+g with product 0. This
geometric cover realizes a deck group with torsion. Apply N4's total-quotient
construction to this ring with zero divisors.

This example is derived from the covering classification in the supplier contracts and the Klein-bottle presentation; compare Hatcher §1.2, the Klein-bottle van Kampen calculation, pp. 51–52.

The API includes:

- The commuting transformations A and B act freely and properly with quotient X and deck group ℤ⊕ℤ/2.
- The cover subgroup is generated by b², whereas the minimal period cover also kills b.
- The completion retains both torsion coefficients and has nonzero zero divisors.

**Checks.**

- AB(s,y)=(s+1,−y−1) and BA(s,y)=(s+1,−y+1) agree modulo 2; B²(s,y)=(s,y+2)=(s,y).
- A^nB^e(s,y)=(s,y) forces n=0 and e=0, so the action is free; the quotient by B is ℝ×(ℝ/ℤ), on which A identifies (s,y) with (s+1,−y), giving X.
- [a,b]=aba⁻¹b⁻¹=b⁻², so ⟨b²⟩ lies in the commutator subgroup, and π₁(X)/⟨b²⟩≅ℤ⊕ℤ/2 is abelian; hence ⟨b²⟩ is the commutator subgroup and C is the universal abelian cover.
- For α=dx+√2dy on T², P:ℤ²→ℝ is injective with dense image, the period-kernel cover is ℝ² and N is not discrete; a construction through a circle-valued map would fail for this class.
- The subgroup generator b² maps injectively as 2 in the fiber subgroup of π₁(X), but maps to 2[b]=0 in H₁(X); thus 0 and 1 in H₁(C)=ℤ both map to 0.
- P(A)=1, P(B)=0 and N(A⁻¹)=1; (1−g)(1+g)=1−g²=0, with both factors nonzero over ℤ.

*Needs:* §2.2; GeometricTopology Layer 1; AlgebraicTopology Stage 1; Layer 1 Laurent comparison; Tau Ceti `TauCeti.SmoothMappingTorus` with `TauCeti.SmoothMappingTorus.timeForm`, `TauCeti.instIsManifoldQuotient`, `TauCeti.isLocalDiffeomorph_quotientMk`, and `TauCeti.PrimitiveSpace` with `TauCeti.PrimitiveSpace.translate`, `TauCeti.PrimitiveSpace.isCoveringMap_proj` and `TauCeti.PrimitiveSpace.value_monodromy`.

### 2.4 Cutoff trajectory spaces

For a Morse–Smale pair on compact X, establish a lifted moduli space
for each pair of lifted critical points, with translation quotient and expected
dimension equal to the index difference minus one. As a topological space it is the
quotient of the connecting set by the pinned `Flow.connectingOrbitSetoid` of the lifted
negative dual flow, on which the time parameter is free between distinct critical points by
`Flow.orbit_injective_of_ne_of_mem_unstableSet_inter_stableSet`. Construct compactification, evaluation and gluing under a
fixed upper bound on **potential drop**. Compactness on X is not compactness on X̃:
prove that outside disjoint small critical neighborhoods, drop controls trajectory
length; passages near hyperbolic critical points have controlled entry/exit, and
only finitely many compatible lifts/connecting pieces occur below a fixed drop.
The drop of a lifted trajectory is twice its energy, by the pinned
`TauCeti.energy_maximalIntegralCurve_neg_mgradient` for the lifted primitive, and a limit of
trajectories leaving the stable set of a critical point continues along its unstable set by
the pinned `Flow.exists_mem_closure_inter_unstableSet_of_mem_closure_inter_stableSet`, once
its compact-sphere and trapping hypotheses are proved near a hyperbolic critical point.
Exclude equal/higher-index broken cycles by Morse–Smale transversality. Prove
index-one signed trajectories are finite at a fixed cutoff, index-two boundary
products give the coherent square-zero identity, and all estimates are uniform on
the compact parameter sets needed in N3. Retain empty and constant-trajectory
cases separately from the free translation quotient.

The expected dimension is rt3 §1.1, p. 211, and the bound on length away from critical points by a multiple of the drop is §1.3, p. 212. Use the compactness argument in rt3 §1.4, p. 213 and the uniform bounds of Lemma 2.2, pp. 218–219; build the full cutoff compactification and orientation/gluing interfaces.

The API includes:

- Translation is free only on nonconstant trajectories; quotient dimension is ind(p)−ind(q)−1.
- Bounded drop controls the finitely many lift contributions in index difference one.
- The oriented boundary in index difference two is the sum of broken trajectory products.

**Checks.**

- An index-one-to-index-zero path has quotient dimension 0; an index-zero-to-index-zero nonconstant path would have dimension −1 and is absent under transversality.
- For an exact potential, a nonconstant closed trajectory would satisfy both drop>0 and drop=0, hence none exists.
- An oriented interval compactification has endpoints +1 and −1, whose sum 0 gives the two-term square-zero cancellation; a constant trajectory has a full translation stabilizer.
- On the nonzero-period circle with a maximum p and a minimum q, the lift p̃ has exactly one trajectory to each of the two adjacent lifts of q and none to any other lift.

*Needs:* §§2.1–2.3; HeegaardFloer Lane M stable manifolds, compactification and gluing; MorseTheory M6 gradient convergence; Layer 1 module support estimates; Tau Ceti Dynamics/Flow/ConnectingOrbit.lean and Breaking.lean and `TauCeti.energy_maximalIntegralCurve_neg_mgradient`.

### Examples

The Klein-bottle cover realizes torsion in the deck group while its potential is the genuine coordinate s.

### Dependencies

N2 consumes N1 support estimates and the named ordinary geometric suppliers; it does not depend on dynamical torsion.

## Layer 3: The Novikov complex, continuation and cellular comparison

### 3.1 The Novikov differential

Take coefficients in ℤ first and scalar-extend coefficientwise to R. Define
`CN_i=Nov(R,H,N)⟨chosen lifts of Crit_i(α)⟩` as the completed module
`TauCeti.NovikovModule` of the lifted index-i critical points with potential f̃; its
differential is the kernel map `TauCeti.NovikovModule.kernelMap` of the signed
index-one trajectory counts to **all** lifts of each lower critical point. Use N2 to
prove that this kernel has potential bound 0 and finite output above every threshold;
continuity and Nov-linearity (`TauCeti.NovikovModule.novikovKernelMap`) follow, and d²=0
reduces through `TauCeti.NovikovModule.kernelMap_kernelMap` to N2's index-two boundary
identity. Change
of lifts and descending orientations gives specified chain isomorphisms. Define
homology through native chain complexes, not a private ker/im quotient.

Use rt3 §1.4, equation (1.3), pp. 212–213.

The API includes:

- Signed counts over all target lifts define a continuous Nov-linear differential with square zero.
- Lift and orientation changes give specified chain isomorphisms.
- Homology is the homology of the native complex, with coefficient changes induced at chain level.

**Checks.**

- On the nonzero-period circle with a critical pair, the adjacent-lift differential is ±(1−t), not 0.
- After setting t=1 in the finite exact-circle differential, 1−t becomes 0, recovering the ordinary incidence count.
- For a zero critical set, every chain group and differential is 0; homology is 0, while the empty-complex torsion is 1.

*Needs:* Layers 1–2, in particular §1.5's kernel maps; Mathlib chain complexes and homology.

### 3.2 Continuation with controlled support

For cohomologous α₀,α₁ on the same cover, construct continuous continuation chain
maps and degree-one homotopies with uniform period estimates; prove constant
identity, concatenation up to homotopy, inverse and independence on homology.
The algebraic half is §1.5's: a kernel identity m−m′=kδ₀+δ₁k among kernels with potential
bounds gives the chain-homotopy identity of their kernel maps, and the identity kernel
gives the identity map; prove the kernel identities themselves from the parametrized
moduli spaces.
Genericity must concern the full function/metric path, or a generic horizontal
lift on the parameter product. A fixed arbitrary function homotopy with generic
metrics alone need not be transverse. Build genericity in each fixed cohomology
class, relative to prescribed endpoint data, with the actual finite regularity/Baire
and local-perturbation suppliers. Do not require every member of a generic path
to be individually Morse–Smale.

Use rt3 §2.1, Lemmas 2.2 and 2.5, pp. 218–219; the function/metric versus fixed-function correction is Hutchings, family-Floer erratum, discussion of §2.2 and Proposition 3.4.

The API includes:

- Constant families induce the identity, and concatenation agrees with composition up to controlled chain homotopy.
- Reverse continuation is a chain-homotopy inverse and the induced map on homology is independent of endpoint-fixed generic choices.
- Uniform support estimates survive compositions and homotopies.

**Checks.**

- The constant family on a one-generator zero-differential complex induces matrix [1], not [0].
- For a change of lift by t², continuation and its inverse have matrices [t²] and [t⁻²], with product [1].
- An index-one interval of parameterized solutions contributes opposite endpoint signs +1 and −1, giving chain-homotopic endpoint maps.
- On the nonzero-period circle the critical-free and two-critical-point forms are cohomologous; continuation between the zero complex and the acyclic two-term complex of §3.1 is a chain homotopy equivalence.
- Across a birth/death in a path of exact forms df_t, the chain change is HeegaardFloer §1.5 (M.5)'s signed elementary chain change, not the identity on generators.

*Needs:* §3.1; HeegaardFloer §1.5 (M.5) and F0; DifferentialGeometry relative smooth perturbations; Layer 2 uniform cutoff gluing; §1.5 kernel maps.

### 3.3 Completed cellular and controlled singular comparison

Construct an equivariant finite cellular chain complex of X̃ over ℤ[H] from a finite CW
model of X and actual lifted attaching maps: lift the CW structure along the deck
quotient map, make the cellular chain complex of the lift a complex of representations of
H, and prove each term free over ℤ[H] on chosen lifts of the cells. The cellular chains are
indexed by a multiplicative group, so the additive deck group H enters through
`Multiplicative H` and Mathlib's `IsAddQuotientCoveringMap.toMultiplicative`. Its completed version is
`Nov(R,H,N)⊗_(ℤ[H]) Ccell_*(X̃;ℤ)` with the displayed group-ring scalar map. In the
basis of chosen lifts it is the pinned coordinate base change
`HomologicalComplex.matrixBaseChange`, whose differentials are the images of the cellular
incidence matrices (`HomologicalComplex.toMatrix_matrixBaseChange_d`). That declaration
takes a ℤ-indexed complex of modules over a commutative ring with `Fin`-indexed bases, so
build the adapter from the ℕ-indexed complex of representations and its lifted-cell basis.
Prove a chain homotopy equivalence with CN, compatible with subdivisions, cell
models, orientation/lift changes and continuation. Build the alternative controlled
singular-chain model: locally finite chains upstairs with only finitely many simplices
meeting any region {f̃>C}, inside the pinned locally finite chains
`TauCeti.LocalCoefficientSystem.locallyFiniteChainComplex` of X̃, including the controlled
subdivision, prism and comparison operations. Prove that the pinned subdivision
`TauCeti.LocalCoefficientSystem.locallyFiniteSubdivisionChainMap` and its homotopy to the
identity `TauCeti.LocalCoefficientSystem.locallyFiniteSubdivisionHomotopy` preserve this
cutoff condition, and build the prism and comparison operations. Require the comparison to this carrier, not
merely an isomorphism with an unnamed completed homology.

Prove the exact-form specialization is the group-ring equivariant ordinary Morse
complex. Prove the large-gradient comparison for β=α+C df with C sufficiently
large and a chosen Morse–Smale f: after positive rescaling to df+C⁻¹α, the relevant
critical points and lifted incidence counts correspond, and the flow has no periodic
orbits (rt3 Lemma 4.1, p. 235, whose proof on p. 236 is a small-perturbation argument). Supply the structural-stability/entry-exit and support argument; cohomology
equality and a formal small-perturbation sentence are not proofs. Complete the
Morse-to-cellular chain identification for the triangulation-adapted model and
compare it with ordinary singular homology.

The homology comparison is rt3 equation (1.4), p. 213. The triangulation-adapted model, built from the triangulation vector field of Appendix B, is sketched in rt3 Example 1.8, p. 215; Remark 4.3, p. 237 records that the sketch is not rigorous, so the model is constructed here. The controlled chain-homotopy equivalence, subdivision and prism estimates are stronger targets whose construction is specified here.

The API includes:

- Completed cellular chains use the explicit group-ring scalar map, not an assumed tensor/completion interchange.
- Controlled subdivision and prisms give chain homotopy equivalences with the locally finite upstairs carrier.
- The exact and large-gradient comparisons respect the based chain model and its support.

**Checks.**

- For the exact circle on its universal cover, d=1−t over ℤ[t,t⁻¹], so H₀=ℤ and H₁=0.
- For nonzero circle period, 1−t is invertible and both completed homology groups vanish.
- The infinite sum of translates at increasing positive potential fails the finite-above condition; translates with potential −k pass every fixed upper cutoff.
- On S¹=ℝ/2πℤ with α=dθ, f=cos θ and the flat metric, the rescaled field −∇(f+C⁻¹θ) is (sin θ−C⁻¹)∂θ: for C>1 it has two zeros and no closed orbit, for C<1 the whole circle is a closed orbit, so C must be large.

*Needs:* §§3.1–3.2; Layer 1 modules; MorseTheory M2 finite CW model; Tau Ceti `TauCeti.cellularSingularHomologyIso`, `HomologicalComplex.matrixBaseChange` and AlgebraicTopology/Singular/Twisted/LocallyFinite Basic.lean and Subdivision.lean; AlgebraicTopology Stages 2–4; GeometricTopology Layer 11; HeegaardFloer ordinary Morse/singular comparison.
*In Tau Ceti:* `TauCeti.cwComplexPreimage`, `TauCeti.cellularChainComplexRep`, `TauCeti.cellularChainRepIsoFree`.

### 3.4 Naturality and top degree

Derive coefficient-change and homotopy naturality through these chain maps. For n=dim X and [α]≠0 prove H_n^Nov(X;ℤ)=0, with the orientation-local-system
argument valid for nonorientable X as well. Give nonexact classes with zero complex
and examples where Novikov homology is not H_*(X)⊗Nov.

Use rt3 §1.4, equation (1.4), p. 213 and the finite based field-complex reduction of Appendix A, pp. 239–240; top-degree vanishing follows from that comparison and the orientation-local-system argument.

The API includes:

- For connected X and nonzero class, top-degree integral Novikov homology vanishes, including nonorientable X.
- Coefficient and homotopy naturality are induced by the constructed chain comparisons.

**Checks.**

- A two-term field complex with differential 2 has chain ranks (1,1), Betti numbers (0,0) and Euler sums 0=0.
- For the critical-free nonzero-period circle, all Betti and critical counts vanish; ordinary circle Betti numbers (1,1) would give the wrong answer.
- For exact α=0 on an oriented circle with trivial cover, H₁=ℤ, so omitting the nonzero-class hypothesis would be false.
- For the torus with α the pullback of dx and cover ℝ×S¹, the completed cellular complex is (Nov —(1−t)→ Nov)⊗Ccell(S¹), acyclic since 1−t is a unit; so H₂^Nov=0 while H₂(T²;ℤ)=ℤ, and Novikov homology is not H_*(T²)⊗Nov.
- For the Klein bottle with the class of ds (§2.3), top-degree Novikov homology vanishes although the surface is nonorientable.

*Needs:* §3.3; AlgebraicTopology Stage 6 orientation coefficients.

### Examples

The three circle calculations distinguish exact group-ring homology from the acyclic nonzero-period completion.

### Dependencies

N3 uses N1–N2 and the ordinary cellular/Morse suppliers. Its field-rank consequences are developed in §4.6 after the independent component algebra.

## Layer 4: Based chain torsion and abelian total quotient rings

### 4.1 Determinant lines and based torsion

Build the determinant line of a bounded finite-dimensional chain complex over a field F
and its canonical comparison with the alternating determinant of homology, using bases
of boundaries and lifts through the short exact sequences 0→B_i→Z_i→H_i→0 and
0→Z_i→C_i→B_(i−1)→0, subspace factor first, as in the isomorphisms preceding rt3
equation (A.1), p. 239. Build it from the pinned determinant lines `TauCeti.detLine` of
its terms, transported along isomorphisms by `LinearEquiv.detLineCongr`, through the
pinned isomorphisms `TauCeti.exteriorPower.shortExactEquiv`; for a complex with two
nonzero terms compare it with the pinned determinant line `LinearMap.detLine` of the
differential, det(ker)⊗det(coker)*, and for a bijective differential with its
trivialization `LinearMap.detLineEquivOfBijective`. Fix the homological convention that
the elementary two-term complex with differential a from degree 1 to degree 0 has
torsion a⁻¹ for a≠0. This is Hutchings rt3, Definition A.1 and Proposition A.2, p. 239;
it is the inverse of Milnor's multiplicative convention in Whitehead torsion, §3, p. 365.
For bounded acyclic complexes obtain a nonzero scalar from the chosen ordered chain
bases; for nonacyclic complexes define the scalar to be 0 while retaining the more
informative homology-basis determinant line, which after a choice of homology bases is
a homology-basis torsion with chain- and homology-basis change laws. Prove independence
of boundary bases/lifts, that the scalar torsion of a bounded complex vanishes exactly
when the complex is not acyclic, permutation/sign rules, the graded basis-change formula,
scalar extension and direct sums. For a degreewise based short exact sequence of acyclic
complexes, prove scalar-torsion multiplicativity with compatible chain bases and the
explicit Koszul sign. For general complexes, prove determinant-line multiplicativity through the long exact
homology sequence, including its torsion correction with chosen homology bases. Regard
that sequence as an acyclic homological complex with H_i(A), H_i(B), H_i(D) in degrees
3i+2,3i+1,3i respectively, using the same alternating determinant order and
subspace-first lifts. Derive the scalar formula from this comparison; the
zero-extended scalar torsions do not replace the determinant-line formula. Prove
contraction and subdivision identities used below. Do not assert torsion is invariant
under every chain homotopy equivalence: prove its transformation under a chain map by
the torsion of its based mapping cone.

For an acyclic complex choose coordinate subspaces D_i,E_i for which the
**projection** `p_(E_(i−1))∘d|_(D_i)` is an isomorphism; rt3 Proposition A.2 proves
that such a choice exists. The differential need not map D_i into E_(i−1) itself.
When each E_i precedes D_i in the chain basis, prove that the torsion is the
alternating product of these square-minor determinants. For blocks in other positions,
reconcile it with the determinant-line convention, including the overall sign:
`τ=±Π_i det(d_s:D_i→E_(i−1))^((-1)^i)`, where `d_s=p_(E_(i−1))∘d|_(D_i)` is the square
minor and the sign is that of reordering the chain bases. For degreewise basis changes
A_i, prove `τ(A⁻¹dA)=τ(d)·Π_i det(A_i)^((-1)^i)` as an exact equality for
grading-preserving A.

Use rt3 Definition A.1, equation (A.1) and Proposition A.2, p. 239, and Proposition A.5, p. 240; transport Milnor §3, pp. 365–368 by inversion. Milnor's multiplicativity, §3, Theorem 3.1, holds modulo ±1, so the Koszul sign is fixed here rather than taken from it.

The API includes:

- The determinant comparison is independent of boundary bases and lifts and retains the homology determinant line in the nonacyclic case.
- Square minors use projection to the selected target coordinate subspace.
- Based exact-sequence, scalar-change, direct-sum and mapping-cone formulas retain their determinant order and signs.

**Checks.**

- For ℚ —2→ ℚ in degrees 1,0, torsion is 1/2; Milnor gives 2. With A₀=3 and A₁=5, the new differential is 10/3 and torsion 3/10=(1/2)·3/5.
- Differential 0 over ℚ has two nonzero homology groups, so its zero-extended scalar torsion is 0, not an acyclic determinant quotient. The zero complex has torsion 1.
- The column d(1)=(1,1) does not land in span(e₁), but projection to span(e₁) is [1], an invertible minor.
- The direct sum of ℚ —a→ ℚ and ℚ —b→ ℚ, a,b≠0, has torsion a⁻¹b⁻¹; the multiplicative convention would give ab.
- For the identity ℚ²→ℚ² with the degree-zero basis order swapped, A₀ is a transposition: the new differential has determinant −1 and torsion −1, and τ(d)·det(A₀)=−1 agrees, so the basis-change formula holds with its sign.

*Needs:* Mathlib finite-dimensional linear algebra, exterior powers, chain complexes and homology; Tau Ceti `TauCeti.detLine`, `LinearEquiv.detLineCongr`, `LinearMap.detLine`, `LinearMap.detLineEquivOfBijective` and `TauCeti.exteriorPower.shortExactEquiv`.
*In Tau Ceti:* `HomologicalComplex.reidemeisterTorsion`, `HomologicalComplex.reidemeisterTorsion_eq_zero_iff`,
`HomologicalComplex.reidemeisterTorsion_eq_finprod`, `HomologicalComplex.reidemeisterTorsion_eq_det_zpow`,
`HomologicalComplex.reidemeisterTorsion_reindex`, `HomologicalComplex.reidemeisterTorsion_eq_mul_finprod_det`,
`HomologicalComplex.map_reidemeisterTorsion`, `HomologicalComplex.reidemeisterTorsion_biprod`,
`HomologicalComplex.reidemeisterTorsion_eq_mul_of_shortExact`,
`HomologicalComplex.reidemeisterTorsionWithHomology`,
`HomologicalComplex.reidemeisterTorsion_homotopyCofiber`,
`HomologicalComplex.reidemeisterTorsion_eq_mul_of_quasiIso`, `HomologicalComplex.torsionMinor`,
`HomologicalComplex.reidemeisterTorsion_eq_finprod_det_torsionMinor`,
`HomologicalComplex.reidemeisterTorsion_eq_mul_finprod_det_toMatrix`.

### 4.2 Abelian total quotient components

Use Mathlib `Localization (nonZeroDivisors A)` for total quotients. For a finitely
generated abelian H prove that the total quotient rings of ℤ[H] and Nov(ℤ,H,N) are
finite products of characteristic-zero fields. Construct the finite-torsion/free
splitting and cyclotomic components, prove reducedness of ℤ[H] and of Nov(ℤ,H,N), the
latter because the former is, and the componentwise field/localization statements; show
the answer is independent of that splitting. Prove that the group-ring inclusion sends
nonzerodivisors to nonzerodivisors and induces an injective total-quotient map
compatible with the field components.

For the completion, prove that the total quotient of Nov(R,H,N) over a domain R is
Artinian, with characteristic-zero residue fields when R has no additive torsion.
Reducedness passes to the localization by `IsLocalization.isReduced`, and Mathlib's
`IsArtinianRing.equivPi` presents the reduced Artinian total quotient as the product of
its residue fields. For the torsion subgroup T of H the pinned
`AddMonoidAlgebra.algEquivPiField` presents K[T], over a field K in which the order of T is
nonzero, as the product of its residue fields at the maximal ideals, and
`AddMonoidAlgebra.isFractionRing_of_finite` identifies K[T] with the total quotient of R[T]
when K is the Artinian total quotient of R. The pinned
`TauCeti.NovikovSeries.exists_finiteIndex_isDomain` gives a finite-index subgroup of H whose
Novikov ring is a domain; Nov(ℤ,H,N) is finite free over it on the coset monomials
(`TauCeti.NovikovSeries.cosetBasis`), and
`IsFractionRing.isLocalization_algebraMapSubmonoid_iff` then presents its total quotient as
the localization at the nonzero elements of that domain. Identify the residue fields with
the cyclotomic components of a finite-torsion/free splitting; the components, being
indexed by maximal ideals, do not depend on that splitting. In the
torsion-free case recover native fraction fields and the leading-term domain proof.
Do not replace the general deck group by its free quotient.

Use rt3 Lemma A.4 and its proof, p. 240, retaining the finite-generation and characteristic-zero hypotheses. The field components are the minimal ideals of the total quotient ring (rt3 Appendix A, p. 240), which makes them independent of the splitting; the induced total-quotient map is rt3 §1.6, p. 214.

The API includes:

- Group-ring inclusion preserves nonzerodivisors and induces an injective total-quotient map.
- The finitely many characteristic-zero field components are independent of a chosen splitting.
- Torsion-free H gives a domain; finite torsion is retained in the component decomposition.

**Checks.**

- For H=0, the total quotient of ℤ is ℚ.
- For H=ℤ/2 and N=0, Q(ℤ[H])=ℚ×ℚ with g↦(1,−1); 1−g maps to (0,2).
- For H=ℤ/3, Q(ℤ[H])=ℚ×ℚ(ζ₃), two fields of different degrees; for H=ℤ it is the single field ℚ(t).
- For H=ℤ⊕ℤ/2 and N(n,e)=−n, with t=e^(−1,0) the downward monomial of §2.3 (so N(t)=1) and g=e^(0,1), Nov=ℤ((t))[g]/(g²−1), and the idempotents (1±g)/2 give Q(Nov)=F×F with F the fraction field of ℤ((t)). The map from Q(ℤ[H])=ℚ(t)×ℚ(t) is ℚ(t)→F in each component, followed by §4.3's embedding F⊂ℚ((t)). F is neither ℚ((t)) nor ℚ⊗ℤ((t)): a quotient f/h of integral Laurent series lies in ℤ[1/c]((t)) for c the lowest nonzero coefficient of h, so exp(t)=Σtⁿ/n!, whose coefficient of t^p has p in its denominator for every prime p, is not in F; and 1/(2−t)=Σtⁿ/2ⁿ⁺¹ is in F but has unbounded denominators. The splitting with free generator (1,1) gives the same two minimal ideals.
- Over 𝔽₂, (1+g)²=0 with 1+g≠0, so the characteristic-zero component statement cannot be exported unchanged.

*Needs:* Layer 1 leading coefficients; the coset-monomial basis of §4.4; Tau Ceti `TauCeti.NovikovSeries.exists_finiteIndex_isDomain`, `AddMonoidAlgebra.algEquivPiField`, `AddMonoidAlgebra.isFractionRing_of_finite`, `IsFractionRing.isLocalization_algebraMapSubmonoid_iff` and `IsLocalization.isReduced`; Mathlib `Localization`, `nonZeroDivisors` and `IsArtinianRing.equivPi`; finite abelian groups and cyclotomic fields.
*In Tau Ceti:* `TauCeti.NovikovSeries.ofAddMonoidAlgebra_mem_nonZeroDivisors`,
`TauCeti.NovikovSeries.map_ofAddMonoidAlgebra_injective`,
`AddMonoidAlgebra.exists_ringEquiv_pi_field_of_isFractionRing`,
`AddMonoidAlgebra.isReduced_of_isFormallyReal`, `TauCeti.NovikovSeries.isReduced_iff`,
`TauCeti.NovikovSeries.isArtinianRing_of_isFractionRing`,
`TauCeti.NovikovSeries.charZero_quotient_of_isFractionRing`.

### 4.3 Total-quotient topology and continuity

Construct the period-order topology on each total-quotient field component:
after a free/torsion and period-kernel splitting H≅ker N⊕H′, embed it into the
Novikov ring over H′ with coefficients in the fraction field of the corresponding
characteristic-zero kernel group algebra. That ring is a field by
`TauCeti.NovikovSeries.isField_iff` (RingTheory/NovikovSeries/Field.lean), since its
coefficients form a field and N is injective on H′. Define O(C) by order>C, with the
pinned order `TauCeti.NovikovSeries.order` (`TauCeti.NovikovSeries.le_order_iff`), and
prove independence of the splitting, continuity of addition/multiplication and inversion
at nonzero elements. For addition and multiplication the order estimates are the pinned
`TauCeti.NovikovSeries.min_order_le_order_add` and `TauCeti.NovikovSeries.order_mul`, whose
hypothesis that the group ring has no zero divisors holds for the finitely generated
torsion-free H′ by Mathlib's `AffineAddMonoid.to_twoUniqueSums`. The total quotient has the product topology
over its finitely many field components; completeness of Nov alone is not a
completeness claim for this quotient. Prove rt3 Lemma 2.8's cutoff continuity
of based torsion when the acyclic component set is fixed, by applying in each field
component, with this topology, the minor-chart continuity of torsion over a topological
field on a fixed nonvanishing minor chart: a nonzero limiting minor remains
nonzero, and high-order changes in its inverse remain high order; the determinant estimate
for the minor is the pinned `Matrix.det_sub_det_mem_periodFiltration_of_weights`.

Use rt3 §2.1, Definition 2.6 and Lemmas 2.7–2.9, pp. 220–221; in particular the proof of Lemma 2.8 fixes the acyclic component set. rt3 §2.1, p. 220 identifies each field component with a tensor product of Nov(G/Ker N, N) with a field; only the embedding above holds (the ℤ⊕ℤ/2 Check of §4.2), and the order O(C) is defined through it.

The API includes:

- Splitting-independent orders give a product topology on the finite total quotient.
- Inversion is continuous at nonzero elements in each field component.
- Torsion has the cutoff continuity formula on a fixed acyclic-component stratum.

**Checks.**

- For a=2 and perturbation t^m, (2+t^m)⁻¹ begins 1/2−t^m/4, so the difference has order m.
- In the two components (0,2), the zero component remains zero under a perturbation confined to the second component, whose torsion tends to 1/2.
- At a=0 the zero-extended two-term torsion is 0 but for a=t^m it is t^(−m); continuity across the acyclic/nonacyclic change is false.

*Needs:* §4.2; Layer 1 period filtration; §4.1 minor formula; Tau Ceti RingTheory/NovikovSeries/Field.lean, Basic.lean, LeadingTerm.lean and Matrix.lean; Mathlib `AffineAddMonoid.to_twoUniqueSums`.
*In Tau Ceti:* `HomologicalComplex.tendsto_reidemeisterTorsion_of_det_torsionMinor_ne_zero`.

### 4.4 Finite cyclic norms and traces

For a cyclic quotient μ:H→ℤ/k with kernel K, prove Nov(ℤ,H,N) is finite free of rank k
over Nov(ℤ,K,N|K), with coset-monomial basis, and more generally free of rank the index
over the Novikov ring of every finite-index subgroup. Define Norm and Tr as determinant
and trace of multiplication, Mathlib's `Algebra.norm` and `Algebra.trace`, with their
basis independence and the multiplicativity of Norm; prove Tr=k·coefficient restriction,
and over a ℚ-algebra prove log Norm(1+x)=Tr log(1+x) for x in the positive ideal.
Extend Norm to the total quotients as the multiplicative extension of the norm of a
finite free algebra, compatible with Norm on the ring and with towers of extensions;
this extension needs no hypothesis on μ. If μ kills the torsion
subgroup of H, identify corresponding
field components and prove a nonzero component stays nonzero under Norm.
Under this same hypothesis prove cellular and Novikov torsion transform by
Norm, retaining zero on nonacyclic components and pullback Euler structures.
The ring-level Norm, its extension to the total quotients and the zeta formula do not
require this additional hypothesis; the asserted component and torsion comparison does.

Use rt3 Lemma 3.5 and Proposition 3.6, pp. 227–228, including condition (3.8): the rank-k free extension is rt3 §3.4, p. 227; Tr=k·restriction and log Norm=Tr log are Lemma 3.5(a)–(b), p. 227; nonvanishing under (3.8) is Lemma 3.5(c), p. 227; the torsion transformation is Proposition 3.6(b), p. 228.

The API includes:

- Coset monomials give a rank-k free extension; multiplication defines basis-independent norm and trace.
- Trace equals k times coefficient restriction and log Norm equals Tr log in the positive rational ideal.
- If the quotient kills deck torsion, the norm preserves nonzero field components and transforms based torsion.

**Checks.**

- For ℤ→ℤ/2 with s=t², multiplication by t has matrix [[0,s],[1,0]], trace 0 and norm −s; Norm(1−t)=1−s.
- For 1+t², Tr=2+2s, matching twice restriction; restriction alone would miss the factor 2.
- Norm(1+ct)=1−c²s, whose logarithm −c²s−c⁴s²/2−⋯ is twice the even part of log(1+ct)=ct−c²t²/2+⋯, as log Norm=Tr log requires.
- For H=ℤ/2 mapping identically to ℤ/2, the component idempotent (1,0) is nonzero but has norm 0; this quotient does not kill torsion.

*Needs:* §§4.1–4.3; Layer 1 coset modules and positive logarithms.
*In Tau Ceti:* `TauCeti.NovikovSeries.cosetBasis`, `TauCeti.NovikovSeries.finrank_eq_index`,
`TauCeti.NovikovSeries.trace_eq_index_smul_comap`, `TauCeti.NovikovSeries.log_normNonnegSubring`,
`Algebra.fractionNorm`, `Algebra.fractionNorm_mk'`, `Algebra.fractionNorm_eq_norm`,
`Algebra.fractionNorm_trans`.

### 4.5 Partial acyclicity and lift ambiguity

For a based finite free complex over either ring, define torsion componentwise in the
reduced Artinian total quotient of §4.2, setting a component to 0 exactly when that
component complex is nonacyclic, and prove it natural under ring homomorphisms between
reduced Artinian rings. Retain
partial acyclicity; a single global zero convention would lose information. Define
the ambiguity action by signs and deck monomials on the **whole** total quotient
ring, including 0, and pass to its orbit quotient. Prove torsion's formulas under
ordered orientation/lift changes: over a field, a change of orientations and lifts
rescales the basis vectors by units and multiplies the torsion by the alternating
product of those units; prove the componentwise form of that formula. Prove torsion's
formulas under regular cellular subdivision and triangulation
changes. Use GT's smooth triangulation/PL comparison and explicit subdivision
mapping cones. Cellular torsion is a simple-homotopy invariant with the stated
based structure, not an invariant of arbitrary unbased homotopy equivalence.

Use rt3 Definitions A.1 and A.3, pp. 239–240 and §1.5, pp. 213–214, with subdivision comparison constructed from the stated topological suppliers; the orbit quotient Q(Nov)/±e^H is that of rt3 Definition 1.5, p. 214.

The API includes:

- Componentwise torsion vanishes exactly on nonacyclic components.
- Signs and deck monomials act on the whole total quotient, including zero.
- Orientation, lift and simple subdivision changes have the prescribed based torsion factors.

**Checks.**

- For H=ℤ/2 and d=1−g, the two components have d=0 and d=2, hence torsions (0,1/2), not global zero.
- The ambiguity action fixes 0 and sends a nonzero scalar a to ±e^h a; it cannot turn 0 into 1.
- Changing only the degree-zero lift by t multiplies torsion by t; changing only the degree-one lift multiplies it by t⁻¹.
- The two-cell circle with d e₁=v₂−v₁ and d e₂=t v₁−v₂ has matrix [[−1,t],[1,−1]] of determinant 1−t, so its torsion is (1−t)⁻¹ modulo sign, as for the one-cell model.

*Needs:* §§4.1–4.4; GeometricTopology Layer 11; AlgebraicTopology Stage 4; Layer 3 when applying torsion to its complexes.
*In Tau Ceti:* `HomologicalComplex.componentwiseReidemeisterTorsion`,
`HomologicalComplex.mk_componentwiseReidemeisterTorsion_eq_zero_iff`,
`HomologicalComplex.map_componentwiseReidemeisterTorsion`,
`HomologicalComplex.reidemeisterTorsion_unitsSMul`.

### 4.6 Novikov inequalities

For a Morse–Smale closed one-form on the standing compact connected manifold
and a specified connected abelian period cover, prove the weak and strong
Novikov inequalities in each field component of the total quotient. Write c_i
for the number of index-i critical points and b_i for the dimension of the
component Novikov homology. Prove b_i≤c_i and, for each q≥0,
Σ(i=0,…,q)(−1)^(q−i)b_i≤Σ(i=0,…,q)(−1)^(q−i)c_i, with equality for
q=dim X. These are dimensions over an actual field, not ranks over an assumed
Novikov field (rt3 §1.4, equation (1.4), p. 213 and Appendix A, pp. 239–240;
the inequalities follow from splitting the resulting finite field complex).
For the finite complex of each field component, in degrees 0 to dim X and so indexed by ℕ,
that algebraic step is Tau Ceti's `HomologicalComplex.finrank_homology_le_finrank_X` and
`ChainComplex.sum_range_neg_one_pow_mul_finrank_homology_le`, and at q=dim X, where the
differential out of degree dim X+1 vanishes,
`ChainComplex.sum_range_finrank_X_eq_sum_range_finrank_homology` multiplied by (−1)^(dim X).

**Checks.**

- A two-term complex with nonzero scalar differential has c₀=c₁=1 and b₀=b₁=0: at q=0, 0≤1, and at q=1, 0=1−1.
- A point has c₀=b₀=1, so both weak and top-degree alternating inequalities are equalities 1=1.
- For the zero differential in ranks (1,1), b₀=b₁=1; for differential 2 over ℚ they are 0,0. Chain ranks alone do not fix the Betti numbers.

*Needs:* §3.1 Novikov complex and §3.3 cellular comparison; §4.2 field components;
Tau Ceti `HomologicalComplex.finrank_homology_le_finrank_X`,
`ChainComplex.sum_range_neg_one_pow_mul_finrank_homology_le` and
`ChainComplex.sum_range_finrank_X_eq_sum_range_finrank_homology`;
Mathlib finite-dimensional linear algebra and homology.

### Examples

The two-term complex over ℤ[ℤ/2] detects both the torsion convention and partial acyclicity.

### Dependencies

N4 algebra depends on N1 and pinned linear/homological algebra; applications consume N3 complexes. No torsion construction depends on N6 invariance.

## Layer 5: Periodic return orbits and the dynamical zeta function

### 5.1 The closed-form return germ

Apply HeegaardFloer §2.8 (F0.6)'s local return germ to −α♯. The transition to a transverse
section is the pinned hitting time `TauCeti.flowHittingTime` for the maximal flow
`TauCeti.flowOf`, of the regularity given by `TauCeti.contMDiffAt_flowOf_flowHittingTime`.
A transverse
section through a nonstationary periodic orbit gives a germ P, its derivative
on the normal quotient, and conjugacies under section/basepoint changes.
Check the nonvanishing-field hypothesis along that orbit; the application uses
local flow near its compact image. No invariant transverse disk is required.

Use HeegaardFloer §2.8 (F0.6) for the germ and rt3 §1.1, p. 210 for its closed-one-form use.

The API includes:

- The normal return derivative and its spectrum are independent of the chosen section and basepoint.
- Every positive iterate uses the supplied iterate conjugacy.
- The zero-dimensional transverse space is retained for circle flows.

**Checks.**

- For P(x)=2x and section transition h(x)=3x, hPh⁻¹(x)=2x, the derivative is 2 and det(1−DP)=−1 in either section.
- For a critical-free circle orbit the transverse space has dimension 0, so its determinant and return sign are 1.
- At a critical point α♯=0, no transverse return germ of a nonstationary orbit is claimed.

*Needs:* HeegaardFloer §2.8 (F0.6); Layer 2 negative dual flow; Tau Ceti Geometry/Manifold/Flow/HittingTime.lean and `TauCeti.flowOf`.

### 5.2 Orbit multiplicity and local fixed-point index

Define a primitive periodic orbit of −α♯ up to rotation, with its least real return
time, and define the k-fold iterate separately; on compact X the flow of −α♯ is the
complete flow `TauCeti.globalFlow` of this field, and closed orbits are periodic
trajectories of a continuous real flow on a T₁ space up to rotation. The integer
multiplicity p(γ) is its covering degree over the primitive orbit; it is not the return
time. Apply the supplied return germs and their normal-derivative conjugacies. An
isolated return fixed point has local index defined by perturbing the return map
on an isolating transverse chart neighbourhood to have nondegenerate fixed points
and summing `sgn det(1−dg)` over them. Use a generic relative homotopy's
one-dimensional zero cobordism to prove independence of the perturbation.
In transverse dimension zero the isolated point has index 1; in dimension one
the same signed sum applies, with no positive-dimensional boundary sphere assumed.
In dimensions at least two compare with the degree on the boundary sphere
of `x↦x−return(x)`: at a regular value it is the pinned signed count
`TauCeti.degreeAtRegularValue`, and its independence of the regular value and homotopy
invariance are DG 10's. Build independence
of chart/isolating neighbourhood, additivity and restriction
and homotopy invariance while the boundary remains fixed-point free. At a
nondegenerate point prove the index is ε below, including transverse dimension 0.
These are the local-index suppliers for N6's closed-orbit degeneration argument.
Extend the index to continuous maps with compact isolated fixed set by a
C⁰-small smooth approximation that stays fixed-point-free on the isolating
boundary. Prove independence by relative approximation of a boundary-avoiding
homotopy; compare this extension with the smooth index. Construct its homological
graph/diagonal intersection description using AT's relative homology and excision
and the pinned orientation local system, `TauCeti.localHomologySystem` in top degree with
integer coefficients; normalize the two local orientation factors by
their canonical square pairing, so the integer needs no orientation of the
ambient manifold. Prove agreement with the approximation definition and
the partial-domain commutativity formula. For open subsets `U⊆Y₁`,
`V⊆Y₂` of smooth manifolds Y₁,Y₂ and continuous maps `f:U→Y₂`, `g:V→Y₁`, the composites g∘f and f∘g
have domains `f⁻¹(V)⊆U` and `g⁻¹(U)⊆V`. When their fixed sets are compact
and isolated, prove `i(g∘f)=i(f∘g)`; f identifies these fixed sets with inverse g.
No assumption that either composite preserves its isolating neighbourhood is
made. Derive invariance under
conjugation by a homeomorphism of isolating neighbourhoods, including the
piecewise smooth homeomorphisms of a smooth triangulation. This proves
independence of topological as well as smooth charts. This is the interface
for N6's cellular/simplicial Hopf construction. Iterate formulas below apply
to nondegenerate return maps; no universal degenerate-iterate formula is assumed.
An
admissible pair requires every iterate nondegenerate in addition to N2's critical
and trajectory conditions. Define ε(γ)=sgn det(1−dreturn_γ). Establish generic
admissible pairs in each fixed cohomology class by local return-map perturbations
and the countable intersection over bounded-period/iterate windows.

Use rt3 §1.1 and §1.3, pp. 210–212, and Lemma 3.2, p. 223 for index conservation. Admissible pairs are rt3 Definition 1.1, p. 211, generic in each fixed cohomology class by the transversality remark following it. The continuous, chart-independent and partial-domain index interfaces are constructed here from degree.

The API includes:

- Multiplicity is an integer covering degree, independently of the real return time.
- The local index is additive, invariant through boundary-avoiding homotopies and agrees with the determinant sign at nondegenerate fixed points.
- Continuous approximation, graph/diagonal pairing and partial-domain commutativity extend the same index without an orientation of the ambient manifold.
- Fixed-cohomology genericity preserves the closed-form condition and treats every iterate.

**Checks.**

- A primitive orbit of real period 7 has multiplicity 1; its double has period 14 and multiplicity 2.
- For local maps P(x)=x/2 and P(x)=2x at 0, det(1−DP)=1/2 and −1, giving indices +1 and −1.
- On an interval, P(x)=x+x²−ε has for ε>0 two fixed points with determinant signs +1 and −1, total 0; ε<0 has no fixed point, also total 0.
- For the degenerate g(x)=x+x³ and ε>0, x+x³−εx has fixed points 0 (sign +1) and ±√ε (sign −1 each), while x+x³+εx has only 0 (sign −1); both perturbations give index −1.
- For α=dx on T² with the flat metric every orbit is periodic with return derivative 1, so the pair is not admissible; a generic metric in the same class is admissible, so admissibility depends on the metric and not only on [α].
- Conjugation by h(x)=−x leaves the derivative of P(x)=2x equal to 2; chart reversal must not reverse its index −1.

*Needs:* §5.1; Tau Ceti `TauCeti.globalFlow`, `TauCeti.degreeAtRegularValue` and `TauCeti.localHomologySystem`; DifferentialGeometry Layer 10 and relative smooth approximation; AlgebraicTopology Stages 2–3 and 6; Layer 2 critical transversality.
*In Tau Ceti:* `Flow.ClosedOrbit`, `Flow.ClosedOrbit.IsPrimitive`, `Flow.ClosedOrbit.primitive`,
`Flow.ClosedOrbit.iterate`, `Flow.ClosedOrbit.multiplicity`.

### 5.3 The zeta series, integrality and cover norm

Prove only finitely many closed orbits up to rotation, with iterates included,
have N([γ]) below any prescribed positive threshold. Rule out accumulation on a degenerate orbit and on a broken
cycle through critical points; the latter needs an equal/higher-index segment,
excluded by N2. Include all iterates and prove multiplicity support estimates.
Construct the rational log series `Σγ ε(γ)/p(γ) · e^[γ]` in the positive period ideal
and its exponential ζ, from the classes of the primitive orbits and the signs of their
iterates; the finiteness just proved is the hypothesis that the periods of the primitive
orbits tend to infinity along the cofinite filter. This uses the completion over ℚ, not
an assumed tensor-product commutation with completion over ℤ. Prove ζ has integral
coefficients by the convergent product over primitive orbits

`ζ=Πγ (1−(−1)^i_−(γ)e^[γ])^(−ε(γ)(−1)^i_−(γ))`,

where i_− counts real return eigenvalues below −1, i_+ those above 1, and
i_0 those in (−1,1), with algebraic multiplicity: whenever the signs of the iterates of
each orbit form a geometric sequence of ratio ±1, ζ is this Euler product, which is the
image of the same Euler product with integer coefficients. Prove
ε(γ^k)=(−1)^i_+ · (−1)^((k+1)i_−) for the normal return derivative, so the signs of
the iterates of γ form a geometric sequence of ratio (−1)^i_−, and the exponent is
−(−1)^(i_++i_−)=(−1)^(dim X−i_0): the transverse space has dimension dim X−1 and no real
return eigenvalue is ±1, and for a real square matrix A of size n with 1−A² invertible,
(−1)^(i_++i_−)=(−1)^(n+i_0), because the number of real characteristic roots has the
parity of n. Prove these identities from real/complex conjugate eigenvalue blocks, for
matrices and then for the linear return map, then log/product equality and integrality.
It specializes to −(−1)^i_0, the exponent of rt2 equation (2), p. 371,
only in odd dimension. Show ζ is a unit with ζ−1 in U_c for some c>0, hence with
constant term 1. Prove naturality for valid period-support exponent maps and the finite
cyclic cover norm formulas needed for N6, retaining the individual lift/iterate
multiplicities. For 0→K→H→[μ]ℤ/k→0, prove ζ(X̂)=Norm(ζ(X)) with no torsion-annihilation
hypothesis; use §4.4's log Norm=Tr log and Tr=k·restriction on each orbit term,
including shorter primitive lifts.

Use rt3 §1.3, equations (1.1)–(1.2), p. 212 and Proposition 3.6(a), p. 228, and for integral classes rt2 Definition 1.3, p. 371; derive the dimension-correct iterate/product signs from real eigenvalue blocks.

The API includes:

- Every cutoff receives finitely many orbit/iterate contributions; multiplicity denominators are taken in the rational completion.
- The primitive product gives integral coefficients and constant coefficient 1.
- Period-compatible coefficient maps and all finite cyclic covers obey the norm formula, without imposing the extra torsion-annihilation condition.

**Checks.**

- For a critical-free circle, log ζ=t+t²/2+t³/3+⋯ and ζ=1+t+t²+⋯; the constant coefficient 1 excludes zero.
- On a surface an attracting return multiplier 1/2 has all signs +1 and factor (1−t)⁻¹; a repelling multiplier 2 has all signs −1 and factor 1−t.
- For multiplier −2, signs are +1 on odd iterates and −1 on even iterates, giving factor 1+t; (1+t)/(1−t²)=1/(1−t) checks period doubling.
- For the Klein-bottle mapping torus with return map f(θ)=−θ+ε sin θ, 0<ε<1, the only periodic points are the fixed points 0 and π, with derivatives −1+ε (i_0=1) and −1−ε (i_−=1). Then log ζ=Σt^k/k+Σ(−1)^(k+1)t^k/k, so ζ=(1+t)/(1−t), agreeing with the exponents (−1)^(2−i_0); the exponent −(−1)^i_0 would give the factor (1−t)^(+1) for the orbit at 0.
- For the double cyclic circle cover with s=t², Norm((1−t)⁻¹)=(1−s)⁻¹; no missing factor 2 is allowed in the exponent.

*Needs:* §§5.1–5.2; Layer 2 cutoff compactness; Layer 1 positive series; §4.4 norms.
*In Tau Ceti:* `TauCeti.NovikovSeries.orbitLog`, `TauCeti.NovikovSeries.orbitZeta`,
`TauCeti.NovikovSeries.isUnit_orbitZeta`, `TauCeti.NovikovSeries.orbitZeta_sub_one_mem_periodFiltration`,
`TauCeti.NovikovSeries.eulerProduct`, `TauCeti.NovikovSeries.orbitZeta_eq_eulerProduct`,
`TauCeti.NovikovSeries.orbitZeta_eq_mapRingHom_eulerProduct`,
`TauCeti.NovikovSeries.mapRingHom_eulerProduct`, `Matrix.sign_det_one_sub_pow`,
`LinearMap.sign_det_one_sub_pow`, `Matrix.neg_one_pow_card_roots_charpoly`,
`Matrix.neg_one_pow_card_filter_one_lt_add_card_filter_lt_neg_one`.

### Examples

Return signs in transverse dimensions 0 and 1 distinguish ambient odd and even dimensional product exponents.

### Dependencies

N5 uses N1–N2, HeegaardFloer §2.8 and N4 norms. Its index construction precedes the Lefschetz theorem and uses no global trace formula.

## Layer 6: Dynamical torsion, bifurcations and geometric calculations

### 6.1 The dynamical invariant and generic events

For χ(X)=0 and an admissible pair set
`I(α,g,π)=τ(CN)·ζ ∈ Q(Nov(ℤ,H,N))/(±e^H)`.
Prove that it depends only on [α] and the specified cover, and prove
`I=i(τ(Ccell(X̃)))`, with i the N4 total-quotient map. Include arbitrary real
cohomology classes and all finitely generated abelian deck groups, not just
integral classes or the torsion-free acyclic case.

Construct a generic fixed-cohomology one-parameter family with prescribed
admissible endpoints, at every period cutoff: transverse critical-point slides,
ordinary trajectory tangency/cancellation, isolated critical birth/death and
closed-orbit degenerations, with the semi-isolation and good-parameter conditions
of Hutchings rt3 §2 (good times are rt3 Definition 2.6, p. 220). Consume [HeegaardFloer §1.5 (M.5)](../HeegaardFloer/README.md)'s ordinary local A₂
fold, relative partial-jet transversality and signed elementary chain change.
Construct the closed-one-form specialization using local exact potentials
and exact cutoff perturbations, retaining the global cohomology class,
period cutoffs and cover/lift comparisons. Choose the metric Euclidean in
the resulting Cerf chart and pin the potential and positive metric dual
with precisely that local normalization:
`α_t=d(x₁³/3 ± (t−t₀)x₁ − Σ_(j=2)^i x_j²/2 + Σ_(j>i)x_j²/2)` and
`V_t=(x₁² ± (t−t₀),−x₂,…,−x_i,x_(i+1),…,x_n)`
(rt3 Lemma 2.11(a), equation (2.1), p. 222, and its proof, p. 223).
The two critical points have indices i and i−1; trajectories use −V_t.
For closed-orbit-only degenerations use rt3 Lemma 3.2's local fixed-point-index
invariance on transverse return discs (p. 223); a full classification of periodic-orbit
bifurcations is not an assumed supplier. Prove the bifurcation analysis:
opposite trajectory cancellations; closed-orbit local-index conservation; handle slides
between distinct critical points; same-critical-point deck slides; and critical
birth/death with multiply broken return trajectories. Compare the based complex
matrices, determinant/minor factors and zeta factors at each event.

The invariant I is rt3 Definition 1.5, p. 214. The unrefined invariance and cellular equality are rt3 Theorems A and B, pp. 214–215, proved for real multiples of integral classes in rt2 Theorem 1.7, p. 373; the generic event framework is §2, pp. 218–223 and the ordinary events are §3.1–3.3, pp. 223–226.

The API includes:

- The invariant lives in the whole total-quotient orbit space and retains partial acyclicity.
- Generic fixed-cohomology families are relative to admissible endpoints and are controlled at each period cutoff.
- Closed-orbit local-index conservation and ordinary critical events have the specified chain and zeta factors.

**Checks.**

- For the critical-free nonzero-period circle, τNov=1 and ζ=(1−t)⁻¹, so I=(1−t)⁻¹.
- In the local fold x³/3−εx, ε>0 gives zeros ±√ε with Hessians ±2√ε, hence indices 1 and 0; ε<0 has no zeros.
- An elementary distinct-critical-point slide matrix [[1,a],[0,1]] has determinant 1, hence introduces no torsion factor.
- For exact α=df there are no closed orbits, so ζ=1 and I=τ(CN), the classical equality of Morse and cellular torsion (rt3 Example 1.8, p. 215).
- In the normal form with sign + and t<t₀, −V_t has x₁-component (t₀−t)−x₁², so the single connecting trajectory runs along the x₁-axis from the index-i point x₁=−√(t₀−t) to the index-(i−1) point x₁=√(t₀−t), with elementary coefficient ±1.
- At a closed-orbit-only degeneration CN and ζ are unchanged: by §5.2's cubic Check the total local index is −1 before and after.

*Needs:* Layers 1–5; HeegaardFloer §1.5 (M.5) and F0; DifferentialGeometry relative exact perturbations.

### 6.2 Self-slides and all-order cancellation

For self-slides,
prove the all-order identity using the finite cyclic cover/norm argument. If
h is the slide class, let d be the divisibility of its nonzero image in H/T,
where T is the torsion subgroup. Use two explicitly distinguished cover families:
for k coprime to d, `μ_k:H→ℤ/k` kills T and sends h to 1, for the chain
stabilization; for every k≥2, `ν_k:H→ℤ/(dk)` kills T and sends h to d,
for norm elimination. In the latter `nh∈ker ν_k` iff k divides n.
Construct both from an integral functional equal to 1 on the primitive
class h̄/d, reducing modulo dk for ν_k and multiplying by d⁻¹ modulo k
for μ_k. Both quotients are surjective.
For a slide at p of index i, construct `x=1+Σ_(n≥1)a_n e^(nh)`
with `a₁=±1` the geometric sign of the h-class self-slide trajectory from p
to p: extend N2's determinant-line orientation to the parameterized trajectory
space, with the parameter axis oriented by increasing t. This gives the signed
zero-dimensional family crossing. Prove `d₊=A_p(x)⁻¹d₋A_p(x)`, where A_p(x) multiplies
the chosen p-generator by x and fixes the other generators. Prove this all-order
chain identity using the μ_k covers, with cutoff `R_k=N(kh)` and only events
of drop strictly less than R_k. Let k tend to infinity through values coprime
to d, so these cutoffs exhaust all finite drops and no class kh self-slide is
used in the elementary-matrix step. For each such cutoff choose a semi-isolated
parameter window with admissible endpoints, then perturb its pullback family
non-equivariantly relative to those endpoints. Apply the generic-family theorem
on the compact finite cover and prove the perturbation is small enough that
below that cutoff only the lifted slides occur. Their conjugator is a product
of elementary slide matrices. Recover its equivariance modulo the cutoff by
comparing rows/columns with the endpoint differentials, which are restrictions
of Nov(H)-linear maps: the relevant one-variable series are nonzerodivisors
on Nov(ℤ,H,N), as proved cosetwise over ℤh. The equivariant conjugator has
twisted circulant form, with shift `S^k=e^(kh)` over the kernel Novikov ring.
In the non-split case prove x is determined modulo each cutoff (accounting for
the fixed order shifts of the nonzero baseline row/column); hence every
coefficient a_(n,k) stabilizes as k tends to infinity through coprime values.
Include the case where both the
outgoing boundary of p and every incoming p-coefficient vanish: p splits off
as a homology summand in every field component, and the chain identity is
independent of higher coefficients of x; choose them arbitrarily while retaining
the geometric a₁. Treat event invariance there directly as 0=0.
Define `y=ζ₊/ζ₋` and prove it lies in `1+Σ_(n≥1)ℤ e^(nh)` by showing that
only orbit classes nh are created or destroyed. Write its coefficients b_n.
Construct the compactified return-map graph and prove its leading-coefficient
identity b₁=(−1)^(i+1)a₁ with the fixed orientation convention, then eliminate
every higher coefficient by the ν_k covers and N4's nonvanishing norm lemma
when τ₋ has a nonzero field component, obtaining `y=x^((-1)^(i+1))` by
injectivity of the one-variable slide series in that component. Explicitly,
for `z=x^((-1)^i)y`, prove the e^(kh) coefficient of
`log Norm_(ν_k)(z)` vanishes. Perturb the ν_k pullback family relative to
endpoints below a sufficiently large cutoff. Lifted slides with k not dividing
the lift-index difference are distinct-point slides, which preserve I; a
first self-slide in class kh has no linear term by the already proved chain
and geometric leading-coefficient identities. Thus the cover changes I by
`1+O(e^(2kh))`, without assuming full event invariance in that cover.
Cancel in a nonzero cover component using N4's norm lemma and prove the
injectivity of one-variable series in e^(kh) in that component. Use
`log Norm_(ν_k)(z)=dk·Σ_(k∣n)(log z)_n e^(nh)`:
its e^(kh) coefficient is dk·(log z)_k, hence (log z)_k=0 over ℚ.
Taking k=n kills every coefficient n≥2. The geometric leading-coefficient
identity kills n=1. If all components
are nonacyclic, use preservation of acyclicity under chain conjugation to prove
I₊=I₋=0 without cancelling zero torsion. Thus the event theorem is I₊=I₋ in
the whole total-quotient orbit space. Agreement
of only the linear coefficient is insufficient. Birth/death requires the explicit
entry/exit/gluing analysis and the geometric-series algebra of its return chains.

Use rt3 §3.4–3.5, Lemmas 3.5 and 3.7–3.10, pp. 227–231: Lemma 3.7, p. 229 gives x and a₁=±1, and Lemma 3.8(a)–(b), p. 230 gives y and b₁=(−1)^(i+1)a₁. The two quotient families and the split-homology case make the divisibility and cancellation conditions explicit.

The API includes:

- The coprime quotient family constructs the chain conjugator coefficient by coefficient.
- The second quotient family tests every logarithmic coefficient, including indices not coprime to the divisibility.
- Cancellation occurs only in a nonzero field component; entirely nonacyclic complexes give event equality 0=0.

**Checks.**

- For H=ℤ⊕ℤ/2 with §2.3's N(n,e)=−n and h=(−2,1), N(h)=2>0 and d=2. With k=3, μ(n,e)=n mod 3 sends h to 1; with k=2, ν(n,e)=−n mod 4 sends h to 2 and nh lies in its kernel exactly for even n. The class (2,1) has N=−2, so 1+Σa_n e^(n(2,1)) with infinitely many a_n≠0 has infinitely many terms below every cutoff and is not in Nov(ℤ,H,N).
- For i=1 and x=1+t, y=x gives x^(−1)y=1; for i=2, y=x⁻¹ gives xy=1. The leading coefficients have signs +a₁ and −a₁ respectively.
- For z=1+c₂t²+O(t³), d=2 and k=2, the degree-two logarithmic norm coefficient is 4c₂; vanishing forces c₂=0 over ℚ.
- The conjugation d₊=A_p(x)⁻¹d₋A_p(x) multiplies based torsion by det(A_p(x))^((−1)^i)=x^((−1)^i), so τ₊ζ₊=τ₋ζ₋ is equivalent to y=x^((−1)^(i+1)).

*Needs:* §6.1; §4.4 component norms; Layer 2 parameterized orientations; Layer 1 nonzerodivisors of one-variable series.

### 6.3 Cutoff limits and topological equality

A generic compact parameter interval can contain infinitely many events: prove
finiteness/isolation at each fixed period cutoff, compatibility of successive
cutoffs and convergence in N4's componentwise total-quotient topology, with
fixed critical lifts or a fixed Euler-structure representative throughout.
Before applying N4's torsion continuity, construct the cutoff limits of
continuation maps and their homotopies to give chain homotopy equivalences
from each one-sided event-limit complex to a neighbouring regular complex.
This proves the acyclic component set is preserved, including at the limits.
Do not assume a
finite event list globally.

Prove topological equality first in the exact triangulation-adapted case, then
apply N3's large-gradient comparison and N6's invariance to α+C df. Positive
rescaling preserves N1's completion. Keep the torsion of the comparison map
visible; an arbitrary quasi-isomorphism cannot substitute for the based calculation.

Use rt3 Lemmas 2.7–2.9, pp. 220–221 and §4, Lemma 4.1 and the deduction of Theorem B, pp. 235–236; the exact case is classical (rt3 Example 1.8, p. 215, citing Milnor's Whitehead torsion), and the triangulation-adapted route to it is only sketched there; based large-gradient comparison is part of the construction, not a consequence of an unbased quasi-isomorphism.

The API includes:

- Successive cutoff event calculations are compatible and converge with fixed lift/Euler data.
- Continuation limits preserve the acyclic component set before applying torsion continuity.
- The exact triangulation calculation and large-gradient comparison identify the invariant with cellular torsion.

**Checks.**

- Events with drops 1,2,3,… are infinite globally but only finitely many lie below any fixed C.
- For d=2+t^m, torsion differs from 1/2 first in degree m; fixed acyclicity permits the limit.
- For the scalar differential t^m→0 in the period topology, inverse torsion t^(−m) does not tend to 0; this limit cannot be used without the acyclicity comparison.
- A good time (rt3 Definition 2.6, p. 220) has one-sided limits of ζ and of the complex; a limit of bifurcations of bounded length is not good, and no limit is taken there.
- A comparison quasi-isomorphism that rescales one generator by 2 changes torsion by 2^(±1), so it cannot replace the based comparison.

*Needs:* §§6.1–6.2; §3.2 controlled continuation; §3.3 based cellular comparison; §4.3 torsion continuity.

### 6.4 Circle, mapping-torus and surgery calculations

Include these explicit calculations as theorems:

* S¹ with nonzero period, no critical points: CN=0, τNov=1,
  ζ=(1−t)⁻¹, and τcell=(1−t)⁻¹.
* A nonzero-period circle form perturbed to one maximum/minimum:
  for adjacent chosen lifts, d p̃=±(1−t)q̃; for arbitrary lifts include the
corresponding monomial unit factor. CN acyclic, τNov=(1−t)⁻¹ modulo signs and deck monomials, and ζ=1. The critical-free and
  two-critical-point flows have the same I, while their separate torsions differ.
* Exact α=df on S¹ with universal cyclic cover: N=0, coefficients ℤ[t,t⁻¹],
  d=±(1−t), H₀=ℤ with trivial deck action and H₁=0. Contrast both nonzero-period
  examples with ordinary H_*(S¹) tensored with the coefficient ring.
* Mapping torus of a diffeomorphism φ of a closed connected fiber S. Its topological space is
  `TauCeti.MappingTorus` of φ as a homeomorphism, with infinite cyclic cover S×ℝ
  (`TauCeti.MappingTorus.isAddQuotientCoveringMap_coverMap`) and deck generator
  `TauCeti.MappingTorus.deck`, (x,s)↦(φx,s+1). For α pulled back from the circle
  coordinate the height s is a primitive upstairs and that generator raises it by 1, so
  its period is 1 and the downward deck t, with N(t)=1, is its inverse; with a
  product metric the downward return map is φ, since (x,−1) and (φx,0) are identified.
  Its smooth model is the pinned `TauCeti.SmoothMappingTorus` of φ⁻¹, homeomorphic to
  this space by `TauCeti.SmoothMappingTorus.homeomorphMappingTorus`, and α is its time form
  `TauCeti.SmoothMappingTorus.timeForm`, closed and with value 1 on the generator
  `TauCeti.SmoothMappingTorus.timeVectorField` of the suspension flow
  `TauCeti.SmoothMappingTorus.flow`, whose time-one map returns each fibre by φ⁻¹. For a
  metric in which that generator is the dual field of α, the flow of −α♯ is the reversed
  suspension flow, and its closed orbits are the pinned
  `TauCeti.SmoothMappingTorus.closedOrbit` through the periodic points of φ
  (`TauCeti.SmoothMappingTorus.isFixedPt_flow_mk_iff`), traversed downward. Build that
  metric, the deck classes of these orbits and their return-map signs.
  Build its based equivariant cellular cone `1−tφ#`, which torsion needs; the unbased
  statement on singular chains is pinned, as the short exact sequence
  `TauCeti.MappingTorus.cyclicCoverShortComplex_shortExact` of the infinite cyclic cover with
  first map 1−τ_* and the Wang cone `TauCeti.MappingTorus.wangMappingCone` with its map
  `TauCeti.MappingTorus.wangMappingConeMap` to the chains of the mapping torus. Prove Lefschetz signed fixed-point counts for every
  iterate with nondegenerate fixed points and the trace/determinant identity
  `ζ=Πi det(1−tφ*|H_i(S;ℚ))^((-1)^(i+1))`.
  Here the orbit-counting ζ requires all iterates nondegenerate. For arbitrary
  monodromy define the homological zeta by its Lefschetz-number exponential;
  the same determinant formula holds, without interpreting a degenerate fixed
  set as a sum of determinant signs. Construct the Lefschetz fixed-point formula here by simplicial approximation
  on a smooth triangulation and Hopf's barycentric modification
  (Hopf, Math. Z. 29 (1929), 493–524), the Hopf trace lemma and N5's continuous local fixed-point index, valid also for nonorientable
  S. Choose a finite smooth triangulation K, a pinned `TauCeti.IsSmoothTriangulation`,
  whose barycentric subdivisions are again smooth triangulations by
  `TauCeti.IsSmoothTriangulation.barycentricSubdivisionRealizationHomeomorph_trans`. Its
  local PL charts on open stars are the pinned
  `PreAbstractSimplicialComplex.IsCombinatorialSphere.exists_openPartialHomeomorph_openStar_isPL`,
  and its PL structure is
  `AbstractSimplicialComplex.exists_chartedSpace_hasGroupoid_of_isCombinatorialSphere_link`,
  once every vertex link is a combinatorial sphere; the existence of K and that link-sphere
  property are GT11's smooth
  triangulation comparison. Choose a simplicial approximation
  `a:sd^r K→K` of φ, which exists on a sufficiently fine barycentric subdivision
  (Hatcher §2.C, Theorem 2C.1, p. 177), and its homotopic Hopf modification ψ. Define the finite
  chain endomorphism `T_q=a_#,q∘Sd^r_q:C_q(K;ℚ)→C_q(K;ℚ)`.
  Prove ψ has isolated fixed points and, for each q-simplex σ, its total
  interior fixed-point index is `(−1)^q (T_q)_(σ,σ)`.
  Compute the unit local contribution as `(−1)^q ε`, where ε is the oriented
  local degree (expansion along the simplex and transverse contraction).
  Include the reflected 1-simplex: ε=−1 gives index +1. Thus prove
  `Σ index(ψ)=Σ_q (−1)^q tr(T_q)` before applying the Hopf trace lemma.
  Build the finite-triangulation chain adapter here. For each finite simplicial
  complex K with linearly ordered vertices and commutative coefficient ring R,
  construct the native `ChainComplex (ModuleCat R) ℕ` free on the q-simplices, with
  basis orientations fixed by the vertex order and orientation reversal acting by −1,
  with the alternating face differential, basis equations, scalar extension and its
  extension by zero to `ChainComplex (ModuleCat R) ℤ`; for commutative R, scalar
  extension of the extended complex, with its simplices numbered by `Fin`, is the pinned
  `HomologicalComplex.matrixBaseChange`. Consume GT11's chosen simplex-cell CW structure
  on |K|, the pinned `AbstractSimplicialComplex.realizationCWComplex` with characteristic
  maps ordered by the vertex order, and its signed simplicial/cellular boundary
  identification. Prove this native chain adapter agrees with that structure and
  AT4.2's cellular complex and chain maps, and compose with AT4.3's cellular/singular
  comparison to obtain the isomorphism of its homology with the singular homology of |K|.
  Prove independence of vertex
  ordering via the orientation-change chain isomorphism, and functoriality
  for simplicial maps f. The realization |f| is cellular for these simplex-cell
  structures (`PreAbstractSimplicialComplex.SimplicialMap.isCellular_realizationMap`),
  and its cellular chain map `TauCeti.cellularChainComplexMap` sends the basis vector of
  a cell on which f is increasing to that of the image cell
  (`TauCeti.cellularChainGroupMap_realization_cellularChainBasis`). Identify that
  cellular chain map with f_#, with degree zero on degenerate images and
  the orientation sign otherwise. The naturality of the cellular/singular comparison,
  `TauCeti.cellularSingularHomologyIsoOfCWComplex_hom_naturality`, then identifies
  f_# with |f|_*, without claiming a strict cellular-to-singular chain map.
  Construct the canonical affine homeomorphism `b_r:|sd^r K|≃ₜ|K|`, affine on simplices
  and mapping each subdivision vertex to its barycenter, as the r-fold composite of the
  one-step homeomorphism of realizations for the barycentric subdivision
  `TauCeti.PreAbstractSimplicialComplex.barycentricSubdivision`. Use b_r to identify the realizations
  when choosing a as an approximation of φ. Construct simplicial subdivision,
  the last-vertex chain inverse `λ_r#` and both
  composite-to-identity homotopies. Build the finite acyclic-carrier homotopy
  lemma using augmented simplex cone contractions to supply those homotopies, from
  the pinned cone operator `TauCeti.OrderedSimplicialChain.cone` and its boundary
  identities on chains of faces below the cone vertex
  (`TauCeti.OrderedSimplicialChain.boundary_cone_zero`,
  `TauCeti.OrderedSimplicialChain.boundary_cone_succ`).
  Define `λ_r:sd^r K→K` by composing one-step last-vertex maps with fixed
  vertex orders at every subdivision level, and prove it is a simplicial approximation
  of b_r: their images lie in a common original simplex, so straight-line
  interpolation within that simplex gives `|λ_r|≃b_r`. Under the homology
  comparisons, λ_r therefore induces `(b_r)_*`; the chain inverse identities
  force Sd^r to induce `(b_r)_*⁻¹`. Since `|a|≃φ∘b_r`, prove
  T induces φ_* on H_*(S;ℚ). This identifies the
  alternating homology trace with the Lefschetz number of φ.
  Use N5's chart-independent continuous index to compute ψ in its PL charts;
  compare with the smooth index through C⁰-small approximation preserving
  every isolating boundary. Prove global homotopy invariance of the total
  fixed-point index on compact S for continuous homotopies, by approximating
  them and their ends smoothly and applying the generic smooth homotopy's
  fixed-point one-manifold in S×[0,1]: its end signs `sgn det(1−df)` cancel
  without an orientation of S. Thus the PL ψ and smooth φ have the same total.
  Compare graph/diagonal intersection using the pinned orientation local system
  `TauCeti.localHomologySystem`
  in the oriented specialization. Reconcile
  the homology determinant with chain torsion and prove an equivariant version
  for a larger abelian cover under its actual support hypotheses.
* Zero-slope surgery X_K on an oriented knot in S³, using GT's Conway-normalized Δ_K. The
  exterior of a solid-torus neighbourhood of the knot is the pinned `TauCeti.knotExterior`
  and X_K is a `TauCeti.DehnFilling` of it, which exists along every slope by
  `TauCeti.IsSolidTorusNeighborhood.exists_dehnFilling`. The zero slope is the preferred
  longitude of `TauCeti.IsSolidTorusNeighborhood.preferredFramedBoundaryTorus`, which
  generates the kernel of the map from H₁ of the boundary torus to H₁ of the knot complement
  (`TauCeti.IsSolidTorusNeighborhood.ker_boundaryHomologyMap`), while the meridian generates
  H₁ of the complement (`TauCeti.IsSolidTorusNeighborhood.complementHomologyEquiv`); both
  hold in a Hausdorff ambient space whose reduced integral homology vanishes in degrees 1
  and 2, which for S³ are the pinned
  `TauCeti.isZero_reducedSingularHomologyFunctor_one_sphere_euclideanSpace_fin_four` and
  `TauCeti.isZero_reducedSingularHomologyFunctor_two_sphere_euclideanSpace_fin_four`.
  Construct H₁(X_K)=ℤ and the corresponding
  infinite cyclic cover. The Alexander module of the knot exterior, its Seifert and
  Fox presentations and Δ_K as its order are GeometricTopology §4.4's. Build here the
  based equivariant cellular complex of the infinite cyclic cover of the exterior
  from a finite CW model with chosen lifted cells, identify its first homology with
  §4.4's Alexander module compatibly with that presentation, and attach the lifted
  filling cells of the solid torus whose meridian is glued to the Seifert longitude.
  Prove
  `τcell(X̃_K)=Δ_K(t)/(1−t)^2 mod ±t^ℤ`.
  Thus the total dynamical invariant for every admissible integral-period form
  representing the generator has this value in the correctly directed completion.
  Verify the unknot, where X_K is S¹×S² by the pinned `TauCeti.unknotZeroDehnFilling`, and
  the right-handed trefoil, including t↦t⁻¹ and lift changes.

Use rt3 Examples 1.7–1.9, pp. 215–216 for the circle and mapping torus, and rt2 Example 1.4, p. 372 for zero surgery. In particular the circle is rt3 Example 1.7, p. 215; the mapping-torus zeta formula (1.6) and its determinant identity are rt3 Example 1.9, p. 215, and the equivariant version for a larger cover is p. 216. That example takes the Lefschetz theorem for the iterates as given, so it is constructed here. The zero-surgery torsion is also rt1 Example 1.9, p. 863, which credits it to Milnor and points to its Lemma 2.6 for a proof; rt3 §1.5, p. 214 records only the relation with the Alexander polynomial. The chain adapter of the mapping-torus item and §5.2's local index supply the comparisons.

The API includes:

- Mapping-torus chains are the equivariant cone of 1−tφ#, with downward monodromy fixed.
- The simplicial chain adapter, subdivision homotopies and homology comparison identify the native homology endomorphism.
- The based knot-surgery complex has first homology GeometricTopology §4.4's Alexander module, compatibly with its presentation, and adds the filling cells with the stated meridian/longitude normalization.

**Checks.**

- Circle reflection has fixed-point sum 1+1=2 and Lefschetz trace 1−(−1)=2; nontrivial rotation gives 0=1−1.
- For circle reflection monodromy, the homological mapping-torus zeta is (1+t)/(1−t); identity monodromy gives 1 for the torus. Both raw maps have degenerate iterates, so these values use the continuous-index extension, not an admissible raw orbit sum.
- The unknot has Δ=1 and surgery torsion (1−t)⁻². The Conway-normalized right-handed trefoil has Δ=t⁻¹−1+t, giving (t⁻¹−1+t)/(1−t)². Under t↦t⁻¹ the numerator is unchanged and (1−t⁻¹)²=t⁻²(1−t)², so the class changes only by a monomial.
- On the boundary of a triangle the simplicial chain adapter has H₀=R and H₁=R; reversing one edge's vertex order multiplies its basis element by −1. A simplicial map collapsing an edge sends it to 0, and one reversing an edge sends it to minus the image edge.
- For one subdivision of e=[v₀,v₁] with barycenter b, Sd(e)=[v₀,b]+[b,v₁]; the last-vertex map sends b to v₁, hence [v₀,b] to e and [b,v₁] to 0, so λ#∘Sd is the identity on chains.

*Needs:* §6.3; Layer 5 local index; AlgebraicTopology Stages 2–7; GeometricTopology Layers 4–5 (§4.4 for the Alexander module, its presentations and Δ_K) and 11; Tau Ceti `TauCeti.MappingTorus` with `TauCeti.MappingTorus.isAddQuotientCoveringMap_coverMap` and `TauCeti.MappingTorus.deck`, `TauCeti.SmoothMappingTorus` with `TauCeti.SmoothMappingTorus.homeomorphMappingTorus`, `TauCeti.SmoothMappingTorus.flow`, `TauCeti.SmoothMappingTorus.closedOrbit`, `TauCeti.SmoothMappingTorus.timeForm` and `TauCeti.SmoothMappingTorus.timeVectorField`, `TauCeti.MappingTorus.wangMappingCone` and `TauCeti.MappingTorus.cyclicCoverShortComplex_shortExact`, `TauCeti.IsSmoothTriangulation`, `PreAbstractSimplicialComplex.IsCombinatorialSphere.exists_openPartialHomeomorph_openStar_isPL`, `AbstractSimplicialComplex.exists_chartedSpace_hasGroupoid_of_isCombinatorialSphere_link`, `HomologicalComplex.matrixBaseChange`, `TauCeti.localHomologySystem`, `TauCeti.knotExterior`, `TauCeti.DehnFilling`, LowDimTopology/DehnSurgery/Existence.lean, SeifertFraming.lean and Unknot.lean, AlgebraicTopology/Singular/Sphere.lean, `AbstractSimplicialComplex.realizationCWComplex`, `PreAbstractSimplicialComplex.SimplicialMap.isCellular_realizationMap`, `TauCeti.cellularChainComplexMap`, `TauCeti.cellularChainGroupMap_realization_cellularChainBasis`, `TauCeti.cellularSingularHomologyIsoOfCWComplex_hom_naturality`, `TauCeti.PreAbstractSimplicialComplex.barycentricSubdivision`, and `TauCeti.OrderedSimplicialChain.cone` with `TauCeti.OrderedSimplicialChain.boundary_cone_zero` and `TauCeti.OrderedSimplicialChain.boundary_cone_succ`.
*In Tau Ceti:* for the finite-triangulation chain adapter, `TauCeti.orderedSimplicialChainComplex`,
`TauCeti.cellularChainComplexRealizationIso` and `TauCeti.orderedSimplicialHomologyIsoSingularHomology`;
for the subdivision homeomorphism, `AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph`.

### 6.5 Native Lefschetz signature

For a finite-dimensional smooth compact Hausdorff manifold M
modeled on a boundaryless model with corners I, and a smooth self-map f, assume
every fixed point is nondegenerate in the sense of Tau Ceti's
`TauCeti.IsNondegenerateFixedPt`: 1 is not an eigenvalue of df_x, which in finite
dimension says det(1−df_x)≠0. The fixed set is then finite by
`TauCeti.finite_fixedPoints_of_isNondegenerateFixedPt`. Prove
`lefschetz_fixed_point_formula`: the finite sum of the determinant signs equals
Σ(i=0,…,dim M)(−1)^i tr(f_*:H_i(M;ℚ)→H_i(M;ℚ)). Neither orientability,
connectedness nor nonemptiness is required, and second countability is not a
hypothesis: it follows from compactness. M and its model may lie in any universe.
Apply it to every positive iterate
whose fixed points are nondegenerate; the identity on a positive-dimensional
manifold is treated by §5.2's continuous index, not by dropping nondegeneracy.
Hatcher §2.C, Theorem 2C.3, p. 179 is the Lefschetz fixed-point theorem for retracts
of finite simplicial complexes (a fixed point exists when the Lefschetz number is
nonzero), and its proof, pp. 180–181, supplies the chain/homology trace argument, with the trace
formula on p. 181. The local-index form Σ ind=L(f) on compact metric ANRs, which
include compact manifolds (Granas, Bull. Soc. Math. France 100 (1972), Example 9.1(iv),
p. 221), is Granas, Theorem 10.1, p. 224, with the excision, additivity and
normalization properties (I), (II) and (VII) of §5, p. 214, and the Euclidean index of
§6, p. 215; §§5.2 and 6.4 construct the stronger local-index equality.

**Checks.**

- A point has fixed-point contribution 1 and H₀-trace 1; the empty manifold gives 0 on both sides.
- Circle reflection has two contributions +1,+1, hence 2=1−(−1); a nontrivial rotation has no contributions and 0=1−1.
- The squaring map z↦z² of S¹ fixes only 1, where df=2 and det(1−2)=−1; the right side is 1−2=−1.
- A rotation of S² by an angle θ∉{0,π} descends to ℝP² with one fixed point, where det(1−R_θ)=2−2cos θ>0; ℝP² has rational homology ℚ in degree 0 only, so both sides are 1 on a nonorientable manifold.
- Translation on ℝ has no fixed points but H₀-trace 1; compactness excludes this false 0=1 test.

Define `fixedPointDet` f x as the determinant of 1−df_x, with df_x given by
`mfderiv` in the charts at x and f(x). At a fixed point these charts coincide, so
it is the determinant of 1−df_x as an endomorphism of T_xM, not of a map between
unconnected fibers. Define `fixedPointSign` as 1 when `fixedPointDet` is positive
and −1 otherwise. Their API includes:

- For a smooth f and a fixed point x, `fixedPointDet` is det(1−df_x) for the intrinsic derivative with the fixed-point target identification.
- For a smooth f on a manifold with a finite-dimensional model and a fixed point x, `fixedPointDet` I f x≠0 if and only if `TauCeti.IsNondegenerateFixedPt` I f x, since det(1−D)≠0 exactly when 1−D is injective in finite dimension.
- A chart change conjugates the matrix of df_x and preserves det(1−df_x); under the nondegeneracy hypothesis `fixedPointSign` is sgn det(1−df_x).
- At a fixed point of f, the derivative of an iterate is the corresponding power.

**Checks.**

- For f(x)=−x at 0 in ℝ, df_0=[−1], hence `fixedPointDet` is 2 and `fixedPointSign` is +1.
- For f(x)=2x, the determinant is −1; conjugating by x↦3x leaves it −1.
- On a zero-dimensional tangent space, the determinant is 1 even though the unique derivative is also the zero map; in positive dimension the identity gives determinant 0 and fails the hypothesis.
- On an infinite-dimensional model `LinearMap.det` is 1 for every endomorphism, so the identity would have `fixedPointDet` 1 although every tangent vector is fixed and the fixed point is not nondegenerate; the equivalence with `TauCeti.IsNondegenerateFixedPt` needs the finite-dimensional model.

Define `rationalHomologyMap` as the underlying linear map of Tau Ceti's
`TopPair.singularHomologyMap` on the pair (M,∅), with coefficient object
`ULift ℚ` in the universe of M, applied to a continuous self-map. Its API includes:

- Identity and composition agree with the functoriality of `TopPair.singularHomologyMap`.
- Homotopic self-maps induce equal maps, by the pinned `TopPair.Homotopy.congr_singularHomologyMap` for the induced homotopy of pairs.
- The finite-triangulation homology comparison intertwines this map with the simplicial chain map.

**Checks.**

- Circle reflection acts by 1 in degree 0 and −1 in degree 1, giving trace sum 2.
- A circle rotation acts by 1 in both degrees, giving trace sum 0.
- A map interchanging two points acts on H₀ by [[0,1],[1,0]], with trace 0; a constant map of the two points has trace 1, equal to its single fixed point count.

*Needs:* §6.4 finite-triangulation adapter and Hopf trace route; §5.2 local index;
Mathlib `mfderiv`, `LinearMap.det`, `LinearMap.trace` and `TopPair.incl`; Tau Ceti
`TopPair.singularHomologyMap`, `TopPair.Homotopy.congr_singularHomologyMap`,
`TauCeti.IsNondegenerateFixedPt` and
`TauCeti.finite_fixedPoints_of_isNondegenerateFixedPt`.

### Examples

The exact circle, critical-free nonexact circle and nonexact circle with a critical pair have the chain groups and torsions displayed in §6.4.

### Dependencies

N6 uses N1–N5 and the stated topology suppliers. Its unrefined comparison precedes N7; Euler-refined equality is a target of N7 only.

## Layer 7: Euler structures and coherent lift normalization

### 7.1 Euler chains and the vector-field index theorem

For χ(X)=0 define Euler chains using a nondegenerate vector field's signed zero
0-cycle: their boundary is that cycle, and two are equivalent modulo boundaries.
Construct nonemptiness from Euler=χ and H₀, the H₁(X;ℤ)-torsor action, and the
canonical comparison between different fields via the transverse zero locus of a
parameter family. Prove independence, identity and cocycle laws; no preferred
zero of this torsor is assumed. Build the combinatorial Euler-chain model from
oriented lifted cells, its subdivision transport and comparison with the smooth
model. The construction includes dimension 1 and nonorientable X. The local index
sgn det(dV_p) is independent of local orientation because domain and target
orientations change together; its signed zero-cycle is an ordinary integral
0-cycle and Euler chains are ordinary integral 1-chains. Use the positive dual
field V=α♯, whose Morse-zero sign is (−1)^ind(p), matching the alternating
cell weights. Construct the vector-field Poincaré–Hopf theorem here: compare
zero cycles through a transverse parameter cobordism with the gradient of a Morse function,
which exists by the pinned `TauCeti.exists_isMorse`, then use the pinned Euler equality
`TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_eq` and AT Stage 7 to
prove Σind(V,p)=χ(X). For the gradient
of a Morse function, compare the result with HeegaardFloer §1.9 (M.9)'s Morse
Euler/index proof.

Use rt3 Appendix B, p. 241 and Turaev 1990 for Euler chains, Definition B.1, p. 241 for Euler-chain transport, Definitions B.3–B.4, pp. 241–242 for the combinatorial model, and Milnor, Topology from the Differentiable Viewpoint, §6, p. 35 for Poincaré–Hopf.

The API includes:

- Euler-chain classes form an H₁-torsor when X is connected and χ(X)=0.
- Parameterized zero loci give choice-independent identity and cocycle comparisons.
- The Poincaré–Hopf count is valid without orientability and without χ(X)=0; that extra condition is needed for Euler chains.

**Checks.**

- The nonsingular field on S¹ has empty zero cycle, so Euler-chain classes form H₁(S¹)=ℤ with the zero chain as the field-dependent origin.
- The height gradient on S² has two zeros with determinant signs +1,+1, so the sum is 2=χ(S²); the resulting zero cycle is not a boundary.
- For V=sin θ ∂θ on S¹, derivatives at 0 and π are 1 and −1, giving 0=χ(S¹); chart reversal conjugates these derivatives and preserves their signs.
- A Morse gradient on T² has signs +1,−1,−1,+1, summing to 0=χ(T²); on ℝP² a Morse function with three critical points gives +1−1+1=1=χ(ℝP²) without an orientation.
- At a maximum in dimension n, V=∇f has dV_p negative definite and sign (−1)^n=(−1)^ind; the negative gradient would give (−1)^(n−ind), which differs from the cell weight (−1)^ind in odd dimension.

*Needs:* AlgebraicTopology Stages 2, 6 and 7; Tau Ceti `TauCeti.exists_isMorse` and `TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_eq`; HeegaardFloer parameter transversality and §1.9 (M.9); DifferentialGeometry degree.

### 7.2 Determinant volumes and refined equality

Construct the Euler-structure normalization on the alternating determinant line,
using coherent critical/cell lifts when critical points/cells are present. The
normalization is a determinant **volume**, not only a literal ordered basis of an
empty chain module. In the zero-critical-point case CN=0 has determinant line
canonically Nov; a nonsingular field supplies its Euler structure ξ₀, the volume
at ξ₀ is 1, and the volume at ξ₀+h is e^(image h). This preserves the nontrivial
Euler-structure information even for the zero complex. Pin the action convention
`τ(ξ+h)=e^(image h)τ(ξ)` and prove its comparison with Euler-chain/lift changes.
Define refined τNov, τcell and I as H₁-equivariant maps from the Euler-structure
torsor to Q(Nov)/±1 with this action. Prove the refined equality and continuation,
birth/death and triangulation compatibility. A nonsingular positive dual field supplies its
particular Euler structure, even though trajectory counts use its negative flow; this choice normalizes the mapping-torus calculation.
Do not assert sign removal by a homology orientation for dynamical torsion without
building that separate sign comparison; the definite theorem here retains ±1.

Use rt3 Appendix B, Definitions B.3–B.4, pp. 241–242 and Theorem B, p. 215; the determinant-volume formulation retains the torsor action when the complex is zero. The normalization T_m(ξ₀)=1 for a nonsingular field is rt3 Example 1.9, p. 215; the refined I:E(X)→Q(Λ)/±1 is Definition 1.5, p. 214; rt3 states the refined equality as equation (1.5), p. 215, with a proof sketch, and Remark 4.3, p. 237 makes the sketch depend on a rigorous version of Example 1.8, so the refined equality is proved here; and Remark 1.6, p. 214 leaves sign removal by a homology orientation for the Morse-theoretic torsion open.

The API includes:

- An Euler structure determines a determinant volume, compatible with critical and cell lifts.
- Translation by h multiplies refined torsion by e^(image h), with only the sign ambiguity remaining.
- Refined equality is compatible with continuation, birth/death and triangulation transport.

**Checks.**

- For CN=0, the distinguished volume is 1 but the volume at ξ₀+h is e^h; literal bases of the zero module would give 1 in both cases and lose the action.
- For a degree-zero lift change by t, the volume and torsion both acquire t; for a degree-one change both acquire t⁻¹.
- On the critical-free circle, translating the Euler structure by its downward generator sends (1−t)⁻¹ to t(1−t)⁻¹, which differs modulo sign but agrees modulo deck ambiguity.

*Needs:* §7.1; Layers 3–4 based complexes and torsion; §6.3 unrefined comparison.

### 7.3 Native vector-field index signature

Define `zeroDet` V p as the determinant of the vertical derivative of V at p: the
derivative of the section x↦(x,V(x)) of the tangent bundle, read in the
tangent-bundle chart at (p,V(p)) and projected to the fiber by
`ContinuousLinearMap.snd`. Define `zeroSign` as 1 when `zeroDet` is positive and
−1 otherwise. Both have real bodies using `mfderiv` and `LinearMap.det`;
their geometric API assumes a smooth field on a boundaryless smooth manifold:

- The fiber component is the derivative at p of the coordinate expression of V in the chart at p.
- At a zero of V, another chart conjugates this derivative, by the pinned `TauCeti.mvfderiv_section_coordChange_of_eq_zero` and `TauCeti.sectionLinearization_eq_symmL_comp` once `zeroDet` is identified with the determinant of the pinned `TauCeti.sectionLinearization` of V; its determinant sign is intrinsic, and at a nondegenerate zero `zeroSign` is the local index sgn det(dV_p), the index of a nondegenerate zero in Milnor, Topology from the Differentiable Viewpoint, §6.
- For a Morse gradient the determinant sign is (−1)^index, agreeing with the signed zero cycle of §7.1.

**Checks.**

- V(x)=x and V(x)=−x on ℝ have derivatives 1 and −1 at their zeros, giving indices +1 and −1.
- For V(x)=x² the derivative is 0 at 0, so nondegeneracy fails despite isolation of the zero.
- For V(x,y)=(−x,y), the derivative has determinant −1; conjugation by (x,y)↦(−x,y) preserves −1. A model that reverses the sign under orientation reversal is excluded.

Define `rationalBetti` M i as the dimension over ℚ of the rational singular
homology of the pair (M,∅) in degree i, with coefficient object `ULift ℚ` in the
universe of M; its alternating sum over degrees 0 to dim M is χ(M)
(AlgebraicTopology Stage 7). Since `Module.finrank` is 0 on an infinite-dimensional
space, `rationalBetti` is the actual dimension only where the homology is
finite-dimensional, which the first bullet proves for compact manifolds. Its API includes:

- For a compact Hausdorff manifold M, every H_i(M;ℚ) is finite-dimensional: a compact manifold is a compact Euclidean neighbourhood retract and so has finitely generated integral homology (Hatcher, Corollaries A.8–A.9, p. 527), and H_i(M;ℚ)=H_i(M;ℤ)⊗ℚ. When M is smooth with a boundaryless finite-dimensional model, as in `poincare_hopf`, M has a Morse function by the pinned `TauCeti.exists_isMorse`, and `TauCeti.IsMorse.finite_singularHomology` over the division ring `ULift ℚ`, after `TopPair.singularHomologyInclIso`, gives the finiteness.
- For a compact Hausdorff n-manifold M, `rationalBetti` M i=0 for every i>n (Hatcher, Lemma 3.27(b), p. 236, with A=M). When M is smooth with a boundaryless finite-dimensional model, the pinned `TauCeti.IsMorse.finrank_singularHomology_le` bounds it by the number of critical points of index i of a Morse function, which is 0 by `TauCeti.criticalCount_eq_zero_of_finrank_lt`.
- Homotopy equivalent spaces have the same `rationalBetti` in every degree, by the pinned `ContinuousMap.HomotopyEquiv.singularHomologyIso` and the natural isomorphism `TopPair.singularHomologyInclIso` between the homology of (M,∅) and that of M.
- When M has finite CW type, the alternating sum of `rationalBetti` M i over all degrees is `TauCeti.eulerChar` M, by `TauCeti.eulerChar_eq_finsum_finrank_singularHomology` over the division ring `ULift ℚ` after `TopPair.singularHomologyInclIso`. No pinned instance gives finite CW type to a compact manifold, so `poincare_hopf` states the alternating sum itself.

**Checks.**

- A point has `rationalBetti` 1 in degree 0 and 0 above; two points have 2 in degree 0.
- The circle has (1,1), with alternating sum 0=χ(S¹); a definition through reduced homology would give (0,1) and sum −1.
- ℝP² has (1,0,0), with alternating sum 1; 𝔽₂ coefficients would give (1,1,1), so the coefficient field is part of the definition even though the alternating sum agrees.
- An infinite discrete space has infinite-dimensional H₀, on which `Module.finrank` is 0; the finiteness bullet needs compactness.

Prove `poincare_hopf` for every smooth vector field V on a finite-dimensional
compact Hausdorff smooth manifold M with a boundaryless model I, in any universe:
if `zeroDet` I V x≠0 at every zero, then
Σ(V(x)=0) `zeroSign` I V x=Σ(i=0,…,dim M)(−1)^i `rationalBetti` M i.
The sum is finite by compactness and nondegeneracy. No connectedness,
orientation, second countability or χ(M)=0 is assumed; second countability
follows from compactness
(Milnor, Topology from the Differentiable Viewpoint, §6, Poincaré–Hopf theorem, p. 35).

**Checks.**

- The empty manifold gives 0=0; a zero-dimensional manifold of two points has two determinant-one zeros and H₀-dimension 2, hence 2=2.
- V=sin θ ∂θ on S¹ gives +1−1=0=1−1; the constant nonzero field has no zeros and the same sum 0.
- A height gradient on S² has signs +1,+1, giving 2=1+1; on the noncompact line the constant nonzero field would give 0≠1, so compactness cannot disappear from the signature.

*Needs:* §7.1 zero-locus comparison and Morse/Euler route; Mathlib tangent bundles,
`mfderiv`, `ContinuousLinearMap.snd`, `LinearMap.det`, `Module.finrank` and
`TopPair.incl`; Tau Ceti `TopPair.singularHomology`, `TopPair.singularHomologyInclIso`,
`TauCeti.eulerChar_eq_finsum_finrank_singularHomology`, `TauCeti.exists_isMorse`,
`TauCeti.IsMorse.finite_singularHomology`, `TauCeti.IsMorse.finrank_singularHomology_le`,
`TauCeti.criticalCount_eq_zero_of_finrank_lt`,
`ContinuousMap.HomotopyEquiv.singularHomologyIso` and
Geometry/Manifold/VectorBundle/Section/Linearization.lean.

### Examples

Dimension one and the zero-critical-point complex test Euler refinement independently of a nonempty chain basis.

### Dependencies

N7 first constructs the Euler torsor from index theory and ordinary homology, then uses N3–N6 for the refined dynamical/cellular comparison.

## Downstream consumers

DGFloer §7.C and §7.T consume the general completion and period-controlled complexes,
and §7.T also N4's based torsion over total quotient rings for its Floer–Novikov torsion;
TaubesGromov consumes N1 for H=H₁(Y;ℤ) with a noninjective period map, and N4–N6,
including §6.4's mapping-torus trace/local-index theorem, for its orbit expansions;
HamiltonianFloerOperations consumes N1's completion and continuous coefficient maps;
FukayaTheory's coefficient contracts and GromovWittenTheory's Novikov layer consume
N1. AlgebraicTopologyPartII §13.3 and the MorseNovikov supplier contract of
K3SurfacesAndSymplecticBoundedness consume N6's Lefschetz comparison. These consumers do not supply prerequisites here.

## Worked examples

Acceptance requires all three circle chain calculations, an irrational-period
noninjective-kernel completion example with finite tied leading coefficients,
a deck group with finite torsion and partially acyclic total-quotient components,
return-map iterate signs in both dimension parities (the three circle calculations supply odd dimension): an attracting and a
repelling orbit on a surface, and the orientation-reversing circle mapping
torus (Klein bottle) with homological ζ=(1+t)/(1−t). Check period doubling algebraically
by (1+x)/(1−x²)=1/(1−x), and the algebraic cyclic-cover norm/self-slide identities for
H=ℤ⊕ℤ/2 and h=(−2,1), using divisibility 2 in H/T. For the
irrational noninjective example fix H=ℤ³ and N(a,b,c)=a+√2b,
with coefficient ring ℤ and kernel generated by (0,0,1); verify finite tied
leading supports and an infinite series whose periods escape each cutoff, as in
Layer 1's Examples.
For partial acyclicity use the algebraic two-term complex over H=ℤ/2,
N=0, differential 1−g from degree 1 to degree 0: its two rational components have differential 0 and 2,
so its torsion components are 0 and 1/2. This is explicitly an algebraic
acceptance example, not an asserted geometric fibred example. Include the mapping-
torus Lefschetz/determinant comparison and the two knot-surgery examples. Every
coefficient, lift, orientation and monodromy change is checked by its naturality
formula. Suggested.lean states `lefschetz_fixed_point_formula` and `poincare_hopf`,
universe-polymorphic, on Mathlib's manifold carriers and Tau Ceti's singular homology
of the pair (M,∅). Its supporting definitions are `fixedPointDet`, `fixedPointSign`,
`rationalHomologyMap`, `zeroDet`, `zeroSign` and `rationalBetti`;
all other constructions and API targets are specified in this README.
*In Tau Ceti:* for the irrational noninjective example, `TauCeti.NovikovSeries.IrrationalExample.series`,
`TauCeti.NovikovSeries.IrrationalExample.leadingTerm_series` and
`TauCeti.NovikovSeries.IrrationalExample.eventually_period_ge`.

## Scope and ownership

This roadmap develops the existing Morse–Novikov library: arbitrary abelian
period-controlled completions, closed-one-form trajectory complexes, based torsion,
periodic-orbit zeta functions, dynamical/cellular torsion equality and Euler refinement.
It owns the local fixed-point index, the Lefschetz formula and vector-field
Poincaré–Hopf theorem used in those comparisons. The algebra admits all commutative
coefficient rings; geometric torsion uses integral coefficients and characteristic-zero
field components. The period map may have a kernel or dense image.

MorseTheory M1–M4 and M6 own ordinary critical-point theory and compact-band Morse
topology. HeegaardFloer Lane M owns ordinary Morse moduli and continuation; §2.8
(F0.6) owns generic return germs, section transitions and derivative conjugacy.
Layer 5 applies those germs to −α♯ and develops their index and zeta invariants.
DifferentialGeometry Layers 0–3, 5–6, 8, 10 and 12 own forms, flows, integration,
period comparison, degree and metrics. AlgebraicTopology Stages 1–7 and
GeometricTopology Layers 1, 3–5 and 11 own the topological and smooth suppliers
specified below. Their generic constructions are consumed, not rebuilt.

The pinned libraries supply group algebras, localization, singular homology,
manifold derivatives, Morse indices and local flow APIs. The pinned Tau Ceti also
supplies, as the supplier contracts below specify: the degree-one Hurewicz isomorphism
and the classification of pointed connected covers by subgroups of π₁, with the deck
group of a normal subgroup (§2.2); the Morse lemma, the stable and unstable sets of a
flow and connecting orbits (§§2.1 and 2.4); smooth structures pulled back along local
homeomorphisms and on free quotients, the smooth mapping torus with its suspension flow,
closed orbits and time form, and the covering space of local primitives of a closed
one-form (§§2.2–2.3 and 6.4); locally finite singular chains with their subdivision, the
cellular/singular comparison and the coordinate base change of a based complex (§3.3);
determinant lines of modules with their short-exact isomorphism, residue-field
decompositions of finite abelian group algebras, total quotients of finite free
extensions, the field criterion and the order of Novikov series, and the period estimate
for determinants (§§4.1–4.3); the weak and strong Morse inequalities of a complex of
vector spaces (§4.6); hitting times of transverse sections, the flow of a complete field,
the degree at a regular value and the local homology system (§§5.1–5.2); the mapping
torus of a homeomorphism with its infinite cyclic cover and singular Wang cone, the cone
operator of ordered simplicial chains, the simplex-cell structure of a realization with
the cellular chain maps of simplicial maps, barycentric subdivision, smooth
triangulations, PL charts on stars with spherical links, knot exteriors and Dehn fillings
(§6.4); nondegenerate fixed points with their finiteness and the homotopy invariance of
singular homology (§6.5); and Morse functions on compact manifolds with their Morse
inequalities and the linearization of a section at a zero (§§7.1–7.3). The completed
ring and its orbit modules, Morse closed one-forms and their periods, the cutoff moduli,
the Novikov complex of a closed one-form and its comparisons, based Novikov torsion with
its determinant lines, the total quotients with their field components and topology,
the cover norms, closed orbits with their multiplicities, the orbit zeta series, the
local fixed-point index, the dynamical/cellular equality and the Euler torsor are
constructions of this roadmap; where the pinned Tau Ceti realises one of its items, the
item above names the declarations on its *In Tau Ceti:* line. No Floer complex, spectral
sequence, nonabelian torsion, analytic Ray–Singer torsion or gauge invariant is an input.

Existing work includes [Dongryul Kim's Novikov-series development](https://github.com/dongryul-kim/lean4-novikov),
with its coefficient/support carrier in Novikov/Series/Basic.lean (revision
d5e705bd46bca9cb1622a260425388500d7697c2, coefficient and support definitions).
It treats real additive-submonoid exponents and, in several variables,
finiteness for every positive weight vector. N1 instead permits an arbitrary
abelian exponent group with a specified, possibly noninjective period map. For
injective N, construct the coefficient-preserving comparison with the one-variable
carrier on the image of N, including convolution and the period topology: it is §1.2's
reindexing along H≅N(H), `TauCeti.NovikovSeries.continuousDomCongr`. For noninjective N,
retain the finite ties in each period fiber and compare through the kernel splitting of
§1.4, `TauCeti.NovikovSeries.hahnSeriesEquiv`. This general construction and its
comparison are independent of the descent theorem in that project.
Coordinate with its authors before code integration and follow the repository's
licensing and reuse requirements for any copying or adaptation.

## Exact supplier contracts

### From Mathlib

Consume `AddMonoidAlgebra` and `Finsupp` for finite coefficients,
`HahnSeries` (RingTheory/HahnSeries/Basic.lean) and `LaurentSeries`
(RingTheory/LaurentSeries.lean) for ordered series. Hahn support is partially
well-ordered; this does not imply finiteness below each real threshold.
Use `Localization (nonZeroDivisors R)` for total quotients, and
`ChainComplex (ModuleCat R) ℤ` with native homology and homotopies.
Use `IsAddQuotientCoveringMap` (Topology/Covering/Quotient.lean) for orbit fibers
and disjoint translates; it does not include connectedness or nonemptiness.
Use `mfderiv`, `TangentSpace`, `TangentBundle`, `ContinuousLinearMap.snd`,
`LinearMap.det` and `Function.fixedPoints` for the two headline statements.
`mfderiv` reads df_x in the charts at x and f(x), which coincide at a fixed point;
the vertical derivative of a vector field at a zero is the fiber component, under
`ContinuousLinearMap.snd`, of the derivative of its section into the tangent bundle.
Use `TopPair.incl` (Topology/Category/TopPair.lean) to regard M as the pair (M,∅),
`Module.finrank`, and `LinearMap.trace`
(LinearAlgebra/Trace.lean). Trace is defined to be zero without a finite basis;
the closed-manifold theorem takes finite-dimensionality and vanishing above
the manifold dimension from the pinned Morse inequalities cited under From Tau Ceti.

### From Tau Ceti

The declarations of the pinned Tau Ceti that realise this roadmap's own items are named on
the *In Tau Ceti:* lines of the layers above; the contracts below are those it consumes.

Consume `IsManifoldNondegenerateCriticalPoint` and `manifoldMorseIndex`
(Geometry/Manifold/Morse/Basic.lean and Index.lean), `MorseChart`
(Geometry/Manifold/Morse/Lemma.lean), and `MorseChart.field`
(Geometry/Manifold/Morse/PseudoGradient/Existence.lean), with quadratic potential
normalized by 1/2. Consume `Riemannian.Tensor.rieszDual` and
`Riemannian.Tensor.inner_rieszDual`
(Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean), with their finite-dimensional
fiber hypotheses, and `exists_contMDiffAt_localFlow`
(Geometry/Manifold/IntegralCurve/SmoothFlow.lean), with its boundaryless and
finite-dimensional hypotheses. Global completeness in the compact application
is `TauCeti.isCompleteVectorField_of_compactSpace`
(Geometry/Manifold/Flow/Complete.lean), for C¹ fields on a compact boundaryless
manifold. Consume `TauCeti.IsNondegenerateFixedPt` and
`TauCeti.finite_fixedPoints_of_isNondegenerateFixedPt`
(Geometry/Manifold/MFDeriv/FixedPoint.lean), for a finite-dimensional model over a
complete field and a compact Hausdorff manifold: the first is §6.5's nondegeneracy
hypothesis (1 is not an eigenvalue of df_x), the second the finiteness of its fixed set.
Consume `TopPair.singularHomology` and `TopPair.singularHomologyMap`
(AlgebraicTopology/Singular/Relative.lean) for rational singular homology and its
induced maps; absolute homology of M is that of the pair (M,∅), by the natural
isomorphism `TopPair.singularHomologyInclIso` (AlgebraicTopology/Singular/Empty.lean).
For a space of finite CW type, `TauCeti.eulerChar_eq_finsum_finrank_singularHomology`
(AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean) compares §7.3's
alternating Betti sum with `TauCeti.eulerChar`.
Consume `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`
(AlgebraicTopology/Homotopy/Hurewicz/One/Basic.lean), the degree-one Hurewicz
isomorphism from the abelianization of π₁(X,x) to the first integral singular homology
of a path-connected space X, and its naturality in continuous maps,
`TauCeti.HurewiczOne.homologyMap_hurewiczHomologyAddEquiv`
(AlgebraicTopology/Homotopy/Hurewicz/One/Naturality.lean).
The vector-space `stableSet_eq_biUnion_orbit_localInvariantSet_Ici`
(Analysis/Calculus/Morse/LocalToGlobal.lean) retains its Lipschitz and convergence
hypotheses. The Banach-domain `isMeagre_image_criticalPoints_of_isFredholm`
(Analysis/Fredholm/SardSmale.lean) retains its separability and stated regularity
bound; HeegaardFloer F0 supplies the manifold/parameter adapters.

From RingTheory/NovikovSeries consume, beside the declarations named in Layers 1, 4 and 5,
the field criterion `TauCeti.NovikovSeries.isField_iff`, that Nov is a field exactly when R
is a field and N is injective (Field.lean), and from RingTheory/Localization/Reduced.lean
the reducedness `IsLocalization.isReduced` of every localization of a reduced ring.

For §3.3 consume the cellular differential `TauCeti.cellularDifferential`
(AlgebraicTopology/Cellular/Chains.lean) and the cellular/singular comparison
`TauCeti.cellularSingularHomologyIso` (AlgebraicTopology/Cellular/Comparison.lean), and
Mathlib's `IsAddQuotientCoveringMap.toMultiplicative`, through which the additive deck group
H acts as `Multiplicative H` on the cellular chains.

For §2.2's covers of a path-connected, locally path-connected and semilocally simply
connected space, as a connected manifold is, consume
`TauCeti.UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient`
(AlgebraicTopology/UniversalCover/Classification/Bijection.lean): a pointed connected cover is
isomorphic over the base to the quotient of the universal cover by exactly one subgroup of
π₁(X,x₀); and `TauCeti.UniversalCover.deckSubgroupQuotientProjEquivOfNormal`
(Classification/DeckGroup.lean): for a normal subgroup the deck group of that quotient is
π₁(X,x₀) modulo the subgroup. For §4.1's determinant lines consume `TauCeti.detLine`, the top
exterior power of a module over a commutative ring, with `LinearEquiv.detLineCongr` for
isomorphisms (LinearAlgebra/Determinant/Line.lean), and, for a short exact sequence
0→U→V→W→0 of finite-dimensional vector spaces, the isomorphism
`TauCeti.exteriorPower.shortExactEquiv` from the tensor product of the top exterior powers of
U and W, with the subspace factor first, to that of V, independent of the lifts chosen
(LinearAlgebra/ExteriorPower/ShortExact.lean). For §4.6 consume, for a complex of vector
spaces over a division ring, the weak inequality `HomologicalComplex.finrank_homology_le_finrank_X`
that a homology group has dimension at most that of its finite-dimensional term
(Algebra/Homology/ModuleCat/Finrank.lean); for an ℕ-indexed chain complex with
finite-dimensional terms through degree n, the strong inequality
`ChainComplex.sum_range_neg_one_pow_mul_finrank_homology_le`, with signs (−1)^(n−i)
(Algebra/Homology/EulerCharacteristic/MorseInequalities.lean), and, when the differential
from degree n+1 to degree n vanishes, the equality of alternating sums with signs (−1)^i
`ChainComplex.sum_range_finrank_X_eq_sum_range_finrank_homology`
(Algebra/Homology/EulerCharacteristic/ChainComplex.lean).

For §6.4's mapping torus consume, for a homeomorphism φ of a space F, `TauCeti.MappingTorus`
(Topology/MappingTorus/Basic.lean), the quotient of F×ℝ by n·(x,s)=(φⁿx,s+n);
`TauCeti.MappingTorus.isAddQuotientCoveringMap_coverMap`, that F×ℝ is a quotient covering of it
for this ℤ-action; and the deck generator `TauCeti.MappingTorus.deck`, (x,s)↦(φx,s+1), the
action of 1 (Topology/MappingTorus/Covering.lean). For §6.4's finite-triangulation adapter
consume, for an abstract simplicial complex K with linearly ordered vertices: the cone
operator `TauCeti.OrderedSimplicialChain.cone` of ordered simplicial chains at a vertex v, which sends a face whose vertices all
lie below v and which spans a face together with v to that larger face, and every other
face to 0, with the cone identities
`TauCeti.OrderedSimplicialChain.boundary_cone_zero` and
`TauCeti.OrderedSimplicialChain.boundary_cone_succ` on chains of such faces
(SimplicialComplex/Acyclic.lean); the simplex-cell CW structure
`AbstractSimplicialComplex.realizationCWComplex` on the realization |K|, with characteristic
maps ordered by the vertex order (SimplicialComplex/Realization/CWComplex/Basic.lean); the cellularity
`PreAbstractSimplicialComplex.SimplicialMap.isCellular_realizationMap` of a realized simplicial
map (Realization/CWComplex/Map.lean), its cellular chain map `TauCeti.cellularChainComplexMap`
(AlgebraicTopology/Cellular/Map.lean), the value of that map on the basis vector of a cell on
which the simplicial map is increasing,
`TauCeti.cellularChainGroupMap_realization_cellularChainBasis`
(Realization/CWComplex/AlternatingIncidence.lean), and the naturality of the cellular/singular
comparison under cellular maps,
`TauCeti.cellularSingularHomologyIsoOfCWComplex_hom_naturality`
(AlgebraicTopology/Cellular/Naturality.lean); and the barycentric subdivision
`TauCeti.PreAbstractSimplicialComplex.barycentricSubdivision`
(SimplicialComplex/Subdivision/Basic.lean). The ordered simplicial chains named in §6.4 do
not orient a face by a nonincreasing vertex order or compute the chain map of a simplicial
map on a face it collapses or reorders; §6.4 builds those.

For §2.1 consume the Morse lemma
`TauCeti.IsManifoldNondegenerateCriticalPoint.nonempty_morseChart`
(Geometry/Manifold/Morse/Lemma.lean), a Morse chart at a nondegenerate critical point of a
function smooth near it, on a manifold modelled on a finite-dimensional real vector space.
The stable and unstable sets of a point under a
flow are `Flow.stableSet` and `Flow.unstableSet` (Dynamics/Flow/Stable.lean). The smooth
manifold structure on stable sets,
`TauCeti.IsAdaptedPseudoGradient.exists_stableSet_isManifold`
(Geometry/Manifold/Morse/Stable/Manifold.lean), and the Morse–Smale condition
`TauCeti.IsAdaptedPseudoGradient.IsMorseSmale`
(Geometry/Manifold/Morse/Stable/Transversality.lean) are stated for a pseudo-gradient adapted
to a function on a compact Hausdorff manifold, so they apply to a closed one-form only when
it is exact.

For the smooth structures of Layer 2 consume the charted-space structure pulled back along a
local homeomorphism, `IsLocalHomeomorph.chartedSpaceComap`, with
`IsLocalHomeomorph.isManifold_chartedSpaceComap`, the criterion
`IsLocalHomeomorph.contMDiff_chartedSpaceComap_iff` that a map into the source is Cⁿ exactly
when it is continuous and its composite with the local homeomorphism is Cⁿ, and
`IsLocalHomeomorph.isLocalDiffeomorph_chartedSpaceComap`
(Geometry/Manifold/Instances/Comap.lean); and the manifold structure on the quotient by a
free properly discontinuous action by Cⁿ maps, `TauCeti.instIsManifoldQuotient`, with
`TauCeti.isLocalDiffeomorph_quotientMk` (Geometry/Manifold/Instances/Quotient.lean).
For a diffeomorphism φ of a locally compact Hausdorff manifold M consume the smooth mapping
torus `TauCeti.SmoothMappingTorus`, the quotient of ℝ×M by (t,x)∼(t+1,φ⁻¹x), with its
projection `TauCeti.SmoothMappingTorus.proj` to the circle; its suspension flow
`TauCeti.SmoothMappingTorus.flow`, [t,x]↦[t+s,x], whose time-one map returns each fibre by φ
(`TauCeti.SmoothMappingTorus.flow_one_mk`) and for which [t,x] is fixed by time s exactly
when s is an integer k with φᵏx=x (`TauCeti.SmoothMappingTorus.isFixedPt_flow_mk_iff`); and
the homeomorphism `TauCeti.SmoothMappingTorus.homeomorphMappingTorus` with
`TauCeti.MappingTorus` of the inverse homeomorphism
(Geometry/Manifold/Instances/MappingTorus.lean). Its closed orbit through a periodic point of
φ is `TauCeti.SmoothMappingTorus.closedOrbit`, translated by the flow
(`TauCeti.SmoothMappingTorus.flow_closedOrbit`) and injective exactly at the least period
(`TauCeti.SmoothMappingTorus.injective_closedOrbit_iff`,
Geometry/Manifold/Instances/MappingTorus/ClosedOrbit.lean). Its time form
`TauCeti.SmoothMappingTorus.timeForm`, the pullback along the projection of the circle's
`AddCircle.timeForm`, is closed (`TauCeti.SmoothMappingTorus.isClosed_timeForm`), integrates
to b−a along a flow line from time a to time b
(`TauCeti.SmoothMappingTorus.pathIntegral_timeForm_mk`,
Geometry/Manifold/DifferentialForm/MappingTorus.lean), and takes the value 1 on the generator
`TauCeti.SmoothMappingTorus.timeVectorField` of the suspension flow
(`TauCeti.SmoothMappingTorus.timeForm_timeVectorField`,
Geometry/Manifold/VectorField/MappingTorus.lean). On the circle consume `AddCircle.timeForm`
with `AddCircle.isClosed_timeForm` and `AddCircle.pathIntegral_timeForm_coe`, that its
integral along t↦[t] from a to b is b−a
(Geometry/Manifold/DifferentialForm/AddCircle.lean).

For the period-kernel cover of §2.3 consume the space of local primitives
`TauCeti.PrimitiveSpace` of a one-form, with the action of constants
`TauCeti.PrimitiveSpace.translate` and `TauCeti.PrimitiveSpace.value_translate`, and
`TauCeti.PrimitiveSpace.isCoveringMap_proj`, that its projection to the manifold is a
covering map when the form is closed and of class Cʳ, r≥1
(Geometry/Manifold/DifferentialForm/LocalPrimitive.lean); and
`TauCeti.PrimitiveSpace.value_monodromy` (Geometry/Manifold/DeRham/Period.lean), that the
monodromy of this covering along a path class adds the integral of the form along it.

For §2.4 consume the relation `Flow.connectingOrbitSetoid` of time translation on the set of
points connecting two given points, and
`Flow.orbit_injective_of_ne_of_mem_unstableSet_inter_stableSet`, that on a T₁ space the time
parameter of an orbit connecting distinct limits is free (Dynamics/Flow/ConnectingOrbit.lean);
the breaking statement
`Flow.exists_mem_closure_inter_unstableSet_of_mem_closure_inter_stableSet`
(Dynamics/Flow/Breaking.lean), that an invariant set disjoint from the stable set of x whose
closure meets that stable set has closure meeting the unstable set of x at distance exactly
r, for every radius r>0 with compact sphere and the forward and backward trapping
properties; and the energy identity `TauCeti.energy_maximalIntegralCurve_neg_mgradient`
(Geometry/Manifold/Morse/GradientFlow.lean), that along the maximal integral curve of the
negative gradient of a C² function the energy between two times is half the drop of the
function.

For §3.3 consume the coordinate base change `HomologicalComplex.matrixBaseChange` of a
ℤ-indexed chain complex of modules over a commutative ring with `Fin`-indexed bases of its
terms, along a homomorphism to a commutative ring, with its standard bases
`HomologicalComplex.matrixBaseChangeBasis` and the matrices of its differentials
`HomologicalComplex.toMatrix_matrixBaseChange_d`
(Algebra/Homology/ModuleCat/MatrixBaseChange.lean); and the locally finite singular chain
complex `TauCeti.LocalCoefficientSystem.locallyFiniteChainComplex` of a space with
coefficients in a local system, the extension
`TauCeti.LocalCoefficientSystem.extendLocallyFinite` of a properly supported map to locally
finite chains (AlgebraicTopology/Singular/Twisted/LocallyFinite/Basic.lean), its barycentric
subdivision `TauCeti.LocalCoefficientSystem.locallyFiniteSubdivisionChainMap` and the chain
homotopy `TauCeti.LocalCoefficientSystem.locallyFiniteSubdivisionHomotopy` of that
subdivision to the identity
(AlgebraicTopology/Singular/Twisted/LocallyFinite/Subdivision.lean).

For Layer 4 consume the determinant line `LinearMap.detLine` of a linear map f,
det(ker f)⊗det(coker f)*, with its trivialization `LinearMap.detLineEquivOfBijective` for
bijective f (LinearAlgebra/Determinant/Line.lean);
`TauCeti.NovikovSeries.exists_finiteIndex_isDomain`, a finite-index subgroup of a finitely
generated abelian group whose Novikov ring over a domain is a domain
(RingTheory/NovikovSeries/TotalQuotient.lean);
`IsFractionRing.isLocalization_algebraMapSubmonoid_iff`, that for S finite free over R a
ring is a total ring of fractions of S exactly when it is the localization of S at the
nonzerodivisors of R (RingTheory/Localization/FiniteFree.lean);
`AddMonoidAlgebra.algEquivPiField`, the group algebra of a finite abelian group over a field
in which its order is nonzero as the product of its residue fields at the maximal ideals,
and `AddMonoidAlgebra.isFractionRing_of_finite`, that K[M] is the total quotient of R[M] for
finite commutative M when K is the Artinian total quotient of R
(Algebra/MonoidAlgebra/TotalQuotient.lean); the order `TauCeti.NovikovSeries.order` of a
series, with `TauCeti.NovikovSeries.le_order_iff` and
`TauCeti.NovikovSeries.min_order_le_order_add` (RingTheory/NovikovSeries/Basic.lean), and
its additivity `TauCeti.NovikovSeries.order_mul` when the group ring has no zero divisors
(RingTheory/NovikovSeries/LeadingTerm.lean); and the determinant perturbation estimate
`Matrix.det_sub_det_mem_periodFiltration_of_weights` (RingTheory/NovikovSeries/Matrix.lean).

For Layer 5 consume the hitting time `TauCeti.flowHittingTime` of a transverse section for a
C¹ field and the regularity `TauCeti.contMDiffAt_flowOf_flowHittingTime` of the transition to
the section (Geometry/Manifold/Flow/HittingTime.lean); the maximal flow `TauCeti.flowOf` of a
vector field (Geometry/Manifold/Flow/Basic.lean) and the flow `TauCeti.globalFlow` of a
complete C¹ field (Geometry/Manifold/IntegralCurve/GlobalFlow.lean); the degree
`TauCeti.degreeAtRegularValue` of a map between oriented manifolds at a point, the signed
count of its preimages at a regular value with finite fibre
(Geometry/Manifold/Degree/Basic.lean); and the local homology system
`TauCeti.localHomologySystem`, a functor on the fundamental groupoid of a Hausdorff space
modelled on a finite-dimensional real normed space, which in top degree with integer
coefficients is the orientation local system
(AlgebraicTopology/Singular/LocalHomology/System.lean).

For §6.4 consume also smooth triangulations `TauCeti.IsSmoothTriangulation`
(Geometry/Manifold/SmoothTriangulation/Basic.lean), whose barycentric subdivisions are
smooth triangulations by
`TauCeti.IsSmoothTriangulation.barycentricSubdivisionRealizationHomeomorph_trans`
(Geometry/Manifold/SmoothTriangulation/Subdivision.lean); the PL chart on the open star of a
vertex whose link is a combinatorial sphere,
`PreAbstractSimplicialComplex.IsCombinatorialSphere.exists_openPartialHomeomorph_openStar_isPL`
(AlgebraicTopology/SimplicialComplex/Realization/Star/PL/Chart.lean), and the PL structure
`AbstractSimplicialComplex.exists_chartedSpace_hasGroupoid_of_isCombinatorialSphere_link` on
a realization all of whose vertex links are combinatorial spheres
(AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.lean); the singular Wang cone
`TauCeti.MappingTorus.wangMappingCone` of id−φ_* with its chain map
`TauCeti.MappingTorus.wangMappingConeMap` to the singular chains of the mapping torus
(AlgebraicTopology/Singular/MappingTorus/Basic.lean), and the short exact sequence
`TauCeti.MappingTorus.cyclicCoverShortComplex_shortExact` of singular chains
0→C(F×ℝ)→C(F×ℝ)→C(T_φ)→0 with first map 1−τ_*
(AlgebraicTopology/Singular/MappingTorus/CyclicCover.lean); and, for the surgery, the
exterior `TauCeti.knotExterior` of a solid-torus neighbourhood
(LowDimTopology/SolidTorusNeighborhood/Exterior.lean), Dehn fillings `TauCeti.DehnFilling`
(LowDimTopology/DehnSurgery/Filling.lean), which exist along every slope by
`TauCeti.IsSolidTorusNeighborhood.exists_dehnFilling`
(LowDimTopology/DehnSurgery/Existence.lean), the preferred framing
`TauCeti.IsSolidTorusNeighborhood.preferredFramedBoundaryTorus`, the isomorphism
`TauCeti.IsSolidTorusNeighborhood.complementHomologyEquiv` of the first integral homology of
the knot complement with ℤ sending the meridian to 1, for a Hausdorff ambient space whose
reduced integral homology vanishes in degrees 1 and 2, and
`TauCeti.IsSolidTorusNeighborhood.ker_boundaryHomologyMap`, that the preferred
longitude generates the classes of the boundary torus that are null-homologous in the
complement (LowDimTopology/DehnSurgery/SeifertFraming.lean), the two vanishing hypotheses for
the unit sphere of ℝ⁴,
`TauCeti.isZero_reducedSingularHomologyFunctor_one_sphere_euclideanSpace_fin_four` and
`TauCeti.isZero_reducedSingularHomologyFunctor_two_sphere_euclideanSpace_fin_four`
(AlgebraicTopology/Singular/Sphere.lean), and
`TauCeti.unknotZeroDehnFilling`, that zero surgery on the unknot is S¹×S²
(LowDimTopology/DehnSurgery/Unknot.lean).

For Layer 7 consume `TauCeti.exists_isMorse`, the existence of a Morse function on a compact
Hausdorff smooth manifold with finite-dimensional model
(Geometry/Manifold/Morse/Generic/Basic.lean), and, for a Morse function on such a manifold M
with boundaryless model and a finite-dimensional coefficient space over a division ring in
the universe of M: the finiteness `TauCeti.IsMorse.finite_singularHomology` of singular
homology, the weak inequality `TauCeti.IsMorse.finrank_singularHomology_le` and the Euler
equality `TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_eq` over the
degrees up to any n at least the dimension (Geometry/Manifold/Morse/Inequalities.lean), with
`TauCeti.criticalCount_eq_zero_of_finrank_lt`, that no critical point has index above the
dimension (Geometry/Manifold/Morse/CriticalPoints.lean). These concern the absolute singular
homology of M; §7.3 passes to the pair (M,∅) by `TopPair.singularHomologyInclIso` and to
ℚ-dimensions through the division ring `ULift ℚ`. Consume the homotopy invariance of
singular homology in the forms `ContinuousMap.HomotopyEquiv.singularHomologyIso` and, for
homotopic maps of pairs, `TopPair.Homotopy.congr_singularHomologyMap`
(AlgebraicTopology/Singular/Homotopy/Invariance.lean). For §7.3's chart independence consume
the linearization `TauCeti.sectionLinearization` of a section at a point, with
`TauCeti.mvfderiv_section_coordChange_of_eq_zero`, that at a zero the coordinate derivatives
in two trivializations differ by the fibre coordinate change, and
`TauCeti.sectionLinearization_eq_symmL_comp`, that at a zero the linearization can be
computed in any trivialization
(Geometry/Manifold/VectorBundle/Section/Linearization.lean).

### From TauCetiRoadmap.MorseTheory

Consume M1–M2 and M6: critical Hessians, indices and charts, finite compact-band
handles and CW models, and gradient convergence. Apply them to local
potentials; the closed-one-form period control is Layer 2's additional assertion.
§2.1 applies M1 to local potentials beyond the pinned Morse lemma, §2.4 uses M6's gradient
convergence and §3.3 takes its finite CW model from M2. The Morse inequalities and Euler
equality that Layer 7 uses are the pinned Tau Ceti theorems above.

### From TauCetiRoadmap.HeegaardFloer

Consume Lane M §§1.1–1.5: stable/unstable manifolds, the λ-lemma, broken ordinary
trajectories, coherent orientations, ordinary Morse/singular comparison and
continuation. Consume §1.5 (M.5) for the relative A₂ fold and signed elementary
chain change. Consume Lane F0 for Banach-manifold Fredholm/transversality and
§2.8 (F0.6) for C^k local return germs, k≥1, including reverse branches,
section conjugacy, all positive iterates and the normal-derivative comparison.
The latter uses a compact periodic orbit, not a complete flow or compact ambient
manifold. Layer 5's fixed-cohomology perturbations must preserve closedness.
Consume §1.9 (M.9)'s Morse Euler/index proof for §7.1's comparison with the
vector-field Poincaré–Hopf theorem.

### From TauCetiRoadmap.DifferentialGeometry

Consume Layers 0–1 for forms, exterior derivative, pullbacks and local primitives;
Layers 2–3 for orientations; Layers 5–6 and 8 for integration,
de Rham cohomology and the period comparison; Layer 10 for degree and relative
homotopies; Layer 12 for metrics and musical maps. The maximal flow of a vector field and
the flow of a complete field are the pinned `TauCeti.flowOf` and `TauCeti.globalFlow` above,
and the circle's angular form, its closedness and its integral 1 are the pinned
`AddCircle.timeForm` declarations above.

### From TauCetiRoadmap.AlgebraicTopology

Consume AlgebraicTopology Stages 1–3 for fundamental groups, relative singular
chains, subdivision and excision; Stage 4 items 2–3 (AT4.2–AT4.3) for cellular
chains and the cellular/singular comparison, natural on homology; Stages 5–7
for covers, local systems, products, orientation coefficients and Euler
characteristic. The natural identification H₁=π₁ᵃᵇ is the Tau Ceti Hurewicz
isomorphism above, and the classification of pointed connected covers by subgroups of
π₁(X,x₀), with the deck group of a normal subgroup, is the Tau Ceti classification above.
No strict cellular-to-singular chain map is assumed.

### From TauCetiRoadmap.GeometricTopology

Consume Layer 1 for collars and smooth gluing; Layer 3 for the C∞ family topology;
Layers 4–5 for the Conway-normalized Alexander polynomial,
and in particular §4.4 for the infinite cyclic cover of a knot
exterior, its Alexander module H₁(X∞;ℤ) over ℤ[t,t⁻¹], the Seifert presentation
`tV−Vᵀ`, the Fox presentation from a Wirtinger presentation, the agreement of these
routes up to units, and Δ_K as the order of the module; Layer 11 and the smoothing-and-triangulation comparison
for smooth triangulations. The simplex-cell CW structure of a realization, its signed
boundaries and the cellularity of simplicial maps are the Tau Ceti declarations above, as
are smooth triangulations with their subdivisions, the PL charts on stars with spherical
links, the knot exterior, its Dehn fillings and its preferred longitude.
Layer 6 above constructs the based equivariant
cellular complex of the surgery cover, its identification with §4.4's presentation,
and the finite simplicial chain adapter.

## References

* M. Hutchings and Y.-J. Lee, [Circle-valued Morse theory and Reidemeister torsion](https://math.berkeley.edu/~hutching/pub/rt2/rt2_published.pdf), Geometry & Topology 3 (1999), 369–396 (rt2): completed chains, orbit signs, product formula, topological torsion and Euler structures.
* M. Hutchings, [Reidemeister torsion in generalized Morse theory](https://math.berkeley.edu/~hutching/pub/rt3/rt3.pdf), Forum Mathematicum 14 (2002), 209–244 (rt3): arbitrary closed forms/abelian covers, cutoff bifurcations, finite cyclic covers and refined comparison.
* M. Hutchings and Y.-J. Lee, [Circle-valued Morse theory, Reidemeister torsion, and Seiberg–Witten invariants](https://math.berkeley.edu/~hutching/pub/rt1/rt1_published.pdf), Topology 38 (1999), 861–888 (rt1): original circle-valued calculations and context. Gauge-invariant comparisons belong to their gauge-theory supplier, rather than being assumed here.
* A. Hatcher, [Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), 2002, §2.C, Theorems 2C.1 and 2C.3, pp. 177–181: simplicial approximation and the alternating chain/homology trace argument. The local-index strengthening is constructed in Layers 5–6.
* A. Granas, [The Leray–Schauder index and the fixed point theory for arbitrary ANRs](http://www.numdam.org/item/BSMF_1972__100__209_0/), Bull. Soc. Math. France 100 (1972), 209–228: the rational Lefschetz number, §§2–3, pp. 210–211; the index properties (I)–(VII), §5, p. 214; the index in ℝⁿ as a local homological degree, §6, p. 215; manifolds are ANRs, Example 9.1(iv), p. 221; total index equals Lefschetz number on compact metric ANRs, Theorem 10.1, p. 224.
* H. Hopf, Über die algebraische Anzahl von Fixpunkten, Math. Z. 29 (1929), 493–524: the barycentric modification of a simplicial approximation and the local fixed-point count of §6.4.
* J. Milnor, Topology from the Differentiable Viewpoint, 1965, §6, Poincaré–Hopf theorem, p. 35: the vector-field index sum.
* A. Dold, Lectures on Algebraic Topology, Springer 1972, Chapter VII: the fixed-point index on Euclidean neighbourhood retracts and, in §6, the Lefschetz–Hopf theorem.
* V. Turaev, Introduction to Combinatorial Torsions, Birkhäuser 2001; Euler structures, nonsingular vector fields, and Reidemeister-type torsions, Math. USSR-Izvestiya 34 (1990), 627–662: based torsion and lift refinement.
* A. Pajitnov, Circle-valued Morse Theory, de Gruyter 2006; J. Milnor, Whitehead torsion, Bull. AMS 72 (1966), 358–426: completed cellular comparison and based elementary chain operations.
* M. Hutchings, [family-Floer transversality correction](https://floerhomology.wordpress.com/2011/06/30/erratum-family1/): generic function/metric paths or generic horizontal connections, not arbitrary fixed function homotopies with metric variations alone.
