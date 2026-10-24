# Roadmap: perfect powers in primitive arithmetic progressions

**Summary.** Build a general library of signed progression factorizations, Frey specializations, quadratic characters and effective analytic estimates on Mathlib’s arithmetic and elliptic carriers. Use a common modular spine and two analytic endgames to bound prime exponents by exp(10^k) above an effective absolute length threshold, then prove fixed-length finiteness for all exponents by the signed diagonal-curve adapter. The central equation is

`prod_{0 <= i < k} (n + i*d) = y^ell`, with `gcd(n,d) = 1`.

The main theorem supplies an effectively computable absolute integer `k_0 >= 5`
such that a solution with positive length `k >= k_0` and prime exponent `ell`
has `yd=0` or `ell <= exp(10^k)`. The integers `n,d,y` may have either
sign. For each fixed sufficiently large `k`, this bound combines with
fixed-exponent rational-point finiteness to give finitely many nontrivial solutions
with arbitrary exponent at least two. In particular it gives finiteness in the
positive domain of the classical progression problem.

The development follows Bennett–Siksek [BS20], Theorem 2, printed p. 357. It
retains two proofs after a common modular spine. The original proof combines
smooth-conductor character estimates, a thin-prime sieve and quantitative Roth.
Granville's addendum constructs a single small conductor outside an exceptional
set and uses an explicit formula. Having both routes makes their different
analytic requirements visible. The finiteness application uses Darmon–Granville
[DG95], Corollary 2.1 and its proof, printed pp. 520–521.

The exponent in the bound is `10^k`. The assertion concerns each fixed large
length. An effective threshold for the prime-exponent theorem does not give an
effective enumeration of Faltings points. The stronger Erdős assertion of
nonexistence for all sufficiently large lengths belongs to the statement Layer 7; it supplies no premise to the proofs in Layers 0–6.

Suggested home: `TauCeti/NumberTheory/ProgressionPowers/`. Use individual files
for the arithmetic, the two Frey specializations, the character family and the two
analytic endgames. The README specifies the mathematics. `Suggested.lean` states the headline
theorems against the pinned APIs, with only the simple definitions their
statements require; the supporting theory and Checks are specified here.

## Scope and ownership

This roadmap owns the progression arithmetic, the two Frey specializations, their
local and modular adapters, the Legendre case analysis, simultaneous character
selection, both analytic endgames and the signed diagonal-curve finiteness application.
It owns the elliptic residual-discriminant adapters, signed diagonal curves and quantitative
specializations stated in Layers 1–6. ArithmeticGaloisRepresentations §1.9 owns
residual reduction and lattice independence; its §§3.1–3.3 own Swan, Artin and
prime-to-coefficient residual conductors. General modularity, newform representations,
rational-isogeny classification and uniformity, character PNT, zero-density and
Mordell finiteness are supplier contracts, including the explicit gaps below.

EllipticCurves Layers 2–4 and its worked Frey–Hellegouarch example own torsion,
finite-field Hasse theory, local minimality and reduction, and the generic
Frey equation. EllipticCurves Layer 6 owns the `x − θ` Kummer map with kernel 2E(K),
and Layer 8 owns the semistable algorithmic–Artin conductor comparison. The first family here differs by its progression normalization;
the second differs by its equal-sum quadratic identity. ModularForms Layers 2–4, 8
and 10 own Hecke operators, newforms, coefficient fields and dimension formulas.
ModularCurves §4C owns the universal Legendre family and its field fibres;
MordellLawrenceVenkatesh §6.4 owns its native coefficient model over every
commutative ring, its discriminant and j-invariant. EllipticCurves Layer 5 owns
general quadratic twists. This roadmap owns their split-cubic specializations
and progression arithmetic comparisons. The labelled split-cubic, rational-unit,
descent, two-primary and trace obligations are assigned to
EllipticLegendreCharacterInterfaces LG.0–LG.5 and recorded in
`gap:legendre-character-interfaces`; the variants retained here extend full-two-torsion
normalization to every field of characteristic different from two and the
square-parameter subgroup theorem to every odd finite field.
Martin's bound, the removed-prime inequality, Kraus realization, uniform
irreducibility and rational-isogeny surjectivity are assigned to
EllipticModularityEffectiveComparisons EC.0–EC.5 and recorded in
`gap:effective-modular-comparisons`; the progression applications remain here.
These two obligations supply no theorem until their full contracts are discharged.
HeightsRationalPointsAndObstructions §§5.12 and 6.4 own the shared native Mordell
finiteness theorem; WeightsInEtaleCohomology R34.5–R34.6 own eigenform purity and
the bound at every complex embedding. Section 7.1 owns the consecutive-product
arithmetic and counting argument, reusing §4.3 for factorial deletion.
ClassicalArithmeticCompletion §§1.51 and 4.41 own squareclass characters and the
quartic descent. ImaginaryQuadraticClassNumber H3.1 owns CM integrality and the
complex uniformization comparison. AlgebraicCurves Layers 7 and 12E own Hurwitz and the function-field/scheme genus
comparison. Those general constructions are supplied by name, not specified again.
LocalFieldsRamification Layers 3–4 own the lower and upper ramification
filtrations, inertia, wild inertia and their finite-quotient comparisons.

Mathlib owns integer gcd, factorization, valuations, finite products, the native
Weierstrass invariants, Dirichlet characters and continued L-functions, qualitative
Roth, and the Stirling sequence. Tau Ceti owns the projective point-count trace.
The specialized invariant identities here retain the progression hypotheses; there
is no second generic invariant or point-count API. AnalyticNumberTheoryPartI §§0.1–0.8, 0.16–0.20, 0.24–0.25, 1.4, 1.7 and
3.1–3.2 own the generic prime estimates, exceptional-zero predicate, repulsion,
character PNT, explicit formula, zero density and divisor/conductor estimates.
Their numerical input hypotheses are retained in the supplier contracts below.

## Conventions

Write `t_i=n+id`, with `0 <= i<k`. Integer gcd is nonnegative:
`Int.gcd n d = Nat.gcd n.natAbs d.natAbs`. The primitive nontrivial solution
predicate `S(n,d,k,y,ell)` includes positive length, a prime exponent,
coprimality, the product equation and `yd != 0`. Write `H` for `S`
together with `k >= 10^8` and `ell>exp(10^k)`, and `H^+` for `H`
together with `k >= 2 * 10^{10}`. These are explicit conjunctions, not
opaque hypotheses containing a desired conclusion.

For positive odd `ell`, the signed factorization is
`t_i=A_i z_i^ell`, where `A_i>0` retains **all** powers of primes below
`k`, and every prime of `|z_i|` is at least `k`. Thus the prime equal to
`k`, when it is prime, belongs to the large side. These `A_i` are distinct
from the finite signed, powerfree coefficient classes used in Layer 6.

An elliptic curve is Mathlib's [`WeierstrassCurve`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.html#WeierstrassCurve) with its `IsElliptic`
condition; points and variable changes use its existing types. For
`Y^2=X(X-a)(X+c)`, `a+b+c=0`, the native discriminant and invariant are
`16(abc)^2` and `16(a^2-bc)`. After progression normalization the first
quantity is `64t_i^2t_j^2t_h^2/g^6`. A minimal discriminant at 2 requires a
separate local calculation. The second family has equation
`Y^2=X(X^2+2kappa dX+kappa A)` and discriminant
`-64kappa^3 A^2B`.

Keep three invariants distinct: the original elliptic conductor `M`, the
deletion level `M_0`, and the prime-to-`ell` residual Artin conductor
`N(rho_bar)`. Their comparison is a theorem in Layer 1. The symbol `M_a`
means the first-family deletion level. By contrast `N_a` is the actual
conductor of the chosen primitive quadratic character. Its odd part means
`N_a/2^{v_2(N_a)}`, not a largest squarefree divisor. The selected family
satisfies `N_a>1`, its odd part is nontrivial and squarefree, and
`N_a <= 8N_a^{odd}`. `Nat.maxPrimeFac` has its library values at 0 and
1; all prime-factor inequalities here apply to conductors greater than 1.

Character sums include the integer interval `k/2<m <= k`, represented by
`floor(k/2)<m <= k`. The von Mangoldt weight includes prime
powers. A prime-only sum is identified separately before estimating the
prime-power tail. Lower bounds use absolute values. Negating a character's
values does not generally produce a multiplicative character. Logarithms,
square roots and fractional powers are real; their domain and positive
threshold hypotheses are retained in every analytic application.

Use the native meromorphic `DirichletCharacter.LFunction` for complex zeros.
The principal pole at 1 is excluded from zero witnesses. The naive
`LSeries` is totalized outside convergence and cannot define an exceptional
zero set. The bounded-height strip in Layer 5 carries its height `T` explicitly.

Write F_λ for the ordinary curve y²=x(x−1)(x−λ), G_(D,λ) for its
quadratic twist y²=x(x−D)(x−Dλ), and F′_λ=G_(2,λ). For elliptic curves
in characteristic different from two, D≠0 and λ≠0,1. The comparison curve
F_a is isomorphic over ℚ to some G_(D_a,λ); D_a is retained. At a good odd
prime, after choosing a unit representative δ_p of its unramified twist
class, a_p(F_a)=(δ_p/p)a_p(F_λ), whereas a_p(F′_λ)=(2/p)a_p(F_λ).
The witness over 𝔽₅ at λ=4 has #F_λ=8, #F′_λ=4 and respective traces
−2,2; this fixes the twist sign used throughout Layer 2.

Mathlib supplies integer gcd, natural factorization, integer prime valuations,
finite products, Weierstrass coefficients and invariants, Dirichlet characters
and their conductors, von Mangoldt, largest prime factors, and the Stirling
sequence. Tau Ceti supplies `WeierstrassCurve.frobeniusTrace`; it is the full
projective point-count defect, and its elliptic specialization is used for good
reductions. The declaration references at each target below identify the
existing inputs; none of these carriers is reconstructed.

## Exact supplier contracts

### From Mathlib

Use `Int.gcd_def`, `Int.gcd_greatest` and
`Int.dvd_of_dvd_mul_left_of_gcd_one` in `Mathlib/Data/Int/GCD.lean` for
nonnegative gcds and cancellation. Use `Nat.factorization` in
`Mathlib/Data/Nat/Factorization/Defs.lean`. For nonzero integer term valuations,
use `padicValInt.mul` in `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean`,
retaining `[Fact p.Prime]` and nonzero factors.
The valuation at a zero argument is never used to deduce exponent divisibility.

Use `WeierstrassCurve`, `WeierstrassCurve.Δ`, `WeierstrassCurve.c₄` and
`WeierstrassCurve.j` in `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`,
and `WeierstrassCurve.Affine.Equation` in
`Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean`. Ellipticity is
`IsElliptic`, with nonzero discriminant, rather than a separate curve carrier.

Use `DirichletCharacter.conductor`, `DirichletCharacter.IsPrimitive` and
`MulChar.IsQuadratic` from
`Mathlib/NumberTheory/MulChar/Basic.lean`; the first two are in
`Mathlib/NumberTheory/DirichletCharacter/Basic.lean`; use
`DirichletCharacter.LFunction` from
`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean` with positive modulus.
Use `ZMod.LFunction_apply_zero_of_even` in
`Mathlib/NumberTheory/LSeries/ZMod.lean`: for an even function Φ,
L(0,Φ)=−Φ(0)/2. For a Dirichlet character of modulus greater than one,
its value at zero vanishes. Use `DirichletCharacter.LFunction_ne_zero_of_one_le_re`
in `Mathlib/NumberTheory/LSeries/Nonvanishing.lean` away from the principal pole.
Use `ArithmeticFunction.vonMangoldt` from
`Mathlib/NumberTheory/ArithmeticFunction/VonMangoldt.lean` and
`Nat.maxPrimeFac` from `Mathlib/Data/Nat/MaxPrimeFac.lean`.

Use `Chebyshev.theta` and `Chebyshev.psi` from
`Mathlib/NumberTheory/Chebyshev.lean` for the prime and prime-power sums.

Use `roth_3ap_theorem_nat` from
`Mathlib/Combinatorics/Additive/Corner/Roth.lean` for the qualitative finite-set
conclusion. Layer 4 proves the stronger numerical cutoff. Use
`Stirling.stirlingSeq`, `Stirling.log_stirlingSeq_sdiff_le` and
`Stirling.tendsto_stirlingSeq_sqrt_pi` and `Stirling.le_factorial_stirling` from
`Mathlib/Analysis/SpecialFunctions/Stirling.lean` for the factorial adapter.

Use `Nat.exists_prime_lt_and_le_two_mul` in
`Mathlib/NumberTheory/Bertrand.lean`: for natural n≠0 there is a prime p
with n<p≤2n. Use `SimpleGraph`, `SimpleGraph.completeBipartiteGraph` and
`SimpleGraph.Free` from `Mathlib/Combinatorics/SimpleGraph/Basic.lean`,
`Mathlib/Combinatorics/SimpleGraph/Bipartite.lean` and
`Mathlib/Combinatorics/SimpleGraph/Copy.lean`, respectively, for the bipartite
graph and forbidden four-cycle; the
finite neighbour-pair count in §7.1 is stated on these native carriers.

### From Tau Ceti

Use `WeierstrassCurve.pointCount`, `WeierstrassCurve.pointCount_def`,
`WeierstrassCurve.frobeniusTrace` and
`WeierstrassCurve.frobeniusTrace_eq_card_point` in
`TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean`: on an elliptic model
over a finite field of size q, the trace is q+1 minus the number of all projective
points. The identity point is included.

Use `WeierstrassCurve.Affine.μ`, `WeierstrassCurve.Affine.exists_eq_two_smul_iff`
and `WeierstrassCurve.Affine.ker_μ_eq` in
`TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean` for descent and
halving over a field, with the normal-form, ellipticity and decidable-equality
hypotheses of that API. Layer 2 specializes these to split cubic coordinates.
Use `CongruenceSubgroup.Gamma0_prime_index` and
`CongruenceSubgroup.Gamma0_prime_power_index` in
`TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean` for the
actual subgroup index at prime and positive prime-power levels. The rational
prime-product expression in §1.1 is compared to that index.

Use `TauCeti.Multiquadratic.fundamentalDiscriminantChar`,
`TauCeti.Multiquadratic.fundamentalDiscriminantChar_isQuadratic`,
`TauCeti.Multiquadratic.isPrimitive_fundamentalDiscriminantChar` and
`TauCeti.Multiquadratic.fundamentalDiscriminantChar_natCast_eq_legendreSym` in
`TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean`.
For a fundamental discriminant D the carrier has level |D| and integer values;
ClassicalArithmeticCompletion §1.51 supplies the integer-valued rational-squareclass
character. Form its real and complex versions by Mathlib `MulChar.ringHomComp`;
`MulChar.ringHomComp_apply` and `MulChar.IsQuadratic.comp` give values and quadraticity.
Use `DirichletCharacter.conductor_ringHomComp` and
`DirichletCharacter.isPrimitive_ringHomComp_iff` in
`TauCeti/NumberTheory/DirichletCharacter/Conductor.lean`, with injective integer
casts and positive level, for conductor and primitivity.

Use `WeierstrassCurve.quadraticTwistOf` and
`WeierstrassCurve.Δ_quadraticTwistOf` in
`TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean`.
Its parameters are trace t and norm n, with discriminant t²−4n, over any
commutative ring; a unit discriminant is required for ellipticity preservation.
For characteristic different from two, specializing an ordinary Legendre
curve at (t,n)=(0,−D/4) gives the coefficients of G_(D,λ).
Use `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`
from the same file for the Galois-equivariance sign over a separable quadratic
extension; the split class uses the identity comparison.

### From TauCetiRoadmap.EllipticCurves

Consume Layer 2's actual torsion Galois action and its functoriality, Layer 3's
Hasse bound and supersingular criteria (with p≥5 for the trace-zero criterion),
and Layer 4's integral-model minimality and good/multiplicative reduction.
Consume Layer 6’s `x − θ` Kummer map and kernel 2E(K), and Layer 8’s
semistable algorithmic–Artin conductor comparison (the Szpiro block). At an odd prime,
a unit discriminant gives good reduction; a unit c₄ and positive discriminant
valuation give minimal multiplicative reduction. Consume the worked
Frey–Hellegouarch example's `freyCurve A B` over any commutative ring, with
coefficients (0,B−A,0,−AB,0). Layer 1 specializes this curve at (a,c).

### From TauCetiRoadmap.ModularForms

Consume Layers 2–4's Hecke operators and normalized weight-two newforms,
and Layer 8's coefficient number field, Hecke eigenvalues and coefficient-field embeddings. Consume Layer 10's
trivial-nebentypus dimension formulas. The newspace dimension used in the Kraus
threshold is not the full Γ₁ dimension.

### From TauCetiRoadmap.WeightsInEtaleCohomology

Consume R34.6's `newform_ramanujan`, using R34.5's realization and purity:
for every normalized cuspidal weight-two newform f of positive level N and
trivial nebentypus, every complex embedding σ of its coefficient number field,
and every prime p∤N, |σ(c_p)|≤2√p. At a coefficient place above ell, the
Frobenius comparison additionally requires p≠ell; the coefficient bound itself
does not. No separate eigenform-purity adapter is constructed here.
(BS20, Lemma 2.2 and proof, p. 359.)

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

Consume §§5.12 and 6.4's `mordell_finite` on its native signature: K is a
number field and C is a smooth proper geometrically connected one-dimensional
scheme over Spec K with genus at least two, using `C.genus K` and its
finite-dimensional H¹(C, 𝒪_C) instance. Rational points are morphisms over
Spec K. AlgebraicCurves Layer 12E identifies this genus with the function-field
genus computed for the diagonal curve. MordellLawrenceVenkatesh §11.6 supplies
an alternative proof of that same declaration. No effective height bound or
point enumeration is part of the contract.
(Faltings1983, §6, Satz 7, p. 365.)

### From TauCetiRoadmap.ModularCurves

Consume §4C's universal Legendre family over ℤ[1/2] and its field fibres.

### From TauCetiRoadmap.MordellLawrenceVenkatesh

Consume §6.4's native coefficient model of y²=x(x−1)(x−λ) over every
commutative ring, including characteristic two and singular parameters:
coefficients (0,−(1+λ),0,λ,0), discriminant 16λ²(λ−1)², and, over a field
with 2λ(λ−1)≠0, j=256(λ²−λ+1)³/(λ²(λ−1)²). Its smooth specialization
is the ModularCurves §4C family.

### From TauCetiRoadmap.LocalFieldsRamification

Consume Layer 3's lower and upper ramification filtrations and the Herbrand
quotient theorem, and Layer 4's inertia, wild inertia and finite-level
restriction comparisons. The pinned lower filtration is
`TauCeti.LocalFieldsRamification.lowerRamificationGroup` in
`TauCeti/NumberTheory/LocalField/RamificationGroup.lean`, with
`lowerRamificationGroup_zero`, `lowerRamificationGroup_antitone` and
`lowerRamificationGroup_eq_bot_of_largestLowerJump_lt`. Its finite Galois
local-field hypotheses and normalized integer valuation are retained in
the supplied conductor setting of ArithmeticGaloisRepresentations §§3.1–3.3.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

Consume §1.51 `squareclassCharacter` of a nonzero rational number: its primitive
conductor, squarefree odd support, 2-part in {1,4,8}, support at odd valuations,
and characterization of odd part 1 by the four classes ±1, ±2. Consume §4.41's
quartic descent: positive primitive T,V,U satisfying T⁴+V⁴=2U² have T=V=U=1.
The primitive, positive and nonzero hypotheses are kept in the Case-II application.

### From TauCetiRoadmap.ImaginaryQuadraticClassNumber

Consume H3.1's complex elliptic uniformization/endomorphism comparison and
algebraic integrality of CM j-values. For a rational j-value, algebraic
integrality implies j∈ℤ. This is used only after proving CM of that same curve.

### From TauCetiRoadmap.AlgebraicCurves

Consume AlgebraicCurves Layer 7's Riemann–Hurwitz formula with the degree,
separability, tame different and constant-field hypotheses, and
AlgebraicCurves Layer 12E's comparison of the smooth projective curve,
its function field, H¹ and genus. The diagonal cover, its smoothness,
geometric connectedness, branch data and rational-point lifting are Layer 6
constructions here.

### From TauCetiRoadmap.EtaleCohomologyFoundations

Consume §F.4.0 `ContinuousRep`, `ContinuousRep.exists_stable_lattice_iff` and
`GaloisLattice.IntegralModel`: a jointly continuous representation of a compact
group on a finite-dimensional vector space over a nonarchimedean local field,
with its module topology, has an invariant lattice over the valuation ring.
Apply this to the compact absolute Galois group and K_λ²; use the following
residual-representation contract for reductions of these integral models.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Consume §1.9's `IntegralModel.reduction`, `IntegralModel.residualSS` and
`ContinuousRep.residual`: reduction of an integral model, its residual semisimplification,
and independence up to isomorphism of the stable lattice, coefficient-field
descent and coefficient extension to an algebraic residue field. Retain the
topological-ring and continuous residue-map hypotheses, with discrete residue
field, for continuity of the reduction. Raw reduction and its semisimplification
are distinct; the torsion representation E[ell] is not replaced by its
semisimplification before the elliptic conductor calculation.

Consume §§3.1–3.2's Swan conductor and Artin exponent
codim(V^I)+Sw(V), with `Conductor.artinConductor` and its natural-number
form `Conductor.artinConductorNat`, their integrality and invariance under isomorphism and
coefficient extension. Locally the base field is complete for an integer-normalized
discrete valuation with perfect residue field of characteristic p. The representations
are finite-dimensional and continuous over Hausdorff coefficient fields, the
coefficient characteristic is different from p, and wild inertia has finite image. For ell-adic or residual coefficients, also require ell≠p; characteristic
zero of the coefficient field alone does not impose this restriction.
Consume §3.3's global conductor with excluded coefficient places,
`Conductor.primeToPConductor` and the positive-generator convention over
ℚ. The global representations are continuous and unramified outside a finite
set. In particular, the conductor is computed on the actual representation,
not on a characteristic-zero lift of a residual representation.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

Consume §§0.1 and 0.17's exceptional-real-zero predicate, uniqueness and
simplicity at the supplied sufficiently small positive width, and two-real-zero
inequality; §0.24 gives strict conductor repulsion N₂>N₁². Consume §0.18's
effective character PNT for primitive nonprincipal characters and sufficiently
large X≥X₀, with effective absolute c,C>0 and X₀, in the form
∑_(m≤X)χ(m)Λ(m)=−X^β/β+R when an exceptional zero β exists, and R
otherwise, with |R|≤C X exp(−c log X/(√(log X)+log N))(log N)⁴.
The conductor is N>1 and the character is primitive and nonprincipal.
Consume §0.6's bounded-height Landau–Page theorem. Its strict boundary is
used at twice the width to obtain the closed-boundary application in §5.1.
Consume §1.4 and §§1.4a–1.4d's common-height half-interval explicit formula,
including the bounded kernel at zero, and §1.7's effective log-free density
bound, counting analytic multiplicities and including its +1 exceptional-zero
allowance. All constants are effective and chosen before the conductor.

Consume §§0.3–0.5, 0.8, 0.16, 0.19–0.20 and 0.25 for the following estimates,
with their exact domains: θ(x)<1.000081x for x>0;
|θ(x;8,a)−x/4|≤0.002811x/4 for a=3,5 and x≥10¹⁰;
the prime-count pair x/log x·(1+1/(2 log x))<π(x)<x/log x·(1+3/(2 log x))
for x≥59; |∑_(p≤x)1/p−log log x−B₁|<1/(2(log x)²) for x≥286;
log x+E−1/(2 log x)<∑_(p≤x)(log p)/p<log x+E+1/(2 log x)
for x≥319 with the same constant E at both endpoints;
the strict half-interval prime-power margin 0.000045875k for k≥2·10¹⁰;
and ∏_(p≤x)(1+1/p)≤2 log x for x≥10⁸. Here B₁ is the prime Mertens
constant and E=−γ−∑_p log p/(p(p−1)); E cancels in interval subtraction.
Consume §3.1 and §§3.1a–3.1c's effective divisor bound on positive integers,
and §3.2's bound 0.94 log N<P(N) for primitive quadratic conductors N>1.

The literal numerical estimates have the following hypotheses. They remain
hypotheses in every application until the indicated supplier gaps are discharged.

| Supplier section | Required input | Exact content relevant here |
| --- | --- | --- |
| §0.3 | `SchoenfeldFiniteRangeInput` | θ(x)<1.000081x for 0<x<exp(10000). |
| §0.5 | `RosserSchoenfeldFiniteRangeInput` | The stated prime-count pair for 59≤x<exp(10000). |
| §0.16 | `ModEightFiniteInput` | The two theta error bounds for 10¹⁰≤x<exp(10000), and every nontrivial zero for characters modulo 8 at height at most 10000 lies on Re s=1/2. The analytic tail still uses this bounded-zero input. |
| §0.25 | `PrimeProductFiniteInput` | ∑_(p≤x)1/p≤log log x+0.27+5/log x for 10⁸≤x<exp(10000). |
| §3.2 | `QuadraticConductorFiniteInput` | 0.94 log N<P(N) for every primitive nonprincipal quadratic conductor 1<N<12000000000; the large-conductor part also retains the theta input. |
| §0.7 | `BMORFiniteInput` | No positive real zero below 1 for primitive nonprincipal quadratic conductors 3≤q≤400000, and √d L(1,χ_d)>12 for positive fundamental 400000≤d<26500000000. |
| §0.7 | `BMORClassNumberInput` | h(ℚ(√d))≥46 for every negative fundamental d<−319867; this is a global classification, not a bounded-range hypothesis. |

Section 0.7 supplies β≤1−40/(√q(log q)²) for nonprincipal quadratic
characters modulo q≥3 and positive real zeros, under both BMOR inputs.
No GRH assumption or omitted numerical hypothesis is substituted for these inputs.

### Required Legendre-character interfaces

The obligation `gap:legendre-character-interfaces` requires the following full
contract assigned to EllipticLegendreCharacterInterfaces LG.0–LG.5. Every use of
these interfaces in Layer 2 requires its discharge; the gap supplies no theorem.

Require LG.0's scaled coefficient model, labelled root orderings and split-cubic
normalization; use MordellLawrenceVenkatesh §6.4 for the ordinary coefficient
model. LG.0's full-two-torsion normalization is over ℚ; §2.1 retains its
extension to all fields of characteristic different from two. Require LG.1's
good-odd-prime unit and character-conductor divisibility statements, with
rational full two-torsion and odd semistability. Require LG.2's split-cubic
readings of the native descent map and halving criterion; LG.3's embedded
ℤ/2ℤ×ℤ/4ℤ at square parameters for p≡3 mod 4 and exact valuation
v₂(#F₋₁(𝔽_p))=3 for p≡5 mod 8; LG.4's corrected scale-two order-four
point and descent coordinates; and LG.5's symmetric trace-zero and
scaled-Legendre twist-trace comparison. The all-odd-finite-field subgroup
extension is stated in §2.1; the generic descent map itself remains supplied.

### Required effective modular comparisons

The obligation `gap:effective-modular-comparisons` requires the following full
contract assigned to EllipticModularityEffectiveComparisons EC.0–EC.5. Every use
in Layers 1–2 requires its discharge; the gap supplies no theorem.

Require EC.0's bound g₀⁺(N)≤(N+1)/12 for every positive level N in the trivial-character weight-two
newspace, and EC.1's removed-prime inequality for E/ℚ and odd prime ell:
ell≤(√p+1)^((M₀+1)/6) for prime p≠ell, p∥M and ell dividing the minimal
discriminant valuation, with irreducible E[ell] and the weight-two lowering
hypotheses. Require EC.2's Γ₀ index μ(N)=N∏_(q|N)(1+1/q) for N>0 and
Kraus thresholds F_K(N)=(μ(N)/6+1)^(2g₀⁺(N)),
G_K(N)=(μ(lcm(N,4))/6+1)², H_K(N)=max(F_K(N),G_K(N)).
Require EC.3's realization for E/ℚ with full rational two-torsion at the exact
prime-to-ell residual conductor N, assuming prime ell≥5, irreducibility, Serre weight two and
ell>H_K(N). Its output is an actual F/ℚ of conductor N with full rational
two-torsion and F[ell]≅E[ell]. EC.4 requires irreducibility at primes ell≥7
for full rational two-torsion, and ell≥11 for a nonzero rational two-torsion
point. EC.5 requires surjectivity at every prime ell>37 for a non-CM rational
elliptic curve with a nontrivial rational cyclic isogeny. These are shared
mathematical contracts; the deletion-level and coefficient-prime comparison
in §1.10 is needed before applying EC.3 to the progression curve.

### Supplier gaps

The following `gaps` entries specify required inputs not supplied unconditionally
by the cited contracts. A gap supplies no theorem; a locator marked unavailable
does not identify a supplier section.

- `gap:legendre-character-interfaces`: requires the complete LG.0–LG.5 contract under Required Legendre-character interfaces, including normalization, units, conductor support, descent, two-primary groups, the Case-II point and trace comparisons (BS20, §6, Lemmas 6.2–6.6 and their proofs, pp. 367–372).
- `gap:effective-modular-comparisons`: requires the complete EC.0–EC.5 contract under Required effective modular comparisons, including the newspace bound, norm inequality, exact Kraus realization, both irreducibility cutoffs and rational-isogeny surjectivity (BS20, §2, Lemma 2.2 and Theorem 4, pp. 359–360; Lemmas 3.3, 3.5, pp. 362–363; Lemos2017v2, Theorem 1.1, p. 2).
- `gap:elliptic-modularity`: supplier `EllipticCurveModularity`; section: rational elliptic modularity (locator unavailable); needs: every E/ℚ corresponds to a normalized weight-two trivial-nebentypus newform of level its arithmetic conductor with the same traces at all good primes (BS20, §2, Theorem 3, pp. 358–359).
- `gap:weight-two-lowering`: supplier `SerreWeightAndLevelOptimisation`; section: weight-two level and weight optimization (locator unavailable); needs: irreducible E[ell] for odd prime ell descends to the deletion level in BS20 equation (3), with the coefficient-prime weight-two bridge under the good or finite-flat multiplicative hypotheses (BS20, Theorem 3 and Lemma 2.1, p. 359).
- `gap:newform-galois`: supplier `AutomorphicGaloisRepresentations`; section: classical newform representations (locator unavailable); needs: the continuous two-dimensional K_λ-representation of a normalized weight-two trivial-nebentypus newform, unramified outside N*ell, with arithmetic-Frobenius polynomial `T^2-c_p*T+p` and cyclotomic determinant (BS20, §2, pp. 358–359).
- `gap:numerical-prime-inputs`: supplier `AnalyticNumberTheoryPartI` §§0.3, 0.5, 0.16, 0.25 and 3.2; needs: proofs of the five prime/conductor input hypotheses in the table, before any dependent statement is unconditional (Schoenfeld1976, Note Added in Proof, p. 360; RosserSchoenfeld1962, Theorems 1, 5, 8; RamareRumely1996, Theorems 1, 2.1.1 and Table 1; BS20, Lemma 7.3, p. 375). These sections state conditional estimates, not proofs of the inputs.
- `gap:numerical-zero-inputs`: supplier `AnalyticNumberTheoryPartI` §0.7; needs: proofs of both BMOR input hypotheses in the table before the literal separation constant 40 is available unconditionally (BMOR2018v3, Proposition 1.11 and its proof, §6.1). The global negative-discriminant classification is included.
- `gap:small-conductor-zeros`: supplier `AnalyticNumberTheoryPartI` §0.7, the zero-exclusion component of its BMOR finite input; needs: a proof excluding exceptional real zeros for primitive nonprincipal quadratic conductors 1<N<400000 at the same sufficiently small c* as §3.1. That component is a hypothesis, not a proved output. Platt2013v1, Abstract, p. 1 records the published mathematical input (BS20, p. 376); no computation is specified here.

## How to read the build

Layer 0 constructs signed factors, finite index sets and the factorial adapter
to the supplied prime estimates. Layer 1 specializes the supplied residual and
conductor invariants before building the modular comparisons for both Frey families.
Layer 2 builds the Legendre interfaces and the simultaneous character family.
Layer 3 supplies effective analytic inputs and the two original-route criteria;
Layer 4 supplies quantitative Roth, sieve densities and that route's assembly.
Layer 5 builds the bounded-height zero estimates and a single Granville witness.
Layer 6 combines either route with the signed geometric adapter for fixed-length
finiteness. Layer 7 proves the independent consecutive-product theorem and records
explicit conjectural predicates; it supplies no
premise to Layers 0–6. Each simultaneous choice satisfies all its properties
at once. Backticked local declaration names belong to
`TauCetiRoadmap.ErdosProgressionPowers` and occur in `Suggested.lean`.
Its headline tests are the half-interval prime-divisibility theorem (§1.9),
the prime-exponent bound (§6.2), signed hyperbolic and positive fixed-exponent
finiteness (§6.3), all-exponent fixed-length finiteness (§6.5), and the
consecutive-product theorem (§7.1). The comparison-curve theorem (§1.12) and
the full simultaneous character-family theorem (§2.7) need the arithmetic
conductor, deletion level and residual comparison of the Frey curve, which
are not available at the pins; the module docstring identifies these missing
interfaces. Their full statements remain targets here.

## Layer 0: Primitive solutions and signed factors

Define primitive nontrivial solutions with n,d,y in ℤ, positive length k and prime exponent ell, using the exact product over 0≤i<k and positive integer gcd. Prove the gcd-of-two-terms and large-prime valuation contracts. Construct the unique positive small-prime factors A_i with signed large-prime factors y_i for odd ell. Define strict arithmetic-progression triples and equal-sum quadruples. Define divisibility index sets and their one-residue-class cardinal bounds, including the +1 boundary.

### 0.1 Primitive progression solutions

Define `term n d i` as n+i*d and `primitive_solution` as the predicate S below; `H` is its large-exponent specialization, and H⁺ adds the stronger length bound. A triple is an element of ℕ×ℕ×ℕ and a quadruple an element of ℕ×ℕ×ℕ×ℕ, without implicit order constraints. Prove the gcd divisibility, large-prime valuation and residue-class counting theorems in the respective subsections below.

For n,d,y in ℤ and k,ell in ℕ, S(n,d,k,y,ell) means k>0, ell prime, gcd(n,d)=1, product over i in range(k) of n+i*d equals y^ell, and y*d is nonzero. H adds k≥10^8 and ell>exp(10^k); H⁺ adds k≥2*10^10. All real casts and exponentials are explicit.

- S is equivalent to precisely the five conjuncts in its definition.
- S and i<k imply n+i*d is nonzero.
- S implies ell is prime and ell≥2.

**Checks.**

- S(1,24,3,35,2) holds: 1*25*49=35^2.
- S(-3,2,4,3,2) holds; its four factors are -3,-1,1,3.
- S(n,d,0,y,ell) never holds.
- S(4,2,1,2,2) does not hold despite its product equation.

Use the native positive integer gcd and finite product. Nonzero product implies every indexed term is nonzero. H and H⁺ are explicit conjunctions, not new opaque assumptions. The API gives term(0)=n, term(i+1)=term(i)+d, H⁺⇒H, and the two stated length projections.

**Checks.**

- term(2,3,0)=2 pins zero-based indexing.
- term(2,3,1)=5 increments by d, rather than n.
- term(−3,2,2)=1 retains signs.
- H⁺ implies H; it includes every conjunct of the base predicate.
- H implies k≥10⁸; the prime-exponent equation alone does not define H.
- H⁺ implies k≥2·10¹⁰, its stronger length requirement.
- H at k=0,1,2 is false regardless of the other parameters; H⁺ fails at each of these lengths as well.

*Needs:* Mathlib `Int.gcd_def`.

([BS20], Sections 1 and 3, equation (2), pp. 356, 360.)

### 0.2 Gcd of progression terms

If gcd(n,d)=1 and 0≤i<j, then gcd(n+i*d,n+j*d) divides j-i, with gcd nonnegative and the right side a natural integer.

Subtract the two terms. Any common divisor divides (j-i)*d. The term is coprime to d by a Bezout combination with n; cancel d using the native gcd cancellation theorem.

*Needs:* Layer 0 — primitive progression solutions; Mathlib `Int.gcd_greatest`; Mathlib `Int.dvd_of_dvd_mul_left_of_gcd_one`.

([BS20], Lemma 3.1(i), p. 360.)

### 0.3 Large-prime valuation divisibility

Assume S. For prime q≥k and i<k, ell divides padicValInt(q,n+i*d). The valuation is on the absolute value of a nonzero integer.

The gcd bound prevents q dividing two distinct terms because their difference of indices is less than q. Apply valuation additivity to the nonzero product and the ell-th power. Only the chosen term contributes.

*Needs:* Layer 0 — gcd of progression terms; Mathlib `padicValInt.mul` in `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean`, with `[Fact q.Prime]` and both factors nonzero.

([BS20], Lemma 3.1(ii), p. 360.)

### 0.4 Signed small-prime factorization

Define the signed-factorization predicate with parameters n,d∈ℤ, k,ell∈ℕ,
A : Fin k → ℕ and z : Fin k → ℤ,
by the positivity, nonzero, term equation and two prime-support conditions below.
Prove unique signed factorization for positive odd ell, nonzero terms and
large-prime valuation divisibility, asserting unique existence of the pair (A,z).

For positive odd ell and nonzero terms n+i*d, i<k, whose valuations at every prime q≥k are divisible by ell, choose the unique family (A_i,z_i) with A_i>0, z_i a nonzero signed integer, n+i*d=A_i*z_i^ell, every prime of A_i <k and every prime of |z_i| ≥k. S with odd ell supplies these hypotheses. All powers of small primes remain in A_i; it need not be ell-powerfree.

- For i<k, n+i*d=A_i*z_i^ell.
- A_i>0 and z_i≠0; p|A_i implies p<k, and p||z_i| implies k≤p, for every prime p.
- Any family with these equality, sign and support conditions agrees componentwise with the chosen family.
- The sign of z_i is the sign of n+i*d.

**Checks.**

- For S(-8,1,1,-2,3), the single factor is (1,-2).
- For S(8,19,2,6,3), the factors are (1,2),(1,3); the prime p=k=2 belongs to the large side.
- For n=64,d=0,k=3,ell=3 the valuation construction gives (64,1) at each index; 64 retains its full small-prime exponent and is not cube-free. This tests the construction, not S, since d=0. The alternative (1,4) is rejected because its z has the small prime 2.
- For S(-8,7,2,2,3), the factors are (1,-2),(1,-1).

Split the factorization of |n+i*d| at the strict bound k. Divide each large-prime exponent by ell using large-prime valuation divisibility. Since ell is odd, restore the sign in z_i. Unique factorization and injectivity of odd powers give uniqueness.

*Needs:* Layer 0 — large-prime valuation divisibility; Mathlib `Nat.factorization`; Mathlib `Nat.prod_factorization_pow_eq_self`.

([BS20], Equation (6), p. 360.)

### 0.5 Three-term progression triples

Define the strict progression-triple set A(k) below.

A(k) is the finite set of natural triples (i,j,h) with i,j,h<k, i<j and i+h=2*j. Thus i<j<h and the spacing is positive; there is no truncated subtraction in its definition.

- Membership is equivalent to i,j,h<k, i<j and i+h=2*j.
- A member has i<j<h and j-i=h-j>0.
- k≤K implies A(k) is a subset of A(K).

**Checks.**

- A(0)=A(1)=A(2)=empty.
- A(3) consists exactly of (0,1,2).
- A(5) has exactly four elements.
- No triple (i,i,i) belongs to A(k).

Filter the finite product of three copies of range(k) by the two displayed conditions. Membership and strict h>j follow by natural-number arithmetic.

*Needs:* Mathlib finite-set and arithmetic operations.

([BS20], Section 3.1, equations (7)-(8), p. 361.)

### 0.6 Equal-sum progression quadruples

Define the equal-sum index set I(k) below and its signed product difference κ=j₁j₂−i₁i₂.

I(k) consists of (j1,i1,i2,j2) in range(k)^4 with j1<i1≤i2<j2 and i1+i2=j1+j2. Equality i1=i2 is permitted.

- Membership is equivalent to the four bounds, ordering and equal-sum equation.
- For a member, the integer kappa is negative and 0<|kappa|<k^2.
- The quadruple sets are monotone in k.

**Checks.**

- I(2) is empty.
- I(3) consists exactly of (0,1,1,2), with kappa=-1.
- (0,1,1,3) is excluded from I(4), although its ordering holds, because its sums differ.
- kappa(0,1,2,3)=−2; the opposite product difference would be positive.
- kappa(1,2,2,3)=−1, including a nonzero first index.

Filter the fourfold finite product. The positive gap makes kappa=j1*j2-i1*i2 a negative integer, of absolute value less than k^2.

*Needs:* Mathlib finite-set and arithmetic operations.

([BS20], Section 3.2, equations (11)-(13), p. 362.)

### 0.7 Divisibility index sets

Define Iᵣ(n,d,k) by divisibility of the progression term, as below.

For n,d in ℤ and k,r in ℕ, I_r is the set of i<k such that the integer r divides n+i*d. The definition is total, including r=0; counting statements require r>0.

- i belongs to I_r iff i<k and (r:Z)|(n+i*d).
- I_1 equals range(k).
- If gcd(n,d)=1, p is prime and p|d, then I_p is empty.

**Checks.**

- For n=1,d=2,k=6,r=3, I_r={1,4}.
- For k=0 the set is empty, for every r.
- For n=1,d=1,k=3,r=4, the set is empty; index k=3 is not included.

Filter range(k) by integer divisibility, rather than by a rational or real quotient. The range excludes k.

*Needs:* Mathlib finite-set and arithmetic operations.

([BS20], §9 before Proposition 9.1, p. 381; Proof of Proposition 12.3, pp.387–388.)

### 0.8 One-residue-class count

If gcd(n,d)=1 and r>0, then I_r is empty when gcd(r,d)>1. Otherwise I_r is a single residue class modulo r and |I_r|≤k/r+1 as a real inequality; for prime p with p not dividing d, ||I_p|-k/p|<1.

A common prime of r,d cannot divide n. In the coprime case invert d modulo r and count one class in range(k); keep the rounding error even for r>k.

*Needs:* Layer 0 — divisibility index sets; Layer 0 — gcd of progression terms.

([BS20], §9 before Proposition 9.1, p. 381; Proof of Proposition 12.3, pp.387–388.)

### 0.9 Prime estimates in the progression factorial argument

Apply AnalyticNumberTheoryPartI §§0.3–0.5, 0.8, 0.16, 0.19–0.20 and 0.25
on the domains in the supplier contracts. The theta constant retains
SchoenfeldFiniteRangeInput; the prime-count pair retains
RosserSchoenfeldFiniteRangeInput; the mod-eight errors retain the full
ModEightFiniteInput; and the Euler-product bound retains PrimeProductFiniteInput.
Unconditional applications require gap:numerical-prime-inputs. These generic
estimates are consumed; the local target is their progression factorial adapter.

Under SchoenfeldFiniteRangeInput, prove for natural k≥exp(exp(10⁷)) that
∑_(p prime, k^(7/16)<p≤k) v_p((k−1)!) log p≥(9/16)k log k−5k
(BS20, §9, p. 384; Tenenbaum1995, Theorem 5;
RosserSchoenfeld1962, Theorem 6). For a=k^(7/16), use the supplied
weighted-prime interval bound and Legendre's factorial valuation formula.
The lower bound is
(k−1)[(9/16)log k−1/(2 log k)−8/(7 log k)]−1.000081k,
which is at least (9/16)k log k−5k on this domain.
The same E cancels at both endpoints, each exceeding 319.

For ε>0, use AnalyticNumberTheoryPartI §3.1 at ε/2 to obtain
τ(n)≤C_ε n^(ε/2) for all n>0, with effective C_ε≥1. Then
n≥C_ε^(2/ε) gives τ(n)≤n^ε. This applies to nonsquarefree n as well
(BS20, §8, proof of Proposition 8.2, p. 378; §12, Proposition 12.3, pp. 387–388).

**Checks.**

- θ(2)=log 2 whereas ψ(4)=2 log 2+log 3; higher prime powers belong only to ψ.
- At x=1 the prime sums vanish, the Euler product is 1 and 2 log 1=0; its x≥10⁸ hypothesis cannot be dropped.
- For n=p^a, τ(n)=a+1; at n=4 it is 3, not the squarefree value 2.
- For k=2·10¹⁰, the mod-eight lower endpoint k/2=10¹⁰ is included; taking both errors at k would change their combined coefficient from 3ε/8 to 4ε/8.

*Needs:* AnalyticNumberTheoryPartI §§0.3–0.5, 0.8, 0.16, 0.19–0.20, 0.25 and 3.1;
gap:numerical-prime-inputs for unconditional applications; Mathlib finite prime sums,
natural factorization and factorial valuations.

### Examples

The primitive square product is 1·25·49=35². The signed product (−3)(−1)(1)(3)=9 tests integer signs. At k=2 the prime 2 belongs to the large-prime side of the signed factorization.

### Dependencies

Mathlib integer gcd, factorization, prime valuations and finite sets;
AnalyticNumberTheoryPartI §§0.3–0.5, 0.8, 0.16, 0.19–0.20, 0.25 and 3.1,
with the numerical hypotheses in the supplier table.

## Layer 1: Frey families and residual comparisons

Normalize the three progression terms to coprime a+b+c=0 and specialize the supplier Frey-Hellegouarch model, without constructing a second generic curve. Build the application-specific equal-sum second model, its discriminant and odd-prime local tests. Prove the reduced-level divisibility, odd squarefreeness and exponential bounds for both families. Prove that primes k/2<p≤k divide d under k≥10^8 and ell>exp(10^k); the two-term case needs its own c4-unit test. Establish the coefficient-prime Serre-weight/conductor bridge, compare to an actual full-two-torsion curve at the reduced level using Kraus, and prove good reduction and equality of integer traces throughout the half interval, including forced trace zero at primes 3 modulo4.

### 1.1 General modular comparison interfaces

Consume `gap:newform-galois`, WeightsInEtaleCohomology R34.6's
weight-two trivial-nebentypus coefficient bound and `gap:elliptic-modularity` with the exact hypotheses in the supplier contracts.
Use EtaleCohomologyFoundations §F.4.0 for invariant integral lattices of the
jointly continuous K_λ-representation of the compact absolute Galois group.
Use ArithmeticGaloisRepresentations §1.9 for reduction and semisimplified
residual lattice-independence, preserving its continuous residue-map and
coefficient-descent hypotheses. Specialize the supplied residual representation
to weight-two newforms and compare the reduced characteristic polynomials. The arithmetic-Frobenius polynomial is `T^2-c_p*T+p`.
(BS20, §2, pp. 358–359.)

**Checks.**

- For an elliptic eigenform with c_p=0, the Frobenius polynomial is `T^2 + p`; a negative constant term would contradict the cyclotomic determinant.
- At coefficient prime ell the unramified Frobenius clause is not asserted, even when ell does not divide N.
- Changing an invariant lattice preserves the semisimplified residual representation; equality of chosen matrices is not required.

Use ArithmeticGaloisRepresentations §§3.1–3.3 for the local Artin/Swan
invariant and prime-to-coefficient global residual conductor on the actual
Tate-module and torsion representations. For an elliptic curve E over a number
field and a prime ell, define the elliptic residual-conductor wrapper to be the positive generator over ℚ of the supplied conductor of E[ell];
over a number field use the supplied conductor ideal itself. Its local exponent
at p≠ell is exactly codim(E[ell]^I_p)+Sw(E[ell]), by the supplied definition,
and it has no factor above ell. No raw reduction is semisimplified in this
wrapper. For the irreducible E[ell] used in level lowering, semisimplification
leaves it unchanged.

- The wrapper agrees with the supplied conductor, as an ideal and, over ℚ, by its positive generator.
- At p≠ell it has the supplied local exponent; isomorphic torsion representations give equal conductors.
- It is prime to ell and is unchanged by extension of the residual coefficient field.

**Checks.**

- At good reduction, dim(E[ell]^I_p)=2 and Sw=0, giving exponent 2−2+0=0.
- A split Tate curve at p≠ell with parameter valuation ell has rational-Tate-module exponent 1 and residual exponent 0; these conductors differ.
- For odd ell, the residual cyclotomic character is unramified away from ell, so its prime-to-ell conductor is 1 although it ramifies at ell. This tests exclusion of the coefficient prime.
- A nontrivial tame unipotent inertia action on a residual plane has a one-dimensional fixed space and Sw=0, giving exponent 1; the semisimplification of that inertia action has exponent 0 and cannot replace it.

Consume EllipticCurves Layer 8's semistable algorithmic–Artin comparison.
The local work here is the multiplicative residual-discriminant formula:
for odd prime ell and residue characteristic different from ell, the wrapper's
exponent is 0 when ell divides the minimal discriminant valuation and 1
otherwise. Specialize to both Frey families and their deletion-level comparison.
Over ℚ prove the elliptic wild bounds f₂≤8 and f₃≤5; odd semistable
rational-Tate-module exponents are 0 or 1. Split and nonsplit multiplicative
reduction both have elliptic exponent 1.
(BS20, §2, equation (3), pp. 358–359; §3.2, Lemmas 3.4–3.5, pp. 362–363.)

Consume `gap:weight-two-lowering`: for E/ℚ and odd prime ell with
irreducible E[ell], use the deletion level M₀ of BS20 equation (3).
Prove the good-prime trace congruence at p∤ell M M₀ and
the removed-prime trace congruence at p∤ell M₀ with p exactly dividing M;
the latter congruence is p+1≡±cₚ modulo the chosen coefficient prime λ.
The prime-to-ell conductor comparison retains the supplier’s good or finite-flat
multiplicative coefficient-prime hypotheses. (BS20, Theorem 3 and Lemma 2.1,
p. 359; Theorem 4, p. 360.)

Require `gap:effective-modular-comparisons` for the full
EllipticModularityEffectiveComparisons EC.0–EC.4 contract, with its exact
hypotheses in the supplier contracts: Martin's newspace bound, the
removed-prime inequality, the exact Kraus thresholds and realization, and
the two irreducibility cutoffs. For rational progression levels use the
supplier Γ₀ index μ, F_K, G_K and H_K, with the same trivial-character
newspace dimension. The specialization to the deletion level and the
coefficient-prime bridge is the work of §§1.7–1.12 here.
(Kraus1997, §3.1, Théorème 4, p. 1144; BS20, §2, equations (4)–(5)
and Theorem 4, pp. 359–360; Lemmas 3.3, 3.5, pp. 362–363.)

**Checks.**

- μ(0)=0, μ(1)=1 and μ(4)=6; an empty prime product is 1.
- N=1 with g₀⁺(1)=0 gives F_K(1)=1, G_K(1)=4 and H_K(1)=4; replacing the maximum by the first term loses the dyadic constraint.
- N=11 with g₀⁺(11)=1 gives μ(11)=12, μ(44)=72 and H_K(11)=169; replacing the newspace by a Γ₁ space changes this value.

*Needs:* EllipticCurves Layers 2–4 and Layer 8’s semistable conductor comparison; EtaleCohomologyFoundations §F.4.0; ArithmeticGaloisRepresentations §1.9 and §§3.1–3.3; `gap:newform-galois`, `gap:elliptic-modularity`, `gap:weight-two-lowering`; WeightsInEtaleCohomology R34.5–R34.6; ModularForms Layers 2–4, 8 and 10; `gap:effective-modular-comparisons` (EC.0–EC.4); LocalFieldsRamification Layers 3–4; Layer 0's explicit prime estimates only for the later progression level bounds.

### 1.2 Progression Frey specialization

Define the triple gcd as g, the normalized coefficient triple as (a,b,c), and the first Frey curve as E below.

For integer n,d and a triple (i,j,h), put t_r=n+r*d, g=gcd(t_i,gcd(2*t_j,t_h)), a=t_i/g, b=-2*t_j/g, c=t_h/g. The specialization E has coefficients a1=a3=a6=0, a2=c-a, a4=-a*c, equivalently Y^2=X(X-a)(X+c). Under S and membership in A(k), g>0 and a,b,c are nonzero pairwise coprime with a+b+c=0. This is an application adapter to the supplier Frey model, not a second generic Frey carrier.

The native five coefficients are 0,c-a,0,-a*c,0, with a,c the normalized terms. Under S and a member of A(k), g>0; g*a=t_i, g*b=-2*t_j, g*c=t_h; a+b+c=0 and every pair is coprime. The specialization equals the supplier Frey model on the normalized coefficients, under the stated normalization hypotheses.

**Checks.**

- n=1,d=1,(i,j,h)=(0,1,2) gives g=1, (a,b,c)=(1,-4,3), a2=2,a4=-3.
- n=2,d=1,(0,1,2) gives g=2, (a,b,c)=(1,-3,2), a2=1,a4=-2.
- n=-3,d=2,(0,1,2) gives (a,b,c)=(-3,2,1), a2=4,a4=3.

The helpers use integer division before casting to ℚ; under S, g>0 and the exact divisibility identities justify every displayed division by g. Normalize by the positive gcd. Use i+h=2*j and the gcd-of-terms contract. Specialize the supplier model to these coefficients and compare its native Weierstrass coefficients. Compare the progression model to the EllipticCurves worked Frey–Hellegouarch example coefficient by coefficient.

*Needs:* Layer 0 — three-term progression triples; Layer 0 — gcd of progression terms; EllipticCurves, worked Frey–Hellegouarch example; Mathlib `WeierstrassCurve`; Mathlib `Int.gcd_def`.

([BS20], Section 3.1, equations (7)-(8), p. 361; Section 3.1, display before equation (7), p. 361.)

### 1.3 First-family invariants and odd local properties

Prove the first-family invariant identities for the native invariant equalities and the separate minimality and semistability targets below.

For S and a triple in A(k), the native invariant identities are Delta(E)=16(abc)^2=64*t_i^2*t_j^2*t_h^2/g^6 and c4(E)=16(a^2-b*c), without an oddness restriction on ell. If ell is odd, prove the first-family odd local properties: E is minimal and semistable at each odd prime, and ell divides v_p(Delta(E)) for every prime p≥k. The displayed Delta is for this equation, not an arbitrary minimal change at 2.

Compute the native Weierstrass discriminant and c4 by polynomial algebra. Pairwise coprimality forces c4 a unit whenever an odd prime divides Delta; use the supplier minimal/multiplicative criterion. At p≥k the gcd is a unit and the large-prime valuations are multiples of ell.

*Needs:* Layer 1 — progression frey specialization; Layer 0 — large-prime valuation divisibility; EllipticCurves Layer 4; Mathlib `WeierstrassCurve.Δ`; Mathlib `WeierstrassCurve.c₄`.

([BS20], Lemma 3.2 discriminant display, p. 361; native normalization; Lemma 3.2, p. 361; Lemma 3.2 last conclusion, p.361.)

### 1.4 Progression generalized Fermat identities

Prove the generalized Fermat identities with the hypotheses and conclusions below.

For any integers i1<i2<i3, (i3-i2)t_i1+(i1-i3)t_i2+(i2-i1)t_i3=0. Under signed factorization substitute t_i=A_i*z_i^ell. For a triple in A(k) this is A_i*z_i^ell-2*A_j*z_j^ell+A_h*z_h^ell=0.

Expand t_i=n+i*d, cancel n and d terms, then substitute the signed factor equalities. No generalized-Fermat theorem is assumed.

*Needs:* Layer 0 — signed small-prime factorization; Layer 0 — three-term progression triples.

([BS20], Section 3.1, display before equation (7), p. 361; §3.1 opening, p. 361.)

### 1.5 Equal-sum second Frey family

Define the endpoint product A, the middle product B and the second Frey curve by A, B and the displayed native model below.

For q=(j1,i1,i2,j2) define A=t_j1*t_j2, B=t_i1*t_i2 and the integer kappa=j1*j2-i1*i2. The native Weierstrass model has coefficients 0,2*kappa*d,0,kappa*A,0. For q in I(k), A-B=kappa*d^2, kappa<0 and |kappa|<k^2. Signed factor substitution gives A_j1*A_j2*(z_j1*z_j2)^ell-A_i1*A_i2*(z_i1*z_i2)^ell=kappa*d^2.

The coefficients are 0,2*kappa*d,0,kappa*A,0. Membership in I(k) implies A-B=kappa*d^2 and kappa<0. Its native affine equation is Y^2=X*(X^2+2*kappa*d*X+kappa*A).

**Checks.**

- n=d=1,q=(0,1,1,2) gives kappa=-1,A=3,B=4,a2=-2,a4=-3.
- n=-3,d=2,q=(0,1,1,2) gives kappa=-1,A=-3,B=1,a2=-4,a4=3.
- At n=d=1,q=(0,1,1,2) the second a2 is -2, while the first model on (0,1,2) has a2=2.

Use the equal-sum cancellation to obtain the quadratic identity. This second curve is source-specific and is not a generic replacement elliptic-curve carrier. Its invariants are obtained by the native coefficient formulas.

*Needs:* Layer 0 — equal-sum progression quadruples; Layer 0 — signed small-prime factorization; Mathlib `WeierstrassCurve`.

([BS20], Section 3.2, equations (11)-(13), p. 362; Equation (11), p. 362.)

### 1.6 Second-family invariants and local tests

Prove the second-family invariant identities for the two invariant identities below and the separate local reduction targets under their stated prime conditions.

For all integers n,d and q in I(k), the native invariant identities are Delta(E_q)=-64*kappa^3*A^2*B and c4(E_q)=16*kappa*(4*kappa*d^2-3*A). Under S with odd ell prove the second-family large-prime local properties: at prime p≥k with p not dividing kappa the model is minimal and semistable and ell divides v_p(Delta). Prove the second-family half-interval local properties in the separate Lemma 4.1 branch q=(i,i+1,i+p-1,i+p) with k/2<p≤k, p≥5, p not dividing d and both endpoint terms divisible by p, one has p|A, p not dividing B*kappa*d, ell|v_p(A), c4 a p-unit and positive Delta valuation divisible by ell; thus reduction is minimal multiplicative there.

Compute invariants using A-B=kappa*d^2. For p≥k use gcd and large valuations. For the half-interval two-term branch use unique or paired term valuations from the product equation and p-unit d, gaps p-1,1; prove the c4 unit directly. Do not invoke the p≥k statement at p<k.

*Needs:* Layer 1 — equal-sum second frey family; Layer 0 — gcd of progression terms; Layer 0 — large-prime valuation divisibility; EllipticCurves Layer 4.

([BS20], Lemma 3.4, p. 362; Lemma 3.4 last conclusion, p.362; §4 second case, p.364.)

### 1.7 First-family reduced-level bounds

Prove the first-family reduced-level theorem with the hypotheses and conclusions below.

For S, ell≥7 and a in A(k), the irreducible residual representation of E_a occurs in a weight-two newform at the deletion level M_a. M_a divides 2^8*A_i*A_j*A_h, its odd part is squarefree, M_a divides 2^7*product over primes q≤k of q, and M_a≤2^7*exp(1.000081*k). No identification with the prime-to-ell residual conductor is implicit.

Import the uniform full-two-torsion irreducibility cutoff and modular level lowering. Delete odd multiplicative primes whose Delta valuation is divisible by ell. Odd local exponents are zero or one; use the exact wild bound at 2. Apply the supplier explicit Chebyshev upper bound at x=k.

*Needs:* Layer 1 — first-family invariants and odd local properties; Layer 0 — signed small-prime factorization; Layer 1, rational-isogeny classification consequences; Layer 1, modular level lowering; Layer 1, Artin-conductor interface; Layer 0, explicit prime estimates.

([BS20], Lemma 3.3, equation (9), and proof, pp. 361-362; Lemma 3.3 and proof, pp. 361-362; Proof of Lemma 3.3, p.362.)

### 1.8 Second-family reduced-level bounds

Prove the second-family reduced-level theorem with the hypotheses and conclusions below.

For S, ell≥11 and q in I(k), E_q has irreducible residual representation realized by a weight-two newform at deletion level M_q, with M_q dividing 2^7*3^5*kappa^2*product over primes r≤k of r^2 and M_q≤2^7*3^5*k^4*exp(2.000162*k).

Use the rational-two-torsion irreducibility cutoff. Apply level lowering with the second local tests. Keep wild factors at 2 and3 and the kappa^2 exceptional factor; use |kappa|<k^2 and Chebyshev bound.

*Needs:* Layer 1 — second-family invariants and local tests; Layer 1, rational-isogeny classification consequences; Layer 1, modular level lowering; Layer 1, Artin-conductor interface; Layer 0, explicit prime estimates.

([BS20], Lemma 3.5 and proof, p. 363; Proof of Lemma 3.5, p.363.)

### 1.9 Half-interval primes divide the difference

Prove `half_primes_divide_d` under the hypothesis H below.

Under H every prime p in (k/2,k] divides d.

Suppose p does not divide d. One or two terms are divisible by p. Choose a first-family triple containing the unique term, or the source equal-sum quadruple for two terms. Prove minimal multiplicative reduction and deleted p; p differs from ell. Apply the exact removed-prime norm bound to M_a or M_q. The exponential level bounds contradict ell>exp(10^k), using the numerical range k≥10^8.

*Needs:* Layer 1 — first-family reduced-level bounds; Layer 1 — second-family reduced-level bounds; Layer 1 — second-family invariants and local tests; Layer 1, removed-prime norm bound — removed prime bound.

([BS20], Lemma 4.1, p. 364.)

### 1.10 Serre-weight and residual-conductor bridge

Prove the coefficient-prime bridge with the hypotheses and conclusions below.

Under H and a in A(k), E_a[ell] is irreducible of Serre weight 2, its prime-to-ell Artin conductor equals the deletion level M_a, and ell does not divide M_a.

The level bound places ell above all level primes. At ell, use the good or finite-flat multiplicative case of coefficient-prime weight-two lowering, justified by the large-prime discriminant divisibility. Match every local conductor exponent with the deletion level. This is a real theorem, not an equality assigned by definition.

*Needs:* Layer 1 — first-family reduced-level bounds; Layer 0 — large-prime valuation divisibility; §1.1 `gap:weight-two-lowering` with its coefficient-prime hypotheses; Layer 1, Artin-conductor interface.

([BS20], §2, Theorem 4, p. 360; §3.1, Lemmas 3.2–3.3, pp. 361–362; §5, Lemma 5.1, p. 365. The weight and conductor comparison is the adapter between these results.)

### 1.11 Kraus threshold for progression levels

Prove the progression Kraus threshold bound with the hypotheses and conclusions below.

Under H and a in A(k), mu(M_a) and mu(lcm(M_a,4)) are at most 2^8*log(k)*exp(1.000081*k), and the exact Kraus threshold H_K(M_a) is less than exp(10^k). Here mu is the Gamma0 index and the dimension in H_K is the trivial-character newspace dimension.

Use the primorial divisibility and the explicit totient ratio bound. Combine the resulting mu bounds with the supplier Martin newspace inequality and exact Kraus F,G,H definitions; compare their logarithms to 10^k. Do not use the full Gamma1 dimension.

*Needs:* Layer 1 — first-family reduced-level bounds; Layer 1, Kraus threshold functions — kraus f; Layer 1, Kraus threshold functions — kraus g; Layer 1, Kraus threshold functions — kraus h; Layer 0, explicit totient and divisor bounds.

([BS20], Proof of Lemma 5.1, p. 365 (Tenenbaum Theorem 9 and following remark).)

### 1.12 Actual comparison elliptic curve

Prove the comparison-curve theorem with the hypotheses and conclusions below.

Under H, for every a in A(k) there exists an actual elliptic curve F_a/Q with full rational two-torsion, conductor exactly M_a and residual representation at the same prime ell isomorphic to that of E_a. All subsequent choices use one such F_a for each triple.

Apply the Kraus realization theorem with the coefficient-prime bridge, irreducibility and the strict threshold just proved. Fix a choice only after proving existence. A free natural-number field called conductor is not an admissible substitute for the native invariant.

*Needs:* Layer 1 — serre-weight and residual-conductor bridge; Layer 1 — kraus threshold for progression levels; Layer 1, Kraus realization.

([BS20], Lemma 5.1, p. 365.)

### 1.13 Good reduction and forced trace zero

Prove the good-reduction and trace comparison with the hypotheses and conclusions below.

Under H, a in A(k), and prime k/2<p≤k, both E_a and its chosen F_a have good reduction at p and their integer Frobenius traces agree. If p is 3 modulo 4, that common trace is zero and F_a has supersingular reduction. Trace zero implies the supersingular criterion here because p≥5; the geometric definition is not replaced by trace zero in all characteristics.

p|d and gcd(n,d)=1 imply every term is a p-unit, hence good reduction for the first model. The level bound gives good reduction of F_a. Residual congruence together with the Hasse bounds and ell>4*sqrt(p) makes the integer traces equal. Reducing the first model with d=0 modulo p gives a twist of Y^2=X(X-1)(X+1), whose trace vanishes for p≡3 mod 4.

*Needs:* Layer 1 — actual comparison elliptic curve; Layer 1 — half-interval primes divide the difference; Layer 1 — first-family invariants and odd local properties; EllipticCurves Layer 3; Layer 1, modular level lowering; Tau Ceti `WeierstrassCurve.frobeniusTrace`.

([BS20], Lemma 5.2, first conclusion, pp. 365-366; Lemma 5.2, second conclusion, pp. 365-366.)

### Examples

At n=d=1 the first model has coefficients (0,2,0,−3,0), while the equal-sum model has (0,−2,0,−3,0). At n=2,d=1 the positive gcd is 2, giving normalized coefficients (1,−3,2).

### Dependencies

Layer 0; `gap:effective-modular-comparisons` (EC.0–EC.4); WeightsInEtaleCohomology R34.5–R34.6; EllipticCurves Layers 2–4, 8 and its worked Frey example; ModularForms Layers 2–4, 8 and 10; EtaleCohomologyFoundations §F.4.0; ArithmeticGaloisRepresentations §1.9 and §§3.1–3.3; LocalFieldsRamification Layers 3–4. Explicit numerical level bounds additionally use the general prime estimates of Layer 0; their proof is independent of the Frey application.

## Layer 2: Legendre cases and the simultaneous character family

Partition the six Legendre parameters by -Q^2 union2Q^2. Prove the application-specific nonsquare test at primes 3 mod 8, positive normalization lambda=2t^2 and 1-lambda=2v^2 in CaseII, and the tv square test at primes 5 mod 8 using the order-four witness from this layer. Exclude complex multiplication of the progression Frey curve. Under k≥2*10^10 construct one fixed family of primitive quadratic characters of conductors N_a with squarefree nontrivial odd part dividing M_a and absolute von-Mangoldt half-interval sum greater than 0.1239k. Both cases must give all conclusions for the same character; positivity of the signed sum is not assumed.

### 2.1 Native Legendre and residual-image interfaces

For a field K of characteristic different from 2, use the ordinary native
Legendre model F_λ supplied by MordellLawrenceVenkatesh §6.4 and its smooth
family from ModularCurves §4C. Specialize the native quadratic twist at
(t,n)=(0,−D/4) to obtain G_(D,λ), with coefficients
(0,−D(1+λ),0,D²λ,0) and equation y²=x(x−D)(x−Dλ).
Require `gap:legendre-character-interfaces` (LG.0) for this specialization,
including D=0 and λ=0,1; elliptic applications
require D≠0 and λ≠0,1. The scale-two model is F′_λ=G_(2,λ).
(BS20, §6, equation (17), p. 367, and Lemma 6.6, p. 371.)

- Its discriminant specializes to 16D⁶λ²(λ−1)²; over K ellipticity is equivalent to D≠0 and λ≠0,1.
- D=1 gives F_λ and D=2 gives F′_λ with coefficients (0,−2(1+λ),0,4λ,0).
- Replacing D by D·u² for u≠0 gives an isomorphic curve; the map from G_(D,λ) to G_(D·u²,λ) is (x,y)↦(u²x,u³y).

**Checks.**

- At λ=1/2, Δ(F_λ)=1 and Δ(F′_λ)=64; the scale contributes 2⁶.
- D=0 or λ=0,1 gives discriminant 0, and none is admitted in a halving claim.
- Over ℚ, D=3,λ=−1 gives x(x−3)(x+3)=x³−9x. Its root differences are ±3,±6; none is 2u² for rational u≠0, so full rational two-torsion does not imply a scale-two presentation.

After discharge of `gap:legendre-character-interfaces`, extend LG.0's rational full-two-torsion
adapter to every field K of characteristic different from two: every elliptic E/K with full K-rational
two-torsion is K-isomorphic to some G_(D,λ) with D≠0 and λ≠0,1.
After completing the square, write the cubic roots as e₀,e₁,e₂, translate
x by e₀ and put D=e₁−e₀, λ=(e₂−e₀)/D. Record all six labelled orderings:
λ,1/λ,1−λ,1/(1−λ),λ/(λ−1),(λ−1)/λ, using LG.0's labels and the corresponding D for each
ordering: D,Dλ,−D,D(λ−1),D(1−λ),−Dλ, respectively.
Labels remain distinct when parameter values coincide.
Require `gap:legendre-character-interfaces` (LG.1): for a rational full-two-torsion
curve semistable away from 2, λ
and 1−λ are units at every good odd prime, and each squareclass
ωλ, ω∈{±1,±2}, has odd character conductor dividing the elliptic conductor.
Use ClassicalArithmeticCompletion §1.51 for the squareclass character.
(BS20, §6, Lemma 6.2 and its proof, pp. 367–368.)

At such a prime choose a p-unit representative δ_p of the unramified twist
class. Require LG.5 in `gap:legendre-character-interfaces` to transport the native
projective traces by
 a_p(E)=(δ_p/p)a_p(F_λ), a_p(F′_λ)=(2/p)a_p(F_λ).
Thus trace zero is preserved by either twist; equality of arbitrary nonzero
traces is not asserted. In the progression application E=F_a, use the same
chosen comparison curve of §1.12 in every ordering and reduction.
(BS20, Lemmas 6.4 and 6.6, pp. 368, 371.)

Require LG.2's split-cubic descent and halving contract in
`gap:legendre-character-interfaces` and LG.3's prime-field subgroup theorem. Extend the latter
to every finite field of odd characteristic: for square λ≠0,1, prove that
the ordinary curve F_λ has a subgroup isomorphic to ℤ/2ℤ×ℤ/4ℤ.
If −1 is square, (0,0) is 2-divisible; otherwise one of 1−λ and λ−1
is square, and (1,0) or (λ,0) is 2-divisible. This assertion is about F_λ.
Consume LG.3's assertion that 8 exactly divides #F₋₁(𝔽_p) for primes p≡5 mod 8.
(BS20, Lemmas 6.3 and 6.5, pp. 368, 370; the square −1 branch gives the
remaining odd finite fields.)

**Checks.**

- λ=2 has six labels but only the values 2,−1,1/2; replacing labels by a six-element set fails.
- Over 𝔽₅ at λ=4, F_λ has eight projective points and trace −2; F′_λ has only O,(0,0),(2,0),(3,0), hence trace 2 and no subgroup of order eight. Its other right-hand sides, at x=1,4, are 2,3, both nonsquares.
- Over 𝔽₅ the ordinary λ=−1 curve has eight points, with 8 dividing the count and 16 not dividing it; over 𝔽₃ it has four points, outside the p≡5 mod 8 assertion.
- Over 𝔽₇ at λ=2, an ordinary square parameter, the count is eight; over 𝔽₃ at λ=2 the parameter is nonsquare and the count is four.

Require LG.4's Case-II order-four
witness: for a field of characteristic different from 2, nonzero t,v with
2t²+2v²=1 and i²=−1, on y²=x(x−2)(x−2λ), λ=2t², the point
(2λ+4itv,8itv(t+iv)) doubles to (2λ,0). Consume its native descent-coordinate
identities and use them for the progression obstruction when tv is nonsquare
at p≡5 mod 8. Consume LG.5's symmetric-cubic trace-zero theorem for every
odd prime p≡3 mod 4 and nonzero twist, together with its model-specific
twist/trace comparisons at good primes. (BS20, Lemmas 6.4–6.6,
pp. 368–372, especially the Case-II point calculation on pp. 371–372.)

**Checks.**

- t=v=1/2 and λ=1/2 give the point (1+i,−1+i) on y²=x(x−2)(x−1); both sides equal −2i.
- The parameters 0 and 1 make the scaled Legendre model singular, while λ=1/2 gives nonzero discriminant; using a Legendre model without the scale two changes these values.
- Its double is (1,0), not the identity; the point has exact order four in characteristic zero.
- At p=3 the symmetric curve has trace 0; its trace and the geometric supersingular criterion are compared only within their stated characteristic ranges.

Require the EC.5 surjectivity contract in `gap:effective-modular-comparisons`
(Lemos2017v2, Theorem 1.1, p. 2). Prove the CM half-parameter image theorem: for the CM λ=1/2
model the same residual image lies in the normalizer of its CM Cartan and
is proper at ell>37; specify the CM field, its torsion action and the
conjugacy comparison under residual isomorphism. Integrality of CM j is
consumed from ImaginaryQuadraticClassNumber H3.1. These statements concern
actual torsion representations. (BS20, §6, final Case-II argument and
the rational-isogeny surjectivity result cited there, p. 373, and its cited Lemos theorem.)

*Needs:* ModularCurves §4C; MordellLawrenceVenkatesh §6.4; `gap:legendre-character-interfaces` (LG.0–LG.5); Tau Ceti `WeierstrassCurve.quadraticTwistOf` and its point-equivariance comparison; EllipticCurves Layers 2–5 and Layer 6, the `x − θ` Kummer map and its kernel 2E(K); `gap:effective-modular-comparisons` (EC.5); Layer 1 modular comparison; ClassicalArithmeticCompletion §1.51; ImaginaryQuadraticClassNumber H3.1.

### 2.2 Legendre case partition

Define membership in −ℚ²∪2ℚ² by (∃t∈ℚ,u=−t²) or (∃t∈ℚ,u=2t²), including zero. Define the Legendre case partition by the two finite sets below.

Given k and finite parameter sets L_a of rational numbers for a in A(k), form CaseI={a: some lambda in L_a is neither minus a rational square nor twice a rational square} and CaseII=A(k) minus CaseI. In the application L_a is the six-parameter set of the same chosen F_a, constructed by the native Legendre interfaces of this layer. Both cases are disjoint and exhaust A(k).

- Membership in CaseI is equivalent to membership in A(k) and the stated existential nonsquare condition; membership in CaseII is equivalent to membership in A(k) and every parameter being in -Q^2 union2Q^2.
- The union of the two components is A(k) and they are disjoint.
- Pointwise equal finite parameter sets give equal partitions.

**Checks.**

- k=3 and L_a={3} put the unique triple in CaseI, not CaseII.
- k=3 and L_a={-1} put the unique triple in CaseII.
- 2 lies in the twice-square branch, and constant parameter sets {2} put A(3) wholly in CaseII; omitting that branch fails.
- Zero lies in both branches; 3 lies in neither.
- k=0 gives two empty sets for every parameter assignment.

Filter A(k) by the explicit rational-square predicate and take the relative complement. Use the native Legendre interfaces of this layer, retaining all six labelled root orderings.

*Needs:* Layer 0 — three-term progression triples; Layer 1 — actual comparison elliptic curve; Layer 2, native Legendre interfaces.

([BS20], §6, p. 367.)

### 2.3 Case-I nonsquare and absolute projection

Prove the Case-I character projection with the hypotheses and conclusions below.

Under H, every associated Legendre parameter lambda is a nonsquare modulo every prime k/2<p≤k with p = 3 mod 8. Under H⁺, a CaseI parameter lies outside all four squareclasses ±Q^2,±2Q^2. The primitive characters of lambda,-lambda,2lambda,-2lambda have mod8 projection mu1-mu2-mu3+mu4=4*(lambda/p) at p = 3 mod 8 and zero otherwise, away from support. One of the four therefore has absolute prime-weighted sum at least (1-3*0.002811)*k/8 and nontrivial odd conductor. The absolute values are printed in equation (21) and Proposition 6.1, equation (16).

Transfer a_p(F_a)=0 to a_p(F_λ)=0 using the unramified twist sign of §2.1. Thus #F_λ(𝔽_p)=p+1≡4 mod 8 at p≡3 mod 8. A square λ would give the ordinary-model subgroup ℤ/2ℤ×ℤ/4ℤ, contradicting that count. The mod8 classes rule out the other excluded squareclasses. Apply the explicit theta(x;8,3) error bound at k and k/2. The triangle inequality bounds the maximum absolute sum by a quarter of the absolute signed combination.

*Needs:* Layer 2 — legendre case partition; Layer 1 — good reduction and forced trace zero; ClassicalArithmeticCompletion §1.51 — quadratic character of a squareclass; Layer 0, explicit prime estimates; Layer 2, native Legendre interfaces.

([BS20], Lemma 6.4, p. 368; §6, Case I, equations (19)–(21), p. 369; Equation (21), p.369.)

### 2.4 Case-II positive normalization and square test

Prove the positive Case-II normalization with the hypotheses and conclusions below.

Under H and CaseII one can choose lambda=2*t^2 and 1-lambda=2*v^2 with positive rational t,v, so 2*t^2+2*v^2=1. For each prime k/2<p≤k with p = 5 mod 8, t and v are p-units and the Legendre symbol of t*v is +1.

Use the six-parameter transformations to place lambda in(0,1) and both lambda,1-lambda in2Q^2. At p≡5 mod 8, §1.13 gives a_p(F_a)=a_p(E_a), and the first-family reduction gives a_p(E_a)=±a_p(F₋₁). The arbitrary twist adapter then gives a_p(F_λ)=±a_p(F_a), while a_p(F′_λ)=(2/p)a_p(F_λ)=−a_p(F_λ). Hence either sign ±a_p(F₋₁) is retained for F′_λ. If tv were nonsquare, the order-four witness and native halving criterion give a subgroup isomorphic to ℤ/2ℤ×ℤ/8ℤ. Its order 16 would divide #F′_λ(𝔽_p)=p+1±a_p(F₋₁). By the minus-one two-primary point-count theorem, 8 exactly divides p+1−a_p(F₋₁); since p≡5 mod 8, a_p(F₋₁)≡6 mod 8 and 4 exactly divides p+1+a_p(F₋₁). Neither possible count is divisible by 16.

**Checks.**

- the point-count comparison over 𝔽₅: over 𝔽₅ the symmetric curve has eight points and its twist by the nonsquare 2 has four; neither count is divisible by 16. The symmetric trace is −2 and the twist trace is 2, in agreement with the §2.1 twist sign.

*Needs:* Layer 2 — legendre case partition; Layer 1 — good reduction and forced trace zero; Layer 2, native Legendre interfaces.

([BS20], Lemma 6.6, pp. 371-372; §6 before (22), p. 370.)

### 2.5 CM exclusion for progression Frey curves

Prove the non-CM theorem for progression Frey curves with the hypotheses and conclusions below.

Under H, the native elliptic curve E_a is not CM, for every a in A(k). Its j-invariant is 2^8*(a^2-b*c)^3/(a*b*c)^2. Integral j and pairwise coprimality would force each of a,b,c to be a signed power of 2; the relation a+b+c=0 forces two to be equal. The resulting index equations imply d=0 or d divides3, contrary to H and the half-prime-divisibility theorem.

Import algebraic integrality of CM j-values and deduce integer j for rational j. At an odd divisor of abc the numerator is a unit, contradicting integrality. Classify the elementary signed powers-of-two relation and use gcd(n,d)=1 and index bounds. The contradiction uses at least one prime in the half interval, supplied by the explicit prime estimate.

*Needs:* Layer 1 — first-family invariants and odd local properties; Layer 1 — half-interval primes divide the difference; ImaginaryQuadraticClassNumber H3.1; Layer 0, explicit prime estimates; Mathlib `WeierstrassCurve.j`.

([BS20], §6 final Case-II proof, p. 373.)

### 2.6 Case-II conductor exclusion and projection

Prove the Case-II character projection with the hypotheses and conclusions below.

Under H⁺ and CaseII choose a character from the four squareclasses omega*t*v, omega in{±1,±2}. One has absolute prime-weighted sum at least (1-3*0.002811)*k/8; its odd conductor divides M_a and is not 1. If odd conductor were1, tv is a square or twice a square; parity excludes the latter, quartic descent forces lambda=1/2, and the CM residual image versus non-CM surjectivity at ell>37 contradicts the residual comparison.

Project to primes 5 mod 8 using the previous square test and the explicit theta(x;8,5) estimate. Use Legendre parameter valuation and conductor support. Clear denominators primitively in2t^2+2v^2=1. Apply the exact T^4+V^4=2U^2 descent theorem, not FLT4. Import the CM normalizer image and the rational-isogeny surjectivity theorem, then use the same residual comparison.

*Needs:* Layer 2 — case-ii positive normalization and square test; Layer 2 — cm exclusion for progression frey curves; Layer 1 — actual comparison elliptic curve; ClassicalArithmeticCompletion §1.51 — quadratic character of a squareclass; ClassicalArithmeticCompletion §4.41; Layer 2, residual-image comparison; Layer 0, explicit prime estimates; Layer 2, native Legendre interfaces.

([BS20], §6 Case II, pp. 372–373; §6 Case II first paragraph, p.372.)

### 2.7 Simultaneous quadratic character family

Prove the simultaneous character-family theorem with all the conclusions below,
including divisibility by the deletion level M_a for the same chosen character.

Under H⁺ choose for every a in A(k) one pair (N_a,chi_a), with N_a>1 and chi_a a native primitive real quadratic character modulo its conductor N_a. The same choice simultaneously has: |sum over integers k/2<m≤k of chi_a(m)*Lambda(m)|>0.1239*k; N_a^odd squarefree, N_a^odd dividing M_a and A_i*A_j*A_h, N_a^odd≠1; and N_a≤8*N_a^odd. N_a is the actual native character conductor, not a freely assigned modulus.

- For every a, chi_a.IsPrimitive and chi_a.conductor=N_a; it is quadratic and real.
- The absolute half-interval von-Mangoldt sum is strictly greater than 0.1239*k.
- N_a^odd is squarefree, divides both M_a and A_i*A_j*A_h, and N_a≤8*N_a^odd.
- N_a^odd≠1, hence N_a>1 and chi_a is not the principal character.

**Checks.**

- Under H⁺, at every triple chi_a(1)=1.
- Under H⁺, chi_a(0)=0 and N_a>1; the principal modulus1 character cannot be selected.
- Under H⁺, each selected pair satisfies both the large absolute sum and the odd-support bound; selecting different pairs for the two properties does not meet the contract.

Use the exhaustive partition and the respective four-character constructions. The primitive squareclass character gives the exact conductor and dyadic bound. Convert prime sums to von-Mangoldt sums by the effective prime-power tail; the strict numerical margin is0.000045875*k. Fix one finite family only after all its simultaneous conclusions hold.

*Needs:* Layer 2 — case-i nonsquare and absolute projection; Layer 2 — case-ii conductor exclusion and projection; Layer 1 — first-family reduced-level bounds; ClassicalArithmeticCompletion §1.51 — quadratic character of a squareclass; ClassicalArithmeticCompletion §1.51 — odd part of a quadratic conductor is squarefree; ClassicalArithmeticCompletion §1.51 — two adic conductor bound; Layer 0, explicit prime estimates; Mathlib `DirichletCharacter.conductor`; Mathlib `DirichletCharacter.IsPrimitive`; Tau Ceti `DirichletCharacter.conductor_ringHomComp` and `DirichletCharacter.isPrimitive_ringHomComp_iff` for the injective ℤ→ℝ and ℤ→ℂ comparisons; Mathlib `ArithmeticFunction.vonMangoldt`.

([BS20], Proposition 6.1 and its two-case construction, pp. 366-373; Proposition 6.1, p. 367; Proposition 6.1, p. 367; Case II exclusion, pp. 372–373.)

### Examples

The parameter −1 lies in Case II. At λ=1/2 the twist-by-2 witness is (1+i,−1+i); its equation has both sides −2i and its double is (1,0).

### Dependencies

Layers 0–1; ModularCurves §4C; MordellLawrenceVenkatesh §6.4; `gap:legendre-character-interfaces` (LG.0–LG.5); `gap:effective-modular-comparisons` (EC.5); EllipticCurves Layers 3, 5–6; ClassicalArithmeticCompletion §§1.51 and 4.41; ImaginaryQuadraticClassNumber H3.1. The numerical projections use Layer 0 prime estimates independently of the later character criteria.

## Layer 3: The original analytic contradiction criteria

Prove the progression-specific harmonic-family criterion of Proposition 7.2 for pairwise distinct largest conductor primes, P(N_a)<(log k)^(1-c1) and reciprocal mass at least 0.166, retaining effective dependence on 0<c1<1 and decay exponent min(c1,1/2). Prove the distinct-character criterion of Proposition 8.1 for more than 17 log k characters, P(N_a)≤k^(7/16) and N_a<k^c2 with c2>10. Consume the generic character PNT, exceptional-zero repulsion, the small-conductor zero-exclusion requirement, pairwise smooth-modulus cancellation and Bombieri-Selberg inequality. Apply the exact diagonal/off-diagonal bounds and the margin 1/68<0.1239^2.

### 3.1 General effective analytic inputs

Define the weighted half-interval sum W(k,value) by ∑_(floor(k/2)<m≤k) value(m)Λ(m). Prove additivity of the weighted half-interval sum, its value at the zero weight and its compatibility with the prime sum plus the prime-power tail.

**Checks.**

- At k=0 the interval is empty and the sum is 0.
- At k=2 with value identically 1, the result is log 2; the upper endpoint is included.
- At k=1 with value identically 1, the result is 0 since Λ(1)=0; treating 1 as a prime gives a wrong weight.
- W(4,1)=log 3+log 2: the contribution of 4 is log 2, not zero.

Use AnalyticNumberTheoryPartI §0.1's exceptional-real-zero predicate with one
effective c* satisfying 0<c*<log 2 and the supplier's width comparison.
For primitive nonprincipal real quadratic χ of conductor N>1, it asserts a
real zero β with 1−c*/log N<β<1. Sections 0.1 and 0.17 supply uniqueness,
simplicity and two-zero repulsion; §0.24 supplies N₂>N₁² for distinct
exceptional conductors. Iterating gives Nⱼ≥N₁^(2^(j−1)), strictly for j≥2.
Consume §0.18's effective PNT and its exceptional-zero alternative for
sufficiently large X, retaining its effective absolute threshold.
(BS20, §7, equations (23)–(26), pp. 373–374.)

The harmonic application additionally requires gap:small-conductor-zeros:
no primitive nonprincipal real quadratic conductor 1<N<400000 has a zero
in this same exceptional interval. It is the zero-exclusion component of
AnalyticNumberTheoryPartI §0.7's BMORFiniteInput, still a hypothesis there.
All unconditional uses in §§3.2, 4.8 and 6.2 require its discharge; the
class-number and regulator components needed for the constant 40 are separate
obligations in gap:numerical-zero-inputs. No GRH premise is used.
(BS20, proof of Proposition 7.2, pp. 375–376.)

Prove the smooth-modulus character-sum bound: for r≥1, positive integer moduli
q₁,…,qᵣ, complex Dirichlet characters πᵢ modulo qᵢ, q=q₁>1 squarefree,
π₁ primitive and gcd(q,q₂⋯qᵣ)=1, every integer M and positive real R with
R≥max(q₂,…,qᵣ,q^(1/4))*q^(5/4) satisfy
|∑_(m∈ℤ, M<m≤M+R)∏ᵢπᵢ(m mod qᵢ)|≤4R*(τ(q)^(r²)/q)^(2^(−r)).
The maximum includes q^(1/4), also when r=1; τ(q) is q.divisors.card,
and all fractional powers are real. (BS20, Theorem 6, pp. 376–377;
IwaniecKowalski2004, Theorem 12.13.) Distinctness in
the smooth-character correlation bound means inequality of the pulled-back functions
ℤ→ℝ, so it is meaningful at different conductors.

Prove the finite Gram inequality over any real or complex inner-product
space and every finite vector family (BS20, Theorem 7, p. 379): for vectors y_a and x, ∑_a |⟨x,y_a⟩|²≤‖x‖²·max_a∑_b|⟨y_a,y_b⟩|,
with the empty family giving 0 and a nonempty family for the displayed maximum.
Equivalently, for every nonnegative real C bounding every Gram row sum, the left
side is at most C‖x‖², including an empty family. Separate its diagonal and
off-diagonal terms. Prove the smooth-character correlation bound:
for fixed c₂>0 there are effective c₃>0 and K such that for k≥K,
distinct primitive quadratic characters with positive conductors N₁,N₂≤k^c₂ and
largest prime factors at most k^(7/16) satisfy
|∑_(k/2<m≤k)χ₁(m mod N₁)χ₂(m mod N₂)|≤k^(1−c₃). Use the smooth-modulus character-sum bound, the coprime-character product and exclusion
identities, bounded CRT blocks and finite differencing before this specialization.
The ambient product modulus and primitive product conductor remain distinct;
principal components are retained. CRT and differencing alone do not prove the
cancellation theorem. (BS20, Proposition 8.2 and its proof, pp. 376–379;
equations (32)–(35), pp. 379–380.)

Use AnalyticNumberTheoryPartI §3.2's bound 0.94 log N<P(N) for primitive
quadratic conductors N>1, with SchoenfeldFiniteRangeInput and
QuadraticConductorFiniteInput. The dyadic part is 1,4 or 8; N=1 is excluded.
Unconditional harmonic criteria additionally require gap:numerical-prime-inputs
for these hypotheses (BS20, Lemma 7.3, p. 375).

**Checks.**

- At conductors 4 and 8, P(N)=2; at 24, P(N)=3 and 0.94 log 24<3. The last is the tight small-conductor case; replacing the dyadic part by at most 4 loses conductor 8.
- N=1 is excluded from the conductor estimate, independently of the total library convention for P(1); it cannot supply a positive logarithmic denominator.
- N=16 is not a primitive quadratic conductor; its excessive dyadic part cannot be admitted merely because its odd part is squarefree.
- For the repulsion chain j=1 gives equality, while j=2 gives strict N₂>N₁²; a one-character family cannot satisfy a strict first-index inequality.
- Two orthogonal unit vectors give Gram row sum 1 and Bessel's inequality; two equal unit vectors give row sum 2, so omitting off-diagonal terms is false.
- The principal character has a main term of order k and is excluded from a nonprincipal PNT error estimate.
- Equal characters have diagonal correlation of order k and are excluded from the strict off-diagonal power saving.

*Needs:* AnalyticNumberTheoryPartI §§0.1, 0.17–0.18, 0.24 and 3.2; `gap:small-conductor-zeros`, `gap:numerical-prime-inputs`; the smooth-modulus character-sum bound for the correlation specialization; ClassicalArithmeticCompletion §1.51 for quadratic-conductor support; Mathlib continued L-functions, finite inner-product spaces and prime arithmetic; Layer 0's explicit prime estimates and divisor-subpower bound; Layer 2 only for the progression-specific criteria that follow.

### 3.2 Harmonic smooth-conductor criterion

Prove the harmonic smooth-conductor criterion with the hypotheses and conclusions below.

For each fixed 0<c1<1 there is an effectively computable k1(c1) such that under H⁺, any finite D subset A(k) with pairwise distinct P(N_a), P(N_a)<(log k)^(1-c1) and sum over D of 1/P(N_a)≥0.166 forces k≤k1(c1). Here P is the native largest prime factor and all selected characters are nonprincipal.

For a nonexceptional character use log N<1.07*(log k)^(1-c1) and the supplier effective PNT: the error is O(k*exp(-c*(log k)^min(c1,1/2))*(log k)^4), contradicting the fixed lower bound for effective large k. If all characters are exceptional, order their conductors; repulsion gives N_j≥N_1^(2^(j-1)), strictly for j≥2. The conductor–largest-prime theorem and 1/0.94<1.07, 2/0.94<2.13 give reciprocal mass<2.13/log N_1, so N_1≤373743<400000. Use the exclusion required by gap:small-conductor-zeros; it supplies no GRH premise.

*Needs:* Layer 2 — simultaneous quadratic character family; Layer 0, explicit prime estimates; Layer 3 the largest-prime lower bound for quadratic conductors; AnalyticNumberTheoryPartI §§0.1, 0.17–0.18, 0.24 and 3.2; `gap:small-conductor-zeros`, `gap:numerical-prime-inputs`; Mathlib `Nat.maxPrimeFac`.

([BS20], Proposition 7.2, pp. 374-375; §7 proof, p.375; decay exponent for general c1; §7 proof, pp.375–376.)

### 3.3 Many smooth characters criterion

Prove the many-character criterion with the hypotheses and conclusions below.

For each c2>10 there is an effective k2(c2) such that under H⁺ any B subset A(k) with |B|>17*log k, pairwise distinct selected characters, P(N_a)≤k^(7/16) and N_a<k^c2 forces k≤k2(c2). Quantitative proof: the mean squared absolute weighted sum is at most (k*log k/2+O(k))*((k+1)/(34*log k)+k^(1-c3))=(1/68+o(1))*k^2, where c3(c2)>0 is effective.

Apply the Layer 3 finite Gram inequality to x_m=Lambda(m), y_a,m=chi_a(m) on the integer half interval. The diagonal is at most(k+1)/2, the input norm is k log k/2+O(k), and the generic smooth-modulus cancellation bound controls off-diagonal pairs by k^(1-c3). Its proof must use the product ambient modulus separately from the primitive conductor and eventual divisor subpower bounds. Compare1/68<0.1239^2; no fourth power of0.1239 enters.

*Needs:* Layer 2 — simultaneous quadratic character family; Layer 3, finite Gram inequality — bombieri diagonal offdiagonal; Layer 3, smooth-character correlation; Layer 0, explicit prime estimates; Layer 0, explicit totient and divisor bounds — eventual divisor subpower bound.

([BS20], Proposition 8.1, p. 376; Equations (32)–(35), pp. 379–380.)

### Examples

The lower coefficient is 0.1239²=0.01535121, greater than 1/68. A repeated character is a diagonal term, not an off-diagonal pair.

### Dependencies

Mathlib analytic and finite-dimensional carriers; Layer 2 for the two progression criteria. General prime and character estimates have no progression input.

## Layer 4: Thin-prime sieves and the original proof assembly

Define survivors avoiding a prime set S of reciprocal mass below 0.17 and the two open-left sieving intervals. Bound the losses, perform maximal-valuation deletion so the surviving A-product divides(k-1)!, and prove the smooth factorial bound and density of A_i≤k^139. At the certified threshold k≥exp(exp(10^7)), use the Layer 4 quantitative Roth bound to choose one triple simultaneously avoiding S, with P(N_a)≤k^(7/16), no conductor prime in((log k)^(1-10^-4),10^4log k], and N_a<k^418. The substitution 132 log(2)*10^5<10^7 certifies the Roth cutoff; the smaller 10^6 cutoff does not follow from this substitution. Build the maximal distinct-largest-prime family, prove its reciprocal-mass dichotomy and dispatch the small endpoint with c1=1/20000. This is one complete original-route reduction to an effective bound on k. The generic survivor API controls odd primes; reciprocal mass<0.17 excludes2. Include the explicit Stirling upper adapter to the native sequence and its telescoping bound.

### 4.1 Quantitative three-term progressions

Prove the numerical Roth substitution: 10⁶<132 log(2)·10⁵<10⁷, certifying the density substitution below.
Prove the quantitative three-term progression theorem: for 0<δ<1, a subset J of range(k) with
|J|≥δk and k≥exp(exp(132 log(2)/δ)) contains i<j<h with i+h=2j,
all in J. The proof supplies this displayed bound rather than an unspecified
qualitative threshold. (RahmanRoth, as quoted in BS20, §9, equation (36), p. 381; BS20, §9, Theorem 8 and its application in the proof
of Proposition 9.1, pp. 381–384.)

**Checks.**

- At density 10⁻⁵ the required log-log cutoff is 132 log(2)·10⁵, strictly between 10⁶ and 10⁷.
- A singleton has no strict three-term progression; the large-length hypothesis cannot be omitted.
- A constant triple does not satisfy the conclusion, even when its sole index lies in J.

*Needs:* Mathlib `roth_3ap_theorem_nat` for the qualitative vocabulary; the quantitative theorem of the cited source for the explicit improvement.

### 4.2 Thin-prime sieve survivors

Define Tₚᵣ, Uₚᵣ and the thin-prime survivor set by the two prime intervals and the set J below.

For n,d,k and a finite set S of primes≤k define T_pr={p prime:k^(7/16)<p≤k}, U_pr={p prime:(log k)^(1-10^-4)<p≤10^4*log k}, and J=range(k) minus the union of divisibility index sets I_p for p in S union T_pr union U_pr. Both lower endpoints are open; no integer ceiling replaces the prime predicates.

- i is in J iff i<k and none of the three forbidden prime sets divides n+i*d.
- Increasing S can only shrink J.
- Under H⁺, a triple in J has conductor N_a avoiding every odd prime in S union U_pr and P(N_a)≤k^(7/16).
- If S has reciprocal mass<0.17, it cannot contain2, so the full avoidance conclusion follows.
- Under H⁺ all primes of U_pr are odd.

**Checks.**

- For k=0 the survivor set is empty.
- At n=d=k=1 and S empty, the survivor set is {0}; an identically empty survivor definition fails this Check.
- Deleting S,T_pr,U_pr in any order gives the same finite set.
- T_pr(2)={2}; T_pr(16)={5,7,11,13}; T_pr(1) is empty. These test the actual prime membership near the lower bound. For natural k and prime p, p=k^(7/16) is impossible: it would imply 7v_p(k)=16. The interval remains open on the left.
- U_pr(0)=empty, using the total logarithm at zero.
- U_pr(1)=empty: its upper bound is zero.
- 2 belongs to U_pr(2); this tests both logarithmic bounds on an actual prime.

Form finite prime sets with explicit real bounds, then take their divisibility-index union and relative complement. The construction is total; density and conductor consequences require H⁺ and the certified numerical range. Only odd primes in the forbidden sets are excluded from N_a by the coefficient-support theorem. Its dyadic factor is bounded by8; 2≤k^(7/16) under H⁺. For the later thin-prime-set application, 2 in S would force reciprocal mass≥1/2, contradicting<0.17.

*Needs:* Layer 0 — divisibility index sets; Layer 2 — simultaneous quadratic character family.

([BS20], §9 proof, p. 382.)

### 4.3 Maximal-valuation deletion

Define the removed index for a prime p and coefficient family on J to be the least index with maximal p-valuation when J is nonempty, and 0 when J is empty. Define the valuation-deletion set as J₁ below.

For gcd(n,d)=1, nonzero terms i<k, positive coefficients A_i dividing |n+i*d| supported on primes<k, and J subset range(k), delete for every prime p<k dividing some A_i with i in J an index having maximal v_p(A_i). Break ties by the least index. The resulting J1 is a subset of J, loses at most the number of primes below k, and product over J1 of A_i divides(k-1)!. Signed factors satisfy the coefficient hypotheses.

- J1 is a subset of J and its cardinal is at least |J| minus the number of primes below k.
- Under the coefficient and primitive-term hypotheses, the product over J1 of A_i divides(k-1)!.
- For each supported prime the removed maximizer is the least among equal-valuation indices.

**Checks.**

- An empty J remains empty.
- If every A_i=1, then J1=J and its product is1.
- n=d=1,k=5,J=range(5),A=(1,2,3,4,1) gives J1={0,1,4} and product2 dividing24.
- the least maximal-valuation index is 0 on ∅, independently of the coefficients.
- On the singleton {3} with coefficient 0, the least maximal-valuation index is 3; zero coefficients do not create an empty maximizer set.
- On {2,5} with constant coefficient 1, the least maximal-valuation index is 2, testing least-index ties.
- n=d=1,k=4,J=range(4),A=(1,2,1,2) removes index1 rather than3 for the prime2.

For each prime in the finite support union take the least maximizer of the native valuation. If j is its deleted index, each remaining valuation is bounded by v_p(|i-j|), by the term-gcd bound and maximality. The product of nonzero index differences divides j!*(k-1-j)!, which divides(k-1)!. Combine prime valuations.

*Needs:* Layer 0 — gcd of progression terms; Layer 0 — signed small-prime factorization; Mathlib `padicValNat_def`; Mathlib `Nat.factorization`.

([BS20], Proof of Proposition 9.1, p. 384.)

### 4.4 Explicit Stirling upper bound

Prove the explicit Stirling upper bound with the displayed real factorial inequality.

For every natural m≥1, (m!:R)≤sqrt(2*pi*m)*(m/exp(1))^m*exp(1/(12*m)). This is the numerical adapter quoted in the source, derived from the pinned Stirling sequence rather than a second asymptotic theory.

For integers M>m≥1, sum the pinned inequality log(stirlingSeq j)-log(stirlingSeq(j+1))≤1/(12*j*(j+1)) over m≤j<M. Both sides telescope, giving log(stirlingSeq m)-log(stirlingSeq M)≤1/(12*m)-1/(12*M). Use the pinned limit stirlingSeq M -> sqrt(pi)>0 and continuity of log to pass to M -> infinity. Exponentiating gives stirlingSeq m≤sqrt(pi)*exp(1/(12*m)). Unfold the existing stirlingSeq and multiply by its positive denominator sqrt(2*m)*(m/exp1)^m. Combine positive square roots to obtain the displayed bound.

*Needs:* Mathlib `Stirling.stirlingSeq`; Mathlib `Stirling.log_stirlingSeq_sdiff_le`; Mathlib `Stirling.tendsto_stirlingSeq_sqrt_pi`.

([BS20], Proof of Proposition9.1, printed p.384, first displayed factorial bound and reference[43].)

### 4.5 Sieve losses and coefficient density

Prove the survivor-density bounds with the hypotheses and conclusions below.

Under H⁺, k≥exp(exp(10^7)) and sum over S of 1/p<0.17, the losses from T_pr,U_pr,S are at most k*log(16/7), k*log(1/(1-10^-4))+5*k*log10/loglogk+10^4*logk, and strictly less than 0.17*k+1.1*k/logk. Thus |J|>0.0032*k. Deletion gives |J1|>0.00319*k. Its smooth coefficient product is less than k^(0.44*k), and J2={i in J1:A_i≤k^139} has |J2|>10^-5*k.

Under H⁺, every prime in (k/2,k] divides d by §1.9, so I_p=∅ there. Sum the one-residue-class bound only over k^(7/16)<p≤k/2, retaining the +1 loss. The main reciprocal difference is log(16/7)+log(1−log 2/log k); the negative second term absorbs π(k/2)<0.6k/log k and the explicit reciprocal-prime errors in the certified range. Apply maximal-valuation deletion. The large-prime part of(k-1)! has log at least(9/16)*k*logk-5*k; combine the local explicit Stirling upper adapter. Markov counting with log A_i>139*logk bounds the complement of J2. The numerical range is strengthened to the certified Roth threshold. For the 0.44 bound one may instead use the weaker native (k-1)!≤k^k: subtracting the large-prime contribution gives log(product A_i)≤(7/16)*k*logk+5*k<0.44*k*logk in the certified range. The sharper Stirling adapter remains a separately covered source item.

*Needs:* Layer 1 — half-interval primes divide the difference; Layer 4 — thin-prime sieve survivors; Layer 4 — maximal-valuation deletion; Layer 0 — one-residue-class count; Layer 0, explicit prime estimates; Layer 4 — explicit stirling upper bound; Mathlib `Nat.factorial_le_pow`.

([BS20], §9 proof, pp. 382–383; §9 proof, pp. 383–384; §9 proof, p. 384; §9 end of proof, p. 384; §9 p.384, reference [43].)

### 4.6 Simultaneous thin-conductor witness

Define the thin-prime-set predicate on k,S by S consisting of primes at most k and reciprocal mass less than 0.17. The witness and its API carry k≥exp(exp(10⁷)) directly. Prove that the empty set is thin, subsets of thin sets are thin, and 2 belongs to no thin set.

Under H⁺ and k≥exp(exp(10^7)), for every finite S of primes≤k with reciprocal mass<0.17 choose one a in A(k) such that no p in S divides N_a, P(N_a)≤k^(7/16), no prime in((logk)^(1-10^-4),10^4logk] divides N_a, and N_a<k^418. All four conclusions hold for this same triple. Use the 10^7 cutoff, which follows from the quantitative Roth substitution in the integration requirements below.

The selected triple belongs to A(k) and all its indices belong to J2. Its conductor has no prime in S or in U_pr. Its largest prime factor is≤k^(7/16) and its conductor is<k^418.

**Checks.**

- At k=9, thinSet holds for ∅: the reciprocal sum is zero.
- At k=9, thinSet holds for {7}, a nonempty example.
- At k=9, thinSet fails for {2} by reciprocal mass.
- At k=9, thinSet fails for {9} by primality, despite its small reciprocal mass.
- At k=6, thinSet fails for {7} by the upper bound.
- For S empty the two nonvacuous size bounds and U_pr avoidance still hold under the stated large-k hypotheses.
- One triple satisfies the conjunction of all four properties; four independently chosen witnesses are insufficient.
- The quantitative Roth exponent needed at density10^-5 exceeds10^6 and is less than10^7; the constructor requires the certified latter threshold.

Apply the Layer 4 quantitative Roth statement to J2 with density10^-5. Its loglog threshold is132*log2*10^5<10^7, not<10^6. Choose one three-term progression in J2. The odd-support and dyadic conductor bound yield N≤2^8*k^417<k^418, and membership in J enforces all avoidance properties. The reciprocal-mass hypothesis excludes2 from S, and the lower endpoint of U_pr exceeds2 in this range; therefore the odd-prime survivor API supplies full conductor avoidance here.

*Needs:* Layer 4 — sieve losses and coefficient density; Layer 0 — three-term progression triples; Layer 2 — simultaneous quadratic character family; Layer 4, quantitative three-term progression theorem; Mathlib `Real.log_two_gt_d9`; Mathlib `Real.log_two_lt_d9`.

([BS20], Proposition 9.1, pp. 381-384; §9 end of proof, p. 384; Proposition 9.1(I), p. 382; Proposition 9.1(II), p. 382; Proposition 9.1(III), p. 382; Proposition 9.1(IV), p. 382; Proposition 9.1, pp.381–384; Roth-threshold substitution.)

### 4.7 Maximal largest-prime family

Under H⁺ at the certified threshold, choose a nonempty inclusion-maximal finite B subset A(k) whose P(N_a) are pairwise distinct, all P(N_a)≤k^(7/16), N_a<k^418, and N_a avoids U_pr. Maximality is by inclusion, not by conductor size or cardinal alone.

B is nonempty, lies in A(k), has distinct P(N_a), and satisfies all three conductor restrictions. Every admissible superset of B equals B. If |B|≤17logk, its reciprocal-largest-prime mass is at least0.17.

**Checks.**

- Under the constructor hypotheses B cannot be empty.
- Two distinct members never have the same largest conductor prime, even if their conductors differ.
- An outside triple satisfying all size and gap restrictions must repeat one of B’s largest primes.

The witness for S empty makes the family nonempty. Select an inclusion-maximal member of the finite family of admissible subsets of A(k). For |B|≤17logk a reciprocal mass<0.17 would permit a new witness with S={P(N_a):a in B}, contradicting maximality.

*Needs:* Layer 4 — simultaneous thin-conductor witness.

([BS20], §10, pp. 384–385; endpoint correction.)

### 4.8 Original analytic endgame

Prove the original-route length bound with the effective threshold specified below.

There is an effective absolute K_original such that H⁺ implies k≤K_original. For the maximal B, if |B|>17logk apply the many-character criterion with c2=418; otherwise D={a in B:P(N_a)≤(logk)^(1-10^-4)} has reciprocal mass≥0.1683>0.166. Its smoothness is strictly less than(logk)^(1-1/20000), so the harmonic criterion applies.

Distinct largest prime factors imply distinct primitive characters. In the small-cardinality branch, U_pr avoidance places every complementary largest prime above10^4logk, giving complementary mass≤0.0017. Use c1=1/20000 to handle the closed endpoint, instead of substituting the strict criterion at c1=10^-4. Take the maximum of the certified threshold and both effective contradiction thresholds.

*Needs:* Layer 4 — maximal largest-prime family; Layer 3 — harmonic smooth-conductor criterion; Layer 3 — many smooth characters criterion.

([BS20], §10 proof of Theorem 2, p. 385; strict endpoint comparison.)

### Examples

For A=(1,2,3,4,1), k=5, the retained indices are {0,1,4} and their product is 2. For A=(1,2,1,2) the least maximal 2-valuation occurs at index 1.

### Dependencies

Layers 0, 2 and 3; Mathlib qualitative Roth and Stirling sequence.

## Layer 5: Granville exceptional moduli and a single witness

For a bounded-height Landau-Page constant c>0 define T=exp(c log k/(3log log k)) and the moduli 1≤q≤k^4 having a primitive L-function zero with |Im rho|≤T and Re rho>1-3log log k/log k. Prove the polylogarithmic cardinal bound, minimum modulus≥log k and at-most-one modulus below T. Apply the half-interval explicit formula to primitive nonprincipal characters outside this set. Define the exceptional divisibility indices with r|q and r≥q^(1/3)/2 and prove their sparse cardinal bound with all k/r+1 losses retained. Combine maximal-valuation deletion with disjoint triples to choose one triple that both avoids these indices and satisfies 8A_iA_jA_h≤k^4. Odd-conductor divisibility and the bound N≤8Nodd force that same conductor outside the exceptional set. The resulting contradiction gives an independent effective bound on k without Roth or short-sum cancellation. Both analytic zero predicates exclude the principal-character pole at1.

### 5.1 Bounded-height analytic inputs

Consume AnalyticNumberTheoryPartI §0.6's bounded-height Landau–Page theorem.
If its strict strip has width c₀>0, choose 0<c≤c₀/2. For T≥2 the closed
strip Re ρ≥1−c/log T is contained in Re ρ>1−c₀/log T; thus every
qualifying zero at q≤T, |Im ρ|≤T is real and simple, its primitive character
is real-valued, and the entire character/zero pair is unique across all moduli.
Use this fixed c in T(k,c); no existence of an exceptional zero is asserted.
(IwaniecKowalski2004, Theorem 5.28; BS20, §12, p. 386.)

Consume AnalyticNumberTheoryPartI §0.7's real-zero separation
β≤1−40/(√q(log q)²), for nonprincipal quadratic characters modulo q≥3
and real zeros β>0, under both BMORFiniteInput and BMORClassNumberInput.
The unconditional exceptional-modulus bound in §5.3 requires
gap:numerical-zero-inputs; neither hypothesis is supplied by Landau–Page
(BMOR2018v3, Proposition 1.11 and proof, §6.1).
Consume §1.7's effective density estimate for ε>0, Q,T≥2, 1/2≤σ≤1,
counting zeros with multiplicity:
∑_(q≤Q)∑_(χ primitive mod q) N(σ,T,χ)≪_ε (Q^(5+ε)T^(3+ε))^(1−σ)+1.
Consume §1.4 and §§1.4a–1.4d's truncated half-interval formula for primitive
nonprincipal χ, integer k≥4 and 2≤T≤k. It uses one height, includes both
endpoint corrections, and bounds the kernel near zero by its integral over
[k/2,k]. Specialize these inputs to Q=k⁴ and T(k,c) in §§5.3–5.4,
after proving 2≤T(k,c)≤k for effectively large k.
(BS20, Propositions 12.1–12.2 and proofs, pp. 386–387.)

**Checks.**

- A principal character at 1 has a pole and is never a zero witness.
- A zero above height T does not violate the bounded-height conclusion; replacing T by Q changes the theorem.
- The integral at ρ=0 is log 2, while the separate expression 1/|ρ| is singular; this pins the uniform zero-term bound.

*Needs:* AnalyticNumberTheoryPartI §§0.6–0.7, 1.4, 1.4a–1.4d and 1.7; `gap:numerical-zero-inputs`; Mathlib `DirichletCharacter.LFunction`. The definition and API below use these inputs at Q=k⁴ and the stated zero height.

### 5.2 Bounded-height exceptional moduli

Define T(k,c)=exp(c log k/(3 log log k)) using total real logarithms and
division. For a positive modulus q, a primitive regular-zero witness consists
of a native primitive complex Dirichlet character χ modulo q and ρ∈ℂ with
χ.LFunction(ρ)=0, ρ≠1 or χ≠1, |Im ρ|≤T(k,c), and
Re ρ>1−3 log log k/log k. Define the witness-existence predicate by
quantifying χ and ρ, and define Q(k,c) to contain exactly the integers
1≤q≤k⁴ admitting a witness. The analytic applications require k≥3 and c>0.

The bounded-height Landau–Page input at c is the closed-strip consequence
of the supplier theorem obtained in §5.1. Its primitive character, regular zero,
reality, simplicity and uniqueness conditions are supplied by
AnalyticNumberTheoryPartI §0.6; Q(k,c) is the progression-specific exceptional
set constructed here.

The APIs retain the same positive-modulus instance throughout:

- Membership in Q(k,c) is equivalent to the stated bounds and witness; hence
  Q(k,c) is finite and contained in {1,…,k⁴}.
- Every witness projects to its primitive character, regular zero, real-part
  bound and height bound; these conditions are invariant under equality of
  the character and zero.
- T(k,c) is positive, T(0,c)=T(1,c)=1, and T(k,0)=1. For k≥3 it is monotone
  in c, as is the witness-existence predicate.

Prove the modulus-five trivial-zero example. The nonprincipal quadratic
character χ₅ modulo 5 is primitive and even; its value at zero is zero and
the supplied even-function formula gives L(0,χ₅)=−χ₅(0)/2=0. At k=16,c=0,
T=1 and 1−3 log(log 16)/log 16<0, so q=5 belongs to Q(16,0).
(BS20, §12, (40)–(41), p. 386, for the region; the supplied even-function
value formula for the trivial zero.)

**Checks.**

- T(0,c)=1: the total logarithm at zero gives exponent zero.
- T(1,c)=1: the total denominator gives exponent zero.
- T(k,0)=1 for every k, and every T(k,c) is positive.
- Modulus 0 admits no witness, since it is not positive.
- The witness excludes the principal pair (χ,ρ)=(1,1), regardless of the
  total L-function value at its pole.
- A candidate above the respective height bound fails even if its real part
  is in the strip.
- At k=0 the progression-dependent strip is Re ρ>1; no regular L-function
  zero exists there. In particular ρ=0 fails the inequality 1<0.
- For k≥3 and c≤c′, log log k>0 makes T(k,c)≤T(k,c′), so every witness
  for c is also one for c′.
- The even character χ₅ has L(0,χ₅)=0 and witnesses 5∈Q(16,0); an identically
  false witness predicate would fail this example.
- Neither 0 nor any q>k⁴ belongs to Q(k,c), independently of zero witnesses.

Take Q(k,c) as the subset of range(k⁴+1) selected by the exact witness
condition. Use the meromorphic continuation; the naive totalized LSeries
outside convergence does not define this zero set. The pole exclusion and
height bound are required in the witness predicate.

*Needs:* Mathlib `DirichletCharacter.LFunction`, `DirichletCharacter.IsPrimitive`, `ZMod.LFunction_apply_zero_of_even` and `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; ClassicalArithmeticCompletion §1.51 for the quadratic character modulo 5 and the coefficient-change contracts above.

([BS20], Section 12, equations (40)-(41), p. 386.)

### 5.3 Exceptional-modulus bounds

Prove the exceptional-modulus bounds with a positive constant c satisfying the bounded-height Landau–Page contract at c; both hypotheses are retained.

For the fixed positive Landau-Page constant c, there are effective K,C such that k≥K gives |Q(k,c)|≤C*(logk)^61, every q in Q(k,c) is≥logk, and at most one q in Q(k,c) is<T. These conclusions are proved simultaneously from zero density and bounded-height zero-free input.

Apply the supplier log-free density estimate at Q=k^4 and the exact T, with all character/modulus multiplicities. For small q first use the full Landau–Page contract to make the exceptional zero and character real; apply the explicit real-zero upper bound, then use uniqueness for the remaining moduli. Constants depend only on the fixed analytic input, not on n,d.

*Needs:* Layer 5 — bounded-height exceptional moduli and bounded-height analytic inputs; AnalyticNumberTheoryPartI §§0.6–0.7 and 1.7; `gap:numerical-zero-inputs`.

([BS20], Proposition 12.1 first conclusion, p.386; Proposition 12.1 second conclusion, pp.386–387; Proposition 12.1 third conclusion, pp.386–387.)

### 5.4 Nonexceptional half-interval character estimate

Prove the nonexceptional half-interval estimate for every c>0 as below; its constants may depend on c.

For sufficiently large k, every native primitive nonprincipal character of conductor q≤k^4 outside Q(k,c) has absolute von-Mangoldt half-interval sum≤C*k/logk, uniformly with effective C. The principal character is excluded.

Subtract the supplier truncated explicit formulas at k and k/2 with the same height T. Interpret (k^rho−(k/2)^rho)/rho at rho=0 by the integral over [k/2,k], whose value there is log 2. For 0≤Re(rho)≤1, bound this integral by C*k^Re(rho)*min(1,2/(1+|rho|)); the denominator is at least 1, so the bound includes rho=0. A naked sum of 1/|rho| is not uniform near zero. Use local zero counts for the weighted zero sum and the nonexceptional real-part bound. Track parity constants, trivial zeros and horizontal truncation errors. T, not Q=k^4, belongs in the truncation denominator.

*Needs:* Layer 5 — bounded-height exceptional moduli; §5.1 the truncated half-interval formula and local zero counts.

([BS20], Proposition 12.2, p.387; nonprincipal hypothesis and uniform zero-sum estimate.)

### 5.5 Exceptional divisibility indices

Define the exceptional divisibility index set as Bad below for an arbitrary finite modulus set.

For integers n,d, positive k and any finite set Q of positive moduli, Bad is the set of i<k for which some q in Q has a positive divisor r with r≥q^(1/3)/2 and r dividing n+i*d. In the application Q=Q(k,c). The real cube-root threshold and the +1 count for r>k are retained.

Membership is precisely the positive-divisor witness with i<k. An empty exceptional-modulus set gives an empty bad-index set. Increasing the exceptional-modulus set can only increase the bad-index set.

**Checks.**

- An empty modulus set gives no bad indices.
- With modulus set{1000},n=1000,d=1,k=3, index0 is bad via r=1000>k; truncating r at k loses it.
- With modulus set{8},n=d=1,k=4, every index is bad, since r=1 is an admissible divisor at the exact threshold8^(1/3)/2=1.

Filter range(k) by the finite exceptional-modulus/divisor witness. Do not restrict the divisors to r≤k.

*Needs:* Layer 5 — bounded-height exceptional moduli; Layer 0 — divisibility index sets.

([BS20], Proposition 12.3, pp.387–388.)

### 5.6 Exceptional indices are sparse

Prove sparsity of exceptional indices for c>0 with the bounded-height Landau–Page contract at c and the coprime nonzero n,d below.

For all sufficiently large k and coprime nonzero n,d, |Bad|≤C*k/(logk)^(1/4), with effective C uniform in n,d.

For each q sum k/r+1 over its divisors r≥q^(1/3)/2, using the residue count. Split off the at-most-one q<T, where q≥logk and eventual divisor subpower estimates suffice. For remaining q≥T use T decay against the polylogarithmic cardinal bound. The total +1 error is O(k^(1/3)*(logk)^61) after using q≤k^4 and a sufficiently small divisor exponent; it is negligible relative to k/(logk)^(1/4).

*Needs:* Layer 5 — exceptional divisibility indices; Layer 5 — exceptional-modulus bounds; AnalyticNumberTheoryPartI §0.6; Layer 0 — one-residue-class count; Layer 0, explicit totient and divisor bounds — eventual divisor subpower bound.

([BS20], Proposition 12.3, pp.387–388.)

### 5.7 Single Granville conductor witness

Under H⁺ and sufficiently large effective k choose one triple a=(i,j,h) in A(k) whose three indices avoid Bad and with N_a≤8*A_i*A_j*A_h≤k^4. Both properties hold for the same triple.

Prove the Granville scale inequality: for real x≥64, 8*x^(7/2)≤x⁴, with equality at 64 (BS20, §12 final paragraph, p. 388; elementary real powers).

- The chosen triple belongs to A(k), with positive spacing1.
- Each of its three indices is outside Bad.
- Its conductor and coefficient product satisfy N_a≤8*A_i*A_j*A_h≤k^4.

**Checks.**

- One chosen triple satisfies both avoidance and size; two separate existential witnesses are insufficient.
- The chosen triple is one of the disjoint consecutive blocks used in the factorial product estimate.
- At k=64,8*k^(7/2)=k^4; the final size implication holds for every k≥64.

Delete one maximal-valuation index per small prime, then delete Bad. Use the original disjoint consecutive blocks(0,1,2),(3,4,5),..; at most one block is lost per deleted index. Effectively more than2k/7 blocks survive. Their combined A-product divides(k-1)!≤k^k. One block has coefficient product≤k^(7/2); k≥64 implies8*k^(7/2)≤k^4. Choose that block, which already avoids Bad. The effective prime-count estimate from Layer 0 explicit prime estimates bounds the number of maximal-valuation deletions by pi(k)=o(k); combine it with the uniform Bad bound before counting disjoint blocks.

*Needs:* Layer 4 — maximal-valuation deletion; Layer 5 — exceptional indices are sparse; Layer 2 — simultaneous quadratic character family; Layer 0 — three-term progression triples; Mathlib `Nat.factorial_le_pow`; Layer 0, explicit prime estimates.

([BS20], §12 final paragraph, p.388; simultaneous witness.)

### 5.8 Exceptional-conductor detection

Prove exceptional-conductor detection with the hypotheses and conclusions below.

For the single witness above, N_a is not in Q(k,c). Indeed N_a^odd divides A_i*A_j*A_h and N_a≤8*N_a^odd, so the product of the three gcd(N_a,A_r) is≥N_a/8. One gcd is≥N_a^(1/3)/2, and as a positive divisor of N_a and the indexed term it would make that same index bad if N_a were exceptional.

Use squarefreeness of Nodd to distribute its prime factors among the three gcds. Apply the product lower bound and the real cube-root threshold. Since A_r divides |t_r|, the selected gcd is exactly a permitted Bad witness. Contradict the avoidance API of the same chosen triple.

*Needs:* Layer 5 — single granville conductor witness; Layer 2 — simultaneous quadratic character family; Layer 5 — exceptional divisibility indices.

([BS20], §12 final paragraph, p.388; odd-conductor divisibility.)

### 5.9 Granville analytic endgame

Prove the Granville-route length bound with an effective absolute threshold.

There is an effectively computable absolute K_Granville such that H⁺ implies k≤K_Granville. This route uses no quantitative Roth theorem or short smooth-modulus cancellation bound.

Choose the single addendum witness. Detection puts its conductor outside Q, its size is≤k^4 and its odd part is nontrivial, so the selected character is nonprincipal. The uniform O(k/logk) bound contradicts its strict absolute lower bound>0.1239*k for effective large k.

*Needs:* Layer 5 — single granville conductor witness; Layer 5 — exceptional-conductor detection; Layer 5 — nonexceptional half-interval character estimate; Layer 2 — simultaneous quadratic character family.

([BS20], §12 end, p.388.)

### Examples

The modulus 8 has cube-root threshold 1, so every term of (1,2,3,4) has a permissible divisor. A divisor 1000 of modulus 1000 still witnesses a bad index when k=3.

### Dependencies

Layers 0 and 2–4; AnalyticNumberTheoryPartI §§0.6–0.7, 1.4 and 1.7,
with both BMOR hypotheses until gap:numerical-zero-inputs is discharged;
using Layer 4 only for maximal-valuation deletion; the original-route Roth and smooth-correlation endgame is not an input.

## Layer 6: Effective exponent bound and fixed-length finiteness

Prove the main theorem: an effectively computable absolute k0 exists such that every primitive integer progression product of length k≥k0 with prime exponent ell has y*d=0 or ell≤exp(10^k). Either proof route supplies such a threshold. For each fixed k≥k0, increased to at least5, consume the shared Mordell theorem and construct the Darmon-Granville fixed-exponent adapter. Reduce composite exponents to prime divisors and exclude power variables0,1,-1 in nontrivial sufficiently long progressions. Deduce finiteness of positive integer(n,d,y,ell) tuples for each fixed k and all ell≥2, not one finite set over all lengths and not an effective enumeration of points. Correct equation(2.2) of Darmon–Granville to coefficients j-1 and j-2 with its1-based term indexing.

### 6.1 Rational points on curves of genus at least two

Consume HeightsRationalPointsAndObstructions §§5.12 and 6.4's `mordell_finite`
for a smooth proper geometrically connected one-dimensional scheme C over a
number field K, with `2 <= C.genus K` and the finite-dimensional
H¹(C, 𝒪_C) instance. Use rational points as morphisms over Spec K throughout.
AlgebraicCurves Layer 12E transfers the diagonal curve's function-field genus
to this invariant. No effective height bound is asserted.
(Faltings1983, §6, Satz 7, p. 365; DG95, Corollary 2.1, pp. 520–521.)

*Needs:* HeightsRationalPointsAndObstructions §§5.12 and 6.4; AlgebraicCurves Layer 12E’s genus comparison for the adapter.

### 6.2 Effective prime-exponent bound

Prove `effective_prime_bound` with the quantified threshold, integer domain and prime exponent below.

There exists an effectively computable absolute integer k0≥5 such that for every positive integer k≥k0, integers n,d,y with gcd(n,d)=1, and prime ell satisfying product over i<k of(n+i*d)=y^ell, either y*d=0 or ell≤exp(10^k). The same logical statement has both an original-route and a Granville-route effective threshold; an unqualified classical existential by itself is not an effectivity proof.

Suppose y*d≠0 and ell>exp(10^k). Taking k0 above10^8 and2*10^10 gives H⁺. Either analytic endgame contradicts sufficiently large k. Fix the maximum of the explicit or effectively controlled input thresholds. Keep a ledger of effective dependencies; none uses ineffective Siegel constants or a rational-point height bound.

*Needs:* Layer 4 — original analytic endgame; Layer 5 — granville analytic endgame; Layer 0 — primitive progression solutions.

([BS20], Theorem 2, p. 357.)

### 6.3 Fixed-exponent progression finiteness

Prove `fixed_exponent_finiteness` for natural k≥3, ell≥2 and 2*ell+k<k*ell, and deduce its k≥5 specialization.

For every fixed k≥3 and natural ell≥2 with 2*ell+k<k*ell, the set of coprime integer(n,d,y) with y*d≠0 and product over i<k of(n+i*d)=y^ell is finite. For positive n,d,y this is the hyperbolic part of Darmon–Granville Corollary 2.1; the signed extension needs the same finite sign patterns rather than an unsupported appeal to positivity. The source also covers positive progressions at (k,ell)=(4,2) and (3,3) by Euler’s arithmetic theorems. Those cases are outside the signed hyperbolic statement: (−3,−1,1,3) is a nontrivial signed four-term progression with square product 9 and diagonal genus one.

Prove the positive four-term square exclusion: for integers n,d>0 with gcd(n,d)=1 and every integer y, ∏_(i<4)(n+i*d)≠y². Prove the positive three-term cube exclusion: under the same hypotheses, ∏_(i<3)(n+i*d)≠y³ (DG95, §2.1, p. 520, Euler boundary cases). These are arithmetic descent targets here. Their elementary inputs are the term-gcd bound, prime valuation factorization and well-founded descent on positive integers; the cubic proof carries out descent for x³+z³=2u³ with nonzero integer variables, retaining mixed signs when the prime 2 divides both endpoints. Track the primes 2 and 3 separately rather than assume pairwise coprimality of all terms. Neither assertion follows from genus one or Faltings.

Prove `positive_fixed_exponent_finiteness`: for k≥3, ell≥2 and k+ell≥6, the set of positive integer triples (n,d,y) with gcd(n,d)=1 and progression product y^ell is finite (DG95, Corollary 2.1, p. 520). Split off (4,2) and (3,3), whose sets are empty by the two arithmetic targets; all remaining pairs satisfy 2*ell+k<k*ell and use `fixed_exponent_finiteness`.

Choose finite small-prime ell-powerfree coefficient classes, including signs. Eliminate n,d to get a diagonal complete intersection in P^(k-1); its projection to the ternary curve has degree ell^(k-3) and the displayed Riemann-Hurwitz computation gives2g-2=k*ell^(k-1)*(1-2/k-1/ell)>0. Prove smoothness, geometric connectedness and ramification of this diagonal intersection; apply the supplied genus comparison and §6.1's shared Mordell theorem. Each rational projective point has only finitely many primitive integral lifts, then only finitely many y. Repeat over finitely many sign patterns. The source version is the author-hosted scan listed in the references. With the source indexing t_i=a+i*d for1≤i≤k, use lambda_j*z_j^ell=(j-1)*lambda_2*z_2^ell-(j-2)*lambda_1*z_1^ell for3≤j≤k. The printed (2.2) coefficients j and j-1 shift the term by d; this local misprint does not change the distinct-branch or genus argument.

*Needs:* Layer 0 — gcd of progression terms; §6.1; HeightsRationalPointsAndObstructions §§5.12 and 6.4; AlgebraicCurves Layers 7 and 12E.

([DG95], §2.1, Corollary 2.1 and its full proof, pp.520–521; [BS20], §1, p.357, discussion of Darmon–Granville Corollary 2.1.)

### 6.4 Composite exponent reduction

Prove the exponent-divisor power identity: for y∈ℤ and a natural p dividing ell, y^ell=(y^(ell/p))^p (BS20, §1 after Theorem 2, p. 357; power associativity).

*Needs:* Mathlib power laws and exact natural division.

Prove the absolute-value exclusion: for k≥3, d*y≠0 and a product equation with ell≥2, |y|>1 (the elementary distinct-term argument below; BS20, §1, p. 357).

*Needs:* Layer 0 `term` and nonzero finite products.

Prove finiteness of root/exponent pairs: for any fixed integer Y with |Y|>1, the set of integer y and natural r≥1 satisfying y^r=Y is finite (BS20, §1, p. 357; prime valuation argument).

*Needs:* Mathlib natural factorization and integer power valuations.

If ell≥2 and p is a prime divisor of ell, set Y=y^(ell/p); then y^ell=Y^p and the same progression has prime exponent p. For a nontrivial progression of length k≥3, |y|>1: otherwise every nonzero factor is±1, impossible for three distinct terms with d≠0. For each fixed integer Y with |Y|>1 there are finitely many pairs(y,r), r≥1, with y^r=Y.

Use exact division p*(ell/p)=ell and power associativity. If |y|=1 the absolute product is1 and all absolute factors are1. Bound r by any nonzero prime valuation of |Y| and bound y by |Y|. No exponent bound for composite ell is asserted directly.

*Needs:* Layer 0 — primitive progression solutions; Mathlib `Nat.factorization`.

([BS20], §1 finiteness consequence of Theorem 2, p.357.)

### 6.5 Fixed-length all-exponent finiteness

Prove `fixed_length_finiteness` for positive tuples and for all nontrivial signed tuples, with k fixed.

For each fixed k≥k0, there are finitely many positive integer tuples(n,d,y,ell) with ell≥2, gcd(n,d)=1 and product over i<k of(n+i*d)=y^ell. Also the nontrivial signed tuples with y*d≠0 form a finite set by the signed fixed-exponent adapter. This is not finiteness as k varies and not an effective point-enumeration theorem.

The effective prime theorem bounds the possible prime divisors p of ell for this fixed k. The fixed-exponent theorem yields finitely many triples(n,d,Y) for every such p. The composite reduction and |Y|>1 give finitely many roots/exponent multipliers above every triple; take the finite union.

*Needs:* Layer 6 — effective prime-exponent bound; Layer 6 — fixed-exponent progression finiteness; Layer 6 — composite exponent reduction.

([BS20], Abstract and §1 after Theorem 2, p. 357.)

**Checks.**

- At (k,ell)=(3,4), 2*ell+k<k*ell and the diagonal genus is 3.
- At (k,ell)=(4,3), the strict inequality holds and the genus is 10.
- At (k,ell)=(4,2), equality replaces the strict inequality and the genus is 1. The signed primitive progression (−3,−1,1,3) has product 9; the positive set is empty by the positive four-term square exclusion.
- At (k,ell)=(3,3), the genus is also one and the positive set is empty by the positive three-term cube exclusion.
- For n=d=1, the boundary products are 24 and 6. The three terms (2,3,4) have product 24 and share the prime 2 at the endpoints; this branch cannot assume pairwise coprimality. For d=0,n=y=1 the cube identity holds, so the positive-difference hypothesis is essential.

### Examples

At k=5,ell=2 the diagonal genus equation gives 2g−2=8, hence genus 5. At k=4,ell=2 it gives genus 1, so the strict hyperbolicity inequality is necessary. The shorter lengths (k,ell)=(3,4) and (4,3) give genera 3 and 10.

### Dependencies

Either Layer 4 or Layer 5 for the exponent bound; Layer 0, AlgebraicCurves Layers 7 and 12E, and HeightsRationalPointsAndObstructions §§5.12 and 6.4 for signed diagonal-curve finiteness.

## Layer 7: Conjectural and announced predicates

Prove the positive consecutive-product theorem in this layer. State the stronger Erdős eventual-nonexistence conjecture with positivity and the gcd condition, without proving it or using it as an assumption. Register the Section 11 smooth-multiplier equation product(n+id)=b*y^ell with nonzero b supported on primes≤tau*k for fixed tau<1/2, marking the announced extension as lacking a separate quantified proof. Specify the two assertions and test their domains; neither is a shortcut in either unconditional proof route.

### 7.1 Positive consecutive products

Prove `consecutiveProduct_not_perfectPower`: for positive n, k≥2 and ell≥2,
∏_(0≤i<k)(n+i) is not an ell-th power of a positive integer.
(ErdosSelfridge1975, Theorem 1, p. 292; BS20, §1, Theorem 1, p. 355.)

**Checks.**

- k=1,n=4 is a square, so the length hypothesis is necessary.
- k=2,n=1 gives 2, not a perfect power.
- The signed progression (−3,−1,1,3) has square product 9 and is excluded by positivity and common difference 1.

The proof targets below belong to this section. Their deletion input is §4.3,
which has no H or analytic hypothesis. The consecutive-product argument uses
neither a Frey comparison nor the progression character-family endgames.

#### Arithmetic reduction and powerfree coefficients

Prove the Sylvester–Schur input: for positive integers k and m>k, some
prime p>k divides ∏_(1≤j≤k)(m+j). Under the contrary assumption that ell
is a prime and every prime p≥k has ell-divisible valuation in that product,
such a p divides only one term and forces m+k≥(k+1)^ell, hence m>k^ell.
Prove the stronger valuation conclusion of Theorem 2: for k≥3, ell≥2 and
m≥0 with m+k at least the least prime ≥k, some prime p≥k has valuation
not divisible by ell in ∏_(1≤j≤k)(m+j). Reduce ell to a prime divisor;
the case m≤k uses Bertrand's postulate, while m>k uses the targets below.
For the headline, put m=n−1 using n>0. Handle k=2 separately by coprimality
of consecutive terms and the impossibility of two consecutive positive
ell-th powers. (ErdosSelfridge1975, Theorems 1–2 and §1, pp. 292–293.)

For each m≥0, k≥1 and ell≥2, define the positive ell-powerfree coefficients
and roots by m+j=a_j x_j^ell for 1≤j≤k: the p-exponent of a_j is the
remainder of v_p(m+j) modulo ell, and that of x_j is the quotient.
These differ from §0.4's coefficients, which retain all small-prime powers.

- The factorization exists uniquely with a_j positive and ell-powerfree and x_j positive.
- Every prime of a_j divides m+j; if every prime p≥k has ell-divisible valuation in the full product, each a_j is supported on primes strictly below k.
- For ell=2 the a_j are squarefree; the coefficient of a perfect ell-th power is 1.

**Checks.**

- For m=7,k=2,ell=3 the terms 8,9 give (a_j,x_j)=(1,2),(9,1); replacing a_j by the whole small-prime part gives the wrong coefficient for 8.
- For m=3,k=2,ell=2 the terms 4,5 give (1,2),(5,1); support below k requires the additional valuation hypothesis.
- For m=0,k=1 the term 1 gives (1,1) for every ell≥2; exponent 0 is outside the definition's domain.

*Needs:* Mathlib `Nat.factorization`, natural division and remainders, and
`Nat.exists_prime_lt_and_le_two_mul` for Bertrand; §0.2 for uniqueness of a
large-prime term. Prove the Sylvester–Schur input here as the general
consecutive-integer prime-divisor theorem used in §1 of the source.

#### Distinct products and factorial deletion

For k≥3, ell≥2 and m>k^ell, prove that the preceding coefficients have
distinct products modulo rational ell-th powers: for 0≤r<ell and two
multisets I,J of r indices from {1,…,k}, if
(∏_(i∈I)a_i)/(∏_(j∈J)a_j) is an ell-th power in ℚ, then I=J.
Repetitions are allowed. Cancel common indices, bound gcds of unequal
terms by their index differences, and compare the gap between consecutive
ell-th powers with the difference of the two short term products.
(ErdosSelfridge1975, Lemma 1 and proof, pp. 293–294.)

Apply §4.3's maximal-valuation deletion with n=m+1,d=1 and these a_j after
shifting j to j−1. Under the small-prime-support hypothesis it deletes at
most π(k−1) indices and the retained product divides (k−1)!. Pad the deleted
set if necessary to obtain exactly k−π(k−1) retained indices; removing more
positive integer factors preserves divisibility. This is the factorial-deletion
target already owned in §4.3, applied to powerfree coefficients, with no second
construction. (ErdosSelfridge1975, Lemma 2, pp. 294–295.)

**Checks.**

- At r=0 both index multisets are empty and both products are 1.
- For m=28,k=3,ell=3 the coefficients 29,30,31 have the six two-factor products 841,870,899,900,930,961, all distinct modulo rational cubes.
- Without m>k^ell, m=1,k=7,ell=3 has coefficients 2,3,4,5,6,7,1 and equal products 2·6=3·4 on different index multisets.
- For m=0,k=5,ell=2 the coefficients are 1,2,3,1,5; §4.3 removes indices 1 and 2 and retains product 5. This family fails support below k, and 5 does not divide 4!=24.

*Needs:* The powerfree factorization above; §0.2's term-gcd bound; §4.3.
The distinctness theorem uses m>k^ell; deletion uses the support hypothesis
and does not need that size bound.

#### Rectangle-free counting and the large-length range

Prove that a finite simple bipartite graph with part sizes s,t and no
four-cycle has at most s+binom(t,2) edges, including empty parts. Count the
pairs of neighbours at each vertex in the s-part; each pair in the t-part
occurs at most once. Deduce that if B,U,V are finite sets of positive integers,
B⊆{uv:u∈U,v∈V}, and all unordered two-factor products from B are distinct
including repeated factors, then |B|≤|U|+binom(|V|,2).
(ErdosSelfridge1975, Lemma 3 and (11)–(12), pp. 295–296.)

For k≥30000 and ell≥3 in the contrary valuation case, order the coefficients
as a₁<⋯<a_k and prove a_i≥i, a_i>3.5694(i−304), and
a_i>4.3402(i−1492). The multiplicative covers use, respectively, the 25
integers at most 36 supported on {2,3,5,7}, and the 55 integers at most 100
supported on {2,3,5,7,11}. Prove their covering and residue-count inequalities,
then the three coefficient bounds and ∏_(i≤k−π(k))a_i>k!.
This contradicts deletion: its retained set has at least k−π(k) entries,
so its product is at least this initial product, but divides (k−1)!.
Use §4.4's Stirling upper estimate, the prime-count estimates with their numerical
input obligation, and the supplied `Stirling.le_factorial_stirling` inequality
sqrt(2πm)(m/exp(1))^m≤m! for every natural m. The comparison at k=30000 and its persistence
for every larger k are explicit mathematical inequalities.
(ErdosSelfridge1975, §2.1, (13)–(16), pp. 296–297.)

**Checks.**

- Empty parts have zero edges. A two-edge star with s=1,t=2 has 2=1+binom(2,2) edges.
- The complete bipartite graph with s=t=2 has four edges, exceeds the bound 3, and contains a four-cycle; the cycle exclusion is essential.
- B={1,2,3}, U=B,V={1} has six distinct unordered products and saturates the bound 3; B={1,2,4} fails distinctness because 1·4=2·2.
- The two covering sets have sizes 25 and 55; the first excludes 11 and the second excludes 13, distinguishing smooth support from a mere size cutoff.

*Needs:* Distinctness and deletion above; native finite simple graphs and finite
sets; §4.4 and `Stirling.le_factorial_stirling` for the factorial comparisons;
AnalyticNumberTheoryPartI §0.5 with `gap:numerical-prime-inputs` for its
unconditional numerical prime-count estimate.

#### Odd-prime finite ranges

For ell=3, prove the k=3 contradiction directly. For 4≤k<1000 let f(k,m)
count coefficients supported on the first m primes. Prove
f(k,m)(f(k,m)−1)>3^m with m=2,3,4,5,6,7,8 on the respective intervals
[4,10), [10,28), [28,77), [77,143), [143,340), [340,646), [646,1000).
The lower bound counts indices after excluding divisibility by primes above
the m-th prime; each excluded prime p costs at most floor(k/p)+1 indices.
There are 3^m cubeclasses of ratios on m primes, so the ordered distinct-index
ratios contradict Lemma 1. (ErdosSelfridge1975, §§2.2–2.3, (17), pp. 297–298.)

For 1000≤k<30000 choose r≥1 and the r largest primes q₁<⋯<qᵣ≤√k.
Let F(k,r) count coefficients supported on primes ≤√k and containing at most
one of these q's, counted with multiplicity. Prove there is such an r with
F(k,r)(F(k,r)−1)>3^(π(q₁)−1)(r²+r+1).
Bound F below by deleting indices divisible by primes √k<p<k and by each
q_i q_j, i≤j, using floor(k/a)+1 for every divisor a, including a>k.
The factor r²+r+1 counts the possible cube-exponent patterns of a ratio with
at most one selected q in numerator and denominator.
(ErdosSelfridge1975, §2.4, (18), p. 298.)

For every prime ell≥5 prove the corresponding inequalities
binom(f+ell−2,ell−1)>ell^m and
binom(F+ell−2,ell−1)>ell^(π(q₁)−1)binom(r+ell−1,ell−1),
with the same finite-range choices. Counting multisets of ell−1 coefficients
then contradicts distinctness modulo rational ell-th powers. These quantified
inequalities, the residue counts at all interval endpoints, and the k=3 argument
are the finite arithmetic obligations here; no prime exponent is bounded away
without this uniform argument. (ErdosSelfridge1975, §2.5, (19)–(20), pp. 298–299.)

**Checks.**

- At k=4,m=2 the elementary lower bound is f≥4, so 4·3=12>9; for ell=5, binom(7,4)=35>25.
- At k=1000, the primes (19,23,29,31), r=4, give F≥255 and 255·254=64770>45927=3⁷·21.
- At k=29999, the 31 primes from 29 to 173 give F≥4853 and 4853·4852=23546756>19545219=3⁹·993.

*Needs:* Powerfree factorization and distinctness above; §0.8's residue-class
count at d=1; finite prime sets, multiset counts and elementary inequalities.
No large-length estimate is used to cover a missing finite interval.

#### The square-exponent branch and assembly

For ell=2 and k≥71 prove that m>k², m+j=a_j x_j² with positive x_j and
distinct squarefree a_j supported below k is impossible. Reuse deletion,
count the 24 residue classes modulo 36 not divisible by 4 or 9, compare the
2- and 3-valuations in ∏a_j with those in (k−1)!, and prove the resulting
factorial and prime-product inequalities for all k≥71. Use the supplied theta
bound to obtain ∏_(p<k)p<3^k in the large range; prove the sharper finite
prime-product inequalities needed for 71≤k<297 directly.
(ErdosSelfridge1975, §3.1, (21)–(23), pp. 299–300.)

For 3≤k<71 prove the remaining support/counting assertions: k=3 forces
repetition; k=4 reduces to four consecutive factors, whose product is
(m²+5m+5)²−1; for 5≤k<20 five coefficients supported on {2,3} force
repetition among only four squarefree possibilities, apart from the k=6,8
residue cases, each containing four consecutive factors with square product.
For 20≤k<56 use nine coefficients supported on {2,3,5}, and for 56≤k<71
use 21 supported on {2,3,5,7}, against 8 and 16 squarefree possibilities.
Prove these counts and the two exceptional residue implications, including
all endpoints. (ErdosSelfridge1975, §3.2, p. 300.)

**Checks.**

- Modulo 36, exactly 12 classes are divisible by 4 or 9 and 24 are not; subtracting the two counts without their intersection gives 23.
- The squarefree numbers supported on {2,3} are exactly 1,2,3,6; the threshold is five, not four.
- For m=0 the four-term product is 24=5²−1, and for m=1 it is 120=11²−1; neither equals the displayed square.
- At m=0,k=3, the valuation of 3 in 1·2·3 is 1, which is not divisible by either exponent 2 or 3. At m=0,k=4, v₃(24)=1; these also test the least-prime boundary in Theorem 2.

*Needs:* Powerfree factorization, distinctness, deletion and the finite residue
counts above; AnalyticNumberTheoryPartI §0.3 with
`gap:numerical-prime-inputs` for the theta bound; native prime factorization.
Combining the square branch, the odd-prime branches and prime-divisor reduction
proves Theorem 2, and then `consecutiveProduct_not_perfectPower`.

### 7.2 Erdős nonexistence assertion

Define ErdosThreshold(K) by the universal nonexistence statement below.

For integer K≥0 let ErdosThreshold(K) assert that for every k≥K, k≥2, positive integers n,d,y and ell≥2 with gcd(n,d)=1, the progression product is not y^ell. The Erdős conjecture is the assertion that some K satisfies this explicit predicate. It is recorded, not proved or used as an assumption.

- The predicate is equivalent to the displayed positive-domain universal nonexistence statement.
- K≤L and ErdosThreshold(K) imply ErdosThreshold(L).
- For every k≥K with k≥2, ErdosThreshold(K) implies the exact primitive positive-domain product inequality for every n,d,y>0 and integer ell≥2.

**Checks.**

- ErdosThreshold(0) is false because n=1,d=24,k=3,y=35,ell=2 is a primitive positive solution.
- The same solution shows ErdosThreshold(3) is false.
- The signed solution(-3,2,4,3,2) is excluded by positivity and is not itself a counterexample to ErdosThreshold(4).

State the positive-domain quantifiers and exact primitive product equation. Keep integer exponent ell≥2, not just prime ell. The definition is an explicit predicate; it has no admitted proposition body.

*Needs:* Layer 0 — primitive progression solutions; Layer 7, consecutive-product theorem.

([BS20], §1, Conjecture, p. 356.)

### 7.3 Smooth-multiplier progression equation

Define SmoothMultiplierSolution by the equation and support conditions below.

For real tau, integers n,d,y,b and natural k,ell, SmoothMultiplierSolution means 0<k, ell prime, gcd(n,d)=1, y*d≠0, b≠0, product over i<k of(n+i*d)=b*y^ell, and every prime divisor of |b| is≤tau*k. The discussion concerns fixed 0≤tau<1/2. Its extension is an announcement without a separate quantified proof, not an unconditional theorem of this roadmap.

- The predicate has exactly the displayed domain, equation and support conditions.
- For tau≥0 and b=1 it is equivalent to S(n,d,k,y,ell).
- For tau≤sigma, a solution for tau is a solution for sigma.

**Checks.**

- b=0 never gives a SmoothMultiplierSolution.
- tau=0,n=1,d=24,k=3,y=35,ell=2,b=1 gives a solution.
- for n=d=y=1,k=2,ell=2,b=2, SmoothMultiplierSolution(tau,1,1,2,1,2,2) holds exactly when 1≤tau. It holds at tau=1 and fails below 1; this admits a nonunit multiplier and tests the closed endpoint.

Use the explicit equation and native prime-divisor predicate. The zero multiplier is excluded so its prime support cannot make the support condition vacuous. The fixed tau<1/2 restriction does not cover all multipliers supported below k.

*Needs:* Layer 0 — primitive progression solutions; Mathlib `Nat.maxPrimeFac`.

([BS20], §11, pp. 385–386.)

### Examples

The positive solution (n,d,k,y,ell)=(1,24,3,35,2) rules out thresholds 0 and 3. The signed square example has n<0 and does not test the positive-domain conjecture.

### Dependencies

Layer 0 and native finite products; §§4.3–4.4 and AnalyticNumberTheoryPartI §§0.3 and 0.5, with `gap:numerical-prime-inputs`, for §7.1. No target in this layer is a premise to Layers 1–6.

## Downstream consumers

The signed factorization, local progression bounds, Legendre trace comparisons and simultaneous character methods supply other perfect-power and generalized Fermat problems. Both effective analytic routes export their absolute thresholds; the genus adapter exports fixed-length finiteness with the primitive-lift contract.

## Worked examples and integration requirements

The generic character PNT used in Layer 3 must retain its effective error and
exceptional-zero alternative. The error for a nonexceptional smooth conductor has
exponent `min(c_1,1/2)`. Conductors of exceptional characters grow by the
repulsion law `N_j>=N_1^{2^{j-1}} (strict for j>=2)`. An explicit small-conductor zero-exclusion theorem supplies the remaining finite range. This zero-exclusion theorem is
unconditional finite verification of its specified region, not an assumption of
GRH. The prime estimates and zero-density results in the supplier contracts
carry constants and valid ranges; an asymptotic theorem with an unspecified
ineffective constant cannot discharge these requirements.

The short-character estimate separates an ambient product modulus from the
conductor of the induced primitive product character. The Gram inequality is
applied to squared absolute sums. With the hypotheses of the many-character
criterion, its main coefficient is `1/68`, while the character-family lower
coefficient is `0.1239^2`. The strict inequality between them must survive
all quantified error terms. Eventual divisor-subpower bounds are applied only
after fixing their positive exponent.

For the original route use the certified range
`k >= exp(exp(10^7))`. The required Roth substitution is
`132log 2 * 10^5<10^7`; it does not give a cutoff `10^6`.
The smoothness condition in the harmonic criterion is strict. The maximal-family
branch supplies a closed bound with exponent `1-10^{-4}`, so apply the
criterion with `c_1=1/20000`. These constants and the strictness of every
endpoint are part of the specification.

In the Granville route, keep both the real-part condition and bounded height in
the exceptional-zero predicate. Subtract explicit formulas at `k` and
`k/2` at the same height `T`. A zero near zero is controlled by the
integral form of `(k^rho-(k/2)^rho)/rho`; bounding a bare sum of
`1/|rho|` would lose uniformity. The principal pole at 1 is not a zero.
The divisibility-index count includes a rounding term `+1`, even when a
divisor exceeds the length. This term is summed before being shown negligible.
The simultaneous witness is selected from the surviving disjoint blocks, not
by choosing unrelated triples for its smallness and its avoidance property.

The signed fixed-exponent application in Layer 6 includes the complete geometric
adapter. For each of the finitely many nonzero signed coefficient patterns,
prove smoothness and geometric connectedness of the diagonal complete
intersection, construct its projection with the stated degree, compute genus
by Hurwitz, and compare that genus to the scheme-theoretic invariant entering
Faltings. The sign of a coefficient does not change the Jacobian-rank argument
over an algebraic closure in characteristic zero. Primitive integral
representatives of a rational projective point are unique up to sign; translating
back through the fixed coefficient pattern gives finitely many primitive
`(n,d,y)`. The source's positive-domain corollary by itself does not supply
this signed adapter.

For indexing `t_i=a+id`, `1 <= i <= k`, elimination uses
`lambda_j z_j^ell=(j-1)lambda_2z_2^ell -(j-2)lambda_1z_1^ell; (3 <= j <= k).`
This gives the correct index `j` in [DG95], equation (2.2). With zero-based
progression indices the same identity is transported after replacing `a`
by `n-d`. Its distinct branch values, the covering degree
`ell^{k-3}`, and
`2g-2=kell^{k-1}(1-2/k-1/ell)>0` are the genus requirements.

Layers 1–6 also require the full Legendre-character and effective-modular
obligations `gap:legendre-character-interfaces` and
`gap:effective-modular-comparisons`; neither is a theorem supplied by its name.
All applications of the literal numerical constants retain the seven supplier
input hypotheses in the contracts table until their discharge. The unconditional
end theorems require gap:numerical-prime-inputs and gap:numerical-zero-inputs;
the original route also requires gap:small-conductor-zeros. Conditional supplier
estimates alone do not discharge these obligations.

Finally, prove effectivity alongside the prime-exponent theorem. Record an
explicit finite bound for every prime-counting, PNT,
zero-density, correlation and Roth cutoff used by each route. Take the maximum
of the finitely many thresholds which its proof needs. No ineffective Siegel
constant or rational-point height bound can enter the prime-exponent threshold.
The existential Lean statement of `k_0` expresses its logical conclusion;
computability is an additional mathematical obligation in the theorem above.

## References

- **[BS20]** Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*, Annals of Mathematics 191 (2020), no. 2, 355–392, DOI [10.4007/annals.2020.191.2.2](https://doi.org/10.4007/annals.2020.191.2.2). [Publisher text](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Section 12 contains Andrew Granville’s addendum, pp. 386–388. All page references above are printed pages in this published version.
- **[DG95]** Henri Darmon and Andrew Granville, *On the equations z^m = F(x,y) and Ax^p + By^q = Cz^r*, Bulletin of the London Mathematical Society 27 (1995), 513–543. [Author-hosted scan](https://www.math.mcgill.ca/darmon/pub/Articles/Research/12.Granville/pub12.pdf). The fixed-exponent application uses Corollary 2.1 and its proof, pp. 520–521, including the index normalization stated above.

The general modular and analytic inputs above retain the hypotheses and numerical ranges of the cited source sections and their references.

- **Kraus1997.** Alain Kraus, *Majorations effectives pour l’équation de Fermat généralisée*, Canadian J. Math. 49 (1997), 1139–1161, §3.1, Théorème 4, p. 1144, DOI 10.4153/CJM-1997-056-2.
- **Lemos2017v2.** Pedro Lemos, *Serre’s uniformity conjecture for elliptic curves with rational cyclic isogenies*, arXiv:1702.01985v2, Theorem 1.1, p. 2. This locator refers to that preprint version.
- **Faltings1983.** Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, Invent. Math. 73 (1983), §6, Satz 7, p. 365.
- **ErdosSelfridge1975.** Paul Erdős and John L. Selfridge, *The product of consecutive integers is never a power*, Illinois J. Math. 19 (1975), Theorems 1–2, §1 Lemmas 1–2, §2 Lemma 3 and (13)–(20), §3 (21)–(23), pp. 292–300.
- **Martin2003v1.** Greg Martin, *Dimensions of the spaces of cusp forms and newforms on Γ₀(N) and Γ₁(N)*, arXiv:math/0306128v1, Theorem 2; published in J. Number Theory 112 (2005).
- **Mazur1978.** Barry Mazur, *Rational isogenies of prime degree*, Invent. Math. 44 (1978), rational-isogeny classification (uncertified primary text).
- **IwaniecKowalski2004.** Henryk Iwaniec and Emmanuel Kowalski, *Analytic Number Theory* (2004), Theorems 5.26–5.28, 12.13 and Proposition 5.25.
- **BMOR2018v3.** Michael A. Bennett, Greg Martin, Kevin O’Bryant and Andrew Rechnitzer, *Explicit bounds for primes in arithmetic progressions*, arXiv:1802.00085v3, Proposition 1.11; published in Illinois J. Math. 62 (2018).
- **Schoenfeld1976.** Lowell Schoenfeld, *Sharper bounds for the Chebyshev functions θ(x) and ψ(x). II*, Math. Comp. 30 (1976), Theorems 6*, 7 and bounds (5.3*)–(5.4*).
- **RamareRumely1996.** Olivier Ramaré and Robert Rumely, *Primes in arithmetic progressions*, Math. Comp. 65 (1996), Theorem 1 and the modulus-eight bounds, pp. 397–425.
- **RosserSchoenfeld1962.** J. Barkley Rosser and Lowell Schoenfeld, *Approximate formulas for some functions of prime numbers*, Illinois J. Math. 6 (1962), Theorems 1, 5, 6.
- **Tenenbaum1995.** Gérald Tenenbaum, *Introduction to Analytic and Probabilistic Number Theory* (1995), Theorems 5, 9 and following remark, as located in BS20, pp. 365, 384.
- **RahmanRoth.** Mustazee Rahman, *Roth’s theorem on 3-term arithmetic progressions*, as quoted in BS20, §9, equation (36), p. 381.
- **Bombieri1987.** Enrico Bombieri, *Le grand crible dans la théorie analytique des nombres*, Astérisque 18 (1987 reprint), discussion after Théorème 14.
- **Platt2013v1.** David J. Platt, *Numerical computations concerning the GRH*, arXiv:1305.3087v1, Abstract, p. 1; published in Math. Comp. 85 (2016). The required consequence is a supplier gap, not a computation target here.
